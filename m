Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC5EB0D36B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 09:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 462F710E60C;
	Tue, 22 Jul 2025 07:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="IeG1UAF5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011018.outbound.protection.outlook.com [52.101.70.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A4510E608
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:38:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eisn2s5m2RcaVcJPIDWZsf2QZonWbiFfF3e/OGPsVETx6rzdreAj9x4jCSoxFiwbTgnkdeT8GRU1Wyo1IB2gbJ3mEMcQr8p7eMXXwLQg04KwNLGhk6t/tkYsPeRqX5LJRzkFWNYdrEQ5uXv8bGL1Em0745BbjYcIQ17hqjyLRQNhzGAz1gwV6R2bBXKd4F09jGwe+WnF/f4R+TKJfXENvtsIcLITXlJoryvmgdfozBwRSS1P0yn7+U0S01w5cMHSsrEPe8pEvWGIwLcOl+rEqzk0TQlwrwSMXz/NJuLW/GR7SMxeHNkzTt6sJx1AM5SHts0N1m0dd4AwPJ63d4gQ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QyKL1sNMM/rAunt65IASn7CfBD+F9gtj3RAslIbeg/8=;
 b=V2e95qIbLjrbbIjAY+H6ik3ILj64ihjD9PGLBLc5WfSdcOJvrwscR3q/qYA99W6UY8Jo4TUmfi83U61N5DnkWrkKGDttNao0//UwZeMI4PmS1Wr1QzNO2YNdqEsPER6Uy4R097yCaC41B+adwvCg7w3KaSzx9rUQr2yfmtjO+xrsIvG5GUmRkTBUAeJspmRoKuUILY/W7q9a034G4aYkJkMFNnBVViGwtW7ZovPedpeDr/7z0f7oEEJ2ByB5IPfHUJTviWOgfLNkeBZR05sGC0udlb4MOk30dWKGprFas//DwBFTsfYY11AfcRL8gjz+LG9zn9v+4pxKr203Q0WG7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QyKL1sNMM/rAunt65IASn7CfBD+F9gtj3RAslIbeg/8=;
 b=IeG1UAF5JDULwPj7tOYK0Ge0uzQMgjbCAPNHgNgP+LFae3Z1SS6J34dQ3UVO4tYjlEWyC1TUikUczc/6YM5sfJVpX4XLZI9d/JvHmJhf65y225hmF77s4IaeJdKH9nyLhOn3WjA1sknckrvF5wTKcu4JhUhyLJ5q7QWj2PVnRg+xaFWWg1EaF/AddiTX1qAlbn1dG2zqpnAw8bQxqpv1IPA5a7RMMQO28RXnauiWq9wP2zIjD9OEDqNsE8ug5/BXspdNJPpK7bJhb/JgEooVvTiqikttGJYf3cdGcBIc61LN60XFr4oohVg8ivDJ2o7XhqssImtfUBCaHZ+WId1DGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB6847.eurprd04.prod.outlook.com (2603:10a6:803:134::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 07:38:18 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8922.037; Tue, 22 Jul 2025
 07:38:17 +0000
Message-ID: <4731eb9b-9a29-4065-8dac-06f558e78e02@nxp.com>
Date: Tue, 22 Jul 2025 15:39:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/bridge: dw-hdmi: Add function to get plat_data
To: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 lumag@kernel.org, dianders@chromium.org, cristian.ciocaltea@collabora.com,
 luca.ceresoli@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com
References: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
 <20250718101150.3681002-2-shengjiu.wang@nxp.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250718101150.3681002-2-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::11) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI1PR04MB6847:EE_
