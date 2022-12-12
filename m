Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E139649BF0
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 11:19:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A7B10E185;
	Mon, 12 Dec 2022 10:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812F210E185
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 10:19:03 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id p8so17709250lfu.11
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 02:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=LJWd6AQztEmSWT/U5Xb23y3w/Zwmz1JFHRldH5LnDP0=;
 b=zwvGvG8xi+vxQNRzfLMBIZHsUNUMx7b+j3H3D+U6IkMjn0SP4C2qkEyZ9te6dt4HHA
 sCdAgV8NBSYmGRHJzSZh6pLofhXhWm0EYJJuxiFg02afRnnV/U94Lc+yBZR4e4j3KJIj
 dZG9fOYQOW3OrF2fBEDOik9/WHYWLG3Pt15b9+vcWuPeQQnB+g34y7f6nGmK5it+O+CF
 Fe58l7mnXL9kGamdInKND9W2A0ARpfWq1QZyr7+zCsll5NJQ7Fllqiy+occ6pqrKEUOj
 9e6xR9rYWGxRv5cFlD/2c9ASF1UHaPuq6mbJziG/+dmvknEW1pbF+QCoyJzR56o/BAvC
 28fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LJWd6AQztEmSWT/U5Xb23y3w/Zwmz1JFHRldH5LnDP0=;
 b=Ap5taGchHa1SvVigMfKN1YvRuZEijo7yKpQdZ3hF6iQBm9nVR0R+jrFJKe8qqWCoGj
 YizwzPJu7UouwOzs3STH9siZCIqTg9jQBKNm93FpUfSabDnK10s4E//aEjmARBbDbNzd
 ZHwLwqHd1uIfYEDM6bX3btL4SKR2KifzMokbSGVeYji/5tA1/sRGsjMYHxpppSeVkfo2
 CAq6gIy/nvsBjR79+rKS5zI2kl2Vehw8/Zz3L9lgkkfU+Hmg7XaJTc5ShikkhIIFk9Xw
 vL7CxXzNhh8gcHleqS6420ve4QG78iHf/CL9zfaO7cACShuIewtDBHxwylrmYXVdU124
 iOKw==
X-Gm-Message-State: ANoB5pnrqPzfcxmWIQHtsUZyfotfmo6SIcmny+LQi706ufV01+oRlNcP
 m3uWNYKyZ2mwpVDh16DQ2MVzAA==
X-Google-Smtp-Source: AA0mqf6YBUpss09uzAVY1l7XE3IX3EtN6+7g2xVY9ikGcR4jNDTXTGvpknnrJD5vQVuagvsPiHjvTg==
X-Received: by 2002:a05:6512:329c:b0:4b1:2447:697f with SMTP id
 p28-20020a056512329c00b004b12447697fmr4067081lfe.24.1670840341542; 
 Mon, 12 Dec 2022 02:19:01 -0800 (PST)
Received: from [127.0.0.1] ([94.25.228.118]) by smtp.gmail.com with ESMTPSA id
 y17-20020a056512045100b004b52aed44besm1592841lfk.25.2022.12.12.02.19.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Dec 2022 02:19:01 -0800 (PST)
Date: Mon, 12 Dec 2022 13:18:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8150: Add DISPCC node
User-Agent: K-9 Mail for Android
In-Reply-To: <20221212093315.11390-2-konrad.dybcio@linaro.org>
References: <20221212093315.11390-1-konrad.dybcio@linaro.org>
 <20221212093315.11390-2-konrad.dybcio@linaro.org>
Message-ID: <FF242AC6-01EC-4C8E-BE49-BB54FC9D2FEE@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12 December 2022 12:33:13 GMT+03:00, Konrad Dybcio <konrad=2Edybcio@lin=
aro=2Eorg> wrote:
>Years after the SoC support has been added, it's high time for it to
>get dispcc going=2E Add the node to ensure that=2E
>
>Signed-off-by: Konrad Dybcio <konrad=2Edybcio@linaro=2Eorg>
>---
> arch/arm64/boot/dts/qcom/sm8150=2Edtsi | 26 ++++++++++++++++++++++++++
> 1 file changed, 26 insertions(+)
>
>diff --git a/arch/arm64/boot/dts/qcom/sm8150=2Edtsi b/arch/arm64/boot/dts=
/qcom/sm8150=2Edtsi
>index a0c57fb798d3=2E=2Eff04397777f4 100644
>--- a/arch/arm64/boot/dts/qcom/sm8150=2Edtsi
>+++ b/arch/arm64/boot/dts/qcom/sm8150=2Edtsi
>@@ -3579,6 +3579,32 @@ camnoc_virt: interconnect@ac00000 {
> 			qcom,bcm-voters =3D <&apps_bcm_voter>;
> 		};
>=20
>+		dispcc: clock-controller@af00000 {
>+			compatible =3D "qcom,sm8150-dispcc";
>+			reg =3D <0 0x0af00000 0 0x10000>;
>+			clocks =3D <&rpmhcc RPMH_CXO_CLK>,
>+				 <0>,
>+				 <0>,
>+				 <0>,
>+				 <0>,
>+				 <0>,
>+				 <0>;
>+			clock-names =3D "bi_tcxo",
>+				      "dsi0_phy_pll_out_byteclk",
>+				      "dsi0_phy_pll_out_dsiclk",
>+				      "dsi1_phy_pll_out_byteclk",
>+				      "dsi1_phy_pll_out_dsiclk",
>+				      "dp_phy_pll_link_clk",
>+				      "dp_phy_pll_vco_div_clk";
>+			#clock-cells =3D <1>;
>+			#reset-cells =3D <1>;
>+			#power-domain-cells =3D <1>;
>+
>+			power-domains =3D <&rpmhpd SM8150_MMCX>;
>+			/* TODO: Maybe rpmhpd_opp_min_svs could work as well? */
>+			required-opps =3D <&rpmhpd_opp_low_svs>;

Is it required for the dispcc, for the DSI or for the dpu? We have stumble=
d upon the similar issue when working on the 8350, see the latest Robert's =
patchset=2E


>+		};
>+
> 		pdc: interrupt-controller@b220000 {
> 			compatible =3D "qcom,sm8150-pdc", "qcom,pdc";
> 			reg =3D <0 0x0b220000 0 0x400>;

--=20
With best wishes
Dmitry
