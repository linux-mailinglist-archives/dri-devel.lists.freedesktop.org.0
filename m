Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E44C0366533
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 08:10:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 867776E94B;
	Wed, 21 Apr 2021 06:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2056E94B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 06:10:46 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FQ9CQ2dq0z9t5G;
 Wed, 21 Apr 2021 16:10:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1618985444;
 bh=4MvTAN8NWMjHr1OMP9BQ1vlhM4Re9k9Mwv+2K60afss=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ip1uYGMNCaFRYUXkpAy6gH9W1pbbNfJ6rW3PX8bbYXLBkZ816UJFGfpINRHyk+PB+
 l8sIGJ42w2NZQ6Tv0QFJ0Z49tHfvlcQskF64zfWCXz6EqI5XSCIsSGng0lQU81dTCq
 XV+yVm3E8Xw/MQ2PUyZwmBFUpNCn+kvevXFB4NWsKrXNQls9ZGICN8ig614KEUxagt
 TsFJOVYhHWDhLLVlj1ntn1kapa9+blAYsoYpOVpqwFHtoiqM9XtkCzjjDb5qfG6L6O
 fad9UyGHOyCpLmX3R4Php66nSSru+pPfvwxJTcVCy46WaCcx/J1ONeefxG/GWDjLup
 JsuQ1MWFlGxWw==
Date: Wed, 21 Apr 2021 16:10:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20210421161041.47f8b3a7@canb.auug.org.au>
In-Reply-To: <20210311220033.7c5fe548@canb.auug.org.au>
References: <20210311220033.7c5fe548@canb.auug.org.au>
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
Cc: Zhan Liu <zhan.liu@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0622535852=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0622535852==
Content-Type: multipart/signed; boundary="Sig_/1SE.zLDGNbwles/Nb1PByQO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1SE.zLDGNbwles/Nb1PByQO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 11 Mar 2021 22:00:33 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> After merging the amdgpu tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:143: warning: Function =
parameter or member 'list' not described in 'dal_allocation'
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:143: warning: Function =
parameter or member 'bo' not described in 'dal_allocation'
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:143: warning: Function =
parameter or member 'cpu_ptr' not described in 'dal_allocation'
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:143: warning: Function =
parameter or member 'gpu_addr' not described in 'dal_allocation'
>=20
> Introduced by commit
>=20
>   1ace37b873c2 ("drm/amdgpu/display: Implement functions to let DC alloca=
te GPU memory")

I am still seeing these warnings (as of next-20210420).  That is now
commit

  0dd795323405 ("drm/amdgpu/display: Implement functions to let DC allocate=
 GPU memory")

in the drm tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/1SE.zLDGNbwles/Nb1PByQO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB/weEACgkQAVBC80lX
0Gy7kAgAnIAGxiQIdjCsEFtLKE9bQrN5w6+GdFkEjK6teBscqxxifBWJy7HCyUac
3rfNbzu2sIfaio5KPcY2/0FuhQsCOqhsITRYDF+n5yUriLsarAX4LhxHe7OaA/N5
HjCm8KJXiPiLp2+LAfmGyjMb9C1AGh7vE7WVWopkLHopDeZyW3fbxutOPEwLWK9Q
ttk42DkijKee1cqPhFzqGQdu4J6gCnRUO+T3ARjirl65ZOcpsB47GmsGavWL4/bo
97EW7X6tWYUE0Sa+2iQsL6zYTN/taSnARe2DE/9jWKs1bZftxNFwV24R4IJqBz2l
g6ia2dEyU7VAY8A/8zSiCGmJHRHp/Q==
=LSTq
-----END PGP SIGNATURE-----

--Sig_/1SE.zLDGNbwles/Nb1PByQO--

--===============0622535852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0622535852==--
