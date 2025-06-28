Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A8BAEC933
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 19:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B0A10E1AC;
	Sat, 28 Jun 2025 17:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ym4P6UIk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5C110E1AC
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 17:04:44 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55SEJOhu022880
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 17:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Y+P/+AAUedmGIy1SjFHzmVH+
 8sT2rDLwSYIo3Op0q/I=; b=Ym4P6UIkpmbLHBX8iq7w/CvNvpmpXHDsdmp8luJa
 g6lXoB6EASRaSzMwDWHss129PgEnSBUSwihy5BSAjKQb3RSKnEpccXhXKvLDjThZ
 DfJmhlm98D0kiDvdvpuodma3pXKp1TAoKhHw98qzfnr/RBWKeK7KZYx3NnwLAbuo
 Nw6sdob0XRx5v/dZ6R1Lk1kbQ0kvKTMd3NIhL/vjgd6cfGaC0IasCrsmi+HSnYs8
 eCTpJwBv6ZxNIZF/IFtnZic0UVCy2bjpfexbQbKAtiZp+ygUEC6uwIlYk2y/ccQi
 2ISlpkN68TSCu3C6wrE2WtBffStLC48CQUHectfpm07j3Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7d9s08v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 17:04:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d38f565974so726934985a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 10:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751130283; x=1751735083;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y+P/+AAUedmGIy1SjFHzmVH+8sT2rDLwSYIo3Op0q/I=;
 b=A1mrFAse7QiyRJ+qqFEYZjjx9XL4CeNWDLQ6t8EV3/Z719xH2iecBexoiNEH/5dpYN
 TvCMQwBHWWLhiTfwtvWnB6N3evyHGtq0wA0fFugXWHSpWJRshKxtxTCVngH7kclw7keu
 k6D4b6Q8hia1JCP8416cRmuHwE2mTUMcYas8X5VSDxNbD4o2chN/qwUFUscu9NlvxEBW
 tUUfzCSu91mmYUR+diwa2FURsR24KMrpld5tFyyMiVvtsPgiiE6zhDYz5wHjnKtKM+ZU
 vJDKs3CDCwblBiZcvFaeGfzkwrFlehbbFurT8/aTksspBitzGZW88MNx9DlmmgHQT1A9
 gDrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGeRxFdWtcVjtUMx8cmRzqmpTguNpm4CDR+it5xqtNXzJeoIYPFmLGKknfo2k8LFJWEpHjwYQNQkc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPDYoS1NN3zfgQSlWg+DJrS3M2j2MqZwpkD6rE1UutK+dz0Dkt
 nTiHt27nuQlp6DIQIittbbSzQPzi96MOseDiA78+/pfRNIZtvG4sCQyYAndE62fXaAAf5/Q2EYb
 DcW7YcdDC3S5UPNAG3qykAmGP4gyE2XjdYnHdo7Q5zewyJ0stJj/dWaU3uxcQFw4Vd9TaFY4=
X-Gm-Gg: ASbGncv5y/mCxy3CHNfgrXEg1QMfRq8sSbfMzPbixbf6BIVMmTDOsCtic5RD89e20J9
 1YB5kOizhvmsxjulQErCCpTgkrwLhXKsXQoHbdq2QAw2kFYSPYJJPPlFXG5TImSld6jDTjZmGIu
 Sp1kt1nF5k+2PpQg/lFcm/Hk7At9mqWQsui1Ruzav7tlPKLGyEcK2wzEQaWBYWdDQLoFNJagyyW
 oOdE90qOgtk8aOXrKF1yjMAcGZI59XmlizuMoa4hBh51w4x9nJtuP1iEPlc7IddL4ZJQOsKIOEi
 B7Aum92lpWZuxABF5ylHSbJARm4D/WJNqpRPwzqhHmkZthUjQ+VSgASQf+yJyjA876apLhKt8xm
 6WEa0Bpn3LVNvBx/Fglq760kUt2u0zczJTuo=
