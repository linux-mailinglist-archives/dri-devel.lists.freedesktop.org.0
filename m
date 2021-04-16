Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F94362298
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:38:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE4E6EC19;
	Fri, 16 Apr 2021 14:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76BE76EC03
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:37:54 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id d21so12452711edv.9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+nA+2lokIo5+ShZDBy9HyhfN8ugkVVJ0D8A+fjT6S/o=;
 b=JT+qwWdcusOALmrf7ZLdMUE2NBydZv8PujbzUpgvw3/DUohzJA+x2wlYAeJAoFG5rM
 rMkYK7DHWY1dlwMI6ot5f+Auf1YMrEF6RlZPeTFoWdNaIfQhXlq5UkxQq/Fv/Ljf2ybi
 s/XEi1+IVlW3YJwBO6sgSD6pCGOqE9H35Xk4fXmQyLF4bsVolmGBL4CKd3oW2G+BJJaS
 mK0C+22qN43AXEx4JBIcs8Mnk/pvpU9PA4//UQvXIECQv4BPNHcLv8B8GAHuy6+hIMlH
 l2/NrhYhJqiDC7a/N2dSCognVIg0Cf1IxtaTkXtEQl+OlYLudwNpMxofszyIjhqfbq6D
 UwnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+nA+2lokIo5+ShZDBy9HyhfN8ugkVVJ0D8A+fjT6S/o=;
 b=d1NPlstf6JoxL2CxEJ+v1SdTpH9rqN//JCutFHOJR4gDoHUu1x75FiY3eQgS0RbE8o
 YmGfUkRDCu6D65UfeGn+RRSWZrZstazdMBxilH61ZGSg0dfDvKRNAhCkqJJ6EPqW1CkN
 yMzjulssAhBIlqpof8+rinrI4mjcCNQNfba70XyGxrtaMH+jtJaxG4cTMwVPg8DMKbQw
 ZjqlZ1BUt15YXpjiRRROc5qgb+CvM4ZrTUgidj/q6LzPpiz7hpDxxADXVuCKlWswC5eS
 pXZHtTqQrCh+Aqz5MrpUzlBxLERkUglH+66Stkv/DKodWWLODlmN1id2gjH5F2O74jHt
 27Jg==
X-Gm-Message-State: AOAM531f2rKdJxn38thfQdLYYHTYR8/mp7w3FD4zMy3jPRLCrem4MLSg
 wJxNwlcNJHUX/iAT8ySimfWqGw==
X-Google-Smtp-Source: ABdhPJyC14vYUXyqy/t+TqjEGM4ZhoCO42QZ4CqVlCScrkxs6PVqHnQ1Pzc5N+W97cANt3cO8Uu1Gw==
X-Received: by 2002:aa7:d046:: with SMTP id n6mr9118370edo.357.1618583873184; 
 Fri, 16 Apr 2021 07:37:53 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:37:52 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 22/40] drm/ttm/ttm_tt: Demote non-conformant kernel-doc header
Date: Fri, 16 Apr 2021 15:37:07 +0100
Message-Id: <20210416143725.2769053-23-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
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

 drivers/gpu/drm/ttm/ttm_tt.c:398: warning: Function parameter or member 'num_pages' not described in 'ttm_tt_mgr_init'
 drivers/gpu/drm/ttm/ttm_tt.c:398: warning: Function parameter or member 'num_dma32_pages' not described in 'ttm_tt_mgr_init'

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/ttm/ttm_tt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 7dcd3fb694956..d939c3bde2fcf 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -389,7 +389,7 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
 	ttm->page_flags &= ~TTM_PAGE_FLAG_PRIV_POPULATED;
 }
 
-/**
+/*
  * ttm_tt_mgr_init - register with the MM shrinker
  *
  * Register with the MM shrinker for swapping out BOs.
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
