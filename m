Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0076393EE44
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 09:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C5C610E30F;
	Mon, 29 Jul 2024 07:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IxkHsErB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF64A10E098
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 09:31:39 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-70eb0ae23e4so1318798b3a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 02:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722072699; x=1722677499; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KZ6xbkKisMWheOb5DEgUNo89JS6VKyra5I1hoBscMO0=;
 b=IxkHsErB1d7aAy0i2MQzx6JtEvaHlJBwKbg/SsHnfNYOq2hdo8IgHuSKPOMfyQokV3
 Jo7OuyLB/BWdUysuHLK8iXv4wlxYY13IzlHM3TrQpvIHu3c94hN5agqvnwE0ZhaNxWmp
 sTxSUd96t65JPrXshE+yWzqNz/yZTjQjuOMBVMj/pvnuUSVJl2/CeyCt6N4sL3wJJGF1
 +fgc0X+hxokPNfydqgfuq9jJpGO5qWeM1g31dVuCEkMm1MIPW+PS27KHv12epW6w+2tw
 sOg27KPBOWojCzen3oH2NIwFQaFjAXOF7T28gWAyPZuxqyD87RdNVESqkvUd9KJLs243
 AkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722072699; x=1722677499;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KZ6xbkKisMWheOb5DEgUNo89JS6VKyra5I1hoBscMO0=;
 b=KHnAqnjTUXe6uUIDY45iFzJFLF9I/L0+uI6maMfSmKvs+14QT1Wbzj6XJp5cvKiG/9
 In8u4P2yoQLe2EqXS6Y3CkYj5jkUTRrRTkEXIwwNKiBnDDsUzs0gZ2/1COgq/uBEwlzj
 ta2G654cjBBQeSosjgmRkKoEHxmh9ORyOrarhKYtmCRMixJQ9CadTCmyqYq58BxkccOo
 PFz7JTI5/a8G/cq4Wg3UaukbuhAlbw09HfOPr8PsyPC0U0gFfH67/L3TN8udVnjg4Nyc
 e3EsUvvjta92+/7V8AqjYLkMCjg4ama/83iKn1P+oZu3PGnQiA2/AgNzq2rKzjLLK7dh
 FHAw==
X-Gm-Message-State: AOJu0YzGvZJNMjKP6r1bw4YCL+bK7grbhwIzCD3UhHnxJcHMeXyrnCPX
 WkC4WC9Yab+6C1LP0RzwqoS0fcQ99o2BUSne4A5ovz+LiH/Ct1AB
X-Google-Smtp-Source: AGHT+IGl8+M8s7vYPYnrmY+kyvUAZGBLMAvnuu5Uxvsd7sa9rLn8732cnUOfBx8BnCpGmzJ47DNlxA==
X-Received: by 2002:a05:6a00:138e:b0:70d:37f4:2c73 with SMTP id
 d2e1a72fcca58-70ecea13e6amr2223477b3a.10.1722072698999; 
 Sat, 27 Jul 2024 02:31:38 -0700 (PDT)
Received: from Riyan.inspiron ([122.176.193.50])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70ead8a2bebsm3880245b3a.212.2024.07.27.02.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jul 2024 02:31:38 -0700 (PDT)
From: Riyan Dhiman <riyandhiman14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Riyan Dhiman <riyandhiman14@gmail.com>
Subject: [PATCH] staging: fbtft: Fix mutex and spinlock without comment warning
Date: Sat, 27 Jul 2024 15:01:06 +0530
Message-Id: <20240727093106.11214-1-riyandhiman14@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 29 Jul 2024 07:16:05 +0000
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

Adhere to Linux kernel coding style

Reported by checkpatch:

CHECK: spinlock_t definition without comment
CHECK: mutex definition without comment

Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
---
 drivers/staging/fbtft/fbtft.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index f86ed9d470b8..3e00a26a29d5 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -202,6 +202,7 @@ struct fbtft_par {
 	u8 *buf;
 	u8 startbyte;
 	struct fbtft_ops fbtftops;
+	/* Spinlock to ensure thread-safe access to dirty_lines_start and dirty_lines_end */
 	spinlock_t dirty_lock;
 	unsigned int dirty_lines_start;
 	unsigned int dirty_lines_end;
@@ -218,6 +219,7 @@ struct fbtft_par {
 	} gpio;
 	const s16 *init_sequence;
 	struct {
+		/* Mutex to synchronize access to gamma curve locking */
 		struct mutex lock;
 		u32 *curves;
 		int num_values;
-- 
2.39.2

