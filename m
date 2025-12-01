Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF49C98650
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 18:02:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC0310E2BE;
	Mon,  1 Dec 2025 17:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N5Vp/QOM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2CD10E3FA
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 15:28:15 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-7b9c17dd591so3821667b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 07:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764602895; x=1765207695; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dCB4uXBZgUQkOf1CP9f395NPph0GsGyOxLs8b8/ayBM=;
 b=N5Vp/QOM936F+Ge5ZfjOYYuF9nzcnAftAXLLmiPyhKip4O3LdRbHekSI6sNFuxzp6H
 D5eWGZPy8+b9pqjvSGb1zHyBMx5LWvHQOr+bPmMQwGUbcDbkXNiK5qi53tr7fx9lPcxz
 aIDrB4M6cCNK4HS0kto1Uj+wk2JCaXOWRIlldAejZrwYtaM8N77/AbfDah6GnATnJFSr
 k3ORutnwnywdqepBoSvy6ZBdu951NkISuOrg7D8FQsHfc5TBxCikY8mj37dGhQyyEimL
 X7obtiByGLoLCdfWsFSNSfbB3yn2X/VEz5Iuy5hSFIKYNEYqh56ehsboLoIIR1DbxbSh
 zVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764602895; x=1765207695;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dCB4uXBZgUQkOf1CP9f395NPph0GsGyOxLs8b8/ayBM=;
 b=Cm9RdA5/cmYLFtWC9rd1yrvgn4ya+a3Y0ZIGGFGxnjBW/ikeUami3PR8V3c2JpiBbS
 lhY7mrEoqkTV7HTJhzUxBUc5LVNxKLbC3N7Zy98PF3jtU5bU1fHIRYmbEz7sb1isc9yY
 msGHPpucFBpaE/+aH2VQA8tNGNjFGUrwOUhjpZ0e/ppID8rNWlwQwsxluS6jxonXIZlL
 H9r+9FM9n3Azqr5Z8kbBdF1bVeGitjlJ29uZCUiGydZSKZeaymZdUFQpuAlVDZF786/n
 LEgZcDlgslGisZHJMxQk5orNJbDY6G+AHyuU6XQt/sblNgj0RqMSaaGzYj+LUTQWK0x1
 xZ+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOonWa9bLeQeSD0oHCyfg+kKsZjWxium9rAZZh0ZJfEmK8daTfeAhlqsa+chEUmbfIZmDvA7RKww8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywwsfpnk66nheJxiu9/Omajd95lzXkNLx72nodlXRCUCCp9Hwpl
 u8X0T93a9s3+ikCz5TZ/8H81P3alOXxHK47AHbY+5vexqzxmEz+52+em
X-Gm-Gg: ASbGncvmiiBMZHPlUfJmyH5d2Pj4Ijlo6dEtewKKN7MTw/ni8rVmJbQUz7po9YfN7vg
 P7keH0eVEh/e/ZcHy91qDWKpRbdhemRaRr76oKMfUsqjVoiMYW189lQcaV3fx6HcQH6o1CVN3pN
 SrNX0ixJc9LsItOnO5zxW5ZH7FbDqwbLdO/2A9oW5hx0LzepnMyqi34vuiHFolbj3HmPxlGI6Bl
 lNdIST3PPsjL599yOZktl1HH0v4hoecmRTmbhQjeJx8qrn4FoODvzHaOHRp1DP34bpbCLNrOkg8
 TwiuWg2Sfl2GXCLZ3s25jxbGSkltNcu+zdY6hcqIMaafwmU5yoz/vgjPzidsPaZqOUSdKwaLYFV
 sIUyB/p42F9MS+5mRl+8DSfxdgl1TaEQUk7USR826wVnD7G4WdaPlmhpapo4jp/BosaPljsGACe
 dFMS5/0pMao7Qwfycns0VmbX3TrmJVkNx51CcD+bOGJft7q1W9DKAu/EAArmgBNhWI
X-Google-Smtp-Source: AGHT+IH0CcqA+i45zWE4hwAOZUK/YbYfpvPimm4i7NbGuR7Rv0Kwg1psJKl2PjAExOkxM1RJMnNT6A==
X-Received: by 2002:a05:6a20:4320:b0:35e:deb8:bcd7 with SMTP id
 adf61e73a8af0-3637e0c5ce3mr30015738637.53.1764602894536; 
 Mon, 01 Dec 2025 07:28:14 -0800 (PST)
Received: from atharv-HP-Pavilion-x360-2-in-1-Laptop-14-ek1xxx..
 ([103.216.213.160]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7d15e9c3e41sm14059158b3a.33.2025.12.01.07.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 07:28:14 -0800 (PST)
From: Atharv Dubey <atharvd440@gmail.com>
To: Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Lyude Paul <lyude@redhat.com>, Shankari Anand <shankari.ak0208@gmail.com>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Atharv Dubey <atharvd440@gmail.com>, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: [PATCH v2] rust: drm: use `pin_init::zeroed()` for file operations
 initialization
Date: Mon,  1 Dec 2025 20:57:58 +0530
Message-ID: <20251201152759.16429-1-atharvd440@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 01 Dec 2025 17:02:00 +0000
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

Replace the manual `unsafe { core::mem::zeroed() }` initialization of
`bindings::file_operations` with `pin_init::zeroed()`. This removes the
explicit unsafe

Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 rust/kernel/drm/gem/mod.rs | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 30c853988b94..f9fd98dc102b 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -298,9 +298,7 @@ impl<T: DriverObject> AllocImpl for Object<T> {
 }
 
 pub(super) const fn create_fops() -> bindings::file_operations {
-    // SAFETY: As by the type invariant, it is safe to initialize `bindings::file_operations`
-    // zeroed.
-    let mut fops: bindings::file_operations = unsafe { core::mem::zeroed() };
+    let mut fops: bindings::file_operations = pin_init::zeroed();
 
     fops.owner = core::ptr::null_mut();
     fops.open = Some(bindings::drm_open);
-- 
2.43.0

