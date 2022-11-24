Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 274F2638065
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 22:00:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4123110E02C;
	Thu, 24 Nov 2022 21:00:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45BD10E02C;
 Thu, 24 Nov 2022 21:00:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OVJMlVaN8acN3OsmfNwa5r1LUhSNxjE0k3UcEPZpX8zSJUbIHVSi93JhvNbpkB3I6aD3C4TeYZ+FyB+AUU7EmPfzV6FhmIbgu383j/mGzKauw1hfDHKmtQxG4TV2KKpyyBYLgFIy8kCafirsLPmou7E5JZN4HQ/AAsFSh4FcFipEJRvpHJ+nBtt5+Xw7eXS7Ty2B20GHDmuaQcHI+wQMe/LIc21Lznu3QV/tWC0tHc/SL+0CfKtn+l8EcWXpGT0xBMnpnEhssEJjhkzV8rpwmgIsVaBxolMOFug+t/83sCC0OLG7oDPFez/48tA8LSG0i1lj0OlCympefNEoVY+2Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9mQk3BOu8mPD7RUR+TJUTe4SU2u7Vp8p4DCGq0n7dU=;
 b=TtF7BVt33Toj6l6NcVRwRRlJvinOGmPsx3GaD2ukYjDRGLLNBZmeojc706iQ7YyHXHMeSCdvMBmOi+0yitGMmT3Af1pX1astagwYCeHoIYexjfy3jvpFHfjv92QJDPB105RyBtbs+XHK6GIgUxdqAbIIYFfIM7yv2hqxcfwktnWgLyhMRzr5lcHPtLAfmK90ld2RedFbkxx19cT3fJywatVK4BCstgR2X00BEdK+YKd9YshI/1x/MEdSwMlui6xKqiCLqgQzVwHMzrcGPO1vEtTb74KNDMZ2vSAuR5YSskZOlxqJpHEq9V1aqenYRvuxY402sDQipMycPRlGWFJfiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k9mQk3BOu8mPD7RUR+TJUTe4SU2u7Vp8p4DCGq0n7dU=;
 b=0eBpK9/RMoN1iG2OwSvvbEqC2YckoXtpENRghV00SNXIz4dlfR7MpKHajHEnQt4iVWGEckBgtcgCENWjULT5N1AbkR35jPCs3Vd+am7l5YG5hHoYbXAC09MHInkEhgIJiJ7hhRlgr3UYushyDZliOmlOzFCBQ0/oWlrNLkwTISM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 CH0PR12MB5252.namprd12.prod.outlook.com (2603:10b6:610:d3::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.20; Thu, 24 Nov 2022 21:00:18 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::2fd1:bdaf:af05:e178]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::2fd1:bdaf:af05:e178%3]) with mapi id 15.20.5857.018; Thu, 24 Nov 2022
 21:00:18 +0000
Message-ID: <0f352a00-88ea-ab17-7a6f-3d8f32c70ce3@amd.com>
Date: Thu, 24 Nov 2022 16:00:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] drm/amdgpu: remove redundant NULL check
Content-Language: en-CA
To: zys.zljxml@gmail.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20221123074437.1841014-1-zys.zljxml@gmail.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20221123074437.1841014-1-zys.zljxml@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR02CA0116.namprd02.prod.outlook.com
 (2603:10b6:208:35::21) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|CH0PR12MB5252:EE_
