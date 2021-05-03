Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 598433722C7
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 23:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550736E429;
	Mon,  3 May 2021 21:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F286EA33
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 21:59:25 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id v191so5343133pfc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 03 May 2021 14:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xm1pxMgf3254HnKQhOZrmriigH6ea4myanu9Y2cRDqQ=;
 b=CIAdryDpEn9rQaPhlyTVYzELYwbjMNsFogb7bPkXSCBMg+03kh4lI+6XnJudg3+4NE
 jp0IX0m1DyxzhIjnTC8cmZe5uGYfxnDTUXboX3NVs0A/i7voWWNmtEXBNOS5N0gONI4J
 vXgenGFSYCusWGmU+Un80gZgXXcGwtm0k/sT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xm1pxMgf3254HnKQhOZrmriigH6ea4myanu9Y2cRDqQ=;
 b=flRlVYBAPTErjNnXopFFdaEDksvKs9PUnTHleEJsomgEswBX3wJQKQo7TtPFToayUA
 mJS/ZqdbLWiTkYnOs9pu+PRk0LlbrcDAeSh/nowwafEr+U2AAvxNKGLI/UpSlPTjHXDm
 9xGgkOCh7+alUhSUIRADGhZX10Tb9szD0GIJUtNwxv8jmXxbZrh2ANjukpEV8kDhMgEQ
 UqfFr5KUb/h3uu/Jf9pDKY2qRCdfaMN3b+yj8yPn6mBZP3pW7vlZujizCi3OGl7qH3cY
 c89fMB1OPdwFCmTnOVDe5qeXgdcJ9k2v5wvx2JKyTFySk8Sk0J8EP7tu4PAjf7EYU68x
 1zjQ==
X-Gm-Message-State: AOAM5318F+l2OsonMg7lte6AOGM+RFJeKrokLMT/P9flgT9XGurqbU1z
 oSSyJKiRRTAzyPUlm/A1lMeeFQ==
X-Google-Smtp-Source: ABdhPJw2UkoGCFZjjZZ9DA4lzXuDBaVWBMcxVKzDXxW44/AQEfL8FfaCwy463h1uFYXcKRpcbrIF5g==
X-Received: by 2002:a63:5947:: with SMTP id j7mr1042596pgm.248.1620079165455; 
 Mon, 03 May 2021 14:59:25 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:a592:ac50:b17b:5c43])
 by smtp.gmail.com with ESMTPSA id w1sm639186pgp.31.2021.05.03.14.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 14:59:25 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v6 5/5] arm64: dts: qcom: Link the panel to the bridge's DDC
 bus
Date: Mon,  3 May 2021 14:58:44 -0700
Message-Id: <20210503145750.v6.5.Ibdb7735fb1844561b902252215a69526a14f9abd@changeid>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
In-Reply-To: <20210503215844.2996320-1-dianders@chromium.org>
References: <20210503215844.2996320-1-dianders@chromium.org>
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 linux-i2c@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding this link allows the panel code to do things like read the
EDID.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

(no changes since v1)

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 24d293ef56d7..96e530594509 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -265,6 +265,7 @@ panel: panel {
 		power-supply = <&pp3300_dx_edp>;
 		backlight = <&backlight>;
 		hpd-gpios = <&sn65dsi86_bridge 2 GPIO_ACTIVE_HIGH>;
+		ddc-i2c-bus = <&sn65dsi86_bridge>;
 
 		ports {
 			port {
-- 
2.31.1.527.g47e6f16901-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
