Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 397CBA70D48
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 23:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BBD110E60E;
	Tue, 25 Mar 2025 22:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qkqh6+Rg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1343810E60E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 22:53:33 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PGb4Gx021037
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 22:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ISr8+dBWyTIzSsULCAkQWoC3BzZVNdqq3K1nqr4wE6E=; b=Qkqh6+RgtYCoPoC3
 wo4rMFWn3RZtc22heLFRygSl+t29KvNeZH4VWEo+7Bik3mZG8mH9b7ObHU3hLiV9
 Qjz7por8jovSYJfH4Bt3z/9d3s4LNOr3x/eEb5PEGx9CrhoC2QwItfIP59ezVrbl
 UsSdmCY/sacFeU8oQCpR8x/LLyt/YXgm8D8hk9/wGgx3BEKRfAVCaVU4wElITqDl
 vSxjF2tRJTCGiIhlWZYWNwIzFSLxnQGkv6j6Ql4Flw/NtKZSw7YwG+PaOb2XWVDz
 x/3IeW2cW3+16W86/1XS1GsZyoEwtQJprWkw6UJD4CjyvRwarz4ngPMJH7SyhTHe
 xpuQvA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmd4k2aw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 22:53:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-474f079562dso211626041cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 15:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742943212; x=1743548012;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ISr8+dBWyTIzSsULCAkQWoC3BzZVNdqq3K1nqr4wE6E=;
 b=gJtYBur2nDGyuh/8DNyeJtlB/S2gIzdoA1gOzamJFQElpL8iXrWn+5uvQ96y3STLYw
 q+Kxmrf7896TOBdA0g9B38o3ve+ay6fAA3gSZ3TF1/38hpQ59ojMmEYxFxmxJ7goWRZZ
 mbjSYOTTcXPOwPNcp9aS26FKixU5sBGsHF66A8aus4vhqxNC46gYeNZ1M/mo52FlcAT8
 7NMaGSgueix7B6diYaRzOPQq1E/b9C7VAmNtRzKHHovdEZXAd53QnjU25fEfat+zDvj3
 R+i8lqcJOjbqyNcRRWh2klwRrYL9IFyO4RPq41ovAxRYayEFmaPTenjBPiYJVDIj//z3
 QU3w==
X-Gm-Message-State: AOJu0YxvbsIv2V1V6mes7U/zjrqTN/4ptxbiOjOuQ250eoZO65FS2JxK
 ic0bg3LvUh/R9My5e6At+y0Tu2VeEZgrXtwkp+nG1ruxwvwKsNQ4ZSiHbC5ns3Gqw086V0uJ30o
 2sgTiWr8RCnSR/M+NolOcTvhcmyYeuwH0raueNrNmiE42ttlNYZjD8/uJLx3jFerKAN8=
X-Gm-Gg: ASbGnctQdS1XQc3ayBvFW5oddbfUCcBgHIulYHjK+9xd5ZZm9XvBpSRhDs3CHQqENbI
 cJDXSkMZFaPb0DXLKMboq/nVtLreeNRppRQrvZze8c2GuQrpEXo+AQayhvbENUuzE4vDgqSrwqC
 B2I8LNTsYSFmm4C+UEqS1i8fEnWoezGQ61Vj3ZP5bOIeZSLwRDHFxGdd5DhBjaVRovvi9qkttxn
 V9eVQwsOw8D5eQBkjl1ecbSkPindLZJNKwNi+PhnWgTmV60aRXPRKrRV0WFsffqVmcu1gO2ZNEV
 Ksvr/x4CKopYc+E3t50O4gvnXMecuWrb44XuFo7Ceo0RMjmfEYwp0dNQsLsA1oW8kt8Pg7SArAL
 kSGdQNoIp5dL8mzcxy6LMzPoMvRyPIYaD7pQKi+xi7NOLk/EiZPPpNyt01Bk3/MtqlUWABB4s
X-Received: by 2002:a05:622a:244a:b0:476:8df3:640 with SMTP id
 d75a77b69052e-4771dd607admr257212471cf.7.1742943211580; 
 Tue, 25 Mar 2025 15:53:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHODyifLoz5i0q58PQeZo1XvH6zAoXLnIzD+z+TyAnPlm3+1Ne2pP5fbmTwMB+77onwLgSaEA==
X-Received: by 2002:a05:622a:244a:b0:476:8df3:640 with SMTP id
 d75a77b69052e-4771dd607admr257212191cf.7.1742943211094; 
 Tue, 25 Mar 2025 15:53:31 -0700 (PDT)
