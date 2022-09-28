Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A7F5ED8E8
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 11:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C0C10E383;
	Wed, 28 Sep 2022 09:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 819BA10E383
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 09:26:07 +0000 (UTC)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Mcrdr1GbWzHqLK;
 Wed, 28 Sep 2022 17:23:44 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 17:26:01 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 17:26:00 +0800
Subject: Re: [PATCH -next v3] backlight: gpio_backlight: Switch to use
 dev_err_probe() helper
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>
References: <20220927033138.1945842-1-yangyingliang@huawei.com>
 <YzLW6zo/7k031jzi@maple.lan> <YzQPqjinYYAZdcR+@google.com>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <982139ba-2bc4-8865-f50d-4eaf78ed8bef@huawei.com>
Date: Wed, 28 Sep 2022 17:25:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <YzQPqjinYYAZdcR+@google.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
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
Cc: jingoohan1@gmail.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, yangyingliang@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2022/9/28 17:11, Lee Jones wrote:
> On Tue, 27 Sep 2022, Daniel Thompson wrote:
>
>> On Tue, Sep 27, 2022 at 11:31:38AM +0800, Yang Yingliang wrote:
>>> In the probe path, dev_err() can be replaced with dev_err_probe()
>>> which will check if error code is -EPROBE_DEFER and prints the
>>> error name. It also sets the defer probe reason which can be
>>> checked later through debugfs. It's more simple in error path.
>>>
>>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
>
> The original patch is not in my inbox.
>
> Was I missed from the original mail?
I have already add your mail address to my Cc list, when sending the patch.

Here is the early mail:
V1:
https://lore.kernel.org/linux-fbdev/f98b2e35-0f86-ffd0-db11-ca91930e153f@huawei.com/T/#t

V2:
https://lore.kernel.org/linux-fbdev/7d8cfce2-ba08-afc0-de2d-972ee15b5865@huawei.com/T/#t

Thanks,
Yang
