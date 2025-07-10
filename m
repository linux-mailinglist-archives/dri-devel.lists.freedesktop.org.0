Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9749DB006B8
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BDAF10E902;
	Thu, 10 Jul 2025 15:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aiVDUkqU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2CD310E902;
 Thu, 10 Jul 2025 15:31:38 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-7d21cecc11fso202497185a.3; 
 Thu, 10 Jul 2025 08:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752161498; x=1752766298; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VRlT5YcC4Px+mPxn03mYZBsKKJl7yAFNq/vZwOxvJC8=;
 b=aiVDUkqUVfMoi5WzDKRXIEqY8PpIumS2EMfrjys6vLB5V+uQnkj9TF9aNWBst5v+7s
 0Z2whvZTfJGB+wq/PDFECsNksUwHUxupymyFXRLMUgP+u+ARbmDfPwosWSzalqoO0Y8O
 NkUsbujXv+lQsJNnjbrBOFItCcxQQHP0Mxz2p49vk1ifwsMygVDFEM0b8L/qFqbZLtmK
 SvXWkEDH5PYzY+6BjS2n1tuSMbCGLFpfZoJDzAo0f7LIZCEIwX389fEl12y/ZGewpsZo
 ITe40+k4AmHCw4Ewnht12WbDxA6J2wdw7L7ydx1KlIBcopheWOnMIpy5I2dH7kmto+g7
 CdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752161498; x=1752766298;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VRlT5YcC4Px+mPxn03mYZBsKKJl7yAFNq/vZwOxvJC8=;
 b=kskWe1vLZW01lwY+CsdfocTng7nh6iVDsrgfS+6YhEg5P3fyI62/qWwYjtbdQX/brP
 30n3LJGj1XxHA4Iwp9ZA7Lwu7zQvqxrEFMN190gKUZsITF4U5s1m+mIEsh1/B9mcz7j6
 5BX7CRO6f0YInVTmQN+YMLa6I1msTouGcKh+OGL0FwpdQHVQ8f46p+i+rdt1NH/wd9PV
 VG0O9ibpteFtgjdHIB7np+35wKiU0KSMqDZSyHOCwWLJW0Zezkky8lbF9YNCYlnERQBr
 k6iFTlV782HxCucuBe/mwOJlG9WaRv1gIP2gQLLitIDvFx2Y0ldT31ynQyyFHyhFg1IW
 eudQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAZADY/JasRBFimW7WDQ1pJh5/ofyEb0qHYoEZ8auFX/uISW204Y8odihMO3tDiYKZ2pEfrZ8VOR4=@lists.freedesktop.org,
 AJvYcCWZ0HAXYcfIHgL+1SNsgftvoh3bL1E93mkJaJrxdywW8EnucyqVgMla3L27+TkRX08+7UDXbCCs0Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxS5n2BuzELiATgw1AvW9m9xhJOLJrmMnIJ8PlrEQNZCjdwhq2y
 EgV2qJIFUAOZauWEb1JuW2jskz+WrI77/qXI9nkoCoGotnhuZLh55vm1
X-Gm-Gg: ASbGncsHd51E1kLDd+bKyvy/8BjYyUyhtaq96jds2JuO4z3tTuE6FoBsPV1WkFYG24U
 4ljKMrw72F7ph2O8mX6JJ2uuklnbyOXyEJRcHJDaQPfJ2nKuDqLcQZvS1TUNQOLRDd5bHYFSzXR
 Td1c4ErPYM966qDVu7SzIQqtImR+mVQ1EGEBDQCqDP3exflg6lD7xBLZmVMt6K46kSAhLBltywW
 A9FHqv/4f6FB++bq3MaTlfDBYny8aF7zys17PEYsCMYE4LzYP+iQhrZCewMJjh21e4BIiLPrj/q
 s1fPjUu470C4KytGN2aGyBowsVgxMb1KRBEQM8j8fAqQ1+50lXPuc+YVoZxynyL17VrUahqh7sl
 i+CDGlKpEQimL+F1wPitqyerE7SANpuHmrMYPx1UaXblQM/a26KrAAm8fvA==
