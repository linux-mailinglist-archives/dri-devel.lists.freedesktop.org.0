Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDA0A2B9AF
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 04:25:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 089AA10EA16;
	Fri,  7 Feb 2025 03:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A37E10EA16
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 03:25:40 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.163])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Ypzm64pmnz1l0nQ;
 Fri,  7 Feb 2025 11:21:58 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id 8FE45180216;
 Fri,  7 Feb 2025 11:25:37 +0800 (CST)
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Fri, 7 Feb 2025 11:25:36 +0800
Message-ID: <0c856c5b-56e1-413d-bb2b-55ba0a2c9258@huawei.com>
Date: Fri, 7 Feb 2025 11:25:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 drm-dp 3/4] drm/hisilicon/hibmc: Add debugfs interface
 to enable colorbar feature and get link status
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <liangjian010@huawei.com>,
 <chenjianmin@huawei.com>, <lidongming5@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <shiyongbang@huawei.com>
References: <20250127032024.1542219-1-shiyongbang@huawei.com>
 <20250127032024.1542219-4-shiyongbang@huawei.com>
 <wvulxrhuyzcsy5dwe7oaipjklqfgsurlkb74szungtq3vsvgs3@73v2lesfdvee>
 <4594feeb-abbd-4f73-b2e9-d375acf3d9c2@huawei.com>
 <AF758F07-1121-4A3F-8A51-85DA530A8B57@linaro.org>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <AF758F07-1121-4A3F-8A51-85DA530A8B57@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.159.166.136]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd500013.china.huawei.com (7.221.188.12)
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

> On 5 February 2025 10:18:00 EET, Yongbang Shi <shiyongbang@huawei.com> wrote:
>>> On Mon, Jan 27, 2025 at 11:20:23AM +0800, Yongbang Shi wrote:
>>>> From: Baihan Li <libaihan@huawei.com>
>>>>
>>>> Create 3 files in drm debugfs:
>>> This definitely needs to be split.
>> Hi Dmitry,
>>
>> Right, I got it. I will split any patch which has mutiple fileds changing blended together.
>>
>>
>>>> colorbar-cfg: Get/Set colorbar cfg
>>> What does that mean?
>>>
>> It's a dp's color bar output, and we have a configuration that
>> we can set color bar's color type and stripe movement.
> What is a DP colour bar?

Hi Dmitry,

Thanks for your asking. Color bar displaying is our DP IP controller's feature. It can be used as a debug method which can check DP controller is working good.

The colorbar displaying doesn't rely on other IPs work in the chip, like: GPU or DDR (vram), becuase colorbar diplaying data generated inside DP controller self.


>>
>>>> hibmc-dp: Get dp link status
>>>> hibmc-dp-edid: Print edid information
>>> edid-decode /sys/class/drm/card0-DP-1/edid ?
>> Yeah, we can directly use "cat" to print edid info by it. I will add comments and
>> example in next series git log.
> What is the benefit in having a nonstandard EDID decoder in the kernel if you can use cat to get hexdump from sysfs and then use any of the tools available for EDID deciding?

Alright, I will delete the edid decoder part.

Thanks,
Baihan.


