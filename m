Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A4CAFF222
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 21:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E01510E826;
	Wed,  9 Jul 2025 19:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NPvkIccy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F03CF10E829
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 19:58:56 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-4a77ffcb795so2947311cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 12:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752091136; x=1752695936; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ugaGedfdExj0AxEbdScIbc7eibANo0qNIkwwni0XDDk=;
 b=NPvkIccygg4tHuSaeO3uDECMx8r+cRk3FpqnzZjTjjEj48R6Q3KVvbVt3cUwJwklzf
 FtnjRto9kXiPy5O/b5ccklPUiod753lKyGHDYQFrvFd08tDeHw6fkPHfwX0GP4kJWlAJ
 f8F9CGSuzKRQbYzX/MwMzDNUcOsfRbzlXWnx2p+ErzDsxhry2TTAbnAh1G6pigdACFhj
 N1zfVjF7t3h1E18eSHjEiS3ON0dyrRCB7r3ECdXihIusLQrwqnHyhRlCUs3NGEgrF0Km
 6sM/Z+zQSDu9iqmRtneWKgrMgG12kAk9/r0+QJIa4ciXVVEp0siuGjef50w2iyg5AOw2
 LqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752091136; x=1752695936;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ugaGedfdExj0AxEbdScIbc7eibANo0qNIkwwni0XDDk=;
 b=LF44DrFMNV/5Fb97uqesrhkxoxNk4EguVxZQKD325xDSl0tgGB4VNRrYWE9MSdiVis
 JwqBl87k1W+K3oJAzdigYW5PSANx6Co/pTrubekI2ohB5oyDFbuktqja2niHVLQbKB8t
 p1g0/8r1vRe/vYmbfs+DZcW7jtvmfJRbC62WD9w0vMd1cd8B2+7jVRVZ/jbXycfFbpqR
 23El7ESttI2vO0JBxz12Xgrd94MMVPqzuToWaCxC6m6SP9N0R4/khpn7dYN4YnY/sL1g
 wwIvvuT7zLdrINagOHg1xTpC48JbMCbpWAUErXfSq2wnlYwXb6kmuMcmhwsJRcQE4l1r
 YD7Q==
X-Gm-Message-State: AOJu0YyrA2qoPSTyVzsKT6gzAH67FvaEPiMpzVNgaUVbKO6+a7o6m7Ny
 YDxOLgTjioNwak6bcINfaDYfx+jlOLPbbZ29b2hbzpRDecVxKlo4F4mv
X-Gm-Gg: ASbGncsQVgJJy9M75QpjyZmWH9nedBNoyxlnGvXHAhCsKlDMTW8kmPl2UB5D1sF40Tu
 uM03ovSVTHJwsvkx9d8YB7flWOapgyfPHwSqiNaQ/fCjN15McXvaXi4veBTnmDuEJ1GOgdfWDuQ
 oUsCRYKQ8uf/p1yfvGE8K5iYtiUSg/gFfFjVOpiEVd4Xskas9SEgqzw7nYDkTD7qlkuHrva74Is
 N7fcspVDsWiVNYu6TTIbFcxLPFps3ywkydrdGQUnyhgjCdNmUB25gpEkXR97xXcJLZAmElUh/2O
 yZksQJKKATTe2WqQON1lBQ1r1GDS8kDOGr8ONluGjT+Tq3jE+ft9aMSKjfVaKvhF0X3Mi6/D1X3
 p1NKBvugL4qH7jqE93xXxqZnWK26Ty/IOu4p0I3TNQFTnKGIsRBVx1JZgRQ==
X-Google-Smtp-Source: AGHT+IFRJMxckO2ZQvxVzuz0BTX9q93fp894dtK/TcLSk4gRDmqByiX9UXubFC3KSQukPV9ZDJz60Q==
X-Received: by 2002:a05:622a:1825:b0:4a9:94c7:f34f with SMTP id
 d75a77b69052e-4a9dec94b7amr59291501cf.21.1752091135769; 
 Wed, 09 Jul 2025 12:58:55 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a9949faf39sm103584281cf.28.2025.07.09.12.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 12:58:55 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH 00/10] rust: use `core::ffi::CStr` method names
