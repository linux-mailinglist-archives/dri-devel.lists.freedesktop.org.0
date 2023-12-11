Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A9B80DBD3
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 21:41:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CA410E4EF;
	Mon, 11 Dec 2023 20:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B557E10E4EC
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 20:41:52 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1d03f90b0cbso8925875ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 12:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702327312; x=1702932112; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4SLdiRyhExEvPi1cg8KDejtcX5uLXmVUyVp5Vl4jGMo=;
 b=PI7inl+N+FfE+Bo6ygFh4q3IqomS78rRwP0+lDKS6aRIxoR16wvg7uweB7r1talGWa
 lKXbltJuz9gvsvXZfBUdTotyXGOMVnhBNWIQ6j7OypasM4igZXVlFp7nBE5ss5ee4UT4
 fdsQQxr7ICJfZ9LpDwm5/lUNu8QAGiSquB+HnnJRkSX6eyBpM3SnpE/5F6BhelgYrws9
 oTcpRNXGvepDhr5y7xSwrJW/CmO9YsbAVhd01dnwvEU2hVW1ZyxgqBWL+xBcy1WWyQyt
 TpXPmeSILihi1q7tZXG4tHNCZKUe6MP0X6evKP931GNi6XvsWurh+kTKeJwGlNJePhlG
 Lqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702327312; x=1702932112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4SLdiRyhExEvPi1cg8KDejtcX5uLXmVUyVp5Vl4jGMo=;
 b=WaBN4HsUcuibZ9/DVDhapW7G3NOSvaJLrmMe7zsZnA8X6VX9cYXvtx0b540/GU7R78
 HZpxKaNZexRL/3CjsOnDJzTS4RjSeLfifJ7WWf7ytSYdBoUS5IaP3JELMLwlRALaOOWn
 ITG2tTyilGOVByBa2uhUzdEJ+2Zd5Qs5Azx2LHuPVLxo57XrzLIK6UaXpaPcok6vDX4r
 G2q46FP0rm4jsaeNbaa7KoQhCg6SLHem22m9qALXx/mNN4ZFw0HXhqY9pegTME1nChA3
 jYmrFIfTNWhWUVCojq+fCEVgf9fKu0sCxgxVLgQChCNjjkFxHmbwevvdZCn8PNsq91bH
 U8eQ==
X-Gm-Message-State: AOJu0YwJ2gtDDZRMUqqixikva3AlZemWIpCwUH5yYv9jhh75LURAkAQx
 OGXz8Sp6EEjVf2uh8XrNtSA=
X-Google-Smtp-Source: AGHT+IF6I60HrE6MGdchekzFDVSoSd7q2xByXKq950PLJ1Ac62OYbce8O8VpSxDxHwlchyeldQp4PQ==
X-Received: by 2002:a17:902:d4c3:b0:1d0:45b2:d8b0 with SMTP id
 o3-20020a170902d4c300b001d045b2d8b0mr9145535plg.5.1702327312115; 
 Mon, 11 Dec 2023 12:41:52 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:1d51:eaf7:9aaa:d7c])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a1709027b8e00b001cfc4d8ede5sm7124809pll.301.2023.12.11.12.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 12:41:51 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: marex@denx.de
Subject: [PATCH 3/3] arm64: dts: imx8mq: Exclude "fsl,imx6sx-lcdif"
Date: Mon, 11 Dec 2023 17:41:38 -0300
Message-Id: <20231211204138.553141-3-festevam@gmail.com>
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

i.MX8MQ does not have an LCDIF power domain, so pass only
"fsl,imx8mq-lcdif" as compatible string to fix the following
dt-schema warning:

imx8mq-evk.dtb: lcd-controller@30320000: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index c6dc3ba0d43b..5d8365e4eb26 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -739,7 +739,7 @@ sdma2: dma-controller@302c0000 {
 			};
 
 			lcdif: lcd-controller@30320000 {
-				compatible = "fsl,imx8mq-lcdif", "fsl,imx6sx-lcdif";
+				compatible = "fsl,imx8mq-lcdif";
 				reg = <0x30320000 0x10000>;
 				interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_LCDIF_PIXEL>,
-- 
2.34.1

