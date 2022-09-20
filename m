Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8525BDDA2
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 08:50:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754EB10E2E0;
	Tue, 20 Sep 2022 06:50:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD32310E2DF
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 06:50:08 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id w10so567832pll.11
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 23:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=z/Tchuzx5XrbBDdO9w4M3sFc5h9bSSk8PEfVnx2P8/U=;
 b=WQjOnEYC+y93ri5C3gfgi4eAcw2Ee2jsooGZ+bMtbH4Jeg3J9rL2kNmUVvrKWziPjz
 QE8zfRsA1PEMCS0N/DjeTqM/8RQJeF2mX5C2MrCIOo9+zrbl1nN2i/tAvCXDiw0pvd+z
 Q5nZ4Ksj/ue6goG2WlZY5PjYr5xiJ/+YX4UMr22iz+qkYutsos38zQnu/claxXNQW5JJ
 pMnJky3zOBIuvwwPid80hu9ONDWsLccjytf7OZBrytCAvv3XUkz3X9vdWiqIcmkb0dIB
 Ln6v/bsni/nHM1ruhRzpU/P1KdCAzsRVph/P/oqMI1Y3b6uFbxroCCykgK1lg1sv7bPN
 CF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=z/Tchuzx5XrbBDdO9w4M3sFc5h9bSSk8PEfVnx2P8/U=;
 b=C48oFT06sZjKT+wbFhOc10/gftk8oB6dmXGEzbuOrdsB05B52xRE2Fg2l2YNl8QKnD
 g4ugsd+TFbAIUUBokDnTgxn9K81MPIhKHKOavQavlQyXbiIpo8dmJjVfjiJ62fUu677n
 92lEy17nu9HubBs2kNK2ZOfB64l7LRZNnHPRpburl22Ufzz+BLhn0BrVwgU46VsJlFQl
 MaUNkjSJOxOQdB808zLIyg+vBABpgfvoLet7VrNtXP8/p0fG26LABWLu0QBTxh3APwVy
 moDzh37vpZJQipzW9J4clVfDhYkR2q+yASAYGtD27o3AtEMkU0FtY94cAdlNbpALqt4+
 oR+g==
X-Gm-Message-State: ACrzQf2B+aOCfkaEJbTgpEOzRGlLHP6uwQYM9mZzPTomeKlkWpyWM4/L
 DPlT8Gg3W2EfQn0KZLZhgDk=
X-Google-Smtp-Source: AMsMyM5wtBWnT3s8RXcMiyF1rJz966LX0wfq0IzfHPhH5x9N9TRfa245fDBVHXRMkzoZilb48kNycA==
X-Received: by 2002:a17:90b:4c50:b0:202:c7b1:b1f9 with SMTP id
 np16-20020a17090b4c5000b00202c7b1b1f9mr2305401pjb.77.1663656608279; 
 Mon, 19 Sep 2022 23:50:08 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 w71-20020a627b4a000000b00537d7cc774bsm659252pfc.139.2022.09.19.23.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 23:50:07 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: zackr@vmware.com
Subject: [PATCH linux-next] drm/vmwgfx: Remove the unneeded result variable
Date: Tue, 20 Sep 2022 06:50:04 +0000
Message-Id: <20220920065004.215601-1-ye.xingchen@zte.com.cn>
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
Cc: airlied@linux.ie, ye xingchen <ye.xingchen@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-graphics-maintainer@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ye xingchen <ye.xingchen@zte.com.cn>

Return the value ttm_pool_alloc() directly instead of storing it in
another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 4e3938e62c08..f17e0da7475d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -470,15 +470,11 @@ static void vmw_ttm_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
 static int vmw_ttm_populate(struct ttm_device *bdev,
 			    struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
 {
-	int ret;
-
 	/* TODO: maybe completely drop this ? */
 	if (ttm_tt_is_populated(ttm))
 		return 0;
 
-	ret = ttm_pool_alloc(&bdev->pool, ttm, ctx);
-
-	return ret;
+	return ttm_pool_alloc(&bdev->pool, ttm, ctx);
 }
 
 static void vmw_ttm_unpopulate(struct ttm_device *bdev,
-- 
2.25.1
