Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EDD950141
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 11:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9EE10E2DA;
	Tue, 13 Aug 2024 09:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ff2AYs9K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011021.outbound.protection.outlook.com [52.101.70.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C82B10E2D1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 09:31:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TUFH+SWVdqItFM/+09HoxhshU6UVhJ1vbW0ft5Wci4K019zCrSGi+MBqcz3Rb3caX5qV1dvxY6lWhsfZq9NJy7TWGYCVnqctV3IFlxLcuFpluCbm2ZCjjVbjX57gofJNN/tWf2PJv9+Q4ysnLdxAo66+UW2yb22NddojM7fpkQvFhgKu/vFg3wniYB0U9Hsoi3Q+6j5ZS9sGssBsxW8ZWiiIv8YJbelIhKV9l15jPnG1/FibBtNpaOtL6TRxWlqEqRyaIzNdi4C0RnPkKcdD8M3FuG+9wqPuPuVvY1Q+3npP3+tjf/oO0sq0/HoX77aKK6FPI5Ll2wULhp2++WK+CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLx4wrX+6nfGV3dcumK2nNiZ5UfIm1bWL0ebLgln6V4=;
 b=azv14TJr2WqPjodK3OpMY0s6/XpceW6Y3vSXEa1zad96d84G/WCYNoBZzV7RYiaOlab4/c9XI+cO+0x87H06mHU/gsKE7V/Mh8Igrkkjql8s8akCxeNYa8s31wY0ZTmGvoaBXE+tZMUNew3EVRhusoA3Oi2iS9/GQtQo/KgFC5cXrWKzG5Y3pDG0n2Js+abB5WgSqmY1OqtcjQ5wsnmxw9JIq/uh/l5IwSjhTMpr5CYpOuS0t6OzTbytAzR5N5G4kGSscnVPayj72tEIEORhc8KUWzgMb1JLO4Qk8pXEfTjF61WEwBZr1eo/cffOg6VAwk1CYU468SxWIMLj9LBbCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLx4wrX+6nfGV3dcumK2nNiZ5UfIm1bWL0ebLgln6V4=;
 b=ff2AYs9KPXRSfCsJO0+01vRnLhzuMTDvAiAUkKYyAa7MJ4lH323aj6RlLqCDZIozpHklyjwUUJAIPRiFJ4ZGY/TctuxBE+TcZSmlFXi6Ejs03cs/04125Pu6a83E+g//VPB570JVgmv/jYPmkxaj6+0nisXyI8q2gjv9L/0w6XWW3x+fZxKmOiBQAhYk+/eBxxro1MG9hIqj3qBftfncM6CRQHb3VpX8G3cuaosGkFIglf07CjXo3z5Q5KFuuh+18fW00yjCDV7cXg8Ue+3kpqqutLj+uegUAeLekTUsbwCj36nL2jSt6N+borp68e4P5hhsFLJ/nk0wuQzvjGk1Xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBBPR04MB7897.eurprd04.prod.outlook.com (2603:10a6:10:1e7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 09:30:56 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7849.021; Tue, 13 Aug 2024
 09:30:56 +0000
Message-ID: <cc72c8bb-86ce-4371-a0b5-1447b8df4a95@nxp.com>
Date: Tue, 13 Aug 2024 17:31:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] ARM: dts: imx53-qsb: Add MCIMX-LVDS1 display module
 support
From: Liu Ying <victor.liu@nxp.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, saravanak@google.com
References: <20240726065012.618606-1-victor.liu@nxp.com>
 <xoj4sypxndql62k64ztmco5ufddeysp26fyc46prwr4ezik223@sssy5zmefwtg>
 <2488314e-7a0f-406c-acec-ee106038f238@nxp.com>
 <15ff5315-57a3-46ae-9f1d-f707165294e2@nxp.com>
