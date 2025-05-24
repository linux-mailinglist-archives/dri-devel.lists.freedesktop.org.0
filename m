Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B933AC313C
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 22:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9CF10E1A4;
	Sat, 24 May 2025 20:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g3wrZams";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98BCA10E15D;
 Sat, 24 May 2025 20:33:31 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3dd24c86779so1751955ab.1; 
 Sat, 24 May 2025 13:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748118810; x=1748723610; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gDpP7s7cOkPavUulBU3Ba+a6zZqUiVMm4fW37bEOlm0=;
 b=g3wrZamslT/H5LYZ56MkjjrZSLZSOwaXeTWP+2UGMC/E6aRbI+VOCnaqSdEVkzkrzl
 sjwaiSMGbWyQ+NrLVSbWwZp/1IATnjQTuyq9GQpI9lycZ6hUtinXlrvR5idW/HD6kUwh
 ybLr4CQK325fQOIeTEjjpKVUlTKgGTEECgb2nqjxP1OfN2T+/RaF8J3Gwcrcng8ve8t7
 eVMmui64LnxDw7gNPbgVpJ59Wq8bCsY/qOY/SUTeF57RTsyb2uYJjAUpxL5yTbB/0QUE
 yhaYJLjFjE5ZszOoG22YfT4DVtW+oQpBQ16sp+QOV4PKP7npYAKVxwIh7I2UtsLg0cYx
 jZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748118810; x=1748723610;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gDpP7s7cOkPavUulBU3Ba+a6zZqUiVMm4fW37bEOlm0=;
 b=WmRG0c+jxXQlN4D3pdGjxxHMsEWYdWXDiXAEs90ZPDumIKyykOFvienAQkYC6xqazn
 KeSHDMrw4WWVjDBkzl1zw89neIqvFF44fe8X5PRLJZHTS7vVNPiRk7p8mPGatIaRPjqw
 +tPp4cOQly3NrfYDZOJz6zPogRiF3EifyNqeNxnwif81S2NN8IOZePEECIoUb+R3H5EL
 zxNLBhv3UTrcghrEVVFju4ZUuRteWLyiHRVeydT6/WjulQuvKDKzCkgycuTP5FpdnYhj
 lx0oASpgSdHbKA5KSzUEYo4lHM9CIeH+aNKQHlzw67F0x81QuJDweedV6FdbQn2e2qOq
 IhOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+vBU+y+oGLiU3fZRkg5/1YQJ2ZoccsfekrV8qu+ZPNtb7rr5Me8/5IdRYTJh7OT60l6SJpw02Yj8=@lists.freedesktop.org,
 AJvYcCXgMiZ0gsMrSS2Dj60sm/vL28TBn5e47NYz+aclC7Y9ij8s2kMhjM2KEH5cn5ppRUkGqm4dVRJnDw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIM5+45K1EEafBuQsxV43aeOYktahK36R7PrHI5IY0pc7yWqhG
 CjJoTjbXH80rAaaEM0iMEHfnoh4KmSrBR52J0IVk+PaqpN+rB1J5UtsyOQKf7xZVM4A=
X-Gm-Gg: ASbGncvPVil/fSyD89p/NotgUbSHXtZn9Gki+KpwH3TXt/0ijb/63mSWgM9XdsmfNJt
 hm0SK+3he36QHVh8YIO6thSyKT/kbrYbpykSa+ldtz3cr0stdY5ZFUL0+vWmNM6R1KqgwqJkWjO
 Evj+5MFCr4FNHH4QjAIFvypLZFcCyHde9cyi+10iO1gOAmUkj3Ob8kT1ZyK796gaScwZL8iDSsy
 f3t8/zmhhuE5nBjHW5Sa21Uf5FQ0uShFmNPL78Al0dBRhQT/FOCNLsZxFZnT+hgJM8YSKtAWPX+
 WvzZrlAoMI77e1qDMirHKPzrGZDKX+qG8xeaD4gTkRlKe37GpU4CLY1/5WqsrcY3xqeo4rWHs3G
 ss3ta8K9ssF1++y8b/FWyaUcB9u3TMg9giRsDzreZngrz12kxfftRtZCHpP69nwRX/Zwc2Q95em
 ppMm0=
X-Google-Smtp-Source: AGHT+IEY1bus7pYi5JcXesXRddo5ekO8LWT2IX5dDBSF4gjuh1ID95e7jx0zQU9fIvHGHwyslvJU7A==
X-Received: by 2002:a05:620a:44c2:b0:7c3:cd78:df43 with SMTP id
 af79cd13be357-7ceecc45f6amr602236985a.58.1748118799405; 
 Sat, 24 May 2025 13:33:19 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4041:5be7:7c00:8563:e370:791f:7436])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7cd467d7fd1sm1379590085a.29.2025.05.24.13.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 May 2025 13:33:17 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v10 0/5] rust: replace kernel::str::CStr w/ core::ffi::CStr
