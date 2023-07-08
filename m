Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F203874BD83
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 14:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE5C110E0D9;
	Sat,  8 Jul 2023 12:53:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEAD610E0D9
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 12:53:13 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6DA778634E;
 Sat,  8 Jul 2023 14:53:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1688820790;
 bh=j1VW+YqlIr6gMFRVJdYCG+mHS0tWNFRYQxRf8AA6Y/I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Oxql7ehPge5nSg6NraVob/joMOb/2cAVw3vB0uEHQ1ScHrHed0M7PRSzq+sIPfV67
 R8025mKCQmdpsjSbfN/8DJ1sg5XNLXuc6e2QEpGkJI/cgNF1sKjEg33HPPouYy3K4W
 Shkb6BshWHHlHeFTDmhosGRbOeOovJsMK4hIbKDNyUrDnUuuWs7EixbfKFON/IJ/RV
 +G/oZNo2IBw/ny1zgxBqKImVocbPPbj6kz7z6fP07zTADqgoysLPbIgCUi5FfCapLA
 MGI0hqCQ/Ldt2aLEksXjL1BMNBkQDERKA4ZD2hQi4qpSB8tU2DZDg/JFGb5o+2Q32V
 tM84W++UvBCDQ==
Message-ID: <8b0ae1d1-c769-1f55-0452-4bbc62da133b@denx.de>
Date: Sat, 8 Jul 2023 13:07:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 3/3] drm/panel-fannal-c3004: Add fannal c3004 DSI panel
To: Paulo Pavacic <pavacic.p@gmail.com>
References: <20230607151127.1542024-1-pavacic.p@gmail.com>
 <20230607151127.1542024-4-pavacic.p@gmail.com>
 <CACRpkdbrEA54qmfTKSsFRG9ZS4u8hM6P5TXtOjRAiW+TD_v-fQ@mail.gmail.com>
 <CAO9szn00vRFm+iM1m7KgkW0WRuKyJEgVU4tVx4f5tF6KPnE=2w@mail.gmail.com>
 <CACRpkdaw8M3dSkmiV5QDOt3BBB7Jo6NxT0Og=zvA4REMA_7y9g@mail.gmail.com>
 <CAO9szn29A0qCABG0ACni42UGpsGKLwG7OT1y_ho3DgQ0WLvfmw@mail.gmail.com>
 <CACRpkdYXtQwmZR1u-1fwmyC_8Yq4bMkjDBcUCfuGqSz_UhXWJQ@mail.gmail.com>
 <CAO9szn0OuKW+-JZMs3TPUHiwLCe6cUPcsUq+og64K2utMyZpqQ@mail.gmail.com>
 <CACRpkdb5stXKb7FNk_FC-PKduCngRX3sZTbzcxN+kRskz78fuQ@mail.gmail.com>
 <CAO9szn3oTzrrwiyr91H14ep7OPUkA-SDST3CSQAQHvFFnkJWfA@mail.gmail.com>
 <0d43e653-32cd-b25e-40fa-6f0571048467@denx.de>
 <CAO9szn20RY3uBDceyUJ1S+gb=FN8Hd5qqMfOSbitHFyFCZ+iLg@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAO9szn20RY3uBDceyUJ1S+gb=FN8Hd5qqMfOSbitHFyFCZ+iLg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, Jagan Teki <jagan@amarulasolutions.com>, sam@ravnborg.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/7/23 17:26, Paulo Pavacic wrote:
> Hello Marek,

Hi,

> čet, 6. srp 2023. u 17:26 Marek Vasut <marex@denx.de> napisao je:
>>
>> On 7/6/23 17:18, Paulo Pavacic wrote:
>>> Hello Linus,
>>>
>>> čet, 22. lip 2023. u 10:22 Linus Walleij <linus.walleij@linaro.org> napisao je:
>>>>
>>>> On Wed, Jun 21, 2023 at 5:09 PM Paulo Pavacic <pavacic.p@gmail.com> wrote:
>>>>
>>>>> A lot of modifications to st7701 are required. I believe it would
>>>>> result in a driver that doesn't look or work the same. e.g compare
>>>>> delays between initialization sequences of panel-fannal-c3004 and
>>>>> panel-st7701. I think it would be optimal to create st7701s driver and
>>>>> have special handling for st7701s panels. If there was a flag for
>>>>> whether panel is st7701 or st7701s it would end up looking like a
>>>>> mess.
>>>>
>>>> What matters is if the original authors of the old st7701 driver are
>>>> around and reviewing and testing patches at all. What we need is
>>>> active maintainers. (Added Jagan, Marek & Maya).
>>>>
>>>> I buy the reasoning that the st7701s is perhaps substantially different
>>>> from st7701.
>>>>
>>>> If st7701s is very different then I suppose it needs a separate driver,
>>>> then all we need to to name the driver properly, i.e.
>>>> panel-sitronix-st7701s.c.
>>>
>>> I had in person talk with Paul Kocialkowski and I have concluded that
>>> this is the best solution.
>>> I believe I should rename it to st7701s due to the hardware changes. I
>>> would like to create V5 patch with driver renamed to st7701s.
>>> Please let me know if you agree / disagree.
>>
>> If I recall it right, the ST7701 and ST7701S are basically the same
>> chip, aren't they ?
> 
> I'm currently exploring all the differences. There aren't a lot of
> differences, but there are some.
> So far I can see that default register values are different, new
> previously unused registers are now used and there has been some
> reordering of how info is placed in registers [1] (data bits are in
> different order). Moreover, instructions to some commands have been
> changed and meaning of what data bits mean [2][3]. Also, new features
> have been added [2]; there is now PCLKS 3 for example.
> 
> You can see few differences in following images. Same images were
> attached in this mail:
> [1] https://ibb.co/NmgbZmy - GAMACTRL_st7701.png
> [2] https://ibb.co/G79y235 - PCLKS2.png

Ouch. I wonder if this is still something that can be abstracted out 
with some helper accessor functions like:

if (model == ST7701)
   write something
else
   write the other layout

Or whether it makes sense to outright have a separate driver. The later 
would introduce duplication, but maybe that much duplication is OK.
