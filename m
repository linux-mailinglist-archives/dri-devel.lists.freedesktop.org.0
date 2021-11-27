Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BF146065D
	for <lists+dri-devel@lfdr.de>; Sun, 28 Nov 2021 14:09:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60126E21A;
	Sun, 28 Nov 2021 13:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E5D6E072
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 22:20:45 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id a9so27245396wrr.8
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 14:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=RcsfDHfUB2SLfsSr4/knpCVaC32hbn+/iN/r6fAA2fE=;
 b=XaaIJHUTp8IcdEbc9gXaVfZ8d4oIuWsy9YkEhyAz5uMyC3XsFiaO3Dw4iRV/5n7isC
 PmJYwTxjKov29rlyfPuU9HpqLzWX71397ItbiMMGrd5limf0WTViW7s3P9cb1oxFvgoe
 2Xarl3fIFYPaQpHxSUAoqAvmDGPYmqixRVE6quIjYoIZe0+6lhDWbGt+DH59OY9oEEPh
 CU4i2KD4BRgNAIkXHfj4naS0W61/oKJ4jwgoQa+oCJaC1ESh/DxzCwa9ugR7s+jVcjn6
 7yc3zgcxohc5D+aP8azN6c8vxSzz4l01zT8AsUosyc8g1ZkM27L/jagYJ0SS70o1/6Bm
 Lkpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=RcsfDHfUB2SLfsSr4/knpCVaC32hbn+/iN/r6fAA2fE=;
 b=63yT+nMXFLO+9jY5fpfDLWWRvnMR2D8skwkhdN8qqdtgYHUUMZPWH+f0okZQLNH5jP
 qUMMo62/yoljqeG+09BLV9xU4eDNZRjGyu6VK2qaE4O0XrCiW9z8+XsXwgctJRZdnFID
 lZBTLc1TonUwKyvnuAd+fNF+fQ8mB4XHZpd5hP//ms3m6rps2ZZfiisjxkUh19/jv5JX
 DefW9fXJyKEjg/s94JdpYmsb406qMqI+xLCIcy341EeKA9utPOJa+MY8+vt1E7xFXYny
 OlSjxMsikEiKUGPa/zceamv2gvcoglB1MVOo/w9LAVvniFLSNUC7DX/lXxUVXHQ3l72A
 8aUw==
X-Gm-Message-State: AOAM532kVNQOwdCPF8SYGaNX/hE1Z6PkXcXbQgUrCBg6WD54F2cEw4xK
 c4d8DuJSO62aJgEj9T9Z8KU=
X-Google-Smtp-Source: ABdhPJyzeYQxJmGJ6/F71LynLO6vX94qvYNgIhTiN54TFgxHjOfiyNupkQsfHM9v9A3xef20pEr5zA==
X-Received: by 2002:a5d:5651:: with SMTP id j17mr23299333wrw.166.1638051643803; 
 Sat, 27 Nov 2021 14:20:43 -0800 (PST)
Received: from ?IPV6:2003:ea:8f1a:f00:7df6:9d34:4832:e4f1?
 (p200300ea8f1a0f007df69d344832e4f1.dip0.t-ipconnect.de.
 [2003:ea:8f1a:f00:7df6:9d34:4832:e4f1])
 by smtp.googlemail.com with ESMTPSA id e7sm12657588wrg.31.2021.11.27.14.20.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Nov 2021 14:20:43 -0800 (PST)
Message-ID: <aadbd32c-c0ab-4c8a-c590-3334f736f224@gmail.com>
Date: Sat, 27 Nov 2021 23:20:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] staging: fbtft: add spi_device_id table
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 28 Nov 2021 13:09:27 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After 5fa6863ba692 ("spi: Check we have a spi_device_id for each DT
compatible") we need the following to make the SPI core happy.

Works for me with a SH1106-based OLED display.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/staging/fbtft/fbtft.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index 6869f3603..3f1fbdd48 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -307,12 +307,19 @@ static const struct of_device_id dt_ids[] = {                              \
 									   \
 MODULE_DEVICE_TABLE(of, dt_ids);                                           \
 									   \
+static const struct spi_device_id spi_ids[] = {                            \
+	{ .name = _compatible },					   \
+	{},                                                                \
+};                                                                         \
+									   \
+MODULE_DEVICE_TABLE(spi, spi_ids);					   \
 									   \
 static struct spi_driver fbtft_driver_spi_driver = {                       \
 	.driver = {                                                        \
 		.name   = _name,                                           \
 		.of_match_table = dt_ids,                                  \
 	},                                                                 \
+	.id_table = spi_ids,						   \
 	.probe  = fbtft_driver_probe_spi,                                  \
 	.remove = fbtft_driver_remove_spi,                                 \
 };                                                                         \
-- 
2.34.0

