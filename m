Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC9BCC01C1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 23:15:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB8A10E530;
	Mon, 15 Dec 2025 22:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWE9OXZf";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f2xbTdTO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B0E10E532
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 22:15:16 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BFLG8Hx1446299
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 22:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rQLvDYJJk0qcJ2pF2DqBAfMY9vdOKW2NRuLt1K8NIfY=; b=lWE9OXZfKxY9I60o
 NFXhwjX3bAKAEdFel4OQTg82hJPQnIEQzaYai6eFFg6fOxQ3K1CTRhvqHxLnhds/
 /GEGt2U4PIe7GDLadcChggmvU53mCUH5LGCi8KIM8r4lZgtb17ruTyYBdBhQ3MXK
 wDj6Cxssgxhfmrn+d+TeF6lVoIfaxHO7B0RjwHfANWmORhRvjORGGy1Dl8ZJ7rwz
 4zmeMdszWYIEKyFurI5iVZUx7kN4tgm9Dg0qH62qFx8b22bt5LFyXjJckDGozJ2k
 XKjFwdNkXWufrbir5uRiK/p3msF8++cDASjOJOOmaraZcamHyKW5hmDNEjkHCCc7
 26YYjQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2hgasvbd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 22:15:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4f1f42515ffso32955911cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 14:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765836915; x=1766441715;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rQLvDYJJk0qcJ2pF2DqBAfMY9vdOKW2NRuLt1K8NIfY=;
 b=f2xbTdTOTMka4J/Bmoo19kolMm933m7p9+fl71gsWYvFYxHBUJUKLA472PzRx6DT4T
 TKFBdjZVbooJZMCQgFZkXQeiOuOPwNOHEqAaRMg8BsEIAshFjqX27IzXba2X9fcmuiBS
 dy9Oeha7IJPdo3CvPCJvBP6VH2pYOXuCE0/YJS/rB/DkiSYUYoYcgelqabAfLz309kEe
 3wyQPhySM9Lw3OgiDiRe4+EW4K78FGJaJxu89m+UY6cqphGAno8EmpepLCqK1saCi5rK
 GS1vPov0x2QeDIuRYR0WqYPXLa9XOp2RQEkfUiBzl6Buy/fR/sUB7L4Vr7XSzzA0yMlz
 /Ldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765836915; x=1766441715;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rQLvDYJJk0qcJ2pF2DqBAfMY9vdOKW2NRuLt1K8NIfY=;
 b=LXD8eDnvzzdykcopNoEr8zTIuNXfyB8ABfwvaXvJ+7oHYVrZDcIrZGx0Bl00fYRjf6
 WZlnGHnuWbCk9E+1yvX461ui40Qd5nNgIIFBn2kzM7s5dr3EdG8Sbl08xFNDqcwvNtQl
 C3bY+VsPvukjBk78z4c750j4Jf59OztmAvwYZAhIxoQFqVWNUV42lciMGyVF7427fTxd
 dwUFb/6tq4cp4mH7cv1pYkqnTPzS4WGJ58yUVCdpIP7iKO5jrqsxz/StQDf1VBPrqD1N
 qLoezjqCv7zMSCzDnqPeWESoLGoTrrrzb+bL/ZPVaOEl0lPdC6ZAY3GPocMgWTBFfxWg
 jdSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/UFQE5H+mhBWdD/5NNgE2DhQUXWr91QHeNhZgTdMCLRA9pmdz//Fe7kO7YlLfmUdHuhCNDfpgpVo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRxQleUgwTg+UuCaSSQw9d2pa63psJHOdF9m+4Clc975CxvbcS
 A+FDKcoksWuFyUDJK4AF41cnQUu4oq5rCHfxtS6yBuZTUYCTR8DSgOAM+UFtxjNnKJKXPuTjSd3
 cCFaSLHQMGDdflVPJBtEZSIUfOxIbZWnR4sL09gQIR3GckU3uFctOSkSoKLDag/beZx0Zc7I=
X-Gm-Gg: AY/fxX4ibf/bIZI3j0PCC5iUlCmR4aS1zbgx39k8McGCAp4SGHf/CoD/Ns3ofA0NcMJ
 NoW0jT5X7keoKm65g27RpAP1/nToLs76V3VZG3oAGCBRgCLR9ha7Av92gMUs7BmyanZJ1qTMuPA
 m5hshKqwU+iwbFxe15z4w98n76kuwAhv61Tv+9ACqpoBnzoZYAc0tFtR7Qdx5JDUm77ygF/mkV4
 tPDW27m8WfFXP54XNEVPFOXQL6144cS5SVLMiLs5I4P99aMhuR3vTeYkf4d24e0U0ZPCreCCvyW
 UXPjINRX2NYOl0fQqLKQUg7du5hmgN9eW6eT4BsrzjlZUQadKeMRItDQndDp7G1g27qL1hPebq+
 E5zH+O/juwHVMCwZIlqtJpc5naxKGXsTlpURs3+vlaH8YxdrsEo2590KuPvgBHGSK6J8YGW6k+w
 VJK2TpJmAWtMWqBZPfATWP26k=
