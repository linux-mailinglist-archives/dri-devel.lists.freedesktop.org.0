Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 302938139EF
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 19:26:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE8AB10E1E8;
	Thu, 14 Dec 2023 18:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3B010E1E8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 18:26:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNJBstk3JgQFC5dcofy0b0FIVTwqNnKhbrqo0pd68vCdgVmNAfT7JcCNFLz5wDM2g3z6G7GWNOutgEQKSHjr8IbvjymzqT3FZ6BUh5Q/Fq+teM34i754B4A4FzIbAYg9BGRfRK5g78yDD6R4d4kj7uCK/1hIFGp0sDfYbycBUuXHBEOI1GeIUIMa21JmIAlfNfx609eTelV+2qdSMsG+aTGOgpeyhubaGPa4QmEgiXkOAhGXESqJ2yGsNo3QeQe31Wjpmy9xprL7FYanH2JNJJA3rR43Mc8mxi436YtmAbyoNIHdQKuJwg3Fv4gDGbDts9sYgOzYcFn/fnEEJ1O98Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qJHLDwBEvgqz0WLCzio2+Tug/6F4sxBkJOZPrq0R3A=;
 b=Ce3IP5WHT3hk39Q9wWy6HpR7nFRXrOh7aB97GcPxyMQ2beApf2wKapKrA4/VigkkdxWeW5QMpfuCxqQIxej909W7mPodJGvAY1EVNZbBeEVfdE9MpmWuGug4rCYKYE+eUaYP2rWzc92INQcNasfEkkklOdNfNfCOwUD5TsqECR3lrc2Cqw5aLAuFtJiltxp6ylhlk2RA6WkAPU7nxzJ8iqvzQXShMGwoHsGxbbhE7DYTPtyaOC0Gs3hzSTlqkbpAavJOHjyrVqYSDa7BYnvPfv7/6NeWp1wflMhM+z0CAAdWGonmOJE2u3wJO7GWSU4dcFcB8hjzzr69sQzxoJ7FAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qJHLDwBEvgqz0WLCzio2+Tug/6F4sxBkJOZPrq0R3A=;
 b=FFQNtCfR5qV0PfmkcvY9n+RhXsjFbnnBoR+3PdiipfIhwbpOxyk/IBDRHo7qEKyVLHl6tuwB45O2AddS++sbXZ3X8VNs3awC4u6RhVEdVvVNeD3eeFs74zXrfXq3WL5nPGyA3vnG6FFvGWS5BUx9dj4lSSci7ixusFkmJX5Cu7E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 DM4PR12MB5772.namprd12.prod.outlook.com (2603:10b6:8:63::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.38; Thu, 14 Dec 2023 18:26:33 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5358:4ba6:417e:c368]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5358:4ba6:417e:c368%6]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 18:26:33 +0000
Message-ID: <2ca0bd01-20f8-44f8-bad9-39b534802098@amd.com>
Date: Thu, 14 Dec 2023 13:26:30 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] drm/atomic: Make the drm_atomic_state
 documentation less ambiguous
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20231214100917.277842-1-mripard@kernel.org>
 <20231214100917.277842-4-mripard@kernel.org>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20231214100917.277842-4-mripard@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXP288CA0032.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::42) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|DM4PR12MB5772:EE_
