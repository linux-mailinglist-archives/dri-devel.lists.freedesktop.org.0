Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F83FCA81D9
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 16:12:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B084A10EB4F;
	Fri,  5 Dec 2025 15:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="Y6bMTCe8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11020105.outbound.protection.outlook.com [52.101.69.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8207B10EB4F
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 15:12:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ClW/unFJW8sAEJcus1CBoc09w6VpOaNV8Lmv/vA/S3HhkuHgUTU1dFJtR3ESmfW6kKF96WqWHQfqaBPRMwAcVcwU2sw1Ur6pBGnelDPBL69HhnC6lSUAcEvGL9xdEWKlUXkqk2dQXnbmRMZrMiW5QoqLruKpMI/zjtXGFRvgN8Vi4FIP75W/JfLf8xW/RovijfKPW7Bm9YRzMxpr6kfvPa/NNm0P3sYmLLvrY6SrPLknC0aXNx7L49b5O/JW0fRkR4sLuLDYvVhTYhNlAGA0BVgoZx6DO5VtNp438gkOkaYzmHRWKWpZAdMOCQdkhw3g6mor5tDnIsbCktGjAK/Pcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRq80T7+swUHBqMQ7sQd/Ybo5IDtiHbn/8dMMvocLoM=;
 b=LU5xMiPoPjEDDabXF1IB6heVcyq93vJkSG6oqKDof7dkupuOKApJHqg1FzIL0mo+a2MiJrBFStRsADtNeeOTIqh+OWVmIAKz+lbvgXAt65unVukKByLx1QjM9/ZWfD0y4QjEIz7pGl6DF2UG8f3WjiONpLC6PpLvGyJKCujkgNGwcY7g5Udp3y1g/BC/3zBqyJvzpzUFDDgPt5++xh/Z4QFvGDczeKRXzfDZlE+poGRMCbIaZOkTHMbRwBfJmOqX/DtZHDYuQv/oS/DdPl1AbJXOenvKdBYsqdrE4XduIDB79T2OByeOvnOwZW64WVSnnVe81kWoe2C+Pq37QmS3YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRq80T7+swUHBqMQ7sQd/Ybo5IDtiHbn/8dMMvocLoM=;
 b=Y6bMTCe8yTRg1IAWV6YGMIx2g7tzDJfoI9Yu+0KSYKsUEZWPb1wKPNnl2b6L4Xf7QQ8Z8eZ+bWPWYesx4DVnz3W24R554qolxIqDTT2SIWTHX85xNXAxcmTSAdC5n7UsWLH+AjIXomPBhjuiR4oxAUH9yIfOmwUVdgAwran4JSASPUdZVtM47RdeF6Foo1SflITTvjc1ZCR1rjVb19SIvPR8N4hJlhGgt5lkOoWZ+66Y+wJNX7Mi1oBUwI+8P+Rh1AeT/1cO1Dd0b1h/+6R0cQtiVh5J/ikPrNnWZS63I3WBAEKE5lvvrVtZ9YD4eAo5sy8u9aveyAkRqZwpk6Ch8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com (2603:10a6:20b:6f3::7)
 by PA2PR04MB10374.eurprd04.prod.outlook.com (2603:10a6:102:41e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 15:12:47 +0000
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::c39b:dab3:ae88:c5ba]) by AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::c39b:dab3:ae88:c5ba%4]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 15:12:47 +0000
Message-ID: <a290ab5f-c6e7-49df-98f4-6e809c58c625@gocontroll.com>
Date: Fri, 5 Dec 2025 16:12:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] dt-bindings: backlight: Add max25014 support
To: Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20251201-max25014-v6-0-88e3ac8112ff@gocontroll.com>
 <20251201-max25014-v6-1-88e3ac8112ff@gocontroll.com>
 <20251205150751.GA124954-robh@kernel.org>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <20251205150751.GA124954-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P192CA0027.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::17) To AMBPR04MB11741.eurprd04.prod.outlook.com
 (2603:10a6:20b:6f3::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB11741:EE_|PA2PR04MB10374:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c3aa908-9f49-4c0b-b2b7-08de3410bf00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|376014|7416014|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmZweXVCRTN6NDlNRzhTNHZBQkdNRUtwR0t0OWJnNEZ4b1BNb1pyZU5Za3h1?=
 =?utf-8?B?WFdvZ1JBWmFVajM1aGlRd3lZY1ZzajhFdWQvSy9YUjZ2YU5WcjZzMzdZdDZP?=
 =?utf-8?B?SG5keFlpbW0rL0tNZ1NzRlJnb1JhT1VRZDloeldFOWlGekdRdkxOcVBVRDVk?=
 =?utf-8?B?N01JSnZwNlJjbnQ3LzkvelFuL2lLdzd6U2QyUEIybFpqSUE5U1h3OGZOWmN4?=
 =?utf-8?B?K2NTMW5aOUJYcjUwWEdrbVd1aXhsRW5RR3o5SXB1dzVuNWl0VDZvWDhGekc1?=
 =?utf-8?B?TzV1WDhtZ1h3b25nVTJNQjBWTk5vWkhUZ3Q4SVg1bFd1eXdjc3hGTk5xREFl?=
 =?utf-8?B?OWNWUXdWSnV5bUplQmVqY0xUaDd5Z25uUEdOdFFyTWVUZDNsSUQ2b2E0T20w?=
 =?utf-8?B?cHdmVlZKL1RqdjdlRTBBc1ZVcVpHWTkvM2huYWdCNDE1dktacVNISlgvc2kz?=
 =?utf-8?B?TXNhR2c4U1UvakIzRVl2eHVETDFMbFhiZFdtL1FYd01tcWRneFJsLzdmZFhn?=
 =?utf-8?B?YXVtUFpaVVhYVmR0Z1NYTHBwTjVsTEZldmpIaktwZm5sbHBZTEw1NzVYZkRx?=
 =?utf-8?B?alYxclFnSU0rTFpZTzltZnFNQkJyU1JhM1JOd1FqMWFQbWJxMWMvWm5FMkJU?=
 =?utf-8?B?Z1pyUUpCNnRDaGZsMWlFMG9CUW9kMmNJcjd3aEVwRDRUQjZNLzhwQ3hiOTBN?=
 =?utf-8?B?bHlGUGszSEhCYk1Nb2tIR2JrWDhwbHNaMTV0WjVRSmsvMFpSV29Icno1eFR1?=
 =?utf-8?B?b052ekllVklKNmp2YURMTmpQc3pyMzc3NE1KRTMreXB6MmVKQ2ZhTlJoMTBS?=
 =?utf-8?B?V2RYd1pkWE5PUEx4ZkNLcW5iWVBkeDk5NTlyYnpnWjdVNnFRcDdwYzJ3RzU1?=
 =?utf-8?B?aG4rUkZYZ3o3KzV6RmdpSDBkV0lGZ3NGWjVsdC9mUkxmSGJDY2grRVptNldw?=
 =?utf-8?B?SU8yOEZQMXlZUlBZbGVXVzIxVWhnRHFwY0dhZFVnZEgzRjhEYlJjZURGYUJW?=
 =?utf-8?B?L29pTGhBY1N1UEduSDhONU1tVzhPK01na2FucW1DL0pVNmJwSVRlYjdjbVJl?=
 =?utf-8?B?R2tOL2x0RnA0RFllZjlnOTdlU0Q2S21PNGlqMTJabGxmY212bVVBTHQvbUhx?=
 =?utf-8?B?L2RObTRHNCswQVU2OXo5ZTRIY3VQY3ZvazBjVDQ3RWVsbjFBOEZnbWhuSUhJ?=
 =?utf-8?B?UHpSblg3VDgzWUhYT3RTUkt6Wjg0Y3h1c2Y3VTNpakdUZjBzbEl4WUl1akFI?=
 =?utf-8?B?d3BUQmFsMmVMTGFaOEI4M0VRUGtwc2gwaGVhOExTK2JlRzEyQVdOTkVuL3I3?=
 =?utf-8?B?bTU4aHNUc3dVQXREZUhaQW4vK3UrM1RlKy9haVh6SlM1YzBIYTdYamRwa1JQ?=
 =?utf-8?B?d29YK2ZUbm9kOWdCcE81aHlOQmlzZ2QvbExwTkwrcG1aNlVSZ1RlY3I3SHEr?=
 =?utf-8?B?eHhlVzVyalhJOUFCS2xZYTBSWEROQitsNG80ckI0T2tQaGUrNmxLMkMrVkFj?=
 =?utf-8?B?UTNOSFloOWRPdnBMWkIzRlB5SzFBd3FiRHhkWk1lMmF4YmVUcXdDS3pyaDZ5?=
 =?utf-8?B?K21rdXRlZ1NES2ppVThrLzdudDF3aVhTY2VWWXl6Z1liMFNadmt3dEFHcEpD?=
 =?utf-8?B?ZXhnck10dXQvNEkyQ3h1SVVicUQ2Z09uc29qdGlrY0diTHVVeEd1MEtiVkVR?=
 =?utf-8?B?dXNVazYzTDRpVEg1aklXMWVaNzZscmxSaXNQMloyeXFtZG8wVEFzZnVrclpz?=
 =?utf-8?B?Z2UxV2hkR3FpZVMyZitOQjRwSENtYlN0OGxhMUNrcGp0a1RuaUo1NWNhTFNP?=
 =?utf-8?B?RGo1eThXVkFUVjdrVUszdkhyK1QxaHRxMG9XMmNxVkNuV0FWcU1WWUFwQzdu?=
 =?utf-8?B?V3grcHRtRHZkQncycHRyZXZhd1FMQ2tJZW4wczZXbis2b0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AMBPR04MB11741.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(7416014)(366016); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UG9RN3crMUhzY1JnN2tUSFFnMFlJUEd0QWV5OWFQelhuTW5MbzlORkY4SGZv?=
 =?utf-8?B?MFZ0YkRhL3pkRHN0VzdGdTRia1FRWUhrTm5IeGZ5SjhsMHlGSkNUUW1RWEJZ?=
 =?utf-8?B?YUlLUnVGUGJtU3BEM1A2eTB3a0JKY0hPKzRuUkVTMkREaGhHVEZqejBKbFY1?=
 =?utf-8?B?bW9ISUZ0WlJwbVgrUzdRK0JrL3dWTHVRRndCajI3VzRNaVhKTGw2TmFCdS94?=
 =?utf-8?B?MDNGaDFJY0JyWC9UV2JhUCtEVjZibnFrM05XSHBOM1gxV0ZKem9uUU9FSGcy?=
 =?utf-8?B?b0tIejVFK0w2NVM2VDRxRTRhaU5zZzgxSUZidytSTi9nQkNMRmtnK05QZkFL?=
 =?utf-8?B?cTB1U0k4Uk5EYXBzbkhDMEVSanJITzl5Y0ZhdTNQVk44UU9nc2tKYXNYOG5k?=
 =?utf-8?B?K0RLWmwxYnVqakM5K28rclBHelhrTHpUamN6NU9SQkpqZ1ZDT0FacnB6USsr?=
 =?utf-8?B?U3QwbjQ5NWM4U3Y0Mld5K1VBVHBqYWlTaUNrWVF4WG54a085b1Nmb2hHKzNN?=
 =?utf-8?B?RDJpZkt1VkMwdTV1R1gyWUo1T1EzRnpMTy92ajBYa3VBQ1lnQzZyYTcrT1FW?=
 =?utf-8?B?ZXJzQ1l0WkpQdzdKMXJIMWNxZDUraWV5eks4TzVBTHhvK1lPNWN0cjNLMXVj?=
 =?utf-8?B?dktocUVOSXhOWVRxd1JRSFlnNEpoQ0tWTzRZZ3R3U0FWUEYySVM3bFVxeTQ3?=
 =?utf-8?B?Y3VZNDRPbjAvbzQ2QlRzQytXOFpSL2k0SUZZa0xuemlWSXYvM1VyU05ENFFp?=
 =?utf-8?B?S0pIYXJ1c3E3MGFlNlZpYVdVbnp5Nnh5aHV3OTRDdEVOdUpVeTNIc3lkWDVl?=
 =?utf-8?B?cEpya05rYXBiR3MzcUpadVZyVjlDbmh4YzZjVXlHeit2UWRvMEJtOEdQNHBl?=
 =?utf-8?B?dzJwc2gwYmc2VzAreUNReHI4bmNCUEIyeDk5VG9UQkE2MHhuNElsZVZrS3Yv?=
 =?utf-8?B?ZVBnczlJa3pKZzlXTlduNmlzaUxWdFUxd1c2c3hDNHdkcnc2aGxKVTlrbC9V?=
 =?utf-8?B?TFpKUEp2UWNWVEQ1VkQxTkxacmRBeVVtZkQrdTNnbUpZTUo3d3I3Q2k0OXYy?=
 =?utf-8?B?N25EK3ZveDNlbC85ckpGSGJJZTE1dmMyRFpsNFJCNE1VbXpwL2kzUysvdFRa?=
 =?utf-8?B?QnRZVHBpRlVkMjYyTmhlYVVFVUJJaGRLZjJqRjVNVWl4YVR5WGUzR0FMMmZ1?=
 =?utf-8?B?YUN0b1o1dGwzN3JRMEY3MWN2Zjh2WmovSE04VDlqVGo5QjVEZ2NWeGdVRlk0?=
 =?utf-8?B?OGQwSHJZMHNaYm44QVpiaFM0ajFYb3NmWkdYVytQcVYxc0t5eDEvSVFQTVhr?=
 =?utf-8?B?SmNOQlJCUi8yRm1vT3p6T3FQVThUUVJETm5CMXFQN21oSEZHbGh4YzRveno1?=
 =?utf-8?B?V2hGVVd3TzkvSXI5eS82V0l0SEVPQmFkWkpRNUwrUVpsNm1GNjMvenBvLzF4?=
 =?utf-8?B?TkV1VmttOFBrQVZSS25xbjZVaXdOdTJ1SXFqMFRRRDRKVlp4OHkyeHFxYUly?=
 =?utf-8?B?MWZSSzgyenRucVVScHpPRnZxZFYzaEwzeVFzK0dZV3Y5SVVOM1RNTkdJOHpR?=
 =?utf-8?B?a3dQbm4xUjdXQ2dBeHVqQnVIVTJISmJzQnYzYTJjS0ZGYmhqdWhrbGpvaHJn?=
 =?utf-8?B?Y3ZLcTRraktQMFpKMzd6bGk4STZCbHl2cjkwU2NCalA3VTkrK2E5RER0THpa?=
 =?utf-8?B?N1NHZ0x2NmN0dHRNWWgxTmdOZFdYclBmS243TzZFSFljUWd4SXIwYVkyU2FQ?=
 =?utf-8?B?RVBCLzRDaHZzOVVzYVdka0hOeExxZDZVV3o0MVVQTDJ1bnZQY2hGeFRrNEIz?=
 =?utf-8?B?MCs0c0R6Y09ISEsxc2V1QnRuVGdad01RZ0hQOFZ0OVgzRUNZdG1GT0w3azBw?=
 =?utf-8?B?Q1J0dWdyME00bXZhazZWa2JvUDVDalF1WEJhajJwNDUrdWlRdlEzSWZIaFlu?=
 =?utf-8?B?S2UvaExDN0ZDWEpYOUNCMUZsRFI1bkhhSW9ZUHpNQ1Z2Q1dIKy8wVnNRR2JL?=
 =?utf-8?B?Nk1aajN6WDF6cWo3dVBQaW1XbVg5b1RHUWl5QkJqWGZYSVRMYjRMVkFwRTJ4?=
 =?utf-8?B?U1orWUVMMlRQTWo3dWNQMG8xNVNHcTZaVFFiMk5sbDZZS2c3aXVoSlBvRDUx?=
 =?utf-8?B?ZTRFRVJ5bTNsdU45MkllYVY5amtWR1k0NFBVU3ZEK3M0Z296NU1hK0xIWElq?=
 =?utf-8?B?M2M5a2tRdUlrRkpkOHZWektxUGNSYUJ4TUt4eHZ3NUc3UUU2NjQxeWR6ditJ?=
 =?utf-8?B?Uzh6dkxPMGI3WUhWbXpzeThkU2ZBPT0=?=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c3aa908-9f49-4c0b-b2b7-08de3410bf00
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB11741.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 15:12:47.4912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VqStxux3deJtnFrcUa4cOz5nZGUDTviErXDVWJlARkWrAFEiED27iEjlcsBnYWDRxjF5TB5TcrenI5xHpK6x3RklXR9Fl2MxRh3kffXNyag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10374
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

Thanks for the review.

On 12/5/25 16:07, Rob Herring wrote:
> On Mon, Dec 01, 2025 at 12:53:20PM +0100, Maud Spierings wrote:
>> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
>> with integrated boost controller.
>>
>> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
>>
>> ---
>>
>> In the current implementation the control registers for channel 1,
>> control all channels. So only one led subnode with led-sources is
>> supported right now. If at some point the driver functionality is
>> expanded the bindings can be easily extended with it.
> 
> What's the relationship between the LEDs and backlight? It's a backlight
> plus LEDs or just 4 identical channels.

it is just 4 identical channels, represented as leds, or in this case 1 
led. I still feel a bit weird about this representation when there is 
also led-backlight. But it was requested to map it in this way.

>>
>> ---
>>   .../bindings/leds/backlight/maxim,max25014.yaml    | 107 +++++++++++++++++++++
>>   MAINTAINERS                                        |   5 +
>>   2 files changed, 112 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
>> new file mode 100644
>> index 000000000000..e83723224b07
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
>> @@ -0,0 +1,107 @@
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
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - maxim,max25014
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
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
>> +    maximum: 15
>> +    default: 11
>> +    description:
>> +      Value of the ISET field in the ISET register. This controls the current
>> +      scale of the outputs, a higher number means more current.
> 
> We have properties for setting the current (in uA). That can't work
> here?

please refer to [1] and [2].

Link: 
https://lore.kernel.org/all/5c5cf363-db5c-4d0b-902f-97c6ef06c08f@gocontroll.com/ 
[1]

Link: 
https://lore.kernel.org/all/20251009-overjoyed-unpopular-54f69e9bd82c@spud/ 
[2]

kind regards,
Maud


