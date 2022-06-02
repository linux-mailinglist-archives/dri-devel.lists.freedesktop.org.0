Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 179E453B9C3
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 15:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CDB1112201;
	Thu,  2 Jun 2022 13:32:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com
 [IPv6:2607:f8b0:4864:20::a30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20356112201
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 13:32:47 +0000 (UTC)
Received: by mail-vk1-xa30.google.com with SMTP id n20so2172249vkl.9
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 06:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1jE3omidoDC8ojZ7FhHr9+lAZVHzqEYQnyQPLqfzIME=;
 b=HGoExsnJpq0YlopdoXx3Ur0MkhNtgva2ncdnsR+rNjt09dPOSbt4ytiXjL7GtoiH3V
 ZNw4pZ/17rxW9YpwocHj+6JSMghqJpjZQ1Poaoi35fjgDfSrBVOonnq+wSazLOA/xti1
 rsNMgpf+vM8vs3yCJvQcvW6EPWyLmhWzjm485pgoTOKYC/7OMsPw/Oo13+A2Mx4xQ8EU
 lkm6zw06FY6YoAIY8y6m+cUHn0GC1RQKZuMf4/06VptAOHE51McCLhE+Ctpfzm2Xsg1D
 q5TJC8KQl8vzywMa4o57iERT/Dnn+M/ULj+ctcoH1i1E5K4xpraZwa7zeNLMHMbRMFOL
 Bsyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1jE3omidoDC8ojZ7FhHr9+lAZVHzqEYQnyQPLqfzIME=;
 b=GESV4yHz9jzGfu3YE8amEk8PjCBOvragHrraWS76puO4kIaPiXhAmQbYXZAhe5qBbj
 N4Hx8MkaKzyPcNfw/Xc2txiqcvu1iMej5lQmQtkoAwNvH6QViL0MZrsI2QR7RSfUZAO/
 d1m5jZBuF+3BcwNXe8jbBIz6Yg0I+bGFxyGDAJLJ0bjdz2G0MgQiwE+AhbylTu1Ugi6v
 hKSn+tG/C8VemhoomLW1CoIkL9Sh/vo+vrQjybv9ykadGWOJ04KXJRXctEopSy5TBqHv
 DriG5ft7lc2A483fqCgJ6AQdz0UxWQMEPADh5kW7iCioYX3nbncBlIAGdr8gI1Xrai26
 E9dA==
X-Gm-Message-State: AOAM530FI8fvDHt3Mt3SiGPtGX/xjAOrsYPzKDQoI/LfPg6F7qhWPqKw
 CuMYMB9KhN9AKRx64KrRnQb0AaBGn1+giGKxLJs=
X-Google-Smtp-Source: ABdhPJxyDg4FcSw8NEXcWUSdUhwwVo8AlVpTqXszNu4D6lbF6AnIF6xzUiFKSyVTsdaFcNQCGowgnKX4sgRzBmmqapQ=
X-Received: by 2002:a05:6122:981:b0:359:1e72:bfbb with SMTP id
 g1-20020a056122098100b003591e72bfbbmr13892004vkd.2.1654176766134; Thu, 02 Jun
 2022 06:32:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220601110249.569540-1-pbrobinson@gmail.com>
 <20220601110249.569540-5-pbrobinson@gmail.com>
 <9e096f63-2c8e-b4b7-6d27-79282ecc4e1b@i2se.com>
In-Reply-To: <9e096f63-2c8e-b4b7-6d27-79282ecc4e1b@i2se.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Thu, 2 Jun 2022 14:32:35 +0100
Message-ID: <CALeDE9O8jorjuJQAAUy_bnCnRiq+fWWv+p=K+kM7n6mRHAZb5Q@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] ARM: dts: bcm2711: Enable V3D
To: Stefan Wahren <stefan.wahren@i2se.com>
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
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Emma Anholt <emma@anholt.net>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stefan,

> Am 01.06.22 um 13:02 schrieb Peter Robinson:
> > This adds the entry for V3D for bcm2711 (used in the Raspberry Pi 4)
> > and the associated firmware clock entry.
> >
> > Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > ---
> > Changes since v5:
> > - Move the firmware clock to bcm2711-rpi.dtsi
> >
> >   arch/arm/boot/dts/bcm2711-rpi.dtsi |  4 ++++
> >   arch/arm/boot/dts/bcm2711.dtsi     | 11 +++++++++++
> >   2 files changed, 15 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/bcm2711-rpi.dtsi b/arch/arm/boot/dts/bcm2711-rpi.dtsi
> > index ca266c5d9f9b..98817a6675b9 100644
> > --- a/arch/arm/boot/dts/bcm2711-rpi.dtsi
> > +++ b/arch/arm/boot/dts/bcm2711-rpi.dtsi
> > @@ -69,6 +69,10 @@ blconfig: nvram@0 {
> >       };
> >   };
> >
> > +&v3d {
> > +     clocks = <&firmware_clocks 5>;
> > +};
> > +
> >   &vchiq {
> >       interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> >   };
> > diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
> > index 89af57482bc8..177662257b16 100644
> > --- a/arch/arm/boot/dts/bcm2711.dtsi
> > +++ b/arch/arm/boot/dts/bcm2711.dtsi
> > @@ -601,6 +601,17 @@ genet_mdio: mdio@e14 {
> >                               #size-cells = <0x0>;
> >                       };
> >               };
> > +
> > +             v3d: gpu@7ec00000 {
> > +                     compatible = "brcm,bcm2711-v3d";
>
> unfortunately this doesn't match with patch #3 anymore. Except of this
> everything looks good here.

Good catch, have updated locally, I'll send out a new rev tomorrow,
will give it a day to see if there's other feedback,

P

> Stefan
>
> > +                     reg = <0x0 0x7ec00000 0x4000>,
> > +                           <0x0 0x7ec04000 0x4000>;
> > +                     reg-names = "hub", "core0";
> > +
> > +                     power-domains = <&pm BCM2835_POWER_DOMAIN_GRAFX_V3D>;
> > +                     resets = <&pm BCM2835_RESET_V3D>;
> > +                     interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> > +             };
> >       };
> >   };
> >
