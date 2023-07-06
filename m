Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AE074A0E4
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 17:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A886510E46A;
	Thu,  6 Jul 2023 15:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 045A510E46A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 15:26:16 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 35125862AE;
 Thu,  6 Jul 2023 17:26:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1688657174;
 bh=2jlDFdx22SzndaSy19h6mEBsUHo5Dt4myuOcYQTEoXc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ChJvo1xJRTH6ASox/dcaWQdM5zg7GfhYy2XV327uY/WeBbjhertjAyiYT6aIIg5K9
 K+e7ltHrJQCvhr2RzT3vFBgFmuXjTNoyU1JaVGowGqrMce0MZjQsBgaAlLbi2h2Fcy
 dHj3V1qLpvYz5TxMml1Azf9ItNWWE4du289nT4IMiuXM9V3dHF8KkvxpezPWKjvihg
 iO8wzMJ2Y6/x4Cn0X9VRKJLbdcAABtg3Lety8lUzw2dlxjnnTIdWSC+BEbkGQlXndF
 YDstcRByfX1QrLS8XstJ2v4T23Fm4/1fqei5hi+5x/dC4xsycKT8tDmTlSy5yx80yD
 Obxm88TYHJ3Jg==
Message-ID: <0d43e653-32cd-b25e-40fa-6f0571048467@denx.de>
Date: Thu, 6 Jul 2023 17:26:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 3/3] drm/panel-fannal-c3004: Add fannal c3004 DSI panel
Content-Language: en-US
To: Paulo Pavacic <pavacic.p@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
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
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAO9szn3oTzrrwiyr91H14ep7OPUkA-SDST3CSQAQHvFFnkJWfA@mail.gmail.com>
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
 sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/6/23 17:18, Paulo Pavacic wrote:
> Hello Linus,
> 
> čet, 22. lip 2023. u 10:22 Linus Walleij <linus.walleij@linaro.org> napisao je:
>>
>> On Wed, Jun 21, 2023 at 5:09 PM Paulo Pavacic <pavacic.p@gmail.com> wrote:
>>
>>> A lot of modifications to st7701 are required. I believe it would
>>> result in a driver that doesn't look or work the same. e.g compare
>>> delays between initialization sequences of panel-fannal-c3004 and
>>> panel-st7701. I think it would be optimal to create st7701s driver and
>>> have special handling for st7701s panels. If there was a flag for
>>> whether panel is st7701 or st7701s it would end up looking like a
>>> mess.
>>
>> What matters is if the original authors of the old st7701 driver are
>> around and reviewing and testing patches at all. What we need is
>> active maintainers. (Added Jagan, Marek & Maya).
>>
>> I buy the reasoning that the st7701s is perhaps substantially different
>> from st7701.
>>
>> If st7701s is very different then I suppose it needs a separate driver,
>> then all we need to to name the driver properly, i.e.
>> panel-sitronix-st7701s.c.
> 
> I had in person talk with Paul Kocialkowski and I have concluded that
> this is the best solution.
> I believe I should rename it to st7701s due to the hardware changes. I
> would like to create V5 patch with driver renamed to st7701s.
> Please let me know if you agree / disagree.

If I recall it right, the ST7701 and ST7701S are basically the same 
chip, aren't they ?
