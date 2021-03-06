Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2440532F9AA
	for <lists+dri-devel@lfdr.de>; Sat,  6 Mar 2021 12:18:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CB06E500;
	Sat,  6 Mar 2021 11:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B926E500;
 Sat,  6 Mar 2021 11:17:58 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id s16so2687100plr.9;
 Sat, 06 Mar 2021 03:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xdaYIHbo42EzW4+tTrCCIBJZrl43XKwjfdhXKE79QkI=;
 b=OU8IkoIgBcGiyXFXs7IFjfZBTGGs0bWhDh2k3i2p+t5/sRh2gppxbcqpCrkBP/7Lne
 Dp0G+U77bTBi4eAhBRLbDSjcd6glcsaLr9G0ohROwCRG1diGuR7pp1U7UoQeaA2BE0zf
 x3zEuKMokoALIZ7dgB4wqajTb7GTVjLo+ocBnn6BeYOUqgNYlYxgSTv31GuDJ0kVQ6Lh
 go5XkMfJBomHLOvtZzTo1gDKE/iBCo9C78UGgbHxepzHYRDuEVr+W6DCwqgGaG12weBS
 uDDfYHxABSD2akfNtdqx15BmZcqQ2ezXQHhiYfIVTd+wZL66l3gQY191krzaNGOJsoyP
 3aPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xdaYIHbo42EzW4+tTrCCIBJZrl43XKwjfdhXKE79QkI=;
 b=dUx76KaPRXr2l4NUSb/Qm+TjQ9BH4AizJy+Pq/lmJLh8rMB/qZERnYJ6ThisOTRuuI
 kwpuGB8kE/RoOhLi8dLYmO6GG8i+F6B3DOCbbZD8XvwrvJVibPD9G7pbj61TCjue3jQ6
 C+E5qf88b1jfUbNnxuspPH95IL/04PZ4JKjYy44TBNAuj3pHSZDroGwdLywMglcgrAjc
 tT8Zg68iZrigHDVs+/EqrdXkx/0tBu56VYmMo95vtbQKXBXsVvjJyQ7wpOSl+URVq0j6
 tcNrS3b18F6K1loYRez6Rceh/RY5dWl0Pw4FIOLbjGQ89IMaw9iHo9NVw9d5cechmEMj
 II5w==
X-Gm-Message-State: AOAM533gsW+KOwpSTuPFBeSHZM2P1dJ92JAvXQem1xfjrQLSEibBx9Hg
 scV+DbGp1hD/64q3KiI74yI=
X-Google-Smtp-Source: ABdhPJx4gWaZVfPNcXcXFDwquU8hwFVxF7LWE6D2TVf8jy2qAw7j6kTV29gabrWD9ercYIzdRabKrg==
X-Received: by 2002:a17:90a:6286:: with SMTP id
 d6mr15012274pjj.234.1615029478197; 
 Sat, 06 Mar 2021 03:17:58 -0800 (PST)
Received: from localhost.localdomain ([178.236.46.205])
 by smtp.gmail.com with ESMTPSA id u15sm4925194pfk.128.2021.03.06.03.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 03:17:57 -0800 (PST)
From: menglong8.dong@gmail.com
X-Google-Original-From: zhang.yunkai@zte.com.cn
To: bskeggs@redhat.com
Subject: [PATCH] drm/nouveau: remove duplicate include in nouveau_dmem and base
Date: Sat,  6 Mar 2021 03:17:51 -0800
Message-Id: <20210306111751.216932-1-zhang.yunkai@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 zhang.yunkai@zte.com.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zhang Yunkai <zhang.yunkai@zte.com.cn>

'if000c.h' included in 'nouveau_dmem.c' is duplicated.
'priv.h' included in 'base.c' is duplicated.

Signed-off-by: Zhang Yunkai <zhang.yunkai@zte.com.cn>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c           | 1 -
 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c | 2 --
 2 files changed, 3 deletions(-)

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
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c
index c39e797dc7c9..09524168431c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c
@@ -20,8 +20,6 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 #include "priv.h"
-
-#include "priv.h"
 #include <core/firmware.h>
 
 static void *
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
