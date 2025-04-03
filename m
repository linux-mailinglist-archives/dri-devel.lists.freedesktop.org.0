Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 069FAA7A157
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 12:50:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05AB810E995;
	Thu,  3 Apr 2025 10:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F2ZhPmoh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7967F10E081
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 10:31:39 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-30bef9b04adso6346741fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Apr 2025 03:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743676298; x=1744281098; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Pkl55XOjf550d6YijfrQtlIy4dvUDtTsQLi7ATChpCM=;
 b=F2ZhPmohWzeD4bhr25IYR78bSHfA8DUfx0tOJB9AQCf2SRngUKQujbCHs1rQW/oRfV
 CyE6BqO+mh3xpxrwkKGnMiBg2wsz9xwsPBGCxFknnihaLyepdva9iZmfN6fiWcocNV+R
 NZf1tXpb4OwI2zA7WWuebfdy/X28HRzgNeXgNvwDl+eqmpfpiqMzrYc8oRgXpX8jxlpf
 D01iT86tnJ5+CJIZ3b0m0nygL0mTuoBIi5ZQu1mQo9m/c525BbPNnD1Gg9ftbNllo4ql
 Lsh3ufZG5czRB6C34rmxP2EJVOEs3KLdAPym4QjjJRfriYyb0sx6C7JPb8W3Cf03q5Gx
 Q7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743676298; x=1744281098;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pkl55XOjf550d6YijfrQtlIy4dvUDtTsQLi7ATChpCM=;
 b=F6sgGGaQJ3n/mwP6KLZFdb2fv9HF8OSzCsSmX3q3UNFPMf1efPc2W+zI/mdNoZ9zur
 t4RryhG/av/1VN64ZAhwqxhCq3psld9dnKHp0cxx5b6DiMai8oK/73Kwxt74Cg/cUxGU
 ROxax0FrxX0sp64YNti8/D88YxcMDwxi5K8XhSMRJRiML6ALdbddY3Qqfdb53Z6IcVqV
 xkXN16OXmwzeW8fvwkUu27D9TlL1aR5ealC1Xrr0D6yfYT6PgAz4ii3+7dj1mVZjWoTz
 iuzlvb7i4Yp79yzZC4ylHAmBjlZYP3q10J8CMlhlvJ8LQeFKgngyCJRAOVT/bmeUZaNM
 1TtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsKOxw2+/CWvLWx7q2OeFyOe4WAWyl2SbGnLVFggxxdjX4BPWgHqw/ePw2UeGL6pFfi36ssys5LUM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9WFrsCDWmMTo/FPWAWbJQSWm3u7BWb920i5kQFtU1PDmsciBj
 RO9EUNVh/pDqpsGpfW7929rEJie73TsugnuKTBFvG5L4ReGzitoe
X-Gm-Gg: ASbGncs0wITt2FtAJ+VV+Gkf4D62Ia7xadSLk/Q3Xbau/yqO7JUsYpbeS981V9eLYom
 ZBIaeU32cCt+3rArtEfAWyPI52DQWFj3gCrMBdiVzRL3DTlEFhynPv8VTjg+IqGlHXQ0l2BtTsh
 WRqgpYvrikvQKDT2F4YkhdLurlglXpUdHxAMMlEnBkf1ivCXDxFD50nJjo7TzCsDSjs11/KHIbp
 fHuTQ4re8PO1ouFbWez6YHzGE6HfJAuQXhqf5matOHR1TJHn2h64mL6I7WtmeCXDSzWlfsPIs6I
 wa4OQVhnAethllSfoimf59qrJ/o239B/9ZRRkCmvsZb2UMyDiPmdFjQJOaSj4dFtPXTJ6VDZhM+
 6yoBLDdNbYYr4Bd38
X-Google-Smtp-Source: AGHT+IH2Bx56lpKD5XZwwwuXaUE9amtjtXGdogWmMz4v9lpDdZavcEWpRMM5U9IqHfqZOxG9kifMmQ==
X-Received: by 2002:a2e:bd0e:0:b0:30b:e983:9ba0 with SMTP id
 38308e7fff4ca-30ef912d2afmr25767961fa.23.1743676297324; 
 Thu, 03 Apr 2025 03:31:37 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f031ce889sm1577031fa.98.2025.04.03.03.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Apr 2025 03:31:36 -0700 (PDT)
Date: Thu, 3 Apr 2025 12:31:34 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: st7571-i2c: Add Sitronix ST7571 panel
 bindings
