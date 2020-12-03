Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB32C2CE9BF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:34:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 096C56E159;
	Fri,  4 Dec 2020 08:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FA989FA5;
 Thu,  3 Dec 2020 12:59:49 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5C5EA58041E;
 Thu,  3 Dec 2020 07:59:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 03 Dec 2020 07:59:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm1; bh=XXaaqays4k4y7Whh8IvMz3SH6yY2pfiiN9hKc+1ZNBQ=; b=YkODmNQ9
 Zum4/Xygxm4ncgQOD0LStSbmqKjh1Rc+lN5uCwgvklHsnXIvadnc55ynzZ547fH4
 pgHl3YXPlXSDv+pW+m7Ji+xrNB81gxVANGAbELwLkPK++I4HzFEFBCkmdhXEeInu
 k40vKGokKTzqZm2IbPt+XlmQErEgYZY+FSW80NDJ2Q8nEBtfE6+WHIrt0Mq6WCNF
 TNhwPlYIfs2MPObSuZwpluy6bLS0yT3rc8Q0aUVaHg/dsDKKyYa0BXdTSFj225cL
 aanN6vk5rXnzXKdWuWRmPFBLoKEud/Xta282lj2uN0LkoIw6NXpbQStRqJYjqxF/
 tOWvSMBVUTuPPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=XXaaqays4k4y7Whh8IvMz3SH6yY2p
 fiiN9hKc+1ZNBQ=; b=AKb5AEaRe2THXjXI+KqXYkGrdKLU+ZwN5lq1ltVQqMRbb
 S98tNBNeXxox+jldO5kWouYkVga5cZaMeUo+krRIz3cVln8Hc+5b7pIITB7dQS3J
 qSqEhPhmxuIOiTwSPFadBmS/V7j9S4HsJU5khnN8ycOQ1+HfpxLgjMHZE57xsTW8
 hBomfQjoGZ7/JZmXIkCAoyWrRLZl5L7cuOJdWbAosFEhAcm9xxXsVIZkSUKkitdN
 0sme9N89ID3EwCmAYKyVe2K5fMSVmElkpMFIq+1L3xDPOM3g66e+pWBiumrOG+Fl
 MKUdYZppqyHKCt+9noSv6h5or7BeBgoNWHkJLtfaA==
X-ME-Sender: <xms:QeHIXzIwI8-1MsPefQVBrxVT67ZstbJNVXWxDZoKlzYkj4TXTmO9WA>
 <xme:QeHIX3KNVuFM8aYBvfla6I4Tc-ovKuKhSbTkAHSQqanJXVJo6sojQ8nafiz-QWeKd
 rkUD3YGdQ-uej9vRNw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeiiedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddunecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhephfehtefggeekteffueeileekfeegteetfffggfekleehkeffvedvgedtieetvddu
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:QeHIX7v9Zu0PDUGUIALh-U2yCif8Rg8f75vj8vB3VtH_NYDVxrDkxw>
 <xmx:QeHIX8Z2F_RLoJpvVhCI9EU50tJZyN25EEcOBhXGhCdpIQ9iLPoM4g>
 <xmx:QeHIX6Y6f3GOjJzotmypKDlw7VOgICPO9y_GYIgRB1S25QxuJEhVZA>
 <xmx:Q-HIXwPLjGWRoHRLksq7K98xZJVrzBCalPe8CBX1KdaJTYeKVa0jfA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 092941080057;
 Thu,  3 Dec 2020 07:59:44 -0500 (EST)
Date: Thu, 3 Dec 2020 13:59:43 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20201203125943.h2ft2xoywunt5orl@gilmour>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:34 +0000
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1372457536=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1372457536==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k73hb63skliru4kq"
Content-Disposition: inline


--k73hb63skliru4kq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel, Dave,

Here's this week round of fixes for drm-misc

Thanks!
Maxime

drm-misc-fixes-2020-12-03:
One bridge fix for OMAP, one for a race condition in a panel, two for
uninitialized variables in rockchip and nouveau, and two fixes for mxsfb
to fix a regression with modifiers and a fix for a fence synchronization
issue.
The following changes since commit 2be65641642ef423f82162c3a5f28c754d1637d2:

  drm/nouveau: fix relocations applying logic and a double-free (2020-11-26=
 08:04:19 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2020-12-03

for you to fetch changes up to fd4e788e971ce763e50762d7b1a0048992949dd0:

  drm/omap: sdi: fix bridge enable/disable (2020-11-30 11:27:57 +0200)

----------------------------------------------------------------
One bridge fix for OMAP, one for a race condition in a panel, two for
uninitialized variables in rockchip and nouveau, and two fixes for mxsfb
to fix a regression with modifiers and a fix for a fence synchronization
issue.

----------------------------------------------------------------
Christian K=F6nig (1):
      drm/nouveau: make sure ret is initialized in nouveau_ttm_io_mem_reser=
ve

Daniel Abrecht (1):
      drm: mxsfb: Implement .format_mod_supported

Lucas Stach (1):
      drm: mxsfb: fix fence synchronization

Paul Kocialkowski (1):
      drm/rockchip: Avoid uninitialized use of endpoint id in LVDS

Sebastian Reichel (1):
      drm/panel: sony-acx565akm: Fix race condition in probe

Tomi Valkeinen (1):
      drm/omap: sdi: fix bridge enable/disable

 drivers/gpu/drm/mxsfb/mxsfb_kms.c            | 11 +++++++++++
 drivers/gpu/drm/nouveau/nouveau_bo.c         |  2 +-
 drivers/gpu/drm/omapdrm/dss/sdi.c            | 10 ++++------
 drivers/gpu/drm/panel/panel-sony-acx565akm.c |  2 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c     |  2 +-
 5 files changed, 18 insertions(+), 9 deletions(-)

--k73hb63skliru4kq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX8jhPwAKCRDj7w1vZxhR
xfy0AP9S5Ds+/f3sJ4VCJ/5iB+ty1+mw1TPa3vuiaF/BOeMZaQEApWhszc1zTh4w
Z8vKPW4JFRgfa+CpCzKg83/NKRaYbwQ=
=zZ9v
-----END PGP SIGNATURE-----

--k73hb63skliru4kq--

--===============1372457536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1372457536==--
