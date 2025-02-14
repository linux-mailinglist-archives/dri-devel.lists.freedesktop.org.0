Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C498A356DC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 07:15:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575CD10E036;
	Fri, 14 Feb 2025 06:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lkIGp58O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170C810E036
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 06:15:51 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-38de17a5fc9so880090f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 22:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739513749; x=1740118549; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jhnYXc5eLU/qb2LmGA7DVYyAfoe6L2fU4LUv/RW7nLY=;
 b=lkIGp58OMsRXFoL7bZJBP0lqYp9oC1xvporXwxlBsimKd0rhT5giZ9LCkHt+3eNX9d
 pPckNau60scNQQNPPGt05o0Oz7LIq9QIu1rzf3vD0vRVoifb5sKuvwKulLS1MC0ZwXff
 +z+lD009Y+HdqvJMEQLnmg+sWs1BOsaTpkNa/htGOj2gpLOt/xdj5eKltmpAoMgGTJf6
 WuEc5JT4av7uql9nukADG79I0UyNmMVMi7Pvib0f3z1o5r9xbWGTnyomba30HknDT5eZ
 AJA227sdgSHHCRJ+ZS08HDPeUgn47u3ZoJcYedQbE8knSOqDoTLtZjNC3Cbv9QqzDly7
 C+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739513749; x=1740118549;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jhnYXc5eLU/qb2LmGA7DVYyAfoe6L2fU4LUv/RW7nLY=;
 b=T+xixovLIYc7u3oVskxWNBoe/8Lochps+ADv4dDBqHEgpD0IZoUKmzDjh1RBpjB2Tg
 2suLcqeTIfVZlE2g73Ci53Rmz3FiIPqwR4Q/BFBShcapT7UxtUqV1Ln+kzJ0WSFPTH+M
 MQsGqmdM7ld6q8KEZ2Ep7mE7lsnEPZi0oMqZ/zJidzOdUU40Y9Tzs7DDgyicTVegmu7Y
 j75PAQKNIGLFNPv8gT7DK0CZKyBs9+2Dd1z3pITmWtYfLBpH4+I2FYk53dC6Fw4EAt7l
 1cyUxX8VVaSMgLt+MbwFFNsvZwIEcjXzmdQTkvZWHFJPerAS0Mduy0/uNprNqptg+CCB
 LaEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUwaIfa1D0mCQNFE4rvzjJGmJh8J1WyeEzABh8F/URHEWXHlecVD3vneusBAgTRfp8vQfHxugXlLg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzD8DvbTOtWdbOypOIiHd/8QtqE/62nLhXJh94RzEkULaScQ6E/
 19iOylRyq9rE41SClvY1rFnXI9gC10iY2RWtqEsA3FoOPv2Bdm71z7TczmC2EbTYaWddyuHD2U2
 +VNyfKsGe+wr3S87nuZvdzzjN6u4=
X-Gm-Gg: ASbGnctGjt8tnV4ouib8CuNoX+2q9k1l2nmNgfKOH8tFQcypNoj9Uxo9fYFKWKqPCNH
 IteepGQC1Nf4X9EGxVXfYFyNXscO+zYYXu67GGTDhYaXfDHKExSgvFO2Zp0dFoM7N/g8p7Kt9WQ
 ==
X-Google-Smtp-Source: AGHT+IEheasLNiOFDe5gQUVHdJ2tXdveZ64cTF1VIIUAvU9iciSBae2zDTq5NTHytPqUSQySTKC3ggW2wMA/FnoTyEQ=
X-Received: by 2002:a5d:6484:0:b0:38d:a879:4778 with SMTP id
 ffacd0b85a97d-38f24505651mr8245160f8f.33.1739513747960; Thu, 13 Feb 2025
 22:15:47 -0800 (PST)
MIME-Version: 1.0
References: <20250212075845.11338-1-clamor95@gmail.com>
 <20250212075845.11338-2-clamor95@gmail.com>
 <Z65k-fi78DnKVN1K@aspen.lan>
In-Reply-To: <Z65k-fi78DnKVN1K@aspen.lan>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 14 Feb 2025 08:15:36 +0200
X-Gm-Features: AWEUYZkYeN4e2_mTmoivB54FQVa-QU7otnFSUN4kc54MQBDIFepRTqtzY9BzDCE
Message-ID: <CAPVz0n2p2OS=nhBY13huPEew0XjReH+LF+zxLMAXLWo0kU-jSA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: mfd: Document TI LM3533 MFD
To: Daniel Thompson <daniel@riscstar.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Pavel Machek <pavel@ucw.cz>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-iio@vger.kernel.org, linux-leds@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
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

=D1=87=D1=82, 13 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 23:32 Dani=
el Thompson <daniel@riscstar.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Feb 12, 2025 at 09:58:41AM +0200, Svyatoslav Ryhel wrote:
> > Add bindings for the LM3533 - a complete power source for
> > backlight, keypad, and indicator LEDs in smartphone handsets.
> > The high-voltage inductive boost converter provides the
> > power for two series LED strings display backlight and keypad
> > functions.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../devicetree/bindings/mfd/ti,lm3533.yaml    | 221 ++++++++++++++++++
> >  include/dt-bindings/mfd/lm3533.h              |  19 ++
> >  2 files changed, 240 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/ti,lm3533.yam=
l
> >  create mode 100644 include/dt-bindings/mfd/lm3533.h
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/ti,lm3533.yaml b/Doc=
umentation/devicetree/bindings/mfd/ti,lm3533.yaml
> > new file mode 100644
> > index 000000000000..d0307e5894f8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/ti,lm3533.yaml
> > @@ -0,0 +1,221 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/ti,lm3533.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: TI LM3533 Complete Lighting Power Solution
> > +
> > +description: |
> > +  The LM3533 is a complete power source for backlight,
> > +  keypad, and indicator LEDs in smartphone handsets. The
> > +  high-voltage inductive boost converter provides the
> > +  power for two series LED strings display backlight and
> > +  keypad functions.
> > +  https://www.ti.com/product/LM3533
> > +
> > +maintainers:
> > +  - Johan Hovold <jhovold@gmail.com>
>
> This looks like it has been copied from the lm3533 driver. Did Johan
> agree to this?
>

Thank you for pointing this out, maintainers field should have been
amended with my name. It seems that this slipped from me on
submitting. I initially though that maintainers should contain driver
author hence set Johan, but that is obviously not correct.

>
> Daniel.
