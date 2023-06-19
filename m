Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C46B1735C7D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 18:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BE310E229;
	Mon, 19 Jun 2023 16:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D10510E229
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 16:55:51 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-76241c98586so282347085a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 09:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1687193749; x=1689785749;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HXhpNMq77ixD+XgN0GcYbuylNiGuY9CxnraNzjgz9ZY=;
 b=PouTpA+2eidqrl2NfeWbcV1LWEd+x0sWxTYQqZBmR29e20+aBqMcRvmbdsZHxk/2Kq
 RlWwI7B6oc4NIV+fZrj9r54OOU1KWGPD93E/gAX81LmHhbzAz0pjOmQ9MyzQOqhaQ325
 8/nMG/HMKeVZlzv/TM7cOrnvPqkTZAVZWRW5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687193749; x=1689785749;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HXhpNMq77ixD+XgN0GcYbuylNiGuY9CxnraNzjgz9ZY=;
 b=NedINlkxQ9C084eAc/ER2CP1vXb7Vtf9flcNnaLd2QFZ0AhyF3ewpGPVYDt6Gb69Xu
 axhk3x4rku7y1hSLUeygOlCpbMf0NaZRli2m00wZyKZYyscXw2NmqK3OB7AC1BwqCXOj
 2oxubmNeIZGRQNKPP9+VmO5qyewiRm++JKeGbLesiPFwcOWTAWHhA6I5OD7b+L9aTZWG
 UCX1w7PV9e6ikn+6EzTQbsX/VVOcUx6diibxEEES1DHli/2oi82BKnBqymKI4+4GgkA6
 8yQdjRMY+fwrjCPkxaS560NHfn6PQxbwY7WoQr+x9AuDBEM8FAkBKgK9N+/l73qOTcVv
 fYBA==
X-Gm-Message-State: AC+VfDzqDa1yNnYgn8qqcCVBYsGQBBdkD0gKKQJBGDTSqFwgWk8J5mKg
 G7zON0DiewXqPsBDll8ZXO4zIg==
X-Google-Smtp-Source: ACHHUZ6AP48wP9d8GIHmSV3eR8tx7WohjgeTcIWdUh34I5pP/yusbF5PhwUo6SmU/aUFLMfgqX8keg==
X-Received: by 2002:a05:620a:cd2:b0:762:52a1:4687 with SMTP id
 b18-20020a05620a0cd200b0076252a14687mr4387025qkj.22.1687193749648; 
 Mon, 19 Jun 2023 09:55:49 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch
 (host-79-25-27-4.retail.telecomitalia.it. [79.25.27.4])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a05620a15f700b0075d49ce31c3sm109103qkm.91.2023.06.19.09.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 09:55:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/6] dt-bindings: display: stm32-ltdc: add optional st,
 fb-bpp property
Date: Mon, 19 Jun 2023 18:55:23 +0200
Message-Id: <20230619165525.1035243-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230619165525.1035243-1-dario.binacchi@amarulasolutions.com>
References: <20230619165525.1035243-1-dario.binacchi@amarulasolutions.com>
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
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Philippe Cornu <philippe.cornu@foss.st.com>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Boards that use the STM32F{4,7} series have limited amounts of RAM. The
added property allows to size, within certain limits, the memory footprint
required by the framebuffer.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 .../devicetree/bindings/display/st,stm32-ltdc.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
index d6ea4d62a2cf..1c3a3653579f 100644
--- a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
+++ b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
@@ -42,6 +42,12 @@ properties:
       - for internal dpi input of the MIPI DSI host controller.
       Note: These 2 endpoints cannot be activated simultaneously.
 
+  st,fb-bpp:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      bit depth of framebuffer (8, 16 or 32)
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.32.0

