Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 139EDA40FDE
	for <lists+dri-devel@lfdr.de>; Sun, 23 Feb 2025 17:44:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661AC10E05A;
	Sun, 23 Feb 2025 16:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="el5ymoDF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A7310E05A
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 16:44:31 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-220d601886fso53248965ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 08:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740329071; x=1740933871; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U4Bkihj4DGACHQctYAnhtp6nEz1RGAPDBfirVsTzUzk=;
 b=el5ymoDFRELkI5LqS3GxRO9eBrqMfw+Ti2qkBPhlMxTGbuHwpNAWry7s0cJVqW1e3h
 8IzRRI3RESFV65Gfq6BdUIfVULN/SpGaobS0UtVq4nNw9eu2LQlFwRnMI+JPNaxkiEnS
 CQWXL/7hijjY3UPfnG+MC8YsRbjx8oeEY3ZIBTU9xg2Arcx7oQXtSM3n9EV4ONo8/IvS
 2topLNorjUzyzzPVOExHlgZ4GzGm/TpsCUx7Wk1rY2m92LqkhP+I75dzTuQZwrpVk2+V
 Je4H7v+ukFhEScVeCi3LlQvR2yO6WV4I/2WpaUAuPPGb/eQFmyFRVF4Ov0GUksTJ4rCh
 urIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740329071; x=1740933871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U4Bkihj4DGACHQctYAnhtp6nEz1RGAPDBfirVsTzUzk=;
 b=GN0jfVRfDYykFpGCGUuj9HyCPBiffRT7Ls+oJMKPTEi4+CK3HHHK08uW34a38sWmPT
 d9GBs+gL+FzKX+t5pyBhJd5G9dkG6wkNFHMUsgbZnm7tCCSw2BDoWgBs76X4NJ4ygw/W
 bx0BRWWSBYWOqWvDnWufTZz8LNTm/GZ+I1Kv5QQkevld0m2yK2NrOKPyUMcOTBjfaBkq
 ZrnTQj+BlPxFe55WM+edG3dJvai0Th1fFRO2cU1No2+ThX11ieaCXpNyvdCaVhg+p9h1
 +6xQeIi/POW4793yIJaJOoKGYo2PZ0EzmVBDG6bxsUsSdoDXU2IP0b1fFVogJLE2872e
 J9og==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBPWzNmSTT7xmqte74GoIVP1CMptPSVwahZrHDxcYkb4kyIt9xa/ZFW0JhNeBGfo7yww4YVtLMZFM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzbh2KmIbGTqPXgdOfWdTqH6hSlb8RiDiyh4jEDzzzU0C0nq7v6
 w/xNlREfOkgJMjMO40Wf6l3VwiCiyxf51UA2DtvN7PoAsB2NenUR
X-Gm-Gg: ASbGnctdd6CM+UA16WyN7+jInqrhsQ93l3MkBbMZ8zBKEWlor9nE7fu0w70kRCNIArV
 M+cSqvvuennYjpJxvkOwTZAI3ITAQYZFBBUvqC1wcroGBWMTE4Gx5ibmfqC+WT+aBQI5W9vs8Ej
 byPEuKfh6zlKlRvgYfjswGaRZi8tiDwoWgB0Fu/ouSd2UgOguSZIK0aCEAPGTku8peix7R/9apW
 aiGIQF9a06OquH+HqZQjyZlm38vvjeWhBY/BW4tv8qFxqGRBnuYH4iV5eBR+AQKSsFDCicVtJT4
 4DBAumV+20q4DGHtATF+DSyyS2dN3N327uATn1FC1MPeJ3RiJKo7dkIP
X-Google-Smtp-Source: AGHT+IFqMPtN+gPmr77Z5+UXqcepcxQO5H8AaDoUEcywHGCumZ53dM6PMFmuD7xMrlzO6YmaaybKmg==
X-Received: by 2002:a17:903:2286:b0:220:cd9f:a186 with SMTP id
 d9443c01a7336-2219fdc2dfcmr186405365ad.0.1740329071014; 
 Sun, 23 Feb 2025 08:44:31 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 08:44:30 -0800 (PST)
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
Subject: [PATCH 09/17] Input: joystick - Replace open-coded parity calculation
 with parity32()
Date: Mon, 24 Feb 2025 00:42:09 +0800
Message-Id: <20250223164217.2139331-10-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity32() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/input/joystick/grip_mp.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/input/joystick/grip_mp.c b/drivers/input/joystick/grip_mp.c
index 5eadb5a3ca37..897ce13753dc 100644
--- a/drivers/input/joystick/grip_mp.c
+++ b/drivers/input/joystick/grip_mp.c
@@ -18,6 +18,7 @@
 #include <linux/delay.h>
 #include <linux/proc_fs.h>
 #include <linux/jiffies.h>
+#include <linux/bitops.h>
 
 #define DRIVER_DESC	"Gravis Grip Multiport driver"
 
@@ -112,20 +113,6 @@ static const int axis_map[] = { 5, 9, 1, 5, 6, 10, 2, 6, 4, 8, 0, 4, 5, 9, 1, 5
 
 static int register_slot(int i, struct grip_mp *grip);
 
-/*
- * Returns whether an odd or even number of bits are on in pkt.
- */
-
-static int bit_parity(u32 pkt)
-{
-	int x = pkt ^ (pkt >> 16);
-	x ^= x >> 8;
-	x ^= x >> 4;
-	x ^= x >> 2;
-	x ^= x >> 1;
-	return x & 1;
-}
-
 /*
  * Poll gameport; return true if all bits set in 'onbits' are on and
  * all bits set in 'offbits' are off.
@@ -236,7 +223,7 @@ static int mp_io(struct gameport* gameport, int sendflags, int sendcode, u32 *pa
 		pkt = (pkt >> 2) | 0xf0000000;
 	}
 
-	if (bit_parity(pkt) == 1)
+	if (parity32(pkt) == 1)
 		return IO_RESET;
 
 	/* Acknowledge packet receipt */
-- 
2.34.1

