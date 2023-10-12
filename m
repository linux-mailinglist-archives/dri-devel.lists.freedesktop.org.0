Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 634497C6DA4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 14:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99FCD10E4C8;
	Thu, 12 Oct 2023 12:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009CC10E4C9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 12:10:27 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-5859a7d6556so672613a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 05:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1697112627; x=1697717427; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kqA9WASf0rt1GODGT89PWw2CZu5GCXUQdsFwPZ6SIJ0=;
 b=hPNgYNIUvhwmQt8Qf6CSSzh5ykR2mPovdL0ngoe9HwhYf1n870QN/lshwDz4ezbCdY
 apdOkrEhY7ZdUAXOM3xNuY7Cs2Diw8dzlTrKPwuA4tTCL84C5X/7FbPl64VGU9O2CEfQ
 jiaOZQO3ZlHEtGPtLx/6upINgz31qXScXNWeULPa3t9uRA9EpFTyN1xwbupNqlSFsX7R
 sA//qCUYXQEndW1dDU1Vep4/ROIeb0UmJrHkkKVljkFB7hINuoY52Gm0KGMrg28jefX2
 mcI1o6PzLsIQm2TmRgAQeeviUpa/6xAue0H8jDyC6j0kiQ89pZkHtAzEtD4JvJUQ/MfC
 uFQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697112627; x=1697717427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kqA9WASf0rt1GODGT89PWw2CZu5GCXUQdsFwPZ6SIJ0=;
 b=LKaE4rMPclXBtLjvmqL0MQTFOk2Tgxa73otZHCaenvbb+PVsdcqlmgeLYS+nncf7wp
 n39JuMMQFYEXaHOXJDDFQpzE0im/WsMwVkqQjZyb6YkhYzFeEQFFNP5WE2cdJ/MRJj2I
 SXWmejhDeRRwLAo35jPOsJ9ivxnA9mjlIgNNHJATG0uL6FcB+y9ml0uUw0+lkY2drDcj
 xvWEQPSkt7D04kCGPlrt/WMnXMx0iHghJX/zr/WLnBeiSBASbuWzyv4+KDNHfVKNWRv1
 8glX600NrV+/iwUz80TJnO7EMLt7OIF3J2dFgSQdU59b2EMp9aoSKe/6t1RUdDRyOn3H
 1waQ==
X-Gm-Message-State: AOJu0YyH6d43q9CmbfDAVYRnEtYuhsTQ2vP42wkwHCFLw7VWvk7I4GWf
 fD3xB8Cxkb+772P2PFlQ7XnnWw==
X-Google-Smtp-Source: AGHT+IGW6bEEb9qeSy5cfFjqXXfrAhGutw99BDN1EfVcIzYOX+AHdBEwi2RIiDNbBQR8uPxyfRg0eA==
X-Received: by 2002:a17:90a:b015:b0:26b:c5b:bb44 with SMTP id
 x21-20020a17090ab01500b0026b0c5bbb44mr22886168pjq.13.1697112627600; 
 Thu, 12 Oct 2023 05:10:27 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.205])
 by smtp.gmail.com with ESMTPSA id
 ds2-20020a17090b08c200b00256b67208b1sm1664455pjb.56.2023.10.12.05.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 05:10:27 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com, linus.walleij@linaro.org,
 swboyd@chromium.org, airlied@gmail.com, catalin.marinas@arm.com,
 will@kernel.org
Subject: [v3 3/3] arm64: defconfig: Enable ILITEK_ILI9882T panel
Date: Thu, 12 Oct 2023 20:10:04 +0800
Message-Id: <20231012121004.2127918-4-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231012121004.2127918-1-yangcong5@huaqin.corp-partner.google.com>
References: <20231012121004.2127918-1-yangcong5@huaqin.corp-partner.google.com>
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
Cc: devicetree@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM_PANEL_ILITEK_ILI9882T is being split out from
DRM_PANEL_BOE_TV101WUM_NL6. Since the arm64 defconfig had the BOE
panel driver enabled, let's also enable the Ilitek driver.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 0777bcae9104..c3453dcbad3e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -813,6 +813,7 @@ CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=m
 CONFIG_DRM_PANEL_LVDS=m
 CONFIG_DRM_PANEL_SIMPLE=m
 CONFIG_DRM_PANEL_EDP=m
+CONFIG_DRM_PANEL_ILITEK_ILI9882T=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_SITRONIX_ST7703=m
-- 
2.25.1

