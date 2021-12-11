Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1514716CC
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 22:38:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4A310E82F;
	Sat, 11 Dec 2021 21:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E4B10E6DC
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Dec 2021 21:38:07 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id bu18so24330294lfb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Dec 2021 13:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a8C2Ox9mLAi+48xHMMaxUeraFYeN7fBArVOxNr3R0I8=;
 b=QaE2nnf/2Ogb8IBsN2aGR8hcuFjn0C/bwIbtDK1cUUTuEY5/wc1Iz6l6z7uz9laLd+
 Tlt3ezJN1y3dbA05wlBAHptRCt4J4uBd30PJtIdG3Sk1B3mzlEoAEeg9EI9r8KtJ5k/7
 y1SbuRSUc9ppr7NLH33eq75WmPCffemZ5Ad0pbK9ZNBM838m/rUWtspvYCmGBta8z0wf
 aAEFg+8YxnRUllhNcQ7Bu6Usgk9D+OHcDCyHudYHpvIkXMgyuaSgt25azzVe16k+Q6xF
 jeZ4j6H0xYEKRXmCJK0Tuug9KZO3GjX887WSAh5TP7TYIzLdh2m0ffyqG15OlUFBMK1o
 UBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a8C2Ox9mLAi+48xHMMaxUeraFYeN7fBArVOxNr3R0I8=;
 b=gOmaxE6vaNfRcZF49RWuYu34KqcQrE3OiMDGBK3x3725cwurx7QMRn+SuqWYwmqedw
 oEksFjIIUoQyShfEP+RKs8VHlLAdKhZiwLFZxymdHU4nDkuHGPJkYs7ZezBfVLp8wAin
 RZOwVoU6RurOLwM66fNfUS2cqycJ47EfO2KaBglKxonZfKV8ITvXzengp76sC7YHm68Y
 sUMiydk5R6d2+97KvTvagm2/+xtBvGrwgIRImuy3S80Hp2Xn6XoD9RBYxfQpSN2IaG3i
 PA4Id+5nNlv/n1/ps0tzT/7byL/I+U4OnZSwZosay4DzkTqykAuU8SepcccrGJghApKx
 7sfg==
X-Gm-Message-State: AOAM530KPyr/h/CNLG46F43TNhlzK5qPYjjJgySFWwo0HIyOn1HocFD0
 XoP5PXsEbdWaaZJwSM5k5H4=
X-Google-Smtp-Source: ABdhPJzzQaET53q/FDFQJ9CyBQfgCK/ECu+LJ6oDv/04jXNG6kWMXPjoDGISTC/hUXs0JaRT+NWkGA==
X-Received: by 2002:a05:6512:3185:: with SMTP id
 i5mr18737901lfe.341.1639258685583; 
 Sat, 11 Dec 2021 13:38:05 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id w14sm786844ljj.7.2021.12.11.13.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 13:38:05 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Anton Bambura <jenneron@protonmail.com>
Subject: [PATCH v2 1/3] dt-bindings: sharp,
 lq101r1sx01: Add compatible for LQ101R1SX03
Date: Sun, 12 Dec 2021 00:36:51 +0300
Message-Id: <20211211213653.17700-2-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211211213653.17700-1-digetx@gmail.com>
References: <20211211213653.17700-1-digetx@gmail.com>
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
2.33.1

