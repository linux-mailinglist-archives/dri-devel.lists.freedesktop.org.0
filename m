Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8AD38FF8F
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 12:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CE589CF5;
	Tue, 25 May 2021 10:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB1589CF5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 10:53:25 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E568C82E66;
 Tue, 25 May 2021 12:53:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1621940004;
 bh=UEYoswSCDEgEoJm4hdHwOkPugXjNi4hTGCjy1TyGiGk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Q45bamHL0WiQxyHc+bm4jadqfiri2/g5+YRd++zDGxYf27tH9rS7ChBY9bU3EZzpj
 +uUM2nhOk6eg34RMpgjm8hzYRlpLEXpF8AD2kUTgjeJyR9sF30/ZCjcGAK5Mfyynbc
 lqybhISl7QD3MbBnLt4uLWiK1CQTus3FkdC4IhkDpx9FlRXw8i9f5wW8teWM/1n6gw
 U47JitUIzKK9wX/QXGFsU8gagtNXhtbrrWvFMKlLAhIfx3gu4a5KyPrDK3SA1ZIVsi
 XiQUJ6eU/pzPqEAfeOtKmb5+uViLlKPUk6cRhmoRGjgkVz7xR8gjWHVvmBa1p5zZeY
 SBhX40S5UpSYA==
Subject: Re: [V3, 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and SN65DSI84
 driver
To: Mike Looijmans <mike.looijmans@topic.nl>, dri-devel@lists.freedesktop.org
References: <20210505100218.108024-2-marex@denx.de>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.d251689f-a6ba-486d-bfa1-070ac0c167d5@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.81349e00-3f39-4654-ab28-8c85568d0c51@emailsignatures365.codetwo.com>
 <f61c710e-cd12-f1cf-d05b-759fd2c0e8b1@topic.nl>
From: Marek Vasut <marex@denx.de>
Message-ID: <61fe258a-c89b-ffa8-2773-0e7eef35b612@denx.de>
Date: Tue, 25 May 2021 12:53:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <f61c710e-cd12-f1cf-d05b-759fd2c0e8b1@topic.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
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
Cc: Loic Poulain <loic.poulain@linaro.org>, ch@denx.de,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/17/21 3:23 PM, Mike Looijmans wrote:

Which system/soc are you testing this on ?

[...]

>> +static void sn65dsi83_pre_enable(struct drm_bridge *bridge)
>> +{
>> +    struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
>> +
>> +    /*
>> +     * Reset the chip, pull EN line low for t_reset=10ms,
>> +     * then high for t_en=1ms.
>> +     */
>> +    regcache_mark_dirty(ctx->regmap);
>> +    gpiod_set_value(ctx->enable_gpio, 0);
>> +    usleep_range(10000, 11000);
>> +    gpiod_set_value(ctx->enable_gpio, 1);
>> +    usleep_range(1000, 1100);
> Taking the chip out of reset here is not needed and may even disrupt 
> things, as the DSI hasn't set up anything yet so the clock may not be 
> running. I'd move this all into enable and get rid of the pre_enable 
> call. Similar for post_disable.

I am still waiting for someone to confirm the behavior of the DSI clock 
and data lanes in pre_enable/enable() . The datasheet says the HS clock 
have to be running and data lanes must be in LP state during init, but I 
don't think that is guaranteed currently in either pre_enable or enable.

[...]

>> +static void sn65dsi83_enable(struct drm_bridge *bridge)
>> +{
>> +    struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
>> +    unsigned int pval;
>> +    u16 val;
>> +    int ret;
>> +
>> +    /* Clear reset, disable PLL */
>> +    regmap_write(ctx->regmap, REG_RC_RESET, 0x00);
> Writing 0 to the RESET register is a no-op. Has no effect whatsoever, 
> just wasting time and code.

I would rather keep it to make sure the register is initialized.

>> +    regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
>> +
>> +    /* Reference clock derived from DSI link clock. */
>> +    regmap_write(ctx->regmap, REG_RC_LVDS_PLL,
>> +        REG_RC_LVDS_PLL_LVDS_CLK_RANGE(sn65dsi83_get_lvds_range(ctx)) |
>> +        REG_RC_LVDS_PLL_HS_CLK_SRC_DPHY);
>> +    regmap_write(ctx->regmap, REG_DSI_CLK,
>> +        REG_DSI_CLK_CHA_DSI_CLK_RANGE(sn65dsi83_get_dsi_range(ctx)));
>> +    regmap_write(ctx->regmap, REG_RC_DSI_CLK,
>> +        REG_RC_DSI_CLK_DSI_CLK_DIVIDER(sn65dsi83_get_dsi_div(ctx)));
>> +
>> +    /* Set number of DSI lanes and LVDS link config. */
>> +    regmap_write(ctx->regmap, REG_DSI_LANE,
>> +        REG_DSI_LANE_LVDS_LINK_CFG_DUAL |
>> +        REG_DSI_LANE_CHA_DSI_LANES(~(ctx->dsi_lanes - 1)) |
>> +        /* CHB is DSI85-only, set to default on DSI83/DSI84 */
>> +        REG_DSI_LANE_CHB_DSI_LANES(3));
>> +    /* No equalization. */
>> +    regmap_write(ctx->regmap, REG_DSI_EQ, 0x00);
>> +
>> +    /* RGB888 is the only format supported so far. */
>> +    val = (ctx->mode.flags & DRM_MODE_FLAG_NHSYNC ?
>> +           REG_LVDS_FMT_HS_NEG_POLARITY : 0) |
>> +          (ctx->mode.flags & DRM_MODE_FLAG_NVSYNC ?
>> +           REG_LVDS_FMT_VS_NEG_POLARITY : 0) |
>> +          REG_LVDS_FMT_CHA_24BPP_MODE;
>> +    if (ctx->lvds_dual_link)
>> +        val |= REG_LVDS_FMT_CHB_24BPP_MODE;
>> +    else
>> +        val |= REG_LVDS_FMT_LVDS_LINK_CFG;
>> +
>> +    regmap_write(ctx->regmap, REG_LVDS_FMT, val);
>> +    regmap_write(ctx->regmap, REG_LVDS_VCOM, 0x05);
>> +    regmap_write(ctx->regmap, REG_LVDS_LANE,
>> +        (ctx->lvds_dual_link_even_odd_swap ?
>> +         REG_LVDS_LANE_EVEN_ODD_SWAP : 0) |
>> +        REG_LVDS_LANE_CHA_LVDS_TERM |
>> +        REG_LVDS_LANE_CHB_LVDS_TERM);
>> +    regmap_write(ctx->regmap, REG_LVDS_CM, 0x00);
>> +
>> +    regmap_bulk_write(ctx->regmap, REG_VID_CHA_ACTIVE_LINE_LENGTH_LOW,
>> +              &ctx->mode.hdisplay, 2);
> 
> I think this ignores the endian format of the data. So this would only 
> work on little-endian systems, right?

Likely, can you double-check that ?
Some cpu_to_le16() could help here then.

>> +    regmap_bulk_write(ctx->regmap, 
>> REG_VID_CHA_VERTICAL_DISPLAY_SIZE_LOW,
>> +              &ctx->mode.vdisplay, 2);
>> +    val = 32 + 1;    /* 32 + 1 pixel clock to ensure proper operation */
>> +    regmap_bulk_write(ctx->regmap, REG_VID_CHA_SYNC_DELAY_LOW, &val, 2);
>> +    val = ctx->mode.hsync_end - ctx->mode.hsync_start;

[...]
