Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA737AC1CD4
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 08:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37AEE10E1E8;
	Fri, 23 May 2025 06:14:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8327310E1E8;
 Fri, 23 May 2025 06:14:53 +0000 (UTC)
Received: from mxde.zte.com.cn (unknown [10.35.20.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4b3Zd20cGXzKjj;
 Fri, 23 May 2025 14:14:46 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.137])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxde.zte.com.cn (FangMail) with ESMTPS id 4b3Zcy57FqzBRHKP;
 Fri, 23 May 2025 14:14:42 +0800 (CST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4b3Zch5Lk9z8R040;
 Fri, 23 May 2025 14:14:28 +0800 (CST)
Received: from njb2app07.zte.com.cn ([10.55.22.95])
 by mse-fl1.zte.com.cn with SMTP id 54N6EKZ3007656;
 Fri, 23 May 2025 14:14:20 +0800 (+08)
 (envelope-from long.yunjian@zte.com.cn)
Received: from mapi (njb2app07[null]) by mapi (Zmail) with MAPI id mid201;
 Fri, 23 May 2025 14:14:22 +0800 (CST)
Date: Fri, 23 May 2025 14:14:22 +0800 (CST)
X-Zmail-TransId: 2aff6830123effffffff981-8e65f
X-Mailer: Zmail v1.0
Message-ID: <20250523141422844GEA-yzba-OvN0lZirDsS-@zte.com.cn>
Mime-Version: 1.0
From: <long.yunjian@zte.com.cn>
To: <jani.nikula@linux.intel.com>
Cc: <rodrigo.vivi@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <tursulin@ursulin.net>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <mou.yi@zte.com.cn>, <xu.lifeng1@zte.com.cn>, <fang.yumeng@zte.com.cn>,
 <ouyang.maochun@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBkcm0vaTkxNS9kaXNwbGF5OiBVc2Ugc3RyX3RydWVfZmFsc2UoKSBoZWxwZXI=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 54N6EKZ3007656
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 68301254.001/4b3Zd20cGXzKjj
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

From: Yumeng Fang <fang.yumeng@zte.com.cn>

Remove hard-coded strings by using the str_true_false() helper.

Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
Signed-off-by: Yunjian Long <long.yunjian@zte.com.cn>
---
 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 8d0a1779dd19..0e3e62468902 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -5,6 +5,7 @@

 #include <linux/debugfs.h>
 #include <linux/string_helpers.h>
+#include <linux/string_choices.h>

 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
@@ -972,7 +973,7 @@ static ssize_t i915_dsc_fec_support_write(struct file *file,
 		return ret;

 	drm_dbg(display->drm, "Got %s for DSC Enable\n",
-		(dsc_enable) ? "true" : "false");
+		str_true_false(dsc_enable));
 	intel_dp->force_dsc_en = dsc_enable;

 	*offp += len;
@@ -1183,7 +1184,7 @@ static ssize_t i915_dsc_fractional_bpp_write(struct file *file,
 		return ret;

 	drm_dbg(display->drm, "Got %s for DSC Fractional BPP Enable\n",
-		(dsc_fractional_bpp_enable) ? "true" : "false");
+		str_true_false(dsc_fractional_bpp_enable));
 	intel_dp->force_dsc_fractional_bpp_en = dsc_fractional_bpp_enable;

 	*offp += len;
-- 
2.25.1
