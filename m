Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 032324C6626
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 10:53:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF5E10E2B3;
	Mon, 28 Feb 2022 09:53:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C0A510E2B3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 09:53:19 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id n185so9883399qke.5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 01:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pc2xTazJcGjIwl7ZnhXxuCZmmMzULOqgCvZj3IlaMMY=;
 b=LNzfZAX5hieB9FG9FLsPTrIanGwIyMKmJnXN/c610bQayVeDntvgfS92u1OMqT5EPE
 y9Kx3Kd2H9XDu5uKrY/5hzx9MjcZUfKRWf/cDhEiK1rfoH6DQ6RTrSk0yxkASPnHujy9
 L7f2UJFZ/hIrFNXgGWbU5ySh13EaWvCsdP0wY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pc2xTazJcGjIwl7ZnhXxuCZmmMzULOqgCvZj3IlaMMY=;
 b=1z9wyaUgsOk010vgNwyey0kbxB2sVWqQI2YV2B5eTd3ZmcuQV4w81TL0DsHYImSW7y
 ZC7SrmlMjK0hvbJ+FEwLRW/4rKMGhZ2uUAnI7AQ2GjnwQUsRLxg6aFQaNpsbhrAtDk2K
 +GWUcYHiTltFS8z8hLCWPYsJ9KX06vBAPwtJq314T1wxfBfh9bhs56ieiayjtos/tnNc
 nWmvxDeUn03bu8T5C3Mc/ymbogaSg2Fq6p9pSEDs5Tt1qqipffJZrhW+N4Er0WRVPd4F
 iIoJKE2LVoQH+ZeIp7+1ZB1z+Ie8080tFFd5ejZ4a0Tlaxch1j7ERh8a237XQwi4t1bO
 AW2g==
X-Gm-Message-State: AOAM533Y3fDd8ggQzjrF9UkajaSTWzf2xwM3biFQvQWmn3fhMFs2Ejps
 whFyQmfI9XsyOL605YKyHY19a2fJrRValippA1A=
X-Google-Smtp-Source: ABdhPJzMUyYueL8jtRtjblWTAghUCWnWt1dd02X0kcufstS2QoUPX8Pj046KPyailSEuY0MJAUQBLTTjgurg5sosZGs=
X-Received: by 2002:ae9:e841:0:b0:508:1f6e:f020 with SMTP id
 a62-20020ae9e841000000b005081f6ef020mr10495084qkg.243.1646041998337; Mon, 28
 Feb 2022 01:53:18 -0800 (PST)
MIME-Version: 1.0
References: <20211208013337.13806-1-tommy_huang@aspeedtech.com>
In-Reply-To: <20211208013337.13806-1-tommy_huang@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 28 Feb 2022 09:53:06 +0000
Message-ID: <CACPK8XcTDUt8q+5s44nnFFK1XiisXw=PBoGaNZowGS7M-j=Phg@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] Add Aspeed AST2600 soc display support
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

Hi Tommy,

On Wed, 8 Dec 2021 at 01:34, Tommy Haung <tommy_huang@aspeedtech.com> wrote:
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

Sorry for the long delay. I have tested your patches on an ast2600a3
evb and they worked. I have some questions about the reset lines that
I couldn't answer by reading the datasheet, so once they are cleared
up we can go ahead with merging your patches.

When you re-send, you will need to fix your git configuration so your
name appears correctly:

git config --global user.name "Tommy Haung"

And then for each patch, do this to fix up the authorship and the s-o-b line:

git commit --amend --reset-author -s

Cheers,

Joel



>
> v3:
>   Refine the patch for clear separate purpose.
>   Skip to send devicetree patch
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
> Tommy Haung (1):
>   dt-bindings:ast2600-clock Add CRT reset define
>
> tommy-huang (4):
>   drm/aspeed: Update INTR_STS handling
>   drm/aspeed: Add AST2600 chip support
>   drm/aspeed: Add reset and clock for AST2600
>   arm:boot:dts:aspeed-g6 Add more gfx reset control
>
>  arch/arm/boot/dts/aspeed-ast2600-evb.dts  | 18 +++++++
>  arch/arm/boot/dts/aspeed-g6.dtsi          | 13 +++++
>  drivers/gpu/drm/aspeed/aspeed_gfx.h       | 17 +++++-
>  drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c  | 16 ++++++
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c   | 65 +++++++++++++++++++++--
>  include/dt-bindings/clock/ast2600-clock.h |  1 +
>  6 files changed, 124 insertions(+), 6 deletions(-)
>
> --
> 2.17.1
>
