Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C045B9B87
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 15:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBFF210E1D9;
	Thu, 15 Sep 2022 13:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8C610E1D9
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 13:02:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S44IO29LXChgIFRZ3+YBtxfHelFwLhPDtk0zJA6DHj9L3jzEyC/aeVSiaGAeZLxlNYbc6NLPnXzvBVnXBh/LhxSqXGx1VSmOZyblaV7hD4NOt3DwZJe+DBGzC/mSCS6vK4nMiy1e54L3fYw2H9tjNalmK6JcPVyYPGg3+1xCzilpohevnb2EpN6bLd3jxmFou9jcsDzhlA4n9fBjV3JDVkB1fmBwIpuQLaSKIGoi0+wnx0+cW7aozU4/HqE9BbidW1ln5TCljADEHMCQQosaoJvli+aaU7DgEs7vulr70KFAgRLSLjiJWJ9DVExzJK4sdozpCgdcL9poJ1o1LfvusA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHijfAmcMfvhMpPyczP+6RURxnG9Et4KI5/zKs6gDik=;
 b=katPyiEXeDb+lQv2Y3CtaP3xvpB/bw6WF2FjDY69AqIMyR+A3i9LfqYFuh9Rwc0lsZr3/+kc2VOgRnjOMR/HjFKhhCInyZsN08BCVBRhxPhiCHSM6GTJ99HZZPF/0aUqdUwpJBLrjWKfEbWjwpMkFxl3v/Bl52KAdSb1BR8Xey/FUHnn9a1Een0FALl9vDPGjb7oSB0Znq9y/Iq0Aivz5QUJPyrFMtNpNBywil3fIVQyWhM659z9frHQB+PI6/OpwsnxeyWUKLVZRzznq4xa1CTfSFGreZQCFxX4CbqArhvXtzm0urCEQ19Yg1bQdVS2LWsubGmmEkYVJF3V6FJgxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHijfAmcMfvhMpPyczP+6RURxnG9Et4KI5/zKs6gDik=;
 b=EvkjJ0yYx1NQhuAuXS1jNWawbNVuTEiEfPOcfPw1DvQIe5zfPKGROYuESo4T49OmB3vdAnUpW8g+gFtAIVdPsXBrBTXk4kHiOP7I4z+8gqbIQGVfDBY7re+6X7orUEynTzveciABx5Jkfi+hwqWM5r2CafoN1y/O7yLcX2tJmKg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 by CH3PR12MB7594.namprd12.prod.outlook.com (2603:10b6:610:140::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Thu, 15 Sep
 2022 13:02:29 +0000
Received: from PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::c6b8:8664:1f55:1597]) by PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::c6b8:8664:1f55:1597%7]) with mapi id 15.20.5612.022; Thu, 15 Sep 2022
 13:02:29 +0000
Message-ID: <33a16b15-3d3c-7485-d021-ee2a727e5391@amd.com>
Date: Thu, 15 Sep 2022 18:32:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v4 0/6] dma-buf: Check status of enable-signaling bit on
 debug
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>, andrey.grodzovsky@amd.com,
 shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
 Arunpravin.PaneerSelvam@amd.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, airlied@linux.ie, daniel@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20220914164321.2156-1-Arvind.Yadav@amd.com>
 <d2d81ffd-2269-bdc6-0daa-8f3a99306e46@amd.com>
