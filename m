Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 329B9D28861
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 21:49:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2FA10E7CE;
	Thu, 15 Jan 2026 20:49:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WRmGzlVM";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kelC/F6G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B10810E1C4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 20:49:40 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFY9F82673513
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 20:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=THQFNIkFF3/t/NDKgOjpetPz
 WnPIDkihaT7sa0eZps4=; b=WRmGzlVM+uUghOVU4tiq16Yd7CkPTrD8BiGmPC0+
 Djv9x6RlWhQVp1X0FwN19BSbWOEwthQq2C+0/2WsVeb91WE20RE1TbrYtayEiXxy
 5JmdbH0Awngc1LRAVxgIKKmVlUG0wzpijOxjyDeIyReiEyJLzLyllM/F9HE606+x
 ZvYS1AQDm+/S4VyuRy2gv7l8KdI9amBvOQG9SKbm0ZcbM5Kcz68yYhRhvWGkSDuH
 /1dWdPjg3zEFkknurbv+qH8KqSx7AIaJnY4q4ABCOxzwCzSV9Ory6I6Tt/yxe+CH
 UvMOjNls0VorwqDEYZfdIXzpOh9oH+Kxwhr9thhNpmktpw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpyduhjna-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 20:49:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c52dcf85b2so518666285a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 12:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768510179; x=1769114979;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=THQFNIkFF3/t/NDKgOjpetPzWnPIDkihaT7sa0eZps4=;
 b=kelC/F6GXrTzIJpPNTerKqmmucEOlyPJBZn8tDb4mfu/E55tOUZIeUMJjDNr1ngqha
 JS7gss+6QSVKbZBYfp8AnniIXd2/RBBOTnVpunNoKwLCJ66QXty56XrQ305yVPuYGd0O
 zj/KmJB7HBPmF8vZuD4lsQQRUX9E8GbINNLeb4WlQhwQ8sys5JozEzkHgSh74D4J3PQp
 VIjxusKtPjdklnd/e5NXKt440IrdW7gECeZJF/J4VxdIg3/cMom0GcyOXszTViGF6kqN
 87/WUxubg0gGcRcXmNjVEc86SNzmQXQdN3d0SjUgPz0WMf069dWzWSaRdAAXCN1mYy4r
 JKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768510179; x=1769114979;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=THQFNIkFF3/t/NDKgOjpetPzWnPIDkihaT7sa0eZps4=;
 b=nV+pS93OEk+KhXDjd6g25zZuHhnJ9CPexQawKm4K5bMNnwUYkqf8KerQ4VF9JVJS+H
 wLD8bgOD2W9Aq8M0Dg7O+rYzEyoMQ4xYSN9w9XODT+Isz9xAxygFvZpurS5Kq/OKxM0p
 WI2eZ5BBT9Jxq153sxRchBVJqUOcuUhxtRhqNjdMxDNiytb9IMCQGmW8q/iysGLvmAFT
 mnZ6+UIlyOnUNbT1UlrJDwnpQlcAtCrB7fnWeKZaRJh90fMGPHS3MS+nX30uC2h0yhS9
 NeR6dxH5xlUM2dB6x7RfVWXmsNovnsXnGUhY8o9WqxFQ5EOovW2nhQ0n9iJnBte3Cvbu
 GvAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHJVaoUJs/SLxR9ICBUK3mBYuFAK9bwVSqQsJAEgtzrZta6lUuraKUmqoAHH4IeMX6z724N1mLJEQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzA7umMumU5NbxwdCqOabnJHpg0Afc84fqnlxdNq+myKORTmm4V
 lE/OfyZkhHNoUP//dAgT5vN7i35pUig0W9VTi5x0qx1m74ykAVgEBlkSCLrsCFT6r/oUOIpTVIy
 IQuxAmLv8k91xpzv08NddKPT8IAaVrhpo4DU/pmlbuuyC5eeg9UkUVlTl9j5OIN+SfR84g24=
X-Gm-Gg: AY/fxX5I9Mwf9NpXaC4az+tyu73cAOSkU4GiM/zITOXGLJ8Xb4Ajryh0P+5jOezcdCF
 V0Foy3CPaf2y5RecY0J/OoD8twvhuj0q28zg+N7oJUWq0z/8bOoHvVz6zDHRQA+6NkbS+xeUWjh
 jP303pfF8j9fRNEa40OLRjXtJWOFBmpOPAC7GZLuaMJW+2scFPb9/EdPRZSZfEPgRu5CAYq9U2n
 pTRXioAk/5ckAUqJQHc2Vdf8KlFU1YP8U0vgAlw/SDL7UUbtzD8aE6LnWAfHqVSP8uv+W/osInr
 kDSoiOKE3NzGbnouL1xZRXnO+ZUcljP4516+3zLUgmlTEBXW2W/Z249WN6ybXgwslnKLNvxYvq+
 6OeDW7s+FbQfF7/qL9n72G8PuENrRBOw5CdjdY11wKh3YoX8MPAbjHtSJoet7b9v2lhZHcxEXfO
 7kpcSywhx6+3ODLartEYRfeNg=
