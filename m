Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF39B069FF
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 01:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8592D10E730;
	Tue, 15 Jul 2025 23:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kzkvdF8/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D557610E730
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 23:43:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F35F861489;
 Tue, 15 Jul 2025 23:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D22C4CEE3;
 Tue, 15 Jul 2025 23:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752622984;
 bh=oIkUYfDgAMBmComyQL46QfRRvvbeCNaERG0b0OclZGA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kzkvdF8/yTgHzxS4GWWzOX3MNf4yT/HYcZnvr8glkE4W0Pxmu1lz7A2uYcEN+XzuW
 nOVolShmJUUj28oA7KzqfIQmVGgOHB1uSA956PstXl9/dP6eBxTYNrd5zbcDNUCaky
 mcMRxKlylObJc+6tQ8djX6o71Mw8eSltMXt00dopXLGeGeRZwZwA+15HQq6/KQ31iE
 HelbunvlA9M9ptdjzLuuVQ+MxVeZbnaucqNQa/LJLrG87dvcuKUp6VCBAhGgcgLnCx
 pzn3lOi3QgJC46OAhOkiOWujzQ0zWjhRR9bZaJNiECosEvyiX5jUrsjf9lSgiPRbIx
 jhLz6kvar9zZQ==
Received: by venus (Postfix, from userid 1000)
 id 6D31F180F0F; Wed, 16 Jul 2025 01:43:02 +0200 (CEST)
Date: Wed, 16 Jul 2025 01:43:02 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, 
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, deller@gmx.de, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, fnkl.kernel@gmail.com, j@jannau.net, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, 
 sven@kernel.org, alyssa@rosenzweig.io, neal@gompa.dev, 
 support.opensource@diasemi.com, duje.mihanovic@skole.hr,
 dri-devel@lists.freedesktop.org, 
 asahi@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 02/15] drm/panel: panel-samsung-s6e63m0: Include
 <linux/of.h>
Message-ID: <67hurwpxz4c2ropgbq3q6umybr2fgucgtbdu4qc6y3qk3uypc4@3xkijgin5ydl>
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715122643.137027-3-tzimmermann@suse.de>
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

Hi,

On Tue, Jul 15, 2025 at 02:24:39PM +0200, Thomas Zimmermann wrote:
> Include <linux/of.h> to declare device_property_read_u32(). Avoids
> dependency on backlight header to include it.

device_property_*() is from <linux/property.h>, which is already
included in the following line...

Greetings,

-- Sebastian

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/panel/panel-samsung-s6e63m0.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
> index ea241c89593b..930948cb615f 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
> @@ -16,6 +16,7 @@
>  #include <linux/export.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/property.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/media-bus-format.h>
> -- 
> 2.50.0
> 
