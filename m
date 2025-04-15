Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B96A895C5
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 09:57:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F3310E36E;
	Tue, 15 Apr 2025 07:57:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CN053Mj2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB7110E36E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 07:57:30 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5493b5bc6e8so6075971e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 00:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744703848; x=1745308648; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9gBlWb6559YGHiqiH+9G6nK+InkFDugG59lEaU3YDbk=;
 b=CN053Mj2KabuyrCmuKCVRUu6qA6D1mTjVR2L0rSDDLl/PLT8DNUSmIN2JZQwL388DL
 e3sf1eegMCKL6MAzc8wYVFIohiS0SoocnExSHqt8dhHEZI9vPky8kG3AEpsvuEGXW2RW
 zvBftgGJiEdkuXGbilAkJyZboDBEF0pY8oddlge3vE/J8uGI8CDzVI2/rpjFkdwjfamw
 ZVxOu8A76AKc9HDJnKrymGCMlfBCrULPhhw1ojvP5ygs2q2XNEnF9miSECPwXn7fqcGc
 kd7P5bA4Vcn7aohnuuK0R2m9KP0UwjQeskhSO9ejcdZs9IMB+T/JyRyYDKvDwMqFkjFG
 L27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744703848; x=1745308648;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9gBlWb6559YGHiqiH+9G6nK+InkFDugG59lEaU3YDbk=;
 b=p2gdF3AU71l1ukKUb0NIHOzUqJASFmvk2JP/v43YK7byWoGJmmrW8BzVmi66tJ3YtN
 +XURTl+/v1EvqR9UjcJ3m6rK2c2RX6D7lSWY77K9rhpejDchYk4jk6dsyKgoTSlfHH5y
 oYfyqbgi07S9BwoIDcP0j5ACRWs9fq8tM2rGaUJY1L65fbqZstPoCcAkZnYAMp5Q+ZQm
 N1w8FfhZl/7VZiRI4Gkh5GEdwfR9fsiEmeiSQjoqQY+Djc6P7xLDRBni2G9zeNwJK8Li
 RTz/qXhB0q9J5NRs3xfjJODoRBGe0KlyYHBdHNLUI7+X6kZd+dejtFWAHlLXWzsPM6i5
 MQ3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD0b2x4kbDilcYmvNVOVZuz2HfNGRXRKFG/mJ1jpPNZFJrede7q0FmXPW9sOSLoXiKL0+x3jitsqM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6IowUe+17TQZNJR06v7hD19vgXLhk4I+1sKQStF029vBZxFe+
 FgMfSAbfG19O/dwi+yNXOYopP3MATISCNlG4hvZZLQ+YuCpJrjgT
X-Gm-Gg: ASbGncsl91f1o4NDYHjBRYuFaIJ+4Y/ckIRzRAS8q54Gjzmcuj3C6RKJlAv0gYh6UtN
 XuUgNOiom8xfGCjgLXgcSog+HOQjIH/33kNuLUkOLvymbWiVVrFqPDfowEO54rOVvPMgTFXdlKe
 kdjdbC47VH7M+rAj9WvI9dgc95a2hK2FlMekAykYxCOxSoRiZR23ZymZ/OtRUIVasvAPMceIBLO
 uqLX9V86JQ201LmMo5Udn++n+dnA6w9gHLYHO9S5q+zgn8qC3OkMO8jR7l6U39hPzyX1LG9AjX+
 Pt4n6YnChge5tZNq6NPOtB8mjeVGAwQnnqBYvN99GIzW5swUcZ3JRvDDmUJ32e4WQPKQ0EevN95
 MIw==
X-Google-Smtp-Source: AGHT+IGjjm4pg8koEpOg3Wt7gjyKmE0ps383FEzG1/M+bp1nFX3gl1QVl7IJM7lw6mxGcRX6KRHuLw==
X-Received: by 2002:a05:6512:2397:b0:549:8fd2:f7d5 with SMTP id
 2adb3069b0e04-54d452cc1c8mr3890661e87.38.1744703848106; 
 Tue, 15 Apr 2025 00:57:28 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d12357csm1353654e87.32.2025.04.15.00.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 00:57:27 -0700 (PDT)
