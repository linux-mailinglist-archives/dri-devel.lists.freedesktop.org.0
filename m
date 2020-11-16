Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 413FC2B4DC8
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:42:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E134D6EA12;
	Mon, 16 Nov 2020 17:42:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2C66EA0F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:42:08 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k2so19705160wrx.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xPa36hbXRaCWHNKBNpsuuGTQcILERbE7+3Txd9Olckk=;
 b=pRWYp0XTrVtt3Xvh9YDV5tP6dikwZIDkT90eW9C2OdRoYyd2HswTEVenhb4ycBTOiv
 m0PyBnWv7J8AixspV9covb8JFHnTe8YM2jN84skal5ondJKls6A9lksIy6pD9EwgxGhu
 rZGOvxBj8p/+8YLdDB/E8ijfhC08TPNqfGpoofRbq3gc+zDXXnJaMWSM7DkwmQ8MPgv+
 TqFQ4HaN6/KAC4JiaFVOqnS2icRTYJIr0TJbh3U3s7h2r0dLE4IVIFrX0EVgBgEIAaRV
 AN5bru5QhzF8jQZ2zWe5YmVhQMZlVkG5l/V9ybXf+8ELVTcEHTtIcpONXI3T+dCsPR4K
 yNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xPa36hbXRaCWHNKBNpsuuGTQcILERbE7+3Txd9Olckk=;
 b=DWPLU3iFw/HJt7BKLg7kCtAHtI+Upm3Ir2eyo9qUerijkG+8sJKb9pCYhFieIvWwh5
 lqswGtOc9LCyuOUUYMXLjWrEcc21J7ENRFq1hygHEgxEwxXrgXIFfYMZQG3/R68sArJ2
 LcoVv9xEN6G5Y7ggdatqMGnvJXXQsZD+itzkZP6IHZJhMNZfA3DrJuiqGggbvE181jwi
 Joxd8AhGJCwUnlnDmDb8EHMhE1MFKZaF8PzlusBoT/+9sUdFF9Hypkzed7c80P4UNmQL
 BSrFizD602d/AKBkcTVQwbKE9O+QBRCML54/URtF2oIvACkjIdU1PKNsGcm00aTH/cXp
 8XxQ==
X-Gm-Message-State: AOAM531WAzYCRAaYD6CFiDCcDNcARwYK+5TRH7QsbF6FJDCKs+nXIkY4
 zFaWJFzzUz7HNKLvPcXkv9cKOg==
X-Google-Smtp-Source: ABdhPJwhedprnVRT8XYKz4ZODyRIwOSlsB9QfSG2MGDe7+rjWfM0Dx7z9ufFAbkbiueG2aby7uBBaA==
X-Received: by 2002:adf:8030:: with SMTP id 45mr20573626wrk.407.1605548526801; 
 Mon, 16 Nov 2020 09:42:06 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:42:06 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 33/42] drm/ttm/ttm_range_manager: Demote non-conformant
 kernel-doc header
Date: Mon, 16 Nov 2020 17:41:03 +0000
Message-Id: <20201116174112.1833368-34-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
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
