Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C2EB196CC
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 00:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB37510E09E;
	Sun,  3 Aug 2025 22:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OaRD/oh/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2546610E09E
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Aug 2025 22:52:06 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573MghBW005456
 for <dri-devel@lists.freedesktop.org>; Sun, 3 Aug 2025 22:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=JD1bWaVWQaMuZIOSsbiapY7v
 x/fSAhiBJj0221w9hng=; b=OaRD/oh/HldFQT+r76ra5glaculHIRvoqG9PEr6+
 s4Fxh4DHfShNFZZ8biLt4GLnpcCp/rrJmWrDUSqKOdPUl7WnIVwOWWiMv/7UUDvF
 Az44Jar1g335SdvaMV9U4mmlwWT63Gtr35pTugXpE+k/hUcYqgltuzZe5LwG0XlN
 5O+C+vuP7QHDF2Nw9tXjXKBYw1niJr/DdKyCnp7y5uPMcPmkRgk9miIJw7X6LSLU
 17C21VshUDkrhQlgpTG1b+8pDf7DICT74JFD+ihleBHInUnKh355FWG6YwfKWfhG
 YKwhOYNwyuDvm+KNddxKjZWw2nHr08KxmM4VHL4VmEWqJA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48a2ke0yhr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Aug 2025 22:52:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4af14c04e5fso49555421cf.0
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Aug 2025 15:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754261524; x=1754866324;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JD1bWaVWQaMuZIOSsbiapY7vx/fSAhiBJj0221w9hng=;
 b=H62cfoNr3gD7DhjWSlKQpTkdodI98mHG98thiHGx/RKI1IEhXn/s+b2n0BlIyAorZw
 qrSq7zeTVj1ok4X5BQDG5QPj1dPrhF27FPcUweJub7kMRqpLH0RQZaDsdaBcwlzKd9ff
 AmX9eX9SHyB5sDanw/gzO/hOEsGeAVHj8YGS1mRavyT9uD2yK9UHrGo5UoDvS12o583s
 9WB8F/oo3F+UtYhKEP0AuhQaKZVmz1UB6YKj0JGmw9uPCqSQfNN0iOrgU11xw2avdHFD
 UqmLbFeAZY3VPLCNusgb506aM9KeNcrdqpXmoODSLC70hIv3taGP9Bij3evaVXImswIQ
 kzeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOpqxG5VIifAW0k2kvni8wuBxcyoPDOzsEBsO5a/gwsVWQBtwpDzYvlCVOlsbwrpcRYw+/hhAj5RA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOqNWy8Ny4UObZgdpkRC9xAke5t0Ez0I4H+OcWDy9imU7QX7Js
 cYESii+askDdAtH78taUhmuxUsbTyOM202qRPb6YOuH9XOPD6DRdGwRUXOyzLxPBaM8lPOSsxDT
 WL7dxT6E1LPfUIA5Dxv0eLftRGhmmD7Xe4ICErc5gv1zpvZgdRvy7WWtXFTZbZY3Jx8bTLwc=
X-Gm-Gg: ASbGncv+VM7WvMCahwkWev12sdURqfEfwqqF8gqxW3vzqyyjjbffSDov/s+AuzXjPmn
 YpZ+OMaqPWc8k2aO11KsFY2Lcp470J9jMUuljNBnjivwywp8RkNcOkEJS9I4jK9C91tEGCNcCUz
 yoa9XiOZ+g+/5fhzZWO6qSwHm67mG61QR2g8zeNcjUKkS+zdhemn5IrLl0yrQw7iA9DRh81SpaY
 EKbAGHLRAH8WFjDso4pQwgGnMnwoOhcZMyO/OQgvqj8khy91Im3BkdGdPri+k1MgdnHgO85j8yK
 9HqgEMaQ9NAjkMt214qyRPSKl9Tzuq7Eh+HTcXgW39M1PzBYiX+zBoiCFG0OGzP/noZnernwYFO
 silWpOP0eUsdFfy6mv6nDef7x2Cp0BeZvtMC9q/N0Y9hIzHm1Xtdu
