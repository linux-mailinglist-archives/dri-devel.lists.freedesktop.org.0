Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D9A9C6E12
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 12:42:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB81A10E347;
	Wed, 13 Nov 2024 11:42:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="STSgW+3v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 293A010E21C;
 Wed, 13 Nov 2024 11:42:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kiqrq+oVC+VzU+nZ+qjEQjpD779NZucIEl65dX77aURMA66VFni7Lbgn2OdzErcBHovcViVOAH6NSy28y+xltow48wVRWuLtZQOdL1BKM+nkdoKutEYEQ0mmBs3B+DpUMy9qb5e5otjrfViAAtIhY9GcXLUQW1KjccgcXPLOrg3C7XyDT52sPRdF4aisyxzJz1t7jOXLHoSeDZaODX1haunMf1pe6nhEQVhvuo+rrpHDWsmU3bHu+Nkt2zlKMlpaFGYItPTgq6tR4suSHDsh9Kby0I+VSAwUFhpAi/tenOYxp750qzYShTXhEm4p0Z0zDJaOvnL1gnjy3MsiNVtOxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NbqYFjp/sC403OcW/IF2IyX/JZrOAguAhgv2jv0lPUk=;
 b=puHiM/tnM1gpGWCBAO2PRDKHdKZJiSdjzuRjpPAo2RIWUNFNTbgivWsQj2lzUquSuHYgVoSo0pNHdM4mJ4IO4yNWhe8gOGLeYZ8/TPTffY8QwcxGOOLX+svN3IxwdcDL9OxTIZce+etbrdwVmxwkbwCYjkVgeic6PeqXPQmEiEDP0LsWE7UgSttmAw7v90rwpX2VJvGGs9VFayl4IqstmxjHn/SN/CHLrf1KNtQxkW386K3Y5XyFgGjUSTSMsFx/FWx6L1I5gDZCVQs1gu9Yy0Ja3E5Ek7Tfv3wguAKvuK7FgtNxtGrjEedbo5H8dfz6rN6cGtLRAq14jjH3mFBNEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbqYFjp/sC403OcW/IF2IyX/JZrOAguAhgv2jv0lPUk=;
 b=STSgW+3vVZQ33YOuJiLXNlX6UGOZVM45KkEcpU1lmXJyy0HeDOMJKOyP6vAFqJQe0LY4woM9GlSYnLLIEJIfONTvF7ZCb6AMfhK02Jq9kVqqwe1uzfFl9U8tEnb0ASyavhaG/2hz3IxlQZv8hELBCd0CIfZEhhDg808JCuixi84=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CYYPR12MB9016.namprd12.prod.outlook.com (2603:10b6:930:c4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Wed, 13 Nov
 2024 11:42:48 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8137.027; Wed, 13 Nov 2024
 11:42:48 +0000
Content-Type: multipart/alternative;
 boundary="------------Pexe4VXW16VAr8yHlF2xZ1tV"
Message-ID: <8d17a8a2-9a44-4f80-92b5-a8aa3efe6bf2@amd.com>
Date: Wed, 13 Nov 2024 12:42:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Huang Rui <ray.huang@amd.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
References: <88ceb558-89d1-4d10-be8a-9ce2f3178fa5@amd.com>
 <ZyugmXt7v+JeKuN9@lstrano-desk.jf.intel.com>
 <85859dc3-cca3-4396-8c75-a726437fb81e@amd.com>
 <173131201749.35893.6727423786823542880@jlahtine-mobl.ger.corp.intel.com>
 <ZzHYB4MBJmVjk-AR@phenom.ffwll.local>
 <a1ffb3f7-77bc-41ff-a98a-5cd889f081fa@amd.com>
 <173133360247.70529.14349388659124962988@jlahtine-mobl.ger.corp.intel.com>
 <8d181425-db3b-46b7-ae73-ae6ef149d185@amd.com>
 <ZzKJHxaMnWKQ5mzV@lstrano-desk.jf.intel.com>
 <31b16d78-708d-4f19-9b33-891e31be5480@gmail.com>
 <173141886970.132411.13400253861916730373@jlahtine-mobl.ger.corp.intel.com>
 <27f8bd540ac1f04daf8a7786f4ae7828017d061b.camel@linux.intel.com>
 <c62e5298-1ca6-4cd0-a558-3d2a91175fa0@amd.com>
 <d469ab3509a1b875ad0c44d01569675682d6c61c.camel@linux.intel.com>
 <6ab9e754-6f4a-48ec-b143-02585bc40291@amd.com>
 <5a16ef4ff06a530c52df7633833db19aaa15b33e.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <5a16ef4ff06a530c52df7633833db19aaa15b33e.camel@linux.intel.com>
X-ClientProxiedBy: FR3P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CYYPR12MB9016:EE_
X-MS-Office365-Filtering-Correlation-Id: aaeb5cb4-03ae-40d6-1e9d-08dd03d84bde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlZwcFpuRksyRjNmN0JJSzJ0VGd3c05GdDZrcGNkRmZSV3FBNXlHdzFqQzJE?=
 =?utf-8?B?dlJEN1JEWU5EczdyVHdPdSs1VFd6Q1FFNkZ1cm9ncWhqdFEyUE1IVEVLK2U1?=
 =?utf-8?B?NldYcHJEMS9oOHgyVmxyeXkyZ1RkVUJQTmtjNUtzSHdXSUQ5Y29KaDRaNTNC?=
 =?utf-8?B?MXlOR1pyY1poc2JybFprOE9YaWdONm9IYzUvOTJROUhJTUJBRXZlaE0wcGpi?=
 =?utf-8?B?NGYvZ0RRY0F0N0REYXd2T01WVXhvT0hCbkNhQXIrNmhSYnp1YlFFYXd5NlBh?=
 =?utf-8?B?VDRwMGtFWDlhaUxRbzloVmhwOUJidWZVUW1DUkw5cUdQWmpJVzdDOHY5Sm5i?=
 =?utf-8?B?Q1o5R2FrbHhiS244dmpDKzQ5OHpqNytRV0QwMVdFQWdDTVpFdnhGaTdGSTY5?=
 =?utf-8?B?RDArZ01tbkUrYTA5L2h0V0ZwcWxQRlZiKzRqb0lCNGxydmhQQk9tS1kzd01T?=
 =?utf-8?B?S2dTVjFuTnpvcnY1eW94QVlHQTJnVlRwRWdLV0ZLL2VaWVZxK0dUNnh5SG9C?=
 =?utf-8?B?SjFRdmhrNG4yOVNxcmswZW9Xb0pKbmp5VkFRMzJna2gwUlFKUkVlbVFKNnho?=
 =?utf-8?B?RU9nV1hKakM4UHZuZWRxMUcyYmV1bnlBQ01VZFBOdEJSNFh2bWVoQjNUQzVl?=
 =?utf-8?B?NXZqTEd6YmorQzFzdzdHeHp0VkhTMkllSkVnWFcxblY2bWxVR09IY1AzWHlL?=
 =?utf-8?B?Z29BOUNONlRDdkVuRTZzUkVhRnZRYnVLUzhaVHUrakJ5dTlNTDROM1ljQ0tj?=
 =?utf-8?B?M0lrYkF2Qms4aGhFOGJsM1cxWVJJZWJZbnNYRUR0RXVZVnhJK2haT0NBaDJo?=
 =?utf-8?B?NFdJWlphL2ZGMnduUkREaG00d09WZERqTWZFUldZK3N1ak5DalBjZjlla1Y2?=
 =?utf-8?B?TXVUNUZJaXp1VWtmdXZkcGpqTSszK3NTeVJPZS9mQjJvQUhaSDA3NmhRL3RY?=
 =?utf-8?B?YVhJZ1dET3MyYmRKZ2NUV1E1emVSbDMrUUtTVWVtODdHMk81bmZUS0Ztc2ZF?=
 =?utf-8?B?cHpXbkl0Z29NVEJac01qQnRXOXFVUHNqUDlLRzdZczZFQ1VmWjFiNFRPcjFa?=
 =?utf-8?B?ZkRBZTRNTjBOTGlVY1BySGZFOFkrZFlaUEVrcW9XTjBlRElZNVJZWE9nclNm?=
 =?utf-8?B?ZzFZUldtUzRDY0JWVE5MN1hQQWxZb3IvcFl3NTNFeUxPcUZoWmcyL3F5c2E5?=
 =?utf-8?B?eHA2bW55OElUWGRjVC9GTkk0aGVUVklPdU9VWUxPMHVySUI3Nzk2Z24welRP?=
 =?utf-8?B?ZGEwUU5tRVJGTlVXZjBzNHo2N1grZ1YwbzlpUjV3TGhtM1JDMXJ2RHd3Q3Ux?=
 =?utf-8?B?NU1sZjFvbWo4QnBGeUZGVHVaY01OTDJUNDNpK0RmSnM1KzMxZWs3eVMvblE5?=
 =?utf-8?B?VzVGZG1hSmM0Y2RYV3Q5MHdUWHozTkVxeHBuS29mMEowSUdRMjhQVHhsQUp0?=
 =?utf-8?B?dlc1VnExMElobjlqOXM1UDA2Z2tHRGFQbXZiVW8xajBjOUc3N0ErSjA3QnJk?=
 =?utf-8?B?c2JqcmlCbU5GQnhZU09wUzRJbFBHVXdycHlsM1pJY2RoNFJobTBnNEtVYlVB?=
 =?utf-8?B?aWk5ZC8vSEkzMnBsczlDSXdkcmVPZEpzSGZHMkZhb1RySFV3V09CV21vQlUr?=
 =?utf-8?B?eHAwL203WXU5VEJ0bktwT25lSjkvb1piUUJwdmhRSHYrVndKL0FsRHNmS1FP?=
 =?utf-8?B?bnNYcmc5VUtjN1ZYbEZhTDhLL0VwSG1QNndSRW12QS9sTjdjenZPOW9BPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHhuWkhoVnUzTTZzVGt0UENCV1FKM3c2RU5CSVM3Q1pCRkdWeVJmTzRRSUJh?=
 =?utf-8?B?SXdOOTVDbWVvcitmN2ZEKzRtdkd6V1NFMjR5cHhQd0FFN0t4RkJtYmNGVkc4?=
 =?utf-8?B?TUlyYWFBVHBGNnNXaUErZ1V1S3pzSE14TEJmRzd3MEt1bWFNVTRXZXYrUERO?=
 =?utf-8?B?U1B0L2o0dGRtQVNDbzhHQlRhQzFoeEEybEJ0UEZxVzgrV1pKYm9VR2E2Snky?=
 =?utf-8?B?YzBoQ1c4aFl3MUxiNTByVzl3dFp3YjlaMVZCejVScExYbVY1L3NIdEIrQmlm?=
 =?utf-8?B?UmpFSndyais5RnMxMzhLZXNqemh0ZVFEdzFabjk5UUVnaDVnRjh3Y2hqZGo3?=
 =?utf-8?B?UjJhR0dkdEgvcS81dUI1SzVielJRell4TitIY25meHVUNnByM0Vsam5aZmMz?=
 =?utf-8?B?V0s0NzhYOHlrSVpDajN1WWRoK0lCQXFPU0d4U21aQm5RaVJBeUV3Z3U0bUlh?=
 =?utf-8?B?dkwrTE9DaVJnS2xFVC81d1E0VmdxZ0Ntb3FuY0RPV3Q2ZDAzRXlvdVlTWXNB?=
 =?utf-8?B?OTVnaDRhUHVyVnAwMzJSQjdMN2VoamQ3ayttOEp1TFF4WUdoZ2VyNU91U3Y2?=
 =?utf-8?B?RzUwS2dhdDh5UTlkMEp1YWNLM3JOS0N0SExPbmJsV3h2bURxSUVnTEM0ZDI2?=
 =?utf-8?B?NkFKZHNFc3IwVE1NZzk5TnI4cHFhOTY2WGlsSTN6eGVWajRvSWhoOThyTDA1?=
 =?utf-8?B?ODJ1OWJYTWN2ZGI0dGlobE8wcmhVWW9mZzFOQk5saE42enNPeHNESnhnTEMx?=
 =?utf-8?B?ZDBPUktWd3VjOUxNeDU0YllJTGRJVGdlc3hpRFJ1NS9mOFZsc2lUS1ZHLzhO?=
 =?utf-8?B?ZUpjc2Y4eHBFQUZ0R2hveDUrQmc1K3ZlR0VZR1NjbGVZTjJlTmV0UGlrUDYy?=
 =?utf-8?B?TTN3MVlmZGY4Z1VlMkZsdTYzNnhCYnRzL2dWenIxTlRWb1hDTEpDMlNUbkdR?=
 =?utf-8?B?MERyaW43MnZ2elJnNml3dGk5a1VXdVZnWXhDaWZ6VDBRTXp2OEwyVUdDSm5R?=
 =?utf-8?B?bFJJY3NKdk16czBYd0JTT0RhNFhEalRTb041c1Y1RlA2YXgwR3Y0T0JkcHQr?=
 =?utf-8?B?aXlCcVBTY2FXTjdjSFdWSzN4MDhvamN6ZHZRNUM2d2hLak83VnNLb1dsSU5p?=
 =?utf-8?B?cURyVHZDcVJBcG40VUpWcGZKdEZReHNlN3AyN3AwdUlXbVc3UTJIMXZrdnRD?=
 =?utf-8?B?M2p6d3pTRGlLY1hjQm82c3loTnZQcEVMb1U3U1cwcjVkV2oxMlZEMkZUeGRO?=
 =?utf-8?B?UW1veEFCS1VkVFlGZGV6S29vb2s5T0ZFazIrSWlSbTh5RmYxUlZuWWd3dStz?=
 =?utf-8?B?M2llc1lYellySkpOZlJUWkhaNUN5SFpCRlpwRzhndWJHVU0wRVBBV1dhc2Q4?=
 =?utf-8?B?eUM3Tm5TaXJ5TWwrZ2l4OGo2RVNuRnlaTC9yMWRLZUdrMzdJaGtEUGkwcGhl?=
 =?utf-8?B?b1dTMTc5UkZpbjRsQ2hjYktLUkNUVWhYcFdPSlYxWVR6aVEzaXRVQzcxZG9N?=
 =?utf-8?B?SDR1L0pGd21oYjBJRUc2bEpyNVlWdDY0bUoxMWp0Wit0U1ZDY1F6VGFvRUVC?=
 =?utf-8?B?U0dwQ25QcXQ1bHlleklJd1psalo3Sko5Q2hOaHlhS1cwemNnRG9WNFpURzNQ?=
 =?utf-8?B?eWFNV0tJbTF4dEM0L0VQWmFKc2QwSWlpVjFWNlZ3OXdHV05HUkczNUJ3Z1ht?=
 =?utf-8?B?S1pqRTc5aS8yN1AvOEtNNkhOeVYyUW9PdlA0cGNzVis5Q29BY2p2T2NKbG5I?=
 =?utf-8?B?ZE4yNDdpU1MrQXBLdGtEbXRub2V4M1daSnFxRDZJWEdFSFNHem9qbjZuWUpJ?=
 =?utf-8?B?bFZqZTRaOEZkY3pFaGhuM1BrTWkwbVJiYmJqVXVWV2RoeFIxWmpTNGtjdU1m?=
 =?utf-8?B?M0p4VExYVDRUUmtvcGxKRkRwTmJ5MW9tM2gvaEx5bGRPaWt2amR6ek5UWGxP?=
 =?utf-8?B?QWF0K2I2R1grWWg5akFydzV3ZGpVNnJKR0tJSmlXamVlbnNMRWtZOUE2dkt4?=
 =?utf-8?B?emE4aTlLYU5rSHI2bnZBZHVwMlkwei9JdVkzcjlPaGdQUUFvZk5LWVpRalJR?=
 =?utf-8?B?U3dDY3VXUnMwQTBxcllhWXV1Qm55MWVuam1hZVd0ZG5YcHhDRGI0UVF3VXI4?=
 =?utf-8?Q?yPAoI1bxZwqMgLULVQCqjSuIQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaeb5cb4-03ae-40d6-1e9d-08dd03d84bde
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 11:42:47.9810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uTaLLtDQtchK5HN124xBnNXMwVeaQxqYhQfH7DJjG8vVnsXPPkqB7VtIolQjIIBl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB9016
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

--------------Pexe4VXW16VAr8yHlF2xZ1tV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 13.11.24 um 11:44 schrieb Thomas Hellström:
> On Wed, 2024-11-13 at 09:37 +0100, Christian König wrote:
>> Am 12.11.24 um 17:33 schrieb Thomas Hellström:
>>> [SNIP]
>>>>>> This has been extensively discussed already, but was expected
>>>>>> to
>>>>>> really
>>>>>> only be needed for low-on-memory scenarios. However it now
>>>>>> seems
>>>>>> like
>>>>>> the need is much earlier due to the random userptr page
>>>>>> joining
>>>>>> by
>>>>>> core
>>>>>> mm.
>>>>> Just to clarify here:
>>>>>     
>>>>> In Long-Running mode with recoverable pagefaults enabled we
>>>>> don't
>>>>> have
>>>>> any preempt-fences, but rather just zap the PTEs pointing to
>>>>> the
>>>>> affected memory and flush TLB. So from a memory resource POW a
>>>>> breakpoint should be safe, and no mmu notifier nor shrinker
>>>>> will be
>>>>> blocked.
>>>> That sounds like a HMM based approach which would clearly work.
>>>>
>>>> But where is that? I don't see any HMM based approach anywhere in
>>>> the
>>>> XE
>>>> driver.
>>> This is a mode that uses recoverable pagefaults to fault either
>>> full
>>> userptr or full bos, and used with DRM_XE_VM_CRATE_FLAG_FAULT_MODE.
>>> (not SVM)!
>>>
>>> userptrs in xe are bo-less, and using the vm's resv, but otherwise
>>> using hmm similar to amdgpu: xe_hmm.c
>> Yeah, I have seen that one.
>>
>>> fault servicing:
>>> xe_gt_pagefault.c
>>>
>>> PTE zapping on eviction and notifier:
>>> xe_vm_invalidate_vma(), xe_vm.c
>> Ah, that was the stuff I was missing.
>>
>> So the implementation in xe_preempt_fence.c is just for graphics
>> submissions? That would make the whole thing much easier to handle.
> Actually it's not, it's intended for long-running mode, but as a
> consequence the debugger would be allowed only in fault mode.

Make sense, yes.

>> The only remaining question I can then see is if long running
>> submissions with DRM_XE_VM_CRATE_FLAG_FAULT_MODE could potentially
>> block
>> graphics submissions without this flag from accessing the hardware?
> Yes and no. We have a mechanism in place that allows either only fault
> mode jobs or non-faulting jobs on the same, what we call "engine
> group".
> A pagefault on an engine group would block or hamper progress of other
> jobs on that engine group.
>
> So let's say a dma-fence job is submitted to an engine group that is
> currently running a faulting job. We'd then need to switch mode of the
> engine group and, in the exec ioctl we'd (explicitly without preempt-
> fences) preempt the faulting job before submitting the dma-fence job
> and publishing its fence. This preemption will incur a delay which is
> typically the delay of servicing any outstanding pagefaults. It's not
> ideal, but the best we can do, and it doesn't affect core memory
> management nor does it affect migration blits.
>
> In the debugger case, this delay could be long due to breakpoints, and
> that's why enabling the debugger would sit behind a flag and not
> something default (I think this was discussed earlier in the thread).
> Still, core memory management would be unaffected, and also ofc the
> migration blits are completely independent.

