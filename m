Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEDA8D296D
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 02:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1652010E11B;
	Wed, 29 May 2024 00:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aZnXbmof";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B8E10ED65;
 Wed, 29 May 2024 00:28:39 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2bf5bb3508fso254958a91.1; 
 Tue, 28 May 2024 17:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716942518; x=1717547318; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to:from
 :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
 :reply-to; bh=4eMuIJmm0synmzUpAEjB2/Qw25q266fbvF5PpgPMIUM=;
 b=aZnXbmof+hrRcQqUQNzAqjYic5IXtj45z4FgiZQ009/2DkLDFvOgQR2j8HuWdnkARK
 OjPx9ws7vxL+H32aaXxK6Jc4DEkfM4jvig1cj+RLz1noU4xMtjzZViPs38cEzpeNCaAx
 qsR/W+3TYvdAeiuUTA7S7dfoyF0pw3Tyaxum9sEJIDPZ6WbI7+sYaBILcI4GXv3y31yb
 JUkNO+arL5KTqeeqPBlyawfW4rI2epQhdnMo7SdlqqAsAk50eXop0eiu4b5XYgFaFKAB
 lAWbLnuPFnLrFJy8txOAX8A1xR17hZ6IPYV15xN5mLBnTMy38MjtBJjgMvGEJvpgYrCE
 hGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716942518; x=1717547318;
 h=content-transfer-encoding:mime-version:references:in-reply-to:from
 :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4eMuIJmm0synmzUpAEjB2/Qw25q266fbvF5PpgPMIUM=;
 b=ZHpEsJnTxVYfZoLTr7BZ7wX59pDcnU5j5xdAcfRzZxFtacZjdkZn1MReqmdBWivdBg
 R/57ncdWg5tKxYHKfgKnOiYTgTclWtf2Nc5WlvECUoG3vg29SAh3LlkcRBTl68kDXmM/
 juVQkSijO0cxuFu0i8lasLD9CfMJa0133e5v/mPjRAFpxLWVh6nLfnvhA4WUPfVRIO6J
 zChj61pN2vSf9HoMyKsU2XH+iSDVy4EQ6IIe9FOqSulviQRRgZWWm7p4foUJ2EzAzDyj
 BL3f39/3pYfiiJEEF8+BHwJ8NKcwcjboXtYLw3THumEwGDJaImZwWccbF4H/MDSOR+Zk
 js1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYVurTztggYHIEiUpIIFi9VCE4YFeQ8CZf+DKtYGyRcWPJxvJX2n1dVqAHgFCoHisY51ahNdxMnzWJdyo71pZDYk4o8/5W7r2pHG+y91XB2nTF0kO0j0s3nNOfOKDWnnFe/lTx1lXP90uLSHpkLQ==
X-Gm-Message-State: AOJu0YwoPlpUjBNJfJ5MGN4sfcHNkCLB1NduuzlsZ6He2BqV/7i9y3Yr
 pLNavR+1VtulRaj4Thf5mhTjIpe6nB7+dHu1mrAf+gcVXVkzDlVz
X-Google-Smtp-Source: AGHT+IGc9ZzqXE5VI7kAmJ+mY5TMUDEyuSRao39hpUlFK4aO54sLIH9Yegqm8gK1UZH+FfXdl/BHbQ==
X-Received: by 2002:a17:903:2347:b0:1f4:4618:8948 with SMTP id
 d9443c01a7336-1f4486eacc4mr161493165ad.2.1716942518346; 
 Tue, 28 May 2024 17:28:38 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp.
 [180.15.241.226]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c9c2a65sm86550575ad.272.2024.05.28.17.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 17:28:38 -0700 (PDT)
Date: Wed, 29 May 2024 09:28:21 +0900 (JST)
Message-Id: <20240529.092821.1593412345609718860.fujita.tomonori@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dakr@redhat.com, fujita.tomonori@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, lina@asahilina.net,
 pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, mcgrof@kernel.org, russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <2024052816-makeshift-irrigate-cef5@gregkh>
References: <20240528.200126.99248529380429957.fujita.tomonori@gmail.com>
 <ZlXLzCYiwdMxic3X@pollux>
 <2024052816-makeshift-irrigate-cef5@gregkh>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Hi,

On Tue, 28 May 2024 14:45:02 +0200
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Tue, May 28, 2024 at 02:19:24PM +0200, Danilo Krummrich wrote:
>> However, if you have a driver that needs the firmware abstractions, I would be
>> surprised if there were any hesitations to already merge the minimum device
>> abstractions [1] and this one (once reviewed) without the rest. At least there
>> aren't any from my side.
>> 
>> [1] https://lore.kernel.org/rust-for-linux/20240520172554.182094-2-dakr@redhat.com/
> 
> No, the device abstractions are NOT ready for merging just yet, sorry,
> if for no other reason than a non-RFC has never been posted :)

Indeed, I understand that you aren't convinced.

We can start with much simpler device abstractions than the above
minimum for the firmware abstractions.

All the firmware abstractions need is wrapping C's pointer to a device
object with Rust struct only during a caller knows the pointer is
valid. No play with the reference count of a struct device.

For a Rust PHY driver, you know that you have a valid pointer to C's
device object of C's PHY device during the probe callback. The driver
creates a Rust device object to wrap the C pointer to the C's device
object and passes it to the firmware abstractions. The firmware
abstractions gets the C's pointer from the Rust object and calls C's
function to load firmware, returns the result.

You have concerns about the simple code like the following?


diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
new file mode 100644
index 000000000000..6144437984a9
--- /dev/null
+++ b/rust/kernel/device.rs
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Generic devices that are part of the kernel's driver model.
+//!
+//! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
+
+use crate::types::Opaque;
+
+#[repr(transparent)]
+pub struct Device(Opaque<bindings::device>);
+
+impl Device {
+    /// Creates a new [`Device`] instance from a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// For the duration of 'a, the pointer must point at a valid `device`.
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::device) -> &'a Self {
+        // CAST: `Self` is a `repr(transparent)` wrapper around `bindings::device`.
+        let ptr = ptr.cast::<Self>();
+        // SAFETY: by the function requirements the pointer is valid and we have unique access for
+        // the duration of `'a`.
+        unsafe { &mut *ptr }
+    }
+
+    /// Returns the raw pointer to the device.
+    pub fn as_raw(&self) -> *mut bindings::device {
+        self.0.get()
+    }
+}
