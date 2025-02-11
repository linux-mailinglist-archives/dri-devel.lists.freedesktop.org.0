Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9E7A30396
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 07:28:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C96910E106;
	Tue, 11 Feb 2025 06:28:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71D8610E106
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 06:28:40 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4YsWdn383gzWfmB;
 Tue, 11 Feb 2025 14:25:17 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id 6B11214022E;
 Tue, 11 Feb 2025 14:28:37 +0800 (CST)
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 11 Feb 2025 14:28:35 +0800
Message-ID: <b368e760-339f-48ba-98ee-ae52645d3723@huawei.com>
Date: Tue, 11 Feb 2025 14:28:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 drm-dp 1/7] drm/hisilicon/hibmc: Add dp phy cfg to
 adjust serdes rate, voltage and pre-emphasis
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <liangjian010@huawei.com>,
 <chenjianmin@huawei.com>, <lidongming5@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <shiyongbang@huawei.com>
References: <20250210144959.100551-1-shiyongbang@huawei.com>
 <20250210144959.100551-2-shiyongbang@huawei.com>
 <63t7lgayor3rpsdbeluwjt6ccohmsz4facj6illae6wn5nhbu4@kek3iggrioq4>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <63t7lgayor3rpsdbeluwjt6ccohmsz4facj6illae6wn5nhbu4@kek3iggrioq4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.159.166.136]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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


> On Mon, Feb 10, 2025 at 10:49:53PM +0800, Yongbang Shi wrote:
>> From: Baihan Li <libaihan@huawei.com>
>>
>> This serdes is inited and configured for dp, and integrating them into dp
>> init and dp link training process.
>> For rate changing, we can change from 1.62-8.2Gpbs by cfg reg.
>> For voltage and pre-emphasis levels changing, we can cfg different
>> serdes ffe value.
>>
>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
>> ---
>> ChangeLog:
>> v1 -> v2:
>>    - splittting the patch and add more detailed the changes in the commit message, suggested by Dmitry Baryshkov.
>>    - changing all names of dp phy to dp serdes.
> Nit: subject still mentions phy.
>
> Nit #2: The s/phy/serdes/ doesn't change the fact that you are still
> doing PHY-like programming. As such, please mention in the commit
> message that using PHY subsystem is impossible for you.

Hi Dmitry,

Thanks for the review. Our phy cfg is relatively simple, just need two register configurations. Don't need too much

functions, like: power on/off, Initialize, and some complex configurations, so I'm not going to use the phy framework.

I will add in commit too.


Sincerely,

Baihan Li