Yeah, that sounds totally sane to me.

Sorry for the noise then. I didn't realized that you have two separate 
modes of operation.

Going to reply on the other open questions separately.

Regards,
Christian.

>
> /Thomas
>
>> Thanks a lot for pointing this out,
>> Christian.
>>
>>> Thanks,
>>> Thomas
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Nor will there be any jobs with published dma-fences depending
>>>>> on
>>>>> the
>>>>> job blocked either temporarily by a pagefault or long-term by a
>>>>> debugger breakpoint.
>>>>>
>>>>> /Thomas
>>>>>
>>>>>
>>>>>> If that is done and the memory pre-empt fence is serviced
>>>>>> even
>>>>>> for
>>>>>> debuggable contexts, do you have further concerns with the
>>>>>> presented
>>>>>> approach
>>>>>> from dma-buf and drm/sched perspective?
>>>>>>
>>>>>> Regards, Joonas
>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>>
>>>>>>>            This means that a breakpoint or core dump doesn't
>>>>>>> halt
>>>>>>> GPU
>>>>>>> threads, but
>>>>>>>            rather suspends them. E.g. all running wave data
>>>>>>> is
>>>>>>> collected into a state
>>>>>>>            bag which can be restored later on.
>>>>>>>
>>>>>>>            I was under the impression that those long
>>>>>>> running
>>>>>>> compute
>>>>>>> threads do
>>>>>>>            exactly that, but when the hardware can't switch
>>>>>>> out
>>>>>>> the
>>>>>>> GPU thread/process
>>>>>>>            while in a break then that isn't the case.
>>>>>>>
>>>>>>>            As long as you don't find a way to avoid that
>>>>>>> this
>>>>>>> patch
>>>>>>> set is a pretty
>>>>>>>            clear NAK from my side as DMA-buf and TTM
>>>>>>> maintainer.
>>>>>>>
>>>>>>>
>>>>>>>        I believe this is addressed above.
>>>>>>>
>>>>>>>        Matt
>>>>>>>
>>>>>>>
>>>>>>>            What might work is to keep the submission on the
>>>>>>> hardware
>>>>>>> in the break state
>>>>>>>            but forbid any memory access. This way you can
>>>>>>> signal
>>>>>>> your
>>>>>>> preemption fence
>>>>>>>            even when the hardware isn't made available.
>>>>>>>
>>>>>>>            Before you continue XE setups a new pre-emption
>>>>>>> fence
>>>>>>> and
>>>>>>> makes sure that
>>>>>>>            all page tables etc... are up to date.
>>>>>>>
>>>>>>>            Could be tricky to get this right if completion
>>>>>>> fence
>>>>>>> based
>>>>>>> submissions are
>>>>>>>            mixed in as well, but that gives you at least a
>>>>>>> direction
>>>>>>> you could
>>>>>>>            potentially go.
>>>>>>>
>>>>>>>            Regards,
>>>>>>>            Christian.
>>>>>>>
>>>>>>>
>>>>>>>                Regards, Joonas
>>>>>>>
>>>>>>>
>>>>>>>                    Regards,
>>>>>>>                    Christian.
>>>>>>>
>>>>>>>
>>>>>>>                        Some wash-up thoughts from me below,
>>>>>>> but
>>>>>>> consider them fairly irrelevant
>>>>>>>                        since I think the main driver for
>>>>>>> these
>>>>>>> big
>>>>>>> questions here should be
>>>>>>>                        gdb/userspace.
>>>>>>>
>>>>>>>
>>>>>>>                            Quoting Christian König (2024-11-
>>>>>>> 07
>>>>>>> 11:44:33)
>>>>>>>
>>>>>>>                                Am 06.11.24 um 18:00 schrieb
>>>>>>> Matthew
>>>>>>> Brost:
>>>>>>>
>>>>>>>                                      [SNIP]
>>>>>>>
>>>>>>>                                      This is not a generic
>>>>>>> interface
>>>>>>> that anyone can freely access. The same
>>>>>>>                                      permissions used by
>>>>>>> ptrace
>>>>>>> are
>>>>>>> checked when opening such an interface.
>>>>>>>                                      See [1] [2].
>>>>>>>
>>>>>>>                                     
>>>>>>> [1]
>>>>>>> https://patchwork.freedesktop.org/patch/617470/?series=136572&r
>>>>>>> e
>>>>>>> v=2
>>>>>>>                                     
>>>>>>> [2]
>>>>>>> https://patchwork.freedesktop.org/patch/617471/?series=136572&r
>>>>>>> e
>>>>>>> v=2
>>>>>>>
>>>>>>>
>>>>>>>                                Thanks a lot for those
>>>>>>> pointers,
>>>>>>> that
>>>>>>> is exactly what I was looking for.
>>>>>>>
>>>>>>>                                And yeah, it is what I
>>>>>>> feared. You
>>>>>>> are
>>>>>>> re-implementing existing functionality,
>>>>>>>                                but see below.
>>>>>>>
>>>>>>>                            Could you elaborate on what this
>>>>>>> "existing
>>>>>>> functionality" exactly is?
>>>>>>>                            I do not think this functionality
>>>>>>> exists at
>>>>>>> this time.
>>>>>>>
>>>>>>>                            The EU debugging architecture for
>>>>>>> Xe
>>>>>>> specifically avoids the need for GDB
>>>>>>>                            to attach with ptrace to the CPU
>>>>>>> process or
>>>>>>> interfere with the CPU process for
>>>>>>>                            the debugging via parasitic
>>>>>>> threads or
>>>>>>> so.
>>>>>>>
>>>>>>>                            Debugger connection is opened to
>>>>>>> the
>>>>>>> DRM
>>>>>>> driver for given PID (which uses the
>>>>>>>                            ptrace may access check for now)
>>>>>>> after
>>>>>>> which the all DRM client of that
>>>>>>>                            PID are exposed to the debugger
>>>>>>> process.
>>>>>>>
>>>>>>>                            What we want to expose via that
>>>>>>> debugger
>>>>>>> connection is the ability for GDB to
>>>>>>>                            read/write the different GPU VM
>>>>>>> address
>>>>>>> spaces (ppGTT for Intel GPUs) just like
>>>>>>>                            the EU threads would see them.
>>>>>>> Note
>>>>>>> that
>>>>>>> the layout of the ppGTT is
>>>>>>>                            completely up to the userspace
>>>>>>> driver
>>>>>>> to
>>>>>>> setup and is mostly only partially
>>>>>>>                            equal to the CPU address space.
>>>>>>>
>>>>>>>                            Specifically as part of
>>>>>>> reading/writing the
>>>>>>> ppGTT for debugging purposes,
>>>>>>>                            there are deep flushes needed:
>>>>>>> for
>>>>>>> example
>>>>>>> flushing instruction cache
>>>>>>>                            when adding/removing breakpoints.
>>>>>>>
>>>>>>>                            Maybe that will explain the
>>>>>>> background. I
>>>>>>> elaborate on this at the end some more.
>>>>>>>
>>>>>>>
>>>>>>>                                              kmap/vmap are
>>>>>>> used
>>>>>>> everywhere in the DRM subsystem to access BOs, so I’m
>>>>>>>                                              failing to see
>>>>>>> the
>>>>>>> problem with adding a simple helper based on existing
>>>>>>>                                              code.
>>>>>>>
>>>>>>>                                          What#s possible and
>>>>>>> often
>>>>>>> done is to do kmap/vmap if you need to implement a
>>>>>>>                                          CPU copy for
>>>>>>> scanout for
>>>>>>> example or for copying/validating command buffers.
>>>>>>>                                          But that usually
>>>>>>> requires
>>>>>>> accessing the whole BO and has separate security
>>>>>>>                                          checks.
>>>>>>>
>>>>>>>                                          When you want to
>>>>>>> access
>>>>>>> only
>>>>>>> a few bytes of a BO that sounds massively like
>>>>>>>                                          a peek/poke like
>>>>>>> interface
>>>>>>> and we have already rejected that more than once.
>>>>>>>                                          There even used to
>>>>>>> be
>>>>>>> standardized GEM IOCTLs for that which have been
>>>>>>>                                          removed by now.
>>>>>>>
>>>>>>>                            Referring to the explanation at
>>>>>>> top:
>>>>>>> These
>>>>>>> IOCTL are not for the debugging target
>>>>>>>                            process to issue. The peek/poke
>>>>>>> interface
>>>>>>> is specifically for GDB only
>>>>>>>                            to facilitate the emulation of
>>>>>>> memory
>>>>>>> reads/writes on the GPU address
>>>>>>>                            space as they were done by EUs
>>>>>>> themselves.
>>>>>>> And to recap: for modifying
>>>>>>>                            instructions for example
>>>>>>> (add/remove
>>>>>>> breakpoint), extra level of cache flushing is
>>>>>>>                            needed which is not available to
>>>>>>> regular
>>>>>>> userspace.
>>>>>>>
>>>>>>>                            I specifically discussed with
>>>>>>> Sima on
>>>>>>> the
>>>>>>> difference before moving forward with this
>>>>>>>                            design originally. If something
>>>>>>> has
>>>>>>> changed
>>>>>>> since then, I'm of course happy to rediscuss.
>>>>>>>
>>>>>>>                            However, if this code can't be
>>>>>>> added,
>>>>>>> not
>>>>>>> sure how we would ever be able
>>>>>>>                            to implement core dumps for GPU
>>>>>>> threads/memory?
>>>>>>>
>>>>>>>
>>>>>>>                                          If you need to
>>>>>>> access
>>>>>>> BOs
>>>>>>> which are placed in not CPU accessible memory then
>>>>>>>                                          implement the
>>>>>>> access
>>>>>>> callback
>>>>>>> for ptrace, see amdgpu_ttm_access_memory for
>>>>>>>                                          an example how to
>>>>>>> do
>>>>>>> this.
>>>>>>>
>>>>>>>                            As also mentioned above, we don't
>>>>>>> work
>>>>>>> via
>>>>>>> ptrace at all when it comes
>>>>>>>                            to debugging the EUs. The only
>>>>>>> thing
>>>>>>> used
>>>>>>> for now is the ptrace_may_access to
>>>>>>>                            implement similar access
>>>>>>> restrictions
>>>>>>> as
>>>>>>> ptrace has. This can be changed
>>>>>>>                            to something else if needed.
>>>>>>>
>>>>>>>
>>>>>>>                                      Ptrace access via
>>>>>>> vm_operations_struct.access → ttm_bo_vm_access.
>>>>>>>
>>>>>>>                                      This series renames
>>>>>>> ttm_bo_vm_access to ttm_bo_access, with no code changes.
>>>>>>>
>>>>>>>                                      The above function
>>>>>>> accesses
>>>>>>> a BO
>>>>>>> via kmap if it is in SYSTEM / TT,
>>>>>>>                                      which is existing code.
>>>>>>>
>>>>>>>                                      This function is only
>>>>>>> exposed to
>>>>>>> user space via ptrace permissions.
>>>>>>>
>>>>>>>                            Maybe this sentence is what
>>>>>>> caused the
>>>>>>> confusion.
>>>>>>>
>>>>>>>                            Userspace is never exposed with
>>>>>>> peek/poke
>>>>>>> interface, only the debugger
>>>>>>>                            connection which is its own FD.
>>>>>>>
>>>>>>>
>>>>>>>                                      In this series, we
>>>>>>> implement
>>>>>>> a
>>>>>>> function [3] similar to
>>>>>>>                                     
>>>>>>> amdgpu_ttm_access_memory for
>>>>>>> the
>>>>>>> TTM vfunc access_memory. What is
>>>>>>>                                      missing is non-visible
>>>>>>> CPU
>>>>>>> memory
>>>>>>> access, similar to
>>>>>>>                                     
>>>>>>> amdgpu_ttm_access_memory_sdma.
>>>>>>> This will be addressed in a follow-up and
>>>>>>>                                      was omitted in this
>>>>>>> series
>>>>>>> given
>>>>>>> its complexity.
>>>>>>>
>>>>>>>                                      So, this looks more or
>>>>>>> less
>>>>>>> identical to AMD's ptrace implementation,
>>>>>>>                                      but in GPU address
>>>>>>> space.
>>>>>>> Again,
>>>>>>> I fail to see what the problem is here.
>>>>>>>                                      What am I missing?
>>>>>>>
>>>>>>>
>>>>>>>                                The main question is why
>>>>>>> can't you
>>>>>>> use
>>>>>>> the existing interfaces directly?
>>>>>>>
>>>>>>>                            We're not working on the CPU
>>>>>>> address
>>>>>>> space
>>>>>>> or BOs. We're working
>>>>>>>                            strictly on the GPU address space
>>>>>>> as
>>>>>>> would
>>>>>>> be seen by an EU thread if it
>>>>>>>                            accessed address X.
>>>>>>>
>>>>>>>
>>>>>>>                                Additional to the peek/poke
>>>>>>> interface
>>>>>>> of ptrace Linux has the pidfd_getfd
>>>>>>>                                system call, see
>>>>>>> here
>>>>>>> https://man7.org/linux/man-pages/man2/pidfd_getfd.2.html.
>>>>>>>
>>>>>>>                                The pidfd_getfd() allows to
>>>>>>> dup()
>>>>>>> the
>>>>>>> render node file descriptor into your gdb
>>>>>>>                                process. That in turn gives
>>>>>>> you
>>>>>>> all the
>>>>>>> access you need from gdb, including
>>>>>>>                                mapping BOs and command
>>>>>>> submission
>>>>>>> on
>>>>>>> behalf of the application.
>>>>>>>
>>>>>>>                            We're not operating on the CPU
>>>>>>> address
>>>>>>> space nor are we operating on BOs
>>>>>>>                            (there is no concept of BO in the
>>>>>>> EU
>>>>>>> debug
>>>>>>> interface). Each VMA in the VM
>>>>>>>                            could come from anywhere, only
>>>>>>> the
>>>>>>> start
>>>>>>> address and size matter. And
>>>>>>>                            neither do we need to interfere
>>>>>>> with
>>>>>>> the
>>>>>>> command submission of the
>>>>>>>                            process under debug.
>>>>>>>
>>>>>>>
>>>>>>>                                As far as I can see that
>>>>>>> allows
>>>>>>> for the
>>>>>>> same functionality as the eudebug
>>>>>>>                                interface, just without any
>>>>>>> driver
>>>>>>> specific code messing with ptrace
>>>>>>>                                permissions and peek/poke
>>>>>>> interfaces.
>>>>>>>
>>>>>>>                                So the question is still why
>>>>>>> do
>>>>>>> you
>>>>>>> need the whole eudebug interface in the
>>>>>>>                                first place? I might be
>>>>>>> missing
>>>>>>> something, but that seems to be superfluous
>>>>>>>                                from a high level view.
>>>>>>>
>>>>>>>                            Recapping from above. It is to
>>>>>>> allow
>>>>>>> the
>>>>>>> debugging of EU threads per DRM
>>>>>>>                            client, completely independent of
>>>>>>> the
>>>>>>> CPU
>>>>>>> process. If ptrace_may_acces
>>>>>>>                            is the sore point, we could
>>>>>>> consider
>>>>>>> other
>>>>>>> permission checks, too. There
>>>>>>>                            is no other connection to ptrace
>>>>>>> in
>>>>>>> this
>>>>>>> architecture as single
>>>>>>>                            permission check to know if PID
>>>>>>> is
>>>>>>> fair
>>>>>>> game to access by debugger
>>>>>>>                            process.
>>>>>>>
>>>>>>>                            Why no parasitic thread or
>>>>>>> ptrace:
>>>>>>> Going
>>>>>>> forward, binding the EU debugging to
>>>>>>>                            the DRM client would also pave
>>>>>>> way for
>>>>>>> being able to extend core kernel generated
>>>>>>>                            core dump with each DRM client's
>>>>>>> EU
>>>>>>> thread/memory dump. We have similar
>>>>>>>                            feature called "Offline core
>>>>>>> dump"
>>>>>>> enabled
>>>>>>> in the downstream public
>>>>>>>                            trees for i915, where we
>>>>>>> currently
>>>>>>> attach
>>>>>>> the EU thread dump to i915 error state
>>>>>>>                            and then later combine i915 error
>>>>>>> state
>>>>>>> with CPU core dump file with a
>>>>>>>                            tool.
>>>>>>>
>>>>>>>                            This is relatively little amount
>>>>>>> of
>>>>>>> extra
>>>>>>> code, as this baseline series
>>>>>>>                            already introduces GDB the
>>>>>>> ability to
>>>>>>> perform the necessary actions.
>>>>>>>                            It's just the matter of kernel
>>>>>>> driver
>>>>>>> calling: "stop all threads", then
>>>>>>>                            copying the memory map and memory
>>>>>>> contents
>>>>>>> for GPU threads, just like is
>>>>>>>                            done for CPU threads.
>>>>>>>
>>>>>>>                            With parasitic thread injection,
>>>>>>> not
>>>>>>> sure
>>>>>>> if there is such way forward,
>>>>>>>                            as it would seem to require to
>>>>>>> inject
>>>>>>> quite
>>>>>>> abit more logic to core kernel?
>>>>>>>
>>>>>>>
>>>>>>>                                It's true that the AMD KFD
>>>>>>> part
>>>>>>> has
>>>>>>> still similar functionality, but that is
>>>>>>>                                because of the broken KFD
>>>>>>> design
>>>>>>> of
>>>>>>> tying driver state to the CPU process
>>>>>>>                                (which makes it inaccessible
>>>>>>> for
>>>>>>> gdb
>>>>>>> even with imported render node fd).
>>>>>>>
>>>>>>>                                Both Sima and I (and
>>>>>>> partially
>>>>>>> Dave as
>>>>>>> well) have pushed back on the KFD
>>>>>>>                                approach. And the long term
>>>>>>> plan
>>>>>>> is to
>>>>>>> get rid of such device driver specific
>>>>>>>                                interface which re-implement
>>>>>>> existing
>>>>>>> functionality just differently.
>>>>>>>
>>>>>>>                            Recapping, this series is not
>>>>>>> adding
>>>>>>> it
>>>>>>> back. The debugger connection
>>>>>>>                            is a separate FD from the DRM
>>>>>>> one,
>>>>>>> with
>>>>>>> separate IOCTL set. We don't allow
>>>>>>>                            the DRM FD any new operations
>>>>>>> based on
>>>>>>> ptrace is attached or not. We
>>>>>>>                            don't ever do that check even.
>>>>>>>
>>>>>>>                            We only restrict the opening of
>>>>>>> the
>>>>>>> debugger connection to given PID with
>>>>>>>                            ptrace_may_access check for now.
>>>>>>> That
>>>>>>> can
>>>>>>> be changed to something else,
>>>>>>>                            if necessary.
>>>>>>>
>>>>>>>                        Yeah I think unnecessarily tying gpu
>>>>>>> processes
>>>>>>> to cpu processes is a bad
>>>>>>>                        thing, least because even today all
>>>>>>> the
>>>>>>> svm
>>>>>>> discussions we have still hit
>>>>>>>                        clear use-cases, where a 1:1 match is
>>>>>>> not
>>>>>>> wanted (like multiple gpu svm
>>>>>>>                        sections with offsets). Not even
>>>>>>> speaking
>>>>>>> of
>>>>>>> all the gpu usecases where
>>>>>>>                        the gpu vm space is still entirely
>>>>>>> independent
>>>>>>> of the cpu side.
>>>>>>>
>>>>>>>                        So that's why I think this entirely
>>>>>>> separate
>>>>>>> approach looks like the right
>>>>>>>                        one, with ptrace_may_access as the
>>>>>>> access
>>>>>>> control check to make sure we
>>>>>>>                        match ptrace on the cpu side.
>>>>>>>
>>>>>>>                        But there's very obviously a bikeshed
>>>>>>> to
>>>>>>> be had
>>>>>>> on what the actual uapi
>>>>>>>                        should look like, especially how gdb
>>>>>>> opens
>>>>>>> up a
>>>>>>> gpu debug access fd. But I
>>>>>>>                        also think that's not much on drm to
>>>>>>> decide,
>>>>>>> but whatever gdb wants. And
>>>>>>>                        then we aim for some consistency on
>>>>>>> that
>>>>>>> lookup/access control part
>>>>>>>                        (ideally, I might be missing some
>>>>>>> reasons
>>>>>>> why
>>>>>>> this is a bad idea) across
>>>>>>>                        drm drivers.
>>>>>>>
>>>>>>>
>>>>>>>                                So you need to have a really
>>>>>>> really
>>>>>>> good explanation why the eudebug interface
>>>>>>>                                is actually necessary.
>>>>>>>
>>>>>>>                            TL;DR The main point is to
>>>>>>> decouple
>>>>>>> the
>>>>>>> debugging of the EU workloads from the
>>>>>>>                            debugging of the CPU process.
>>>>>>> This
>>>>>>> avoids
>>>>>>> the interference with the CPU process with
>>>>>>>                            parasitic thread injection.
>>>>>>> Further
>>>>>>> this
>>>>>>> also allows generating a core dump
>>>>>>>                            without any GDB connected. There
>>>>>>> are
>>>>>>> also
>>>>>>> many other smaller pros/cons
>>>>>>>                            which can be discussed but for
>>>>>>> the
>>>>>>> context
>>>>>>> of this patch, this is the
>>>>>>>                            main one.
>>>>>>>
>>>>>>>                            So unlike parasitic thread
>>>>>>> injection,
>>>>>>> we
>>>>>>> don't unlock any special IOCTL for
>>>>>>>                            the process under debug to be
>>>>>>> performed by
>>>>>>> the parasitic thread, but we
>>>>>>>                            allow the minimal set of
>>>>>>> operations to
>>>>>>> be
>>>>>>> performed by GDB as if those were
>>>>>>>                            done on the EUs themselves.
>>>>>>>
>>>>>>>                            One can think of it like the
>>>>>>> minimal
>>>>>>> subset
>>>>>>> of ptrace but for EU threads,
>>>>>>>                            not the CPU threads. And thus,
>>>>>>> building on
>>>>>>> this it's possible to extend
>>>>>>>                            the core kernel generated core
>>>>>>> dumps
>>>>>>> with
>>>>>>> DRM specific extension which
>>>>>>>                            would contain the EU
>>>>>>> thread/memory
>>>>>>> dump.
>>>>>>>
>>>>>>>                        It might be good to document (in that
>>>>>>> debugging
>>>>>>> doc patch probably) why
>>>>>>>                        thread injection is not a great
>>>>>>> option,
>>>>>>> and why
>>>>>>> the tradeoffs for
>>>>>>>                        debugging are different than for for
>>>>>>> checkpoint/restore, where with CRIU
>>>>>>>                        we landed on doing most of this in
>>>>>>> userspace,
>>>>>>> and often requiring
>>>>>>>                        injection threads to make it all
>>>>>>> work.
>>>>>>>
>>>>>>>                        Cheers, Sima
>>>>>>>
>>>>>>>
>>>>>>>                            Regards, Joonas
>>>>>>>
>>>>>>>
>>>>>>>                                Regards,
>>>>>>>                                Christian.
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>                                      Matt
>>>>>>>
>>>>>>>                                     
>>>>>>> [3]
>>>>>>> https://patchwork.freedesktop.org/patch/622520/?series=140200&r
>>>>>>> e
>>>>>>> v=6
>>>>>>>
>>>>>>>
>>>>>>>                                          Regards,
>>>>>>>                                          Christian.
>>>>>>>
>>>>>>>
>>>>>>>                                              Matt
>>>>>>>
>>>>>>>
>>>>>>>                                                  Regards,
>>>>>>>                                                  Christian.
>>>>>>>
>>>>>>>
>>>>>>>

