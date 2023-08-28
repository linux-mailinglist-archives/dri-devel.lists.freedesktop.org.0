Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2F478B94A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 22:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDBDC10E343;
	Mon, 28 Aug 2023 20:14:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CFC10E0E4;
 Mon, 28 Aug 2023 20:14:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGZOQchQdf6s0fqMxRW06NAWlq5jzXk/ruJz9VC4iXrjeTJK1i3Ht01tYEDFAdVlzqdAqfbdPxYXNvIqWhDOAbnzis1X0pnDmmA8vZ6w98tkh2S4ibNGskHNmqAlQpWlT4oRblMMEheAisalXL6z9FnxyMk6Dilvz2NFs5u5dG4UKafCQgTq9KisIUEV5P+syCvUpDyg+5wj5ALCi0faIJmVPEIP6tZgkUBBxO0qv4CTy4gQZnY/wCfPrIAbl/QZB5lkSK8E5xWMfWy/dv0Miw7N+qnZYNIZ8LdifPaxXPAh1KmACT4zSAIsp3JG10LnIHgMxOiFhHqlNmFxiFYubg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=stTcgg78PNgCxfk7UEr1RdozqtSKuYByNhoW1LB2EBc=;
 b=WIgYKZZIvrzRgT9u0IMXqvwuTvJPU0zVdW2XWFgftia+exvHZfQWN0cwSDIQIaRJl8TiGP2b8tAZGRBoOggMGprO+hByWxus3nP4cilgKlZpe4fHLe4+ezbY49Zma3rMjREgH+FC++c/zTJxJ5ZsiUN/sOlHCk2vuizwzHfpU3BPZty4PO4YTRq9D+VtbHuvqLvzI051/LFbnMWntJ0mbm7uHBQFnC4Lz+s9lM1IIQn9wmguHRJ1SZd2G9gWkZsD3M71mnDLAtqn5VZ7fvwnDI9hkev5i/zDWrMJrHbsyoP7RBf4YPSKcMZJQoRTCZRZrWVFLc+lPYIHPnnp2lW/nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stTcgg78PNgCxfk7UEr1RdozqtSKuYByNhoW1LB2EBc=;
 b=AmkVzD0cWU9iTwYOgs2Hx8rmCjpym4VzhyU2yMQ3neEP+fnS9hfus3Uo7XAuDIPKPrm1RTvnyPnw3P3uonTXsjvrshJ14GIXiye+kO1lBs/AMEoYxv8Y0qiWQc/4tveZyQ1ONwer2qLXdyby5d7VG7dDy2+4gOxWjIzsVtdwn7Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 by DM4PR12MB5358.namprd12.prod.outlook.com (2603:10b6:5:39c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 20:14:37 +0000
Received: from PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4]) by PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4%7]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 20:14:37 +0000
Message-ID: <b9452015-0284-3ede-973c-ced26ef18d2a@amd.com>
Date: Tue, 29 Aug 2023 01:44:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 0/7] GPU workload hints for better performance
To: Helen Mae Koike Fornazier <helen.koike@collabora.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>
References: <7d09-64ecc080-1-3ebc5780@85497443>
Content-Language: en-US
From: "Yadav, Arvind" <arvyadav@amd.com>
In-Reply-To: <7d09-64ecc080-1-3ebc5780@85497443>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::24) To PH7PR12MB6000.namprd12.prod.outlook.com
 (2603:10b6:510:1dc::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6000:EE_|DM4PR12MB5358:EE_
X-MS-Office365-Filtering-Correlation-Id: 52a34194-9e0e-4ff2-9f77-08dba80366d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nBm53cQSZW++Xb+GPkCkmsKEtAvKfW56iYkUIKPDRDtrHxDSZmtpbJUJbUI2+tXyEFeZq//pz6kxW8R/CrLVRQU5uSE/k4uMaHDcmm1BGZpfAgBz1o6M1IOU0DfGagHubweRCZr+O4XvT8dokFj1n/ZkCUSouFpOwQkuD3rg6FiWuuwEpPUZ+3ARRGJXX/n/arl/gWDL2rDYgOJWi0zK7WwyQGSvFapAvcheRmsoLhcc4grn2r7DCAcDovpJfJNN8+5Lgf0D2iSexUUxdxr34i1xAHmJwUYmrl2IPMuZVV0NGIgKgz8JZpC//o4Bmp2ro2a1cNYQ/q6q+bb0w/hUMrG3oD+xwvepy1oV5qJM+w3O9lrYYMoSmyzj1dAcHi3MC7X63WfIBUloDnyuVyY9tv+Qd3Po5ceKvCmiSXSS0sz+cjaRRtwjc8DZgVXoQKXlF/MUVAid7PThWxVXTfDEOOzvsl2K6zBw4rouqB54zC5hCSRuRoKqHma5UWJ5mgzoQV6v+CK8VLIUgejFwja8Qmr4EZiTRdiffIwKqXnLReLMYjf+TfRadkB7QOcxhBa8StETvHSv0wHenDk0QfG5l72ZBrC2laZ3MOdtsCWpXH5ePeYb8GJK/7ShdS9i3O4t
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6000.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(376002)(396003)(136003)(1800799009)(186009)(451199024)(6512007)(6506007)(6486002)(6666004)(53546011)(966005)(478600001)(83380400001)(26005)(2906002)(6636002)(316002)(41300700001)(66556008)(66476007)(66946007)(110136005)(5660300002)(8936002)(8676002)(4326008)(2616005)(36756003)(38100700002)(31696002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFRRekVZc09NcU9EWjNtOU4yYjR6RWdkdlRubUdCVVIyYjJVUWxCdDRCY0tW?=
 =?utf-8?B?TENDVFdHZUlicEQwa3kwekRnRmczRG1sSEJrODRWY2ZvVUFkeG94QXJzSkZL?=
 =?utf-8?B?SG90NDJFR2NwdVFNZnYwQUlnMjdZUFB3cGc5QXlKdFpxcFdidm41bHVmSklr?=
 =?utf-8?B?TzdVZlRpbVZjc1VMZjdvTDNiWXE1UlI5YnZoLzdUSVZoNDdWdVhQYnhXSTdR?=
 =?utf-8?B?RTV2MFhQVEVPd3pYTk54RWY1aU8xZkVjNnlJcGRGek5tbGtkTzFKOVQzaEF4?=
 =?utf-8?B?dVZheStsL1pGbERMVFB5WWNMT0NOcFM5RytqaWt6ZGplL2tiRXlMOWpIcCt5?=
 =?utf-8?B?SXBRcTZPNk5KRXIxVlUvbFVkT0R2TzB0Z1RPS0puUzhhVzlYWWg5R0xsVjdo?=
 =?utf-8?B?QVEzbzJFSUY1eDQycXdlVE5MUEFlWExTZ2hLdkIrcXErU0VTZ3ZJcjl0bGgx?=
 =?utf-8?B?b3gveHpQVnJFVlB4UE9BS2J2UHdUelhjQzBKbm13MDlhWDNJOHJOZkdvUERE?=
 =?utf-8?B?SzEwbGlPdWN6UURZZXdRNFdvL1pxclR5QSszc2FMTDJEQWgxQkNBVmFlcEZX?=
 =?utf-8?B?Q0Vkd1dJRHJoeGZUcCtEV0ZHYlVUVE1WQjdjeWoyY0ZMWXdXamRVckQ0K1hC?=
 =?utf-8?B?aWdSMFozb2lJeStEdElIZ2RrNm51SVduNElVTGVXajhQMlB6aHpya0hZUS96?=
 =?utf-8?B?RklRb2VvN2hxRlNJbDY2M2doMEZRZ1pqMkNSZWtYTVB0M2FlNVJQako1Nkda?=
 =?utf-8?B?c3ZhZ2ZDUjFOY1pvZkdab0xFaHVETmR0VGZjZk9tU0dZNEpRTnIxSnJKbDhK?=
 =?utf-8?B?M010KzArRGZ6UVpkTFZZalVYcmJwUDZpdndXb3dMTXZaeXFJUkR6Zld6L080?=
 =?utf-8?B?TTJlWkVid1lvbFkwb3RDSzJGbWhoWEZyRmlDd0hLRGZkeTBCQndpb3g0TFRH?=
 =?utf-8?B?Z0h0ZktnL2NocXdmbUR3a3JvRXdlazZnM1A4N1ZEWnlCWUJZdzY2bmlFSlMw?=
 =?utf-8?B?VzE4Q3ZHV0FmTHBXSnIzbzh5YnduT25HN0tZYS81QVJRcUZHZ05XU0R6eENI?=
 =?utf-8?B?U0VtQ0RZNmhidU9BQ0dhZHA3NU5Pc1RUSXVVZTdaRGNEdnF5S0RyU3lRL2I5?=
 =?utf-8?B?YkRXbGVmcGg0SFFPY1FmeVhkM3dvQ0pWTkdnNFJCQkpyUUt3U2k5d2xEY0pZ?=
 =?utf-8?B?S1lyeHdybWszaHVtdjc5eDVSVUd1UHg3UGJTZVlTeHhFdjJUcGtXNFFEY2Rk?=
 =?utf-8?B?R0k0eHgxWkUrYUR0ekRTWFFVTlQ3eitpRjR0MnFhM1htYVdOak9ucVFKUVVz?=
 =?utf-8?B?VndFVnhRUnRBY2NCQkZXMVZ3LzJJNjh4c0xqajViRGpWbUpxc2oxMUpKUWN4?=
 =?utf-8?B?cFpZM1lsR2NOalpsM3l0WExrc0lpWUpWalMvZ3VVRjFGcXpNdUtrdFVLVHZX?=
 =?utf-8?B?YXRaZ25kNzJPNmlvZ1cyS1VVUkovUFNrSFA4MjNOcnhTOEdzWGpucUl0bkhE?=
 =?utf-8?B?N2RaaHFaS2RRS2wyZ1hWRmc1R3F0UkY4Y1dFOEdxMGNvazNIY2pIb09uaW1M?=
 =?utf-8?B?MXl6RWRHWGdTTmZ6L2F6bmI4TWp1bG01alhCRGg3cEFFcXFsNm8rNHhWU3Bx?=
 =?utf-8?B?bXdERlVSNUNuRCtTU2czdXZieXVGY1ZNajd0bzB6S0VtQmtaYkJnTlFaMGlS?=
 =?utf-8?B?NDRPQnFFRUVWbXk1emhNcnpNK2I1ZXI2eGU2MlZETE1hUXpyeU5kVE9ldXBB?=
 =?utf-8?B?MUg1LzFxa1ZiaWQrWUdja29QT2RRbG5FWU9UakdORlNEbXBCZk1mY3VDL1Vn?=
 =?utf-8?B?Y1RpU0padFVGdlNsOW01WkFGVnVQUkNkYTBINitETXVyaUZXQVIzSWFJRk1M?=
 =?utf-8?B?a2dnUGtEcVc0SjB0NXV2WWR6V1RzNzZCdDA4NzN4Z0pBbUNYbkQrV3hETmJo?=
 =?utf-8?B?RmhWUnBmak1LekZUT2UybHpYOTBQMG8vd1NDRE0zZFFNZWRVODNjWUFseWRV?=
 =?utf-8?B?V0p0M2dyRWFsLzhQOUZiNW9GeWtVc2ZFTHdJY1hGejdYS3FXVWxlU3N4cnJn?=
 =?utf-8?B?U3JzUVJ0TUo5NU5JcVdxNVlIeWQxU21OYlV2RTdCT2d6OHFhZ0tsaVNBeXI0?=
 =?utf-8?Q?DLeIMWfP3zg8LrZCxK9yiJjO7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52a34194-9e0e-4ff2-9f77-08dba80366d1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6000.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 20:14:37.1355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HwrAoXt0eWhFCycvGKBm6KL1NuK5tb33AEQCm69z24YhNhaiSrfjVBw2jMJibGt1BiccmqgcJ+rnYl088EYr+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5358
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
Cc: shashank.sharma@amd.com, Felix.Kuehling@amd.com, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 Christian.Koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/28/2023 9:13 PM, Helen Mae Koike Fornazier wrote:
> On Monday, August 28, 2023 09:26 -03, Arvind Yadav <Arvind.Yadav@amd.com> wrote:
>
>> AMDGPU SOCs supports dynamic workload based power profiles, which can
>> provide fine-tuned performance for a particular type of workload.
>> This patch series adds an interface to set/reset these power profiles
>> based on the submitted job. The driver can dynamically switch
>> the power profiles based on submitted job. This can optimize the power
>> performance when the particular workload is on.
> Hi Arvind,
>
> Would you mind to test your patchset with drm-ci ? There is a amdgpu
> test there and I would love to get your feedback of the ci.
>
> You basically just need to apply the ci patch which is available on
> https://cgit.freedesktop.org/drm/drm/log/?h=topic/drm-ci
>
> There are instruction on the docs, but in short: to configure it, you push
> your branch to gitlab.freedesktop.org, go to the settings and change the
> CI/CD configuration file from .gitlab-ci.yml to drivers/gpu/drm/ci/gitlab-ci.yml,
> and you can trigger a pipeline on your branch to get tests running.
>
> (by the time of this writing, gitlab.fdo is under maintenance but should
> be up soonish).

Hi Helen,

I tried the steps as mentioned by you but looks like something is 
missing and build itself is failing.

https://gitlab.freedesktop.org/ArvindYadav/drm-next/-/commits/smu_workload

Regards,
~Arvind

> Thank you!
> Helen
>
>> v2:
>> - Splitting workload_profile_set and workload_profile_put
>>    into two separate patches.
>> - Addressed review comment.
>> - Added new suspend function.
>> - Added patch to switches the GPU workload mode for KFD.
>>
>> v3:
>> - Addressed all review comment.
>> - Changed the function name from *_set() to *_get().
>> - Now clearing all the profile in work handler.
>> - Added *_clear_all function to clear all the power profile.
>>
>>
>> Arvind Yadav (7):
>>    drm/amdgpu: Added init/fini functions for workload
>>    drm/amdgpu: Add new function to set GPU power profile
>>    drm/amdgpu: Add new function to put GPU power profile
>>    drm/amdgpu: Add suspend function to clear the GPU power profile.
>>    drm/amdgpu: Set/Reset GPU workload profile
>>    drm/amdgpu: switch workload context to/from compute
>>    Revert "drm/amd/amdgpu: switch on/off vcn power profile mode"
>>
>>   drivers/gpu/drm/amd/amdgpu/Makefile           |   2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   3 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |   8 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   6 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   5 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c       |  14 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 226 ++++++++++++++++++
>>   drivers/gpu/drm/amd/include/amdgpu_workload.h |  61 +++++
>>   8 files changed, 309 insertions(+), 16 deletions(-)
>>   create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>>   create mode 100644 drivers/gpu/drm/amd/include/amdgpu_workload.h
>>
>> -- 
>> 2.34.1
>>