Received: from ?IPV6:2001:14bb:112:599c:156e:7946:30e2:6502?
 (2001-14bb-112-599c-156e-7946-30e2-6502.rev.dnainternet.fi.
 [2001:14bb:112:599c:156e:7946:30e2:6502])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ad64fbde2sm1622300e87.123.2025.03.25.15.53.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 15:53:30 -0700 (PDT)
Message-ID: <2cfdf7f3-56a6-495e-83cf-1921a2e0ef8d@oss.qualcomm.com>
Date: Wed, 26 Mar 2025 00:53:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/dp: fallback to maximum when PWM bit count is
 zero
To: Christopher Obbard <christopher.obbard@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Rui Miguel Silva <rui.silva@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
References: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
 <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xtBsQ7Eu3B8J2Wpiu50qQVHMimVsmyxw
X-Proofpoint-GUID: xtBsQ7Eu3B8J2Wpiu50qQVHMimVsmyxw
X-Authority-Analysis: v=2.4 cv=QLZoRhLL c=1 sm=1 tr=0 ts=67e333ed cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=wNHophStVnEZgpLo_8MA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_10,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250152
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

On 25/03/2025 21:21, Christopher Obbard wrote:
> Some eDP devices report DP_EDP_PWMGEN_BIT_COUNT as 0, but still provide
> valid non-zero MIN and MAX values. This patch reworks the logic to
> fallback to the max value in such cases, ensuring correct backlight PWM
> configuration even when the bit count value is not explicitly set.

I don't think this matches the eDP standard. It tells to use MIN if 
BIT_COUNT is less than MIN, if I understand it correctly.

> 
> This improves compatibility with eDP panels (e.g. Samsung ATNA40YK20
> used on the Lenovo T14s Gen6 Snapdragon with OLED panel) which reports
> DP_EDP_PWMGEN_BIT_COUNT as 0 but still provides valid non-zero MIN/MAX
> values.
> 
> Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>   drivers/gpu/drm/display/drm_dp_helper.c | 51 ++++++++++++++++++++++-----------
>   1 file changed, 34 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index da3c8521a7fa7d3c9761377363cdd4b44ab1106e..734b7b8e46394de21837cda6ca1b189413b25cd8 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -3964,7 +3964,7 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
>   {
>   	int fxp, fxp_min, fxp_max, fxp_actual, f = 1;
>   	int ret;
> -	u8 pn, pn_min, pn_max;
> +	u8 pn, pn_min, pn_max, bl_caps;
>   
>   	if (!bl->aux_set)
>   		return 0;
> @@ -3975,8 +3975,40 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
>   			    aux->name, ret);
>   		return -ENODEV;
>   	}
> -
>   	pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> +
> +	ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> +	if (ret != 1) {
> +		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> +			    aux->name, ret);
> +		return 0;
> +	}
> +	pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> +
> +	ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> +	if (ret != 1) {
> +		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> +			    aux->name, ret);
> +		return 0;
> +	}
> +	pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> +
> +	ret = drm_dp_dpcd_readb(aux, DP_EDP_BACKLIGHT_ADJUSTMENT_CAP, &bl_caps);
> +	if (ret != 1) {
> +		bl_caps = 0;
> +		drm_dbg_kms(aux->drm_dev, "%s: Failed to read backlight adjustment cap: %d\n",
> +			aux->name, ret);
> +	}
> +
> +	/*
> +	 * Some eDP panels report brightness byte count support, but the byte count
> +	 * reading is 0 (e.g. Samsung ATNA40YK20) so in these cases use pn_max
> +	 * for pn.
> +	 */
> +	if (!pn && (bl_caps & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
> +	    && pn_max)
> +		pn = pn_max;
> +
>   	bl->max = (1 << pn) - 1;
>   	if (!driver_pwm_freq_hz)
>   		return 0;
> @@ -4003,21 +4035,6 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
>   	 * - FxP is within 25% of desired value.
>   	 *   Note: 25% is arbitrary value and may need some tweak.
>   	 */
> -	ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> -	if (ret != 1) {
> -		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> -			    aux->name, ret);
> -		return 0;
> -	}
> -	ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> -	if (ret != 1) {
> -		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> -			    aux->name, ret);
> -		return 0;
> -	}
> -	pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> -	pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> -
>   	/* Ensure frequency is within 25% of desired value */
>   	fxp_min = DIV_ROUND_CLOSEST(fxp * 3, 4);
>   	fxp_max = DIV_ROUND_CLOSEST(fxp * 5, 4);
> 


-- 
With best wishes
Dmitry
