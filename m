Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8B379AA91
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 19:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C07810E349;
	Mon, 11 Sep 2023 17:21:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5034910E344;
 Mon, 11 Sep 2023 17:21:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f46+Vu3fNxkL7pI3mPyvp5CswNAY9DaTTUdrXFh3kPlOYfRRDjEs3KtWffSIPQKx9IkebiJYeNrTNR3Yzm5rSNZ3fSVOSLMZI3/ifRU3Zb4O0u6EBq1GDRm15J3xGptgClhe28uvNdC+X79VKSL26II36lJ30YRLothiaczAPVpt9fxQdiZ1CC9U8xfOGT6DKkazpAhkUd28Aa6iFhK5WbBT6g8Izch0G4mt5FEGrKcbt+/4MLhMSC0zpK3TkpTIG7F9yQ/TI/AzBT6MmFPhxPmFGI2FGChcaM/kltt1A4IvLYNMzwgrOpHAkYRprax0eubKcac09AWiBaZaTGXOtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFK7OJBthj5dAki9GUihy84Ufw4F7nHomrbcqfNCKJc=;
 b=is749f0XDLlnt0lsqB43gDMO7932DQXRLH7pxIBcFJ7a2XXcT4MTapvH0o38s8enVHc5yN9RNhOVa686+OugTTTrHiFIVoQr2QO7TXccZkw2iJlfVwMJGJdG6/gTPXpnk66aHc4SwP5larH7auDXylDgE5mwntNHgTh4lbjFaemaOB8qxBclB87o2pc1YAxVC9+CtV3Zs91UlKLlcdwZw7kfkDHTt/BGPwWqszTdtj3yyWHKieS0eBRTQ+o2bOShOM7UqcU11zM8U9rCFnm0iuWlMRnByUsxyVfGoaFj6RTTvE0VqtIkz+O/dXQ0jQopVuxihhgU+jMzo4fKiXmYCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFK7OJBthj5dAki9GUihy84Ufw4F7nHomrbcqfNCKJc=;
 b=k/13Cn5jMvNPRjG2wDtVHP9p386XRqvqesIWl0Om4/7DWg7OaL3C2tHATkqi0Sxc1FHFwjx9Fmj8fLid8mi/os0Rdw6ZukxICXicI8mypJGLx/PG+W+Q8YfjLuB3zK4Ka11HfT1qKB0egan4BEndsU7BSxaZjN7QckNTnOiQijY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 MN6PR12MB8544.namprd12.prod.outlook.com (2603:10b6:208:47f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 17:21:24 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::4196:c9c9:dfe9:8079]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::4196:c9c9:dfe9:8079%3]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 17:21:24 +0000
