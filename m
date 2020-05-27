Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF791E5969
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D016E47E;
	Thu, 28 May 2020 07:44:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D1C6E33C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:51:25 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4D6D65814F4;
 Wed, 27 May 2020 11:51:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:51:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=IuU4CyqN1WTD2
 W0jNMeAupQpwuiyhjcP/tC7268QG+E=; b=LrgeF09U5T9+MuSN6cTRJcoGpbLfG
 qamBEaHvSSORb2kv6gnbY2KYIqvt3LEbk8YVGxmvDo+0ojJn9u19/nGFUPX/lGYI
 LhXdCwYVa65AMZyuTUhwb/lAev/eV77jKhbfeBIZqcCNqt5/LWEGZNIAX4vxQ+x5
 XxFcVXHpek1HTwCzhEhx8Kppxfvfm07nW8Fp0EEXz/ZUxcPnnqP5PqVD0hfNFXFt
 KDhF+7Cu1gO85HTRlM2fvEFp/E+guayJkCA0ixaGrYKov8b2WWZco7cJOS0qY3jj
 25YeKFygdD6es6rnLWLQH9P3agcUsFoCXCvWrpnr0SBq97gr9PJRPAwow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=IuU4CyqN1WTD2W0jNMeAupQpwuiyhjcP/tC7268QG+E=; b=0a4bM5Vc
 QTJwpp736BZUNNisnncdEBdhdag/OzYYomHLEOyEQorAGiR9N0+mmELPmuKAFrdk
 T/fkQ5KWmtP8K8lhADm52LYkKSW/N+bl12CwWU9ZlcqaglTqwd2U0kTMHSR5Dce0
 miZKexMQRQW9bTbmXDeLTa95XIKllUH79YMoqnIC25P10I1d2/dIRx88JKrwI7L+
 r/T5l8fK2aP0x++7jHUMSEHBnIYl4x30bWu+6x0wGrgLj0VFtFEAyiVKWADD1X9g
 uHobX3wVVXmpC7d7irhmr3IRuaijAruu96+PSkHx3iSxHQIb00jYYBN+ZRQsxjh3
 d44CFAYrspCRyQ==
X-ME-Sender: <xms:fYzOXsklk5C_8E-ib88-Qm00w6Bwf0oR5GIXj8F7ELlQVYkoZojYYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepheelne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:fYzOXr3I2y0bbXEb_QjLnWZHf-wGVAenyTcQw_CVS5sTgMRSA-46PA>
 <xmx:fYzOXqqeiuiwNQoqv-dkPl3LMuc_NIBXLTw3wOPwxtP1noABopBO1w>
 <xmx:fYzOXom2LYOcoPO7vauftYCoohJYgSiQ7xTqh6OQee0r8q-tYdAs5g>
 <xmx:fYzOXjn8bCQ0mHuxzoKHMPsCpOutoBy_ONFV8l_TT5HMua2t35cMDg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E412A30618B7;
 Wed, 27 May 2020 11:51:24 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 081/105] drm/vc4: hdmi: Add reset callback
Date: Wed, 27 May 2020 17:48:51 +0200
Message-Id: <1cbd5fcbc9b0bcc604990b61c8646a15cbba0c81.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:53 +0000
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The BCM2711 and BCM283x HDMI controllers use a slightly different reset
sequence, so let's add a callback to reset the controller.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 31 ++++++++++++++++++-------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  3 +++
 2 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index aa7b24267a0b..dceff505c840 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -69,6 +69,21 @@ static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
 	return 0;
 }
 
+static void vc4_hdmi_reset(struct vc4_hdmi *vc4_hdmi)
+{
+	HDMI_WRITE(HDMI_M_CTL, VC4_HD_M_SW_RST);
+	udelay(1);
+	HDMI_WRITE(HDMI_M_CTL, 0);
+
+	HDMI_WRITE(HDMI_M_CTL, VC4_HD_M_ENABLE);
+
+	HDMI_WRITE(HDMI_SW_RESET_CONTROL,
+		   VC4_HDMI_SW_RESET_HDMI |
+		   VC4_HDMI_SW_RESET_FORMAT_DETECT);
+
+	HDMI_WRITE(HDMI_SW_RESET_CONTROL, 0);
+}
+
 static enum drm_connector_status
 vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 {
@@ -363,11 +378,8 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 		return;
 	}
 
-	HDMI_WRITE(HDMI_SW_RESET_CONTROL,
-		   VC4_HDMI_SW_RESET_HDMI |
-		   VC4_HDMI_SW_RESET_FORMAT_DETECT);
-
-	HDMI_WRITE(HDMI_SW_RESET_CONTROL, 0);
+	if (vc4_hdmi->variant->reset)
+		vc4_hdmi->variant->reset(vc4_hdmi);
 
 	/* PHY should be in reset, like
 	 * vc4_hdmi_encoder_disable() does.
@@ -1289,14 +1301,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 		vc4_hdmi->hpd_active_low = hpd_gpio_flags & OF_GPIO_ACTIVE_LOW;
 	}
 
-	/* HDMI core must be enabled. */
-	if (!(HDMI_READ(HDMI_M_CTL) & VC4_HD_M_ENABLE)) {
-		HDMI_WRITE(HDMI_M_CTL, VC4_HD_M_SW_RST);
-		udelay(1);
-		HDMI_WRITE(HDMI_M_CTL, 0);
-
-		HDMI_WRITE(HDMI_M_CTL, VC4_HD_M_ENABLE);
-	}
 	pm_runtime_enable(dev);
 
 	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
@@ -1409,6 +1413,7 @@ static const struct vc4_hdmi_variant bcm2835_variant = {
 	.num_registers		= ARRAY_SIZE(vc4_hdmi_fields),
 
 	.init_resources		= vc4_hdmi_init_resources,
+	.reset			= vc4_hdmi_reset,
 };
 
 static const struct of_device_id vc4_hdmi_dt_match[] = {
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index f7d0ca9447d2..93695674c2d3 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -35,6 +35,9 @@ struct vc4_hdmi_variant {
 	 * clocks, etc) for that variant.
 	 */
 	int (*init_resources)(struct vc4_hdmi *vc4_hdmi);
+
+	/* Callback to reset the HDMI block */
+	void (*reset)(struct vc4_hdmi *vc4_hdmi);
 };
 
 /* HDMI audio information */
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
