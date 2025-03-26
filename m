Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D20A7100A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 06:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185E810E07D;
	Wed, 26 Mar 2025 05:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="On4q/s/Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B053010E07D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 05:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1742965369;
 bh=MGp42LgOjmNmRuG5IfUDJVETvK0HfrBLslq5K6Y5Mho=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=On4q/s/YjnvWF2gA9OiHYJuogvwWs67FMq4Yt6+tdFGx57KSdvqwSGKc5CKxqxjZe
 ZQhZPl1d11bDMI4F6JldgCFYq0jeTf+r2dXnn7tYpsslyuObvIZWkHg6YKiROm0XiU
 e4KLGZUCIvoyO2UClDetuc9Zb+GMTjdapkmI9dqQbAzcJF+xUKEl4WRi/nSHUhWKRO
 o1IPwpd5LDJtQuuC+3zCCohh04r4kIOielKp4i5UJymWK/WNgtXpPIFu2O08aMWsVa
 xPV3oLqdMDFzhffG1YpQt7uDO9YbX4kZ0KvHeYXqja4x1wEZNWHoBXWbqm5+LssFO8
 CEZBH+GoanSiw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZMvmn0VP1z4wd0;
 Wed, 26 Mar 2025 16:02:49 +1100 (AEDT)
Date: Wed, 26 Mar 2025 16:02:47 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Dave Airlie <airlied@redhat.com>
Cc: DRI <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Nam Cao <namcao@linutronix.de>
Subject: Re: linux-next: manual merge of the tip tree with the drm tree
Message-ID: <20250326160247.23651946@canb.auug.org.au>
In-Reply-To: <20250313141253.0c5a7520@canb.auug.org.au>
References: <20250313141253.0c5a7520@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Unl2nueOgRxsjh.WrOW/t02";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/Unl2nueOgRxsjh.WrOW/t02
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 13 Mar 2025 14:12:53 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   drivers/gpu/drm/i915/i915_pmu.c
>=20
> between commit:
>=20
>   87b593d79864 ("drm/i915/pmu: Drop custom hotplug code")
>=20
> from the drm tree and commit:
>=20
>   82ad584eed8b ("drm/i915/pmu: Switch to use hrtimer_setup()")
>=20
> from the tip tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc drivers/gpu/drm/i915/i915_pmu.c
> index 69a109d02116,0ce87f188d11..000000000000
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@@ -1155,8 -1264,8 +1155,7 @@@ void i915_pmu_register(struct drm_i915_
>   	int ret =3D -ENOMEM;
>  =20
>   	spin_lock_init(&pmu->lock);
> - 	hrtimer_init(&pmu->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> - 	pmu->timer.function =3D i915_sample;
> + 	hrtimer_setup(&pmu->timer, i915_sample, CLOCK_MONOTONIC, HRTIMER_MODE_=
REL);
>  -	pmu->cpuhp.cpu =3D -1;
>   	init_rc6(pmu);
>  =20
>   	if (IS_DGFX(i915)) {

This is now a conflict between Linus' tree and the drm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Unl2nueOgRxsjh.WrOW/t02
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfjincACgkQAVBC80lX
0GwpWQgAhUOHtN1AycWApCP38/IDZMeCwsMkZtHV970mt0gAEysZr6/Eh9w0GVZI
HrWj5Js4Y5mZZkcR98mtLlvV0s8Ql4Ex1Xzb6BojdS7CSI1nu33l1y/6AcpVTgM/
MWHuX38imAEagTjcRBD6xS4EMLx9MgHLSBGxbR5ILjrdC7kyZgymLtwVUND0s644
LDhvXA4hCEsrJL33wX+iHEio5v74S6aDm8nj2JqjRDLlLv09F3IdNa45YidgsiKs
sETH6B4iZP0EZiemCH+2c+NaVAsEcoWot7X6rResv4PrzZPAy+ogqSOqEd4j9bCC
lkzRjdQdVI7mVgB/DWjpPDVPPS0R2Q==
=ho/x
-----END PGP SIGNATURE-----

--Sig_/Unl2nueOgRxsjh.WrOW/t02--
