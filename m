Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7209B7CC9
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 15:26:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9680310E8A9;
	Thu, 31 Oct 2024 14:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6389210E8A9
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 14:26:01 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XfR4m2zlHz1HLpY;
 Thu, 31 Oct 2024 22:21:28 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id 2F88614022F;
 Thu, 31 Oct 2024 22:25:58 +0800 (CST)
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 31 Oct 2024 22:25:56 +0800
Message-ID: <40a6c61d-b5db-40a0-8e2a-cbcd950c382f@huawei.com>
Date: Thu, 31 Oct 2024 22:25:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 drm-dp 1/4] drm/hisilicon/hibmc: add dp aux in hibmc
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <liangjian010@huawei.com>,
 <chenjianmin@huawei.com>, <lidongming5@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241022124148.1952761-1-shiyongbang@huawei.com>
 <20241022124148.1952761-2-shiyongbang@huawei.com>
 <wu2kwdqce7jovidzxhublmpgdhzq4uby65quo7ks44tfjhtgd2@qtfogva3exyg>
 <c418e93a-7305-4ca6-85c1-42bd458f4e7b@huawei.com>
 <CAA8EJppvnAcj5ESHe3t2QBvTGZTpiUUS3K+tJ+4_3Pkuijga0g@mail.gmail.com>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <CAA8EJppvnAcj5ESHe3t2QBvTGZTpiUUS3K+tJ+4_3Pkuijga0g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.159.166.136]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
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

> On Tue, 29 Oct 2024 at 16:15, Yongbang Shi <shiyongbang@huawei.com> wrote:
>>> On Tue, Oct 22, 2024 at 08:41:45PM +0800, Yongbang Shi wrote:
>>>> From: baihan li <libaihan@huawei.com>
>>>> +}
>>>> +
>>>> +enum dpcd_revision {
>>>> +    DPCD_REVISION_10 = 0x10,
>>>> +    DPCD_REVISION_11,
>>>> +    DPCD_REVISION_12,
>>>> +    DPCD_REVISION_13,
>>>> +    DPCD_REVISION_14,
>>> Any reason for ignoring defines in drm_dp.h?
>> Hi Dmitry,
>> I tried it but still can't find it, if you know, can you tell me which macro I can use?
> # define DP_DPCD_REV_10                     0x10
> # define DP_DPCD_REV_11                     0x11
> etc

Thanks, I got it.

Baihan.


>> Thanks,
>> Baihan
>
