Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB652AB08A4
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 05:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FA610E261;
	Fri,  9 May 2025 03:16:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CLoOFlHl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24BC10E259;
 Fri,  9 May 2025 03:16:26 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-403407e998eso1249216b6e.0; 
 Thu, 08 May 2025 20:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746760586; x=1747365386; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=53t6htouqo+fEO0HbXs8RHhTtXKEPino5VAfoY4/NnE=;
 b=CLoOFlHlZ5oWAiJ+ezExkwR1A90Wy06y4KZY7/IKQWDsm3uF03+No2j/+mrAhp99HF
 n659Vollo+LwcFlhZ8wsYzLdjSLUIJa2xBsS3dnPQoXeJV+pdIp4GN963YnFDUD6yAZT
 eU17ggwx/iDef/LVD16+nTH3jWIVB06uki+Be11LJiSbru0GcYA3MxwyMZTGUXLyFwIu
 XVEhfYpJ9MvM0FDxRoyKOF/jkrzT2J4dJW06RTumkwSQ/3rxwFgWkS2QmowBJ94wv69G
 GEc5XuksYjtD1P3UfikbNUKEHTRehdyPdL0+0+heVotiImQtW+J+BkW9OIg+W4kftgmv
 BwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746760586; x=1747365386;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=53t6htouqo+fEO0HbXs8RHhTtXKEPino5VAfoY4/NnE=;
 b=dAMa47ll7iMWgI/pibiSZa3qBqNVDyilj2AWYTG9ScmGD9b8xg0WEcFIeTVg2FJNWD
 GPdSGrmvVuuIZX0QJf/iOw8M4+dsEHs20ynYxMOFkcbHBVH16HSAGgxYedHmAnudDjPf
 mHcIPurVzOLjbBxrFrgBN7xgqGMZNy5GpQly7Mi5tpCZ0N6GtfY5HQokCXrSOqGz6oPk
 ntdDJr+bRMvBjrrk92qvjWPZ1Ddf2kiusLAT30X5qZ8yuXhOzf2PeJnPY1UbV0s15p73
 99jS0B2M6Y67+nNqktlN9e+pYnfQwuu325msEVHGWsrXONe3IyPiT5rOJAL2H5hTTuQy
 Ljvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/di2kpc1382gSOPx1TsBIPpdpPLSKo3y9oNBFi4SzIVdJYWKCzFfcPGMr26C4lQdlZpJXcwpVxNk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/yZ5pvB75GatiCH+QeIB5pk9YytH9xYhfW52vJ8fLHxygtMPW
 1a2flkwjz8kVL3ncfVrkd0Jkpx5catyBtLo4jLv0tDcSJXDG14LG
X-Gm-Gg: ASbGncvwfgoLfi5Mw9dAxO34vczu8aSCitW7OpJIpqgYgpoJZSK9UAW9tqO/C5dr524
 Gwc/sbatrmi7Ic1lM094Srk5K4YtmVc2Q15Rij0DFrQJSaa3UieiJGzzUjS79joMhd7h8WlwzyF
 e435aKN+1QtvQzuNs1LGDcySu5FdRgNsVeoLGzpoXjr5ASpm41NEjVLC68LK7FiTP5wCe/qyIjI
 ELhhrDfZlANLCRIwSSA7ztf5zr5TYW+FzcBQyvpY86c9SoVdhBNpabvl3bHn96VIJzQu1Bf05um
 QkQJUwz44P6yLYhQtlzVHwp/NpZP9xROR27PEewPqeqvDwF283WE1nePpDr3uj+52+qzXuljRvI
 dBteSdycQ2alv
X-Google-Smtp-Source: AGHT+IEdBTSTK3vWlnHF6pnRx7cY0OuwERmRYjEJpQ38H7fbUDdpuDNT5RtsGo1/Cw1+llB50+pCyg==
X-Received: by 2002:a05:6808:1718:b0:3fa:3a0:137b with SMTP id
 5614622812f47-4037fe9e79fmr1334343b6e.29.1746760585903; 
 Thu, 08 May 2025 20:16:25 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net.
 [73.76.29.249]) by smtp.googlemail.com with ESMTPSA id
 006d021491bc7-60842b096desm303745eaf.30.2025.05.08.20.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 20:16:25 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 akpm@linux-foundation.org, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, gregkh@linuxfoundation.org, rafael@kernel.org,
 bhelgaas@google.com, kwilczynski@kernel.org, raag.jadav@intel.com,
 andriy.shevchenko@linux.intel.com, arnd@arndb.de, me@kloenk.dev,
 andrewjballance@gmail.com, fujita.tomonori@gmail.com,
 daniel.almeida@collabora.com
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: [PATCH 03/11] rust: io: implement Debug for IoRaw and add some
 doctests
Date: Thu,  8 May 2025 22:15:16 -0500
Message-ID: <20250509031524.2604087-4-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509031524.2604087-1-andrewjballance@gmail.com>
References: <20250509031524.2604087-1-andrewjballance@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Fiona Behrens <me@kloenk.dev>

