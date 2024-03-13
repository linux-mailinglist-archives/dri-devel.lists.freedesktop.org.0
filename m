Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9273487A30B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 07:49:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A9D10F68B;
	Wed, 13 Mar 2024 06:49:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D120E10F68B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 06:49:07 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rkIQ5-0003qH-Ik; Wed, 13 Mar 2024 07:48:57 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rkIQ3-006404-W6; Wed, 13 Mar 2024 07:48:56 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rkIQ3-005E6s-2f;
 Wed, 13 Mar 2024 07:48:55 +0100
Date: Wed, 13 Mar 2024 07:48:55 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, andy@kernel.org, daniel.thompson@linaro.org, 
 jingoohan1@gmail.com, deller@gmx.de, robin@protonic.nl, javierm@redhat.com, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v4 00/10] backlight: Replace struct fb_info in interfaces
Message-ID: <heasef3pdfyj7xyngnvbg527pc5uyy2v6hatz4wr6q3sfkhw3h@f4lnresjcnmb>
References: <20240305162425.23845-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fazplp4fyrovvxv2"
Content-Disposition: inline
In-Reply-To: <20240305162425.23845-1-tzimmermann@suse.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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


--fazplp4fyrovvxv2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

On Tue, Mar 05, 2024 at 05:22:33PM +0100, Thomas Zimmermann wrote:
> Backlight drivers implement struct backlight_ops.check_fb, which
> uses struct fb_info in its interface. Replace the callback with one
> that does not use fb_info.
>=20
> In DRM, we have several drivers that implement backlight support. By
> including <linux/backlight.h> these drivers depend on <linux/fb.h>.
> At the same time, fbdev is deprecated for new drivers and likely to
> be replaced on many systems.
>=20
> This patchset is part of a larger effort to implement the backlight
> code without depending on fbdev.
>=20
> Patch 1 makes the backlight core match backlight and framebuffer
> devices via struct fb_info.bl_dev. Patches 2 to 9 then go through
> drivers and remove unnecessary implementations of check_fb. Finally,
> patch 10 replaces the check_fb hook with controls_device, which
> uses the framebuffer's Linux device instead of the framebuffer.

I assume the merge plan for this series is via drm-misc in one go?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--fazplp4fyrovvxv2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXxTFYACgkQj4D7WH0S
/k4WCgf+N9+ghi7jxWwK3i7nnF9402Id/hmnbKSiQ/2mzmtMu7hWnXpywzKwVGNy
JuwbngFjANW8HquzInPZ0cOClpGx2dm5i2YsAqyDnOZO2Jg3zT1VOVZkd+/YzOI4
FWBxp3T0ZUTmE1Fh0ohTEL+lL49F7nJXmeZNUMqWec4BwT09Eu71ZRseDMjL4Ar3
bO9k6WkqF7/v+sWljRUWjvcAvRC/El4JMjyLTb9xS/UarDtjSbxePHZB6d9lf6St
Dm0sgkqb/+jaZhY5kM1d0HJaEE1Wdef63pW2tDIunfj5L5PBveSw8xHMiipSCd4e
9krdHDOzOyL/lPFi7CSq7i85LSyypg==
=uhXV
-----END PGP SIGNATURE-----

--fazplp4fyrovvxv2--
