Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD3ECAB27E
	for <lists+dri-devel@lfdr.de>; Sun, 07 Dec 2025 08:27:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEBD610E170;
	Sun,  7 Dec 2025 07:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GLnQeBLt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082AF10E170
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Dec 2025 07:26:55 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-297e264528aso33578285ad.2
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Dec 2025 23:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765092414; x=1765697214; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tEK2eF1M99CkbnJ4lJKZbSTlkLnJNDGKuxnzg8A0N00=;
 b=GLnQeBLtWZv3gDGV9xxr9TYbu/aCOd3Pf/x6lbbReNmJccAxxyu+nBfoPV48LR0Nhh
 MVsD7OaWzU03JRg0u4vKdTR70fs4/CRr13CD96ICh4Dk7lCnOUkmUfHw5v8d6Rsaks7L
 BIzFsoasDh24an7PcyDWg2A81nSb6LihadR/1lDXPaaCwwZrClOdp5GitUKyj0JP+lHJ
 CRC8hg2ddNKq/0I0mHkRDC8atAiR8MvdiCOFEtO1sHY4Jh18+p+Erfc7nh/mRSenzF88
 8Mz/0yaHDgcqJTIL1nnsYaW92QfpoGHLYjyiMcGVGwSFIIZqp6l9p/WlmFziPLsprO0M
 N4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765092414; x=1765697214;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tEK2eF1M99CkbnJ4lJKZbSTlkLnJNDGKuxnzg8A0N00=;
 b=vwKW3kLXrBVdjYqwrvdISjmuMR6UGJmqSfBWvRqamzmyQ/wO0R3gCN4OJc5qNXZ4Zf
 wbzZ1eXuiZaxjUjrWmkekILwaNAAALzmGJcERsoxuh1dpz2vlLaMOzo0N6OasksRSR5n
 93ynfvQ/rla0CqYbiRAYxJ2QzysoTqwzj0rPnfkYuoD+HzfmbJvKYB/H97FzqCIedskk
 L0cwmGdbNyZjqe1FXeLxBw3HW/D+NPC3CWk2dP7XQiULQbi4TEUA6gjYZ/JZDX1pvczE
 +e72dNQVRj+iu4RhOjGyfN1kOWB02AP71MB1rLeKEtyqDVAZvWMJmhGp6dSUoGtAwf7O
 DAKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoc+LD11GIUM1/FBjbcRuZNbamYF3FcFjXIbxod3gEsks5jqnR4I8Km6mx/ZaqaP34F/s2iE9WRSU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvzeKBqmjbgWlrVR5EB3rGpAYlTXtWCduDXUuOkkFHSrRAPyER
 37BDj7vTmMj3VCBV6WiXHNDfkTVYFbA1NlIv1Z9hwlQE18jv9JZ5JC1g
X-Gm-Gg: ASbGnct0zcyT2Y6qSTvEdQKilKhPWjBY3LK5cz5AKo4ifLm/unp+y/66DlSWdkqYHZD
 CsLe51f9/vUas1a1qBbggoXk0aNWE+tzNhIUdx82AeyFhycvsWyZLa6t+DOUk7e4qrbindgs0XL
 hl0ZRzp37nf92h0Gcxe6eFZB63CDk350/1jMQwkO/n+uY/SKmYU0HfLyI5oY5Oclrx5h/UC6Y3s
 gc2t0V4SD1xCasPIOYo5ToJ8upUkft/He9orY/IGPKwpz8NiswGP50opQzKdPAwaT+i1EGdTiqB
 gdPC1mxXu01l5BPqxK/4FmaN7cntvte2UEejwl/w2ncp+5jIT46Xs23D7QULX2JdwYIsYliPFX8
 p93pmRKa1va2+wafZz9WB5LnGh2NgQLcry9pf7ed7LZaITDKarL9xxXW6YJqJedq+NrIdSiMSJR
 A/4RlgyKLiHg==
X-Google-Smtp-Source: AGHT+IFZ1X99wA8hRN/ZGpHPSkBafJxesyhbybcnYCATbgOcM4F6190itrl1yOrpl2KdPdZRHijNHA==
X-Received: by 2002:a17:903:2381:b0:299:fc47:d7d7 with SMTP id
 d9443c01a7336-29df579eb2emr38062925ad.3.1765092414366; 
 Sat, 06 Dec 2025 23:26:54 -0800 (PST)
