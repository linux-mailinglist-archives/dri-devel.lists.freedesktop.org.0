Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 429D247590B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 13:44:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B453210ECBA;
	Wed, 15 Dec 2021 12:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1846610ECB7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 12:44:41 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 7D0232B0024D;
 Wed, 15 Dec 2021 07:44:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 15 Dec 2021 07:44:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=HrbpVFfsXC7q4
 fkEMtOWIoXHxQ21FQNgxcb3cRwrCXw=; b=dqsdFuKZeZbcDdwo7zkzKzkXOOSfe
 qa/nAtsgpVP+JiSYls/cFPWrhwpIrYEKrHvgJ0rUMU6kf7lkcC1RxkaAZ4NUF8Ud
 4E5YL+6uPLxHEdnIbIEKI07ub6oEsCMnc+gwOU6ei4dKikQu+0PqpVync5N8q3SR
 ovjvBvs4HxliYclwp8oo/rAXZwsxg8MoTSWmseqFdyGyXF4bGEWqXHQg/lQWJa0D
 G1Oo7uIIrpGkCvfo+ffQ6P466eGDwU/deXaJY3XKixdEJo+Q0JJGqmKE8twFbSkz
 BStqUgYyX5aSZvlf1+BELDnbiRf38bp77rYDI/OYcKl3YNMKQ7tm53W/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=HrbpVFfsXC7q4fkEMtOWIoXHxQ21FQNgxcb3cRwrCXw=; b=Ghl/kOrf
 OtklGoRbUJBaqjIz5Cod9xdqTZwRAdrjXIn3Hu/kVksuENlC6yq3V3kqKN9PHyZB
 5weXubYMPbyAt9znrA88ItJmj6UItf0kYL/MoBQNn5reD0mk8OnVmxYEPtyh9kl5
 r13k6LtkSgObe/52OlBva/aeiZ1ZsWXVLFF5VtfFV51BU4xiEQVgpXrMY+FMfk7x
 Zc1mYArQA14uGckwGNgHOv2aAvHOpCbgleAm2YoZ+5GqgB7A44YXsIU9uF0wImvd
 lrgdlV41vtusO/uisynfPSPoBjDahyL5ieJrIYFaWQUmiU84yjoHRAd2j0qPAgIJ
 EhohRkhBBWVb4A==
X-ME-Sender: <xms:NuO5YfVaXuw1iPL3r7x1ftzJC5iObhu60gBAj8UYDfTz6Zx1GFyyhA>
 <xme:NuO5YXn0tgGood10VhOCKOIbKG0Wc1c1QKU6DZp3njt-XLT6Eowo9d_gIfORuzXvC
 DYENVuB8Ds98gyAmuI>
X-ME-Received: <xmr:NuO5YbYld19-B4DqrngpHbMwrJX8NMK7Ah0BQMo0oxCng8xZqILwqYfSR7K12d7gE-jtUfBiJWcWH2OS--LTjtXcqACwEuVaGAJpDVY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdeggecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:NuO5YaX-R46E9pL_6XcoYHeAH7IzBgQmRav0HqK7G27Y4fOe19DK_g>
 <xmx:NuO5YZluz1UpqSOZDM4xzg_Bd0sh2sQl4vNMfZ8lm1Ddjqv89HmCRA>
 <xmx:NuO5YXcpogpM6H1hydXz_rqmF3OMNqv_TtMmrq5NbtFxqMhNzGiIZw>
 <xmx:N-O5YSfZQnYdz_IM4G2MOvQQlnLyzAoFwqkR7mf0ET3dqhdi0I7yiVwPJQU>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Dec 2021 07:44:38 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 07/14] drm/vc4: hdmi: Define colorspace matrices
Date: Wed, 15 Dec 2021 13:43:59 +0100
Message-Id: <20211215124406.340180-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215124406.340180-1-maxime@cerno.tech>
References: <20211215124406.340180-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current CSC setup code for the BCM2711 uses a sequence of register
writes to configure the CSC depending on whether we output using a full
or limited range.

However, with the upcoming introduction of the YUV output, we're going
to add new matrices to perform the conversions, so we should switch to
something a bit more flexible that takes the matrix as an argument and
programs the CSC accordingly.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 79 +++++++++++++++++++++-------------
 1 file changed, 50 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 682c3c907cbe..7fdb49e790f3 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -775,6 +775,52 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 }
 
