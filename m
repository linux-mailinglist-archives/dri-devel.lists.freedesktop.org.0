Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9114FA262F5
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 19:48:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1233C10E13C;
	Mon,  3 Feb 2025 18:48:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="Tc07rSEI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="HMoGmgRg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="hASreJ4E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fallback24.i.mail.ru (fallback24.i.mail.ru [79.137.243.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7931710E10A;
 Mon,  3 Feb 2025 18:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com;
 s=mailru; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=ES8ezQH517IABbtcQEmpzvRe7ls11YJAOXvz/UGvSGE=; 
 t=1738608527;x=1738698527; 
 b=Tc07rSEIyhc4b7M7rAcIyVHdxO3Cx5iRgMe15DHz/yzdWGuu/x2HIq0C4VCkUQ5xdliQFnlg61cc8b68fp6PzIw6rjUJbSJM0mM938y2g/Is6nJobhEXZDzJh4aSIrZ1IIdGiMpcJeBw380VOypub+/ZUcIhE3Q+XQPY+PUUXGM=;
Received: from [10.113.124.198] (port=36444 helo=send101.i.mail.ru)
 by fallback24.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
 id 1tf0yc-00CMgQ-J2; Mon, 03 Feb 2025 21:15:18 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:X-Cloud-Ids;
 bh=ES8ezQH517IABbtcQEmpzvRe7ls11YJAOXvz/UGvSGE=; t=1738606518; x=1738696518; 
 b=HMoGmgRgXcx4ftorCBZmnkabC2WWOThjUFgggaPfzFpIso/5JHaKUpgBRBV7brX5I/LC+2tcYr9
 MGp4pz6Bula7UkOTfYsccvaL/13S8HMX4p3KuWBlVNmuOvEV/6ZPUaSMxzqu8cAuTxLAWst386oNd
 IeS6T8nW9mKU7NxVBLM=;
Received: from [10.113.30.34] (port=44668 helo=send149.i.mail.ru)
 by exim-fallback-5fbdbdcb77-qxlfs with esmtp (envelope-from
 <danila@jiaxyga.com>)
 id 1tf0yZ-00000000HmD-3aQf; Mon, 03 Feb 2025 21:15:16 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=ES8ezQH517IABbtcQEmpzvRe7ls11YJAOXvz/UGvSGE=; t=1738606515; x=1738696515; 
 b=hASreJ4EvHR2d1LdaojZ7lLDAOrZLvGNard0te1ill+1GPzY66420jCSQonM+dYU8OZ3kUVcIak
 SDbBfe7uIP2ukyv0ncmTJtoMl+CIH5tnPPwTHrI1jCWy6GC0urvByXrgujnMA5lW5+t5kmTCUYUkd
 rGMu6VIv/0yL32gTmRE=;
Received: by exim-smtp-6d97ff8cf4-crh4d with esmtpa (envelope-from
 <danila@jiaxyga.com>)
 id 1tf0yR-00000000H1P-2fXk; Mon, 03 Feb 2025 21:15:08 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, jonathan@marek.ca, jun.nie@linaro.org,
 fekz115@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux@mainlining.org,
 ~postmarketos/upstreaming@lists.sr.ht, Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH 4/4] arm64: dts: qcom: sm7325-nothing-spacewar: Enable panel
 and GPU
