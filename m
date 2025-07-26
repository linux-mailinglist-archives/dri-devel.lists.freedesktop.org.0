Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BDAB12B49
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 17:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E8910E0BA;
	Sat, 26 Jul 2025 15:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PTZRpZ+I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E91010E0BA
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 15:56:41 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56QE0Aqq031464
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 15:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=tIrPQ8madd5jGCW14pSsiU+Q
 ivNVLu9kNYSOeVPgHuo=; b=PTZRpZ+Ir/Z0zGB4WJXGQP4XPc5xAt/EF92YCcV2
 CMoRLLSwsYrCVuMly4OUFWKX4Nnp7bRZHdR77HfNl0Myjro1/OR4qM3qj1+9hb8u
 LOHSouk6ohGTjL8iHcsPNByNw3/WRtkHHK450sr+EmhJu5fYiBRyGnP2tCeokIwD
 w31w5mUjzFUEaedLU0ZCDJWnf9ml8mzBSpJLLRBw6Jf9gnJQv3wzhQ1709MOsRA1
 cNBXlSVE2acz+ATp4JAIRlWpK4E3At3xVdcdkKDO+XLOcYUAkQnKNJlEeIH86gKb
 MKgGvhpXqxlcA6LKwxkXZoH/p4LAF5/fOLNAstWDDxpsqQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484mqk11uy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 15:56:40 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6fad2a25b65so59708056d6.3
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 08:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753545399; x=1754150199;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tIrPQ8madd5jGCW14pSsiU+QivNVLu9kNYSOeVPgHuo=;
 b=FIFKM+XfRlQelOsowHtO18qWzjAWuNpXh7Bm4dP1qAV5xadIP7qZ1+3Uu5oTkVprvz
 urvDybzHj8v4CFnZ19HPAgkAQg7xNKdbBR/F9Qlse2g4pLOE2DkGrq8t1bRacCvgPDX4
 wrTWCqzpGguT5wMLcxQAi1xsEAPapRQNTBUB9xkNckBXxkTc5Caeyn8GhCbtBQCx1o2l
 NUNtKU4M0RH2DTYGhOmz5fKqFHyiBLxQiaJ5bahIqfrhtuDczIj947Y8SFJZ5FEkmnTE
 89K+844k92+hCOqeAdqZFWj1V2PMi5M2We7uKrEsqi6+fS9tkR7HHmsTeXNNA4RjpRsP
 ejWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrO4dAcjD0AbCpximiEMyMtE+RIT4WZvhb0SRHo7UGCVW3qBYjqy6PZhPvgqnsqKwRyLEsDJPQ738=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/2MCMja3EHlDBFaDSxjjhl1ilk4LHXHCBlYJ26JUwIhjZi+aO
 dhx+Tt5fXtnAyax05HEcVSmC53NWupmb2jyCbqwpoRjZTEK7amUzb+xJNRBdsKyAsEeL+UYM7c2
 hbyG2kK8ymRz9KrlBbY05A0Xs0N+TRtjiHUhXbDO43dlW3cieyrj+7KTHFo6qP56OwsgItBc=
X-Gm-Gg: ASbGnctJP3wU5JqwbPQZQtygarB8VE7nqKXLu3j4UduHmTWKCixDSViz7pONIp34Ssp
 YDySQ3txNDfyoocajBVP6e9q0H5AKrUEI5JrEsWl8Bg2gHp1by7ZRrt3AZqKBsaGvKL4kGy9UD1
 DIo4wo8X0ZGT6SIf/BM0Uad0y+OQeLWxt/lVyzGNQYwo4RgkpBzwzumteqa9M5HOdYPeh7afxt+
 MeQ35dfIu6EMt+IqUhBE/P49G2WubkFHMOAqbF2aCJIMSESfzpX38l5yJSJvX8VPP51ylRJ8K/6
 7ZxvL2/W0p+/TRW+OvVVx/vFiGuTxYrGSLEWi22+JmO0/LGsBgmADt0+FmIjPdRYB0pqyAUlm+R
 qtPhVRO6cP9hiUsOCFxHCkAusagCvh90BHOcDqwRg7R5iBbwDWIFV
