Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A96A3266B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 13:59:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEDA210E322;
	Wed, 12 Feb 2025 12:59:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Jc0Z/ELB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1624710E322
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 12:59:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 87ABDA4005C;
 Wed, 12 Feb 2025 12:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442DCC4CEDF;
 Wed, 12 Feb 2025 12:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739365152;
 bh=dvzv4Xr540OFHqd7C561dXBYQUMBYtGS6qye/mEp3l8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jc0Z/ELB9UtSLhrCeS9binYXWS0DOK+DBhcf9zaRuQrpVqsalWwyVvocq/zcCBqp2
 MroCicoX73YMdlvFqUloZ4pyHcW5zyf/kQF4DSocZ++MSaiWq4yBUV4aLocCzkJWd3
 igRRe/bbwgy3BFWYYJhIVz3t3O4YvUXhHEKHy8s64MBJkGA8ZqmKYne/4NH0BQbfuE
 ls/fWHDyPrY1aUEv/0itjKUlLxAI/mHStQ2Do+8VQjercRQRr3Irv2/ModNA+jheoh
 oZnAexVD1IOHcYkn2/StrrBRXc/GCzB/3qVIf3OGQAm8nYFHrpX0t8CoEi2VsXszzC
 lvsZA+/DJ1f4A==
Date: Wed, 12 Feb 2025 13:59:10 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 maciej.falkowski@linux.intel.com, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 0/6] accel/ivpu: Changes for 6.15 2025-02-04
Message-ID: <20250212-lush-tremendous-cicada-4baa44@houat>
References: <20250204084622.2422544-1-jacek.lawrynowicz@linux.intel.com>
 <c6537153-d03b-4b9b-8fdf-ff437512404e@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="hmj4bhjhl7bdt3bm"
Content-Disposition: inline
In-Reply-To: <c6537153-d03b-4b9b-8fdf-ff437512404e@suse.de>
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


--hmj4bhjhl7bdt3bm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/6] accel/ivpu: Changes for 6.15 2025-02-04
MIME-Version: 1.0

On Wed, Feb 12, 2025 at 11:20:46AM +0100, Thomas Zimmermann wrote:
> Hi,
>=20
> here's a complaint about the lack of process and documentation in accel/,
> and ivpu specifically. I came across this series while preparing the week=
ly
> PR for drm-misc-next and found myself unable to extract much useful
> information to report. This is a problem for a development process that
> relies on transparency, accountability and collaboration. Other problemat=
ic
> examples are at [1] and [2]. IIRC I had similar issues in previous
> development cycles.
>=20
> I cannot assess the quality of the code itself, but the process and
> documentation involved does not meet the requirements.
>=20
> - 'Changes for <version>' is not an meaningful description for a patch
> series. It's not the submitter (or anyone else) deciding that this series
> gets merged into version so-and-so. The series gets merged when it is rea=
dy
> to be merged.
>=20
> - Apparently this series contains 3 different things (buffer imports,
> locking, debugging); so it should be 3 series with each addressing one of
> these topics.
>=20
> - The series' description just restates the patch descriptions briefly. It
> should rather give some indication of the problem being solved by the
> contained patches, and context on why this is worth solving. (I know that
> this is often complicated to state clearly to outsiders.)
>=20
> - Review should be public. I understand that it's often only one dev team
> working on a specific driver, discussing issues internally. Still it makes
> sense to do the code reviews in public, so that others can follow what is
> going on in the driver. Public code reviews are also necessary to establi=
sh
> consent and institutional knowledge within the wider developer community.
> You miss that with internal reviews.
>=20
> - These patches come with R-b tags pre-applied. Even for trivial changes,
> R-b tags should given in public. If the R-bs have been given elsewhere,
> please include a reference to that location. The tags (R-b, A-b, T-b, etc)
> are not just for verifying the code itself. They also establish trust in =
the
> development process involving each patch; and in the developers involved =
in
> that process. This needs to happen in public to be effective.
>=20
> - The kernel's (or any FOSS') development is organized around individuals,
> not organizations. Having each developer send their changes individually
> would likely resolve most of the current problems.
>=20
> I understand that accel is not graphics and can feel somewhat detached fr=
om
> the rest of DRM. Yet it is part of the DRM subsystem. This development
> cycles' ivpu series' made me go to IRC and ask for accel/ to be removed f=
rom
> the drm-misc tree. Luckily the other maintainer were more charitable. So I
> make these remarks in good faith and hope that we can improve the process=
es
> within accel/.

I'd also want to emphatize that the last three items at least are
applicable to the entire kernel, so even if they had a different tree,
it would still not be ok.

Maxime

--hmj4bhjhl7bdt3bm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6ybGQAKCRAnX84Zoj2+
dpJ8AYD++8/cPZEirEKB5Mn1xURz6LYUFSxP9OVHjgeBR+236EJOMF/39C2etwMT
EHg1y8cBgIVq7Qf3XLFi6saJGsTvFMn+fdYdmZuLjkhkX2ThHYjl1K2bTYN/sIwq
p582/9E9IQ==
=nnwI
-----END PGP SIGNATURE-----

--hmj4bhjhl7bdt3bm--
