Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A7C70FECA
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 21:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413D510E55A;
	Wed, 24 May 2023 19:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 420A610E512;
 Wed, 24 May 2023 19:54:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z2ynbsik3ckD3oF/3xbjECpiLE0JZxGiE8Tz60Q0M3LoeMJupiDnOCXc4+3q6D8hsnLiF997KM0VI2FQaDJQry3V4P4zNBWTZzPINkNBF/uxQqIXsSgz168Cux8yoooF1oz4jf1dlqxQtpF6wbsUwk4Bj2T1h/bxvH0k8DsBdh9aUaTeQrHHO3aI7tCvnTBQiQapf5kJW2fniaowYudPmZz7k/UmKQMtRwUGz3y7BeepiNTeYW+DxA8AW/XCVeX3FNG9dDy92A98Ax43ckMU0RONLAUMFP+QZ2xMpbLGEV/tqpk5cmHGEdZyFjknxQ4JBO1Wc78RKr7mtuXiWmcSfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DBy4hkKkYYc46rwmrB0Zq8fOStlHxqBV5FAV7pgOPjU=;
 b=K1zbLBgdPuLaIpbDkkUrs9hOUgVdaIhb/8M7h/4y2/7pstt2+y2PWtvFXiriRpjn5gxYBwqXoa4CBin/Dd1faACAK+IiT0N/nLFhzDvFR1iKLjM8ZUUTEWU2E/2JSZTBUUkoDDnbP2+4iZTB2FnFWSsLVe7DQJQOA4AxbFRfEfLPkAIhwGfygI1Mu7jKNynB/L2OZomjz05m0ASMEr65Tm1UrAAiQNtrEZpcstbugItcquLuhF8WUKt4UQU8lrOSocszSKNxVMAi4TmuV29gOh2Qw7pZysabWtVjk6dizPjcWyvQnyQoxAd2cugQaEkq9OiI0YXJqKYO+SbZXEZ9Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBy4hkKkYYc46rwmrB0Zq8fOStlHxqBV5FAV7pgOPjU=;
 b=ppcCCW4JJryKaJWep50itxwuRqKajDsta37PCWMKj/J9lTJlpVH6sZMubZILAjOozbYBotxCLWn9hRO5qllbY4WnGBybcw+GLi0V3rOh3UCefCC7UC23o7jryTincnMuAbV5r5Moo50eif1aI8fByu9E1+ovpymKFo0hNQRrwB8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by IA1PR12MB6353.namprd12.prod.outlook.com (2603:10b6:208:3e3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 19:54:31 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c%7]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 19:54:31 +0000
Message-ID: <f8cd7bc5-86c7-f113-f7a1-aec4bbf4aeb3@amd.com>
Date: Wed, 24 May 2023 15:54:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/amd/display: enable more strict compile checks
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, Alex Deucher <alexdeucher@gmail.com>
References: <20230524191955.252212-1-hamza.mahfooz@amd.com>
 <CADnq5_Mz6aPFYGnr8J8C8UeTpbo7JDg+uvjqAxo7o4vmTGej2A@mail.gmail.com>
 <cede79cd-4986-ce3c-ab74-a4497e9e1230@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <cede79cd-4986-ce3c-ab74-a4497e9e1230@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0045.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::17) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|IA1PR12MB6353:EE_
