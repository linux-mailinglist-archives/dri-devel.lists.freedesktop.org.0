Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 345DD75906D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 10:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 704DA10E128;
	Wed, 19 Jul 2023 08:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2045.outbound.protection.outlook.com [40.107.21.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E2D10E128
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 08:37:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jza8ggHqAxc8JeP3CxZJq+FndxTD/f7dzo4ETv5Tqmhnrol0BMt+KDrW/BikEfpdQvIIWVyMydXe85SIDBZj4wXJ0buk3duRWzV4lTHuRNNarCG0q6dYjsL1LlbyTLl6Exi2ZydCP9sNW3Y29bUyehus3nNLS7Z5bNUmlvacWBLCIWb7T/l3EQmqzeuTeVHOpv60YapSFpI8JQ8+YOJRQNquyduAuGxoum6Z+C2j6DxkDFVgcJOmfeKVuX+rFMV2xlD2zWQinjZAMweS0Bg736RZfW1+kDcHlyuiwv1Hee6qZA6Gj4r2IybUCmj07ZMiY0CD6e+nFvXo1YB7sxjoVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUZjIYFDrvGA5z4i6IK9VlyyRs1HQN4NpY4saa+mmi8=;
 b=O/do9fLSjc26AIp92Nb0QF++acqVBZJZKNo7CVDMFiv577MHC9fJKv20CMQbBWRKtB/SQCImC2LcXj0QZXtFsCkNaikQszEB8kEgYQWtFmeWaHOW4Y9XB0Y3PHqtLXHHg5Kd/j4FcCcpu9bXPAJIO/KWSCyMlNdGP2BPmVKtQ/cmNdTynGoBTzOg4QyroBbzxc9fJL/s6Wju0LLk+6nvqZtj41PIHBHYQKEBjt8LmQ+waeXxQ2K4SMicYXuoz8knyZbNdNxD/okAU0ZlAj0I4NpFHCAnUj+/EGDg+CcYTEu2nBlqHb+i5X5WlSHPmaEzhTpEAOiHm6diInCSAISuRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUZjIYFDrvGA5z4i6IK9VlyyRs1HQN4NpY4saa+mmi8=;
 b=C4Xj39SmuULJIoO2Ik/hvn4WEY+MZn8zJ6u+Q+5xclJrAXLSX84vELfTj77JFybVrwsOD0sRIes671icVzO4h+3dqOe9VW50G4UfYN5mDoevTcA22iUoBBQzQsm/MRE/FXpIqDRJjmNQYc8EK71+8bUeaWxsUuFZngvzSmc+AzM=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VE1PR04MB7421.eurprd04.prod.outlook.com (2603:10a6:800:1b3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.23; Wed, 19 Jul
 2023 08:37:06 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6609.022; Wed, 19 Jul 2023
 08:37:06 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: RE: [PATCH 9/9] drm/bridge: imx: Add i.MX93 MIPI DSI support
Thread-Topic: [PATCH 9/9] drm/bridge: imx: Add i.MX93 MIPI DSI support
Thread-Index: AQHZuHX2kU9tVwb+/k68aHvm3zH4HK+/J8uAgAAR5CCAAHN/AIABGckA
Date: Wed, 19 Jul 2023 08:37:05 +0000
Message-ID: <AM7PR04MB7046888A4136A7DE9EEED7C69839A@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20230717061831.1826878-1-victor.liu@nxp.com>
 <20230717061831.1826878-10-victor.liu@nxp.com> <3174425.5fSG56mABF@steina-w>
 <DB8PR04MB7051324184846E6206E495BF9838A@DB8PR04MB7051.eurprd04.prod.outlook.com>
 <20230718154644.GD688726@ravnborg.org>
In-Reply-To: <20230718154644.GD688726@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|VE1PR04MB7421:EE_
x-ms-office365-filtering-correlation-id: c733ce57-e325-4cc9-16a4-08db8833555e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FP0ACEgaBoQyEejc0MBlID8ECdI/cqx4bg8fff13fFtI9QH3Tqrg2P+Z0a6vTMXf3nThv9UFdbDErwMSu7S1H7k3qnzrU0/GHOieSNcFpgVzxVZ1sHHl12+VudG03rl7wIfFw4xQNYAx0oLYMQqFAPOQoUnWOPnKdWdENQGmWh8UFX6vE2eRxIggr0VCep17N5Fzhp1d5rajsLDpl2Zcu0IVvckYl3b9yj6Mpt12P9TzVu66u5QZkq0gSjnzThm3upx6rzsvv/Fw0QW3dKC6jz1s4Ye4koueBl1OY6owiZAFxbdYFzqXiJFX/OZ/vaXF/zufh9+HjuYWe7rTk68RLOAw460z17wlqPfB6rt3p2Nf/R29J59ckNMV1cz5NQ2ebqVWqxNs43FMEbkHjMwlFy7fNtVCfURWRHDDlBiWRbJagwZNjo4jxgV71reWX3zxSNYQEOg7ihOwFBvc02efOhBawbLzxST8d9kw+iwEgihxnB3llrv6/HC0+eJgVUxYvFeNEGDr05CIqIxJ802GPPcvfqwNQC0B3arRnwSlwqBIRnHHkiaLCfw//W2A5NCaGO5+krh9HrIm7/mbIKhJjKFWdb90zSs9mVVuTKxz20r9zVn/zedLZywy5KfcHaUX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(346002)(136003)(39860400002)(366004)(451199021)(478600001)(71200400001)(186003)(83380400001)(55016003)(6506007)(26005)(53546011)(9686003)(66946007)(33656002)(64756008)(66446008)(66476007)(66556008)(8936002)(8676002)(4744005)(5660300002)(2906002)(86362001)(4326008)(41300700001)(6916009)(316002)(7696005)(38100700002)(54906003)(38070700005)(76116006)(7416002)(52536014)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?E6UudQN9ocQSYN0z1zVTvgkcXJxWuQgRMm6L7CO8rhhYHks+lmFCoNoYHAvc?=
 =?us-ascii?Q?L7ozbyQvSIaljCu1hhDplVbr80EFFSyDcgj2vidKm9t+KGlWw+lF9j4L+5zj?=
 =?us-ascii?Q?2fnAwPsqbaZzR5RqSabu2JOpsoJjLUU8MKfCOtSWrq4+zF1ue6GbTM4h5LZD?=
 =?us-ascii?Q?4lXYmH1CWi6+Fgfd5aYEl1riKai2Dj0wj5J/N0dHNssCpBGhKWQJemDAYT9T?=
 =?us-ascii?Q?amHXspLNVF1LJT4gl96JwceBRAXNgaujVzKxSKf6HyrtkDdF0tTJbHyTOFA5?=
 =?us-ascii?Q?NylDVKHhFNwrGcXnsJga2Ii0GufgqPyfLWCEzrWsRR8ipfNa2yZ9ydudSnk6?=
 =?us-ascii?Q?FzMqekpq+Fft+Y+/sViLCb1ZuU0JbhPI7Q4C8o/XhFR5S2V5pNcjYjDnk/3h?=
 =?us-ascii?Q?xczfO2M1gOFvP5qiII7+7ipg6rVEGgCgnDI2rLPZZ1Ff7I86/lMsQZIDHUbL?=
 =?us-ascii?Q?wSm4cUXmhaJwUwqLDvi+O2ok1F7a+jVQoNSYf4QdxgOQAYtH6Jisc0VpQSiN?=
 =?us-ascii?Q?/KpZyPgB5IPrQOuzf2kuNl2I7qiDOC/wJmTvajVGfN0yT/6D6m/DzMjiR/cw?=
 =?us-ascii?Q?2tWzwkWeLn/kRZfLAdTqbkewrSujud5y+oMRVzR4RJVBUDQm9nbsheI0iP7a?=
 =?us-ascii?Q?TmS2Yb+qjZJN/sZCih2LONkkiERWjI+s9uXybPhPeH2J/sT9mbOZy8eFVWmx?=
 =?us-ascii?Q?Nk12Bgq+gJ1vOdMsDysswh/8Rx1GvGB0L3rcrKEvgoJu3x9Ons4NNosIsvdb?=
 =?us-ascii?Q?RBTHEv0aWisMpAjDx9jy8dENplYuNLiSHObU+1Bq3j1aXKiwoQTW+mybmM3B?=
 =?us-ascii?Q?1BwjYgE3kzmTZF1vC3rfGBP2PwAOeRVL6JAo6A8LKGVpZ9UbEZA0mdOVIh9V?=
 =?us-ascii?Q?9UW6nllWe2XJOevt+uWr0Ypty4zt8IYsFYr5pa5MGj3AzVh5fm5IjYsdVWG5?=
 =?us-ascii?Q?Jn3FiJBybb1Dhffru/XJ+AoA27r7ejsi/q3jUNC7xkrtvKXqTzOo8VtnZTAI?=
 =?us-ascii?Q?mbwJy9VWna8f0nSatdj14D6abXB+D7SQFo5C14zBUMApyXz/0NejE9sDbZfu?=
 =?us-ascii?Q?mDK3mTebRbgIK3CZi7RChU6lqSUoGI1nmBusKRZFyVJut3JM0vQ1X/ACbOI8?=
 =?us-ascii?Q?7qz2pj+4iPE8sHmVbj5vnZU4jla2isRCB4wI2OjJuIJiJfbmGDfuZteAGkcX?=
 =?us-ascii?Q?5GcgxK4MWDJXgCCiJLxM38Bi9CBTH5qc2oH/+O8t6tTFHVD81m/4KDBXB2Ex?=
 =?us-ascii?Q?RWHNHoo6YWuJWGTodA5t8txgE0Pb35cLgmCorAlLrIKVenDaSC67qFYbe/X6?=
 =?us-ascii?Q?5QHfze3KYfNn9r/QQvdpSXdJ4LwCss2z0frIX2DxJ4lULhBEn+9KIy/j6AKT?=
 =?us-ascii?Q?C0xuxSz5FmX57BQc00WQNpvrxEdhfkiVRl4gyt9hj0G6ICOqDFyUJ1GggURD?=
 =?us-ascii?Q?uHb0S9DcPwrbVtaqyHZ8kmEy1cQrs7CYX8WCyP168ugaDPDgYy5ctQaeReH6?=
 =?us-ascii?Q?hSPNxSTyedM5/D0ILnFqKoXl5B7VYPxJJ4o4LynIVa7fX31F0fDdduNd+/dN?=
 =?us-ascii?Q?aioe6AAGLCNEWMaFjbE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c733ce57-e325-4cc9-16a4-08db8833555e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 08:37:05.9502 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IQEHb9qQAZSMwLPgj+qr03K8CWR0dPLBlr5aS64FA5zlJfnHK+FbmoOIsp/KWBLE2z+1xbmZyc2uj2zKQhb10A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7421
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, dl-linux-imx <linux-imx@nxp.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, July 18, 2023 11:47 PM  Sam Ravnborg <sam@ravnborg.org> wrote:
>=20
> Hi Ying Liu,

Hi Sam,

>=20
> On Tue, Jul 18, 2023 at 09:00:25AM +0000, Ying Liu wrote:
> > > > +   if (IS_ERR(dsi->regmap)) {
> > > > +           ret =3D PTR_ERR(dsi->regmap);
> > > > +           DRM_DEV_ERROR(dev, "failed to get block ctrl regmap:
> > > %d\n", ret);
> > >
> > > Could you use dev_err_probe here instead?
> >
> > Maybe, it's better to keep using DRM_DEV_ERROR to achieve consistent
> > error log format across the driver which is implemented in
> drm_dev_printk().
> > I see other DRM drivers do the same.
>=20
> All the DRM_* macros are deprecated.
> New code shall use drm_*, dev_* or pr_ as appropriate.

Ok, will use dev_* in v2.

>=20
> The appropriate variant here is dev_err_probe().

Ok, will use dev_err_probe() here in v2.

Regards,
Liu Ying

>=20
> 	Sam
