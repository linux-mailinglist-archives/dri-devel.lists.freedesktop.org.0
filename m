Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EDC4C9BC8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 04:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD8410E961;
	Wed,  2 Mar 2022 03:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1797F10E961
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 03:08:36 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id w7so551260qvr.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 19:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RQqrwFMPY5plGbddCnC14E9lxWyrfbG5ICWPNwpm/RM=;
 b=LmkJ4nzw/MELoRSNtv7sEIw35ccww6Tr7FyTGDd77VlakAkiEf6KMriBzFgjV3Dh9Q
 ut5EUs7nLlaXU+ZX7vCFbfbG67wFgGQivXloO/LKKkeV+6+Gx/XzBcFDm/J8GRFK6Sgj
 0DXOgdx/5jCtBgbbAvUzH5vOYvFSe71JlODdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RQqrwFMPY5plGbddCnC14E9lxWyrfbG5ICWPNwpm/RM=;
 b=19IYcUj+QY+O75qPuR5uZqe7WTtj4Fh5+rlcPqhVH5UGxAhSnLi5Mx7KZ5gZmVO51p
 Lr6YiUwER2qBnL9DbEfQvEiZbDEU0Bdbnq78grvgsx6imA7fD0uob0+WQXeEssSdAhv3
 p84m1pY9ny6Nu4H8EjslU5H8JxAM41NhuhkGc9/H+Qkb1ms6V/qY3noAa3CzorTY64qj
 GCYNr004RDP8ZgZFKW1ryCZlgUUkSDrx1EoKgXyBxUpwdvcw+Pos/WQGgbsHbfbFPQ4x
 GfdtgUkODrvyk6eCI2ZsLkz1E8g9AiLKZgjsGGPhMCFbmDYMK9sc3RKBetuQbpiHRZav
 v5Fg==
X-Gm-Message-State: AOAM530MijvHAVDd/aQXjiYCIDcG7BYma0juFl51bHd0EUON58l7neCf
 +Wa1CUxgQtFfiPRD/Hjt9+cY8aU/cmx5z7jn41w=
X-Google-Smtp-Source: ABdhPJztD0vIx1Wl0A9xT1RwV7lGsUr0ZEEv3QSKFr9EnK8lyK9xuR0wpsW6Xg66ZqVBWQ9OL8JSmp1eGkx1vZcag5k=
X-Received: by 2002:a05:6214:19c4:b0:432:8bd1:d8d7 with SMTP id
 j4-20020a05621419c400b004328bd1d8d7mr19678222qvc.65.1646190515132; Tue, 01
 Mar 2022 19:08:35 -0800 (PST)
MIME-Version: 1.0
References: <20220302024930.18758-1-tommy_huang@aspeedtech.com>
 <20220302024930.18758-6-tommy_huang@aspeedtech.com>
In-Reply-To: <20220302024930.18758-6-tommy_huang@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 2 Mar 2022 03:08:22 +0000
Message-ID: <CACPK8XcsLBrJo7W5y3sE_jGy9j4e6MPNcB26bJ4SB1ZhVuka+A@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] ARM: dtsi: aspeed: Modified gfx reset control
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

On Wed, 2 Mar 2022 at 02:50, Tommy Haung <tommy_huang@aspeedtech.com> wrote:
>
> Remove the ast2500-gfx from aspeed-g6.dtsi.
> In the AST2600, the ASPEED_RESET_CRT1 is replaced by
> ASPEED_RESET_GRAPHICS. This is no differnce between these two reset
> behavior but reigster location is changed. The HW controller states
> and FW programming resgiter will be reset by CRT reset controller bit
> (SCU040[13]). And another part HW controller will be reset by
> Graphics controller bit (SCU040[26]). These two reset bit need be
> de-assert then the SOC display will be active.
>
> Signed-off-by: Tommy Haung <tommy_huang@aspeedtech.com>

You don't need this patch; the change should be part of the patch that
introduces the node. I'll fix that up when applying.

> ---
>  arch/arm/boot/dts/aspeed-g6.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index e38c3742761b..7cc99bc68558 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -352,7 +352,7 @@
>                         };
>
>                         gfx: display@1e6e6000 {
> -                               compatible = "aspeed,ast2600-gfx", "aspeed,ast2500-gfx", "syscon";
> +                               compatible = "aspeed,ast2600-gfx", "syscon";
>                                 reg = <0x1e6e6000 0x1000>;
>                                 reg-io-width = <4>;
>                                 clocks = <&syscon ASPEED_CLK_GATE_D1CLK>;
> --
> 2.17.1
>
