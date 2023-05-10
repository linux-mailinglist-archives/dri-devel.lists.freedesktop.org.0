Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 267EB6FDBD2
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 12:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 378F410E207;
	Wed, 10 May 2023 10:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6DB210E1F7;
 Wed, 10 May 2023 10:40:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RgCQ7f1ZjaggO2Q9D41aLwDv54uy2nBDOyGvf3AcCIrlzrCFBqnBVzd6a80H523n66fkfQd+SdvA1EUn5Z2soXVwMI2hZ+i7am1nwllJANSkibZ1biD0SFwhdihmKmxVsrda9KlVBXF7mvbCHLwk+wRa8ExEiLDF+hiuazBtlpLxyInAQRx3DgTjTvHMHXunU6fT17JPvV4esBJK28bE+He3shVhgzCPzSn7NXiSNqtMs8nCShlc22cIdALSeNQy4yNPEzaJVA5E1ptAFM10f7b/snk8vNopItoVRPizHfQiHWO9NOJzZcmKJbRQIRQ9ujtW6fT/0kwcndFmnhTFxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwTY441D3h/Xd0tlzlJU2R+BLB50pKXGbdBXESkL8UA=;
 b=objqkiiM4lmo0HIFicjABbiNaYyUQaKR7BPv5Qayk704bENU9ABSYqOKi8FKifODMeKvkx9GgbLxj5CWvxrti3EAglExIJQhSgkPsv64CX7fQN9VQTzK1gqFGkfz/JbaXyzX+o3SC+bwTyLV3cbbpy876Ktap71IvN5y2hIBAqoMdW0q1ppAXOjSNcMiuYxaQ/E2/ywwHTsQoWlocFDMUeNyR694KQ6ESoNTJGCKRzvSkMtCX/F3JORiEDnp5VTPkNWEp6JyY1/zxa8llSaSJlPO0EGTnKgFcE0ZpAQ5Gsd0ziucRpWfM2hNjQnjm4DKL61CuGTpynbXwUWULjEP3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwTY441D3h/Xd0tlzlJU2R+BLB50pKXGbdBXESkL8UA=;
 b=ZnOpmfddMvlwwS5WIxOxP/HZq1cvZzbQiduNZzvQHJgy7RRjyQObRNRaP0Em+5oT2l59CQumgHBtBXEC0wqpI04aPy00V0nptnJHX92aBOJ9YaGCyuv24q2gwkEVWf6UhV3utl3huZXZG7RZJtLi5s2rJkTBjPPvnlYY4LQrgEA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 MN2PR12MB4256.namprd12.prod.outlook.com (2603:10b6:208:1d2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Wed, 10 May
 2023 10:40:53 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8835:b7cf:497f:af2e]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8835:b7cf:497f:af2e%6]) with mapi id 15.20.6363.032; Wed, 10 May 2023
 10:40:53 +0000
Message-ID: <b72bf526-54d1-a47a-4d61-732073d9c117@amd.com>
Date: Wed, 10 May 2023 06:40:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-CA, en-US
To: vitaly.prosyak@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, alexander.deucher@amd.com,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20230509214337.124382-1-vitaly.prosyak@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH] drm/sched: Check scheduler work queue before calling
 timeout handling
