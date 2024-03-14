Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2485C87C112
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 17:16:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1791610F955;
	Thu, 14 Mar 2024 16:16:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Uia3ku2s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB88410F955;
 Thu, 14 Mar 2024 16:16:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/jrZ20upEHXjm43h8guctQKhCD3E86vLqLsVPzg83U/q6zMP7RxF5R4yfXU3RNa2aE2/KqxQLBibju6ndW6f/6P2FQHaurdDbKPsBzMhvH2gJHmYPEEG4KVNeVTb//zG66eEWvLCburVX0AVBUsABV82XF2uRa70zlS6YTI+H+Tzd2QvYHhdZHJdYbzQj9tzhwHH7TIL4hy2Vsz0rJDRTXWjDl96vyl6CNdcSlbvSvZ+FROKHtUxBkmrLode8H678av+2nEa2tQkqZUFjprg3fKxtKdyBdf+wiSQG/Zz9vaqtFbFtnevK6UXzKvCqll3H8oJm7WDyb04T+lCtIcag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MCjxNV2koQpnqRFnbLAJs5Hi7EdmfOiFjfI2vU3Hzls=;
 b=KkBLKryEnMqlrvUScoO3MqttxEFbrgDAUMpN3n9YzCJB+VZo+DlfcLBT41gGjE3tjYvgJ5O6Gx8vOwnZH9+XBcT2p/HvLCdT75fWkJzbJTeoYN9Q+GOH/uHVqL3BjB7NObwN0HIImjWpKhRod0cI3o7RgXDCkvXRBZ0MuhDYVborXxXBTtkkaRu/dgoDKWPjliBH/MVLWFC4KlqZ6evEigEWqvTRDxEFEPHqFGxjGqcneYOVfSUjFDG3kufdhap7lctIrYTOzdnFvr4D2HZbnxSOY9cvcE+8Ilwd8V/TrRx31qdJrQe3fIgZZbD6hZi3oUTXvdJQjeU+lMcP9SP8jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MCjxNV2koQpnqRFnbLAJs5Hi7EdmfOiFjfI2vU3Hzls=;
 b=Uia3ku2s/7bV/EhDBnUw+06fSsZRnCL71GgPTxICcO3TEMMohpvPscEZAiZKorrERjKTZDvRSB9q6n3PbRtGu4BOFCPzbQJqYi2EHprrIMWC/vNWRuE7EaL4k7mqbZIkThTnTNLpaZa4CAN5w1Q4Mi5k7ZiWWLxkjECRmTtsdw8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by SA1PR12MB5659.namprd12.prod.outlook.com (2603:10b6:806:236::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.41; Thu, 14 Mar
 2024 16:16:15 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6974:3875:ed0:7033]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6974:3875:ed0:7033%3]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 16:16:15 +0000
