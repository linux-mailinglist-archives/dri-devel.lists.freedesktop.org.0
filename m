Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7454DBB8C50
	for <lists+dri-devel@lfdr.de>; Sat, 04 Oct 2025 12:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4369910E054;
	Sat,  4 Oct 2025 10:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="E599u2q3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975AE10E053
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Oct 2025 10:08:30 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5948NL5Y007735
 for <dri-devel@lists.freedesktop.org>; Sat, 4 Oct 2025 10:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=oF4ylOnxHy3iXVmpLJewAkMc
 OvTMeYc76t5jsgQhmCs=; b=E599u2q3z3ewTUqBqKrdq1Rd0bkhpv2DeC+P67hH
 DLHHEe7yf7vk/Bhxatf71vX0TbLlB8Eryb5pAkB1ZbJxIGwr1jAU/aLuLoj86IXj
 K+cUe+Ss4htF4sL9MqHL3AqKxoLiWihXQcdpZ+3s/j/C4sw4FerU6IIlW+6GrNLP
 zMP9QyXfjuHgAqPfia4By0WrAS3Pb0FkOX4U1hr+DpqCsI3S2VOVyx4WQwIDczWV
 hgxiWDWHGSHOYTp7hNKGPPvSgJtTQZdAipLYx/fSNczZeAZbOxDk/lvVThXOpmHI
 0+gUMBI/gydLWiMjNkQ3tlC6Xt3CipVJR5ZH9bvAEjo90A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9drpjv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Oct 2025 10:08:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4de53348322so134683431cf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Oct 2025 03:08:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759572508; x=1760177308;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oF4ylOnxHy3iXVmpLJewAkMcOvTMeYc76t5jsgQhmCs=;
 b=D+GsH3NDm2nPlG8cC5R/7SIhzcCqLYLbtWzABbkqwvTLpcna95HqeJ6vVpOHCzREZ8
 rxhDIYmY6mGArYcOm3VmmKuJzOWpxFuL9tRdH+zsegf4c49xz4OSd306yU8CwN3Omobc
 519WdaA2LdpSldm+rQQsl04zoRdQ30lRP2iPoo4SZcYuklTrmSpEwe9mhk8wZD80oqTN
 aSq5CDKu07Le0nqaYpvP0waiYC/8VZAV+GC1azIYDnaKDJmWiAXfw+dX7TXUbIBIwkqM
 HuajBMojGB6RqBg4HhpayXf1OQ5K9ljMiyMVJGt2PKtkByFGo//J5Uhc2n4P7dwgJUa3
 Uysw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW00eyFmLLAHcz4rC6PYznq0dtBOUGLMdFhnKVu6w8EahHDgyPQc/HKq/R6iKxRSuyCO0KVICxasGc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykWp/d3tDixQcxCq53maTseqkbiXY/PtzVIPIhHie8rgfRFq4M
 MlpLAlq3I/0szlzsUxKxKHUQTae08gE/UOqZBu2VhpX6VCQMkmTicN5Fu9mwxHy8Gc6r/x4/EOs
 9y+Ob15G8crry9kGQC8gA8VRAYuiXxYFKh/MdTGxeISN/EholRXs2DILhaL9CR3i4lGKjCIs=
X-Gm-Gg: ASbGncuzlqpUCgJ8b9KY64G1qFmK6ph7pI0zC1nmmiUqJmHW0R2t04lzTL3+N13qjHS
 h2j5lkuvbzdqCdz9BrB/zsXi875g5yf9MmZa8v6jCEplKsphwVR80rYEk77+hm3yCMUsAI0mHr5
 1fB6ADW5rnboqwz7mCmZwKeYolUwgHCGo5jzQY9n0plXwwspurGGQ+rE94RHo83sH8W14aFKJ1N
 Od/g0wUVEsJbPFI5banBJ3xyLKZc4Oyy3M2/ZNGc9aL/3ot3AWjbBNS6eCZRvrbtLSqR/FLsEiE
 npW6PAbIjmKCpLoRsnMaXen0A8wm5ckfLlvHb56obiS3X+CI3AJzfF0vEtq51eYnEr9/ITeswje
 d4ISDnW8e8L9PNjt0804rReHiFGmNqE8wHNroVcfWHpxTkgn6d7SoXGJIFg==
X-Received: by 2002:ac8:7d82:0:b0:4b3:50b0:d7b with SMTP id
 d75a77b69052e-4e576ae4d3amr71937161cf.61.1759572508510; 
 Sat, 04 Oct 2025 03:08:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDB8YON6+IOdqT/W12uoEsRDZ0RPKvejXjWXeyKQTp7j3QpYmN3/JnOt7VY11YVTXkprzbPw==
X-Received: by 2002:ac8:7d82:0:b0:4b3:50b0:d7b with SMTP id
 d75a77b69052e-4e576ae4d3amr71936921cf.61.1759572508072; 
 Sat, 04 Oct 2025 03:08:28 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-373ba4a6015sm23709331fa.45.2025.10.04.03.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Oct 2025 03:08:26 -0700 (PDT)
