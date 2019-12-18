Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 092171257A2
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 00:18:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73CB76EA9E;
	Wed, 18 Dec 2019 23:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2906EA9E
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 23:18:52 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47dWCr2Bbhz9sPK;
 Thu, 19 Dec 2019 10:18:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1576711129;
 bh=335DNnRhqc+iXDJ2mDhBXpBQvrI/NoVQnWZRDgJP+xA=;
 h=Date:From:To:Cc:Subject:From;
 b=NJXDCSGkF1D5oXwRWdq8nccPpg+ZRqKEn5uH8OB0nun8AfGi4L81zgbTkzk9tysrm
 rPxki0f8eLV/wONZ0F5R3Us6Vh8viKLDiMENXWxo4qtpi7dvbpzL1aOssZaEnayek1
 LYcEhQJXchG84ieLVCh1rAc6Onkm9vbcGl2KYMbd9x0Z//zpkqKR5PhEAzveIiAcBN
 ZyqpJz+zRWdyxiJtA7WG9YKxU2orA95Bri6Hhq1+h+1JjvM00yTdt45iaL5r2mYYru
 feagtCYEc7hoq1foVlK5MBQmt/yWITLOTy9whWWA8Zc6xHQVdWuqk6m+5qC546gjh7
 KEBPyirceBQGg==
Date: Thu, 19 Dec 2019 10:18:47 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20191219101847.77d1619b@canb.auug.org.au>
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
Cc: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jane Jian <Jane.Jian@amd.com>
Content-Type: multipart/mixed; boundary="===============0241283831=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0241283831==
Content-Type: multipart/signed; boundary="Sig_/4HkbfY3ObCQ=w_pX/QLPfpn";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4HkbfY3ObCQ=w_pX/QLPfpn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c: In function 'vcn_v2_5_hw_init':
drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c:288:5: warning: 'r' may be used unini=
tialized in this function [-Wmaybe-uninitialized]
  288 |  if (!r)
      |     ^

Introduced by commit

  99bcbf833e6a ("drm/amdgpu: enable VCN0 and VCN1 sriov instances support f=
or Arcturus")

--=20
Cheers,
Stephen Rothwell

--Sig_/4HkbfY3ObCQ=w_pX/QLPfpn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl36s9cACgkQAVBC80lX
0GxSuAgAnso3T3r847dNMwRcQwRdE2hc8Ohl+WgDy16QG808/S/0vkiduIu8jSXX
yUq4hRulVvfUvE6/hzr0FK4aE+J6G2jaVJql3R0bx4vjS6CZv5L/XL9c6ylmKzvA
ZUvFXtyQGmqtV2dDa1SZhSH0yDhJ5uYs1MWsmx404L6vaMdslcg8C1rZqW9B8jcz
OCDO97C2R3DOutI121KDkNR9R8DltuAsXcM7bTsnmT/WNuRL5xcqmF5oA81Y4etC
uMuo3N6T6Vd/Kjhw2kPCkBL1cmFM6T5HasXVdenF2bFQ6On5+BLBMYJBZs0Eg5Zy
OrvkmdKK1939pqMJWsmsvMdku2pX3g==
=p7Ly
-----END PGP SIGNATURE-----

--Sig_/4HkbfY3ObCQ=w_pX/QLPfpn--

--===============0241283831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0241283831==--