X-Received: by 2002:a05:622a:199a:b0:4b0:6205:d22b with SMTP id
 d75a77b69052e-4f1d05e2644mr154966181cf.52.1765836914715; 
 Mon, 15 Dec 2025 14:15:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmFlAL5iT7Es9WwZWgZUy1aU5v/39pjanIxpYshlpMfNdiiBDd1KpBMYmrmk1uxL5vLSVKtQ==
X-Received: by 2002:a05:622a:199a:b0:4b0:6205:d22b with SMTP id
 d75a77b69052e-4f1d05e2644mr154965581cf.52.1765836914176; 
 Mon, 15 Dec 2025 14:15:14 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5990da1a1dcsm205964e87.23.2025.12.15.14.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 14:15:13 -0800 (PST)
Date: Tue, 16 Dec 2025 00:15:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dale Whinham <daleyo@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?utf-8?B?SsOpcsO0bWU=?= de Bretagne <jerome.debretagne@gmail.com>,
 Steev Klimaszewski <threeway@gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Enable support for eDP v1.4+ link rates table
Message-ID: <s43zm7ljm5cipjgkjllvplk6jcxrjo445rboirikivtr3n2alh@fvu66mkwkb5q>
References: <20251214-drm-msm-edp14-v1-1-45de8c168cec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251214-drm-msm-edp14-v1-1-45de8c168cec@gmail.com>
X-Proofpoint-GUID: FgD1DOCVOjPvy3rraT9lCR7qYG36B-bV
X-Proofpoint-ORIG-GUID: FgD1DOCVOjPvy3rraT9lCR7qYG36B-bV
X-Authority-Analysis: v=2.4 cv=GpxPO01C c=1 sm=1 tr=0 ts=69408873 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EeVQeoITEpk-UB-pV00A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE5MSBTYWx0ZWRfXyVjMZ1nf3y+v
 msTUBO8KiogtjVw79niywNC9dKs47u79o4TVIS/UmJB2wolGrBHiBs0DcZuBVrK+IRz5CavPXI+
 v6xf3F98TWHZ6/BtKa7w8z7QgWuRtOpZMmWhApiouOf68jodfWIJgk8Gls/GvKjX7rpWLN2WeCw
 kDSYfI1ObgA70+lhY2aW2GnYnwgxyZ8x0Mv2vRzfJ+bndeMMqAvR/+xrzi2zpEB9ndpiLaKxoAt
 kbfOywLOK7lv4S2cZnu9D9QXA2P02CIqrDaTURWrykRw20BKwE6C0jDmEiAOC7L29qGyOkNUOUL
 un579/Kd2rrjHwXBYvlNoKoBStbErmrL2/C4Hg6mNYxY9lvq3Y0NfhZezAC798NU2ooqM7khqhH
 buhpBa2wxWFCNOAdjot2dTCFJI+0Bg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_05,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150191
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

