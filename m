Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94397B3107E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 09:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4CFD10E095;
	Fri, 22 Aug 2025 07:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="KR90/IZ7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11021075.outbound.protection.outlook.com [52.101.70.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C32F10E095
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 07:31:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BH+arbWM+irrgPUenBXDuxSyqYmp7WNTncR6y0bIyvC57oAJpV33mTZAPILk2i2inuuYqu62B08JBHypyWgFMNdX/TbgaNY6XKjYBEX9kboWpqbqi3TiEC3xWrtTHfRr2haqlJKittqp3gGs3UfjE0B8vhDMVu2uaYd6Rkn9OTdWVBAy+nq0offcYG3ve1YRBQBoCzesURqE5e9MnuutYEgKtR+DW+j4GhRkrMzr4trHa6Iehq8NVpoBphG3AEUrzWlUNvoZfAXR0YC2QVSIsHVhFNg2qL8BGl87aDI+d2Y00PaNftnAErNmA/xCov/8c4EzQCba4vTM83VrWlEzIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TRP1IVAK27/PrHfYZfvJtPna+BkqnjSPf4xCFVi3Myg=;
 b=hLjfrI5A+1NsGFhAtUYyQLmWkP4NKIfMHvcNMyg0WUhQ21uLrWMGRpOQQ4faLuLYCuX3N+vVlk93rvBcIf1N6eL8Xra72p4XT8NQyKsBRlAcnCgptD36LUzub28YTEC7NLRLnBKA0aNBLAnntga2tI+RGS3f7nbNulEOEiKNOZtKF65sAGmD+4YQLPuT9kJ/4s7PdoKxeT/nkFNhikRaKh6nMOWGpnzG1Ql97xlBMMaxfPo391BSSwZgDjUAUw9wVzHMlAia5lH10uBDnSCVAyf7+ZF2aVV9h8+O6NSKhIRqOu32ckm5UYB00MTdioAq6SmiMSz5LQaZub3+5sTr0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRP1IVAK27/PrHfYZfvJtPna+BkqnjSPf4xCFVi3Myg=;
 b=KR90/IZ7DKqoWk33ykfs4Nc1TF+TbIrFIXWCTXnr/adHPzpAwz5Gs15eqN53sXYUTJXEOkgw1ZwfXTJS9erDSCwjpR7TLDz8VwNbTlRPXaDIg3E1fHwDRCEsHnTRb5BsnQCkgdKXpEHGsG8wTajFwnPyvErGukcJvEAbYjXAK8lRBSZk1nX8gTNE5AlXChMCImm9MX/dofoOkWI97XrN+ErOcBfsfNWFPNTFqMpeTarr3aft6EN7biF5xO2mftIm6bVJ9emkRqdCwO3YkhasC/hAkOI5hkUzZMWxkTPAg7hlNbv7g3bk0umY9Vcvu2zmjbpUqQgOKGWh/5uqhA4vqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by PA4PR04MB9485.eurprd04.prod.outlook.com (2603:10a6:102:27d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Fri, 22 Aug
 2025 07:31:28 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%4]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 07:31:28 +0000
