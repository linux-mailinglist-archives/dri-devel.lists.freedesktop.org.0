Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C83C95214C9
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 14:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1F510E809;
	Tue, 10 May 2022 12:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74D010E809;
 Tue, 10 May 2022 12:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652184274; x=1683720274;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Cs5V1jlyKTBZ1dFCzbp5DBm82VQT5S8/p90KtA6qhMw=;
 b=SV0pbWj1sNOSxqMmUXNQycSgYd1zAoLXrmW5Td1iaAcdUBMnngYwaJqV
 vbezfD7eVRCno4rhoR5w+P5RGSuKRgIkSWEgTRq2n0h70NbT34J+LRJbb
 CF/Tg72lODb6cvzNkdp18Ggvgvg2F9K6Meh4LIga7KhwraBIJINgD6PKQ
 FxVO3yTW9U09OsbB06rQ6py6OcZD4gn8aftN0Qw3Mfli6BRrvY9g2VkpR
 5n31N+5joieA6rw0KBk3D18+GZgVNoEurlh1/iGruXHL6Ds6MdfKiWLxU
 rbUuJZDE99ZKhwG1Zq7Wduo0k3dWgwUvxCedAvwxouKqJ3AHHN+Aih/0v A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="329947169"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="329947169"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 05:04:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="519725063"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 10 May 2022 05:04:28 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 05:04:28 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 05:04:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 10 May 2022 05:04:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 10 May 2022 05:04:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bg7B8zDle8iAa24isyBqDx0A6HprQyzNuwMNYTRMLgIwtyDhF7g+tTDxsHhCXYevAYdsmemy5xaANHm9hkUw+GOBbKiiqv9d9CBB4cI3slzVZdL60BCrxJQOxynB3SjyudSibzysvpXIf07Ag1+WN1i1+iDA3Pa0MTEEjT5uLcVNxV4Q335PWiTG0iYqwMrCuJU3RqsNv0IvHwIS5I5/VT11XHVzG7B+1oLCEDEhSHEvbVMMi+bga95RWonZtXw2xAW9LSn/sYtoGpmtCupJJs7EmfhhN7kdmFez8i8pk1sh0CdY60xFf0JthKU1W6JBzMR3lfA18QWeDs8TXRz7WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Dg33Oql5bhItv1/SV7Ab3O9MUhDDJQv75KC5OvbXgM=;
 b=kyHP4wNN0a+TRgINb6kfuxgMvN3VnzdbT2OEL7YcKZtQNIyBDABGrn3Yw7G+lEI+BlgaBZ52QngYdOqsNmbvu0SDJP/6wl4YtUKFZ/omtAo10tWB39NLry9bFsoP8hd4lIiRw66bbZ1EtFnYt16SSUMQ5nQKDX07NG/89JNOSl3odE7gwsmtWTbEX2P2jBG7oUfNXM8MKTeAhqQGcn1rG1WwWwvg8B4PamXkth4mGfVAq7hg0HKL+7EWJetAcLstSayETxMkghREBj54bRR3I4XuxqP64HDq8W7Iv9Fcsm52KFaLPH8soLUzMl1/e3t8F4s5B6gl32NCogVZHFPw/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by MN2PR11MB4032.namprd11.prod.outlook.com (2603:10b6:208:135::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Tue, 10 May
 2022 12:04:25 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465%3]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 12:04:25 +0000
Message-ID: <40ede7de-ca16-3153-ea28-1b1b1b83ae7d@intel.com>
Date: Tue, 10 May 2022 17:34:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH v2 24/25] drm/displayid: convert to drm_edid
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>
References: <cover.1652097712.git.jani.nikula@intel.com>
 <a52a6882e87a4bb6b1670918f3aba13f9b52f6de.1652097712.git.jani.nikula@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <a52a6882e87a4bb6b1670918f3aba13f9b52f6de.1652097712.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::23) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b353035f-e91f-4744-1221-08da327d39c8
