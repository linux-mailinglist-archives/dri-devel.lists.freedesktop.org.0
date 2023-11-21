Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BA77F3990
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 23:57:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F5B10E2D2;
	Tue, 21 Nov 2023 22:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6148610E2CF
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 22:56:53 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1cc938f9612so40361405ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 14:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700607413; x=1701212213; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=VvsEAsvFJCAuzTkOhawjNcVDzfJqg2jxoNzCw1vuYxM=;
 b=OT498GU+2yk5POBegn8p2k4R8nHHxlEZJzAV6eOL37XHtpQzOj3WlZb2yKzYIezDFd
 gAUMiSpcFkhKbVBwyFs4u/ulYrvawYBh6JTIyfqnecqFvNLWHbp83nfSPsq87wSOKeFQ
 5FMEO3ELE5WNJOr2D2YcPR2nfJXbajWQAfl33iJlscxvwud1PXYUlKxkyra9Ati0r6OX
 x24NaAKip3NH9IPy69tDqGa1v1Wc8pMBt9eK3vg/bT/Sfo0fD4hm0r3r9s0HlokQAjQI
 kX6S9fwQUHiwEhGMfxV6mO1/Jhj9HzzbXye1Ke87YkoaeSPUZFIhPx/c6fLBET0P7Aq1
 DJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700607413; x=1701212213;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VvsEAsvFJCAuzTkOhawjNcVDzfJqg2jxoNzCw1vuYxM=;
 b=QiEpkVmWoTrq+JE8cvRXIPy+hkCH/w9gZ9D0rNKt5k2XK9Zep27xSfKOuFek1eMpVV
 Svfqk97F026Vd5Ftx8AKzikFd/dReutVGixCpmIqbWUuizD0Z/agCzHayAvg0IW6DqmG
 XlhEQvyxz9cgMqITfAFeOhshH4KxTgdJyvnbWLQvBerhKIWKvc8EQ//xqOR0K/2/RVSK
 +nNWF/BsECo9pZj3oGxmfnCysjBLa1jd05ElCMe09c37CgNs4EAFPRl87GXmnaag2L1H
 //zZ5pQcjoIXQUnkfHg9rkfmg0Oi3U2boxVRBuaCJ1ZXb1J03lqJMP7RcO2fAUTov989
 uF4g==
X-Gm-Message-State: AOJu0YyPDjrC0TZht+3cFlsQhgoEOB3tmpLxPyhpXpXWYwP1gsC0jx11
 cyCXMibKy6sArob7RHdLqrc=
X-Google-Smtp-Source: AGHT+IEixIM7V9jXUvQI2iY90FGeBw9eNcXJcsg0YhY579MahaeWwDFx+r2X2Fo8ANAZMdHPBZ1vYA==
X-Received: by 2002:a17:902:d346:b0:1cc:3932:4a87 with SMTP id
 l6-20020a170902d34600b001cc39324a87mr588713plk.56.1700607412734; 
 Tue, 21 Nov 2023 14:56:52 -0800 (PST)
Received: from bangji.hsd1.ca.comcast.net
 ([2601:647:6780:42e0:7377:923f:1ff3:266d])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a1709026bcc00b001cc47c1c29csm8413189plt.84.2023.11.21.14.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 14:56:51 -0800 (PST)
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>
Subject: [PATCH 01/14] tools headers UAPI: Update tools's copy of drm headers
Date: Tue, 21 Nov 2023 14:56:36 -0800
Message-ID: <20231121225650.390246-1-namhyung@kernel.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
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
Cc: Ian Rogers <irogers@google.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Peter Zijlstra <peterz@infradead.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Maxime Ripard <mripard@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-perf-users@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ingo Molnar <mingo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tldr; Just FYI, I'm carrying this on the perf tools tree.

Full explanation:

There used to be no copies, with tools/ code using kernel headers
directly. From time to time tools/perf/ broke due to legitimate kernel
hacking. At some point Linus complained about such direct usage. Then we
adopted the current model.

The way these headers are used in perf are not restricted to just
including them to compile something.

There are sometimes used in scripts that convert defines into string
tables, etc, so some change may break one of these scripts, or new MSRs
may use some different #define pattern, etc.

