Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D83E573FCC6
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 15:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8738C10E2E2;
	Tue, 27 Jun 2023 13:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032BE10E2E2;
 Tue, 27 Jun 2023 13:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XXhdTWoMk14blpQJORYtPE+5yfyz5ZqdWBj8yIkLzts=; b=GVtsM/JAeN+WVIVK5y8d9+UwbL
 vQvr+6+K0y1KIV1qun0KL0TPobxoP4ch9FaLw2AcFV+RiUHM4eUbU2aJOAEHPs6lTnlI/UGB3x9Q0
 uHSyXWF1fI9dwNyrB+U5o8H4JRk7ajOxpvMdqI0gF++zcTN4Y06KyLNyKTRwz1v5Mh/IiapsMswEf
 UNJtlpWufkEyzBNENgpCLTvPOgiWgj6MZA6/9VJVumIeeElrAEoFV+Gs5PR0lToOPlshD0/SkVCpu
 7t5eMnMIKmw5ryXFHhP6kjt7TigQ9cxnS0I55bG3WO+68FWUhmlpRbIpvTxGdHdEnwvk0f8V3IV9v
 DQ5bGx5A==;
Received: from [179.113.218.86] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qE8fM-004Yyb-Bb; Tue, 27 Jun 2023 15:23:32 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/1] drm/doc: Document DRM device reset expectations
Date: Tue, 27 Jun 2023 10:23:23 -0300
Message-ID: <20230627132323.115440-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.41.0
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
Cc: pierre-eric.pelloux-prayer@amd.com, Randy Dunlap <rdunlap@infradead.org>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, Pekka Paalanen <pekka.paalanen@collabora.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Create a section that specifies how to deal with DRM device resets for
kernel and userspace drivers.

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---

v4: https://lore.kernel.org/lkml/20230626183347.55118-1-andrealmeid@igalia.com/

Changes:
 - Grammar fixes (Randy)

 Documentation/gpu/drm-uapi.rst | 68 ++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 65fb3036a580..3cbffa25ed93 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -285,6 +285,74 @@ for GPU1 and GPU2 from different vendors, and a third handler for
 mmapped regular files. Threads cause additional pain with signal
 handling as well.
 
+Device reset
+============
+
+The GPU stack is really complex and is prone to errors, from hardware bugs,
+faulty applications and everything in between the many layers. Some errors
+require resetting the device in order to make the device usable again. This
+sections describes the expectations for DRM and usermode drivers when a
+device resets and how to propagate the reset status.
+
+Kernel Mode Driver
+------------------
+
+The KMD is responsible for checking if the device needs a reset, and to perform
+it as needed. Usually a hang is detected when a job gets stuck executing. KMD
+should keep track of resets, because userspace can query any time about the
+reset stats for an specific context. This is needed to propagate to the rest of
+the stack that a reset has happened. Currently, this is implemented by each
+driver separately, with no common DRM interface.
+
+User Mode Driver
+----------------
+
+The UMD should check before submitting new commands to the KMD if the device has
+been reset, and this can be checked more often if the UMD requires it. After
+detecting a reset, UMD will then proceed to report it to the application using
+the appropriate API error code, as explained in the section below about
+robustness.
+
+Robustness
+----------
+
+The only way to try to keep an application working after a reset is if it
+complies with the robustness aspects of the graphical API that it is using.
+
+Graphical APIs provide ways to applications to deal with device resets. However,
+there is no guarantee that the app will use such features correctly, and the
+UMD can implement policies to close the app if it is a repeating offender,
+likely in a broken loop. This is done to ensure that it does not keep blocking
+the user interface from being correctly displayed. This should be done even if
+the app is correct but happens to trigger some bug in the hardware/driver.
+
+OpenGL
+~~~~~~
+
+Apps using OpenGL should use the available robust interfaces, like the
+extension ``GL_ARB_robustness`` (or ``GL_EXT_robustness`` for OpenGL ES). This
+interface tells if a reset has happened, and if so, all the context state is
+considered lost and the app proceeds by creating new ones. If it is possible to
+determine that robustness is not in use, the UMD will terminate the app when a
+reset is detected, giving that the contexts are lost and the app won't be able
+to figure this out and recreate the contexts.
+
+Vulkan
+~~~~~~
+
+Apps using Vulkan should check for ``VK_ERROR_DEVICE_LOST`` for submissions.
+This error code means, among other things, that a device reset has happened and
+it needs to recreate the contexts to keep going.
+
+Reporting causes of resets
+--------------------------
+
+Apart from propagating the reset through the stack so apps can recover, it's
+really useful for driver developers to learn more about what caused the reset in
+first place. DRM devices should make use of devcoredump to store relevant
+information about the reset, so this information can be added to user bug
+reports.
+
 .. _drm_driver_ioctl:
 
 IOCTL Support on Device Nodes
-- 
2.41.0

