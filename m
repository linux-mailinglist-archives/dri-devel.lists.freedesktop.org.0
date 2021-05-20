Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BBF38B276
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 17:03:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE53A6F475;
	Thu, 20 May 2021 15:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26EB96F478
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 15:03:52 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 1D6F11607;
 Thu, 20 May 2021 11:03:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 20 May 2021 11:03:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=ZSOENnTiLGLdff4JsuqIEAXcPs
 1QHU6CWQYRKDrgVNk=; b=uqpyCjWe41EggNG6qLYUmT+wrcp/iebnDgvpbAWIuI
 WDzdvk3HumsA/RIxo5Hq3hQp8ZM1mw9zPdYEKgjqjcyyyO2fTxgrSO3ombfMqtPy
 bErSBu+4WrL8OxKSPsrh+FsZ6mdISNJ9XPGEK90Qr5fW+O1Imw6+2KpprgHM+k4I
 ydqQUOjg+KVYhep7VJLrXISBIk7Wbm/VtoGnzLClMPr1Ru6b3RJUsnkqLBvu+iyj
 j+Oz2LvIUvMGw21lQcer5QTHSdFYZFCo3gpmIc/9j1jwJ3zcB8iYCRu9vnRizMQA
 BJENrMTAVDL5yI9RNbgeeTUYfQ3z5fYYcrVmao0+CSBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ZSOENn
 TiLGLdff4JsuqIEAXcPs1QHU6CWQYRKDrgVNk=; b=aM5tsgfh+NQlur2c1CezDD
 UbrCxBKB2HwqFSyBzqyJsNu9Pt0SO6JuMbF1/9jqr7kVJ31Dowt0CArAAvBOEzek
 h/i28EYo55CtSjUZFQXon5XcOJL+wiqOQMQdpooCwsDosWCrN8gf6GOn5gWf2H5M
 QmbMDDI+C6b62dvhAkpBa8G7D+KvRs9K6Vj+HolGoSYZ9ljPgKhmQVkmdV9xCICN
 NpvtuK5vJIYilNduvxrre0AIEFHNglFV/Z6oavOzxIQa+uxlcEaVLxGNHWIlVvsn
 9F3HcjJvtHWad70ps4m3W2AFCA1+0gGd8pABF9GV416QD7Lsc8xdsHHHQd0du6yg
 ==
X-ME-Sender: <xms:U3qmYOIHDYkdjZaJUlliHsnMhDAVDMjuV3LMb1jBA8DRcP5Qq5B-wQ>
 <xme:U3qmYGKD75dEXMdKmkBCNvDQYuKVz0NiLDTXthZUbU32EvxiXyUDutQmrDQ39tv62
 soKKZiX3rPh3w8vJU4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejuddgkeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:U3qmYOtUvfIzNyc2t1_PXpUbWGz5utw1F45-PM9xMUgpqYLi6013uw>
 <xmx:U3qmYDa2b8xeHMmIuYD0vdtIvP9gzDxz1D5b5gXRhzSxUqQ2Ggpb3g>
 <xmx:U3qmYFbdUHNT5js0WR2PrMX_p40YTqaHrMAGyzvxvoyHU9X0HZvJmg>
 <xmx:VXqmYNIraNF9SkDiZoAgT7SOCscJtCtN2aWL0Z1sbel5m6AKGUTQ4qOhIOM>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 20 May 2021 11:03:46 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 0/4] drm/vc4: Add support for the BCM2711 VEC
Date: Thu, 20 May 2021 17:03:40 +0200
Message-Id: <20210520150344.273900-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 linux-kernel@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,=0D
=0D
The composite output in the BCM2711 is dealt using the VEC. While the earli=
er=0D
SoCs were properly supported, it wasn't functional on the BCM2711. Add the=
=0D
needed support from the RPi downstream kernel.=0D
=0D
Maxime=0D
=0D
Mateusz Kwiatkowski (4):=0D
  drm/vc4: Fix clock source for VEC PixelValve on BCM2711=0D
  dt-bindings: display: bcm2835-vec: Add BCM2711 compatible=0D
  drm/vc4: Separate VEC compatible variants=0D
  ARM: boot: dts: bcm2711: Add BCM2711 VEC compatible=0D
=0D
 .../bindings/display/brcm,bcm2835-vec.yaml    |  4 ++-=0D
 arch/arm/boot/dts/bcm2711.dtsi                |  1 +=0D
 drivers/gpu/drm/vc4/vc4_crtc.c                |  2 +-=0D
 drivers/gpu/drm/vc4/vc4_vec.c                 | 27 +++++++++++++++----=0D
 4 files changed, 27 insertions(+), 7 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D
