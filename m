Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB2A43DBE5
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 09:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034936E90E;
	Thu, 28 Oct 2021 07:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06486E909;
 Thu, 28 Oct 2021 07:23:07 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 86F0C2B01287;
 Thu, 28 Oct 2021 03:23:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 28 Oct 2021 03:23:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm1; bh=KIwHOoVVMS/NPHj0iUVZa4i2QREEwVz6IUpJlR7w6SU=; b=KqgOsoCg
 iZABT+Z1QEirxMwCEEu4eNvL0mbns40gZa0cjZX3Xxtyr5nLzFe7TkLYEnM7Dr3J
 JDU+XXGIXGTk3dZPYhv/Yz4eKdhTRJJ5M0GOdwOnF/p2f3LF32Vetf73qs5zgnNV
 C082736yle5K/qnNdmUGYn5P4Zh81mmJspowDe7QtBhcJJf5EStypKvDNq7LZ+oQ
 RRtKtCXmXTjCH6mQTJCErxU48q2/xFzhGjSxK9F+juPAr/jfbJL/mdF22UU88fF5
 9St9PX9Ve9gk8dqiodNCB/pjBaTA8Xgy6ZXZKUWfHZsf2gz4g9myRB80VgN5iEHa
 T5WGs/hIxMuDJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=KIwHOoVVMS/NPHj0iUVZa4i2QREEw
 Vz6IUpJlR7w6SU=; b=dtAXHE8cersS1LMABlEEV7VrlfnOePysNA7VGUutJRplj
 w03mK2zOGBmyBMw5gxvZhTKF6ukKA4o3OiZR4EPdkNrvhvcXs8GNL+VFQWvVVQhM
 1SyvL6ES2fyWY08T60eMQUkoaaqnZpkow7YxEDyh4r/jrAwvOVmQ1oL5SRLjfKkO
 btFSsEth0lQHj9SNwT8NWwf9LfLYNIVuog6cUNMxsoRK0g+GCOp67fs02dVFDUML
 LKRufsDIrYV5B04qCLsopAk8InmiPsvDsNQOVa5qqy9NrVv1hZHbNtbdSD6vdhxj
 zHgn1iRU+3Yb/D4wobkL5QM0aY65hODkSk+vvSFIA==
X-ME-Sender: <xms:1096YWDutwAXy1uAgg4QEo7NHvmag3TWVW6rohEyQqfEaKdJYYLngg>
 <xme:1096YQjb8NY8flZcXna5DUGKDXdEhXD0VMkiUcVfQyU0Z5qElO48ZMKE7RkMOYSd7
 c9AVsdSOasQs18Xo5o>
X-ME-Received: <xmr:1096YZnKFrxsW7TYVrBNdUbVwIhfx-GiVbsq5Th7N7_4eYbHQ5BxsDPBbdcGV3Ihbv39gEt6SXHv5HrwqrlhteD-CS2Mfg5cpuOySgu1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdeguddguddugecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkgggtugesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeeguedvtdehgeeghefhieegteffueefleevgefgkeevgeeiveduleejueegvdei
 gfenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:1096YUwlqUfxAhVL_ma4_8_R0rS6WaSZAbs4ev4bNLx1jEtKKMpR4A>
 <xmx:1096YbTt2gAU_7I9_EhRZzfqRtjhxkjW2lXmogPaDU3jd3HdHSimYg>
 <xmx:1096YfaJncnWJYOh_yIOfHr3nigBy6ZJoSKCaGPktgpN8flGuVsZkg>
 <xmx:2E96YQ8xwgf9eCP8-SqI9L5D1tW3Oj6w_805rqsiMvaEcq3ZcTj8-HKCUUo>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Oct 2021 03:23:02 -0400 (EDT)
Date: Thu, 28 Oct 2021 09:23:00 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-fixes
Message-ID: <20211028072300.b4gqexq6zfhby24g@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tnfvh5ujnkdjosa6"
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


--tnfvh5ujnkdjosa6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave, Daniel,

Here's the (hopefully) final drm-misc-fixes PR for 5.15

I'll have a look tomorrow morning to see if anything has been committed
and send a PR if so.

Maxime

drm-misc-fixes-2021-10-28:
One patch to fix the default screen orientation on the GPD Win3
The following changes since commit ee71fb6c4d99c51f2d82a32c503c872b7e40e7f7:

  drm/i915/selftests: Properly reset mock object propers for each test (2021-10-22 11:09:45 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-10-28

for you to fetch changes up to 61b1d445f3bfe4c3ba4335ceeb7e8ba688fd31e2:

  drm: panel-orientation-quirks: Add quirk for GPD Win3 (2021-10-26 20:57:10 +0200)

----------------------------------------------------------------
One patch to fix the default screen orientation on the GPD Win3

----------------------------------------------------------------
Mario (1):
      drm: panel-orientation-quirks: Add quirk for GPD Win3

 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

--tnfvh5ujnkdjosa6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYXpP1AAKCRDj7w1vZxhR
xcJXAQDK/wX+v/CzayJGAojr29DnK+z6HF/hOmNKOCdTCv/3bAEA+ysgZ0iw+jkr
AKWmIFCrKIJE6yGV1JB0HRE04W/LsAc=
=ecsY
-----END PGP SIGNATURE-----

--tnfvh5ujnkdjosa6--
