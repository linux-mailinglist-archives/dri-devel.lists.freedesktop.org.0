Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69060B0155B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 10:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A60910E9C3;
	Fri, 11 Jul 2025 08:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="0MV6b16Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD7810E9C3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 08:04:44 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-451d30992bcso13795385e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 01:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1752221083; x=1752825883;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3M2iap2RfddA/05gTNnW43uL4IxbrFPZmKO6UgPVVnU=;
 b=0MV6b16ZuXfQZSHOIWwtLh7IAoRZ/PkB9ysanx/Vlmxkc86SwsfXyeKrYjb4nggkIa
 nzPXtvGEliVvc48vdCQKwFzjbkjNVXGmNj4iJAqcTk2aGAEQq9tCxzGuHCMnYQN0Cp7/
 X9qgzlJDBgQZFzRiUsGeo2cgbfFd3F3FcS1Ig0jojRv0MXYUYhBKl/w8puXmQGJHRuPz
 g/FL/r+ur2zHqgLoMryt7fGjrVK1qnc1ToMU9seVYbHG5FkRiSds5Izugu5tskgGuDhg
 hVffbQSWvLSZDssU30C6ptEdy8clfL3J0zlOf0KddT5KWh2GXxG+5wgZInP0CNIUB+H7
 1ArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752221083; x=1752825883;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3M2iap2RfddA/05gTNnW43uL4IxbrFPZmKO6UgPVVnU=;
 b=EyQHi2jz5u+AKs0aQ0pjZzer8nwn6GrKBYDBl8l63rnpo+7mlKufugFpjWs5CvUp+9
 /DXqm8NZZGY0tFDQGh1LmFz7SH/paxwLl1oPO1TdgbFuTILBEEQhbjZHS58eq9lKdHDi
 /XVLYv5uk23ai8BjbQ0f5EJElMwU+/g2MdlzZz5rmzFzpRTcf1piZLqQL2dkMfYiKFce
 PpQ6mAqvFJJPsWCf3I+GN2/kjRu41ZuZLpYIpeBMNNtti43FMxa6IUJWCIjJET3udJ3M
 vMJ7rXIqxX833cBp0eWcfBUZZgAqjbTJpT4tp2fE/jHrtoWfrcQk7gjw9abThKaykx4n
 cdXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/1D/dwxnwNR2/E/WbVNalMR5nNYVTy/PBIMmLMhiAeQttp7Oo1DGHeuEB2EC7dpMbTZ9eISGWtT8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPGOzHL2B6Se5AOL+7e0N2iFwsNRkwpsVX5OMmUi0yGBaO+QKR
 YeTg0aMPhCXFEoIz5VdKsBqb46TnPd7jAv/2D9gI6BVR2qk3+EmVaoorq9QeEz7tIOCW0zpQjNm
 N9CNYvgneiOU30vWEJg==
X-Google-Smtp-Source: AGHT+IFlSXEzAMov8oFdISNNULpSYKLnI6k/Wg/M0Dmh3F1GHL/zhYS6s31XC9cw+cBAGqFATVlq5a1YqgWWoCQ=
X-Received: from wmbel6.prod.google.com ([2002:a05:600c:3e06:b0:451:edc8:7816])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1547:b0:453:5c30:a1d0 with SMTP id
 5b1f17b1804b1-454f4257f2fmr14179655e9.21.1752221083194; 
 Fri, 11 Jul 2025 01:04:43 -0700 (PDT)
Date: Fri, 11 Jul 2025 08:04:36 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJTFcGgC/3WMQQ7CIBBFr9LM2jFAQ0hdeQ/TBYWBkmgxYIim4
 e6O3bt8L/+/HSqVRBUuww6FWqopbwzqNIBb7RYJk2cGJZQWRkzoeeQIbcVCAUct/KJHabyXwJ8
 ny/Q+ereZeU31lcvnyDf5s/9KTaJEWoIRegrBTu4ac453Orv8gLn3/gXhNWXJqwAAAA==
X-Change-Id: 20250709-device-as-ref-350db5317dd1
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1570; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=pkRDOWebUNM4JiyGTyFlT0hsoPMAV1wZl01/hxrceCs=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBocMWZf5DwFAkNMr1bNJ+/LMsbDNp8asHUALJEC
 96m97gaYBuJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaHDFmQAKCRAEWL7uWMY5
 Rg1iEACj7tHOtxXbhYlloF3PdDFqYVx0uxVObHLIawoVwlm0qOu7jgYFt5twhGd67vpOLuPR1Nv
 d90grP/NrXGdRDadA1J56Y8XLaX13MqGkcQGrZAUN0VCuMCLx/qEjccQ5B8JSD+lOwVV26gsFub
 C5prv8LaELZ422a8iXkKb+VTpTtUa4arPcbmFsa5bvvPzOqGwYwLI8KDVlZU0NW8bczQz2JXPx3
 OUNMqZ3HjTWxll55DZBdWG5cHliBdZG0J+Ox4P6m509s/46m/M37U1O0SpJlI/PEaJoLlPH9e4B
 wuaqGfR5uEgwf5o1oPXvVU0gILQpodJfnxg9XJtTEaT/cOlbeEbhyU+kiuMcankJfb9ACf/s+vC
 R2iRQM6iyzTMO4rGmYY+IUZ2sR7Ob7vUfO9laUr8QgAZBCCwhll6IOk0bWyyQHLGjIcUu/Wqk/T
 lF35wHgXYJ+VrlUQryynKkAfTdgejexjBADJ0KoL+cjOr5vCLpHValhlXEr6XX5pCnFABK/WJ8C
 YLDzqGUbUtF75+hrJbOKDPsvpc4FSRyISEC1JgwYOoxi76WNJSaTa0Ks/n+xVaptZZ0xlFQMSxR
 YUQ2jeFDP2hMS+S4YpDhCmRrNP3t9w/6gd4ELfkIIbaEL+JD1o9vOCNbdWxB+NznrCp+CMIuGts
 W7AxjNqzkAB+zmg==
X-Mailer: b4 0.14.2
Message-ID: <20250711-device-as-ref-v2-0-1b16ab6402d7@google.com>
Subject: [PATCH v2 0/2] Rename Device::as_ref() to from_raw()
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

For more, see: https://lore.kernel.org/r/aCd8D5IA0RXZvtcv@pollux

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Split into two patches.
- Use a different lore link.
- Link to v1: https://lore.kernel.org/r/20250709-device-as-ref-v1-1-ebf7059ffa9c@google.com

---
Alice Ryhl (2):
      device: rust: rename Device::as_ref() to Device::from_raw()
      drm: rust: rename as_ref() to from_raw() for drm constructors

 rust/kernel/auxiliary.rs   |  2 +-
 rust/kernel/cpu.rs         |  2 +-
 rust/kernel/device.rs      |  6 +++---
 rust/kernel/drm/device.rs  |  4 ++--
 rust/kernel/drm/file.rs    |  8 ++++----
 rust/kernel/drm/gem/mod.rs | 16 ++++++++--------
 rust/kernel/drm/ioctl.rs   |  4 ++--
 rust/kernel/faux.rs        |  2 +-
 rust/kernel/miscdevice.rs  |  2 +-
 rust/kernel/net/phy.rs     |  2 +-
 rust/kernel/pci.rs         |  2 +-
 rust/kernel/platform.rs    |  2 +-
 12 files changed, 26 insertions(+), 26 deletions(-)
---
base-commit: 86731a2a651e58953fc949573895f2fa6d456841
change-id: 20250709-device-as-ref-350db5317dd1

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

