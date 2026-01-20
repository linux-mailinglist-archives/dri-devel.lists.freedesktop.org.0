Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3k45Bnejb2kJDwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:47:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CC5469F1
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D329410E5F3;
	Tue, 20 Jan 2026 14:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o5RlXDPc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B03C110E06B;
 Tue, 20 Jan 2026 14:31:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 804B641AF3;
 Tue, 20 Jan 2026 14:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC073C16AAE;
 Tue, 20 Jan 2026 14:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768919460;
 bh=8kwLq8A6UNQfbJ+AhubQeU6mlyEurtih7K4BeillPc0=;
 h=Date:From:To:Cc:Subject:From;
 b=o5RlXDPcG7+agj1oKLLXB4r4z0IS6zStphWgikSpLRsOdLFUPmO2DhAgPxnNDhZxi
 fVuBEmEWl8hefSIUh+Qiy/YcL4HQBHZPH6EOYdw+CTuijAfFuMx9sRXaL0lYFYwFYc
 Sh9iEUKm+p+GF4nWJZ5C8D/7o6heRknlshA99T6ywup5cq+geUFuZ5ai6wu7bLIkmJ
 4epHVR7HmiQADLgeJB+otCLoTzYUnx6bJ05RJD2KIUh7sLw7BZgBkopiP6++TdLuwL
 mprQskmuda8dn3ubEr+UPln+Xi5fzqLtMNicXJGzmnQF+nKBMt1AWZi7R6JIgDl4ju
 c2X25+fh/ABbA==
Date: Tue, 20 Jan 2026 14:30:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Cc: Chen Ni <nichen@iscas.ac.cn>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-misc tree with the drm-next tree
Message-ID: <aW-Rn_qcNP2CgOm2@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9jgTUlvssYY4I/1+"
Content-Disposition: inline
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Spamd-Result: default: False [-3.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: D3CC5469F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--9jgTUlvssYY4I/1+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/mediatek/mtk_hdmi_v2.c

between commit:

  f9c68b1c5be43 ("drm/mediatek: mtk_hdmi_v2: Remove unneeded semicolon")

=66rom the drm-next tree and commit:

  b626b1a1c9cca ("drm/bridge: refactor HDMI InfoFrame callbacks")

=66rom the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
index d510ca8cfc4a5,d0e4440b74911..0000000000000
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c

--9jgTUlvssYY4I/1+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlvkZ8ACgkQJNaLcl1U
h9BcWgf/f1PZ+vimrziCa4UmeSm0BThty9/eQhnU7AQaPN6eBJK3xnkjPEVElaKK
vZmUvvBazSxIRd2Y2rUPBnG754LXtzBYWrg3KQraJZj91seqKmi6XN+aFpeKQJha
g9sCisXi5XIsxF2IFS1zYVU6P0P9J8oOnQ3ilNCwMbVMb/iYeuZN3IuW+Fe/zemz
ZGdK5spoTMmpqsP07IBdgQ6B1eaZ84SShGxILaOsS3eYFdu0jEJTm/Tdb3UOkVzr
5mWgGaE4tLPAPTJVvX3vmKXqzaH2egTPRUxIXORcI8x0KnY3eZARSWMTd0DuZbuy
Kd76V0digS1dvkh2+r3HAbzq1vxzUg==
=6n4G
-----END PGP SIGNATURE-----

--9jgTUlvssYY4I/1+--