In-Reply-To: <20230509214337.124382-1-vitaly.prosyak@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:88::10) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|MN2PR12MB4256:EE_
X-MS-Office365-Filtering-Correlation-Id: 72c96a82-95aa-44a5-a3b9-08db51430724
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HqQV95akdRSLUFGz8CVU/GC2qWim7rCkvARXv3QuxUQ9lANZqPVSAKH5BeeT8mw1nKi8Xj6AI7agBciN/epRedCTpSQEVdTiDQ6WRyskmUL+EYknTCf0HNiHq283fRiZsrlIprlath5xUBYUiNrVx9ytJ9U600tCbHhUY3ipXfLYSz8mCOs1A4gufwrCSbZLyFaN+JjtAwPPNhPI3PoLIFX9muZTt1K6cqzZxu2X2DjnBepB+PhhFtr9Dh3m+ILqKO3XHXUGyYxZJhhFzvY20h49jOsJgzmdKYntpHBAhL6b4RJiPUV4/8b+IR4igLVautRUqIAcJMEmQfgOrr/awWBM1W5ZvUC2SVbuhDT8/RV9miyb3ZX7c1bdq7BIEWxY0jU9xHoD3XNnT/WR7gHihvesH+2z4+65p86oUy6V460ldWOJ23WVMMwbFGFyfU/HlSQ902NOW54/DjV83IMy4+x82JIJpgqM0wmJvIwPyBPt13t0unx/hYd4Zt00+rnNERURJL0Rl5Hh43zaATPHK4zOzpcPBx0dq9zdeX2GX4ArIee1zjs9J25Z2XAJx+qTNDzFdYgEEzhh7vNioco8jR+TW2d3mL2Zx1HNWnYthoDmQlRF5uV2BznCA4OKlW5Jz3jve7g3px/8b/HNbww55A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(451199021)(450100002)(2616005)(6666004)(478600001)(6486002)(53546011)(6506007)(26005)(6512007)(186003)(2906002)(44832011)(38100700002)(36756003)(66556008)(83380400001)(66476007)(41300700001)(66946007)(6916009)(5660300002)(31696002)(8676002)(8936002)(86362001)(316002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEt6NzgxZXd5T0hPRFVYVXI5Zk4ycG5oVEV3T2N0algzV0dIYjhJbHhUb1Nr?=
 =?utf-8?B?cHk3TzlQNTBLZmxMd0w5VTVhMm0vU0xPWGlXVWNXWmV5Z3dUcWNNZGdXcXpt?=
 =?utf-8?B?eldvUGdCQ1kyMnZhN2p0TXJFbjhRV1Z4N1p0S2FkUmNTKzRKY01VWkxzSGpa?=
 =?utf-8?B?eXlRYmhxN1RIdmY1c3pScmtNQldVT295d1F3b1VYajhQRmxVNm9kaEFkbkN4?=
 =?utf-8?B?TCtRV01pTGRSempLWm15aDRGYU1abkxPRmQ1R0g3VWUyZDc5R01NcENhaEoy?=
 =?utf-8?B?NW94VnlSS2VjVlNVUmlXVEV0cVBMK0ljcWU0QnJncjEzUUtwMFdSQWk2K0d3?=
 =?utf-8?B?QTdsOHEwWFJrWWFIU0NwQnVmVHc5RUF3TTBWOEorWVlVQXNOdjZLZjMwV0FT?=
 =?utf-8?B?YXVOS0ZHUzloUFFBN2NqZzFYaXo0VXpJTGtkT3Z5a0FIcG8yQ1FTazFreFkz?=
 =?utf-8?B?TExPNHNYQW1xZENwSjNhY0FWbWZScDB1emxpQ3cwRER2L0dUbm0vczZHeVpV?=
 =?utf-8?B?Z0dDVGJxSmxwbDZ5eXpxM2wrSHJRTFZ2dUNmOTA1ak85MXlJaWp0cFFXZVdv?=
 =?utf-8?B?dG9la0I4NmU1WjBEMWovNmVLemdNTWpSb1BSZXF1SGtyTjRPL2ZINnQ3VjVX?=
 =?utf-8?B?dCtEeXVoT0VsV0FudmVhS1UyK0VMZ2lPQjVJV0ZsT1pHRTBoVDBZRnphMkQ3?=
 =?utf-8?B?c3VDTXg1RHRNU2YwemJWK2VtQlRINVpaWkIxRGxjZTJaZWtFMStDZm1xR2dL?=
 =?utf-8?B?T2dTYjFVK1BLMlVMdFQ3aGplZS9zemlkVGFzaVZSQngxWEVwUDBHbERoaGlC?=
 =?utf-8?B?dGpqNE1wVnBkNXdsalVBOVlrWEtVWjdKWGp3RlkrOUpCMVpyeXdneVFQYXFR?=
 =?utf-8?B?NTlDS3JmL3o5T2VFSjRKZFl1dmE1VHpjQ2JIYktMMVVYeldiOXFEWEFVdUI2?=
 =?utf-8?B?MEtrc2FrMFdRY29ZQVRMcW83Y0xiTmZlSlBDZlFVZWpRY1laM3k3WlV6QWNl?=
 =?utf-8?B?UER1NGducmZIUEthZGh4REZpSVUvaVFxaVdIQXBvVklzS1hidjB0NnFpZEdH?=
 =?utf-8?B?NkZyb0RmWVhiS3hNV2FEeFluVGJvU240V3pnNmw3MDFhZnUwMzZ3RGJBSmhX?=
 =?utf-8?B?NTR5ZlUxM1ZnejJzczdyMEpBYW0vU2dvSzlVNjMxLzZQbzNaUDhidlpxZW1o?=
 =?utf-8?B?ZmRQU2I2dCtFeXZwL2ZXS0sxZ1FmUjJPRkFQRTZzdXRVcjlyZ3ZjU1ZzSDg4?=
 =?utf-8?B?NWk4eDl3M3p3bmVrRWlvTnJ6eGRLRkgzUDU2eUJ6aDhLcUNQQUJOdmExQU9x?=
 =?utf-8?B?cWRFMWY4TzlUMHVLS1F3aEFWdm5ReU5DdDFuSWNpelpjTTlwODhTMUNLRWs1?=
 =?utf-8?B?RVRPMVBFcjhsNEl1MHpDQzlrT2JzVTk5N2hiZkxuQ05qcjlPclg3VjRsang3?=
 =?utf-8?B?dFlOUTc1V1htcnJnTEpzZjBRc3ZQRXBNbERxTUJ4SFI1YUt0c0thNUxwcGtv?=
 =?utf-8?B?OVpGZWcyazhPRmJBRjJNVWxCUHBubmc2QkZxb0VQSWpZalNoa0RQM00wZURq?=
 =?utf-8?B?aU56NlFQd3p3WEpiemhOUGJnVldYY1JERDgxWGNWSXdla2pXRkVwUU1lTE13?=
 =?utf-8?B?MVBHS0RtS0Fmdm8xZFJYa0F2dmRUUmhKaFdvMUZUTHBObXhBQmk1SDRBMzdn?=
 =?utf-8?B?SDBHRmZ3NlM4SDBIWW9HSUplN3FTd0dhZHYzWXVHZ0p2QVhCSWkyd1lwR25t?=
 =?utf-8?B?K2o5Mzk0b2dKZ2lldzNTckR1aEkwelBsZUlBZFN0RnRPeDlsNlJscmdZQzJI?=
 =?utf-8?B?Sjh6WGsvWStXdXNRMzlRMjhWeEFoQzNGSlBnNGVvejNDckh3cXoxWXQzdllB?=
 =?utf-8?B?dXJwcUNHR2YrTmtEbnBnUVFkWWNjMDVlY1ZFajR2Y2IwUDlIcFB4Uk4zdlJy?=
 =?utf-8?B?SkNUbUNIQXhwZkVOYWtyV1NoOFNJeWhGZHJGZ3lnbkxKRTBZWkY2R2NraDJz?=
 =?utf-8?B?UTBxZkhPQ1NCUy9VdlNNeG5QYy9wbU5FSSt4Vk5ML0VWemVpTGQwSlJ6Z0hB?=
 =?utf-8?B?YXF2d0pxQllCQ3dOSkZoQXlzQytRbmMwcW9RZUhvTis2VWxwVHRIdkZqY3hr?=
 =?utf-8?Q?n6vk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72c96a82-95aa-44a5-a3b9-08db51430724
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 10:40:53.0192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: blwFOuG5Pa2IhSUKlmgr4A74+ANkdxHGEiI/RzDV2CVF4yu9YaqKPuj4Hiljfg3O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4256
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

On 2023-05-09 17:43, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> During an IGT GPU reset test we see again oops despite of
> commit 0c8c901aaaebc9bf8bf189ffc116e678f7a2dc16
> drm/sched: Check scheduler ready before calling timeout handling.

You can probably use the more succinct fixes line:
0c8c901aaaebc9 ("drm/sched: Check scheduler ready before calling timeout handling")

> 
> It uses ready condition whether to call drm_sched_fault which unwind
> the TDR leads to GPU reset.
> However it looks the ready condition is overloaded with other meanings,
> for example, for the following stack is related GPU reset :
> 
> 0  gfx_v9_0_cp_gfx_start
> 1  gfx_v9_0_cp_gfx_resume
> 2  gfx_v9_0_cp_resume
> 3  gfx_v9_0_hw_init
> 4  gfx_v9_0_resume
> 5  amdgpu_device_ip_resume_phase2
> 
> does the following:
> 	/* start the ring */
> 	gfx_v9_0_cp_gfx_start(adev);
> 	ring->sched.ready = true;
> 
> The same approach is for other ASICs as well :
> gfx_v8_0_cp_gfx_resume
> gfx_v10_0_kiq_resume, etc...
> 
> As a result, our GPU reset test causes GPU fault which calls unconditionally gfx_v9_0_fault
> and then drm_sched_fault. However now it depends on whether the interrupt service routine
> drm_sched_fault is executed after gfx_v9_0_cp_gfx_start is completed which sets the ready
> field of the scheduler to true even  for not initialized schedulers and causes oops vs

"not initialized" --> "uninitialized" reads better.

> no fault or when ISR  drm_sched_fault is completed prior  gfx_v9_0_cp_gfx_start and
> NULL pointer dereference does not occur.
> 
> Use the field timeout_wq  to prevent oops for uninitialized schedulers.
> The field could be initialized by the work queue of resetting the domain.
> 
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

Add, a fixes tag,

Fixes: 0c8c901aaaebc9 ("drm/sched: Check scheduler ready before calling timeout handling")

Before the SOB tag.

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 649fac2e1ccb..670b7997f389 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -308,7 +308,7 @@ static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
>   */
>  void drm_sched_fault(struct drm_gpu_scheduler *sched)
>  {
> -	if (sched->ready)
> +	if (sched->timeout_wq)
>  		mod_delayed_work(sched->timeout_wq, &sched->work_tdr, 0);
>  }
>  EXPORT_SYMBOL(drm_sched_fault);

Yes, this does indeed seem more correct.

Apply the comments above and repost the patch to amd-gfx and dri-devel and
I'll push it to drm-misc-fixes and amd-staging-drm-next.
-- 
Regards,
Luben

