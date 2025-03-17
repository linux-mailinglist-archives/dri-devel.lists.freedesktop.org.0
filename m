Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAB0A65595
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 16:30:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCACA10E0E0;
	Mon, 17 Mar 2025 15:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O2WqQ59s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFEC10E163
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 15:30:17 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-4766631a6a4so46376491cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 08:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742225417; x=1742830217; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GhDi7jicB3Gv5oqI3TBvIGb8fiLoyX3gf2bLY34vPcA=;
 b=O2WqQ59s0OoEV+FpOAES8BsvOaKejwh0isM0caqOHLCplahLNzXPtadBknHr8wZ7JF
 +CbCeGz6y9wupWvy+NNYvnu6HVFEMWNBfkW+6dxio9EkwTjAf5hnkzpazZ74xWt9UlvW
 gPlnDa87qKoOiACRllDqkxb3NbuHTrH9Ga62DHWCmyN2C+R5bYT03/yGg6LbATr4Ghz3
 k80yKYrPLW/iuzN0GO/uY+ucC4V1Y/m00jqfhmR7KL2vzaSzLE98CxzhJMv+wSb6Ljsp
 Nt1KpLYMpW7EzvEij4PFuBsaXFDrZG97UZ7ecLu5oEK6OOU1goYoi4AJYREATp9v3WXU
 L6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742225417; x=1742830217;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GhDi7jicB3Gv5oqI3TBvIGb8fiLoyX3gf2bLY34vPcA=;
 b=hhi38I9MuYAW7+E6yZ1yMrj3TSsm+vnYXZGRNnPrSxtMZYC6Nd8TmYZ8cumvt7WKeU
 lOFFM+PWlz4/C54oK855ci1sTcECKWSHsqX2M9MRzvzuf1dBLy+tk3afVk/2qc8axd6k
 PeLBUxDcE3vvvtuabD1zsImwFePRgQqdtFCGuZFLGsS4aBAGFRqec87ze6gsCWVtVHr4
 Hvil4K/EqlKPG+OoG4447Yj4mA4lOsBiuON2a9qQClxUBgWJNafwFLDW4vhE5PXnoDdM
 funwTtraFxDmT4hD3EQ5jkFLDtDQUiOoe9xUP7IBibAqyR8tvJIvFkic9lHc9ccFT6fa
 FsHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtccOFJRzIhebV2KRhSQye5SZZR3lDVC1HW1L+8kLqN0Iac+z7cxBQVMU+UM5cvsQeUZtSiRnBHW4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXqD74I//r7t0rzzcOlKARqgUVk6I0JHp89CqrUYqzxlCvfRcc
 zNP0E4f6VAx9gxj8+AbkLFWYPvP0mNSQqwg3l2gzOsqyobHwLfzW
X-Gm-Gg: ASbGncvkgXU7NTTxnUUTmHDy79pvnkMCeqig6YdXPadsuj0I5IK1hz935JgfblVRk5v
 90TvUU2/hYgcUsh0o7MKsMMR0VI+xTr4yJe87XVL1Wf8RDTI6mVgymJEBgDvyo1xVqIOHL3DsKR
 92hmjY+aoMvMjX1YkYBd9TIguvAu8dU8SRAZX8Cu4YLHdKwfZsyEW6pNyn+LLV5yCifocJOhpP5
 PK8puetIOTT/wOSerBY8EDhjHax1p5HQ8wktxgdbkA2iBEh3vRjj23N1q0Cy8qqgSQKD3Y4wlIu
 uN/iCw7CxFGM6ZniqkB+TV84aP+gCcdoRs5/13vB7l9gnVjRJu4vbtccFesP4Fa5Bn51FhlBSGZ
 1NQt+Vg==
