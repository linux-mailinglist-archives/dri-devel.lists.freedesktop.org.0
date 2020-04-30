Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AEB1C0EAC
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 09:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30816EBFD;
	Fri,  1 May 2020 07:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD446E1F8;
 Thu, 30 Apr 2020 15:32:05 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id EC0D54E1;
 Thu, 30 Apr 2020 11:32:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 30 Apr 2020 11:32:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm2; bh=+MaNxBrQuDDFyuZjFqj9wpBqCT5pcPKpbaFg86decIw=; b=OiLM++j5
 VD6gDHtwnSAKDVSnZcvPXTZwnV6FcUJHAmWTjKcXVUdrRe0uQiKlRXbI+LHpK1Xr
 BJ3kLrkJZz8H90psDKNFXGzWy6xPll+aUsnqTUE5yBz3zoAnIOKb/PNx4+7OSKhq
 K3xIbLH2C+N+h+KBGJQEkBGibivK+nChkiMV30GOvoeEFnGI6Xr3hnIpvrkkQwKo
 kDOsXEOzb9SGCozdAwTCEHzdC1EfxkSbdx+tZd28VqGCURd/2mS8QtmVLaROjp5F
 bG3qcif3xF1+qLlDrjRV9ioy6nqno55o0sogXVtGoVhEcc//BQSHb022NZtd7G20
 hketXMZKQXGJkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=+MaNxBrQuDDFyuZjFqj9wpBqCT5pc
 PKpbaFg86decIw=; b=z5Z4gXVxIQug3SVf8WrPBV2IdTf1g1oWr9IpY2At1LiVh
 aufs4caxkm4eiOivrTJRpnKoqghcN1tdq7KE9H3eCyNDFV+oPp9J/cmZXj4QdO1j
 S7cVBqPqxphGZke4K4NG/suFJ/1WWat/MTfP6KV7HoQQZ3TXjkbrLvHlJpqwws2e
 r1DLaBgwyPlqypWFIMixNVBU75JrwDdDIi0E9rhTO+21TkOOUywInjSygYAGiyU4
 bo8QZiLxdf7s5dnBsZALy2B4iup5KzcWoAjEbS9kRUCxfjFarxfilq2wYsH9PQXb
 Z1Xhe+BymA2ZyIh9qzBs7cr2QhW4f6QYE/KRUtBAg==
X-ME-Sender: <xms:cu-qXl_SdlGXtSmAr0y3dMixj3NXQQ4hQiHbDe1zVOJ4meCd89R_dw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrieehgdeklecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkgggtugesghdtreertddtudenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpefhheetgfegkeetffeuieelkeefgeetteffgffgkeelheekffevvdegtdeitedvuden
 ucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucfkphepledtrdekledrie
 ekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:cu-qXhVIBzbCK5cEhtE-g5l958XWUhuE5T_IIYn5Bo7GdEpNp_KOoA>
 <xmx:cu-qXgqKocMc4YYRJW59KPNJ9kzxDQ5KERE8bxUCpYnnbQQhUWD-TQ>
 <xmx:cu-qXjmAke62EsUuCy7Cq_bIoQCz2PICdWrkamHms4eHEZulxai46A>
 <xmx:c--qXk8vxDI8CesLrKyh4lnFCW3-Cv8ifhLI7-H0WffCKOd3PWjLPc4ChdU>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 780173280060;
 Thu, 30 Apr 2020 11:32:02 -0400 (EDT)
Date: Thu, 30 Apr 2020 17:32:01 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20200430153201.wx6of2b2gsoip7bk@gilmour.lan>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 01 May 2020 07:22:25 +0000
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
Content-Type: multipart/mixed; boundary="===============0209458070=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0209458070==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mlliw5lpeecqqaky"
Content-Disposition: inline


--mlliw5lpeecqqaky
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Here's this week drm-misc-fixes PR

Thanks!
Maxime

drm-misc-fixes-2020-04-30:
A few resources-related fixes for qxl, some doc build warnings and ioctl
fixes for dma-buf, an off-by-one fix in edid, and a return code fix in
DP-MST
The following changes since commit 9da67433f64eb89e5a7b47977507806c6ea026e7:

  drm/tidss: fix crash related to accessing freed memory (2020-04-20 10:07:=
35 +0300)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2020-04-30

for you to fetch changes up to 6f49c2515e2258f08f2b905c9772dbf729610415:

  dma-buf: fix documentation build warnings (2020-04-30 19:47:39 +0530)

----------------------------------------------------------------
A few resources-related fixes for qxl, some doc build warnings and ioctl
fixes for dma-buf, an off-by-one fix in edid, and a return code fix in
DP-MST

----------------------------------------------------------------
Daniel Vetter (1):
      dma-buf: Fix SET_NAME ioctl uapi

Gurchetan Singh (1):
      drm/virtio: only destroy created contexts

Lyude Paul (1):
      drm/dp_mst: Fix drm_dp_send_dpcd_write() return code

Randy Dunlap (1):
      dma-buf: fix documentation build warnings

Vasily Averin (4):
      drm/qxl: qxl_release leak in qxl_draw_dirty_fb()
      drm/qxl: qxl_release leak in qxl_hw_surface_alloc()
      drm/qxl: lost qxl_bo_kunmap_atomic_page in qxl_image_init_helper()
      drm/qxl: qxl_release use after free

Ville Syrj=E4l=E4 (1):
      drm/edid: Fix off-by-one in DispID DTD pixel clock

 drivers/dma-buf/dma-buf.c             |  7 ++++---
 drivers/gpu/drm/drm_dp_mst_topology.c |  8 ++++++--
 drivers/gpu/drm/drm_edid.c            |  2 +-
 drivers/gpu/drm/qxl/qxl_cmd.c         | 10 +++++-----
 drivers/gpu/drm/qxl/qxl_display.c     |  6 +++---
 drivers/gpu/drm/qxl/qxl_draw.c        |  7 ++++---
 drivers/gpu/drm/qxl/qxl_image.c       |  3 ++-
 drivers/gpu/drm/qxl/qxl_ioctl.c       |  5 +----
 drivers/gpu/drm/virtio/virtgpu_kms.c  | 17 ++++++-----------
 include/linux/dma-buf.h               |  3 +--
 include/uapi/linux/dma-buf.h          |  6 ++++++
 11 files changed, 39 insertions(+), 35 deletions(-)

--mlliw5lpeecqqaky
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXqrvcAAKCRDj7w1vZxhR
xb0LAQC59wssv7BdxQI36PilqHVZjTiIpu0NiZyVHYOq2QmpFAEAhrl/iOg3iXWB
Wcs0aGL8Bbs2JrvkpzWYgCz/JENcwAo=
=9yuY
-----END PGP SIGNATURE-----

--mlliw5lpeecqqaky--

--===============0209458070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0209458070==--
