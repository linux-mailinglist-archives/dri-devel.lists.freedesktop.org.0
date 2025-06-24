Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E809AE6AE8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 17:28:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45FE910E5CF;
	Tue, 24 Jun 2025 15:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="VmM9ev+0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1250110E5CF
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 15:28:12 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-453804ee4dfso2622435e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 08:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1750778890; x=1751383690;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=BqGXDhYSlvCrZbEH9Cv6es5PlTzM9evZxVnOZeB/MNc=;
 b=VmM9ev+0QDz776gZWHM2Fd+M1qHNZ1VmpvjDa9YidCTlYahxAWiIr8d6nKb5XRZUU8
 kcSx9pqAoBn8SVFmTH7FvQbXfFmhr1tC9kZbtPIITuGS7chaIbu821WPl5uBgXQyQJrD
 EVS39U2lVtgPUlggrndLfoK1KCdFUY8uClOi+qNu2RBpaCGKZFUk3L9S6dQJLiHhi5DC
 8Ifku/1Ak9e/H+09rREdBCrMTioLC0E80aAzzGQE7roQyZUBMvCJrUPiQ2ysGx6vjcHB
 OMW/741xFGiwspA1sZNU+VX4NLyoVK2rvCy1qR9HYtFpN0+lTyN/3uVuPn8ABZRyesfs
 fqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750778890; x=1751383690;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BqGXDhYSlvCrZbEH9Cv6es5PlTzM9evZxVnOZeB/MNc=;
 b=waf08uoDQUo3jSz/qJUVkIrqrhqej2dgtf017SiTSLD0yUbhxnXSdwmiAZCl3R+CuG
 s6wBZTO8JHun5bslGA6/H/mFyFSuSHqZZMzxmKaK+Y4qc4p8nXCBziBGsqn061ToL1AN
 a1B8fLgP1DSSZGg8LXhj8p6s7qVnx3dzqw/PJNmBdYcSu7X25ybxjlq3WEOmfsrNLlQ3
 scy6is+xRY0AjcpaIp7Gj/CVmhsBgz6PNo02FXH9Gi40Qg0VYApWp8kQGB7n2Llo6V00
 PfNNNjvUCg+5vRlFGV90dSfNCF5g3Gh7H7rUjgZmUKmJ6S460G+QlKaBQ1G7iDrqVCf5
 wh5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqHAa0a4bAQXNIh5B5d8ElP2Cr3Xb802Rs1GnJRx1Udxy/dHFrDImUDwRupmE1sXe5WuJVm+UOvhs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDwE5fSmSXUmm+NzKw+J3SU37vD16TZSixE7ysLYZeLLxgvA1r
 RGQQzRf6+oZVks+lMK+jH0Mr7Vt6WfW+qsF0iwajmPinXCH6XvYHh693xLWBDv66RvW+dQYtA50
 +vg60FarxnjA/KeO2Lg==
