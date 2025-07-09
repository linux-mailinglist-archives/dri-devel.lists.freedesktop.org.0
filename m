Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6A1AFF22C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 21:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EBDF10E838;
	Wed,  9 Jul 2025 19:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I7oaHtTr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A9810E838
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 19:59:07 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-4a43afb04a7so2634901cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 12:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752091147; x=1752695947; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iar6CZEb07Sg4moByjCthjTFBa1u8uyvo2c3wz4q2/A=;
 b=I7oaHtTrkOEGiMgDG9OVvkSiJPZtBwsH1E8SZ8yDU5+A2EEYGI71Er5dZuyh+9f/Vx
 PsBtZUorGRdduligE5nKWDufgdEeNEix0XR5uY5At2GZ2QxFEQiIXgJjq5xyRHuNPwr5
 g4iTUL4FUaoEhwQksLr9aqgNqWsms9g5b3z9nT+TEHXAznpYmpTbYsmG83I7eXJYe26G
 FbjAgMRm9OxxUYTQ4ry3HkZfqTkYcUAz5v9FiAFfLAJKnJpRp4Bhj1a6QlDzRuoCg7rx
 daVAE2Ici3TsUgMH3kmitUHEujcws/ZcBi2vH4OuF5x5W7F6W9qlEz6ibl0D6kq3HLDB
 oCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752091147; x=1752695947;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iar6CZEb07Sg4moByjCthjTFBa1u8uyvo2c3wz4q2/A=;
 b=RxLGM9gFwrLf/CAuqaJ1HkJfE/thTa9h5ca9VQTyYXilpeQSnQ67rR9K7PUW2qVKN/
 yZ66ZP+BxLRmnNZJMRPI1gespAVCrY3ZNcIRS6cXy+qgEijum632rk6EKCYHFqAEAq2M
 wx1QneNMGokybc7pBgB1gSs1ctA/G5QfNb7Ul+QHl/EMQmU2PEszENyaLD1+7UWNKtdi
 Iicx1Uhaq2cBtBrmEKuJYAG3UD0+2tInramuluHLwsdVDyR4/X3LQctT9wnib2bXVQhz
 LJDyDBSED820W/2AzencK7UGbfKo7f0fFJ8JFOMlMHMEiTTlvxa28MA5lkbdvVaQkbRi
 OlwQ==
X-Gm-Message-State: AOJu0YxKWdqzSzJ0Gaz5WhHVV+me8m7IvJ5yjMn9Kuo0bp6aXpmg48eK
 1RGqsRjtrv/lbxv3JYpLHx/x7HwhB/IE5P091A18Xx2v+w61iv0/Li0+
X-Gm-Gg: ASbGncvyIq0o+7QKdy4K51LC4k+2aThFV92cLVmEEsgHToJAD9lFXfc0wVMJXbariA3
 qyfqZlZ7wVVI1KRz28hCT7r4pNMZq+jUIBG8IfVjhuI7tM+OVDJ2vB0OpAQYi/ZHQCkMAih+K4w
 xxOQVBnPzQynJm8WxRPvXiRlFnlSzVdp31ZTo8OCB6o2rjqKTQpKk0Y5L+alEr+5Zto5ZCaS+7e
 ifdcPwVNcyqQeCjMKQuTyM9tDp8+/DUpl+bX/5AjZxUnjhvNASNeHohO9BFPwpmk67XGiFF1Lkn
 wt53jRMS8Y6G4VsuY2sOdnWzgGXj2uh5tSX6OrPK9b3djkxZrXIPf6VYpNVu8irhf8RI31hr9xI
 IOrxQ9oKwCrRcjTtdNRcDaHY2ScIKbQqQZySeOBfVU7bG2E1O9b5QG/C12w==
X-Google-Smtp-Source: AGHT+IHhr7S62p3GeKqSfvS1C/Frohg226ZNlEil0nItGfMOTEFEoSiMlBSg6VeylA85PxOXjmoL9w==
X-Received: by 2002:ac8:7fcd:0:b0:4a9:ae5a:e8a6 with SMTP id
 d75a77b69052e-4a9ded59946mr60608561cf.47.1752091146662; 
 Wed, 09 Jul 2025 12:59:06 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a9949faf39sm103584281cf.28.2025.07.09.12.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 12:59:06 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 09 Jul 2025 15:58:56 -0400
Subject: [PATCH 06/10] rust: firmware: use `core::ffi::CStr` method names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-core-cstr-fanout-1-v1-6-fd793b3e58a2@gmail.com>
References: <20250709-core-cstr-fanout-1-v1-0-fd793b3e58a2@gmail.com>
In-Reply-To: <20250709-core-cstr-fanout-1-v1-0-fd793b3e58a2@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Breno Leitao <leitao@debian.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1752091133; l=1046;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=/htbXMuPqM3udNl22VLfwXmvEucPDAQBS9Vh2/hL3Ns=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDb3TIbXnNLqkMJ0gYRyWSVF1X274n1waPRoERpZzJNKDLlYkuxge9P2g93d6SplCz6NiTFiObC
 St+mKIg7fLgU=
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

Prepare for `core::ffi::CStr` taking the place of `kernel::str::CStr` by
avoid methods that only exist on the latter.

Link: https://github.com/Rust-for-Linux/linux/issues/1075
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/firmware.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index be684e860ed2..ca00aa2b4d85 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -291,7 +291,7 @@ const fn push_module_name(self) -> Self {
         let module_name = this.module_name;
 
         if !this.module_name.is_empty() {
-            this = this.push_internal(module_name.as_bytes_with_nul());
+            this = this.push_internal(module_name.to_bytes_with_nul());
 
             if N != 0 {
                 // Re-use the space taken by the NULL terminator and swap it with the '.' separator.

-- 
2.50.0

