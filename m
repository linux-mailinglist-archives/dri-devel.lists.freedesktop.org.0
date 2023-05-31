Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B454717238
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 02:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0D210E449;
	Wed, 31 May 2023 00:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9FC10E446
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 00:03:05 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f3a873476bso5735099e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 17:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685491383; x=1688083383;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4ndSnEYa6LuA1WUrC19j/UvYoRdHNkWnuQlVQYWKx9U=;
 b=Whq/xMUjT6yPq+YCLB+EuBapvj/IuETp3Rbm7Lu3h0xBbJH/4mAMz8623PcEegc2e2
 zFHxVWgu6auHbYP5N2TBb2IozP0o8sIeXq//0GrXelKsdIm27EKT0pTpsFaa8/LtkLlm
 m5PRl1wZbzr6LgwIGzDClTtwTNoSA/YPmHnKS55DWhOTdQYpfI3uVRDFZUQ8fOLvEE7Z
 dA2HJaEdLOpgXiYgOzOJA6Un0RIqciX/BMeeXNPF6TXc/9OQqU88wIwb1HYvCcNF8IQw
 +lqdDcV3l2msQ24nXwzYdmku1d1fatyRgQoVFbFm9oRJIFqbAQm15U1NzbCFFNTkNAw+
 mehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685491383; x=1688083383;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4ndSnEYa6LuA1WUrC19j/UvYoRdHNkWnuQlVQYWKx9U=;
 b=WCFg4po1f6qt/bTLn/0V+/MpHUUc/sMPqCH5quD5Qx8quxAfNdWcl1UUkhZsnm/QAW
 yghXnlsyK3+YbRvwRJJe1j1YfUiW7wbraW2UMKuw+wZ7on4qvxXyyuvOi0sVkUJMlGYA
 W+5i1bEJCzH71jK/ZK/+5sZj74zHA+aWY+2dwE5hROdVWr0axwunRyTjYGY2XJS9a7aK
 3Lc90ovDcbCtCiNkta95O/cOIgic18gNHOFBnIi2e2iLd8jtt6GZSmkyqlA+OeNTnY18
 srVnWdLwqDWgflBxGcFlW6KB512qHc9UNCoQBjdiIW28ntWDOVYPsSTA61IEYVHGoLGy
 /gng==
X-Gm-Message-State: AC+VfDzNtvUs/OLczQYKvoxK7JN0qguIY2eTqC3o3Ku9sbxDxLRsGQjE
 RaYlMyLXdhXERMX3X6oA07yU7g==
X-Google-Smtp-Source: ACHHUZ7ax9Ag9+No8JNb9aFjqLI3V7NHwlCsNbV20G9jaRilJ73e4gdRu5nvWYi9gfwhGWiQaazD7A==
X-Received: by 2002:a19:7514:0:b0:4f4:dbcc:54d3 with SMTP id
 y20-20020a197514000000b004f4dbcc54d3mr1750354lfe.53.1685491383396; 
 Tue, 30 May 2023 17:03:03 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 d30-20020ac25ede000000b004f13eff5375sm490388lfq.45.2023.05.30.17.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 17:03:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 2/3] drm/bridge: display-connector: rename dp_pwr to
 connector_pwr
Date: Wed, 31 May 2023 03:02:58 +0300
Message-Id: <20230531000259.3758235-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531000259.3758235-1-dmitry.baryshkov@linaro.org>
References: <20230531000259.3758235-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation to adding support for the hdmi_pwr supply, rename dp_pwr
structure field to the generic connector_pwr.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/display-connector.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index 56ae511367b1..cad3105ab186 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -24,7 +24,7 @@ struct display_connector {
 	struct gpio_desc	*hpd_gpio;
 	int			hpd_irq;
 
-	struct regulator	*dp_pwr;
+	struct regulator	*supply;
 	struct gpio_desc	*ddc_en;
 };
 
@@ -316,14 +316,14 @@ static int display_connector_probe(struct platform_device *pdev)
 	if (type == DRM_MODE_CONNECTOR_DisplayPort) {
 		int ret;
 
-		conn->dp_pwr = devm_regulator_get_optional(&pdev->dev, "dp-pwr");
+		conn->supply = devm_regulator_get_optional(&pdev->dev, "dp-pwr");
 
-		if (IS_ERR(conn->dp_pwr)) {
-			ret = PTR_ERR(conn->dp_pwr);
+		if (IS_ERR(conn->supply)) {
+			ret = PTR_ERR(conn->supply);
 
 			switch (ret) {
 			case -ENODEV:
-				conn->dp_pwr = NULL;
+				conn->supply = NULL;
 				break;
 
 			case -EPROBE_DEFER:
@@ -335,8 +335,8 @@ static int display_connector_probe(struct platform_device *pdev)
 			}
 		}
 
-		if (conn->dp_pwr) {
-			ret = regulator_enable(conn->dp_pwr);
+		if (conn->supply) {
+			ret = regulator_enable(conn->supply);
 			if (ret) {
 				dev_err(&pdev->dev, "failed to enable DP PWR regulator: %d\n", ret);
 				return ret;
@@ -386,8 +386,8 @@ static void display_connector_remove(struct platform_device *pdev)
 	if (conn->ddc_en)
 		gpiod_set_value(conn->ddc_en, 0);
 
-	if (conn->dp_pwr)
-		regulator_disable(conn->dp_pwr);
+	if (conn->supply)
+		regulator_disable(conn->supply);
 
 	drm_bridge_remove(&conn->bridge);
 
-- 
2.39.2

