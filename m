Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D32F06739F9
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 14:22:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0986010E939;
	Thu, 19 Jan 2023 13:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C6010E930
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 13:22:28 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id v30so2814454edb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 05:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bBRhMIWBBhe/TliUQy+AZIlgOFFoxbwEkFQWDIwkk3Y=;
 b=gQqyHL5f878YFECkQbVlVt1i2oW5o6NrODjENuIskCss3t4CBgygaVJvMwyvD/opNY
 ua7Yuu8+ofN7SLwaqlAzq5549NtQe2Nb6mUudBeMPDhZd10UqxBjFfj/+pCs7/QxxgEM
 6Ol2dhcex9eW1YDsllnAlCBqthlZz2OEYJqRtBZlgPVgI6kSFIiA7TA1Ts5VM8OZwmmQ
 ZeORDMlRED83SQ7oC6zNR+We8Uf2jOTNkqg+R+3QbI7zAvpVREHhrjNcnhZ/108GE65M
 Qwv6hbc0M9LOlWm/3AK3TYM8ySJ82qIGNMReSU0chyzDHzWhogkw+XZuIKktXwE6zHXG
 liaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bBRhMIWBBhe/TliUQy+AZIlgOFFoxbwEkFQWDIwkk3Y=;
 b=0YiCnznZSxEWEclJkeOgZhlayGzyIYzYWZSqkS82pZ7K3vB0i83iqDiXCQ7lIcj91M
 N0KM6NkpL2CkfoRkDUncODI9bP90nwMD4o9VpLpFPdmKtXFP+NswNTDpgrvmpVRGRd2R
 zDaamvgdGzk2Ys6glmJLV4dgdV01zRuF9sSOGF/XeKWcT+vqdZni1fsvTP5mGMaWEMpF
 ZthQjXS6YaYVFyIRlZMbJN42G6TFEzOq7dSFu1m4Yax9VmDkjJNtrD38FSuc87RQWPoD
 8eMHqotXU1Zo1YiY/KzoonKY6mIZUrmdEtO51D4l2FVfrPtnpBt+yJ6FOD3WyBCRvLWw
 b/ug==
X-Gm-Message-State: AFqh2kqHNwEYmG+4scEjTyvK0R75BprFeCIBlVkHmuSBiABXu9OyoxmJ
 EMk96k/BYovboqysqFzuFyOZyg==
X-Google-Smtp-Source: AMrXdXsHXoST2nFKVY17xlSarrqKjeFW7wy8a6//enD4WSTrPdCI41yAuePsNFxPf0CEckaaD83Arg==
X-Received: by 2002:aa7:c3ca:0:b0:499:b674:5a1f with SMTP id
 l10-20020aa7c3ca000000b00499b6745a1fmr22148197edr.28.1674134546861; 
 Thu, 19 Jan 2023 05:22:26 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 bt16-20020a0564020a5000b00482e0c55e2bsm15532646edb.93.2023.01.19.05.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 05:22:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 5/6] ARM: dts: qcom: apq8064: add #clock-cells to the HDMI PHY
 node
Date: Thu, 19 Jan 2023 15:22:18 +0200
Message-Id: <20230119132219.2479775-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
References: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add #clock-cells property to the HDMI PHY device node to let other nodes
resolve the hdmipll clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 95705703fe8f..82c795beb8a1 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1489,6 +1489,7 @@ hdmi_phy: phy@4a00400 {
 			clocks = <&mmcc HDMI_S_AHB_CLK>;
 			clock-names = "slave_iface";
 			#phy-cells = <0>;
+			#clock-cells = <0>;
 
 			status = "disabled";
 		};
-- 
2.39.0

