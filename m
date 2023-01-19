Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0217C674F0E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 09:08:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E93F10EA73;
	Fri, 20 Jan 2023 08:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F90B10E9B0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 18:49:34 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id o20so4559326lfk.5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 10:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OFat64LMoXDYuRBJ5PYrBQ4w2KeQw9mnd+EpUQW2z98=;
 b=Smx7EiRZr0YFLFdiLbw9CGyQYH5KkwXlCnXcJXZVaw24v8CD2LwOklq3XKkYwQAf9L
 4eceQvdoqisR5BsqY9Ne3XFyEVzhktoK4W/68XSZYFHdGLZlAuP2Yb1ICYtV7eJK7Adz
 zxbeQvDMm29TiPJ7ZMbEkCf1RcLeoAs9R0kW14sbx/5rjqSlbR9zaCirDouEDdg2GW6L
 IOXdzIfg7p33PhAn9eJ9Ng3jwa/UjdU7ZKKQMMAbBJ7dkWKPIU+4tC48u1SY81+chX2P
 rICN1Q5mgGAe8s9KP/ZO1ptMg8lGTGO3bdeqMenCmrgnlP/OjSkN/XVw1JqCouw7Kshw
 QV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OFat64LMoXDYuRBJ5PYrBQ4w2KeQw9mnd+EpUQW2z98=;
 b=ELBSXIRM5cDB8Fr/JVPRRePahoPstgFLkW5bSJwleR/oUrtvY2YsVtyg+k5f4tQwUY
 gHHUO9IrcJsFkIlAaD8xSilOBrsFmIuJcsrvZD7qhehRfCSHE+N5WM+FFXcNq3dQfxj2
 fIKxNVbDMalE5hDi8YB29eKtxyuosGLStgmYKhUDdvV9mJlCglwhf3KfQ9D9wPaULd8p
 dA5NTtb56BDCP24a9sQT6ZF1GhXKwdBubTquUFhFGGp6lBKAHOwoylAFheDFIQ0D00XL
 C+VK6zdjIexazj/bbOqYMahZTfJ0hK4zPplioaSVWOoVsP3/AB05WbdNpQkpWeEZ4yex
 m6tA==
X-Gm-Message-State: AFqh2kpGBM5KPjTNWjrIv+93RrRlVHPOgfy76ldBzT9jr7ATA4YJuCT1
 dvtGH+RPTMobXTGBMRiG8Dc=
X-Google-Smtp-Source: AMrXdXsS73pkCKlic27wdJ6t/u2GF8WN5cOENCK0syWt1LSQd2eWuZ+/51FXuUHtnDJ3XgjSGs8C2Q==
X-Received: by 2002:a05:6512:2529:b0:4d2:9f92:a145 with SMTP id
 be41-20020a056512252900b004d29f92a145mr7462574lfb.50.1674154172862; 
 Thu, 19 Jan 2023 10:49:32 -0800 (PST)
Received: from U19.ag.local (static.187.76.181.135.clients.your-server.de.
 [135.181.76.187]) by smtp.gmail.com with ESMTPSA id
 b31-20020a0565120b9f00b004d30752a561sm2112737lfv.298.2023.01.19.10.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 10:49:32 -0800 (PST)
From: Alibek Omarov <a1ba.omarov@gmail.com>
To: 
Subject: [PATCH 3/3] dt-bindings: display: rockchip-lvds: add compatible
 string for RK3568
Date: Thu, 19 Jan 2023 21:48:05 +0300
Message-Id: <20230119184807.171132-4-a1ba.omarov@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230119184807.171132-1-a1ba.omarov@gmail.com>
References: <20230119184807.171132-1-a1ba.omarov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 20 Jan 2023 08:07:34 +0000
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
Cc: dri-devel@lists.freedesktop.org, Peter Geis <pgwipeout@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Frank Wunderlich <frank-w@public-files.de>, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 alexander.sverdlin@siemens.com, Alex Bee <knaerzche@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>, macromorgan@hotmail.com,
 a1ba.omarov@gmail.com, linux-arm-kernel@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RK3568 SoCs have a single LVDS output, that use PHY shared by two display
pipelines: LVDS and MIPI DSI.

Signed-off-by: Alibek Omarov <a1ba.omarov@gmail.com>
---
 .../devicetree/bindings/display/rockchip/rockchip-lvds.txt       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt b/Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
index aaf8c44cf90f..ec8a8d05368a 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
@@ -5,6 +5,7 @@ Required properties:
 - compatible: matching the soc type, one of
 	- "rockchip,rk3288-lvds";
 	- "rockchip,px30-lvds";
+	- "rockchip,rk3568-lvds";
 
 - reg: physical base address of the controller and length
 	of memory mapped region.
-- 
2.34.1

