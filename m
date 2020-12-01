Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 684D72CB6AB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C1F6EA0F;
	Wed,  2 Dec 2020 08:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34A86E52A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 13:12:53 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id ED3385804E6;
 Tue,  1 Dec 2020 08:12:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 01 Dec 2020 08:12:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=Cj8nPYSBw7K3FvFlk+HErdGVMm
 Gm2WY/sykuNg4ZnDA=; b=uKIEq70UluojtcklxyXYxo3GvFue9vLvc7ih4Tn+4Y
 COMCErFFkR2vcMe8hiKDslYCm/pmPzI7pfyY4yQGxrPLqiGqEjexdIkoXUla8huJ
 eJ+zXtXELFHMDgQpD7GwNzhor7RcxpxUtQxSdi9vIaeWaR9rtndUJq61mTgg9my8
 /InCqCibzF6o7Ka0Lp0+pSOPXIzFiBAoQ7qhpwfLiaXZ9oRfpinJN9M16NUhVaTD
 QWogAhPtqEFMD9e0kthX4+ERn5pTU1yDM4Wq7i6JM1o9+pr70w0J+UcUDHI6j7mR
 pb9DffhOzsZL+0lSPWDRsvS8gJFoNqfE5Bwc561Y0zHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Cj8nPY
 SBw7K3FvFlk+HErdGVMmGm2WY/sykuNg4ZnDA=; b=N5pqXCvtPNSjTZmLwNNgK/
 Tse+xJHzohmGUP4t2mQJxiHbscByWPgE21ImI8hXBdpNmR4CE8rb2OiIatfStJBp
 69xwbM8zCy1L8hTv+iOTL5jgovRusg4XKpg9McR8ak9tV5rg7mWJE1S1BIJNty89
 Az4bWiykkBuyuLokzr6nMuKdPH41FJflEthvHeIyVSw0klkm5TkxC+GxXIb6729o
 eI1rknInFT0KpklYjsbn+b2GyzTq0z7kz2mkG/coHhCXGBes8FhFK5FEidkw0XW8
 V88Lsw8vwwH/3KAtLMQzvev58goTpo7QU0X1+bAXsmLVwRhS2BEZO5SoBo+WPQpQ
 ==
X-ME-Sender: <xms:U0HGX7dldAF2offYs9hgqQtodl4LzdftRxuytmbn4Bzg01cA9qT69g>
 <xme:U0HGXxPVm_CK4zGmFi5dzEP1hOOy4v8tV9xkA1LscXQfynJN1hr-SdTORSLVdV4D4
 ONoSjsnhIU2rsaaAKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeivddgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:U0HGX0gjrVJIe0ueIEa6FjgXhOie06zenus-BJLN1oU1KXQLIzEzdA>
 <xmx:U0HGX88hrvzze2GoeA29yh_L-sIfHQUmz8eW1e5CmyvhBp_D8pOJWQ>
 <xmx:U0HGX3sjnPFjFud_2yoAr_FAZRkCmaepPTbziYx7C69sD1awtnYJLA>
 <xmx:VEHGX9Bti4wefbCIuWz9YMK-hgoIvOmiJSdzy4fcxglLQ_-kYQ8yTg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4A0053280060;
 Tue,  1 Dec 2020 08:12:51 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 0/7] drm/vc4: hdmi: Support the 10/12 bit output
Date: Tue,  1 Dec 2020 14:12:42 +0100
Message-Id: <20201201131249.438273-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 02 Dec 2020 08:19:47 +0000
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
Cc: linux-rpi-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here's some patches to enable the HDR output in the RPi4/BCM2711 HDMI
controller.

Let me know what you think,
Maxime

Changes from v2:
  - Rebased on current drm-misc-next
  - Fixed a bug that was dropping the refresh rate when the bpc count
    was increased

Changes from v1:
  - Added the coccinelle script to the first patch
  - Fixed the pixel_rate ramp up

Maxime Ripard (7):
  drm/vc4: hvs: Align the HVS atomic hooks to the new API
  drm/vc4: Pass the atomic state to encoder hooks
  drm/vc4: hdmi: Create a custom connector state
  drm/vc4: hdmi: Store pixel frequency in the connector state
  drm/vc4: hdmi: Use the connector state pixel rate for the PHY
  drm/vc4: hdmi: Limit the BCM2711 to the max without scrambling
  drm/vc4: hdmi: Enable 10/12 bpc output

 drivers/gpu/drm/vc4/vc4_crtc.c      |  22 ++---
 drivers/gpu/drm/vc4/vc4_drv.h       |  14 +--
 drivers/gpu/drm/vc4/vc4_hdmi.c      | 147 +++++++++++++++++++++++++---
 drivers/gpu/drm/vc4/vc4_hdmi.h      |  21 +++-
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c  |   8 +-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h |   9 ++
 drivers/gpu/drm/vc4/vc4_hvs.c       |   8 +-
 drivers/gpu/drm/vc4/vc4_txp.c       |   8 +-
 8 files changed, 190 insertions(+), 47 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