Message-ID: <e5bdc85b-361c-4909-a10d-fd48077a6c70@gocontroll.com>
Date: Fri, 22 Aug 2025 09:31:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] backlight: add max25014atg backlight
To: Daniel Thompson <daniel@riscstar.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 MaudSpieringsmaudspierings@gocontroll.com
References: <20250819-max25014-v2-0-5fd7aeb141ea@gocontroll.com>
 <20250819-max25014-v2-2-5fd7aeb141ea@gocontroll.com>
 <aKgaUtcNoOsga6l7@aspen.lan>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <aKgaUtcNoOsga6l7@aspen.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P193CA0003.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::8) To PA4PR04MB7630.eurprd04.prod.outlook.com
 (2603:10a6:102:ec::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7630:EE_|PA4PR04MB9485:EE_
X-MS-Office365-Filtering-Correlation-Id: 34e6109f-5731-42f2-a40d-08dde14de7e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVd5R3d5SmdDR1JjeGszcTdPYUxjalowTmpjQlM2di9DOVJRSVpmemFyNHBS?=
 =?utf-8?B?dDg3M1NmVmxtTUJmeFNXZjNZME9xYzNGaXRDYS9tdUhpbllNSDRFV21GTVlo?=
 =?utf-8?B?TjZkbzY4VDZibTQ0ZVF6T3FMVWFmdlZLR0FRRThHSjBnSGhCN1FXQ24vUmU1?=
 =?utf-8?B?Q28xNkNCTWxPWVBWWDdTNnMxVTFJc3UyS3kzYTcyVGVyNjZ6Qm45Q3gwdnJY?=
 =?utf-8?B?Z2NPUWVHcEhKUU5DTTk3Sm9WaUlBZ0xtMWhEVHhyM1hCRytUczBRd1Rzd2gr?=
 =?utf-8?B?dFI3Rmp0MjJJcGNrb2FrLys5RjlKOU11ZWR1eU9ZSVBhU2o1bk9lbFExWjNs?=
 =?utf-8?B?YUhCa3pQYjBMVUlpUWM1ZlRFSkVDekNZOUxxek1LQzNhcEtjM25sekRyZFl6?=
 =?utf-8?B?NmJ1M1lFNGN0U25WRnI1dnZIRXhFZEpCVi9oYmdWWnU4RTg4VHJZd1c3T2kv?=
 =?utf-8?B?TTBNSHFTYVJkTElXeVdFY0RCUGFCZEF0M2RmdjFHNXJtVGMxRVRSUVNCWWxI?=
 =?utf-8?B?UkFyUmEwMkVJNmJ2WmVKU2tYS21QVnBXbUJtc1dPUFZqRGtua0I0eDdpQUlT?=
 =?utf-8?B?a0o4M3dBRUNkaDhrdmxkbkg0OTNkOXRxT0lWN2JsT1lSOXd3bXBhQVhlZVh2?=
 =?utf-8?B?aDBhbWtjZThwcU56TWd4TEorVlptYzBybXZwRlVnUEoyYUlBMFZSd2FpYWpL?=
 =?utf-8?B?ck11c0tndC9xSGRhb1F2dEZwSE9Rd0pZd1RYV0lnemFMTzV1Vy8ySFNwY2lJ?=
 =?utf-8?B?VVA4SVE4dWJHU21yZllHODBUOWZPSjZCNUVtWW5PNWlFaWExZENGK2VCNlF0?=
 =?utf-8?B?QlI3djdWY1ovUjBuSUhuYmhLVEJkSXNrZW5GYkFWcEpsOVpOYmVPbUY1OWVY?=
 =?utf-8?B?QlZpZnY1MTRRaVVpZWIyUmI3MCtKa2pyclVjY2srV2NvT2lHRmtlV0RkRWYr?=
 =?utf-8?B?dGRjcHpZcFVLYkVJaE9lUEhqSWRyaEx1THlhOXFIOTNORVhPS2ZZei9Zd2Fi?=
 =?utf-8?B?MVh4TndadXBENzZRVXQzYUdDdjN5RUZlclRSRUJBVmhTSlpHRWt3d2ZEWnU2?=
 =?utf-8?B?eE1xT2JhOUg5WWxUMXR3U0dpZlRQYm0zNlF3cktVbXcxeXBrMWxhaXoxQmk3?=
 =?utf-8?B?bjIxaDhabXlXeUhubHNFdXVVZSs5K21XcTRMUjJMbVhBd2F6dWI2RzF4Ym93?=
 =?utf-8?B?QllKZFJyWGpMTndScU0yZWVIOVFxNUkxMENpSWRYQzlBZm1nWERSbUpnZDFz?=
 =?utf-8?B?eUFFaFBLNnRwZmpWOHh6azlKQXU3clBSMVlSMmxyM0FBMWcwc0RjTlBTZ3o2?=
 =?utf-8?B?SmlYWGZQckJPSVdIajRxNGJKWEVsUElmcDNwSm85VUxHTWUrdXBzWTd2RFF4?=
 =?utf-8?B?eHpDSEU2RVFHQ0dyN0Z5RW9mK2JSZUU0NXN6UU9keEpjUUxvTWhPdnhLV1lH?=
 =?utf-8?B?clRUOHdKTDkzM0FTeDI2YVVzUTNKOWJRNjRObUJFcFpieFp0ODg4M3lNUHpR?=
 =?utf-8?B?KzgzRXlFZXZrS1YxOGNRc1NLdFU3NVhtck8rNDVwZTdyeHZzczhxaUxnZDhM?=
 =?utf-8?B?cUczNnZjbmpqK3pCMHhURTIzYW0vTkdRK25rNVJmTWZIMit3OXozdHJFVnlV?=
 =?utf-8?B?WFpjWmF5NHp0Qzgxa1ZYYVdSQm9LT3JpQm4yMEc0K0d4eDBnQWZEYk5Lbkd5?=
 =?utf-8?B?dXB1K1h2L2szU0poWW5KQ3RGMjBnbm4zbU00eDFsRUhwS3BFSy9JSkRyZnpW?=
 =?utf-8?B?d0FtVFdQWDBrK3pvdHJBQ1BSalNxb2s5NHpLM2pCcFhoOHNHRHBsM2hUWTdi?=
 =?utf-8?B?VU82UXk1dE1KQzdrRi9GZU9jZTBlNng0bG4zcStpWDJaMEZqYkY5UHphMmhH?=
 =?utf-8?B?YTcwVlpVMmk4NWtKa3MyVE5aZExtZ3lFWmh2Y212RStVM2dwS2cyYVJlVnFa?=
 =?utf-8?Q?dNNoEwLk9AI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB7630.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnpyMURGSGVlK3lrU2M1emJ0VFI4Y0hUMVBLcEl3V284Z3BjRndIeVk0eDVx?=
 =?utf-8?B?Tk5lbW1PSkhvSFlpN3ZjWFBraTZpTS9qcm9DZ0dxUnp2ZE9lL25PVXluUnR0?=
 =?utf-8?B?cmdBS1N2a2xEWldyK0NXWlY2NGNLZGNicVN2SzNFekI1NVhPUnhTSDcrZEZ3?=
 =?utf-8?B?N1FyWUhBTFByOU03amVnQVVyTmJrclg5RENkbXM4NXJqcStrcVVzazdyY2t6?=
 =?utf-8?B?azdybmJYbFc1OWlPZVY3LzcxTVlOcUFXOHFseFBEdGxja2JNaE1QMXVTSXlS?=
 =?utf-8?B?Y0dDMlpNYmR1eC9FTG1raVAxZkxqTGtqUW1YcEVoU1JBTkRneEM5RFM5ZUJB?=
 =?utf-8?B?MXd5Z21EbldTWHZPZGNXc0lXR2kxUnpCdlBsaG5vMUMzV3pDVzl0dnFPbUU2?=
 =?utf-8?B?Z0dyZndhZFZ1c1BnNGpYOVVMT3JKRUxWd0V0T3oxb1lVVGZHaThkR1VvRm9Q?=
 =?utf-8?B?Um95amV5RFhlaUtrditZbFd1c204aytWaFRWRzlWZHZ5RHlCaTFmbzluaUcw?=
 =?utf-8?B?S2lQdEc5L0pIZnBuM0dBeVZpYnliVXZWeXVnMHVOM2JnMFNZaFNxay9aZ0xy?=
 =?utf-8?B?K092YTQ0clNpR2lzOUx4cElFVjFxc1dGUzdhM25BekZVci8zbVdBZkkvL1Br?=
 =?utf-8?B?M2o4VmVpNEFJSEg2cG8wMDN5clFsUE5DNmJCa2dvNTZ1Z09UbmxpcmtPajAr?=
 =?utf-8?B?dW84UWkxb0xuTElqNDNyNE1CSmFsanNUcWJjcTVLczBvbkpTOFBaQ01RZENk?=
 =?utf-8?B?ZmFzKy9YZ29ZajNsQytlSGJLSEt0QjhoeUtHQUtMTVBrWEtlMExCaFhvUHQz?=
 =?utf-8?B?K2d3MkNRUmhMQXY2Zk43ZkZJUVU4dmZGRm0yYjN2dDR5RHNoOG9mSWI3QU1v?=
 =?utf-8?B?UzRUTHRtNEtScFlOUjVSYS8xUHJrMzBqZExPWFQ1ajh3aDVxTFY5YThweit4?=
 =?utf-8?B?VCtJUVJ0MnhaRkdUeWRBVnNhMElhUEtnSXBicndURmc2bHJDcG5NMStKaG15?=
 =?utf-8?B?U2dYQUNvbXRPb3NrSlZrTUhQeDVPUDZIb1V0MHlaVUZRVnRramNwSFRFZ2Yy?=
 =?utf-8?B?aGQ5OFFCSEREdy8zS01nc1JMZGhBeFQzQVczMTRscHBjK3YwYTFnL05Ib0Ja?=
 =?utf-8?B?QU4yR3V0S1pxQjNVemVPVnllaklTdXJSN3A1dXNSZTFGaUN0L3l0RXNDcnlx?=
 =?utf-8?B?dlRYdUgyYTZoWXVBVG9sTmEvSno2S3JHbGUzS1BQNENFdC9aNzBvWk82YjhH?=
 =?utf-8?B?Z1hQdE83bHRxUUZlMXVBTnVLWC92ZEVWTGtMc2NMdWlDMXRUN08zZ3VneEpl?=
 =?utf-8?B?aFUrczRQYjlEZDIrWlNvRnErK1M2aXZET3d0UWt5WG4reGQrZ3U5THpBc2k1?=
 =?utf-8?B?QjE5enFVYjFudlJWZ2hzV0tqem9MU3hJWUJuRG5MMHVObktRQXRpekE4K1dx?=
 =?utf-8?B?c2xsc3FNRml3WWw0eDI1aXhRNXpCMm1GY2NEUk15YldSU0tJRFFUYVJ4REx4?=
 =?utf-8?B?WllyZHlQRGV5NVoyM3h3QzFhZFB0TDJUVXpKWURwRWZWQ2N2WG9OU3JMYUdv?=
 =?utf-8?B?NWhqMW41aUc1cGNiNlJkV0l5U1pLQ3Q3ODlXTWthbitlblhPOURYN0ovK3RU?=
 =?utf-8?B?T0svQnlJcE51eWwwWjl4cjVBZndIZC9oYjJPL1N4M1FKZEY2cE4wUUxyUHFi?=
 =?utf-8?B?OHFlTlFrWit5ekQ4N0tneTUydXp0WlpuUm1RUmtKZ1cxTHhsWWNTeFNiZFBO?=
 =?utf-8?B?RDc1SWdGSFdId3ViZTVQb3pOSTFqUktTTTlKV2NGeGM3Nmh4dzc3MEwzdmxo?=
 =?utf-8?B?WFJnZXlLZERKWnlIa1RBak83Mm9UdVoza0g3L2swT2RqL1NDWnoyZGk5djhI?=
 =?utf-8?B?aFF3eHloL1dGKzU4alBHOUpPaUNRSUNrS3lYN1Q1N0phNzJLZTNZUmsweE1w?=
 =?utf-8?B?ZzVpQkF0K3hIQ0ZQUGJpS3AyRFZIdE5EZW5DRUUzUFl0dmJkUHFxRW8xQmtJ?=
 =?utf-8?B?RGc0cHVnOTExQ200bFk0aU9WelV5WjZzOVFybVl3S01WNEc0cDZ1REdFdXQ5?=
 =?utf-8?B?QndVTURHamd4WEluZzMrMi9XMkVNTWhHbi9YMDRKMlhadHI0SDdCMkJmNFRv?=
 =?utf-8?B?T3libWFTU1NHT1NST2VYYjFlWkg2OWtZY3lUZ2VnWXZoekE5eU5WaHY2M2Ji?=
 =?utf-8?B?TTBVcFFHV2JtU1B2SEIzc3pKaTU0RCttdVArdHZzS2ZYdWRJK0c5WENXd2F0?=
 =?utf-8?B?UGpIWXc4UGIvd0wyME82eXNndTh3PT0=?=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e6109f-5731-42f2-a40d-08dde14de7e8
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7630.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 07:31:27.9303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: imLGDEjrx+2ZMpF4Yu2UYh2b5PkBFKbVJbkyIX+fedjlpxWYYadF3v+VdnKDuvt8W6keYSj/onKo5RZNdrLiWtENQyykL9IC9cIWBrwUDZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9485
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

Hi Daniel,
Thanks for the review!

On 8/22/25 09:20, Daniel Thompson wrote:
> On Tue, Aug 19, 2025 at 12:59:00PM +0200, Maud Spierings via B4 Relay wrote:
>> From: Maud Spierings <maudspierings@gocontroll.com>
>>
>> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
>> with intgrated boost controller.
>>
>> Signed-off-by: Maud Spierings maudspierings@gocontroll.com
> 
> Looking good but still a few small comments (below).
> 
> 
>> diff --git a/drivers/video/backlight/max25014.c b/drivers/video/backlight/max25014.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..fe5e0615cf6d151868b56ebb9544b175b09dfcee
>> --- /dev/null
>> +++ b/drivers/video/backlight/max25014.c
>> @@ -0,0 +1,395 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Backlight driver for Maxim MAX25014
>> + *
>> + * Copyright (C) 2025 GOcontroll B.V.
>> + * Author: Maud Spierings <maudspierings@gocontroll.com>
>> + */
>> +
>> +#include <linux/backlight.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/i2c.h>
>> +#include <linux/regmap.h>
>> +#include <linux/slab.h>
>> +
>> +#define MAX25014_ISET_DEFAULT_100 11
>> +#define MAX_BRIGHTNESS (100)
>> +#define MIN_BRIGHTNESS (0)
>> +#define TON_MAX (130720) /* @153Hz */
>> +#define TON_STEP (1307) /* @153Hz */
>> +#define TON_MIN (0)
>> +
>> +#define MAX25014_DEV_ID         (0x00)
>> +#define MAX25014_REV_ID         (0x01)
>> +#define MAX25014_ISET           (0x02)
>> +#define MAX25014_IMODE          (0x03)
>> +#define MAX25014_TON1H          (0x04)
>> +#define MAX25014_TON1L          (0x05)
>> +#define MAX25014_TON2H          (0x06)
>> +#define MAX25014_TON2L          (0x07)
>> +#define MAX25014_TON3H          (0x08)
>> +#define MAX25014_TON3L          (0x09)
>> +#define MAX25014_TON4H          (0x0A)
>> +#define MAX25014_TON4L          (0x0B)
>> +#define MAX25014_TON_1_4_LSB    (0x0C)
>> +#define MAX25014_SETTING        (0x12)
>> +#define MAX25014_DISABLE        (0x13)
>> +#define MAX25014_BSTMON         (0x14)
>> +#define MAX25014_IOUT1          (0x15)
>> +#define MAX25014_IOUT2          (0x16)
>> +#define MAX25014_IOUT3          (0x17)
>> +#define MAX25014_IOUT4          (0x18)
>> +#define MAX25014_OPEN           (0x1B)
>> +#define MAX25014_SHORT_GND      (0x1C)
>> +#define MAX25014_SHORT_LED      (0x1D)
>> +#define MAX25014_MASK           (0x1E)
>> +#define MAX25014_DIAG           (0x1F)
> 
> There is no need to put raw numbers in brackets.

gone in the next version, I'll also align the defines at the top better.
>> +
>> +#define MAX25014_IMODE_HDIM     BIT(2)
>> +#define MAX25014_ISET_ENABLE    BIT(5)
>> +#define MAX25014_ISET_PSEN      BIT(4)
>> +#define MAX25014_DIAG_HW_RST    BIT(2)
>> +#define MAX25014_SETTING_FPWM   GENMASK(6, 4)
>> +
>> +struct max25014 {
>> +	struct i2c_client *client;
>> +	struct backlight_device *bl;
>> +	struct regmap *regmap;
>> +	struct max25014_platform_data *pdata;
> 
> This appears to be unused.

oops forgot to remove that, how did it even build with that?

>> +	struct gpio_desc *enable;
>> +	struct regulator *vin; /* regulator for boost converter Vin rail */
>> +	uint32_t initial_brightness;
> 
> It is important to keep the initial_brightness for the lifetime of the
> driver?

I guess not, though I am not sure how to comfortably transport this 
value to the max25014_configure() otherwise. Some temporary value that I 
create in the probe function then pass as reference to 
max25014_parse_dt() and then to max25014_configure()?

>> +	uint32_t iset;
>> +	uint8_t strings_mask;
>> +};
>> +
> 
Kind regards,
Maud
