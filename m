Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6CBB2D365
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 07:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED6B10E69C;
	Wed, 20 Aug 2025 05:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="4HvSpIHf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11023098.outbound.protection.outlook.com
 [40.107.162.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 613EE10E013
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 05:19:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYg45JGWcxmOv0WR8ZclyWc9uea+QpLNMNw7Ne74cuSaArTb+FvLu9ZvuS0MHzpnLjBHE93gHuW8EkzVkLiAGOZlyn28LPCEDqgXx0wDFF4RjUfQ3gnoUV+y+ny4nxc3TaFP6ik7EMtD3ju29DhOVHSjuir0heLsiKLVzIqAsNxpU6IeKGvZchALhcl3uLYIhtzWxSUOhyViA1L4m/iRIeVvy14olZRNxov8YvtCHxBDxXCH8InQQABQ3SxsCV03gvEOmljHkDhZLOLm4n4/p4mV5PhClGtmB8Z5B/xsArh+EUiF7Mdi6sOQipFSNXLnY1aMCA0H6FseivT2woS2fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUBFBRBb0QCTrmI0zSgswUCHrAxz04aBcTSOQg6E8g4=;
 b=SKp9wWKM8V8VwisSO7XhsVS5bXJsWgt0rLE9NZqsYiT60uHjI6IdIlYVrIYRZqijeQ3UK0Vi362SIuwOlpl604/wVT6fKiBOuVq5GFVs3LQh9AC4Qy+N9loVjPRefxEXELQKtbXjUUJZ7rdT3PO4kN25DUUwaVxQ/MaBGTREjDCGXVyvUFE7HmlOVMKL42/l3gYQjAVF6tS+ZG9i2ylLPyBck1eNxEwGEtn68PuZXjk4l9yK05hrleqjFCVD+ldow9MA2htImy0lCd6peFLtcwbMWtCAZ1S2ma+HHoVeQxCAVfaGOqJisHCfiJ8HUIfPLDDKUtadsj+OKaP7XVB5cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUBFBRBb0QCTrmI0zSgswUCHrAxz04aBcTSOQg6E8g4=;
 b=4HvSpIHfppGMms6jHbGU+IiL2+aoWyXtqTHv89xy1YV8oSoHe673A6Hvk8+YD1UWuFjsNuWOKvxrpNf0bKWKLoLMEJOc6QAGs7mMDQoktWyWkcFAAPqqjmokUhRgwcGfYULgfl7aezIiWjEVJm7iG8GT3TlU+3X52UDRMRCh/0PyMzYFc3H2MwEC0TpNTasAaCgBxkHfYTs7chKZHxwTh4pyjT7ThbHTYb7k19knOQHRQHlwfXvCuplOoFkYZoMK5y1GfcYxtr5YN+yDBJvCZurJmMAmkNv+CVoXB9ydLbb4MhGqqHVa5FJ86Y3az4lUGJavFvj0vL/xB7FrHezL6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by OSKPR04MB11341.eurprd04.prod.outlook.com (2603:10a6:e10:98::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Wed, 20 Aug
 2025 05:19:48 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%4]) with mapi id 15.20.9052.013; Wed, 20 Aug 2025
 05:19:47 +0000
