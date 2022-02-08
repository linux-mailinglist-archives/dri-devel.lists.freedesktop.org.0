Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0799C4AD197
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 07:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E3F10E43A;
	Tue,  8 Feb 2022 06:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE33D10E43A;
 Tue,  8 Feb 2022 06:33:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVXwPF1dMsG/i8qU/vSTe8mrqulbTnMDfI6RIg8A5UCfpsy10bNrWQ3edBPolKsYz6pN6u8Cx5I2LCvqdc3u7b1kipVnD6a+4u4svSBbu7QXNpXE0/1zIJgunzhDzRzKlg67cftNzhcJVcIOXE36ug4fLgzKhEt8pjUlkG4tAUNHpgmlW5NefJ79zysARBo7aduJgzVzeRIMz3KVzcoC3IFYXrCSSdiwMc1aNPDuBJIK/zAc0r06/6h+4yhTN+IoXMHrKp/u0r70tpbhOqMzBjvYWs+VxrnAedRdZ6J9Smk9Z9y+BJ7uzTRZGgWleiJICivwe6wxcwKbzWG8RlLsEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRY2Kwgz0cN0ZiqDmDZZAU6M1XSO6uAlb9Zoy5jIBAM=;
 b=fA9mHKZYNz3cpp4x7H9gQV1hzNO3RaGfu7zden09dSCxXRK3nMtHQ9XJfqqIvtLnBjQQccI//v6uPQQ4T8EgaAJLR6VCjDkSA59Z2CfrcM0G4IfEOEX9nQBf3Bk29QGCJkIgZjXandW51B9Pu8iMwZ/17cZnIgPeaBso6DWIcegnt7OdFM2QxnCM9Acw4KCveQ8UhXo9hyZMr2meKJf7I4Cp01vHwaWa7xhll2qC0qWo3aRf+/TRe/Z5WOkPmtdOUocZOe83LGIBbnc6zAW9dt1ZZsYT8ZzGKJt5TaFUbvq42tKLr0Hb5QYNw67AkYAIMMH7SNoWP4Pe1DmBl13XjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRY2Kwgz0cN0ZiqDmDZZAU6M1XSO6uAlb9Zoy5jIBAM=;
 b=Sk10Nj7FhxTIvzMhdE5pNOiztRAEfgKYDe5Eea3VVvsRCFkaScDYUpyimi6TQjysLV2E1NZHwmn1s7WRtyA8riiAB5Epat0bvZI/itHeW6Nu2tkTk5+K3SFEEwEWSdzgAdWT+g9zwQW3xp6tLlp9ja9QLVvprd3EstcTtuuJWKY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by DM6PR12MB3308.namprd12.prod.outlook.com (2603:10b6:5:182::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 8 Feb
 2022 06:33:25 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::d0d1:eba5:5729:c636]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::d0d1:eba5:5729:c636%5]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 06:33:25 +0000
Message-ID: <36e9956b-d195-b36f-00e4-2e0100de6953@amd.com>
Date: Tue, 8 Feb 2022 12:03:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [RFC v3 06/12] drm/amdgpu: Drop hive->in_reset
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220125223752.200211-1-andrey.grodzovsky@amd.com>
 <20220125223752.200211-7-andrey.grodzovsky@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20220125223752.200211-7-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1::21) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 765f127f-ef1c-4119-fbb7-08d9eacce8db
