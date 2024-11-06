Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCDC9BEA5A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 13:44:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFD210E057;
	Wed,  6 Nov 2024 12:44:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0p4IDd1f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2073.outbound.protection.outlook.com [40.107.92.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0AE410E057
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 12:44:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TTC0BL78rp7UCv86l5J59g5Ex65w4Tjc1itMQELVw3p1MKWz0yEo0/t062Vt9xeWMBiuXISWhsV6+Ke2j1mQOs5wpQNN5yNxZOHpdIhV5CuN54w+psf4wBR15VXuNN+YWH9FpY2Rubs4TL5LfG5OF1IQcINbFYAWJ7udZdvbt9Rtm1XPbYL5X+DzQxf+1lFCqR17iUnlZO9U03Ghyx2TNBydDmVJXZm9dSUSlydOcSOQO/ojavt08E0UBFG2duiFW8c5omd/1A/njZkeRKIJmuz6GRQ0FHPdbGEfJ0e5SsUfmcA0BNKxp8LpX6f3VWKd/lEL7UxzVhcvsdF3lYt8IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLfLG+DRXQsobGO+qMbMRidZd09MK1wnkXNUJ3/iG6I=;
 b=GO6Slt9CBfPnoL0TEMIfFKm9Y95/NX8iJWQFPaXzVN08lwkpo44wy8Oir6VfDV++HWZtAvacrl/jFYVNsNokmSPWPwmaE47GdZhXy6v1AiQG18xWB7WMQOqDJtK1ci9M4pDGWbmX3Av/nI+vBcpqcx6Ujp4miTCfsqaT2a3X6H7t7EIG3XNhDG+ybVWYrwsx02INTfV1ClJI8NkGh9WH4dXI1lneGlms59iHcake0g1TyKdRYmPMUx5emM7nIoOrwAAMCjS/O7m2PEQh4hTBB3Lxy+Ch5tMRbqVMzoGW2d9ThvMggssf2hAKDby7UawXVZP+3j8NvMrCvvXgcq1X2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLfLG+DRXQsobGO+qMbMRidZd09MK1wnkXNUJ3/iG6I=;
 b=0p4IDd1fV4grcTR0ebIRtDVyXqU6AeEobL9VLEBUSAUlkdP2oldFCng0DOEG998iuWXUvCS0TRxYCtyD1hSL2qLfIej9VOmDyu9GgippF1shIrsJt5QY4FMPFw4DlKvGm/53+tQUIIw26ns5SSI/5wfReeTmlnwr0UWFujjX6fk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB9470.namprd12.prod.outlook.com (2603:10b6:806:459::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 12:44:26 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8114.028; Wed, 6 Nov 2024
 12:44:26 +0000
Content-Type: multipart/alternative;
 boundary="------------I5dDGjM8EjDioEO5qtTyoSjb"
Message-ID: <048c2dca-48fd-4627-ba0c-bc9daa17ac29@amd.com>
Date: Wed, 6 Nov 2024 13:44:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/syncobj: ensure progress for syncobj queries
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Chia-I Wu <olvaffe@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Chunming Zhou <david1.zhou@amd.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 faith.ekstrand@collabora.com, simona@ffwll.ch
References: <20241022161825.228278-1-olvaffe@gmail.com>
 <900f8658-726c-4034-90ff-398e6c57ec47@amd.com>
 <CAPaKu7QwSq7a-ipSOdETFEBGMu4J4ud1SqxDfPp8bNMjCMM5RQ@mail.gmail.com>
 <CAPaKu7TB30wvDvMW2FcYNcxjfDkOje358JNnRr2jJf=99-h-rg@mail.gmail.com>
 <301110a2-c004-4385-9231-b9354904b5e0@amd.com>
 <CAPaKu7Tbp1_sd7Eqj7tkWBJBVPSZYo6uYD+7jwP=CwM5YYauFg@mail.gmail.com>
 <20241106091436.48687e86@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241106091436.48687e86@collabora.com>
X-ClientProxiedBy: FR3P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB9470:EE_
X-MS-Office365-Filtering-Correlation-Id: f97b7d50-d0d2-41ef-65fc-08dcfe60bfad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0xqQ0hBdTYwRFVQYlRndkd4T0laOWs1V2tvTmFua3pJam5wb0xCSXc5KzFI?=
 =?utf-8?B?Y0JsdjUwODVGUXh4bGxDdS85ZGJuelVwTlM1ZmRSb3Z1QTFPZ1JzWldOZXJL?=
 =?utf-8?B?M0dhenBNZVl3cithSXhWbUk3M3ZhZWd5V3ErVTlUeVk4UnZWZDYvOEg0Tm5a?=
 =?utf-8?B?ZWJodEJ2WmU2aVhzaVdLYVJQdHc4L0FIa3ZEV1VWaUZzYk5jVERWZVZRM0Ny?=
 =?utf-8?B?ZVZTTW1XYmh3YUF4RzlGRjk1UldLUWowcEh3ZlNoM09wbVZSdHcwSWZzb1Vm?=
 =?utf-8?B?V21KVElPZE0rbFVWYThKVTZYcGltR3ZBU2UvdTNjc3NqMG9hMGJwU3BRWUlT?=
 =?utf-8?B?aFVMeEcxak1nV291elpVYUdvckcxNm5MbVBVb2V5b0xOcXdaWmpGRE51TUZB?=
 =?utf-8?B?RDgyanMvNEhlOHE3bFlzSUlRVkZ6R1N5NG1yYmtadnRZdkxaMmZDN0EyVFpM?=
 =?utf-8?B?YVBWMFpVNTBxZWIxUUF1WDJKdVl4bm5hQmgrZEFKZENkZWxJK2w4WmNUb1la?=
 =?utf-8?B?dnlVMmFUVk5PWmRvT3ZNc1ZIS01ONUx1R2RpRXMxYU1vSU42ZklFd3o5TUtU?=
 =?utf-8?B?dGEwVTFabFZnQVdFMzdvdFhrWmpCcDMxTkduTnppTzFWbkVqOGxzVk9pSjlT?=
 =?utf-8?B?ZGllWjFwOTQ2TFpSN0hmRGNRdXJQeFYzeUlTWS9WNTA4S29LM0NVeU94aFU4?=
 =?utf-8?B?Ym4vNGNxdWFycUEwZTM2WmZWTkRlK2xtR2ZJcE90amJtZ3VRRHFQUXdKWjBF?=
 =?utf-8?B?SGVmT3RZRTRoWEdGQi9oUVNxbGNBNUthUXNoZWtmdE9vTTNiNWM5OVdvTEE2?=
 =?utf-8?B?SlJnM0tWVXAwMU4zU21pRDdrQWVpaEptV2RPZUJLaVZ3a1hSL1RLbFdhY2Ra?=
 =?utf-8?B?R2RYSGJYQVhTU3VjUmxMM0xKM0NVdU91SWx6RXVHaHlCWXdYRmhxN1RGbDEw?=
 =?utf-8?B?RlcrRnlHU2FjWjZudjdtWHdjdXlISTJLdDVoc2NhVUVKVi9ISGQ5VTA0Vzlt?=
 =?utf-8?B?VWpoa1ZoZEdRbGJDYzRmWStHWVN3OEpsTHZLaHp3bEl6TVFrL1VyREVMSEEy?=
 =?utf-8?B?RXVPU28xenZRbEtLdWRidk4weVlXNTdpZjlQT2RteW1zUUZDV0ZEYVU5aFd0?=
 =?utf-8?B?a2NpTjk2bHVrRUhBcjE5WVRYbEVRZlVsOVZlVDJlckJSdUM4Y3d4N21WUnM0?=
 =?utf-8?B?VWJDVmwrdktMU2hxRXZwUFpNK29RRTBDcHFUZkhDejVDSndkN2c0T3JnaitW?=
 =?utf-8?B?ZzU1V1NORWZ5MFhiaVdXOS9taklRQW5hVkxzSUdsQ3Q2Nm1OYXRNaVZRZXZH?=
 =?utf-8?B?d3pjNTQzZHR6aGtkRkdpWHhEM0FWcHQ3WFhobitCdDFZNE10UmMxNjJ0Sm0y?=
 =?utf-8?B?b1B0UG1IemJCeGJNSTVwbFZHdldXNWxsVk54bmpqS3lnaDg0VTFDTWhsUE1T?=
 =?utf-8?B?RkcxTmV1ZkdTdzVSeTljOU05c0JxOGF2S01UaVoyckh3b3ZqbHh0Q0FBZjNW?=
 =?utf-8?B?S1hLdStpbU1XSi85Q0NpSWk1NmxDdllzTkdTV21vcHdPWjRyMUxxaHhaQzBR?=
 =?utf-8?B?R0lFSmxTbFJBRTVhN043M1JGMG1aSmhqQURiaFhVbzhGL05NVmxEMUkvSjhH?=
 =?utf-8?B?bXNXb3RaSjZFdjNUTEN0dTVCSFp5bDhhUmpucG15WExKUU1SalRPMGtyS2dE?=
 =?utf-8?Q?6XiyoBcbNbANgv67V7DD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amFmUkFwSnVPdVpZT2M1Z2RoaktWVllGUUloSXc1bGsrZkdvT1dsZXlEZGZQ?=
 =?utf-8?B?Y1lodmhidVNaZlFIOUVkd3pxWEF6c0MySzVLNm56eElTTzdGZm9oZXVEZUpo?=
 =?utf-8?B?VC85ZzNBOVVDVEVGVFl5Z2ZhOFYrMUFCOTg0N3ZWNktFREYzRUdVME1nTWJh?=
 =?utf-8?B?UmE2Q3NaS3VHbERLU1QrY2lqemVUVlN2Z2txTFhFaVVxbGx4R1NDbDMwR1Rv?=
 =?utf-8?B?bXQ2d3pQUUpaTTFLUkFTV3FvMkZ3eDhBL1djbXhyVndySHIrSjc2T1RNcEk5?=
 =?utf-8?B?NU9ybjZqUXJUcFQ3NzcxL2NORzBoV0tYeTYwdWNxb1FoOURUQndjTlppM0ls?=
 =?utf-8?B?Q3hSRFV2V29MNXREV2xsWGZIaG4xZTdXZjNSOUU4UzBoWHdQWFUrTXd4eG9s?=
 =?utf-8?B?aXJIQUEzV1dUMTBaYzJxL3EvYWVjSDJjRlMvdENCYmdGeE9EVEtEeFhnNkd6?=
 =?utf-8?B?MFFDL2pJa2w0ZWVydHJNSmVzWndibk0rTkdSWU9DR28zeW5WSW9qVUVBSXJJ?=
 =?utf-8?B?N3F6K1o4bVlGdlFOM243UG1zeFNpYndwejJjbGdaN1BEeFk3b3ZzNVlJZ1Rm?=
 =?utf-8?B?NXg3SzRqRnlpYjlkd2lHZ3A5OFdzZFZadkE1clpwRVdGd2lxbDd5ZXR1Zmk1?=
 =?utf-8?B?dDdGRG8wTFpVSHpNamYwanhWclIvaWV1Z2I0VHEwT3lWS0dNQUozbVVVSTBS?=
 =?utf-8?B?TTJoSHlidG5zaHkyTENJWE42T3dtRWlCUE5haGMrOGR0WWZIQzcxTjJna2lY?=
 =?utf-8?B?WW0yRGUxaXorc3NIQVBQb3hyNnVzY25QRS9YK1YyNkJoM0w1WHBaSytBaXBD?=
 =?utf-8?B?MDFCNkltam9XMzNXNnJCM0lveUtRY29raHF4MzlScGhvTGFrZHU4eWw0RkMv?=
 =?utf-8?B?OWx1Z0RXL1M4UVpQQ3UwamNmc0FTSm5BaW9kTHd1WFA0VlFEVWFyaHh3bC9N?=
 =?utf-8?B?bzJEd3RJUUp2SldUQ3FQYmFvVllxbU9vR1Q5YTR3eUw3VmFmNkgrY0RWUUhx?=
 =?utf-8?B?ZnJjQXJHeURCSlRBSFhFMjF0Z3lwSG11Qnh4RUtxN0gydzFjZXc0eExCblIv?=
 =?utf-8?B?Umh0NExiSUhMSkQxZmNDc0dUV0txc3JMclpRWUZJc0lLVmFIYmdrMkRMcHlE?=
 =?utf-8?B?U25XVHVZdm0vY25RVG40NGIzdnlCK2twTktNVlprdnlROURXUDlsRExIL0hh?=
 =?utf-8?B?czAyaENLNXg5RmlYbGhSVVdoRjU1QmlaTmZPeDBJTWdDYmlRU3BxdUFPN09l?=
 =?utf-8?B?N3VxUG0xUTRqTnROakpKaTBYOERoUk1ubmVFUGtzdEVMZ1lUU0psbGVOeXFQ?=
 =?utf-8?B?eittWkNBamM2a0tzMnAyWlF4V0xWNWZWWEJkWCtnNXZ1TW5LVGJtQTUxcHky?=
 =?utf-8?B?SXlHM2IrdXNTb1AreERWLzZLN2t5ZmYxbU16Um9SVHF1RzJucGo0K0dOUDRG?=
 =?utf-8?B?MUEvSmkwRDBqSDY3elk2aVFVUDQ4bWZLakxBYzBLMVM3ZE81alljU3BnNU9Y?=
 =?utf-8?B?cjltRVc0MERXclJKcXNIeW5UdlBmd0IvUFlKK2hLSG10R0R0WDVseVlaMUdR?=
 =?utf-8?B?UXlOeEtFTHJJYkQ3QWpvUUswRDJYcVRWdnh3eHgzdi9jcERiejU1UmRUa3By?=
 =?utf-8?B?ZVNGK1Z2OGF2c29lcHdGa21FeXZrZ2tnT0xnSURsZWoxRmFNMUh2STVXYXEr?=
 =?utf-8?B?cWNrRmdqcGRwS0lPYmRXWEM1UXk3WVRyZERWbVczR2V0MFZ3VzZqdHZWRElB?=
 =?utf-8?B?a3VjQVdtQ0xzNjhzWnFkSjRNc0FndnJtSjVKbmRkRnVDaFpuZlAwOVI5RGts?=
 =?utf-8?B?djlGVWdFeTBNSEVtcE5YQWNEN2l3N2pCVFNnWW0vMjY5WXJOQU5sTG5hZDV1?=
 =?utf-8?B?eXppbHJLOTJMa3puSjVBdFAzVjRNeVFRT0NiTHdCTmVWU3ZUaDZyeUhoYnZp?=
 =?utf-8?B?TWp0a3NOaXpDbStLT0h0Y2xOeVRzNU5iTFlwWExnMGFUajE0RG8yZ242Skdx?=
 =?utf-8?B?dEhKMlNCSE82b0owblJ1WnZKOFFsbGgvMW5xVTVabktLalFJMHowd2k5d0J5?=
 =?utf-8?B?blQ2VnZ1OGkxRithaThXaDNuLzQ5ME9VS1JKd1NsZHp6RUF1c3dDL3QyUDdN?=
 =?utf-8?Q?LvUVJiqBfYsUduWskzQMQoIdh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f97b7d50-d0d2-41ef-65fc-08dcfe60bfad
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 12:44:26.7344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eqE/J8455cmigMLVqicZaZtj8xhcGUGdUoylfQmjVhqBFO83mzQ7NXjnB/mQpwIq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9470
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

--------------I5dDGjM8EjDioEO5qtTyoSjb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 06.11.24 um 09:14 schrieb Boris Brezillon:
> On Tue, 5 Nov 2024 09:56:22 -0800
> Chia-I Wu<olvaffe@gmail.com>  wrote:
>
>> On Mon, Nov 4, 2024 at 11:32 PM Christian König
>> <christian.koenig@amd.com>  wrote:
>>> Am 04.11.24 um 22:32 schrieb Chia-I Wu:
>>>
>>> On Tue, Oct 22, 2024 at 10:24 AM Chia-I Wu<olvaffe@gmail.com>  wrote:
>>>
>>> On Tue, Oct 22, 2024 at 9:53 AM Christian König
>>> <christian.koenig@amd.com>  wrote:
>>>
>>> Am 22.10.24 um 18:18 schrieb Chia-I Wu:
>>>
>>> Userspace might poll a syncobj with the query ioctl.  Call
>>> dma_fence_enable_sw_signaling to ensure dma_fence_is_signaled returns
>>> true in finite time.
>>>
>>> Wait a second, just querying the fence status is absolutely not
>>> guaranteed to return true in finite time. That is well documented on the
>>> dma_fence() object.
>>>
>>> When you want to poll on signaling from userspace you really need to
>>> call poll or the wait IOCTL with a zero timeout. That will also return
>>> immediately but should enable signaling while doing that.
>>>
>>> So just querying the status should absolutely *not* enable signaling.
>>> That's an intentional separation.
>>>
>>> I think it depends on what semantics DRM_IOCTL_SYNCOBJ_QUERY should have.
>>>
>>>
>>> Well that's what I pointed out. The behavior of the QUERY IOCTL is based on the behavior of the dma_fence and the later is documented to do exactly what it currently does.
>>>
>>> If DRM_IOCTL_SYNCOBJ_QUERY is mainly for vulkan timeline semaphores,
>>> it is a bit heavy if userspace has to do a
>>> DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT before a query.
>>>
>>>
>>> Maybe you misunderstood me, you *only* have to call DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT and *not* _QUERY.
>>>
>>> The underlying dma_fence_wait_timeout() function is extra optimized so that zero timeout has only minimal overhead.
>>>
>>> This overhead is actually lower than _QUERY because that one actually queries the driver for the current status while _WAIT just assumes that the driver will signal the fence when ready from an interrupt.
>> The context here is that vkGetSemaphoreCounterValue calls QUERY to get
>> the timeline value.  WAIT does not replace QUERY.

Oh, that is a really good argument.

>> Taking a step back, in the binary (singled/unsignaled) case, a WAIT
>> with zero timeout can get the up-to-date status.  But in the timeline
>> case, there is no direct way to get the up-to-date status if QUERY
>> must strictly be a wrapper for dma_fence_is_signaled.  It comes back
>> to what was QUERY designed for and can we change it?

Yeah that is a really good point. If _QUERY implements a different 
functionality than _WAIT than the usual distinction between polling and 
interrupt based approach can't be applied here.

>>> I filed a Mesa issue,
>>> https://gitlab.freedesktop.org/mesa/mesa/-/issues/12094, and Faith
>>> suggested a kernel-side fix as well.  Should we reconsider this?
>>>
>>>
>>> Wait a second, you might have an even bigger misconception here. The difference between waiting and querying is usually intentional!
>>>
>>> This is done so that for example on mobile devices you don't need to enable device interrupts, but rather query in defined intervals.
>>>
>>> This is a very common design pattern and while I don't know the wording of the Vulkan timeline extension it's quite likely that this is the intended use case.
>> Yeah, there are Vulkan CTS tests that query timeline semaphores
>> repeatedly for progress.  Those tests can fail because mesa translates
>> the queries directly to the QUERY ioctl.
>>
>> As things are, enable_signaling is a requirement to query up-to-date
>> status no matter the syncobj is binary or a timeline.
> I kinda agree with Chia-I here. What's the point of querying a timeline
> syncobj if what we get in return is an outdated sync point? I get that
> the overhead of enabling signalling exists, but if we stand on this
> position, that means the QUERY ioctl is not suitable for
> vkGetSemaphoreCounterValue() unless we first add a
> WAIT(sync_point=0,timeout=0) to make sure signalling is enabled on all
> fences contained by the dma_fence_chain backing the timeline syncobj.
> And this has to be done for each vkGetSemaphoreCounterValue(), because
> new sync points don't have signalling enabled by default.

The common driver design I know from other operating systems is that you 
either poll without enabling interrupts or you enable interrupts and 
wait for the async operation to complete.

That distinction is really important for things like mobile devices 
where interrupts are rather power costly.

> At the very least, we should add a new DRM_SYNCOBJ_QUERY_FLAGS_ flag
> (DRM_SYNCOBJ_QUERY_FLAGS_REFRESH_STATE?) to combine the
> enable_signalling and query operations in a single ioctl. If we go
> for this approach, that means mesa has to support both cases, and pick
> the most optimal one if the kernel supports it.

Another problem we have here is that dma_fence_enable_signaling() can 
mean two different things, maybe the documentation is a bit confusing:

1) Enabling interrupts so that we don't need to call the 
ops->is_signaled() driver callback.

2) Asking preemption fences to actually signal because memory management 
wants to do something.

