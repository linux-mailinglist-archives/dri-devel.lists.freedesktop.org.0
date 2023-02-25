Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 305AD6A28CC
	for <lists+dri-devel@lfdr.de>; Sat, 25 Feb 2023 11:10:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1E710E14F;
	Sat, 25 Feb 2023 10:10:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from h7.fbrelay.privateemail.com (h7.fbrelay.privateemail.com
 [162.0.218.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E818510E0FD
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Feb 2023 07:29:23 +0000 (UTC)
Received: from MTA-08-3.privateemail.com (unknown [198.54.122.141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by h7.fbrelay.privateemail.com (Postfix) with ESMTPS id EA710601EC
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Feb 2023 02:29:21 -0500 (EST)
Received: from mta-08.privateemail.com (localhost [127.0.0.1])
 by mta-08.privateemail.com (Postfix) with ESMTP id 3F62A18000A0;
 Sat, 25 Feb 2023 02:29:19 -0500 (EST)
Received: from localhost.localdomain (cpe-66-66-66-125.rochester.res.rr.com
 [66.66.66.125])
 by mta-08.privateemail.com (Postfix) with ESMTPA id E7B7D18000A2;
 Sat, 25 Feb 2023 02:29:06 -0500 (EST)
From: Dylan Le <self@dylanle.dev>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 1/1] Documentation: gpu: add acceleration node section
Date: Sat, 25 Feb 2023 07:28:34 +0000
Message-Id: <40a2ba00efc1f2479bf55b90f4afe7a1532ef760.1677308797.git.self@dylanle.dev>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1677308797.git.self@dylanle.dev>
References: <cover.1677308797.git.self@dylanle.dev>
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

Add a stubbed section on Acceleration Nodes.
Resolve gpu documentation warning:
./Documentation/gpu/drm-internals:179: ./include/drm/drm_file.h:411: WARNING: undefined label: drm_accel_node

Signed-off-by: Dylan Le <self@dylanle.dev>
---
 Documentation/gpu/drm-uapi.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index ce47b4292..98c5add9c 100644
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
+.. admonition:: This section is empty.
+
+   Add relevant documentation here.
+
 Device Hot-Unplug
 =================
 
-- 
2.30.2