--------------Pexe4VXW16VAr8yHlF2xZ1tV
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 13.11.24 um 11:44 schrieb Thomas Hellström:<br>
    <blockquote type="cite" cite="mid:5a16ef4ff06a530c52df7633833db19aaa15b33e.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">On Wed, 2024-11-13 at 09:37 +0100, Christian König wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 12.11.24 um 17:33 schrieb Thomas Hellström:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">[SNIP]
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">This has been extensively discussed already, but was expected
to
really
only be needed for low-on-memory scenarios. However it now
seems
like
the need is much earlier due to the random userptr page
joining
by
core
mm.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Just to clarify here:
&nbsp;&nbsp; 
In Long-Running mode with recoverable pagefaults enabled we
don't
have
any preempt-fences, but rather just zap the PTEs pointing to
the
affected memory and flush TLB. So from a memory resource POW a
breakpoint should be safe, and no mmu notifier nor shrinker
will be
blocked.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">That sounds like a HMM based approach which would clearly work.

But where is that? I don't see any HMM based approach anywhere in
the
XE
driver.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">This is a mode that uses recoverable pagefaults to fault either
full
userptr or full bos, and used with DRM_XE_VM_CRATE_FLAG_FAULT_MODE.
(not SVM)!

userptrs in xe are bo-less, and using the vm's resv, but otherwise
using hmm similar to amdgpu: xe_hmm.c
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Yeah, I have seen that one.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">fault servicing:
xe_gt_pagefault.c

