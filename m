Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA96B0BF47
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 10:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E047610E49B;
	Mon, 21 Jul 2025 08:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V5aHWgNl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E092D10E244
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 03:29:03 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-3ddd2710d14so35592195ab.2
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 20:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753068543; x=1753673343; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UtsiXR0EQZlATD8N1ReRV9zk/lQTOXFRW0wcbXVZLic=;
 b=V5aHWgNlyv4rHB+LcF9ntbrGpeiaO2XE6Td+43GiYlpfLILtRPNXZLYPeF7Q1pED9x
 1SZSlVyKurwAk4vZuh3tKPX94jcCkuMfpuJKsGhdER6Zzvxdj51bgNAGeA+tS0Y9bQRu
 J/HOSYK6MdTgP6J6sN4sUvF7+AY8E4VhayuVa7QUEzuJuym758ZvOhnfO8OOCUaRNxxk
 iB4M2RO4MOTNeUT6PRoYNeI/k6B0x9Uby+extuBt7v/9Ivv1kjHQHFIMHXxpWZLe31MT
 vBOLHSgJiqXD3ltFppYtIi3TEHJhX39wdeDE6h1Vae3QcyHS2mz9ba4hWZb+whICY/1O
 3O7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753068543; x=1753673343;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UtsiXR0EQZlATD8N1ReRV9zk/lQTOXFRW0wcbXVZLic=;
 b=vxBS/xYqJD/t6BmuuvS6Je+1oeRC+9GSRuPU8OCfaNGYW/Fc2ohEhbzDqyqpSNhJWR
 bjg55u1I4OKVMNtyfWbeuACfUe5tyLoRjANmGxDBRIMkQ2nbQmZIo48v3dgGbHKaDzgd
 Y4M4qI7pJ9J4uxGdru9xwI8ysBXl2XTGaE3V1UbVJaJSenACGGfVqF5WwlhWgGRn9RlA
 iPyQ14vcPIr5XTmCBLjnIk2TFgw523Fwk+ObocJ+peJCgGzZkUmE40pqwlLJAZtFXle0
 lCDTnE+2aKlu5syqjOLw8yChRkLtogY2hLENGZC3F36N8Diq+ViHsDgZ4K/4qFH9iVGl
 ezmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyfIDHO2JEuAkTpUyFrleiRl1IPZx1ger3/NlaZsq9rO5sH0yUGe3K9ykfvo0VUHbFI2Xka4B2Mpo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1gLLkaYb5xcu47zwF9Nt9ZLqH1LlP6HWHaacbhg3X+P51quAg
 c7pWMrZZdUhTO3nFan2LOuvlYGhHuyzVABiKbTPOQNgfPX1StdJ88g1Fk3p5Vnn7q0cwAQyebVy
 fozq1rBsUf+2rbX/cYiBWNnERYqilkzwZ2w==
X-Gm-Gg: ASbGncs1lx13l5gOoVamUA0s8TGEIEIntBdFoYhPUBkEAo0+DAAnebmuj6uCRZR4lpS
 J0qQrb86KOZF7+HyeL1JtSCd1Zzet45lkpQ6QGxBehrk1jwksE9pwxuMxt0e3TCaAwRkqZRvysy
 3MbUQocgLrmpw7l/prOFwQcmSXBqX2SewZ4U5f6UL/trGEZmzeL3qypTR+B6QeyXvsxtYjx9M14
 6e6hVrn9HC437s04g==
X-Google-Smtp-Source: AGHT+IETEm9xXMr77IDr6KJZdmuLlNFoj+aCrz2mROuJITSXc/2fmarCRzlGXALoW/ZTbwduUUZbV41vvElTnzhtcLQ=
X-Received: by 2002:a05:6e02:1fec:b0:3df:347f:ff3e with SMTP id
 e9e14a558f8ab-3e282d9c846mr214673475ab.7.1753068542942; Sun, 20 Jul 2025
 20:29:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
 <20250718101150.3681002-5-shengjiu.wang@nxp.com>
 <aHp2jxNRPfYGUiUY@lizhi-Precision-Tower-5810>
