Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A51B0B25E
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 00:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08BA10E436;
	Sat, 19 Jul 2025 22:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V0/kcf6W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81CB10E43C
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 22:42:58 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-4ab39fb71dbso39251051cf.3
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 15:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752964978; x=1753569778; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=M2SdMgOej1Czkt8u413KFayNOC5FO0PpNGdLBjJItos=;
 b=V0/kcf6WqX2Liz+Vqrj/7jvPpfRGX0ngv2JTSUi4XSqUMJ+T04Oq9v1QGwFESh793l
 JtwRmKvG6lXsl9Ep0IXwW70lNofuCqVLUF8rbhP4JLXdezeBf75eoT2JQCeOOvd3EuBw
 UXYbJzlMllVUMeD+c9wzKDODu/kaSw8/6gSNjCpvTIXyKEi9IckuV00I8TiGfi6UJRfr
 faPR++lBduSTLeIvXC3Dxc/MU+1+HfBSmKF25uQbzst3pjwzzbQkCnzGKm3lsgx0+7sK
 gRvl9uoaQK8Ga/WTw3/J9JLMo3jfmVvipWrWUabGCfziYZ4XGYhJv+FU59qoZbAwCSRo
 cqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752964978; x=1753569778;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M2SdMgOej1Czkt8u413KFayNOC5FO0PpNGdLBjJItos=;
 b=JOEm6uttmxxsVYtfSdijbozbfyR0Q7dnY9Q4Y3SiOe79Ode6by+S7VBM/CRBOG3uTa
 YkacWgrGedrv08XpdKBVlPbop4UsCMOIzVsVfKMl62QO/2EzqzJhbRZiCs6XbFuKQDdm
 l+xkevnixrsRW+EZgbEJE9Btn+rcwWNEswxFjDTZ5BbLCrFcRY0C/ydM4A/VRsknKF7x
 D4lXXQOe0FjcEVlV5WGKC/UEgKlVV05xaxRZHHDwwhL6pocFYHKYKfQSMA7/ev+7AmW8
 grs0iKvE4Wf8Vs/XZbN5n79wo/Cp5I+x0kkNkBAm5FKSYu4sEgnpBVkG7P0Cy5awWuJD
 Oafg==
X-Gm-Message-State: AOJu0YyHaeI1xx3igSuykcuKJJ38x8x9FpX5ABmkZ4UOCH6p/mhshtbp
 5s5nNVHIuaXx1jumRayKlG2UGIjQlgOgIhFqxntGIybBdWl/UN01Z6ff
X-Gm-Gg: ASbGncsOZzsBdZRfRG4VpGtfg1ZsnQBvKQ2DAqtna+RAaHdObCFIx6Yv0w4CWRFyKZT
 C3cr3FlpdCAqot6/kCa2uwY9VA8vmC9sR9GHugNw/qJ+OSu90BIg/SpdtopF5iOPXi3t82ZebNT
 iG00cvSgMgJOLpUAiEadhRScrlCF3ciq4iVKiOekopfrWiYZbbTBsmFvyvzTsKH2DSCjLsqkXv5
 GDCAd9PoVSkqjrVjdS0rNc7uCDVi+LyTnobNRZ0BJg/xkPZBgrzdhN49OhR7ZLv1AudHzpfqo1D
 qTL0ZiPHGaeqYVnMzoZCKFlWYn2yk2kVq8TJ5/yeTSojypFs9axEH0OkwcKJnIzA/EWwioFHP14
 0Wa6n9r2lANoz5pf4L+qNzzxoAuSqMZLVZok333P8OgUdpIydg8+eGBzLUCoZ0pAL2V3YBuWiJU
 D53UX29rdcgLSSglAbbVWv3MI7MDjQ
X-Google-Smtp-Source: AGHT+IHVcbnnmN0FOjpZi+BLTtYiYWCS3TF6LX2f51OS673CeBLR1t23WnXUWlU23mMaHNOfJa58kw==
X-Received: by 2002:ac8:5e06:0:b0:4a9:8685:1e92 with SMTP id
 d75a77b69052e-4ab90b1b83bmr227767031cf.34.1752964977824; 
 Sat, 19 Jul 2025 15:42:57 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4041:5c29:e400:78d6:5625:d350:50d1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4abb4b1f1d5sm23671841cf.50.2025.07.19.15.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 15:42:55 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 19 Jul 2025 18:42:38 -0400
Subject: [PATCH v2 09/10] rust: net: use `core::ffi::CStr` method names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250719-core-cstr-fanout-1-v2-9-e1cb53f6d233@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1752964956; l=1207;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=Oj1C9nMjeODD9cRbuQg2XI8fpmvAcfb5NXUs1d2aWWo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QH30BadgddFNDkOPI5I/HO/2elq0QfezIKMKNHHTOVd93jU6oNb5Eh6m2bWTa9LbKeZfUVE+s2g
 0nPY2BpfuFgk=
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
2.50.1

