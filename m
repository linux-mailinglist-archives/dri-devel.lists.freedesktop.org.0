Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A528C8969
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 17:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D31B10EF06;
	Fri, 17 May 2024 15:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=scrumplex.net header.i=@scrumplex.net header.b="vhx+EpTm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC60F10EF06
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 15:36:50 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Vgrfh3sndz9sSw
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 17:36:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scrumplex.net;
 s=MBO0001; t=1715960204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XnEpUwgN9gTQC4RjVqlloU+nVyXM3j4qYohfEvKDmgI=;
 b=vhx+EpTmMgZy1QqWnz6l4QY8Ku4orJq7XTpLW3xOVUKfksEdE0DYsxJ+DgvA4Mz7dIOt+C
 Vf6OEA1ErBkgBKNuqOIteBd+2pHKtj3DgMdlidQXXclny7x1HRqEsF4ri/gXgbiQI6qa6F
 sQZ9JRjL097OVCEK5I/YG2w8XVwBmvp+az1Zyfic5utZpfWaLR3P8DeuVBlp/Y8k0T2Xoh
 42Dbkr9mvj7iSMOnk/PBoTb8rEagggas7LP+Bj5EqAcnvd9dKf/72mJu+uCf5jo5zUGOVL
 3eMfUoJ7OPymGn1jhssmeO9QM9sq8a0NzwOfB6f39NJ/7CjwUWwNF1ddc0EwTg==
Message-ID: <0d800997f7dab23514160ed6a61e8778b7bee57e.camel@scrumplex.net>
Subject: Re: [PATCH] drm/edid: add non-desktop quirk to Bigscreen Beyond HMD
From: Sefa Eyeoglu <contact@scrumplex.net>
To: dri-devel@lists.freedesktop.org
Date: Fri, 17 May 2024 17:36:43 +0200
In-Reply-To: <2d9d1985284b0255e7366ded97124b3590261a6e.camel@pengutronix.de>
References: <20240517105555.654262-1-contact@scrumplex.net>
 <20240517141049.896023-3-contact@scrumplex.net>
 <2d9d1985284b0255e7366ded97124b3590261a6e.camel@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-TJ3JXSnr8Ka+RD3dNr1R"
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4Vgrfh3sndz9sSw
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


--=-TJ3JXSnr8Ka+RD3dNr1R
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2024-05-17 at 16:52 +0200, Philipp Zabel wrote:
> On Fr, 2024-05-17 at 16:09 +0200, Sefa Eyeoglu wrote:
> > The Bigscreen Beyond VR headset is a non-desktop output and should
> > be
> > marked as such using an EDID quirk.
> >=20
> > Closes https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/39
>=20
> From the EDID posted there, it looks like the quirk should not be
> necessary?
>=20
> The quoted DisplayID extension block correctly marks this as an HMD:
>=20
> =C2=A0 "Display Product Primary Use Case: Head-mounted Virtual Reality
> (VR) display"
>=20
> The update_displayid_info() function in drm_edid.c should use this
> information to set the non_desktop flag already. Doesn't this work as
> expected?
>=20
>=20
> regards
> Philipp

I see.

The only potential reason I can come up with is that the DisplayID
block is incomplete.

$ edid-decode --check
Failures:

Block 0, Base EDID:
  Standard Timings: Missing preferred timing.
EDID:
  DisplayID: Missing DisplayID Product Identification Data Block.
  DisplayID: Missing DisplayID Display Parameters Data Block.
  DisplayID: Missing DisplayID Display Interface Features Data Block.

EDID conformity: FAIL

--=-TJ3JXSnr8Ka+RD3dNr1R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQThcyN6x4IpbZj1razhPf1LRxJ5UQUCZkd5iwAKCRDhPf1LRxJ5
UZn1AP9uUIdF0jwCtCtpNsUcw0UYT1QuOfjrQITanlNqMyLQiwEAxk22Xr2v6B4f
5I99QINYRbbZuheCf4CI+f9abejkiAM=
=Are7
-----END PGP SIGNATURE-----

--=-TJ3JXSnr8Ka+RD3dNr1R--
