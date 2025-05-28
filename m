Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF08AC70C7
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 20:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D67410E66B;
	Wed, 28 May 2025 18:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hFHaPrFA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5578510E66B;
 Wed, 28 May 2025 18:14:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vCTCSFCD1qUwQ6Q1tU51mYVrTQVuHBgTBV1INnaqFExYW7lXiueebi0mlTZ1y15C3wBY3ltyLIuCLVnLoDw65rmKJExFXUGY8wNAtvc+vPnNprvIaodHn4xDUSoDJDmz8ntSxpqdDaYHGAs3EJNPQri2igjhWIfQERJUuosi4m109rshrOv9ZJGP+sVUUJhTevl1c5MdtMese+tR1cG4eGf/B17QOTRAMPtuXmMLurKKFfExCbaAT67pM6yzEns1hfeW5+IbQEsUeVI9Pl4pC8KoN8cgZ6OlHEZAe21bkQe5R0CsWqE1TO6dzyU3BXU0Lmwf1MGxSoV6MH3Pf2LaVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNafXgoF+gSlpH5I3Z4l0Va9lFm/vQC2ugBWXDhO9M4=;
 b=fEkO+SSVqp4OINptfblLeV9oRxNYTbBtWNBowdQZxrBPN5k8tXrG8PraEwsGU+VdViuJaS9Fs+8q35aU3QcTeKp7ot9h0F0Sk2TaUVyqCKbcCJZaXPiS4JQyXO+DkjOaTD5cII8GD/LSsNgdXbgD8HcqctGeCatMA7e737ZwZIWsk7UDuzmxTsrERyc9sRZh1MAMV5NF/M6UlRCNuZVDe7dfpTsME0Hre45huefFG5oJjK4l0n2fMY06gDzzfyp/eJyyowoY/hjtL2c9hmVPd2yNihnDpWnHqe962Axe3Ai3DhcHcHWdQX/6qd9QWhZ28oIjDXP29E5QqxDnVmieig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNafXgoF+gSlpH5I3Z4l0Va9lFm/vQC2ugBWXDhO9M4=;
 b=hFHaPrFAEVU3gyHDR9sb+5acC/ZAdYQ/NEZqdg5yrGeY87fHXhZRM2Ns1ce/Erk8fUh6o5+XyPc8lzOmTvpkGfxh5yBvHFBSByNeeeH0QSj+nIZYzAwrn8egNUvHnQxvNKjtbSQEA/Vjw+cH+RJ7cTCWCe1hxUUDoKHikUHoWtE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by IA1PR12MB8286.namprd12.prod.outlook.com (2603:10b6:208:3f8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 18:13:58 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%5]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 18:13:57 +0000
