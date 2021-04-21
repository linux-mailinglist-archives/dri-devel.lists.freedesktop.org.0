Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4777E366543
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 08:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8B06E94C;
	Wed, 21 Apr 2021 06:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35846E94C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 06:15:48 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FQ9KG6bksz9t9b;
 Wed, 21 Apr 2021 16:15:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1618985747;
 bh=kx1xafIEM4is8vzfaSx1HT6zBxumuU+8rCsdMulufoc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rcZaMiL8gh50ypNN7J4d0jRD8xtYvG6BPOyQQPp4uSbumuZvYl5fJJmlc/FKLy+XR
 qRteIXphCj+qxDzrC4Nh+flL+f4lg6k4bodtdbM33WKP2StbIvlEjdkVXtYGEadP+q
 MK4XLcuJsKKFDS1IG/6Y7QzOnk6l3ZwMKmwkO4YQw0pOO0TTDZdceteA3Nkbb0v6sP
 zGHsvkQJNY5DntOJPMRwHmKoPHGQHTlHsQFz6LEcraWpZueM8iDpY2hFPrPJWDXZZO
 aXiEHuHU1draivdcB4BfZRJMTKWHyNiUCtN0Jj+JtwGfJ0BcRCexwLoLPP/Q8rj9pX
 4qY3tTUb5iEXg==
Date: Wed, 21 Apr 2021 16:15:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20210421161546.3fb3848b@canb.auug.org.au>
In-Reply-To: <20210322170014.3e022928@canb.auug.org.au>
References: <20210322170014.3e022928@canb.auug.org.au>
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
Cc: "Leo \(Hanghong\) Ma" <hanghong.ma@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0422462697=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0422462697==
Content-Type: multipart/signed; boundary="Sig_/LY8irD=kJJEiP012ilf1H6F";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LY8irD=kJJEiP012ilf1H6F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 22 Mar 2021 17:00:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the amdgpu tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:405: warning: Function =
parameter or member 'dmcub_trace_event_en' not described in 'amdgpu_display=
_manager'
>=20
> Introduced by commit
>=20
>   4057828a1283 ("drm/amd/display: Add debugfs to control DMUB trace buffe=
r events")

I am still seeing this warning (as of next-20210420).  That is now
commit

  46a83eba276c ("drm/amd/display: Add debugfs to control DMUB trace buffer =
events")

in the drm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/LY8irD=kJJEiP012ilf1H6F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB/wxIACgkQAVBC80lX
0Gw/cgf/dUNdQ4y8d4yYDtrNQKDo+ye+d6V6rwKE5M9CqT/lwXIk1wgC9cANjvC1
ZEAnuP9qCKgaVK8ASDxyKPhq9rAO+zKZByqptcplGuIr8K66m0ebVID2/RXEUt+J
572ZfF9T0obmdED2YezflQnSWviYnRv4TVxZgLtJlkrc/FvN92tUbs3Z/gcuFjd8
g2fZp6M4KIGki4P5QIzXGmWN7dJtZSzKHwfDkf7qwmfG+Th/UjKdMZ/gfSfOHCPQ
vPtuzHjB9NVFnaHh9weStvRhYq2976emzxJDPbtkMSDxGWJxNpSV7bRvFj0TXJxh
Oqnu/0LKx4yabDffDX+WHeEEkNMyNA==
=+Yl4
-----END PGP SIGNATURE-----

--Sig_/LY8irD=kJJEiP012ilf1H6F--

--===============0422462697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0422462697==--
