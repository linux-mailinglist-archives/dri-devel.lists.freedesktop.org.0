Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3825DAFF22B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 21:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5E789AAE;
	Wed,  9 Jul 2025 19:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g69GRsMV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA2310E82C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 19:59:09 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-4a44b3526e6so4466231cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 12:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752091149; x=1752695949; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cTisoOKtO39HO0t599kWYuf5kChlCvK0YfZx8jSH4po=;
 b=g69GRsMViCjCBvUloMH76nl8z1sXuLzII/RNN1nig10VjXkJxjNMhNHIpYWrYjHEiH
 7nhmpbNm5AYTFFtYX1r5WN92GzT5VEfV++s8gr4cVocbocRrdVoKqUMav+5ZMneE1Z1i
 q0dxRHgpGFfGWrDxG0suAQYys0xjmCFWiDVE2uk7pMr4UUb+CzlRkXKsUJOUmSp255Bl
 22HOBsGVQTDgaTK++/NpYGqXiEwFvn2VqaWiE2kqvp1FUH4lz7/gA+FdkM9nZttwrF+4
 G/j9Sa+rPfnjr7G9YOPtrNujDzP+zAos4QGx1vzHxay4DTrmk5+S0rU0cIrfQS6IH+70
 eoSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752091149; x=1752695949;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cTisoOKtO39HO0t599kWYuf5kChlCvK0YfZx8jSH4po=;
 b=AzjxlXoQdhRpF6c7SA14yzC+k1+wdejnVD+nFVAGkViSE6XnBBLYCZpcn+EWE1XcHr
 v8wdf7oU7hWzQ+NEHua0+0LayeFUDrdIdNoYuFMlT4g2MW5Fu79sT9lp91TwxspCQ4QS
 YamrVzCk3YLKGMZyoGtPutPSBvYGdYTFhwhkQ/y76Ww2EGDIxb1Djx7yPNB4CvmhKNSN
 DbxywXd3znQ7EYOoOaPVwAPGu3F8w570HveFJCDkzr5Wp64JdwWXjuqJ700SAv63ZvcI
 SJtyWjB4BbOczP66VniEbuCIbsr4FWpB++qYIXp0TWqr4R2ssSlMUWOkKEIUcQDGQay4
 ddKw==
X-Gm-Message-State: AOJu0YztzraF0EsgbFnHWzeWK/3czausC21gnLenM34fM6EQSIrgFX6I
 XjuthDDmX+z8+HgWAFtIrYWDLLqFmtVc96TjAS7omre59jaBbl1LT5Sz
X-Gm-Gg: ASbGnct0/+LUQIgDTNVYph7dgr1+yaKjCOiqWSoPyft1kM+UA0e9h2liin2P9C3aHZZ
 kR/n7up2RMP3PavHpX+QQopM5pLITyTKndGLonBr9VN4olMVSL62GMIMTUMLXal1jd3ugvYdUDk
 Mm2cCsLQ199cQqLhXafeEA9ObCMB7GuCNQRP2+dhUepLkVYigGdni+D1/240zr/tpUM2+VCEpoD
 +3dlt5A3EB0NKPKu5Wb55wXeQpHzPcdBvBE7P8VkfJHQjqZ3qq4Yb3a5i9sR+/1us0tWxNeXsgq
 oEmWVIR99mrJdrTcSAeuOqWvZObPkah78UtK9Q9sg2Rt6x/bEK6EZHgulmMXcnKVzvVkZdyOYpZ
 S7EaddqHCQ8JWJuwYVW+IHLgCQ0hJtlav3AKxW0uORB6h6J7aZnLEyDoPTA==
X-Google-Smtp-Source: AGHT+IHKgsc+ICJ8GK7k5FIulKNaP4mQStNYRDkaHExXBz0/hhkA0TEwHhm1xFLHm/CEqyN/qjvlbg==
X-Received: by 2002:a05:622a:199a:b0:4a6:f99d:9633 with SMTP id
 d75a77b69052e-4a9decea7damr51808541cf.31.1752091148453; 
 Wed, 09 Jul 2025 12:59:08 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a9949faf39sm103584281cf.28.2025.07.09.12.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 12:59:07 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 09 Jul 2025 15:58:57 -0400
Subject: [PATCH 07/10] rust: kunit: use `core::ffi::CStr` method names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-core-cstr-fanout-1-v1-7-fd793b3e58a2@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1752091133; l=1706;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=tJnOwm+PVrqtvTl00SdcmMj6fMABCO8NY29rsQ/cGuM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLnJ027s3h3RrpYj1vjpMfp+RpzbAjDmlJhlGFtcIe/F/zmdfI4fCuUtY6jX2mu5mXdHWHJZ4X8
 oQKLtan72/Qo=
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
 rust/kernel/kunit.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 099a61bbb8f4..3fd33c0c5ecc 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -102,12 +102,12 @@ unsafe impl Sync for Location {}
             unsafe impl Sync for UnaryAssert {}
 
             static LOCATION: Location = Location($crate::bindings::kunit_loc {
-                file: FILE.as_char_ptr(),
+                file: $crate::str::as_char_ptr_in_const_context(FILE),
                 line: LINE,
             });
             static ASSERTION: UnaryAssert = UnaryAssert($crate::bindings::kunit_unary_assert {
                 assert: $crate::bindings::kunit_assert {},
-                condition: CONDITION.as_char_ptr(),
+                condition: $crate::str::as_char_ptr_in_const_context(CONDITION),
                 expected_true: true,
             });
 
@@ -202,7 +202,7 @@ pub const fn kunit_case(
 ) -> kernel::bindings::kunit_case {
     kernel::bindings::kunit_case {
         run_case: Some(run_case),
-        name: name.as_char_ptr(),
+        name: kernel::str::as_char_ptr_in_const_context(name),
         attr: kernel::bindings::kunit_attributes {
             speed: kernel::bindings::kunit_speed_KUNIT_SPEED_NORMAL,
         },

-- 
2.50.0

