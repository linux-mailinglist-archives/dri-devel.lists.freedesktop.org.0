Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF4CABB729
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 10:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6EB610E228;
	Mon, 19 May 2025 08:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CNJphzmV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823CE10E228
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 08:26:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2/kODM4zHlDESQxuKKEQTqZbA1hK1tFvSAbtPU72suwDmbfyWYjx1+ocEX3lH86W8EB29+lY19c/W+DW+ZZlHEQE7KWDchYXohze7aYClVsiDX8pt5t5OTOKmfP5lcpX3P2yyn9vCK28qUAzLLZWVTkhZw0k3ta7aZJJHk+4m6OFWSpkDSxIDIOphaotydO/5s4XPNQ/2/7BeLgy2ZPrEXVl3/5mq+Vc5gfGsHVeumv1wXdEfcuHBeoS+Kw18GXufXbXGJP2BpuwdmlLWxG4y1wBFmPH/g3tBIfaQE2ZKuV1Uef5eLniEDUaPyLdoSiD+K3+UZk7YviQ3dgkp8IDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IzJ77oVJwxolxoHyPoGTYnFqxqpc/jF2GrS5UuZaXOU=;
 b=GcO7QcYJQbBoXrjlTOsdU2DzT0ssmCfsER4SLsGM6AfZu4qjA6cWsLph5bDHcGulwKI6sJdmQo2XqauDGOQB6lfK9k4ncpzEyotkVCj9k+EWzOQDTjSMnIt6H5zsudGwwe/YHNxmALl5B3NYygQ5iZnZQ6x5+fZWVm7EvPRALGrxBVFnPeHx9O4OTeXYyBnxhFzm7v6tiGybtJakbZE/uj0+O39vsIyX2z3PIxijzwbtZeSb4plJR5cy8a88vR0+81i2zmGa19A/XDhR0Uypp6BixaWANmObtEE7xgI9+lz41y5YySmRHBLNel96+uZ/MarXNT/NBK7YdoQnY/pirA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IzJ77oVJwxolxoHyPoGTYnFqxqpc/jF2GrS5UuZaXOU=;
 b=CNJphzmVXmO3J/nB7XTTJzDWZl7U2KX+Gf8b/WxIq13zf0b+zJaqtFT4fnTsq5x+5xyQ9a3ZbbKABy9274OBrbQPkCTaQEWKqIOv424pV9khjFga+ZgQscUNBwDnvAiFvXjVdYWXYayo6EMcmwfXCKv0aak02hEP5Or8hXE/cIk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB8597.namprd12.prod.outlook.com (2603:10b6:806:251::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Mon, 19 May
 2025 08:26:37 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Mon, 19 May 2025
 08:26:37 +0000
Message-ID: <6f05b4de-d55c-46e9-af00-f87f356e9781@amd.com>
Date: Mon, 19 May 2025 10:26:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration (v2)
To: Dave Airlie <airlied@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, dri-devel@lists.freedesktop.org,
 tj@kernel.org, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 cgroups@vger.kernel.org, Waiman Long <longman@redhat.com>, simona@ffwll.ch
References: <CAPM=9tw0hn=doXVdH_hxQMvUhyAQvWOp+HT24RVGA7Hi=nhwRA@mail.gmail.com>
 <20250513075446.GA623911@cmpxchg.org>
 <CAPM=9txLcFNt-5hfHtmW5C=zhaC4pGukQJ=aOi1zq_bTCHq4zg@mail.gmail.com>
 <b0953201-8d04-49f3-a116-8ae1936c581c@amd.com>
 <20250515160842.GA720744@cmpxchg.org>
 <bba93237-9266-4e25-a543-e309eb7bb4ec@amd.com>
 <20250516145318.GB720744@cmpxchg.org>
 <5000d284-162c-4e63-9883-7e6957209b95@amd.com>
 <20250516164150.GD720744@cmpxchg.org>
 <eff07695-3de2-49b7-8cde-19a1a6cf3161@amd.com>
 <20250516200423.GE720744@cmpxchg.org>
 <CAPM=9txLaTjfjgC_h9PLR4H-LKpC9_Fet7=HYBpyeoCL6yAQJg@mail.gmail.com>
 <5c0df728-2100-4078-8020-4aac8eb31d2b@amd.com>
 <CAPM=9tysB4iNkGViN1iaGXjPC7y=YwB05ReHdUVR_-4zHahEFg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPM=9tysB4iNkGViN1iaGXjPC7y=YwB05ReHdUVR_-4zHahEFg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR1501CA0025.namprd15.prod.outlook.com
 (2603:10b6:207:17::38) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB8597:EE_
X-MS-Office365-Filtering-Correlation-Id: a430fe4a-0d24-4ec1-6e8a-08dd96aedf02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T25DOGpRMCtaSFROOEp2djVHWHREYXd6UU5GSzd6NldZbWFPekFRa3Ixc1Nl?=
 =?utf-8?B?SE44N25CZkNRWVpqZitQQkZIOGRwRjZlWjFlcGgwbmF4cXAxcjRKVEhOd1pO?=
 =?utf-8?B?MkFyaFFLZkwxdlhhcUNibDJrTUxSK1RUOEpFODFpRDBJU0E3OTFBQW1zOC8w?=
 =?utf-8?B?L2dHS09Uc214WnQwTDExMUhDUFdocEJONlkzaWlOcXJiZjZFTFZsWVp0WUsy?=
 =?utf-8?B?Z0xOaHJYQkxWVWI4QVRwVWJlRmVOTnU5MTVzMnBjdTNIdG1UYUVBVjhkalNN?=
 =?utf-8?B?a0hlL05oL2VPQW50TGVuYWY0OW1YU04vdzRGTmVyazdVM0JUNVYyeTN0bnhP?=
 =?utf-8?B?SUh1dXJRNnRQT0ZOdDJ1WkJubXdoNm43UTVsQ1U3WnJ0Rk1ibGhNcW15YmFD?=
 =?utf-8?B?TXZVVHowbU56bnIyQ0x3dk53bGphQnJOL0FtdmFIVE44Tmh0WldXdG5MbHRI?=
 =?utf-8?B?QnAvclhlelpqRjVxOXlwZE5EQVl2UzJOaW1tOU9DTCtiRHVSbXZEcHI0MUVZ?=
 =?utf-8?B?MXNhZUplODBJcUY4aXhxNGpnU2JSMmdhSVcyTkFWajdlOXNMVnVtWmFZbFpX?=
 =?utf-8?B?V0VydUxXUVg1a0UrS2dwelVjRWQ4MFpFM1dMM1Q5aCtWakpDQy8xZ1cwcUJj?=
 =?utf-8?B?c1dmWTF3YW1vc29JRXJYQ2pEMElYUFc3cEp4UDdQaUVUZTVRNUJ5UzQ4SEZr?=
 =?utf-8?B?Y0t3aUFneGhYVmxrQzRkVHRsWXdBR0FndEJ2R2JhaTRacTNtUStheWUzQ2pn?=
 =?utf-8?B?dmJqd21SNnJoTWJHbFdEdlpnYlJZTVBZOCt6WVcxdkhEV29zNlVRS05uWmQr?=
 =?utf-8?B?a3FDNlJIRG9ZVDBKUDdpRk9aeC9HWW5SRzVYb0VFQjllaU5XUWFhK2w2Y2RC?=
 =?utf-8?B?aFpzUXZ6akk0Vk9BY3QrQWs4U2Y5aVp2blcwTnhrYjBzZk82eWh2Q3dseGFY?=
 =?utf-8?B?RllyQWZVTVVjaWdhbUFkcGpyTlR4UnNXb1BvOXA5dkFDVHBROVRKU3BnTW90?=
 =?utf-8?B?d2NkdW04SzdxRGpvV1JnN2hKbElONlNyWFZrWURYejQ3eFNxVlpXMVdxODcz?=
 =?utf-8?B?VmtsSC9KSXhLeHBaTHhXL08vQVVoUVZZck1URVE5WGRvcVlPVURGd0VQK1l0?=
 =?utf-8?B?TlUySW1rV3VVUXFIbFZCRXFUMUVPVHpSZm5mdjNOQVVRcWJJWmZ1VFpRS0l4?=
 =?utf-8?B?RWxlVXVQb0JOZk1YZHo2N084dy9jYVdhc1BWeXZ6eHFVY3ZmU2dqZ29pRTFI?=
 =?utf-8?B?LzhnQXJrTlppYktLYnpwNGN4a2VJMVlkVU5qbUI3ZERFVlJyWEszQThobDNN?=
 =?utf-8?B?UVNFZHQ1d2hXR2ZLMnN5Y200czAyMUlLdWlVSzZrNWlHSHo3VXlkczJ1TWN6?=
 =?utf-8?B?eWxkYzhmOUxUZDdzekZuQ2N6V0xvaGtiT0U1ZXozb0FBUHMydWlEV0wzT1I2?=
 =?utf-8?B?ZnhJZkpUWjVUVWY2Y0cyQ2M3QTkzTCtESlRVcWZXUS9pbVNiSnV4czQrT0tS?=
 =?utf-8?B?cFVwbWVUYTdYNW1WTXdtZ2d5Rjl2NTk5cnNMMnBIc1JleHJiZWpMUEpPYVdo?=
 =?utf-8?B?ejczaDc0NVBqT2t4L0tLZm9PUWhMUTB3eDJHMFRRa3RLRDRwQ2kwYWpUYzRU?=
 =?utf-8?B?clk5S2x5Uk90ZzdPRXVDcXhsaWpaR3lyWkZKOXRMWGhlUzhmbHVnb0tvK3hj?=
 =?utf-8?B?VGJ5SFM0SGovOHY3WnRpRGZKcURoYythT0EwazNPOUl5SERlNU1UQXo0d2Fy?=
 =?utf-8?B?TElUSkZBc1ZUamp5OXV4a1huUUhwa3VHeG5WcTFnZCtObDV4VDJCamo5dmF3?=
 =?utf-8?B?VStkbHJmMXhLSytkanFpdGdiOWRvVldQd3ZCaFZ6Y3NnL2VSQ0V6MTIxeUNH?=
 =?utf-8?B?aWY0VjlQV0JWa2Z0VXJITHUwbzRZVFhZN2Q1K0tKOVhta0ZQZ3pnc1gwNHls?=
 =?utf-8?Q?9/ZTcQkcd7k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1Z1STdkTGZEbkovVFlNVDZZOGdUcVAya3lzZmdacXFaL3pzdnA5VXZVSms2?=
 =?utf-8?B?c2FWVjk4K3o5WnNMVjE1TVV6WjlpaThHRWtMOTNkcTlRTVhBYUZDKzBtTmta?=
 =?utf-8?B?dm9Sa21sOFJPa2RiOUxFdVEwN1d2YmJTT1N1M2dYWEV5SHd5aWd1dGFEYkpY?=
 =?utf-8?B?MkpUOEplT2tkeGdkbldHcU5YRkZVTVV5SitzalNocnZDSWo0bDNzYThzeDl2?=
 =?utf-8?B?YjVKaWYybEZkdnRWMkJOUlVRZ2hkMVdqS3FYUnZjZ1dGSTE3UVpsWlhnMEhT?=
 =?utf-8?B?ZWhWVlFxNmRCSS9QOWh0d3VzZ1VzUG5wNHBqZWFwZ3pRYzFrQ1J3ZnQvZGUv?=
 =?utf-8?B?VFlCMDVDZjN6ajVvSXVhOVF2dzR1NktmZFJVZnMwdWN3L2wvRTBFYk9ZdXJi?=
 =?utf-8?B?MkJmSGNOcUdPNExKWDhOMmNTTW5vaXlKQ0oxM3FLT3BMUHc0UWZ3UzZaRG10?=
 =?utf-8?B?c1A3MnlNcHhrZ0FGdEFXVWdkVnNrcVNMOTFiUHNTTmFRWlZDbzI5RVB0RmUy?=
 =?utf-8?B?ZEVsV0dzbGovRlpaT0toQWdLS25YQlVveGNVZ3YxWEYvRlpNUGpEVUR5QWRa?=
 =?utf-8?B?bmtHYmJTQWN2aEp3M214Q2prV2lML1NFTGRJUnZLMnVRZHk3TVJpTFM3Y1JX?=
 =?utf-8?B?bHVTK0Z2S0NiNFMyL0F3WEV1ejJQYVN6SWZ4UGdvMEZrTk1pQmZFQ1ZtSmJ2?=
 =?utf-8?B?SnBtNGhXbUdsdmI3OWtaenp1OE9LYWNWV2JGbVk2RDA5TFlILy95U2dsTmJr?=
 =?utf-8?B?bHdDWEFaOHRGcDVCTlhKSGY0eVRZSGVOeTBQWjV0VGRVYTJrUlN3c2FuQ1F2?=
 =?utf-8?B?MkIyTVR5TjFIcVpSWEk1UGhsWXdjNkN5b2R2N2FEZVVTZ3IvaEFpNWRHMkJ5?=
 =?utf-8?B?bmMrOGJ2dmxBam5oWnFlVlFLN3psa0lEdFZLUlNyNlcwaVRlbW9DRVVRRHdJ?=
 =?utf-8?B?ZXhVZ0s2eEM1RGxHNklneWU0OFhwTTZjdStLdjhoWHBDUHZtZy9ZR29ZLzhD?=
 =?utf-8?B?TXhkUXRlYTVtYW5UYjF0eGwxclAyeHJLNFlLeExuZnBDZnFpNW15VDhSM0t6?=
 =?utf-8?B?Q1VzSEduTGhEWkhzd0pJU1FRYlQ2d1lNLzZtQVhxZDhWZjdDNWtGV29Hd29n?=
 =?utf-8?B?RUJ5SkRHLy85aUZ6VFQxNFlhRkZZdzUxZWZzZnJEYm00Ykk0VTd0c0RLZVFD?=
 =?utf-8?B?TS8yakFwdTNva0xiZGkvaXNvSnpoQ1RZaVMrTkpWeEpnSlFHYk1melpiZ20v?=
 =?utf-8?B?aTArYjBia05rK1BKYWxwZzgrMndXQk43MGZUYldON3pPVVpGa2FWb2JGNXR1?=
 =?utf-8?B?M2ZCUTUzNUVaa0EvYjlsRnlmYTNOOENDcWx2U0prQkZ4UjVKam5oNmtwUFUx?=
 =?utf-8?B?ZHFENDZXMDZzbUgxS1ltWkx5b095UmF3dFlNa1hBanVUQzZjRVFDc3B3aHF2?=
 =?utf-8?B?aTlDdlNQNm83VWhpTDhLUHBlaklqNkkyVGtrWlV3YmlaMnZqV3F0TnJWYkoz?=
 =?utf-8?B?L2FKSk9tb0l2SStJdjFYQ29nQytPOWp6dEExLzl5QjlKaHBMKzFoYlVHcm1w?=
 =?utf-8?B?Wng2ZVFNUStzN3RtZTZ4UUo3dzFNYk1tUGplR2p3c3VjdFNOYkVqM2Q3ZXoy?=
 =?utf-8?B?QU1reTlpaWdyakg4eHA1a0ZIQUlOZ0RIL3JwemNDeHBWdVJDeU1UWmNTWUx5?=
 =?utf-8?B?Wlk4ZGVjQU40by82UUNDbW1yRHRlRE5SY1FhL2NZOGI4dVY0L2x5T1M4RHVN?=
 =?utf-8?B?ajRYaU5VMGpFd1lOSWdTZDBuQno1eGhsbWhkMGZ2ckozV2V0c0NoeC8wU1dK?=
 =?utf-8?B?TzBSVnpmajR1MVkybjhueENQdmNIVlFjTmp3eDNDdFdtaFd2UWFZc3c2Z2Zs?=
 =?utf-8?B?TmtsVkF1QkgvK2g0TGZldVI4SDBHVnJDSzQ3aGt6Q2ZFUGhzbFo4cjhxdDVt?=
 =?utf-8?B?c3EzeEhaL1Q2VmhsSVlOV01hNXRKQUtGK1R1bjIxdDFBbjRVekpkM2pqTlNs?=
 =?utf-8?B?UFQ2R3JqY3BoZ3dEN1BvaWZVOUtZZkdYdW1MRllHdGhlTEJSbWR0S1AvR2Rv?=
 =?utf-8?B?UDhLTm8zTWlZZUF6bHBWbTN5VmV5UUIzSCs2UnlUSFFmWEZ0UFpVNk1lNGlr?=
 =?utf-8?Q?88Q8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a430fe4a-0d24-4ec1-6e8a-08dd96aedf02
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 08:26:36.8354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FR2CWItXg2Fr0uqMgPUG7z4JcHK1lzlpsGCavSaMYTviyeAWsoRjm61kjLdg8SwK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8597
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

On 5/19/25 08:18, Dave Airlie wrote:
> On Mon, 19 May 2025 at 02:28, Christian König <christian.koenig@amd.com> wrote:
>>
>> On 5/16/25 22:25, Dave Airlie wrote:
>>> On Sat, 17 May 2025 at 06:04, Johannes Weiner <hannes@cmpxchg.org> wrote:
>>>>> The memory properties are similar to what GFP_DMA or GFP_DMA32
>>>>> provide.
>>>>>
>>>>> The reasons we haven't moved this into the core memory management is
>>>>> because it is completely x86 specific and only used by a rather
>>>>> specific group of devices.
>>>>
>>>> I fully understand that. It's about memory properties.
>>>>
>>>> What I think you're also saying is that the best solution would be
>>>> that you could ask the core MM for pages with a specific property, and
>>>> it would hand you pages that were previously freed with those same
>>>> properties. Or, if none such pages are on the freelists, it would grab
>>>> free pages with different properties and convert them on the fly.
>>>>
>>>> For all intents and purposes, this free memory would then be trivially
>>>> fungible between drm use, non-drm use, and different cgroups - except
>>>> for a few CPU cycles when converting but that's *probably* negligible?
>>>> And now you could get rid of the "hack" in drm and didn't have to hang
>>>> on to special-property pages and implement a shrinker at all.
>>>>
>>>> So far so good.
>>>>
>>>> But that just isn't the implementation of today. And the devil is very
>>>> much in the details with this:
>>>>
>>>> Your memory attribute conversions are currently tied to a *shrinker*.
>>>>
>>>> This means the conversion doesn't trivially happen in the allocator,
>>>> it happens from *reclaim context*.
>>
>> Ah! At least I now understand your concern here.
>>
>>>> Now *your* shrinker is fairly cheap to run, so I do understand when
>>>> you're saying in exasperation: We give this memory back if somebody
>>>> needs it for other purposes. What *is* the big deal?
>>>>
>>>> The *reclaim context* is the big deal. The problem is *all the other
>>>> shrinkers that run at this time as well*. Because you held onto those
>>>> pages long enough that they contributed to a bonafide, general memory
>>>> shortage situation. And *that* has consequences for other cgroups.
>>
>> No it doesn't, or at least not as much as you think.
>>
>> We have gone back and forth on this multiple times already when discussion the shrinker implementations. See the DRM mailing list about both the TTM and the GEM shared mem shrinker.
>>
>> The TTM pool shrinker is basically just a nice to have feature which is used to avoid deny of service attacks and allows to kick in when use cases change. E.g. between installing software (gcc) and running software (Blender, ROCm etc..).
>>
>> In other words the TTM shrinker is not even optimized and spends tons of extra CPU cycles because the expectation is that it never really triggers in practice.
>>
>>> I think this is where we have 2 options:
>>> (a) moving this stuff into core mm and out of shrinker context
>>> (b) fix our shrinker to be cgroup aware and solve that first.
>>
>> (c) give better priorities to the shrinker API.
>>
>> E.g. the shrinker for example assumes that the users of the API must scan the pages to be able to clean them up.
> 
> Well my again naive approach is to just add simpler low-overhead
> shrinkers to the start of the shrinker list and if they free up enough
> memory then win, otherwise we were in reclaim anyways,
> 
> however this asks the question if just going into reclaim and having
> to touch any shrinkers at all is bad, if the overheads of just doing
> that aren't acceptable then we would need to come up with a better way
> I suspect?

Yes, but in that case we would need to come up with a better way for the non-cgroup case as well.

> adding a single shrinker flag to put the ttm shrinker at the top of
> the list is pretty trivial.

I'm not 100% sure when the shrinkers actually start doing something.

For the TTM pool it would make sense to let memory management look into it before it even looks into the page cache, in other words very early.

> Thanks for use-cases that probably matter, I can see the online gaming
> workloads being useful overhead reduction.
> 
> There probably isn't much appetite to just migrate the ttm pools into
> the core mm, I see a couple of other users like sound do set_memory_*
> calls, but I doubt they are on the radar for how much it costs.

The long term plan was always to move the whole TTM pool into the DMA API.

This way we can not only potentially abstract all this architecture specific stuff, but also remove other cases where people implemented pools in drivers because the DMA API was just not fast enough to come up with coherent memory for example.

It's just that there was never a technical need to look into this, so it never hurt hard enough to actually clean that up.

The GFP_DMA and GFP_DMA32 flags are also seen as kind of historical leftovers as well.

So moving the logic into the core memory management is most likely a no-go from upstream, but what we could do is to move it into the DMA API and let the DMA API then interact with the core memory management in a much better way than what we can do now with the various shrinkers.

Regards,
Christian.


> 
> Dave.

