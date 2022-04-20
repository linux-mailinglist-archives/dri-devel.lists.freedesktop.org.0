Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F6B5091B1
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 22:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52A210E374;
	Wed, 20 Apr 2022 20:57:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2047.outbound.protection.outlook.com [40.107.236.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5312F10E374;
 Wed, 20 Apr 2022 20:57:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PkRkH54QvKhSnKysc9qfKzG2v02I53bGht77mUpEOx+D2OS6n3ApMIO0VolZ5/ISMNwONURpZPbeL17RcJAiXU9lrrcFvU72gs5E/5RLB1RrlMUzuV38+1+KCHvPB29okqyS5DTwOi8w2ZC/A3NEzjics+6n8GcAME4sG1HeAm/Ftxl/+tftFDDTkZj4P0dJ0uBTgR4CJ8lfVMYALFUhz2g2xMzMs63rQiE4wybcHBGJPJOC2mlvd+/991ngRDif4PKztZzbi2iecCX6ivAzWRFgqbmtydi+IVO0hCTvllnK5VU2h1hJ+KetEtLL7jDnfizEzRftbuBmy5sOc4rsvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQcVjaHsRAZm3rYqsygMGO/aO093KqTVwub8pD91kYs=;
 b=ijrotYRnDJsb61GKC/I/tHph2ioQzK0XrgoVXVAjw9uSFP9utVcs9Qh7F2VWzTSx20AuvijQXfCKarzPFC0PyDpAwWfa+t6aqrn9uECVTZTym+TJInCVZq8R5f2maj7GQvTMz4kUUYMJ0PD6AhH5dgWAyDcH7S3rOf1r2PugaWYeZizZ8i81fP8ctNQZYnKu+MrWKCJ0RZ6tZmLcSGpU/eJ1XtXzUjyYQRRhFRxDSREg88rv90jCq1vodKTInx1YgK7vZYlbGNt1kSoA4UFbwFwrVs5s9Rku7m9BbmYuG4x8nb8b1PH39D+HAIbssTQxHFTwz5a/FKsha5hf2BmzEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQcVjaHsRAZm3rYqsygMGO/aO093KqTVwub8pD91kYs=;
 b=bVm1dZyzziHPm7CBTCNLupTK4V0+U0c2D6Pq72Pvw506QVW4+94sylGC4pME1L61MZQ1Lo9b05mhLj3JQATzagQGqmkqYKhi1Heh+jGw5l821NE9OcjCbrusgYbL48cRBEWBcHWT//1P/62BFgEq0t8zwVgtK7Eweklid3AFq4o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4526.namprd12.prod.outlook.com (2603:10b6:806:98::23)
 by BN8PR12MB3124.namprd12.prod.outlook.com (2603:10b6:408:41::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 20 Apr
 2022 20:57:00 +0000
Received: from SA0PR12MB4526.namprd12.prod.outlook.com
 ([fe80::8515:3855:bed9:3f05]) by SA0PR12MB4526.namprd12.prod.outlook.com
 ([fe80::8515:3855:bed9:3f05%9]) with mapi id 15.20.5186.014; Wed, 20 Apr 2022
 20:57:00 +0000
Message-ID: <67e98c3e-cfa3-ee51-4932-bbad8de5ffd8@amd.com>
Date: Wed, 20 Apr 2022 15:56:56 -0500
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
 <94fd858d-1792-9c05-b5c6-1b028427687d@amd.com>
 <efc1dfd1-2b54-aee5-1497-4b800a468141@molgen.mpg.de>
 <CADnq5_NGTbTjn87tAsTJAMOKZ9niS7Mb=JDmjUH4KJXfDH_p_g@mail.gmail.com>
 <295e7882-21a2-f50f-6bfa-b0bae1d0fa12@molgen.mpg.de>
From: "Gong, Richard" <richard.gong@amd.com>
In-Reply-To: <295e7882-21a2-f50f-6bfa-b0bae1d0fa12@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR08CA0012.namprd08.prod.outlook.com
 (2603:10b6:208:239::17) To SA0PR12MB4526.namprd12.prod.outlook.com
 (2603:10b6:806:98::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c0ee963-1f02-43ac-1b26-08da2310501d
X-MS-TrafficTypeDiagnostic: BN8PR12MB3124:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB31247CC5480E2520F41D118C95F59@BN8PR12MB3124.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b9gPOaEnqSny4wEDotGsljDhYupowHOs2YW3MRJRXXZ8IUVqXrUMrESnYpvl9mbzWyGgwzQEWM2i6F1HZfdMYPkNHRHl8iTCFt/FcPcYK8bWdjnib3vJONTRojBx5LX1xp6U5wMue4jLi67F1BS/uU0LDkqOrN6d7KPuANrQFyn0KYHBDBQY0jT7h/EcJvZ34W21DM5JBVMUvWklOxOjzNopBUzWaOZzpR6UHsxamx9UwQtu9AYRBlQYdiV0CWfzmawF/5m3XsbUFLZkpTvGqBuqDWyJCqkg/NdBRZfHc3u+tICU4riCFfNAeVhhpF/vKRPqua6sT5ut205mySV6+H1jO6eRpdWndlWKDurcopnCZE2939bx8LQ/QQ2Ao6zSkJ6rRJnJk52LlnW09EkCU8D4nOnQQ4bYxAjPilrhT7MLoJ4bgQNdby+/bUv2NRweFAJ91ectr7rIeC2K0tGi/KD1PXXIECNM4XCN+QJATNux5LVVHzfPDq1EpziK76aUYfBM0zBbnW/r8Hm6uytCV0LG5i6nZL9KiLpPesB1rQQMF8Q6L1AZAt48ikPW2v9ix/RGNYFQmlSeS86xuTh4yOvCaZ+maw/Sq+o2OQwZnmMAgK9PiYp2HioaTxDo7M/udQigz9jdhEcTWjPrRIZmjTO7lrb+pQJuZiIsucEin59Hu1jd1qRuQJ2YHLPtiiqWf3M6hCuC8XSSIdtxGH1TC384P3mPHKOyJee4I+3camA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(38100700002)(86362001)(26005)(8936002)(31696002)(83380400001)(6666004)(110136005)(6506007)(5660300002)(45080400002)(6486002)(966005)(53546011)(508600001)(2616005)(6512007)(186003)(4326008)(66476007)(66556008)(66946007)(8676002)(2906002)(36756003)(31686004)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUJ6dXN2cnRtOTlKSlRjbE10MjNPUHI0cllnOGdxaUsra0VXZGFJdU5zZm9F?=
 =?utf-8?B?SFlhZmdDNTVSZnhucGRjNHhkREFWdmc0NmpNaU0rL0ZLWDgwclk1eUppZ3ND?=
 =?utf-8?B?MWEvRXNRenUrU2dqRW5XYjZBUVhsblo0NlkrbzcrNGM0RkZhOWRqa3hqc2s5?=
 =?utf-8?B?K3U0UERqejNpbGdoUndaK29pMWtxOEp2NXJaMlVsR0puU3h2TzBodVpqb1A0?=
 =?utf-8?B?cFoyR1dWZ0VwM1oxb0FtanoyWTRGOThwN0x0aHN2SyszWlEyWk9MRkJOdXY5?=
 =?utf-8?B?UldrKzRTME1SSGw1Z0l4ZUtkNnUxNTVaRTNwMkpBWVdwUTNWbkFvQmhuVmg4?=
 =?utf-8?B?SjJSODFNMXFEdGJiSHZhUUo3bk9ZQ0oyd0dGQkNjdzFIUVpHWStkRmVaUWdw?=
 =?utf-8?B?UlRiTXZNNzh4Q1VBeTVScDVEYVpYUlNoeXl2R0RFVkRsTDNUbUs1TDZZNlBs?=
 =?utf-8?B?cGdCVVFnNm5rS3dFVW1WTURPUHE4MnRCODdJUkMzK0JxQlFZVFIvZ2JvVzFx?=
 =?utf-8?B?MGFWV0hXVFplaHMyN0x4WXBPMzVNTnFScHFxeUhKTzdXU1cvdytmL21rU3Bu?=
 =?utf-8?B?cFBzQ1NtODlNUnRjZmZnTkJLUEZKcDB5TWpKOWlDKzB2eUUxWFZEM251N3RG?=
 =?utf-8?B?R0F3QWpmcDcrOVluZDVtZHdhdHg2MGVoWUJseGRTZGhWaU5Gc2hYdThLY1h5?=
 =?utf-8?B?TEtUR2FjelpXdzhhZGNwWXdBN2NoQlI5dUtXcCtyQU5LaVhSQ3BZSlk2TWtB?=
 =?utf-8?B?WTZvZERpR2ROWHBqRUtmc0ppRys1RHczSElaMUJSVW5ZOUd4TWhHMDZ0UXJl?=
 =?utf-8?B?MW9ReVRJQjhicC9MRUQ2cGM2eFc3RWhBZzF5QU0yeG9LQWpoQy9vVXRWSWln?=
 =?utf-8?B?d25jdFRxNWdqcEVCamUraUEzNE5pM0R1cmxOU0NRdVF2OURaU3VXZHp1R1Z3?=
 =?utf-8?B?ZjFQRmNhcm9tem9LQ0xKaDA2UXQxbktUSS9wZm1CS1FjNk15MnVmVUQ5dkF6?=
 =?utf-8?B?djVVNkVyT0ZvWVdnZjdsT3FLV1A2aDJXQ050V05ITlBHbUZxKzJ1dUk5STRE?=
 =?utf-8?B?M2ZxV21OSTZ5Wnl1cmxDeE14RnZDU0dySEZwQnppRlUxS3hiVFpVaEJzOHJs?=
 =?utf-8?B?UFZuZXovV1l0ZGdkd0lkU1dsa0gyMFRlc1lyM2N2LytQZXRRZFFndGo1SzFp?=
 =?utf-8?B?bGpNK1RtRmV6czVNV2VoL1ptY2gvazNhV0RCS3VuRUsrL1hCRDUrSGYza1d2?=
 =?utf-8?B?RHdkR2p5WXJkS2FjTGJiWVIzTnphK1VQdWI3TkdIcXhnUm5leU4yelBsc1dC?=
 =?utf-8?B?VkRnd1hnZ1VFWTE5WCtneTZjRXphN1oyMENYbEFVVUY4SkJnOFQ3U3FEV3VF?=
 =?utf-8?B?ZE1XbWxwY2VsNEhVOVZNNktISXlJdWcwMjU2ZVF5NkdJS1hnTnpvSHFlZ25K?=
 =?utf-8?B?Tys3NmZuMmtwZVZYc2kzRkl4dkRYQlhSSGJ3QTVzM2doSjlINElzSGVhMno3?=
 =?utf-8?B?ZWl4bjR3alpva2lUWmlUZ2lUenljV2Uwb3E1aWtseEo3RmpxMTVERUtsT2lq?=
 =?utf-8?B?dXNmSW1TYnpyRElXUVdLRXNUazlTWFF1T1IvQzV6SENZWHgrTS9weUh2dzM2?=
 =?utf-8?B?eEZFNU5vSU4wTUtKL1U2eU8wRVVPTnhONHFTeTR3cTlhRmpucnJrWmMyM29o?=
 =?utf-8?B?Mk1iOUtKbjFVRXFrRUVURDMwMlpnOERibFBlaDFvMVI2SEJYR0ZFUXJaL21j?=
 =?utf-8?B?REtxLzZtZWN6c2kwaktSRU5ObUwyVFEyODFpVWdKTUNmVVhZWUZqM1ZMdERp?=
 =?utf-8?B?cHY5Wm8zUUFKdFlGR0w0dXdxNFFtR3YzcnduYXdJVGhPUytHMFIrY2ZLcjhH?=
 =?utf-8?B?K21PZXhYZm1UTHlycUdxaWdEc0lpRUVja0R5TmthOHBnNE9XZFZYLzBicG4z?=
 =?utf-8?B?bURtZXJsVnI0WDBHVkFyS29UTERKa0o0Rk5ycUhiMUJXNGJ2WTJERXMvblBG?=
 =?utf-8?B?WlRWYTNNcUE1SDVGRUUra1hJcGV2ZEMrMzFvVVFPL3Q5YWZKMDByTWl6RVZ5?=
 =?utf-8?B?elZ1YU85a3RIZDFST05WWWVBdUxmQ05wMjhydHYwTXN3UHloYVZXSVVFeFIy?=
 =?utf-8?B?TmZFMjYvQ2lWbUtkbFFMc000MmcvdlJxSXJDb25VWDZxT2VaSERDNURCeHdX?=
 =?utf-8?B?aGE1bi9DN1ZuUTZ0bDFGdnBxTHNjSlpMbnJUVmpDV2NxN1AyYmVJOGU1cVpY?=
 =?utf-8?B?ZWJxWURXai9rM0NmRnFkMXVVSWQ3cFpSUm9IVXlDR0Z5bFJCbmlxUmtlSzhG?=
 =?utf-8?B?QmNYMG1oWDhXTWtmeUdPa2ZXMUxVaGtrMkZXQzRwd0MwVnFkRDhFZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0ee963-1f02-43ac-1b26-08da2310501d
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 20:56:59.8754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: APTiuziZ9xEqwGwqdlXc0Yk9/ePz/aW4wNKKlegM/L3EL/0UmWV6MKYbvfnFSNJuprIe6vzOiXGQAkta/XcdwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3124
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
Cc: Dave Airlie <airlied@linux.ie>, Xinhui Pan <xinhui.pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alexander Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

On 4/20/2022 3:48 PM, Paul Menzel wrote:
> Dear Alex,
>
>
> Am 20.04.22 um 22:40 schrieb Alex Deucher:
>> On Wed, Apr 20, 2022 at 4:29 PM Paul Menzel <pmenzel@molgen.mpg.de> 
>> wrote:
>
>>> Am 19.04.22 um 23:46 schrieb Gong, Richard:
>>>
>>>> On 4/14/2022 2:52 AM, Paul Menzel wrote:
>>>>> [Cc: -kernel test robot <lkp@intel.com>]
>>>
>>> […]
>>>
>>>>> Am 13.04.22 um 15:00 schrieb Alex Deucher:
>>>>>> On Wed, Apr 13, 2022 at 3:43 AM Paul Menzel wrote:
>>>>>
>>>>>>> Thank you for sending out v4.
>>>>>>>
>>>>>>> Am 12.04.22 um 23:50 schrieb Richard Gong:
>>>>>>>> Active State Power Management (ASPM) feature is enabled since
>>>>>>>> kernel 5.14.
>>>>>>>> There are some AMD GFX cards (such as WX3200 and RX640) that won't
>>>>>>>> work
>>>>>>>> with ASPM-enabled Intel Alder Lake based systems. Using these GFX
>>>>>>>> cards as
>>>>>>>> video/display output, Intel Alder Lake based systems will hang 
>>>>>>>> during
>>>>>>>> suspend/resume.
>>>
>>> [Your email program wraps lines in cited text for some reason, making
>>> the citation harder to read.]
>>>
>>>>>>>
>>>>>>> I am still not clear, what “hang during suspend/resume” means. I 
>>>>>>> guess
>>>>>>> suspending works fine? During resume (S3 or S0ix?), where does 
>>>>>>> it hang?
>>>>>>> The system is functional, but there are only display problems?
>>>> System freeze after suspend/resume.
>>>
>>> But you see certain messages still? At what point does it freeze
>>> exactly? In the bug report you posted Linux messages.
>>>
>>>>>>>> The issue was initially reported on one system (Dell Precision 
>>>>>>>> 3660
>>>>>>>> with
>>>>>>>> BIOS version 0.14.81), but was later confirmed to affect at 
>>>>>>>> least 4
>>>>>>>> Alder
>>>>>>>> Lake based systems.
>>>>>>>>
>>>>>>>> Add extra check to disable ASPM on Intel Alder Lake based systems.
>>>>>>>>
>>>>>>>> Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
>>>>>>>> Link:
>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1885&amp;data=05%7C01%7Crichard.gong%40amd.com%7C487aaa63098b462e146a08da230f2319%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637860845178176835%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3IVldn05qNa2XVp1Lu58SriS8k9mk4U9K9p3F3IYPe0%3D&amp;reserved=0 
>>>>>>>>
>>>
>>> Thank you Microsoft Outlook for keeping us safe. :(
>>>
>>>>>>>>
>>>>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>>>>
>>>>>>> This tag is a little confusing. Maybe clarify that it was for an 
>>>>>>> issue
>>>>>>> in a previous patch iteration?
>>>>
>>>> I did describe in change-list version 3 below, which corrected the 
>>>> build
>>>> error with W=1 option.
>>>>
>>>> It is not good idea to add the description for that to the commit
>>>> message, this is why I add descriptions on change-list version 3.
>>>
>>> Do as you wish, but the current style is confusing, and readers of the
>>> commit are going to think, the kernel test robot reported the problem
>>> with AMD VI ASICs and Intel Alder Lake systems.
>>>
>>>>>>>
>>>>>>>> Signed-off-by: Richard Gong <richard.gong@amd.com>
>>>>>>>> ---
>>>>>>>> v4: s/CONFIG_X86_64/CONFIG_X86
>>>>>>>>        enhanced check logic
>>>>>>>> v3: s/intel_core_asom_chk/aspm_support_quirk_check
>>>>>>>>        correct build error with W=1 option
>>>>>>>> v2: correct commit description
>>>>>>>>        move the check from chip family to problematic platform
>>>>>>>> ---
>>>>>>>>     drivers/gpu/drm/amd/amdgpu/vi.c | 17 ++++++++++++++++-
>>>>>>>>     1 file changed, 16 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c
>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/vi.c
>>>>>>>> index 039b90cdc3bc..b33e0a9bee65 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
>>>>>>>> @@ -81,6 +81,10 @@
>>>>>>>>     #include "mxgpu_vi.h"
>>>>>>>>     #include "amdgpu_dm.h"
>>>>>>>>
>>>>>>>> +#if IS_ENABLED(CONFIG_X86)
>>>>>>>> +#include <asm/intel-family.h>
>>>>>>>> +#endif
>>>>>>>> +
>>>>>>>>     #define ixPCIE_LC_L1_PM_SUBSTATE    0x100100C6
>>>>>>>>     #define 
>>>>>>>> PCIE_LC_L1_PM_SUBSTATE__LC_L1_SUBSTATES_OVERRIDE_EN_MASK
>>>>>>>> 0x00000001L
>>>>>>>>     #define PCIE_LC_L1_PM_SUBSTATE__LC_PCI_PM_L1_2_OVERRIDE_MASK
>>>>>>>> 0x00000002L
>>>>>>>> @@ -1134,13 +1138,24 @@ static void vi_enable_aspm(struct
>>>>>>>> amdgpu_device *adev)
>>>>>>>>                 WREG32_PCIE(ixPCIE_LC_CNTL, data);
>>>>>>>>     }
>>>>>>>>
>>>>>>>> +static bool aspm_support_quirk_check(void)
>>>>>>>> +{
>>>>>>>> +     if (IS_ENABLED(CONFIG_X86)) {
>>>>>>>> +             struct cpuinfo_x86 *c = &cpu_data(0);
>>>>>>>> +
>>>>>>>> +             return !(c->x86 == 6 && c->x86_model ==
>>>>>>>> INTEL_FAM6_ALDERLAKE);
>>>>>>>> +     }
>>>>>>>> +
>>>>>>>> +     return true;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>>     static void vi_program_aspm(struct amdgpu_device *adev)
>>>>>>>>     {
>>>>>>>>         u32 data, data1, orig;
>>>>>>>>         bool bL1SS = false;
>>>>>>>>         bool bClkReqSupport = true;
>>>>>>>>
>>>>>>>> -     if (!amdgpu_device_should_use_aspm(adev))
>>>>>>>> +     if (!amdgpu_device_should_use_aspm(adev) ||
>>>>>>>> !aspm_support_quirk_check())
>>>>>>>>                 return;
>>>>>>>
>>>>>>> Can users still forcefully enable ASPM with the parameter
>>>>>>> `amdgpu.aspm`?
>>>>>>>
>>>> As Mario mentioned in a separate reply, we can't forcefully enable 
>>>> ASPM
>>>> with the parameter 'amdgpu.aspm'.
>>>
>>> That would be a regression on systems where ASPM used to work. Hmm. I
>>> guess, you could say, there are no such systems.
>>>
>>>>>>>>
>>>>>>>>         if (adev->flags & AMD_IS_APU ||
>>>>>>>
>>>>>>> If I remember correctly, there were also newer cards, where ASPM 
>>>>>>> worked
>>>>>>> with Intel Alder Lake, right? Can only the problematic 
>>>>>>> generations for
>>>>>>> WX3200 and RX640 be excluded from ASPM?
>>>>>>
>>>>>> This patch only disables it for the generatioaon that was 
>>>>>> problematic.
>>>>>
>>>>> Could that please be made clear in the commit message summary, and
>>>>> message?
>>>>
>>>> Are you ok with the commit messages below?
>>>
>>> Please change the commit message summary. Maybe:
>>>
>>> drm/amdgpu: VI: Disable ASPM on Intel Alder Lake based systems
>>>
>>>> Active State Power Management (ASPM) feature is enabled since 
>>>> kernel 5.14.
>>>>
>>>> There are some AMD GFX cards (such as WX3200 and RX640) that won't 
>>>> work
>>>> with ASPM-enabled Intel Alder Lake based systems. Using these GFX 
>>>> cards as
>>>> video/display output, Intel Alder Lake based systems will freeze after
>>>> suspend/resume.
>>>
>>> Something like:
>>>
>>> On Intel Alder Lake based systems using ASPM with AMD GFX Volcanic
>>> Islands (VI) cards, like WX3200 and RX640, graphics don’t initialize
>>> when resuming from S0ix(?).
>>>
>>>
>>>> The issue was initially reported on one system (Dell Precision 3660 
>>>> with
>>>> BIOS version 0.14.81), but was later confirmed to affect at least 4 
>>>> Alder
>>>> Lake based systems.
>>>
>>> Which ones?
>>>
>>>> Add extra check to disable ASPM on Intel Alder Lake based systems with
>>>> problematic generation GFX cards.
>>>
>>> … with the problematic Volcanic Islands GFX cards.
>>>
>>>>>
>>>>> Loosely related, is there a public (or internal issue) to analyze how
>>>>> to get ASPM working for VI generation devices with Intel Alder Lake?
>>>>
>>>> As Alex mentioned, we need support from Intel. We don't have any 
>>>> update
>>>> on that.
>>>
>>> It’d be great to get that fixed properly.
>>>
>>> Last thing, please don’t hate me, does Linux log, that ASPM is 
>>> disabled?
>>
>> I'm not sure what gets logged at the platform level with respect to
>> ASPM, but whether or not the driver enables ASPM is tied to whether
>> ASPM is allowed at the platform level or not so if the platform
>> indicates that ASPM is not supported, the driver won't enable it.  The
>> driver does not log whether ASPM is enabled or not if that is what you
>> are asking.  As to whether or not it should, it comes down to how much
>> stuff is worth indiciating in the log.  The driver is already pretty
>> chatty by driver standards.
>
> I specifically mean, Linux should log the quirks it applies. (As a 
> normal user, I’d also expect ASPM to work nowadays, so a message, that 
> it’s disabled would help a lot.)

In general rule we shouldn't generate additional log unless something 
went wrong with the system.

>
>
> Kind regards,
>
> Paul
