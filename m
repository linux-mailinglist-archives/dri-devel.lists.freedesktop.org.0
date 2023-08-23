Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5243F785FFB
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 20:42:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76AE810E0B8;
	Wed, 23 Aug 2023 18:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2052.outbound.protection.outlook.com [40.107.93.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A868310E0AC;
 Wed, 23 Aug 2023 18:42:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDfqGVy8nS3tPQvIhobMgm98BWxko4nMuq1vrOHSPa2Tod987/BclyGMw1Disjm20CRap68WXRH6ZNqWfZlDnxsVm6cQrZxceZwtSMemz0Xp+O3jXn7YfJ316irIVRGNo5XYNo0BPX527CttBoLGLSAtsqIDEsEYOxYgl8egt3krmOKNJSdW3ZWv4iB+RCNPp2mvGIN4LvX+uVYQLKG7IJx0kELpJdp1beVrw1SQvF1E9yN86E8mmzItQaas8zEpIq1WUO+ilT+RqjTkg8yeacjNS23XjHblSOQDlpz9xZ/k6JsrGCycHL0PwxzKgotL/lfKiPciNrFzESW6x5egLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlovRfZcSc73bNd3dylrPUO0keD+KzFpiPUi6TbF8sY=;
 b=Cgy6kV4+lLzfXTjVd3k7klofbnJ6+L+cOM2oyhql2/PPHEYiqqFMG+Ef/mfakoSr5wMfW28R53sfPnWnO3DwaNUL5e6bEtbGEVohsLaMh+XX3/EX9AhrToaBuejtf8XgOI8lm308fj7kWxx9ZXX9Uq2KDvrg5wmv9gtjryjuRMDHLaNzikONqAlyAcORlIeN4T7cXbEpuEycMXxY/uGywzKm9hEI/yiSFk2V7bzMaZW3OUJPnFA42mSD4sFs4j34oFxzZbBXKbBgyJ6GHiGw5uz7PLYdyhadffjFDebaC0WZT0i4B+tpXkCCDy+Ck9Z8sz6XUE+fviFUIXaocNVI3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlovRfZcSc73bNd3dylrPUO0keD+KzFpiPUi6TbF8sY=;
 b=vq6EsHnWUd9PFIQ2FAYghZNt1rvK9w3Bg/Ka6KMUfb9VffSfOJhgDnP9g1eUqXw5EBiPPbzUw3g+wx/mEqVl/MpDT7JexhzU2XdgeaytdOzdMBKn9AUcLJV4Fi15euAoLOvCRNsWn2yeba1FzNXtZisTcfEi8arW31jO05oL43M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SN7PR12MB7420.namprd12.prod.outlook.com (2603:10b6:806:2a7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Wed, 23 Aug
 2023 18:42:28 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::ca28:efb4:a838:58fb]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::ca28:efb4:a838:58fb%4]) with mapi id 15.20.6699.026; Wed, 23 Aug 2023
 18:42:27 +0000
