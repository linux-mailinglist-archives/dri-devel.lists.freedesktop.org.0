Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 381AF9BE304
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 10:49:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2099310E2FD;
	Wed,  6 Nov 2024 09:48:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="p88THKOR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC72A10E2FD;
 Wed,  6 Nov 2024 09:48:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q2tDz08UIbpLEc6QjcENrjax/viM9QslR2mS+dqAfGbLknKMBIzSuUa/veVbU2X0pGB4+yWrkFCphlUK0DCVkF+UN2gw+fhAbY7jcMM+eNHQ9Gw7wbPzvgDReBkdiyuHw6LGdij5AbwquU7TK0WPJkVtVCYJ9WK50p/WVJuLQqA7r7jFT17Q/YK6JbwG7etATdm4HC3CQsEeq3mYuoy/mqCNBvIvENp/qfkDgf6yYSMXNBZ9J7dgPdpTwll280VpFC/BPQhiOqp6+EPSxlyVy+jP9TCgCmVdwXTZIHwAwIU39+j6r/5v7E1SQDANC4c3yU2HolBuIZIxzx6uzlZmKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLk+wzehdHCgbN+U8/9Rss3IOQbXIXL5eLBwkLEslt4=;
 b=vxcdlqjkcvQfHoQp4boStiadbvpdZ6QBGHKArII+zE1mOmoAUsf4rXliZ/j6CpJugxsrfG8oUgiRdfUurT+UBd3lhgPMxHJFKYGrE/pTIrtYIk0Vq+IsV29NhwaINWZHIs27W/Zq9hgb1jduaJI6J7IsFLonEcp/xtd1r68wLdcOnvk7HvvaIcEvX5dOMgTzYlTFGnvMbpU+wgL79s5to+eEX5ta30A9lM3F93gTkUqBxbgxJ/fuIhuOG02MW4PyQvoJgrPh9aKTX7/Sz6oI2ZstwGSPkAcQPqCQhGczjru8IfCUqK/Cnv7GBnUzuQq3ZDkOPmMbtctPWP2xzt9sYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLk+wzehdHCgbN+U8/9Rss3IOQbXIXL5eLBwkLEslt4=;
 b=p88THKORYRynncJ0KdtVU/N0mHDPfTHPbwA6mn1kuzsF3iFUy1Zzzljz+Jc7JLtbseOUwk19h6AYc0DHqVCCactl2AKO2NLrXmQ1t+KCezZohfkqWbILPJlk9PFx1Q2layh2feAn7V7A8p7JxnMuxRedwSO6JIdd2307/V2Vnws=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB6955.namprd12.prod.outlook.com (2603:10b6:510:1b8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 09:48:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8114.028; Wed, 6 Nov 2024
 09:48:51 +0000
Content-Type: multipart/alternative;
 boundary="------------dJPE21f00IcOLIHssqIaiflL"
Message-ID: <88ceb558-89d1-4d10-be8a-9ce2f3178fa5@amd.com>
Date: Wed, 6 Nov 2024 10:48:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
To: Matthew Brost <matthew.brost@intel.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Huang Rui <ray.huang@amd.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com
References: <20241031181048.2948948-1-matthew.brost@intel.com>
 <20241031181048.2948948-3-matthew.brost@intel.com>
 <ZyQWF/k9VFo99tDB@lstrano-desk.jf.intel.com> <ZykFrJIx9M204Weg@intel.com>
 <02ec3d6a-4727-4535-a384-4c6789fa4ef4@gmail.com>
 <ZylBWVjlW+GDYy5M@lstrano-desk.jf.intel.com>
 <c76830ae-c6f9-47a2-8087-32d9f7c3df2c@amd.com>
 <ZyplgNBaZ93UUdxY@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZyplgNBaZ93UUdxY@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: FR3P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB6955:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a4ae95c-be33-431e-1d12-08dcfe483818
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGVhK3hyZnZVK3c2ZzBSUXJXdjJYVk4vSm42QTBIZFpXenpYVmlTM1UyNXZW?=
 =?utf-8?B?c3BqMHFTd1g1cGVLc2ZJVktrWGc3UXRYM3d2amhjUTg3SEkzendKTmR4dS9j?=
 =?utf-8?B?eThKZnBGYVliVUlyS3oyZG1JMzN6OXJzb29NWnVGZ3BNLzlMTkIrR3o3aUJi?=
 =?utf-8?B?RU9ZWDhxTFNvS0lsWWpieTg1ODZrUFo2QmFMZ1R1U0V6eVRxdzBDa3dlQ25K?=
 =?utf-8?B?NGJmRW92cUpXN2pGRnl3cXJFV21jZG9mQ1FPVzc4bHhrd0orMDVWZFZ6cVVD?=
 =?utf-8?B?NU5IQm1uMWNFVXZaaFlza21SazAveGw0UXFNc0RpTmtnTXR0dTMyQ1JlZU1m?=
 =?utf-8?B?eTlUVmNUcVhjVC9zY1l2eERlcm5nMVpwMHp1aFVzZndHMmlueElVeXdwNXdh?=
 =?utf-8?B?VnpDVmQvY0l4d3FCOTUyNURTWk5qbFpEUU5ZNzhBRGEvL2c0NVM4dlkxeWpv?=
 =?utf-8?B?UEk1YTVpUTN6TmtudU5EN282SUxpY0NMVE9HdDRsMU4wMDh6Umt1clc1TEl4?=
 =?utf-8?B?aElsa2VidFhPazVvdmc2clY3bVo5ck0vSUQzTEs4dmdodDluQ0pWRTJnZ2V5?=
 =?utf-8?B?Sm9NR0phZWdBTW5EbE1NUTZZYVR1YmE5bXQ1NlZQdnloYklpZHM5T0ErNHU2?=
 =?utf-8?B?U1ZFLzB3aGd2NUkzNkNaTHcwa21MT2dKdTFZb3dJdTIwSXNSTnZFQ1NFN2Fv?=
 =?utf-8?B?QUgwRS9QYWNKM2R6MkpOejV4U1V2OTNsVFg3c2RMekFicnVxY3BCUWJGUWFG?=
 =?utf-8?B?WmJKUjVtQ1ltbHFLenNRNE5vbEVOemc5eE5LdGNLTSt0RnkxRmRHalRQRG1j?=
 =?utf-8?B?K3NkZUdIeWhRR3I4NXpSRGI4a3hLQjhQUVJnOU95V0FJMzdBVnNXcS95NFAr?=
 =?utf-8?B?ejgxbEZISWFKalplMFY4RVhDdkUvZGdraWg4cjV6MTBlYjhabzRENjVxMkdE?=
 =?utf-8?B?c1J6ekFWRGFYQi95Vm9Kb3dpYStZd2didE0yZzFWY0FtOExvSzlWbDhlR3g1?=
 =?utf-8?B?U2FUNVhzbnNlU1k2d0VRQlZhU3hDZk4wbkJkNHE1VmtSODVIeUVWUFdCWlNl?=
 =?utf-8?B?TlpMby9RQUR5a3dET2cvUE5YOTllUTY2RytkbU1kZ0NGbGtIcEs2bExrS3Mx?=
 =?utf-8?B?WmR4QUwvbmN1WnJHdkZhUEJWQWxNVVJ6a2RHUjJ2UnQ3VDhtWEdSMGRTRjJK?=
 =?utf-8?B?cWQ5eTRQYSsveWpGbjU4bS9meWZsNEZHZG1ueDgrVkhFckdyVDlwRXdHVm50?=
 =?utf-8?B?MjZtWDlOaFp3U3BCczBjSWV2blpzaWhtMHRWRVBHUTB0ZUhudUZock1vZmRt?=
 =?utf-8?B?M0NrN3loNXZhL1o5bGQzdGZSdGc4Wm5xWWs2TjdaMlIrbUg3QkVnVi9mOG1i?=
 =?utf-8?B?N1liRHRlSnVBOXpYL252TmdOMEVBODhobDRqSU1WUUtnSUlKbVNhRVNnbkc3?=
 =?utf-8?B?R2czRUJ5T0p3MEtmbkRadzFCd2k3VWUzT0l3M3FzbEQyQmczTmV5SjA1aWtv?=
 =?utf-8?B?c3ZVVURIQS9GWU1ITjFLOHYybEozK2J0eUcrZHB6V3h3TStFRnYwUGRQK0hG?=
 =?utf-8?B?cDFlSWpqeUxyaEcvVi9Pa05VUXZldmlMdVhWQ0xZUjc0bGNMdTZVSTRicEph?=
 =?utf-8?B?cGM3Q1ZUcnk5SjQrNFpuc25tV3YydWZJZHlaLzhnZTFvSTBibGdQK1IvNWVj?=
 =?utf-8?B?ODQrblVLSkpPUGljSUF6ZjJXdEdhMEJSOEJBRXJLOE9tWEpuZURpcVh2RnF0?=
 =?utf-8?Q?kXzTdPfBbNZu8ieSu0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjYwaWFqMVRiTkU1amdlU2h1NnVSRy9rak1hR25ZOWVzSUR4NHdLWVFCM21P?=
 =?utf-8?B?VXhDVklkVFBjbTRxU0dhSGVqT25qR1grSVpWWU8xQlkwYmozM2JLTmVsU2dY?=
 =?utf-8?B?dFFmM2svWUkzbXNuRVVZY1BVNlc4MFJ6MlJHTlhIelZqY3FwaWhJT1kreVBk?=
 =?utf-8?B?b2ZGRVRBNVFJU2xsaHltdS9DbUZlMXlPNkxPSW1FMzAybmdySlcrREppUXVH?=
 =?utf-8?B?Ykp6SGtDbmFwNTBPNnl3eUpCUHZrT2xrYVZmUHdCVlVMQ1JDRjd1T3dhd2l5?=
 =?utf-8?B?SlFLdjRlYUs2aHd0cUZrR1oyblNQN2prNzI0WXRObFJaQjNxQVFlazBFVVNq?=
 =?utf-8?B?WG5ha1lYMmQwSTh6cXl1Uml5bXdMemFWdkROWHdhVzRGWERCWHpCWFE1anFz?=
 =?utf-8?B?WFNsWCtNZUxkZzU2Q1R6YkxtY2ZGcnFObzV3QmROY0ZZOWtFdUVBWWFGWkYw?=
 =?utf-8?B?UndHTkZTOW9TT2sxTmlZV3ZtbDBvNUtPUTFySHlwRzloMHM3RHJsMmx2dXcx?=
 =?utf-8?B?dXc5U2lSUVB4Q005UVhaUHVRaG1WOE5SUGxuWm8zdjVEcFU2U3BoNmJSZnhk?=
 =?utf-8?B?czk1bFVUZ2hTRE5UTFNBTHdicFFaMUpJcDFqWHlsdDRiM01LV1ZvMHAwaWcv?=
 =?utf-8?B?MWYwdndLemNmNGZsYUlDem92TFhaMDQ3UzdoamZlZVJOMXltTWJyN3R5RkdG?=
 =?utf-8?B?aUdpc0gwUDI1Nzk4RTd5MDRPUFAxWjZuQzBHQ21wNTd1UHdvT0tLZERqekxn?=
 =?utf-8?B?bFBhUE5NV0lLMW9tZVVPV3pxOGtGMExhRFk1anVRMUFzM0g2VjJLVmZvK3k5?=
 =?utf-8?B?YWxkNHpPNGYyNkJ4V2VvMEcrL0xaRUs0by9rNCtjaWhpQnRzTW5rU2FkRDds?=
 =?utf-8?B?K0pETEFXRjdRME96N3hxcGZ3RytCKzdnU29oZVV5YjV0UDJzbTVkalBxbkM4?=
 =?utf-8?B?M1p6MEtKTUFWaWtTZGgvOWlCZUdKZmluSFhhckhHdkdhQWRtWXM1OXBMc2xO?=
 =?utf-8?B?Y0pCSUlQdWNpelc4YzFPKzgwQ3FEQVNNcW5yV2w0NENMclNBOGJndytnY2NS?=
 =?utf-8?B?SFVBMXdTR2xaTXUwWDFGSmNJSFBGV0NyT2JZUGNhQWxCclErTUZyMWJOcG1p?=
 =?utf-8?B?aGZOem8rZHNyTm05YWU1Z05lZXYzc242Vk9XNUFCTjh0V3RHY1JSZmViM0dz?=
 =?utf-8?B?enI3ckxZeTdWZG9kTzZHWlY0KzN6ZmxVWXErRG9XOVFQNnpiV2dMemhPNHQy?=
 =?utf-8?B?dUE2Rk43M2VjVFhIVDhFM1BmMml4VFpza3BFYlRUUm5nWVcwNW80SE9VRE1N?=
 =?utf-8?B?TlplaGhJdndJYlBqcFp1MFFnOGk3cGNzOVF1ajBBcURnS3RMTmxNUU44QXox?=
 =?utf-8?B?Y09lRzBQbkNvQUtvYVlIem1yeHNidzF4a1h3UzRpN1lHT2pINEdyZ3Nid1RY?=
 =?utf-8?B?MHZvSVFPemJqdjZQbDhXcTZnbWV3WGZkcHdqN09DS2s2Z2ZTMGNHQ3lZRzBD?=
 =?utf-8?B?ZmU3NTUyR1ltaDNGRUoxR1RqUStCZ1hnVUpGcHZuQ2Q2VzBRNnlDeWp6MkM2?=
 =?utf-8?B?K0tjVHhjeEJmZDZjSkZjYXBid21vYnJOTjRYTG93NkxvL0xuWVhlcFBreCtD?=
 =?utf-8?B?dVcwR081NU9UK25oRVlWQW5KTWVVNnFJWTBGRmEzb1lQVXhsQ0F1YktQZWVa?=
 =?utf-8?B?cnlnVU9ZM2NCWFJUYUJGRUNPaE4reFhXeUZpcGZNUnRDbW1vaDZrUTJKL3pj?=
 =?utf-8?B?dU5WcFV6WXlMcWM5czVqNjRoYzZDMmd3Z0sxUEJXZWhuU2tnL3FsMnY2ZHZs?=
 =?utf-8?B?ZkJGODdBNzBlclBHM2dncWNDN0s4cjZJbmJBQllKUVI5NlY4L0dHMGU3OEhC?=
 =?utf-8?B?YVl1SFZLSUo5L3lxbGtjNUIwRmozSU92YXlwZ0pRM2x6S2ZXWDJydElTM0ZO?=
 =?utf-8?B?WmhsWmtwUmJKYzFSTmVPUkxFTDFtVXhWS0VGNGlMc0FteE5GRk9TaVZ6ZWhk?=
 =?utf-8?B?S3ZtN3NVMTJ3ZEhucCt2Mk5GT3dUR3JhOWhGUmZKUkU0TGNCTzkzME1BMHFP?=
 =?utf-8?B?VVh1Rkc2MUlMemhaa0hhMHVYRHgwMDNIK2QyL3JnaUwyaGorR1BUYllKZG44?=
 =?utf-8?Q?c2sYcNG1XZInUDF2DXQWFs3M0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a4ae95c-be33-431e-1d12-08dcfe483818
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 09:48:51.7795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dcUdkTs8dr6pXMV0y691rCqtnlTNUlB5xe7KsIK4gZZjyZe0xWKUz+JL7XZb7sEJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6955
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

--------------dJPE21f00IcOLIHssqIaiflL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 05.11.24 um 19:35 schrieb Matthew Brost:
> [SNIP]
>> Well we spend quite some time removing single page mappings from device
>> drivers.
>>
>> The only remaining use case of ttm_bo_kmap() with just one page is the
>> ttm_bo_vm_access_kmap() function and I was really hoping to make that one
>> TTM internal at some point.
>>
> This is still static, right? I suppose this exposes this to the outside
> world though in another place. I asume there is a reason we can't use
> vmap in ttm_bo_vm_access?

Well no, the point is we don't want to.

There is a huge push from upstream to avoid using kmap/vmap if possible.

>>>> You need a really good justification to bring that back.
>>>>
>>> The use case is EuDebugger requires essentially the same functionality
>>> as ptrace -> vm_access.
>> Then why don't you use ptrace in the first place?
>>
> I think the debugger speaks in GPU address space thus needs to access
> via the GPU VM -> BO, userptrs.

Exactly that is strictly forbidden. You can't access userptrs through this.

That's one of the major reasons why upstream has pushed back on using 
kmap so massively.

Can you fully describe your use case? In other words what exactly is 
your debugger trying to do?

>>> TTM mapping non-contiguous VRAM doesn't work unless I'm blind. User BOs
>>> which the EuDebugger accesses can be non-contiguous, hence the new
>>> helper.
>> Then why don't you handle that inside the driver in the first place instead
>> of going through a TTM midlayer?
>>
> Well common code always seems like a good idea to me. Can do this if you
> insist though.
>
> What if I change my new helper ttm_bo_access to be based on vmap for
> SYSTEM / TT but honestly that seems wasteful too for a temporary
> access mapping.

Well, I think we need to take a step back. The major question is what is 
your use case and is that use case valid or causes security concerns.

For example userptrs are imported anonymous pages the GPU has a DMA 
mapping for. Re-mapping them into an user address space for debugging or 
even accessing them through the ptrace interface is strictly forbidden.

We already had people trying to do exactly that and it ended not well at 
all.

Regards,
Christian.

>
> With this, I strongly prefer the code as is.
>
> Matt
>
>> Regards,
>> Christian.
>>
>>> Matt
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>> Matt
>>>>>>
>>>>>>> Reported-by: Christoph Manszewski<christoph.manszewski@intel.com>
>>>>>>> Suggested-by: Thomas Hellström<thomas.hellstrom@linux.intel.com>
>>>>>>> Signed-off-by: Matthew Brost<matthew.brost@intel.com>
>>>>>>> Tested-by: Mika Kuoppala<mika.kuoppala@linux.intel.com>
>>>>>>> Reviewed-by: Matthew Auld<matthew.auld@intel.com>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/ttm/ttm_bo_util.c | 86 +++++++++++++++++++++++++++++++
>>>>>>>     drivers/gpu/drm/ttm/ttm_bo_vm.c   | 65 +----------------------
>>>>>>>     include/drm/ttm/ttm_bo.h          |  2 +
>>>>>>>     3 files changed, 89 insertions(+), 64 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>>>>> index d939925efa81..77e760ea7193 100644
>>>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>>>>> @@ -919,3 +919,89 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
>>>>>>>     	return progress;
>>>>>>>     }
>>>>>>> +
>>>>>>> +static int ttm_bo_access_kmap(struct ttm_buffer_object *bo,
>>>>>>> +			      unsigned long offset,
>>>>>>> +			      void *buf, int len, int write)
>>>>>>> +{
>>>>>>> +	unsigned long page = offset >> PAGE_SHIFT;
>>>>>>> +	unsigned long bytes_left = len;
>>>>>>> +	int ret;
>>>>>>> +
>>>>>>> +	/* Copy a page at a time, that way no extra virtual address
>>>>>>> +	 * mapping is needed
>>>>>>> +	 */
>>>>>>> +	offset -= page << PAGE_SHIFT;
>>>>>>> +	do {
>>>>>>> +		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
>>>>>>> +		struct ttm_bo_kmap_obj map;
>>>>>>> +		void *ptr;
>>>>>>> +		bool is_iomem;
>>>>>>> +
>>>>>>> +		ret = ttm_bo_kmap(bo, page, 1, &map);
>>>>>>> +		if (ret)
>>>>>>> +			return ret;
>>>>>>> +
>>>>>>> +		ptr = (void *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
>>>>>>> +		WARN_ON_ONCE(is_iomem);
>>>>>>> +		if (write)
>>>>>>> +			memcpy(ptr, buf, bytes);
>>>>>>> +		else
>>>>>>> +			memcpy(buf, ptr, bytes);
>>>>>>> +		ttm_bo_kunmap(&map);
>>>>>>> +
>>>>>>> +		page++;
>>>>>>> +		buf += bytes;
>>>>>>> +		bytes_left -= bytes;
>>>>>>> +		offset = 0;
>>>>>>> +	} while (bytes_left);
>>>>>>> +
>>>>>>> +	return len;
>>>>>>> +}
>>>>>>> +
>>>>>>> +/**
>>>>>>> + * ttm_bo_access - Helper to access a buffer object
>>>>>>> + *
>>>>>>> + * @bo: ttm buffer object
>>>>>>> + * @offset: access offset into buffer object
>>>>>>> + * @buf: pointer to caller memory to read into or write from
>>>>>>> + * @len: length of access
>>>>>>> + * @write: write access
>>>>>>> + *
>>>>>>> + * Utility function to access a buffer object. Useful when buffer object cannot
>>>>>>> + * be easily mapped (non-contiguous, non-visible, etc...).
>>>>>>> + *
>>>>>>> + * Returns:
>>>>>>> + * @len if successful, negative error code on failure.
>>>>>>> + */
>>>>>>> +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
>>>>>>> +		  void *buf, int len, int write)
>>>>>>> +{
>>>>>>> +	int ret;
>>>>>>> +
>>>>>>> +	if (len < 1 || (offset + len) > bo->base.size)
>>>>>>> +		return -EIO;
>>>>>>> +
>>>>>>> +	ret = ttm_bo_reserve(bo, true, false, NULL);
>>>>>>> +	if (ret)
>>>>>>> +		return ret;
>>>>>>> +
>>>>>>> +	switch (bo->resource->mem_type) {
>>>>>>> +	case TTM_PL_SYSTEM:
>>>>>>> +		fallthrough;
>>>>>>> +	case TTM_PL_TT:
>>>>>>> +		ret = ttm_bo_access_kmap(bo, offset, buf, len, write);
>>>>>>> +		break;
>>>>>>> +	default:
>>>>>>> +		if (bo->bdev->funcs->access_memory)
>>>>>>> +			ret = bo->bdev->funcs->access_memory
>>>>>>> +				(bo, offset, buf, len, write);
>>>>>>> +		else
>>>>>>> +			ret = -EIO;
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	ttm_bo_unreserve(bo);
>>>>>>> +
>>>>>>> +	return ret;
>>>>>>> +}
>>>>>>> +EXPORT_SYMBOL(ttm_bo_access);
>>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>>> index 2c699ed1963a..20b1e5f78684 100644
>>>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>>> @@ -366,45 +366,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma)
>>>>>>>     }
>>>>>>>     EXPORT_SYMBOL(ttm_bo_vm_close);
>>>>>>> -static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
>>>>>>> -				 unsigned long offset,
>>>>>>> -				 uint8_t *buf, int len, int write)
>>>>>>> -{
>>>>>>> -	unsigned long page = offset >> PAGE_SHIFT;
>>>>>>> -	unsigned long bytes_left = len;
>>>>>>> -	int ret;
>>>>>>> -
>>>>>>> -	/* Copy a page at a time, that way no extra virtual address
>>>>>>> -	 * mapping is needed
>>>>>>> -	 */
>>>>>>> -	offset -= page << PAGE_SHIFT;
>>>>>>> -	do {
>>>>>>> -		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
>>>>>>> -		struct ttm_bo_kmap_obj map;
>>>>>>> -		void *ptr;
>>>>>>> -		bool is_iomem;
>>>>>>> -
>>>>>>> -		ret = ttm_bo_kmap(bo, page, 1, &map);
>>>>>>> -		if (ret)
>>>>>>> -			return ret;
>>>>>>> -
>>>>>>> -		ptr = (uint8_t *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
>>>>>>> -		WARN_ON_ONCE(is_iomem);
>>>>>>> -		if (write)
>>>>>>> -			memcpy(ptr, buf, bytes);
>>>>>>> -		else
>>>>>>> -			memcpy(buf, ptr, bytes);
>>>>>>> -		ttm_bo_kunmap(&map);
>>>>>>> -
>>>>>>> -		page++;
>>>>>>> -		buf += bytes;
>>>>>>> -		bytes_left -= bytes;
>>>>>>> -		offset = 0;
>>>>>>> -	} while (bytes_left);
>>>>>>> -
>>>>>>> -	return len;
>>>>>>> -}
>>>>>>> -
>>>>>>>     int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>>>>>>     		     void *buf, int len, int write)
>>>>>>>     {
>>>>>>> @@ -412,32 +373,8 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>>>>>>     	unsigned long offset = (addr) - vma->vm_start +
>>>>>>>     		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
>>>>>>>     		 << PAGE_SHIFT);
>>>>>>> -	int ret;
>>>>>>> -
>>>>>>> -	if (len < 1 || (offset + len) > bo->base.size)
>>>>>>> -		return -EIO;
>>>>>>> -	ret = ttm_bo_reserve(bo, true, false, NULL);
>>>>>>> -	if (ret)
>>>>>>> -		return ret;
>>>>>>> -
>>>>>>> -	switch (bo->resource->mem_type) {
>>>>>>> -	case TTM_PL_SYSTEM:
>>>>>>> -		fallthrough;
>>>>>>> -	case TTM_PL_TT:
>>>>>>> -		ret = ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
>>>>>>> -		break;
>>>>>>> -	default:
>>>>>>> -		if (bo->bdev->funcs->access_memory)
>>>>>>> -			ret = bo->bdev->funcs->access_memory(
>>>>>>> -				bo, offset, buf, len, write);
>>>>>>> -		else
>>>>>>> -			ret = -EIO;
>>>>>>> -	}
>>>>>>> -
>>>>>>> -	ttm_bo_unreserve(bo);
>>>>>>> -
>>>>>>> -	return ret;
>>>>>>> +	return ttm_bo_access(bo, offset, buf, len, write);
>>>>>>>     }
>>>>>>>     EXPORT_SYMBOL(ttm_bo_vm_access);
>>>>>>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>>>>>>> index 5804408815be..8ea11cd8df39 100644
>>>>>>> --- a/include/drm/ttm/ttm_bo.h
>>>>>>> +++ b/include/drm/ttm/ttm_bo.h
>>>>>>> @@ -421,6 +421,8 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo);
>>>>>>>     int ttm_bo_evict_first(struct ttm_device *bdev,
>>>>>>>     		       struct ttm_resource_manager *man,
>>>>>>>     		       struct ttm_operation_ctx *ctx);
>>>>>>> +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
>>>>>>> +		  void *buf, int len, int write);
>>>>>>>     vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
>>>>>>>     			     struct vm_fault *vmf);
>>>>>>>     vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>>>>>>> -- 
>>>>>>> 2.34.1
>>>>>>>

