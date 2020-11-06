Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7278A2A9F5A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 22:50:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 844BF6EB1E;
	Fri,  6 Nov 2020 21:49:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACBC6EB1E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 21:49:55 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w14so2773492wrs.9
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 13:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xPa36hbXRaCWHNKBNpsuuGTQcILERbE7+3Txd9Olckk=;
 b=cRpiXYsoYNFoqQKy6HN5L54gAQBJro5vQdbxqra3rZdwMubGOsuA58ftK516DBSs9w
 GfisJZOZifFFHK0+b3c+rwTW3EZj5pa3Qk8EP+YQond6DzGj6v3pxICy+0LYt3QJRgeC
 JdtOA2zJhY6yREC+w0s13kcQt8bi3GnpjMTUNybsESi/R49bwNwLvfhUzvfndgSntarZ
 gg0wIhsUmnT7BYGuuPSZ6i2qVs4D87b0qXpN0Na843lQ7CVoopJbVgDTUVm3fBKqQRQF
 MlqkPf6NkgtOkYCLb6/MBEgySUT7djXYFMV70RzxJHU6oaquZE9VB4sGHH9u5d8F0TGF
 PU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xPa36hbXRaCWHNKBNpsuuGTQcILERbE7+3Txd9Olckk=;
 b=iV4eTgjpOv5zEoDXDKfn2GLDwuaMPSQQYnBj8ti0MFQn/BlFS54d13sqW8Jz5RirO4
 4vQyqohAuxVuJqm9pXpdiWplXNadr6oqPOZaOjk/NQzhZSJ7hU1jx+fwSBe/AxmA2p1y
 cBTTCjngT2vCqk2Lkc9TdCM3vxgY7SxnVdjZDvEoRLBt8l/URD5zNQTElEgAGySc3oTF
 E4+aLXGHw7A7Vlz2xTUslnnbMpAfKFuR6lrOZ13nq7tKH+VzrQjOscXVrLrUEBGF1/3D
 ExLtElFwvI1P0KcRUdeNtSobh6avHTgYK2McHdH1LvQdK6vLJJnzYoZo9Py4z9jQdLbw
 4kwA==
X-Gm-Message-State: AOAM533QEhPj1PBFehc/rf/uoRtyRC9XSnXxCcQw+HKs/3zBQESRi5CR
 IfX8C4i8UEoZiumkhd8cexCESuV1XOSlU4sk
X-Google-Smtp-Source: ABdhPJydwKMlO1v5pDAqy0we2KrKHwWhu7VxuH459Jq4br/NRTf+Rribn3mDOIvbuPagpT3+N5fQpw==
X-Received: by 2002:adf:a54d:: with SMTP id j13mr893436wrb.132.1604699394143; 
 Fri, 06 Nov 2020 13:49:54 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id t199sm3981084wmt.46.2020.11.06.13.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:49:53 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 01/19] drm/ttm/ttm_range_manager: Demote non-conformant
 kernel-doc header
Date: Fri,  6 Nov 2020 21:49:31 +0000
Message-Id: <20201106214949.2042120-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106214949.2042120-1-lee.jones@linaro.org>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/ttm/ttm_range_manager.c:46: warning: cannot understand function prototype: 'struct ttm_range_manager '

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/ttm/ttm_range_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index ea77919569a2e..e0952444cea93 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -37,7 +37,7 @@
 #include <linux/spinlock.h>
 #include <linux/module.h>
 
-/**
+/*
  * Currently we use a spinlock for the lock, but a mutex *may* be
  * more appropriate to reduce scheduling latency if the range manager
  * ends up with very fragmented allocation patterns.
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
