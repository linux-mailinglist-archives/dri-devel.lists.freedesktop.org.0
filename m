Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E90B569F2D2
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 11:37:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040E210E941;
	Wed, 22 Feb 2023 10:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779C610E807;
 Wed, 22 Feb 2023 10:37:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBd85LQbpo/KDrmTyPsi/Mg7SVsV+5uRUNtR4zwNaqxi7dVBam8worntFQ2w7KHZtSYg5izET5uvK7sPencoA+wAl6JZueOz2qOttYVdLQjpCQfkv/WWrNRDNlNuN90CtHPVD10h5OjVPtDA9nN+w5Pbs1bfHfqadKziYdF4XwGQbBtq0d8iVFI0DREF1mS3IWtunfjjhlOF42ky7Oc8IHu721LwDpvxHGEn+QJ2ru1nmZx382v09J7g4thf3/R+nwg7cZyAxQ38UdEpgWfPeAueAnK1RpoLPeRHInZzMIak1K2NG+oPfj9KYXO9Dr80p922Ho4N0Rb3pGFak7TNAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8F9LpH+FsDU/MSZscvDSRG8btlTSp7og1S9lJSHu6I=;
 b=HKZow/z/drVAL3KY/Pm0uEU8QppuAoRVUhqrdsW0q7//edPFB0Djce8G+CL2oDSgLgqPJADDkIziBlLN+kdNxzCSSTbUrviOXbnmDnzZjx7QGYP2yWCF+bafazrO5N3zXcEoRReZudBeY438rJdR/Qe2UK1iJ6d6cLne7qdRJ7fMO/TF3ZK0j8ne2IuiFH2WcLBJAjUwqFVvD+XauzQwI4n6LSK8n0Mjh7CEMfMiGXenkjKeumEzqU5eBgkLQ7v/OW25lpdKrf+cot9k6Pq/j8ezNVrbBkOcuLWDS57Sz4dA15HfVqEmAL0qXyOjFjBjbVDiSPf3P9AFsVWlaU6NAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8F9LpH+FsDU/MSZscvDSRG8btlTSp7og1S9lJSHu6I=;
 b=ifRtfmFQ+VJJotVQOCKli1o8SXuizc4ioVHCTE63cIhjyj+Rv+sTCAqd65skK+lDAwyqFrgeWUjpMG0Jn3Y1n7zblKmfjPsBGzTlLNGFcDvpUJDJATcFkjxmmYVBIDs91kqzxrqcNXJ+iWD388QURQJaBBIa7BpwgtfPb5F6NmE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 SA0PR12MB4591.namprd12.prod.outlook.com (2603:10b6:806:9d::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.21; Wed, 22 Feb 2023 10:37:45 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::4df2:b32a:e628:c57e]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::4df2:b32a:e628:c57e%7]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 10:37:45 +0000
