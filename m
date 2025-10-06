Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C181FBBF0CF
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 21:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF9310E44B;
	Mon,  6 Oct 2025 19:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HTRiN7j5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6B210E44D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 19:01:35 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-789fb76b466so4674588b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 12:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759777295; x=1760382095; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mYZ8UHayERgN9wwxms25R/WIMLPdiBWsn9w/tx9HKCQ=;
 b=HTRiN7j5wi+zpg8h9Vw6g2v5TFqdfmY/i8oqPjQlykPsVAKz4oh/AY2qm2RPx6iHOv
 0Tq63NwpXQ0ByItzMt59biBskseCThfaHKqMLen7DT8Z+elc5ODK+on3EdW76TQNcFl7
 5IYY/Wlru780wH3oUE6a3E6MQ5xR0LKGeid/a+gVgoMfb9y80p593Fv9aWr8/2L5uYRc
 AeYEgAQ0rJbAMMhtnDacgsCaEpbNcod5Etr9VMsIp1+F1D+lhJAXpyNmQW+RejxM7JLO
 FA473bh6Q5v095TbrdYtNCgpEloDrZS9/3RXWzv6EFRx+wpceKrU07JTo9iefkbVx7ve
 +o4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759777295; x=1760382095;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mYZ8UHayERgN9wwxms25R/WIMLPdiBWsn9w/tx9HKCQ=;
 b=ATD66r9tyLTmX/FoFFGywRXPXZWPpmlLq90jRKK3PrjNfc0IIrYaEnulDMbL1R1Uil
 8RfKieGFLZjm6pO0zh1YYwEkKjVR3kr2JljjO59FT027Lqmdp9c7azqJTHUXohcKJE0c
 xxQMctsEuf2SHNpkvijm/09B/2COqLMQgHYREmUgaA9dB9hhZyyiTbyCSrP+pxM2tpBG
 PAIzUrgyNd91g3MRBBVPKQdNqXoJYPucpIQuKcf8EkRo0LCH96uqbeZHlNmSo3ybXRIS
 Lm+LcMcOHz+OqaGj5R72Qr2egqoCJMZCfc4oCwS3xph2cf9rFIZLzEXlJEAkA0klgtpd
 UdDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOW+U+uBm19LPOIgBUTFujGmsB49X/BviD0w/obvYW25T0sRGmZBCX1cTDYlfF9+BG/h2FGbEhecU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwmNFQ5jJWaGirq7d5QYqyDBl9gGdodHe5/ESZgFm9F3yjyK4t
 7JCZLDZi5g8BAAT4P7Avopo1sWmtEzkDTl37BNV+4qjX8U+eEb5rqo5AFrJL524CX/BLz0Zb1mS
 sd2yvrHSie0dXWIGVuuGtGNj0a7SbMSM=
X-Gm-Gg: ASbGncsZkCzvaQO28a3N0jsxaxXUJPzB2mzgXZvGif6wlFMGLQeNnff8WKuBjGdOKgo
 ip/6J4XrUTpN+NJZJF/BSHpZH8xliq31Hi526oS/7yOOnWjNyY5D8hDoGY8V6BJR6JOqRanzde+
 nRidr/3Cc0aU8Fyoq2QxSzo9GaNYH/+ecimhX+G+6DdEJo8BbUeWz5MjVIYOOY+S+0xY4LLULPj
 yvYEQK0LPeoUC0TdhggFj06e1rYg5cB+OJMPEpE