Message-ID: <32aad098-9392-4899-9839-1beaedcac8b8@amd.com>
Date: Thu, 14 Mar 2024 21:46:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/amdgpu: add the IP information of the soc
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240312124148.257067-1-sunil.khatri@amd.com>
 <CADnq5_O-cyDkNLznZpvnZtz15Mi1_rkigirG80BmYJprP_udnw@mail.gmail.com>
 <59cf081e-5924-42b5-a3f1-de8b012f09d1@amd.com>
 <CADnq5_N0H75UU2aFTAkqUrdGxKPxBQUnodsH-bcpS-ZUqgUb3A@mail.gmail.com>
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <CADnq5_N0H75UU2aFTAkqUrdGxKPxBQUnodsH-bcpS-ZUqgUb3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::10) To PH7PR12MB5596.namprd12.prod.outlook.com
 (2603:10b6:510:136::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5596:EE_|SA1PR12MB5659:EE_
X-MS-Office365-Filtering-Correlation-Id: df11bc1a-7536-48bc-94ec-08dc444212d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WlNZgeDIaP8V7+A6jZNkgFujPqThWeOdIubislMpz4OR46O0kXpSuvYFXJav/gcOYG2G05cALc6KH04F34NT1vduL5+Q2urmnWabAmJOG47mLfQf+CZLQ10biMH03gG1C9XN3H/pABJK0Y32rOzX0LNDGWWYsLbQJtYeE7neutFPYXITmTRevaZ/ekNp/z8xTWIy75XfaLwhjKCEqEec1v4q/JRNZIZMb8aByEC3VoMvz266px3/NzxbqN7eHsJM7gcCAdbaNpdGIUQCQh+QEVaEoGbusQ275Ugt4a/QXPalY7MjBB2e5qOcIEMTvJvvOocv9YCSSefg4UcHba2EJACSH/cllK87KQfuZYNWS+KzJMJIKey14epeTZuOSQmMSp2M0k7uglXR13r/tLSHWL+ggaATsGZX7gQxcP3qFQ8NzO49Rd91c0iqCO4gdgd+KbRfKIAh29CiJVe9l6rFucfLY0gXCpGI1IvqDqcnDqXAYO7VPo4thhaAHqu7Vl9FOUJn9UvzQu3ogWs/bGnjYMcAy3MdPmuIm/xA/L4x7Keg2PgPPWyR7ZqDDCsESqDJndrqNiXyfrZRI9m9YO0OqG2ZVE14n+wtrF9YtPCarshAoZTWiTMwXmSat1qV3GuM8ONUwrQw2Lgv6AV+xa7JvZeVw8zWG+5LlKVasOqSqoU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzlEZHhRRjBTTG5BZmFwYWZzUnpUNkFuQUx0RVZoUTN5QlBUV3JlM0d4ZEp6?=
 =?utf-8?B?VEQzU0ZmaGRYK2JZZU44emlIc0RtOFJ0ZnN2Q3ZBcHV0QXRKUXpuSm96TzE5?=
 =?utf-8?B?UFZ6UXNSczdZc0ZkQ0VoQ0RDcUFoMDhnbmtNZWNYQzE4d01XeVFlbnBhZC9r?=
 =?utf-8?B?NzBqTHpCQXE0dkdrK0RNQXhLVUFMdTR2cFUvaERQaEVOanpXVzEzNU5SZ1k1?=
 =?utf-8?B?eDNhSVNUeHRjSkMrcE9lWmo0SmxPajliOGxTQllFQ20zeU9BLzQ1alNCb2I0?=
 =?utf-8?B?cndWaWFFdE14ZmtmVHN4djl4WGJtOUdnYjZhUGpSc1orUGd1T3M3eDFzS2dv?=
 =?utf-8?B?blBpVW10RDdnSWh1VzNlOWhGc2pZOXhGQ1czUG9XOEZENGtGYlE1R05SRTND?=
 =?utf-8?B?TnVkSUtrVldvVkJqbHpsQ0E3bGQ3ZDY1enRSNnVnSzVIU01CRDRXK1o1STVM?=
 =?utf-8?B?cHNUUzFIVDBoWndsck5taTNrN2RNVVRUWXhIVTdFc0RTOTZ2eHNXTVJqVXFM?=
 =?utf-8?B?bVJCSEdhWWZvRVlQY0FEbE5Cd1RGaTZMOTdhRHEvR2hZa0xIQXh1YnI3OFhG?=
 =?utf-8?B?MHB6OUdjdlcxQ3VkN1EvVG5mTlFSSmVLMm1TVTMxUktJbllQeEE2ai9jTHRa?=
 =?utf-8?B?OG81WkY4Umh2SXljYUdiWnJ2Uld1aFV2N2poT2ZYbGV5bHY5SWJ2WVE4YlV1?=
 =?utf-8?B?ZTByMVhLenRmTkVxcEVEeWVVSlVoMGhOYWxWMFdKeElsQUdTNTJxSnlGYVhs?=
 =?utf-8?B?Y2U3M0hESG5XVWJGeFNTMmlrUnA1K1hmbGI2cHJmWXdiT3lZZDFHbEpRcGRY?=
 =?utf-8?B?NXBkNngvVTNaM1BFdHFsd3ZEMTV3Y1QxRWRwMENvRGJzRlpqNmQ2TUxoY2px?=
 =?utf-8?B?TWh5MmVZdHNabEdieUxDS3U2QU15SUtOMmdQeWFUSkJLblcyTVlQL3Jzb2Zp?=
 =?utf-8?B?SVpaVzY4K2ZyM0xOYXg2S2NSNEEwaUVsUSsxUkNYZjA3K3d3UGN4WGgxYU5y?=
 =?utf-8?B?VHFvdkhWaytMcHY1MWtSN2xTRk5kTHM2MGtvVHJhOGxia1Q1ZVZQZ1B2V0pp?=
 =?utf-8?B?N0x1RHQ2NGZtMmo3TmV0ZXlhZVV3Y2M0SzJpWDJraWxKOFpPdXlNU3ZESHQw?=
 =?utf-8?B?MzRLVUM3QzNRVUR5cnNneUhOSXB5UEYzbW5OdzNLR2tmUi9yOWVqc1dTVjli?=
 =?utf-8?B?VWQ2Wmc1MmhFL1Fhc1pFQ0xtb3h6dUZtVkxDdXlMQW9aN3REVzlJN2thK0lM?=
 =?utf-8?B?QU5tcXRnSndybHhyOW9FaFhXdjl1My9PcitPMDBQWHNOUHovNnhkMmdCNlo0?=
 =?utf-8?B?UjJnZDJIdWxkYURqNFJMTnIzOWdkVUhIVGxLR2RMbi9QZ09wS05Fb0VHY1ox?=
 =?utf-8?B?NDhoN3JqUEdKRWp6dU41Q1ZVdnVNR2RHYUVEdUViSVUwQVhwRm9YVk01NmZ3?=
 =?utf-8?B?cS9zb2R2MzFnYUQ2ZnZ4Q0thWDF4QjlPWktjYzJQeVZDTEVxcmtvM3J5MEF1?=
 =?utf-8?B?c0V5blhSbzFBQUR4NGo3VDd2TU1wVXJxSW8zOEFoampFbm1uWURZaEhDZ0FO?=
 =?utf-8?B?bGFBbkJsa1lEbllIdFpIWFpHS3lhY2RWNEdmNmxDT2VBY01xMXRxVklKU1hn?=
 =?utf-8?B?OXkvd1VUYXhoSHBnQmVwcE1XbFZVRGhpVEFPSWNCdjhmK3FpWHNoeCttLzJr?=
 =?utf-8?B?ZlBzbGhyN2pRMVAxOU9OZkVpdjM0MTVIbHUwMldCRDNkczIrN3EzZjMwNU95?=
 =?utf-8?B?MnZNY0JJWGNWM1A4L2tFdmRQaGpuNHRMcDBhTDZWRGwwalR6dldxMENrdmxS?=
 =?utf-8?B?VWIvTlVTRTlWcG1HUXg4QThRZGx2ZmtWb0d6UUNwRDZxNDBhUXZxc1hBMVdP?=
 =?utf-8?B?cHRPd2J1RHloR0lxRnIvZkxaU0hvMFVVRE1abFRMZW1VVW5qMkNjY2dnUW9O?=
 =?utf-8?B?VncvbjFmb0tNSFQrZFgvUEN2MkZJakdvQVkrZGZ2UGZ2U2ZDa3ZKNlRzakZM?=
 =?utf-8?B?R2t3YVhpdVlLZVorWTE1eGJpcjVjaU5TZ09mRzVzMWdJdlNsT3U5MjdlUkdr?=
 =?utf-8?B?WTBZQ1dlMmZhUDJUWHRqYWhVV1pxUHl2TVpleDVTMGFIb1NoV2F0YXZHRTY1?=
 =?utf-8?Q?OgdRilFVeSgkNvB0FwKblsvfr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df11bc1a-7536-48bc-94ec-08dc444212d3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 16:16:15.5784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/7d7OKSt4QwDgscJVR50QJ5KkBIlZpMqkdM69itqRLJao2Jbv+poRjlKRDIiSZH6Kalt1F+7oW8CngNBvUWLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5659
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


On 3/14/2024 8:12 PM, Alex Deucher wrote:
> On Thu, Mar 14, 2024 at 1:44 AM Khatri, Sunil <sukhatri@amd.com> wrote:
>>
>> On 3/14/2024 1:58 AM, Alex Deucher wrote:
>>> On Tue, Mar 12, 2024 at 8:41 AM Sunil Khatri <sunil.khatri@amd.com> wrote:
>>>> Add all the IP's information on a SOC to the
>>>> devcoredump.
>>>>
>>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 19 +++++++++++++++++++
>>>>    1 file changed, 19 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>>>> index a0dbccad2f53..611fdb90a1fc 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>>>> @@ -196,6 +196,25 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
>>>>                              coredump->reset_task_info.process_name,
>>>>                              coredump->reset_task_info.pid);
>>>>
>>>> +       /* GPU IP's information of the SOC */
>>>> +       if (coredump->adev) {
>>>> +               drm_printf(&p, "\nIP Information\n");
>>>> +               drm_printf(&p, "SOC Family: %d\n", coredump->adev->family);
>>>> +               drm_printf(&p, "SOC Revision id: %d\n", coredump->adev->rev_id);
>>>> +
>>>> +               for (int i = 0; i < coredump->adev->num_ip_blocks; i++) {
>>>> +                       struct amdgpu_ip_block *ip =
>>>> +                               &coredump->adev->ip_blocks[i];
>>>> +                       drm_printf(&p, "IP type: %d IP name: %s\n",
>>>> +                                  ip->version->type,
>>>> +                                  ip->version->funcs->name);
>>>> +                       drm_printf(&p, "IP version: (%d,%d,%d)\n\n",
>>>> +                                  ip->version->major,
>>>> +                                  ip->version->minor,
>>>> +                                  ip->version->rev);
>>>> +               }
>>>> +       }
>>> I think the IP discovery table would be more useful.  Either walk the
>>> adev->ip_versions structure, or just include the IP discovery binary.
>> I did explore the adev->ip_versions and if i just go through the array
>> it doesn't give any useful information directly.
>> There are no ways to find directly from adev->ip_versions below things
>> until i also reparse the discovery binary again like done the discovery
>> amdgpu_discovery_reg_base_init and walk through the headers of various
>> ips using discovery binary.
>> a. Which IP is available on soc or not.
>> b. How many instances are there
>> Also i again have to change back to major, minor and rev convention for
>> this information to be useful. I am exploring it more if i find some
>> other information i will update.
>>
>> adev->ip_block[] is derived from ip discovery only for each block which
>> is there on the SOC, so we are not reading information which isnt
>> applicable for the soc. We have name , type and version no of the IPs
>> available on the soc. If you want i could add no of instances of each IP
>> too if you think that's useful information here. Could you share what
>> information is missing in this approach so i can include that.
> I was hoping to get the actual IP versions for the IPs from IP
> discovery rather than the versions from the ip_block array.  The
> latter are common so you can end up with the same version used across
> a wide variety of chips (e.g., all gfx10.x based chips use the same
> gfx 10 IP code even if the actual IP version is different for most of
> the chips).
Got it. let me check how to get it could be done rightly.
>
>> For dumping the IP discovery binary, i dont understand how that
>> information would be useful directly and needs to be decoded like we are
>> doing in discovery init. Please correct me if my understanding is wrong
>> here.
> It's probably not a high priority, I was just thinking it might be
> useful to have in case there ended up being some problem related to
> the IP discovery table on some boards.  E.g., we'd know that all
> boards with a certain harvest config seem to align with a reported
> problem.  Similar for vbios.  It's more for telemetry.  E.g., all the
> boards reporting some problem have a particular powerplay config or
> whatever.
I got it.
But two points of contention here in my understanding. The dump works 
only where there is reset and not sure if it could be used very early in 
development of not. Second point is that devcoredump is 4096 
bytes/4Kbyte of memory where we are dumping all the information. Not 
sure if that could be increased but it might not be enough if we are 
planning to dump all to it.

Another point is since we have sysfs/debugfs/info ioctl etc information 
available. We should sort out what really is helpful in debugging GPU 
hang and that's added in devcore.

Regards
Sunil

>
> Alex
>
>
>>> Alex
>>>
>>>> +
>>>>           if (coredump->ring) {
>>>>                   drm_printf(&p, "\nRing timed out details\n");
>>>>                   drm_printf(&p, "IP Type: %d Ring Name: %s\n",
>>>> --
>>>> 2.34.1
>>>>
