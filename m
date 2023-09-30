Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D64457B405F
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 15:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DFC10E16F;
	Sat, 30 Sep 2023 13:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4067010E16F
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 13:01:38 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1c72e235debso8681805ad.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 06:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696078898; x=1696683698; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LmYgX7BL5Yak5oQpgfXtsfulm672VZZiBhNC2u4UzfY=;
 b=PDgbCFAtCQwybX9AMmGLzA8ieSmwLuAwcz0XVNf2JzoKt5Hje6FodOWlUiC4CV3g5V
 BAbl1b2WaPAMEJyjj9BbmtMMhQ2xXpxck8MyAMvwrRkhqNVQHVhb3/dfeSlQeA4RfQ0K
 nEjyvfuOi3LDkMfxaUlG3wEEV7Z+4Mc1+9Qpt18xkT3lGXvL/GardKjL/fGz7AmscTbN
 YMtf4SIvqu2qX5zZdoqmq2Gicm0uY8h9owlLNEjGepuKTmqTSOYW6AB0FwundWykqFld
 +kEyY6nnnrd3vQmp8fUxCRmknWf3AS7sVz7AINA4jbtWl0cdSfOHr46vXHl75LWBJgJZ
 ErKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696078898; x=1696683698;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LmYgX7BL5Yak5oQpgfXtsfulm672VZZiBhNC2u4UzfY=;
 b=mJ+g8xWi8Jcs04yaMcljU/SUS++lj6uZAt1WbVyCDIA/0THCx8Q0HYBFW14O7WuRZm
 jsMyUQqizaoXgsT21CbsxLxjCoUOpK4SzMV1zw7Ug9xsePxwTo/bXBSon/+Zj4fhywUW
 wox7SA+/U/otJAYhoeKKNV/W+93K39asDhrq0dlOvblwQ+vyewyfyV0C2NjmiXFVEOyk
 qKVLWKDj47mL22jLsabLIpsZgjWEHx3JPD3fRsoJTo+eXOf61GOnniWyNiMoZI5IbPnA
 Duk17fPzeTuc+5ABK2RinwE34ZvQjHsy6DLJl++Rk31fALnn+lGGKUoftEbSgLBTR1wo
 nl5w==
X-Gm-Message-State: AOJu0YyQyYdxnKXhzUj96Prg90vXElV6lzNCs0p3PZBzptYQK+KiOAnf
 +Slhdo6n56lkUPK+Kjygd2Q=
X-Google-Smtp-Source: AGHT+IHqZJT/snJoVf0cMhy8miKyFmGz3DHF93hzHe8fMGXyWWeqhhz5lpLolovaudCzWlT7jWWmzA==
X-Received: by 2002:a17:902:b618:b0:1c7:5581:f9c with SMTP id
 b24-20020a170902b61800b001c755810f9cmr2008137pls.0.1696078897620; 
 Sat, 30 Sep 2023 06:01:37 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:ec70:c4d5:afd8:ac4e])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a170902820a00b001c1f161949fsm18577513pln.96.2023.09.30.06.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 06:01:37 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: p.zabel@pengutronix.de
Subject: [PATCH] dt-bindings: display: fsl,
 imx6-hdmi: Change to 'unevaluatedProperties: false'
Date: Sat, 30 Sep 2023 10:01:02 -0300
Message-Id: <20230930130102.798822-1-festevam@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 Fabio Estevam <festevam@denx.de>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, mripard@kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

fsl,imx6-hdmi.yaml makes a reference to synopsys,dw-hdmi.yaml.

The 'interrupts'and 'reg' properties are described in synopsys,dw-hdmi.yaml,
so use 'unevaluatedProperties: false' so that these two properties can
be accepted. 

This fixes the following schema warnings:

hdmi@120000: 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
from schema $id: http://devicetree.org/schemas/display/imx/fsl,imx6-hdmi.yaml#

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
index af7fe9c4d196..7979cf07f119 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
@@ -87,7 +87,7 @@ required:
   - interrupts
   - ports
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1

