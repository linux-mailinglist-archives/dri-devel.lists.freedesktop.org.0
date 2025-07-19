Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4546CB0B256
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 00:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C6A10E42B;
	Sat, 19 Jul 2025 22:42:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E44tgHG3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB7010E42D
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 22:42:48 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-7e29d5f7672so296707585a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 15:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752964967; x=1753569767; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0upvJAUOqytvdKtH1Js7QdI/pbuB0WBqV3BXJbjoVlA=;
 b=E44tgHG3ub6LOW5/xmgvQllr2peq6mphg2hSqP37EwZ0aip9RgHGZZF94Qrp91J3ar
 uLJYmlu63pzjBPDXLKmPOm2njdQ36u8WR9gTm8BVQoN/F9eU59rrFFO4RN+dNi9vSl1m
 wp1nIVDTiTGYaK1Zwvh+uFFLOmGLXqtuY0Owuyg7DisF/wwElqtFRT6JJKQvsxZeX5oT
 IXCuY+Tm++V+a6gN2Dzt8r2ryjknQ3biyfMyC8lpUR34JXxIzR0ScLah2lMRKlEfw8Jc
 5gt1ptF1i9JRTqtecyNMdtkVkOdNEv47OXlgoxzOCjcEvN8PRwu5C/qhfV6z8709C7FW
 bI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752964967; x=1753569767;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0upvJAUOqytvdKtH1Js7QdI/pbuB0WBqV3BXJbjoVlA=;
 b=Kdu9GXvDeWcAl6rOHqCPOIxMH/K9uzCIh1EwSiV2PeyqFcsrsbn/Dxi4xEMwik21r1
 lVkKFeh9iFtXhGQA2xKpK/Rdi3yKfQm30UWp07H+KVSS89aRtQ8gLRzrEl0/0BFmOCdn
 aH4MkW70RPm3Da04ipmvluJO78W0UQv/DMp9Je7A/gtReOf1HFF4//xFN+rzzsUHIXj0
 cEwHQIUSHevtaQgI13gwM0ZrkB/lK4wYZAIZnnOzccYRB+FeQNi4nW8j1gGZRxd/We/R
 33eZZLjOpTcjDca7F3iAW/NQv1oqZclOpPKcdoYGJUvCht62Ia9ztjb/AB2i1hJEUbVi
 x21g==
X-Gm-Message-State: AOJu0Yxeavnct3wkmwsN6SRQ2WduVJfOOSltsuxixhrLHXmyx+HY/pA1
 TC7r7JU9uB2//b0lawQwYqwMs2C4vyCdPE/tNsYRaYEP37tlcefU79Va
X-Gm-Gg: ASbGnctjRHQZeLLYG2uv7KEiAaDfXfWyNN7RXqZALyIKvLdURLUSGUhctA++0LHB9gf
 VA5QaDz8OFrd2UQHN8gTIg1V0MUcLDqGBW+OLe4WNPlbNuq4q7TELythhjNXTWvvBJrdWS6EDyR
 rfWJORPsxOgtUlqxv9H6HmgCQMUnlFyqnnynFAyhXnTG4h+JodnBViftO3pNRq+XGSbBWIWYZ9D
 dRyAHAppT/oh/uQdL0hoh/kdSPOgWLVlNqgIOXOkZS79gs3lIPXBrmWzAK70uMo1rfMDCKxLoYu
 d/AjpaaBFyXNFWhEOl2wJkBf2jxkF2cz+ce+M8AEk3WJBHuhn/yLw+c7Q/03rzf85ly5U3dvc15
 y4edCqHaudejGDKFx8uBD2kgTMtXjwEvGpZhAJDDinRRAX+rzG2ZhsnYNxCPTf82HT5CPPBJweP
 RbCdIQdLWkrawFQgtbg+5rph3g6vWE
X-Google-Smtp-Source: AGHT+IFNkExuwV5xK+HGDUG4UYXz6tqA3MnPyJsvS3T1Vaz1scPhMa5psrxoC7cCT/3i9N79jUky/g==
X-Received: by 2002:a05:620a:170c:b0:7e3:2d1d:bda0 with SMTP id
 af79cd13be357-7e342a5ee77mr2075766185a.2.1752964967235; 
 Sat, 19 Jul 2025 15:42:47 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4041:5c29:e400:78d6:5625:d350:50d1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4abb4b1f1d5sm23671841cf.50.2025.07.19.15.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 15:42:46 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 19 Jul 2025 18:42:34 -0400
Subject: [PATCH v2 05/10] rust: drm: use `core::ffi::CStr` method names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250719-core-cstr-fanout-1-v2-5-e1cb53f6d233@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1752964955; l=1242;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=7j87c2ImiCXRY6GMVHj6oI5OA4CCcE5fWZCYEKHG4/4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAibFveB/KKFoUVCRfSH/zxxHdWDSrZ1Vs54w9OiVr+hkkXSTUcUM7b175FlsaPFavsoaSMqGRr
 1rQ/BshMVJwM=
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
Reviewed-by: Benno Lossin <lossin@kernel.org>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/drm/device.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index e598c4274f29..439cb1b747e1 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -83,8 +83,8 @@ impl<T: drm::Driver> Device<T> {
         major: T::INFO.major,
         minor: T::INFO.minor,
         patchlevel: T::INFO.patchlevel,
-        name: T::INFO.name.as_char_ptr().cast_mut(),
-        desc: T::INFO.desc.as_char_ptr().cast_mut(),
+        name: crate::str::as_char_ptr_in_const_context(T::INFO.name).cast_mut(),
+        desc: crate::str::as_char_ptr_in_const_context(T::INFO.desc).cast_mut(),
 
         driver_features: drm::driver::FEAT_GEM,
         ioctls: T::IOCTLS.as_ptr(),

-- 
2.50.1

