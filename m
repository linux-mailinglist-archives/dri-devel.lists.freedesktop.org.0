Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1145136656D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 08:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E5F26E16D;
	Wed, 21 Apr 2021 06:28:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C486E16D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 06:28:54 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FQ9cM0nk6z9sxS;
 Wed, 21 Apr 2021 16:28:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1618986532;
 bh=ZHru/G84QN9SBD/xoHHISggikSIxcgfogfgUuzGmeDw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jTY233VRuXRqz0LeZPJmRxWtCCdgRLFs24+O/bEZFb0fTH5AtK0qS3o0jM/nezIgt
 koYloHeTFTCfM9xcvJOi0WQ142ZjLbVlqY/T16EXRazIKjbVGLnRgXmH05tUPKpw0n
 emzj2kBjkMFyBmLFHnB6DsvHTC1P98Y7exNOpsEYpydRIp6KPJJjSGTq0sEIswPpdK
 KxmhNpp4T5YxtAaIdMsH4mscp7+Rk3ctw5EFkVPvBgNJ25tKQIlHBe3sFshLc/oMm5
 MXohUWlr3wbq/g1MFT/1X8wDVfXxuRmApPoutbwo9eGwNuQ3u7MhotfM/Py1dmO0gH
 4MuoAbU1xNxkg==
Date: Wed, 21 Apr 2021 16:28:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build warning after merge of the drm tree
Message-ID: <20210421162850.49a31107@canb.auug.org.au>
In-Reply-To: <20210401181933.08472e2d@canb.auug.org.au>
References: <20210401181933.08472e2d@canb.auug.org.au>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0014016326=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0014016326==
Content-Type: multipart/signed; boundary="Sig_/V5bviABzsYqoShe8I+VEPBk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/V5bviABzsYqoShe8I+VEPBk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 1 Apr 2021 18:19:33 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> After merging the drm tree, today's linux-next build (htmldocs) produced
> this warning:
>=20
> drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:102: warning: Function param=
eter or member 'ww' not described in 'i915_gem_shrink'
>=20
> Introduced by commit
>=20
>   cf41a8f1dc1e ("drm/i915: Finally remove obj->mm.lock.")

I am still seeing this warning (as of next-20210420).
--=20
Cheers,
Stephen Rothwell

--Sig_/V5bviABzsYqoShe8I+VEPBk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB/xiIACgkQAVBC80lX
0GxLWQf/d7EgIEXtOSGvZmHk07QfSo9DsZM+9YMLButVyz4ESFshdMEcePagIfw+
Wqfo69MAcRsNczgJmj/wOP8ie86CWr3mQkiaiMBKeKWN5RIvkX9NipDLcFnIOVWG
tIYzWz/dB+w1f5xATJLYmgTU0Nc66xSe0f7YobeI6ZRXqPGPvlJSQo3lCBWp1RFS
9AjM/NfhtjEufjG60UgRHNGU9acm+JfH5uaX45QXxqhQSODj7orIWcVzgVCSY6xZ
2oZK73geSpRXg2CgIRsMbEpvNjg6FAC4RjSY8m/rspDmS/EJ9vyRYhnkoErz8xy6
sfq1XoY1fvLSSMNeHa7X/bUgmrM9XQ==
=HiqO
-----END PGP SIGNATURE-----

--Sig_/V5bviABzsYqoShe8I+VEPBk--

--===============0014016326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0014016326==--
