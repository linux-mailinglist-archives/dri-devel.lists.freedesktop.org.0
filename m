Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A56A408F1
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 15:27:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F35810E05E;
	Sat, 22 Feb 2025 14:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s/CXpAID";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1142A10E05E
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 14:27:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A2D286111F;
 Sat, 22 Feb 2025 14:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D36C4CED1;
 Sat, 22 Feb 2025 14:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740234421;
 bh=EL+0y5KjTAzDfvmIH+Ri1DqZPpipQZAhhIpAMVIjN/c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=s/CXpAIDe2Z0vS74RVsT9F2geFff724n0SCs2rtxahtDlAbZOht4cEJdh2wu3cU8/
 qJcXAL2eAdwhq/BymL2DCYOSPmfsXJI6zXHPFa8Rg9YLNigB/+lljwDxMe0f8Cp759
 2LX4BBH9Wn4hsfolt33QTHlp8aojFGnhLooQiwX+sbGvio09m2gtYff8moOmMcqpkV
 YTYVKJhaeaX/gEp6EeWrSArkx0h/r8ZzyAPd610voLJv19nFHV1ccJjwCkdjgU4t2e
 fA2KLWCv1m+LdNtDTFH04XXVPsIrC/CsK0A5z5/z2O5g4BoS/PQSNhT0NPFv39UCxM
 woHuREoKB3HRQ==
Date: Sat, 22 Feb 2025 14:26:50 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Lee Jones <lee@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Pavel Machek <pavel@ucw.cz>, Daniel
 Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Helge
 Deller <deller@gmx.de>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mfd: Document TI LM3533 MFD
Message-ID: <20250222142650.63857ea8@jic23-huawei>
In-Reply-To: <CAPVz0n2wRu3X82nrnEac+XP+Q8uQMVwBLhGUaoqOLLf-V5dZfg@mail.gmail.com>
References: <20250218132702.114669-1-clamor95@gmail.com>
 <20250218132702.114669-2-clamor95@gmail.com>
 <20250221203803.GA24813-robh@kernel.org>
 <CAPVz0n2wRu3X82nrnEac+XP+Q8uQMVwBLhGUaoqOLLf-V5dZfg@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Sat, 22 Feb 2025 09:01:18 +0200
Svyatoslav Ryhel <clamor95@gmail.com> wrote:

> =D0=BF=D1=82, 21 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 22:38 Ro=
b Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Tue, Feb 18, 2025 at 03:26:59PM +0200, Svyatoslav Ryhel wrote: =20
> > > Add bindings for the LM3533 - a complete power source for
> > > backlight, keypad, and indicator LEDs in smartphone handsets.
> > > The high-voltage inductive boost converter provides the
> > > power for two series LED strings display backlight and keypad
> > > functions.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  .../devicetree/bindings/mfd/ti,lm3533.yaml    | 231 ++++++++++++++++=
++
> > >  1 file changed, 231 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/mfd/ti,lm3533.y=
aml
> > >
> > > diff --git a/Documentation/devicetree/bindings/mfd/ti,lm3533.yaml b/D=
ocumentation/devicetree/bindings/mfd/ti,lm3533.yaml
> > > new file mode 100644
> > > index 000000000000..83542f0c7bf7
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mfd/ti,lm3533.yaml
> > > @@ -0,0 +1,231 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/mfd/ti,lm3533.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: TI LM3533 Complete Lighting Power Solution
> > > +
> > > +description: | =20
> >
> > Use '>' rather than '|' if only formatting is paragraphs.
> > =20
>=20
> yaml check did not complain, fine.

It can't tell whether you want it formatted exactly or if paragraphs
is enough.=20

>=20
> > > +  The LM3533 is a complete power source for backlight,
> > > +  keypad, and indicator LEDs in smartphone handsets. The
> > > +  high-voltage inductive boost converter provides the
> > > +  power for two series LED strings display backlight and
> > > +  keypad functions. =20
> >
> > Wrap lines at 80
> > =20
>=20
> Checkpatch and yaml check do not complain, why? 80 char limit was removed=
, no?

Check was to prevent over 80 chars, here you are far too short.



