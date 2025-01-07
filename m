Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDFFA0437C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 15:57:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A6610EAE9;
	Tue,  7 Jan 2025 14:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="KNNmTEPJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2058.outbound.protection.outlook.com [40.107.22.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D373710E71C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 14:57:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n6KmiMWMe0PnRDk6u0fT9VG5Ia6bkpBjH/pJpm869jqVULlg0RuMjVRBfBiMnCkP4p8kPiSYyguqugEe+KtWsmyFuuzqMWXeh5yiU2pHacTNc4WqXp8FTOZO5ZSmmGP0veD1aB+2NjDefSY1FEKUU3nRf9lktezMsIZrvaoZhWrtg3q/v23q4gxK4UvUQSFwt8FKCakvHEtlJDvzETL/+PqJ8O1wr800udrU4v4MqMBKSsWc59ty5ggIj9nW6RWx0dYVfn4PZgINPl5PEufuGEpA9nxXWOI0JEPJsg/aLLX3wqEropRcHJYMRU+5KKaZuRraOr0AHqZD75ZeFjdLeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWZBalUbL5FQUMfhe76loyd44YXEqrndkxbvkp2pHf0=;
 b=t584VbLBeoqtXBQRVh+F+36chd8SVvBGi/Brhu7cwpXh4MIYKgSq920fd8f5+8N/GRuIuFFxSKkNF2rT4oU30U2GLjPf+1y5OM7oYMJiml26mSEidNgHSletiic36YOcrTczuz37r53B2CtvfhlmmshbP3Utm/mdAAbDhXSQ91IuT1IuiBPDcjoLl+CGl9WH9Bqe+iLGqoD7IgBKkLWhRMhqLyRXYV4njWpO7+kQjrM7ID5HNVWKmgU6zCJ5Z6v1gvEDp4i9jBZE0ChkHwI+JsJg4rtFKZbgyuc/PM0Z+kQXPbyibpiywbWWOsnZw0+3koz8cyCcC4OBmX7RoJpRSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWZBalUbL5FQUMfhe76loyd44YXEqrndkxbvkp2pHf0=;
 b=KNNmTEPJut4pYcl5b6A/leCf3X4jDcU3Jjabvy9JoY5nhrBylZNukAJy22x9dKiHxMhtwznXI5Nmo7sCqPRiYqUpMDOIRg3zS+aKI/DK/Mx1OIJgxpSHufXWwG8h56r4NGsKkWFMqMEt9FEW4ln/w2OsvJij2xBGnUdDvk0eQGCAhhcAhyUVqqUUW6i12nC6mBaTfULw/fpZ8XBH16aXYdq0Pokqq6EK+5XiKmF25PWG39qdOOkTdqu6psnueHBSj7qgf1jebi6LECYO2UQ/e7fWbK+ziP3awGVIQLFOnv0XaWkIhKXeBq9IH/M6sIvF8EMOx7uY/J5pwteVPJWMjA==
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DB8PR04MB6986.eurprd04.prod.outlook.com (2603:10a6:10:116::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 14:42:57 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%3]) with mapi id 15.20.8314.015; Tue, 7 Jan 2025
 14:42:57 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
 <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-phy@lists.infradead.org"
 <linux-phy@lists.infradead.org>, "mripard@kernel.org" <mripard@kernel.org>
CC: "kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx
 <linux-imx@nxp.com>, Oliver Brown <oliver.brown@nxp.com>, "sam@ravnborg.org"
 <sam@ravnborg.org>
Subject: RE: [EXT] Re: [PATCH v20 0/8] Initial support Cadence
 MHDP8501(HDMI/DP) for i.MX8MQ
Thread-Topic: [EXT] Re: [PATCH v20 0/8] Initial support Cadence
 MHDP8501(HDMI/DP) for i.MX8MQ
Thread-Index: AQHbUFBYEMByPt5N/EC0iD35ugqWV7MLCy0AgAAAWlA=
Date: Tue, 7 Jan 2025 14:42:56 +0000
Message-ID: <PAXPR04MB94483B3704FB62E12A009390F4112@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1734340233.git.Sandor.yu@nxp.com>
 <2381464.ElGaqSPkdT@steina-w>
