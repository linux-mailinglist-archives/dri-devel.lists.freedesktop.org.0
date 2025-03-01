Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6572A4ABAE
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 15:25:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EFCF10E057;
	Sat,  1 Mar 2025 14:25:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ecumfcU1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D9A10E057
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 14:25:15 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-223959039f4so3584445ad.3
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 06:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740839115; x=1741443915; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DNP1gcd9iHRxzh69rYhVl4jkjT7XmE00fWzfP312xis=;
 b=ecumfcU1z8RjJwcA70MSDY1y/wNxw7nFV5UX7PBNKkG0gmBxxgf8GvtVUjveF2dIP0
 EnDVl1k7ASK/SxmnmLldmyQjC9IwaFlSxmmPvquXNo2hoxaJZwi5v57tasF6q1t4M1/d
 8sU4o83rJ/6mBdHzSKbKVAuph1g8nLXzdCwWcWE2hLzQdnrggcqBTZ69ebEvp3zYk097
 zUJwsVCVljfzbi4XLsCrryxnRHKiFzh2M6BdViEZekueWmG2K6J90hB01tn9PzUTTsAD
 5gDKeZ9zcqjXZ3JfhtRmpg9fPPycnfb8yK1fIobPq3sw1fkr96MIiLQeZ5dtyNf3xYsi
 50JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740839115; x=1741443915;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DNP1gcd9iHRxzh69rYhVl4jkjT7XmE00fWzfP312xis=;
 b=XJAmT99OFs/iQX/wGnE1/8LS3wO239EnvF/OPD+N/toRSAlGDYacTUBaJA4EKVQ2HJ
 iNNy5qcM02CJKdUczxXPBsBT3/6xvMeSw340qUsTQtymfZerJcGMCWO1K9Im4FRZc4Qc
 zKlRLqHERc5ahuII/+j8uSr40qa5gu/XSsVOrliqIDXF/GJKtClD/txWZYUyk8urqTOX
 kBrQfieyPCBLUm+IDExhK/xilsP9vN+x4CcjrK7dSv33wmA4WHK1tKc/nCPQVvFdZ1qu
 CjNCe9W/Wvyc+O7FDCkwzbNE0wWj3b8nImtYFJKvRtOidN1VDXBU2RDtQtYIHni4LOAH
 mLCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVC8v4ZPUUvDxWQrfgE01vvhC4fKtfAMbgGOnYesjzHe4ZMTWWpYXMhxixMAgt10w05IGon9MV8KXo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+FMTDg6STbNCy8J3f4lVKe9eMxjtCC/hgXwI8G95Dk5fZTQjk
 ZVmkf37+Q5yYk9rkwzG1I82z8xqrbs6SMwUmjWECvm6APAOBvoXQ
X-Gm-Gg: ASbGncujrJh5lJyl6+lp2bMBDAiaagUkBv0Aq/C46oFkh+oTrx2JqkZlcnLsSV6Qnyr
 PnJ3tPNiO+MMLBnVgUE2ZQT9DhMSnCx+V898Y7FKH31MObyFNmf5iAMK1BIyw03Nx//zJ0D/l3g
 6asIxf7I5ZcdkG8E2DW1tlFJPhjtysi7okWb1cYkX60vYVi4Jw5JyxarAg07xTr1EYaMnXb0LP/
 kJ7oFU4rNJwBxXzNJulAOlnUa34sO6mlnkEatC4yRv5GhgdnvfneG8xK6Q7emcRPLCk/MPFSCwb
 OtfDmanVWDXzMYpjrKwMRCcL1sLsUcrMxv2sbfvQQQbEQ++1LTd+bDOFdRPc2OVQ2P4m5QNQnNc
 =
