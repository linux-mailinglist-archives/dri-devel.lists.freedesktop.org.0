Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CC845D817
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 11:18:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94586E437;
	Thu, 25 Nov 2021 10:18:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60286E40B;
 Thu, 25 Nov 2021 10:18:27 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id A52962B01525;
 Thu, 25 Nov 2021 05:18:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 25 Nov 2021 05:18:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm1; bh=Zu0IJTgPFLVVVVNSyljNTJUvEm64C0DoxYXK3icoM9c=; b=Xhj9IRmz
 qxH4LrUzKCkguQHvmINap5OsJ0ydRtkU/Z35LNt8hApnEE9hW2o54DYjVApyyGSu
 ubsJVH6EQ+vN3yjE2F7/1Fr49Ksq/I7lQfKD91eF4r+zIvF5TzgTD7GJz5z/QLR9
 nphR8lJL7FicYclw3N1TvNVAHDHh5W4VnohBN+MWLNm+yKDz0D18/7DxlLOyP5JG
 hJCUzQUucruJzDxsGZV1kY53D1uDlNICVXBe4SOQHLZG+nT5iIOWZrXawtWQOjSu
 o6FNrGpMA7gNTjpu5AMkzLOwlvSpAXSt6F5ZiOQQUA2wAiM9RCsE85mgo+MjxLDw
 hAxqMlRkLGrTBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=Zu0IJTgPFLVVVVNSyljNTJUvEm64C
 0DoxYXK3icoM9c=; b=oMEksy10cWCFvBbc2KUBuHNOpZiOvFNy4x9sCXVI64YZo
 UunOH9lDgo6/Qpc021fsbPGE2fxRoRnx7AdzrtLn9C1ZnXUiLPE+GeqpNhgH1Ie6
 O6hCoRxE+vvwVBCg5yG+1KjW/lGDpx+DPsWz2yqs+96bgqIQmBvlD4SnSbXvJbGG
 3BIoDZuFbvK7QkCJsihOyt7xtgaP8tF/BNgL5CcsdDucs8NgBsed3XrEp0/0T58X
 3v5RgE1Bjmu3L5+1TI++0bgT8EK4+ljdfkkRehnpaWsXDfdFFMJKXGHnAUWOfwzu
 7URyDbl1IS+oD7GGrlel8CQqfSgYJLukRaoXjDgIg==
X-ME-Sender: <xms:7mKfYdp1CYvm0ChUQcXC6d3Quynej2l5ytHzbiFgtgigb0g4tMmq7A>
 <xme:7mKfYfol16tuvTuDY6N_Vx8sq--NFPs8JxKuJT3mdqc4i5cFK35GTM4tgFB4umQCi
 P4T46eTS7lEz1Bgdf8>
X-ME-Received: <xmr:7mKfYaMfkjyu-aqYI_1-YXFZO66bbY-Qt2vVLiJ3qTL6cUv13Wci9rOGVX0Z8WOXGCc1cMxf1N72a0sXoInjMBmR65h-Jbk2fnc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrhedtgddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkgggtugesghdtreertddtvdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeeguedvtdehgeeghefhieegteffueefleevgefgkeevgeeiveduleejueegvdeigfen
 ucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgv
 tghh
X-ME-Proxy: <xmx:7mKfYY5Wy9sz2m3N6KHDzKq5PvLYuymaLwL9hkEIM4eeJamu38Nz8Q>
 <xmx:7mKfYc4yg3CHdsSo9G085iOIYyM2l2JokhyHwv5_rCYNFOWKDWBb1A>
 <xmx:7mKfYQhSUMJ-3Cqcc5WjdMNYV3SgUmBJDlHucAmnCW5pCpHZKUaa1w>
 <xmx:72KfYZwUdG1nb94ztrfuTlZmOehJeEP9E7UPjUR-DtHdGRhah4pPiJYWlFs>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Nov 2021 05:18:21 -0500 (EST)
Date: Thu, 25 Nov 2021 11:18:19 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20211125101819.ynu7zgbs7yfwedri@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ngzrvu7y6m2aqdfv"
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


--ngzrvu7y6m2aqdfv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel, Dave,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2021-11-25:
One removal fix for hyperv, one fix in aspeed for the vga_pw sysfs file
content, one error-checking fix for vc4 and two fixes for nouveau, one
to support a new device and another one to properly check for errors.
The following changes since commit fb561bf9abde49f7e00fdbf9ed2ccf2d86cac8ee:

  fbdev: Prevent probing generic drivers if a FB is already registered (2021-11-17 10:15:05 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-11-25

for you to fetch changes up to e048834c209a02e3776bcc47d43c6d863e3a67ca:

  drm/hyperv: Fix device removal on Gen1 VMs (2021-11-23 10:56:12 -0800)

----------------------------------------------------------------
One removal fix for hyperv, one fix in aspeed for the vga_pw sysfs file
content, one error-checking fix for vc4 and two fixes for nouveau, one
to support a new device and another one to properly check for errors.

----------------------------------------------------------------
Ben Skeggs (1):
      drm/nouveau: recognise GA106

Dan Carpenter (2):
      drm/nouveau/acr: fix a couple NULL vs IS_ERR() checks
      drm/vc4: fix error code in vc4_create_object()

Joel Stanley (1):
      drm/aspeed: Fix vga_pw sysfs output

Mohammed Gamal (1):
      drm/hyperv: Fix device removal on Gen1 VMs

 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c           |  2 +-
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c           | 19 ++++++++++++++++++-
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c   |  6 ++++--
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c   |  6 ++++--
 drivers/gpu/drm/vc4/vc4_bo.c                      |  2 +-
 6 files changed, 50 insertions(+), 7 deletions(-)

--ngzrvu7y6m2aqdfv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYZ9i6wAKCRDj7w1vZxhR
xfrXAP0Xd3o/zkq1Vb8BnhYfdRMYemPSp+VkfUhGjLiolStSygEAqkt06Zjz5/Uo
PRMFaHs5sPISyRBdFw/uSyVqXl5L7gg=
=3RhE
-----END PGP SIGNATURE-----

--ngzrvu7y6m2aqdfv--
