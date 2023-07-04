Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C454E747627
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 18:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF3B10E2E8;
	Tue,  4 Jul 2023 16:12:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C64ED10E2E8
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 16:12:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 430C615BF
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 09:12:52 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 809043F73F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 09:12:09 -0700 (PDT)
Date: Tue, 4 Jul 2023 17:12:01 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v4 3/5] drm/arm: Make ARM devices menu depend on DRM
Message-ID: <ZKRE0T-3Mbht8HZT@e110455-lin.cambridge.arm.com>
References: <20230703230534.997525-1-javierm@redhat.com>
 <20230703230534.997525-4-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230703230534.997525-4-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 04, 2023 at 01:05:27AM +0200, Javier Martinez Canillas wrote:
> Otherwise if CONFIG_DRM is disabled, menuconfig will show an empty menu.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/arm/Kconfig b/drivers/gpu/drm/arm/Kconfig
> index c1b89274d2a4..ddf20708370f 100644
> --- a/drivers/gpu/drm/arm/Kconfig
> +++ b/drivers/gpu/drm/arm/Kconfig
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  menu "ARM devices"
> +	depends on DRM
>  
>  config DRM_HDLCD
>  	tristate "ARM HDLCD"
> -- 
> 2.41.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
