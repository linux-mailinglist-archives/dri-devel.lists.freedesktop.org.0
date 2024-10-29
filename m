Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 042D19B4C5F
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 15:43:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 689A410E678;
	Tue, 29 Oct 2024 14:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ZF9oIPEH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com
 [209.85.128.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D4210E678
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 14:43:17 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-6ea33140094so9572127b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 07:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1730212996; x=1730817796;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=dj4222UWLlaZLx+ULyXfsziRLNJhiLUYJXCgh1KNHNM=;
 b=ZF9oIPEHFgR9mfFdDspX49Ir2GqNJz/AsHjvlStL/j/+lL1L9x7UDcrqGfHQqHEBld
 jfNDzYRGQPqfF/drqNzGx7DUoa+h6EXN0fWqd6CXFqIg3lEDOaXmA7ofqOoFUOzhLOYq
 1RpiZDXstp11L5lUkaw2xQwSgDFsKBhHcKoVkl2OTpofo2DZ2xILYFb7sZObJxUYnAoo
 kNg2j2yh37AnCppC7Gj/78Vhn7Y1TnSux+zn7rbW1X/w9qQpurW5ygCaUkE9sLle88nN
 FRx/Bi/ASkOqYkTKwUraAsV3DWNy/13HWzwVMrrHkvSElwb5RNe6o/mCIL4+Oh5Q7nOL
 e25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730212996; x=1730817796;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dj4222UWLlaZLx+ULyXfsziRLNJhiLUYJXCgh1KNHNM=;
 b=BPbxHXLCtsmC89LcdPJu/8CF0ma4ema+nvr2xHIrjNzki74v5+0h4rZiKGNUsYdi1+
 s75fgvc3GJV9GKADf6+T+0v0ewh4WVCiQPxiE6Nuv/a9IFDj8wIs8JKhnnLjVFY71ij2
 UON6CNY73A3LpEUUbE1q8veiY58vO7TzyuZ0I8HnZBT9z9kt9a5dp9nRvyBPLVIOb+cB
 tZ+4rXOtJf+iaTttfsoBCASNngNVGKglQdN+jEl6b5Obam/28kQUUc7vUoYp/uH3pszb
 F23zGO+6J7uRrl6aERN0hd17jU748+agHM1QgAtNQ/8FHmJ8w/2x/QQxd23dLfBKPOuD
 oxeA==
X-Gm-Message-State: AOJu0Yy0V+eBo/aT7WENdlfomOtKEuKNRZfTBRSF0oaXuMwIZucI8LjI
 8MNRkjBF4ahp2dGrJYe8qbOn/X3DUu+5TWAXng0vr9HLi5RXDu4tl/F4WDJC9tplTGeS1CdL8EN
 iDmdICrwkyoE1sfCj6gJFP678WVl41Yak9YbzsubgqZTu6fqGySJqgMAMx7sLGzGYorYrSdjr5e
 eeHcdB07apcIXvMRgQNGq4sipNwNZuGWuTyGI5VCu/BGcLIcwOlyAfB766M3Rg
X-Google-Smtp-Source: AGHT+IEAQyTTcGNOrGT0TEAunoruECqoXoFwMhg6pzFZhklm1Q0LngXiZJ/AE5LUiy/seSnB+AE9AsDe6077zVI=
X-Received: from robbarnes3.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:6451])
 (user=robbarnes job=sendgmr) by 2002:a05:690c:7447:b0:6db:c3b8:c4ce with SMTP
 id 00721157ae682-6e9d8b42f2emr8350377b3.7.1730212995848; Tue, 29 Oct 2024
 07:43:15 -0700 (PDT)
Date: Tue, 29 Oct 2024 14:43:05 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241029144305.2911711-1-robbarnes@google.com>
Subject: [PATCH libdrm] modetest: Make modetest availble to vendor on Android
From: Rob Barnes <robbarnes@google.com>
To: dri-devel@lists.freedesktop.org
Cc: sukoo@google.com, Rob Barnes <robbarnes@google.com>
Content-Type: text/plain; charset="UTF-8"
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

Make modetest available to vendors on Android. libdrm_util and
libdrm_test_headers is also made available to vendors since these are
depenencies of modetest. This results in the module target
modetest.vendor being availble to vendor modules.

Signed-off-by: Rob Barnes <robbarnes@google.com>
---
 tests/Android.bp          | 1 +
 tests/modetest/Android.bp | 1 +
 tests/util/Android.bp     | 1 +
 3 files changed, 3 insertions(+)

diff --git a/tests/Android.bp b/tests/Android.bp
index cdc6c2cf..7eb3e3a9 100644
--- a/tests/Android.bp
+++ b/tests/Android.bp
@@ -3,4 +3,5 @@ subdirs = ["*"]
 cc_library_headers {
     name: "libdrm_test_headers",
     export_include_dirs: ["."],
+    vendor_available: true,
 }
diff --git a/tests/modetest/Android.bp b/tests/modetest/Android.bp
index 02688da2..f60c7ac7 100644
--- a/tests/modetest/Android.bp
+++ b/tests/modetest/Android.bp
@@ -9,4 +9,5 @@ cc_binary {
 
     shared_libs: ["libdrm"],
     static_libs: ["libdrm_util"],
+    vendor_available: true,
 }
diff --git a/tests/util/Android.bp b/tests/util/Android.bp
index 36d18206..9c1698e3 100644
--- a/tests/util/Android.bp
+++ b/tests/util/Android.bp
@@ -32,4 +32,5 @@ cc_library_static {
     shared_libs: ["libdrm"],
     header_libs: ["libdrm_test_headers"],
     export_header_lib_headers: ["libdrm_test_headers"],
+    vendor_available: true,
 }
-- 
2.47.0.163.g1226f6d8fa-goog

