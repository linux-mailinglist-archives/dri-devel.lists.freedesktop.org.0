Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9419B48D8
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 13:02:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B886510E0BE;
	Tue, 29 Oct 2024 12:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V8nOLOJi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B975210E0BE
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 12:02:48 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-71e625b00bcso4028993b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 05:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730203368; x=1730808168; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hcfVMusxKwU+TU6SIY1AuqRYgTWEMMrGe1VKj8U1/NM=;
 b=V8nOLOJiu9aQkA/s3KL87CVseBMtAOyxwh4FpwZiYy2CvKas9fy7MyCftZyPETguz8
 KZnIZj5SMnVS2penVwN3hf5xvIUZ5FDbJOI7dUK5ue4Yuee7RH9QHVsAj2Kbw0oEMfqg
 qOXgyXyqOuvm78TCLWWCOLaIZDOAsi9c9EOoDjOvROJ3UO3R8gfdWv08vSjXjnVm6tXG
 kS/Jm8jI+jvHkS2cUVa63aLCzJi1LdGCEdLxb/jgpcQFcUMzzVH6giHD/ygCGr0t4m9y
 k7xXGKMPUgnmn5JfSUCPC37t8TAmlcZfx3PbV0SROnlTJzO6HaSMS84CLW+QjZtNuGfA
 cCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730203368; x=1730808168;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hcfVMusxKwU+TU6SIY1AuqRYgTWEMMrGe1VKj8U1/NM=;
 b=fWZln0amTlCAuOQZ/u5fhAVL1aDyZAlZsGwfRmfhD+a3oe1G3sCL5E2rF4QdPtenzi
 J08Ej257CWNScQFAe4o3z8moyDrgu55L6O7wR0FjWIo9lcHImIws9FGcWkznJLupSglB
 QSweZTxOxROaXb6f+upy5VGnzVP1bKqTjJb4sj98SNIHV2yThilwmNsPTK3Y6AcpN8KF
 rF7E7PFG+lL30rDCsfQLP7qLuC/ECfyj4eHxpcK88MDmDXHD2yJYWZ2fcVJP8YLJERUj
 FsldQEaKZoeKw+6gP+OG+xg/l/v/+HcvKZYI+husmwOl5k1GvZ467GOzPYd7p3PJ2vva
 Nbkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAwNrRraVm96u4LnIPtHGXjMqSl5WDlWLL2cY/4mVCvTiEHhKoFwtlSHjjXv31yG1jwnBmwwn2lfk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/9Y90jL7EZ1Tf/Ft8CZrgfU39JMyytk4qXgJCI3MpPmrJkK1e
 RQrLZ/UvHp/SKb51wZ6Cn73c+VIDK2TUBI0LW1YJTyJeN6Yz6tIZ
X-Google-Smtp-Source: AGHT+IE6/N4HaxtLmsC1vv1SohgG4z64qywId5rWMF+nsLvluOwKa5NTqFO4bJD8re1fhrw1o3yMuw==
X-Received: by 2002:a05:6a00:198e:b0:71e:7e8e:f684 with SMTP id
 d2e1a72fcca58-72062fb82b0mr15764161b3a.9.1730203368031; 
 Tue, 29 Oct 2024 05:02:48 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:c7e4:1ef3:7ef7:5ae0])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72057a0b7d2sm7428830b3a.114.2024.10.29.05.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 05:02:47 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: marex@denx.de, a.fatoum@pengutronix.de, andreas@kemnade.info,
 kernel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif fallback
Date: Tue, 29 Oct 2024 09:02:34 -0300
Message-Id: <20241029120236.299040-1-festevam@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

imx6sx.dtsi has the following lcdif entries:

compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";

This causes the following dt-schema warning:

['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long

To keep DT compatibility, document 'fsl,imx28-lcdif' as a possible
'fsl,imx6sx-lcdif' fallback.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Newly introduced.

 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 8e3a98aeec32..836955de3bc9 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -32,6 +32,10 @@ properties:
               - fsl,imx8mn-lcdif
               - fsl,imx8mq-lcdif
           - const: fsl,imx6sx-lcdif
+      - items:
+          - enum:
+              - fsl,imx6sx-lcdif
+          - const: fsl,imx28-lcdif
 
   reg:
     maxItems: 1
-- 
2.34.1

