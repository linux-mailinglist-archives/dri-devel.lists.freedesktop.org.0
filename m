Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5BBAAEDAB
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 23:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBC210E1B0;
	Wed,  7 May 2025 21:13:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="btuMuu7u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BB110E1B0
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 21:13:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 45BC249E98
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 21:13:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28FD9C4AF0B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 21:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746652431;
 bh=FOhorxvdZmF3UNv1K8W2H1jGJQvtIe7mLPYFtgtvSW0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=btuMuu7uLieKmDGVlybQW7zSorwTv9xmX+kalsU9Xr7S/lzf/Mof3PEelM6L+MDrK
 VWsZkYPSeotdCrnfUbs9JYo0eQK1hQWnRkWUbimQo1XPKH4v+u6tNDIOZabeBYCaoE
 qb1SqW3nxnPB4iDRmUDrM16yCo3SCcAfZDCZzitzi6dMbXv0rZY+Ob7MvSR7fxhkPF
 0e9KTa45FBKB+rBgNes8YlDJIn50BgcY2LH+JsqzZPf7VW0xaG7nJ6WAREX7h6LOIc
 L5l0H0AHLdbVS4KNj04bnfVb399Hi3TgTqQ5HJFQbBGXbnLNwCMyIV0B+IdpdFvvLO
 QfU0HgzPQbNqA==
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5f861d16622so530979a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 14:13:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU6EykaHWkElHrjkNMvGpKZ9XWZhrdV8IK52VxulTU6hCQrRUdiwEp15jPrjV09sqAQvw6WgXo2o0I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOLgEVZePEQGoregnCnUNWPh7Z63rfvAu51HmfOU4+Qa5d/+wA
 gS0w4KukhgELhEAirVfaESrMObyFStAKYdgNrms+668BUGBXOMHSUFhrdj166R4FqFuMzMMjHUd
 rdQeOQNO24tF8MSwKOKbZp+/MjQ==
X-Google-Smtp-Source: AGHT+IGy/AslGdF1MwNhYOl0MOFlrYH+HeNbtvQP6c32M4CYMagN9EZk7pk8+/lEW3ChlPpDUlN2iBCbhpBAEvvyfTY=
X-Received: by 2002:a05:6402:510b:b0:5ee:497:d4f3 with SMTP id
 4fb4d7f45d1cf-5fbe9fa80ffmr4380732a12.33.1746652429740; Wed, 07 May 2025
 14:13:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250507201943.330111-1-macroalpha82@gmail.com>
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 7 May 2025 16:13:38 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+gtVi1XG7b2g+n-H=fDrkZRqVA0wNSAA5-Ot7EXqG2QA@mail.gmail.com>
X-Gm-Features: ATxdqUGfERVR08MJzfUs6EpZ2bPDiTaMnXmVepdJ-U9hQFvKGPhrVmDCJuHz-wU
Message-ID: <CAL_Jsq+gtVi1XG7b2g+n-H=fDrkZRqVA0wNSAA5-Ot7EXqG2QA@mail.gmail.com>
Subject: Re: [PATCH V9 00/24] drm: sun4i: add Display Engine 3.3 (DE33) support
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, ryan@testtoast.com, macromorgan@hotmail.com, 
 p.zabel@pengutronix.de, tzimmermann@suse.de, 
 maarten.lankhorst@linux.intel.com, simona@ffwll.ch, airlied@gmail.com, 
 mripard@kernel.org, samuel@sholland.org, jernej.skrabec@gmail.com, 
 wens@csie.org, conor+dt@kernel.org, krzk+dt@kernel.org
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

On Wed, May 7, 2025 at 3:22=E2=80=AFPM Chris Morgan <macroalpha82@gmail.com=
> wrote:
>
> From: Chris Morgan <macromorgan@hotmail.com>
>
> I've spoken with Ryan and he agreed to let me take over this series to
> get the display engine working on the Allwinner H616. I've taken his
> previous patch series for Display Engine 3.3 and combined it with the
> LCD controller patch series. I've also fixed a few additional bugs and
> made some changes to the device tree bindings.
>
> Changes since V8:
>  - Combined the DE33 [1] series and the LCD [2] series to better track
>    all patches necessary to output to an LCD display for the Allwinner
>    H700.
>  - Added a required LVDS reset as requested here [3].
>  - Added compatible strings with a fallback for
>    allwinner,sun50i-h616-display-engine, allwinner,sun50i-h616-tcon-top,
>    and allwinner,sun50i-h616-sram-c.
>  - Added binding documentation for the LCD controller.
>  - Renamed the de3_sram device tree node to de33_sram.
>  - Corrected the LVDS reset for the LCD controller binding.
>  - Removed the PWM pins from the pincontroller bindings, as PWM is not
>    yet supported.
>  - Reordered the patches so that a binding or a device tree node is not
>    referenced before it is defined.
>
> [1] https://lore.kernel.org/linux-sunxi/20250310092345.31708-1-ryan@testt=
oast.com/
> [2] https://lore.kernel.org/linux-sunxi/20250216092827.15444-1-ryan@testt=
oast.com/
> [3] https://lore.kernel.org/linux-sunxi/38669808.XM6RcZxFsP@jernej-laptop=
/
>
> Chris Morgan (24):
>   dt-bindings: clock: sun50i-h616-ccu: Add LVDS reset
>   clk: sunxi-ng: h616: Add LVDS reset for LCD TCON
>   drm: sun4i: de2/de3: add mixer version enum
>   drm: sun4i: de2/de3: refactor mixer initialisation
>   drm: sun4i: de2/de3: add generic blender register reference function
>   drm: sun4i: de2/de3: use generic register reference function for layer
>     configuration
>   dt-bindings: allwinner: add H616 DE33 bus binding
>   dt-bindings: allwinner: add H616 DE33 clock binding
>   dt-bindings: allwinner: add H616 DE33 mixer binding
>   clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support
>   drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
>   drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33) support
>   drm: sun4i: de33: mixer: add mixer configuration for the H616
>   dt-bindings: allwinner: Add TCON_TOP and TCON_LCD clock/reset defines
>   dt-bindings: display: sun4i: Add compatible strings for H616 DE
>   dt-bindings: display: sun4i: Add compatible strings for H616 TCON TOP
>   dt-bindings: sram: sunxi-sram: Add H616 SRAM C compatible
>   dt-bindings: display: Add R40 and H616 display engine compatibles
>   drm/sun4i: tcon: Add support for R40 LCD
>   arm64: dts: allwinner: h616: add display engine, bus and mixer nodes
>   arm64: dts: allwinner: h616: Add TCON nodes to H616 DTSI
>   arm64: dts: allwinner: h616: add LCD and LVDS pins
>   arm64: dts: allwinner: rg35xx: Add GPIO backlight control
>   arm64: dts: allwinner: rg35xx: Enable LCD output

What's the base for this series? It didn't apply for me (using b4).

Rob
