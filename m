Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E28174F3A9
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 17:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E0710E3CB;
	Tue, 11 Jul 2023 15:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55AE010E3C9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 15:36:53 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fbc0609cd6so59342585e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 08:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689089811; x=1691681811; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+GJI50mwxWlMPNP5cWPxpWEEdZG5lOnOefrq0yW+CGM=;
 b=wUDuda6My1fJhNJVTT4xzuCaPmZY9FWx4CNdwFY76vkATX+e7rRSrHp9ms5ohVNIOu
 IrLDOM0o95o8ib0GLHo08AGMsQQSPq48+rYhBhainzia4BksqYK9okETo7tFlymZM+Rf
 tYqT8fTpFGbbE3g1scqMByZUHJxF7frvB5/PgKqI5M2qTrkxiJbDIU9IzPrECsxOBd5Y
 xGTLlnCDj6UoBNkYmy+hk7EPro7JzQTwkFpQ8neSbIGi7wrqFt+vKFDyCt0pvEGb1JxN
 HubtI3fLpCuZE9ICFKpYlZD+O7QQ6PgY+6pcArhT515Axy0o6GKn4bX8fzSu34HybOp8
 6SjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689089811; x=1691681811;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+GJI50mwxWlMPNP5cWPxpWEEdZG5lOnOefrq0yW+CGM=;
 b=fNL1Vf0EtIkLADfA5IHypJZrHVQV1J41UCORaG62W0TcY45yaV9Tr/HYbePn8RSnWB
 M0aykiAZe6Mc3hlfiNI+RX2HEc6nwLckupip0sWfb1AKliwSC8jkweWIBvsL84OMSUxi
 b/BEq4L8qeuBP6XyfbS4tWCnsyknGhcrJvhwaNretw9BHwFYuzW1Z+A+Rvd1/gdCwV2P
 aFo8tEPK1xTtcZSwOJOypfZ9+kfX8MM0H6WeScLZwm1/Gdp+2q5tGsLOzlgJgCPKZ6CC
 8/OBBCv29yh2Actudt21i4fd81Jab5sakMuJYsDitFsB8PD7mNqZJOVLVFgewmxSx9Fy
 rcwQ==
X-Gm-Message-State: ABy/qLYaLzTv3rdhmA0/ybotw2nl4Ln3a4Z98xPrB/hFSzyUEEHI7rZ1
 7jXfbRmOaNT9WhAv78Hc+AcnBA==
X-Google-Smtp-Source: APBJJlF9So6LfwkBVH+qlI0rbO+D3Aq+ntkutH+LIy5IavL97S9sKAgEMeI+1n9UiFYVZdmvXxGIuA==
X-Received: by 2002:a05:600c:22c1:b0:3f7:f45d:5e44 with SMTP id
 1-20020a05600c22c100b003f7f45d5e44mr13522351wmg.32.1689089811521; 
 Tue, 11 Jul 2023 08:36:51 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 v6-20020a05600c444600b003fbb1ce274fsm23458249wmn.0.2023.07.11.08.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 08:36:48 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 11 Jul 2023 17:36:29 +0200
Subject: [PATCH 3/3] arm64: defconfig: enable STARTEK KD070FHFID015 panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230711-startek_display-v1-3-163917bed385@baylibre.com>
References: <20230711-startek_display-v1-0-163917bed385@baylibre.com>
In-Reply-To: <20230711-startek_display-v1-0-163917bed385@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=767; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=3ewdZnRTwiLei9nYvBO9iEQ33z/6iSvXdTZm6ylJVyY=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkrXcKUQWbV2iAeFPR/VjBVggDjm9Nq2Kb2ijsPX3v
 LhVCYBaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZK13CgAKCRArRkmdfjHURaueD/
 99uwr2/xYOYtFmN2Ous86Zl0n+MhUimAFkQ78BPNDlViDKM2LofCjegnKCtkPmgo+vOZbrZ7/Zv3D4
 sxjws2zW5NwdZRHRaSODznJG4NJFvt4fp62/Ndi6aUSXtQZgTRDfBstVPlKoOp5+mHT+LkpT7VqF2s
 QNZ5hbqOOrVcHJWvTnm1Na38zw65IvNOizOPsfov+cnpmc2G04tezzZUkLwQZxqeK6TottpGR9zGkR
 HzRuWIkAbQnkbss+XvXUFZpPVDjlZwPDEap9wIOHHRFyGziLv4sXoKaOn+bf2BlJsMmg9Mf5xxXyJZ
 KM3dpb0d9wCwaiUlGyWI4Dd9bYGwykqzI18RywHBJjAY2sAAGiIx/earW3dVSJaYaV6NEMdc1ENMAz
 47rSlNev8SPoutpEERMpE7sATabdhQYW9vtdwF5GQLiUOv4LvOE9MekZhYT2DWANzdpj16npCvcHBt
 6McpSQrTqnvFFSsGm0jrWO0Xgfi7w6H71iDw3KvcPsDvq3rUo9YLTKB0lSVA6b90+lm4QBEqiEZDWE
 eplqDbUJ+aHJUp09rlxeL8LSjIm6+LVr7ZQLqBuYGsC/lCV17lVSPdHGFBSzFYRodmLHoSTLj/SMjK
 0ip5nUMmiVX8RPZGoJLm+eN4VKcOICM/5GkztLRm63b+li6qa3QGNUvaFG+A==
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
 linux-arm-kernel@lists.infradead.org
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

