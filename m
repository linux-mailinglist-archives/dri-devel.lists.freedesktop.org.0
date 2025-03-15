Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 768ECA6281E
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 08:33:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2E110E128;
	Sat, 15 Mar 2025 07:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="GNuuOjv+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="h0VbC4zw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2139.outbound.protection.outlook.com [40.107.20.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A961C10E128
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 07:33:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tmje8hoCCHdlwQquP+MDgijx9VoCbUzYB6cSyNt8qaC6ADRSvCfTzQrWk4w4avbMcRUKJ1xcPE2ZVhLdTDdOgz4pRZwgx1emqZST6pvXBEzLqoean1C925CDXQh4GDXYaL3Uc02kzVcqNLnLLsCy3NeHZ9rV7JmaWAtMBgddnWBv+Ipt0w8fCx23q4J6ag0voILFJIOdZ9evKPQHJRCskAZGqx9FcGrkutE8gj13G75ZCXV/gHtp9eLpYSQQG5r9FH6nmXqmZjRsTXWdtw+NwYfj0Cy5HXhM05o/QOhuHY8Ka5yRCcVtsgIRATgHFElfwgVru9qk/HhVFxSwZ1pm8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ykezuwrMWFrddkm+/slQgZZqfSavkbUtPQ6GRBTM414=;
 b=kPhb9kqPRhz/B2KKCQBjUdzKP2jFkNWEdz1sUisDQFZycVr4hyE3AjEEHxQ22PMOdkKuNuOHMO8bwBS0sg9yA7l4xFsYn+Mp6+AP3PLR/18imlW1Bd8su3E9uSlOjd8zdFCJbWJDV/X75fEnwk0XHwhAQE0cCF6En/UkFSPEembpCNg3DCZ7/8k+OzVzAs57Wk8KV1YoKnGbtmKTm/AJdqv6jaY9GhOe/7uCzrAJcPE495V6KuVSGFO7iCh9IOUlRh/A/rE6P3Sb70MFH/TOxVqV5lu/US59t3k8iZkbAZBnZGYPovSWtuQwr2XXDKG4FCzUDG9JTw+D3eFroc3WFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ykezuwrMWFrddkm+/slQgZZqfSavkbUtPQ6GRBTM414=;
 b=GNuuOjv+LqoY9S7sPLDQUt6MQMfqh8qaURFfjuPneKuO7ImQ8OmDfEM6B5V2srC4sQ2k9AXjcjY1IkUZYL0B/VxQNSjxGgUmsXETVMFVfJLd6lY/tUjK+XsMffK7dfKHdGAUyXXMlWAGnkyCrVELGEB9q1rTok1ItLiibY8JwNvfWUTAVxem2KM39Jb9QmtX1Tz33ac+rH4MY7dcqvRw694b2ckDeNOJxoXuK31IMXDYkfmqGlBBS+f8f6DtfknwmdYVb2/vcLnSmmxujipIc50c010a1aP8DcvXH8CbVqXeC5QoPITL49iak+iRnYSgb0mgdKt0dRiBs5djPiq5yg==
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by AM0PR04MB6801.eurprd04.prod.outlook.com (2603:10a6:208:18d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.27; Sat, 15 Mar
 2025 07:33:48 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%4]) with mapi id 15.20.8511.025; Sat, 15 Mar 2025
 07:33:48 +0000
From: Maud Spierings | GOcontroll <maudspierings@gocontroll.com>
To: Rob Herring <robh@kernel.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Liu Ying
 <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>
Subject: Re: [PATCH v2 03/12] dt-bindings: connector: Add the GOcontroll
 Moduline module slot bindings
Thread-Topic: [PATCH v2 03/12] dt-bindings: connector: Add the GOcontroll
 Moduline module slot bindings
Thread-Index: AQHbiFlwk9848Rc4C0Wk0mPqKw6MoLNzOVEAgACo0sQ=
Date: Sat, 15 Mar 2025 07:33:47 +0000
Message-ID: <ac1ccbbe6a4048a79210c6676a8aa691PA4PR04MB7630094413C8E1F3D715EE23C5DD2@PA4PR04MB7630.eurprd04.prod.outlook.com>
References: <20250226-initial_display-v2-0-23fafa130817@gocontroll.com>
 <20250226-initial_display-v2-3-23fafa130817@gocontroll.com>
 <20250314210652.GA2300828-robh@kernel.org>
