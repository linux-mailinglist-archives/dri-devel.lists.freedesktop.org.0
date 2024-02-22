Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F87585FF34
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 18:23:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAFA310E99A;
	Thu, 22 Feb 2024 17:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ucw.cz header.i=@ucw.cz header.b="ezEI1lab";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BEC510E967
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 17:23:29 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 013ED1C0080; Thu, 22 Feb 2024 18:23:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1708622607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2YjIr5aUgTsjvLi9xKmkXNDQcBTORFOndacLAudYXZw=;
 b=ezEI1labo1josuTpKvSGarOXtuMPuKQbWe9fuLiN+78ANCflfREpDesPvqpd0WhQeMiDGq
 gpAH0ncJG9L8QPdHbrX8ZG4ZI19nY1nxkQgAx1w6ICGbWBtKEr8/x5leIGYnCAxSWAUYnT
 S0DLIRatlkRt4yd4T3ag6Mt+d9LDUso=
Date: Thu, 22 Feb 2024 18:23:27 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>, Lee Jones <lee@kernel.org>,
 jikos@kernel.org, linux-kernel@vger.kernel.org,
 Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org
Subject: Re: Future handling of complex RGB devices on Linux v2
Message-ID: <ZdeDD9u965bM+CCc@duo.ucw.cz>
References: <730bead8-6e1d-4d21-90d2-4ee73155887a@tuxedocomputers.com>
 <952409e1-2f0e-4d7a-a7a9-3b78f2eafec7@redhat.com>
 <9851a06d-956e-4b57-be63-e10ff1fce8b4@tuxedocomputers.com>
 <1bc6d6f0-a13d-4148-80cb-9c13dec7ed32@redhat.com>
 <b70b2ea8-abfd-4d41-b336-3e34e5bdb8c6@tuxedocomputers.com>
 <477d30ee-247e-47e6-bc74-515fd87fdc13@redhat.com>
 <e21a7d87-3059-4a51-af04-1062dac977d2@tuxedocomputers.com>
 <247b5dcd-fda8-45a7-9896-eabc46568281@tuxedocomputers.com>
 <ZdZ2kMASawJ9wdZj@duo.ucw.cz>
 <b6d79727-ae94-44b1-aa88-069416435c14@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="8HNHTJiCVl5tEqHo"
Content-Disposition: inline
In-Reply-To: <b6d79727-ae94-44b1-aa88-069416435c14@redhat.com>
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


--8HNHTJiCVl5tEqHo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Yeah, so ... this is not a interface. This is a backdoor to pass
> > arbitrary data. That's not going to fly.
>=20
> Pavel, Note the data will be interpreted by a kernel driver and
> not passed directly to the hw.

Yes, still not flying :-).

> With that said I tend to agree that this seems to be a bit too
> generic.

Exactly.

> Given that these devices are all different in various ways
> and that we only want this for devices which cannot be accessed
> from userspace directly (so a limit set of devices) I really
> think that just doing custom ioctls per vendor is best.

I don't think that's good idea in the long term. Kernel should provide
hardware abstraction, so that userspace does not need to know about
hardware. Obviously there are exceptions, but this should not be one
of those.

BR,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--8HNHTJiCVl5tEqHo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZdeDDwAKCRAw5/Bqldv6
8qiyAJwLN/fdcmrJOkkG2EAbYAv8zFZEFgCfZXqQdlbGlNFyskYJxo9aqek7NBI=
=F8Cz
-----END PGP SIGNATURE-----

--8HNHTJiCVl5tEqHo--
