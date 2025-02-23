Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E103A420F4
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:41:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 913E610E3B4;
	Mon, 24 Feb 2025 13:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fMtN6Q7Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3136210E055
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 16:43:02 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2fc32756139so5614862a91.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 08:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740328982; x=1740933782; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l8NvrVTMlDH5q7zXpF8J7bfqPimXPkp8jnsCRo60EBQ=;
 b=fMtN6Q7YWVt73KZFwLvex1sDQsP0IeLTcJdHcN5yXaREsVCx8vh01veDehn3P/wtbt
 anZLO6NT5O5qhZEr4q9riBqAhSG9qOpwm5z/swQYLdexdfSk1SEzjEmjSpEToa5mfIPL
 r5qG6TovZOyhn2i9CIaAI2wtl2rbUIf4+sxViCgpD73TjCGYJHjq3vn+oUo2EVQwL/0V
 tWAEAJ7V/m4o9PpqTrjkyRb9+tz0X1CNri0AwRwNOD7NdQ4kGTiUlBqUHCCOeDZaEgRC
 D6xfBCJXonOoiP5kFXp7myPDAthTHG85KnxwkxjkaVs7Z2XTqEed3YG3C8N1g6FJIdbm
 uY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740328982; x=1740933782;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l8NvrVTMlDH5q7zXpF8J7bfqPimXPkp8jnsCRo60EBQ=;
 b=mr0TloYJS8evmpMzEd8R+J7Fn4t3SEDrQRMqVG3TaRbxjpSuZ/DaVn/GzkNXwTIxhk
 I8kJSxc7hUvQ82+C/VyrqFh7YR/64z66VlgZ7Hdp8+Ak77g8QC9yDsAo4PdlKycMEyef
 xq+k5KM5q702lH35/zobSC+Rd6qgNXCC5fRYhOak7Zjsbsl44+as3ngRgy/0vfwGVY98
 oSkqoBSGnpw5YURRmVgx7oubQpjxyzPRskHxw8ApbXqGjSnvEq6BAhqtnQqExjv52/eR
 nSV7jhPJDa8ztMibrbobexsdMJDrznS3a/9NpW6Hg1ukEpfIphLbuAUVGOEtYFXsrvqq
 bTpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKPV80DsAX5ffngT74HE9G3dAUpWOYnyiAOe5TSWYBwfrZgyRVFNMlEoDfRN0eOpKciGcW++tpt0Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywzkv6bZC8k2OVpvuhRBNmc419AzOa1LiHU1cce7Qc/uJt5IEt4
 3fAilb8qy9r+Ow0wd6RiCWAkebpw6gGddPMa+LXRB4Bvzh1wwl0Q
X-Gm-Gg: ASbGncumCuUPa/E0hovK7duuD6Z8n4pH2qoxtTWu1STjk/0VQ/uV5LLxvOBosQGpiDy
 XI/PzRgAmlJN9hZEVY5Ez/NWtusR6/PcEvHGMcIi6qnDiweWJGj2CCf7+Go8oYRCfdtY6MScvAF
 XoaQPjJmzaXrIwF9wC0jYbIs17tQ/jaUVKkTQ50aYY8WosdadhSwtJ1LZzkquwXK3ZugagQh9pw
 0qEqeelQeiNYv+QUx1yMEunkBOuVJRJV57ZBurClTd5qNL8Ppkq5z/EiKNhUE2gOzS9xoZTYZ0J
 BBC0BCee+UN0+CArxHC1kwtC7s5qPiSrtUnITvT0t5AYCOFaXaUvzSN9
X-Google-Smtp-Source: AGHT+IHY182dhZjo+LBq9qsTP5GtRPKleXwf977mCGplhz7BFQQV3AK7mJ142hsRvikrULeBFmErJw==
X-Received: by 2002:a17:90b:4b90:b0:2ee:a6f0:f54 with SMTP id
 98e67ed59e1d1-2fce86b31cdmr16578615a91.13.1740328981599; 
 Sun, 23 Feb 2025 08:43:01 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 08:43:01 -0800 (PST)
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
Subject: [PATCH 01/17] bitops: Add generic parity calculation for u32
Date: Mon, 24 Feb 2025 00:42:01 +0800
Message-Id: <20250223164217.2139331-2-visitorckw@gmail.com>
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

Several parts of the kernel open-code parity calculations using
different methods. Add a generic parity32() helper implemented with the
same efficient approach as parity8().

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 include/linux/bitops.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index c1cb53cf2f0f..fb13dedad7aa 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -260,6 +260,27 @@ static inline int parity8(u8 val)
 	return (0x6996 >> (val & 0xf)) & 1;
 }
 
+/**
+ * parity32 - get the parity of an u32 value
+ * @value: the value to be examined
+ *
+ * Determine the parity of the u32 argument.
+ *
+ * Returns:
+ * 0 for even parity, 1 for odd parity
+ */
+static inline int parity32(u32 val)
+{
+	/*
+	 * One explanation of this algorithm:
+	 * https://funloop.org/codex/problem/parity/README.html
+	 */
+	val ^= val >> 16;
+	val ^= val >> 8;
+	val ^= val >> 4;
+	return (0x6996 >> (val & 0xf)) & 1;
+}
+
 /**
  * __ffs64 - find first set bit in a 64 bit word
  * @word: The 64 bit word
-- 
2.34.1