So when this ops->is_signaled() callback is implemented it shouldn't be 
necessary to enable signaling to query the state.

To summarize: When you call _QUERY you shouldn't get an outdated sync 
point. When you do this then there is something wrong with the backend 
driver.

Regards,
Christian.
--------------I5dDGjM8EjDioEO5qtTyoSjb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 06.11.24 um 09:14 schrieb Boris Brezillon:<br>
    <blockquote type="cite" cite="mid:20241106091436.48687e86@collabora.com">
      <pre class="moz-quote-pre" wrap="">On Tue, 5 Nov 2024 09:56:22 -0800
Chia-I Wu <a class="moz-txt-link-rfc2396E" href="mailto:olvaffe@gmail.com">&lt;olvaffe@gmail.com&gt;</a> wrote:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Mon, Nov 4, 2024 at 11:32 PM Christian König
<a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Am 04.11.24 um 22:32 schrieb Chia-I Wu:

On Tue, Oct 22, 2024 at 10:24 AM Chia-I Wu <a class="moz-txt-link-rfc2396E" href="mailto:olvaffe@gmail.com">&lt;olvaffe@gmail.com&gt;</a> wrote:

On Tue, Oct 22, 2024 at 9:53 AM Christian König
<a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a> wrote:

Am 22.10.24 um 18:18 schrieb Chia-I Wu:

Userspace might poll a syncobj with the query ioctl.  Call
dma_fence_enable_sw_signaling to ensure dma_fence_is_signaled returns
true in finite time.

Wait a second, just querying the fence status is absolutely not
guaranteed to return true in finite time. That is well documented on the
dma_fence() object.

When you want to poll on signaling from userspace you really need to
call poll or the wait IOCTL with a zero timeout. That will also return
immediately but should enable signaling while doing that.

So just querying the status should absolutely *not* enable signaling.
That's an intentional separation.

I think it depends on what semantics DRM_IOCTL_SYNCOBJ_QUERY should have.


Well that's what I pointed out. The behavior of the QUERY IOCTL is based on the behavior of the dma_fence and the later is documented to do exactly what it currently does.

If DRM_IOCTL_SYNCOBJ_QUERY is mainly for vulkan timeline semaphores,
it is a bit heavy if userspace has to do a
DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT before a query.


Maybe you misunderstood me, you *only* have to call DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT and *not* _QUERY.

The underlying dma_fence_wait_timeout() function is extra optimized so that zero timeout has only minimal overhead.

This overhead is actually lower than _QUERY because that one actually queries the driver for the current status while _WAIT just assumes that the driver will signal the fence when ready from an interrupt.  
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
The context here is that vkGetSemaphoreCounterValue calls QUERY to get
the timeline value.  WAIT does not replace QUERY.</pre>
      </blockquote>
    </blockquote>
    <br>
    Oh, that is a really good argument.<br>
    <br>
    <blockquote type="cite" cite="mid:20241106091436.48687e86@collabora.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Taking a step back, in the binary (singled/unsignaled) case, a WAIT
