Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3653697BB
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 19:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E02D6EC1A;
	Fri, 23 Apr 2021 17:00:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCFD56EC19
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 17:00:02 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id s20so9679906plr.13
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 10:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qqRgrq5qTHq8+QQOXrqNOrI+XnC8s9rFcrx/PHqU9kA=;
 b=X+2LXkR+x2Y6Yo6aK1kTdJ8Rhytwsl31CFMU6k56xp/RuePZ0vzxwrb2UfkLXWGSBq
 LlAh38K6d3Rlb9ZhLKF9mKVf9rd/crkpvJJ+H9Qkz8Lur52GfMVYXi8zj2XicneHKR7c
 YdlA2lbc+fQi/b3LKgVfUmJaZh6SjEHuSYkCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qqRgrq5qTHq8+QQOXrqNOrI+XnC8s9rFcrx/PHqU9kA=;
 b=GeS8gE0FDsg3Bv5/JiybKv83W1XuskHNLTYbsEXrC5c4qMuO+oVuAYQBpVmbPzC7iD
 XOjsjwDj7/LQjC2Fk5NYTDYYV8RIZIXor0ylaX6n71pYjUjtMfL+Mm0okfPVAzID84e0
 pfcOzs4LcovcRU5NCkwMDwy1GSR0BD5oPwUTaYc9Qx7f+y/v8iLzoQM1lVMpYfCD1NZw
 4axL6WQ+sz93TzZdW0bBL/9japEt9M43Qf/pi6W1vFmp+i76zyJljpTBnnNK8o2rvuye
 sWpLsII/eEcDJt6LmAWxKVVy4r128oQtQAGOPvqm4hNoMKnhXHMIewyDqN1po5QMmkjg
 PdSA==
X-Gm-Message-State: AOAM533fiesEnJ4VOiMw5LyGcj+yypeey08mZDR2DipMhSsZ4jN5rp7z
 dSe7p4H9XlfsDxOquMxd6wFbjQ==
X-Google-Smtp-Source: ABdhPJwYRj/bkCBR5feDF1qTXpHaqYVIA63dyfs8jdja9V5hgW3GpI+hcKLSiO/ZUNmI8hVVg+H2gQ==
X-Received: by 2002:a17:90a:7d02:: with SMTP id
 g2mr6649977pjl.153.1619197202494; 
 Fri, 23 Apr 2021 10:00:02 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:6d86:663d:71f8:6a11])
 by smtp.gmail.com with ESMTPSA id v8sm5123607pfm.128.2021.04.23.10.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 10:00:02 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v5 20/20] arm64: dts: qcom: Link the panel to the bridge's DDC
 bus
Date: Fri, 23 Apr 2021 09:59:06 -0700
Message-Id: <20210423095743.v5.20.Ibdb7735fb1844561b902252215a69526a14f9abd@changeid>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210423165906.2504169-1-dianders@chromium.org>
References: <20210423165906.2504169-1-dianders@chromium.org>
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
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 linux-i2c@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
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
2.31.1.498.g6c1eba8ee3d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
