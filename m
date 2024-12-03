Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA249E120D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 04:53:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF12A10E465;
	Tue,  3 Dec 2024 03:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E6/hE7Ig";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECDA10E465
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 03:53:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5AED5A412DF;
 Tue,  3 Dec 2024 03:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F12A4C4CED6;
 Tue,  3 Dec 2024 03:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733198033;
 bh=O1RWkaeULx9ZPpdPzg3sbjMLr7t24XttgegNRluRTnY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E6/hE7Ig4WEjC7Mj78y+e2UHlJFg02WpUMgIRzashRP8vLlsnpd+Rd1GvbD1he76n
 rTIKmb1TGuOUW2tjamnsZVOWJdcJUt+uZAsC06FVa4vkKq3dt5rL28QJeWBU8a2/4p
 JYCXLvg53BpaIUtFOnJnsNPgESVWI4+69E2onyWqtFzhHOwnZeSfdtT5PoLZGtHHNl
 JV68rWUx9HKb4wJWI5lIK1hrWaKQepeHYvw9gEMsRQ8OBwGOJv+bYgwJTBogOWA956
 Ihm2i7DMdgCCMs3y4MsSlWtsuEOiA32pK7u/d5w8zuFXwvYgRH91e24kTs4z9B5JBJ
 t5KEMOnioLSkQ==
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH 01/11] tools headers: Sync uapi/drm/drm.h with the kernel
 sources
Date: Mon,  2 Dec 2024 19:53:39 -0800
Message-ID: <20241203035349.1901262-2-namhyung@kernel.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241203035349.1901262-1-namhyung@kernel.org>
References: <20241203035349.1901262-1-namhyung@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To pick up the changes in this cset:

  56c594d8df64e726 ("drm: add DRM_SET_CLIENT_NAME ioctl")

This addresses these perf build warnings:

  Warning: Kernel ABI header differences:
    diff -u tools/include/uapi/drm/drm.h include/uapi/drm/drm.h

Please see tools/include/uapi/README for further details.

Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Namhyung Kim <namhyung@kernel.org>
---
 tools/include/uapi/drm/drm.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tools/include/uapi/drm/drm.h b/tools/include/uapi/drm/drm.h
index 16122819edfeff87..7fba37b94401a6d5 100644
--- a/tools/include/uapi/drm/drm.h
+++ b/tools/include/uapi/drm/drm.h
@@ -1024,6 +1024,13 @@ struct drm_crtc_queue_sequence {
 	__u64 user_data;	/* user data passed to event */
 };
 
+#define DRM_CLIENT_NAME_MAX_LEN		64
+struct drm_set_client_name {
+	__u64 name_len;
+	__u64 name;
+};
+
+
 #if defined(__cplusplus)
 }
 #endif
@@ -1288,6 +1295,16 @@ extern "C" {
  */
 #define DRM_IOCTL_MODE_CLOSEFB		DRM_IOWR(0xD0, struct drm_mode_closefb)
 
+/**
+ * DRM_IOCTL_SET_CLIENT_NAME - Attach a name to a drm_file
+ *
+ * Having a name allows for easier tracking and debugging.
+ * The length of the name (without null ending char) must be
+ * <= DRM_CLIENT_NAME_MAX_LEN.
+ * The call will fail if the name contains whitespaces or non-printable chars.
+ */
+#define DRM_IOCTL_SET_CLIENT_NAME	DRM_IOWR(0xD1, struct drm_set_client_name)
+
 /*
  * Device specific ioctls should only be in their respective headers
  * The device specific ioctl range is from 0x40 to 0x9f.
-- 
2.47.0.338.g60cca15819-goog