X-MS-Office365-Filtering-Correlation-Id: e240c499-eae0-4746-d216-08db5c90b087
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nw7COPVcgo1nItaMUFd5lr1uXf4xWGI9hodGItEtFiCY/vvEJaf5wlzrrQUOgGS5zK3y0qMlAycs+/2dhrYLiPfJZ18JHBs70KUdP5WiWPOpFllSTshXBbziapGovWuV+P51K8hou9EaPX8CNTrqmiYwshHi/vRfYPvtrrz40ikf/z2UgyC7YZqHcWMhTZUjVXav3VRUMbcAePM6SucZ213KhdsT9iY+4MYXlx/s5+agKLZ0pW0t/H3phskbiu0hUEGfOyH6pl3gd4ikNc87OTdua+hbN0xSfkzraZpZRFlaYY0xvjIeGNiNuYSSi53C+d6Suxd0PLFI/rbI8j1NHHjyNOVg64zBatxCtqnonsD1Jg+J7w1ZORmgM2yIRjWhtGk++wWvFgnBENk0KzShnz+mkp6C6s5ihvGBczb6uoAarRPy7hNqnmpJBHuJzSWlJunZR+EOfeC5K/i7WLTdcb1olvwp6ZeGhwh+636FgwkU5yKJGm0NLx3AvospbvAHg0bwjidS+cc0HruP2LXqdj4spAMDvb+e/odmSXvfGqdABYFhwItdt/za8EAGlks7qYu/+DwspyGrgI37YTJcI9JWrwNwEd6DqY8otRW/8Df9zRAJ7sG5QtdKsY8KtrU5uih4k8q+XnwZL1aiOI/Shg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199021)(66946007)(66476007)(316002)(4326008)(66556008)(5660300002)(53546011)(26005)(186003)(6512007)(6506007)(41300700001)(6666004)(6486002)(38100700002)(36756003)(478600001)(110136005)(54906003)(83380400001)(31696002)(2616005)(2906002)(44832011)(8936002)(8676002)(31686004)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHRzVllkYzlHczNWQTVURHdSaFRQcUh6Y25XOUU5Mk9yVFhiVU9QNUtxMEpi?=
 =?utf-8?B?TmRFTFExelVmbHEyL2lLdkJGOERZNUx5MFJrTmpyaHpucmg0YlVjTmlQVUVx?=
 =?utf-8?B?VGppNHcycGhvQ2dwTHdVQkdMQlh3K3hEU1VMZG9oZmVyd1RmYWtxeU1DbFEv?=
 =?utf-8?B?MmpreWdMUi90dTBvdjFrTEtOYVkxZFZ4WTZQOXN0K0JyRmpPVDlJbm5WU2lR?=
 =?utf-8?B?bEJjdU5JMGRNUjZtVEozY3p6YVpjV2poQTNYeEsvc2xXa0JRTGxsSzVmSmF5?=
 =?utf-8?B?dDBPK0d6VkxWd1lnVldNcTFRYnNKZ0JQRVRycU1IdUdCTEV4MUttcS9pZWtI?=
 =?utf-8?B?MVBhV1NwNWRtT1Y2M3prUU1ydHpyVHdsSlJZVkUwa2NHUm96UEN1c2FuVWkr?=
 =?utf-8?B?WmJQU20xN3pkbHNIa25uKzJXWGM0T3pUaW9wQXoxdVZkY3JoS0MyN2c2ZGdV?=
 =?utf-8?B?TmJKQ2d3azUvbGdkZ1pDckplVVYxRTQ2TEtiRTZYd3RVd1F0dEIrNVhXbkMr?=
 =?utf-8?B?OS9NSFJCUmtselZYZTZWK3U0Nk9ObTV4NXpmNjZyTzBiQVZIMjVoSi8vQjBQ?=
 =?utf-8?B?cG1kalpOK1BadWJSQmVXS0ZFT2ZUWExLOWVBTTFKSWJSNkdubms4bU4xL2V5?=
 =?utf-8?B?RDhHSWUyK0hpQXZEZU0wOENiRHArSG9iL2pzSFp5R3NnWUNJQUFLekswbEVk?=
 =?utf-8?B?RVo5bk1kOEcraHZYL0V4cTZvK3Y2SmJqVDJ3TFBJWnAzMWFmZEpNalNkbU96?=
 =?utf-8?B?eit3VWJEZGV1KzEyNEN3NlUrQUpFelR1dmhZS1lPMHFmOHlUNkhCOU5Ia2tI?=
 =?utf-8?B?M0d1WDBXblIvbHd4MGJWNUF4OHYrSUxNUE5CQ0N4RHFpc0VKb2NZWFZQNDdw?=
 =?utf-8?B?cXZLbHdzaEtLdjhxS2VtSjUwTlRoL0MrR1l5Um9JSWp0VS92OERyWGd3KzBN?=
 =?utf-8?B?YWpHNDMwUTkraHhJR2IrWHpKWUlna3FTakx1SFplNDBiRnVFVVRBdmVEci9w?=
 =?utf-8?B?WWZxTlFhdm1JQlRrMk04Z0JLek83UTRvckdxZFJQcEV6c09xNTg5Nmc3TEFT?=
 =?utf-8?B?QitrcktMMFQ2NWJZb0dFeXRmTFlLUkJTUmtXeW45MDdRY1c0VS9kZUdZVkNm?=
 =?utf-8?B?Z3J6eU8xUU84NGNyUnc4Ym1tZ0RTMFlhckVNSGVURWFGMTliVm8yb1hXN0cv?=
 =?utf-8?B?YmxnNHV5VDZjazNjT1IrbUZNSkVaUnJ1b0F5THBBSkRDQXMwdHQrL1FqVUIz?=
 =?utf-8?B?bUVQcDlpM09haG9lb3VkYXpzd3liNVNPclVFbkhLUnNoQXJPeGZ0U3dkbWZu?=
 =?utf-8?B?ZjZlbzA2alNpOG5YeWpoL1JOak4ydEpYQjdkdGJwNG1DTmM4N1hTV3VmSFdH?=
 =?utf-8?B?ZTFSdld6WkpXem9saUpKTDNBTlFidTJGT0VZNy9ZVHZsUjlST0tEMFJwTm9I?=
 =?utf-8?B?dXl2akRsUm9qTy9oMTQ3cFMyOWE1U0h3UTJnNmZyK1RreEM2RUFLSjFLbUNT?=
 =?utf-8?B?QkpIRnFNYm9pdFNVVkoxclhZY2RnQW5wMzhyNzNBdkFvYzI5TE9NTDM4bUJt?=
 =?utf-8?B?QzhjR0M1ZnJPSmQ4TjFFNGxCUklURGo3aHNzRGhPQkRsVUpnek5iVTBaR01s?=
 =?utf-8?B?bVluZHd3ZDVQUHBKWWtJRG1ScDBvbVFSSklNZHRhanI3T09nYnZldGQ0R2Zi?=
 =?utf-8?B?REJ4c2dySjhUUERFTFU5NkI4UEZoQzlYVFBpTXd2cys1aWkzU1NRS0FDTndp?=
 =?utf-8?B?dTBJSXdOMDdSRy9tTnV2Y2FpT2Y4eDR2NTdDVWVBM2hvWUVrVWU4Zk9Cbm1i?=
 =?utf-8?B?VkVhRHJDYUZ4YjRxWVdKOURIK1JsZGZMTVdIdG15TmprNWQwMXlscTlCSENu?=
 =?utf-8?B?aEdtVjVmcDVJSWFLOWhub1AzVXRNd29LSS9MQWdVS2dvWGw1VThvMk9DWHVE?=
 =?utf-8?B?Z2tnYkVqUjZuV3JQbEd4c001L0VjMEppVWxUYURDb29qTGkwcDMyV2RYV1pR?=
 =?utf-8?B?ZGUwdHYxK2dtUjczN2NYeThKdUFhV3JaWE5LT0l0eVlUVFJKN0JwcFZVU2hZ?=
 =?utf-8?B?VzVWTkovWUZyc29vQjJndUsxMzhFR0N1ZjRqaXBFVHBzUEZFU3Y2WTBib0RI?=
 =?utf-8?Q?QmoX7vYKqXVLNz3KFLGGMiRXy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e240c499-eae0-4746-d216-08db5c90b087
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 19:54:31.1700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3CQPq8nR0hp5PAJhIfhhpRXMxDlGosqCrt7V7GZ6Pxm3k9kR09ajn+15KTAa/5JzbOucZ92cyGaZ3Eg0+3MkQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6353
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
Cc: Leo Li <sunpeng.li@amd.com>, Kenny Ho <kenny.ho@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/24/23 15:27, Hamza Mahfooz wrote:
> On 5/24/23 15:22, Alex Deucher wrote:
>> On Wed, May 24, 2023 at 3:20 PM Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
>>>
>>> Currently, there are quite a number of issues that are quite easy for
>>> the CI to catch, that slip through the cracks. Among them, there are
>>> unused variable and indentation issues. Also, we should consider all
>>> warnings to be compile errors, since the community will eventually end
>>> up complaining about them. So, enable -Werror, -Wunused and
>>> -Wmisleading-indentation for all kernel builds.
>>>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: Harry Wentland <harry.wentland@amd.com>
>>> Cc: Kenny Ho <kenny.ho@amd.com>
>>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>>> ---
>>> v2: fix grammatical error
>>> ---
>>>   drivers/gpu/drm/amd/display/Makefile | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/Makefile b/drivers/gpu/drm/amd/display/Makefile
>>> index 0d610cb376bb..3c44162ebe21 100644
>>> --- a/drivers/gpu/drm/amd/display/Makefile
>>> +++ b/drivers/gpu/drm/amd/display/Makefile
>>> @@ -26,6 +26,8 @@
>>>
>>>   AMDDALPATH = $(RELATIVE_AMD_DISPLAY_PATH)
>>>
>>> +subdir-ccflags-y += -Werror -Wunused -Wmisleading-indentation
>>> +
>>
>> Care to enable this for the rest of amdgpu as well?  Or send out an
>> additional patch to do that?  Either way:
>> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> 
> As far as I can tell, if `CONFIG_DRM_AMD_DC` is set it will run these
> checks on at least the base driver code.
> 

It's probable best to put that into amdgpu/Makefile in that case.

Harry

>>
>> Alex
>>
>>>   subdir-ccflags-y += -I$(FULL_AMD_DISPLAY_PATH)/dc/inc/
>>>   subdir-ccflags-y += -I$(FULL_AMD_DISPLAY_PATH)/dc/inc/hw
>>>   subdir-ccflags-y += -I$(FULL_AMD_DISPLAY_PATH)/dc/clk_mgr
>>> -- 
>>> 2.40.1
>>>

