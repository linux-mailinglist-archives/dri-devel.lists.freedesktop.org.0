Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57518600910
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 10:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62EE510E0E5;
	Mon, 17 Oct 2022 08:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2978A10E0E5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 08:48:28 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7984784EF6;
 Mon, 17 Oct 2022 10:48:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1665996506;
 bh=yXq3i2LXThxSICe5EDfLu4NFAXMWF4Om78YosId6gRE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LLy8A94RMZIaE4EBHrGDVvVm6wXs8zno2usDd8VghCpt5/78N3aTBvOMp3Yu8H4tk
 VAKZJf51vB4wSmyMhnYAK5D0X4EzDmDp2YmUnB4Dp5kA/+d7zlcTmVzxMq0PrVt1P/
 sLbry1WYQiyYGiyqgLky5ltju9/M8KQBsdPnfWQK69+SUpDdzmNRpyyFdZQJjxDYiU
 oPS8z9CvwdwmfhhbgbLZ3pz/7btDEJt4pIYYjDUDTCRDpAUpWiEP68LtcurQ4KoGtz
 ZiEJAl+Ialk63O6gr3tAwp+5e7cB+lW1rRo0JkOH5TM/STLbi/HaZcgReAMobmcfI3
 qWHgweleALpvw==
Message-ID: <76423028-e58e-7271-0d74-fb4bb2bf65c8@denx.de>
Date: Mon, 17 Oct 2022 10:48:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v7 01/10] drm: bridge: Add Samsung DSIM bridge driver
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-2-jagan@amarulasolutions.com>
 <d3012cac-6672-70cf-5cde-c3152cfd5a84@denx.de>
 <CAMty3ZAw-iXKcYgWuPCT_RwksKHVSipxL6tXb6WNLEeB7YvYmA@mail.gmail.com>
 <bad48f67-5fe6-d69c-51b0-bac3fa9d2719@denx.de>
 <CAMty3ZBLQu8YijrSVdt84-J9hoOx8qcRSaGF-FvZVsJEWVaXjQ@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZBLQu8YijrSVdt84-J9hoOx8qcRSaGF-FvZVsJEWVaXjQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/17/22 09:43, Jagan Teki wrote:
> On Mon, Oct 17, 2022 at 12:49 PM Marek Vasut <marex@denx.de> wrote:
>>
>> On 10/17/22 04:49, Jagan Teki wrote:
>>> On Sun, Oct 16, 2022 at 3:16 AM Marek Vasut <marex@denx.de> wrote:
>>>>
>>>> On 10/5/22 17:13, Jagan Teki wrote:
>>>>> Samsung MIPI DSIM controller is common DSI IP that can be used in various
>>>>> SoCs like Exynos, i.MX8M Mini/Nano.
>>>>>
>>>>> In order to access this DSI controller between various platform SoCs,
>>>>> the ideal way to incorporate this in the drm stack is via the drm bridge
>>>>> driver.
>>>>>
>>>>> This patch is trying to differentiate platform-specific and bridge driver
>>>>> code by maintaining exynos platform glue code in exynos_drm_dsi.c driver
>>>>> and common bridge driver code in samsung-dsim.c providing that the new
>>>>> platform-specific glue should be supported in the bridge driver, unlike
>>>>> exynos platform drm drivers.
>>>>>
>>>>> - Add samsung_dsim_plat_data for keeping platform-specific attributes like
>>>>>      host_ops, irq_ops, and hw_type.
>>>>>
>>>>> - Initialize the plat_data hooks for exynos platform in exynos_drm_dsi.c.
>>>>>
>>>>> - samsung_dsim_probe is the common probe call across exynos_drm_dsi.c and
>>>>>      samsung-dsim.c.
>>>>>
>>>>> - plat_data hooks like host_ops and irq_ops are invoked during the
>>>>>      respective bridge call chains.
>>>>
>>>> Maybe the Subject should say "Split ... driver" or "Move ... driver" ,
>>>> since it is not adding a new driver here ?
>>>
>>> Though it is not added a completely new driver, it is adding more
>>> infrastructure platform code to be compatible with both Exynos and
>>> i.MX8M. This is the prime reason for adding that commit head and
>>> explaining the same in the commit body.
>>
>> Diffstat looks like this:
>>
>>    drivers/gpu/drm/bridge/samsung-dsim.c   | 1703 ++++++++++++++++++++++
>>    drivers/gpu/drm/exynos/Kconfig          |    1 +
>>    drivers/gpu/drm/exynos/exynos_drm_dsi.c | 1766 ++---------------------
>>    include/drm/bridge/samsung-dsim.h       |  113 ++
>>    7 files changed, 1952 insertions(+), 1653 deletions(-)
>>
>> Looks to me like most of the code is just moved from existing driver in
>> this patch.
> 
> Yeah, as I explained (from commit) it is moved, updated, and written
> the plat code. How about this head?
> 
> "drm: bridge: Add Samsung DSIM bridge (Split from exynos_drm_dsi)"

I disagree with the "Add" part of the Subject, but I'll wait for others' 
opinion here.
