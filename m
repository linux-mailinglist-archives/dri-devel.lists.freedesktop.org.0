Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A15271734F
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 03:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80BB510E45A;
	Wed, 31 May 2023 01:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A129B10E45A
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 01:43:42 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-19e74f68e5fso581333fac.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 18:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685497420; x=1688089420;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lj8cUBMM4Kyl2UivwW5UEK62sHqLglmMEtBf6tnWuSo=;
 b=bH2I8+OalfFuKbW3oYa/YyEqCdIHZNCChJoFnjH6WHbAqSYE3+l6lIFpuhNb4b3SjO
 zvpXlUoi0CwFQijXJvTDNcsSrqSzQ7IE1UxcOsGE9RVwNCBTSdbRwHyJTFFS+HvXqA2b
 TGz5HtLgYE9qt9CpAEMaDFEejlz0LQDaH5zzPGPCg1qKxoiJPWx9KcNaMFCBGdyjaERX
 j1mZO58v7/slHNyOeeQ6vNa6Zhlh62QF3mj6nf6UdgV8MJcXdcReua5MfWXwvC1MqjVo
 IOOoow1TT55hgCUlJ7bEMaCDtfTvmPmIYXX4XlcxBDrKUSjGKgQ1vJs7sema336PdYKH
 9ysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685497420; x=1688089420;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lj8cUBMM4Kyl2UivwW5UEK62sHqLglmMEtBf6tnWuSo=;
 b=dakUKX15Ip7vwx90bxI9Pm4DXP95Jk86ugLfe485TuVZ5wwgD3vOhyK6NKXcc1WYw+
 limrwQPfSZmB6Vn9Jn9TLmC/zpd3dHbLCHY/HfZyUzgXPZLbBANFla13jGghoTYlFZ4K
 uD0dd/SLngb0mx0HwVLjo5Cs4oi6Ob4Pf7EhJHrTLJo33yB1ZQCmBIG3nYzihnvWzPVM
 S0Y1XfzLo6KCAKIw4f94QAW3hsGQYJ1ctz3z+NdgV51vsewEc+HixWhf1quBgF7pTy4N
 iItdBn27/rNB8GdfTNLmFUFlxCEe5Yz/hBmcJosPM3kGyScjXZzxKWX/5VXOoQ8/N6vW
 sh2w==
X-Gm-Message-State: AC+VfDzGY+5Eh72JAuCHKdhv5ULssUxKDFnXNFpgZSogzJ44KJI+sq3i
 NqDD/tCHRa9BSFrqGg2UsRA=
X-Google-Smtp-Source: ACHHUZ4sdjDNkdxKTMNWmKCHalmImX2glGn4pWTP2WoDFfeTJEzIOy4V5xX4OT9zq3H4n+qqBQ5j6g==
X-Received: by 2002:aca:e156:0:b0:38e:ca01:3a65 with SMTP id
 y83-20020acae156000000b0038eca013a65mr330481oig.1.1685497420434; 
 Tue, 30 May 2023 18:43:40 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b69:c694:9254:2d8e:be7e])
 by smtp.gmail.com with ESMTPSA id
 fu17-20020a0568082a7100b003942036439dsm34153oib.46.2023.05.30.18.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 18:43:39 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Subject: [PATCH] dt-bindings: samsung,mipi-dsim: Use port-base reference
Date: Tue, 30 May 2023 22:43:15 -0300
Message-Id: <20230531014315.1198880-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: marex@denx.de, devicetree@vger.kernel.org, conor+dt@kernel.org,
 Fabio Estevam <festevam@denx.de>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

Use port-base reference for port@0 and port@1.

This fixes the following schema warning:

imx8mm-evk.dtb: dsi@32e10000: ports:port@1:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
From schema: Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml

Fixes: 1f0d40d88f7a ("dt-bindings: bridge: Convert Samsung MIPI DSIM bridge to yaml")
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
index 9f61ebdfefa8..51879030dd6d 100644
--- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
@@ -93,14 +93,14 @@ properties:
 
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
         description:
           Input port node to receive pixel data from the
           display controller. Exactly one endpoint must be
           specified.
 
       port@1:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
         description:
           DSI output port node to the panel or the next bridge
           in the chain.
-- 
2.34.1

