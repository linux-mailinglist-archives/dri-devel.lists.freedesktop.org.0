Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D24E3A6E611
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 23:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CCE510E4DC;
	Mon, 24 Mar 2025 22:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ng3ZxsAI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34C510E4DC
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 22:01:45 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-4774ce422easo7809551cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 15:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742853704; x=1743458504; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=48vsJ6v/nLu6gQ6p2zqKRIpvk+YPWE9bmceJQmo3Vqk=;
 b=ng3ZxsAIKJpWYnhTJ6x1/BkiUW83NGv4Pejq4ACc6hF5cCtVTZz1ValK1SPg8hfqEL
 i04yyDJIWX9GFbdUTc4ICJqMsnVtvIJ/YJChVAN3Nz7J2TskMvnOSPizO0cwGxn7zZR3
 sT6H32cEQKMN1qyz1AZi6bTmGA2pCXyyQCKcacnGWmvlxdtKsMyq4dfcuu9+lQvNqIvM
 PMDF3RPqlit7uJCX9UEgjv0cl8M6+35bOMONyD8jhNPtpzTQczrMLDeEUYXS6I3s4roY
 O1e5cCURcC0Ovy2HGkue3CQGTTdihoGbNest9xyhMfyWHndPVd1kFpwLCU+cLjp8VrGs
 Eotw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742853704; x=1743458504;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=48vsJ6v/nLu6gQ6p2zqKRIpvk+YPWE9bmceJQmo3Vqk=;
 b=AXp9TN7zdkwC9cdxfdjPzYyyKyeclqp3Uk2btaN0z7zhqOa+LWlOCywJ63feesOCxI
 L6sgQNsq5zW/7+icDYWqyB5aC+dtt954+zD3dOlk2D4ZqdLfRLmU3VjYLFS7f031+rLi
 8T1O56b01Epf/7aQhm0kN0q8vfi7QFYQU/yL7pbFqfpf0d33fkW9VEmg8+vYiKwyKClc
 jm1hhnWoiIMqq898vRqNwffDrJdD2AgIF2kIcfiT3QHfFR+725in1POwBtLZtHRYcC+1
 VhBFfIQGrxSVAICdAbQO76ETYhIToN7sXHhBlEpPxriuXzZF2P2VwDyV9wSGg3WG9KV8
 LnTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwAWuLLNA5EvO+gmbQMAyG4amacP5TwEk6mFQlImVlzZh3OnpKQ59aGJOMgBE/9cLeC4lsP0qZFzs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxhtx2jxFHqDOmTCpIXaWG/o3rq51qYWzoyWQl1/micQFe51UEH
 5usq2D6UGfJBVQqFDH3mjqBytXaroZtIt2x/PjA32M9unfIfTSHPn6woVA3/BLI=
X-Gm-Gg: ASbGncuzz1NHzV4pA2sTOat4UzvQFG+G4wWrsBlgL0Gy5wBVo4uBv9Y3O0/liGt/zv6
 vc+OoSsOZ6fSifMYXlEss2Ys1yiPYjwI1SlUEWkrrGyO5veo32xpA1DEbKRVJI/HkJtr6w7eAQw
 Ttb/XKvBPmNnlr5AFif6pMHhT1UvX1IIgvunadIHt5cwoosUdgsIcx1IEtHCsWInffWExFM/cdP
 s+72fAO3FGVGbNYzwMHC+Qt0MzNaV+/5eGB7+oPPl7yMB54EnwGf+lzkq720pVBE7t/dE63cCAv
 O0A/0I768AAcULPrDOeG+XSqme9u7VR3++fPaLNErhJQpXJRDCRSj05KECdEDbW1AuAFJ00mA9g
 GwJ0KE/0nRSDwKuVCMzhVy66/ftmGC0RkawXg3B8hqGNtouYmRcs6qw==
X-Google-Smtp-Source: AGHT+IGjaSVyROaXvVWRD/dB2tcIqIsWK/CblsLlsWJJlKtg+yAXt0fZphnVNo27G4vykALG3lbVSw==
X-Received: by 2002:a05:622a:17cd:b0:476:b33f:6694 with SMTP id
 d75a77b69052e-4771dda5445mr262657161cf.28.1742853703515; 
 Mon, 24 Mar 2025 15:01:43 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2620:10d:c091:600::1:43c7]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4771d0ad87esm52129541cf.0.2025.03.24.15.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 15:01:43 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v6 0/6] rust: reduce `as` casts, enable related lints
Date: Mon, 24 Mar 2025 18:01:29 -0400
Message-Id: <20250324-ptr-as-ptr-v6-0-49d1b7fd4290@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADrW4WcC/23PzarCMBAF4FeRrM0lM80krSvfQ+4ivxpQK4kUR
 fruN3bVlLsazsB3hvmwEnIKhR12H5bDlEoa7zWo/Y65i7mfA0++ZoYCSXRC88czc1OWgWChVzo
 66SWr4JFDTK+l7PRb8yWV55jfS/cE3+2/NRNw4NSjF4pAuqE/nm8mXX/ceGPfmgnXdGgocsGRv
 BLGD4hWb2m3oiAb2lUatDUKhOyjNFsq15QaKiu16DU6kN6h2lJa0/ZXqpQsRYRosBPN1Xme/wB
 iH9NskAEAAA==
