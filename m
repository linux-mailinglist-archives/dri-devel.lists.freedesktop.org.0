Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEA6735E74
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 22:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73AA210E0C0;
	Mon, 19 Jun 2023 20:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F0F10E0C0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 20:26:50 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-39c964db274so370902b6e.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 13:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687206409; x=1689798409;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LqYw0k/c6fMgr+wQasp2SBFlrJizN8fWP9xks0ZL9GY=;
 b=kC8UzNK/AlcvdsOiY+X6E26rRGhjRpoNX8UG52BYfiyXls1RpKMDyJTZYELFU7hHZx
 rDwfipTRAuJrn4qSV1vaE3QZnvuqIn8jsOyUFMsjEzBqhW3A9ogiTAv2rYoy7Dnr2/ZS
 1pkhidstC+Yd3naNbBqOhpH/dHOf/7Vf8YUCOEd2sbcl2AK7a0gBOzW7qc28tzKYRI5E
 9Xk0gqXNwXeZKqcuTKUJZBFevBaNuwFqCY2dBMy1k8774AXUMH1i10qnDY6dPpp9WnCS
 jzYyPf3DVf6pGgPaqHpP5X4VEOptZz+yFc8RBHa7zCK8bbnQ/wko0DZBZCj6Au7L4//9
 j2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687206409; x=1689798409;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LqYw0k/c6fMgr+wQasp2SBFlrJizN8fWP9xks0ZL9GY=;
 b=IJylNJQxYrWtr1wUa4zufL/p8nmvRo4UVLZiE4k6DNLM6D6px2be5ugvi7B9K/z5s/
 zV/229H7HgGwPW92Hmv83EKItP0udnCQztrlcbGe+KNXWBB6Nu+8ooIpAIRFyDq5mBQE
 QXlL+B2Z3plSlOlliVZ4SyUT4Wm9rgT3qf2VhhjCl1m3Q9MalPVcuBbJfas9xisPpxpj
 xEbNevJh7ShwrmHK7+bdcmWxHROM0knLu7RSE7MjjE4fVxt2enV+kdmHp2Wur1QFjVba
 p9BE4B3ZIJQaXS14ELAngd6guIjIo3PAFxFprd4xEixDOzrW3BuN7URYLBK/9x2KDlWy
 hKuA==
X-Gm-Message-State: AC+VfDyFbNY02ZokXjWSXob6G9fyevrg+cf9MkjpMQZ3PKebKpTkJ66U
 22O75VgU0bOQ7ellfoA9MKQ=
X-Google-Smtp-Source: ACHHUZ5XKnEKFiiS8Apnde8J3zw7VsmnSDtkvPsPtz1v+fdQG0S76+OFTiqbS7MW6Wy4xqQ16HKIzQ==
X-Received: by 2002:aca:e107:0:b0:39c:ecd4:8749 with SMTP id
 y7-20020acae107000000b0039cecd48749mr6729440oig.5.1687206408933; 
 Mon, 19 Jun 2023 13:26:48 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:242a:9de7:857c:2e7d])
 by smtp.gmail.com with ESMTPSA id
 bi19-20020a056808189300b0039eba9babe9sm314257oib.48.2023.06.19.13.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 13:26:48 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Subject: [PATCH] drm/panel: simple: Add connector_type for innolux_at043tn24
Date: Mon, 19 Jun 2023 17:26:32 -0300
Message-Id: <20230619202632.604748-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Fabio Estevam <festevam@denx.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

The innolux at043tn24 display is a parallel LCD. Pass the 'connector_type'
information to avoid the following warning:

panel-simple panel: Specify missing connector_type

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/gpu/drm/panel/panel-simple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index a247a0e7c799..7c80528d571e 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2178,6 +2178,7 @@ static const struct panel_desc innolux_at043tn24 = {
 		.height = 54,
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
 };
 
-- 
2.34.1

