Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D98BED5E6
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 19:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3123F10E10C;
	Sat, 18 Oct 2025 17:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SvmxUWi1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A0310E10C
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 17:45:33 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-891208f6185so224940085a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 10:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760809532; x=1761414332; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GdMS95Atx4mSrNPZQAo+LsUQxkW9pe6jqlDkCSsN+lg=;
 b=SvmxUWi1204jxaUVdoEcr8yhUcMphIAGuxSJr/Of5GbV0iWVVAbBPKhXU3LUD6gQ8n
 D94ritt0RxfCXetQa5f0oiWXde54buA90zhV5mY2XmO48M6MbzBYRnOJOAvptjFli3+3
 ejwscJoACCvLYXyW94h4OI7gTK5gC8TLa0kOfmzQjr0lZ+N4cyAWuYzZvXqIug3D4RDq
 72O+iAfxSUKQaHq/H5YNuVqs/3dDKEDLXi7qhyvpu6inELW6Sozwdt9I7DmLj3rDFmgP
 ktVmtsfyj4cculMLDeHbwBoB5Wz31WMFHlwMG4flVaok9JwEmjvo2onUb4yigWQS95iZ
 27Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760809532; x=1761414332;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GdMS95Atx4mSrNPZQAo+LsUQxkW9pe6jqlDkCSsN+lg=;
 b=EuY/nP5X99XCjWO6w6nSIa0zzttWfT5sv/VVyva0yqbUcz83LE6+FIjZ7JGXCtrfp5
 n130IjW/k9i5muxYOZ+12joPB9bAEoVYTYt9JP1mK5U92sZTAV29nQDGstD0WXKVSS3y
 ZGNuOQ9lPpRjY/ep3UEFzhNN1+yF/WbeHFeCD3MrYSmH5lteo71s953TYHFNwNar4H4E
 PiQuHwoL6y3H44V/3KPyD9J5c44zNXFFCQMM4umq3+HCzZu87/MRPHO/4h7RrjZFTCwy
 dQ8VxWSfAWcXNzRkdzhvLX5A/YAhznSqRepqeNDhywqg6qNAak2o+kPFYtQ+FdbKMQlo
 I9FA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2InIgeVusgULeAwzTnb1CS3GxFHMfQtbjFwyvlRVRYvvvPTKXSMMfGRU6h6oHLUXJ/Sao6yZrFhk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGW7XxQKfvzz0zQOqRTHyjuH8TIfOAs2uVYy9tCa1THtRpjFVs
 xu3bRN7nSD71HBs4Gd29bF/PEHlx7Xq0AIKgLY6Kj6EVm2c3WlE89YU6
X-Gm-Gg: ASbGncvOrwj4f8T5aldOT2Ex1KBxx93l7ovkSUWlnUmC+J0mlRKsmA2j1PQRW68CJqc
 ZXArNvhTtnGxAXwdTT83ztEf3/ajWGzGQQJHy2zTMR5aYjj6w4WQruJJbyuDAMfrQrs7X8n4hjq
 KnRF8Z/YkUiAqCyzessKpc/vYaj0TGsBZqKFaqvPbnsPISAWhEjYfGHaipVIQdYXf9v/+rBXi9v
 vpGQmTNNpFGzf91C50TOieg9i1Cq1rIDk3/w5TLB3KZmkuwd/uBd5t+01TEN6wo8tVu+P/r3ACt
 3ZNcmrHl7qwYjcPpUTqb3wLaOYklttzZC9i1VNfWl4suzrSYSoiheJX55yFsyeKo+HDWqWWmws4
 S8f+Ct2ggRO3nhvdtYetNKpyn3ctZZrRjfIhy4K3CT6tPmhbCkvxtxkIqEUMDCsT8EQCg09WULA
 lQslDLOMqhlgEiI8nLGtcXlTg+KQXwkgSw72i63bFWZCdCyeGHgqTSlxnScBhtTZJG8TnaygYOP
 KRAsbltDk8eaq5TVOYynA0Ts1dei7IlEtZSF8h3mRqFRemi/T+lghQM3MCgOOg=
X-Google-Smtp-Source: AGHT+IEdevRuwofuzpFzVC3FI0PAVHgIWWVzq4ljVRX5kAtuoN7pN/QGHe+EUZbFrhmTy1MgZSLsgQ==
X-Received: by 2002:a05:620a:4806:b0:890:28c7:f668 with SMTP id
 af79cd13be357-890706048dfmr1055053185a.75.1760809532242; 
 Sat, 18 Oct 2025 10:45:32 -0700 (PDT)