X-MS-Office365-Filtering-Correlation-Id: 222b646f-10cb-4467-9dab-08dace5ee43b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LMblSM++VGDg+0xyk2wjCy6fYfKyfbjFCVlkYU+pwtRKz/ebvPihsNAiuYNKUzV9HJy+eQ/ufzLd5YecNEvuIQhc6A+afb8DB4Y6xia4TrLDNNII/Y8XeBIdX6pYfYG1KabgnKfDF8KGJj7cKIoyXXdk+t1WIsvWaMQZ54WRECKyr/xu1jrUEW8CqpNGkWjSY2ExfKW6g4djuFlZI9b2SvEewjNTRDzwJlK9efxlL3qbzI87sB3N02b2VffVaaxI33IoaffmpP7zdwG3j93Os7YAweCceWsSDX0ReeNe85+RLf7+PGw51owIrjRkwVHcv8am03HpQuR6UxYXLl6+EGzLoq7TGE+LwCziuDmRbeRPHyOarqAAgPOaG+Fijo7qXcZ0n+BZADmaQEtup00sBbX6pX7lCHc5iAxBiHcOdGOhDtpuzA5BDakEcwCI0RczKWl/uawSPhMVVaDAtxyRZGV+JHQFl4WkGWHOdpI3gq6Rd/Bwgdbi/bujTu3tOQCh/24tb7zulVi9YG6SfCcwxO53+2jhTbJnsbDnTRGGgKbUoJ7gpJhj4frO2BF16s699xWvliZjmXok8sA/0ShyM54/Bgub3USgMUwXr8cUNaWAuFVVo8PD8fZJrTLtMFxb023EFsLG6M4aanSVkQiG9Mf9QgWh2ee5krvp2sInJCZjnafQ+MkrEMEQEjxCb8Ps03YJuBMw4g8tgsoSXr0QvUwVMvgl/a//1+rXtZvX+3k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(451199015)(2906002)(31686004)(83380400001)(8936002)(36756003)(26005)(41300700001)(316002)(86362001)(31696002)(2616005)(186003)(5660300002)(6506007)(4001150100001)(53546011)(6666004)(44832011)(6512007)(478600001)(38100700002)(8676002)(66556008)(6486002)(66476007)(4326008)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmM4TUFIYmNMQ0JzT3BDSHNIdFNFUzNUSyttT2dFSlB3QVc1aGNqVUdVeWI5?=
 =?utf-8?B?UmtSTUIwak9jaERNKzVQOURZcWtaUStORExZUVgxOU9QV3IyTmtmUU1VQk9Y?=
 =?utf-8?B?OC9aNURQc2tMUFg3dnhHK0FGVyt4cWpvTW5tVllXc1ZvblRac1p4RHAxdUZV?=
 =?utf-8?B?bEdoMFgyTk9yUHErNVZsOVFKZU9PK2lWRFFBR2sybzV1eXFLUmpaR0tBb2d2?=
 =?utf-8?B?UXp0ZlRhbDl6U01EUU9kOVBKTW9iREdJUGd5NWFRWlhVQllVYzUxdHRIc3dF?=
 =?utf-8?B?U2kydDRLcERhUFZWMWhRV3BKZEl2am9FT3NUbzloc0NxNDRxVXpZTi9kTHVI?=
 =?utf-8?B?M1B0VURHQkhmUWM3YlNmbkFkUVI1UGVXZmw0NGNzTzlyZUNicWgwVmtkeHQx?=
 =?utf-8?B?Y2ovbnpZR05KZ1EzNWROemN5WkNvVGVsWkdXTGJNYXEwbm1qS2QyZDlGTTB3?=
 =?utf-8?B?bnpjUzQyUFV2cDVHWDJLUW5MVE9YRGpVQ1U3OFB0akw3UDkxZDdLMGcvSW9K?=
 =?utf-8?B?YzdjZ0E2QU1KYitKM25kOVltYzlxZ251T2djOVpHWlg5UUlad1RCL1ZWTFZY?=
 =?utf-8?B?RXlkbjFEUGV5dTFvbUQ4Z01KaEpsNVVoK3R0bHZCckxjYU5FUjNMM2lmVXhV?=
 =?utf-8?B?RVFoYlFhS0hzbW1GLy9rb3AvL0ZEY0NRcytKMjZwbEpRMUFjWDlhZHRnTmcz?=
 =?utf-8?B?bFNYYThqY3ZrQm5jM3dzaFZWWDVqanRCUFRCbXBWbjQ1V09mblJGckc2d29i?=
 =?utf-8?B?WUkyRVFzeEFnUUE5Q09TbE5wYmJ5SHJTNGdDT05PUkIxdHdKQjhBM2NUdk45?=
 =?utf-8?B?SWZGV1BpSHQ5N1hPSVpFWHFZUHk5ang3WGNDM05QS2pZZVBCcjFlOUYvdnFY?=
 =?utf-8?B?OHRZSlpwKzRxQnJ0TE1hc3JKWkRKY3lLN0p4N2p6SGtSaDhVa3ovcEtaOWtp?=
 =?utf-8?B?TXpkRDVXN1l2Szc4cndNT21RQWpORlVHNlo4YVFuZmpJVFFKdkpVNm5NbFlR?=
 =?utf-8?B?cUFhUWhjQkVEWk1hU3lNYlhVTFA3Rm1CNzJrQ2JZZHlFN05Cd3IvbUlBeVBD?=
 =?utf-8?B?YXNWTW1GYmEzbnBGUitMLy84YTJSeDZrOTNMM2RlYnZROUtMbnZUNmU5ZHpS?=
 =?utf-8?B?aTk2eHRJQTZNaDNORzZ3akxBaE1BK3NCOGVNY1VFSGpGV2NUbUk4cFZ2LzVR?=
 =?utf-8?B?dDhMVDNUYnFZTGFoTHZRTDN6YzJRdm9BaUxOZ2RFaW1jNWRtU0FSMFJMSzRN?=
 =?utf-8?B?WXgzc1dyWUtTVnBHRUhjdUwyWldoRWRqb3MzNU1sMDhZZDR3TjZoVlBPUzZ6?=
 =?utf-8?B?RndHbjBmMVdwbWhuN1d5M2lGWDhnYWxtbWxtV05EN1lFQ0daSFIyM2szSGNo?=
 =?utf-8?B?SG9STWdPVVFDL2dpZU9rSFBWemI0R0RXOVVpMGlFTWMzTXc2eHA2ZkVzNEpk?=
 =?utf-8?B?V1hHcG1jaGdtYmZkQnhlUFNMMmpLZU1DZnFBZlFXVCs5S2lxamV3MW9tKzBU?=
 =?utf-8?B?UVdHQjVGRWRMdmp1WHFYTDlZbnorbVN2NlgxK3ZWcXlrTWw5VXZ3S3E1VW9z?=
 =?utf-8?B?akZSSi9ReThwVDh0RnJoL3JhVEQxOE10cmJhdXloMlJ1SDBoazVLdWZvR0JG?=
 =?utf-8?B?elVWbzhrU0xMUUc3bWRPUHJVcmxGZE80OE9nZUNCZld6T2kzV1l4TGZqQk1Y?=
 =?utf-8?B?NkozcEViVVlMWWJJT29zVUVnVlY1WGhJRnlZeDR3S0JsYU1ubGxVTE1uWGJq?=
 =?utf-8?B?N01KMUVDQTA1cDRyOW0rTVpFeHNqaFZrT0ZKditvSE5HWmtOVjBucjVlUWND?=
 =?utf-8?B?Z1FNYUtWVXVtZ2F0SVNWVzlObkhISk90Z1c1L2ZQNFFDdEk3aUdlNm9iMnVI?=
 =?utf-8?B?bjV1NnVvMzB2b3FJV1NJMlpKdmdhN1c5aFV1b1l2b0JCNzd2OVhZQUliSW1h?=
 =?utf-8?B?bUcvNGg1M1hSUlFnUEVyV3V6cnBUdnB1THhuRUFscTRUdEtCcEtVRWRHSHlj?=
 =?utf-8?B?NDNyK2tsdjBTMldTSklVcVFFaEJ5Zm9Pa0hISE9tbXRpaTJzWEY5Mm5haVN5?=
 =?utf-8?B?SWw2Z2E4MVo1R0J4dHJEcXI1dHZTT28xanRncUpyOEhMT0Q5bWVBdXBHWWtC?=
 =?utf-8?Q?d5sVCPmRvYk6GN3GOYpPNJzGp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 222b646f-10cb-4467-9dab-08dace5ee43b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 21:00:17.9893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MxFCNbSfQbswh+Rk5obpyUWqyV7ih3Qq3NdHoGsTeufpabvYX8RMpVUNsKZr+j0H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5252
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
Cc: amd-gfx@lists.freedesktop.org, Yushan Zhou <katrinzhou@tencent.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.