>>
>>>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>>>> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
>>>> ---
>>>>    drivers/gpu/drm/hisilicon/hibmc/Makefile      |   3 +-
>>>>    drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |   3 +
>>>>    drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  58 +++++
>>>>    drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  44 ++++
>>>>    drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  |  40 +++-
>>>>    drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |   4 +-
>>>>    .../drm/hisilicon/hibmc/hibmc_drm_debugfs.c   | 214 ++++++++++++++++++
>>>>    .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    |   2 +
>>>>    .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |   3 +
>>>>    .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |   2 +
>>>>    10 files changed, 363 insertions(+), 10 deletions(-)
>>>>    create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs.c
>>>>
>>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/Makefile b/drivers/gpu/drm/hisilicon/hibmc/Makefile
>>>> index 35a74cc10c80..c14f5182c067 100644
>>>> --- a/drivers/gpu/drm/hisilicon/hibmc/Makefile
>>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/Makefile
>>>> @@ -1,5 +1,6 @@
>>>>    # SPDX-License-Identifier: GPL-2.0-only
>>>>    hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o \
>>>> -	       dp/dp_aux.o dp/dp_link.o dp/dp_hw.o dp/dp_phy.o hibmc_drm_dp.o
>>>> +	       dp/dp_aux.o dp/dp_link.o dp/dp_hw.o dp/dp_phy.o hibmc_drm_dp.o \
>>>> +	       hibmc_drm_debugfs.o
>>>>      obj-$(CONFIG_DRM_HISI_HIBMC) += hibmc-drm.o
>>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
>>>> index 7edcecd5a5f0..67f6c81a35ed 100644
>>>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
>>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
>>>> @@ -26,6 +26,9 @@ struct hibmc_link_status {
>>>>    struct hibmc_link_cap {
>>>>    	u8 link_rate;
>>>>    	u8 lanes;
>>>> +	int rx_dpcd_revision;
>>>> +	bool is_tps3;
>>>> +	bool is_tps4;
>>>>    };
>>>>      struct hibmc_dp_link {
>>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
>>>> index 50050908606f..9c8b91ff0e3b 100644
>>>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
>>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
>>>> @@ -226,3 +226,61 @@ int hibmc_dp_mode_set(struct hibmc_dp *dp, struct drm_display_mode *mode)
>>>>      	return 0;
>>>>    }
>>>> +
>>>> +u8 hibmc_dp_get_link_rate(struct hibmc_dp *dp)
>>>> +{
>>>> +	return dp->dp_dev->link.cap.link_rate;
>>>> +}
>>>> +
>>>> +u8 hibmc_dp_get_lanes(struct hibmc_dp *dp)
>>>> +{
>>>> +	return dp->dp_dev->link.cap.lanes;
>>>> +}
>>>> +
>>>> +int hibmc_dp_get_dpcd(struct hibmc_dp *dp)
>>>> +{
>>>> +	return dp->dp_dev->link.cap.rx_dpcd_revision;
>>>> +}
>>>> +
>>>> +static const struct hibmc_dp_color_raw g_rgb_raw[] = {
>>>> +	{CBAR_COLOR_BAR, 0x000, 0x000, 0x000},
>>>> +	{CBAR_WHITE,     0xfff, 0xfff, 0xfff},
>>>> +	{CBAR_RED,       0xfff, 0x000, 0x000},
>>>> +	{CBAR_ORANGE,    0xfff, 0x800, 0x000},
>>>> +	{CBAR_YELLOW,    0xfff, 0xfff, 0x000},
>>>> +	{CBAR_GREEN,     0x000, 0xfff, 0x000},
>>>> +	{CBAR_CYAN,      0x000, 0x800, 0x800},
>>>> +	{CBAR_BLUE,      0x000, 0x000, 0xfff},
>>>> +	{CBAR_PURPLE,    0x800, 0x000, 0x800},
>>>> +	{CBAR_BLACK,     0x000, 0x000, 0x000},
>>>> +};
>>>> +
>>>> +void hibmc_dp_set_cbar(struct hibmc_dp *dp, const struct hibmc_dp_cbar_cfg *cfg)
>>>> +{
>>>> +	struct hibmc_dp_dev *dp_dev = dp->dp_dev;
>>>> +	struct hibmc_dp_color_raw raw_data;
>>>> +
>>>> +	if (cfg->enable) {
>>>> +		hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, BIT(9),
>>>> +					 cfg->self_timing);
>>>> +		hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, GENMASK(8, 1),
>>>> +					 cfg->dynamic_rate);
>>>> +		if (cfg->pattern == CBAR_COLOR_BAR) {
>>>> +			hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, BIT(10), 0);
>>>> +		} else {
>>>> +			raw_data = g_rgb_raw[cfg->pattern];
>>>> +			drm_dbg_dp(dp->drm_dev, "r:%x g:%x b:%x\n", raw_data.r_value,
>>>> +				   raw_data.g_value, raw_data.b_value);
>>>> +			hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, BIT(10), 1);
>>>> +			hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, GENMASK(23, 12),
>>>> +						 raw_data.r_value);
>>>> +			hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL1, GENMASK(23, 12),
>>>> +						 raw_data.g_value);
>>>> +			hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL1, GENMASK(11, 0),
>>>> +						 raw_data.b_value);
>>>> +		}
>>>> +	}
>>>> +
>>>> +	hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, BIT(0), cfg->enable);
>>>> +	writel(HIBMC_DP_SYNC_EN_MASK, dp_dev->base + HIBMC_DP_TIMING_SYNC_CTRL);
>>>> +}
>>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
>>>> index 53b6d0beecea..f2f59f2feb3c 100644
>>>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
>>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
>>>> @@ -14,6 +14,44 @@
>>>>      struct hibmc_dp_dev;
>>>>    +enum hibmc_dp_cbar_pattern {
>>>> +	CBAR_COLOR_BAR,
>>>> +	CBAR_WHITE,
>>>> +	CBAR_RED,
>>>> +	CBAR_ORANGE,
>>>> +	CBAR_YELLOW,
>>>> +	CBAR_GREEN,
>>>> +	CBAR_CYAN,
>>>> +	CBAR_BLUE,
>>>> +	CBAR_PURPLE,
>>>> +	CBAR_BLACK,
>>>> +};
>>>> +
>>>> +struct hibmc_dp_color_raw {
>>>> +	enum hibmc_dp_cbar_pattern pattern;
>>>> +	u32 r_value;
>>>> +	u32 g_value;
>>>> +	u32 b_value;
>>>> +};
>>>> +
>>>> +struct hibmc_dp_cbar_cfg {
>>>> +	bool enable;
>>>> +	bool self_timing;
>>>> +	u8 dynamic_rate; /* 0:static, 1-255(frame):dynamic */
>>>> +	enum hibmc_dp_cbar_pattern pattern;
>>>> +};
>>>> +
>>>> +enum hibmc_dp_hpd_status {
>>>> +	HIBMC_DP_HPD_DETECTING,
>>>> +	HIBMC_DP_HPD_IN,
>>>> +	HIBMC_DP_HPD_OUT,
>>>> +	HIBMC_DP_HPD_SHORT, /* Short hpd (irq_hpd) */
>>>> +	HIBMC_DP_HPD_DET_FAIL,
>>>> +	HIBMC_DP_HPD_IN_SIMULATE,
>>>> +	HIBMC_DP_HPD_OUT_SIMULATE,
>>>> +	HIBMC_DP_HPD_SHORT_SIMULATE,
>>>> +};
>>>> +
>>>>    struct hibmc_dp {
>>>>    	struct hibmc_dp_dev *dp_dev;
>>>>    	struct drm_device *drm_dev;
>>>> @@ -21,10 +59,16 @@ struct hibmc_dp {
>>>>    	struct drm_connector connector;
>>>>    	void __iomem *mmio;
>>>>    	struct drm_dp_aux aux;
>>>> +	struct hibmc_dp_cbar_cfg cfg;
>>>> +	bool is_inited;
>>>>    };
>>>>      int hibmc_dp_hw_init(struct hibmc_dp *dp);
>>>>    int hibmc_dp_mode_set(struct hibmc_dp *dp, struct drm_display_mode *mode);
>>>>    void hibmc_dp_display_en(struct hibmc_dp *dp, bool enable);
>>>> +int hibmc_dp_get_dpcd(struct hibmc_dp *dp);
>>>> +u8 hibmc_dp_get_link_rate(struct hibmc_dp *dp);
>>>> +u8 hibmc_dp_get_lanes(struct hibmc_dp *dp);
>>>> +void hibmc_dp_set_cbar(struct hibmc_dp *dp, const struct hibmc_dp_cbar_cfg *cfg);
>>>>      #endif
>>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
>>>> index 695cb9c0b643..20849f1ebd0c 100644
>>>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
>>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
>>>> @@ -4,9 +4,11 @@
>>>>    #include <linux/delay.h>
>>>>    #include <drm/drm_device.h>
>>>>    #include <drm/drm_print.h>
>>>> +
>>>>    #include "dp_comm.h"
>>>>    #include "dp_reg.h"
>>>>    #include "dp_phy.h"
>>>> +#include "dp_config.h"
>>>>      #define HIBMC_EQ_MAX_RETRY 5
>>>>    @@ -42,11 +44,7 @@ static int hibmc_dp_link_training_configure(struct hibmc_dp_dev *dp)
>>>>    		return ret >= 0 ? -EIO : ret;
>>>>    	}
>>>>    -	ret = drm_dp_read_dpcd_caps(dp->aux, dp->dpcd);
>>>> -	if (ret)
>>>> -		drm_err(dp->dev, "dp aux read dpcd failed, ret: %d\n", ret);
>>>> -
>>>> -	return ret;
>>>> +	return 0;
>>>>    }
>>>>      static int hibmc_dp_link_set_pattern(struct hibmc_dp_dev *dp, int pattern)
>>>> @@ -189,15 +187,17 @@ static int hibmc_dp_link_training_cr(struct hibmc_dp_dev *dp)
>>>>    	bool level_changed;
>>>>    	u32 voltage_tries;
>>>>    	u32 cr_tries;
>>>> +	u32 max_cr;
>>>>    	int ret;
>>>>      	/*
>>>>    	 * DP 1.4 spec define 10 for maxtries value, for pre DP 1.4 version set a limit of 80
>>>>    	 * (4 voltage levels x 4 preemphasis levels x 5 identical voltage retries)
>>>>    	 */
>>>> +	 max_cr = dp->link.cap.rx_dpcd_revision >= DP_DPCD_REV_14 ? 10 : 80;
>>>>      	voltage_tries = 1;
>>>> -	for (cr_tries = 0; cr_tries < 80; cr_tries++) {
>>>> +	for (cr_tries = 0; cr_tries < max_cr; cr_tries++) {
>>>>    		drm_dp_link_train_clock_recovery_delay(dp->aux, dp->dpcd);
>>>>      		ret = drm_dp_dpcd_read_link_status(dp->aux, lane_status);
>>>> @@ -234,7 +234,7 @@ static int hibmc_dp_link_training_cr(struct hibmc_dp_dev *dp)
>>>>    		voltage_tries = level_changed ? 1 : voltage_tries + 1;
>>>>    	}
>>>>    -	drm_err(dp->dev, "dp link training clock recovery 80 times failed\n");
>>>> +	drm_err(dp->dev, "dp link training clock recovery %u times failed\n", max_cr);
>>>>    	dp->link.status.clock_recovered = false;
>>>>      	return 0;
>>>> @@ -244,9 +244,17 @@ static int hibmc_dp_link_training_channel_eq(struct hibmc_dp_dev *dp)
>>>>    {
>>>>    	u8 lane_status[DP_LINK_STATUS_SIZE] = {0};
>>>>    	u8 eq_tries;
>>>> +	int tps;
>>>>    	int ret;
>>>>    -	ret = hibmc_dp_link_set_pattern(dp, DP_TRAINING_PATTERN_2);
>>>> +	if (dp->link.cap.is_tps4)
>>>> +		tps = DP_TRAINING_PATTERN_4;
>>>> +	else if (dp->link.cap.is_tps3)
>>>> +		tps = DP_TRAINING_PATTERN_3;
>>>> +	else
>>>> +		tps = DP_TRAINING_PATTERN_2;
>>>> +
>>>> +	ret = hibmc_dp_link_set_pattern(dp, tps);
>>>>    	if (ret)
>>>>    		return ret;
>>>>    @@ -313,11 +321,27 @@ static int hibmc_dp_link_downgrade_training_eq(struct hibmc_dp_dev *dp)
>>>>    	return hibmc_dp_link_reduce_rate(dp);
>>>>    }
>>>>    +static void hibmc_dp_update_caps(struct hibmc_dp_dev *dp)
>>>> +{
>>>> +	dp->link.cap.rx_dpcd_revision = dp->dpcd[DP_DPCD_REV];
>>>> +
>>>> +	dp->link.cap.is_tps3 = (dp->dpcd[DP_DPCD_REV] >= DP_DPCD_REV_13) &&
>>>> +			       (dp->dpcd[DP_MAX_LANE_COUNT] & DP_TPS3_SUPPORTED);
>>>> +	dp->link.cap.is_tps4 = (dp->dpcd[DP_DPCD_REV] >= DP_DPCD_REV_14) &&
>>>> +			       (dp->dpcd[DP_MAX_DOWNSPREAD] & DP_TPS4_SUPPORTED);
>>>> +}
>>>> +
>>>>    int hibmc_dp_link_training(struct hibmc_dp_dev *dp)
>>>>    {
>>>>    	struct hibmc_dp_link *link = &dp->link;
>>>>    	int ret;
>>>>    +	ret = drm_dp_read_dpcd_caps(dp->aux, dp->dpcd);
>>>> +	if (ret)
>>>> +		drm_err(dp->dev, "dp aux read dpcd failed, ret: %d\n", ret);
>>>> +
>>>> +	hibmc_dp_update_caps(dp);
>>>> +
>>>>    	while (true) {
>>>>    		ret = hibmc_dp_link_training_cr_pre(dp);
>>>>    		if (ret)
>>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
>>>> index 99ba9c951c41..c43ad6b30c2c 100644
>>>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
>>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
>>>> @@ -23,6 +23,8 @@
>>>>    #define HIBMC_DP_VIDEO_MSA1			0x11c
>>>>    #define HIBMC_DP_VIDEO_MSA2			0x120
>>>>    #define HIBMC_DP_VIDEO_HORIZONTAL_SIZE		0X124
>>>> +#define HIBMC_DP_COLOR_BAR_CTRL			0x260
>>>> +#define HIBMC_DP_COLOR_BAR_CTRL1		0x264
>>>>    #define HIBMC_DP_TIMING_GEN_CONFIG0		0x26c
>>>>    #define HIBMC_DP_TIMING_GEN_CONFIG2		0x274
>>>>    #define HIBMC_DP_TIMING_GEN_CONFIG3		0x278
>>>> @@ -72,6 +74,6 @@
>>>>    #define HIBMC_DP_CFG_STREAM_TU_SYMBOL_FRAC_SIZE	GENMASK(9, 6)
>>>>    #define HIBMC_DP_CFG_STREAM_HTOTAL_SIZE		GENMASK(31, 16)
>>>>    #define HIBMC_DP_CFG_STREAM_HBLANK_SIZE		GENMASK(15, 0)
>>>> -#define HIBMC_DP_CFG_STREAM_SYNC_CALIBRATION GENMASK(31, 20)
>>>> +#define HIBMC_DP_CFG_STREAM_SYNC_CALIBRATION	GENMASK(31, 20)
>>>>      #endif
>>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs.c
>>>> new file mode 100644
>>>> index 000000000000..f6885399c2b3
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs.c
>>>> @@ -0,0 +1,214 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>> +// Copyright (c) 2024 Hisilicon Limited.
>>>> +
>>>> +#include <linux/debugfs.h>
>>>> +#include <linux/device.h>
>>>> +#include <linux/seq_file.h>
>>>> +#include <linux/pci.h>
>>>> +
>>>> +#include <drm/drm_drv.h>
>>>> +#include <drm/drm_file.h>
>>>> +#include <drm/drm_debugfs.h>
>>>> +#include <drm/drm_edid.h>
>>>> +
>>>> +#include "hibmc_drm_drv.h"
>>>> +
>>>> +static void hibmc_dump_edid(struct seq_file *m, const struct edid *edid)
>>>> +{
>>>> +	const struct detailed_pixel_timing *pixel_data;
>>>> +	int i;
>>>> +
>>>> +	seq_puts(m, "EDID:\n");
>>>> +	seq_printf(m, "\theader: 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x\n",
>>>> +		   edid->header[0], edid->header[1], edid->header[2], edid->header[3],
>>>> +		   edid->header[4], edid->header[5], edid->header[6], edid->header[7]);
>>>> +
>>>> +	seq_puts(m, "Vendor & product info:\n");
>>>> +	seq_printf(m, "\tmfg_id: 0x%02x 0x%02x\n", edid->mfg_id[0], edid->mfg_id[1]);
>>>> +	seq_printf(m, "\tprod_code: 0x%02x 0x%02x\n", edid->prod_code[0], edid->prod_code[1]);
>>>> +	seq_printf(m, "\tserial: 0x%08x\n", edid->serial);
>>>> +	seq_printf(m, "\tmfg_week/year: 0x%02x 0x%02x\n", edid->mfg_week, edid->mfg_year);
>>>> +
>>>> +	seq_puts(m, "EDID version:\n");
>>>> +	seq_printf(m, "\tversion: 0x%02x\n", edid->version);
>>>> +	seq_printf(m, "\trevision: 0x%02x\n", edid->revision);
>>>> +
>>>> +	seq_puts(m, "Display info:\n");
>>>> +	seq_printf(m, "\tinput: 0x%02x\n", edid->input);
>>>> +	seq_printf(m, "\twidth_cm: 0x%02x\n", edid->width_cm);
>>>> +	seq_printf(m, "\theight_cm: 0x%02x\n", edid->height_cm);
>>>> +	seq_printf(m, "\tgamma: 0x%02x\n", edid->gamma);
>>>> +	seq_printf(m, "\tfeatures: 0x%02x\n", edid->features);
>>>> +
>>>> +	seq_puts(m, "Color characteristics:\n");
>>>> +	seq_printf(m, "\tred_green_lo: 0x%02x\n", edid->red_green_lo);
>>>> +	seq_printf(m, "\tblue/black_white_lo: 0x%02x\n", *(&edid->red_green_lo) + 1);
>>>> +	seq_printf(m, "\tred_x/y: 0x%02x 0x%02x\n", edid->red_x, edid->red_y);
>>>> +	seq_printf(m, "\tgreen_x/y: 0x%02x 0x%02x\n", edid->green_x, edid->green_y);
>>>> +	seq_printf(m, "\tblue_x/y: 0x%02x 0x%02x\n", edid->blue_x, edid->blue_y);
>>>> +	seq_printf(m, "\twhite_x/y: 0x%02x 0x%02x\n", edid->white_x, edid->white_y);
>>>> +
>>>> +	seq_puts(m, "Est. timings and mfg rsvd timings:\n");
>>>> +	seq_printf(m, "\test_timings_t1/2: 0x%02x 0x%02x\n",
>>>> +		   edid->established_timings.t1, edid->established_timings.t2);
>>>> +
>>>> +	seq_puts(m, "Standard timings 1-8:\n");
>>>> +	for (i = 0; i < ARRAY_SIZE(edid->standard_timings); i++) {
>>>> +		seq_printf(m, "\tstandard_timings[%d] hsize/vfreq_aspect: 0x%02x 0x%02x\n",
>>>> +			   i, edid->standard_timings[i].hsize,
>>>> +			   edid->standard_timings[i].vfreq_aspect);
>>>> +	}
>>>> +
>>>> +	seq_puts(m, "Detailing timings 1-4:\n");
>>>> +	for (i = 0; i < ARRAY_SIZE(edid->detailed_timings); i++) {
>>>> +		pixel_data = &edid->detailed_timings[i].data.pixel_data;
>>>> +		seq_printf(m, "\tdetailed_timing[%d] pixel_clock: 0x%04x\n",
>>>> +			   i, edid->detailed_timings[i].pixel_clock);
>>>> +		seq_printf(m, "\tdetailed_timing[%d] hactive: %u\n", i,
>>>> +			   (pixel_data->hactive_hblank_hi & 0xf0) << 4 | pixel_data->hactive_lo);
>>>> +		seq_printf(m, "\tdetailed_timing[%d] vactive: %u\n", i,
>>>> +			   (pixel_data->vactive_vblank_hi & 0xf0) << 4 | pixel_data->vactive_lo);
>>>> +	}
>>>> +
>>>> +	seq_puts(m, "Others:\n");
>>>> +	seq_printf(m, "\textensions: 0x%02x\n", edid->extensions);
>>>> +	seq_printf(m, "\tchecksum: 0x%02x\n", edid->checksum);
>>>> +}
>>>> +
>>>> +static int hibmc_dp_edid_show(struct seq_file *m, void *arg)
>>>> +{
>>>> +	struct drm_info_node *node = m->private;
>>>> +	struct drm_device *dev = node->minor->dev;
>>>> +	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
>>>> +	struct edid *edid;
>>>> +	char name[20];
>>>> +	int idx;
>>>> +
>>>> +	if (!drm_dev_enter(dev, &idx))
>>>> +		return -ENODEV;
>>>> +
>>>> +	edid = drm_get_edid(&priv->dp.connector, &priv->dp.aux.ddc);
>>>> +	if (edid) {
>>>> +		drm_edid_get_monitor_name(edid, name, ARRAY_SIZE(name));
>>>> +		seq_printf(m, "Monitor name: %s\n", name);
>>>> +		hibmc_dump_edid(m, edid);
>>>> +		kfree(edid);
>>>> +	} else {
>>>> +		seq_puts(m, "No connector available!\n");
>>>> +	}
>>>> +
>>>> +	drm_dev_exit(idx);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int hibmc_dp_show(struct seq_file *m, void *arg)
>>>> +{
>>>> +	struct drm_info_node *node = m->private;
>>>> +	struct drm_device *dev = node->minor->dev;
>>>> +	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
>>>> +	int idx;
>>>> +
>>>> +	if (!drm_dev_enter(dev, &idx))
>>>> +		return -ENODEV;
>>>> +
>>>> +	seq_printf(m, "enable lanes: %u\n", hibmc_dp_get_lanes(&priv->dp));
>>>> +	seq_printf(m, "link rate: %d\n", hibmc_dp_get_link_rate(&priv->dp) * 27);
>>>> +	seq_printf(m, "vfresh: %d\n", drm_mode_vrefresh(&priv->crtc.mode));
>>>> +	seq_printf(m, "dpcd version: 0x%x\n", hibmc_dp_get_dpcd(&priv->dp));
>>>> +
>>>> +	drm_dev_exit(idx);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static ssize_t hibmc_control_write(struct file *file, const char __user *user_buf,
>>>> +				   size_t size, loff_t *ppos)
>>>> +{
>>>> +	struct hibmc_drm_private *priv = file_inode(file)->i_private;
>>>> +	struct hibmc_dp_cbar_cfg *cfg = &priv->dp.cfg;
>>>> +	u32 input = 0;
>>>> +	int ret, idx;
>>>> +	u8 val;
>>>> +
>>>> +	ret = kstrtou32_from_user(user_buf, size, 0, &input);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	val = FIELD_GET(GENMASK(13, 10), input);
>>>> +	if (val > 9)
>>>> +		return -EINVAL;
>>>> +	cfg->pattern = val;
>>>> +	cfg->enable = FIELD_GET(BIT(0), input);
>>>> +	cfg->self_timing = FIELD_GET(BIT(1), input);
>>>> +	cfg->dynamic_rate = FIELD_GET(GENMASK(9, 2), input);
>>>> +
>>>> +	ret = drm_dev_enter(&priv->dev, &idx);
>>>> +	if (!ret)
>>>> +		return -ENODEV;
>>>> +
>>>> +	hibmc_dp_set_cbar(&priv->dp, cfg);
>>>> +
>>>> +	drm_dev_exit(idx);
>>>> +
>>>> +	return size;
>>>> +}
>>>> +
>>>> +static int hibmc_dp_dbgfs_show(struct seq_file *m, void *arg)
>>>> +{
>>>> +	struct hibmc_drm_private *priv = m->private;
>>>> +	struct hibmc_dp_cbar_cfg *cfg = &priv->dp.cfg;
>>>> +	u32 output = 0;
>>>> +	int idx;
>>>> +
>>>> +	if (!drm_dev_enter(&priv->dev, &idx))
>>>> +		return -ENODEV;
>>>> +
>>>> +	/* bit[0]: 0: enable colorbar, 1: disable colorbar
>>>> +	 * bit[1]: 0: timing follows XDP, 1: internal self timing
>>>> +	 * bit[2,9]: 0: static colorbar image,
>>>> +	 *           1~255: right shifting a type of color per (1~255)frames
>>>> +	 * bit[10,13]: 0~9: color bar, white, red, orange,
>>>> +	 *             yellow, green, cyan, bule, pupper, black
>>>> +	 */
>>>> +	output = cfg->enable | (cfg->self_timing << 1) |
>>>> +		 (cfg->dynamic_rate << 2) | (cfg->pattern << 10);
>>>> +
>>>> +	drm_dev_exit(idx);
>>>> +
>>>> +	seq_printf(m, "hibmc dp colorbar cfg: %u\n", output);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int hibmc_open(struct inode *inode, struct file *filp)
>>>> +{
>>>> +	return single_open(filp, hibmc_dp_dbgfs_show, inode->i_private);
>>>> +}
>>>> +
>>>> +static const struct file_operations hibmc_dbg_fops = {
>>>> +	.owner   = THIS_MODULE,
>>>> +	.write   = hibmc_control_write,
>>>> +	.read    = seq_read,
>>>> +	.open    = hibmc_open,
>>>> +	.llseek  = seq_lseek,
>>>> +	.release = single_release,
>>>> +};
>>>> +
>>>> +static struct drm_info_list hibmc_debugfs_list[] = {
>>>> +	{ "hibmc-dp", hibmc_dp_show },
>>>> +	{ "hibmc-dp-edid", hibmc_dp_edid_show },
>>>> +};
>>>> +
>>>> +void hibmc_debugfs_register(struct hibmc_drm_private *priv)
>>>> +{
>>>> +	struct drm_connector *dp_conn = &priv->dp.connector;
>>>> +	struct drm_minor *minor = priv->dev.primary;
>>>> +
>>>> +	/* create the file in drm directory, so we don't need to remove manually */
>>>> +	debugfs_create_file("colorbar-cfg", 0200,
>>>> +			    dp_conn->debugfs_entry, priv, &hibmc_dbg_fops);
>>>> +
>>>> +	drm_debugfs_create_files(hibmc_debugfs_list, ARRAY_SIZE(hibmc_debugfs_list),
>>>> +				 minor->debugfs_root, minor);
>>>> +}
>>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
>>>> index fac8485a69d9..cc1f9ee0656f 100644
>>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
>>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
>>>> @@ -146,5 +146,7 @@ int hibmc_dp_init(struct hibmc_drm_private *priv)
>>>>      	drm_connector_attach_encoder(connector, encoder);
>>>>    +	dp->is_inited = true;
>>>> +
>>>>    	return 0;
>>>>    }
>>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>>>> index bade693d9730..3d4d5185c523 100644
>>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>>>> @@ -352,6 +352,9 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
>>>>    		goto err_unload;
>>>>    	}
>>>>    +	if (priv->dp.is_inited)
>>>> +		hibmc_debugfs_register(priv);
>>> Please use debugfs_init() callback for that
>>>
>>>
>>>> +
>>>>    	drm_client_setup(dev, NULL);
>>>>      	return 0;
>>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>>>> index 3ddd71aada66..ff61efb8a2ab 100644
>>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>>>> @@ -69,4 +69,6 @@ int hibmc_ddc_create(struct drm_device *drm_dev, struct hibmc_vdac *connector);
>>>>      int hibmc_dp_init(struct hibmc_drm_private *priv);
>>>>    +void hibmc_debugfs_register(struct hibmc_drm_private *priv);
>>>> +
>>>>    #endif
>>>> -- 
>>>> 2.33.0
>>>>