Received: from 117.1.168.192.in-addr.arpa
 ([2600:4808:6353:5c00:1948:1052:f1e9:e23a])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4e8ab114132sm20445161cf.40.2025.10.18.10.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Oct 2025 10:45:31 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v18 00/16] rust: replace kernel::str::CStr w/ core::ffi::CStr
Date: Sat, 18 Oct 2025 13:45:11 -0400
Message-Id: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACjS82gC/3XTzW7bMAwH8FcpfK4Kkvreqe8x9CBTcmOsiTrZM
 xoEeffJWVvbMXaU5R/1h0hdmiGVPg3Nj4dLU9LUD30+1QW6x4eGD+H0mkQf64eGgDQQoOBhLIJ
 zSSKq1rfGIwF3Tf3/vaSu/7gV+/lS113JRzEeSgpfFRQ49Kil0eaJnAMrSEwh5pKn4df5+b3kM
 Z+OoX974nycSx76YczlfIs3mbnwVxBaBZmMAOGU8RxNJN/F59fvInOQyf5X2ipjQFe3CJR099K
 tpVxLVyW3siOTrDPO3Eu/SIl2LX2VGqNh1kSdoXuJsFBNak0RqjUKKXgVfbR6Z3FlJWwszomjZ
 +CWWw/7c2mxBv3G0nzDwJ5tq7QH2Fm5WLuZkrpVbe2KjTK13obdTaFaWdxmVnPmYBNwcMRun1k
 v1uGmQahnayVFTyQ7lXZ2NVCe9MbOE6U51gYrC4n35y4jhYBbe5sp1smGxM7CZhqv/95JSb//1
 Lc2fj6W6/UvA6b1f4kDAAA=
X-Change-ID: 20250201-cstr-core-d4b9b69120cf
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Christian Brauner <brauner@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Carlos Llamas <cmllamas@google.com>, 
 Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Tamir Duberstein <tamird@gmail.com>, 
 Matthew Maurer <mmaurer@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1760809526; l=8902;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=RkRyHI7uPJ58DcP8916jBGhXJnT62dW3s7Q+6uzhQjA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPrydIdiiRS/gK8h0NUWuFXcftpHIZ9RrtXQTWEtyVAud7xhDhZsNYylluVe0V4u3EjmEfmoG1y
 kqY2z5aP8tQw=
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

This picks up from Michal Rostecki's work[0]. Per Michal's guidance I
have omitted Co-authored tags, as the end result is quite different.

This series is intended to be taken through rust-next. The final patch
in the series requires some other subsystems' `Acked-by`s:
- drivers/android/binder/stats.rs: rust_binder. Alice, could you take a
  look?
