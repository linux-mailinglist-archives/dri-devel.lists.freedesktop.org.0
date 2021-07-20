Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCB83CFDCD
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 17:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15A489950;
	Tue, 20 Jul 2021 15:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37AA89950
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 15:43:56 +0000 (UTC)
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com
 [188.165.51.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-4321.protonmail.ch (Postfix) with ESMTPS id 4GTjRs6kQJz4xZhJ
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 15:34:01 +0000 (UTC)
Authentication-Results: mail-4321.protonmail.ch;
 dkim=pass (1024-bit key) header.d=connolly.tech header.i=@connolly.tech
 header.b="D7bktiGR"
Date: Tue, 20 Jul 2021 15:33:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
 s=protonmail; t=1626795238;
 bh=RnMIEFW0cr7ror7ncy8lldAb81ApdL3lOqR9uUsxN48=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=D7bktiGRDFoTLhsP5GS5WcgNCpIZCa1yv1xYjTKuqheYL9sBaGkJoztqGM+YxuEUV
 KTGSyUUjqZDZjuysBdl94a7fKGesku8BZO6miND7p4o55m6eYRYXFXdltu9R0Ovw4e
 Syg/Q7PNoqc4eJ3ObFWPLVyNs94PZA+hjAO1iF8Y=
To: Caleb Connolly <caleb@connolly.tech>
From: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 5/5] arm64: dts: qcom: sdm845-oneplus: add ipa firmware names
Message-ID: <20210720153125.43389-6-caleb@connolly.tech>
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

Add the correct patch to the ipa firmware now that custom paths are
supported.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm=
64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 1339bac8afc2..96304f8688ed 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -406,6 +406,7 @@ &ipa {
 =09status =3D "okay";

 =09memory-region =3D <&ipa_fw_mem>;
+=09firmware-name =3D "qcom/sdm845/oneplus6/ipa_fws.mbn";
 };

 &mdss {
--
2.32.0


