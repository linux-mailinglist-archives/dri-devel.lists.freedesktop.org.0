Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 897F7BDD90A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 10:58:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA73110E75E;
	Wed, 15 Oct 2025 08:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="YZip9dCs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012069.outbound.protection.outlook.com [52.101.66.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F244F10E75E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 08:58:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X93pz9WOmq4noSiSpMt4CTsAEkvXU/lo1WpvQ0X/0EqPd0Yz/aHJeT6K57HSItyILYEr+i8S2ZfpR/PUSed8m4hbLu71lrlcflPBMLlq9ZJ326ofPUIbiaXkuLlPL5nXc9v1wa7Nkdn0SevyWcwffe2CQRNUwXMXcYiNzzQ90lZN79/5FTOHffDifeIa/1p3tTlAqakCrfKD/ILuKctSydjfUJyKmo/mIYcmAp+ELnIxNAP1qSJOhEyTXivjBf3EWPUq+jwqBahLBXqGd2H1CfK5RbgEACHWe0te0l4IcDblyRQDr3/3oldVn1RJr7ysvwBzuVLoGLWaPlj+byJ0bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ixCTfF3cX2pK5yUcxhjZ2J5+zjJT83hov47KZUT1s4Y=;
 b=kmRb5GvXAhKiqU2ajpYGrizWe9kYnz4pxrMQ8h9IRN7m0Nf9tRaRwEDPq9i1Ezr7mpZ885v55rM+KQkLuwgRSEAXky05WngTHzUM0Bc+mwT/V4Z0RYmeOrRmqqkVU/9IAXNzgNUWWid5rymG/5IGYYQKKJUvt1HbS0RSqD7CIIxX32hZq4h/3rGjI4xlu5JCGcPoXVicTBvpfa/d0YzmBHciSGtMvo65uBprLUd3SgsmTz52akpnFjhNYieUuxKJxY1CPF0kdVyJjNbX7r0Cjwisk3ehOU2oVkTw+yqNm+WObPNU+Q2Ap/JDrBP7FBa7UUg1Qd0q2tjnZwO0SOlv3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixCTfF3cX2pK5yUcxhjZ2J5+zjJT83hov47KZUT1s4Y=;
 b=YZip9dCs0tJUJOM6XnQo0kqZzCKdvhJVJKXJmX/DZyH7QxaN/jBGqMGyujWXDHZhhwuGPCUEYl5x7hggoD9DkZM6pL7CSUAU8lsRRIoKa6Fj0Ch3/Joy3R6KP2hhuWtryqY3Gp7WzlUEwS+RVH5CezvABvVqlfbfRjeYxjx3RS7/sgnD4sKOyGzCGnAEADQYA/lMeDbts/Iqr7gH1rhGKWO9G07ydnDYhVc/P/abpwRhmdkRQVQMOjkC4L3ts8ELKGrlqdEu42TcMpopPVc62RjL5Sg3W7T8YeKDMeVZAxy7d2HQx57CO9NM9fJxvmQUV4jTHih/BiWRORbAYw7VkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8056.eurprd04.prod.outlook.com (2603:10a6:20b:288::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Wed, 15 Oct
 2025 08:58:51 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 08:58:51 +0000
Message-ID: <e3ab9421-61a5-4ab6-8c72-6b0ab340f3a8@nxp.com>
Date: Wed, 15 Oct 2025 16:59:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/39] dt-bindings: display: imx: Document i.MX95 Display
 Controller processing units