X-MS-Office365-Filtering-Correlation-Id: ff2c42d9-9f37-46e6-d925-08ddc8f2b909
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|19092799006|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHVvNUR4MjhkYWNOaG5DcU4venRXNzRwLzBWc1JnZnJyVy9XUnBSU1J3dG5E?=
 =?utf-8?B?alM5aHNtRVp5aXhjeUtVVmRCQ1NoNjBtSUVPVzJENDN4Sy9ZWkhUYUlrUjBF?=
 =?utf-8?B?OTVSeTZsZndsYzhrNE5FbGNhZVVSMXB6QVJOOWJKeUFNOWtkcEloSXFQRWll?=
 =?utf-8?B?V0VyaDcwQTFHNmU0MHRaTmZkZ2hEVXoxYXh5ZFE2M05lT1BhSTZQVzhVSEh3?=
 =?utf-8?B?Zlljem9FWENEbisvdDRXWGR4WTBPckluN0pCNE1RMVA0QXA5RDQxeTFIZHJ6?=
 =?utf-8?B?RFhkNkVMcnNzUU9oYzBKbllhOWlHRGhTNzVnN0k5WjFiOHR4a25jc3U4TjBv?=
 =?utf-8?B?S1ZrM2V3YWxxSUpFdys1VWprMUJLTW1nc20zNTJ3aFExc00vWGwyblFOMWxI?=
 =?utf-8?B?U1MvZjJQdWw2T1V2aFpqd1V3MFRDSjFKelRJQ1cwSExhditNYjFoMDBicHB4?=
 =?utf-8?B?OGV5OHVBODZnVUxtdXRKcURUVXRKMmdIZDB0Y2dMa29LMGxxdlJOVW9jN3N3?=
 =?utf-8?B?UFYrUEpFRVNNWjFQSXRpN3RvRjk4bWFSMDEvaUZVQmtXb2tpMitNei9nUkF5?=
 =?utf-8?B?Y0U1cTZMWWMrY2xlUlJPNEtsaXBueDZncEpUbDJmU005MnQ5VTVTd0ZwRkQz?=
 =?utf-8?B?eXM3SHJxVkpRUlNHN2VYYThMcFJySWhqdDcwMDJnUFFGZU14NU5ZRnF6VXBK?=
 =?utf-8?B?UlE2UnhYODl1TSthY1c5ZE9URWw2YXNBaE0xTWR1QjE2bHNRYmdPYnVVbGxX?=
 =?utf-8?B?VTIwUmNNT2toWnNNbHFKempUd2tLNm5kWDdsK2ZzUlpvVER1R3FhaUtITzdR?=
 =?utf-8?B?WDRnQml0RGtSR2dJWms0Yk1PbWJxODBaTkNYUkFMM2VzVGdKRFBnNXBSK2E1?=
 =?utf-8?B?UUlrMm1nbUJLL2NjVTdUb05ob1JSQkY4UUxwSUl3MzdhOVdlUk9UYWxaTWFs?=
 =?utf-8?B?QzRxaCszMm9Wb01zeEhKTDJNUVZvM25QT2NSUzQydHpFSUFNTlQ2ZVdnakNX?=
 =?utf-8?B?LzdRK2lIVFYwWnpEWlZsUkJsYTBNRlA2akFFdE4xVWgwVDk1WHVaWTF3UHRW?=
 =?utf-8?B?QmZxMkRMbktwSWp0NzZVRFYvOUZKZmNSNy9qM1RQakdRQk9Xc2NiSGVzU09E?=
 =?utf-8?B?L0p1eDBuZkNkVG1iUk5BTkVxdEtjR25odzF1NmN0VldvK2doNStrVDVQOVBz?=
 =?utf-8?B?a3VNRmlKMU9ZaWRRY1BDenRjM3AxWjM4K3BwdmFWaDVlZkpSUElFT1V3eHBq?=
 =?utf-8?B?cDJqRndpbU5QaDVPTHJvS0llakQxbVV6NldWOWk2am5JbEtYMkxXQW45SHlI?=
 =?utf-8?B?a0lHaTdHTmJZU2NlMThLdWFaaDdrc1FqUDQ4aUZlSmJiSGFVNm80VXRIOFVF?=
 =?utf-8?B?ZEdCaHVBZ2JWUSswMW9ZdXVlTkFmQitydWNjMnNPNUV0YVBjUlRTdVowaFFH?=
 =?utf-8?B?clpTMytPUjArTTBIT1VKTCs4WTBKV0xQcGw3ZEhiMnFWUDd6OGU1akV3Tmtv?=
 =?utf-8?B?TnFwK284b2ZlNFlZTVBhdmsvQ3dRS1NCMVVadk05eVRJV2Yrb2c5Rkl6ZU5O?=
 =?utf-8?B?ZmRqTFlMUC9LYVE4UVBwd3dRbFphWWdPZnpGTkUvdWVqYnVDRTJ3RmQ1aEIz?=
 =?utf-8?B?TERPaWFnUEZzczhUMHpTTlpIZnVYS2JCRFFveE1LUVJLT1kwSXEwRVlqNnZt?=
 =?utf-8?B?V1JpTFUvSitNb3Vsa2NVQllOUkwweHJ5aEpvUE9VVVRCcXp2R0YyZG4wbVdP?=
 =?utf-8?B?cjJrRXp2VkpFUWpieDhISjNKUzBwNFBCTlhDSTVycC8vY3BKWERudGdySlNV?=
 =?utf-8?B?RXpDZUsyTG9DUG5adTdEZmRZelgrN1FyNEoyN2g3SzAwY08rNVNoZFVqZDhW?=
 =?utf-8?B?Nkc4RWpWWlVwWENTV2ZqSzVqZjJ4QlkwVnNNVWdnOU1lZWp3azRSZXhZNVFZ?=
 =?utf-8?B?ZjRUWEJBNjNqTitVLytZSEEvTU5mam4yRWdCemI4am5tRm1nb0hXbVp3aHJF?=
 =?utf-8?B?SUJIWkJsaGJRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(19092799006)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SG9UNS9Nbm1MWXllT3pOTTR3ZGpQdUxsaVNZWlE4TEhXa0dsUGVDMWh4QnRy?=
 =?utf-8?B?d0VZdE5aYU5oVHpZT2RJYnNobHJsYVZTdWtVejJVc2xqN0Y3YVByeXZJaTQ5?=
 =?utf-8?B?dkFkWFAzZnZaWllqanpHL054cjhwczFxS2tYbGxRWjFROXl4L0cwZHNqZndT?=
 =?utf-8?B?SXpIdzRmTVJBMXNQS2pPOU5saGRJQVRHU0R2OUcrSFJ6YkVCb2pvSDJMdlUr?=
 =?utf-8?B?RG9LOEhJcVNrSEVsQTlWTExjUlZXTndPSzcyN0w2bEdlOGhpZ2xoeXRtd2xl?=
 =?utf-8?B?d0JTKy82YmxXM1VjT2hremdITmlETDhTY3hRMXN4RFNEVzJaK1lYRUE0VnBJ?=
 =?utf-8?B?QmVlc3BxMTM3VDNIOHFtcmx1ZnJuVjRHMXR3U0h5blhYNWFVMk1yZEt1YmxH?=
 =?utf-8?B?YjM3aEIwcWo2OWt1dHV4Z2c4ZUYwQ1kwQWlMY1JTcXpaRWdXaHY3eTQzdmx1?=
 =?utf-8?B?QzR5YjhEUGxDaGZ6dys1VUt6RHh2NmMrR1NuRkhXUU02dGQvM3RFa0J6dWVJ?=
 =?utf-8?B?dEtodFZOdzVqYWNyRE1wN2NjckRIVDBTTXRVTmx2Sy82K1U4dWViYU5SMjZE?=
 =?utf-8?B?OFJWNDA1WDlHclE0QnBnWXQraEduWDRyc1NpKy8yaWpmMU55bitxL0dtL1hv?=
 =?utf-8?B?OHJsb3ozMEYzZ2NscUdTbVR2NWovSDJIMmI4OTE4cHZ3TTdjYXR6Qlg5SzlL?=
 =?utf-8?B?Z1pTNWV2TzJuc2Q1WmgyWUltTE01MzJ2VmpjM3JteTIxNFFkOFZqbE5hUUE3?=
 =?utf-8?B?b0N2MHhXdHFFZU82eERsUnhXZnFHOG5XenEzS2licksrSkd3WE5yYWwwcFk0?=
 =?utf-8?B?aHhPS2xUZUlreTZZdXZWcVAvRjh3bE1JdXcxOG8xNnNveWJFMDVpTmRZb2tt?=
 =?utf-8?B?UHgxVUFRSDlwZUw5VmZRQU9FOU9RL2x0bStKc0VKQmhlVzZqUThwMmRIM2RC?=
 =?utf-8?B?SS9MRS96aEsyTXMybCt5MTd2VlcvaG10R2psaG1VVVZTOEdUNFZNSkVhVjla?=
 =?utf-8?B?d3lyMVlIWXhHSmlFU2tYVjlBc3VPT0JkM1hpNk5SaTZqOVdwUTdzU1dEUitM?=
 =?utf-8?B?bFNuWnoxaFo2VStkMEdiYURSdmU5Y1RTcHBhVmhwUUcvZlBBaGlPZm9vQmxr?=
 =?utf-8?B?TFBpaUhRU3M4WURoelBqQlRkT0FuSHRvY01URU1RRmFmTFg1SWhQcGl2djJn?=
 =?utf-8?B?T3EwTlUrNTRkaGZ6L3FWU2FleFpJbXdIWkxQUlk1UEE2cTloRysvT2xUQzFy?=
 =?utf-8?B?U0dIUjJwWmNaaHhDS3loYnE1UFBPbEtOZXlCZnJTdHpvVC92RldBWjFKeHoz?=
 =?utf-8?B?Z1JRb21QR0QzOGpOMGZUWEo4KzdmdTg3Ymg0SDEvQXE4TzRYV1Bqcmx2QzVh?=
 =?utf-8?B?b1h3MUhIT0phS0poNTJJNGtWbnViZnpLZFJjOEo1QmUxVzRXRUVWWDIxN2Ev?=
 =?utf-8?B?YzRla3kzYkQ3RS9xdXI1Nmg3bmZBZHJUck5zYmJGaExaNk5TcW12VmxZNlh6?=
 =?utf-8?B?RGhuNTBqS3RHM1EzcWE3VlJQNEtmbzVJY1g4UDZGM2N0NkdrNUVhRWJYaFRt?=
 =?utf-8?B?SXV2bkxlekMySUlsbnNiWWIzc3dxYzVqRDEvQWl4MnZZbkJSb0k3eUpldVV1?=
 =?utf-8?B?TDNWQytzeUlBWkQ5cU9QSERCMFJHYkpWbEVENHByQU5kdFo3M0F5MG5qU2pI?=
 =?utf-8?B?SnpNS1pmTEo5Y0IzTkVWMVhYelBIaFV4N3RIM0I1eXI1V3NTeWtoWHZ6V3M5?=
 =?utf-8?B?R3gvcW1qQnA4bndPb3VFb3d6TE1mUVJSM0M5ZlFvaGE5TkFQUDNzbkZWVkE0?=
 =?utf-8?B?TmF2aEREQ3c2SUN6azBtNmZ4ZzFrZjZoTGY0eGVscVMvVnNrOFFqZkd4clRk?=
 =?utf-8?B?UGxwcmo5em84RDlIRXFUQVRNMUQzRndKajJMM2tNMnhSSHV0MUJvRjB5allu?=
 =?utf-8?B?bXA1M0JjVHdBb2N4a1ZoRG5aQXQ5SDRnV211Rmt2L2VZU3JNbm5lN3BhZy9V?=
 =?utf-8?B?OXFqdkl2NS9WZ1hpdW1pTUpmNXJrWVRqREJjbEJFWEUzWk1ILzIvZm00TWY2?=
 =?utf-8?B?aFoxQmV4Q3dmaGZDc2lObTZFUEhvUnlOWFJBZ1FJUGo1NWVSelBhSjJzS3p6?=
 =?utf-8?Q?k7QXi3CVsmnqj7bF8nB0+EV54?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2c42d9-9f37-46e6-d925-08ddc8f2b909
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 07:38:17.0061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AD8HDyZY2i+O9s3DJt26y/dKi2dCopIEyAdUTFr+HtgRWFSdxNOM0BmWtM4Z/rADPdNiu6lifddvGYcf34+ldw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6847
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