Received: from lgs.. ([101.76.246.176]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29daeaabf8asm90338325ad.85.2025.12.06.23.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Dec 2025 23:26:53 -0800 (PST)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Antonino Daplas <adaplas@gmail.com>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] riva/fbdev: fix divide error in nv3_arb()
Date: Sun,  7 Dec 2025 15:25:32 +0800
Message-ID: <20251207072532.518547-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
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

A userspace program can trigger the RIVA NV3 arbitration code by
calling the FBIOPUT_VSCREENINFO ioctl on /dev/fb*. When doing so,
the driver recomputes FIFO arbitration parameters in nv3_arb(), using
state->mclk_khz (derived from the PRAMDAC MCLK PLL) as a divisor
without validating it first.

In a normal setup, state->mclk_khz is provided by the real hardware
and is non-zero. However, an attacker can construct a malicious or
misconfigured device (e.g. a crafted/emulated PCI device) that exposes
a bogus PLL configuration, causing state->mclk_khz to become zero.
Once nv3_get_param() calls nv3_arb(), the division by state->mclk_khz in
the gns calculation causes a divide error and crashes the kernel.

Fix this by checking whether state->mclk_khz is zero and bailing out before doing the division.

The following log reveals it:

rivafb: setting virtual Y resolution to 2184
divide error: 0000 [#1] PREEMPT SMP KASAN PTI
CPU: 0 PID: 2187 Comm: syz-executor.0 Not tainted 5.18.0-rc1+ #1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
RIP: 0010:nv3_arb drivers/video/fbdev/riva/riva_hw.c:439 [inline]
RIP: 0010:nv3_get_param+0x3ab/0x13b0 drivers/video/fbdev/riva/riva_hw.c:546
Code: c1 e8 03 42 0f b6 14 38 48 89 f8 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 b7 0e 00 00 41 8b 46 18 01 d8 69 c0 40 42 0f 00 99 <41> f7 fc 48 63 c8 4c 89 e8 48 c1 e8 03 42 0f b6 14 38 4c 89 e8 83
RSP: 0018:ffff888013b2f318 EFLAGS: 00010206
RAX: 0000000001d905c0 RBX: 0000000000000016 RCX: 0000000000040000
RDX: 0000000000000000 RSI: 0000000000000080 RDI: ffff888013b2f6f0
RBP: 0000000000000002 R08: ffffffff82226288 R09: 0000000000000001
R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000000
R13: ffff888013b2f4d8 R14: ffff888013b2f6d8 R15: dffffc0000000000
Call Trace:
  nv3CalcArbitration.constprop.0+0x255/0x460 drivers/video/fbdev/riva/riva_hw.c:603
  nv3UpdateArbitrationSettings drivers/video/fbdev/riva/riva_hw.c:637 [inline]
  CalcStateExt+0x447/0x1b90 drivers/video/fbdev/riva/riva_hw.c:1246
  riva_load_video_mode+0x8a9/0xea0 drivers/video/fbdev/riva/fbdev.c:779
  rivafb_set_par+0xc0/0x5f0 drivers/video/fbdev/riva/fbdev.c:1196
  fb_set_var+0x604/0xeb0 drivers/video/fbdev/core/fbmem.c:1033
  do_fb_ioctl+0x234/0x670 drivers/video/fbdev/core/fbmem.c:1109
  fb_ioctl+0xdd/0x130 drivers/video/fbdev/core/fbmem.c:1188
  __x64_sys_ioctl+0x122/0x190 fs/ioctl.c:856

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/video/fbdev/riva/riva_hw.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/riva/riva_hw.c b/drivers/video/fbdev/riva/riva_hw.c
index 8b829b720064..d70c6c4d28e8 100644
--- a/drivers/video/fbdev/riva/riva_hw.c
+++ b/drivers/video/fbdev/riva/riva_hw.c
@@ -436,6 +436,9 @@ static char nv3_arb(nv3_fifo_info * res_info, nv3_sim_state * state,  nv3_arb_in
     vmisses = 2;
     eburst_size = state->memory_width * 1;
     mburst_size = 32;
+	if (!state->mclk_khz)
+		return (0);
+
     gns = 1000000 * (gmisses*state->mem_page_miss + state->mem_latency)/state->mclk_khz;
     ainfo->by_gfacc = gns*ainfo->gdrain_rate/1000000;
     ainfo->wcmocc = 0;
-- 
2.43.0

