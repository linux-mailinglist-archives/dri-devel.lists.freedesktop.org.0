Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B933DA82874
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 16:47:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D5810E915;
	Wed,  9 Apr 2025 14:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eNYm0CkB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C6B10E915
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 14:47:26 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-476f4e9cf92so51111611cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 07:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744210045; x=1744814845; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OxSVY9bn2Vv0A1oBrQZzgAHvFFWvWIBKi/nsXjN5Jm0=;
 b=eNYm0CkBZCDwWdE5iFtmb91qvVk397UQmPQn9+BjeW+4cgxt2tl+SCPP2TemSa0Mxp
 cy0D/BJh3GN8fdVzXQ42AkcLQunbVsx5L20SwvrQKdyVn5/ArsllSlwFPyNeB6ZXeMLx
 +XJCHjn63QIGN5y/Aa7mL0ipvQnuY0oI0y02LJOByRzsUVHzRKCe93cHsDHHpVRkQbx4
 XJdOE0o3BNKJGQJJhNxi++YGideQYyk3PtoNZhKxnQ5d1qKVD/kseTDQ4dLwsqYzKdOe
 fbOhbqC9lYPw9g6ddFKqnbt1JMV1OvV0/u0Opp5E6h3DAvhp3NnoEfEbPXR9xmZaGMfq
 CVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744210045; x=1744814845;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OxSVY9bn2Vv0A1oBrQZzgAHvFFWvWIBKi/nsXjN5Jm0=;
 b=VOEgEJnxzPBJtBr+Rlo8n60hO79Q5SAlHvxFYHiW6QdxR7BYcIUAHtwE7MlNxGwuSF
 ZrE+KKqQi5lUdb1LhLFD0aGY1xoGr8ZlVk6gfHUylBeHKuJWJ0mCnYapvPTwm6nIhW7y
 z913UGRo+LE2RmSLvIH3l+qw6aa+b1Uws0Eqilw02e+gUaEHLwOXJUrAYl0/4eeqpmGd
 OvP2qdo+CqakzJaXUAouPatvkPiFwfnpqm8ExUdfcksMLakUVs4+y0oKtI5+LygSZHrx
 edFUCCr32ny1tky4XAx8lQReQo5fmYQT1T6BC57umcjZZRa0Qr5lkGVGpypvdIiDJBNr
 U9vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWN3Y0l30uigo1cKO2p1EAxSU/up4OOTkoEia6pSUHERgKazfj5CWUr8LCfMam6xYkNUIIiPtcj9N8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1lGp0+bmOujlZ3yGOnpaT0QwWCFShFqb2yfB7vVr7YqdAX2rl
 X3wM0Q5VWA1M+1HEzwtkJTYttkYrxJPfzurtqOdWiwi2VfAu3eAM
X-Gm-Gg: ASbGnctMh4fhuSaFosvHeG5/KtY8tseupsk5Xo9Ejg1Z53gejS9cqxhbd7JtN9Hn7K9
 zNQl3SM2vvhOOtsv5je2C0u0CRz/3ECTyKitadt2GkQxl02iTxtdCrUXCXwad/5dasXElCa6pVu
 2pzJBkjZvEFb309032V+bp1J+mU6hsfdpg6p7yzhz53ZHA41+p5okRZurb+rQDVzWFtuziXdYYj
 hkFIMqbaKlFN4jfoY5oxuoeptyfNCj+VWSvuNgEn6TQRsg/cwFPPl9NbM/epER52pRh5HZilpoA
 EjIWApMDjqGsFE6yEcWrF3vHrpw7mjANY2PXlV1IzcSBljFBjGKuC0kIBEPHkwEV+xPLkxpEEyP
 vjqujUHA9ALIz30HMJL5PPOce0U5KfDRJxzJfQP28hzOxQYGwW4Z28vM=
X-Google-Smtp-Source: AGHT+IGVBcgvUoAJ+mvBt4f2jO2Qo+1VcYhXU6dhpdk7BxROicttj+bkxTItoDRACLAwYujqEqGZ6g==
X-Received: by 2002:a05:622a:1895:b0:477:548:849e with SMTP id
 d75a77b69052e-4795f2cd4ffmr40751411cf.15.1744210044680; 
 Wed, 09 Apr 2025 07:47:24 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2620:10d:c091:600::1:3298]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-47964eb9a8fsm8024461cf.49.2025.04.09.07.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 07:47:24 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v8 0/6] rust: reduce `as` casts, enable related lints
