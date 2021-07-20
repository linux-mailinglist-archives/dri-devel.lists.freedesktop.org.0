Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A16933CFDA4
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 17:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F99789C6A;
	Tue, 20 Jul 2021 15:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8EA89C6A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 15:34:01 +0000 (UTC)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com
 [51.77.79.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41104.protonmail.ch (Postfix) with ESMTPS id 4GTjRr3kxWz50MKT
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 15:34:00 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
 dkim=pass (1024-bit key) header.d=connolly.tech header.i=@connolly.tech
 header.b="I/jQhWai"
Date: Tue, 20 Jul 2021 15:33:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
 s=protonmail; t=1626795236;
 bh=XWgo5tzaR5dmJQplOfD1SfTmwFn2t+d0+Cn+rl7ZkEo=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=I/jQhWaiRYOBhX65293I4SO7cFOCf3VqEs634mhUEWvyxZI2N9r7KjC2Mxpk7JfNK
 EN1eK3EL4BZNNquIqq56sPwVO4JXRYbdO8mQIbs+VWNJNhgvIwA39NTbUbHmZnrUHA
 PiZQydfaHHxaejppVYrNrkEF7tNXyNExIFclGsnY=
To: Caleb Connolly <caleb@connolly.tech>
From: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 4/5] arm64: dts: qcom: sdm845-oneplus-fajita: remove panel
 reset gpio
Message-ID: <20210720153125.43389-5-caleb@connolly.tech>
In-Reply-To: <20210720153125.43389-1-caleb@connolly.tech>
References: <20210720153125.43389-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Caleb Connolly <caleb@connolly.tech>
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't specify the reset GPIO for the OnePlus 6T, the panel in the 6T
will refuse to initialise if it has been reset so use this as a
workaround.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi   | 4 +---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts | 2 ++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm=
64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index e81f5cc9f26d..1339bac8afc2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -331,8 +331,6 @@ display_panel: panel@0 {

 =09=09vddio-supply =3D <&vreg_l14a_1p88>;

-=09=09reset-gpios =3D <&tlmm 6 GPIO_ACTIVE_LOW>;
-
 =09=09pinctrl-names =3D "default";
 =09=09pinctrl-0 =3D <&panel_reset_pins &panel_te_pin &panel_esd_pin>;

@@ -615,7 +613,7 @@ mux {
 =09=09=09pins =3D "gpio6", "gpio25", "gpio26";
 =09=09=09function =3D "gpio";
 =09=09=09drive-strength =3D <8>;
-=09=09=09bias-disable =3D <0>;
+=09=09=09bias-disable;
 =09=09};
 =09};

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/a=
rm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
index 72842c887617..5c728c1555f3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
@@ -16,4 +16,6 @@ &display_panel {
 =09status =3D "okay";

 =09compatible =3D "samsung,sofef00";
+
+=09reset-gpios =3D <&tlmm 6 GPIO_ACTIVE_LOW>;
 };
--
2.32.0