X-Received: by 2002:a05:620a:46a6:b0:8b2:dcea:fc78 with SMTP id
 af79cd13be357-8c6a68d3711mr108034485a.16.1768510179044; 
 Thu, 15 Jan 2026 12:49:39 -0800 (PST)
X-Received: by 2002:a05:620a:46a6:b0:8b2:dcea:fc78 with SMTP id
 af79cd13be357-8c6a68d3711mr108031085a.16.1768510178524; 
 Thu, 15 Jan 2026 12:49:38 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf39776dsm142269e87.46.2026.01.15.12.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 12:49:37 -0800 (PST)
Date: Thu, 15 Jan 2026 22:49:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
 thierry.escande@linaro.org, abelvesa@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, ekansh.gupta@oss.qualcomm.com
Subject: Re: [PATCH v2 4/4] misc: fastrpc: Allocate entire reserved memory
 for Audio PD in probe
Message-ID: <ewiz36hwffy4egxpm7z3icvk4vd4fp7ktnny2vyiuzcsmzft5x@nsfvnpip26nd>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-5-jianping.li@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115082851.570-5-jianping.li@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2MyBTYWx0ZWRfX6tKkt/NeUO4t
 GQ46MRcpp5vbU2zJVKL+ZNrNG61UtfA/Tca1euClin/yvmp9X+nP5KMQ2xUWf/WRIiuERkjB1kd
 IZLN8LCkHKAo88OIJptoyJBB+v+ABaui9cica4HtfNxos7dhxk5p0c9kZAXtJk8KZIKKuoomBhx
 hatNLBOzV1/ygLTnHufiIBRA69I246wKzjIeHym30NSltMh0xAG8+kPtG9UK1JSk3KDCYwPEnO1
 AtTnMAzUNQ+qRDfudm6u67GsvQy+wL+PATY6qur1pR8MjIlah9mBBubx+FwCP5Sl7tSnpzwDEId
 kLhF/ZB/8HfZQzQPubbXumwkyoOKJZ+BkiyZmEaFkRxG0BCJD6jYau28KBeASIdy2ClmBfApl11
 coQd9p481xSx+ldvs+g/M9AaiohkRjYq8IBgZ7/YOQdoRCEuwxFveXVsfmDOos7I/Ht6QTYkXCW
 ISdWsxSvp2gxDdV/w3g==
X-Proofpoint-ORIG-GUID: wRJzwQuzn_dR86DhqjaWoHU0b51ABUvt
X-Authority-Analysis: v=2.4 cv=NafrFmD4 c=1 sm=1 tr=0 ts=696952e3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kNrQIcF38_EFy8roB68A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: wRJzwQuzn_dR86DhqjaWoHU0b51ABUvt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150163
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 15, 2026 at 04:28:51PM +0800, Jianping Li wrote:
> The entire reserved-memory region is now assigned to DSP VMIDs during
> channel setup and stored in cctx->remote_heap. Memory is reclaimed in
> rpmsg_remove by revoking DSP permissions and freeing the buffer, tying
> heap lifecycle to the rpmsg channel.

Why?