X-Received: by 2002:a05:620a:a012:b0:7d3:acfa:de46 with SMTP id
 af79cd13be357-7d43bbf2c61mr1408975985a.21.1751130282242; 
 Sat, 28 Jun 2025 10:04:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHM0b1H8XT8JuGjUEDa1qJz8tTa7OLmfjHHbL2N7ZLuNpxRojSNa8erMnxhcxOfcw6QxGHBwA==
X-Received: by 2002:a05:620a:a012:b0:7d3:acfa:de46 with SMTP id
 af79cd13be357-7d43bbf2c61mr1408973285a.21.1751130281800; 
 Sat, 28 Jun 2025 10:04:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32cd2eec862sm8230631fa.85.2025.06.28.10.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jun 2025 10:04:40 -0700 (PDT)
Date: Sat, 28 Jun 2025 20:04:39 +0300
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
Subject: Re: [PATCH v2 drm-dp 06/10] drm/hisilicon/hibmc: add dp mode valid
 check
Message-ID: <qrmfobeguesumq2jjajrqaoyiwatlaz4wcklalmmhjinoql3oe@ulcv7jmocsjo>
References: <20250620093104.2016196-1-shiyongbang@huawei.com>
 <20250620093104.2016196-7-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620093104.2016196-7-shiyongbang@huawei.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDE0MiBTYWx0ZWRfX+e0k/tmo++hG
 4Qj/6alRd3HqZZ4sIuwYcDC1Y+ip7S2jwV0r5M+xzgrj5RlAeOauQitlqlbV5TLlpP9FHQ7bWGU
 m3g4SCTVCJKULFfy4Sgw7mH2ReSTiat4jg3Ou4yeYJUT+tv0AIGj8JxIFqOftdvJDePybnQZAKS
 xmP549zry3ji7RS8vxWmaLOjG7jsgYxkT1xLRIbsz4BlFf/AeYxtkcyBAFVKvQLrII041kmbmOz
 QLjuCjXPeIo+iZxV3LtIk7playzAnQ0cOOujxFzGPYr8wyWk7viJV/Tb7MDuBAK/JI19x+iUZpE
 nbdauayKDKp2Y7MONWqb6/PlfrHMa95LTVja8a2/lqfY3zsbyXtEY1fVTCvqv33avYOwe8fCFWw
 VGFyTN8R1HzB82b7YBLuL/9fszMu6iEizViP296IJTx9xR1fL0be3/5lxAd0lL8zhYfKdop5
X-Proofpoint-GUID: svcvqMS2zV2LAeEz8_wmaTC9atxMXTZu
X-Authority-Analysis: v=2.4 cv=RrbFLDmK c=1 sm=1 tr=0 ts=686020ab cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=XpIS79cx_mmGRX-n0o8A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: svcvqMS2zV2LAeEz8_wmaTC9atxMXTZu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280142
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

On Fri, Jun 20, 2025 at 05:31:00PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> If DP is connected, add mode check and BW check in mode_valid_ctx() to
> ensure DP's cfg is usable.
> 
> Fixes: f9698f802e50 ("drm/hisilicon/hibmc: Restructuring the header dp_reg.h")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v1 -> v2:
>   - delete if (!dp->is_connected) in hibmc_dp_mode_valid(), suggested by Dmitry Baryshkov.
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 10 ++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  6 +++
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 51 +++++++++++++++++++
>  3 files changed, 67 insertions(+)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> index 98cc534ba794..5b1f943b601c 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> @@ -273,6 +273,16 @@ void hibmc_dp_reset_link(struct hibmc_dp *dp)
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
> index c0de796225b7..40f95880b278 100644
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
> +
>  static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
>  {
>  	const struct drm_edid *drm_edid;
> @@ -49,9 +71,38 @@ static int hibmc_dp_detect(struct drm_connector *connector,
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

Why? Is it really fixed to the values in the table?

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
