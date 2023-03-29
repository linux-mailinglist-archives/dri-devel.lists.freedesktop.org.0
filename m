Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF556CECE7
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 17:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3E310EB4E;
	Wed, 29 Mar 2023 15:30:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D997610EB4F
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 15:30:34 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-545e907790fso183798417b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 08:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680103834;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BFZ20rC2XtnWx2HPxJbX0F+YnJR7fgxQcGGmQBwVb7Q=;
 b=JvMTJc1Gv8vCqVajFRwN5it4gJaKbPCwOgEwFVRfrdnXBaViUYZsElkwGN4srbsCWm
 gsZfz98f+UB7t9jFdKcTwUfnCNnxIJtdiXlh7MW7KtqKekPhBX9lUbZ7q3Wl0j7mTzEE
 OcLqTJEyEkBSuD+GbeP4ew9U247+o/1zLS7yE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680103834;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BFZ20rC2XtnWx2HPxJbX0F+YnJR7fgxQcGGmQBwVb7Q=;
 b=2ELUXRb/8hR3JhzdIdkHWhFmA10TumLXGArprCCmL67hGYhL17TmIQzqpATVJZDmr4
 nT9ceQKvKLHvu17WxWNr2YMc7sA34C8blRcu1UDZpM3/vF2lkrdofJr17ohcoLtWsq54
 grE7fNt0XuL0zaw6y08gRw3GyI2iMWpvX+fqbRjkACtq6XScpm3Rste76Al6z2IHbvtj
 dV0MwsM9GMoggMaCPnn8vWhUMPVFmnOyzje403kTWauECme4qxntCqemliVZYJyO7C42
 sT9POgiVavCvZE1ZEcVq8gVkh9L9F/ACQWOryvG1JERS7ZGbT12XNnbo4GXt/DLQlVtT
 6ugg==
X-Gm-Message-State: AAQBX9dP8B4XoVKaYyswm2TjEGEpUwbMd4BKLC4UZmptUjv14PCVLX8k
 5H986wF2LYB3LgA22v8gUEn2jwAsUmMbY5xL/xf9Pg==
X-Google-Smtp-Source: AKy350aQ+SY5iF10evSeqAQo9VWn7eGBRSp/ouP2R83fRpmRIP36Pn+KT/+JT62aHAr/p3uHoViPy/s3Xmq1TTNqhWs=
X-Received: by 2002:a81:ae23:0:b0:541:7237:6e6b with SMTP id
 m35-20020a81ae23000000b0054172376e6bmr9262438ywh.0.1680103833995; Wed, 29 Mar
 2023 08:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230329131615.1328366-1-jagan@amarulasolutions.com>
 <20230329131615.1328366-10-jagan@amarulasolutions.com>
 <20230329150202.3rbjrq6iqum5ybjh@penduick>
In-Reply-To: <20230329150202.3rbjrq6iqum5ybjh@penduick>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 29 Mar 2023 21:00:22 +0530
Message-ID: <CAMty3ZDXWw2ajF5DsYCMy0XCa348y8XKKUzAfrU=2iUG23yVow@mail.gmail.com>
Subject: Re: [PATCH v7 09/12] arm64: dts: rockchip: a64: Add endpoint@0 to
 dsi_in_tcon0
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 29, 2023 at 8:32=E2=80=AFPM Maxime Ripard <maxime@cerno.tech> w=
rote:
>
> The commit title is wrong, it's not a rockchip device.

Thanks for the note, I will fix it in the next version.

>
> On Wed, Mar 29, 2023 at 06:46:15PM +0530, Jagan Teki wrote:
> > The DSI downstream devices are likely to be Panel, Bridge and
> > I2C-Configured Bridge.
> >
> > It is possible to connect all three devices using upstream OF-graph por=
t
> > or ports node however only Panel and Bridge are possible to connect via
> > child node but not possible to connect I2C-Configured Bridge via child
> > node since I2C-Configure bridges are child of I2C not upstream DSI host=
s
> > and it must represent them via port or ports with endpoint linking.
> >
> > Allwinner A64 DSI node already has a port so add endpoint 0 for input
> > tcon so that the downstream DSI devices can use endpoint 1 to connect
> > Panel or Bridge or I2C-Configured Bridge.
> >
> > An example of the I2C-Configured downstream bridge representation is,
> >
> > i2c1 {
> >        bridge@1b {
> >            compatible =3D "ti,dlpc3433";
> >
> >              ports {
> >                   port@0 {
> >                          reg =3D <0>;
> >
> >                          bridge_in_dsi: endpoint {
> >                                 remote-endpoint =3D <&dsi_out_bridge>;
> >                                 data-lanes =3D <1 2 3 4>;
> >                          };
> >                   };
> >
> >                 port@2 {
> >                        reg =3D <2>;
> >
> >                          bridge_out_dmd: endpoint {
> >                                 remote-endpoint =3D <&dmd_out_bridge>;
> >                          };
> >                   };
> >              };
> >        };
> > };
> >
> > dsi {
> >        compatible =3D "allwinner,sun50i-a64-mipi-dsi";
> >
> >        port {
> >              dsi_in_tcon0: endpoint@0 {
> >                 reg =3D <0>;
> >                 remote-endpoint =3D <tcon0_out_dsi>;
> >            };
> >
> >            dsi_out_bridge: endpoint@1 {
> >                 reg =3D <1>;
> >                 remote-endpoint =3D <&bridge_in_dsi>;
> >            };
> >       };
> > };
> >
> > Note that existing device bindings are untouched and still represent
> > the downstream devices via child nodes since the sun6i-mipi-dsi host
> > will migrate to a standardized single helper to lookup for a
> > downstream device via child or OF-graph port or port node.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v7:
> > - new patch
> >
> >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64=
/boot/dts/allwinner/sun50i-a64.dtsi
> > index 77b5349f6087..3ed566dc2172 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > @@ -1189,7 +1189,11 @@ dsi: dsi@1ca0000 {
> >                       #size-cells =3D <0>;
> >
> >                       port {
> > -                             dsi_in_tcon0: endpoint {
> > +                             #address-cells =3D <1>;
> > +                             #size-cells =3D <0>;
> > +
> > +                             dsi_in_tcon0: endpoint@0 {
> > +                                     reg =3D <0>;
> >                                       remote-endpoint =3D <&tcon0_out_d=
si>;
> >                               };
>
> That doesn't match the DT binding anymore, and why can't we add endpoint@=
1 there too?

Do you mean add endpoint@1 without any remote-endpoint like this?

dsi_out_bridge: endpoint@1 {
         reg =3D <1>;
};

I was supposed to add this, since dtbs_check doesn't give any error. I
have skipped this, as I thought it wouldn't be needed.

Thanks,
agan.
