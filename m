Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCDEA49990
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 13:40:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C9C10EC8C;
	Fri, 28 Feb 2025 12:40:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="gXa/82KP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2C810EC90
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 12:40:07 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4394040fea1so10903535e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 04:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740746406; x=1741351206;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7pTdW8PK+uCDfeP8CraTwZfQg74lm/uFIg+fx5O10BM=;
 b=gXa/82KPDcX0kKopUATuPG3Cz6lvK5+MK6GlI8g2PNBK//cXetDU1KaouQNWFhu9QI
 Njgc4NMSO1i/wFP0uPwGL/Vj33OLSZryoLF4sgYyynJU7J16LS5TFwlyX5FW6SVSW5J4
 ouosIR7gVDxP9mbgs4MdWgl7s9aCYREIxoIjoaUo4q9SsI/IYGij+1TKZnwisiSUNs5c
 c1+wz7NMxqkfcWS/wImjdXepTjc3Ut99gVJJwZYPISwcRLi4uyUZlX+XcwQBn72y+3j1
 0sy67zNabbRYO42QlvCnBI8Ayqf67CKTW1rwoiMULK8i01cMKdDMS1f5/3Ut8lG/xx31
 rVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740746406; x=1741351206;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7pTdW8PK+uCDfeP8CraTwZfQg74lm/uFIg+fx5O10BM=;
 b=Siu7B/BvxMwBmXWbg6+3fTD0nKhsy2RTkbIO0oKpuKMaAuxS4k8/KEraHJEnDdTS/Z
 Zpn76MnfDBRPK+zxSFjc3s9YGhXiJLuUOtf19/QQ+YasqA7mTtedZfo6aw3OHdaic3KM
 bUHwXXh2dfTmgNB3qZV3gwWZwxxPZzUlXY/HvP+qNPtr5fzKg4WEI3LbZYOgfJ8oBuxf
 LdRIefYoUDh6B1kJwSy+MNVj+LXEpjpeS1jNgn6Ln1hAYQFIXcVDnjBKsIn3aTsurCwt
 cQBlQFiXvjaOwFmGAJW+i9ckQ0FRYlObWJlcflK5zrXRENDunuX9LCWngiBYw7gEnaRZ
 YgCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6yhG7sDVbfC1QKGIvL9T0NVyb2UcHWFeuKfTEJ3TUfPlmS4O7l7ZKkjpUEu+jce0D1+RBQ4cHBek=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yym17Xlk0gdfrXqAEQcDBkj42L0h+vGewOvI0KXqcMmM8ZAZCvU
 PgCgb5aaOM7R/uTVV/gKHFs5RK034p8tIY5DHX4QBgiTVTkSpkG3YRjsRoqwpcSpxoA7CC0FwDI
 yiefUmkfl1JBAxA==
X-Google-Smtp-Source: AGHT+IFEAv6xKo0a0vIbw4/G69A8H8krQW13rE7XRkdpA2cYXMlLXGdQj1+W9BdcKKZjWZpEvcVhucpeSr3CYy8=
X-Received: from wmbep23.prod.google.com
 ([2002:a05:600c:8417:b0:439:95b9:9200])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f51:b0:43b:4829:8067 with SMTP id
 5b1f17b1804b1-43b4829817amr51521165e9.6.1740746405761; 
 Fri, 28 Feb 2025 04:40:05 -0800 (PST)
