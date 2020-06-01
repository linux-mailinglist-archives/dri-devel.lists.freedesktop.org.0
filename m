Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2511EA5EE
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 16:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BEB89E7C;
	Mon,  1 Jun 2020 14:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF2D89E7C
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 14:32:21 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id a25so8408732ljp.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jun 2020 07:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KpnNYbdPwIvXvnn1Ef5XNtbgVHEjv1UPKCKejAKyT30=;
 b=ikf28jc0QYOkH+6Jj0dHRnAmREoWrvUFPcK2fzs8fjkBaL31dgmnk4Pz7F/sOYyw/t
 KeqtQsDOXBj/9FDRZ7B30pJwbCPs1WbgN9dm4PACeUn3wz6KF+XYUjfuMgg+5TbfymJf
 ThhFB0da4dsjZHp+9nZ+BV0jJ8bY7PZSdo9JOhEX/xxb3IrjZLGJdHyLbGEsSHmLi95y
 /hK+vNo28Bs4qk3G00LtSq4g1PjBYx7e9PTkVuBKMq2XAixwcmCVpu/dgRtIxc/yOqw3
 JHaR3Ij9X33Curs3jl7+VlTkxwX7AWwOZLA2z+SW93po1VURJcOuNDm+UcFEsxgeR8t+
 jvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KpnNYbdPwIvXvnn1Ef5XNtbgVHEjv1UPKCKejAKyT30=;
 b=sARzCT9bNa4rEx/g6+Zle3vJbH/bCYuH+Vr8BzPf860gis6Q28yB9+mHk1e5naVBQE
 MAUWEc6LVObRX4hzfVgDE+2y8gu2VlMV2AiiGdMFiTb7mH9fAhcw78P/Z/2i8DsX+kL7
 vceNMnJZxSbW5ibWFR1HmuWYCb0vnx6+3yB9fP9vT5zLiJTkaKmo0B50tJCB9N+1TRmH
 VN611NvzcDDYMwycVm96aO3A2mbKuM6taWm//X2axZySi1WvFpitVWvlHp3FBqfY5kBk
 6gJ2DUGjLlGYs0WN0cU0N4tUIGvJW3Ml19RhJIDza6Pz3jyUyg7qbmD0Yd/jP3JaYRRK
 jMFA==
X-Gm-Message-State: AOAM533R/tSp6sJLu4J4U4s1HTNXSgASwqwMSUrlWVUxLmGGTV/24KQ8
 /GTTNz/wUG0WAUAKc8Wi7tITxThl
X-Google-Smtp-Source: ABdhPJwuBgZlmG9XJRr0PGRSgiTKmf0Zy9MZKM8DINjJC6n4LaQmLno/PtU5aWx32bH9rXjeAH+oAg==
X-Received: by 2002:a2e:9141:: with SMTP id q1mr3373629ljg.196.1591021939801; 
 Mon, 01 Jun 2020 07:32:19 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id 201sm2395718ljf.130.2020.06.01.07.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 07:32:18 -0700 (PDT)
From: Pekka Paalanen <ppaalanen@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/doc: device hot-unplug for userspace
Date: Mon,  1 Jun 2020 17:32:03 +0300
Message-Id: <20200601143203.14666-1-ppaalanen@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200519100649.12053-1-ppaalanen@gmail.com>
References: <20200519100649.12053-1-ppaalanen@gmail.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Pekka Paalanen <pekka.paalanen@collabora.com>

Set up the expectations on how hot-unplugging a DRM device should look like to
userspace.

Written by Daniel Vetter's request and largely based on his comments in IRC and
from https://lists.freedesktop.org/archives/dri-devel/2020-May/265484.html .

A related Wayland protocol change proposal is at
https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/35

Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Simon Ser <contact@emersion.fr>

---

v3:
- update ENODEV doc (Daniel)
- clarify existing vs. new mmaps (Andrey)
- split into KMS and render/cross sections (Andrey, Daniel)
- open() returns ENXIO (open(2) man page)
- ioctls may return ENODEV (Andrey, Daniel)
- new wayland-protocols MR

v2:
- mmap reads/writes undefined (Daniel)
- make render ioctl behaviour driver-specific (Daniel)
- restructure the mmap paragraphs (Daniel)
- chardev minor notes (Simon)
- open behaviour (Daniel)
- DRM leasing behaviour (Daniel)
- added links

