Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5530CAFF225
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 21:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B044410E82E;
	Wed,  9 Jul 2025 19:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Igy3bDVJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C4E10E82B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 19:59:02 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-4a58f79d6e9so3774941cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 12:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752091141; x=1752695941; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sxv+cX53M0fWuTxa/rfWTueJP/9Z3ooTwaDANDLIWY4=;
 b=Igy3bDVJhLlbHxRMN1NoljYlKaL03MK0y0gj9XgdIaMA19yqKynxZMvg2yos9lHd0h
 sIYNHll1Gaeoetuq72ydKQaF6iZ+2ItOA5DR9ujHjRKTNP2RmOjEMJMmy+pm7sJNiRAm
 bAPWMDzgc5ImwHp04Z8fPeH+fZD3xL8yQtaEPW3qfOOru7PWiZoA7Rp1CqqCnjy1afy7
 yvIAy6132bL49hANejVozjEWFq3/Edufpiy0ipHb8/3+Z5e0uiu4T5jmH17IS7VpUYaY
 1D/vFZxuzcaWHg6Mu8UBPYZlxwd+ZNhMdBJ1YbPvOxyKih/k42TVS8X2QeMGwT44ccL9
 hApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752091141; x=1752695941;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sxv+cX53M0fWuTxa/rfWTueJP/9Z3ooTwaDANDLIWY4=;
 b=nSXCh3xEGvOhVllrl/+u6BE95dt7SpGKhzchzgUR82QFnYXrMpyFyQDH6TN2ClINXz
 XEyMCZAK2FYHVFYYr7nV9KECUA8bUrVrSn+Q5Z48nYdM0MfFdQ3egsmOjjIQfm1YCjIO
 711/tju5kVaq0tRqJJxtA8mPFDkfauEoIJzKzUkYKI+McEQXAym3PkumgKGUGjHqUu4a
 FmiCQBO7OtwmxpmR8e22MHHIKv5OJngO2oWTboHiURLNzZvxbxiNoUMq05ImS0G8p0fa
 nrQkV2fYx0csWBZgpEOzvX/NI7zOVcXH34cXn9Lk2tZMzjm0XPJmbPRqls2eoR2JbHyY
 FPGQ==
X-Gm-Message-State: AOJu0YwfAB1+W8MPb2oVDEQpHIQn7Yd/dVEdb6yisQe2I4wYwmfzYbLC
 89kkjNKP8jeDKU4QRX+1iRFJXwx7JM6VmtNGj/eEXAkrEPWEo/ZebGob
X-Gm-Gg: ASbGncv4tuY6EE7lA2mUVNyTvKJjM1OatPREAYghLCxWTx4jXRwuMWG9VkbtPa46rwu
 SFd/Twn0ZBOm8PDd8rYjRy2LlVv4v1LIbFittWAwooucxgYuC5WtVh2UtHTTUbwoTjpRvHmZXw5
 MNlkKgxN4kL3E4Q47R0UsrYkM3kmDfWmj96I+3TSgDKGsSWaSpqQzhPRtYgr8SwUlF1GKWPPcy+
 fPWqulpRukkfmd5dd2rXR67WO4HEqaJherMGyzz97bhAapD525dRriEKDtospZUhXykaqRmeMIL
 FSDhlbXTFFpeWx7ghIy+hnGH00nAIcWNzmRDXDtGQ7qh7MIXL6TrcjjeD339FqfdjvHbajXETG7
 sZC53nAWISasRvapAQCTadFP6FvJNQD83/X+2esFFhz7bz82hWDxJ90Wk6A==
X-Google-Smtp-Source: AGHT+IEvOmLNAfKMwFeccve+TnvGa29pxtqNeoCaz5gGAr5K0zm9M7P7N+Kqf/C+pZuFyW3BMiWUnA==
X-Received: by 2002:a05:622a:7284:b0:494:abde:2aa3 with SMTP id
 d75a77b69052e-4a9e95c9735mr10316081cf.18.1752091141111; 
 Wed, 09 Jul 2025 12:59:01 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a9949faf39sm103584281cf.28.2025.07.09.12.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 12:59:00 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 09 Jul 2025 15:58:53 -0400
Subject: [PATCH 03/10] rust: configfs: use `core::ffi::CStr` method names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-core-cstr-fanout-1-v1-3-fd793b3e58a2@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1752091133; l=2325;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=h6tC3zN7Md0UOz4MMT6cfetqyNoedejjhSvA80iqjoE=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QEsOr/WBA7+xGvjY2sHkb67mB9WU5bZUW+aM5k/YuUpfoMwVaCu8hZMIuajFrdeqXMfc3qHNLaw
 XIaLNkI+MTgY=
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
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/configfs.rs       | 4 ++--
 samples/rust/rust_configfs.rs | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
index aafef70b7177..d4797c41ba77 100644
--- a/rust/kernel/configfs.rs
+++ b/rust/kernel/configfs.rs
@@ -263,7 +263,7 @@ pub fn new(
         try_pin_init!(Self {
             group <- pin_init::zeroed().chain(|v: &mut Opaque<bindings::config_group>| {
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
2.50.0

