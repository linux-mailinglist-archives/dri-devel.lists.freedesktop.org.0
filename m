Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EBF77F18F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 09:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B2910E3FD;
	Thu, 17 Aug 2023 07:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2042.outbound.protection.outlook.com [40.107.100.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895D510E1B9;
 Thu, 17 Aug 2023 07:56:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jqXNRHVELau061nCe66QU6hAoxnGHS9zIzSbXYOOLQX8oUjNnHRbWaHxZgaX2Wbuen/NZ5bFeeFSs8wLTDSr4yZV444VLiMAlEnvEA2Vqsth1dzkoy9kiGBceavbx6UHYsbUEUiW6XLXerLKpm3Toz2sjm+QiSOTpoF3r+wuXJvIGKK/AG0vBkJKKLd770MjhLVJHZvSIjVdjj/LcPo5yqow1Caw4ESWWaAY3tsZX3Umin3ZGr6nPWDR9fcwCbRiolcsAZzItmTavVWoJScljiebFHcLwJbICS137jM9+xnnmnEKdBzWxC2JK59EMYyjuhPov3fvlkB+p+RCRimixA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fsC5PMq6i4lN0+gDVku+q0ZQlrpAkPm2LyZQIuCkUbI=;
 b=ciGiIEl0bJbMA4c14Ulzq5jTwnrSDx1K1KGow7iBqq/rglivwO2hyhkC8UnRbn7FArbHAU9tZzN1YIdOGLYp0R3cy9zG41w5dbUbjzdtSlgf2oasfWxxMGRTOjbpMEZftKgMBAb+sp7Mp9JYrWMf7sQY/T55PGZfr26M6X5m54N86QXd9DljKqpa5mwO+hib1MgKcPVRPPBX9YOdwcBQEXWwJ63TZpc0tv4/SwBesuaa7ukNACVGhcZtMxx0sC3LpGiFoGaZ1F2Y5dt/Y38wIm4aVXpUUq5MbkYKT543VmS7xmZ2GeXYEZ/mDyg+b++uLd1MVErFQVa4QLl55dWS1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fsC5PMq6i4lN0+gDVku+q0ZQlrpAkPm2LyZQIuCkUbI=;
 b=ag2B4jMu4E5N0zEPlEBZmsv2O5Rw975m3JwrKSmntK2SLf17qnTTABdGZkllVG6dnw1ZZn4H2an9bY4YwElr12Is7cWVkj8pmaC+1s9G+rRIqx7q3g28TxYD935wSFEfwlG22t6e9uAGpsDYxEjG1xQ234hWqHbKc6YRP6mNAJw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 by MN2PR12MB4144.namprd12.prod.outlook.com (2603:10b6:208:15f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 07:55:25 +0000
Received: from PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4]) by PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4%7]) with mapi id 15.20.6678.031; Thu, 17 Aug 2023
 07:55:25 +0000
Message-ID: <7e291304-da61-4d85-2228-94a1c38673e2@amd.com>
Date: Thu, 17 Aug 2023 13:25:14 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/3] Revert "drm/amd/amdgpu: switch on/off vcn power
 profile mode"
Content-Language: en-US
To: Shashank Sharma <shashank.sharma@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>, Arvind Yadav <Arvind.Yadav@amd.com>
References: <20230814073438.10682-1-Arvind.Yadav@amd.com>
 <20230814073438.10682-4-Arvind.Yadav@amd.com>
 <CADnq5_M3_N-rXTcvsQ76QGo1bjBc92SPPHfwFayNbroq-Ph_iw@mail.gmail.com>
 <4013bb32-0ab9-4dbe-7043-011051fee969@amd.com>
