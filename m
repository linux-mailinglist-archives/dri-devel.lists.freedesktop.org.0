Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7B6CA3383
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 11:29:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9400A10E910;
	Thu,  4 Dec 2025 10:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="XFx14s3O";
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="b/D8pXTl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 371 seconds by postgrey-1.36 at gabe;
 Thu, 04 Dec 2025 10:29:20 UTC
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBCA210E910
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 10:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1764843786; bh=UeOw/ARrHPv6xrGasuUY7S88OnbZfA31zOs7DVv9hag=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XFx14s3O+agBfLWStyMI5xyBEhX5K2ZytHWOErrY7hpMd0vwLhHcDMR8ND2VcEz+f
 FsyIr4133Bb/9AlrQkcCKKFfYqzKkOkWLfpBtzF+DHQ3Ee6GhT0QjeJH0wHhSC0Bli
 KPv8YFFYYfTF6XzSWuhWdHbx585zE3GGl0uFrJKBwfgobg32E0i3XsuXCrEO5UDBip
 tuCw+qwV2Uia3EpaU7TYRuj2NRMUqRXID9M/Ssh/pIFwSaQjalg7nottRm37FL8i4I
 G+KTTzNtv/e1KNhZ0xovsFok4IC9Fv13c9fXRcITIFR1z42ulzjgpn4uhbkffbvoBA
 wejifch0NzbEQ==
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 3B181FB03;
 Thu,  4 Dec 2025 11:23:06 +0100 (CET)
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0LezK-AyUMc6; Thu,  4 Dec 2025 11:23:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1764843784; bh=UeOw/ARrHPv6xrGasuUY7S88OnbZfA31zOs7DVv9hag=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b/D8pXTl17XvvMe8Cf8/8UIkoNMvhjGFexhoFqWxMi1iUnb+ksTLjG6RZ90jMzy3H
 9P8jMovI1/5fUkAiwNKGlrr6S/+ZXV/dR5iXHZJKwgPB+/UOyIrGstAoANOeWv9dTP
 nK3SW5HDn8jfcxwcxv9E10+XwbWfvnfg4HYfiiRMyt9IshOs8HMzkGnQ/zkHjmcHvJ
 sMPxo0xfsmi8HEsuc4ozusIwfKMlPeva+11iShy7jKYGFvkoEyaGXBCmWlBYpSTkXE
 f1LWnQbkXt9m031v24rhVhfPRWQDAVbZl2m9dC8lkCEBxt3jmHbbS9ZqmqVN9xkG1F
 4aJn3i8VMBJig==
Date: Thu, 4 Dec 2025 11:23:02 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Arnd Bergmann <arnd@arndb.de>, Jessica Zhang <jesszhan0024@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, David Heidelberg <david@ixit.cz>,
 Linus Walleij <linus.walleij@linaro.org>,
 Kaustabh Chakraborty <kauschluss@disroot.org>,
 Maxim Schwalm <maxim.schwalm@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Colin Ian King <colin.i.king@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: visionox-rm69299: add backlight dependency
Message-ID: <aTFhBtzzKbN3mjqw@quark2.heme.sigxcpu.org>
References: <20251204094734.1031114-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204094734.1031114-1-arnd@kernel.org>
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
On Thu, Dec 04, 2025 at 10:47:26AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The recently added backlight support breaks when CONFIG_BACKLIGHT_CLASS_DEVICE
> is turned off:
> 
> arm-linux-gnueabi-ld: drivers/gpu/drm/panel/panel-visionox-rm69299.o: in function `visionox_rm69299_probe':
> panel-visionox-rm69299.c:(.text.visionox_rm69299_probe+0x92): undefined reference to `devm_backlight_device_register'
> arm-linux-gnueabi-ld: (devm_backlight_device_register): Unknown destination type (ARM/Thumb) in drivers/gpu/drm/panel/panel-visionox-rm69299.o
> 
> Add the appropriate Kconfig dependency.
> 
> Fixes: 7911d8cab554 ("drm/panel: visionox-rm69299: Add backlight support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for looking at this. This is a duplicate of

  https://lore.kernel.org/phone-devel/20251017-visionox-rm69299-bl-v2-1-9dfa06606754@sigxcpu.org/

though, idk why it didn't get applied.

Cheers,
 -- Guido

> ---
>  drivers/gpu/drm/panel/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 76f6af819037..2923148dcf07 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -1163,6 +1163,7 @@ config DRM_PANEL_VISIONOX_R66451
>  
>  config DRM_PANEL_VISIONOX_RM69299
>  	tristate "Visionox RM69299"
> +	depends on BACKLIGHT_CLASS_DEVICE
>  	depends on OF
>  	depends on DRM_MIPI_DSI
>  	help
> -- 
> 2.39.5
> 