X-Google-Smtp-Source: AGHT+IEbHnc/thQlN/cyxkVseSvn6XEvlMVnH9dmo92154uWAjWA+CuUka5sntlNHeO5E59hD3lXgA==
X-Received: by 2002:ad4:576a:0:b0:6e8:f470:2b11 with SMTP id
 6a1803df08f44-70494f829cemr82415736d6.23.1752161497573; 
 Thu, 10 Jul 2025 08:31:37 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-704979dbc3asm9449496d6.38.2025.07.10.08.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 08:31:36 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 10 Jul 2025 11:31:05 -0400
Subject: [PATCH 02/17] gpu: nova-core: replace `kernel::c_str!` with C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-core-cstr-cstrings-v1-2-027420ea799e@gmail.com>
References: <20250710-core-cstr-cstrings-v1-0-027420ea799e@gmail.com>
In-Reply-To: <20250710-core-cstr-cstrings-v1-0-027420ea799e@gmail.com>
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
 Jens Axboe <axboe@kernel.dk>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-block@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1752161489; l=2662;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=jWoII9lc0uOqozr99B/x/dDSCK5rJfT2DvtrFXqOZyg=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMZas2KzwEMZU/sgiAbM9CbclvQutwrXcG0/5lwfR+8HPYuE3tYEpf9CUwqyhzKlL5//kLxflaj
 9SaeU9bFc9AI=
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
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/gpu/drm/nova/driver.rs  | 10 +++++-----
 drivers/gpu/nova-core/driver.rs |  6 +++---
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
index b28b2e05cc15..87480ee8dbae 100644
--- a/drivers/gpu/drm/nova/driver.rs
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::{auxiliary, c_str, device::Core, drm, drm::gem, drm::ioctl, prelude::*, types::ARef};
+use kernel::{auxiliary, device::Core, drm, drm::gem, drm::ioctl, prelude::*, types::ARef};
 
 use crate::file::File;
 use crate::gem::NovaObject;
@@ -22,12 +22,12 @@ pub(crate) struct NovaData {
     major: 0,
     minor: 0,
     patchlevel: 0,
-    name: c_str!("nova"),
-    desc: c_str!("Nvidia Graphics"),
+    name: c"nova",
+    desc: c"Nvidia Graphics",
 };
 
-const NOVA_CORE_MODULE_NAME: &CStr = c_str!("NovaCore");
-const AUXILIARY_NAME: &CStr = c_str!("nova-drm");
+const NOVA_CORE_MODULE_NAME: &CStr = c"NovaCore";
+const AUXILIARY_NAME: &CStr = c"nova-drm";
 
 kernel::auxiliary_device_table!(
     AUX_TABLE,
diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index a0e435dc4656..16cd7e36662c 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::{auxiliary, bindings, c_str, device::Core, pci, prelude::*};
+use kernel::{auxiliary, bindings, device::Core, pci, prelude::*};
 
 use crate::gpu::Gpu;
 
@@ -34,14 +34,14 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
         pdev.enable_device_mem()?;
         pdev.set_master();
 
-        let bar = pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core/bar0"))?;
+        let bar = pdev.iomap_region_sized::<BAR0_SIZE>(0, c"nova-core/bar0")?;
 
         let this = KBox::pin_init(
             try_pin_init!(Self {
                 gpu <- Gpu::new(pdev, bar)?,
                 _reg: auxiliary::Registration::new(
                     pdev.as_ref(),
-                    c_str!("nova-drm"),
+                    c"nova-drm",
                     0, // TODO: Once it lands, use XArray; for now we don't use the ID.
                     crate::MODULE_NAME
                 )?,

-- 
2.50.0

