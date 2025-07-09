Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E73AFF22E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 21:59:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4033210E825;
	Wed,  9 Jul 2025 19:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OAR7kV4w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B5B10E83A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 19:59:15 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-4a58d95ea53so4596311cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 12:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752091154; x=1752695954; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=b8KQ4HSVORZvJyB3i3NF8gMFRoSic5laZrJaHuBt0is=;
 b=OAR7kV4w30TeUrKXn9XVYJeqpt7bXTmU4AUdvDwOTgC4vR+j+16wqMv0RxHcdV772e
 yMJi9a5EFjN/n5m0NrecVm+eiTuh7+dwyonccwmlGKeLMHf1+n3BHUjD/m8qTfClLUEL
 R2xWF3GsW3Fsviot1k2/Mz2X6qzxJRzattQVwH5xFzlsOZFPtNypbhsWQQ2xwUhiqW+v
 lkPGv3Ade2u+gvZvD9Cg0XV6160xKC86SuDj5XPhKAgUt4NmZ2fJNh1Lzqv+BOI88tiy
 wYg9uaZpgAmyPz7XNU8lOWx2WxWhcWd2VzGkr8l/9OF9DzB+VwgMm+3hRau+Lor6cnWV
 i7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752091154; x=1752695954;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b8KQ4HSVORZvJyB3i3NF8gMFRoSic5laZrJaHuBt0is=;
 b=nlNzDPG+VRP2oY6QrrtNWGM5KuoXNjwBpdvYFKan9+585YVp9BORxblTraDoGU6ZmX
 gNlInuxjHbfbI7tGZcamMpaTRYHRZNdy6QBIXcEgV08z9isij/saWQfWRF9MShiG+91w
 GaAVRxpkMQ3RDF3szY5u2A2SeElfh/qYozyXW7uOpDk7vHK51ZBiSf0KPDe/p9/qW+HX
 QKTf0jP7FORamcCkZZBRTL4t7J19SWMPysECrK4DEfzuq1YctOzsjcNFuiKVnwjjSKxK
 +5q36J6H1Mhx93PernYpqYxn3qNKmhrs9ST44HO8bNkmHjpLFhvuVGAjvcCz7OOBQiTu
 TnUQ==
X-Gm-Message-State: AOJu0YwXApb2azM9ROvr7az+WWATKjeS7Eu7dg19nRZmFFVVttCO1++f
 A3dKBphIe41u5y41W3wJ5oy3T9rVt8A4PBngbabN1AjlWNHvzgF5Atur
X-Gm-Gg: ASbGnctku4ljI6Vsy8Ib0JzlveWcOpiUt9xlmusbyaKjWyE9NxhU8Q24dzG+0PTHbGl
 Z8SNTqzIxGb3WL61w+j4Qy6hhb8yuKrpeajCRuRzDUbzsmf/+YDKcS5eOoDufBn3YmhXwLCKILK
 XzVnS8isIkwYz6ET2gm3yH5BOjHlK2yrxjAG9EFENvRZ6pJj4aX8mup4D4vAZmkl3QSa1lPbyfC
 RBa1l5ukmeLXx+B8j2DbTas5G94WfqzHnNadVcA9MR/q5dV5RjjWpMyWHJ11zLcARkFMwT6v8IC
 vjrVm7OxwnE45SIRbMSWZTW2T7Ia7DL7MpXdDXeDaV8NaQfFpfDkkkKsLhicboZp0cYDEsuZ3V4
 dZY3SdinXAFnCECuzwLdfGPG0q/uVZtCyOsHYUUoMVCHuUGIULGWJ86ulfxGNg5jYILtj
X-Google-Smtp-Source: AGHT+IFvDoCZVGhGpiYkZdTD5/12K1S8bIsSpFpgXIGe1kCUt1tDQK8ef/tJ4gQAS++aXLB8qn27Jg==
X-Received: by 2002:a05:622a:15d0:b0:4a9:a596:1bd6 with SMTP id
 d75a77b69052e-4a9e9c27e25mr10671631cf.9.1752091154172; 
 Wed, 09 Jul 2025 12:59:14 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a9949faf39sm103584281cf.28.2025.07.09.12.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 12:59:13 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 09 Jul 2025 15:59:00 -0400
Subject: [PATCH 10/10] rust: of: use `core::ffi::CStr` method names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-core-cstr-fanout-1-v1-10-fd793b3e58a2@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1752091134; l=1106;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=+cXDYAYZ3gqoNEyU9rZ/9kReWz6XNmPa5fCe17wNmXs=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QEKD4zAoBzfzRUQWlR3BXr7MAa4XF//LBOWG1JnRpCMhRFh/BCmVtlUFm5UVBwPwBtNyQOWGm6n
 0rH6S6+DKfQo=
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
 rust/kernel/of.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/of.rs b/rust/kernel/of.rs
index 40d1bd13682c..5cf50979c1e8 100644
--- a/rust/kernel/of.rs
+++ b/rust/kernel/of.rs
@@ -29,7 +29,7 @@ fn index(&self) -> usize {
 impl DeviceId {
     /// Create a new device id from an OF 'compatible' string.
     pub const fn new(compatible: &'static CStr) -> Self {
-        let src = compatible.as_bytes_with_nul();
+        let src = compatible.to_bytes_with_nul();
         // Replace with `bindings::of_device_id::default()` once stabilized for `const`.
         // SAFETY: FFI type is valid to be zero-initialized.
         let mut of: bindings::of_device_id = unsafe { core::mem::zeroed() };

-- 
2.50.0

