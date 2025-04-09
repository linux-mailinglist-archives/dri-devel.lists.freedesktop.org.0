Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EED59A82AF5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 17:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A36910E1E0;
	Wed,  9 Apr 2025 15:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B7NHd6JP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B04310E1E0
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 15:46:22 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-af519c159a8so6358294a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 08:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744213582; x=1744818382; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jbWQUZQwY5O/XbpqxBGOs/Motht++mnKBdeylhl46Ro=;
 b=B7NHd6JPTR6/h8/CB+yiL6rAZ43xVJvAm3W13AK/7CrQWFhBvXJJUVkeCwZzcGdHWr
 G604v5VtxyXQ/dBXGAeXcblil35kw/+WsxlVIONdjjMP0zE1zu01HQDjdCzgSwKEEdmE
 +ztrorMmLoVTYhF65WH7QR+TMONeu0h3HasAgwUpMNolJw5ij3xAx4oP4pCgf3hoZWVh
 tOeomDDrQ6LwnFq+DSOabHGsr3p1CBlZ+lFsJ+gmI+bWBrn7cAKlcutSsOvCBuKeoS5P
 jFeWZIBIKBap/IY8Xfa0lABItt4LJp1P9DlkPazViqpvn2dB11JnbhsHbHlQvUkcvhNi
 TF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744213582; x=1744818382;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jbWQUZQwY5O/XbpqxBGOs/Motht++mnKBdeylhl46Ro=;
 b=iU8FKW9gp8laI4/4iS99s1jHp753AyJRKcpaYDdtNDN+952QsmxfGqTNN1s/nOyPYA
 RxG+5WxYyNCL6leQa6GzUB1twiquqaPCNgpavGlFy7d6mGsxo9kWus8vstk5XfYp9bIG
 GWeLJ57ZSr2zyiWPftOFJkFgn0K6CqfLIl0hhqbisQsJiY2ufNJTgvcan/SHEtOEvq4z
 eFMMH7s98egWMkcIzZYdElK2/lEEQGfUn1slxmG1SUjiP32u4bFlIfUpoTttzmSFsSgU
 A6lEy3TyKID0L2SaISH4H1jT4JWogaL82MiTIkc7AI4Gv3tNlfdcbNXai5/7NEAT9qS+
 OEcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNjy9qd707Az7PasUA0X70zReTBDjTcKueguBltwA1JWQwyZHEAdSjoOAFJMlvvQSZ6cKG7fGr6cw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxw3PC0d5al+x2NFoUfD0o0iZNLxy5fbC80nZ4OlZEqyP2hCTsi
 IxxcUDVmxwizo1k09huPbnTgT4WlsEiIDvlv3I6YsT1tii6OFmUU
X-Gm-Gg: ASbGncs9PIJ2YENbS9JNmpPdGZLPFPbfkPY5FX7v1YBB2N6jGP4bGDl8kjW8+LlIbDv
 hbqahov4ywRJIRkXW4EueFFCRV/niMQZg6fviyIUz/vWEjtaksG0qJW3OLfOCXvJ7EHlDiMtVNp
 t6gyjsdwbHnnJ3U5fNqlsb8YFnxQlTNOUbMr2CTlbAfuZ1e680BkSv/Jx27FO/11vpEYxwj5Elw
 izK2Jbyr60VbbtKVST4VlErw2RJyvOjTbolCvc38kPsrcQaAUrfPdchy+iHNAZf70h7P/8Gqbuo
 HaJHjDV+iuotTHwiO/ixb7PBiK0Z//hdXuXQ+kY+TOErAzh+oziDdXUWtYq8MxGZQXwtRwY=
X-Google-Smtp-Source: AGHT+IEd3EC/Z0ac7A9mI3otjelgXE3L0dUH+HAICIEWTo12gF8GwwD4nirjVp0rJrYl27/5nkbmDA==
X-Received: by 2002:a17:90a:d60e:b0:2f4:4003:f3d4 with SMTP id
 98e67ed59e1d1-306dbc2a7dbmr4740684a91.30.1744213582002; 
 Wed, 09 Apr 2025 08:46:22 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 08:46:21 -0700 (PDT)
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
Subject: [PATCH v4 09/13] wifi: brcm80211: Replace open-coded parity
 calculation with parity_odd()
Date: Wed,  9 Apr 2025 23:43:52 +0800
Message-Id: <20250409154356.423512-10-visitorckw@gmail.com>
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
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 .../wireless/broadcom/brcm80211/brcmsmac/dma.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
index 80c35027787a..5d7500ee2d3b 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
@@ -17,6 +17,7 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/pci.h>
+#include <linux/bitops.h>
 #include <net/cfg80211.h>
 #include <net/mac80211.h>
 
@@ -283,24 +284,9 @@ struct dma_info {
 	bool aligndesc_4k;
 };
 
-/* Check for odd number of 1's */
-static u32 parity32(__le32 data)
-{
-	/* no swap needed for counting 1's */
-	u32 par_data = *(u32 *)&data;
-
-	par_data ^= par_data >> 16;
-	par_data ^= par_data >> 8;
-	par_data ^= par_data >> 4;
-	par_data ^= par_data >> 2;
-	par_data ^= par_data >> 1;
-
-	return par_data & 1;
-}
-
 static bool dma64_dd_parity(struct dma64desc *dd)
 {
-	return parity32(dd->addrlow ^ dd->addrhigh ^ dd->ctrl1 ^ dd->ctrl2);
+	return parity_odd(dd->addrlow ^ dd->addrhigh ^ dd->ctrl1 ^ dd->ctrl2);
 }
 
 /* descriptor bumping functions */
-- 
2.34.1