Hi Shengjiu,

On 07/18/2025, Shengjiu Wang wrote:
> The enable_audio() and disable_audio() callback pointers are in
> plat_data structure, and the audio device driver needs to get plat_data
> for assign these pointers. So add a function to export plat_data

{enable,disable}_audio pointers are directly assigned to plat_data in patch 2,
instead of using dw_hdmi_to_plat_data().  dw_hdmi_to_plat_data() is only
used in patch 2 to get hdmi_pai pointer through pdata->priv_audio.

const struct dw_hdmi_plat_data *pdata = dw_hdmi_to_plat_data(dw_hdmi);
struct imx8mp_hdmi_pai *hdmi_pai = (struct imx8mp_hdmi_pai *)pdata->priv_audio;

> structure.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 6 ++++++
>  include/drm/bridge/dw_hdmi.h              | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 76c6570e2a85..3dfa42178f6c 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -198,6 +198,12 @@ struct dw_hdmi {
>  	enum drm_connector_status last_connector_result;
>  };
>  
> +const struct dw_hdmi_plat_data *dw_hdmi_to_plat_data(struct dw_hdmi *hdmi)
> +{
> +	return hdmi->plat_data;
> +}
> +EXPORT_SYMBOL_GPL(dw_hdmi_to_plat_data);
> +
>  #define HDMI_IH_PHY_STAT0_RX_SENSE \
>  	(HDMI_IH_PHY_STAT0_RX_SENSE0 | HDMI_IH_PHY_STAT0_RX_SENSE1 | \
>  	 HDMI_IH_PHY_STAT0_RX_SENSE2 | HDMI_IH_PHY_STAT0_RX_SENSE3)
> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index 6a46baa0737c..a56a3519a22a 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -208,4 +208,5 @@ void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, void *data);
>  
>  bool dw_hdmi_bus_fmt_is_420(struct dw_hdmi *hdmi);
>  
> +const struct dw_hdmi_plat_data *dw_hdmi_to_plat_data(struct dw_hdmi *hdmi);

Nit: Add a blank line as it was here.

>  #endif /* __IMX_HDMI_H__ */

-- 
Regards,
Liu Ying