X-Google-Smtp-Source: AGHT+IFmQ7+Wt4EJx82M81pMqmqG6vjS1UaCqAsjmQIBhBcvOofXBIwpdWFf7GWkoh7LWsBn9NTlfg==
X-Received: by 2002:a17:902:c948:b0:220:d79f:60f1 with SMTP id
 d9443c01a7336-2236920765bmr101611195ad.42.1740839114994; 
 Sat, 01 Mar 2025 06:25:14 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 06:25:14 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
 eajames@linux.ibm.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
 hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, yury.norov@gmail.com, akpm@linux-foundation.org
Cc: hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
 Kuan-Wei Chiu <visitorckw@gmail.com>, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v2 00/18] Introduce and use generic parity16/32/64 helper
Date: Sat,  1 Mar 2025 22:23:51 +0800
Message-Id: <20250301142409.2513835-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Several parts of the kernel contain redundant implementations of parity
calculations for 16/32/64-bit values. Introduces generic
parity16/32/64() helpers in bitops.h, providing a standardized
and optimized implementation.  

Subsequent patches refactor various kernel components to replace
open-coded parity calculations with the new helpers, reducing code
duplication and improving maintainability.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---

This patch series is based on next-20250228.

Changes in v2:
- Provide fallback functions for __builtin_parity() when the compiler
  decides not to inline it
- Use __builtin_parity() when no architecture-specific implementation
  is available
- Optimize for constant folding when val is a compile-time constant
- Add a generic parity() macro
- Drop the x86 bootflag conversion patch since it has been merged into
  the tip tree

Kuan-Wei Chiu (18):
  lib/parity: Add __builtin_parity() fallback implementations
  bitops: Optimize parity8() using __builtin_parity()
  bitops: Add parity16(), parity32(), and parity64() helpers
  media: media/test_drivers: Replace open-coded parity calculation with
    parity8()
  media: pci: cx18-av-vbi: Replace open-coded parity calculation with
    parity8()
  media: saa7115: Replace open-coded parity calculation with parity8()
  serial: max3100: Replace open-coded parity calculation with parity8()
  lib/bch: Replace open-coded parity calculation with parity32()
  Input: joystick - Replace open-coded parity calculation with
    parity32()
  net: ethernet: oa_tc6: Replace open-coded parity calculation with
    parity32()
  wifi: brcm80211: Replace open-coded parity calculation with parity32()
  drm/bridge: dw-hdmi: Replace open-coded parity calculation with
    parity32()
  mtd: ssfdc: Replace open-coded parity calculation with parity32()
  fsi: i2cr: Replace open-coded parity calculation with parity32()
  fsi: i2cr: Replace open-coded parity calculation with parity64()
  Input: joystick - Replace open-coded parity calculation with
    parity64()
  nfp: bpf: Replace open-coded parity calculation with parity64()
  bitops: Add parity() macro for automatic type-based selection

 drivers/fsi/fsi-master-i2cr.c                 |  18 +--
 .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   |   8 +-
 drivers/input/joystick/grip_mp.c              |  17 +--
 drivers/input/joystick/sidewinder.c           |  24 +---
 drivers/media/i2c/saa7115.c                   |  12 +-
 drivers/media/pci/cx18/cx18-av-vbi.c          |  12 +-
 .../media/test-drivers/vivid/vivid-vbi-gen.c  |   8 +-
 drivers/mtd/ssfdc.c                           |  17 +--
 drivers/net/ethernet/netronome/nfp/nfp_asm.c  |   7 +-
 drivers/net/ethernet/oa_tc6.c                 |  19 +--
 .../broadcom/brcm80211/brcmsmac/dma.c         |  16 +--
 drivers/tty/serial/max3100.c                  |   3 +-
 include/linux/bitops.h                        | 115 ++++++++++++++++--
 lib/Makefile                                  |   2 +-
 lib/bch.c                                     |  14 +--
 lib/parity.c                                  |  48 ++++++++
 16 files changed, 185 insertions(+), 155 deletions(-)
 create mode 100644 lib/parity.c

-- 
2.34.1

