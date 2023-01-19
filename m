Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3176739FB
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 14:22:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF02A10E93C;
	Thu, 19 Jan 2023 13:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7E510E932
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 13:22:40 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id b4so2909666edf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 05:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M5lFrlvCIHoFB2+uziz/1ge4iw3F4JUj7qisClGGYZE=;
 b=BZyQsTr5ZebjrhxCYNrobbQBYaHncBi9ZTdl09BDOy/d3/0CNMz5/ewJezf59QRx2M
 ijZ7Dv9RVwYCeUMqVQ0vIFeOoEF1lmaJ8QbGGPIT/Ab6jV+maIbW4msr6kY0a5wT6QHJ
 05zkUwIjrOah3leYeVOfngbpKLUhbd/F39Apuj825I0KnSPIn1D/FY1VWfiKzk7U/AlS
 OeY+kljH/TsTD/HmKje0dm7kDrXdiWgetHOy+AL/bD3Jgkw8Sdo+vWPuv/mCfJKhdQc2
 cit750FVs8sscTMuSmiIdKBsj5wfQVLhBpV3aHaKWaJspkiwqvFZzm4kbmC9IJqoaJKG
 POcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M5lFrlvCIHoFB2+uziz/1ge4iw3F4JUj7qisClGGYZE=;
 b=OvMYcXHGorQxkLeiIrNEwShfpj+hOhz3raMCgNqIRwiNt1DXgIFIlrYERZkhawLIkz
 5mGzcwCZLilzBXyRITDl+sr9zkmNIN1WduRbiQ8272VmEnl6CZsOia5iQqnexytqYeSn
 mZCyFu5BjmpV0q0oeQ3LNo2YjpYVI1MlMxdyWePXx7C8ZS4iOed9Ow0IhD4etTU0xQ5s
 jiCGBQet0/4bywPtHTB05L5lf8QAPxP75N36tm9U1Lqd3YhKHJvpK7KXR7SMVDgq/Iwq
 DagBJCxF6RJ6d4af2cFROMtXrzFDGXk/ME4K4wyHL26lvvMilimzHnbBwe4M8eKIQEWK
 RZtw==
X-Gm-Message-State: AFqh2krcKv2ZnSOpgU37dLwGP5ZtLhr/kmeBWu0mRvBzL40CixFwy5f3
 OZaG6kol/hjrTSXN32upGCGuif+x6hCS3B81
X-Google-Smtp-Source: AMrXdXte67q8fD3ofpSt16K0O4y/76/t1vXA+qk0uMaBlzCGEPaAUZSL9km91H6eh7t0eNEap7FqfQ==
X-Received: by 2002:a17:906:60d0:b0:877:612e:516e with SMTP id
 f16-20020a17090660d000b00877612e516emr16289651ejk.61.1674134547974; 
 Thu, 19 Jan 2023 05:22:27 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 bt16-20020a0564020a5000b00482e0c55e2bsm15532646edb.93.2023.01.19.05.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 05:22:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 6/6] ARM: dts: qcom: apq8064: use hdmi_phy for the MMCC's
 hdmipll clock
Date: Thu, 19 Jan 2023 15:22:19 +0200
Message-Id: <20230119132219.2479775-7-dmitry.baryshkov@linaro.org>
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

Link hdmi_phy as a clock provider of "hdmipll" clock to the MMCC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 82c795beb8a1..b7e5b45e1c04 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -867,7 +867,7 @@ mmcc: clock-controller@4000000 {
 				 <&dsi0_phy 0>,
 				 <0>,
 				 <0>,
-				 <0>;
+				 <&hdmi_phy>;
 			clock-names = "pxo",
 				      "pll3",
 				      "pll8_vote",
-- 
2.39.0

