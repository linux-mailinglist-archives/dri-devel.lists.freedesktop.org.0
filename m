Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F18B28500A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 18:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 854156E4D4;
	Tue,  6 Oct 2020 16:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3881A6E4CA
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 16:40:10 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id e18so8329090wrw.9
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Oct 2020 09:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=da8h3YXhYzSHsmNVO3V4Jbn1dErOgATqgY3Xat+BpQs=;
 b=WLFCV22+Ygba+KbZRc766v+hBr92a5Hhkx3whiNgJo2QCUzKB6Me+t0Bs7nKGMHH8K
 W7fSbMKV+f/qByg6Qymc+tPvRqnRVjInVCqCgwIl+8nn2oMmY+awUPlrTqdFMwV1GEy0
 nUEQzKqycwXZlHmUf/vvWI6KnjK06xMWqB9neU60mnsDCOJHWNiqiLSMM4rgCQT7SXYv
 meDbulAQkp9xEljO+GHGVzhsNZhFx1gfTLE8X7za4wqgaTGEsQg8gsdvOPiC31kwFNwA
 6+abAoGSIy/XfomPnRaMgw9qRt6ruqBZfutJyz3DUJtqGxDaQGiKZEQz5E5CH/RzDZE1
 w7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=da8h3YXhYzSHsmNVO3V4Jbn1dErOgATqgY3Xat+BpQs=;
 b=ZyVll3Mwh66is0hTNineHFMUrTT2Z6VM5Dv1GB6YaW2/kFBJgCMgB4fOPEAIVY3USf
 PFErzux0mWVOtJGUZgc9ozS7VQe9SA0Vgn5qgn12Eg2u1opiPCu3wayJYtCYmbPhGDUJ
 9wbMgpMmtYCGGUgqcxodrPcM1gVouRhJQaT0nhnyIbGOwTKQ/10ksDe8D/uuvrF1Jd6g
 8sOxqV2S0XHOqXEATjdqOq+RFS30184zf4NLe2DXS4HUI21t2BdW1sPZdnyIA7fKnsHd
 RxmIgnLeZc0ze3gErDoZeUQrsZ/4gJXh9F3ZGvgv/g1Tef0hgmw3kKKwfEgrUe7SqSAx
 kgtw==
X-Gm-Message-State: AOAM532eoq+fj4AioyZvc+yHTSeHJoGMmMKpKFFSNLtTx+qMh0HjtS2p
 Y294pfBfaDZsUdF8MrUPA1Y=
X-Google-Smtp-Source: ABdhPJzIg4zd/lBrsJMiL4bxKbuI7X36OHuT1nVeGH0PHXiRVDTSZVnRXabV2/51ATrnFHt024JT9Q==
X-Received: by 2002:adf:db92:: with SMTP id u18mr5957380wri.412.1602002408879; 
 Tue, 06 Oct 2020 09:40:08 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id b200sm5205866wme.44.2020.10.06.09.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 09:40:08 -0700 (PDT)
Date: Tue, 6 Oct 2020 13:40:01 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: [PATCH] drm/vkms: update todo
Message-ID: <20201006164001.wmjjla2ht55krvxf@smtp.gmail.com>
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

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>

Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
---
 Documentation/gpu/vkms.rst | 99 ++++++++++++++++++++------------------
 1 file changed, 53 insertions(+), 46 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 61586fc861bb..82a01bb4104c 100644
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
+- Syzbot report:
+  WARNING in vkms_gem_free_object: https://lkml.org/lkml/2019/10/13/220
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
