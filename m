Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A8F8AAE59
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 14:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE3110E6A5;
	Fri, 19 Apr 2024 12:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uN8HnLRQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 553C310E4AD;
 Fri, 19 Apr 2024 12:22:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4501C61921;
 Fri, 19 Apr 2024 12:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968C4C072AA;
 Fri, 19 Apr 2024 12:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713529350;
 bh=nN9WqZi+/d2iueQTfqFj7UWLjZ9uRGd+g4KoRu2C5Fc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uN8HnLRQ0ifSAySfbKBO9zz5XJxGe4ccYraOzHxmX9WMG8a2Ll/9XHNXaJVe4APt7
 alx7HrNYYnQzP9fouA2b/oOZHsViCIolj9pzSA2f8Nmfc/0LEObOZ71Z4oS7AD9xVn
 xYWMq9y7vJVVzGc2X9tAllV7vznJEtutDwMWf+cNjXlNaI0nH16avOxYMxdUP2rnBV
 5Jd6PF3uJnMfqboacuBwQBMYH4q7YcIAoffacGMsIwkRSMStpxkuXofS70cTVDXPit
 ADys2rAyNczPJR5QQdDG38Ii9frdchhwGEusy6rxcResTFIUibuUQCEAshvhxUQQgU
 M56XHQu8fwNWA==
Date: Wed, 17 Apr 2024 16:03:55 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, 
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 intel-xe@lists.freedesktop.org,
 Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 1/4] drm: add devm release action
Message-ID: <20240417-neat-ostrich-of-performance-6618cf@penduick>
References: <20240417084145.242480-1-aravind.iddamsetty@linux.intel.com>
 <20240417084145.242480-2-aravind.iddamsetty@linux.intel.com>
 <Zh_U6zwzyS2Zlf0K@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="4ck74qnbwrq4iqyl"
Content-Disposition: inline
In-Reply-To: <Zh_U6zwzyS2Zlf0K@intel.com>
X-TUID: wHaAZGEEeOuy
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


--4ck74qnbwrq4iqyl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2024 at 09:55:55AM -0400, Rodrigo Vivi wrote:
> On Wed, Apr 17, 2024 at 02:11:42PM +0530, Aravind Iddamsetty wrote:
> > In scenarios where drm_dev_put is directly called by driver we want to
> > release devm_drm_dev_init_release action associated with struct
> > drm_device.
> >=20
> > v2: Directly expose the original function, instead of introducing a
> > helper (Rodrigo)
> >=20
> > Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >=20
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>=20
> Sima, Dave, or drm-misc, ack to get this through drm-xe-next?

On principle, I'm fine with some later iteration of that patch going
through drm/xe, but the documentation needs to be improved in its
current state.

Maxime

--4ck74qnbwrq4iqyl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZh/WywAKCRAnX84Zoj2+
dj+kAX9yPuQo9AoLMyVjRLuO14ER5xhxJAT5S7ZO5AyvnQcG4NPY1qdrhrpDB6xe
3JZ2uY4BgPJHME0TTgOxaIvFWAqX8D9NL08FrFAvsEN/zrOT7sHL2dczRxNC/bsl
3xu5FaqxQQ==
=AJwp
-----END PGP SIGNATURE-----

--4ck74qnbwrq4iqyl--
