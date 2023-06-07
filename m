Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C717263C7
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 17:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 578AB10E506;
	Wed,  7 Jun 2023 15:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1198910E506
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 15:11:38 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9745baf7c13so962736366b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 08:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686150696; x=1688742696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/lCkOH0dTMYfmftYr+XeGrSRIetqwhmrVfou0QqoIt0=;
 b=dEqCcXpPH8BLEA/DLJGh7f/Myx/bEaYYzRYdg6HVEr+xE4WqmI3mlfa62Hiz+9MHNF
 Um6HfObp78Gnj2T8bdRoL7JdpFwHNPO88pM2tDOCsc4eclIblLprM1aKoJCnLeOdGLGu
 r4OYJUTD7/v80dhZAg3K3HRmovh8L7i8NPKVCXANpODtQSwweAYbUfXM2L1+vad/K59j
 sU/eJwnn7Wq57OSE8013AhmvFMgYpOu1DI69dKSF7HqQ9wUKXH9VK+KEBO+spKJmceOq
 4hk4SFPKgpPkPlM/By6FN5/feDPrDiJUs/S7pok3l75dGEVHVIQOwKEBmb10E2kvlwri
 hGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686150696; x=1688742696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/lCkOH0dTMYfmftYr+XeGrSRIetqwhmrVfou0QqoIt0=;
 b=Eb+rly79ENOV34CJsAJEPEsnxP54uy7MrP0wtwQ4htQGQEHkMAsoFJAfDJwJIvQMVx
 0LqJPuiIP3CYWA8Pz7OST3MbyCy1cViHttYRpuaxCmXMwVJSysl5S4JE5u5dSHoO+nwn
 wHshSvImfrAY9LXpgNAyl4HqKH+qB6G/A0P5OkwePjPEX0OYoBkLm4QkQl396/1/xquy
 0Xk4+OoO0nxeO1Hh1W6pR8JRO2lr9kRih4e8yTvtKGDBeoX3Lv1h9QVtTew69yV2Nnb+
 IlXXe54IHuC607ak3QNLP3aJ8yXIqzMAAT+JAIujTIT8LU2/wB1jOmStVGdoYR+0P70f
 zzqA==
X-Gm-Message-State: AC+VfDwzGo4JkDk6Vs/CXVB7AWWu6YVCndeePf39rYKYzn346l35PG3L
 kwKShJE+ln7JHT365Swo+ck=
X-Google-Smtp-Source: ACHHUZ6+uoPvY6CEbwnL5CZV4ptGTfNw5hBhUF2HPpxpP1fPUX4S3bd1OtYraPjOc3SBz3D7b5LTwA==
X-Received: by 2002:a17:907:3f1f:b0:965:6075:d0e1 with SMTP id
 hq31-20020a1709073f1f00b009656075d0e1mr6312083ejc.72.1686150695556; 
 Wed, 07 Jun 2023 08:11:35 -0700 (PDT)
Received: from fedora.. ([46.188.160.176]) by smtp.gmail.com with ESMTPSA id
 m19-20020a170906235300b00967a18df1easm7006222eja.117.2023.06.07.08.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 08:11:35 -0700 (PDT)
From: Paulo Pavacic <pavacic.p@gmail.com>
To: neil.armstrong@linaro.org, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org
Subject: [PATCH v4 1/3] dt-bindings: add fannal vendor prefix
Date: Wed,  7 Jun 2023 17:11:25 +0200
Message-Id: <20230607151127.1542024-2-pavacic.p@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230607151127.1542024-1-pavacic.p@gmail.com>
References: <20230607151127.1542024-1-pavacic.p@gmail.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paulo Pavacic <pavacic.p@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fannal is a one-stop-solution provider for touch displays in industrial
application, committed to delivering a variety of professional high-quality
products and technical services globally.

Website: www.fannal.com

Signed-off-by: Paulo Pavacic <pavacic.p@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 82d39ab0231b..f962750f630a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -462,6 +462,8 @@ patternProperties:
     description: Facebook
   "^fairphone,.*":
     description: Fairphone B.V.
+  "^fannal,.*":
+    description: Fannal Electronics Co., Ltd
   "^faraday,.*":
     description: Faraday Technology Corporation
   "^fastrax,.*":
-- 
2.40.1