X-Google-Smtp-Source: AGHT+IF6QKQ27zO/djSgLkh3SLlbu4CCHZ6bVaY3V5bdQy4+E/A82ztgFL3TtEYWb5+dRwVxvOIv5Q==
X-Received: by 2002:a05:6214:c47:b0:6e6:5f08:e77d with SMTP id
 6a1803df08f44-6eaeaa64726mr197312436d6.19.1742225416788; 
 Mon, 17 Mar 2025 08:30:16 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa
 ([2600:4041:5be7:7c00:6895:24c6:e898:e320])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6eade34c51fsm55736766d6.109.2025.03.17.08.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 08:30:16 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 17 Mar 2025 11:30:03 -0400
Subject: [PATCH v9 1/4] rust: move `CStr`'s `Display` to helper struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250317-cstr-core-v9-1-51d6cc522f62@gmail.com>
References: <20250317-cstr-core-v9-0-51d6cc522f62@gmail.com>
In-Reply-To: <20250317-cstr-core-v9-0-51d6cc522f62@gmail.com>
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

Remove `impl Display for CStr` in preparation for replacing `CStr` with
`core::ffi::CStr` which doesn't impl `Display`. Add `CStr::display`
returning a helper struct to replace the lost functionality; this
matches the APIs exposed by `std::ffi::OSstr` and `std::path::Path` for
printing non-Unicode data.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/kunit.rs |  9 +++++---
 rust/kernel/str.rs   | 63 ++++++++++++++++++++++++++++++++++++++++++----------
 2 files changed, 57 insertions(+), 15 deletions(-)

diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 824da0e9738a..630b947c708c 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -56,6 +56,7 @@ macro_rules! kunit_assert {
                 break 'out;
             }
 
+            static NAME: &'static $crate::str::CStr = $crate::c_str!($name);
             static FILE: &'static $crate::str::CStr = $crate::c_str!($file);
             static LINE: i32 = core::line!() as i32 - $diff;
             static CONDITION: &'static $crate::str::CStr = $crate::c_str!(stringify!($condition));
