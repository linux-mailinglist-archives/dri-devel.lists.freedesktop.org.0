Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10073507C13
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 23:46:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5BA10E311;
	Tue, 19 Apr 2022 21:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2062.outbound.protection.outlook.com [40.107.102.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0F010E2DE;
 Tue, 19 Apr 2022 21:46:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8nMzh9f24UatHbWkvaymGnQ5+Nx54xkkP4YQJsqS6ymxeS+ni8NflLuo4p3MivbhHf1TdwXTpynWV7fJ1pj0EMkipT6Fat3NRg8CEdDHcgn8UQ/vuEQuuUBqQgIbSs1KMpxfY0OatMVw0d4D/fM6fcD0l/b6x1sSbZA1darQyhrUcSrAwRkQxwpUDvwVQytIWZkcRLD46ZxA3utv+MQ1/tro4n78NrfjHtbVa5dsZvA3Tourg4F5s4VqSFic3a5Iy+yrA5+thi8OwFQBaBIEMMkkz2cA3MQ4Dj3mn+qAoSfvBjlJM3gSXrFx0xoinFmIm24QpkqfOXpFFlDxC5WEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x76/HVNGwaEPk1S2vfmJ4+yfctlCvPVr0qD91IF1A+g=;
 b=cEJ/T//3RZ+Y2KDSCoHumvxA2uhCklFslpmPDyPT5rwSRR55ztfLm52wy8a8iBKxmDXfcdoqq8/Z/mMyQZslcQPQEtzS01jtGb61rsNqEmbcVq4Njzb5zjgVOFiUBE0A8ppxxk7LkP2nF6WtKOu01ENaq1BYOox2OTorH4MP4TGju3t6QPqxsUUtUKysX3gzCCQW5yIcyzTYgtUEmw3HFopr96V63AWL7haV4YI1ob5vRgjZU3zlJxA8VHY5U6OUGCDIVCrm9MJygzOMdT64cuozO9eN16xRf51w48u+vEddv4YD6i2WRhA+SURlpsyh8XOHNZIbmCpdCBjGeovbPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x76/HVNGwaEPk1S2vfmJ4+yfctlCvPVr0qD91IF1A+g=;
 b=UMLv/c9rRSrOXbktIXiF71t13n1faqkh6kq1pNHa7f7A648MItHcrrk2pohS+Az8E0VLcoPUvF9XuN7lUt5SkNKRKC8f0WfxUqROUOC5eXMpYfl9Z52n4aNH+isCXdxLeR7MV9Sd4fKP6mLUSCuaQDxTWbaPCKOfnZXGRR6Mvdw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4526.namprd12.prod.outlook.com (2603:10b6:806:98::23)
 by BN7PR12MB2706.namprd12.prod.outlook.com (2603:10b6:408:2a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 21:46:49 +0000
Received: from SA0PR12MB4526.namprd12.prod.outlook.com
 ([fe80::8515:3855:bed9:3f05]) by SA0PR12MB4526.namprd12.prod.outlook.com
 ([fe80::8515:3855:bed9:3f05%7]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 21:46:48 +0000
Content-Type: multipart/alternative;
 boundary="------------5n0qGmPKD74fZ2mQxp31uiy2"
Message-ID: <94fd858d-1792-9c05-b5c6-1b028427687d@amd.com>
Date: Tue, 19 Apr 2022 16:46:45 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCHv4] drm/amdgpu: disable ASPM on Intel Alder Lake based
 systems
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>, Alex Deucher <alexdeucher@gmail.com>
References: <20220412215000.897344-1-richard.gong@amd.com>
 <d4ba3998-34aa-86d2-bde9-bc6ae9d8d08d@molgen.mpg.de>
 <CADnq5_MgvcGPWf2gYn_3qCr+Gq1P39tvv-W-o8NhivvMpMwUBA@mail.gmail.com>
 <91e916e3-d793-b814-6cbf-abee0667f5f8@molgen.mpg.de>
From: "Gong, Richard" <richard.gong@amd.com>
In-Reply-To: <91e916e3-d793-b814-6cbf-abee0667f5f8@molgen.mpg.de>
X-ClientProxiedBy: CH0PR04CA0036.namprd04.prod.outlook.com
 (2603:10b6:610:77::11) To SA0PR12MB4526.namprd12.prod.outlook.com
 (2603:10b6:806:98::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08b44ec3-c077-4cca-e75d-08da224e1b2e
X-MS-TrafficTypeDiagnostic: BN7PR12MB2706:EE_
X-Microsoft-Antispam-PRVS: <BN7PR12MB27068DA4846759126C95F60495F29@BN7PR12MB2706.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 96jRxaGNg6eLNNUvpLmYAOF/pOarmIk3aXTOgqJmy88eSZbmjIQQW/12Veep16WNtI8AZEvLh16/qeyOcp8oEthSgPCymWVxQymISiOC6Ve4bmkTy5lyZ5JEQZNqDNzCCjhBjBcS/UbavaXt909LbpAOHOa1jQ1zzhHOyQdoQGhKNpHSXg8msv6/RYrpDItzf+s69NKd50cv62kVGiu8AuP3JKvALqB0TDU8xiMSI/AP9FCj7gbvFtV+sGCwJKY/Cg1lP7ONSdRHszdS1wRbfZqlTvq1Y6JQXt9eAzffkdwWS+JsWuRAJCtP4SO/3yuG6768XnXCxTPpuNetwkoUNRD5/COEVyq395rL4UUw2XkILat9VjUEojdD+nrG54Iz8YVoJq9kxpYPqGeWgDBNDN2en3cwvTC9Z8wvHseri/rSL5y6s7bjzv4FdA6W57tvs4ewdFxgXDEHuxRcpNkQVfQPrnxvWBvvJryyVxqaCToOJ9HXnZISEzTJNGRV/be2PEPyBdRw/SkhDjTbhU6V7iuXtRa/CsJ9baOPiQhNjZ7LvHpc/BhdRc1ZBSmOzTvE1N/XdHY68VaSV8QyLKXpx/NxFQNyaBguMKWkbxjf4UO3FbiXjyt9cANvjAaFuWhoDOglJVLFe6LKtwjtQS1vt1Yije4EfEUpbFgiabT2AB1EQvREJDnntHgAGKkIl67YXnzlwWpHNzIEUQfi9sYmAhjIKpejFq6x1oY+otBhDEiC0safLikUlBtwQ4KeUNqo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(83380400001)(33964004)(30864003)(110136005)(31696002)(53546011)(6486002)(966005)(4326008)(86362001)(31686004)(186003)(26005)(6512007)(6506007)(2906002)(66556008)(8676002)(66476007)(66946007)(508600001)(54906003)(316002)(36756003)(166002)(5660300002)(38100700002)(6666004)(8936002)(45080400002)(45980500001)(43740500002)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDJ1ZUR1NDQ2SHdPR09COWxPNzhqTzhNQVMrTDRZVVY0cVFPOEJCSEhaaHRJ?=
 =?utf-8?B?SzRZd09jczhoWWoxdkxhQk5ZTjZvZy8rRnoyR1VnRGRmZnBtTW5NWUlEY001?=
 =?utf-8?B?STNTMmJWYzRtVE1OY1BPRWR4Zk8xM2QrcWhCUmNlNkhvY0hCaVZyMkcvalpM?=
 =?utf-8?B?NUVsWWEwZEVFeWcwNEp5em1MTGZiNm1iWnQyMjdmd2wxRzhCTUdEd3VsZi9z?=
 =?utf-8?B?ZWgxRUsrbjV2WDNlQXB6R2ZGSkJEaUhyaEsxenFDeUpDM2Vab3F5ZFhPZzZk?=
 =?utf-8?B?Zy9wUmFaVzJQUlNVYmtNN2Yzd2hsQ3Ryd1NBVFgrR0FGYUhSZ0RoNnhkbUFH?=
 =?utf-8?B?ZHo1bmZadXhzNUg0bWRRSW1EOFgrT1ZWZWJiTG5LN0tsZ1JueU8wVG1Ud29F?=
 =?utf-8?B?OExjaVdOdFkrNnhUbHBtelFHd3lsM1lEdWs2dXZyV2Zna0Rtb0NvUVZPWnFW?=
 =?utf-8?B?VEpjeGc0bmVydkM4Y0YrWmVBZStick54eVRHV0thYUNvWWp4K1kxZVJ4Vk91?=
 =?utf-8?B?dDRFSjBxblZTOC9BQkgvVTc3NFVFbEFjSjY0MUVRdnBGc3A0dHF2NXFCeFA5?=
 =?utf-8?B?cXlNcmw2UG5ML0YxdnJoTDJaMTRwUjBXdmJ5ck8xYVVpSUxKTVVOVzFGMzlj?=
 =?utf-8?B?SDc3ZGNmYi9UME1tL3NwU3BpMUVUSjZEM21uUGlZWHZMZURvQXhGTGw2ZTNU?=
 =?utf-8?B?ZGl0a2RPbk5rVm5iUTAyb0tkVTlTUElnWVpUclFzOUdEaHFrdWpuZTFzb2R1?=
 =?utf-8?B?UEowU2VqdEZORzJ3MVpzQ1Y3aGZJWE5adjZEQWw0eTVBU2htLzc2bTZSUnJC?=
 =?utf-8?B?VzBxc1hLTk1BOWtmWFZIQTU1Tk9uRTk0RFFLejcvZ3FXWjRpN2svUUJzVjV1?=
 =?utf-8?B?aSt2UktyU3EvZHZVL1Y3Umg1WEpiQ0VnS2tLenBsNVcxdk5LZDMrdEdFcWpB?=
 =?utf-8?B?MFZPMzRQYWh4WDRUT2RlK01GUUM5UUsxYUVFQjhPN29ac1ljb0x3OW5adERJ?=
 =?utf-8?B?U20rUzRxZ2hkYmdTK2dsYXZxSWpKZUp2ek9HNlc5RElUUkNqOW1mdWREc0Zr?=
 =?utf-8?B?TGh2MXF4anRsd3RvdVdURG9oMm51Qk9qRnBMaDRzRXdnWUM0MXdDKzlzWDVQ?=
 =?utf-8?B?VnlXVSsybUNVL05WSlZkSEExUUxSYXZKSjFRalowSCt1Q0oyRTBSbExHcUZU?=
 =?utf-8?B?Q2NybnNsU1BDU3VYeGFxcDVPdW1DeE90NlNManhGeU5EQXdObHF6N2o0MHlq?=
 =?utf-8?B?NVFVVnBmOWlCaHNTczBqbDMrMUVpblRCMTVHaHlHbUpiUGlqNk8xZzBoT2Zv?=
 =?utf-8?B?WUlwd2xPQ1BRNHp2T0kyNU5hbGMwYWZVc3AyODhmTER1Z2ExUk9FcmJPbFc2?=
 =?utf-8?B?UEl1UmJhU09LdkhOa2dNYjRlWlVmdGZSK3hudlJBU2x2WmNwZ24wMlRIRmpQ?=
 =?utf-8?B?UmtFVjR1Y3NGT3FPbzd2a25QNnVjYUZ0MnhRQi8rU29uRmpZL2tGR2lzdDFN?=
 =?utf-8?B?OGlYUyszQWJPWlVuaVZSbWpDV1UxL3l1RnoramR3Ui9OUkRLcUdYUHF5bUFm?=
 =?utf-8?B?cUxKL1lyYXRpQzdNNHViK2NkRW1mQkdpVXhBQ3VYV08rMXVtWWlBT2FPdnNJ?=
 =?utf-8?B?Q2EvZDV5VGwyU0EwTEJnRzN1cDFtNWthczN1TlJra0pPb1UwQzhWNFBGRmdJ?=
 =?utf-8?B?dEc2dlgza251NFJQdE9OVlEvLzcxalRpY0FuQnViS2ZQWkh6cWZTU0FmQ1Fy?=
 =?utf-8?B?cEV1U0FxYVhhUmRPNWduVGEyTmVBbFl6UWs0ejVGYUNraThiS3dJL2g5R1V0?=
 =?utf-8?B?RWlHRGJ0M1liS0ZMdEwyNWJRQnBPK3hTRWtCcVc1OVBUYUNuaUJpQldRT3Bi?=
 =?utf-8?B?N2h3WFdUWHBnVmlhOTZXUjlSQ3N5aVM2Mm55SXQ2ejlsd3I3eGZVUkg4WnJB?=
 =?utf-8?B?R0l6RTlqb25sNmV5dUZyekZva1dSOGUzVERhWi8xMjVTVHFyL01UbjJNUzI5?=
 =?utf-8?B?RWY4WUV6aXdDL0JOUExONTFlNnpndmpMaWthZHgwSGJsU2tJaHBSRUlnU0g1?=
 =?utf-8?B?RTFwc3VpcnU0QUc5aTNCTnFSUFQ0ejhidWpLRm10WDA4K0dnMWt2TmJwWmMx?=
 =?utf-8?B?UGVwUTVJdGIzVE1RbjhOT1pPMGYvMmM3ZDlBZDQvV3d3L2o3c3dRZWsrLzA5?=
 =?utf-8?B?elJJVGZUdCtlS0tON096Qk8rWktmWGdzYXNZSXQ5OUpDYithS3BhWCtHcTVy?=
 =?utf-8?B?dllFQ05KU095dzJFWHU3cEFPa21UNWd3WXQzTXErdzM2UlZHdEdtU2wzMktR?=
 =?utf-8?B?VGNYSWtIMkdrMldKMDhSRkxKakFYcmdoUU5VRzRZTlpKZ00ySGJxUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08b44ec3-c077-4cca-e75d-08da224e1b2e
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 21:46:48.7855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /nv5zKesYNH/NmZ5pjW3V52LmJxOQFsD0yXsf/QBIo+dW5jSRobH+KnBFnqAhg9J4GC6iuH2MOSbwSHh37aXQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2706
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
Cc: Dave Airlie <airlied@linux.ie>, xinhui pan <xinhui.pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alexander Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------5n0qGmPKD74fZ2mQxp31uiy2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Paul,

On 4/14/2022 2:52 AM, Paul Menzel wrote:
> [Cc: -kernel test robot <lkp@intel.com>]
>
> Dear Alex, dear Richard,
>
>
> Am 13.04.22 um 15:00 schrieb Alex Deucher:
>> On Wed, Apr 13, 2022 at 3:43 AM Paul Menzel wrote:
>
>>> Thank you for sending out v4.
>>>
>>> Am 12.04.22 um 23:50 schrieb Richard Gong:
>>>> Active State Power Management (ASPM) feature is enabled since 
>>>> kernel 5.14.
>>>> There are some AMD GFX cards (such as WX3200 and RX640) that won't 
>>>> work
>>>> with ASPM-enabled Intel Alder Lake based systems. Using these GFX 
>>>> cards as
>>>> video/display output, Intel Alder Lake based systems will hang during
>>>> suspend/resume.
>>>
>>> I am still not clear, what “hang during suspend/resume” means. I guess
>>> suspending works fine? During resume (S3 or S0ix?), where does it hang?
>>> The system is functional, but there are only display problems?
System freeze after suspend/resume.
>>>
>>>> The issue was initially reported on one system (Dell Precision 3660 
>>>> with
>>>> BIOS version 0.14.81), but was later confirmed to affect at least 4 
>>>> Alder
>>>> Lake based systems.
>>>>
>>>> Add extra check to disable ASPM on Intel Alder Lake based systems.
>>>>
>>>> Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
>>>> Link: 
>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1885&amp;data=04%7C01%7Crichard.gong%40amd.com%7Ce7febed5d6a441c3a58008da1debb99c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637855195670542145%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=7cEnE%2BSM9e5IGFxSLloCLtCOxovBpaPz0Ns0Ta2vVlc%3D&amp;reserved=0
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>
>>> This tag is a little confusing. Maybe clarify that it was for an issue
>>> in a previous patch iteration?

I did describe in change-list version 3 below, which corrected the build 
error with W=1 option.

It is not good idea to add the description for that to the commit 
message, this is why I add descriptions on change-list version 3.

>>>
>>>> Signed-off-by: Richard Gong <richard.gong@amd.com>
>>>> ---
>>>> v4: s/CONFIG_X86_64/CONFIG_X86
>>>>       enhanced check logic
>>>> v3: s/intel_core_asom_chk/aspm_support_quirk_check
>>>>       correct build error with W=1 option
>>>> v2: correct commit description
>>>>       move the check from chip family to problematic platform
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/vi.c | 17 ++++++++++++++++-
>>>>    1 file changed, 16 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/vi.c
>>>> index 039b90cdc3bc..b33e0a9bee65 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
>>>> @@ -81,6 +81,10 @@
>>>>    #include "mxgpu_vi.h"
>>>>    #include "amdgpu_dm.h"
>>>>
>>>> +#if IS_ENABLED(CONFIG_X86)
>>>> +#include <asm/intel-family.h>
>>>> +#endif
>>>> +
>>>>    #define ixPCIE_LC_L1_PM_SUBSTATE    0x100100C6
>>>>    #define PCIE_LC_L1_PM_SUBSTATE__LC_L1_SUBSTATES_OVERRIDE_EN_MASK 
>>>> 0x00000001L
>>>>    #define PCIE_LC_L1_PM_SUBSTATE__LC_PCI_PM_L1_2_OVERRIDE_MASK 
>>>> 0x00000002L
>>>> @@ -1134,13 +1138,24 @@ static void vi_enable_aspm(struct 
>>>> amdgpu_device *adev)
>>>>                WREG32_PCIE(ixPCIE_LC_CNTL, data);
>>>>    }
>>>>
>>>> +static bool aspm_support_quirk_check(void)
>>>> +{
>>>> +     if (IS_ENABLED(CONFIG_X86)) {
>>>> +             struct cpuinfo_x86 *c = &cpu_data(0);
>>>> +
>>>> +             return !(c->x86 == 6 && c->x86_model == 
>>>> INTEL_FAM6_ALDERLAKE);
>>>> +     }
>>>> +
>>>> +     return true;
>>>> +}
>>>> +
>>>>    static void vi_program_aspm(struct amdgpu_device *adev)
>>>>    {
>>>>        u32 data, data1, orig;
>>>>        bool bL1SS = false;
>>>>        bool bClkReqSupport = true;
>>>>
>>>> -     if (!amdgpu_device_should_use_aspm(adev))
>>>> +     if (!amdgpu_device_should_use_aspm(adev) || 
>>>> !aspm_support_quirk_check())
>>>>                return;
>>>
>>> Can users still forcefully enable ASPM with the parameter 
>>> `amdgpu.aspm`?
>>>
As Mario mentioned in a separate reply, we can't forcefully enable ASPM 
with the parameter 'amdgpu.aspm'.
>>>>
>>>>        if (adev->flags & AMD_IS_APU ||
>>>
>>> If I remember correctly, there were also newer cards, where ASPM worked
>>> with Intel Alder Lake, right? Can only the problematic generations for
>>> WX3200 and RX640 be excluded from ASPM?
>>
>> This patch only disables it for the generation that was problematic.
>
> Could that please be made clear in the commit message summary, and 
> message?

Are you ok with the commit messages below?

Active State Power Management (ASPM) feature is enabled since kernel 5.14.

There are some AMD GFX cards (such as WX3200 and RX640) that won't work

with ASPM-enabled Intel Alder Lake based systems. Using these GFX cards as

video/display output, Intel Alder Lake based systems will freeze after

suspend/resume.

The issue was initially reported on one system (Dell Precision 3660 with

BIOS version 0.14.81), but was later confirmed to affect at least 4 Alder

Lake based systems.

Add extra check to disable ASPM on Intel Alder Lake based systems with

problematic generation GFX cards.

>
> Loosely related, is there a public (or internal issue) to analyze how 
> to get ASPM working for VI generation devices with Intel Alder Lake?

As Alex mentioned, we need support from Intel. We don't have any update 
on that.


Regards,

Richard

>
>
> Kind regards,
>
> Paul
--------------5n0qGmPKD74fZ2mQxp31uiy2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Paul,<br>
    </p>
    <div class="moz-cite-prefix">On 4/14/2022 2:52 AM, Paul Menzel
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:91e916e3-d793-b814-6cbf-abee0667f5f8@molgen.mpg.de">[Cc:
      -kernel test robot <a class="moz-txt-link-rfc2396E" href="mailto:lkp@intel.com">&lt;lkp@intel.com&gt;</a>]
      <br>
      <br>
      Dear Alex, dear Richard,
      <br>
      <br>
      <br>
      Am 13.04.22 um 15:00 schrieb Alex Deucher:
      <br>
      <blockquote type="cite">On Wed, Apr 13, 2022 at 3:43 AM Paul
        Menzel wrote:
        <br>
      </blockquote>
      <br>
      <blockquote type="cite">
        <blockquote type="cite">Thank you for sending out v4.
          <br>
          <br>
          Am 12.04.22 um 23:50 schrieb Richard Gong:
          <br>
          <blockquote type="cite">Active State Power Management (ASPM)
            feature is enabled since kernel 5.14.
            <br>
            There are some AMD GFX cards (such as WX3200 and RX640) that
            won't work
            <br>
            with ASPM-enabled Intel Alder Lake based systems. Using
            these GFX cards as
            <br>
            video/display output, Intel Alder Lake based systems will
            hang during
            <br>
            suspend/resume.
            <br>
          </blockquote>
          <br>
          I am still not clear, what “hang during suspend/resume” means.
          I guess
          <br>
          suspending works fine? During resume (S3 or S0ix?), where does
          it hang?
          <br>
          The system is functional, but there are only display problems?
          <br>
        </blockquote>
      </blockquote>
    </blockquote>
    System freeze after suspend/resume.<br>
    <blockquote type="cite" cite="mid:91e916e3-d793-b814-6cbf-abee0667f5f8@molgen.mpg.de">
      <blockquote type="cite">
        <blockquote type="cite">
          <br>
          <blockquote type="cite">The issue was initially reported on
            one system (Dell Precision 3660 with
            <br>
            BIOS version 0.14.81), but was later confirmed to affect at
            least 4 Alder
            <br>
            Lake based systems.
            <br>
            <br>
            Add extra check to disable ASPM on Intel Alder Lake based
            systems.
            <br>
            <br>
            Fixes: 0064b0ce85bb (&quot;drm/amd/pm: enable ASPM by default&quot;)
            <br>
            Link:
<a class="moz-txt-link-freetext" href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1885&amp;amp;data=04%7C01%7Crichard.gong%40amd.com%7Ce7febed5d6a441c3a58008da1debb99c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637855195670542145%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=7cEnE%2BSM9e5IGFxSLloCLtCOxovBpaPz0Ns0Ta2vVlc%3D&amp;amp;reserved=0">https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1885&amp;amp;data=04%7C01%7Crichard.gong%40amd.com%7Ce7febed5d6a441c3a58008da1debb99c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637855195670542145%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=7cEnE%2BSM9e5IGFxSLloCLtCOxovBpaPz0Ns0Ta2vVlc%3D&amp;amp;reserved=0</a><br>
            Reported-by: kernel test robot <a class="moz-txt-link-rfc2396E" href="mailto:lkp@intel.com">&lt;lkp@intel.com&gt;</a>
            <br>
          </blockquote>
          <br>
          This tag is a little confusing. Maybe clarify that it was for
          an issue
          <br>
          in a previous patch iteration?
          <br>
        </blockquote>
      </blockquote>
    </blockquote>
    <p>I did describe in change-list version 3 below, which corrected
      the build error with W=1 option.</p>
    <p>It is not good idea to add the description for that to the commit
      message, this is why I add descriptions on change-list version 3.<br>
    </p>
    <blockquote type="cite" cite="mid:91e916e3-d793-b814-6cbf-abee0667f5f8@molgen.mpg.de">
      <blockquote type="cite">
        <blockquote type="cite">
          <br>
          <blockquote type="cite">Signed-off-by: Richard Gong
            <a class="moz-txt-link-rfc2396E" href="mailto:richard.gong@amd.com">&lt;richard.gong@amd.com&gt;</a>
            <br>
            ---
            <br>
            v4: s/CONFIG_X86_64/CONFIG_X86
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enhanced check logic
            <br>
            v3: s/intel_core_asom_chk/aspm_support_quirk_check
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; correct build error with W=1 option
            <br>
            v2: correct commit description
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; move the check from chip family to problematic
            platform
            <br>
            ---
            <br>
            &nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/vi.c | 17 ++++++++++++++++-
            <br>
            &nbsp;&nbsp; 1 file changed, 16 insertions(+), 1 deletion(-)
            <br>
            <br>
            diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c
            b/drivers/gpu/drm/amd/amdgpu/vi.c
            <br>
            index 039b90cdc3bc..b33e0a9bee65 100644
            <br>
            --- a/drivers/gpu/drm/amd/amdgpu/vi.c
            <br>
            +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
            <br>
            @@ -81,6 +81,10 @@
            <br>
            &nbsp;&nbsp; #include &quot;mxgpu_vi.h&quot;
            <br>
            &nbsp;&nbsp; #include &quot;amdgpu_dm.h&quot;
            <br>
            <br>
            +#if IS_ENABLED(CONFIG_X86)
            <br>
            +#include &lt;asm/intel-family.h&gt;
            <br>
            +#endif
            <br>
            +
            <br>
            &nbsp;&nbsp; #define ixPCIE_LC_L1_PM_SUBSTATE&nbsp;&nbsp;&nbsp; 0x100100C6
            <br>
            &nbsp;&nbsp; #define
            PCIE_LC_L1_PM_SUBSTATE__LC_L1_SUBSTATES_OVERRIDE_EN_MASK&nbsp;&nbsp;&nbsp;
            0x00000001L
            <br>
            &nbsp;&nbsp; #define
            PCIE_LC_L1_PM_SUBSTATE__LC_PCI_PM_L1_2_OVERRIDE_MASK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            0x00000002L
            <br>
            @@ -1134,13 +1138,24 @@ static void vi_enable_aspm(struct
            amdgpu_device *adev)
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32_PCIE(ixPCIE_LC_CNTL, data);
            <br>
            &nbsp;&nbsp; }
            <br>
            <br>
            +static bool aspm_support_quirk_check(void)
            <br>
            +{
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp; if (IS_ENABLED(CONFIG_X86)) {
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct cpuinfo_x86 *c = &amp;cpu_data(0);
            <br>
            +
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return !(c-&gt;x86 == 6 &amp;&amp;
            c-&gt;x86_model == INTEL_FAM6_ALDERLAKE);
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp; }
            <br>
            +
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp; return true;
            <br>
            +}
            <br>
            +
            <br>
            &nbsp;&nbsp; static void vi_program_aspm(struct amdgpu_device *adev)
            <br>
            &nbsp;&nbsp; {
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 data, data1, orig;
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool bL1SS = false;
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool bClkReqSupport = true;
            <br>
            <br>
            -&nbsp;&nbsp;&nbsp;&nbsp; if (!amdgpu_device_should_use_aspm(adev))
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp; if (!amdgpu_device_should_use_aspm(adev) ||
            !aspm_support_quirk_check())
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;
            <br>
          </blockquote>
          <br>
          Can users still forcefully enable ASPM with the parameter
          `amdgpu.aspm`?
          <br>
          <br>
        </blockquote>
      </blockquote>
    </blockquote>
    As Mario mentioned in a separate reply, we can't forcefully enable
    ASPM with the parameter 'amdgpu.aspm'.<br>
    <blockquote type="cite" cite="mid:91e916e3-d793-b814-6cbf-abee0667f5f8@molgen.mpg.de">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;flags &amp; AMD_IS_APU ||
            <br>
          </blockquote>
          <br>
          If I remember correctly, there were also newer cards, where
          ASPM worked
          <br>
          with Intel Alder Lake, right? Can only the problematic
          generations for
          <br>
          WX3200 and RX640 be excluded from ASPM?
          <br>
        </blockquote>
        <br>
        This patch only disables it for the generation that was
        problematic.
        <br>
      </blockquote>
      <br>
      Could that please be made clear in the commit message summary, and
      message?
      <br>
    </blockquote>
    <p>Are you ok with the commit messages below?<br>
    </p>
    <p class="MsoNormal">Active State Power Management (ASPM) feature is
      enabled
      since kernel 5.14.</p>
    <p class="MsoNormal">There are some AMD GFX cards (such as WX3200
      and RX640) that
      won't work</p>
    <p class="MsoNormal">with ASPM-enabled Intel Alder Lake based
      systems. Using
      these GFX cards as</p>
    <p class="MsoNormal">video/display output, Intel Alder Lake based
      systems will
      freeze after</p>
    <p class="MsoNormal">suspend/resume.</p>
    <p class="MsoNormal">The issue was initially reported on one system
      (Dell
      Precision 3660 with</p>
    <p class="MsoNormal">BIOS version 0.14.81), but was later confirmed
      to affect at
      least 4 Alder</p>
    <p class="MsoNormal">Lake based systems.</p>
    <p class="MsoNormal">Add extra check to disable ASPM on Intel Alder
      Lake based
      systems with</p>
    <p class="MsoNormal">problematic generation GFX cards.</p>
    <!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-US</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" DefPriority="99"
  LatentStyleCount="376">
  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 9"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="header"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footer"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index heading"/>
  <w:LsdException Locked="false" Priority="35" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of figures"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope return"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="line number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="page number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of authorities"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="macro"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="toa heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 5"/>
  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Closing"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Signature"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="true"
   UnhideWhenUsed="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Message Header"/>
  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Salutation"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Date"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Note Heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Block Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="FollowedHyperlink"/>
  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Document Map"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Plain Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="E-mail Signature"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Top of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Bottom of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal (Web)"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Acronym"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Cite"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Code"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Definition"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Keyboard"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Preformatted"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Sample"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Typewriter"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Variable"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Table"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation subject"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="No List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Contemporary"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Elegant"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Professional"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Balloon Text"/>
  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Theme"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hashtag"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Unresolved Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Link"/>
 </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-para-margin:0in;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;}
</style>
<![endif]-->
    <blockquote type="cite" cite="mid:91e916e3-d793-b814-6cbf-abee0667f5f8@molgen.mpg.de">
      <br>
      Loosely related, is there a public (or internal issue) to analyze
      how to get ASPM working for VI generation devices with Intel Alder
      Lake?
      <br>
    </blockquote>
    <p>As Alex mentioned, we need support from Intel. We don't have any
      update on that.<br>
    </p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>Richard<br>
    </p>
    <blockquote type="cite" cite="mid:91e916e3-d793-b814-6cbf-abee0667f5f8@molgen.mpg.de">
      <br>
      <br>
      Kind regards,
      <br>
      <br>
      Paul
      <br>
    </blockquote>
  </body>
</html>
--------------5n0qGmPKD74fZ2mQxp31uiy2--
