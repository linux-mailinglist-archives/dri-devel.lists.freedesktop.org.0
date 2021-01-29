Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A04943094BB
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jan 2021 12:28:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676DF6EC9F;
	Sat, 30 Jan 2021 11:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE506EAAA
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 09:22:20 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id o63so6236092pgo.6
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 01:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Pn0ZbiAlX16dpKw5pmgMJlxLv+/NrVwQy7/e1oH3sI=;
 b=WYkrT72n0GWwwAndhgIvmEHt3hhcUsWDVcnPQ2Q0CNRY/ChtuPtw4BVk2a1rDzRF6b
 gcH3UQEFP141/TcXrGXdA/7xCCPWn6bdzJPNHvhch9z4VZSw4zrLG6SDI7xcwTIBrQsp
 ugzrrh9M/0LxJKesFNE2V9yVU7YBDYAKyJN7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Pn0ZbiAlX16dpKw5pmgMJlxLv+/NrVwQy7/e1oH3sI=;
 b=RQmuxerAf3G8yQhgNVptTTS2dKTE2vcbAINbSAe6Z0kYQ36EHBWGx8dpMjbdkc9ia9
 y5AksICAcTgDqX/rPCMoqsMTNccLoRDIHnWpKxEva+S5qAU9jv1j9NUY4NDShTba3sBn
 wQM+ohLjMln7GgAUOVc+woHfLd60SH0FL22sR0D4xVufGv8VMPZLsuVZWItghEJC5BeO
 g537wMzezFDapBJK3G7EHUuKDdlWYk7BIbFWfzErBF90yKMFMiQMAmabWBzjau98R1XG
 TUTPXUMYRkTuUHnWVAaBQThCIp7BbyH0ZtuVNLFm2eGnk/e5IV371yJA9h2io4bErF3Q
 eu5A==
X-Gm-Message-State: AOAM530nvQO4O3fu95MRzdLTorBORgfYMPAbN0S6ueKtHRSsaymbk/1v
 Tf8TrstFcHs44UIZQjkPFb9fdQ==
X-Google-Smtp-Source: ABdhPJyvgi7p9OnM8oHlTqpPouXpLJgvsH4sANoZS+syyi+AQJA6VQxZdLBs2UKl9e0laORkqG9TFg==
X-Received: by 2002:a63:3403:: with SMTP id b3mr3940088pga.308.1611912140000; 
 Fri, 29 Jan 2021 01:22:20 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:51f1:c468:a70b:7c09])
 by smtp.gmail.com with ESMTPSA id p7sm8032776pfn.52.2021.01.29.01.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 01:22:19 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v13 2/8] arm64: dts: mt8183: refine gamma compatible name
Date: Fri, 29 Jan 2021 17:22:03 +0800
Message-Id: <20210129092209.2584718-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210129092209.2584718-1-hsinyi@chromium.org>
References: <20210129092209.2584718-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 30 Jan 2021 11:28:30 +0000
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
2.30.0.365.g02bc693789-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
