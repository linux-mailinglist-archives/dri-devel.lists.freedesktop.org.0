Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A6EB24E74
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B153410E07F;
	Wed, 13 Aug 2025 15:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="keMCZzqu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64BA10E07F;
 Wed, 13 Aug 2025 15:59:25 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-4b1098d1bbaso679261cf.1; 
 Wed, 13 Aug 2025 08:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755100765; x=1755705565; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b0whtI+aJ/lwfdA6IBx7EqaGS5GlUE+K1GZ8kbYrGWY=;
 b=keMCZzqunM2TkBcQVSeeeYryHO8VmFVEC+nL1Au7+NFKlHYPjU5DvHHz7iN2wDGLDv
 67y2CyHz7pBEOst/eRuSCpYiMjqUXzn1LVHGKiS2kml4e6+HNBEqhvjJqqVPYyYzNWio
 qerq6lgmv+8+Jb8HIdDUW6Zw7He0NQkotMyFScrz7llLkNnzBl+sWMmY7d2BQ5YLNt/6
 oZYXYWx6W9ggNTfuiBtvLzDDQCDP8w/Hgfh8wu4DRRaEMVeYY+MrmETuern1iglv8y5q
 JD3JaT725FcQTPsixF5ugbmuVd7Y6+IgMN3NczmvTs66zqKGdWLCHKpMmu9EuzqDNvXz
 AqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755100765; x=1755705565;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b0whtI+aJ/lwfdA6IBx7EqaGS5GlUE+K1GZ8kbYrGWY=;
 b=RAi4MVCdVAkPYKy4LGGulOdd26dDucyjpj3HivEieIxbk07PYWBrY94EdHRdI6muDN
 6125a9ID9EkjXy8n/jCVtSEfa65HHqfaOmxFl0fS7TE9wO1zKJTpDXVGeWkLbTKQdYIl
 HVPTE6Ie6fBisS+nbZbCW/93K6NHgZdRDBih3YkZa8FO6IPKCo9TbI+0TESHUqAL8JlM
 3QSuj+KDcH6YiXj5JgN/B370SYsrunv4ROqyQGFXtS2r3lfpMuriqD0l3NAJweKLxHdP
 +KLbn65XVNPTjhLuawwrO93oMBO46ZULqNdjqUDRoIejezWO1K89A7j7F/G1RHEkE2Nc
 NknA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU82jkxf7xrYOmGO8V6rjv7oyhhdXw+2vViwoJ29xWYFAdrZhMDZTGTB9AU0MyOgD6w+5B9XUZoww==@lists.freedesktop.org,
 AJvYcCWO8MFwKddtOn0KKXn693Hyma0steQwRRIaZOIlfdUQF5Cm+9S6CHUgVmQTk+n/m3AbHuszc442TiM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxte5SKlZot51VL6cmJLpnL9hU1AXR9ZCK3In2BxE0DyLYylHs+
 TUeCtzCxYyEBnhVVK0Z0qp7VxJt4IuEO3OIVEvSJFvK2TCs3H8ImjVXlM6Bm/vZWIfc=
X-Gm-Gg: ASbGncuej5v5Sv1woTYUEmodAYCgDZI9Pw26Pe9ieadTpRDRt1BEc+0zlF0jSdcrVPn
 +YcCpv95SJNVQQmT+7+yFY0H4Uv2Iw+TwTCwuuj3uXa1uccfoQkf1hI5S5pE3tXcppOnUu3S+9a
 6IikGlkMU7pSsX/6+KprbaUQdk0PKrwdWvkw4mZ5Yvn0ETZVLC38TfawDtvL4h0hpIzIbL8XFEv
 pdUBm34vfoKjrutYRemBqn5TqD/QQdIv4wyVZuEqKuihNjKiHsBOrXi/mVNUCnODah7clDkMSj1
 hhXHUd2FSO/+dJ9kVk7ns5WTNtq2i0geUcB6iRrDaoZqV1e8ECy8z3dvFMwVGs6sn/PmxReZHW1
 M9HsOR3+eLLwvj2e24xU6q0zDfrth1u1RO+JVb6U/1g4luC7q0kj2MmrleC2UoEhOQzwYMua6/6
 rY4+DWMcx8TkDdnueHeRbIHe/PcuE9FZonDS8Nrb8=
