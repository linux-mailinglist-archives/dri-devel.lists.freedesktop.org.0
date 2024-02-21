Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E9285EBBA
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 23:18:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 065CD10E73C;
	Wed, 21 Feb 2024 22:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ucw.cz header.i=@ucw.cz header.b="ThTmacQ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB3510E73C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 22:17:55 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 61A0B1C0080; Wed, 21 Feb 2024 23:17:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1708553873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mCiY21dwg8agnszDbeKtSlu1VbMK1uasVv6xavoY4HU=;
 b=ThTmacQ+LWEH3D5zQEmviRVVyITf1+8WrPGagCpRAlALpWivU2AKw0VFzaiHD/prKLPI6R
 9c2rrfxclMBi2FEdL2/lVosQ0LahH3rRLLYVQXyoF3V9k/k1Pr+oumE0upFXwC+jLnvLft
 ApT6fry3D1huFvoZ5xIqLJjrA6Hv2us=
Date: Wed, 21 Feb 2024 23:17:52 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Lee Jones <lee@kernel.org>,
 jikos@kernel.org, linux-kernel@vger.kernel.org,
 Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org
Subject: Re: Future handling of complex RGB devices on Linux v2
Message-ID: <ZdZ2kMASawJ9wdZj@duo.ucw.cz>
References: <0cdb78b1-7763-4bb6-9582-d70577781e61@tuxedocomputers.com>
 <7228f2c6-fbdd-4e19-b703-103b8535d77d@redhat.com>
 <730bead8-6e1d-4d21-90d2-4ee73155887a@tuxedocomputers.com>
 <952409e1-2f0e-4d7a-a7a9-3b78f2eafec7@redhat.com>
 <9851a06d-956e-4b57-be63-e10ff1fce8b4@tuxedocomputers.com>
 <1bc6d6f0-a13d-4148-80cb-9c13dec7ed32@redhat.com>
 <b70b2ea8-abfd-4d41-b336-3e34e5bdb8c6@tuxedocomputers.com>
 <477d30ee-247e-47e6-bc74-515fd87fdc13@redhat.com>
 <e21a7d87-3059-4a51-af04-1062dac977d2@tuxedocomputers.com>
 <247b5dcd-fda8-45a7-9896-eabc46568281@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="dAbXhNBZxMUy0vp0"
Content-Disposition: inline
In-Reply-To: <247b5dcd-fda8-45a7-9896-eabc46568281@tuxedocomputers.com>
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


--dAbXhNBZxMUy0vp0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> so after more feedback from the OpenRGB maintainers I came up with an even
> more generic proposal:
> https://gitlab.com/CalcProgrammer1/OpenRGB/-/issues/3916#note_1753072869

> >evaluate-set-command ioctl taking:
> >{
> >=A0=A0=A0 enum command=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 /* one of =
supported_commands */
> >=A0=A0=A0 union data
> >=A0=A0=A0 {
> >=A0=A0=A0 =A0=A0=A0 char raw[3072],
> >=A0=A0=A0 =A0=A0=A0 {
> >=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 <input struct for command 0>
> >=A0=A0=A0 =A0=A0=A0 },

Yeah, so ... this is not a interface. This is a backdoor to pass
arbitrary data. That's not going to fly.

For keyboards, we don't need complete new interface; we reasonable
extensions over existing display APIs -- keyboards are clearly 2D.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--dAbXhNBZxMUy0vp0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZdZ2kAAKCRAw5/Bqldv6
8h9zAKDEJUHJV0ZbVJCjUCqpMQaA0+xLowCfV5MWLs4adC4rSVD6cfTu5HRFilE=
=PKVx
-----END PGP SIGNATURE-----

--dAbXhNBZxMUy0vp0--
