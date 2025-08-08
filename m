Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 394BCB1E486
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 10:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0F710E8EB;
	Fri,  8 Aug 2025 08:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="nf2bBQj9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011067.outbound.protection.outlook.com
 [40.107.130.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D7410E8EB
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 08:39:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ooGDl+GWRShi53x6aovqvngJqefdh5Jnz6F4mM56vP9p0E4a+yWVN5308KhorMPCmWtkTUbYOtMZGk/4Vw4J24HeRiSDkOrBlcjbWdaGnH1gvIuXJ68l0DQvgBRHGgXwWULWVATzSPKW8fwnaF5mhK9MyTqbfkOcCIxQVUXpCofwljaK8ktZbshuXiRugQGJJGM3EHT0AATIog5NzgNu6yXTY3xwoFIrvHe9fXJgiZV+9fCFrZhaBPyhCp3SeKSMC/eL6oPePCeSTzAfJpzz3qb0ZFLjZWp4gUqzIFIqZ+3jnh9nltVL4Bw1RWCMeDkIveNsjqTm7lxe7oU+n4Dq2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20/z/DYZAbFqNRAJnWhszUBcApa7H8SN1LKIloreMsQ=;
 b=TJdo2aH83pJ+leV9vQbJ+hm1sEirkPSyB/Y7VyXQ/TVvK/58p2xdXQDdKhoa/QyAM3lZcCHaTIj+XBCFklgemXxUAldKJyOc5O+7GCZ5Mflp8GUY5nMJAGQBE3PqiYhDObIUmkFUNkSVkwqRs8RUg3xbsXIqGj5lI+OHdem7AsSAJ8c/BO5DVuTEdMCtzdjVn5SmKi50Ghwp17Yg1oNg0ysw21A4uLNRtRzI3a42zywnYnedvxYmNBMzAvSOPucLcQOhgdW/LyjGz//+GZli/eJNjS+6pSZIYJ/LbRBL3QbSA+9p0qyNFJ894jToZMYh6eKX3tgVqVBLa+Qlk2besA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20/z/DYZAbFqNRAJnWhszUBcApa7H8SN1LKIloreMsQ=;
 b=nf2bBQj97qgnFcPifvjfddxWD2+EghqgcAw6UmxDcX9dWPq2gwN3xNaQiTH5uxskZTFLHCi0/npB25WoqZP/tFmbvguH11EgLF/dAJmfKCcbjv6+J57SNZC/0I9nsWwBVtrvIcod4ceHVAeD77nQzuwAhqhuP2+kdqiT88metPIoBriL/t/ujK8oChFzF3K3uUnKO4SxKhdDWs+wELKv/rny5aLn4zcS9w1yqIcPy9TTj3KRYpQwhZawIuENO3B6CiIvCoyTz/nvtDD2g01OJaBAFRh/6uwG+gL2NmVnnWoh2/fiVIJEVFgZRq2lod+qViINASyeBfuM0rTyBLST/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB10802.eurprd04.prod.outlook.com (2603:10a6:150:220::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.17; Fri, 8 Aug
 2025 08:39:26 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 08:39:26 +0000
Message-ID: <86249350-10bf-4bdd-a154-60b6aec59c0f@nxp.com>
Date: Fri, 8 Aug 2025 16:40:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] arm64: dts: imx8mp: Add hdmi parallel audio
 interface node
To: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 lumag@kernel.org, dianders@chromium.org, cristian.ciocaltea@collabora.com,
 luca.ceresoli@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
References: <20250808080617.2924184-1-shengjiu.wang@nxp.com>
 <20250808080617.2924184-7-shengjiu.wang@nxp.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250808080617.2924184-7-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:194::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB10802:EE_
X-MS-Office365-Filtering-Correlation-Id: 32d109d9-7625-4fdf-3f8f-08ddd6571567
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|19092799006|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c05xK2JDd2cvZ1lwd0J3WDdHYjVIM1pWbDcxVU9yN1V0SHNKc05QSTN2ZHVo?=
 =?utf-8?B?TjBjSkRmeDhPaXpIT1NrcStHcllvN283RWh3WDZNUmszejUwMGZTZ0E5L2Yy?=
 =?utf-8?B?VWRrOWJKR1FjeTFCVlJ1ZWJsbFJWdkRXK21uZnlpL0s3Y2prNEdsb2FSc25P?=
 =?utf-8?B?RnJ1d0daNlRmcTdxclhUbXJ4NDdlSVFOZzdoQkk3UDRrc2h5dVd4QXhmMHl5?=
 =?utf-8?B?djAwYXFyS1FFOFpTcmVuRWFLSW9mWENJYTFUMTZlbUcyTnJvRFZHRTFvMHNL?=
 =?utf-8?B?NU9zck9HRFY0ejlJOUhlMXEvbitNV3FmUWtpWDlGWkppM1Bra2JRMzR3S1Zz?=
 =?utf-8?B?UHo3NVpaN3JvR0luMHpPM2JQcm5MZzVFRFBQMTVBMnp3MnIzM00zbWhncVNl?=
 =?utf-8?B?L0t0WDBUZE1nUFNtS1ZNVVFYSUdYd3FpSUhyRkMzSWRhNlpyK3ZkU2pkMVM5?=
 =?utf-8?B?dlZrcHJRRHV5QUhsaUE2MmZGY0FkRzU1bVpOOVZOQVdIdjZEeDJLY2RNVmVE?=
 =?utf-8?B?VkhQa01pcDg3a1grcGZRNkE1Tm50YTFLT1R2aTgzeUNOM2ZnVzROVXdZL1pt?=
 =?utf-8?B?U2ZhKzF6VmxTNjRaaWNoZ0ErTUpmVW9xV2MvVlpkOVdreHY5amtWL1ZnaFRL?=
 =?utf-8?B?Ynh0Z3p3bkJKck44M1U1c29XVGpnOGpTWSt1M2lxbHA3eTVIeUt5OVNHVjFW?=
 =?utf-8?B?Y3pCVEVicktHK3pCZ1VoMkNpQkRXMFJCeEZJSXJjTjA4MTIzQnhBbnJaTDU1?=
 =?utf-8?B?L1FUWFR1RGcyaVh1aWJpbE5nTU12UEFIOG9vUGZYUWd2ZGU3bUl2U1dneGI1?=
 =?utf-8?B?anRlRTVEUE9MbDVVZUR0S0VjazhwV1NEYXhzNTVnZDRaZndQL1FoMXRnSnFz?=
 =?utf-8?B?MGMrOWRCdTNWcnhDTVd2YzJsMFNYbWpmNmtiMFFsNXF2WUd4Uml2YjRMUTlH?=
 =?utf-8?B?Tm5XdFBVWTN5Sm1Gb0QzMEtucmQ3TWh5amZpNXZMQUhGcDBkT2k0U3lLZElM?=
 =?utf-8?B?YTRHZVo1Szd0b2FDQlROVmpKTWNiRlpINzErZ2ZwSDgzVjZYWDg1SUV0Q3Zu?=
 =?utf-8?B?MGRYR0picG94TytwV3pFNnNiMGQ2MHNpSXVlNlJSQmdsc2hLT1ArSFdnTDZn?=
 =?utf-8?B?bzZ6L1FTVk9UZTQrNGcwcDZHM28zVzU3RTE5cm05NDRQbmRWQWFYSWY2S3B4?=
 =?utf-8?B?TDZlQndtQXp6NFhBWjhjY1NOZXBXYUt0alhMMnRuV3Z0N0FKMkZPMXE5dGkx?=
 =?utf-8?B?cVZHVVNXbE9LMlhvWFgzdTZhYkY3RkprYThDZlhKWmp6UW9Fc0xpenc5d3Rv?=
 =?utf-8?B?STRlays1eTJ1Y1gyeHFEREhyNmxhYTRqWFhYQ3Y3NnVQV29OUFk1bHMzSnFm?=
 =?utf-8?B?cjJCSVVIRFhiRmtMdGtRalp5WmsyTFBITE5SVElnOUV3Y3gxME5qSFh0V0tC?=
 =?utf-8?B?TzFSU1c5dkxMSjJsNkFsZ0lvY0JWZlk0dTNGVzN4S0FGS2JVUzFoVnVXVWxY?=
 =?utf-8?B?a1NZREtRa1BjVGhOV2dmem8yS242cW9oSGVTTFVxVWtNZ1lsV3psMEhuSjUv?=
 =?utf-8?B?MVpXa0U4Y2hHTHVveDI4SEZlT2lDcjlVN292TzdkeGx1M213NXpjU1E5dEFI?=
 =?utf-8?B?UmJRazR4OTM1R3BPcU82S3p4ODFMWHNRaTJ4RXROcUdRN040bEYzWlZVdlJY?=
 =?utf-8?B?N2lTVHdtcEpheG8vMjhUdGpmSytSdldwRmNlcXZvclV2MHBwMXpFaDgrVXBN?=
 =?utf-8?B?ZWF2K0I2eVNMcHVNNkZaM3FFd1YrRFgzdFZJaWtDK2JIWEVZbHdheGdQRm1O?=
 =?utf-8?B?L2xhZnV2c3UzOFhtTDBRUDdwaDB1OFVLL3pCYTJ5K3dleVFUQmRlWUw1K0FW?=
 =?utf-8?B?QlluTFRSODJsUUF1T3MvaGlqdjVhN2s2VUhVR2gzNHAyanA0bjl2RnJNTlpT?=
 =?utf-8?B?SWtFQ1hZbk41STlJZE9rVmRUKzM4ZHJwNmJiT3dxMVZBeEVudTRZL0ZIUHNz?=
 =?utf-8?B?ZUJDT3BSOU5nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(19092799006)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkoxZFhqRUhZZ3kxWXhqb1MyTk5ITEcvcmhtYzVTcGRIVGJldytqVEdWSmtv?=
 =?utf-8?B?WHJ6TVB5YnZYQ21odUxyaGdWK2lVSk85dHFDWW1ET1BJdS91akhaV2xiWXNk?=
 =?utf-8?B?THQweXNIU2h5b3dwRjB6KzUrT2p2eE9Vay83TGN4bENUNzk1UnpKTVNQSW5I?=
 =?utf-8?B?RnRaUnloL0ZMWVcydlRPMXJPbnFVaDdvb0ZUUnJsT2h5NExEMFJ6Sm5ZeGp3?=
 =?utf-8?B?M3V3ZjkrMnpFTk5IUk52RnhmTjd6RXQ3dXZCaVA3TDhTcnUrUlNPN0Y3Y0ZY?=
 =?utf-8?B?Nm8xOTFQaUdjZUgvWHI2NUNGbk53TFNKendQTFdTTjdUWHdxSWNFOEpmU1BF?=
 =?utf-8?B?Q2Z4VmFWWm5QK0preDV0akdXYW5PUDFhU29qNjRqS1dWdCs1cHZUSXg3S1Zk?=
 =?utf-8?B?R0dtQ3ZDRTkybUpBVUhKNkkxYUExQlJ2Y044NnpLUkJuZHJJTzB5LzVrN2pP?=
 =?utf-8?B?azY5ODhVL0RRazFPWi8zTkJNZnlLOVNmU3JhdmlObWVTY3dreTZERTNtMmw5?=
 =?utf-8?B?RWhtVjFRQU9OcGx6RnRKLy9zdTg2aUhGVmRIckhMQmxlNVZ6d3MxdXVCcmlM?=
 =?utf-8?B?RWdsSkRDQ1hHRGdFQkFHcjNFcjJ0Q0J5Y1FiOHhrdHEwdVBtZnFHbjdQRWsr?=
 =?utf-8?B?d1NnRjc5dkFWSysydjVycFcyTWxxZ2Q0N0tXOUI5R0dLUUp1YVlTNnpKTUFw?=
 =?utf-8?B?cmJHSmlFS1RacVUwaC9PZ0RvTTVYV2x0OVdPdXBMcUlJTWdpNWh5TTVFQ1M3?=
 =?utf-8?B?ZVhOV1dYM0RGYjBqUWViZjd0U3pnZGRWbi80NjRMOUlOWW1LNWxKK09ZVkNi?=
 =?utf-8?B?U2xDTlZXYXhXUXRHS0crUlg4Mzdmc09XQU8ya1JDaGZLaVEwU2YxVjV4ZUVU?=
 =?utf-8?B?VzFmVlBWd1Z0TEpibm4rZXV2ZzFYSUtsaEIzb1hoUVM3SXNhUzFwVTNySFla?=
 =?utf-8?B?cTNzTmNWcTFjYjc3SzhuZTEvd0U1WmZyVTZTRXQyLyttYlF6TG9mbk45T3k1?=
 =?utf-8?B?WCt4dDNnUm9FMzNtdG04ODRqbXV3MEtac3BEK0liZVhVZUJoZnpnMFZvMzUw?=
 =?utf-8?B?cUlnaHV4dGJtRmpXRGNESGwrTnhKV3BUZWNvUXA4bTFENzk5OEVvU1FxNVZ4?=
 =?utf-8?B?bUYzT1hCOE5QcEIvWDkvOFZXc3dIY0lYVHFkY2J3YzFMdC80QXI1WFBad0xC?=
 =?utf-8?B?YUM1K0dzVTRPNGIzbkFVaGZFVytmaGZaSFlnYTcyTDYrM2tZZGM2K2xSQVFt?=
 =?utf-8?B?dmt4bFNqS0d2M1RtSUszc1BRdUhOY1VBbS9PbWZ2NC9ST1ppTlVsVVJEK04v?=
 =?utf-8?B?N1Y2eVpZWktPVmtzemN1UHRwWDZQWklFQ0xKYkxCUFpyekRaK2I2eGxaM2kv?=
 =?utf-8?B?S1VYNWp3d3AvRUgzVjI0dEFKbWNqZlA3dmFOZXZxcHd5bnVyY2hlbHRpUE9k?=
 =?utf-8?B?dXB3eFZsWTNsd0xDK1RMY1Z5eDRTSmU3VnlDclpodmVLaW9RdFJlRmVmOTJk?=
 =?utf-8?B?Z3hjS0RvSnpXRkVJQ3VBeUtiZmcwYk5OR3g5c1dMU3lqTFhvM3k1bk5rbE9K?=
 =?utf-8?B?MWRIZWRxcHJVdTVRdi9TY3RXZVZaZDZhR0g4aGxpSU1UOGY3Y2UyRFIxc1BD?=
 =?utf-8?B?SG9KM2FIenB5a3Z3L0hTR05sSHNyWGt0bFRFUjdnckVRcG9CUHdWMVZ4aWZ2?=
 =?utf-8?B?aCtaQ21YRlE5ZmxOUTAyc1E0bUczcG9SbGlRUGFHRkhmS0RDTlJDRXZpQWVP?=
 =?utf-8?B?QTlqNE1XdUdTNUtWYmppK1NxVFErWkVzUVZqSmNDMWtOb3RxdzZYT2doTVhW?=
 =?utf-8?B?dlppUTlmTExTekdiWHZLeE1OZkVmMFhJalc1NklISTZWTnZJNGZMYTZPSkl6?=
 =?utf-8?B?WWgxTEZza3RWUmFrYVZ6dWxtR01qVmtPZVhqenpORi9ybCtEN2xnUStUZTN2?=
 =?utf-8?B?ZkIvVHNUcnRvVC9DNTFYVlFYNWYwMFdVOUhsanVqb0VybmFaOVA0aHVrVEdr?=
 =?utf-8?B?eWhPdmxPWEhNeWxvTlBkeUhGUHduTFJyemQ3OCtKTzRaNTZWait3dXZMSHNu?=
 =?utf-8?B?SXN0VEtzMGhuUFZVeVBhVlhqeFBSQ2RxZDlmS1BzV0lMamp3cGdXRmNKY2tl?=
 =?utf-8?Q?U4v5kCHwXkUiCYniw4QmjCvo6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d109d9-7625-4fdf-3f8f-08ddd6571567
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 08:39:26.7455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qFf08Kf3BNYdTw5M70VvizUO8nkGLuqeZVWM+7x4uhG9UrrHyCIVN9506nx8JMcSt8wJgQa2igd58k1iS8E3lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10802
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

On 08/08/2025, Shengjiu Wang wrote:
> The HDMI TX Parallel Audio Interface (HTX_PAI) is a bridge between the
> Audio Subsystem to the HDMI TX Controller.
> 
> Shrink register map size of hdmi_pvi to avoid overlapped hdmi_pai device.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 28 ++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index 841d155685ee..00d8474bd1b1 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -2066,7 +2066,7 @@ irqsteer_hdmi: interrupt-controller@32fc2000 {
>  
>  			hdmi_pvi: display-bridge@32fc4000 {
>  				compatible = "fsl,imx8mp-hdmi-pvi";
> -				reg = <0x32fc4000 0x1000>;
> +				reg = <0x32fc4000 0x800>;
>  				interrupt-parent = <&irqsteer_hdmi>;
>  				interrupts = <12>;
>  				power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PVI>;
> @@ -2092,6 +2092,24 @@ pvi_to_hdmi_tx: endpoint {
>  				};
>  			};
>  
> +			hdmi_pai: audio-bridge@32fc4800 {
> +				compatible = "fsl,imx8mp-hdmi-pai";
> +				reg = <0x32fc4800 0x800>;
> +				interrupt-parent = <&irqsteer_hdmi>;
> +				interrupts = <14>;
> +				clocks = <&clk IMX8MP_CLK_HDMI_APB>;
> +				clock-names = "apb";
> +				power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PAI>;
> +				status = "disabled";
> +
> +				port {
> +

Nit: Drop this blank line.

> +					pai_to_hdmi_tx: endpoint {
> +						remote-endpoint = <&hdmi_tx_from_pai>;
> +					};
> +				};
> +			};
> +
>  			lcdif3: display-controller@32fc6000 {
>  				compatible = "fsl,imx8mp-lcdif";
>  				reg = <0x32fc6000 0x1000>;
> @@ -2143,6 +2161,14 @@ port@1 {
>  						reg = <1>;
>  						/* Point endpoint to the HDMI connector */
>  					};
> +
> +					port@2 {
> +						reg = <2>;
> +
> +						hdmi_tx_from_pai: endpoint {
> +							remote-endpoint = <&pai_to_hdmi_tx>;
> +						};
> +					};
>  				};
>  			};
>  


-- 
Regards,
Liu Ying
