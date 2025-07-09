Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2D5AFF227
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 21:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7BE10E837;
	Wed,  9 Jul 2025 19:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YmYq43Eu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A87310E833
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 19:59:06 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-4a774209cf0so3842071cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 12:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752091145; x=1752695945; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=x6zoAU+3+NRGYowRJHpIYpTMUTkd2sUwwkSZRyZYqF4=;
 b=YmYq43EueUQqSNrjIfpuImQZvb+yC9320bIjWZ38uDEleigj7pK3CelgfBixMjopEY
 gt17zhuTM87QufhiOV8GKB8+F6o7mnwweeRP8w2zVomQyvIKfbIWIg4e0sBcS3ksQNYW
 UfGCHY37O7P5eMPspTKLwGFSz3llBDttfWEYR9OErp6fNsYxa2WycrUrOWB8GBs5GE2q
 IaMfZMN5+7xWA5BoYPCpOaq1EgIGgcT/oiY9R1uEsi+LO2aEn1FX+l/JNYbPk3kp1pBm
 NBUpqzqRmTsNcHfzES9rR5uBqJfG6yESfQ3BEwNfBHYexIbvLfAIGYtjom/joqD+Arbj
 DOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752091145; x=1752695945;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x6zoAU+3+NRGYowRJHpIYpTMUTkd2sUwwkSZRyZYqF4=;
 b=m/Av0KOol76iuNRc1z8DymBwUvRKT9Qy+EZYNZc6GCh4F51gD3xDCbHRiOF+WFXa2G
 cxlMrk3UaJFls/f6Rv1cb0yljidg7UqVQeIN0ULxPedOXsSV1QnKADK3XX+++jn9Wv0K
 +ZNCt6NkjFeRj5NV2KD0IcPACCBK4FloHPCHrpHyWrKwMlBSfIyTRlF6ZN3IdXOuCfaY
 J6lz6RgpQaDMSqrLRMhWimsRJV/ivxSNTUP+i29tSsPPSYKuwZUBQ3I8Gvb6BlAJbS2z
 ECF2AKd7sLWk4wPjqAililme3Xs/p9/EOZMz0ldXX9TpgiBzLUeGQhJUtPtL+IloZ7RE
 u0zA==
X-Gm-Message-State: AOJu0YwGAujzqS5iBBlW77jl4smXGIquqXQ9RBWyB/Sg7lNVD0qceNxY
 FwKsKqzDOheP1yWStRcqs+1ZFfnATDXhnXNJcHaDp1HU6P14MPkAC4kN
X-Gm-Gg: ASbGncu263vM3Uv4IUKCehHVXJJ01Um0JgJFuY7bsa/Vq3ZsGmB2h1flAeBHGiqLQ2z
 ltXopmByxuXUVva6i9g2Lg5ejxM99b8ud7PrM28oSHBsrOuF5ybbxctl03E2RjjSE3oo7w43e+V
 nQOEtLKmnHx1BcCx5xtdJWLzmWnndrHMndeGhxMruABvG6OOQYSjdzOIRy4ttqY3ta9ZJRXBjMy
 Fc2Z3OUvn6S0+muqmOqWI0gwLf8cQHgMncpT+KoHu7drBnAkaRu5mqmoW9oqbJfB/eATnXUihx/
 QlViiLDvfebXVI1h2qIqiCzyWhems7Sszs1jLoV8vuHMl96Bl3v+TFKYILlol98uCeUpnTO+uh2
 IcwkXXMLlxbLozeTL8fXzuogt0bItDH4wJJB2VGed+i2m84NEGMeDTXuZx7BNjBGOF1hw
X-Google-Smtp-Source: AGHT+IEHE092R70aLUuoMy8vYdq3O+lo5/x/JcZq5QkQKedPEYTGiVV/m7e75sMnKuTUMIqYUQHzag==
X-Received: by 2002:a05:622a:8c02:b0:4a9:e20f:c6c with SMTP id
 d75a77b69052e-4a9e20f1147mr42124791cf.18.1752091144903; 
 Wed, 09 Jul 2025 12:59:04 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a9949faf39sm103584281cf.28.2025.07.09.12.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 12:59:04 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 09 Jul 2025 15:58:55 -0400
Subject: [PATCH 05/10] rust: drm: use `core::ffi::CStr` method names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-core-cstr-fanout-1-v1-5-fd793b3e58a2@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1752091133; l=1149;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=aLYXykvEFDAvQVjjQ9rlBaXRy7vjxZdWC+vGw2wqK9g=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNfUtJS4YM0EruZr6Q6jVt9BNzTkLZfHyZm3PHVUgP0rzTsZpXY4LTRXSY8JwfktuFLf5vyneCg
 OmkAUz4yhFQ0=
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
 rust/kernel/drm/device.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index b7ee3c464a12..998b942b6dd8 100644
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
2.50.0

