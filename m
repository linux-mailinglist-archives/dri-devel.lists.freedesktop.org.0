Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DE0AC5155
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 16:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E95810E2A8;
	Tue, 27 May 2025 14:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="nPRB3qrk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11023132.outbound.protection.outlook.com
 [40.107.162.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF7710E2A8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 14:52:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQstC9jF4S9P4x5e4CmlpHFupghi0iz5CiqAHJYTAKpbjsvtieUMiGvVbWeW8tB7WeuCJ/o3/CYrYmJ//9qT3y5PMJN6ti4nqa4sfdR8QlesJJLom3xEeU5XLbrxdY1ALIDVhxxsgLER7bb1/E//+KLk7IPWe8rL+jlYdLUjW6gwNJ/hipCDLJsCRZ0QY9XhXCx/qFg6QZzwJBLB4vFbk9jshbXW1FRytreAqpGNqEMIYzpZVWTSi6qh/iSxwVbXiiVoFWqBxxZBjKwwq7r30YDwOCMHk5bItHer0r0gIw/jYOS4o19L/wHgnOCQP2vJy56AuX9ro6/LetjQqOpUZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7t2cdMgHfY7fGY+P8yyx/8jAlZuDjPRsnof0dCA2aZU=;
 b=m4VpAUxqx8CZ9siDJFLpr23w4jRPc8twaEATgarxysInRpa1jF1SuiuF8rtqWF6wLkWD+TpoEDNEq6daNod22x/eN7dlkEYMVVHqkg5ImFc8eFOQ97NQ+VRgiVhkJZD7NGOHvwaukQq70nFja+41q/63lvuBEz4XDcmxkHCaUO6e8kxHfgnz8WWgLfvRzI/u6Y1X08frbHFvBQJ9LBg7bgRAW/Ga4RZStU5wTdDaEmmGjk1DENBScRMun8vxLi2FaZkkGrmlVqxy81/TuT2bLeF7ii2iYQEokBlTN8cxzOF9hDeNHVXCDzisF2Ag6UP+oZh5y88qSibF01f60C1lvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7t2cdMgHfY7fGY+P8yyx/8jAlZuDjPRsnof0dCA2aZU=;
 b=nPRB3qrkNOoVcpRj8dAzivNkm2cANSySn8mdaCKIsEQz1WuAaU2Xvs6j4oLuezKcfeCWkyM89xzAMbKPvvsvrMFyoBAwKbZILeMRmLaUbTdt5h4mQ/by4CTsSwBMEZ4buZ7FCSFOPbScmqKhb+/fLaOX0ypwW1L/Ss/CkLi7rpU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by DB9PR10MB8032.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3d4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Tue, 27 May
 2025 14:52:18 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19%7]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 14:52:18 +0000
Message-ID: <e76acf6f-2b2b-4b4c-9dd7-b44872081875@kontron.de>
Date: Tue, 27 May 2025 16:52:16 +0200
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH 1/2] drm/bridge: samsung-dsim: use while loop in
 samsung_dsim_transfer_start
To: Philipp Zabel <p.zabel@pengutronix.de>, Inki Dae <inki.dae@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
References: <20250527-samsung-dsim-v1-0-5be520d84fbb@pengutronix.de>
 <20250527-samsung-dsim-v1-1-5be520d84fbb@pengutronix.de>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20250527-samsung-dsim-v1-1-5be520d84fbb@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0184.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::10) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|DB9PR10MB8032:EE_
