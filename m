Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D62EAAFF224
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 21:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0E610E82B;
	Wed,  9 Jul 2025 19:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MqHIG88j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7501510E82B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 19:59:00 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-4a58d95ea53so4591901cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 12:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752091139; x=1752695939; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VYWhnIjXXiRA1OfTfL+ZgaMGfZmkqUQpway5uw4n4Ck=;
 b=MqHIG88jl3/JVALwGvb/9nuvDB/xUSyU/YrKp/YRohcwwS3p5I51DUzh5jKD6/nkk4
 55uXntMBhHL9z23JxNYQOH0SY1Iq2OnkO64r5YP0CclevWiuXBichDKwjCDgrBr8R12B
 MGrwgEgAb+aNp1m1I4an1TLbl0qwJCRS086aZYf6MZ3wA2MKMvHjtJaVCLHln5xUjYXy
 e3tY+fQKJGczuvr6VMikLzJPZfnsVm7CpKKiMkXanu1nndel75ikpLX8df2wAPD/9VxJ
 Mo/UrLNE5XTLDYdKFSIwXZIryyferhdQGwdII+KQfA1IqsnPCZ0w56DQoQpW8OU184Yk
 FiTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752091139; x=1752695939;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VYWhnIjXXiRA1OfTfL+ZgaMGfZmkqUQpway5uw4n4Ck=;
 b=pdDy90Cz+XixGtflqNscNM41p36/EkPy6SzESUtUcdaYNbCy/Be8ZTpOjaGrTSxWxq
 916QZoDwie1QpqE/oFdA1j0IWwQdU1LqpQSEtSsbd+bBSGScg5WNEBOBQQli0n3ytGSz
 xDHsBUU8KlfszmWbFozkhetjfd3CO3eKYUc1DE5WQt9D1hcbYnBDZdLupJcqEliQrW3j
 ZcH/YNhNCS2v7BOHbHh3Xtnd7GbLHnHKRUHIyCS9Se7S9oodiZpveyEiNFuAuZv6HHqp
 fW1i0Qv547g6ofKR4FIHYA/BDs3p/2NgEAaNfdAWzgvPvBNKSqo15LxU4ZK0MFhFypEA
 9KKQ==
X-Gm-Message-State: AOJu0Ywomj8fIRNvaavpetttJLyNWQWjzrF0jEVi2uuWbmT41F/9/naD
 bvUZ4z79Ojsd9eRuInz3LgoYGIQ6xXCBm1+iouyHRrVETv2FG03u7NBy
X-Gm-Gg: ASbGnctgqH6GQeHm/k+ZPCY+vHl3LlOim2s9znHcUQc1R+dlhOgutoKm8luwKKayRK/
 DcdpLEO3BwZqCNpUXHuO+Xsv5xxC71kg4oavbNIE7G/eB/zHeF396iA5/pSmGxLIkNJ2tnH3dwF
 3G5f7SsZLUohog9HOL7hbuyI1WsqLYMn21VcQz5VJoGOP4fAoG51VG2bIf7N1AMYFoTKvPoK9qk
 5D6vl4ca8UaGU2YFFBDmK8Onl5GEG0z7n0i+79D2EXPjbTznoFmttt57OK5EdD7R0rQZMr/SrUG
 dkQz26M9grlY9zgOHm/74h0oX0B4Ud1mc4NqCRZp4aZk2GtYWc5dlNN7wQy+NjLxvF69jgLW+j1
 Ct9iectv80loUrd9LrupVWhTzc8EStIKJZIICY10gboG7J15z6uoHMtdkVA==
X-Google-Smtp-Source: AGHT+IH9lva4APxzj5/ISh67+5M8e7gYLgD+7KgrDdxQ1UoO5ZdMtH03BYij8pw1HtWem0c/kARQUw==
X-Received: by 2002:a05:622a:4d8e:b0:4a9:8299:4e00 with SMTP id
 d75a77b69052e-4a9e9a50750mr15178691cf.0.1752091139453; 
 Wed, 09 Jul 2025 12:58:59 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a9949faf39sm103584281cf.28.2025.07.09.12.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 12:58:58 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 09 Jul 2025 15:58:52 -0400
Subject: [PATCH 02/10] rust: auxiliary: use `core::ffi::CStr` method names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-core-cstr-fanout-1-v1-2-fd793b3e58a2@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1752091133; l=1142;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=tOJwnPFFO6erKPblInuDRYgXedY1qto4AlF3RLJHBts=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPSZBmZ+VIM4SaoWH0G8iDJiHhk9cO5mpQDWNSzUl8KOlk/QHa9tbo4//41gHJWg+mLiZ7pLXTD
 00s8S1g2wLwY=
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
 rust/kernel/auxiliary.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index d2cfe1eeefb6..89d961407adb 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -111,8 +111,8 @@ macro_rules! module_auxiliary_driver {
 impl DeviceId {
     /// Create a new [`DeviceId`] from name.
     pub const fn new(modname: &'static CStr, name: &'static CStr) -> Self {
-        let name = name.as_bytes_with_nul();
-        let modname = modname.as_bytes_with_nul();
+        let name = name.to_bytes_with_nul();
+        let modname = modname.to_bytes_with_nul();
 
         // TODO: Replace with `bindings::auxiliary_device_id::default()` once stabilized for
         // `const`.

-- 
2.50.0

