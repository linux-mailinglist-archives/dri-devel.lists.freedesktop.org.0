Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CA92BBEB9
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 12:35:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DB96E9A2;
	Sat, 21 Nov 2020 11:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B046E8C3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 14:42:52 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2A53A580138;
 Fri, 20 Nov 2020 09:42:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 20 Nov 2020 09:42:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=Bo7KYS9fpAd1Zw2XHHokXqO42Y
 l7WpYwHsAC3B4IDWE=; b=lL6PmvybpSvpUcmz0vXvR21DfOSBlNIBL4u3gmvn1y
 Ozmuo6gLdUjsWX+Huz2JWinWIIuJAmyQuShnzKeodjvP1uxl/8SAVk8u02uxLXJh
 uDKSY8oXKNX+lEgFWyKw3En0Y/XwweFwnEyD/e7t9PgqidLxw76wXRlOAk4qf8nB
 xGsa4mMxydXOHPZa974ydxWSst5E+JTQDus7hPvFJLzs8m0jK5WO/Gkr6voglgjA
 v3tVKqOVB3pxG1+6LdvkPp+Uj8t46Gy64755OsQrCIycDk8qzlwmMvta3mwMWKkQ
 E/2qvBp9BfFKHptorIGxP+4UUx/SdALWVDOIV1jlAFoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Bo7KYS
 9fpAd1Zw2XHHokXqO42Yl7WpYwHsAC3B4IDWE=; b=Om0ef64BGYatTYRNn50C8D
 M/OztkBBzqEOa+z0k4/HsylgpMEOv8hadEItazlxekO1SiQr5tUdH2ovggpAIxGI
 LIvGbPiZrrs4fiGwK27jmwPHsBWutBsiHUntkiEsYhgKvR9DGyLxGLX08Gpb5OG/
 O/QN8o7ZDeoOKXisDhbw+dE/tTf11qpa7TVfJPIvwz7CVAMDJu2nbFA9bKCinD+e
 YR8kP5H/kivTVyibHg5YledTYAB68T5s7NQoAyTRnwS2pwoFWwlBuOrkbWe8g2st
 BgKrm2cMthEi7fwAsSNI1Dj6ElaqtmkTh0LmS9N60TZvEONQQoLZqneH66QgcEhQ
 ==
X-ME-Sender: <xms:59W3X5Wld5ixeCMzyIMTcKN7oCEZIlIiLJPZobL7MelMb9_z6HUUug>
 <xme:59W3X5l6B41eF6W6WcBj3vmg1H5RDeALO1-4SE56l1f5hZm8hiu4HbT5iVeTXbZhj
 4ImBwQ8UdBXZj_lagM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudegtddgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:59W3X1YBwW6wXC8muHCYxkWp05hCnRdhzxuijvasTsTxaG1ejmSkIA>
 <xmx:59W3X8VBjKPHA6tlWWuHRg-iS0ezeWC0DEw79oU2GwlZxlvW7uJFkA>
 <xmx:59W3XznDrln3sJqSYL8Kv7sueRYoIAWbzxreezdEJsuiJZrsca1a4Q>
 <xmx:6dW3XxeYYoOPHiu2wdW65x7qBS0AK_bhy3asOLJ1Fpm1oOyIHiVzSg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0A41D328005E;
 Fri, 20 Nov 2020 09:42:46 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 0/2] drm/vc4: Rework the HVS muxing code
Date: Fri, 20 Nov 2020 15:42:43 +0100
Message-Id: <20201120144245.398711-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 21 Nov 2020 11:34:30 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here's a second attempt at fixing the current issues we have with the
muxing code that results in a PV muxing its HVS muxing when only another
CRTC is modified by a state, or vblank timeouts when trying to wait for a
vblank on a single CRTC while another one is inactive but enabled.

Let me know what you think,
Maxime

Changes from v3:
  - Pulled some patches from the atomic_helper_commit series that reorder /
    cleanup some code added here
  - s/needs_muxing/update_muxing/, and some cleanups suggested by Thomas
  - Removed the patches already applied

Changes from v1:
  - Dropped the code trying to access all the CRTCs (whether in the state
    or not) state
  - Added Hoegeun Kwon's tags
  - Fixed a build bisection error
  - Cleaned up the private state using drmm_add_action_or_reset
  - Rebased on current linux next

Maxime Ripard (2):
  drm/vc4: kms: Store the unassigned channel list in the state
  drm/vc4: kms: Don't disable the muxing of an active CRTC

 drivers/gpu/drm/vc4/vc4_drv.h |   4 +
 drivers/gpu/drm/vc4/vc4_kms.c | 199 ++++++++++++++++++++++++----------
 2 files changed, 146 insertions(+), 57 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
