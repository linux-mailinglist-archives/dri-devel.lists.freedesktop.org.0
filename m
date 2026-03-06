Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMTMOaAgq2mPaAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 19:44:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B8C226D08
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 19:44:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5366610E3DC;
	Fri,  6 Mar 2026 18:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ghg6QXlt";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RrMRfHJE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABA010EDDB
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 18:44:44 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626H1eOn238569
 for <dri-devel@lists.freedesktop.org>; Fri, 6 Mar 2026 18:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=SXae7MF+NIlWmWbGFuu3hxNp
 9S8gG79FuDF7b6zR9E0=; b=ghg6QXltSswHtys4mqfAEN0j9y9i4HsJMCMviBMF
 XvCwYabylbVbYDui+oVkO3Cs0uGxcbFQjhsnAtORzbCtCcP370ydqywejawNsWlO
 npaBaKrxz8QZgsVBdsE47i1VY0SRqDkHmwIQnHSVmnSay69bmNhAiejyf6eG+qO9
 cVF3VPWZzIpYyI8FAX7yvhDbmpHY6+35Tyr4xFVQDz9b1kOi20gV7D7K55yqzCxc
 YfmfmLKUTOgeaZ1LcigfshIjAlQnacq5bygeScBqKQaDoaPU3RGlR4Z9crWOE/V8
 QGKholIzgA3Pk5ZAk8Op03Bl8yBIcXatuXMlqUbhw+a6fw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv98ht1f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 18:44:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-506549eb4b7so681111241cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 10:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772822683; x=1773427483;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SXae7MF+NIlWmWbGFuu3hxNp9S8gG79FuDF7b6zR9E0=;
 b=RrMRfHJEE4AigAPI+IYHoedsyNZIQOvceqU6G8XMNDczsCnklFozMMSoWflNgdRphI
 3Al8y1maDpnmOHWyHGb0LZctB7YKKSRPiDiVANY90OtsJy8dM6uTMcqGsYlmkYeu1hYF
 2HyO4YN24ZOoWdYIuwAfvXIVqXYaGi3m3Hz5Vo9DBuGhJeFMJ2e/fmC0tw5fhD8qoppX
 1gwnoXw7YMAuAUld2DY/kAyT2Q8rU5C4KqtQXajhNtMaTs2Hwo9VG2KUOJ9fxQsSD/t/
 jRfeQnD27C5MQdsAYXEeggBHKkc23HfGMjLAC/JkBvupdH1r4Q7eGP2sOnYc4gUMjqom
 qnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772822683; x=1773427483;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SXae7MF+NIlWmWbGFuu3hxNp9S8gG79FuDF7b6zR9E0=;
 b=BOfWn7+BXrPzuTlS3SA7wQkfFgaKm+b8KlJuC735fP4vsTkpqgP2WPtekNUjOW0BHz
 hn4qdRcQ7YNSyIqS9iQLsJxzL0Mwu31KWs/eXBNi1mebzmYfbeagsCaxL1tWSiD1z966
 Ve9CZpsUH4aPkjB85nN+/2angNRa542Ll0Yrv2O9dQA7Kz0tFscg4ny2AqJms2QBwW5V
 X94mtZzUFiDrNI7M1HONU9usuHGa/OxZ+t0fmG7lf9lKMVUGMhpJpJYMSl1LZ4Cqajjb
 +uKqYdpXdq4W1XalGweWPf6ffQhIwXWDmoAGJki07XhwuKMFQiKOWYFnEG1D1DCDVjnH
 bSlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbfztvmgSv7qpHgTbFGqicp2JnGVB34hNV6W4nC5zbeUCUzjAxcp7iW2uwyQbxU/oHcJaSxQXdeDE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcOXu98rxoDO8xWCL2zrZIbVEMwCTIQbQP77Da/IA6g9VY/+5q
 oSUAEJtfclr1kLVGikPq87kIwX3GffJOSaUqhoccvWPLPLetG3PU/XLMImhxbfvLnfFSp9KaZe5
 ObV+8Au+cyDwrc36wsJnctW0kYkrJl1Vw/VRefWvp7602tKJvwe2zectpfkwsTDcqLRiQ200=
X-Gm-Gg: ATEYQzw7iFGntYaGeACtWuqD1WoSKCqXh01jDW1Tq5j5zVfpI9Fs1O0dqhJLFaGfks4
 WVth1qldWgUxrzcRTx5HAfdw6SIfLhVaDF5gkVDwlQtb3qCpl5n0WGgfzWQIGn7iYlJ4doGz5Dk
 VDiyibWZroOd6VajVZun5C4Qc3R5rgURi7KKzut1uhNMDzqERB7scCdTIPAQKFxj8ld//9pT/2S
 +aXVLJCdGysSBZbWAefD7afKmypYjFI5fMzOCTAkDLVpl2W0x4bd7jh3R4CODG+LKJzDmn4JkEM
 DUfAM2ZraWgf14ABleE4QOdjX2WSInfbXCvo2lKLHXrlVCfZr8cN/8t1AdDUSsxgw+hdNbwjG2C
 9V8KnLsL4Pws/QQFOFLO8oEdTn0xDJtGHj+J6enabCyFTTbnUXMs7TD7p7KyyZn45/ZJ3lhIZcj
 QglkApBuGWMO4cNxphRl91xSY64cJ2a2yhTqM=