--------------dJPE21f00IcOLIHssqIaiflL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 05.11.24 um 19:35 schrieb Matthew Brost:<br>
    <blockquote type="cite" cite="mid:ZyplgNBaZ93UUdxY@lstrano-desk.jf.intel.com">[SNIP]<span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Well we spend quite some time removing single page mappings from device
drivers.

The only remaining use case of ttm_bo_kmap() with just one page is the
ttm_bo_vm_access_kmap() function and I was really hoping to make that one
TTM internal at some point.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This is still static, right? I suppose this exposes this to the outside
world though in another place. I asume there is a reason we can't use
vmap in ttm_bo_vm_access?</pre>
    </blockquote>
    <br>
    Well no, the point is we don't want to.<br>
    <br>
    There is a huge push from upstream to avoid using kmap/vmap if
    possible.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:ZyplgNBaZ93UUdxY@lstrano-desk.jf.intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">You need a really good justification to bring that back.

</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">The use case is EuDebugger requires essentially the same functionality
as ptrace -&gt; vm_access.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Then why don't you use ptrace in the first place?

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I think the debugger speaks in GPU address space thus needs to access
via the GPU VM -&gt; BO, userptrs.</pre>
    </blockquote>
    <br>
    Exactly that is strictly forbidden. You can't access userptrs
    through this.<br>
    <br>
    That's one of the major reasons why upstream has pushed back on
    using kmap so massively.<br>
    <br>
    Can you fully describe your use case? In other words what exactly is
    your debugger trying to do?<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:ZyplgNBaZ93UUdxY@lstrano-desk.jf.intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">TTM mapping non-contiguous VRAM doesn't work unless I'm blind. User BOs
