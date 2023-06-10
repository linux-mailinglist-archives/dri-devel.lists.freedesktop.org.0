Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE3472AE91
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jun 2023 22:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 437A810E19D;
	Sat, 10 Jun 2023 20:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com
 (mailrelay3-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:402::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE21910E19D
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jun 2023 20:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=padgU8s5hyXPctqePnpp8NUPuXdPqhIOqL4Bch4nNx0=;
 b=FU60putRwjTG3EPXHxbeFvXmBPkVQXMSMrYpH9HDTMfTjn+c7VmbkW8ZRNZczS9I1dRSVgE6b6gDP
 4KLo7tgYgPKUq9uFqUrnfzYpGSEx+UNNkAeGlz9nZxCkJB52gPaWZRwwT5nSMR2ixXgV+jDLrPiE5p
 3hgcUDEO8t7NQmcm2p0AjHSeYuYJCY1kkRn9LT6/bpyuTfJP5aZx8L/rQd0twpffFY8hZ033hYfG6U
 gmzpl5E4I6a4EsaOa4G4X5VXVGYhpthSkKfB7mN8MXu63jJ2CBp3o90pTuBRXRTIUT1gGmMSKwXR6K
 Gb6Fy9L5W8oL3GVN+gc9hFwzFpDaXMw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=padgU8s5hyXPctqePnpp8NUPuXdPqhIOqL4Bch4nNx0=;
 b=cODhLGQibi4kv17eQLV5RB9SIbRKBnhiuIok6BsujoMT3otOx4Fu9QoUHCU9ff/oXwZv3N1ufy/yi
 4kqMqyZDg==
X-HalOne-ID: 298068bd-07cb-11ee-b81c-b90637070a9d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3 (Halon) with ESMTPSA
 id 298068bd-07cb-11ee-b81c-b90637070a9d;
 Sat, 10 Jun 2023 20:12:48 +0000 (UTC)
Date: Sat, 10 Jun 2023 22:12:46 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 3/7] drm/panel: sitronix-st7789v: Specify the expected
 bus format
Message-ID: <20230610201246.GD1041001@ravnborg.org>
References: <20230609145951.853533-1-miquel.raynal@bootlin.com>
 <20230609145951.853533-4-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609145951.853533-4-miquel.raynal@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 09, 2023 at 04:59:47PM +0200, Miquel Raynal wrote:
> The LCD controller supports RGB444, RGB565 and RGB888. The value that is
> written in the COLMOD register indicates using RGB888, so let's clearly
> specify the in-use bus format.

Confused.
MEDIA_BUS_FMT_RGB666_1X18 assumes 6 bits per color.
But RGB888 is 8 bits per color.

Something that I have forgotten, or is this inconsistent?

	Sam

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> index e9ca7ebb458a..0abb45bea18d 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> @@ -6,6 +6,7 @@
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
> +#include <linux/media-bus-format.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/spi/spi.h>
>  
> @@ -170,6 +171,7 @@ static int st7789v_get_modes(struct drm_panel *panel,
>  			     struct drm_connector *connector)
>  {
>  	struct drm_display_mode *mode;
> +	u32 bus_format = MEDIA_BUS_FMT_RGB666_1X18;
>  
>  	mode = drm_mode_duplicate(connector->dev, &default_mode);
>  	if (!mode) {
> @@ -186,6 +188,8 @@ static int st7789v_get_modes(struct drm_panel *panel,
>  
>  	connector->display_info.width_mm = 61;
>  	connector->display_info.height_mm = 103;
> +	drm_display_info_set_bus_formats(&connector->display_info,
> +					 &bus_format, 1);
>  
>  	return 1;
>  }
> -- 
> 2.34.1