Implement `Debug` for `kernel::io::IoRaw` which also outputs the const
generic SIZE as a field.

Add some doctests to `IoRaw::new` and `MMIo::from_raw(_ref)`.

Signed-off-by: Fiona Behrens <me@kloenk.dev>
Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 rust/kernel/io.rs | 62 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 19bbf802027c..09440dd3e73b 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -227,6 +227,33 @@ pub struct IoRaw<const SIZE: usize = 0> {
 
 impl<const SIZE: usize> IoRaw<SIZE> {
     /// Returns a new `IoRaw` instance on success, an error otherwise.
+    ///
+    /// # Examples
+    ///
+    /// Const generic size 0, only allowing runtime checks:
+    /// ```
+    /// use kernel::io::IoRaw;
+    ///
+    /// let raw: IoRaw<0> = IoRaw::new(0xDEADBEEFC0DE, 8).unwrap();
+    /// # assert_eq!(raw.addr(), 0xDEADBEEFC0DE);
+    /// # assert_eq!(raw.maxsize(), 8);
+    /// ```
+    ///
+    /// Const generic size equals maxsize:
+    /// ```
+    /// use kernel::io::IoRaw;
+    ///
+    /// let raw: IoRaw<8> = IoRaw::new(0xDEADBEEFC0DE, 8).unwrap();
+    /// # assert_eq!(raw.addr(), 0xDEADBEEFC0DE);
+    /// # assert_eq!(raw.maxsize(), 8);
+    /// ```
+    ///
+    /// Const generic size bigger then maxsize:
+    /// ```
+    /// use kernel::io::IoRaw;
+    ///
+    /// IoRaw::<16>::new(0xDEADBEEFC0DE, 8).unwrap_err();
+    /// ```
     pub fn new(addr: usize, maxsize: usize) -> Result<Self> {
         if maxsize < SIZE {
             return Err(EINVAL);
@@ -248,6 +275,16 @@ pub fn maxsize(&self) -> usize {
     }
 }
 
+impl<const SIZE: usize> core::fmt::Debug for IoRaw<SIZE> {
+    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+        f.debug_struct("IoRaw")
+            .field("SIZE", &SIZE)
+            .field("addr", &self.addr)
+            .field("maxsize", &self.maxsize)
+            .finish()
+    }
+}
+
 /// IO-mapped memory, starting at the base address [`addr`] and spanning [`maxsize`] bytes.
 ///
 /// The creator (usually a subsystem / bus such as PCI) is responsible for creating the
@@ -264,6 +301,7 @@ pub fn maxsize(&self) -> usize {
 /// [`maxsize`]: IoAccess::maxsize
 /// [`read`]: https://docs.kernel.org/driver-api/device-io.html#differences-between-i-o-access-functions
 /// [`write`]: https://docs.kernel.org/driver-api/device-io.html#differences-between-i-o-access-functions
+#[derive(Debug)]
 #[repr(transparent)]
 pub struct MMIo<const SIZE: usize = 0>(IoRaw<SIZE>);
 
@@ -274,6 +312,18 @@ impl<const SIZE: usize> MMIo<SIZE> {
     ///
     /// Callers must ensure that `addr` is the start of a valid I/O mapped memory region of
     /// size `maxsize`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::io::{IoRaw, MMIo, IoAccess};
+    ///
+    /// let raw = IoRaw::<2>::new(0xDEADBEEFC0DE, 2).unwrap();
+    /// // SAFETY: test, value is not actually written to.
+    /// let mmio: MMIo<2> = unsafe { MMIo::from_raw(raw) };
+    /// # assert_eq!(0xDEADBEEFC0DE, mmio.addr());
+    /// # assert_eq!(2, mmio.maxsize());
+    /// ```
     #[inline]
     pub unsafe fn from_raw(raw: IoRaw<SIZE>) -> Self {
         Self(raw)
@@ -286,6 +336,18 @@ pub unsafe fn from_raw(raw: IoRaw<SIZE>) -> Self {
     ///
     /// Callers must ensure that `addr` is the start of a valid I/O mapped memory region of
     /// size `maxsize`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::io::{IoRaw, MMIo, IoAccess};
+    ///
+    /// let raw = IoRaw::<2>::new(0xDEADBEEFC0DE, 2).unwrap();
+    /// // SAFETY: test, value is not actually written to.
+    /// let mmio: &MMIo<2> = unsafe { MMIo::from_raw_ref(&raw) };
+    /// # assert_eq!(raw.addr(), mmio.addr());
+    /// # assert_eq!(raw.maxsize(), mmio.maxsize());
+    /// ```
     #[inline]
     pub unsafe fn from_raw_ref(raw: &IoRaw<SIZE>) -> &Self {
         // SAFETY: `MMIo` is a transparent wrapper around `IoRaw`.
-- 
2.49.0

