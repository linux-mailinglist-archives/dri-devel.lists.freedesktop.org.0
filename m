Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AFA4FD33A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 11:15:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC08610EE6C;
	Tue, 12 Apr 2022 09:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E46410EE6C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 09:15:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VtcYft65aS+aJ9dmFnC4jAvyJaTlSjfAgYnhYGNddf6Zuo33wvm/snkh/8gjchq8vFT94cBlyhARHpLUwPJ69BbSOFxNlzrjEQvQTIy9E1By+ZJ71qjlZvo2DpzjHvJjq4kRsWCT2Nl02T0qq9/1njj+jj+Q6yOfsexhQ7rNWegkpAtVSLmyaXyb0kbZ4p3K7QVqvJyvcVuAKDT/1cu2Vfpt4wz+071/8bPPCyhpTWdNT/tsrcWXGJNF606meoek4oqN8ty4e/ClyUjQLL33wJ+ZDXsEA/6ZQTmnpYRyjmMJNkcU/QdyOMfq9c7UChqpdcoGYZwb+0wWbwjss6lPmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Q+uB49W0sICbzBEWNqUOU4Vod8GSWfXgH5YC9Ra09E=;
 b=M12BFM3EauPhlnSNVoUWvGixivS2dtj0TK7gV5bFnb3SMkpCsnxLb3WjF/8W9HdhyCuHqTipJ5AhOEqBH/nrjU0+lqQIqj7jBmmvfj7c42E4PvLREHqj/LEGKz6we+Mf9ZLWMcVLlt5CSkNgCPqBHpHnfNu9Q/9iANBLI2d3YKG57B7BMeGJHR68Caa2uIAhmYISArwyjG39qJByW0DA2lUk0FqPL9t1Fjv96hOuR8YXP37u68k2kAcYBDsuwLW8qe/C7RB1f0CltPnBwuPAOthqviNEmweny9AKmwow6DJG/NJguOszObwm9TrDmBubN/T3HVzgIV317xNurhopdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Q+uB49W0sICbzBEWNqUOU4Vod8GSWfXgH5YC9Ra09E=;
 b=XPYwKSmpdzWnA7aNOGGQl9s6XhwG4FJCH6OvH2LMG79VjKPvDYUMwYR4R6AW6/kjIh562Cak8xIHCGFgayOQCPcGJnpxoiXUw6kn/DweSJTGcdeCpYEc5tvt/ToZg7lQ1fz3YiZpjrzHKlLTYeeoMHLpwmsgfP+17yd6+yUCexc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB3979.namprd12.prod.outlook.com (2603:10b6:5:1cd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Tue, 12 Apr
 2022 09:15:41 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 09:15:40 +0000
Message-ID: <ce6b5402-c7ac-b382-f7bf-1581afa59322@amd.com>
Date: Tue, 12 Apr 2022 11:15:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 0/5] drm/ttm: Introduce TTM res manager debugfs helpers
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20220412033526.369115-1-zack@kde.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220412033526.369115-1-zack@kde.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR04CA0060.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::37) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cce38406-804b-46ed-c6a8-08da1c650369
X-MS-TrafficTypeDiagnostic: DM6PR12MB3979:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3979C524EA9641E830A50BA283ED9@DM6PR12MB3979.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xUNdpn5zw1uVjBH0w2Rrw+PsEdmVRvA39uNmRKIJC09iokNfNjETke1EM0kzDkhrUhAcOf4VX2v1I1F9aRVThy/NuhJ2TCahvr4kJgX2DMxwCP/bNNP9bDlKH+1sDdohe/q9Dj1xraItddIkyjg3GuMHuTJcSDGxBrGGr246GTmI89Dtmzld9qHntJdYUtC9OzkbglmwhcxHhYnuogaeRRWtW05H3fsvWdjFqeqKV6mcrHNPE/q8luovNqfKrOj6Xv5ni7kw2JRyCMNSvAItZEVahXrwTbd2SLuaX4voU/kjmbobpAAbo1ZKZaygfjI1VyreT+lyPof7siUJAqMfIbX3daOoDsecIAWqxWTUnJOlnIxyuoF087EdmHFfcRtNWbShwwtJ+DCv2HBXljAgDq/MWqM95IaEYmBB6b4i3usRnWrHShI68zpOVi2q0RYyQiBjqLCe5rYSwsme0BnOON3yI2f/Glev2A7RJt5wuunH54POQiTfCpeVSFJpN8UCiuL2GJQ9pA8Dxl+Hzf5SBdGRumePv4iVh2RocbiDntytjUb+xy45L30/8uFGCdIXSSMEG0VHSHYVNR5ATMygMkX76vz6IEoxNo5ysuqU4YGeyO2iAe+yy2GlfMZLlzPgpGF8KBW86BkRkI9ddLq1CsJ7xt1d+/NZjn7ts7ckHqBuLNtFenVvCW7MT5WIvaY7MgwVZAQPHErAf9JnNV5B4I8C+cwr+ZBmHfTMSbBCUhE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(36756003)(6486002)(31686004)(2906002)(8936002)(4326008)(8676002)(38100700002)(66556008)(66476007)(83380400001)(54906003)(66946007)(316002)(2616005)(508600001)(6666004)(86362001)(26005)(186003)(6506007)(6512007)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzBmakszSWd5bkIxNVdCL0NnV1dlUWkyaVIvcHF4VHd0WmdDeTh6eFhTSXAv?=
 =?utf-8?B?cktjdEkwZytpT1VlUmMvd0tBNzF0YkdCMkpYRVNVWjRmdDBxc1g4OHJ4c1Vu?=
 =?utf-8?B?ZnVrR2dsNDArbDdjZjVOeFl5TGM0VS90bWFQK1F4RHp0emtrdXlkZmxSU0xC?=
 =?utf-8?B?SnY0WXY1Q1pza3Rxakx5ZjBlMVNYcTlrVUxyaUZYVit2T2pIUkFtUmJYbjF4?=
 =?utf-8?B?bktFSmF3QjAxT3hqa2RmeUNKTGUrN3pLQ0RFMnlLdXNaeDBhTTNQcklIQXRI?=
 =?utf-8?B?eXMyc04ydVZHSGRyWFFxSFc2dlZLY0U1YWFMVVRQS3EzU2dYckg1cEUvNzFY?=
 =?utf-8?B?bWVrL25mcFdkYVV5cUpZaGZjTi9rNENSc2FRdHRHS3RIRGQ1ejVIUjFaekhE?=
 =?utf-8?B?bktKWVA3N3R4YU9SZ3FCTVNjWFlMWVRWQTAxSXR6TGNyNC83S0dJc1dEVmpU?=
 =?utf-8?B?cEljVTl1S0IzUDFKdmlkOEgxOFdtV09KRFBuRzVrRDdRczVJZUxOMVpqYmhm?=
 =?utf-8?B?Wm9zK2ViSVMvZFVudmNsVEFxRzRVVUhSMk50ZDRWdWFwazA4WFNWMUVUZW40?=
 =?utf-8?B?MUowS0lzaTRLNUI5VFo1U1l1TGRZUVNKOW94aGhrcXlUTzZGZzNqWnhZeEJL?=
 =?utf-8?B?RWZCNjZpNUs5UTBMcTczT0VFUW1DTUpUQlRJVTJnZDJmOEVqNHZYcTI3YS83?=
 =?utf-8?B?L3BZV2RCQzBDTSt0VkZtMDhUUDRwTkNhMDJzQWgxUmNUKy9vUERpTm4zS3Rv?=
 =?utf-8?B?Y3FUcUdjbktmb3kyNDgxbnd3WE5ZdDY3dFhvSks0VmJKOTgrL0QwbkRDaTNa?=
 =?utf-8?B?Mlh6VVJDNGJxNnhGZUxnWVZYcDFqdGpLZUc4SUkwcCtHQmJwK0dhODZwTGZk?=
 =?utf-8?B?MkcxZXdHUDBvcVJ0T3RMajVlcERrVzF2RVRNa2xzb0ZjN2l6d1F5dVIzQVhC?=
 =?utf-8?B?VW9ESnFzRHRvUXZjYWliQ0lmTlhhNDdIQVdEbGRUb2h5ait4Ym9udlMwVEMx?=
 =?utf-8?B?RHNmaE1DcXhOY0wwM2xpMWsrZXV2bFBvTUsyTGw2YVAySVFuUjlVaFVBOU82?=
 =?utf-8?B?YnQxWE9HbFY1YVA5R3JMT3dRaHFvSTZaaG1FcjUrWC9COWdFSVV0Z2xkNDFM?=
 =?utf-8?B?aG9FOEFEUjB1WE1TbFdSeXF2M0FYUmN3clNsRlNQU053a2JQaW5LN1ZPeVVt?=
 =?utf-8?B?N0M1ZTVyVENFRzR3QnNEb1kwaThTSnE4anFsNW9pbVl1MmV6Rk04dFhDUkFr?=
 =?utf-8?B?bHNnTXFGRjJuWTRINmZFZGxlREE3T21XWSsyRll5SkZlNDFQTXVoYzhJZm9H?=
 =?utf-8?B?aHRIb1E5WEptemlaMWlpM2RwQVZtQmVKclh3czl4dWJWNmwxVVZla256ckx1?=
 =?utf-8?B?UGdLaTRZZlFXdE1Kbm5IL1VMUm1PZ1JnZkMxOGgyZlBjRWhvUnJUUUpzRUgz?=
 =?utf-8?B?Nk1OU2pqazQ5d2YzUXJlSFJSZEl6WENtamVSOWJDTm00SVVlQzNDWGVBTkh3?=
 =?utf-8?B?WGNtdVNlMnhqZjRPZnRnaVlWbmlmMmhpRWIyU0RxZ25UN3NlSU16OWszeHVI?=
 =?utf-8?B?Yi9aZGJ3dWZzcHZDelBVVVhnT292MUQzZUdld2dDVlA3WWM5QmVtWUlYOURs?=
 =?utf-8?B?SWRUOU9rNEhNTFhPRi9oK1VBZ1NZUW5qL0VmOEYzanJrc2h6T0lBd3ZRRDhX?=
 =?utf-8?B?VENvVTcyRU9jaFBNVm5KNGFBNzB0MFhOUXMxdDdHb29NSjJoNERES2hpNWRC?=
 =?utf-8?B?NHdiMmM3bmg2Y2hkU0pmckRUZjlYZDdvYTROSXJUY2phQmg2TDAxNnNSWFRl?=
 =?utf-8?B?S21rVG9tRmI5STc0SmQ4ODcwRGZxY1I0ZzlnWjJneWliL3VLTzRESktDUGlt?=
 =?utf-8?B?TUFHZVF6a2JjOGR0b0Z3TXd4b1U4RGRQL00yUWNVTmJaT1dyVm5VV3NFd0p6?=
 =?utf-8?B?dHFzK3dzNzZ1Y0lVLytiR3E2V29kdENxR3pBWnhRQnRpQ2dWT0lPVGg0dndF?=
 =?utf-8?B?Q1BwcmlEeGtycnZIeGVJRnphbHk5cExIQytzZUMrOTgrMWhQalRqaDYxUnph?=
 =?utf-8?B?ZCtxc1ZTaG1LMWpMMkhTSTZvcFYzRGNNT2dmL1JzN2g0WUVnZkVLWXJNY3dw?=
 =?utf-8?B?MGNBbStrRlhrYVJkcjlQNGVqamgwWERYQi9zS2JxRmFONTdLdkp5RUdvbkdK?=
 =?utf-8?B?NFpOMC9sSzhUc3JKd0ZFVExiTzFOUHZJVDV6NU1raUp3QnNkeUxpTlJBbGJw?=
 =?utf-8?B?aGVWM1ZhSlBuelNJRnc3V2tkZW9Bdlk3K0k4Q2hiSkovckpKN090WnVNRFBt?=
 =?utf-8?B?M0RGQlJzaGM5S2lFMzZGU25zRHAvd2xzaUlOZVBadWVKSnhuOHF1dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cce38406-804b-46ed-c6a8-08da1c650369
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 09:15:40.3384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hB14Dj8Jz9NOFSs3JVZ5+b+jot8WLCAvC3kd3Fx6x//Di+kqaZC3Ez1F5UI0ViId
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3979
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
Cc: David Airlie <airlied@linux.ie>, krastevm@vmware.com,
 Huang Rui <ray.huang@amd.com>, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Zack,

