Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4446E9246A9
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 19:49:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE4010E259;
	Tue,  2 Jul 2024 17:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j/Bi3tb1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF2210E61C
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 15:01:19 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1f65a3abd01so31080325ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2024 08:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719932479; x=1720537279; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kccJC5x8mJGzE036SHnXkNKeOkpSU8i0/myZGjFkRi8=;
 b=j/Bi3tb1Fvl0xWaOvpHtpkujJYb1Tz1Z8ZECkVjrpPxI/Kw809eDvKFru9NouTpTNo
 h4CI8drrYRZq/ADkKFRBGosbHqIpUsrkupPFm/UzMPda94XnxWoVTUKBIfJI4O8gGoTM
 /YwIWH52tUsuewAIq1n2yqh3KI0lBbXwsVFAjPT7GJ4ej9AXwlKiu7mC/qAyDI+H/jMV
 AJ0fVeU9UaZdzKkK60g+e1mtFn4HcgvXE54Ttbjc8lcXNbV2hi1U3JQrFMhH53IXHfWF
 ZOIxW0KapNg/tEfqIvM526RsMZDbxi6/9luOiLiY8Rgu8Rpa+uBKvNZ8G1e/2mLa9aiQ
 K7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719932479; x=1720537279;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kccJC5x8mJGzE036SHnXkNKeOkpSU8i0/myZGjFkRi8=;
 b=mCR5u/QScw//TRdeAUv1GW9jDYSaK1gjJ02phKxfhe0fU5APP9F+jqwgpr6bksJmbI
 gghSFIvrnQOBkDAbAepX3cXG+zRdK9eaTR1eWa9fKyVrXqPMXlMDL0Eux8xaJj+1WZjF
 ENQ3Gnk8HU2w1I0KwC5bnBtLY9+xcHdzYF92ihe84a0EnH1qUeEkjiKj+p6u9cSnHlPk
 ddNNB7QHJ1GybUb6FLYxAx2wPSxWALQZrTJv/oakeh+dQ8Jte2TcyIoLV4VXzlkguiL8
 xvd9zJp7yoWXTb+DgE68QLbAbitjNrjsa2kmyjjYsLSUclfkHtrCTdIGDwkUS45BSwUh
 wpcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCu+I82J9jiBlebhfPWN+hkH/R5bBnCEj6YmaeU+JvAs962PWEuuLjQQXEuCC6bFUs1j+cGezLYG5DxfIi6INcHu34QJsptEukWnC7GSPf
X-Gm-Message-State: AOJu0YwSoVHYmjZyoV83xYLoyX7WwgdT23j4mbL7B4Owz3mAwYJ6W62H
 9UHjQwlCAUGXzpo+R7luA+tqpKltvpM0gXhZeAoAWn2jywkiKM6k
X-Google-Smtp-Source: AGHT+IE7mDrMbY3nNfbC0OUxkT91CI3YYSTu2s7yLJufJoLhDvsBQaufm8doEdyDfmd+GBWU7/FyWQ==
X-Received: by 2002:a17:902:e841:b0:1fa:9c04:946a with SMTP id
 d9443c01a7336-1fadbc5c2a9mr90903915ad.1.1719932478846; 
 Tue, 02 Jul 2024 08:01:18 -0700 (PDT)
Received: from dev0.. ([49.43.162.163]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1faf92ee538sm15371925ad.274.2024.07.02.08.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 08:01:18 -0700 (PDT)
From: Abhinav Jain <jain.abhinav177@gmail.com>
To: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org, javier.carrasco.cruz@gmail.com,
 jain.abhinav177@gmail.com, julia.lawall@inria.fr
Subject: [PATCH] gpu: ipu-v3: Removal of of_node_put with __free for auto
 cleanup
Date: Tue,  2 Jul 2024 15:01:09 +0000
Message-Id: <20240702150109.1002065-1-jain.abhinav177@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 02 Jul 2024 17:49:15 +0000
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

Remove of_node_put for device node prg_node.

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: Abhinav Jain <jain.abhinav177@gmail.com>
---
 drivers/gpu/ipu-v3/ipu-prg.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-prg.c b/drivers/gpu/ipu-v3/ipu-prg.c
index 729605709955..d1f46bc761ec 100644
--- a/drivers/gpu/ipu-v3/ipu-prg.c
+++ b/drivers/gpu/ipu-v3/ipu-prg.c
@@ -84,8 +84,8 @@ static LIST_HEAD(ipu_prg_list);
 struct ipu_prg *
 ipu_prg_lookup_by_phandle(struct device *dev, const char *name, int ipu_id)
 {
-	struct device_node *prg_node = of_parse_phandle(dev->of_node,
-							name, 0);
+	struct device_node *prg_node __free(device_node) =
+		of_parse_phandle(dev->of_node, name, 0);
 	struct ipu_prg *prg;
 
 	mutex_lock(&ipu_prg_list_mutex);
@@ -95,14 +95,11 @@ ipu_prg_lookup_by_phandle(struct device *dev, const char *name, int ipu_id)
 			device_link_add(dev, prg->dev,
 					DL_FLAG_AUTOREMOVE_CONSUMER);
 			prg->id = ipu_id;
-			of_node_put(prg_node);
 			return prg;
 		}
 	}
 	mutex_unlock(&ipu_prg_list_mutex);
 
-	of_node_put(prg_node);
-
 	return NULL;
 }
 
-- 
2.34.1

