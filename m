Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11938A2502B
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 22:59:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A9210E32A;
	Sun,  2 Feb 2025 21:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="m3HAYvo1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD72C10E2BB;
 Sun,  2 Feb 2025 21:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=zB8VhMlMX6u7pxPTXphsXxQbKI9GdJdL3pZhEJ1Qsss=; b=m3HAYvo1fqxddrFe
 YKNgnyR4V0Rdn8caHKC0YTCoq2nMzH7l3uPXBn9BZ2OY9LU+5fOP4SQXeI8d69/8OuIyXi0jd2DmF
 VhhMEQD9QO/gcScEGqCi3ghb1KLS/PThedCxTof03qyKNkRfnqDqFs5Zx2gg6eT9XDTCXtcAHmCUM
 qDmYnSpMuFxRwtljoYdn7K9By1yhNnnzbZ7DBB1AgHnsbI/P47teVb4hvGIeiaRzTSVE6B82fHPX9
 /O3RPvCNqvR9ApGVTm5en/Qfgy+lAQimcscgrXLYBaIR9D3dDsbPBCgHN9YB4iunAfVzD/xgTXIGO
 JBktysNydzjH+Xm5pQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tehza-00D9GV-2R;
 Sun, 02 Feb 2025 21:59:02 +0000
From: linux@treblig.org
To: patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, alexander.deucher@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 7/7] drm/amd/display: Remove unused
 link_enc_cfg_get_link_enc_used_by_stream
Date: Sun,  2 Feb 2025 21:58:56 +0000
Message-ID: <20250202215856.252439-8-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250202215856.252439-1-linux@treblig.org>
References: <20250202215856.252439-1-linux@treblig.org>
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

link_enc_cfg_get_link_enc_used_by_stream() is no longer used after
2021's:
commit 6366b00346c0 ("drm/amd/display: Maintain consistent mode of
operation during encoder assignment")
which introduces and uses the _current version instead.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c | 11 -----------
 drivers/gpu/drm/amd/display/dc/inc/link_enc_cfg.h     |  5 -----
 2 files changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
index 039b176e086d..08b4258b0e2f 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
@@ -559,17 +559,6 @@ struct link_encoder *link_enc_cfg_get_next_avail_link_enc(struct dc *dc)
 	return link_enc;
 }
 
-struct link_encoder *link_enc_cfg_get_link_enc_used_by_stream(
-		struct dc *dc,
-		const struct dc_stream_state *stream)
-{
-	struct link_encoder *link_enc;
-
-	link_enc = link_enc_cfg_get_link_enc_used_by_link(dc, stream->link);
-
-	return link_enc;
-}
-
 struct link_encoder *link_enc_cfg_get_link_enc(
 		const struct dc_link *link)
 {
diff --git a/drivers/gpu/drm/amd/display/dc/inc/link_enc_cfg.h b/drivers/gpu/drm/amd/display/dc/inc/link_enc_cfg.h
index dc650be3837e..f1afb31ac70b 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/link_enc_cfg.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/link_enc_cfg.h
@@ -96,11 +96,6 @@ struct link_encoder *link_enc_cfg_get_link_enc_used_by_link(
 /* Return next available DIG link encoder. NULL if none available. */
 struct link_encoder *link_enc_cfg_get_next_avail_link_enc(struct dc *dc);
 
-/* Return DIG link encoder used by stream. NULL if unused. */
-struct link_encoder *link_enc_cfg_get_link_enc_used_by_stream(
-		struct dc *dc,
-		const struct dc_stream_state *stream);
-
 /* Return DIG link encoder. NULL if unused. */
 struct link_encoder *link_enc_cfg_get_link_enc(const struct dc_link *link);
 
-- 
2.48.1

