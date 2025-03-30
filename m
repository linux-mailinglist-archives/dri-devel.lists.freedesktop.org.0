Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6A8A75AFE
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 18:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65A510E034;
	Sun, 30 Mar 2025 16:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EvUngePt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D92910E034
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 16:42:42 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UBkmsl012268
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 16:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2c7VAj6oZezUjqS0g/zhDcwS
 n5ZRsY+g+U78pPkscZs=; b=EvUngePtFhXqLcWJjbNm0ZwdGeUYkvW7sHKCcGCY
 v/9SnwYtEX2boOD8q3HoEIAurXdgazXcG5Sh2nhCDoVKX7aBpkZaoHx02Kex6kNk
 Ii0gInrhc4ZXZqwcdPb3x/c+ck4KwXsvVY58gc5MgH0lgKQ65RHN3xTfrFr3wI3F
 LB+yQFh8bjLARvewtSut1BTeTlJYUfvxr2lJZd8tOY5L9f1jeidThO+tBe9lqDL9
 8eTPcDCYQcoRS2L6mlfACC7WxCuBocpnjXML8XNMp/+1/HiMaSlAb5m0MmHtz3Ff
 Bym5wOQXRHQgbwjBrsoD/sqhLNBdphZL/3nafahLHCJ6Vg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p9mjjek5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 16:42:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c09f73873fso572722585a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 09:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743352960; x=1743957760;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2c7VAj6oZezUjqS0g/zhDcwSn5ZRsY+g+U78pPkscZs=;
 b=RCclpW5wm9d4BWglNcF2xI6WTTg2CX6ce6sITQd66a4g16YdbhQfMaPNUJTp3XiMZS
 g20S0bP5nxkYp7mX7XVnodjNNe4ZoqNl9CJyeDOCwpthjfj7f4nv4BN63DeL2gIwHp66
 mVJTw1DlHFGrcBabyXgsHIrHNpTzoMGueu48JnKU3RNm4N+BPXIP9tTJ0oSaALiBW8gS
 tCb5s5YfNyoJ1mAWNvCEyDl7MYTlAU7aqluy4D4InggX/f963O3SgyjjxJr+61qw7FV9
 zkVihbvYVoUrG9LIuJoh5Takoxgc9F1svodln71qhu0xsqdy4oxUQzb7Q3+Sbl9P+LTQ
 FxPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZYOZQ3H9WO7jX4ZbMohYlpEOOkTutvN0bQ3Z91yKKPequu8tyBMF53JNPoHj4RY+jL1wu0CrDZB8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yygy/T/8dHZrBYEIUQveHabNMUmECnhy+2iun/b1CvB1gsZu2hR
 rhG8IclFSAHk0lmtkEGt4K3VuTcfYDr9yKRcbKYuhRQ/QJIjCKmhcxB4WNTSx7GPEIzQeJhGzTl
 VJwU05yZ1eeih48yTPutTQlmS5lhZCC21zOyh3saTIXPuIeex0nSjeu88/BamYb1sreQ=
X-Gm-Gg: ASbGnctlpxAbknzjMAoo4OTaMUxEVATCRHf0ZC16euwnLlV6bID+V9dey5VWLJ78iZc
 kW5F03jkoo5FFAzhIFX4dwdRh9VvCtN7JKq+iKCU7Ko+/bq2YJADlwcgpQSbkGQ9EemMl2Rv0ao
 fLUXuKOz2vfkDYzZaLO+ifX5hAiF0t3V+3Vn6bGptXI9MXW6CBiDAsqTRvrKRiN1ndTgAkxCek4
 /WwBqhnq6ztRURP068XaH0EPmNG3j+WF5Z9/vTpGwURjxSVmwDU1QDgH0XqoW3+TF76FdGI1q58
 HSA0oFCT9YtscBevx9qkBomf3g5jJZXy/AN79OZiUe4Yi3tL4YMfZkOUYRN78xv9I1zZdpoOaXd
 yAU4=
X-Received: by 2002:a05:620a:458c:b0:7c5:3d60:7f8d with SMTP id
 af79cd13be357-7c68fc9c402mr911720085a.19.1743352959991; 
 Sun, 30 Mar 2025 09:42:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCIzIi7g52NwVxst4mfNlMk8AjJrAgYdK/vBFieD+l+leyTw0tPF0g9AzesR+Nq/A7ykDVZg==
X-Received: by 2002:a05:620a:458c:b0:7c5:3d60:7f8d with SMTP id
 af79cd13be357-7c68fc9c402mr911717585a.19.1743352959617; 
 Sun, 30 Mar 2025 09:42:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30dd2aa9118sm11434341fa.14.2025.03.30.09.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 09:42:37 -0700 (PDT)
Date: Sun, 30 Mar 2025 19:42:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v3] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
Message-ID: <qub7j44btsgd2vdn67jn65c7y7kx4dhjojoh4z5erjalugctad@fyenu2xkuo4b>
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v3-1-156801d97a8a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v3-1-156801d97a8a@linaro.org>
X-Authority-Analysis: v=2.4 cv=Mfhsu4/f c=1 sm=1 tr=0 ts=67e97481 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=OSTsWiK5mPPzubgpfckA:9
 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: gRplweO3d1SNnIIFHUUdLoBo9jopvJr-
