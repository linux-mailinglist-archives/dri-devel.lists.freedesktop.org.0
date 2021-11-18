Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D83F455933
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 11:38:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6006E9E4;
	Thu, 18 Nov 2021 10:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40E16E9CE
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 10:38:31 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3AEBB580912;
 Thu, 18 Nov 2021 05:38:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 18 Nov 2021 05:38:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=n6tECbdVHGFJp
 pt4DWOgVqTXNdho982dU/dp9g+/+x0=; b=eu3LDkgEjV2KJXt4IFF9j5PCdPYJL
 6LZnrPfxAj928cWmNI2hM742AaNcWu+CU9XELMj96kgRGP0gwl9QobgW+ErjsTEV
 lKbVhcV7AAY5buNSQQIdv1HlWKSad2lQF435JN7eo6iy0RJNsa1v46IN4gUXZJGa
 XKH7wLU7UoW+HEGTxdECFGB/vvgZoNWEQaYaVdR93CFS6sy1H34ClKLezYbwnnwe
 LUVJ3bjS0mz/yd8Gid6cDJVZRSrIsIjDno5dyPdYeigb7p2b6tF6LvDw3YuGNqfn
 SdGnbbvM34b3qhODbtVh9jNtlyDtEhPmLWLYihqAZYiJavxLqDN+HrYkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=n6tECbdVHGFJppt4DWOgVqTXNdho982dU/dp9g+/+x0=; b=D0InrJzR
 WrGqVDtqfTjgidDD3DSYJXCFRNkRGKplVexNo2i0cSB3mRNi6aGDymP1dZqMd5Tr
 1WRArD4pgsVck6YU7sKIloJffMIgB7iHNyxSV0bol8XcB0JMZKn5yzy5gWjUPWTv
 hIxY48lM1vZJp4bX/dWSqqmPkGiAppkldQV4bkJDI98GXJ6WbYD8scpG5/toB0J2
 9XHjFDyxo3pHbpN2gpYI1RmRBJnjDlnknWTnL8Yilnteai5JhIB/CYhaboj+OQ0w
 xnfITxqnYRfimDn2+HU5wEmVenEuppeMhF1y/timrM6OhZuXGWPZRee22swn/ayJ
 99DNeSyLqpx1Ig==
X-ME-Sender: <xms:Jy2WYa32Dxc_AfvtBk4vye3hx9yQ1_TCCu6jFRuu5GaEN8qoz2-h5A>
 <xme:Jy2WYdGR3d44qqxay7OCwJAm6xOO8v1l14-GIjvHadWBvwthTfQSJrxtA2cEfUZoa
 YcvOwzewIDDV7LQW0o>
X-ME-Received: <xmr:Jy2WYS40ZZfTSO_2CyOr13xJZjW-P4xWRHvxwxruMwpMu2sDXED8HRcDofkRtYrpRbQMCQTyvqFKhSzMa7nbo6P-_wTZeC58qZjA_hBnmUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeigdduiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Jy2WYb33Q6a98yE8zPPXdJX8_oHnwyGl3zPZtAR5FDJKtpzqSDCF6A>
 <xmx:Jy2WYdENBGBHj0kaCtm7ZDPswFJ5lFa11hPU5zhNRX8wH39I_wg2BQ>
 <xmx:Jy2WYU9EtgHdibgSpvM4n3hA1PpxMfciH5z4R1B69yB5mtkU4U95zg>
 <xmx:Jy2WYcCB6v0aXMYQb7oyL7wEHC_rKBR2i790mvma3KAufVb2HUUVgA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Nov 2021 05:38:30 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 06/13] drm/vc4: hdmi: Remove unused argument in
 vc4_hdmi_supports_scrambling
Date: Thu, 18 Nov 2021 11:38:07 +0100
Message-Id: <20211118103814.524670-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211118103814.524670-1-maxime@cerno.tech>
References: <20211118103814.524670-1-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Even though vc4_hdmi_supports_scrambling takes a mode as an argument, it
never uses it. Let's remove it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index b00fedb5b880..9a7864440d95 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -573,8 +573,7 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
 	vc4_hdmi_set_hdr_infoframe(encoder);
 }
 
-static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder,
-					 const struct drm_display_mode *mode)
+static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder)
 {
 	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
@@ -602,7 +601,7 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 
 	lockdep_assert_held(&vc4_hdmi->mutex);
 
-	if (!vc4_hdmi_supports_scrambling(encoder, mode))
+	if (!vc4_hdmi_supports_scrambling(encoder))
 		return;
 
 	if (!vc4_hdmi_mode_needs_scrambling(mode))
-- 
2.33.1

