Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6473329E60F
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 09:14:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3636E89D;
	Thu, 29 Oct 2020 08:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1241E6E512
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 12:41:11 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7CA9658012D;
 Wed, 28 Oct 2020 08:41:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 28 Oct 2020 08:41:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=IkmeIQpmF+jfh
 U/2m4u3cBU/jAxQu6NxvXUChDBnViU=; b=MnG6587tUm95xoi+Rgmokp/3mZ59A
 EPa79QE8rW3gbh75nmKwXXCbD97HrBaQMyoq/PT3UcJEPO0Ebpl35laBrqaRv94q
 ipqo4jhXDy5r8CWJIb+3a448o1dCljNw1p/gOD29udsrynP5OjzGPKY6/GH8Wn5A
 ae0561NGPLCgBj/FadzVBxI77mpL4PDzN12t1DY7yuD14IBCktM90avl/JcIzosK
 vvFLHoizCCZwgXu+8insFgU6uiXXflrvDi2/tyXG3dgE8St1/1nH5V5/XByd7EvM
 ryprLl0ygbaV8YtbJVfOc68gNRMWiuFnzTlHHthQMEYRWlLVJ9YptSZxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=IkmeIQpmF+jfhU/2m4u3cBU/jAxQu6NxvXUChDBnViU=; b=ZdVXbQgs
 4ItRi9FR/Qbv6dbRBhuXnRSDEHNzYf9qeKW7/i9wbXyC94/4kbsUxQzZJIimQ7Y1
 f6pZykqR+P08u8vvkF9t6H1jpE26cSPULsZTnxftfBUnYRyblVfpgkgoeLbpkV11
 nHNB+HnAClH2nXXfruVEHaC/VLuXtm+zkB335jHUcD36zwXnZWi2c5E7U23YGHvE
 DNkV0gEYKaIENY7AqN8QlL5emk3QJdCk5mPaGKHLSEjXzjpNIOGqiWrrFlYsboyb
 hzcp+r7EFj6X+9pYm3NFOLQt+qdlzylDgTZsN7I6naic1MaHQo6MYr+tsmZodZi/
 EgXIPNg5ODEuMQ==
X-ME-Sender: <xms:5maZXwJ-IEMtNBumHxiughYhhX3TPCvQMpIODNV8sqx6cRgnLr117w>
 <xme:5maZXwKP2fO_O9K1Q8QJHiaRnq8KceIXohoT2yYurT_o5Tn4XUUhczFaj_4zZoHE8
 DsujBUfgzaHA8qSyk0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrledugdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:5maZXwsIVtOvLhh99iJkBDM1FF6vuO0URfOi4qAGS-TpB2vnDRHkCw>
 <xmx:5maZX9a64n_GdRynKn_t7fquVPI4E6Rgp1ReJXeXk7APhO6U-OqVzA>
 <xmx:5maZX3aV8TQ4rgPIpS7yNddajq56bCHIz6C-mMUCHBC8Pal9z-fa9A>
 <xmx:5maZX4KjVSbyK9ucJaVdsUrIYhGcfCMCO72KKZyuxERwTeqt7Bns2g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id EDBCD3280059;
 Wed, 28 Oct 2020 08:41:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 3/7] drm/vc4: kms: Split the HVS muxing check in a separate
 function
Date: Wed, 28 Oct 2020 13:41:00 +0100
Message-Id: <1f97f4d1dbe6801d6bbdff2667f6a2f0068c21c7.1603888799.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.3eb3532def69f3610b18104e45b7274bbdc1b0a0.1603888799.git-series.maxime@cerno.tech>
References: <cover.3eb3532def69f3610b18104e45b7274bbdc1b0a0.1603888799.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:12:48 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The code that assigns HVS channels during atomic_check is starting to grow
a bit big, let's move it into a separate function.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 80378c74fcd6..4aa0577bd055 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -612,13 +612,13 @@ static const struct drm_private_state_funcs vc4_load_tracker_state_funcs = {
 };
 
 
-static int
-vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
+static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
+				      struct drm_atomic_state *state)
 {
 	unsigned long unassigned_channels = GENMASK(HVS_NUM_CHANNELS - 1, 0);
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	struct drm_crtc *crtc;
-	int i, ret;
+	unsigned int i;
 
 	/*
 	 * Since the HVS FIFOs are shared across all the pixelvalves and
@@ -691,6 +691,18 @@ vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 		}
 	}
 
+	return 0;
+}
+
+static int
+vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
+{
+	int ret;
+
+	ret = vc4_pv_muxing_atomic_check(dev, state);
+	if (ret)
+		return ret;
+
 	ret = vc4_ctm_atomic_check(dev, state);
 	if (ret < 0)
 		return ret;
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
