Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD3F84AC2D
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 03:25:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2795F1127D9;
	Tue,  6 Feb 2024 02:25:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ngDexG0z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E9B1127D9
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 02:25:21 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-3beb504c985so163697b6e.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Feb 2024 18:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707186319; x=1707791119; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ri1YQ2hEkTssAKG3opIAud0Ytbj1JVk5Pa/2THbXMCI=;
 b=ngDexG0zqMFhZaOs5+N7QqJ232PKlbRg+Z5p/ZDnmaM/dE2C2Q0JQtpzPFmr6hMHxO
 NBpzBCrwnynyCiNy/0IDsPx8E3oiato1fqJQ58tjzVurbHfKsZHv5sKZEwCeeHFCB+v+
 6r6HYtMwQrpQkOyXYtd9nb0VZfHDATQeqEf99wl2mWCXNZ+yTHqsE2YpopYIqFI0KzIi
 h62eUMVR7r0DearABFdmwtNHNW5sJ3FTpLIfCCzleHBwf1dbW5M9onS94ALHSzzXsdo3
 ZnXtlKvP1/EGaBpU60nCv+EmRYIA7m5IEUQKGrwNaraVcl8YYcFwXMNIJ/urfn2KU5Ky
 YPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707186319; x=1707791119;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ri1YQ2hEkTssAKG3opIAud0Ytbj1JVk5Pa/2THbXMCI=;
 b=ArB71qRmPn1rJezH+346fjNRPN8Y9Sq5UFwtCX2DCkXZyt+eRmG9z6qhAuepiXK8TJ
 6EtcndLmWLqlkHNJDFVVviWc2e3Ju60GTmE7Z+Whk6Y3q6/J2sYZMbYyD7e1whcOyrRt
 9Y6cAkNnZe8jmb5+AxTsSQ2RWxrM0KFgEbpZCnZmuksqk1kvkXoomuVqoDkt7cL1qeiF
 +DDGmE6G502alXFj2OJhBAJ3G+6pZty8V/lVftEX56jmJDADabYIPtSnIPB7WcIYSahv
 bEDqPJzYoXBZS4dgV3TUab7TpKQ6MlCNI1InUqx/3lbMVd+2liA24ZV0T5Lm6K4P87vP
 BvvQ==
X-Gm-Message-State: AOJu0Yy40ZVmrtKElu8dz5sOwMlUdte7hDIlPtX6U8cygEfMNT62Bxle
 GAVpQ+UwkK2XySMGQOmwmZ3x7EsmWdGwj54WAHLqzRiUVK5HJUTjgbCH5LIz+oI0Ik88SmO+YnO
 ajoxUKL3E9Ceq3Iyvt+HMtjV3e7M=
X-Google-Smtp-Source: AGHT+IEVsuie2ylzQj0kySZ8nRKieVfkGo33FysFNzbB3nzkZJlRBk3LZIRL0PZ4oMIKZNDj5ZH6MnaaktdvbHDH3JA=
X-Received: by 2002:a05:6808:11c8:b0:3be:c4df:6ccf with SMTP id
 p8-20020a05680811c800b003bec4df6ccfmr1892265oiv.5.1707186319364; Mon, 05 Feb
 2024 18:25:19 -0800 (PST)
MIME-Version: 1.0
References: <20240203165307.7806-1-aford173@gmail.com>
 <20240203165307.7806-6-aford173@gmail.com>
 <1880028.tdWV9SEqCh@steina-w>
In-Reply-To: <1880028.tdWV9SEqCh@steina-w>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 5 Feb 2024 20:25:08 -0600
Message-ID: <CAHCN7xJZ5m1kZwx_9whx7Bv3B4N8mhB1feZUO4PpcosBXe5R2g@mail.gmail.com>
Subject: Re: [PATCH V8 05/12] arm64: dts: imx8mp: add HDMI power-domains
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-arm-kernel@lists.infradead.org, marex@denx.de, 
 frieder.schrempf@kontron.de, Lucas Stach <l.stach@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 NXP Linux Team <linux-imx@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Liu Ying <victor.liu@nxp.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org
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