which the EuDebugger accesses can be non-contiguous, hence the new
helper.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Then why don't you handle that inside the driver in the first place instead
of going through a TTM midlayer?

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Well common code always seems like a good idea to me. Can do this if you
insist though.

What if I change my new helper ttm_bo_access to be based on vmap for
SYSTEM / TT but honestly that seems wasteful too for a temporary
access mapping.</pre>
    </blockquote>
    <br>
    Well, I think we need to take a step back. The major question is
    what is your use case and is that use case valid or causes security
    concerns.<br>
    <br>
    For example userptrs are imported anonymous pages the GPU has a DMA
    mapping for. Re-mapping them into an user address space for
    debugging or even accessing them through the ptrace interface is
    strictly forbidden.<br>
    <br>
    We already had people trying to do exactly that and it ended not
    well at all.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:ZyplgNBaZ93UUdxY@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">

With this, I strongly prefer the code as is.

Matt

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Regards,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Matt

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Regards,
Christian.

</pre>
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Matt

</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">Reported-by: Christoph Manszewski<a class="moz-txt-link-rfc2396E" href="mailto:christoph.manszewski@intel.com">&lt;christoph.manszewski@intel.com&gt;</a>
Suggested-by: Thomas Hellström<a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>
Signed-off-by: Matthew Brost<a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Tested-by: Mika Kuoppala<a class="moz-txt-link-rfc2396E" href="mailto:mika.kuoppala@linux.intel.com">&lt;mika.kuoppala@linux.intel.com&gt;</a>
Reviewed-by: Matthew Auld<a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
---
   drivers/gpu/drm/ttm/ttm_bo_util.c | 86 +++++++++++++++++++++++++++++++
   drivers/gpu/drm/ttm/ttm_bo_vm.c   | 65 +----------------------
   include/drm/ttm/ttm_bo.h          |  2 +
   3 files changed, 89 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index d939925efa81..77e760ea7193 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -919,3 +919,89 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
   	return progress;
   }
