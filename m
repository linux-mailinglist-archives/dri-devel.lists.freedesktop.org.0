Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DA4AF9B51
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 21:50:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDCB710E052;
	Fri,  4 Jul 2025 19:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EtdmTypu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5CB10E052
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 19:50:30 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6fabe9446a0so12151406d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 12:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751658630; x=1752263430; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XNhvIHtOBpbCJYqem6GBWVYViowpWEgdYxq8EYZIWqA=;
 b=EtdmTypuOy6WZv6r264WwdUqxfgMLnwFO227HkRSISSYU+93p1eROzkqRuJkEGP2vL
 3zoU+5eZOLanyfzZ1ZYkDh5XohJDKk+Zk0Ro1l7PxbTqj3hm6QEtq2z3SuWu2e7Bh7R3
 +px0+UVDsSBm8S+erRYMq2WgKkiLkrrlL24pCGHJubeb5Axa389CuLb98E9l5VONPmer
 1ICUXghAn3JeZtYAz6SFKyBfIoLTfJU0CSpg+C0UNXxMV4v2DNcEHQUj3MnxjlAwBIHk
 HAsA/6uMyT8zK1yevtyqT8sly5jFgtOxL/7ptxzmL98bNCFrdNTC7Hz7kJTWvlPAfQkq
 i1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751658630; x=1752263430;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XNhvIHtOBpbCJYqem6GBWVYViowpWEgdYxq8EYZIWqA=;
 b=kWrx2FPxuVU2LMC1B/AkBWWEs65deecf/lRqfmk+msafP1ORGOHokuR6hAZLbxsbp1
 F/PrTpMIbgmVpWKnZXq6ykH1qYAe12evKgIFMVrbaox3uiJ2zxuIL72JxpikT7506qi2
 MPhUWoLpMGrDVmACIdaFwP6YJE+hIogC7OswU0KN+RseEdb7pVpOWMe8uY/vd1sN8cbv
 RP15S3qvpQCIOdyS6QJTwQ9xcrnC9jeWNOqAVlfz3TT9gSZzt9r6wOKhN7wSHeLGEtPQ
 E+tm5c2dG794Mq0UTTVXSVQ6XqnhIRtMmPFqpgKDUbJGFMqG3GMOSvJGaW1LaUh+WRv7
 wheg==
X-Gm-Message-State: AOJu0YztZtindUgvK6FfV68rH3N1PxGLB3jnbP3GEH/eTJCe4BmJQhss
 SuPtbew3szQZsxe0SnZvuZzQNYk4+gflByAmbKRw9H54SP7dy+dNLia0
X-Gm-Gg: ASbGncsmWl0E0rP1W+Xaf8pLjXQ09ZoCkxVwlJSuMbXLSgnCbtLyXzSLnmqyEGX13eL
 WvmBsa0l4FLOltmS7aaHMEiyjxy1Z5M7IBne81f44T/L5be3QDdEgNU/WKoHkVfY/HLrDwvyZFo
 9V7pKtiqzrDNlgJ6Dr8T6MrpJR6lZM9KHBLuyxGHftEZEPiKbZpABgh8gVHfHNy52b6deA53ovG
 mI+wrs2xILyhZmgY6tc2LfVfVtaO3N3YlrI35qlvvHhewiYrSm31cbyCMKkuGFcNgbFSFUBbUxk
 0HWUwixlxiHUvGmXjCI6v0PmaXX/3AryWF82bAjdTuqXnN+MqICltGDV5Ihx9sNFpiLs8vWYdM1
 gNX3ydK8=
X-Google-Smtp-Source: AGHT+IHlyLvirHQtwBxA+WyaV38kKYeynPoQmfgRGD62rrS/fv9at4t+fZpzQSSH8LM7H/HmJvxgqw==
X-Received: by 2002:a05:620a:8083:b0:7d2:15e:1f9d with SMTP id
 af79cd13be357-7d5f20b7efamr10937985a.53.1751658629611; 
 Fri, 04 Jul 2025 12:50:29 -0700 (PDT)
Received: from 156.1.168.192.in-addr.arpa
 ([2600:4041:5c29:e400:94f3:d2bb:5ace:77a1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7d5dbe91380sm194263085a.95.2025.07.04.12.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 12:50:29 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 04 Jul 2025 15:50:27 -0400
Subject: [PATCH] rust: drm: remove unnecessary imports
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-cstr-include-drm-v1-1-a279dfc4d753@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIIwaGgC/x3MQQ5AMBBA0avIrE1SVCquIhbaDiahZIpIxN01l
 m/x/wORhClCmz0gdHHkLSQUeQZuHsJEyD4ZSlXWyiiNLh6CHNxyekIvK3o9DloZW5FtIGW70Mj
 3v+z69/0AwILqnWIAAAA=
X-Change-ID: 20250704-cstr-include-drm-d4fa407b3eb8
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1751658628; l=1203;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=4dz5j6fQY62BWNK3xoT3qWhcHo62AErxDVsL3v8iN1M=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QA6HMXb6AcvScyaroNxvf09kaezolSYac8eDhIuiN5trPkSYzfw3XEI0evq+r2Qo8EazRmo9Nxx
 L3cKAxGjjRAc=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc
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

`kernel::str::CStr` is included in the prelude.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/gpu/drm/drm_panic_qr.rs | 2 +-
 rust/kernel/drm/driver.rs       | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index 6b59d19ab631..09a9b452e8b7 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -27,7 +27,7 @@
 //! * <https://github.com/erwanvivien/fast_qr>
 //! * <https://github.com/bjguillot/qr>
 
-use kernel::{prelude::*, str::CStr};
+use kernel::prelude::*;
 
 #[derive(Debug, Clone, Copy, PartialEq, Eq, Ord, PartialOrd)]
 struct Version(usize);
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index acb638086131..af93d46d03d3 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -10,7 +10,6 @@
     drm,
     error::{to_result, Result},
     prelude::*,
-    str::CStr,
     types::ARef,
 };
 use macros::vtable;

---
base-commit: 769e324b66b0d92d04f315d0c45a0f72737c7494
change-id: 20250704-cstr-include-drm-d4fa407b3eb8

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