Disclaimer: I am a userspace developer writing for other userspace developers.
I took some liberties in defining what should happen without knowing what is
actually possible or what existing drivers already implement.
---
 Documentation/gpu/drm-uapi.rst | 114 ++++++++++++++++++++++++++++++++-
 1 file changed, 113 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 56fec6ed1ad8..db56c681b648 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -1,3 +1,5 @@
+.. Copyright 2020 DisplayLink (UK) Ltd.
+
 ===================
 Userland interfaces
 ===================
@@ -162,6 +164,116 @@ other hand, a driver requires shared state between clients which is
 visible to user-space and accessible beyond open-file boundaries, they
 cannot support render nodes.
 
+Device Hot-Unplug
+=================
+
+.. note::
+   The following is the plan. Implementation is not there yet
+   (2020 May).
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
+disappearance from the device removed uevent, ioctls returning ENODEV
+(or driver-specific ioctls returning driver-specific things), or open()
+returning ENXIO.
+
+Only after userspace has closed all relevant DRM device and dmabuf file
+descriptors and removed all mmaps, the DRM driver can tear down its
+instance for the device that no longer exists. If the same physical
+device somehow comes back in the mean time, it shall be a new DRM
+device.
+
+Similar to PIDs, chardev minor numbers are not recycled immediately. A
+new DRM device always picks the next free minor number compared to the
+previous one allocated, and wraps around when minor numbers are
+exhausted.
+
+The goal raises at least the following requirements for the kernel and
+drivers.
+
+Requirements for KMS UAPI
+-------------------------
+
+- KMS connectors must change their status to disconnected.
+
+- Legacy modesets and pageflips, and atomic commits, both real and
+  TEST_ONLY, and any other ioctls either fail with ENODEV or fake
+  success.
+
+- Pending non-blocking KMS operations deliver the DRM events userspace
+  is expecting. This applies also to ioctls that faked success.
+
+- open() on a device node whose underlying device has disappeared will
+  fail with ENXIO.
+
+- Attempting to create a DRM lease on a disappeared DRM device will
+  fail with ENODEV. Existing DRM leases remain and work as listed
+  above.
+
+Requirements for Render and Cross-Device UAPI
+---------------------------------------------
+
+- All GPU jobs that can no longer run must have their fences
+  force-signalled to avoid inflicting hangs to userspace.
+  The associated error code is ENODEV.
+
+- Some userspace APIs already define what should happen when the device
+  disappears (OpenGL, GL ES: `GL_KHR_robustness`_; `Vulkan`_:
+  VK_ERROR_DEVICE_LOST; etc.). DRM drivers are free to implement this
+  behaviour the way they see best, e.g. returning failures in
+  driver-specific ioctls and handling those in userspace drivers, or
+  rely on uevents, and so on.
+
+- dmabuf which point to memory that has disappeared will either fail to
+  import with ENODEV or continue to be successfully imported if it would
+  have succeeded before the disappearance. See also about memory maps
+  below for already imported dmabufs.
+
+- Attempting to import a dmabuf to a disappeared device will either fail
+  with ENODEV or succeed if it would have succeeded without the
+  disappearance.
+
+- open() on a device node whose underlying device has disappeared will
+  fail with ENXIO.
+
+.. _GL_KHR_robustness: https://www.khronos.org/registry/OpenGL/extensions/KHR/KHR_robustness.txt
+.. _Vulkan: https://www.khronos.org/vulkan/
+
+Requirements for Memory Maps
+----------------------------
+
+Memory maps have further requirements that apply to both existing maps
+and maps created after the device has disappeared. If the underlying
+memory disappeared, the map is created or modified such that reads and
+writes will still complete successfully but the result is undefined.
+This applies to both userspace mmap()'d memory and memory pointed to by
+dmabuf which might be mapped to other devices (cross-device dmabuf
+imports).
+
+Raising SIGBUS is not an option, because userspace cannot realistically
+handle it. Signal handlers are global, which makes them extremely
+difficult to use correctly from libraries like those that Mesa produces.
+Signal handlers are not composable, you can't have different handlers
+for GPU1 and GPU2 from different vendors, and a third handler for
+mmapped regular files. Threads cause additional pain with signal
+handling as well.
+
 .. _drm_driver_ioctl:
 
 IOCTL Support on Device Nodes
@@ -199,7 +311,7 @@ EPERM/EACCES:
         difference between EACCES and EPERM.
 
 ENODEV:
-        The device is not (yet) present or fully initialized.
+        The device is not anymore present or is not yet fully initialized.
 
 EOPNOTSUPP:
         Feature (like PRIME, modesetting, GEM) is not supported by the driver.
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
