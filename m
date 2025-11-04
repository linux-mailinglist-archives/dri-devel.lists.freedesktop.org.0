Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D667DC3288A
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 19:10:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4B910E30D;
	Tue,  4 Nov 2025 18:10:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aIfiy+le";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FBA10E30E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 18:10:09 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-47721743fd0so31652205e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 10:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762279808; x=1762884608; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nl1ilT/sObHTqPC76FAptDP4x6azYGMRqYkHZHMZay0=;
 b=aIfiy+lemuwFrJ0NRmnJlUQSAo3lrBwcdudYweg3m93du4oSAVisW3mFsd+UjbukxR
 pWXjEfhbpuruW3lG/Jt46M3ij0+vIDTDzOc2WhQF4SuPytPIGAAH0Aas3cEEDRt3ob8a
 wiwQhjTlTaIVvx9qOgGzXYCTfe0oElFnOLf8xilraYGr4PSGC83jinJE8aep0EtiHNKj
 yLJoj1eOxUNkxVwnOJGb05mvJWC2dM1i80CNV7c5vGO4I22tCaVFu4jbl/PmrVbjJsch
 m4Ju1dBkCKbBGsfYC3/hlQ3AvhieSNl1e/M7z9mdDhQmAP3psiE4AkqRa/nfg31YdP2E
 +pIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762279808; x=1762884608;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nl1ilT/sObHTqPC76FAptDP4x6azYGMRqYkHZHMZay0=;
 b=mxLg9vxzVvK9GlkSY1XHMf8+AaDut6y9d1gUUSfsXI4Hix5XhfnlbW7n0w4s9tkiUv
 UFxJzZWF3WssZd7zB7IFxLb1AZymLpo/o9ERRBwJTwQ+K2lQS+E7FQxEb3vx/gsKLJ6w
 K1cCes7pPNbLelYrvMQESTganDMANKrwzyC1ppW02G8jID4Bx5LZxe0wdtYbZoi3HKnD
 PlpMoUdBqHSn8VJwTfHeOKamfWaIjBO18+TV/55CCaB6Ugdon+Uv0DekapLwqlTzQ9J4
 jcZjRLMmsDBGPcQoqbwr/wQPujZpGPE+OOAX0DToueKxjyb4KI5QynvFT/LuA8lG/fIh
 p3+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKgwpXpIndBEM8zoTpsFwiPVqm/c/ZRrytNH5SvsHIqzCJEF1+a8Lj001fP52ORBt5GL1n2sXS02c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymmayDf2oWhRH4+GUCCiNbKw1NEvpsirSi66go7Z9VtCSfifXv
 liu/gGGD9MBJoHmWxbimtM/dnNg3e/eom3R1RJHKer43V5XMGEml4Wp7
X-Gm-Gg: ASbGnctqIxqSA/yYlMkg4JyWc7jF13bZDlUIX7IxpyByMqUPkdFC7qD4G7KQ6J7E0Co
 +Hy4ro/kxDcXi0hiNcl2NildTituWLGFG8fDN3I16tJYK1jXVF3gOjjtikRzuWSNME0nTWpLZ+K
 sL778/lklgQkLetFxOJiF/K6rooK0ak0CqUIPvOpMga2cAVMzq8freKw/PIe2cr9ep0AzaOaLYA
 Jc253YDD9drFNKxUniUgnxbFZ8btoezzLrJdPT4Aon83lEpUXYrwYUV8Fqjpy+cuefz4c6RnL1q
 y+0KH2JVIgoUqE+Jz4prl3958/aymTnu2VmUss8V75k6L2sjfuk1op6ECvqTgbnrLKaVPDhpLpN
 c2y9NGenZFeyYcE2E6AeKNdI7wFWVOqUsTWxUHBoUkyZDTsqXhsARDq0nBINNkvtsKe9EJnYzlD
 mcHUUPW476lE6kpavetA==
X-Google-Smtp-Source: AGHT+IEaQ0kJCmYAyDupR48ISzZYJfw4Ug61ieLu3o3gUFaY4n5a/nzq0x9jBMUVbLw7oK4nsgRXfg==
X-Received: by 2002:a05:600c:34d0:b0:471:6f4:601f with SMTP id
 5b1f17b1804b1-4775cdf54aemr2431095e9.19.1762279807980; 
 Tue, 04 Nov 2025 10:10:07 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 10:10:07 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 05/30] drm/sun4i: vi_layer: Move check from update to check
 callback
Date: Tue,  4 Nov 2025 19:09:17 +0100
Message-ID: <20251104180942.61538-6-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
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

DRM requires that all check are done in atomic_check callback. Move
one check from atomic_commit to atomic_check callback.

Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes in v2:
- fixed commit message

 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index bd6c7915bbc4..c80bdece5ffc 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -217,16 +217,11 @@ static int sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 	struct drm_plane_state *state = plane->state;
 	u32 val, ch_base, csc_mode, hw_fmt;
 	const struct drm_format_info *fmt;
-	int ret;
 
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	fmt = state->fb->format;
-	ret = sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
-	if (ret) {
-		DRM_DEBUG_DRIVER("Invalid format\n");
-		return ret;
-	}
+	sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
 
 	val = hw_fmt << SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_OFFSET;
 	regmap_update_bits(mixer->engine.regs,
@@ -322,7 +317,9 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
 	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
 	struct drm_crtc *crtc = new_plane_state->crtc;
 	struct drm_crtc_state *crtc_state;
-	int min_scale, max_scale;
+	const struct drm_format_info *fmt;
+	int min_scale, max_scale, ret;
+	u32 hw_fmt;
 
 	if (!crtc)
 		return 0;
@@ -332,6 +329,13 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
+	fmt = new_plane_state->fb->format;
+	ret = sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
+	if (ret) {
+		DRM_DEBUG_DRIVER("Invalid plane format\n");
+		return ret;
+	}
+
 	min_scale = DRM_PLANE_NO_SCALING;
 	max_scale = DRM_PLANE_NO_SCALING;
 
-- 
2.51.2

