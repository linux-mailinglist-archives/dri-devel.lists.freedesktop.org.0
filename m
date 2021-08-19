Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE60E3F1612
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 11:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22726E4A1;
	Thu, 19 Aug 2021 09:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4540E6E4A1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 09:23:14 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 cp15-20020a17090afb8fb029017891959dcbso10898436pjb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 02:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=h53VrRaVODOUeaASxu3LlTru8f6j4v9P9TloFFkcEcA=;
 b=CzsnM6U/cjXG/NCoDfm3CUajy8E5hfCF/zpxbJvvm7Gfjd+TGCFwMZU3WBwnawNOPb
 AgmiY6oTM/iw0UgFjF2/tFyeDLVXIcURg7GyWYe4jYOExevTB/AYjx8S0MXu3VJFAwSf
 v1he+X5ld2Qrj5o1aNvHtTa/0bRqbbPa1wcfPHvrK6k90hICkqEA1JkBzekixgYvSRTH
 ZQqY16VIsoxw09HG2IrCIZ7WArBenXkokw4EgxUdK0ex3PyZ8LszjpwBpf2f2a/B8lQf
 KT6tQBsy5t71RtV/MqLM87+jXYuzVfVRTgEOc7dciiC7fLl9FJAyn/IyKapOUCKzWLDc
 jwqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=h53VrRaVODOUeaASxu3LlTru8f6j4v9P9TloFFkcEcA=;
 b=KzEs9Mp1aLNMatV04T0eRnZy93p8m5bKjoRmFDVqOyhrg4MALajvjFJ2qYCvZT8/1f
 phcpzojhnbxEbXTqtmdVpKKnXxS+9ofZcyTc39AXgOXQtuXk2omprqP41sXGz/AX27E3
 BbuHlVtLQ8dMskiv/v+ypwVxP+A5OmXszhqMz3h1WBHFA00KUtThvkxgf21o1UB7atb0
 Qgg0gMc6xQ+PzBVa8bORQCj6q8Dgjifj6hwJ0u9lEmYsb9V0CATJB1/89BtYZ9/HVN2X
 ok9TJhwY5NImJXVQ+9bLdK+6C2KNp7oQSI32FatOki0VW3rSrnuVqHUtLTpqjDuC6Nhl
 HUYA==
X-Gm-Message-State: AOAM532p1+N/ryAgpt51nWixZXL2rpYLC81/oZG3Q+TgUFWMUo3fLCm1
 SR8p+rs6gTBIPbFIqcZKnNt2lQ==
X-Google-Smtp-Source: ABdhPJx123ffuozesbfbeeSZdxGu0bcl6dvfj7nOvOiuNnkaTmGWOxn9iaaMzrvykG0QTSXgex3c+A==
X-Received: by 2002:a17:90a:940e:: with SMTP id
 r14mr14036424pjo.41.1629364993842; 
 Thu, 19 Aug 2021 02:23:13 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id g13sm2661514pfo.53.2021.08.19.02.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 02:23:13 -0700 (PDT)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: xiazhengqiao@huaqin.com,
	dri-devel@lists.freedesktop.org
Cc: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH] no review: test for uploading patch
Date: Thu, 19 Aug 2021 17:23:03 +0800
Message-Id: <20210819092303.5466-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
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

no review: test for uploading patch

Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index db9d0b86d542..b2240eee688e 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2018 MediaTek Inc.
  * Author: Jitao Shi <jitao.shi@mediatek.com>
  */
+/*test for uploading patch*/
 
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
-- 
2.17.1

