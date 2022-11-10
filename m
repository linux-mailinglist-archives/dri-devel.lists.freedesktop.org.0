Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73899624911
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 19:08:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70EBA10E76E;
	Thu, 10 Nov 2022 18:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E4A10E76E;
 Thu, 10 Nov 2022 18:07:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJbXyhaiJPjmpBL2GaGbTrjjmevYGocat0cyukxSaOOtGh0/Bc7lSmHMLmjKMnWgDwLdjmmBz5PYNYeoEhgntj5aYQss5DQykLCU+chcTIaTe923w81YTEZ84Zjj/SFE8Hh+78lNimDEDVbKvpwLUe4i3DCv9M3dMVNDVevJsm+wHeVXDQjJhDzPO8BJg8OmJMHt4lyasDhzPAkg3oGlJnWxHTHKnsuyVuwqSF0LtN8QjRcBd5eFyo1eWppqtgQ0qB7cF2mQvfmGWQO7kSXdvQp2LJQTckcMl+GGGtxfk+c2dAh3WMZpVTvkfKdvF9XlQYeCqMhkAvc5RFf3SyXpNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oqc+jBb1Leli+viV/ph9bW+0gxtmaRumZOp8fQCLuIw=;
 b=NlLcHqJpQzUOc+T5doxhc55yISDfb1X8WZajVuoNvrNg1UzNRCkODxNbmtf9THQ87ou9Lfb/7lBO0D60Xo6GzzKgQ15kRZ96h9cl3BRRXA5euCmLSEfkV2I0HRmCN7vJ7lfoWt1Il1NrVtJev3BnNoM7uqN/+SmXIZQigRlJ8tHW5YSys/RQBJVblHTXcmWIKdyb1+QbGmF22mwdpEMCl1w0+U2y05ejhfx+ZGcY9/J/m+srjIogMRnZhzjO2xY/Ruwl5CU8I5bE2MlvqYgb7RmhrIjMcqxeuv2T7Fc9J2ohAIo1qkXKKXkcLPrWqgpwxKr3QMmUNA6tJppcXkfC0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oqc+jBb1Leli+viV/ph9bW+0gxtmaRumZOp8fQCLuIw=;
 b=ooDbqkbKcpfemSVlYMXbkmnp6HN4mEQ68eCfNEHcXq11d6GWETvZNPvbTm1RSNsH5o89EXOO5OCYxUv44b2YgplDRhccb7ukOUiWh+WacfPFRQxH6nGugtPceZ94f/mHcMfD0+YmTpZte5aHGMzIDD+WNVp4PqKK2dVHAB1IDis=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 LV2PR12MB5989.namprd12.prod.outlook.com (2603:10b6:408:171::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Thu, 10 Nov
 2022 18:07:47 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425%7]) with mapi id 15.20.5791.026; Thu, 10 Nov 2022
 18:07:47 +0000
Message-ID: <075b9979-e956-1f01-2a57-0ff0e15d9de6@amd.com>
Date: Thu, 10 Nov 2022 13:07:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: Dong Chenchen <dongchenchen2@huawei.com>, airlied@gmail.com,
 daniel@ffwll.ch
