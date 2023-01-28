Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D42C067F64A
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 09:28:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCB410E0AA;
	Sat, 28 Jan 2023 08:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2087.outbound.protection.outlook.com [40.107.244.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2D210E0AA;
 Sat, 28 Jan 2023 08:28:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FgaXVCBHLGCRlGeczYAENAFJ2sig7oz69TKvCgy1ZjzMeRrruj/M0vmP21UH2HlT+4MnCjr6okXDTNPwL+YluqrEo8Y7+u4xFIIPH5+fFbUORXcKg55GdfQ2izCaGz7NwTqeoGxJ7r/lavM9ukA6iNcF+jLVjWKm8rVs49Q29wy0WIhnN/ZFPsNMT2y4WQuPea7Xppi8FJaPP2o91mnLH59XtM4nOm1YVKg/pHpkmIcgFQwqr4rDBad+v+hzGoTUABqf+VF3HGFcxcZCVqqMXEuBUmpQZKzMD/AIAfcITJruJEwiqtyashAmsG4fMFOkE1qhZek7DXg7CcycXLQu9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wk3LxTbKR74VWeTHYityUvYSzb6SMMLW8YwPWPTbu5U=;
 b=AvqyHzucFE8ikL9IvC+X4i9rVbNINbt8+4qXtIoEamUyaaQ9KolAMdXshfjcou0XRzB3hPE+lJQ7fY7KgjI9sJZwzQkG4DlKjp3zWLlP2pbbwEv4wLLsQt4Lvf9UJ3D4/qzv9qjoQ5VOMGB/FrAsopdZiLSMojuZ1j7lIo/zeviWsBfyLfLeKOB8H/DcU+timIKesXplvysjhVxgdS1Z7aEDYNOLyToMNXMan9RS6rlCIaX8g1mrh59drSMgpIT/40PHtoAd9G7y46oi9eCvzJL29OIkHWN1OkGylgmtX3fqXvk7+FI/ocD9tLYsaJdaRaZH3uDpEz/XAod82OczfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wk3LxTbKR74VWeTHYityUvYSzb6SMMLW8YwPWPTbu5U=;
 b=dXnAeuwGoe4JNnuFgNWfy2819zt0+S2u7hA+oCub9UW/2X9pEdVzBboWNcdd1Ac0vzhQMvZKgyi/ib6npHC2/CfwiK0zXT2N+NbtG9pPm42PJDpCWugBKPECougumwFbsnipYIc/kYxW9hlO65oJ52EQ5b+hYYR5eFFiyNeGGww=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB3650.namprd12.prod.outlook.com (2603:10b6:a03:1a3::19)
 by MW4PR12MB7482.namprd12.prod.outlook.com (2603:10b6:303:212::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.28; Sat, 28 Jan
 2023 08:28:41 +0000
Received: from BY5PR12MB3650.namprd12.prod.outlook.com
 ([fe80::702e:bbab:f7f6:aca7]) by BY5PR12MB3650.namprd12.prod.outlook.com
 ([fe80::702e:bbab:f7f6:aca7%7]) with mapi id 15.20.6043.022; Sat, 28 Jan 2023
 08:28:40 +0000
Message-ID: <e3ff3595-9717-83fc-92d2-d14bb66382a8@amd.com>
Date: Sat, 28 Jan 2023 16:28:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/5] drm/amd/amdgpu revert "implement tdr advanced mode"
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 luben.tuikov@amd.com, vprosyak@amd.com, Alexander.Deucher@amd.com,
 daniel.vetter@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20221026153557.63541-1-christian.koenig@amd.com>
From: "Yin, ZhenGuo (Chris)" <zhengyin@amd.com>
In-Reply-To: <20221026153557.63541-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0196.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::7) To BY5PR12MB3650.namprd12.prod.outlook.com
 (2603:10b6:a03:1a3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB3650:EE_|MW4PR12MB7482:EE_
X-MS-Office365-Filtering-Correlation-Id: c7896eef-730e-4c9c-9013-08db0109a8d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T76gwxnT1+6rLe3wknXrcJ31sSKFlHH/1c+yFnDi445+ax02YbReHbmtwXMXp8BJ0DeZJBvmAP+JdA3Nb2zzl9WJ8nD2A8SOSpfAMIE8fFCz1cjGfpdXMp+s3psBrYtfMlxdY+Lhb8CskR1ktzTtqrvqC1c17UV9AxSXu1qkRZ7E7CfrScriiXZA5oMSilHE4JYN3PAT1JksNZxXpAAH6AvkgJjGi/DzloaqCUDCr8HouXKbKjzz6bK/pEQ8U/tfYev8l1DUius76BHZDbPjoLQi2kTwmxxH2EOZO8fk3VxSZyotSo+jkIhcaG+x4M774DZA+rbHTh1g8eAFTebNwqU5c1XLmmdXJFxFCpdXapfZtHpATQ5DW8ueADzEzitm+zu3+B04Ga1wnRLs1vCZQ9QIYRtwYKfKLrfd55jLNuBjq3v3UNKgL73mKyUiFSsA3nZ6cP3TxcESAIIypqLRbJs0EYxr38maqM7QzjMe22VoUeX/4CBtoRw3KnYTtyXr2kOB0E73/p9m1anVMJANj2+s0EuHrx+1+xROkf0sGr4RpAs3jqo/XS6uW9RYEvI5m/g0COc1k5X35cLYhtaqROfED0oauZ/Ivd3VVhdN3c06Bxm78zBmaQ2lRsUOeQaeYjKgLIAweReIdQ8vbXqQ3cGN5Y+OwXVp7o0pX+yGpTRh0LOfAie2G6LpE0mw50UIeY/54guN08PBPjAnOPkJTEgqCdbjJ5KOjY7Va7lfNp0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB3650.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(34036004)(366004)(346002)(136003)(39860400002)(396003)(376002)(451199018)(2906002)(36756003)(6486002)(30864003)(83380400001)(66574015)(53546011)(6506007)(508600001)(6666004)(2616005)(6512007)(186003)(26005)(4326008)(66476007)(66556008)(66946007)(8676002)(316002)(8936002)(5660300002)(41300700001)(31696002)(38100700002)(41320700001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWlDMGtFeEY5NDRMNS92VTl0QkFYbjUwNkZHRERZbkdyTk5oK21UNk5rMElO?=
 =?utf-8?B?SGxZYytmd2xvU3J6MnhhbGMyVEF4Q0xuVjVUVC9UTmlwR1o5eWNYQjNlSlUv?=
 =?utf-8?B?TFdwTjAza1M3U1V1VUQ4aE1sWkkzTXRFYzNSN0ErMlhLVllkWi9GM0hmODNr?=
 =?utf-8?B?S0NjS3RnK2RpekZmWnMzaHhjRDVzTlJHRDlteHkzRHAyd1ZrWG1Oa1J2UkFN?=
 =?utf-8?B?VG16eW1YWFVpTG1haGZWNTJGUk5lbjFOWEJiTnBTeloxWHN4WjVPYWVtYjN1?=
 =?utf-8?B?RzFZRkx1MlpaS3N3SnBCdDVHR0JhYnc4cXFBbk9OSjZDVHk3T3F2NTNSOGNs?=
 =?utf-8?B?b3NRSFgyVkIwaWlsYmxrM0drOFllQzErNVA3dTFzNlpRUFdLeEtFL1AzM012?=
 =?utf-8?B?WW1tRHZ1anJaT0JONjNpUkVIWklmTktVWXRKcG16b3ZBOElFcnlhM3Mxc1Ew?=
 =?utf-8?B?WGVKbldNSjdmRGJLVjQvR0JVa2ZpdjdsdSt6UEpEeU1Yc0kvTkNWcFBvbHY4?=
 =?utf-8?B?Z3pVN0wwT1pwcXZ5MkVwM1RIbWpJbjlsYzZWd2owNjVJdzltenNZMkVLbmdx?=
 =?utf-8?B?MDY4QXNFbk1OVjFFZll6SnZyQmFVTDYyZTRjUWRGdE80QmZ4OGYwNy9GY2Z2?=
 =?utf-8?B?TlZwL09tWC9ldC9NS2gwclBSL0tvRDZ3ZWFkT2J2dUZqTkFqTXo4MmUzUUVr?=
 =?utf-8?B?OEJxOWkxM1kvTEpIUHIyZEsvczhOWTFqSWpGdUhRQ053d0J5RXdRUzNHaG5q?=
 =?utf-8?B?d1dsUmVCd1pFOUcwbWcxb1hGL3hFVzFjalVNcVYyTG9mM2tiQkttais4M00r?=
 =?utf-8?B?dGR2amxxMi9GZExjaUxmd2Y5S0o1SWNUdVJLeVhkMEJMMlg5SEVXUGtueDlo?=
 =?utf-8?B?WTZOaGs2NzhCOG5vcVI5Q3EvZG1GSlNwVEZZTXRGd1pqSlBES2xCTWxXTGdr?=
 =?utf-8?B?NERKenN2SUpUOERIWFJ5eGp0Y1NWNmlHL2xJY3c4cjhJQVRGVjZwYW90d0Vw?=
 =?utf-8?B?U0U2KzRtMFAzNGNaWTdkOWZZSmJHdmdZNDVSakRLMy9PVXRWREhLSmtoTjl0?=
 =?utf-8?B?VlBFSmtRbFU3bzRVa1NzbVRVSDdjNWZrMHFvZjV2YkV4MXdzMlpsa1FpMjhB?=
 =?utf-8?B?ZXJ5MG9uMkUwaWUyR2tqbmQvUXczUVEyeVJJQmorZDhHREJqcEI0QXNudVFo?=
 =?utf-8?B?WTRzUWMrZ0o5RHFOM1h4MEp2SHBZUlJXV0FsZzdmL3FqWjl3NjdsSVFJYk9W?=
 =?utf-8?B?c0NMRnFwTnltWXlZTmZTWk80UUYwREo0bjZiZ2tQWDh2Vm0vdnVoSjU4NUdy?=
 =?utf-8?B?NjQ5R3RMNnBBaW1WdkdpVjRLd0ZFWDUzTnE0RVpzNlQ3ak5NT3NFZkxtdjI4?=
 =?utf-8?B?UDBIMkVDQVlJWXF5RHFpeGpzU1hhc0ZxN0J5Nk1YT3dGWnBFTjg1TGdxK1pT?=
 =?utf-8?B?R2Z2MFgwa2lxWmMrWjEwNUJHTEJLclM4WlZiU3JaN0lhZjVVaUtvUUVhd2dE?=
 =?utf-8?B?Nm1PSG9oR3hxUXptWTk3TVpsYVVFNzZPY3VaVkNUTElweFAyMC9XVDdCRGVv?=
 =?utf-8?B?Y3ZYVktqV0xJTG9DdVpCaDAvVFFYbmFuTDZkeXVTWE13NUU2dEY5UnFpdW9E?=
 =?utf-8?B?ZnlkSFZ3MmVJWjFLTGtNQnplemtxeUIrdVdZbXZJOFBkN0x5aFJFZzFiWStI?=
 =?utf-8?B?YitGRCt4R1NuTnZlcVNrRHdUVGxPaGVUcGN2S3I4K1FvaG55TTdKREFsMmh2?=
 =?utf-8?B?ZUJYQU1WYTYvcnU1VnlMWm05V1BGeWtsRjRjS0ltNDMxVTJhYUFneUMvRVFq?=
 =?utf-8?B?Rm4ybW1iMHBVWVdwb3dIM3VJVzNsbzVrRDFwWnpmY3pYZCt5eUs2TERRVHhI?=
 =?utf-8?B?UkhXdmtQVUcycFNuNmIvTnFJRmI2L2lQY0dMT2creFZqRnc0VTZXMGtUWTRN?=
 =?utf-8?B?WU43QlhQaEZFRHZLSmVDaCtNNVNkM1IvWHRQT1RIeEkzZTVuRU1CQzVRZVp1?=
 =?utf-8?B?NTkwWktvR0JQUm5ocDJqRlBsS3FvSHRPbTBZMUwrV1dvcUgrRTliaUhsQVNx?=
 =?utf-8?B?bmNHNEk1QzlSc3puMmVheHArOVdmbTRyb3dhOG54TzVLU3RBbHUyUzN6dmdC?=
 =?utf-8?Q?Sh10Tma4Ul2M9zdRQaGiEbvOt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7896eef-730e-4c9c-9013-08db0109a8d5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3650.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2023 08:28:40.5239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R0n4CYo4fRQ7Z/hU8mdQuMUKzPkwoK20LkJNdZI6clOoTJaGYCq6P4/y+CN38REeD0iut4aI5WhYcLUfmyPjKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7482
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
Cc: jingwen.chen2@amd.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, monk.liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Christian

A later bad compute job can block a good gfx job, so the original TDR 
design find a wrong guilty job(good gfx job).

Advanced TDR re-submits jobs in order to find the real guilty job(bad 
compute job).

After reverting this commit, how does the new gang-submit promise the 
isolation between compute jobs and gfx jobs?

On 10/26/2022 11:35 PM, Christian König wrote:
> This reverts commit e6c6338f393b74ac0b303d567bb918b44ae7ad75.
>
> This feature basically re-submits one job after another to
> figure out which one was the one causing a hang.
>
> This is obviously incompatible with gang-submit which requires
> that multiple jobs run at the same time. It's also absolutely
> not helpful to crash the hardware multiple times if a clean
> recovery is desired.
>
> For testing and debugging environments we should rather disable
> recovery alltogether to be able to inspect the state with a hw
> debugger.
>
> Additional to that the sw implementation is clearly buggy and causes
> reference count issues for the hardware fence.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 103 ---------------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |   2 +-
>   drivers/gpu/drm/scheduler/sched_main.c     |  58 ++----------
>   include/drm/gpu_scheduler.h                |   3 -
>   4 files changed, 10 insertions(+), 156 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 6f958603c8cc..d4584e577b51 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -5070,94 +5070,6 @@ static int amdgpu_device_suspend_display_audio(struct amdgpu_device *adev)
>   	return 0;
>   }
>   
> -static void amdgpu_device_recheck_guilty_jobs(
> -	struct amdgpu_device *adev, struct list_head *device_list_handle,
> -	struct amdgpu_reset_context *reset_context)
> -{
> -	int i, r = 0;
> -
> -	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
> -		struct amdgpu_ring *ring = adev->rings[i];
> -		int ret = 0;
> -		struct drm_sched_job *s_job;
> -
> -		if (!ring || !ring->sched.thread)
> -			continue;
> -
> -		s_job = list_first_entry_or_null(&ring->sched.pending_list,
> -				struct drm_sched_job, list);
> -		if (s_job == NULL)
> -			continue;
> -
> -		/* clear job's guilty and depend the folowing step to decide the real one */
> -		drm_sched_reset_karma(s_job);
> -		drm_sched_resubmit_jobs_ext(&ring->sched, 1);
> -
> -		if (!s_job->s_fence->parent) {
> -			DRM_WARN("Failed to get a HW fence for job!");
> -			continue;
> -		}
> -
> -		ret = dma_fence_wait_timeout(s_job->s_fence->parent, false, ring->sched.timeout);
> -		if (ret == 0) { /* timeout */
> -			DRM_ERROR("Found the real bad job! ring:%s, job_id:%llx\n",
> -						ring->sched.name, s_job->id);
> -
> -
> -			amdgpu_fence_driver_isr_toggle(adev, true);
> -
> -			/* Clear this failed job from fence array */
> -			amdgpu_fence_driver_clear_job_fences(ring);
> -
> -			amdgpu_fence_driver_isr_toggle(adev, false);
> -
> -			/* Since the job won't signal and we go for
> -			 * another resubmit drop this parent pointer
> -			 */
> -			dma_fence_put(s_job->s_fence->parent);
> -			s_job->s_fence->parent = NULL;
> -
> -			/* set guilty */
> -			drm_sched_increase_karma(s_job);
> -			amdgpu_reset_prepare_hwcontext(adev, reset_context);
> -retry:
> -			/* do hw reset */
> -			if (amdgpu_sriov_vf(adev)) {
> -				amdgpu_virt_fini_data_exchange(adev);
> -				r = amdgpu_device_reset_sriov(adev, false);
> -				if (r)
> -					adev->asic_reset_res = r;
> -			} else {
> -				clear_bit(AMDGPU_SKIP_HW_RESET,
> -					  &reset_context->flags);
> -				r = amdgpu_do_asic_reset(device_list_handle,
> -							 reset_context);
> -				if (r && r == -EAGAIN)
> -					goto retry;
> -			}
> -
> -			/*
> -			 * add reset counter so that the following
> -			 * resubmitted job could flush vmid
> -			 */
> -			atomic_inc(&adev->gpu_reset_counter);
> -			continue;
> -		}
> -
> -		/* got the hw fence, signal finished fence */
> -		atomic_dec(ring->sched.score);
> -		dma_fence_get(&s_job->s_fence->finished);
> -		dma_fence_signal(&s_job->s_fence->finished);
> -		dma_fence_put(&s_job->s_fence->finished);
> -
> -		/* remove node from list and free the job */
> -		spin_lock(&ring->sched.job_list_lock);
> -		list_del_init(&s_job->list);
> -		spin_unlock(&ring->sched.job_list_lock);
> -		ring->sched.ops->free_job(s_job);
> -	}
> -}
> -
>   static inline void amdgpu_device_stop_pending_resets(struct amdgpu_device *adev)
>   {
>   	struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
> @@ -5178,7 +5090,6 @@ static inline void amdgpu_device_stop_pending_resets(struct amdgpu_device *adev)
>   
>   }
>   
> -
>   /**
>    * amdgpu_device_gpu_recover - reset the asic and recover scheduler
>    *
> @@ -5201,7 +5112,6 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>   	int i, r = 0;
>   	bool need_emergency_restart = false;
>   	bool audio_suspended = false;
> -	int tmp_vram_lost_counter;
>   	bool gpu_reset_for_dev_remove = false;
>   
>   	gpu_reset_for_dev_remove =
> @@ -5347,7 +5257,6 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>   		amdgpu_device_stop_pending_resets(tmp_adev);
>   	}
>   
> -	tmp_vram_lost_counter = atomic_read(&((adev)->vram_lost_counter));
>   	/* Actual ASIC resets if needed.*/
>   	/* Host driver will handle XGMI hive reset for SRIOV */
>   	if (amdgpu_sriov_vf(adev)) {
> @@ -5372,18 +5281,6 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>   	/* Post ASIC reset for all devs .*/
>   	list_for_each_entry(tmp_adev, device_list_handle, reset_list) {
>   
> -		/*
> -		 * Sometimes a later bad compute job can block a good gfx job as gfx
> -		 * and compute ring share internal GC HW mutually. We add an additional
> -		 * guilty jobs recheck step to find the real guilty job, it synchronously
> -		 * submits and pends for the first job being signaled. If it gets timeout,
> -		 * we identify it as a real guilty job.
> -		 */
> -		if (amdgpu_gpu_recovery == 2 &&
> -			!(tmp_vram_lost_counter < atomic_read(&adev->vram_lost_counter)))
> -			amdgpu_device_recheck_guilty_jobs(
> -				tmp_adev, device_list_handle, reset_context);
> -
>   		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>   			struct amdgpu_ring *ring = tmp_adev->rings[i];
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 16f6a313335e..f177d8e5b665 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -519,7 +519,7 @@ module_param_named(compute_multipipe, amdgpu_compute_multipipe, int, 0444);
>    * DOC: gpu_recovery (int)
>    * Set to enable GPU recovery mechanism (1 = enable, 0 = disable). The default is -1 (auto, disabled except SRIOV).
>    */
> -MODULE_PARM_DESC(gpu_recovery, "Enable GPU recovery mechanism, (2 = advanced tdr mode, 1 = enable, 0 = disable, -1 = auto)");
> +MODULE_PARM_DESC(gpu_recovery, "Enable GPU recovery mechanism, (1 = enable, 0 = disable, -1 = auto)");
>   module_param_named(gpu_recovery, amdgpu_gpu_recovery, int, 0444);
>   
>   /**
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index e0ab14e0fb6b..bb28f31bff6f 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -355,27 +355,6 @@ static void drm_sched_job_timedout(struct work_struct *work)
>   	}
>   }
>   
> - /**
> -  * drm_sched_increase_karma - Update sched_entity guilty flag
> -  *
> -  * @bad: The job guilty of time out
> -  *
> -  * Increment on every hang caused by the 'bad' job. If this exceeds the hang
> -  * limit of the scheduler then the respective sched entity is marked guilty and
> -  * jobs from it will not be scheduled further
> -  */
> -void drm_sched_increase_karma(struct drm_sched_job *bad)
> -{
> -	drm_sched_increase_karma_ext(bad, 1);
> -}
> -EXPORT_SYMBOL(drm_sched_increase_karma);
> -
> -void drm_sched_reset_karma(struct drm_sched_job *bad)
> -{
> -	drm_sched_increase_karma_ext(bad, 0);
> -}
> -EXPORT_SYMBOL(drm_sched_reset_karma);
> -
>   /**
>    * drm_sched_stop - stop the scheduler
>    *
> @@ -516,32 +495,15 @@ EXPORT_SYMBOL(drm_sched_start);
>    *
>    */
>   void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched)
> -{
> -	drm_sched_resubmit_jobs_ext(sched, INT_MAX);
> -}
> -EXPORT_SYMBOL(drm_sched_resubmit_jobs);
> -
> -/**
> - * drm_sched_resubmit_jobs_ext - helper to relunch certain number of jobs from mirror ring list
> - *
> - * @sched: scheduler instance
> - * @max: job numbers to relaunch
> - *
> - */
> -void drm_sched_resubmit_jobs_ext(struct drm_gpu_scheduler *sched, int max)
>   {
>   	struct drm_sched_job *s_job, *tmp;
>   	uint64_t guilty_context;
>   	bool found_guilty = false;
>   	struct dma_fence *fence;
> -	int i = 0;
>   
>   	list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
>   		struct drm_sched_fence *s_fence = s_job->s_fence;
>   
> -		if (i >= max)
> -			break;
> -
>   		if (!found_guilty && atomic_read(&s_job->karma) > sched->hang_limit) {
>   			found_guilty = true;
>   			guilty_context = s_job->s_fence->scheduled.context;
> @@ -551,7 +513,6 @@ void drm_sched_resubmit_jobs_ext(struct drm_gpu_scheduler *sched, int max)
>   			dma_fence_set_error(&s_fence->finished, -ECANCELED);
>   
>   		fence = sched->ops->run_job(s_job);
> -		i++;
>   
>   		if (IS_ERR_OR_NULL(fence)) {
>   			if (IS_ERR(fence))
> @@ -567,7 +528,7 @@ void drm_sched_resubmit_jobs_ext(struct drm_gpu_scheduler *sched, int max)
>   		}
>   	}
>   }
> -EXPORT_SYMBOL(drm_sched_resubmit_jobs_ext);
> +EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>   
>   /**
>    * drm_sched_job_init - init a scheduler job
> @@ -1081,13 +1042,15 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>   EXPORT_SYMBOL(drm_sched_fini);
>   
>   /**
> - * drm_sched_increase_karma_ext - Update sched_entity guilty flag
> + * drm_sched_increase_karma - Update sched_entity guilty flag
>    *
>    * @bad: The job guilty of time out
> - * @type: type for increase/reset karma
>    *
> + * Increment on every hang caused by the 'bad' job. If this exceeds the hang
> + * limit of the scheduler then the respective sched entity is marked guilty and
> + * jobs from it will not be scheduled further
>    */
> -void drm_sched_increase_karma_ext(struct drm_sched_job *bad, int type)
> +void drm_sched_increase_karma(struct drm_sched_job *bad)
>   {
>   	int i;
>   	struct drm_sched_entity *tmp;
> @@ -1099,10 +1062,7 @@ void drm_sched_increase_karma_ext(struct drm_sched_job *bad, int type)
>   	 * corrupt but keep in mind that kernel jobs always considered good.
>   	 */
>   	if (bad->s_priority != DRM_SCHED_PRIORITY_KERNEL) {
> -		if (type == 0)
> -			atomic_set(&bad->karma, 0);
> -		else if (type == 1)
> -			atomic_inc(&bad->karma);
> +		atomic_inc(&bad->karma);
>   
>   		for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_KERNEL;
>   		     i++) {
> @@ -1113,7 +1073,7 @@ void drm_sched_increase_karma_ext(struct drm_sched_job *bad, int type)
>   				if (bad->s_fence->scheduled.context ==
>   				    entity->fence_context) {
>   					if (entity->guilty)
> -						atomic_set(entity->guilty, type);
> +						atomic_set(entity->guilty, 1);
>   					break;
>   				}
>   			}
> @@ -1123,4 +1083,4 @@ void drm_sched_increase_karma_ext(struct drm_sched_job *bad, int type)
>   		}
>   	}
>   }
> -EXPORT_SYMBOL(drm_sched_increase_karma_ext);
> +EXPORT_SYMBOL(drm_sched_increase_karma);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 0fca8f38bee4..c564be29c5ae 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -488,10 +488,7 @@ void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
>   void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
>   void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery);
>   void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
> -void drm_sched_resubmit_jobs_ext(struct drm_gpu_scheduler *sched, int max);
>   void drm_sched_increase_karma(struct drm_sched_job *bad);
> -void drm_sched_reset_karma(struct drm_sched_job *bad);
> -void drm_sched_increase_karma_ext(struct drm_sched_job *bad, int type);
>   bool drm_sched_dependency_optimized(struct dma_fence* fence,
>   				    struct drm_sched_entity *entity);
>   void drm_sched_fault(struct drm_gpu_scheduler *sched);
