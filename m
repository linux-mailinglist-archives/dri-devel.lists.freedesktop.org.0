Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFAB4CAC8C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 18:53:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD66C10EF55;
	Wed,  2 Mar 2022 17:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06DB910EF55
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 17:53:12 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id i66so1628387wma.5
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Mar 2022 09:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=taNgSNhxg9N3wuTnv3IGzP0mdXY6UY0XfdCeGrzzq/Y=;
 b=MgdlIRTOp3YlTZro6MDHiqoujLSrj5MfJzYocJ8habuXr4dd7A+9HWsTXgmUqkUDKj
 B+KlGC7CX4dNJEmCGUW6RsuGT8E4BnyUpel1kJSl++W7adCyJVb5p+aeR7AX4C1ZmRM4
 3fcnbrJCwK8e+W/JbX03L1TJgDn2p58e7QNwYw1sXgL3BcOmLKAIIMGbInu/i8G7LuT5
 OS3+Py294/wKRO+5C/kjCtdQuVI8q1hsAakQVOIMWsefbncBSBvFyAmp5i0Mx/z/tqsE
 7N2Jaxf7/thUWkB6H3rf8Nj+7v1ARGUa4V8YCGkRYFPZZnI/TnrCKqsZL2Bu01dJ6UIL
 QF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=taNgSNhxg9N3wuTnv3IGzP0mdXY6UY0XfdCeGrzzq/Y=;
 b=Vx11X+a7uPgONoIqPY4LOtg6Tl8JgsoSzpU9tXQhao/G1eobGo9uldoPk0qtKqG/DQ
 2WTx7XSBhjN9tVYCVLFNkOZG2YD7aVvq912PVzVzCrb71SsUnQ3ZAGZysXxmuHLbYWVY
 jq7RcVo6jrwmRkiCRFFpqFrPtr9SmY/nvv9ITC+oC899yIjis0ufUmrOVyGEFLsMvckP
 oCNqRb4oY2FHPHsajmgq392uPEkOtxaoogywFeJ6IpT0k5oKYqqwSSk1Sj67Oh9Gtdjx
 vRmxaer793Xvm6hszZIJMI47w3zInCEOwuktmn6Tt1RKhfxy4d3w6qlhvz6Uu5bIxXx7
 YygQ==
X-Gm-Message-State: AOAM532gdVFFYh5OHvDGO/810DsSM4r4edeHkjhCo/l/eB5itI1+rFwd
 dvODhXB9twvmSYD/FqVUDiFNlRLEKDa7SQ==
X-Google-Smtp-Source: ABdhPJwJ1bg/pYRWnDLXycY6T/eklZz3ePlRz0PnU/mgJ05UV7us4cJ8RzjeoXgqSrrMoxBQk4H6rg==
X-Received: by 2002:a05:600c:2e54:b0:380:d3c8:ef33 with SMTP id
 q20-20020a05600c2e5400b00380d3c8ef33mr737901wmf.69.1646243590547; 
 Wed, 02 Mar 2022 09:53:10 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 v15-20020a5d590f000000b001f04b96f9a9sm19510wrd.42.2022.03.02.09.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 09:53:09 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm: ssd130x: remove redundant initialization of
 pointer mode
Date: Wed,  2 Mar 2022 17:53:09 +0000
Message-Id: <20220302175309.1098827-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: llvm@lists.linux.dev, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pointer mode is being assigned a value that is never read, it is
being re-assigned later with a new value. The initialization is
redundant and can be removed.

Cleans up clang scan build warning:
drivers/gpu/drm/solomon/ssd130x.c:582:27: warning: Value stored
to 'mode' during its initialization is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/solomon/ssd130x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 92c1902f53e4..ce4dc20412e0 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -579,7 +579,7 @@ static const struct drm_simple_display_pipe_funcs ssd130x_pipe_funcs = {
 static int ssd130x_connector_get_modes(struct drm_connector *connector)
 {
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(connector->dev);
-	struct drm_display_mode *mode = &ssd130x->mode;
+	struct drm_display_mode *mode;
 	struct device *dev = ssd130x->dev;
 
 	mode = drm_mode_duplicate(connector->dev, &ssd130x->mode);
-- 
2.34.1

