Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2067B5B45
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 21:30:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBFB10E241;
	Mon,  2 Oct 2023 19:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3DA10E234
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 19:30:22 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1dd0526b5easo56397fac.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Oct 2023 12:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696275021; x=1696879821; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9iDaa4X1Y5jbfjT705OCLqkQocAlwvZHx6AeV5vDqY4=;
 b=CwhstYPubAB8x609w5CCEeq0CpskbU7EfDZj+WsrJ42V4bbwng732Pjm18MgNaM/P/
 neBOQL4PuCelwT9MLrwrLZQHPFRQkl7ZOhpwkg1U9db0i2PlHxu90zIP6qNGm8+2pkPi
 Eq/ZEA4Qehj1deT9MsQCeU8Rx0buAq8c5b8VbdNvKd0xG8O2uHCFI+Ba8Bpcl4ZhSf7j
 orVe+fdp2aLZlDok5MPt3D2bpAMd2e3pwkQp5qrA/zl99iKu7Fdt86lB3YJRO1Dg75Oa
 ogndzd2CjCqt+2wPtsRN1XYYlf+3zMeRD+BOejcQJZpNe10AOirti6sLHs6kJmIpXJS/
 M1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696275021; x=1696879821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9iDaa4X1Y5jbfjT705OCLqkQocAlwvZHx6AeV5vDqY4=;
 b=WXHMBLZeqqTJNwBBdyabykyyLvt0tQvtLYLhuN3vbr4dCYvsd5j6V0Gv+5OO9jCbGV
 3YAb/7qjNze3We78EzpWk/wc7Slhr7IdgWehbJtu4VXUt01AAxYUgCfnH/bPJraaocno
 TY/oOhqab7keM0MLFnz/zfQXI7McYbGq+kd3dlZ9EjLHNvwUeE/X8ec2NtwsIQaHL6gn
 qR9f2Y7gpgQLn7qocmfQCP+wUx6N/ilGmOzfKFoJfww0iWIhlzzgDOD3VLyIDqD7HZQm
 fVsSiCqaPv3gEccMm8J8tBcnnSEeHAwoflw2Wc2mxJTbo8V12TePuxyudd0mTqlDEct5
 GvWw==
X-Gm-Message-State: AOJu0YwPBDwTzwXRD+P5YGOo950cXdKP9fIIldIJNgS1PX+MzXkMPASC
 n/SyoexRxxJzEDz1Zhio0u5TOqPhk5M=
X-Google-Smtp-Source: AGHT+IFQ14kyhnh9jyNXU1XNyvfZ+NtqgSeetcqSg/d4XXhYF/3quwOPM/3WxnwJ+k+UEdPTTre9rQ==
X-Received: by 2002:a05:6870:a10d:b0:1be:d3a1:fd9 with SMTP id
 m13-20020a056870a10d00b001bed3a10fd9mr15934272oae.9.1696275021208; 
 Mon, 02 Oct 2023 12:30:21 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 ep35-20020a056870a9a300b001dc8b2f06a1sm4846398oab.55.2023.10.02.12.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 12:30:21 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: devicetree@vger.kernel.org
Subject: [PATCH V3 1/2] dt-bindings: display: newvision,
 nv3051d: Add Anbernic 351V
Date: Mon,  2 Oct 2023 14:30:15 -0500
Message-Id: <20231002193016.139452-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231002193016.139452-1-macroalpha82@gmail.com>
References: <20231002193016.139452-1-macroalpha82@gmail.com>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Document the Anbernic RG351V panel, which is identical to the panel
used in their 353 series except for in inclusion of an additional DSI
format flag.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../devicetree/bindings/display/panel/newvision,nv3051d.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
index 116c1b6030a2..cce775a87f87 100644
--- a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
+++ b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
@@ -7,9 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: NewVision NV3051D based LCD panel
 
 description: |
-  The NewVision NV3051D is a driver chip used to drive DSI panels. For now,
-  this driver only supports the 640x480 panels found in the Anbernic RG353
-  based devices.
+  The NewVision NV3051D is a driver chip used to drive DSI panels.
 
 maintainers:
   - Chris Morgan <macromorgan@hotmail.com>
@@ -21,6 +19,7 @@ properties:
   compatible:
     items:
       - enum:
+          - anbernic,rg351v-panel
           - anbernic,rg353p-panel
           - anbernic,rg353v-panel
       - const: newvision,nv3051d
-- 
2.34.1