References: <20221110143314.708434-1-dongchenchen2@huawei.com>
Content-Language: en-CA
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH] drm/amdgpu: Fix memory leak in amdgpu_cs_pass1
In-Reply-To: <20221110143314.708434-1-dongchenchen2@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0005.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::25) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|LV2PR12MB5989:EE_
X-MS-Office365-Filtering-Correlation-Id: 1faf3f76-56e2-4e81-2779-08dac3467932
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vAjS5P03ODaePUNjVBP1RJEqQ14IORX1wItD1JtitIqivaQ1NzV+l1a5jyNE/k73F55kRL9W+hoZ6HlXHnDOksf30Wn+lfnZXlS1NWyF4YOkuhL0CVoqwf6Zx5PwlXa+6mNP2E+zoF+3wPWAdiNt0WxOVWv7BBRtyjF+Tfy8XIYAlioVu+3QYarEmDfDZHemrUtjNSW1MujoDqH6OqrrBgQ09nL1LMEXdCqZsSou+vJ1kOqn81Ro3CIJgtvoGHjwJm1IHyreh/m32sOc4pMp2f/IqodIZqOAl4C5vK6m57+vec6r2dq41DlG7SdVg7wdG/55O6PSqYmsYs9cQEJdSOvB4DNyukqBV92erg7iKTKM9pmMRnU5FTaqYBabt7+KSBcpcCjmGwQNmE9xktXHsvel1t+9fNgNJdgdCqa7O6m41zDlEsj0yeqSkmmSov/dOwDW9JZ2ikpFq63QOP9Ya5RqMFmI1vS7gr7qw5ATUtD/PP7BLKFRx3V3LmET4lQr0EkSXfIY5BuqKgWz7iNpkq7xxdcR3Gy0fkRDlGFvRxbgEPNUy7H3khGtEuMV+8IdI6nXJbXc0IVjtNcbVYokBc0cvFqyULz4NZgLqfhM4O/hDqVopFyI7Op2k9Y3G9vODDOOtaImiC3+mk5AY0FwDLrinJRuBWg7DAhmsbHiq99+sCizX/MAC+Vv9Hy1Tpj8WhVMXeLexO3Byz7uYT7yBQcxUnwdEsjJ8+j7cFaMu2z0ktOMX+LMJDNDOGUIOPle7wbX9EDHNaCP9YBbUwX4CK86bO4ytEepZsXC3kkkLdU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(376002)(396003)(136003)(39860400002)(451199015)(2616005)(36756003)(6512007)(83380400001)(478600001)(38100700002)(41300700001)(6506007)(44832011)(4001150100001)(186003)(26005)(6486002)(31686004)(86362001)(8676002)(2906002)(66946007)(5660300002)(316002)(66476007)(31696002)(66556008)(4326008)(8936002)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzNScmhRNlJSRnQ5ejJLOGI0a3hsNzA2b2NRSHVvMFQvVmJHUExDMU8wTVpT?=
 =?utf-8?B?WU83MzA1cGdJM2p5aHRBekQrMWhmeHNoMGZvQjlkYXYyWmtVcGtsalJSbGlD?=
 =?utf-8?B?WEZRekxWc0syekpHRm8wVzFsajlOdUFwSXd5MlhRODRYb3FCK0U3TVBxVGNV?=
 =?utf-8?B?cjFDK09FTlNDbWovbEczZ1lvWm1mcFdQNjdlY2hKREVzcWJEaXcyL3c2S0V0?=
 =?utf-8?B?UGhTQWVFNDQ4TWxINDZvZGV2Q3BpVEdQbi9uNTNqWDV0STNOVHcwUzZoTWJt?=
 =?utf-8?B?TkdicXZGMXJBNEROZjhJNURHb093ZTFQWTc4N0pPY3hNVE1XTWFEcnFhM0tX?=
 =?utf-8?B?UEsxZjNTTDRuZ3UyeFlpRWN0Znk2Y3Z2RnVaYUZmZko0QWtUZGNJQ3NNdDd3?=
 =?utf-8?B?c29JcnRxVjJlUms1NFRGbzIycDZJTUlJcmtNdzZhTDE0REhyS1NmN08zcTVS?=
 =?utf-8?B?cm1zWUd2Vi9XSnVnOFpFc2FNS2NweEFGZ1ZOMXp4RlpmWkF3dUk3ZVdMQjB3?=
 =?utf-8?B?V2krdFFldUNIdGFFaXlobG9ZWkNiaWlKYTlBTDVSZnRlS042NWlhaEtFUlpG?=
 =?utf-8?B?OTBER0pnamVEalBDbUEyN3pyaEduNkU3TE82ZUo1dDZjV1BEREdnSEIxOGsz?=
 =?utf-8?B?byttRysvcjlMVUxEWHppTXkweWs1MFhwVVI3dHhtcG5MbklENFQ4cVZ3UzUr?=
 =?utf-8?B?QXpna1N0ZzFQRHJ2U0lCWWZKU3BXUEIvelJCK0hCM1FMQTZxbXZScE9yNXpH?=
 =?utf-8?B?a3N1VE9oWTBCRVhENW4rMUFhVUxJbzVBMC9qVVVCUGNmRm9xUDM1a2V4em9T?=
 =?utf-8?B?N1lKUXhra1NpZFFFbHdOd0tBbmV1N25uTzdPY2ZXVVRtSzF0c1dOWnNYNTBk?=
 =?utf-8?B?WmREekpRQW56T3JiN0J5SnNmN0JmMVN0dmR3ZjBPeGZBSnVrN1Q4OTlzR2Fa?=
 =?utf-8?B?blhjYTRvOUNLR284MnhLOUZITXlscVJFZ01TMzlHazRiZlhPR2pQcnBGQzVh?=
 =?utf-8?B?b29vUDMyZHlZN0g3QnlGeC9vQ0NzaXllUGxLdXZNMFZsN0xKNVJQa2JGZEpG?=
 =?utf-8?B?ajJQcUJHTEdzNjlyQUUwTUVDa3hzVHQrMnduWWlFZXBLZ3c2bXJiR1lmWGxm?=
 =?utf-8?B?NU5sbFBkdDlhM1Y2bU40MEhxYU05RlVXS0p1VGt6RkZ3d3NUZS9QQkdudU1R?=
 =?utf-8?B?cm43TEJGdTFiM0I1dkdhb2l1OUZWejZuWHJ5eHBUUHVVOVYzeUVodVJGMkt5?=
 =?utf-8?B?Zm5Ra01DNVB1bGVlQ3lJeTM4MlNSUm0ydGtMN2RtemVLWEtEdHdWcjh2RU1h?=
 =?utf-8?B?VkJRcUw5UTlCUmZNUUVicG1MN3RTRE1VNTVLK0lwbHdQNjdra3ByOW93cUxP?=
 =?utf-8?B?THBzc0FuY3pEdlZjN0t0cHpHSnY4V2dGakZ5QWw1RWtZUi9PcC9yN3haZUZU?=
 =?utf-8?B?dzlCYVBqczNEQnZlWnU0V1pkRytHR3hZMlkwS0orQjdJb0V6cWdnYUtFd1lS?=
 =?utf-8?B?L2JPNjVmNFkzRFJGM2FJQTEvQTg1MU04U2svTU5Zc2lJTHc3bm1zcGhwOFdu?=
 =?utf-8?B?eTNadlVOVE1xcVhVc0dEOU5IL0NIandQOHFVc1J2WjBkdERrUWEzdzNIamw0?=
 =?utf-8?B?K0V2SHREZUtERXhnWUpudzFTM0ZjK3Vjd2FkZDV2MFJDQnlVYWFxeXBkOHdt?=
 =?utf-8?B?Q1JuWld1ay91VWFIcW42czBJeVMvMlhRYy83NFdsSk1LemNnM2xHdlYvS2ZP?=
 =?utf-8?B?K1BqWElJRmswS3cwQVRZNmsvN3hQWGhHOTJjUEVUb0xWVjlXb1JXTHNFZ3dC?=
 =?utf-8?B?bEd5dHpBQ0ljRWF3aGNleVFzVHBjY0JOeWRUSzNqdVF0blJjdEpPd1dsOWNm?=
 =?utf-8?B?c2ZVK2dKNWcrcHhRc2doRlNqUitjZWtCM1BPUDZTcVZ2SXlrZFNmZ1drQmg5?=
 =?utf-8?B?aUdMSmgyQnRQaFBwTkVxUmltN3ZLcE00cVRKWHY5REpRc0dIVGlycmNRb2hF?=
 =?utf-8?B?cG96L3lOZCsxRytsNkRhNWR1eG1Lc3M4VTU5dUZ3MVpZMnVlb0V0L01iM0hn?=
 =?utf-8?B?Y01yQVV5U0UyMjdjZE15YXlmRElVNXQyWWNSSWJFU09FbXFFcHlsVjllYkFa?=
 =?utf-8?Q?X11evZBL2Bq7iXyngJPewMOr1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1faf3f76-56e2-4e81-2779-08dac3467932
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 18:07:47.6365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VzkDuiX3rwtM1mvVfjzjoGjYlo3DrramO1DDoY0lDQZs39rnqZlAhkk8k6KPCIKq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5989
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
Cc: Xinhui.Pan@amd.com, yuehaibing@huawei.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for fixing this.

Please add a Cc tag to stable, and repost.

Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>

Regards,
Luben

On 2022-11-10 09:33, Dong Chenchen wrote:
> When p->gang_size equals 0, amdgpu_cs_pass1() will return directly
> without freeing chunk_array, which will cause a memory leak issue,
> this patch fixes it.
> 
> Fixes: 4624459c84d7 ("drm/amdgpu: add gang submit frontend v6")
> Signed-off-by: Dong Chenchen <dongchenchen2@huawei.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 1bbd39b3b0fc..0e24d6b80e0b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -287,8 +287,10 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
>  		}
>  	}
>  
> -	if (!p->gang_size)
> -		return -EINVAL;
> +	if (!p->gang_size) {
> +		ret = -EINVAL;
> +		goto free_partial_kdata;
> +	}
>  
>  	for (i = 0; i < p->gang_size; ++i) {
>  		ret = amdgpu_job_alloc(p->adev, num_ibs[i], &p->jobs[i], vm);

