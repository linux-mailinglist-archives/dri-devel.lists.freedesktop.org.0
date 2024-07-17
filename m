Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FD8933ED5
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 16:50:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4550B10E071;
	Wed, 17 Jul 2024 14:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="maUqHdm+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E8610E071;
 Wed, 17 Jul 2024 14:50:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dAemWwypcZ4djKUlh4fzMPSBrlN4dnb58qV3rQWJrKP+Hd/mo3oUX2vw39DVL/cafUXV9xcp48NGl5DYyhMkyLdYwCi+zOhZ8D4gznZyHjnyZPy2sZlZadCOxhHxGavSb+3FtM/6GcYik50dHQSrDOhMRV1fUwnjy1Ghce5PMIhcNcqLuLpkU1c/gk/6JxfC5qpIwsRUjhL2j98N/htT9UqVOhkaHXQdFAP4DABhGqy6PiHhtsln3POXnKxkX7CSr1vaU6WxRnf9nc4wc2OZMF4AkADtWWEisJgL5Qo9M298/Wuy/d2wPX1YvLu0dqLFSSSgZBcBInG2HkP9NLQw1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQin1TEiF5QJVNy9L8ujsCPhNkGU9GC/ILORtH7t5zQ=;
 b=ByZ1ki8XMNyXgpe6fttg44EkFdQGGqVEfdl/JoOVbyo9PPFovQJmXE3lD4Q+40fuPatu0XoBElgso4554VGQUn/KSOZl3IXo93lxyQtMYZo/TcIVr6KZK+2Oae7td2f3em8SB8UxePa+zjFW3k2dKKvMg3b4rsXeODoAfDwqI/j0W9u4WH0wGRJ9MI2Aa+UcPmEEnshRva+mx27i8q305MhIfBCojNp7sd+QW6gSnaPlJ+WhK/pULzccTtfMyngTKmNG10XQJaGY6B+ue9CLbcl2/Cab187FermlmawA0nAAvElVZo9uvGnq1xFWssi9GQWfelz77n6BSuJ69AZJQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQin1TEiF5QJVNy9L8ujsCPhNkGU9GC/ILORtH7t5zQ=;
 b=maUqHdm+joHUbCkP0OAeiSqRsVJCZ5i3j88FlQjhmoN22kgIWHsUdsmYHjC8wrjO4sXBn6cNVtMoZnpg87GO6FLycqrXGkT8YzbuqhEm2Pht2fnQjPY5pACj0Tr/UXSBxM480larseTuQsxIFZfvFQrJVbY98WTfE91fF81i264=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB8616.namprd12.prod.outlook.com (2603:10b6:a03:485::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.24; Wed, 17 Jul
 2024 14:50:42 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7762.027; Wed, 17 Jul 2024
 14:50:42 +0000
Content-Type: multipart/alternative;
 boundary="------------0Cqn626exje0I05YD0r312Df"
Message-ID: <2e948404-69f0-4ab6-9db6-ac5114c885c4@amd.com>
Date: Wed, 17 Jul 2024 16:50:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/amdgpu: Add address alignment support to DCC
 buffers
To: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, matthew.auld@intel.com,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 "Min, Frank" <frank.min@amd.com>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?=
 <marek.olsak@amd.com>
References: <20240716152104.377039-1-Arunpravin.PaneerSelvam@amd.com>
 <20240716152104.377039-2-Arunpravin.PaneerSelvam@amd.com>
 <CAAxE2A6gpvLcq7zDhTDgV1BiBZdbK6t7147ESpq0ufYqW-6gzQ@mail.gmail.com>
 <2a2ea485-50e0-48cb-bb02-736a03368ab7@amd.com>
 <0437c61a-9283-4827-98d0-e7a9a7baa898@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <0437c61a-9283-4827-98d0-e7a9a7baa898@amd.com>
X-ClientProxiedBy: YQBPR0101CA0063.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::40) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB8616:EE_
X-MS-Office365-Filtering-Correlation-Id: f1defd15-5afe-4c1f-3d93-08dca66fd4ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWVnTUQzWnpOc1ArNjRsNG1QdEg4N0JpSDZ3bDZFRmI2MVR1VmhYUERkc1ZP?=
 =?utf-8?B?dWpIUWF3QWEzUElQTndyR3BjcCtLMVNlT2RNQzVxanNYWTljQ3I0SVM1MlRR?=
 =?utf-8?B?Q25jVG5XcFA4RHNHUklrZWdYRmpsVXdMK0JrY0NHL1Y3aUR2eXBLVVpMWXFw?=
 =?utf-8?B?VHB6eGZnUytBKzNjcnAybkJZV04valpTTWFyZjZjaGRYNEt2V2I1Ym9RZWFw?=
 =?utf-8?B?L29uMWxpTTdGWURHQjN6RWhWKzlmaWpBa0lmZVNzZW82UUJRY0ZMYmFSeEhP?=
 =?utf-8?B?VXcyV1liTDd1SE4wTjVIL0ZQWGN5RFFPRmN4ekdXSHRKU2IyZjVtaml1Wlda?=
 =?utf-8?B?L2NtVG9lcVBKOXBBRCs1bFZubVR5YkhBUy9aSGZiQUxwUXEwY1RycVM0TTc0?=
 =?utf-8?B?SXlkaE9zTkdKbklYZjJEcG1wTGxMWEJhWjc4dStNRzEzVjd0eWJpVUxKZmFJ?=
 =?utf-8?B?VGQ3SGhDbHNiaVhqNnNwTkJMdXZjMzliUlFybjJtTmlybGN5YkN1OEd6RlpU?=
 =?utf-8?B?V1oyY2hybHNoZlpBZTJDaVkzQUdhZnFqNGpia0lPeXFsTkVjaVB6ZlVJQ2JB?=
 =?utf-8?B?dXl6M1hCNmVzTjJuWEF1MFUzSkNldkFyL1RJMFZsMlExdGFqeDNvcUZtbE9X?=
 =?utf-8?B?ZjNJTjNBa3Y2Z1V6TjlxQnRuN2h3Y2xuWTl3NnNKaXpyMktvdzk4UWVRZ09l?=
 =?utf-8?B?RVFNOHV6cnRBb1NGbHZaWll3Tk1zb3hRSkhDTDRBZEhURWZaSHpvdUVUYmZT?=
 =?utf-8?B?QTJ2L28yNCs0cUNSb3ZGa2hZTmh6N0FTRGRvMk9jcEZRK3FITkRpb1FUR0pz?=
 =?utf-8?B?L3lnTVpJSFZmQUlTRmlOQVlhUU4vaXM1NEFkSHBYYkI5TjB2d1M1VGw5Q1k0?=
 =?utf-8?B?MloxdW9zSVVIRCszRVUrakl5dUFjRWcxN1d0cndXQjQwTUJRQTJvRjVUMWNo?=
 =?utf-8?B?UGEvS040VVFPYnRZV285YXU0ZzdaWDJ1eDZrVHpiYi9OYjlnbGZwK09YWkU1?=
 =?utf-8?B?U0N1RWZ6aFNYUVJId1Y0V2pERGlRdmhvNnl2QXRPNi9acWVFdjZwMHk2ZjVr?=
 =?utf-8?B?RG9vZWc5SmtXRHdlRmFMc2VDTUFTNmlINFZxYUVPa1V0aTVXdGNtWnZVakpZ?=
 =?utf-8?B?ZnprUXdHWmd5azhVV0grZnpkYThiWVlpNWNGM2J2T2x6ZUlSS0ZUL1o5eDRC?=
 =?utf-8?B?aDUwOXJ2SzlqVnFRSU1mTEl1M1JvRGFGOG1seDZCb2dlUVV4RmU4WjMzdmd3?=
 =?utf-8?B?Zm9JMExJU0IyMnVXd3NqTFRTQ2RZY3JJMVNkcE12T1BZdVdGZ1dDdEs4dVFu?=
 =?utf-8?B?K0lUR2JaaEw4TE1SVFdUNlpCRFp2QjdHUmZ0aFo2bFVteTNTNHplVjQwR2U4?=
 =?utf-8?B?TjFVQVNVK2VlZW9lQzlrMVcwMWI3Ty9sZ1VPajBDR3FQRHhTUUdiKzVrNGZy?=
 =?utf-8?B?K1ZLU2ZNZEFMekNKbURJVlpxVUM0TUVhZ3VjVmRCSkhPajdkWUxnRTNpNnkw?=
 =?utf-8?B?TldwUGtzTVA5M1ROSUtMSW9qTGpYUjFSU0JCdzVyMTVNbDhrczR1NHl1NkRn?=
 =?utf-8?B?b3hld3B1dmUvcjdWMCtQVERHSG1BVUNscHZMY0ZaZG5qZkxWUlNoZTBvbG90?=
 =?utf-8?B?dDJoeVRvSHBJcVNvZDJ0YzUzUE50MVIrYjlBV1MzZEppdlJ2SGpYdzU0OVhY?=
 =?utf-8?B?amtETDhrL0pkWlFoNmZWMmliQ2Z1VXhlanRpaGpGbThtcC81aFNKaUIyelFl?=
 =?utf-8?B?djcyMXJ4cG9hNm1vbVdjVzJpVG1BQXJBejVzMWU1RlFFY3YwSzJMRUFrK1N6?=
 =?utf-8?B?Y1Y0ZnZnS20xUVFMUXJaZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3M1bFl3VEl0b2dwK240M2xzcHNSWWZlREZXb0g1TTJENEN2Q1RDNVFpN2N6?=
 =?utf-8?B?Yk82NnV6eHYyeWRHc2xpWEFKZ2pPUHh1ekVKTWpUSDRWQkduU2hZVzVCQkVJ?=
 =?utf-8?B?VnhEZ2p2SFJHa1o5N0hPNnVTQTFndW5STjlBY3k4REh6cEJqU01rQUI4ZmtM?=
 =?utf-8?B?VVgvZk1IWnIzWTNsdVptUDJUNmJuN3UrYW5FbWRCZmxJQW0zeHJQYzJ5SEsz?=
 =?utf-8?B?YkdXb2IvLzEvRmVLU2VraCtLMnNxMUc5eXN4Y2FCd0l4ZzZ3YkUyc0FCbGt0?=
 =?utf-8?B?ZDdKakF1VDB0UW9oWXhHWEhpS3pQWFFzNnkyZWFXZDRCSEowYWxhdDJCQ1NM?=
 =?utf-8?B?SmJDOWgyaHJHUzMzeW1pTEVhM0VlVjhsZE9aMC9mWlFkZFUwcG1QdVYzSXNt?=
 =?utf-8?B?RndCOFFvWnhDSmxSZzhibFAvdk9ZQ0UyWW1VVktFeER2TTltRUpKWU1MTVp3?=
 =?utf-8?B?bkV4SjF3b2Z0Q0lpamxtSFFhMGxINEtzVTJFNTFHZG1VYno5NFduLzBwNWJJ?=
 =?utf-8?B?SVA1SUR1V3hUS0hJQlYwa2ZnVG8wdmJxbUFvL1lvQ1puTmI5UzZoZ0g4MEZ3?=
 =?utf-8?B?MWQ4YVUwNjBVR1YyZ0hUT0tyUjh5eEx5TEhKTCs0Z1FvUWRjQVZySWFOaVcr?=
 =?utf-8?B?cEpuaXlLNEN1czFHQnBsZGRML28wT3NRaWhudm85elpFdWc0QWxCaUpnMXlq?=
 =?utf-8?B?bDc4UWo5Z1QxSjhvMVZaamlQUUZXQWI0M25YTWtkL2tMNVVqMGdJdWk2enNM?=
 =?utf-8?B?bGx4WVQzcXArL2hVb1ZZalNkeGE5aXdCRURMcjY4dWZ3MmMwN3hxU3paaC95?=
 =?utf-8?B?QVR6b0xwWk5YN2tONjh0VFpCK3ZraVFjckpBLytCM3BGbmtHdGlKS2M1bUo5?=
 =?utf-8?B?MERHMXlhQmxNS3FoZUk3cUNhT3BBclJnZ0VzaWhIWFlxTnZyYWxVRWx0WDkr?=
 =?utf-8?B?OWU0Z1BldlFnQ0paMDhRdnZGSmw4R2RrTk9DU2paWmJyL3RiQjFIbWgrWmda?=
 =?utf-8?B?T250ay9HZTBlRkcwVzdUWmNqV1BYdXRrREl3Vm8yVjJmMkVweVFuQitnNkFl?=
 =?utf-8?B?ak1qK1hhTkFlVEwwTnl3OTNYTkV5VXVVS0xLdHhjL3FEOTRERnF4RlA2c3NL?=
 =?utf-8?B?ZTVCbDZOWHBWd1FhMHZaeVJlbmg2QjRLL3ZrTWlGUDZUMmd3UktTQ3RvOGs2?=
 =?utf-8?B?K2pFTkpnL0RCYXB6U2JENXJXRURUcE5TTmQyTHF4WGhGcEhpaDViTHNHNkVR?=
 =?utf-8?B?QXFJdjA2elJQZUNIOFJtTGk0bWZBQmRNSDdlREZabU40aEdoSWNSTHZ2d2Vl?=
 =?utf-8?B?b3ZGQzN4Z1VjK01GbU5GdEhSbks1QTJxMUdmb1lQVTN4SWRzclJ2MXZkTXRI?=
 =?utf-8?B?dW82ZGR0bTRoNXdEYmdqZjFDenNUR3Nubm1PVXRsU1MrL2lNNmdHY2tSejhH?=
 =?utf-8?B?NnlMVk84VERaeDNONktLSkRyQStkOEw0M1RQcG5BalhnS0FucXhXOHNBMzlZ?=
 =?utf-8?B?Mk1rODMzdmUzOGZKK2dkcWdLaEtmbFJqTG1CejZpQ0VjYXZkQVk3NWw1djJl?=
 =?utf-8?B?OUlkaUpSN3NrYnhFd1AxZElVTHlSWlo4bXB0NTJrZkRyN0ZqMkx6K0VNaE1P?=
 =?utf-8?B?TnJMa25WcUpvWXpwaHdCSFRHU0VoNERvY1k0Ly9IcjR5eWxzWEYxaDdKek9T?=
 =?utf-8?B?amJFY2xiK2hDS1MwbTFWRlQzVlVkTCtjUUdCOWM0RVFySS9SdElZQXNQdHQ5?=
 =?utf-8?B?NllpZ254citHaWdLUzJaVUZWMFNrbnFnNDhRWXByQjlpa0l5RE1EN3YzK0Uy?=
 =?utf-8?B?SXgyL2JLOUQvOFJDbVE5M0Z1WkVpWW0xNXFiaEdFTDdzanBJT25abENrelBi?=
 =?utf-8?B?L25OYVFWYnNRLzJyYjR4YUUzaHV5TWZOOEVQZW9lOEwzWk1KQmVTMUFHWU4z?=
 =?utf-8?B?dXhTc0V4WXd4OWFaelFBNXZOZXE2cEdOZmVpd0pMaDRNVitlOWFrdzFyRHBu?=
 =?utf-8?B?Q2txbzJGdUJEcVllYkRuRkRWekRMdndMclFpdWdmNnNpOHpCaldoYVhLMFJq?=
 =?utf-8?B?MHFqS1lvTU8yWmtQWE53Ukx3a1l2ZmpISERFZXlsOXlWaG0zeGt0SC9McHRX?=
 =?utf-8?Q?dqiSwTh/gvjovtq9/VOI/zFiK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1defd15-5afe-4c1f-3d93-08dca66fd4ac
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 14:50:42.1365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8u867cbzZ5igM1EoCm/KdBRyoU/0DVwl0gaUdSfkkxN8IQUZPnZ62eMAmivuUKzw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8616
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

