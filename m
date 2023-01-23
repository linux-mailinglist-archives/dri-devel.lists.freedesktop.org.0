Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 434536784FC
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 19:34:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07CA110E53A;
	Mon, 23 Jan 2023 18:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA2E710E53A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 18:33:54 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id v23so12343102plo.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 10:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z5IxIuLXIzMBoG0XrU4LAFoYJ8pt4NLCHCLfx4Q13i0=;
 b=MorUgykJS9hHD+eOnge57SyYCmDTGHRccXWQyovP0HhR3EVs++Fn65eUQcaEti7/vK
 2J9VWXEUWM4S/OMzYss2+E+dtxhlx5ddTNOsa2S+9I2E47eS2hct9iEyKkLK5tUU3zo7
 rK3gwTXafWsK/hnCuG41xOtQzja+Um/Xy2z1RRelJ9WLpIrsYc/IVYrmJUEwdb0dtu92
 B1wg9bx8uqmueU6JsdYidmYzgvoOKt9tbfwFchzcIuhBDLYE8Y+1us6KEKhvsyPCFctl
 QOSw3V/nfFndT22+21gc+VW4kHbXMQksWxK1L9poMkafSY5B9UrRChBn200relp/IniW
 8CoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z5IxIuLXIzMBoG0XrU4LAFoYJ8pt4NLCHCLfx4Q13i0=;
 b=2P7exSm3WX77zdCwMp0ioTeJlEVHwKPySApTBPdksuSCegj1Ti72ZsLurkybTFB5Ld
 kRpDQpnliBssi0UnGRu0AwzAilX/kFDy088Lui231vjfWfT6NJYNEuIv+Fmbxa7Qp+by
 R5Rb6L0DJ/05mT4LRi84qqf1/EfeM779e634qWehL2QTSJ5+3LzmQZrYb6pVnUijedWS
 didNiYOUhI9gL4sCP7VM05e1L+nItBaQqh0fZXM6f+ekQjIE6mjLXV6p+vmyPTKd9yLq
 ErhCFycKmPcOTG1Dc0MfSaRojIrvpI6eZhLW199+EmwoPMzEtm34eq/CrtdTCOa2knat
 fCnw==
X-Gm-Message-State: AFqh2konMWtBPgHR9Ebj4YZwlTbdPemkjdKhOXa1zKyigkEsTsWk6waY
 0CYS7UQcs8J8iz+aSuYbQTukDA==
X-Google-Smtp-Source: AMrXdXu7dm+KTw/8jnZTGEAiJ/9vO0tNyN+nN4lSL9Vl5tGJ2bpDXf6DmweURXjTsknGBNS7R7Sy5g==
X-Received: by 2002:a17:90b:704:b0:223:f131:3604 with SMTP id
 s4-20020a17090b070400b00223f1313604mr27157008pjz.17.1674498834252; 
 Mon, 23 Jan 2023 10:33:54 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a17090a800b00b002291295fc2dsm7008684pjn.17.2023.01.23.10.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 10:33:53 -0800 (PST)
From: Jagan Teki <jagan@edgeble.ai>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 1/4] dt-bindings: display: panel: jadard,
 jd9365da-h3: Add Radxa Display 10HD
Date: Tue, 24 Jan 2023 00:03:09 +0530
Message-Id: <20230123183312.436573-1-jagan@edgeble.ai>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@edgeble.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Radxa Display 10HD is a family of DSI panels from Radxa that
uses jd9365da-h3 IC.

Add compatible string for it.

Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
Changes for v2:
- new patch

 .../devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
index c06902e4fe70..9b3b8a95cbc0 100644
--- a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
+++ b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
@@ -17,6 +17,7 @@ properties:
     items:
       - enum:
           - chongzhou,cz101b4001
+          - radxa,display-10hd-ad001
       - const: jadard,jd9365da-h3
 
   reg: true
-- 
2.25.1

