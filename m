Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A774E757B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 15:55:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4993F10E72A;
	Fri, 25 Mar 2022 14:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC48910E956;
 Fri, 25 Mar 2022 14:55:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gxiEMobjHlFr9brkdkIkI8lfpvPI3zCnTfrbnuu+l4X6bHVXFTYIfYICJoKZMksCV/vNZA8l8D7skvVKJXtCN5fI0WUkAzMe89eKgDJIZMDgnwxdCEiYr/pMDxElMjfudAAfj9W2OPCjyH4d4asevuWU8Cij91j9iEk+Y7g7rNSrk9mTVwbMYe1dFFO2xmcY7t2Fft0snLMSUUi5cko6ZyFRVqdk5c4zRFo4KvPgoHM6Cdg9cwbd7eTvwGFxjGHjyfRjjSZLSx8s2yofNq/z/4eBp0xXgSSzwJNk+JbbqFyvza4btis+1mpdIY5BmGsT+MHxhCiPbR7rQ8z34/vxCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2eis0A2HyhOi4wdZfdW9rexYb7CqzQRvugx+0ef691Y=;
 b=WqqEdqr4jjAthvbFsmLNiRrmQ2WaAIcD6MvQ2QtjfGWBxAj6XCd/9tWdgvytt+NnRNTf8SD4g56iFm1GVN2XBRX8kfPOnhKLlNSQDtLUeIGDESmaPmaUQ66ENSioU9+qUeSapNk/7cD/DphVQgy0cEWe9bvRXXUVZZDS8YaiH4J66bAHCxf+Bc6aJIUdBJFCpUA4tywg+IJyy4sy+qcGWSw/UaFfsLvimRs0FayrY1tkZVWOcKiyuct/hlOnw6fZiSn0OMOA9NV1bj6P1PiPe7nrEhBth4dENyGttkqgL/p0nopLPVEOANN5Zu1vKQ9rPq9xyOLFrko+IaxXXEcrwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2eis0A2HyhOi4wdZfdW9rexYb7CqzQRvugx+0ef691Y=;
 b=EyBePaV+o7dec1y8BFVXmPrr7n+fBGipSMOd6Vk4HkUc5EwAmDHv2TF6ZZB6Bz4Guq+o564z+2wdgdthfpaRbbAQXrTRmoQ6EQ0cm1dJIsUi4gcjCdo6WdjpQ1bAjJquYpIUWYje11j4jI1wpC17tatWnJbZcMPUgZiXuxcbBjg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM6PR12MB4218.namprd12.prod.outlook.com (2603:10b6:5:21b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Fri, 25 Mar
 2022 14:55:23 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::192:5346:4ece:7ca3]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::192:5346:4ece:7ca3%4]) with mapi id 15.20.5102.016; Fri, 25 Mar 2022
 14:55:23 +0000
