Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3E1A81D47
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 08:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532B510E313;
	Wed,  9 Apr 2025 06:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Lmv0kjZr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD3E10E7F9
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 06:41:52 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-54b10956398so508426e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 23:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744180911; x=1744785711; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YuicuWNl+78SMq+BOx5Lp7ZhEP+45+5kk+zhckCm74k=;
 b=Lmv0kjZrfnNLQt8+GuNrh7pSJwbIa4n8HaLHD1Nr/SZvJRXqTCupj+I12io2MsUxFj
 Z8lqo4EOCQPcSCmYrucEXF2NaOPo9R4MO6CAPzB7vl2f/koex9A9Xz8l8bHsuYjVk7RF
 D3SAW+QTmYQauuMNH8YWVW7dY3bgCy4oBgxhmjmaHCVLGS4Jg9z1N9hYDL4VxcAqgynt
 dyepADw5IxgD9iBHVSAqXoNxnXcY9l3OzW0SUNZrtOzO/ONYrE+X30/U+PagtQXj5lwF
 iIWLZNheNj0IltQEn4YgQonWo8i7MB6ECY1XhSnCeNGzbsoi1ZNGeaQgkuvPnKyB7LzA
 fsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744180911; x=1744785711;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YuicuWNl+78SMq+BOx5Lp7ZhEP+45+5kk+zhckCm74k=;
 b=kXidFfKBrDT69pNUWClAh3JehQY64YTzz54dAWppQLyTOXuopb+qQYa4TAHNh7lnDz
 tpHIKoWD0pVyWD6vQjtSdKbixGzh4hPLQ3k4QT8TXMbKjXnrisKhq2RO0qYV9T9OdqXV
 QRLA7Wl1shhoZk32HLIjgLt2Eopa8Bow1RqPhAfuND3mE+y+6opPjAlB6toK0NqI2QXD
 ZDNmaStPe3q5O5dg69zh2wfU+35qWCrkUL6Ju9W3pKbslLrdLsZaL7kfOQxWuxFacSLj
 sv5u9G/n6AeGdSrBUK94VOvV480SSnSgXvL4wVpNTyfgObC3IlqqPMNSPn2DMhh1xdVX
 Srtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVtN+5NzjPaXs0147VYq+DO7xOChai8uqm2kxjrN/bYg40ORMaykc76RUm59uJMXvMI+YKzgNJLhY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyD4W4hfx6aLY90IvQ/Med6/lHPDf2aWYvzC0BJLSN0g4b9wGDf
 6uZFfZBONorhXFsNf4EZTVS9aVWI2Qvsksm0ijksUKLLKlgCEm9w
X-Gm-Gg: ASbGncungc9weLm4L3avMwYOcUvagiLmT4+hIbutTc0BnAB40Dt7Tup5PLoZ8KMYsq6
 xiLq0wcxEvAYQA37LCCVhW4Yg/0q8W6qJgdaIRRXGEW62W4tjZXKYrSe690RtzzP8wSx+TX2d3y
 7WFTJMoso/+l9VcVY1ySH9ZvROT+b3W7FIk1nFPeSwkMmaIN4GtxGO9OPLVAXUPlxe2W6IiEeMP
 Ezopb6MhCsXleVNiriVB2i1TSbL2MkdwtuLAmzjOK/7Q2CFK7ls5kFSdVzCZNotnVMrZh0+JVCr
 uO9bLsTNDyc3VllB6hzfSi56oR8RrmAe16UlUpuiBS+rCMS/WwfjIbG7OQ2waN8ICl2yy/6YRI5
 fcw==
X-Google-Smtp-Source: AGHT+IFdnlxer68Yln0fuFLV1bJP2lPBgYXnZwBE2tazPW/qAEw5qRAr1HSLKKeZe59pVJ/g7Y58kw==
X-Received: by 2002:ac2:5f7b:0:b0:549:9643:68d0 with SMTP id
 2adb3069b0e04-54c3bbbd60amr1572364e87.17.1744180910558; 
 Tue, 08 Apr 2025 23:41:50 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c4566dc80sm53867e87.192.2025.04.08.23.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 23:41:49 -0700 (PDT)