X-Received: by 2002:a05:622a:c9:b0:4ab:63b9:9bf4 with SMTP id
 d75a77b69052e-4af1097b2d6mr121492641cf.1.1754261523770; 
 Sun, 03 Aug 2025 15:52:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvmz8aawgD/oGBs9k7aFMPr9BApt+fDHkdh79/grIR1SnsbvPVJ9lZL1LZ6ktrMtx82kna6Q==
X-Received: by 2002:a05:622a:c9:b0:4ab:63b9:9bf4 with SMTP id
 d75a77b69052e-4af1097b2d6mr121492451cf.1.1754261523353; 
 Sun, 03 Aug 2025 15:52:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88ca3fb1sm1420184e87.136.2025.08.03.15.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Aug 2025 15:52:02 -0700 (PDT)
Date: Mon, 4 Aug 2025 01:51:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH RESEND] drm: Fix potential null pointer dereference
 issues in drm_managed.c
Message-ID: <mw57szw4mnmpwxj55mvqu4pvjknuh2gmqfy6gko6wicsv2emah@4is7dv2bzx6p>
References: <20250703092819.2535786-1-haoxiang_li2024@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703092819.2535786-1-haoxiang_li2024@163.com>
X-Proofpoint-ORIG-GUID: xgQbXySQjIAYsePyi7InKIBsQNfKlrJa
X-Authority-Analysis: v=2.4 cv=TMNFS0la c=1 sm=1 tr=0 ts=688fe815 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=-n9UYpkImSeQm4xEVYIA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAzMDE1NCBTYWx0ZWRfXzkUu8sJ0Zhc6
 NnlvWg4GKY4VPL4iMgTV/IsvKDSxdshPCTKe4zdudaeqKgV7BTOhw8HIpwuSYFTD2NKQOhUX2uQ
 yhjPItLZORRY1ul6VSk+Iyk/0pADaRlmiatJFy4sz4dZ6oRwKquxxGLCGf3TfysgWCzYXYxMC+Y
 Q9QztGeduCOhqS6IL72oPW24lgQFEO27larLZEjNnr246J5QNmewfOLeYh2VfOlViJdUPQBHa9A
 0dzBkcEnN/cQFJDiVrLKxjzcs/Xxv9cPTNeACYUVmO+303iVUkarelBHjnItGQVqow8Zz25n14B
 5oGnOd1BUfPmTTXIu+GfjfZOggVpqwA4Q4dssvOXL5IG/ssGuY5icXUo4u0FeHPNusvHeHlmxYg
 7Uts/jmBmn2U3S//7fEuhxOMYFlmuE8xGkv5fXkMWhAa9w/1Qi8tcgqMJAJGnXqpH+ae5L0B
X-Proofpoint-GUID: xgQbXySQjIAYsePyi7InKIBsQNfKlrJa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-03_06,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=954 bulkscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508030154
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

On Thu, Jul 03, 2025 at 05:28:19PM +0800, Haoxiang Li wrote:
> Add check for the return value of kstrdup_const() in drm_managed.c
> to prevent potential null pointer dereference.
> 
> Fixes: c6603c740e0e ("drm: add managed resources tied to drm_device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>  drivers/gpu/drm/drm_managed.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
> index cc4c463daae7..368763d4c24e 100644
> --- a/drivers/gpu/drm/drm_managed.c
> +++ b/drivers/gpu/drm/drm_managed.c
> @@ -151,6 +151,11 @@ int __drmm_add_action(struct drm_device *dev,
>  	}
>  
>  	dr->node.name = kstrdup_const(name, GFP_KERNEL);
> +	if (!dr->node.name) {
> +		kfree(dr);
> +		return -ENOMEM;
> +	}
> +
>  	if (data) {
>  		void_ptr = (void **)&dr->data;
>  		*void_ptr = data;
> @@ -236,6 +241,10 @@ void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp)
>  		return NULL;
>  	}
>  	dr->node.name = kstrdup_const("kmalloc", gfp);
> +	if (dr->node.name) {

This should be `if (!dr->node.name)`.
I think with this fixed the patch is legit and  should be picked up.

> +		kfree(dr);
> +		return NULL;
> +	}
>  
>  	add_dr(dev, dr);
>  
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
