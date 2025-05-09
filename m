Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32734AB089F
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 05:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C0210E0CE;
	Fri,  9 May 2025 03:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l8HXUN5f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6896F10E0CE;
 Fri,  9 May 2025 03:16:09 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 006d021491bc7-601ad30bc0cso1791402eaf.0; 
 Thu, 08 May 2025 20:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746760568; x=1747365368; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sTOwig8lTDkxPKMgyzizdRYq4XG3E64o3g/lB7m6NZU=;
 b=l8HXUN5fyzRVTbCFF8bRpD0SAyw1H1c+TpyN1kw42SP2nxOuGAniqlPfNOQg3IOC/H
 tEVgZ4c5UR4Uv3g+0ukq6rLQMH6/n6DbmTZ8TSRc9ZNIVLsqUx3am7BORc5s0eRLkrG8
 Oo0Ens0NHVkE47hTjGGPW9zwvtR5QauU5lxeW01t8hxUuOaEjoRXGwnkMAL1L+MgZqb0
 QBn7IwuaM5kJ+05CtYsTwkdm4VkysyW/bpd15B4rfI5feyh4FF3Wl0456l6/gKMJULjX
 Ybt4bHMDwjkG3s0mxdz+NguSa+8khjtqE0TTkW+uVtWimfKM1h695xhd0qBvVdzzrk1J
 X2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746760568; x=1747365368;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sTOwig8lTDkxPKMgyzizdRYq4XG3E64o3g/lB7m6NZU=;
 b=eJ7rb/J0JGAUh6ocVzTOX/4cgmIS8awaEJhEio4WRI7w2qrlJPQ5z2+gX3VWCLDJdR
 fiyUD7oAfjX246OHINjrpAZyqwBCFLPeTvuw+Ak6phTh5n2+IqNFBVhAu6emYZeNBOpS
 JVw4tVDMyIOm1c8k3Ler9EEuuCzktmKjyEiUYwpvwCyr/d3t0XpgkceTwpB+HYwEpfIg
 9jtQq1U9n2OA1d3MmVkiAc1+m4mcX9peZKD2Ko58mxrmYHX48qvbOD2fgYtaK8Xxlzn5
 +EYQxbOZzRVg19ChLjTaaOzOFuOJbt9uX4vduQIzZ8InPLnyToKe0s5t5dmwASpnzwr9
 n+2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4sfjKVxLV4lVkDNskG3LIRm8kym8MSSPG58UXS7uMnu69OXgA6vwP7CaHUgNPu+535frEb5QwGUQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJWytezzQtp/CUIEUCvJvg1z4EpjrLwkYE7MxludQIdHuPfZQW
 mBP8vIoZPgKOgd7i4FaEfGP2a0msQ2r9JHdfHBnJHKi7FEmPIprh
X-Gm-Gg: ASbGncvWplLuZfRCmC4iHQq75fhpFYGGMijlN/G3HK1MG1y8sJf96XinQ7myNMzw60r
 b1lHVeSNT9aGEiAXh8yblrh3V/8yO4VTCwRLQgo4uYGgNO5zWTGaZAKsFvaBKI9vqbAsCZ4shLJ
 v0IW+L0FCHsoK3ylKPWW4Q3Cjjg4UlR8my6iTCvaLNAGGgm5jF8mn692FY/zK/bYFudzjjPKHib
 mAoHdh9pCSMznEESvlKNgQLBNOPnJDaB2U1nZBazPMScjDS8n18B4hb97/fqdEf3pS+kC8pxem0
 B/dd+AjWi7CFZZN3CPr/J+0cE01U2lsbPOGHt3v31G5kE8X2B9lCUB+YVVa5zVtexG7BL4FeCWw
 TsmtHcHqHZNfR
X-Google-Smtp-Source: AGHT+IFabaKG5IMI4f6lw/FzmXhfD/qA1aN2NZHwCsMXYiRNwWJ9KzD39S8IFVi2DsYvBD60grQSJw==
X-Received: by 2002:a05:6820:208c:b0:604:99a6:4e90 with SMTP id
 006d021491bc7-60868ad8738mr995531eaf.0.1746760568573; 
 Thu, 08 May 2025 20:16:08 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net.
 [73.76.29.249]) by smtp.googlemail.com with ESMTPSA id
 006d021491bc7-60842b096desm303745eaf.30.2025.05.08.20.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 20:16:07 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 akpm@linux-foundation.org, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, gregkh@linuxfoundation.org, rafael@kernel.org,
 bhelgaas@google.com, kwilczynski@kernel.org, raag.jadav@intel.com,
 andriy.shevchenko@linux.intel.com, arnd@arndb.de, me@kloenk.dev,
 andrewjballance@gmail.com, fujita.tomonori@gmail.com,
 daniel.almeida@collabora.com
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: [PATCH 00/11] rust: add support for Port io
Date: Thu,  8 May 2025 22:15:13 -0500
Message-ID: <20250509031524.2604087-1-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

currently the rust `Io` type maps to the c read{b, w, l, q}/write{b, w, l, q}
functions and have no support for port io.this is a problem for pci::Bar
because the pointer returned by pci_iomap is expected to accessed with
the ioread/iowrite api [0].

this patch series splits the `Io` type into `Io`, `PortIo` and `MMIo`.and,
updates pci::Bar, as suggested in the zulip[1], so that it is generic over
Io and, a user can optionally give a compile time hint about the type of io. 

Link: https://docs.kernel.org/6.11/driver-api/pci/pci.html#c.pci_iomap [0]
Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/.60IoRaw.60.20and.20.60usize.60/near/514788730 [1]

Andrew Ballance (6):
  rust: io: add new Io type
  rust: io: add from_raw_cookie functions
  rust: pci: make Bar generic over Io
  samples: rust: rust_driver_pci: update to use new bar and io api
  gpu: nova-core: update to use the new bar and io api
  rust: devres: fix doctest

Fiona Behrens (5):
  rust: helpers: io: use macro to generate io accessor functions
  rust: io: Replace Io with MMIo using IoAccess trait
  rust: io: implement Debug for IoRaw and add some doctests
  rust: io: add PortIo
  io: move PIO_OFFSET to linux/io.h

 drivers/gpu/nova-core/driver.rs |   4 +-
 drivers/gpu/nova-core/regs.rs   |   1 +
 include/linux/io.h              |  13 +
 lib/iomap.c                     |  13 -
 rust/helpers/io.c               | 132 +++---
 rust/kernel/devres.rs           |   4 +-
 rust/kernel/io.rs               | 753 +++++++++++++++++++++++++-------
 rust/kernel/pci.rs              |  88 +++-
 samples/rust/rust_driver_pci.rs |   6 +-
 9 files changed, 731 insertions(+), 283 deletions(-)


base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
-- 
2.49.0

