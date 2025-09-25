Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7755AB9FB0F
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 15:55:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5A610E93D;
	Thu, 25 Sep 2025 13:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EnVJ4NFo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C8E10E94D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 13:55:00 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-76b8fd4ba2cso7852186d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 06:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758808499; x=1759413299; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XVSYVBz+/C/3yUXq0+Xlzki5tMQiQIQTN1ASo1OgvYI=;
 b=EnVJ4NFouyHZDNgP/ps+hRLj7i+uX1otf1sr3m48D8GBupsrXUBcheVeTvBgGKiIEE
 ejGZtN9Dg0e1Ual73eFlvgc81KxnmQ1pXHGno9zcgUnl5nMLW9mmuY5yhPEBjtm1rbfr
 xXepCj0TmxDgFuD7w+9nQX0LjCbFnxTSnY5OMLnreDBKAiMR9jvhqwbYSso8tec2INPu
 vc8AN5AsDOe60jA5Ns8jo/YUnLlxtUVP+jXvun/f9od6uDD8pP8elHK2m40eis+5O1dH
 0icwULpisjYDJ6y2uJpUFk/k/JXd5y2MGAxyi2rnIPmDv5IhWOeXkKo0G4odIO5fUuGn
 uVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758808499; x=1759413299;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XVSYVBz+/C/3yUXq0+Xlzki5tMQiQIQTN1ASo1OgvYI=;
 b=tubP+M0ppD/wPJTNexW6LhXeU26lbBoNfokmLA/vDYSmgtt/afuiS4u7PoohWthe6L
 LOY28PjtjUy3AZpXZKgySwvDDkiwoqOz8vXSrqs4u1z8itcXqVYTdBT71rU8c+arS3Yp
 BlzQiJWX+jJE54nTjpzSqyteoGIhWeBswySCYiaz5+xfxBHPNBQFsAPSsSZdfmaeFHYH
 e8UyafQOzJ8rtWBar7iPLHRfPtNQy6G18JROfE4NbNeAxh64sgt1VwW/YntHfljmdxFe
 6GHUIp1lRZpRtmf089ha6SeJuzY/N5YIWHNd3SavyBP2yqiAc61IHLgfLrIgFn7mEoL2
 RMSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrg3mYpj8i+h+Z//3D5yUNtXPjUTBZDywLo8Acb3IO+voc6Rhc5Ljce0YH1kOR3l4k27y9gtGAdvs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6RAZrXP8rriGgubYCnKs1HLXmVIJLC8hKZPDrSWXqG6zQJljh
 I4pyh9Hbhv50yQF/xFBkMPDOv5+PybOLAIbyLoi28068fjx9/SG9XDoT
X-Gm-Gg: ASbGncvh6Z7Tf0sqXHd9i0WnPKgK5oMJwQvFb9boZAzyy+6ON9IjvN5H9/Qtwll4MhP
 e5wAjBXuXRZC5wmaVDEVtUn36qO4nDIMYGp3RO7T2L3rPd0879aiMZV+penC7iM9po52TjaFIEn
 jq/inifmkTNKXB2SVKJiTaJBEpk+M2j5KxRSyRefsl3o2wgDauQ0Zy/atUAoZO9g7sBtO9VoJOq
 UbDLZtjzf99x7sjF2aaFcJe+OcqAscN0rK4la2IHr+p8TpFb++rsEv/LQHeDd53vQv8d3RUSTb1
 WNBd4sfVMTCeZwS3IBOBQ0XVBz+VGQIfcULUkJ+figMysS1iZDiC5YER74mPgddY0CbkXNd69Fz
 ETvj+IhcXryDGkC0Lan3/I/PkXnZk4nYjI8QO2bTi9sliO9I/5joWbi/HCYlCuAiDI9EN6zIO9P
 +onxwokVVTdOLhgDglB6GJuP2vojU5VEu7tx9nQM18wxIPTaT3WjRukv7/0y34o1xcR2Q4
X-Google-Smtp-Source: AGHT+IEssEmLNZcem/aKdLWetF1Fs16YPcmtFsn6hozzBuZs4Wn/CLmfl+Df8wHKJRPpg5SfyGzrZA==
X-Received: by 2002:ad4:5deb:0:b0:78e:c5c7:1209 with SMTP id
 6a1803df08f44-7fc3e015bc2mr57974806d6.56.1758808499295; 
 Thu, 25 Sep 2025 06:54:59 -0700 (PDT)
Received: from 137.1.168.192.in-addr.arpa
 ([2600:4808:6353:5c00:7c:b286:dba3:5ba8])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-80135968d5esm11536916d6.12.2025.09.25.06.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 06:54:58 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 25 Sep 2025 09:53:55 -0400
Subject: [PATCH v2 07/19] rust: device: replace `kernel::c_str!` with C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-core-cstr-cstrings-v2-7-78e0aaace1cd@gmail.com>
References: <20250925-core-cstr-cstrings-v2-0-78e0aaace1cd@gmail.com>
In-Reply-To: <20250925-core-cstr-cstrings-v2-0-78e0aaace1cd@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Jens Axboe <axboe@kernel.dk>, Alexandre Courbot <acourbot@nvidia.com>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1758808437; l=2297;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=tEhBaBJnhQFO++GmUh6w8m63Mr6JSvoXu3wOHmq14e0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFEkzUjb+lD/w38vqtw9O/htNaxJTX/sabnw4QloRojDdlHFE7uz1iz3IfwN44ls/ZjS7SJYOQu
 /SzXo2WM/nAo=
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

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/device.rs          | 4 +---
 rust/kernel/device/property.rs | 6 +++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index f3718da11871..242286162c8b 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -10,8 +10,6 @@
 };
 use core::{marker::PhantomData, ptr};
 
-#[cfg(CONFIG_PRINTK)]
-use crate::c_str;
 use crate::str::CStrExt as _;
 
 pub mod property;
@@ -378,7 +376,7 @@ unsafe fn printk(&self, klevel: &[u8], msg: fmt::Arguments<'_>) {
             bindings::_dev_printk(
                 klevel.as_ptr().cast::<crate::ffi::c_char>(),
                 self.as_raw(),
-                c_str!("%pA").as_char_ptr(),
+                c"%pA".as_char_ptr(),
                 core::ptr::from_ref(&msg).cast::<crate::ffi::c_void>(),
             )
         };
diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
index 3a332a8c53a9..3eb3f36d66d0 100644
--- a/rust/kernel/device/property.rs
+++ b/rust/kernel/device/property.rs
@@ -178,11 +178,11 @@ pub fn property_count_elem<T: PropertyInt>(&self, name: &CStr) -> Result<usize>
     /// # Examples
     ///
     /// ```
-    /// # use kernel::{c_str, device::{Device, property::FwNode}, str::CString};
+    /// # use kernel::{device::{Device, property::FwNode}, str::CString};
     /// fn examples(dev: &Device) -> Result {
     ///     let fwnode = dev.fwnode().ok_or(ENOENT)?;
-    ///     let b: u32 = fwnode.property_read(c_str!("some-number")).required_by(dev)?;
-    ///     if let Some(s) = fwnode.property_read::<CString>(c_str!("some-str")).optional() {
+    ///     let b: u32 = fwnode.property_read(c"some-number").required_by(dev)?;
+    ///     if let Some(s) = fwnode.property_read::<CString>(c"some-str").optional() {
     ///         // ...
     ///     }
     ///     Ok(())

-- 
2.51.0

