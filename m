Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE8FA420F8
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:41:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2821F10E39B;
	Mon, 24 Feb 2025 13:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a3nE+70Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A968A10E09E
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 16:45:36 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2f42992f608so5684504a91.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 08:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740329136; x=1740933936; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H92cNXD8ivdLBJu7PZvS/WlFHsCPSxa0jaZByFXEmx4=;
 b=a3nE+70Yy87LZtM4rtmP2Hv9shcs471QOplxUlG7A0mvo+gr0kFYzPhXWck5k65S8s
 jNyL5mHOvswdS6HzFZLnmJqrx2v7EB8xlypPODOonl4lkgqascfvRXFTYdPUtLX8fcz4
 ogeEZg9SELzllk2U1sy9psynFbbmdFMOVc9aspheYmr224HPuN3l6oytjxP/VmNXDjby
 RjLfxJJYHHywlPq8xbSWDn84gApNwrghXs2spta+yTNZlEOz6J0JBOvk5M9rrxauNOgY
 S7OSrHNivru97BXmPBSvmHbfW4ZUL53fHIQf8r3AE/4LdOHrlZeFizYLySLC72a9E1a8
 k4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740329136; x=1740933936;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H92cNXD8ivdLBJu7PZvS/WlFHsCPSxa0jaZByFXEmx4=;
 b=aRpxarX/+YNLqTves7ykGfTMaZM3syRWi8mFSpmWeOrmHv/pwd1XfAUZsE4VAosEkc
 ZEo+Lr8j+/AzPIYV0bnb8Gfogubn1MD+ucPleunxe1yibryj2xCAptwOP/WExqrpBmSu
 Gae8t6IYgN0N/xL5KJDFYQYOmnyBkQAk8I/ntZ6XgXVEE8yRSu3iVZYxh+YLmudnhOq7
 1WxATaA1MtVYBtvGMpLwbxso1PJQmMEdIpHmcEGYfuaOPNqI3TBBkvNswbqn+RuNEkeR
 u7ff3lJZyR3FzND0EuD63RgoipIBfCm0z1/9NuY5f6TjcXlmEp6Tm3b7OBf4la2S7I+8
 d8hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAHl4kwioAzTCvaZkXtUONPigw/856RCz0JRMOptBum2N7q/LZFoMyPl3ePK81Ejjpqc8vcSjjLW0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2byp30jCIwmyeOOQfWEeYopQimu5v6TnYfQ6P6l07gNRzj3Vy
 9rThlEoSdU9QY5JqbdnswCXMl4KktN7irMKfrE4y4XL9vrnIHDUH
X-Gm-Gg: ASbGncvol3yPWMqB42st33rRMbVD9IC1nDoiwvdNmdL/kPIsulX5OHfx8vDIarh6iu9
 q5YSS6tuIOMgg2N2Zious6L+PX9hc1Xg9UNn6wzHdsdOgRYNtEll88VHVQmaVzEPyGLDo16cv0p
 AshC1tSotGl7ujUxHkTM5KCUTdf0XltskTr+3TqwKjyrcbIMN6Nl2yyekSgiAAxlSNe2WYy0qyM
 Q2gacCRKZTBsxohZgvL+F/KUVmuaGLPXlE20RkeFUS8vD8xAF73bQKi66+YdxrbUNCjpBguCCgH
 2ICdh2y2bh4851NJlmbyrueSvEivfV1TAdIoYw7bWjwsJbWRN1H4yq75
X-Google-Smtp-Source: AGHT+IG/5m3vxk7XH8yJGRjtosKFh6pQvnNnT6e9O4ZXx67836JTtD9gPOQACi8OqZVBfLdHsuq5WQ==
X-Received: by 2002:a17:90b:2e0d:b0:2f6:f107:fae6 with SMTP id
 98e67ed59e1d1-2fce7b1a82cmr15222650a91.23.1740329136041; 
 Sun, 23 Feb 2025 08:45:36 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 08:45:35 -0800 (PST)
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
Subject: [PATCH 15/17] fsi: i2cr: Replace open-coded parity calculation with
 parity64()
Date: Mon, 24 Feb 2025 00:42:15 +0800
Message-Id: <20250223164217.2139331-16-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity64() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/fsi/fsi-master-i2cr.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/fsi/fsi-master-i2cr.c b/drivers/fsi/fsi-master-i2cr.c
index 8212b99ab2f9..8f558b7c6dbc 100644
--- a/drivers/fsi/fsi-master-i2cr.c
+++ b/drivers/fsi/fsi-master-i2cr.c
@@ -44,15 +44,9 @@ static bool i2cr_check_parity32(u32 v, bool parity)
 
 static bool i2cr_check_parity64(u64 v)
 {
-	u32 i;
 	bool parity = I2CR_INITIAL_PARITY;
 
-	for (i = 0; i < 64; ++i) {
-		if (v & (1llu << i))
-			parity = !parity;
-	}
-
-	return parity;
+	return parity ^ parity64(v);
 }
 
 static u32 i2cr_get_command(u32 address, bool parity)
-- 
2.34.1