- rust/kernel/device.rs: driver-core. Already acked by gregkh.
- rust/kernel/firmware.rs: driver-core. Danilo, could you take a look?
- rust/kernel/seq_file.rs: vfs. Christian, could you take a look?
- rust/kernel/sync/*: locking-core. Boqun, could you take a look?

Link: https://lore.kernel.org/rust-for-linux/20240819153656.28807-2-vadorovsky@protonmail.com/t/#u [0]
Closes: https://github.com/Rust-for-Linux/linux/issues/1075

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Changes in v18:
- Rebase on rust-next and fix more backsliding. (thanks Alice!)
- Link to v17: https://lore.kernel.org/r/20251015-cstr-core-v17-0-dc5e7aec870d@gmail.com

Changes in v17:
- Rebase on rust-next and fix backsliding relative to series 2a and 2b.
- Link to v16: https://lore.kernel.org/r/20250925-cstr-core-v16-0-5cdcb3470ec2@gmail.com

Changes in v16:
- Rebase on rust-next.
- Link to v15: https://lore.kernel.org/r/20250813-cstr-core-v15-0-c732d9223f4e@gmail.com

Changes in v15:
- Seal `CStrExt`. (Benno Lossin)
- Add patch to remove trailing commas from
  samples/rust/rust_driver_platform.rs.
- Link to v14: https://lore.kernel.org/r/20250710-cstr-core-v14-0-ca7e0ca82c82@gmail.com

Changes in v14:
- Break the change into multiple series.
- Move `CStr` reexport to `kernel::ffi`. (Alice Ryhl)
- `pub use core::fmt::{....}` in `kernel/fmt.rs`. (Benno Lossin)
- Avoid unnecessary binding to `first_lit` in `fmt!`. (Benno Lossin)
- Add comment to `identifier`-extracting loop. (Benno Lossin)
- Change `quote_spanned!` formatting. (Benno Lossin)
- Link to v13: https://lore.kernel.org/r/20250701-cstr-core-v13-0-29f7d3eb97a6@gmail.com

Changes in v13:
- Rebase on v6.16-rc4.
- Link to v12: https://lore.kernel.org/r/20250619-cstr-core-v12-0-80c9c7b45900@gmail.com

Changes in v12:
- Introduce `kernel::fmt::Display` to allow implementations on foreign
  types.
- Tidy up doc comment on `str_to_cstr`. (Alice Ryhl).
- Link to v11: https://lore.kernel.org/r/20250530-cstr-core-v11-0-cd9c0cbcb902@gmail.com

Changes in v11:
- Use `quote_spanned!` to avoid `use<'a, T>` and generally reduce manual
  token construction.
- Add a commit to simplify `quote_spanned!`.
- Drop first commit in favor of
  https://lore.kernel.org/rust-for-linux/20240906164448.2268368-1-paddymills@proton.me/.
  (Miguel Ojeda)
- Correctly handle expressions such as `pr_info!("{a}", a = a = a)`.
  (Benno Lossin)
- Avoid dealing with `}}` escapes, which is not needed. (Benno Lossin)
- Revert some unnecessary changes. (Benno Lossin)
- Rename `c_str_avoid_literals!` to `str_to_cstr!`. (Benno Lossin &
  Alice Ryhl).
- Link to v10: https://lore.kernel.org/r/20250524-cstr-core-v10-0-6412a94d9d75@gmail.com

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
Tamir Duberstein (16):
      samples: rust: platform: remove trailing commas
      rust_binder: remove trailing comma
      rust_binder: use `kernel::fmt`
      rust_binder: use `core::ffi::CStr` method names
      rnull: use `kernel::fmt`
      rust: alloc: use `kernel::fmt`
      rust: debugfs: use `kernel::fmt`
      rust: pci: use `kernel::fmt`
      rust: remove spurious `use core::fmt::Debug`
      rust: opp: use `CStr::as_char_ptr`
      rust: opp: fix broken rustdoc link
      rust: configfs: use `CStr::as_char_ptr`
      rust: regulator: use `CStr::as_char_ptr`
      rust: clk: use `CStr::as_char_ptr`
      rust: support formatting of foreign types
      rust: replace `CStr` with `core::ffi::CStr`

 drivers/android/binder/error.rs          |   5 +-
 drivers/android/binder/process.rs        |   2 +-
 drivers/android/binder/stats.rs          |   6 +-
 drivers/block/rnull/configfs.rs          |   9 +-
 rust/ffi.rs                              |   2 +
 rust/kernel/alloc/kvec/errors.rs         |  14 +-
 rust/kernel/clk.rs                       |   4 +-
 rust/kernel/configfs.rs                  |   2 +-
 rust/kernel/debugfs.rs                   |   2 +-
 rust/kernel/debugfs/callback_adapters.rs |   7 +-
 rust/kernel/debugfs/entry.rs             |   2 +-
 rust/kernel/debugfs/file_ops.rs          |   6 +-
 rust/kernel/debugfs/traits.rs            |  10 +-
 rust/kernel/device.rs                    |   1 +
 rust/kernel/drm/ioctl.rs                 |   4 +-
 rust/kernel/error.rs                     |   2 +
 rust/kernel/firmware.rs                  |   9 +-
 rust/kernel/fmt.rs                       |  87 ++++++-
 rust/kernel/opp.rs                       |   8 +-
 rust/kernel/pci/id.rs                    |   3 +-
 rust/kernel/prelude.rs                   |   7 +-
 rust/kernel/ptr.rs                       |   1 -
 rust/kernel/regulator.rs                 |   9 +-
 rust/kernel/seq_file.rs                  |   2 +-
 rust/kernel/str.rs                       | 395 +++++++------------------------
 rust/kernel/sync/condvar.rs              |   2 +-
 rust/kernel/sync/lock.rs                 |   2 +-
 rust/kernel/sync/lock/global.rs          |   2 +-
 rust/macros/fmt.rs                       |  94 ++++++++
 rust/macros/lib.rs                       |  19 ++
 rust/macros/quote.rs                     |   7 +
 samples/rust/rust_driver_platform.rs     |   4 +-
 32 files changed, 367 insertions(+), 362 deletions(-)
---
base-commit: 6f3b6e91f7201e248d83232538db14d30100e9c7
change-id: 20250201-cstr-core-d4b9b69120cf

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