X-Google-Smtp-Source: AGHT+IH5bKPMcxOfEgPLnp/iCra4Z0v+g72GVh8C9pgOCOpkMw6QX69XzjlmvW75JgEFDH3PQhtWRQ==
X-Received: by 2002:ac8:7d55:0:b0:4ab:67de:c791 with SMTP id
 d75a77b69052e-4b109b10015mr1017511cf.24.1755100764687; 
 Wed, 13 Aug 2025 08:59:24 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b085ad7d08sm124482211cf.53.2025.08.13.08.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:59:23 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v2 00/19] rust: replace `kernel::c_str!` with C-Strings
Date: Wed, 13 Aug 2025 11:59:10 -0400
Message-Id: <20250813-core-cstr-cstrings-v2-0-00be80fc541b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE+2nGgC/5WQzWrEIBRGXyW4ruVeo/lb9T3KLG70mhGapNVMa
 Bny7jWZoUw3hW6ET/B4OFeROAZOoiuuIvIaUpinPNRTIeyZpoFlcHkLBcpAjSDtHFnatMTjCNO
 QJHoiqkrlwTuRH75H9uHzgL6ebjvyxyWzl9ul6CllyDyOYemKxhviElzVutrokpnB1QBN6chrx
 41nNM40ZkePnBIdUtlxV2qwfFDyNM2XRaJcSwnSaGNR91Zr71+GkcLbc/7z3xhCw5bAtNbgb8x
 PoTtFAd7T7Cin+7avWlRgfbeiEXuLc0jLHL+O3iseMf5Ku2IWAFVrBUx12/KDwGnbtm/CeV1jw
 AEAAA==
X-Change-ID: 20250710-core-cstr-cstrings-1faaa632f0fd
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1755100759; l=7346;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=aHDCE8lQvGzrfp/JMmQg+1FkzUJWoG4yR/VNY61gI24=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGTTtsiwktq2/jtDQWZ3OsBeIX7b+1AYy/DJLjfLo7rG242TN6+wE3vHC3Ph8gTa/g64MF8rY1d
 RTwisWWbFUQc=
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

This series depends on step 3[0] which depends on steps 2a[1] and 2b[2]
which both depend on step 1[3].

This series also has a minor merge conflict with a small change[4] that
was taken through driver-core-testing. This series is marked as
depending on that change; as such it contains the post-conflict patch.

Subsystem maintainers: I would appreciate your `Acked-by`s so that this
can be taken through Miguel's tree (where the previous series must go).

Link  https://lore.kernel.org/all/20250710-cstr-core-v14-0-ca7e0ca82c82@gmail.com/ [0]
Link: https://lore.kernel.org/all/20250709-core-cstr-fanout-1-v1-0-64308e7203fc@gmail.com/ [1]
Link: https://lore.kernel.org/all/20250709-core-cstr-fanout-1-v1-0-fd793b3e58a2@gmail.com/ [2]
Link: https://lore.kernel.org/all/20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com/ [3]
Link: https://lore.kernel.org/all/20250704-cstr-include-aux-v1-1-e1a404ae92ac@gmail.com/ [4]

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Changes in v2:
- Rebase.
- Add two patches to address new code.
- Drop incorrectly applied Acked-by tags from Danilo.
- Link to v1: https://lore.kernel.org/r/20250710-core-cstr-cstrings-v1-0-027420ea799e@gmail.com

