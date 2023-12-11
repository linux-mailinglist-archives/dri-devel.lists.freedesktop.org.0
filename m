Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 263C080DBD0
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 21:41:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5486610E4E0;
	Mon, 11 Dec 2023 20:41:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915BD10E4E0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 20:41:49 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1d03f90b0cbso8925815ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 12:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702327309; x=1702932109; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JrUH18u+0NaS8PYtvwYrNxG3qzQVThi1TGXG5Isavng=;
 b=Q/82FI+XSSzfLDdpe7Zyz1FU+PVXbhGdFq2KqhstU8KLuwRz9m0uo+naKdWNMOb96G
 BX0rcrwaEoan5VLoOxDXlMtwt3QpbMYie1uDwtKgemXruqMS/dDL8Nn85tJ2+TuGhiAT
 S9NjQt4OyLIUy2g1suEmyk3fQYh9CRIabOCDPbtulxy50+jC/aE000+krCX5omiIes+L
 2UtMUoQ13DgwhdEevpKZ2W6nIaGsdB+b+hoJZtTa6cVV25hFKe74OQ/aGiDSYTt1SA7Q
 fehcKw2ZBg33FZI0hH9PoXI9tmMcI6yo9Bs6yQrIpw4A8qu7tJo5PecBrlWpCADcQbOb
 khog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702327309; x=1702932109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JrUH18u+0NaS8PYtvwYrNxG3qzQVThi1TGXG5Isavng=;
 b=MbcyoUapNk//3f1ZEV30zwyNkhnBHIriMnEiWrDM/5yfxYgz91ryhOAj3lYFjrBtVr
 OqklSLDeyaqM6850bPcUCyJtRbA1+Laz4rOcIUamtuACmHKf8tZ42CJcEVjLxMrsuRIs
 1afodl7yikmPMTJ0TNQOJehzvWl87mS8VXhIvOj6psGeaP99hsZZ+b36ZSb1fzvtsDQo
 SfKb5jZdLAhaKUVU1Lqj85pZSAAzcHGkbVg5wEIiO+46z9YQ8f3g8WXKFL93uLyhltt7
 G/PpABD2Te6xqJ34ukvKVbMR3KHqh60etc0XpZljQJv9TOpr/4FD6V2vQYY/XpmqoaIe
 UOHw==
X-Gm-Message-State: AOJu0Yzpq+Uc7YqHHxXZHX+0jBtn3ja7wEGayHiHd592LkeTiK3jDrY/
 KJEYKxm5xhozYzkJnzaxDcqF5Wq4k0c=
X-Google-Smtp-Source: AGHT+IF4n1Se4Q/P/CasQTIGLsXUtFG6qJtTwWy2VJlrPfq1GEn4zZD7I79/h57u8EqYPk05TaF82w==
X-Received: by 2002:a17:902:d4c3:b0:1d0:45b2:d8b0 with SMTP id
 o3-20020a170902d4c300b001d045b2d8b0mr9145441plg.5.1702327309084; 
 Mon, 11 Dec 2023 12:41:49 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:1d51:eaf7:9aaa:d7c])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a1709027b8e00b001cfc4d8ede5sm7124809pll.301.2023.12.11.12.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 12:41:48 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: marex@denx.de
Subject: [PATCH 2/3] dt-bindings: lcdif: Decouple imx8mq from imx6sx
Date: Mon, 11 Dec 2023 17:41:37 -0300
Message-Id: <20231211204138.553141-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211204138.553141-1-festevam@gmail.com>
References: <20231211204138.553141-1-festevam@gmail.com>
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
 Fabio Estevam <festevam@denx.de>, kernel@puri.sm,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, martink@posteo.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

On i.MX6SX, the LCDIF has an associated power domain.

i.MX8MQ does not have an LCDIF power domain, so allow passing only
"fsl,imx8mq-lcdif" as compatible string to fix the following
dt-schema warning:

imx8mq-evk.dtb: lcd-controller@30320000: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 1c2be8d6f633..8969e56d4c98 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -20,6 +20,7 @@ properties:
           - fsl,imx23-lcdif
           - fsl,imx28-lcdif
           - fsl,imx6sx-lcdif
+          - fsl,imx8mq-lcdif
           - fsl,imx8mp-lcdif
           - fsl,imx93-lcdif
       - items:
@@ -77,7 +78,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: fsl,imx6sx-lcdif
+            enum:
+              - fsl,imx6sx-lcdif
+              - fsl,imx8mq-lcdif
     then:
       properties:
         clocks:
@@ -113,6 +116,7 @@ allOf:
               enum:
                 - fsl,imx6sx-lcdif
                 - fsl,imx8mp-lcdif
+                - fsl,imx8mq-lcdif
                 - fsl,imx93-lcdif
     then:
       properties:
-- 
2.34.1