Thanks,
Luben

On 2022-11-23 02:44, zys.zljxml@gmail.com wrote:
> From: Yushan Zhou <katrinzhou@tencent.com>
> 
> release_firmware() checks whether firmware pointer is NULL.
> Remove the redundant NULL check in psp_sw_fini().
> 
> Signed-off-by: Yushan Zhou <katrinzhou@tencent.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 36 +++++++++++--------------
>  1 file changed, 16 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> index effa7df3ddbf..77b966ab5439 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> @@ -484,26 +484,22 @@ static int psp_sw_fini(void *handle)
>  	struct psp_gfx_cmd_resp *cmd = psp->cmd;
>  
>  	psp_memory_training_fini(psp);
> -	if (psp->sos_fw) {
> -		release_firmware(psp->sos_fw);
> -		psp->sos_fw = NULL;
> -	}
> -	if (psp->asd_fw) {
> -		release_firmware(psp->asd_fw);
> -		psp->asd_fw = NULL;
> -	}
> -	if (psp->ta_fw) {
> -		release_firmware(psp->ta_fw);
> -		psp->ta_fw = NULL;
> -	}
> -	if (psp->cap_fw) {
> -		release_firmware(psp->cap_fw);
> -		psp->cap_fw = NULL;
> -	}
> -	if (psp->toc_fw) {
> -		release_firmware(psp->toc_fw);
> -		psp->toc_fw = NULL;
> -	}
> +
> +	release_firmware(psp->sos_fw);
> +	psp->sos_fw = NULL;
> +
> +	release_firmware(psp->asd_fw);
> +	psp->asd_fw = NULL;
> +
> +	release_firmware(psp->ta_fw);
> +	psp->ta_fw = NULL;
> +
> +	release_firmware(psp->cap_fw);
> +	psp->cap_fw = NULL;
> +
> +	release_firmware(psp->toc_fw);
> +	psp->toc_fw = NULL;
> +
>  	if (adev->ip_versions[MP0_HWIP][0] == IP_VERSION(11, 0, 0) ||
>  	    adev->ip_versions[MP0_HWIP][0] == IP_VERSION(11, 0, 7))
>  		psp_sysfs_fini(adev);

