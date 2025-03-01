Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA119A4ABC6
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 15:26:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F32010E230;
	Sat,  1 Mar 2025 14:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CueFDhT7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B843410E230
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 14:26:39 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2239c066347so1364345ad.2
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 06:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740839199; x=1741443999; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EcXJ496C/2+0qa2GsfTbiscKGioWO59ZW48/kJd6oSs=;
 b=CueFDhT7smyEylYaFEqc2a4jSbm/7J8OmDVsH1L4tH14Jb6wnZFrfVVAYf6MuD0VqE
 jwF9gPph6I1v69cF9v0TbPkr7ObenszmvRUWQm6z74np6hJwZttpfum6lTu4+D1jCldu
 JdDcTKwyZrHWIDwk5rBf2QGWEnJx6XvGqa+r50df+a+fNL5ghM+0bwr8IQ3uE0ES8TWm
 feWoCX69Qe7/K8tu6WQANZOKuZSYiNhpuTvCS0jD1JYs1pAHCyb7KqqA97J2/4qclj7e
 dxaE0q2LULJqMcH2secUGSQ7WY1jaWIuj5dVKAoH+da05vzxZ1VGDvXySSzsNJb767rn
 M9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740839199; x=1741443999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EcXJ496C/2+0qa2GsfTbiscKGioWO59ZW48/kJd6oSs=;
 b=AJorpqRnXE1cE59MPlJeM6UCx3W0XX74YpqmXqWBd3JTqRnxHBgOEaAEHKQm5SvGYt
 WeeLlpo+4AOz3QPaj3OsC7+oivIG2K/yHak1zdnQrUT/wuyrphARRy5CarkN34KomvxX
 0+WM6nq/9FxBJm17Q4zLQejNlhsCYMCSrCa+vnaDsO48ulSVA42GKkpTSb3ZPsxZPE4f
 zZIHCVckymypIQ1o8oUiuSjHGIty1hjqVVdXErdBbx5i4m8gHWdu4oEfh4J2w6L5/NpN
 iKDmVPWnjj6dcmOdKO7ZtLkqQe+wNXN0tj1s6luHbmZCE+c46UApUJ3K0YBd4bsi65cp
 HKkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL5/xzTtjmvETvJQbhPmylYVaFTWBxId6aYO93O10AIe7LytuE9cGsmHBI3hEhJpNq0cFOfSqgcFo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8e4RHsXDTzYiDMJ0PeQrop2Rdxyct8ljLTpwhjSEIRBPOQVUB
 jZ0CKcaz2rs6V/nbOoEsz1ubSwLOr5ioNW5TPMrT3cSlJbPWG6ynZFXkj0yHuS8=
X-Gm-Gg: ASbGncu0X/Glk90CxnFmMgmj+YbuGi+3mB6KKiPfPK1W3nQwvRzuqIf9timNJqXOoix
 s37uPRfsFIpec8YWA8ntHOE8ARiv+K4KlfqR7XxodgBkT+gM25YNpBjtt6PyWNlmpZhH4auAbzT
 HQYzlfB+xrTOxLeeq7nOOeElLLn0QsRV3r7vMmAXbNAvF0mbvYlDVyivQeUHpp/K9bhhaunMnOa
 x2eyDGA3EqCiczn57UohWOs4iKJkYIwkd8S78eQhDQDOyttg32LcnpPk6RUGl/Sz4hN3AUIGNEx
 6/dqbHHxvj9eu6INAafTVfqwiuq5d7Pp3CI+I/qAkll3wOkSi0OTjTisGOh82AwXHkMvmHQ/XnY
 =
X-Google-Smtp-Source: AGHT+IF0PsFOHNYq2JTljPhmrhYVkAKjdgh1XZeXstNsMDq6/4mtC72Fp39DdqLibOGQ7FEZk2iiHA==
X-Received: by 2002:a17:902:da8d:b0:215:9bc2:42ec with SMTP id
 d9443c01a7336-22369260956mr94926455ad.47.1740839199131; 
 Sat, 01 Mar 2025 06:26:39 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 06:26:38 -0800 (PST)
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
 david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
 Kuan-Wei Chiu <visitorckw@gmail.com>, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v2 08/18] lib/bch: Replace open-coded parity calculation with
 parity32()
Date: Sat,  1 Mar 2025 22:23:59 +0800
Message-Id: <20250301142409.2513835-9-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250301142409.2513835-1-visitorckw@gmail.com>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
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

