Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F9F849553
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 09:26:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E8D410E4C9;
	Mon,  5 Feb 2024 08:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 384 seconds by postgrey-1.36 at gabe;
 Sun, 04 Feb 2024 06:33:35 UTC
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 329281120A5;
 Sun,  4 Feb 2024 06:33:34 +0000 (UTC)
X-QQ-mid: bizesmtp78t1707027847tyom9dyz
X-QQ-Originating-IP: Ka/QNVr2vrA2kmjPDU3Wg7k4Bllgbh8TG5NwRdiB4MI=
Received: from localhost ( [183.209.108.228]) by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 04 Feb 2024 14:24:06 +0800 (CST)
X-QQ-SSF: 01400000000000504000000A0001000
X-QQ-FEAT: wF64VgvUy+UdrqGKLNHU0vjclAVKvv9/AylJB3CPALc9Oo2FoK+6YtD66T0Ei
 UxJKDP9R8WMiZEnTg+mLfcJT/sFJl5Sy7BNzBN4/1NcukkXs5elfyJHTzBYFyi/bfIYKKs6
 m0CFCkkKtRGFTyxQAL2TO5z7MWqiwknzAbXQPxS73t/R5WO1xTja602A1v7ayVBup5OdCR0
 U7iCYB7/YOi/b062aiwsMAEWfELezdKtzo6hd07MKsaTROqZk+SAUqg0SiaXLbYaxEjA7R0
 EgDEO9AvCiUdsii4MeJtc01uHrR9heaNS7b2Dp0HfmFQYaGZujRu9ub8fENGEF3sruA3JKj
 UMXPcqm/niWKbkIAEx5R/sC6XVhyD3uIwudjRIjAVtG8jqUr0PIcdSrH+nVY1n7i5QSkvLB
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 12034591885683203316
From: Dawei Li <dawei.li@shingroup.cn>
To: lucas.demarchi@intel.com, ogabbay@kernel.org,
 thomas.hellstrom@linux.intel.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dawei Li <dawei.li@shingroup.cn>, kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/xe: Declare __xe_lrc_*_ggtt_addr with __maybe__unused
Date: Sun,  4 Feb 2024 14:23:24 +0800
Message-Id: <20240204062324.3548268-1-dawei.li@shingroup.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz5a-1
X-Mailman-Approved-At: Mon, 05 Feb 2024 08:26:04 +0000
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

Kernel test robot reports building error:

drivers/gpu/drm/xe/xe_lrc.c:544:1: error: unused function
'__xe_lrc_regs_ggtt_addr' [-Werror,-Wunused-function]
544 | DECL_MAP_ADDR_HELPERS(regs)
    | ^~~~~~~~~~~~~~~~~~~~~~~~~~~

drivers/gpu/drm/xe/xe_lrc.c:536:19: note: expanded from macro
'DECL_MAP_ADDR_HELPERS'
536 | static inline u32 __xe_lrc_##elem##_ggtt_addr(struct xe_lrc *lrc) \
    |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~

<scratch space>:54:1: note: expanded from here
54 | __xe_lrc_regs_ggtt_addr
   | ^~~~~~~~~~~~~~~~~~~~~~~

1 error generated.

Declare __xe_lrc_*_ggtt_addr with __maybe_unused to address it.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202402010928.g3j2aSBL-lkp@intel.com/
Signed-off-by: Dawei Li <dawei.li@shingroup.cn>
---
 drivers/gpu/drm/xe/xe_lrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 0ec5ad2539f1..f70e60a2f8a3 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -614,7 +614,7 @@ static inline struct iosys_map __xe_lrc_##elem##_map(struct xe_lrc *lrc) \
 	iosys_map_incr(&map, __xe_lrc_##elem##_offset(lrc)); \
 	return map; \
 } \
-static inline u32 __xe_lrc_##elem##_ggtt_addr(struct xe_lrc *lrc) \
+static inline u32 __maybe_unused __xe_lrc_##elem##_ggtt_addr(struct xe_lrc *lrc) \
 { \
 	return xe_bo_ggtt_addr(lrc->bo) + __xe_lrc_##elem##_offset(lrc); \
 } \
-- 
2.27.0

