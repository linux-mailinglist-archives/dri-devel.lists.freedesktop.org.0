Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 678CC9F8BE8
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 06:38:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACDF110E4E3;
	Fri, 20 Dec 2024 05:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sS8Q0JaX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7F210E4E3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 05:38:24 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-6eff5ad69a1so13919707b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 21:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734673103; x=1735277903; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rIKarjSguBzb5vvGdGEBWsVx805GOCvvnK6El20HXXg=;
 b=sS8Q0JaXIn/sZ49PXjtsvcAfIfiqoz9DdS+w0irfy8+NoUn2IepzYHEZRpySsRvuDF
 E7kb+j9GkX733C/cFUE+fQTMSxYjBK9Cf4b7FMexQRyWfmrHpPQ3MeuzDwdQgz8+3wKM
 p51ORWRAXgO647rxVdrjdjhn7mzGru8+qMfH6uGjliehQ2WZVnixHKR5SmeJ3BwNu94X
 in7fLYWggODC6QH+bspPxjW8r0dDDs6fLAVx7AE7wsHV6kHrJdmPh/+nxQUPRZWsAbk5
 2Ke58zLZi2l9SihBwwXVScZRkvjkShmdqbfezzZny901p1dZKnzB0W0pz82329iQIEzC
 KzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734673103; x=1735277903;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rIKarjSguBzb5vvGdGEBWsVx805GOCvvnK6El20HXXg=;
 b=GUO/TOlBs+qcPkn5GXKBOvbVksiDkbf1l03kRooZRrvmN2Ya/8ZY+mNfJ/++1ke5Tf
 2nkVnrZksiCRCZy96vkTPz+zV2GzRUBUYv9vHM9KWAxVlpAb2KjH3hS1tVVwLYIQ3cuI
 SEgcKBNknbjxnWH0IgjVeG/ObgELUjUzqdq1dVh67PXRSJxBppuOlpo9gLK58EMe5a7P
 XZ+uAg5UHfnvAa2RlgwCsdQHsOtkvKrYF6hCg682SHoSo9YJrF0BQjHT3G3m4eRo2Uxy
 /ImzBp/J9LjNuPCUq/0GfZhCDpIqw2pb6zBM+vlM+4AAj5ViIGErfPFqee+cGqj4le3C
 2LGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVe5OgufR34AadCDu8VRo8TYAYVCa1jKzaaVLa0Dnb4NcMLYfYoz6Pjn/Rhfj8eKsgZbje5lJOhMbM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyf1e0mWQvM27NK7ssNB30zw8PVL6pmamsVgb+XNncjzYpRNxWr
 zmuEraZpIIB4x8+1EncYCprGQFo2VsdnFaDGd9YTVWgMeF4I6Ivxk6KYRBOzXlfiRdxh7zpqphH
 zE5iBywdLD5ZNoGE6wUpOIYVI6IWnyvi1ppAfhg==
X-Gm-Gg: ASbGnctNpJNeGxcrNN+LiFxOyDEcuYJTFeKfSPBzX3Si6nxrXlmlO4O0SaMWrobWipc
 4tDf/lskJFCx4TdvfHvPJu4cZ9Kfok1xB4OEP5UHWGPYGuCOYzBh1
X-Google-Smtp-Source: AGHT+IFzw4UTk3bYJjTLjWStSiQBoWV4fWweBYuliIxs6rVCPb45P2NhqG9sK5ndMaNn705CQufJ7trl8MkIav7ihTk=
X-Received: by 2002:a05:690c:6e0d:b0:6e5:9cb7:853c with SMTP id
 00721157ae682-6f3f822204cmr13331197b3.31.1734673103176; Thu, 19 Dec 2024
 21:38:23 -0800 (PST)
MIME-Version: 1.0
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
 <20241219080604.1423600-15-damon.ding@rock-chips.com>
 <cg7bnhol4gvzji7agxazas7nkxy7zammzy67rjvhp35yqyraju@73daepsbmuae>
 <d2b47813-45fa-4148-8a4a-6cf4a18ee7ca@rock-chips.com>
