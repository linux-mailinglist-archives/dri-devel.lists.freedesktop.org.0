Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F06DE1CD07C
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 05:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B248F6E0F7;
	Mon, 11 May 2020 03:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC2B89FE6
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 03:47:20 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49L6M83sxTz9sRf;
 Mon, 11 May 2020 13:47:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1589168837;
 bh=O6zAs4Q3XikfztIZH1d1NrZqdEwNh2c50gDfoygxdLc=;
 h=Date:From:To:Cc:Subject:From;
 b=cYYX+rnqJKBB7kkvpkom4AgbZA7Ut6K3fpZHtO9UVJm8HYD2zmmy7OA13Pf6keGMZ
 NVDSLByMO8p3eaG3rjej++DJafBPsi0ViWThdh+CTxpqmqcrlBWr25VRFpyh9BnEf6
 FNX3inFLdDuWNdAovuQoV+kn5xmvBZbXMssYe5/yn05GRt3dCSIKR+OZenfcBfPbIk
 KaPDUqGLKxc6VY3m/9wD4rw+UIV4lJL+zoa5aR/jw2ctCku3RgTFJgGM1hE3xpd1i9
 pGkjeTF3vHRfr0Ma98XoXZjJusKBPHw3NOUlMMo5ONnziBnYQ32zm/mFaf0gEK2Wq6
 gJhF69tafPXpQ==
Date: Mon, 11 May 2020 13:47:11 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20200511134711.4956a5d0@canb.auug.org.au>
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
 Sam Ravnborg <sam@ravnborg.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Harigovindan P <harigovi@codeaurora.org>
Content-Type: multipart/mixed; boundary="===============1213475491=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1213475491==
Content-Type: multipart/signed; boundary="Sig_/hf4wbgX98YvTZGDZmMXnOFY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hf4wbgX98YvTZGDZmMXnOFY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

WARNING: modpost: missing MODULE_LICENSE() in drivers/gpu/drm/panel/panel-v=
isionox-rm69299.o

Introduced by commit

  c7f66d32dd43 ("drm/panel: add support for rm69299 visionox panel")

--=20
Cheers,
Stephen Rothwell

--Sig_/hf4wbgX98YvTZGDZmMXnOFY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl64yr8ACgkQAVBC80lX
0Gzz5wf/SzmSBIVJ8psuZOrI1EHRvhok21kidiDElkDPfM+wUiZQvM8SpHsE7rLt
jlWz+olEdZKQTf16JDo0SLMi5cvQgoz89CSwK9DJnTUFza70Mz8K4NHlTwxJfJde
aW5Wgua4+Uw+AghtNwSiuY6MRRCSiGfKBIexdtiLf8mJPmapMvBCYTLTXGyg/TEg
2RJbbY3hQz+4pLireQgelqmn3CntKDyFTifb1GT35N7iWrCJnJGwHMPA5/ap+8Ef
bX5iUgsfho6/y3vmnFXC0EpffphZiA3kDTs4z+mtWiVeY+v7HJAqe2KFU3Z6lK8C
LEJGa1rzLr5ayYXpgWVCS7vxFI/GVg==
=y+Pu
-----END PGP SIGNATURE-----

--Sig_/hf4wbgX98YvTZGDZmMXnOFY--

--===============1213475491==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1213475491==--