X-Received: by 2002:ad4:5ba7:0:b0:707:ba4:a21e with SMTP id
 6a1803df08f44-707204b1297mr70903336d6.1.1753545399017; 
 Sat, 26 Jul 2025 08:56:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFu6/6Qrd0NVqUPcz9xf3nCGfxuIvGW3vtlwlKgmZwdgV3eV2NmRcB5QbvqysWqMLUcGNih9w==
X-Received: by 2002:ad4:5ba7:0:b0:707:ba4:a21e with SMTP id
 6a1803df08f44-707204b1297mr70902886d6.1.1753545398413; 
 Sat, 26 Jul 2025 08:56:38 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-331f426e396sm4837531fa.70.2025.07.26.08.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Jul 2025 08:56:37 -0700 (PDT)
Date: Sat, 26 Jul 2025 18:56:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, fengsheng5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 drm-dp 06/11] drm/hisilicon/hibmc: add dp mode valid
 check
Message-ID: <btqoqwyxfykei6vyhmeczllewxyzf6xvr7r2hhowoentp3tdvi@vxrukpznwujk>
References: <20250718065125.2892404-1-shiyongbang@huawei.com>
 <20250718065125.2892404-7-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718065125.2892404-7-shiyongbang@huawei.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI2MDE0MCBTYWx0ZWRfXxHtLMAfXyjcN
 /oKPWBMYS7yreiL++F/VqU3JOkNyOekNPQYziv4JKJTKQhC/dBkYA+mfIu4AHhYUpajFZchOUuY
 GTQu/MQRfbzMzhp6MtQs1bIt8991FAjpCQSn66ypto1qB/C4wxFMOiPjICS9GCGlDFUrHC0sa++
 QDRyFDld/JeWFuyCkNPjs5hRE0RxIPjFKV2svuhzJh/YGYPYoFE5AOjkUTRf8iEiZiOdiDFQfM2
 n/KeEImiOKwsi442QIRuAHiP/JD/KpmTQM7JG9oT/JXfAL9gJNvHWYhVhyn5sZExosP3UUPvnDU
 M+TFmG9okJJgRG6OMmFxLUhVn7x7vH3e8M4CqzGzwWdZgxFdb0caRzu/snqiBxE89m1nRKLiEw1
 qS+vwEzQ3nvodMvvCGB9Y/L0o/WroWJbZrq+irxDciPH+DsHV5dD9mu6cJyRvqWUdDix6S6R
X-Authority-Analysis: v=2.4 cv=fqPcZE4f c=1 sm=1 tr=0 ts=6884fab8 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=i0EeH86SAAAA:8 a=XbdV3e9dyi12BMDtw4MA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: VrzkAI8se3f3GOBeWLusKdtB_M0OuSRS
X-Proofpoint-ORIG-GUID: VrzkAI8se3f3GOBeWLusKdtB_M0OuSRS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-26_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507260140
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

