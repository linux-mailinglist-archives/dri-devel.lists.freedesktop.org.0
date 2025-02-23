Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 576CEA420EC
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:41:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF4310E3A1;
	Mon, 24 Feb 2025 13:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TsNl2ElH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A59689D8E
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 16:44:21 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2fc1c80cdc8so5668622a91.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 08:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740329060; x=1740933860; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EcXJ496C/2+0qa2GsfTbiscKGioWO59ZW48/kJd6oSs=;
 b=TsNl2ElHUN3n7M2QxydDTyjqptOTlHEu/f7WunQOVjy4hSuIs5u6ll953Yfn0BhMH9
 hpyNsREl997Eavw3wdwvwmTXOy+fP3608Kr7q14/WUSP/sKDVKQyUm32aMAmvpUn2DB/
 XmJvK9789O6ZCyCXU9NLNSxo0wLhXtnD1qSwLwVVfYF3+WIa62+wymXlASWF02Q3j+qv
 d+riHBf1jdsk7QAkG1hb1GsrCpfK7L521IM4kD+4ll3AtVBtFVV1Ev/xIffI++jTbER8
 PWj+ftYMWPdH1Hp/3UBmxeqD2wUe5NJuRvUsk5sywc++kHOkpypsmopR6w67OYYReNEZ
 MYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740329060; x=1740933860;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EcXJ496C/2+0qa2GsfTbiscKGioWO59ZW48/kJd6oSs=;
 b=h2ko5wQEvTVFiC1Hmn/jFgOle20eb7NavgWOcUGVAD108itRrHqiaA1lJ25cMbfXSa
 +Ig2G7fH6tVnAf/Ndzq1N8Q3G7fFn/x8Cd2DOy7i/1ig+OyrgolgOLTk+heAGaEB3ySX
 ht+kTuVtAk/bpzeMMa0MXz7nOvxqf6/bac/xSO/E2HB43wsmuVcBgbjBItKgfpNJ1pYh
 0IcJm8o7GWa8wF1FtRZNdbKLp8Lko9Ei5hagXjsanY2IZt6iD9jgH+zcxGjX3pBFeQeO
 Pf2oICww7dKD9w6Xa9+HD4EYAsjw0Yq9SGjHl719ufqzJ/9ZBlnknQGY9qlEzzEh2lKD
 SFwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPw4g9jbPhDqeALyyv8iJYJZHGNyLVexahD9FW0kb/e0dIK5lv8dTb235yNjYZHcof64iMc99u2Zk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGZmGLG1tcFlBGUTkI6DFGtCu8LkUTqsVSl5PISoMHSXfDKq5g
 bkrnylaUaHK4wBHLU08/XvrqUskE+VJRNBoOCmdYNh/xlhceaz0v
X-Gm-Gg: ASbGncu3fqJ6BEaLYsQ3OnAkDF485ct3E76W1DE3M8+6lex5EXmXdGZ4zh8mSRly+uf
 kskCbgopusxC/Zj8Lrx6T0BvIkp1CRdiiuCuJxhVwSndBw732eCTHLHO8afIPGKMYULpbcm6SDS
 Af0231CDvCfAiVfw2ErQI9Yk6l89l4K+MZBNVwQYzjNIwJhAH1OiLYxvO4iPLAJLDQIj9hwvqEI
 usGI8fVX1pLggLe/Hz9REmsMFFYa4GABo1v2OkbjtqJyXelj0wXauaA1aK23dVtvS5SJf44n5PQ
 bMAFsMTtad/eWhT5wKDbCiNxX1ckP7sP4Fe76I8nspAdCsKAA6mcu8IK
X-Google-Smtp-Source: AGHT+IHbMWEVOubhP8X9psmxxmvHUjnp2Da3yrH5tyGilfGOwqHtwm1WTVAYDoMFuzjd1nirp2a0lA==
X-Received: by 2002:a17:90b:2f10:b0:2ee:f076:20f1 with SMTP id
 98e67ed59e1d1-2fce75d8389mr20940871a91.0.1740329060473; 
 Sun, 23 Feb 2025 08:44:20 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 08:44:20 -0800 (PST)
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
Subject: [PATCH 08/17] lib/bch: Replace open-coded parity calculation with
 parity32()
Date: Mon, 24 Feb 2025 00:42:08 +0800
Message-Id: <20250223164217.2139331-9-visitorckw@gmail.com>
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
 lib/bch.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/lib/bch.c b/lib/bch.c
index 1c0cb07cdfeb..769459749982 100644
--- a/lib/bch.c
+++ b/lib/bch.c
@@ -311,18 +311,6 @@ static inline int deg(unsigned int poly)
 	return fls(poly)-1;
 }
 
-static inline int parity(unsigned int x)
-{
-	/*
-	 * public domain code snippet, lifted from
-	 * http://www-graphics.stanford.edu/~seander/bithacks.html
-	 */
-	x ^= x >> 1;
-	x ^= x >> 2;
-	x = (x & 0x11111111U) * 0x11111111U;
-	return (x >> 28) & 1;
-}
-
 /* Galois field basic operations: multiply, divide, inverse, etc. */
 
 static inline unsigned int gf_mul(struct bch_control *bch, unsigned int a,
@@ -524,7 +512,7 @@ static int solve_linear_system(struct bch_control *bch, unsigned int *rows,
 		tmp = 0;
 		for (r = m-1; r >= 0; r--) {
 			mask = rows[r] & (tmp|1);
-			tmp |= parity(mask) << (m-r);
+			tmp |= parity32(mask) << (m-r);
 		}
 		sol[p] = tmp >> 1;
 	}
-- 
2.34.1

