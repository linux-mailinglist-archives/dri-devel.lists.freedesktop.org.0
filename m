Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D01BF80D3E8
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 18:34:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284C510E128;
	Mon, 11 Dec 2023 17:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDEF110E4B5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 17:34:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 40E1AB80F9A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 17:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64E2DC433A9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 17:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702316068;
 bh=xuX6L1jHorTrNZtjpFIc75B8ypRXxqR2z0Z/exf+Bcc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KIjtlOXLZ/5nmD+yo2uenPqJ2aX9ssBIWM7zx7V9mGsNS4dvR6D8aAIpaFDBgT/r+
 wCvrgF4StzlkDzjt3do/cB8Ml9zAQyJfXoeVqddjOpo3pkOKvyDvqomizxhhpAT3fh
 rzG8LdwxdhzGsWTOvKytoF3vcPxedGlbsj2C2TPNgVi3xrrQSxjBVTpuaXQYZILPDr
 Owt92PpG7h2R9rdPdu4WeAmREgjeG5gLlH18dk1z5Z0Y+LmOEd2gzOX3vK4wDsVx9I
 iFwdL7SSj0y5Vdk3nDvkGPzjfeJpNdePgxd0MaZgSP5X3Vcf/XbxkKo4AkZuKQ91+7
 ezj7eG3+MhM2A==
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-50bfd8d5c77so5402143e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 09:34:28 -0800 (PST)
X-Gm-Message-State: AOJu0Ywd/L8PKZdIx4wkXTCQF8sm8SlYyYb1XKUIThhY8bVVbrDVH1Q8
 J0EOszocGCZ1VZ3XRVViQ3lCJ/DirfKRjjyLCQ==
X-Google-Smtp-Source: AGHT+IGMURGYLV/Y+ayED33ueZXlH85oU9OGhLmkTdCm4X1g7BaIMGfr4V8LF++R0RHFP+RuG1E0QnZTXRhkxEzjTew=
X-Received: by 2002:a05:6512:3d05:b0:50b:f776:1d6a with SMTP id
 d5-20020a0565123d0500b0050bf7761d6amr1293404lfv.1.1702316066602; Mon, 11 Dec
 2023 09:34:26 -0800 (PST)
MIME-Version: 1.0
References: <20231204123315.28456-1-keith.zhao@starfivetech.com>
 <20231204123315.28456-6-keith.zhao@starfivetech.com>
In-Reply-To: <20231204123315.28456-6-keith.zhao@starfivetech.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 11 Dec 2023 11:34:14 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJz5pcFwLbh9Jdw1HKLPFgF8ZQdCM18bHO_8R1dtmfx7Q@mail.gmail.com>
Message-ID: <CAL_JsqJz5pcFwLbh9Jdw1HKLPFgF8ZQdCM18bHO_8R1dtmfx7Q@mail.gmail.com>
Subject: Re: [v3 5/6] drm/vs: Add hdmi driver
To: Keith Zhao <keith.zhao@starfivetech.com>
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, suijingfeng@loongson.cn,
 krzysztof.kozlowski+dt@linaro.org, william.qiu@starfivetech.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 xingyu.wu@starfivetech.com, jack.zhu@starfivetech.com, palmer@dabbelt.com,
 mripard@kernel.org, tzimmermann@suse.de, paul.walmsley@sifive.com,
 shengyang.chen@starfivetech.com, linux-riscv@lists.infradead.org,
 changhuang.liang@starfivetech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 4, 2023 at 6:33=E2=80=AFAM Keith Zhao <keith.zhao@starfivetech.=
com> wrote:
>
> add hdmi driver as encoder and connect
>
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> ---
>  drivers/gpu/drm/verisilicon/Kconfig         |   8 +
>  drivers/gpu/drm/verisilicon/Makefile        |   1 +
>  drivers/gpu/drm/verisilicon/starfive_hdmi.c | 849 ++++++++++++++++++++
>  drivers/gpu/drm/verisilicon/starfive_hdmi.h | 304 +++++++
>  drivers/gpu/drm/verisilicon/vs_drv.c        |   3 +
>  drivers/gpu/drm/verisilicon/vs_drv.h        |   4 +
>  6 files changed, 1169 insertions(+)
>  create mode 100644 drivers/gpu/drm/verisilicon/starfive_hdmi.c
>  create mode 100644 drivers/gpu/drm/verisilicon/starfive_hdmi.h
>
> diff --git a/drivers/gpu/drm/verisilicon/Kconfig b/drivers/gpu/drm/verisi=
licon/Kconfig
> index e10fa97635aa..122c786e3948 100644
> --- a/drivers/gpu/drm/verisilicon/Kconfig
> +++ b/drivers/gpu/drm/verisilicon/Kconfig
> @@ -11,3 +11,11 @@ config DRM_VERISILICON
>           This driver provides VeriSilicon kernel mode
>           setting and buffer management. It does not
>           provide 2D or 3D acceleration.
> +
> +config DRM_VERISILICON_STARFIVE_HDMI
> +       bool "Starfive HDMI extensions"
> +       depends on DRM_VERISILICON
> +       help
> +          This selects support for StarFive soc specific extensions
> +          for the Innosilicon HDMI driver. If you want to enable
> +          HDMI on JH7110 based soc, you should select this option.
> diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/veris=
ilicon/Makefile
> index bf6f2b7ee480..71fadafcee13 100644
> --- a/drivers/gpu/drm/verisilicon/Makefile
> +++ b/drivers/gpu/drm/verisilicon/Makefile
> @@ -6,4 +6,5 @@ vs_drm-objs :=3D vs_dc_hw.o \
>                 vs_drv.o \
>                 vs_modeset.o \
>                 vs_plane.o
> +vs_drm-$(CONFIG_DRM_VERISILICON_STARFIVE_HDMI) +=3D starfive_hdmi.o
>  obj-$(CONFIG_DRM_VERISILICON) +=3D vs_drm.o
> diff --git a/drivers/gpu/drm/verisilicon/starfive_hdmi.c b/drivers/gpu/dr=
m/verisilicon/starfive_hdmi.c
> new file mode 100644
> index 000000000000..aa621db0dee0
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/starfive_hdmi.c
> @@ -0,0 +1,849 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023 StarFive Technology Co., Ltd.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/component.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/hdmi.h>
> +#include <linux/i2c.h>
> +#include <linux/irq.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of_device.h>

You probably don't need this header and the implicit includes it makes
are dropped now in linux-next. Please check what you actually need and
make them explicit.

Rob
