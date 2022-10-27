Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7632860FFE0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 20:12:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0560E10E074;
	Thu, 27 Oct 2022 18:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46CDF10E074
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 18:11:55 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 m5-20020a9d73c5000000b0066738ce4f12so1504538otk.12
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 11:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QJtzOhE6/L30ry0uaWLAjIXQQZvTKtHnJVm+sCzBkQc=;
 b=g1C9zReZykwnHPreZdHmP+71ORV2Kk5V+Mlk2VuFx3UtBigXhYbVhrS7VfZv/pIJkf
 N5LqRPpKBG9KvN3fl3sMOaY4i5h+zF5JfqRDV9GW96hJ0bzMAf6bLlnUCw1Zu8s0EFIa
 Lwhxbbgs892tEBtA1qI6zsAFukgcFwpNfOURFMjSoeXNtlBJjw+gmsxRtrmqP9x9WtFq
 rZloSKRuArJaf832NVz9CmZwD+V3g3hdi7c8yY+uhq1tlx4gQGv4M9oSy4dnWqjDOy/G
 lvRW1tkd3Gykd2fXWuhtSNJun1XHoaFE6SeqGeml4HkCbqbcyLRekrq8Wz5T2nbJ7agT
 LmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QJtzOhE6/L30ry0uaWLAjIXQQZvTKtHnJVm+sCzBkQc=;
 b=ZRj+0StIPatVQqY9h8+lguOgDiLKqH2aHonL3ySgG7X5vELoMRIF8BLq2xXmHvm25d
 s7siZFc31LbglM2nQG/+oNnc8FBlDyalFbVrzGHFCK/uCXPZEhS6B66nvK75K9u+OX4z
 w9JRUPafegl7Tgr9c2L3nuyvhS/yPa0/apU/86X5W1SOzepd56S2l8KzTI0S77kUY60C
 2YKGvzOUESjzefMo0fH0iJXu9cCmPMnJ8Cj8DX2usUwrg1MZrBHQDkmQYEtAjLWwfc8G
 E8NiSapas+w+ZVgaDVbzNMh05PwSNT8H/tRPQ6f9yRsX2D0EcK4lTu2sc5Rej31mIjk7
 VCyw==
X-Gm-Message-State: ACrzQf32D4CYIK2buoe+2GlzUUVDqfYp2j8WaAsj2XfBuj8u9C6YTjSe
 lp39CufqYgqeiaqexA7nzBL7+MTpqoz7xwASw1k=
X-Google-Smtp-Source: AMsMyM4jjuFrlpqBqyFRhAzTZBKokkpHZpdKZ5Rkt35nql6+sCJLV89w05XmokGXcuGbrRTBVVtbaTEIwG7XIxlogbU=
X-Received: by 2002:a9d:6645:0:b0:661:b778:41b8 with SMTP id
 q5-20020a9d6645000000b00661b77841b8mr25371917otm.233.1666894314391; Thu, 27
 Oct 2022 11:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <20221026161935.6491-1-afd@ti.com>
In-Reply-To: <20221026161935.6491-1-afd@ti.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 27 Oct 2022 14:11:43 -0400
Message-ID: <CADnq5_OLHbGrq-hTFpyUfawHMwMRAkT84-coAfCweKbPeSZBrA@mail.gmail.com>
Subject: Re: [PATCH v3] drm: Move radeon and amdgpu Kconfig options into their
 directories
