Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9210C93ED2
	for <lists+dri-devel@lfdr.de>; Sat, 29 Nov 2025 14:52:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF9D10E1F8;
	Sat, 29 Nov 2025 13:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RtDmKs/r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C98610E1F8
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Nov 2025 13:48:50 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-7baf61be569so3198813b3a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Nov 2025 05:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764424130; x=1765028930; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CxF0XBnGH6LB9r496VOLJIF8yF3YVeU0DcCoOsSq/us=;
 b=RtDmKs/r6+J9a0zJWEORT5I0OYfxSsdFUkk4il4nX/0ehgghsBGjfstvv6O0eoOQ9K
 FJAsopNh4xtmLtPxw9r3Rl87NTDgZAhFQTuFcJAj3xnF4i4qvfld+WHtNhXw4inZQtMs
 gWGNwb7M+Siv9r11X+1cks4Wj1iZTP/58phDFV3Y3bpOKXnWvTWnodDj9xnL6ZZtNtaP
 JYopN+p1hVhWsDUmKi5xqi1d7bWb+WGFh8rQEMRJVBjkR7teWSdUPgDW5AWgcOFs00vI
 TfQ121DrJn+RZQbnoRs1JgT6fb3VM1MdyfHyQFOMU/NseKynUFVxnRI4OVvfcAd4aNkG
 5gEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764424130; x=1765028930;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CxF0XBnGH6LB9r496VOLJIF8yF3YVeU0DcCoOsSq/us=;
 b=BtobgOgsW8+pIbqbewjST1YU9TPxNv1pzPbQIenrsByUABmRopI9ySj8f0tdfS/vsE
 eqKA/C4iURXIdlBljiD87YH7uqn64FaT2ZwzeUagdH9rsjOPTcPDFc3lbb7zCrzrqLCh
 Jpb1M7Fp84iA1DPMx9Det0CHRi3Arncv3+dLohtfImxtm5jv2M8m5EuG93XAlrwDM+mY
 opCLLq3x1TafqPXmX8pNNJC1w0MvD/Co/Sxj3y5z/G51rwFdZUMxGJyezk70clg6RHey
 mMpvuGlpJVNkzCZUjliPPMzC3pFtbwklwaDZmIZBz5xyobp9U3YdndsoWm7+DW93U31c
 waJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxu3L292/uffeAJbErDhm0m9PsmV/2XubI2PMTuBEX2xAJXVij8ynlQX+mjufRjALFGElbkQLfi00=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypiPLckqpIWEpMlaHolnUdMBIUDX4+iltNdqhFqkn0C+CnvG5g
 6Eq7sFp44GZ0JslhlInW2mUgJPv7C0X+hYfVSriWKF/f0UOI7ry6SS+N
X-Gm-Gg: ASbGncvI7aIDqCcTcFf2LMYNpdK49Ej+OROW6yLZi9QOlmilHLUuxOuzSy511RzeaYY
 aKZujdeasS+fPE69dxqdpuLDxkxyDo1KSfv3hDpWhFX3eVyY0VZ2DKheyiE6kSqLPsh+Er+VwIZ
 L+TgmpIyY8afWH4bl52Cn3qs64Lxl6L4hCx8DB0Ac4cuZctbWNASXeC2FnSxAriclx5DDWreVlS
 5CJEPDV8M7vo5LLJBMwU0kxRjcXjJxRTr1Zu9rAMW4KDBcVwDSrmbpdB0nN7AXxT/s3fu4N0EYo
 kTNlfrVBFHhMIZFSS1EHY7UDpme2Z8oqW9RG6O6tsHeQ7o4O/vA0Jk+k8qF2XJCBL9GFRT+w07+
 g+qVr8bbntJODggPC2xdaf6B9HHd7on6zs6cJrsN0TvQS4IGN9uGym+clvd1NymXUJKo2FLxXED
 G/af8dukxKno30S7mF3u3RpOo/i62OOv2PkwXCasvhvucbUaJl/H7et7xjBYckmilB
X-Google-Smtp-Source: AGHT+IEj/pGfzV/wVSjqFnk1Rp085zRW724FpSRZrypf39X/AxpERM/MpTy8vTxQVKLagBZNvo3B5w==
X-Received: by 2002:a05:6a20:e293:b0:33e:6885:2bd4 with SMTP id
 adf61e73a8af0-36150f058ffmr35905235637.29.1764424129965; 
 Sat, 29 Nov 2025 05:48:49 -0800 (PST)
Received: from atharv-HP-Pavilion-x360-2-in-1-Laptop-14-ek1xxx..
 ([103.216.213.160]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7d151ad4d6esm8084743b3a.26.2025.11.29.05.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Nov 2025 05:48:49 -0800 (PST)
From: Atharv Dubey <atharvd440@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, dakr@kernel.org, aliceryhl@google.com,
 ojeda@kernel.org, alex.gaynor@gmail.com
Cc: boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
 daniel.almeida@collabora.com, lyude@redhat.com, shankari.ak0208@gmail.com,
 lina+kernel@asahilina.net, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Atharv Dubey <atharvd440@gmail.com>
Subject: [PATCH] rust: drm: use `pin_init::zeroed()` for file operations
 initialization
Date: Sat, 29 Nov 2025 19:18:34 +0530
Message-ID: <20251129134834.34559-1-atharvd440@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 29 Nov 2025 13:51:20 +0000
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
 rust/kernel/drm/gem/mod.rs | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 30c853988b94..c220cf1966fd 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -298,9 +298,8 @@ impl<T: DriverObject> AllocImpl for Object<T> {
 }
 
 pub(super) const fn create_fops() -> bindings::file_operations {
-    // SAFETY: As by the type invariant, it is safe to initialize `bindings::file_operations`
-    // zeroed.
-    let mut fops: bindings::file_operations = unsafe { core::mem::zeroed() };
+
+    let mut fops: bindings::file_operations = pin_init::zeroed();
 
     fops.owner = core::ptr::null_mut();
     fops.open = Some(bindings::drm_open);
-- 
2.43.0

