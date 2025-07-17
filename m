Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2954FB094B7
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 21:16:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3471110E88C;
	Thu, 17 Jul 2025 19:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YPwUpxfp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8C610E88B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 19:16:45 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3b49ffbb31bso826047f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 12:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752779804; x=1753384604; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VuCA5OMqgALuEAxLsCpNRECi3es/sBRCGgKqyk3kQIw=;
 b=YPwUpxfprI01M4y1dGOOw5tMUO3ZLIzMDTw6sKn8+mKIdlSrKk+a321leMJmVf1MVi
 WpJI9Hrb8p75nh6z0qmajkP9/8EatZGb54NDfEIYkWjO22EQl1OFAqSWThZkrqKk5xEb
 C7cVqR/S9/ltRnt6jklPUnwkbwJQ9aziO39ZuFfa8aVKnnc64iL+W9jGCWA8rtPr61sb
 z+rnVyXsO21UuD2hjxMB8uKl+v+04DliiQHIk8uXqZqwIdSc1lc1rIaDVDoPa3ZQe0B0
 N+xZy/KOQM9V1V5uTGYFzdBtlCRT0ZEKzOXYOazIlN7UPyTBinGEzdrA+/Yl7Ab6CFAJ
 tZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752779804; x=1753384604;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VuCA5OMqgALuEAxLsCpNRECi3es/sBRCGgKqyk3kQIw=;
 b=qq5xca+I+BMKv059wiiBi9ozVUJpwuV1zpfNw2LxqPo9ReGGgglvHhTy9S1YKy+Jp+
 K98pMBGV9z67ynjaKpAa0RzIX1aPT0UPVvjhsiwyGlBP7D1jm/aBXl+FR86JlKJ0zPe0
 wTLPdEkQ7fiP410VjaoHhH9nUFkMTY4rxVEDSmSFjJMDombKqOQLRMghbKLE1wPlsvKT
 yxNtxEr7M8PEC38B3IUnJQ9BLOoZAn/ZKECJngK5zytpKDEwGMCcBummLrvPYy9KAba7
 v54uXEoUtNW2343zfsaUjrrvuAXc8Ehiegj459yGhGzaWTTtelVr5LMyGVGbsVQ71u+O
 bRng==
X-Gm-Message-State: AOJu0YwmAynWb9RSVeQy0AyAtG2CIFUJt2fQd13P6aerS0u7YyM96Npm
 6speGo7IzEeRl09OJlWu8csvUPnikdt8C4NZlN2L/CvMu1nzhVxj1coz
X-Gm-Gg: ASbGncsJjUYqrBm7AFCF7mOf5qcB57Iahs1d5JXKHBdeBPo7oFWt1OuPrWxI2yPon8i
 ItbfLmh3A3YEVoEATjVEGHLMaHvbzVXsUEqkgBRpFHrbTZGbwlZG30s0sb70S7LM+JFrpPcD3Hr
 qoOgbfv1jLaPvdQYDgNmlOiiYo5VOTF7NOXwZUaki9zuzUyQ/xxuw/eF9tevulaUThVApmk9FL1
 0v57o2qr3/GfwXy1Przw8+UFZEp6IdtP8wP5Y3ZGpcP6o07ZoR/c5HX6jCA3h6geL9mpElntaKj
 2dqC+1PVnthdFl1Su3hXK6kCaoAYlaXfrlMN4T/8j3dcvgldBkg+8sPYJ4g8NL7uc0LkxD5uVAo
 rqaMN70FJJV67b9ssLbu0sMVPKlkMlv5V
X-Google-Smtp-Source: AGHT+IGnGahGt2U5htIhFXVjft18mH3zp4ADziGMeoajJetWxt5b3F2yGd4T5BahFpHifeth3xCKfw==
X-Received: by 2002:a05:6000:642:b0:3b6:1630:9204 with SMTP id
 ffacd0b85a97d-3b616309230mr2341095f8f.19.1752779804161; 
 Thu, 17 Jul 2025 12:16:44 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b5e8e14d07sm21680436f8f.66.2025.07.17.12.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 12:16:43 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Thu, 17 Jul 2025 21:15:33 +0200
