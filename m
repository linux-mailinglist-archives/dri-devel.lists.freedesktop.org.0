Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E0F845B8
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E4F6E635;
	Wed,  7 Aug 2019 07:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CCF36E542
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 20:11:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id C51DA28BAE8
Date: Tue, 6 Aug 2019 13:11:29 -0700
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] drm/panfrost: Add "compute shader only" hint
Message-ID: <20190806201129.GA4119@kevin>
References: <20190806195259.3531-1-alyssa.rosenzweig@collabora.com>
 <CAL_Jsq+B1jv-TzQe8oQPLS8+JPH80spe=z_SK8umtpw5AXG3Qw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+B1jv-TzQe8oQPLS8+JPH80spe=z_SK8umtpw5AXG3Qw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 07 Aug 2019 07:26:18 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>
Content-Type: multipart/mixed; boundary="===============0164335056=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0164335056==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> Why don't we just go ahead and enable JS2?

It's not obvious to me when it actually needs to be enabled. Besides the
errata, it's only when... device_nr=1 for a compute-only job in kbase?

I'm afraid I don't know nearly enough about how kbase plumbs CL to grok
the signifiance...

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl1J3usACgkQ/v5QWgr1
WA1Lqw//a3d+XOhBrLjqpnUbM7wMjHwQNPvWuS+oz1B07KLuB/JR6ERydWcmf1II
9AaNjqYVShBBF4rsVd8Ype7yG2BkWvVsEJ7RO68MfdzD84sfWNqfzELeH5zgh2pr
smVYospE4lsLdC/RVPtvFCINb5dOeURmj+1ZuKTTPleGt8qIeGYTWJ1HtnmQiulX
3Jm5TTEJZ9YudjUMHa6k4DnFXOEYYd6ycH0Fs6FfGGmhLiFK7Ram0TI45jEqYnsd
XOQeW6fH+SUgMi17jv0gs64VPQpUJd4CA+5YM6KkS3OvQxGsBRA2kD0dq966p+f2
yKUVCedNzZlwLJ6tRAUWcZO6fXTQwes3jKpE3wpBMJDDXR7GMpP++bAcrd3XaX98
yg9Mnn21dRqip8/hvsIYCUeZGHuiFtmJKR3su76ZTWz+4kLWoOlrbyzbTLNqDxE5
urWy5gBuuxzdfEnKmAo6tfmu6LnxcUFM84XP3ktEM61oAQd1xYrqqkjv3qj2XhR7
Xqp21lRgTTnewuFNTjvgojwm12jW5Bo7N0Cm2vbhUVGg9OiFZktpQmvQWJb6qQjz
xOzGu+sIWtMpvuIxKSSy4KejA4kPMaPg2N1HwVe6XWnW4iMQSL7Hf/S94CZEOmYm
8Sl1SSYCYR22XPA+WgkT4IhspaO4T7FWrMFymS4BVBFBysgUm4Q=
=b9Iv
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--

--===============0164335056==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0164335056==--