with zero timeout can get the up-to-date status.  But in the timeline
case, there is no direct way to get the up-to-date status if QUERY
must strictly be a wrapper for dma_fence_is_signaled.  It comes back
to what was QUERY designed for and can we change it?</pre>
      </blockquote>
    </blockquote>
    <br>
    Yeah that is a really good point. If _QUERY implements a different
    functionality than _WAIT than the usual distinction between polling
    and interrupt based approach can't be applied here.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20241106091436.48687e86@collabora.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
I filed a Mesa issue,
<a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/mesa/mesa/-/issues/12094">https://gitlab.freedesktop.org/mesa/mesa/-/issues/12094</a>, and Faith
suggested a kernel-side fix as well.  Should we reconsider this?


Wait a second, you might have an even bigger misconception here. The difference between waiting and querying is usually intentional!

This is done so that for example on mobile devices you don't need to enable device interrupts, but rather query in defined intervals.

This is a very common design pattern and while I don't know the wording of the Vulkan timeline extension it's quite likely that this is the intended use case.  
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Yeah, there are Vulkan CTS tests that query timeline semaphores
repeatedly for progress.  Those tests can fail because mesa translates
the queries directly to the QUERY ioctl.

As things are, enable_signaling is a requirement to query up-to-date
status no matter the syncobj is binary or a timeline.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I kinda agree with Chia-I here. What's the point of querying a timeline
syncobj if what we get in return is an outdated sync point? I get that
the overhead of enabling signalling exists, but if we stand on this
position, that means the QUERY ioctl is not suitable for
vkGetSemaphoreCounterValue() unless we first add a
WAIT(sync_point=0,timeout=0) to make sure signalling is enabled on all
fences contained by the dma_fence_chain backing the timeline syncobj.
And this has to be done for each vkGetSemaphoreCounterValue(), because
new sync points don't have signalling enabled by default.</pre>
    </blockquote>
    <br>
    The common driver design I know from other operating systems is that
    you either poll without enabling interrupts or you enable interrupts
    and wait for the async operation to complete.<br>
    <br>
    That distinction is really important for things like mobile devices
    where interrupts are rather power costly.<br>
    <br>
    <blockquote type="cite" cite="mid:20241106091436.48687e86@collabora.com">
      <pre class="moz-quote-pre" wrap="">At the very least, we should add a new DRM_SYNCOBJ_QUERY_FLAGS_ flag
(DRM_SYNCOBJ_QUERY_FLAGS_REFRESH_STATE?) to combine the
enable_signalling and query operations in a single ioctl. If we go
for this approach, that means mesa has to support both cases, and pick
the most optimal one if the kernel supports it.
</pre>
    </blockquote>
    <br>
    Another problem we have here is that dma_fence_enable_signaling()
    can mean two different things, maybe the documentation is a bit
    confusing:<br>
    <br>
    1) Enabling interrupts so that we don't need to call the
    ops-&gt;is_signaled() driver callback.<br>
    <br>
    2) Asking preemption fences to actually signal because memory
    management wants to do something.<br>
    <br>
    So when this ops-&gt;is_signaled() callback is implemented it
    shouldn't be necessary to enable signaling to query the state.<br>
    <br>
    To summarize: When you call _QUERY you shouldn't get an outdated
    sync point. When you do this then there is something wrong with the
    backend driver.<br>
    <br>
    Regards,<br>
    Christian.<br>
  </body>
</html>

--------------I5dDGjM8EjDioEO5qtTyoSjb--
