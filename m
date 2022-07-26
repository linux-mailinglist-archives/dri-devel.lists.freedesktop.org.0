Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB7D5810EE
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 12:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10075113526;
	Tue, 26 Jul 2022 10:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E524F11A228
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 10:15:58 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id e1so2444167pjl.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 03:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZVAfKYIxLF8XEC4qYp9NrQYOKbMB2AyqeCKsux8Y4Ps=;
 b=cKy9ArCR9EM1WP9fz9Y5fa+zfnyVHq6CyvuXJFYblKXw6aofaHpEgNTSqk67Erh/5o
 ELAf6AYwGEQcIaulu9r7gfQ8Fx8l6zCMWeDv2cGf0lZBNQqFHKmAMGCp0Yv6i0Od9sla
 d/UySqiHgYHfXdQtitfV2S2upTddqLESkdoJvU45VhtKF2lEUtheD3F2M38BYfQz25DJ
 vHDmffCneudZSr5RgJk4EpSSo6oYUz+y1WSvKgsTfqek3LKT783kc6j4jRmhM1XmkJI5
 ABdZi45zXIIoPl6W6I6ScwTcgyGlm2GeWhfBVDaHoV6FR4gStVBLuyI4cFq3wgZKpbSf
 y21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZVAfKYIxLF8XEC4qYp9NrQYOKbMB2AyqeCKsux8Y4Ps=;
 b=25kVAQZnaNbxhEyzO8INhfHSvI/V3o0syOTI3dcwhnFM48W19E0JsShKQs4NmHH+Oe
 d7UcTmP7LCVxCSrHHz+U3l1WIzpd7DsrL/vjjNyIa1OWBTL8qtmsDfrSTqmfXqTr6gmv
 zOzE0ZqmLipLm7IOYzQTT6K1irjup5ml1vcsEBPKr7L2/ocFm+jc3bPu5rmiMcdMVl5e
 gRyfcAotFOxJs9GKp25jicELyzS6pDk4ShjdLwzHpYx0ePWuaGhHanXHoSeX02MvOwQd
 Zwxw8yQLSCgv8wKQNXhEtTkd9x/JbmEunbcg0eAUHgNdBJSsZvt6ki6ZhKbZ9LJqvR/i
 X49w==
X-Gm-Message-State: AJIora8y47DmEb+w2HsHlAP77NsQ9+n6gl6R/uue2ygHHYd6Tl15/7lw
 LBqt05oBm0GB63zJsPMSfJw=
X-Google-Smtp-Source: AGRyM1uEuxhhReOUIpyudX28mVJ1+KwSazXM5vba9h56MpZRFoDdhfLZvQhnIpCAHaHL9uqXsmmYYw==
X-Received: by 2002:a17:90b:4b88:b0:1f2:503e:b19b with SMTP id
 lr8-20020a17090b4b8800b001f2503eb19bmr22248691pjb.30.1658830558240; 
 Tue, 26 Jul 2022 03:15:58 -0700 (PDT)
Received: from localhost.localdomain ([112.0.190.94])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a170902e80b00b0016d303f266dsm5515106plg.276.2022.07.26.03.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 03:15:57 -0700 (PDT)
From: Molly Sophia <mollysophia379@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: display: panel: Add Novatek NT35596S
 panel bindings
Date: Tue, 26 Jul 2022 18:15:12 +0800
Message-Id: <20220726101513.66988-2-mollysophia379@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220726101513.66988-1-mollysophia379@gmail.com>
References: <20220726101513.66988-1-mollysophia379@gmail.com>
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
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Molly Sophia <mollysophia379@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add documentation for "novatek,nt35596s" panel.

Changes in v3:
- Embed the documentation into existing one (novatek,nt36672a).

Signed-off-by: Molly Sophia <mollysophia379@gmail.com>
---
 .../display/panel/novatek,nt36672a.yaml       | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
index 563766d283f6..560fb66d0e5a 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
@@ -20,14 +20,20 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - tianma,fhd-video
-      - const: novatek,nt36672a
+    oneOf:
+      - items:
+          - enum:
+              - tianma,fhd-video
+          - const: novatek,nt36672a
+
+      - items:
+          - enum:
+              - jdi,fhd-nt35596s
+          - const: novatek,nt35596s
+
     description: This indicates the panel manufacturer of the panel that is
-      in turn using the NT36672A panel driver. This compatible string
-      determines how the NT36672A panel driver is configured for the indicated
-      panel. The novatek,nt36672a compatible shall always be provided as a fallback.
+      in turn using the NT36672A or the NT35596S panel driver. This compatible string
+      determines how the panel driver is configured for the indicated panel.
 
   reset-gpios:
     maxItems: 1
-- 
2.37.1

