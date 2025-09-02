Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE42B3F890
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 10:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5288810E5F1;
	Tue,  2 Sep 2025 08:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="i+wgCC51";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6748710E5F6
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:34:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 50004416A4;
 Tue,  2 Sep 2025 08:34:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D71DCC4CEF7;
 Tue,  2 Sep 2025 08:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756802043;
 bh=7htVe8qzOBLCTGcYaqAkeRIfioQ4YdQGYbL+cD4yqKg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=i+wgCC51chdcj4XnR5i7iqsDbI9+aIZWhAp9XHWAJ8WoRQsqz4UjS1F/FJXZP1KzZ
 dbYnaXpSYJoYWIB+cggDbM+NvKW3RCIAOMTufO+uvdtn+teYeGhZUs7Qj3IjWmkLjq
 2uei/udkcwi6c/dOJiK9d4n0POtKwm/l5VBh8AYujqyv3e96cvQ63G9yP0IXDBSpo3
 9wn1R5tMNrKkPxg1/sATxdki2Tl6QeWm3YwgTsk9f/89t/KQ8om8g/fKLzfkvgL5Tb
 6TchgWKUBZaFKn46adtqort+67vP5nMMO+uOREsZkCwQ72HR9LfEN6Z4JdexduG38e
 cw2Ou7b2bEAxQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 10:32:48 +0200
Subject: [PATCH 20/29] drm/tidss: crtc: Change variable name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-state-readout-v1-20-14ad5315da3f@kernel.org>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
In-Reply-To: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1477; i=mripard@kernel.org;
 h=from:subject:message-id; bh=7htVe8qzOBLCTGcYaqAkeRIfioQ4YdQGYbL+cD4yqKg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbVu99vm2SV1RxoPFSBRth//zassx67hUrU7vrC7MVy
 +pNbJw7prIwCHMyyIopsjyRCTu9vH1xlYP9yh8wc1iZQIYwcHEKwERm8DLWCq9p6fb4lTrpxi8W
 3h+d1+dOlBDbG9R9RD+Mv0Zly6ybm6Vu1s553d7m3esuL6t1NK+bsWGnUXdKWMuyMgnJ015fLy7
 8toVboNbeKqPpWozEXw/LKy4/k51MKuaYPij6+uypN39NPgA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The tidss_crtc_reset() function stores a pointer to struct
tidss_crtc_state in a variable called tcrtc, while it uses tcrtc as a
pointer to struct tidss_crtc in the rest of the driver.

This is confusing, so let's change the variable name.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_crtc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index 091f82c86f53bc76c572de4723746af2e35ce1c1..db7c5e4225e6247047087a35a2e6422950fc0111 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -343,24 +343,24 @@ static void tidss_crtc_disable_vblank(struct drm_crtc *crtc)
 	tidss_runtime_put(tidss);
 }
 
 static void tidss_crtc_reset(struct drm_crtc *crtc)
 {
-	struct tidss_crtc_state *tcrtc;
+	struct tidss_crtc_state *tstate;
 
 	if (crtc->state)
 		__drm_atomic_helper_crtc_destroy_state(crtc->state);
 
 	kfree(crtc->state);
 
-	tcrtc = kzalloc(sizeof(*tcrtc), GFP_KERNEL);
-	if (!tcrtc) {
+	tstate = kzalloc(sizeof(*tstate), GFP_KERNEL);
+	if (!tstate) {
 		crtc->state = NULL;
 		return;
 	}
 
-	__drm_atomic_helper_crtc_reset(crtc, &tcrtc->base);
+	__drm_atomic_helper_crtc_reset(crtc, &tstate->base);
 }
 
 static struct drm_crtc_state *tidss_crtc_duplicate_state(struct drm_crtc *crtc)
 {
 	struct tidss_crtc_state *state, *current_state;

-- 
2.50.1

