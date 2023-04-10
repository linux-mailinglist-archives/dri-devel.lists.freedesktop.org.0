Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 846076DC9EF
	for <lists+dri-devel@lfdr.de>; Mon, 10 Apr 2023 19:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E3D010E1CB;
	Mon, 10 Apr 2023 17:22:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D95310E1CB;
 Mon, 10 Apr 2023 17:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681147351; x=1712683351;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S1/7GXt9bc/iKdPoNTpF/s9fiJSseC7EOdNzhW2un10=;
 b=a/UkPoQ9lF269hrXmBocOaXfgT2+3xIW95oLhAAKEZHZMFSLartpfpnW
 ic7C8uFEjNQDQJq27MDYOLoZb9X8h3ipGVmHtXGpjmsyKK35N5R/P/Wh4
 xuzy1nH7YX/ZAlLQJ7C/hDntMtCdq56Sf3EwZKAwjwAIbRHML9uX6Zr5v
 WfOHi6Z96Pgr+eQ8F6fq9CGIH0fZr8KRTe8E4vNR5MxbaEiN6olPCBnMK
 GUjLYPQMv9ADtoDS4l56XmY8xnSRDRTspVDmDbJgsvoR4DU5FncQcqmb0
 R4r1+NK20Xrhy5DN5Qgi/0Qc93F+KQxpTjZUutqeSmwoyTMN9oHO+C/ra Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="342174911"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="342174911"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 10:22:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="681786020"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="681786020"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 10 Apr 2023 10:22:29 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 10:22:29 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 10:22:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 10 Apr 2023 10:22:29 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 10 Apr 2023 10:22:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZ1CXGNceRB02pSB4lQ6dd6lLMx68tytMm9fax+WQ+qk0AufCdySrjgpft8ZqIvhKdfAYx3oXM4hZRJlPrRcyYfiYIlDztF5cVffZLc6jCQEWdX9tiexRSKi09hNkBkdzQnxcnhLgA9VGszbmhSo4txwoO7MbSkUsVqSiC2fDr5YWcZgSvTHgNf4UH5eCYtg0mMnUwlh8fvnL1CR2vStIQOpirh+XP975mEB+OkozPtK72pNDqe0NSHbaH3Uuzo021ybzrI6Vz6ukTd68sSXyUV47BtUOmZXek70NA+LZGSRW8s7eqFNIDfjcZPILUzb7iaw/6vNlpfzwmznmbPFDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ygsDPC9W98xwcYm0SoH//BubWk5jxenWqUD6H+Jxy6E=;
 b=eUSvXOcagjpcoR1Qt82InxyhbeozuIv8OCBg/BW6fvOCDhVxyabEV3YdIjdfeHAgEejDc5Z8nGAGAc8taGBFtG10V+DSpWZFrTnUhlKG658TFZaZUufcQeHWPpJOKgyBFUKTkprBQOH8i28A4ByiwAewev5rxg0t6XJHyVP8AgKFSoZ++AvYGnn9YNpXtWjLRA8SPzBhOVmPNfgGdWidnhWut3JG4fQqYOiyChJmZYkDVzk3xlvCeg7GU05g+pLy6Gxk9bntu32kFSqf2ky+7Sxz84l+r3uL7jw245CrJp62jAfPea19Ilf033M7WhEUB4beLIWjgFa+/4AOd5q/MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.36; Mon, 10 Apr 2023 17:22:27 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0%7]) with mapi id 15.20.6254.035; Mon, 10 Apr 2023
 17:22:26 +0000
Message-ID: <35d5f2da-115e-5873-1e3e-ba4db16537eb@intel.com>
Date: Mon, 10 Apr 2023 10:22:23 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v7 6/8] drm/i915/uapi/pxp: Fix UAPI spec comments and add
 GET_PARAM for PXP
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230406174419.471256-1-alan.previn.teres.alexis@intel.com>
 <20230406174419.471256-7-alan.previn.teres.alexis@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230406174419.471256-7-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0057.namprd02.prod.outlook.com
 (2603:10b6:a03:54::34) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|MN0PR11MB6278:EE_