To: Andrew Davis <afd@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Oct 26, 2022 at 12:31 PM Andrew Davis <afd@ti.com> wrote:
>
> Most Kconfig options to enable a driver are in the Kconfig file
> inside the relevant directory, move these two to the same.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>
> Changes from v2:
>  - Rebased on latest
>
> Changes from v1:
>  - Fix whitespace issue pointed out by Randy
>
>  drivers/gpu/drm/Kconfig            | 57 ------------------------------
>  drivers/gpu/drm/amd/amdgpu/Kconfig | 29 +++++++++++++++
>  drivers/gpu/drm/radeon/Kconfig     | 30 ++++++++++++++++
>  3 files changed, 59 insertions(+), 57 deletions(-)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index fa986075e8fb..9c2d9495cb3c 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -233,65 +233,8 @@ source "drivers/gpu/drm/i2c/Kconfig"
>
>  source "drivers/gpu/drm/arm/Kconfig"
>
> -config DRM_RADEON
> -       tristate "ATI Radeon"
> -       depends on DRM && PCI && MMU
> -       depends on AGP || !AGP
> -       select FW_LOADER
> -       select DRM_DISPLAY_DP_HELPER
> -       select DRM_DISPLAY_HELPER
> -        select DRM_KMS_HELPER
> -        select DRM_TTM
> -       select DRM_TTM_HELPER
> -       select SND_HDA_COMPONENT if SND_HDA_CORE
> -       select POWER_SUPPLY
> -       select HWMON
> -       select BACKLIGHT_CLASS_DEVICE
> -       select INTERVAL_TREE
> -       # radeon depends on ACPI_VIDEO when ACPI is enabled, for select t=
o work
> -       # ACPI_VIDEO's dependencies must also be selected.
> -       select INPUT if ACPI
> -       select ACPI_VIDEO if ACPI
> -       # On x86 ACPI_VIDEO also needs ACPI_WMI
> -       select X86_PLATFORM_DEVICES if ACPI && X86
> -       select ACPI_WMI if ACPI && X86
> -       help
> -         Choose this option if you have an ATI Radeon graphics card.  Th=
ere
> -         are both PCI and AGP versions.  You don't need to choose this t=
o
> -         run the Radeon in plain VGA mode.
> -
> -         If M is selected, the module will be called radeon.
> -
>  source "drivers/gpu/drm/radeon/Kconfig"
>
> -config DRM_AMDGPU
> -       tristate "AMD GPU"
> -       depends on DRM && PCI && MMU
> -       select FW_LOADER
> -       select DRM_DISPLAY_DP_HELPER
> -       select DRM_DISPLAY_HDMI_HELPER
> -       select DRM_DISPLAY_HELPER
> -       select DRM_KMS_HELPER
> -       select DRM_SCHED
> -       select DRM_TTM
> -       select DRM_TTM_HELPER
> -       select POWER_SUPPLY
> -       select HWMON
> -       select BACKLIGHT_CLASS_DEVICE
> -       select INTERVAL_TREE
> -       select DRM_BUDDY
> -       # amdgpu depends on ACPI_VIDEO when ACPI is enabled, for select t=
o work
> -       # ACPI_VIDEO's dependencies must also be selected.
> -       select INPUT if ACPI
> -       select ACPI_VIDEO if ACPI
> -       # On x86 ACPI_VIDEO also needs ACPI_WMI
> -       select X86_PLATFORM_DEVICES if ACPI && X86
> -       select ACPI_WMI if ACPI && X86
> -       help
> -         Choose this option if you have a recent AMD Radeon graphics car=
d.
> -
> -         If M is selected, the module will be called amdgpu.
> -
>  source "drivers/gpu/drm/amd/amdgpu/Kconfig"
>
>  source "drivers/gpu/drm/nouveau/Kconfig"
> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amd=
gpu/Kconfig
> index 7777d55275de..5fcd510f1abb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
> @@ -1,4 +1,33 @@
>  # SPDX-License-Identifier: MIT
> +
> +config DRM_AMDGPU
> +       tristate "AMD GPU"
> +       depends on DRM && PCI && MMU
> +       select FW_LOADER
> +       select DRM_DISPLAY_DP_HELPER
> +       select DRM_DISPLAY_HDMI_HELPER
> +       select DRM_DISPLAY_HELPER
> +       select DRM_KMS_HELPER
> +       select DRM_SCHED
> +       select DRM_TTM
> +       select DRM_TTM_HELPER
> +       select POWER_SUPPLY
> +       select HWMON
> +       select BACKLIGHT_CLASS_DEVICE
> +       select INTERVAL_TREE
> +       select DRM_BUDDY
> +       # amdgpu depends on ACPI_VIDEO when ACPI is enabled, for select t=
o work
> +       # ACPI_VIDEO's dependencies must also be selected.
> +       select INPUT if ACPI
> +       select ACPI_VIDEO if ACPI
> +       # On x86 ACPI_VIDEO also needs ACPI_WMI
> +       select X86_PLATFORM_DEVICES if ACPI && X86
> +       select ACPI_WMI if ACPI && X86
> +       help
> +         Choose this option if you have a recent AMD Radeon graphics car=
d.
> +
> +         If M is selected, the module will be called amdgpu.
> +
>  config DRM_AMDGPU_SI
>         bool "Enable amdgpu support for SI parts"
>         depends on DRM_AMDGPU
> diff --git a/drivers/gpu/drm/radeon/Kconfig b/drivers/gpu/drm/radeon/Kcon=
fig
> index 52819e7f1fca..2267c501f724 100644
> --- a/drivers/gpu/drm/radeon/Kconfig
> +++ b/drivers/gpu/drm/radeon/Kconfig
> @@ -1,4 +1,34 @@
>  # SPDX-License-Identifier: MIT
> +
> +config DRM_RADEON
> +       tristate "ATI Radeon"
> +       depends on DRM && PCI && MMU
> +       depends on AGP || !AGP
> +       select FW_LOADER
> +       select DRM_DISPLAY_DP_HELPER
> +       select DRM_DISPLAY_HELPER
> +       select DRM_KMS_HELPER
> +       select DRM_TTM
> +       select DRM_TTM_HELPER
> +       select SND_HDA_COMPONENT if SND_HDA_CORE
> +       select POWER_SUPPLY
> +       select HWMON
> +       select BACKLIGHT_CLASS_DEVICE
> +       select INTERVAL_TREE
> +       # radeon depends on ACPI_VIDEO when ACPI is enabled, for select t=
o work
> +       # ACPI_VIDEO's dependencies must also be selected.
> +       select INPUT if ACPI
> +       select ACPI_VIDEO if ACPI
> +       # On x86 ACPI_VIDEO also needs ACPI_WMI
> +       select X86_PLATFORM_DEVICES if ACPI && X86
> +       select ACPI_WMI if ACPI && X86
> +       help
> +         Choose this option if you have an ATI Radeon graphics card.  Th=
ere
> +         are both PCI and AGP versions.  You don't need to choose this t=
o
> +         run the Radeon in plain VGA mode.
> +
> +         If M is selected, the module will be called radeon.
> +
>  config DRM_RADEON_USERPTR
>         bool "Always enable userptr support"
>         depends on DRM_RADEON
> --
> 2.37.3
>
