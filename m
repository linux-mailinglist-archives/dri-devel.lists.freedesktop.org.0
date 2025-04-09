Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC33FA82AED
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 17:45:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3917910E247;
	Wed,  9 Apr 2025 15:45:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LTddxGGj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C9410E247
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 15:45:55 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2ff64550991so5570344a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 08:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744213555; x=1744818355; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3GTX40p8Eu+tWq8rarx+bIs4dwN06BcTyPGidfavgSc=;
 b=LTddxGGjiNLQFPy59YI3KpIVXyIpCdKUVR7LZ1LtvvwfO0LPj6p44MnDkSKeaeEVSK
 vb6EIehv+DEA6KVT/2bERVhuDBwS8K0xiRYl3TTiw1X1lyET1Vf/urHLjmpluCsQtkEV
 8TKMeAOrQF6oyBkNZDOK4ju9sIAoX3CIlHgHRNO2NAMpnF9gFly86xFXySm8/bJ/auyQ
 /h73HBA2yL1XYBkI5Mvi2alvbns9y536ddLjEAThQcgXoEM+MXEm+I5azgKh8Azonh8e
 RA+TwYtYyxUUHd1Z1vJckQBDzVErK/6lxBFjioqsQ8G/KyamFCpLUlw6bJiz2Vajhifc
 M/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744213555; x=1744818355;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3GTX40p8Eu+tWq8rarx+bIs4dwN06BcTyPGidfavgSc=;
 b=qd0LRUjhsYYFCGT2675KxKQF37UqsMW9pAexq2ZTY3w58UJZgTFxVQkroGTfxWZYbT
 IlzgKJZqHL/y8BwwqmgazCkWN2gsIO8rGZoPX+uoc0ZDjjOg0M7Tf3PXvBRpch4k/GkK
 g0uaTuJOl1yrlZvuvtbjI4G0o968VoOZsOsGdjUQzW+1ruDt7/yy/pB/a68fPNU44iph
 iO0WFDF7mlpTYQxcMMUIlmJPW4Cim/i//Kyx3UVtFYtEoliXOzDBo2jpRAbBOkofiplB
 y1cYLEgsOM5zy9g3fc6m5AnyVxcJk0hwG64NpLookBjfUBXguEr8neWz0luiJDrosxZ2
 Ykjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrqDQDykoR7gmLfCaCTRkJk5J9ruKmXdH/wenPXI11V0uG8VYnhmmhG2Wv3hkVesD+LD8w4qdrJjk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzv2qnCu8YLth+VGN8k9Ie5Pdy7+GcJ6SL+dTY3vLTMNDWFKfH+
 Ms9Ih0T+kWOuVohnODt+DcxDSlYkOjmZgtzhcuVJQcYUSYahGdQK
X-Gm-Gg: ASbGncsPGyUvXRZQ+UIqJ19KHYg3p8Yu0r1PFznZgGIc+ElEOAspgRm0dL4i652IywR
 997F/VSEzPX2bSujfxn4KgjaaAIxfHI3S2PWsInkqVfAQk9dzDwIjIS4czeYuEdUoclH1PqS6+4
 9g/gdWe58yjcj/fIDAOtPPaC1A3ikeNPIPwG1LSeQTf1Vp9omQW1ugc66AX2Qfar2gWIjtG2LPK
 LGeGSzy+gdXNPIdot3MQVzfZK+sdnrA5hBHPJ6YZK+e7A5q3QeSRIIaAKsTMwCFKtrIFpfKGeKf
 fdJlTA1W9hTMfxtzbiMg6DqcpVOpaDfvbREGZLRPkBQhxYpDLHWfdE9r55DpqnImNEC/N1I=
X-Google-Smtp-Source: AGHT+IG+nlKBY0fzC5EpfikKx++hN068mStMCGrKOPeFQ0KT+ZFhaeW1hEnEku5KKvT2BN4jgM2ClA==
X-Received: by 2002:a17:90b:2dca:b0:305:2d28:e435 with SMTP id
 98e67ed59e1d1-306dbb8e7d2mr5088169a91.7.1744213555184; 
 Wed, 09 Apr 2025 08:45:55 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 08:45:54 -0700 (PDT)
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
Subject: [PATCH v4 07/13] Input: joystick - Replace open-coded parity
 calculation with parity_odd()
Date: Wed,  9 Apr 2025 23:43:50 +0800
Message-Id: <20250409154356.423512-8-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409154356.423512-1-visitorckw@gmail.com>
References: <20250409154356.423512-1-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity_odd() helper.
This change eliminates redundant implementations.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/input/joystick/grip_mp.c    | 17 ++---------------
 drivers/input/joystick/sidewinder.c | 25 +++++--------------------
 2 files changed, 7 insertions(+), 35 deletions(-)

diff --git a/drivers/input/joystick/grip_mp.c b/drivers/input/joystick/grip_mp.c
index 5eadb5a3ca37..e7f60a83a89b 100644
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
+	if (parity_odd(pkt))
 		return IO_RESET;
 
 	/* Acknowledge packet receipt */
diff --git a/drivers/input/joystick/sidewinder.c b/drivers/input/joystick/sidewinder.c
index 3a5873e5fcb3..fb6f7004a485 100644
--- a/drivers/input/joystick/sidewinder.c
+++ b/drivers/input/joystick/sidewinder.c
@@ -7,6 +7,7 @@
  * Microsoft SideWinder joystick family driver for Linux
  */
 
+#include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -240,22 +241,6 @@ static void sw_init_digital(struct gameport *gameport)
 	local_irq_restore(flags);
 }
 
-/*
- * sw_parity() computes parity of __u64
- */
-
-static int sw_parity(__u64 t)
-{
-	int x = t ^ (t >> 32);
-
-	x ^= x >> 16;
-	x ^= x >> 8;
-	x ^= x >> 4;
-	x ^= x >> 2;
-	x ^= x >> 1;
-	return x & 1;
-}
-
 /*
  * sw_ccheck() checks synchronization bits and computes checksum of nibbles.
  */
@@ -316,7 +301,7 @@ static int sw_parse(unsigned char *buf, struct sw *sw)
 
 			for (i = 0; i < sw->number; i ++) {
 
-				if (sw_parity(GB(i*15,15)))
+				if (parity_odd(GB(i*15,15)))
 					return -1;
 
 				input_report_abs(sw->dev[i], ABS_X, GB(i*15+3,1) - GB(i*15+2,1));
@@ -333,7 +318,7 @@ static int sw_parse(unsigned char *buf, struct sw *sw)
 		case SW_ID_PP:
 		case SW_ID_FFP:
 
-			if (!sw_parity(GB(0,48)) || (hat = GB(42,4)) > 8)
+			if (!parity_odd(GB(0,48)) || (hat = GB(42,4)) > 8)
 				return -1;
 
 			dev = sw->dev[0];
@@ -354,7 +339,7 @@ static int sw_parse(unsigned char *buf, struct sw *sw)
 
 		case SW_ID_FSP:
 
-			if (!sw_parity(GB(0,43)) || (hat = GB(28,4)) > 8)
+			if (!parity_odd(GB(0,43)) || (hat = GB(28,4)) > 8)
 				return -1;
 
 			dev = sw->dev[0];
@@ -379,7 +364,7 @@ static int sw_parse(unsigned char *buf, struct sw *sw)
 
 		case SW_ID_FFW:
 
-			if (!sw_parity(GB(0,33)))
+			if (!parity_odd(GB(0,33)))
 				return -1;
 
 			dev = sw->dev[0];
-- 
2.34.1

