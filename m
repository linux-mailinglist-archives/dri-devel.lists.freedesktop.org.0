Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8784FC61A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 22:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51AEC10E056;
	Mon, 11 Apr 2022 20:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9EA10E03D
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 20:48:21 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id 75so9359493qkk.8
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 13:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xZNVI9tiUlllab4AjTCJGE4j73/6LoXDJ3Aq+yrOdsE=;
 b=ANZHHiby3lJO1HmMWs7Ra5m8oQHXMKZ5cRfZklPrG4uQ3CBhHEPkCy3OUgw40pMSWJ
 9CbMnFl7u9Sw71/Va0syczaf1qh8kz6NkLSPkxPC8RH+uVISPzr2Jk2gPQrsDlhBRIU9
 wK2jdxMO0UP2EmfmviiZjgCIZMO818lZz0Raa0oEZppdmuYysZas5MFmfcaF6/Twgafv
 muGq9dBHST4uve5j5nukfAzQqYNqkb4iPc6xBEhZtBzz9JPl7WmeHtY2fXXfrlmdhrCI
 jjzF+mEDgQ60t7Tknby17d7i4fyLUkGScYo7eXlj0ZG83HssPT2TtZXMxmQVldXNqrvg
 Si0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xZNVI9tiUlllab4AjTCJGE4j73/6LoXDJ3Aq+yrOdsE=;
 b=UpdBKpWrmwyldmwUzVhCcQepCbqERWlnYWTzLUNSOhr8Ps9bNpUJ1wKBACUkmktFWu
 OvsLW+YPoU3DEY4ei1Dvuk9wztY5pV/I3oeTUzRNmUJagKcuUn9gAdw0q7yvPpffcKVi
 39tPgL5cupi5sKgWcvNCOZ6R8a6fvid5jiNQZq82YaZFnZEZfZRVaL8P9eSKloUeT2st
 fAgO1SuLslX7uredQP/nNYFyBLEFTEKgKwHJicVk2EzAko1yJHfw71LFJOaLtdu6pTOM
 V5ZLlJ1npqhXeeHgrXosvVJdYloCdlWOZ/NwIqEUqOQgZ2ATWg60E6a4KTjgmW8JqtPJ
 OSQg==
X-Gm-Message-State: AOAM531iQgbb+4vhnrncUyI5xxwbpsujB8L7bbtkqazvnKYcXyn0h22B
 St/ib02HzEEhOObGtISPf4lgoCfMw472GQ==
X-Google-Smtp-Source: ABdhPJzmVANaEbOOQWztExuy8DgTqZ9y5arWe7kL2myoN92Dfm5vhIY6xDgNqOnhuxmE4LUmMkux+Q==
X-Received: by 2002:a05:620a:28d2:b0:69c:899:e758 with SMTP id
 l18-20020a05620a28d200b0069c0899e758mr901133qkp.51.1649710100347; 
 Mon, 11 Apr 2022 13:48:20 -0700 (PDT)
Received: from localhost (115.25.199.35.bc.googleusercontent.com.
 [35.199.25.115]) by smtp.gmail.com with ESMTPSA id
 p7-20020a05620a22a700b0069c37e2c473sm647143qkh.94.2022.04.11.13.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 13:48:20 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Subject: [PATCH v5 09/10] arm64: dts: qcom: sc7180: Add support for HDCP in
 dp-controller
Date: Mon, 11 Apr 2022 20:47:38 +0000
Message-Id: <20220411204741.1074308-10-sean@poorly.run>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
In-Reply-To: <20220411204741.1074308-1-sean@poorly.run>
References: <20220411204741.1074308-1-sean@poorly.run>
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
Cc: devicetree@vger.kernel.org, markyacoub@chromium.org,
 abhinavk@codeaurora.org, swboyd@chromium.org, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 bjorn.andersson@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

This patch adds the register ranges required for HDCP key injection and
HDCP TrustZone interaction as described in the dt-bindings for the
sc7180 dp controller. Now that these are supported, change the
compatible string to "dp-hdcp".

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-15-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-14-sean@poorly.run #v2
Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-14-sean@poorly.run #v3
Link: https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-14-sean@poorly.run #v4

Changes in v3:
-Split off into a new patch containing just the dts change (Stephen)
-Add hdcp compatible string (Stephen)
Changes in v4:
-Rebase on Bjorn's multi-dp patchset
Changes in v5:
-Put the tz register offsets in trogdor dtsi (Rob C)
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 8 ++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi         | 6 +++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 732e1181af48..c3559253aefc 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -815,6 +815,14 @@ &mdss_dp {
 	data-lanes = <0 1>;
 	vdda-1p2-supply = <&vdda_usb_ss_dp_1p2>;
 	vdda-0p9-supply = <&vdda_usb_ss_dp_core>;
+
+	reg = <0 0x0ae90000 0 0x200>,
+	      <0 0x0ae90200 0 0x200>,
+	      <0 0x0ae90400 0 0xc00>,
+	      <0 0x0ae91000 0 0x400>,
+	      <0 0x0ae91400 0 0x400>,
+	      <0 0x0aed1000 0 0x175>,
+	      <0 0x0aee1000 0 0x2c>;
 };
 
 &pm6150_adc {
diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index e1c46b80f14a..3c3eef7a7d52 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3089,7 +3089,11 @@ mdss_dp: displayport-controller@ae90000 {
 				compatible = "qcom,sc7180-dp";
 				status = "disabled";
 
-				reg = <0 0x0ae90000 0 0x1400>;
+				reg = <0 0x0ae90000 0 0x200>,
+				      <0 0x0ae90200 0 0x200>,
+				      <0 0x0ae90400 0 0xc00>,
+				      <0 0x0ae91000 0 0x400>,
+				      <0 0x0ae91400 0 0x400>;
 
 				interrupt-parent = <&mdss>;
 				interrupts = <12>;
-- 
Sean Paul, Software Engineer, Google / Chromium OS