In-Reply-To: <d2b47813-45fa-4148-8a4a-6cf4a18ee7ca@rock-chips.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 07:38:12 +0200
Message-ID: <CAA8EJpp0Smtqx7VQ5zdg9x3EhuLpk4u4vGv=rv8DHJ0rhei18w@mail.gmail.com>
Subject: Re: [PATCH v3 14/15] arm64: dts: rockchip: Enable eDP0 display on
 RK3588S EVB1 board
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 rfoss@kernel.org, vkoul@kernel.org, sebastian.reichel@collabora.com, 
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 20 Dec 2024 at 04:38, Damon Ding <damon.ding@rock-chips.com> wrote:
>
> Hi Dmitry,
>
> On 2024/12/20 8:20, Dmitry Baryshkov wrote:
> > On Thu, Dec 19, 2024 at 04:06:03PM +0800, Damon Ding wrote:
> >> Add the necessary DT changes to enable eDP0 on RK3588S EVB1 board:
> >> - Add edp-panel node
> >> - Set pinctrl of pwm12 for backlight
> >> - Enable edp0/hdptxphy0/vp2
> >>
> >> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> >>
> >> ---
> >>
> >> Changes in v2:
> >> - Remove brightness-levels and default-brightness-level properties in
> >>    backlight node.
> >> - Add the detail DT changes to commit message.
> >>
> >> Changes in v3:
> >> - Use aux-bus instead of platform bus for edp-panel.
> >> ---
> >>   .../boot/dts/rockchip/rk3588s-evb1-v10.dts    | 52 +++++++++++++++++++
> >>   1 file changed, 52 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
> >> index bc4077575beb..9547ab18e596 100644
> >> --- a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
> >> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
> >> @@ -9,6 +9,7 @@
> >>   #include <dt-bindings/gpio/gpio.h>
> >>   #include <dt-bindings/input/input.h>
> >>   #include <dt-bindings/pinctrl/rockchip.h>
> >> +#include <dt-bindings/soc/rockchip,vop2.h>
> >>   #include <dt-bindings/usb/pd.h>
> >>   #include "rk3588s.dtsi"
> >>
> >> @@ -238,6 +239,41 @@ &combphy2_psu {
> >>      status = "okay";
> >>   };
> >>
> >> +&edp0 {
> >> +    force-hpd;
> >> +    status = "okay";
> >> +
> >> +    aux-bus {
> >> +            panel {
> >> +                    compatible = "lg,lp079qx1-sp0v";
> >
> > Why do you need the particular compat string here? Can you use the
> > generic "edp-panel" instead? What if the user swaps the panel?
> >
>
> The eDP panels used in conjunction with the RK3588S EVB1 have broken
> identification, which is one of the valid reasons for using a particular
> compat string. So the generic_edp_panel_probe() can not return success
> when using the "edp-panel".

Broken how? I don't see such info in the commit message.

>
> >> +                    backlight = <&backlight>;
> >> +                    power-supply = <&vcc3v3_lcd_edp>;
> >> +
> >> +                    port {
> >> +                            panel_in_edp: endpoint {
> >> +                                    remote-endpoint = <&edp_out_panel>;
> >> +                            };
> >> +                    };
> >> +            };
> >> +    };
> >> +};
> >> +
> >> +&edp0_in {
> >> +    edp0_in_vp2: endpoint {
> >> +            remote-endpoint = <&vp2_out_edp0>;
> >> +    };
> >> +};
> >> +
> >> +&edp0_out {
> >> +    edp_out_panel: endpoint {
> >> +            remote-endpoint = <&panel_in_edp>;
> >> +    };
> >> +};
> >> +
> >> +&hdptxphy0 {
> >> +    status = "okay";
> >> +};
> >> +
> >>   &i2c3 {
> >>      status = "okay";
> >>
> >> @@ -399,6 +435,7 @@ usbc0_int: usbc0-int {
> >>   };
> >>
> >>   &pwm12 {
> >> +    pinctrl-0 = <&pwm12m1_pins>;
> >>      status = "okay";
> >>   };
> >>
> >> @@ -1168,3 +1205,18 @@ usbdp_phy0_dp_altmode_mux: endpoint@1 {
> >>              };
> >>      };
> >>   };
> >> +
> >> +&vop_mmu {
> >> +    status = "okay";
> >> +};
> >> +
> >> +&vop {
> >> +    status = "okay";
> >> +};
> >> +
> >> +&vp2 {
> >> +    vp2_out_edp0: endpoint@ROCKCHIP_VOP2_EP_EDP0 {
> >> +            reg = <ROCKCHIP_VOP2_EP_EDP0>;
> >> +            remote-endpoint = <&edp0_in_vp2>;
> >> +    };
> >> +};
> >> --
> >> 2.34.1
> >>
> >
> Best regards,
> Damon



-- 
With best wishes
Dmitry
