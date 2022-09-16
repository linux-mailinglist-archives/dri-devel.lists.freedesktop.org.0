Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 633BD5BACD6
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 13:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3508410ECE3;
	Fri, 16 Sep 2022 11:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2627A10ECDA;
 Fri, 16 Sep 2022 11:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663329459; x=1694865459;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MUKP7nJQ0k1842ad/D4+Fj+rDZVOQX0csM5qvF03b/g=;
 b=ny+jXyOXVThvB28XOZF25nk2Ddk4Dj0cGd9fbhz70Z/ZFEpBuZa8hD5/
 3ALLviE3nIj7FXelZhQcTF3iGsM9gU6FIQ1GOZIL0sOHVQFG53d+7X16P
 eb8qDFyyJ78LsMJ9hCRKL5jKe2zh8Pr8DwW7uPwu2EehgkoRehmwB0X7S
 onMfAK2a5eMhN7GRkaIJuJ6XFx+5PZyZ8vSdfGVvESACfzlJsx5EbnWuO
 fLyTJfg6YlebJ161BvDH9RcLy532fcrpn9znhFIIjVCdH8jC1tH5IpYeU
 qi1JExpSiU35xo5axYix0U4VdJeodbGzAH8Qug/p9g4/g2bw+eT8iybOT w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="296564339"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="296564339"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 04:57:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="648234281"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 16 Sep 2022 04:57:37 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 16 Sep 2022 04:57:37 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 16 Sep 2022 04:57:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 16 Sep 2022 04:57:36 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 16 Sep 2022 04:57:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ER2H6URzcCFfG3KTDS6Y6DHBeDTIrgYmTi8p7QkX39k5LJvDccLGkDavH61YXf0rqbbaklckusU7p8O7s1aRJOcMEZ+/d3Siw+02qzCcv2aa5y3dgk8+otasbr4/HI3jiKEyCvDT+DJsRELzKkU9eDSRDFmwYRIBJ4m2WrrRGssBDZrwZf91DFuEWoxTT0eEm3GGCzSeovxMAvKXGLuf7nB/JlDRsotaBgYhfjMMKuWm5tDzGc7kVPNREBMgeukSwmqsWcDRQ4I0hYQ/oA9kY5Zqk0OdZA3igGqJBlw48+ZcXOIc+P9UMXWkCGdBMt9JKfM7vC2Fyn2YXuidKLQt5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLuxQRLJoEMt5ZsRe31nRWyyf/kpWGqOo26vvyTS/rc=;
 b=oX2dAO5rBB65T+zfUx5+vQHxyrdR+gnxqxcuME9iwHDR8fiOM/twAFo+IG2iQ5umeir87b1Cv/TOmHn5uPJf/Sk9h2k9F8jkBUXByLNtAIxmC4rCgJan/j2DIdf7LiHAi0ZVPHQlPo1f1bSmahtfllV56tTuGFxYvbjOPEmkrKSXGqVq/u0rP6rRZ+TTuixYAdE/R9VE0ia9PpJkz9VY5Lyv1jXagsfa5gmSEJS8kUNv7/GjPjq1Hmb3kq1+yThfVMww/jKDX6cttqbhfhVjQiBWHGq0v2rihPHMOomVfH+N+Ctt2f2ZTUF+1vstxeUNBxMhHD6Dn+Q0E0upVtXeIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by MW4PR11MB5871.namprd11.prod.outlook.com (2603:10b6:303:188::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Fri, 16 Sep
 2022 11:57:29 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::bde0:ec99:6d15:8763]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::bde0:ec99:6d15:8763%9]) with mapi id 15.20.5632.017; Fri, 16 Sep 2022
 11:57:29 +0000
Message-ID: <20efed15-304a-262d-ee55-e7f3c9222489@intel.com>
Date: Fri, 16 Sep 2022 17:27:18 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH v1 1/4] drm/i915: Move dsm assignment to be after
 adjustment
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220915-stolen-v1-0-117c5f295bb2@intel.com>
 <20220915-stolen-v1-1-117c5f295bb2@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20220915-stolen-v1-1-117c5f295bb2@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::23) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|MW4PR11MB5871:EE_
