Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54460A54DE6
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 15:35:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78DD10E9C1;
	Thu,  6 Mar 2025 14:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018A910E9C1
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 14:35:55 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Z7sLJ6ZQcz1f08P;
 Thu,  6 Mar 2025 22:31:36 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id 9C90F1402C1;
 Thu,  6 Mar 2025 22:35:51 +0800 (CST)
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 6 Mar 2025 22:35:50 +0800
Message-ID: <14555bcf-933d-4322-b1a6-d33e37c55500@huawei.com>
Date: Thu, 6 Mar 2025 22:35:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 drm-dp 3/8] drm/hisilicon/hibmc: Add dp serdes cfg in
 dp process
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <liangjian010@huawei.com>,
 <chenjianmin@huawei.com>, <lidongming5@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <shiyongbang@huawei.com>
References: <20250305112647.2344438-1-shiyongbang@huawei.com>
 <20250305112647.2344438-4-shiyongbang@huawei.com>
 <bg5yiyru6fqnm73qctgullgsdnywdnv2zbcy72mvglxf2uttp4@v2cmuekciqgm>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <bg5yiyru6fqnm73qctgullgsdnywdnv2zbcy72mvglxf2uttp4@v2cmuekciqgm>
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

> On Wed, Mar 05, 2025 at 07:26:42PM +0800, Yongbang Shi wrote:
>> From: Baihan Li <libaihan@huawei.com>
>>
>> Add dp serdes cfg in link training process, and related adapting
>> and modificating. Change some init values about training,
>> because we want completely to negotiation process, so we start with
>> the maximum rate and the electrical characteristic level is 0.
> In the commit message there should be a mention, why are you also
> changing hibmc_kms_init().
>
>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
>> ---
>> ChangeLog:
>> v3 -> v4:
>>    - add comments for if-statement of dp_init(), suggested by Dmitry Baryshkov.
>> v2 -> v3:
>>    - change commit to an imperative sentence, suggested by Dmitry Baryshkov.
>>    - put HIBMC_DP_HOST_SERDES_CTRL in dp_serdes.h, suggested by Dmitry Baryshkov.
>> v1 -> v2:
>>    - splittting the patch and add more detailed the changes in the commit message, suggested by Dmitry Baryshkov.
>> ---
>>   1                                             |  0
>>   .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |  1 +
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  5 ++-
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  | 32 ++++++++++++++++---
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |  5 +++
>>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   | 12 +++----
>>   6 files changed, 43 insertions(+), 12 deletions(-)
>>   create mode 100644 1
>>
> [...]
>
>> @@ -121,9 +119,11 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)
>>   		return ret;
>>   	}
>>   
>> -	/* if DP existed, init DP */
>> -	if ((readl(priv->mmio + HIBMC_DP_HOST_SERDES_CTRL) &
>> -	     HIBMC_DP_HOST_SERDES_CTRL_MASK) == HIBMC_DP_HOST_SERDES_CTRL_VAL) {
>> +	/* if the serdes reg is readable and is not equal to 0,
>> +	 * DP existed, and init DP.
>> +	 */
> Nit: A typical format for block comments is:
>
>    /*
>     * Something Something Something
>     */
>
> Please follow it.

Ok, got it.


>> +	ret = readl(priv->mmio + HIBMC_DP_HOST_SERDES_CTRL);
>> +	if (ret) {
>>   		ret = hibmc_dp_init(priv);
>>   		if (ret)
>>   			drm_err(dev, "failed to init dp: %d\n", ret);
>> -- 
>> 2.33.0
>>
