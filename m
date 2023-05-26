Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 576DA713A41
	for <lists+dri-devel@lfdr.de>; Sun, 28 May 2023 16:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A8210E0C0;
	Sun, 28 May 2023 14:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 364 seconds by postgrey-1.36 at gabe;
 Fri, 26 May 2023 10:14:51 UTC
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E69DD10E7D7
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 10:14:51 +0000 (UTC)
Delivered-To: uwu@icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1685095692; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=n9HFZ29iB0D4ZHN7ZdUVSCswnEcN/UNexS3aoI1Yz2+1cHwPKZiHQROMYP1q64ti1nrAYFL4FtWF9RJ0z0vd3CbrE5EgmsBaz8INGnuV6SjUn2Sz9k1aqq7+i/7iF/lWk5e3wC60Mt1T0MUTsvS0xnpLLzOogj1prOgpylNACas=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1685095692;
 h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
 bh=/36U8f2hjbE2m0TYdKuQASmkYLFLFD+eCwO3lexS9zY=; 
 b=RPXX4Yg2itYXA6bLdwJl9tRcJtGYTkTd0UYmHmycMYJ/Kz5vFxKOwGcqQq/GvMzC7iA6glX8LDWtPUM5EmoGUn65Jt6IenV1Ksiu1M6MJDE/tUEMjYBUOL2CnkVRaNH04sq3iKTsIoOj1SI3OpLfanQERKkl01L1pxN+HII/bNg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1685095692; 
 s=zmail; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
 bh=/36U8f2hjbE2m0TYdKuQASmkYLFLFD+eCwO3lexS9zY=;
 b=BwM+5zUvstNWV/orBTuDw3hsvQtHGsh7+SViYivwuEx8j+JHLknxVHiEBSjz4QpJ
 rDKYfcRb9jipvQQHQBLvtwLvwu0pJDde9swvzN6YIOHqbARApUafOVuwOdga5jg0/6g
 6oMDtzIq/jkzUFCogHHhBAUR630ATbETKfk7w9KA=
Received: from edelgard.fodlan.icenowy.me (120.85.97.71 [120.85.97.71]) by
 mx.zohomail.com with SMTPS id 1685095691240276.4832447024337;
 Fri, 26 May 2023 03:08:11 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] arm64: dts: mediatek: mt8173-elm: remove panel model number
 in DT
Date: Fri, 26 May 2023 18:08:01 +0800
Message-Id: <20230526100801.16310-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Mailman-Approved-At: Sun, 28 May 2023 14:59:32 +0000
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
Cc: devicetree@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently a specific panel number is used in the Elm DTSI, which is
corresponded to a 12" panel. However, according to the official Chrome
OS devices document, Elm refers to Acer Chromebook R13, which, as the
name specifies, uses a 13.3" panel, which comes with EDID information.

As the kernel currently prioritizes the hardcoded timing parameters
matched with the panel number compatible, a wrong timing will be applied
to the 13.3" panel on Acer Chromebook R13, which leads to blank display.

Because the Elm DTSI is shared with Hana board, and Hana corresponds to
multiple devices from 11" to 14", a certain panel model number shouldn't
be present, and driving the panel according to its EDID information is
necessary.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index d452cab28c67..737737528eed 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -285,7 +285,7 @@ ps8640_out: endpoint {
 
 		aux-bus {
 			panel: panel {
-				compatible = "lg,lp120up1";
+				compatible = "edp-panel";
 				power-supply = <&panel_fixed_3v3>;
 				backlight = <&backlight>;
 
-- 
2.39.1