Date: Wed, 09 Jul 2025 15:58:50 -0400
Message-Id: <20250709-core-cstr-fanout-1-v1-0-fd793b3e58a2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPrJbmgC/02OzQ7CIBAGX6XZsySwpaz0VYwHfhblYKvQGpOm7
 y5RDx5nk51vNqhcMlcYuw0KP3PN89RAHToIVzddWOTYGFDiIElaEebCItSliOSmeV2EEgmlUer
 YIxJCe7wXTvn1kZ7OXy78WJt7+R7Bu9ok8+2Wl7EjY7lH7Y3xMlqMUqdeDVEGPTiZCKmnQNpq+
 G8au1+R/itqQ3fXwHrLxpGPA/H4VHDe9zfyzQPq6QAAAA==
X-Change-ID: 20250709-core-cstr-fanout-1-f20611832272
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Breno Leitao <leitao@debian.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1752091132; l=2312;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=nBlkFnTcckjF5CbJjPS9IWrVMsJlh81nI5aNSP2eMQM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QL+jEyeJUnwusSTpkUHLNcdvrxo7ekehQIgOJYoy7eGmGdn3FOTGxYt4+VTVEjFPwFYmYhRb1/P
 mWbFKLWIEewY=
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

This is series 2b/5 of the migration to `core::ffi::CStr`[0].
20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com.

This series depends on the prior series[0] and is intended to go through
the rust tree to reduce the number of release cycles required to
complete the work.

Subsystem maintainers: I would appreciate your `Acked-by`s so that this
can be taken through Miguel's tree (where the other series must go).

[0] https://lore.kernel.org/all/20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com/

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Tamir Duberstein (10):
      gpu: nova-core: use `core::ffi::CStr` method names
      rust: auxiliary: use `core::ffi::CStr` method names
      rust: configfs: use `core::ffi::CStr` method names
      rust: cpufreq: use `core::ffi::CStr` method names
      rust: drm: use `core::ffi::CStr` method names
      rust: firmware: use `core::ffi::CStr` method names
      rust: kunit: use `core::ffi::CStr` method names
      rust: miscdevice: use `core::ffi::CStr` method names
      rust: net: use `core::ffi::CStr` method names
      rust: of: use `core::ffi::CStr` method names

 drivers/gpu/drm/drm_panic_qr.rs | 2 +-
 rust/kernel/auxiliary.rs        | 4 ++--
 rust/kernel/configfs.rs         | 4 ++--
 rust/kernel/cpufreq.rs          | 2 +-
 rust/kernel/drm/device.rs       | 4 ++--
 rust/kernel/firmware.rs         | 2 +-
 rust/kernel/kunit.rs            | 6 +++---
 rust/kernel/miscdevice.rs       | 2 +-
 rust/kernel/net/phy.rs          | 2 +-
 rust/kernel/of.rs               | 2 +-
 samples/rust/rust_configfs.rs   | 2 +-
 11 files changed, 16 insertions(+), 16 deletions(-)
---
base-commit: 769e324b66b0d92d04f315d0c45a0f72737c7494
change-id: 20250709-core-cstr-fanout-1-f20611832272
prerequisite-change-id: 20250704-core-cstr-prepare-9b9e6a7bd57e:v1
prerequisite-patch-id: 83b1239d1805f206711a5a936bbb61c83227d573
prerequisite-patch-id: a0355dd0efcc945b0565dc4e5a0f42b5a3d29c7e
prerequisite-patch-id: 8585bf441cfab705181f5606c63483c2e88d25aa
prerequisite-patch-id: 04ec344c0bc23f90dbeac10afe26df1a86ce53ec
prerequisite-patch-id: a2fc6cd05fce6d6da8d401e9f8a905bb5c0b2f27
prerequisite-patch-id: f14c099c87562069f25fb7aea6d9aae4086c49a8

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

