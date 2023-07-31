Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AC876998A
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 16:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D120010E2A9;
	Mon, 31 Jul 2023 14:32:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F9E10E174
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 14:31:58 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fe110de46dso25362395e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 07:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690813917; x=1691418717; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+GJI50mwxWlMPNP5cWPxpWEEdZG5lOnOefrq0yW+CGM=;
 b=azh4UrrpTdAdPCnq+VL6yV09ES/C33R7g2ghHZMTCU1oZOetB0YwsqD+3zPh8qKXks
 h67suHf+jkQASp61dHgCaALnOBewHl/seUICPQbHKCd/xzYQ60NHY4tYgZyWwS6tMpXu
 Oon3yjpGCTOTMUw9YTggcLYc8fC760VXPctgHFdLkjEKx3naom6EjUBV6Nj4B3wJcvGN
 i2oQu60jAOshwLLmstqWPrvuRpqqtb6pAuYaQ6qwSN+rqfO2LtnyJtXnrmc4wjtlEZ4U
 t47VVA9LwRO08oMvc7nSVmnSVhHwdPjhN72CHKPqsKqqMqlL2SAqbkKAu9Xk5wDNDIsH
 dlNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690813917; x=1691418717;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+GJI50mwxWlMPNP5cWPxpWEEdZG5lOnOefrq0yW+CGM=;
 b=WMPRGg+L1yd0ks0Fh9J/Dmn4JghGPjaxL4oC8rrBg8Hq6d2Y9onfPFTLwC2+zcNKwG
 HSDJeNbKr6Ec40/dW9Qwyh2DIArJLWVdQrcHSnwiHuLHSspdLPq/EC+pfKU2bswgJXC6
 KL78F2PtO1Vg9NCZoX3kM5bUOnVYBaODw2RMeA6T7HN6o/GK4iPhMuWdzLvzw6pgbdb9
 yASwpZGlG56d8ffE2enY7xb0QGzrR7FSMx6FhZVQRLZCj2kce3OeyujGAbWRpviSOTfk
 9ZgVqROVJGAra3Cop2K3j7+iJZwlGkXkpqE9wKrYJQXNRql93oeMRYOuovxVMaMrbUNV
 TQUg==
X-Gm-Message-State: ABy/qLb2lbhXYZG7Qfi6rfILOp0QChBEvK8c6oQA/ki1nITKljjfobqI
 4aL7xuiH5Rm8vJOsTM3mmubDHA==
X-Google-Smtp-Source: APBJJlGX64MgdrkSnwTDk2MZfryNLn4qKqwiMlcaDv3x8b4A0xwDLZk1j01dUepsQC9r2++dDWHHJA==
X-Received: by 2002:adf:edc6:0:b0:313:e9dc:44d5 with SMTP id
 v6-20020adfedc6000000b00313e9dc44d5mr6771188wro.61.1690813917171; 
 Mon, 31 Jul 2023 07:31:57 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 i8-20020adfefc8000000b0030ada01ca78sm13301675wrp.10.2023.07.31.07.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 07:31:56 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 31 Jul 2023 16:31:47 +0200
Subject: [PATCH v3 3/3] arm64: defconfig: enable STARTEK KD070FHFID015
 panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230711-startek_display-v3-3-dc847e6b359b@baylibre.com>
References: <20230711-startek_display-v3-0-dc847e6b359b@baylibre.com>
In-Reply-To: <20230711-startek_display-v3-0-dc847e6b359b@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=767; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=3ewdZnRTwiLei9nYvBO9iEQ33z/6iSvXdTZm6ylJVyY=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkx8XXgjha77G2f+FeTYulR1uMYFlKk9aqlXP53LP3
 NWdePhSJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZMfF1wAKCRArRkmdfjHURfGvD/
 9dEJzZdYNzbFBHGBLoB7/yG6gZXLTP/gd6SoeFtGRzJukIdBgVrfY4CrbWd9OsA5RJ3hlRC4uoWZiz
 IGys/+A6F+E3yPJa8bcXwYse/fb4mrxfLpLxWS2dcoO3a5dk2PofsDoLHDs7j9oyfHSUd7sBfyBnLq
 jRRLbOK16vXBfKL0ByvS5NG256EvE0vyukalDMum0h0bwUzP/8Zi8yPHzFcqVOojVqOPorzjNQzDp8
 ckxgRnmpeuNshIgmyg2injoeHFRsezCJqjLgBC1Grchm5w8Qba8df3Geax0dptWsbmYl8fqHtlKs+d
 xDsHIa6P9p8C1RmuCeqg8PRENpNkrmAKn7s1U5SwyMPFsDGaSFUB1GHvGq8khv5gWKrbDqR0guaA5s
 T8MwEFtfryl90taY2b5hM0OwCEvuJMCCYL9Y1EHOtI1nONhX6Rg/XG/ZURLrAEtE3PskwFsYSp/BVj
 tLug/+/7tiv9+cfJx87fUKuOTK2V4TM7u3ZRkXEUAz+cAU4nY3SIRnVeWmOmHSYd+acr6tQd/ZYo4S
 UrAfE/HFuhTQE33GQACCfwt0lMXntGtU6SVGftn63pgtes659x1EwtLZzkBcj8wWSU3SuDwZFqvw9/
 4J6fKYXLz5FNOqOs331MYECZpzIm3Btanu2QEOFDA0FvOKqjxy0eRXl1pG6Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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
Cc: devicetree@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Build Startek KD070FHFID015 panel driver. This MIPI-DSI display
can be used for the mt8365-evk board for example.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 0777bcae9104..cb24a3d1219b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -816,6 +816,7 @@ CONFIG_DRM_PANEL_EDP=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_SITRONIX_ST7703=m
+CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
 CONFIG_DRM_LONTIUM_LT8912B=m

-- 
2.25.1

