Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOqbEoX6jGn5wQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 22:54:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C61127E79
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 22:54:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED51410E65E;
	Wed, 11 Feb 2026 21:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hkjTW2GI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011031.outbound.protection.outlook.com [52.101.52.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD1A10E65E
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 21:54:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ifoZmc62oqIbNombdandg2hQX1JKvMyI8Al2sd3okEQZ0zd0zSC+BVFjL/WndZtgqbZhwr6me7JTdmPYp88Wc+2ZYYf9gXwbzQbBUONiBD5e39F2+1JIs92GlC4QttWiA5R+ZXTRKJrURVT3+K1lPgruDf9Ely4PMIBRGBALI2IXnD3e4FtKVxE49QyGX/zguCPujuigS6ZMlES3rasfwfNRC9OpHRlIGIJa5he+sEGLPPW1UMUbrj5LE/0G1mtzF59eVtVcX9vg9VYhLCc5Rjy8jStO69ptI4KYk9MlRGW0wvzR1v7PCxbi34iWcukT7PRbMfiwsYoxm2Od3FC7mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bNj9E0dXxhIyNybEjOA+T1W7MpFNt4zTODE19I4K1X4=;
 b=t1EzWOUFib0SKOyHluUIhuRJzP7PujBospznaBpeehssMyw64isucB9/iDBArUTtLjBg6wk6OhyVbRw32Jj5j60SwVDUG4pqztP7r5atzqqYxdWHHQp72NtaXR8aJCSMC1fHd/Th0zpLlqTvb/oMVTQm4dGxnrAWvN3HjYcXGP4rk1Ct2eYW3BBgvmruGRWNXcSpbPtFvu6Dmv9LaTqoePOWatvYQee7cbF/9ujha53Ll3OrkbqyXbsa46hiAJT6Ne4VaX+v3ROe26v32MnVCP2wUNzxIHYgd7MZrVvD8T+q5SVPqOI9ss/OgBzFIisj5AU57t7Cw9pmjHXRr5DVwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNj9E0dXxhIyNybEjOA+T1W7MpFNt4zTODE19I4K1X4=;
 b=hkjTW2GI6ti9rw4jRPdlWICZ3q+VTbz7XsSu4HeikkyP2dlSaqSLib12kENM8QPQAQkszM98stDOkVVhH0GTPVsSlH7rj2nHaVeCkWtk8GN/1gEBq0Ljh7X/uojtB5W5lWjmm8S3R+1g7eu4QNv9E3d55G4O9lmtpghHJYqHGk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH0PR12MB5679.namprd12.prod.outlook.com (2603:10b6:510:14f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 21:54:05 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 21:54:05 +0000
Message-ID: <44575547-fc1e-4319-b40d-12e73fafdd4f@amd.com>
Date: Wed, 11 Feb 2026 15:54:00 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Fix command hang on suspended hardware
 context
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20260211205341.722982-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260211205341.722982-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR16CA0069.namprd16.prod.outlook.com
 (2603:10b6:805:ca::46) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH0PR12MB5679:EE_
X-MS-Office365-Filtering-Correlation-Id: c714b4c7-ed0d-43bf-1fff-08de69b81372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YW4yODVtaE5UTHN5YzlGNzRQT1F1UTVpNUZrSE9uY3BjOWRPVGZteUEya3VE?=
 =?utf-8?B?L2N6MWFtV3cxa0liNTBxR2hoN1UvMkpZbExBK1hZVEtRRHRIYkx4QTg0akhO?=
 =?utf-8?B?bmlGeTAyWHNYNnUvUmVpUmRIOUFOLy9Iei9EV2ZJUG9XVnJ1cVllc2ZodC9i?=
 =?utf-8?B?QWFaeVNCRmQ5RlBicjEzbVl5WnI0ZGdxWC9UNmxIY3NwYUs1KzN2NXdRNmxX?=
 =?utf-8?B?YURsQWhUN0VScDVya0VkVEJiQXZvTVlwN0J3T0QrNmpBMTRTWE1SaG4vUWQ1?=
 =?utf-8?B?d2R2SzBUVlh5byt4c3lzRithamg1bzhtbjJZQ05TWlFXSkpGU0tURkFUL0Za?=
 =?utf-8?B?Q0pUUWRxSXQvUGpwaUppNVBHeS9iamx6cUVPOWJCMnRxL1JueXczM0Z1TFM0?=
 =?utf-8?B?eUxDdWRxQmpvT1E1TkJZdmhoS3Y3MDhUdk9wQnNkdVIxb2hOdGp1MmFiWXhx?=
 =?utf-8?B?bWFtekE1RVdDR2lQTDBKSHN1cklMWktYdGVzZlE1SVYrc0ZyeHBOYUJsS0Vq?=
 =?utf-8?B?eksrMVYreUN2bW9xYlVQWVd0bUhLT2NMekpyUW5DWTJ2L3J4aEVydnJndHpl?=
 =?utf-8?B?ZVhLWVowZEZoNGlzVUVtM1FuQ2RXYkdQRXppK3p2UVFXMXdFQmVSeitXNE00?=
 =?utf-8?B?L0ltL2RrYVNrNkp5SWFGUmcwVFUrVEllVXVLRTBGVUxvVGtSNWZWNTkvMkI4?=
 =?utf-8?B?QzgyTTgrc2tsRkJ3N2g5NkJldTFzbXZqRTVjNWRMRDlUTE54RE5mNTFQNHZq?=
 =?utf-8?B?OHdaZm5tcUFLYUxTTm95WFBNemVyM3AwRUZ0Y1Z1V09hNzJHUlowWVBQenlB?=
 =?utf-8?B?YVVnYnQ1S3NKQS9jSXZFeWhSazNkM3J0OGZiWEN4QXg5YzZ6ajNhcHVrendp?=
 =?utf-8?B?MkFNc1FzSUt1SVdSZDJnYnV2Rm1tRnJEZ2JRMTAwcGxEanFkelNVTTU3eGN3?=
 =?utf-8?B?U1ZWNmc3V0Jmcm1ad2tvL2dzRWNUemR5dVYvWmU3eUdoa2JuK3ZKVmdGRHNP?=
 =?utf-8?B?bmc5NjNzVXAyOE1EWElzU2tRUWhOcTlOc2JSeHZSamc1WEU0VW5jMlN1RHBJ?=
 =?utf-8?B?TFlsM1FDb0FVVldmNmhhbmVzU2R2OVkxQ0JsSDRmN1NrdFgyWnpsd05PYTlH?=
 =?utf-8?B?cjJGN1djeFRraUJjK2JBQUFPZlBXdFFrQmtkWVFLZlRFZHdDblVkREl2NGxI?=
 =?utf-8?B?MGsvelhHbnpiY3ZZUEVkb2MrU0Jmc0hNNm9QbXMxdmRuT0U0eDVTZ1hZR3l0?=
 =?utf-8?B?ZmlFUHY2NHlTRnZ6MGZ6SGZrRC9FVDZ2ZzAvSUNuOVhmd1dlS1pjYTJtaklY?=
 =?utf-8?B?NUhOVlZXemE2c3J2MFIyeTlaWFZ4T1F5a0VWS2pOSFJJRlBxaFg4VnN6R2dD?=
 =?utf-8?B?cmh3aVNhVjlFK2xEb1ZOdy8zVE13MnRiYkpPWW8raVI0ZjZwUERuRTdFUStV?=
 =?utf-8?B?OUhlVW5aL1ZIUjZBSXhydzIzcDM0dnNqQ3FmNlU5dzlJZnJqL3E4VUZyQWp1?=
 =?utf-8?B?eEg2MURCT1c5M2p6b2NWcW5TSisrYWdWUWRRNWhvbml4RmhKUWwwZXZXUDJx?=
 =?utf-8?B?b1RFc0Z1Q2laRTdjTXg3Y3N1TEw4NTNaMnZ3RGxGUnQzRytDZi9tMmV1UWta?=
 =?utf-8?B?dmJzNEdDbzY0N1hCSGUyWGY0UTFXdWIzT3BvcXdrejMyeGZCMktUdDFnWm1F?=
 =?utf-8?B?b3NwY0IvaFpKSTNYWnY1ZjR4SkdhWDdvOElBU3lCNHV3a2hSSFJ1MG5uZVU2?=
 =?utf-8?B?ZmNVZnNXb3dxaENwOXdlK202cXlTQUl2ejN4dDhDT212MEVBNHE3cVQvODlH?=
 =?utf-8?B?Y2NOVnFPMHR1dVdVZFRaTkIrdnh4QUtmUDJtdFRwd1g0T1BoSjh1d2xPVk1o?=
 =?utf-8?B?Um1uRXY4ZXIxdVVFa2o0c3NPa3F1R1RwM0ZFN3dIZnIxT2dscEhqUldYdVpD?=
 =?utf-8?B?NE1aUzZJMk1LMjMvU0pwODZGT1pvK3pBaHNhZ1RUREVMN1lJdlVHWmRyYUVR?=
 =?utf-8?B?U1l6STNOTmpqSDN1V1ZCUTU1c042MGlUQWlrVE13S1JtQm9HdGR0Vy9EZE9Q?=
 =?utf-8?B?K2UwanI2NE95NXJlVFd5UHh4dzYyQVFMQWNlREEvcU5zQ1NySzNsRmU5WUxI?=
 =?utf-8?Q?pLI8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cC9JWmxSQ1p6S2NsSDV0RnZXWWIrOUV1NGdEN2FXNUdIQ0VMYzhhZW9WSnY0?=
 =?utf-8?B?UUxQRTgzSENQaTBIem51Smp6dFl6VE53clM1R280cHFQbCtiZWJJQW9xNVdX?=
 =?utf-8?B?OHdZSFdtcWJmeVRhU29aQkEzbUsrZ0F0dnd2N3JqYkR5UUgyUzVjbmtQK2h0?=
 =?utf-8?B?dGVhS3k4Z296UFZqOEQzMDdjQUh2c1NpUm5zTkNsaGRlZTR3MmUyVFZScEY1?=
 =?utf-8?B?RXhmNGhIckJBN1pSK1pRL09tcGxna0h3clpGVlIvOUg3cHljSm12ZEtxbnp4?=
 =?utf-8?B?TUFVWStQLzVqak9XT0ErL29rZFZNSUNic0VkYkNPVkV2d3pPdEs2OUJvcTFr?=
 =?utf-8?B?QXFwYlMvMkttMFBndmJ4WVdnSVcyTmhNVXY2VEZWVGZnaXBjcUJLaktUSGp0?=
 =?utf-8?B?NUMwMkZvRk5OMmhjZVlKem80WS9kUmJmL1NVSFF2azdmbEdxb0dSaS8vUk04?=
 =?utf-8?B?YXd5UkJocEJBYjR0SElmckV0djdieC9OM08vY0F3VXBia0NWSy9OS2dweEZN?=
 =?utf-8?B?V29haU5SUFUzYXlWNWxUMDNpWFJxVzB1N25oWnlXR1lMS1RMNWxMMVJ2UG5a?=
 =?utf-8?B?eWlraGNrbFh4YWdaVk12S2Q5R3hWT2hGMFpzTWNXalp4ZktFOUhCWlRidWly?=
 =?utf-8?B?SFF2NUxUOUtXSWI2K24zS1FjODhiZVlZK25ReXJkTDUzbHRYZEYrQWo2dldu?=
 =?utf-8?B?cU8rUE8wLzJ0bVMvTEZPbm13TzhIaDlDNGxpNkd0VHZ6akFoYkZpdTUvaCth?=
 =?utf-8?B?cE80ZkJxcUErbHZzRUhvMGRTQWJMd3FPWFpOSUdDanpJcC93Q0Z1VmlNM2NJ?=
 =?utf-8?B?ZGw0aDRIOWVFaDFzaVpTTlZYWkxvbVR1dk41bUgyUk0xYzJMWXJVNXdmekVt?=
 =?utf-8?B?bThDK28rTEw4a2poQTlPUHUxRkxucDBhS0pnWEN3bnVqSE9PQnpUVnhYUVJr?=
 =?utf-8?B?cDdvdlhFMy9JNTg3MytqbVpxckl0TlMwOUdrNW1YakhSL2FjYlhRQ1dOMmVR?=
 =?utf-8?B?bFNWMlZaQnB1eS9Yb1FhY2JSdEswOGdtQmVHMjltZ2JtOUltZE9LQ290aWVq?=
 =?utf-8?B?cENveVB1ZWlpMFQxemNDVG9nMmVMRGFaQ25kTy9RTCtUc1M1aTRmK1BwbWlz?=
 =?utf-8?B?bFJzSHU5WDdKYlRUaE90TWhLcHF4VHJIa0JxZjhwcFNLajEzNnlRb1djQ1NS?=
 =?utf-8?B?RG92YUZOVjc3ams1Q1dmMHN0eVB1TGhkL20xRjV2d1FTYkFOSkJWQVYxaVFZ?=
 =?utf-8?B?RUN4WkdPYVNiYVhzWXFvVEJaeVlKVmUvc2hSMkNPckhXS0ZCUHJaYnI5L3BQ?=
 =?utf-8?B?TVNLRUxUUFBEcEs2bkZ1Y3VxOVlIdk8zZ0hvRjA1WE1Cck1naThGSTJheFh4?=
 =?utf-8?B?YVBwOEhpbklTelJoVkI4VGliR0I4T2F3dHdESU11ME44SFd6TVdkSE04TE9X?=
 =?utf-8?B?VnhCLzJhT0NEK0ZPQnNJREVHeW9BQjBTZzYyekZQbkhKOUNmVXE3L0w0cDFw?=
 =?utf-8?B?K3J6SkJoVU1pdlVkSHFCY204NThUWC9LWElocU4zQit3azBMRldpN3dJVGlK?=
 =?utf-8?B?aktYSzZvZ0NDbVBBcnJaR09IN0R4ekdscWhxQkJRV0xDMStBZlMweXB2SXhO?=
 =?utf-8?B?R25mdUc3WFJOcVhoak56SVltUFVzYVRhOEJZc2dka2ZZdVg4QkU0TjBhZU1p?=
 =?utf-8?B?ZlNSOEt5TUt3Qk9FekFTTEEzVm8yMklxeXE0QW9aY2lZVVN2TUIvd2k5NUM3?=
 =?utf-8?B?d2xUQWVHWTlRZjJCeFdXSDUrb1BuaFJlNU02NVJCcWROUDJpeGZ0RGtqS2Jp?=
 =?utf-8?B?TXBlTWpDNi9JdW9TUmtGS1Iybm9vRUd5TDlVK29Bb0U1b253cktsbWp0MFZB?=
 =?utf-8?B?OXM1NFgwd0ZxYzdUVnlpQ2xITWhJVU9JYWVjcjhIWk9qVW5QT3VvTk5Ma3cx?=
 =?utf-8?B?TTBrZnhxTTZNV2tTdEVjYnlZL3hUcWw1MDdiOTF2ekhQVjFjTjQvWEduQW5S?=
 =?utf-8?B?ZWg1R0x0L29pSzVUMGw1c0FTSDl4V1lGaEVxbUh0c0w3d3RoK2NNUGFnZllE?=
 =?utf-8?B?VkVHWWtHQnd2Z0VhSU8waStMcHdJdWFoTzcxdktFdVJZQ3p5L29SMmxiSHNv?=
 =?utf-8?B?a29XLzF2UytjRFA0dHVlajZkeXJETnc0dGlwd2lqWUFJbUhZK1JHRzI3b1Jq?=
 =?utf-8?B?eHJqdEJNWFhrUy9ZaFdzb0UrSVZwc2UyZkJCZE1yTGQ1QnZhUUNFV0ZJY0JP?=
 =?utf-8?B?b3FYUThDV3A2VVV2ZGVIQUNHWkczV25ORG9HRzhCTWEvTlU4OE92MW5qTnBp?=
 =?utf-8?Q?19kqmVoJX+U4OwmEJk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c714b4c7-ed0d-43bf-1fff-08de69b81372
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 21:54:05.5655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oD5Z/5fU2DYtYJrOAhGiKk8LX5Rx6gBep/FOBys2CZjsnCs5Q+SkEQ1R9tK+R0UBOKACAnGIh0vSKj+lAWac2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5679
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lizhi.hou@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A7C61127E79
X-Rspamd-Action: no action

On 2/11/26 2:53 PM, Lizhi Hou wrote:
> When a hardware context is suspended, the job scheduler is stopped. If a
> command is submitted while the context is suspended, the job is queued in
> the scheduler but aie2_sched_job_run() is never invoked to restart the
> hardware context. As a result, the command hangs.
> 
> Fix this by modifying the hardware context suspend routine to keep the job
> scheduler running so that queued jobs can trigger context restart properly.
> 
> Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>   drivers/accel/amdxdna/aie2_ctx.c | 18 +++++++++++-------
>   1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index 89c0ab896f92..622ddbf7fb6f 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -53,6 +53,7 @@ static void aie2_hwctx_stop(struct amdxdna_dev *xdna, struct amdxdna_hwctx *hwct
>   {
>   	drm_sched_stop(&hwctx->priv->sched, bad_job);
>   	aie2_destroy_context(xdna->dev_handle, hwctx);
> +	drm_sched_start(&hwctx->priv->sched, 0);
>   }
>   
>   static int aie2_hwctx_restart(struct amdxdna_dev *xdna, struct amdxdna_hwctx *hwctx)
> @@ -80,7 +81,6 @@ static int aie2_hwctx_restart(struct amdxdna_dev *xdna, struct amdxdna_hwctx *hw
>   	}
>   
>   out:
> -	drm_sched_start(&hwctx->priv->sched, 0);
>   	XDNA_DBG(xdna, "%s restarted, ret %d", hwctx->name, ret);
>   	return ret;
>   }
> @@ -297,19 +297,23 @@ aie2_sched_job_run(struct drm_sched_job *sched_job)
>   	struct dma_fence *fence;
>   	int ret;
>   
> -	if (!hwctx->priv->mbox_chann)
> +	ret = amdxdna_pm_resume_get(hwctx->client->xdna);
> +	if (ret)
> +		return NULL;
> +
> +	if (!hwctx->priv->mbox_chann) {
> +		amdxdna_pm_suspend_put(hwctx->client->xdna);
>   		return NULL;
> +	}
>   
> -	if (!mmget_not_zero(job->mm))
> +	if (!mmget_not_zero(job->mm)) {
> +		amdxdna_pm_suspend_put(hwctx->client->xdna);
>   		return ERR_PTR(-ESRCH);
> +	}
>   
>   	kref_get(&job->refcnt);
>   	fence = dma_fence_get(job->fence);
>   
> -	ret = amdxdna_pm_resume_get(hwctx->client->xdna);
> -	if (ret)
> -		goto out;
> -
>   	if (job->drv_cmd) {
>   		switch (job->drv_cmd->opcode) {
>   		case SYNC_DEBUG_BO:

