Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A4210C0AC
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 00:37:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304666E129;
	Wed, 27 Nov 2019 23:37:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BABAB6E129
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 23:37:14 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47Nccf4HMWz9sS8;
 Thu, 28 Nov 2019 10:37:06 +1100 (AEDT)
Date: Thu, 28 Nov 2019 10:36:52 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: manual merge of the tip tree with the drm tree
Message-ID: <20191128103652.6cf09858@canb.auug.org.au>
In-Reply-To: <20191010125106.4627d1b5@canb.auug.org.au>
References: <20191010125106.4627d1b5@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1574897831;
 bh=/RkBre7uSCqUQB0B/x+Br3fQIFf0/YWFV9jaAzCdSbA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nreEgOyCtF+JfgZlJ32QsfkppYYyGQ1HmnPo3l5WzplPG/fgKqalnadSsbjnu3n8c
 AyoQLgUIJpZ2S/HAeXVoClJzTcOwOjQTXrfMOI2/1AznxKIz5GCbzXFHl0uJVLAMEH
 0IKLOyukbs1W9w4yO3wPXQbUtZ4xJrVCgzmQzWQoVw9s/3Q22839o8xLBQIen+PNI3
 h0Z9rGnpbNBb60c554NF0JOV8RYV3EtpD4bhkjet3eEzG8CN0CD4d6N4RWQtFO+p1F
 JxqUAP0c5AYsGdEpvKuugsglFbe/9OD+oNaZlG9+XvBwjcqowCnn1uxZup9FNcK3LA
 CcGutU3Jorofg==
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, Qian Cai <cai@lca.pw>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Linus <torvalds@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>
Content-Type: multipart/mixed; boundary="===============1533901063=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1533901063==
Content-Type: multipart/signed; boundary="Sig_/+MkTPz8/57gq_NjCwSilMVY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+MkTPz8/57gq_NjCwSilMVY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 10 Oct 2019 12:51:06 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
>=20
> between commit:
>=20
>   2850748ef876 ("drm/i915: Pull i915_vma_pin under the vm->mutex")
>=20
> from the drm tree and commit:
>=20
>   5facae4f3549 ("locking/lockdep: Remove unused @nested argument from loc=
k_release()")
>=20
> from the tip tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This is
> now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your
> tree is submitted for merging. You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> index fd3ce6da8497,1a51b3598d63..000000000000
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> @@@ -436,9 -497,22 +436,9 @@@ void i915_gem_shrinker_taints_mutex(str
>  =20
>   	fs_reclaim_acquire(GFP_KERNEL);
>  =20
>  -	/*
>  -	 * As we invariably rely on the struct_mutex within the shrinker,
>  -	 * but have a complicated recursion dance, taint all the mutexes used
>  -	 * within the shrinker with the struct_mutex. For completeness, we
>  -	 * taint with all subclass of struct_mutex, even though we should
>  -	 * only need tainting by I915_MM_NORMAL to catch possible ABBA
>  -	 * deadlocks from using struct_mutex inside @mutex.
>  -	 */
>  -	mutex_acquire(&i915->drm.struct_mutex.dep_map,
>  -		      I915_MM_SHRINKER, 0, _RET_IP_);
>  -
>   	mutex_acquire(&mutex->dep_map, 0, 0, _RET_IP_);
> - 	mutex_release(&mutex->dep_map, 0, _RET_IP_);
> + 	mutex_release(&mutex->dep_map, _RET_IP_);
>  =20
>  -	mutex_release(&i915->drm.struct_mutex.dep_map, _RET_IP_);
>  -
>   	fs_reclaim_release(GFP_KERNEL);
>  =20
>   	if (unlock)

This is now a conflict between the drm tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/+MkTPz8/57gq_NjCwSilMVY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3fCJQACgkQAVBC80lX
0Gw2ywgAmPOTyG46QO6nwU5BJlgFBc7eiZQ6KbImblsUv8A5l8rw7nZmZaMi8ild
IpFn4XELIpNki+aO8bqL9S2zhzZw0PHPyY60urODkdc8akDXD8V2tnIFZX+CZ9Lt
hEWHH8qTSdNSXYLJxVSVIhoWTgZWUPM0IrbEEOMRAaCnGI4jnIqFXVu5f1nmw4y4
QKKqsNsnQGpJfuAawFv480/cU23pYlP9yj0o2J+ftQOLV9TPHuxrN4HAtDvpPJxb
bcVtKaUaTcbj4uPlbPKyRCsnfFVaycn7rug/t+syXTf+tke+EcEmoHeOaT7ZqnF4
ZK/28vh67y0KO9VaVxd3y/165LxBTA==
=VabA
-----END PGP SIGNATURE-----

--Sig_/+MkTPz8/57gq_NjCwSilMVY--

--===============1533901063==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1533901063==--