Date: Mon,  3 Feb 2025 21:14:27 +0300
Message-ID: <20250203181436.87785-5-danila@jiaxyga.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203181436.87785-1-danila@jiaxyga.com>
References: <20250203181436.87785-1-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD985D89FF3B425BBEF518B0176DCC892F7C9E207D5CA5D8326CD62213F67905E7AF909450DFEB1F812BDA1AADECFE04B85C33E90896BD9A96365DCCD7B30B55D1D660823B2EEFD31DC
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE782BFA309970D60C2B287FD4696A6DC2FA8DF7F3B2552694A4E2F5AFA99E116B42401471946AA11AF176DF2183F8FC7C062F001A90027CA0C8F08D7030A58E5AD1A62830130A00468AEEEE3FBA3A834EE7353EFBB553375664A06632C9376CE53FD1761174B026AEEA6A2B58A3B6C4574B64FEEB20DA3BBA4389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C08794E14F7ADDB10D8941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B60417BEADF48D1460CC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB8D32BA5DBAC0009BE9E8FC8737B5C2249CC57694C5FB0D60276E601842F6C81A12EF20D2F80756B5FB606B96278B59C4276E601842F6C81A127C277FBC8AE2E8B00B2ECFB950381B23AA81AA40904B5D99C9F4D5AE37F343AD1F44FA8B9022EA23BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E7358734EF69C36C4A4DC4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A5A545CCCFD24B72525002B1117B3ED696D3C1ED1FD97ACDE092B673A2F5DDD7E7823CB91A9FED034534781492E4B8EEADAE4FDBF11360AC9BC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF4CB271A66612F2B59A64366E56D27FC07FFD916D0EDB1F2B2225F23296388173673DC415E80A8BD9C56FE0738BD31C04E775F4AC5C203B22139AD299E36D9692804C44FCFFD510F8354DA1E504E663BD02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojks+hT+CyYL3mTx87366p2A==
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275FF5005910AAC18673AAE6F637C7150CBC8665C885B77F50CB3CDA4D85A49C05F82C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4A84B4964F946E17EB1A91FC540E416C17F4F1A202AC583AF049FFFDB7839CE9E725523CC1EE150EBDB950C53F653A64517F1019311735A5907FCF1D794F4B90388F69F25DCE826C8
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSqf+jS9K0O6j5f1Wbpd8t+6
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4A84B4964F946E17EB1A91FC540E416C1BDB3A1FA17F234B6049FFFDB7839CE9E725523CC1EE150EB621C479183648EDF1A8AC93268E4918B8B471ECDD3C4C2F4
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSqf+jS9K0O6jwD/ql6jfy+t
X-Mailru-MI: 20000000000000800
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

From: Eugene Lepshy <fekz115@gmail.com>

Enable the Adreno GPU and configure the Visionox RM692E5 panel.

Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
Co-developed-by: Danila Tikhonov <danila@jiaxyga.com>
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
Note:
Depends on https://lore.kernel.org/linux-arm-msm/20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org/
---
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts | 53 ++++++++++++++++++-
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
index a5cda478bd78..cda317b49d5c 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
@@ -52,6 +52,8 @@ framebuffer0: framebuffer@e1000000 {
 			stride = <(1080 * 4)>;
 			format = "a8r8g8b8";
 
+			display = <&panel0>;
+
 			clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
 				 <&dispcc DISP_CC_MDSS_MDP_CLK>,
 				 <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
@@ -757,6 +759,10 @@ &gpi_dma1 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+};
+
 &gpu_zap_shader {
 	firmware-name = "qcom/sm7325/nothing/spacewar/a660_zap.mbn";
 };
@@ -823,15 +829,44 @@ &ipa {
 	status = "okay";
 };
 
-/* MDSS remains disabled until the panel driver is present. */
+&mdss {
+	status = "okay";
+};
+
 &mdss_dsi {
 	vdda-supply = <&vdd_a_dsi_0_1p2>;
+	status = "okay";
 
-	/* Visionox RM692E5 panel */
+	panel0: panel@0 {
+		compatible = "nothing,rm692e5-spacewar",
+			     "visionox,rm692e5";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 44 GPIO_ACTIVE_LOW>;
+
+		vdd-supply = <&vdd_oled>;
+		vddio-supply = <&vdd_io_oled>;
+
+		pinctrl-0 = <&lcd_reset_n>,
+			    <&mdp_vsync_p>;
+		pinctrl-names = "default";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in>;
 };
 
 &mdss_dsi_phy {
 	vdds-supply = <&vdd_a_dsi_0_0p9>;
+	status = "okay";
 };
 
 &pm7325_gpios {
@@ -1147,6 +1182,20 @@ nfc_int_req: nfc-int-req-state {
 		bias-pull-down;
 	};
 
+	lcd_reset_n: lcd-reset-n-state {
+		pins = "gpio44";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	mdp_vsync_p: mdp-vsync-p-state {
+		pins = "gpio80";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	hst_bt_en: hst-bt-en-state {
 		pins = "gpio85";
 		function = "gpio";
-- 
2.48.1

