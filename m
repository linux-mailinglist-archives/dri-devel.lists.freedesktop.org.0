Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EM6pNvM5qWnf3AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:08:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 841A820D2D3
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:08:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F12C10EB5D;
	Thu,  5 Mar 2026 08:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="MlsJCtQD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013021.outbound.protection.outlook.com
 [40.107.162.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF1E410EA85;
 Wed,  4 Mar 2026 17:59:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H0Uh1YfDvcrGxRW+w8Z/vuj6dR91pq1o2UZgUiVMrc5oF0+2kW7jtf5Jrl6rXEU8W73pNh5LBsm7AcSqxzJv8grR7ucDdN8RwUxnmxl22rzkngnkUSKTkI2nC6xtemOcS6v7pt0PyjI6qc+KYzy9yI3ZKVOn1ylgEIHDRuztN8gxg60OsiE2WRHT5UzfAsKOaMMuMf3DUjtmtVEQJhS3KlToBDFE8lAMSN/o2BNXGoB0sAFS1fir3Yv0dHifvPiFdHoNLv3w+plQX5rBKnCSJhT+tHd2PPKJ+JTApmJ9qqdMh4XnLT1dyt4sHaYf1xnnR3v32U6r0i2q/trQbufr6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEpLrHdjyvu2FVGiSKs1m02A5SWMO7hmysQhYBra8xQ=;
 b=HKM/hKPyg9UboWAXzbZabNTs2p7sGRN/MlFot0iz8aSZWse/m2PuqkhiYIUgbQsf+jXcFV6N8mdv8RiWg8bNqOwCxn4hfeSrkBT20DqjvWVnz0ldqi3R0yb+y6hu/+OmSO+2Hug7eh7zBBWRaC9YwldOjhZH5msi+ERwORDLQdgy0Bf7cudEk5vS/JbXidaMS6MI43eOt1St5vToLJG2FFuWeMXknXjSPGYGCBsmpI1JG0CkQOh6+AUPLCs8UkyU47M1eAZaBtjxikbAqGWr+NauAOeDx1hHtesxDYRsGMrIp3Z0/iLrDem4bBIbQQZeZo2cGXN057/9u5UyqvUjzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEpLrHdjyvu2FVGiSKs1m02A5SWMO7hmysQhYBra8xQ=;
 b=MlsJCtQD2lJMtEnVbaYJ1tUnW4LGWC5A7DcYJhnjULO0ZuEn6ElKEdtyUdX93fCIMuA5/1L6wC1j23LHRAAD8Jrjdn+NH1yQbbbNCTekSY0+ZZJeIEQOHu7Pv3o6pW+qZkLqQTaZCZV9rRsa7DjHtFUafxOGh90KokEEuYwvvUDpmx1b2ZqL3QQtzYADw9efvS/077TCROwmZx5l0mj3D7Ue1KKmREwgboooJERNDOZ43YsdGKN9MYZIBwQu/OmfsAL/CUvRJBvH0Iw37YNZ06ZetJkmDYpMNEOH6edwQG7h4JPKq2w7SvYCbFcOMjKSdB724TdBEZ5X9rSafxl/Uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by AM9PR04MB8778.eurprd04.prod.outlook.com (2603:10a6:20b:409::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 17:59:51 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 17:59:51 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Andy Yan <andy.yan@rock-chips.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Chen-Yu Tsai <wens@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Damien Le Moal <dlemoal@kernel.org>,
 Daniel Machon <daniel.machon@microchip.com>,
 David Airlie <airlied@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Dmitry Baryshkov <lumag@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kevin Xie <kevin.xie@starfivetech.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linusw@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Dege <michael.dege@renesas.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Niklas Cassel <cassel@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Peter Chen <peter.chen@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>,
 Rob Herring <robh@kernel.org>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Samuel Holland <samuel@sholland.org>, Sandy Huang <hjc@rock-chips.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sre@kernel.org>, Shawn Guo <shawn.guo@linaro.org>,
 Shawn Lin <shawn.lin@rock-chips.com>, Simona Vetter <simona@ffwll.ch>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Vincent Mailhol <mailhol@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH phy-next 00/22] Split Generic PHY consumer and provider API
Date: Wed,  4 Mar 2026 19:57:13 +0200
Message-ID: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P195CA0030.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::19) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|AM9PR04MB8778:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bb43606-4bf2-49a9-6f5a-08de7a17d519
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|7416014|52116014|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: FXVbwZRauYz0AZgJler4IT9dRsyezmvCCoIHpruDjHvT5Cti+1Vg8gP6pbkDfU/tQe4rXZ22CB5x7E7VT3HuBOIv03I1rwEmUwJlbpZybZ/374OPzLUqFkZTZsgOOpEVXP67UlWawfNnRlG4xWemP+JspWfcfonuahzvNQacumKQm3ug0r315EjTZqV/cMnLyfLBuuEZa8pbsfHQTs5qp02wMBQr3iY0BErDF8DuuFZZ2XSeh4wnygGcnufka9jA55ZtE8/shpnmtTVlWtsFYQ6vMW816Hr0H+4g3h8eUJNGUborM0TZDQCYMHdtvat5uU7eKfC2avfKgVSqID1RFVbGJ4z0jbUxS3vJ5doIrUYuZJbwL/+PRJRWMzvnZNT830YpaBHBQLF+i5dn1ID6sZp3HTyKessTInl+TGMF/rETSvknD+MqtoBUOOR8hK68F4PhLxRlKWH0fLVrx5E0p6l+IjbQmrtp0THyt10vgap8aHd2i9T9enPm5S2x4puVWLuL+HRBXWfUJ43ZfME/4L6JhxJ62C1Vb+QDW1ZXxV9vmL+dAquyf3gs246AkQjmuycMMg3qXWEsHj0urEbMxpT4bJ4M2UOTuW4b4YRYLAKjITRj1Os1zV2YPzahLAx9fVrkMXenlP5X4+/oxXPZKXkJoWp8KfV/nKaggB5hGAKHP3azsSWzfK8BNKF0JWudc7UPk0tnpMez62NCs0YubwFy5KHGM9gwt+nKp3jhlT0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(7416014)(52116014)(376014)(366016)(1800799024)(10070799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWU5K3pmcUJxZ2Rpc3NxN1Z3NWdEN2FQWjQwVWg1WHFSZmUydEpocXl5VDBC?=
 =?utf-8?B?NVh2MXdFNWxIMlRYQUt0aVAwVlhTa08vTjEvVmtGQ0theWhxaFBDTGZBMmtO?=
 =?utf-8?B?RVdHZ3d6aS9NbWI2RmRwdm1xaGl0eEYwTmJ4OXNETS8rL1NmdDMrMzFSMzdP?=
 =?utf-8?B?ZXVJV29yUUFYenNWUkxWUkc2d3kweDIrZ0kzSXVDUzkvNHBrNnRhYmkrTHps?=
 =?utf-8?B?WWp3U1BHeXhIZ3pSUFNJUkpPd2hZMlVrQldzT2FCSXdmNHY2b0RMSFZ4cmtN?=
 =?utf-8?B?bHZFeW1NL0lUQlRSclFOWW1LM3Q4VEVMTis1d081U2g5dEJoRjloSjZvT1Mr?=
 =?utf-8?B?d0t5SndOTUlJeld2a2x5d2ZiMVpFVW4ydlFxWld5K0s4NnBqVXF0RVhlckp0?=
 =?utf-8?B?a2dlYUpDajhTaUxlZmI2NGRmeFdwUllDTGRiZ0VvZC8yODhLOUJmRVBXWGl6?=
 =?utf-8?B?WUZTZ3hPN2haUzR1MHNzUC9PZVg3ZW9ZL3prUUlieHZYYVplSVd5Y0w4RFNu?=
 =?utf-8?B?MUNVcmVVM2l0WjZ3MExSZnY1OFJSc3FYS01xM1BvM29mcG55YjdYMG4rYmpE?=
 =?utf-8?B?ZUo3bkJLbUt0dTNONHhYb0Fsam9ndExNZXJiRFpZS1FjdS8xbWdkTkhSaGJR?=
 =?utf-8?B?aDNralpHUVZsb3M2ZmpVb3RNQlFKcm9GLytRemJpWllnWDQ4QnVEWXpwL0dm?=
 =?utf-8?B?SHBreExuRmRHSXhpYjFzRU9Fb3BIUzlBa0xEYUQ0Unp0a0FPRHRNRGZvaUFx?=
 =?utf-8?B?L0lLVHJZTjk4QkVudzFWZ3VnMWgrNlByVlFtUVJtQmlnY1NrbURpY2hQZ0Yx?=
 =?utf-8?B?M0JxeHplUjFIdGo5ZHBwYWRhY1dOT2FvYXVqTTAzalVwL0g0TkpaYllnMnU4?=
 =?utf-8?B?ZlloN3oxSUhBV3BjQXZxNDBxQlUzTEIvNHRHODhCZUZ4UU0wT1VHR3VZY2M2?=
 =?utf-8?B?cmZzQlV4SHVJWXQ0YmdHZis5Slk3cDRkR2tuK1NickJac1RIV3R4bnNSaTQ0?=
 =?utf-8?B?UVdCZ3YraWN2ZWh3VDZ6eTlxdmpxLytLWmJieDZLUnE3Wi9uTmQ2d3J4SEhI?=
 =?utf-8?B?aE9TRDNoRmF0Z1FNM0lmS0RkYVRkdGZlazlZZ1BsbjJpeDNQM212VW1SRlZk?=
 =?utf-8?B?RC93dW9NaUtOcDNSTDc5SHVmclM1SHdJUDVTdEFQbXh6dXFhNHpQSjVXRnJP?=
 =?utf-8?B?WEFwSFBtVmFrSHQ3NjBjdXd3Wm4vUUxnTkJvemZOU2QreVdTSXFldGxOWWxB?=
 =?utf-8?B?TkxISlhFRzVPZmNoeTk1YUZ1aUtOYzVqRzdEYm1lOEcrMjl3dWtra2pVaDZO?=
 =?utf-8?B?eFNBekswczNOaUZ1Zmk3QUNCSVNKZDhFM2NvblQxenJXN2g3WFY2Z3NTZ1pC?=
 =?utf-8?B?RFdtMGVuWTNtQVY0TEVQR0d3OTJSbWw5MWQ5OG8xTkRzM0EvWHpobnd5d0ZY?=
 =?utf-8?B?Y0d3bkZvUmhXRnhxL0RPYk9JRFMvNmVJbmFMUFh1emZoU0JtYzNqMmg3YlNK?=
 =?utf-8?B?ajNqSUFqMkFZbDV0dGIrZ0JKTmUvSDl1SllmRXcwQVJmT2NzQ1l3TERHdnAr?=
 =?utf-8?B?R1Y2SlFKSkZKbHpPL0IyZitCaXFSbnNOVUJHanN4ZFpjWUFsdS9OR1pHaERT?=
 =?utf-8?B?bEVqVUlDcjFKWFFOcHF6Tk9keHdsMTltMEFQTERmWndHN1N1R1hVamluVlkv?=
 =?utf-8?B?bDBTcmtsZUwvSUFoL1hiOEpzaVdFalVXOWJGZ3g1UFFJdGlIQWkwcjZlcVZp?=
 =?utf-8?B?a3dscmNXVUthcmhIcExYUXMzMk5DekFMamhPOEdGTkVlK0NUWElrZHFoN1NZ?=
 =?utf-8?B?NnR6eEJZTkFTazRaOXY1eEd6ZEhUSng5WjRzd3dKRHFwYlBDUlVMYnQ3bnUz?=
 =?utf-8?B?bEFhRHBHbWxibTN2c3dtZ011SG82QkxJT25ialRONHhxWmhvekFKQUttNDlH?=
 =?utf-8?B?V2xiZ2NSK3RyV3F4NVBWcGJ0Skx5eWhLamllNkFqK2tZZEp3Ui90OXo0Yitt?=
 =?utf-8?B?VHJBd240cDJieHN5ZWNzbmpMeFNjY0RMWWROOUpob3dWMnROQW5zRjhITWU4?=
 =?utf-8?B?WjFFTG5Vbm1WKzh4SjRiM0RSaW5TMWhISjRIV2xrNFZPL0htd2NrakZTUlE2?=
 =?utf-8?B?ZEQxRmIvWFlTWjRkS1ZhK015Y204WVNkYUlVSnkvUU1KeGp0R0VZZVRsMTlX?=
 =?utf-8?B?K2pPS0pqNlJTcllHVHEwYVM4dWd5SnhlcVJnMzVvRk1FenhrL2J3MjNXR3Yz?=
 =?utf-8?B?U2lQYmhqdjB6K0V6ZHhNc3ljNjc3c2N3NXlCNXlFNjgwMy9zT2h5aWY5bERq?=
 =?utf-8?B?NllKNDlJQUVYVDFCVWdzSXRkdjNXZHU0YlQzaHFsamQxWUdmcmlKRXhFdWQ0?=
 =?utf-8?Q?Q/cE2wQ3XkqzIvCNqrMoUeiLlchl2mpVPgkSW01GxkLsJ?=
X-MS-Exchange-AntiSpam-MessageData-1: CsjaXyVRpQJJuJAYubrs7xslqvLZKxaLOuE=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bb43606-4bf2-49a9-6f5a-08de7a17d519
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 17:59:51.3202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VWW7CrIatBk86BkXOpRKDnH1sGkVXyadeOXJnnzIejhLhlQuM6++NTs/uDzfZLpBcKARSbuMk2I48CkCX0+cnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8778
X-Mailman-Approved-At: Thu, 05 Mar 2026 08:07:48 +0000
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
X-Rspamd-Queue-Id: 841A820D2D3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,microchip.com,linux.dev,bootlin.com,lunn.ch,intel.com,rock-chips.com,google.com,tuxon.dev,gmail.com,davemloft.net,nxp.com,glider.be,linuxfoundation.org,sntech.de,samsung.com,amarulasolutions.com,kwiboo.se,nvidia.com,starfivetech.com,oss.qualcomm.com,ideasonboard.com,linux.intel.com,pengutronix.de,somainline.org,baylibre.com,renesas.com,redhat.com,armlinux.org.uk,sholland.org,poorly.run,ffwll.ch,synopsys.com,suse.de];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[92];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,netdev,renesas,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

