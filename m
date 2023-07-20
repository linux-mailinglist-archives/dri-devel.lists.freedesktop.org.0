Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BCD75A75E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 09:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FFC10E569;
	Thu, 20 Jul 2023 07:10:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2080.outbound.protection.outlook.com [40.107.7.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F1610E56A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 07:10:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TXUrd4ejqhis5UckhtWzwGlhritMHQs8j4ffvw0zBKTSgWz0oXeU02Ur7ZEhu8zJhevriQffJZg/ar3lj1mxsJSbWSzPPJSEwKyD9lK742O1DfSxifHXpGFxOFInUZW1iSaWFI5cPR/QrtZCfklliSC85wzvJgy3R4FrA9MDYH0pToWGRFI8w0LF2vVkLni71N3FeW2NtUTIMBg/DvKZMitwpsn7YCWvyS4ZEDAFZ9HWL6LSs4GYz3KxvDE3DOSYXlek9tThFiq8u5Gxr4QS59Mp/OWZuV+x2rqI6RAQeLAc9R59pQLCto3OHT3iJD5dF2A+h85gqJMgdZvve5R4Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgdLuqLE8xkkaSAA8nXeHcktITpl/jG1NAKvXK04ASA=;
 b=MrVLVqgZxNIqYZG2uH98uQerPcii7mrUj+A82MOvdoVvSZs8tPzqJVAiTP2EA9kilaUJajIxtEkfGnLFRCa8gtnGNHGR7YO/F2//nfzZjHHf3kf/QpnmPvRMXTBxf2qsBh3+xvd29avY49p1BlQnkxN8X41CxL4vWJuW4Mpb5frIdhI4CjPYKu/j0QzwKdNaaO+PHaI4DQd592X2RKabfXfkKljeeBdYwC9X/hlUk6SplpeE7a5F46vHUwTp8s9mdbrezxDHWw7o6OVqIfbltzlKHjEfEPN7PyUO30FIA75v8+aXrPNs9tAQxEyCkWAyPjzES13okWdzoGOYKYFrMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgdLuqLE8xkkaSAA8nXeHcktITpl/jG1NAKvXK04ASA=;
 b=QDXfT9q4sbJ5CoGM2IylizhfnZ4MsMB50r7j2QtPCdTZS70YY3dHofuyHZ66qDnk+4Onap5LOGoz3/9rsv0gFonzgx+olkUr+uXpDp1G7fiKIP2vkNeELL/4t0h/+AbLAUjMYyUUub258XBmLPPiSI4/rM36bcowid9kt8juizo=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8415.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 07:10:13 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6609.022; Thu, 20 Jul 2023
 07:10:13 +0000
From: Ying Liu <victor.liu@nxp.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 4/9] drm/bridge: synopsys: dw-mipi-dsi: Add mode fixup
 support
Thread-Topic: [PATCH v2 4/9] drm/bridge: synopsys: dw-mipi-dsi: Add mode fixup
 support
