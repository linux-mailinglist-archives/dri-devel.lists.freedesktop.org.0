Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6411C7E03D
	for <lists+dri-devel@lfdr.de>; Sun, 23 Nov 2025 12:28:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39AA610E149;
	Sun, 23 Nov 2025 11:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hy0vKzBs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6E610E126
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 09:25:31 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-29808a9a96aso40172555ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 01:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763889931; x=1764494731; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=977npvamVvdSn8Hrj6nV2vV28cG+wMk/irqNnaoU/Xw=;
 b=hy0vKzBssqKSMGRVc8GAamMNxp8fapNwYBKhDoWFXMY4zlW94RXT8vc8gYPLniqRgj
 jjN1Akp/f69FX705P91xVqn+BiGVmYxkwA0mw/HOeI+A3mfhGjKxxUFYBenEjy36Oopn
 bZ57einPSh95YDP3Rcfg/2mAHLzkYhganq8UkHS6ozO2fYxfbszvgBF7uaGAx3HyA+u2
 KTsbLMX+TXBo6rYX6hUWjklzr46YHuHyOC0gP8Th8CN5VYFCcmW2hSwmIsmcFQxzs7Of
 247WUWYQt2GZaZKjXWu4PZrpadaX7GeY8/WWTei4WVCnteMIUQbxfNq3G2gNFIfptU3K
 Y0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763889931; x=1764494731;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=977npvamVvdSn8Hrj6nV2vV28cG+wMk/irqNnaoU/Xw=;
 b=VZi5t0DvPb4d4tiSUvdWKbtWeKiVF4OJkPID8mR28WMUq8g5BXVNiuu7x8/8Cz3ovz
 7jphlw7pwHFsqsV+bVsfUW0oiDbt2V020YVJzoiGxpUEM7kJ0UJi1zddxHHfwMZfNtHg
 s7GTCg60dDn9as7L4aylHQceJV7lqLH/jSYWNmJpMeEO0OxFvzmNUjmqyL5xrQTajsPw
 VmIMBOHEEBAr7Rzq7ZXf3IBeSPsKprH68T2LMPt6TmiRtPV1YBgzAFxFauxqirxgTrQU
 BgetZVlI4q6Tm+MIshLkCS6xDS6dc0hHslHSSwcHoXtXdN8h8E+pmVuIWlmVKrnuO+0J
 wkqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOdXa3EPNJ3ONE6+zYqzp89pfaRpI0B9TSZw+dhbIuuJaIUVCPpbEwqI2LjexJDM/MUaGKjrCqgSE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMuwsAqLkzysLkhEv8YEerUMeCHrFyMI8guCxsLxuO3O8T+Gn4
 x8T2NzyTIs7DRhAceIl40W+xXh9zUb2OacMDu7G1hc5HAGIAAbtsrREG
X-Gm-Gg: ASbGncvrQYQDMfz1XWkGWeUhSYS0Avv0rPu36t+K3MAA4mZLkmegS0WnXASZej1kCGC
 byBiHnNJAUIPB3EQjdeBaa5/cj+iCrhakJbQyVhKsv+KQFgS8VecdHXp36xPN9Q7TamZZKHP8Vr
 8/u71gpnobO18y8cKn2/SCquOpbRULNf45m9C6OJWvLMcIh5RLzNxfLeqP0YqK/+5mZErpM4LKM
 p3uvSZGpRF4HAFRw89YESts8q9LFtFb39F1sPZEgqJsMBL8InwYoxoWKDZnS4Ny42qNSVeOyaeg
 bg3wPphTllB35o4s/AGhe3MNAiS0ySxfhzR+zGNvcSwpICJ847G0zU7Mwk3sgHCp27PeESqAZ4b
 4ZKcD4oCFdn/j0dmYhGCr/YjPv+6lFpLy1COrsTCvGzU5hoiSF72IV6Yn96wbi4cNew4uI74OkZ
 a2TiClBHxQuvtQVlSvj2WbpGnf7w==
X-Google-Smtp-Source: AGHT+IH0c6lqi1+YOT+atVR2GQVjdlkn5EPFXDoVAJCKagGeZwAimktqjcIQnMFOvKx8Iio/IO02PA==
X-Received: by 2002:a17:902:c946:b0:297:c0f0:42d7 with SMTP id
 d9443c01a7336-29b6bf5f050mr110076125ad.41.1763889930982; 
 Sun, 23 Nov 2025 01:25:30 -0800 (PST)
Received: from shankari-IdeaPad.. ([103.24.60.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b138c08sm100811105ad.25.2025.11.23.01.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 01:25:30 -0800 (PST)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alexandre Courbot <acourbot@nvidia.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Igor Korotin <igor.korotin.linux@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-pwm@vger.kernel.org,
 Shankari Anand <shankari.ak0208@gmail.com>
Subject: [PATCH 00/10] rust: refactor ARef and AlwaysRefCounted imports
Date: Sun, 23 Nov 2025 14:54:28 +0530
Message-Id: <20251123092438.182251-1-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 23 Nov 2025 11:28:20 +0000
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

This series updates the import sites of `ARef` and
`AlwaysRefCounted` in the Rust kernel code to use `sync::aref` instead
of the previous `types` module.

The refactor to `sync::aref` from `types::` was introduced in the commit: 
commit 07dad44aa9a9 
("rust: kernel: move ARef and AlwaysRefCounted to sync::aref")
link [1]

The goal of this series is to complete the migration of these
types to `sync`, as discussed with Miguel Ojeda [2].
The last commit in this series removes the temporary re-exports
from `types.rs` that were originally added to avoid breaking the
build during the transition.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=07dad44aa9a93b16af19e8609a10b241c352b440
[2]: https://lore.kernel.org/lkml/CANiq72=hSTpAj7w8bvcwoJkivxD_FPKnx9jD6iNvhsENnnXBzg@mail.gmail.com/

Shankari Anand (10):
  drivers: android: binder: Update ARef imports from sync::aref
  drivers: gpu: Update ARef imports from sync::aref
  rust: device: Update ARef and AlwaysRefCounted imports from sync::aref
  rust: drm: Update AlwaysRefCounted imports to use sync::aref
  rust: kernel: Update ARef and AlwaysRefCounted imports to use
    sync::aref
  rust: kernel: Update ARef and AlwaysRefCounted imports to use
    sync::aref
  rust: kernel: Update ARef imports to use sync::aref
  rust: kernel: Update AlwaysRefCounted imports to use sync::aref
  samples: rust: Update ARef imports to use sync::aref
  rust: kernel: remove temporary re-exports of ARef and AlwaysRefCounted

 drivers/android/binder/process.rs      |  2 +-
 drivers/android/binder/thread.rs       |  3 +--
 drivers/gpu/drm/tyr/driver.rs          |  2 +-
 drivers/gpu/nova-core/gsp/sequencer.rs |  2 +-
 drivers/gpu/nova-core/vbios.rs         |  2 +-
 rust/kernel/device.rs                  |  4 ++--
 rust/kernel/device/property.rs         |  5 +++--
 rust/kernel/drm/gem/mod.rs             |  2 +-
 rust/kernel/i2c.rs                     | 10 ++++------
 rust/kernel/pwm.rs                     |  3 ++-
 rust/kernel/scatterlist.rs             |  3 ++-
 rust/kernel/types.rs                   |  2 --
 rust/kernel/usb.rs                     |  3 ++-
 samples/rust/rust_debugfs.rs           |  2 +-
 14 files changed, 22 insertions(+), 23 deletions(-)


base-commit: d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
-- 
2.34.1

