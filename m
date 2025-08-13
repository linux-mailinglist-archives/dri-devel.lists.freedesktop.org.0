Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B427BB24DB6
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:42:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB22D10E759;
	Wed, 13 Aug 2025 15:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TPE1Rei9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0634A10E75D
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 15:42:07 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-70a9f5d4d97so406636d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 08:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755099726; x=1755704526; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xeUhMEGs9wuRsft8g3SDqk5wc2QhmGlWOcjaI9cl8qw=;
 b=TPE1Rei9xnG4LTjkwcFn4pZ3/hbp4cnsJHS+aAjbkrl19eWxdt3loNmcHBTuTIjsGr
 72M4YKNMO4iYSKHhuuiVZMDs88v/DKKJN8523Oqwbktzmm2IHQS/7mhc0W95xDfMqs9Q
 AMGuLjAJH5P3p/K0+76lYCfGijt/3lVHp82lLyN4N6o4aJRTBrD7jHPnJWYmaccAH50F
 fK9teJV70wgYF1uHHAOBYLiLiO6pX0FGNLjvJMJvfPzXoHkjin2WuMTt3zOrY9UOc44E
 LMv56xBnapqLGJUUbE1KvDXrQkDa9j40EzcnjXcW5Hdokg3vvCNoSCwfmbsXLpVA+388
 D+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755099726; x=1755704526;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xeUhMEGs9wuRsft8g3SDqk5wc2QhmGlWOcjaI9cl8qw=;
 b=vZO9K4nnBoPzQCT5LDTNNy0Xn1Bxr8uloUdNi13GKqTsfo7HojspkBTk8SgiO1P6zj
 IREcDnOz+v6RbxnZ4YiWNNt/bnE/E/AGAZCsKfSm1tM5xBLuBDFm7Qg3S4PIrkwhXU9I
 XHaWVn1nY+vTSJhOdfTa4o9N5TnMWUbBN4TYb1nRKczl+wtEEovQeVlAULtxFTogSGXL
 27yluX8GOTA74Waqv41nOnVPVNhS/S87uk/nlQhHT4lmPdTsogFah9f974jaGFa07Oqd
 /uZGsfI5ARwrhNrtqWcNgUKlGO1d50mdGAvLOJIrv1j6Olf/412morc1EVDNCx0CnrhY
 fztA==
X-Gm-Message-State: AOJu0YzTzboHhTf5w0O7Z5bRqA14fh+tKlIk7VhCwr2RChHg6Mls3uFU
 USftbjKCQrR5v2XJBPB+pyWb0d+igZ/dnmcO1lJQYecr/8uISDWmOne9
X-Gm-Gg: ASbGncs/mVycamHJsIOqP2wPpEK5GaYYP7uu9fczsmseRhP8CqtiqUFvYIBhb9rhVNa
 sM9cZmDPJ5dKyI/MFSzLLgBV+UTwgzPQyXpvIVUi5EsCu6j3xLy+vVph9hd03zrF8frnmTDantt
 OKa6ZWaWyZs+aMKv+Mit8eWeHszSvBxpUrLYIocdpaVIXGiMS60Kfa8qsslLqForWl6of0TQtV2
 iDwuFp6BocsNhK3M3ui9KiX7kdEXWFol7gC2OFFCZKKXOLag1cTM0GDnDIY2Zw5irPLcLoRAhwz
 15Ec26a+xq2GVQ8Sk6otu4MIrMnPvtEaZvhGy8lkFLwlpCbaCYay7vkn2vm7PF8vggWYNSBzvQ/
 4Yh80GQ/kpUHKkZdf4rXrItFo0jF6UcEntyWOaOj+TGZaJvksYE/CtZ54igrXl3IqOlbCEvME7Q
 u8OkxSQsuBI7WC7Q2Y5Mm+Swedw9dQy9k8OTjr1vdcnOnf
X-Google-Smtp-Source: AGHT+IG1mIF6487HtOxJkAPPuPzh2mMUjp+Xc46MEr7/bKJq4m3Tp1y7THXr+TXxripZV2FXg2KGdA==
X-Received: by 2002:a05:620a:a008:b0:7e8:6fa1:338e with SMTP id
 af79cd13be357-7e86fa1347fmr16087185a.30.1755099725938; 
 Wed, 13 Aug 2025 08:42:05 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e81bc7a1e3sm1180019685a.74.2025.08.13.08.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:42:05 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:41:54 -0400
Subject: [PATCH v3 03/11] rust: configfs: use `core::ffi::CStr` method
 names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-fanout-1-v3-3-545c14bc44ff@gmail.com>
References: <20250813-core-cstr-fanout-1-v3-0-545c14bc44ff@gmail.com>
In-Reply-To: <20250813-core-cstr-fanout-1-v3-0-545c14bc44ff@gmail.com>
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
 Saravana Kannan <saravanak@google.com>, 
 Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Arnd Bergmann <arnd@arndb.de>, Len Brown <lenb@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-acpi@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1755099715; l=2429;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=kg6DNzoNrYf0nrR1AgMnV/J34mmfXDSDe/reyUaD9+0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLQbWrxVox3vhWtRI0GbehTSVJ4dOxqZCxMx5W5R2TVPGaDV2mg94i8oRtKtBHDHKVzZj0gCPJ1
 hi57xW1V/LQI=
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
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
Acked-by: Andreas Hindborg <a.hindborg@kernel.org>
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