Message-ID: <a1115bc7-225f-438c-8ae9-c616f42747d7@gocontroll.com>
Date: Wed, 20 Aug 2025 07:19:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: backlight: Add max25014 bindings
To: Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250819-max25014-v2-0-5fd7aeb141ea@gocontroll.com>
 <20250819-max25014-v2-1-5fd7aeb141ea@gocontroll.com>
 <20250819195008.GA1218175-robh@kernel.org>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <20250819195008.GA1218175-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0218.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::25) To PA4PR04MB7630.eurprd04.prod.outlook.com
 (2603:10a6:102:ec::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7630:EE_|OSKPR04MB11341:EE_
X-MS-Office365-Filtering-Correlation-Id: f8955ec7-642e-4427-3087-08dddfa92df5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ni8vM2xGU0FVd3V2V1g0YVZnT3g0ODdzVkkrcVdlZzhzTS96Y0RNRkxrWHZ3?=
 =?utf-8?B?SFFTNHY3SHlqQjhCRmcxM0s3dFJPTlVENXgyYmhZdlFRZ0tPVk9LSnVWTE1P?=
 =?utf-8?B?M1dJYkVGNVB0Q0gzUW1yTDY0VFE1dXZndDZNRGdJZkpleFBIZzJUQmdIRVJR?=
 =?utf-8?B?Z1E5VkZoamJremlsZjJjVmpsdG9zQU5WWDhiRWo5c0NZaTdHUlZlNlptT0xa?=
 =?utf-8?B?MXk2STROTWV5R1VBNU94R2RZL0k3dHQxbGVpTVo2TTZ6Vmlidk44TDkyQy9X?=
 =?utf-8?B?cVUyRXlhd3Nqd0VackdacEJYOXQrcklMKzBPOFRKSXNxcURrbDFJZExOdWk1?=
 =?utf-8?B?QnpxZ0dyQ29KV1FNS2ZhLzBXazQrQlZaMy85cXRVV1kwY0UxOEFYRGZ5U3FI?=
 =?utf-8?B?OTh2b3lhOU1QalZNQW16dUhkNmZ0NWhwcFdvZWdwUVFjT1g0OE90ZkNYaGUv?=
 =?utf-8?B?SlFlOTZxNFpWNTRiZExwVmNUR3orbG81d0tzR2E0NXoyeDNXR2d4ei9YWWhT?=
 =?utf-8?B?UHJxQklSL01DVDdZRFNUTzVIKzM4Q0xaNmJNUFJMakNNS0Y1MlVHWjlGcE1u?=
 =?utf-8?B?SjZuSFJUd0RVTGdKUURFcThNWHVURmZ2ZThpRXhuR2RPOWlLQ3JnaEsybUxz?=
 =?utf-8?B?M3UrUEtIVDBhR1RPWkt6L256cmFuWkc5b0U4TjM4RllVK0d1SGppei9LU1d1?=
 =?utf-8?B?UEtxYk54VXpTdWNDVVBTTU0vV2hnVXFsSysra0ZBZkZqS2xpb1VxVU5hZXZw?=
 =?utf-8?B?TkxQYnhEYko0elNUdHVHTUx6QkxsM0VwdFdrTk5qUVdEMVlqV1dYbW56b0J4?=
 =?utf-8?B?WERzRitpaWRSYk91VjZsUnZ4bkt1SjNaUlpMcVR1MUc3YkNvQ2x3YjZkdzdK?=
 =?utf-8?B?UXdNVVVObVowYVVhN2hQVGhlZFByUHRUWXRGSjVZeWJsMit4eDFCOXdIMjRt?=
 =?utf-8?B?bDdndFdqdVJHcTNTNTQ2VEoybkNqdnNsLzZaY0JTMzdhTXNIbWF3MzFJV1VE?=
 =?utf-8?B?V09LUHhod2RUUGxsendybjhKbWIreURHd0tWUENIWWJyM1JEK1pHaE12S3RQ?=
 =?utf-8?B?OUJIMzVjVUNFRW15LzU3NEYvZEo4cm9mZU5IL2tKdHd5TDNHSGVpOWEyRUts?=
 =?utf-8?B?Tkt1MHRDWVFubURUZTN0S3IvR0xTdFBSclNGNzE5akpjelVsbmFPbnlwOWdN?=
 =?utf-8?B?dEdGVmFZWkxEL29OeWYvUVBxSUpqaUVLM2l0aW4xMkpaNVREYVdxWjFTYnlj?=
 =?utf-8?B?dk51SVNkYVZjeFFsRTJoS3ZuenpERUFENDFlNGFITUV6U3gzSGVwZHpxZEJH?=
 =?utf-8?B?RWFSRU12TnRWLzRxeG44dnlaNTNCL2FpeG00U1NYdFNWU3RmWFVlZFJuazNU?=
 =?utf-8?B?LzNNdzlUK2Jndi9SalZwWUdlakVxTEZjemgrUzFpYVptNUtpeHcrQ2tjbjI4?=
 =?utf-8?B?T2dodlhKZkRKSnJsV1NYZ3BSeGNwQm1IOC9VYXptYVFEUXdFbi9zK0JtWWRj?=
 =?utf-8?B?STE1d2Fmc1ZOcGpWQ1RrSlZTSzBSbmc5YjFYUTkzSzZWM3AzWmppY3FSbnRh?=
 =?utf-8?B?QmtCcDhkU3R3c0xpODB1Z0dsenExUlJvc1ljUEI2clJ2NGtwTnMrWTlsNWNW?=
 =?utf-8?B?NCswa1ZNcVUxNldwdFRsak5qcHBPZmduTEhkblhzUGFMRTdhaGlpMFZWbGR3?=
 =?utf-8?B?RmVKY0ZITDNxcVVhUGsrRnVzTkdHcXlHL21nblpvcjc2TktkMnd2U2xIUlRu?=
 =?utf-8?B?VDA0RmorSE14L0czc2tpN2daUHNiRHlSVmhDV210VHFqaVhVS3VmNE4xZTRn?=
 =?utf-8?Q?24EWuOnZYOSIjCMzJxI9UoFMgdf8U7wnutrKg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB7630.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkVOMmdPQ0psaWR1d3R0SjlYYS9wWGpPTzl6dVExa0NCYmFvTFhXazl6Qzg4?=
 =?utf-8?B?Yjc1V0JTYk9uZkZmM0FBeXhNVisySHppamtmU1dYSEU5TUNleWwvdDBTTzZl?=
 =?utf-8?B?b2MvK0lSRm55ZVowNWtWZEZhUk8rczZ6MVZsWUFpZ2VjNHdRTTNRaldNTXlY?=
 =?utf-8?B?bkYveWZ1ZWFKV201UmhKWUZOYUQ4Z1pGTVFmS1ZUTXU4RmN4WmFZclZHZWJk?=
 =?utf-8?B?aTd6NUpsem5LVXpLRTZtOXAwclVHU3VhMS9vN1BMeWlvQmRFVkFCS1doUUNZ?=
 =?utf-8?B?UFF3ei94SWtQZmJUeDlRdm5vbTBTZ2JNalNCdWhmWFNHSGtFZE85dk9wQVR3?=
 =?utf-8?B?YWoyVDN6ZW1SeXp6S3RuMW5WMjJJRjZNZTNkemI1ME9VZEJUdEM3RFI0UTEy?=
 =?utf-8?B?SERtYnhuaElSc2wyZUthSGJOUGltRnowU2pqTnJBRXZLMXk5NzRtam5ZbGYx?=
 =?utf-8?B?OXNxUitYeGJYKzM1VHRYRFJjdmgzSDBGNWdwMVd5KzNUTVA1OGNUdTVuUjNw?=
 =?utf-8?B?eUkyZkwwUTJWT3ZlV0FtUDdrUWlqNGdpb2FkUWdJUlVacFdxSkgzenBkd3NI?=
 =?utf-8?B?RTRHVUh4bWFyY054bHRxYmpxZmdtU1F4Y3FSdEppRC9hV1dEdUEyODFhTVVE?=
 =?utf-8?B?T09neTZ1aEVjREQ0SUhiaGNvSXNsRHltcWczMjNhM2ZEa0Z3Rmg4ZnZYTlFt?=
 =?utf-8?B?bmxrT3MwV0E1YWNjSkJncVBDWjZWY1BrS01udTdua0w2eVBtVnRPdWFJTjg2?=
 =?utf-8?B?MUhXUStoSWgwUWcybEFkTTBya1hoc0lrNlh4NkRscDNFQ24xQXJBYmlYcDJH?=
 =?utf-8?B?RjRzcU9wYld4dEdzYXVKNHBRWjMvUFNaY2JuQ3VHcXBmODM3TGJGdi9CcVkz?=
 =?utf-8?B?cDdLSVlhZTluNGFkaFBZdkNnTDRhWUZYN1h6RW8vd2w3ZUZZTTBQYUhoSGVD?=
 =?utf-8?B?ak4wQlRmKzlmZVR2QURiUEt3SGZoaXZBa2hWZnViNk9DMHhuMjBja0RIK1Bj?=
 =?utf-8?B?UWc5b3B2bTc3Sk9GWUs2V01WTWkrTllrbTA2cVlKRTRhL002VjdEK0J0Sk05?=
 =?utf-8?B?Q2V1ZndPb1hrQlFBbzlNQVRaOEhSaU1waDhzeDNGZHlrY1AvY1RSdG96WGh4?=
 =?utf-8?B?WGQwQ0U4d3FjSWhYa3FNQnVENTVxSWcxSURYcTZCOW9qYU01TWg3a0tpdmVW?=
 =?utf-8?B?cS9lZ1pINUZiU25SR2N0M1hGb1NiUHBSS3dYWXdzQmdka0RlQjRVOXlZSytz?=
 =?utf-8?B?MWJLeEx0ZHU1MStCMDJXVTd4aENKQVZCSlduSENYZU1tMnJqTW9JL1J0SUl1?=
 =?utf-8?B?Q3A5d1B4TGpiSkdoV3lFRFk4dmladUMrbGFjMGlTRnBSUzFBNWtPdW5EbVVL?=
 =?utf-8?B?VmpWTnhBekIvNHZxUVhta2pWbEhYdW42RXR0NzFwWW5oWStBdTZqQnZsaXM0?=
 =?utf-8?B?VjFEbGtLMXZNQjd0WkswMkxCOW0ybmtqdVM4ckZHR3FUQ0hSOC9Id3dBZTRa?=
 =?utf-8?B?Ny9KOGFFYXZGK3JQOXJFaFBDZWVjb0ZtVHZQbDJXd2FIUS9QdkZiejZnQ0I2?=
 =?utf-8?B?RUd0dk1pWTM4K0JuSHllb1pXVEp2Nm80UVZVN3ZyRnIvaWhvNWFjejMzcysy?=
 =?utf-8?B?NGoySkk5cEp2T1JmRzc4U2RObzV2blh2RS9OTHpLWDdRdEs3QlNGdWhhdyt5?=
 =?utf-8?B?ODRjQTdiT2cyMkdpckRjRTJPTnJBUzYzT3UzbXNYT3JSTjlEWmlUR3J5RkdB?=
 =?utf-8?B?bm02M2JVNVBCczBkaERLcWpETmVTYUlpeGhnampCTm8vMXFFdUJKMStDb3E3?=
 =?utf-8?B?SmhkSlZjU0VScXBkUXVteTV0MENUYW5DTXZwUzNENlBsVy96azJ5L3pXamV6?=
 =?utf-8?B?d29rOXhiSGJQU0EwaDRpekdkYys0UzZBeDROMU9oby9jOXZzekx6c0NpdXNx?=
 =?utf-8?B?N1hYeE5IdXd2QlJmUWtDd0dBSjJzdkxxdEVHeUFxcjFxY2c1NEIrY1hHMzFZ?=
 =?utf-8?B?NUVKWkh5TGZSdVlHOC9jazR6TklJZnltYW1hSnJSZWZxTVZHdTNENFNMNk03?=
 =?utf-8?B?VVlZck5DbVM3ZnlkTlp1NkM0bzRzQS9nZXpaS2RtR1lNWWdUaC9jTGg5S3Ur?=
 =?utf-8?B?QWEyODRzMEtZeUcxNHU2dXhxVGFyYklHWTVxbVUrNm1MYXV3czVqblNlMWlC?=
 =?utf-8?B?alAwbmtpTGNITG4zanBzTXZ5cEwwTGxoSjRjc0JOWXJBUjJnaTEyeW5DSzU5?=
 =?utf-8?B?ZEtlbWk3cXZpaSt6VElXaWhIbktnPT0=?=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8955ec7-642e-4427-3087-08dddfa92df5
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7630.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 05:19:47.2740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPLflGz5q8OmOIImK4xWi4GuUT0R+eAvgPrpP49IIiAn+1sAqTZXtavV/MQeWEzi90CHYp5agADPvwAoMTMIoCFTTJAU3kiwHq7POSAGS/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11341
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

On 8/19/25 21:50, Rob Herring wrote:
> On Tue, Aug 19, 2025 at 12:58:59PM +0200, Maud Spierings wrote:
>> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
>> with intgrated boost controller.
>>
>> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
>> ---
>>   .../bindings/leds/backlight/maxim,max25014.yaml    | 79 ++++++++++++++++++++++
>>   MAINTAINERS                                        |  5 ++
>>   2 files changed, 84 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..30b591152fa31d5e43243cac44c72028b05b5f8a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
>> @@ -0,0 +1,79 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Maxim max25014 backlight controller
>> +
>> +maintainers:
>> +  - Maud Spierings <maudspierings@gocontroll.com>
>> +
>> +allOf:
>> +  - $ref: common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - maxim,max25014
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  enable-gpios:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  power-supply:
>> +    description: Regulator which controls the boost converter input rail.
>> +
>> +  pwms:
>> +    maxItems: 1
>> +
>> +  maxim,iset:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
> 
>         maximum: 15

done
>> +    default: 11
>> +    description:
>> +      Value of the ISET register field (0-15).
> 
> Perhaps a little on what this controls?

done, for now, it controls the current scale of the backlight, higher 
number = more current. But I will put it in the description in v3

>> +
>> +  maxim,strings:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    description:
>> +      A 4-bit bitfield that describes which led strings to turn on.
>> +    minItems: 4
>> +    maxItems: 4
> 
>         items:
>           maximum: 1
> 
> But why not just an 8-bit value 0x0-0xF?

That is possible too, the logic is inverted in the actual chip, a bit 
set means the string is turned off, but that can be solved with a 
bitwise not. This just felt like a natural way to read/edit it, an 8-bit 
value you have to first translate the bits into a hex value which isn't 
very clear about what it is actually doing.

Is it possible to to 0b0111 notation in a devicetree? That would make it 
better at least.

>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - maxim,strings
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        backlight: backlight@6f {
> 
> Drop unused labels.

oops dropped

>> +            reg = <0x6f>;
>> +            compatible = "maxim,max25014";
> 
> compatible is always first.

Messed that up in the dtsos too, fixed everywhere in v3

>> +            default-brightness = <50>;
>> +            enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
>> +            interrupt-parent = <&gpio1>;
>> +            interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
>> +            pinctrl-names = "default";
>> +            pinctrl-0 = <&pinctrl_backlight>;
> 
> Generally we don't put pinctrl properties in examples as they are always
> allowed.

dropped

>> +            power-supply = <&reg_backlight>;
>> +            pwms = <&pwm1>;
>> +            maxim,iset = <7>;
>> +            maxim,strings = <1 1 1 1>;
>> +        };
>> +    };
>> +
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index e81d5f9fbd16cc384356804390d65652bbb9e3f6..11c73d2e37fac22aea852152746236c1472f41b8 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -14972,6 +14972,11 @@ F:	Documentation/userspace-api/media/drivers/max2175.rst
>>   F:	drivers/media/i2c/max2175*
>>   F:	include/uapi/linux/max2175.h
>>   
>> +MAX25014 BACKLIGHT DRIVER
>> +M:	Maud Spierings <maudspierings@gocontroll.com>
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
>> +
>>   MAX31335 RTC DRIVER
>>   M:	Antoniu Miclaus <antoniu.miclaus@analog.com>
>>   L:	linux-rtc@vger.kernel.org
>>
>> -- 
>> 2.50.1
>>

Thanks for your review!
Kind regards,
Maud
