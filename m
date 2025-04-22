Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E29A976D2
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 22:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1667710E61A;
	Tue, 22 Apr 2025 20:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="Hz7Nrk3s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from send219.i.mail.ru (send219.i.mail.ru [95.163.59.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B4310E61D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 20:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:From:
 Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=jsKvU1PTCsUomlMKtnbzwJq1T8gMY/9dXlU8tLiSe7Q=; t=1745353279; x=1745443279; 
 b=Hz7Nrk3sigoaoBbffEoQvJhX6a3/Vua2PttixJIs0Wd+W9hh55TzSuyvuNkKSEaWKdj5cO4HYue
 FGpD/FxLgdQpH+VHLpP9vpQA0je1HQ6cfgMfUHNe92H1somx0TgF+8VmMnjhd+xVndog48yBpHW1w
 n9SjPtOwK2HT6Poikp8=;
Received: by exim-smtp-77d8cdf77b-httmk with esmtpa (envelope-from
 <danila@jiaxyga.com>)
 id 1u7K77-00000000Adc-2Qvp; Tue, 22 Apr 2025 23:21:06 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
Date: Tue, 22 Apr 2025 23:17:06 +0300
Subject: [PATCH 05/33] dt-bindings: sram: qcom,imem: Add the SM7150 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-sm7150-upstream-v1-5-bf9a9081631d@jiaxyga.com>
References: <20250422-sm7150-upstream-v1-0-bf9a9081631d@jiaxyga.com>
In-Reply-To: <20250422-sm7150-upstream-v1-0-bf9a9081631d@jiaxyga.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Souradeep Chowdhury <quic_schowdhu@quicinc.com>, Lee Jones <lee@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alex Elder <elder@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Andy Gross <agross@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
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
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745353049; l=788;
 i=danila@jiaxyga.com; s=20250422; h=from:subject:message-id;
 bh=NLgxXfvKAzU8viSLUr6X8cUneJqkXaS8qJCPF4w2G6s=;
 b=DwJ+5CfmqLwa+5oBR1sMYVfFR5KZGE0Va+mLDYfggMO+DSre87ApVYSJYWnwo3oeM9F9jZzEu
 RchTq92wlu8CFwNMHDLdaYJ2Eugq/4IAG3cJkeRAlIa95KE8L+M20q5
X-Developer-Key: i=danila@jiaxyga.com; a=ed25519;
 pk=kkU4G47tvpSEUdBQEkXuWvTk/3WmGrVrdzZiKAKjBJo=
Authentication-Results: exim-smtp-77d8cdf77b-httmk;
 auth=pass smtp.auth=danila@jiaxyga.com
 smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD985535D2C87FE65BBBF6F8E8FB357EFAA05F2B99F9D351A4B00894C459B0CD1B99CC1AD4F07467FDBC591814E25D11F9F039736014AFE5CC5A32EEC6BB77F3E796464624B37E45577
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7811C3E343B302E2EEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637782358EF9635990EEA1F7E6F0F101C67CDEEF6D7F21E0D1D9295C2E9FA3191EE1B59CA4C82EFA658E143D194A951D25B1F6BA703804E69A215D2742798ACBACE117882F4460429724CE54428C33FAD305F5C1EE8F4F765FC47272755C61AA17BA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F4460429728776938767073520B1593CA6EC85F86DCB629EEF1311BF91D2E47CDBA5A96583BA9C0B312567BB2376E601842F6C81A19E625A9149C048EE0AC5B80A05675ACD040F9FF01DFDA4A84AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C327E9584FBD6BDD3176E601842F6C81A1F004C906525384303E02D724532EE2C3F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7C468D16C903838CAB43847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A57A3459999068305B5002B1117B3ED696616EE77385546E238D59E407A97E9958823CB91A9FED034534781492E4B8EEADC8D8B8CB12567299C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF4967CAAFF3F89EF1449ABCB1972787B2816C2BD8F40D1AAA6E8AD47FA5020D20FB9773CE30426B0E68A835CA8743990B7B508775475E6A5C0E280A9F3BCC449B11B74E29C4E0C0E3EFF8118B638B08AA02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVS+uSU+BUhgv8hmY7yZMkJA=
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275FA72E89150FD5FE6B601A8E04A89F3FFCC1D8020CC863B1B056629EE6C48E36482C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
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

Add compatible for SM7150 SoC IMEM.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index 2711f90d9664b70fcd1e2f7e2dfd3386ed5c1952..463331f5c1c40853a723cbea2df98072fc719f2c 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -32,6 +32,7 @@ properties:
           - qcom,sdx55-imem
           - qcom,sdx65-imem
           - qcom,sm6375-imem
+          - qcom,sm7150-imem
           - qcom,sm8450-imem
       - const: syscon
       - const: simple-mfd

-- 
2.49.0

