Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AF14936E4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 10:11:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC41410E87C;
	Wed, 19 Jan 2022 09:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853DD10E86C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 09:11:55 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id p18so3898724wmg.4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 01:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C4Zc3pg97QhRBnCL31NpgyhTD5rJxIoNyw+4jb4dhT4=;
 b=dUWihDw/VMRg6sA/GD788IM8rAYRtmQWSJS0gFREajow6TJlqI3HWG9LdfWCkdehns
 NruAxdRRI2X+Uk+gUUPoKPdOTqJK+YDK5CJSoGRCB/3C7H1PyEBKYLOlsvC5+ZJ/iN7w
 sLVmiGGMz+7vD7j4OmVYXcymVoKHfPrIaHnZ3daxol1b0YtUcOYxwHo6PwsMN0R4vXH8
 DTRh4zjjMkj5ajGAHKUT6HdO38ZLsNatcyXDwdK57z8EjwHMEFKcVrpf7Ubb/Ad3YD34
 JlNxxTB2K9aFdD9aoaNV9IX1b4N+K7GLAEmJpqEeXp5G6u+ccu8PtuiTHp4MBNzSnSiB
 SL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=C4Zc3pg97QhRBnCL31NpgyhTD5rJxIoNyw+4jb4dhT4=;
 b=x6JtgX5Tl+4h8gRftZYI55+WFHymYoawjrDOD3aIYAXdaC+MFHq9j6cFFz4nsStF2N
 yczvBzo+rUBJfCVM48n4c0YROthn394I9Ms5dQNF2tMAY2q/vseB/GVDQzSM/DfHZLMr
 LpWT5jH365q4GvnJrJhxyVsRe70Qn2Qe2WzoGNqydlMyL5A0ZF19mPXA0ga2wqsAXL74
 CH7gcGCt57DXK+HNebaDwuyTPC7CAWgTD2+yYCzf53jWxPEsi508ipYXdwEcx0G1UNLE
 xrP3ayOXBOdRVngTQrjaIyva4rxl4hEvKFS5+BXcGEg4ic7PHmwlt6PHQdH3e6jHwG3a
 jqnA==
X-Gm-Message-State: AOAM532FM1hzK7n01PcVZkjlulZ3xD/me4t9Tm116kzNLOlfsrWXNyzd
 FO+BLfXaEx89Y5baSSc4j1k5Mw==
X-Google-Smtp-Source: ABdhPJz+1YRs3ncIGZ6eu44qYuu3hW1X9+WEUA6N5BCKeE+8wCtHHZrHR1Q6yh29u8Ny4K2ju8jeqw==
X-Received: by 2002:a5d:46c6:: with SMTP id g6mr27435133wrs.322.1642583513901; 
 Wed, 19 Jan 2022 01:11:53 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:d394:97d0:bc02:3846?
 ([2001:861:44c0:66c0:d394:97d0:bc02:3846])
 by smtp.gmail.com with ESMTPSA id c8sm5634596wmq.34.2022.01.19.01.11.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 01:11:53 -0800 (PST)
Subject: Re: [PATCH v2] phy: dphy: Correct clk_pre parameter
From: Neil Armstrong <narmstrong@baylibre.com>
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20220119023714.1498508-1-victor.liu@nxp.com>
 <28e3f723-daf0-b3c5-ee10-519c4cabfe17@baylibre.com>
Organization: Baylibre
Message-ID: <5a638561-c704-49e7-1fed-70e26fedb186@baylibre.com>
Date: Wed, 19 Jan 2022 10:11:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <28e3f723-daf0-b3c5-ee10-519c4cabfe17@baylibre.com>
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