+
+/*
+ * If we need to output Full Range RGB, then use the unity matrix
+ *
+ * [ 1      0      0      0]
+ * [ 0      1      0      0]
+ * [ 0      0      1      0]
+ *
+ * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
+ */
+static const u16 vc5_hdmi_csc_full_rgb_unity[3][4] = {
+	{ 0x2000, 0x0000, 0x0000, 0x0000 },
+	{ 0x0000, 0x2000, 0x0000, 0x0000 },
+	{ 0x0000, 0x0000, 0x2000, 0x0000 },
+};
+
+/*
+ * CEA VICs other than #1 require limited range RGB output unless
+ * overridden by an AVI infoframe. Apply a colorspace conversion to
+ * squash 0-255 down to 16-235. The matrix here is:
+ *
+ * [ 0.8594 0      0      16]
+ * [ 0      0.8594 0      16]
+ * [ 0      0      0.8594 16]
+ *
+ * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
+ */
+static const u16 vc5_hdmi_csc_full_rgb_to_limited_rgb[3][4] = {
+	{ 0x1b80, 0x0000, 0x0000, 0x0400 },
+	{ 0x0000, 0x1b80, 0x0000, 0x0400 },
+	{ 0x0000, 0x0000, 0x1b80, 0x0400 },
+};
+
+static void vc5_hdmi_set_csc_coeffs(struct vc4_hdmi *vc4_hdmi,
+				    const u16 coeffs[3][4])
+{
+	lockdep_assert_held(&vc4_hdmi->hw_lock);
+
+	HDMI_WRITE(HDMI_CSC_12_11, (coeffs[0][1] << 16) | coeffs[0][0]);
+	HDMI_WRITE(HDMI_CSC_14_13, (coeffs[0][3] << 16) | coeffs[0][2]);
+	HDMI_WRITE(HDMI_CSC_22_21, (coeffs[1][1] << 16) | coeffs[1][0]);
+	HDMI_WRITE(HDMI_CSC_24_23, (coeffs[1][3] << 16) | coeffs[1][2]);
+	HDMI_WRITE(HDMI_CSC_32_31, (coeffs[2][1] << 16) | coeffs[2][0]);
+	HDMI_WRITE(HDMI_CSC_34_33, (coeffs[2][3] << 16) | coeffs[2][2]);
+}
+
 static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 			       const struct drm_display_mode *mode)
 {
@@ -786,35 +832,10 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 
 	HDMI_WRITE(HDMI_VEC_INTERFACE_XBAR, 0x354021);
 
-	if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode)) {
-		/* CEA VICs other than #1 requre limited range RGB
-		 * output unless overridden by an AVI infoframe.
-		 * Apply a colorspace conversion to squash 0-255 down
-		 * to 16-235.  The matrix here is:
-		 *
-		 * [ 0.8594 0      0      16]
-		 * [ 0      0.8594 0      16]
-		 * [ 0      0      0.8594 16]
-		 * [ 0      0      0       1]
-		 * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
-		 */
-		HDMI_WRITE(HDMI_CSC_12_11, (0x0000 << 16) | 0x1b80);
-		HDMI_WRITE(HDMI_CSC_14_13, (0x0400 << 16) | 0x0000);
-		HDMI_WRITE(HDMI_CSC_22_21, (0x1b80 << 16) | 0x0000);
-		HDMI_WRITE(HDMI_CSC_24_23, (0x0400 << 16) | 0x0000);
-		HDMI_WRITE(HDMI_CSC_32_31, (0x0000 << 16) | 0x0000);
-		HDMI_WRITE(HDMI_CSC_34_33, (0x0400 << 16) | 0x1b80);
-	} else {
-		/* Still use the matrix for full range, but make it unity.
-		 * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
-		 */
-		HDMI_WRITE(HDMI_CSC_12_11, (0x0000 << 16) | 0x2000);
-		HDMI_WRITE(HDMI_CSC_14_13, (0x0000 << 16) | 0x0000);
-		HDMI_WRITE(HDMI_CSC_22_21, (0x2000 << 16) | 0x0000);
-		HDMI_WRITE(HDMI_CSC_24_23, (0x0000 << 16) | 0x0000);
-		HDMI_WRITE(HDMI_CSC_32_31, (0x0000 << 16) | 0x0000);
-		HDMI_WRITE(HDMI_CSC_34_33, (0x0000 << 16) | 0x2000);
-	}
+	if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode))
+		vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_limited_rgb);
+	else
+		vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_unity);
 
 	HDMI_WRITE(HDMI_CSC_CTL, csc_ctl);
 
-- 
2.33.1

