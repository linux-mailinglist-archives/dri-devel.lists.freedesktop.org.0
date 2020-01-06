Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEF11319B9
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 21:49:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A13A26E52A;
	Mon,  6 Jan 2020 20:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-oln040092071072.outbound.protection.outlook.com [40.92.71.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954706E52A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 20:49:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTGtOHpCIjqvEW20jKHDItiMHIqATZb1FAx4axZfqGCiHyvhiinLp4sMMwDgVkq7dYL9E+4OJkEiR6USDcxee7T8wRWmB1BpeDfNcO7/h627ipvhRyfelIKUPwQlqsDkxwoqSh7DuISrMCRW36Lh1pM53Si9lZ8d8OqDSQCpPFNOdtJcEMSNDzfPJiE7CQoY++46vQbnNd90UnALSDu+CR48CDGWjiqjXJN3+tbN8RAW7VMqussBLKnDG9uX3O2KMECc9fTUIORsAvURkairAS01k91p6ayN83oeb2lHUzhu5pUBmJPbZIRc8T9iwlOMzhc4IyG1XEWTCHuimfA5Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77VAQ6ltsxf1vmmJvDLdeb07Dja0Us6jfV4fVQe4U6g=;
 b=juiMwu79bDq8aRV5ifTWmGd/QunsMIUx0IYWwBuFIUJ/oVvwJjtrwBi40SJ7EnOsVCKLC3tFolsEy4yFpBxavC2xZaaowLgX0cPPxXNy+tVL0XiYf0MP3YRO29d5zbZeJLuGEC0LugJju55+hCAsdgNzNdhFflEKlYHrx4f4KT/HHlmr7RKiU11LLda18ZF0c1SzW9tPFbN3N89an9jINDONdJbIBYGyODzr+LbYJYgojc2DIeXVmqPk3mriTOZO34AAziZUquOGn/pfADecnySbJ4TRLHBXKm2fPy5aCFtXaZXQKYQRec/q4sV3S3pSSscx0GEt1Hz0E/Muu5YZ1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (10.152.18.56) by VE1EUR03HT174.eop-EUR03.prod.protection.outlook.com
 (10.152.19.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.11; Mon, 6 Jan
 2020 20:49:26 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.18.51) by
 VE1EUR03FT047.mail.protection.outlook.com (10.152.19.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.11 via Frontend Transport; Mon, 6 Jan 2020 20:49:26 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b957:6908:9f62:c28b]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b957:6908:9f62:c28b%5]) with mapi id 15.20.2602.015; Mon, 6 Jan 2020
 20:49:26 +0000
Received: from bionic.localdomain (98.128.173.80) by
 AM6PR0202CA0044.eurprd02.prod.outlook.com (2603:10a6:20b:3a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.12 via Frontend
 Transport; Mon, 6 Jan 2020 20:49:24 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>
Subject: [PATCH 10/15] arm64: dts: rockchip: increase vop clock rate on rk3328
Thread-Topic: [PATCH 10/15] arm64: dts: rockchip: increase vop clock rate on
 rk3328
Thread-Index: AQHVxNLI2YBBKIutH0iqNWK3NiuMSg==
Date: Mon, 6 Jan 2020 20:49:25 +0000
Message-ID: <HE1PR06MB40111D34406A43C1472C4B3DAC3C0@HE1PR06MB4011.eurprd06.prod.outlook.com>
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
x-incomingtopheadermarker: OriginalChecksum:F6A0113E209C19C1AC0E3B9BA6059377FE0A1BA6DAFCCC1FC9E6DFF6D5DD8E42;
 UpperCasedChecksum:40E4EED46AB85A325DD5358FDB91228939631B74F028AC975E6B3F15FBF5E7B5;
 SizeAsReceived:8189; Count:51
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn: [KYN4liLaYG1opX/u099oZRxdPkq4XUs+]
x-microsoft-original-message-id: <20200106204914.6001-2-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 51
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 5bd42f31-0839-4153-9c2b-08d792e9ea2e
x-ms-traffictypediagnostic: VE1EUR03HT174:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BBZByNdeeRdLfcVNBVcXl/LAqbRBFZKDgp0DQNfaUvfFGeZheGTQ12pL2Sc8sxZ0bBdn5GcAhsyo9N2y2zNvOGyofZIugS9ySNjN7iR7DIgH7SdkOSEfNCU4sQ8vLN2+jvFzoVeYIg871K6LcdD21HjGMTJR46lFHjL8oHDbNFsGcKKnXkLsnGZG++UdM5jt
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bd42f31-0839-4153-9c2b-08d792e9ea2e
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2020 20:49:25.9547 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR03HT174
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

The VOP on RK3328 needs to run at higher rate in order to
produce a proper 3840x2160 signal.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index 91306ebed4da..ee4b6170a9e6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -786,8 +786,8 @@
 			<0>, <24000000>,
 			<24000000>, <24000000>,
 			<15000000>, <15000000>,
-			<100000000>, <100000000>,
-			<100000000>, <100000000>,
+			<300000000>, <100000000>,
+			<400000000>, <100000000>,
 			<50000000>, <100000000>,
 			<100000000>, <100000000>,
 			<50000000>, <50000000>,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