From: "Yadav, Arvind" <arvyadav@amd.com>
In-Reply-To: <d2d81ffd-2269-bdc6-0daa-8f3a99306e46@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::13) To PH7PR12MB6000.namprd12.prod.outlook.com
 (2603:10b6:510:1dc::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6000:EE_|CH3PR12MB7594:EE_
X-MS-Office365-Filtering-Correlation-Id: b747d3e1-6ef1-4ec0-20b3-08da971a8b8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V94hBqun8DlrGAFqVyQivrOviZl7GNFnonhuCE/Kk7/3qa/F4p6o1faDrw/vlT6jbeytC5qwrn3DEjaHQeGIWjBG+qat7Qn2g31iDXgOK1AZBhRbelYcmlL6W2B99EiJXFnGyrSV34KFP3daYm902fGpx56AGxVPiIHzdyzOdMOicw0rzMc2M780AzhQDalqncj/tulwt8RJFyXY9d5RWbSQ8PKqK8eh+Hj0svwKOOWDMg0GX3dq7SbKqDaCEy67psLXHkRnIjf3SFEH/jhIhgG9XqAaLH3PX6SfLwhHTwt4IHdSe4asjfhM6SGfq5U9UCSvvWwevX1x7KiUoX3jkSZqPFJjwTnnslmE+XHDI0gmZ2UNJh0lAMsDj5cUlQ1sLWDAiSlYaVGCwBYVTbTQpOGhLrKvw2XBcm3MLadZP7EDiKaQs/X8ryq1f5jJcj/TqdSAJhju3e6kEaZ182Da7PCqGjeGSYnmsifbPeIT29fGZa5m7CO2omogdQehU0a4X8qn/fvcwVaoWeHjF+p6/Bktc9MjJopGUBue42XaGtmlLYe7ofd91Xc3a2GEfwMmmqfdDVMbcngNVp8n1jBzkaiW7HLG1KCR+aJTxpW7/a2Egl+4DdYayqhlKe4ghfH3BYHx433DXoMr11k0Is3R6JodqvIDlfaecsxghr6DdJkEpGvc3GqOqGwb58myfD3GbIgRFNvaLsMHHjJc+ibquBSUXhYy3/4ivp5axyTQrV7CayG1kykRByWuumjqLOJ9uO2Kzg8wX87CLnUcaUJvLSpOa46JF7/0nsOLzfiKsKhEm/fihDROjxNbcTHUjpTu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6000.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(396003)(376002)(366004)(39860400002)(451199015)(8676002)(2616005)(921005)(186003)(5660300002)(6486002)(83380400001)(6506007)(38100700002)(53546011)(8936002)(66556008)(6512007)(31696002)(66946007)(66476007)(41300700001)(26005)(6666004)(478600001)(36756003)(316002)(2906002)(110136005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wlg4dXA3dmwwL3pJWGtzYmpWT2NXRVd6U0Z5aVdhTjM3NW5wM3lDL29JUlR3?=
 =?utf-8?B?Y2NKN0NLSURIeTBWWVd1TERJTVFBeWtLcW93Y0NSUERzNmgvVjE3NXZSbk9l?=
 =?utf-8?B?bWo3aDhoUzFnMTQ3bUxFamRBV2JUVXlrWlBSUVJRMngyVDFOZHJEL2pyM3lB?=
 =?utf-8?B?dExoMzNBVHFaVVJLaHcxdjlhQ3BPRms3UWpHRDFQWEo3bFhDYy8rUG01bG55?=
 =?utf-8?B?WVFUM1hkcytjSDZoM3YzUE1kdCtBTjhDMVFHa2lsUmpBN3NaOUpjNnE5VVkx?=
 =?utf-8?B?SWh1dERJZlF3QlV2Yk5GU1B0cnNCTm5TVThob2k0cU1QUWhsTnhPNGUrR0ZZ?=
 =?utf-8?B?VW5DL3JkQXhIWStWTWdLRXVoQmIySnhOazQ2Rm9qVnZqVjY0NTRnd0dIdkly?=
 =?utf-8?B?bFNJS0VSeFBTVHg2M3p3am5Od0VpbTdXT2E4cFBQcHlIcWFreXNpUVBaYkM0?=
 =?utf-8?B?UTFxUlJuWG95Z3RESHBQdFk3ck5HZTJta3krUlFiWkRCMXA0d0xPVDhLVDM2?=
 =?utf-8?B?VVgzbzJxM0VITStNNEs4VGtnTzlMUHVXZUd6aEl5MFZSYlR4TEQyblFHNEZS?=
 =?utf-8?B?aFRRZ1dTZGJ5UzU3OVg5WW1xZm12aGxHVEVnLzBESzZuVDNKWlhtTnVnUzQw?=
 =?utf-8?B?Y0Y0b1BHbmhnNUFubEJheDhKWUhjcnhpNXk4UzEzdytTSXE4NFRTQWtEd015?=
 =?utf-8?B?SXpia0V1bHpCQm5FcFVBaVBja1hISzBpRm1ZUmpVV09VNXYvbFZ5L0N2RzJY?=
 =?utf-8?B?bjJ2enkyYndvVEc5RXhtZlJhL2dsNzl3WllYZHp1aEt1TEgxVk1CT0RzRFM0?=
 =?utf-8?B?dlVVeVNzWHBMRlZuMy9tajVWWHRRMkd2bzFMek52Vks0NjRIYkpzaEt3Z1Q3?=
 =?utf-8?B?TTlLRTljSEVWYXlQaWIrUU9pa1JYRVdsVEpZQnJUYW10VmwxZmlGZzJKZm5v?=
 =?utf-8?B?VzcyUWVGSVhtajNSY1Z6KzlxSW1RNVkwUGZiZDdhNWVrWUd6WkpoOVpMRnUv?=
 =?utf-8?B?VU95UmU1WGpGS2taNDA0dGhQd0JtV2laT1UxMTZXenBmR2tBbFEvUnFmY3pi?=
 =?utf-8?B?WHRYZDd4c1B1cFlKVWxqRmNYRkZ0MHRqT0tHNEk3NlhPN3FYVzFyQW5LVjFL?=
 =?utf-8?B?S0RaaEF0eWhEZUh5SWZLVzFhSmNseW5BNWJoUWJsYTNoSkpEWlcxWDFCZ2l4?=
 =?utf-8?B?ZFhjKzFSOWhpNCsydzlsVFhGR0NpRlR2a3Z1ZmdIMnAvanRDT1l2MUxockdx?=
 =?utf-8?B?UmJ1T2JuK1BFNmRzNms1eVA3aGVVVWhUUkpFOGFFcWF0ZVY5eFhJSFo5Nm8v?=
 =?utf-8?B?Q1ZnWHRjN3NWNzhPTjBaNG5BUGRuYTFXVDduWi9Cc0xWWm1mZlNmSGFlNEdG?=
 =?utf-8?B?clJtcHp1OUo2cEY2clZXRjZYTEx6YmtqaXhHOFFRNFJycFhIS1VzalFqcCtS?=
 =?utf-8?B?NjF4SkpPM2l2eEdBQXZsM2RGWnF0UGhCdmMxdkVwWFl1V3NFdjZwNFFMMFVY?=
 =?utf-8?B?TTBrbFUxVUhOSzNCL3dvRkJ4U1AzREJ6L0dhekhHbGR0UlRndlkyY0JHdGdv?=
 =?utf-8?B?b2pxQ3F5KzQ0bGZXY0tVSnc0Rm9ZMENjamJFZC9kM0dJQndNN3FZTUlVUk0v?=
 =?utf-8?B?aE1KazhXNk1Sc2dFQjhwbjlsUytySGpsUklsUGVaVkZmZmQ0SThBVE9YS0Zj?=
 =?utf-8?B?UC9MaTB6SG9RSVdRaHd0MklZcVFXSlpyZEVGaXZzT3l1MEhZTnIyTFRhNmFj?=
 =?utf-8?B?MmFpanZnbzdaVEswVVVNWjZ0ODltaGFpMXMzY1FnMHJBNXkydHh2QnJYZkhC?=
 =?utf-8?B?TGtCOHg2Q1E0OWx5WkRmU0hNc1h6am9hbk5YZTVOWU1lUHdsQ2ZTZkxjQkdz?=
 =?utf-8?B?Z1QxcDU2NXBHM0k5RFdla2Fla2NUTjJIQ2dxK08rNlYyTjZzbmVVMHRkQzMv?=
 =?utf-8?B?SC9iSEJ2elJKcDVGK3doMXBWem9KQ1MwSHp3anViTkhKMWQ4TXU3elJyTklC?=
 =?utf-8?B?UWdMZ0ZUZzJFVnhsaFdQTUpPZU9OYnJlcllSVWlBNUgrUUNQQk9tZEd3ckMw?=
 =?utf-8?B?Z3NkekFxc05DaE5BbFZPVU9oeFBVMW1iMkVId0puRzUwbUdFNHhzQ1g4NlFD?=
 =?utf-8?Q?TUG6ypCsG18ACupC72kloYhqd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b747d3e1-6ef1-4ec0-20b3-08da971a8b8d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6000.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 13:02:29.6321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ubKWzkS7GyYyBqe0Xt0AJ7g5x/EXbsALZCQzHs42AvHEmn+nD0uswTkjBinZTYkfRpZ6blAjIDBAbaNts0Cw2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7594
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


On 9/15/2022 5:37 PM, Christian König wrote:
> Is that sufficient to allow running a desktop on amdgpu with the extra 
> check enabled? If yes that would be quite a milestone.
>
Yes, It is running on amdgpu with extra config enabled.
> What's left is checking the userspace IGT tests. Especially the 
> sync_file and drm_syncobj tests I would expect to have problems with 
> this extra check.
>
Yes, IGT test cases are failing .

~Arvind

> Thanks,
> Christian.
>
> Am 14.09.22 um 18:43 schrieb Arvind Yadav:
>> Fence signaling must be enabled to make sure that
>> the dma_fence_is_signaled() function ever returns true.
>> Since drivers and implementations sometimes mess this up,
>> this ensures correct behaviour when DEBUG_WW_MUTEX_SLOWPATH
>> is used during debugging.
>> This should make any implementation bugs resulting in not
>> signaled fences much more obvious.
>>
>> Arvind Yadav (6):
>>    [PATCH v4 1/6] dma-buf: Remove the signaled bit status check
>>    [PATCH v4 2/6] dma-buf: set signaling bit for the stub fence
>>    [PATCH v4 3/6] dma-buf: Enable signaling on fence for selftests
>>    [PATCH v4 4/6] dma-buf: dma_fence_wait must enable signaling
>>    [PATCH v4 5/6] drm/sched: Use parent fence instead of finished
>>    [PATCH v4 6/6] dma-buf: Check status of enable-signaling bit on debug
>>
>>   drivers/dma-buf/Kconfig                |  7 +++++++
>>   drivers/dma-buf/dma-fence.c            | 16 ++++++++++------
>>   drivers/dma-buf/st-dma-fence-chain.c   |  4 ++++
>>   drivers/dma-buf/st-dma-fence-unwrap.c  | 22 ++++++++++++++++++++++
>>   drivers/dma-buf/st-dma-fence.c         | 16 ++++++++++++++++
>>   drivers/dma-buf/st-dma-resv.c          | 10 ++++++++++
>>   drivers/gpu/drm/scheduler/sched_main.c |  4 ++--
>>   include/linux/dma-fence.h              |  5 +++++
>>   8 files changed, 76 insertions(+), 8 deletions(-)
>>
>
