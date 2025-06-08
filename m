Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D21BAD1200
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 14:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B78892E4;
	Sun,  8 Jun 2025 12:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yam7pao7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0587892E4
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jun 2025 12:39:11 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558AvhbF002694
 for <dri-devel@lists.freedesktop.org>; Sun, 8 Jun 2025 12:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=FhwPLF22y5DeBcpWpLmDE8eh
 L8hxqm8Q9Bq6MEWmut8=; b=Yam7pao7il3fcftwb2E2abdNIlv+oVyIa2cZrOeL
 8P3ufQIWNaFw3S1mQSYItYCXKVJWrAUlb5p2GWEjsUdrEbtCiGPOWsnLxdxflTuT
 jvam/EIT3NVxzafqxG7bL3E30HQMlxhMmLhOYi2PKlEiATt0YSHd5W9T/IwG7FUa
 Izkk5Lhunoojsj2gLeVMyeRXjhRuttyfjhKisLwW0oXynAzgs1+zdnEqDUovhAdR
 RwmDw4TFWMieIGoH58h2bd/MIzvNcnM6RtO8nHOv9OaraMIZs7r9Arz3TM7xpu7R
 +rwjgaB8/7RnOZHGhAqQ37HZhajg89TfrSaXnMLLCmEZLA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9jwuv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 12:39:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d38fe2eff2so109055485a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 05:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749386350; x=1749991150;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FhwPLF22y5DeBcpWpLmDE8ehL8hxqm8Q9Bq6MEWmut8=;
 b=EZSqIfX0un+7mzXsUSe8mW1foabDwKaXQ/IKd6F0Sn8LlYQ9AtBtXJHbMP+1m5zaXj
 QNXaOL0FBWeN9aZ8t6poIuw8REKhbamcPFBxvLRl4kVXktYvv2leLe1I0/zyR0rDWCLb
 NkdrwGqfbanTSdk9C64eWWOMnSNsSR0pmkRdgHd+14f3R6gq6i1oIP2wsf3F8PfdK3qj
 iezYyEfoJsjaSUAGMpeQxOSBkVgAo7ADiYk0pkCLtxd0ytHaDeCrvbidyd8rAwFw1mRO
 Vl7RpcIOaVt4rQLffVA/iOb/i0flCD2hVkzXPT4zsyuMb6Q+7xWrrws8RvdKonkqUqq7
 gGSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOfTvqxCCcFxMBp3Ta7JUfLMiKtokJ8+x1YXRLzqQIo+ICE2FmkPq2aHqEYb29GGj1YpLMzkUjTRk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyxn3MzmfIi6jDV4ggg4wZa9+fplKkgL5Vtku44eoQ9nzw4L2bT
 35DyuLnpp+TUQVABD1+3pqgGZVLyDnWujx6zVei7y/ENsW4NKiVh1mpy5gsSlBskakkrxadhwGC
 eufRuAIw8hOHb3Czh1wHRyyB3IyunL2bIR1nHYE5F8YMXflcs9L6kfXNJqWCSQwzpdyOJZqIeid
 sbpPg=
X-Gm-Gg: ASbGncsEY9Vr70I7jwIY/FWP3zxKNLjDP6khExqKkx+R2gwrARS8SrO4g0lUQj9ljfN
 rV63ARog5Y1jpaAf84PuQV4vDDGqEg4UW+MmL7R5y1eq7RSnoiV9q7cypafjOUxM5eTxQp2gQ4i
 FWUQnPGOnssjX/iSfNrPCApbnei4SkSEY/xmOtd6s/yyhEpZAWB2W/HvfN7gOaRlxyJ57TAoPAm
 LXj3EJwkWdZ2I4RJL86WhOWDo/ppa0s9T4U8DISzxxMBHEZSONYfgxYS8sGIrVuLMMMHe4X6R+m
 Zj6rRHIH+yD2HPUxKrutqH/zkDhgC17zRJa5vJ6XLsZGSxNBb00eLx7BonMTmZ0duZwvol9HxAy
 LQl2cT7XZMw==
X-Received: by 2002:a05:620a:414f:b0:7d0:9d42:732b with SMTP id
 af79cd13be357-7d22988fd2amr1474856185a.20.1749386349714; 
 Sun, 08 Jun 2025 05:39:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBrmaI0yLlwvv7rg4vLo+QCzO5ljo/1uSM+s6PgClh0vc5oPNNo67XI8/SxJOf1ja4f33LCg==
X-Received: by 2002:a05:620a:414f:b0:7d0:9d42:732b with SMTP id
 af79cd13be357-7d22988fd2amr1474850985a.20.1749386349226; 
 Sun, 08 Jun 2025 05:39:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32ae1b0ec70sm7135961fa.13.2025.06.08.05.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jun 2025 05:39:08 -0700 (PDT)