On Mon, Feb 5, 2024 at 1:26=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi Adam,
>
> thanks for working on this.
>
> Am Samstag, 3. Februar 2024, 17:52:45 CET schrieb Adam Ford:
> > From: Lucas Stach <l.stach@pengutronix.de>
> >
> > This adds the PGC and HDMI blk-ctrl nodes providing power control for
> > HDMI subsystem peripherals.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> > V2:  Add missing power-domains hdcp and hrv
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 38 +++++++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > b/arch/arm64/boot/dts/freescale/imx8mp.dtsi index
> > 76c73daf546b..5c54073de615 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -836,6 +836,23 @@ pgc_mediamix: power-domain@10 {
> >                                                        <&clk
> IMX8MP_CLK_MEDIA_APB_ROOT>;
> >                                       };
> >
> > +                                     pgc_hdmimix: power-
> domains@14 {
>

Alexander,

Thanks for the feedback.

> As per Documentation/devicetree/bindings/power/fsl,imx-gpcv2.yaml the nod=
e
> should be called power-domain@.
>
> > +                                             #power-domain-
> cells =3D <0>;
> > +                                             reg =3D
> <IMX8MP_POWER_DOMAIN_HDMIMIX>;
> > +                                             clocks =3D <&clk
> IMX8MP_CLK_HDMI_ROOT>,
> > +                                                      <&clk
> IMX8MP_CLK_HDMI_APB>;
> > +                                             assigned-clocks =3D
> <&clk IMX8MP_CLK_HDMI_AXI>,
> > +
>   <&clk IMX8MP_CLK_HDMI_APB>;
> > +                                             assigned-clock-
> parents =3D <&clk IMX8MP_SYS_PLL2_500M>,
> > +
>          <&clk IMX8MP_SYS_PLL1_133M>;
> > +                                             assigned-clock-
> rates =3D <500000000>, <133000000>;
> > +                                     };
> > +
> > +                                     pgc_hdmi_phy: power-
> domains@15 {
>
> As per Documentation/devicetree/bindings/power/fsl,imx-gpcv2.yaml the nod=
e
> should be called power-domain@.

Whoops.  I totally missed these when I applied them.  I'll have them
fixed on the next spin.
>
> > +                                             #power-domain-
> cells =3D <0>;
> > +                                             reg =3D
> <IMX8MP_POWER_DOMAIN_HDMI_PHY>;
> > +                                     };
> > +
> >                                       pgc_mipi_phy2: power-
> domain@16 {
> >                                               #power-domain-
> cells =3D <0>;
> >                                               reg =3D
> <IMX8MP_POWER_DOMAIN_MIPI_PHY2>;
> > @@ -1361,6 +1378,27 @@ eqos: ethernet@30bf0000 {
> >                               intf_mode =3D <&gpr 0x4>;
> >                               status =3D "disabled";
> >                       };
> > +
> > +                     hdmi_blk_ctrl: blk-ctrl@32fc0000 {
> > +                             compatible =3D "fsl,imx8mp-hdmi-blk-
> ctrl", "syscon";
> > +                             reg =3D <0x32fc0000 0x23c>;
> > +                             clocks =3D <&clk IMX8MP_CLK_HDMI_APB>,
> > +                                      <&clk
> IMX8MP_CLK_HDMI_ROOT>,
> > +                                      <&clk
> IMX8MP_CLK_HDMI_REF_266M>,
> > +                                      <&clk IMX8MP_CLK_HDMI_24M>,
> > +                                      <&clk
> IMX8MP_CLK_HDMI_FDCC_TST>;
> > +                             clock-names =3D "apb", "axi",
> "ref_266m", "ref_24m", "fdcc";
> > +                             power-domains =3D <&pgc_hdmimix>,
> <&pgc_hdmimix>,
> > +                                             <&pgc_hdmimix>,
> <&pgc_hdmimix>,
> > +                                             <&pgc_hdmimix>,
> <&pgc_hdmimix>,
> > +                                             <&pgc_hdmimix>,
> <&pgc_hdmi_phy>,
> > +                                             <&pgc_hdmimix>,
> <&pgc_hdmimix>;
> > +                             power-domain-names =3D "bus",
> "irqsteer", "lcdif",
> > +                                                  "pai", "pvi",
> "trng",
> > +                                                  "hdmi-tx",
> "hdmi-tx-phy",
> > +                                                  "hdcp",
> "hrv";
> > +                             #power-domain-cells =3D <1>;
> > +                     };
> >               };
> >
>
> According to RM this block is part of AIPS4, so it should be below
> hsio_blk_ctrl.

This is how it was when I got it, but I should have caught it.  Thanks
for that.  It looks like the subsequent HDMI, IRQ_steerting, LCDIF and
PHY ones are also out of place.

adam
>
> Best regards,
> Alexander
>
> >               aips5: bus@30c00000 {
>
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> http://www.tq-group.com/
>
>
