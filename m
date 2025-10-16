Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7EBBE1BEA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 08:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE8010E95E;
	Thu, 16 Oct 2025 06:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="jIdgQB0Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013045.outbound.protection.outlook.com
 [40.107.162.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D0110E95F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 06:33:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fAeQEHukRKEcH/+27cVCOi8ihLRUUDKPV63FjFjuE3N+Pj5MOkaoXPYnO9BBuyKMHMqI5MtP4WW3J73lqQXcoIS4lhu8tSPeB0+tmFctp+m9f65B3vUbHNf7aQkaClZrAEKJ9A1DxsfS7sjMDcfSPulvfcuIk9V7U1vSH2Wvhpn6L99YMASF3A8JCp/kP3sA7lPl/1Frfzz+UuN/Xd6zj7rm9j4zLI3m1ORJD3BmG/GoQ9Klc2cSXg/CloYT8msDffDErC4D35dajPYo+45Vm4NTKrODUmTz/m0KuL5n6wlPCFvsD7VCnkt4agX2pBHbRo5D77POZqR8FyOlBL6+Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTXXlP3QIRYMAKI1fdpP+lKIhFDFQ+qnBBWBxQuAtLc=;
 b=kvosHxsr9N+R7iVT/eK7RVqtLHfwKRU3uC3JCzCF2KH7vRyedqUvUt0dTU3BtiRTUWp0M7gu5Ajbq+jZMhYY1VaZ+YSoSzlklxCq4hjBKffiM7AZ0dmjvcRhxrnWOypdOilE71M5Wn1why/7W0BxWVXLOUsvUMOJoH2M4YakyrE6ZPqEXmVE8SdcYlhFyU/YftXR/oQHeueR9Wy6Oe5Nnc9S6+L7eDZRE7JQodlIJgPKB5+mKx6I+MYqjxBP/kh6tM1uDbA7Dt3v7L4Fvov/3h2XX0A2koF2JuMRYEe17l3jfefNdHjmSukNZjDWy7LnuiHM0f+c64HU8oQ7qu3aOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTXXlP3QIRYMAKI1fdpP+lKIhFDFQ+qnBBWBxQuAtLc=;
 b=jIdgQB0YjpFgFz/YK4Z6DmKypKZx9akGej5FC8AJUj1XhSYFuC7Pg6y0ZD/NI975g6aT3iPnWQ0vU0JTk/mGxGc3szlTHsRFGd7Shc32cmeFngUdoGzgBgcxRw4nmHAX809LhHUzW0N0UQxNBTc5lubsj5DavBYSM6ySn6k4a+WrD8+Qno2ZcT6O2oJdKAyshLWv2sLyz9CC/J0ls0Vv/BZIfP6BDsOLC6k2ycd6Zxay8qQRFHzQwuPszoIbonCI24Scw80AB7ZpN5GK3fT5yiRN03JPfnEPStRA6zpmunv7ElnHkHwONcuDRXoM9+InaAMPlUBj7M3EjrQwxSZ1NQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBAPR04MB7270.eurprd04.prod.outlook.com (2603:10a6:10:1af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 06:33:50 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 06:33:50 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Thu, 16 Oct 2025 14:32:31 +0800
Subject: [PATCH v4 13/14] drm/imx: dc-fu: Get DPR channel
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-imx8-dc-prefetch-v4-13-dfda347cb3c5@nxp.com>
References: <20251016-imx8-dc-prefetch-v4-0-dfda347cb3c5@nxp.com>
In-Reply-To: <20251016-imx8-dc-prefetch-v4-0-dfda347cb3c5@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@mailbox.org>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR02CA0133.apcprd02.prod.outlook.com
 (2603:1096:4:188::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBAPR04MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: 79014f62-4124-42f0-185c-08de0c7df654
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|1800799024|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3RnVFJQZE8vN3BzT2x2Zi9ZWDNoWjV2bjRjd1Y4cjZULzZFTlpoQVNWWjM0?=
 =?utf-8?B?SFdnMFlHRzZNWko4T2tZbmh5N0VsSkNJbHZoZldpcmVkTnRaRFQ0TVFRQ2NO?=
 =?utf-8?B?NTdmL05NMTk0bTlzTktaMmRxc2lKb3M3bWZKRFFuSG1YWjZGbEUvZUdWWGRX?=
 =?utf-8?B?bG16SkNlYVUveGc4bUNxYTUyRzlkdjFiVXE0UDJTQzJEVGNib2p6R3NveE5x?=
 =?utf-8?B?Tkh4emxUTTFBaXhSVXFZS1Q5M0dTMkl3SHVwcXhBNElBeTNvRnpKT0lMU0lm?=
 =?utf-8?B?TDA5enZqR3JtaHNiLyt5NWZwWHhXTTdaaFd1c3RQdEQ3OGZxVmZwakRSUE9T?=
 =?utf-8?B?T1hEZEtTc1dzRDVESm1lVk5RMjJrc2xWOVZtdi9QNlNsaG4wdHo0TkNKbEVM?=
 =?utf-8?B?V2JOM3RlUGtSSGtTNWtFRVB0Sk9BM1pkTk1UbllSMW5nc2MyVVgrQTNBb3B6?=
 =?utf-8?B?dFNBUVk3SHZFU0thdEZ1Z3JkUC8wZmhqNGdsYmErRG8zZXVsNTI3WmhRenZP?=
 =?utf-8?B?Z1VsN1RvbEVDUUNyYTBZRlFhRnZmZGRKM054N0laM0J5Z25LbXFjU2lmNmQ3?=
 =?utf-8?B?UlNnZjNMWWxEc3l2SC9iTVZJZ3JYZVJvSE1tL2hYbG14MVZWVmpXUmtwVzhN?=
 =?utf-8?B?cVZTdU84ajBhU0t6b3BheFBkbDNVY3l2Tm02bkRhbGt6V0NnczcwamJSTnpV?=
 =?utf-8?B?K2d3Yi8zUTk2VDhSWUhrT1lsU3BlUnZZZkNpdlNycm9scUt2bnZMZnhHY3pk?=
 =?utf-8?B?K0hGaWo3dFd2a0R3dG94ZGdYaFhKOW1sMFRDMVJZQThyUSs0QXV0VHQ3dzRp?=
 =?utf-8?B?c0VrWTBjWlJHMWRvZ3VhWGlPQW5HNXZaQ0h5SkdxTDhwUWpRZXlaQjVwQjlD?=
 =?utf-8?B?QVZUOHJLM0UzdG5ZMXpmNW5RMUJOdG1FbXcrN0lodXZ5N2NJejl6QlF3dUlw?=
 =?utf-8?B?RVJlbXgwK25DdUZWQlRkSGFCWFdjVFNBZ05MKzFoZE05a2duWlNrZkdRU0o3?=
 =?utf-8?B?VEYrSVA3bnJzRWFQaFFDYk1aaDRMcVgzUGhmcnBsZHNHKzNJSnBFeklwcnBF?=
 =?utf-8?B?SzJiZDdkbk5qbEtmSHRqMGZheUZ3UmVjTUlPSEhab3RWd0MvRTRHQ0wzSkxY?=
 =?utf-8?B?M3lMbms4MjZwZzJhUTVkWG5zRldjTVEvemZtMGJLZE9LUmI5Z0UxazlsSWJU?=
 =?utf-8?B?UUlBLzV2QWJnUVUzQTM3RnlFbG9JSXJIUE9xNFFlODc3ZEFKZjZOK29UaXlL?=
 =?utf-8?B?Mk9iQnRURTJZa1VGSUdqRFdzZmhqMW5JRURZblgzdWJSbGROQ1d2WisvSVlr?=
 =?utf-8?B?UFRJdFRnazh5RkIxTDJqaUxxR2MxVkVTTGVrK2NXcWNSNHJDc3RHcFZjNFEw?=
 =?utf-8?B?eUsvRGNXaGVwM1grVzMvRTMwUGUzTGtHZm9mbXhsU1B1Um5rQ3FKS2ZCTkJG?=
 =?utf-8?B?S0VhZmJjY29sMmduRlAwbVlVYTgybGN5Si92akhjN1dPbGRiT2RhV0picGJi?=
 =?utf-8?B?dzNaalBwZFlibEdtcWhQZDZacGlDOGRVRFl5QjVWU3dMMEtETThsRGorWmQv?=
 =?utf-8?B?bmpXcFh5ZUQ5a3BQNTJrUXR5UGFiZUl4aFN0R1VVT2M2N2pTR2JRRWYrNHZE?=
 =?utf-8?B?ampXSStHak5mR05XYWdHdnV6N1NuclVISXhJQ2hhVHREcG44N2lOSUVsc3Bh?=
 =?utf-8?B?dE1zZGo5TmJvdXArVzNjeDNaZytQY1FNN2hYWDdsOGhQNkltbmVMVi9OMHh3?=
 =?utf-8?B?My8wRmVIdVF4RnhXa25RSCtpd0I0UWFQWFpPSVk4M2FueTVQZ25iK0lCZ2xk?=
 =?utf-8?B?di9iS084dExiNStOYzBsRjUzUGxTMEdjRGc3T0MzYURqWXpuRVArR2VNYklI?=
 =?utf-8?B?bGhQbmJXVlU5aUR3c2ZjYnBJeE1XemVNcVd0cDZMS2J3aEZQVkt0NmdIMlhU?=
 =?utf-8?B?SGs4bUdKV0dJUzcxL1VqOHVLSUViTjhBWmFBdVJjT1UydEZDMUJtNktVZTBs?=
 =?utf-8?B?bVRucUpBR2VMTTRGZWNwU3E5cWtOOGZEZE85Vm9CaGdzaFpBNXJnYWM4aHdR?=
 =?utf-8?B?NGxDa3NFSWhPR0x5YjVsZ09oRE5FVDRIbkZyUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(19092799006)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YklNa2xheVpIMkZ6dEJqUUd6RWNMVlR0bHprdm0zQWVwS3JPZGRBanJleU40?=
 =?utf-8?B?U3FJeUN3bnFSUjNnR1FmOWRZWkc2THQ0MFl3Mk4yYnB5T1JSL1dKeWZ0TllB?=
 =?utf-8?B?c1cxODBzU1U5eEN4RitEeDN2U3oxVmQ5NGNkejVhV21OMGdGam12RklRV1Ja?=
 =?utf-8?B?MDE4ZzR0V2RqUkJ4bHR6K215YzNLSmdaZjAvV2FzNUFTbHhtanZscURmMnBV?=
 =?utf-8?B?em5xdzRXOGt2VU1nenNVMlhWUEtGYVFRZXpFWU8rSkFLL0pYVHVXZkhqTTVt?=
 =?utf-8?B?Z0ZwMTFXNGJqTG5QMFlIYVI1Yk9zcllOYTQ1TEhQclE4YXNKT0QvSFNVODVH?=
 =?utf-8?B?ekZJSXRvS01PaEg2N2ZnRlRvV0JMcU9KNnZXMW5aRkNDSGdLTkQ5WDZTcGF5?=
 =?utf-8?B?MVgyVGpMaURuWVpUSElHcFA2SHd4azlBbEpYV1R1UEFLelJlWVR3aWNBL1Rx?=
 =?utf-8?B?L1NEUTZHYW5LeGxzSjIxL2lhTGo3SWFiYisyS0tlUllaMUZ5SG1ZVy9YZGFI?=
 =?utf-8?B?TG9RWlRhb21hbUxuZVMzS0EwRUYrSmpCSHZ1SUR1QnBzcE5aVDAyMmhoa3VJ?=
 =?utf-8?B?RlMvT1F4MUl6TE1xU2FvNnI2NCtOeUU5T094MG8yOWdjcGVZVTd2WW56Tlh2?=
 =?utf-8?B?K1RzNEVMQWlvbGVLa1lJZXQ2QzJkUWhyZGllQ3RpaDdMWEdLL00rVmtvcHpJ?=
 =?utf-8?B?akI2Z2xldFhYSkVaeVlXaUJYWUJXUXFtbW1nZDN3NVBGZjh5SXhoOWNLVWw4?=
 =?utf-8?B?Q0thNS8yVWp4RmhyOEh3OFJLOHpJNHMzdy9YdmtLQ1NHMzRxdEY1ZS9mcUNn?=
 =?utf-8?B?SXNIanY3bDNXSkdvQ1p1VTIxU2FLZVZCdkt6Vk8rS3JFNDhLa1U1eWYya28z?=
 =?utf-8?B?cFhGU2lIcE5FRThRQVBBMW1aenpQZkpHZURWdWRVcExYQVpBU3BOR0ZiTVNI?=
 =?utf-8?B?bXp0d3hXSDZ6VEhJeHZHeDI3V0lHRGo1N3o2eFc4N1N2TStPUGhaUWxqdGhV?=
 =?utf-8?B?dElSQVVlMTlBSVVrWUUrbmxxSGNySm1BSUlnMmN5VkljRDZNVnh4cUZldXBz?=
 =?utf-8?B?dUlwbHFVMkNHWW4zMFJUU3VMbDZzazhVSXEwdklHM0Q1a0NReGp0NUhIM3hJ?=
 =?utf-8?B?QXdaTUVybm5ucWo0alRxUHNwWDFGYVVTWXFuRFlEZTE4TEVGWE1LSCt3aHVp?=
 =?utf-8?B?RVJ0UGxweHFLaUFLMjJhb1B2N09EQXllRTltb2JTSU5PM2FDQTRmVUdpZmtm?=
 =?utf-8?B?QkJUVUFLM010dVI0a3phUTJLczRMcVdmMFpIWDRlM0w3cFdCQmhtY29QMlpk?=
 =?utf-8?B?TEhKNmxKU0g4cHhqOEQ2OG9nWXROOGlZL1VoamlsSlBuL05TWUdockhvT1ZW?=
 =?utf-8?B?TWhjYUtZRXhCc1V2a0RrclUyZ2VPZi9Obk16M2dLdEppdDVaV1VPcmJuQzRk?=
 =?utf-8?B?TUQwYUQwd3dReWVjM1hBajFCcTRCTkhOMXJsZkNUMDFSTFYxOXMrcU4zR09Y?=
 =?utf-8?B?M1FtSGR2dWU2MVlrQzlEODF5eXhpNnJXK0ViZW1aNE5wbVZnSEJ5U1ZKYlFW?=
 =?utf-8?B?TFNkaVhXL2tSQ1VxTFNmSXcxYnExZ0JtaURaRkNvVWRidFhVcVNJaElseklB?=
 =?utf-8?B?TW41dmJIVmFpV3lMeGc2VllWQmRGZjV4UURNZGF4aUxzZEZoTEEycnYrSmFZ?=
 =?utf-8?B?S0Y3bFp5eWdMT2kyVExvcm1xQWdYakFLNHE4UTUzVnNwcGZLN0NvUTRhUFZB?=
 =?utf-8?B?WXRyU2pkcWU1WTU0L08vdWNabXJZNkNwUlVWclo1RG1DZVRER3N0a2RjcWo4?=
 =?utf-8?B?R3RjdlRzNzJuQlpMODhKNkp3STl6UEJLOE92RFZST25rcWJLcHdvd0kxbFRU?=
 =?utf-8?B?L2VRZitsS21oNk1SM3NHclg2NWtqeDRiMmV1ZEFEU1ZaSkNPYjJib0RPUzQ5?=
 =?utf-8?B?QjNzRjA2UklEamIvdm44M0NSWll3M1p6S0xjS2NOamZOVlQ4blg4OS9ON3NR?=
 =?utf-8?B?OGFsVGRxeTBvRmpFWFpjOUk0c013eU5wQW5mK2F5ZU1SN3hMUUxwL211dXRo?=
 =?utf-8?B?c3BieXlDc2Qza0dKLzlMT2tYMTVYYXN5aDR6M256dUhGYmlXWjdCYzQraXcy?=
 =?utf-8?Q?RxwihOslcRffUh3kZZk2ezkdl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79014f62-4124-42f0-185c-08de0c7df654
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 06:33:50.3441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 099bg2LqLMFVv3K4pQOFiLb9Dpj12Wglk21/RsstyJXOJBlJa4SjXgJF6OPkdU/sICSEm/zr4yFrLg5HEGhgvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7270
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

Add a helper dc_fu_get_dprc() to get DPR channel for FetchUnit.
And, call it from dc_{fl,fw)_bind() to get DPR channels for
FetchLayer and FetchWarp.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
- Collect Frank's R-b tag.
---
 drivers/gpu/drm/imx/dc/dc-fl.c |  7 ++++++-
 drivers/gpu/drm/imx/dc/dc-fu.c | 18 ++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-fu.h |  5 +++++
 drivers/gpu/drm/imx/dc/dc-fw.c |  7 ++++++-
 4 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-fl.c b/drivers/gpu/drm/imx/dc/dc-fl.c
index 3ce24c72aa13e8aa150c0152a5a1ea3d0fa90b7e..a1835f43da0dc5cf0c83d93f16658b485011e285 100644
--- a/drivers/gpu/drm/imx/dc/dc-fl.c
+++ b/drivers/gpu/drm/imx/dc/dc-fl.c
@@ -101,13 +101,18 @@ static int dc_fl_bind(struct device *dev, struct device *master, void *data)
 	void __iomem *base_cfg;
 	struct dc_fl *fl;
 	struct dc_fu *fu;
-	int i, id;
+	int ret, i, id;
 
 	fl = devm_kzalloc(dev, sizeof(*fl), GFP_KERNEL);
 	if (!fl)
 		return -ENOMEM;
 
 	fu = &fl->fu;
+	fu->dev = dev;
+
+	ret = dc_fu_get_dprc(fu);
+	if (ret)
+		return ret;
 
 	res_pec = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
index 2e197b3344bd12491c1f7bab0e5304190ed84356..8339f44c0091918c796c478d968e0640391781d9 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.c
+++ b/drivers/gpu/drm/imx/dc/dc-fu.c
@@ -10,6 +10,7 @@
 
 #include "dc-fu.h"
 #include "dc-pe.h"
+#include "dc-prg.h"
 
 /* STATICCONTROL */
 #define SHDLDREQSTICKY_MASK		GENMASK(31, 24)
@@ -256,3 +257,20 @@ void dc_fu_common_hw_init(struct dc_fu *fu)
 		dc_fu_set_pixel_blend_mode(fu, i);
 	}
 }
+
+int dc_fu_get_dprc(struct dc_fu *fu)
+{
+	struct dc_prg *prg;
+
+	prg = dc_prg_lookup_by_phandle(fu->dev, "fsl,prg", 0);
+	if (!prg)
+		return dev_err_probe(fu->dev, -EPROBE_DEFER,
+				     "failed to lookup PRG\n");
+
+	fu->dprc = dc_prg_get_dprc(prg);
+	if (!fu->dprc)
+		return dev_err_probe(fu->dev, -EPROBE_DEFER,
+				     "failed to get DPR channel\n");
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.h b/drivers/gpu/drm/imx/dc/dc-fu.h
index cc93317e300134a0f8c378a155fb7c67dc6689d5..9fbd7aadd26426d797e89a954e7e4cfa3e597b62 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.h
+++ b/drivers/gpu/drm/imx/dc/dc-fu.h
@@ -8,11 +8,13 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/device.h>
 #include <linux/regmap.h>
 #include <linux/types.h>
 
 #include <drm/drm_fourcc.h>
 
+#include "dc-dprc.h"
 #include "dc-pe.h"
 
 #define FRAC_OFFSET			0x28
@@ -99,6 +101,7 @@ struct dc_fu_ops {
 };
 
 struct dc_fu {
+	struct device *dev;
 	struct regmap *reg_pec;
 	struct regmap *reg_cfg;
 	char name[21];
@@ -114,6 +117,7 @@ struct dc_fu {
 	enum dc_link_id link_id;
 	struct dc_fu_ops ops;
 	struct dc_lb *lb;
+	struct dc_dprc *dprc;
 };
 
 extern const struct dc_fu_ops dc_fu_common_ops;
@@ -123,6 +127,7 @@ void dc_fu_get_pixel_format_shifts(struct dc_fu *fu, u32 format, u32 *shifts);
 void dc_fu_shdldreq_sticky(struct dc_fu *fu, u8 layer_mask);
 void dc_fu_set_src_bpp(struct dc_fu *fu, enum dc_fu_frac frac, unsigned int bpp);
 void dc_fu_common_hw_init(struct dc_fu *fu);
+int dc_fu_get_dprc(struct dc_fu *fu);
 
 const struct dc_fu_ops *dc_fu_get_ops(struct dc_fu *fu);
 
diff --git a/drivers/gpu/drm/imx/dc/dc-fw.c b/drivers/gpu/drm/imx/dc/dc-fw.c
index acb2d4d9e2ecd6d36dbab050f25b560d9ec9aba5..c2e60741bc871c6976ead53f132b60f19352aab3 100644
--- a/drivers/gpu/drm/imx/dc/dc-fw.c
+++ b/drivers/gpu/drm/imx/dc/dc-fw.c
@@ -131,13 +131,18 @@ static int dc_fw_bind(struct device *dev, struct device *master, void *data)
 	void __iomem *base_cfg;
 	struct dc_fw *fw;
 	struct dc_fu *fu;
-	int i, id;
+	int ret, i, id;
 
 	fw = devm_kzalloc(dev, sizeof(*fw), GFP_KERNEL);
 	if (!fw)
 		return -ENOMEM;
 
 	fu = &fw->fu;
+	fu->dev = dev;
+
+	ret = dc_fu_get_dprc(fu);
+	if (ret)
+		return ret;
 
 	base_pec = devm_platform_get_and_ioremap_resource(pdev, 0, &res_pec);
 	if (IS_ERR(base_pec))

-- 
2.34.1

