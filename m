Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C973BED610
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 19:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C1010E128;
	Sat, 18 Oct 2025 17:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DHLOGjNN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180E610E128
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 17:45:58 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-78e4056623fso38904946d6.2
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 10:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760809557; x=1761414357; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=a15d5fAvykxuJ32X4GoFun7W4EexMfG4QkmOfbTlvaA=;
 b=DHLOGjNNJ4fSTvsexrU09AMWB1mMfISP405uRYfHOR4NgD+/1eiDQrgHkCpnL8jjFW
 pa2QVMWQ1KOwu/gVBGX8QE6tBWI8y75LBFF8mfKoQldBKo5bUKh9RvMWjAZXD2spvhhx
 TwgArOWngGLH8TxmzT/t5G/bgnALCPKQwcGduTEonHSXcgj0jRE4BXq6CK6Dpx6rCSH+
 G4G7SHO+QlwyCoi59is5AzTdGhY3fw9orn0qVajO0XvvnhDek1Ly565xP/Exef/ZNBXj
 b2iMeE4FoHdpV6hR0pW/Rork/FE7X4mGhqPdg1wsi6pvqbbGD8nX5B3GJ1fPViKWdFlb
 nt5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760809557; x=1761414357;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a15d5fAvykxuJ32X4GoFun7W4EexMfG4QkmOfbTlvaA=;
 b=bux9wMJsxpoP2mMw1VbAFP+BTRjp+XUezVRZvoXTnpCt+teBBaUiB5VVbc/X0crcnJ
 sTeStU9wk+YO/AGeq6CyEYyaUGiuWvlmgXkixqQVpNTBOZHTq6S3J6nRj1qb7H7424NE
 M2h6UN4/5fmz694b1A9jsjP/I6y+TAq9M1ngqggRR/vTrBt5YN7V1+XoQyYOttMaj7B3
 LDZirUp5ial8Ke22nXLUQMLmMqxwD/dGSXYsfpEggsAHFdbbw344sQQaYOpZZOkIbv7p
 Og6K5v1joMExjc9CI4sbJID0n9sv27KQEvzOg9IexbvSrathi0lL4VCHXwclqn0l5MTo
 4S9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX45n3LyqlVwKyytkhSQZJ7pBWQfiuIq1+LbRT/QOYPPjEa42eb+c0pOi7sPymoR+i5QYp+8ZAxGAI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMMXaPmM7zeMnz/btXAPR9VZZFjoRRwsjq3Yc8VI3aF9UC0lr5
 fe3Hs17Jq/c/AErOb7OroY67m/IOyfKRHE2ts38hOkooRSwbvB+F3jwZ
X-Gm-Gg: ASbGncuuH5De6G0hAx0KmIEZIpmzO28M9foke6unYCjVs5kLrBe0CExM2h3XnOyvqk6
 EMAKVm1plB5SvEGajTq9prOtQcwixVBQs5+yGDTsm+d4zyBfDQrXAc9Mw6uahEQrssTGG0ML2xx
 FGuzFae3JUSLV1Y3E9P2BbUCxbd/RGB/sWfPtkFztd21PD5vVR6pDpR0Q48aBBsLWf/vDlEpLcw
 D91Bt5K+TImPnQDAjyeABUnu8jqMfFjtA8cZm7hBU0L1mfeoJDHp/EXDMVKGATcKmbqpb1LEFe4
 vuLjI5QRakljiXwQ6XXfpMNlrSL9P1u7ZFBm9swHi3qWObbuTyTPNk02LiTFr4iNRBKv+Qtj5PW
 s0uc0Vno79hm/JWifw8nt0G4Y0dlya1BkBr7I4724COoocWedpS8w1nZ5HvzbsKhGXxzN8ZzG2Z
 UATwkJSZVi9PJ1Iqeuo3jATm8pfvdJ9Kc4FtaKOlEUGZ1D/TRivNtOippStsSUOxkeDfPXGvPus
 n2FMpx1DDE1oc5Hmip9IUrF2zg+xsW1dklc21zByNl/jtieLczusydKFqqayhlTHTLrGuo54Q==
X-Google-Smtp-Source: AGHT+IF0jDSr4+x2H9ezxo4E3+k6pmF019NwUbAdiwnAzhTA8DToLrkpZSznJQWz124+QD1Dm24uLg==
X-Received: by 2002:a05:622a:1102:b0:4e8:b17d:916b with SMTP id
 d75a77b69052e-4e8b17d949fmr28810291cf.51.1760809556972; 
 Sat, 18 Oct 2025 10:45:56 -0700 (PDT)
Received: from 117.1.168.192.in-addr.arpa
 ([2600:4808:6353:5c00:1948:1052:f1e9:e23a])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4e8ab114132sm20445161cf.40.2025.10.18.10.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Oct 2025 10:45:55 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 18 Oct 2025 13:45:18 -0400
Subject: [PATCH v18 07/16] rust: debugfs: use `kernel::fmt`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-cstr-core-v18-7-ef3d02760804@gmail.com>
References: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1760809527; l=4664;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=2RO1O8x8vlwhifkhfd816jOQiIu5L43+GQ3qhkZvCCc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMATZCii+4KTdwmO4cL/e3cZ7fEhaFxHdhr1qxcBeKLRmamGNwC2RJ/lvy+nkubg5+s2N1SC1jy
 AY70o32pQ0gI=
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

