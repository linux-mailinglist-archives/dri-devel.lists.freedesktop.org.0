Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D82F96DBAF0
	for <lists+dri-devel@lfdr.de>; Sat,  8 Apr 2023 14:38:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F3510E167;
	Sat,  8 Apr 2023 12:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9F110E11E
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Apr 2023 08:18:38 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 60-20020a17090a09c200b0023fcc8ce113so3063162pjo.4
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Apr 2023 01:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680941917; x=1683533917;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bVLjHTnOtdfrJmTguxNf65pHe59NsHzZRHirsqU2kkI=;
 b=LAkalLbOacgneAq/9b8eeeOoWRMpWZze5EjlrBhbPhcJu8WyMkwdeaBsZfHX+WNzMD
 dz60VvUvcmOQoLrqDopgqWu+mtWYcqPHmaKFZh6gIgVIS5mgiZIfczY1SRXgPV2SobAa
 3eYpJfNCkhxRQoZ62c71hVvEcmZSMdFk98VqqTPaKPSMsfjLmoxHX6E2V0O/Gzmso0W5
 Pxd3kwS0pi5f2esDq+fSIGIpLqW939GitYraC8A85/XLgRLnURCPhE5QV6/Qxqz+a01y
 onWw2G55D96NGWu98LyYc93v37bITK4fBllZRVitQlyvdYTzWjCrQTShJrlQrldetbC4
 w2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680941917; x=1683533917;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bVLjHTnOtdfrJmTguxNf65pHe59NsHzZRHirsqU2kkI=;
 b=sSwfvl2R0XpD3GeZicz2xqEWsw5DU0Mpj/kTqj2BjL37G2cNn8nIE/xExUNJD/+kYc
 0tpk29/onquCwHmH9Na9Os4bRoyzxliqdG3rZ3Q4RiQ30JFdxnFLqfHE9iJ4s4qIHV1A
 lj39ra7x21KYS5yf+kauewVCFWYu300+iU60T/aoITRfQdG538QrdIWfy4wfl9Mm8s06
 8QkEmlJA22CQA5f2sv3UWG6aZGMlSrwkFQ4LzQVJDVgmCLpZRxyH4SDQxiq11Mxn+xV7
 0NGKnxzgIDjLnBIZ5VRLfduITj5ug1Zb357LT/MQeYt8hVvkBeNsOwm1cR1uD3gGbt21
 9dqw==
X-Gm-Message-State: AAQBX9ffwKkSHjKuKJ2KZwsmAdN86PiLKfSYBFKlgOMYOgnaJfIDjU6C
 oIvm+oWuvc5Xp7+0o/AKe2s=
X-Google-Smtp-Source: AKy350bL0LN8dYz+jJU6fEe9hPwD6r8Q52aLOrCDPnHNJ9uC8agiAAXug61dMxZjdY0aZTUZ5aK/dw==
X-Received: by 2002:a17:90b:3b42:b0:240:1e0b:a7b7 with SMTP id
 ot2-20020a17090b3b4200b002401e0ba7b7mr1780396pjb.39.1680941917202; 
 Sat, 08 Apr 2023 01:18:37 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:682f:3808:8475:d375:707b:4600])
 by smtp.gmail.com with ESMTPSA id
 14-20020a17090a08ce00b0023f21584dc7sm3796658pjn.55.2023.04.08.01.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Apr 2023 01:18:36 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH] staging: fbtft: fbtft-bus.c added params
Date: Sat,  8 Apr 2023 13:48:17 +0530
Message-Id: <20230408081817.81562-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 08 Apr 2023 12:37:55 +0000
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
Cc: Deepanshu Kartikey <kartikey406@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Added cpu_to_be16 param in define_fbtft_write_reg

Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 3d422bc11641..228a5430c1d5 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -62,9 +62,9 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
-define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, cpu_to_be16);
+define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16);
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, cpu_to_be16);
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.25.1

