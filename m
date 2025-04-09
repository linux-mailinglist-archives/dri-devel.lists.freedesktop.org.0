Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA00DA82AD9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 17:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02AC910E06E;
	Wed,  9 Apr 2025 15:44:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IaAnlim7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A820F10E06E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 15:44:31 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-3014678689aso5917239a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 08:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744213471; x=1744818271; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MUUuTxOiF/e6pFbiGJ55Vd+VaZOP/yQaXFZJe/XlPzE=;
 b=IaAnlim7ihlw0dZjzJDnLp5E/eK5GHUePBjQRH8YNneqGhzm6iQi6WJ3lhbSvziuR9
 zq7AdchIn+pP0vO1171fp/hZTGVVX3e8RrBeaSktKfVkifPP0+aRT7iU0neAat0k/CPw
 ujIHL1M4LKacPX7Xacy2z06eDqyDpRsl1pQWYql2Q9xpSESGkWjEvdC9jVPh8LJBNS3Z
 ds8zOp5YFHw8hfAHl1tWOLDdYCxZ93pko4b6qYOZ34/N9JlwMZpoQfGDtgqGJKt0RVdi
 yY26z8rqr5eLybtjDMu69mzgWjklCelEkUQ6Ov5kHBZMAKt7pjfTgzSC4Sht5hnbGh4R
 9COg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744213471; x=1744818271;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MUUuTxOiF/e6pFbiGJ55Vd+VaZOP/yQaXFZJe/XlPzE=;
 b=R1EgmT5IqUObrstypqVHdcSMT7KCE81EU/F/8TMioOqPsrOQg7uVGp1cnKr9uhmlve
 /jwKC9cne+dWjuQD/7FFk0/8CrZhmEOdv25QTgF7rU5bCIwCaVTyBRtTt2ldKgU1NuDi
 9RxCnb31I15+hwNw6ArGEXasNHJfWExaiyzlYDPbgcducFUUYvMDNdbufjOg47cdpjZl
 imzHsrleTMLGyndwdtuqPsHw6IfjowFWL3p6CN8RZZx0Aa/eeiQbV+Y2oDtF/QazkRyb
 UljRaUrvG2PWAw9TKGS/4uZyxPdEoHbzjQ5yxRGAgE6zOyDPtoqT9IvOCDpdSei1NFf7
 joAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQPp8o8aU1ShES6LSEBhyb/E0zkFQkCJDFbnzfq3en4kQw2/VvoebCeodWAK/4gpwx+dujfx5rPRA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx54YdGfJymr8rC4cHnx2GpS+BThQj76Mqqj6YBhaHHflrRbViD
 5SsyxvSaGhTvUPIgSOmT1+5kPeY3JwbEGAh3/Jgn5SHt+DL01uNK
X-Gm-Gg: ASbGncvAGL4KgCHolqsMHZ+eZSRkgBSXK4qxUW6e3TtY+bzkc5xmvktbjKLGIBzKRxz
 O4BSfWk2hK1cr9W6TJ9LndPdUJErrSKdq9Bx8M3JN8ecjEhXaRtbJEdcIddrYpfjayw5xmSCl6e
 D1zIlBxa5dWLWQva03/EhJWejsPP5QYBgQsB95MA69yXlAjWIzSrd/VvW6MvMyqrYVeEGJXidFt
 4jBwWU+PchKVjOGYTYskUQELPZXuJbkeZTrS5CJlXP93cOu/N8y3YyCvzWgOUCbE8IpAeM+Zkz3
 d/rFMLvGYszh4Ih3NtkmLrGHPwmfPxBJbCegqZEMYGxf2hn5XB/fKgOcTtnAzyDoAWpJK8g=
X-Google-Smtp-Source: AGHT+IGnoEozOknyoC6We3L6wSu5LW5c8+l3K2S+PrKsnw7nWoi0Lt21fMnvhITP0Puz6RwfcrL34g==
X-Received: by 2002:a17:90a:d884:b0:2f9:cf97:56ac with SMTP id
 98e67ed59e1d1-306dd1719cfmr5116718a91.0.1744213470998; 
 Wed, 09 Apr 2025 08:44:30 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 08:44:30 -0700 (PDT)
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
 jirislaby@kernel.org, yury.norov@gmail.com, akpm@linux-foundation.org,
 jdelvare@suse.com, linux@roeck-us.net, alexandre.belloni@bootlin.com,
 pgaj@cadence.com
Cc: hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Frank.Li@nxp.com, linux-hwmon@vger.kernel.org,
 linux-i3c@lists.infradead.org, david.laight.linux@gmail.com,
 andrew.cooper3@citrix.com, Kuan-Wei Chiu <visitorckw@gmail.com>,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v4 00/13] Introduce parity_odd() and refactor redundant parity
 code
