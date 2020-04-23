Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 569CE1B60CB
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 18:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D5C66E952;
	Thu, 23 Apr 2020 16:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8226E952
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 16:26:20 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id a7so2721037pju.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 09:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fs+VyUYiQhHLqjr9qU6M46uht+we4DMR37Sq8mHOUJg=;
 b=DpLPKwlMZsLZnxIioolM8ptTrEbItSx7IHdh1uPs+5fsxWGMGiV+5LduIaSEo0UdUH
 lfewHcUPuCS2CaHrmBVsSnkGCWg/Y04/Hd85eHRDtEqVH1g+b5xaPV0zWfvc0d0aJOmW
 t+u2CkySUhgOQJfywp7JUZRfHAv1W7wSiwO2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fs+VyUYiQhHLqjr9qU6M46uht+we4DMR37Sq8mHOUJg=;
 b=V02goKcuN+K0NsOzGpS6Y0ZpvypN0OHDOXQwrKybNzt+PN+U/PrOguUYoPtepKTBAr
 J/IuHLnOR+0UBEb8I6vsEIV83HR158BLZS3h5pff4HJY5A66WlFLEqCM44GJ3K9asfgw
 yzRn7x+uWTJ8akaJg04EyHgh+v1ACR5fe9A5Nh0/bE8NfodfmYgPIOBqAkj2bW4d9jKl
 e9/LlHf+F6lRFZVYU8tbuvY5/4xfz0FtYOSmc3Fv3Y/ifbuH7NvnMW/NuDUZqFyce6sx
 2+eSb6hHEkNy7xXdeSLyMSxvuVtqOYRlNWEdsxjzQRQ8zfSUy97QusqmBzQO89gBSXsF
 5vpg==
X-Gm-Message-State: AGi0Pub+Q4p1U9tOqPi53EqUqZdcqh8NmMfIgDEw5qbE8Zrc1oabBo4s
 9sjCay9f44ct+dHaSV1TwBjVmQ==
X-Google-Smtp-Source: APiQypKJjjilIFJnRl4OpyzS4YRq70Qi1utK3lHOL5ENRwaojLCeKCJCNTxUDY7zc6N7YPo9khOOyw==
X-Received: by 2002:a17:90a:f68d:: with SMTP id
 cl13mr1559548pjb.107.1587659179681; 
 Thu, 23 Apr 2020 09:26:19 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id d12sm2841927pfq.36.2020.04.23.09.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 09:26:18 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, narmstrong@baylibre.com,
 a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 spanda@codeaurora.org
Subject: [PATCH v3 6/6] arm64: dts: sdm845: Add "no-hpd" to sn65dsi86 on cheza
Date: Thu, 23 Apr 2020 09:25:48 -0700
Message-Id: <20200423092431.v3.6.I89df9b6094549b8149aa8b8347f7401c678055b0@changeid>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
In-Reply-To: <20200423162548.129661-1-dianders@chromium.org>
References: <20200423162548.129661-1-dianders@chromium.org>
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
2.26.1.301.g55bc3eb7cb9-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
