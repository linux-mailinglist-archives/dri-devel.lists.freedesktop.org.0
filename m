Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9979218C451
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 01:40:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11BB6E0E9;
	Fri, 20 Mar 2020 00:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E15E6E0E9
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 00:40:53 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48k4gy0jfhz9sPF;
 Fri, 20 Mar 2020 11:40:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1584664850;
 bh=kaiv7JfWV9XDlC9+SYuxgC5j8/RZ50es9ayK3qs/2mE=;
 h=Date:From:To:Cc:Subject:From;
 b=X/NxKWZemt66UvIxUjXOVw4Ptdq5QHAibdHiX49Zi2JwwzXqL7fZsrvCHK4pc1/HI
 xmV3fWx9tBjrII4nXI07rqlc2SQ3Ecjg8NugayPwrMz9BbIB6BCilhIeQ8UMY3jgFg
 wU5pH4MmUKmZVg/yVuNMY3cUOb/pecDC5ddriTNyls2NUVXWwZr2vWxlYtVBZQG2Ec
 a+MN1HcDFE2aKP4kL8Ri2k85U1v2Epj7nsQo5VEzVUwhBgn6m4BsJCWr0798kGst5C
 DVdnDHFp9E625KaXfUvOldJNXHVRPfV5D7ARR1reAupt/qv9memPvCIZC6jA/Ykjmu
 /yIBiPddIy2pw==
Date: Fri, 20 Mar 2020 11:40:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>, Dave
 Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-msm tree with the drm tree
Message-ID: <20200320114044.095fbabe@canb.auug.org.au>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: multipart/mixed; boundary="===============1267965460=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1267965460==
Content-Type: multipart/signed; boundary="Sig_/nk3CTyDI3Fd+oc.bbR+_9NN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nk3CTyDI3Fd+oc.bbR+_9NN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-msm tree got conflicts in:

  drivers/gpu/drm/msm/edp/edp.c
  drivers/gpu/drm/msm/hdmi/hdmi.c

between commit:

  a25b988ff83f ("drm/bridge: Extend bridge API to disable connector creatio=
n")

from the drm tree and commit:

  c479017faa3a ("drm/msm: avoid double-attaching hdmi/edp bridges")

from the drm-msm tree.

I fixed it up (the latter removed the code updated by the former) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/nk3CTyDI3Fd+oc.bbR+_9NN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl50EQwACgkQAVBC80lX
0Gy4ggf/Um5vg3cQw7/Kf4wCqd36b0TiemhzY/v900X4mUeNOHB5sQx04VwZ52CN
BjuwJ5xmSEV15OuJPg3Kgg4RTIBP+BkrXSXblVQPynTLk+7uEhRosZ/fqq6/3g/J
O+dyZWmok+O18ftHXo2MwueP2aNrSOam35uBGMcNd75Ur97CjC3ZiSUjEoeCYEMA
SbWMKBRLDS6L6nr0iI2+ETqPj7CDLpfn9ZPKjrL63GTTQSazyF1t9Tyvyb7BLidT
QILfn9Qr0TRFGB6UroyFpRQ5ZX2S+hrQBq2SX8V51D98R/PdTNGldaklTsHIkK74
0a8F17UrjI5Tqmycyjx7eCvMXFTHgQ==
=ZJSE
-----END PGP SIGNATURE-----

--Sig_/nk3CTyDI3Fd+oc.bbR+_9NN--

--===============1267965460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1267965460==--
