Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58123446C10
	for <lists+dri-devel@lfdr.de>; Sat,  6 Nov 2021 03:33:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226E56EB2C;
	Sat,  6 Nov 2021 02:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 648796EB2C;
 Sat,  6 Nov 2021 02:33:22 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HmLyg0C8rz4xdP;
 Sat,  6 Nov 2021 13:33:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1636165998;
 bh=lNwfFDfi+cW2f5II4TY7fSXciVYL2Y/RkZE0XKE+6dg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YncAUBuh4FxIacRfDkFGVsVPGb0hqDzWK5kbWrTxOOD0xsTjRVabTwLAhcrzd4oPB
 pCw1y/xzvOMqHBXfpm+2hqv71Y/3oaZZeC8mffsmT7+XBBc4qSmiI1Do84uwcSLC3M
 MgfDEZmyl78NS7kPdqYRLAxOGBJAsButOHSrMywQTFPFDRZKJNKFoyWkB64iStnFlS
 9TVVzKVUQymEfnCC3+7Hs2uxQ9+y4yAEpaXNTuNcm3WjLbFThmVz1xjwOnBv2NKHUc
 /u99x/BjQDiODkWbIg4K0a0ZxMZmoayxkr4m/KtHMZhGJc/xsKoNNwax897a6kRj1T
 Tw1m03ciBWCpQ==
Date: Sat, 6 Nov 2021 13:33:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20211106133314.42e3e308@canb.auug.org.au>
In-Reply-To: <874k8qampc.fsf@intel.com>
References: <20211015202648.258445ef@canb.auug.org.au>
 <20211101194223.749197c5@canb.auug.org.au>
 <20211105171517.287de894@canb.auug.org.au>
 <874k8qampc.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bGM7tivz60/e3E/Y2e3LMTm";
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
Cc: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/bGM7tivz60/e3E/Y2e3LMTm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jani,

On Fri, 05 Nov 2021 13:03:43 +0200 Jani Nikula <jani.nikula@intel.com> wrot=
e:
>
> I probably should have pushed c4f08d7246a5 ("drm/locking: fix
> __stack_depot_* name conflict") to drm-misc-next-fixes.

Please do so as builds will start failing otherwise :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/bGM7tivz60/e3E/Y2e3LMTm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGF6WoACgkQAVBC80lX
0GwVZggAh6PkcNMcaVnFW79ZbDy59Idmp4qw5FehvnY6mLlZogpBIULjjxCnubwt
B7FnBfZtmXYDQR77gFRRBpTVRzDTV5Bh7mJwTcmqNH/GM9ewjJRzHVCf1zrjyPEQ
n2H5Y3jfUYT7WmLJEuHoDpEGPkjNZ0i0KPF9t1paW8KMV5dCW7jKBHbArLQ/IOiv
u2FgsIZmHKUuXoM1KglbBg4gF6KWDJYC8M2KzDHAsRqVO+vdQgqUz3g493IFZgZQ
NnLCbJSnoPkBwdobGDESjjOJYJVWY85kUDNle3z/j6T/YqXEQ+vTNwuvLjK7sdsV
IkRiy7P1dyrLQDa0wA6UBiG024lZPQ==
=GHRg
-----END PGP SIGNATURE-----

--Sig_/bGM7tivz60/e3E/Y2e3LMTm--
