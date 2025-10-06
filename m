Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBBDBBD933
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 12:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 260D510E2FF;
	Mon,  6 Oct 2025 10:03:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="eIGZLXRq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11023087.outbound.protection.outlook.com [52.101.72.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC5210E2FF
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 10:03:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DEmWZyPVEDga/YVRbB0rBcAl4pGFDI8OU3ciLJ8F+GGJKpDWk2JoYv1J7EK+pPJq0j4ds0jkWpKAKRCFtsoI++Z1AMCXU5lEPoIOqHJTRb8cXEe3ULpKBjpTMLfM2Fdr0YKyMh9G/5lchs9bEDwcXv1phTAcZXctopBQb/cHoE+NudhgQMZ+Fj5jDk6SzugbUSveU6wYrp0Jb96Ml/9oAb6yeltQ/qaPDx78/HW4AIPYknxsBSLJEHxGPztEPIlpqIo/2PR7FXLHRXYyv2nt7Bx7t3Yxqmr5Ob/lnUkL9X/drL8CV47JHGcHXAwZmy9CW+OsX2biSGgE/POxrytpGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYdv4SGfdrXn6SZIeaZsVc0w5axvdFAOM8v3r8fxOro=;
 b=hoS6CEA6b4vx5FJVK1n09wtdoBCDVQdUVDxOzvUwRLtHz0Eg9av4XjM2/aw/4R+ZWbG2+82MDLoHd+jjvO8hM5UIK3tFkgrQDdZI3heloA9KCOG9tZulc2GagI+0GtadqAQAq2fgl5lfapX9w0+C+D3Flo9fb0FPvox5pqjl2VL2Tyl3aCQ3S055Ib9MS1hIuqEpR3o/O3rfDXeAUuubu/1bxD3qomeqMzaiI4+5haau2V1YT+CfQri23x3wVRSZb7ysvuezT1e3aRXPsgMkEV07tM6uPvvO62n/seRjKz4dALqyyCvnwzmg/1xQhdH9QwTiYYpxKneJh5J4HihojQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYdv4SGfdrXn6SZIeaZsVc0w5axvdFAOM8v3r8fxOro=;
 b=eIGZLXRqZa1O4JVqfOYlH8WJ3djnBG1ImYloTmiHsUJexR8mY/BuQmzTU6168KNjSAT+Ss2NIthHBNpzKJqWlNykomishOfh4DctTdY/O1UiszalcSgvgx1lA6VkyUoW4t5EuL0AD9KEtTtS3bK2t7+hv/z4ZDBYTLdPRn1YtOOZQEgr8c7RVuQo8tDlYqHjSs5SN1WwCg6OLWJ+eJ4Is+VRaLm/Yx0U4pSlrHSNCSDTBb/Tl5V33kp/8OCTCdxdbVQW13Kt1T2+rysTDqbzukf40pbQBokGIC48ZngRz2UVS4dC2a3DuOXBbnKHQgo47AcrR3i9CxOu7zYfvnZ7zw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from DBBPR04MB7628.eurprd04.prod.outlook.com (2603:10a6:10:204::21)
 by DB9PR04MB9865.eurprd04.prod.outlook.com (2603:10a6:10:4f0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 10:03:32 +0000
Received: from DBBPR04MB7628.eurprd04.prod.outlook.com
 ([fe80::13ac:aaf4:c0fd:2106]) by DBBPR04MB7628.eurprd04.prod.outlook.com
 ([fe80::13ac:aaf4:c0fd:2106%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 10:03:32 +0000
Message-ID: <5c5cf363-db5c-4d0b-902f-97c6ef06c08f@gocontroll.com>
Date: Mon, 6 Oct 2025 12:02:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: backlight: Add max25014 bindingsy
To: Frank Li <Frank.li@nxp.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250911-max25014-v3-0-d03f4eba375e@gocontroll.com>
 <20250911-max25014-v3-1-d03f4eba375e@gocontroll.com>
 <aMLrrcBZ2Kc4o84t@lizhi-Precision-Tower-5810>
 <3960b845-3838-4690-b01d-21e61ccfa8fd@gocontroll.com>
 <aMQ6rZJzbMeBrrFv@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <aMQ6rZJzbMeBrrFv@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0P190CA0026.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::36) To DBBPR04MB7628.eurprd04.prod.outlook.com
 (2603:10a6:10:204::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7628:EE_|DB9PR04MB9865:EE_
X-MS-Office365-Filtering-Correlation-Id: 665a5e91-4c3f-4eb6-b508-08de04bf9aa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTRDaDdta3ZoVk1SVGVBNmxnTFpvSVFLWC9OeVlHaTNPenRpOXB4MFNwbXdZ?=
 =?utf-8?B?cG8rYnRCZnp3TVlCQUFvM01jclUybVczNUJWd0kxWnFtU3dzVGthMWdJZHJR?=
 =?utf-8?B?NUd0alNOT2h1MS9ST3kzWHhyRnJ6cmJYVEkzd0ZRaVlLdUhhUWYxNmsvNEtu?=
 =?utf-8?B?Y1RxL3VTcUFpUnpDeXlzOXNYeWRpQUdBL2taaGVQVUZmSGVvMTVJR29HWGcx?=
 =?utf-8?B?NEYveEtaczF4dGxRQTkwb1oxTmNrc25JM2FsTHhoUHJzUFdaTC9HUVNtREwx?=
 =?utf-8?B?eGtsVmtvK1ZleGRMY3Z5elpHQzNNOTJINHY0TXIrZWdPMUpsZW1SL2pidk5O?=
 =?utf-8?B?UFc2QVhCYnJjWktRUnpNTk1mR29oWFZIWDE1OUFXY3JqWDNZSjQ1TGpCdlRV?=
 =?utf-8?B?KzJycmQ3N3RqaWtNTVYxVFk5eENSN252b2dyQ2luaHlMdldSRkpUWGZtbUlE?=
 =?utf-8?B?d2tHcHBmdEVpdHJzNmJuNGdQOFoyWTRxeVl4MmFLWGdXWUxGck51VjVselJO?=
 =?utf-8?B?MlZMTHdwUVFUWk5tdXVjMDFlSDRnblRhN3RDTCtIRzVWOGR4YUNvUGZxbTUv?=
 =?utf-8?B?V0Y3NytBMU1nR1kzVFVoSWoxUUN5eDdlL1RrQ1Z6TE9yamN6dms5ejhucmk4?=
 =?utf-8?B?N1ZmRDFlOVNld3R6Z0R0Z0dzczJNN01BbGxlL1lNTlRvbjIrcWtoWHFsRTF2?=
 =?utf-8?B?SVF5WVVhckVEOWxUTCtQT3BEOVRIODlXa3NiRzZtakRINmZuNE1MaVVSL1Jm?=
 =?utf-8?B?ZzR6OExLQ0tvcm55U21mNEkxSVNtQUY2SHVEU3NuNjhOcWJhWUFJTzdVTGEr?=
 =?utf-8?B?OG1MbmZjUUhsbjNXZE9HUzU0WXJweXpueXFsRUZpNktHeldzcFlmcVJhWTYw?=
 =?utf-8?B?WGh5N2xxbVFSQkVPWTZBeGJaK0l4S01lMGU1VUphODk4cVlUNVRrMWY4MGhR?=
 =?utf-8?B?Y2N5U00zZkRPVk5jRVFaWExvYnBqRndWdkgvS1htVENTK01NZm1TMWFoMVBO?=
 =?utf-8?B?SURhRGJvWEhZUFJETURzVGVlMmh4eW1KWWdEZDFOWW5XNmQ4SmhGa1NndmRv?=
 =?utf-8?B?RFdqSTdTT1FVSjJJSS93TmU5L1lpQW5pWk9qdnVnSXgvQzJTR2YwbExaQ3NY?=
 =?utf-8?B?N2drN0dBZDdpTEVJdWJLSEFpQkQ5TnB0dEZsZWdwSlQ3TUVONUNLVVR2blV4?=
 =?utf-8?B?SFB3MlhOem9TUnUyVmZiWWdhZ2JKOThJOWxBZ29FZGNQeXNRV3MzaUNRbVVC?=
 =?utf-8?B?THJONUl1VU1FaHYwd1lNcUw1NHBOOTIvSXRtell6dUhCWWtaQ2ZxcVljZzY3?=
 =?utf-8?B?b0lTR011U2hzUktvM1RKWm8xVUxNZHhvV0puNmtXc1RkdUpCNzlvOUxvT1c5?=
 =?utf-8?B?ZG8xUEVhSFFOOVhnZy9EVllVR3M3UEE3T0x4cloyM3Fpd3htYUhlbzFpVStB?=
 =?utf-8?B?MW5iMHEwZ2JNQ20wTzFIdm5UZkJhODB6UktUMXJmM2hrbFdyRXRvRXpVVm5q?=
 =?utf-8?B?VS9vcTRHVjRKOVI4TWQyUmVIRUxVaVgxSE5NVDRYaVEvbGlnd0JnaDJ4K1Br?=
 =?utf-8?B?SFRUWjU4c29HWXg5ZG5xVU5rc2Z0bW8vUUJqWm9yU3kvSmFWUE5ZVDFrOWgz?=
 =?utf-8?B?WUFFUDY4TXNUTmo5bDEyU2Y0VlFEeVVjSjJZUWVSTmNDcWV6TkpQYVJDeWhp?=
 =?utf-8?B?bWhTY29IcUtmR1V5aC9BaitZdy9BK1pjWnNpOFE1QmxkUEhScE01ajFCRytH?=
 =?utf-8?B?N0hsUHZqRWtPN1lLSkNwdWpNSGVvYS9jcUtiSzNPekFZVmxPV2hzQXlDUU8r?=
 =?utf-8?B?Uk4zS1JzTDViSldpcmNsSDBpWFRJSUlocVpVdkd2QnBGTmIwaWZlOGFpU28r?=
 =?utf-8?B?VDU2WVpHblZQZmtXNnBHNUNNY2NrUUxLaGc2SS91NEJQdFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR04MB7628.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUZpeEk5NEt4L2ZQNVRpcnJoNGNwK2dyaXJJNWtwNnk3SG1uejFGamhCaStu?=
 =?utf-8?B?UnRnSFRybWtvQ1hHSkJrblhxK1JMQ3czTFFuZ2RqSVVJdnlPTWZKMXlXWTJW?=
 =?utf-8?B?OWFaNjRITVUyL3Qxcys0Rm5ubzd1YitOSmpqTEpYMnZvVW43WVdXSzdOYXJj?=
 =?utf-8?B?SHJiNU1GTEpkdWxkazJ5QUkveFd5SGpqakdmeFBjNFRGQjE2ZWE1c0loUVJm?=
 =?utf-8?B?aHZHNWVRRUdMVkNqU2Z2cm84bkFFeUxDMk9kc3lpcVIwUTJodVY5QmREVzZT?=
 =?utf-8?B?OUR0d20zR2I3MDdObXo2eDNNV2dzeXlXcWltNFQ1SCtkMzUrcGt2VGJwTDBY?=
 =?utf-8?B?aUtkRmx1bWVadllCUXdtV254NUhwQndTby9pUi81WHAxNDlGQkJrS1dhZE5H?=
 =?utf-8?B?blpnTWJnVnFXUUM2ZWZGemVhQmJnWVJpL2Rya3VsWjQ4UHVIekg5U3FtZkFJ?=
 =?utf-8?B?S0VtZ0RaVWdzUjA1V3d4TmlyeitZd3IxbEU3eU5ucG5xbjAvS25xU25ITXBI?=
 =?utf-8?B?YUhHR2QrSDhVam9TY0VtK3V0d1V1OEQzckYxR3RoU05aNXlHYkFCN3FwQnho?=
 =?utf-8?B?M3RJRExqL0pJR0liaU1ocUV2Zk4yeXVxOGxXSExQeGV6eUFIYmprc3U4OUxu?=
 =?utf-8?B?L1ZDWURWdlh2ektzcHNvU0krZHVDNXl6TzlFRlJFSk9NRnZBKzhRY0V6VUgw?=
 =?utf-8?B?UFFmTm9sYzMva1R6Qk0vKzEvR25UR1B3L3RudFM4aWl3NGUvTzZCSFRwSU9L?=
 =?utf-8?B?MDd5eW1jTTFQR3YxRzFReXRpRGR3UUVhamJtb0pHcDNHeVhTekdpTCt6c1pB?=
 =?utf-8?B?Z1F2ZWlVcDNQUWthb2xxNDBaYmkzYWhnSkNXVCtyZG5zWlRNTlo4VTRRNVhW?=
 =?utf-8?B?OTNiQWd4dUZDNWd1dWNlSVlLL2kwdzl6K0daamxVc1NaQkRUanhBSUt4WlF4?=
 =?utf-8?B?YkFzYUp2amJ6TnV5elNnU1hEcG5MMXE1TTB3TXAzOTZLNUFFT0FiUTVXdVVZ?=
 =?utf-8?B?R3ZTcEE2cjhSRFByeXRTdUs0eTFkNlFwZkFyYVhzck56dXlzUlVXdDNQQ1Zi?=
 =?utf-8?B?enc1ZlpSTzYxYjJmZFFJZEtyeTZ6NS9TY2FWeDNtUDkzK0tyRm9UNmJZcXho?=
 =?utf-8?B?UDZnTWNoZU9kVUFOWkJvV29tSUlpdjdGNitQN1ZKR25EN1FaSm9kelZOQ1hq?=
 =?utf-8?B?VTlFbndYVWEwNXZKY2licUdmcGpiOHF3UVZ0elRqTlRtZjg0VHF2dmZ4akNl?=
 =?utf-8?B?c0ZJek5WL2tOdFZJRGlUbUFNalNoaHVhYzJwYXBFU0dCQ2dKMzlGcFM3RXZr?=
 =?utf-8?B?eEtrbVViM2svbVd1MDA5YlFwRWErNWdXcVpsNkxzK2Q4TkJGaS9uV3dxbHZ6?=
 =?utf-8?B?RFdRMGtqR1FvZWhySFozWmtqdHNpajNLdFZhMkwrSU83KzRqLzBOQjVDRmNh?=
 =?utf-8?B?WVpEdmpZUXZKUXJOR0ZVK1JuZ05ZZUtBNG02M2NBc0Y1bTlQYTBqS2c5TWVD?=
 =?utf-8?B?dHg4bkZvbzlCTzBJUFVMcldPczVIeU1nTjZOVnFBeGJXVnJVZm16cmd3Z1J5?=
 =?utf-8?B?VkZaaEgxS2NmS0F2eXdNSGcreEZWeHdKbFN6Nzh4N0dOSnZzdkpPdU92b1Qx?=
 =?utf-8?B?ODBTOExwVHRHU2IyNmFZRnZsNm9tYVdyYnpJK0luVzVOK2hRdkQ2czh0S09C?=
 =?utf-8?B?TFJEcEpVRTNPeVRlOEZOWGpkYmxueGQzRXdsa2YyOHVjbkVpcjhuam5lTTg1?=
 =?utf-8?B?UUxrYjQwazViZ2dhSkYwc2c3Q2ZEN3hJdUo4Uk5oeUJPM1BkKy9RMEJIcVR2?=
 =?utf-8?B?VUVkOFA2ZWZkRVV5ejBNZWFFVEhxUlI0MnYvQWRKczFxelZVN214N2pkdlM5?=
 =?utf-8?B?enRuRmcyeDFqTXZpVC9yRmYxYStKOGxnMDZiM2doY1hTT2VhMUtWa0tHZkVh?=
 =?utf-8?B?dnEwRXNjbUhXakVrb3JXMVNmWGprTWFlSUtlb1R3ZDNhZWxZeW93aVhRYTRC?=
 =?utf-8?B?cUtaTjA3Q0UrK3pDYWFnSitzUHVKZVFlN1FFVk0vTDFaVHFxNk5xT2huQXNl?=
 =?utf-8?B?RWZsQXViMmpON0FFTExmakpKLzVKSXpRYUxrWEJ4TUxNTVIyK0RXN0MzNFp4?=
 =?utf-8?B?MzJkZnpkKzZqUmR3cGEyczFzUXJGWitCSHVCcSt6VFo4elQ5MWhCU0xjcjAx?=
 =?utf-8?B?Vk44emlsNHROQnl0TVh0TG9VTjlqN1dSdmFsQjVDQXJWanNvajQxRzMzUG44?=
 =?utf-8?B?SEwvWWhNOW40N0dmOWhxSXh3Ujd3PT0=?=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 665a5e91-4c3f-4eb6-b508-08de04bf9aa8
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7628.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 10:03:31.6061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JfRrZvKxKDb1HGPeIzwimT3Mv/BUt5VjaheGilBNMwmd3dE/7ya89jJx/mAMhQdETFWdh6TqcQODVd4h9KVnfHQS6BirBUzPpbRL9cnSBn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9865
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

On 9/12/25 17:22, Frank Li wrote:
> On Fri, Sep 12, 2025 at 08:17:09AM +0200, Maud Spierings wrote:
>> Hi Frank,
>> Thanks for the review.
>>
>> On 9/11/25 17:33, Frank Li wrote:
>>> On Thu, Sep 11, 2025 at 09:53:18AM +0200, Maud Spierings via B4 Relay wrote:
>>>> From: Maud Spierings <maudspierings@gocontroll.com>
>>>>
>>>> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
>>>> with integrated boost controller.
>>>>
>>>> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
>>>> ---
>>>>    .../bindings/leds/backlight/maxim,max25014.yaml    | 81 ++++++++++++++++++++++
>>>>    MAINTAINERS                                        |  5 ++
>>>>    2 files changed, 86 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
>>>> new file mode 100644
>>>> index 0000000000000000000000000000000000000000..e113a2ad16aa74f982b9c2ea80578aed2d9424fe
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
>>>> @@ -0,0 +1,81 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Maxim max25014 backlight controller
>>>> +
>>>> +maintainers:
>>>> +  - Maud Spierings <maudspierings@gocontroll.com>
>>>> +
>>>> +allOf:
>>>> +  - $ref: common.yaml#
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - maxim,max25014
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  enable-gpios:
>>>> +    maxItems: 1
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  power-supply:
>>>> +    description: Regulator which controls the boost converter input rail.
>>>> +
>>>> +  pwms:
>>>> +    maxItems: 1
>>>> +
>>>> +  maxim,iset:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    maximum: 15
>>>> +    default: 11
>>>> +    description:
>>>> +      Value of the ISET register field. This controls the current scale of the
>>>> +      outputs, a higher number means more current.
>>>
>>> Use standard unit. Do not use register value directly.
>>
>> It is unfortunately not just a value in Amps, it depends on the hardware
>> design. There is a kind of "default" table with a 49.9K resistor, but
>> depending on that resistor the current is different.
> 
> You should calculate in your driver. if 49.9K is dependence, you should
> add xxx_ohm at dts.

I've tried to find the logic behind the Riref resistor and its 
values/effects, but there is no formula for it, there are example values 
for 49.9k and 40.2k, besides that all that is stated that the minimum 
allowed value is 27.5k and the maximum value is 83.5k.

Not sure how to continue after that, I cannot verify/approximate any 
relation with only two data points.
Kind regards,
Maud

