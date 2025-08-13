Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C778B24DBD
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908CA10E764;
	Wed, 13 Aug 2025 15:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WWklqRky";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9BC10E75D
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 15:42:21 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-7e864c4615aso115043585a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 08:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755099740; x=1755704540; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wcmbdRLiVO4cc/yBM3bWVRyme/nNaKfenk9T8xs0Ffk=;
 b=WWklqRkycnsL23B7rOfe2D3uFCfnoJgxs8cVVX7GrPZ1H+ItDx6LhWVFWvJck+u3XY
 yHDWgx3BYs4jjTlPVUksP1y0oWJykBRiIPmC5SKSP4QWI8C6biC+FAGly/+C9ODMHAW6
 SZjPUAByQryEdZzjHc/dBubfeLdfyuo38Gw6Gg1yhJQkReG4RcZ0HQCcM+stUgzDlu8W
 zaltHMpPxokx7r52UQbVXpxIv+b3NCcChJyXkkK+Dfkw665Uaph0OO/+uX1MJsnBPrmt
 DfWV3aY+ed1JffVwL8kRzIhkPTGseMbnyo9pTLq8T5huL6O2Z8Z4zGzCYhr3COGQ9c74
 ZZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755099740; x=1755704540;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wcmbdRLiVO4cc/yBM3bWVRyme/nNaKfenk9T8xs0Ffk=;
 b=ZUw5+aOlJWAOO6T1cMwXqWg6Qa23aknLP76WjZIcV/AXm0Viflz3ho62qTYC3JAyLY
 +2rUQEvjRL645vfDk/QzoMsvJfz446VcGvkUD6Eq+DbRD6r+NcZPFkUBSntgjRzvqYul
 f2ktfv4waQKmrQocRUOyqUTLXZLrWKzjBEw7k5swD53HtkRShAsyoxmE9baLgMhkNq/s
 ceWhwLx0pBmIRmXTGXg/ivkDYDi2Sk8PYCsm35Lr9pvsK/KFST9q0DWqlqOieP4rpVkp
 9yOVkirqrnoEndUxWZObrjqTAMuQGiiOtN7I6aIhe3f2XA7dR0oO02iNfVLGP8rs69NA
 7Bjw==
X-Gm-Message-State: AOJu0YwrDrFb41ovoMolPF5zq0dKxHwkcE9c17WaH4AGuU/h5haWB1df
 sECQY7QdXsIeonAe6rg+r9kFB0wvPB/ZdnOV2KW8n9F7RjcoI/LW3hwc
X-Gm-Gg: ASbGncspDJkbEcouyKloAuurWrQ+wVJ+rw/zAkF+mN1BvjAJmWxpmEZ4Fh5XKPt3ecH
 KhMiEFe8UIfi3LpXqHgxL5UNkJ6y7y0oTqwAt9zbEXW32EavV5U+HhU7SyPP/uo8bacwYjbwilo
 r1e+fLkKDc7LfaUD5chYEP///qDNuuqL5Y7MyUSEG2gm2mOzYvh401WmGiZd3sQl6sO1+sA02lO
 Of3jWhzEFcw1lFc8w+LSIlukRwS6O65LtFwN+duEn3Dhj+1lhPOjOTq5+AwhN9lsHS9nVzue0bu
 na7yGUr99XNj8wV28JVox2h94uik3koOQqm2j5XPVkyAeRb43zqvZ5X/cun+EU8ffmsGeAxiTfP
 SSYO9DigXsZCBqn9k/N7fNh8Ww3w1WeIpuXKju4KkfzjG9SicJpVcl8Re5SFozn01aTKCny0fJW
 mQF/QPCyt9j8xTzy9bn5jshL2vET0pPhawASc6sGZnwcbc
X-Google-Smtp-Source: AGHT+IGfyPN9tuqYm8U4vQO9QvX0XCFm/DgPPcPcTW3fssXclM27AttUHXU9384uEAdC1FKNPCVA9w==
X-Received: by 2002:a05:620a:4309:b0:7e0:e2d7:e03 with SMTP id
 af79cd13be357-7e86fbc0bd8mr8171785a.7.1755099740351; 
 Wed, 13 Aug 2025 08:42:20 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e81bc7a1e3sm1180019685a.74.2025.08.13.08.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:42:19 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:42:00 -0400
Subject: [PATCH v3 09/11] rust: net: use `core::ffi::CStr` method names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-fanout-1-v3-9-545c14bc44ff@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1755099716; l=1163;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=jSSTP0CMYqLQgK+GyMVsel3zf/VtDwNHVf3qOND1uDk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLE8mI7AVGtx+HAorNNktKwEeNw87jP2Dm/x8WxEn8G0HU4C1+7sSGz2uvHfqc6z1xiQtkNCaCN
 XP4LWQ43yBQI=
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
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/net/phy.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 7de5cc7a0eee..be1027b7961b 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -497,7 +497,7 @@ unsafe impl Sync for DriverVTable {}
 pub const fn create_phy_driver<T: Driver>() -> DriverVTable {
     // INVARIANT: All the fields of `struct phy_driver` are initialized properly.
     DriverVTable(Opaque::new(bindings::phy_driver {
-        name: T::NAME.as_char_ptr().cast_mut(),
+        name: crate::str::as_char_ptr_in_const_context(T::NAME).cast_mut(),
         flags: T::FLAGS,
         phy_id: T::PHY_DEVICE_ID.id(),
         phy_id_mask: T::PHY_DEVICE_ID.mask_as_int(),

-- 
2.50.1

