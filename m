Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E2BB0155E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 10:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD1010E9C6;
	Fri, 11 Jul 2025 08:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="0z16xEiB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com
 [209.85.221.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43D810E9C3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 08:04:45 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-3af3c860ed7so886879f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 01:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1752221084; x=1752825884;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=YeddRl2ZjPZG1iB3VuE6BCvJf0DWRoDr9MXVmboPWFw=;
 b=0z16xEiBGkj1/3hocVg1aBsjp6qwr1tk4u62Y8diQftAlV9C/5uzBqVtgrIw+oKk46
 QnmoxHrl7XlQEkXuMl8lhdZTacTBkNDnmTUJc8OHfOBAAzDyhJnDM3N9eia9Dp2K1SHc
 Nk4FQZkujZsgOThQt8gOIf1eq2vYTZH/+k165Xq0ZxjB23zRP24Ov1Yd+N9Lcc09AiEV
 3bUa10Ppgv87oruMGhDg1AXHzk4BO7mXkTVV1UjPyOXntsKV17KOegXSSN66jP/O26TL
 1mKYEdqnX4MCGKpCDMdMxoOnbLhCzYqku983lGpVIujcTe4ZkAuLmm/gZM+R6Dv65Idr
 PpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752221084; x=1752825884;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YeddRl2ZjPZG1iB3VuE6BCvJf0DWRoDr9MXVmboPWFw=;
 b=NL02hUxju9yWSMwVlUyJ/iV4IZw3Z5N58R9XTXyoWXTQ8uD5UT2rbotgcTMeZor5yH
 7lP3/QdT49Tbvy3faKw9C4eZ9c5rOKMg9eb4fkLIt3iDQPnD5XioIfJxZS9brNQBA5+o
 H2dpJmfG0Xk05HmrecwnUhaq3+6qSCb42llWfusoxN5QM1kP8tk8ydOKT46sKFc9gcH/
 SteXZx3JXNr9T4AUf4uCejWx1mGtFFCHu4hD8GdQxZRHYnXgnz0DJFQ8N/9uPoTLHQtU
 Zog/S8Du7Oow/Ic+50u5zUfe5juuez3xNkvw5oqoYlpiucsdLTY9RImstOLkEyyRBDaX
 wygQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWgGjrA7oJrMhlayViDrGG0HptSQE12t7sLMGyPPyLR8StbnbtzXlwZgC7/UcBb1uc6KI2h5YsgFY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlorBgHg1KU/LKTZXgloAec+mXtIsGMulVrGJWo5A8kJsSfCnc
 7XHelor7sx/vdAb+cZeW2cVVRul4Kg0Wa59uJvZDrza7YbCJCfrc3n+MLgbn2NQadKm6tCUgkf7
 TMeVTW8sF6rdDcU4dcQ==
X-Google-Smtp-Source: AGHT+IG/XgF1fLGGyXshyCet6B/sQYLy7ohXFOqAGO6mIla8fi/6od2tPDsSefKFOrRxYDhDW/XtZherTVAYt0s=
X-Received: from wrqh8.prod.google.com ([2002:a5d:4308:0:b0:3a6:dd7d:9cb8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4b11:b0:3a5:3b63:58f0 with SMTP id
 ffacd0b85a97d-3b5f2dc2cd1mr1247364f8f.18.1752221084546; 
 Fri, 11 Jul 2025 01:04:44 -0700 (PDT)
Date: Fri, 11 Jul 2025 08:04:37 +0000
In-Reply-To: <20250711-device-as-ref-v2-0-1b16ab6402d7@google.com>
Mime-Version: 1.0
References: <20250711-device-as-ref-v2-0-1b16ab6402d7@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=7303; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=/sM7c3ZlcrID5iVlFoygw6rsnxEGvSLgt7TAXbZimTI=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBocMWaRIEy+we9THrmpSxj2hWR8Lw49HZvEH02W
 /KlLzxaMt6JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaHDFmgAKCRAEWL7uWMY5
 RqUnD/97xg55WZUfcoF6IkTgRF74u19GiaS/m4ptRtTjwEWsPlsSfXdZwVCl11AsH7Vka1TOWXF
 9BIPig1/8MgviPmubeCSl0nsPSgCxtUoBLIJkJ6Nfz+1QazS6AqLULUPo0Dn+PBVZDfcU3wV4ge
 KR6uL3IxSa8moOXWU8i9z/IxeOpoHJOGXdcjPMT5FWGi8ZTJlVXj+h1D0Eaw5oAWWUZpylC8D5B
 Jnhscr0fdP6X7C4xgh/AmF7fWuhDJW1Q+TFPbrFUYi4vrLgR+AgKWYSDjZaMaN96N5ThDm6gnwr
 BU2EqI/CQHH5im0bChZWfcUTXoXaMFRQcEe51+GsRMFCwbau//ACU9HcGqKK/YxtRwM0Jd+IOHt
 npTx4ygolfDsNTGzcGRIEXU4O3ivlMIMisHc2joZ1X3MviFvCmKIvXQSFvHY8FzuRm86FX2Vtqr
 v91Vt5dBRpOQkLICTTMAxi0oeV11gWDWNhEKaD5+xoRjCZ7D6Mn0+HF2/CBqizEdgc6XxIBmUkh
 EaD5mhdr1vQv+lx7Rvj8WBfl6QnHAtPJpBWnG3wNhkB3FK3nQA+hHbLTfXV6UcxhGJaQgo0GANm
 lRJv1U81I9iu4wlqNBVBR7II1sjtVyQk1lg28BpLAspAGr+MjxkEbCgopXxbXhvc6PaG2aJW0a+
 hqsp0UieNeVAvPw==
X-Mailer: b4 0.14.2
Message-ID: <20250711-device-as-ref-v2-1-1b16ab6402d7@google.com>
Subject: [PATCH v2 1/2] device: rust: rename Device::as_ref() to
 Device::from_raw()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>, 
 Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 "=?utf-8?q?Krzysztof_Wilczy=C5=84ski?=" <kwilczynski@kernel.org>,
 rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 netdev@vger.kernel.org, linux-pci@vger.kernel.org, 
 Alice Ryhl <aliceryhl@google.com>
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

The prefix as_* should not be used for a constructor. Constructors
usually use the prefix from_* instead.

Some prior art in the stdlib: Box::from_raw, CString::from_raw,
Rc::from_raw, Arc::from_raw, Waker::from_raw, File::from_raw_fd.

There is also prior art in the kernel crate: cpufreq::Policy::from_raw,
fs::File::from_raw_file, Kuid::from_raw, ARef::from_raw,
SeqFile::from_raw, VmaNew::from_raw, Io::from_raw.

Link: https://lore.kernel.org/r/aCd8D5IA0RXZvtcv@pollux
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/auxiliary.rs  | 2 +-
 rust/kernel/cpu.rs        | 2 +-
 rust/kernel/device.rs     | 6 +++---
 rust/kernel/drm/device.rs | 2 +-
 rust/kernel/faux.rs       | 2 +-
 rust/kernel/miscdevice.rs | 2 +-
 rust/kernel/net/phy.rs    | 2 +-
 rust/kernel/pci.rs        | 2 +-
 rust/kernel/platform.rs   | 2 +-
 9 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index d2cfe1eeefb6054a97fefd6e499772c3fc4c443e..a4ac00990a441f6f92ec6e6bdbd7699d2777da00 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -276,7 +276,7 @@ fn as_ref(&self) -> &device::Device<Ctx> {
         let dev = unsafe { addr_of_mut!((*self.as_raw()).dev) };
 
         // SAFETY: `dev` points to a valid `struct device`.
-        unsafe { device::Device::as_ref(dev) }
+        unsafe { device::Device::from_raw(dev) }
     }
 }
 
diff --git a/rust/kernel/cpu.rs b/rust/kernel/cpu.rs
index b75403b0eb5614e5652e6cad9341ae217edbe5bb..5de730c8d81722873ba2349a1c9c4d6c17701134 100644
--- a/rust/kernel/cpu.rs
+++ b/rust/kernel/cpu.rs
@@ -147,5 +147,5 @@ pub unsafe fn from_cpu(cpu: CpuId) -> Result<&'static Device> {
 
     // SAFETY: The pointer returned by `get_cpu_device()`, if not `NULL`, is a valid pointer to
     // a `struct device` and is never freed by the C code.
-    Ok(unsafe { Device::as_ref(ptr) })
+    Ok(unsafe { Device::from_raw(ptr) })
 }
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index dea06b79ecb536cee4d2b90c21b74658658417c7..f70d768351204d7f49c6bebbf27ee26f4d11cdfa 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -57,7 +57,7 @@ impl Device {
     /// While not officially documented, this should be the case for any `struct device`.
     pub unsafe fn get_device(ptr: *mut bindings::device) -> ARef<Self> {
         // SAFETY: By the safety requirements ptr is valid
-        unsafe { Self::as_ref(ptr) }.into()
+        unsafe { Self::from_raw(ptr) }.into()
     }
 }
 
@@ -82,7 +82,7 @@ pub(crate) fn parent(&self) -> Option<&Self> {
             // - Since `parent` is not NULL, it must be a valid pointer to a `struct device`.
             // - `parent` is valid for the lifetime of `self`, since a `struct device` holds a
             //   reference count of its parent.
-            Some(unsafe { Self::as_ref(parent) })
+            Some(unsafe { Self::from_raw(parent) })
         }
     }
 
