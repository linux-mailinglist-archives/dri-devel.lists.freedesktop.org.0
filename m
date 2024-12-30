Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFB89FE319
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 08:05:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C10A10E475;
	Mon, 30 Dec 2024 07:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="gevB5X96";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2076.outbound.protection.outlook.com [40.107.104.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CAE710E0D3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 07:04:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VxtX+sUi0g+nc0Cs6pj2dH4mubkwPuwf30lAI0UbA89xB+09dckue9APyDtEfy+/i42TxYjGXe3iMY7tgrSeyvbc2yfPgXezprCt0o3iFxviCJqWKqHZHNvsLF+Qw3GsbFZr2vsudHqHhDw11c5Orw4FUzMmNEk1FFhudiC5c0m2zwbDTSj9zaQRGS5czQahwFolSx574cnkuvDRCZxh4IqrBZhd3cI1P6VxXPFiI05JG+VOwqO+c+QWadSi684bd+DE+//As5Azrhdjo4CAnBV9QREDhZnU67K8ptx74QuFji09jLAek7VDSTnC6rzuACaeQQneWFU31o5FIC9FWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5ojK3E/Lobc0k/3A+YTNlikvc9fNiAD8dZBYadGE/s=;
 b=uM4WaFjgvrhaWRPEE+zkNMe674m8Nnw0mKt6q3d8vnY0iisu4l8hvC1U9W2PmPfiOxQ0dYoj1C592HA18YuzICgZB199T1P00Qxo+/x3jY7MVhFAoH15cgYsI64PXN3oc1F1SzC30dBM/T7TUquJCjqt2RGnI6VTyXYd/yPBavOcbcF60gRK2HNcAP84PWKSXe+eErzOWhD4h6vR/xtq3KNlFLC5vhQFBedFq6mX0yawDNFYzJzd8ayk+jfGNCv5fN9VLuYtiOAx7Oa7nngpzeV3sh8aQ/NI+iMeHb+mBtwhJMW48eurWSTI/j0rrvFJDQyyX7GvBEW0+4gSldM0Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5ojK3E/Lobc0k/3A+YTNlikvc9fNiAD8dZBYadGE/s=;
 b=gevB5X96hRBKOgaaue3B2p1xRagd68Rh8OYdbWfQT+ejnBTBnf+WQDJDA6J0Yps7Fb1pk1HX+uJhMQ9FAQ2B4Bi8B9a26dsMtmJmlh8W1vpL5gqv2IkoanTHnl5twYEEeonMDbgFxXl5DzCi32IcWrtIOlNw3X17H8CcNLsFVU7KQGRqqClYNZAbTUc1DsSaA+zssA5AAhABvROYQKD5GuWVeNf/ggzb1JHSRnIycJOIYjJwxZlZaExsCeEDehOmq3ArCYTlvb2ysS7vdVCG1kgO9ler7JIilzKDSrcpOMMpEtCzGEsL7Z3jQzkmxMF5G4Z3O9CI9A5muW2fwfs32Q==
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10831.eurprd04.prod.outlook.com (2603:10a6:800:25e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Mon, 30 Dec
 2024 07:04:51 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 07:04:51 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Marek Vasut <marex@denx.de>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Robert Foss <rfoss@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Simona Vetter
 <simona@ffwll.ch>, Stefan Agner <stefan@agner.ch>, Thomas Zimmermann
 <tzimmermann@suse.de>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v2 1/3] drm/bridge: imx8mp-hdmi-tx: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Thread-Topic: [PATCH v2 1/3] drm/bridge: imx8mp-hdmi-tx: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Thread-Index: AQHbVaXNeL9HKOrxpU6nVMVEAeR+a7L0yzYAgAKkFYCABvXUgA==
Date: Mon, 30 Dec 2024 07:04:51 +0000
Message-ID: <AM7PR04MB704688150ACD5D209290246A98092@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20241224014701.253490-1-marex@denx.de>
 <nehmmkv22ortkw6ngzlhjqo7emxsptt2dzoulln5ili52uswfp@h3acrwrad2y5>
 <75dc6f74-f828-49ac-8bf6-41fd4e197855@denx.de>
In-Reply-To: <75dc6f74-f828-49ac-8bf6-41fd4e197855@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|VI0PR04MB10831:EE_
x-ms-office365-filtering-correlation-id: 5bde479f-2a7e-4938-118a-08dd28a04140
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?cFBaMXM4OCtHR0NqNlQ3QnZMVXNDWWR2RFlkcjVmejJyaUJ4cmhwMW16a0tT?=
 =?utf-8?B?cHNIUkl1YzV4Y0dIUUg4WTFLTkNkWHNpZ0VSa1dKMzdBVENGSWthdnpvN3gv?=
 =?utf-8?B?SnhpSzZ5RWZhUnlFTnFPbXN0bE13ZXRlcHg4a2EzNGxOUG9YdExrbmdOWjBl?=
 =?utf-8?B?dzhpOHJuN0hWT3VSZEVCalhpY3JTaWxnZ1l3SS80eUVUdGxYY3pYRldzVTM2?=
 =?utf-8?B?Qmc4SWZ5d1hjS0Q2ZXBZaEJoVkthdHEzM1A2cWFMYXhDSEFQOVpkUlRFM1h6?=
 =?utf-8?B?MWhOOEdKZ2UvQzBtN2lwWXRYQ1dDS0E2aVNXaDJzdUhvY3gvUTVrMnFKbjZX?=
 =?utf-8?B?WWpuVEJkZXduZENHK2p2VDVVd0pmV3hzamx2d0hIM08vQVp3bWRrY1AzbU81?=
 =?utf-8?B?M0VtbWhqTm5jSW1KN1lQcHZxSytpbUJQZTBkLytFVXJBaHlxeURreWNYc1VV?=
 =?utf-8?B?ZllnN3RjVjRhYVVVRyt6VitJT09odWlJZWhZTUpDRWtRZkNybjA3dWk4dU91?=
 =?utf-8?B?RmpSeVFXR21ZSk5lTzNtNWo3MEExUUpSOEFZeitPNzFXZnJVOFJ1K1VPcnpM?=
 =?utf-8?B?aGRRTHNOOGNjbm5GNzNVbHlOUHEvYkVtdFZrTWc5Zk4yOWlSQVZTbUt5Zmlm?=
 =?utf-8?B?clgweGtwUUJ3NnRxVXg3ZGQ5NXd3a2lhYXBGUWIyd3pIeHpJOE8zWFdEOFlz?=
 =?utf-8?B?VEwxRWVXMzFaakxxODY4M2orVFRrTXFVR0N2MGIybE16V2ZUWnI1Vm16TDJy?=
 =?utf-8?B?b1gwS0VtNDVTNk9DNlMyQkM3MzQ4WUFudVRMRGJWcGk5N0RjVFkzcXdqbXln?=
 =?utf-8?B?QWYwUVJSQXc5dmlHSnJDY1FIcEg2NG82UjYrZFhXdld2eWM5Qk04cmxzb3pC?=
 =?utf-8?B?UjBhQXVtL0thc1AxaTF5SWphTUp3a3JRSEJlcVhTU050UGJHNlZCazh2dHE4?=
 =?utf-8?B?aDh1ejdZQ0tvV05sQUp3SU9IcHNFVm1IOU11dGVTY2x0YnV6bGYwS3dvdEhs?=
 =?utf-8?B?ZWRmeVVtbjRETUlnNFNFQlN0cTFKVHlKbkYweU5SS1A4cS9tN3V4WURlZ1lw?=
 =?utf-8?B?MlRISkczeVJvMnhNVS9lbFJmK0pqYmdzL0ZlbHVDMzVTZTI1eURLdy94UnF2?=
 =?utf-8?B?L2VaUnlnSzBKUWlYRyt2aTg1WlkzNjkydFVhRlZCMzN3M20zVzRobUQwZnJx?=
 =?utf-8?B?OTQyc2JZcmV4dy9PRE0wczNuQ1B1UFpTbXhwckFxS1BHQ2RJRWJJdWx6bFpG?=
 =?utf-8?B?TnNnN1BWSUVOK09leGdFYWh0WHUrYVdaL0FpVDBMY1U3aDNMdTBYMUxwQU5Z?=
 =?utf-8?B?aHVHdk14S2ZoM3NIU0tvU29Fbk9XYVNiVTBkU041LzFBeVdzSnA2WWY0Si9P?=
 =?utf-8?B?Ym5JUlg1cjdSTEw2WC9oY2ZuU3k1SndmWVc3c2I2ZStWTFhOaGJvdHhzVkJz?=
 =?utf-8?B?bTBiVEJDWW9qRlRwNjJpdFpvSDI1M0l5SE1Uc2RlOGNaVm13a1RIQ0lQKzZH?=
 =?utf-8?B?UXJCZkFsWmVMMm1pSUcvTUpHWktibVBSNDJCQUtERUpvcHhHZU10UnBuTHdS?=
 =?utf-8?B?UDByZ3NzWVMyWEVDSHdGRzVlZWJTenljQ3pDRXlhTWFOSjhwTnNqWkRyVlY3?=
 =?utf-8?B?cmlneU5vODZwZlEvNmtkVTNZQktMdm5ZTzR2M2hrSmI5aDlLU09OMEFVRkVv?=
 =?utf-8?B?aGtrNm9sT0ZwTWhNN3l6Y2pBN05yMFNQZDRYWTUybWI3SWZwZ0RhcURQMERF?=
 =?utf-8?B?MFlPSjBFbm1YMFFmbHhyNENIcHIzaU9VTlBUN1BUWkFCbTlydnBhM2l6WGl1?=
 =?utf-8?B?Tit0SWQ5dW11ZzhnVG5xVWNJZ3B2d1Zyc0ozdDZsRXpVUnBMQ1BOL1FVdkY3?=
 =?utf-8?B?S2Y0dWpJUkFRNHgzM0JXK1VUcE5iZGdmcGZCRTAxUWIzZjJZV1FadTFKdFI2?=
 =?utf-8?Q?z1lTtMoJcFrdTqBdpQRWoatCyOzkxjnW?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUgrZkdzcHM0TnJNZURVaDVETzYvQmRLZUpDb28vNkR6elhRU3JGUktmcjMv?=
 =?utf-8?B?UG9RY1NIM3BRd1l3TGNXcUEvNDZ3ZzI3cjkweEdjQnVNWHd3SGtLZXNjRDN2?=
 =?utf-8?B?aWdwSkY3WDdWdFowNGd4N3lMbEtwV0QvdXhWZkNFK3RQMTh2b3JPalNZSXlh?=
 =?utf-8?B?cUNhZldrQTUvQUJ3SEdrS2lIdllOaWxoNmVYci9LeTN2aWxjYjg3ZmxsQzlx?=
 =?utf-8?B?WkU4Uzd4bEg2SUdYajI3aEZ5N0JnaDJzV1dWZHhhbjBWVFdQYjRIUXdqRFo0?=
 =?utf-8?B?eHZVZnFOZjlPTmhBZUpSb3JwcTI0aGVsTXBEaW1pb2JpV0FlQzdFZmdNVFps?=
 =?utf-8?B?U0ViYVRLUFpnYldEd0VCY3M2SUUrV2tiVDBVTkdEdVdiUmltdEt3SW5rTGNE?=
 =?utf-8?B?WFNrc1kwRnJYejdFUWZ4Uk5YRkN0RXRLZ2lRSHV4a2w3V1JLNkFUcXZ5aWNI?=
 =?utf-8?B?S040TnM1a1hSZCtkQnNSRHk2Z3NEK0plbDRCTVlkZm9Fc1FIV2pjQWhNNU5W?=
 =?utf-8?B?Z3ZwZEhienlVejd3UzVRWm5wZnEwV1hWVlBTbjl2Tjk5YXU0amJrWEhJaUNu?=
 =?utf-8?B?ckFwb2JGTTdvb3BqQU9kUG1KYzlISStSc01rK25ML2hEV3JnK2ttS0k1Q2JM?=
 =?utf-8?B?cDZHekdhV0plNVB4WmVpWExzN0JCQjdkdENNTnZ3MzdiTXFETURncWxkejkz?=
 =?utf-8?B?Yk1VektadWp1YU5tRVlNQXNHenJyN011MkxzZjN6ZWhFaE5seXRUZVE0amFq?=
 =?utf-8?B?SlV6TDlmS1N4NWZpdWVubC9sS0NtbUljL3hrVlYyY3VLUjZCN0x3ankxUTFs?=
 =?utf-8?B?VnNsck8vWWVPK3hoVldINno1czd0S2VIcHpMZVRrbDExSDFxZkNFWmlESEdN?=
 =?utf-8?B?K2ltZjh2QkxnSmFxbVdkUnJvMGFXZnBraWNDblBiOGg0dmtKai9nUG1yUXRx?=
 =?utf-8?B?QmI0ZDhTTjFMdU1vczh4MmFNcGRSL3loZTRuQkhmelM1QVV0K1VBSjI1eFVM?=
 =?utf-8?B?YU02TTVVOG1Xais2VWJ4c3NYdFh6YjdRdlR4ZGdkeEhIWGwyK21SM0lhSVU1?=
 =?utf-8?B?QnRiNk13UG5GYlJaSzF6RElIMVRZamZEby9WUkF5eDlXNUxGRm03TjRucUt5?=
 =?utf-8?B?b29HOThwVFJaYUZrUHVnbHZiSEpsMEx6M0lPWEl4dFg3Nlo0VXBrWm9GK0lW?=
 =?utf-8?B?ak0wRmZTQXlRK01SY2Y3UGpwYjRuNXF4NkN5V0lIa3VKeDFoM3ZtTnNvRENt?=
 =?utf-8?B?dDFMdHdBYThCZHNLZ3dQaDI4bzlGTm1SdTQ0TWZBVEpmd0o2bkpRbmlENUJT?=
 =?utf-8?B?NHZDVFBBcXY3d3p1eU44YmpybjZTREhVcldyK284aXMwSmlQTGxEa1BZL3FZ?=
 =?utf-8?B?S2t0bUR3UFpQbC9XRGpOeHE5WTcrQzMrWDdjTWh2OWJmWkJUMFdVS3ZCMzYy?=
 =?utf-8?B?VEpyNnlLSzdWYUF4UU1BTXJITGs3U0tyeE9wU3hmZ0xrNy92aVBxU2Zmd1hS?=
 =?utf-8?B?QWZYRlI0T0dGV1F3MFZqTXpObkUxWm5qQTliaDdpYmxjZjRYckhlMnAzWmVo?=
 =?utf-8?B?UDNMQ2RkYkV6U3d2VUZkaWhsck5lODNldGFqYVBPcFJzaVBqdys5Ymt3RHBR?=
 =?utf-8?B?MXRVWnY1REhCZnJ2YmljOVVxSmZYQnRmdWkyako2TlV1cW5qSVlPNm1FYmp1?=
 =?utf-8?B?NGFLY1FDdHNGQ2dCSTBTdlRuNE1WM3B3OTIwQzFQTmlLZElrbWNDV2lEYk1X?=
 =?utf-8?B?OVFhNzh0eFU1Mk9iSU1QOGlGKzBSY29wTXFxMmUxMURwT1VaTEE5S0xzUGg1?=
 =?utf-8?B?VSs5czZhOFhJS2ZNK09RTU0vUU5hNFVzMS9MWm9lTlpJRTNDT08rNmk3WlJR?=
 =?utf-8?B?a0M3ZGl2RENWTHRMdlNUdHBoMjFLSGlZSE1oN1F5WTZ2WUFSM2xzNFpIV2lN?=
 =?utf-8?B?d0lHNEV0aWNIc21nejBIaHJianZheWdjVlNJbEFxQkVMeG53Zkd0N2g0UWkz?=
 =?utf-8?B?dWI0UElrY21Hd01kWjVGL2VIU1ArTGZFbWxOZVd3WC9zNkR0REtLMjFzVzNL?=
 =?utf-8?B?V1BWQjRWZ241NkE2TnZPTnJjTXV1VlBDK0V1SFlFeE52T0Z6MkFROWtzb05i?=
 =?utf-8?Q?XeSu86Z3WaJU9+UKaBISgA8z3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bde479f-2a7e-4938-118a-08dd28a04140
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2024 07:04:51.0655 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gl3yVX87ZlSV8XreaYQ+kBy1jaxaPevMQTb89TCLMEpdTqlmbHK0NIvrN/CGVStKZZ26nN4rQF+PQbB/Q+UGZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10831
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

T24gMTIvMjYvMjAyNCwgTWFyZWsgVmFzdXQgd3JvdGU6DQo+IE9uIDEyLzI0LzI0IDU6MjEgQU0s
IERtaXRyeSBCYXJ5c2hrb3Ygd3JvdGU6DQo+ID4gT24gVHVlLCBEZWMgMjQsIDIwMjQgYXQgMDI6
NDY6MTRBTSArMDEwMCwgTWFyZWsgVmFzdXQgd3JvdGU6DQo+ID4+IFRoZSBkdy1oZG1pIG91dHB1
dF9wb3J0IGlzIHNldCB0byAxIGluIG9yZGVyIHRvIGxvb2sgZm9yIGEgY29ubmVjdG9yDQo+ID4+
IG5leHQgYnJpZGdlIGluIG9yZGVyIHRvIGdldCBEUk1fQlJJREdFX0FUVEFDSF9OT19DT05ORUNU
T1INCj4gd29ya2luZy4NCj4gPj4gVGhlIG91dHB1dF9wb3J0IHNldCB0byAxIG1ha2VzIHRoZSBE
VyBIRE1JIGRyaXZlciBjb3JlIGxvb2sgdXAgdGhlDQo+ID4+IG5leHQgYnJpZGdlIGluIERULCB3
aGVyZSB0aGUgbmV4dCBicmlkZ2UgaXMgb2Z0ZW4gdGhlIGhkbWktY29ubmVjdG9yIC4NCj4gPj4N
Cj4gPj4gU2ltaWxhciB0byAwYWY1ZTBiNDExMTAgKCJkcm0vbWVzb246IGVuY29kZXJfaGRtaTog
c3dpdGNoIHRvIGJyaWRnZQ0KPiBEUk1fQlJJREdFX0FUVEFDSF9OT19DT05ORUNUT1IiKQ0KPiA+
Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4NCj4gPj4g
LS0tDQo+ID4+IENjOiBBbmRyemVqIEhhamRhIDxhbmRyemVqLmhhamRhQGludGVsLmNvbT4NCj4g
Pj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+DQo+ID4+IENjOiBGYWJpbyBF
c3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+DQo+ID4+IENjOiBKZXJuZWogU2tyYWJlYyA8amVy
bmVqLnNrcmFiZWNAZ21haWwuY29tPg0KPiA+PiBDYzogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dp
Ym9vLnNlPg0KPiA+PiBDYzogTGF1cmVudCBQaW5jaGFydCA8TGF1cmVudC5waW5jaGFydEBpZGVh
c29uYm9hcmQuY29tPg0KPiA+PiBDYzogTGl1IFlpbmcgPHZpY3Rvci5saXVAbnhwLmNvbT4NCj4g
Pj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5j
b20+DQo+ID4+IENjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+DQo+ID4+IENj
OiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4NCj4gPj4gQ2M6IFBl
bmd1dHJvbml4IEtlcm5lbCBUZWFtIDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+DQo+ID4+IENjOiBS
b2JlcnQgRm9zcyA8cmZvc3NAa2VybmVsLm9yZz4NCj4gPj4gQ2M6IFNhc2NoYSBIYXVlciA8cy5o
YXVlckBwZW5ndXRyb25peC5kZT4NCj4gPj4gQ2M6IFNoYXduIEd1byA8c2hhd25ndW9Aa2VybmVs
Lm9yZz4NCj4gPj4gQ2M6IFNpbW9uYSBWZXR0ZXIgPHNpbW9uYUBmZndsbC5jaD4NCj4gPj4gQ2M6
IFN0ZWZhbiBBZ25lciA8c3RlZmFuQGFnbmVyLmNoPg0KPiA+PiBDYzogVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+ID4+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+ID4+IENjOiBpbXhAbGlzdHMubGludXguZGV2DQo+ID4+IENjOiBsaW51eC1h
cm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gPj4gLS0tDQo+ID4+IFYyOiBObyBjaGFu
Z2UNCj4gPj4gLS0tDQo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pbXgvS2NvbmZpZyAg
ICAgICAgICB8IDEgKw0KPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaW14L2lteDhtcC1o
ZG1pLXR4LmMgfCAxICsNCj4gPj4gICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0K
PiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pbXgvS2NvbmZp
Zw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaW14L0tjb25maWcNCj4gPj4gaW5kZXggOWE0
ODBjNmFiYjg1Ni4uZDhlOWZiZjc1ZWRiYiAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9pbXgvS2NvbmZpZw0KPiA+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2lteC9LY29uZmlnDQo+ID4+IEBAIC0yNyw2ICsyNyw3IEBAIGNvbmZpZyBEUk1fSU1YOE1QX0RX
X0hETUlfQlJJREdFDQo+ID4+ICAgY29uZmlnIERSTV9JTVg4TVBfSERNSV9QVkkNCj4gPj4gICAJ
dHJpc3RhdGUgIkZyZWVzY2FsZSBpLk1YOE1QIEhETUkgUFZJIGJyaWRnZSBzdXBwb3J0Ig0KPiA+
PiAgIAlkZXBlbmRzIG9uIE9GDQo+ID4+ICsJc2VsZWN0IERSTV9ESVNQTEFZX0NPTk5FQ1RPUg0K
PiA+PiAgIAloZWxwDQo+ID4+ICAgCSAgQ2hvb3NlIHRoaXMgdG8gZW5hYmxlIHN1cHBvcnQgZm9y
IHRoZSBpbnRlcm5hbCBIRE1JIFRYIFBhcmFsbGVsDQo+ID4+ICAgCSAgVmlkZW8gSW50ZXJmYWNl
IGZvdW5kIG9uIHRoZSBGcmVlc2NhbGUgaS5NWDhNUCBTb0MuDQo+ID4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2lteC9pbXg4bXAtaGRtaS10eC5jDQo+IGIvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9pbXgvaW14OG1wLWhkbWktdHguYw0KPiA+PiBpbmRleCAxZTdhNzg5ZWMy
ODkwLi40ZWJhZTVhZDA3MmFkIDEwMDY0NA0KPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2lteC9pbXg4bXAtaGRtaS10eC5jDQo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvaW14L2lteDhtcC1oZG1pLXR4LmMNCj4gPj4gQEAgLTEwMSw2ICsxMDEsNyBAQCBzdGF0aWMg
aW50IGlteDhtcF9kd19oZG1pX3Byb2JlKHN0cnVjdA0KPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
DQo+ID4+ICAgCXBsYXRfZGF0YS0+cGh5X25hbWUgPSAiU0FNU1VORyBIRE1JIFRYIFBIWSI7DQo+
ID4+ICAgCXBsYXRfZGF0YS0+cHJpdl9kYXRhID0gaGRtaTsNCj4gPj4gICAJcGxhdF9kYXRhLT5w
aHlfZm9yY2VfdmVuZG9yID0gdHJ1ZTsNCj4gPj4gKwlwbGF0X2RhdGEtPm91dHB1dF9wb3J0ID0g
MTsNCj4gPg0KPiA+IFF1b3RpbmcgbXkgZmVlZGJhY2sgdG8gYSBzaW1pbGFyIExpdSdzIHBhdGNo
Og0KPiA+DQo+ID4gVGhpcyB3aWxsIGJyZWFrIGNvbXBhdGliaWxpdHkgd2l0aCBvbGRlciBEVCBm
aWxlcywgd2hpY2ggZG9uJ3QgaGF2ZQ0KPiA+IG91dHB1dCBwb3J0LiBJIHRoaW5rIHlvdSBuZWVk
IHRvIGFkZCBvdXRwdXRfcG9ydF9vcHRpb25hbCBmbGFnIHRvDQo+ID4gZHdfaGRtaV9wbGF0X2Rh
dGEgYW5kIHN0aWxsIHJldHVybiAwIGZyb20gZHdfaGRtaV9wYXJzZV9kdCgpIGlmIHRoZSBmbGFn
DQo+ID4gaXMgc2V0LCBidXQgdGhlcmUgaXMgbm8gcmVtb3RlIG5vZGUuDQo+IExvb2tpbmcgYXQg
dGhlIHVwc3RyZWFtIGlteDhtcCpkdHMgLCB0aGUgb2xkZXN0IGNvbW1pdCB3aGljaCBhZGRzIEhE
TUkNCj4gc3VwcG9ydCBpcyBjb21taXQ6DQo+IA0KPiAzZTY3YTFkZGQ1NmQgKCJhcm02NDogZHRz
OiBpbXg4bXA6IEVuYWJsZSBIRE1JIG9uDQo+IFRRTWE4TVB4TC9NQmE4TVB4TCIpDQo+IA0KPiBU
aGF0IGFscmVhZHkgY29udGFpbnMgdGhlIEhETUkgY29ubmVjdG9yIG5vZGUuIEV2ZXJ5IGZvbGxv
dyB1cCBhZGRpdGlvbg0KPiBvZiBIRE1JIHRvIGFub3RoZXIgZGV2aWNlIGhhcyBiZWVuIGEgY29w
eSBvZiB0aGUgc2FtZSBjb21taXQsIHdpdGgNCj4gY29ubmVjdG9yLCBzbyBJIHRoaW5rIGl0IGlz
IHNhZmUgdG8gc2F5LCBubyB1cHN0cmVhbSBEVCBpcyBnb2luZyB0byBiZQ0KPiBicm9rZW4gYnkg
dGhpcyBjaGFuZ2UuIERvIHdlIGNhcmUgYWJvdXQgaHlwb3RoZXRpY2FsIGRvd25zdHJlYW0gRFRz
DQo+IHdoaWNoIG1heSBiZSBtaXNzaW5nIHRoZSBjb25uZWN0b3IgPw0KDQpUaGVzZSBoYXZlIG5v
IEhETUkgY29ubmVjdG9yIG5vZGVzOg0KYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14
OG1wLWFyaXN0YWluZXRvczNhLXNvbS12MS5kdHNpDQphcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVz
Y2FsZS9pbXg4bXAta29udHJvbi1ibC1vc20tcy5kdHMNCmFyY2gvYXJtNjQvYm9vdC9kdHMvZnJl
ZXNjYWxlL2lteDhtcC1rb250cm9uLXNtYXJjLWV2YWwtY2Fycmllci5kdHMNCmFyY2gvYXJtNjQv
Ym9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcC1tc2Mtc20ycy1lcDEuZHRzDQoNClJlZ2FyZHMsDQpM
aXUgWWluZw0K