X-Proofpoint-GUID: gRplweO3d1SNnIIFHUUdLoBo9jopvJr-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300116
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

On Sun, Mar 30, 2025 at 05:31:20PM +0100, Christopher Obbard wrote:
> According to the eDP specification (VESA Embedded DisplayPort Standard
> v1.4b, Section 3.3.10.2), if the value of DP_EDP_PWMGEN_BIT_COUNT is
> less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, the sink is required to use
> the MIN value as the effective PWM bit count.
> 
> This commit updates the logic to clamp the reported
> DP_EDP_PWMGEN_BIT_COUNT to the range defined by
> DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN and _CAP_MAX. This ensures correct
> handling of eDP panels that report a zero PWM bit count but still
> provide valid non-zero MIN and MAX capability values. Without this
> clamping, brightness values may be interpreted incorrectly, leading
> to a dim or non-functional backlight.
> 
> For example, the Samsung ATNA40YK20 OLED panel used in the Lenovo
> ThinkPad T14s Gen6 (Snapdragon) reports a PWM bit count of 0, but
> supports AUX backlight control and declares a valid 11-bit range.
> Clamping ensures brightness scaling works as intended on such panels.
> 
> Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
> Changes in v3:
> - Properly rebase patch on top of latest version of drm-misc-next.
> - Make patch more generic by clamping PWM bit count to advertised MIN
>   and MAX capabilities (suggested by Dmitry).
> - Link to v2: https://lore.kernel.org/r/20250327-wip-obbardc-qcom-t14s-oled-panel-brightness-v2-1-16dc3ee00276@linaro.org
> 
> Changes in v2:
> - Split backlight brightness patch from T14s OLED enablement series.
> - Use PWMGEN_CAP_MIN rather than MAX (Dmitry).
> - Rework commit message to reference eDP spec.
> - Rebase on drm-misc-next.
> - Link to v1: https://lore.kernel.org/all/20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org/
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 48 ++++++++++++++++++++-------------
>  1 file changed, 30 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index e2439c8a7fefe116b04aaa689b557e2387b05540..fcc26cb96a51066a503433b2dc660126155d179c 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -28,6 +28,7 @@
>  #include <linux/init.h>
>  #include <linux/iopoll.h>
>  #include <linux/kernel.h>
> +#include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/sched.h>
>  #include <linux/seq_file.h>
> @@ -4033,8 +4034,33 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
>  			    aux->name, ret);
>  		return -ENODEV;
>  	}
> -

Nitpick: please keep the empty line.

>  	pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> +
> +	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> +	if (ret != 1) {

No. Please take a look a few lines below, where you are removing
corresponding lines.

> +		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> +			    aux->name, ret);
> +		return -ENODEV;

Hmm. Why? It was 'return 0' before and your commit message contains no
explanation.

> +	}
> +	pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> +
> +	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> +	if (ret != 1) {
> +		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> +			    aux->name, ret);
> +		return -ENODEV;
> +	}
> +	pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> +
> +	/*
> +	 * Per VESA eDP Spec v1.4b, section 3.3.10.2:
> +	 * If DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
> +	 * the sink must use the MIN value as the effective PWM bit count.
> +	 * Clamp the reported value to the [MIN, MAX] capability range to ensure
> +	 * correct brightness scaling on compliant eDP panels.
> +	 */
> +	pn = clamp(pn, pn_min, pn_max);
> +
>  	bl->max = (1 << pn) - 1;
>  	if (!driver_pwm_freq_hz)
>  		return 0;
> @@ -4054,29 +4080,15 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
>  	 */
>  	fxp = DIV_ROUND_CLOSEST(1000 * DP_EDP_BACKLIGHT_FREQ_BASE_KHZ, driver_pwm_freq_hz);
>  
> -	/* Use highest possible value of Pn for more granularity of brightness adjustment while
> +	/*
> +	 * Ensure frequency is within 25% of desired value.
> +	 * Use highest possible value of Pn for more granularity of brightness adjustment while

Huh? I don't see a corresponding code change. If you are fixing the
comment, it should come as a separate commit.

>  	 * satisfying the conditions below.
>  	 * - Pn is in the range of Pn_min and Pn_max
>  	 * - F is in the range of 1 and 255
>  	 * - FxP is within 25% of desired value.
>  	 *   Note: 25% is arbitrary value and may need some tweak.
>  	 */
> -	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> -	if (ret < 0) {
> -		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> -			    aux->name, ret);
> -		return 0;
> -	}
> -	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> -	if (ret < 0) {
> -		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> -			    aux->name, ret);
> -		return 0;
> -	}
> -	pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> -	pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> -
> -	/* Ensure frequency is within 25% of desired value */
>  	fxp_min = DIV_ROUND_CLOSEST(fxp * 3, 4);
>  	fxp_max = DIV_ROUND_CLOSEST(fxp * 5, 4);
>  	if (fxp_min < (1 << pn_min) || (255 << pn_max) < fxp_max) {

-- 
With best wishes
Dmitry
