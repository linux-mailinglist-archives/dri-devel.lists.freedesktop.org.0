Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 297828F978
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 05:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171006EAB1;
	Fri, 16 Aug 2019 03:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2AC6EAB1;
 Fri, 16 Aug 2019 03:31:37 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 468pl91FX1z9sNC;
 Fri, 16 Aug 2019 13:31:32 +1000 (AEST)
Date: Fri, 16 Aug 2019 13:31:32 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20190816133132.6b37d7fa@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1565926294;
 bh=GHLP3+kVivze2Qzz0yb8xDZ5EM3RQFJj3qJTpy3zYW0=;
 h=Date:From:To:Cc:Subject:From;
 b=jbtzeDGSIQ+ez6nHNfChtWjbQlDAqqiPzGlnS5JNOuk8pK0982dbmhIFsj4PdD2jJ
 Ayuwzags4W1xohtACAjINbun/oE6Ai5ejV2fgBWtwUcQ5A0hPzELtNAVC/JY34xELZ
 YXhg+cepT7MQMdfp51w/FVLyY0Vtf39x2fASr225GQKVnHRmyaglCjvEKhYBCUBqm6
 suouvd2MLHbgm/t6ZFtV8kBGo+TxARM/UuKnbWAZi9J1NU2eq2JSSoCrmYOsxttBBV
 qKwDekPA2Ez04lM/Ba5clQsIDNDSoB6y2inRdgq+tf5oZuA3q/7Lww/yGSNYZlrxnd
 ZEdi263bCbIKQ==
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: multipart/mixed; boundary="===============1596501924=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1596501924==
Content-Type: multipart/signed; boundary="Sig_/IC4A=I2yzw9mVSXt_Y0ZdLK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IC4A=I2yzw9mVSXt_Y0ZdLK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

warning: same module names found:
  drivers/video/fbdev/omap2/omapfb/displays/panel-nec-nl8048hl11.ko
  drivers/gpu/drm/panel/panel-nec-nl8048hl11.ko
warning: same module names found:
  drivers/video/fbdev/omap2/omapfb/displays/panel-sharp-ls037v7dw01.ko
  drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.ko
warning: same module names found:
  drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.ko
  drivers/gpu/drm/panel/panel-sony-acx565akm.ko
warning: same module names found:
  drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td028ttec1.ko
  drivers/gpu/drm/panel/panel-tpo-td028ttec1.ko
warning: same module names found:
  drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.ko
  drivers/gpu/drm/panel/panel-tpo-td043mtea1.ko

Introduced by commits

  df439abe6501 ("drm/panel: Add driver for the NEC NL8048HL11 panel")
  c9cf4c2a3bd3 ("drm/panel: Add driver for the Sharp LS037V7DW01 panel")
  1c8fc3f0c5d2 ("drm/panel: Add driver for the Sony ACX565AKM panel")
  415b8dd08711 ("drm/panel: Add driver for the Toppoly TD028TTEC1 panel")
  dc2e1e5b2799 ("drm/panel: Add driver for the Toppoly TD043MTEA1 panel")

--=20
Cheers,
Stephen Rothwell

--Sig_/IC4A=I2yzw9mVSXt_Y0ZdLK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1WI5QACgkQAVBC80lX
0GwRHQf/QDlEwyhJCOKizMPg8T0hbva+mS465aNjjHvczqhKjoKqZ5CyZhdamS5G
wPXELESVZ+PURv1jJSdD1hRkMvDdAlvyeOehkNWBkoZO0wv3J81LB/wO15fKdnMf
TDPusdBJlLPK2wjqd45tAWDzyfHzIY9KbiSYckD8ogUKuhwgNF5uu/te9WtmcIiz
rpDzuebFjN2t1/D1rsRKDJNWU3U1VNjkerwifWuJoFielZ4+giPqtBSMPQbO4bdR
S13jVpp+VIc9vQKYCstVwCbHVoqWf4C8YA81RxXdSGWiEPt4/76Zydor5FneQOWW
QMN+nW0HZp7q871eXOYR3tuvvCP3uw==
=HXwu
-----END PGP SIGNATURE-----

--Sig_/IC4A=I2yzw9mVSXt_Y0ZdLK--

--===============1596501924==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1596501924==--