From: "Yadav, Arvind" <arvyadav@amd.com>
In-Reply-To: <4013bb32-0ab9-4dbe-7043-011051fee969@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::30) To PH7PR12MB6000.namprd12.prod.outlook.com
 (2603:10b6:510:1dc::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6000:EE_|MN2PR12MB4144:EE_
X-MS-Office365-Filtering-Correlation-Id: 157a521a-9446-4840-61f9-08db9ef7509b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nCHTuq/Umdqp9QtuKwDVQDEHFhQKuneXgJasUqdIrwD1QumkwNgC31Kdj/2YuC5AKGRMW3Pf6SkOJLW+m3FTVX581VwwEkqQvcAJ0ce3CNbIubijVv9qAEYPlCRPlLBmq2rOGK3WCkldCCfjNBYnN815isOB5+ZJufSnIcJS+FzPcIYY/7x2H3teja6QHRjo/r14ggPhHxI9twfNhhZNPgMl684Lp6zFa3v/+tmn8mx6RSnkMMHO/S1AQ/d9YTnyIzqHWIsdav6Wd+uui6dM72W6+XPsdwlwYS3BAhPj1IekSpnJVWDLKgcXojaq54jxg1Xi9THqIzPMQH2/kPcw7L22sUa/QFHKijZbG8raCefiMJlAuHWdmYvvq+vNdcI8jHFhAnKs/qKAi3o3uoWbnvRZq5BzDwKuHaIoVO2e499zOI7bWbz8qQvUeYe9RvKwpiZHYQxiIrJj+gC/IV+BN/7CgVtFfBrx1RxEdTUDiNniA3aa1oNK399OCIZNmVVxnKg2Zs0PEQCCa67KMickB3K1DaCJdOhtcYY4sUzBUn21p7apPyXFkEYOoni14h0j5cuvMBoDhH1uHNEs1MYooZ1Gf26SeSHU7wtCUuCuGr/7rpwuIJqQyn6y9/JhoNVFKMwAeMDmDvpw6MgWpcDwNZ8o0fhV975OMTZHZqQxHPU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6000.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(346002)(366004)(136003)(39860400002)(1800799009)(451199024)(186009)(6666004)(6512007)(6506007)(53546011)(6486002)(83380400001)(26005)(31696002)(38100700002)(36756003)(2616005)(6636002)(2906002)(316002)(41300700001)(66946007)(110136005)(66556008)(66476007)(5660300002)(8936002)(8676002)(4326008)(31686004)(478600001)(966005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2NwZzJYT0g2MzBZMjRrc0tXYmhXN2VSN29iLytFakN4N3V4cHVyanNmWnc5?=
 =?utf-8?B?ZUJxSk5tZ21lMS9LbkozNGg1aUFQUlJYT2VUV01hRW83TTQraExsVGxXWUZy?=
 =?utf-8?B?WWJZMGg1ajNzbE5OUVU4WEJ6R2tSWmN3QkZxcVMydTBadDVDTEJmSXpVTDAw?=
 =?utf-8?B?bWFmeUM0dWVUc3pxQmtHWlRIamxpWEd5YlpJdC9YMU03WFNMRWdsU1AwN3J4?=
 =?utf-8?B?K09IS2lJS08xOGF4d3ZWRGNRTGp6TDZ0amM0OTVLbEFRL2JrMjE4V2FLYmo4?=
 =?utf-8?B?ZklpMVJXS2t2MUZwNndsZW9ZeW5JUVlMYkU2VUltbHVBdkxLSDM3ZVZzTW5U?=
 =?utf-8?B?VHdZRGpRdTF6TTFaSGZaaVVSN1dXYmdmcTRHN2lwdlF5TXc2THZoU2YzVWJa?=
 =?utf-8?B?Tk92UGNwb3pwTTMxRFVua082dDFWY29yRENzcFJKN01YSDZveisvQXpSbVU5?=
 =?utf-8?B?c2RSTnluOVYxLytMV04rSDNGR2pZbDNQb1ovZit0Zys1WmdzWnJNTTlKcU1s?=
 =?utf-8?B?YWNPSmR0QXo4Qi9LSi96RklXK0swUDZXZTRlZ0pmeTMxaTFrV0w1Yk1YVitG?=
 =?utf-8?B?U25Xcm9jZmp1Q1MwcDVobnFMNjJ4QzdsbDV6SExaYmd4SUJqY1pNRlJaRVNy?=
 =?utf-8?B?RjM0R2czTTRUZzFOQUQyV1ZKbWJINW1YM0k0M0JjeWxGN1BCdkFqMGlWclR2?=
 =?utf-8?B?akRaNzF4cWF4Z1FKSHJ4SjBIeVp2QzNDckQ5Z0c3VEtKM0pRUGFMUE1qcVlo?=
 =?utf-8?B?a2pidVczZ0t4bXYzK0h0Vy8zN3hjNURuM081L2VQOHRETUNKRVRTMTVMSWxk?=
 =?utf-8?B?ZndGODA1Z0RyWWdHaWpleGlRdlJ5YTBnaFgxY2lFbXpJRUo5eldZcFBEaWZT?=
 =?utf-8?B?cUtyVlVrOTdWbXlOYzBXdXZNekpSOWJKUVhFRTJzaDBmMG1qczhXWEpNc2Z4?=
 =?utf-8?B?U3NiNU9tRng1T1pNVDVHTmd5WjE4KzhCeHY2U0ZoaktCUlJqZE54OTY2b0Vr?=
 =?utf-8?B?UlhmUGtWaGxIeTVXRmc0bEt4ZTd6N2hsK2gvQUZyWDI1Z281MEsvRFlWUEdZ?=
 =?utf-8?B?L3ZzSXNGRmxsTGw3eURKeGdmWW8xVkdSNmtabzl1SlpYVlRwY0FkcDNnRTRl?=
 =?utf-8?B?dkNCcTEwdlh6cHgzZlJMRlNBUkdOOS9ITUVBeVRUMDNkeFR5c3NyL20vdFJ2?=
 =?utf-8?B?QVJkN0ErQndxR0tlSFBSTVJldHdDcGVvbmtzaDRwdXY2RU9oKzMwODVOWWVR?=
 =?utf-8?B?VXBzc1pnMzd1MG92YytHemJIV3h5REdtVHQ4NGZ3MEZiWWZHeTAzRjdzZWho?=
 =?utf-8?B?KzdjZUpsdEVOTVZFelBCOXdxdjEyaXZ0ak01L3hHa0d4N0R2Z2hER3VkNnF0?=
 =?utf-8?B?dlZDQWVBZ0tVeGptcXZhcFcraXR1bmtyUzVuaEdMbklQdTQ1cWY2ZDZoaXBx?=
 =?utf-8?B?TDVQZEw4MEdkN1dXK0lpVkNlL0dwNmNpR05pTVdtWkdQUWZQU0xXZWQyWmpy?=
 =?utf-8?B?cFdEcTQ4TjFFZGpvaUtVdVNteitHTkU5MkRaU3R0UWVocVFkU1JqeTgyWXFU?=
 =?utf-8?B?QUV5bWt5ak40OFFwRG54ckpQWkRmd2ZaRnR0OU9PN3F3MXE3WTNqVkUvdGxC?=
 =?utf-8?B?TkNOeGZFRUdjN3pFZXJseVRtQkNyeWJaMDJWa2ZYK3hEM3BwdjFsN0hxcmhD?=
 =?utf-8?B?aFRmWXRRNEhGU0dHdkQwRzc5S09tK1ZKNjhYWWl2Y2xDTmV5Zis3QnA3WUJy?=
 =?utf-8?B?b1BaTi9tdW1sd29FVk5EK2dDclc3QW5RUHU2cEIzbmVRSnc5TkE1YW1iOTZn?=
 =?utf-8?B?T0l0TWdNYUJtT3VtRHlyZXNNSDJQTkc4VUNPQkY5bDlocm0yTUIrU2xTZzZN?=
 =?utf-8?B?WG1LZGhnbThpdGFRY2tka2hvaFZqVzdHM2NqQzdBbkZ0b1NMVC9sT1VJZDdL?=
 =?utf-8?B?RVdqWHlTcURtci9hRkUzeEtmbzc3ZERaN2J1azRIRURlbVBjaERFUDJHZTg3?=
 =?utf-8?B?SDdJM0JGalQxZ2xUWnFhOWswZWc4SXQ5Sk1Fa3NvNUlzQnF5VHJFbm1Xck9i?=
 =?utf-8?B?eEVEc09SUUsvOHFiaWkwVHFROVJ5OVhRQjF5dndmVDZwckJNVEpkVUpQTmd0?=
 =?utf-8?Q?fSD9TjZrKEdSM3XHSCfBQHGyw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 157a521a-9446-4840-61f9-08db9ef7509b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6000.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 07:55:25.2959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8iL45/+6DtwoHf+vK2Dggw2wl7cv8XM79qBAkd3ICBVNBNjqYc/2AddKv90CH5VqKZLEl6D+f5DZq8MKCCdhzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4144
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, Christian.Koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/14/2023 9:35 PM, Shashank Sharma wrote:
> Ah, Thanks for pointing that out Alex.
>
> @Arvind, please refer to the patch 
> (https://patchwork.freedesktop.org/patch/504854/?series=109060&rev=4) 
> in previous series of SMU workload hints with UAPI (here: 
> https://patchwork.freedesktop.org/series/109060/)
>
Thank you Shashank and Alex. I will handle the KFD.

Regards,

Arvind

> Regards
>
> Shashank
>
> On 14/08/2023 17:20, Alex Deucher wrote:
>> KFD also changes the profile when queues are active.  Please make sure
>> that is properly taken into account as well.
>>
>> Alex
>>
>> On Mon, Aug 14, 2023 at 3:36 AM Arvind Yadav <Arvind.Yadav@amd.com> 
>> wrote:
>>> This reverts commit 5ce71f59bb9bd3d8a09b96afdbc92975cb6dc303.
>>>
>>> Reason for revert: New amdgpu_smu* api is added to switch
>>> on/off profile mode. These new api will allow to change the
>>> GPU power profile based on a submitted job.
>>>
>>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>>> Cc: Christian Koenig <christian.koenig@amd.com>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 14 ++------------
>>>   1 file changed, 2 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
>>> index 2d94f1b63bd6..70777fcfa626 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
>>> @@ -363,7 +363,6 @@ static void amdgpu_vcn_idle_work_handler(struct 
>>> work_struct *work)
>>>                  container_of(work, struct amdgpu_device, 
>>> vcn.idle_work.work);
>>>          unsigned int fences = 0, fence[AMDGPU_MAX_VCN_INSTANCES] = 
>>> {0};
>>>          unsigned int i, j;
>>> -       int r = 0;
>>>
>>>          for (j = 0; j < adev->vcn.num_vcn_inst; ++j) {
>>>                  if (adev->vcn.harvest_config & (1 << j))
>>> @@ -392,10 +391,6 @@ static void amdgpu_vcn_idle_work_handler(struct 
>>> work_struct *work)
>>>          if (!fences && 
>>> !atomic_read(&adev->vcn.total_submission_cnt)) {
>>>                  amdgpu_device_ip_set_powergating_state(adev, 
>>> AMD_IP_BLOCK_TYPE_VCN,
>>>                         AMD_PG_STATE_GATE);
>>> -               r = amdgpu_dpm_switch_power_profile(adev, 
>>> PP_SMC_POWER_PROFILE_VIDEO,
>>> -                               false);
>>> -               if (r)
>>> -                       dev_warn(adev->dev, "(%d) failed to disable 
>>> video power profile mode\n", r);
>>>          } else {
>>> schedule_delayed_work(&adev->vcn.idle_work, VCN_IDLE_TIMEOUT);
>>>          }
>>> @@ -404,16 +399,11 @@ static void 
>>> amdgpu_vcn_idle_work_handler(struct work_struct *work)
>>>   void amdgpu_vcn_ring_begin_use(struct amdgpu_ring *ring)
>>>   {
>>>          struct amdgpu_device *adev = ring->adev;
>>> -       int r = 0;
>>>
>>>          atomic_inc(&adev->vcn.total_submission_cnt);
>>>
>>> -       if (!cancel_delayed_work_sync(&adev->vcn.idle_work)) {
>>> -               r = amdgpu_dpm_switch_power_profile(adev, 
>>> PP_SMC_POWER_PROFILE_VIDEO,
>>> -                               true);
>>> -               if (r)
>>> -                       dev_warn(adev->dev, "(%d) failed to switch 
>>> to video power profile mode\n", r);
>>> -       }
>>> +       if (!cancel_delayed_work_sync(&adev->vcn.idle_work))
>>> +               amdgpu_gfx_off_ctrl(adev, false);
>>>
>>>          mutex_lock(&adev->vcn.vcn_pg_lock);
>>>          amdgpu_device_ip_set_powergating_state(adev, 
>>> AMD_IP_BLOCK_TYPE_VCN,
>>> -- 
>>> 2.34.1
>>>
