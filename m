Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 629C839E4D4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 19:06:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6566E957;
	Mon,  7 Jun 2021 17:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD16E6E94F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 17:06:30 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id e22so14281782pgv.10
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 10:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wKbk17m+yRiqrp8oW9bJSr2UykFdXfcHhiqIPzfS2qI=;
 b=d7uRiZFiVdHNBDp2qM1GV2qvC8tUScUp4gQqpHiZHXNee8gRa/eAc4xiuA9dx93pFr
 QOiJLnTOHlCOM5wbiTgfPH6ytHol9+kEJug/yedPbuegsMS8kLc4Vx0/w/FDNaGsGRST
 1ylMolobN5or1ag0U0WYOWfgeGpYnzKuQdi3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wKbk17m+yRiqrp8oW9bJSr2UykFdXfcHhiqIPzfS2qI=;
 b=PYugN56slQhlnmOmbJoepWamz4boDJcTqzAwD4jaojwDlYQ3M2QG83m4g8TW4JpW9b
 qRZknx5KNSGifgZrJPM2bjbPgLTTaXlOtH8nT1UKXpfWWGkUIDQH9tV3872L8gWz3ouJ
 vij5VBiMv0leEX0EvFVY2HTaWXJf2AL3lO8p23ws8Vl4bPfx/MVIDroUu+0prswS/uUW
 bvc3LTgEQEEOwuJtCv4vf2SjiWE6rdJFAo5g7ikHY1yfZ/VDA9/hFReQHMOKtOZAQGXS
 2cGZssx6Vw/GH9dyN5fFliIJ5LpwrDBqApCbDtJE7W2ywln6WJmIHmWmWBwHmLuyBSc6
 rZYg==
X-Gm-Message-State: AOAM532ACL0kT45f0on/iVHy8gWaCMMn0B8mRShNOMuSt38AmJ77GNt3
 jebBaux9rJgTHa6hRxgr5QhzNg==
X-Google-Smtp-Source: ABdhPJxEW50WvoFT9KK67OmVwM2Mr1eVymTaJSsTsWnsiAx1vJIlqoWz/EV/BWZ999GsFg+jutEjjg==
X-Received: by 2002:a63:5504:: with SMTP id j4mr18814384pgb.238.1623085590332; 
 Mon, 07 Jun 2021 10:06:30 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:f656:ffce:6348:a42a])
 by smtp.gmail.com with ESMTPSA id fs24sm12897639pjb.6.2021.06.07.10.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 10:06:29 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v9 11/11] arm64: dts: qcom: sc7180-trogdor: Move panel under
 the bridge chip
Date: Mon,  7 Jun 2021 10:05:55 -0700
Message-Id: <20210607100234.v9.11.Ibdb7735fb1844561b902252215a69526a14f9abd@changeid>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
In-Reply-To: <20210607170555.4006050-1-dianders@chromium.org>
References: <20210607170555.4006050-1-dianders@chromium.org>
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Putting the panel under the bridge chip (under the aux-bus node)
allows the panel driver to get access to the DP AUX bus, enabling all
sorts of fabulous new features.

While we're at this, get rid of a level of hierarchy for the panel
node. It doesn't need "ports / port" and can just have a "port" child.

For Linux, this patch has a hard requirement on the patches adding DP
AUX bus support to the ti-sn65dsi86 bridge chip driver. See the patch
("drm/bridge: ti-sn65dsi86: Add support for the DP AUX bus").

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---

(no changes since v7)

Changes in v7:
- Panel now under bridge chip instead of getting a link to ddc-i2c

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 30 ++++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 24d293ef56d7..c76afd857b54 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -260,21 +260,6 @@ max98357a: audio-codec-0 {
 		#sound-dai-cells = <0>;
 	};
 
-	panel: panel {
-		/* Compatible will be filled in per-board */
-		power-supply = <&pp3300_dx_edp>;
-		backlight = <&backlight>;
-		hpd-gpios = <&sn65dsi86_bridge 2 GPIO_ACTIVE_HIGH>;
-
-		ports {
-			port {
-				panel_in_edp: endpoint {
-					remote-endpoint = <&sn65dsi86_out>;
-				};
-			};
-		};
-	};
-
 	pwmleds {
 		compatible = "pwm-leds";
 		keyboard_backlight: keyboard-backlight {
@@ -674,6 +659,21 @@ sn65dsi86_out: endpoint {
 				};
 			};
 		};
+
+		aux-bus {
+			panel: panel {
+				/* Compatible will be filled in per-board */
+				power-supply = <&pp3300_dx_edp>;
+				backlight = <&backlight>;
+				hpd-gpios = <&sn65dsi86_bridge 2 GPIO_ACTIVE_HIGH>;
+
+				port {
+					panel_in_edp: endpoint {
+						remote-endpoint = <&sn65dsi86_out>;
+					};
+				};
+			};
+		};
 	};
 };
 
-- 
2.32.0.rc1.229.g3e70b5a671-goog