Date: Sat, 4 Oct 2025 13:08:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nemesa Garg <nemesa.garg@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Adarsh G M <Adarsh.g.m@intel.com>, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH 01/10] drm/drm_crtc: Introduce sharpness strength property
Message-ID: <epzspujsf2o4wq5ykswe7a3hvrb3vy5wgenglfopmkuepyfstm@5kkpxstpyc3r>
References: <20251001063500.1259687-1-nemesa.garg@intel.com>
 <20251001063500.1259687-2-nemesa.garg@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001063500.1259687-2-nemesa.garg@intel.com>
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e0f21e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=QyXUC8HyAAAA:8 a=SGaxUKKO3T6AHWD8hvkA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: YaG8b1sJXcxb2aSYSFQ0tkD5dtICbA4o
X-Proofpoint-ORIG-GUID: YaG8b1sJXcxb2aSYSFQ0tkD5dtICbA4o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfX5M9bFP1hgDea
 uhFw3tAygUHhi/ul+2uoZN/YoHMWECNhY2EQFrr9XQmUWGSa8P5XCkujpug3QeiBJh9n25cjLXU
 2GZ5tBu4d5MIm3JL7yedeqItMqCGdMkR8dTRqwbx3HehA2QrTEH8BtxuRq8oc12AYyTTsB5uPcA
 FKr+Efg1ImVqcqlXQ831PRXd3bDKOMvmEFmzQA1Ny1X0flCYLYj0gHQy+4jDPc0JCs9FtgD/fpq
 cOMkDvpE1PWkMzrYUB9HK3UPmK7yVxckZjo9voR9rz0s8pJdLbeAhIG+BWKbeL5GnocL5xFPvJo
 nBW7QjnZx46UVaM9fPjEjnSMJfcBaM3W6kQV2TCAyTuToZl+qTb1dfdUQ79NYpfNkqishZ2r6CZ
 13ympvj2PcybcrrsM0rfwRjQl081aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004
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

On Wed, Oct 01, 2025 at 12:04:51PM +0530, Nemesa Garg wrote:
> Introduce a new crtc property "SHARPNESS_STRENGTH" that allows
> the user to set the intensity so as to get the sharpness effect.
> The value of this property can be set from 0-255.
> It is useful in scenario when the output is blurry and user
> want to sharpen the pixels. User can increase/decrease the
> sharpness level depending on the content displayed.
> 
> v2: Rename crtc property variable [Arun]
>     Add modeset detail in uapi doc[Uma]
> v3: Fix build issue
> v4: Modify the subject line[Ankit]
> 
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Tested-by: Adarsh G M <Adarsh.g.m@intel.com>
> Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c |  4 ++++
>  drivers/gpu/drm/drm_crtc.c        | 35 +++++++++++++++++++++++++++++++
>  include/drm/drm_crtc.h            | 18 ++++++++++++++++
>  3 files changed, 57 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 85dbdaa4a2e2..b2cb5ae5a139 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -419,6 +419,8 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
>  		set_out_fence_for_crtc(state->state, crtc, fence_ptr);
>  	} else if (property == crtc->scaling_filter_property) {
>  		state->scaling_filter = val;
> +	} else if (property == crtc->sharpness_strength_property) {
> +		state->sharpness_strength = val;
>  	} else if (crtc->funcs->atomic_set_property) {
>  		return crtc->funcs->atomic_set_property(crtc, state, property, val);
>  	} else {
> @@ -456,6 +458,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
>  		*val = 0;
>  	else if (property == crtc->scaling_filter_property)
>  		*val = state->scaling_filter;
> +	else if (property == crtc->sharpness_strength_property)
> +		*val = state->sharpness_strength;
>  	else if (crtc->funcs->atomic_get_property)
>  		return crtc->funcs->atomic_get_property(crtc, state, property, val);
>  	else {
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index 46655339003d..a7797d260f1e 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -229,6 +229,25 @@ struct dma_fence *drm_crtc_create_fence(struct drm_crtc *crtc)
>   * 		Driver's default scaling filter
>   * 	Nearest Neighbor:
>   * 		Nearest Neighbor scaling filter
> + * SHARPNESS_STRENGTH:
> + *	Atomic property for setting the sharpness strength/intensity by userspace.
> + *
> + *	The value of this property is set as an integer value ranging
> + *	from 0 - 255 where:
> + *
> + *	0: Sharpness feature is disabled(default value).
> + *
> + *	1: Minimum sharpness.
> + *
> + *	255: Maximum sharpness.
> + *
> + *	User can gradually increase or decrease the sharpness level and can
> + *	set the optimum value depending on content.
> + *	This value will be passed to kernel through the UAPI.
> + *	The setting of this property does not require modeset.
> + *	The sharpness effect takes place post blending on the final composed output.
> + *	If the feature is disabled, the content remains same without any sharpening effect
> + *	and when this feature is applied, it enhances the clarity of the content.

I can repeat my question from XDC: should we extend this to negative
values, allowing softening (unsharpening) the image?

>   */
>  
>  __printf(6, 0)

-- 
With best wishes
Dmitry