Message-ID: <Z-5jhrwTfu4WMk5n@gmail.com>
References: <20250402-st7571-v1-0-351d6b9eeb4a@gmail.com>
 <20250402-st7571-v1-1-351d6b9eeb4a@gmail.com>
 <20250402-rare-slick-carp-dbcab9@krzk-bin>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ferfG92n2ptOGpLx"
Content-Disposition: inline
In-Reply-To: <20250402-rare-slick-carp-dbcab9@krzk-bin>
X-Mailman-Approved-At: Thu, 03 Apr 2025 10:50:04 +0000
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


--ferfG92n2ptOGpLx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Thank you Krzysztof,

I will fix the issues you pointed out, just a few comments below.

On Wed, Apr 02, 2025 at 10:27:53AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Apr 02, 2025 at 08:12:10AM +0200, Marcus Folkesson wrote:
> > Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.
> > The controller has a SPI, I2C and 8bit parallel interface, this is for
> > the I2C interface only.
> >=20
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > ---
> >  .../bindings/display/sitronix,st7571-i2c.yaml      | 71 ++++++++++++++=
++++++++
> >  1 file changed, 71 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/sitronix,st7571-=
i2c.yaml b/Documentation/devicetree/bindings/display/sitronix,st7571-i2c.ya=
ml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..6e5e0994a98db646a37bb17=
c4289332546c9266e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/sitronix,st7571-i2c.yaml
>=20

[...]

>=20
> > +    maxItems: 1
> > +
> > +  sitronix,panel-width-mm:
> > +    description: physical panel width [mm]
> > +
> > +  sitronix,panel-height-mm:
> > +    description: physical panel height [mm]
>=20
> No, use standard properties.

I will use width-mm and height-mm from panels.yaml from
panel-common.yaml instead

>=20
> > +
> > +  sitronix,panel-nlines:
> > +    description: Number of lines in the panel
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 1
> > +    maximum: 128
> > +    default: 128
>=20
> Ditto

I will use vactive in panel-timing instead.

Do I need to specify those properties or should I just list them as
required?

Some bindings set e.g.

reg: true
reset-gpios: true

and others just list them as required.


>=20
> > +
> > +  sitronix,panel-start-line:
> > +    description: Start line of the panel
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 127
> > +    default: 0
>=20
> Ditto

I will use vfront-porch in panel-timing instead.


[...]
>=20
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        display@3f {
>=20
> Look how this is called in other bindings... The binding and example are
> not following existing code. Why? Why doing something entirely
> different?

Sorry, I'm not sure what you mean here.

>=20
> Best regards,
> Krzysztof

Best regards,
Marcus Folkesson

--ferfG92n2ptOGpLx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmfuY4EACgkQiIBOb1ld
UjI7Gw/9F4LvS32qIkIpPs75F5yZZNtfUcPbkFPQ7lF5z+fABUdvoneq2xFkw30S
ItTED5BG4DUpXkuKqapvWLq5tvdHk0t6wcjDJGoz+qla7RScgC0lf24p/l4q0RIn
PS1c9+p3SGmsORM88jrj/fZCBKom2HZMrG/SKbnL3c5zG37Hy9dXcV2x+ha+k56F
Qtw9xFxPjS3xaDFQr4hzZ9mo/ppVPOKUkjZh8fAzaeuexyMT5iI6U3FrAp/VK6OZ
iec6nE/whl7yqDqf1h+xVuJbaxW54+qTk2XweuGn2wk4l3VLi7skW6c3M5fiDj/Z
d4bDYdBqFTMA+/9RiAEONDDMEq/LPzmF3FSACsaIxz9NbJeDtu+Nc0UA5KaVog9X
Sq9CA4BTmoXL2tMF5leO3FA88Ujlp2kopATjE4GQy1+r5/pFQDIITJMfjnLaPnMD
Zi2HyKUfbnvEZbRO814BFaISfJD40hBKR2ik5wf0ZgDzqM6hMCCWBneg6qtMNk+H
jybbsUVsB+8GJWoMFRaFoHv15ydpcx10qk5YyxBdlFS4F1HVDlZr3uS4/u2QvWe+
kgzOgYlVTvNTS68U7HYBRJBJ6xGxDyOdETaKVxXQM8xydwDcGCZthh41AINhCWj0
h243gcMmfCNbJpgVPIR1gb36CgpYRoY57wLW2f2AwFqo2o/udD4=
=VjMV
-----END PGP SIGNATURE-----

--ferfG92n2ptOGpLx--