Date: Tue, 15 Apr 2025 09:57:25 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: display: Add Sitronix ST7571 LCD
 Controller
Message-ID: <Z_4RZdlV_OV1qLRj@gmail.com>
References: <20250415-st7571-v4-0-8b5c9be8bae7@gmail.com>
 <20250415-st7571-v4-1-8b5c9be8bae7@gmail.com>
 <c82085a7-c725-4a26-82c1-817dac508916@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PYgLrlyTIbn/KEQ5"
Content-Disposition: inline
In-Reply-To: <c82085a7-c725-4a26-82c1-817dac508916@kernel.org>
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


--PYgLrlyTIbn/KEQ5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Tue, Apr 15, 2025 at 09:22:30AM +0200, Krzysztof Kozlowski wrote:
> On 15/04/2025 07:58, Marcus Folkesson wrote:
> > +title: Sitronix ST7571 Display Controller
> > +
> > +maintainers:
> > +  - Marcus Folkesson <marcus.folkesson@gmail.com>
> > +
> > +description:
> > +  Sitronix ST7571 is a driver and controller for 4-level gray
> > +  scale and monochrome dot matrix LCD panels.
> > +
> > +allOf:
> > +  - $ref: panel/panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: sitronix,st7571
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  sitronix,grayscale:
> > +    type: boolean
> > +    description:
> > +      Display supports 4-level grayscale.
>=20
> That's fully deducible from compatible, no? Or does it depend on actual
> panel, but then what else depends on the panel?

No it is not, the ST7571 is only the controller and some properties
depends on the connected LCD.

ST7571 supports both grayscale and monochrome LCDs but has no way to
know what is connected.

Other properties that depends on the LCD are:
panel-timing.hactive
panel-timing.vactive
panel-timing.vfront-porch

In the first revisons of the driver, I thought I could let the
grayscale and monochrome setting depends on which pixel format that
where used, but that was not the case.

>=20
> Best regards,
> Krzysztof


Best regards,
Marcus Folkesson

--PYgLrlyTIbn/KEQ5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmf+EWAACgkQiIBOb1ld
UjLLOw//WG2bV9xFCnP3a9f5fnoJFj0raNigAXMxMp8tsoI6LxlREytKUA3m+OwA
jf1uys1VFfrnklHtOWe/Hy/LLNzXmNws/1lsPR2UHpWbnqPT9LLCjrWhgf/TGUno
pR0Vkm5t50wNi4XqDkTS0MEvWMM1xJc4iE37DH38b91OrkE8g+38cVH3BryuO4WK
zlSznROUSLqpegSWBfvUtHAmqSI6eCoKLJXGPlCz3ZAVRn+kXmFSSfaxNR46BzCn
PxSYe57JQcOWH/Vxue7pAHOPlb058haer4kQvjN1RG+hQgJqUN4HWBwWYiyO4mhb
GFqiqYz9exR4XDD3gLAJjmq3ZoGiaaNTDdkoJN/eTiMrSjMpBQs3aBn0or+3VOo8
W6QJEh9a9jKls4TxrSXJBg4WN6rHq8Rf5BNnllXfwKB84asCywG2hjP0beHKWQJf
MDq8NbiBC137+wxwBYYr6/O8VYptjs27C6628A0f6IoZis/ufdVE3bXUYobubwVW
gzIdqHN2qIeYv062BscRxexCElnm3tvxWhNkWIdxYlr9c3KEwaBXp2Wf5w7YdFCN
eLlsxlxZSoDVySfh5SHTaws6yS77PN6hSwR9ZCAjltFjtZEe2LJUfQCXDozLA9zf
ZHhhDRyEjE2Z6K3hLDAwu9U70nr4O+oxzME69mNbWHj9iM1EUwU=
=BMEH
-----END PGP SIGNATURE-----

--PYgLrlyTIbn/KEQ5--
