Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1170040CE6B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 22:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0226EA44;
	Wed, 15 Sep 2021 20:50:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C0756EA2A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 20:50:20 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id v19so3008672pjh.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 13:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vHyFw4K4xH+5us2Up00zl+Rf3MtaMU46C/OYxsmg0CY=;
 b=Clau8pm1wih3yivH38mz0upiqazC4X3tGTcCwqbOTs8CU2pNtCCTfLqDBxrvhFzewc
 AZSNn5QMkgp2X9BtZrFJ2NfwR7jsTO637Xjeky0mxpf2YHsaNtEBIXIIFG+PIfyweUuu
 hFZn28cfcG3wHVO51PpxRxutN6cIpQcRUHN0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vHyFw4K4xH+5us2Up00zl+Rf3MtaMU46C/OYxsmg0CY=;
 b=oz7oFy3Aw3KKWlj0t0BYwcGkYcI33dh8SytYOi9ZA6vVHH0fD2H3oTDu9dk/gD9jbf
 I/Pqj/jxpzqY5AALRbQ/uQfRhwEkw7B+mtVOUZcMfhtCFMVfd4FMlBJy2lElaMKXx0e4
 8uJgUExaHW08xcEmxUZBzfa7fgJIFS5rRqzeaD4jVasqflseQQtfUUEEv6a0KB9PERc/
 uKmAKmk5IPq8LsB///SGRJg7DjEQRXCZUplgun+1pyHKxjtHE3qulxDl7SpL024Ae1o/
 876+XRdopZEy5/BnkNZ2Ll8iCQe7p5mRdd3JeGg+ggGi5Slwi/AHtfZhUF90/s/xoj7x
 oHDA==
X-Gm-Message-State: AOAM532IK1R7QlQBI/xb5OkXJdw/Mb/LbV7KbelWfNkz5sNb75APY3+m
 LAWbGTaZ6SukZir7hsqxm92KmnRglZ3c3g==
X-Google-Smtp-Source: ABdhPJwAeO7hAdo2876N3izcL7wxeCm5doF/RHktfcIWeFNSL3dIZJawTmB2yPjJiza6duCJZFEL7Q==
X-Received: by 2002:a17:902:654c:b0:13a:505d:6a04 with SMTP id
 d12-20020a170902654c00b0013a505d6a04mr1472647pln.82.1631739019604; 
 Wed, 15 Sep 2021 13:50:19 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:82f5:4db5:2fca:398a])
 by smtp.gmail.com with UTF8SMTPSA id a71sm746893pfd.86.2021.09.15.13.50.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 13:50:19 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>
Cc: dri-devel@lists.freedesktop.org, Brian Norris <briannorris@chromium.org>,
 Sean Paul <seanpaul@chromium.org>
Subject: [PATCH] drm/rockchip: remove unused psr_list{,_lock}
Date: Wed, 15 Sep 2021 13:50:11 -0700
Message-Id: <20210915135007.1.I926ef5cef287047c35a17e363c919599c6ee6e4c@changeid>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Some leftover cleanup from commit 6c836d965bad ("drm/rockchip: Use the
helpers for PSR").

Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 3 ---
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h | 2 --
 2 files changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index bfba9793d238..6fa686e6c7e9 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -138,9 +138,6 @@ static int rockchip_drm_bind(struct device *dev)
 
 	drm_dev->dev_private = private;
 
-	INIT_LIST_HEAD(&private->psr_list);
-	mutex_init(&private->psr_list_lock);
-
 	ret = rockchip_drm_init_iommu(drm_dev);
 	if (ret)
 		goto err_free;
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
index e33c2dcd0d4b..aa0909e8edf9 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
@@ -48,8 +48,6 @@ struct rockchip_drm_private {
 	struct iommu_domain *domain;
 	struct mutex mm_lock;
 	struct drm_mm mm;
-	struct list_head psr_list;
-	struct mutex psr_list_lock;
 };
 
 int rockchip_drm_dma_attach_device(struct drm_device *drm_dev,
-- 
2.33.0.309.g3052b89438-goog

