Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1548D7529
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2024 14:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E0910E079;
	Sun,  2 Jun 2024 12:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sPHFtIlE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FC710E052
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2024 12:04:49 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2e73359b900so41023011fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2024 05:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717329888; x=1717934688; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pQWdjTwgnIdZS6takOhMDQQy8XjSBnwUC2ksC3WzZco=;
 b=sPHFtIlEapCZY4bL9hgnANGjRnmRbl/CJsHqg3+nYAP3AE2LgPl8/FD/bSK3Z2ylHm
 r82UcGYiV4fqmXKFFj0rbtEI40NC4TPlHqOAc8FIk6TcGkh41uHaXdqDTa1q2aueXCcG
 DfS2HciKdw1yQvFtw7/UeYw87liIqpbsdjPyGcvFI63ZQWvgGXYPWZDbtpkB1ccaC8zQ
 3Dg0qUhO2fuu2F3o1vixM4kyP8FXRtIuA+tbcjf9aIfEyUslnFFTZ5gE3eGc0BtoS1Iq
 Z42C73/0MdbLQ3+3qUMiQBq4mEPUE5ZRbNrvBS7cmndX1s3Y+GAAFgE7x8rzNIbJswEC
 d+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717329888; x=1717934688;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pQWdjTwgnIdZS6takOhMDQQy8XjSBnwUC2ksC3WzZco=;
 b=adzkxABZU8hdXeXpCBVxHW35Uq1OmovZfhUG7sSJA/0HX/ovy8xZbrsDOZ2PALkIXP
 IYFPbWt0onkvCL6PWHcuP4AKT013J6Q8MegvpUR2cggmlIkYF2ter+8kACfcKQKZ8k//
 bzWltUt+o07rFmwRiHU6cB0q9/cn0fOrFZ6y/kFZxNRyRkRInht6XDZ6EvHvIz7pUiOx
 BaGIpQXnEDGiiQA5b1EFyQX+3/SnLJPaQCfnMtYPKVbKhdaThuVdFMdlFLJC7ysgnri0
 /xoYoDo9+OPvl3ezOwYcjGtHD1vbT+kB6FEdcrruzpebs8gR95MtNjfzh6Xw93ExGD5t
 GK7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWd78SoWPhFgc0bceR8ZxvH1jvrdaMEIkxvdO7AUkFxFpaWtrChSVKweT3CqwfLk2WsbjgrhqHKpy/b/r1ZDDl6R94AcwxL5Uqfavt56Ow7
X-Gm-Message-State: AOJu0Yzocj5yNqOo/8SUcmr5PVZdOYK1BbBQWehIGUKURMc/7SAXI6dA
 2TSrXhEakBxoH1COVZH5ushJRFxw40UTSoWxI7KbCIxknr9vuqcNWrrQBynE+H8=
X-Google-Smtp-Source: AGHT+IGfozs4AwvcZe4Ex5alE8/DWJLLE0peGqkDlWeKv2/RBkKRrvdguJMijbWU1spsIZJp4mhVRw==
X-Received: by 2002:ac2:4c86:0:b0:51f:696b:949a with SMTP id
 2adb3069b0e04-52b896c7ae7mr4279067e87.48.1717329887841; 
 Sun, 02 Jun 2024 05:04:47 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b8b56867fsm759398e87.44.2024.06.02.05.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 05:04:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Jun 2024 15:04:41 +0300
Subject: [PATCH v3 01/12] dt-bindings: display: fsl-imx-drm: drop edid
 property support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240602-drm-imx-cleanup-v3-1-e549e2a43100@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=SFNXn1zh/yUH5lKBoXzlQkp+p1CQ7cqY5rYlPQmKP7Y=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1pM/J2vZz5Isk1dyi0v4TtXuFzuvoLEo4zOkvkbo396q
 dcI1ed2MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiU1XZ/8rn3ldQjYy/vUz1
 1W3lC1Uxdfwmr+15haMreA5z6us5d1/sl+cV/7F9nXztqmde39LbHA92W/Qtj45XWC+yqWq6cnm
 o6kz7LPszV7Zs+CexOdpE66wmb/XGx3kHI74KN8i9mXT1Q6KBwjwe7WePr7ulZ175o9++4pSA4/
 XeGol1K6oq/Ccu+y+iqv//ntisVcpnG3LXJdpO+K5p6WibssF/v/r5d5xJhofe5laHLpvEbSs9/
 cjR8tJ/P3kn64tv2c/IOPeMt+ExH+ZZneyquzqenwhae2POpquM56XPVp5n5eP+nqMczKm1UIFd
 ebftxBcS/UqXLzhWyVYne6S/jPXIdGhpeWhuFu1v9O8BAA==
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

None of the in-kernel DT files ever used edid override with the
fsl-imx-drm driver. In case the EDID needs to be specified manually, DRM
core allows one to either override it via the debugfs or to load it via
request_firmware by using DRM_LOAD_EDID_FIRMWARE. In all other cases
EDID and/or modes are to be provided as a part of the panel driver.

Drop the edid property from the fsl-imx-drm bindings.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt b/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
index 3c35338a2867..269b1ae2fca9 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
+++ b/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
@@ -119,7 +119,6 @@ Optional properties:
 - interface-pix-fmt: How this display is connected to the
   display interface. Currently supported types: "rgb24", "rgb565", "bgr666"
   and "lvds666".
-- edid: verbatim EDID data block describing attached display.
 - ddc: phandle describing the i2c bus handling the display data
   channel
 - port@[0-1]: Port nodes with endpoint definitions as defined in
@@ -131,7 +130,6 @@ example:
 
 disp0 {
 	compatible = "fsl,imx-parallel-display";
-	edid = [edid-data];
 	interface-pix-fmt = "rgb24";
 
 	port@0 {

-- 
2.39.2

