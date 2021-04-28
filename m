Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EE436D808
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 15:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F136EB30;
	Wed, 28 Apr 2021 13:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5720D6EB10
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 12:28:06 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id m37so2018517pgb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 05:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=FCc5BZu5iRztXIUiSt2+3FhaGtDlfucfxXcqT01eExc=;
 b=s1ybdI7WecLYnVPXzIG8r2ufsshTyUG6UBIgf5iZ9rQliaO9QErsrYXIa/i4JeqNQF
 NTu9m1+eajP/7Ozit9TFqR+4pw8P2Ja2s3PWyb+f91pWvvAARcpkSa+HnfVT/C/YVfvh
 n1crgTzs3K/MEAN/PW2chwCa1hS4loARDIabSVxomFETp3p/GHQ6A7vKf+mCo2pRHjPk
 iP54a/IAcobV9YjClrPOCz7bYoxN5yAG9KY9zz4dLEAwBwpm4yB+RkP4st+duj5Hhhcm
 mIXNDw134CsfCAfh/20N4PNaO70pYYZV7Z7MtExQtmJLlziHJgb6W+q0lVqgn0RcmV85
 /Olg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=FCc5BZu5iRztXIUiSt2+3FhaGtDlfucfxXcqT01eExc=;
 b=merTkw9P+a9wvew332S4Eu2ZHMTtyehCUws8XNyzjVenO2X5H5mXh+2k5oFiCCMX0h
 r3U1HkkpiujuCvxu+nZrQs+5X48ZG5Hz47FC2RTOMCFLS6Ixp4Xe/l0rpV6i1PVkNWSh
 tW+bxb044UgNYMSjMkdr1rjmYrGovIizu5MsspYPvpPlh5Iloa+xaX1JsrTGoMyUHoPh
 dLTvnGP1rEbvZaV2DLLMhsKN+7/J7p1f3BcMg3m602fwWLS84Iml+XyHEOQ0kvQ69Kc7
 tNfeJV+VLbnTaDburdXl1/fTqKzn7Y3ba4BwIs629qNN8QEZ3C+v5kv8pNUJxSTuisic
 zahQ==
X-Gm-Message-State: AOAM533KfBE2t7AZi0nCXXgYNCxKG5XJ6r9fnKjq0Q8rvRf53IO4Yi34
 dqP8w/MdYhdgMYK155Rdyoc=
X-Google-Smtp-Source: ABdhPJzFwvuMniv8ai0SvEHoZynqHjurs4c0D6rOCMpJ54ptB8lK6dKuU/popa6Id15ZLDpegNO2ww==
X-Received: by 2002:a65:6085:: with SMTP id t5mr26835510pgu.201.1619612884496; 
 Wed, 28 Apr 2021 05:28:04 -0700 (PDT)
Received: from localhost ([157.45.56.196])
 by smtp.gmail.com with ESMTPSA id l3sm4868719pju.44.2021.04.28.05.28.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 28 Apr 2021 05:28:03 -0700 (PDT)
Date: Wed, 28 Apr 2021 17:57:55 +0530
From: Shubhankar Kuranagatti <shubhankarvk@gmail.com>
To: wsa@kernel.org
Subject: [PATCH] drivers: i2c: i2c-core-smbus.c: Fix alignment of comment
Message-ID: <20210428122755.2s56uotb225rezcw@kewl-virtual-machine>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20171215
X-Mailman-Approved-At: Wed, 28 Apr 2021 13:07:41 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org,
 linux-i2c@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Multi line comment have been aligned starting with a *
The closing */ has been shifted to a new line.
Single space replaced with tab space
This is done to maintain code uniformity.

Signed-off-by: Shubhankar Kuranagatti <shubhankarvk@gmail.com>
---
 drivers/i2c/i2c-core-smbus.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index d2d32c0fd8c3..205750518c21 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -66,10 +66,11 @@ static inline void i2c_smbus_add_pec(struct i2c_msg *msg)
 }
 
 /* Return <0 on CRC error
-   If there was a write before this read (most cases) we need to take the
-   partial CRC from the write part into account.
-   Note that this function does modify the message (we need to decrease the
-   message length to hide the CRC byte from the caller). */
+ * If there was a write before this read (most cases) we need to take the
+ * partial CRC from the write part into account.
+ * Note that this function does modify the message (we need to decrease the
+ * message length to hide the CRC byte from the caller).
+ */
 static int i2c_smbus_check_pec(u8 cpec, struct i2c_msg *msg)
 {
 	u8 rpec = msg->buf[--msg->len];
@@ -113,7 +114,7 @@ EXPORT_SYMBOL(i2c_smbus_read_byte);
 s32 i2c_smbus_write_byte(const struct i2c_client *client, u8 value)
 {
 	return i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-	                      I2C_SMBUS_WRITE, value, I2C_SMBUS_BYTE, NULL);
+			I2C_SMBUS_WRITE, value, I2C_SMBUS_BYTE, NULL);
 }
 EXPORT_SYMBOL(i2c_smbus_write_byte);
 
@@ -387,7 +388,8 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 		if (read_write == I2C_SMBUS_READ) {
 			msg[1].flags |= I2C_M_RECV_LEN;
 			msg[1].len = 1; /* block length will be added by
-					   the underlying bus driver */
+					 * the underlying bus driver
+					 */
 			i2c_smbus_try_get_dmabuf(&msg[1], 0);
 		} else {
 			msg[0].len = data->block[0] + 2;
@@ -418,7 +420,8 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 
 		msg[1].flags |= I2C_M_RECV_LEN;
 		msg[1].len = 1; /* block length will be added by
-				   the underlying bus driver */
+				 * the underlying bus driver
+				 */
 		i2c_smbus_try_get_dmabuf(&msg[1], 0);
 		break;
 	case I2C_SMBUS_I2C_BLOCK_DATA:
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
