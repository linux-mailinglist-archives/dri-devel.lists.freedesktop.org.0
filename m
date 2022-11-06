Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E8061E024
	for <lists+dri-devel@lfdr.de>; Sun,  6 Nov 2022 04:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BEB810E02A;
	Sun,  6 Nov 2022 03:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E9210E02A
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Nov 2022 03:17:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7DD8660B8F;
 Sun,  6 Nov 2022 03:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D965C433D6;
 Sun,  6 Nov 2022 03:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667704672;
 bh=iXN6QTp9N3xZfo64V68cgv+Kq1hePQWIpnKArPOxGcE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HtMWU6CXuHFVtmmuBuLxQc47wWBR+J8RMjieWFPlDveugMk2zCiN9HjMZgxBLuZPp
 a+JoBlXf/36BGSbhfezWqtJS+eXHJL5HNN/pQCXIdL9WSLzDFdd/RDeKKpYIawsbuL
 rBwe2zF9X0f+DrU6tNMWZbLkxqoxjN969qfPypBxIjJ1Y2VIMSOxrJbyEz+oDMet3L
 cNZC1kDpGebXhBflMVGxhyWwiztRsPBOSVufiT43kWRd/85ox6hqpDyHK2kGC1oWE5
 VjvwMsY4Amhm/VB5MkAeAo2QChGeyNC5BvIjgUjuckn8YtBRzxcXZzEahwlJJxwgYL
 UATBe6OQrrofQ==
Date: Sat, 5 Nov 2022 22:17:50 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Nia Espera <a5b6@riseup.net>
Subject: Re: [PATCH v3 1/2] drivers: gpu: drm: add driver for samsung
 s6e3fc2x01 cmd mode panel
Message-ID: <20221106031750.juw3fsy27wchqdqp@builder.lan>
References: <20221008131201.540185-1-a5b6@riseup.net>
 <20221008131201.540185-2-a5b6@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221008131201.540185-2-a5b6@riseup.net>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Caleb Connolly <caleb@connolly.tech>,
 Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 08, 2022 at 03:12:01PM +0200, Nia Espera wrote:
> Adds a dedicated driver for the Samsung s6e3fc2x01 panel used in OnePlus
> 6T smartphones which was previously driven by the sofef00 panel driver
> 
> Signed-off-by: Nia Espera <a5b6@riseup.net>
> Reviewed-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  MAINTAINERS                                   |   5 +
>  drivers/gpu/drm/panel/Kconfig                 |  12 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-samsung-s6e3fc2x01.c  | 388 ++++++++++++++++++

git log --oneline drivers/gpu/drm/panel indicates that the $subject
prefix should be "drm/panel:"

[..]
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 6d493b9d64fe..b54de8812e91 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -56,6 +56,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63M0_DSI) += panel-samsung-s6e63m0-dsi.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01) += panel-samsung-s6e88a0-ams452ef01.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) += panel-samsung-s6e8aa0.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF00) += panel-samsung-sofef00.o
> +obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3FC2X01) += panel-samsung-s6e3fc2x01.o
>  obj-$(CONFIG_DRM_PANEL_SEIKO_43WVF1G) += panel-seiko-43wvf1g.o
>  obj-$(CONFIG_DRM_PANEL_SHARP_LQ101R1SX01) += panel-sharp-lq101r1sx01.o
>  obj-$(CONFIG_DRM_PANEL_SHARP_LS037V7DW01) += panel-sharp-ls037v7dw01.o
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c b/drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c
[..]
> +static int s6e3fc2x01_panel_bl_update_status(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	int err;
> +	u16 brightness;
> +
> +	brightness = (u16)backlight_get_brightness(bl);
> +	// This panel needs the high and low bytes swapped for the brightness value

/* */ please

> +	brightness = __swab16(brightness);
> +
> +	err = mipi_dsi_dcs_set_display_brightness(dsi, brightness);

This returns a valid <= 0, so it would be nicer with just

	return mipi_dsi_dsc_set_display_brightness(...);

> +	if (err < 0)
> +		return err;
> +
> +	return 0;
> +}
> +
> +static const struct backlight_ops s6e3fc2x01_panel_bl_ops = {
> +	.update_status = s6e3fc2x01_panel_bl_update_status,
> +};
> +

Regards,
Bjorn
