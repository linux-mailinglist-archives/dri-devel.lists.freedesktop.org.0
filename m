Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 549D9AFF22F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 21:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B000510E839;
	Wed,  9 Jul 2025 19:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c3HbecOV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9931D10E83A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 19:59:13 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-4a5840ec53dso3477431cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 12:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752091153; x=1752695953; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=U14jglz7jmLLE33hItepvmilwSYFOqXSGUyiLg58dEI=;
 b=c3HbecOV/Bmnhwvg2op5sACrHQhexwX6aKmUA0U5GR4zUJUi2nn+3jDK2UbqoygQ2X
 12N99dQ2Ka53/pR3hE8LeGnhafOcBXZjmc+115Rk3PwHO97c6Pv0IzHyQmh/f5aP4mBX
 fks51nWCHtV3x/vzVB8PiEGdV9aoeXv2sN9FlfKnyL3e5itgV69Ca3syo/Fr6gcqhdio
 wP+NTeYQy0CttrnLyxcpmqX6r9/B/2CYRCALiuPN2o0PUCl4EoArpa9nfZePLs616R11
 YUCYPff4Q9yPByksltp2EUgYEJaf7LiXfSgs5M3pUYKY7RS76RFVbyDsTWgbssSPCcQ9
 Dqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752091153; x=1752695953;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U14jglz7jmLLE33hItepvmilwSYFOqXSGUyiLg58dEI=;
 b=aJoKxN1KHJ4So9mhy9IxoAam3nSJ5HJkVVX5IUIM3l1SGvroWdJgymRnqASyaEw5mv
 PTn0rQhnB4JpUEtav0mAZuTnAtkDgccWigctoFdK5GJajdzRxaPEtAa4kuHf/M2MgPjg
 v+ArDv7BdphimiovVFJ0JFU6+Arm6Dn6Z4brkDTb3uFFR+FDd5GVTt87cBTUTLFeRhW4
 nuWzcmHVGze7qR8awTiWzyA+yHpuLrMRJ1e2LPS2Dt5wYVUp1QTok0TaV6EGPWRg3yBL
 ZbAk6mmuqh7XnIU+908tWWQieNUyiDSsGcsadGKMZh6kvDVum4RBCTK/a7ZxtcrrGlGH
 fUig==
X-Gm-Message-State: AOJu0Yx2b3Pye9KI6GGpm1mHRx5wN/q2HxmGZoy7ooYEupEh5ERYvYc9
 cq3iu0AcXyhbt0AfpOJZ9cxFEogGhSSDTmbBEmAa9G0LdCTpNBI1orPk
X-Gm-Gg: ASbGncsb7KXC1eG+Ei5EW54roVxyCCVKyaSWZNc1+6aQY6fmmuUjL35iUkF3uPiEJJ6
 uT/37YuB6bEgdKtjLosYfcB1pfanPhFErVr1NAVqVFcQ950yW/bPawqQIlyk1fmchoKN2nfDCs3
 cDj8bm99bcfDMjKg3UqzoddqtHQg5DcqTZzmL5Ke2K7w6b9bjBlUyVRnb/ZCvInP/4ajTgWg3v3
 gVr04n36EGFI2zWfwYD54PZvBoD2lmYmsP5O9wxMeIMfvIJdKRNpUQx3bwhAtrTtD3zA7hfNjDt
 citT0mmXwvvl8RtRZhJ1nhrpsauEX6zxN1BWZMXnnGd8BTvTUyIfASlSQ+E5eHRZSTBqMUv/oLO
 Kb7NeekjOO3zs6WzrjzkWigNV/TJ4OLCjv33Pdi+LuHTj1j2V2uv2rHMiYw==
X-Google-Smtp-Source: AGHT+IEZT0LV33Q6DQbefaNVsGB8GYGSEeK4kHm6ZMgvwa0sTSDDmBT5zSbLXSeeqNjRnCo2kdZN3Q==
X-Received: by 2002:a05:622a:4392:b0:4a9:ea06:2a72 with SMTP id
 d75a77b69052e-4a9ea062b54mr5964841cf.8.1752091152196; 
 Wed, 09 Jul 2025 12:59:12 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a9949faf39sm103584281cf.28.2025.07.09.12.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 12:59:11 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 09 Jul 2025 15:58:59 -0400
Subject: [PATCH 09/10] rust: net: use `core::ffi::CStr` method names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-core-cstr-fanout-1-v1-9-fd793b3e58a2@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1752091133; l=1114;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=LE7chWeGOaOT5eDKRrTO2ZAVumApkWzjr7E2NKjvPM0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKS983yaPxR9p4IIKthNUcVC2xw6BuUaT21i94/ah+kRZOkxvifboeTbkC/emsCbdJdM3ovFihB
 nHaeAr7K3hwc=
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
 rust/kernel/net/phy.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 65ac4d59ad77..c420e5ecab4b 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -505,7 +505,7 @@ unsafe impl Sync for DriverVTable {}
 pub const fn create_phy_driver<T: Driver>() -> DriverVTable {
     // INVARIANT: All the fields of `struct phy_driver` are initialized properly.
     DriverVTable(Opaque::new(bindings::phy_driver {
-        name: T::NAME.as_char_ptr().cast_mut(),
+        name: crate::str::as_char_ptr_in_const_context(T::NAME).cast_mut(),
         flags: T::FLAGS,
         phy_id: T::PHY_DEVICE_ID.id,
         phy_id_mask: T::PHY_DEVICE_ID.mask_as_int(),

-- 
2.50.0