Message-ID: <5037ece7-56de-4978-b255-10ccd8b6fa11@amd.com>
Date: Wed, 28 May 2025 12:13:55 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/amd/display: no 3D and blnd LUT as DPP color
 caps for DCN401"
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mwen@igalia.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 siqueira@igalia.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, aurabindo.pillai@amd.com
References: <20250527170605.1979462-1-alex.hung@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250527170605.1979462-1-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8PR20CA0009.namprd20.prod.outlook.com
 (2603:10b6:510:23c::23) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|IA1PR12MB8286:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dcac786-0798-4ced-90a6-08dd9e1369f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDhGZjF2emFucjZkSU9RWXF3enY5a21Ya2lqNW4xaEs2d3FmYUxUSVV6TW1Z?=
 =?utf-8?B?V1NrcUVXSEFEMGxzWVRqT05DVUFJaXNrUnFpa1B0eXNnYlJmVGFteDh5VUMz?=
 =?utf-8?B?K0h5c0ZYUDNCdi80bkhkS2RJZG9uMm1DNmQ3aVVTZmd0dkh6S0Jpa0NhSFhm?=
 =?utf-8?B?N2JKdHNRcUZRN25rZ2NZUm5Yc0JnazVIZmhIanhIck8xK3d0bzlhNzhjK3JR?=
 =?utf-8?B?RFFVZmF2a3FuRXlFQ2dGVmEvRVFMdHJUSDF6U2pRMWFsaWluemVsSjl3dEFy?=
 =?utf-8?B?ak02dE1sNnJEU0Q3RzJLRm9GdW1ndWJHRTBTcFI4YXhrRXJSZldHQjFTeVl4?=
 =?utf-8?B?T1FMRTczdEllNkVCZzdoN1M0ejVIdTJ2aFFLYTlNNHVKQ0I1a21hQ1RyVFQr?=
 =?utf-8?B?U2N0UFkwcHpxOS95NE5pQWhtbjBoanl5YmtWOW4wZUd2U0ttbFloZW1ibGMv?=
 =?utf-8?B?ZzRpcDUySjR5Mnh6NEt1UU13YmZtVjZkN1lod2p1LytUMllRQkRoUXVYcUNt?=
 =?utf-8?B?VWI5bUxYS0lha0M0WkNjWm1ZSENZTkRSTjZRQWtrYVk0cWVlK2I4OTdreFZI?=
 =?utf-8?B?bEpBdzkxWnlZNVRBa1NQNERGR1dyNUxkL1NVM0VjM2hmQk5ndmdINFIwMkZK?=
 =?utf-8?B?SXRuSU5LclduZlA0SytRWVBvYVRhdGh6bWE3L2dMK3BDTklieVJRdS9RQlp1?=
 =?utf-8?B?Vnl4TE8ybHRaYXI1bEdMVTdpL1AzalBDR0ZNeVBzK3orOU9WV3VQanlRenhH?=
 =?utf-8?B?QzNsU0piZjkzWWcwMXVwWHpzd0kwcTRCMUE5SVlIT2hlRnNsckpBWEZocVlV?=
 =?utf-8?B?ci9OUU5KMmpCdWRKVG9nZWxxWkplcW1YNHY1bW5wWkhqczFhRG5wN0MzVWRK?=
 =?utf-8?B?NFJXR0hxbHh1YkQyTHQ5SEF0WFN3MjRwNERIR0R5UnJSd1pDRURUZGN0Z3FT?=
 =?utf-8?B?MFZCUmxyTmFQREQvWmVlcTFtKy9vU1piT3RSUmFiWlRyb0dJQkNaRlhRTTFz?=
 =?utf-8?B?bHgxbUJlU090S2NlQVdXYy8wcVZkb0RNVlJHUnRhSTl0RkFLdzN2bnVRcWtC?=
 =?utf-8?B?R1BFcWY5T25BMVlieEV6NnRsL2xQSXZ4L3dXRXlTeFhObTBIQWJ2TGRzbisy?=
 =?utf-8?B?VjZYWS9YWDBwSEw1UW1TOGt6bk44NmtUcVRnbmowU1o5SWY5RkFCYUtVb0h0?=
 =?utf-8?B?dzc4dGszY3BsUnIvVFBadlovYTZoZVFVbGdGYVN4ZlFLVXpvcklSUXAwRzQr?=
 =?utf-8?B?cjlscDVyL1RDWWpEeUtnbWVCQjFwd0MrN2NGVTZZZGp2bUVQcGRtcVhMbHVj?=
 =?utf-8?B?UCtjWnJzd0k1cGkxaldRZGpQRVhidXFqU1hKVVRWQURGczBqSnpNMnU4emxj?=
 =?utf-8?B?U0E3cGtKcHMrNnJMSmpXMlRQOXk3VVVUZFMzMGdic3NMV0dZV200QnNvTmNH?=
 =?utf-8?B?VCtJT0JNLy80Zno1T0Y0ckhGNE40amxMVHk1UEU0bEdNbVRBUXdtbmJpeU9r?=
 =?utf-8?B?T3F2Rk9UUGVMQ1ArNkZOTTcxaVkrTmZtRlNtUmRuc3dHZklQeHZ2bDZqUlpm?=
 =?utf-8?B?aVpHdlozM29kWStGMDd1Z3ZUUloxcUxhN2IxVEVMZmMvVDdxQUhmcXNINExw?=
 =?utf-8?B?K0doa0Zkdm5kYUNhTzgzek5NaHJ4RGZmTGlLK0pyMVFhRlBLRFcyWE9IMTRW?=
 =?utf-8?B?YUV4QVNPK3k1TlJsdTRSaW00NFVsa2hUUVJLVnp4bnpPSjVGTDYrVXdta2lv?=
 =?utf-8?B?R3lOS3FrelJhQlNYek9XUmtaR1UwREQ4bnJuTkgvSWZWWDJwU2R1a1FBUUFk?=
 =?utf-8?B?QkxJVVJRN2ZoZStwYzFFZTd1d0NwN2x3d095c085UVc3NUhmVW8xNE1zcGhE?=
 =?utf-8?B?SkJKOWNiaVB4L2Z6WWRDWlRjaEJ5Q2k1Y0dwV0RWem05L0VONVNpcHEyUHA3?=
 =?utf-8?B?MDY4QWJUUFh5ZGJzSTNwcm9ST1U1RkRkUmUyUGwrQWtMWU1qZVNCVnF2SEV0?=
 =?utf-8?B?ekVybDd0SUVRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmZFMWlOY3FxdzY4em0rVVdNdXBwVUttTDlLVS9POGNwVW9oMUxLRnFYSlVu?=
 =?utf-8?B?dklRSkh2amlaOEZvRkFXbDB2U1JQdU5neXVKa2xFVnpWZGgzOTR3Zk5jREZL?=
 =?utf-8?B?eDNxaHlVdXp2Nm93Z3V5N0FPd0VlV2ZJeVF3M2JHdW83THM2a015MVZzVmpL?=
 =?utf-8?B?NDNGVGZuTlNTdG03RHdyTjZrYjZSL2R1Vit0ci9FRk8wOTdadTV3RkZJRHda?=
 =?utf-8?B?aS82MW1URmxsa3pRRXk2Uk5Ud0pYdTFXR2RFN2Y0ZTBGcXNtR2RZYmJWMTJt?=
 =?utf-8?B?Z3o4QTdQV1dmUE5CcEJrU1V3cC9XOXNrcXlQZ3BERlNDVXZ2RC9heXM2WEQr?=
 =?utf-8?B?V3FudjBmRlM4RHVnM21EbjUvemRPNGVXcElHeUQycnovbHZQMnZ5eVFpM2RM?=
 =?utf-8?B?aFNhNFlJOXVVZm1BRi9wZU5QSEROK1pJeXhLcmgvREhSQ09rS2R0NGsvdVNF?=
 =?utf-8?B?Mm8vRDN4Zkd3a1J5alFFRVNTR0hMQUV4azh3VUoyb1I3em0zSVdpOThleFNH?=
 =?utf-8?B?TXBva01LMDVtQUZFUHFWYWIxWlFBWWVFZmZCMEwxVkZTRDFBZjBrQ3dseFdi?=
 =?utf-8?B?OFRWaWV2TS8vWHZ4dzlVVGVTN3JRaUxIVEpDOEUzcjRGVi9MTVIzcmtMMFB2?=
 =?utf-8?B?RHUwMkF6WHpmdUwxSCtVaHo5eTFKeHNHRlU0WnRyTVRaSlJEM3k1OVNHK3Ez?=
 =?utf-8?B?MkwzMjhBSmZRZUpTVVAvR3BvT2ZNbW1NVHFRK3RIYk53OG5SWUF3MVdzaUxj?=
 =?utf-8?B?VFJEN3ZWTkpqOEFKeG9sbWE0ZFFTRitWd1g5Q0FQS2c4SFEyR3V3R2twVmZF?=
 =?utf-8?B?LzdaMDQ3UnNLUDJveW9sWnVsUzhmd0QyQzZMVE1CMDl2WGJxS3ZPWVRNNHFv?=
 =?utf-8?B?NEFUSGpEc2ljZlhGOEF0b0l6Z1RKQXlUdWN2MEdKelpGWmJNSThmNFk5N3ZN?=
 =?utf-8?B?b2hoTnNuS0diZ3RhNkFCTFp6RkVza0JMd0grMmxBVXFaNkpzZ1ErQ2lweVl2?=
 =?utf-8?B?SENvcngzK0IrU1Bha1VKOVhnbEhLUWZLNTcvK3FNQWY0ajcrNWY4K2ZIZ2pK?=
 =?utf-8?B?NWJqWC9LYXdPQWZXYllTaVVNd21ldWUvZ29Dd2I5VEhnaG9peHgrL1dFSXNy?=
 =?utf-8?B?TWVDZGtkK1N6YVRRd05ETCtSSDQvbWRQOThwRnF5RjU5aFE0WDRrb3lRcUVR?=
 =?utf-8?B?aDNDRFd3Y0Q5N1NnTTZRLysxWDNHZmk5ZXRic25Qc2wwMzArRUJXUHJ3S3RX?=
 =?utf-8?B?bXF6WTZMTlc5UWRGMWlHMHo2a1NkeC9aZGpvdmc4anowRW9wOG1OMU1RaXM1?=
 =?utf-8?B?MDZ3QmZtYlY2bXV2QVRXWFVndG5sWGZyVVA4SXNQdTJDNmlEQUlwZGZqYXFl?=
 =?utf-8?B?RWR0NU1tQkE1LzR2TW93MERkOWIzUkp5V2xhdk5hZnpCaUhjYmxHa1FmcEww?=
 =?utf-8?B?U1I3MitRdXFvVlVDdjk0NHBnUmQxeTYzYk5veUV0bGZXZ1pwdndRNGtXK3I1?=
 =?utf-8?B?clAycW4rTElsZkxyT2JNeUFCQnViTmlGUEN2M28yalRRRWgrejJFb1ZjRTRN?=
 =?utf-8?B?ZEVkVlQxQkNPMjFsZ0szanRBUHVWaDN0TjJ4WmNBRmlsU2lCSDhDdVlMWTVh?=
 =?utf-8?B?SnJaa0NqVERqVWVQZnVhY2grbXEzYnRjTGtlb3kxWWZSU0VseWdOcjZKeXgx?=
 =?utf-8?B?Z1NaWnZ3SHdTR1Q5REVsS2FUZnpCK1pad2UvWTlpdXlTWWNtdFJjWUxTb1gr?=
 =?utf-8?B?SGhrckZWWFduS0JwQktMelBsVDV3dDNNZUgzaDAyZCtHSGMyVjgzbllEU2tm?=
 =?utf-8?B?M0tOMG43S3JQYkIrVWs1d2dFUHdtOGZYdkxtak12YTFoVUl1UXg5eXRzVE94?=
 =?utf-8?B?NEx6aExBZDZONHNSZDhTQ3E0Qldvb05keU9JTkViTTRqSGVGY05pMlM4NTNr?=
 =?utf-8?B?RkhhcmRQbVVWc2VvZnIzK05Rd1A1TkgwazVwZjQrZFdvSFAvZk91OUNBU1Rl?=
 =?utf-8?B?Mk9yaEZBeFl5ME5vVHBIbmhvK05qbDZjaGs5WEZwMHhZNlhQMVdCekQ1MzhS?=
 =?utf-8?B?d0dDZkVldW51ZzE0bGpQc0dqaEMzWEdYWlRMV2Z0V0dOUDRCeUEyblRldnRv?=
 =?utf-8?Q?Evd+Sc84h5NIfeTQbpKTJ279f?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dcac786-0798-4ced-90a6-08dd9e1369f0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 18:13:57.7868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HNB0x2Jtw4cXj4JybkrAtFmvdN/NvR3I7KbbusxOIv1gLEHiSJY1PJ6v/aTw3lewlSS19Ly9kNER1gaxp13+Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8286
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