Date: Wed, 9 Apr 2025 08:41:47 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmrmann@suse.de>
Subject: Re: [PATCH v3 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
Message-ID: <Z_YWq4ry6Y-Jgvjq@gmail.com>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
 <20250408-st7571-v3-2-200693efec57@gmail.com>
 <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>
 <Z_Uin2dvmbantQU4@gmail.com>
 <87ecy1g8z8.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ylj4ERT0Ocye4RUt"
Content-Disposition: inline
In-Reply-To: <87ecy1g8z8.fsf@minerva.mail-host-address-is-not-set>
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


--Ylj4ERT0Ocye4RUt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Javier,

On Wed, Apr 09, 2025 at 08:11:23AM +0200, Javier Martinez Canillas wrote:

[...]
> >> > +static int st7571_set_pixel_format(struct st7571_device *st7571,
> >> > +				   u32 pixel_format)
> >> > +{
> >> > +	switch (pixel_format) {
> >> > +	case DRM_FORMAT_C1:
> >> > +		return st7571_set_color_mode(st7571, ST7571_COLOR_MODE_BLACKWHITE=
);
> >> > +	case DRM_FORMAT_C2:
> >> > +		return st7571_set_color_mode(st7571, ST7571_COLOR_MODE_GRAY);
> >> > +	default:
> >> > +		return -EINVAL;
> >> > +	}
> >>=20
> >> These should be DRM_FORMAT_R1 and DRM_FORMAT_R2 and not C{1,2}. The fo=
rmer
> >> is for displays have a single color (i.e: grey) while the latter is wh=
en a
> >> pixel can have different color, whose values are defined by a CLUT tab=
le.
> >>=20
> >
> > I see.
> > Does fbdev only works with CLUT formats? I get this error when I switch
> > to DRM_FORMAT_R{1,2}:
> >
> > [drm] Initialized st7571 1.0.0 for 0-003f on minor 0
> > st7571 0-003f: [drm] format C1   little-endian (0x20203143) not support=
ed
> > st7571 0-003f: [drm] No compatible format found
> > st7571 0-003f: [drm] *ERROR* fbdev: Failed to setup emulation (ret=3D-2=
2)
> >
> >
>=20
> That's a god question, I don't really know...
>=20
> But fbdev does support XRGB8888, which may be another good reason to add
> it and make it the default format. Yes, it will cause an unnecessary pixel
> format conversion but the I2C transport is so slow anyways that compute is
> not the bottleneck when using these small displays.

Hrm, I now realised that I have another issue.
Not all LCDs that will be attached to the ST7571 controller will be
grayscale.
The display I've attached to the ST7571 is a monochrome LCD for example.

Maybe the right way to do it is to only support XRGB8888 and specify=20
if the display is monochrome or grayscale in the device tree.

Or do you have any good suggestions?

[...]
>=20
> --=20
> Best regards,
>=20
> Javier Martinez Canillas
> Core Platforms
> Red Hat
>=20

Best regards,
Marcus Folkesson

--Ylj4ERT0Ocye4RUt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmf2FqcACgkQiIBOb1ld
UjJlFA/+Mvgnw0GHgT/CbvHMZfsKrzVui9dIXTaP9ruHztPyzxKfhzb/VOxWIqm2
Grdh3t1Q2HqElAM/cpET2LpPRej5WHklHoah93ATdVsE29LDwkULtRSqAND7laJc
FGjvEM23bcXSeToZ7kvJZHYziu3ABhJKtGmGOKGfUFOPg7LOvdpkBWxj2dzni/mq
02OVArtj0gmMvdyQDXBLrAVN0OvbWCc0IIDlVfQ6EiZeag/Kefqt57kL02y2ffVo
OR7DHz2QrkPJLzK61dfVwA3uMC+RP6S5a+nGcB+Qw5z0KMkiO7S8hOIOxoyW+eF2
FFrPjv1fnPZPjjfulVcKJHAk84hqOiyTnll9YDUMefB0BrwYCtTc56CKa+abATuH
trbrdtDY6BnKSNN/fzwkHeKtRwWoISvJ1s+WcO5bf2nsA751uuxpVXV/xy+ZrMZ/
IIraaNw+mHPpCeUZW+bjf9sSiGvGKjBiWFQGCCUiEzbbhnd4CQcLl0N61umLWjZT
3IAY67lI0vk5Bms0wJnP1vZwop9c8MX7GVK6gd+5fy5q1AXa/sVAQsz74rwaLyX9
uErGQKENWaTdlVes8hzJUOSIlgamh9M+P/H29qGfaQqCfI6UkdH+qFowo3JV0A/j
OQOe8CHsfLkesxn7/18YT3eiP7PPOR+TuapvXPoSCBLQjzmBajs=
=oJhl
-----END PGP SIGNATURE-----

--Ylj4ERT0Ocye4RUt--
