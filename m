Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3670A40FCC
	for <lists+dri-devel@lfdr.de>; Sun, 23 Feb 2025 17:42:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B81310E028;
	Sun, 23 Feb 2025 16:42:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UdAjPkO3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F1710E028
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 16:42:48 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2fa48404207so7514059a91.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 08:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740328968; x=1740933768; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cC9XqKWpwoW6kaiQnMTAJRMWrDuUOdRDnNZLQfAjkgk=;
 b=UdAjPkO3cfmD+pQvNzXGV9Du2U9gLTFtiR471hsFL60ixyRjgz2dGHQPnnR4R4DGVt
 xrPZ3zuT9fMP+LBb31gc9LScHxXLhHB/xaKrF2n49uqB4bpijpG0rxONybnmkRagGC5z
 0T/58WEPtiO7Ul0vjC02gZkWX2WTHDlTcvHPypD9HO2Gjh2LWtaHt9yikTV0X3FJuGIp
 XtUcFuByACg/pHRJ1DjHEyxsdjfcLF08CJr9PyJbE+TFYHWZ55mW06t4xJ5L6eb3YLmW
 blNFAqtxSn42Uje9BZX031D9o1HO9OdLI5jjr2AbkO1RDXrT8eoTkrsvWryB+u3AVZVT
 nkgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740328968; x=1740933768;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cC9XqKWpwoW6kaiQnMTAJRMWrDuUOdRDnNZLQfAjkgk=;
 b=iNQhkEKEUeQaKbL2LMp1e3OFERTaxbgv9DI2Lq4KAzs844sbE9I9FnJrjTrqhgA5xo
 rAiViRza/f/bTf05ugI+fPVlAq/GOfst+AwrjNj/Xw95C6sLECSxPFc0BJ6sukCt8U+v
 OGFYWOx1Pfa9Eh2MM5dbuNszDqZ8kLzxO7Kh4sTh87mmmDrKOS83pSBVYgu2a2lH8KI9
 BhhB/q4RxpbJHQEMuGjgkeW5HKa3Sh6V12/d+QilU0GpjcO5AAzjwmglgxmBT2uZXE9B
 s+tOfZtAKFRIHqNnJBucg/YE+msDyi1sq1n7EE/p6DsxRDNn3Ggy8XQzBnFju0OpMB1k
 6MOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUy9AA0efl/tT2UWKUkSwIcL/gP4zT0Grb9cidOpKQk/ZJ76NBQm9g1csu1FYBYcMUAsaz3a8LPWr4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeFk7b8/ZfAxrVxX3mFLE/x+pTDT2ltFLwhMITmLzBz8HWFLMI
 +oUE3kRBBfxT3rXYNrYI9EuuxzgGwppR40C9ten6FmAytz6iqXuq
X-Gm-Gg: ASbGncvSuuG7LNrLXTbu6Qv0K0Tszcwj5REqbVokkqx2eMn9tpANVjzTv6TuyepRSOw
 KoquNRou16JC01NbgUjdbN/ke2IdobUizrcvRRHvGtPudJRSAXSctQLZLN8QPJBMA1hNd8gy4Fu
 7t3nUSf0xW4EUwE424WQWTKhDOMOEaUsNldVTvCwiNIow35hQhyUkrNAsZzDqdQexDGY/pNm8p1
 ZBNPuxFgySnm3YvWorK1qiVjuN+aybk0ySMVhh4thY3t482ffurB+V6YjZw9RztDzYOB3cHQwKh
 SvVVgBNiqhY7AMns+SG1UmAJ4aoFrDqTKd1Av6bxFAROMBfBBxO6FDB5
X-Google-Smtp-Source: AGHT+IE9IoeqkqZm6OQjrr5kPJ0U3iRTenWYdpH7xXhEtXcp87aYt41gR2kUOpfxylsV56aTy8WbdA==
X-Received: by 2002:a17:90b:2e44:b0:2f5:63a:44f9 with SMTP id
 98e67ed59e1d1-2fce7b0acaamr15072669a91.23.1740328967814; 
 Sun, 23 Feb 2025 08:42:47 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 08:42:47 -0800 (PST)
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
 Kuan-Wei Chiu <visitorckw@gmail.com>, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH 00/17] Introduce and use generic parity32/64 helper
Date: Mon, 24 Feb 2025 00:42:00 +0800
Message-Id: <20250223164217.2139331-1-visitorckw@gmail.com>
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
calculations for 32-bit and 64-bit values. Introduces generic
parity32() and parity64() helpers in bitops.h, providing a standardized
and optimized implementation.  

Subsequent patches refactor various kernel components to replace
open-coded parity calculations with the new helpers, reducing code
duplication and improving maintainability.  

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>

Kuan-Wei Chiu (17):
  bitops: Add generic parity calculation for u32
  bitops: Add generic parity calculation for u64
  x86: Replace open-coded parity calculation with parity8()
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
  rm/bridge: dw-hdmi: Replace open-coded parity calculation with
    parity32()
  mtd: ssfdc: Replace open-coded parity calculation with parity32()
  fsi: i2cr: Replace open-coded parity calculation with parity32()
  fsi: i2cr: Replace open-coded parity calculation with parity64()
  Input: joystick - Replace open-coded parity calculation with
    parity64()
  nfp: bpf: Replace open-coded parity calculation with parity64()

 arch/x86/kernel/bootflag.c                    | 18 ++------
 drivers/fsi/fsi-master-i2cr.c                 | 18 ++------
 .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   |  8 +---
 drivers/input/joystick/grip_mp.c              | 17 +-------
 drivers/input/joystick/sidewinder.c           | 24 +++--------
 drivers/media/i2c/saa7115.c                   | 12 +-----
 drivers/media/pci/cx18/cx18-av-vbi.c          | 12 +-----
 .../media/test-drivers/vivid/vivid-vbi-gen.c  |  8 +---
 drivers/mtd/ssfdc.c                           | 17 +-------
 drivers/net/ethernet/netronome/nfp/nfp_asm.c  |  7 +--
 drivers/net/ethernet/oa_tc6.c                 | 19 ++------
 .../broadcom/brcm80211/brcmsmac/dma.c         | 16 +------
 drivers/tty/serial/max3100.c                  |  3 +-
 include/linux/bitops.h                        | 43 +++++++++++++++++++
 lib/bch.c                                     | 14 +-----
 15 files changed, 74 insertions(+), 162 deletions(-)

-- 
2.34.1

