Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4610F802D81
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 09:46:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B2F10E186;
	Mon,  4 Dec 2023 08:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCDC610E186;
 Mon,  4 Dec 2023 08:46:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9BBB8CE0EA4;
 Mon,  4 Dec 2023 08:46:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8874DC433C7;
 Mon,  4 Dec 2023 08:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701679599;
 bh=wc3stVoGTKf+1Pqxh0e2gOA++Lm0xRV4P3wuu3rnVQc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zj6VqLISwSnH7njlkRbdxIUNvHYoq0oX2lRzFYD0Vsx721PVTaCWIdTgP/ntuIRZO
 c9F8NNaCdr2bAoGSKXWLDjgY1nUgiw4i1HaB/M10DGrvx/MRkwx95EHbvN8w/eO3uL
 FZ6KN4F3CqY2J7nMyJTpNI8+Y9GcQVZmx8pK2rhf1kvGQ+j0uvcDTVyXnXTMSpKb7r
 fsLSXsfmHilRuHfYE8XY6+rbVepC/+eN9YD14w9Y0RIrLQFxkJxAv1tlKZAOy83XMr
 3hFUaEQTxnPqpE/eZh5WyZ+7aJ4g5ZPO0u29gfqsg4tiC8Pov4otLhJUHor5+48Wqt
 hyJr07M1PRqgg==
Date: Mon, 4 Dec 2023 09:46:37 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v5 00/32] drm/amd/display: add AMD driver-specific
 properties for color mgmt
Message-ID: <dwdkap7pkulicno5esdk5v5ejujv764ddlhojw76s4in4fnjlk@rjqxkqcjrowq>
References: <20231116195812.906115-1-mwen@igalia.com>
 <bc60a7fd-8de7-4856-b5ed-e1172b9b79f7@amd.com>
 <CAKMK7uH1BPhEm8vM=rFfAho06T-f+osjKX4ofOkjMazrhSouKw@mail.gmail.com>
 <96f1293f-ca82-4cdb-8838-38a31af37feb@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="chjinfct7tkz3bz5"
Content-Disposition: inline
In-Reply-To: <96f1293f-ca82-4cdb-8838-38a31af37feb@amd.com>
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
Cc: liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Hung <alex.hung@amd.com>, kernel-dev@igalia.com, sunpeng.li@amd.com,
 Melissa Wen <mwen@igalia.com>, sungjoon.kim@amd.com,
 Pekka Paalanen <pekka.paalanen@collabora.com>, Xinhui.Pan@amd.com,
 Xaver Hugl <xaver.hugl@gmail.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, tzimmermann@suse.de,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--chjinfct7tkz3bz5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 01, 2023 at 10:20:40AM -0500, Harry Wentland wrote:
>=20
>=20
> On 2023-11-30 06:34, Daniel Vetter wrote:
> > On Tue, 28 Nov 2023 at 23:11, Harry Wentland <harry.wentland@amd.com> w=
rote:
> >>
> >> On 2023-11-16 14:57, Melissa Wen wrote:
> >>> Hello,
> >>>
> >>> This series extends the current KMS color management API with AMD
> >>> driver-specific properties to enhance the color management support on
> >>> AMD Steam Deck. The key additions to the color pipeline include:
> >>>
> >>
> >> snip
> >>
> >>> Melissa Wen (18):
> >>>   drm/drm_mode_object: increase max objects to accommodate new color
> >>>     props
> >>>   drm/drm_property: make replace_property_blob_from_id a DRM helper
> >>>   drm/drm_plane: track color mgmt changes per plane
> >>
> >> If all patches are merged through amd-staging-drm-next I worry that
> >> conflicts creep in if any code around replace_property_blob_from_id
> >> changes in DRM.
> >>
> >> My plan is to merge DRM patches through drm-misc-next, as well
> >> as include them in the amd-staging-drm-next merge. They should then
> >> fall out at the next amd-staging-drm-next pull and (hopefully)
> >> ensure that there is no conflict.
> >>
> >> If no objections I'll go ahead with that later this week.
> >=20
> > Double-merging tends to be the worst because git doesn't realize the
> > commits match, which actually makes the conflicts worse when they
> > happen (because the 3-way merge diff gets absolute confused by all the
> > changed context and misplaces everything to the max). So please don't,
> > _only_ every cherry-pick when a patch in -next is also needed in
> > -fixes, and we didn't put it into the right tree. But even that is a
> > bit tricky and should only be done by maintainers (using dim
> > cherry-pick if it's drm-misc) because the conflicts tend to be bad and
> > need to be sorted out with backmerges sooner than later.
> >=20
> > For this case merge everything through one tree with the right acks,
> > pull to drm-next asap and then backmerge into the other tree. Here
> > probably amdgpu-next with drm-misc maintainer acks for the 3 core
> > patches. Or if amdgpu-next pull won't come for a while, put them into
> > drm-misc-next and just wait a week until it's in drm-next, then
> > forward amdgpu-next.
> >=20
>=20
> Maxime, Maarten, Thomas, could I get an ACK from you for the three
> DRM core patches and an ACK for pulling them through the AMD tree?

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--chjinfct7tkz3bz5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZW2R7AAKCRDj7w1vZxhR
xWp8AQCQXNW7IUqfOdqvSkgXOkYbm3wTTQ0z6fBx8+IxzfpCUAEA3kj5XexqqmOo
FtGuGlyVt/0FusAG5fA/T9Tp+5nEXQ4=
=E16b
-----END PGP SIGNATURE-----

--chjinfct7tkz3bz5--
