Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5AFC45648
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 09:40:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A6410E1DB;
	Mon, 10 Nov 2025 08:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="XyhUO7r8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11020079.outbound.protection.outlook.com [52.101.84.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57BDC10E1DB
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 08:40:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KqoyIrm6uF9y7/VWUFEM+Xct6guB98A9AGr7euY3Xba6UWK7meew6gndAGu5P9JAL4lwmv8sxizASWHjBspQI13DIK9DnQROBXq47bxOuTdpnAY3SowpTKCE1cMBg7Rqi3Qbvw/0/s8C7AdE57DwXk67wNG0h69YEjsul3yo8Sz+je+SuNrnhSDJYV/dCDY75vXSCqNerNo++crAtAMHoqvpzj2wT/IjMRxSjctYnKPl3ajOZQM1lLYY9iYXWeiiGA+CRSLBCgj/pPK2mSQDpY6EREf5BMpODDU6Oz9fALEjXJ4l7R/ZEhmCM/+PZ3Se1x6nKysXyCLpdz/bHwtXGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AU+n+XzuE71zXeu5uHHFGL8vrsv7zYPrYvRP74DcnGA=;
 b=kU8fFqcFkZrV7341n/qkJw6cos6TBDwgH4CErk1q45akFLFZbjwyKPSfTH1pIrHIH3Zp8PesGBwfjlzlJl2UZ3nCfcgatWiNGEudT0PjKAXKvPN8bK9LZvx43HTsheTy6ummBD53YCLiMzjhAQ1YdTgHOzeWyGwE3On6NZR4D1R72qMdvJQD5MF6jrvAFpyxzhwi9KgXCmSm6KyU729Gsd2ndyjLRU9LQlQmQkeS/mntI0/sMwgL/HRLg5qk2QkzHwmrdBdGfKWLbxOxMF9z8q55fBDR6TSQu5E2uLw+P3BIBY2uUnOyu+8k01CSEUd4BFTemLJHQY9a6sMhnYRTJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AU+n+XzuE71zXeu5uHHFGL8vrsv7zYPrYvRP74DcnGA=;
 b=XyhUO7r8wME+1q09D13ZXFgY26im3K0ZuIF61jEj672oJcySILOs25fnwtCLy+RrTLo57vWisgIeOx2darIJmwrQsNtqctZ8K79m4SXV+rH4u0B+qlE7hPkOHQ+WIbTXI3WFTResfUCw5N5J+P7NkK02zjbqU3jvBoJU+ofsymm0jJr+V6rpeeuOdxQn8kwEApRcM7QvfwzjP/1FH1emNU47C7oAbZrLcek5T0q3YqRpQe9ErZeYg9C8nhE5JZr8/TXA0o4k5lB5qaM/bkRSE2awnpZNcllAeGydh+8MXQ9jZSNI9Ad73NCdIUNYNG7OFLkeAGOezf9KYsWObNJIig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com (2603:10a6:20b:6f3::7)
 by DU2PR04MB8663.eurprd04.prod.outlook.com (2603:10a6:10:2de::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 08:40:29 +0000
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::c39b:dab3:ae88:c5ba]) by AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::c39b:dab3:ae88:c5ba%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 08:40:29 +0000
Message-ID: <f4e52cc1-9c5f-4069-9079-83be794ab2b3@gocontroll.com>
Date: Mon, 10 Nov 2025 09:40:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] backlight: add max25014atg backlight
To: Daniel Thompson <daniel@riscstar.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
 <20251107-max25014-v5-2-9a6aa57306bf@gocontroll.com>
 <aQ4a2SBDldYgQb56@aspen.lan>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <aQ4a2SBDldYgQb56@aspen.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P250CA0023.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::11) To AMBPR04MB11741.eurprd04.prod.outlook.com
 (2603:10a6:20b:6f3::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB11741:EE_|DU2PR04MB8663:EE_
X-MS-Office365-Filtering-Correlation-Id: 55dd2270-6e34-4c8a-5df2-08de2034cdae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEZMTFN6OEZRTEpOSWdLV0FGeG5SQklUSzFZYUNLTnU5d2c3emExOVg4dFpG?=
 =?utf-8?B?L3l1NytjRlltVWdBN09ISTVEVHgxcVFpaXFIL1VnU1dyMlZ0TkI1R0dJaVRN?=
 =?utf-8?B?QWMwVzZRVTA4bWtHKzFYUWJuckpQV2x6cGpzTDloZzNoZEpmTEQwWFlqanlM?=
 =?utf-8?B?OHg2WEwrUU56dFV2WGhmR3djUExPN1JZVkgrY0FGcklsMUtMMUlnbGRtTFdo?=
 =?utf-8?B?TzBiZ3JpeVBISjltUFJzOVBmb2tnQ2VUQ0VZYzFQVnhjMm9RV1hOekVLUkNu?=
 =?utf-8?B?c3hCeWZmNzZxYUQ2bE9TM1RiT2NEd0w1U29Ldit4UG5kUnNKR3Vsa3lYVEV0?=
 =?utf-8?B?RTFyaUVaUlpMaXl2d0RxUHY5ZWxFcjduK2VHT3RJbS9yNlVMeG1tSkMvR2xq?=
 =?utf-8?B?eVpKV2FySkk3WkkySmUwVWx5NE9vSk9Wbk9CemdjeXZra1pqR202amRGUzhQ?=
 =?utf-8?B?TWRHNU82TEoySm4zc0dJL3I4Ni9LZXUxNWY2VThnWjVsWDFUcXF0dXA5NklX?=
 =?utf-8?B?Z1JKK2ZteDRoSEE4bDRSZy82Z1p2SWs1UXF0eGIweExlUHBIQ2thN0lURDVR?=
 =?utf-8?B?MzEyWkhsVS9FT000aWZiRXVmdXpsaWdma0JFTTJSbjRUdHNmbDdTNEdCVGtJ?=
 =?utf-8?B?L08zbFhKZERsSGRXSHJQdUxjUnFhZEt4QldzYUFkMmRhOTlkZ2c0VlpqZld3?=
 =?utf-8?B?eEhLMDRGS29vSnhrOXlFNEJ1ZDJOY2ppSTZvT0c0VDlCU3NyTDM2VmZiWE1R?=
 =?utf-8?B?bTZVS3hXWUJwb29HOTZSLzhnUDdMaTUrdXE0ejhlNUpkc3g3Y09CSUM2R2Fq?=
 =?utf-8?B?bFQvOTd6UUMwUzVoRWl0TzNRZVBFb0xlcWY5dW1kZms2enRXM0dtZWE2WXBT?=
 =?utf-8?B?VlZzU29pREJkd0RTNjQ1cnFCKzVmM3B2M0ZpUENOVVllSEF5WkN4LzYveDhj?=
 =?utf-8?B?L2wxWFpKa0xTTnljeWtkVDQvaE55c3AwOGRHTDZHSnVRdVJwZDZ6d2ovNHhW?=
 =?utf-8?B?VW5vWXNtb0tWVG1wakY1WTlpY2NHTE8wR2c0UUhOb29IQ0dWTWRSV1RycFhG?=
 =?utf-8?B?VVE4TzZqTE5wMnAzODU5WmtDS1ZMNXU3R0FNUnBXYkdFRklLYjVnSVYvZ3lD?=
 =?utf-8?B?SjdtZGdBOFBjME9DZmpVUmFhZWZ0eUJ2VWIxRm40bHp4eG4xMkRnOFY2N0xX?=
 =?utf-8?B?TFdxSEZTSUZPR2Y0VDUwbEdXU1g3UzJYTUdzQjBadnBNY1FlVG9sSFVLY0lR?=
 =?utf-8?B?dFR6eEcxcVQ3WFc0ODh2T1d3NlB3NlltakdELzgzT0tJaEhSSWxSejR4Q3Zq?=
 =?utf-8?B?VkFudmp1aVlpOHh1dEE2TDdyMXVpSXhQNnB6ckY2UEpnWXVYNm81U2EvOWMv?=
 =?utf-8?B?L0xKMW5XQVMvTFJLejAzRTZlUENhK2NxYkdmMjJnYmErMStDVmF6cm03ZHpo?=
 =?utf-8?B?TXdpMkxnQTVpWW1aRnVBdzNYWkVrb09VUnMzaDA5cnplMkkremJEWUdXaTMz?=
 =?utf-8?B?QWFLZ3pldnAyY09SN1J5WUV3QjlnVDhZMXVDcUlZRzJsMHN5RFVaWm9GSlV4?=
 =?utf-8?B?Q0YvQUdPWDcxL0MycERjMzJjcks5aUF0WXBwdmZBNFZkUFJydUdPbnBzZFEx?=
 =?utf-8?B?UkFNN24xTE9oZ0k4SHFoR3hKL3FpM0EveGZERDVoQ1Q2RzlhSjdoSFdVRll3?=
 =?utf-8?B?MWRwUmplVWd6TjczL08ySlVvWTdiY3g3djQybjBRTjgrMU9MZVlmNVgreHJS?=
 =?utf-8?B?MlRqc0ROS05RRVY1OEc0WThKWnVDQzNNRFFyOUQybUFFQ2ZDUFBDMnV4eDI0?=
 =?utf-8?B?SDVENExSdGgrN1RaVWtBcGZhempDQm9JVFFucWpTN21pcEdmS25TK2JWVmxW?=
 =?utf-8?B?YmhFNHBzcGhjMFlVOVZuazZQc2lGVWJoQXhqZ0d3Nll6NUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AMBPR04MB11741.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkdHN1lKR2VDMk1HUms5ek5qbDlvejBSNE0xK1Fhd3ludDRuVmNrVVVrTk1K?=
 =?utf-8?B?L0N1WjdGY0JrTTFBVEpNdk1melk4RXFnanZBZTd5blZiN25wSGVPbVBaN2NQ?=
 =?utf-8?B?WjBjYXRrcFlMTWFjVHF3T25NSm9ESE5tWWpwN0I1czRVWThqSnNHUjhta1Jx?=
 =?utf-8?B?ODVkaThtbWJnWHcvWnI5ZEUxc04vYlZUdmduc1Boc1ZUR2VIL0FIcTZYM1gy?=
 =?utf-8?B?WHVJRmhsVGQ1MVU3amcrNEl1SnVXVVVub1lxdEpvNnA2UkRCRkhzWmI4b3RN?=
 =?utf-8?B?NjVadjk0N0pmSGRJUTZFMEpBRms0bTljeFMxU0R4amFISmhPYzdCNkRpM3hM?=
 =?utf-8?B?Z1YzSnJqNnFOYjJHTGVHNzdUVHU0MzJnWWZlR00wOXdaeVI0UnJidG1sU2ZP?=
 =?utf-8?B?cFpnaks4OElONmVWSG1WZlppZ1Y2Y2pOS3cyUTlXU2NFOVJnRUxPNFBqUkg2?=
 =?utf-8?B?SmlyNW1CQ1BvZ0RhQUxtL3BPeHVGM0txL2gzM1pESGRodnYyMDJLOHZJRHJT?=
 =?utf-8?B?N05ZSVVpRkRxWXZwTjJXOVFCU3gwT2lMb1NGc0R4bUgzNmtYZTVyWTgvWHV5?=
 =?utf-8?B?bld1bkt0RTZhUElvNTV0b25FV0MxalkyVWdLVWhNOW1JVmJDeDd1bXU4b1U0?=
 =?utf-8?B?NjZ5T0JPMlErOEwrd3dOT2grVUlzSk9UcTM0eFRSMWpqVW5QRHIxQW1NMlYy?=
 =?utf-8?B?WFRtZUlrU2FVcE1DT3VYVHc0R0xpZzRJT3ZreWxqVUtkbzNUa1MxSHJVTkEw?=
 =?utf-8?B?T2t4QVBSTW9HZk4wd3BmeFVYTEhXVU5TY095a3BZeEpTb2dtMFZnZVd6cjlF?=
 =?utf-8?B?cTZ0SjJ2TTlJdThDQ1daWEhKVWt0LzFDUVQ4TElsdTk2bjNFeEJ5OFZyRzV4?=
 =?utf-8?B?eG5Cb3NkQ1QvSVJNWjg4bUR2SkhaQlh1S29lUnBsSXk4RUtGeUpScWxvV0Yz?=
 =?utf-8?B?bS92VEw5dmR5ZFhXTzFHVkhDN1FUUXVQTVZuSWtkb1NveG15YzBBSEJ3a2Z2?=
 =?utf-8?B?OGxoUks1alo0dW5ycldaWTJYdGdIdHR2dFFHTjk0UEd2cDF6RHpXWFRKcUcx?=
 =?utf-8?B?NnZ1N3IyKzI5dkxBaVk4K2M5NTFFRU13K1BZaThNNW41MktjUEFhaWhzUVpy?=
 =?utf-8?B?OUw1ejNNTmxBQ0hLRW1iZ08yRUxuRHdIYjZjM01MaVYwZUtiQTJrZ1pqYVpn?=
 =?utf-8?B?bDN1WmlTWkJ4VDdERitYaFhwMncrSGo5MXpnYS9UQXFiQUFTTGFHY3lMTDZa?=
 =?utf-8?B?Y0NDM3VrWEZHZWVLczRlSERoU1g0Z29ZV0hpZTdMUWl2TEVnZzFNUG14dm85?=
 =?utf-8?B?OEJTc3gyblBwaE1QaUFNV09Sdys2UFQyUDRiTnQ0ZThkVDFGOUZBZkFUaUcx?=
 =?utf-8?B?cTl4emkwN2tCeld2VUVkbGxheUliaStJK3dXbzJIZkNtMWRFN1BIVFhYeUpi?=
 =?utf-8?B?TmE5dGRFeHh6V05TSkxyMXY4UjQ1Zkk3bmgyeG00TC84UnBlaXU5Z20yRDYv?=
 =?utf-8?B?dGttRFR5NTRjR0E5OE5SbG9Pa3lrMThPUVdxNVhseUZheHNBQjZFaUJLdlRL?=
 =?utf-8?B?cnUzVUF1UmNGQ1Y0RjRVcE5HR2lXenpRc0ttMkNsUDZLOVBwa2Y5R2c2M09j?=
 =?utf-8?B?cEN6WjV5TXkzTnFlUDAvai9YM1djdDBVUWRzMlRPeDdrbkdOM1BtQXF2dThh?=
 =?utf-8?B?eHVnNHNjYXdpMWxzQTNOYWxwRTFUVnRSTkZSaHRrbEp4MU1zT2hQeUZHMHNI?=
 =?utf-8?B?bXA3eitBMDZ6YXlGVlZnMlpXaFpXSEZveE94SGNCbVp4ci9XNU8zMGdHVllV?=
 =?utf-8?B?WjZaOGhYSVdsL1BmS3RKSE5PMDRHajJsRDBiNVF2S2NLYnZPL0Yxb2JTNWxV?=
 =?utf-8?B?SURqS1JjcXAyV1lxUkFjOEh0V2ROR2RIMUltV0hNTWhYRkNSYWxiWHNWNzBJ?=
 =?utf-8?B?SDdoem1GUmRVMno4UW4xQXUwL1FEQWNQeDF0bmRBNFgwVUdsVGRGT2VPMTlw?=
 =?utf-8?B?bU8wTkVnRWNtNCtQQXB5bjVLQkVBcjQ3eFFKTzdxUjhaRDdUSFM1Zlg5QjhD?=
 =?utf-8?B?bHdUd3NIMHJJa3YxTFdqejFvVTQ3S0hQaFphcU1SckhaakV1SnB3T2ZFei83?=
 =?utf-8?B?ajBZUU56aURreE9ES2s5bEg4eXUzNFh6Nm9LWGFlT0ZUZUdlN2R0WXhzZHRm?=
 =?utf-8?B?Y2U0V0tDSDBmeWlZQVJrRGFEcy90bUF6WlVMWnRhMUk1MTU1YUVzVkc4cE1x?=
 =?utf-8?B?MmU0RWtkNHJyUDExMXczYUZwMHFRPT0=?=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55dd2270-6e34-4c8a-5df2-08de2034cdae
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB11741.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 08:40:29.5395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0UnDyIQBzwSGXtkTVMpGnTrHB0zcG4y8zcG4VfwQsSYjv9inRMvB7XuYvs5HA7Q6ffJIGrjyBGF40apK5/vYvNlB8Ke39aHNQLz8XTixCEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8663
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

On 11/7/25 17:14, Daniel Thompson wrote:
> On Fri, Nov 07, 2025 at 01:49:59PM +0100, Maud Spierings via B4 Relay wrote:
>> From: Maud Spierings <maudspierings@gocontroll.com>
>>
>> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
>> with integrated boost controller.
>>
>> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
>> diff --git a/drivers/video/backlight/max25014.c b/drivers/video/backlight/max25014.c
>> new file mode 100644
>> index 000000000000..36bae508697e
>> --- /dev/null
>> +++ b/drivers/video/backlight/max25014.c
>> @@ -0,0 +1,409 @@
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
>> +#define MAX_BRIGHTNESS            100
>> +#define MIN_BRIGHTNESS            0
>> +#define TON_MAX                   130720 /* @153Hz */
>> +#define TON_STEP                  1307 /* @153Hz */
>> +#define TON_MIN                   0
>> +
>> +#define MAX25014_DEV_ID           0x00
>> +#define MAX25014_REV_ID           0x01
>> +#define MAX25014_ISET             0x02
>> +#define MAX25014_IMODE            0x03
>> +#define MAX25014_TON1H            0x04
>> +#define MAX25014_TON1L            0x05
>> +#define MAX25014_TON2H            0x06
>> +#define MAX25014_TON2L            0x07
>> +#define MAX25014_TON3H            0x08
>> +#define MAX25014_TON3L            0x09
>> +#define MAX25014_TON4H            0x0A
>> +#define MAX25014_TON4L            0x0B
>> +#define MAX25014_TON_1_4_LSB      0x0C
>> +#define MAX25014_SETTING          0x12
>> +#define MAX25014_DISABLE          0x13
>> +#define MAX25014_BSTMON           0x14
>> +#define MAX25014_IOUT1            0x15
>> +#define MAX25014_IOUT2            0x16
>> +#define MAX25014_IOUT3            0x17
>> +#define MAX25014_IOUT4            0x18
>> +#define MAX25014_OPEN             0x1B
>> +#define MAX25014_SHORT_GND        0x1C
>> +#define MAX25014_SHORT_LED        0x1D
>> +#define MAX25014_MASK             0x1E
>> +#define MAX25014_DIAG             0x1F
>> +
>> +#define MAX25014_IMODE_HDIM       BIT(2)
>> +#define MAX25014_ISET_ENABLE      BIT(5)
>> +#define MAX25014_ISET_PSEN        BIT(4)
>> +#define MAX25014_DIAG_HW_RST      BIT(2)
>> +#define MAX25014_SETTING_FPWM     GENMASK(6, 4)
>> +
>> +struct max25014 {
>> +	struct i2c_client *client;
>> +	struct backlight_device *bl;
>> +	struct regmap *regmap;
>> +	struct gpio_desc *enable;
>> +	struct regulator *vin; /* regulator for boost converter Vin rail */
>> +	uint32_t iset;
>> +	uint8_t strings_mask;
>> +};
>> +
>> +static const struct regmap_config max25014_regmap_config = {
>> +	.reg_bits = 8,
>> +	.val_bits = 8,
>> +	.max_register = MAX25014_DIAG,
>> +};
>> +
>> +/**
>> + * @brief control the brightness with i2c registers
>> + *
>> + * @param regmap trivial
>> + * @param brt brightness
>> + * @return int
>> + */
>> +static int max25014_register_control(struct regmap *regmap, uint32_t brt)
> 
> This isn't a good name for a function. It doesn't really say what it
> does. Please find a more descriptive name.

Having a lot of difficulties find a succinct name that fits better, 
max25014_register_brightness_control()?
max25014_i2c_brightness_control()?

> 
>> +{
>> +	uint32_t reg = TON_STEP * brt;
>> +	int ret;
>> +	/*
>> +	 * 18 bit number lowest, 2 bits in first register,
>> +	 * next lowest 8 in the L register, next 8 in the H register
>> +	 * Seemingly setting the strength of only one string controls all of
>> +	 * them, individual settings don't affect the outcome.
>> +	 */
>> +
>> +	ret = regmap_write(regmap, MAX25014_TON_1_4_LSB, reg & 0b00000011);
>> +	if (ret != 0)
>> +		return ret;
>> +	ret = regmap_write(regmap, MAX25014_TON1L, (reg >> 2) & 0b11111111);
>> +	if (ret != 0)
>> +		return ret;
>> +	return regmap_write(regmap, MAX25014_TON1H, (reg >> 10) & 0b11111111);
>> +}
>> +
>> +static int max25014_check_errors(struct max25014 *maxim)
>> +{
>> +	uint8_t i;
>> +	int ret;
>> +	uint32_t val;
>> +
>> +	ret = regmap_read(maxim->regmap, MAX25014_OPEN, &val);
>> +	if (ret != 0)
>> +		return ret;
>> +	if (val > 0) {
>> +		dev_err(&maxim->client->dev, "Open led strings detected on:\n");
>> +		for (i = 0; i < 4; i++) {
>> +			if (val & 1 << i)
>> +				dev_err(&maxim->client->dev, "string %d\n", i + 1);
>> +		}
>> +		return -EIO;
>> +	}
>> +
>> +	ret = regmap_read(maxim->regmap, MAX25014_SHORT_GND, &val);
>> +	if (ret != 0)
>> +		return ret;
>> +	if (val > 0) {
>> +		dev_err(&maxim->client->dev, "Short to ground detected on:\n");
>> +		for (i = 0; i < 4; i++) {
>> +			if (val & 1 << i)
>> +				dev_err(&maxim->client->dev, "string %d\n", i + 1);
>> +		}
>> +		return -EIO;
>> +	}
>> +
>> +	ret = regmap_read(maxim->regmap, MAX25014_SHORT_GND, &val);
>> +	if (ret != 0)
>> +		return ret;
>> +	if (val > 0) {
>> +		dev_err(&maxim->client->dev, "Shorted led detected on:\n");
>> +		for (i = 0; i < 4; i++) {
>> +			if (val & 1 << i)
>> +				dev_err(&maxim->client->dev, "string %d\n", i + 1);
>> +		}
>> +		return -EIO;
>> +	}
>> +
>> +	ret = regmap_read(maxim->regmap, MAX25014_DIAG, &val);
>> +	if (ret != 0)
>> +		return ret;
>> +	/*
>> +	 * The HW_RST bit always starts at 1 after power up.
>> +	 * It is reset on first read, does not indicate an error.
>> +	 */
>> +	if (val > 0 && val != MAX25014_DIAG_HW_RST) {
>> +		if (val & 0b1)
>> +			dev_err(&maxim->client->dev,
>> +				"Overtemperature shutdown\n");
>> +		if (val & 0b10)
>> +			dev_err(&maxim->client->dev,
>> +				 "Chip is getting too hot (>125C)\n");
>> +		if (val & 0b1000)
>> +			dev_err(&maxim->client->dev,
>> +				"Boost converter overvoltage\n");
>> +		if (val & 0b10000)
>> +			dev_err(&maxim->client->dev,
>> +				"Boost converter undervoltage\n");
>> +		if (val & 0b100000)
>> +			dev_err(&maxim->client->dev, "IREF out of range\n");
>> +		return -EIO;
>> +	}
>> +	return 0;
>> +}
>> +
>> +/*
>> + * 1. disable unused strings
>> + * 2. set dim mode
>> + * 3. set initial brightness
> 
> How does this code set the initial brightness? It doens't set the
> MAX25014_TON* registers.

Yep forgot to remove that, I discovered the backlight core takes care of 
the default brightness, so I removed it from here.

> 
>> + * 4. set setting register
>> + * 5. enable the backlight
>> + */
>> +static int max25014_configure(struct max25014 *maxim)
>> +{
>> +	int ret;
>> +	uint32_t val;
>> +
>> +	ret = regmap_write(maxim->regmap, MAX25014_DISABLE,
>> +			   maxim->strings_mask);
>> +	if (ret != 0)
>> +		return ret;
>> +
>> +	ret = regmap_write(maxim->regmap, MAX25014_IMODE, MAX25014_IMODE_HDIM);
>> +	if (ret != 0)
>> +		return ret;
>> +
>> +	ret = regmap_read(maxim->regmap, MAX25014_SETTING, &val);
>> +	if (ret != 0)
>> +		return ret;
>> +
>> +	ret = regmap_write(maxim->regmap, MAX25014_SETTING,
>> +			   val & ~MAX25014_SETTING_FPWM);
>> +	if (ret != 0)
>> +		return ret;
>> +
>> +	ret = regmap_write(maxim->regmap, MAX25014_ISET,
>> +			   maxim->iset | MAX25014_ISET_ENABLE |
>> +			   MAX25014_ISET_PSEN);
>> +	return ret;
>> +}
>> +
>> +static int max25014_update_status(struct backlight_device *bl_dev)
>> +{
>> +	struct max25014 *maxim = bl_get_data(bl_dev);
>> +
>> +	if (backlight_is_blank(maxim->bl))
>> +		bl_dev->props.brightness = 0;
>> +
>> +	return max25014_register_control(maxim->regmap,
>> +					 bl_dev->props.brightness);
>> +}
>> +
>> +static const struct backlight_ops max25014_bl_ops = {
>> +	.options = BL_CORE_SUSPENDRESUME,
>> +	.update_status = max25014_update_status,
>> +};
>> +
>> +static int max25014_parse_dt(struct max25014 *maxim,
>> +			     uint32_t *initial_brightness)
>> +{
>> +	struct device *dev = &maxim->client->dev;
>> +	struct device_node *node = dev->of_node;
>> +	struct fwnode_handle *child;
>> +	uint32_t strings[4];
>> +	int res, i;
>> +
>> +	if (!node) {
>> +		dev_err(dev, "no platform data\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	child = device_get_next_child_node(dev, NULL);
>> +	if (child) {
>> +		res = fwnode_property_count_u32(child, "led-sources");
>> +		if (res > 0) {
>> +			fwnode_property_read_u32_array(child, "led-sources",
>> +						       strings, res);
>> +
>> +			/* set all strings as disabled, then enable those in led-sources*/
>> +			maxim->strings_mask = 0xf;
>> +			for (i = 0; i < res; i++) {
>> +				if (strings[i] <= 4)
>> +					maxim->strings_mask &= ~BIT(strings[i]);
>> +			}
>> +		}
>> +
>> +		fwnode_property_read_u32(child, "default-brightness",
>> +					 initial_brightness);
>> +
>> +		fwnode_handle_put(child);
>> +	}
>> +
>> +	maxim->iset = MAX25014_ISET_DEFAULT_100;
>> +	of_property_read_u32(node, "maxim,iset", &maxim->iset);
>> +
>> +	if (maxim->iset < 0 || maxim->iset > 15) {
>> +		dev_err(dev,
>> +			"Invalid iset, should be a value from 0-15, entered was %d\n",
>> +			maxim->iset);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (*initial_brightness < 0 || *initial_brightness > 100) {
>> +		dev_err(dev,
>> +			"Invalid initial brightness, should be a value from 0-100, entered was %d\n",
>> +			*initial_brightness);
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int max25014_probe(struct i2c_client *cl)
>> +{
>> +	struct backlight_device *bl;
>> +	const struct i2c_device_id *id = i2c_client_get_device_id(cl);
>> +	struct max25014 *maxim;
>> +	struct backlight_properties props;
>> +	int ret;
>> +	uint32_t initial_brightness = 50;
>> +
>> +	maxim = devm_kzalloc(&cl->dev, sizeof(struct max25014), GFP_KERNEL);
>> +	if (!maxim)
>> +		return -ENOMEM;
>> +
>> +	maxim->client = cl;
>> +
>> +	ret = max25014_parse_dt(maxim, &initial_brightness);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	maxim->vin = devm_regulator_get_optional(&maxim->client->dev, "power");
> 
> I would have expected to see devm_regulator_get() here. Why do you care
> whether you get a real regulator or a dummy if you just NULL check
> maxim->vin everywhere?
> 
> 
>> +	if (IS_ERR(maxim->vin)) {
>> +		if (PTR_ERR(maxim->vin) == -EPROBE_DEFER)
>> +			return -EPROBE_DEFER;
>> +		maxim->vin = NULL;
>> +	}
>> +
>> +	if (maxim->vin) {
> 
> If you had called devm_regulator_get() there would be no need for a NULL
> check here.
> 
> 
>> +		ret = regulator_enable(maxim->vin);
>> +		if (ret < 0) {
>> +			dev_err(&maxim->client->dev,
>> +				"failed to enable Vin: %d\n", ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	maxim->enable = devm_gpiod_get_optional(&maxim->client->dev, "enable",
>> +						GPIOD_ASIS);
>> +	if (IS_ERR(maxim->enable)) {
>> +		ret = PTR_ERR(maxim->enable);
>> +		dev_err(&maxim->client->dev, "failed to get enable gpio: %d\n",
>> +			ret);
>> +		goto disable_vin;
>> +	}
>> +
>> +	if (maxim->enable)
>> +		gpiod_set_value_cansleep(maxim->enable, 1);
> 
> No need for NULL pointer check here (see
> https://elixir.bootlin.com/linux/v6.18-rc4/source/drivers/gpio/gpiolib.c#L358-L363 ).
> 
> 
>> +
>> +	/* Enable can be tied to vin rail wait if either is available */
>> +	if (maxim->enable || maxim->vin) {
>> +		/* Datasheet Electrical Characteristics tSTARTUP 2ms */
>> +		usleep_range(2000, 2500);
>> +	}
> 
> If you really want to keep the devm_regulator_get_optional() I guess
> maybe you could persuade me it's need to avoid this sleep... although
> I'd be fairly happy to remove the NULL checks here too!

Just wait unconditionally?

kind regards,
Maud

> 
>> +
>> +	maxim->regmap = devm_regmap_init_i2c(cl, &max25014_regmap_config);
>> +	if (IS_ERR(maxim->regmap)) {
>> +		ret = PTR_ERR(maxim->regmap);
>> +		dev_err(&maxim->client->dev,
>> +			"failed to initialize the i2c regmap: %d\n", ret);
>> +		goto disable_full;
>> +	}
>> +
>> +	i2c_set_clientdata(cl, maxim);
>> +
>> +	ret = max25014_check_errors(maxim);
>> +	if (ret) { /* error is already reported in the above function */
>> +		goto disable_full;
>> +	}
>> +
>> +	ret = max25014_configure(maxim);
>> +	if (ret) {
>> +		dev_err(&maxim->client->dev, "device config err: %d", ret);
>> +		goto disable_full;
>> +	}
>> +
>> +	memset(&props, 0, sizeof(props));
>> +	props.type = BACKLIGHT_PLATFORM;
>> +	props.max_brightness = MAX_BRIGHTNESS;
>> +	props.brightness = initial_brightness;
>> +	props.scale = BACKLIGHT_SCALE_LINEAR;
>> +
>> +	bl = devm_backlight_device_register(&maxim->client->dev, id->name,
>> +					    &maxim->client->dev, maxim,
>> +					    &max25014_bl_ops, &props);
>> +	if (IS_ERR(bl))
>> +		return PTR_ERR(bl);
>> +
>> +	maxim->bl = bl;
>> +
>> +	return 0;
>> +
>> +disable_full:
>> +	if (maxim->enable)
>> +		gpiod_set_value_cansleep(maxim->enable, 0);
> 
> Again, NULL check isn't needed.
> 
>> +disable_vin:
>> +	if (maxim->vin)
>> +		regulator_disable(maxim->vin);
>> +	return ret;
>> +}
>> +
>> +static void max25014_remove(struct i2c_client *cl)
>> +{
>> +	struct max25014 *maxim = i2c_get_clientdata(cl);
>> +
>> +	maxim->bl->props.brightness = 0;
>> +	max25014_update_status(maxim->bl);
>> +	if (maxim->enable)
>> +		gpiod_set_value_cansleep(maxim->enable, 0);
> 
> Lose the NULL check.
> 
>> +	if (maxim->vin)
>> +		regulator_disable(maxim->vin);
>> +}
>> +
>> +static const struct of_device_id max25014_dt_ids[] = {
>> +	{ .compatible = "maxim,max25014", },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, max25014_dt_ids);
>> +
>> +static const struct i2c_device_id max25014_ids[] = {
>> +	{ "max25014" },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(i2c, max25014_ids);
>> +
>> +static struct i2c_driver max25014_driver = {
>> +	.driver = {
>> +		.name = KBUILD_MODNAME,
>> +		.of_match_table = of_match_ptr(max25014_dt_ids),
>> +	},
>> +	.probe = max25014_probe,
>> +	.remove = max25014_remove,
>> +	.id_table = max25014_ids,
>> +};
>> +module_i2c_driver(max25014_driver);
>> +
>> +MODULE_DESCRIPTION("Maxim MAX25014 backlight driver");
>> +MODULE_AUTHOR("Maud Spierings <maudspierings@gocontroll.com>");
>> +MODULE_LICENSE("GPL");
> 
> 
> Daniel.