X-Received: by 2002:a05:620a:4588:b0:8c7:6f8:ae4c with SMTP id
 af79cd13be357-8cd6d428b2fmr400723685a.43.1772822682784; 
 Fri, 06 Mar 2026 10:44:42 -0800 (PST)
X-Received: by 2002:a05:620a:4588:b0:8c7:6f8:ae4c with SMTP id
 af79cd13be357-8cd6d428b2fmr400720285a.43.1772822682063; 
 Fri, 06 Mar 2026 10:44:42 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13d08603dsm491467e87.68.2026.03.06.10.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 10:44:41 -0800 (PST)
Date: Fri, 6 Mar 2026 20:44:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: setup RC model properly
Message-ID: <n4ytt6euoeh5igk7a4rn4zawpr4psckahc76375ls7a4qqcty5@7bxj7otyuevw>
References: <20260306092553.37973-1-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306092553.37973-1-mitltlatltl@gmail.com>
X-Proofpoint-GUID: EhLoL6vlmCClTf3anFM14R2XNQXp9ZgL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE3NiBTYWx0ZWRfX9mYReW5q4Qqs
 l91mYPdBDZKV4WYayIm1vgD8V3jm2pSLdWlzOcqaN0miIqCSYlVzNv075j/9LpDVKM6pl4zjJQ/
 G4+CW6qsx6ZgGmObl34vB9oWDP2vxJN9l8ihdHy+DOMnmtXaHEmqHisrEFbtesf8WlmugcbuNtr
 9zDb2ZOlsLXV6GXYMPidPnITsxdS6tX78ScAAma9D8TCLFaGXE7pDN5sncClhgt3J/hAq0+qenX
 ceVJmUOJ4w61f4vCSkmU7SaG1AffZJ67hHRPw04jD0zuPe9uR7hRbff9Deddkz9TKRd2fHY+kov
 hRyoymUC5zhoXxd0c3ZSgNyU1Gt7xlQ5QBFU1iYaAL1Y1FdZ/xQxIsx9GinQJwBu6EUR74TELEt
 Lk/C3q/PjtGOV/CL7jNI+FH5BNMsqDi9H/KGsC5Tf9WNgLHgnfVH1PDLzAXfnIiDlrK24yWmjHF
 bKnMlA7GO8ig91I4OiA==
X-Authority-Analysis: v=2.4 cv=LbcxKzfi c=1 sm=1 tr=0 ts=69ab209b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=-UYvGVBEh1dpRB4KFAcA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: EhLoL6vlmCClTf3anFM14R2XNQXp9ZgL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060176
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
X-Rspamd-Queue-Id: 56B8C226D08
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:dkim]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 05:25:53PM +0800, Pengyu Luo wrote:
> Using incorrect parameters does not seem to affect the display, but we
> should use the correct in accordance with the DSC 1.1 or 1.2.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 31 +++++++++++++++++++++++++++---
>  1 file changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index b60b26ddb0..276c63d2ac 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1843,10 +1843,35 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
>  	drm_dsc_set_const_params(dsc);
>  	drm_dsc_set_rc_buf_thresh(dsc);
>  
> -	/* DPU supports only pre-SCR panels */
> -	ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR);
> +	if (dsc->dsc_version_major != 1) {
> +		DRM_DEV_ERROR(&msm_host->pdev->dev, "Unsupported DSC version: %x.%x\n",
> +			      dsc->dsc_version_major, dsc->dsc_version_minor);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	switch (dsc->dsc_version_minor) {
> +	case 1:
> +		/*
> +		 * For DSC1.1. the upstream lacks SCR parameters, the downstream
> +		 * parameters are unverified here, we support pre-SCR only.

It doesn't. It's the same as DRM_DSC_1_2_444. Please send a patch adding
the comment.

> +		 */
> +		ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR);
> +		break;
> +	case 2:
> +		if (dsc->native_422)
> +			ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_2_422);
> +		else if (dsc->native_420)
> +			ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_2_420);
> +		else

It's not that we support 422/420 output... But yes, it's easier to fix
it now.

> +			ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_2_444);
> +		break;
> +	default:
> +		ret = -EOPNOTSUPP;
> +	}
> +
>  	if (ret) {
> -		DRM_DEV_ERROR(&msm_host->pdev->dev, "could not find DSC RC parameters\n");
> +		DRM_DEV_ERROR(&msm_host->pdev->dev, "could not find DSC RC parameters for DSC version: %x.%x\n",
> +			      dsc->dsc_version_major, dsc->dsc_version_minor);
>  		return ret;
>  	}
>  
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
