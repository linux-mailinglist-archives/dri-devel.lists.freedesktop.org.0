Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD0D2A9F64
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 22:50:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0DD6EB27;
	Fri,  6 Nov 2020 21:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021BA6EB26
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 21:50:06 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 23so1771721wmg.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 13:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g3s/vNbQhCOhaWUYjnatK+JAnL9zFArhDEfxOk3yJ9s=;
 b=QWCbYIFHbnL6cvVci1njVHiIUyhUnpp3bWojQBoR2JpVYoexBntA0mWqhP0DaOE2fM
 M7A6HqqFQ7dsmueWwZcVWsA9lu9tHYweFv81kqWlo1c4FbFUtVgUaCvtZQkpWHDUnrWk
 hjnAtDgqlGXxpfXJuujeGzda1GJmOmIi9oIyAzvinNSYXX0/bqCAczSXaP964OnyZqnQ
 itH5RagP5FQTTjj4FyQddYro6+/8euDYjhwzlwQI2+M3D6xnTS1GANsk3X7PZrzs8kTK
 pNZ2tlRH7Kl64ZBNSGfJAK63+d4wrmV3FTejPZe/RLzgVbbvigIP1/ZdAD4BzTX3iJ97
 berA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g3s/vNbQhCOhaWUYjnatK+JAnL9zFArhDEfxOk3yJ9s=;
 b=RqaCfvFsMigUi+DlB0jlJ83Oytei/gnDl447IP8g5kEGaxwD4PVWqyFwhY3Pmd0q7w
 KhJbljG9EE4bSJBKwj+iZuR31w10mGhIvyHnD/9pw/36LzaS8hJ3BuiixpZeUs6XYjrP
 Fw0hBbheRcerad6OsMOdZm1Jr6TcA1H1TcYsVwNeRO8bdWG836hi4Yp8UdU9JHEwo40r
 4RX0KkkojmMiqAQS8Fu609UqCv5XBVWuvmdMlpMsLSGTVldCZ6xbrxYup6fgNrxiYB8M
 paxQKJ52NKYQKlwCMyZPAohfzlmReoJGYnKNKnxQbe9pIxLI1u7JP5EuxwSI+1yrEeuR
 BzYA==
X-Gm-Message-State: AOAM533R4nsi6SBh5c7ICFqim9CA5rVwNTte5EtIYhT3qYObhqW50aRy
 cRmnwXL2yZT+bwNOR8+7/KB/rw==
X-Google-Smtp-Source: ABdhPJyOw2SZ7qeRyvMdjsuBPr5WvcSlm0uiM/Hm5KSHTGSt1O1F+ndVZ5Pq7eFnPGNB15kWxdNmAA==
X-Received: by 2002:a1c:4d4:: with SMTP id 203mr1615684wme.153.1604699404699; 
 Fri, 06 Nov 2020 13:50:04 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id t199sm3981084wmt.46.2020.11.06.13.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:50:04 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 09/19] drm/omapdrm/omap_dmm_tiler: Demote abusive use of
 kernel-doc format
Date: Fri,  6 Nov 2020 21:49:39 +0000
Message-Id: <20201106214949.2042120-10-lee.jones@linaro.org>
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
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Rob Clark <rob@ti.com>, Andy Gross <andy.gross@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c:313: warning: Function parameter or member 'dmm' not described in 'dmm_txn_init'
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c:313: warning: Function parameter or member 'tcm' not described in 'dmm_txn_init'
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c:353: warning: Function parameter or member 'txn' not described in 'dmm_txn_append'
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c:353: warning: Function parameter or member 'area' not described in 'dmm_txn_append'
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c:353: warning: Function parameter or member 'pages' not described in 'dmm_txn_append'
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c:353: warning: Function parameter or member 'npages' not described in 'dmm_txn_append'
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c:353: warning: Function parameter or member 'roll' not described in 'dmm_txn_append'
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c:399: warning: Function parameter or member 'txn' not described in 'dmm_txn_commit'
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c:399: warning: Function parameter or member 'wait' not described in 'dmm_txn_commit'

Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <rob@ti.com>
Cc: Andy Gross <andy.gross@ti.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
index 42ec51bb7b1b0..cedaab456041a 100644
--- a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
+++ b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
@@ -306,7 +306,7 @@ static irqreturn_t omap_dmm_irq_handler(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
-/**
+/*
  * Get a handle for a DMM transaction
  */
 static struct dmm_txn *dmm_txn_init(struct dmm *dmm, struct tcm *tcm)
@@ -344,7 +344,7 @@ static struct dmm_txn *dmm_txn_init(struct dmm *dmm, struct tcm *tcm)
 	return txn;
 }
 
-/**
+/*
  * Add region to DMM transaction.  If pages or pages[i] is NULL, then the
  * corresponding slot is cleared (ie. dummy_pa is programmed)
  */
@@ -392,7 +392,7 @@ static void dmm_txn_append(struct dmm_txn *txn, struct pat_area *area,
 	return;
 }
 
-/**
+/*
  * Commit the DMM transaction.
  */
 static int dmm_txn_commit(struct dmm_txn *txn, bool wait)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
