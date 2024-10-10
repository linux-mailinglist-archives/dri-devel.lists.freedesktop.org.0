Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E33E6998BF4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 17:43:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E62910E09E;
	Thu, 10 Oct 2024 15:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="EDZ/iEVj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011053.outbound.protection.outlook.com [52.101.70.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C5210E09E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 15:43:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uveLPavOfDZvrF1sKY2m2x4S1CYI+8WMdb/TFGPzIBpKtmnG+SNDhVR78UwOktCvfbQbK3224buDGT2dHZ2qNnbQuq245Bf9gRhPt3JA/egQxTB1RdZuH9MifSuZJhT0Od2Ki1+vir1qeWOgpP/Wz2MJZQvda3is6UrVtGc2vQ6ZtZqfsKtuLR8d7pYqDriAliLo7/qEJJQ+faR8lkFUf723qlv3rE+sZkKsnl3JTK5IfwF3ExnyIuJRQQDtWhx7ZitDI6bNXbFWMQ+gqdFhvN1zA84eauJEs8YM4HKFE6GAC7E/BlHPr/QYNJIKnztwnfyGxLyW51zPnGUD+Vh9nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dxZLTMsAQgpSVMP9SAo++4i38SdUNkCpzYp1SN2q2eA=;
 b=lonB5cvTSZWqiJbOEnw7mUwPOOsZkXrqxKsAgEzBkPw1l+4od2OND/hHmpwAfdQcwRntgoCd7+Hvoxdfe7Qo7hOjUqN3aWIu5pQtfSh1bVjljK5WpABAvvPev9nTzH0kZSIw2jRDH1SNxFKBiBwgXQqqqzZY27Acz4hxr6UnoTwOGl9er2ZjFINBxTQfNyz1b18pIXCVMtKfmvfM9Ka+3W4B5mbHij+HfdxbqYotvGcHP1QAgG0CJKlUpKekqgQ8kTsZMmT5WGSQbr1M2tI+VqJ5GaQ+J8BFV1K3UWl93tQOYWbf+exWp/P29n25z3Zon+3h7caSE7H5sFEHD42XHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxZLTMsAQgpSVMP9SAo++4i38SdUNkCpzYp1SN2q2eA=;
 b=EDZ/iEVjK2sdYiYViYy1ybz6WB3mKGpG2RXhRF9AxqU72QtntMJ1ft8LdGANXEaA0RFcNqQruZbm5svmOQf+9c5zLF4RCT1iTP/xzSrDCaFqysuxCWtXT3N/+3ovgYLUq13QeY+Wsv6X0ME8/GN6e4h3+e0x6tPv/iniQnII6r++b2H3gAO/b0oc1PKVGaB/IxL5eIcep67mF3RttrzLvjUi2on0EBerXFaOQhBxb46vs+6HkvNvi3hi67vIQBOiOR1HVN2ZievM9m2YWbTbRD7hxKk0HsVoFSys5SifsLS+9pCB3TlbKlejqoS4iWqcfPf5it05uCpnxO8t96ZoSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB8984.eurprd04.prod.outlook.com (2603:10a6:10:2e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 15:43:23 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 15:43:23 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 10 Oct 2024 11:42:38 -0400
Subject: [PATCH v2 1/5] dt-bindings: input: convert
 zii,rave-sp-pwrbutton.txt to yaml
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-zii_yaml-v2-1-0ab730607422@nxp.com>
References: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
In-Reply-To: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-leds@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728574994; l=2670;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=bnY+JrZXt7Ym6xS8UnWC7Kbe0qgMno5ut/zvwG6v+mI=;
 b=+U22YV7fRjbkZ9C9UgZXFKda8sny9POxr4awEVA72FthZxS/we+wRhzrHWUD8LmqYTmbA+X/3
 PSAjfI0F5e+ATj2wRpeaoaO7x8KFxW+QtqEsqKjyMFuIX7RetFFYOSy
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ2PR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:a03:505::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB8984:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a66bd2b-7281-4a01-65a2-08dce9424606
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dkxaT2V5MS9MdnZOY0lqOHdqL2M4REpRcmczL0RCTkMyRC9iVWpaSi95T0Vl?=
 =?utf-8?B?M0ZKV1RhM3JNc0lLa0V6a2lXc0EvcndFNWxTYlUvdThxSWozTVo3d2lCdkVh?=
 =?utf-8?B?K2kyaTlaeklRTTZ4UWlJc2tGUytaU2lDeDJQSm5sNktFTW9kWWZLdENySWIr?=
 =?utf-8?B?bVFPVlpuRjNtZmJWKzFsVmQ2OWZvbHZOd2xmZjZxTEtDR2RHVkQ4Um00ZzYy?=
 =?utf-8?B?ZHVMWkRSVGNiUHFhZjZ4NzliV3ZsYnFDWGtKT0NuZDdIMHQ1cUNyRENoVlA2?=
 =?utf-8?B?RTJNdWhYWUlHR3QzVzJtQjFLRXJrNXM2Wi8xSXlHUzVJWkZtM21PVGVISm1l?=
 =?utf-8?B?cjdmcmtlV3JRanB2WTZPdmYyWVlQTDdwRzBvR3dUbkhBYmRGYmd4Y2VTbFlk?=
 =?utf-8?B?T0grUVNGREVyMm5uRFRnWVFPclY4cTROYWZPNmVERVNhaW5kMVJiNjA0cWUz?=
 =?utf-8?B?d3VsOHdFM0twQnEwM2hMNnVQYWp2ejZKZU5iWTc3OVBkL0pQRThFM1JLcnVT?=
 =?utf-8?B?c0V3bEJGV2cvenVBeHhMVVg3SkVEWkJOdnNUTFNnME1LVmJpdThEcmFRUDNR?=
 =?utf-8?B?Z2ZaUlRjeXNmWi9oSE9teit0R1lJVHpjczFjVmMxbjY3UkNhTUVubE5nUW9l?=
 =?utf-8?B?cUplWGo0T0J5aEVmWkNiUnJheXgrMkpydHIrWFZnYzBtTk5TU2lpVEVmcTdY?=
 =?utf-8?B?Zkl1cTFqeWpFd3JBcmJydUpsKzJIUVRieThNUjVhemsvTHA5TGNzNm1UNE0w?=
 =?utf-8?B?bHBKV1I0bk1MbEFVYWtLTXZWVkhQOG9EZXhDb2lwN1VlaGdhaDZFc2hjNkNL?=
 =?utf-8?B?cnFGWDArQ2F5VG9Ma05EZFFFV0RmZU44VzRLMEcvNUtqNStqK2VxSEFLYTMx?=
 =?utf-8?B?U3VaOFBWOCtCWVhEUmtPaFh6a2tQdktJaHkvMXBPS0NDR1pSNEFqTlBtcm1H?=
 =?utf-8?B?U1d6N0pISnlacjJ1ZVlVbjltazRBZURCOWwvWWxUQVNvR2JTanNacEVwUVc3?=
 =?utf-8?B?QkRudzdEdENIUHNkNVkvNEtLNDgvNXhiRDZEbkJkTUpIOFFwK0pWQXkzNmdE?=
 =?utf-8?B?cXJrWm03R2hFOHZRRkNFeGw3YVkxdk1NdkZZYzRVcE9oWC9rV2MyZHJRNmxr?=
 =?utf-8?B?WWJtTkFMekxjaFBtYTBVcThmN0JvbVlSdEJHclBGQzlueFZ3ZTN2Z3FIcTdk?=
 =?utf-8?B?Q243NmlRc3FkSm5xYkZtSjNwZTBTclNGNVNWRUt2NUZQVkJnVlByQU95VEVG?=
 =?utf-8?B?SGsxcGsvT0luTVllbXJpODQxTkhxQmdnbnUvLzFVZkVPRTk2TkpORlhqWmxa?=
 =?utf-8?B?UXdhUm40OGVFbEpUWGFDRDc5V0dVQmF2Z095Qkt1MW1jRnVDdnovbXV0eVVZ?=
 =?utf-8?B?TnVBaUdOY2hwVFhaclQ1OGpTNmJ4U0h1ckZvazJDc3kxdFRvdXZSVGFwbU5l?=
 =?utf-8?B?Um9CbmZNakl4ZG9XNW1Sa25VSlNKcDZHTzh2ZmNLeW5WaTEzM2hNZVM1Um52?=
 =?utf-8?B?VjIyWDZSOEgxN21xTUxoczF3VEpWdzVkWTl3UW1JWlZ2MnM2Z0ZWeDhjajJK?=
 =?utf-8?B?azluQkphdlIvSXhMbWZ5VlF2Z0R0b2dLSnFQZk5ZemJBaHRCSG95eWRPWm9G?=
 =?utf-8?B?ZTJJV1pURHRmeGl2dWZBakFTUTd6bWZCeTFkZnJHdkRpSkFzTlhkMmNQRmh6?=
 =?utf-8?B?cVBBeDFvQllOM0tYSWdCM2JrRnRwSHlRYUszblNKM3A0bmE1cXpFYkgzb0cx?=
 =?utf-8?Q?hXH9XxUpgTMWKyMCxU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckt3emxDT0ZsQXBEcHhIQjI4RkJPbUF4VHNBMS84WkZOSC9YVUk1dXVvVFZB?=
 =?utf-8?B?dS8rV3l1dTk3YUhFa20wMTdwMWUzQllRRkFqRkh2RlhtT2N0clNmTURKVlhu?=
 =?utf-8?B?OWp5RHE2UCtCRlJpekFXU0RoalhFMDNWQlNIaXBsa1F2dVhzN1hXSXZRYmJV?=
 =?utf-8?B?YmZHNGhXazZ6Nmp2Q2lNcXlOa2lTUlRybFBiaDk2TlBFU2l5ci9zYVFwUmEr?=
 =?utf-8?B?dGF4UkJseW05OXVRVmRQWFZzK3EyY1g1VDJwd0JLV2RQbFdMdmpLTFZhbUtN?=
 =?utf-8?B?Yk1EQ0tadFI1bEhzQTQ5TERXbVUrVFBMbC9jRld1RUpGZWNBMVo1aXd6M3J1?=
 =?utf-8?B?OHRhek9aaEY0dXJzb0Foa2RkNklzcTZYUERjL1ZWeGg5b3Jxc05uS3RoelEw?=
 =?utf-8?B?U0dpc0tzMTFsL0pvSzVCakRwSFA3YjBJVzNManlqTkhFaXhtYkpjWGE1UHhX?=
 =?utf-8?B?RWNoY0hxQ2I0WG05UUpzM3VXRGZVNDBTUHRSamZXUnVlYjRDZG1mUWhGR2wv?=
 =?utf-8?B?MFFGejBtaEFSRlNpTURUaDgxMzBKa0hyb3hBYU1GQ3YvL3hKS0o2K1hZOEtB?=
 =?utf-8?B?YW5lNEFBSThtazRwbHFZRUoyaXVSNUtvVjR2SDlocUNKSUdXZWo1UFRaU0RY?=
 =?utf-8?B?VmFCTTRRdVF1TTYxMHUzai9ReFlaL0d2dlQ4RWdyT0kyUUhYamJ1NGdFb3g0?=
 =?utf-8?B?cWljcnJPRGs5ZEpWekV0VnMrL2lYbDJETmZUSzZmNi9JTUl0REVLZXlKSFNj?=
 =?utf-8?B?OVBJS3JSa1NwZDNWMXgzTVgvL1pVTjhYd2VBYXhnemhkei9ZaFJza2NqQWtN?=
 =?utf-8?B?eGZtK3ZFVHVMSkxwb01ZeFhuNyt5TDFyOWNtRVdOTzltcmM3MnhOZ0N1TExz?=
 =?utf-8?B?bjhBK0FBOE1JdXIrN2NVaDh5MzNRRHg1ZzhZeEVabWdDeEtadFJhcTFqRFBX?=
 =?utf-8?B?RjZhWHFsUVdCdXNFS0luLzVSbEx3elpWZ2R1aVNkMmNocWpCb1RGRGYvcWUw?=
 =?utf-8?B?Rlp5MUdpS2pCbFE0c2NoUU1ZdFRkb0VpbkE0WjF1aSt6L0U3cWpmNWlJek14?=
 =?utf-8?B?Z0FUbFVyZDVtRDd1SmpCbjdPMlUzeWhvTHBZTXpCcVM3YTFaeFllRnVrQ2JS?=
 =?utf-8?B?clZTUEI3TDJBOXhjOVFkYUJJcFUxam52WWRqVmsvd1c4RE0yaHhTNXlVaWtx?=
 =?utf-8?B?c0w3aGVEa0hyNG1pNHJUUmVycEFBRllaYVQ2SjAzUTljYzlsdk5CckRIZEw5?=
 =?utf-8?B?bU51T2R2WWZrekJEcHE4R0lwbjg4QTltNk93WTlzaGJJTTAyMHd0VVFJN2xJ?=
 =?utf-8?B?Vk9ac2dTVTRucmsxb3RVR085MkpCTGI0eWJ3aGRlVFl6WkhTVCswOGg3dzNV?=
 =?utf-8?B?UktTWE5XU0FNREdDMklHNG1uTUh2SmZsbUdTdUFpU3M0OSs1YllxcHhFYnVO?=
 =?utf-8?B?MHdSUjhQU1dUNHU3eU1IbFc0VDVvd1dtSkcyVk5tbWh1Qm44eGg4RmtuWWZU?=
 =?utf-8?B?ZG5XVzlKM3ZpL1JVdnI0ODl3NFVwRDMwWXJnTVBsVHVENFkvRDIxbWZCdmFx?=
 =?utf-8?B?WWcwMjNyaEVTOUU3WHEyR3VuQ1VoRjdaa3VpZXk2dURBTDQ4WTlqeHJkcUp3?=
 =?utf-8?B?akRTL0VVb3BWeEtjUTBFQVU3QVVIMDd3aWJhd082bFpLWGtodnA2cnpQazBV?=
 =?utf-8?B?N0lvdHdCNlpvL3R5RUtJODdIelFHUzFhVUx1ak1rTEZhV2R5cWxEUjFYcXoy?=
 =?utf-8?B?bnJGSmFYTzl1c2MvSFhDTTlFbnR2MnpodTIrU1M2VUdLeXk3M0h3elVtaUMr?=
 =?utf-8?B?L2Y2cXRLZ1RTOUdldmRPUXcvQ08wUlhaQ21COXV2U2V2N2hEd0VwdGYybjVH?=
 =?utf-8?B?V2kwT1g5WVJyVzFpOGxJcDB3YktGTmdhNTFTNFZQWG1ZWFloYyszeDk1eGJV?=
 =?utf-8?B?aXFVanJSUlZsRUVoRHA1ekZDejE1VkdFblhlcFUwUThHMHQyL244YlNZYmxm?=
 =?utf-8?B?bnZRWnoweHdrZTEzS2xHN29GYnVYODc5YnB4c3BqR250Yy80OXVLcG1uYWt3?=
 =?utf-8?B?Qmx0SlpJUy9vV0c1WTZOOTZUcjd0eVVFRzl3eDZQMER5bVc0Z25WNjgrR0k2?=
 =?utf-8?Q?4icI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a66bd2b-7281-4a01-65a2-08dce9424606
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 15:43:23.2622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JTn7k+sA7JBDNC1IshCSBquPM4JwHurqCU7cfgF5J6L2R0wqFaHiZH+WKeKgWkv92HFkWPqJFCbAeUY56MFqWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8984
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

Convert device tree binding doc zii,rave-sp-pwrbutton.txt to yaml format.
Additional changes:
- add ref to input.yaml.
- remove mfd node in example.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/input/zii,rave-sp-pwrbutton.txt       | 22 -------------
 .../bindings/input/zii,rave-sp-pwrbutton.yaml      | 36 ++++++++++++++++++++++
 2 files changed, 36 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/zii,rave-sp-pwrbutton.txt b/Documentation/devicetree/bindings/input/zii,rave-sp-pwrbutton.txt
deleted file mode 100644
index 43ef770dfeb91..0000000000000
--- a/Documentation/devicetree/bindings/input/zii,rave-sp-pwrbutton.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Zodiac Inflight Innovations RAVE Supervisory Processor Power Button Bindings
-
-RAVE SP input device is a "MFD cell" device corresponding to power
-button functionality of RAVE Supervisory Processor. It is expected
-that its Device Tree node is specified as a child of the node
-corresponding to the parent RAVE SP device (as documented in
-Documentation/devicetree/bindings/mfd/zii,rave-sp.txt)
-
-Required properties:
-
-- compatible: Should be "zii,rave-sp-pwrbutton"
-
-Example:
-
-	rave-sp {
-		compatible = "zii,rave-sp-rdu1";
-		current-speed = <38400>;
-
-		pwrbutton {
-			compatible = "zii,rave-sp-pwrbutton";
-		};
-	}
diff --git a/Documentation/devicetree/bindings/input/zii,rave-sp-pwrbutton.yaml b/Documentation/devicetree/bindings/input/zii,rave-sp-pwrbutton.yaml
new file mode 100644
index 0000000000000..b26e6fe174f22
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/zii,rave-sp-pwrbutton.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/zii,rave-sp-pwrbutton.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Zodiac Inflight Innovations RAVE Supervisory Processor Power Button
+
+maintainers:
+  - Frank Li <Frank.li@nxp.com>
+
+description:
+  RAVE SP input device is a "MFD cell" device corresponding to power
+  button functionality of RAVE Supervisory Processor. It is expected
+  that its Device Tree node is specified as a child of the node
+  corresponding to the parent RAVE SP device (as documented in
+  Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml)
+
+properties:
+  compatible:
+    const: zii,rave-sp-pwrbutton
+
+required:
+  - compatible
+
+allOf:
+  - $ref: input.yaml
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pwrbutton {
+        compatible = "zii,rave-sp-pwrbutton";
+    };
+

-- 
2.34.1

