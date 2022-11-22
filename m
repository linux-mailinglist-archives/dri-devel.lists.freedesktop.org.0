Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD27633C0C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 13:08:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D0B10E0C0;
	Tue, 22 Nov 2022 12:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C060410E0C0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 12:08:28 +0000 (UTC)
Received: from mxde.zte.com.cn (unknown [10.35.20.121])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4NGjhT6Pr7zK8S;
 Tue, 22 Nov 2022 20:08:25 +0800 (CST)
Received: from mxus.zte.com.cn (unknown [10.207.168.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxde.zte.com.cn (FangMail) with ESMTPS id 4NGjhB49MfzBf6Lr;
 Tue, 22 Nov 2022 20:08:10 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.138])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxus.zte.com.cn (FangMail) with ESMTPS id 4NGjh66CBPzdmJQW;
 Tue, 22 Nov 2022 20:08:06 +0800 (CST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4NGjh12Qybz5PkGj;
 Tue, 22 Nov 2022 20:08:01 +0800 (CST)
Received: from szxlzmapp04.zte.com.cn ([10.5.231.166])
 by mse-fl2.zte.com.cn with SMTP id 2AMC7uCC005801;
 Tue, 22 Nov 2022 20:07:56 +0800 (+08)
 (envelope-from yang.yang29@zte.com.cn)
Received: from mapi (szxlzmapp02[null]) by mapi (Zmail) with MAPI id mid14;
 Tue, 22 Nov 2022 20:07:59 +0800 (CST)
Date: Tue, 22 Nov 2022 20:07:59 +0800 (CST)
X-Zmail-TransId: 2b04637cbb9ffffffffffa0dfedf
X-Mailer: Zmail v1.0
Message-ID: <202211222007593082125@zte.com.cn>
Mime-Version: 1.0
From: <yang.yang29@zte.com.cn>
To: <zhenyuw@linux.intel.com>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHRdIGRybS9pOTE1L2d2dDogdXNlIHN5c2ZzX3N0cmVxKCkgaW5zdGVhZCBvZiBzdHJuY21wKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 2AMC7uCC005801
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.251.14.novalocal with ID
 637CBBB8.002 by FangMail milter!
X-FangMail-Envelope: 1669118906/4NGjhT6Pr7zK8S/637CBBB8.002/10.35.20.121/[10.35.20.121]/mxde.zte.com.cn/<yang.yang29@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 637CBBB8.002/4NGjhT6Pr7zK8S
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
Cc: tvrtko.ursulin@linux.intel.com, xu.panda@zte.com.cn,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, yang.yang29@zte.com.cn,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com, zhi.a.wang@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xu Panda <xu.panda@zte.com.cn>

Replace the open-code with sysfs_streq().

Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
Signed-off-by: Yang Yang <yang.yang29@zte.com>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index 0ebf5fbf0e39..7b9a5f7f5363 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -917,8 +917,8 @@ static int cmd_reg_handler(struct parser_exec_state *s,
 		return -EBADRQC;
 	}

-	if (!strncmp(cmd, "srm", 3) ||
-			!strncmp(cmd, "lrm", 3)) {
+	if (sysfs_streq(cmd, "srm") ||
+			sysfs_streq(cmd, "lrm")) {
 		if (offset == i915_mmio_reg_offset(GEN8_L3SQCREG4) ||
 		    offset == 0x21f0 ||
 		    (IS_BROADWELL(gvt->gt->i915) &&
@@ -931,8 +931,8 @@ static int cmd_reg_handler(struct parser_exec_state *s,
 		}
 	}

-	if (!strncmp(cmd, "lrr-src", 7) ||
-			!strncmp(cmd, "lrr-dst", 7)) {
+	if (sysfs_streq(cmd, "lrr-src") ||
+			sysfs_streq(cmd, "lrr-dst")) {
 		if (IS_BROADWELL(gvt->gt->i915) && offset == 0x215c)
 			return 0;
 		else {
@@ -941,12 +941,12 @@ static int cmd_reg_handler(struct parser_exec_state *s,
 		}
 	}

-	if (!strncmp(cmd, "pipe_ctrl", 9)) {
+	if (sysfs_streq(cmd, "pipe_ctrl")) {
 		/* TODO: add LRI POST logic here */
 		return 0;
 	}

-	if (strncmp(cmd, "lri", 3))
+	if (!sysfs_streq(cmd, "lri"))
 		return -EPERM;

 	/* below are all lri handlers */
@@ -1011,7 +1011,7 @@ static int cmd_reg_handler(struct parser_exec_state *s,
 	 */
 	if (GRAPHICS_VER(s->engine->i915) == 9 &&
 	    intel_gvt_mmio_is_sr_in_ctx(gvt, offset) &&
-	    !strncmp(cmd, "lri", 3)) {
+	    sysfs_streq(cmd, "lri")) {
 		intel_gvt_read_gpa(s->vgpu,
 			s->workload->ring_context_gpa + 12, &ctx_sr_ctl, 4);
 		/* check inhibit context */
-- 
2.15.2
