Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CE6B0B258
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 00:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D61F10E438;
	Sat, 19 Jul 2025 22:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HU76igqp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1F710E423
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 22:42:42 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-4abc0a296f5so15424781cf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 15:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752964961; x=1753569761; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UeEHIXOtH2ncLF22HE0YpS44+Upp0FbsPcW0YSpVKLs=;
 b=HU76igqpofPVt9kIK59TXYAcVmLa5/CU7PPi5wnkFjX2SfIzoIUx+aRlq4FVSD7jZC
 M+bG0zxAIhAGReZ1Dp9jwUoLCsScyVd9lxexeowh73AZTvnbRphyrLsOrwPaZ9EaFQCa
 2/wNR4mjER5E2yXfAieXafNu4VFlP+RUbzLtLTLZQzzIIUS11K9af/gT8Z2Wca9tjRXz
 tCBEo2bI7iXEiJ7ILAx4IVC+0d3wBFNWWOwANS4N5XUBvgCiBUvEG/j8kJBi/2noRJej
 HNxBDtIWmQsDmS4ZgO2ro6IZcCuV5Od/6+kMeBI9v7qgSQ7HDZRcSQ7CBcDswJgzJwD+
 X9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752964961; x=1753569761;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UeEHIXOtH2ncLF22HE0YpS44+Upp0FbsPcW0YSpVKLs=;
 b=m+3ucSpBZrXP/0p5M6dhu53GjhC69LzgL/FIf+6wb7iPpaSXb8GKKsvvlyWEU8eNaa
 BQSwDmlxRYyf4j2F/NSX+DDr4w88HZiKMg+etuuVuR6hJUK8SSLQzBIpKMTRrlVnbOww
 jpyre6BSNhP4o9jl9Cnfwq7PJ9iT5qH04t9UE2wflQkxyYKgG9M5JTyGJ2/SZXABOcQV
 PIuvNdl5BRI3ssHxSQGymiChBKFjkMSVpqQmawd7n8CneXZrJaUgQnFZHjaqPJeTOBfC
 LF2qhMJY+4ytPerIjM6w/SwgSdlbEF8A9FyK72skc1wEtZynOif+FzFWzIiyHQsuLPi2
 FNyQ==
X-Gm-Message-State: AOJu0YxUrH9SgzbiWeXtRyuwNx5ynnZlo1ZRr43lGPRmEXDBixpfQtwO
 hx/4z9PZMDkh71izDxKJh3OV06jOKSYTD0hBxP/Fd1tKohrv/ab9i+cG
X-Gm-Gg: ASbGncsygR5JQPJUjO79B5OMVDNSZljg3qu1yUD6+cq3ecxLCznyGwTTTmp4W2dYLbT
 R6NVHTv0+Td4eGSWBe/DESSDFb+EkQCl6zD8mvDbdI+DejyC8RvU5uSwuoH87dv+koLi3NNoIFi
 Ehy/aMgMdm9s4t1GmkVD7WUdwm726wAej9wzoVdBy8fAUBEtODl1THR2ICtDODcqdasUxeMJbdn
 QhVjidzWJu3Ip0dSa7ssVySwtMqttLUOJD/upvP7biStGK6cVE96x82Yn+paxVmguHcHJXoHT8b
 IcDGDJ5CspRjAKDaweWKGNQucb0670fvmOQs9TNyUMDrYMA4xAieV15SaTF1TITwbwW/jrF3LoZ
 ya+jj+oLuIrtH2f3mKZslxaN3p04y7JfWb2TGOASPCaL65cmYpbsz+u7U1ccYrfh1kLgshdYc5z
 P6Wlqqg67qhx5ce8UAKNr5gAta3HLs
X-Google-Smtp-Source: AGHT+IF2PYh8zx8Jfn+WqSRkgzvcMsRj/r02AxZBLfN/d2WuVA0PvKOvK3qRe/MPq3QXtlxLasEHCw==
X-Received: by 2002:ac8:7dc8:0:b0:4ab:a8d0:a244 with SMTP id
 d75a77b69052e-4aba8d0af42mr148999311cf.6.1752964961499; 
 Sat, 19 Jul 2025 15:42:41 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4041:5c29:e400:78d6:5625:d350:50d1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4abb4b1f1d5sm23671841cf.50.2025.07.19.15.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 15:42:40 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 19 Jul 2025 18:42:31 -0400
Subject: [PATCH v2 02/10] rust: auxiliary: use `core::ffi::CStr` method names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250719-core-cstr-fanout-1-v2-2-e1cb53f6d233@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1752964955; l=1235;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=C2RoA1DYRtxUsK+7WCxXFFASB83Bj0hUEk4zZrYldtY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCLcLgD4dL6x0zBz6Jg+8AmnF0edNVa7Kb18ObpM0PwVmNfeWR0fPny8j2hSdBW2trJMt4LD7tj
 4wnszhfhnwgw=
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
2.50.1

