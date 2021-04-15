Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DC23611F7
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 20:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E546EAAD;
	Thu, 15 Apr 2021 18:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6262A6EAAD
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 18:19:27 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id e14so38243480ejz.11
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 11:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=urMYKw+CObY8Bf46P0yEDPYdb/81R4owb7A3rC2Hphs=;
 b=BPPP7qlbJn0PdHs3aCepP/xzbyBa2FDzLTTkZc7CYGHtjfBhO68dg8hdNkiidOQBbo
 vNcAClzViSNO9GITBFw+CLQdz6pJBmNR7vTaisFptWOqZLBRqd4or11c/QHt9Nrs2Wz3
 SK/S6zPjz3pv9Ha1cNg4C6K49gtpNdBWk5GRbFoIOsh+ZSMPR1iFxdqo3da18pBACe1o
 3mtuM/wH+Pgln2ffbgbmZZXnIlr7GlDPuwD0dNFEv+Ct1dEiCkKlMukzSl0D7WYlazZd
 FUrTu3ACyiQHUKaG+6T5IhM7pseTbJsgHPLn28kPqXi7vILJ+IYG47fGXW/0/roSlIZN
 YwmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=urMYKw+CObY8Bf46P0yEDPYdb/81R4owb7A3rC2Hphs=;
 b=WBvZZ828FwUdiy0dwK5s0WIR3QMgKtLEiCzPsWbDUyuUgnvwFUqJiw/w+WFN5v2Juu
 +iVk8gN1kWemAUlcFjzHGoM+J0sUhad2OHrdg/8f/m9pjZmDts+JchSvUGTIIyHkOQLx
 RUuk/jPmN3IjwDGtHsIgF2nVjzMKjoj10JX8hs3Wb5S+qJ6+CJmqp86HkSc2xN0z/Vry
 EQ5EUOrKCJYBtXWwkkUt4RBal0Csx0oHMjSquamS7EstTzKX5VdD16WIbq2njtatSiAQ
 HWYh1euIsettfL5dHokCo2BM1VFZcnxA9T40UR5LZ3rxWD12Kj2Aic1aCUfzkmy0mB3Z
 R1gA==
X-Gm-Message-State: AOAM531z8ivwtLRrIz+NZKr3gPrTUicR6NTi5KkuKOaMYKqvODwTnIJe
 VcckygJh0Ru6sdRvD3qVVcFj/ALsJk70rly6
X-Google-Smtp-Source: ABdhPJxOqReymIQqbTnEXkRdxvoXlTnzSXPTAv3kSwbc8atwUOVcHSN7sexZD/t/DoPtspZakFP/oA==
X-Received: by 2002:a17:906:724b:: with SMTP id
 n11mr4841403ejk.338.1618510765818; 
 Thu, 15 Apr 2021 11:19:25 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it.
 [95.237.55.30])
 by smtp.gmail.com with ESMTPSA id gt26sm2517705ejb.31.2021.04.15.11.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 11:19:25 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: dri-devel@lists.freedesktop.org, outreachy-kernel@googlegroups.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH] drm: nouveau: nouveau_bo.c: Remove set but unused variables
Date: Thu, 15 Apr 2021 20:19:21 +0200
Message-Id: <20210415181921.15742-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Removed two variables set but unused.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 2d5d68fc15c2..d0eac5375533 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1247,7 +1247,6 @@ nouveau_ttm_tt_populate(struct ttm_device *bdev,
 {
 	struct ttm_tt *ttm_dma = (void *)ttm;
 	struct nouveau_drm *drm;
-	struct device *dev;
 	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
 
 	if (ttm_tt_is_populated(ttm))
@@ -1260,7 +1259,6 @@ nouveau_ttm_tt_populate(struct ttm_device *bdev,
 	}
 
 	drm = nouveau_bdev(bdev);
-	dev = drm->dev->dev;
 
 	return ttm_pool_alloc(&drm->ttm.bdev.pool, ttm, ctx);
 }
@@ -1270,14 +1268,12 @@ nouveau_ttm_tt_unpopulate(struct ttm_device *bdev,
 			  struct ttm_tt *ttm)
 {
 	struct nouveau_drm *drm;
-	struct device *dev;
 	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
 
 	if (slave)
 		return;
 
 	drm = nouveau_bdev(bdev);
-	dev = drm->dev->dev;
 
 	return ttm_pool_free(&drm->ttm.bdev.pool, ttm);
 }
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
