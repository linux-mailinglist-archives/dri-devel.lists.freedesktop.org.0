Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BE01319C6
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 21:50:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16FA6E52E;
	Mon,  6 Jan 2020 20:50:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-oln040092071074.outbound.protection.outlook.com [40.92.71.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073126E52D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 20:50:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/5LVAHRs2ANxyBBxL82u2qcJ9tESFgwN22pf+xRBaMy0eQCMCmg9eMlCw0PXFKJnsHXMMiAdDNN48y8XwBtVrJdvwxO9iToDf1vxo0jUin9O1bSpJAc0ZZgNRaWi64MaBuM8GImM+50bT+l8VqyG00p5wlXSDCH4aQCHIboCz+AvwcB3BwLsIU0mieWoE4aQqIyF225B6QzEapNDD6TKO8vJlBvTt3ZdlPrDkVjQiLTY+PQSq6qYYyauWQ8Zk2LxsZoOQEMjgKLbt/8NnEsoE9XON7Ku617rSRlu+USyFOyFKUKypvs4Wondfz+myriwMqVPHWwC20yXzHzWwjIfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6V5qZ3BLDsY5ZJ+/GBz7fZOIdR1W/HViPFPKwEn5S4=;
 b=HBlBF7aVe0Chh59ooipxeIlZoFA2P3YueepG4J2N5cWrSSduRdOzlxT7C6mTceZ4/MdgHE/Dkc6Z7QaHWbZz8bNbYa1zJNIsRum8xaZHRB+khiD3ANABHueUw4yY2VO9ZgkYJD9N37CGlfRKeM5cRuVYANClaJV8WLMgV4SToIZXoS7OXPXC9gCUGTBNZIpzuHFs+chTD0DfqPSumDyhWeLuOUvhK/IvKmYjWx1keEt1QafFcZMG6mCcxzfqnOIFkETXdJCghyKF1I5t7CURypehRJn66LEcXDJJsUeWf4M1ZdojDWnR0t4AONg6U4b3npl4hmuUgYzZ6lAYtOQJ6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (10.152.18.52) by VE1EUR03HT089.eop-EUR03.prod.protection.outlook.com
 (10.152.19.172) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.11; Mon, 6 Jan
 2020 20:50:01 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.18.51) by
 VE1EUR03FT047.mail.protection.outlook.com (10.152.19.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.11 via Frontend Transport; Mon, 6 Jan 2020 20:50:01 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b957:6908:9f62:c28b]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b957:6908:9f62:c28b%5]) with mapi id 15.20.2602.015; Mon, 6 Jan 2020
 20:50:01 +0000
Received: from bionic.localdomain (98.128.173.80) by
 AM6PR02CA0026.eurprd02.prod.outlook.com (2603:10a6:20b:6e::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.12 via Frontend Transport; Mon, 6 Jan 2020 20:50:00 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>
Subject: [PATCH 14/15] drm/rockchip: dw-hdmi: remove unused plat_data on
 rk3228/rk3328
Thread-Topic: [PATCH 14/15] drm/rockchip: dw-hdmi: remove unused plat_data on
 rk3228/rk3328
Thread-Index: AQHVxNLdI/v5kV7XtE2WFpYckKZiBQ==
Date: Mon, 6 Jan 2020 20:50:01 +0000
Message-ID: <HE1PR06MB4011E3DE63A9D47B602A0F16AC3C0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB4011254424EDB4485617513CAC3C0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20200106204951.6060-1-jonas@kwiboo.se>
In-Reply-To: <20200106204951.6060-1-jonas@kwiboo.se>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM6PR02CA0026.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::39) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:B80BE38B91D81950F8B1DD84771B58E12A0CBC4A3A7D42376EE097957CE4E0C0;
 UpperCasedChecksum:02FBEF99D71EA8A94B7B0BCD5E3C340731B9FA711987A70BF32C11A1FEF431DA;
 SizeAsReceived:8220; Count:51
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn: [Qx7uH+y87w7hX4GBi6h2tRk4KCkveSi8]
x-microsoft-original-message-id: <20200106204951.6060-2-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 51
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: a5ddcf99-20b8-4d53-9cde-08d792e9ff8b
x-ms-traffictypediagnostic: VE1EUR03HT089:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uhdwUtJ21aRZGI7UJKNl8kXkl62/aIVovVVw5BU/YEO13HXzc8kboooMpYLz9m1KBiAUqsCShVLSqMmRencJZ9pukqPf0cn0F9uzDRtQKf3fM3Lv/bz1/9Ta/CGDUjk0IVEqjE0vyvq36mN1dJ22p80cPXcqi7lqO8jQhR3oDGfCPkVmQctmP9gIHzAE5kb8
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ddcf99-20b8-4d53-9cde-08d792e9ff8b
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2020 20:50:01.2527 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR03HT089
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

mpll_cfg/cur_ctr/phy_config is not used when phy_force_vendor is true,
lets remove them.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 66c14df4a680..a813299e97a2 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -443,9 +443,6 @@ static struct rockchip_hdmi_chip_data rk3228_chip_data = {
 
 static const struct dw_hdmi_plat_data rk3228_hdmi_drv_data = {
 	.mode_valid = dw_hdmi_rk3228_mode_valid,
-	.mpll_cfg = rockchip_mpll_cfg,
-	.cur_ctr = rockchip_cur_ctr,
-	.phy_config = rockchip_phy_config,
 	.phy_data = &rk3228_chip_data,
 	.phy_ops = &rk3228_hdmi_phy_ops,
 	.phy_name = "inno_dw_hdmi_phy2",
@@ -480,9 +477,6 @@ static struct rockchip_hdmi_chip_data rk3328_chip_data = {
 
 static const struct dw_hdmi_plat_data rk3328_hdmi_drv_data = {
 	.mode_valid = dw_hdmi_rk3228_mode_valid,
-	.mpll_cfg = rockchip_mpll_cfg,
-	.cur_ctr = rockchip_cur_ctr,
-	.phy_config = rockchip_phy_config,
 	.phy_data = &rk3328_chip_data,
 	.phy_ops = &rk3328_hdmi_phy_ops,
 	.phy_name = "inno_dw_hdmi_phy2",
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
