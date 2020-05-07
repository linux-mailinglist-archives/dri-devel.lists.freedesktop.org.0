Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1057B1C9D60
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 23:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C636EA71;
	Thu,  7 May 2020 21:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F206EA70
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 21:35:35 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id t9so3251300pjw.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 14:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4v4vnXxurYJQOROnZvnzfPloWHp2bwE01an31yUPp4o=;
 b=jsEDGiwhIeWeIH5fsxZpLrFy4wAWrwHVPQ0Th5YaMdW+DiPGF2V2BrQMyLzoKF17KF
 qOZcFB9rQwZ1ibCZZ7iw4wbdZFNITQzkcLMUR6z/TFf0zAHfWY2lf/cGJq0O1FOcsMFr
 KWwrbKtdHEusvC97ESZz7VfnP6l0eiZX9wXIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4v4vnXxurYJQOROnZvnzfPloWHp2bwE01an31yUPp4o=;
 b=KogKyMMN8p9Mbg02kI4ubJSrzNZCk0XaBaPfbwioy7Jf7PJkQljEY500GCLlR5iBVH
 t0LbFopb4Fo3LEtv9s+bghpm/KaFW0UDCzejEdjgIvvcpxkNg0Yes5yFJcR++y+lKLGr
 5ziPwWIMrZx53RJNBJ6QDv5cZ+mvcRIQrXHbHqqDHSdKSAEYuy08W2QdwHEyVDwdywrr
 3avQaHaNqZBiEgpM0O25JfxEB8aywYO+o17jJcPnqev89fFiZCd9heGBufNUJoHJQtO1
 Kg8bQzgvXQtl9dVpIolEH0qEk6OdcFNKZuQ73lsH15CRkt+ooQXvv9otiL+Imx9b6S8k
 HVUg==
X-Gm-Message-State: AGi0PuYn1N70+OgUi8GYiwDdeyMKRWq03pRTY/gDCSsN1xzgo+VjNBnv
 NQ5trYwQXShoWeqmooomaFK7NA==
X-Google-Smtp-Source: APiQypJrX9Sds2V0tZ/XbcQs1N2tNz4bQqjgUQgoczdv15D6aqrUlNeX63mmz/+P2v3/w/VqhJ8N3w==
X-Received: by 2002:a17:902:9f90:: with SMTP id
 g16mr15528385plq.215.1588887335252; 
 Thu, 07 May 2020 14:35:35 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id i10sm5884860pfa.166.2020.05.07.14.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 14:35:34 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, narmstrong@baylibre.com,
 a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 spanda@codeaurora.org
Subject: [PATCH v5 6/6] arm64: dts: sdm845: Add "no-hpd" to sn65dsi86 on cheza
Date: Thu,  7 May 2020 14:35:00 -0700
Message-Id: <20200507143354.v5.6.I89df9b6094549b8149aa8b8347f7401c678055b0@changeid>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
In-Reply-To: <20200507213500.241695-1-dianders@chromium.org>
References: <20200507213500.241695-1-dianders@chromium.org>
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
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---

Changes in v5: None
Changes in v4: None
Changes in v3: None
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
2.26.2.645.ge9eca65c58-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
