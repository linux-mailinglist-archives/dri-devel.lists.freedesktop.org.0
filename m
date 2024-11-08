Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FB19C1ECA
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 15:05:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0DDC10E9BD;
	Fri,  8 Nov 2024 14:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.b="X6+JIDD8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4B310E9BD
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 14:05:04 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1731074703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hPQvHE3q81KEG1KWpRY76/YYpzUKNWMXavpJD8Jdyj8=;
 b=X6+JIDD8w/pV1TnT7U0Owy43XKZNWlYyZGxAGEXciKVjqCG2FkpMvi+HP+IlhfTOnTzZk9
 8r56/KZNaLMB4D+VcUVPKibgBLC9G5ZY61C9/Liy15awpYRC3/r9kwyThxSlZMZazdqlHI
 nDRU/88tU4JCAfavUYsWg3LUKl4IgBsmIemzeiFpd+CL99C/2cDZfxDK+I2SEy2mManDod
 LHmWYccNCv+ek5zuXrZZUDtwiJdqKbOZZQzMlslS9UxsqkLdYRoOXl+K6L0qhscfIfXMDg
 bCN7wzNvAnM3mJKpAIsZMvwCS+MaoRuM5W/uxj4EqpsjOuVjeNZ9Hy6KRXDOQA==
Date: Fri, 08 Nov 2024 15:05:02 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/rockchip: dsi: Perform trivial code cleanups
In-Reply-To: <13633881.uLZWGnKmhe@diego>
References: <cover.1731073565.git.dsimic@manjaro.org>
 <35555b58a7284450fb16281514e4e6a3eb9c7b82.1731073565.git.dsimic@manjaro.org>
 <13633881.uLZWGnKmhe@diego>
Message-ID: <3734f6a5424e3537d717c587a058fc85@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
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

Hello Heiko,

On 2024-11-08 14:56, Heiko Stübner wrote:
> Am Freitag, 8. November 2024, 14:53:57 CET schrieb Dragan Simic:
>> Perform a few trivial code cleanups, to make one logged message a bit 
>> more
>> consistent with the other logged messages by capitalizing its first 
>> word, and
>> to avoid line wrapping by using the 100-column width better.
>> 
>> No intended functional changes are introduced by these code cleanups.
>> 
>> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
>> ---
>>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 12 ++++--------
>>  1 file changed, 4 insertions(+), 8 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c 
>> b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>> index 58a44af0e9ad..f451e70efbdd 100644
>> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>> @@ -1379,7 +1379,7 @@ static int dw_mipi_dsi_rockchip_probe(struct 
>> platform_device *pdev)
>>  	}
>> 
>>  	if (!dsi->cdata) {
>> -		DRM_DEV_ERROR(dev, "no dsi-config for %s node\n", np->name);
>> +		DRM_DEV_ERROR(dev, "No dsi-config for %s node\n", np->name);
> 
> this is all probe-related, why not convert to dev_err_probe?
> 
> As the doc states [0], DRM_DEV_ERROR is deprecated in favor of dev_err.
> So dev_err_probe would be the correct way to go?

Thanks for your quick response!  Seeing that DRM_DEV_ERROR() is now
deprecated (which I originally missed, in all honesty) makes me very
happy. :)  I've never been a huge fan of the format of the messages
that DRM_DEV_ERROR() produces.

However, perhaps it would be better to keep these patches as-is, as
some kind of an intermediate, limited-scope cleanup + bugfix combo,
and leave the complete DRM_DEV_ERROR() --> dev_err()/dev_err_probe()
conversion to separate patches.  I think it would be better to avoid
a partial conversion, and I'll be more than happy to put the complete
conversion on my TODO list. :)

> [0] 
> https://elixir.bootlin.com/linux/v6.11.6/source/include/drm/drm_print.h#L431
> 
>>  		return -EINVAL;
>>  	}
>> 
>> @@ -1408,19 +1408,16 @@ static int dw_mipi_dsi_rockchip_probe(struct 
>> platform_device *pdev)
>>  			dsi->pllref_clk = NULL;
>>  		} else {
>>  			ret = PTR_ERR(dsi->pllref_clk);
>> -			DRM_DEV_ERROR(dev,
>> -				      "Unable to get pll reference clock: %d\n",
>> -				      ret);
>> +			DRM_DEV_ERROR(dev, "Unable to get pll reference clock: %d\n", 
>> ret);
>>  			return ret;
>>  		}
>>  	}
>> 
>>  	if (dsi->cdata->flags & DW_MIPI_NEEDS_PHY_CFG_CLK) {
>>  		dsi->phy_cfg_clk = devm_clk_get(dev, "phy_cfg");
>>  		if (IS_ERR(dsi->phy_cfg_clk)) {
>>  			ret = PTR_ERR(dsi->phy_cfg_clk);
>> -			DRM_DEV_ERROR(dev,
>> -				      "Unable to get phy_cfg_clk: %d\n", ret);
>> +			DRM_DEV_ERROR(dev, "Unable to get phy_cfg_clk: %d\n", ret);
>>  			return ret;
>>  		}
>>  	}
>> @@ -1465,8 +1462,7 @@ static int dw_mipi_dsi_rockchip_probe(struct 
>> platform_device *pdev)
>>  	if (IS_ERR(dsi->dmd)) {
>>  		ret = PTR_ERR(dsi->dmd);
>>  		if (ret != -EPROBE_DEFER)
>> -			DRM_DEV_ERROR(dev,
>> -				      "Failed to probe dw_mipi_dsi: %d\n", ret);
>> +			DRM_DEV_ERROR(dev, "Failed to probe dw_mipi_dsi: %d\n", ret);
>>  		return ret;
>>  	}
>> 
>> 
