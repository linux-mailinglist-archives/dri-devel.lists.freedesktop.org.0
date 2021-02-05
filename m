Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EA931029A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 03:12:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E526F3A2;
	Fri,  5 Feb 2021 02:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBDA6F3A2
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 02:12:14 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DWzSn0Q8yz9sWd;
 Fri,  5 Feb 2021 13:12:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1612491132;
 bh=9+YNYgOvs+LvDUb5QbSEuc4VS2ZKmFRzV9IFnBYP47c=;
 h=Date:From:To:Cc:Subject:From;
 b=RXStvPBpmTG/hL0RIHUavwUxVKDPK79dbRVeGANdInTCB3KZV418Lm3KS3OyQ+4++
 ed9U0eY5x2T2mO9vsmhbVWacqmzmS8EvmMqDRLJJzpNXNhSQSNFdZ3F3HD8Jhvfp5l
 uS7+O3c15NGDlfjYb8g6ubObuB078FZaBuR86SdyQoz3oMGbsaVKLWsSZuGDhXBMBc
 fAR0pNMFc2WA1McV98Vvw1CD+NL1M49VSbP59VcUHup7CBtBem7Lu5l+7ZQ9of+N++
 +Tz6DRCj9pOgOJapoE1kjuygrYf5j5eTQU0fQNmSo1sTMqwQgxuF7ahh9C2BGfG4Ff
 LmwcZp6PYaiNg==
Date: Fri, 5 Feb 2021 13:12:08 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Dave Airlie <airlied@linux.ie>,
 DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20210205131208.3c1bfcc6@canb.auug.org.au>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: multipart/mixed; boundary="===============1216806785=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1216806785==
Content-Type: multipart/signed; boundary="Sig_/zwipi3XuVJ2FCTtb1VezoeB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/zwipi3XuVJ2FCTtb1VezoeB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) failed like this:


Caused by commit

  13a75af50484 ("drm/amd/display: Fix unused variable warning")

interacting with commit

  4c3a3292730c ("drm/amd/display: fix unused variable warning")

from the drm tree.

I reverted the drm tree commit for now.

--=20
Cheers,
Stephen Rothwell

--Sig_/zwipi3XuVJ2FCTtb1VezoeB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAcqXgACgkQAVBC80lX
0GwSagf+Oews8YCbCtU+/5+h8Og5tffUqqVFMZXXwHSVO4wo5JjWgtkwm8MS9you
qB5B1pDA9msLAUW010IukWwkppTLI2ceF3SlwIOnBj9aUgl0y9kjyYdTHJYhsRm6
ouKjuM8uVH5qLGpSB0mi6hlpVFHEYTe3m1T1jk3tmqFeaHB0+33n5Ac30uT5QC1M
zKfm5a0EBW/pSEuZAWY9W67RPeSdocki1jUHUagZcax2w+Lcn1+LWlLWoWCUvRi0
54I9Liv0vLjrjwwWXWs50X648MdDxCtU+uu47ozTYBCqmiEEvHqpPMaGaSlbA+ZN
Oyin8IXfpMF3uB74ZqoJLDnVro7EUA==
=ng4a
-----END PGP SIGNATURE-----

--Sig_/zwipi3XuVJ2FCTtb1VezoeB--

--===============1216806785==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1216806785==--
