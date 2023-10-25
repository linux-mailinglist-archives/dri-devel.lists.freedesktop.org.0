Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9917D6D0F
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 15:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9CD010E5CE;
	Wed, 25 Oct 2023 13:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C5B10E5CE
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 13:24:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 03B6ECE355D;
 Wed, 25 Oct 2023 13:24:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAC8BC433C7;
 Wed, 25 Oct 2023 13:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698240277;
 bh=BwKbZ5ReCwVERtqQs2LDpAt1FQF0VTyxj6vLqi25Hvs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z1hnr7TKNFFpFMMZfLSPdtP9uaJGlXBEP2Ibs+AOgftia4t/uW26SvwEQyTZCV4HW
 m5RNASMOI58r0cs3skZgF9adr3Pml0TNVQG+fzP1G28YVNF/PmCjmS8o7t0Qr4o9UZ
 4dNU6ppkoVSUQqyb6DPa2L73HlteKHTg6YyZlxgfWmwJpezWkL1VgHAZ2OOJivzfvM
 skowA0OvSUEwY2LE9DUdju/uMI0DASdpMoQzMxeX2NkxcYDRd3CplBgRbQ8PvAhUbj
 bar7a2rT7zXCMT2xfZYlctDIuqjcUu4SV52s4IzZCMvB9wVCU0NUplG9KaI1QMiqpz
 CDEP3LJsKaSGA==
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 2/2] drm/todo: Add entry to clean up former seltests suites
Date: Wed, 25 Oct 2023 15:24:28 +0200
Message-ID: <20231025132428.723672-2-mripard@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025132428.723672-1-mripard@kernel.org>
References: <20231025132428.723672-1-mripard@kernel.org>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Most of those suites are undocumented and aren't really clear about what
they are testing. Let's add a TODO entry as a future task to get started
into KUnit and DRM.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/gpu/todo.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 03fe5d1247be..b62c7fa0c2bc 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -621,6 +621,23 @@ Contact: Javier Martinez Canillas <javierm@redhat.com>
 
 Level: Intermediate
 
+Clean up and document former selftests suites
+---------------------------------------------
+
+Some KUnit test suites (drm_buddy, drm_cmdline_parser, drm_damage_helper,
+drm_format, drm_framebuffer, drm_dp_mst_helper, drm_mm, drm_plane_helper and
+drm_rect) are former selftests suites that have been converted over when KUnit
+was first introduced.
+
+These suites were fairly undocumented, and with different goals than what unit
+tests can be. Trying to identify what each test in these suites actually test
+for, whether that makes sense for a unit test, and either remove it if it
+doesn't or document it if it does would be of great help.
+
+Contact: Maxime Ripard <mripard@kernel.org>
+
+Level: Intermediate
+
 Enable trinity for DRM
 ----------------------
 
-- 
2.41.0

