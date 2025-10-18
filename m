Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46674BED728
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 20:03:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7067C10E07C;
	Sat, 18 Oct 2025 18:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="VUOh9mh3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF57610E07C
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 18:03:22 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-47114d373d5so25358465e9.1
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 11:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1760810601; x=1761415401;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=sRx+IA31rk7VSUz5v3RyOo4nJpXSH+QxySZDi0dx43E=;
 b=VUOh9mh3wsDVLGxEEp06DmqxiCVUz1LUHs3aiTnP41gUUGgl1OOu9dqYDr9zhkdotc
 yf6nyvVmw4NxaG5qLpSKg0EmTzxY+hRCKcCTTJ/tYri1vaf65hL30kCABA3Q5vED1Qyx
 TucS5bCTwgslp+3i+gclKTj6ahjZdCD7ClxZ4UFrAnQsfyCf6BYtled0+Lsk9anEwOSI
 dJ7aOhWUlBoNesuGzVwAnjIUaCH4Bm1t0pj97900LrKv4uNVqqpP8xVvR0zjXYZ0TEFk
 0pciGuPEPX1AIC9MOUBsCZBmem/O61HveFXeiC74piSDsWN7y7HynjM78ubOc/e6+oao
 M/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760810601; x=1761415401;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sRx+IA31rk7VSUz5v3RyOo4nJpXSH+QxySZDi0dx43E=;
 b=JvfCF6hIm+3FfK1ok/b1DMdGWkYtETDkRS/zBNIMV8tJawgCLNN8MutW1c3qdDZypl
 SDszPGPrkOCcS6h8kUq83WUW3Mmn2F2ZtmIUPNDd7FMZ6SNay7dd2QypuAKk87TPZT1G
 VEyYXajSXG/vFN8Mw45N4WAzArOXGsmEE9LuuRCxnQ2iZUTVeaYKsiSsFWT7dEF31NhU
 cHnEY05nhnmzOKoUEssHwet8cHwSHI3eTowISP69OfICn0cqy/vEap2LTJDYbZDvm6cG
 ceTHWZatS+tE7/YZ9mbNDhYKuRJtXqs0GPi/uULKrDJKG1Lz60AU96LTrvWex6XrZGtr
 4c8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoOcHf/RYULaPFQbnI3eWDq/25scODrUdGtZDSiPOG1ch5g5n+49ZQAd0p1N/M6AJXhNUeluRGsZ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcZ70Fbr2UFbUkKiQuRU7+RIiUS00BLMl//KZunj2gwhWKqEc9
 JMQVHH2FuBmflLGhlxbzXQWoBuvQUVrWtX+21GR2C6aQ+LwT7GIJIbL9dIYv2zMqW8evZyA/m5+
 M3jVNh75o+mC1VXDrPA==
X-Google-Smtp-Source: AGHT+IF6AVT5n9fyZmX8HKRXXzv3logzsSjOnhKpBAjpd1CKVhXkGu1U0u6LIuqBRDGiqbuatyc4kakbkHTbQVE=
X-Received: from wmna7.prod.google.com ([2002:a05:600c:687:b0:46f:b153:bfb7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5029:b0:46f:b32e:4af3 with SMTP id
 5b1f17b1804b1-471178784efmr48534695e9.1.1760810601266; 
 Sat, 18 Oct 2025 11:03:21 -0700 (PDT)
Date: Sat, 18 Oct 2025 18:03:19 +0000
In-Reply-To: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
Mime-Version: 1.0
References: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
X-Mailer: git-send-email 2.51.0.915.g61a8936c21-goog
Message-ID: <20251018180319.3615829-1-aliceryhl@google.com>
Subject: [PATCH v18 14/16] rust: clk: use `CStr::as_char_ptr`
From: Alice Ryhl <aliceryhl@google.com>
To: tamird@gmail.com
Cc: Liam.Howlett@oracle.com, a.hindborg@kernel.org, airlied@gmail.com, 
 alex.gaynor@gmail.com, aliceryhl@google.com, arve@android.com, 
 axboe@kernel.dk, bhelgaas@google.com, bjorn3_gh@protonmail.com, 
 boqun.feng@gmail.com, brauner@kernel.org, broonie@kernel.org, 
 cmllamas@google.com, dakr@kernel.org, dri-devel@lists.freedesktop.org, 
 gary@garyguo.net, gregkh@linuxfoundation.org, jack@suse.cz, 
 joelagnelf@nvidia.com, justinstitt@google.com, kwilczynski@kernel.org, 
 leitao@debian.org, lgirdwood@gmail.com, linux-block@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-pm@vger.kernel.org, llvm@lists.linux.dev, longman@redhat.com, 
 lorenzo.stoakes@oracle.com, lossin@kernel.org, maco@android.com, 
 mcgrof@kernel.org, mingo@redhat.com, mmaurer@google.com, morbo@google.com, 
 mturquette@baylibre.com, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
 nm@ti.com, ojeda@kernel.org, peterz@infradead.org, rafael@kernel.org, 
 russ.weight@linux.dev, rust-for-linux@vger.kernel.org, sboyd@kernel.org, 
 simona@ffwll.ch, surenb@google.com, tkjos@android.com, tmgross@umich.edu, 
 urezki@gmail.com, vbabka@suse.cz, vireshk@kernel.org, viro@zeniv.linux.org.uk, 
 will@kernel.org
Content-Type: text/plain; charset="UTF-8"
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

From: Tamir Duberstein <tamird@gmail.com>

Replace the use of `as_ptr` which works through `<CStr as
Deref<Target=&[u8]>::deref()` in preparation for replacing
`kernel::str::CStr` with `core::ffi::CStr` as the latter does not
implement `Deref<Target=&[u8]>`.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/clk.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
index 1e6c8c42fb3a..c1cfaeaa36a2 100644
--- a/rust/kernel/clk.rs
+++ b/rust/kernel/clk.rs
@@ -136,7 +136,7 @@ impl Clk {
         ///
         /// [`clk_get`]: https://docs.kernel.org/core-api/kernel-api.html#c.clk_get
         pub fn get(dev: &Device, name: Option<&CStr>) -> Result<Self> {
-            let con_id = name.map_or(ptr::null(), |n| n.as_ptr());
+            let con_id = name.map_or(ptr::null(), |n| n.as_char_ptr());
 
             // SAFETY: It is safe to call [`clk_get`] for a valid device pointer.
             //
@@ -304,7 +304,7 @@ impl OptionalClk {
         /// [`clk_get_optional`]:
         /// https://docs.kernel.org/core-api/kernel-api.html#c.clk_get_optional
         pub fn get(dev: &Device, name: Option<&CStr>) -> Result<Self> {
-            let con_id = name.map_or(ptr::null(), |n| n.as_ptr());
+            let con_id = name.map_or(ptr::null(), |n| n.as_char_ptr());
 
             // SAFETY: It is safe to call [`clk_get_optional`] for a valid device pointer.
             //
-- 
2.51.0.915.g61a8936c21-goog

