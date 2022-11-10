Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 226D962434B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 14:34:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FA710E7B0;
	Thu, 10 Nov 2022 13:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87EC410E7A7;
 Thu, 10 Nov 2022 13:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668087233; x=1699623233;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XOuXNfXm77ixqo1O+Mlb3MUpjB6Rsumhob6DwCRP61c=;
 b=m8TM/mBaaOIVEEjxHLNgdtUCIO8x0HGlTO9YnCk+uFeuhdlog82WuPwf
 BXSyvxTafb1TOG5pf0vhSRwX/uyEi7gqdafGhqkYPatxo4lJ9Q0VXTOZp
 3NuTUs9flL2r6yJ1ATRYh2xzWR8EhK2p5/8YD/GE8kkSouN4UrOKmHICe
 ylqDRoygapDMzFjw/MONZvLGZXw7QnEbcRHmL2JY0OQElOPAmQpW/4si6
 bzEKJkCAc6+te1ohAn9Zc3rmEJfA33RF5xhoIC+OwEW3am0rxeJqHBZjQ
 xTpuwq8wTCbbKEFIyJUv17QEyGu3XiSVMPkYAOmvHngjL9QvYsrxgv8Gr A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="312441899"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="312441899"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 05:33:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="779773054"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="779773054"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 10 Nov 2022 05:33:50 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 05:33:50 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 05:33:50 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 10 Nov 2022 05:33:50 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 10 Nov 2022 05:33:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ja+2/PErouqeYljtSzfWPMV4WQOcn1kpeH2ApF7aW2a2xNpZAAdCzQpHuko98I2kNHKPYuPLkd6wKrZi9VPXIIC2Ll1HRlO1uKoMuVdtASSYVQuhXeBYb/7Y5a9S1N5y/EsO5FT3jQ0tsBxfifdafm9Xt9IcWVNS9x9rVyAfCzm1mrhSi0T5lYn9ueNJQmzGXTz5jeQbc0mZgVtKeLH6fvAok8TWocyLwPvMInvVgoXJuaYeA49YFMdeaEinzQUZ9HiBwl5F8N6RV+Bm0Z5IP2e/fda8XEMgKxGzvyNO2p5s6ySZKONjQce7E0fThzVbkTU9X0b+lPfuf9I8BFv7hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIUDsoqaYTSlvadJS+OtT5koXQ1BQ8sul1rzI1vBXE0=;
 b=QiIR7ZJobUMHIT31J/BD+ktsFJQKxDIWPqssvCKX0IMlNO5gvS7gSM+0GHyp8PX92JDfm6JCsM2z/NyxwY9IPbh/JJLAy99jFU2aHenem1PkvsyJ3BHnaNOh7aFsFYsrtlFPHY1ZN7AshfNpKzwim50Hq4FAONrcjxvWb53vuxMUV6XH2LucIED2ELFlq2kGmwxTd9OFqJUrPpZmpHh8lb8eRGMFSHHnD/kyPOdHVzI0iSvWTnZUuzW5HfT0y49vS3tZlduhceP1+41czGrkJcRGa2uZo/jPrZYOPnrIZF9kpuOSd+oFSKfUyWjFGABn7ltVtSAEgwGk47xcjl8MGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 SN7PR11MB6602.namprd11.prod.outlook.com (2603:10b6:806:272::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 10 Nov
 2022 13:33:48 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67%3]) with mapi id 15.20.5813.012; Thu, 10 Nov 2022
 13:33:48 +0000