Thread-Index: Adm62To2Cn6X9/VuRkilIYeiuTcrbg==
Date: Thu, 20 Jul 2023 07:10:13 +0000
Message-ID: <20230720071430.259892-5-victor.liu@nxp.com>
References: <20230720071430.259892-1-victor.liu@nxp.com>
In-Reply-To: <20230720071430.259892-1-victor.liu@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SI2PR01CA0039.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
x-mailer: git-send-email 2.37.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|AM9PR04MB8415:EE_
x-ms-office365-filtering-correlation-id: ad9bd8a4-cf9f-49a9-cc0b-08db88f05cb9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3h3GxtG3W8DgLyfu2JKJKPt0E8qtKzo+cGPoxhENR5srIOBPChQemFm/BsiO5JUiYHpfcr1TulPeAo0tpT1swqdqLY4UFBdynzIbDPR5imanDkQuiHnnpQ2NEUlCpFRTiWUkEVTkg9YA15vnhrUDW0ehyPRiPVQo6ipA5tWhHlIYVeLetehXByDHO5UOnv7fiSB90fxywYJhQSmcZtKDJBtLCsfDqSD086sIdC+83yeTF4jMMZWRPY9CezFQl3NTBK2jym6/ExXcC1QLUYXXnCIlfc14nVLV9CZ1pyjX3qLSEMcYq19UIgBCEO7j74d2L53iyL0JKjW05Y50uwcD/Ljui06/Lz025ybp8riYX9h/SWxrDyFG6BB+7v1cuUA9N3svXn56fXsX23Wd7U7Rnr3g7xg+KuMpLF+dx8+S7Qb8+GpuoYMnUwVC8xi7eEGgCxNV5trr6V/sXC4Lwpu3j6sfbqHbC4sZnu3SvbkKAudbxQ4WfyjQ+Q9NJMalo1WkNEoORYZ1n7Grd4AhGNHYbjRxuejaC+x7+ezyNrB7MXLqEwwdxYLsjrhTXafNUiTvoxlJMuj+bWV171fwYSzd/GkXMq/x0HiKs1mi/kils9EOxOuGp5axP/mwfsolFc6f
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(451199021)(6506007)(478600001)(1076003)(26005)(6486002)(52116002)(2906002)(6512007)(71200400001)(4326008)(5660300002)(66556008)(316002)(66946007)(66476007)(83380400001)(66446008)(54906003)(110136005)(64756008)(38350700002)(36756003)(38100700002)(7416002)(8936002)(8676002)(86362001)(186003)(2616005)(41300700001)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?fUnnwH19Vl9o+ETWOiFQHqrFx9mSPQUopd/yG7fE9dJkf18y4iumn1A3DA?=
 =?iso-8859-1?Q?XSLJuQ8zZ2mOI6Kapwf08OUQ+OY2chOHEwEMkK/7pejMGGV+KgMXcGCrNm?=
 =?iso-8859-1?Q?unzNSGuvC2AR7FaIorIaQMpnLaTht3WeIcPe/xoS9mHPtXRy9p8Pwea+yB?=
 =?iso-8859-1?Q?i3tv/YYUjoXqR8dpztUqUWyQ2oy/IGa8XiB8uqNZ+UOV0LwWff3UGndDeg?=
 =?iso-8859-1?Q?UJ/6K1CyWEt8FAgmepM5glGJPFPZTqn9zPEkCaG9t1SfPqHxPRAU7gn3IN?=
 =?iso-8859-1?Q?6JW8dsX8bZi//1BkBA5OXaUbyEYBF3dEmvWWWImtyICdp9i7UkeqOXFrkJ?=
 =?iso-8859-1?Q?UTYeON3LAyNZYgYCHtPt+ecvvH5tnyr6NAhxw76HTv91astkglHQw8bNAo?=
 =?iso-8859-1?Q?AvmDHPSfrTVbGBKSXvQIXd7vMHx8LQRBWb1IgSoqRALhXw6DpyCGRviSYI?=
 =?iso-8859-1?Q?Z5dpTXqb5qvpd0NKOn3cflQ0Ei3zyp2LMlXlQvzu6QjVXLsdXeWar0TsRQ?=
 =?iso-8859-1?Q?qou4yMWVGO78i9iIaK/Banvw1MbyOBUUUh1CvPARmNdN2ST5bdb7tmRlYx?=
 =?iso-8859-1?Q?iACiqQB2n/IKggaNwHMuUyThsypUjrmUgeAgulj9NwMLCx8eJmtOy/9Rkt?=
 =?iso-8859-1?Q?175wMkm/tkIi3BxfUXIS2hF2XlK0bJw38ykwtQPdj/dXv52q9JObSJrdks?=
 =?iso-8859-1?Q?uHpq71nCHhDBK9pcUUI4GmNNscR4w2PfxX+JPqgdVfwqVR+ixM94gJF37C?=
 =?iso-8859-1?Q?lFezf8XRURa/6rBAyTrUadDbNuE44YQWmTUUkzVwWU/D5qqR+bDV7k+PHq?=
 =?iso-8859-1?Q?6Kcx/4xtiBirFUPYsrXIIJiMWF035O7XUwZz4W8asXfG+7Agy2gymE5e/c?=
 =?iso-8859-1?Q?7mt3O9wSslHrQOkFoqpFseNm8baHvYtOjpv2/M/AGwRQPa7AnN/6mR2TUj?=
 =?iso-8859-1?Q?XZdG1TU/I6XY8ifiMQYz1Cz7lobQqYDRnZcN75i3PxaESHR7FI/vSjPsRg?=
 =?iso-8859-1?Q?zbmo302lF5PDJKZ68SPaRqIY0rjClbJMJ2JDcrttUh7vFzI34phyvOsrBF?=
 =?iso-8859-1?Q?2iLwsQRqbOUHV31wPGW09u/eNzG90jU3SF5op4Djs8DiYSq5gquSXsGb2F?=
 =?iso-8859-1?Q?JVcZMPh0lQQjxdl5pNuKblcsMIY+MzYsI7a5i9WEKIMmCI113AR8Ve9Zxw?=
 =?iso-8859-1?Q?Jr9h3IEHuAmYA2xMMC0/t/yfNGYD9fN32TH8z+7TJpGtLr1bJOvsziw003?=
 =?iso-8859-1?Q?oE2WfmoNLris1NKC7NTxU0lOOhP3V6YuE/9o28u7Ue0K0vUXbr02LBh3aq?=
 =?iso-8859-1?Q?LbYBf+XL1q8gjdo2IdjmzXPgJf3utaVzP0772qm1w3OstEn2qUw6MgRyP3?=
 =?iso-8859-1?Q?9H1r3szxgrxwg3SO6ZwOV6k+Ueu3bGE5INxHSzqjyOopK9NTY4SoWmxub3?=
 =?iso-8859-1?Q?X/aFTgdGmMfnvstahtLLlV3G1FrZ83z4NVQfHnV5t0UyCJjJ8pJe4jeezA?=
 =?iso-8859-1?Q?xt/c8AZSqmgDoLFQ5N8hU2ennRo12Y9QlUZafhIgAiR5Ge5X0lvWnKAq56?=
 =?iso-8859-1?Q?04snxgECMOEE3nOay3Cxu0YkI/kZ0PkVUUhgeFCd/pmv3+DMxmXqKNFrSQ?=
 =?iso-8859-1?Q?BF6mJaNQdOFWk6DildLkqWom5IeVPlZj2O?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad9bd8a4-cf9f-49a9-cc0b-08db88f05cb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 07:10:13.2006 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MA2n+jmJqevDcuzSqVzyevZDjt3CmV/BNHKC4onKtYxsGtLpwjbzxU+zo520BCWjdfdgH9ZbN+hEAvJBCyrXRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8415
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
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 dl-linux-imx <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Vendor drivers may need to fixup mode due to pixel clock tree limitation,
so introduce the ->mode_fixup() callcack to struct dw_mipi_dsi_plat_data
and call it at atomic check stage if available.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v1->v2:
* No change.

 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 14 ++++++++++++++
 include/drm/bridge/dw_mipi_dsi.h              |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/dr=
m/bridge/synopsys/dw-mipi-dsi.c
index 8cd89a63b5f2..c754d55f71d1 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -571,9 +571,23 @@ static int dw_mipi_dsi_bridge_atomic_check(struct drm_=
bridge *bridge,
 					   struct drm_crtc_state *crtc_state,
 					   struct drm_connector_state *conn_state)
 {
+	struct dw_mipi_dsi *dsi =3D bridge_to_dsi(bridge);
+	const struct dw_mipi_dsi_plat_data *pdata =3D dsi->plat_data;
+	bool ret;
+
 	bridge_state->input_bus_cfg.flags =3D
 		DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE;
=20
+	if (pdata->mode_fixup) {
+		ret =3D pdata->mode_fixup(pdata->priv_data, &crtc_state->mode,
+					&crtc_state->adjusted_mode);
+		if (!ret) {
+			DRM_DEBUG_DRIVER("failed to fixup mode " DRM_MODE_FMT "\n",
+					 DRM_MODE_ARG(&crtc_state->mode));
+			return -EINVAL;
+		}
+	}
+
 	return 0;
 }
=20
diff --git a/include/drm/bridge/dw_mipi_dsi.h b/include/drm/bridge/dw_mipi_=
dsi.h
index 246650f2814f..65d5e68065e3 100644
--- a/include/drm/bridge/dw_mipi_dsi.h
+++ b/include/drm/bridge/dw_mipi_dsi.h
@@ -59,6 +59,9 @@ struct dw_mipi_dsi_plat_data {
 					   unsigned long mode_flags,
 					   u32 lanes, u32 format);
=20
+	bool (*mode_fixup)(void *priv_data, const struct drm_display_mode *mode,
+			   struct drm_display_mode *adjusted_mode);
+
 	u32 *(*get_input_bus_fmts)(void *priv_data,
 				   struct drm_bridge *bridge,
 				   struct drm_bridge_state *bridge_state,
--=20
2.37.1