X-Change-ID: 20250307-ptr-as-ptr-21b1867fc4d4
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org, 
 linux-block@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
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

This started with a patch that enabled `clippy::ptr_as_ptr`. Benno
Lossin suggested I also look into `clippy::ptr_cast_constness` and I
discovered `clippy::as_ptr_cast_mut`. This series now enables all 3
lints. It also enables `clippy::as_underscore` which ensures other
pointer casts weren't missed. The first commit reduces the need for
pointer casts and is shared with another series[1].

As a late addition, `clippy::cast_lossless` is also enabled.

Link: https://lore.kernel.org/all/20250307-no-offset-v1-0-0c728f63b69c@gmail.com/ [1]

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Changes in v6:
- Drop strict provenance patch.
- Fix URLs in doc comments.
- Add patch to enable `clippy::cast_lossless`.
- Rebase on rust-next.
- Link to v5: https://lore.kernel.org/r/20250317-ptr-as-ptr-v5-0-5b5f21fa230a@gmail.com

Changes in v5:
- Use `pointer::addr` in OF. (Boqun Feng)
- Add documentation on stubs. (Benno Lossin)
- Mark stubs `#[inline]`.
- Pick up Alice's RB on a shared commit from
  https://lore.kernel.org/all/Z9f-3Aj3_FWBZRrm@google.com/.
- Link to v4: https://lore.kernel.org/r/20250315-ptr-as-ptr-v4-0-b2d72c14dc26@gmail.com

Changes in v4:
- Add missing SoB. (Benno Lossin)
- Use `without_provenance_mut` in alloc. (Boqun Feng)
- Limit strict provenance lints to the `kernel` crate to avoid complex
  logic in the build system. This can be revisited on MSRV >= 1.84.0.
- Rebase on rust-next.
- Link to v3: https://lore.kernel.org/r/20250314-ptr-as-ptr-v3-0-e7ba61048f4a@gmail.com

Changes in v3:
- Fixed clippy warning in rust/kernel/firmware.rs. (kernel test robot)
  Link: https://lore.kernel.org/all/202503120332.YTCpFEvv-lkp@intel.com/
- s/as u64/as bindings::phys_addr_t/g. (Benno Lossin)
- Use strict provenance APIs and enable lints. (Benno Lossin)
- Link to v2: https://lore.kernel.org/r/20250309-ptr-as-ptr-v2-0-25d60ad922b7@gmail.com

Changes in v2:
- Fixed typo in first commit message.
- Added additional patches, converted to series.
- Link to v1: https://lore.kernel.org/r/20250307-ptr-as-ptr-v1-1-582d06514c98@gmail.com

---
Tamir Duberstein (6):
      rust: retain pointer mut-ness in `container_of!`
      rust: enable `clippy::ptr_as_ptr` lint
      rust: enable `clippy::ptr_cast_constness` lint
      rust: enable `clippy::as_ptr_cast_mut` lint
      rust: enable `clippy::as_underscore` lint
      rust: enable `clippy::cast_lossless` lint

 Makefile                               |  5 +++++
 drivers/gpu/drm/drm_panic_qr.rs        | 10 +++++-----
 rust/bindings/lib.rs                   |  1 +
 rust/kernel/alloc/allocator_test.rs    |  2 +-
 rust/kernel/alloc/kvec.rs              |  4 ++--
 rust/kernel/block/mq/operations.rs     |  2 +-
 rust/kernel/block/mq/request.rs        |  7 ++++---
 rust/kernel/device.rs                  |  5 +++--
 rust/kernel/device_id.rs               |  2 +-
 rust/kernel/devres.rs                  | 19 ++++++++++---------
 rust/kernel/dma.rs                     |  6 +++---
 rust/kernel/error.rs                   |  2 +-
 rust/kernel/firmware.rs                |  3 ++-
 rust/kernel/fs/file.rs                 |  2 +-
 rust/kernel/io.rs                      | 18 +++++++++---------
 rust/kernel/kunit.rs                   | 15 +++++++--------
 rust/kernel/lib.rs                     |  5 ++---
 rust/kernel/list/impl_list_item_mod.rs |  2 +-
 rust/kernel/miscdevice.rs              |  2 +-
 rust/kernel/net/phy.rs                 |  4 ++--
 rust/kernel/of.rs                      |  6 +++---
 rust/kernel/pci.rs                     | 13 ++++++++-----
 rust/kernel/platform.rs                |  6 ++++--
 rust/kernel/print.rs                   | 11 +++++------
 rust/kernel/rbtree.rs                  | 23 ++++++++++-------------
 rust/kernel/seq_file.rs                |  3 ++-
 rust/kernel/str.rs                     | 10 +++++-----
 rust/kernel/sync/poll.rs               |  2 +-
 rust/kernel/workqueue.rs               | 12 ++++++------
 rust/uapi/lib.rs                       |  1 +
 30 files changed, 107 insertions(+), 96 deletions(-)
---
base-commit: 28bb48c4cb34f65a9aa602142e76e1426da31293
change-id: 20250307-ptr-as-ptr-21b1867fc4d4

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