---
Tamir Duberstein (19):
      drivers: net: replace `kernel::c_str!` with C-Strings
      gpu: nova-core: replace `kernel::c_str!` with C-Strings
      rust: auxiliary: replace `kernel::c_str!` with C-Strings
      rust: clk: replace `kernel::c_str!` with C-Strings
      rust: configfs: replace `kernel::c_str!` with C-Strings
      rust: cpufreq: replace `kernel::c_str!` with C-Strings
      rust: device: replace `kernel::c_str!` with C-Strings
      rust: firmware: replace `kernel::c_str!` with C-Strings
      rust: kunit: replace `kernel::c_str!` with C-Strings
      rust: macros: replace `kernel::c_str!` with C-Strings
      rust: miscdevice: replace `kernel::c_str!` with C-Strings
      rust: net: replace `kernel::c_str!` with C-Strings
      rust: pci: replace `kernel::c_str!` with C-Strings
      rust: platform: replace `kernel::c_str!` with C-Strings
      rust: seq_file: replace `kernel::c_str!` with C-Strings
      rust: str: replace `kernel::c_str!` with C-Strings
      rust: sync: replace `kernel::c_str!` with C-Strings
      rust: io: replace `kernel::c_str!` with C-Strings
      rust: regulator: replace `kernel::c_str!` with C-Strings

 drivers/block/rnull.rs                |  2 +-
 drivers/cpufreq/rcpufreq_dt.rs        |  5 ++---
 drivers/gpu/drm/nova/driver.rs        | 10 +++++-----
 drivers/gpu/nova-core/driver.rs       |  6 +++---
 drivers/net/phy/ax88796b_rust.rs      |  7 +++----
 drivers/net/phy/qt2025.rs             |  5 ++---
 rust/kernel/clk.rs                    |  6 ++----
 rust/kernel/configfs.rs               |  9 +++++----
 rust/kernel/cpufreq.rs                |  3 +--
 rust/kernel/device.rs                 |  4 +---
 rust/kernel/device/property.rs        |  6 +++---
 rust/kernel/firmware.rs               |  6 +++---
 rust/kernel/io/mem.rs                 |  7 +++----
 rust/kernel/kunit.rs                  | 11 ++++-------
 rust/kernel/net/phy.rs                |  6 ++----
 rust/kernel/platform.rs               |  6 +++---
 rust/kernel/regulator.rs              |  9 +++------
 rust/kernel/seq_file.rs               |  4 ++--
 rust/kernel/str.rs                    |  5 ++---
 rust/kernel/sync.rs                   |  5 ++---
 rust/kernel/sync/completion.rs        |  2 +-
 rust/kernel/workqueue.rs              |  8 ++++----
 rust/macros/kunit.rs                  | 10 +++++-----
 rust/macros/module.rs                 |  2 +-
 samples/rust/rust_configfs.rs         |  5 ++---
 samples/rust/rust_driver_auxiliary.rs |  4 ++--
 samples/rust/rust_driver_faux.rs      |  4 ++--
 samples/rust/rust_driver_pci.rs       |  4 ++--
 samples/rust/rust_driver_platform.rs  | 30 ++++++++++++++----------------
 samples/rust/rust_misc_device.rs      |  3 +--
 scripts/rustdoc_test_gen.rs           |  4 ++--
 31 files changed, 88 insertions(+), 110 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250710-core-cstr-cstrings-1faaa632f0fd
