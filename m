Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 951C2C034CF
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 22:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A63210E034;
	Thu, 23 Oct 2025 20:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="icK013OY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305A710E034
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 20:01:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CD72A45DCE;
 Thu, 23 Oct 2025 20:01:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32BFDC4CEFD;
 Thu, 23 Oct 2025 20:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761249710;
 bh=Eu6HfZEhZL3SUYJl2vnfzlz3reoi/tZPm0mScOAvxFE=;
 h=From:Date:Subject:To:Cc:From;
 b=icK013OYGCEOpbgsoWvdtv3EVccL7mUBJzdsVmJJTVfEIgWxqWpdM+8QCEu7R5hTm
 FxG74pNdgos++OaFPRWc3Q9tbPjBLi8ZQM6+++xCHi6T4z8ULbHP4sAhiVPMXpaj07
 KrvlKpiT1OZRxa1KFDtDwH9KUlAzfwL8e/EsFUhcfgX0HmhITSB2qkS+lzXbTbM+AL
 8lbhLr/fU1xiIEKwvfi5P1wSfUcD8PdNl2jyRdqKVJ5MlT34ylX76STYfXNrh4iflN
 c9jnl1gYKYou+xUcC/g3/9J5aQnceXtnp3vgmFuUhhTV0M5VO/pY28m4Vw1hESgq1b
 ww/8n99NmypJw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 23 Oct 2025 22:01:36 +0200
Subject: [PATCH] kbuild: Rename Makefile.extrawarn to Makefile.warn
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-rename-scripts-makefile-extrawarn-v1-1-8f7531542169@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJ+J+mgC/x2NwQrCQAwFf6XkbGC7rYf6K+Ih7r5q0K4lKbZQ+
 u8uHgeGmZ0cpnC6NDsZvur6KRXaU0PpKeUB1lyZYojnNsSODUUmsCfTeXGe5IVR32Bsi8kqVjj
 1Q5/HIYd8F6qd2aqx/R/X23H8ANNYXoRzAAAA
X-Change-ID: 20251023-rename-scripts-makefile-extrawarn-c494df9d0dba
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2086; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Eu6HfZEhZL3SUYJl2vnfzlz3reoi/tZPm0mScOAvxFE=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBm/OlfHcZxxfHelLboip1Wgtrg6/ONU73MGBjZ3/06v2
 SorVDCxo5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAExkbyIjw5xlJ1SS3l4NMxd2
 eeElKyqw73zLS5YA7qMHTMU+TRVk+8rIsH1D+jdXj79cD9y3MpRoqAWVfvx+56v1uaOlupk7rNh
 usAAA
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

Since commit e88ca24319e4 ("kbuild: consolidate warning flags in
scripts/Makefile.extrawarn"), scripts/Makefile.extrawarn contains all
warnings for the main kernel build, not just warnings enabled by the
values for W=. Rename it to scripts/Makefile.warn to make it clearer
that this Makefile is where all Kbuild warning handling should exist.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 Makefile                                      | 2 +-
 drivers/gpu/drm/Makefile                      | 2 +-
 scripts/{Makefile.extrawarn => Makefile.warn} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 79b631075d33..96ca0f17d158 100644
--- a/Makefile
+++ b/Makefile
@@ -1084,7 +1084,7 @@ KBUILD_CPPFLAGS += $(call cc-option,-fmacro-prefix-map=$(srcroot)/=)
 endif
 
 # include additional Makefiles when needed
-include-y			:= scripts/Makefile.extrawarn
+include-y			:= scripts/Makefile.warn
 include-$(CONFIG_DEBUG_INFO)	+= scripts/Makefile.debug
 include-$(CONFIG_DEBUG_INFO_BTF)+= scripts/Makefile.btf
 include-$(CONFIG_KASAN)		+= scripts/Makefile.kasan
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 4b2f7d794275..d1a102c4b80a 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -6,7 +6,7 @@
 CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
 
 # Unconditionally enable W=1 warnings locally
-# --- begin copy-paste W=1 warnings from scripts/Makefile.extrawarn
+# --- begin copy-paste W=1 warnings from scripts/Makefile.warn
 subdir-ccflags-y += -Wextra -Wunused -Wno-unused-parameter
 subdir-ccflags-y += $(call cc-option, -Wrestrict)
 subdir-ccflags-y += -Wmissing-format-attribute
diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.warn
similarity index 100%
rename from scripts/Makefile.extrawarn
rename to scripts/Makefile.warn

---
base-commit: ac1280211e1c41704c756fd1bc5512f92010b3f0
change-id: 20251023-rename-scripts-makefile-extrawarn-c494df9d0dba

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>