X-MS-TrafficTypeDiagnostic: MN2PR11MB4032:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <MN2PR11MB403252EBC99E9C31286F3203CEC99@MN2PR11MB4032.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jI40odDkEXzaQVplHSrQlS5PyHTbir7s1/GXhof9RUhxrV8nyA2dn4MAdY+UmRS1nXLJJfvOEsPADUDDPonRMkUMVlRBIZX4p5vi4AO79yTfvjmOgNkvVvRbp1HChHrRx/yxY52J4sIMW/p7/RfM5sptSXLULGS5v7628SwJzDpEPtK3FjD8rIBFeFslVlXQZ9q2eFlktyC81Wz3Nk4zdhgZD+d6c9eedX4lYEUgokPUqQJNdTwvp7ENZ78sYV7GfB0rCQ+71wKH8ntttccXDqRxGt+MLWJ49T0h9+fjmRy9q3EJHOPOzXIq9+ieEkyN1Q9G/1p9Nf6vmLpU1ZPy/Xna5WWIadH8ZAB12WOgBL478+8iGzi32gZ2E7+YrC5dkxwEJEXYzQTg2OReD16vy5E6JmfKiVoqY0qD6GKbMgh12ol5GlXiuMoTXiuA76thuBcb3lav/Cty01XERpAMDaeV3dtFA9BUeOyeBVetz0+gSE7lIkkKTlxw1OGDj+Js0zx4TFePqn3JabpYuAHTpae5BsBJ+ZXmWA0nAZDcvwE5GpXrewFFsYzR9Aj63vkwC+Btz0B4Xao+OCW7UAyU47yyzAE+Hr3ibSo67r48Di9kzajQkAlaB+dL4aTKH5JMlhKnLtCVwI2XJAxztYmvs1tIWGhdAjDczG+PLoySgLrcTuj6LbImUKDSK9NjHyckNJirjhkfF2mzY7kElvEhD71BEeLEowsXiyIYH7d7zG4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(55236004)(36756003)(86362001)(6506007)(2616005)(53546011)(38100700002)(66476007)(316002)(6666004)(66946007)(66556008)(450100002)(8676002)(4326008)(82960400001)(83380400001)(31686004)(508600001)(2906002)(6486002)(31696002)(5660300002)(6512007)(26005)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGhIMWYzaXFIZWJUeGZud1lJOVBaL3pmM1VKOXNESUtzbmYyVHFjK1NkelZu?=
 =?utf-8?B?a2RtbHdsZUs0YkJweEd5aUJZNmJLa2crUjBNQmxTSHRQRHMzOHM1TnlKcXVt?=
 =?utf-8?B?QVEwVm9KVmtERnBPTlFzajh2cEVDMDYvMHpRQy82blpkYWw1MkNoQmRuMEtH?=
 =?utf-8?B?RzJNbCtYeURKOC9aMlpjRldKL2pDbkowRzdkWFAxMGFkL1AzMEdwQkpkY3ZE?=
 =?utf-8?B?ZkZ1RThNdk5nWktJVHVXTithYjBnaUVMdjRVbmFRQnp5TzBKd1JiVEFqOXFH?=
 =?utf-8?B?Ujc2YUNVcTFpRWxlaGFrcFhVZWROZXBaMEZRRy9lUmozM3F5aWtKOTU1Slkx?=
 =?utf-8?B?U3RsZEZMWkxZMDVTUnZYY045dmM2S0oxbEI1dGpuakNWblI1UmdOaFUxYTM3?=
 =?utf-8?B?UG4xMXkxWnRTMHNqNkhDVzZCTDYrQkdINjF0YllaSTdaZHFSNEU3cE9mcmJM?=
 =?utf-8?B?VXJLWUhpdWNvbDRIZTJucDhObGwxWndoUjk1eTlTZE00NnBnQTdlL0F4eVpv?=
 =?utf-8?B?dUY2b2E1anVEUWJGdU1USzduQ2Vlc1krUmpudEtmM1M0bGlnRERKbHlTMWc0?=
 =?utf-8?B?Nmt0eExLWi9UMUp4SXNSRDdSdUp2K2JTQzhDMWtsVi96cDB2Z2w3OU5VbTZn?=
 =?utf-8?B?MUdSVUlzNDZSUkl1NlBKZnI4QkJFc2V0K2RYTFVML1J0czJSQ1RTRG5XbWI2?=
 =?utf-8?B?ZXVTUFU5dVJOVjVaTEZlNlVKUDl3cFJxem9kYVRaRDZob0tpaEpYWG0reWU5?=
 =?utf-8?B?aS84VUdnK0dFWmYwd0FZOUFubXM1a2NtYmR5T2J3Nkd6NFdISWl1RjZaK1Vm?=
 =?utf-8?B?VXBsUlJYN0hwNjM5UDdCS3Rtby9lZjBGNk5Qd2Ywdy9hVzVid2hqYmU2VnEz?=
 =?utf-8?B?S216VHNrVVRLcklaL0xJT1UrSlpUTnBkS2JJVWtLY2MvZGJiazA5VUo5OGZx?=
 =?utf-8?B?NFNMYVd1WW1FNTVFbXJtWng2ZmVSeThMcmlIZ2k3cXVEZDh2SjdreUFVV2Uy?=
 =?utf-8?B?RTVWZU9EaWxpQnhaRnNlaFFySmwyTE50UWxxQ0kwekk2a1RqNVRrS0xWdElG?=
 =?utf-8?B?bjYyQVgzSWVXWHlSRHpqRG45TU5yK1prTW9zTFFkK1ljVWhxRTJOZ1dlNFFB?=
 =?utf-8?B?SU1uWWxVKzFnUzJFdno5K1Urc0tvaGpWWVI1U1RMSWdRZkJvZEswWURqRDdi?=
 =?utf-8?B?Y3piNHA1UWE1REVDT1RnNGEzeEd6ek1SeVAyNmM0SGxhNHR2dTRjaUtJZmJs?=
 =?utf-8?B?bkNXU3ZZdkwwK256OGNGK2ljQ01Na3hWaTI5a245a010RkRxSHR3TGZkNlA2?=
 =?utf-8?B?OTUwN2tXMEV5WVRWcUlBUjNxZE4wT3RIYU1tbmozR2tmTGU3bFJlRW53VVp4?=
 =?utf-8?B?YU1acTVmajlyS2VIY04xZHdmZTZmRWIya1hYZ09IT3gyK0VsTEYzUndZSXhw?=
 =?utf-8?B?akkrblpWRWxqckZFLzduU21jQmp1U01hU2JPdVBoVytubldCUllFSnhULzhw?=
 =?utf-8?B?Rk9KYXprY2FKeXk2R1o0MHBhbFZuVWhoZUk3RUcvb0hvUWRIdzJGaG1Gd3ZQ?=
 =?utf-8?B?UGxKTnkwdUx3Zyt3R05lVzB5ZERmZmNQclBGRUFCbkNVcmNSUmJqeFZUdk1U?=
 =?utf-8?B?aWE1M25kV2lwRkM4Wlp6OVo1MmZPdENQS0lTTVRNaDNrZHFDNDlxOFUxOHZI?=
 =?utf-8?B?TVZCUDN6VDQ0UC92ZmlWYmJuSzNPZWkzZXBBQ0xuZjcvcGZMSURXYzRSOEtw?=
 =?utf-8?B?aUtld291Z1VrNjFxbEZzUGtPZXBPeXJQckU3OWVwVjdQQk5BYllKVk1hQ3g0?=
 =?utf-8?B?YnAveHRQKzE0S1VJVTJiaUZ2WC9KMVB4VjhMcnB0V2V1dGlTK05HSVVMTWY3?=
 =?utf-8?B?QzA4U3JaWmtaajkxOE1oakhPUFNVbU96N2p3NlEyVkFXRzZqVU5HVDZrV0o2?=
 =?utf-8?B?d2d3NS85MkVhbnNUNk1NOGQvSmV3dHFIWnY4VkNrcnNJV2RnQnRKMStrMnNJ?=
 =?utf-8?B?V1crYW5BZlVUOTk0QXJoRG5EbGNEZXExVjZEV2hxZkl3bWtubGxDTkNuZ3hz?=
 =?utf-8?B?aGhiVDdKd0l1TUg4a295ZzVMUnV0OWZkUlJHaHpvTUlJMjIxMDNsa3hleHEz?=
 =?utf-8?B?M3ZWc1hnR1g5ODRVY1RuVUNXYVZmVFFQbnVMVEJWc001d1lJZE1XK2pFaDFp?=
 =?utf-8?B?Q1FBSkd0UThYYlJ5RVBnM1hHWFNjMkFVRDhjdnJLaXhpRmdaSHFXZXRoREVJ?=
 =?utf-8?B?MjRPSTRpYTliRlJwZEh1T2VpcmlEdDAvUzl1cG9wSTA1eUpITURrMEtDRXNI?=
 =?utf-8?B?ckNpM1krTW5XdTcxM1c0K211NXg4dGhBZ2JDOUw2S0JNZjM1MStqV3ZyaThB?=
 =?utf-8?Q?qI9f1dQlPZHEGTkY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b353035f-e91f-4744-1221-08da327d39c8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 12:04:25.1497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DFPG7yiNIfgikLsBp+Z5YBuSt1gFNEUvSt+TdG99yIwZrll74sWY3YWFXircnKE/i4HLFUSvghh+1+QSZYOnYs0H9PvY03QV9W0VQxxxK7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4032
