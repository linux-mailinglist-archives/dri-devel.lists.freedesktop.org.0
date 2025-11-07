Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF2AC3EB89
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 08:15:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D737D10EA32;
	Fri,  7 Nov 2025 07:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GW/KArlr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991AD10EA32
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 07:15:12 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-7866e9e62e1so4400697b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 23:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762499711; x=1763104511; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xip+2O6schjrhaI6mmV5w1P/EwoowfgFbjOclMzsDd8=;
 b=GW/KArlrLsuP41WrumyKsYrEGVqgtdGUW4MYO5/DJhza0iumCfDGfMNOd74xl5ro+O
 syp5meFMaKbNkxC+rzG5XeP03YcEfkAqUvfOYvpUniUKJP9xmJpmFjPuLh7to21UwoVV
 pskf2XqxqjvvUCHjFe+8wi7sg2ybpx4o6BEEdxvoQ7UZcRkVb7iEkBeVFeaa4afmEeRA
 tuiuVIOIbA/86sYtIHsZCqCmm0N+J9tGUiEqfI2CwbaMPa8T1UAVz6E7t/cyyBSorgr4
 7on5p5aHZa26i0VSuoA2PvX8WC24Hi6qPe81JTFKNXGgbBOQ486Y+njmOIoqbdv3ApUo
 T/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762499711; x=1763104511;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Xip+2O6schjrhaI6mmV5w1P/EwoowfgFbjOclMzsDd8=;
 b=eyMBLH/IT9ZggebfHRrK5U/kLoJz8nVR8KDrMxV5BP+uyoHpb+5J7FNsEuNBaTunud
 /fl1vBcy8WUgKY20TOvdf85sKAcqhTxwgo2v5k5eJAsC3IlkAonjpM5n0iZX/Io1Fgeq
 Ao0mgu4H+5zLsYBmBu4SCoeJHIjYa+Maoz6VpWc2EJjeYoS0ZbWbD61eR2Pe8/KvOhDf
 Ay3gF7g6/PWcSiwRqrUWVxmehm68yZGnZpOjGJtqaR7MZd0iTBKmlZx/3MXxaOEu2zX+
 NSR9L9ZL2bHuaoK5aUIvbrJgfA5AnVqD0ooAkUGN6+5aOHw48ovvMiSqUakM23UwJOcU
 tYrQ==
X-Gm-Message-State: AOJu0YzeD6k3t+n56mBo5pUX4/FyX0BylFtNwEdlqk8TEfXVBdYKv+1X
 tavY+KLGkLJvWjCQHWxV4Bs0b4qfTvKL9cYhWEbbBmZfnRPF5NY6lMzSGuQ/ZUVbeX/7wvP6nEn
 r+zCFTnwdIjUH/sX+t/PKQLXATpuMvXo=
X-Gm-Gg: ASbGncvGH1rtcriLDO5cll7Q1cG8Yo0fLL6ZdaH8Nyz/aUPGsd//vi/Us95VI9QZ3K6
 0cQRPsv03RK7oT4kZRhbfTQo0XqVZotYuF5HJBZrfbeshiD8X56Q13RgQ4bS4sJrmhGPIV02gHw
 DMC0x8S6t6Y8hJf4emkcRDYv0jgO40dsYjcQobqodMuxMEnErsCceS3KwkMIm7Nir+H2gLYZcvk
 pP21ad6KPnG++Je6gAagN6MHyP1SrERECg2Rou1pZWpKKdORDlOpnPPVFaCD18=
X-Google-Smtp-Source: AGHT+IFAdMCevJQoAt/cDyGvIiv9xpsut9zJdw9OptFv9NkTe4Kjc0B061qpfXMwebTIHzjSVFfnEzwvLZclGJvhLg4=
X-Received: by 2002:a05:690c:64c8:b0:787:bca0:b469 with SMTP id
 00721157ae682-787c53d4b7dmr19058017b3.44.1762499711500; Thu, 06 Nov 2025
 23:15:11 -0800 (PST)
MIME-Version: 1.0
References: <cover.1762251845.git.jani.nikula@intel.com>
 <4923196ab968bfdbcc2d7572d9be9886c32c06c9.1762251845.git.jani.nikula@intel.com>
In-Reply-To: <4923196ab968bfdbcc2d7572d9be9886c32c06c9.1762251845.git.jani.nikula@intel.com>
From: Deepak Rawat <drawat.floss@gmail.com>
Date: Thu, 6 Nov 2025 23:15:00 -0800
X-Gm-Features: AWmQ_bljD-eyJRPNrzF7kiqZzwApDNP0Cw7YfigZ1Do-ZYBRP0gvjXfcUi1oIRE
Message-ID: <CAHFnvW2YTp-ECTLGLW4G6sLeaCgdst3vYXhAVO4LYhV7YnnD4A@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/hyperv: move Kconfig under driver directory
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 4, 2025 at 2:25=E2=80=AFAM Jani Nikula <jani.nikula@intel.com> =
wrote:
>
> Almost all DRM driver Kconfig options are in dedicated Kconfig files
> under driver directories. Follow suit in hyperv.
>
> Cc: Deepak Rawat <drawat.floss@gmail.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/Kconfig        | 14 +-------------
>  drivers/gpu/drm/hyperv/Kconfig | 14 ++++++++++++++
>  2 files changed, 15 insertions(+), 13 deletions(-)
>  create mode 100644 drivers/gpu/drm/hyperv/Kconfig
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 7e6bc0b3a589..15c2f941a4cd 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -398,19 +398,7 @@ source "drivers/gpu/drm/imagination/Kconfig"
>
>  source "drivers/gpu/drm/tyr/Kconfig"
>
> -config DRM_HYPERV
> -       tristate "DRM Support for Hyper-V synthetic video device"
> -       depends on DRM && PCI && HYPERV_VMBUS
> -       select DRM_CLIENT_SELECTION
> -       select DRM_KMS_HELPER
> -       select DRM_GEM_SHMEM_HELPER
> -       help
> -        This is a KMS driver for Hyper-V synthetic video device. Choose =
this
> -        option if you would like to enable drm driver for Hyper-V virtua=
l
> -        machine. Unselect Hyper-V framebuffer driver (CONFIG_FB_HYPERV) =
so
> -        that DRM driver is used by default.
> -
> -        If M is selected the module will be called hyperv_drm.
> +source "drivers/gpu/drm/hyperv/Kconfig"
>
>  # Separate option as not all DRM drivers use it
>  config DRM_PANEL_BACKLIGHT_QUIRKS
> diff --git a/drivers/gpu/drm/hyperv/Kconfig b/drivers/gpu/drm/hyperv/Kcon=
fig
> new file mode 100644
> index 000000000000..86234f6a73f2
> --- /dev/null
> +++ b/drivers/gpu/drm/hyperv/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config DRM_HYPERV
> +       tristate "DRM Support for Hyper-V synthetic video device"
> +       depends on DRM && PCI && HYPERV_VMBUS
> +       select DRM_CLIENT_SELECTION
> +       select DRM_KMS_HELPER
> +       select DRM_GEM_SHMEM_HELPER
> +       help
> +        This is a KMS driver for Hyper-V synthetic video device. Choose =
this
> +        option if you would like to enable drm driver for Hyper-V virtua=
l
> +        machine. Unselect Hyper-V framebuffer driver (CONFIG_FB_HYPERV) =
so
> +        that DRM driver is used by default.
> +
> +        If M is selected the module will be called hyperv_drm.
> --
> 2.47.3
>

Reviewed-by: Deepak Rawat <drawat.floss@gmail.com>
