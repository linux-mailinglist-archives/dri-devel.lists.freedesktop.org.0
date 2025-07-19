Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C302BB0B254
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 00:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A95C10E42C;
	Sat, 19 Jul 2025 22:42:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X1lWL/Ns";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4970010E42B
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 22:42:44 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-4ab81d0169cso45049581cf.2
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 15:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752964963; x=1753569763; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=D1SWgEVSx8t26BC4XVR8BuzhCGARx2Hrfiqdp97fGW0=;
 b=X1lWL/Ns24dyh46kY61gEcr6faCKL5bUfvPO74zBzaCA33L1n7VxbbtHORe4gJbx5M
 0NzjE09l+dZ57ZgVN03sQuQ1zjgLfoWsp53lljhL9UfbDCjjMdh9nTfUqpQn4xw9glU4
 E//TlgV/89zItOGxbBOIhNQwRaDHJomDsDnPXU4AtXOo52cmpXocr07m4eJnEg3lEB0l
 hLBdWX/IYkat0udNqC7qD/ar2OJgW216Dli8hYPC8ue06mw9Dw25EVPQ/ClakwEVU0HZ
 dUyNLH/CaoUe+zTR1WYTyL+iXi8O2kFjwUPEl5vlaYUHW8Pd+k6ulkFbWB/PtyUwpzLw
 Dl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752964963; x=1753569763;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D1SWgEVSx8t26BC4XVR8BuzhCGARx2Hrfiqdp97fGW0=;
 b=dvyqsgZuFM5Uqcz4/0swPLnJ1BBbcDlH1Qy1XdqaEnodcfGQTpXTt2KS4BBbkIw/hl
 4UGOTVFNSmg8q5p96FiH+s7Ryn7zPnZDF8Y/VEuCs/T+qw/QBZg5bMr/BerUr51UbpwX
 YG7upeRMPQ3pr3/pyIkmABSwAcPa6baTVd0k/b9i/TwWfrgnCCzVIEcSdWKfstB27kUZ
 8SZuYtv0AOIie5ztiuxcNZJBiGyIZL9RstHSbKUCqVMRJT6kP/5K08UWDdAhniUYhQQF
 TG4Cb28FgWIwjLcv82lfqIm+Fz/epkHgjD+3GX7BRfkD/mOiUAyYsoYPon374naREvwY
 SvVg==
X-Gm-Message-State: AOJu0Yz3174GYydyekv4PEMcvRtFFMtHVvuMDsl5+ZA5bGA9A3nMh++d
 F/HSDThHzhpSXQ9RVG+0PW22jFtCmvq/qGvl1d4fTHx6EfYoT+JuYZ5p
X-Gm-Gg: ASbGnct4wpXyoL4r2zKQbM2iGFOpvdHJeK4upW8dKt7u9hKWGG8iF+ai7cOtCK8OzW7
 P7gRIrCV7XkrTQWxTB9tK/YmSYI3wKqVviutNP5w7Kn+wlgdUfDPM34PdP8qO4tLxps+/fmylAL
 DcUgZO4VIIUG9eCC7r0VSt9NvlNMxhEVFhMU5U5hoQ3uY+1ONa5mvsBA96zpDm3Cy16sWC+RLWu
 7ocRMiX8gjw/W9o8ywQbwhVgSgiSIW2J3DZbz0kAjImfd5wrUsNAspKauTha9EslfISIY2U34dg
 8id9EitpjavV0pk75iQOFwdYdf8SMaSUBXjRa+PfUVtQF6OpewjqcLw5cpolA6+fiun8dRZ1ZIe
 8fIupszJaK1UfbVxBe9qyipcppK56tI/NMb3xza1SC87ZyVeYAVjBJZS38gRUztxUGIlM21tfVu
 ZdyVi1xfoyfOylTFLJEJ5uOxjV585H
X-Google-Smtp-Source: AGHT+IGRlT7IbYJgy7k1zYKpPXDBr5ooJQrVQvFfzRdeHWam1H4YjOS2fabtOnVtCOJV/ysDqUjrDQ==
X-Received: by 2002:ac8:5dc6:0:b0:4ab:579d:2343 with SMTP id
 d75a77b69052e-4ab90cb6c2cmr251175531cf.46.1752964963333; 
 Sat, 19 Jul 2025 15:42:43 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4041:5c29:e400:78d6:5625:d350:50d1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4abb4b1f1d5sm23671841cf.50.2025.07.19.15.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 15:42:42 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 19 Jul 2025 18:42:32 -0400
Subject: [PATCH v2 03/10] rust: configfs: use `core::ffi::CStr` method
 names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250719-core-cstr-fanout-1-v2-3-e1cb53f6d233@gmail.com>
References: <20250719-core-cstr-fanout-1-v2-0-e1cb53f6d233@gmail.com>
In-Reply-To: <20250719-core-cstr-fanout-1-v2-0-e1cb53f6d233@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1752964955; l=2423;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=UU7lGn7kGhm+SuFb1MnLqyAXhBVLI0I6DYrJ7+r+OSQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNeaAkv8xgwX4NEWMvKht3s0HML9oOBF7rc4CRx7dxJy9p52pTiBMrgmqOCFBudOkZhQkUhg678
 43mmwZSWFQgY=
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

Also avoid `Deref<Target=BStr> for CStr` as that impl doesn't exist on
`core::ffi::CStr`.

Link: https://github.com/Rust-for-Linux/linux/issues/1075
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/configfs.rs       | 4 ++--
 samples/rust/rust_configfs.rs | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
index 2736b798cdc6..9fb5ef825e41 100644
--- a/rust/kernel/configfs.rs
+++ b/rust/kernel/configfs.rs
@@ -263,7 +263,7 @@ pub fn new(
         try_pin_init!(Self {
             group <- pin_init::init_zeroed().chain(|v: &mut Opaque<bindings::config_group>| {
                 let place = v.get();
-                let name = name.as_bytes_with_nul().as_ptr();
+                let name = name.to_bytes_with_nul().as_ptr();
                 // SAFETY: It is safe to initialize a group once it has been zeroed.
                 unsafe {
                     bindings::config_group_init_type_name(place, name.cast(), item_type.as_ptr())
@@ -613,7 +613,7 @@ impl<const ID: u64, O, Data> Attribute<ID, O, Data>
     pub const fn new(name: &'static CStr) -> Self {
         Self {
             attribute: Opaque::new(bindings::configfs_attribute {
-                ca_name: name.as_char_ptr(),
+                ca_name: crate::str::as_char_ptr_in_const_context(name),
                 ca_owner: core::ptr::null_mut(),
                 ca_mode: 0o660,
                 show: Some(Self::show),
diff --git a/samples/rust/rust_configfs.rs b/samples/rust/rust_configfs.rs
index af04bfa35cb2..5005453f874d 100644
--- a/samples/rust/rust_configfs.rs
+++ b/samples/rust/rust_configfs.rs
@@ -94,7 +94,7 @@ impl configfs::AttributeOperations<0> for Configuration {
 
     fn show(container: &Configuration, page: &mut [u8; PAGE_SIZE]) -> Result<usize> {
         pr_info!("Show message\n");
-        let data = container.message;
+        let data = container.message.to_bytes();
         page[0..data.len()].copy_from_slice(data);
         Ok(data.len())
     }

-- 
2.50.1

