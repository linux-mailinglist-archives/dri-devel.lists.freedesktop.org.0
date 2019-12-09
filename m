Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8017C117994
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 23:42:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA2D6E580;
	Mon,  9 Dec 2019 22:42:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33636E580
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 22:42:26 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47Wyr05W3yz9sP3;
 Tue, 10 Dec 2019 09:42:24 +1100 (AEDT)
Date: Tue, 10 Dec 2019 09:42:24 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build failure after merge of the drm-intel tree
Message-ID: <20191210094224.4a294cb7@canb.auug.org.au>
In-Reply-To: <20191210093957.5120f717@canb.auug.org.au>
References: <20191210093957.5120f717@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1575931345;
 bh=rbtrLmd0Sl7CbXlL69awNUOL+vEJxT9RgQ4V++Z3lTw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CGi9lb9AMLz5/qrcyCh8+E3Wg9bApr/23NuDOy9kbB5sRuSokoR7dM1ByVQtZTVZf
 6Wu9D3vb8vKFSXmksXG6GUXsA2DevwNnayjkQ9GUxoQJ0LD2sDXr9atXX4TFjFc4uf
 6BK9WHEMp8ErFxZuRRI88wat4ILFMgXFdXWRrXxPpqppchMguCe086R9cqUK/Emygj
 QoP6bYEbTA87MXDnXg64CkMNjgOHKApsDDACxSdMt+Rkn2P2yWiLMPTwoLIm7dufE8
 W+lIyE2eIYNwv8Uhzl+koBBVMPQ40MJLVNrDcqRCksEfsZfZe6wjJpGdi73DRQMLz4
 D1FzKNeflKa8Q==
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
Cc: Dave Airlie <airlied@linux.ie>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	S@freedesktop.org,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Qian Cai <cai@lca.pw>, Ingo Molnar <mingo@kernel.org>
Content-Type: multipart/mixed; boundary="===============0824798467=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0824798467==
Content-Type: multipart/signed; boundary="Sig_/Uy=O+1BroOoggdNM6mX.EEp";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Uy=O+1BroOoggdNM6mX.EEp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[Just adding Dave Airlie to the cc list]

On Tue, 10 Dec 2019 09:39:57 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the drm-intel tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> In file included from include/linux/spinlock_types.h:18,
>                  from include/linux/mutex.h:16,
>                  from include/linux/kernfs.h:12,
>                  from include/linux/sysfs.h:16,
>                  from include/linux/kobject.h:20,
>                  from include/linux/of.h:17,
>                  from include/linux/irqdomain.h:35,
>                  from include/linux/acpi.h:13,
>                  from drivers/gpu/drm/i915/i915_drv.c:30:
> drivers/gpu/drm/i915/gem/i915_gem_object.h: In function 'i915_gem_object_=
pin_pages':
> include/linux/lockdep.h:635:2: error: too many arguments to function 'loc=
k_release'
>   635 |  lock_release(&(lock)->dep_map, 0, _THIS_IP_);  \
>       |  ^~~~~~~~~~~~
> drivers/gpu/drm/i915/gem/i915_gem_object.h:294:2: note: in expansion of m=
acro 'might_lock_nested'
>   294 |  might_lock_nested(&obj->mm.lock, I915_MM_GET_PAGES);
>       |  ^~~~~~~~~~~~~~~~~
> include/linux/lockdep.h:352:13: note: declared here
>   352 | extern void lock_release(struct lockdep_map *lock, unsigned long =
ip);
>       |             ^~~~~~~~~~~~
> In file included from include/linux/spinlock_types.h:18,
>                  from include/linux/spinlock.h:83,
>                  from include/linux/mmzone.h:8,
>                  from include/linux/gfp.h:6,
>                  from include/linux/slab.h:15,
>                  from drivers/gpu/drm/i915/i915_irq.c:32:
> drivers/gpu/drm/i915/gem/i915_gem_object.h: In function 'i915_gem_object_=
pin_pages':
> include/linux/lockdep.h:635:2: error: too many arguments to function 'loc=
k_release'
>   635 |  lock_release(&(lock)->dep_map, 0, _THIS_IP_);  \
>       |  ^~~~~~~~~~~~
> drivers/gpu/drm/i915/gem/i915_gem_object.h:294:2: note: in expansion of m=
acro 'might_lock_nested'
>   294 |  might_lock_nested(&obj->mm.lock, I915_MM_GET_PAGES);
>       |  ^~~~~~~~~~~~~~~~~
> include/linux/lockdep.h:352:13: note: declared here
>   352 | extern void lock_release(struct lockdep_map *lock, unsigned long =
ip);
>       |             ^~~~~~~~~~~~
>=20
> Caused by commit
>=20
>   e692b4021a2e ("lockdep: add might_lock_nested()")
>=20
> interacting with commit
>=20
>   5facae4f3549 ("locking/lockdep: Remove unused @nested argument from loc=
k_release()")
>=20
> from Linus' tree.
>=20
> I have applied the following merge fix patch for today:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 10 Dec 2019 09:37:07 +1100
> Subject: [PATCH] lockdep: fix up for lock_release API change
>=20
> ---
>  include/linux/lockdep.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
> index 5bbfd5866081..664f52c6dd4c 100644
> --- a/include/linux/lockdep.h
> +++ b/include/linux/lockdep.h
> @@ -632,7 +632,7 @@ do {									\
>  	typecheck(struct lockdep_map *, &(lock)->dep_map);		\
>  	lock_acquire(&(lock)->dep_map, subclass, 0, 1, 1, NULL,		\
>  		     _THIS_IP_);					\
> -	lock_release(&(lock)->dep_map, 0, _THIS_IP_);		\
> +	lock_release(&(lock)->dep_map, _THIS_IP_);			\
>  } while (0)
> =20
>  #define lockdep_assert_irqs_enabled()	do {				\

--=20
Cheers,
Stephen Rothwell

--Sig_/Uy=O+1BroOoggdNM6mX.EEp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3uzdAACgkQAVBC80lX
0GxcGQf/RijDSkbB4Vye8LPtcAVqvQNGx8CN+LZj1IZ34iwjePiCTl3n/mGYF1u2
AxleCuDemMObna8edGEBjOvtAa50ifDYKJqs0py6zo7J6vJmdT7EOC1llQcUxUfr
FrwIAYmCKCeMehekQ60Bzl38zCot+CmdCbZPelPFDthjVPyOC7nubzdsH1FtFpUL
Dmozh08UN2X7q/ne75+EXpsuPmG2pPpi2VDpsl6SYPLLvn9OFmTQD69hpC0ztsqs
MU4iXvIWXty+4YO1PyIqE4S3Wooq4xM8lF/A0PPNLdLMYQYHlaFuqkVn7p2JugZB
UDc5JaMXxK6NVD/9deRYknmv78fmHg==
=T9L2
-----END PGP SIGNATURE-----

--Sig_/Uy=O+1BroOoggdNM6mX.EEp--

--===============0824798467==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0824798467==--
