Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 371A09C2251
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 17:45:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B0910E1C6;
	Fri,  8 Nov 2024 16:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Z6WyxZVs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40FF10EA05
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 16:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731084348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zyABKDkSuRd44oOd0M/YwV3Cu0tp/593i96APu8FlUY=;
 b=Z6WyxZVs0y4BsHI2KGzTUoJ+HsA4u/5zjdTHbef6hCYtKNusLAfSTiZDTfeIED46mt+Tn8
 1fSmktpgVTrYf7eZpKhslHIJAetNdbO3aNk20EJTKQhs1YDKIJyoptDzycBUndY0/0fApL
 tGHmCiUvSgalJ1i1rUU4pcTvGUX+Llo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-206-25LmoO3qOKClOD6DrtF_SA-1; Fri, 08 Nov 2024 11:45:46 -0500
X-MC-Unique: 25LmoO3qOKClOD6DrtF_SA-1
X-Mimecast-MFC-AGG-ID: 25LmoO3qOKClOD6DrtF_SA
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43154a0886bso16118885e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 08:45:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731084345; x=1731689145;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zyABKDkSuRd44oOd0M/YwV3Cu0tp/593i96APu8FlUY=;
 b=mdLjclxKQMxMChG/fJkuHFUAh6xnP9oDmYxq9oay/Y+kKl+dO8B2Yx0FhDAhJSjttD
 35RK5E5vPTVAGzpiLGP2P9r/1TdcVOAnx091QrBN88iFuJIH5Q9qhcRge+HbJLh3v0mL
 B4rsuO7UQdXRXQKsbxGoqU3IaHdAyPSESG3pJceV6wOmdevTpJjdXt89ci9xY5DCaq4q
 Hzxufqk8CI5Z/65SsNnJg/r5Do6OvftkV4xnHNc44gg5jPpmRv7TJczvYTOW/7GO1iXH
 Y1hWBmWkPV18wG+uefHQ3ZWyVkjCJ3GBusg5n1mFdzrKXwgKaL9kqzQ3eN0FUWPztuqO
 c7aQ==
X-Gm-Message-State: AOJu0YzF0x0Ruh+wc/Hhn7ZyiZYFO/v6Se5hSwYbxD4T4cgIHr38haHU
 SDmXEiw138MDBV9kS1zL7A7wpAJEpAThfDasyziWAzAU4mIA+ITzyRjQarmN1ZNKXx94czxIL4r
 YvR1g4vBGNtYpQu7YQC27yjDGzzWo13vhn2wMppGqSbLFWbbJ8a4Qdt+VjatnWp3HgabLlXYl3w
 ==
X-Received: by 2002:a05:6000:2a3:b0:381:e771:dc98 with SMTP id
 ffacd0b85a97d-381f186dd36mr2467303f8f.33.1731084345063; 
 Fri, 08 Nov 2024 08:45:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDsF8QoEpyvA0OtPpql7NkA4t32xjVK639qEcC1QbKnrrFgM9XqbWbeR9GrzhwB6xJkLPE6A==
X-Received: by 2002:a05:6000:2a3:b0:381:e771:dc98 with SMTP id
 ffacd0b85a97d-381f186dd36mr2467282f8f.33.1731084344579; 
 Fri, 08 Nov 2024 08:45:44 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed9a9c2dsm5380285f8f.60.2024.11.08.08.45.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2024 08:45:44 -0800 (PST)
