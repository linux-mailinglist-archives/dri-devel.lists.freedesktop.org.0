Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E49623DCE
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 09:48:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75A610E6A5;
	Thu, 10 Nov 2022 08:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A2D889119
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 14:30:15 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id C330EC098E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 14:19:29 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 5234DFF803;
 Wed,  9 Nov 2022 14:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1668003566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=07aa8e8fT8doZikfGZmbSjdF5gbvueSS4qnnav2hELw=;
 b=WF/bT8xY6heplVG8iPYA60kQYXK5xpTQmnjVVbPc8xzh7WmGRpvhCMu015ps/0Zm/zejA1
 bRDsJTvC9OumkIhRW79VmwZgb4WrT9q4jahAEZDgQDPMmUVJrcrSSy/ESpp5RwgvWOBT8X
 DLk6gV3C8qoXr/3oemLP8fDbct4oXfHnuRrC9PBPSEUi7+n/Mg6qVR8AzOGdw8eToABYDy
 6zu+rDF9vFejFMD4F/50FqvnKS++agbfO5WRegmKuxeCAnbRSr+x4vSiC/ek/1ZoQefNy6
 zOModhZGUskX91Jb/5C9xcIcCTo+mee6pTMIBIusSLhKtJIhBSquXvMuQ8af3g==
From: luca.ceresoli@bootlin.com
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH 04/23] ARM: dts: tegra20-tamonten: add label to avdd_vdac
 regulator
Date: Wed,  9 Nov 2022 15:18:33 +0100
Message-Id: <20221109141852.729246-5-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
References: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 10 Nov 2022 08:47:29 +0000
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
Cc: devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-tegra@vger.kernel.org,
 Richard Leitner <richard.leitner@skidata.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

Useful to enable it from a board DTS.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 arch/arm/boot/dts/tegra20-tamonten.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20-tamonten.dtsi b/arch/arm/boot/dts/tegra20-tamonten.dtsi
index 6d51a5572a34..703293e9bd41 100644
--- a/arch/arm/boot/dts/tegra20-tamonten.dtsi
+++ b/arch/arm/boot/dts/tegra20-tamonten.dtsi
@@ -418,7 +418,7 @@ ldo5 {
 					regulator-max-microvolt = <2850000>;
 				};
 
-				ldo6 {
+				avdd_vdac_reg: ldo6 {
 					regulator-name = "vdd_ldo6,avdd_vdac";
 					/*
 					 * According to the Tegra 2 Automotive
-- 
2.34.1