The biggest problem requiring this split is the fact that consumer
drivers poke around in struct phy, accessing fields which shouldn't be
visible to them. Follow the example of mux, gpio, iio, spi offload,
pwrsec, pinctrl and regulator, which each expose separate headers for
consumers and providers.

Some off-list discussions were had with Vinod Koul regarding the 3 PHY
providers outside the drivers/phy/ subsystem. It was agreed that it is
desirable to relocate them to drivers/phy/, rather than to publish
phy-provider.h to include/linux/phy/ for liberal use. Only phy.h and
(new) phy-props.h - consumer-facing headers - stay there.

The hope is that developers get a hint when they need to include the
wrong header to get their job done.

If that fails, patch 22/22 adds a regex in the MAINTAINERS entry that
ensures linux-phy is copied on all Generic PHY patches, for an extra set
of eyes.

Requested merge strategy, I hope this works for everyone:
- Subsystem maintainers ACK their affected portions
- Entire series goes through linux-phy
- linux-phy provides stable tag
- Said tag is merged back into affected subsystem 'next' branches

Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: "André Draszik" <andre.draszik@linaro.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Andy Yan <andy.yan@rock-chips.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Chen-Yu Tsai <wens@kernel.org>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Damien Le Moal <dlemoal@kernel.org>
Cc: Daniel Machon <daniel.machon@microchip.com>
Cc: David Airlie <airlied@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jessica Zhang <jesszhan0024@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Kevin Xie <kevin.xie@starfivetech.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Michael Dege <michael.dege@renesas.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Niklas Cassel <cassel@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Peter Chen <peter.chen@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sean Paul <sean@poorly.run>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Steen Hegelund <Steen.Hegelund@microchip.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Vincent Mailhol <mailhol@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Vladimir Oltean (22):
  ata: add <linux/pm_runtime.h> where missing
  PCI: add missing headers transitively included by <linux/phy/phy.h>
  usb: add missing headers transitively included by <linux/phy/phy.h>
  drm: add <linux/pm_runtime.h> where missing
  phy: add <linux/pm_runtime.h> where missing
  phy: spacemit: include missing <linux/phy/phy.h>
  net: lan969x: include missing <linux/of.h>
  PCI: remove device links to PHY
  ufs: exynos: stop poking into struct phy guts
  drm/rockchip: dw_hdmi: avoid direct dereference of phy->dev.of_node
  drm/msm/dp: remove debugging prints with internal struct phy state
  phy: move provider API out of public <linux/phy/phy.h>
  phy: introduce phy_get_max_link_rate() helper for consumers
  drm/rockchip: dsi: include PHY provider header
  drm: bridge: cdns-mhdp8546: use consumer API for getting PHY bus width
  media: sunxi: a83-mips-csi2: include PHY provider header
  net: renesas: rswitch: include PHY provider header
  pinctrl: tegra-xusb: include PHY provider header
  power: supply: cpcap-charger: include missing <linux/property.h>
  phy: include PHY provider header
  phy: remove temporary provider compatibility from consumer header
  MAINTAINERS: add regex for linux-phy

 MAINTAINERS                                   |   1 +
 drivers/ata/ahci.c                            |   1 +
 drivers/ata/ahci_brcm.c                       |   1 +
 drivers/ata/ahci_ceva.c                       |   1 +
 drivers/ata/ahci_qoriq.c                      |   1 +
 drivers/ata/libahci.c                         |   1 +
 .../drm/bridge/analogix/analogix_dp_core.c    |   1 +
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   |   7 +-
 drivers/gpu/drm/bridge/nwl-dsi.c              |   1 +
 drivers/gpu/drm/bridge/samsung-dsim.c         |   1 +
 drivers/gpu/drm/bridge/synopsys/dw-dp.c       |   2 +-
 drivers/gpu/drm/msm/dp/dp_aux.c               |   1 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c              |  18 -
 drivers/gpu/drm/rockchip/cdn-dp-core.c        |   1 +
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   |   1 +
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c   |  25 +-
 .../sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c    |   2 +-
 drivers/net/can/at91_can.c                    |   2 +-
 drivers/net/can/flexcan/flexcan-core.c        |   2 +-
 drivers/net/can/m_can/m_can_platform.c        |   2 +-
 drivers/net/can/rcar/rcar_canfd.c             |   2 +-
 .../microchip/sparx5/lan969x/lan969x_rgmii.c  |   1 +
 drivers/net/ethernet/renesas/rswitch_main.c   |   1 +
 drivers/pci/controller/cadence/pcie-cadence.c |  16 +-
 drivers/pci/controller/dwc/pci-dra7xx.c       |  16 -
 drivers/pci/controller/dwc/pci-keystone.c     |  32 +-
 drivers/pci/controller/dwc/pcie-dw-rockchip.c |   1 +
 drivers/pci/controller/dwc/pcie-histb.c       |   1 +
 drivers/pci/controller/dwc/pcie-qcom-ep.c     |   1 +
 drivers/pci/controller/dwc/pcie-spacemit-k1.c |   2 +
 drivers/pci/controller/dwc/pcie-tegra194.c    |   1 +
 drivers/pci/controller/pci-tegra.c            |   1 +
 drivers/pci/controller/pcie-rockchip-host.c   |   1 +
 drivers/pci/controller/plda/pcie-starfive.c   |   1 +
 drivers/phy/allwinner/phy-sun4i-usb.c         |   3 +-
 drivers/phy/allwinner/phy-sun50i-usb3.c       |   3 +-
 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c   |   4 +-
 drivers/phy/allwinner/phy-sun9i-usb.c         |   3 +-
 drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c |   2 +
 .../amlogic/phy-meson-axg-mipi-pcie-analog.c  |   3 +-
 drivers/phy/amlogic/phy-meson-axg-pcie.c      |   2 +
 .../amlogic/phy-meson-g12a-mipi-dphy-analog.c |   3 +-
 drivers/phy/amlogic/phy-meson-g12a-usb2.c     |   2 +
 .../phy/amlogic/phy-meson-g12a-usb3-pcie.c    |   3 +-
 drivers/phy/amlogic/phy-meson-gxl-usb2.c      |   3 +-
 drivers/phy/amlogic/phy-meson8-hdmi-tx.c      |   3 +-
 drivers/phy/amlogic/phy-meson8b-usb2.c        |   3 +-
 drivers/phy/apple/atc.c                       |   3 +-
 drivers/phy/broadcom/phy-bcm-cygnus-pcie.c    |   3 +-
 drivers/phy/broadcom/phy-bcm-kona-usb2.c      |   4 +-
 drivers/phy/broadcom/phy-bcm-ns-usb2.c        |   3 +-
 drivers/phy/broadcom/phy-bcm-ns-usb3.c        |   3 +-
 drivers/phy/broadcom/phy-bcm-ns2-pcie.c       |   3 +-
 drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c     |   3 +-
 drivers/phy/broadcom/phy-bcm-sr-pcie.c        |   3 +-
 drivers/phy/broadcom/phy-bcm-sr-usb.c         |   3 +-
 drivers/phy/broadcom/phy-bcm63xx-usbh.c       |   3 +-
 drivers/phy/broadcom/phy-brcm-sata.c          |   3 +-
 drivers/phy/broadcom/phy-brcm-usb.c           |   2 +-
 drivers/phy/cadence/cdns-dphy-rx.c            |   3 +-
 drivers/phy/cadence/cdns-dphy.c               |   4 +-
 drivers/phy/cadence/phy-cadence-salvo.c       |   3 +-
 drivers/phy/cadence/phy-cadence-sierra.c      |   3 +-
 drivers/phy/cadence/phy-cadence-torrent.c     |   3 +-
 drivers/phy/canaan/phy-k230-usb.c             |   3 +-
 drivers/phy/eswin/phy-eic7700-sata.c          |   3 +-
 .../phy/freescale/phy-fsl-imx8-mipi-dphy.c    |   3 +-
 drivers/phy/freescale/phy-fsl-imx8m-pcie.c    |   4 +-
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c    |   3 +-
 drivers/phy/freescale/phy-fsl-imx8qm-hsio.c   |   6 +-
 .../phy/freescale/phy-fsl-imx8qm-lvds-phy.c   |   3 +-
 drivers/phy/freescale/phy-fsl-lynx-28g.c      |   3 +-
 drivers/phy/hisilicon/phy-hi3660-usb3.c       |   3 +-
 drivers/phy/hisilicon/phy-hi3670-pcie.c       |   3 +-
 drivers/phy/hisilicon/phy-hi3670-usb3.c       |   3 +-
 drivers/phy/hisilicon/phy-hi6220-usb.c        |   3 +-
 drivers/phy/hisilicon/phy-hisi-inno-usb2.c    |   4 +-
 drivers/phy/hisilicon/phy-histb-combphy.c     |   3 +-
 drivers/phy/hisilicon/phy-hix5hd2-sata.c      |   3 +-
 drivers/phy/ingenic/phy-ingenic-usb.c         |   3 +-
 drivers/phy/intel/phy-intel-keembay-emmc.c    |   3 +-
 drivers/phy/intel/phy-intel-keembay-usb.c     |   3 +-
 drivers/phy/intel/phy-intel-lgm-combo.c       |   4 +-
 drivers/phy/intel/phy-intel-lgm-emmc.c        |   3 +-
 drivers/phy/lantiq/phy-lantiq-rcu-usb2.c      |   3 +-
 drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c   |   4 +-
 drivers/phy/marvell/phy-armada375-usb2.c      |   3 +-
 drivers/phy/marvell/phy-armada38x-comphy.c    |   3 +-
 drivers/phy/marvell/phy-berlin-sata.c         |   3 +-
 drivers/phy/marvell/phy-berlin-usb.c          |   3 +-
 drivers/phy/marvell/phy-mmp3-hsic.c           |   3 +-
 drivers/phy/marvell/phy-mmp3-usb.c            |   3 +-
 drivers/phy/marvell/phy-mvebu-a3700-comphy.c  |   3 +-
 drivers/phy/marvell/phy-mvebu-a3700-utmi.c    |   3 +-
 drivers/phy/marvell/phy-mvebu-cp110-comphy.c  |   3 +-
 drivers/phy/marvell/phy-mvebu-cp110-utmi.c    |   3 +-
 drivers/phy/marvell/phy-mvebu-sata.c          |   3 +-
 drivers/phy/marvell/phy-pxa-28nm-hsic.c       |   3 +-
 drivers/phy/marvell/phy-pxa-28nm-usb2.c       |   3 +-
 drivers/phy/marvell/phy-pxa-usb.c             |   3 +-
 drivers/phy/mediatek/phy-mtk-dp.c             |   3 +-
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c    |   1 -
 drivers/phy/mediatek/phy-mtk-hdmi.h           |   3 +-
 drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c   |   2 +-
 drivers/phy/mediatek/phy-mtk-mipi-dsi.h       |   3 +-
 drivers/phy/mediatek/phy-mtk-pcie.c           |   2 +-
 drivers/phy/mediatek/phy-mtk-tphy.c           |   2 +-
 drivers/phy/mediatek/phy-mtk-ufs.c            |   2 +-
 drivers/phy/mediatek/phy-mtk-xfi-tphy.c       |   2 +-
 drivers/phy/mediatek/phy-mtk-xsphy.c          |   2 +-
 drivers/phy/microchip/lan966x_serdes.c        |   4 +-
 drivers/phy/microchip/sparx5_serdes.c         |   2 +-
 drivers/phy/motorola/phy-cpcap-usb.c          |   3 +-
 drivers/phy/motorola/phy-mapphone-mdm6600.c   |   5 +-
 drivers/phy/mscc/phy-ocelot-serdes.c          |   3 +-
 drivers/phy/nuvoton/phy-ma35d1-usb2.c         |   3 +-
 drivers/phy/phy-airoha-pcie.c                 |   2 +-
 drivers/phy/phy-can-transceiver.c             |   3 +-
 drivers/phy/phy-core-mipi-dphy.c              |   4 +-
 drivers/phy/phy-core.c                        |  42 ++
 drivers/phy/phy-google-usb.c                  |   4 +-
 drivers/phy/phy-lpc18xx-usb-otg.c             |   3 +-
 drivers/phy/phy-nxp-ptn3222.c                 |   3 +-
 drivers/phy/phy-pistachio-usb.c               |   4 +-
 drivers/phy/phy-provider.h                    | 256 +++++++++
 drivers/phy/phy-snps-eusb2.c                  |   2 +
 drivers/phy/phy-xgene.c                       |   3 +-
 drivers/phy/qualcomm/phy-ath79-usb.c          |   3 +-
 drivers/phy/qualcomm/phy-qcom-apq8064-sata.c  |   3 +-
 drivers/phy/qualcomm/phy-qcom-edp.c           |   3 +-
 .../phy/qualcomm/phy-qcom-eusb2-repeater.c    |   3 +-
 drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c   |   3 +-
 drivers/phy/qualcomm/phy-qcom-ipq806x-sata.c  |   3 +-
 drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c   |   3 +-
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c     |   2 +
 drivers/phy/qualcomm/phy-qcom-m31.c           |   3 +-
 drivers/phy/qualcomm/phy-qcom-pcie2.c         |   3 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     |   4 +-
 .../phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c  |   3 +-
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      |   3 +-
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       |   3 +-
 .../phy/qualcomm/phy-qcom-qmp-usb-legacy.c    |   4 +-
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c       |   4 +-
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c      |   4 +-
 drivers/phy/qualcomm/phy-qcom-qusb2.c         |   5 +-
 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c     |   3 +-
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c |   4 +-
 .../phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c  |   3 +-
 drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c   |   3 +-
 drivers/phy/qualcomm/phy-qcom-usb-hs.c        |   3 +-
 drivers/phy/qualcomm/phy-qcom-usb-hsic.c      |   3 +-
 drivers/phy/qualcomm/phy-qcom-usb-ss.c        |   3 +-
 drivers/phy/ralink/phy-mt7621-pci.c           |   3 +-
 drivers/phy/ralink/phy-ralink-usb.c           |   3 +-
 drivers/phy/realtek/phy-rtk-usb2.c            |   3 +-
 drivers/phy/realtek/phy-rtk-usb3.c            |   3 +-
 drivers/phy/renesas/phy-rcar-gen2.c           |   3 +-
 drivers/phy/renesas/phy-rcar-gen3-pcie.c      |   4 +-
 drivers/phy/renesas/phy-rcar-gen3-usb2.c      |   3 +-
 drivers/phy/renesas/phy-rcar-gen3-usb3.c      |   3 +-
 drivers/phy/renesas/phy-rzg3e-usb3.c          |   3 +-
 drivers/phy/renesas/r8a779f0-ether-serdes.c   |   4 +-
 drivers/phy/rockchip/phy-rockchip-dp.c        |   3 +-
 drivers/phy/rockchip/phy-rockchip-dphy-rx0.c  |   3 +-
 drivers/phy/rockchip/phy-rockchip-emmc.c      |   3 +-
 .../phy/rockchip/phy-rockchip-inno-csidphy.c  |   3 +-
 .../phy/rockchip/phy-rockchip-inno-dsidphy.c  |   4 +-
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c |   2 +
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c |   3 +-
 .../rockchip/phy-rockchip-naneng-combphy.c    |   3 +-
 drivers/phy/rockchip/phy-rockchip-pcie.c      |   2 +-
 .../phy/rockchip/phy-rockchip-samsung-dcphy.c |   3 +-
 .../phy/rockchip/phy-rockchip-samsung-hdptx.c |   2 +
 .../phy/rockchip/phy-rockchip-snps-pcie3.c    |   3 +-
 drivers/phy/rockchip/phy-rockchip-typec.c     |   5 +-
 drivers/phy/rockchip/phy-rockchip-usb.c       |   3 +-
 drivers/phy/rockchip/phy-rockchip-usbdp.c     |   2 +
 drivers/phy/samsung/phy-exynos-dp-video.c     |   3 +-
 drivers/phy/samsung/phy-exynos-mipi-video.c   |   3 +-
 drivers/phy/samsung/phy-exynos-pcie.c         |   3 +-
 drivers/phy/samsung/phy-exynos4210-usb2.c     |   3 +-
 drivers/phy/samsung/phy-exynos4x12-usb2.c     |   3 +-
 drivers/phy/samsung/phy-exynos5-usbdrd.c      |   2 +
 drivers/phy/samsung/phy-exynos5250-sata.c     |   3 +-
 drivers/phy/samsung/phy-exynos5250-usb2.c     |   3 +-
 drivers/phy/samsung/phy-s5pv210-usb2.c        |   3 +-
 drivers/phy/samsung/phy-samsung-ufs.c         |   2 +-
 drivers/phy/samsung/phy-samsung-ufs.h         |   3 +-
 drivers/phy/samsung/phy-samsung-usb2.c        |   2 +
 drivers/phy/samsung/phy-samsung-usb2.h        |   3 +-
 drivers/phy/socionext/phy-uniphier-ahci.c     |   3 +-
 drivers/phy/socionext/phy-uniphier-pcie.c     |   3 +-
 drivers/phy/socionext/phy-uniphier-usb2.c     |   3 +-
 drivers/phy/socionext/phy-uniphier-usb3hs.c   |   3 +-
 drivers/phy/socionext/phy-uniphier-usb3ss.c   |   3 +-
 drivers/phy/sophgo/phy-cv1800-usb2.c          |   3 +-
 drivers/phy/spacemit/phy-k1-pcie.c            |   4 +-
 drivers/phy/spacemit/phy-k1-usb2.c            |   2 +
 drivers/phy/st/phy-miphy28lp.c                |   4 +-
 drivers/phy/st/phy-spear1310-miphy.c          |   3 +-
 drivers/phy/st/phy-spear1340-miphy.c          |   3 +-
 drivers/phy/st/phy-stih407-usb.c              |   3 +-
 drivers/phy/st/phy-stm32-combophy.c           |   3 +-
 drivers/phy/st/phy-stm32-usbphyc.c            |   2 +
 drivers/phy/starfive/phy-jh7110-dphy-rx.c     |   3 +-
 drivers/phy/starfive/phy-jh7110-dphy-tx.c     |   3 +-
 drivers/phy/starfive/phy-jh7110-pcie.c        |   3 +-
 drivers/phy/starfive/phy-jh7110-usb.c         |   3 +-
 drivers/phy/sunplus/phy-sunplus-usb2.c        |   3 +-
 drivers/phy/tegra/phy-tegra194-p2u.c          |   3 +-
 drivers/phy/tegra/xusb-tegra124.c             |   2 +-
 drivers/phy/tegra/xusb-tegra186.c             |   2 +-
 drivers/phy/tegra/xusb-tegra210.c             |   2 +-
 drivers/phy/tegra/xusb.c                      |   2 +-
 drivers/phy/ti/phy-am654-serdes.c             |   3 +-
 drivers/phy/ti/phy-da8xx-usb.c                |   3 +-
 drivers/phy/ti/phy-dm816x-usb.c               |   3 +-
 drivers/phy/ti/phy-gmii-sel.c                 |   3 +-
 drivers/phy/ti/phy-omap-usb2.c                |   3 +-
 drivers/phy/ti/phy-ti-pipe3.c                 |   3 +-
 drivers/phy/ti/phy-tusb1210.c                 |   1 +
 drivers/phy/ti/phy-twl4030-usb.c              |   3 +-
 drivers/phy/xilinx/phy-zynqmp.c               |   4 +-
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c    |   2 +-
 drivers/power/supply/cpcap-charger.c          |   1 +
 drivers/ufs/host/ufs-exynos.c                 |  17 +-
 drivers/ufs/host/ufs-exynos.h                 |   1 +
 drivers/usb/chipidea/ci_hdrc_imx.c            |   1 +
 drivers/usb/core/hcd.c                        |   1 +
 drivers/usb/dwc3/dwc3-generic-plat.c          |   1 +
 drivers/usb/dwc3/gadget.c                     |   1 +
 include/linux/phy/phy-props.h                 |  75 +++
 include/linux/phy/phy-sun4i-usb.h             |   2 +-
 include/linux/phy/phy.h                       | 497 ++++--------------
 include/linux/phy/ulpi_phy.h                  |   2 +-
 235 files changed, 915 insertions(+), 694 deletions(-)
 create mode 100644 drivers/phy/phy-provider.h
 create mode 100644 include/linux/phy/phy-props.h

-- 
2.43.0