prerequisite-message-id: 20250813-core-cstr-fanout-1-v3-0-545c14bc44ff@gmail.com
prerequisite-patch-id: 0ccc3545ff9bf22a67b79a944705cef2fb9c2bbf
prerequisite-patch-id: b1866166714606d5c11a4d7506abe4c2f86dac8d
prerequisite-patch-id: b575ae9ef33020b691c8c5a17bd1985676519e14
prerequisite-patch-id: 8fee5e2daf0749362331dad4fc63d907a01b14e9
prerequisite-patch-id: 366ef1f93fb40b1d039768f2041ff79995e7e228
prerequisite-patch-id: 1d350291f9292f910081856d8f7d5e4d9545cfd1
prerequisite-patch-id: 9a6a60bd2b209126de64c16a77a3a1d229dd898c
prerequisite-patch-id: 08ae5855768ec3b4c68272b86d2a0e0667c9aa47
prerequisite-patch-id: 801be981c2346617fa9412498930b68dc784693b
prerequisite-patch-id: f0dbf0a55a27fe8e199e242d1f79ea800d1ddb66
prerequisite-patch-id: c0b4abb4d44f7e63d002d0bfe5239296930c183e
prerequisite-message-id: 20250813-core-cstr-fanout-1-v3-0-a15eca059c51@gmail.com
prerequisite-patch-id: 6711f2a2f25c12784057aa725a9482feef6bb6f0
prerequisite-patch-id: 3b5144133c0e239e0a258c9aa4da0df2dd464e66
prerequisite-patch-id: 589a352ba7f7c9aefefd84dfd3b6b20e290b0d14
prerequisite-patch-id: 2a4b0b9170e25637b9eba0e516863bdcdb4149a8
prerequisite-patch-id: 3d89601bba1fb01d190b0ba415b28ad9cbf1e209
prerequisite-patch-id: 10923aebf24011b727f60496c0f9e0ad57e0a967
prerequisite-patch-id: 9a7e8ba460358985147efd347658be31fbc78ba2
prerequisite-patch-id: f79b8755f3d75effc581d09eafe5725043516aad
prerequisite-patch-id: d598958c2d64dcb56a5cd64b088594be51b1d752
prerequisite-change-id: 20250201-cstr-core-d4b9b69120cf:v15
prerequisite-patch-id: 6711f2a2f25c12784057aa725a9482feef6bb6f0
prerequisite-patch-id: 3b5144133c0e239e0a258c9aa4da0df2dd464e66
prerequisite-patch-id: 0ccc3545ff9bf22a67b79a944705cef2fb9c2bbf
prerequisite-patch-id: b1866166714606d5c11a4d7506abe4c2f86dac8d
prerequisite-patch-id: 589a352ba7f7c9aefefd84dfd3b6b20e290b0d14
prerequisite-patch-id: 2a4b0b9170e25637b9eba0e516863bdcdb4149a8
prerequisite-patch-id: 3d89601bba1fb01d190b0ba415b28ad9cbf1e209
prerequisite-patch-id: 10923aebf24011b727f60496c0f9e0ad57e0a967
prerequisite-patch-id: 9a7e8ba460358985147efd347658be31fbc78ba2
prerequisite-patch-id: f79b8755f3d75effc581d09eafe5725043516aad
prerequisite-patch-id: d598958c2d64dcb56a5cd64b088594be51b1d752
prerequisite-patch-id: b575ae9ef33020b691c8c5a17bd1985676519e14
prerequisite-patch-id: 8fee5e2daf0749362331dad4fc63d907a01b14e9
prerequisite-patch-id: 366ef1f93fb40b1d039768f2041ff79995e7e228
prerequisite-patch-id: 1d350291f9292f910081856d8f7d5e4d9545cfd1
prerequisite-patch-id: 9a6a60bd2b209126de64c16a77a3a1d229dd898c
prerequisite-patch-id: 08ae5855768ec3b4c68272b86d2a0e0667c9aa47
prerequisite-patch-id: 801be981c2346617fa9412498930b68dc784693b
prerequisite-patch-id: f0dbf0a55a27fe8e199e242d1f79ea800d1ddb66
prerequisite-patch-id: c0b4abb4d44f7e63d002d0bfe5239296930c183e
prerequisite-patch-id: 9c0a6624ed7b7e1d0373985c5c084a844e7c49ce
prerequisite-patch-id: e0ca756f740ab0ce7478bbf6510948ba89529a2f
prerequisite-patch-id: 6d8dbdf864f79fc0c2820e702a7cb87753649ca0
prerequisite-patch-id: 7d4d1d036043a85dcbaf0d09ea85768120efe094

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