Message-ID: <da22152b-57e7-5bb4-7330-26edf405bbf8@amd.com>
Date: Fri, 25 Mar 2022 10:55:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/amd: Re-classify some log messages in commit path
Content-Language: en-US
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220325000622.1594343-1-sean@poorly.run>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220325000622.1594343-1-sean@poorly.run>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT2PR01CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::6) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ea6ee75-aec2-417f-cf55-08da0e6f7d68
X-MS-TrafficTypeDiagnostic: DM6PR12MB4218:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB42189BA2AB9D73B05C250D4D8C1A9@DM6PR12MB4218.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: caiTCxoUkrgQHK5YASpoKJ0nZaFleo3fg9Q656lQmieYe6Xsm82pJIHlPSBiHu9dKsil0PYWKxKh6Eb310hd9o7v7sHn0GP9vD2gvi8ZNLskvmShVq2hQQoThitvYPsam5Qu2BvIZnzoPC6h8i+ucPP/I5gBjpszVbaE98SUyjS71M9bNbB8irL/G1c/ZTlA6cWnsIPhCpOIFaCAU3HBM48xmAMp2VQlypzFIFsmTJchntDYeOcNBrfOhjV7E/8/ybIqVYIMsbtzlxwKE3exvzBZnWKcj5/wTpxABJ9OZkx+XPG55eX+QEWWXSsC0nFOO3I5n0ACbBBqCOHFzBhkyTLgFzpfHGF/6en2xiBggfIjhLbEtRD+1C21s1zSrc+zxKIqrgWDFdorDD22qizB4F05o/TPme9WMiiYdOhWuuq+t3+UxXDcxNdULuSOUVfgZ/rjf0SzqFJo657CnXjqSTj70BdhOJmewquzgDHjIlyLO5iYyDtPK2yF2xH+bJLwXFrDXiLHtmrwBjnIUNIzGPPmCm6OcQ/tmD6XUjkX/QjAKBjN0oPjeY6UYuU5/rFjvDB4aRmLVU4lRmxYW8gMtScl6/D4qY/Lwfl5odP3kHVStvuFMZT5WUBMaEfHvOmJd0L+N48MQKzF3sGj+S+n9oq0aIhX4aYssq0prw7ZjIUr2pUULQGHopIooDZKor7cM0EeWLB8YqYWIKcRuud7sqdY2xH4/0M07lC3KVjzYBD7ank9DdpaQz33z3ItKurtCqcynfkB4pCi92G4N5GnXHv9DpvLdvScDMz4QG9D6Go=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(186003)(6486002)(36756003)(66476007)(66556008)(316002)(31686004)(54906003)(8676002)(4326008)(66946007)(5660300002)(26005)(6666004)(31696002)(86362001)(508600001)(8936002)(2616005)(38100700002)(15650500001)(6512007)(53546011)(6506007)(2906002)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K21MMnltNkdGZE1wejliK0hacGNSVXp4UWVMNzgxRVVEd2MwUU9KTkxDWUFV?=
 =?utf-8?B?VksxSFkvNkZvanBFMzFkR3YzTFFZOE9FR2Z3aFMxVzY4b0JnSDMzWUJEN0Jr?=
 =?utf-8?B?aHErdHRLRUJMUTR2NmpkRDRXRFVwZ2pYSkQyU05rOFJMV0tTcm5GNlpwMXMy?=
 =?utf-8?B?OGlyMnZPUUJBeGNmQ3BHWjM2ZmJZUjEwdk45Tk80Yi9RTDBNeVIySTVIcUxG?=
 =?utf-8?B?Q1JZc1ZLTHYzSVgzOXBxZk5NWHdSYlg5eHUwQkNBM2I4WENBVUNJL0R4bEx4?=
 =?utf-8?B?VnZyeUNibERpWllSQmN2Sk92dHVnSmQxU0tZamhUaEtwZ2NWWllsUG9MVHlF?=
 =?utf-8?B?cHJrQmRQNDNEUzhpSWRXU1E4UmNwbWlKUVNhVzlpSFpMQjZKb21vYVBEWE1V?=
 =?utf-8?B?ajlpOUczd0xXNGR0QWtnNHJKL0l3NUJxbEJTczRBT0lQcjg3VmpUWlRIZmVi?=
 =?utf-8?B?VWlCRU5qZ0tNN3pFUEppOGRSZVNGV1dtd3VTcEpCMStZQU84QVBuYXZKUnc3?=
 =?utf-8?B?eG1oN1BxemRsaWlKT25wNFpQd2ZaUHdUTlROVThDUGIrOHVGNThxVml5cEg5?=
 =?utf-8?B?U0lGOTVvSlBmQk1NSENrY0xVL2NlczFXYVArYmIvcWpUYS9sZXFQLzZ4RVdm?=
 =?utf-8?B?SmVLZUQwV2IwcW1UZ2RaUzVscXFYSjdGd3RRdzl1cTkxNjZ3OWM1T0pGYUJW?=
 =?utf-8?B?OVpxMmRoMVFHT2ozeGc0Mk5mRFV1Z2ZHMzhxNFFwclNwUTZ6OVZycFU5OTVL?=
 =?utf-8?B?MVUyNzd6NUliUFYxQmxQNkhyb1M2aXVRbjFPVzM3eDlSMG1lUjFxVmtSelJw?=
 =?utf-8?B?L3ludkk1c1VsS2NkU1A0MitFSW53ZElCZWlaSW5LTEFaUUJQaS9sWmlTUi9l?=
 =?utf-8?B?SXFlOXlpQ3RhMStJV2JKZWxWM0hSaWtoQk1xT0lDQ21Yb0RwUW5GeEhieWtu?=
 =?utf-8?B?ckJYYzZPdUJPbG94dGZYalZYM2ZrbW45a3NyWSsweEpZY0RnbU51RVZlNWpW?=
 =?utf-8?B?R0lTcU41akR0SThhb0pBd0czQzIrc1E3Ky9sMkZtNmdKZWk2VVBHSUMybFVQ?=
 =?utf-8?B?a01MdFBUcVZRM3BDMzR3eGthS1B4Y2ZaKytRdHovc2ZIbFlra2NMRW55QldX?=
 =?utf-8?B?OThpK2Z1QnRpZktMK0lOWTZJaWg3SXdFbHZHblNoQklSMDAwdlpnVk42Rkt1?=
 =?utf-8?B?NnVpaTgwam5oUm5vNlYzZTNHZHV2ME4vNlYxYjliMTFSUG1XemNoSFAxTnFu?=
 =?utf-8?B?M25DeHJFbW9sZjhPOE84dlFZT201TVdqUTlXZlFYdHVzN0UrKzB4b05HckFY?=
 =?utf-8?B?YW41cldPUjYrNzZMU3VjVDFXME9oWXJxcksvV0VCTWNFNXl6QVlpSHpkWXdh?=
 =?utf-8?B?SG1xSEFhbnhGWVl3RUpiaWdaYmZzUXN6a2hKRHplVTRlUENpMklaZyswMzg1?=
 =?utf-8?B?aUs2L2hoZVh5aXFhRHc4Z2pVVThRRXBvTDd2ZVVEcW1pWjBERkxKNGl4bk42?=
 =?utf-8?B?TG9FL096NTVMNzI4M0tvaWNqdkRVMnkrTFcybk1pZWUyaE9ramQrcFBZakp5?=
 =?utf-8?B?bDkvSDJoZE9KUzUvWEd5MmVkYTNKWkthK3RBclJpbnFUMmhIWEdJTitFbzRs?=
 =?utf-8?B?SEVnalFWVHc2MVVoTy9oOUszNTB4OE9OdGdyaFgwaGlkemczQlRxWXRBZi9r?=
 =?utf-8?B?bUlQMkFvUVpNY2MzSkx2ditGaTJLNTBJMmQyTkFuYmIzSExUREo5aUUwazgx?=
 =?utf-8?B?cTM1OEpPQjBqcko1bzhOZklXaDlMcngwbU1HUVExTkNBMzk2TkJTWmoxcVZy?=
 =?utf-8?B?dVluTnlKVGpDRVpUbGtXcEcwZUpIZUVRM0JseGliaTBnenRRMHZ1Nm9ybmI0?=
 =?utf-8?B?Qy9KY1RwV1RPSkkxdUVmQS9DaUpEekY3amdvekg5T3hqYUNGMFIxeVZVbXZv?=
 =?utf-8?B?ZU9tUG5uNC92QURML01DZmJwQ0tFeEFseUxpNHV3bEZJbERCRlB1ZFJISFV1?=
 =?utf-8?B?MUdYVDd3cWFwclpJUGZpbm1YQS91aVlQMUdBZENoSERxUDZBcVNGbkdINGs1?=
 =?utf-8?B?aFJSK04zRjkycThQWW5CcEVnYThKZncwZzArZHdQQnlOOWlDNHdUY3ExNXl4?=
 =?utf-8?B?ejE2T1Z6RzlCZi9CQ1Rpcml2cUVQWU5sZ2l0dFB6cWxrNWtsRVpiek05VjM3?=
 =?utf-8?B?VmlXTlhNcXMvaHlwRDlOVnNJekVpUzd1YWZtUjlzbEtJMFRqYldtV0htWlNm?=
 =?utf-8?B?TDFRcUN3RFlCOHluZ1puUFNKOVVDTDFiWklsQWs4RVc5UDEvTTFhYXlUMXFS?=
 =?utf-8?B?N3hUZ1BZTnVuNUhPWXdpajJtWVA4TXk4V3FKWUVpelBVNTFieFI1UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea6ee75-aec2-417f-cf55-08da0e6f7d68
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 14:55:23.6556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 86bOUEbomcxECIskqYdekK1Gz9f4P6pCI0GKTgTX055aBfcVRiQeNl6vCdIjcDawxVyayN53QM7id8Y/Vw4VEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4218
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Sean Paul <seanpaul@chromium.org>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-03-24 20:06, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> ATOMIC and DRIVER log categories do not typically contain per-frame log
> messages. This patch re-classifies some messages in amd to chattier
> categories to keep ATOMIC/DRIVER quiet.
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>

