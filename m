Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 345AB3055C4
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 09:30:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A3856E80B;
	Wed, 27 Jan 2021 08:29:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B4E56E514
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 04:54:37 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id g3so373831plp.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 20:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XcNzJ3Y1xaPDuXcAllHAfyiKBSKXPgrFbgqPU858HRE=;
 b=c63/2D4Bgx2Pjk09crfuNIuRwe5/wMbu0Ar0zyQsmCvjMtnTas7y/GZBYlWxRjh3Cu
 Nb1V3mC3i2fY9O+EVE8ljfGG/yIlqdt7A80tCikJGekU3DA6bwVdJV2EpvcTM4Bl2Ejs
 w1Y6GR1JZE4dTINAqovV9VIiAh/wsO0SgoYf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XcNzJ3Y1xaPDuXcAllHAfyiKBSKXPgrFbgqPU858HRE=;
 b=uoQ08lQhJgtW2v7kgMpLcA2yirSL5NDbLLxjW2yohg+Dt3c+XbwyE8Yk5wEj+SUcIy
 ninuD/03uidGxb9LhEMqkxZsWStoUPgQq9t6CBTFldFRpfJfZRE0HkSnzNroom7jFXrv
 4E3jvRO6k8cN4sweGNcrJOjwJPvlzZG2Tk46ceTasXIJdPpwDTshVSH3t2Q6mE57+ERB
 7tbxpRUBrkrSFH6yIT54EmapLUiILeKAWrIvxa/WWed2J2NtaOeJnTLszhbMC1rwjVdH
 KVyxUG0viPH7tmrhZlBICzqoD5oyYd7QSjIs4uShRuUYAsijHJ/mugdCM3EgDxgHIlMP
 NJKg==
X-Gm-Message-State: AOAM530Lc7XAmlBtKD0sRCwLzj3pIK2xrnUb6Q0CrQniog8GTeZftDSw
 4HjRbGlOlwJERwA4isQx8p/IsRN7Vq6IGg==
X-Google-Smtp-Source: ABdhPJyCyyCu7ohSjPbSyt1lJg9XiT+gg2+ohCN2CtKu56w6RhygO1w9flQc9+fGYUeBaJfTm6dUew==
X-Received: by 2002:a17:902:7148:b029:df:f45d:41c9 with SMTP id
 u8-20020a1709027148b02900dff45d41c9mr9676516plm.3.1611723277218; 
 Tue, 26 Jan 2021 20:54:37 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e0a5:d2fc:aaad:1e4a])
 by smtp.gmail.com with ESMTPSA id a141sm684484pfa.189.2021.01.26.20.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 20:54:36 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v10 2/9] arm64: dts: mt8183: refine gamma compatible name
Date: Wed, 27 Jan 2021 12:54:15 +0800
Message-Id: <20210127045422.2418917-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210127045422.2418917-1-hsinyi@chromium.org>
References: <20210127045422.2418917-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 27 Jan 2021 08:29:46 +0000
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

mt8183 gamma is different with mt8173
remove mt8173 compatible name for mt8183 gamma

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
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
