Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A908C782AD6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 15:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE4110E26A;
	Mon, 21 Aug 2023 13:50:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659A510E266;
 Mon, 21 Aug 2023 13:50:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lA88B9nGrj5sub1Vc+Bjq0RkPHPJZ3uDSMgX8C47rmDZ20pS4ADGtmmoyhSEEwywt6RR6TQw2u1M+ZGpFh1ggtSNmwlJ5wtogSNAdUXGsY81b8prCIGtXXonkpgI9WK+bd6hWf5ZDbWSmU2ZbGCol3KDjjes32cTFjgMxMm2cs68rqm67XaNynltE1jUFiuJ5ngXIh/NiAW6RDy3uLc7N1IkS8q2aOkgTAHkqQT+QXcq5NKgj3ii6vuYIdNayauMQC4aMTZlhnFbn1iOk8UIyQvMbC608sFyMW+bTmN03IfTqLKYnhsDjQhlrVEb5IXaPEKcRLZqYxr3icSf70HhZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1bM+DMIyDAWYAYELtZvHsR69uripy0c7WIv9i6xO7U=;
 b=nYvoktXAmKvd6lxWRGopTcGCh6xSxNVHrs+KZvjIOssA8ItjEi7U1BYzLBf7sl4lR87tFbnVthCmJH5OJzHIVTuvhNcjX75V1kb8Kh9UTtbXL3ai460CIOw0MczprWfJoVp/HpJ/ehIHdv+ueJ0h3ehV0iDg6G+yC7CdYglE0yt8FCHkPoA/T14LHWEjWPYn/sbn11s+Ipzi/BMasQHswLhOPy7MSBlD28p2DmtpMtaQzBo/yzcdhNK8ANHI3tCV3ZqJJWzOQxtYkANGgWhXLckU2GOmpuEVKg+N0dOB95aefxDOTYLp7ZheljxhsairJ585QOXH3PbuYqTwQJQu/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1bM+DMIyDAWYAYELtZvHsR69uripy0c7WIv9i6xO7U=;
 b=TstNhIReO0ZU3VCmGkkpWES3dXCsmGhWw5RaADOvPR2gWE4E2TgAlzyHOdd0GXWrQQJ68JxziSqiJeso/3lGw0+c2IYMzNkOYIe3Bqf+A7yEMcuFy8aJIWaPKFyUveh4JFUOiSeaMsO9yUp91QLgUG444CC5MzHeYCdG/llnRpg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by PH8PR12MB6699.namprd12.prod.outlook.com (2603:10b6:510:1ce::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 13:50:02 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86%3]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 13:50:02 +0000
Message-ID: <bd2968b0-21bc-7398-f333-1ff11cb705a9@amd.com>
Date: Mon, 21 Aug 2023 15:49:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 7/7] Revert "drm/amd/amdgpu: switch on/off vcn power
 profile mode"
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, Christian.Koenig@amd.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
 <20230821064759.94223-8-Arvind.Yadav@amd.com>
