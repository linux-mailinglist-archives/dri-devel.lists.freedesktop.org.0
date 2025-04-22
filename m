Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF5BA978CE
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 23:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B6D10E3C2;
	Tue, 22 Apr 2025 21:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="JLUb9npf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from send174.i.mail.ru (send174.i.mail.ru [95.163.59.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D89410E3C2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 21:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=y07PAh3BLlv2HQ1gSCyzqMUYGkS88zHMrjyVOGu4yu8=; t=1745357753; x=1745447753; 
 b=JLUb9npfMvY82qslLLmyD1/xonDwZ1z2RhKqJLeAM4MGR1qIqB8dGe6Kzl/r/UNzdVIArXnQsz0
 NAMrviXEa1FZT5acLh4ft/Ubx/j+78zS/6P8HGFmjr8ch+4m9mpBpJr3ZRZ712TytwuL0BEbriwQa
 UY/hLDSMVmzmeGdO9Dg=;
Received: by exim-smtp-77d8cdf77b-wlhm8 with esmtpa (envelope-from
 <danila@jiaxyga.com>)
 id 1u7LHL-00000000BOp-2Oze; Wed, 23 Apr 2025 00:35:44 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Rajendra Nayak <quic_rjendra@quicinc.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
 Lee Jones <lee@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Georgi Djakov <djakov@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Sibi Sankar <quic_sibis@quicinc.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 David Wronek <david@mainlining.org>, Jens Reidel <adrian@mainlining.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, linux-scsi@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org, linux@mainlining.org,
 ~postmarketos/upstreaming@lists.sr.ht, Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH 20/33] dt-bindings: i2c: qcom-cci: Add the SM7150 compatible
Date: Wed, 23 Apr 2025 00:31:24 +0300
Message-ID: <20250422213137.80366-4-danila@jiaxyga.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422213137.80366-1-danila@jiaxyga.com>
References: <20250422213137.80366-1-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: exim-smtp-77d8cdf77b-wlhm8;
 auth=pass smtp.auth=danila@jiaxyga.com
 smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD985535D2C87FE65BB97DD4303B9AD225130C860A3DF32F5F900894C459B0CD1B97BB5A07D2AA7A60433594132A326AF8BF6BEDB69781F65E6726B236C0A6ED22E2208A4954BE01924
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F9D3BE5B596754B8C2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE789066434B85BF7C7EA1F7E6F0F101C67CDEEF6D7F21E0D1D9295C2E9FA3191EE1B59CA4C82EFA6585F2ED231F9B98A558D1BBA29F9A7A3F74779480A6B9F6043117882F4460429724CE54428C33FAD305F5C1EE8F4F765FCECADA55FE5B58BB7A471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F44604297287769387670735201E561CDFBCA1751F6FD1C55BDD38FC3FD2E47CDBA5A96583BA9C0B312567BB2376E601842F6C81A19E625A9149C048EE0AC5B80A05675ACD985B8ACC81218E19D8FC6C240DEA76429C9F4D5AE37F343AA9539A8B242431040A6AB1C7CE11FEE3DA7BFA4571439BB2040F9FF01DFDA4A8C4224003CC836476E2F48590F00D11D6E2021AF6380DFAD1A18204E546F3947CB11811A4A51E3B096D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F7900637AD0424077D726551EFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-C1DE0DAB: 0D63561A33F958A5D49362BF98D1FE035002B1117B3ED6961C0C1FEA2073AC9A14DB8790748E3E77823CB91A9FED034534781492E4B8EEADC8D8B8CB12567299C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFC4AFD8C2BC22464C808A79B66DB6D97FBE88CBD0636E26826671FC92FC799F8B192AF36DABE8584568A835CA8743990B79266EB102E5D1C1D59B53E1D0EAB012CE43DF8B8437DD6DEFF8118B638B08AA02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVS+uSU+BUhgvghW43qVva/M=
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275F9AF3E6DDD6D95881582B80AE0CC324097FD9F80C453DF64D66C39E7DD362DEB22C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the SM7150 CCI device string compatible.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 73144473b9b2..b5c62db46870 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -30,6 +30,7 @@ properties:
               - qcom,sdm670-cci
               - qcom,sdm845-cci
               - qcom,sm6350-cci
+              - qcom,sm7150-cci
               - qcom,sm8250-cci
               - qcom,sm8450-cci
               - qcom,sm8550-cci
@@ -185,6 +186,7 @@ allOf:
           contains:
             enum:
               - qcom,sc7280-cci
+              - qcom,sm7150-cci
               - qcom,sm8250-cci
               - qcom,sm8450-cci
     then:
-- 
2.49.0