To: Marek Vasut <marek.vasut@mailbox.org>, Frank Li <Frank.li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-4-marek.vasut@mailbox.org>
 <aO0tmUWA5H0J80Ov@lizhi-Precision-Tower-5810>
 <260b4db1-c02a-48a0-baf8-5e217c729824@mailbox.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <260b4db1-c02a-48a0-baf8-5e217c729824@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::6) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8056:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f6b381d-c4e1-4804-d868-08de0bc90fb6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|366016|1800799024|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWRMWnRXWkREdU5FdDkwMmt4RU1yVjBhbTRROHM3L3dpamh1N3BNNW1Cdjd5?=
 =?utf-8?B?QjZURGdKY3c5c2NubHJGS0hqTlR1YW9IcGdydHk3WDJwRjNvdTdGRkthTjJv?=
 =?utf-8?B?SGw4Q0pnZzVrenl1UTVBbHFZcHFFV2w5TzBManRrTHBhN3hOblVSNXVRUDhl?=
 =?utf-8?B?K2V2RzlqYW5PRkVBV2hML0NmYm1hZ1NwM3ZtOGtud3g2SGh1Z0hodkplUFB3?=
 =?utf-8?B?NGllcjA1akgwN3ZqU3VhVjRja1Bxa25NbnQ4K1Y5UnFHVUhtSElINzhPTjQy?=
 =?utf-8?B?Z1dRcUcwbGhVblQ4RzhnT1BTV2J0c3BqS2k3NnBFUFlZcFoxaGd3Y3hDalIv?=
 =?utf-8?B?Rk9UWkJQb1VRUG42L3ZmNEI2d3NGbjI0UHpDZEhZU0lRdVVzVjA5OGo3TW4z?=
 =?utf-8?B?NWdkb1FzRkdxaDdqcU1KdW8wYXdFbDFBTGg0R1BmL3FWWEgvQ0pRTE00WlVG?=
 =?utf-8?B?b1h5eEpPTERYVzZKVWE3SXl1SXBZZitjaHY2Mkl5T0tBN3lyZW5mWnRtMXlJ?=
 =?utf-8?B?SU5hM0pZSHJ6ZkhQcFlyWmdScWJySjdaRnE3QThodGJRNStiQUFrMWgyZ0pz?=
 =?utf-8?B?QnRxVmh1bFdmRUZSR1V3TDF2Ky9ORW80VkFsdEdBaStHYkdEYktvZDF6Rm9W?=
 =?utf-8?B?ZGpJcEh1T21WbnJIZ0g4eElvZFNKdWpkWFdnNWJmRWFsdHkrM3VlZ0dTNkIv?=
 =?utf-8?B?YTA1WHp0S0NrVkxEbXZaVHRoNDlkVHE0MWlRWnNlQmQvcnp5MGZQWjRCc09V?=
 =?utf-8?B?aVhUekdqMUsvUVltRS9VRWhLTTRMc2lmYnkxeFo4bDc1WkVDdFFhQ2JVUk16?=
 =?utf-8?B?UEE0dkNIbGVpOU9BbFNUZGcvYTdlSGhpWnZSNEM3Mm4yVlNWM25SSFhCMEtE?=
 =?utf-8?B?a1o1QVlad1U3YTZuWGRBWVBBZEpyVHdiN0c3RklPRHMxNzljRmJxb0xXbVd1?=
 =?utf-8?B?NXE2VWdoT25FOEpBQWtRZzZsdnZwc1RyVUpXckFyTnFSc0NJSVNtYW9YYW4x?=
 =?utf-8?B?T25KRTQrczJxSWltU0hJL1NzY1o3VlBIbkVPMnYxbjRudUZhNTVoWUVzY0dB?=
 =?utf-8?B?TWhnSFVpS1RSSjIwNGZIbGtYSjBZK2VZaTd2RC9KbmdWeEtoVjh2R2xVcWVj?=
 =?utf-8?B?T2FXdjRxbFhpNlI5THdRcGJlckQrdHlTV1lTZC93Y1FsQk9mc1dkWU9GZWJk?=
 =?utf-8?B?cnh3ajFSMlowQm9ZangrU2FHcG0xNmVXbkhDVTRUSnViMzZEVkFsMm9CK2Y5?=
 =?utf-8?B?dENtTXY3RDhZKzBLSERCRzVPUEo4MXdSVUxrbkdqZzNHUjRUUFcwT3VJclNM?=
 =?utf-8?B?Z0IzWnlodTBkZmZ4ZUFaWFpQWmJzVm5Bay8zazhkRExUcWJUT3JDMDBKam1M?=
 =?utf-8?B?MGs5b2ZtN0hoS0tHa043Z1VhUjQ1RnZOdzFJWlpFNm81NUdpK2p2MDJpaWRa?=
 =?utf-8?B?Tm8xTVRUZ2gxejh3TDRCQTEvU2h5NTF3YTd2M1BmWDdvdWFRTjF2Yk1ud2Vm?=
 =?utf-8?B?c21DcHIrbnhqT3MwN2VHeFpWN0VLUmtGTmU0bnkzRXFkYUlvakkxT25yU1Ex?=
 =?utf-8?B?ZXNadWpQdlZEVEVXd250dlNMbjNXQ2IrUy8yMllSSGtoZ08vYTZEa3hTMjdl?=
 =?utf-8?B?bnpGVG0zaXFWd08waUcvakRIMXdjWHVSS3ovOHUydmYraHY0SnU1U1o1cGlT?=
 =?utf-8?B?bDd3NjZYSEJOcE9TVVpKcENTQll2R0E0VG15NFJaWThDeklaVjd0L1BYQmNE?=
 =?utf-8?B?RWZOSGNHdUpnVWhBeWlGNkxpREYrMmUwc3JkNjlqY0dxNkNla0p4NWhFZXNy?=
 =?utf-8?B?TXN0Q2VvQ0hXQUJGOUFuZ2xLbmM2aXk1TkR6NzkzNjZtdlpSQWNscGppOHpk?=
 =?utf-8?B?QkhWamIxcXZ3U0pxWDRvVmVhUzRLOXE5UnFkbzlKcTJ1UllYVUNRWWs5b1N2?=
 =?utf-8?Q?xoJYr4v0j4PsEYUZxhh5tmThre3S+Fpo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(366016)(1800799024)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVQ2Ui8yQzhRYzVNaEt3QWltaHFGVmZ6dGJaK1QyYzhRNkZNUnhVNjhJSDdz?=
 =?utf-8?B?RHB1SWIxMUg3dmdtMjRMNGRXWHdxQXViZFR6L0lnQVlvbWd2VnpacWkya3h2?=
 =?utf-8?B?Q3dvb3haMlVCZGtRNXc5TlAvZ05DT3B2RFJjaCtPS1d4ZlRCZ3NGRDZXSzlr?=
 =?utf-8?B?eTV3OVFUMmRlaEJBbkVsN29kbVdhSTJTdlY5UVFpOFZmYjFQMmRtaXBkYTdP?=
 =?utf-8?B?bjVJNk00UVFyMVBrRldSTDB2R3VINzFzZzV6bGlrSGVUOVB4MHg2NUpPY0JD?=
 =?utf-8?B?WWc4NjVZYUVHNXgrMldYNnc0eHRkcFVSa3VsNHVCN1cxckhsZlVsMEJyUmVu?=
 =?utf-8?B?WldHNUVxeXp4MFVUV0Y3Y3VFUHA4T29LOHdyTnZmTjRjVm1rbDMwdExOR0VB?=
 =?utf-8?B?SmVXTU9HNWxQMEoydEswYTdWZEgwVkltSWpjYzBrb0tsMVFTZk5kYVJHTG5Z?=
 =?utf-8?B?cjdxNWlTdTBzVm11eXQvSzE3QzhKT1BiS2hSTUFnZnBvUUFoemlkNW5LZDB3?=
 =?utf-8?B?ZEZNaFpCenFGd0dyTS9ZcEl6NmlOS21NY3ZNSExaM1plRm16TnlQN0FJbTR1?=
 =?utf-8?B?dEdZZ1hOK21ha21HaXFIWUx2VXdYRGc4WE9JaWRpYmRQRUVHM1V0MTFoTHox?=
 =?utf-8?B?ZENoWFNRc0E3WUl5SlRyWlFMTE5LajF2U3lwMlZSUmFXZ2JZMnRzZXVBWVc3?=
 =?utf-8?B?S2xsNnd6VGpXWUROT3c4SjVwcWVGMTFRMHI4RGV1Z0I0MzZ2WUxvNXJ1eGZs?=
 =?utf-8?B?YWYzNVByUDZUTFdNT20xTFFhOGNqUFhyTEhUQmdzTXp5MEZjNkc4alhNNHMx?=
 =?utf-8?B?UWJyUVd2YlZVOEdIMGhyVkVudXRLeXE5U2RVQnkrOUZRUHM2Z3NTd1V3Wit0?=
 =?utf-8?B?ZHRsWFlZd0RGUEhlb2lRcVZnWlhRdnJtYWtvMm9UanhwK3FyQTdNbkdwL3Nh?=
 =?utf-8?B?L0RuV2JWOG44dGNzc3JuNGMzL2NLdzM0S2FsdWNSUk12aWdnUGdNRDN3OTVW?=
 =?utf-8?B?aTVpdy9wTklTNUVYL3dlUFVHSVFZOWNrYnp0RFk3RlRvejhoUUNBcHhFby9Q?=
 =?utf-8?B?Y25sT2doTTJXYnIyNWY0cko2K3JlNE0xMWxBYzZmd2I1S3kwcFA4OHh0MFF1?=
 =?utf-8?B?OTFBV0lvR1NaSjdsUlNRbkZsMExUWkw1TjdqU29Sanh6d2JIRmlVMjlFVC9m?=
 =?utf-8?B?Y2t1c21ZUlMxN1owemU3Ri9idlJzZUJuekpFOVR0citkVFl2YkN0UFk0TVVO?=
 =?utf-8?B?Z0oyaXBreStFNDB5RnRzQ0VDV3RWZlgzWE5tWVE1VFdrVlZZZ3A0ejNGeWFP?=
 =?utf-8?B?cU9TelZ5L1VyWVI3akVXaWJUMFNUNUtTVGhKV3V4M2NLQTN4dEhqdldKRGV5?=
 =?utf-8?B?d0Q4ZWxlZWxGVTdOVTc4NzlJdWhvbEgrVDVvdnEvYzVCb1BTV1hsMFhxVm14?=
 =?utf-8?B?b1Z4NktMOE5IMUdrRldsaTJJcE5yUHkzbk4vRklURDFnd2FFNHFFTndOQktx?=
 =?utf-8?B?UlcveHVFUGtFVzI4Z0Q5T2VOenQ0SjVJWXI2V25YWG0xQUtHV1lsR0FJSkhP?=
 =?utf-8?B?ejdUOFpkTERvNmJaWG1BWFFsdWFhc01KbmtTZTZzd1ZkeUlJVUtPRXltS0sz?=
 =?utf-8?B?UWY1WGV2aFJ6WGJIRHphRUtrUnZVWVV2czhHSFVMaGE0OWhKZ0tSV0tkdVBq?=
 =?utf-8?B?ZHUwcXhJWHNMSDlobHJ0Y3RUL3RXU1BNZkJUVXpWVHlLSVZuQXVkQ3p0WmxP?=
 =?utf-8?B?RHRFOGtaTXZxUCtweGhtTVVHL2ZLYUhETStOOUxDR08wOVJvQmJMMVVMSlJh?=
 =?utf-8?B?azJyUDdvVGtmVlVneEo5c2VHbGFKZGtLWHkxUzcvM25TNVl4NlJuN3NTWXJK?=
 =?utf-8?B?WXNtWXB5b2hWTXVmQzQralJJbTJHM09saDlsTk9aUm55MUNSR0RYVHljMVJH?=
 =?utf-8?B?azhhT2haT25PcElPMktHem5uWTVxZVoxV0ZDbnNCL21SbGpJYVlpZ1Raalky?=
 =?utf-8?B?aWg1bUkvWEZLL3h4OVZsTFFSNlNrV3dkbEQzaEVKMUIyZ0JkQkErdmxWWDB1?=
 =?utf-8?B?SGV1TCtnN0xwTER0c0ZrYWlwZDVpc2tPVXVabVFyVU41TTlGSDIzR01ObkJF?=
 =?utf-8?Q?9/ReASKyuvHoX5EX1az20oQTS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f6b381d-c4e1-4804-d868-08de0bc90fb6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 08:58:51.6462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ibSD1BFTuJ6qXcw8cERm4gupf1LfAfonttGyXoCheNiZMDFKucYhE/dNfszOzV5OmUv8pcSmhzCqVf8iniV9XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8056
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

On 10/14/2025, Marek Vasut wrote:
> On 10/13/25 6:49 PM, Frank Li wrote:
> 
> Hello Frank,
> 
>>> @@ -90,13 +102,15 @@ patternProperties:
>>>         compatible:
>>>           const: fsl,imx8qxp-dc-signature
>>>
>>> -  "^tcon@[0-9a-f]+$":
>>> +  "^tcon(@[0-9a-f]+)?$":
>>
>> why here allow no address unit tcon?
> This might be something Liu can clarify too.
> 
> TCON on iMX95 DPU does not seem to exist at all, or at least has no control registers. Hence no address.

i.MX95 DC hasn't got TCON so it should not be documented for i.MX95 DC.

-- 
Regards,
Liu Ying