X-Google-Smtp-Source: AGHT+IHjbRQmxK9nItl2HffExFNwVAi7q3n9PoNqjUew1CuTn1djxW2xNlMPlH1OQdzQN2XzFyIHcR/X/BEeXf1S/Xs=
X-Received: by 2002:a17:90b:4d05:b0:329:e2b1:def3 with SMTP id
 98e67ed59e1d1-339c271e913mr18582984a91.10.1759777295000; Mon, 06 Oct 2025
 12:01:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250921083446.790374-1-uwu@icenowy.me>
 <20250921083446.790374-3-uwu@icenowy.me>
 <20250922204349.GA1290045-robh@kernel.org>
 <1ac8c72206abf9f3e0a13e1fcf44be5c605f6372.camel@icenowy.me>
 <36040a0a40311cb1e871075f0c5ad175342ed5db.camel@icenowy.me>
 <CAH9NwWdx-Ut35RvhmNsdQbC4vfm3rH1VPN7H2uDBRsmsFjZU_Q@mail.gmail.com>
 <84566b33d0d08ad070c3aa8a01e07f3a0e3bff50.camel@icenowy.me>
 <c7d79542aedb6c074c4be21eaa15c71a53e87da4.camel@icenowy.me>
In-Reply-To: <c7d79542aedb6c074c4be21eaa15c71a53e87da4.camel@icenowy.me>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 6 Oct 2025 21:01:22 +0200
X-Gm-Features: AS18NWCjcsoivBsp8jaWAwEQpEhhNVJLV_pDpFJNQ8qKcsWUh9zL3A2T5EiSJg8
Message-ID: <CAH9NwWe+eStPai5baFY62RCUB=3c9qmOSXpFuAvyX2a7_v=0Vw@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: display: add verisilicon,dc
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Rob Herring <robh@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 moderated for non-subscribers <etnaviv@lists.freedesktop.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Michal Wilczynski <m.wilczynski@samsung.com>, Han Gao <rabenda.cn@gmail.com>, 
 Yao Zi <ziyao@disroot.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
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

Am Mo., 6. Okt. 2025 um 18:34 Uhr schrieb Icenowy Zheng <uwu@icenowy.me>:
>
> =E5=9C=A8 2025-09-25=E6=98=9F=E6=9C=9F=E5=9B=9B=E7=9A=84 13:57 +0800=EF=
=BC=8CIcenowy Zheng=E5=86=99=E9=81=93=EF=BC=9A
> > =E5=9C=A8 2025-09-24=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 20:15 +0200=EF=
=BC=8CChristian Gmeiner=E5=86=99=E9=81=93=EF=BC=9A
> > > > > > > Verisilicon has a series of display controllers prefixed
> > > > > > > with
> > > > > > > DC
> > > > > > > and
> > > > > > > with self-identification facility like their GC series
> > > > > > > GPUs.
> > > > > > >
> > > > > > > Add a device tree binding for it.
> > > > > > >
> > > > > > > Depends on the specific DC model, it can have either one or
> > > > > > > two
> > > > > > > display
> > > > > > > outputs, and each display output could be set to DPI signal
> > > > > > > or
> > > > > > > "DP"
> > > > > > > signal (which seems to be some plain parallel bus to HDMI
> > > > > > > controllers).
> > > > > > >
> > > > > > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > > > > > ---
> > > > > > > Changes in v2:
> > > > > > > - Fixed misspelt "versilicon" in title.
> > > > > > > - Moved minItems in clock properties to be earlier than
> > > > > > > items.
> > > > > > > - Re-aligned multi-line clocks and resets in example.
> > > > > > >
> > > > > > >  .../bindings/display/verisilicon,dc.yaml      | 127
> > > > > > > ++++++++++++++++++
> > > > > > >  1 file changed, 127 insertions(+)
> > > > > > >  create mode 100644
> > > > > > > Documentation/devicetree/bindings/display/verisilicon,dc.ya
> > > > > > > ml
> > > > > > >
> > > > > > > diff --git
> > > > > > > a/Documentation/devicetree/bindings/display/verisilicon,dc.
> > > > > > > ya
> > > > > > > ml
> > > > > > > b/Documentation/devicetree/bindings/display/verisilicon,dc.
> > > > > > > ya
> > > > > > > ml
> > > > > > > new file mode 100644
> > > > > > > index 0000000000000..07fedc4c7cc13
> > > > > > > --- /dev/null
> > > > > > > +++
> > > > > > > b/Documentation/devicetree/bindings/display/verisilicon,dc.
> > > > > > > ya
> > > > > > > ml
> > > > > > > @@ -0,0 +1,127 @@
> > > > > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > > > > +%YAML 1.2
> > > > > > > +---
> > > > > > > +$id:
> > > > > > > http://devicetree.org/schemas/display/verisilicon,dc.yaml#
> > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > +
> > > > > > > +title: Verisilicon DC-series display controllers
> > > > > > > +
> > > > > > > +maintainers:
> > > > > > > +  - Icenowy Zheng <uwu@icenowy.me>
> > > > > > > +
> > > > > > > +properties:
> > > > > > > +  $nodename:
> > > > > > > +    pattern: "^display@[0-9a-f]+$"
> > > > > > > +
> > > > > > > +  compatible:
> > > > > > > +    const: verisilicon,dc
> > > > > >
> > > > > > This needs an SoC specific compatible. Generally licensed IP
> > > > > > compatibles
> > > > > > are useless because the specs aren't public and there's
> > > > > > always
> > > > > > integration quirks.
> > > > >
> > > > > This mimics the GPU IPs by the same vendor, see
> > > > > gpu/vivante,gc.yaml ,
> > > > > which contain the exact same set of identification registers
> > > > > (including
> > > > > a "customer id" one that can differienate the same configured
> > > > > IP
> > > > > on
> > > > > StarFive JH7110 and T-Head TH1520).
> > > > >
> > > > > If we can get vivante,gc to work w/o SoC specific compatible,
> > > > > then we
> > > > > should be able to get verisilicon,dc to work too.
> > > >
> > > > Well maybe I should add etnaviv people to the recipient list, to
> > > > allow
> > > > them to tell us the magic behind vivante,gc .
> > > >
> > >
> > > Vivante GPUs are special because they contain registers that allow
> > > them to
> > > be fully identified - see etnaviv_hw_identify(..).
> > >
> > > We can read out the following information:
> > >  - model
> > >  - revision
> > >  - product_id
> > >  - customer_id
> > >  - eco_id
> >
> > Well Verisilicon DCs (sometimes also called Vivante DCs because
> > Vivante
> > is now part of Verisilicon) except DCNano have the same set of ID
> > registers (In fact the registers before 0x1500 seem to have mostly
> > the
> > same meaning with GPUs, see [1], here the registers are even named
> > GC{,REG}_xxx), so it's why I assume "verisilicon,dc" will work here.
> >
> > An example of identification registers readout on TH1510 is shown
> > below: (the register names are from etnaviv state_hi.xml)
> > ```
> > root@lpi4a66 [ ~ ] # busybox devmem 0xffef600020 # MODEL
> > 0x00008200
> > root@lpi4a66 [ ~ ] # busybox devmem 0xffef600024 # REV
> > 0x00005720
> > root@lpi4a66 [ ~ ] # busybox devmem 0xffef600028 # DATE
> > 0x20210201
> > root@lpi4a66 [ ~ ] # busybox devmem 0xffef60002c # TIME
> > 0x11133000
> > root@lpi4a66 [ ~ ] # busybox devmem 0xffef600030 # CUSTOMER_ID
> > 0x0000030A
> > root@lpi4a66 [ ~ ] # busybox devmem 0xffef6000a8 # PRODUCT_ID
> > 0x02082000
> > root@lpi4a66 [ ~ ] # busybox devmem 0xffef6000e8 # ECO_ID
> > 0x00000000
> > ```
> >
>
> Rob,
>
> Is this an acceptable answer of not having a vendor-specific
> compatible?
>
> If it isn't, I will add vendor-specific compatible strings to the next
> revision of the binding, and maybe also try to add them for vivante,gc.
>

There is no need to touch anything for vivante,gc.

--=20
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
