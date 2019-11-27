Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7D710C0B3
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 00:39:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A67596E0DA;
	Wed, 27 Nov 2019 23:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80DFD6E0DA
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 23:39:06 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47Ncft6Qqwz9sS3;
 Thu, 28 Nov 2019 10:39:02 +1100 (AEDT)
Date: Thu, 28 Nov 2019 10:39:02 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20191128103902.658e2a14@canb.auug.org.au>
In-Reply-To: <20191106135340.3fa45898@canb.auug.org.au>
References: <20191010131448.482da2b2@canb.auug.org.au>
 <20191106135340.3fa45898@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1574897942;
 bh=w1LH2k7ptcCnsILry43RjKE7GrL+RUe5GvbJ+pVWI90=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YSSbTi4EBv6SnIAsOHKbWnAauiXvBEnhcXECQzBW7mvN0snKeIsNidprQXb4hnuIr
 7CP/gK2shdcjEojCvQeSOMs/CjoAOXmmLT01ne8hyIAs6dc2RXRX+ad53FmA6Uj21r
 yMLW/CzjGsl5AIrUjnwu4fWiIsMXLlnyhxjZLLLdo7tEA9i52LxR2wLWMw6dvXlekh
 SxKH4AW72rJkjJfENca4Q7OGsXGk/THSXmq2g5Fs/1l2fNXoWLN/P9/lsXbJKjv1n4
 e9pPHflYBUja1KWL+azipkL30xXCSbS0qyXKloGf3VM/12XUpSsUwjJqFg8D34m1UE
 DzyRR92B4UeCA==
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
Content-Type: multipart/mixed; boundary="===============1232860712=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1232860712==
Content-Type: multipart/signed; boundary="Sig_/SRXdzPhxahcd.RHlGpCCP=T";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/SRXdzPhxahcd.RHlGpCCP=T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 6 Nov 2019 13:53:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi all,
>=20
> On Thu, 10 Oct 2019 13:14:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > I added the following merge fix patch for today:
> >  =20
>=20
> This patch is now just:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 10 Oct 2019 13:08:43 +1100
> Subject: [PATCH] drm/i915: update for mutex_release API change
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/i915/i915_active.c    | 2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i9=
15_active.c
> index aa37c07004b9..a47387174434 100644
> --- a/drivers/gpu/drm/i915/i915_active.c
> +++ b/drivers/gpu/drm/i915/i915_active.c
> @@ -385,7 +385,7 @@ void i915_active_set_exclusive(struct i915_active *re=
f, struct dma_fence *f)
>  	mutex_acquire(&ref->mutex.dep_map, 0, 0, _THIS_IP_);
>  	if (!__i915_active_fence_set(&ref->excl, f))
>  		atomic_inc(&ref->count);
> -	mutex_release(&ref->mutex.dep_map, 0, _THIS_IP_);
> +	mutex_release(&ref->mutex.dep_map, _THIS_IP_);
>  }
> =20
>  bool i915_active_acquire_if_busy(struct i915_active *ref)
> --=20
> 2.23.0

This merge fix patch is now needed for the merge between the drm tree
and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/SRXdzPhxahcd.RHlGpCCP=T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3fCRYACgkQAVBC80lX
0Gybgwf+O6nFUE7lTsaL1+COw7BFmjwftB8S6FHMm61I6xICZcYb60/ByuZqIdjc
Koi3o90c7FiZ6HAUwMEiv+uoFtpf2X3SToTR64IGMNZ3YhYLuckt4Gd81dwuRu3y
1AJPxfvswRRihJCyVrtHtOiDaHSoX56WQ8u+0pj6JNz2SC5n6tc7vym4vQ1IicQ6
/HyUA9C9Cf412RreJBu8Iosn/ec2lySsVLplmwqEXKZAgbAZUjwL5FmJrcsWPOy7
+Y6uQqNtj9Vxgion2a+yzAFOavqL2HzeyOVgXBKkIVwIRhavmKwwml9TI2jSssXI
k3T0CiDT2B6BF2IJP6XqFyngeIEyyg==
=GNgk
-----END PGP SIGNATURE-----

--Sig_/SRXdzPhxahcd.RHlGpCCP=T--

--===============1232860712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1232860712==--
