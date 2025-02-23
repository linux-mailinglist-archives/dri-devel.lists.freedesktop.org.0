Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 756E5A420ED
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:41:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66A510E3AA;
	Mon, 24 Feb 2025 13:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UKCtIGqi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF6110E09E
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 16:45:15 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2fc4418c0b9so5547520a91.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 08:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740329115; x=1740933915; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M0fPaIWjdscIdDk4T1YIhhdJwaKRFyAzbGum2CZXkTo=;
 b=UKCtIGqiqElvUFPaxVUck20qHbgSQ5t5hf1oA2X0CaZBoQxPL/chjs9T5OpCISfj8I
 BXdzkKK5t0LCLsXMWGz46SK/CJr/AHF5Gk+TyZsMupuR+XCHqon2oCJHFYjMa+Rp3CCk
 G/+aUoYb8gj7WgV3z/HvN7B7xfpjsPEVrDkTM1MuJoYvW4/lUvLrnSsAHRmpvoGzBh+5
 mBzk6+qrK7+X74RKvux1t9fevUZ+Q61QsI0/95XhSvoR37D4jxq6K4vBhzQSuXFD0bBc
 7apEwVBt3UAtpaPSGwt5IpOLvqlABvkIHEnJFt+kEgpFlP7kPbzsBpEsRo23KbkoKWBy
 a2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740329115; x=1740933915;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M0fPaIWjdscIdDk4T1YIhhdJwaKRFyAzbGum2CZXkTo=;
 b=VozK5yhSKgUNmgwqbiRDhXgBucm1BiBoFxdSbSIlqvMEvktUe6r2tLXJoW+VfXSTvX
 2PZR1XnloSZtGcF8i+X8Yg4L7LLUydTOK58uV/WMYc2tWmv2m31/aqB/49RErWkgtZkw
 7yN85h7WJSDugcnQQGxVEaLiAo4VyP/cIcEFNnvM3/yTxQImW/DxdUYP0wUL0xdkt7LI
 24cnCSo2UbaCSx8cSqFVD7sWMyjUTd0lCgdmchPKBQeiNLjAk4zIa7uG0Iom9W8S4L0W
 ZPBrHXUvsQv4368Thm6yRY/ZOy9fWymsBOjvfhvbHtetMcsBvaURrO3VWNie1BpivOWA
 ZkdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLGlPD9eZjpaCZ9rCWMUbcJohctNzCoE7VsutqrQ5+bXK+4so12HrbnVgleRtVqmoLFyrEKFe8UTM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yygf89ztQ2zxRbXfnagIdmeUGDuldnM11LdHkhc2Wg5zmWSDnsh
 JAGnhEvnaA3J55h9xatJ6B0cnyMhMhokYGuea3FdX089u2C28/UO
X-Gm-Gg: ASbGncso+AwjADL8t9R4EFpEF1quCREIaw+t4SrvlxOf/r8HsrUUF5pO0Y8Uc5q7Pod
 OwOPKoUS+s+Im5VTqZlBgMfmLce7D2UiyCQmQGhBToTsasM6IJXV/tWjZsaZ5HnbnaudlnRb0Zo
 bxG6pXe3jjlsMXFahtoSwTzH0RYNVEM8MOrWyJDQMcFzmdODESxCFrFBHeGNnwG7PPFUhy0omWK
 l8rdD2DNiqqjIeqNuDTHfjE68/kCcA2ShDwnJYSHk7eTcWMjYtyqUV2WKi216baGxgdhr9VULdG
 YC2ZH1vVSaymSB67wNgM/MTTsHkrS1FyI4898beQ9xhEvR0y9zNCtFW9
X-Google-Smtp-Source: AGHT+IGRfmJ1JykXVI/nOn1hWPryN6XcmSxHhj3JPmFZZoIcxcyuC/O0UeP8Z39VhK9JcSyFdzE6jQ==
X-Received: by 2002:a17:90b:548c:b0:2ee:c04a:4276 with SMTP id
 98e67ed59e1d1-2fce77a4863mr16234632a91.5.1740329114693; 
 Sun, 23 Feb 2025 08:45:14 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 08:45:14 -0800 (PST)
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
Subject: [PATCH 13/17] mtd: ssfdc: Replace open-coded parity calculation with
 parity32()
Date: Mon, 24 Feb 2025 00:42:13 +0800
Message-Id: <20250223164217.2139331-14-visitorckw@gmail.com>
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
 drivers/mtd/ssfdc.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
index 46c01fa2ec46..e7f9e73da644 100644
--- a/drivers/mtd/ssfdc.c
+++ b/drivers/mtd/ssfdc.c
@@ -7,6 +7,7 @@
  * Based on NTFL and MTDBLOCK_RO drivers
  */
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -178,20 +179,6 @@ static int read_raw_oob(struct mtd_info *mtd, loff_t offs, uint8_t *buf)
 	return 0;
 }
 
-/* Parity calculator on a word of n bit size */
-static int get_parity(int number, int size)
-{
- 	int k;
-	int parity;
-
-	parity = 1;
-	for (k = 0; k < size; k++) {
-		parity += (number >> k);
-		parity &= 1;
-	}
-	return parity;
-}
-
 /* Read and validate the logical block address field stored in the OOB */
 static int get_logical_address(uint8_t *oob_buf)
 {
@@ -215,7 +202,7 @@ static int get_logical_address(uint8_t *oob_buf)
 			block_address &= 0x7FF;
 			block_address >>= 1;
 
-			if (get_parity(block_address, 10) != parity) {
+			if (parity32(block_address & 0x3ff) == parity) {
 				pr_debug("SSFDC_RO: logical address field%d"
 					"parity error(0x%04X)\n", j+1,
 					block_address);
-- 
2.34.1