PTE zapping on eviction and notifier:
xe_vm_invalidate_vma(), xe_vm.c
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Ah, that was the stuff I was missing.

So the implementation in xe_preempt_fence.c is just for graphics 
submissions? That would make the whole thing much easier to handle.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Actually it's not, it's intended for long-running mode, but as a
consequence the debugger would be allowed only in fault mode.</pre>
    </blockquote>
    <br>
    Make sense, yes.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:5a16ef4ff06a530c52df7633833db19aaa15b33e.camel@linux.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
The only remaining question I can then see is if long running 
submissions with DRM_XE_VM_CRATE_FLAG_FAULT_MODE could potentially
block 
graphics submissions without this flag from accessing the hardware?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yes and no. We have a mechanism in place that allows either only fault
mode jobs or non-faulting jobs on the same, what we call &quot;engine
group&quot;.
A pagefault on an engine group would block or hamper progress of other
jobs on that engine group.

So let's say a dma-fence job is submitted to an engine group that is
currently running a faulting job. We'd then need to switch mode of the
engine group and, in the exec ioctl we'd (explicitly without preempt-
fences) preempt the faulting job before submitting the dma-fence job
and publishing its fence. This preemption will incur a delay which is
typically the delay of servicing any outstanding pagefaults. It's not
ideal, but the best we can do, and it doesn't affect core memory
management nor does it affect migration blits.

