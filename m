Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C02C21B1DE6
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 07:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B0D6E87E;
	Tue, 21 Apr 2020 05:07:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D956E03D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 05:06:57 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id h11so4817349plr.11
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 22:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rJIEGMmKnB4qmjlxDkpNPpHgpkyR3Ib17vqADIfUNyc=;
 b=Nx0GHkdSSFwVcO0ZVTfVA67xDmtQrQR3ISUEjsXAFi7kPplFJ7bvMwndVFZQ2mQPIQ
 5+urO/oDX+ecQ6n4smIfS7jlrfGbpEwpLhyRBFjzIkKTBYlllsjxpA0YXGCzOkRFMRXM
 Ww1rLNK+kSpXpB9s6eMAHfyINCyzCA9O5lyOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rJIEGMmKnB4qmjlxDkpNPpHgpkyR3Ib17vqADIfUNyc=;
 b=mSXrsrJOh8zXlJAfxTslqW8m0oTEOMD0AyV9Jv3oKS5u5orbNwWEmHlhqhqn1u4gxL
 UUoHrQB/hxXlFpl2eogGNGYpPepgU5gAa1e2/OV3GHwQCN4RsOe845Hu+4YzpPwkANfG
 gnsmkCaDzegoNSZ7UC/yLYYXcbMShABH+gz3pfpn6xln3NLF7Ofq9B8P256NvoM/hOww
 A5vj0qMwPp1k6SdyRif4SDa3YCNPle1M04emcT57RAZ6o1LFATnXF8ahTGbe79JESZlB
 mZO7gJ0nIJHy/bGp9RjWPJX5VUO2au8T7FKFl9Lw5ZTbgN2bqlE8nZaPrTmiACtH4kjI
 JeHg==
X-Gm-Message-State: AGi0PuYFOjCRUN2bTgK6FMaoBiWfYaxPaXsIh8zVgBKHvi8dyR2dXFtH
 LYLtUXig9WQa52l1B4Lt/mN8vw==
X-Google-Smtp-Source: APiQypKf0qEtSgZ39UNfmQ6jEkTlqoHM3jrGCnKu6FbrTIcq/skJ+XDrheHaZdoGSLiH2iIfGj1naw==
X-Received: by 2002:a17:902:8a91:: with SMTP id
 p17mr20067418plo.248.1587445617462; 
 Mon, 20 Apr 2020 22:06:57 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id p68sm1184780pfb.89.2020.04.20.22.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 22:06:56 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, narmstrong@baylibre.com,
 a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 spanda@codeaurora.org
Subject: [PATCH v2 6/6] arm64: dts: sdm845: Add "no-hpd" to sn65dsi86 on cheza
Date: Mon, 20 Apr 2020 22:06:22 -0700
Message-Id: <20200420220458.v2.6.I89df9b6094549b8149aa8b8347f7401c678055b0@changeid>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
In-Reply-To: <20200421050622.8113-1-dianders@chromium.org>
References: <20200421050622.8113-1-dianders@chromium.org>
MIME-Version: 1.0
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 jeffrey.l.hugo@gmail.com, linux-arm-msm@vger.kernel.org, jonas@kwiboo.se,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, linux-gpio@vger.kernel.org,
 Andy Gross <agross@kernel.org>, bjorn.andersson@linaro.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We don't have the HPD line hooked up to the bridge chip.  Add it as
suggested in the patch ("dt-bindings: drm/bridge: ti-sn65dsi86:
Document no-hpd").

NOTE: this patch isn't expected to have any effect but just keeps us
cleaner for the future.  Currently the driver in Linux just assumes
that nobody has HPD hooked up.  This change allows us to later
implement HPD support in the driver without messing up sdm845-cheza.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- ("arm64: dts: sdm845: Add "no-hpd" to sn65dsi86 on cheza") new for v2.

 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index 9070be43a309..5938f8b2aa2f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -548,6 +548,8 @@ sn65dsi86_bridge: bridge@2d {
 		clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
 		clock-names = "refclk";
 
+		no-hpd;
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.26.1.301.g55bc3eb7cb9-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
