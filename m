Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 027627F0189
	for <lists+dri-devel@lfdr.de>; Sat, 18 Nov 2023 18:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DDBF10E342;
	Sat, 18 Nov 2023 17:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F3210E177
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 17:42:36 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4079ed65582so3881975e9.1
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 09:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700329355; x=1700934155; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ytoy8pfr5Vxi1e0JcRyR6n1bj9XY0g4pH3ARHnOackE=;
 b=E9PJiZG6FtYZkLaLgQA60qRmiIivuNtg2rIZT1s0Pt2yL9rQkpeJiLm9lsfrrwxv+u
 7XhX1MBGdDbFXTXOHAOl1PVLpAk/yPFdwpF69dDKGkPuiVtFzhIrIEv4JtPKr6y+rA8G
 MY2dbpO5GrFpEIBm21U7nlSeSFtbX2FTyV1irXAeuVQJHHPgBNe1S46NMr/DM7BtnQhQ
 Uzhdzh9jjp4FKOOjwmyB4Ame6UBLquOZv6hUdOHYEW9rfEi1MTjSqNGxiE7mSqEhVWme
 +ZwPhMUxQhozHC2bNUrAYIo0V5m7rbcqCGN/4dSNQE0rmH4XjjVgF6mfwZev0D+Q36vy
 tbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700329355; x=1700934155;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ytoy8pfr5Vxi1e0JcRyR6n1bj9XY0g4pH3ARHnOackE=;
 b=IpKJDWZCNGf0e1UPFfTRZpCtJ6qKIcgS2TpyCSL/L0BhNbf1isuGThzUFzciB4xdix
 /pRFe/+2y7GqdlVbvePsdTVovfjmCR4j/v4JCOTAGM13sidtS392HYPJ44ugq1L4bT4E
 hjc2gxOi1C5X1JsS3XQ+EPyM5MoFxuutL4YPqorKd75U7ZL+4FbqfKVQaFKTW/WjJspA
 kcUzvo4ktETnyJXugxJF3D6G6jfS0NX5CXyxYOriRVvBMXGHog9LonCNG5OlTwoLYiCM
 5vHQR2e5RoH2e1/cr73/iAG0cGQsHDmvVn5FICBfzmhEfbZuuJCL9g5kl5SXsJ1qY0cH
 Mu6g==
X-Gm-Message-State: AOJu0YxQN38TtWb6XYieahoC0mQrIOko5pNTEWcqr+RWZB/elLDm7Fby
 U5ErOUI2CCpMHqzRV1Jl5Bs=
X-Google-Smtp-Source: AGHT+IFq5BOx+Vn0YrjLip0ldY3nSGhqRKbTkmX9+Fy3Wz36IeGI2djpG63W1qV3nbXzFeP/oHp0mA==
X-Received: by 2002:a05:600c:154c:b0:405:75f0:fd31 with SMTP id
 f12-20020a05600c154c00b0040575f0fd31mr2291085wmg.31.1700329354751; 
 Sat, 18 Nov 2023 09:42:34 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de.
 [2a01:c22:77bf:8300:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Nov 2023 09:42:34 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Subject: [PATCH v2 09/20] drivers/video/fbdev/via/via_i2c.c: remove
 I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 18:42:09 +0100
Message-ID: <20231118174221.851-10-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231118174221.851-1-hkallweit1@gmail.com>
References: <20231118174221.851-1-hkallweit1@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/video/fbdev/via/via_i2c.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/via/via_i2c.c b/drivers/video/fbdev/via/via_i2c.c
index c35e530e0..582502810 100644
--- a/drivers/video/fbdev/via/via_i2c.c
+++ b/drivers/video/fbdev/via/via_i2c.c
@@ -201,7 +201,6 @@ static int create_i2c_bus(struct i2c_adapter *adapter,
 	sprintf(adapter->name, "viafb i2c io_port idx 0x%02x",
 		adap_cfg->ioport_index);
 	adapter->owner = THIS_MODULE;
-	adapter->class = I2C_CLASS_DDC;
 	adapter->algo_data = algo;
 	if (pdev)
 		adapter->dev.parent = &pdev->dev;

