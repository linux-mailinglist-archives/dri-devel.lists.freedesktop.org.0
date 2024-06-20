Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDEC910A6C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA09B10EAA9;
	Thu, 20 Jun 2024 15:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="p/EGHATv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f99.google.com (mail-wr1-f99.google.com
 [209.85.221.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0F910EAA0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 15:46:51 +0000 (UTC)
Received: by mail-wr1-f99.google.com with SMTP id
 ffacd0b85a97d-35f090093d8so772520f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718898410; x=1719503210;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qN9yQSNWubpdrCJXvCxGGAxBCCzCX1wrwSsYLMX4OZ8=;
 b=p/EGHATvGRM15IUZrFNB4Xy7IK2+SgPfQNwOz5AqCqJUE4f8EVcU4aD9NRCHJt7YW/
 6yL67FJ+fI1TdTuZkX6gcyEcYTAfpcAp5XGh6gSY+Sd0gsmipd/RCxm4WcUL39ylR4sF
 6frDapIVpXAoWteAKn64Wc2qveZqFRzg3VDluOKJJ38LIBqqLQFY2/Ir64PWRxNlvQ0x
 lZs0LgLQhiMckPpwkDB61vDiaJBvl36qHA0fAIXKLx3ejtAisZsoLKOPcLvTpD6Faw5i
 jt7tYByII+mynSDTVmsldT+60fHvpMSFHhVwTei34zfBS/SE8i5oSMmiUkmNT9ml73h3
 rjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718898410; x=1719503210;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qN9yQSNWubpdrCJXvCxGGAxBCCzCX1wrwSsYLMX4OZ8=;
 b=nVVN/k61phQYZVCuzjifSA2EtoHTd2xRalZlbDRMExl7PHKkypMWZ2ME5gxE1P5/m1
 h2faqwW+aSyLiOolcooSJggl8ReJqq6nOe45t3V+2mfVVlI2ykYSVjOuPimmRvdihr8R
 aNlcGgZh8VDXyEMv+wlOfLX3tKrMSYh12ASbKXdjDHl199Eto69wnDXqKkm1iLmaP/2Z
 NqxtcFBpLIVnr1r17i/PPXW7wQn4BUuO9CZtBXReEu0hhxKSEfsf2TGLlel5dPDutya/
 6W0wgti9/wnRKhRGQkKvVZlUIfYC1DU3GZb01Szt2Va1gfPaTqC99dsSa5IiXEZ5SOTa
 2ldg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX351Ps0OP0MHXrEbdXGdFgzAMHn1/obLQJfG8qPxwyQyORy5GvMls8R/pUVbow8yBfoBOh29z9P4N5gZArCEPBwCzQtkGGXZ9tY9/auRLv
X-Gm-Message-State: AOJu0YzgNSIBRr+4hMwWOKLgkeM96o9q6DlRf+E6O7ivb8BbvcEcdueX
 i/m5QReD90nOjanaiUvIFHwsPUZrXfCA/tol1nIZKYYE/J+nAqHiDofqZoFklck9QDzlVPdIytc
 bMF9qdv5VZq/+er3hVtjMYoWHIy8ehLIs
X-Google-Smtp-Source: AGHT+IHMQyKCXxexGnebHDKi6hlY2ifXiPqCCnnsiZMQ8v4WyYFynB7g2Q6RJ0bZ1w+qMuWZPmTSHnxtM8ls
X-Received: by 2002:a5d:5f8a:0:b0:364:3ba5:c5af with SMTP id
 ffacd0b85a97d-3643ba5cc94mr3685125f8f.61.1718898410066; 
 Thu, 20 Jun 2024 08:46:50 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 ffacd0b85a97d-360750d82b8sm841723f8f.59.2024.06.20.08.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 08:46:50 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Maxime Ripard <maxime@cerno.tech>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 14/31] drm/vc4: crtc: Move assigned_channel to a variable
Date: Thu, 20 Jun 2024 16:46:15 +0100
Message-Id: <20240620154632.4125308-15-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
References: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maxime Ripard <maxime@cerno.tech>

We access multiple times the vc4_crtc_state->assigned_channel variable
in the vc4_crtc_get_scanout_position() function, so let's store it in a
local variable.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 1d54176cf811..ef5ad0ca4c2d 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -105,6 +105,7 @@ static bool vc4_crtc_get_scanout_position(struct drm_crtc *crtc,
 	struct vc4_hvs *hvs = vc4->hvs;
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct vc4_crtc_state *vc4_crtc_state = to_vc4_crtc_state(crtc->state);
+	unsigned int channel = vc4_crtc_state->assigned_channel;
 	unsigned int cob_size;
 	u32 val;
 	int fifo_lines;
@@ -121,7 +122,7 @@ static bool vc4_crtc_get_scanout_position(struct drm_crtc *crtc,
 	 * Read vertical scanline which is currently composed for our
 	 * pixelvalve by the HVS, and also the scaler status.
 	 */
-	val = HVS_READ(SCALER_DISPSTATX(vc4_crtc_state->assigned_channel));
+	val = HVS_READ(SCALER_DISPSTATX(channel));
 
 	/* Get optional system timestamp after query. */
 	if (etime)
@@ -137,11 +138,11 @@ static bool vc4_crtc_get_scanout_position(struct drm_crtc *crtc,
 		*vpos /= 2;
 
 		/* Use hpos to correct for field offset in interlaced mode. */
-		if (vc4_hvs_get_fifo_frame_count(hvs, vc4_crtc_state->assigned_channel) % 2)
+		if (vc4_hvs_get_fifo_frame_count(hvs, channel) % 2)
 			*hpos += mode->crtc_htotal / 2;
 	}
 
-	cob_size = vc4_crtc_get_cob_allocation(vc4, vc4_crtc_state->assigned_channel);
+	cob_size = vc4_crtc_get_cob_allocation(vc4, channel);
 	/* This is the offset we need for translating hvs -> pv scanout pos. */
 	fifo_lines = cob_size / mode->crtc_hdisplay;
 
-- 
2.34.1

