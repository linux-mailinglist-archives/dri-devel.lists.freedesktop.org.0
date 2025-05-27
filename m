Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4590DAC5158
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 16:53:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB10410E419;
	Tue, 27 May 2025 14:53:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="kAV2vW3v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11022093.outbound.protection.outlook.com [52.101.66.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C78410E419
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 14:53:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=reNKNAR/sI4vgDTDsKnKpdjcp9J1t3YkklnZZ7jLUAv9O9mtdBe2EqWjmrVKtgaDfOXFSKa2nNNaFe13WJuwAsF2ZxpXTt91tOjNPegMk0etb/4EmcfBe2c3zJ+zmTSqbDZGIAJaIIAbp8xbB9avZjWmmZP0lbC3cyqi//oljgp+U9iQT5p00+6AwdmIWL/uuzh8z2D4pVlUNwHbepH9h9pBtOhtVrP1Ry24xokC01cEgZQAuJNuARFMVTTXyHhvfrv3WKBHbFZHkhLnoKQwr/NuEqlyGUCe94K7cHAxXtIYYbrMJSI6asYer0LbsdTjq8NofOBFsNLMS/DEV92VSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88BiEyClJyY1INCthZY1pGTrnWso9mZkfFGWt0kRokc=;
 b=nTmHqAHzGANMwadXaIvnMSd8acPqIuNAx3KfJz9la5nq43pG2fmftDyHmLVRnoYZJyqmTCiWRmDvYsqtrSNUAQuqjRZH1bHPECu/AwmHVNWGS2G2OAAo17RmCO4qxyG8FCK7QKHPSa65oQxdXBdE4GZgn91I55VAi9W12pJo93muWMmu7WJ4y+JY+/3NJcfXZr17xPDny34It0qyHsMlcmoXVE2Gs8xiI2uoNppaqHrQ8jEtYHX2Qld4SyP7ebNIsntmB0amQdUeKbWVWr5O30G1gv91W96Z3NpuVbMc3TyphapPJYX9rtpAhez7GbH2+kWkfJ+b3jld6CEHeO2/Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88BiEyClJyY1INCthZY1pGTrnWso9mZkfFGWt0kRokc=;
 b=kAV2vW3vqFz2o5wqbHIsEaqHZxQw8Hfy3F/LV5Ph3d14GMhjk7X54Ks02LDGgcxJ7m/gm9FE5wfbt/7S1fTbCO4o9sTMcD9kR5GRJBmtgaTZYzbwDTxZ4RuL2lKKhpcOH1Mme4DcbsQjLreVhaB9zvTLh4eqe3eLXcVj/7DSEu4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by GVXPR10MB5983.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:17::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 27 May
 2025 14:53:14 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19%7]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 14:53:14 +0000
