Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 099308C5F55
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 05:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823FD10E1BD;
	Wed, 15 May 2024 03:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="K2GI2nkr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2059.outbound.protection.outlook.com [40.107.6.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA10B10E04A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 03:11:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EYXHC98DN5TRKCYh35KfcxAn8SUlIfNltT8uOzNK+0rVoyOEF1rQ61MXhbhLGwGE9ICOaHlgJRN7B2/JJbbm5qArbcjQRdzCinDylMS6DFC8YCiH23leFY1ijGbPJOHAqjQ6M3c7DtqXdH+r6M9U8OpWM0teJSTT3xjnVXZQqxtCmYP6/PeUoeC2I253IdfQgVls+IPUPjFfwDwtbOJNXI/DGUzAOSvE/4W9eOao6rjPL1oLQiYL8kidA4fD63cIuPyhzBp2+7irj3U9jnMCPKhzVpZ+jQFvvhW4HV+kdOqXl74eCcAza2+KxjJp6GzOcQj2Cw58OKmn5sfAlpdwaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jNN9ki+2bGPtElSbvXuI9lhW3XLMgbrLH6hx61qsvs=;
 b=H4MaMk9QSFEw+XMvCAaRIY54t2AtI84ImI/KTRmzza8F8TFMo9/oKAzaD25PQDHk3AH13kiOXHcNC7maU6ZOL45OiIsU/+3uXoi8lOvjV8BuQ84QJdcBfed4T2kUeWZXMHkQzyjrimwHgbc3+0GBNQlIfI2oO563n1VtXe2xHePeaHCQSHPuwHoPkWirvOCOZ2oza9KTSRjH1MwqnZRyubBkTMotKvXwwdUth3VDCGO+y2K4KTGnOGgSR6AOs5+vaiJ/Bsd6eRcfqkbquFI3/MKsoPkp1G0icWsXS44/SLPDFrRStn0WdwQAzmVqesab5MK9MJlYIObTvgd3l6S1Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jNN9ki+2bGPtElSbvXuI9lhW3XLMgbrLH6hx61qsvs=;
 b=K2GI2nkraoWyYS0TpvGto+svrwg+gLViqUKGCGZpC9KHzh6vGp8qh5MiJNdwg7tiIscY77lBJtX+3mHkxBhzwflrQvvt1NNWzJSFmwDmXA1ta7bUMEmEKi6TOEUFKQs+foHEQeLWNOrCln2p4t5dQUCpK2FMsClSby5T+r2IEaU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS1PR04MB9560.eurprd04.prod.outlook.com (2603:10a6:20b:470::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Wed, 15 May
 2024 03:11:55 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.7587.026; Wed, 15 May 2024
 03:11:55 +0000
Message-ID: <a8d19c8b-9406-4219-8128-3c9c60e1a34b@nxp.com>
Date: Wed, 15 May 2024 11:12:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: display: synopsys,dw-hdmi: Document
 ddc-i2c-bus in core
To: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 markyao0591@gmail.com
References: <20240514220457.94571-1-marex@denx.de>
Content-Language: en-US
From: Liu Ying <victor.liu@nxp.com>
In-Reply-To: <20240514220457.94571-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS1PR04MB9560:EE_
X-MS-Office365-Filtering-Correlation-Id: dc2ea2bd-dabd-44c6-90f2-08dc748cc622
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|7416005|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2psSmlHUEJaclBTMW9ra0Y5Q2JJMlRYaTllaE9qMWJqQW5sS0oveUkxY2p1?=
 =?utf-8?B?anpYTEZDUC9xNFM2SEY5c0w5aGhOaGkvM1hqMk5GTkJMYUk2MDB6U0t5Tis5?=
 =?utf-8?B?Y0VqTjlBR0xyclA1a0Q2bjc5QXJScElVU0lQN0xFcExvVGNDVDRqeCtWQnlv?=
 =?utf-8?B?V1RHNmw3RjVKTWlVREhXdzlRdWZWT2tqc0dWMmxqWDFEcno4ak1qUTJTdCsx?=
 =?utf-8?B?WFc1K1dDNUE3S1pWRmNxTEtaNitKMHFVaXowYkh5dDYvdXcrY1BNelc5N0tn?=
 =?utf-8?B?UkZiaGVCVlVSa05Bb1lnSTN6bVlzRldzc3BKeUJJemYzdVRzdjNLd0dzUFMz?=
 =?utf-8?B?SkkyVlFmRktCYWZ3cUN2OXp3cmFvTnRMN2Q3ZERvdjNLMFgyZjRmMVFHRjUz?=
 =?utf-8?B?VHNHUjVzV0tIanhMem1DcHVMN3k4L1U3dWRjb2RTT242SzlENU54VG44a3Z0?=
 =?utf-8?B?SzRJbk9OcGxiTXBCcVNTajAvbGNIYTgwN3JMQTBvQnNoZEZMcnBaaUZLMnpQ?=
 =?utf-8?B?OG9LYWhtVnhLNWJOWjhhd0RJd3pLS0x1R1hTNmRzWGFmMm1WdmRVSFBybVRT?=
 =?utf-8?B?dlRwNm5jTHZPUzF3cVBZZ3RsZTRsMU9Xc2kzeUZTK2xaSStHdGc1MDVrUlN3?=
 =?utf-8?B?YkRrNjJDYjcyVS9JUlVZNkpiUjFQUTAzazFLWHNxTDFhQ21IWFpRYVZtRzlZ?=
 =?utf-8?B?YjMwR0JyN1hsTG9hbEJkaUJSODNUY1lRQVJQRkdvY3U5emxhMVByZU1jVkJP?=
 =?utf-8?B?QWN6clFXQzRoMm96cGxuSlZ2MXMrYnVudWlKL0FLT1FDSUNFNHg4cDh2bXMz?=
 =?utf-8?B?RlBIY1RidVovWVA1V2ZqQzNFZlVwcjRlZ2pNWXRhY0x1WXJpUFU0OXJDUHVm?=
 =?utf-8?B?clpiOUFUTDRuZHBCSWdPTUt2K2hHSVlnWnpucDRGWnZocjIvSkJBd3Y2VGpH?=
 =?utf-8?B?Zzk0aXlURWVTandVMUIyTEg5STczZjR6eVdEY21WTkZhOTVQcHVPUkxVQjhm?=
 =?utf-8?B?cHM3V1FaQzA4U0g3NHQ1OWZ1VDhTWTh2QzNORXk1aUpBYTFBTTgzWXlmUHhO?=
 =?utf-8?B?RzdjenBwZ0FEMVE1eW1CWVlRTmtTSnVBS25lVytrMGZHcUVPT1lNSFFzY25J?=
 =?utf-8?B?SWlDQXhGRm5QZkhESHNWOS9nMjNJZlcxTi9ILzV5UTgyUEFZM2R6cWNyTWJL?=
 =?utf-8?B?ZDV0VCtnL1dtL2I2bG5aS0lCbjZ2OEY2czlOR1dRZitoRitheEZYSWVvZUh1?=
 =?utf-8?B?bjM2MDQyMWo2aGVBalM5UWM0ODZ3Z2Qyem55SzBNaSswOUZucXduYXEyYzBZ?=
 =?utf-8?B?MTNLbGNCVGxvQTI0NkdNNmU5dEgvdDQwWUxjcnhTNmQ5cU5sanRPbHpjbzFv?=
 =?utf-8?B?OE9aZEx4YlZMc0RZTDVtRDBHcm85bWZlWHZqaTRHRU81ZHp5NVVJSFdMN2Z1?=
 =?utf-8?B?WmtzSmZTcnRjQlk4T3lNaHpyM2tlTHlPNjRsRUhvWElCeko2N2FlMHFTR0Jt?=
 =?utf-8?B?Y1JramVSYTdYYXNXUU84UG5DUlorUGhKR0VpTkhLVTRGZjlHL2tWV3kyRFpm?=
 =?utf-8?B?NWhXM0JieG00WVppUHFEeTNPUjZmSDU4SlNSZmNFaFhaYUV3WkE1U1dBc1l6?=
 =?utf-8?B?bmVBQW1WUi9kb3pXNzJ6QTZOS1VmbThLRHo2b0J2ZW84LzNTVUVlQlMrVnFm?=
 =?utf-8?B?cG50MDRBREpENG0wVGloZU1DS1VIWE5SWjc5TFhRTHNkRnVicWE2djlnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1dJQmJUUFJ5eHVxb0toVlNFNzQvdTB2WFBvaEIxcll5UytRYTVuQWtZUmxn?=
 =?utf-8?B?aWpnbXozT2JxYmxiM2VJMlFzVjA0dzZYOEk4b1VWZnRCMFF3SjlBVTVnb3ZO?=
 =?utf-8?B?UlVFK2RjdmtqNzJLUnVjVlY2cytaTWJTTTBZc1I4aDRuWFY0V3lEMEl3L0c1?=
 =?utf-8?B?ZnZ3WjV3UzVjU0dhVlBmeFM2NytNdFA4YmVTeU1zTFhYQ3J6Mk41N1MveVVo?=
 =?utf-8?B?M01sTGI4eHZ6MkNOM0NlVURXNUZUWlFHU0hUSWVWbzcxU3JHUFhVbXp5NkV2?=
 =?utf-8?B?NzBpZHhqUXA0ODBNZ2hhbG5MbHIrWlBhOER2UUhUbzNSclhQRmJjUXFiajk5?=
 =?utf-8?B?K2dJNEtjT3NXOFhWU1JNQ2t6NG95QlllQVllSVRMbGxVYVdGWTRkSUdtWGo1?=
 =?utf-8?B?KzJNRmkzZktVTjFteXcrV2pSVHhzeTJpemdiNjFaVSs5UWFMakdtVlFBb2lO?=
 =?utf-8?B?YTIxcGVycERBSm5QeloyV3QraHpQRFlzNmd0ZTlIMEZqa2FXSmczYVZrV1lG?=
 =?utf-8?B?TDU0bG4rUHZ2VElleGFONWlPQk92YU90VXVYQkJDcjhxL2xtWGxpQ2ErOERM?=
 =?utf-8?B?OHZZVmxkUFZzVGJhTkdIVXc4TjdHV0ovM3htTTltRXVsS3JmK0liMDlQSTlE?=
 =?utf-8?B?Ukt3dE03ejk0UUJzVFVEUjB1bjNoYktSckhDRitBMllzT0Zjd0NsbHBtdHdl?=
 =?utf-8?B?TVZUaTRsS2FJMWxOZU5NNGF0WFNFOG40QzBZUW1jQ3JaMFBSNnVLbE5KZEZa?=
 =?utf-8?B?T1VIRGxsTUxnaXY5UVVTbEphaXVZeXMvQit0dG9TL3FFQ0RnaDhWNGFWTE43?=
 =?utf-8?B?N0k1Wm8xbU5PdWVXWHd2c1VQVGh3WWszN1R2UHRQa21lN3VLRzhqNUJkZkZB?=
 =?utf-8?B?cjFpZW14TDZhaHRMRTdBUmVvSzkrSzBqQXNkYjM0blJRbGZlQVFnbFJ6M3Fs?=
 =?utf-8?B?Ulg1bVlkc3lybFFITFlHZS9oN3hId2l6VHA3WWxjZFlhMnA1c1dtUm13ZTdZ?=
 =?utf-8?B?bDk4cU4wNVloanhhMzR3YVE5a1JZZlRONmE5TVlaUGJXYk5aNEZ1ZnJvSjNt?=
 =?utf-8?B?YzZ1ZXZ1VW9MYlBtVjhZbmxaTDN4VlIvUktFYnpvQlhnOUhaQWlvcXJQeXZp?=
 =?utf-8?B?MVJWYkoray81Z2psRTV1NE1CK1JlMGNMRmZYVVFHSWJNaDloWGpoNVd6MVg3?=
 =?utf-8?B?c3BsQWtwVjhiSXJpNzlSOEVwVFR1WkJBSkNZSjI1aGNlTGpTeGVZYUU0NDhC?=
 =?utf-8?B?dTJqQTM3TkwwampJa0JaMm5salJDRzYxRThncy9hTFV2S2xGWmt3RTRLb1ZP?=
 =?utf-8?B?Zk90VkxCVEFidWJFK0QvNDE3b2RkMVFnYUJGUEVSWGFDM25aV3k4Y3hURVpW?=
 =?utf-8?B?WDlSN3E4cUhwb2tzODVYc0RjTUtuY3BDSzhKZGpNWTZ3Ym5GSGNOdGxlUy9Z?=
 =?utf-8?B?WHhYaTdRclFHcnJHcmlMV1puSFQydElsMGdMSmpLY0hTVkYzQ1dZN0hOTVJY?=
 =?utf-8?B?RjMzNnFFaWZQT1VuUW1ON0N0N0pUQmxQOFdiTUljS0tJZ3JNNy9NaWgvMlgr?=
 =?utf-8?B?bFNMYXpYQnBuZjZnOHlvVFg1NUJxK0IwYjl3anJmellXWXBEeXBBVDZYcDdp?=
 =?utf-8?B?YzNqb1c1d2JqSUhEeHpYWC9RT1lBVlg5SHdUbmZhL21oRmpEYThFUThjaCs3?=
 =?utf-8?B?ejZiNmpad00xUmtldld0a3NoNUpuRlNSdUxtMk1sNEQ3SlU5cTIvZlRDSDE3?=
 =?utf-8?B?dHl2bXk5OVpMVXQ2RXd5dS9FWm00aWhnOHpoRWE4VzNnMDAzWUNSME5oSjVw?=
 =?utf-8?B?VWxtSFVsa25MVUpsZ29wY2U3dzNaNWhKTjl6L1RSZElvSmhDQ0prczF3d09l?=
 =?utf-8?B?a1pwMnF3Z0pDSThtandkamZVdHhqNEc3USt0eHd2T0FyVzhUTDhhMlJ5Nzdq?=
 =?utf-8?B?M3Z0Rmh2MDFlMHp1UHU0RkdDQ2dKOW1TdTRNK1VhdHhLOXRVZ3JTR1NuLzZo?=
 =?utf-8?B?Z2Rjc1JCYjdpc3ZVbkt0UmtVUDN1Vjg5M1lxaXp6ZEZZUWZFMTkvWG8rY0RB?=
 =?utf-8?B?VEFCbndmOElDU3dZT2p2N2tSaGg5MktURHdhUXpkMmE4V25RdnNBb1c1Zis2?=
 =?utf-8?Q?ZPP3EH1RjSgf4l0zUGJOa63z8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc2ea2bd-dabd-44c6-90f2-08dc748cc622
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 03:11:55.1051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zVjnCMnOuw9RmdwDdmnKXTCxog4VBOgYS8Tr5xZf05POPoazh6B4NkpXaABff2GHdkAMqY//CCCL5vL8RzRJ3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9560
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

On 5/15/24 06:04, Marek Vasut wrote:
> The DW HDMI driver core is responsible for parsing the 'ddc-i2c-bus' property,
> move the property description into the DW HDMI common DT schema too, so this
> property can be used on all devices integrating the DW HDMI core.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  .../bindings/display/bridge/synopsys,dw-hdmi.yaml         | 8 ++++++++
>  .../devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml    | 8 --------
>  2 files changed, 8 insertions(+), 8 deletions(-)

Cc'ed Mark Yao.

rockchip,dw-hdmi.yaml documents ddc-i2c-bus too. Drop it?

Regards,
Liu Ying

> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
> index 4b7e54a8f037f..828709a8ded26 100644
> --- a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
> @@ -45,6 +45,14 @@ properties:
>        - const: isfr
>      additionalItems: true
>  
> +  ddc-i2c-bus:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The HDMI DDC bus can be connected to either a system I2C master or the
> +      functionally-reduced I2C master contained in the DWC HDMI. When connected
> +      to a system I2C master this property contains a phandle to that I2C
> +      master controller.
> +
>    interrupts:
>      maxItems: 1
>  
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> index 7979cf07f1199..180c4b510fb12 100644
> --- a/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> @@ -31,14 +31,6 @@ properties:
>    clock-names:
>      maxItems: 2
>  
> -  ddc-i2c-bus:
> -    $ref: /schemas/types.yaml#/definitions/phandle
> -    description:
> -      The HDMI DDC bus can be connected to either a system I2C master or the
> -      functionally-reduced I2C master contained in the DWC HDMI. When connected
> -      to a system I2C master this property contains a phandle to that I2C
> -      master controller.
> -
>    gpr:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:

