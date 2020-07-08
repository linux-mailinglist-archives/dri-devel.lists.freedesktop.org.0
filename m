Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1701F219914
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:06:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC5D6E9CD;
	Thu,  9 Jul 2020 07:05:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B93CC89090
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:43:08 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id BA0CB2F2;
 Wed,  8 Jul 2020 13:43:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:43:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=3z1vhUekpXT6Q
 g/MZpaXLuYUmEvFHbtNlcabvjuHzko=; b=bOQyECrXLHeTBVAVdicKt13goNAqQ
 fjMEhGs53vD7Jucmct/cXRk7YHjiF3yHxe/Io0IkII/UentVf/Nlu8vD3svJyPJd
 8cU3qG+Qq4JlYS7E8k9ICZUkcgIjS65g7a+1haSghFcIix29VyZTk67Ji+hkAW/U
 yPuDO9098QvPUgKvy9eIvVMWLh/S/Zo7b4Kgel5OEYeSbmXV/TZqHdI2hrZ+Z4D+
 raXBFNJ87OfcL5YVZbHnFzAuewiQwA0B8YyJmxwUQ/0RQQrjDEYv0hXD7hOCgAdu
 D1kZHfPqcCnpx97MagL3vAzb8CiJ50UidCzUTd6IgnHaTq5yuh7fCHovA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=3z1vhUekpXT6Qg/MZpaXLuYUmEvFHbtNlcabvjuHzko=; b=j+Eh4poA
 hP16fZzLDmUj4xf0erjwiXM/Bo4LtRGIs6WW4kxVHn3VsrflVTjWSFOXmhSKW+aG
 UCEH5rftepphMuK2/dIdH0sktQ+YRu28OK1IY4qJ7T7GEiyJYNNoXjO2VbqC8oGo
 vVGjATdQCHibtc2+XunT3ZddA8s9S49jMuPbG7xU35E/nN5FNw/UrOohnbg1vudz
 XkTMU3UF+BiXk4LsFL67c35oIY1iQHHz6clkl3RZS2FnaauMDrIte/itd8FamcLx
 7lT+9nFRVF5E1KhOHv2c3+ee3GtfSGvUZOA4vs6Lhf1RZ6s90oTLauuNN/hHGTSA
 aieVJ+Hmsz+0Aw==
X-ME-Sender: <xms:qwUGXz7ojfi5wVk61lu56LWMXrTObBc_pLq4uH_8pnL7tplcZqeNwA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepvdegne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:qwUGX46yMXj_yedfCI6dp8tSkBXlRVh6jIS3rAMdtBpuu6bSQmBryw>
 <xmx:qwUGX6fy3ImwmjV8v78_4WY8CdTIWAcELyf82v7FgJjDLj--g-Anyw>
 <xmx:qwUGX0LH7P0cJPh1pO3daX9b8xpfn7k7FjTEStDtelyWOHGb-fnqnQ>
 <xmx:qwUGX0r8xALQJyOI4ZwEEEC0HWwhMA-xWYDHLfEl0rzoVSxljn7y9dtRI-M>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 032B830600B1;
 Wed,  8 Jul 2020 13:43:06 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 25/78] drm/vc4: crtc: Remove mode_set_nofb
Date: Wed,  8 Jul 2020 19:41:33 +0200
Message-Id: <8bfc2e06f1c2a1f01151880e62e816b3ee629a75.1594230107.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:03 +0000
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

On BCM2711 to avoid stale pixels getting stuck in intermediate FIFOs, the
pixelvalve needs to be setup each time there's a mode change or enable /
disable sequence.

Therefore, we can't really use mode_set_nofb anymore to configure it, but
we need to move it to atomic_enable.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 284a85b9d7d4..2eda2e6429ec 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -376,11 +376,6 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc)
 	}
 }
 
-static void vc4_crtc_mode_set_nofb(struct drm_crtc *crtc)
-{
-	vc4_crtc_config_pv(crtc);
-}
-
 static void require_hvs_enabled(struct drm_device *dev)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
@@ -433,6 +428,7 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 	require_hvs_enabled(dev);
 
 	vc4_crtc_pixelvalve_reset(crtc);
+	vc4_crtc_config_pv(crtc);
 
 	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_EN);
 
@@ -791,7 +787,6 @@ static const struct drm_crtc_funcs vc4_crtc_funcs = {
 };
 
 static const struct drm_crtc_helper_funcs vc4_crtc_helper_funcs = {
-	.mode_set_nofb = vc4_crtc_mode_set_nofb,
 	.mode_valid = vc4_crtc_mode_valid,
 	.atomic_check = vc4_crtc_atomic_check,
 	.atomic_flush = vc4_hvs_atomic_flush,
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
