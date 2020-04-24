Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F451B8002
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA696EB74;
	Fri, 24 Apr 2020 20:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A696E081
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:37:16 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id F38EB1455;
 Fri, 24 Apr 2020 11:37:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:37:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=BcKDLGebR5uRx
 0RzJYXWe29sQcio0KLwjb/aib1L50Y=; b=SeUpHJ1ENfN1PiQgDE0FHuXhRh7jm
 72psZbJlCYR/9l7zl5Y/ZarNjJdbG46uYP6NMUSyoS4mC983KOXx8VRN2H46Kin/
 bhSuZe8Wk2UmDifyZNF3B+4oZ1TllGkn0fHCuBt3f77cF3ByB3xIMgkGmTuTdnnS
 Ww3Jg6Nl5JiDpMTmyR0C0gnKJyS3vgfhebPIKGWxAm8+l0mmJVUWyOm2j8UlfBgs
 99/JP2m1lsD+UWmXwfYtBk7aQdsBxEp3S+H85fFIqoXC4G9KkmtFXTmaTdHDrTj+
 5FBGMQQDdZqbErE1ogtJBCnJKI7rCF5Be/klzK7qox6LH0n+0w2O+XaFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=BcKDLGebR5uRx0RzJYXWe29sQcio0KLwjb/aib1L50Y=; b=w0wKUfE1
 6eN6eS8IGfrugZjgEpVLgXNYw6DzNMIYIInu6w0TQQawXoPs9/jp6hQ2k2Dj4LUR
 RxbzCqxAHm94iEGP9MQfpW71XAeLK1qbvpYVXa4f6vm9t2i6QGS2kxMcISlpCiTi
 CTEpqpRvXkI6TjP/LsbAsYuYf0nbM+bvuEumamIKSMDqcV4t/K+AprH13q952k1X
 SbmdLM1HX7eF9JdiUDaBBurovMHjKPqa1INxBuKxt3HTPKQ8BYu4vJ+dYGVloxjG
 GL/HY2glI4cAukKfHnmu2rxA9/C9CCXGlLCitkOfWCsPF1DH6xTxNXEORl8Az2rj
 Rgfovxp7PwmHXw==
X-ME-Sender: <xms:qwejXqLcnq9mRyyyCUbSbUz555-ceszgLgckXqUWoi57rgsDf6qhzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpeejtdenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:qwejXmZyWgMtCBmemDJ0_sFRTbLhoWmn4u4_XW1Xe9ym6mt9yFqU-g>
 <xmx:qwejXltG_VvrGqsKRcxhtuQRKXhhEu0xgWLERVm-4o30Qx2rvl9mBw>
 <xmx:qwejXjvA74yMipWtODx1Esz5BkGmTLmuGu9hMKBzFuGXB6EXgNhJ9Q>
 <xmx:qwejXtX8Pnfb4vnJNh7FpqfzSoPCZoNuF5NDQxBmEoN9CpJD74hx8WeFkfM>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3C27C3065D9A;
 Fri, 24 Apr 2020 11:37:15 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 81/91] drm/vc4: hdmi: Add CEC support flag
Date: Fri, 24 Apr 2020 17:35:02 +0200
Message-Id: <985fee99e85cc6816f1500504d47f5cde8b6e32e.1587742492.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:08:26 +0000
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

Similarly to the audio support, CEC support is not there yet for the
BCM2711, so let's skip entirely the CEC initialization through a variant
flag.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++++
 drivers/gpu/drm/vc4/vc4_hdmi.h | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 1c612db1d22c..20b6af98abad 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1180,6 +1180,9 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 	u32 value;
 	int ret;
 
+	if (!vc4_hdmi->variant->cec_available)
+		return 0;
+
 	vc4_hdmi->cec_adap = cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
 						  vc4_hdmi, "vc4",
 						  CEC_CAP_DEFAULTS |
@@ -1468,6 +1471,7 @@ static int vc4_hdmi_dev_remove(struct platform_device *pdev)
 static const struct vc4_hdmi_variant bcm2835_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
 	.debugfs_name		= "hdmi_regs",
+	.cec_available		= true,
 	.registers		= vc4_hdmi_fields,
 	.num_registers		= ARRAY_SIZE(vc4_hdmi_fields),
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 22100820c81b..20e0f5498f1e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -33,6 +33,9 @@ struct vc4_hdmi_variant {
 	/* Filename to expose the registers in debugfs */
 	const char *debugfs_name;
 
+	/* Set to true when the CEC support is available */
+	bool cec_available;
+
 	/* List of the registers available on that variant */
 	const struct vc4_hdmi_register *registers;
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
