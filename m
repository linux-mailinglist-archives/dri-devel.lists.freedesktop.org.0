Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33888AE3DA0
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 13:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3E310E046;
	Mon, 23 Jun 2025 11:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iepwuq6C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A748010E046
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 11:06:44 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N8LcOl005791
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 11:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /SblRjynm556F4JCCkpMzhFlMahL7TZAtWLt+OcV1Ds=; b=iepwuq6Cyh5zLaFQ
 s6S5DsMtY160Fz7DiSpFAGjmMrnmaMYM6N7eURNPMSlkqiTXKWxOjRt4LeUQ21b+
 ZmeSwD4jwT3qQ1I1gZfMZIVPS2F0MT15qenaoHI6XW2MV7OMOlhjXqLbVwjjXDca
 JdqKrem0JSj3uCle29QwExAbG7wmGRzsOvzanmdZEV2vUmuwzZ3cviXgFdlYFBdk
 TKLZ87DaML45pHqYeuelyQ3qLzz8lNjG4baM9EbjGUMfNYS7EngbXkbG5Hv/f5l8
 Ow9AJD7b2e6l4S4PKk8gyozCcqKnab40gIby8kBcHYwPdTqaMfne1q3L4gOC1HPo
 SQJa9g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bg8eu1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 11:06:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6fac45de153so60246556d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 04:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750676803; x=1751281603;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/SblRjynm556F4JCCkpMzhFlMahL7TZAtWLt+OcV1Ds=;
 b=WowOQRTIGH+q+3GjRTdbrF6H7CQmxUIWVz9fHOkPStiOyIAwBNJlnQaGgdDH4WR1JR
 BJeA1T6vnQghGF6G/OT3gBdcmQHNLWdVIudIV8i23VP2DIDgmo4dgy0NEEsv699wRhKl
 YOFacWgu3p6Sgu2biSbzxyRy+plA4mzxfHP2EV/SBvL4wlDeVklc2oWlU/DMCa1LEAT/
 Wx6mItdTfjcr9XzQHrqaXE4BHo8a/6GbD40eZ2c95Yvd83tSh0Qeh+jaN7kakJNGZCtP
 OimoCUiCPvmov/eAQnAqz42wKO+Y/aapK8GINxkKoNd2LzpOzJ4gSb4l+g17G47+Enkz
 B/RQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJLL/iucbiws4wXUq9SL1WeHA0DnJXkWsf6SGcDyqGbb/TROYJRqOgpsGl0oamwmftKW0hcA7Qdh8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0cmVJpjJX8oXyeV4pSVaxiRh8BDpC10kGE3VLdcAHdKV1Gd5O
 Th6SZzcQOgaLpvnyDy9cIG+TVC9zBV2VyL68IfCIvKEUPKs7NeEGrpc+yahLRXTKsbXH+cfszzJ
 8pWrSYDGRCpENVLLCBPETDKYqZEMjBWoxOUCB8ij/t5Ev5NzUEy0Ow5WU2qbAxk3EjYL6g00=
X-Gm-Gg: ASbGncsi7cCnoZz1xh0Xf0Tch+aGXw7Vqp/TAmxdf7c1iuOsmyBBvor0fg07UTt5aeL
 X3v0lAMRxYTubG8OEW4FG4GKqPRL19OJs3caW1+Kp9e5RYoLCfWZI6TIwqU2RN7OQIXYjHQ4aY2
 0TNMqcqaCUTtPXDDkyyWkru+qeGxhhOLCFe1lO2sIleUNzI0L5L7jABcHQ+IzQfT6ICAoLX7oYG
 BKo/Qq8PSmqHfgHsVQDSsWNasZ2lKZqQAdKdugCHLNAfvMIf3DF94VMEeuI54u6w9o/TflY+k4Q
 TQ0KBzbcoK8UTdoQvwD+BgddHlkJbUek89gThmWJZaGCop3kRuC0aXyco//1k/9nqf6/KTXWUiU
 =
X-Received: by 2002:a05:620a:1a27:b0:7c5:962b:e87c with SMTP id
 af79cd13be357-7d3f993a806mr1811151085a.44.1750676802594; 
 Mon, 23 Jun 2025 04:06:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCAaI32difYeUGqzguwGOyLLcEd4F3LnFdlw9PHpbqM5K6DPV7l+MzhhUJ1GJr5ec23magXQ==
X-Received: by 2002:a05:620a:1a27:b0:7c5:962b:e87c with SMTP id
 af79cd13be357-7d3f993a806mr1811145285a.44.1750676801961; 
 Mon, 23 Jun 2025 04:06:41 -0700 (PDT)
