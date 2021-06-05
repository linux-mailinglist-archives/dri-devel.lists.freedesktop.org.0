Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7728439C574
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jun 2021 05:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732126E45D;
	Sat,  5 Jun 2021 03:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m121144.qiye.163.com (mail-m121144.qiye.163.com
 [115.236.121.144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827FE6E45D
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jun 2021 03:22:19 +0000 (UTC)
Received: from Wanjb.localdomain (unknown [36.152.145.182])
 by mail-m121144.qiye.163.com (Hmail) with ESMTPA id D2C4CAC00AC;
 Sat,  5 Jun 2021 11:22:16 +0800 (CST)
From: Wan Jiabing <wanjiabing@vivo.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Imre Deak <imre.deak@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/display: remove duplicated argument
Date: Sat,  5 Jun 2021 11:22:07 +0800
Message-Id: <20210605032209.16111-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQ0NIHVZKSEMdSUNITk4ZQ09VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PRQ6TBw6Lj8JIwlOOEspHz0q
 KhMwCglVSlVKTUlJQ01ISEhMTkNMVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
 TVVKTklVSk9OVUpDSVlXWQgBWUFJQ0xLNwY+
X-HM-Tid: 0a79da315725b039kuuud2c4cac00ac
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
Cc: Wan Jiabing <wanjiabing@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following coccicheck warning:

./drivers/gpu/drm/i915/display/intel_display_power.c:3081:1-28:
 duplicated argument to & or |

This commit fixes duplicate argument. It might be a typo.
But what I can do is to remove it now.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 3e1f6ec61514..4298ae684d7d 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -3078,7 +3078,6 @@ intel_display_power_put_mask_in_set(struct drm_i915_private *i915,
 	BIT_ULL(POWER_DOMAIN_PORT_DDI_C_LANES) |	\
 	BIT_ULL(POWER_DOMAIN_PORT_DDI_LANES_D_XELPD) |	\
 	BIT_ULL(POWER_DOMAIN_PORT_DDI_LANES_E_XELPD) |	\
-	BIT_ULL(POWER_DOMAIN_AUX_C) |			\
 	BIT_ULL(POWER_DOMAIN_PORT_DDI_LANES_TC1) |	\
 	BIT_ULL(POWER_DOMAIN_PORT_DDI_LANES_TC2) |	\
 	BIT_ULL(POWER_DOMAIN_PORT_DDI_LANES_TC3) |	\
-- 
2.20.1

