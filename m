Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A27B2DE88
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 16:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51BD10E742;
	Wed, 20 Aug 2025 14:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bBYYpC0F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589CF10E742
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 14:02:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E5D5944F15;
 Wed, 20 Aug 2025 14:02:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75FA5C4CEE7;
 Wed, 20 Aug 2025 14:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755698523;
 bh=7M8WQ93AaEVDFJvrP9tpFEBFhyFY0X5kFY5fADadnZw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=bBYYpC0FkTO01ZF0XW2EroYm0Mp+L8HTFnWs0O/Gtl+5EybiJq0oCCqVf7EoLxfl3
 G+P4KPSucuU0/HxyigbeHZS8oBS5WCh9kyU7IREFbHKX2gr0nZLpCwyDYdH6UrJa0n
 CTEj0QFokXchz2zC8qaElhkmqGYv0ykzezT/q9keH7KnPsOmdV2ZTIffCslowM8FLz
 c7cYlKwx8Pi2hXlBWh1qH0dPJPp4j5t4WdpNdt4L1jOCsUCXrdcHsXzx5Ydq7Q+xtx
 yYFVSmKm8KIc05Joecw91dyaZgutWheFaxB74qFPEaC3O6lrs4CVSBVpE9V6OiIA8L
 6n+4REYkfc3qg==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 20 Aug 2025 16:01:41 +0200
Subject: [PATCH v2 01/14] drm/tidss: dispc: Remove unused OVR_REG_GET
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-drm-tidss-field-api-v2-1-43cab671c648@kernel.org>
References: <20250820-drm-tidss-field-api-v2-0-43cab671c648@kernel.org>
In-Reply-To: <20250820-drm-tidss-field-api-v2-0-43cab671c648@kernel.org>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128; i=mripard@kernel.org;
 h=from:subject:message-id; bh=7M8WQ93AaEVDFJvrP9tpFEBFhyFY0X5kFY5fADadnZw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBlLr/r/bH52w+CrpJBp7naZmG97k+MXr/Xc9qr/gPQ0R
 6MVt4rEO6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEuPgY65QuS20zyz529NNa
 PZuf39Tz19o0tQfIs+xa4+3++/rH9U2Z/PFVSyTPVfy+rz1rxswSBcaGRpHWn26c1q98zdLO/hG
 TqO96ph6d6/TTae8Ex/j3peJOs1bvSLk7ydH5S/jmLVI3Y0oB
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

The OVR_REG_GET function in the dispc driver is not used anywhere. Let's
drop it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 975d94547c3f9d5e9ad61aefd4eeb8ada8874cb0..8ec06412cffa71512cead9725bb43440258eb1ec 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -666,17 +666,10 @@ static void VP_REG_FLD_MOD(struct dispc_device *dispc, u32 vp, u32 idx, u32 val,
 {
 	dispc_vp_write(dispc, vp, idx, FLD_MOD(dispc_vp_read(dispc, vp, idx),
 					       val, start, end));
 }
 
-__maybe_unused
-static u32 OVR_REG_GET(struct dispc_device *dispc, u32 ovr, u32 idx,
-		       u32 start, u32 end)
-{
-	return FLD_GET(dispc_ovr_read(dispc, ovr, idx), start, end);
-}
-
 static void OVR_REG_FLD_MOD(struct dispc_device *dispc, u32 ovr, u32 idx,
 			    u32 val, u32 start, u32 end)
 {
 	dispc_ovr_write(dispc, ovr, idx,
 			FLD_MOD(dispc_ovr_read(dispc, ovr, idx),

-- 
2.50.1

