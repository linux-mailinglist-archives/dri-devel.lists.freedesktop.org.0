Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E074E2F45D1
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F6A6E06D;
	Wed, 13 Jan 2021 08:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59A96E07D
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 08:08:25 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id 190so697403wmz.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 00:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jAO678R3RtkgY9IPzmyb5UFyGCUGLlAwXrenaR2xREY=;
 b=n4HHJXja9efTgsY6gSGtpsDgEfkqFcI3Zk2w8ic/TG6PTg+1W5grCJIbuifEleQBPZ
 +27CrufSyUIL17ZLNP/BTz7Z2J4H2ueddAgeLSJtVPh6AMWSPZ9wFaZSizslJYKksV6v
 d3uWqiyUM7xUzIhGoRencnMz142jUwpfu0hfcSL3UywLJ+vBZ0NYSSP2nHBQqJbcJS8o
 deHY7DmgUSQvCFk/Lt05jaAxGT843B4s6fy56BFPCmDYGy1FYj/cvJQ2/CHecvPP2e1Z
 Szjpy6et/cTX4d0k69ZzZZStXiNPmrmvTi/3+5BxjaEgk/iJTz9OpeMSPJnzluieZpQN
 gu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jAO678R3RtkgY9IPzmyb5UFyGCUGLlAwXrenaR2xREY=;
 b=EvrHQI2GJ/Hz7U9armIFQWuI2HFKdvISYG9MYTQR5aelB9B4wWXV7ApdnyBSGsYE/P
 y3eTbHQzp87xzHNy9bIDGL6KIELJTxuJcN9Q1LjfTJJ6x7fnMN/Lt6ujUgQJtbrSof31
 vTzNv3f+TJPs4QZ6tvuuf4TiWZxp+Ft2BIb3Dz7LC5C6CPK2+f5NYBTwbHO7HNt89rJ/
 yVqQQppaqDVcsDKcGm1dBpTyNREGnHKsVOI7EP4dLUP7f0rBFq7siYLWh3zWM/GQPYVT
 31k83Te4Fv9+RDG+vbWcf2gzsRHrlGb43yFFNRBaOVHhpTwH6wDILpBq62+3+cIv6t/E
 3H+w==
X-Gm-Message-State: AOAM532V1T6dc0cHQnnY7hdq2aCen/Xg+ZRJF2VfDeCyrjzyPb6vDhEU
 uD17YKBPWN1Du8+P8Cz+K0/+zQ==
X-Google-Smtp-Source: ABdhPJxHNyoXPfTlp5uRri1k1i0J2v1Wg0OxRoE+fajiSX23gEvASeYjGvrRnoPRxewhB2B/Gkmfkg==
X-Received: by 2002:a1c:7716:: with SMTP id t22mr950377wmi.126.1610525304555; 
 Wed, 13 Jan 2021 00:08:24 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id r20sm1642486wmh.15.2021.01.13.00.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 00:08:23 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 23/30] drm/nouveau/nvkm/engine/gr/gf100: Demote non-conformant
 kernel-doc header
Date: Wed, 13 Jan 2021 08:07:45 +0000
Message-Id: <20210113080752.1003793-24-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113080752.1003793-1-lee.jones@linaro.org>
References: <20210113080752.1003793-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:992: warning: Function parameter or member 'gr' not described in 'gf100_gr_wait_idle'

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
index 749f73fc45a84..33541b4c01114 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
@@ -982,7 +982,7 @@ gf100_gr_zbc_init(struct gf100_gr *gr)
 	}
 }
 
-/**
+/*
  * Wait until GR goes idle. GR is considered idle if it is disabled by the
  * MC (0x200) register, or GR is not busy and a context switch is not in
  * progress.
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
