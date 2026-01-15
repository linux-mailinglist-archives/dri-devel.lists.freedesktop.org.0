Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4E0D2883B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 21:47:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323FD10E077;
	Thu, 15 Jan 2026 20:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MDP7SMiG";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j10QShcQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17AB310E077
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 20:47:50 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFY69H347689
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 20:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=cbiiDqRxX13mvXK+93g6nKvB
 vyrNQWBszX0XaVYe+gM=; b=MDP7SMiGdnmMHf9qdutEg9VSjD2sH7usblrHpm/R
 2Tew8iGBLqmrPf7Hetb4ZMWm+zLn+DzWJ5TUxFY9Hw2Y7B7PagC1RcL0SR8Bg+ky
 aCf/uWSYUx0gpOHXLTw+FCaENq/V9Sqa6NlwgDKwclDXF1ipJ2uZaNxfRlR4rCYy
 YJz6wDbZcq8wasWSsYDhuE/M5CPJ4ofmrm2TJ2jp73U0AxhUlKhdbaNeNXCUlPUK
 MFasCba3SgZdyif8tp1PXQoK6xd787ijDt0p8rbhs1FBm8cULjKK2rtXMJ18BN9Q
 +IVBY+av/TheAEJWLFZaDQPO3JBSemE8h21vdcO0gCyhkw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpy07ssj7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 20:47:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5014d8b3ae0so31861521cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 12:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768510068; x=1769114868;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cbiiDqRxX13mvXK+93g6nKvBvyrNQWBszX0XaVYe+gM=;
 b=j10QShcQVCuu6PB0hte3ghJYR7C+jWq3VdZ19vXdH9j4uikaI7xjwNdGvmmc9YNmk+
 8PIFj3ZdUMHMkHAq0uFUII/2+L8rp/ybkHSEw7sP2BxS4l/rweOYcnVLHO0EqVrT7W4n
 Qxuua+js3R1iwAyZsTEmGKXTk/BEW30QRMPS01FyxSO+DMq0RjuhA2WJ+MEr818Yr5v5
 dOK3lCIGZyogk6VKgA8elXk72LGoxVulzeSwXAKhxtMJ1h5N9SEEXY6yMIWcjyIyFuwj
 2l1z8izPP+o/pzxrfCnZf2tcMYLbjkoyYoSZzYq+pVFrgzsWK5GjRJxOnuT6XiC5UW2c
 rUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768510068; x=1769114868;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cbiiDqRxX13mvXK+93g6nKvBvyrNQWBszX0XaVYe+gM=;
 b=eKGXNI8g0UGWto4evisF2FNBEtizYSJqEN5hztwzZoUC9nqrEvoagtedtv1Ky+EhTF
 ztND+i8MHSAgvyaodmt6cv76R9Lz3G39dVC6LyDJwu3a0SQklRCotp3dd91lA7JzTusS
 I4YJTqMK0oFDiN7r7E6ZZ4Rv0sKQnwOiXnBcS73CaS7itoGzFLJQhosZFQf/P8MEeIIv
 j/wfcRWQuQ5NmlsNpO0LPQ6iugb21Goons24/UUoHPf9qvNxlkGKhc47VZym7fCv4Zz7
 LcYfNKUvOQa0LQWpgUdG9pL/BRfZ2JDGNz2tUoRz1cMH4demV1Y0SG6yQwmRQool6NRO
 SnJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWRZQZuKJ7PAkLrtpARIxFubQwWgC8Vs6oUEMGjERcis3YqOgLdrnzoPGSvP0b2hfafhvFAPIpr0M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHG3U1xgkoUduIEYH9Y/XMvCoFzODksihsD9+foks3e74BZwGE
 j4SCuobQwt6Pp7cGL3qMxgjFYbikA2uJUgIdVWOcqg3WrjQjEq+br6l7BV89eFU+wHRvH2jruXh
 y1lNHekNYwepn1MrjAgjAyeBFbaHcXitB4xIa94P+P6m9I1xAMLcRfxswnUo0BF+fI1vD/mo=
X-Gm-Gg: AY/fxX69mOgMl9sRqphjUxMz4j6jT1FE9cj8A0IV0QzkxXTRqPEQ6yNu8gP2R8wsP5g
 qft9YDhAy0JFodXNjFdbv1gG1ncO/pnI4nA0WK0KRIir8d17rZDn9oP1e1IGdoO4BfteorsAzgG
 mHdJ1gjinlZ3Gcmqw1mwJRYjCPLy21ousKVK3DZvF/epMAFP6FrQSDnIfmO4lHxEo7LbfEDyMMC
 1er64tiRyop1La1Pwwa57ndP5r4NSUAwHKgux6yA+rnm2KXhA+7I2625hyS5P/FXrKyEaaV4V8J
 A6tFaJYACR6vVv0qkDlCTLVEcU+uP9bc+64ba72g/ErSlT8IhSiQUQy5j73Og8zcVKQAp8QF9Uq
 wwlg2MgT7dhGXlMP46ByU7y9p2M7LcKpCx9vs8Qi8ML8FPHmFyu068gUmuYnk2ztDEILTKRiaEy
 EGmvEbn2y7U9RtDTpwAuppY0o=
X-Received: by 2002:a05:620a:318c:b0:8c5:2e1b:791d with SMTP id
 af79cd13be357-8c6a66f8e17mr114954685a.31.1768510068338; 
 Thu, 15 Jan 2026 12:47:48 -0800 (PST)
X-Received: by 2002:a05:620a:318c:b0:8c5:2e1b:791d with SMTP id
 af79cd13be357-8c6a66f8e17mr114951285a.31.1768510067880; 
 Thu, 15 Jan 2026 12:47:47 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf39c40esm139824e87.75.2026.01.15.12.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 12:47:47 -0800 (PST)
