Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D5CC7180E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 01:10:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFC610E6B0;
	Thu, 20 Nov 2025 00:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=posteo.de header.i=@posteo.de header.b="UtHHa60q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 309 seconds by postgrey-1.36 at gabe;
 Wed, 19 Nov 2025 06:56:30 UTC
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B3E10E584
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 06:56:30 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id A4A21240027
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 07:51:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
 t=1763535081; bh=oiYiHxqfLYxxEK1E1OWdBjrmae3U9FubleLyWwHORf8=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:From;
 b=UtHHa60qWqzK7RVj8yDZVuLQBaFhPc8S9TsAO36qOskCyx5JYOteAnMWhYdtQLD81
 R4lhcAb1KgPIJggx28m8s2jH/NQWfJnjV2FrtK9ibESdvPik1RSJnZXNyXx/UkuBv5
 EAPK2+sqLhKgMhUx80a8Gte5TWA3/hOY6QUYjHmaW4pMoJuE+X4hnjeyCUR7c5zc+w
 kQvbSFEuuONA1paHwmi8twpRwt4ogxkoQQqi07BrkDnxBv3W87QcP6M+IHna2+6uTJ
 6QpKTwEYnajQG4uoa2stn3i9UWN/dH/AM7q8PFViee6oqymxNcaWEU97+NMAGvTGf7
 ML8X7zNBV7fYQ==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4dBBw84Zqxz6v1g;
 Wed, 19 Nov 2025 07:51:20 +0100 (CET)
From: Martin Kepplinger <martink@posteo.de>
To: robh@kernel.org, krzk+dt@kernel.org, airlied@gmail.com,
 gregkh@linuxfoundation.org
Cc: kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org,
 Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [RFC 4/4] hack: arm64: dts: imx8mq-librem5: add purism,
 panel-librem5-workaround
Date: Wed, 19 Nov 2025 06:51:21 +0000
Message-ID: <20251119065109.910251-5-martink@posteo.de>
In-Reply-To: <20251119065109.910251-1-martink@posteo.de>
References: <20251119065109.910251-1-martink@posteo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 20 Nov 2025 00:10:28 +0000
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

From: Martin Kepplinger <martin.kepplinger@puri.sm>

Until we have a better solution, we need the touchscreen driver to
wait for the panel to be prepared, before it can continue to
execute probe().

A better driver is needed, so this is marked as a hack.
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index 2b1b90c6b42b8..7d010258d3212 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1248,6 +1248,7 @@ touchscreen@38 {
 		touchscreen-size-x = <720>;
 		touchscreen-size-y = <1440>;
 		vcc-supply = <&reg_lcd_1v8>;
+		purism,panel-librem5-workaround;
 	};
 };
 
-- 
2.47.3

