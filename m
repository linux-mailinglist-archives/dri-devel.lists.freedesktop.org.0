Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CFD1E0EA9
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 14:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 657996E075;
	Mon, 25 May 2020 12:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2F56E075
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 12:46:56 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id z6so20568145ljm.13
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 05:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R898yiOcBY0CzaacxZvnWnVPpHvfmv7opK74Q/0l5S8=;
 b=KaHM7dyN/hmueng2itLws42eYFeDuo4LO5A1WZwHeck4DpZfVnJGTzaPKOhY+WVzJW
 jA33SeTyxin37WOUW94e6ZSAseWg/j/DcAnUXcfIkFKZd90WxaseMcHLSG86Mr6iK15y
 YtMGXDUF4GTTcoJVklZ3cd2ZwrUtck/Q535gUyCXyiR8jyvPgkAJRAAbnj30VJP0pOVt
 JL3tO9HibLZWUtj6LUYMGoHO2F0WwkXjazL6kxXplP1peGCGyml9AaOH6zQqjeEoBELR
 X563J2p9yy1xP6sT3PEDzXXuBIKkiVjHh8BVe46pE8hCY7lsB4KoI3YhN/6AyIr32zFH
 w4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R898yiOcBY0CzaacxZvnWnVPpHvfmv7opK74Q/0l5S8=;
 b=OzCRFe7j7nX/H+pE4BT1euPxEobAAFov8mX3pm8Db8hbNvUvg3a5zuJ+5RAoy0oXOu
 gtO2p7kjAT7BPP6aCvBSJMxNOnWZCUZINTAk43Gq8wQmCumURMQyfk56ix+QGECn+Amo
 Tz+yVyp5l37LW9Qg5zuhWuRfTlR7kzwDVNhASyZRSAeFO76Lk4ddXBPd0qW0t8n2fam0
 iVkZiVd/7Pfoh/ooodHL0u2V9qgjaVCIfjLONOZ9TRPe27m0nWZ9Y892QA+DqfiRR1So
 paLrn0aoktOuuNMfkayWfpiQo4d6Y2EnwZbJOMETMAcGMdYQlal6CLBodAzWYBs+htDj
 uTeA==
X-Gm-Message-State: AOAM533IGf1Tgnu6QWhWPF4yKscC3I63rOaQod19BEBgPZLMhqS6T7SA
 tg/5Is54Qouqd1brFKGZkfISh/+1
X-Google-Smtp-Source: ABdhPJx2igbwO5+4Sa1ILWQHl0+hj3/Ms8Qc1pRPKjnqc98qEscjC4sPaTNerOKOQpWYOI59w3Sq1g==
X-Received: by 2002:a2e:8645:: with SMTP id i5mr10274014ljj.284.1590410814679; 
 Mon, 25 May 2020 05:46:54 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id o11sm312531ljg.56.2020.05.25.05.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 05:46:53 -0700 (PDT)
From: Pekka Paalanen <ppaalanen@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/doc: device hot-unplug for userspace
Date: Mon, 25 May 2020 15:46:14 +0300
Message-Id: <20200525124614.16339-1-ppaalanen@gmail.com>
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

Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Simon Ser <contact@emersion.fr>

---

v2:
- mmap reads/writes undefined (danvet)
- make render ioctl behaviour driver-specific (danvet)
- restructure the mmap paragraphs (danvet)
- chardev minor notes (Simon)
- open behaviour (danvet)
- DRM leasing behaviour (danvet)
- added links

Disclaimer: I am a userspace developer writing for other userspace developers.
I took some liberties in defining what should happen without knowing what is
actually possible or what existing drivers already implement.
---
 Documentation/gpu/drm-uapi.rst | 102 +++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 56fec6ed1ad8..520b8e640ad1 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -1,3 +1,5 @@
+.. Copyright 2020 DisplayLink (UK) Ltd.
+
 ===================
 Userland interfaces
 ===================
@@ -162,6 +164,106 @@ other hand, a driver requires shared state between clients which is
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
+disappearance from the device removed uevent or in some cases
+driver-specific ioctls returning EIO.
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
+Requirements for UAPI
+---------------------
+
+The goal raises at least the following requirements for the kernel and
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
+- dmabuf which point to memory that has disappeared will continue to
+  be successfully imported if it would have succeeded before the
+  disappearance.
+
+- Attempting to import a dmabuf to a disappeared device will succeed if
+  it would have succeeded without the disappearance.
+
+- Some userspace APIs already define what should happen when the device
+  disappears (OpenGL, GL ES: `GL_KHR_robustness`_; `Vulkan`_:
+  VK_ERROR_DEVICE_LOST; etc.). DRM drivers are free to implement this
+  behaviour the way they see best, e.g. returning failures in
+  driver-specific ioctls and handling those in userspace drivers, or
+  rely on uevents, and so on.
+
+- open() on a device node whose underlying device has disappeared will
+  fail.
+
+- Attempting to create a DRM lease on a disappeared DRM device will
+  fail. Existing DRM leases remain.
+
+.. _GL_KHR_robustness: https://www.khronos.org/registry/OpenGL/extensions/KHR/KHR_robustness.txt
+.. _Vulkan: https://www.khronos.org/vulkan/
+
+Requirements for memory maps
+----------------------------
+
+Memory maps have further requirements. If the underlying memory
+disappears, the mmap is modified such that reads and writes will still
+complete successfully but the result is undefined. This applies to both
+userspace mmap()'d memory and memory pointed to by dmabuf which might be
+mapped to other devices.
+
+Raising SIGBUS is not an option, because userspace cannot realistically
+handle it.  Signal handlers are global, which makes them extremely
+difficult to use correctly from libraries like those that Mesa produces.
+Signal handlers are not composable, you can't have different handlers
+for GPU1 and GPU2 from different vendors, and a third handler for
+mmapped regular files.  Threads cause additional pain with signal
+handling as well.
+
 .. _drm_driver_ioctl:
 
 IOCTL Support on Device Nodes
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