Reduce coupling to implementation details of the formatting machinery by
avoiding direct use for `core`'s formatting traits and macros.

This backslid in commit 40ecc49466c8 ("rust: debugfs: Add support for
callback-based files") and commit 5e40b591cb46 ("rust: debugfs: Add
support for read-only files").

Acked-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Matthew Maurer <mmaurer@google.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/debugfs.rs                   |  2 +-
 rust/kernel/debugfs/callback_adapters.rs |  7 +++----
 rust/kernel/debugfs/file_ops.rs          |  6 +++---
 rust/kernel/debugfs/traits.rs            | 10 +++++-----
 4 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index 381c23b3dd83..8c35d032acfe 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -8,12 +8,12 @@
 // When DebugFS is disabled, many parameters are dead. Linting for this isn't helpful.
 #![cfg_attr(not(CONFIG_DEBUG_FS), allow(unused_variables))]
 
+use crate::fmt;
 use crate::prelude::*;
 use crate::str::CStr;
 #[cfg(CONFIG_DEBUG_FS)]
 use crate::sync::Arc;
 use crate::uaccess::UserSliceReader;
-use core::fmt;
 use core::marker::PhantomData;
 use core::marker::PhantomPinned;
 #[cfg(CONFIG_DEBUG_FS)]
diff --git a/rust/kernel/debugfs/callback_adapters.rs b/rust/kernel/debugfs/callback_adapters.rs
index 6c024230f676..a260d8dee051 100644
--- a/rust/kernel/debugfs/callback_adapters.rs
+++ b/rust/kernel/debugfs/callback_adapters.rs
@@ -5,10 +5,9 @@
 //! than a trait implementation. If provided, it will override the trait implementation.
 
 use super::{Reader, Writer};
+use crate::fmt;
 use crate::prelude::*;
 use crate::uaccess::UserSliceReader;
-use core::fmt;
-use core::fmt::Formatter;
 use core::marker::PhantomData;
 use core::ops::Deref;
 
@@ -76,9 +75,9 @@ fn deref(&self) -> &D {
 
 impl<D, F> Writer for FormatAdapter<D, F>
 where
-    F: Fn(&D, &mut Formatter<'_>) -> fmt::Result + 'static,
+    F: Fn(&D, &mut fmt::Formatter<'_>) -> fmt::Result + 'static,
 {
-    fn write(&self, fmt: &mut Formatter<'_>) -> fmt::Result {
+    fn write(&self, fmt: &mut fmt::Formatter<'_>) -> fmt::Result {
         // SAFETY: FormatAdapter<_, F> can only be constructed if F is inhabited
         let f: &F = unsafe { materialize_zst() };
         f(&self.inner, fmt)
diff --git a/rust/kernel/debugfs/file_ops.rs b/rust/kernel/debugfs/file_ops.rs
index 50fead17b6f3..9ad5e3fa6f69 100644
--- a/rust/kernel/debugfs/file_ops.rs
+++ b/rust/kernel/debugfs/file_ops.rs
@@ -3,11 +3,11 @@
 
 use super::{Reader, Writer};
 use crate::debugfs::callback_adapters::Adapter;
+use crate::fmt;
 use crate::prelude::*;
 use crate::seq_file::SeqFile;
 use crate::seq_print;
 use crate::uaccess::UserSlice;
-use core::fmt::{Display, Formatter, Result};
 use core::marker::PhantomData;
 
 #[cfg(CONFIG_DEBUG_FS)]
@@ -65,8 +65,8 @@ fn deref(&self) -> &Self::Target {
 
 struct WriterAdapter<T>(T);
 
-impl<'a, T: Writer> Display for WriterAdapter<&'a T> {
-    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+impl<'a, T: Writer> fmt::Display for WriterAdapter<&'a T> {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         self.0.write(f)
     }
 }
diff --git a/rust/kernel/debugfs/traits.rs b/rust/kernel/debugfs/traits.rs
index ab009eb254b3..ad33bfbc7669 100644
--- a/rust/kernel/debugfs/traits.rs
+++ b/rust/kernel/debugfs/traits.rs
@@ -3,10 +3,10 @@
 
 //! Traits for rendering or updating values exported to DebugFS.
 
+use crate::fmt;
 use crate::prelude::*;
 use crate::sync::Mutex;
 use crate::uaccess::UserSliceReader;
-use core::fmt::{self, Debug, Formatter};
 use core::str::FromStr;
 use core::sync::atomic::{
     AtomicI16, AtomicI32, AtomicI64, AtomicI8, AtomicIsize, AtomicU16, AtomicU32, AtomicU64,
@@ -24,17 +24,17 @@
 /// explicitly instead.
 pub trait Writer {
     /// Formats the value using the given formatter.
-    fn write(&self, f: &mut Formatter<'_>) -> fmt::Result;
+    fn write(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result;
 }
 
 impl<T: Writer> Writer for Mutex<T> {
-    fn write(&self, f: &mut Formatter<'_>) -> fmt::Result {
+    fn write(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         self.lock().write(f)
     }
 }
 
-impl<T: Debug> Writer for T {
-    fn write(&self, f: &mut Formatter<'_>) -> fmt::Result {
+impl<T: fmt::Debug> Writer for T {
+    fn write(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         writeln!(f, "{self:?}")
     }
 }

-- 
2.51.1

