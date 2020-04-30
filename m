Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E881C06BC
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 21:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C405C6E94F;
	Thu, 30 Apr 2020 19:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 683E16E94F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 19:46:35 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id w65so362664pfc.12
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 12:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CNXt2FmO52CndewwhPBTf6I3mlSfjDZ6zV6z3LcD0VE=;
 b=EeP8tZraylGTLmSTJH6KQFW78ibPGi/n6VR3j90ey0lht5hgmByF7Ag8EXQRMbYY57
 IlG5tDXde2JUI0MV5tWKn0bOMGytiYol6M1pGGnhyrNAPTxlRKSNOdzzdJxAJ4f2sMAH
 03lRzJvQy2wVsDVtMwt8z0cb7Mlulvu7VFMf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CNXt2FmO52CndewwhPBTf6I3mlSfjDZ6zV6z3LcD0VE=;
 b=pG/MPSD4tVeXP/eHTMiFyYKMByn6zVJyBGiBgOmjUtHbXzmJM/rjfGbPr33cKlItQ1
 OmqaZN5TRi+lfCh2jVmqxEZWZZvT/svlwVA+ZPB4QbluaEFLk0yiUcUV5za4e9CN+iDC
 MqCMrAJ2VG4CWxLq47agkap4iu65FLFNegkw+0hzDKDEy4yLg1qGm1wRbaIU7pKQXx6Y
 0AJ0xnK+ABWDEhJJQMVTBmOtJiYQznVfNfKMbgtqsuye5CMUJ5F25+5Viv28UqFC4dBx
 HN8wQkywCUPggnXacl08FjzDDYt595oecIwItj28reVwUnAOyBQnngsID4yB9fXOI2P2
 uVng==
X-Gm-Message-State: AGi0Pubt2XHar1GrEUFKJno9HCMIy3F9MbaJ2RcGZqJE+nGNvGOQbL1A
 Hx2D43hogUZFJ+MwA7GCj7qDUA==
X-Google-Smtp-Source: APiQypJ5w6J53xRub/aTQzetgTJoWBXw5Zybbw7vRWEji/fczl1ZvQQJUx093mXZMrARd9s0cFlHQQ==
X-Received: by 2002:a63:8ac3:: with SMTP id y186mr506112pgd.277.1588275994930; 
 Thu, 30 Apr 2020 12:46:34 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id u3sm495993pfb.105.2020.04.30.12.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 12:46:34 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, narmstrong@baylibre.com,
 a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 spanda@codeaurora.org
Subject: [PATCH v4 6/6] arm64: dts: sdm845: Add "no-hpd" to sn65dsi86 on cheza
Date: Thu, 30 Apr 2020 12:46:17 -0700
Message-Id: <20200430124442.v4.6.I89df9b6094549b8149aa8b8347f7401c678055b0@changeid>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
In-Reply-To: <20200430194617.197510-1-dianders@chromium.org>
References: <20200430194617.197510-1-dianders@chromium.org>
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
 bjorn.andersson@linaro.org, linux-gpio@vger.kernel.org,
 Andy Gross <agross@kernel.org>, swboyd@chromium.org,
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
2.26.2.526.g744177e7f7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
