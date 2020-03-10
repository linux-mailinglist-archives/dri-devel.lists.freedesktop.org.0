Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CBA180C7A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 00:36:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC046E8FA;
	Tue, 10 Mar 2020 23:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D956E853
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 09:40:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0A6ACAC37;
 Tue, 10 Mar 2020 09:40:19 +0000 (UTC)
Subject: Re: [PATCH v11 3/5] soc: mediatek: Move mt8173 MMSYS to platform
 driver
To: Stephen Boyd <sboyd@kernel.org>, Enric Balletbo Serra <eballetbo@gmail.com>
References: <20200302110128.2664251-1-enric.balletbo@collabora.com>
 <20200302110128.2664251-4-enric.balletbo@collabora.com>
 <158344207340.7173.8369925839829696256@swboyd.mtv.corp.google.com>
 <8bfc4350-6e92-e657-18f2-3624a2558521@collabora.com>
 <158353062701.66766.10488072352849985568@swboyd.mtv.corp.google.com>
 <CAFqH_51hL07c7z2mBSWMejKwZMkNHPVYiB7JpMPPgck0XycEug@mail.gmail.com>
 <158379424337.149997.7454036134629466675@swboyd.mtv.corp.google.com>
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; prefer-encrypt=mutual; keydata=
 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
 HxUCQ9Y1Y/Ct
Message-ID: <21b43196-230c-5000-546e-b90d4b6b44a3@suse.com>
Date: Tue, 10 Mar 2020 10:40:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <158379424337.149997.7454036134629466675@swboyd.mtv.corp.google.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 10 Mar 2020 23:36:13 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Richard Fontana <rfontana@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 ulrich.hecht+renesas@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-clk@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>,
 Chen-Yu Tsai <wens@csie.org>, Allison Randal <allison@lohutok.net>,
 mtk01761 <wendell.lin@mediatek.com>, linux-media@vger.kernel.org,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 frank-w@public-files.de, Seiya Wang <seiya.wang@mediatek.com>,
 sean.wang@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 ARM/Mediatek SoC support <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, fwll.ch@freedesktop.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Houlong Wei <"houlong.w ei"@mediatek.com>, matthias.bgg@kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 09/03/2020 23:50, Stephen Boyd wrote:
> Quoting Enric Balletbo Serra (2020-03-06 14:09:50)
>> Missatge de Stephen Boyd <sboyd@kernel.org> del dia dv., 6 de mar
>> 2020 a les 22:37:
>>>
>>> Quoting Enric Balletbo i Serra (2020-03-06 08:30:16)
>>>> On 5/3/20 22:01, Stephen Boyd wrote:
>>>>> Quoting Enric Balletbo i Serra (2020-03-02 03:01:26)
>>>>>> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
>>>>>> new file mode 100644
>>>>>> index 000000000000..473cdf732fb5
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/soc/mediatek/mtk-mmsys.c
>>>>>> @@ -0,0 +1,154 @@
>>>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>>>> +/*
>>>>>> + * Copyright (c) 2014 MediaTek Inc.
>>>>>> + * Author: James Liao <jamesjj.liao@mediatek.com>
>>>>>> + */
>>>>>> +
>>>>>> +#include <linux/clk-provider.h>
>>>>>> +#include <linux/of_device.h>
>>>>>> +#include <linux/platform_device.h>
>>>>>> +
>>>>>> +#include "../../clk/mediatek/clk-gate.h"
>>>>>> +#include "../../clk/mediatek/clk-mtk.h"
>>>>>
>>>>> Why not use include/linux/clk/?
>>>>>
>>>>
>>>> I can move these files to include, this will impact a lot more of drivers but,
>>>> yes, I think is the right way.
>>>>
>>>>> But I also don't understand why the clk driver is moved outside of
>>>>> drivers/clk/ into drivers/soc/. Commit text saying that it has shared
>>>>> registers doesn't mean it can't still keep the clk driver part in the
>>>>> drivers/clk/ area.
>>>>>
>>>>
>>>> Actually moving this to the soc directory has been requested by CK (mediatek) as
>>>> a change in v8. You can see the discussion in [1]
>>>>
>>>
>>> I can reply there in that thread if necessary, but we shouldn't need to
>>> force simple-mfd into DT bindings to support this. Match the compatible
>>> string in drivers/soc/ and register devices in software for the
>>> different pieces of this overall hardware block. If necessary, pass down
>>> the ioremapped addresss down through device data to each logical driver
>>> in the respective subsystem.
>>>
>>> So yes, it looks like an MFD, but that doesn't mean we have to change
>>> the DT binding or put it in drivers/mfd to support that. And we don't
>>> have to fix any problems with allowing two drivers to probe the same
>>> compatible string.
>>>
>>
>> That thread maybe has too much information and things evolved since
>> then. Note that the final solution is not an MFD neither we change the
>> bindings. I pointed to that thread just because CK (CK please correct
>> me if I'm wrong) thought that the driver is not a pure clock driver
>> and he preferred to move to drivers/soc/mediatek (in that thread, he
>> exposes his opinion on that).  Sorry to introduce more confusion.
>>
>> You seem to be fine with the approach (just minor changes), so it
>> looks to me that the only problem is if this should be in drivers/clk
>> or drivers/soc. Honestly, this is not something I can't decide and
>> I'll let you (the soc and clk maintainers) decide. I don't really have
>> a strong opinion here. I don't mind move again to drivers/clk if that
>> is what we want but let's come to an agreement.
>>
> 
> It's already in drivers/clk, so leave the clk part there and register
> the clk device and any other devices by matching the compatible in
> drivers/soc. That is my preferred solution. Can that be done?
> 

I think we can once again create a platform device in drivers/soc which matches
the drivers/clk and then do the routing in drivers/soc. Enric any thoughts?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
