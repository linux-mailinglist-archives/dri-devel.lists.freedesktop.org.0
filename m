Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F00E3678500
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 19:34:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE81E10E541;
	Mon, 23 Jan 2023 18:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7554F10E53E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 18:34:01 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 z9-20020a17090a468900b00226b6e7aeeaso11822975pjf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 10:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7cn0U3nFOsG/arCEAWCbnKT9IIs5QdCAGIRMoPtEA28=;
 b=plGCsh5b3Vm2xTrhFqczpELlQ1Hh93Ek4tNc40wfuO23d4mMnCwHdMhzoldABODVp0
 tPG5NOaW4WgnThJQsetrbbX4LxyEs8GdBBiouztx8VnSgTg33Va924eauanenv53CU5z
 GUfwcb/wM7KOTpHGISDSNdJsT4pTWReqljqGU6WuA7zb1FNZlf2gdUGLF0G2qxnTyBK2
 3drU8pF0yp1uqQhebmyhW3P4hc21XGPqHYxX/ydd+XGkvp+fwLVRmSMavkvv+LBtqC2+
 SHT7AZWel7VwgLZa+0Nq7XSMLY3uk27GbRwm4UrH09eSiAalG+ic5L2z0ASmpnCCMt0u
 Hdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7cn0U3nFOsG/arCEAWCbnKT9IIs5QdCAGIRMoPtEA28=;
 b=wxg0RLImFnuoIbLtrXFNaFoP5ijuoGqasefWrM9FhY/ZZUWzAPfj97N2/18dJczI/6
 4KZ3MHCCPK4D4BJmaCmUCLnT3HDRfHbPSPgymsDTh13TSWKSGyuav1oNFvWLsKqpSiww
 1KizfY6BUzez4cJP8sO7CYMO6evJGszxZ5dcALM+bJMvYHq53+SwK4Ap3S2Vgcftttyw
 Rv4gMb/E/SaNhmS6zjgWrharpauNy0I8ueBp3/Y1ZvWTZ5cIkGjllEjNDfJb7ei6rOiw
 Sl2YSjuBljDDhr18g3rdSyGWTNUNcy1spKPoOXMNqOGNYbfxvYLXVsJkrXPxWQUkTbyY
 FSkg==
X-Gm-Message-State: AFqh2koszkJuqiYyVDGtCNUT7EUf+h/sIGeYhqSjJHbaYnQIP8AbYGE6
 /oslv+O9c8Oevh4Hf9JFxgB47A==
X-Google-Smtp-Source: AMrXdXvDk9/AdNRKLC9BqIYCu6XHNGOnFzVco0xPjHYXVJeyK0SqxlceAS8UgTTmR3qYYAEExDFBdw==
X-Received: by 2002:a17:90b:110e:b0:228:cd5d:aa8 with SMTP id
 gi14-20020a17090b110e00b00228cd5d0aa8mr26068808pjb.30.1674498840975; 
 Mon, 23 Jan 2023 10:34:00 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a17090a800b00b002291295fc2dsm7008684pjn.17.2023.01.23.10.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 10:34:00 -0800 (PST)
From: Jagan Teki <jagan@edgeble.ai>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 3/4] dt-bindings: display: panel: jadard,
 jd9365da-h3: Add Radxa Display 8HD
Date: Tue, 24 Jan 2023 00:03:11 +0530
Message-Id: <20230123183312.436573-3-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123183312.436573-1-jagan@edgeble.ai>
References: <20230123183312.436573-1-jagan@edgeble.ai>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@edgeble.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Radxa Display 8HD is a family of DSI panels from Radxa that
uses jd9365da-h3 IC.

Add compatible string for it.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
Changes for v2:
- collect Krzysztof ACK

 .../devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
index 9b3b8a95cbc0..41eb7fbf7715 100644
--- a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
+++ b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
@@ -18,6 +18,7 @@ properties:
       - enum:
           - chongzhou,cz101b4001
           - radxa,display-10hd-ad001
+          - radxa,display-8hd-ad002
       - const: jadard,jd9365da-h3
 
   reg: true
-- 
2.25.1

