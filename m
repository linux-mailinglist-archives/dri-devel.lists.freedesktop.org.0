Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6A1507DD6
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 02:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9EF010E2C8;
	Wed, 20 Apr 2022 00:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39CD310E2C8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 00:56:35 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-e5bdd14b59so391849fac.11
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 17:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MjbwUecN50NCi1WrcvFSCwpe8TTcmnyRDU439G3bofI=;
 b=MYKm1/GC+Khyw5NyVC0F06vuMI83m3yXsTtzvJIBN+Jz47l8W0sB9q6AHPutM7rlgF
 q/c2LNHmyf5HSlXvauf3uvuTugZO7OZu3plPIftMHqfb6Tb7/uL5oGJGn3i73sPngkps
 EqFOXq6n4H+qldOy9bsjCPSXDHHNf+0un/CViE1rD6c9lt5lltnrYkmwifyOZ+frFQ9n
 3g8XMSf/VNBO4uKKwvg4pNyeq/dQEZBDhGzUeoZxjPhPERKbRMAFWjhw01WMkayVZ3Ag
 aCzYsjm/xpXlx851XN2HncBJ1KNBMcDD0KiSz+siTi3W7p9+g5BUyNue55e5GHEk3bOz
 Tz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MjbwUecN50NCi1WrcvFSCwpe8TTcmnyRDU439G3bofI=;
 b=kOU7DiIfi6z3Wj9BKCaTZ7mx2fiMSIxFhTIZqTFln2+N1uzEJrTJommJEnlaghqmcl
 E/mw0pKDmg132HJCriM7Wdr4KaBUjBXZoilMc9YrXi+wqqKEmtxxSyuSo53K9pHL1Xu4
 1fZ6wMyU+kbmOQkhEjhz1Ne11Tx0BH09vPD4bBj7ZsKyXkiMQMMefe56o8EZekmNgJ+R
 V/l8nbPr1wqjKQSVgI3eJFh46+XU7sHebCVXHx6yQbksik5RIO5T9TcwhbCIfqLBTexw
 bDIKIakSR3O4lZjsvGxhMdhqd8mU3N4UF8v1wlO9acdHfn8S6MxSRoDXltyTGNsipIWG
 l8Ng==
X-Gm-Message-State: AOAM530yu7lZj/CLRlGGRr0DQP/mI76Lj97BSDSEXgK8HJZMfRw6bu3C
 gPFikaX0UEYBYBRS7EzqTmw=
X-Google-Smtp-Source: ABdhPJzSJeJ+hyQaaMr4BYYGzVK9DQOvAtG4QWWew+HFYR/bPcR4O9gQimv06Q8TCz9cWZFtaLfLpg==
X-Received: by 2002:a05:6870:f697:b0:da:b3f:3268 with SMTP id
 el23-20020a056870f69700b000da0b3f3268mr562150oab.280.1650416194479; 
 Tue, 19 Apr 2022 17:56:34 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:4b69:cae2:6d6c:7abc:9c1e])
 by smtp.gmail.com with ESMTPSA id
 i28-20020a9d4a9c000000b005ce06a77de2sm6227328otf.48.2022.04.19.17.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 17:56:33 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: sam@ravnborg.org
Subject: [PATCH 1/2] dt-bindings: display: simple: Add Startek
 KD070WVFPA043-C069A panel
Date: Tue, 19 Apr 2022 21:56:24 -0300
Message-Id: <20220420005625.990999-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Fabio Estevam <festevam@denx.de>, devicetree@vger.kernel.org,
 robh+dt@kernel.org, hs@denx.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

Add Startek KD070WVFPA043-C069A 7" TFT LCD panel compatible string.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 1eb9dd4f8f58..e190eef66872 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -294,6 +294,8 @@ properties:
       - starry,kr070pe2t
         # Starry 12.2" (1920x1200 pixels) TFT LCD panel
       - starry,kr122ea0sra
+        # Startek KD070WVFPA043-C069A 7" TFT LCD panel
+      - startek,kd070wvfpa
         # Team Source Display Technology TST043015CMHX 4.3" WQVGA TFT LCD panel
       - team-source-display,tst043015cmhx
         # Tianma Micro-electronics TM070JDHG30 7.0" WXGA TFT LCD panel
-- 
2.25.1