Message-ID: <38162a8a-bca1-42ca-bf5c-81b8f1249eb7@redhat.com>
Date: Fri, 8 Nov 2024 17:45:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm: Move client code to clients/ subdirectory
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20241108154600.126162-1-tzimmermann@suse.de>
 <20241108154600.126162-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20241108154600.126162-2-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 95Zc3JMd4baNx2tWvL7CTZFPOYGMftD-c8Tiucyu17E_1731084345
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 08/11/2024 16:42, Thomas Zimmermann wrote:
> Just move some files around to keep source code well organized. Plus
> fix a type in the help text of CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM. No
> functional changes.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/Kconfig                       | 72 +-----------------
>   drivers/gpu/drm/Makefile                      |  9 +--
>   drivers/gpu/drm/clients/Kconfig               | 73 +++++++++++++++++++
>   drivers/gpu/drm/clients/Makefile              |  5 ++
>   .../gpu/drm/{ => clients}/drm_client_setup.c  |  0
>   .../gpu/drm/{ => clients}/drm_fbdev_client.c  |  0
>   6 files changed, 80 insertions(+), 79 deletions(-)
>   create mode 100644 drivers/gpu/drm/clients/Kconfig
>   create mode 100644 drivers/gpu/drm/clients/Makefile
>   rename drivers/gpu/drm/{ => clients}/drm_client_setup.c (100%)
>   rename drivers/gpu/drm/{ => clients}/drm_fbdev_client.c (100%)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 5504721007cc..fd294ccca6bb 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -217,77 +217,7 @@ config DRM_CLIENT
>   	  option. Drivers that support the default clients should
>   	  select DRM_CLIENT_SELECTION instead.
>   
> -config DRM_CLIENT_LIB
> -	tristate
> -	depends on DRM
> -	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
> -	select FB_CORE if DRM_FBDEV_EMULATION
> -	help
> -	  This option enables the DRM client library and selects all
> -	  modules and components according to the enabled clients.
> -
> -config DRM_CLIENT_SELECTION
> -	tristate
> -	depends on DRM
> -	select DRM_CLIENT_LIB if DRM_FBDEV_EMULATION
> -	help
> -	  Drivers that support in-kernel DRM clients have to select this
> -	  option.
> -
> -config DRM_CLIENT_SETUP
> -	bool
> -	depends on DRM_CLIENT_SELECTION
> -	help
> -	  Enables the DRM client selection. DRM drivers that support the
> -	  default clients should select DRM_CLIENT_SELECTION instead.
> -
> -menu "Supported DRM clients"
> -	depends on DRM_CLIENT_SELECTION
> -
> -config DRM_FBDEV_EMULATION
> -	bool "Enable legacy fbdev support for your modesetting driver"
> -	depends on DRM_CLIENT_SELECTION
> -	select DRM_CLIENT
> -	select DRM_CLIENT_SETUP
> -	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
> -	default FB
> -	help
> -	  Choose this option if you have a need for the legacy fbdev
> -	  support. Note that this support also provides the linux console
> -	  support on top of your modesetting driver.
> -
> -	  If in doubt, say "Y".
> -
> -config DRM_FBDEV_OVERALLOC
> -	int "Overallocation of the fbdev buffer"
> -	depends on DRM_FBDEV_EMULATION
> -	default 100
> -	help
> -	  Defines the fbdev buffer overallocation in percent. Default
> -	  is 100. Typical values for double buffering will be 200,
> -	  triple buffering 300.
> -
> -config DRM_FBDEV_LEAK_PHYS_SMEM
> -	bool "Shamelessly allow leaking of fbdev physical address (DANGEROUS)"
> -	depends on DRM_FBDEV_EMULATION && EXPERT
> -	default n
> -	help
> -	  In order to keep user-space compatibility, we want in certain
> -	  use-cases to keep leaking the fbdev physical address to the
> -	  user-space program handling the fbdev buffer.
> -	  This affects, not only, Amlogic, Allwinner or Rockchip devices
> -	  with ARM Mali GPUs using an userspace Blob.
> -	  This option is not supported by upstream developers and should be
> -	  removed as soon as possible and be considered as a broken and
> -	  legacy behaviour from a modern fbdev device driver.
> -
> -	  Please send any bug reports when using this to your proprietary
> -	  software vendor that requires this.
> -
> -	  If in doubt, say "N" or spread the word to your closed source
> -	  library vendor.
> -
> -endmenu
> +source "drivers/gpu/drm/clients/Kconfig"
>   
>   config DRM_LOAD_EDID_FIRMWARE
>   	bool "Allow to specify an EDID data set instead of probing for it"
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 463afad1b5ca..4f6585be14cc 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -148,14 +148,6 @@ drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
>   drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
>   obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
>   
> -#
> -# DRM clients
> -#
> -
> -drm_client_lib-y := drm_client_setup.o
> -drm_client_lib-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fbdev_client.o
> -obj-$(CONFIG_DRM_CLIENT_LIB) += drm_client_lib.o
> -
>   #
>   # Drivers and the rest
>   #
> @@ -165,6 +157,7 @@ obj-y			+= tests/
>   obj-$(CONFIG_DRM_MIPI_DBI) += drm_mipi_dbi.o
>   obj-$(CONFIG_DRM_MIPI_DSI) += drm_mipi_dsi.o
>   obj-y			+= arm/
> +obj-y			+= clients/
>   obj-y			+= display/
>   obj-$(CONFIG_DRM_TTM)	+= ttm/
>   obj-$(CONFIG_DRM_SCHED)	+= scheduler/
> diff --git a/drivers/gpu/drm/clients/Kconfig b/drivers/gpu/drm/clients/Kconfig
> new file mode 100644
> index 000000000000..01ad3b000130
> --- /dev/null
> +++ b/drivers/gpu/drm/clients/Kconfig
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config DRM_CLIENT_LIB
> +	tristate
> +	depends on DRM
> +	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
> +	select FB_CORE if DRM_FBDEV_EMULATION
> +	help
> +	  This option enables the DRM client library and selects all
> +	  modules and components according to the enabled clients.
> +
> +config DRM_CLIENT_SELECTION
> +	tristate
> +	depends on DRM
> +	select DRM_CLIENT_LIB if DRM_FBDEV_EMULATION
> +	help
> +	  Drivers that support in-kernel DRM clients have to select this
> +	  option.
> +
> +config DRM_CLIENT_SETUP
> +	bool
> +	depends on DRM_CLIENT_SELECTION
> +	help
> +	  Enables the DRM client selection. DRM drivers that support the
> +	  default clients should select DRM_CLIENT_SELECTION instead.
> +
> +menu "Supported DRM clients"
> +	depends on DRM_CLIENT_SELECTION
> +
> +config DRM_FBDEV_EMULATION
> +	bool "Enable legacy fbdev support for your modesetting driver"
> +	depends on DRM_CLIENT_SELECTION
> +	select DRM_CLIENT
> +	select DRM_CLIENT_SETUP
> +	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
> +	default FB
> +	help
> +	  Choose this option if you have a need for the legacy fbdev
> +	  support. Note that this support also provides the linux console
> +	  support on top of your modesetting driver.
> +
> +	  If in doubt, say "Y".
> +
> +config DRM_FBDEV_OVERALLOC
> +	int "Overallocation of the fbdev buffer"
> +	depends on DRM_FBDEV_EMULATION
> +	default 100
> +	help
> +	  Defines the fbdev buffer overallocation in percent. Default
> +	  is 100. Typical values for double buffering will be 200,
> +	  triple buffering 300.
> +
> +config DRM_FBDEV_LEAK_PHYS_SMEM
> +	bool "Shamelessly allow leaking of fbdev physical address (DANGEROUS)"
> +	depends on DRM_FBDEV_EMULATION && EXPERT
> +	default n
> +	help
> +	  In order to keep user-space compatibility, we want in certain
> +	  use-cases to keep leaking the fbdev physical address to the
> +	  user-space program handling the fbdev buffer.
> +	  This affects, not only, Amlogic, Allwinner or Rockchip devices
> +	  with ARM Mali GPUs using a userspace Blob.
> +	  This option is not supported by upstream developers and should be
> +	  removed as soon as possible and be considered as a broken and
> +	  legacy behaviour from a modern fbdev device driver.
> +
> +	  Please send any bug reports when using this to your proprietary
> +	  software vendor that requires this.
> +
> +	  If in doubt, say "N" or spread the word to your closed source
> +	  library vendor.
> +
> +endmenu
> diff --git a/drivers/gpu/drm/clients/Makefile b/drivers/gpu/drm/clients/Makefile
> new file mode 100644
> index 000000000000..1d004ec92e1e
> --- /dev/null
> +++ b/drivers/gpu/drm/clients/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +drm_client_lib-y := drm_client_setup.o
> +drm_client_lib-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fbdev_client.o
> +obj-$(CONFIG_DRM_CLIENT_LIB) += drm_client_lib.o
> diff --git a/drivers/gpu/drm/drm_client_setup.c b/drivers/gpu/drm/clients/drm_client_setup.c
> similarity index 100%
> rename from drivers/gpu/drm/drm_client_setup.c
> rename to drivers/gpu/drm/clients/drm_client_setup.c
> diff --git a/drivers/gpu/drm/drm_fbdev_client.c b/drivers/gpu/drm/clients/drm_fbdev_client.c
> similarity index 100%
> rename from drivers/gpu/drm/drm_fbdev_client.c
> rename to drivers/gpu/drm/clients/drm_fbdev_client.c