E.g.:

  $ ls -1 tools/perf/trace/beauty/*.sh | head -5
  tools/perf/trace/beauty/arch_errno_names.sh
  tools/perf/trace/beauty/drm_ioctl.sh
  tools/perf/trace/beauty/fadvise.sh
  tools/perf/trace/beauty/fsconfig.sh
  tools/perf/trace/beauty/fsmount.sh
  $
  $ tools/perf/trace/beauty/fadvise.sh
  static const char *fadvise_advices[] = {
        [0] = "NORMAL",
        [1] = "RANDOM",
        [2] = "SEQUENTIAL",
        [3] = "WILLNEED",
        [4] = "DONTNEED",
        [5] = "NOREUSE",
  };
  $

The tools/perf/check-headers.sh script, part of the tools/ build
process, points out changes in the original files.

So its important not to touch the copies in tools/ when doing changes in
the original kernel headers, that will be done later, when
check-headers.sh inform about the change to the perf tools hackers.

Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Namhyung Kim <namhyung@kernel.org>
---
 tools/include/uapi/drm/drm.h      | 20 ++++++++++++++++++++
 tools/include/uapi/drm/i915_drm.h |  8 ++++----
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/tools/include/uapi/drm/drm.h b/tools/include/uapi/drm/drm.h
index 794c1d857677..de723566c5ae 100644
--- a/tools/include/uapi/drm/drm.h
+++ b/tools/include/uapi/drm/drm.h
@@ -1134,6 +1134,26 @@ extern "C" {
 #define DRM_IOCTL_MODE_PAGE_FLIP	DRM_IOWR(0xB0, struct drm_mode_crtc_page_flip)
 #define DRM_IOCTL_MODE_DIRTYFB		DRM_IOWR(0xB1, struct drm_mode_fb_dirty_cmd)
 
+/**
+ * DRM_IOCTL_MODE_CREATE_DUMB - Create a new dumb buffer object.
+ *
+ * KMS dumb buffers provide a very primitive way to allocate a buffer object
+ * suitable for scanout and map it for software rendering. KMS dumb buffers are
+ * not suitable for hardware-accelerated rendering nor video decoding. KMS dumb
+ * buffers are not suitable to be displayed on any other device than the KMS
+ * device where they were allocated from. Also see
+ * :ref:`kms_dumb_buffer_objects`.
+ *
+ * The IOCTL argument is a struct drm_mode_create_dumb.
+ *
+ * User-space is expected to create a KMS dumb buffer via this IOCTL, then add
+ * it as a KMS framebuffer via &DRM_IOCTL_MODE_ADDFB and map it via
+ * &DRM_IOCTL_MODE_MAP_DUMB.
+ *
+ * &DRM_CAP_DUMB_BUFFER indicates whether this IOCTL is supported.
+ * &DRM_CAP_DUMB_PREFERRED_DEPTH and &DRM_CAP_DUMB_PREFER_SHADOW indicate
+ * driver preferences for dumb buffers.
+ */
 #define DRM_IOCTL_MODE_CREATE_DUMB DRM_IOWR(0xB2, struct drm_mode_create_dumb)
 #define DRM_IOCTL_MODE_MAP_DUMB    DRM_IOWR(0xB3, struct drm_mode_map_dumb)
 #define DRM_IOCTL_MODE_DESTROY_DUMB    DRM_IOWR(0xB4, struct drm_mode_destroy_dumb)
diff --git a/tools/include/uapi/drm/i915_drm.h b/tools/include/uapi/drm/i915_drm.h
index 7000e5910a1d..218edb0a96f8 100644
--- a/tools/include/uapi/drm/i915_drm.h
+++ b/tools/include/uapi/drm/i915_drm.h
@@ -38,13 +38,13 @@ extern "C" {
  */
 
 /**
- * DOC: uevents generated by i915 on it's device node
+ * DOC: uevents generated by i915 on its device node
  *
  * I915_L3_PARITY_UEVENT - Generated when the driver receives a parity mismatch
- *	event from the gpu l3 cache. Additional information supplied is ROW,
+ *	event from the GPU L3 cache. Additional information supplied is ROW,
  *	BANK, SUBBANK, SLICE of the affected cacheline. Userspace should keep
- *	track of these events and if a specific cache-line seems to have a
- *	persistent error remap it with the l3 remapping tool supplied in
+ *	track of these events, and if a specific cache-line seems to have a
+ *	persistent error, remap it with the L3 remapping tool supplied in
  *	intel-gpu-tools.  The value supplied with the event is always 1.
  *
  * I915_ERROR_UEVENT - Generated upon error detection, currently only via
-- 
2.43.0.rc1.413.gea7ed67945-goog