With the subject line fixed as per Christian's comment this is
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c       | 5 +++--
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 8 ++++----
>  2 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index fae5c1debfad..1fcbab2fd3c3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -113,8 +113,9 @@ static void amdgpu_display_flip_work_func(struct work_struct *__work)
>  	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
>  
>  
> -	DRM_DEBUG_DRIVER("crtc:%d[%p], pflip_stat:AMDGPU_FLIP_SUBMITTED, work: %p,\n",
> -					 amdgpu_crtc->crtc_id, amdgpu_crtc, work);
> +	drm_dbg_vbl(adev_to_drm(adev),
> +		    "crtc:%d[%p], pflip_stat:AMDGPU_FLIP_SUBMITTED, work: %p,\n",
> +		    amdgpu_crtc->crtc_id, amdgpu_crtc, work);
>  
>  }
>  
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index b30656959fd8..45d130f86114 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -9248,7 +9248,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>  			&bundle->flip_addrs[planes_count].address,
>  			afb->tmz_surface, false);
>  
> -		DRM_DEBUG_ATOMIC("plane: id=%d dcc_en=%d\n",
> +		drm_dbg_state(state->dev, "plane: id=%d dcc_en=%d\n",
>  				 new_plane_state->plane->index,
>  				 bundle->plane_infos[planes_count].dcc.enable);
>  
> @@ -9282,7 +9282,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>  				dc_plane,
>  				bundle->flip_addrs[planes_count].flip_timestamp_in_us);
>  
> -		DRM_DEBUG_ATOMIC("%s Flipping to hi: 0x%x, low: 0x%x\n",
> +		drm_dbg_state(state->dev, "%s Flipping to hi: 0x%x, low: 0x%x\n",
>  				 __func__,
>  				 bundle->flip_addrs[planes_count].address.grph.addr.high_part,
>  				 bundle->flip_addrs[planes_count].address.grph.addr.low_part);
> @@ -9624,7 +9624,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
>  		dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
>  		dm_old_crtc_state = to_dm_crtc_state(old_crtc_state);
>  
> -		DRM_DEBUG_ATOMIC(
> +		drm_dbg_state(state->dev,
>  			"amdgpu_crtc id:%d crtc_state_flags: enable:%d, active:%d, "
>  			"planes_changed:%d, mode_changed:%d,active_changed:%d,"
>  			"connectors_changed:%d\n",
> @@ -10328,7 +10328,7 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
>  	if (!drm_atomic_crtc_needs_modeset(new_crtc_state))
>  		goto skip_modeset;
>  
> -	DRM_DEBUG_ATOMIC(
> +	drm_dbg_state(state->dev,
>  		"amdgpu_crtc id:%d crtc_state_flags: enable:%d, active:%d, "
>  		"planes_changed:%d, mode_changed:%d,active_changed:%d,"
>  		"connectors_changed:%d\n",

