Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A6B662337
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 11:29:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A963D10E3CA;
	Mon,  9 Jan 2023 10:29:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04DA910E3C8;
 Mon,  9 Jan 2023 10:29:50 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id fy8so18793337ejc.13;
 Mon, 09 Jan 2023 02:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=53yCfXCnGBqKSDgva2IDsy44ww2slUgVQWJ4k6Gom1E=;
 b=l4yl+LSq/wtEZwE/vtpD5m+M2J2pOQPMaWpd1hz+4x9HkSwCNaepXZyD6wbe/4ERVd
 EyUJtYiiJjNhoBuqd89b+8NmAQGYFevcn6hOsCBNalHDub4bFD74QdXcleXhryH1bCcA
 qcGGu2Ih2mAGPdloSOm8sYlAhrxb2Tv/MFJuGxbQkjXAMGvCgrgQJVjzCnX8lPZS+Ulj
 plrXyqpwL8vg8BSNNOYrJMdgr8lskr26FZrmVi/WhfFB6jEAYOfVq85lBRd45BzGWDLR
 ZwcJT5nrFTnrNTOsUwwk1wP+wrYO3djoGMemsbWXfmWTnIQ1koSxjx9OBqoC1gEHyxpr
 XBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=53yCfXCnGBqKSDgva2IDsy44ww2slUgVQWJ4k6Gom1E=;
 b=1YIabCrC1BO/Ew19iiCHCVaAYagxchzYmFgF08iZqH0DT/WzyKn8B3aq8x0l9QX/1E
 DWOdBe0T334Xc5mfXAZzLVwvGb6a3Pla0fJMYcRqfO2kilUDURrw7vxDveLeItwT8C6K
 r3oNsolllCokx9LS+iWKeqH/7jzpLPI2SbWGPTsVIVCKz8m4D1vNHehtWB7qDHjM0smV
 7zq6eKNC9D/Bi36EYK8pNgXLlh6C+n3jCBghGDTiB4Mnp6uWYMcPy7ZzaVlSL3x5OMp4
 FBNYYhhrxS6PlsjdSCP03fIZmt8su2r74vVKm4qYLxbqkhy04vSui30zilleZGPciC9p
 /CYg==
X-Gm-Message-State: AFqh2koK3MRbUe1gYZTXmhHGGP2NCWvRBcWFENbbapeu1N3ZE4rmfzjM
 qwviHMLyp5iI/Xehw6soz8E=
X-Google-Smtp-Source: AMrXdXsY2iJSM/uBTyGIF/IRda+e/pLJC9vqHSLloQntq+Izb0PZ2v4QxNOWoU5TDvE3N4rHk+toGw==
X-Received: by 2002:a17:906:191a:b0:84d:3822:a14e with SMTP id
 a26-20020a170906191a00b0084d3822a14emr5069702eje.64.1673260189522; 
 Mon, 09 Jan 2023 02:29:49 -0800 (PST)
Received: from [192.168.178.21] (p5b0ea2e7.dip0.t-ipconnect.de.
 [91.14.162.231]) by smtp.gmail.com with ESMTPSA id
 u10-20020a1709061daa00b0084cc87c03ebsm3569544ejh.110.2023.01.09.02.29.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 02:29:49 -0800 (PST)
Message-ID: <2d3b3fcb-e8d5-c123-df6b-0e09c90b22a5@gmail.com>
Date: Mon, 9 Jan 2023 11:29:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/5] drm: Include <linux/backlight.h> where needed
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 patrik.r.jakobsson@gmail.com, thierry.reding@gmail.com, sam@ravnborg.org,
 f.fainelli@gmail.com
References: <20230109101243.26995-1-tzimmermann@suse.de>
 <20230109101243.26995-2-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230109101243.26995-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.01.23 um 11:12 schrieb Thomas Zimmermann:
> Include <linux/backlight.h> in source files that need it. Some of
> DRM's source code gets the backlight header via drm_crtc_helper.h
> and <linux/fb.h>, which can leed to unnecessary recompilation. If
> possible, do not include drm_crtc_helper.h any longer.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Christian König <christian.koenig@amd.com> for the amdgpu parts.

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c          | 2 +-
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 1 +
>   drivers/gpu/drm/gma500/backlight.c                | 2 ++
>   drivers/gpu/drm/radeon/radeon_acpi.c              | 2 +-
>   4 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> index 57b5e11446c6..f29c1d0ad4c1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -24,6 +24,7 @@
>   
>   #include <linux/pci.h>
>   #include <linux/acpi.h>
> +#include <linux/backlight.h>
>   #include <linux/slab.h>
>   #include <linux/power_supply.h>
>   #include <linux/pm_runtime.h>
> @@ -31,7 +32,6 @@
>   #include <acpi/video.h>
>   #include <acpi/actbl.h>
>   
> -#include <drm/drm_crtc_helper.h>
>   #include "amdgpu.h"
>   #include "amdgpu_pm.h"
>   #include "amdgpu_display.h"
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 1b7f20a9d4ae..55a845eb0c6d 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -67,6 +67,7 @@
>   #include "ivsrcid/ivsrcid_vislands30.h"
>   
>   #include "i2caux_interface.h"
> +#include <linux/backlight.h>
>   #include <linux/module.h>
>   #include <linux/moduleparam.h>
>   #include <linux/types.h>
> diff --git a/drivers/gpu/drm/gma500/backlight.c b/drivers/gpu/drm/gma500/backlight.c
> index 577a4987b193..8711a7a5b8da 100644
> --- a/drivers/gpu/drm/gma500/backlight.c
> +++ b/drivers/gpu/drm/gma500/backlight.c
> @@ -7,6 +7,8 @@
>    * Authors: Eric Knopp
>    */
>   
> +#include <linux/backlight.h>
> +
>   #include <acpi/video.h>
>   
>   #include "psb_drv.h"
> diff --git a/drivers/gpu/drm/radeon/radeon_acpi.c b/drivers/gpu/drm/radeon/radeon_acpi.c
> index b603c0b77075..5771d1fcb073 100644
> --- a/drivers/gpu/drm/radeon/radeon_acpi.c
> +++ b/drivers/gpu/drm/radeon/radeon_acpi.c
> @@ -22,6 +22,7 @@
>    */
>   
>   #include <linux/acpi.h>
> +#include <linux/backlight.h>
>   #include <linux/pci.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/power_supply.h>
> @@ -30,7 +31,6 @@
>   #include <acpi/acpi_bus.h>
>   #include <acpi/video.h>
>   
> -#include <drm/drm_crtc_helper.h>
>   #include <drm/drm_probe_helper.h>
>   
>   #include "atom.h"