Reviewed-by: Christian König <christian.koenig@amd.com> for the entire 
series.

One nit pick is that I want to get rid of using ttm_manager_type() in 
drivers and use pointers to the members directly. But that's something 
for a later cleanup anyway.

Thanks,
Christian.

Am 12.04.22 um 05:35 schrieb Zack Rusin:
> From: Zack Rusin <zackr@vmware.com>
>
> v2: Switch to using ttm_resource_manager's directly in the debugfs
> callbacks
>
> This series introduces generic TTM resource manager debugfs helpers and
> refactors TTM drivers which have been using hand rolled out versions
> of those to use the new code.
>
> Zack Rusin (5):
>    drm/ttm: Add common debugfs code for resource managers
>    drm/vmwgfx: Add debugfs entries for various ttm resource managers
>    drm/amdgpu: Use TTM builtin resource manager debugfs code
>    drm/qxl: Use TTM builtin resource manager debugfs code
>    drm/radeon: Use TTM builtin resource manager debugfs code
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 86 +++++--------------------
>   drivers/gpu/drm/qxl/qxl_ttm.c           | 39 ++---------
>   drivers/gpu/drm/radeon/radeon_ttm.c     | 36 ++---------
>   drivers/gpu/drm/ttm/ttm_resource.c      | 34 ++++++++++
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     | 18 ++++++
>   include/drm/ttm/ttm_resource.h          |  4 ++
>   6 files changed, 84 insertions(+), 133 deletions(-)
>