In the debugger case, this delay could be long due to breakpoints, and
that's why enabling the debugger would sit behind a flag and not
something default (I think this was discussed earlier in the thread).
Still, core memory management would be unaffected, and also ofc the
migration blits are completely independent.</pre>
    </blockquote>
    <br>
    Yeah, that sounds totally sane to me.<br>
    <br>
    Sorry for the noise then. I didn't realized that you have two
    separate modes of operation.<br>
    <br>
    Going to reply on the other open questions separately.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:5a16ef4ff06a530c52df7633833db19aaa15b33e.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">

/Thomas

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Thanks a lot for pointing this out,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Thanks,
Thomas

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Regards,
Christian.

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Nor will there be any jobs with published dma-fences depending
on
the
job blocked either temporarily by a pagefault or long-term by a
debugger breakpoint.

/Thomas


</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">If that is done and the memory pre-empt fence is serviced
even
for
debuggable contexts, do you have further concerns with the
presented
approach
from dma-buf and drm/sched perspective?

Regards, Joonas

</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">Regards,
Christian.


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This means that a breakpoint or core dump doesn't
halt
GPU
threads, but
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rather suspends them. E.g. all running wave data
is
collected into a state
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bag which can be restored later on.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I was under the impression that those long
running
compute
threads do
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exactly that, but when the hardware can't switch
out
the
GPU thread/process
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while in a break then that isn't the case.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; As long as you don't find a way to avoid that
this
patch
set is a pretty
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clear NAK from my side as DMA-buf and TTM
maintainer.


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I believe this is addressed above.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Matt


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; What might work is to keep the submission on the
hardware
in the break state
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; but forbid any memory access. This way you can
signal
your
preemption fence
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; even when the hardware isn't made available.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Before you continue XE setups a new pre-emption
fence
and
makes sure that
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all page tables etc... are up to date.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Could be tricky to get this right if completion
fence
based
submissions are
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mixed in as well, but that gives you at least a
direction
you could
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; potentially go.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Regards,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Christian.


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Regards, Joonas


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Regards,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Christian.


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Some wash-up thoughts from me below,
but
consider them fairly irrelevant
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; since I think the main driver for
these
big
questions here should be
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gdb/userspace.


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Quoting Christian König (2024-11-
07
11:44:33)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Am 06.11.24 um 18:00 schrieb
Matthew
Brost:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [SNIP]

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This is not a generic
interface
that anyone can freely access. The same
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; permissions used by
ptrace
are
checked when opening such an interface.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; See [1] [2].

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
[1]
<a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/617470/?series=136572&amp;r">https://patchwork.freedesktop.org/patch/617470/?series=136572&amp;r</a>
e
v=2
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
[2]
<a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/617471/?series=136572&amp;r">https://patchwork.freedesktop.org/patch/617471/?series=136572&amp;r</a>
e
v=2


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Thanks a lot for those
pointers,
that
is exactly what I was looking for.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; And yeah, it is what I
feared. You
are
re-implementing existing functionality,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; but see below.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Could you elaborate on what this
&quot;existing
functionality&quot; exactly is?
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I do not think this functionality
exists at
this time.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The EU debugging architecture for
Xe
specifically avoids the need for GDB
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; to attach with ptrace to the CPU
process or
interfere with the CPU process for
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the debugging via parasitic
threads or
so.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Debugger connection is opened to
the
DRM
driver for given PID (which uses the
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ptrace may access check for now)
after
which the all DRM client of that
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PID are exposed to the debugger
process.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; What we want to expose via that
debugger
connection is the ability for GDB to
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write the different GPU VM
address
spaces (ppGTT for Intel GPUs) just like
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the EU threads would see them.
Note
that
the layout of the ppGTT is
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; completely up to the userspace
driver
to
setup and is mostly only partially
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; equal to the CPU address space.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Specifically as part of
reading/writing the
ppGTT for debugging purposes,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; there are deep flushes needed:
for
example
flushing instruction cache
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; when adding/removing breakpoints.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Maybe that will explain the
background. I
elaborate on this at the end some more.


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kmap/vmap are
used
everywhere in the DRM subsystem to access BOs, so I’m
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; failing to see
the
problem with adding a simple helper based on existing
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; code.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; What#s possible and
often
done is to do kmap/vmap if you need to implement a
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CPU copy for
scanout for
example or for copying/validating command buffers.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; But that usually
requires
accessing the whole BO and has separate security
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; checks.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; When you want to
access
only
a few bytes of a BO that sounds massively like
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a peek/poke like
interface
and we have already rejected that more than once.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; There even used to
be
standardized GEM IOCTLs for that which have been
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; removed by now.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Referring to the explanation at
top:
These
IOCTL are not for the debugging target
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; process to issue. The peek/poke
interface
is specifically for GDB only
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; to facilitate the emulation of
memory
reads/writes on the GPU address
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; space as they were done by EUs
themselves.
And to recap: for modifying
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; instructions for example
(add/remove
breakpoint), extra level of cache flushing is
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; needed which is not available to
regular
userspace.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I specifically discussed with
Sima on
the
difference before moving forward with this
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; design originally. If something
has
changed
since then, I'm of course happy to rediscuss.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; However, if this code can't be
added,
not
sure how we would ever be able
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; to implement core dumps for GPU
threads/memory?


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; If you need to
access
BOs
which are placed in not CPU accessible memory then
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; implement the
access
callback
for ptrace, see amdgpu_ttm_access_memory for
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; an example how to
do
this.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; As also mentioned above, we don't
work
via
ptrace at all when it comes
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; to debugging the EUs. The only
thing
used
for now is the ptrace_may_access to
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; implement similar access
restrictions
as
ptrace has. This can be changed
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; to something else if needed.


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ptrace access via
vm_operations_struct.access → ttm_bo_vm_access.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This series renames
ttm_bo_vm_access to ttm_bo_access, with no code changes.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The above function
accesses
a BO
via kmap if it is in SYSTEM / TT,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; which is existing code.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This function is only
exposed to
user space via ptrace permissions.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Maybe this sentence is what
caused the
confusion.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Userspace is never exposed with
peek/poke
interface, only the debugger
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; connection which is its own FD.


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; In this series, we
implement
a
function [3] similar to
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
amdgpu_ttm_access_memory for
the
TTM vfunc access_memory. What is
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; missing is non-visible
CPU
memory
access, similar to
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
amdgpu_ttm_access_memory_sdma.
This will be addressed in a follow-up and
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; was omitted in this
series
given
its complexity.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; So, this looks more or
less
identical to AMD's ptrace implementation,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; but in GPU address
space.
Again,
I fail to see what the problem is here.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; What am I missing?


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The main question is why
can't you
use
the existing interfaces directly?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; We're not working on the CPU
address
space
or BOs. We're working
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strictly on the GPU address space
as
would
be seen by an EU thread if it
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; accessed address X.


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Additional to the peek/poke
interface
of ptrace Linux has the pidfd_getfd
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; system call, see
here
<a class="moz-txt-link-freetext" href="https://man7.org/linux/man-pages/man2/pidfd_getfd.2.html">https://man7.org/linux/man-pages/man2/pidfd_getfd.2.html</a>.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The pidfd_getfd() allows to
dup()
the
render node file descriptor into your gdb
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; process. That in turn gives
you
all the
access you need from gdb, including
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mapping BOs and command
submission
on
behalf of the application.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; We're not operating on the CPU
address
space nor are we operating on BOs
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (there is no concept of BO in the
EU
debug
interface). Each VMA in the VM
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; could come from anywhere, only
the
start
address and size matter. And
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; neither do we need to interfere
with
the
command submission of the
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; process under debug.


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; As far as I can see that
allows
for the
same functionality as the eudebug
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interface, just without any
driver
specific code messing with ptrace
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; permissions and peek/poke
interfaces.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; So the question is still why
do
you
need the whole eudebug interface in the
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; first place? I might be
missing
something, but that seems to be superfluous
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from a high level view.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Recapping from above. It is to
allow
the
debugging of EU threads per DRM
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; client, completely independent of
the
CPU
process. If ptrace_may_acces
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; is the sore point, we could
consider
other
permission checks, too. There
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; is no other connection to ptrace
in
this
architecture as single
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; permission check to know if PID
is
fair
game to access by debugger
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; process.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Why no parasitic thread or
ptrace:
Going
forward, binding the EU debugging to
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the DRM client would also pave
way for
being able to extend core kernel generated
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; core dump with each DRM client's
EU
thread/memory dump. We have similar
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; feature called &quot;Offline core
dump&quot;
enabled
in the downstream public
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trees for i915, where we
currently
attach
the EU thread dump to i915 error state
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and then later combine i915 error
state
with CPU core dump file with a
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tool.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This is relatively little amount
of
extra
code, as this baseline series
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; already introduces GDB the
ability to
perform the necessary actions.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; It's just the matter of kernel
driver
calling: &quot;stop all threads&quot;, then
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; copying the memory map and memory
contents
for GPU threads, just like is
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done for CPU threads.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; With parasitic thread injection,
not
sure
if there is such way forward,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; as it would seem to require to
inject
quite
abit more logic to core kernel?


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; It's true that the AMD KFD
part
has
still similar functionality, but that is
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; because of the broken KFD
design
of
tying driver state to the CPU process
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (which makes it inaccessible
for
gdb
even with imported render node fd).

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Both Sima and I (and
partially
Dave as
well) have pushed back on the KFD
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; approach. And the long term
plan
is to
get rid of such device driver specific
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interface which re-implement
existing
functionality just differently.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Recapping, this series is not
adding
it
back. The debugger connection
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; is a separate FD from the DRM
one,
with
separate IOCTL set. We don't allow
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the DRM FD any new operations
based on
ptrace is attached or not. We
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; don't ever do that check even.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; We only restrict the opening of
the
debugger connection to given PID with
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ptrace_may_access check for now.
That
can
be changed to something else,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if necessary.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Yeah I think unnecessarily tying gpu
processes
to cpu processes is a bad
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; thing, least because even today all
the
svm
discussions we have still hit
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clear use-cases, where a 1:1 match is
not
wanted (like multiple gpu svm
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sections with offsets). Not even
speaking
of
all the gpu usecases where
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the gpu vm space is still entirely
independent
of the cpu side.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; So that's why I think this entirely
separate
approach looks like the right
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; one, with ptrace_may_access as the
access
control check to make sure we
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; match ptrace on the cpu side.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; But there's very obviously a bikeshed
to
be had
on what the actual uapi
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; should look like, especially how gdb
opens
up a
gpu debug access fd. But I
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; also think that's not much on drm to
decide,
but whatever gdb wants. And
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; then we aim for some consistency on
that
lookup/access control part
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (ideally, I might be missing some
reasons
why
this is a bad idea) across
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm drivers.


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; So you need to have a really
really
good explanation why the eudebug interface
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; is actually necessary.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TL;DR The main point is to
decouple
the
debugging of the EU workloads from the
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debugging of the CPU process.
This
avoids
the interference with the CPU process with
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; parasitic thread injection.
Further
this
also allows generating a core dump
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; without any GDB connected. There
are
also
many other smaller pros/cons
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; which can be discussed but for
the
context
of this patch, this is the
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; main one.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; So unlike parasitic thread
injection,
we
don't unlock any special IOCTL for
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the process under debug to be
performed by
the parasitic thread, but we
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; allow the minimal set of
operations to
be
performed by GDB as if those were
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done on the EUs themselves.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; One can think of it like the
minimal
subset
of ptrace but for EU threads,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; not the CPU threads. And thus,
building on
this it's possible to extend
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the core kernel generated core
dumps
with
DRM specific extension which
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; would contain the EU
thread/memory
dump.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; It might be good to document (in that
debugging
doc patch probably) why
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; thread injection is not a great
option,
and why
the tradeoffs for
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debugging are different than for for
checkpoint/restore, where with CRIU
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; we landed on doing most of this in
userspace,
and often requiring
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; injection threads to make it all
work.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Cheers, Sima


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Regards, Joonas


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Regards,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Christian.



&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Matt

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
[3]
<a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/622520/?series=140200&amp;r">https://patchwork.freedesktop.org/patch/622520/?series=140200&amp;r</a>
e
v=6


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Regards,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Christian.


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Matt


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Regards,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Christian.



</pre>
                </blockquote>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------Pexe4VXW16VAr8yHlF2xZ1tV--
