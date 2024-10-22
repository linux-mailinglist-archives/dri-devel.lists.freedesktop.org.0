Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A03EF9AA203
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 14:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E3910E31A;
	Tue, 22 Oct 2024 12:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F6010E31A
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 12:21:26 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.254])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XXrp44BWNzpX8V;
 Tue, 22 Oct 2024 20:19:24 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id B97D018010F;
 Tue, 22 Oct 2024 20:21:21 +0800 (CST)
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 22 Oct 2024 20:21:20 +0800
Message-ID: <0ba91907-d3f5-4665-9a63-0b10b5d03f38@huawei.com>
Date: Tue, 22 Oct 2024 20:21:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-dp 4/4] drm/hisilicon/hibmc: add dp module in hibmc
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <liangjian010@huawei.com>,
 <chenjianmin@huawei.com>, <lidongming5@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <shiyongbang@huawei.com>
References: <20240930100610.782363-1-shiyongbang@huawei.com>
 <20240930100610.782363-5-shiyongbang@huawei.com>
 <xeemxeld4cqpx47kzb5qqsawk7mu5kje6r7n335dhe2s7ynw6m@eaiowriiilgr>
 <277b126d-e17c-4ef9-a6fe-56f36061606e@huawei.com>
 <CAA8EJpontTXUd0TzvwJZ4gCZ2i6vdB8+PqE+W3ChCuBH3WkfaA@mail.gmail.com>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <CAA8EJpontTXUd0TzvwJZ4gCZ2i6vdB8+PqE+W3ChCuBH3WkfaA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.159.166.136]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
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

Okay, I'll fix them.
Thanks,
Baihan

> On Mon, 21 Oct 2024 at 14:54, s00452708 <shiyongbang@huawei.com> wrote:
>> Thanks, I will modify codes according to your comments, and I also
>> replied some questions or reasons why I did it below.
>>
>>> On Mon, Sep 30, 2024 at 06:06:10PM +0800, shiyongbang wrote:
>>>> From: baihan li <libaihan@huawei.com>
>>>>
>>>> To support DP interface displaying in hibmc driver. Add
>>>> a encoder and connector for DP modual.
>>>>
>>>> Signed-off-by: baihan li <libaihan@huawei.com>
>>>> ---
>>>>    drivers/gpu/drm/hisilicon/hibmc/Makefile      |   2 +-
>>>>    .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 195 ++++++++++++++++++
>>>>    .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  17 +-
>>>>    .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |   5 +
>>>>    4 files changed, 217 insertions(+), 2 deletions(-)
>>>>    create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
>>>>
> [...]
>
>>>> +
>>>> +static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
>>>> +{
>>>> +    int count;
>>>> +
>>>> +    count = drm_add_modes_noedid(connector, connector->dev->mode_config.max_width,
>>>> +                                 connector->dev->mode_config.max_height);
>>>> +    drm_set_preferred_mode(connector, 800, 600); /* default 800x600 */
>>> What? Please parse EDID instead.
>>> I'll add aux over i2c r/w and get edid functions in next patch.
> At least please mention that it's a temporal stub which will be changed later.
>
>>>> +
>>>> +    return count;
>>>> +}
>>>> +
> [...]
>
>>>> @@ -116,10 +120,17 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)
>>>>               return ret;
>>>>       }
>>>>
>>>> +    /* if DP existed, init DP */
>>>> +    if ((readl(priv->mmio + DP_HOST_SERDES_CTRL) &
>>>> +         DP_HOST_SERDES_CTRL_MASK) == DP_HOST_SERDES_CTRL_VAL) {
>>>> +            ret = hibmc_dp_init(priv);
>>>> +            if (ret)
>>>> +                    drm_err(dev, "failed to init dp: %d\n", ret);
>>>> +    }
>>>> +
>>>>       ret = hibmc_vdac_init(priv);
>>>>       if (ret) {
>>>>               drm_err(dev, "failed to init vdac: %d\n", ret);
>>>> -            return ret;
>>> Why?
>>> We have two display cables, if VGA cannot work, this change makes DP
>>> still work.
> But that has nothing to do with init errors. If initialising (aka
> probing) VGA fails, then the driver init should fail. At the runtime
> the VGA and DP should be independent and it should be possible to
> drive just one output, that's true.
>
