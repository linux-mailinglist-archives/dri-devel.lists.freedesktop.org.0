Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 256E4769A64
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 17:09:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA17D10E2AF;
	Mon, 31 Jul 2023 15:09:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F90A10E2AF
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 15:09:05 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fb7589b187so7681883e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 08:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690816143; x=1691420943; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+GJI50mwxWlMPNP5cWPxpWEEdZG5lOnOefrq0yW+CGM=;
 b=B1DYggB8eGqCpLsilfDjv+CtPtKA8mzBBJiX3DsqfFcVmRD3EHJVa1I3ui/adpLG4o
 5L0OkqX16kwiG+alYKt7beRdvQIUy6Vqp3fytmEb5t72ZkLKEhGIgX3oVK/qbYP2dIf+
 PcZ/IBYg5fcpqwrCWjYL+XwqkbsE3JJtqktw3OwnCLBUH9VtvguIXX/hX+tgZ2GTjPyB
 R4x/Jm7nX/dzvKoX2oYUEEJP8wTaKuD9XBJLfoKlM1IVbZmntXqZyHRJzDJHiJGj94Ut
 w2Rglkd43okEbIloEuKynBL4GOaTToBhU7MKjHy1yqnf8agEPfjNDDUg+3mo7/l84d8k
 JPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690816143; x=1691420943;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+GJI50mwxWlMPNP5cWPxpWEEdZG5lOnOefrq0yW+CGM=;
 b=jYj45zY1mcIzfGUlhA2fODI0NiqJ22d5LELcpldN0O4bTG4yBkBl7jBZQAHH6k82Wf
 P4midKOUg3wIhTJq0BHdBchy/hu2it8z+xReLF83BnJyyKqPBfOMTCF8uDESx4MGCz07
 O8I+6WAMz2Dx1ASQICDN2Zllc+E7RiSKdmq6l9cI9SFlEqEVUPBQN/Icod1xLMs355G/
 LlhU6uzY9VgOMlENkldrpsFsdEdWXRYRbAGbkD1U3FH3N6uLGe45zowioJOEhn3BTJ8s
 zP/i6XJOqGz2/IzBYrZe/DUhHq+8tb2pUoda3eU0l2VtPDc9efRQRHFK2o8YRLTn5pmy
 5Dow==
X-Gm-Message-State: ABy/qLbSxhMe++gXRUhegPCY0qWdMht9G3zuV/DqPIzbJtZt+Gp126jN
 okwTA/0z780/FuKok3mArGdaMA==
X-Google-Smtp-Source: APBJJlHa9zHDumGZmnru2O8XwCkJrQtDXNbzYwW+KavipyZYevSoqWizlwsA89+vnBqByZBXimV7aA==
X-Received: by 2002:a05:6512:5ca:b0:4fe:599:5684 with SMTP id
 o10-20020a05651205ca00b004fe05995684mr71097lfo.34.1690816143625; 
 Mon, 31 Jul 2023 08:09:03 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 u22-20020a05600c211600b003fbcdba1a63sm11728791wml.12.2023.07.31.08.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 08:09:02 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 31 Jul 2023 17:08:58 +0200
Subject: [PATCH v4 3/3] arm64: defconfig: enable STARTEK KD070FHFID015
 panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230711-startek_display-v4-3-fb1d53bfdef6@baylibre.com>
References: <20230711-startek_display-v4-0-fb1d53bfdef6@baylibre.com>
In-Reply-To: <20230711-startek_display-v4-0-fb1d53bfdef6@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkx86JSWBe/R+WdTNSp+vNLNQkL6rWTTSurE2qm+F8
 Nb0tXdmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZMfOiQAKCRArRkmdfjHURRqwD/
 0doxKphu5595hSG80BpEmZ8DzSqvovKlEfgPCJMGL51vVD+dY6e02ieFPrS9uw6FyfIpq13lRYesi6
 DJr6qrgxwbKGSA2d46RkMnc1xYF7GovxIPzU1oevQjr81n3HYn9VJTva6SR0Vq+jgES8mC6jcXOJlY
 emtjChmuuolXVTe1JDMWRmZ/p2kIfVDIfeVZVB0l98kG6QBJit6oYvKix5iU2zuZknzxNDlIu3jn7N
 9RJ4nLVJyarM43diGm0yzIAS4Kz8qmbIBcwaPMG9ShA4vr+kTNog1efaJnjGnKlqmqMTR66ILli16v
 widOVEVlnhBC5s/YwJnLMdupi4OkDu6oFcH0piuwpcmTH3qxGSGEW3xCV0MotrXj3t+FhsfOHn/R2H
 Nc+8ez34sEGbmqLNAi/Y30ypmLijfbumQr3WRn4AdovudtfBD41aZ0bB0utXD1awsLFyR8XsMaU/mX
 QFYZqfTD/S0UR9VNxvCH0onfYdfKMpZMUfWnwp9sS1/NxeH4DYUkvCwOqDIvx77wByJZcM7D/Ui5dT
 or30NjCl2/P2DLuC/IX6tF7KDBXgfXUBR8+ztt3rOT0kUN637geJRLBPqzp7MKw+ObOrJBilY5sfSi
 JwHqNfF5+QR+4m1I3vy8ZyeaDT/463ZSawnmTJtI7dn42Y7mAM7LDnm1DiMQ==
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

