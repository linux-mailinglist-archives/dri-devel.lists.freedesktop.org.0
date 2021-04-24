Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1016D36A17A
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 15:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D32D899DB;
	Sat, 24 Apr 2021 13:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8D0899DB
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Apr 2021 13:57:30 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id n127so15703753wmb.5
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Apr 2021 06:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=F/cBmxkdRv7LP17B6HrPWavjoTvZXAbwSqL+QY2xiyw=;
 b=mua/nQXAzvKf9y9BsM5NBvzafQS7w3v8AETU8nSwjLgaya7TEEoVmGMBo3NGtLeuPd
 QHKgWjoiaZLmwlWobDZ/qM5aepoAlX8D5Qprigq3bADBBvQzYzysumOmVdHn/iAm71zo
 aFvziSamQSHCYT5XbCPeyDwDgl+0Qhg5BQPssrv/+vNdgOKbzw3xU5vJT0mtgXzv62Mx
 3Tp1HnlkaE81qSnFQ3EnngxffqhLl1QJnsH4Mmk3k1GirgOuwKwbUUKrgzrSnoj71a4W
 sEnCY7P8XoYcZuzd9GK6YU3Ls02+dqT4Y/s36LMBBkJWedyX5CbNA7iMfW1cmpBk2+8B
 ygNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=F/cBmxkdRv7LP17B6HrPWavjoTvZXAbwSqL+QY2xiyw=;
 b=ZjwvyHOJ0C96B9KprmLAHmPiAAzqvt6y2T4ryyZcWwb8Ma0FAvyblI6WX14UqiMY50
 f+KU7NT/w9vyc5Z1I7ZiaymDGx6vzyGTRfezceoDcLhnYRnsr5GflSZaHcNSJ63Toohm
 zNT1hQ+HGZ1x5jcNeRUX9NGnbwnKIrJbTlP6+HI5/070DnUJGvDjYJ6Bdnk/53mtsxX6
 5gLY53UxQJHpkWyIsFUg+p7UJCilgaIkXVyMd/kJuRV11p/8g+Mnz9m3PXJUa52OnjnZ
 q5VbNU2S5a+kXJmBJ5IDplmRbmQUeKpLjIpblF1SfkKBE1bnztJY7UqA89vvfUstlaLQ
 5BOg==
X-Gm-Message-State: AOAM5303cY+9IEAv9FXYDjnkv0MUlr+V3/uDvSCBUXFsPHvd8P6H7934
 7asY0ACGRtt3yThdUaQykc96qUS/CKqBFk4G
X-Google-Smtp-Source: ABdhPJxbsOK612b2t4fNtV+ocoe0oL3tSAxkDHb1DN1pUpgwZCGh9wlxtflkN11FoF6WQx1YRrcdGQ==
X-Received: by 2002:a05:600c:4ec8:: with SMTP id
 g8mr11106702wmq.134.1619272648634; 
 Sat, 24 Apr 2021 06:57:28 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id y21sm765750wmc.46.2021.04.24.06.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Apr 2021 06:57:28 -0700 (PDT)
Date: Sat, 24 Apr 2021 10:57:22 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vkms: update the current status of todo list
Message-ID: <20210424135722.s3bwmqeutqmelxv3@smtp.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Sumera Priyadarsini <sylphrenadin@gmail.com>
Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
---
 Documentation/gpu/vkms.rst | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 2c9b376da5ca..dbcb175da958 100644
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
@@ -116,7 +124,15 @@ Add Plane Features
 
 There's lots of plane features we could add support for:
 
-- Real overlay planes, not just cursor.
+- Clearing primary plane: clear primary plane before plane composition (at the
+  start) for correctness of pixel blend ops. It also guarantees alpha channel
+  is cleared in the target buffer for stable crc. [Good to start]
+
+- ARGB format on primary plane: blend the primary plane into background with
+  translucent alpha.
+
+- Support when the primary plane isn't exactly matching the output size: blend
+  the primary plane into the black background.
 
 - Full alpha blending on all planes.
 
@@ -129,13 +145,8 @@ There's lots of plane features we could add support for:
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
@@ -153,7 +164,7 @@ module. Use/Test-cases:
   the refresh rate.
 
 The currently proposed solution is to expose vkms configuration through
-configfs.  All existing module options should be supported through configfs
+configfs. All existing module options should be supported through configfs
 too.
 
 Writeback support
@@ -162,6 +173,7 @@ Writeback support
 - The writeback and CRC capture operations share the use of composer_enabled
   boolean to ensure vblanks. Probably, when these operations work together,
   composer_enabled needs to refcounting the composer state to proper work.
+  [Good to start]
 
 - Add support for cloned writeback outputs and related test cases using a
   cloned output in the IGT kms_writeback.
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