Message-ID: <7f18a41d-e8e2-52db-2fe3-2463144fc48c@amd.com>
Date: Wed, 22 Feb 2023 05:37:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-CA
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-11-robdclark@gmail.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v4 10/14] drm/vblank: Add helper to get next vblank time
In-Reply-To: <20230218211608.1630586-11-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0115.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d7::24) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|SA0PR12MB4591:EE_
X-MS-Office365-Filtering-Correlation-Id: af663050-9d1d-48bb-4c0b-08db14c0d570
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ennvmU6ureE4pEhUrJOc/c1jTj5NDRkrzuQP+nAxEfEGc8jXSOPTi2GND988/V4GpbqRvs3oij4NoUl0/tEClAiN7uXSs2IIQbc8VmVheHV9KeJXcfq8UxQycyzHBtoU6jdSN4M3ACoPOeVwdQYiw20oS+NUTsW7Xi1UH9NAD2By6TredMTcoEfGDlIPtp/TvdtarpzbIHn7lOOdUlUtbPcejlYK8J4lUBzO8hKq0NRFdpCAhol4A5K54K8yCN3D5oGiiZUzAvQhKXnU7qkSatkG0WffAVFCh648rhSdebwmYOMl6C8MhOMSR3FVkSMFeNJiv57PL83+e7zROgyPepBVghoNc3ON1hWErCj+wqxhKl9UmKrjTeMmmdz8bbyr7X7MkINWRGuv9YVYq7ij27V3NqdpErBfuswVLPOhhkqjkxLdDl+mkfvW74w+kpgwOBpOiHjJ7icHfIuqyYTcjow848sXxycqUgA/MFBPQ3KLW3xWWD+/yu1kamrevdm9U0AuUMdnG8nhnXwoNHAQ+4PMMQvX3Fv7SeIjAZVhTIbGtHWwHGErUSZFgHJA9bVkufYKp3vaUQ36Eh71jCxSgAA4IyaB4LxH3LO6JcCRYA4SvRTCgy2DqWYGS+9w2915184dOAJ+ObfryiWk/eF3KZAec/cCgxMOSZ60XghYCAWtL0gJje1UP1UztAZA3O6sZS0zaGhOL80xzhJMysYYiLyHcLWyDQI6o9OcK13ad8E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(346002)(396003)(136003)(376002)(39860400002)(451199018)(8936002)(66476007)(7416002)(44832011)(5660300002)(66556008)(66946007)(4326008)(31696002)(8676002)(86362001)(36756003)(316002)(478600001)(54906003)(83380400001)(41300700001)(6486002)(6506007)(6512007)(53546011)(26005)(55236004)(186003)(2616005)(31686004)(2906002)(38100700002)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emhpSGVQdG9tMTJaTVI3SldWY3pVRHptc04zWE81RzBRNXpKRkJ5dzQ3K2tN?=
 =?utf-8?B?b3oyUGFlRm9xUjkwaENjK050QkFlb3FXOGhoZnZMMERzQ1BuTEFGTUdCdW5R?=
 =?utf-8?B?Zk9Nc3ZQQUFLV3Q4Z3FCWXJwYmlDWkVBNkVobmhhSXhLenk3MVRiY3Vaay9m?=
 =?utf-8?B?MmtLemE0ZTZUaEwrWlZlUmYvejZmWm10TUZwN0laZVFCQXp5eE5TVGxGZEJO?=
 =?utf-8?B?ZXhlcEV3ZTZmZVVPc1JDUE5EckwvT3NOblF6cHNSWlh4SE9JTDJkNzNsdExt?=
 =?utf-8?B?SUhsQjYxMVdFWXlSY2l5d3FLUEtMbEg5QnpVUWxoN2VXdnhFYytJdXp1Wlls?=
 =?utf-8?B?dTlYWGJpenlnWUhVVCtZVXpZS252MStHcVF3MlJ0d1FCbUE0eGhwTUQvMklm?=
 =?utf-8?B?Z2tzaVFaOEZLb1Z2WU9hYm5LY3BoY2p6cXhObTVZQm9PdzNjNGdQZVJIcEhJ?=
 =?utf-8?B?S1ZndDJYRWwxYkVWaitpd0xTZXp3QzRacGQyQXVDdDM1NDBUK3VhN3kwMnky?=
 =?utf-8?B?Y3l5SEtQYTBmbEh5M0pudy9NT2RPMCtBQ21taVBsdU9aVHIwanZMbmNYb3Fv?=
 =?utf-8?B?K2oxZ1ZaWDlScmhTZGpobnRXalhlSGxLUkk3U1NGNnNCOVgzbUxDQTU4NHVG?=
 =?utf-8?B?cDlKK010VEI1YkpaWmZkUnE1NktYMTBCSm55WEYvV3R2TGVxTURVYUdkZWtP?=
 =?utf-8?B?MlpZZmVxZEc2ZFhnR2RrN1d2L2tCSHoydC83T1M0N3BBeno4Tmt5aGgyK1F0?=
 =?utf-8?B?UGJFTVBVM1krdFVQY1dWWVY4cTNBVjNPSi9zUEFGNUt3QVRlWVVidENvM3hj?=
 =?utf-8?B?KzVtR2VZZHdGOXFNNkZyalVPN0VBMEpQSXNIcElaN1lGVVBUSlpYVTVRdGFE?=
 =?utf-8?B?L0xSSHg5VTJ6QUxVVkNJQm5Idm9EZ3JVbEZJUnVhdm1wczlDalFJODN4S3JX?=
 =?utf-8?B?MHFWK2dFeE9wMGphcExNMllMWmNRVmQ4OE5OQmc1bVN3clVhbHhSdEk5UHNC?=
 =?utf-8?B?VmFadExtRllUUnp4enBka0x4QzQ1Z1NQMGwwMlBmVkRQN0hNMSs3REVpYlFh?=
 =?utf-8?B?bW5zeU5lQVdyaXYrUlJmVnpha0VLeFBqWElEbk5XVmRHODVpaVBkdzF4SDBS?=
 =?utf-8?B?R1pLWWVHT0dwc1BNRWRMU3dXTGJsUytpdUtqeUh2bkRwK2NpL0RuSkNwa0k5?=
 =?utf-8?B?TTVEZ25vWkJhNDRSZWdmU2JUTWVhWnowTXpMSTl1R09raWY3M2kyYVo0TGMz?=
 =?utf-8?B?Tlo3MEZkU2QzNHQwN0JSZm44SXBzL09wa3greUZkeWNBRkF0c3B0NGVhR1dT?=
 =?utf-8?B?Wmo2RnlpZC9FM3JkNEFYaE5tUTVFRzlFVm05NGVzMXlNQ3J6Mmlmd2dseU9K?=
 =?utf-8?B?cFBNbEdORXVnQmhpT3pEbzUzcHB0SEdwRVYvQVhwaDMydndyWUN2d0MvSW4z?=
 =?utf-8?B?bk52NzlYQXovTTVsQTFSZmU0M2wxWGZMdkhrcStxMGxHMmlUaDJUaC9oMzhO?=
 =?utf-8?B?a0dxOUhNMkNzTlhhNUVWR1lqcVBuMUJOQTlyQUdQOVVTRVVIclViSlQ0RHp5?=
 =?utf-8?B?RGd0SVBJelpHdzlTdDNMdzN5QWJzZXdsY1pFdGhIemhqdlBqQVFkajVkTG4r?=
 =?utf-8?B?NmljMDJQMGR6OXZyeEp0YlAydGVuYTlSUnRobWx5czBEVlRqNDRIaUNFUE5H?=
 =?utf-8?B?cnpVb0xFZDdsZ1NRNUVWU2ZXVnJCLzVnOEV3ek83byt6Nk1yZHJ6eU1oMFpr?=
 =?utf-8?B?NXU5RnJ6Y1dLRjJIY3I4VjJhaEtiMjF4UVFVY1U1b1hyN1RGeGg4eFFING9z?=
 =?utf-8?B?VDdLUTVXdFRxNEIrc2J3VERDOHNIY3cvVWhQS3pJYWZFWkptMGdlUnpVK2V6?=
 =?utf-8?B?dWpiSmJSTVBWd3BKQVVBb1RlbEY0NmhRcS90M3hhenJTUzYvR0dzeTdKRldN?=
 =?utf-8?B?b3lvZElrZWRJWm5vMlptaWowbDdnK3pLU2VwUmF3OHNjaHdldWNxOTRyQm1y?=
 =?utf-8?B?dWFNeHc4KzcwUiswclp4a0VSYjh6elV4bS9Sa2p4QlRjaUtoYjlOM29scFJp?=
 =?utf-8?B?TGdBb082MHl2aHA0OXBXOVpyRFVYb2owQVRPekYwTis0RzdPVTZCVGtCdVdq?=
 =?utf-8?Q?knveKoqFFMJdQv1OMlHuXoHwC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af663050-9d1d-48bb-4c0b-08db14c0d570
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 10:37:45.1802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YmxOPa10kj/RscAwq9G+kGG9nOUnPYyBMVtF7suB3o/YCGg2SwfxsrqPyFhYoF2Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4591
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, Pekka Paalanen <ppaalanen@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-02-18 16:15, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Will be used in the next commit to set a deadline on fences that an
> atomic update is waiting on.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/drm_vblank.c | 32 ++++++++++++++++++++++++++++++++
>  include/drm/drm_vblank.h     |  1 +
>  2 files changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 2ff31717a3de..caf25ebb34c5 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -980,6 +980,38 @@ u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
>  }
>  EXPORT_SYMBOL(drm_crtc_vblank_count_and_time);
>  
> +/**
> + * drm_crtc_next_vblank_time - calculate the time of the next vblank
> + * @crtc: the crtc for which to calculate next vblank time
> + * @vblanktime: pointer to time to receive the next vblank timestamp.
> + *
> + * Calculate the expected time of the next vblank based on time of previous
> + * vblank and frame duration
> + */
> +int drm_crtc_next_vblank_time(struct drm_crtc *crtc, ktime_t *vblanktime)
> +{
> +	unsigned int pipe = drm_crtc_index(crtc);
> +	struct drm_vblank_crtc *vblank = &crtc->dev->vblank[pipe];
> +	u64 count;
> +
> +	if (!vblank->framedur_ns)
> +		return -EINVAL;
> +
> +	count = drm_vblank_count_and_time(crtc->dev, pipe, vblanktime);
> +
> +	/*
> +	 * If we don't get a valid count, then we probably also don't
> +	 * have a valid time:
> +	 */
> +	if (!count)
> +		return -EINVAL;
> +
> +	*vblanktime = ktime_add(*vblanktime, ns_to_ktime(vblank->framedur_ns));

I'd rather this not do any arithmetic, i.e. add, and simply return the calculated
remaining time, i.e. time left--so instead of add, it would simply assign
the remaining time, and possibly rename the vblanktime to something like "time_to_vblank."

Changing the top comment to "calculate the time remaining to the next vblank".
-- 
Regards,
Luben

> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_crtc_next_vblank_time);
> +
>  static void send_vblank_event(struct drm_device *dev,
>  		struct drm_pending_vblank_event *e,
>  		u64 seq, ktime_t now)
> diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
> index 733a3e2d1d10..a63bc2c92f3c 100644
> --- a/include/drm/drm_vblank.h
> +++ b/include/drm/drm_vblank.h
> @@ -230,6 +230,7 @@ bool drm_dev_has_vblank(const struct drm_device *dev);
>  u64 drm_crtc_vblank_count(struct drm_crtc *crtc);
>  u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
>  				   ktime_t *vblanktime);
> +int drm_crtc_next_vblank_time(struct drm_crtc *crtc, ktime_t *vblanktime);
>  void drm_crtc_send_vblank_event(struct drm_crtc *crtc,
>  			       struct drm_pending_vblank_event *e);
>  void drm_crtc_arm_vblank_event(struct drm_crtc *crtc,

