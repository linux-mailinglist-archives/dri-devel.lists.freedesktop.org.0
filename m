Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC72307ED3
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 20:45:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843626EA0C;
	Thu, 28 Jan 2021 19:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5625F6E15F
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 11:23:25 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id b21so4083982pgk.7
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 03:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xhgdJLSOFpJ1X5OA/ZUAhPXvec8bmbpja63O+GhXRwk=;
 b=aRkLJR88J0jdbr/jXC5uahfZscq5N0dhZa/Flm0QePbjhpW+UbVM1aZTGfMnJ9Cg1E
 rTr3ivslJUiwfS3agf1E7lgcQe0m2KRdju9hUJe7C7G9EBNvuonyPmqCz9PVCiIm9I26
 IHqVYXUV4EXOhDT8pPJe7oQubeAaN3tse/CQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xhgdJLSOFpJ1X5OA/ZUAhPXvec8bmbpja63O+GhXRwk=;
 b=gLixRfAWQvCd/X8WreGSDEhrk/9bo+8YiG8kmEffBuySih6xySbGBKKaz4z+5W8wJa
 fRPPfiCpovOr8BgMLfGoDfy431aigDt7Ms5YyrPlcQ7rgN6imWwnbgvDeXs6HLGe1uuP
 NgGeuod4+aueA3K0kHs4yBfM2UtCzvRw+kg4uIz+VXJa4PvDcfX2oIuQQ2+YLFvj9BCZ
 OIq49SBaVwlVdwI7YYGwu5PpVfUuKY/cSY0vZZ5vHfWa974521b6f/47JWyrBl96Ix5g
 CuLM1zGSm87OyOLfnkK2HGAdfOZFbZI9nyy6jKeROEP8hQQFYwjKLkQ0XduPcjvmiVQi
 ofQg==
X-Gm-Message-State: AOAM533cNXaKxYD/zvApeW2JLa6d7BMp0DkZgCn6eyfV/Ov3ThlwnIJu
 Bp5lqAhoHsKxLogBspnTbx0Mxw==
X-Google-Smtp-Source: ABdhPJwiadoAWryEyjYOG/m6fl1/fQ2YCA5XNTxkLxD1rjf13x5lnoPMd+5/LKUkg1EA+/pnufsbuQ==
X-Received: by 2002:a62:c312:0:b029:1a9:19c7:a8e with SMTP id
 v18-20020a62c3120000b02901a919c70a8emr15539436pfg.74.1611833004948; 
 Thu, 28 Jan 2021 03:23:24 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e0a5:d2fc:aaad:1e4a])
 by smtp.gmail.com with ESMTPSA id j198sm3138315pfd.71.2021.01.28.03.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:23:24 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v12 2/8] arm64: dts: mt8183: refine gamma compatible name
Date: Thu, 28 Jan 2021 19:23:08 +0800
Message-Id: <20210128112314.1304160-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210128112314.1304160-1-hsinyi@chromium.org>
References: <20210128112314.1304160-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 Jan 2021 19:44:35 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

mt8183 gamma is different with mt8173
remove mt8173 compatible name for mt8183 gamma

Fixes: 91f9c963ce79 ("arm64: dts: mt8183: Add display nodes for MT8183")
Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 6c84ccb709af6..9c0073cfad452 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1055,8 +1055,7 @@ aal0: aal@14010000 {
 		};
 
 		gamma0: gamma@14011000 {
-			compatible = "mediatek,mt8183-disp-gamma",
-				     "mediatek,mt8173-disp-gamma";
+			compatible = "mediatek,mt8183-disp-gamma";
 			reg = <0 0x14011000 0 0x1000>;
 			interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_LOW>;
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
-- 
2.30.0.280.ga3ce27912f-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
