Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 439BDA65599
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 16:30:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653D610E163;
	Mon, 17 Mar 2025 15:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hKODKI7y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE1910E0E0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 15:30:15 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-6e8fca43972so42630536d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 08:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742225414; x=1742830214; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5VnHac+67NezyG9Z5kQPIahJscKgGgBzlwii56QtL5I=;
 b=hKODKI7ys1wj/XUAlL3cuE96JIxDEg0EtaiBi+th6yURCpUowloUi1m3InBPB4kv97
 xWO6Hf8WnfsEsiMxtqjYctjZZtTnpSHw5JX7dlzqpF/4yvA61M57fi+MIS21XfunhRwk
 CLS72tOm+bqZU4h1arq6YtifxFKukeiP4oYiiNNBGTyKDcfyeqFeAn8X7SUWZeJJNP0F
 KTbhYRIW7t5xfCvgc3wMaPraSEyg4G0FpXCB+W9+lPjkCn9umaKUkALTykmjvvTsZiN+
 3CFY6Tp3k+dqHno4P1nXjZBqXaQofwXZTWJpA5z4Hls9bZMs7s1hLqfzqskulVBvpL5V
 mecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742225414; x=1742830214;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5VnHac+67NezyG9Z5kQPIahJscKgGgBzlwii56QtL5I=;
 b=JtP8n3bLzSZxKTEO+V43K/FGDoL8rmKedHSps88Kp6laHz6G7WD5ooqBqeeSnYzi5g
 PCQ9rj4VH1olo8I8vxyqCWcecQeqD/ipsbYVLAswaXNNVgV/GNHuOFgF0Ylcp6nQMWn0
 q+PbVoYGPGh9U1/f0CIo8slAx477bHm5XF6R+PMA71isnKWE59HHl0BpdPjASRQqr4HN
 x1k8t4D+iujesEaDcWQaV3yxoyEWxyn0NYqY6qq6/+UA8+T8Ay9uci+eKXyXjcS2w1ol
 SnFnL52XkMGb9ILL8a9WbB6DwgbFjpbC3ON5MDyjUp1PgZT/lwXkoPcI5JlDcsDf0MYu
 Hg6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrEZ5vPj5g5zEI8Gp6Rl/LPYD4Turot6Uqv67RgRYPYciMGq4xEwXV8ColA6hALnTGGRZ+ix0RlPo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymNCRgA+LMUNvDWnGWSBgMtozYv7ecw3/gsJP4HeJf9wSTlMNO
 0IdYkbD1KXsDAZ5BfMHguw0JbVytZGTu4EFoOoB2irQDgY5BoFtW
X-Gm-Gg: ASbGncvy18AnzAvp4E3IiU4IDJ2QqXVW/Wq7wauZySKQd3z8ECt8YEu9CX9EdEvRTjh
 VQNWsDWY/m1xZ4JINUnBmp8ycDPPEdPJm/DO6CgBDbSQNP3od0YNoH53IM9GqDprHG0Qu3fM+5V
 oZqj4jBzCMqu2z9Y72mtekhrTjQax0Rjikiu2xSskN4u6NGChr3m27yp+h0/dLRYBpGhfEXGHKo
 ttX4VlX3E85UaoOeQGndzxuIdfhSs0h+qZ8kiAx9nlw+TWzBRNfkOazpPtFOel9jvFYXcVhmsCb
 tpno7l3sTL2QO5A9cRtIGtCm9hpuSSOyuwfnudTVV/ViS2AwaelwrmEeHCrhM5F5OA9gP8Z+uG/
 24rja6ywgFNiWx2Vy
X-Google-Smtp-Source: AGHT+IHNmtB9c12zhL5/E0oWznPUv4bUb/VjSZ9loMwleCwsOPZRUcNYkvDBkshuzLWydzExi8biFQ==
X-Received: by 2002:ad4:5f46:0:b0:6d4:238e:35b0 with SMTP id
 6a1803df08f44-6eaea9fac05mr181158406d6.17.1742225414336; 
 Mon, 17 Mar 2025 08:30:14 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa
 ([2600:4041:5be7:7c00:6895:24c6:e898:e320])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6eade34c51fsm55736766d6.109.2025.03.17.08.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 08:30:13 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v9 0/4] rust: replace kernel::str::CStr w/ core::ffi::CStr
Date: Mon, 17 Mar 2025 11:30:02 -0400
Message-Id: <20250317-cstr-core-v9-0-51d6cc522f62@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPo/2GcC/3WOzWrDMBAGXyXoXAVJtternPIeJQdZP7FobYWVE
 Q3B7x45kGIKPX7szjAPlj1Fn9np8GDkS8wxzXXojwOzo5mvnkdXN1NCdUIJyW1eiNtEnrt20AN
 oqYQNrP7fyIf483J9XuoOlCa+jOTN29AKlFp2DXRwVIii54oX4xKlkr/u5xulJc2Tid9Hm6ZNO
 ca8JLq/6gps4neI2oUU4IJjC9o6cEoHd77+SraQ0v9L9pV0RmI9KdE2+JfEPdnsSaykHZqgwPc
 ICHtyXdcnyCWNaVkBAAA=
X-Change-ID: 20250201-cstr-core-d4b9b69120cf
To: Michal Rostecki <vadorovsky@protonmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
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

This picks up from Michal Rostecki's work[0]. Per Michal's guidance I
have omitted Co-authored tags, as the end result is quite different.

