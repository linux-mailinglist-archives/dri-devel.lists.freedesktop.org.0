Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F525BED78
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 21:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C9A10E764;
	Tue, 20 Sep 2022 19:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E4A10E766;
 Tue, 20 Sep 2022 19:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663701504; x=1695237504;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DA9bEc8LdoZHqCzfNPsHRgnTb9f2ZFXxb5dISovXi8c=;
 b=CcLuzhxlin/mnMcwtRz74lGcWwmgMtrypbB2Za1KUsJTzXZhmxZz0sf/
 jvyZ918B9oQZF3dLAlzRyzpFCbqjGo+TBJr5vbR58qgylMcb253//TYDp
 gB9WR1JKAiP0opSvhxKT4y5i24H+DtcfUsXiWH3wiFJ0ECNGpuGxAzUh5
 UpBSfZ5N58Qx63qTBmFsq3E8+NIaC5CNBnzLrp84Z2SBbZXSc8BuUCqE0
 wCSdwldCXkF4Xi3wX1Pg/YjkfUmNtMcZ8Ea82d1iL97NdeN1xqHg3ZWsn
 oN3sK9lRszYyyVctzbGJrNG1WC4pNC9T1NqNOVvoR89qNZ3K06qr57caL A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="300634575"
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; d="scan'208";a="300634575"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 12:18:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; d="scan'208";a="794384960"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 20 Sep 2022 12:18:23 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 12:18:22 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 12:18:22 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 20 Sep 2022 12:18:22 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 20 Sep 2022 12:18:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ctVM/aTdAXnau24ex3jkOvYIv6Fzjejs7yNvferCLvAOCZIBhtxl5mdGzpdKIqd8bTiUqdeIkTIkCu5pOW+7td3spoAXNG5vC2At/x2FOsXj3bSeYanw03D+5aL1/MNXTDuywsoISng1LDx9epv61BeWlwR7pwzDoOtKFF9Ay+QYR0431u0+eJUtf73wV9NhyAqiAgUo3wWNT7tCMMIGdWFc+L/K6xekblnokKWFSuWyeNCph18H56Ny7Qhp281e21x1DDGeJI9cJLVi9QA03sQgl9Hf72Jw7m8dbH/ScEMogU/+RaoEDGFFUOA/vmq7eDcvJ3f+7irZzbaQymq/pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNDWuIlAr0b0qgyVUeZAvHTuN7C/Sm66szNtyF5+DqU=;
 b=f5CBxk7tVqYqK2C7VTB2/dtOYbfr/btUlHhUKyk0QShL6uJr8DWh9079CS6qYV91WwzZObFdMqaGpPIKpTap7QVY1Ol/MUK0UXC2iaNim8QaQc0/vtF6Db6XaMMiroq3POFwQuWGTmxAA8y/2cuiYOopr5y6ZyODiOKS/Y9B4o6PLKiWt5zoCOQsOa/eCTfAZowRg+QXjk8ThSfy8lAO0Qz0eRc4XSxYIUEq/g9EZku80/E9mrqFBVcELn3oZ4brcYBXCtYcyZBPHYjuos49QKhxCRYy+KMoTB5zWe8XbaNB4jgbJQl9zbw34L46hJ1uEE5ErX/PLdtBXoOiV2tJYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5108.namprd11.prod.outlook.com (2603:10b6:303:92::9)
 by SJ1PR11MB6130.namprd11.prod.outlook.com (2603:10b6:a03:45f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.18; Tue, 20 Sep
 2022 19:18:20 +0000
Received: from CO1PR11MB5108.namprd11.prod.outlook.com
 ([fe80::60be:993e:a3fc:1cf9]) by CO1PR11MB5108.namprd11.prod.outlook.com
 ([fe80::60be:993e:a3fc:1cf9%9]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 19:18:20 +0000
Message-ID: <6905e79e-700e-66cc-d369-508d885e804a@intel.com>
Date: Tue, 20 Sep 2022 12:18:19 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [Intel-gfx] [PATCH v2 3/3] drm/i915/dgfx: Make failure to setup
 stolen non-fatal
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-gfx@lists.freedesktop.org>, Caz Yokoyama <caz@caztech.com>, "Aravind
 Iddamsetty" <aravind.iddamsetty@intel.com>
References: <20220915-stolen-v2-0-20ff797de047@intel.com>
 <20220915-stolen-v2-3-20ff797de047@intel.com>
From: Wayne Boyer <wayne.boyer@intel.com>
In-Reply-To: <20220915-stolen-v2-3-20ff797de047@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR20CA0028.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::41) To CO1PR11MB5108.namprd11.prod.outlook.com
 (2603:10b6:303:92::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5108:EE_|SJ1PR11MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: a2a259a2-be24-4999-8590-08da9b3ce130
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mvQ75Z0aYcL1r710/N3eLYApQ69NAer5lAWanEElQRStsX7U0ehkDOxPSkrncTZxUsI3qtdgoM63lz7njLucCpub/dCN787ohpn9we4pCX53YRRGqgLkev1YKD6MVAGj2Sx4C+fnKv4FNpddU6NNUti7806UYCacD86WS06DzZXFfDdIE+TPcXReY+whX4mp8YzHv0SY8j4/9Xi7gFgTV3bivB+JzIQXd8KZZg9eJIuTifJATtNCsfAgvJYW0LWn+YmlgCj9JHMgkx3qQEgHn6mb+1ezAty0MVUnVY1WzsAjJ5X9Qo4Nqj9blr4NhqbbfhpAg2B1AxwjvOeDly3DTyLte9bVVs6iLjq9IKC1Wi0IhQk+cVCQ5cvwQlVH8fplpWEtWZMc+gSY6RBaOpIlQhPbZi42pOCvN4QVk81/eFZS/ZIiuOxbyBO7gweU6RXr37PKr9XGytiz1ZJ2eTuMc2f/7jQ+q4DzXQ6tR8cL75+gDdTWl1ofDYX/YoZBnBG9u3SRxSgc+Jk1TGGjTzpczfsRZzKuoqRiUpTxmhVpCEMeNIG/hU7oWd49W+GDD7H4Nh7MjpXl1BVgPSeS8TykyT1XJYGFjVdfXrrE8xSM6L0ahRDHpGUZ9U+IHjWlq+Yz1OvUhJQZ/vugYdVgZstqu1YIK6K96Jwp77A4uKmJBfD6KUQIh0lQGKigL3V0+Pw0GNPdIFI6U9MAqRkFVsM6W7wXAo73okSJsWUGkeB+du4KghMTWthn1zZ566OIujQFucdslW32eO3Qbh9HUGUVRo5ErdEb8E/qeaqbF6lwxPg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5108.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(396003)(376002)(366004)(39860400002)(346002)(451199015)(66476007)(66946007)(66556008)(53546011)(6506007)(26005)(4326008)(86362001)(5660300002)(41300700001)(6512007)(83380400001)(8936002)(8676002)(2906002)(82960400001)(2616005)(44832011)(36756003)(38100700002)(31686004)(31696002)(186003)(478600001)(110136005)(6486002)(316002)(6636002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGVJYjNzQmF6L0xKQmFnQTVWZ3RkVlVXaFJsVTZLTWdNSXRsTTZqY1J6TVAx?=
 =?utf-8?B?SWJZclFsTkNnTzRHNEhsZVFWTDRSTTVUcTB4UnZmT2J0NTVJOGtqODFFSXN4?=
 =?utf-8?B?VnZ0TGt0UlhtRlVobSsrWGs0YmVFZjFvTnd3NjV5ait5RU5BR3VBc2ZJMjVj?=
 =?utf-8?B?UU41U1RKa3dkcHJKeW5DUGVtNVJlb3h0R095ZzdSVjhtM05XK0JvdnUwaUtG?=
 =?utf-8?B?cnBXZWl0MXNzbndYZTdZQ1pEY0JCdWg2ejRWclQzckpLS3pzUjVGQWJnTmpR?=
 =?utf-8?B?anNsRUp6QTlqV0xYeUR5cFgwQW9yUmpON0RXNHREMEp2R1VUOWJhVUUybnBo?=
 =?utf-8?B?bDF2Ui9id0JmcHhKT0hQYXZyOEV4TllqMGpPNGRWdjZWM0ZiU2xMNXRFeWZh?=
 =?utf-8?B?V2h6c2RqbVhFaFFScjBnUVFqNWtiZ3MwUk1kMUQ4azd3TU4wVFVJbjZOU0lR?=
 =?utf-8?B?SHBMVWdQM3JHYzlWSC83OUNlLzJSN3dkRlg1c2l0ZGFoL3BUVm1KUER5Y0FK?=
 =?utf-8?B?Y2x2eGl1V1o4Tzh2WEdwOHBweXZhRzlxWFFPZllkSXVmc0drMWlBWjF6YlQ3?=
 =?utf-8?B?azc5RllkcFVHa1BVYTg1OHZ2V1U1TkVZemZMODdMY1FrOEJUc0FQTGV2b0pZ?=
 =?utf-8?B?M04rYzR2dGx1SlZYYi9ud1FSR21pelFwaC8zOEczNjdpNThLbFFwV1RISnE0?=
 =?utf-8?B?WkZTQTlESldOcEdiUWRXR3JSakdwWmpud1VMRkw5SEFmcWN3Vm1nKzBlemFP?=
 =?utf-8?B?djdoQTRXcCs0YTdVVGFITDIvSDZpR1pkM0xoNUcwV0RaVWk1Q3pMeDQxMk9F?=
 =?utf-8?B?cnZsbkduVnVWYXRremRwdU82UnRwM2x0SFJxTlAraWFGV2k4ZjJ3S0NhbXpY?=
 =?utf-8?B?TlZjYkFMWHNlQkVIZ1pmUFd6eHpHTUxua1hiNDBieEN4cE9ESUlKV3JVQkx4?=
 =?utf-8?B?blk0czhsVmMyU2xRdVM0bnN2c29aaE5GeU54N3lhSVVFQUxWOVhKZ2VBbWtj?=
 =?utf-8?B?azNzMndOQUlKeGZSNXppL0FCZzhVN0xWYjM3NGxrbU1WNCs1bDVtQktXNFRj?=
 =?utf-8?B?dUF2T1pxLzk3eVhQVkVydVJEV0V4dFBPSHM3REg0eC9mWFk2TThGeVBNNXEx?=
 =?utf-8?B?NXJXeUxVRTlEZktRR0pjY3lHVUluc2ZHazBCaDJqenVnZTN6ai9pNU02S0w1?=
 =?utf-8?B?WUs2MmZxSko3amk1bmgvUUdNVE5uTU1xbU9hS2JIaENzVXRnM3FKcW83MkQ0?=
 =?utf-8?B?L242SllUdlVvWFhqRG9zREdPeXNpZEVWL2ZiM1UxVkdBMWk5T2R2WVIwc0NO?=
 =?utf-8?B?ajExVmV4RkNjdFMwN2VjUytlb0g4aEtrTm1SNWZWOVhIZUdTU1dISjRYbmU5?=
 =?utf-8?B?dm9iRDVFZVJDVUVJU3RsbzBwN28rUU9iTjBMQWt5eVBkamlMQjU5Q2lueUVW?=
 =?utf-8?B?SGJUV1lTUjlEWUZjNXBvbGtoTysvZ2VOZEtERGZKcVNwRkhMN0h4ZytMbTFi?=
 =?utf-8?B?Ky80YjB4NmxSNHc2eGJhenZTWUpJZTNyL1A4MWtxYXdMVEJvQ3pyeGlmQ1dl?=
 =?utf-8?B?T2FpV0J1TThSYkV2Uk1rS1o3ekNkTk12YzlUM2FqTFN0OTJPejhxUnBhQjBJ?=
 =?utf-8?B?YUpObGV5N3Y1RFJLZlEzKy9OOFc3aUwzUm8wMCtzcjFEa3EzN003U2dHcFox?=
 =?utf-8?B?YU5vZTd5cUMycXpla2puWnZnTmsyRnEvU3d4V0JNdmhXMms1eUJWL25wS2Ni?=
 =?utf-8?B?NlhWYTN2VVQzNjBuSngybDZ1ZVNaT0xBTG5KSDltUUxKeFZYK091ZSs0cFRq?=
 =?utf-8?B?bThULzhTeVhBZC9ock9JMlUzZEx1TzBldkVWS1VJNFdROVpRTzhGS0pKK3Mr?=
 =?utf-8?B?MGxCMUNOY3RIVzMvUkVSYi9yWFkzYklYbWRDeEJzWmtMdmhvSDFIUlVKQlBU?=
 =?utf-8?B?SVdTREpnSFcxSmNnc05leDIrVFYrTTR5TG8zZ2UzZzdmWDlyYWpKMHpkR0ZC?=
 =?utf-8?B?R1JSOHRReWNEbmhkaGdWdVpNWHlPdlc2eFRZWlpkV3QwZ09CMFNvUTJjL1Zm?=
 =?utf-8?B?VmRQZnQvUGsvM0lFRERZRDk5RFFVc3FQUFNHRmxqL3A1T2tJUzc1QndWZDJh?=
 =?utf-8?B?SUU5UFlaa21WdktrMWp6L2pKa3hlRjFadnBJcmp3ZDFwSXVhUzc3ZjNodFEz?=
 =?utf-8?B?T2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a259a2-be24-4999-8590-08da9b3ce130
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5108.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 19:18:20.5680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R7mhtDYrpm7sdueEMDOpFlChwMCqgRYJDVHMciNHwlng4NN4w4IWp1cbOcIP+QelNbO7/yaYnwzHY2T+63jJ1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6130
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
Cc: tejas.upadhyay@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/16/22 10:36 AM, Lucas De Marchi wrote:
> There is no reason to consider the setup of Data Stolen Memory fatal on
> dgfx and non-fatal on integrated. Move the debug and error propagation
> around so both have the same behavior: non-fatal. Before this change,
> loading i915 on a system with TGL + DG2 would result in just TGL
> succeeding the initialization (without stolen).
> 
> Now loading i915 on the same system with an injected failure in
> i915_gem_init_stolen():
> 
> 	$ dmesg | grep stolen
> 	i915 0000:00:02.0: [drm] Injected failure, disabling use of stolen memory
> 	i915 0000:00:02.0: [drm:init_stolen_smem [i915]] Skip stolen region: failed to setup
> 	i915 0000:03:00.0: [drm] Injected failure, disabling use of stolen memory
> 	i915 0000:03:00.0: [drm:init_stolen_lmem [i915]] Skip stolen region: failed to setup
> 
> Both GPUs are still available:
> 
> 	$ sudo build/tools/lsgpu
> 	card1                    Intel Dg2 (Gen12)                 drm:/dev/dri/card1
> 	└─renderD129                                               drm:/dev/dri/renderD129
> 	card0                    Intel Tigerlake (Gen12)           drm:/dev/dri/card0
> 	└─renderD128                                               drm:/dev/dri/renderD128
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 

Reviewed-by: Wayne Boyer <wayne.boyer@intel.com>

> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index 6edf4e374f54..c5a4035c99cd 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -494,26 +494,26 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
>   		drm_notice(&i915->drm,
>   			   "%s, disabling use of stolen memory\n",
>   			   "iGVT-g active");
> -		return 0;
> +		return -ENOSPC;
>   	}
>   
>   	if (i915_vtd_active(i915) && GRAPHICS_VER(i915) < 8) {
>   		drm_notice(&i915->drm,
>   			   "%s, disabling use of stolen memory\n",
>   			   "DMAR active");
> -		return 0;
> +		return -ENOSPC;
>   	}
>   
>   	if (adjust_stolen(i915, &mem->region))
> -		return 0;
> +		return -ENOSPC;
>   
>   	if (request_smem_stolen(i915, &mem->region))
> -		return 0;
> +		return -ENOSPC;
>   
>   	i915->dsm = mem->region;
>   
>   	if (init_reserved_stolen(i915))
> -		return 0;
> +		return -ENOSPC;
>   
>   	/* Exclude the reserved region from driver use */
>   	mem->region.end = i915->dsm_reserved.start - 1;
> @@ -527,7 +527,7 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
>   		(u64)i915->stolen_usable_size >> 10);
>   
>   	if (i915->stolen_usable_size == 0)
> -		return 0;
> +		return -ENOSPC;
>   
>   	/* Basic memrange allocator for stolen space. */
>   	drm_mm_init(&i915->mm.stolen, 0, i915->stolen_usable_size);
> @@ -765,11 +765,17 @@ i915_gem_object_create_stolen(struct drm_i915_private *i915,
>   
>   static int init_stolen_smem(struct intel_memory_region *mem)
>   {
> +	int err;
> +
>   	/*
>   	 * Initialise stolen early so that we may reserve preallocated
>   	 * objects for the BIOS to KMS transition.
>   	 */
> -	return i915_gem_init_stolen(mem);
> +	err = i915_gem_init_stolen(mem);
> +	if (err)
> +		drm_dbg(&mem->i915->drm, "Skip stolen region: failed to setup\n");
> +
> +	return 0;
>   }
>   
>   static int release_stolen_smem(struct intel_memory_region *mem)
> @@ -786,21 +792,25 @@ static const struct intel_memory_region_ops i915_region_stolen_smem_ops = {
>   
>   static int init_stolen_lmem(struct intel_memory_region *mem)
>   {
> +	struct drm_i915_private *i915 = mem->i915;
>   	int err;
>   
>   	if (GEM_WARN_ON(resource_size(&mem->region) == 0))
> -		return -ENODEV;
> +		return 0;
>   
>   	err = i915_gem_init_stolen(mem);
> -	if (err)
> -		return err;
> +	if (err) {
> +		drm_dbg(&mem->i915->drm, "Skip stolen region: failed to setup\n");
> +		return 0;
> +	}
>   
> -	if (mem->io_size && !io_mapping_init_wc(&mem->iomap,
> -						mem->io_start,
> -						mem->io_size)) {
> -		err = -EIO;
> +	if (mem->io_size &&
> +	    !io_mapping_init_wc(&mem->iomap, mem->io_start, mem->io_size))
>   		goto err_cleanup;
> -	}
> +
> +	drm_dbg(&i915->drm, "Stolen Local memory IO start: %pa\n",
> +		&mem->io_start);
> +	drm_dbg(&i915->drm, "Stolen Local DSM base: %pa\n", &mem->region.start);
>   
>   	return 0;
>   
> @@ -874,16 +884,6 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>   	if (IS_ERR(mem))
>   		return mem;
>   
> -	/*
> -	 * TODO: consider creating common helper to just print all the
> -	 * interesting stuff from intel_memory_region, which we can use for all
> -	 * our probed regions.
> -	 */
> -
> -	drm_dbg(&i915->drm, "Stolen Local memory IO start: %pa\n",
> -		&mem->io_start);
> -	drm_dbg(&i915->drm, "Stolen Local DSM base: %pa\n", &dsm_base);
> -
>   	intel_memory_region_set_name(mem, "stolen-local");
>   
>   	mem->private = true;
> @@ -908,6 +908,7 @@ i915_gem_stolen_smem_setup(struct drm_i915_private *i915, u16 type,
>   	intel_memory_region_set_name(mem, "stolen-system");
>   
>   	mem->private = true;
> +
>   	return mem;
>   }
>   
> 

-- 
--
Wayne Boyer
Graphics Software Engineer
VTT-OSGC Platform Enablement