Date: Thu, 10 Nov 2022 19:03:36 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915: Update workaround documentation
Message-ID: <Y2z9sEQNWiSgaoUW@bala-ubuntu>
References: <20221108003028.2350143-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20221108003028.2350143-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: PN3PR01CA0022.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::23) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|SN7PR11MB6602:EE_
X-MS-Office365-Filtering-Correlation-Id: bd2fa350-620c-434a-e247-08dac3203197
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Do6LzgnJ/YiWT4Ue8LCsPORclJJTz5hWWNwRaRNuQ9tRxI+7WK7iDWzmIg8XB2FVeQ5HEQZQT0TlSFs6y9Vh9ac6Y6PTNeR5XW7G0gZZkkol8ssgzCPPO9+OSNkLmqOAxizNi8TKlXZShYkyA2YzCLFpcv6ApU8RpWaoOFyMuvDY23B00+kARVfmlushpSfb++Q5IXwklrgnK1IGPGfLA/gTJdjJKTIW3Rgue066wAFTQxgM8tY+UnsOibpafwfXqBmz0sUKcxK0B8GBTFlUpBjH4KfOaqUva91rPRnCLFwc4we0vab/1Omxt+bMVAo5ZZlT5OlrvCv0AwBEaOgNzd3ds+iAfcxIhGyP2PrUZSeDXMvgN6SX237a95TcLFl/1PEjdcXt/68gcaDRDYZtG3nc1jpooORFg6bQ9DGNrkZaSB57EU1SvYFnMVJKA5wls50K99D4I/ibfAegIBbG08uk36vSxOdLfR9/l25rPN8FoZh0TBuoBELzY87KCkKTV8ayXS1OSmYcgk07uiCsuOFJi1HjOFtFkoEAo84GZezGBy8YlN8tXBqPj+n0VBRl0PzuSNdwumRWmsWGOSZb6mG2/SA3haD14hOkHT/1iKuzR15kU3OSvjcMv/nxh3YKEr1jwa1/NamOc73HjYKOjqejo3cikvTLM+QSRVlBVQvTll6vBu8knlpLDo0lMUj/vFIa9j5AKab+A8G81Arplg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(366004)(346002)(396003)(39860400002)(376002)(136003)(451199015)(86362001)(66476007)(26005)(41300700001)(8676002)(4326008)(66556008)(66946007)(6512007)(9686003)(44832011)(186003)(8936002)(5660300002)(6666004)(478600001)(6486002)(53546011)(6506007)(450100002)(316002)(15650500001)(38100700002)(33716001)(82960400001)(83380400001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3BPZFlwVk5WNmUxTkd0cEYzY3MrenZKZnQ5aWxnMnk0NTc4dktRNHYraXB4?=
 =?utf-8?B?UkdmV1VUREtCTDQ3Y2hiSmxWcjRGK0p2K2lON1hGWWF3UVhpQi9Ea2RsMVNr?=
 =?utf-8?B?K1YxWlY2SmJLcmFHcTlzSmJZWVV4bnYxNkl4cURTVU9Ndk8zWmU4YTBBdU9W?=
 =?utf-8?B?WDd5VnJZYmJONmRMTFJqR08zRjhtVUxJVDU2N0h4TDQwWVFrbmpSYVlGM1Jn?=
 =?utf-8?B?VHZ1azdyZytYdHlZSFArUGFuMU0wUHQrUjFWS29jYWhncXFtOW8vbm14SFpo?=
 =?utf-8?B?a3NaQ2lyeFV5VjdMY2dBNFdhc0tNdDVKZC95R0N6c0x5WWZSWmIwNWR6SnZh?=
 =?utf-8?B?Rmc1NVBDN3VkZGVRUTRvM1FrZ2lTeXhIOEEzdkUrNXVNc0JMTGxwdEw0eHpV?=
 =?utf-8?B?UlZETUx0TDIvYTRYT2pSbFRuZGZHQnpOV3V3TW1rQjdCZUlUbWdZc1c4S1ZQ?=
 =?utf-8?B?NUFxQ3h6amIwNEhzQ3RRQ2R0Qk43VkUwcTNsWTIzV3kxY3ZieHhYa05hU09R?=
 =?utf-8?B?QXlaSWI3UUUrUUNObVFpSlZvVUJIQTJzUmFzWU9ZdW1nem9ldno0bXNiZXpk?=
 =?utf-8?B?KzlERWRCYWQxdk5ZWEFWb1ozeHhUVi9ab2lnd3lkaHlMenpPOTRFdGZlbFR2?=
 =?utf-8?B?SytrQVdHRVpzaE1VYW43SG9RMGxxbFF5RXRXckw4ZXd0WXFyQ0lWeWZ5anVE?=
 =?utf-8?B?TTFreVVtcm9rRFBCSzRWd0o1d3FvOVp0N21QV0ZOeHhKVGRhajhuOTdBUGhU?=
 =?utf-8?B?R01JZng2alQyb3dJRk9QOURqdFN0V20vVlRJTng2aGlEbUJZQ3Vialk0NndZ?=
 =?utf-8?B?Qm80U3VqQzNVTlZaM2gxQnJGZkMySlRjT0FnQWJ6cEhlOWI1ZmdMYytyaUpH?=
 =?utf-8?B?OXpSMytmZkNwOGlWU1lIbWp4cWxXTEN1bEpvbUpEVFBFMmlGdmJZR3VEajNL?=
 =?utf-8?B?SjZ5RWpjM3IyMUNqT2RQaWRNZUYybGZ6aWtBOW9PbnJXZi9zL3VXbGxQaWNo?=
 =?utf-8?B?VGUvMm1aM2hWY2Z4TG1YdVJsNEdvWnE1d0NDOS9FV0F6WFQ1Nkx5T2d3L0Ft?=
 =?utf-8?B?V1VtbnVpTFlmZUp0ekZ1anNsNS9LTlpGNlJHZ0Yvckk2Z3lqQXEzRVhLS3dT?=
 =?utf-8?B?dmloOWhRbHl3N05xbU03eEdsNFAvMkdyWUZrZVdmUFhyWndLMG13VmVWaDE1?=
 =?utf-8?B?YnhENWFHZjFMV3dkSGM0WUJsUzVaR3VYV1pQejVqQTJCLytTNnRUU2NCcW1w?=
 =?utf-8?B?NE5pa0xWQlVGblhEdWl1TERCeEpYalNIL09FVzNOaC9MVDRzSUtFRWI4UWhZ?=
 =?utf-8?B?V2FocENiVEZ0eFo2NDh0ZjZydEhKMlJuREswbzFWRy9USXQ3clhLSjlvRlZr?=
 =?utf-8?B?aFNVZ0dqTlN2akhHWE9SdnFZUTdkd1gvOVgzMjdKeXRCZWlvRWx5QnJJd1hN?=
 =?utf-8?B?WkZYb0tJWCs3c2hzTjR0WXdVQTFienNNdENNRjVXKy9BaFFxeHZ4cnBnNHph?=
 =?utf-8?B?TmtxOHMvNERwMThVWnM4dFJTVTBZVWYvZjFuYm5keml5ei9uYXF2dW8vYUx5?=
 =?utf-8?B?bUlHLzEybERpeWRFRTJMUUxOTTB1MGs5T0MzbG5uU1R3S3hxcVNYajZ3UWI2?=
 =?utf-8?B?N0JGbFJmTW5tb0R2T0UwVGdPM3FZQ29HSGJaYzRKdkk0NlZpNUcrQkd0a0Va?=
 =?utf-8?B?SVY3NnY1ejdyNXBnWmVSSzljWHBmeDJlcmhnQXgxVWpXbGxTeUw1VnozYlNN?=
 =?utf-8?B?ZHZzamdiTzRaVkdwc0szMGY3V2JHM0p4c3ZyZTdxcmIrTXNIMEgyNDJYYW5u?=
 =?utf-8?B?Y3F5eDk3MXF6TlRMRmFZY2NwdVFlSlFnNmgzRzdOSkR6emxzTnlNU3d4Sjhi?=
 =?utf-8?B?SjY3Zm52VEtZSzlUcjhIVWRwUUlYRkI5bXVYdys0MkplZk1zRzltaFFIQVRN?=
 =?utf-8?B?MnpGVzQ1S2s4TWVjcTlrcW51Nm9pQkVPTGlSK3MvWlJDSlVwQUJMSDQzR3NL?=
 =?utf-8?B?bXZESWhIajMwYldDUkhBY1JCNkc3NE1ReEo5djhldzI3ZU1YQWNRaFhuWFNK?=
 =?utf-8?B?QkFOYTJBYlAxN3RjaFhoTHFhV2JwYXFiUW9jVGJoRm5PSTY4Wjk0YzBwTkdF?=
 =?utf-8?B?T3lNMUNxY2tzUHhJRlRkK1ZTbHpRd3RuR29BbnBObTgrb2J4OXBoNWZCZkVG?=
 =?utf-8?Q?HQXaGO1YLBN/d41r9VaGUJY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd2fa350-620c-434a-e247-08dac3203197
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 13:33:48.1783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oa9S+JTyawWzRo4Ovoi2kL7fexSwaAP4W2CxFUCA7/jNUCG7CXFXSHHRgD8ZJzzGeNa80DaZossXz1HjjSNWvXEcAzwLtQ5rxO9PugToVANNvX5vy0/g9P9btYv+k48u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6602
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07.11.2022 16:30, Lucas De Marchi wrote:
> There were several updates in the driver on how the workarounds are
> handled since its documentation was written. Update the documentation to
> reflect the current reality.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 87 +++++++++++++--------
>  1 file changed, 56 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 3cdf5c24dbc5..0db3713c1beb 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -17,43 +17,68 @@
>  /**
>   * DOC: Hardware workarounds
>   *
> - * This file is intended as a central place to implement most [1]_ of the
> - * required workarounds for hardware to work as originally intended. They fall
> - * in five basic categories depending on how/when they are applied:
> + * This is intended as a central place to implement most [1]_ of the
> + * required workarounds for hardware to work as originally intended. Hardware
> + * workarounds are register programming documented to be executed in the driver
> + * that fall outside of the normal programming sequences for a platform. There
> + * are some basic categories of workarounds, depending on how/when they are
> + * applied:
>   *
> - * - Workarounds that touch registers that are saved/restored to/from the HW
> - *   context image. The list is emitted (via Load Register Immediate commands)
> - *   everytime a new context is created.
> - * - GT workarounds. The list of these WAs is applied whenever these registers
> - *   revert to default values (on GPU reset, suspend/resume [2]_, etc..).
> - * - Display workarounds. The list is applied during display clock-gating
> - *   initialization.
> - * - Workarounds that whitelist a privileged register, so that UMDs can manage
> - *   them directly. This is just a special case of a MMMIO workaround (as we
> - *   write the list of these to/be-whitelisted registers to some special HW
> - *   registers).
> - * - Workaround batchbuffers, that get executed automatically by the hardware
> - *   on every HW context restore.
> + * - Context workarounds: workarounds that touch registers that are
> + *   saved/restored to/from the HW context image. The list is emitted (via Load
> + *   Register Immediate commands) once when initializing the device and saved in
> + *   the default context. That default context is then used on every context
> + *   creation to have a "primed golden context", i.e. a context image that
> + *   already contains the changes needed to all the registers.
>   *
> - * .. [1] Please notice that there are other WAs that, due to their nature,
> - *    cannot be applied from a central place. Those are peppered around the rest
> - *    of the code, as needed.
> + * - Engine workarounds: the list of these WAs is applied whenever the specific
> + *   engine is reset. It's also possible that a set of engine classes share a
> + *   common power domain and they are reset together. This happens on some
> + *   platforms with render and compute engines. In this case (at least) one of
> + *   them need to keeep the workaround programming: the approach taken in the
> + *   driver is to tie those workarounds to the first compute/render engine that
> + *   is registered.  When executing with GuC submission, engine resets are
> + *   outside of kernel driver control, hence the list of registers involved in
> + *   written once, on engine initialization, and then passed to GuC, that
> + *   saves/restores their values before/after the reset takes place. See
> + *   ``drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c`` for reference.
>   *
> - * .. [2] Technically, some registers are powercontext saved & restored, so they
> - *    survive a suspend/resume. In practice, writing them again is not too
> - *    costly and simplifies things. We can revisit this in the future.
> + * - GT workarounds: the list of these WAs is applied whenever these registers
> + *   revert to their default values: on GPU reset, suspend/resume, etc.
>   *
> - * Layout
> - * ~~~~~~
> + * - Register whitelist: some workarounds need to be implemented in userspace,
> + *   but need to touch privileged registers. The whitelist in the kernel
> + *   instructs the hardware to allow the access to happen. From the kernel side,
> + *   this is just a special case of a MMIO workaround (as we write the list of
> + *   these to/be-whitelisted registers to some special HW registers).
>   *
> - * Keep things in this file ordered by WA type, as per the above (context, GT,
> - * display, register whitelist, batchbuffer). Then, inside each type, keep the
> - * following order:
> + * - Workaround batchbuffers: buffers that get executed automatically by the
> + *   hardware on every HW context restore. These buffers are created and
> + *   programmed in the default context so the hardware always go through those
> + *   programming sequences when switching contexts. The support for workaround
> + *   batchbuffers is enabled these hardware mechanisms:
Did you want to say "is enabled *through* these" ?

Rest looks good.

Acked-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

>   *
> - * - Infrastructure functions and macros
> - * - WAs per platform in standard gen/chrono order
> - * - Public functions to init or apply the given workaround type.
> - */
> + *   #. INDIRECT_CTX: A batchbuffer and an offset are provided in the default
> + *      context, pointing the hardware to jump to that location when that offset
> + *      is reached in the context restore. Workaround batchbuffer in the driver
> + *      currently uses this mechanism for all platforms.
> + *
> + *   #. BB_PER_CTX_PTR: A batchbuffer is provided in the default context,
> + *      pointing the hardware to a buffer to continue executing after the
> + *      engine registers are restored in a context restore sequence. This is
> + *      currently not used in the driver.
> + *
> + * - Display workarounds. The list is applied during display clock-gating
> + *   initialization. However most of the display workarounds may be considered
> + *   to fall under the "Others" category below.
> + *
> + * - Other:  There are WAs that, due to their nature, cannot be applied from a central
> + *   place. Those are peppered around the rest of the code, as needed.
> + *
> + * .. [1] Technically, some registers are powercontext saved & restored, so they
> + *    survive a suspend/resume. In practice, writing them again is not too
> + *    costly and simplifies things, so it's the approach taken in the driver.
> +  */
>  
>  static void wa_init_start(struct i915_wa_list *wal, const char *name, const char *engine_name)
>  {
> -- 
> 2.38.1
> 
