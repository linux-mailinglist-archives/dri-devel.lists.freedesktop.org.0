Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 115E91D9408
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 12:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 283206E1C4;
	Tue, 19 May 2020 10:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1570F6E1C4
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 10:07:01 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id a4so10701810lfh.12
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 03:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a2Kr0vph4IwGhRzx2nq1WlXu2aVTIRUavyKvOwhNkNQ=;
 b=Vr2BaVzemkL33LqunylPH7TpiUAgFHEsVyiKgIaklWV6oGmoP2uiigUhsxBs5rre95
 QvZd8QUtv7td7fAJTs6bcgiRO5bqJEib8qNb/pl7JsKg/hPvBAkYN8z+qr8ELCmD1dYp
 jWeIj+minQ3MrVtBvqWFm0GeaIBm4/GZBKXp8Dp9vo091/ZumJkwCDzHKU6O+P9+Eodf
 8Pd+gXZb10EgCJqa5IuiVyfUNqMS8vJasXKBftxXKfXhTgtAMfysZsW6Orwn8c197wvc
 OAktYB93Z59NDq94/iHJcS/rwMY/jgGp5ptm/FHIDOK/HMBRBpoXFr1c68pAv3tUxbeL
 4Eew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a2Kr0vph4IwGhRzx2nq1WlXu2aVTIRUavyKvOwhNkNQ=;
 b=sSkL/Kk3TFXtyMZNuv+m46/zeDWWCstVYbZpA4udWKe7QUGlFwQcdfBQYq0KqZAeq5
 leZgpOR5ELzJpy54gMGfDZN2n+Rl9lgE56fxrOF0OEd3v+Cf1pCDAeWWkdWg7+W3/MEz
 RFJ9ki9RXhPJkyg3iLn/VUv2FACHWXQJvttqI9mKztnTmcmigF1f/tXANV5FUB7RCOc4
 kv+zLAC92+x7k56lCd02PW2cr8EWvsWC+YBfux9utxtMTgpEOScU15OqFvcbF5frU8CG
 Bf2lqHi+8l267aRynGbx+9gezUbA13CKbiCMaOc0xeypKzK1cretZhBPAIis93SlzXXX
 B7dQ==
X-Gm-Message-State: AOAM532d5ci/w5XKQ2Of68JAocWDgBWezdus8phUJ+u7euMQTSIyvCUm
 f/LUGmdZX2H+VHBaW7h886OlbWCl
X-Google-Smtp-Source: ABdhPJyksQ1MtKPriLAtsJ32OOGnY/HAJZd1wXy6RJdOD1nRsjuDqTUEBwx+TJBAMAoY20AInKFrHQ==
X-Received: by 2002:ac2:50d8:: with SMTP id h24mr15384103lfm.63.1589882819104; 
 Tue, 19 May 2020 03:06:59 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id s4sm7317349lja.14.2020.05.19.03.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 03:06:58 -0700 (PDT)
From: Pekka Paalanen <ppaalanen@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/doc: device hot-unplug for userspace
Date: Tue, 19 May 2020 13:06:49 +0300
Message-Id: <20200519100649.12053-1-ppaalanen@gmail.com>
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
Cc: Sean Paul <sean@poorly.run>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Pekka Paalanen <pekka.paalanen@collabora.com>

Set up the expectations on how hot-unplugging a DRM device should look like to
userspace.

Written by Daniel Vetter's request and largely based on his comments in IRC and
from https://lists.freedesktop.org/archives/dri-devel/2020-May/265484.html .

Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Sean Paul <sean@poorly.run>

---

Disclaimer: I am a userspace developer writing for other userspace developers.
I took some liberties in defining what should happen without knowing what is
actually possible or what existing drivers already implement.
---
 Documentation/gpu/drm-uapi.rst | 75 ++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 56fec6ed1ad8..80db4abd2cbd 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -1,3 +1,5 @@
+.. Copyright 2020 DisplayLink (UK) Ltd.
+
 ===================
 Userland interfaces
 ===================
@@ -162,6 +164,79 @@ other hand, a driver requires shared state between clients which is
 visible to user-space and accessible beyond open-file boundaries, they
 cannot support render nodes.
 
+Device Hot-Unplug
+=================
+
+.. note::
+   The following is the plan. Implementation is not there yet
+   (2020 May 13).
+
+Graphics devices (display and/or render) may be connected via USB (e.g.
+display adapters or docking stations) or Thunderbolt (e.g. eGPU). An end
+user is able to hot-unplug this kind of devices while they are being
+used, and expects that the very least the machine does not crash. Any
+damage from hot-unplugging a DRM device needs to be limited as much as
+possible and userspace must be given the chance to handle it if it wants
+to. Ideally, unplugging a DRM device still lets a desktop to continue
+running, but that is going to need explicit support throughout the whole
+graphics stack: from kernel and userspace drivers, through display
+servers, via window system protocols, and in applications and libraries.
+
+Other scenarios that should lead to the same are: unrecoverable GPU
+crash, PCI device disappearing off the bus, or forced unbind of a driver
+from the physical device.
+
+In other words, from userspace perspective everything needs to keep on
+working more or less, until userspace stops using the disappeared DRM
+device and closes it completely. Userspace will learn of the device
+disappearance from the device removed uevent or in some cases specific
+ioctls returning EIO.
+
+This goal raises at least the following requirements for the kernel and
+drivers:
+
+- The kernel must not hang, crash or oops, no matter what userspace was
+  in the middle of doing when the device disappeared.
+
+- All GPU jobs that can no longer run must have their fences
+  force-signalled to avoid inflicting hangs to userspace.
+
+- KMS connectors must change their status to disconnected.
+
+- Legacy modesets and pageflips fake success.
+
+- Atomic commits, both real and TEST_ONLY, fake success.
+
+- Pending non-blocking KMS operations deliver the DRM events userspace
+  is expecting.
+
+- If underlying memory disappears, the mmaps are replaced with harmless
+  zero pages where access does not raise SIGBUS. Reads return zeros,
+  writes are ignored.
+
+- dmabuf which point to memory that has disappeared are rewritten to
+  point to harmless zero pages, similar to mmaps. Imports still succeed
+  both ways: an existing device importing a dmabuf pointing to
+  disappeared memory, and a disappeared device importing any dmabuf.
+
+- Render ioctls return EIO which is then handled in userspace drivers,
+  e.g. Mesa, to have the device disappearance handled in the way
+  specified for each API (OpenGL, GL ES: GL_KHR_robustness;
+  Vulkan: VK_ERROR_DEVICE_LOST; etc.)
+
+Raising SIGBUS is not an option, because userspace cannot realistically
+handle it.  Signal handlers are global, which makes them extremely
+difficult to use correctly from libraries like Mesa produces. Signal
+handlers are not composable, you can't have different handlers for GPU1
+and GPU2 from different vendors, and a third handler for mmapped regular
+files.  Threads cause additional pain with signal handling as well.
+
+Only after userspace has closed all relevant DRM device and dmabuf file
+descriptors and removed all mmaps, the DRM driver can tear down its
+instance for the device that no longer exists. If the same physical
+device somehow comes back in the mean time, it shall be a new DRM
+device.
+
 .. _drm_driver_ioctl:
 
 IOCTL Support on Device Nodes
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