X-MS-Office365-Filtering-Correlation-Id: 12926000-4859-48ef-6eab-08dbfcd2329a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B0c4P8oaTNcwIJXAfWljRnPVebC/5pHpS3SgtCiMAu8lqQY94eaVQEmdxQub4RQePYhXo7KnGNmCXOx108wNIL5KRXVbiI6Tkv/QVzAba6k3wM0+hCoRvleNRF4ec1qfUYFq7S7poHhMH0LOLmhSjVX3r3cf/Kz7y6YKQSXfnG81wbqOLKvKFgsDmo8c+pyu9r6CkkUWUHMdck2AGagORJw+fdjnpOrz0Xb3DabqdQ/IUNKfzGy75tLJEmD36YglvtM8tpJ8IRfaTh0FvKyWvw+J/BNP0Hes4yjeIJ0y4VZ3deYaEJ/2n9+fF/KTwINEVeNigvSeZ8sKR50S1pZNGFqTRK2bVEvXZxX9SzvALYQGDmeJQEUS3m7Sum421UCnC08/fnTlqJ4THpBei7LKqjf1nT4A6+WFaMUJGticLJeDkqs79AnZIXF1VSHFxEJ5TLHr56NEF8IxNEWTkikFs/pP9dBJaBCAH6op4sYVF+MXKZ/kK+uYm7WsfhpST2XMZhn/z93P1Fo0Gk/jIs0DXSLOVFYNFZnm2feVaNUHKhEmCZicWQ5EOfZyVsyBzCiBCNiRkt2KXWDb9UCEzQ5sxFokMYGwgZx8jqcwVG1PDIdVLc+9TVvZ/qN9H1OiOWUzMBbMkbT+kUetLZ13d7M6/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(396003)(366004)(136003)(376002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(5660300002)(478600001)(31696002)(6486002)(6506007)(6512007)(66476007)(66556008)(316002)(53546011)(2906002)(2616005)(26005)(86362001)(36756003)(44832011)(66946007)(31686004)(110136005)(4326008)(8676002)(8936002)(41300700001)(83380400001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTdUSGd1Y0pMRlFXUDF3aVpoR1crSzBydGZEbTc1SVU4aWpScXNFNVNpS2E3?=
 =?utf-8?B?K00zRWdCVlJSQkNLbUlUZURUOXg2NmFQa01BZXAxQTNkUHFRcWJzSkxJd3lD?=
 =?utf-8?B?eS9JZU5wWUhLTSt1c1YxNkJaM3k5RlpHc2VXSDAyMkh2R2RxWjJ4NmFCTm1t?=
 =?utf-8?B?bFNVRHpvSk9uWUN0T09td3o0QnppRnpQbWwzdllLd1MwUHNnaUxvdWVOMjNQ?=
 =?utf-8?B?QnZwMWJZcFBoK3VMTDUxRWR3YWRscWtrL1o5M08vWjNqWTJKN2VCeU5YT0Nw?=
 =?utf-8?B?a1lIZnUvQTUyMlkrdmRGaytlWGJleVZoUStUelMzUDJjUnYwVUw0Z1Q4TmI0?=
 =?utf-8?B?U3czNStXY2tQQ3hNdHl5S0UrMWJocUcySmhtNTNIZTRwVWs0NiticWlORVR1?=
 =?utf-8?B?ZUxkUEQ2L3loOHZhaFhGcFhhbkhkaGJQcFJlQk82VU5wdTVqMmh6SjM2b1M4?=
 =?utf-8?B?MzVWa2ZRU1BVdWRiTTh5L3pDR21wbFFSSzdQWTVOclJ2NTFEYzFaT2dyR3A4?=
 =?utf-8?B?UzlBWElyRDB6V2RkOTlMS3VzM1JPeG9nM2N5TStZMzRTakl2anM5bEJNUWVI?=
 =?utf-8?B?cktQaTFSbStUMEJEbi9nMnNCQWtqZnJ1NTJHNGIrTEFpK3RxU1JPMWxaTFlX?=
 =?utf-8?B?akg1STU0bCtQYmc4Vm5iNlg1UHlVTERHd2d4T2hQTTJkc3J1Qy9KMmphWTRP?=
 =?utf-8?B?akt6OXpsNUhENlpwbS9WbnVEWm4rTElHZDMxV0FMSnErMEZyUWt2amtBcGFI?=
 =?utf-8?B?OHU5R1ZJVjFRYVFnTWxPZ0didWwwTndPTm1UNGRtbDhPb2RUaDlUeWRtZkFY?=
 =?utf-8?B?OVR4bjVuWlREMWNqdDRETWg0OFIvSzljTUVnZkl2R1R2Y0NjS2prUmEzOHl2?=
 =?utf-8?B?MDQ1Ymg0ZHNvRnZuMkNDNkkvMzdRQjlkWkJNV3RyU29YRkRGOTZjMTB2QTZW?=
 =?utf-8?B?d0JRcjBnejgzdWpaN2pvK0tIYUVZRVdLQmo2UFJmaVhlc2FmTExOVUhxeDJp?=
 =?utf-8?B?RUNoeXg0emYwT3R2VkZpMUFRTTZmdjVVWjVNRUExMGJOU2RqVVNjaG53UDFB?=
 =?utf-8?B?TkdRSndQK3lTSXduazJSUVBPUnYzNEIvcUxxei9EbWxsdjZrejFPbndKWjdC?=
 =?utf-8?B?Y2hJZGgvQTdWTElXeXh0bnZCRVMxQ3N1d2hKWmxvdnhzZHdJQ1FSNTM1dXNZ?=
 =?utf-8?B?UEN1WkZIV0ZJZ05YcXAyODhIdGIrZnp1bVo0T2NUbzExNjB2T3A2WDNhV0hr?=
 =?utf-8?B?RGlEa2R5ZmFjUGMrcGVyOCtYVUZ1V2cxMlhKV09lMTdONEQ5WU0zSXovc1ds?=
 =?utf-8?B?YmtZWEJobjh3V1JZOWVhaVRTTXRHRFQ0S0hEUTN0akZyWUoweUg5bTZDTVVY?=
 =?utf-8?B?Mk9xSmNCK2ltSGhzQ0QyaVR4SGZaK20ySU1Fb3FEa3hYOCtDcit4Z3ltNHVl?=
 =?utf-8?B?cVhGY0dObW5tczQyeFVwZjBSUkw0Q0w2czFGZ20wb0hYWStwZGpQMGpzcEgr?=
 =?utf-8?B?Q3Exc3ZiTnBPdnJ4OGc0bXprNjQreTNTNnZyR1dJcHNqdVFEOEc5bFljS1dJ?=
 =?utf-8?B?Y1VpVFJEb3RPVjlLZWFNeExSeWtveElzakVpK3FaSlB0V05uTjNtZllKNytz?=
 =?utf-8?B?MnQzRnJhOTNPRlFkTVg4MXFsSjhGZVJ6MVkzVytpOHhGMFNLZ0luemZhclM0?=
 =?utf-8?B?OVJsTFRtOTVuK2hXa1puYVM2R0ZzR3JBQWsxVWFINTkxT011ZmpmNWpEZ2F5?=
 =?utf-8?B?QXQzK21kT25BZ2lCY3lwQktpZS9WTTlMY3dyWEUvb0hFU3NMRTkxdGFQL3Fj?=
 =?utf-8?B?YUd6dUZxbHJhUnlkSStoSkkrbWJpRmQzUitONStsL21VYlRTWXhoZk1iZUhs?=
 =?utf-8?B?Zys1U2pKekpsM1dESnBnMkZaMUQxbHMxT3R4c1poMHhIY0NjdHpiRTdFK1ly?=
 =?utf-8?B?Z010TnEvL1YyRDFkalF0bVBRLzIwaTlRWXYxWjJLRXJOZXpBSElnNjRJMDJ3?=
 =?utf-8?B?QXBWZytsMHBDeVpMeHp0SmNYeXl2R1JXN2dCR3I4R0RYelo3L2JkOEpHSC94?=
 =?utf-8?B?QWFuSkZRaSs1NVZCc25Cay9CN0VNc0p1dVFmUTR3Ri8vWDNyMlZZbmpJbzNu?=
 =?utf-8?Q?zCWHdnGIvzPQ2GKNsyboCOoVE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12926000-4859-48ef-6eab-08dbfcd2329a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 18:26:33.1786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 23ZRIlC5DuX3Ac/QJkgx0UEd5YNiEN3ahRIKAPeCm+qWkMpGtWkDTDF69FtRXiYxaiX1qb4u/U15x3sOkHNIcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5772
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/14/23 05:09, Maxime Ripard wrote:
> The current documentation of drm_atomic_state says that it's the "global
> state object". This is confusing since, while it does contain all the
> objects affected by an update and their respective states, if an object
> isn't affected by this update it won't be part of it.
> 
> Thus, it's not truly a "global state", unlike object state structures
> that do contain the entire state of a given object.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

> ---
>   include/drm/drm_atomic.h | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 914574b58ae7..5df67e587816 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -346,7 +346,13 @@ struct __drm_private_objs_state {
>   };
>   
>   /**
> - * struct drm_atomic_state - the global state object for atomic updates
> + * struct drm_atomic_state - Atomic commit structure
> + *
> + * This structure is the kernel counterpart of @drm_mode_atomic and represents
> + * an atomic commit that transitions from an old to a new display state. It
> + * contains all the objects affected by an atomic commits and both the new
> + * state structures and pointers to the old state structures for
> + * these.
>    *
>    * States are added to an atomic update by calling drm_atomic_get_crtc_state(),
>    * drm_atomic_get_plane_state(), drm_atomic_get_connector_state(), or for
-- 
Hamza