Link: https://lore.kernel.org/rust-for-linux/20240819153656.28807-2-vadorovsky@protonmail.com/t/#u [0]
Closes: https://github.com/Rust-for-Linux/linux/issues/1075

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Changes in v9:
- Rebase on rust-next.
- Restore `impl Display for BStr` which exists upstream[1].
- Link: https://doc.rust-lang.org/nightly/std/bstr/struct.ByteStr.html#impl-Display-for-ByteStr [1]
- Link to v8: https://lore.kernel.org/r/20250203-cstr-core-v8-0-cb3f26e78686@gmail.com

Changes in v8:
- Move `{from,as}_char_ptr` back to `CStrExt`. This reduces the diff
  some.
- Restore `from_bytes_with_nul_unchecked_mut`, `to_cstring`.
- Link to v7: https://lore.kernel.org/r/20250202-cstr-core-v7-0-da1802520438@gmail.com

Changes in v7:
- Rebased on mainline.
- Restore functionality added in commit a321f3ad0a5d ("rust: str: add
  {make,to}_{upper,lower}case() to CString").
- Used `diff.algorithm patience` to improve diff readability.
- Link to v6: https://lore.kernel.org/r/20250202-cstr-core-v6-0-8469cd6d29fd@gmail.com

Changes in v6:
- Split the work into several commits for ease of review.
- Restore `{from,as}_char_ptr` to allow building on ARM (see commit
  message).
- Add `CStrExt` to `kernel::prelude`. (Alice Ryhl)
- Remove `CStrExt::from_bytes_with_nul_unchecked_mut` and restore
  `DerefMut for CString`. (Alice Ryhl)
- Rename and hide `kernel::c_str!` to encourage use of C-String
  literals.
- Drop implementation and invocation changes in kunit.rs. (Trevor Gross)
- Drop docs on `Display` impl. (Trevor Gross)
- Rewrite docs in the style of the standard library.
- Restore the `test_cstr_debug` unit tests to demonstrate that the
  implementation has changed.

Changes in v5:
- Keep the `test_cstr_display*` unit tests.

Changes in v4:
- Provide the `CStrExt` trait with `display()` method, which returns a
   `CStrDisplay` wrapper with `Display` implementation. This addresses
   the lack of `Display` implementation for `core::ffi::CStr`.
- Provide `from_bytes_with_nul_unchecked_mut()` method in `CStrExt`,
   which might be useful and is going to prevent manual, unsafe casts.
- Fix a typo (s/preffered/prefered/).

Changes in v3:
- Fix the commit message.
- Remove redundant braces in `use`, when only one item is imported.

Changes in v2:
- Do not remove `c_str` macro. While it's preferred to use C-string
   literals, there are two cases where `c_str` is helpful:
   - When working with macros, which already return a Rust string literal
     (e.g. `stringify!`).
   - When building macros, where we want to take a Rust string literal as an
     argument (for caller's convenience), but still use it as a C-string
     internally.
- Use Rust literals as arguments in macros (`new_mutex`, `new_condvar`,
   `new_mutex`). Use the `c_str` macro to convert these literals to C-string
   literals.
- Use `c_str` in kunit.rs for converting the output of `stringify!` to a
   `CStr`.
- Remove `DerefMut` implementation for `CString`.

---
Tamir Duberstein (4):
      rust: move `CStr`'s `Display` to helper struct
      rust: replace `CStr` with `core::ffi::CStr`
      rust: replace `kernel::c_str!` with C-Strings
      rust: remove core::ffi::CStr reexport

 drivers/gpu/drm/drm_panic_qr.rs      |   6 +-
 drivers/net/phy/ax88796b_rust.rs     |   8 +-
 drivers/net/phy/qt2025.rs            |   6 +-
 rust/kernel/device.rs                |   7 +-
 rust/kernel/devres.rs                |   2 +-
 rust/kernel/driver.rs                |   4 +-
 rust/kernel/error.rs                 |  10 +-
 rust/kernel/faux.rs                  |   5 +-
 rust/kernel/firmware.rs              |   8 +-
 rust/kernel/kunit.rs                 |  18 +-
 rust/kernel/lib.rs                   |   2 +-
 rust/kernel/miscdevice.rs            |   5 +-
 rust/kernel/net/phy.rs               |  12 +-
 rust/kernel/of.rs                    |   5 +-
 rust/kernel/pci.rs                   |   3 +-
 rust/kernel/platform.rs              |   7 +-
 rust/kernel/prelude.rs               |   2 +-
 rust/kernel/seq_file.rs              |   4 +-
 rust/kernel/str.rs                   | 499 +++++++++++++----------------------
 rust/kernel/sync.rs                  |   4 +-
 rust/kernel/sync/condvar.rs          |   3 +-
 rust/kernel/sync/lock.rs             |   4 +-
 rust/kernel/sync/lock/global.rs      |   6 +-
 rust/kernel/sync/poll.rs             |   1 +
 rust/kernel/workqueue.rs             |   1 +
 rust/macros/module.rs                |   2 +-
 samples/rust/rust_driver_faux.rs     |   4 +-
 samples/rust/rust_driver_pci.rs      |   4 +-
 samples/rust/rust_driver_platform.rs |   4 +-
 samples/rust/rust_misc_device.rs     |   3 +-
 30 files changed, 256 insertions(+), 393 deletions(-)
---
base-commit: 433b1bd6e0a98938105c43c0553f24e0747ef52c
change-id: 20250201-cstr-core-d4b9b69120cf

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

