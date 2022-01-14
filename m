Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C62C148EA2A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 13:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9112A10E285;
	Fri, 14 Jan 2022 12:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F70610E285
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 12:55:00 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id B378058052A;
 Fri, 14 Jan 2022 07:54:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 14 Jan 2022 07:54:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm1; bh=4vz8jiRtdgPk0aHROxTUPN4cGx3LbMnExa2UCEEdsQ0=; b=kKBaakPW
 E4LdZJGDk/IWHquEOKN8L20ye6q1SBFLqlZJBb6AL1laaIRPWDrHHfX84xkgz95W
 2SbYHxaMpmKNcdpGjaUJWTjsBbf2W9z0rYpPs0hs31R8UecGacTajo1DquGfzv44
 gDeXj+LmVEJRy1opIesDXsTTWZHDA3YUwt0HaJiT1hlNgDkxofEUdhabJi8FdcW7
 i8qa69APhktrLbnWDGrvUOFlQ40Bx0q7dVsz3zrsyyEHAYJJl5tpEzA690aam5nM
 rrXR3TVmn5BSwy69KjxtnxAEFsAhJFT1I0Eb5gA5lyRgoAqby+JtblfHElE+iK39
 yH0/RmlYx+0g4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=4vz8jiRtdgPk0aHROxTUPN4cGx3Lb
 MnExa2UCEEdsQ0=; b=i48fXHMvBUke0pkrX8g+BOH1y4j8+ab5B6Alcx8fcSVAq
 PSLaBAXzvKB5QyCiTFxXFfJQc9FWxwmy0AUsXDHHViDRMHlbZVnraB/6QSVVvtIf
 pESxjQ8jhJ8ShoV9csrkY8URp60E83btkYe+uNciKrOmB/Xd7EAKBoO++BBP+jF/
 ALTpYz1ltQcX1tMVx527qJZMT1rVLUMgWr7tqSSfpBONxh+v/pjdsGFQST5B16BB
 n2F1CcPRtOgAOAiEvirRBFSFmTSnPiOTn8cDA/UrxkUEIMrJFy1U2i+yZhidoAJa
 663D3Tyq6a+9eLMbdXeIzGyi6zgSZv3eAbNd2Lpjw==
X-ME-Sender: <xms:oHLhYQs837A2VM2ylk4wPBXeXvjEnmd9SPEbFKce6C71JeW1bVNLwQ>
 <xme:oHLhYdeOGAuW20tu5Ze8Ba5u4lsguzPN8TRonJSBh_tH-_1Gs0Joret2_O9gocVGf
 fVY6A671cAqKYscjMo>
X-ME-Received: <xmr:oHLhYbxTXuHWE41SjloRnRFtI-UbFnrIH1geZqOWGnkzex5UgO0aOARH3f7dUOemtcJiazezVCrzVevAMYqPYnr5ERaldc8Rb4d0jYI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdehgdegiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkgggtugesghdtreertddtvdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeeguedvtdehgeeghefhieegteffueefleevgefgkeevgeeiveduleejueegvdeigfen
 ucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgv
 tghh
X-ME-Proxy: <xmx:oXLhYTP7lzJ-mBS5BeB2EOCncuDRNfQnCT1vF6-pFd3rCvJsG2ocOg>
 <xmx:oXLhYQ-LrR_BW7csMjhSF8pMekAuaVwNy3wd8YLYGgNE1Ldi21-qVw>
 <xmx:oXLhYbVLjhxH96PUJ4Dnj8fzRVrJI34IDTRDc17kbUPp1gv9i2U4FQ>
 <xmx:oXLhYR3_WJlMqwb_Z7HiCez3jP289eWkJY8dvhNScEvtEdbtegbuSQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Jan 2022 07:54:56 -0500 (EST)
Date: Fri, 14 Jan 2022 13:54:54 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20220114125454.zs46ny52lrxk3ljz@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ckajgawkwsianjye"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ckajgawkwsianjye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave, Daniel,

Here's a few patches stuck in drm-misc-fixes for some time.

Maxime

drm-misc-fixes-2022-01-14:
Two DT bindings fixes for meson, a device refcounting fix for sun4i, a
probe fix for vga16fb, a locking fix for the CMA dma-buf heap and a
compilation fix for ttm.
The following changes since commit 67f74302f45d5d862f22ced3297624e50ac352f0:

  drm/nouveau: wait for the exclusive fence after the shared ones v2 (2021-12-21 09:24:31 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-01-14

for you to fetch changes up to 016017a195b86d9761e91cb052438bf71207a12f:

  drm/ttm: fix compilation on ARCH=um (2022-01-14 13:30:56 +0100)

----------------------------------------------------------------
Two DT bindings fixes for meson, a device refcounting fix for sun4i, a
probe fix for vga16fb, a locking fix for the CMA dma-buf heap and a
compilation fix for ttm.

----------------------------------------------------------------
Alexander Stein (2):
      dt-bindings: display: meson-vpu: Add missing amlogic,canvas property
      dt-bindings: display: meson-dw-hdmi: add missing sound-name-prefix property

Javier Martinez Canillas (1):
      video: vga16fb: Only probe for EGA and VGA 16 color graphic cards

Johannes Berg (1):
      drm/ttm: fix compilation on ARCH=um

Miaoqian Lin (1):
      drm/sun4i: dw-hdmi: Fix missing put_device() call in sun8i_hdmi_phy_get

Weizhao Ouyang (1):
      dma-buf: cma_heap: Fix mutex locking section

 .../bindings/display/amlogic,meson-dw-hdmi.yaml    |  5 +++++
 .../bindings/display/amlogic,meson-vpu.yaml        |  6 ++++++
 drivers/dma-buf/heaps/cma_heap.c                   |  6 ++++--
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c             |  4 +++-
 drivers/gpu/drm/ttm/ttm_module.c                   |  4 +++-
 drivers/video/fbdev/vga16fb.c                      | 24 ++++++++++++++++++++++
 6 files changed, 45 insertions(+), 4 deletions(-)

--ckajgawkwsianjye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYeFyngAKCRDj7w1vZxhR
xSVgAQDSlTxXJFSNfDTJySFbVuP5u5qdqmxKzJ+CPxzNHnKF5AD/Xb5ThH3SnLU5
hcnbZ1TnDcLxi5DFJ2IyANeRW602xgk=
=Vkds
-----END PGP SIGNATURE-----

--ckajgawkwsianjye--