On Fri, Jul 18, 2025 at 02:51:20PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> If DP is connected, add mode check and BW check in mode_valid_ctx() to
> ensure DP's cfg is usable.
> 
> For example: Some DP's mode(1920x1080 60HZ 138.5 MHz) gives to drm,
> however, the GPU is configured for 148MHz in display_ctrl_adjust() by
> looking up the table of struct hibmc_pll_table{}. This difference will
> cause the DP to not display because the clock the DP gets via drm frame
> is 138MHz.
> 
> Fixes: f9698f802e50 ("drm/hisilicon/hibmc: Restructuring the header dp_reg.h")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 10 ++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  6 +++
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 51 +++++++++++++++++++
>  3 files changed, 67 insertions(+)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> index b4d612047f36..7fbd51ffd778 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> @@ -276,6 +276,16 @@ void hibmc_dp_reset_link(struct hibmc_dp *dp)
>  	dp->dp_dev->link.status.channel_equalized = false;
>  }
>  
> +u8 hibmc_dp_get_link_rate(struct hibmc_dp *dp)
> +{
> +	return dp->dp_dev->link.cap.link_rate;
> +}
> +
> +u8 hibmc_dp_get_lanes(struct hibmc_dp *dp)
> +{
> +	return dp->dp_dev->link.cap.lanes;
> +}
> +
>  static const struct hibmc_dp_color_raw g_rgb_raw[] = {
>  	{CBAR_COLOR_BAR, 0x000, 0x000, 0x000},
>  	{CBAR_WHITE,     0xfff, 0xfff, 0xfff},
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> index 9b45e88e47e4..0059a2648a38 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> @@ -12,6 +12,10 @@
>  #include <drm/drm_print.h>
>  #include <drm/display/drm_dp_helper.h>
>  
> +/* 27 * 10000000 * 80% = 216000000 */
> +#define DP_MODE_VALI_CAL	216000000
> +#define BPP_24				24
> +
>  struct hibmc_dp_dev;
>  
>  enum hibmc_dp_cbar_pattern {
> @@ -62,5 +66,7 @@ void hibmc_dp_reset_link(struct hibmc_dp *dp);
>  void hibmc_dp_hpd_cfg(struct hibmc_dp *dp);
>  void hibmc_dp_enable_int(struct hibmc_dp *dp);
>  void hibmc_dp_disable_int(struct hibmc_dp *dp);
> +u8 hibmc_dp_get_link_rate(struct hibmc_dp *dp);
> +u8 hibmc_dp_get_lanes(struct hibmc_dp *dp);
>  
>  #endif
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> index 354e18bb2998..99b30a6c7e06 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> @@ -15,6 +15,28 @@
>  
>  #define DP_MASKED_SINK_HPD_PLUG_INT	BIT(2)
>  
> +struct hibmc_dp_disp_clk {
> +	u16 hdisplay;
> +	u16 vdisplay;
> +	u32 clock;
> +};
> +
> +static const struct hibmc_dp_disp_clk hibmc_dp_clk_table[] = {
> +	{640, 480, 25175}, /* 25175 khz */
> +	{800, 600, 40000}, /* 40000 khz */
> +	{1024, 768, 65000}, /* 65000 khz */
> +	{1152, 864, 80000}, /* 80000 khz */
> +	{1280, 768, 79500}, /* 79500 khz */
> +	{1280, 720, 74250}, /* 74250 khz */
> +	{1280, 960, 108000}, /* 108000 khz */
> +	{1280, 1024, 108000}, /* 108000 khz */
> +	{1440, 900, 106500}, /* 106500 khz */
> +	{1600, 900, 108000}, /* 108000 khz */
> +	{1600, 1200, 162000}, /* 162000 khz */
> +	{1920, 1080, 148500}, /* 148500 khz */
> +	{1920, 1200, 193250}, /* 193250 khz */
> +};

I generally think that these kind of tables are too limiting. Please try
to achieve the same by checking the clock with the PLL code instead of
checking the modes against the table.

> +
>  static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
>  {
>  	const struct drm_edid *drm_edid;
> @@ -42,9 +64,38 @@ static int hibmc_dp_detect(struct drm_connector *connector,
>  	return connector_status_disconnected;
>  }
>  
> +static int hibmc_dp_mode_valid(struct drm_connector *connector,
> +			       const struct drm_display_mode *mode,
> +			       struct drm_modeset_acquire_ctx *ctx,
> +			       enum drm_mode_status *status)
> +{
> +	struct hibmc_dp *dp = to_hibmc_dp(connector);
> +	u64 cur_val, max_val;
> +
> +	/* check DP link BW */
> +	cur_val = (u64)mode->htotal * mode->vtotal * drm_mode_vrefresh(mode) * BPP_24;
> +	max_val = (u64)hibmc_dp_get_link_rate(dp) * DP_MODE_VALI_CAL * hibmc_dp_get_lanes(dp);
> +
> +	*status = cur_val > max_val ? MODE_CLOCK_HIGH : MODE_OK;
> +
> +	/* check the clock */
> +	for (size_t i = 0; i < ARRAY_SIZE(hibmc_dp_clk_table); i++) {
> +		if (hibmc_dp_clk_table[i].hdisplay == mode->hdisplay &&
> +		    hibmc_dp_clk_table[i].vdisplay == mode->vdisplay) {
> +			if (hibmc_dp_clk_table[i].clock != mode->clock) {
> +				*status = MODE_CLOCK_RANGE;
> +				return 0;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct drm_connector_helper_funcs hibmc_dp_conn_helper_funcs = {
>  	.get_modes = hibmc_dp_connector_get_modes,
>  	.detect_ctx = hibmc_dp_detect,
> +	.mode_valid_ctx = hibmc_dp_mode_valid,
>  };
>  
>  static int hibmc_dp_late_register(struct drm_connector *connector)
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
