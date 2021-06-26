Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FA13B4DCD
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jun 2021 11:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C85F6EC01;
	Sat, 26 Jun 2021 09:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581436EC01
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jun 2021 09:27:04 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id l12so12774069wrt.3
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jun 2021 02:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=FJVgQt3yQ40cvm1CZ9+zNO1rF2SB4dEaQ4XO/2K/ulY=;
 b=XOzSKCZ7PIKRcKtP/HaxLwh+sJrpp9EPVFCoKBOej6DkVf940hqVDaJbAXdgvFS7yh
 zCKKTZBRcMN4OlcwWGG24znC5r2ZzFMAxcaI7l+ZuZu4m3+K5K1b/XdpUo2T0Ndi03W3
 OcI/29RWzuv6qtxrRaflLOUuepmWr6fpkWWqgXxcGzf7cfh1ZFzeuHgWIQX2Nl3CgHDF
 uwbbwAecnsdmhD1TAXDkav7NmpRmQi45vsHIirCRiSbpn+B71lX9cPmHoq0V8Xjs2nky
 q66KgkLxnhd43yZN5g+Svoqb37cq69yn5xwHbabTrJJ1Pku/UyPsy6Y3QsS/JCrRbd0l
 yi1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=FJVgQt3yQ40cvm1CZ9+zNO1rF2SB4dEaQ4XO/2K/ulY=;
 b=ROA+h2Mmy0VUh/T58wt6QZi3uhWM6ao+zmjdwaH1y55rl+emvmPKYF+dM2xeqKADtA
 t8B+ShTK4uxdklB79cpcuUN2ggGd8Jt2Zu48Ezzo7EQlBo8ohRHVx6o5B/OCzm82dTH4
 F5NMT89bjzkLAIE2dr7AyaSSLtDvaeCm463UxK4OKi8Idd0qVDbXjf090HZcqu2GX6F+
 bkP8pUwnySFj0jRU10GqN3SC89FbKstA5bCp/3DPB6pzq/V/awhu1oHRX1rE4yh6Wom+
 oLtmQPnNI42HY3uDeWuxTZ3IUo4oh3rVfHhMDGx+fpqEQHh+eEYr2RohttyIFgPIFLTk
 E6mg==
X-Gm-Message-State: AOAM533vBSWaVWSDZ8GsM/py1+kg4JsQgCIjqmCu0SaK0sbbTchWdGUe
 UXWrSnywEAE0gJGQZBDANzYIpVaWGZ/RCg==
X-Google-Smtp-Source: ABdhPJyJjiSAT7KL4XYqJNQt/HgTw9/T0GgBfNtLuOpZsYAKQrYVl2jYJI40ob+Ti1rOpbJ3BF6pBA==
X-Received: by 2002:a5d:6291:: with SMTP id k17mr16205964wru.225.1624699622779; 
 Sat, 26 Jun 2021 02:27:02 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id n65sm13056692wme.21.2021.06.26.02.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Jun 2021 02:27:02 -0700 (PDT)
Date: Sat, 26 Jun 2021 10:26:55 +0100
From: Melissa Wen <melissa.srw@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/vkms: update the current status of todo list
Message-ID: <20210626092655.ghmmt2yux5klrne7@smtp.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update:
- debugging issues on igt testcases
- plane composition features: add primary plane improvements
- suggestions of good tasks to start working on vkms

Drop:
- syzkaller bug report:
  what triggered the warning was replaced by shmem functions at
  https://patchwork.freedesktop.org/patch/394614/
- overlay plane: this feature was added by
  https://patchwork.freedesktop.org/patch/430941/

---

v2:
- add task to enable multiple overlay planes (Simon)

Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
---
 Documentation/gpu/vkms.rst | 38 ++++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 2c9b376da5ca..941f0e7e5eef 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -98,9 +98,17 @@ with VKMS maintainers.
 IGT better support
 ------------------
 
-- Investigate: (1) test cases on kms_plane that are failing due to timeout on
-  capturing CRC; (2) when running kms_flip test cases in sequence, some
-  successful individual test cases are failing randomly.
+Debugging:
+
+- kms_plane: some test cases are failing due to timeout on capturing CRC;
+
+- kms_flip: when running test cases in sequence, some successful individual
+  test cases are failing randomly; when individually, some successful test
+  cases display in the log the following error::
+
+  [drm:vkms_prepare_fb [vkms]] ERROR vmap failed: -4
+
+Virtual hardware (vblank-less) mode:
 
 - VKMS already has support for vblanks simulated via hrtimers, which can be
   tested with kms_flip test; in some way, we can say that VKMS already mimics
@@ -116,7 +124,17 @@ Add Plane Features
 
 There's lots of plane features we could add support for:
 
-- Real overlay planes, not just cursor.
+- Multiple overlay planes. [Good to get started]
+
+- Clearing primary plane: clear primary plane before plane composition (at the
+  start) for correctness of pixel blend ops. It also guarantees alpha channel
+  is cleared in the target buffer for stable crc. [Good to get started]
+
+- ARGB format on primary plane: blend the primary plane into background with
+  translucent alpha.
+
+- Support when the primary plane isn't exactly matching the output size: blend
+  the primary plane into the black background.
 
 - Full alpha blending on all planes.
 
@@ -129,13 +147,8 @@ There's lots of plane features we could add support for:
   cursor api).
 
 For all of these, we also want to review the igt test coverage and make sure
-all relevant igt testcases work on vkms.
-
-Prime Buffer Sharing
---------------------
-
-- Syzbot report - WARNING in vkms_gem_free_object:
-  https://syzkaller.appspot.com/bug?extid=e7ad70d406e74d8fc9d0
+all relevant igt testcases work on vkms. They are good options for internship
+project.
 
 Runtime Configuration
 ---------------------
@@ -153,7 +166,7 @@ module. Use/Test-cases:
   the refresh rate.
 
 The currently proposed solution is to expose vkms configuration through
-configfs.  All existing module options should be supported through configfs
+configfs. All existing module options should be supported through configfs
 too.
 
 Writeback support
@@ -162,6 +175,7 @@ Writeback support
 - The writeback and CRC capture operations share the use of composer_enabled
   boolean to ensure vblanks. Probably, when these operations work together,
   composer_enabled needs to refcounting the composer state to proper work.
+  [Good to get started]
 
 - Add support for cloned writeback outputs and related test cases using a
   cloned output in the IGT kms_writeback.
-- 
2.30.2