On Sun, Dec 14, 2025 at 08:48:12PM +0000, Dale Whinham wrote:
> The MSM DRM driver currently does not support panels which report their
> supported link rates via the SUPPORTED_LINK_RATES table.
> 
> For panels which do not offer the optional eDP v1.3 fallback via
> MAX_LINK_RATE, this will cause a panel probe failure (e.g. Samsung
> ATNA30DW01-1 as found in Microsoft Surface Pro 11).
> 
> Detect eDP v1.4 panels and parse the SUPPORTED_LINK_RATES table when
> present.
> 
> Additionally, set the rate using LINK_RATE_SET instead of LINK_BW_SET,
> but only if LINK_BW_SET hasn't already been written to.
> 
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> Tested-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> Tested-by: Steev Klimaszewski <threeway@gmail.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c  | 57 +++++++++++++++++-----------
>  drivers/gpu/drm/msm/dp/dp_link.h  |  3 ++
>  drivers/gpu/drm/msm/dp/dp_panel.c | 79 +++++++++++++++++++++++++++++++++------
>  3 files changed, 107 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index cbcc7c2f0ffc..f00456902c10 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -175,20 +175,29 @@ static inline void msm_dp_write_link(struct msm_dp_ctrl_private *ctrl,
>  static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
>  					struct msm_dp_link_info *link)
>  {
> -	u8 values[2];
> +	u8 lane_count, bw_code;
>  	int err;
>  
> -	values[0] = drm_dp_link_rate_to_bw_code(link->rate);
> -	values[1] = link->num_lanes;
> +	lane_count = link->num_lanes;
>  
>  	if (link->capabilities & DP_LINK_CAP_ENHANCED_FRAMING)
> -		values[1] |= DP_LANE_COUNT_ENHANCED_FRAME_EN;
> +		lane_count |= DP_LANE_COUNT_ENHANCED_FRAME_EN;
> +
> +	if (link->use_rate_set) {
> +		DRM_DEBUG_DP("using LINK_RATE_SET: 0x%02x", link->rate_set);
> +		err = drm_dp_dpcd_writeb(aux, DP_LINK_RATE_SET, link->rate_set);
> +	} else {
> +		bw_code = drm_dp_link_rate_to_bw_code(link->rate);
> +		DRM_DEBUG_DP("using LINK_BW_SET: 0x%02x", bw_code);
> +		err = drm_dp_dpcd_writeb(aux, DP_LINK_BW_SET, bw_code);
> +	}
>  
> -	err = drm_dp_dpcd_write(aux, DP_LINK_BW_SET, values, sizeof(values));
>  	if (err < 0)
>  		return err;
>  
> -	return 0;
> +	err = drm_dp_dpcd_writeb(aux, DP_LANE_COUNT_SET, lane_count);

I'd suggest following i915 and writing DP_LANE_COUNT_SET before
DP_LINK_BW_SET.

> +
> +	return err;
>  }
>  
>  /*
> @@ -1474,26 +1483,32 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
>  static int msm_dp_ctrl_link_rate_down_shift(struct msm_dp_ctrl_private *ctrl)
>  {
>  	int ret = 0;
> +	struct msm_dp_link_info *link_params = &ctrl->link->link_params;
>  
> -	switch (ctrl->link->link_params.rate) {
> -	case 810000:
> -		ctrl->link->link_params.rate = 540000;
> -		break;
> -	case 540000:
> -		ctrl->link->link_params.rate = 270000;
> -		break;
> -	case 270000:
> -		ctrl->link->link_params.rate = 162000;
> -		break;
> -	case 162000:
> -	default:
> -		ret = -EINVAL;
> -		break;
> +	if (link_params->rate_set) {
> +		--link_params->rate_set;
> +		link_params->rate = link_params->supported_rates[link_params->rate_set];
> +	} else {
> +		switch (link_params->rate) {
> +		case 810000:
> +			link_params->rate = 540000;
> +			break;
> +		case 540000:
> +			link_params->rate = 270000;
> +			break;
> +		case 270000:
> +			link_params->rate = 162000;
> +			break;
> +		case 162000:
> +		default:
> +			ret = -EINVAL;
> +			break;
> +		}
>  	}
>  
>  	if (!ret) {
>  		drm_dbg_dp(ctrl->drm_dev, "new rate=0x%x\n",
> -				ctrl->link->link_params.rate);
> +				link_params->rate);
>  	}
>  
>  	return ret;
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
> index b1eb2de6d2a7..725e08f75574 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.h
> +++ b/drivers/gpu/drm/msm/dp/dp_link.h
> @@ -17,6 +17,9 @@
>  struct msm_dp_link_info {
>  	unsigned char revision;
>  	unsigned int rate;
> +	unsigned int supported_rates[DP_MAX_SUPPORTED_RATES];
> +	unsigned int rate_set;
> +	bool use_rate_set;
>  	unsigned int num_lanes;
>  	unsigned long capabilities;
>  };
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index ad5d55bf009d..5f9ccc48ee6c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -13,6 +13,8 @@
>  #include <drm/drm_print.h>
>  
>  #include <linux/io.h>
> +#include <linux/types.h>
> +#include <asm/byteorder.h>
>  
>  #define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
>  
> @@ -107,29 +109,84 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
>  	drm_dbg_dp(panel->drm_dev, "max_lanes=%d max_link_rate=%d\n",
>  		   link->max_dp_lanes, link->max_dp_link_rate);
>  
> -	link_info->rate = drm_dp_max_link_rate(dpcd);
> +	max_lttpr_lanes = drm_dp_lttpr_max_lane_count(link->lttpr_common_caps);
> +	max_lttpr_rate = drm_dp_lttpr_max_link_rate(link->lttpr_common_caps);
> +
> +	/* For eDP v1.4+, parse the SUPPORTED_LINK_RATES table */
> +	if (link_info->revision >= DP_DPCD_REV_14) {

No, eDP has separate versioning register. DP revision != eDP revision.

> +		__le16 rates[DP_MAX_SUPPORTED_RATES];
> +		u8 bw_set;
> +		int i;
> +
> +		rc = drm_dp_dpcd_read_data(panel->aux, DP_SUPPORTED_LINK_RATES,
> +					   rates, sizeof(rates));
> +		if (rc)
> +			return rc;
> +
> +		rc = drm_dp_dpcd_read_byte(panel->aux, DP_LINK_BW_SET, &bw_set);
> +		if (rc)
> +			return rc;
> +
> +		/* Find index of maximum supported link rate that does not exceed dtsi limits */
> +		for (i = 0; i < ARRAY_SIZE(rates); i++) {
> +			/*
> +			 * The value from the DPCD multiplied by 200 gives
> +			 * the link rate in kHz. Divide by 10 to convert to
> +			 * symbol rate, accounting for 8b/10b encoding.
> +			 */
> +			u32 rate = (le16_to_cpu(rates[i]) * 200) / 10;
> +
> +			if (!rate)
> +				break;
> +
> +			drm_dbg_dp(panel->drm_dev,
> +				   "SUPPORTED_LINK_RATES[%d]: %d\n", i, rate);
> +
> +			/* Limit link rate from link-frequencies of endpoint property of dtsi */
> +			if (rate > link->max_dp_link_rate)
> +				break;
> +
> +			/* Limit link rate from LTTPR capabilities, if any */
> +			if (max_lttpr_rate && rate > max_lttpr_rate)
> +				break;
> +
> +			link_info->rate = rate;
> +			link_info->supported_rates[i] = rate;
> +			link_info->rate_set = i;
> +		}
> +
> +		/* Only use LINK_RATE_SET if LINK_BW_SET hasn't already been written to */
> +		if (!bw_set && link_info->rate)
> +			link_info->use_rate_set = true;
> +	}
> +
> +	/* Fall back on MAX_LINK_RATE/LINK_BW_SET (eDP v1.3) */
> +	if (!link_info->rate) {
> +		link_info->rate = drm_dp_max_link_rate(dpcd);
> +
> +		/* Limit link rate from link-frequencies of endpoint property of dtsi */
> +		if (link_info->rate > link->max_dp_link_rate)
> +			link_info->rate = link->max_dp_link_rate;
> +
> +		/* Limit link rate from LTTPR capabilities, if any */
> +		if (max_lttpr_rate && max_lttpr_rate < link_info->rate)
> +			link_info->rate = max_lttpr_rate;
> +	}
> +
>  	link_info->num_lanes = drm_dp_max_lane_count(dpcd);
>  
>  	/* Limit data lanes from data-lanes of endpoint property of dtsi */
>  	if (link_info->num_lanes > link->max_dp_lanes)
>  		link_info->num_lanes = link->max_dp_lanes;
>  
> -	/* Limit link rate from link-frequencies of endpoint property of dtsi */
> -	if (link_info->rate > link->max_dp_link_rate)
> -		link_info->rate = link->max_dp_link_rate;
> -
>  	/* Limit data lanes from LTTPR capabilities, if any */
> -	max_lttpr_lanes = drm_dp_lttpr_max_lane_count(panel->link->lttpr_common_caps);
>  	if (max_lttpr_lanes && max_lttpr_lanes < link_info->num_lanes)
>  		link_info->num_lanes = max_lttpr_lanes;
>  
> -	/* Limit link rate from LTTPR capabilities, if any */
> -	max_lttpr_rate = drm_dp_lttpr_max_link_rate(panel->link->lttpr_common_caps);
> -	if (max_lttpr_rate && max_lttpr_rate < link_info->rate)
> -		link_info->rate = max_lttpr_rate;
> -
>  	drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", major, minor);
>  	drm_dbg_dp(panel->drm_dev, "link_rate=%d\n", link_info->rate);
> +	drm_dbg_dp(panel->drm_dev, "link_rate_set=%d\n", link_info->rate_set);
> +	drm_dbg_dp(panel->drm_dev, "use_rate_set=%d\n", link_info->use_rate_set);
>  	drm_dbg_dp(panel->drm_dev, "lane_count=%d\n", link_info->num_lanes);
>  
>  	if (drm_dp_enhanced_frame_cap(dpcd))
> 
> ---
> base-commit: 7bc29d5fb6faff2f547323c9ee8d3a0790cd2530
> change-id: 20251214-drm-msm-edp14-8f4dc65dc34a
> 
> Best regards,
> -- 
> Dale Whinham <daleyo@gmail.com>
> 

-- 
With best wishes
Dmitry
