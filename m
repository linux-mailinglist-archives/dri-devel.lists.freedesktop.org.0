Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 471A9B17F33
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 11:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A0810E821;
	Fri,  1 Aug 2025 09:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5D310E821
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 09:25:28 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4btgRr1wLfzPt6n;
 Fri,  1 Aug 2025 17:21:12 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
 by mail.maildlp.com (Postfix) with ESMTPS id B336B1402EB;
 Fri,  1 Aug 2025 17:25:26 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 1 Aug 2025 17:25:19 +0800
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 1 Aug 2025 17:25:18 +0800
Message-ID: <28ebf640-ab2b-483c-8aed-d681f6c6ca5e@huawei.com>
Date: Fri, 1 Aug 2025 17:25:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 drm-dp 10/11] drm/hisilicon/hibmc: adapting
 modification for the former commit
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <liangjian010@huawei.com>,
 <chenjianmin@huawei.com>, <fengsheng5@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <jani.nikula@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <shiyongbang@huawei.com>
References: <20250718065125.2892404-1-shiyongbang@huawei.com>
 <20250718065125.2892404-11-shiyongbang@huawei.com>
 <oxwapypy7ttxf7geysnatnowlhidioxbhfyvt5ljrhw4tjmbsr@zycqgbwmwqbc>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <oxwapypy7ttxf7geysnatnowlhidioxbhfyvt5ljrhw4tjmbsr@zycqgbwmwqbc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.159.166.136]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemq100007.china.huawei.com (7.202.195.175)
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


> On Fri, Jul 18, 2025 at 02:51:24PM +0800, Yongbang Shi wrote:
>> From: Baihan Li <libaihan@huawei.com>
>>
>> Add colorbar disable operation before reset chontroller, to make sure
>> colorbar status is clear in the DP init, so if rmmod the driver and the
>> previous colorbar configuration will not affect the next time insmod the
>> driver.
> In this one and in the next one please fix commit subjects. Can't parse
> them.

Sorry about that, I will fix them!


>> Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
>> ---
>> ChangeLog:
>> v2 -> v3:
>>    - fix the issue commit ID, suggested by Dmitry Baryshkov.
>>    - split into 2 commits, suggested by Dmitry Baryshkov.
>>    - add more comments in commit log, suggested by Dmitry Baryshkov.
>> ---
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
>> index 36daf7542d40..85499f1ace8b 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
>> @@ -180,6 +180,8 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
>>   	/* int init */
>>   	writel(0, dp_dev->base + HIBMC_DP_INTR_ENABLE);
>>   	writel(HIBMC_DP_INT_RST, dp_dev->base + HIBMC_DP_INTR_ORIGINAL_STATUS);
>> +	/* clr colorbar */
>> +	writel(0, dp_dev->base + HIBMC_DP_COLOR_BAR_CTRL);
>>   	/* rst */
>>   	writel(0, dp_dev->base + HIBMC_DP_DPTX_RST_CTRL);
>>   	usleep_range(30, 50);
>> -- 
>> 2.33.0
>>
