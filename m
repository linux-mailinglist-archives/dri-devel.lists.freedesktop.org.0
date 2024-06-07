Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF8290030E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 14:11:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A850110EC1E;
	Fri,  7 Jun 2024 12:11:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NS+zfLRx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
 [209.85.161.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D5B10EC1E;
 Fri,  7 Jun 2024 12:11:51 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id
 006d021491bc7-5b3356fd4f3so237892eaf.1; 
 Fri, 07 Jun 2024 05:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717762310; x=1718367110; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to:from
 :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
 :reply-to; bh=9ejJYUTymxXCdJXCEblRqnmvXk+rUpZBBw17pH+ow8E=;
 b=NS+zfLRxugNvYkMdra3kvxBSLKj5JJba/zghMIJnw1WzgqME35d3vTT7Fr68kperPf
 YC8F+yoR1gXrvk+YMeK7EFu5yUak4dDLieEFN1Ck+ecWFHJV9gR1UBYg0Gkbq4qKBoTY
 VdwYTVdtUl/SfK5G6riYkQpYHkaUAitm+R2gxVNWo1gZUxQFAETV4T9rFuD8C8sRY8bn
 D94+0FKXQw9jrIxOC52TUeSerxJLvy5nv+9C8BaSWMxTvjMsqFHimx/7VYwD4M2ExK8x
 4g8rjepXQadoywpc/MChn6GnQlZQjEYvCpV7vMW/jEq0xizVFuVM+iAB9jISSjQ4TUr9
 jY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717762310; x=1718367110;
 h=content-transfer-encoding:mime-version:references:in-reply-to:from
 :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9ejJYUTymxXCdJXCEblRqnmvXk+rUpZBBw17pH+ow8E=;
 b=jEcUU3lPggL2uQBCrvQXmVx3q7hQfD1xIgEpMn+Z2xLmM0ICs3PJOabQFOdHaP8OwF
 b2M1yprDsLIbvNowEEmCS0JfSkp/WEjoXnNqVwyABI/y2cB3XFu2RCtGmVuMjqmzO5v2
 F6Vm3Pqb2RJRmgIV6PX1dE2amfZU1eyOMF2EKXBfr0ye+AzTBzOmhYpnnQuHryaQY0ix
 tmVeFX8SJjH5FIHS9T4EkJCp2MZts9Ew3jznH9aMfHIefxsIWT4swfPmn+aGNpBhtm7m
 YiObnRVR3nyf745vnl79UWiSm6X8xYAjo6L5prh226g13b5x8SKHZxm5qOVCi1sPI+T6
 PB4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNR899kCkgrsgQiLK3IxKqsPShH8GDqQgCVXTeF8X7XjgpxPdIQHAirYSri8WzhhURqnRkCBAbjAfzJtzskXfqNMHf0KWgqVR1/tcLF2e2fAUvBguuOFVbvz/xHw9+4PSzg4hCw3h1oBmP/bHxdA==
X-Gm-Message-State: AOJu0Yw0FiycYcQIf+lsueO5guJ4C2CmrPGMzePIRcpftui3aULL2ixn
 FFxQqP8/yqs8wm8fz4p41sQZ4vibjfD8CioiGUb5agWcTOhrlM0k
X-Google-Smtp-Source: AGHT+IG93K5LasDx76aB3h60qsup/I/V+qgt3wQKVPjU0LZk7V6uDStCyNutIbwM9d0MAoOglo2EJQ==
X-Received: by 2002:a05:6358:70e:b0:19f:19dd:901e with SMTP id
 e5c5f4694b2df-19f1fd06835mr256324155d.1.1717762310161; 
 Fri, 07 Jun 2024 05:11:50 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp.
 [180.15.241.226]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-6de2017fc69sm2165585a12.17.2024.06.07.05.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 05:11:49 -0700 (PDT)
Date: Fri, 07 Jun 2024 21:11:32 +0900 (JST)
Message-Id: <20240607.211132.1411950625632247437.fujita.tomonori@gmail.com>
To: dakr@redhat.com
Cc: fujita.tomonori@gmail.com, gregkh@linuxfoundation.org,
 wedsonaf@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, lina@asahilina.net, pstanner@redhat.com,
 ajanulgu@redhat.com, lyude@redhat.com, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 mcgrof@kernel.org, russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <Zlmfkws-QjNmFxfr@pollux>
References: <Zlgg_Q5y3Q99Ts1s@pollux>
 <20240531.165032.1895479176481879387.fujita.tomonori@gmail.com>
 <Zlmfkws-QjNmFxfr@pollux>
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

On Fri, 31 May 2024 11:59:47 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> Once we get to a conclusion I can send a series with only the device and firmare
> abstractions such that we can get them in outside of the scope of the reset of
> both series to get your driver going.

Since your discussion with Greg seems to continue for a while, let me
include the following patch that Greg approved with the next version
of the PHY driver patchset.

You have the new version of the firmware patch? The unused functions
will not be merged so only request_firmware() and release_firmware()
can be included. If not, I can include my firmware patch that I wrote
before.

=
From: Danilo Krummrich <dakr@redhat.com>
Date: Fri, 7 Jun 2024 20:14:59 +0900
Subject: [PATCH] add abstraction for struct device

Add abstraction for struct device. This implements only the minimum
necessary functions required for the abstractions of firmware API;
that is, wrapping C's pointer to a device object with Rust struct only
during a caller knows the pointer is valid (e.g., the probe callback).

Co-developed-by: Wedson Almeida Filho <wedsonaf@gmail.com>
Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
Co-developed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 rust/kernel/device.rs | 31 +++++++++++++++++++++++++++++++
 rust/kernel/lib.rs    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 rust/kernel/device.rs

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
new file mode 100644
index 000000000000..55ec4f364628
--- /dev/null
+++ b/rust/kernel/device.rs
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Generic devices that are part of the kernel's driver model.
+//!
+//! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
+
+use crate::types::Opaque;
+
+/// Wraps the kernel's `struct task_struct`.
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
+    pub(crate) fn as_raw(&self) -> *mut bindings::device {
+        self.0.get()
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index fbd91a48ff8b..dd1207f1a873 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -28,6 +28,7 @@
 
 pub mod alloc;
 mod build_assert;
+pub mod device;
 pub mod error;
 pub mod init;
 pub mod ioctl;
-- 
2.34.1

