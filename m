Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9AEBD642D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 22:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C6EA10E50A;
	Mon, 13 Oct 2025 20:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OH86+kWp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C185410E50A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 20:52:15 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-3369dcfef12so5280270a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 13:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760388735; x=1760993535; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lCJT5qJRzoYDN5HCSmFRUGhqrxSLVQWaebjounZZ2/g=;
 b=OH86+kWp+o4rStanjNobZc+G4+lx8dWVMODilkPPp+qIZ2mPKjnGFtzY5HzGRuN666
 vIoWwNFlNPi5ecQXjWRGpCfYIun87bTJU3uY6oy+iUD8yTz7B441joMs97qrFVRrzQzY
 JOOThWz2/EAj7MHyhNWU4DFxn5kUgWsIwCtZr1d0+fLGzxVfA4cEfspWFYg07Gbwpr4V
 v06OkJPWI/idG0TqOc5KqckGKcLQZ9DxKieLrC7scf+dxcCdxWplforbzvtUZVHI5RkK
 nrl7Qsq6XjyLVq/e2Y0mY5fjzY8q4L6Lp7U/65ZotyoDU+H+7/9PjkqnaSOvpIZCQU0q
 E6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760388735; x=1760993535;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lCJT5qJRzoYDN5HCSmFRUGhqrxSLVQWaebjounZZ2/g=;
 b=FjVcuJTodZkNQXQT0b4asCZUPM2oCFMUGhRn4dVBcHouzT+EBosbydQ3J1l7hPJGY7
 AVahU26Qp9Nctdqqd18DiV4A8OQRcRgDMbnupJMa6yy5tIy2jBdF38XrBpWOTGou1sIk
 B58QqkdmKrtGbF3fVurHMz5ACJtXikS8KdTR35hIhMbBDB4bb4Zzl9th+tJ88i6jzOxC
 fJpDckF3P1kTwpakXiLcqI+P3EzaJ2O63x7gfFTUZp0e5BGENtqVVooCe/wO4Dee2YnY
 tz9RUaSTWAJvAGgoOb/o1y1XP3ibLoTq9ta1/JFQvDQnhfwt6m6A82Z1KMI0XaiOElKn
 DSjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIHXarhCFXWOxA793ES/8yDqjbY9e3Z5ZgGrNHwyeBVvdzoZLrX/qiKdGO/SmlIH7iOP+UtdR2Oyg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNUV699y10YPuUzFE3/4kJ6/RiOclvqheIp7RdYnvJgL+9Y0Ei
 lXcHY+zT1zLCMGEZYyXtLv0255lfxKjX3nhco5cicUjqMfFdhXyx3ylq
X-Gm-Gg: ASbGncth2hDSwVql6bHPX/zmeWLwB8Lm0xs+o0+EITgWrl8eQ7YyVk1gHPZRxcWjuoV
 j1n+dJb9N0gJg0J+xPoQWM6tzQG74ljkskq2SwR8y1dJTHV4zfUZZOSup6id5NiKIVUxEIn/6wc
 gq0MFv4wlLH6pN6Ne8ft6SQtNE6eRfbyw3uPjv13bIdkOYq3BWgoBL3LxhbluthxkHo1+Bpb57v
 HKSwj8SQft6UD9TjPX3O2d393OAtva6GPSuI0Sa4Oc+zPstq/t8FrJX5GBdB0c1UXH7ova0oqTN
 HElX6+eUw3rxPt5xlgG+YFvQQp06gnrycPf1WDfWKLzqUvJetmLMYxUYEXfuvFH9gB1i8nTjNDZ
 WUyMW/aBrmNwr2s3toGQ+bsQeF1hX1w0xYYG4cNwhFGC3Ob4uvvPQM/qAse0NFjxrEQ==
X-Google-Smtp-Source: AGHT+IGSiJ0cJsM0+QkIjYTOvMW3PPxd74LrG+PyQSmnXQ1wow4hy7WMH7D3pl2v9plOVEqf1jvdHg==
X-Received: by 2002:a17:90b:3b8d:b0:332:5349:279 with SMTP id
 98e67ed59e1d1-33b51148b30mr30740786a91.3.1760388735130; 
 Mon, 13 Oct 2025 13:52:15 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:cc82:37a1:ecfc:e51c])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b61acc413sm13445147a91.20.2025.10.13.13.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 13:52:14 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: victor.liu@nxp.com
Cc: marex@denx.de, stefan@agner.ch, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 shawnguo@kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH RESEND v4 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif
 fallback
Date: Mon, 13 Oct 2025 17:51:53 -0300
Message-Id: <20251013205155.1187947-1-festevam@gmail.com>
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

imx6sx.dtsi has the following lcdif entries:

compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";

This causes the following dt-schema warning:

['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long

To keep DT compatibility, document 'fsl,imx28-lcdif' as a possible
'fsl,imx6sx-lcdif' fallback.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
Hi Liu Ying,

Could you please help apply patches 1 and 2 to drm-misc?

I got several Reviewed-by/Acked-by tags on this series, but the patches were
not applied during several kernel cycles.

Thanks

 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 2dd0411ec651..ce31b873fb95 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -19,7 +19,6 @@ properties:
       - enum:
           - fsl,imx23-lcdif
           - fsl,imx28-lcdif
-          - fsl,imx6sx-lcdif
           - fsl,imx8mp-lcdif
           - fsl,imx93-lcdif
       - items:
@@ -32,6 +31,10 @@ properties:
               - fsl,imx8mn-lcdif
               - fsl,imx8mq-lcdif
           - const: fsl,imx6sx-lcdif
+      - items:
+          - enum:
+              - fsl,imx6sx-lcdif
+          - const: fsl,imx28-lcdif
 
   reg:
     maxItems: 1
@@ -199,7 +202,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     display-controller@2220000 {
-        compatible = "fsl,imx6sx-lcdif";
+        compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
         reg = <0x02220000 0x4000>;
         interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&clks IMX6SX_CLK_LCDIF1_PIX>,
-- 
2.34.1