From: Shashank Sharma <shashank.sharma@amd.com>
In-Reply-To: <20230821064759.94223-8-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0248.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::10) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|PH8PR12MB6699:EE_
X-MS-Office365-Filtering-Correlation-Id: 48f272d1-0c6a-4d04-584c-08dba24d83fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nuJBQRGtq45Ey8e+sDt7cKUGX58KiFOBWeAr4Gqoa0HKGLP03rtq8DW732SDEHdITRMx/9T/UvHekNO+XwckPMQ1eNOm2SVmmS6FuNLtZiWLgl2bRBy4lsZiazqxYzYwkKJ1ZvEgzp2Uhq/4xAn0d0JqNYnmcueiSLOFGGmmL8jm/rTabU6OMOo2h7oafm6NsD5BwJiM6QqqcHDYPYb/Z6ejbFvmuuwePgpti9/fBZnj9N4epXc9uptW8dvJj7xUTBU64mCd3A8ymhtpwD/FoYRm0sqkbivmCRI2zyHhcsXHKUxLIMF1/JYdrqFts8dBdCQVUsNO0PpY2RZLsqqnw+RXfjxSn2YnaxxhtPTC0EyzCSA9ZelKtkqlxcg7aK3gkkiB6vaxpCZw2O3ZDOOcE5As2gMfvhgym37R2C5ZTsBJaKvqDdjHGENQx5zBQ6FWl76FrRi186l/+IMzq8MfVTy5QF+hIOSMz361iMkiXj0dBO2blTAaWLLoeALCy+1fQDPbJdDbQfS7fx+OHX7pa5diUxvIJnYvyPpleADVb0cThvSEjTxQQUMKGj9Wlj83qpkz5PspevPD5fDBdSuzHWyTx+sngsX1LflIQ1Ia6wzNnXJZlLl7/+Yob8zM/wvHYadsbeIZ2vr99GC23yaHVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199024)(186009)(1800799009)(2906002)(53546011)(38100700002)(6506007)(6486002)(83380400001)(5660300002)(44832011)(26005)(86362001)(31686004)(31696002)(8676002)(2616005)(8936002)(4326008)(316002)(66946007)(6512007)(66556008)(66476007)(478600001)(6666004)(36756003)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEpCRlUyWWM3RUtZNXlXb2ZDU2dPMTh4VUJNSGEvdXZ4cGNDMnZDZVlCclJH?=
 =?utf-8?B?bTlUSkRzNUoxZ3FjSEFwa1ZsZ0JXdG0xTGR6U3hraEcvd21GU3BLZzZuZGpt?=
 =?utf-8?B?ZHBCTGx4Ym4wNXR0MG1hVFBTZFhKd2NOMW01OG84UEwzUTF6TjZvUDRmanda?=
 =?utf-8?B?cXRzMTFiZVF2S0puT1MraFZEQmxjb3RMQmlnazdoS3FZRElmOXd3UHFGdXBC?=
 =?utf-8?B?NXJDOENDTFNnWU9qOFFkLzUyMWpZbXE1S1FJamI3dG5yQjI0Ujg3YlRTb3Y1?=
 =?utf-8?B?S2pHdjNYUjZsOE4xVFpoUDRSeHdJOHA3VmdEbUI0NXNYN1pJOE9QajFGSUpo?=
 =?utf-8?B?RnVhaXdETXJiTTV5SE9yNjEzRHg0d1BBOThWSWdEVTVXRWhJUE5yVkN5ZVRY?=
 =?utf-8?B?Yi9ZUGFabDYxekpKVWYxb3J3NUwzUmV3WGtCODRTY0FHNHMrU09IYytmMklT?=
 =?utf-8?B?RGc3RHZHbmlRTVliL3dOS1NkT2NnTjcrR04wTE0vbmdwZmNRdVdDUmtXd01S?=
 =?utf-8?B?Vzd1VnZVZmp6dUNGcFlzVllKSlAzU3lCWWUrR1BnK1cwRStSdXlqUXVJeEwv?=
 =?utf-8?B?eTI2ZnVSZGxlS3JJWHVGaDU0OVhkYWZLdVJMbm11QXRqTGZwTnV2N0ZaS1Z1?=
 =?utf-8?B?dDhVN3B4VFo4b2RXdWkzOGxmRkZmY3pTRTRUT2VSME9iZmwxeDVmLzBPOVBV?=
 =?utf-8?B?OEdhd1owTmFoMEZaQ3dsRWFxZGNFNjlWRzl6MStrRlNVOUdtTk0vd0oxTG95?=
 =?utf-8?B?NWZVZm84eURKcElVMzEySjd4Vi9Rem9PcU5vUDVKVFdyUVRMeFdFdTVIUUVZ?=
 =?utf-8?B?YlpDblcxOUJmWW9zTTBSUGVyT1pURkt4VlVVZFdZcnFNUzdmdWkwN0VnVTFB?=
 =?utf-8?B?VEFPMFFyN0YveUV2djBFcWh0WStMYmFLM3FNeTFVN0FXVnhycGFFSFoyL2xS?=
 =?utf-8?B?TFQxNWYwVjhQYlJ0Rk9OSmFhcWgrb3dLa0ZhQXM1c1JKK3Q0WTB5NVVCZ3Mx?=
 =?utf-8?B?b2hwczBSZE9FQ0h3Q3pwTW52ZUp5eGRQWHY4d204cGF1czc1T1dqTFR1MWxB?=
 =?utf-8?B?UCtobDRRKzQvVGRNeGdrTytzVTI4dCs2Vi9nUnFsczcvZFVnK2VyQlo5MFBB?=
 =?utf-8?B?QnJYVVhoaEJiSFpqT0RzSFBtaTJ0anZIVkt4di9HQ2pSQWM5dEY1OW9CMUZk?=
 =?utf-8?B?d1V5YjBzcUhQb2NqQjFvbjluWnZyQkw2Tll5V2V2cE0xQjU0eFBRMytlcG9P?=
 =?utf-8?B?OEg2VE1ERVRldW1tUW1TU2dJL3FUVmUwNDFac2FRUXpWL1JjdTlYUjRCU2VI?=
 =?utf-8?B?WUcyakFtT2pwZnZETVBWa1h4WGxwbXpxdTlKQWExcGwyaTlPM3pPNC9nQkpm?=
 =?utf-8?B?MWRJR3licXhlOWhFaTA3azFRaTZNc3kwQTZtL0lWMkhvSFB1ZGh5NnUxMDNi?=
 =?utf-8?B?REt1NStPQmxjYnNPcmpmNEppU3dHMy81YnBET3VPY0VWWjRVTGEzaHV1c2dG?=
 =?utf-8?B?cnFyejZ3ci9IeHRGZy9scDBjY0gxUGt4TEp0allvZFRaZXkyWllBYi9RZ1BR?=
 =?utf-8?B?aldIenJlRnRleTUvVGNYcFczZE9lSW01bisvSGdhK0JpM3V5TDF6UmN1OGRx?=
 =?utf-8?B?Z1hXOCtaYTRUZVZVOHNkVi96dktFSmpLNVgvN1dvOVhMeDZ6K0psQnhva2pn?=
 =?utf-8?B?VG1iaHlmRTF3UlZWNEljTFNHMHVQc2VmeUxGczJTd1ZRNWpSNWpCTGd1RlY2?=
 =?utf-8?B?UjEwZHAzZ0YyK0JuODRDNzRENDYraWM4emRvRU80d2ROK244TUZBRDRZSWZs?=
 =?utf-8?B?RWRCcGd5ZkM1bUZOZVJzVUZEckJGd2JQMzl4RU1jczcyOHVaVlkxVUZSbnU1?=
 =?utf-8?B?Y3pZNFpxU0NVNFdQOThlY2pwd0ltRzFKdSthZ216bmthcHpHenNmWUhYSTJY?=
 =?utf-8?B?Qm5HaFF2MU10S2dPc2YyV3NneXVZa09IMW1sMExjRWlHNm42YlBVZFZoUVNy?=
 =?utf-8?B?Z1JCN1FRSHRSWnhxZE54aEs4NVZrWDFjcmdidUdnSTJLZzh3eWFubGwvbFZH?=
 =?utf-8?B?VFlWQ2JIL1JlQStNMjIvU3ZKZWdqUmtaV01iZzZ4eU9XZWNqa3JQaXBzTE5Q?=
 =?utf-8?Q?zaE2rZ15hQjT9NcOhz/Ecf9zs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f272d1-0c6a-4d04-584c-08dba24d83fe
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 13:50:01.9207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 06F0fVfXddOFJEATr1Ik8u5tMAsNGT3cjlhifmZWp/yTB/CQMvNcqOwjRbbt965f+wJvOJq/qyOE/tn2fCXQjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6699
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Someone from MM should also confirm on this, but:

Acked-by: Shashank Sharma <shashank.sharma@amd.com>


On 21/08/2023 08:47, Arvind Yadav wrote:
> This reverts commit 5ce71f59bb9bd3d8a09b96afdbc92975cb6dc303.
>
> Reason for revert: New  amdgpu_workload_profile* api is added
> to switch on/off profile mode. These new api will allow to
> change the GPU power profile based on a submitted job.
>
> Cc: Shashank Sharma <shashank.sharma@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 14 ++------------
>   1 file changed, 2 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> index 2d94f1b63bd6..70777fcfa626 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> @@ -363,7 +363,6 @@ static void amdgpu_vcn_idle_work_handler(struct work_struct *work)
>   		container_of(work, struct amdgpu_device, vcn.idle_work.work);
>   	unsigned int fences = 0, fence[AMDGPU_MAX_VCN_INSTANCES] = {0};
>   	unsigned int i, j;
> -	int r = 0;
>   
>   	for (j = 0; j < adev->vcn.num_vcn_inst; ++j) {
>   		if (adev->vcn.harvest_config & (1 << j))
> @@ -392,10 +391,6 @@ static void amdgpu_vcn_idle_work_handler(struct work_struct *work)
>   	if (!fences && !atomic_read(&adev->vcn.total_submission_cnt)) {
>   		amdgpu_device_ip_set_powergating_state(adev, AMD_IP_BLOCK_TYPE_VCN,
>   		       AMD_PG_STATE_GATE);
> -		r = amdgpu_dpm_switch_power_profile(adev, PP_SMC_POWER_PROFILE_VIDEO,
> -				false);
> -		if (r)
> -			dev_warn(adev->dev, "(%d) failed to disable video power profile mode\n", r);
>   	} else {
>   		schedule_delayed_work(&adev->vcn.idle_work, VCN_IDLE_TIMEOUT);
>   	}
> @@ -404,16 +399,11 @@ static void amdgpu_vcn_idle_work_handler(struct work_struct *work)
>   void amdgpu_vcn_ring_begin_use(struct amdgpu_ring *ring)
>   {
>   	struct amdgpu_device *adev = ring->adev;
> -	int r = 0;
>   
>   	atomic_inc(&adev->vcn.total_submission_cnt);
>   
> -	if (!cancel_delayed_work_sync(&adev->vcn.idle_work)) {
> -		r = amdgpu_dpm_switch_power_profile(adev, PP_SMC_POWER_PROFILE_VIDEO,
> -				true);
> -		if (r)
> -			dev_warn(adev->dev, "(%d) failed to switch to video power profile mode\n", r);
> -	}
> +	if (!cancel_delayed_work_sync(&adev->vcn.idle_work))
> +		amdgpu_gfx_off_ctrl(adev, false);
>   
>   	mutex_lock(&adev->vcn.vcn_pg_lock);
>   	amdgpu_device_ip_set_powergating_state(adev, AMD_IP_BLOCK_TYPE_VCN,