Subject: [PATCH 2/4] drm/sti: make use of drm_of_component_probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-sti-rework-v1-2-46d516fb1ebb@gmail.com>
References: <20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com>
In-Reply-To: <20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com>
To: Alain Volmat <alain.volmat@foss.st.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1640; i=rgallaispou@gmail.com; 
 h=from:subject:message-id;
 bh=Ay3UjBLijGxD3y8KzxOLm+Clcmu+dKkj0LPDEulYkuo=; 
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBoeUwYtZuxKSsScyK2pzLf8SqC21JbxA2n0N390
 OV4UO/qtsmJAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaHlMGAAKCRDnIYpo1BLC
 tSl+D/45xwrv2JRM2TfersBnFNba4wWf/30fpVnO86yL3QTGzpnTmJ+8TEqSd7aeAnTVhtUmFfq
 YwnwcYjn8wII3X/ehq4g54mVqxtGDNgpAK0+D/vPKmY8PbATXjbnuU0VB25VRDho/Yq8r4fV+Cw
 sA2IbkZzfQMKdU3Jy8VuxXymjWmmD9DztwVI+c9C1j8Rhyu6M1BDmxTxRXNRih5NtJILNYNN302
 82ltvcFZYAbtg1l/sirhPFyqXwCZG02w8gDGifjjehLKOFAVTGr/weWs5fIeQ7sUvJiVnAm+JCW
 DsnOv18XbPzwQKQU4imRG4BNE6EnzPb1CeWGuSQYTHYpE/iUGjFQxO4WbkW07iKDft6usDu4buY
 HPTGrVuuiCjCcinCeMIVbMkuOD671Dy7R69FrO2Mvkiycqmp/2rPlxhD4G1eUOriS8qg81Lkg6B
 4a8eYX9dH5kv5boL6CbyzVIfPBQ2hHIIjXczmSqAIWSTB/x1zqRXlNqpmbQLLIrC4+BSf/8uyW5
 jq3X63ev8G8kFPfRAwzGH4KbP+DoLZtbfCPyVb1b9Dftf2GMmJSrKtxPcojKwiwGYVYimCx4mAX
 4Rpc11seryt3l+RF/kWJBHZ7DNGJBwKktL7a7GcKf1YDaOOZVqwAC2PBM6xPtELSvErm624w2bW
 tkLZ1e5Ec7B4GGg==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
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

Enhance the probing sequence by using the ports property of the
display-subsystem node.

That done, it becomes possible to handle the display-substem node
outside of the soc node within the device-tree and not have each IP
blocks as children of the display-subsystem node.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/gpu/drm/sti/sti_drv.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index 42f21ab91957b38cb9aef012b6ee7f4ae1683edf..9d6a7c8fa0759c0b6fedf87169b18cff3684be46 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -231,9 +231,6 @@ static const struct component_master_ops sti_ops = {
 static int sti_platform_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *node = dev->of_node;
-	struct device_node *child_np;
-	struct component_match *match = NULL;
 	int ret;
 
 	ret = dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
@@ -242,15 +239,7 @@ static int sti_platform_probe(struct platform_device *pdev)
 
 	devm_of_platform_populate(dev);
 
-	child_np = of_get_next_available_child(node, NULL);
-
-	while (child_np) {
-		drm_of_component_match_add(dev, &match, component_compare_of,
-					   child_np);
-		child_np = of_get_next_available_child(node, child_np);
-	}
-
-	return component_master_add_with_match(dev, &sti_ops, match);
+	return drm_of_component_probe(dev, component_compare_of, &sti_ops);
 }
 
 static void sti_platform_remove(struct platform_device *pdev)

-- 
2.50.1

