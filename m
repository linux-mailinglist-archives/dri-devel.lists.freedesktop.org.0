Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 583F6AB694B
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 12:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60FA710E009;
	Wed, 14 May 2025 10:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eQmBAqAI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com
 [209.85.161.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019E910E009;
 Wed, 14 May 2025 10:58:27 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id
 006d021491bc7-6065251725bso4239568eaf.1; 
 Wed, 14 May 2025 03:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747220307; x=1747825107; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C73+/+k71y7rpMEG4ZBk7iq66KMxdwH82HY220kVGsw=;
 b=eQmBAqAIv9w34wef+97Ys4W1rAK/slekEmQne7EnIdRBqRxSgqjfpa+fdfCiEA8Nz6
 pOiHtGI/QTw6KEbaeaYvsPHXc3Mc3qV2dLlv4amrJb/ukh6f4Wgn6vefXSdZKLIi+xcT
 l5YA+BFt+m/4uvmkrYpbby0m5ElHMF6JPm8Mlki3oiBmWL5hX0M3psjBWAzTaNRbbICb
 51G2+pr7CV/5+wamUQHNoibkM6HKg0mbgEvatj+CXqhJFaI403XG/4lFD/wYetscqalA
 7r6mbi37uJ1/V7aou+jntC9I183tQzkLR5+UM5auOeQwDqUFVVdew8BkrUyCaErtWnFC
 xWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747220307; x=1747825107;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C73+/+k71y7rpMEG4ZBk7iq66KMxdwH82HY220kVGsw=;
 b=M7z5oie0OIiiEgRsruCJcRZlaP1Zz85vFRcfpMoz8e0EsH2sV6/D+8uYgpAqWOxZxt
 ynUDkHQ0kDAiuthqMzktkWUMkfq4N22MynvrfFDrQ+sejxh3ZJfyUanCIcCDW88bZNgL
 KmyXW0f2Dlvq8ennFq/Ij6W5iUQwI4Kadst+CQ+EzJvI7hY8Rb7cEbnQHEUKbc/38dg9
 9lco8wLuq77Qcxwsq3jBRQ9N+SC+nmdNJ5q/XTAdQc7G+LCmjND32bZ/uhM9SZQDgCPZ
 IGUrAxeZX7e0etLZd9u/4OyhZlIuqqnTPMhq7nR1qcn7+II4bd2B4FBdA9XLmpNlAxUN
 GsQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmqZhRwK9CmLUDx4o55nf/hbC2lFfLPU3HP041FCvIYLbUVBpaNbNVKwbx7eeKthVc7Or77OZ/@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzebn9rdxZLLtou8b1PGx97DcBf51g2bhQ2AmTGw6cbBK3muVhi
 i2cz1Kv3VfGbrowZIfgIFYMHHlV93wNhMDwCmtALedC5h7fDY1Fe
X-Gm-Gg: ASbGnctbR8tT9eGc3/q9dow9VIN1OYPbtsFWYvgpWj6j1XTKeObhZBK/Qdg7PIC2Ye/
 PgAs01QEF4+GICZE+IkOkF8tFHqXNlVAAkyglW+hRveOrczGtVdEra/k+d6T9WUyoOOSFMGH+UD
 CuuB0oZJYBTMrsU+zdWEzCkVRgMGtNXyHhNbqBXu+tJIB+6GuKK47h5UOewjZ9S/vAn/9lQeqSW
 URaJxR7XIZbV8gEQXXXWPpYsyDVwE8btEtVtH/c8SfY5tLdk/XSwMBgrHl9aOruhzT16u0PvPB5
 W4/cw6ur5GD6fSuuf6OODpd4hfKOQ+2rsfKWgbbLeieOho8yNI7ZsH0M0OMn+3tLXOQQIuxY/l5
 0jv5j9zOB4/JvB6ApAGKzAJA=
X-Google-Smtp-Source: AGHT+IH5rbBVbJfVaX8PQXrPTnS8jh4TFSktnCqyB8PVszPAz+uSMgqHz+BpZJQHRVKPA8CKVmLw9w==
X-Received: by 2002:a05:6870:4150:b0:2da:843d:e530 with SMTP id
 586e51a60fabf-2e32b051a3amr1631804fac.2.1747220306876; 
 Wed, 14 May 2025 03:58:26 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net.
 [73.76.29.249]) by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-2dba060be9esm2654535fac.10.2025.05.14.03.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 03:58:26 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: dakr@kernel.org, a.hindborg@kernel.org, airlied@gmail.com,
 akpm@linux-foundation.org, alex.gaynor@gmail.com, aliceryhl@google.com,
 andrewjballance@gmail.com, andriy.shevchenko@linux.intel.com,
 arnd@arndb.de, benno.lossin@proton.me, bhelgaas@google.com,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 daniel.almeida@collabora.com, fujita.tomonori@gmail.com, gary@garyguo.net,
 gregkh@linuxfoundation.org, kwilczynski@kernel.org, me@kloenk.dev,
 ojeda@kernel.org, raag.jadav@intel.com, rafael@kernel.org, simona@ffwll.ch,
 tmgross@umich.edu
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: [PATCH v2 0/6] rust: add support for port io
Date: Wed, 14 May 2025 05:57:28 -0500
Message-ID: <20250514105734.3898411-1-andrewjballance@gmail.com>
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
functions and have no support for port io. this can be a problem for pci::Bar
because the pointer returned by pci_iomap can be either PIO or MMIO [0].

this patch series splits the `Io` type into `Io`, and `MMIo`. `Io` can be
used to access PIO or MMIO. `MMIo` can only access memory mapped IO but
might, depending on the arch, be faster than `Io`. and updates pci::Bar,
so that it is generic over Io and, a user can optionally give a compile
time hint about the type of io. 

Link: https://docs.kernel.org/6.11/driver-api/pci/pci.html#c.pci_iomap [0]

changes in v2:
  - remove `PortIo`
  - typo fixes
  - squash "fixup" patches so that patches will not introduce build fails
  - move some changes across patches so that build will not fail
  - changes macro define in rust/helpers/io.c to use full rust name
  - specialize `io_backend` for the x86 case
  - do not modify lib/iomap.c
  - rebased on v6.15-rc6

Link to v1: https://lore.kernel.org/rust-for-linux/20250509031524.2604087-1-andrewjballance@gmail.com/  

Andrew Ballance (3):
  rust: io: add new Io type
  rust: io: add from_raw_cookie functions
  rust: pci: make Bar generic over Io

Fiona Behrens (3):
  rust: helpers: io: use macro to generate io accessor functions
  rust: io: make Io use IoAccess trait
  rust: io: implement Debug for IoRaw and add some doctests

 drivers/gpu/nova-core/driver.rs |   4 +-
 drivers/gpu/nova-core/regs.rs   |   1 +
 rust/helpers/io.c               | 112 ++----
 rust/kernel/devres.rs           |   4 +-
 rust/kernel/io.rs               | 645 +++++++++++++++++++++++---------
 rust/kernel/pci.rs              | 101 +++--
 samples/rust/rust_driver_pci.rs |   6 +-
 7 files changed, 595 insertions(+), 278 deletions(-)


base-commit: 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3
-- 
2.49.0

