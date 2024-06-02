Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 381A38D752A
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2024 14:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A251D10E0D0;
	Sun,  2 Jun 2024 12:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ucok3w21";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F3E10E052
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2024 12:04:50 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-52965199234so3816646e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2024 05:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717329888; x=1717934688; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BGWVh/Zr3LGFqNC/PDJ+t+m+rq2p7BOWG0ebyvpQons=;
 b=ucok3w21h+i8MwX8/D4orfYGJQumNDWtKP/e9Rg8okgf/1Ie8NGfpF7lHb5HYdsNX0
 AAZkwOn5AflzVfFxPAG3oSq73ttrJSyIYBdWgHRKeCUVqexTmLPIJq3Vz5CeyCMiIuIH
 q/nAyfoJpB+lxRLd+jfkiTA7YGEo5vgkpS7gv7gBak22tEtvROiVtUS92cMIt0HW40lJ
 BEN39z6pM4KdBNVufuk7PfgA+uhyMoUSh6Ybo5AyV+w1CDrd7Vw8LYcMijlHdDoL3y2T
 lqzYQdHaCLirehcaSPdUEpB/TbwHmObeoG1Fm5mZEXOmOC8UlWmdsXgcrriTWlumRcUP
 931Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717329888; x=1717934688;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BGWVh/Zr3LGFqNC/PDJ+t+m+rq2p7BOWG0ebyvpQons=;
 b=LidkH2CwCzcgIvyw4aJS/g2X9ltYTVEdB+bIxMlDAahRqsPNOz58m6QVGG7PLrwL7H
 Y0Br/Cm+KmwS9BoLev8Sve228HVs56vlv7ZSWiNSgVulJM0KVhUDINoAdEg/RKSiXSQ5
 MO8hK7qmwW/0Rg7NmM1IcVskq86oNSNwrOl/hwAeE1o5MwQUCN7/IYXDz6SMOkXcsfCU
 7aVJh7i8BBLhtgeRsK75Ayb8QBPnMn1nyq6fIguDcVtf9XMEMKsqt4h5UT10QRBfOW/V
 SBGHlgazP8bRqihg+QrVl+hcADgWt1K9fAGR9SB/f6jweye/78U+PlSVimue7mBdZw/X
 6ulA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBENfbvBST0wYS79J3yxY+9jaSD6zR1b++dqkZtORu2SG8GS3dVrbj2WxDBMLPPYcgtSaELkZnqVjqcjDqpIZWuhyR5LXV/MK4TZb50esz
X-Gm-Message-State: AOJu0Yw9kezIIPu1W1d6H/wiD72I3LD3AQKrEvHMYb4vAIwWu4TKOU1r
 0loRoru4frgXmMb9M8F/1JRH0yOcB7WyjlcjCS/oxEMd5MMuoAcTBBycm9rcNbY=
X-Google-Smtp-Source: AGHT+IFioojHdR8Li3FtAUmWNxJNZSvKgoMY/dETwt1uCPkRs8JMSzzF/VAu/d9Aejv8BYFZwW5OPw==
X-Received: by 2002:ac2:4e94:0:b0:52b:7f00:5695 with SMTP id
 2adb3069b0e04-52b896d26a1mr3567965e87.59.1717329888558; 
 Sun, 02 Jun 2024 05:04:48 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b8b56867fsm759398e87.44.2024.06.02.05.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 05:04:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Jun 2024 15:04:42 +0300
Subject: [PATCH v3 02/12] dt-bindings: display: imx/ldb: drop ddc-i2c-bus
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240602-drm-imx-cleanup-v3-2-e549e2a43100@linaro.org>
References: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
In-Reply-To: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3Nz5IHmPVWRwHFsw4a2c0uKZtmM9s7xJPi4nSL2SZJE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXF/cS9DynlRGL/q+FhwSBFBcGFVl4UCT9geOY
 UOhOg3+BfuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlxf3AAKCRCLPIo+Aiko
 1dStB/9ur7o0ZT1BGSJZP85LBwNFyha0XzFbawRG0NkoKwEt/qs9Ss23XuP64+H0Cgyv/lVZjih
 EIYQvrftDLxdSueWB7OoHv+r853IRqJFX5s/L3FwrhUoWR4NxzSmt+dwf5i/uyMTsq00ulQE5cn
 bZEqh0UlBGShgZQEb8KmODQEGST0F5Y1hIct+TfuXs13DQYdkp02ie1uKCpXSeBRPqWG27zz+K4
 +1/03y1P7Nh61Dh/a0EX9L9v4YVhfWy/URMe2TNrE2Lt9GPP9AZjKCGZc6sPeAnsig6dVr6e1bd
 LvZnaiOQHvUe+FMP8pELJ2COAaNjL9n+YQrHqNflOdiRBK+b
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The in-kernel DT files do not use ddc-i2c-bus property with the iMX LVDS
Display Bridge. If in future a need arises to support such usecase, the
panel-simple should be used, which is able to handle the DDC bus.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/imx/ldb.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/imx/ldb.txt b/Documentation/devicetree/bindings/display/imx/ldb.txt
index 8e6e7d797943..03653a291b54 100644
--- a/Documentation/devicetree/bindings/display/imx/ldb.txt
+++ b/Documentation/devicetree/bindings/display/imx/ldb.txt
@@ -62,7 +62,6 @@ Required properties:
    display-timings are used instead.
 
 Optional properties (required if display-timings are used):
- - ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
  - display-timings : A node that describes the display timings as defined in
    Documentation/devicetree/bindings/display/panel/display-timing.txt.
  - fsl,data-mapping : should be "spwg" or "jeida"

-- 
2.39.2

