Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6923F6E94F3
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 14:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A32B10EC2C;
	Thu, 20 Apr 2023 12:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370C310EC2D;
 Thu, 20 Apr 2023 12:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681994785; x=1713530785;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G43jlQyM99RouL6cWExWlOoM+x2LDsIpqOsazwBvkuI=;
 b=Wl5jL6hrGFMyNRyyv1mD5NufXMQvyEq/zOtGXx0fS9Ro8nin8EG6RtTA
 zirVicKZBMgOwdvcV3lSXGWuw0HkZKR5vzZPx1Dxk/fGarPd//i5ENNPY
 i6jgBD4XjS5shmcjP5yj4Yxr8/Bfi+WpGRiik2YmKcM3ZD1ByfkhdikEB
 qRJA9Y2/Z/WgJfhAtRP68uboX5iFwn9HwKuPh9FAHvbFHzh/BHgVYii0P
 FtTDi+yiK/pQnGrhFQRGR9gOstSSD7ihOcyItxZ+EutM8wT4xF3XBZ5nP
 EOHAQOTLyPhDVQUWgg3NhXnIRY99yzQbIu/prAAE5pKLernj9XJYGl6e4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="334555725"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="334555725"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 05:46:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="642126468"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="642126468"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 20 Apr 2023 05:46:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 05:46:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 05:46:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 05:46:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTOq4AcbY8CActBDE/NzAUB8R+7/h4T0RNAKyual3wgpfRd1Pnmp0Sc6tWIhIAaw9tqo0w084bdwEnkBhfItjSC7vGjnoaKKzBPUKbGAr0Fx3oayYq+ADnqG739mvqyCSGy0CUTk7zKtrxQGk18rsSrC6A+3jMs0mprYFeLAf6GPK043BDd8PSC9GndKJMy0SzH/urSoGYyegzQ1Gx3cKoZAorWz76cZnmwihr3+zHGbcPzUy6f6+aNffMesh3ZX8iBzoozsgOF3MuTJY+/IDufMXoEWhncCzxvQoG9/FsGa9rEhJSKIetA+Rr/oKb7KQjnWVDcqgQ//qFltkt9UEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ypz/j8wH5jRXKnCVmSbz1Ge4fKn015W0mcc2yF3UkeM=;
 b=lS3qbIEhcjavTo/OvlL73OlpJcdaIg5NYqfcSCdCX5etPCIkwcLgAAjo1kIekUYn1HSenjX6g4ehLzQIAFwmuI+eFKBTh+IFvdJN9467POiVe6VxooSdRcAoOmiMoCrsvwKpLk2X++8bqmALwytLTwrGEZqoeY5jjxJvqggZwmQGQKs5jKG2ZlCpEvfSqFHjQQHkpvCVeu/FGzNbXsgYcGAp2OKX1jZxd3B3OwByjyCSZCyYLcyyzk5TqWnKuefja1R13PmVQLaiELYtg1LFCr7FzcBG2ia2YPZFpoDkDLTbL8/+9jNOrQ0mUhosued1OWNmu6h96DrTOGZ24eRbdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DS0PR11MB7630.namprd11.prod.outlook.com (2603:10b6:8:149::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.50; Thu, 20 Apr
 2023 12:46:05 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::d1b9:3221:bc0d:1a9b]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::d1b9:3221:bc0d:1a9b%8]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 12:46:05 +0000
Message-ID: <5eab6cea-36dc-27c9-fdd5-c553a39e3c9b@intel.com>
Date: Thu, 20 Apr 2023 18:15:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] drm/dsc: fix DP_DSC_MAX_BPP_DELTA_* macro values
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>
References: <20230406134615.1422509-1-jani.nikula@intel.com>
 <20230406134615.1422509-2-jani.nikula@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20230406134615.1422509-2-jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0206.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::17) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DS0PR11MB7630:EE_
