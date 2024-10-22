Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7A39AB68F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 21:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8AD10E186;
	Tue, 22 Oct 2024 19:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ucw.cz header.i=@ucw.cz header.b="XrtlY3vA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9AD10E186
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 19:15:09 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 2E0C51C00A3; Tue, 22 Oct 2024 21:15:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1729624508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CSRAwYmK7fXBE3MDYN9n7SN2HDXCRGyc+2wEC32lJkE=;
 b=XrtlY3vAfOT1BqsnBU+LLjz62pQAgedi4kIaZVAj/Uqw4pK1WUY73KpFF+3paol+MYNBdd
 ihrGXzzEU12uHUV4mVZ5SfkMwQZZZbdWQgfh9m8QwW7dK0z+oTjdTdeovz8qpllzn7yzWD
 SzvIRgqsNrodUtxa2hK/hrBw+1d1+0U=
Date: Tue, 22 Oct 2024 21:15:07 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Werner Sembach <wse@tuxedocomputers.com>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org,
 onitake@gmail.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
Message-ID: <Zxf5u9jgmt9vpz2u@duo.ucw.cz>
References: <5crqia4gecxg62n2m2lf6haiifue4wlxrr3g35dyoaa3svjyuj@cd5bhouz5rlh>
 <4a761cd0-611a-4245-8353-5c66ba133715@tuxedocomputers.com>
 <rszv4p34oivysoyi337dxwooebipiikzd3pyq7rof5r3agbzce@xejutpd4jcfv>
 <06c58141-4aa9-4b54-8ae4-e27069561ac9@tuxedocomputers.com>
 <48a8d62f-ea3f-4f17-b917-ff3aaa83e89c@gmx.de>
 <ZwlDpCPhieF3tezX@duo.ucw.cz>
 <a796f0e7-47a8-40fa-a64e-9dd56117bf78@gmx.de>
 <c52019d7-01b4-4585-a2d1-b44b0a773fc9@redhat.com>
 <Zxd0ou7GpCRu0K5a@duo.ucw.cz>
 <35a98b67-d1eb-4aa9-9d3f-025c94cd6b0f@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="eG5jjja+GiFRKCEw"
Content-Disposition: inline
In-Reply-To: <35a98b67-d1eb-4aa9-9d3f-025c94cd6b0f@gmx.de>
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


--eG5jjja+GiFRKCEw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > > - interface for setting multiple LEDs at once
> > > > - interface for setting a range of LEDs at once
> > How are LEDs ordered? I don't believe range makes much sense.
>=20
> Range would allow for efficiently changing the color of all LEDs. But i a=
gree
> that this can be considered optional and can be added later.

Yep, setting all of them makes sense. We should probably provide
backward-compatible interface for keyboards with single backlight, so
this would likely be LED class.

> > > Personally I really like the idea to just emulate a HID LampArray dev=
ice
> > > for this instead or rolling our own API.  I believe there need to be
> > > strong arguments to go with some alternative NIH API and I have not
> > > heard such arguments yet.
> > If you don't want "some alternative API", we already have perfectly
> > working API for 2D arrays of LEDs. I believe I mentioned it before
> > :-). Senzrohssre.
>=20
> We may have to support 3D arrays of LEDs, so using a simple framebuffer
> would likely cause trouble.

Do you have pointer for device that is 3D?

OpenRGB manages to map keyboard into plane... so what I'd propose is
this:

Framebuffer
Information for each pixel:
	    present ? (displays with missing pixels are pretty common)
	    list of keys related to this pixel
	    width, height, length (if we know them)

Pixels map to keys M:N.

Yes, we'll have some number of non-present pixels, but again, I
believe that's not uncommon due to round screens, etc.

(But I'm fine with other interfaces, as long as they are "normal")=20

Best regards,
								Pavel

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--eG5jjja+GiFRKCEw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZxf5uwAKCRAw5/Bqldv6
8q0mAJ91eWOz0MgRjTqc4HtPnsjYg+FiygCfR3ZbO7aiuqKWYt4u+YrYz6VHOSY=
=iFlQ
-----END PGP SIGNATURE-----

--eG5jjja+GiFRKCEw--
