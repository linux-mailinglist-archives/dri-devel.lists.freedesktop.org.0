Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 106E818157F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 11:08:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1316E965;
	Wed, 11 Mar 2020 10:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CE76E965
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 10:08:25 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id r7so1318149oij.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 03:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/N+yzapZ4CfcV7bsbXkQFj5z2ofXrJQJFHA0Ipv5B8o=;
 b=WsEbHoTIo69jqIXr7Oix3TFgtUIizEo/YNs7UfM8/G48Xkx16v3vPb7hizjDjzBqIA
 IEWHJF9XOMwny5N4KAPm4ecWtbUmwLkarIy9shoSy2E4ZgxVagEEszFt3GqVeFpxGLiU
 qFUd3YK0vDFGbhdoNMbxuHhE9ESfhLWlOCadE58BNOo8RhKEDlIfAw/DYbHJZJKs8f/2
 7UYHWWTQrazClYDgfF2jiIS4z07i2T1JEuLT8bpJV0sOf4ivsqFAcJkN9MseBI7qhBVX
 MbpxF57pJ1z9KvH4PVENhZKJsTP/dYjhKp/DsLmnrU0JqO6OUsPO+sQ9KIOgIEcnAttJ
 yQpA==
X-Gm-Message-State: ANhLgQ17mI9MW/KjH7TTfZPD3FRv2YXpmORIZK1JDehyiSJ1jmjv3RK9
 tEz7TcskUFj+8VLI+szeThgdpw8AcXDU0EvXa1s=
X-Google-Smtp-Source: ADFU+vuJF5N7hcpWcUqis0h4qQPQ9BT3gGHT7sA30i5r95zDWMPwoXmGgIl1ccKJXdZJyPzfyRcoKuUqYhmzJwx2CTA=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr1304567oia.148.1583921304665; 
 Wed, 11 Mar 2020 03:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <1583872919-7757-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1583872919-7757-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1583872919-7757-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2020 11:08:13 +0100
Message-ID: <CAMuHMdVqwLEavjnPgZaevFqjTytAPMmT042yRrcDw9YpkjE3bg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: renesas: Add HiHope RZ/G2M board with
 idk-1110wr display
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Magnus Damm <magnus.damm@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lad,

On Tue, Mar 10, 2020 at 9:42 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>
> The HiHope RZ/G2M is advertised as compatible with panel idk-1110wr
> from Advantech, however the panel isn't sold alongside the board.
> A new dts, adding everything that's required to get the panel to
> work the HiHope RZ/G2M, is the most convenient way to support the
> HiHope RZ/G2M when it's connected to the idk-1110wr.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for picking up this patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-idk-1110wr.dts
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the HiHope RZ/G2M sub board connected to an
> + * Advantech IDK-1110WR 10.1" LVDS panel
> + *
> + * Copyright (C) 2020 Renesas Electronics Corp.
> + */
> +
> +#include "r8a774a1-hihope-rzg2m-ex.dts"
> +
> +/ {
> +       backlight {
> +               compatible = "pwm-backlight";
> +               pwms = <&pwm0 0 50000>;
> +
> +               brightness-levels = <0 2 8 16 32 64 128 255>;
> +               default-brightness-level = <6>;
> +       };
> +
> +       panel-lvds {
> +               compatible = "advantech,idk-1110wr", "panel-lvds";
> +
> +               width-mm = <223>;
> +               height-mm = <125>;
> +
> +               data-mapping = "jeida-24";
> +
> +               panel-timing {
> +                       /* 1024x600 @60Hz */
> +                       clock-frequency = <51200000>;
> +                       hactive = <1024>;
> +                       vactive = <600>;
> +                       hsync-len = <240>;
> +                       hfront-porch = <40>;
> +                       hback-porch = <40>;
> +                       vfront-porch = <15>;
> +                       vback-porch = <10>;
> +                       vsync-len = <10>;
> +               };
> +
> +               port {
> +                       panel_in: endpoint {
> +                               remote-endpoint = <&lvds0_out>;
> +                       };
> +               };
> +       };

I believe the plan was to include the existing
rzg2-advantech-idk-1110wr-panel.dtsi instead, to provide the
panel-lvds node...

> +};
> +
> +&gpio1 {
> +       /*
> +        * When GP1_20 is LOW LVDS0 is connected to the LVDS connector
> +        * When GP1_20 is HIGH LVDS0 is connected to the LT8918L
> +        */
> +       lvds-connector-en-gpio {
> +               gpio-hog;
> +               gpios = <20 GPIO_ACTIVE_HIGH>;
> +               output-low;
> +               line-name = "lvds-connector-en-gpio";
> +       };
> +};
> +
> +&lvds0 {
> +       status = "okay";
> +
> +       ports {
> +               port@1 {
> +                       lvds0_out: endpoint {
> +                               remote-endpoint = <&panel_in>;
> +                       };
> +               };
> +       };
> +};

... and the lvds_connector endpoint configuration.

The rest looks good to me.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
