Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A24F7799C17
	for <lists+dri-devel@lfdr.de>; Sun, 10 Sep 2023 01:39:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0CE510E070;
	Sat,  9 Sep 2023 23:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB5110E24F
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Sep 2023 02:37:58 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-31ae6bf91a9so2570309f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Sep 2023 19:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694227076; x=1694831876; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ns94deEcHjel6nQ1TGFbMXtKxyda3gMJk7c5GId3pbs=;
 b=YPY6EKXLLo9X0IZSfXyJB3vtTqazSuy0K+LFb2D496QpNaikw/JsqIFnTXm9vjjRKn
 0VIxI0w/yh3rQSUrLfB1G2KrQTjeHN1QPb7jpmUHLCYECSVRT+YZ2HZfHd1SFMaLdyyy
 ZgjYb7dQiHA9vLo9KHLmqNleLDaJybnMk1CtUus1iIAbhU1S6dIznXdlf9uJA82KB+Gn
 vJYLeAHixl4hdVjwLol4fCekhCNB+xHE5Z28KXmRCY9fvgkYjwIYUOO0iiu/57QhxcN+
 mUbb8gqXZvHFtPOg8jqu8r3/3kmdK309gKLC5k7zU1wTgutonNxi9QuTRm5Ydc9aQPcq
 0umg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694227076; x=1694831876;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ns94deEcHjel6nQ1TGFbMXtKxyda3gMJk7c5GId3pbs=;
 b=Fg9vZDUdNAhRVE/wU4KMfpNDa+l2ZH2ij0PCnqoFuhG1V8jZB6uBdAudQulMAVYXBN
 04eznYgxPDTnKsS1OH7nCnquRYnLol1b9NpBbd8BPHkv8pxC/CPWZ32eVcktEEViB0/E
 ceJ6SrCwriu9tieV4jEcYUicjgc5o0mbugkOzsADVINXjKX0jfOJ6XLaXNUjUbqpwBlL
 2/W/gcz47oDU8ROirCrW1NRBMfGAXYPp9+6Cmj8mh40NBbQoHBiXrfrHplwkIQbUGwdg
 vg05KLitgnzJTYO1YU+TQBTHpwuAgN4BU7/1Byj3cDcE2mDJaKrDpTxX04M4hMcsI913
 8zNg==
X-Gm-Message-State: AOJu0YwDKW2qODTa0V7lwWywutyVOkn1XuYx6+GB82aE3NszS1XXd7oC
 wgqlPiMM1HJp6vPSqu6Ly6n1eGr42urKHA==
X-Google-Smtp-Source: AGHT+IEAPIQOKeSHcuApfMz8EZMTPQCDXN0yF4mBf8BdfQBb7jcAXkLRt8Wi7ri/SFIJG4CQAyJZqw==
X-Received: by 2002:adf:ef91:0:b0:311:1dba:ca65 with SMTP id
 d17-20020adfef91000000b003111dbaca65mr3461705wro.51.1694227076081; 
 Fri, 08 Sep 2023 19:37:56 -0700 (PDT)
Received: from tora ([37.167.113.78]) by smtp.gmail.com with ESMTPSA id
 y11-20020adfd08b000000b003140fff4f75sm3455622wrh.17.2023.09.08.19.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 19:37:55 -0700 (PDT)
Date: Sat, 9 Sep 2023 04:37:53 +0200
From: Alicja Michalska <ahplka19@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge/analogix/anx78xx: Add missing definition
Message-ID: <ZPvagaXnQ/TlNEkJ@tora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Sat, 09 Sep 2023 23:39:17 +0000
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
Cc: neil.armstrong@linaro.org, rfoss@kernel.org, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Analogix ANX78XX driver is missing definitions for anx7816.
It uses the same I2C register set as anx7818.

Signed-off-by: Alicja Michalska <ahplka19@gmail.com>
---
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
index 800555aef97f..1ce4acc01bf3 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
@@ -1211,6 +1211,7 @@ static const u16 anx78xx_chipid_list[] = {
 	0x7808,
 	0x7812,
 	0x7814,
+	0x7816,
 	0x7818,
 };
 
@@ -1377,6 +1378,7 @@ static const struct of_device_id anx78xx_match_table[] = {
 	{ .compatible = "analogix,anx7808", .data = anx7808_i2c_addresses },
 	{ .compatible = "analogix,anx7812", .data = anx781x_i2c_addresses },
 	{ .compatible = "analogix,anx7814", .data = anx781x_i2c_addresses },
+	{ .compatible = "analogix,anx7816", .data = anx781x_i2c_addresses },
 	{ .compatible = "analogix,anx7818", .data = anx781x_i2c_addresses },
 	{ /* sentinel */ },
 };
-- 
2.41.0

