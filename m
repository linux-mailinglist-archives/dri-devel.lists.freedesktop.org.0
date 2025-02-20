Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2657A3DC6C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 15:19:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B24310E976;
	Thu, 20 Feb 2025 14:19:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="X7Oq9c8x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5687E10E976
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 14:19:12 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K6n7Zj008355
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 14:19:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZzGpuNpEMvmvsVtbZHCixwxV188CGJ6yTEUyvKSil0I=; b=X7Oq9c8xcZesA4wx
 IxZ3gZCZVPgvDMOOY5hRHipJYxUdD1kO6ByZvqvjWmVttH/RixOKn9yGd+mvnBji
 roaCWYOc0P/NHzuIK/T1zYLqwH6G0s04qEHPQUNO1pBlu0x5Ydzk8q+20t0/aKBo
 3okbRmfStWCawdjOyGQRrOHA1uteA76w1MhoO/y25gCql6zmMh27oVXRWcglr2wH
 yMLS765/jvbW3YrXY14Tu9n0SQhPd0mOKguMrIpWKffxvZI8biwz+jlAVYgELqMS
 VCTQzlfdVZE3oV7zN2O4T7/x2vFCLQhRemEKtulAPl62H606349dwYknDlJTNaFq
 +i66Dg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy3edrw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 14:19:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e65eae5a26so2262706d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 06:19:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740061150; x=1740665950;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZzGpuNpEMvmvsVtbZHCixwxV188CGJ6yTEUyvKSil0I=;
 b=DCPlmL2Gb8d1pRVZj+R8/8VObZLWdLPC2i+9T9oIVD6jFjJqzwqToZ3ggiZzXZqcMj
 hOyLFZHWXHNGoP159udyIJhGh6TDEWsXUjod4lENWAEo/z6uxmvupHTJJleFJvlkeNxF
 v3AhBoM6RG4xvlSfso+aZo2B4x2YwKc0c6zd6xYjrKVHPuohM6k+OMcBb/uDXj6qnogj
 /zzNybbJ6ZvooHH52tYm494NNYTkT54rKl8GDAlgRuG5/sYg3Gug8Z03yRBSN/jk0dYE
 PLItfnsMDj+7YbSsMPm3Lh2S/+WeHuf9lCeWky5/p+YcEUyU5eTG3YKDN1gl6rItBoKA
 aLPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvPnOqfTIA1sl/wRdtA1kQ45fz+SDmdWI9Z3/NBHMtGL2i1zb1pJWosRJFhjTXk/QNW1K+jA27DDI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybmyDG74x1hvCEeZsPuVLFjOVdWWj8o5AzNqPKnu46a6xZIDJM
 oFXb13aLKM8yco9FIo86CbbnExrauv9NFIvnRykWmSySsyFyI+pv6xJaudUiz4R4MRL0P4sHDMZ
 CTTLosy4/m0dNdbF10IBp1FWQFSgOfQrh7JjMlGTGw4xakWnKSJy2TRG4qBIHgN5iOYo=
X-Gm-Gg: ASbGnctkCY6V6YrLtQ1dojmPPco4ivWhls8lh89hpDAMFIs4lDnDIfzGgwyDlcEy/r6
 uw0kvAiRBZioogSkBzvPSRePE7Ae8x8I8T5UxoKT/kloG1T0zbAFxVBoJ9Q/sHEAVFdT7XrOLi5
 QLkbL60aHyAOYSlYDeNl3rkF9H9Q3gMZCJHRNL8blgOuTeORTbYLLoo7YgVkwp+6eR4eekxeoc6
 VW/fyjqxOU8s79ghHPTDlGPTeWZxWzHuXpk9pss1R+dKv7/VwsF0RHY3yLXjjNZgwsd88C9OU/j
 hRpJwMvuNAjFpiL6T+8FCR9NS5eW5WisoL8L4RQEvk4ipla2GrVT3blkhEg=
X-Received: by 2002:a05:620a:7e8:b0:7c0:b018:5930 with SMTP id
 af79cd13be357-7c0b0185c4cmr395261685a.15.1740061150194; 
 Thu, 20 Feb 2025 06:19:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGplcBIxuc1qJMHH/uMdBHwF3xTcMp0hOINAPPRPBlGB53/bt9zTWLON5PGnGl2kKOLrka9A==
X-Received: by 2002:a05:620a:7e8:b0:7c0:b018:5930 with SMTP id
 af79cd13be357-7c0b0185c4cmr395260485a.15.1740061149834; 
 Thu, 20 Feb 2025 06:19:09 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e03aa0b1f7sm8859956a12.2.2025.02.20.06.19.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2025 06:19:08 -0800 (PST)
Message-ID: <00659634-c602-4382-b4a7-ef32f4d27dbf@oss.qualcomm.com>
Date: Thu, 20 Feb 2025 15:19:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] drm/msm/mdp4: move move_valid callback to
 lcdc_encoder
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
 <20250220-fd-mdp4-lvds-v2-5-15afe5578a31@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250220-fd-mdp4-lvds-v2-5-15afe5578a31@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uI4EbmY0xtDVo-GqJHgJm4h1E6rDSloV
X-Proofpoint-GUID: uI4EbmY0xtDVo-GqJHgJm4h1E6rDSloV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_06,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502200103
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

On 20.02.2025 12:14 PM, Dmitry Baryshkov wrote:
> We can check the LCDC clock directly from the LCDC encoder driver, so
> remove it from the LVDS connector.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |  1 -
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  | 27 ++++++++++++++++------
>  .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    | 21 -----------------
>  3 files changed, 20 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> index b8bdc3712c73b14f3547dce3439a895e3d10f193..e0380d3b7e0cee99c4c376bf6369887106f44ede 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> @@ -191,7 +191,6 @@ struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
>  long mdp4_dtv_round_pixclk(struct drm_encoder *encoder, unsigned long rate);
>  struct drm_encoder *mdp4_dtv_encoder_init(struct drm_device *dev);
>  
> -long mdp4_lcdc_round_pixclk(struct drm_encoder *encoder, unsigned long rate);
>  struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
>  		struct device_node *panel_node);
>  
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> index db93795916cdaa87ac8e61d3b44c2dadac10fd9e..cfcedd8a635cf0297365e845ef415a8f0d553183 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> @@ -348,19 +348,32 @@ static void mdp4_lcdc_encoder_enable(struct drm_encoder *encoder)
>  	mdp4_lcdc_encoder->enabled = true;
>  }
>  
> +static enum drm_mode_status
> +mdp4_lcdc_encoder_mode_valid(struct drm_encoder *encoder,
> +		const struct drm_display_mode *mode)
> +{
> +	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder =
> +			to_mdp4_lcdc_encoder(encoder);

Crazy linebreak

> +	long actual, requested;
> +
> +	requested = 1000 * mode->clock;
> +	actual = clk_round_rate(mdp4_lcdc_encoder->lcdc_clk, requested);
> +
> +	DBG("requested=%ld, actual=%ld", requested, actual);
> +
> +	if (actual != requested)
> +		return MODE_CLOCK_RANGE;
> +
> +	return MODE_OK;
> +}

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