Content-Language: en-US
In-Reply-To: <15ff5315-57a3-46ae-9f1d-f707165294e2@nxp.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI2P153CA0035.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBBPR04MB7897:EE_
X-MS-Office365-Filtering-Correlation-Id: 092a340d-7fe4-48e9-4b91-08dcbb7aa1e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmpIN3EvLzlYZ1p6ZjM1UXNQUmR6WGo5TlVnYjB5L0dDS1ZGcVFxdjUzQnRt?=
 =?utf-8?B?Nk51YUtERHZETERmVy9CcXJyZmdNRDVmdWlIVkcvbUFpNU1qMkxIMWRET2ZQ?=
 =?utf-8?B?R1ZQNUJiWmFERFp5MTNnS2psem85SXA2LzRsOVZOL0hjcEg4SFlBSlYxNURm?=
 =?utf-8?B?MmZsRjFseGdHRi9DM3BPcm56cjY1Q2lIWnZETk9XLzZCZVd1azBBbTdpVFEx?=
 =?utf-8?B?SzRYVkFpdDAwQUtUL0sybTZoVHdIMnJIeVR0Q1JFYjl2MHl4aldPZUZBZXFu?=
 =?utf-8?B?UkhZMFlPRmR4Yzh2a2tFTFdaU3ZqQVg5Z3dpbjVnTlZPQXV5N0kyUnM2d2ZY?=
 =?utf-8?B?ZkxRVjUxeDRKWDhaK0U1TW9VL1VzQ2xXOHFmREZnWlVDUU0zalJrbkgvamNi?=
 =?utf-8?B?dVcveEdEOFhlenNYcmJaclIrQ2MzeTZPYmFSc3dNQW5rRzhNN2cyRlNLUkRu?=
 =?utf-8?B?UVdoQWNCaWplZ25wUFJjenQvYWdJc1dlaWQydkVJWXZTV2NZc0lqTEh6dWVB?=
 =?utf-8?B?T3lqTVNWbnJGTGVjMnFSRmZxenJlU01kTWpSU2JEeWQxbWxJWmpEQnJFOThy?=
 =?utf-8?B?dE4ySUtqbkpXaWJWUVVoOW1CWERqdE1MMC9GdWgwK1dacllGQUduT25tcXJi?=
 =?utf-8?B?SlBYQXdwMkxIOEhEcU1PVDU4VWw0OVUwUHNxYzFLZVJsb2djVFI4WEx4U3Br?=
 =?utf-8?B?ZHZaWUlDelNMb0szRlA5TWhBZloxTGtQTzJ4UnM4ZWRhY3JWM21ZVzZSNjBp?=
 =?utf-8?B?bDRpNlFtazZqcWt6Ylk5VnVJdC91WFRkK09JNnhVbTRYOWNhOWYwTCs3THpt?=
 =?utf-8?B?N094bHR5aUdnaFU4WllLOGIrNVRqc0haNUlHSDFQNjN4RjlGYW5xODlvNWpC?=
 =?utf-8?B?K0NmY3JUbUFxWG84Qnl3QnR2QVc2WE90T3gwUVF2UUV4eitRSmVuRDBna2Vs?=
 =?utf-8?B?ZzNNdHNCbk84ZHphaDNqbjhtdTJEQ3BtOUlzTzdYNlZnMXdkOXlha09jeWk1?=
 =?utf-8?B?VmxFUXZLbmc5eE81MU0vNm1oUGorZDRoVjR6WTFoN00yTnBDQUNwOHg4eFU2?=
 =?utf-8?B?dWNTOGhxZHBLeGtEZ3R1UG0rZ0cyY0NkaFY0RzFqZDNjRmd3WlhUTFRsd1pN?=
 =?utf-8?B?Rml2YmY4dE1BUGpxS0FLNTE4MC93WDRkQ1dJTU9Za3lnenFlMkJsb1NGOVhp?=
 =?utf-8?B?djVKOURETjM5MG51RmUycUtlRmVodFpEWnpsNUpCOXZXY1JJZ2N1TXVvOUts?=
 =?utf-8?B?TngyZWUybkxwc1FIN2p6aE5LSHFIQUIzNlNRczBWZTNZNktwQkYrMENaWU4v?=
 =?utf-8?B?UWVXNm5BdjU3OHplNktnWVV3U3UySnk3WTFvUlJYMkNQZ3NFNXF4anQ5ZmMr?=
 =?utf-8?B?MVdwTnExYklMbmFLRzdhZ0NTU2w0bUlaUkc0QzdUUjhBQWFsaStucHdzajRp?=
 =?utf-8?B?cHJkVmJ4K2k5VnRqRXFpWjc5czAxOUQ0M01ia0owTWlkMkJqdVk5blYyblEw?=
 =?utf-8?B?ekdOajFYMEZ1c1pHbmgzODVSMlZqYmdtUWNkeVBwOXdORG04djBFNlF1VUtI?=
 =?utf-8?B?UklSRC96ZzVrMHNnd1lFdXRERDJ1N3RlNU1IVHYveVNncUhZbVlLRHprUEFV?=
 =?utf-8?B?dTNBd3YyNmNVMXR5c0pqTUQ1WE1yNS9xQW1nK0MrL1dBVW05QlpXMjdwL2l5?=
 =?utf-8?B?RlczTnFldnlrVmozdm1VcklVTkJNWXFPdm85TE9qNlZhVnFNVWt1Vmxvclk0?=
 =?utf-8?B?SmxZY05HRnZSbHRWejFCZkxGektLZTlmSTdyNnJGOE8wWDNlTCsxdnVTbm45?=
 =?utf-8?B?NzFNUHM2Rit5SUNBVW9OUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTNvZDZuczMzWHNYaVRWS0tOVldZK0ZQK0pVZ25QQXhKYTBzeUc5QnBPSDRJ?=
 =?utf-8?B?R1VTN0htY2VPUkU0eGUyNHl0aTVGeDZadzUvbVNrbGhGcitWQU1lRW4xeWEr?=
 =?utf-8?B?R2V4ZVRtcXNONjQ4MFBEcmtEWmRjSVMxdFYyWkFkVE1ORHpSQ1hQYXpScWIx?=
 =?utf-8?B?RzNJWHA3K0VWakl3SEdyZTd0a293dnlRRkJPdG9WWnVReklOKzlGTTBYa0Np?=
 =?utf-8?B?L1FHVVQrTmtZOU5TZ1NLSllRUlNValJveXg3VlJVeE1reTlQMUVScktOaTBK?=
 =?utf-8?B?NlVqeGRjTzdJNmpYckFHUWZpMnFIUWRJQ2p6Wks3a2xGQzRxQnZxQjRYellU?=
 =?utf-8?B?ZzlzcjBNSW1PL05Wb0FieHBIRG9BaUorTVZRaGdRd0ZtVUIxUU5oRmtBK0RO?=
 =?utf-8?B?STlLKzZtTFNHZmp5aXFIVm5STk9PWEdLdHRkQmhmdHpsd0d4SktRNytBdHNo?=
 =?utf-8?B?YkkyNnZGTDNkRXZZZTIxbWhPYXY5cnN2RjlCWXljdEM4WFVNR1BmR0FYblRP?=
 =?utf-8?B?d3ovZGQ1b1Q3WThreWR5WlVFWUtBZm9sUXdIQjBNbEFPY2RvclFyR1VXKzZs?=
 =?utf-8?B?RDlLbUhuQ3JTOEhqcFVMUDJaSm5xSWNYdmp1dmNKaUl4N3FtOCt3bFo0TXVR?=
 =?utf-8?B?TWlzUkZZa1RtMTFaYzM3ZTdJTVZtbHJGcC83NThPUGc5RWNneFhrZlhmRTd3?=
 =?utf-8?B?aVBmWjBNSDdSVjNQMTlCL0ZCWXFUdjlqSUZUd3ZBd1R5RktDZ203S3lWcWdJ?=
 =?utf-8?B?bHFEOERvbXNiMkdDeS84Qit6cFVMQzBySGhrSFZRNHJ1RGJSSzB0WmZ5SjlH?=
 =?utf-8?B?TngzT05Yb1Y1cGhIeGlxYVphNVd5eFVjamx5dTE3WFJYOWhjT3JjR1g4ZE9a?=
 =?utf-8?B?ZTNiQVRiZ1E5dFpVZEVzeXBHSHN3STV6Y1dWQ0ltZ3VGTHl6OW9FeTdWaDI4?=
 =?utf-8?B?bkxJY1RZNzh6amF4eXU1WmYyOFZuT21peTZpTnZodU5nWHR0eDhvQTVITEVu?=
 =?utf-8?B?V1pjVWxnUTR5cVAxMGl5TFl1RUMzTmN0YjNSeTFpaGp1eEk3S2U0TUNEODNM?=
 =?utf-8?B?eGw4ckgwNFZJbWpzKzdJNEI0NXZyai95WTgvWkkvMWFmbTIwaWZ0WmtBejVn?=
 =?utf-8?B?YlpCQXJIOHBPUzhoclMxRGFHeGY5NzhHdndKb0Z6RlhEbzk1ZjM3bUMvcGlF?=
 =?utf-8?B?VmJwU2t1cVpNQWJ3Ym4rTUtmSHZMbzhHRTc2M1VGYTVPc2JWVmUvK1l1dXZG?=
 =?utf-8?B?TnBEQ2tYdnlEYkdSVzRVYVBpTm1TZFp1V2JRcWpMRW45SEU5S09kRHZyUEV4?=
 =?utf-8?B?emFrWFhobjhrdDZxUWdYbCtzV29ZY25TcVJlZGU2djlWdDh1U1UwamE4UWVX?=
 =?utf-8?B?aUtMWWR0WHVqVVpYNWlmZzJjTTdNcUJPR29FRUN6SzZZWUtzRXk5Wlo1ZmJ4?=
 =?utf-8?B?cGdwZjZybzNjRlhCR2ZwYmhjeDVwdGZqd1FBclJxUFo3Vy82ak9IaTlQMm0z?=
 =?utf-8?B?cHZua1NQeDhGb1JscUp1RlprbXZvNEE4Z2ZNZndCQlhRc1lpRnN1WTZiMUNi?=
 =?utf-8?B?cWNkYnMraEhNNkkva2c3YmltZDVkUFlmSEwxYUxEemlxaHlBVWtZanpNZGZY?=
 =?utf-8?B?NmFxdVhaMUdWS1NVQnNkR1MyNTZ5cWhpK0Y5T2Z3VXYyZ3l6bW9iWG83OVJV?=
 =?utf-8?B?NWdUYmNNUDBoRDRhN0ZBTTluQnBGazFHUEZad25qemdIUVc1ckljUzZVclZa?=
 =?utf-8?B?YTFLTGRJdWxmTWhCVzBDV3NCQS9HUHlvOXV4Y3NvTVpUVTVBSmkrbi9YVnpy?=
 =?utf-8?B?MThQKy9DRmRtZ1lVbGFQcnE0VEllZ1hxc0hvUkdHYXNDL3o0Mi9PZ2ZHQUdK?=
 =?utf-8?B?bUYyVkw4dHBNTkJGcUp5aDRlQnBCVVFNYTlJbmMwRHhYUTB3UDFRQWZoUUhk?=
 =?utf-8?B?SklaUHN5K0RzbVVkNTZ5ckMzRFUwckE1N3FXNkk1SDBlM3ZCZGp1bUhNK1Bv?=
 =?utf-8?B?ZENOWU1QMS9DQk1UYnZRMG4zK2ZQY1BiUlRyMTVuQ2xOakhmM3kyamwyQlEw?=
 =?utf-8?B?RmthOE1QdHBLOFNSOWdCNkJKbXcyaDRtT2p2V2QrdHF5b09UZVFkWXFNU3VU?=
 =?utf-8?Q?7OllgBesSWUlCPjQfMBXKGAqb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 092a340d-7fe4-48e9-4b91-08dcbb7aa1e4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 09:30:56.1271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RrNaO8JVKTN47cmSxgIKy4MRQW5GkniXmQgvgMGNJkdGu6hwgf3H3tcZN+2K3h8Qe4zu0RwnyvxknBIIR1OsWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7897
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

