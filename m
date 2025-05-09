Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BE0AB0E05
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 10:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C2510E9DC;
	Fri,  9 May 2025 08:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uHfvOhtk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139AE10E9DB
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 08:59:50 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3a0b933f214so739281f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 01:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746781188; x=1747385988; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ASnQFcWLigUiMmzLp6e/Ns1g9XB4PFwbLTaJMqYMfMM=;
 b=uHfvOhtkErv5X0tqiyrQj4TvWlfdQDNwVa7Eihz6A9aM8HGVy26AC/nLJkQI54eBIK
 iUbXOsL5ZANfUyxGIpVGS5B/GrSZlHXkjtA/vZQP8Ykxs7lJiG2DstNjdMS6JeAfMxsM
 M+sBXIWr+8ri5EfVaOTQwLJsme+k+Pa3LnFYMYzIEsGYJ1o6KdVLRBgk9nEGKb5Gz4ak
 Ow765g9p0SljGTVGG+Pi6u2Zi6R7QfprY2jKoUZCmMT/2h7SWNS9AXyQbjOOQP8S+K7C
 JkAP8Jpub/CpXlDi7oKz8g1B6Jy/U8xyPwZrD2dsPEAeuPPQxPwtP9lyHZqfALcjhmcj
 pFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746781188; x=1747385988;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ASnQFcWLigUiMmzLp6e/Ns1g9XB4PFwbLTaJMqYMfMM=;
 b=gzChOTlJRvVXDWne20VSHMQ/lNwiQZx5iVWcmezqgFEpnOudZdCWARByy/kSHfMch3
 jfCZXM6schTGTOAOiK11I89VsDvsl0hZWCd07/mjQrUoInGkTisjZyV0W5bYiqeivk/Z
 qTtH6d8O9jR7PcbKF+usNCtcbrhmeo609dMjNQciENHFgRiPARwFAAQIlfyWX4YgqKdD
 1HeBzZZ8+BzkjVkFCTUwysbTen8cP8eErvVl73BMleDLfuUUaz6ILP6q5v0HQkZl+RFj
 GwihuAy/66Lqfn9lHbK9TEMQjO4MZch7LMjGAGMvucD0uP6P2GnGDOPA8V/ZTUzSU1Wy
 Ch5g==
X-Gm-Message-State: AOJu0YzcLcZxeeeUw4NWhlu/lmIOyQZtLflko96PeBpYWQF7TAsq/+Ia
 fdU8QMagwtxh5sOi5y1yntR/O/EWS5Wf0Nz42SiiMlJrE6Ohi2U76GMmDxnNUZkFMct0/ucu3bh
 M
X-Gm-Gg: ASbGncuk6Z7E2VAi2R6kXBNpq4LRITfHFBEvn61vY4R5PBecTVn/yzHP5wvNBYyTuas
 lHjpOhkiMYE9gxqF3rGFWbAj4VFhRoVts4yrDVkx/iGFgUF7aMN4vv74cA07uGGOCGFhtuc06LZ
 BeIF+Kdl8ZjciWHjHrbhtSBTaP5pDLxiMEt9EtHIQD42oTrrao00RKImlciYy9YrfGtcfrQK3ZC
 +JBniJAxn70oT4cXLDeEDDDrak7n2Lf1UDPs4bM1bh8MjQ5ctfs62l5pMbHhViV/dOGi0x7KSYo
 cQqNCz++12Ob/GIl0RtDd3++19E5pPB+SJ+WSMEud5N0cnysPvZ4xBxfbQ2x4Q==
X-Google-Smtp-Source: AGHT+IFx+LSi2P1gg9frBl/nSRpkctm4QwBWfWv5N/4i2O+LQgr/nmgIxLSi06bFssUOA42kmzpd6A==
X-Received: by 2002:a05:6000:2485:b0:3a0:af63:c35d with SMTP id
 ffacd0b85a97d-3a1f64374ecmr1989939f8f.19.1746781188481; 
 Fri, 09 May 2025 01:59:48 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442d67df639sm22369115e9.13.2025.05.09.01.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 01:59:48 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 09 May 2025 10:59:42 +0200
Subject: [PATCH v2 4/6] drm/panel: visionox-rm69299: switch to
 devm_regulator_bulk_get_const()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-topic-misc-shift6-panel-v2-4-c2c2d52abd51@linaro.org>
