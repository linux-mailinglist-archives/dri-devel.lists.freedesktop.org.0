Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A155B135F0B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 18:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C554F6E462;
	Thu,  9 Jan 2020 17:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35386E92C;
 Thu,  9 Jan 2020 17:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eVK3qcP+C0X2No4jeiblUro/rWSKEKB9v5M7ETmBrrw=; b=IWDLoccswBwBeHjyI9yjPSGksI
 WBJ1XrIr3lvVWAtx9TN+BmctmvcE70SofZ3UJaiKprl7CUL5jbsGeXOhSAhPyHhr7PYP9VT6MtShd
 8dt1nrFnbLPxQ4FbPWjopPJufuZDcrZlNBmRGrBiNJoRpC4DAmwVLQrV+7NbrjyMk9DWHrFvnDIxg
 7V9fs6NAKKBNMcY+uB8MYr35TmObFVrq8R53caxlXPHuD01O3L9CO3E8SuADKQMrK77J8WdHsGL2t
 xF/Ym9atnNRG9ilkXbhJMwo/7BQsx99Cwy9a58STbtA0ilHPmdvEGnXx7CZTh6plRhFqpoiAd4wrx
 HIlL1SkA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www413.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1ipbNz-0002W9-Go; Thu, 09 Jan 2020 18:14:19 +0100
Received: from [24.134.37.229] (helo=192-168-0-109.rdsnet.ro)
 by sslproxy02.your-server.de with esmtpsa (TLSv1:ECDHE-RSA-AES256-SHA:256)
 (Exim 4.92) (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1ipbNz-000Eh8-7V; Thu, 09 Jan 2020 18:14:19 +0100
From: Julian Stecklina <julian.stecklina@cyberus-technology.de>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [RFC PATCH 4/4] drm/i915/gvt: move public gvt headers out into global
 include
Date: Thu,  9 Jan 2020 19:13:57 +0200
Message-Id: <20200109171357.115936-5-julian.stecklina@cyberus-technology.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200109171357.115936-1-julian.stecklina@cyberus-technology.de>
References: <4079ce7c26a2d2a3c7e0828ed1ea6008d6e2c805.camel@cyberus-technology.de>
 <20200109171357.115936-1-julian.stecklina@cyberus-technology.de>
MIME-Version: 1.0
X-Authenticated-Sender: julian.stecklina@cyberus-technology.de
X-Virus-Scanned: Clear (ClamAV 0.101.4/25689/Thu Jan  9 10:59:33 2020)
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
Cc: Julian Stecklina <julian.stecklina@cyberus-technology.de>,
 linux-kernel@vger.kernel.org, hang.yuan@intel.com,
 dri-devel@lists.freedesktop.org, zhiyuan.lv@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the GVT interface to hypervisors does not depend on i915/GVT
internals anymore, we can move the headers to the global include/.

This makes out-of-tree modules for hypervisor integration possible.

Cc: Zhenyu Wang <zhenyuw@linux.intel.com>

Signed-off-by: Julian Stecklina <julian.stecklina@cyberus-technology.de>
---
 drivers/gpu/drm/i915/gvt/gvt.h                         |  3 +--
 drivers/gpu/drm/i915/gvt/kvmgt.c                       |  2 +-
 .../i915/gvt/gvt_public.h => include/drm/i915_gvt.h    |  8 ++++----
 .../hypercall.h => include/drm/i915_gvt_hypercall.h    | 10 +++++++---
 4 files changed, 13 insertions(+), 10 deletions(-)
 rename drivers/gpu/drm/i915/gvt/gvt_public.h => include/drm/i915_gvt.h (97%)
 rename drivers/gpu/drm/i915/gvt/hypercall.h => include/drm/i915_gvt_hypercall.h (95%)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index f9693c44e342..d09374aa7710 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -33,9 +33,8 @@
 #ifndef _GVT_H_
 #define _GVT_H_
 
-#include "gvt_public.h"
+#include <drm/i915_gvt.h>
 #include "debug.h"
-#include "hypercall.h"
 #include "mmio.h"
 #include "reg.h"
 #include "interrupt.h"
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index f5157211d45f..280d69ca964b 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -28,6 +28,7 @@
  *    Xiaoguang Chen <xiaoguang.chen@intel.com>
  */
 
+#include <drm/i915_gvt.h>
 #include <drm/drm_edid.h>
 #include <linux/init.h>
 #include <linux/device.h>
@@ -52,7 +53,6 @@
 #include <linux/nospec.h>
 
 #include "debug.h"
-#include "gvt_public.h"
 
 static const struct intel_gvt_ops *intel_gvt_ops;
 
diff --git a/drivers/gpu/drm/i915/gvt/gvt_public.h b/include/drm/i915_gvt.h
similarity index 97%
rename from drivers/gpu/drm/i915/gvt/gvt_public.h
rename to include/drm/i915_gvt.h
index 23bf1235e1a1..3926ca32f773 100644
--- a/drivers/gpu/drm/i915/gvt/gvt_public.h
+++ b/include/drm/i915_gvt.h
@@ -21,10 +21,10 @@
  * SOFTWARE.
  */
 
-#ifndef _GVT_PUBLIC_H_
-#define _GVT_PUBLIC_H_
+#ifndef _I915_GVT_H_
+#define _I915_GVT_H_
 
-#include "hypercall.h"
+#include <drm/i915_gvt_hypercall.h>
 
 struct attribute;
 struct attribute_group;
@@ -101,4 +101,4 @@ bool intel_gvt_in_gtt(struct intel_vgpu *vgpu, u64 off);
 
 struct dentry *intel_vgpu_debugfs(struct intel_vgpu *vgpu);
 
-#endif /* _GVT_PUBLIC_H_ */
+#endif /* _I915_GVT_H_ */
diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/include/drm/i915_gvt_hypercall.h
similarity index 95%
rename from drivers/gpu/drm/i915/gvt/hypercall.h
rename to include/drm/i915_gvt_hypercall.h
index 7ed33e4919a3..c26eef7dbdde 100644
--- a/drivers/gpu/drm/i915/gvt/hypercall.h
+++ b/include/drm/i915_gvt_hypercall.h
@@ -30,8 +30,12 @@
  *
  */
 
-#ifndef _GVT_HYPERCALL_H_
-#define _GVT_HYPERCALL_H_
+#ifndef _I915_GVT_HYPERCALL_H_
+#define _I915_GVT_HYPERCALL_H_
+
+#include <linux/types.h>
+
+struct device;
 
 #include <linux/types.h>
 
@@ -84,4 +88,4 @@ extern struct intel_gvt_mpt xengt_mpt;
 int intel_gvt_register_hypervisor(struct intel_gvt_mpt *);
 void intel_gvt_unregister_hypervisor(void);
 
-#endif /* _GVT_HYPERCALL_H_ */
+#endif /* _I915_GVT_HYPERCALL_H_ */
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