On 07/30/2024, Liu Ying wrote:
> On 07/29/2024, Liu Ying wrote:
>> Hi Dmitry,
>>
>> On 07/27/2024, Dmitry Baryshkov wrote:
>>> On Fri, Jul 26, 2024 at 02:50:12PM GMT, Liu Ying wrote:
>>>> MCIMX-LVDS1[1] display module integrates a HannStar HSD100PXN1 LVDS
>>>> display panel and a touch IC.  Add an overlay to support the LVDS
>>>> panel on i.MX53 QSB / QSRB platforms.
>>>>
>>>> [1] https://www.nxp.com/part/MCIMX-LVDS1
>>>>
>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>>> ---
>>>> I mark RFC in patch subject prefix because if the DT overlay is used, both ldb
>>>> and panel devices end up as devices deferred.  However, if the DT overlay is
>>>> not used and the devices are defined in imx53-qsb-common.dtsi, then they can be
>>>> probed ok.
>>>>
>>>> With a dev_err_probe() added to imx_ldb_probe() in imx-ldb.c, devices_deferred
>>>> indicates 53fa8008.ldb and panel-lvds kind of depend on each other.
>>>>
>>>> root@imx53qsb:~# cat /sys/kernel/debug/devices_deferred
>>>> 53fa8008.ldb    imx-ldb: failed to find panel or bridge for channel0
>>>> panel-lvds      platform: wait for supplier /soc/bus@50000000/ldb@53fa8008/lvds-channel@0
>>>>
>>>> It looks like the issue is related to fw_devlink, because if "fw_devlink=off"
>>>> is added to kernel bootup command line, then the issue doesn't happen.
>>>
>>> Could you please fdtdump /sys/firmware/fdt (or just generated DTB files)
>>> in both cases and compare the dumps for sensible differences?
>>
>> I fdtdump imx53-qsrb-mcimx-lvds1.dtb and imx53-qsrb.dtb.
>>
>> I see three sensible differences.
>> 1) panel-lvds node position.
>>    For imx53-qsrb-mcimx-lvds1.dtb, it comes very early and is next to
>>    'compatible = "fsl,imx53-qsrb", "fsl,imx53";'.
>>    For imx53-qsrb.dtb, it comes later and is next to panel node in '/' node.
> 
> It turns out only 1) panel-lvds node position matters.

