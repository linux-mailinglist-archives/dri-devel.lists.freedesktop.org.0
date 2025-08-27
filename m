Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58655B385DD
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 17:12:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ABBF10E858;
	Wed, 27 Aug 2025 15:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SMbVdFR/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B697110E149
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 15:12:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2A2316027F;
 Wed, 27 Aug 2025 15:12:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84361C4CEF0;
 Wed, 27 Aug 2025 15:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756307566;
 bh=TOyEj6XtI89c72jvHNqBo0jjmqIBf/MzWhGVwim4FCA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=SMbVdFR/6HYBUUiHSEEqS/ABonhocWVWP3tF4zIhH8zlV4KKPRkhcMgU793wICR0n
 gRA6s2/7p3bPgszUEchZWoyxS69jbSwBiTBCmaijbbKcMKF2PHtqYeNBEGYhlvkYfC
 tT43iHO2JCnTZJy+82eUxeIQFPxuK+oV9j4EvDH66GBcnePXYr0354oLdcNmODYHym
 Wlos7ZGrukh1K9qW39iXWnz9bmBjLx+ECZV1WcJ1dF8dPsR0116beDk6KTxWGl7gK6
 gwi00NbMh/qb8NdNPU5g9Z/ZY+7GueiJYIbrnNwpthEPf6fSoGg2zDZsHaD/E2cHyc
 s8Z2O8IPSQ7Cg==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 27 Aug 2025 17:12:32 +0200
Subject: [PATCH v3 01/14] drm/tidss: dispc: Remove unused OVR_REG_GET
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-drm-tidss-field-api-v3-1-7689b664cc63@kernel.org>
References: <20250827-drm-tidss-field-api-v3-0-7689b664cc63@kernel.org>
In-Reply-To: <20250827-drm-tidss-field-api-v3-0-7689b664cc63@kernel.org>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128; i=mripard@kernel.org;
 h=from:subject:message-id; bh=TOyEj6XtI89c72jvHNqBo0jjmqIBf/MzWhGVwim4FCA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnrFZLn7fRdlB5lHbnM2f8IQ617x7xkV+O7TMufXNk9I
 3Guze+pHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAifMGMDfu0bsmVec8VV0p7
 ISvNYxNrdCmw8drCzXycRvdUxBZceFEhPHXLcrWcKYzPZ7TZareeYWx4m6699vSJC4o5G+Se2KR
 KuOrZTta9yrDDdqdV6vyGD2L5uU+3NmwPj4mySSyruRDeawAA
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
index 3f6cff2ab1b29b43638eb62d4ead36f7fe07486f..71031c3ad60e5a2c99a9a0981c85d246a1a42dc6 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -651,17 +651,10 @@ static void VP_REG_FLD_MOD(struct dispc_device *dispc, u32 vp, u32 idx, u32 val,
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