Message-ID: <a2ac9bbf-b898-1c74-865f-5fea3c580559@amd.com>
Date: Wed, 23 Aug 2023 14:42:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH AUTOSEL 5.15 6/6] drm/amdkfd: ignore crat by default
Content-Language: en-US
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Sasha Levin <sashal@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20230822113658.3551550-1-sashal@kernel.org>
 <20230822113658.3551550-6-sashal@kernel.org>
 <BN9PR12MB5146C0787341AD0E46FBAF2CF71FA@BN9PR12MB5146.namprd12.prod.outlook.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <BN9PR12MB5146C0787341AD0E46FBAF2CF71FA@BN9PR12MB5146.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0031.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fe::15) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SN7PR12MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ae0206e-bbd5-43de-bd79-08dba408b13e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gaMJ+rBlqDu6bIKwkunzoHtFJPyz0JTV/gRLsl5Xb0IsQGIDpMWUFvaQTeTP8j7p2sFWM34sHD8QfLdU6dlnYPjKswRtc0qQ+bh0ONbbvFOTuPN5u2oYS9+aHy1HZOXvwWGWWBZpzKN9WnMj4sBQIxgqQzcJeQVu2MAM863MGzV4N4VS3tYl/+hAMuiT2y4Vvy/W2VW3nWX9pZwBJmAhhiP9fWYg3i1sZqjtbuT+Qjs1Yc2MXXiUEu0rgCgl0Afs+nUPiPs+fBpps/PsanV1GRc31koCkAxTcG2jUwnEQKKfUeBJzt/HoK/pHzUjQqJV2EOBM5czMEmM+YKB81VOJIhI2OI6iiReJV4NmDHSITwXKtAgLd1dHSGlBkaxx0bpfREAch6EaGk/LGWQLSNTwmkBsi1OgmYvNz/wMDY0wm9MqyrGDLPGLEGAqRlRPDwQ5P+qeIw+zNgAEfGWQnceOZPSDabLM5PH4t3GFrP1+SOneoz1xc0H12KrorX8mhhrC95zjz5u/dG8gNYrGMLFrglqTUZwTVFmwnm4Pc7OufSZcokF0kx+H4xHyDsUongn9BQG3xm3Y0SFQhZagaTHMEK/wHzUZwrPH+7HmMBrwrtbOVoHLh6BqZ6cQWkXEm1nHAypArtgdeqlLIoj/qlBkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(396003)(136003)(39860400002)(1800799009)(451199024)(186009)(2906002)(66574015)(83380400001)(53546011)(6486002)(36916002)(6506007)(5660300002)(44832011)(26005)(31696002)(31686004)(86362001)(38100700002)(8676002)(8936002)(2616005)(4326008)(110136005)(54906003)(316002)(66946007)(66476007)(66556008)(6512007)(478600001)(6666004)(36756003)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjM3VXkyT1l2TkdDTk1HaCtJZ1B6bG90d0ViME1kSE0ydStXcE9WbGZKT2hi?=
 =?utf-8?B?ajVGU1l5OEs5dWUwNjFZclMvaEtZQWVURHRpSUYrd01pTkNiUzhjT0hPMHVu?=
 =?utf-8?B?RCtQSmZLNTc2czBKbzd5REZVVnZUZTlySEFuakJZNnhYRkZrZE13ZkhNckxM?=
 =?utf-8?B?VjdGRUhUanV1V3pjSi84OERhTndHUEZGNWhrZWdKQjhVWm10SnFBMm1QdlFJ?=
 =?utf-8?B?dTBJVUZERXg3YXhrR0lYeFpGZDlDUndlc3dOaXI3ZTF0aFliQTA2cjljc1Uy?=
 =?utf-8?B?ZmF6VndxeW1vbFhFcXljcnYvODlTQXBlRUNXYTdMN3phcnVaOG1mazlocE5r?=
 =?utf-8?B?ZDdlWlcwNDlBNTVUeXpUNGo5dlNqUHhTbk5MeUMwUnVsVktkN1BVZlRRWEJq?=
 =?utf-8?B?WXYvUDVGaW5GcmE3UE1IclQ0OUVMVDRXaDVUU2ZyZ1hobloxRFdCRGNxS2J4?=
 =?utf-8?B?Zzh6UHN4ZG5jVjdHV2p0Y0Q3V0RzNWxkcUZDSnZhbmtYV3RVUzNHVEljUjhx?=
 =?utf-8?B?NGhRTlNycGRkT096dXNPK3R2dFlkREpLekZCcWRDYWdKbjc3cmRwTjNVZG13?=
 =?utf-8?B?UnYySjF4b2pCNnBQM3ZnQ3BiRHorRGZmcHRMZitESG93T0ZxdmJwSS9WUTl4?=
 =?utf-8?B?WllVeXJCT2tkR01SbUNMQWQ5YXluamdScmJuZWZSYnBtUmRiclFsUUpnR3V0?=
 =?utf-8?B?L1Y3OFFMbTZZTFZPWW5QdlZ6WjFtMUs0azRQZW1jMjVrZU00cGJSRG1NWnR6?=
 =?utf-8?B?MFJEU1VudEJybTY0SnRjbHhlcGE1RlBoUVNubGRBbTZDWUZHc0c0UlZXVmtK?=
 =?utf-8?B?RWVzMnVmeEkwc3RTYXcxVmhEZGUxSUtnTWhOMWhmd1NndWV3eWVmWXI3UCs2?=
 =?utf-8?B?MUo4anZhMDlaL2NTU2Z3L0hmTVBqQVR1QXlBL2NZaFVNKzYvZnVDeERxdjdH?=
 =?utf-8?B?TlB1MnlPZUZRSkVncUUvaml3TTZrd0crZGg3WnlpclR1RDlMSWFiaXVyOFdN?=
 =?utf-8?B?bUY2bDM0T09FVkJJT2d5OTNYRENBays1SngwcDA5L0RFVWxjS0RhbmhEZEM2?=
 =?utf-8?B?SGVYVENoSS93WFBBRU1JaUJUM2owQ0ZqbE81SDJHSUVDTUs5Z1dOY0h3NHRL?=
 =?utf-8?B?SXB5T2FEYzBiQmtUTWxQcGRLNjA3WUlZZDRQeWxYbHErMm5KczBhek5RZmVk?=
 =?utf-8?B?L0Uwbm8zbmxuY1VTK2FFZVhYL1JlcWo0RlZHTGMrWUFQRVYySXhuYVpYVFkw?=
 =?utf-8?B?OEtTMnd1dS9KN3ArZ1gyU2ZqZ3N3WnJUc29jRWxhdFQ1SFQ2eDZiZmwwaktN?=
 =?utf-8?B?T20veDFXR0NOQUxMY2hNbmc0UzI1Ukp1dU42ZjNZaEwzaXpWbFZjcHVkUzZL?=
 =?utf-8?B?VEdZNHlxK1ZzZTRiK1Y5amtOUTJZeFI1eFlOejh3UklsVHRPMmJySldPSjZR?=
 =?utf-8?B?ek12L1gvNG93YkhsbTBacFBvM002RFhpYjI4cmRhbXJkZFlGNVBsYmxkK2xh?=
 =?utf-8?B?QUZoWGF4dGpuaktSUGo4NmlRRjZxNjhDdnZIV1M4c3djYUZmNkEvOGpKNlo0?=
 =?utf-8?B?dXRTNkRCN2g3RU1ubzcrc3VKZDZwaDZSR0NhSEsxc1VERkNmcHZHbEw5S0th?=
 =?utf-8?B?WStPZ1RtMEhnMk0vb2UvZnh1WG1iSXNOSHpJL1JwVnRSdkhLT1FPNzZiZ2ZU?=
 =?utf-8?B?ZVN1M2VIN0ZwSWtBWXFyeXZLcENQVHdxZ1l6anh2TmEvZ0NmUlVDVXRCOGhQ?=
 =?utf-8?B?bHdPWnpFM0RVblVsbXduQ2tnVkFjUUcvUFZ6cjN1M3NuY3poYlM2M0tIeUNH?=
 =?utf-8?B?TExXdGdibGsvaVEzMjhBWmkrV1ZkVzFid2tTSTRkUzQwZEp0cENiRUtVRTBG?=
 =?utf-8?B?VGtmU3gzWVNHV1lSY0hYU0tpWmhoSmxETGZLU3l0Mk00ZjUwR1k5TXEvQ1Fn?=
 =?utf-8?B?TnYxclZoLytDa1RMRk5qc2ZISXRCSzIxYXdtY0RGVVZuMDFxRlBNT0pXV3pl?=
 =?utf-8?B?ZFJOR0ZhUjBuOTBLeStRc0pyTUIraWM0UWZqRGNsSVJlQ1cvWHJtVEVGTHBt?=
 =?utf-8?B?c2FSYkg3MXhDeDZLanpaV05XdVFpeC9HcjlMQ0NsVkNaM2t3SXZjWDVXdTRh?=
 =?utf-8?Q?huacLzdwCUWX/H4wtL8t6Gzvx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ae0206e-bbd5-43de-bd79-08dba408b13e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 18:42:27.8078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xVaAR88Zd4BXapZJJ/ossJbbHPTLZqazL6Lq/gtg/YK2ydLZtsfz9OGXO7onvuVjJpXNBhPq+lwI1yaQz2AXWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7420
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-08-22 11:41, Deucher, Alexander wrote:
> [Public]
>
>> -----Original Message-----
>> From: Sasha Levin <sashal@kernel.org>
>> Sent: Tuesday, August 22, 2023 7:37 AM
>> To: linux-kernel@vger.kernel.org; stable@vger.kernel.org
>> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Kuehling, Felix
>> <Felix.Kuehling@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>;
>> Mike Lothian <mike@fireburn.co.uk>; Sasha Levin <sashal@kernel.org>; Pan,
>> Xinhui <Xinhui.Pan@amd.com>; airlied@gmail.com; daniel@ffwll.ch; amd-
>> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>> Subject: [PATCH AUTOSEL 5.15 6/6] drm/amdkfd: ignore crat by default
>>
>> From: Alex Deucher <alexander.deucher@amd.com>
>>
>> [ Upstream commit a6dea2d64ff92851e68cd4e20a35f6534286e016 ]
>>
>> We are dropping the IOMMUv2 path, so no need to enable this.
>> It's often buggy on consumer platforms anyway.
> This is not needed for stable.

I agree. I was about to comment in the 5.10 patch as well.

Regards,
   Felix


>
> Alex
>
>> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
>> Acked-by: Christian König <christian.koenig@amd.com>
>> Tested-by: Mike Lothian <mike@fireburn.co.uk>
>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> ---
>>   drivers/gpu/drm/amd/amdkfd/kfd_crat.c | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
>> b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
>> index e574aa32a111d..46dfd9baeb013 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
>> @@ -1523,11 +1523,7 @@ static bool kfd_ignore_crat(void)
>>        if (ignore_crat)
>>                return true;
>>
>> -#ifndef KFD_SUPPORT_IOMMU_V2
>>        ret = true;
>> -#else
>> -     ret = false;
>> -#endif
>>
>>        return ret;
>>   }
>> --
>> 2.40.1