Message-ID: <41963d55-3fa8-4415-911c-99e35acb829e@amd.com>
Date: Mon, 11 Sep 2023 13:21:21 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Merge all debug module parameters
Content-Language: en-US
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230911171255.143992-1-andrealmeid@igalia.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230911171255.143992-1-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXPR0101CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::41) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|MN6PR12MB8544:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b4ad606-fdef-4e18-a869-08dbb2eb864f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: csRKdPiLhk8mnuxKn3sbl/YjhS3Nv4heIhn82w25GiYvzFN7jSj3b6U86KbRKxRRzbe7n4Acg+hij1pHCrK0JgHCbIPEfAu17FyW1QvIIuOfy6KC4gRC5/EH4ZTnhkXyIw5WiplXU9kEAbrhGT+ScNMXJg/ec0xQGRVi40ZafuzLgbgbzWnfoF1fFGmwho9nAvnXfChJN5AdNqa8Z5z+la/eE4T3Z4D6r61DdZLRPaYogFaqnAdCmy+powaR6Y2NOKZxhbPZqgoIaIW/kl+G0HmWNCD9brjnGS1T0N7+V1CJukGixaIudqGJaHovm8XIKC+ePBJtnuzrY8n9uRkyGroMpXlwp4pQY13FdTzh36c1IVUCEYNqPA+Rix5wznGzZLqozhzZW7MzkH6Ytn4VcJACvqMR2wSVICRBcb8nyvKbGS4dV0kArZflqGZOu5aG3GUPrJQ46owpHULQZyuHOKW9vayK6+sXbAZcz94DMB/8PEE8E/49b7Q7Yvo4FMqKx3DxF3gK1ciOwwN0YcpU0K3sT6AGx1udYdziiO2xD/2NbJpC/ddARBw4lGewImvPFsFJy+oHB6+4SWOsAscyZvRyie659ZgZJovEr10P4xf2S7ktAOYr+/myOuZxLTM7RJW+X8Flz+rhEn1Wrt5NeVddSV0rXFZMtpAi8iq+6sQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(136003)(376002)(396003)(1800799009)(186009)(451199024)(2906002)(86362001)(31696002)(2616005)(6666004)(6506007)(53546011)(6512007)(6486002)(26005)(36756003)(38100700002)(83380400001)(478600001)(966005)(316002)(44832011)(4326008)(41300700001)(5660300002)(8936002)(31686004)(66476007)(66556008)(66946007)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUovMkI5a3V1NHZFQ1FCeG5KWkdzL054NS91dlFhaXc4YXRmTUNZYktjbGVi?=
 =?utf-8?B?OU8zWVJIS0ovU3gvV2Qwd1JSYXptOFEyNW1lOUV3U0V0dVdVUWdRdW1JdVpo?=
 =?utf-8?B?V1RRQVBoOUhSSlZzNkp3dzBvSTVSRTJCTmhKUTdCSDVPTkRXSDJJTFd2bVVi?=
 =?utf-8?B?WUROQ3lUVVFpdDZCY09tYzNqYVQ0V0pBclJXVFkzRUIxSkRUcDVnVnhqVTZ1?=
 =?utf-8?B?U0t4bU1XWVVlWmU5enFRb3JsVXErdHFnUGZLTUVpUXZHODFkMVZPaTgvRDhj?=
 =?utf-8?B?WXZYc3libGZsN0t1d052dDh2NTlCQ3kzU0UzODVkcGpMbjM4VWlCRVpsR2xL?=
 =?utf-8?B?aE1BcVU2bXZybEhtdXhCYkRUby9PMWVIMExJaUxxd2hGZXQ3SVR3aWFHQzBR?=
 =?utf-8?B?U0tNQkR5UWplWDVmcEpTTCsxT0l6MExURHR4RUxpRkFqTTlkZlIvSFY2Qjho?=
 =?utf-8?B?QzBVL3VvRTlUczZ3WXhQWjZOdmMvbFlNNDVNdzMwTWt6RjE2RnJQdzhjL2cr?=
 =?utf-8?B?MVNrdDdBaHVweWpuMExpOW40SkVIMWFDQkdzcDRWSTNBVDNXSHdhbnVwUHVj?=
 =?utf-8?B?SDZHeFhUMGRPVTc1cUIrbjhLbjN0SDhPR0dhem1rWGhzZGZubDRYUGxqUS9G?=
 =?utf-8?B?TW52bHdXZUw5YlNRbDlwazBCTDZOYkJNVmVuV0kwVTBiSzVxNXgxTzFPN2tL?=
 =?utf-8?B?eldJUGJlRW9mM2RnT1JqMlQ0RkMyaG9nNDQ1UFdhM3lOcGVlTlVnTEVYY0Qv?=
 =?utf-8?B?WGlBblJmdHo3b1JvUG95T1kzdjk5SlZ5OHR2UGNVbUlVUGMwN0RPK01ISi9W?=
 =?utf-8?B?U1B5Q1JiVzMxbkFYVVlqRFpUekxKZDh4R1FPVFVwd3J1anc0WktMVHV0Ny9B?=
 =?utf-8?B?TXZTdnhTNFpWaEVzdGJrRXplVWVreWEwN2d5TmUxYW5lU2pYNFVrYVFsZCt0?=
 =?utf-8?B?THJqNzhLU05oREdCT2NOeDUwVHFEUnVDL3hsYUlnb25aTFJlOG5YbEJ5c0gy?=
 =?utf-8?B?NkM1V0hQNG4vaUZOdkZoRlZhb0FINzBYTlozVEE4dlpXUDNnbTUxVUdKejN6?=
 =?utf-8?B?V3JoeDFWS3VoUmhabGdUZ2tyYy9tZU91S1RaRUUwVDNiNUFrUm8vT0pCQlhz?=
 =?utf-8?B?dzJLMTZZMHFUL1Q2NWs5S3pGd2ZkVDFkNFRpT0U2eGFUdThIS0ZmV0RhSFNT?=
 =?utf-8?B?Y1NiQi9ONjZPSFdYMnZRMjUvcnFLbkM3b1JFMFN3Z2xZSXFhU1lGdDBvV01m?=
 =?utf-8?B?OUR2V2pxR21nbS92ejc2aXVsd1FTS1Nua2NEYkEvTDZMVXpZMFRBS3o0ZHNn?=
 =?utf-8?B?T1pydVNRa20zaFk0ZTMyNFR2S3dZSHp2THFwSHhVcnJ5clltcGxRTnJISHpp?=
 =?utf-8?B?bWJFSWRmTnlWd1pkVXpYZXdkZ0JnLzcxc2JNTzFISXY3emh2RnNkRFltMUt2?=
 =?utf-8?B?T0JGTzljRnVLVyszaW1Oa2REZU9PMFRaRFlYWU5jZ1JwOG1WTWpyT08vcTdp?=
 =?utf-8?B?clZNNmphdFFhSkR0ZlphUFZOYWl5MkZnai9ORWNKWThBaS9nc2dlUFByTk9I?=
 =?utf-8?B?Smk5QTdqK3p2WDNJUmVBblZXY2R6SWRDNE5CaHNCUDlYUUp2ZDZOS3JBOTRE?=
 =?utf-8?B?ZTNYVS9WL0duWFRaM0xNU2QvZ0NmcTExQ1N5VHpFdGVjWUlRZzZjUDRETi9v?=
 =?utf-8?B?TTJQa0xrWWxNWDU0UEpQakNEZFdoZkpLbmdPRTBsWU1SSUVoNjkyR1BMKzQx?=
 =?utf-8?B?NnpHY3VTYnAwaFk3cnRpWnYwMnJWR0ZvTDJ3bDlFNU9EQzBRMUVPTWdnYW81?=
 =?utf-8?B?WnhHd2Q4VFVteFpmVXdRbEY3T0Q3TWwvK3dOTTc2M2xhM091NW40UDdrK0Rj?=
 =?utf-8?B?ZFFuQ09kcDNWRDR0MVY2cjBaeHc5Y3F1OUZvb0dpYjU0N3pYaDVveHBOenJu?=
 =?utf-8?B?NUcvMjBiNXlLUUhtci8zeE8zaHlRcFJYeXY5SXJJWFhFNFQvaG5oN1VyUVF1?=
 =?utf-8?B?UzN0ZTZWVG5mTFoyV1Vscld0R0I2bUpxaU5WQTF5Z2VrenhjcEI1N0FTVDBk?=
 =?utf-8?B?RE1OZDFjTkhhZWRsVElqN2ZRMzVDVVg2ZVlTSWNkS09kdmlFNVp4ZitudWNO?=
 =?utf-8?Q?JoGEK9EOchfTeqg4N/jDhvOe/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b4ad606-fdef-4e18-a869-08dbb2eb864f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 17:21:24.5086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1iXeCe/M2SPdJF02CYiWtNfZXn+Cboug4yw6jTnpwBSiyK9v3lslPtjxkeaHvsr/uM3Fz66OiQYDRGEv+AE6HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8544
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
Cc: alexander.deucher@amd.com, pierre-eric.pelloux-prayer@amd.com,
 christian.koenig@amd.com, kernel-dev@igalia.com,
 Shashank Sharma <shashank.sharma@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/11/23 13:12, André Almeida wrote:
> As suggested by Christian at [0], this patchset merges all debug modules
> parameters and creates a new one for disabling soft recovery:
> 
>> Maybe we can overload the amdgpu_gpu_recovery module option with this.
>> Or even better merge all the developer module parameter into a
>> amdgpu_debug option. This way it should be pretty obvious that this
>> isn't meant to be used by someone who doesn't know how to use it.
> 
> [0] https://lore.kernel.org/dri-devel/55f69184-1aa2-55d6-4a10-1560d75c7324@amd.com/

I have applied the series, thanks!

> 
> Changelog:
> - rebased on top of current amd-staging-drm-next
> v3: https://lore.kernel.org/lkml/20230831152903.521404-1-andrealmeid@igalia.com
> 
> - move enum from include/amd_shared.h to amdgpu/amdgpu_drv.c
> v2: https://lore.kernel.org/lkml/20230830220808.421935-1-andrealmeid@igalia.com/
> 
> - drop old module params
> - use BIT() macros
> - replace global var with adev-> vars
> v1: https://lore.kernel.org/lkml/20230824162505.173399-1-andrealmeid@igalia.com/
> 
> André Almeida (2):
>    drm/amdgpu: Merge debug module parameters
>    drm/amdgpu: Create an option to disable soft recovery
> 
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h      |  5 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  | 63 ++++++++++++++++--------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c  |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c |  7 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c   |  2 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  2 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_crat.c    |  2 +-
>   8 files changed, 59 insertions(+), 26 deletions(-)
> 
-- 
Hamza