In-Reply-To: <20250314210652.GA2300828-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
x-ms-office365-filtering-correlation-id: af45195a-4cc1-4275-35c4-08dd6393b97c
x-ms-traffictypediagnostic: PA4PR04MB7630:EE_|AM0PR04MB6801:EE_|PA4PR04MB7630:EE_|AM0PR04MB6801:EE_
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|14060799003|366016|35042699022|38070700018;
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB7630.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(14060799003)(366016)(35042699022)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: PA4PR04MB7630.eurprd04.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 91fd9647-a3e8-4bf0-2e28-08dd63938a41
x-ms-exchange-crosstenant-originalarrivaltime: 15 Mar 2025 07:32:28.6978 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
x-ms-exchange-transport-crosstenantheadersstamped: AM0PR04MB6801
dkim-signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNbi1M5uamU3EKCkSZtA8vb/h6qmLi5FCR+4wklJYBM=;
 b=h0VbC4zwuujYNE09Xz3q75RtVhVqSj3z3KxQFDUd+5HFh7dgYJg1tkymNBNK6QV/xGCa6H0FiGY1khOzmAGC5fw2gxnFvCRzkgQi3uLCjGrrMf0rGL5llbpfGk2uEXcsHLsAwnOMRC+dTP5zC/O9c8M1OxzNIEekM3a7Q+8drOiG4HNWToMVGwU9o0zDUwps1/XF1MfjKEYOq8bFN6A8kUqKyr2P6PdhswzyiPJvLX6uZspUdPg2KOBlfNVr6Ox0koptuB2oB0YqOhvJ2JgrVXvpjbtNFjFL3tKi2E1HVimZ3cuiOaGYXaxI1r14NfLV1Mc0+qCjz7T0AAacQI2VLQ==
