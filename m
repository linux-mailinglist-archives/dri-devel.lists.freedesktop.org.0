Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A89A1C3544
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 11:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97DA289935;
	Mon,  4 May 2020 09:08:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1112E89935
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 09:08:50 +0000 (UTC)
IronPort-SDR: suJlqH2E/ejb2S2G+RywiCKfxDZcYMRthHP5IvR8tXExpw6zon1bWI4+QvRYxWhDZ0JMU7lRNw
 9W1kcYACuVWA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2020 02:08:49 -0700
IronPort-SDR: Qid/nHcAY0rd9qs22mLTGDvKF+d/RGqN+MlkffsIWKOuE1nJbp9Dr36VUfASWGMyXzv4L+qAcX
 UvHbal+r+yBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,351,1583222400"; d="scan'208";a="406416780"
Received: from sorvi.fi.intel.com ([10.237.72.159])
 by orsmga004.jf.intel.com with ESMTP; 04 May 2020 02:08:48 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] uapi/drm/drm_fourcc.h: Note on platform specificity for
 format modifiers
Date: Mon,  4 May 2020 12:08:43 +0300
Message-Id: <20200504090843.27074-1-mika.kahola@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: Mika Kahola <mika.kahola@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make an additional note on DRM format modifiers for x and y tiling. These
format modifiers are defined for BDW+ platforms and therefore definition
is not valid for older gens. This is due to address swizzling for tiled
surfaces is no longer used. For newer platforms main memory controller has
a more effective address swizzling algorithm.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 include/uapi/drm/drm_fourcc.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 8bc0b31597d8..3e56c24cabb6 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -356,7 +356,8 @@ extern "C" {
  *
  * This format is highly platforms specific and not useful for cross-driver
  * sharing. It exists since on a given platform it does uniquely identify the
- * layout in a simple way for i915-specific userspace.
+ * layout in a simple way for i915-specific userspace.  The format is
+ * ill-defined for platforms older than BDW.
  */
 #define I915_FORMAT_MOD_X_TILED	fourcc_mod_code(INTEL, 1)
 
@@ -371,7 +372,8 @@ extern "C" {
  *
  * This format is highly platforms specific and not useful for cross-driver
  * sharing. It exists since on a given platform it does uniquely identify the
- * layout in a simple way for i915-specific userspace.
+ * layout in a simple way for i915-specific userspace. The format is
+ * ill-defined for platforms older than BDW.
  */
 #define I915_FORMAT_MOD_Y_TILED	fourcc_mod_code(INTEL, 2)
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