Date: Wed, 09 Apr 2025 10:47:17 -0400
Message-Id: <20250409-ptr-as-ptr-v8-0-3738061534ef@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHWI9mcC/23SzW7DIAwA4FeJOI8JO/wlp73H1AO/HdKSdCGNN
 lV999H0QrKdkEGfMdg3ksOcQiZ9cyNzWFNO01gC/dIQ92HGc6DJl5ggQ8FapuhlmanJ24JgQUs
 VHfecFHCZQ0zfW7L3U4k/Ul6m+WfLvcJj9980K1CgQqNnUgB3nX47DyZ9vrppII80K9a021Gkj
 KLwkhnfIVp1pG1Fge9oW2hQ1khgXEdujpTXVOwoL9SiV+iAe4fySEVN928VhQorIkI02LI/t8q
 K4r5gWSjvPFgVPceOHamq6b5gVahWxnKBwJXtanp/dm4OX9fS/eXZPmJNDrScD2npG2YiRmkDW
 I4aWi2sBO2sluXXuQw+eKY74zSpp6ZvtlJ46ZibxsWkMcx0inS4LmPImVoQrS8ltVr7vozH6X7
 /BYkxGT6OAgAA
X-Change-ID: 20250307-ptr-as-ptr-21b1867fc4d4
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
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
 FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Nicolas Schier <nicolas.schier@linux.dev>
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

As a later addition, `clippy::cast_lossless` and `clippy::ref_as_ptr`
are also enabled.

Link: https://lore.kernel.org/all/20250307-no-offset-v1-0-0c728f63b69c@gmail.com/ [1]

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Changes in v8:
- Use coercion to go ref -> ptr.
- rustfmt.
- Rebase on v6.15-rc1.
- Extract first commit to its own series as it is shared with other
  series.
- Link to v7: https://lore.kernel.org/r/20250325-ptr-as-ptr-v7-0-87ab452147b9@gmail.com

Changes in v7:
- Add patch to enable `clippy::ref_as_ptr`.
- Link to v6: https://lore.kernel.org/r/20250324-ptr-as-ptr-v6-0-49d1b7fd4290@gmail.com

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
      rust: enable `clippy::ptr_as_ptr` lint
      rust: enable `clippy::ptr_cast_constness` lint
      rust: enable `clippy::as_ptr_cast_mut` lint
      rust: enable `clippy::as_underscore` lint
      rust: enable `clippy::cast_lossless` lint
      rust: enable `clippy::ref_as_ptr` lint

 Makefile                               |  6 ++++++
 drivers/gpu/drm/drm_panic_qr.rs        |  2 +-
 rust/bindings/lib.rs                   |  3 +++
 rust/kernel/alloc/allocator_test.rs    |  2 +-
 rust/kernel/alloc/kvec.rs              |  4 ++--
 rust/kernel/block/mq/operations.rs     |  2 +-
 rust/kernel/block/mq/request.rs        |  7 ++++---
 rust/kernel/device.rs                  |  5 +++--
 rust/kernel/device_id.rs               |  5 +++--
 rust/kernel/devres.rs                  | 19 ++++++++++---------
 rust/kernel/dma.rs                     |  6 +++---
 rust/kernel/error.rs                   |  2 +-
 rust/kernel/firmware.rs                |  3 ++-
 rust/kernel/fs/file.rs                 |  3 ++-
 rust/kernel/io.rs                      | 18 +++++++++---------
 rust/kernel/kunit.rs                   | 15 +++++++--------
 rust/kernel/list/impl_list_item_mod.rs |  2 +-
 rust/kernel/miscdevice.rs              |  2 +-
 rust/kernel/net/phy.rs                 |  4 ++--
 rust/kernel/of.rs                      |  6 +++---
 rust/kernel/pci.rs                     | 11 +++++++----
 rust/kernel/platform.rs                |  4 +++-
 rust/kernel/print.rs                   | 11 +++++------
 rust/kernel/seq_file.rs                |  3 ++-
 rust/kernel/str.rs                     | 16 +++++++++-------
 rust/kernel/sync/poll.rs               |  2 +-
 rust/kernel/time/hrtimer/pin.rs        |  2 +-
 rust/kernel/time/hrtimer/pin_mut.rs    |  2 +-
 rust/kernel/uaccess.rs                 | 10 ++++------
 rust/kernel/workqueue.rs               | 12 ++++++------
 rust/uapi/lib.rs                       |  3 +++
 31 files changed, 107 insertions(+), 85 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250307-ptr-as-ptr-21b1867fc4d4
prerequisite-change-id: 20250409-container-of-mutness-b153dab4388d:v1
prerequisite-patch-id: 53d5889db599267f87642bb0ae3063c29bc24863

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