+
+static int ttm_bo_access_kmap(struct ttm_buffer_object *bo,
+			      unsigned long offset,
+			      void *buf, int len, int write)
+{
+	unsigned long page = offset &gt;&gt; PAGE_SHIFT;
+	unsigned long bytes_left = len;
+	int ret;
+
+	/* Copy a page at a time, that way no extra virtual address
+	 * mapping is needed
+	 */
+	offset -= page &lt;&lt; PAGE_SHIFT;
+	do {
+		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
+		struct ttm_bo_kmap_obj map;
+		void *ptr;
+		bool is_iomem;
+
+		ret = ttm_bo_kmap(bo, page, 1, &amp;map);
+		if (ret)
+			return ret;
+
+		ptr = (void *)ttm_kmap_obj_virtual(&amp;map, &amp;is_iomem) + offset;
+		WARN_ON_ONCE(is_iomem);
+		if (write)
+			memcpy(ptr, buf, bytes);
+		else
+			memcpy(buf, ptr, bytes);
+		ttm_bo_kunmap(&amp;map);
+
+		page++;
+		buf += bytes;
+		bytes_left -= bytes;
+		offset = 0;
+	} while (bytes_left);
+
+	return len;
+}
+
+/**
+ * ttm_bo_access - Helper to access a buffer object
+ *
+ * @bo: ttm buffer object
+ * @offset: access offset into buffer object
+ * @buf: pointer to caller memory to read into or write from
+ * @len: length of access
+ * @write: write access
+ *
+ * Utility function to access a buffer object. Useful when buffer object cannot
+ * be easily mapped (non-contiguous, non-visible, etc...).
+ *
+ * Returns:
+ * @len if successful, negative error code on failure.
+ */
+int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
+		  void *buf, int len, int write)
+{
+	int ret;
+
+	if (len &lt; 1 || (offset + len) &gt; bo-&gt;base.size)
+		return -EIO;
+
+	ret = ttm_bo_reserve(bo, true, false, NULL);
+	if (ret)
+		return ret;
+
+	switch (bo-&gt;resource-&gt;mem_type) {
+	case TTM_PL_SYSTEM:
+		fallthrough;
+	case TTM_PL_TT:
+		ret = ttm_bo_access_kmap(bo, offset, buf, len, write);
+		break;
+	default:
+		if (bo-&gt;bdev-&gt;funcs-&gt;access_memory)
+			ret = bo-&gt;bdev-&gt;funcs-&gt;access_memory
+				(bo, offset, buf, len, write);
+		else
+			ret = -EIO;
+	}
+
+	ttm_bo_unreserve(bo);
+
+	return ret;
+}
+EXPORT_SYMBOL(ttm_bo_access);
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 2c699ed1963a..20b1e5f78684 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -366,45 +366,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma)
   }
   EXPORT_SYMBOL(ttm_bo_vm_close);
