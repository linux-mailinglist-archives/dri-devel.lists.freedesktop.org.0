Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1185CB40F2C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 23:16:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6604910E05D;
	Tue,  2 Sep 2025 21:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JdX4OJxz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E1310E05D
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 21:15:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 709F060007;
 Tue,  2 Sep 2025 21:15:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD06C4CEED;
 Tue,  2 Sep 2025 21:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756847758;
 bh=95tkdMDuso5OG/9KbTm4H+ptGB07aLJvYeRM1Q04jNU=;
 h=From:Date:Subject:To:Cc:From;
 b=JdX4OJxzQt/QhxWqIsxxUQwA43kiBUlJL7d2tqHaHNgTvR+AT5CUdn629cKsQZ3Ej
 2vFaKUv9Bh0aXWhfL+MDzdMTUStrtik7S24otrzCvsB6ghP5NZ6v0QTRlJyL/wJ+xv
 kWoB4Zq1brbwRMpPcfrfhrGgDdhaItnO1q6kPle6ocnJjHBHFYMl1NynCsOBNW+aYJ
 ftbXM+euNtf6MQRhY2fiBUNZLzJqwo0xQEzSz5wZO1Cspu3hS3KrAUK+E2poQR8+ya
 ulUfsV043ZZAOonMMkL7X3WIgdj1RCfucGDge1+mSwUX1wPBqdNUNgP3iVgM4uyZQq
 Z/cewRXtq4jzA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 02 Sep 2025 14:15:50 -0700
Subject: [PATCH] drm/tidss: dispc: Explicitly include bitfield.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-tidss-fix-missing-bitfield-h-v1-1-aaad4a285f98@kernel.org>
X-B4-Tracking: v=1; b=H4sIAIVet2gC/x2NwQqDMBAFf0X27MIm2hb7K+JBzaoPNJaslIL47
 4YeB4aZk0wT1OhdnJT0C8MeM7iyoHHp46yMkJm8+Ic04jmkjQ8EM57w4w1miDMPOCboGnjhZhC
 p9emq/uUoZz5Js/lftN113fSkYLByAAAA
X-Change-ID: 20250902-drm-tidss-fix-missing-bitfield-h-9b004e613a71
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2161; i=nathan@kernel.org;
 h=from:subject:message-id; bh=95tkdMDuso5OG/9KbTm4H+ptGB07aLJvYeRM1Q04jNU=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBnb43pqHyT8+RekoOh2w6RTNrKwN0RfJiBS6PqhPp7vr
 ZN/7VjRUcrCIMbFICumyFL9WPW4oeGcs4w3Tk2CmcPKBDKEgYtTACaS1crI8LIqoXqdgDWX681C
 W7MNiRFqKyZ9Wb3UddbUM7ZyTleDUhkZprpcv+P1PEvmo+m1v19Z1W9/SF+3ZfENka4DbROmuAW
 WcAEA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

After a recent series to use FIELD_PREP and FIELD_MODIFY in
tidss_dispc.c, there are many errors when bitfield.h is not implicitly
included, such as when building allmodconfig for ARCH=hexagon:

  drivers/gpu/drm/tidss/tidss_dispc.c:1116:2: error: call to undeclared function 'FIELD_MODIFY'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   1116 |         VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, v,
        |         ^
  drivers/gpu/drm/tidss/tidss_dispc.c:631:3: note: expanded from macro 'VP_REG_FLD_MOD'
    631 |                 FIELD_MODIFY((mask), &_reg, (val));                     \
        |                 ^
  drivers/gpu/drm/tidss/tidss_dispc.c:1140:2: error: call to undeclared function 'FIELD_MODIFY'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   1140 |         FIELD_MODIFY(DISPC_VP_DSS_OLDI_CFG_MAP_MASK, &oldi_cfg,
        |         ^
  drivers/gpu/drm/tidss/tidss_dispc.c:1203:10: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   1203 |                        FIELD_PREP(DISPC_VP_TIMING_H_SYNC_PULSE_MASK, hsw - 1) |
        |                        ^
  ...

Explicitly include bitfield.h to resolve the errors.

Fixes: 9accc8b10de8 ("drm/tidss: dispc: Get rid of FLD_VAL")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 97e2cd7b1e20..7c8c15a5c39b 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -4,6 +4,7 @@
  * Author: Jyri Sarha <jsarha@ti.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>

---
base-commit: 306734a1c76ce35fa613ea823a31ddbcdbf1eef5
change-id: 20250902-drm-tidss-fix-missing-bitfield-h-9b004e613a71

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>

