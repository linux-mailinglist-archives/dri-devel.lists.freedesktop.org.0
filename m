Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F24310B81
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 14:05:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40DE6E29D;
	Fri,  5 Feb 2021 13:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97F06E29D;
 Fri,  5 Feb 2021 13:05:16 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id a7so6673501qkb.13;
 Fri, 05 Feb 2021 05:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MHJsMavE3nujSnxW3LwxOmZw7EFguJmQU/pNqi0G+xI=;
 b=aMDfbAIFLwP4uP1FRsZWcGK7FHIzEj8ip4FiQPK6ctpA3bml5yjPvhqvazWVsOzEBk
 wajhqlQvaHgCFdT1nl/xpxc1mzULoGWx06Ns4RRAQBERMwtazx1KZvhWmwMk3fxPVJFP
 kV1JMyvIV29OgJLsJ7dAiupMuu6aTScFJOondIYf/3H5mKmlAoLY++mJrVpBKJiS5s7W
 ijKR8tTRYbft0V9oGR8zHk3ZqT3Oj4awoQIXOFd3rfp1D+5P5522+bECxacfhbhDGTM7
 EWgpQmovHeJBnC0QPEfbg/bxOQEqXTLr5q+InvsU5BfejkczuSNrtWDraf6iM5R/+P81
 RIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MHJsMavE3nujSnxW3LwxOmZw7EFguJmQU/pNqi0G+xI=;
 b=PeishbIofhshrM3BngjiI7nOCJMExI3nLo1GzLcxfEFi15jrJc9g2ZGWo13RHG+QhJ
 7nKaaAW5FAuyPUGXfIb2NqFJuo+mifZDQMPfiZZNmNFj2raZCf8ofxfGCDQCc9/sQTKK
 U523myirhIvRmEW1HfePe31med9KO0Su0dkGNf5Z/4pCGCmSRcsVLtMLK6NQmr1BlRtf
 uwa3mxE9LkABZQ24Xo/83o21/n0vDC2YIrHyNiZ5lEqMZHtcNRtDsFrzXg5VcUF5xWL2
 6l1GqsZJrJMFlqUy/cSLKpN+mD/y9cB5hlZn+dMKeAIRA2If0RtwLQRz8fXh8wMKFFhl
 kbKg==
X-Gm-Message-State: AOAM533UoAB0sAz5KPbJyavxZgxSjTRJ+Ftbp9ATPcFRfiOIEkGEpL/N
 olnq3oGk49WayNXLZa53nFY=
X-Google-Smtp-Source: ABdhPJzESrKrwXVHsctE3NGaG/IC2lbP3Th5GQobMhswX/sILMe3FBMtg0ocebizL/CRAVGrkZXKVg==
X-Received: by 2002:a37:9d53:: with SMTP id g80mr4055340qke.307.1612530315873; 
 Fri, 05 Feb 2021 05:05:15 -0800 (PST)
Received: from localhost.localdomain ([138.199.10.106])
 by smtp.gmail.com with ESMTPSA id k8sm9092945qkk.79.2021.02.05.05.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 05:05:14 -0800 (PST)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: drm: nouveau: nvkm: Replace a word with a better
 phonetic word in the file macros.fuc
Date: Fri,  5 Feb 2021 18:35:02 +0530
Message-Id: <20210205130502.1440514-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.0
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



s/fuck/heck/


Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/fuc/macros.fuc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/fuc/macros.fuc b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/fuc/macros.fuc
index 3737bd27f74e..1407a1b16d95 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/fuc/macros.fuc
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/fuc/macros.fuc
@@ -46,7 +46,7 @@
 #define NV_PPWR_INTR_EN_SET_SUBINTR                                  0x00000800
 #define NV_PPWR_INTR_EN_SET_WATCHDOG                                 0x00000002
 #define NV_PPWR_INTR_EN_CLR                                              0x0014
-#define NV_PPWR_INTR_EN_CLR_MASK                    /* fuck i hate envyas */ -1
+#define NV_PPWR_INTR_EN_CLR_MASK                    /* heck, i hate envyas */ -1
 #define NV_PPWR_INTR_ROUTE                                               0x001c
 #define NV_PPWR_TIMER_LOW                                                0x002c
 #define NV_PPWR_WATCHDOG_TIME                                            0x0034
--
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
