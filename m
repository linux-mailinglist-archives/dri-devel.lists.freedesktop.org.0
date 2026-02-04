Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MI2iDp2Kg2lWpAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 19:06:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 908F7EB61C
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 19:06:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B343B10E726;
	Wed,  4 Feb 2026 18:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Rlk+DMI4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011058.outbound.protection.outlook.com
 [40.93.194.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A3FC10E726
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 18:06:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KK1d3z2HxV5WlcaQPRp/agqN/B7udZuBJmSVXukA8Cdcmzoj6xu3JZ4IwpYPkR2dXuQL3Y0b10kSC3+mNjyoVjU2oct38UTlyD4aVqFW1eFOKQxbvrNY7TPCNE5QFFrFl/4nxPfJlf57cn0UXQywN4z17Ume+HczMEgabUifMW1kQLp9/B7bqGDKlORQRieX9IGLw6QB9HItmYCqFH4sb+QbSJ0GX51OYz4lzUvTP333fyJMwzU0z8k4JQ1FTwj4dwaK+fl+3LuMTXFAwBWuMrRDjk/Jp5ggFc6auPkNpl23AX0cKEp1WnicUanjzIVx0U3DaIXdOGSTawx3W+xEQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSptVVg6epe/nmHuBs5xkRGJhhyz2MVByGwxzIbh5Fs=;
 b=kh0tqYO672fqRT/SZV0v6nCOekaYGhglin4iUeWrZJAjw6EMBidQqrOwMApuT289KXPzjrPS3lzG/3pnMCoLwm5ui3W90knySBWHZBXOOBFcCfqUx9CqWtXgg7zumyGABsNzDR9XjOBmpknSQfQK+qSyFyzVQ2boo3Hpy48vN6m88Yle0DETgoUE+9v6a6yGRplAHJVBqCJkeBI4QmrY1nPV4u51sl9xh0HYcwqDvqFr4ah9ZzC/Sn9z2M8B+NuTYde61yFlyLxUvbqdHokaimZO2EUgCELmoNM4fxhH+w5Rmpbe3yM+Tm6u8psuxye02r1KV/v24rA7IdQAejigbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSptVVg6epe/nmHuBs5xkRGJhhyz2MVByGwxzIbh5Fs=;
 b=Rlk+DMI4x+uWiHKHYKdoEBZGGXuoctaIKWJWavRuTLN92jAkGMDCDGDb8ma9Fr1yj1ivjBMWyuu+C4lyCr+l6L5OZnyszldBsXKuuq8d2iREWwmOYcOMvx1WqKoyamEvl3HRsO3wzos8JaP59bkwo7MBc+p97yruoKb+6CH38uQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB9078.namprd12.prod.outlook.com (2603:10b6:610:196::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 18:06:11 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 18:06:11 +0000
Message-ID: <ced38713-6bda-4fa5-b2d4-776e2d6bcd9d@amd.com>
Date: Wed, 4 Feb 2026 12:06:07 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Fix incorrect DPM level after
 suspend/resume
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20260204171048.3165580-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260204171048.3165580-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0100.namprd13.prod.outlook.com
 (2603:10b6:806:24::15) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB9078:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fc7c5b7-fce6-4719-5d6d-08de641813da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amJTTm9oSWUwa3ZFUFY3M2QzZ0swTDRRTm5pd3VWcTErODZYM0x3L1U0cnZn?=
 =?utf-8?B?YzRzZ2tBWHAxeTRNbWQvVzVlNFo0dnVRMk13VE1WK0ttd2E3TVByazUxUmpE?=
 =?utf-8?B?a3J0RWlqSUN2cVdoYlZXTWZHL2pVLzdTdldqOEFoRUptcXpuaWtUUzJZcUd4?=
 =?utf-8?B?dk91b3MvcjhheUk5WFE4VTkwU0ZoRWFRR0J0Sm9EZlBHS3hJQzdBS3ZySHZl?=
 =?utf-8?B?L1YxczZHenZFRDcrdnRBMjUvOHJXMjhmVms3Smg4TVdtc09iOFNsL0pjbHNy?=
 =?utf-8?B?NWh5ODZIYlRSZGl3clFVNEZyakFadUw3SUcxRFpTZElrTmpPQWRlUmZ3c2NY?=
 =?utf-8?B?TVlFK3BUdDJPSTRMd0MzandwaHBPRnVESXo4OFp3a094YlJrQ1ZpKy9EUDNk?=
 =?utf-8?B?ZU9renVpSEhnUEhMdUFOYzIrR0VFR1VIVXJ6dzRPTjFJSFVLZmFRTWJMRFht?=
 =?utf-8?B?UlRRd0gyaFRMelJhVGFzY0I2dGpMeGoreUZVUWdZZEVLUDdPSk1TQW9aQTcz?=
 =?utf-8?B?ak1nR09LSVNuMkE0UlUrdmZHMWt1UHZxMlNoVVJadE56VXdoM0lmRDZxek5k?=
 =?utf-8?B?NGRrVDZHdmxLdHdRMEdwWG1saHN2WFpWUmRQWG1TZ0ZnOEFSS0R4ZmhwRjNk?=
 =?utf-8?B?RUQzRjlnOWZwKzkzVnRZZXBsbmJPb0hsc1U1aSsyUWNmb3grSWtDOHBtdWtu?=
 =?utf-8?B?bWxrKzRNNmYzYm9yVVhYM3JxSTV3TFR0SnZ6Q0xsTGYyVUxRWWREcHZtcjZC?=
 =?utf-8?B?elRsTmNKZFk5b2FNTGFJUXhOV3RnTk45UW9TdHNEc0s2TFh6SU5qenVlVlBw?=
 =?utf-8?B?WVJ2S3dnTVYvSVg2djRKWjR4OU1ZSVlzeUdHNmtMdEk2VWFEbmhod0Y5UFZi?=
 =?utf-8?B?YWJwOVRCUDc1UDVsdWRZY3pSZzZVNTJaa0x1MDQyM0xjR0pOKzVrOXpQSkpJ?=
 =?utf-8?B?VGxZLytZWkRtNlN5Yktwbi8xNFFNbVh0RWhiRTRkZG5zRnV0ckE2eDVFTDZE?=
 =?utf-8?B?TG9oT3pnZ2FVWU1aemsvb21lMzdIdnd0Rms2V1doYWVYeHlLRWc2TlV3MTV3?=
 =?utf-8?B?OVpzY3p3b21kV2dWRGdMT01pUkU4WnJ3NmR5bklEVDZueDY3djk2eERPUnZR?=
 =?utf-8?B?ZkJHRk0ySnVKMUlUQTB5Wm9JUHFsc0FFUkQ3dURCak9Vb1N0SVV6d21HeDFh?=
 =?utf-8?B?bzZBR3dhYVhJYm84VzRYYjJ4dy9jOEtmalZZUXdrd2RnUFlMZHFYdGJpN0lx?=
 =?utf-8?B?Y0tWN2lFdjQ5Z1UySWp1TlJpaDJRMjBnS1dkbHQ4LzJ2Nm01VElIQVdGTVpF?=
 =?utf-8?B?NGlGd2x1c01xNlJpVzM3L1hVcXV3a09CZ0NFeFcycXlwK01MZ0pkOUxwOFVG?=
 =?utf-8?B?YkJKUG5XdzhIMEZVME51Zlo0ZkJseVhCeEE1YWJES1NGb1ZvV0FaaDRnSWth?=
 =?utf-8?B?TVY2c2VXdTdvOTBtU3U5N1Bybm9JelAvMWRiSVFYVzZjdUdJcWMvU1hISisv?=
 =?utf-8?B?b05hWXh5NitlVG5iOEIzd2swVnBweVBDbHY3TjdLSmNkU3hhMVRib0liZWxY?=
 =?utf-8?B?eEdKOG1kMmp2SmxBQkRQVmxKOGo4eThpUnlIenNWdVAxeUg0ZVNuN3VScWJX?=
 =?utf-8?B?aVcxbjh0VkJrY2V4eHpLZm1FenNPUUZGckI5M2kzMUhmTDM4eHZYbHRLUjc5?=
 =?utf-8?B?dUFLc2NjT2gxQVNNUFd2emhzMzRaQ2o4R3N3dXkzTGI1ekQyS3FnQUVlVEo1?=
 =?utf-8?B?Y0ZOWE4xN3BJdEU3cmJCdlVPbFg1bmZWazc4VUFham9DSmdKN0crTzVvRXIw?=
 =?utf-8?B?SjFWSlpkU2FKVHpUZzdGYmN5VjZWd0dYQnNnTWRsNDJQZlhBZ25yeDlXY1N6?=
 =?utf-8?B?MlZKOFlwTWNuUExzNnVvck5zOVJCTUJsbmVsc3I2ZmcrOUY0UGdVK0t2MlBy?=
 =?utf-8?B?anljb3JJQ1h6OWg1TGg2c3lyUkZZYUhsMmpNK0Y5UTlLeXFJdjZOaWNzVXlR?=
 =?utf-8?B?WlJ1YnFaQkxTbFNjekxiYjBwUnJVc3FhU1cyQU5PSDFBd0hyRTYrQlc3OW10?=
 =?utf-8?B?bDB4dStKTzdTM3QwMWZPa3Q4djFtbXEzV3AzWk5ZRzhncmo3WEhyQjBsMzlY?=
 =?utf-8?Q?Eycs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzBPTTZrTSsrYitOZllBUHV5bDBXWFBLUUxJV3Rra2FQYzlLQ01hTFljZ1NN?=
 =?utf-8?B?Q21ZRncwdkovNmJzS2RJZkR3Z0VzOGRHb2xYYmg4QzgwVEh0cVY5eXAyVU01?=
 =?utf-8?B?Ny9kZkRJMXk1d1pMRE0xODIzRVBKQXZPa1BKZEhHNDFXdVNicUUvK0JyZXlL?=
 =?utf-8?B?MldFQVZtSVowb3F0TUFTZ1d5OVJEdy9aQ1lPWkpDTjVJMTJVbWQzRitLYWo2?=
 =?utf-8?B?K05SMFJmSXhVYWlEem5XaE1CRHZWcnNkd3BvVWJRZUlmTFFpaGp6dGpya09j?=
 =?utf-8?B?VnluaGRxeHVFTjU0ME5SVnlMYnZpcnNwakdSN3lVZ003WElQT28ySG9JcWNV?=
 =?utf-8?B?RFRIUGNqUnB4K245RldiVmhqeWhiZXFIbFlLRVBkeTlhc2x3dVBhMW1EY0hx?=
 =?utf-8?B?MG5pNjl2UHhIemJxVU9zdWJYMmNKeTBJSG5ZcHYzVEMrMTYwSzZoWjd5c0g2?=
 =?utf-8?B?dTMvMy9ZMmYxa010aGxhbC9ocnEzakRlNTcwWUYrY2pOaEwyZ2ZMaDRFZGpx?=
 =?utf-8?B?SDdjRFU5K1FWVUZJWEVNRWtLWDdoQ2pKQVBtSTc4aklYbGtTVGhOdXVTZVJT?=
 =?utf-8?B?MWVRcGtNd0VLS1VtV1hYSC9ET0FpYUlIM1RjRCtQODlJNUxEaTdHNDJxczRJ?=
 =?utf-8?B?dDdrcnRLZkRabVpPZU5OS2JTaFQwOTdwSEU4TEkzTEdWcklWQ0xsdklXTDFC?=
 =?utf-8?B?N3dCbVlqWkM2QTdWWHFBYXd4WlpZV0xEQzlweGxZZG1KSXpxb3AydjBIeDkr?=
 =?utf-8?B?b2loSmxJeDN1SjQ0Mk9naWZIL2VNK1NpcDNqYVp2MURtTW94UUNnQTBaeTA4?=
 =?utf-8?B?YVBCVk5TOXBUaFl4eGRZR1BIRVVnVmZTVVFqTUl0dUd6QWc3S3B1OUxSWllP?=
 =?utf-8?B?VlMwcVZmYkl4d1BmTmc5b3gzUUFjRk5XdlUwbkRFOXNnbkgrQll2NjgxTGJv?=
 =?utf-8?B?ZlFlalZkbkhLV0VRSGhlUFJlV3RZeFZJOW0wUEt4NDN5cWhOMnhEZnZpVEVq?=
 =?utf-8?B?UHBXQTFydnhSWlJxOVFlT3NRMEN3cHN5WDMvcGd0eTRFZnpkcU9rM2xkYkQ1?=
 =?utf-8?B?N25FM2IzTFh2THdzL2tzdFZvbTRIVWRUcy90TGZTdnhEcUl6VzlmeFN3eUJH?=
 =?utf-8?B?bk1XeTRySDdtVzNmZlpKa2s3YlVxb2xOZDVoOWY3VUt4a2E3NHVhVWtpQmlZ?=
 =?utf-8?B?THVFeENCWUVKZmY0RkhBYTV3Zy9sVzRqVjhXL0tVMTVEc2pCcExXRTdram1q?=
 =?utf-8?B?cW0wSUhQMS9SRXhSZzBRckllYkpaYWk1ZDBjY25QOTJQZWxhU2RtcXpKZGlP?=
 =?utf-8?B?ZkgxYVZwTE44SWJCNUhBMlY3S29QeUtOUHB5WXJya1BpOFZVQ2EyNUNHSmJB?=
 =?utf-8?B?T0VNU1FQOGZETE04dmZNYmFTckxwQmVrTktpblNZVVAwQkt1anl0V1c5TDZM?=
 =?utf-8?B?L1ppTzJ4L0NkOHNkVDlTU0VEaFFXS0pWUGVkckQ5ZStVUDdCY05TK29tVG1S?=
 =?utf-8?B?NVY3bTJjeGI2SCt3VFY0QXpxK1dOWnpob052TXM0SVZPN1BhMTJQMkw5c3R0?=
 =?utf-8?B?NC8yYUpoL1hwR3NqUTF3R3lKQWQyWEpWRk9QaDByTFU1b1daalh2SWI2VHdU?=
 =?utf-8?B?bHBGRGpEWDFnQW5NSHBMQ1VxVm9CMWt1djJIVDdpYS9HbVRBUVBnV1JTOVY4?=
 =?utf-8?B?aWs0aE94ZThHUXdQNWdrc2kveE1xMXArdjVNR3lXQzB0dlZVUVozUjdkU3Rx?=
 =?utf-8?B?ZDd3MGd5eFU4SHpsdE42OXd6Q2JvWW54bHgyd04raHQrWmZqMUR6ZUhnUUJt?=
 =?utf-8?B?TDJ1cHhrM0NGaURmSGVwMkNRWlNJSE5ucGVUc1pTMWZLcWRyWGludlBWU24r?=
 =?utf-8?B?ZDcrUEdxdWlFb20zd0hJckRZN0lPMWNsZ2hrOUlYS3VKTk9aUDc0MVYvd0JW?=
 =?utf-8?B?cTEveWErVWhienRTbGxtK0oyY1hEUGFVdjl2dExjZnFvcXBmS0xXUVlVMm9P?=
 =?utf-8?B?aHd6YVBLMk52cCt3bm5RQUJrZHVGTzhhRnBXTlNsMGR1M0VDVFZyTGIrL1NR?=
 =?utf-8?B?ZlozSnpIVUFTR3R0RGpLRDE2NXh4clp1RFpTelQ1dEhnRU52MmZJRVlsc3ll?=
 =?utf-8?B?R3ZaL1luVWN0eG5TSmRLN0czT1p3Ui9LU05nbnkrTTh5YW5jbVkyYTFaVU94?=
 =?utf-8?B?SnpUMXZaNmY4a2svbGd0V2o1Qnk1M2tKRkpodTI4Z3NRK0JxcFFmTFBBQ2VZ?=
 =?utf-8?B?RDY1UnJvMkpaMGl4ck00eGJWbU1XN3NldmE0YzVBRnUzMzBGK0JmSXZ0U0ZT?=
 =?utf-8?B?Z0lTc1U4c3NJQjZIdmpnMC9HcWRtMkJhS3RUMWJ3eUNCbkN0ejUrUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fc7c5b7-fce6-4719-5d6d-08de641813da
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 18:06:10.9795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ce6Fzqt1EIYypSPjYRavw6dN+hMeuDyfkgaK464hHe0MSLhtF+4Es559YS5KGSYuoJXflclQoQR/Mlag04/FFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9078
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lizhi.hou@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 908F7EB61C
X-Rspamd-Action: no action

On 2/4/26 11:10 AM, Lizhi Hou wrote:
> The suspend routine sets the DPM level to 0, which unintentionally
> overwrites the previously saved DPM level. As a result, the device always
> resumes with DPM level 0 instead of restoring the original value.
> 
> Fix this by ensuring the suspend path does not overwrite the saved DPM
> level, allowing the correct DPM level to be restored during resume.
> 
> Fixes: f4d7b8a6bc8c ("accel/amdxdna: Enhance power management settings")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>   drivers/accel/amdxdna/aie2_pm.c  | 3 +++
>   drivers/accel/amdxdna/aie2_smu.c | 2 --
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_pm.c b/drivers/accel/amdxdna/aie2_pm.c
> index afcd6d4683e5..579b8be13b18 100644
> --- a/drivers/accel/amdxdna/aie2_pm.c
> +++ b/drivers/accel/amdxdna/aie2_pm.c
> @@ -36,6 +36,8 @@ int aie2_pm_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
>   		return ret;
>   
>   	ret = ndev->priv->hw_ops.set_dpm(ndev, dpm_level);
> +	if (!ret)
> +		ndev->dpm_level = dpm_level;
>   	amdxdna_pm_suspend_put(ndev->xdna);
>   
>   	return ret;
> @@ -65,6 +67,7 @@ int aie2_pm_init(struct amdxdna_dev_hdl *ndev)
>   	ret = ndev->priv->hw_ops.set_dpm(ndev, ndev->max_dpm_level);
>   	if (ret)
>   		return ret;
> +	ndev->dpm_level = ndev->max_dpm_level;
>   
>   	ret = aie2_pm_set_clk_gating(ndev, AIE2_CLK_GATING_ENABLE);
>   	if (ret)
> diff --git a/drivers/accel/amdxdna/aie2_smu.c b/drivers/accel/amdxdna/aie2_smu.c
> index 2d195e41f83d..d8c31924e501 100644
> --- a/drivers/accel/amdxdna/aie2_smu.c
> +++ b/drivers/accel/amdxdna/aie2_smu.c
> @@ -84,7 +84,6 @@ int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
>   	}
>   
>   	ndev->hclk_freq = freq;
> -	ndev->dpm_level = dpm_level;
>   	ndev->max_tops = 2 * ndev->total_col;
>   	ndev->curr_tops = ndev->max_tops * freq / 1028;
>   
> @@ -114,7 +113,6 @@ int npu4_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
>   
>   	ndev->npuclk_freq = ndev->priv->dpm_clk_tbl[dpm_level].npuclk;
>   	ndev->hclk_freq = ndev->priv->dpm_clk_tbl[dpm_level].hclk;
> -	ndev->dpm_level = dpm_level;
>   	ndev->max_tops = NPU4_DPM_TOPS(ndev, ndev->max_dpm_level);
>   	ndev->curr_tops = NPU4_DPM_TOPS(ndev, dpm_level);
>   