References: <20250509-topic-misc-shift6-panel-v2-0-c2c2d52abd51@linaro.org>
In-Reply-To: <20250509-topic-misc-shift6-panel-v2-0-c2c2d52abd51@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2466;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=wFSO+bW0reZeJiU75auO+mE0Vw0w+a9HRouNJGN1GmI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoHcP+ZjUj+MNthAC93tQv3yVpyEM9usXDnu07Lj43
 mCpk3guJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaB3D/gAKCRB33NvayMhJ0SYTD/
 9VRHzPDa8DYPUdooooCuzwmLoXMZnZugd889qT8G8CNT/ZozZGTaiHrOJpsKSK+EknLoqyZJT5aOUS
 AqWLY6WHZAGqJbOJLRqb8FkkZh1OQl869dnu4BkwAXwc53gHCC5pTmGD/DaOBYERoN1BMUTd50biBX
 CkdgdQJKrsvt7K3QdW+5VbrxgzjM8aIrrf7DmpPnVgKQNAh5ZlW4OG+YnpTrsF9nr6M7doqweQ8nYa
 8NxOTKZjZVnFbtc3feajhdNygqgDFPgNPWE5NSFWXY0qrgUKOXsjD/cS8tcA1f1sOkVKkmYrOPz/4b
 WsVA+zPgI66uPgYmJ+0mO82IfeaitLKGolj8qwKoX7p+bJCY3d5rpMj0XbhfG834BHWNAEShJgLGnO
 UW06Uh9IfoqcG33stlgxBhQAupWS79snZWJ8KLHwyhPi7IqgkDae15J11/bmo00aOo7SvTs2W1R5XV
 B5qcTqFwgYsTvNrXsjl6LAG9MZBcTCcbvSc4ih+7M+yL1nHwhArjcT5KvZIRnMyGch+Edj+WzmKmqk
 cVmCodLXMqBdghsH3f4N00AN4qKv8Hk6P90LY5XnHbDA22FX/MdFKFcSHZKcup+yEU9ut9HARqWyt9
 BW/CP3DfhEtcqfG7CoWtpnnfOViR+TEgbPc/yzy67uNCK9D+nYL6OlqrW/+w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Switch to devm_regulator_bulk_get_const() to move the supply
data to const.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/panel-visionox-rm69299.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
index c3c14150a5546512151fb15c8e9a91269ca21c65..fe921d5fb1942c47c5b849e827c244d7fbde25a3 100644
--- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
+++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
@@ -24,12 +24,17 @@ struct visionox_rm69299_panel_desc {
 
 struct visionox_rm69299 {
 	struct drm_panel panel;
-	struct regulator_bulk_data supplies[2];
+	struct regulator_bulk_data *supplies;
 	struct gpio_desc *reset_gpio;
 	struct mipi_dsi_device *dsi;
 	const struct visionox_rm69299_panel_desc *desc;
 };
 
+static const struct regulator_bulk_data visionox_rm69299_supplies[] = {
+	{ .supply = "vdda", .init_load_uA = 32000 },
+	{ .supply = "vdd3p3", .init_load_uA = 13200 },
+};
+
 static const u8 visionox_rm69299_1080x2248_60hz_init_seq[][2] = {
 	{ 0xfe, 0x00 }, { 0xc2, 0x08 }, { 0x35, 0x00 }, { 0x51, 0xff },
 };
@@ -43,7 +48,8 @@ static int visionox_rm69299_power_on(struct visionox_rm69299 *ctx)
 {
 	int ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	ret = regulator_bulk_enable(ARRAY_SIZE(visionox_rm69299_supplies),
+				    ctx->supplies);
 	if (ret < 0)
 		return ret;
 
@@ -66,7 +72,8 @@ static int visionox_rm69299_power_off(struct visionox_rm69299 *ctx)
 {
 	gpiod_set_value(ctx->reset_gpio, 0);
 
-	return regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	return regulator_bulk_disable(ARRAY_SIZE(visionox_rm69299_supplies),
+				      ctx->supplies);
 }
 
 static int visionox_rm69299_unprepare(struct drm_panel *panel)
@@ -172,12 +179,8 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
 
 	ctx->dsi = dsi;
 
-	ctx->supplies[0].supply = "vdda";
-	ctx->supplies[0].init_load_uA = 32000;
-	ctx->supplies[1].supply = "vdd3p3";
-	ctx->supplies[1].init_load_uA = 13200;
-
-	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	ret = devm_regulator_bulk_get_const(dev, ARRAY_SIZE(visionox_rm69299_supplies),
+					    visionox_rm69299_supplies, &ctx->supplies);
 	if (ret < 0)
 		return ret;
 

-- 
2.34.1