X-MS-Office365-Filtering-Correlation-Id: 01db7127-92e9-48d2-0afc-08db419d3463
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kb1WtkB46n06VRUamXmLwj0f5GRZK3D+9ARzIUhMOM6jVicU4+Oy0zj6XmESyQn5VPFRFwit5yOhokbPcJ3dwQ0lc7OfOsySbxjwdE3suUN49DY/ySoMyUQZ4QFLB77TCk5snZ+2x6SLF96mjunqVK+sLFInNGNa7Isb/jTnG9YAk9jCF0yzU0FGmTleYAg2/XvEIZ2k4860xfQGPJ6lHs0XMEOBK9qjrtX2EXuxQee5YRMfhKtnanHJX7DCHra+ng8iGssgN46b0llxVLMRxWdJKTRSYNeZDUNj9nn+/yVfOrT+5eJJBKObKLuGTxGW6wRZHzZszePf5RPiC/AEE3Kuwb2jRqJXRr33ROjshOthfTY2eNC6DOfYvDidrQjeVF36YY1sLeaG1QDI0Wsox4FfikRE+OLSSAnwIBhCrJQEDH83g1tIaVjAhgwethsCrLFCWyXoKb2VrOxQWqoUQQ1hqGBypJ+2r38I9cBijm4PWY1Mi6RHXorYLkhPGvFVrsN6FkMr/7g/+8NLRX4/UUcxxj9v9TdJZLKJ+YFV36V6/pf3ndFj/BhRiDW+sYByAlTXboYvy5LiJifvTAe7FBmkAIOwp+bLv+nfnBEkeXyHjh8NF2YDs19CP0siSn2hxloJEgtXEwHEzQZJ4rdmRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199021)(31686004)(83380400001)(86362001)(2616005)(107886003)(55236004)(53546011)(6506007)(26005)(6512007)(36756003)(6486002)(478600001)(54906003)(31696002)(6666004)(450100002)(4326008)(66946007)(66556008)(66476007)(82960400001)(41300700001)(316002)(8936002)(8676002)(38100700002)(186003)(2906002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFVpd0tlZkR1Z0hsZS9RaCsycXlkc1gvRGpGUUpadGFucENPR1B2UElsV0Ra?=
 =?utf-8?B?ZFlSeWg1TTJ5eVhQOU5hWGxXbmRxVGpZVnM3d1FKQTUzVldMRGZmbTRFK3B0?=
 =?utf-8?B?VllyQlpjTFBOK0o4ekdvQlpmcHJ4N1VZY3ppYklvWldMeUlSSkJzQWFVbWJS?=
 =?utf-8?B?dnZGWis1dDgzNVBHZDdOLzlWTVNEWHJkWUJ4MmM5WXpsc0dQaU0vU3JNejZq?=
 =?utf-8?B?MkN5ekZMTTExbkhxMVlla25WVHdWMWFTRm1NU21TQlEyd1VtdWgwVk1VNklQ?=
 =?utf-8?B?UkdjNTRrK1l4dm9iaGZ5eGVPNzFqeDBYMnllcXZDLzhrcUdvTlFINnpTa1hE?=
 =?utf-8?B?aWhhUDdxTnJJMWRHWG1RcVBqSmhWMkV6SmpJR2NqbW1LS0Z3cVZSQkdHUy9Z?=
 =?utf-8?B?alZFWVJjRWE0UkpVdU9RVmdLNWJaYmc3eDV6Y2h1dlRwYTg1L01jNkZhVW5E?=
 =?utf-8?B?OTFST1dVaEZBZ2pvem1Ld2pCaDdiZ3Jtd0VYVmFqTmJZam9tWmVPeENCdDVR?=
 =?utf-8?B?ZlFqc3JhSEp1b0llOWFjZHJuUW45Q2VqQ2plR0puN00xRUlSU2o5VjRTb3V3?=
 =?utf-8?B?WW1vV1RvNEk2WmlKMEtzaXBQd0h5YTZCVVlDSjJlalV6bVE1SEVvMDNvUEE5?=
 =?utf-8?B?REx3MmVGZ1VCaTNYY2V6TU1ybVN6a25oc3hpemRhcHVXaDBzOUJJUDh5MzNB?=
 =?utf-8?B?NTRLY3RJSFovK0RVR2pscWd0TDJqZ2xUZ2VPZFd6aUlDQmpKcVVhM3NLTVJH?=
 =?utf-8?B?TW9xdjZNa1ZrZGFNenNzRWVlSy9vTjRsNllId215YnBJOGltNGMvN28yNjE5?=
 =?utf-8?B?cUlUdHFJT1ZMc2VVS0ZsdFdSenZWKy93OXN5VjZUZlRYMkhaTnIvSmlXQVVo?=
 =?utf-8?B?cWdRdVFmK2xrZks0V0NQeDFjZ2E4cjgzUEtLOE1veS9ERGRWOGNrUlQ5aTFk?=
 =?utf-8?B?OTJ4YUFpWEoxU2k0S3lvZExldjdRak1uZU4yZDkyR3poVVJrakRubi9DQW1U?=
 =?utf-8?B?UTFvZFFZWXZEV0JWcXpiNDE1UkJhTTBnSWo2V3RmVGpQTG1rMlpFYVBqOEV3?=
 =?utf-8?B?WTh1eFlmdFRuUmxQTG8zN1NNWXZDeStnaUt6TThsSHg3UXAyakhrU3IwL0Jv?=
 =?utf-8?B?M0ZBMmhnWVhCSEhZZUp0VjRETnVaQ3BUZlc5d1Z6cUpJMlg4RDY1Um5kVzdp?=
 =?utf-8?B?N3NEK2xQakdxZy9hcmR1d1lEVlVTQ0lBbHJDa3BzSHAzUUxjcSs5U0k2Y0Uz?=
 =?utf-8?B?L3VpbENiT2xqbnNSbjZZR1FBRzZlL1h6TERPVkVhcGYxT3BlenBnWEk1QTA5?=
 =?utf-8?B?VnFyT0FuS2FsV2YzNFQ0YWFwUitPRStXYlhZaG8xdjR0elkyN0wzVVltYUdl?=
 =?utf-8?B?RzhIZXlYV09LeHphdm9WMWVldnJ5enl4M3hKVndvNUNWS3BYZEFwQTdZTWxy?=
 =?utf-8?B?MWR4VnFoTUduTmdKZjFqVjZnTTYvZDdMamVYVmpVZ09VaS9lOFA3eXIyaGFD?=
 =?utf-8?B?SDQ1ZjhrNTExTjNZRzUxVnM4ZENIYnFTcUszQTBlOG9JWSsyM0tQc29HUHJI?=
 =?utf-8?B?UHVzbTRpVmg5bU4wMHVSbjZPN3VZQVlOT0lIdWtmQVkxSzNJVW5nV2ZCWmQw?=
 =?utf-8?B?ZVhEaEpvSi80NmtQUERpZGpPWVJYakRRblpTTG1FcHdiTnRScWNqZEk3R1dl?=
 =?utf-8?B?aDY3dkx4OE1vT0hDVWwzYjRKbk9BTUVGYVh6WEdHWmV1RUNLOS9pYmJKY2lD?=
 =?utf-8?B?OGdlYWt6YlZVTHRwejRNQ2NGR2RETGhjaENWSmtWbjQvWVFFUGpBTmt5d0xC?=
 =?utf-8?B?YythZ3E2Wlk1RWxzSXQ0bERvcEpCejA1Mmg3QzByR1lHbGt6MEVzcWpGZlYv?=
 =?utf-8?B?a0dxYjBOTDd6SU5vc1gvTFFoelk2ZStTMHVxY25LajhHVWo0NmJzOE5TbHNq?=
 =?utf-8?B?bkxpZmVjdjJPc1BuWVNyME84UUc0RyticVRWNkJlU2t6Z3FSYWFlTkt3ZzBV?=
 =?utf-8?B?L3lyUGI5RG1wanNzLzZXNlpCUFJoSFhxRVhvbzNPYjlzTjNPZ1lZd0FpdGYy?=
 =?utf-8?B?QVRKd2dpdEUzN3VLY21HY1RLbmVXM3hEZkY1aHlydWEzek4xaXlwSmZXZ0x3?=
 =?utf-8?B?M29YRnpxVTg0MVlOOGtzYkdlR0FPSVdiRjdWN3ozczJWT0dTdk1vc3RkVG5X?=
 =?utf-8?B?REE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01db7127-92e9-48d2-0afc-08db419d3463
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 12:46:05.1491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HAgAJA2itGb+ajO1S42Ig3ZmQmM26ERfxi+Vy9Ymh51n8+cEBTiJCv34+4T/4SYx7hg2Jn6oEkirye3r14NbYq4MCH/peEWkmFbl/25hFN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7630
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
Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 intel-gfx@lists.freedesktop.org,
 Vinod Govindapillai <vinod.govindapillai@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

On 4/6/2023 7:16 PM, Jani Nikula wrote:
> The macro values just don't match the specs. Fix them.
>
> Fixes: 1482ec00be4a ("drm: Add missing DP DSC extended capability definitions.")
> Cc: Vinod Govindapillai <vinod.govindapillai@intel.com>
> Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   include/drm/display/drm_dp.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index 89d5a700b04d..f8813c1e059b 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -286,8 +286,8 @@
>   
>   #define DP_DSC_MAX_BITS_PER_PIXEL_HI        0x068   /* eDP 1.4 */
>   # define DP_DSC_MAX_BITS_PER_PIXEL_HI_MASK  (0x3 << 0)
> -# define DP_DSC_MAX_BPP_DELTA_VERSION_MASK  0x06
> -# define DP_DSC_MAX_BPP_DELTA_AVAILABILITY  0x08
> +# define DP_DSC_MAX_BPP_DELTA_VERSION_MASK  (0x3 << 5)	/* eDP 1.5 & DP 2.0 */
> +# define DP_DSC_MAX_BPP_DELTA_AVAILABILITY  (1 << 7)	/* eDP 1.5 & DP 2.0 */
>   
>   #define DP_DSC_DEC_COLOR_FORMAT_CAP         0x069
>   # define DP_DSC_RGB                         (1 << 0)
