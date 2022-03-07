Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BB74D0340
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 16:46:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2DE10E034;
	Mon,  7 Mar 2022 15:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6938C10E034
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 15:46:18 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id g3so8314949edu.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 07:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qbuVe6nDY03YrLd6EKAmfjy8Xa7+ttYaCGu9Ft8mXNk=;
 b=Z7nFErSwglbyHm076TpKKK2nIpM57+2I1HSukjcbHGh/+3RomimyAmQGKZaQIPpthE
 M4kR3yREE4Auw0YbeTEwnkgbVJ0ceknXRpL9h11nrwD3G+jK1jkXPytJBQwvz1+Hd3N9
 fHD9mSbB2Nual/+Jpe7jdaprB3qAg74nAvwqBP5i+pwII4D5K7fdK0NnS1dFXIbpJkvf
 wZd90jrlqkuzBfMfdo00cRbMBiQGAZzOlckyYxZJNkUFjPnlXq+d1+F0qoFP8XhWFhEE
 6aYVMrchJv+z+8fK10mCpwdb4Aw2VIkHrlBVgOp9LNFMcSPP9gZB973t9zB8tybpWcQL
 qNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qbuVe6nDY03YrLd6EKAmfjy8Xa7+ttYaCGu9Ft8mXNk=;
 b=nDVGsCOM+54t5KHmAONM2Po1m872MjK5qckBpMhXybTGynRX53nAzN2EoQhHzqoaFe
 U/+ijjv4A24E3v1LceILeY4BkqbvFN4DvdaGq9IBhaz25KH/G9ibOQQnbvFS7tV5lLa2
 oNxqz41Qn2S29Xe3Q3q8P/H+45iTts3fuNnfr/ut9Ikt8IdVuEILNo2aP2L22BPEsksh
 1IbrDpmanvr7p3HaO4SLRfTeQSfILli7P4jf3YxM4m9p32lT13wzD96rc1xgG4pvcW8a
 qosn5APULVTicU6SzkfT+GEDyOYWqb9hLZf5AWfBIgNgwX2PgoES+YrvYJtghmwePcDj
 ftLg==
X-Gm-Message-State: AOAM530zQYtoZpsKaFyuUVDsnDqGppRQl4nu0ob/M2/bUr9C4jD3d4tJ
 vguZsb3mNtZTZjeOrbf953jiLg==
X-Google-Smtp-Source: ABdhPJwX8/FBbfGH5wS01NOcZx+cCthRhK0gDbtRwrXcJKhFfUh5mmx/x3w97eCLEhwf40YzairJ2g==
X-Received: by 2002:a05:6402:1386:b0:416:d5:ecf0 with SMTP id
 b6-20020a056402138600b0041600d5ecf0mr11510281edv.212.1646667976991; 
 Mon, 07 Mar 2022 07:46:16 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 e12-20020a056402190c00b0041615cd434csm4210747edz.60.2022.03.07.07.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 07:46:16 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 matthias.bgg@gmail.com, robert.foss@linaro.org, xji@analogixsemi.com,
 hsinyi@chromium.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v1 2/2] Revert "arm64: dts: mt8183: jacuzzi: Fix bus
 properties in anx's DSI endpoint"
Date: Mon,  7 Mar 2022 16:45:58 +0100
Message-Id: <20220307154558.2505734-3-robert.foss@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220307154558.2505734-1-robert.foss@linaro.org>
References: <20220307154558.2505734-1-robert.foss@linaro.org>
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

