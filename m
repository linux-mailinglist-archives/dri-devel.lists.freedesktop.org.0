Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B67A550AC
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 17:26:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2E610E29C;
	Thu,  6 Mar 2025 16:26:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JzH45KXe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2852F10E29C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 16:26:27 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2fec13a4067so1481924a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 08:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741278387; x=1741883187; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nutb7MJ9eZ82YUrFszN8Vow0UKyoKuoqD2og5G/xi8M=;
 b=JzH45KXenVAFqEu6+YUF3S5kPxteZ4eFBVWYXfHgBvRmohdKLiW0bj8tOhyDSfIK+f
 7cFHv15uINY7+c5f9ahBdkbgr+eGqr6sDBEM8L4A9jcfpkV2NRG9V7fKREz1ErVKzV0+
 JHCzFrdT5YsvO+cx7BfmsO8FmA/7x6sdXYlEOtbK9PBrqkrjB+CPzzrAOGpvP86h6kx6
 b5zEVG1DkD7B1uZAqjKbbKudbIpUgWuDHYkGMZJMZ+PJbAcsgZOq9Y3dhrn/qouAKWiD
 yX8c938niRo0IA30n1J79ptNm4DUrX+aGDnXBP8rj8hXAVVV8D/U7YZ1S6Q7wLvQZBLM
 PKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741278387; x=1741883187;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nutb7MJ9eZ82YUrFszN8Vow0UKyoKuoqD2og5G/xi8M=;
 b=uBz3tOlnDeqcrfzDbig+tpeBhYAysNjwuCSDVf14tYCspNc9d+h0EgFV76EASo0Mf8
 oL19EYG7vUKv7GF5vNfwyizbfjx4G/jcXxtl7hkOuM67vVKm1/vzWeDB7xQ6LdKRWjYP
 1LL8qsupcBcTmzgosqANSEsZoZI/vTDD8dOAfC//Bccmmi893lALuBaETmcbBUc+hh2q
 lM3D5pnKqsHchaD3ShAkwe46mP9KtZ1Y+/KiWaQdFrGqMSZVmM7HDw0dT0pL7Hqt5blw
 RWf1ZgysAKjZicQ+C2uG0PHis+7cCyNHaDi2+ekYXQ/i/gqDXtSIsrMPcuU7DhUPLSwR
 1E2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU44PHyWq4ph84FdzhkxxT/U28bgqr/w7b9N9axzNmn/jevGNDq6Q9ouBswNovBmZWNAre5LilODbQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7o/odg62ZSgurq2zT1y4WtSuxFWLXL0AqAj2jbd9bSpz01+YE
 4jNTZsgBqFhAENZnRNaUyoMBedLXaIEP7iORN9DK4tOD7lWg++e2
X-Gm-Gg: ASbGncvlpvhzgEuiTw2X5HEmAWu/Y7IzmC/Z8EJIJcPO/bwjdZmsLxKol95Yi1/gV68
 NMEpkgTuD31/uLVKJBZ/wBkrGeojeRB8yZoB2uekXPPAJHs2BIPeCgNhYI7DLJYljgMM8bA3XqX
 svvAaXTtLtHVpQuOiizWUGOr8Kt15tQhtL6+/kZqGMdai9p+cAjWKQZl8uK7IxbFG+5Ns2p1pBp
 BCi8Oiv33eAGX2Z2MFoJsla3dpRm5zwm3ORSMhW4zmAbrPtpHBiMPowtFzWUOVxGPlQCN0ZFN8g
 bSLRbKlnEuK5uiptok41lbXwz7as0CmmhdaFrCF78sa8SwhxJofnYMyUzzEvPVoim6V1cgez9b4
 =
X-Google-Smtp-Source: AGHT+IGnAbA7Y19sbet7/e0FnFCoTVhlFvSe7Bxbq8+Kkwl3FpD5fIN6ErN6a+dRmXJdCrcvBmbfjw==
X-Received: by 2002:a17:90b:4c07:b0:2ff:6ac2:c5a6 with SMTP id
 98e67ed59e1d1-2ff6ac2c770mr3503350a91.31.1741278386628; 
 Thu, 06 Mar 2025 08:26:26 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 08:26:26 -0800 (PST)
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
Subject: [PATCH v3 03/16] media: media/test_drivers: Replace open-coded parity
 calculation with parity8()
Date: Fri,  7 Mar 2025 00:25:28 +0800
Message-Id: <20250306162541.2633025-4-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306162541.2633025-1-visitorckw@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity8() helper. This
change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/media/test-drivers/vivid/vivid-vbi-gen.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
index 70a4024d461e..e0f4151bda18 100644
--- a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
+++ b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
@@ -5,6 +5,7 @@
  * Copyright 2014 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
+#include <linux/bitops.h>
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/ktime.h>
@@ -165,12 +166,7 @@ static const u8 vivid_cc_sequence2[30] = {
 
 static u8 calc_parity(u8 val)
 {
-	unsigned i;
-	unsigned tot = 0;
-
-	for (i = 0; i < 7; i++)
-		tot += (val & (1 << i)) ? 1 : 0;
-	return val | ((tot & 1) ? 0 : 0x80);
+	return val | (parity8(val) ? 0 : 0x80);
 }
 
 static void vivid_vbi_gen_set_time_of_day(u8 *packet)
-- 
2.34.1