Received: from [10.132.167.252] (37-33-208-94.bb.dnainternet.fi.
 [37.33.208.94]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553e41c2d71sm1341676e87.142.2025.06.23.04.06.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 04:06:41 -0700 (PDT)
Message-ID: <a506cff0-6a0f-44b2-93e5-0488aa041fa2@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 14:06:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/3] drm/bridge: add warning for bridges not using
 devm_drm_bridge_alloc()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Anusha Srivatsa <asrivats@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250620-drm-bridge-alloc-getput-drm-bridge-c-v9-0-ca53372c9a84@bootlin.com>
 <20250620-drm-bridge-alloc-getput-drm-bridge-c-v9-3-ca53372c9a84@bootlin.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250620-drm-bridge-alloc-getput-drm-bridge-c-v9-3-ca53372c9a84@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4ONYwYryTlFNNLl30CWYyrWtFpHFsz9n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2NiBTYWx0ZWRfX7ExqWM/8H92k
 6FIrEG35qvD2Ig1L0VuT20nEnBzv/TpLMRgvU9h47z92TtvsrFvHsT4BHiQn79kvxWjoFT5V809
 /KZb9o3a/W1sz5yXFIgGRegGIc5cjLj3JZfBaYWCulJz2juxwc/AeRYidT9mN6RvGx+fyJTGGhG
 h2jCWlscY4oy7fL7SYgLyIWsO/JyZ9TrSd++L/9BRHSZgBehBU0Ib6CiZX1TOw1gtdSfFjUbO5t
 Raf/IyFvyvJA0B1ztOTQ1Hic8fiTUb/RSBy3Q3Lw6KFYH1j2k+LPqhuWgT6HjiWLZfDtSNkJc+s
 7iXcLKGdo+865FI/2UZXZlw5vt3h5oYoHt3MwpXqwdPLJITLMIZKcuy7/WuyIABGl06TVwVf9pv
 KKw51/CoqIedOpRKaPrEdAAJZ/sHiCNdxUIjkFBIV4cjJ4d783BXCxZBYappXUgyrujUtTet
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=68593543 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=D+sM+DASzikqaCSeXxPSkA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=P-IC7800AAAA:8 a=6giXz7gn6WA7Rt2kLM8A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: 4ONYwYryTlFNNLl30CWYyrWtFpHFsz9n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230066
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

On 20/06/2025 18:59, Luca Ceresoli wrote:
> To the best of my knowledge, all drivers in the mainline kernel adding a
> DRM bridge are now converted to using devm_drm_bridge_alloc() for
> allocation and initialization. Among others this ensures initialization of
> the bridge refcount, allowing dynamic allocation lifetime.
> 
> devm_drm_bridge_alloc() is now mandatory for all new bridges. Code using
> the old pattern ([devm_]kzalloc + filling the struct fields +
> drm_bridge_add) is not allowed anymore.
> 
> Any drivers that might have been missed during the conversion, patches in
> flight towards mainline and out-of-tre drivers still using the old pattern
> will already be caught by a warning looking like:
> 
>    ------------[ cut here ]------------
>    refcount_t: addition on 0; use-after-free.
>    WARNING: CPU: 2 PID: 83 at lib/refcount.c:25 refcount_warn_saturate+0x120/0x148
>    [...]
>    Call trace:
>     refcount_warn_saturate+0x120/0x148 (P)
>     drm_bridge_get.part.0+0x70/0x98 [drm]
>     drm_bridge_add+0x34/0x108 [drm]
>     sn65dsi83_probe+0x200/0x480 [ti_sn65dsi83]
>     [...]
> 
> This warning comes from the refcount code and happens because
> drm_bridge_add() is increasing the refcount, which is uninitialized and
> thus initially zero.
> 
> Having a warning and the corresponding stack trace is surely useful, but
> the warning text does not clarify the root problem nor how to fix it.
> 
> Add a DRM_WARN() just before increasing the refcount, so the log will be
> much more readable:
> 
>    [drm] DRM bridge corrupted or not allocated by devm_drm_bridge_alloc()
>    ------------[ cut here ]------------
>    refcount_t: addition on 0; use-after-free.
>    [...etc...]
> 
> A DRM_WARN is used because drm_warn and drm_WARN require a struct
> drm_device pointer which is not yet available when adding a bridge.
> 
> Do not print the dev_name() in the warning because struct drm_bridge has no
> pointer to the struct device. The affected driver should be easy to catch
> based on the following stack trace however.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changes in v9:
> - change warning trigger from "refcount != 1" to "container not NULL"
> 
> This patch was added in v8
> ---
>   drivers/gpu/drm/drm_bridge.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index f001bbe95559aabf0aac9f25f89250ad4e1ad9c8..0b450b334afd82e0460f18fdd248f79d0a2b153d 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -295,6 +295,9 @@ EXPORT_SYMBOL(__devm_drm_bridge_alloc);
>    */
>   void drm_bridge_add(struct drm_bridge *bridge)

Can we rename this function, making sure that noone can call it 
directly? E.g. adding two underscores might point out that is is an 
internal API.

>   {
> +	if (!bridge->container)
> +		DRM_WARN("DRM bridge corrupted or not allocated by devm_drm_bridge_alloc()\n");
> +
>   	drm_bridge_get(bridge);
>   
>   	mutex_init(&bridge->hpd_mutex);
> 


-- 
With best wishes
Dmitry
