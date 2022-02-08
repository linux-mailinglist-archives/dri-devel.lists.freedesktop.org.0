Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D104AD5CB
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 11:49:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A2F10E6B8;
	Tue,  8 Feb 2022 10:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9859110E65F;
 Tue,  8 Feb 2022 10:49:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABnKe35zTrDZFvxbdt54Z0QE4xJODM+TyqqsXtlDxF2ahmVdFImcp3PEWVRI/079/qaAUxQ2UWpnI6Fpg2rIzBatxFbEnCTkklozdbaN/96Dh2DFjX2HPPdXkTJ0zlU7frzfH55sXSqcY2S0w17fV+1/OXABJLcyoDgTvDe0NfifI23mDma30paEVxpq2PHn7WpKYWoqYZnPjYUDeoEWaEpSi5iZ8sN2xMCja72nn8lWpdntKKo6716PpGJ2lPRvuyDSFmyfM7fEzG8D3E7Kv7EtuUlQedC2tcs67pRo13B9V6YUkZ4I0JJas+o8n4dLyoRqHUt8zVAXoPhBFUtIwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/j8XZwvjcRFEx4rcily8d+thK8m9+254DE2tafpXuuc=;
 b=Zdur3T1ISYWyMdQPCzl+ZwD1iE+h8/xMvuwdsvwVCSGY4ttXpqduqTSInM2QSEVDyo9DmdMPUsuv11ZMLoGcACvxd1OvCFhW1GM5RIec60UZ7LJ/cTl5g7xJTZCvlYPWCVypmgBkSLkMpcDt4GUfvDGkZtrKDCxxu2PBqJtkAgkca8LDuxMlNwQsFxwOaMoT7IvlDZlUJiVecL5IzWsyvizJbBW+8XLHsySPyQ23UgRSVv82pimSuTSDs20o+ob2D+NJf3M9P2v5KTxWf87oidV3aUr1boOWJCetmMxKHvMlbfSDDoAROp1fHE98pYchTzR2t2TDyV0dzJbXQFGZCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/j8XZwvjcRFEx4rcily8d+thK8m9+254DE2tafpXuuc=;
 b=uO+zRrGtfqiX+ysxlrQTusflPlqop+0yM2M0Vu3UG8oUsVAtfJzCTlpdb8Td70eTB0z2AF3Cz1sIKj0wm7Ha5WFOxFdtzt4x7+CTPbsW8AyxW/YGalz3LZDJJyZDp0V/7aDth2SPHBGOvZIo34vE/4qPcR+pb/Jb8YTdMYaMS7E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by CY4PR12MB1831.namprd12.prod.outlook.com (2603:10b6:903:128::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Tue, 8 Feb
 2022 10:49:37 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::d0d1:eba5:5729:c636]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::d0d1:eba5:5729:c636%5]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 10:49:37 +0000
Message-ID: <ee08cc8e-7e7d-38ba-2e06-019bc8d5fdf3@amd.com>
Date: Tue, 8 Feb 2022 16:19:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [RFC v3 10/12] drm/amdgpu: Move in_gpu_reset into reset_domain
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220125223752.200211-1-andrey.grodzovsky@amd.com>
 <20220125223752.200211-11-andrey.grodzovsky@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20220125223752.200211-11-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0131.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::18) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01e68742-bb29-4ee0-40df-08d9eaf0b361
