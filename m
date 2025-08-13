Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68892B24E76
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF13710E769;
	Wed, 13 Aug 2025 15:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eGhABeQn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0B010E766;
 Wed, 13 Aug 2025 15:59:31 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-4b109c6532fso210621cf.3; 
 Wed, 13 Aug 2025 08:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755100771; x=1755705571; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6EC+1oIHbj40bMk7XrURGYK12FsziAijPlq/Nwpia8Q=;
 b=eGhABeQnHaq6ZCm0RpXM2G7p4tVo/5QKc+UAnPYYtvQzDnA3K0nmdS66Moc2ZR+pmM
 fjwAwdpOq51u8ErfvdeY/WRxSsdnhlju2anZvbuV9JcQbD88kigefdSYt/LFNMBamGRv
 IgOxGynNMwEUGNFQ6GUIOgn8OBaz7+LNVwiMuayzn7LjFMHQvl8HQG9ZjUW8rdZmOqZh
 CXyKCSAn5Zml0LDl7N5+upZ4li2AkPr5VC+myk6LluDC5Iex44n3ZB3Eh/FGZmkyfTlb
 U7RhshoL0g2VOP4PwkxVvOZXlg/r9tctJkn/yjrm/XM1uONk+WSr+JgxZQ82h83a8+19
 XBdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755100771; x=1755705571;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6EC+1oIHbj40bMk7XrURGYK12FsziAijPlq/Nwpia8Q=;
 b=FhYlffOsG+mU13tNsxWMcuoZm0zeajB3kTZmoaMfk9UxcUrxTTf3EgBO+Kp1zq66zC
 AXstE5ooUBCtmmyg8ETv26kuQLca/SxqFuuER8kGi191zHmC0By9EkVuXuFOkceoljO8
 Fuxe0YoLvFE3KqVtYjEQmLSfRTXXmUzF8fsTt2O2FIUm2dA448YxCBFMGwcBHXquAIlU
 gNzNdNRizTxY9wuh9fdKsQhHr8c0vxwDhkpHyO55E/dfraVf4QyHVPqhtU7YSFDzpb+6
 eV3NYKml9RWz8vD2UAlni5wLgoWVzbDTo30HZ4J7t/mvWP7iQMRP7osu85PTFdqu9G11
 O2vA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuUjhYxtBql/Lbbysf1DsNqCA2wHw3X9Py/ACzawVZRlQYE7CB+U2r2Pei+uOHkTCrElX0rZc6uw==@lists.freedesktop.org,
 AJvYcCUxmgsdSaeBoSSjRuSwsIAf1X/Im6fGO0E2PYL+ERbhePE99jEs6u6DPt15NLs/TczGgKxG0g17ImY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztXMjqD7bQ3Rys5+sGolPGp9CODE02Lgczypzl56urZ1FJaShn
 UFr1zHznE/AVn9JtxIqY27vp0GEfTaou446XvR4sSr7u2q6kuKfHkQer
X-Gm-Gg: ASbGncskf/fjGira+4rGvzxjiq7/C9yBBNrmBoP6Z1Toume7tm3M8GxdRIN/i/MWVlC
 a9CkuKL53FepZ1zMkZhgP0XXNutUaEtuHoEfxB5fayKSgNwxm8302PjPbaKcJaFeFVytowIzS/A
 ViX20pQRedK7Sksoz/ozlOGIxfXmItypT+lXkMsVXzRr2Hd5usPzzkIRX/5dJqeVXVoAO1zmG5y
 +CrsryahvAgVg/UEfk0EphmgKkb/RW7dmOqblWTejisSsMSTZosR0OJEuvdwp4tzRglsVmg96Gv
 WjeSONtdyzlsGdu62ffyK3vk8UOyAbOZqz07Lstun9FzF5V+mjEkN3c5wizxgphrPoKmYQOMzFJ
 QIiVru29X31Cxrea2ZBKGbhWFOHIfAmLKuYMF1Hi//dhwczig5ecJFQzTFfEcQKYLc2MiH6SFGJ
 rrtBlW+2fpfHYLg0Lp6fI3SewqLoy91KqcgteOFF8UX1PJ4m6pnw==
X-Google-Smtp-Source: AGHT+IGpgxrufvVbj/EAOSRbPajvrkbv1ubmtObGTneciR1xN69K//nK7cLM3mPNug8AvmxmRiJbtQ==
X-Received: by 2002:a05:622a:1887:b0:4ab:3a31:680d with SMTP id
 d75a77b69052e-4b0fc71e9f9mr41676621cf.16.1755100770752; 
 Wed, 13 Aug 2025 08:59:30 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b085ad7d08sm124482211cf.53.2025.08.13.08.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:59:30 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:59:12 -0400
Subject: [PATCH v2 02/19] gpu: nova-core: replace `kernel::c_str!` with
 C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-cstrings-v2-2-00be80fc541b@gmail.com>
References: <20250813-core-cstr-cstrings-v2-0-00be80fc541b@gmail.com>
In-Reply-To: <20250813-core-cstr-cstrings-v2-0-00be80fc541b@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1755100759; l=2863;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=/6Rqc6yq70/uVo2CCK0rVzt/j/mmv1WXhqKkANquG+c=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMxUD8q7sdXNIZJbqOsCnf0eKBOPnd2r+87E83qZIwccXLqO4VipK6rxEDA6qqdZDuVzG7p8Zpy
 1WZEYV9IVxAE=
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
index 274989ea1fb4..2f1a37be3107 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::{auxiliary, bindings, c_str, device::Core, pci, prelude::*, sizes::SZ_16M, sync::Arc};
+use kernel::{auxiliary, bindings, device::Core, pci, prelude::*, sizes::SZ_16M, sync::Arc};
 
 use crate::gpu::Gpu;
 
@@ -35,7 +35,7 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
         pdev.set_master();
 
         let bar = Arc::pin_init(
-            pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core/bar0")),
+            pdev.iomap_region_sized::<BAR0_SIZE>(0, c"nova-core/bar0"),
             GFP_KERNEL,
         )?;
 
@@ -44,7 +44,7 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
                 gpu <- Gpu::new(pdev, bar)?,
                 _reg: auxiliary::Registration::new(
                     pdev.as_ref(),
-                    c_str!("nova-drm"),
+                    c"nova-drm",
                     0, // TODO[XARR]: Once it lands, use XArray; for now we don't use the ID.
                     crate::MODULE_NAME
                 )?,

-- 
2.50.1

