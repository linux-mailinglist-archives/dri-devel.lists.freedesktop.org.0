Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E1928549E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 00:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DC389C96;
	Tue,  6 Oct 2020 22:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5662489C96
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 22:30:14 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id v12so390598wmh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Oct 2020 15:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=0y9kRlXrEfmUcLRqKqUTw5bfZKehoVOK/LHP+MmLejk=;
 b=Gd5ey35hXBOBoC1mwCkhTkOAr1klYQ7f4ZPbEzpRB/y0RmpHEogv9FrsBAv5PEOFTz
 ovf31Yubq01D6SS1M/6TNPr9uhRQ7IjeWJ4Gn8vTlmW2Zqv/mTDx5YBTgr7LPFAuZt3H
 jRwhhMjcL+JyvpVjeG45VMcYOeyB+4BUF0XPhRD7rq6lNFJTWZINElKwry5oIgMR0dAt
 vYORZ3rUAKKd3xIfBMaGROaP+Aqw1DYaIYK092YXFLttCVCn8qv47UGHnUqaGP6d1VNu
 DGp6OOeWc8Iix4bWFWWO7M+gs72eKv5t8x3ZjLayoMpKngAJ0C9q4w9EcN7JRmGDWUbF
 SjKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=0y9kRlXrEfmUcLRqKqUTw5bfZKehoVOK/LHP+MmLejk=;
 b=UKdQawdUuHeffOeYaDRUURY/Utj7U5qzzkriXSckGrqRPTlRFbcIxO3iKkeYxcgmPJ
 BZUpyE/lV7uV85Xb5Iya3pTg0Q9C8UKeg3ioednVbGVo62JoolgK/7+i9joLuPS5ogIn
 ipCWQs97Zx0wtPDmsyotwIvK6r0SE0Qkq8nUm9O7VPTsV3mw2E49Sds1ujVJ+57hAvnj
 SGBxPNdOb+ykSmD9tYJZEo7gjusjRN3Qy8koLmNM8CaCnBZrkN26HuaanVAhuYGs7uxk
 wspbvziOH4JHBZlaaH0cyDq/DQeZgKdldV0NUGUuHivNSOQncJhW9KnDhbzpIKYN3YAo
 K9hw==
X-Gm-Message-State: AOAM530hSanBvA/G6VT31Abufb2XMpxin8unUV/1GNs9MOTg70k1bSB1
 ID7OC0wQT1pAGkjv1i4e4Fz4+un4esY=
X-Google-Smtp-Source: ABdhPJybB2pw9U6LDuyxmJZs06tvG1Gwk273XJJZ8zixRpF15bKN3IX8bPe+ek0GoT/b8KQPfzNb8A==
X-Received: by 2002:a1c:4856:: with SMTP id v83mr130985wma.118.1602023412767; 
 Tue, 06 Oct 2020 15:30:12 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id o16sm212686wrp.52.2020.10.06.15.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 15:30:12 -0700 (PDT)
Date: Tue, 6 Oct 2020 19:30:06 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: [PATCH v2] drm/vkms: update todo
Message-ID: <20201006223006.gu55pjtuaigkh6il@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop issues already resolved in vkms:

- CRC API Improvements to [1] add igt test to check extreme alpha values
  and [2] alpha blending;
- [3] prime buffer sharing;
- [4] writeback support;

On the other hand, we also found or thought about other improvements since
the last update of this document:

- better support for IGT tests
- improvements to writeback support
- syzbot report

Finally, we reorder items by the assumed complexity.

[1] https://patchwork.freedesktop.org/series/55944/
[2] https://patchwork.freedesktop.org/series/80823/
[3] https://patchwork.freedesktop.org/series/63212/
[4] https://patchwork.freedesktop.org/series/81177/

v2:
- Link to syzbot dashboard

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>

Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 Documentation/gpu/vkms.rst | 99 ++++++++++++++++++++------------------
 1 file changed, 53 insertions(+), 46 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 61586fc861bb..50b30dea0ba8 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -10,36 +10,24 @@
 TODO
 ====
 