x-ms-office365-filtering-correlation-id-prvs: 91fd9647-a3e8-4bf0-2e28-08dd63938a41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam-message-info: =?iso-8859-1?Q?XnR6sOh6YXfiB01JPW5xUFgBHwL43WL9sMN39mjR1LZPiiOWVD9Kvxbr0M?=
 =?iso-8859-1?Q?zEPOyd0NeaYv1x8jjuSk0T43XT8OJ6+ul3ML5AdPLS4AZxSni9p5bz78sP?=
 =?iso-8859-1?Q?cX+QNkCB6GGEDHHciITDRABlrDyj0MxusI9jniBYXM9Je2boC8zUERe5iI?=
 =?iso-8859-1?Q?5RDn/Fg2F4gTxQomniapF0Um1ILf+94FdAFVo3+Dx53XZb5dlQF7w/jOEV?=
 =?iso-8859-1?Q?a8NIQJTFmu8gBC829GMaz64j36850kNf0LDUNyGb6Q4lZiND+VETqujVCN?=
 =?iso-8859-1?Q?OwnF/Q47GgvMrLPncTQSajDI3HXSiaW//vLknUzUHICu2gqwoa9x9W4vcH?=
 =?iso-8859-1?Q?1Pad2V+6kC7UZtxtjgdSar0DI2oD4Rsn5tPUOCFC/1vfl/7PVPE+9K1j4B?=
 =?iso-8859-1?Q?NQECbLeazp98uIOf0N28s6hHdNF5yzbS76CUQFsGWByzl6hzuXY2WpBgKc?=
 =?iso-8859-1?Q?wlcNL9GeEkEWH7eEHHUuNY6c5nh16oUxRNCoyHGy/FJgP4kRK1QJqLWhOM?=
 =?iso-8859-1?Q?ZBZXsR/5AY3hEh7ViDUAfd2zhcM+FL8jwvBjt0O5zA5itOX8y+jveeVLLs?=
 =?iso-8859-1?Q?mNuoZ9fHBn8rSgwkZ+aQPqt/kMVuNvwZFyNMXl+wg7pgsvPWOcvmGUIZVg?=
 =?iso-8859-1?Q?Iq8qIbe8cozMzU97ee5LNUkxQMVPw5SpgTCvuknrF+9pLqjSxYWMDZrony?=
 =?iso-8859-1?Q?KqKFtDFn2Sg3D8qXxMSljTnEPx4oPRqywDDkdd7XqFmwAWU57DBUUSCpTb?=
 =?iso-8859-1?Q?Y6dTNmQAh78MIbVlVdRV6hCsF/cuSazAuQw48DBcMcb+1hAW6pukqAoW4W?=
 =?iso-8859-1?Q?04sCAYS3RfjdWc3wb9LM15JmWL1yeMQ6EIRNbNQE4t7CL9gbWWJt3BpQxJ?=
 =?iso-8859-1?Q?+sA7jNsFMIdGFgZDaJT3uQD9QJ3rHFmwbXYH8C1FkX7nzrPbyu3NkSAKYF?=
 =?iso-8859-1?Q?13FH27E2DTfX7z0O/8VtB0BcuJPbYt354JycTWiCgxhuFVfhWp8A/gr0po?=
 =?iso-8859-1?Q?mTUnvVjK4wBQrmq5E+sZOpZeuGs3Dt2tzkl0CS4sbEy4wdunukTvrkmP55?=
 =?iso-8859-1?Q?eQRO1louZiQKlsx5xPM49C2DLj7crHpP4y1DYYJWx96oT4MKTqpB2lWVUu?=
 =?iso-8859-1?Q?XOKp3EG5GndmsSj5EWgsX4LvkI2uo5zacMScZL/3KGhHfH5FvY6nabMm+j?=
 =?iso-8859-1?Q?sN++Lgp6SKMfM6EE9ckPZQbHJFWx4SYcIYNB/vfgAYfACd101Q0FjtQa5+?=
 =?iso-8859-1?Q?sY89MeDhvvl6C2fPWgPwCfmw1BB+8shrDpzDFk/5LDoQeJM7VgGQsMpjXU?=
 =?iso-8859-1?Q?CCAKbPJR8fm5YdTp1aVVbMa4zh+2BB6TOESf+DLhW/fcMXgYTyOllK0TlJ?=
 =?iso-8859-1?Q?H68xTRGtmdhMIiGfYxUUHpn3gCVRTHDawmKedpTdLFblhWyxoppBfA7Wkb?=
 =?iso-8859-1?Q?kklHPFg+gqrSsYJ+?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?eAcxnU54ZFkFt241SfptCnREjg+xm2yBraL6xfOhkNTiXNT70Xamv/QIQM?=
 =?iso-8859-1?Q?Ue0eF5KXXHSFuW85EmEf0yWfLKtHWQoEPQ8vsFUvTCynxTlQjzXreLH4xN?=
 =?iso-8859-1?Q?EKKYZDln53Kip+k5EtgnAdTfxcEbWi9C0IEIoJ+McCC8mqV5HDab5rJ2Wh?=
 =?iso-8859-1?Q?2ElJaQRHvO2A29PESFA40l+i0QMpc1F6By/GxWAyV4cd0dAwM9boh+QHzh?=
 =?iso-8859-1?Q?aQkayH0rdSM69yX0PjpANR4+mtHXzpnxIspezGTrzj3c4kBbOXoydNU4Q3?=
 =?iso-8859-1?Q?XRPXJMkE3lBRwXl1V898uZ7cwWIDcVzPtBnKKIpa5zKwxQYWx3YpGUCOv3?=
 =?iso-8859-1?Q?GDbdcZkKj2IOjbIHEy9cNjS8RrMUPpJN+1Ow4nWUHTFJm5OpS8ppNbT4bc?=
 =?iso-8859-1?Q?xLJMX37upVmkZivib835HGjknkg9L032mb+9ZQdiCerIiF8SGtKUpwWcuN?=
 =?iso-8859-1?Q?o/0/N8Iamb81dxD/3Wm73kf3JoMe0kOadlC1V3pyC86R/X1yU9mGvPn3F0?=
 =?iso-8859-1?Q?O2sWJwYhLlpSbWkmsXg1bIBYtWhxsXvfMScI2ELKaCi5jZADtfGbPURqp3?=
 =?iso-8859-1?Q?85UXmuunbVcP33GLWJYZbNgLETovxYajSqmWMFwjcmaL8rDe69TyWdjfA6?=
 =?iso-8859-1?Q?IpEK8AymFuZemXGAgPGC8qnr2pEYu7kFDaVTv6T3t1jO85uJ6hsf0gAh+B?=
 =?iso-8859-1?Q?m2UsHIXaWgTHyJ5nesScVB6cvzzthlq6J4FgFFI6Os/+Lez9bRtSHt0enK?=
 =?iso-8859-1?Q?F/uxIoRWAomISvNISDN5ehnKUOk0o23+ehjWTOKBZqvpIryKEtwByA467w?=
 =?iso-8859-1?Q?74E+xhoSOrLXBZj3K/DP4bjt2rJDmvng23dS22DdEabJrW/C9h50zXZ1cY?=
 =?iso-8859-1?Q?T5McsYhbP0zpoE2o3J7CfXJXpMuU8p9i/QXyPgzKlH4PkLqQqWkVnZSgZp?=
 =?iso-8859-1?Q?3mgB2fda8zlppE6YFraG5WPu1uNVy+s4BvvCGRqUm3EQVfD3F2DbMnxx8Y?=
 =?iso-8859-1?Q?K9NSq26uxlKzd1C9lH3EjkQrf8iFnftM0ASgpWkbkj67pqN5JbCjHHL5eo?=
 =?iso-8859-1?Q?5Ww/Ow4DdvNpKG7ZKMCzEATXbBgAFSRmXKzaeNwESFQT6CVPnI0zLEoEY9?=
 =?iso-8859-1?Q?ZP/EO52m2zkEon4X36P/NYFpL4aGc2iftikYPH9Du/u5/MMhZEMxLLNltJ?=
 =?iso-8859-1?Q?YihD9bCmhS0zhUXYEGJGMyeS3RLc9VLS1BX7+D6AgLgzvoB0cT4pYx2N0l?=
 =?iso-8859-1?Q?0KQYxyWgey5fQ6gvC+A9wpn4eDYm/PFw0IunLDRvIQpJ3P9TN2sdhUwk7W?=
 =?iso-8859-1?Q?aSfC6U4zgOil+L9vkli4pjt7lVnf9a24hRtySWFpAW1RUoqz5BAdlJ1bCv?=
 =?iso-8859-1?Q?yN208L1VvFd57Nr8yqOSFxOKaEGftYAvXiTtPVVnnBmF9rzH3RpQevyWma?=
 =?iso-8859-1?Q?mMxdhWigtqcvqXDZBca87B5Ukcmw+Slw3edRWBJM8gqk4l/6f+7rrwRLoR?=
 =?iso-8859-1?Q?hQk1cZ3pTCExA+hQMXOaBmN8RT2U/9Pw0QRMMXSO5LshHmlQiBmboYp/w6?=
 =?iso-8859-1?Q?R0ceQxnMxYfFEgk3neuwFyLbhIAnvOFxfc0XFmghgXfUAN8JN9RYz28f7p?=
 =?iso-8859-1?Q?iht84Kxll6PlSzODQAOe0/PCKk0k0Jp6Jm?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <1057019D84C3454D9283E9C6553F08A8@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7630.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af45195a-4cc1-4275-35c4-08dd6393b97c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2025 07:33:47.9209 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TdgEW0QfcOHY6wwOh5OMsWCZABfL2RzO9Y3+e4G0kMCflCpVhmGbKG0NTnQ16wTW2iOawl5GNPAKWWDZP72n+QrhPU16Rh3HPbkN7lnmqA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6801
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