On 19/01/2022 09:40, Neil Armstrong wrote:
> Hi,
> 
> On 19/01/2022 03:37, Liu Ying wrote:
>> The D-PHY specification (v1.2) explicitly mentions that the T-CLK-PRE
>> parameter's unit is Unit Interval(UI) and the minimum value is 8.  Also,
>> kernel doc of the 'clk_pre' member of struct phy_configure_opts_mipi_dphy
>> mentions that it should be in UI.  However, the dphy core driver wrongly
>> sets 'clk_pre' to 8000, which seems to hint that it's in picoseconds.
>> And, the kernel doc of the 'clk_pre' member wrongly says the minimum value
>> is '8 UI', instead of 8.
>>
>> So, let's fix both the dphy core driver and the kernel doc of the 'clk_pre'
>> member to correctly reflect the T-CLK-PRE parameter's unit and the minimum
>> value according to the D-PHY specification.
>>
>> I'm assuming that all impacted custom drivers shall program values in
>> TxByteClkHS cycles into hardware for the T-CLK-PRE parameter.  The D-PHY
>> specification mentions that the frequency of TxByteClkHS is exactly 1/8
>> the High-Speed(HS) bit rate(each HS bit consumes one UI).  So, relevant
>> custom driver code is changed to program those values as
>> DIV_ROUND_UP(cfg->clk_pre, BITS_PER_BYTE), then.
>>
>> Note that I've only tested the patch with RM67191 DSI panel on i.MX8mq EVK.
>> Help is needed to test with other i.MX8mq, Meson and Rockchip platforms,
>> as I don't have the hardwares.
>>
>> Fixes: 2ed869990e14 ("phy: Add MIPI D-PHY configuration options")
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Neil Armstrong <narmstrong@baylibre.com>
>> Cc: Robert Foss <robert.foss@linaro.org>
>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>> Cc: Jonas Karlman <jonas@kwiboo.se>
>> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
>> Cc: David Airlie <airlied@linux.ie>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Kishon Vijay Abraham I <kishon@ti.com>
>> Cc: Vinod Koul <vkoul@kernel.org>
>> Cc: Kevin Hilman <khilman@baylibre.com>
>> Cc: Jerome Brunet <jbrunet@baylibre.com>
>> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> Cc: Heiko Stuebner <heiko@sntech.de>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Guido Günther <agx@sigxcpu.org>
>> Tested-by: Liu Ying <victor.liu@nxp.com> # RM67191 DSI panel on i.MX8mq EVK
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>> v1->v2:
>> * Use BITS_PER_BYTE macro. (Andrzej)
>> * Drop dsi argument from ui2bc() in nwl-dsi.c.
>>
>>  drivers/gpu/drm/bridge/nwl-dsi.c                 | 12 +++++-------
>>  drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c    |  3 ++-
>>  drivers/phy/phy-core-mipi-dphy.c                 |  4 ++--
>>  drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c |  3 ++-
>>  include/linux/phy/phy-mipi-dphy.h                |  2 +-
>>  5 files changed, 12 insertions(+), 12 deletions(-)
>>
[...]

>> diff --git a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
>> index cd2332bf0e31..fdbd64c03e12 100644
>> --- a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
>> +++ b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
>> @@ -9,6 +9,7 @@
>>  
>>  #include <linux/bitfield.h>
>>  #include <linux/bitops.h>
>> +#include <linux/bits.h>
>>  #include <linux/clk.h>
>>  #include <linux/delay.h>
>>  #include <linux/io.h>
>> @@ -250,7 +251,7 @@ static int phy_meson_axg_mipi_dphy_power_on(struct phy *phy)
>>  		     (DIV_ROUND_UP(priv->config.clk_zero, temp) << 16) |
>>  		     (DIV_ROUND_UP(priv->config.clk_prepare, temp) << 24));
>>  	regmap_write(priv->regmap, MIPI_DSI_CLK_TIM1,
>> -		     DIV_ROUND_UP(priv->config.clk_pre, temp));
>> +		     DIV_ROUND_UP(priv->config.clk_pre, BITS_PER_BYTE));
>>  
>>  	regmap_write(priv->regmap, MIPI_DSI_HS_TIM,
>>  		     DIV_ROUND_UP(priv->config.hs_exit, temp) |
> 
> I'll try to run a test, currently the calculation gives 2, so this would give 1.

The Amlogic vendor code does:

/* >8*ui */
#define DPHY_TIME_CLK_PRE(ui)       (10 * ui)

t_ui = lcd_timing.bit_rate

t_ui = (1000000 * 100) / (dsi_ui / 1000); /*100*ns */
temp = t_ui * 8; /* lane_byte cycle time */

dphy->clk_pre = ((DPHY_TIME_CLK_PRE(t_ui) + temp - 1) / temp) & 0xff;

PHY Registers only says:
MIPI_DSI_CLK_TIM1	[31:0]
7:0 	R/W	0	 tCLK_PRE

> 
> Neil
> 

[...]