X-MS-TrafficTypeDiagnostic: CY4PR12MB1831:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB183197655015081F76A92CDA972D9@CY4PR12MB1831.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:144;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zApwGvn5TbM+teVQtqXN3Raho4pnJMG9pCKWIxQNtk1nAT/gmefHIRllJTiAG94u2pHrliGpAz5JUFBIRd9R4LQ1VsO4d5TeGkD3vmoRykt82R9jAhVJ8wgpnktbHD3ZEb0JCpOSMn2xmDZ05qgfR0HujSSJO/pLYOSyrXHHe5r9lFVtc3xAZPNP/IuGtdQyuEfynIlnHjxeXBTwP0j5JvgcnfSLtw0KJcNYkdnEz2wyvBg4BaIkBYArTAKxtv7G2i0Jk0oBIGhLkl3oMGK3iuLwsLL9D/HBUpyalXfo0pDuQziJAVfp4plS9rEwHxDgqfVlj+vbPDhYucNqC9ukF2fXWGh2MAzJcJyZompCCNtKWvScToX/ypsX9dNu37m2aCRPyVwWc46QIJ/wRZ2bmW99jFkNRVKWHC8TGl4aLe+vAmGJMVSkassL+mbxFZVeEYPtAcqKpt6Nmo5CI2q39r4y0/xYghgbtTPKzUqxJWFGlEebJNMey4cA45bvEEv2c9874EF/A7FWXo8VjHZL3v+wZG7SpjJGmOuGoLwNRcUQ9MEdaIeVHPA+6ScvKBK2ueZokJYGJqWV+qub7AHm6RPBQTAXuUhRs5L5a5KdK2tUk+NRzLjV3AWiUzcWKxyZyCq1wv/TgDfN1UVw4lD+CUUgQ6K+0K2Q05r75w/oxATEiGeuAjCC5y5oPbMA4yb2ciymbPsoj+bgEJJC4hCnCAJuo00R3twMxtiPLIVyor/Y1yu1H9paULHuUlwepvBP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(6666004)(316002)(6486002)(38100700002)(8676002)(4326008)(66476007)(66556008)(66946007)(5660300002)(86362001)(508600001)(31696002)(8936002)(36756003)(186003)(26005)(6512007)(31686004)(53546011)(2616005)(6506007)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUdNSS9UK2hKUGorZGY4WUNkbDBodnhPc29UbEwrSHdrOHVrUE5oSWlIV3F2?=
 =?utf-8?B?ekd1bjQxbXhtYXRaNG9rSVNtb2xTZHAvTmRYc28wVDBoSURhNUFPcENjVm9O?=
 =?utf-8?B?dDZFdnFFS3Q4eFBKRC9KWHVWTktPNUxVN1hFMVVvc3plcDFQZVJCMHlUQklK?=
 =?utf-8?B?WkNxSGRHcVFCZmU3ZXh2OXBLMlVBSlREeHJVY2ErUWRkNTFtOU5taHFrdGNu?=
 =?utf-8?B?cDhKVjlsNjFMbS84M2JxMEpmSGFmaDk1YVlYOGNEcit5cDBvNVdaRStyekRi?=
 =?utf-8?B?ZmhLdWtQQy9Hb21aQ1NLVU1janZMS0tHejFIUnNha3dORlBPN1RWOHp1WitO?=
 =?utf-8?B?VFY1cThTdjdKWis2c2FFYlBUbFhxandPak11NW11TjViaUVXTHlWTGtzQjdZ?=
 =?utf-8?B?YjVrRFhRVUtlMnlxOTJjSVd3NXM5bHk0Y2VzR0pXSTNNZVFZN1QxbDhEcCtQ?=
 =?utf-8?B?LzgyT1NVdU0zT21TWmcrVHJINm5RUEdUYTNSOTFWZGR4NjdTdVl5OHozN2pk?=
 =?utf-8?B?NWRSci81bFZMalcySVMvUHVqeWo0ME1ibHBseXhXa3gxNVJvZ0diM1BVQkRW?=
 =?utf-8?B?bi8zeXd4alVEWlVLc282TzBZU1FXWWh3emZhVWJWazdsTkFsbnVRdm1wK2Va?=
 =?utf-8?B?TDdZb2hSQmZoWTlNNHBxRWRVbDdEOEdremJWc09vcVFHSUNERUxoNlRrVlA2?=
 =?utf-8?B?MnVRU3JkYmpLQkFNZlo1K3ZNMVQwNWw5RlJHOHoxNVVWWHVwcXRqWVEwU1E3?=
 =?utf-8?B?NFhrTlhvaE1NQk8waEE0U2JrSHFVQzRrVTcyaHlWdlpMRkZ2bElIUUhGNEVv?=
 =?utf-8?B?RW9neVVQc3NVMlU5b0JtL0NqNUVoVFZiL1hTY0plRThOZlkzRytaaERHcW9G?=
 =?utf-8?B?WHJsdkVDWmxFMnR0RXpuazZRckdBa0lHVHBuTGRrRy9lUXNwSE5VSGwxV0kw?=
 =?utf-8?B?VnUyNjBXNFZkeUVabGVRZGprV0Rkckd5NmZtOVZNZmJXWFBPN0dWREtFaWlp?=
 =?utf-8?B?OWU2QUJqa0xGajMxVG4zSjZFc1E3ZXNYSGxMdjMwa3J3TGo0RFJ0c2Vqd2pX?=
 =?utf-8?B?bkgyaUJHM2Z0cFVXVUl0TS8zazRrcnpuVkZlMVRpWjVNamt1bmRlTjFvd2tQ?=
 =?utf-8?B?eGQ3Nk9ZbUpldDNsaDhNTVV0bWNnUmhydEkzTm42WGxqRlI5VS9Wb3g5empu?=
 =?utf-8?B?N3FEMzRFeTVuUy9ka0ZYVkFZVDh0VTlpZkU4MGpVSVpxa2dENzh0WXp5NU5w?=
 =?utf-8?B?aXpDU282M05vU1E3MnA3NFlSU0JCS0pDWHRyNEZIZ0VuejhRVHo5THVqQzN2?=
 =?utf-8?B?VndzWklacDcxUU1sSjNRMzFXWENhalUwV1pMbWhocS95ejFhM0RXS2dkS2Rw?=
 =?utf-8?B?SHZrTVFHbTA2ZmNpUjdVeWczUDdkYTVOcjJsRFZ3RDNBSTFkMnJZMzRTNzhR?=
 =?utf-8?B?RHRKc21rM3d6Vm5oQXpVb0pQdis1Z2x1dFBuSzlLSTBEWERla1RRdzJzU3Zp?=
 =?utf-8?B?MTNWR3EzMHBlYkpSRHdyWHhqNU5STExHbXlhVnR1QWdVTUQzZE5HS09McCtV?=
 =?utf-8?B?djZERXgwQ2d0aXRCeWpWczlFRnVMRHdLTUlTeE9QdWpvMWxxOWIrNnZyQW9Q?=
 =?utf-8?B?cFVYcG5VZmxxZjNwY3Zac0IxVVJEVXMrWlJrcVhXcHJibmxmTDNQeENVVXZI?=
 =?utf-8?B?QU1yZFJkZWtmYnNvdWg2WW1IS3NjbUtnN2FoVzFkYjFwKzlWK3N5a29ad3FK?=
 =?utf-8?B?Uk1SOW1HWnBYTWxFL1QvRUtZNEJtZ2lHMmM4N25jOWxRakxjdGl1Q0lJeFBP?=
 =?utf-8?B?QTd3VlkxNmNnV3dqYy9obFZiWkJ1bkdoZDVrUVU1WlQ3YVF4aFZWeUF2ZkZT?=
 =?utf-8?B?K2EvNURrSnNwR1dvUjJBNlhpeUZxc21OZUZXelpnSWp1WS9DaTNjeE1zbGc5?=
 =?utf-8?B?UDZUcDNaM1gxUW9sVWpsaDFvOGNuNmpmNzBVVEtaWUZXTGErVzllZXZ0VzFi?=
 =?utf-8?B?OHdiSVVaak92ODAyUjNWbFNCWVdpdkptRmZPZVg4MUFaUGRTcW01N09LZzU2?=
 =?utf-8?B?eEVMTzR3c1E1a090TUIrQXM0UUFzQlR2VFM5Wm9HVlZmc3dKQzFYRWI0ODBq?=
 =?utf-8?Q?Wa3I=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01e68742-bb29-4ee0-40df-08d9eaf0b361
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 10:49:37.7181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8aluL4Y+K1PpuuI3FUmguW1GK6PFClvVq5SDU1Lzvqdt3BbKuEq05+77SA+fVK/u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1831
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
> We should have a single instance per entrire reset domain.
> 
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Suggested-by: Lijo Lazar <lijo.lazar@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  7 ++-----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 10 +++++++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c  |  1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h  |  1 +
>   drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c      |  4 ++--
>   drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c      |  4 ++--
>   6 files changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index f021cd3c9d34..087796e389ab 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1056,7 +1056,6 @@ struct amdgpu_device {
>   	bool				in_s4;
>   	bool				in_s0ix;
>   
> -	atomic_t 			in_gpu_reset;
>   	enum pp_mp1_state               mp1_state;
>   	struct amdgpu_doorbell_index doorbell_index;
>   
> @@ -1461,8 +1460,6 @@ static inline bool amdgpu_is_tmz(struct amdgpu_device *adev)
>          return adev->gmc.tmz_enabled;
>   }
>   
> -static inline int amdgpu_in_reset(struct amdgpu_device *adev)
> -{
> -	return atomic_read(&adev->in_gpu_reset);
> -}
> +int amdgpu_in_reset(struct amdgpu_device *adev);
> +
>   #endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 6991ab4a8191..aa43af443ebe 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3511,7 +3511,6 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>   	mutex_init(&adev->mn_lock);
>   	mutex_init(&adev->virt.vf_errors.lock);
>   	hash_init(adev->mn_hash);
> -	atomic_set(&adev->in_gpu_reset, 0);
>   	mutex_init(&adev->psp.mutex);
>   	mutex_init(&adev->notifier_lock);
>   
> @@ -4775,7 +4774,7 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
>   static void amdgpu_device_lock_adev(struct amdgpu_device *adev,
>   				struct amdgpu_hive_info *hive)
>   {
> -	atomic_set(&adev->in_gpu_reset, 1);
> +	atomic_set(&adev->reset_domain->in_gpu_reset, 1);
>   
>   	if (hive) {
>   		down_write_nest_lock(&adev->reset_domain->sem, &hive->hive_lock);
> @@ -4800,7 +4799,7 @@ static void amdgpu_device_unlock_adev(struct amdgpu_device *adev)
>   {
>   	amdgpu_vf_error_trans_all(adev);
>   	adev->mp1_state = PP_MP1_STATE_NONE;
> -	atomic_set(&adev->in_gpu_reset, 0);
> +	atomic_set(&adev->reset_domain->in_gpu_reset, 0);
>   	up_write(&adev->reset_domain->sem);
>   }
>   
> @@ -5643,3 +5642,8 @@ void amdgpu_device_invalidate_hdp(struct amdgpu_device *adev,
>   
>   	amdgpu_asic_invalidate_hdp(adev, ring);
>   }
> +
> +int amdgpu_in_reset(struct amdgpu_device *adev)
> +{
> +	return atomic_read(&adev->reset_domain->in_gpu_reset);
> +}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> index 011585e330f6..e9b804a89b34 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> @@ -127,6 +127,7 @@ struct amdgpu_reset_domain *amdgpu_reset_create_reset_domain(char *wq_name)
>   
>   	}
>   
> +	atomic_set(&reset_domain->in_gpu_reset, 0);
>   	init_rwsem(&reset_domain->sem);
>   
>   	return reset_domain;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> index 7451089b0c06..413982f4e1ce 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> @@ -74,6 +74,7 @@ struct amdgpu_reset_domain {
>   	struct kref refcount;
>   	struct workqueue_struct *wq;
>   	struct rw_semaphore sem;
> +	atomic_t in_gpu_reset;

Maybe 'active' (independent of gpu) just to indicate that a reset is 
ongoing in the domain?

Thanks,
Lijo

>   };
>   
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
> index 5dab06fce26a..6c79746d18db 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
> @@ -258,7 +258,7 @@ static void xgpu_ai_mailbox_flr_work(struct work_struct *work)
>   		return;
>   
>   	amdgpu_virt_fini_data_exchange(adev);
> -	atomic_set(&adev->in_gpu_reset, 1);
> +	atomic_set(&adev->reset_domain->in_gpu_reset, 1);
>   
>   	xgpu_ai_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0, 0, 0);
>   
> @@ -271,7 +271,7 @@ static void xgpu_ai_mailbox_flr_work(struct work_struct *work)
>   	} while (timeout > 1);
>   
>   flr_done:
> -	atomic_set(&adev->in_gpu_reset, 0);
> +	atomic_set(&adev->reset_domain->in_gpu_reset, 0);
>   	up_write(&adev->reset_domain->sem);
>   
>   	/* Trigger recovery for world switch failure if no TDR */
> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
> index 868144fff16a..39f7e1e9ab81 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
> @@ -287,7 +287,7 @@ static void xgpu_nv_mailbox_flr_work(struct work_struct *work)
>   		return;
>   
>   	amdgpu_virt_fini_data_exchange(adev);
> -	atomic_set(&adev->in_gpu_reset, 1);
> +	atomic_set(&adev->reset_domain->in_gpu_reset, 1);
>   
>   	xgpu_nv_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0, 0, 0);
>   
> @@ -300,7 +300,7 @@ static void xgpu_nv_mailbox_flr_work(struct work_struct *work)
>   	} while (timeout > 1);
>   
>   flr_done:
> -	atomic_set(&adev->in_gpu_reset, 0);
> +	atomic_set(&adev->reset_domain->in_gpu_reset, 0);
>   	up_write(&adev->reset_domain->sem);
>   
>   	/* Trigger recovery for world switch failure if no TDR */
> 