Hi Saravana,

It looks like this issue is caused by/related to fw_devlink.
Any thoughts please?

> 
> I can reproduce the issue with imx53-qsrb.dtb(no DT overlay) if I put
> the panel-lvds node before the soc node.  If the panel-lvds node is
> after the soc node, then the issue doesn't happen with imx53-qsrb.dtb.
> 
> The ldb node(LVDS display bridge) and IPU(display controller) node are
> in the soc node.  Maybe, the order of the ldb node and the panel-lvds
> node in DT blob matters(be my guess).
> 
>>
>> 2) properties order in panel-lvds node.
>>    For imx53-qsrb-mcimx-lvds1.dtb, it shows
>>    panel-lvds {                                                                 
>>         power-supply = <0x0000001c>;                                             
>>         backlight = <0x00000030>;                                                
>>         compatible = "hannstar,hsd100pxn1";                                      
>>         port {                                                                   
>>             endpoint {                                                           
>>                 phandle = <0x0000007d>;                                          
>>                 remote-endpoint = <0x0000007c>;                                  
>>             };                                                                   
>>         };                                                                       
>>     };
>>     For imx53-qsrb.dtb, it shows
>>     panel-lvds {                                                                 
>>         compatible = "hannstar,hsd100pxn1";                                      
>>         backlight = <0x00000031>;                                                
>>         power-supply = <0x0000001d>;                                             
>>         port {                                                                   
>>             endpoint {                                                           
>>                 remote-endpoint = <0x00000033>;                                      
>>                 phandle = <0x00000017>;                                              
>>             };                                                                   
>>         };                                                                       
>>     };         
>>
>> 3) No 'lvds0_out' and 'panel_lvds_in' in __symbols__ node for
>>    imx53-qsrb-mcimx-lvds1.dtb, but for imx53-qsrb.dtb they are in it.
>> lvds0_out = "/soc/bus@50000000/ldb@53fa8008/lvds-channel@0/port@2/endpoint";
>> panel_lvds_in = "/panel-lvds/port/endpoint";
>>
>> BTW, reverting Saravana's commits
>> 7cb50f6c9fba ("of: property: fw_devlink: Fix stupid bug in remote-endpoint parsing")
>> and/or
>> 7fddac12c382 ("driver core: Fix device_link_flag_is_sync_state_only()")
>> avoids the issue from happening.
>>
>>>
>>>>
>>>> Saravana, DT folks, any ideas?
>>>>
>>>> Thanks.
>>>>
>>>>  arch/arm/boot/dts/nxp/imx/Makefile            |  4 ++
>>>>  .../boot/dts/nxp/imx/imx53-qsb-common.dtsi    |  4 +-
>>>>  .../dts/nxp/imx/imx53-qsb-mcimx-lvds1.dtso    | 43 +++++++++++++++++++
>>>>  3 files changed, 49 insertions(+), 2 deletions(-)
>>>>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx53-qsb-mcimx-lvds1.dtso
>>>>
>>>> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
>>>> index 92e291603ea1..7116889e1515 100644
>>>> --- a/arch/arm/boot/dts/nxp/imx/Makefile
>>>> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
>>>> @@ -46,8 +46,10 @@ dtb-$(CONFIG_SOC_IMX53) += \
>>>>  	imx53-ppd.dtb \
>>>>  	imx53-qsb.dtb \
>>>>  	imx53-qsb-hdmi.dtb \
>>>> +	imx53-qsb-mcimx-lvds1.dtb \
>>>>  	imx53-qsrb.dtb \
>>>>  	imx53-qsrb-hdmi.dtb \
>>>> +	imx53-qsrb-mcimx-lvds1.dtb \
>>>>  	imx53-sk-imx53.dtb \
>>>>  	imx53-sk-imx53-atm0700d4-lvds.dtb \
>>>>  	imx53-sk-imx53-atm0700d4-rgb.dtb \
>>>> @@ -57,7 +59,9 @@ dtb-$(CONFIG_SOC_IMX53) += \
>>>>  	imx53-usbarmory.dtb \
>>>>  	imx53-voipac-bsb.dtb
>>>>  imx53-qsb-hdmi-dtbs := imx53-qsb.dtb imx53-qsb-hdmi.dtbo
>>>> +imx53-qsb-mcimx-lvds1-dtbs := imx53-qsb.dtb imx53-qsb-mcimx-lvds1.dtbo
>>>>  imx53-qsrb-hdmi-dtbs := imx53-qsrb.dtb imx53-qsb-hdmi.dtbo
>>>> +imx53-qsrb-mcimx-lvds1-dtbs := imx53-qsrb.dtb imx53-qsb-mcimx-lvds1.dtbo
>>>>  dtb-$(CONFIG_SOC_IMX6Q) += \
>>>>  	imx6dl-alti6p.dtb \
>>>>  	imx6dl-apf6dev.dtb \
>>>> diff --git a/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi
>>>> index 05d7a462ea25..430792a91ccf 100644
>>>> --- a/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi
>>>> +++ b/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi
>>>> @@ -16,7 +16,7 @@ memory@70000000 {
>>>>  		      <0xb0000000 0x20000000>;
>>>>  	};
>>>>  
>>>> -	backlight_parallel: backlight-parallel {
>>>> +	backlight: backlight {
>>>
>>> Nit: this seems unrelated to the LVDS support
>>
>> Do you suggest to do this in a separate patch?
>> If yes, is it worth adding a Fixes tag?
>>
>>>
>>>>  		compatible = "pwm-backlight";
>>>>  		pwms = <&pwm2 0 5000000 0>;
>>>>  		brightness-levels = <0 4 8 16 32 64 128 255>;
>>>> @@ -89,7 +89,7 @@ panel_dpi: panel {
>>>>  		compatible = "sii,43wvf1g";
>>>>  		pinctrl-names = "default";
>>>>  		pinctrl-0 = <&pinctrl_display_power>;
>>>> -		backlight = <&backlight_parallel>;
>>>> +		backlight = <&backlight>;
>>>>  		enable-gpios = <&gpio3 24 GPIO_ACTIVE_HIGH>;
>>>>  
>>>>  		port {
>>>> diff --git a/arch/arm/boot/dts/nxp/imx/imx53-qsb-mcimx-lvds1.dtso b/arch/arm/boot/dts/nxp/imx/imx53-qsb-mcimx-lvds1.dtso
>>>> new file mode 100644
>>>> index 000000000000..27f6bedf3d39
>>>> --- /dev/null
>>>> +++ b/arch/arm/boot/dts/nxp/imx/imx53-qsb-mcimx-lvds1.dtso
>>>> @@ -0,0 +1,43 @@
>>>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>>>> +/*
>>>> + * Copyright 2024 NXP
>>>> + */
>>>> +
>>>> +/dts-v1/;
>>>> +/plugin/;
>>>> +
>>>> +&{/} {
>>>> +	panel-lvds {
>>>
>>> Nit: Just 'panel' should be enough.
>>
>> Nope.
>>
>> 'panel-lvds' is needed to differentiate it from 'panel' in
>> imx53-qsb-common.dtsi which is a DPI panel.
>>
>> Using 'panel-lvds', procfs lists exactly the properties needed.
>> root@imx53qsb:~# ls /proc/device-tree/panel-lvds/
>> backlight     compatible    name          port          power-supply
>>
>> Using 'panel', more are listed.
>> root@imx53qsb:~# ls /proc/device-tree/panel/
>> backlight      compatible     enable-gpios   name           phandle        pinctrl-0      pinctrl-names  port           power-supply
>>
>>>
>>>> +		compatible = "hannstar,hsd100pxn1";
>>>> +		backlight = <&backlight>;
>>>> +		power-supply = <&reg_3p2v>;
>>>> +
>>>> +		port {
>>>> +			panel_lvds_in: endpoint {
>>>> +				remote-endpoint = <&lvds0_out>;
>>>> +			};
>>>> +		};
>>>> +	};
>>>> +};
>>>> +
>>>> +&ldb {
>>>> +	#address-cells = <1>;
>>>> +	#size-cells = <0>;
>>>> +	status = "okay";
>>>> +
>>>> +	lvds-channel@0 {
>>>> +		#address-cells = <1>;
>>>> +		#size-cells = <0>;
>>>> +		fsl,data-mapping = "spwg";
>>>> +		fsl,data-width = <18>;
>>>> +		status = "okay";
>>>> +
>>>> +		port@2 {
>>>> +			reg = <2>;
>>>> +
>>>> +			lvds0_out: endpoint {
>>>> +				remote-endpoint = <&panel_lvds_in>;
>>>> +			};
>>>> +		};
>>>> +	};
>>>> +};
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>
> 

-- 
Regards,
Liu Ying