Date: Sun, 8 Jun 2025 15:39:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH drm-dp 06/10] drm/hisilicon/hibmc: add dp mode valid check
Message-ID: <crducdqrsjgf3ot5fbxmicqruwxgoa6qimzt3mxvkhufiawslv@eukwsza6zujp>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-7-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530095432.1206966-7-shiyongbang@huawei.com>
X-Proofpoint-GUID: cJN6LmwWDIjFDFFF-bqw-bJ5fol8QxZ9
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=6845846e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=XbdV3e9dyi12BMDtw4MA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: cJN6LmwWDIjFDFFF-bqw-bJ5fol8QxZ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDA5OSBTYWx0ZWRfXxJ8X9SD2ECeh
 bin4OidmLcpZh8z4t9S7bjDha9Z1eoxxODX1HGhrdJ2dMa956qMZ9nihdPvzjar9LCh1NXkM4aa
 WAZB/93albr8n2Oe5G9cCm21fRwablOK0EzhAS39DSIID8wZ8u7NuvpA77ezSn84/h4GTxRSbPb
 JJRCssdAENCdpAEYOrmbdtZ1Ix9AKKqcboMja8buNUDGyeWQGU1xhGXjRoPEgNOXX20WmGE+Z4p
 zQEP4Lr0+hIxXG8Gkih48idif2o4JTe6bFRbHDe66bYKNU78ux8f/o43cITJrOXKal5TpvEdphU
 ApsbNQ5+8mYVtTIHnDuRNJDe54eBMipi8/tGFiWxiG/QZVFun7nH2U9AS3J1hTUmMdTVeHlc10I
 bto7gPv/yL4DIWMTZst8yWuH+VgEOdEKoBMULvnouiUebVygoboTiz9KRJiag5UYM5NaPms8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506080099
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

On Fri, May 30, 2025 at 05:54:28PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> If DP is connected, add mode check and BW check in mode_valid_ctx() to
> ensure DP's cfg is usable.
> 
> Fixes: f9698f802e50 ("drm/hisilicon/hibmc: Restructuring the header dp_reg.h")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 10 ++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  7 +++
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 59 +++++++++++++++++++
>  3 files changed, 76 insertions(+)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> index ee0b543afd7f..4f93d60b932b 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> @@ -259,6 +259,16 @@ void hibmc_dp_reset_link(struct hibmc_dp *dp)
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
> index 68867475508c..ebc7256ad006 100644
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
> @@ -51,6 +55,7 @@ struct hibmc_dp {
>  	struct hibmc_dp_cbar_cfg cfg;
>  	u32 irq_status;
>  	int hpd_status;
> +	bool is_connected;
>  };
>  
>  int hibmc_dp_hw_init(struct hibmc_dp *dp);
> @@ -61,5 +66,7 @@ void hibmc_dp_reset_link(struct hibmc_dp *dp);
>  void hibmc_dp_hpd_cfg(struct hibmc_dp *dp);
>  void hibmc_dp_enable_int(struct hibmc_dp *dp);
>  void hibmc_dp_disable_int(struct hibmc_dp *dp);
> +u8 hibmc_dp_get_link_rate(struct hibmc_dp *dp);
> +u8 hibmc_dp_get_lanes(struct hibmc_dp *dp);
>  
>  #endif
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> index 191fb434baa7..e4b13f21ccb3 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> @@ -16,8 +16,31 @@
>  #define HIBMC_DP_MASKED_SINK_HPD_PLUG_INT	BIT(2)
>  #define HIBMC_DP_MASKED_SINK_HPD_UNPLUG_INT	BIT(3)
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
> +
>  static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
>  {
> +	struct hibmc_dp *dp = to_hibmc_dp(connector);
>  	const struct drm_edid *drm_edid;
>  	int count;
>  
> @@ -27,6 +50,8 @@ static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
>  
>  	count = drm_edid_connector_add_modes(connector);
>  
> +	dp->is_connected = !!count;
> +
>  	drm_edid_free(drm_edid);
>  
>  	return count;
> @@ -43,9 +68,43 @@ static int hibmc_dp_detect(struct drm_connector *connector,
>  		return connector_status_disconnected;
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
> +	if (!dp->is_connected) {
> +		*status = MODE_OK;

No, mode_valid should not depend on DP being connected.

> +		return 0;
> +	}
> +
> +	/* check DP link BW */
> +	cur_val = (u64)mode->htotal * mode->vtotal * drm_mode_vrefresh(mode) * BPP_24;
> +	max_val = (u64)hibmc_dp_get_link_rate(dp) * DP_MODE_VALI_CAL * hibmc_dp_get_lanes(dp);
> +	if (cur_val > max_val)
> +		*status = MODE_CLOCK_HIGH;
> +	else
> +		*status = MODE_OK;
> +
> +	/* check the clock */
> +	for (size_t i = 0; i < ARRAY_SIZE(hibmc_dp_clk_table); i++) {
> +		if (hibmc_dp_clk_table[i].hdisplay == mode->hdisplay &&
> +		    hibmc_dp_clk_table[i].vdisplay == mode->vdisplay) {
> +			if (hibmc_dp_clk_table[i].clock != mode->clock)
> +				*status = MODE_CLOCK_RANGE;

Why?

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
