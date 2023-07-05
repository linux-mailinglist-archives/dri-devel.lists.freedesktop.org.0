Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 375C97490C7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 00:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA44F10E3C5;
	Wed,  5 Jul 2023 22:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDD710E18A;
 Wed,  5 Jul 2023 22:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688594518; x=1720130518;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=n87SErP4RS/DuWcRtUtQYSQ8WAqoQ5e63qJat5TbiGE=;
 b=X+wo2Hv0gJOMuUwW/1PCFjiT04U2uTvFssn/x0T8SPY8YPb5D4riffgt
 PNGkw1Rx/z+/IiouIfQViT9x9jhLq3H37LrxG+0iqwH0Ga+WWQv+lR5He
 jiHRwVlJBSyCI58RT/DYSlGs9cIGg+ZNO7IpEDnn9LhL4ZlEuN/I2LFak
 KB/KHmqOQSmRAIF+vD+H55pVgyKaVJkZ2TrzW9LYAC6AxSCIuuTf/M3st
 0PYj1d9IEuiAr4X4JXu567g5VVLk2CJ+1FDQIqbumWTH2/uVwyxRaPAtg
 kyaC4EgL/U+yHRr9LMfo2Xw+s1TlVRbJn2O6i/ks+UfyOGjpJDtzG0snY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="360926111"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="360926111"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 15:01:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="809401733"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="809401733"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 05 Jul 2023 15:01:14 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 5 Jul 2023 15:01:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 5 Jul 2023 15:01:14 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 5 Jul 2023 15:01:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSyKtPtW+QdRVcsNAJkmilOUzpEw2VC0tTmW5DjC/k7O0PBVdpckcgLsBIeTIy5GAivBsezq0oOB+DgaLY8Tvyic9rCprpTRI/8wbOaNZv1jq7Y4eBQYhFoQI+sOZgjsQo4Ufxo3KW0wTbhy+cvByUVB9d6rUa/rhHG2kKWVpoxl5Ee7zpKHJIlevjXu7MgfPCh1t1wbTQhq1IbKv0rdWAm3i9vE9h/rHfe5ZfjYvJ1zo6r0Wq2KEmNBkoDXzOOjpoB0fBkLF8B74BmU54cQ3sgpRqCj0+uroGlqvqqcfCa0H3MmDPkpCGFsJaHVRWbPds2YccbUvuHa2d1r7TxL+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHXZyzSHi8LtberYX+n0tXrFApLT8Zf/QOMX3UKi9aI=;
 b=JxA3FOJfDVpBhxUp8vgwbfriBRyKI0LVuntuFOYqouUnThX++rs356nQr/byppQHSbHK82jM9YxJo/Km1JF94w6sXYZBS/I0/zsfwcHchN2GvTeKauzTkhuCvy0bvPtKcxj5el/kxqJItQk7hz8U1j1+i/tqsWjTEgXSIwwsikl760ySVFkGd7urp/UZmMQ6nb1FgCQ/UrZxGo/A9AlKRqve3/GgxQJHk4wTxp5nq7E/a0ZQTmW5PsFKyA2fE7pe3HpwzXupF+i4MSlOQGddRGot0LfKd8u1UnvY2H+xwzqPbo2vrNlhFZgbQOCF66W7iZb6wiPri7Y5C7kLubJhgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3398.namprd11.prod.outlook.com (2603:10b6:a03:19::19)
 by MW3PR11MB4649.namprd11.prod.outlook.com (2603:10b6:303:5b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 22:01:05 +0000
Received: from BYAPR11MB3398.namprd11.prod.outlook.com
 ([fe80::c504:1864:9eed:136f]) by BYAPR11MB3398.namprd11.prod.outlook.com
 ([fe80::c504:1864:9eed:136f%7]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 22:01:05 +0000
Message-ID: <0c0eeec8-c526-0b78-06aa-e38af462610b@intel.com>
Date: Wed, 5 Jul 2023 15:01:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3] drm/i915/pxp: Optimize GET_PARAM:PXP_STATUS
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230630014412.1360180-1-alan.previn.teres.alexis@intel.com>
From: "Balasubrawmanian, Vivaik" <vivaik.balasubrawmanian@intel.com>
In-Reply-To: <20230630014412.1360180-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0001.namprd21.prod.outlook.com
 (2603:10b6:a03:114::11) To BYAPR11MB3398.namprd11.prod.outlook.com
 (2603:10b6:a03:19::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3398:EE_|MW3PR11MB4649:EE_
X-MS-Office365-Filtering-Correlation-Id: e7f10216-a7bf-49d8-9589-08db7da3544a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1mOuP4IFXTSCvRZvkhW5Yd5khzEwwbIhzUiAhz/u/hzEj8QjGPtifRPq3Jkm/b17daFVHeayRO1ctFHFsh08t9hhwlfkpXnJn+RVD5KTPo/iw2gsYbGiNlLh30TYMZ7DI8T6p/x8bJvPERE2B29qjb9ZUZkrwtXkx4uY/Yr4J+yjDPBjMXuPCpATZBB0MBssisSxG7O9IL39Dud9YPDtwA3QyXZau4IRr8ulme8fIhzQNrJ1ZqUkoPldXb2lvoSjQiJxkX1OQ9xagkS0NSldFujZqJi0b9ktGRopoZpKntHZ5Jnw+83aE2iAxRIgsIB0Z1iAu8Xsxi4fv83EKdKgO+PVF9zbH7/KRm55KlF+VPQiLDS0G0fiMOiIprhYK1oo6K5xro9/3DlGeoXAaZjN6+bSasuwrljvXyRBrHID0ZOK5xRc7CyAZxan9yPMrH/wY8js75Eg0Z+qUWrhCgZ9N6SALkTCRYKDI889+eGQlFRtsAdGZAmfOJEa0TCcwWX2e1eHEqPoo+AF6tT8MbnJvi6RAs+C/D1kDAALRIp7kPx6SOPeuIWfarBQ6tSFzlr4AlyGf1XO9+Psq43esMDaevIMONC6VW7fRBJP1MNBu5nS9z1F99p4Zao9ZkodQ7c6GefOfD1lO0T3nuXLoxuA7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3398.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(366004)(376002)(136003)(346002)(451199021)(36756003)(31686004)(31696002)(30864003)(86362001)(2906002)(5660300002)(6512007)(186003)(83380400001)(53546011)(26005)(6506007)(107886003)(450100002)(66946007)(6486002)(82960400001)(54906003)(66556008)(316002)(8676002)(4326008)(38100700002)(2616005)(66476007)(8936002)(478600001)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U292T1laVnhyTGVmd3lHb1BmZGYzSHdyK0prSkM2blordFhlVnFHbm1YMmxj?=
 =?utf-8?B?MGJWT0dVdCtPVFJyZEE3WnpQQnBmTUZSYk1GMTFLSDFxQmpwVFNmQ2RaRWth?=
 =?utf-8?B?eVltUWp2QmNRbXpHRlJCVlFKKytsOHBIU3Q4Z2h5OUMwdzlLTFBQRjlLZXVR?=
 =?utf-8?B?cDQzWmRlVUk4b2dPT2VDMUtrNGtLR0NQNUJHcjRLM1Q2SjlYYkpPMHJPcFNp?=
 =?utf-8?B?aG9PTlRSRG4wc3JBQ09KTzNEeG11V2hOVXV6WW40azhsOUJwUk9jeDZzL0Uv?=
 =?utf-8?B?WVh0R2ZoSjRrb0lrTEJLRW93L0lsS1Z5TTVWYlRMclRLTHlucjZqaGx6bFJW?=
 =?utf-8?B?UTdjTVAwT0JpRlhiME05aVFyWlM2ZlQ5M0R1WGwwbFIxaTQyeVUvNUgzOUNC?=
 =?utf-8?B?K1VkMzZLZkFtUktpaW05bzVlWk8vQnpWa3FHcVhwYTBlbUl4Q1lPTk1LWHAw?=
 =?utf-8?B?TjZCaERpM29DN0NuT3RWQVNmWCtRY09UYlUzTENsaFMzelhnUzZiT081d1RP?=
 =?utf-8?B?STZKRE9CVHNpb0VKNGNKdCtEMnVTN2JMN1RnUWRHUjdZalZ1VVdXT1ljanZU?=
 =?utf-8?B?SGxGS1NnaWhBV0ZnR0RtUTlvbS9XeFAxQ1hhUmQ3dEdzaVBEak4vVVB2MHNq?=
 =?utf-8?B?b0dEd3QyanpCVk1xUUxIVFRia3RmaUhkSVdyZUlFb0kvajF0cFl1N25mdjZO?=
 =?utf-8?B?TXU1RFA2cEFIbkswQlYwODY1UUhaVGFuNlFuaGFZMmI1T2hNeUlYSnNodS8w?=
 =?utf-8?B?c083cXU0QXVMa3BkRHNWcWsreTB2azd4b0FzMnIrZTR4NVpWckllQjkyK2xB?=
 =?utf-8?B?a2dGajBnTlJRSzNCa3UxUUtKSndYTjIrSWsxbEZXNTYwRGw1VGc4VFVWQkNu?=
 =?utf-8?B?ZUtLQVQrcEQ5a1FaMkx2dDE4K1BhRDVmSzZTQlFxZnBPbUw4M3l3Tks1U29a?=
 =?utf-8?B?cVVZdkFPQU8wb1ZaV3pBcUFjUEdTUVhMT0JHTmU2aDJ6aXZJT0dnNHlhYTVl?=
 =?utf-8?B?TTlSVFhFMERNc28wZWpUcEYxZzNDcGNXdXhFajB2UnoyODVjOHlxLzZCYkV5?=
 =?utf-8?B?eUk0bWh2TTFsWSt0aVJ5WVY2ZlRUQnd4K2RsanBNRWIyWm1ieGhrRnhhajhP?=
 =?utf-8?B?Ny9hS0FrMjN1amNwQ2FLVmlqQmNNMjlSLzdUcVNheFB3K1o2ZitVdlY3RXNw?=
 =?utf-8?B?ZjZnNFA4UUR6RE9zbEVPWldESFo1QVFZTzU5SytuZ0h1ZEJjalJrbXgwQ2Nh?=
 =?utf-8?B?K0k5UkNiajY3aUVHUFJKQU9uUnlMVDdpUWJjdStlRHlaS1pYMU9PTWJXbk9T?=
 =?utf-8?B?SnFjcHlSZ2VzR1dmZDV6bm5lQ3NZYkMzVWsyQ0ZtQmNuMHhibVZwbjZ0UURx?=
 =?utf-8?B?dEJlcHpXQ2hpbmk2aUZxZzhzaG0vdmxuTFRYb29QMVdMQjRUWWlTYTNXbGdl?=
 =?utf-8?B?S3NiSFVXa1J2VFhkWkFKV255Wm1sdzcvOEJhd3BvTzBBREFzMGJDUHMveEwx?=
 =?utf-8?B?QnVaaG5kMXpyeVBuTGRwWFdoUGRlZXlUcWRqbmQvTFExYlVQVHhudW1xci95?=
 =?utf-8?B?bHN1cjd4aDMzSDlXcEFodWYwRFlqdzR0OGdoelZKRkdxL3JTejc0bDFNZHJ4?=
 =?utf-8?B?LzBZS2xPN1J2c1k0cWlyc05aTk5xbnRpTTllTmFtbjdnVEhqKytzZTU5SGZW?=
 =?utf-8?B?bjhvWm9DU0hIQ2IvVjUrVE9LT2psK04wZ2Z5bmlnQ0NGeU1tdkNDdzRFNVJG?=
 =?utf-8?B?NXBWK2JvbXRZbFVSYmJOd0o5STF2elRCUno2MklUNFhqVVcvdVBtZk82VTI2?=
 =?utf-8?B?WE1zNFV2NTM1R3VYL1B2b2lqYWxkbWoyaENBZ2FsQzZ6cW94YWJOS0hXVU4z?=
 =?utf-8?B?Y1F1alhRci9FTVNGZjNuc01ENnd0Z0YyZ1VRNzk5elkwQnhvekZEbGdXMkd4?=
 =?utf-8?B?ckRxcm43SGdWUFRkODRQNkpmb3ptUlhYUWVGWmkxbUQrdTg5c08wSWJUUmEx?=
 =?utf-8?B?c3pYMjlKdm9TNittRWFMaFpvb1k1MmlIWkRLTk5UaVc5VUo1Z1RDamlhOFV0?=
 =?utf-8?B?eUdEVG0za0UyY3dqU3VDMzRVR1R0c0doNWQyazU1M21tY3RsYzI2N2kvUW1n?=
 =?utf-8?B?QTlucWNiREtXMVQxTEtvc3Jvd0xKdktxVXd1bkJDRHUzNWhka3RpZTc1ejJU?=
 =?utf-8?Q?xyipzN+QH7oKmmoh0dZQCf0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f10216-a7bf-49d8-9589-08db7da3544a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3398.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 22:01:05.1959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cNI7Ch+jlTsL+7fk6lt7XxeW7iG/xNSrlsWaeim1V8/HgGIfuX9VjJdW8nyAm/JuF407xcLEqmyDoDdWjLlLOOQWE09uYKxxBTcam/3ntjZpK4ipJJ/Zel1TNikguOPP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4649
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/29/2023 6:44 PM, Alan Previn wrote:
> After recent discussions with Mesa folks, it was requested
> that we optimize i915's GET_PARAM for the PXP_STATUS without
> changing the UAPI spec.
>
> Add these additional optimizations:
>     - If any PXP initializatoin flow failed, then ensure that
>       we catch it so that we can change the returned PXP_STATUS
>       from "2" (i.e. 'PXP is supported but not yet ready')
>       to "-ENODEV". This typically should not happen and if it
>       does, we have a platform configuration issue.
>     - If a PXP arbitration session creation event failed
>       due to incorrect firmware version or blocking SOC fusing
>       or blocking BIOS configuration (platform reasons that won't
>       change if we retry), then reflect that blockage by also
>       returning -ENODEV in the GET_PARAM:PXP_STATUS.
>     - GET_PARAM:PXP_STATUS should not wait at all if PXP is
>       supported but non-i915 dependencies (component-driver /
>       firmware) we are still pending to complete the init flows.
>       In this case, just return "2" immediately (i.e. 'PXP is
>       supported but not yet ready').
>
> Difference from prio revs:
>    v2: - Use a #define for the default readiness timeout (Vivaik).
>        - Improve comments around the failing of proxy-init.
>    v1: - Change the commit msg style to be imperative. (Jani)
>        - Rename timeout to timeout_ms. (Jani)
>        - Fix is_fw_err_platform_config to use higher order
>          param (pxp) first. (Jani)
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c  | 10 +++++-
>   drivers/gpu/drm/i915/i915_getparam.c       |  2 +-
>   drivers/gpu/drm/i915/pxp/intel_pxp.c       | 40 ++++++++++++++++++----
>   drivers/gpu/drm/i915/pxp/intel_pxp.h       |  2 +-
>   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c |  7 ++--
>   drivers/gpu/drm/i915/pxp/intel_pxp_tee.c   |  7 ++--
>   drivers/gpu/drm/i915/pxp/intel_pxp_types.h |  9 +++++
>   7 files changed, 61 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
> index 034b53a71541..21c2b7cce335 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
> @@ -62,8 +62,16 @@ static void gsc_work(struct work_struct *work)
>   		}
>   
>   		ret = intel_gsc_proxy_request_handler(gsc);
> -		if (ret)
> +		if (ret) {
> +			if (actions & GSC_ACTION_FW_LOAD) {
> +				/*
> +				 * A failure right after firmware load means the proxy-init
> +				 * step has failed so mark GSC as not usable after this
> +				 */
> +				intel_uc_fw_change_status(&gsc->fw, INTEL_UC_FIRMWARE_LOAD_FAIL);
> +			}
>   			goto out_put;
> +		}
>   
>   		/* mark the GSC FW init as done the first time we run this */
>   		if (actions & GSC_ACTION_FW_LOAD) {
> diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
> index 890f2b382bee..5c3fec63cb4c 100644
> --- a/drivers/gpu/drm/i915/i915_getparam.c
> +++ b/drivers/gpu/drm/i915/i915_getparam.c
> @@ -109,7 +109,7 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
>   			return value;
>   		break;
>   	case I915_PARAM_PXP_STATUS:
> -		value = intel_pxp_get_readiness_status(i915->pxp);
> +		value = intel_pxp_get_readiness_status(i915->pxp, 0);
>   		if (value < 0)
>   			return value;
>   		break;
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> index bb2e15329f34..e3b47525dc60 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> @@ -359,22 +359,46 @@ void intel_pxp_end(struct intel_pxp *pxp)
>   	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
>   }
>   
> +static bool pxp_required_fw_failed(struct intel_pxp *pxp)
> +{
> +	if (__intel_uc_fw_status(&pxp->ctrl_gt->uc.huc.fw) == INTEL_UC_FIRMWARE_LOAD_FAIL)
> +		return true;
> +	if (HAS_ENGINE(pxp->ctrl_gt, GSC0) &&
> +	    __intel_uc_fw_status(&pxp->ctrl_gt->uc.gsc.fw) == INTEL_UC_FIRMWARE_LOAD_FAIL)
> +		return true;
> +
> +	return false;
> +}
> +
> +static bool pxp_fw_dependencies_completed(struct intel_pxp *pxp)
> +{
> +	if (HAS_ENGINE(pxp->ctrl_gt, GSC0))
> +		return intel_pxp_gsccs_is_ready_for_sessions(pxp);
> +
> +	return pxp_component_bound(pxp);
> +}
> +
>   /*
>    * this helper is used by both intel_pxp_start and by
>    * the GET_PARAM IOCTL that user space calls. Thus, the
>    * return values here should match the UAPI spec.
>    */
> -int intel_pxp_get_readiness_status(struct intel_pxp *pxp)
> +int intel_pxp_get_readiness_status(struct intel_pxp *pxp, int timeout_ms)
>   {
>   	if (!intel_pxp_is_enabled(pxp))
>   		return -ENODEV;
>   
> -	if (HAS_ENGINE(pxp->ctrl_gt, GSC0)) {
> -		if (wait_for(intel_pxp_gsccs_is_ready_for_sessions(pxp), 250))
> -			return 2;
> -	} else {
> -		if (wait_for(pxp_component_bound(pxp), 250))
> +	if (pxp_required_fw_failed(pxp))
> +		return -ENODEV;
> +
> +	if (pxp->platform_cfg_is_bad)
> +		return -ENODEV;
> +
> +	if (timeout_ms) {
> +		if (wait_for(pxp_fw_dependencies_completed(pxp), timeout_ms))
>   			return 2;
> +	} else if (!pxp_fw_dependencies_completed(pxp)) {
> +		return 2;
>   	}
>   	return 1;
>   }
> @@ -383,11 +407,13 @@ int intel_pxp_get_readiness_status(struct intel_pxp *pxp)
>    * the arb session is restarted from the irq work when we receive the
>    * termination completion interrupt
>    */
> +#define PXP_READINESS_TIMEOUT 250
> +
>   int intel_pxp_start(struct intel_pxp *pxp)
>   {
>   	int ret = 0;
>   
> -	ret = intel_pxp_get_readiness_status(pxp);
> +	ret = intel_pxp_get_readiness_status(pxp, PXP_READINESS_TIMEOUT);
>   	if (ret < 0)
>   		return ret;
>   	else if (ret > 1)
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
> index 17254c3f1267..d9372f6f7797 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
> @@ -26,7 +26,7 @@ void intel_pxp_fini_hw(struct intel_pxp *pxp);
>   void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp);
>   void intel_pxp_tee_end_arb_fw_session(struct intel_pxp *pxp, u32 arb_session_id);
>   
> -int intel_pxp_get_readiness_status(struct intel_pxp *pxp);
> +int intel_pxp_get_readiness_status(struct intel_pxp *pxp, int timeout_ms);
>   int intel_pxp_get_backend_timeout_ms(struct intel_pxp *pxp);
>   int intel_pxp_start(struct intel_pxp *pxp);
>   void intel_pxp_end(struct intel_pxp *pxp);
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> index c7df47364013..97ad58d6aff1 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> @@ -17,12 +17,13 @@
>   #include "intel_pxp_types.h"
>   
>   static bool
> -is_fw_err_platform_config(u32 type)
> +is_fw_err_platform_config(struct intel_pxp *pxp, u32 type)
>   {
>   	switch (type) {
>   	case PXP_STATUS_ERROR_API_VERSION:
>   	case PXP_STATUS_PLATFCONFIG_KF1_NOVERIF:
>   	case PXP_STATUS_PLATFCONFIG_KF1_BAD:
> +		pxp->platform_cfg_is_bad = true;
>   		return true;
>   	default:
>   		break;
> @@ -225,7 +226,7 @@ int intel_pxp_gsccs_create_session(struct intel_pxp *pxp,
>   	if (ret) {
>   		drm_err(&i915->drm, "Failed to init session %d, ret=[%d]\n", arb_session_id, ret);
>   	} else if (msg_out.header.status != 0) {
> -		if (is_fw_err_platform_config(msg_out.header.status)) {
> +		if (is_fw_err_platform_config(pxp, msg_out.header.status)) {
>   			drm_info_once(&i915->drm,
>   				      "PXP init-session-%d failed due to BIOS/SOC:0x%08x:%s\n",
>   				      arb_session_id, msg_out.header.status,
> @@ -268,7 +269,7 @@ void intel_pxp_gsccs_end_arb_fw_session(struct intel_pxp *pxp, u32 session_id)
>   		drm_err(&i915->drm, "Failed to inv-stream-key-%u, ret=[%d]\n",
>   			session_id, ret);
>   	} else if (msg_out.header.status != 0) {
> -		if (is_fw_err_platform_config(msg_out.header.status)) {
> +		if (is_fw_err_platform_config(pxp, msg_out.header.status)) {
>   			drm_info_once(&i915->drm,
>   				      "PXP inv-stream-key-%u failed due to BIOS/SOC :0x%08x:%s\n",
>   				      session_id, msg_out.header.status,
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> index 1ce07d7e8769..1de054126c6d 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> @@ -20,12 +20,13 @@
>   #include "intel_pxp_types.h"
>   
>   static bool
> -is_fw_err_platform_config(u32 type)
> +is_fw_err_platform_config(struct intel_pxp *pxp, u32 type)
>   {
>   	switch (type) {
>   	case PXP_STATUS_ERROR_API_VERSION:
>   	case PXP_STATUS_PLATFCONFIG_KF1_NOVERIF:
>   	case PXP_STATUS_PLATFCONFIG_KF1_BAD:
> +		pxp->platform_cfg_is_bad = true;
>   		return true;
>   	default:
>   		break;
> @@ -339,7 +340,7 @@ int intel_pxp_tee_cmd_create_arb_session(struct intel_pxp *pxp,
>   	if (ret) {
>   		drm_err(&i915->drm, "Failed to send tee msg init arb session, ret=[%d]\n", ret);
>   	} else if (msg_out.header.status != 0) {
> -		if (is_fw_err_platform_config(msg_out.header.status)) {
> +		if (is_fw_err_platform_config(pxp, msg_out.header.status)) {
>   			drm_info_once(&i915->drm,
>   				      "PXP init-arb-session-%d failed due to BIOS/SOC:0x%08x:%s\n",
>   				      arb_session_id, msg_out.header.status,
> @@ -387,7 +388,7 @@ void intel_pxp_tee_end_arb_fw_session(struct intel_pxp *pxp, u32 session_id)
>   		drm_err(&i915->drm, "Failed to send tee msg for inv-stream-key-%u, ret=[%d]\n",
>   			session_id, ret);
>   	} else if (msg_out.header.status != 0) {
> -		if (is_fw_err_platform_config(msg_out.header.status)) {
> +		if (is_fw_err_platform_config(pxp, msg_out.header.status)) {
>   			drm_info_once(&i915->drm,
>   				      "PXP inv-stream-key-%u failed due to BIOS/SOC :0x%08x:%s\n",
>   				      session_id, msg_out.header.status,
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> index 1a8765866b8b..7e11fa8034b2 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> @@ -26,6 +26,15 @@ struct intel_pxp {
>   	 */
>   	struct intel_gt *ctrl_gt;
>   
> +	/**
> +	 * @platform_cfg_is_bad: used to track if any prior arb session creation resulted
> +	 * in a failure that was caused by a platform configuration issue, meaning that
> +	 * failure will not get resolved without a change to the platform (not kernel)
> +	 * such as BIOS configuration, firwmware update, etc. This bool gets reflected when
> +	 * GET_PARAM:I915_PARAM_PXP_STATUS is called.
> +	 */
> +	bool platform_cfg_is_bad;
> +
>   	/**
>   	 * @kcr_base: base mmio offset for the KCR engine which is different on legacy platforms
>   	 * vs newer platforms where the KCR is inside the media-tile.
>
> base-commit: 6f8963ce33be65c67e53b16fa18325e12ab76861

Reviewed-by: Balasubrawmanian, Vivaik <vivaik.balasubrawmanian@intel.com>