Date: Thu, 15 Jan 2026 22:47:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 thierry.escande@linaro.org, abelvesa@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, stable@kernel.org
Subject: Re: [PATCH v2 3/4] misc: fastrpc: Remove buffer from list prior to
 unmap operation
Message-ID: <3p4quidza7rwxng74fxcfoflo62tgakl7hummwsqmisaqmkwwp@nae55u2ehza4>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-4-jianping.li@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115082851.570-4-jianping.li@oss.qualcomm.com>
X-Proofpoint-GUID: YIcVTK7tryYrzzdXsMnst1Tb0X4jjOyZ
X-Authority-Analysis: v=2.4 cv=fMw0HJae c=1 sm=1 tr=0 ts=69695275 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=UJ1zFB7r74I_tpvr3eIA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: YIcVTK7tryYrzzdXsMnst1Tb0X4jjOyZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2MyBTYWx0ZWRfX3lKE/9A6Ic2X
 tDHaApa6cGuEVI2ViIivD/vAaiVLDs/0y77jrUHNKXaELcOSDGFQlV08iIl5xu3toj9QjOnWRkZ
 6EvcLUDOZtUn9VFAkdN7DzD9CQk6fCyg88POc3iB7TOqRhExLq0KhdDNUf4tfBPQNPJURFrZ9ml
 JgpiGB91FroWCHzTII9enx5J3zsdoOqaNo+GWdfE9YZ8cTDDkVgQeDkgS2TzLBRUGaskCcGBkmt
 KgdWfxc7DIWZrFypbhYj8iSCZXkFnw/14QIJlESHSY2Vwe6FMOY4qZHHNPDaQKamDwa2IGqHcSb
 +GJ8yt3Zua+kjOqBuWRnfxo8BwUAMnJaYmOTmILxoS/JSANvw+w7FlmwmyAwDd/n/4fhke07oWA
 wgbtibouWGH+vTsoVijKkrbe4pAsfYwVlxSSZiEr4ngnz3scP/JFv4uw94Or2GQZihG7yLL8qYT
 KGA2RTD3Hsr+xlU4l/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
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

On Thu, Jan 15, 2026 at 04:28:50PM +0800, Jianping Li wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
> getting removed from the list after it is unmapped from DSP. This can
> create potential race conditions if any other thread removes the entry
> from list while unmap operation is ongoing. Remove the entry before
> calling unmap operation.
> 
> Fixes: 2419e55e532de ("misc: fastrpc: add mmap/unmap support")
> Cc: stable@kernel.org
> Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 28 ++++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 4f12fa5a05aa..833c265add5e 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -202,6 +202,8 @@ struct fastrpc_buf {
>  	/* mmap support */
>  	struct list_head node; /* list of user requested mmaps */
>  	uintptr_t raddr;
> +	/* Lock for buf->node */
> +	spinlock_t *list_lock;

Why do you need to lock this? Isn't fl->lock enough?

>  };
>  
>  struct fastrpc_dma_buf_attachment {
> @@ -441,6 +443,7 @@ static int __fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>  	buf->size = size;
>  	buf->dev = dev;
>  	buf->raddr = 0;
> +	buf->list_lock = &fl->lock;
>  
>  	buf->virt = dma_alloc_coherent(dev, buf->size, &buf->dma_addr,
>  				       GFP_KERNEL);
> @@ -1865,9 +1868,6 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>  				      &args[0]);
>  	if (!err) {
>  		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
> -		spin_lock(&fl->lock);
> -		list_del(&buf->node);
> -		spin_unlock(&fl->lock);
>  		fastrpc_buf_free(buf);
>  	} else {
>  		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
> @@ -1881,6 +1881,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>  	struct fastrpc_buf *buf = NULL, *iter, *b;
>  	struct fastrpc_req_munmap req;
>  	struct device *dev = fl->sctx->dev;
> +	int err;
>  
>  	if (copy_from_user(&req, argp, sizeof(req)))
>  		return -EFAULT;
> @@ -1888,6 +1889,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>  	spin_lock(&fl->lock);
>  	list_for_each_entry_safe(iter, b, &fl->mmaps, node) {
>  		if ((iter->raddr == req.vaddrout) && (iter->size == req.size)) {
> +			list_del(&iter->node);
>  			buf = iter;
>  			break;
>  		}
> @@ -1900,7 +1902,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>  		return -EINVAL;
>  	}
>  
> -	return fastrpc_req_munmap_impl(fl, buf);
> +	err = fastrpc_req_munmap_impl(fl, buf);
> +	if (err) {
> +		spin_lock(buf->list_lock);
> +		list_add_tail(&buf->node, &fl->mmaps);
> +		spin_unlock(buf->list_lock);
> +	}
> +
> +	return err;
>  }
>  
>  static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
> @@ -1985,20 +1994,23 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  		}
>  	}
>  
> -	spin_lock(&fl->lock);
> +	spin_lock(buf->list_lock);
>  	list_add_tail(&buf->node, &fl->mmaps);
> -	spin_unlock(&fl->lock);
> +	spin_unlock(buf->list_lock);
>  
>  	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
>  		err = -EFAULT;
> -		goto err_assign;
> +		goto err_copy;
>  	}
>  
>  	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
>  		buf->raddr, buf->size);
>  
>  	return 0;
> -
> +err_copy:
> +	spin_lock(buf->list_lock);
> +	list_del(&buf->node);
> +	spin_unlock(buf->list_lock);
>  err_assign:
>  	fastrpc_req_munmap_impl(fl, buf);
>  
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