Date: Sat, 24 May 2025 16:33:00 -0400
Message-Id: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPwsMmgC/3XOy27DIBAF0F+JWJcIxvYAWeU/qi4wjxi1NhFYq
 FHkfy+OlBZF6nIe5+reSXYpuExOhztJroQc4lIHzt4OxEx6uTgabF0QYDAwYJyavCZqYnLU9qM
 aUXFgxpP6f03Oh+9H2PtHnX2KM12n5PQzoWeSKz50OOARpGSCAi3axhRL/rydrymucZl1+DqaO
 O+RU8hrTLdHvYJ78LMINEUKUkZlj8pYtKC8PV9+Q/YiRfwrRZVWc1lPwPpOvkrZyq6Vskozdh7
 QCYkSX6X6kx0XrVRVDtyiMQOAR2jltm0/fH5cIZQBAAA=
X-Change-ID: 20250201-cstr-core-d4b9b69120cf
To: Michal Rostecki <vadorovsky@protonmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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
 Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, 
 Jens Axboe <axboe@kernel.dk>, Benno Lossin <lossin@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Benno Lossin <lossin@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org, 
 nouveau@lists.freedesktop.org, linux-block@vger.kernel.org, 
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
Changes in v10:
- Rebase on cbeaa41dfe26b72639141e87183cb23e00d4b0dd.
- Implement Alice's suggestion to use a proc macro to work around orphan
  rules otherwise preventing `core::ffi::CStr` to be directly printed
  with `{}`.
- Link to v9: https://lore.kernel.org/r/20250317-cstr-core-v9-0-51d6cc522f62@gmail.com

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
Tamir Duberstein (5):
      rust: retitle "Example" section as "Examples"
      rust: support formatting of foreign types
      rust: replace `CStr` with `core::ffi::CStr`
      rust: replace `kernel::c_str!` with C-Strings
      rust: remove core::ffi::CStr reexport

 drivers/block/rnull.rs               |   2 +-
 drivers/gpu/drm/drm_panic_qr.rs      |   5 +-
 drivers/gpu/nova-core/driver.rs      |   2 +-
 drivers/gpu/nova-core/firmware.rs    |   2 +-
 drivers/net/phy/ax88796b_rust.rs     |   8 +-
 drivers/net/phy/qt2025.rs            |   6 +-
 rust/kernel/block/mq.rs              |   2 +-
 rust/kernel/device.rs                |   9 +-
 rust/kernel/devres.rs                |   2 +-
 rust/kernel/driver.rs                |   4 +-
 rust/kernel/error.rs                 |  10 +-
 rust/kernel/faux.rs                  |   5 +-
 rust/kernel/firmware.rs              |  16 +-
 rust/kernel/fmt.rs                   |  77 +++++++
 rust/kernel/kunit.rs                 |  21 +-
 rust/kernel/lib.rs                   |   3 +-
 rust/kernel/miscdevice.rs            |   5 +-
 rust/kernel/net/phy.rs               |  12 +-
 rust/kernel/of.rs                    |   5 +-
 rust/kernel/pci.rs                   |   2 +-
 rust/kernel/platform.rs              |   6 +-
 rust/kernel/prelude.rs               |   5 +-
 rust/kernel/print.rs                 |   4 +-
 rust/kernel/seq_file.rs              |   6 +-
 rust/kernel/str.rs                   | 415 ++++++++++-------------------------
 rust/kernel/sync.rs                  |   7 +-
 rust/kernel/sync/condvar.rs          |   4 +-
 rust/kernel/sync/lock.rs             |   4 +-
 rust/kernel/sync/lock/global.rs      |   6 +-
 rust/kernel/sync/poll.rs             |   1 +
 rust/kernel/workqueue.rs             |   1 +
 rust/macros/fmt.rs                   | 118 ++++++++++
 rust/macros/kunit.rs                 |   6 +-
 rust/macros/lib.rs                   |  21 +-
 rust/macros/module.rs                |   2 +-
 samples/rust/rust_driver_faux.rs     |   4 +-
 samples/rust/rust_driver_pci.rs      |   4 +-
 samples/rust/rust_driver_platform.rs |   4 +-
 samples/rust/rust_misc_device.rs     |   3 +-
 scripts/rustdoc_test_gen.rs          |   2 +-
 40 files changed, 426 insertions(+), 395 deletions(-)
---
base-commit: cbeaa41dfe26b72639141e87183cb23e00d4b0dd
change-id: 20250201-cstr-core-d4b9b69120cf

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

