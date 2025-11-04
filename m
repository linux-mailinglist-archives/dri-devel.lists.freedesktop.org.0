Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0278C2F697
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 07:00:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9E610E245;
	Tue,  4 Nov 2025 06:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="VtFz25kH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010054.outbound.protection.outlook.com [52.101.84.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FCB610E245
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 06:00:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zvky57uDM1j9k6kL5P2zIlyqDOwn7cmlerTGCFgMTPmtcXpywFf3ez/NKhTwLpw4YfSlbuM/LT0Ht1PsE2NkcmlN5Y4prRfGCDwAQjeb8eB2xI6fv7OTfmPVBkKe2dr2+TzvPoLrksNDvqkYbP1chA6EtFGan7cjw+UTlEv+up1QUMcQdwnMUw1/nI7zPheW2EbS0MHWEwgd3LKCokAtwzCL0FjvI8SdaAv859KM24QrjIlPuKCgW1NdIeqz/eL940Ngiwq2tbEDfhZuXBvqDaBdky8O5/C6cHyvexlQbPEujltwBVnuL6zbgUikrLMn54Hi0wl1ACVuN5Vd6tU9gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Ntzx/r8/bB+S/4B87MbRyawVoXVcAoKvUcKbMey2s8=;
 b=aTwhiotMyahkPENPCOOBcDTUiEMzxGreBTSPoDTWXkgi63tf+dOYc+KAVMQZMfKI6IY6RIY+ibRyYJW0E+OgSbvvnoRxgTSFz8Lfw9nuQ0cykrt94LWLn/cKimtGJPfhSLxTSQom7BHsaLIQYJIey2BVx1jakaPv7U4bEOih3DDQFsDXRKkJpTdV/LcAGTFOJNsYMG5Pge19ZS1DK6yxCtaY73ZUWc1dq16NRSb7xQ+4gpz6tT2ughkaJBUc4xsshrnug0PAm2MtWAu8Y13Sw5CsddI8dP7QAwC/J6JZn4XxEyS7+fQiJGpdU9X7mIdQIlIvBO9vKWJNHjikH7rHAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Ntzx/r8/bB+S/4B87MbRyawVoXVcAoKvUcKbMey2s8=;
 b=VtFz25kHl4pfoUeh7S0P/jjn+1jpKGgd7LP3lsh/Z1W/Y1ZV1/uSh2JPkqOSq4iDMXvahhb9MWgUUzzoWDmDBXTj+jkJWnnfSLdngq9sqFsxTjNLg5lSvwas7Bn/2oOcyTUJhLw/W3f4yYVxz7aGr3n7Kqfe1O+jLhbBJwV5Q6iDaRctgSyX92F81BiWVjolMSR5SAxr/MTHmazzbTZnTZfMuVJncEcOJTjHF1c1Ew2gkFXqUpv0Z8lCtQ4pyVzk/wXafp9JV64teiGhIrC8x6C5rhJJojgUEiP386CUYNk6mOTbUQhR3gjIPcmBBzQ5PoteryoWBoje87u6XA+wiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB8973.eurprd04.prod.outlook.com (2603:10a6:102:20c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 06:00:37 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9253.017; Tue, 4 Nov 2025
 06:00:37 +0000
Message-ID: <ba46e5c9-629e-40d9-8002-813757c92ec4@nxp.com>
Date: Tue, 4 Nov 2025 14:01:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/imx: dc-plane: Add more RGB swizzling options
To: Marek Vasut <marek.vasut@mailbox.org>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251102162359.49263-1-marek.vasut@mailbox.org>
 <9f77105f-4754-4a39-848d-c1f92e4f47d9@nxp.com>
 <827cc330-4c0f-4495-9507-71c5e3e20319@mailbox.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <827cc330-4c0f-4495-9507-71c5e3e20319@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:194::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB8973:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cc5ad2f-9024-43b0-5922-08de1b6779fd
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|366016|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2FVY0RVcGl6L1NwRGZQczVqemJYWmdqZVB2QlFBaFJZcy9LT0s1SlFsMVFt?=
 =?utf-8?B?ck9vTUUzODcvamczU3dkMHdrckF4YkMrUXJFQkVNUUVBdzVuS3Qwa2F0YWpN?=
 =?utf-8?B?cEJuclVycWVkdi9IazRiU3BKN2lRUFIrTmZnMWYvNVhNSXk2RzJXakNndGdH?=
 =?utf-8?B?YmtrU1VsWHR1U1ZJc0VIQm9zMnVKWm1GdE4rU1lMNjJSU2dSM1NJRGxUNm8w?=
 =?utf-8?B?aC8wMXN4S0lnMGk5ZXZ0TlRHUFNERWNBWjlmY3pscE5IenUzc2F2aGwvN1dU?=
 =?utf-8?B?eFNCYXozb0RzaWw1MGhFR2REUlpIcnIrOTh3WWlGYlJidDk1RE9PVUVTb2oy?=
 =?utf-8?B?d3Z4ZWVpa3VVQm1jYVNlZDlBUnpGWktIS0lIUTBINmh5L2VuVTlXeVRlV3Zx?=
 =?utf-8?B?QVNpT25mZ3FNd1F6VFd1NjFLc2J3VTVqZnpWYjFIUmFvSE1SZjl3UFBPTDRz?=
 =?utf-8?B?OEczMVA2TDRlaUl4VjhkRGxhZERsN0h1MXZJa0dYYk1FdkFoTGc3ZVpyMEpi?=
 =?utf-8?B?ZFpicEJpVlN2L2ZRYm9PYldDSy81WlBKejg5VVFPb1hoak1laHpGWTEyUEZl?=
 =?utf-8?B?ZldZYk5qWDlRbEMwSlZGbFhwR0VTbkJGU3hNZTJUSTVOZjdaTUNMa2ZHSzN3?=
 =?utf-8?B?cDdCWVFEU0NuMXYrSGF5QTVtN1JNVW1Qd1UvNE9CQ2NaRGVhQWZCQW84QnlK?=
 =?utf-8?B?ZmxBZzh1bWxjTzJrY21zR1lGaDF1RFl5WkZvdjhCTXNwd3RSeFRPMkN5eTZw?=
 =?utf-8?B?bUhLZXdoZ1FoTnVyUmo3aW8zWW1oZGF0bk1taTVmV3VSbEFwZEg1c0ZMVEN4?=
 =?utf-8?B?WS9Mbk1EYkJmQkp5dmpwclJXalRzdGVZTndIMmZueGxqbUNUYTc4dWV0RGxt?=
 =?utf-8?B?YTl6QnNkYkxCOTF4WGkyYUtLZi9lTEZtVlBqMVNmRGNDYWgvL0pabUlQU1U1?=
 =?utf-8?B?NUdQeUV3NlF2dzBodEh6M0ltTU9za0hqeFZYdGVRbjBzTjVwL2J4ZzJlczVF?=
 =?utf-8?B?eE82Q25mV3pQQ2lncDYzT2JBTlNVdllZVTVhMUV2ck9YbFIyNDlnQ3Z0L3Vr?=
 =?utf-8?B?eXZpQU1jOUZTeUdVRXF3L2FzY0h6YzNqc1FxTmg5UER3Ni9VVWo2QldMbE5o?=
 =?utf-8?B?Q2JaTWMrbXozbWRPOTRpQjhjUGpkc2JoUkNuMm92NHpGMTZEU1AwUk5va2Iw?=
 =?utf-8?B?WE9yamRrU29BSUp6OWN1YTFidEovMzdpYjErQXlxQ0VycktjaENnc1Nod3ZB?=
 =?utf-8?B?aTBuNnZSUGM3bnlHTm1JYk1RSkdTa3hrc0RseE01NnZoQ29LVE5IRkpiVElP?=
 =?utf-8?B?d0pvdG5wQlkySXJERzd2SW1GNjhxZnRPWjJVL2l5OGx2RHNST0hRVDBJbHd2?=
 =?utf-8?B?MlJLejlRRkpQdWNFbmp0bEtWTFFabkJIcjBKbW1xc0l5aGZ3WkJhOTh4UG1a?=
 =?utf-8?B?d1cxYVgwSXlEUDRFQkEyWmQ4dEZ4UW9DWHphdkNMaEtCM3VUZ0NiMHlvaWRQ?=
 =?utf-8?B?dGNxUEk0V2k3eC9VbHdEN0tDOTJGS3c4QXBLMmFPN3NvVUV1cHJBMTZYamtE?=
 =?utf-8?B?Ky85b2xOY2Rod05XSkx1VHRkSTJ4RHhORGxBYzU3Mk8yRHpMeTNEeUVTZTNn?=
 =?utf-8?B?RUtJckxpWkt4TERzTWlSbjVBV0FCZVBvUE81c2lvUmdRZ3ZlM0Jac3hQamNM?=
 =?utf-8?B?NnUrZlhlYm9nbGZIc0JBQ2tvSUFXMiszeDd0NUZNMkc1cjI2bzU4VnRNRW9t?=
 =?utf-8?B?SFpJbDFuVXFSSkQxWE9YK29wU2xDS0tGcGlnTHFQUEtNc0pMZHE0aGhuVEll?=
 =?utf-8?B?NnYxQjBpR1NFYm1YdzI2MUVGbjVrelV5dnFxS2RmRnNxZHZGQWhOQjZBUzhF?=
 =?utf-8?B?ZGM5KzJtd3Z1MlpSWWNzNEVZUG5kUXN5MVg1QnRIRmFjamxMbVpLUVU5ckJj?=
 =?utf-8?Q?h/oosjs/iFw01JKX05aPlRDYS8BeewTO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(366016)(376014)(7416014)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFlIVnJyMzdCbmZRTmZOb1JHVDlSOWVUY1dacDdldGQ1cDNsZnUzcG5mZGVB?=
 =?utf-8?B?U2JSa0JMNnJ4aW5ZSmFCci9GOWtlQmR4bE5YY2p2SkdsdXpYeUZ3YjdWUDJz?=
 =?utf-8?B?TUNoSGh1Y3I4T2NHS2I4Ym5ubzdLNXlBOHREL3ZxUFcvOUtoZkZOODFTYW1j?=
 =?utf-8?B?WExVMTZDTnRBeElmQ3BhSlBpQm1KWXFUbXNXNTliTXcxcXU3VXRqNlJrc0VE?=
 =?utf-8?B?dlN6Z1RGYVErNW5kWDBlQ1FZZTFpS2UrdHdVWE14enpyTTdPT3p6eWRPM3V6?=
 =?utf-8?B?b1h3V1hVS0dZQVppNlRJcU81WmtLdDZ0dS9zS09CSExsY2I3UzBiS3RacWVH?=
 =?utf-8?B?Z3BOc3d6TzRtai9XMXBCdHVOVktsTWlqTEVmeXBZZC9EOXE5UUVGSlB2NUJ2?=
 =?utf-8?B?RWpqZ2Rnd0dxdEJxWmNkTTVSQWhoNUFaMEh6dlJKMmZUblp0cWl4OFE1c1o4?=
 =?utf-8?B?Qmdpc0owbVNxTkNmK2VDYWl2VTJXajE3WnQ4N2Fkb3lUcXo1ZlZhSnFGT1hD?=
 =?utf-8?B?Q2YvWHpQUTB6NmlIOERseWk1WGk2QW1uWGg4cDJXZ2tDTDF0KytIYjBYTGJr?=
 =?utf-8?B?dDZ5aXBPWEtZTHlmL1JCY1hkanRHRzAyL3R1OXhYOVpHaml4YUxJVUpKQmJ3?=
 =?utf-8?B?c1JsWmY4WEVoWFo4aWt0bWVoNHFVczlzaWM4cnhYUE5TSVNMNzBDUUxTY0R5?=
 =?utf-8?B?bVZzNTBCZk9yQ3o1enk5U0dsWkdmV2JQc0Fva1NBV2FnV0V3Zlo3eGQ5MDBO?=
 =?utf-8?B?TUFRdHNQUlpRMzhTOEZYRGhrQlpRMHBuSlpEOEszdm9BaGlhcjM1UlZXSXVJ?=
 =?utf-8?B?T2NGcmx3VW9Gc2ZYUDZaVmZzU2JocXRTWGNhNnkxSytJT0dJamd2N0Zta2J5?=
 =?utf-8?B?S2F4ai9pbEs3Mnl5K3FPVWp3N2gyS2gvM1lieU0zVm4vZGhWa1VTVzd4cHY3?=
 =?utf-8?B?TnJKSFhXUVJldGxzd3AzZWZQYzZrUE9scHNZVGZQVE1JTk03MzBYR2FqK1dj?=
 =?utf-8?B?U1ZWclVRUXdhWHp2TTVPSVMrbmN1TVNMK1VnRHpLeDl6dnVvQlJ1SG1RMjha?=
 =?utf-8?B?dnVtSXBBSlh6SkdPZ09BKzVxc0xMaHBQZnhmclpRYnM3WCtEc1NaUDg4SDV6?=
 =?utf-8?B?VEtkM0pPVVNNd1J5ckxyaWZJa2E5T2lqOVl0emJCTi9vZ1JFMXRXY2IyRmFD?=
 =?utf-8?B?ZHFyWThUbVcyM21ibllaZjc5TnVuUmQ5UlAvUHVTbm42Vnc4bXIxY1J4NTlV?=
 =?utf-8?B?YnBHalJKa0FUdTlCcDFVUFN6amYwTGFxTHRPelJ5NmlUQ1VZdWtaNFh3dk4r?=
 =?utf-8?B?RGdGeitSRHA4QWxlQWxoZzBaNDgxTWpNU1l3RHRwcUxabTlaWGoxMWt1ME83?=
 =?utf-8?B?ckVmdUQ2MzBBVGJFMm51RUJLMGg0WlZkbmVKL0tWZWRSRTQwZzU4ekoxZC82?=
 =?utf-8?B?TE9IWFVLeHJjODNyaGZNMmRSTzVXclNvUEloR2FZYXhWazVDRWVKRDdta09Q?=
 =?utf-8?B?aEF2Znd4UVJxS2NSMHdSbUtzcGF6Nml3RlJsdWlUTklhWGZtREpKdVd4aFBv?=
 =?utf-8?B?QkhsNVZmWjlENXd2cFFZdDZnWVIra09SN1hGWXRjMTVaUTYvME5JQ3ZKSFVt?=
 =?utf-8?B?Mnp1L2o0YTNxeGJBUGp0OC9sekZodFJZaTcyNEZTaFlPWTJ5Kzk3SGZocWh1?=
 =?utf-8?B?SDdlZ0VKaVZCT005YTBRSWp5RVY5Skg0Y1ZpMDdKYVFNbFpReGpaNGIycktu?=
 =?utf-8?B?N2phanJUMVArUXRhSVFybm9SSzBkNGxWek1UUjAzb1RQYWhveGo4OHYzcE03?=
 =?utf-8?B?ZDZHc2p2WDcxWEptSEJhMTRUd1hLUm1SQjNKSFZIa3g1SFFZNk00MGVmclg0?=
 =?utf-8?B?MjVXeFlBS0t2MENsZXRKQVE2bTRScFRXNmRVL21hMTk0bnluRm0zUTQ1a0xD?=
 =?utf-8?B?OHZMNEw5aUtHUS96NUpkcjlVbXFHUGZpdHpiWUcvajFwU3NVaGh5ZlQrOUdn?=
 =?utf-8?B?OS9XN1ZBVmNpd2JtMGZvQjV0cVcwRkpTOGNITGh0TFpDa1o1Y0ZXMy9FZDY5?=
 =?utf-8?B?ekpSOWhZU0ZZUWtER2grYmVab2h1eS9DNmVEMUh0OXJ6Ulp0a0NhS3EvSmpM?=
 =?utf-8?Q?fS6A6MY9j0jL14xYqEJ3i+x1U?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cc5ad2f-9024-43b0-5922-08de1b6779fd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 06:00:37.7300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I15OdfVFDUPVLhYoxpIS6hbHch5mfvZ9ySa7qvad+oFbx44fbzu+n/MGokLxCHpX1dvkxBeq1qYUx0IhDUm2Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8973
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

On 11/04/2025, Marek Vasut wrote:
> On 11/4/25 4:09 AM, Liu Ying wrote:
>> On 11/3/25 00:23, Marek Vasut wrote:
>>> Add additional buffer format swizzling options beyond XR24, the
>>> hardware is capable of sampling other formats, fill them in.
>>>
>>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>>> ---
>>> Cc: Abel Vesa <abelvesa@kernel.org>
>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>> Cc: Fabio Estevam <festevam@gmail.com>
>>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>>> Cc: Liu Ying <victor.liu@nxp.com>
>>> Cc: Lucas Stach <l.stach@pengutronix.de>
>>> Cc: Peng Fan <peng.fan@nxp.com>
>>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: Shawn Guo <shawnguo@kernel.org>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: devicetree@vger.kernel.org
>>> Cc: dri-devel@lists.freedesktop.org
>>> Cc: imx@lists.linux.dev
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: linux-clk@vger.kernel.org
>>> ---
>>> V2: - Adjust commit subject
>>>      - Drop the alpha formats for now, add RGB888/BGR888 to dc_plane_formats[]
>>> ---
>>>   drivers/gpu/drm/imx/dc/dc-fu.c    | 24 ++++++++++++++++++++++++
>>>   drivers/gpu/drm/imx/dc/dc-plane.c |  6 ++++++
>>>   2 files changed, 30 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
>>> index 1d8f74babef8a..b4a3f8c58cbb0 100644
>>> --- a/drivers/gpu/drm/imx/dc/dc-fu.c
>>> +++ b/drivers/gpu/drm/imx/dc/dc-fu.c
>>> @@ -65,6 +65,30 @@ static const struct dc_fu_pixel_format pixel_formats[] = {
>>>           DRM_FORMAT_XRGB8888,
>>>           R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
>>>           R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(0),
>>> +    }, {
>>> +        DRM_FORMAT_XBGR8888,
>>> +        R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
>>> +        R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(0),
>>> +    }, {
>>> +        DRM_FORMAT_RGBX8888,
>>> +        R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
>>> +        R_SHIFT(24) | G_SHIFT(16) | B_SHIFT(8)  | A_SHIFT(0),
>>> +    }, {
>>> +        DRM_FORMAT_BGRX8888,
>>> +        R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
>>> +        R_SHIFT(8)  | G_SHIFT(16) | B_SHIFT(24) | A_SHIFT(0),
>>> +    }, {
>>> +        DRM_FORMAT_RGB888,
>>> +        R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
>>> +        R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(0),
>>> +    }, {
>>> +        DRM_FORMAT_BGR888,
>>> +        R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
>>> +        R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(0),
>>> +    }, {
>>> +        DRM_FORMAT_RGB565,
>>> +        R_BITS(5)   | G_BITS(6)   | B_BITS(5)   | A_BITS(0),
>>> +        R_SHIFT(11) | G_SHIFT(5)  | B_SHIFT(0)  | A_SHIFT(0),
>>>       },
>>>   };
>>>   diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
>>> index e40d5d66c5c1f..4fd58afef16bb 100644
>>> --- a/drivers/gpu/drm/imx/dc/dc-plane.c
>>> +++ b/drivers/gpu/drm/imx/dc/dc-plane.c
>>> @@ -33,6 +33,12 @@ do {                                    \
>>>     static const uint32_t dc_plane_formats[] = {
>>>       DRM_FORMAT_XRGB8888,
>>> +    DRM_FORMAT_XBGR8888,
>>> +    DRM_FORMAT_RGBX8888,
>>> +    DRM_FORMAT_BGRX8888,
>>> +    DRM_FORMAT_RGB888,
>>> +    DRM_FORMAT_BGR888,
>>
>> Can you please drop the above two formats, as I said in v1 comment that it
>> would the driver a lot more complicated when prefetch engines are added?
> 
> Can you elaborate on that ? RGB888 is not packed and should be similar to
> RGBX8888, what kind of problem with prefetch would this cause ?

As I mentioned in v1 comment, prefetch engines don't support these two formats.

For example, if you want to switch formats between DRM_FORMAT_XRGB8888 and
DRM_FORMAT_RGB888, then display driver needs to support enabling prefetch
engine and bypassing prefetch engine, plus disabling display controller
properly w/wo prefetch engine.  Also, primary and overlay planes may use
different formats.  This adds branches to display driver and hence a lot more
complicated.  So, please set these two formats aside first. Prefetch engine
has attractive tile resolving feature.  If you really want to support these
two formats, revisit after prefetch engine is added(I hope I don't need to
go into that rabbit hole).

-- 
Regards,
Liu Ying