In-Reply-To: <2381464.ElGaqSPkdT@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|DB8PR04MB6986:EE_
x-ms-office365-filtering-correlation-id: 53e0ec4b-0ff0-4829-fcf3-08dd2f299365
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?fGGxleUj0BDlzkG81YDZGTOF3UPjqp/+R8UvLXFHTvDyf5Q2DhpF2/Z8vB?=
 =?iso-8859-1?Q?LKpxnT2EZTCsdRhL9BIewD4c278OA1yeZPcIucEPIDUzMBCtYvU+qpGnI3?=
 =?iso-8859-1?Q?PFhmUCO1Vpw9FFnhbOlMQ6bqw2+ej8pWwuWsaY+CNaLdapb/xGqxxZO2ux?=
 =?iso-8859-1?Q?VMMD7xkNs1mn7kcoEqJmG2TfD0dRECGlrvsL2LLmMFPUk4OVoK/UCKXnXD?=
 =?iso-8859-1?Q?qg2hr/zsu0KyQgR0dAZmJQ6lzu2uE1/O6HK5CqG2FmDeFiK6qx/by5fBv6?=
 =?iso-8859-1?Q?jde+mpoQ2eFH5gKyLGy5XGB+75p5gKSJ8rNDYbrWGC5wlK0NYRqfpbLpPD?=
 =?iso-8859-1?Q?bswrYDjp6o8FfhiNlOPM7QqfwciESy3BO9R2SFANZAmIys4ewMjtIlE7S8?=
 =?iso-8859-1?Q?aL5zTf8/marXS+uXDNnc0AZxyDzHwDK5+qexblAAopm7uA+kpfzRC1DwoW?=
 =?iso-8859-1?Q?z7cfBVrrbIkWuHKEovwHb7+olUxZ6hJtA6QoQycHz0Q7ShuX1VXKD+qWJs?=
 =?iso-8859-1?Q?h/o3QLyvUQj6DeM3kd3ZqaXz3XTqAoly9sPYo2/Wt7B8Zd2MbgE7yApJ2+?=
 =?iso-8859-1?Q?bpqadnJ9SmDSkE+eseo+17tigQ1bXX1ra4KnX+hfFzg6D3+cnlA0SiyHde?=
 =?iso-8859-1?Q?nYEy6KhLapZHyTcPNMREmH8pEgcLcRWfQ+AMaBEwoQhsREpHkEHWqqbseY?=
 =?iso-8859-1?Q?M9SLFHnIT52HaByg3pqVRS6Wm33Gn28FmuIHZeKTvDNx9Qf0MXY4n4IbYJ?=
 =?iso-8859-1?Q?Y2Y03HWKhAK9uOM9fYJ0XQTTfj5HMYqn9itY/GdXaySOXrxj6qn+KIcptM?=
 =?iso-8859-1?Q?3tHQkc3BTMWQHkb3Gf7MV2H0I6y+24LlSuV3EH8HQoXivtg585C5/opITW?=
 =?iso-8859-1?Q?Q8JZLdRL52s6eqdl5Ge5q/S8sP0REJi0UvEx5V9PNhhK8rSoh3rkNn0GV/?=
 =?iso-8859-1?Q?DZewKFWjVqOjoEakNHAGlsaSc4h5Zezsdk6bdLsY0LR5mjHTjHUaPYW+8Z?=
 =?iso-8859-1?Q?P6b5si5upZ1nO1jXAmEV0ThEdMoGy8Q0Zj4EK0OOFrsJQYCvNB3t4STGYS?=
 =?iso-8859-1?Q?Qi4IPTeiZV6OnVNxRxY+0k5TObIVtdp1SOQpp7xxOIFDJyTAu6xbW9ahqM?=
 =?iso-8859-1?Q?bTXNQBtPakVPLcOIKGpfMC1dDOZaebuEXYdlLduoOhgARCa/QEF0BVOc31?=
 =?iso-8859-1?Q?Q9mKYl+GARGqVwdslqJskR2IzHOKX9pyv+/yo4O7km90BXbzyDKBcY6wo3?=
 =?iso-8859-1?Q?m6TBQvioLHtNsr8Kem3C5h9T3RiiaQhG64rNI60yz7vYXYqXA657qw2nkC?=
 =?iso-8859-1?Q?iX8lylkvF8HGxUWM6ASUpdVQtiw//4Y2mNpkROeEg2mLsrk9qEyKVqrvyC?=
 =?iso-8859-1?Q?ALptbdoR2nVfTXN9F93erRuq6Qo7g57fitdNh4h8GCg3IkuXrH3mBjzDhE?=
 =?iso-8859-1?Q?EfVZ3tOJ9IGhMU2t6xiXCpGEexAVcIWSfY49aw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?g352m904vjqJQdG1H5DAmBJ4fSYV7P8RMePP/F9qfZ9+QXnmMVoDXsQN6b?=
 =?iso-8859-1?Q?fZ5YLCMnrTIUvYXpJ82BpB/0Kra5sFXyrUdA2BqSmBWeHi4cr8cm1qMDjF?=
 =?iso-8859-1?Q?pxzHSiyAqBe4DbkVToTgdEIJL5oAfdx/h2DZOUPg3k0PlKOIErLibox/eA?=
 =?iso-8859-1?Q?F/Wu174rE8wS9IfrVtyNHv/fJHVxXR4TYkoqbceQy+Iw/rSOtyDZk5LNt+?=
 =?iso-8859-1?Q?60D07raCqACgqWkvHUvTxNXxTKq/tu+cc8PZrwin3tVkofzMigJQ8Z7sJD?=
 =?iso-8859-1?Q?zpDXbJRI8JpF4oPA5JcusioAP7mHgi3DoHILuadGG+uJVOwlFsTzTx3tnL?=
 =?iso-8859-1?Q?LnS8W/HFS55H/2GYJoeW0tdpMxGytak75NJFpp/tPf0cckHG1PTqo/jdjS?=
 =?iso-8859-1?Q?s6hejVMZmzJyd251+pJXKZV1Smpzk+NYYtdEHX6dQd3xgqFZVDOX3UcOXO?=
 =?iso-8859-1?Q?Jncobcjff+OO7N22UgEmptXTbXlqpAlDCIk/oyGdtGf8ltKIzTt6s5w2Gu?=
 =?iso-8859-1?Q?Bs6pAb3+0ZCu7VXijh2/OpM6VSi6O81+gJiqjv14807sFl5Bo8MXGF3j1n?=
 =?iso-8859-1?Q?esVfHyhaWXR74N1ZdCjWYcsdRGzhgfJ1PtraIbEckY6PCGwOm/1lsZ6pYj?=
 =?iso-8859-1?Q?zem+wOyVuRvy4W2Z5uRPZe/cL8L9NJjvI/bDJaoceazr2k2xMzjsXOTe/6?=
 =?iso-8859-1?Q?cEOwNjJUFKwPvRnZ7hOX1z1kkqgBz8Yt+FLRbACu//Dmk5BmOsM/QVdmsc?=
 =?iso-8859-1?Q?idHUKTAQhJApZfzL6Cn2zdMUvPIVbpQR6nEv0qvGxorMuX04m4kq43ZdD7?=
 =?iso-8859-1?Q?da5VcWn/B9MsLjujKXfTqbP/lMqQFUgMVzFqlAvTvkuwri77Su7RlJTvo9?=
 =?iso-8859-1?Q?/4TW2rsjSLp7Hj1RIwdzo246ejGhxqvU4phua+L7smEVpAapBsh7ZBVFIT?=
 =?iso-8859-1?Q?y2JuOQP6g/hDCp9t+yF6soBa1sw/dYBtYvCfANJ5wUjZIa4eeyays6djSU?=
 =?iso-8859-1?Q?OWEkpF6xk0gspWQtXRX3+p4XZFXDAlFMieJI96BGzb+UJ/k6g4FY+NAQDA?=
 =?iso-8859-1?Q?gAEM5u+i3/pR1rHGXz31BO5pzo/5kmiFmxw0NAOmDPG3J1M5PDGEu73ma6?=
 =?iso-8859-1?Q?D8pj3xQkC7G8njYW2nuKmGMtnqaaPO70T+rEbCiFvh8FPXxxC+KhCPpguB?=
 =?iso-8859-1?Q?oZ2PbiyFsM0oo4PMdHphpcZt0Du/nmoA7APvqmUdX9qUjYbzfpcc7bcLuQ?=
 =?iso-8859-1?Q?Bzmt7ptRhlgMO36ODXLUhoT0Hh8yHg8enUcBaT3ooml4YYGB/6BoO3ahAw?=
 =?iso-8859-1?Q?2qIQZ2RtDhFe6/QQpWM8lLsVsMXm+fc5nNLHo6xHEi9gWu15nudMXhse1J?=
 =?iso-8859-1?Q?MehvCkQv3/3y+TAoK+uNUojgmEImhnVbPWJHMakjlrYFSrOmI5ecMDFwFx?=
 =?iso-8859-1?Q?R/RkX2HQ2/1wg7tgdToUaAPIdfqts/QmF+0JWuwQy5+ENzG6QFF24fCZ5p?=
 =?iso-8859-1?Q?D9pe8MPHOWCktWRS0nRzw3j3fYvJQG34SCiOWclwH4cg6/SpnOWtGFkSWU?=
 =?iso-8859-1?Q?FCspIH/9rzRfmcHK4NH5F5DHkFfMGX/YqpjijHWC8nJIIeOKwfQH+yXGO4?=
 =?iso-8859-1?Q?qoJ3zkzqy0Cmk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53e0ec4b-0ff0-4829-fcf3-08dd2f299365
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2025 14:42:56.9493 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yY+1hSe4QYpYETnY8SpyLXcl1ohFDOOg6QV17reem5c56GWZbnfMG428DCanB5Yn26mX7mqB0kI2cVzgVDSh6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6986
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