X-MS-Office365-Filtering-Correlation-Id: 9abd9a5e-e1d0-4538-32a2-08db39e827b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lSZ6QURR6dH/jbAxGqcGMa1yTi01gBZwOctAhLyQe61ArKgDiHyG3cRguf2gjCBTOVzrYpzyzC/zsItwHmLAKJkhqPhKlO+HMDNG29tGAPYu/DPGGnBjoiGjmD7B4QHcusZLHgDfCwmjZJrGGSE/WwnnQEo/PfZavAhiNaNT70unnbLN49As2+9+QFBjClgVNu070fzJBUE0wZbY2XbvG35GIJ4Z0C8+AU6nJzcUshwdDQ1Vb99zV5qL/l0q7fThN/ylbMAQx4GQtT+GVJTNp0wRzA3f5bUwE9dtxaPnTV53OtYD+OnIPB01S9JuKdNk4n/nlghTmVuNjv3YNLrMjnU8jXtGDN42Gh4bk2nqDcgBD2Pq5nRVUbQeBBiAWbEybUn80wgHmuSx61E2TPWpcfABeOIXhNltJD+l9U1xciSdZn24ZX6kGEYj8uRMkF37xD2GN4iigKw4rIadd6kOj4oj7cKsncI7EYAtst6zkWTDoiDdJMfVQTyndBfGFZn2PVPjaUFa2FcJ/ra0RRiR+TigMc5d7IsIjoZ6OF1fOZP5m9KYxd4nCJkn8bpsIKK+YnLXhzB39aG+173eZI5bLHJVFKeNjneQCmFcVDdI3IoSHoCY5yDV3dJgJzgb+kUbr/h+D6QjM0fcuxQAgSzh0g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(136003)(396003)(39860400002)(346002)(451199021)(36756003)(2906002)(38100700002)(5660300002)(8936002)(8676002)(86362001)(31696002)(6486002)(6666004)(107886003)(6506007)(6512007)(26005)(54906003)(478600001)(2616005)(83380400001)(186003)(53546011)(31686004)(66946007)(82960400001)(41300700001)(66556008)(66476007)(4326008)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzZPcThuZi91bjhZY1pXTDBnR1BkUGZMZ2VEc0pkeENxelZjekt5dEg2Wm9R?=
 =?utf-8?B?ekhaek8xNDhqQ3F2bUhac0RmTmxyNTdwQ04zNW5iT3hRa1RySlkvdmVZUkRV?=
 =?utf-8?B?VnBIZm55VGF6a1RqVUVLRWU5Vm9IUks5UDZ0bmxZSW5jRXRZc3AvS1dCdmtl?=
 =?utf-8?B?SnV6MzBOOE4rNDJ0WUFycXFENW1td0tzWlhkd0h5MzcvVmNlLzgxZmp6a3B1?=
 =?utf-8?B?cHU3dUp6UTBNVkVWR1VBSXc3Y2FPVnV4K1hpSUJFOTBRMHFPdGorR1hsdWFR?=
 =?utf-8?B?RFpybkRkNnNNQm04UUZKMUtUV1dCOEswR2pvTFlvZ0Nma3lWb2ZLS3lXZDV4?=
 =?utf-8?B?M1hLdy82WDJScCtBbGlCeGdJR0lYWFQ0Qk9OQ0dmZHRpSmJmOUV4Mkx2cnlt?=
 =?utf-8?B?WGdDZnRMOUxHZENGNXdjVlBBcU13M0R4R240VUQrUXpuTHo5eUM0NjVFNmZk?=
 =?utf-8?B?Q3A0eG1oZ0ovcGRrS25yS0djUDNoSHphQ1M5cEgwN0RITjB4UElhdWpwek9t?=
 =?utf-8?B?Q1VDTUdLenNKd0dVWXpwSlBHN0hTY1ZkVWl4SGxFWDdNc0FUTTdFMFNDTzA4?=
 =?utf-8?B?QThza2ZoUEIvejUvSXVwK2VHZmZKdnBYajFDZjA2eVFpcElUV0J6V0lQMXBy?=
 =?utf-8?B?ODk3dGtzZlFhTXlkdVNMb2tzeUhxZjRkTVZ3SlF6RDZKUWEvSzFaa0lFeVIv?=
 =?utf-8?B?UWFkZFBnK05TaUFjVVNiZ2NOVytKaDc4MFVTcFZaZXBmMUhrQ1Z3dzBqOTh2?=
 =?utf-8?B?eWMwSkNrVVBwdDR0TW4xaUJ6ZWIvcW1mSFIyS0ZxaUkwckU0N0ZHQ2pmdE8z?=
 =?utf-8?B?cDJmbStOcFNxaW1sc3AzcXI3WDdic09VRnBBdjI2SWFCN1cyMlRRZytDVVN5?=
 =?utf-8?B?eWJIcHhoV0M0eTF4R3pablZBbXNST2NmZjJDTlZqS3I5d1JYRWJYQml2NlBF?=
 =?utf-8?B?WWJaRVVHMTZyK09nek9IaXFUWk9uQUExbmsrUmZnKzRpTElXUkZUZU1oR25Y?=
 =?utf-8?B?STBxMkJHWUZPNFhwMjFnOGltNWtORkw0YzZiSUhxakJuYndOQTV0Q0hUVGRq?=
 =?utf-8?B?L3lXZ0dFQm1VV3FZSFZIMmV3S1lNZHRPL05DZ0pWbjBQRm5XRTNaYXhHNEgv?=
 =?utf-8?B?VUw3YVZOQ1VBZUFySkk4eld0NW9PSW9mWjVRcGFvWWJZVmRPRUNsU3lMOWpk?=
 =?utf-8?B?RFdtS3RlaDFkNG1YckU4bTRqSXVmcDhzeDcrYW0vV1pJamRNQ3l2MCtGeHZT?=
 =?utf-8?B?cHhnYWczRVJ6SGlpdUgwcDZ3OFpLL3NhT3ByZm1vS3FuSXBWeDNTM1pMNG1V?=
 =?utf-8?B?dml6M0ErNm1hU3pHdi9FUkQ3L05XV3BSN1JhOEJxaWtTVVVnaGFjS2NOYnJ6?=
 =?utf-8?B?VnYvaEp4dVBEeDhnSWZTWldibTV5NUFORjJyeWJqclFyZkIyK0tVYTY4OUpX?=
 =?utf-8?B?Y1ZsaTl4MiszODFqSjAzTFpnR0xzTXNHV0Q2SnpVSlZieFpjV0FDSTBnS2lM?=
 =?utf-8?B?S2hpNEk1eUJEQWhYWmZOdi9DNzZXdXVzeldMZUNRb2U4TEFITnloVTVBVkda?=
 =?utf-8?B?TGYyM3F1d3g0M1BHRTJVUUFMOWZaTklCczJRbXRMb0ZvZlhtVnd0cTNFNVNj?=
 =?utf-8?B?STN0UUVrS29wcndxYWswT0d4eTFiZXRTTWY2cE5TQ2pCVHBCUmRoc1lKNXZ5?=
 =?utf-8?B?SUlXQ24rVjJUTmV2Mmh1UXJhL3lJcGIwZFBMVXk4aERRZkZ6VUE0bFhrZXMx?=
 =?utf-8?B?KzlDamZnQnh4alBHQ3NGT21VVzh5aG5UdGpiMmw1SU5tdldBOUhUelAraUly?=
 =?utf-8?B?ZnFINld4RVplZ3BGMWp5cW9oNVMxaHQ2MGphcDJHTm5NYTl4VUxITWpxMVg0?=
 =?utf-8?B?YmNvY3NRSmZYdUwyczJ3RzJsKzhJdGllSDZlRFYzNDdFU1AzVkp6T1BmVVZj?=
 =?utf-8?B?NThVYWlvdXNuTkduYTZOb01MSy9lOUJoMjFYZXova1FDWUpNT2JvK0I3SVJn?=
 =?utf-8?B?SzN4aGU3SUh0UVlPNm9NTXF4d1hZdDlZcGpZWXJLbHhEM3FzTVNIQkRzUzF1?=
 =?utf-8?B?RVhsMXU5bU9SVllVQkk1Z0lYN1BrUjVOendMZGtyWUpQRTkvL01GY0dQdTJ6?=
 =?utf-8?B?WXM3MDJSRENoUGxQazJrRUs5N3hEbmNpbVI0NmVla01qQ1pHMnEyVU4xUzlU?=
 =?utf-8?Q?g3/XRFhdDafpj209hNHxqLg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9abd9a5e-e1d0-4538-32a2-08db39e827b5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2023 17:22:26.6847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UtJHhDwbBxQC7FWKqfmkbz7ccHcpm3nAgO+0kTL9WsWJtvg5KvOVj85L/N1S59hj59hg7B46qylDSdMl5EVa+ZaGEdxe5ZqzpVsHG22GTMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6278
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
Cc: Juston Li <justonli@chromium.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/6/2023 10:44 AM, Alan Previn wrote:
> 1. UAPI update:
> Without actually changing backward compatible behavior, update
> i915's drm-uapi comments that describe the possible error values
> when creating a context with I915_CONTEXT_PARAM_PROTECTED_CONTENT.
> Since the first merge of PXP support on ADL, i915 returns
> -ENXIO if a dependency such as firmware or component driver
> was yet to be loaded or returns -EIO if the creation attempt
> failed when requested by the PXP firmware (specific firmware
> error responses are reported in dmesg).
>
> 2. GET_PARAM for PXP:
> Because of the additional firmware, component-driver and
> initialization depedencies required on MTL platform before a
> PXP context can be created, UMD calling for PXP creation as a
> way to get-caps can take a long time. An actual real world
> customer stack has seen this happen in the 4-to-8 second range
> after the kernel starts (which sees MESA's init appear in the
> middle of this range as the compositor comes up). To avoid
> unncessary delays experienced by the UMD for get-caps purposes,
> add a GET_PARAM for I915_PARAM_PXP_SUPPORT.
>
> However, some failures can still occur after all the depedencies
> are met (such as firmware init flow failure, bios configurations
> or SOC fusing not allowing PXP enablement). Those scenarios will
> only be known to user space when it attempts creating a PXP context.
>
> With this change, large delays are only met by user-space procsses
> that explicitly need to create a PXP context and boot very early.
> There is no way to avoid this today.
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_getparam.c |  5 +++++
>   include/uapi/drm/i915_drm.h          | 22 ++++++++++++++++++++++
>   2 files changed, 27 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
> index 2238e096c957..9729384f033f 100644
> --- a/drivers/gpu/drm/i915/i915_getparam.c
> +++ b/drivers/gpu/drm/i915/i915_getparam.c
> @@ -5,6 +5,8 @@
>   #include "gem/i915_gem_mman.h"
>   #include "gt/intel_engine_user.h"
>   
> +#include "pxp/intel_pxp.h"
> +
>   #include "i915_cmd_parser.h"
>   #include "i915_drv.h"
>   #include "i915_getparam.h"
> @@ -102,6 +104,9 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
>   		if (value < 0)
>   			return value;
>   		break;
> +	case I915_PARAM_PXP_STATUS:
> +		value = intel_pxp_is_enabled(i915->pxp) ? 0 : -ENODEV;
> +		break;
>   	case I915_PARAM_MMAP_GTT_VERSION:
>   		/* Though we've started our numbering from 1, and so class all
>   		 * earlier versions as 0, in effect their value is undefined as
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index dba7c5a5b25e..0c1729bd911d 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -771,6 +771,20 @@ typedef struct drm_i915_irq_wait {
>    */
>   #define I915_PARAM_OA_TIMESTAMP_FREQUENCY 57
>   
> +/*
> + * Query the status of PXP support in i915.
> + *
> + * The query can fail in the following scenarios with the listed error codes:
> + *  -ENODEV = PXP support is not available on the GPU device or in the kernel
> + *            due to missing component drivers or kernel configs.
> + * If the IOCTL is successful, the returned parameter will be set to one of the
> + * following values:
> + *   0 = PXP support maybe available but underlying SOC fusing, BIOS or firmware
> + *       configuration is unknown and a PXP-context-creation would be required
> + *       for final verification of feature availibility.

Would it be useful to add:

1 = PXP support is available

And start returning that after we've successfully created our first 
session? Not sure if userspace would use this though, since they still 
need to handle the 0 case anyway.
I'm also ok with this patch as-is, as long as you get an ack from the 
userspace drivers for this interface behavior:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> + */
> +#define I915_PARAM_PXP_STATUS		 58
> +
>   /* Must be kept compact -- no holes and well documented */
>   
>   /**
> @@ -2096,6 +2110,14 @@ struct drm_i915_gem_context_param {
>    *
>    * -ENODEV: feature not available
>    * -EPERM: trying to mark a recoverable or not bannable context as protected
> + * -ENXIO: A dependency such as a component driver or firmware is not yet
> + *         loaded and user space may attempt again. Depending on the device
> + *         this error may be reported if the protected context creation is
> + *         attempted very early from kernel start (numbers vary depending on
> + *         system and kernel config):
> + *            - ADL/RPL: up to 3 seconds
> + *            - MTL: up to 8 seconds
> + * -EIO: The firmware did not succeed in creating the protected context.
>    */
>   #define I915_CONTEXT_PARAM_PROTECTED_CONTENT    0xd
>   /* Must be kept compact -- no holes and well documented */

