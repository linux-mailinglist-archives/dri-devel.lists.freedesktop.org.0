Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E2D537453
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 08:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB3610EDD1;
	Mon, 30 May 2022 06:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2CA10EAFD
 for <dri-devel@lists.freedesktop.org>; Sun, 29 May 2022 18:06:11 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id y24so5239962wmq.5
 for <dri-devel@lists.freedesktop.org>; Sun, 29 May 2022 11:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zFYgZvhp83sK1rEVnBROokNWvqjVb+nooTl5Q8Jq3Es=;
 b=T5mYLtntqSTW2NHmPHPmiYoyl7v+OltmupLQVnZPH+8nZPDDMuJuc15/7ZwHAG6uUJ
 m80hOEgpxg5HGZtW8Ssp4nAbnmqAcc3hRPldV7yrzl6erkd1tXE+JDprtf1Ab2Ez4RwW
 bMCmpxDZbHCOctbGM1t21/ETJ/FdR0AhreUUDHwfD7B0xtFZwCivyb49e9GQ5Ury3ZK1
 nFdsRz5HxeQzmiwFgQxf/S9w9hBSiV16ooqvfSAmKwXPvtRmxm3gRqmiQIOxIzcZAtPR
 0w3oX5qXZ0rctquVZd6uA/jCUvx3qx9iT50ymswT30n/Vhnh4G4/50XA2cPSD7hGtzXA
 qDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zFYgZvhp83sK1rEVnBROokNWvqjVb+nooTl5Q8Jq3Es=;
 b=3C7ecKRuFRlpZiMVkUWIEQhYy4vwPoRKtNEIfeFS8cxEme8RUuckl9lSmlc2RqCS59
 ybRtQF8/BpLi4oJBnVmn89uXG7hZJgNgBWEyd0emPXpxZR0WyvftlYLKMIzUsWwkTyb2
 yAFBC+/W8j/AwofvNcCXSGj2PWOFL5nJcAUUzu/BQREU1Kcgyo1+4XuCtOf3axn55dco
 0oC0k6OLg8wNJU/ByedQaeNv2/0/DS+a4CQ3K5bpq0Ah0xHO66pm7di0HxaGotNpQ3Q2
 RkE09nBQQUSQ6cMCnzurzoxR+7QVH5dFwIRGuANA4eY2K5dVxmo3UBJ9+2XFMU0zZ0QV
 H7Tg==
X-Gm-Message-State: AOAM530p6mijzqqn5hrFck8kT3kuTm/jI32CJzVZKq427Lh8RI3PRM5Z
 3ldxa8apiiMy7zFFgyGgHas=
X-Google-Smtp-Source: ABdhPJwmp/e6h8kx/mtlBT26zC+klEpl5jx34odhQs9TbgNx0fvqZmVdpbQ1slEz6nXHZnKA1JHbRg==
X-Received: by 2002:a7b:c242:0:b0:397:43cd:8095 with SMTP id
 b2-20020a7bc242000000b0039743cd8095mr16272651wmj.174.1653847570199; 
 Sun, 29 May 2022 11:06:10 -0700 (PDT)
Received: from localhost.localdomain ([188.163.112.60])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a056000136700b002100f2e6a7dsm7008516wrz.93.2022.05.29.11.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 May 2022 11:06:09 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Svyatoslav Ruhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Anton Bambura <jenneron@protonmail.com>
Subject: [PATCH v5 1/3] dt-bindings: sharp,
 lq101r1sx01: Add compatible for LQ101R1SX03
Date: Sun, 29 May 2022 21:05:46 +0300
Message-Id: <20220529180548.9942-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220529180548.9942-1-clamor95@gmail.com>
References: <20220529180548.9942-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 30 May 2022 06:15:25 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Anton Bambura <jenneron@protonmail.com>

LQ101R1SX03 is compatible with LQ101R1SX01 from software perspective,
document it. The LQ101R1SX03 is a newer revision of LQ101R1SX01, it has
minor differences in hardware pins in comparison to the older version.
The newer version of the panel can be found on Android tablets, like
ASUS TF701T.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Anton Bambura <jenneron@protonmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/display/panel/sharp,lq101r1sx01.yaml          | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml b/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml
index a679d3647dbd..9ec0e8aae4c6 100644
--- a/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml
@@ -30,7 +30,12 @@ allOf:
 
 properties:
   compatible:
-    const: sharp,lq101r1sx01
+    oneOf:
+      - items:
+          - const: sharp,lq101r1sx03
+          - const: sharp,lq101r1sx01
+      - items:
+          - const: sharp,lq101r1sx01
 
   reg: true
   power-supply: true
-- 
2.25.1

