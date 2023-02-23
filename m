Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D129B6A28BE
	for <lists+dri-devel@lfdr.de>; Sat, 25 Feb 2023 11:10:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1BA10E10B;
	Sat, 25 Feb 2023 10:10:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 887 seconds by postgrey-1.36 at gabe;
 Thu, 23 Feb 2023 03:09:52 UTC
Received: from h5.fbrelay.privateemail.com (h5.fbrelay.privateemail.com
 [162.0.218.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E37110E207
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 03:09:52 +0000 (UTC)
Received: from MTA-12-4.privateemail.com (unknown [198.54.122.141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by h5.fbrelay.privateemail.com (Postfix) with ESMTPS id 7C9156023A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 02:55:03 +0000 (UTC)
Received: from mta-12.privateemail.com (localhost [127.0.0.1])
 by mta-12.privateemail.com (Postfix) with ESMTP id 4ACB218000B0;
 Wed, 22 Feb 2023 21:55:01 -0500 (EST)
Received: from localhost.localdomain (cpe-66-66-66-125.rochester.res.rr.com
 [66.66.66.125])
 by mta-12.privateemail.com (Postfix) with ESMTPA id DE25E18000A3;
 Wed, 22 Feb 2023 21:54:49 -0500 (EST)
From: Dylan Le <self@dylanle.dev>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] Documentation: gpu: add acceleration node section
Date: Thu, 23 Feb 2023 02:52:52 +0000
Message-Id: <7799513f0fb5aee27b64752c037980471be669c5.1677120686.git.self@dylanle.dev>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Sat, 25 Feb 2023 10:10:08 +0000
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
Cc: Dylan Le <self@dylanle.dev>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This patch was initially written for the Linux Kernel Bug Fixing Mentorship
program. The patch adds a temporarily stubbed section on Acceleration Nodes
to resolve a documentation warning.

This resolves the warning:
./Documentation/gpu/drm-internals:179: ./include/drm/drm_file.h:411: WARNING: undefined label: drm_accel_node

I would appreciate any feedback on what should be documented here.

Signed-off-by: Dylan Le <self@dylanle.dev>
---
 Documentation/gpu/drm-uapi.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index ce47b4292..d25539862 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -175,6 +175,15 @@ other hand, a driver requires shared state between clients which is
 visible to user-space and accessible beyond open-file boundaries, they
 cannot support render nodes.
 
+.. _drm_accel_node:
+
+Acceleration nodes
+==================
+
+.. note::
+   There is not any documentation yet need to figure out what this is.
+
+
 Device Hot-Unplug
 =================
 
-- 
2.30.2