Message-ID: <3cb1ba96-4915-432d-a42e-df934e64313a@kontron.de>
Date: Tue, 27 May 2025 16:53:12 +0200
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH 2/2] drm/bridge: samsung-dsim: Use HZ_PER_MHZ macro from
 units.h
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
 <20250527-samsung-dsim-v1-2-5be520d84fbb@pengutronix.de>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20250527-samsung-dsim-v1-2-5be520d84fbb@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0179.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::7) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|GVXPR10MB5983:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ed0011d-7b75-4ded-e781-08dd9d2e3514
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UkdlVTFSMVRacjh4eUl0YUFFUzJMSE4vWSs4cGUrdkJCcTBLL1ZxT0MzY0dr?=
 =?utf-8?B?enI3RXg0WmlCQlNNR3FQSndQQjdTMVVDZjJxVURMc3ZOekEyS3oxQ2p6UWt2?=
 =?utf-8?B?bkc4VU9abVdoWnhnOTZBWllIUUdpSXBtT3BhWnEvQ3ZHdDkxV2EwWVZ0VUx5?=
 =?utf-8?B?VERPTG40K3pWUWpMTjF5NS9FZlJPMkJxeEh4TjBPeUhmRnppZG8rT1VtTlNZ?=
 =?utf-8?B?K05uYVBraDZuZVltRjBjTkVQS2M2SDkzWjlUZkhINHMvUkMrNkZuTWhzWkdM?=
 =?utf-8?B?ekxvMi8rQklBTy9iZ3FOVzNTemk2N3E3WThrcjI5dHptWnJvTlNDcEpYSldk?=
 =?utf-8?B?MS8wemFvS3o5Z1dZbVpUTFhES1RWZ1JJNkZDNHlXOHdCMTAyWWxwWUJkUUxi?=
 =?utf-8?B?c2JjZGRwei84Mlc5VlUzZEViN1VISEJtb3NZWTFlL1o2cVJqTUZLQ2dKbEZQ?=
 =?utf-8?B?cTgrN3Y4NTIzU1lsZm9HSmtIbkgvK1V3ZXV3R3JKVCtuakhYQ21yU2x2SUpZ?=
 =?utf-8?B?K1JsaUVnU2czanczZWNQd1NYMmcyREMzQnFLemhRKzlTSTBjZkJzck1kclRN?=
 =?utf-8?B?a3NFSHBNVERJRDNmcTdnM1pzZU5sTjdUeXExMlJjeEtuMjZTVzh2ZkNwTUdi?=
 =?utf-8?B?Tm90dUgxbWtrS1dGMlYxcmdKV1MrSWwrMUswNXlKaGJXRjhreWluaEtYQzZi?=
 =?utf-8?B?NFdSRzhJSDFTSXRUZkZCVXYrTEdselNmUE43Sm10eUVpVEdaOUluOWE3bk1E?=
 =?utf-8?B?SFNCaTNCUnhvVVpkamxEWlA0a2xVQWtOcEFpcHVhUHdqM3NUVFF2YWc3WE1Y?=
 =?utf-8?B?UElwWUVwdDNMY3dKbnkwQnVBUWpiczlTWUdNOWZGMUF2UGlYcDRTaGdkRWxa?=
 =?utf-8?B?RDJjQzdMeEdmQVI1RHlRU1Z0SStzclR2Yk9xbUZOUDl0eXRsZC8vWDc3bUQv?=
 =?utf-8?B?VE92dUJNdkl2NDBXUkhMbEx5RlRKbzg3Rll0UWhoY01lcFUySTRoa2ZKWWtn?=
 =?utf-8?B?QWNRUTlmbmdaU0VkQ1hmUUFrT1VLVDJFZHlHU2RGYUthVmtpNUVwb0M5cnV1?=
 =?utf-8?B?aktkK0hueFkxcmt3OHFuQUNSRHRTSXVGWHRRTXB5RHZwNFQzOU5MRzhGRVZR?=
 =?utf-8?B?dUQ4QitUM3JGRUZSamdJZjFtWEh1ZFI2Vkc3T0dSbnZ0SktJS0poTldpZW93?=
 =?utf-8?B?K0VLOUhoNHJkVi95WEZKeXpDZWExTnNOcmJaUWlvU3hCMEtPWkpuenJHdU8z?=
 =?utf-8?B?dytUYjlkOXcyZy9aUThpRjVQUUEzSzN0OGJQWjdZRzZTNDhlbU0vZ0xlYUMv?=
 =?utf-8?B?ZThZZWNYbE1NTHVHSDV2KzA5WGpwVXhSc2FCei9USFFJYW9FNG1HOEFNQ3hi?=
 =?utf-8?B?Mkt1aVEyUnlDUzRkaHJmL0lOT0NQd29rZU5XU3owTnZWcExueUdURVZ4K1FL?=
 =?utf-8?B?K1N0d1plamY1ZzhJN0FhcmV0ckFodThkMVBpMWlQSFE4SXNwWE9VbWZ1NFlt?=
 =?utf-8?B?bkJUUzVtSTlQNXp3RG8wb3VuMW0vQVlBTnppYXBCanozYVpmQ0psWTlTSGtO?=
 =?utf-8?B?b1FZWDhKR052VGhIK0l2SjA1N1Y3dEtadysvRUxsMGNadHIzUTFLVWZtcDNv?=
 =?utf-8?B?YStnYXFka2NGeW85d0lKTDFpVTZZQ1M2c2MvRnFGNjVzWnNWT3dkeVg1YzQx?=
 =?utf-8?B?ekMxKy9aK3hWd3R0TTZlOGNIWjBIY1ljWjVyTnNQMVlaVitjSUxONk9tRWRi?=
 =?utf-8?B?ckNrRm5YNjlHLytEMERuWFhvbWVUQi9EZE1sZnozQmZxS0FWMlZLa2VIOTJv?=
 =?utf-8?B?TDZCMXo3b3lHd3ZHR3JURnIvNHNIUUFSZVkxQ3JYbWI2Q0FTMmhnVzUyMFV5?=
 =?utf-8?B?UEtDcitNUUhRRzFxSnRQUU8xS2ZQQUVMYjllYzNad1hRL21DcUNEWVFpcjFL?=
 =?utf-8?B?V29ZZ2tvZVZtREwyd1M2dXo2dGlScFJlbmwwUFIyRmJXTkY2SnBnbW1VSjJY?=
 =?utf-8?B?QjVtcDBiZmxRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(7053199007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3BrQlR3YThkSnowNGl3ckhEM1VMSmdFbFRVUjdYU2J2SEU5TTBJaDNuZVMy?=
 =?utf-8?B?eEFBa1JDZVQ2VEt0TjJoRENxNzNIZWpMTHpaL21udXpqR2xiekQwSVUzTk9h?=
 =?utf-8?B?S1Q2NzR0NGdJY2dyYmxPYlZkY0htWVB2dHhKL3BkQ0o5Ky8vMy82OVpYRjhT?=
 =?utf-8?B?aDFhNlBnMFBwZG42QjBuTEpKNVhjcUtFSlFpY01sZGt6dU56dE1uYzdrdXZU?=
 =?utf-8?B?NXdVeWlna0s2ZXlEVU1hNVFDeHRhb3NiQ08vU2RMMVd6Q2VzUk9NaUdhTGFP?=
 =?utf-8?B?QzdSNHBBSmxreXkrWXE4Zi8xb1BIUStIeEQ0WmZjcm1oUXlqWVpRM2JhN08x?=
 =?utf-8?B?U013UVJYMHRaRXpON2l0Snl4SUpqd3R5VjVQc05IVk1UM0FrcGMrSy80RXZT?=
 =?utf-8?B?WVNwNm5Da21ad3piZFdsVHNrUFcvUUtOemd5MkdqRXRxS0RYdVRBS1QvMndi?=
 =?utf-8?B?Y2tLbWZFbkFYVWsvcTNSaWlrRWkyS0lFOUVEMVRSRng4NC9WYktmQzRkOG8x?=
 =?utf-8?B?K1ozRVBKVWhWb2pVM01FQW83V0h4Wjk5aU9qdXFSNHJKTjE3aWVRbnR2dTMy?=
 =?utf-8?B?UndSaGtsVU5GWVF0QXkyUzIrdmtPZHdJbXd6SlptSlpVL1FPbGtWQWszcnNB?=
 =?utf-8?B?VkRSMkIzZnV1eVNXQTdTbTd6TkFpbkc2OXZGNno3K0o0ZTc2cDcyQnhpRTNE?=
 =?utf-8?B?TmpSR0svc1M1SkVDbit3VkN1RVA0bWhHU3VhUXM3SHJEdXFHeCtaUHhHa3Vu?=
 =?utf-8?B?KytyZDhiOWdNc1VyU3NuQk80d2NPdEliV3dFUlY5OVRsUVVrWlhsK2VyRmFz?=
 =?utf-8?B?YnJ2SitCUnVTN2NjSHo5K2JvcG5FTDdWSDN2WmpjUXVoKzRFMnpMQktJTFVu?=
 =?utf-8?B?QUtwWU8rNGxGSUVYYjVod3hNWDY5ZkZxVEYzMjlPMWtuUjI1TXdjV21WYjBr?=
 =?utf-8?B?ZWNtM3RXTzlpVE9ubG1PRmpOYnBiYy9LZjZpVGwyMmtMZGNNcThDZkJwNEVZ?=
 =?utf-8?B?aWZ2aU04eXZNL3RnUnIzd01qY1hUdXJ1aWxvdEpla01jMUhjOGRtSGV3VnZN?=
 =?utf-8?B?d2swNTJES2ZraE9vcUYwQi9zYSthL0VCaWhDNmJXaWRseTBVMFZ2QjNRN29o?=
 =?utf-8?B?Z3VNRjBZdUMzVE1oTklNMkkrSUZaNWt5aXZwU29XYTh2UFZKaFYrVWhsR05V?=
 =?utf-8?B?VVhDTUFxMnNrYjVUNGJzYWcyRDRzU1FpaVpJRDNPWVljdjVyNG04UTJWaFVo?=
 =?utf-8?B?VXFjZDdWbFBoOFNyUGkxZGN5cnNnZGg4a1d1SWtLeGIrOGdoYUZDc25GdEpP?=
 =?utf-8?B?Q0ZGbGNMSzFxTUNlU29vK2xZZTRvZWd4SVpXU2tVT1RqQ0RnWHhPQko5OW1h?=
 =?utf-8?B?VDNqUUgrU0lZREs1WXFhbFJDQkJnRmhaTjNONExzM2ROV3Nua3BCTVhvcWpw?=
 =?utf-8?B?SnhWZWtwLzBXL0pYaUpVbnVSWEI5YnNXQ2ZjRDY1RXhuSG1jMzZzYVluTm1r?=
 =?utf-8?B?ZzZFTVQzSldiTTFCYlJTSXR3dHVMNHZiVDhvLzNVckI3bUV3Rm0xbm40bmJK?=
 =?utf-8?B?TmhEUndCa0wwQm12L0Vzdm5GKzNSZGNEd1FRYndTN2Y1em5xbUlEUGxXYkY3?=
 =?utf-8?B?bHJGVGdjUzJEVXI2RzZtOG8wMEtsUHlGYWlEZC9GbGlucG9xQjF1bXB1MnBO?=
 =?utf-8?B?aTBZc2VCK25UVHptTzlzbUZjSVltT1kxeUVueEF0bGFqcjBrVVRWTnVyRTdM?=
 =?utf-8?B?Qk0zTlNlZFdjbnFBOGx4d29xdmc4UVpCM3VJQzRNaWRud3ZoQ25YVEQ4ZCtm?=
 =?utf-8?B?RTQ5emVQNGJaNHA4NzdxVTFvRTUySDd2Qm14UEN4WktzOHQ2Y25nclB4NzhS?=
 =?utf-8?B?TTk0aHZRUTRqaE1HbThUTVpmRDdHalpBYmFYZFoyMGNFVXBhY1JIczI1dUli?=
 =?utf-8?B?QnBUNWg1ZFphd2F1YWVWdlo3RTdZdUN5TDZIWUh1bE42NUVRZnhiOVhJZEta?=
 =?utf-8?B?QlZNVmpJZjFDWG41UHNyeStSbFhHREtBbWllS2hhMHE0UzBoVU9rRFBNL3FN?=
 =?utf-8?B?MXppTTlwL3VzY1U5QXY2N0QwRTB0Um9RVTJuZnBjcm95R1JqZ0dJcTh0Q2R1?=
 =?utf-8?B?U2g2ZGFBTEZzWXF2cE1sUnNNTjEreEgyMVdQMVo5dnB1aWJuaitTSmtVakUz?=
 =?utf-8?B?MWc9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed0011d-7b75-4ded-e781-08dd9d2e3514
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 14:53:14.2545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WReB8xh1x2/8wgoD+D1nYNUhqTPi0bDCohJ/y5otGPoZug65SjwJtwILwyQxG84QvRWGKpgBzCmru0bNOideW4EKdcpjCpBNIp26Nb59FlM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB5983
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
> Drop the custom MHZ macro and replace it with HZ_PER_MHZ.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 1dfc9710bee5134e0e0114ce52f673c21564b11b..b7fd5870eba7e4bef3f420ae7cf6de1a700eb41d 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -19,6 +19,7 @@
>  #include <linux/of.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/units.h>
>  
>  #include <video/mipi_display.h>
>  
> @@ -557,10 +558,6 @@ static void samsung_dsim_reset(struct samsung_dsim *dsi)
>  	samsung_dsim_write(dsi, DSIM_SWRST_REG, reset_val);
>  }
>  
> -#ifndef MHZ
> -#define MHZ	(1000 * 1000)
> -#endif
> -
>  static unsigned long samsung_dsim_pll_find_pms(struct samsung_dsim *dsi,
>  					       unsigned long fin,
>  					       unsigned long fout,
> @@ -574,8 +571,8 @@ static unsigned long samsung_dsim_pll_find_pms(struct samsung_dsim *dsi,
>  	u16 _m, best_m;
>  	u8 _s, best_s;
>  
> -	p_min = DIV_ROUND_UP(fin, (driver_data->pll_fin_max * MHZ));
> -	p_max = fin / (driver_data->pll_fin_min * MHZ);
> +	p_min = DIV_ROUND_UP(fin, (driver_data->pll_fin_max * HZ_PER_MHZ));
> +	p_max = fin / (driver_data->pll_fin_min * HZ_PER_MHZ);
>  
>  	for (_p = p_min; _p <= p_max; ++_p) {
>  		for (_s = 0; _s <= 5; ++_s) {
> @@ -590,8 +587,8 @@ static unsigned long samsung_dsim_pll_find_pms(struct samsung_dsim *dsi,
>  
>  			tmp = (u64)_m * fin;
>  			do_div(tmp, _p);
> -			if (tmp < driver_data->min_freq  * MHZ ||
> -			    tmp > driver_data->max_freq * MHZ)
> +			if (tmp < driver_data->min_freq  * HZ_PER_MHZ ||
> +			    tmp > driver_data->max_freq * HZ_PER_MHZ)
>  				continue;
>  
>  			tmp = (u64)_m * fin;
> @@ -634,7 +631,7 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
>  		 * limit.
>  		 */
>  		fin = clk_get_rate(clk_get_parent(dsi->pll_clk));
> -		while (fin > driver_data->pll_fin_max * MHZ)
> +		while (fin > driver_data->pll_fin_max * HZ_PER_MHZ)
>  			fin /= 2;
>  		clk_set_rate(dsi->pll_clk, fin);
>  
> @@ -660,10 +657,11 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
>  
>  	if (driver_data->has_freqband) {
>  		static const unsigned long freq_bands[] = {
> -			100 * MHZ, 120 * MHZ, 160 * MHZ, 200 * MHZ,
> -			270 * MHZ, 320 * MHZ, 390 * MHZ, 450 * MHZ,
> -			510 * MHZ, 560 * MHZ, 640 * MHZ, 690 * MHZ,
> -			770 * MHZ, 870 * MHZ, 950 * MHZ,
> +			100 * HZ_PER_MHZ, 120 * HZ_PER_MHZ, 160 * HZ_PER_MHZ,
> +			200 * HZ_PER_MHZ, 270 * HZ_PER_MHZ, 320 * HZ_PER_MHZ,
> +			390 * HZ_PER_MHZ, 450 * HZ_PER_MHZ, 510 * HZ_PER_MHZ,
> +			560 * HZ_PER_MHZ, 640 * HZ_PER_MHZ, 690 * HZ_PER_MHZ,
> +			770 * HZ_PER_MHZ, 870 * HZ_PER_MHZ, 950 * HZ_PER_MHZ,
>  		};
>  		int band;
>  
> @@ -723,7 +721,7 @@ static int samsung_dsim_enable_clock(struct samsung_dsim *dsi)
>  	esc_div = DIV_ROUND_UP(byte_clk, dsi->esc_clk_rate);
>  	esc_clk = byte_clk / esc_div;
>  
> -	if (esc_clk > 20 * MHZ) {
> +	if (esc_clk > 20 * HZ_PER_MHZ) {
>  		++esc_div;
>  		esc_clk = byte_clk / esc_div;
>  	}
> 