--------------0Cqn626exje0I05YD0r312Df
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

As far as I know, yes.

Regards,
Christian.

Am 17.07.24 um 16:38 schrieb Paneer Selvam, Arunpravin:
> Hi Christian,
>
> Can we use the below combination flags to kick in hardware workaround 
> while pinning BO's for this specific hw generation.
>
> if (place->flags & TTM_PL_FLAG_CONTIGUOUS) &&
> (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(12, 0, 0) ||
> amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(12, 0, 1))) {
> }
>
> Regards,
> Arun.
>
> On 7/17/2024 2:38 PM, Christian König wrote:
>> Well that approach was discussed before and seemed to be to complicated.
>>
>> But I totally agree that the AMDGPU_GEM_CREATE_GFX12_DCC flag is a 
>> bad idea. This isn't anything userspace should need to specify in the 
>> first place.
>>
>> All we need is a hardware workaround which kicks in all the time 
>> while pinning BOs for this specific hw generation and texture channel 
>> configuration.
>>
>> Please remove the AMDGPU_GEM_CREATE_GFX12_DCC flag again if possible 
>> or specify why it is actually necessary?
>>
>> Regards,
>> Christian.
>>
>> Am 17.07.24 um 05:44 schrieb Marek Olšák:
>>> AMDGPU_GEM_CREATE_GFX12_DCC is set on 90% of all memory allocations, 
>>> and almost all of them are not displayable. Shouldn't we use a 
>>> different way to indicate that we need a non-power-of-two alignment, 
>>> such as looking at the alignment field directly?
>>>
>>> Marek
>>>
>>> On Tue, Jul 16, 2024, 11:45 Arunpravin Paneer Selvam 
>>> <Arunpravin.PaneerSelvam@amd.com> wrote:
>>>
>>>     Add address alignment support to the DCC VRAM buffers.
>>>
>>>     v2:
>>>       - adjust size based on the max_texture_channel_caches values
>>>         only for GFX12 DCC buffers.
>>>       - used AMDGPU_GEM_CREATE_GFX12_DCC flag to apply change only
>>>         for DCC buffers.
>>>       - roundup non power of two DCC buffer adjusted size to nearest
>>>         power of two number as the buddy allocator does not support non
>>>         power of two alignments. This applies only to the contiguous
>>>         DCC buffers.
>>>
>>>     v3:(Alex)
>>>       - rewrite the max texture channel caches comparison code in an
>>>         algorithmic way to determine the alignment size.
>>>
>>>     v4:(Alex)
>>>       - Move the logic from amdgpu_vram_mgr_dcc_alignment() to
>>>     gmc_v12_0.c
>>>         and add a new gmc func callback for dcc alignment. If the
>>>     callback
>>>         is non-NULL, call it to get the alignment, otherwise, use
>>>     the default.
>>>
>>>     v5:(Alex)
>>>       - Set the Alignment to a default value if the callback doesn't
>>>     exist.
>>>       - Add the callback to amdgpu_gmc_funcs.
>>>
>>>     v6:
>>>       - Fix checkpatch error reported by Intel CI.
>>>
>>>     Signed-off-by: Arunpravin Paneer Selvam
>>>     <Arunpravin.PaneerSelvam@amd.com>
>>>     Acked-by: Alex Deucher <alexander.deucher@amd.com>
>>>     Acked-by: Christian König <christian.koenig@amd.com>
>>>     Reviewed-by: Frank Min <Frank.Min@amd.com>
>>>     ---
>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h      |  6 ++++
>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 36
>>>     ++++++++++++++++++--
>>>      drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c       | 15 ++++++++
>>>      3 files changed, 55 insertions(+), 2 deletions(-)
>>>
>>>     diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
>>>     b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
>>>     index febca3130497..654d0548a3f8 100644
>>>     --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
>>>     +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
>>>     @@ -156,6 +156,8 @@ struct amdgpu_gmc_funcs {
>>>                                           uint64_t addr, uint64_t
>>>     *flags);
>>>             /* get the amount of memory used by the vbios for pre-OS
>>>     console */
>>>             unsigned int (*get_vbios_fb_size)(struct amdgpu_device
>>>     *adev);
>>>     +       /* get the DCC buffer alignment */
>>>     +       u64 (*get_dcc_alignment)(struct amdgpu_device *adev);
>>>
>>>             enum amdgpu_memory_partition (*query_mem_partition_mode)(
>>>                     struct amdgpu_device *adev);
>>>     @@ -363,6 +365,10 @@ struct amdgpu_gmc {
>>>     (adev)->gmc.gmc_funcs->override_vm_pte_flags                 \
>>>                     ((adev), (vm), (addr), (pte_flags))
>>>      #define amdgpu_gmc_get_vbios_fb_size(adev)
>>>     (adev)->gmc.gmc_funcs->get_vbios_fb_size((adev))
>>>     +#define amdgpu_gmc_get_dcc_alignment(_adev) ({          \
>>>     +       typeof(_adev) (adev) = (_adev);          \
>>>     +  ((adev)->gmc.gmc_funcs->get_dcc_alignment((adev)));    \
>>>     +})
>>>
>>>      /**
>>>       * amdgpu_gmc_vram_full_visible - Check if full VRAM is visible
>>>     through the BAR
>>>     diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>>     b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>>     index f91cc149d06c..aa9dca12371c 100644
>>>     --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>>     +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>>     @@ -512,6 +512,16 @@ static int amdgpu_vram_mgr_new(struct
>>>     ttm_resource_manager *man,
>>>                     vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>>>
>>>             remaining_size = (u64)vres->base.size;
>>>     +       if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &&
>>>     +           bo->flags & AMDGPU_GEM_CREATE_GFX12_DCC) {
>>>     +               u64 adjust_size;
>>>     +
>>>     +               if (adev->gmc.gmc_funcs->get_dcc_alignment) {
>>>     +                       adjust_size =
>>>     amdgpu_gmc_get_dcc_alignment(adev);
>>>     +                       remaining_size =
>>>     roundup_pow_of_two(remaining_size + adjust_size);
>>>     +                       vres->flags |= DRM_BUDDY_TRIM_DISABLE;
>>>     +               }
>>>     +       }
>>>
>>>             mutex_lock(&mgr->lock);
>>>             while (remaining_size) {
>>>     @@ -521,8 +531,12 @@ static int amdgpu_vram_mgr_new(struct
>>>     ttm_resource_manager *man,
>>>                             min_block_size = mgr->default_page_size;
>>>
>>>                     size = remaining_size;
>>>     -               if ((size >= (u64)pages_per_block << PAGE_SHIFT) &&
>>>     -                   !(size & (((u64)pages_per_block <<
>>>     PAGE_SHIFT) - 1)))
>>>     +
>>>     +               if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &&
>>>     +                   bo->flags & AMDGPU_GEM_CREATE_GFX12_DCC)
>>>     +                       min_block_size = size;
>>>     +               else if ((size >= (u64)pages_per_block <<
>>>     PAGE_SHIFT) &&
>>>     +                        !(size & (((u64)pages_per_block <<
>>>     PAGE_SHIFT) - 1)))
>>>                             min_block_size = (u64)pages_per_block <<
>>>     PAGE_SHIFT;
>>>
>>>                     BUG_ON(min_block_size < mm->chunk_size);
>>>     @@ -553,6 +567,24 @@ static int amdgpu_vram_mgr_new(struct
>>>     ttm_resource_manager *man,
>>>             }
>>>             mutex_unlock(&mgr->lock);
>>>
>>>     +       if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &&
>>>     +           bo->flags & AMDGPU_GEM_CREATE_GFX12_DCC) {
>>>     +               struct drm_buddy_block *dcc_block;
>>>     +               u64 dcc_start, alignment;
>>>     +
>>>     +               dcc_block =
>>>     amdgpu_vram_mgr_first_block(&vres->blocks);
>>>     +               dcc_start = amdgpu_vram_mgr_block_start(dcc_block);
>>>     +
>>>     +               if (adev->gmc.gmc_funcs->get_dcc_alignment) {
>>>     +                       alignment =
>>>     amdgpu_gmc_get_dcc_alignment(adev);
>>>     +                       /* Adjust the start address for DCC
>>>     buffers only */
>>>     +                       dcc_start = roundup(dcc_start, alignment);
>>>     +                       drm_buddy_block_trim(mm, &dcc_start,
>>>     + (u64)vres->base.size,
>>>     + &vres->blocks);
>>>     +               }
>>>     +       }
>>>     +
>>>             vres->base.start = 0;
>>>             size = max_t(u64,
>>>     amdgpu_vram_mgr_blocks_size(&vres->blocks),
>>>                          vres->base.size);
>>>     diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
>>>     b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
>>>     index fd3ac483760e..4259edcdec8a 100644
>>>     --- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
>>>     +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
>>>     @@ -542,6 +542,20 @@ static unsigned
>>>     gmc_v12_0_get_vbios_fb_size(struct amdgpu_device *adev)
>>>             return 0;
>>>      }
>>>
>>>     +static u64 gmc_v12_0_get_dcc_alignment(struct amdgpu_device *adev)
>>>     +{
>>>     +       u64 max_tex_channel_caches, alignment;
>>>     +
>>>     +       max_tex_channel_caches =
>>>     adev->gfx.config.max_texture_channel_caches;
>>>     +       if (is_power_of_2(max_tex_channel_caches))
>>>     +               alignment = (max_tex_channel_caches / SZ_4) *
>>>     max_tex_channel_caches;
>>>     +       else
>>>     +               alignment =
>>>     roundup_pow_of_two(max_tex_channel_caches) *
>>>     +  max_tex_channel_caches;
>>>     +
>>>     +       return (u64)alignment * SZ_1K;
>>>     +}
>>>     +
>>>      static const struct amdgpu_gmc_funcs gmc_v12_0_gmc_funcs = {
>>>             .flush_gpu_tlb = gmc_v12_0_flush_gpu_tlb,
>>>             .flush_gpu_tlb_pasid = gmc_v12_0_flush_gpu_tlb_pasid,
>>>     @@ -551,6 +565,7 @@ static const struct amdgpu_gmc_funcs
>>>     gmc_v12_0_gmc_funcs = {
>>>             .get_vm_pde = gmc_v12_0_get_vm_pde,
>>>             .get_vm_pte = gmc_v12_0_get_vm_pte,
>>>             .get_vbios_fb_size = gmc_v12_0_get_vbios_fb_size,
>>>     +       .get_dcc_alignment = gmc_v12_0_get_dcc_alignment,
>>>      };
>>>
>>>      static void gmc_v12_0_set_gmc_funcs(struct amdgpu_device *adev)
>>>     -- 
>>>     2.25.1
>>>
>>
>

--------------0Cqn626exje0I05YD0r312Df
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    As far as I know, yes.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 17.07.24 um 16:38 schrieb Paneer
      Selvam, Arunpravin:<br>
    </div>
    <blockquote type="cite" cite="mid:0437c61a-9283-4827-98d0-e7a9a7baa898@amd.com">
      
      Hi Christian,<br>
      <br>
      Can we use the below combination flags to kick in hardware
      workaround while pinning BO's for this specific hw generation.<br>
      <br>
      if (place-&gt;flags &amp; TTM_PL_FLAG_CONTIGUOUS) &amp;&amp;<br>
      (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(12, 0, 0) ||<br>
      amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(12, 0, 1))) {<br>
      }<br>
      <br>
      Regards,<br>
      Arun.<br>
      <br>
      <div class="moz-cite-prefix">On 7/17/2024 2:38 PM, Christian König
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:2a2ea485-50e0-48cb-bb02-736a03368ab7@amd.com"> Well
        that approach was discussed before and seemed to be to
        complicated.<br>
        <br>
        But I totally agree that the AMDGPU_GEM_CREATE_GFX12_DCC flag is
        a bad idea. This isn't anything userspace should need to specify
        in the first place.<br>
        <br>
        All we need is a hardware workaround which kicks in all the time
        while pinning BOs for this specific hw generation and texture
        channel configuration.<br>
        <br>
        Please remove the AMDGPU_GEM_CREATE_GFX12_DCC flag again if
        possible or specify why it is actually necessary?<br>
        <br>
        Regards,<br>
        Christian.<br>
        <br>
        <div class="moz-cite-prefix">Am 17.07.24 um 05:44 schrieb Marek
          Olšák:<br>
        </div>
        <blockquote type="cite" cite="mid:CAAxE2A6gpvLcq7zDhTDgV1BiBZdbK6t7147ESpq0ufYqW-6gzQ@mail.gmail.com">
          <div dir="auto">
            <div>AMDGPU_GEM_CREATE_GFX12_DCC is set on 90% of all memory
              allocations, and almost all of them are not displayable.
              Shouldn't we use a different way to indicate that we need
              a non-power-of-two alignment, such as looking at the
              alignment field directly?&nbsp;</div>
            <div dir="auto"><br>
            </div>
            <div dir="auto">Marek<br>
              <br>
              <div class="gmail_quote" dir="auto">
                <div dir="ltr" class="gmail_attr">On Tue, Jul 16, 2024,
                  11:45 Arunpravin Paneer Selvam &lt;<a href="mailto:Arunpravin.PaneerSelvam@amd.com" moz-do-not-send="true" class="moz-txt-link-freetext">Arunpravin.PaneerSelvam@amd.com</a>&gt;
                  wrote:<br>
                </div>
                <blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Add
                  address alignment support to the DCC VRAM buffers.<br>
                  <br>
                  v2:<br>
                  &nbsp; - adjust size based on the
                  max_texture_channel_caches values<br>
                  &nbsp; &nbsp; only for GFX12 DCC buffers.<br>
                  &nbsp; - used AMDGPU_GEM_CREATE_GFX12_DCC flag to apply
                  change only<br>
                  &nbsp; &nbsp; for DCC buffers.<br>
                  &nbsp; - roundup non power of two DCC buffer adjusted size
                  to nearest<br>
                  &nbsp; &nbsp; power of two number as the buddy allocator does
                  not support non<br>
                  &nbsp; &nbsp; power of two alignments. This applies only to the
                  contiguous<br>
                  &nbsp; &nbsp; DCC buffers.<br>
                  <br>
                  v3:(Alex)<br>
                  &nbsp; - rewrite the max texture channel caches comparison
                  code in an<br>
                  &nbsp; &nbsp; algorithmic way to determine the alignment size.<br>
                  <br>
                  v4:(Alex)<br>
                  &nbsp; - Move the logic from
                  amdgpu_vram_mgr_dcc_alignment() to gmc_v12_0.c<br>
                  &nbsp; &nbsp; and add a new gmc func callback for dcc alignment.
                  If the callback<br>
                  &nbsp; &nbsp; is non-NULL, call it to get the alignment,
                  otherwise, use the default.<br>
                  <br>
                  v5:(Alex)<br>
                  &nbsp; - Set the Alignment to a default value if the
                  callback doesn't exist.<br>
                  &nbsp; - Add the callback to amdgpu_gmc_funcs.<br>
                  <br>
                  v6:<br>
                  &nbsp; - Fix checkpatch error reported by Intel CI.<br>
                  <br>
                  Signed-off-by: Arunpravin Paneer Selvam &lt;<a href="mailto:Arunpravin.PaneerSelvam@amd.com" target="_blank" rel="noreferrer" moz-do-not-send="true" class="moz-txt-link-freetext">Arunpravin.PaneerSelvam@amd.com</a>&gt;<br>
                  Acked-by: Alex Deucher &lt;<a href="mailto:alexander.deucher@amd.com" target="_blank" rel="noreferrer" moz-do-not-send="true" class="moz-txt-link-freetext">alexander.deucher@amd.com</a>&gt;<br>
                  Acked-by: Christian König &lt;<a href="mailto:christian.koenig@amd.com" target="_blank" rel="noreferrer" moz-do-not-send="true" class="moz-txt-link-freetext">christian.koenig@amd.com</a>&gt;<br>
                  Reviewed-by: Frank Min &lt;<a href="mailto:Frank.Min@amd.com" target="_blank" rel="noreferrer" moz-do-not-send="true" class="moz-txt-link-freetext">Frank.Min@amd.com</a>&gt;<br>
                  ---<br>
                  &nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h&nbsp; &nbsp; &nbsp; |&nbsp; 6
                  ++++<br>
                  &nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 36
                  ++++++++++++++++++--<br>
                  &nbsp;drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c&nbsp; &nbsp; &nbsp; &nbsp;| 15
                  ++++++++<br>
                  &nbsp;3 files changed, 55 insertions(+), 2 deletions(-)<br>
                  <br>
                  diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
                  b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h<br>
                  index febca3130497..654d0548a3f8 100644<br>
                  --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h<br>
                  +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h<br>
                  @@ -156,6 +156,8 @@ struct amdgpu_gmc_funcs {<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; uint64_t addr,
                  uint64_t *flags);<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; /* get the amount of memory used by the vbios
                  for pre-OS console */<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; unsigned int (*get_vbios_fb_size)(struct
                  amdgpu_device *adev);<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp;/* get the DCC buffer alignment */<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp;u64 (*get_dcc_alignment)(struct amdgpu_device
                  *adev);<br>
                  <br>
                  &nbsp; &nbsp; &nbsp; &nbsp; enum amdgpu_memory_partition
                  (*query_mem_partition_mode)(<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct amdgpu_device *adev);<br>
                  @@ -363,6 +365,10 @@ struct amdgpu_gmc {<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;
                  (adev)-&gt;gmc.gmc_funcs-&gt;override_vm_pte_flags&nbsp; &nbsp;
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ((adev), (vm), (addr), (pte_flags))<br>
                  &nbsp;#define amdgpu_gmc_get_vbios_fb_size(adev)
                  (adev)-&gt;gmc.gmc_funcs-&gt;get_vbios_fb_size((adev))<br>
                  +#define amdgpu_gmc_get_dcc_alignment(_adev) ({&nbsp; &nbsp; &nbsp; &nbsp;
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp;typeof(_adev) (adev) = (_adev);&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\<br>
                  +&nbsp; &nbsp; &nbsp;
                  &nbsp;((adev)-&gt;gmc.gmc_funcs-&gt;get_dcc_alignment((adev)));&nbsp;
                  &nbsp; &nbsp;\<br>
                  +})<br>
                  <br>
                  &nbsp;/**<br>
                  &nbsp; * amdgpu_gmc_vram_full_visible - Check if full VRAM
                  is visible through the BAR<br>
                  diff --git
                  a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
                  b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c<br>
                  index f91cc149d06c..aa9dca12371c 100644<br>
                  --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c<br>
                  +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c<br>
                  @@ -512,6 +512,16 @@ static int
                  amdgpu_vram_mgr_new(struct ttm_resource_manager *man,<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vres-&gt;flags |=
                  DRM_BUDDY_RANGE_ALLOCATION;<br>
                  <br>
                  &nbsp; &nbsp; &nbsp; &nbsp; remaining_size = (u64)vres-&gt;base.size;<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp;if (bo-&gt;flags &amp;
                  AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &amp;&amp;<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bo-&gt;flags &amp;
                  AMDGPU_GEM_CREATE_GFX12_DCC) {<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u64 adjust_size;<br>
                  +<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
                  (adev-&gt;gmc.gmc_funcs-&gt;get_dcc_alignment) {<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;adjust_size =
                  amdgpu_gmc_get_dcc_alignment(adev);<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;remaining_size =
                  roundup_pow_of_two(remaining_size + adjust_size);<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vres-&gt;flags |=
                  DRM_BUDDY_TRIM_DISABLE;<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp;}<br>
                  <br>
                  &nbsp; &nbsp; &nbsp; &nbsp; mutex_lock(&amp;mgr-&gt;lock);<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; while (remaining_size) {<br>
                  @@ -521,8 +531,12 @@ static int
                  amdgpu_vram_mgr_new(struct ttm_resource_manager *man,<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; min_block_size =
                  mgr-&gt;default_page_size;<br>
                  <br>
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; size = remaining_size;<br>
                  -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if ((size &gt;= (u64)pages_per_block
                  &lt;&lt; PAGE_SHIFT) &amp;&amp;<br>
                  -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;!(size &amp;
                  (((u64)pages_per_block &lt;&lt; PAGE_SHIFT) - 1)))<br>
                  +<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (bo-&gt;flags &amp;
                  AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &amp;&amp;<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bo-&gt;flags &amp;
                  AMDGPU_GEM_CREATE_GFX12_DCC)<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;min_block_size = size;<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;else if ((size &gt;=
                  (u64)pages_per_block &lt;&lt; PAGE_SHIFT) &amp;&amp;<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; !(size &amp;
                  (((u64)pages_per_block &lt;&lt; PAGE_SHIFT) - 1)))<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; min_block_size =
                  (u64)pages_per_block &lt;&lt; PAGE_SHIFT;<br>
                  <br>
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; BUG_ON(min_block_size &lt;
                  mm-&gt;chunk_size);<br>
                  @@ -553,6 +567,24 @@ static int
                  amdgpu_vram_mgr_new(struct ttm_resource_manager *man,<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; }<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; mutex_unlock(&amp;mgr-&gt;lock);<br>
                  <br>
                  +&nbsp; &nbsp; &nbsp; &nbsp;if (bo-&gt;flags &amp;
                  AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &amp;&amp;<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bo-&gt;flags &amp;
                  AMDGPU_GEM_CREATE_GFX12_DCC) {<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct drm_buddy_block *dcc_block;<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u64 dcc_start, alignment;<br>
                  +<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dcc_block =
                  amdgpu_vram_mgr_first_block(&amp;vres-&gt;blocks);<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dcc_start =
                  amdgpu_vram_mgr_block_start(dcc_block);<br>
                  +<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
                  (adev-&gt;gmc.gmc_funcs-&gt;get_dcc_alignment) {<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;alignment =
                  amdgpu_gmc_get_dcc_alignment(adev);<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Adjust the start address
                  for DCC buffers only */<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dcc_start = roundup(dcc_start,
                  alignment);<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;drm_buddy_block_trim(mm,
                  &amp;dcc_start,<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                  (u64)vres-&gt;base.size,<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                  &amp;vres-&gt;blocks);<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp;}<br>
                  +<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; vres-&gt;base.start = 0;<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; size = max_t(u64,
                  amdgpu_vram_mgr_blocks_size(&amp;vres-&gt;blocks),<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vres-&gt;base.size);<br>
                  diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
                  b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c<br>
                  index fd3ac483760e..4259edcdec8a 100644<br>
                  --- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c<br>
                  +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c<br>
                  @@ -542,6 +542,20 @@ static unsigned
                  gmc_v12_0_get_vbios_fb_size(struct amdgpu_device
                  *adev)<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; return 0;<br>
                  &nbsp;}<br>
                  <br>
                  +static u64 gmc_v12_0_get_dcc_alignment(struct
                  amdgpu_device *adev)<br>
                  +{<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp;u64 max_tex_channel_caches, alignment;<br>
                  +<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp;max_tex_channel_caches =
                  adev-&gt;gfx.config.max_texture_channel_caches;<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp;if (is_power_of_2(max_tex_channel_caches))<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;alignment = (max_tex_channel_caches /
                  SZ_4) * max_tex_channel_caches;<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp;else<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;alignment =
                  roundup_pow_of_two(max_tex_channel_caches) *<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                  &nbsp;max_tex_channel_caches;<br>
                  +<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp;return (u64)alignment * SZ_1K;<br>
                  +}<br>
                  +<br>
                  &nbsp;static const struct amdgpu_gmc_funcs
                  gmc_v12_0_gmc_funcs = {<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; .flush_gpu_tlb = gmc_v12_0_flush_gpu_tlb,<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; .flush_gpu_tlb_pasid =
                  gmc_v12_0_flush_gpu_tlb_pasid,<br>
                  @@ -551,6 +565,7 @@ static const struct
                  amdgpu_gmc_funcs gmc_v12_0_gmc_funcs = {<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; .get_vm_pde = gmc_v12_0_get_vm_pde,<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; .get_vm_pte = gmc_v12_0_get_vm_pte,<br>
                  &nbsp; &nbsp; &nbsp; &nbsp; .get_vbios_fb_size =
                  gmc_v12_0_get_vbios_fb_size,<br>
                  +&nbsp; &nbsp; &nbsp; &nbsp;.get_dcc_alignment =
                  gmc_v12_0_get_dcc_alignment,<br>
                  &nbsp;};<br>
                  <br>
                  &nbsp;static void gmc_v12_0_set_gmc_funcs(struct
                  amdgpu_device *adev)<br>
                  -- <br>
                  2.25.1<br>
                  <br>
                </blockquote>
              </div>
            </div>
          </div>
        </blockquote>
        <br>
      </blockquote>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------0Cqn626exje0I05YD0r312Df--
