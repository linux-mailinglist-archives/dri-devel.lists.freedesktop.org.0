Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 168CBA42102
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:42:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A29310E3DF;
	Mon, 24 Feb 2025 13:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lnF0QvML";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E1C10E09E
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 16:45:25 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2fc3db58932so5352331a91.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 08:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740329125; x=1740933925; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gCIStMwChzl4Z+E/b6UIovNeeE8MF3lkiK/lI/bZwfc=;
 b=lnF0QvMLQuwhnHMOlUGc21vMIsEiiDUOUwXz5hGIytG6fMF2LEHTvs3Cgdb3p02KDc
 tmd00OVoVVHpf+qeFb7jICde2gSHdDoUxbbwj6ohMY8vH3g4Y6qRneAU/Fd+SbEzElpA
 chiJei0sLRj60boVBs+gQdigzq8ZfufkeIAz4qUiZeHm/nN4w4qwBgbSdUDl+rTNiZpo
 +HRhdRPOkRJrb2FL70NYHB5dExLrickWjGGzSPu9ulo0BdITTofZyarQFgaggZW1wMlO
 OkXVgR0uG5oE2tIcvym+PhAlC4tFIdLdlwSPIeDbLCBn34jRvssqBuHpooiV3ZNNLaDQ
 0gug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740329125; x=1740933925;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gCIStMwChzl4Z+E/b6UIovNeeE8MF3lkiK/lI/bZwfc=;
 b=wFyZVgTZxrw73IiJVLxGMyrjQxHYmjrFxaWEjHhGUTdQ+sowLA6oBl+MeFraRU5FWq
 YXiBQ4/FqRn05pz1ce7INz0B/SIrTWJjWGRFxN0+1WSX26ZUqHed56mwE1mGYKxdmdgA
 fo9rtnqoXybPqD33569Qhale+0JVRU0zs9euINU9aykz/MQXo3PQgjtqzP9odLxr7xjG
 NxZqXhOaS0gKrIUX1EC0Mhb/l+mS8QZB7kngpo4nkClRfe1vGFaUrJHQD6T5NypN5zGl
 yuAbdfRn+SpZUA278AAJHXTapzu9XvcNPTxKu4f30oBukh7Xk2Ag+btyS6NTrz4so8pJ
 maQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUafUAi0t/HlBaSEsVWPjoxyYENBz2X7EZas4EVmzR3Ww2w5cXSVhq/sYQSHy8VcJLfzAenz7kwa2E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7rGBLdGL6f9UX5Asc6Cofl3JmkFudn5SZCgytn9Zn/U1yKsBA
 hObaYvD459to94tlr9fMdLuUvm1P94hLY3ICszbUG7p5IoYYqKjj
X-Gm-Gg: ASbGncuNEawmejUptUZsESQfNSUce1VR6YMxsR0RBy6MZWoDBx+Cg33cFTZRHwSiHIA
 UAWCy+FP2upuxi2ID2PyEuFiyqkzlMbwWRxL3/cITM5AGpu4kkcESKQ/JzzBD7s7WbJ+qVXWdo6
 u21n/QAjJWi/uHjV+iCAv4Zl1IC9XMF7IhVGgfUTSewxA4m5QnxRfL1pbMgMrou3sQZu8v3g7RL
 4e6QRXU6p1DIfetArOWki073CNvgnGlAtbAqc5MnHSYHrIflBlcinLJNHzwEBbvwiJf3/XkbJvF
 iH6uCJ70lEhISCSurPwUYZe52zvYQE5TSll48HJS1DNIA8scNbE+SVFG
X-Google-Smtp-Source: AGHT+IFs3TQ1rSxmmbPXVRsSl3rqDEDcDSV6UQtHXLRs1szh2ELiA6tHTHYs6po5Gu/F9oStBVoG9Q==
X-Received: by 2002:a17:90b:4fc9:b0:2ee:dd79:e046 with SMTP id
 98e67ed59e1d1-2fce78a3738mr17084857a91.13.1740329124995; 
 Sun, 23 Feb 2025 08:45:24 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 08:45:24 -0800 (PST)
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
Subject: [PATCH 14/17] fsi: i2cr: Replace open-coded parity calculation with
 parity32()
Date: Mon, 24 Feb 2025 00:42:14 +0800
Message-Id: <20250223164217.2139331-15-visitorckw@gmail.com>
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
 drivers/fsi/fsi-master-i2cr.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/fsi/fsi-master-i2cr.c b/drivers/fsi/fsi-master-i2cr.c
index 40f1f4d231e5..8212b99ab2f9 100644
--- a/drivers/fsi/fsi-master-i2cr.c
+++ b/drivers/fsi/fsi-master-i2cr.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) IBM Corporation 2023 */
 
+#include <linux/bitops.h>
 #include <linux/device.h>
 #include <linux/fsi.h>
 #include <linux/i2c.h>
@@ -38,14 +39,7 @@ static const u8 i2cr_cfam[] = {
 
 static bool i2cr_check_parity32(u32 v, bool parity)
 {
-	u32 i;
-
-	for (i = 0; i < 32; ++i) {
-		if (v & (1u << i))
-			parity = !parity;
-	}
-
-	return parity;
+	return parity ^ parity32(v);
 }
 
 static bool i2cr_check_parity64(u64 v)
-- 
2.34.1

