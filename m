Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6094D13C5
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 10:49:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118B410E4C8;
	Tue,  8 Mar 2022 09:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89C510E37D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 09:49:18 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id k24so18074370wrd.7
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 01:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6Vptup9snjTByrwJQ9zSJpQbWeuT9OeToRX24egqXZE=;
 b=ZkvqwDQcHKwDX84OOnDMiAlBzjBS5NMVrq2VBIAW9dRo+lZGFGg3x8XK1DFS0RuYw1
 jkV5mgBKgGBFp5ULdFQWgj/rYPEFcRog/8vMTiSd1HDGyxrndTzswnzycMaUOgt3FaSq
 Si4oRF2seEYg/4ywLp4m+dCSVQ21bFYQs4tdSA/h9Zqw8dlrlIjX/8JZ7tHQoslw4+BM
 mfZcM7JvwHmpjVfSeSZpYHdOEViNZa1ftqdyTxnwads01Am5McQdyroikyUjnWjDG/ZM
 vas1/rV6+k4Du8d0onFwDWKgrEL58IWmFBTXPLQ14vSzHRBVn/5T7oAtbmci3wBzyYAN
 RkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6Vptup9snjTByrwJQ9zSJpQbWeuT9OeToRX24egqXZE=;
 b=naXm5iP5wlBE/Yd23UUeGmpylcVmrqphzuOLNzbUQ9iAAHJiA2p9vz/SxveR7/nTkJ
 +9TuFAO0+xoSBWDZi5FuZ2bFAb3m5qFcbdNHa1kxvbRLMhiYAcDXBhAGFTqr4uyPPMcu
 nULfEX7u5yqZB7UxDj6GuJPzUFVgNNJGD1vefBs1wn8YZ3QFkqYtrCE5Jn70VqxgY6FY
 l72gJHnKgzMAt+Poj1AM4gXP1balICjKBapAahYnOY5RnPiR1GbznDV2Rmzw1m9dXSuN
 4/LbNNAX3r5KIF0R1wovCAWkzOYFHY7g+zw8zLh4v4y2sz8VPSk0oMZZJuoMbwr1CXMK
 yzuQ==
X-Gm-Message-State: AOAM531SbmhGNdg7fyIrHZi3xxBG2CPomiqcWE8vd8rSHnlzn+U/7GRs
 UbShRmASs0fq5MB0YBLZvdHJdg==
X-Google-Smtp-Source: ABdhPJwyHtSnI5DdyZsEddgf/hq4aj4GLJcAaVuxD5wI/kt3z5s/DN1pKpabP9/LthhErPegg06whQ==
X-Received: by 2002:a5d:6e0f:0:b0:1ea:9418:c2a5 with SMTP id
 h15-20020a5d6e0f000000b001ea9418c2a5mr11280082wrz.244.1646732957483; 
 Tue, 08 Mar 2022 01:49:17 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1cf403000000b0037d1f4a2201sm1684885wma.21.2022.03.08.01.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 01:49:17 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 matthias.bgg@gmail.com, robert.foss@linaro.org,
 laurent.pinchart@ideasonboard.com, xji@analogixsemi.com,
 hsinyi@chromium.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, arnd@arndb.de
Subject: [PATCH v2 2/2] Revert "arm64: dts: mt8183: jacuzzi: Fix bus
 properties in anx's DSI endpoint"
Date: Tue,  8 Mar 2022 10:49:11 +0100
Message-Id: <20220308094911.2680291-3-robert.foss@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220308094911.2680291-1-robert.foss@linaro.org>
References: <20220308094911.2680291-1-robert.foss@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 32568ae37596b529628ac09b875f4874e614f63f.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
index e8f133dc96b95..8f7bf33f607da 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
@@ -171,8 +171,6 @@ port@0 {
 
 			anx7625_in: endpoint {
 				remote-endpoint = <&dsi_out>;
-				bus-type = <5>;
-				data-lanes = <0 1 2 3>;
 			};
 		};
 
-- 
2.32.0

