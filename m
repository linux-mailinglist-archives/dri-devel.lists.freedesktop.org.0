Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A640C8935CA
	for <lists+dri-devel@lfdr.de>; Sun, 31 Mar 2024 22:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA3B10E9F8;
	Sun, 31 Mar 2024 20:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ARYvV0yW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C82D10E9EA
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 20:29:09 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-515c3eeea5dso3907963e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 13:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711916947; x=1712521747; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BGWVh/Zr3LGFqNC/PDJ+t+m+rq2p7BOWG0ebyvpQons=;
 b=ARYvV0yW8dd2q7tA9dvNMaIozbGMrPes3sgXPPcAh5QrdUCwS7xhXjr7DSm65+l+4d
 aiLipYMix/V9zJmeg+ALnJJSozyD1ZE72curUg5RNR5Mz6FPweraZCOtfLzXelDqkTBa
 uOL8FB5zdjsC9hgTY51Oq4E1is1I1nFqU4CS1mUDeiI/8goq6LS36vQc88+P38jNa0B/
 PRlMnT04h1lxbQcxH3rHTGtYzgNVEW7qxyyRiWQ/3Rte+BZv578IWeFijyeGWdqtuHRj
 L50+iOpax1OrWeVsQYbJqgCoJUVZXo1IwOuJWd8yXxb8SxHUoATvxKrluuoB/iBpalEN
 D/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711916947; x=1712521747;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BGWVh/Zr3LGFqNC/PDJ+t+m+rq2p7BOWG0ebyvpQons=;
 b=dOonBxswDKP5YIxdFbNHg0ESaUJNFgH77dEM4/jfYAJKKdFahz3ILJGPM0Nmok5Ck3
 WjlDOwgaGr+AoflMBSF4R85lnK/i0KWLlZgCMlUzyws4ADWcaGR/ySD/5C34/QexKBoZ
 D3dBd7IDgGZDMSBMMptywruH7pmHeJJ+rJS9zDLbYLPG5ca0PaQIlPbewZYfsPxb0xnD
 bow6cQEJGSVjbqJ+4ay/DGe/7H8gFwrk9E53FB0h452Nm1Po/+p9Rhg53XlYsbW0/rdz
 gCbvtrtnDDOFg0IRldLDrFHxmFXcx+ucP7eVy68Fu9eWagcgUVWhcL4LgoyNWsMGyYqG
 IsYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhoxakaSGbcnQovxqTGkapxcHuoVRSMiCc35u2McYhUgkzBxildafZujae9lYOiD2/rb9IDga8uB6o+/sjxPlNFFc0XkgvLsx1uHbc8NWv
X-Gm-Message-State: AOJu0Yz8gzz9T4gXII9+9wiVNFLLq4exxWL+quENlTOBc4biaK0vt1tV
 WXpzU3zMdUKJptB3krdJXMvdhlf2Be1CneNmfSbx4BdlekogkIOaZBXEZzuyAjUef97PsJXv2xO
 E
X-Google-Smtp-Source: AGHT+IErgrRoQvxgZumBivM+Pb0YMQVGa5TcuZqM+SRcVE2qbrjJzJG0RqIIHvoWbmgR8bTP+gcaJw==
X-Received: by 2002:ac2:5e62:0:b0:513:fad:3a79 with SMTP id
 a2-20020ac25e62000000b005130fad3a79mr4662754lfr.41.1711916947600; 
 Sun, 31 Mar 2024 13:29:07 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 y25-20020a197519000000b00513cfc2a7aesm1237276lfe.71.2024.03.31.13.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Mar 2024 13:29:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Mar 2024 23:28:59 +0300
Subject: [PATCH v2 02/12] dt-bindings: display: imx/ldb: drop ddc-i2c-bus
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-drm-imx-cleanup-v2-2-d81c1d1c1026@linaro.org>
References: <20240331-drm-imx-cleanup-v2-0-d81c1d1c1026@linaro.org>
In-Reply-To: <20240331-drm-imx-cleanup-v2-0-d81c1d1c1026@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCceOQEdxUBjYVGcqNd2OmrDFYajZlrsDacoPO
 CuZPZV1962JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgnHjgAKCRCLPIo+Aiko
 1SgTB/9h3CyJDldBv5uM4m088XmQ8/63HBIR0KmKsg2ApUeLlsUQVFPWv6HCxXEHhmoroNSzibq
 6tblygXjqEY7bhNq3EvQb67kyg6LhARbVAc+3d/idawgHzRewcnAuylIV6WFd8nDUT8AMmhhYac
 El3My4G/fyldP7NqLXkTfQHs4HtfNnEjwjCXCeAxxccIsz+T7kMKndy1i8BUrqTk5kA/wG54jbR
 k5JMTXaOx6tshdQ0kirRA4BAkOgtir/k2M+Rs9/FPAI03mg9xiib6Mdhgee1nnns4riNinorjxl
 A03KUxKfJAma3OVCmDJoQmR7FaMLMBIwgFi9quEUEv5eKIYY
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