-static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
-				 unsigned long offset,
-				 uint8_t *buf, int len, int write)
-{
-	unsigned long page = offset &gt;&gt; PAGE_SHIFT;
-	unsigned long bytes_left = len;
-	int ret;
-
-	/* Copy a page at a time, that way no extra virtual address
-	 * mapping is needed
-	 */
-	offset -= page &lt;&lt; PAGE_SHIFT;
-	do {
-		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
-		struct ttm_bo_kmap_obj map;
-		void *ptr;
-		bool is_iomem;
-
-		ret = ttm_bo_kmap(bo, page, 1, &amp;map);
-		if (ret)
-			return ret;
-
-		ptr = (uint8_t *)ttm_kmap_obj_virtual(&amp;map, &amp;is_iomem) + offset;
-		WARN_ON_ONCE(is_iomem);
-		if (write)
-			memcpy(ptr, buf, bytes);
-		else
-			memcpy(buf, ptr, bytes);
-		ttm_bo_kunmap(&amp;map);
-
-		page++;
-		buf += bytes;
-		bytes_left -= bytes;
-		offset = 0;
-	} while (bytes_left);
-
-	return len;
-}
-
   int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
   		     void *buf, int len, int write)
   {
@@ -412,32 +373,8 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
   	unsigned long offset = (addr) - vma-&gt;vm_start +
   		((vma-&gt;vm_pgoff - drm_vma_node_start(&amp;bo-&gt;base.vma_node))
   		 &lt;&lt; PAGE_SHIFT);
-	int ret;
-
-	if (len &lt; 1 || (offset + len) &gt; bo-&gt;base.size)
-		return -EIO;
-	ret = ttm_bo_reserve(bo, true, false, NULL);
-	if (ret)
-		return ret;
-
-	switch (bo-&gt;resource-&gt;mem_type) {
-	case TTM_PL_SYSTEM:
-		fallthrough;
-	case TTM_PL_TT:
-		ret = ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
-		break;
-	default:
-		if (bo-&gt;bdev-&gt;funcs-&gt;access_memory)
-			ret = bo-&gt;bdev-&gt;funcs-&gt;access_memory(
-				bo, offset, buf, len, write);
-		else
-			ret = -EIO;
-	}
-
-	ttm_bo_unreserve(bo);
-
-	return ret;
+	return ttm_bo_access(bo, offset, buf, len, write);
   }
   EXPORT_SYMBOL(ttm_bo_vm_access);
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 5804408815be..8ea11cd8df39 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -421,6 +421,8 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo);
   int ttm_bo_evict_first(struct ttm_device *bdev,
   		       struct ttm_resource_manager *man,
   		       struct ttm_operation_ctx *ctx);
+int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
+		  void *buf, int len, int write);
   vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
   			     struct vm_fault *vmf);
   vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
-- 
2.34.1

</pre>
                </blockquote>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------dJPE21f00IcOLIHssqIaiflL--
