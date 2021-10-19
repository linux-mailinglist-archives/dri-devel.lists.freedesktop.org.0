Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDA94331D9
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 11:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471926EB66;
	Tue, 19 Oct 2021 09:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1C76EB63;
 Tue, 19 Oct 2021 09:09:58 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id t184so5769439pgd.8;
 Tue, 19 Oct 2021 02:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zWnbQ8jU1PuImQqBMv0ymywpDSXRWIX4TYs4htudQvU=;
 b=T+qGMFI1Iki8b/Y+kZzqOqZraGT2XFyr4W6PlZ1/AfRn3y9xSqmhpBEwtqJMGold+z
 rnHdGjDoHRYTSIA44vssYy6OHST8h8ARi/BvWAJ3AeX6rFmD/YO5v4p5xWgQwjO9iox1
 EEl0QSwFXw1D2t2zyTyKtf6eyR47zAJ+U2DN9el/UUGQhTMeG/sydPQT+7TPonuYa0Rf
 a+E51oQdw8ZnnP1r7JEKaulvSNcEmGNDzvV1EZYKpQaeTzNQKvVGLK1Tz77CLOEKctH3
 h9Ljolm7uOjZ4cmp/UbgEcGm/RVz1rF8QDPvfcKcEO7lMOYoAsrf9XpUJicBwQIEnR3J
 0rWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zWnbQ8jU1PuImQqBMv0ymywpDSXRWIX4TYs4htudQvU=;
 b=lvlwyocNaNJMLJIksOMkViV5/8TbVovxRn+IRl006M1Qs/DXRuOLjbM1Yk6TX07FSn
 pMsKM5a2kEDRiRHdhe4yBkiTOMTwofmXv2dVHYed0mfkPXeVH4N3Li1F3oimtsAXraHM
 iSz1YGbN/WXZJcdBBqGbj+z9fiokTa1jzTZesaZoopa5b2K5TD8fG4QmsBUaWtebHRC9
 oXKuro3bJgqJhFZp596R1GPt2396O5Ly6a4Yy6ru+gnJRn7M04+sw3tkd1kMzM745aF7
 FOlnuof5hmeI28kSudhblO8t56MJGIH8Ryzx46Sht9sPhGlH4mylxILBaz7nCuKD6CfZ
 7U0w==
X-Gm-Message-State: AOAM531YokvFG2pPoeCfHQBaH8EriCQEiqm/iq4YkG5KRGI3JEAqnIyi
 NzcbTs2KK4Z0L5dQ5OAF9HY=
X-Google-Smtp-Source: ABdhPJyj4NHbAw6lgwjnvbqwCFC137XbpGUbmoictCNKRA5/xKzV8TGBtI4cQiSXyifrWKEmLEpixw==
X-Received: by 2002:a05:6a00:1398:b0:44d:3234:dc31 with SMTP id
 t24-20020a056a00139800b0044d3234dc31mr33841668pfg.7.1634634597954; 
 Tue, 19 Oct 2021 02:09:57 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id v22sm15934057pff.93.2021.10.19.02.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 02:09:57 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ran.jianping@zte.com.cn
To: bskeggs@redhat.com
Cc: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ran Jianping <ran.jianping@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH mm] remove duplicate include in nouveau_dmem.c
Date: Tue, 19 Oct 2021 09:09:51 +0000
Message-Id: <20211019090951.1004859-1-ran.jianping@zte.com.cn>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ran Jianping <ran.jianping@zte.com.cn>

'nvif/if000c.h' included in 'drivers/gpu/drm/nouveau/nouveau_dmem.c'
 is duplicated.It is also included on the 36 line.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Ran Jianping <ran.jianping@zte.com.cn>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 92987daa5e17..f5cc057b123b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -33,7 +33,6 @@
 #include <nvif/if000c.h>
 #include <nvif/if500b.h>
 #include <nvif/if900b.h>
-#include <nvif/if000c.h>
 
 #include <nvhw/class/cla0b5.h>
 
-- 
2.25.1

