Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A4B3CFDAB
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 17:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E914789B3B;
	Tue, 20 Jul 2021 15:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D8489B20
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 15:38:57 +0000 (UTC)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com
 [51.77.79.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-4321.protonmail.ch (Postfix) with ESMTPS id 4GTjRg3sFhz4xZhG
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 15:33:51 +0000 (UTC)
Authentication-Results: mail-4321.protonmail.ch;
 dkim=pass (1024-bit key) header.d=connolly.tech header.i=@connolly.tech
 header.b="hlkCq9KK"
Date: Tue, 20 Jul 2021 15:33:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
 s=protonmail; t=1626795227;
 bh=t8DojydpgKrlFaF/reC4F/AKwWgGLBuBD8TTSdpGt7c=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=hlkCq9KKy2ZQ3nNdVgMg9staiv/IPPp6A0ezhebLzmGZdpKNozDStzUQ28gYP3c58
 Anwo8piiEyT67Bc23otsWBOdpduTHKIfnf5GqQqih0AvB1OSCtCrxfj2CpdU9n9PBm
 M5wKHrl0iAh3ARXiPWTsjAtEL08PmwuugbKeUiuU=
To: Caleb Connolly <caleb@connolly.tech>
From: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 2/5] dts: arm64: sdm845-oneplus-common: enable debug UART
Message-ID: <20210720153125.43389-3-caleb@connolly.tech>
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

A labelled diagram showing the location of the Rx and Tx testpoints for
the OnePlus 6 is available on the postmarketOS wiki:

https://wiki.postmarketos.org/wiki/Serial_debugging:Cable_schematics

The device uses 1.8v UART at a baud rate of 115200, bootloader output is
also available here.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm=
64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index eb6b1d15293d..e81f5cc9f26d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -19,9 +19,14 @@

 / {
 =09aliases {
+=09=09serial0 =3D &uart9;
 =09=09hsuart0 =3D &uart6;
 =09};

+=09chosen {
+=09=09stdout-path =3D "serial0:115200n8";
+=09};
+
 =09gpio-keys {
 =09=09compatible =3D "gpio-keys";
 =09=09label =3D "Volume keys";
@@ -526,6 +531,11 @@ bluetooth {
 =09};
 };

+&uart9 {
+=09label =3D "LS-UART1";
+=09status =3D "okay";
+};
+
 &ufs_mem_hc {
 =09status =3D "okay";

--
2.32.0


