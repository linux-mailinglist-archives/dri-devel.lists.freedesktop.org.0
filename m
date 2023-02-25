Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D52EF6A2AA0
	for <lists+dri-devel@lfdr.de>; Sat, 25 Feb 2023 17:03:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A0610E1D6;
	Sat, 25 Feb 2023 16:03:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28B610E16C
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Feb 2023 16:03:02 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso886985wmb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Feb 2023 08:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B/2HES7YJYG6wdjYxPV+3ewSssuf+BgawA5HJPMTCWY=;
 b=Bd9lZESTgYO9OWlWOtNgDM/TuKjeeH2cyc2TzDdOWHZLPyVyfUwJ+c3MhlDO02y0e0
 KN10IsntPQuRIYRoPXGIj8eJFOLC/VY0h4TjpspWoz/gl9faN+orqft6idcWGQtQoLsU
 QSwd5a5fk7P6p8AvN9r+veMXUeC+XHA/za/epqDZpy2zqm2AKDQqetZE1GKdx+s0SOq8
 pyXW6ywBmfaYj911hI/i1N0HGU49LkU6/1tsXHhWbTFs4LXCeCTOfJIP25n28cl/H77V
 VVhpSn8K5YbaM66ZKXXefQjXUk07YJYhv2I50fA1X0ZCOy1S5hbwFdVf3Hxn1MxihAaE
 B61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B/2HES7YJYG6wdjYxPV+3ewSssuf+BgawA5HJPMTCWY=;
 b=UZ43PlFKNpq0pZ8SpTqLyZDFruye2Ww7po50k/N0uvgXRYt5a6PMBQdHr3al91Ln1h
 niz1r2829Pd32JmshJoT+Zfp5smZ9zC0jltNVjMtyj6gtlfZXGwD4Lr6NpFpK2Q9q+nD
 nzgH1eL0YoxORc5HhDHD3Vtye4EoYjGwqSaVrtAld5olfKIma7GtCP7HKpjka+hDUQ74
 phHnRBeLW5ZEkJCuBtLIxbPVXCti/C5EBG6BV9HjonwEttpKMvwGI4vEDby3iAfLJyYW
 iK5CjYZ6eIVV8ctvq5xfVV99h5KWhG1QdJv9kxMWxSKwUXE+hgAlKk9GnnI13HMvKpln
 s2nA==
X-Gm-Message-State: AO0yUKWFoEHW+u1nnl7XWLr8cX1045ohJg/wnuywYaK7IXn5Mg3di2G2
 i8oZJrpa6s3DPY2Gvy8shrNz4A==
X-Google-Smtp-Source: AK7set/nFgtU44u0s2ZGliuMXyDDD4aNmehE54BeMxWYYIi+ECKVGKMkEvFNRexR38HlOZYgBw6DLg==
X-Received: by 2002:a05:600c:3413:b0:3eb:2de9:d01 with SMTP id
 y19-20020a05600c341300b003eb2de90d01mr3382674wmp.18.1677340981217; 
 Sat, 25 Feb 2023 08:03:01 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 fc19-20020a05600c525300b003e215a796fasm3266868wmb.34.2023.02.25.08.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 08:03:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: exynos: add ports to TC358764 bridge on Arndale
Date: Sat, 25 Feb 2023 17:02:52 +0100
Message-Id: <20230225160252.18737-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225160252.18737-1-krzysztof.kozlowski@linaro.org>
References: <20230225160252.18737-1-krzysztof.kozlowski@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Toshiba TC358764 bridge binding expect up two ports as it is a
bridge, thus add ports property to encapsulate them.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos5250-arndale.dts | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 2e3da5670bc2..c03bb436bfed 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -192,12 +192,15 @@ bridge@0 {
 		vddio-supply = <&vcc_1v8_reg>;
 		vddlvds-supply = <&vcc_3v3_reg>;
 		reset-gpios = <&gpd1 6 GPIO_ACTIVE_LOW>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		port@1 {
-			reg = <1>;
-			bridge_out_ep: endpoint {
-				remote-endpoint = <&panel_ep>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			port@1 {
+				reg = <1>;
+				bridge_out_ep: endpoint {
+					remote-endpoint = <&panel_ep>;
+				};
 			};
 		};
 	};
-- 
2.34.1