X-MS-Office365-Filtering-Correlation-Id: e1c2b127-4399-4940-ced8-08dd9d2e137a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rm9abEltMURuU0lsYlJXeVh2REdVNDRvN3NOSVg1MXladEFOUzd0cG5OOEV0?=
 =?utf-8?B?bGgxOFhIdGVSQnlBVTJFbTR0OHZraFVsVUJ6cXh5RWNITkU3MUdRYUxCMDhG?=
 =?utf-8?B?S1FuV1laZm9saXBMQlZoR1BEdVJpU05kSVVucHpsMVpmOUpaaUthU1lZTnQz?=
 =?utf-8?B?TTdpOXpDeG92T1RnNFlpc2xrY24xN2FjRnUvSXNyYktKSVZINUNWemxHK3h5?=
 =?utf-8?B?WlY1L1VaVFdrQVQzZXlObU9Kem1FYjBtdUx5aG5lL01rcUZYNmEyU0FJbmEx?=
 =?utf-8?B?bmtWK3lNUTBlRG14ZjdHZkJ4UGlTQk5kZmZTSHFDeVJZUzA3VllhTXdyZWx1?=
 =?utf-8?B?d0xrRm1KVUFtOEloL01kQmlMZyt0RXE0bW9nSXFGOFRmelhPU3lma1Bhd2VJ?=
 =?utf-8?B?L1dRTDNPdVpPRzhYeFErSGxWbHhoWngzOURJbEdhcjhoU0xuUStpNWFIOTN6?=
 =?utf-8?B?ZG5hb1U5VTN4d2NrVHl1WjVLVG83SlZHU3FaNkszWTFRbDQxSm1GeDRQZXYr?=
 =?utf-8?B?ektJSExlaEtOM2l6SEQzdG9tQUx2WUxReXdrckxWQ1ROdGcyQzJPTThPRFB4?=
 =?utf-8?B?dHUzTXV3aW82YTBmS2hsT3p2YVQwdDl6Vm16Zm5oZXphaDBUdkZLNy90NzQ2?=
 =?utf-8?B?L0JUc0diUlpvWkpvY2pzRUM5YnpKMjJuMWNTUXVOSmhKaHBXSytYcmZFMkhF?=
 =?utf-8?B?Q25mZk5SdWpSVHZrZDJsbDZoSXFReEJ1K3dxeVVRUVIyOWIyeHpyNzFLT2N3?=
 =?utf-8?B?NXd1aS9XeWs3QVliNE44ZU1jVkxua1QybTBnemNhVmhUVlRCSFQvR1NUL01P?=
 =?utf-8?B?dGdzSWpaRWgwZHIyMmppTEwzRS8yYmFyTGlqelVaQjJiVnVHQ1R2eGJISVBs?=
 =?utf-8?B?RzkrS1B1VWI4TFZJMG9hbDEyN1ZXRFFhdy9aWTU5K2IzM3VpcXFKd3E4NUVo?=
 =?utf-8?B?ZEYrMk0yRUhPUmhqRmZXc0haaG40UG1zRFg4TG5qeWlkT0Z2aGliSUs0cmc3?=
 =?utf-8?B?QmVNL3B1enJZLzZlTVNPbStmQmJTRXVJamtBaWZ5TDZpUzR4L1I1YzU1OG9X?=
 =?utf-8?B?SzhqTlVJOUhhZ1d6VERBN1Z4RU4ybWRXNE9oSFc2cHpydU9BWEEvUm5YY2hn?=
 =?utf-8?B?ODRUQnNHdmg5c3gxQ3ZTVEMxRFUvQ3p4RllqQUVoT0dsLzJPcDhCbDJjbGR5?=
 =?utf-8?B?TlpUUVNmRzlXSU5BUU1qbGowZGJXSXkrKys0SHRhczFjUEE0bkhrL3JUOStn?=
 =?utf-8?B?L3RyTUp3S2c4R1oxaWprc2N1OHB1aW1kTDNUNisvbEpHWWZFVDFrMlBKbG9m?=
 =?utf-8?B?YTczZm93b3B5c3NBV01qSWNieFZxdS8wT3k0Z1hHU3lWSlQySkFuMFoyMGR5?=
 =?utf-8?B?Ni9NV2gybXlreEhnc1U5VC9zZVZiUUZVRm4vdXdXazZ5aTBWRUttdmJFQjlQ?=
 =?utf-8?B?U0JFRkczcWJRMjB0UVZIaVJFeEsyNm13eVpRNEk3ZDlGZUp2MEZ2UWw4MDM5?=
 =?utf-8?B?OEREbzFqbkR3cjdZWVBMWFhqUDdoR0VGMHQrT085dWZjeXFmZ1ptV3pKN3lM?=
 =?utf-8?B?cUJZRUZiR1FIYWIyenE3YmZJWmZWUUYxZnRBWTVBWDdmQ3BCM29TRy96SFNI?=
 =?utf-8?B?alR0UGRhUTNtTFF4NXd4aTFGenF1T3MrWDFnRElNcTMvM2VyVTljdlhFUk1H?=
 =?utf-8?B?RkZDcDg1MXBlditvaHB0NzVxWkdnaGQvWGJhZk4yNURFOEtLNTlaVXBMVWJk?=
 =?utf-8?B?alovb0t6QndHQ0RWOGlaRWJSVHJDSnNCNVhvRTlVUzVZQStFL1NPVC9rSEJP?=
 =?utf-8?B?b1hOaE1HZkQwYSsrajRFdG9NRnN4K1pFRVhSdExIc3l5aUYvdjQweVR3cU44?=
 =?utf-8?B?QjNQT2xBTzZ2U3NmN2lYeElmSFMzMkx2cUtjWjNZWHIyVkdhM1ByaXFNd0Za?=
 =?utf-8?B?YzVhRmxDdUQxT041ZnpnVWdBTTUyZUowMVFTQ2hZdUJkN0xMeFZUclkySlhl?=
 =?utf-8?B?RmNxOFJWdWJBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(7053199007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkZCY3hJcmY5d3ZLbmRldlhWbDVEZzBiNG4wQlJHRDNTMlRzME9DZUpjVWxa?=
 =?utf-8?B?SGlZN2p3ekhKZE9uTHJqN2R6Q0s2blNGZURDWHVYeHZGc0dLc0RpYTJYQno5?=
 =?utf-8?B?dmFFOFo0SmlJOHVGYVorVnV6ekM2OTdxeVFRYTh1aUJWaWR6a1lPMTJWUFhk?=
 =?utf-8?B?Y0VCNFJsTUwxcExzTG9oczdzcFR6N0d4TXhvUldmMWpLekg5RTU0a2Z2OVJt?=
 =?utf-8?B?QmlPVzQwU2wycytMcFY0RnZvaXBEN3pFZDBsNnA1Wk9QOTg2RDZ2REJzaEJQ?=
 =?utf-8?B?RlZrSjlXQ1BMSzBIYno0NDd2ZnRZdEFjNVdjRCt1b0FneUV4OHBtQ2M0bDVR?=
 =?utf-8?B?VnBoVHdiano2OU8vYiswYk5LVUZoZnRmbTk0UXRvMVREcjM1bVRseHEwNW9R?=
 =?utf-8?B?ZGpqN0RBaGZvS09CZ2F4TXBQNTYwdE9QRndJc1VyVGJmYzZJTGFWMGtIQmZo?=
 =?utf-8?B?Q0MwaUdMOFJLVVI0U0lZL0J2WER5UVUvMk8xTWJjam0yR2V0VWhldTVLOURm?=
 =?utf-8?B?VDhlYmd0a2FKVXZqZCt3bitLR28rbXpmNG0yUnpRMSs4M0FjQ1AyRXA2NjE5?=
 =?utf-8?B?OUdwZmZraGxxcFZNdnZ0Z0JSTHh4ZytoSU4wQnJoZ3RZbFpDZURFeTZPTzM1?=
 =?utf-8?B?alpwUFdPYkthMnpmTmQyUHh4Q1kxZ3M4Rk5QSG9JUVNlOWVFZUlGNStSRGY5?=
 =?utf-8?B?UUdtRXo4VkJ5VzN0ZDRIcGJXcHNsa24zZ0hNclFZT0VBc2E3UFUrQ0FBRWR5?=
 =?utf-8?B?UEdwMkdreUs5RGxZYmkvOGhQMVVpamJUaWtVc3EvWDJrQXB0dlVuaDB0VU5w?=
 =?utf-8?B?Q3liZjdGNWpLWXUyTENCSUFkdHpEM3ZLVjZxcmJ3a04rR2hTcDBKQ0RUdUdC?=
 =?utf-8?B?bFJ3SmRxTml0M2lXQnI2ZFc5Q3NXZDcxNk93SUNkQktIMWNRMXRFYWcrWjd5?=
 =?utf-8?B?Zmxsdm1aOEcvNHJieXFoYWtuRGNyaGowMVdyeXZpVW5GaXhKUWhDbVFxN2E4?=
 =?utf-8?B?QUd5UlR6MEhJMHZ1U3FNV2tPVnVFVXBOM1h4Zi9MRVRndXd0RzMvalNxanRW?=
 =?utf-8?B?VDRraVh6ZW1raEYxRGtJNzczcGFMcDg2UWNVTzl6NnFzY1JadERYMlNreExK?=
 =?utf-8?B?K05LSlZ4ZDBPVE1YRDUrWk1HWjZQbVBpSk5sNjBSc3R5WEc1dHFYUkJZS1dv?=
 =?utf-8?B?NHROcmk5NVJsUmVka2RMWTdwa0Q0YXJ1TTFQZm1TdEFTZ2s1UkxzRkZ5MFlT?=
 =?utf-8?B?Sy84bEpXUk9NSGpORHdKZUNyaFBwbFBHNXRvV01YMWpyay9ibkdlY2pQMGdV?=
 =?utf-8?B?cEptdXJXTE9STlNiZ1N5ZFJUOWgwV091R3JPRkFuRm12Y0NzM1lnaFRaS1pw?=
 =?utf-8?B?SEp6Tk1lQzFwOUIyWjJQRzJqYXNNM0V2S1BBNlRwSnlIdC9EeXdEUnFMcEVS?=
 =?utf-8?B?THNodTR6KzYvSnlNbnVxTmdrQXU0TUJoTTA1c0NYVkk2YkRsWUwreUplRmZs?=
 =?utf-8?B?Z2pCaTN4dVh1c0lINXhYY2ovMVg3VG5ybnpXMHlxaUQwbmpSQzNiWWhsOUtH?=
 =?utf-8?B?Tmw4Yis5T09LYndSZEVhaUZLeFRKOVkydFZjOWhSWDE2MXVSV1dOUkJPUkhW?=
 =?utf-8?B?enBQbWhlRVQweTZEeVdrdXVoaFpGUWdCRDlpWGZ2OHcrWFUxNW5sUWhiTXln?=
 =?utf-8?B?TXlSSFVmOUR2VjJRVVl0YnRodHJibEtobVNVV00rYjZuV0R1VWtyTjJUcmg3?=
 =?utf-8?B?UlJwWDFZVnRrd0RKcWMyOHZGUjFmV2hmRTZLSEFaNVU2bnRuWE5kWUdaZWhX?=
 =?utf-8?B?aGFUWEdCOS9SN212R0FGT3dEUktrNDgvMGNwbUNTd3A5NUdxVGtFaHdUMnEz?=
 =?utf-8?B?ampoSXlDY292SHFaZ1dvWGtoMFZybHlkTXJXU1F2cytZYkZSZDVRdFNjVXFH?=
 =?utf-8?B?ZmdZOVVVWmJrNE1ZZkJsYnE3R1dyMGM0UllvdWEzNnJMUFhOOStnVUFMekpn?=
 =?utf-8?B?V045Z3k4bjY0SGFGS3doZ29ZTXM1aGdkcUpsVWNMN2d6MExEWktmUzBMMGF0?=
 =?utf-8?B?dFRlWG1lYUpqT2F6MGZXWVhCL2RyZGFKbTF0WUFXbXl0TjZpRTArcUJQdXRU?=
 =?utf-8?B?RWYrNTJtVHoxYlhvcjl4TzBUMlJTcEdjc2I2MjAyY1dHMkU0ODV4K2d5dm92?=
 =?utf-8?B?T3c9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c2b127-4399-4940-ced8-08dd9d2e137a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 14:52:17.9977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EijZxOeoo7Zm8QH9jY55AR42qnkkF+FdK0icGbO+uYwQUKxGAcIF8PdIQiiJRHTWZKerMfs1RCLM8vTHYXp7Oo/di4H7H4udOByfsdUirag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB8032
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

Am 27.05.25 um 16:21 schrieb Philipp Zabel:
> Turn the open-coded goto-again construct into a while loop, to make
> samsung_dsim_transfer_start() a bit shorter and easier to read.
> 
> Hold the spinlock when looping back around and avoid the duplicated
> list_empty() check.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 51 +++++++++++++++--------------------
>  1 file changed, 21 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 0014c497e3fe7d8349a119dbdda30d65d816cccf..1dfc9710bee5134e0e0114ce52f673c21564b11b 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1235,43 +1235,34 @@ static void samsung_dsim_transfer_start(struct samsung_dsim *dsi)
>  {
>  	unsigned long flags;
>  	struct samsung_dsim_transfer *xfer;
> -	bool start = false;
>  
> -again:
>  	spin_lock_irqsave(&dsi->transfer_lock, flags);
>  
> -	if (list_empty(&dsi->transfer_list)) {
> +	while (!list_empty(&dsi->transfer_list)) {
> +		xfer = list_first_entry(&dsi->transfer_list,
> +					struct samsung_dsim_transfer, list);
> +
>  		spin_unlock_irqrestore(&dsi->transfer_lock, flags);
> -		return;
> +
> +		if (xfer->packet.payload_length &&
> +		    xfer->tx_done == xfer->packet.payload_length)
> +			/* waiting for RX */
> +			return;
> +
> +		samsung_dsim_send_to_fifo(dsi, xfer);
> +
> +		if (xfer->packet.payload_length || xfer->rx_len)
> +			return;
> +
> +		xfer->result = 0;
> +		complete(&xfer->completed);
> +
> +		spin_lock_irqsave(&dsi->transfer_lock, flags);
> +
> +		list_del_init(&xfer->list);
>  	}
>  
> -	xfer = list_first_entry(&dsi->transfer_list,
> -				struct samsung_dsim_transfer, list);
> -
>  	spin_unlock_irqrestore(&dsi->transfer_lock, flags);
> -
> -	if (xfer->packet.payload_length &&
> -	    xfer->tx_done == xfer->packet.payload_length)
> -		/* waiting for RX */
> -		return;
> -
> -	samsung_dsim_send_to_fifo(dsi, xfer);
> -
> -	if (xfer->packet.payload_length || xfer->rx_len)
> -		return;
> -
> -	xfer->result = 0;
> -	complete(&xfer->completed);
> -
> -	spin_lock_irqsave(&dsi->transfer_lock, flags);
> -
> -	list_del_init(&xfer->list);
> -	start = !list_empty(&dsi->transfer_list);
> -
> -	spin_unlock_irqrestore(&dsi->transfer_lock, flags);
> -
> -	if (start)
> -		goto again;
>  }
>  
>  static bool samsung_dsim_transfer_finish(struct samsung_dsim *dsi)
> 