Date: Wed,  9 Apr 2025 23:43:43 +0800
Message-Id: <20250409154356.423512-1-visitorckw@gmail.com>
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

Several parts of the kernel contain open-coded and redundant
implementations of parity calculation. This patch series introduces
a unified helper, parity_odd(), to simplify and standardize these
cases.

The first patch renames parity8() to parity_odd(), changes its argument
type from u8 to u64 for broader applicability, and updates its return
type from int to bool to make its usage and return semantics more
intuitive-returning true for odd parity and false for even parity. It
also adds __attribute_const__ to enable compiler optimizations.

While more efficient implementations may exist, further optimization is
postponed until a use case in performance-critical paths arises.

Subsequent patches refactor various kernel components to replace
open-coded parity logic with the new helper, reducing code duplication
and improving consistency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---

To H. Peter:
I understand your preference for a parity8/16/32/64() style interface,
and I agree that such a design would better accommodate potential
arch-specific implementations. However, I suspect there are very few,
if any, users who care about the performance of parity calculations
enough to warrant such optimizations. So my inclination is to defer any
arch-specific or optimized implementations until we see parity_odd()
being used in hot paths.

Changes in v4:
- Rename parity8() to parity_odd().
- Change the argument type from u8 to u64.
- Use a single parity_odd() function.

Changes in v3:
- Avoid using __builtin_parity.
- Change return type to bool.
- Drop parity() macro.
- Change parityXX() << y to !!parityXX() << y.

Changes in v2:
- Provide fallback functions for __builtin_parity() when the compiler
  decides not to inline it
- Use __builtin_parity() when no architecture-specific implementation
  is available
- Optimize for constant folding when val is a compile-time constant
- Add a generic parity() macro
- Drop the x86 bootflag conversion patch since it has been merged into
  the tip tree

v3: https://lore.kernel.org/lkml/20250306162541.2633025-1-visitorckw@gmail.com/
v1: https://lore.kernel.org/lkml/20250223164217.2139331-1-visitorckw@gmail.com/
v2: https://lore.kernel.org/lkml/20250301142409.2513835-1-visitorckw@gmail.com/

Kuan-Wei Chiu (13):
  bitops: Change parity8() to parity_odd() with u64 input and bool
    return type
  media: media/test_drivers: Replace open-coded parity calculation with
    parity_odd()
  media: pci: cx18-av-vbi: Replace open-coded parity calculation with
    parity_odd()
  media: saa7115: Replace open-coded parity calculation with
    parity_odd()
  serial: max3100: Replace open-coded parity calculation with
    parity_odd()
  lib/bch: Replace open-coded parity calculation with parity_odd()
  Input: joystick - Replace open-coded parity calculation with
    parity_odd()
  net: ethernet: oa_tc6: Replace open-coded parity calculation with
    parity_odd()
  wifi: brcm80211: Replace open-coded parity calculation with
    parity_odd()
  drm/bridge: dw-hdmi: Replace open-coded parity calculation with
    parity_odd()
  mtd: ssfdc: Replace open-coded parity calculation with parity_odd()
  fsi: i2cr: Replace open-coded parity calculation with parity_odd()
  nfp: bpf: Replace open-coded parity calculation with parity_odd()

 arch/x86/kernel/bootflag.c                    |  4 +--
 drivers/fsi/fsi-master-i2cr.c                 | 20 +++------------
 .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   |  8 ++----
 drivers/hwmon/spd5118.c                       |  2 +-
 drivers/i3c/master/dw-i3c-master.c            |  2 +-
 drivers/i3c/master/i3c-master-cdns.c          |  2 +-
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c      |  2 +-
 drivers/input/joystick/grip_mp.c              | 17 ++-----------
 drivers/input/joystick/sidewinder.c           | 25 ++++---------------
 drivers/media/i2c/saa7115.c                   | 12 ++-------
 drivers/media/pci/cx18/cx18-av-vbi.c          | 12 ++-------
 .../media/test-drivers/vivid/vivid-vbi-gen.c  |  8 ++----
 drivers/mtd/ssfdc.c                           | 20 +++------------
 drivers/net/ethernet/netronome/nfp/nfp_asm.c  |  7 +-----
 drivers/net/ethernet/oa_tc6.c                 | 19 +++-----------
 .../broadcom/brcm80211/brcmsmac/dma.c         | 18 ++-----------
 drivers/tty/serial/max3100.c                  |  3 ++-
 include/linux/bitops.h                        | 19 ++++++++------
 lib/bch.c                                     | 14 +----------
 19 files changed, 49 insertions(+), 165 deletions(-)

-- 
2.34.1

