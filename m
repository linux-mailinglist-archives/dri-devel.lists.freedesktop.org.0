Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DCA54660C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 13:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723A810EB52;
	Fri, 10 Jun 2022 11:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4141D10EB52
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 11:52:15 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 9EF425C01A9;
 Fri, 10 Jun 2022 07:52:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 10 Jun 2022 07:52:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654861934; x=1654948334; bh=oE
 9vHcWX3KK02Q0aD/SGkLSQJ5+EOGlPNr+sm3He3CU=; b=eb/PHYy3XKkEkqMIgX
 pKOKsnnQVrkVrekPz/BzLsBf0I3hfVJI/VBSt8zvJd3h4m1dgr+NWa4MQyFlwo66
 KA2o6GFXTeoWILA55Xh5ZvhOBPJstP/m16II1Peo+TvrhKSpz67edgQtw5PMpgUI
 LSAKa8YyLZjxN3R7GMBx3IukuQ3fZJG+HTNebrlYThA3akDFSYbWt0TNMPv8KJrT
 pKFuaHYDk7upw0pBJq2EtICYOEDKIHUkXf2UFqb2nDMGDrAySfjIVmmkxSo2PeYX
 ZPfYUdjHyQW84Z7IJUj8lu4rL0sf+5fhcNdk2n1lOL3XkONMBdwYiiU26EM9ug99
 se7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654861934; x=1654948334; bh=oE9vHcWX3KK02
 Q0aD/SGkLSQJ5+EOGlPNr+sm3He3CU=; b=kPbXQ5sz/t4ICNjpJdFvOrijxl45d
 WkvuN0OUgKUaQ7kmSJvmI1jRCLExFO5Ag7UnZZCJOREhBQasoAys4d0sLjwJGH5k
 QmgsC0hsYiY8GUADNwmZqdjdqHPq0rfk5zIk2jRQ81kB2uApdzJSg7v4bsQ+nBFk
 CS/Yu84Nq/jgOi3wkuJs6dtC3J0tW8jwlDvG4zsBvHlmlvtcl54H9vCJIQ6rGzvP
 8zy6RoVxm4+h2qgPu7G6LxZdewGC4N5yFqCnTr+Q9tUWM9CuMwxlqcscPT6P9MWp
 u11xl2tsBE2K7vsQalXotcRgRpD/qNirjUjY/AyfofHbjK9KUTQBfNrAQ==
X-ME-Sender: <xms:bjCjYjTyT1siuFSH5UxD6dwSsXhHZJAbxTYxNPzwAm3xRFdijBRAUw>
 <xme:bjCjYkz0ilyDc1r1F6v6HjTIvcM1tZ7YW_hP7zZWRPE17Qx6Arn75xhA2PlhAatzz
 tuvYu7Lrcsy_X94Hpo>
X-ME-Received: <xmr:bjCjYo2kFlS0QW2RhYnBpk0xeHoI5pbciyHYAR-S_m-u6q1QGASQ3i1eSaVx8CG-cO4wXdSbbz-wHbawBsMiHQRZeO2Rs_ZU62tHERo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:bjCjYjAqWmImUBPHsanJvEtnT37Ewme_oStM3KB8phTKnZzTbnV6vQ>
 <xmx:bjCjYsjazqIRSFI0NLmT8r-uxEGEmPFbBCoYrHbc6G7OaIxg6dasLw>
 <xmx:bjCjYnpz6cvfTx3gp3rFLs4mWGIIP7B_SwnlgFc4rg_4BpMnybGQVQ>
 <xmx:bjCjYmaEoMlz0XPtjW3eMbOeXjnT0_vgnJt2LWksLsV5D5AKRTawvg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 07:52:14 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 12/14] drm/vc4: crtc: Don't call into BO Handling on Async
 Page-Flips on BCM2711
Date: Fri, 10 Jun 2022 13:51:47 +0200
Message-Id: <20220610115149.964394-13-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610115149.964394-1-maxime@cerno.tech>
References: <20220610115149.964394-1-maxime@cerno.tech>
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
Cc: Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The BCM2711 doesn't have a v3d GPU so we don't want to call into its BO
management code. Let's create an asynchronous page-flip handler for the
BCM2711 that just calls into the common code.

Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index c00fb964c534..a3c04d6cbd20 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -925,16 +925,31 @@ static int vc4_async_page_flip(struct drm_crtc *crtc,
 	return 0;
 }
 
+static int vc5_async_page_flip(struct drm_crtc *crtc,
+			       struct drm_framebuffer *fb,
+			       struct drm_pending_vblank_event *event,
+			       uint32_t flags)
+{
+	return vc4_async_page_flip_common(crtc, fb, event, flags);
+}
+
 int vc4_page_flip(struct drm_crtc *crtc,
 		  struct drm_framebuffer *fb,
 		  struct drm_pending_vblank_event *event,
 		  uint32_t flags,
 		  struct drm_modeset_acquire_ctx *ctx)
 {
-	if (flags & DRM_MODE_PAGE_FLIP_ASYNC)
-		return vc4_async_page_flip(crtc, fb, event, flags);
-	else
+	if (flags & DRM_MODE_PAGE_FLIP_ASYNC) {
+		struct drm_device *dev = crtc->dev;
+		struct vc4_dev *vc4 = to_vc4_dev(dev);
+
+		if (vc4->is_vc5)
+			return vc5_async_page_flip(crtc, fb, event, flags);
+		else
+			return vc4_async_page_flip(crtc, fb, event, flags);
+	} else {
 		return drm_atomic_helper_page_flip(crtc, fb, event, flags, ctx);
+	}
 }
 
 struct drm_crtc_state *vc4_crtc_duplicate_state(struct drm_crtc *crtc)
-- 
2.36.1