Hi Alexander

It may cause by the first preferred mode in EDID is not supported by driver=
.
Please use modetest or other user application to change the video mode to C=
TA standard modes.
Such as148.5MHz 1080p60 or 594MHz 3840x2160p60.

B.R
Sandor

>
> Hi Sandor,
>
> thanks for the updates.
>
> Am Dienstag, 17. Dezember 2024, 07:51:42 CET schrieb Sandor Yu:
> > The patch set initial support Cadence MHDP8501(HDMI/DP) DRM bridge
> > driver and Cadence HDP-TX PHY(HDMI/DP) driver for Freescale i.MX8MQ.
> >
> > The patch set compose of DRM bridge drivers and PHY driver.
> >
> > Both of them need by patch #1 and #3 to pass build.
> >
> > DRM bridges driver patches:
> >   #1: soc: cadence: Create helper functions for Cadence MHDP
> >   #2: drm: bridge: cadence: Update mhdp8546 mailbox access functions
> >   #3: phy: Add HDMI configuration options
> >   #4: dt-bindings: display: bridge: Add Cadence MHDP8501
> >   #5: drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
> >
> > PHY driver patches:
> >   #1: soc: cadence: Create helper functions for Cadence MHDP
> >   #3: phy: Add HDMI configuration options
> >   #6: dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
> >   #7: phy: freescale: Add DisplayPort/HDMI Combo-PHY driver for
> > i.MX8MQ
> >
> > i.MX8M/TQMa8Mx DT patches:
> >   #8: Add DT nodes for DCSS/HDMI pipeline
> >   #9: Enable HDMI for TQMa8Mx/MBa8Mx
> >
>
> I gave this version a new try but unfortunately the display stays black.
> Although the display pipeline is intialized and even wayland starts.
> Do you have any idea where to start looking?
>
> Best regards,
> Alexander
> --
> TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> http://www.tq/
> -group.com%2F&data=3D05%7C02%7CSandor.yu%40nxp.com%7C734ea27ba98
> 140b7483e08dd2eed1276%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%
> 7C0%7C638718317967624410%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU
> 1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIs
> IldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D1HdQdbye9p5AHoT7JCF3Md%
> 2FB9k9tyN%2FW25YKCEngvWM%3D&reserved=3D0
>