> 
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 95 ++++++++++++++++++++----------------------
>  1 file changed, 45 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 833c265add5e..f9edca7a8de1 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -278,6 +278,8 @@ struct fastrpc_channel_ctx {
>  	struct kref refcount;
>  	/* Flag if dsp attributes are cached */
>  	bool valid_attributes;
> +	/* Flag if audio PD init mem was allocated */
> +	bool audio_init_mem;
>  	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
>  	struct fastrpc_device *secure_fdevice;
>  	struct fastrpc_device *fdevice;
> @@ -1304,7 +1306,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	struct fastrpc_phy_page pages[1];
>  	char *name;
>  	int err;
> -	bool scm_done = false;
>  	struct {
>  		int client_id;
>  		u32 namelen;
> @@ -1334,31 +1335,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	inbuf.client_id = fl->client_id;
>  	inbuf.namelen = init.namelen;
>  	inbuf.pageslen = 0;
> -	if (!fl->cctx->remote_heap) {
> -		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
> -						&fl->cctx->remote_heap);
> -		if (err)
> -			goto err_name;
> -
> -		/* Map if we have any heap VMIDs associated with this ADSP Static Process. */
> -		if (fl->cctx->vmcount) {
> -			u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
> -
> -			err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
> -							(u64)fl->cctx->remote_heap->size,
> -							&src_perms,
> -							fl->cctx->vmperms, fl->cctx->vmcount);
> -			if (err) {
> -				dev_err(fl->sctx->dev,
> -					"Failed to assign memory with dma_addr %pad size 0x%llx err %d\n",
> -					&fl->cctx->remote_heap->dma_addr,
> -					fl->cctx->remote_heap->size, err);
> -				goto err_map;
> -			}
> -			scm_done = true;
> -			inbuf.pageslen = 1;
> -		}
> -	}
>  
>  	fl->pd = USER_PD;
>  
> @@ -1370,8 +1346,15 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	args[1].length = inbuf.namelen;
>  	args[1].fd = -1;
>  
> -	pages[0].addr = fl->cctx->remote_heap->dma_addr;
> -	pages[0].size = fl->cctx->remote_heap->size;
> +	if (!fl->cctx->audio_init_mem) {
> +		pages[0].addr = fl->cctx->remote_heap->dma_addr;
> +		pages[0].size = fl->cctx->remote_heap->size;

Do we need a flag? Can't we assume that remote_heap is always to be
allocated to the PD?

> +		fl->cctx->audio_init_mem = true;
> +		inbuf.pageslen = 1;
> +	} else {
> +		pages[0].addr = 0;
> +		pages[0].size = 0;
> +	}
>  
>  	args[2].ptr = (u64)(uintptr_t) pages;
>  	args[2].length = sizeof(*pages);
> @@ -1389,26 +1372,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  
>  	return 0;
>  err_invoke:
> -	if (fl->cctx->vmcount && scm_done) {
> -		u64 src_perms = 0;
> -		struct qcom_scm_vmperm dst_perms;
> -		u32 i;
> -
> -		for (i = 0; i < fl->cctx->vmcount; i++)
> -			src_perms |= BIT(fl->cctx->vmperms[i].vmid);
> -
> -		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
> -		dst_perms.perm = QCOM_SCM_PERM_RWX;
> -		err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
> -						(u64)fl->cctx->remote_heap->size,
> -						&src_perms, &dst_perms, 1);
> -		if (err)
> -			dev_err(fl->sctx->dev, "Failed to assign memory dma_addr %pad size 0x%llx err %d\n",
> -				&fl->cctx->remote_heap->dma_addr, fl->cctx->remote_heap->size, err);
> -	}
> -err_map:
> -	fastrpc_buf_free(fl->cctx->remote_heap);
> -err_name:
> +	fl->cctx->audio_init_mem = false;
>  	kfree(name);
>  err:
>  	kfree(args);
> @@ -2396,7 +2360,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		}
>  	}
>  
> -	if (domain_id == SDSP_DOMAIN_ID) {
> +	if (domain_id == SDSP_DOMAIN_ID || domain_id == ADSP_DOMAIN_ID) {
>  		struct resource res;
>  		u64 src_perms;
>  
> @@ -2408,6 +2372,15 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  				    data->vmperms, data->vmcount);
>  		}
>  
> +		if (domain_id == ADSP_DOMAIN_ID) {
> +			data->remote_heap =
> +				kzalloc(sizeof(*data->remote_heap), GFP_KERNEL);
> +			if (!data->remote_heap)
> +				return -ENOMEM;
> +
> +			data->remote_heap->dma_addr = res.start;
> +			data->remote_heap->size = resource_size(&res);
> +		}
>  	}
>  
>  	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
> @@ -2488,10 +2461,13 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>  	struct fastrpc_buf *buf, *b;
>  	struct fastrpc_user *user;
>  	unsigned long flags;
> +	bool skip_free = false;
> +	int err;
>  
>  	/* No invocations past this point */
>  	spin_lock_irqsave(&cctx->lock, flags);
>  	cctx->rpdev = NULL;
> +	cctx->audio_init_mem = false;
>  	list_for_each_entry(user, &cctx->users, user)
>  		fastrpc_notify_users(user);
>  	spin_unlock_irqrestore(&cctx->lock, flags);
> @@ -2505,7 +2481,26 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>  	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
>  		list_del(&buf->node);
>  
> -	fastrpc_buf_free(cctx->remote_heap);
> +	if (cctx->remote_heap) {
> +		if (cctx->vmcount) {
> +			u64 src_perms = 0;
> +			struct qcom_scm_vmperm dst_perms;
> +
> +			for (u32 i = 0; i < cctx->vmcount; i++)
> +				src_perms |= BIT(cctx->vmperms[i].vmid);
> +
> +			dst_perms.vmid = QCOM_SCM_VMID_HLOS;
> +			dst_perms.perm = QCOM_SCM_PERM_RWX;
> +
> +			err = qcom_scm_assign_mem(cctx->remote_heap->dma_addr,
> +						  cctx->remote_heap->size,
> +						  &src_perms, &dst_perms, 1);
> +			if (err)
> +				skip_free = true;
> +		}
> +		if (!skip_free)
> +			fastrpc_buf_free(cctx->remote_heap);
> +	}
>  
>  	of_platform_depopulate(&rpdev->dev);
>  
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