From:=A0Rob Herring <robh@kernel.org>=0A=
Sent:=A0Friday, March 14, 2025 10:06 PM=0A=
=A0=0A=
>On Wed, Feb 26, 2025 at 03:19:14PM +0100, Maud Spierings wrote:=0A=
>> Add the bindings that describe a GOcontroll Moduline module slot. This=
=0A=
>> slot provides all the interfaces to interface with a Moduline compatible=
=0A=
>> IO module. The actual module is not reasonable to describe as it can be=
=0A=
>> swapped at will, with this connector the driver will be able to probe=0A=
>> for a module on boot.=0A=
>>=0A=
>> The connector consists of 2 parts, one part for interfacing with the SoC=
=0A=
>> and main board, the other part has 13 IO channels for the module to=0A=
>> interact with the outside world. The functions of these IO channels are=
=0A=
>> determined by the type of module in the slot. The IO on the SoC side is=
=0A=
>> as follows:=0A=
>>=0A=
>> =A0- a 3v3 supply, this tends to be the logic level of the module and it=
s=0A=
>> =A0 =A0microcontroller=0A=
>> =A0- a 5v0 supply, this can be used to power low power peripherals on th=
e=0A=
>> =A0 =A0module=0A=
>> =A0- a 6v-8v supply, this can be used for high power peripherals on the=
=0A=
>> =A0 =A0module=0A=
>> =A0- a 6v-30v supply, this tends to be a dirty supply that comes from th=
e=0A=
>> =A0 =A0controller supply after some circuit protection, or is the same a=
s=0A=
>> =A0 =A0the 6v-8v supply.=0A=
>> =A0- an SPI bus which carries the communication between the SoC and the=
=0A=
>> =A0 =A0microcontroller on the module.=0A=
>> =A0- an I2C bus shared between the SoC and all module slots which can=0A=
>> =A0 =A0carry direct module-to-module communication.=0A=
>> =A0- a reset line=0A=
>> =A0- an interrupt line that indicates a clear to transmit signal=0A=
>> =A0- a sync line shared between the SoC and all module slots which could=
=0A=
>> =A0 =A0be used to synchronize modules for time sensitive IO spread acros=
s=0A=
>> =A0 =A0modules.=0A=
>> =A0- a SMBus alert line that is shared between the modules but is not=0A=
>> =A0 =A0connected to the SoC so that is ignored.=0A=
>>=0A=
>> A slot-number property is used to identify the physical location of a=0A=
>> module slot. Without it, it would be impossible to identify which module=
=0A=
>> to control if there are multiple of one type, to address the desired IO.=
=0A=
>=0A=
>Is that for a person to identify slots or s/w? If just a person, we=0A=
>generally use 'label' as in a sticker on the connector. If s/w, we=0A=
>generally try to avoid made up indexing in DT though there are some=0A=
>exceptions.=0A=
=0A=
I guess both, I am not quite sure how the uapi will look like eventually.=
=0A=
Right now we just kind of know that spidev1.0 is slot 1 etc.=0A=
=0A=
Maybe label: true could be enough but that seems to generic, it allows too=
=0A=
much wiggle room, if there is an eventual library that uses the kernel=0A=
uapi instead of the spidev interface it must be consistent. Or can the=0A=
label be restricted to being "moduleslot#"? I feel that numbers best=0A=
represent the way we lay out these module slots, and will provide the best=
=0A=
interface.=0A=
=0A=
>> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>=0A=
>> ---=0A=
>> =A0.../connector/gocontroll,moduline-module-slot.yaml | 88 +++++++++++++=
+++++++++=0A=
>> =A01 file changed, 88 insertions(+)=0A=
>>=0A=
>> diff --git a/Documentation/devicetree/bindings/connector/gocontroll,modu=
line-module-slot.yaml b/Documentation/devicetree/bindings/connector/gocontr=
oll,moduline-module-slot.yaml=0A=
>> new file mode 100644=0A=
>> index 0000000000000000000000000000000000000000..a16ae2762d160180d5b163e2=
0f5294235e65053b=0A=
>> --- /dev/null=0A=
>> +++ b/Documentation/devicetree/bindings/connector/gocontroll,moduline-mo=
dule-slot.yaml=0A=
>> @@ -0,0 +1,88 @@=0A=
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)=0A=
>> +%YAML 1.2=0A=
>> +---=0A=
>> +$id: http://devicetree.org/schemas/connector/gocontroll,moduline-module=
-slot.yaml#=0A=
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#=0A=
>> +=0A=
>> +title: GOcontroll Moduline Module slot=0A=
>> +=0A=
>> +maintainers:=0A=
>> + =A0- Maud Spierings <maudspierings@gocontroll.com>=0A=
>> +=0A=
>> +description:=0A=
>> + =A0The GOcontroll Moduline module slot represents a connector that ful=
lfills the=0A=
>> + =A0Moduline slot specification, and can thus house any IO module that =
is also=0A=
>> + =A0built to this spec.=0A=
>> +=0A=
>> +properties:=0A=
>> + =A0compatible:=0A=
>> + =A0 =A0const: gocontroll,moduline-module-slot=0A=
>> +=0A=
>> + =A0reg:=0A=
>> + =A0 =A0maxItems: 1=0A=
>> +=0A=
>> + =A0interrupts:=0A=
>> + =A0 =A0description: indicates readiness, high means busy.=0A=
>> + =A0 =A0maxItems: 1=0A=
>> + =A0reset-gpios:=0A=
>> + =A0 =A0description: resets the module, active low.=0A=
>> + =A0 =A0maxItems: 1=0A=
>> + =A0sync-gpios:=0A=
>> + =A0 =A0description: sync line between all module slots.=0A=
>> + =A0 =A0maxItems: 1=0A=
>> +=0A=
>> + =A0vdd-supply:=0A=
>> + =A0 =A0description: low power 3v3 supply generally for the microcontro=
ller.=0A=
>> + =A0vddp-supply:=0A=
>> + =A0 =A0description: medium power 5v0 supply for on module low power pe=
ripherals.=0A=
>> + =A0vddhpp-supply:=0A=
>> + =A0 =A0description: high power 6v-8v supply for on module high power p=
eripherals.=0A=
>> + =A0power-supply:=0A=
>> + =A0 =A0description: high power 6v-30v supply for high power module cir=
cuits.=0A=
>> +=0A=
>> + =A0i2c-bus:=0A=
>> + =A0 =A0description: i2c bus shared between module slots and the SoC=0A=
>> + =A0 =A0$ref: /schemas/types.yaml#/definitions/phandle=0A=
>> +=0A=
>> + =A0slot-number:=0A=
>> + =A0 =A0description:=0A=
>> + =A0 =A0 =A0The number of the module slot representing the location of =
on the pcb.=0A=
>> + =A0 =A0 =A0This enables access to the modules based on slot location.=
=0A=
>> + =A0 =A0$ref: /schemas/types.yaml#/definitions/uint32=0A=
>> +=0A=
>> + =A0spi-max-frequency: true=0A=
>> +=0A=
>> +required:=0A=
>> + =A0- compatible=0A=
>> + =A0- reg=0A=
>> + =A0- reset-gpios=0A=
>> + =A0- interrupts=0A=
>> + =A0- sync-gpios=0A=
>> + =A0- i2c-bus=0A=
>> + =A0- slot-number=0A=
>> +=0A=
>> +additionalProperties: false=0A=
>> +=0A=
>> +examples:=0A=
>> + =A0- |=0A=
>> + =A0 =A0#include <dt-bindings/gpio/gpio.h>=0A=
>> + =A0 =A0#include <dt-bindings/interrupt-controller/irq.h>=0A=
>> +=0A=
>> + =A0 =A0spi {=0A=
>> + =A0 =A0 =A0 =A0#address-cells =3D <1>;=0A=
>> + =A0 =A0 =A0 =A0#size-cells =3D <0>;=0A=
>> +=0A=
>> + =A0 =A0 =A0 =A0connector@0 {=0A=
>=0A=
>I find this being a SPI device a bit strange. Is there a defined SPI=0A=
>device that every slot is going to have? Or the connector has SPI=0A=
>interface and *anything* could be attached on it?=0A=
=0A=
So a module slot is like a pcie slot, it can be occupied or not, and when=
=0A=
it is occupied it can be any kind of module, but it can at least only be=0A=
one module, there is no hub like functionality.=0A=
=0A=
On this module is a microcontroller or perhaps even an FPGA in the future=
=0A=
which is the spi-device, it has the miso, mosi, sclk and cs hooked up to=0A=
it.=0A=
=0A=
For now this tends to be some kind of stm32f4xx, but it is very much not=0A=
set in stone. The only thing sure is there is some kind of module=0A=
controller that is hooked up to the spi device when a module is present.=0A=
=0A=
So I would say it is option 2 of what you ask. But the 'anything' is=0A=
restricted to module compatible with the standard, its not just going to=A0=
=0A=
be some IC like an ADC chip like the mcp3004 that we use on the mainboard.=
=0A=
=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0reg =3D <0>;=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "gocontroll,moduline-module-slot=
";=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0reset-gpios =3D <&gpio5 10 GPIO_ACTIVE_LOW>;=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0sync-gpios =3D <&gpio4 16 GPIO_ACTIVE_HIGH>;=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0interrupt-parent =3D <&gpio4>;=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0interrupts =3D <5 IRQ_TYPE_EDGE_FALLING>;=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0vdd-supply =3D <&reg_3v3_per>;=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0vddp-supply =3D <&reg_5v0>;=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0vddhpp-supply =3D <&reg_6v4>;=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0i2c-bus =3D <&i2c2>;=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0slot-number =3D <1>;=0A=
>> + =A0 =A0 =A0 =A0};=0A=
>> + =A0 =A0};=0A=
>>=0A=
>> --=0A=
>> 2.48.1=0A=
>>=0A=
=0A=
I hope this cleared everything up and the bindings are still okay=0A=
=0A=
Kind Regards,=0A=
Maud=
