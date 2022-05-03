Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B6651840B
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 14:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E10010F93E;
	Tue,  3 May 2022 12:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F28210F94D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 12:14:31 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B64D8320098C;
 Tue,  3 May 2022 08:14:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 03 May 2022 08:14:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1651580069; x=1651666469; bh=Tm
 6JrLqhk9d5BsEkQm8RAlEG/1g0U8l/6tdWX5EIXgo=; b=arh+MCOR6F6GMpzmCk
 4bJO4NgtLecyKNMSWAda0/pAL3JS+nGsV8sPN+KMmgZkrLhpVj0RYeXypIsjO+F4
 rSrCFuVWrmnPid6kuP4VO+aYb9q2oQiTw7yglxCaAea8A4L8b7ntvSpd2ssnA85b
 sSptGtPQwnM9ktJBKEym0T4EFogotyLK7peme4allFspYJAzUhsq0xixmfofSW/Z
 JKZaKuKaHsg5LQ3YWN1q4/9oojxvOq14Mb9eM2rGgDDF0n2Na6Tw6CjoLcgasImu
 4EsAlKlPWF+U3Hot5dOlMMvBdMyMwGnl91IBe2I8BfoT1hA8waPSAf5RnEF0Lcs2
 V9WQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1651580069; x=1651666469; bh=Tm6JrLqhk9d5BsEkQm8RAlEG/1g0U8l/6td
 WX5EIXgo=; b=pQHVdp4PI2G2zK9bdQKZWfR0gpR+bjJso1lCY+/baZszEmCLkbQ
 VqQtZVRnEzQ50D29LtcQChxMNwF0uUzBXF5WylJBvWRDZkK93JQunaqBsfR6QJxL
 0siViZbsI7QgON5fMA5RLPlMsoxgkqAHe7Pr7Jq8aSrKUK9zcQcRGdoRckey/ANY
 SF2xMQ/scxj5Teksmq/vm61kQBR85wj1gAqfxiqJT8Dnzt4YDjrK3x8ptStyj1MU
 2eMTOAxb09+OeQ9zDH4YNxcEnUPMd4bpzVNiefcnM+0AELaQKYAH+X/Md9dJzR6S
 UPxm/wByaGekXczwZKUeryxmDKs0ytymZtg==
X-ME-Sender: <xms:pRxxYj4cW8iKvJNbQw9sAK0Ccg7IJ_G1AIRfAoLKJDsDftfpOb8H2Q>
 <xme:pRxxYo7WSD-5VyCjarEAJMH2GehWPiiDrJ__jiDiPhRSQb_nnryeDv0yPBifcM4JA
 ytO_LaGbb7bhFmLOck>
X-ME-Received: <xmr:pRxxYqdGD0lKXwiYVjPvDs9UaHRPL5lG5Qm95et0EqRnYC9woedE-lIHQDUuZvZs10w_OL_ZGbrz3hyRMF8A_5ueIPJccZROmnYNuk4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejgdeglecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
 jefhnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:pRxxYkKL0g34mUzpv4jw4SGCofW0_-eAP6G_PhGn2Rm-e0mreqYjZQ>
 <xmx:pRxxYnJb3uSzWD4L6-7_L1lsYzMztvojiexC0DPDNTJIf3dVdEC4_w>
 <xmx:pRxxYtz30-Lsf99CxjtnQNuYC2Yup9VvFvfjLw7G7pO2arteSArApg>
 <xmx:pRxxYti4eZYYHZt9wJNX0o1jSs09ZNjE9xG5_CSHzkRFdCtOrwY3nA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 May 2022 08:14:28 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 12/14] drm/vc4: crtc: Don't call into BO Handling on Async
 Page-Flips on BCM2711
Date: Tue,  3 May 2022 14:13:39 +0200
Message-Id: <20220503121341.983842-13-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503121341.983842-1-maxime@cerno.tech>
References: <20220503121341.983842-1-maxime@cerno.tech>
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index bd85b1f13cee..e0ae7bef08fa 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -923,16 +923,31 @@ static int vc4_async_page_flip(struct drm_crtc *crtc,
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
2.35.1