@@ -94,7 +94,7 @@ pub(crate) fn parent(&self) -> Option<&Self> {
     /// i.e. it must be ensured that the reference count of the C `struct device` `ptr` points to
     /// can't drop to zero, for the duration of this function call and the entire duration when the
     /// returned reference exists.
-    pub unsafe fn as_ref<'a>(ptr: *mut bindings::device) -> &'a Self {
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::device) -> &'a Self {
         // SAFETY: Guaranteed by the safety requirements of the function.
         unsafe { &*ptr.cast() }
     }
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 624d7a4c83ead64b93325189f481d9b37c3c6eae..11ce1e7f2d52ae4ddfbd4e47dfb17e390653bc45 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -190,7 +190,7 @@ impl<T: drm::Driver> AsRef<device::Device> for Device<T> {
     fn as_ref(&self) -> &device::Device {
         // SAFETY: `bindings::drm_device::dev` is valid as long as the DRM device itself is valid,
         // which is guaranteed by the type invariant.
-        unsafe { device::Device::as_ref((*self.as_raw()).dev) }
+        unsafe { device::Device::from_raw((*self.as_raw()).dev) }
     }
 }
 
diff --git a/rust/kernel/faux.rs b/rust/kernel/faux.rs
index 8a50fcd4c9bbba1f894a09080446ca3173571b03..7a906099993f1bf8c8caf6ab64f920faf81cafb4 100644
--- a/rust/kernel/faux.rs
+++ b/rust/kernel/faux.rs
@@ -54,7 +54,7 @@ impl AsRef<device::Device> for Registration {
     fn as_ref(&self) -> &device::Device {
         // SAFETY: The underlying `device` in `faux_device` is guaranteed by the C API to be
         // a valid initialized `device`.
-        unsafe { device::Device::as_ref(addr_of_mut!((*self.as_raw()).dev)) }
+        unsafe { device::Device::from_raw(addr_of_mut!((*self.as_raw()).dev)) }
     }
 }
 
diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index 939278bc7b03489a647b697012e09223871c90cd..a6dc11935ee3fe495640e06509d86f89bd201ca1 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -92,7 +92,7 @@ pub fn device(&self) -> &Device {
         // function tells the borrow-checker that the `&Device` reference must not outlive the
         // `&MiscDeviceRegistration<T>` used to obtain it, so the last use of the reference must be
         // before the underlying `struct miscdevice` is destroyed.
-        unsafe { Device::as_ref((*self.as_raw()).this_device) }
+        unsafe { Device::from_raw((*self.as_raw()).this_device) }
     }
 }
 
diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 32ea43ece6465a7e09c9d2332ca83c4bc27b7104..bd43a726f7d398278dae2546fca702fa70c68cf0 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -285,7 +285,7 @@ impl AsRef<kernel::device::Device> for Device {
     fn as_ref(&self) -> &kernel::device::Device {
         let phydev = self.0.get();
         // SAFETY: The struct invariant ensures that `mdio.dev` is valid.
-        unsafe { kernel::device::Device::as_ref(addr_of_mut!((*phydev).mdio.dev)) }
+        unsafe { kernel::device::Device::from_raw(addr_of_mut!((*phydev).mdio.dev)) }
     }
 }
 
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 8435f8132e38129ccc3495e7c4d3237fcaa97ad9..d620902219d78191d744df6a8970c0a99dbd47da 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -454,7 +454,7 @@ fn as_ref(&self) -> &device::Device<Ctx> {
         let dev = unsafe { addr_of_mut!((*self.as_raw()).dev) };
 
         // SAFETY: `dev` points to a valid `struct device`.
-        unsafe { device::Device::as_ref(dev) }
+        unsafe { device::Device::from_raw(dev) }
     }
 }
 
diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 5b21fa517e55348582622ec10471918919502959..76e09429cdc275354b3ce84da5e74f7b97660430 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -215,7 +215,7 @@ fn as_ref(&self) -> &device::Device<Ctx> {
         let dev = unsafe { addr_of_mut!((*self.as_raw()).dev) };
 
         // SAFETY: `dev` points to a valid `struct device`.
-        unsafe { device::Device::as_ref(dev) }
+        unsafe { device::Device::from_raw(dev) }
     }
 }
 

-- 
2.50.0.727.gbf7dc18ff4-goog