X-MS-Office365-Filtering-Correlation-Id: cf39b5af-b404-4c03-ea4d-08da97daa112
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0zLXLtfpxcP+IOpUCZBJEBv9TLtLFrsvfCx7aHouM7jnVbALRmQ22Zjdg969LlTHzWTaeOsd4XXlVGHNa6Fn/pi/mY0hsVb8wWCakQ/Mz7o/19TkFTRmaZKQnMbFOLHTnLpc88bVjAytGc1fjY1iG4/J/FIXwu3PRDE57vqYAjAH2yhmPb7Pk7m4bvQNeuebSfekj+RpMM3roROah9ubqWB9qiXoh/SxDZJJw17RT6JntNDH19TpDynzWi6Y9UijCfJWf7bbL/fSEQBA+SA2Hit235725t8t1xT7irxNjU162AHS/5WkBtuGufP1az/Dk4ZwsVdwSMMi7ExcUDl7sgXNZBVMeAtBEVWMfka1Sbjtc3O3XygIdjRhnLTqUnFd9XImk3TtiUTq4TBnsCV0OAncs9Se+I91AmTygtKTQ41m/kVPysiJFbs8nw92QKxcf5Oc6s6p2WZ4miyGFBwsXYQLAbKuJHBNBa9e7k2M9DLezmDD3Zv+saZg3a5NHVkirzsfyNq3wwBCEzdEUDLSDVrTJyABeZFT+QIEJGr9NE+pJbQbTxEGE1UDQN5zIIXoriqOG2NtZgljQI3cIFpkwPJg44kTUYEQdgbxNoik1qZH2abEK+bIKFuVSnv6PDVD8TbyEbu0yqcLwJANVdrDpARRlTFVHSZcV2WQB+bu1amrog6bA+jMrOJBs15gpUYcVKJFXx267xOuQxMpeT8+j5ZwFL2rD/6VfHnVjKh2mYAzRVdyB6uKNZkis77vJWUlXqIwtwRZFM9IfENJJf+/gt1zjffJDmmkem3VC6QRkMg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(396003)(136003)(376002)(39860400002)(451199015)(31686004)(83380400001)(86362001)(31696002)(66556008)(36756003)(2906002)(66946007)(8936002)(450100002)(66476007)(38100700002)(4326008)(8676002)(316002)(5660300002)(82960400001)(107886003)(6486002)(6666004)(53546011)(6506007)(26005)(2616005)(41300700001)(6512007)(478600001)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0pEY0NDK3R3b2VDN2Ivcy81bk1ZZkQ1S0QreWcvTTZCclhBWmNVU3R6Y2RN?=
 =?utf-8?B?emg5aEtyaXFBRkJ5cFRIY3ZIWWwyYXgrb3pNd2ZjZnZWbkI3QzBWVmdKcDhB?=
 =?utf-8?B?YWJVSGQ3OUtWTlpzQVNkMnFaa0F4QkxpQWpEOEJLZ0NCNCtyaEdkTVlibVFw?=
 =?utf-8?B?OWRDUUtpWERKV3pZelMvZDA0d0tDSmZueUVZVWMvVmVrcE1wMVQ2azBxTGhU?=
 =?utf-8?B?VGxVQ1E0MzVEWlhBUVpRbmFGdTFKS1hjNksxVzQzWC9acTFvbkNlWDhUcXI1?=
 =?utf-8?B?T1E0Y01mTDl2dE1ucFV2OHB1NGlnNHRLaXBNSC9tNmRoMVJwUUxmOElvRllj?=
 =?utf-8?B?b3FkYWxVM09DQzhnTEJ2R1lENnBMVXNJbGxTN3JFSUl0b1ppYWpIWVU2U3Z5?=
 =?utf-8?B?eVVTcE1rbktaQTFRZzF5RkNKVVh1Q2NEaWY5L2ZBc2U5eVY0ajI4SVFhYnU3?=
 =?utf-8?B?MmdvNHJjb1d3MmNVcEtWWFU5WVlzVUZFWU9XaU9BbEpoM1FlSXYwVHFkbUNM?=
 =?utf-8?B?RzdkWGlGZmFuQ1dwTGFuS2hkNHlNK1l4aVJLYVQ5MjhUaERuajg1M1NZKzlC?=
 =?utf-8?B?WWhZajA4dFBDUEV1U2tobi9lc1pGeTN0c2wyV1dReHh1d0FOcUc1aGRnTjBJ?=
 =?utf-8?B?ZjhBSEtiM3g3TG8vSnlKTGwrRmR6VnVNVjl0QmVxTk90TE9NV3lZMWJvb0tq?=
 =?utf-8?B?bE9Zd3Fkbm81eGRIa3BKOFB5am0xTnFVdkRqQjFPZEY3WjUxa3JJVlE1Vjdz?=
 =?utf-8?B?ZjRMQTZ3dGE0S0kyZldScEkrYWVKYW5oMlgwcWIveEQvbnNJS1pSdTdqNWdT?=
 =?utf-8?B?a0Fvakl1MGlQQTJNVXFwT2J3ZTBBSlBmUmlTZStwaHAyVy81eFBjZWpMMlVs?=
 =?utf-8?B?UjdsZXA2ZC9XY1FMbldJcmVyUmIxYndoVGRvNXhsb21qNWFta1NxdWNuTjd3?=
 =?utf-8?B?MjN0VDhhK1VTcXZwOHBzZEtlbmNaSGUvT2Nvend2dUxZKzZOS2RMdWhLcDV1?=
 =?utf-8?B?dDc5Nkx1YnlNcDMrcXBWMGNoMmhVbTNzRHBQTWVTSWFVcTJyS0dWK2tUWi95?=
 =?utf-8?B?SlRsN0R2M2dpcTdyeFQvVlJHeTV3aWNKZG5QVzJMTHJyZ1lFR1BKYkF5Um5N?=
 =?utf-8?B?d2E0QWxYZGowajJzTXpZUnhoWjZQZXB5UXFvTDMvWURLcVJXRkRlU0JFYWJs?=
 =?utf-8?B?TE9UQzFBcXhIOE0zRGNOQ1BXMUdNMVl1VFUxY3pXUFQ5N2ZoRkZTZmVzMkhE?=
 =?utf-8?B?WkFtZWY1Ykw0QmRpanl4d0U2RkxBaEp0OC8zSGRqN2FYOFl1dGV2dGtrMGxL?=
 =?utf-8?B?dVFETk5sYSt2aTMwNzEwUThjZDhCdXBjajV3SUNGcVV6SG9vNDdSNC9JZmxM?=
 =?utf-8?B?UE1rRnQ3RjNTMXpaUjBIeHBDVGJhZ1Rna20zTFEwbDM2N2pYcXNaZzZqdElr?=
 =?utf-8?B?VzY5bUtzbkxlbUVuVHlFYVJESVl2UVR1MThocmVWNTBaOXN1TkNkMFlXSC90?=
 =?utf-8?B?OVc3NGJUTFhLMm9pT2VBRktlYjJJUjRWS1piU3RnRExoNEZlSzBMeU1qaEhZ?=
 =?utf-8?B?TElTbWpBR3Qza05zemJwZ1c2ZHRlUzMxT2xLMHZiMnpGNi9oS2pOUXZFOWp3?=
 =?utf-8?B?YXFBVHpXRzlhbGRER00rUWJKWmFnT1dPRGpzL3lZeTJ4a1ZOQTJVNEk0WU0r?=
 =?utf-8?B?dG9HV2VkbGg3dzFNMlJnb01ETEhZN2c5d2RVU1JwZXVPclZQZ1Q1eFk4Mk9n?=
 =?utf-8?B?cENsYnlpNlhtdWMxWWsyUE5hVGg0c0N2dUNsSm9iUkQzMUdXNVdyZFYxQlI5?=
 =?utf-8?B?cEQ2QzFJZ3FQUHpIRzRlZkFNTjRyQk51Q3RNZFpHQkZwTHpIMVQrKzV5a2JB?=
 =?utf-8?B?WktjcGRZdWxQNEpVWWtmQnN6SHc2Ukx5NXBtalBGTU13ZHByRWFxSURxUHc1?=
 =?utf-8?B?RGwyYTgwckRnODBrM24xS2Urc2ZTbmdlN2FKYzV3N1VjMi9pb0h5ekk5bXRM?=
 =?utf-8?B?aXRUWStxNk9qRE5OR0lMeFlPdFlzTEpCUVFla29ReHE0Z3o0ZnRPc0VyMmJY?=
 =?utf-8?B?OWJyaGZYVDhSK1l3ZHJKUVR5TlJmeDl2TEpQWGsvNXZtTHpNSlNjbjNZRE5P?=
 =?utf-8?B?ZUFzV1FJT3lab3JndFBzQ0QxYk9UMURPNzBqNExJTDRjMkZJUkN4TjVkak0y?=
 =?utf-8?B?VWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf39b5af-b404-4c03-ea4d-08da97daa112
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 11:57:29.0820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lqA1GkgDJC1/wkLgxZ8Kn3Kn/m2vmINhJaKCVjIj5Uc+hCB9vB93EEAkSKo1yYyNz+m3F6tzCECKm2csa4QEhKjhNkO5MObWH/2vlxAnMxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5871
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
Cc: tejas.upadhyay@intel.com, dri-devel@lists.freedesktop.org,
 radhakrishna.sripada@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 16-09-2022 02:09, Lucas De Marchi wrote:
> Reduce possible side effects of assigning the region and bailing out due
> to errors.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index acc561c0f0aa..42f4769bb4ac 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -418,14 +418,14 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
>  	if (resource_size(&mem->region) == 0)
>  		return 0;
>  
> -	i915->dsm = mem->region;
> -
> -	if (i915_adjust_stolen(i915, &i915->dsm))
> +	if (i915_adjust_stolen(i915, &mem->region))
>  		return 0;
>  
>  	GEM_BUG_ON(i915->dsm.start == 0);
>  	GEM_BUG_ON(i915->dsm.end <= i915->dsm.start);
>  
> +	i915->dsm = mem->region;

assignment should be above the GEM_BUG_ON.
but why don't you squash this into 3rd patch

thanks,
Aravind.
> +
>  	stolen_top = i915->dsm.end + 1;
>  	reserved_base = stolen_top;
>  	reserved_size = 0;
> 
