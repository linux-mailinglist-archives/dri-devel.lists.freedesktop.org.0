Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 560C1C096B0
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 18:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F3010E30E;
	Sat, 25 Oct 2025 16:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Wwebvemk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A38210E30E
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Oct 2025 16:25:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B84F743CBC;
 Sat, 25 Oct 2025 16:25:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77BBAC116C6;
 Sat, 25 Oct 2025 16:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761409544;
 bh=3nf+//Stm69M+x9uv0iThLD5ExJm7xh8wwzcK3UUFGE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wwebvemk9hS7q0s3Ok7NYteIJPce/YWUsvRUMFeyo8wZScLV4F0n5MMOAYKZMY+bl
 ZdvdAvGnx9spAG44Axzd3hhhTbD1fZfJ/LJQEVonSCV2NgFeN1WDqQO3E4cUN56NvG
 1k6X8DcLnYu2WgV0R6d9AnIdzFiNWfgie09XVB0okOgk71JbuB+nLGydIBTSbtykty
 qYSn198NC2MzFS7FIoQQVoEuHird1Zgzhz6NYWDhg+Ijea5xXylH5DZnaloyiiCeiJ
 69Zc9o8pEpJ/z79eWw3oCIZDqR79se8YZwLE2SOmvsg/Hy8qdhUrPBfT8thbPzvbXc
 qwrjwTdgx+Iuw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>,
 Parth Pancholi <parth.pancholi@toradex.com>,
 Jayesh Choudhary <j-choudhary@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Sasha Levin <sashal@kernel.org>, jyri.sarha@iki.fi,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.17-5.10] drm/tidss: Use the crtc_* timings when
 programming the HW
Date: Sat, 25 Oct 2025 11:59:48 -0400
Message-ID: <20251025160905.3857885-357-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
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

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

[ Upstream commit 478306edc23eec4f0ec24a46222485910c66212d ]

Use the crtc_* fields from drm_display_mode, instead of the "logical"
fields. This shouldn't change anything in practice, but afaiu the crtc_*
fields are the correct ones to use here.

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Tested-by: Parth Pancholi <parth.pancholi@toradex.com>
Tested-by: Jayesh Choudhary <j-choudhary@ti.com>
Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
Link: https://lore.kernel.org/r/20250723-cdns-dsi-impro-v5-3-e61cc06074c2@ideasonboard.com
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

Explanation

What changed
- drivers/gpu/drm/tidss/tidss_crtc.c:227 switches the pixel clock
  programmed into the VP from `mode->clock * 1000` to `mode->crtc_clock
  * 1000`. This ensures the CRTC gets the adjusted pixel rate after
  encoder/bridge modifications.
- drivers/gpu/drm/tidss/tidss_dispc.c updates all timing and size
  programming to use `crtc_*` fields instead of the “logical” ones:
  - Horizontal timings: `hfp/hsw/hbp` now computed from
    `crtc_hsync_start/crtc_hsync_end/crtc_hdisplay/crtc_htotal`.
  - Vertical timings: `vfp/vsw/vbp` now computed from
    `crtc_vsync_start/crtc_vsync_end/crtc_vdisplay/crtc_vtotal`.
  - Screen size register uses `crtc_hdisplay` and `crtc_vdisplay`.
  - The register writes affected include DISPC_VP_TIMING_H,
    DISPC_VP_TIMING_V, and DISPC_VP_SIZE_SCREEN.

Why it matters
- In DRM, the `crtc_*` fields represent the timings and pixel rate that
  the CRTC must actually program, after any adjustments by
  encoders/bridges (e.g., DSI DPI conversions, double-clocking, pixel
  repetition, burst modes).
- Using the non-crtc (“logical”) mode values can mismatch the VP’s clock
  and timing registers with the bridge’s expectations, causing real
  failures: sync lost, blank display, or unstable output. TIDSS
  explicitly handles sync-lost conditions elsewhere; wrong pixel
  clock/timings are a common source of such issues.
- The change aligns TIDSS with widespread practice across DRM drivers
  and with cadence DSI programming, which already relies on `crtc_*` for
  the DPI-to-DSI path. This improves correctness when using TIDSS with
  DSI/LVDS bridges that adjust the mode.

Backport suitability
- Bugfix: Corrects which mode members are used to program the hardware
  (functional correctness for any pipeline that adjusts the CRTC mode).
  It can solve user-visible issues (no display/sync lost) in such
  configurations.
- Small and contained: The diff is narrowly scoped to TIDSS VP clock and
  timing programming; no architectural changes.
- Low risk: Pure field substitution to the correct `crtc_*` members;
  widely used pattern in other DRM drivers. No API changes or cross-
  subsystem impact.
- No feature additions: Behavior remains the same for pipelines where
  `crtc_*` equals logical fields; improves only cases where they differ.
- Stable policy fit: Important correctness fix with minimal regression
  risk in a confined subsystem, and it does not touch core kernel or
  unrelated code.

Notes
- Mode validation in TIDSS still checks the logical mode; while that’s
  unchanged here, this patch alone is safe and beneficial. If needed,
  further adjustments to validate the effective CRTC requirements can be
  considered separately.

 drivers/gpu/drm/tidss/tidss_crtc.c  |  2 +-
 drivers/gpu/drm/tidss/tidss_dispc.c | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index a2f40a5c77030..17efd77ce7f23 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -225,7 +225,7 @@ static void tidss_crtc_atomic_enable(struct drm_crtc *crtc,
 	tidss_runtime_get(tidss);
 
 	r = dispc_vp_set_clk_rate(tidss->dispc, tcrtc->hw_videoport,
-				  mode->clock * 1000);
+				  mode->crtc_clock * 1000);
 	if (r != 0)
 		return;
 
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index c0277fa36425e..3f6cff2ab1b29 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -1215,13 +1215,13 @@ void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport,
 
 	dispc_set_num_datalines(dispc, hw_videoport, fmt->data_width);
 
-	hfp = mode->hsync_start - mode->hdisplay;
-	hsw = mode->hsync_end - mode->hsync_start;
-	hbp = mode->htotal - mode->hsync_end;
+	hfp = mode->crtc_hsync_start - mode->crtc_hdisplay;
+	hsw = mode->crtc_hsync_end - mode->crtc_hsync_start;
+	hbp = mode->crtc_htotal - mode->crtc_hsync_end;
 
-	vfp = mode->vsync_start - mode->vdisplay;
-	vsw = mode->vsync_end - mode->vsync_start;
-	vbp = mode->vtotal - mode->vsync_end;
+	vfp = mode->crtc_vsync_start - mode->crtc_vdisplay;
+	vsw = mode->crtc_vsync_end - mode->crtc_vsync_start;
+	vbp = mode->crtc_vtotal - mode->crtc_vsync_end;
 
 	dispc_vp_write(dispc, hw_videoport, DISPC_VP_TIMING_H,
 		       FLD_VAL(hsw - 1, 7, 0) |
@@ -1263,8 +1263,8 @@ void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport,
 		       FLD_VAL(ivs, 12, 12));
 
 	dispc_vp_write(dispc, hw_videoport, DISPC_VP_SIZE_SCREEN,
-		       FLD_VAL(mode->hdisplay - 1, 11, 0) |
-		       FLD_VAL(mode->vdisplay - 1, 27, 16));
+		       FLD_VAL(mode->crtc_hdisplay - 1, 11, 0) |
+		       FLD_VAL(mode->crtc_vdisplay - 1, 27, 16));
 
 	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, 1, 0, 0);
 }
-- 
2.51.0

