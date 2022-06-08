Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CA55420B6
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 04:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDE51125C8;
	Wed,  8 Jun 2022 02:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF381125C8
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 02:03:51 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id q11so10995191oih.10
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 19:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EfN+xmO5HEHNw9kDgXvrcd+sdptDLYv5NOEy2D1EBJA=;
 b=bMHzfw/mm/MBc6+X8i7fRm6xf6xKEbKM8KsbDKtZz1Z0IcY5jHkQzD85mF5EcE9vek
 B4B1y6p9YKR8QdC0dc/kGraqPQ1isYwZlXB+nEiAXFQFejqHedgLcAOP+tfx2zqoAb6Y
 JA9IsEVXbI1XV0kC3Ni3t03Ru7MtiWwB4UT0HHNA4KHJma3xuUsk4VpPvNH4+Dyt/JML
 ScTRd5IqXDLqUYv2owJQIu477dL29zLcshUKteXYtji60raXfn7A/M76gL8IS9MJqOMV
 aqhFwuQVzHfP8vGlqrtIZjrKlDqklPhASm4NHQ9H2O4g/UHjXRj/EsJytbdthCOCu9m1
 mfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EfN+xmO5HEHNw9kDgXvrcd+sdptDLYv5NOEy2D1EBJA=;
 b=YNuMnrqoAqA4xXUlA/pTPvqNH4Xh2/YWutxdFnFb+4loQJNg1aX4yCfh3MhyAz/CUi
 QZ3ZkM6pU7PSDVlZMbkm0WZQbnnHUT9r1XqwATIodIdtrusM1Bdz8y6iHCp9z/DdrH1V
 kfAwbTvRKajYBru6rLc6UcAwNfv8ZZuc2HECfVMPDLU4dI47P/B2Uz2ecEHzpf5nn8Mq
 xO9VkIOqCq7mLvlLgfFFlgUTaYvsHafcuV71b6X4UOq9p3NGHOJS8mKhCAHFMSFi+GeM
 F3uF3DxivBt8XlpIXELh+A06BQZA1Fy0O10Lh5J87OP5jZwc4gll67cxKtMfxsEwG8FZ
 adlQ==
X-Gm-Message-State: AOAM530QG3m6kMQbsQHkVEzyeK/k8L37A1KrMNC2c711X2jZaaeIA+IV
 Iu1mkrQbWGBS+k7JPP6Bn4Wfkg==
X-Google-Smtp-Source: ABdhPJzCTYzm7dq0pCbAK9GXHdfaJV7jG4EWrDyaZxHeEac8jL4V7FEOkKJmUZoVM3HtS7Mv8nabwA==
X-Received: by 2002:aca:7c6:0:b0:32e:5138:9044 with SMTP id
 189-20020aca07c6000000b0032e51389044mr1132955oih.198.1654653830520; 
 Tue, 07 Jun 2022 19:03:50 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 bk18-20020a0568081a1200b0032e642674dfsm6987620oib.9.2022.06.07.19.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 19:03:49 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/panel-edp: Add LQ140M1JW48 edp panel entry
Date: Tue,  7 Jun 2022 19:06:14 -0700
Message-Id: <20220608020614.4098292-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add panel identification entry for the Sharp LQ140M1JW48 eDP panel.

Due to lacking documentation, a delay similar to those for the
LQ140M1JW46 numbers are picked for now.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index c96014464355..fe3897b86665 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1860,6 +1860,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('K', 'D', 'B', 0x0624, &kingdisplay_kd116n21_30nv_a010.delay, "116N21-30NV-A010"),
 	EDP_PANEL_ENTRY('K', 'D', 'B', 0x1120, &delay_200_500_e80_d50, "116N29-30NK-C007"),
 
+	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1511, &delay_200_500_e50, "LQ140M1JW48"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &sharp_lq140m1jw46.delay, "LQ140M1JW46"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x154c, &delay_200_500_p2e100, "LQ116M1JW10"),
 
-- 
2.35.1

