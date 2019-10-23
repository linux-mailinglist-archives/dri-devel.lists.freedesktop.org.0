Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC92E18FA
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 13:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582306EA46;
	Wed, 23 Oct 2019 11:26:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60CAA6EA45;
 Wed, 23 Oct 2019 11:26:46 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B26CF2064A;
 Wed, 23 Oct 2019 11:26:45 +0000 (UTC)
Date: Wed, 23 Oct 2019 13:26:43 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20191023112643.evpp6f23mpjwdsn4@gilmour>
MIME-Version: 1.0
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1571830006;
 bh=bipDpsb0i80MZA1CPFS1Du8tF7D+Q+oWAUciIIS+rVE=;
 h=Date:From:To:Cc:Subject:From;
 b=PMd6C1ezRzNDHzoSW96GZT3pKuEX/FkyuvZcDRM5lWartBGJGyU33sBqL/lO+qoBr
 Q5MwjLOqFgI9qF7lDaP9Yxst8Y4+wTtOMSYGmhB5kD+BXsxpS+oKWtRGmLj/DALRXi
 oXUX0JYqjAsZx9vmBL0WMzyOMP0EkOG7zaPKstJo=
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0956478584=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0956478584==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hlkt5whda7en65t5"
Content-Disposition: inline


--hlkt5whda7en65t5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel, Dave,

Here is this week's drm-misc-fixes PR.

Thanks!
Maxime

drm-misc-fixes-2019-10-23:
Two fixes for komeda, one for typos and one to prevent an hardware issue
when flushing inactive pipes
The following changes since commit 5b3ec8134f5f9fa1ed0a538441a495521078bbee:

  drm/panfrost: Handle resetting on timeout better (2019-10-15 11:38:22 -0500)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2019-10-23

for you to fetch changes up to 8ae501e295cce9bc6e0dd82d5204a1d5faef44f8:

  drm/komeda: Fix typos in komeda_splitter_validate (2019-10-21 14:50:51 +0100)

----------------------------------------------------------------
Two fixes for komeda, one for typos and one to prevent an hardware issue
when flushing inactive pipes

----------------------------------------------------------------
Mihail Atanassov (2):
      drm/komeda: Don't flush inactive pipes
      drm/komeda: Fix typos in komeda_splitter_validate

 drivers/gpu/drm/arm/display/komeda/komeda_kms.c            | 3 ++-
 drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

--hlkt5whda7en65t5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXbA48wAKCRDj7w1vZxhR
xYjCAQD1FwoRNKM0klfTt0zGfKu2M9fwPj+DI3IuOTdMsXa6vAD/YeYv50ezX5rY
yM2EW5qoek1/OHnxnK5Ldwx5Ke2gjg4=
=x71e
-----END PGP SIGNATURE-----

--hlkt5whda7en65t5--

--===============0956478584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0956478584==--
