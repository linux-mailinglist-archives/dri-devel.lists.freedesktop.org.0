Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A271A38F06
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 23:25:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F031C10E5FA;
	Mon, 17 Feb 2025 22:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="VqJOYVmH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="ZnS7v2v3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="YgfephFn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fallback17.i.mail.ru (fallback17.i.mail.ru [79.137.243.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 104E610E5F7;
 Mon, 17 Feb 2025 22:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com;
 s=mailru; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=kGXruhGpCh0nQQrCuG+XL2hE9q4nvXg5SG037OUk+w8=; 
 t=1739831131;x=1739921131; 
 b=VqJOYVmHb9nhGoFtj3JZ/9SzsFghGRzt17BvN/xs+/PACrVWXU9JDrLHUYGhKk223T+LYUTBbOFvidlnOm2JlYOfmWh/1DKtstjG2H5XqWimKxy8TRpX2t7CQmVNArDHf13Yi3jMTLqgWekj7mSAcfqvQ/WLOFJeuk2GfchiggA=;
Received: from [10.113.249.75] (port=42248 helo=send55.i.mail.ru)
 by fallback17.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
 id 1tk9YP-006p90-2Z; Tue, 18 Feb 2025 01:25:29 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:X-Cloud-Ids;
 bh=kGXruhGpCh0nQQrCuG+XL2hE9q4nvXg5SG037OUk+w8=; t=1739831129; x=1739921129; 
 b=ZnS7v2v31ihIE///5eycmbEUoJ+S7VHhC8fINVvTtYvXLkjd/9cjx1CD9nR+Aq7atnxpauIh+zO
 9ORrrC8EyM6FokTqFOdR73JrtNqrw48eYOcPP6aO2n1TkjyshPYkMJVL2SAHbEHq8iZXhDGDDCpCc
 osLvzkscjLgGAp+wiME=;
Received: from [10.113.7.125] (port=56118 helo=send174.i.mail.ru)
 by exim-fallback-c85fcfddd-ztrxl with esmtp (envelope-from
 <danila@jiaxyga.com>)
 id 1tk9YG-00000000Oiy-2VWN; Tue, 18 Feb 2025 01:25:20 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=kGXruhGpCh0nQQrCuG+XL2hE9q4nvXg5SG037OUk+w8=; t=1739831120; x=1739921120; 
 b=YgfephFnYp38c+trQKCKWYzs3u9d147yaoHX3d1/0jB/d3kvveKppxQZWkLwvOCx22zY73FUfgU
 Lyu/BzBb5ZQ00j0tYnXvX6Og2h2YMpALPJRilguquZf4tMhY5+WTVDfZ4gzL+VCZRRmKVb2QkD+T2
 lNPR5fhIXY/DWaWfEGE=;
Received: by exim-smtp-844687bc8-889bz with esmtpa (envelope-from
 <danila@jiaxyga.com>)
 id 1tk9Xz-00000000D2z-3Hfo; Tue, 18 Feb 2025 01:25:04 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, jonathan@marek.ca, fekz115@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux@mainlining.org,
 ~postmarketos/upstreaming@lists.sr.ht,
 Danila Tikhonov <danila@jiaxyga.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 4/4] arm64: dts: qcom: sm7325-nothing-spacewar: Enable
 panel and GPU
Date: Tue, 18 Feb 2025 01:24:31 +0300
Message-ID: <20250217222431.82522-5-danila@jiaxyga.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217222431.82522-1-danila@jiaxyga.com>
References: <20250217222431.82522-1-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD93899CACFFF273C5956E6C16324CD68F914FC7F4F17E45ABD182A05F538085040D129D4FE0EEDA7CE3DE06ABAFEAF67054965EA85BE82C0B018405E59E443B9544787F701E01BBF3D
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7B6D8A0AF47488F09EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063727BBC20C3D5F36038638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8A9C50E1D08CE08DD6C30ED7C9CE18612A2846A2246059B96CC7F00164DA146DAFE8445B8C89999728AA50765F7900637FD2911E685725BF8389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8D23BF7408B3F9022F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947CB5C78E0E843E24DABA3038C0950A5D36C8A9BA7A39EFB766D91E3A1F190DE8FDBA3038C0950A5D36D5E8D9A59859A8B696AFF475DCAA52263AA81AA40904B5D99C9F4D5AE37F343AD1F44FA8B9022EA23BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E735F65A62F6C9828292C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A5939E330F513B5A325002B1117B3ED696B400B8635E2D23519E040399BDE4761E823CB91A9FED034534781492E4B8EEADA3FB0D9844EF8EC5C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF1DA557D659BD5E3232D7EC6F3581A3EDB8E502B87CF61AD7F7DA61847F4D16B4A0D894938C2B729C0526A8B1FD8BF66B7B8FA2B6C38C2579F965E601AD7A576D287979BE8D4DB8FE354DA1E504E663BD02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVWiyXSWEEqdrfeZ77Q9L0I0=
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275F9233EC877BA2ACDA04DE63E6493D46057B4CC2449DB6B08A97249D372E5D9BF12C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4BA09097AEF4FF40FD82BE83A5A2F87B7A1B99B042CA1CE79049FFFDB7839CE9E3D3BB30DB6F99D60862314697069CC6E66CE2A3577D1D9FE511AE71AF53545FC796D159F12476274
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZ2sfrh64bjX4GfcEsSAZpZg==
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4BA09097AEF4FF40FD82BE83A5A2F87B7D4531E66AC6DE876049FFFDB7839CE9E3D3BB30DB6F99D60AA9B7F4BDC7A08D5CACDE1DC115982577E6EC9D805F6C48C
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZ2sfrh64bjX5egAO52yjOtA==
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
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Note:
Depends on https://lore.kernel.org/linux-arm-msm/20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org/
---
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts | 51 ++++++++++++++++++-
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
index a5cda478bd78..ca9c510a49b4 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
@@ -757,6 +757,10 @@ &gpi_dma1 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+};
+
 &gpu_zap_shader {
 	firmware-name = "qcom/sm7325/nothing/spacewar/a660_zap.mbn";
 };
@@ -823,15 +827,44 @@ &ipa {
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
+
+	panel: panel@0 {
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
 
-	/* Visionox RM692E5 panel */
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in>;
 };
 
 &mdss_dsi_phy {
 	vdds-supply = <&vdd_a_dsi_0_0p9>;
+	status = "okay";
 };
 
 &pm7325_gpios {
@@ -1147,6 +1180,20 @@ nfc_int_req: nfc-int-req-state {
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