>> ---
>>   drivers/gpu/drm/hisilicon/hibmc/Makefile      |  2 +-
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  1 +
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  4 +
>>   .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.c    | 74 +++++++++++++++++++
>>   .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.h    | 36 +++++++++
>>   5 files changed, 116 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
>>   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h
>>
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/Makefile b/drivers/gpu/drm/hisilicon/hibmc/Makefile
>> index 95a4ed599d98..43de077d6769 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/Makefile
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/Makefile
>> @@ -1,5 +1,5 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>>   hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o \
>> -	       dp/dp_aux.o dp/dp_link.o dp/dp_hw.o hibmc_drm_dp.o
>> +	       dp/dp_aux.o dp/dp_link.o dp/dp_hw.o dp/dp_serdes.o hibmc_drm_dp.o
>>   
>>   obj-$(CONFIG_DRM_HISI_HIBMC) += hibmc-drm.o
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
>> index 2c52a4476c4d..e7746bc4b592 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
>> @@ -38,6 +38,7 @@ struct hibmc_dp_dev {
>>   	struct mutex lock; /* protects concurrent RW in hibmc_dp_reg_write_field() */
>>   	struct hibmc_dp_link link;
>>   	u8 dpcd[DP_RECEIVER_CAP_SIZE];
>> +	void __iomem *serdes_base;
>>   };
>>   
>>   #define dp_field_modify(reg_value, mask, val)				\
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
>> index a8d543881c09..39fd3687efca 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
>> @@ -7,6 +7,7 @@
>>   #include "dp_comm.h"
>>   #include "dp_reg.h"
>>   #include "dp_hw.h"
>> +#include "dp_serdes.h"
>>   
>>   static void hibmc_dp_set_tu(struct hibmc_dp_dev *dp, struct drm_display_mode *mode)
>>   {
>> @@ -165,6 +166,9 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
>>   
>>   	hibmc_dp_aux_init(dp_dev);
>>   
>> +	if (hibmc_dp_serdes_init(dp_dev))
>> +		return -EAGAIN;
> Can you simply propagate the return value here?
>
>> +
>>   	dp_dev->link.cap.lanes = 0x2;
>>   	dp_dev->link.cap.link_rate = DP_LINK_BW_2_7;
>>   
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
>> new file mode 100644
>> index 000000000000..66586db2268a
>> --- /dev/null
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
>> @@ -0,0 +1,74 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +// Copyright (c) 2024 Hisilicon Limited.
>> +
>> +#include <linux/delay.h>
>> +#include <drm/drm_device.h>
>> +#include <drm/drm_print.h>
>> +#include "dp_comm.h"
>> +#include "dp_config.h"
>> +#include "dp_reg.h"
>> +#include "dp_serdes.h"
>> +
>> +int hibmc_dp_serdes_set_tx_cfg(struct hibmc_dp_dev *dp, u8 train_set[HIBMC_DP_LANE_NUM_MAX])
>> +{
>> +	u32 serdes_tx_cfg[4][4] = { {DP_SERDES_VOL0_PRE0, DP_SERDES_VOL0_PRE1,
> static const
>
>> +				     DP_SERDES_VOL0_PRE2, DP_SERDES_VOL0_PRE3},
>> +				    {DP_SERDES_VOL1_PRE0, DP_SERDES_VOL1_PRE1,
>> +				     DP_SERDES_VOL1_PRE2}, {DP_SERDES_VOL2_PRE0,
>> +				     DP_SERDES_VOL2_PRE1}, {DP_SERDES_VOL3_PRE0}};
>> +	int cfg[2];
>> +	int i;
>> +
>> +	for (i = 0; i < HIBMC_DP_LANE_NUM_MAX; i++) {
>> +		cfg[i] = serdes_tx_cfg[(train_set[i] & 0x3)]
>> +			 [(train_set[i] << DP_TRAIN_PRE_EMPHASIS_SHIFT & 0x3)];
>> +		if (!cfg[i]) {
>> +			cfg[i] = DP_SERDES_VOL3_PRE0;
>> +			drm_warn(dp->dev, "dp serdes cfg beyonds the allowable range\n");
> Is it something that you should be mitigating? Can you return -EINVAL
> instead?

Yeah, I just consider that if it happens we still have chances to try link training.

Alright, I'll just return err.


>> +		}
>> +
>> +		/* lane1 offset is 4 */
>> +		writel(FIELD_PREP(HIBMC_DP_PMA_TXDEEMPH, cfg[i]),
>> +		       dp->serdes_base + HIBMC_DP_PMA_LANE0_OFFSET + i * 4);
>> +	}
>> +
>> +	usleep_range(300, 500);
>> +
>> +	if (readl(dp->serdes_base + HIBMC_DP_LANE_STATUS_OFFSET) != DP_SERDES_DONE) {
>> +		drm_err(dp->dev, "dp serdes cfg failed\n");
> drm_dbg?
>
>> +		return -EAGAIN;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +int hibmc_dp_serdes_rate_switch(u8 rate, struct hibmc_dp_dev *dp)
>> +{
>> +	writel(rate, dp->serdes_base + HIBMC_DP_LANE0_RATE_OFFSET);
>> +	writel(rate, dp->serdes_base + HIBMC_DP_LANE1_RATE_OFFSET);
>> +
>> +	usleep_range(300, 500);
>> +
>> +	if (readl(dp->serdes_base + HIBMC_DP_LANE_STATUS_OFFSET) != DP_SERDES_DONE) {
>> +		drm_err(dp->dev, "dp serdes rate switching failed\n");
>> +		return -EAGAIN;
>> +	}
>> +
>> +	if (rate < DP_SERDES_BW_8_1)
>> +		drm_warn(dp->dev, "reducing serdes rate to :%d\n",
>> +			 rate ? rate * HIBMC_DP_LINK_RATE_CAL * 10 : 162);
> drm_dbg
>
>> +
>> +	return 0;
>> +}
>> +
>> +int hibmc_dp_serdes_init(struct hibmc_dp_dev *dp)
>> +{
>> +	dp->serdes_base = dp->base + HIBMC_DP_HOST_OFFSET;
>> +
>> +	writel(FIELD_PREP(HIBMC_DP_PMA_TXDEEMPH, DP_SERDES_VOL0_PRE0),
>> +	       dp->serdes_base + HIBMC_DP_PMA_LANE0_OFFSET);
>> +	writel(FIELD_PREP(HIBMC_DP_PMA_TXDEEMPH, DP_SERDES_VOL0_PRE0),
>> +	       dp->serdes_base + HIBMC_DP_PMA_LANE1_OFFSET);
>> +
>> +	return hibmc_dp_serdes_rate_switch(DP_SERDES_BW_8_1, dp);
>> +}
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h
>> new file mode 100644
>> index 000000000000..57f7f054f2b7
>> --- /dev/null
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h
>> @@ -0,0 +1,36 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/* Copyright (c) 2025 Hisilicon Limited. */
>> +
>> +#ifndef DP_SERDES_H
>> +#define DP_SERDES_H
>> +
>> +#define HIBMC_DP_HOST_OFFSET		0x10000
>> +#define HIBMC_DP_LANE0_RATE_OFFSET	0x4
>> +#define HIBMC_DP_LANE1_RATE_OFFSET	0xc
>> +#define HIBMC_DP_LANE_STATUS_OFFSET	0x10
>> +#define HIBMC_DP_PMA_LANE0_OFFSET	0x18
>> +#define HIBMC_DP_PMA_LANE1_OFFSET	0x1c
>> +#define HIBMC_DP_PMA_TXDEEMPH		GENMASK(18, 1)
>> +
>> +#define DP_SERDES_VOL0_PRE0		0x280
>> +#define DP_SERDES_VOL0_PRE1		0x2300
>> +#define DP_SERDES_VOL0_PRE2		0x53c0
>> +#define DP_SERDES_VOL0_PRE3		0x8400
>> +#define DP_SERDES_VOL1_PRE0		0x380
>> +#define DP_SERDES_VOL1_PRE1		0x3440
>> +#define DP_SERDES_VOL1_PRE2		0x6480
>> +#define DP_SERDES_VOL2_PRE0		0x500
>> +#define DP_SERDES_VOL2_PRE1		0x4500
>> +#define DP_SERDES_VOL3_PRE0		0x600
> These need some explanation.
>
>> +#define DP_SERDES_BW_8_1		0x3
>> +#define DP_SERDES_BW_5_4		0x2
>> +#define DP_SERDES_BW_2_7		0x1
>> +#define DP_SERDES_BW_1_62		0x0
>> +
>> +#define DP_SERDES_DONE			0x3
>> +
>> +int hibmc_dp_serdes_init(struct hibmc_dp_dev *dp);
>> +int hibmc_dp_serdes_rate_switch(u8 rate, struct hibmc_dp_dev *dp);
>> +int hibmc_dp_serdes_set_tx_cfg(struct hibmc_dp_dev *dp, u8 train_set[HIBMC_DP_LANE_NUM_MAX]);
>> +
>> +#endif
>> -- 
>> 2.33.0
>>