X-OriginatorOrg: intel.com
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LGTM

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Regards,

Ankit

On 5/9/2022 5:33 PM, Jani Nikula wrote:
> We'll need to propagate drm_edid everywhere.
>
> v2: Rebase
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/drm_displayid.c | 16 ++++++++--------
>   drivers/gpu/drm/drm_edid.c      | 17 ++++++++++-------
>   include/drm/drm_displayid.h     |  6 +++---
>   include/drm/drm_edid.h          |  6 ++++--
>   4 files changed, 25 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displayid.c
> index 32da557b960f..38ea8203df45 100644
> --- a/drivers/gpu/drm/drm_displayid.c
> +++ b/drivers/gpu/drm/drm_displayid.c
> @@ -33,11 +33,11 @@ static int validate_displayid(const u8 *displayid, int length, int idx)
>   	return 0;
>   }
>   
> -static const u8 *drm_find_displayid_extension(const struct edid *edid,
> +static const u8 *drm_find_displayid_extension(const struct drm_edid *drm_edid,
>   					      int *length, int *idx,
>   					      int *ext_index)
>   {
> -	const u8 *displayid = drm_find_edid_extension(edid, DISPLAYID_EXT, ext_index);
> +	const u8 *displayid = drm_find_edid_extension(drm_edid, DISPLAYID_EXT, ext_index);
>   	const struct displayid_header *base;
>   	int ret;
>   
> @@ -58,12 +58,12 @@ static const u8 *drm_find_displayid_extension(const struct edid *edid,
>   	return displayid;
>   }
>   
> -void displayid_iter_edid_begin(const struct edid *edid,
> +void displayid_iter_edid_begin(const struct drm_edid *drm_edid,
>   			       struct displayid_iter *iter)
>   {
>   	memset(iter, 0, sizeof(*iter));
>   
> -	iter->edid = edid;
> +	iter->drm_edid = drm_edid;
>   }
>   
>   static const struct displayid_block *
> @@ -88,7 +88,7 @@ __displayid_iter_next(struct displayid_iter *iter)
>   {
>   	const struct displayid_block *block;
>   
> -	if (!iter->edid)
> +	if (!iter->drm_edid)
>   		return NULL;
>   
>   	if (iter->section) {
> @@ -96,7 +96,7 @@ __displayid_iter_next(struct displayid_iter *iter)
>   		block = displayid_iter_block(iter);
>   		if (WARN_ON(!block)) {
>   			iter->section = NULL;
> -			iter->edid = NULL;
> +			iter->drm_edid = NULL;
>   			return NULL;
>   		}
>   
> @@ -109,12 +109,12 @@ __displayid_iter_next(struct displayid_iter *iter)
>   	}
>   
>   	for (;;) {
> -		iter->section = drm_find_displayid_extension(iter->edid,
> +		iter->section = drm_find_displayid_extension(iter->drm_edid,
>   							     &iter->length,
>   							     &iter->idx,
>   							     &iter->ext_index);
>   		if (!iter->section) {
> -			iter->edid = NULL;
> +			iter->drm_edid = NULL;
>   			return NULL;
>   		}
>   
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 26ac4d262e31..a44818f44718 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3563,10 +3563,13 @@ static int add_detailed_modes(struct drm_connector *connector,
>   
>   /*
>    * Search EDID for CEA extension block.
> + *
> + * FIXME: Prefer not returning pointers to raw EDID data.
>    */
> -const u8 *drm_find_edid_extension(const struct edid *edid,
> +const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
>   				  int ext_id, int *ext_index)
>   {
> +	const struct edid *edid = drm_edid ? drm_edid->edid : NULL;
>   	const u8 *edid_ext = NULL;
>   	int i;
>   
> @@ -3598,11 +3601,11 @@ static bool drm_edid_has_cta_extension(const struct drm_edid *drm_edid)
>   	bool found = false;
>   
>   	/* Look for a top level CEA extension block */
> -	if (drm_find_edid_extension(drm_edid->edid, CEA_EXT, &ext_index))
> +	if (drm_find_edid_extension(drm_edid, CEA_EXT, &ext_index))
>   		return true;
>   
>   	/* CEA blocks can also be found embedded in a DisplayID block */
> -	displayid_iter_edid_begin(drm_edid->edid, &iter);
> +	displayid_iter_edid_begin(drm_edid, &iter);
>   	displayid_iter_for_each(block, &iter) {
>   		if (block->tag == DATA_BLOCK_CTA) {
>   			found = true;
> @@ -4454,7 +4457,7 @@ static void cea_db_iter_edid_begin(const struct drm_edid *drm_edid,
>   	memset(iter, 0, sizeof(*iter));
>   
>   	drm_edid_iter_begin(drm_edid, &iter->edid_iter);
> -	displayid_iter_edid_begin(drm_edid ? drm_edid->edid : NULL, &iter->displayid_iter);
> +	displayid_iter_edid_begin(drm_edid, &iter->displayid_iter);
>   }
>   
>   static const struct cea_db *
> @@ -5657,7 +5660,7 @@ static void drm_update_mso(struct drm_connector *connector,
>   	const struct displayid_block *block;
>   	struct displayid_iter iter;
>   
> -	displayid_iter_edid_begin(drm_edid->edid, &iter);
> +	displayid_iter_edid_begin(drm_edid, &iter);
>   	displayid_iter_for_each(block, &iter) {
>   		if (block->tag == DATA_BLOCK_2_VENDOR_SPECIFIC)
>   			drm_parse_vesa_mso_data(connector, block);
> @@ -5872,7 +5875,7 @@ static int add_displayid_detailed_modes(struct drm_connector *connector,
>   	struct displayid_iter iter;
>   	int num_modes = 0;
>   
> -	displayid_iter_edid_begin(drm_edid->edid, &iter);
> +	displayid_iter_edid_begin(drm_edid, &iter);
>   	displayid_iter_for_each(block, &iter) {
>   		if (block->tag == DATA_BLOCK_TYPE_1_DETAILED_TIMING ||
>   		    block->tag == DATA_BLOCK_2_TYPE_7_DETAILED_TIMING)
> @@ -6372,7 +6375,7 @@ static void _drm_update_tile_info(struct drm_connector *connector,
>   
>   	connector->has_tile = false;
>   
> -	displayid_iter_edid_begin(drm_edid ? drm_edid->edid : NULL, &iter);
> +	displayid_iter_edid_begin(drm_edid, &iter);
>   	displayid_iter_for_each(block, &iter) {
>   		if (block->tag == DATA_BLOCK_TILED_DISPLAY)
>   			drm_parse_tiled_block(connector, block);
> diff --git a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h
> index 7ffbd9f7bfc7..49649eb8447e 100644
> --- a/include/drm/drm_displayid.h
> +++ b/include/drm/drm_displayid.h
> @@ -25,7 +25,7 @@
>   #include <linux/types.h>
>   #include <linux/bits.h>
>   
> -struct edid;
> +struct drm_edid;
>   
>   #define VESA_IEEE_OUI				0x3a0292
>   
> @@ -141,7 +141,7 @@ struct displayid_vesa_vendor_specific_block {
>   
>   /* DisplayID iteration */
>   struct displayid_iter {
> -	const struct edid *edid;
> +	const struct drm_edid *drm_edid;
>   
>   	const u8 *section;
>   	int length;
> @@ -149,7 +149,7 @@ struct displayid_iter {
>   	int ext_index;
>   };
>   
> -void displayid_iter_edid_begin(const struct edid *edid,
> +void displayid_iter_edid_begin(const struct drm_edid *drm_edid,
>   			       struct displayid_iter *iter);
>   const struct displayid_block *
>   __displayid_iter_next(struct displayid_iter *iter);
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index c3204a58fb09..c61e75ab8f63 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -28,6 +28,7 @@
>   #include <drm/drm_mode.h>
>   
>   struct drm_device;
> +struct drm_edid;
>   struct i2c_adapter;
>   
>   #define EDID_LENGTH 128
> @@ -578,8 +579,9 @@ struct drm_display_mode *drm_mode_find_dmt(struct drm_device *dev,
>   struct drm_display_mode *
>   drm_display_mode_from_cea_vic(struct drm_device *dev,
>   			      u8 video_code);
> -const u8 *drm_find_edid_extension(const struct edid *edid,
> -				  int ext_id, int *ext_index);
>   
> +/* Interface based on struct drm_edid */
> +const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
> +				  int ext_id, int *ext_index);
>   
>   #endif /* __DRM_EDID_H__ */
