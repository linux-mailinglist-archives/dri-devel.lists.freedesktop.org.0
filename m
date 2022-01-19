Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AC04938DA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 11:47:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE63310E689;
	Wed, 19 Jan 2022 10:47:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4A810E696
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 10:47:05 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 ay14-20020a05600c1e0e00b0034d7bef1b5dso6806592wmb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 02:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dx+5y92U1FgBzsVZMw+12Q4TLFpaaS9Yf4w4pY01fTg=;
 b=UgIJwWVRPlpeatc+U8AhVdBfZ5sWLtY2BVhbAB/lh3QNk/vy/r4ThPnHsHri5DxDxA
 3hmBnUIFE+fqyul8NCUI7hTKKSf0Hrl7r0kMyOYqnKTIK7ETOzJMGKjYqmA90FUToV4C
 QIxWwvLHKOVJlVjTEwaoWWSFKTJKoMGLDnMDiQo+Zt2OLcg4aDzrVLF36so3NVt+/YhX
 r3OJpRGcoXAX5P3E2gCC16Ta59734e0GrCuYBqNZsAqSejP6KXbpVHyqMzE3ZDFzHBmI
 JQD1aZnTLd17L/venUuMxQdnCcZYRSMeiaoZwz6asZ5lwwbs58OqSelkB+GO+tU+edaI
 VBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Dx+5y92U1FgBzsVZMw+12Q4TLFpaaS9Yf4w4pY01fTg=;
 b=Y2LMbkGG4rNirCsC6e+0HbT3MwDO3fLHICZfR3cDsmITqd4lMJAMtfjTYebik9iJB8
 HGUhbpIg6tggUoVm27LnCOCsFL0WzWq9hz+CngufhK7lpgx/350JkeYJG38ONxAb8saF
 I8mC2TOWtavCk9ULm6RVlHsST7IVGqCjO+oLgm5JQrVOFNmyTafnMkaq0S75k86X63gv
 0lPZjNQfjbmZwXioPw3aoo9W1r/TyKCLBhpG3xZzVytr+ORVTPCgUqGCdsQZttAT+m8O
 XPRdvP9RWSani0OVbakev8BfSb7Z58xAtpfz/RfsaDTkFYHIajBH8GL8Q3SjyQjznTHI
 7lmg==
X-Gm-Message-State: AOAM530QCm8qG8ihFE2kTb2Gb4cKkoJyr167+PdD83V/4CHKCEqFX8BE
 nQzoYT5EnYlPjLc3A7W5VkA3oQ==
X-Google-Smtp-Source: ABdhPJy6tuWU2K3EUHSDhWJc1qHx1y936PooKoRDKkAQeADIVDfKW2YRJM88plUr9OYUUkxwbyexbA==
X-Received: by 2002:adf:bc52:: with SMTP id a18mr580055wrh.426.1642589224228; 
 Wed, 19 Jan 2022 02:47:04 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:d394:97d0:bc02:3846?
 ([2001:861:44c0:66c0:d394:97d0:bc02:3846])
 by smtp.gmail.com with ESMTPSA id o15sm5068178wms.11.2022.01.19.02.47.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 02:47:03 -0800 (PST)
Subject: Re: [PATCH v2] phy: dphy: Correct clk_pre parameter
From: Neil Armstrong <narmstrong@baylibre.com>
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20220119023714.1498508-1-victor.liu@nxp.com>
 <28e3f723-daf0-b3c5-ee10-519c4cabfe17@baylibre.com>
 <5a638561-c704-49e7-1fed-70e26fedb186@baylibre.com>
 <8ad2cd76e80056192395ca5b73ff514e59881ba3.camel@nxp.com>
 <e02c9226-2dfb-5931-60e3-a22e51172c30@baylibre.com>
Organization: Baylibre
Message-ID: <661a7c69-0da6-32f5-ffa0-58426c5825e0@baylibre.com>
Date: Wed, 19 Jan 2022 11:47:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <e02c9226-2dfb-5931-60e3-a22e51172c30@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Kevin Hilman <khilman@baylibre.com>,
 =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
 Robert Foss <robert.foss@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vinod Koul <vkoul@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 19/01/2022 11:11, Neil Armstrong wrote:
> Hi,
> 
> On 19/01/2022 11:01, Liu Ying wrote:
>> Hi Neil,
>>
>> On Wed, 2022-01-19 at 10:11 +0100, Neil Armstrong wrote:
>>> On 19/01/2022 09:40, Neil Armstrong wrote:
>>>> Hi,
>>>>
>>>> On 19/01/2022 03:37, Liu Ying wrote:
>>>>> The D-PHY specification (v1.2) explicitly mentions that the T-CLK-PRE
>>>>> parameter's unit is Unit Interval(UI) and the minimum value is 8.  Also,
>>>>> kernel doc of the 'clk_pre' member of struct phy_configure_opts_mipi_dphy
>>>>> mentions that it should be in UI.  However, the dphy core driver wrongly
>>>>> sets 'clk_pre' to 8000, which seems to hint that it's in picoseconds.
>>>>> And, the kernel doc of the 'clk_pre' member wrongly says the minimum value
>>>>> is '8 UI', instead of 8.
>>>>>
>>>>> So, let's fix both the dphy core driver and the kernel doc of the 'clk_pre'
>>>>> member to correctly reflect the T-CLK-PRE parameter's unit and the minimum
>>>>> value according to the D-PHY specification.
>>>>>
>>>>> I'm assuming that all impacted custom drivers shall program values in
>>>>> TxByteClkHS cycles into hardware for the T-CLK-PRE parameter.  The D-PHY
>>>>> specification mentions that the frequency of TxByteClkHS is exactly 1/8
>>>>> the High-Speed(HS) bit rate(each HS bit consumes one UI).  So, relevant
>>>>> custom driver code is changed to program those values as
>>>>> DIV_ROUND_UP(cfg->clk_pre, BITS_PER_BYTE), then.
>>>>>
>>>>> Note that I've only tested the patch with RM67191 DSI panel on i.MX8mq EVK.
>>>>> Help is needed to test with other i.MX8mq, Meson and Rockchip platforms,
>>>>> as I don't have the hardwares.
>>>>>
>>>>> Fixes: 2ed869990e14 ("phy: Add MIPI D-PHY configuration options")
>>>>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>>>>> Cc: Neil Armstrong <narmstrong@baylibre.com>
>>>>> Cc: Robert Foss <robert.foss@linaro.org>
>>>>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>>>>> Cc: Jonas Karlman <jonas@kwiboo.se>
>>>>> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
>>>>> Cc: David Airlie <airlied@linux.ie>
>>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>>> Cc: Kishon Vijay Abraham I <kishon@ti.com>
>>>>> Cc: Vinod Koul <vkoul@kernel.org>
>>>>> Cc: Kevin Hilman <khilman@baylibre.com>
>>>>> Cc: Jerome Brunet <jbrunet@baylibre.com>
>>>>> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>>>> Cc: Heiko Stuebner <heiko@sntech.de>
>>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>>> Cc: Guido Günther <agx@sigxcpu.org>
>>>>> Tested-by: Liu Ying <victor.liu@nxp.com> # RM67191 DSI panel on i.MX8mq EVK
>>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>>>> ---
>>>>> v1->v2:
>>>>> * Use BITS_PER_BYTE macro. (Andrzej)
>>>>> * Drop dsi argument from ui2bc() in nwl-dsi.c.
>>>>>
>>>>>  drivers/gpu/drm/bridge/nwl-dsi.c                 | 12 +++++-------
>>>>>  drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c    |  3 ++-
>>>>>  drivers/phy/phy-core-mipi-dphy.c                 |  4 ++--
>>>>>  drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c |  3 ++-
>>>>>  include/linux/phy/phy-mipi-dphy.h                |  2 +-
>>>>>  5 files changed, 12 insertions(+), 12 deletions(-)
>>>>>
>>> [...]
>>>
>>>>> diff --git a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
>>>>> index cd2332bf0e31..fdbd64c03e12 100644
>>>>> --- a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
>>>>> +++ b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
>>>>> @@ -9,6 +9,7 @@
>>>>>  
>>>>>  #include <linux/bitfield.h>
>>>>>  #include <linux/bitops.h>
>>>>> +#include <linux/bits.h>
>>>>>  #include <linux/clk.h>
>>>>>  #include <linux/delay.h>
>>>>>  #include <linux/io.h>
>>>>> @@ -250,7 +251,7 @@ static int phy_meson_axg_mipi_dphy_power_on(struct phy *phy)
>>>>>  		     (DIV_ROUND_UP(priv->config.clk_zero, temp) << 16) |
>>>>>  		     (DIV_ROUND_UP(priv->config.clk_prepare, temp) << 24));
>>>>>  	regmap_write(priv->regmap, MIPI_DSI_CLK_TIM1,
>>>>> -		     DIV_ROUND_UP(priv->config.clk_pre, temp));
>>>>> +		     DIV_ROUND_UP(priv->config.clk_pre, BITS_PER_BYTE));
>>>>>  
>>>>>  	regmap_write(priv->regmap, MIPI_DSI_HS_TIM,
>>>>>  		     DIV_ROUND_UP(priv->config.hs_exit, temp) |
>>>>
>>>> I'll try to run a test, currently the calculation gives 2, so this would give 1.
>>>
>>> The Amlogic vendor code does:
>>>
>>> /* >8*ui */
>>> #define DPHY_TIME_CLK_PRE(ui)       (10 * ui)
>>
>> This looks like clk_pre time is 10 * ui, which matches the comment
>> '>8*ui' - longer time 8 * ui.
>>
>>>
>>> t_ui = lcd_timing.bit_rate
>>>
>>> t_ui = (1000000 * 100) / (dsi_ui / 1000); /*100*ns */
>>> temp = t_ui * 8; /* lane_byte cycle time */
>>
>> If I read correctly, this temp in vendor code is TxByteClkHS period
>> time in picoseconds. So...
>>
>>>
>>> dphy->clk_pre = ((DPHY_TIME_CLK_PRE(t_ui) + temp - 1) / temp) & 0xff;
>>
>> IIUC, 'dphy->clk_pre' essentially means dphy->clk_pre = DIV_ROUND_UP(10
>> * ui, temp), that is, the time for dphy->clk_pre is no less than 
>> 10 * ui.  The D-PHY spec (v1.2)'s saying is that the minimum time for
>> dphy->clk_pre is 8 * ui.  So, it looks like meson is stricter than the
>> spec.
>>
>> However, the vendor code doesn't seem to match the current meson driver
>> implementation.  The temp in driver code is also TxByteClkHS period
>> time in picoseconds. And, without this patch, I'm assuming that
>> priv->config.clk_pre is 8000.  So, it looks like MIPI_DSI_CLK_TIM1 is
>> set to DIV_ROUND_UP(8000, temp).  This '8000' does _not_ reflect
>> '10 * ui'.
>>
>> So, 3 choices for meson, up to you:
>> 1) If meson really requires the time for clk_pre no less than
>> 10 * ui, then sth like DIV_ROUND_UP(10, BITS_PER_BYTE) can be used.
>> 2) If meson follows the spec's minimum value, then the patch does
>> things right for meson.
>> 3) Force to use 8000 picoseconds for clk_pre, that is, use sth like
>> DIV_ROUND_UP(8000, temp).
>>
>> With this patch applied, do you see any display artifacts by visual
>> check? Or even checked signals through DSI analyzer?
> 
> Thanks for the feedback, I'm currently trying to put the setup back to
> run a test with this change.

I don't see any visible artifacts.

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com> # for phy-meson-axg-mipi-dphy.c
Tested-by: Neil Armstrong <narmstrong@baylibre.com> # for phy-meson-axg-mipi-dphy.c

Thanks,

> 
> Neil
> 
>>
>> Regards,
>> Liu Ying
>>
>>>
>>> PHY Registers only says:
>>> MIPI_DSI_CLK_TIM1	[31:0]
>>> 7:0 	R/W	0	 tCLK_PRE
>>>
>>>> Neil
>>>>
>>>
>>> [...]
>>
> 