X-MS-TrafficTypeDiagnostic: DM6PR12MB3308:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3308FD96166B21B2890DCF5A972D9@DM6PR12MB3308.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /WYgG4rMgUmG2wc41aoWB8g7F7FRbs3X1Q75Dtw5kFi0CaPNOhDjBj5WXkZOMXM2F2q8ArFzOiOoMuGB9Pw4hGOoANdkuyQNVK+jbN2QKSPHDFK4m88pe3+XlVq3Yuy1zbRhHbojhiKHt5S4PdzhEAIEZvtNWvqoDDEjAcVR00hPQKv03uQ0uchWdrQ8G5fZilBbSvz1jdRHd3bv4/9XEJMLM43Z+qfmKeS6+s7240IwpjOGfUE5hsnxZdczpOrO1/PCAcMTquJLWC7tmIkAI4lfMAUupDKfQ0UKC6sed6MJigLhcHYh/3kHb3owIvgYtfBFXx68Bm2EygYUSJ9nweZlrOEmTFtanVcEuuCyaN6m+l6Yt4E/GwHIE+9JvgeO6jG+PII3qyGiUG+WrV3hoxttH6MXIw98VQUO+/6a2Xp7OvPDBYh/joLlKXB54JA8KOt6w4kVmNAsyAneLtxW6MLxf2J/jtLx95I9unqyH5wDM/rAaxq6TWGo6wbVAnaj9DFVUHiUceyL4dxT09AcZfE9MM50HNAzfjGs+55ZF52P3MKDmJK6eeikPKA89ZoVs0ewSCJSWG7x6UIkW4l3dnmbJmcqsVIxkwI2fxMfR+KZkzIl7GZfeP0L2Sh8egXR+fPHDZsj2/occwZDra6/xQopCGRAjga+W9u02RxIaK17vlE4cgY7viM+x+cI7ZVKvVqtQqvhQjlQtGIV3aFqECvv3vEgdNS/JtmCpxNmuSywcRiy+XJ+G/sR5MWEVAfc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(66476007)(66556008)(66946007)(36756003)(8676002)(8936002)(4326008)(6506007)(6512007)(6666004)(6486002)(53546011)(508600001)(83380400001)(316002)(26005)(38100700002)(2906002)(31686004)(2616005)(86362001)(31696002)(66574015)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTl0ZnVlU2Y4b3VBNUkrTFpRN1g2Mmx5S2hUc0c0cHdqQU9DbmJjTjg5ckp0?=
 =?utf-8?B?REQ4K1JVNGdhc0g3ZXVyc2NURW9qaERKeWpKRjNqL0JxNVRrdENmZTVza1dN?=
 =?utf-8?B?cTNRM01rbE9QaUYvakFUd01Mc1ExWHhVUld6TEhXOGdJS1RVcFFlcU5tV2wz?=
 =?utf-8?B?cWx4TmE3MEdMcTQrcU0yZnRIdUVUSHFSbDJzL1pWZnh5dGVJWUh5YkVWSmt5?=
 =?utf-8?B?OEVORmQ4bGZ4QkJaZlJCUHAzbEFtUk1kUDE5M0ROL3NmcFk0dW4xK2hRMk1r?=
 =?utf-8?B?M3I4UXhFRGMrVGdCdUQwbkJrNVlTM1phdEdtMHFXZC9FcWtEeE9VL1JsNnhL?=
 =?utf-8?B?V2hRd0xIWUcvOTVOTEFGTVRVdno5bmRSekV3MzRpV0NRZGMrN1BDcXptck50?=
 =?utf-8?B?VjI1UkpnUithaVdZaFN0NEZiemUzeFZnUERpdmFOcnVEZ1Y5T2txODNXUGpj?=
 =?utf-8?B?bGRlL2pjZEtoaWowbnhuUm14cVJDOURYV09nMThFNC93SjZuMGlqTDV4SUxZ?=
 =?utf-8?B?R0ZLeFlDSytyUTk2NU1hVmdUQ3luckxlOHlpRVRoeHF3TmhQLzFKc2U4MXgz?=
 =?utf-8?B?Q0hTcWZkbDV5QVJuTHdqejg2b1M5NllScTYwV2ovYzZueXlNdWZuaFRFai9C?=
 =?utf-8?B?SWJ1TUpQS1BrNy9XY2tJVjZzRURSRXhjUzJXUWNKcWJGZ2Y2dFZHNUp2RjRw?=
 =?utf-8?B?MkJYOHRSMnZpM1JzOFVNbEphK0FyZy9RZ3NTSEU0Y0pNRTMwTHAybGpQRVJ6?=
 =?utf-8?B?aWFuaEdwcXRzVnFpWVRocEJ5dCsxNHJPOUt3RTVyZTJlcCt4dll1N2Qvclgx?=
 =?utf-8?B?M2tLcys0QmdENnhVVzFNdFAvSzdEU3ZxWFZUMjRxMWhnRC9rOGlmV0ZRcG95?=
 =?utf-8?B?Z1BQK0t3cURaWXVqUUtmRnFVbGJ0eC8xdmlBTnFoanJ6SVVreU1jbURaZHhZ?=
 =?utf-8?B?bnQ3am4ycW1vWUNBTHJrNzI0azNRS0RPVlVTV2VNUTRyM1V0ZHpFdW9pbG1o?=
 =?utf-8?B?QWp1V1dhRXdVZlBQWjF5MkhpdU9UQWlwZjNIVWJGRmpJemEwWU1OeWRtNzIr?=
 =?utf-8?B?cTZjaTcveGRjWlY2LzhuL2xab2xXQkVoR2ZON3N5VW9ndFVxdG1waDVBVmNl?=
 =?utf-8?B?Qy9zZVF4T3htY2RadU1iY1k2bTdSNHRSSCs4SVMxa3U4UFVNQ21pWG4xZFVZ?=
 =?utf-8?B?K041QWp4aEVhZngwOUpMMVpibHZ2dkk1eGtvVlY3WkQyeFZaaW5QR1ZQVWd6?=
 =?utf-8?B?eTZVVEVtTlU2bVJDajNhenA4ZnNweHI2MmxaMDI4c0V3WWE0S0x0WC9pNzVp?=
 =?utf-8?B?eFdzTWY0N3BTNmJzTGhCQm1yTDRrc2s3blRDVGVIU3lhUGpBaUJOa2FibUVz?=
 =?utf-8?B?UDBQK1d0T3NLSlQwaU5pQUx1OGl5WnhDTnQ0R09jU0VGTVhKWGJmVnpkeml4?=
 =?utf-8?B?WDRpcmFuR1VMRXRvTDF1RmRkcVl4cGFmaEo0OHFxWVJMM2Mwcm9EZnYzM3VG?=
 =?utf-8?B?SnEvS0dwclFmRTJ5UU1oRXJQSlR1bzgxOU9aOVA5REx3OUpVTE01bGpyNkdp?=
 =?utf-8?B?VUhVVDVTQzNIM2Q3QnNLZjBIT2x6OUY0V1BqQ2EyeVNNOCtYV0MzM1EybG13?=
 =?utf-8?B?R1NxalJEZXk1QWpMcDJZMDhYd3FKSUFVMlBDcm5FZkoreFlkR1A4d2Y0SlBP?=
 =?utf-8?B?VS8vTXJVWnJqazRBWjAyRjY4T2c5bVBJQXVFc0dmenY5aVFsVHVNbXVIaCtE?=
 =?utf-8?B?T3BNeDRYOGpxUEZubVd6aTFTUjJTRk14ZTBVblJ4dXZub0VITzR2UGlndzR5?=
 =?utf-8?B?TFExOGIvUm9OUStzU0dIK3EreFRmVlJWM3RtaVB4bmV3c0haTlhTaHhwU3Ny?=
 =?utf-8?B?cnJmT3RnTlpES1M3VjFJdFR6Q212T2RnWVRMZkdvaTk4UEx1S0VhajZ5SXox?=
 =?utf-8?B?Ky9KbG03OVYzWEdaRW82aW9mc0szTUdOTk1tVnprTmRmaThFWG92d20zU0Vu?=
 =?utf-8?B?OStja1ZHRllHMVZpZHhEYmRwaENnUVYyOHhEdjdjSVhRV0kxNHJVeGtqMlFY?=
 =?utf-8?B?WU1rRVV0bTYzODRhS09tQmFuK0ZVVzhGdmErMDliNGhlbjA3NlJlZk1DRUdP?=
 =?utf-8?Q?Eea8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 765f127f-ef1c-4119-fbb7-08d9eacce8db
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 06:33:25.5125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PD84yXaM/pH2imMCcO1OqLHPY+r/RbjxxvTOqqVzvP/ie4y0Gnfmc97Ewws+D3Lf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3308
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
Cc: Monk.Liu@amd.com, horace.chen@amd.com, jingwech@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/26/2022 4:07 AM, Andrey Grodzovsky wrote:
> Since we serialize all resets no need to protect from concurrent
> resets.
> 
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 19 +------------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   |  1 -
>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h   |  1 -
>   3 files changed, 1 insertion(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 258ec3c0b2af..107a393ebbfd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -5013,25 +5013,9 @@ int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
>   	dev_info(adev->dev, "GPU %s begin!\n",
>   		need_emergency_restart ? "jobs stop":"reset");
>   
> -	/*
> -	 * Here we trylock to avoid chain of resets executing from
> -	 * either trigger by jobs on different adevs in XGMI hive or jobs on
> -	 * different schedulers for same device while this TO handler is running.
> -	 * We always reset all schedulers for device and all devices for XGMI
> -	 * hive so that should take care of them too.
> -	 */
>   	hive = amdgpu_get_xgmi_hive(adev);
> -	if (hive) {
> -		if (atomic_cmpxchg(&hive->in_reset, 0, 1) != 0) {
> -			DRM_INFO("Bailing on TDR for s_job:%llx, hive: %llx as another already in progress",
> -				job ? job->base.id : -1, hive->hive_id);
> -			amdgpu_put_xgmi_hive(hive);
> -			if (job && job->vm)
> -				drm_sched_increase_karma(&job->base);
> -			return 0;
> -		}

This function in general will reset all devices in a hive.

In a situation like GPU0 in hive0 gets to this function first and GPU1 
in hive0 also hangs shortly (before GPU0 recovery process starts 
reseting other devices in hive), we don't want to execute work queued as 
part of GPU1's recovery also.Both GPU0 and GPU1 recovery process will 
try to reset all the devices in hive.

In short - if a reset domain is already active, probably we don't need 
to queue another work to the domain since all devices in the domain are 
expected to get reset shortly.

Thanks,
Lijo

> +	if (hive)
>   		mutex_lock(&hive->hive_lock);
> -	}
>   
>   	reset_context.method = AMD_RESET_METHOD_NONE;
>   	reset_context.reset_req_dev = adev;
> @@ -5227,7 +5211,6 @@ int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
>   
>   skip_recovery:
>   	if (hive) {
> -		atomic_set(&hive->in_reset, 0);
>   		mutex_unlock(&hive->hive_lock);
>   		amdgpu_put_xgmi_hive(hive);
>   	}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> index a858e3457c5c..9ad742039ac9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> @@ -404,7 +404,6 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
>   	INIT_LIST_HEAD(&hive->device_list);
>   	INIT_LIST_HEAD(&hive->node);
>   	mutex_init(&hive->hive_lock);
> -	atomic_set(&hive->in_reset, 0);
>   	atomic_set(&hive->number_devices, 0);
>   	task_barrier_init(&hive->tb);
>   	hive->pstate = AMDGPU_XGMI_PSTATE_UNKNOWN;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
> index 6121aaa292cb..2f2ce53645a5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
> @@ -33,7 +33,6 @@ struct amdgpu_hive_info {
>   	struct list_head node;
>   	atomic_t number_devices;
>   	struct mutex hive_lock;
> -	atomic_t in_reset;
>   	int hi_req_count;
>   	struct amdgpu_device *hi_req_gpu;
>   	struct task_barrier tb;
> 