There is a work-in-progress supplement patch. Let's wait and see whether 
it fixes the regressions without reverting 46e68dd5066c.

On 5/27/25 11:06, Alex Hung wrote:
> This reverts commit 46e68dd5066c9831e9695c1756db017bb9c3762c since it
> breaks color enhancement in another OS, indicating these two fields are
> still used by color management in dcn401.
> 
> Fixes: 46e68dd5066c ("drm/amd/display: no 3D and blnd LUT as DPP color caps for DCN401")
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>   .../gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
> index f420c4dafa03..e0e32975ca34 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
> @@ -1938,8 +1938,8 @@ static bool dcn401_resource_construct(
>   	dc->caps.color.dpp.gamma_corr = 1;
>   	dc->caps.color.dpp.dgam_rom_for_yuv = 0;
>   
> -	dc->caps.color.dpp.hw_3d_lut = 0;
> -	dc->caps.color.dpp.ogam_ram = 0;
> +	dc->caps.color.dpp.hw_3d_lut = 1;
> +	dc->caps.color.dpp.ogam_ram = 1;
>   	// no OGAM ROM on DCN2 and later ASICs
>   	dc->caps.color.dpp.ogam_rom_caps.srgb = 0;
>   	dc->caps.color.dpp.ogam_rom_caps.bt2020 = 0;

