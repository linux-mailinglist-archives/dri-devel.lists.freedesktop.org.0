Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B81664C9BCE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 04:09:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D22010E76A;
	Wed,  2 Mar 2022 03:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E1010E76A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 03:09:15 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id z66so266069qke.10
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 19:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HT+Mtr5Nff2ageK7dbN94vU/EQesBvLqX1yuZAcRck0=;
 b=dPwC/rmwjWPNXK0t7BJJ6dux5/N4QJAp73A5BHoQ0+Jun3fMu1eTDALAhU/Kej566l
 5mmW8OoScc5wlCGRRZ0A/w+ktM2veKscRQZ+SkcbGcxf/XtnnHPEMYmXhA6kfSOXV5lw
 3lUH9hcra2VpuWd1zOOxPJuC/ZY1W9dmgH0GU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HT+Mtr5Nff2ageK7dbN94vU/EQesBvLqX1yuZAcRck0=;
 b=rXk7iKk0VNOHAVl4qxM0yyHJ+mpUwr++a5Xs9bxsv7PCSqZopf8ErpBYb4raCL+xoD
 qx0pqxOeE/StSpsd1WUR2ST2RivTn80rekyvUj6TuCZ58bOGTJhxp0l9OzOi/0VCMGqk
 abO8oG+z6NEwuipxnUigJ3LKe6khHaKBRy3x+KUaw2Ofc4SBzyRj25G/hZiaEOk0H3WH
 RMD0+mAOqE+1Ev0ihxAG9QU+IHBrdPdGP0KR3yrbz7fuYbb6hu9okEh8ZOXjxXoq1Xbj
 uBcklF/ZzGz8hNq9mLQMHdfv5qJsOsmc7l3Gdt4SH4OzGeJiknfrNT0hjwhYMMLt3wwr
 i3jA==
X-Gm-Message-State: AOAM5329ENrnrABEx1bQptFhlGReLcVlNNg4HcIAANGRoJulQF50vm7M
 GtR8j7aohreRro0LTvV1XA1GFv8cI7eCkZO1Eh1iAeDCcGM=
X-Google-Smtp-Source: ABdhPJxa0POJ5iMZchDS1hHP6nIyKRmvr9j5KH1/LsFO7CsMjnlOEqfR/0MoiiOCu3HDY273CUfvvjunpBaZrCv9ql0=
X-Received: by 2002:a37:a4d1:0:b0:508:19df:7093 with SMTP id
 n200-20020a37a4d1000000b0050819df7093mr15260167qke.346.1646190554732; Tue, 01
 Mar 2022 19:09:14 -0800 (PST)
MIME-Version: 1.0
References: <20220302024930.18758-1-tommy_huang@aspeedtech.com>
In-Reply-To: <20220302024930.18758-1-tommy_huang@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 2 Mar 2022 03:09:02 +0000
Message-ID: <CACPK8XdKH5BaGC9mtgg17ndiJyOneuzzUbrLmxYZKmi6RRzzpg@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] Add Aspeed AST2600 soc display support
To: Tommy Haung <tommy_huang@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, BMC-SW <BMC-SW@aspeedtech.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2 Mar 2022 at 02:49, Tommy Haung <tommy_huang@aspeedtech.com> wrote:
>
> v6:
>   Remove some unnecessary reset patch.
>   Refine patch format.
>   Add detail explain of SOC display reset bits.
>
> v5:
>   Add lost reset define.
>
> v4:
>   Add necessary reset control for ast2600.
>   Add chip caps for futher use.
>   These code are test on AST2500 and AST2600 by below steps.
>
>   1. Add below config to turn VT and LOGO on.
>
>         CONFIG_TTY=y
>         CONFIG_VT=y
>         CONFIG_CONSOLE_TRANSLATIONS=y
>         CONFIG_VT_CONSOLE=y
>         CONFIG_VT_CONSOLE_SLEEP=y
>         CONFIG_HW_CONSOLE=y
>         CONFIG_VT_HW_CONSOLE_BINDING=y
>         CONFIG_UNIX98_PTYS=y
>         CONFIG_LDISC_AUTOLOAD=y
>         CONFIG_DEVMEM=y
>         CONFIG_DUMMY_CONSOLE=y
>         CONFIG_FRAMEBUFFER_CONSOLE=y
>         CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
>         CONFIG_LOGO=y
>         CONFIG_LOGO_LINUX_CLUT224=y
>
>   2. The Linux logo will be shown on the screen, when the BMC boot in Linux.
>
> v3:
>   Refine the patch for clear separate purpose.
>   Skip to send devicetree patch

Looks good! Thanks Tommy.

Reviewed-by: Joel Stanley <joel@jms.id.au>

I'll apply this once I've tested it on hardware.

>
> v2:
>   Remove some unnecessary patch.
>   Refine for reviwer request.
>
> v1:
>   First add patch.
>
> Joel Stanley (2):
>   ARM: dts: aspeed: Add GFX node to AST2600
>   ARM: dts: aspeed: ast2600-evb: Enable GFX device
>
> Tommy Haung (3):
>   drm/aspeed: Update INTR_STS handling
>   drm/aspeed: Add AST2600 chip support
>   ARM: dtsi: aspeed: Modified gfx reset control
>
>  arch/arm/boot/dts/aspeed-ast2600-evb.dts | 18 ++++++++++++++++++
>  arch/arm/boot/dts/aspeed-g6.dtsi         | 11 +++++++++++
>  drivers/gpu/drm/aspeed/aspeed_gfx.h      |  1 +
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  | 15 ++++++++++++++-
>  4 files changed, 44 insertions(+), 1 deletion(-)
>
> --
> 2.17.1
>