@@ -71,11 +72,13 @@ macro_rules! kunit_assert {
                 //
                 // This mimics KUnit's failed assertion format.
                 $crate::kunit::err(format_args!(
-                    "    # {}: ASSERTION FAILED at {FILE}:{LINE}\n",
-                    $name
+                    "    # {NAME}: ASSERTION FAILED at {FILE}:{LINE}\n",
+                    NAME = NAME.display(),
+                    FILE = FILE.display(),
                 ));
                 $crate::kunit::err(format_args!(
-                    "    Expected {CONDITION} to be true, but is false\n"
+                    "    Expected {CONDITION} to be true, but is false\n",
+                    CONDITION = CONDITION.display(),
                 ));
                 $crate::kunit::err(format_args!(
                     "    Failure not reported to KUnit since this is a non-KUnit task\n"
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 28e2201604d6..50eb4266047a 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -376,27 +376,66 @@ pub fn to_ascii_uppercase(&self) -> Result<CString, AllocError> {
 
         Ok(s)
     }
-}
 
-impl fmt::Display for CStr {
-    /// Formats printable ASCII characters, escaping the rest.
+    /// Returns an object that implements [`Display`] for safely printing a [`CStr`] that may
+    /// contain non-Unicode data. If you would like an implementation which escapes the [`CStr`]
+    /// please use [`Debug`] instead.
+    ///
+    /// [`Display`]: fmt::Display
+    /// [`Debug`]: fmt::Debug
+    ///
+    /// # Examples
     ///
     /// ```
     /// # use kernel::c_str;
     /// # use kernel::fmt;
-    /// # use kernel::str::CStr;
     /// # use kernel::str::CString;
     /// let penguin = c_str!("🐧");
-    /// let s = CString::try_from_fmt(fmt!("{}", penguin))?;
+    /// let s = CString::try_from_fmt(fmt!("{}", penguin.display()))?;
     /// assert_eq!(s.as_bytes_with_nul(), "\\xf0\\x9f\\x90\\xa7\0".as_bytes());
     ///
     /// let ascii = c_str!("so \"cool\"");
-    /// let s = CString::try_from_fmt(fmt!("{}", ascii))?;
+    /// let s = CString::try_from_fmt(fmt!("{}", ascii.display()))?;
     /// assert_eq!(s.as_bytes_with_nul(), "so \"cool\"\0".as_bytes());
     /// # Ok::<(), kernel::error::Error>(())
     /// ```
+    #[inline]
+    pub fn display(&self) -> Display<'_> {
+        Display { inner: self }
+    }
+}
+
+/// Helper struct for safely printing a [`CStr`] with [`fmt!`] and `{}`.
+///
+/// A [`CStr`] might contain non-Unicode data. This `struct` implements the [`Display`] trait in a
+/// way that mitigates that. It is created by the [`display`](CStr::display) method on [`CStr`].
+///
+/// If you would like an implementation which escapes the string please use [`Debug`] instead.
+///
+/// # Examples
+///
+/// ```
+/// # use kernel::{fmt, c_str, str::CString};
+/// let ascii = c_str!("Hello, CStr!");
+/// let s = CString::try_from_fmt(fmt!("{}", ascii.display()))?;
+/// assert_eq!(s.as_bytes(), "Hello, CStr!".as_bytes());
+///
+/// let non_ascii = c_str!("🦀");
+/// let s = CString::try_from_fmt(fmt!("{}", non_ascii.display()))?;
+/// assert_eq!(s.as_bytes(), "\\xf0\\x9f\\xa6\\x80".as_bytes());
+/// # Ok::<(), kernel::error::Error>(())
+/// ```
+///
+/// [`fmt!`]: crate::fmt
+/// [`Debug`]: fmt::Debug
+/// [`Display`]: fmt::Display
+pub struct Display<'a> {
+    inner: &'a CStr,
+}
+
+impl fmt::Display for Display<'_> {
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
-        for &c in self.as_bytes() {
+        for &c in self.inner.as_bytes() {
             if (0x20..0x7f).contains(&c) {
                 // Printable character.
                 f.write_char(c as char)?;
@@ -595,13 +634,13 @@ fn test_cstr_as_str_unchecked() {
     #[test]
     fn test_cstr_display() {
         let hello_world = CStr::from_bytes_with_nul(b"hello, world!\0").unwrap();
-        assert_eq!(format!("{}", hello_world), "hello, world!");
+        assert_eq!(format!("{}", hello_world.display()), "hello, world!");
         let non_printables = CStr::from_bytes_with_nul(b"\x01\x09\x0a\0").unwrap();
-        assert_eq!(format!("{}", non_printables), "\\x01\\x09\\x0a");
+        assert_eq!(format!("{}", non_printables.display()), "\\x01\\x09\\x0a");
         let non_ascii = CStr::from_bytes_with_nul(b"d\xe9j\xe0 vu\0").unwrap();
-        assert_eq!(format!("{}", non_ascii), "d\\xe9j\\xe0 vu");
+        assert_eq!(format!("{}", non_ascii.display()), "d\\xe9j\\xe0 vu");
         let good_bytes = CStr::from_bytes_with_nul(b"\xf0\x9f\xa6\x80\0").unwrap();
-        assert_eq!(format!("{}", good_bytes), "\\xf0\\x9f\\xa6\\x80");
+        assert_eq!(format!("{}", good_bytes.display()), "\\xf0\\x9f\\xa6\\x80");
     }
 
     #[test]
@@ -612,7 +651,7 @@ fn test_cstr_display_all_bytes() {
             bytes[i as usize] = i.wrapping_add(1);
         }
         let cstr = CStr::from_bytes_with_nul(&bytes).unwrap();
-        assert_eq!(format!("{}", cstr), ALL_ASCII_CHARS);
+        assert_eq!(format!("{}", cstr.display()), ALL_ASCII_CHARS);
     }
 
     #[test]

-- 
2.48.1

