Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJEOFInKc2mQygAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 20:22:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5817A1EC
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 20:22:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE0410EBBE;
	Fri, 23 Jan 2026 19:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 97F4710EBBE
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 19:22:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B980A1515;
 Fri, 23 Jan 2026 11:22:39 -0800 (PST)
Received: from 010265703453.arm.com (unknown [10.57.51.35])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 622F03F632;
 Fri, 23 Jan 2026 11:22:44 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: heiko@sntech.de, neil.armstrong@linaro.org, dianders@chromium.org,
 thierry.reding@gmail.com, sam@ravnborg.org
Cc: jesszhan0024@gmail.com, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dragan Simic <dsimic@manjaro.org>
Subject: [PATCH v2 3/4] arm64: dts: rockchip: Move RK3399 eDP pinctrl to boards
Date: Fri, 23 Jan 2026 19:22:22 +0000
Message-Id: <c7d972d07875241805db8659305b26bd694867d4.1769191673.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1769191673.git.robin.murphy@arm.com>
References: <cover.1769191673.git.robin.murphy@arm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:heiko@sntech.de,m:neil.armstrong@linaro.org,m:dianders@chromium.org,m:thierry.reding@gmail.com,m:sam@ravnborg.org,m:jesszhan0024@gmail.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:dsimic@manjaro.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[sntech.de,linaro.org,chromium.org,gmail.com,ravnborg.org];
	FORGED_SENDER(0.00)[robin.murphy@arm.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,lists.infradead.org,manjaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.079];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[robin.murphy@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ff970000:email,manjaro.org:email]
X-Rspamd-Queue-Id: CC5817A1EC
X-Rspamd-Action: no action

The EDP_HOTPLUG pin is optional, and muxed with other functions (notably
HDMI CEC), so move its selection from the SoC DTSI to the boards which
apparently want it, namely those which enable eDP without "force-hpd".
By the same token we drop it from Pinebook Pro, which already uses
"force-hpd", and according to the schematics does not have the pin wired
at all.

Reviewed-by: Dragan Simic <dsimic@manjaro.org>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
v2: Add /omit-if-no-ref/ attribute [Dragan]
---
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi              | 3 +--
 arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi    | 2 ++
 arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts       | 2 --
 arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts | 2 ++
 4 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
index 4dcceb9136b7..49c68fe65de6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
@@ -2145,8 +2145,6 @@ edp: dp@ff970000 {
 		interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
 		clocks = <&cru PCLK_EDP>, <&cru PCLK_EDP_CTRL>, <&cru PCLK_VIO_GRF>;
 		clock-names = "dp", "pclk", "grf";
-		pinctrl-names = "default";
-		pinctrl-0 = <&edp_hpd>;
 		power-domains = <&power RK3399_PD_EDP>;
 		resets = <&cru SRST_P_EDP_CTRL>;
 		reset-names = "dp";
@@ -2384,6 +2382,7 @@ cif_clkouta: cif-clkouta {
 		};
 
 		edp {
+			/omit-if-no-ref/
 			edp_hpd: edp-hpd {
 				rockchip,pins =
 					<4 RK_PC7 2 &pcfg_pull_none>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
index 9d07353df52c..3f3cb0eb5809 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
@@ -241,6 +241,8 @@ &dmc {
 };
 
 &edp {
+	pinctrl-names = "default";
+	pinctrl-0 = <&edp_hpd>;
 	status = "okay";
 
 	/*
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
index eaaca08a7601..dcab04863d28 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
@@ -401,8 +401,6 @@ &cpu_l3 {
 
 &edp {
 	force-hpd;
-	pinctrl-names = "default";
-	pinctrl-0 = <&edp_hpd>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts b/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
index a4ceafe6dd7a..80d6ea0eda84 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
@@ -141,6 +141,8 @@ sdio_pwrseq: sdio-pwrseq {
 };
 
 &edp {
+	pinctrl-names = "default";
+	pinctrl-0 = <&edp_hpd>;
 	status = "okay";
 };
 
-- 
2.34.1

