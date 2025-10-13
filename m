Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B66BD5B6C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 20:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F204610E4B5;
	Mon, 13 Oct 2025 18:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="gTl+5Fpc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C20510E4B5;
 Mon, 13 Oct 2025 18:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=e7MUAq2TzEga1NDFu6gzR/wzMemW1mSHjARIoivFb2w=; b=gTl+5FpcgQvi4kQ/D05GXpVQG3
 cba5VCpmA5o7elQQz1tReQFU4i95WuSaf6CZiYzgfqmcCkfNd98UMVopILQX8RBae+Pjlp0zpNBw0
 XkTvr1Ts6AhwIxAbH6jnUnRGcMiLEfToDwgM7Msm62zwBarT7/K81zHqtWOuyQuI7R84+fc3lHzNJ
 3XM6MEPaW02ykH16WoN4geGB8yqSNvsx/oIF52XMUIpGus+0Qq3mc11NUzqSnX21yTzkL6EWZgrgC
 9M0p1wpH42pCDPrz3TKipsR3/hGjfJE9S1l+JPkaazVqt6mHn10zi3FNzCGkS6K19QpJywHbZsIWo
 gdtEj06g==;
Received: from [50.53.43.113] (helo=smtpauth.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1v8NHd-0000000BcK0-35M3; Mon, 13 Oct 2025 18:28:35 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH] drm/xe: xe_guc_pc.c: fix DOC underlines
Date: Mon, 13 Oct 2025 11:28:26 -0700
Message-ID: <20251013182827.733781-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Apparently a recent change in docutils has made checking of section
heading levels (underline style) be more careful.

There are 2 heading underline style errors reported here. Repair them by
changing the underline style from Chapter (using '=') to Section (using
'-') since they are used within a Chapter already (in xe_firmware.rst).

"""
Documentation/gpu/xe/xe_firmware.rst:31: drivers/gpu/drm/xe/xe_guc_pc.c:75: ERROR: A level 2 section cannot be used here.

Frequency management:
=====================

Established title styles: =/= =

The parent of level 2 sections cannot be reached. The parser is at section level 2 but the current node has only 0 parent section(s).
One reason may be a high level section used in a directive that parses its content into a base node not attached to the document
(up to Docutils 0.21, these sections were silently dropped). [docutils]
Documentation/gpu/xe/xe_firmware:31: ../drivers/gpu/drm/xe/xe_guc_pc.c:86: ERROR: A level 2 section cannot be used here.

Render-C States:
================

Established title styles: =/= =

The parent of level 2 sections cannot be reached. The parser is at section level 2 but the current node has only 0 parent section(s).
One reason may be a high level section used in a directive that parses its content into a base node not attached to the document
(up to Docutils 0.21, these sections were silently dropped). [docutils]
"""

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Sorry for the resend. I didn't have .gitconfig present so parts of
this didn't work as intended.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
---
 drivers/gpu/drm/xe/xe_guc_pc.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- linux-next-20251010.orig/drivers/gpu/drm/xe/xe_guc_pc.c
+++ linux-next-20251010/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -74,8 +74,8 @@
  * connected power conservation features in the GuC firmware. The firmware
  * exposes a programming interface to the host for the control of SLPC.
  *
- * Frequency management:
- * =====================
+ * Frequency management
+ * --------------------
  *
  * Xe driver enables SLPC with all of its defaults features and frequency
  * selection, which varies per platform.
@@ -85,8 +85,8 @@
  * thus saving power. Base profile is default and ensures balanced performance
  * for any workload.
  *
- * Render-C States:
- * ================
+ * Render-C States
+ * ---------------
  *
  * Render-C states is also a GuC PC feature that is now enabled in Xe for
  * all platforms.
