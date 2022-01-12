Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A323948BFCB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 09:25:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87731112680;
	Wed, 12 Jan 2022 08:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8783112680
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 08:25:31 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id c10so2224530qte.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 00:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZCLOQ7++2QfW2m0rsDei0rqRdeUSY6GZN2Og7N4emHA=;
 b=e/9d3uN74jIVDOPjqrRRJ2tN67VjP3qJyvuMPgJUm/fdVftErmvOhNEHTin3X20KRO
 QNpJmvEceXwzVypa0yqYvAqpb2Ms6l/dBf+J3EKFpNC+KEjVg6hIzQ5vx8VNG+4DBlnC
 80NGcpqm0Lt3MUJfAltzBdg238hC5yzTjU3jeRl/7G9hN4TBq/qIPy5ScLTkXv/Oztpz
 iXcu8tiTdJcsu9uXogSYLGWzAdxD9h8GEsEZnwMq7QT7boaYHXhU68y/VBQZaNp9wR6Q
 b7eoiPDH8B4ja51jgn0Z1nYTNDWCzAYgrvC346+O4DUY/ve0kmwafzlgaYznuTGHtaoc
 AZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZCLOQ7++2QfW2m0rsDei0rqRdeUSY6GZN2Og7N4emHA=;
 b=oCxjIPxPEsc+GUitgDjdiQx4xLLMiX8Fqh7EYTmuSokrywD8cRI4L4ujep7G8fynsd
 lKgh3KKanHoj01vlcOD6S/NN9wFJmueGOty2q3OZgxm6VnVJ2QjjvxOAGVneS3i+C7zf
 x4pJexBLSYWHO7u6sIlfYnbdTvfkJ5XpfTYT18YaLSRUgFZoQPWOAdz4zbM/06A4foVQ
 PwfGwf16UpnZ2dDCf0JJa5+Et1trhA21dGcYr+zeR4sora6uoidHJC+bJmoDrW2jLIza
 6lwslyzvppZEsK2SbNA9vsdAaKcuNyzD6ajMBWTwqelckbzm3a1HZcO2Ox1uiLV+2ABn
 Zc6A==
X-Gm-Message-State: AOAM532tansfVXhUaL7OGQzH3TDbCimcZ5T7VP5im3TiooLmLFISqz/y
 KRSdyKJO8dy5ozLw3hUNBeY=
X-Google-Smtp-Source: ABdhPJw9jOsXa56W5lqO3RFBU1VEoiy8scsNFVqmufsWd3jsHB+kGetR7roaTSluD+Ll3FNGH4X1Ug==
X-Received: by 2002:a05:622a:14cd:: with SMTP id
 u13mr1768837qtx.532.1641975930836; 
 Wed, 12 Jan 2022 00:25:30 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id l20sm5367458qkp.121.2022.01.12.00.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 00:25:30 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: patrik.r.jakobsson@gmail.com
Subject: [PATCH] drm/gma500: remove redundant ret variable
Date: Wed, 12 Jan 2022 08:25:24 +0000
Message-Id: <20220112082524.667552-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: airlied@linux.ie, CGEL ZTE <cgel.zte@gmail.com>,
 Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 Minghao Chi <chi.minghao@zte.com.cn>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Minghao Chi <chi.minghao@zte.com.cn>

Return value directly instead of taking this in another redundant
variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
Signed-off-by: CGEL ZTE <cgel.zte@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_dp.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index ba6ad1466374..74e67679714e 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -82,7 +82,6 @@ i2c_algo_dp_aux_address(struct i2c_adapter *adapter, u16 address, bool reading)
 {
 	struct i2c_algo_dp_aux_data *algo_data = adapter->algo_data;
 	int mode = MODE_I2C_START;
-	int ret;
 
 	if (reading)
 		mode |= MODE_I2C_READ;
@@ -90,8 +89,7 @@ i2c_algo_dp_aux_address(struct i2c_adapter *adapter, u16 address, bool reading)
 		mode |= MODE_I2C_WRITE;
 	algo_data->address = address;
 	algo_data->running = true;
-	ret = i2c_algo_dp_aux_transaction(adapter, mode, 0, NULL);
-	return ret;
+	return i2c_algo_dp_aux_transaction(adapter, mode, 0, NULL);
 }
 
 /*
@@ -122,13 +120,11 @@ static int
 i2c_algo_dp_aux_put_byte(struct i2c_adapter *adapter, u8 byte)
 {
 	struct i2c_algo_dp_aux_data *algo_data = adapter->algo_data;
-	int ret;
 
 	if (!algo_data->running)
 		return -EIO;
 
-	ret = i2c_algo_dp_aux_transaction(adapter, MODE_I2C_WRITE, byte, NULL);
-	return ret;
+	return i2c_algo_dp_aux_transaction(adapter, MODE_I2C_WRITE, byte, NULL);
 }
 
 /*
@@ -139,13 +135,11 @@ static int
 i2c_algo_dp_aux_get_byte(struct i2c_adapter *adapter, u8 *byte_ret)
 {
 	struct i2c_algo_dp_aux_data *algo_data = adapter->algo_data;
-	int ret;
 
 	if (!algo_data->running)
 		return -EIO;
 
-	ret = i2c_algo_dp_aux_transaction(adapter, MODE_I2C_READ, 0, byte_ret);
-	return ret;
+	return i2c_algo_dp_aux_transaction(adapter, MODE_I2C_READ, 0, byte_ret);
 }
 
 static int
-- 
2.25.1

