Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA8412C228
	for <lists+dri-devel@lfdr.de>; Sun, 29 Dec 2019 10:57:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A50489CBE;
	Sun, 29 Dec 2019 09:57:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C5C89CBE
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Dec 2019 09:57:49 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id y6so22690510lji.0
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Dec 2019 01:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=Y/CRe1+1FoawPcg/k3hPhYCMtB6RO3X1+R8QWKSvebg=;
 b=E0APxjtgP0ERWEO+WyY8bYbFcNMVSz2OGhr64KdJs18uEfXNGX2ElI7PR4vKRZw6od
 +jlYH87KsWR6M4dOncbUxQqFHdDzMaiclqYTVw1AC3XUaRRju2OKCXs3C8U+/bPE/Hdh
 LSN1Gd7nN+7Gy3CtaUY9GiaxZ//1ldeZndjq/V3kZBtmENMUiGHMVnrC6Vp356pNbFUG
 Uy5klSFn3Cd49/tpjUemQav2Rn8aOeRElel1nYoX+uJL01vcjnxtK9M3LrzMVTS8ed0N
 Z6mYwSgY2yLJPQWVKzSwQW7w/dBs4PZs4mLNBo9s8XXDcpV9kWR1xJ85IBCH2IcSG2n7
 EQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Y/CRe1+1FoawPcg/k3hPhYCMtB6RO3X1+R8QWKSvebg=;
 b=bYWTNaj0PpNHxTOaEEj0D+JJHzxYA9Oz1BVApWtVDLqTZ0O5OW0wt3TzuIZrmG7i+n
 JRLT7Fp6Mq0XMDv1GxVMPxCKg2URC3NN0tjFNgQdR9vFmlIyHXJufoUcP6VKSdkZYMh7
 4gKInunYlia1BOp1JYLlCjlOo7HULKVnPtyU2vzgAYzWvHInKBz+b/5kk2YcE6s3aZ12
 3rQxyOy/78j/bvK5rEOLalytaJwmP947J2+taWajlmERYPz5G+L4w4dpptCs4cTclQ89
 e/NZJ7/YV0em+n+cs+quSEvYdDRfUJrAox2kWxmchUHiztPFlJlHTv7GarUrcF25MvKf
 RYHQ==
X-Gm-Message-State: APjAAAX06w3AFowHzCEycJvrzCGnQ+Crh8e3HOdg4r3knQHlbAkORWtz
 hjSeOY/DsVEg2sh9t+CZ3Oc=
X-Google-Smtp-Source: APXvYqyxzo7TKlCT18F1/pR4/NSYCwbPPZqzRenVUDl9pnGy0awZHbttIcy1twiqmf7+NdcO9Wuabw==
X-Received: by 2002:a2e:8942:: with SMTP id b2mr29380509ljk.162.1577613467870; 
 Sun, 29 Dec 2019 01:57:47 -0800 (PST)
Received: from ferris.localdomain (85-156-247-180.elisa-laajakaista.fi.
 [85.156.247.180])
 by smtp.gmail.com with ESMTPSA id t27sm16059836ljd.26.2019.12.29.01.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2019 01:57:47 -0800 (PST)
Date: Sun, 29 Dec 2019 11:57:37 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: TAEHO NAM <kl0ud3v@gmail.com>
Subject: Re: Why eglGetDisplay(EGL_DEFAULT_DISPLAY) returns EGL_NO_DISPLAY?
Message-ID: <20191229115737.0db7fd7c@ferris.localdomain>
In-Reply-To: <CACcQa5=1vdWTUGfmN+oEY5rARTX5p6SvDbzQt+bzYHmZ=2hBgg@mail.gmail.com>
References: <CACcQa5=1vdWTUGfmN+oEY5rARTX5p6SvDbzQt+bzYHmZ=2hBgg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0821480739=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0821480739==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/t7fXbRYc.J6S_f5s9LQj9at"; protocol="application/pgp-signature"

--Sig_/t7fXbRYc.J6S_f5s9LQj9at
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 21 Dec 2019 02:05:59 +0900
TAEHO NAM <kl0ud3v@gmail.com> wrote:

> Hi, I'm new to dri-devel and sorry if this question doesn't fit here.
> In my code, the case 1 of getting eglDisplay using EGL_DEFAULT_DISPLAY
> failed, but, the case 2 succeeded.
>=20
> // Case 1
> egl_.display =3D eglGetDisplay (EGL_DEFAULT_DISPLAY);
>=20
> // Case 2
> struct gbm_device * gbm_device_;
> gbm_device_ =3D gbm_create_device (drm _-> GetFD ());
> egl_.display =3D eglGetDisplay ((EGLNativeDisplayType) gbm_device_);
>=20
> I don't know if EGL_DEFAULT_DISPLAY is missing or it's a problem with my
> machine.
> The output of lspci is :
>=20
> VGA compatible controller: Intel Corporation Device 5906 (rev 02)
>=20
> Thank you for any comments or links to related documents.

Hi,

please use the API that comes with
https://www.khronos.org/registry/EGL/extensions/EXT/EGL_EXT_platform_base.t=
xt
and the related platform extensions for each particular platform.
I'm not sure if your issue comes from this, but without these the
EGL implementation cannot now what platform EGL_DEFAULT_DISPLAY
should refer to. It might as well be attempting to connect to an
X11 server instead of realizing you actually wanted to use GBM and
not X11.

See also
https://www.khronos.org/registry/EGL/extensions/MESA/EGL_MESA_platform_gbm.=
txt


Thanks,
pq

--Sig_/t7fXbRYc.J6S_f5s9LQj9at
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl4IeJEACgkQI1/ltBGq
qqfLZg/9Hv5UW77h3gcMXLwY7lHXT3SCNz5Yz0/pYhvWmbZVpAdtHZ8b5hYzjH6x
tiVD5qL+EqZlkIMEFKbTVvvQYfukGE7mNmF0SQQLxrUJxtMOBvZcl34CLVijrnVZ
kuIu3Ww7BKK2hNuEnz05uW3BP4Tae3W77bWMKZghZ5nVEbDyJzxGXgj2f23yiX+b
yB4GFGb7u1fwE/UII11/pFkJsVu8XS63w4jAatONGTyuKI2HkTZpwOCocGeSgdK5
Ry6ho6Let00JEVzc5lDriCzFExn4nx5QbwNXnwd4cNIJHVPFM1xPVFFCFOD+MtYK
d1gEDs2gENgLMCf77nggzhsJ99KHIlIiG+J8N6O+NJ9zED4oJ0UruhN40DCR32b/
xlaUbqH/0DNMb/VpmWUGPU4poG7TwObTVHROHWE9c6GTidUqK94xyBcAXUU8KATx
RlC6UOIwAUfYJ+vJmbmE32dygVgHouMoD7RFk5rLSu5GGsn5UFTwDowzDMENBJsu
TA5eGgYV3OfNDKdrKJwqbNv7QGSq7wg0DkM6Ysyb241K4JbdJTMytnWPZCFSibeJ
VA82mu4yp8o7bbk5J0pAtd/HRIjxH3EvVvzfeEPqTsDGZisf4Y8mBB9EbGeAILG2
Ml9602Ox0Z0l7ZdK5AxNfy3mmRPLtmYNs4y94dRe/t4GLZ80UhM=
=+P/D
-----END PGP SIGNATURE-----

--Sig_/t7fXbRYc.J6S_f5s9LQj9at--

--===============0821480739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0821480739==--
