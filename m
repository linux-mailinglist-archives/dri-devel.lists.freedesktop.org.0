Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF085F021F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 03:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E9210EC88;
	Fri, 30 Sep 2022 01:11:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A23110EC88
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 01:11:02 +0000 (UTC)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MdsWP29vLz1P70S;
 Fri, 30 Sep 2022 09:06:41 +0800 (CST)
Received: from [10.174.178.41] (10.174.178.41) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 30 Sep 2022 09:10:59 +0800
Message-ID: <1f3deeff-1150-c77f-1773-53d2cb1561b4@huawei.com>
Date: Fri, 30 Sep 2022 09:10:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 2/2] drm/panel: simple: Use dev_err_probe() to simplify
 code
To: Doug Anderson <dianders@chromium.org>
References: <20220929015503.17301-1-yuancan@huawei.com>
 <20220929015503.17301-3-yuancan@huawei.com>
 <CAD=FV=WsTfN_HJ5VA8gLytL=X6O-k=EYLfie5-RAvM81AZkyCQ@mail.gmail.com>
From: Yuan Can <yuancan@huawei.com>
In-Reply-To: <CAD=FV=WsTfN_HJ5VA8gLytL=X6O-k=EYLfie5-RAvM81AZkyCQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.41]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500024.china.huawei.com (7.185.36.10)
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


在 2022/9/30 5:08, Doug Anderson 写道:
> Hi,
>
> On Wed, Sep 28, 2022 at 6:57 PM Yuan Can <yuancan@huawei.com> wrote:
>> In the probe path, dev_err() can be replaced with dev_err_probe()
>> which will check if error code is -EPROBE_DEFER and prints the
>> error name. It also sets the defer probe reason which can be
>> checked later through debugfs.
>>
>> Signed-off-by: Yuan Can <yuancan@huawei.com>
>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>> ---
>>   drivers/gpu/drm/panel/panel-simple.c | 9 +++------
>>   1 file changed, 3 insertions(+), 6 deletions(-)
> Pushed to drm-misc-next:
>
> c9b48b91e2fb drm/panel: simple: Use dev_err_probe() to simplify code
>
> For the other patches in your original series, I'll assume folks
> paying more attention to those panel drivers will commit them. If they
> totally stall for a while, though, then yell and I can try taking a
> look at them. :-)
That's great, Thanks!😁

-- 
Best regards,
Yuan Can

