Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A52261319BC
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 21:49:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A31986E52C;
	Mon,  6 Jan 2020 20:49:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-oln040092071098.outbound.protection.outlook.com [40.92.71.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D266E529
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 20:49:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bT6TWdbHggoL6v3HiOFrUGk2yW/QopX4fQdqPYoRKmwSik0NpUBV4A0tVZbltJPQ4+w26tEyy5341sWnlkELYB8rz6ebCYuL9nRqwFEJVMS6FNL/RLCwGWwJUzJ/H1utlMTbV4P5GWUZLZCBC5KXuRJGE2ENaxGlafvk3Bn2CFRzzjJqa1ttWacoCNj0WcEf4AUvYFwis5iBEEceT+XUCfKW1ejEx5pqLwlAhgVtdESrEZPXCbOuKVe70QIAjFY2h2SuYR2Vt9QldxEgG7ynCAV/NRnqNTqb0KHdKSx4RrPaDGUm64BL38mq5D3je+u2wGFqJBGXD9o4LpQLsmDlDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlD+lb2+s5vXTOJcA+vSQmtgg7NBO70nuQiMUOUpq6o=;
 b=Ns8i4Tj0W9kOJrgQNqoYjI7ujD3Qq06MirwxRwtj0DBzQBlESEArUdpf/SCdX3sWyBtcZDSSRVv5nZ7iqDpUEOgNONIThW+peaEbJ/EL1ltzUtLmoIlKqLFB8QGpI0tSmnVRj+4JRVpNvSQ7pOH0iEb7+gy+TdvNXIW9PxzxW2hT+OnEodFQ/0V9Ef9vG9qBXnCOLzt754YDdFgkFijxN7ucLYVad0C1zn4SaXs5ts2DZUbOJcXL+V8Uo88XmTY2kRuEPZF9dabH/h6WlOWkI/qHC4weKXvT6taVzXFddKmYXrHT9w5jhG4XgRc2VlkGhl9HTUYgYxt5FFF+KJkHpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (10.152.18.55) by VE1EUR03HT083.eop-EUR03.prod.protection.outlook.com
 (10.152.19.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.11; Mon, 6 Jan
 2020 20:49:28 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.18.51) by
 VE1EUR03FT047.mail.protection.outlook.com (10.152.19.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.11 via Frontend Transport; Mon, 6 Jan 2020 20:49:28 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b957:6908:9f62:c28b]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b957:6908:9f62:c28b%5]) with mapi id 15.20.2602.015; Mon, 6 Jan 2020
 20:49:28 +0000
Received: from bionic.localdomain (98.128.173.80) by
 AM6PR0202CA0044.eurprd02.prod.outlook.com (2603:10a6:20b:3a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.12 via Frontend
 Transport; Mon, 6 Jan 2020 20:49:26 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>
Subject: [PATCH 11/15] arm64: dts: rockchip: add vpll clock to hdmi node on
 rk3328
Thread-Topic: [PATCH 11/15] arm64: dts: rockchip: add vpll clock to hdmi node
 on rk3328
Thread-Index: AQHVxNLIPXNzMpgWYEWcgimerV+R7w==
Date: Mon, 6 Jan 2020 20:49:27 +0000
Message-ID: <HE1PR06MB4011274027CCF289492C661BAC3C0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB4011254424EDB4485617513CAC3C0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20200106204914.6001-1-jonas@kwiboo.se>
In-Reply-To: <20200106204914.6001-1-jonas@kwiboo.se>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM6PR0202CA0044.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::21) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:15B49EAFB42C065ED6E3AB32E3E856C0A8DD973539FB6F293B42ADFE30C0DDDC;
 UpperCasedChecksum:C9D816159C03312FC3FEFD18F8EA332F9EEACA38F463C6EA0FBFE101FB34B1BB;
 SizeAsReceived:8200; Count:51
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn: [+7aKVEjOmhORr4ffoiIFenJVTwTVf4VR]
x-microsoft-original-message-id: <20200106204914.6001-3-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 51
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: c9b8dde1-fb81-4d4f-1e0c-08d792e9eb2f
x-ms-traffictypediagnostic: VE1EUR03HT083:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PaeeUe6BqnOZeDyZED2GyezvwNnfFHemdvhAVREp+c59UwXNKNG+QSnYhK5VULxNl0vawvKcE6UAklo2Gjomn1WJOpiFdSUesuyW+9RIecCAy4PSdI65jYha8DPCFvNAKu1mL0JI31KcPnvO/AKXfqGmjeN2WYNuglaDrEOUVel5XDBbRuuxf7+1XCmWg6+R
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b8dde1-fb81-4d4f-1e0c-08d792e9eb2f
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2020 20:49:27.1610 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR03HT083
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
Cc: Mark Rutland <mark.rutland@arm.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Zheng Yang <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the hdmiphy clock as the vpll in hdmi node.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index ee4b6170a9e6..987c04abb387 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -703,9 +703,11 @@
 			     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru PCLK_HDMI>,
 			 <&cru SCLK_HDMI_SFC>,
+			 <&hdmiphy>,
 			 <&cru SCLK_RTC32K>;
 		clock-names = "iahb",
 			      "isfr",
+			      "vpll",
 			      "cec";
 		phys = <&hdmiphy>;
 		phy-names = "hdmi";
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