X-Google-Smtp-Source: AGHT+IHMf6+raYFA7ySd9EOL3L/GCJqSmyssi+lARWuqdtFQtng4gPOM0JqrpSdAJ63ohOD6ZI1hFzGmAu/7bIE=
X-Received: from wmrn35.prod.google.com ([2002:a05:600c:5023:b0:450:dd5c:6cd3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e8b:b0:43d:77c5:9c1a with SMTP id
 5b1f17b1804b1-453653a3984mr181253065e9.4.1750778890698; 
 Tue, 24 Jun 2025 08:28:10 -0700 (PDT)
Date: Tue, 24 Jun 2025 15:27:54 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPrDWmgC/3WNQQ6CMBBFr0Jm7RhaA4or72FYDHUKTYSBVquG9
 O5W9i7fS/77KwT2jgOcixU8RxecTBn0rgAz0NQzultm0KWuylodUWZanozWy4ieXkim6k5sa0u
 kIa9mz9a9t+K1zTy48BD/2Q6i+tn/rahQIWluGrZ06EhfepH+znsjI7QppS/3BG9drwAAAA==
X-Change-Id: 20250617-opaque-from-raw-ac5b8ef6faa2
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1782; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=Dd2F0B0ISEzWA7LaglJfD+xCcbLb19kfhcNyzezrUFw=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoWsQDO4H7Uc99vI+/NQXVnCqQ0zwkewq/nEH9F
 ZHfpAlsfs2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaFrEAwAKCRAEWL7uWMY5
 RmKCD/9KzIHB/0Bwb5Tbi86a+ap+B6v9Th83f8rJ4H+bjGAULY3/bnpn7/ifAl50NGXQzM9LSJY
 v8AKtlBzlOOKwBh4CDVhHjnQkP8if2W3Hlub42KE8aUMk8tKAuMhyqUft27wGEhfi3etqLFCObp
 QvrVv8S5+xhSevIDYDFSxNHZFleo0bec8P1Qcvp4wj4VjNcDQfKaeVyCzt8hhM2hGT/CMWYoEgE
 Jmww4psDMOo4BtIPOqaMK/L4PTNX8qCOGRe/xH8SqOIgcWgJjw7vGq/Wj/AwxXnFIDSzjbh+xQK
 ruN+aEZHTHs6L6diBnDQG265pEX3RAI4+/T1aIClhslEi/Mz3V5UKrK5WFle1I2fPnL/alG368x
 Ozy9S1XEkl8oc7d+J0DbM6QSqeDPIS/XucQtuWj0qgohWQNmr4Q/w+DEH3ColkJLnjBRBGqTZcX
 VlMXS6QlMRLkYuxrOFbV5Pnxn3Lksh4CuicQK8r+RZ8hWSmbfZS7ZpPUVDihyn83Nwf0GBysTre
 fZyW+rlK1pUT+65cuYAh755/0+Bm7ToeybUvOl6qE/zQvtm511tpbTz2KY9O+dcFU4ppYho6n3y
 4nNlL5NUXcCPCmhlUaffKBiIY1DypR0qQwbExRkGOj9XGVXw1H7qS04yJ5x42wkHyYxESsgKFct
 vLVCfrkt2HGtQ9w==
X-Mailer: b4 0.14.2
Message-ID: <20250624-opaque-from-raw-v2-0-e4da40bdc59c@google.com>
Subject: [PATCH v2 0/2] Add Opaque::cast_from
From: Alice Ryhl <aliceryhl@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
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

Since commit b20fbbc08a36 ("rust: check type of `$ptr` in
`container_of!`") we have enforced that the field pointer passed to
container_of! must match the declared field. This caused mismatches when
using a pointer to bindings::x for fields of type Opaque<bindings::x>.

This situation encourages the user to simply pass field.cast() to the
container_of! macro, but this is not great because you might
accidentally pass a *mut bindings::y when the field type is
Opaque<bindings::x>, which would be wrong.

To help catch this kind of mistake, add a new Opaque::cast_from that
wraps a raw pointer in Opaque without changing the inner type. Also
rename raw_get() to cast_into() for naming consistency.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Use new naming, and rename raw_get().
- Link to v1: https://lore.kernel.org/r/20250617-opaque-from-raw-v1-1-a2e99efa3ba2@google.com

---
Alice Ryhl (2):
      rust: types: add Opaque::cast_from
      rust: types: rename Opaque::raw_get to cast_into

 rust/kernel/configfs.rs                |  2 +-
 rust/kernel/drm/device.rs              |  4 +---
 rust/kernel/drm/gem/mod.rs             |  4 +---
 rust/kernel/init.rs                    |  6 +++---
 rust/kernel/lib.rs                     |  7 +++++++
 rust/kernel/list.rs                    |  2 +-
 rust/kernel/list/impl_list_item_mod.rs |  4 ++--
 rust/kernel/time/hrtimer.rs            |  4 ++--
 rust/kernel/types.rs                   | 11 ++++++++---
 rust/kernel/workqueue.rs               |  2 +-
 10 files changed, 27 insertions(+), 19 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250617-opaque-from-raw-ac5b8ef6faa2

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