Date: Fri, 28 Feb 2025 12:39:29 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIGuwWcC/3XMQQ6DIBCF4auYWZcGaC3iqvdoXBAckKQ6BgyxM
 dy91H2X/0ved0DCGDBB3xwQMYcUaKkhLw3YySweWRhrg+Sy5VIqhvtKcWOzsZGYNkY7wcVj7Cz
 UyxrRhf3kXkPtKaSN4ufUs/itf6AsGGf63inVOntTxjw9kX/j1dIMQynlC+PMihWpAAAA
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2311; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=f4F5ENySuuzTW13FLThOl99dyKMXA8tvaC3KtUU/46E=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnwa6HYies8d8W+vofsAmaaagCFfM0KznRJPlkQ
 bljWwLQeAKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ8GuhwAKCRAEWL7uWMY5
 RsbbD/4k34jEhPxhPU2TpjINZJrCX+hzqaKUEueUixT1oETdYXEbkKIoL+qzDQ8hcm7U0cS+bcK
 ca1QBfyXm2WUi+hjb69vXRwkN49bhCNcJWxu0/KzCJUgw7tKdNxpG78AKmj8oEH8VXC71ndQ6xw
 Fj1X2YPlz4Vqc8TgcWbb7Sxveyc5fHwA4OBpjSjJPGa2qizE22QSj/wCLOkvqo/g2mk+GxpjVj0
 3GYT/YxqHiGfK2xHslVDc/FZ1DSn74rnnXqNhqn7brcJ+10hK4M7AWqGwYeD6cisJ6f23UgI0bG
 3B0FTrGH+E5uWycU8ObgQWz1twUUYcIlNb4ftQe1pCjr1lOOt6f67NN1WIU7n+eUwIposZdwvpf
 XE4T4/xoaTDRquh0vhq6m7tekwjY20FbAFcSXOvxy7Ezr7Y/GVMEXlPXH4RKH+JoDdQbsiTkvBL
 0uSwvvip+e/3MsOfU8gsfSYHOSw6Xc1+Hcf+ZaR7KxvhBzOnigeYi8E73Mht4Z1O6r36puYZBhI
 Lg3d1TobsqMsGq2SMXqC0L1ZLVMUqzek6+bEOzZfOwffQMY7E8fnT38sfockn/Yl9pchQZdiGDh
 mcQtARbW4jezVmMEOOqi962yXdzGOACBt8iRewWXLbm5Hg/ofgjxl8Py8lyvNquKktPP0ItoGfw
 aua1wRpwI0xbyvg==
X-Mailer: b4 0.14.1
Message-ID: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
Subject: [PATCH v2 0/5] Check Rust signatures at compile time
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
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

Rust has two different tools for generating function declarations to
call across the FFI boundary:

* bindgen. Generates Rust declarations from a C header.
* cbindgen. Generates C headers from Rust declarations.

In the kernel, we only use bindgen. This is because cbindgen assumes a
cargo-based buildsystem, so it is not compatible with the kernel's build
system. This means that when C code calls a Rust function by name, its
signature must be duplicated in both Rust code and a C header, and the
signature needs to be kept in sync manually.

To eliminate this manual checking, introduce a new macro that verifies
at compile time that the two function declarations use the same
signature. The idea is to run the C declaration through bindgen, and
then have rustc verify that the function pointers have the same type.

The main commit of this series is "rust: add #[export] macro". Please
see its commit message for more details.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Various improvements to documentation.
- Split out quote! changes into its own commit.
- Link to v1: https://lore.kernel.org/r/20250227-export-macro-v1-0-948775fc37aa@google.com

---
Alice Ryhl (5):
      rust: fix signature of rust_fmt_argument
      rust: macros: support additional tokens in quote!
      rust: add #[export] macro
      print: use new #[export] macro for rust_fmt_argument
      panic_qr: use new #[export] macro

 drivers/gpu/drm/drm_panic.c     |  5 -----
 drivers/gpu/drm/drm_panic_qr.rs | 15 +++++++++++----
 include/drm/drm_panic.h         |  7 +++++++
 include/linux/sprintf.h         |  3 +++
 lib/vsprintf.c                  |  3 ---
 rust/bindings/bindings_helper.h |  4 ++++
 rust/kernel/prelude.rs          |  2 +-
 rust/kernel/print.rs            | 10 +++++-----
 rust/macros/export.rs           | 28 ++++++++++++++++++++++++++++
 rust/macros/helpers.rs          | 19 ++++++++++++++++++-
 rust/macros/lib.rs              | 24 ++++++++++++++++++++++++
 rust/macros/quote.rs            | 21 +++++++++++++++++++--
 12 files changed, 120 insertions(+), 21 deletions(-)
---
base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
change-id: 20250227-export-macro-9aa9f1016d8c

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