In-Reply-To: <aHp2jxNRPfYGUiUY@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 21 Jul 2025 11:28:47 +0800
X-Gm-Features: Ac12FXxlzAFWQkaGaWWuP5cmwncPGBSTwpvgKOefFzCXa9uYxNYrdhmd2LNtgq8
Message-ID: <CAA+D8AO4+YRrsFUU3kDB_YU5WbA8Dm=+0v_NOvZ2jqg4vPjRKg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: imx8mp: Add hdmi parallel audio interface
 node
To: Frank Li <Frank.li@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org, 
 l.stach@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 21 Jul 2025 08:45:46 +0000
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

On Sat, Jul 19, 2025 at 12:30=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Jul 18, 2025 at 06:11:50PM +0800, Shengjiu Wang wrote:
> > The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
> > acts as the bridge between the Audio Subsystem to the HDMI TX Controlle=
r.
>
> Remove " a digital module that acts as the" is more straightforward.
>
> >
> > Correct the register map of hdmi_pvi, which is overlapped with the
> > hdmi_pai device.
>
> Shrink register map size of hdmi_pvi to avoid overlapped hdmi_pai device.

Ok, will update them in next version.
>
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp-evk.dts |  4 +++
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi    | 26 +++++++++++++++++++-
> >  2 files changed, 29 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/=
boot/dts/freescale/imx8mp-evk.dts
> > index c0cc5611048e..cc9351a5bd65 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > @@ -442,6 +442,10 @@ &flexcan2 {
> >       status =3D "disabled";/* can2 pin conflict with pdm */
> >  };
> >
> > +&hdmi_pai {
> > +     status =3D "okay";
> > +};
> > +
> >  &hdmi_pvi {
> >       status =3D "okay";
> >  };
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boo=
t/dts/freescale/imx8mp.dtsi
> > index bb24dba7338e..6e5a41f46309 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -2063,7 +2063,7 @@ irqsteer_hdmi: interrupt-controller@32fc2000 {
> >
> >                       hdmi_pvi: display-bridge@32fc4000 {
> >                               compatible =3D "fsl,imx8mp-hdmi-pvi";
> > -                             reg =3D <0x32fc4000 0x1000>;
> > +                             reg =3D <0x32fc4000 0x800>;
> >                               interrupt-parent =3D <&irqsteer_hdmi>;
> >                               interrupts =3D <12>;
> >                               power-domains =3D <&hdmi_blk_ctrl IMX8MP_=
HDMIBLK_PD_PVI>;
> > @@ -2089,6 +2089,22 @@ pvi_to_hdmi_tx: endpoint {
> >                               };
> >                       };
> >
> > +                     hdmi_pai: hdmi@32fc4800 {
>
> commit message it is bridge device, maybe audio-bridge is good node name

Ok, will use audio-bridge.

best regards
Shengjiu Wang
>
> Frank
> > +                             compatible =3D "fsl,imx8mp-hdmi-pai";
> > +                             reg =3D <0x32fc4800 0x800>;
> > +                             interrupt-parent =3D <&irqsteer_hdmi>;
> > +                             interrupts =3D <14>;
> > +                             power-domains =3D <&hdmi_blk_ctrl IMX8MP_=
HDMIBLK_PD_PAI>;
> > +                             status =3D "disabled";
> > +
> > +                             port {
> > +
> > +                                     pai_to_hdmi_tx: endpoint {
> > +                                             remote-endpoint =3D <&hdm=
i_tx_from_pai>;
> > +                                     };
> > +                             };
> > +                     };
> > +
> >                       lcdif3: display-controller@32fc6000 {
> >                               compatible =3D "fsl,imx8mp-lcdif";
> >                               reg =3D <0x32fc6000 0x1000>;
> > @@ -2140,6 +2156,14 @@ port@1 {
> >                                               reg =3D <1>;
> >                                               /* Point endpoint to the =
HDMI connector */
> >                                       };
> > +
> > +                                     port@2 {
> > +                                             reg =3D <2>;
> > +
> > +                                             hdmi_tx_from_pai: endpoin=
t {
> > +                                                     remote-endpoint =
=3D <&pai_to_hdmi_tx>;
> > +                                             };
> > +                                     };
> >                               };
> >                       };
> >
> > --
> > 2.34.1
> >
