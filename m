Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A4AB2F7FE
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 14:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D36710E967;
	Thu, 21 Aug 2025 12:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NJXbh8gX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76E210E967
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 12:30:24 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-45a1ac7c066so5666555e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 05:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755779423; x=1756384223; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GFauEFqH4elwkI9ughIf+IrmIT0Pv7YSC5PWnrBVGQc=;
 b=NJXbh8gX+C7oYJt9hiYkDl95GpaaehNHrRfzDrsJhytq3ooKeEo8vhy3zlwNqnXyap
 UGGrrpEh/XsTr9+DrdQPRfAmi9Y6XCb2E8uOvCIy1Z0OJDTTV3k/QJHHglkFlaL0rkOE
 NHlnI2ovrE5tBnIERmYix6qcPNT2bnkSfwOU85AEuDHMZguBmvEf40Z/8/h9zPRzC/z6
 FJ/B0CNot0m8SlnV5DoVGo6L445qnhRkeCdzPIl8RFEjiNETKleQcjwbw4AHn+Vhxe2m
 Cs9lyScN2sdayPiQpYrM8+zCr7FjtHJ5pH4UeuxSf00h79/K9IKlSZGsDvmP6Xc5CtMS
 MkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755779423; x=1756384223;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GFauEFqH4elwkI9ughIf+IrmIT0Pv7YSC5PWnrBVGQc=;
 b=fkbFrCmdEDqtHvq4k2x0mHzqLDcLEoEus7hm9/UJZqOZ02QiBJDH0JnTrP2gXLLpi9
 0m+2ywh25vRbtwqyT18d093WAW+0yLzxbTgq4qehzxA1sjTOYax7/CKbsk+QSLDX28Pe
 SVW6XUXtvaq4Tpy2fIMqDUqJfFMNskGxxSj1zEuAdKF1S4duuMO1HtwXD4SaOtG87Vq1
 QDrPXB6M2rbB1i+J2htWDXK1f+60vRJzA5DIlOJ1X7X68U+ySLAhZoDLh4EBxcwVMn8F
 PrmulMO1/B4FyumRWen4NoOR9ZQr/WAuYvC0+rYzZHo3/s05X1jnoTk5GZwl2Vn9k5yu
 imcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBKiNA5J+LcJan5exIaSNgyVwjj8on/SoOIaCmMHqG3eCXc218fRu7PhcFXbzw5v9ildrm4fWWSbY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzeEw7y1TqgEyNHoT2rfGthZ/iNREpYYFURVBlkWipykIZro8r
 lbjwr8K9rIjAxceJ/Jt11TB8aQc7p9UMjnN+aYhTIJIKuP3RR5l5Zbx8wq5sMJDEpfM=
X-Gm-Gg: ASbGncspKk+9LHViAGdOPzxnx6Va8sckQjvmM8W3navAT0SKM8QThrJ1mjdo3V5RPvW
 0Gq23nGhK6dJthpIRV+WDttBvWgxxi0vEdDxec62mom0KvHO4YjRpud4fVJSme1ixa0HoN8XzyN
 8qBZBldcbvMqTiuZ7Nqalyvbtn31Near+RbnI8hATvYFUrcL7c7ySll8uRoW7n1ZGzvTCboB4th
 cK989jqjKMG7OI3JbMdvtxy352I+K2MO4vMaLP6ZLCHauM7+Ae8SZsh0LyBaQ2dk5GTovcUR4vE
 eNrYJtHIZfM1l6O0Iew7Kcy5rWYlSPzrRlXVD4l3vR0flUkq3EjV5rj1I8tf+dtHLLPKE6Jwq8m
 SC8kvbPRCBQ5rcmmQFTi7ZCcJIUxiYBz3euHbIA==
X-Google-Smtp-Source: AGHT+IEWBahCm/HEzs2ekfN68QoHcjk05inm/vBZ5gGcwgu+SVeuuRQ6tuDqkyo9Irqu2mxhLByrvA==
X-Received: by 2002:a05:600c:3592:b0:453:6c45:ce14 with SMTP id
 5b1f17b1804b1-45b4d8deab0mr21551295e9.4.1755779423385; 
 Thu, 21 Aug 2025 05:30:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b4db1b7b3sm29415745e9.4.2025.08.21.05.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 05:30:22 -0700 (PDT)
Date: Thu, 21 Aug 2025 15:30:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] accel/rocket: Fix some error checking in
 rocket_core_init()
Message-ID: <aKcRW6fsRP_o5C_y@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

The problem is that pm_runtime_get_sync() can return 1 on success so
checking for zero doesn't work.  Use the pm_runtime_resume_and_get()
function instead.  The pm_runtime_resume_and_get() function does
additional cleanup as well so that's a bonus as well.

Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/accel/rocket/rocket_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/rocket_core.c
index 72fb5e5798fa..abe7719c1db4 100644
--- a/drivers/accel/rocket/rocket_core.c
+++ b/drivers/accel/rocket/rocket_core.c
@@ -74,7 +74,7 @@ int rocket_core_init(struct rocket_core *core)
 
 	pm_runtime_enable(dev);
 
-	err = pm_runtime_get_sync(dev);
+	err = pm_runtime_resume_and_get(dev);
 	if (err) {
 		rocket_job_fini(core);
 		return err;
-- 
2.47.2

