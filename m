Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39204A4217C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:44:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C6D10E51C;
	Mon, 24 Feb 2025 13:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H7j+GSIm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2375010E055
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 16:43:35 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-219f8263ae0so74298695ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 08:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740329014; x=1740933814; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eJ7uyC7/exlluLKkDx5P6Zr0yOli/KDaWMiD/A1Io8w=;
 b=H7j+GSImPlLwq3I8cCDvZdtYH51T50FhzFZBk++JX2bNGhL+jt2eoLtQXL6sz4OKuC
 c8I/6vq7O5/XuzIaM+CU4lDLdYSozfQ0Z3h9YW1KGX/oeZet3yAVEFs73LGwNQu3QEN/
 NqfmlSpqXUxtQ4P70z9aae55hrAY+XcgH80Ax046FXn8hFkSXerPnf4DC5/1nf0agEU3
 YCTJ008aR2g2zpytUOaemoO5MtN9lIO3lO3wuq65SEkeG8V+1ZqcXk7Gjkq/kBWZrbGX
 wTiwc8bpvf4G5eAe+hJ+dUXTUbRpVPvl/4o22zMa5pGsC5+xMLE1x43Ng/sAFkZo0i3C
 js5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740329014; x=1740933814;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eJ7uyC7/exlluLKkDx5P6Zr0yOli/KDaWMiD/A1Io8w=;
 b=fzibMdATz5g/uDql1t01pjXO1Xsl5pYVyI2aACxcLw1uQY6wmiCMLs6L8D0hRywHwR
 sLwmHhi8b2im5kjIsgWpwkzm0M88FHwaNiSj3ZQNA2GNjyLb8ggldA+NVcxoE3LgR+IA
 R6IVmuu3ng/3Ed2c4Kve0fvci2VFwqPAuamYcReqy9bt/il0keFrBjNx6lJAc0UkHJ1z
 vxrOR0n75eBzrZzqAyF4Y36A7F6c9nCuOzSXwyPkOn/lNt07GaC/W6p+NayLJLE4OLa2
 34qUK8lzyJnx0Dmz3mxEhD6qvqVtEPFNCrCCtkvmri41M1XqPY1UeT5e4CU/xq+Wi85S
 eh7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3cwjcEOTPaifB4qr3u0kTmmOaPkIEWHXMTkO9Jl+wQEby1h9Vfp4gYVgx+NuM3JPJKnHKheay5RE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4216L30aswQfakrV3+WKSG4LhORCfPZLhvc6TNeSjDAPa/hb2
 wyOxia5PcQxqSJjA4lpkphu75+BTYqpDd/l4qBnAJclDpElB9oQt
X-Gm-Gg: ASbGncuSIe9L6qHFeJLX+GdTGAqItZECPfjxez9XGGK94Cn1v6Z7SzyBvrPABNd2zoT
 SrKaCz+D+650Uk7JJ8BGQysrzFXC28tBRuCcbW6JYHd2f86597N365qd4kqUkZ024qLoIVf9AL7
 lr3yf7aM3ScIyg/eLCg6pHcbKz8YwgKg8wR13FeslJxjcvidPiY7tK6UmL2MUOXEUZS0npi/EdO
 SAYgKYZB1egqZ/mUR5sQsojMFxw1qQmFA3lND3zgbdW8k2m4GMbwo7+UCwwz0qTzpcrz+LhWXnK
 rqMgN2WYL5ocqID4KfI89UnYbE7FDiJUwwM2FK4CIWjAZRRcmIF/2cBH
X-Google-Smtp-Source: AGHT+IGEf83VZ2oIxRJRK+CnkiI3bN9hJqE3s48Hx05CleZdaHJAPpPthd1i56ltfHnEYIca1Ehjjg==
X-Received: by 2002:a05:6a21:394c:b0:1ee:cdda:b8ea with SMTP id
 adf61e73a8af0-1eef52f7d5fmr16011633637.19.1740329014620; 
 Sun, 23 Feb 2025 08:43:34 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 08:43:34 -0800 (PST)
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
Subject: [PATCH 04/17] media: media/test_drivers: Replace open-coded parity
 calculation with parity8()
Date: Mon, 24 Feb 2025 00:42:04 +0800
Message-Id: <20250223164217.2139331-5-visitorckw@gmail.com>
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
index 70a4024d461e..90fafa533ccd 100644
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
+	return val | ((parity8(val)) ? 0 : 0x80);
 }
 
 static void vivid_vbi_gen_set_time_of_day(u8 *packet)
-- 
2.34.1

