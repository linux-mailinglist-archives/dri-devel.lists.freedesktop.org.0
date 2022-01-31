Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4544A4DCD
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 19:12:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295F710E2BC;
	Mon, 31 Jan 2022 18:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8D810E261
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 18:12:32 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id bu18so28607660lfb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 10:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bd+246oU+gwCv1nTiFB/RtbYTLmhU4AaWG3IceBBM38=;
 b=Lamq6uWIgelv9qkCDQ8Fxjbyz+TGxImKWUwjek1dFwxef0QGmUFIfSodcw5R+1/xzl
 qYfbAiQM1F4XVTghjKn6wB3M1tGus9cjegtwg+e392dY3noy4yC33fdGIrrmVmmxY1o0
 qdBuFeTmgvdIbs28SmaSdRkLR08io1gvRmtA5AJrl6VBVa50bO4nyPToBLolWgE6bRkd
 Jo+M/UbWXE2cTM6pT+S7YNIFyRYQwwUnIBABEoNX616sstZPkwH1bvoJNLcwyzYRq87G
 qTr+Zgb13uCETf/c2xzxgW3k0oxgAJP7QYAZjbm99F6m1tTQKJy8CVGPjdXP2LMEQwYq
 RmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bd+246oU+gwCv1nTiFB/RtbYTLmhU4AaWG3IceBBM38=;
 b=ZF0PC7H/Yf53DMXSWEyWF4JPBnh9SksxuhMCipJKjcgvfuNvy/tAcCzVUUanbcy/OF
 q2oNGyEmax3aVZFpmEtPzswn9UoANV9bgQfFykO/Tm36pwXDGW1CsxvuiZwgjoOpdVnZ
 ANmNYui73xlpgl4iej4si7LI+YB5LcOSE/z2VzMqYcS8zcSBSQckuRh88sa6VgW2ipyR
 9tzHr6P/9sTj2PXlKp/y5bNRUMW7SYi/gD39kZ5zs9jPv69UAO0M67HxBrqUXYpSRDA2
 mTZDXicjZupw75Prd17t7+mlwAs6go11+cXHY6aHCJxBNgB+NJnPmkhzpc9WxSYjjh/8
 a+TQ==
X-Gm-Message-State: AOAM533IgdlDoP2esxml/jwOtsfFUimkb4zKdjOre0PSsKitAkfKxrxW
 WFZJAvGpWW9GyCp5pGJOaIIKn8Lp/FU=
X-Google-Smtp-Source: ABdhPJzVP/p95YssgrO9NCctzmif+jzuxLg6etXClVolBI8lU6fa0AfJxeNVcPK2YreboUkw7EZi5Q==
X-Received: by 2002:ac2:539b:: with SMTP id g27mr16548516lfh.612.1643652751169; 
 Mon, 31 Jan 2022 10:12:31 -0800 (PST)
Received: from localhost.localdomain (109-252-138-136.dynamic.spd-mgts.ru.
 [109.252.138.136])
 by smtp.gmail.com with ESMTPSA id r17sm3391297lfg.237.2022.01.31.10.12.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 10:12:30 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Anton Bambura <jenneron@protonmail.com>
Subject: [PATCH v4 1/3] dt-bindings: sharp,
 lq101r1sx01: Add compatible for LQ101R1SX03
Date: Mon, 31 Jan 2022 21:12:06 +0300
Message-Id: <20220131181208.27101-2-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131181208.27101-1-digetx@gmail.com>
References: <20220131181208.27101-1-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
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
2.34.1

