Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF8BA7DC8D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 13:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA8A10E43C;
	Mon,  7 Apr 2025 11:40:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mPTyG1VA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B4AF10E40C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 09:54:18 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-223fd89d036so45905485ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 02:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744019658; x=1744624458; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LkqbTBwPGVLrWizLUawPs+MSKpssOAtGiDagVUV4NJ4=;
 b=mPTyG1VAz3ESZJieBPfa0Q2iEoh2RT+HkRUOJQD71gRXNiOSSzEiO1qLGkhldZbLMK
 JDa6oXjrfAv07/kXfnG5UwUI/lKZK/kEfauwq0BtC52owbowOvzqC71nZCdVL7ha4ydq
 5Ju80opRlC0c1pnIR4kFMsXjHPouYOapkR1p/JWKHC5sB4MPkoJrsA0q7lG4AF2sijym
 /uSPbU2Wv54wUq3H0DgL3sluQhZb9UwKrmPj6EmVI1udmPwvRgdR7dD9X/MEVx6FkF46
 cqM3XNYYVTXsOgkMShNFTSG8GtjmGMh7mJrCBIKEHu3UeWO1fPeTOKgUaXpRfLGu9f7Y
 0S/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744019658; x=1744624458;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LkqbTBwPGVLrWizLUawPs+MSKpssOAtGiDagVUV4NJ4=;
 b=Jta/r1VGXLQwbKLA6pig8b72jIOl0mr7cIIS0a7TiHvphpjq5SJfQjmWEF24LBBwzN
 tp18cuKCegzM8XNhbcdiO3Hd/WyFOhR24W88dIUaG7vjXZ8w7xL61BAni9D1v9dCrona
 FRPpQ/12gmxb7cI1S6DgyYzkWLp1sTlFpaQUrSjNWfeZQk4R1X3xCxCOOJoFCIogQ3aN
 wM6lkGxHFSHdPeBEbNJbzuHdVLkrcvO6qxsFBTJiJouT9f9deoUcs6A6wnUiEHXirpuz
 gpkfuERPDEroach7qg4+solZZA7go8SsdT/h9SJnPz9nf7uikNjr3d632FL4cUFHXPv4
 G04g==
X-Gm-Message-State: AOJu0Yw7+6rCEcFZn1L/BDuzArNxN1xDdHfs2GZJ8BMaf/ATfN1IuY7G
 9pwkNrmQrVs/D0y6iSi6D4s+i+Pa9rE+qFvS5WX1Evn2/ZcCjiIn
X-Gm-Gg: ASbGnctXpqyzfNjJaZN7jFcq5Pj5+9zsc+zdw0SfgwrxfMD3NVrm8pKF+8G80huplKU
 mmRfWJSoonODOkYBZyl+3tAmH4x4TbqvjbUKr457uQIcwH4Rg6XMIHzkRk1cDrO3RLjt7t6O+Pw
 ogGylhFwYAyjKPiliao/2qd0taCskWr9PFr2O7v5qey9NKH6QM/+RccGgFjqV080o9Xy5Z/ETI9
 qQ9rpVSg6Jr1QTSyGr0yCcgBpQGyIpvAmc7JPoTfj9fvA3AvzuH/KUhhelekTyLd5ea5xrTX6/0
 nnJPYTZMpT/jwmrcGE/ZFfLhUqkikEblekr/kQrP71I=
X-Google-Smtp-Source: AGHT+IH9E8XsbCxLfsVsslPNMo/cSHYFTOjiDQDxMCuBzObL12vZxjJVRmA/QuSkAieMl45UO5T2kA==
X-Received: by 2002:a17:903:2ce:b0:215:9bc2:42ec with SMTP id
 d9443c01a7336-22a8a0b3744mr133132005ad.47.1744019657677; 
 Mon, 07 Apr 2025 02:54:17 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-229785bfddfsm77213805ad.66.2025.04.07.02.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 02:54:16 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Jianhua Lu <lujianhua000@gmail.com>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 4/4] backlight: ktz8866: add definitions to make it more
 readable
Date: Mon,  7 Apr 2025 17:51:19 +0800
Message-ID: <20250407095119.588920-5-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407095119.588920-1-mitltlatltl@gmail.com>
References: <20250407095119.588920-1-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 07 Apr 2025 11:40:40 +0000
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

LSB, MSB and their handling are slightly confused, so improve it.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/video/backlight/ktz8866.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/ktz8866.c b/drivers/video/backlight/ktz8866.c
index b67ca136d..5364ecfc0 100644
--- a/drivers/video/backlight/ktz8866.c
+++ b/drivers/video/backlight/ktz8866.c
@@ -24,7 +24,9 @@
 #define DEVICE_ID 0x01
 #define BL_CFG1 0x02
 #define BL_CFG2 0x03
+/* least significant byte */
 #define BL_BRT_LSB 0x04
+/* most significant byte */
 #define BL_BRT_MSB 0x05
 #define BL_EN 0x08
 #define LCD_BIAS_CFG1 0x09
@@ -47,6 +49,8 @@
 #define PWM_HYST 0x5
 
 #define CURRENT_SINKS_MASK GENMASK(5, 0)
+#define LOWER_BYTE GENMASK(2, 0)
+#define HIGHER_BYTE GENMASK(10, 3)
 
 struct ktz8866_slave {
 	struct i2c_client *client;
@@ -105,8 +109,8 @@ static int ktz8866_backlight_update_status(struct backlight_device *backlight_de
 	}
 
 	/* Set brightness */
-	ktz8866_write(ktz, BL_BRT_LSB, brightness & 0x7);
-	ktz8866_write(ktz, BL_BRT_MSB, (brightness >> 3) & 0xFF);
+	ktz8866_write(ktz, BL_BRT_LSB, FIELD_GET(LOWER_BYTE, brightness);
+	ktz8866_write(ktz, BL_BRT_MSB, FIELD_GET(HIGHER_BYTE, brightness);
 
 	return 0;
 }
-- 
2.49.0