-CRC API Improvements
---------------------
-
-- Optimize CRC computation ``compute_crc()`` and plane blending ``blend()``
-
-- Use the alpha value to blend vaddr_src with vaddr_dst instead of
-  overwriting it in ``blend()``.
-
-- Add igt test to check cleared alpha value for XRGB plane format.
-
-- Add igt test to check extreme alpha values i.e. fully opaque and fully
-  transparent (intermediate values are affected by hw-specific rounding modes).
-
-Runtime Configuration
----------------------
-
-We want to be able to reconfigure vkms instance without having to reload the
-module. Use/Test-cases:
-
-- Hotplug/hotremove connectors on the fly (to be able to test DP MST handling of
-  compositors).
+If you want to do any of the items listed below, please share your interest
+with one of the VKMS maintainers.
 
-- Configure planes/crtcs/connectors (we'd need some code to have more than 1 of
-  them first).
+IGT better support
+------------------
 
-- Change output configuration: Plug/unplug screens, change EDID, allow changing
-  the refresh rate.
+- Investigate: (1) test cases on kms_plane that are failing due to timeout on
+  capturing CRC; (2) when running kms_flip test cases in sequence, some
+  successful individual test cases are failing randomly.
 
-The currently proposed solution is to expose vkms configuration through
-configfs.  All existing module options should be supported through configfs too.
+- VKMS already has support for vblanks simulated via hrtimers, which can be
+  tested with kms_flip test; in some way, we can say that VKMS already mimics
+  the real hardware vblank. However, we also have virtual hardware that does
+  not support vblank interrupt and completes page_flip events right away; in
+  this case, compositor developers may end up creating a busy loop on virtual
+  hardware. It would be useful to support Virtual Hardware behavior in VKMS
+  because this can help compositor developers to test their features in
+  multiple scenarios.
 
 Add Plane Features
 ------------------
@@ -55,34 +43,50 @@ There's lots of plane features we could add support for:
 - Additional buffer formats, especially YUV formats for video like NV12.
   Low/high bpp RGB formats would also be interesting.
 
-- Async updates (currently only possible on cursor plane using the legacy cursor
-  api).
+- Async updates (currently only possible on cursor plane using the legacy
+  cursor api).
+
+For all of these, we also want to review the igt test coverage and make sure
+all relevant igt testcases work on vkms.
+
+Prime Buffer Sharing
+--------------------
 
-For all of these, we also want to review the igt test coverage and make sure all
-relevant igt testcases work on vkms.
+- Syzbot report - WARNING in vkms_gem_free_object:
+  https://syzkaller.appspot.com/bug?extid=e7ad70d406e74d8fc9d0
+
+Runtime Configuration
+---------------------
+
+We want to be able to reconfigure vkms instance without having to reload the
+module. Use/Test-cases:
+
+- Hotplug/hotremove connectors on the fly (to be able to test DP MST handling
+  of compositors).
+
+- Configure planes/crtcs/connectors (we'd need some code to have more than 1 of
+  them first).
+
+- Change output configuration: Plug/unplug screens, change EDID, allow changing
+  the refresh rate.
+
+The currently proposed solution is to expose vkms configuration through
+configfs.  All existing module options should be supported through configfs
+too.
 
 Writeback support
 -----------------
 
-Currently vkms only computes a CRC for each frame. Once we have additional plane
-features, we could write back the entire composited frame, and expose it as:
+- The writeback and CRC capture operations share the use of composer_enabled
+  boolean to ensure vblanks. Probably, when these operations work together,
+  composer_enabled needs to refcounting the composer state to proper work.
 
-- Writeback connector. This is useful for testing compositors if you don't have
-  hardware with writeback support.
+- Add support for cloned writeback outputs and related test cases using a
+  cloned output in the IGT kms_writeback.
 
 - As a v4l device. This is useful for debugging compositors on special vkms
   configurations, so that developers see what's really going on.
 
-Prime Buffer Sharing
---------------------
-
-We already have vgem, which is a gem driver for testing rendering, similar to
-how vkms is for testing the modeset side. Adding buffer sharing support to vkms
-allows us to test them together, to test synchronization and lots of other
-features. Also, this allows compositors to test whether they work correctly on
-SoC chips, where the display and rendering is very often split between 2
-drivers.
-
 Output Features
 ---------------
 
@@ -93,7 +97,10 @@ Output Features
 - Add support for link status, so that compositors can validate their runtime
   fallbacks when e.g. a Display Port link goes bad.
 
-- All the hotplug handling describe under "Runtime Configuration".
+CRC API Improvements
+--------------------
+
+- Optimize CRC computation ``compute_crc()`` and plane blending ``blend()``
 
 Atomic Check using eBPF
 -----------------------
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
