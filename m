Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2FD6D8960
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 23:13:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BAC410E261;
	Wed,  5 Apr 2023 21:13:43 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0DE910E261;
 Wed,  5 Apr 2023 21:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680729220; x=1712265220;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L78+dMh56IkrxwdiOuw8My/cV98/J/U0kdPrKv/eD+o=;
 b=d5h7DGM7WPaQOlGjUHUNG3bL/CKkNs4bMd99GaWlE0iwex3JO2wcNawY
 VpCfa8msa7st052+IboGopiOoIYfXsBENOFXw29LLifSs44D8K8KR0tmu
 FNa3id/oqglhN8+DZlFl4m2O5DjE3m2TOmPwvoCfZfk8u9mpEXDmL7/xz
 seViq1c0xEM3SjWQinIVLPmdNxvMQAOvNkQ1ieesQRIUjT1yd0M7hfpl2
 epiAWwncGu/IDvHk2WyMHWaC4F538SElnEV0yBDqe74ZP1f0cBP4bjv/1
 H5fAzUUX3fUh5nyHmddcKTiexn6YCxXTCLQNy4KWuvg1ZGPPl4+ielAKB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="342582718"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="342582718"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 14:13:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="689411650"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="689411650"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 05 Apr 2023 14:13:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 14:13:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 14:13:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 14:13:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YFBex20ypEb3sH0xsgiiu5EGHT7/hT+KZI/RLvvzo4jKZkisynQ6h2cShsBTfLpoSaDSz08T0mVJ8wBXsbtJ3BEbM8E/jD1nWismZOOzSaHc6MRotdZ+uqaS7pe29DFRdTDu1J6jSWYxaDXsJr2Rf0ZjGysVz7kpFciwdFSolfYGGcOh1wHXschMCxbSPzs+00PxM0MgQicwgoWKHHTYjdA2Q+oWAoT2MpHx8r3BMsYy+lPXJ2wFjqmdKVWdxdeFmUSBei+MMYE9nzfJoXhH+sbNIJNz6CelMfFIZJhUVvoYqJXwYypP70g+lR/Kx/b1hbO+xgxT6hVdYvBRffwyKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DByJsHi9y/L2Q6U5dmJgREKWcUqv2iONIeHMeahcb5E=;
 b=MdQGVowiF/p1LZABrAAjYao3z516i4+GFKNiWkNuB8Y9q2+SAqzvBPKTb3wJtkBbrrQzOMU9gpbevGpPBR6T9kBQ/eJnzGqyni+WrvO43vF4hytmMVw+XyQS7G99fO1LDhU71ivITX2CjRAOl0r8pVuNKFI7yFGq2S8yzw6dsMFUfNDKw/W0S3MY5DR8VhQQkLwaKWOw4Pv5YcU6xvoKltFU9jIupAMc1WL5wwa7uwEDyG6xYEd48X+AsH6FV68uXkkOD6zO/o37TSXqGRRxk/XmWQjIB3r3Ga3a1MS3QscoFNSwnOryIuWwvhyZPdGlIpTln6QvsnM04s60OlA2ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BY1PR11MB8053.namprd11.prod.outlook.com (2603:10b6:a03:525::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Wed, 5 Apr
 2023 21:13:36 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::1510:9541:e6ac:fede]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::1510:9541:e6ac:fede%5]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 21:13:36 +0000
Message-ID: <380b0f81-2049-3e1a-87bf-eca4f027dba4@intel.com>
Date: Wed, 5 Apr 2023 14:13:31 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.1
Subject: Re: [PATCH] drm/i915/guc: Don't capture Gen8 regs on Gen12 devices
Content-Language: en-GB
To: Matt Roper <matthew.d.roper@intel.com>
References: <20230403213334.1655239-1-John.C.Harrison@Intel.com>
 <20230404003415.GE4085390@mdroper-desk1.amr.corp.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230404003415.GE4085390@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::30) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|BY1PR11MB8053:EE_
X-MS-Office365-Filtering-Correlation-Id: 81c1e626-0499-486e-192e-08db361a9e50
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fYRyRNWlB18fo0M3kOhs1F3xQLgBObYyXb3bvtZTXbQh8PC3MzQIO6q0CU1rcqthBuB2rVqzHWqcExWLLwHzP6axeBeO64trVeBkgy3mAAggCEUVMQq7wvfz6ZQachqLYi0oW2mFiYQIlc5wKa4YICBw1X3B6aJoPgHZRwrT9FI6sxNUvFLCbGfndZeARJzEX0UwasVQh53ufjauul+QYgasJQyWFKILBTGJSbgijzrkeToQVU5YcUnelIfFdl1c189LOLCyXqKUTkU4BuOuv3aaRLmVYa6JItttdJh46cjhYgpvy3ByVFCqqDZH/r68YZWMNJ2xqer8J1Qby5f9O4HdSU/LC8JFBomxxvjLQVgC5VpsXVgvoiC0RqYQjh7iKSzEdS5aPH8BNi6964/CBH9On80nc84+Uz33skG0K4jKTPt0LyxD9IIbi5+xNz3t8Wb9uYeeHTMBKvY+CcYANgU46lHl8EOpRpFy+PvaDJJRtRNstDUA0Sx5N26zLbutQBJEXyxUurZ5SbXOqeqnGmWm5C5peCmGUSflNBDL/vtRd22XDhhjvIGsxpeAKcrbBnd42pPIST7oO45mpOa2pstgLUu/aifbOxc+f06DdCCCZ8V8B4euL9L2lcm/NUZp/8RwepuyO33qPkfu5rrYYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(396003)(136003)(39860400002)(376002)(451199021)(2616005)(8676002)(37006003)(478600001)(66556008)(66476007)(38100700002)(82960400001)(41300700001)(316002)(6862004)(6636002)(8936002)(5660300002)(54906003)(450100002)(4326008)(66946007)(186003)(107886003)(6666004)(53546011)(6486002)(83380400001)(26005)(6506007)(6512007)(2906002)(86362001)(31696002)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDVjaHRYenhiaU95dFJoa0pBOEdhR0JOdytmVi9zcDFDa3I0bkhuVEgrQ09D?=
 =?utf-8?B?K09WNmdXcFJBb1JqMnFYbk1MNVRYUzdUT1YvUHNuUTlaMzc4NTljME1aczZJ?=
 =?utf-8?B?Y3gyMGM3aHdVN2ZrRzhTaVRnaVhGbU1Jb0lDVTdwdEFGYWRSTnpkZW85Y2pS?=
 =?utf-8?B?clBKSVdCRzFkZFB1NzlXMHU2Rnc5dlNPc2pSTXFGSnVSclhCZEIzU3NUS0NG?=
 =?utf-8?B?VkFjbkEwSGhubmlTY2pjNFpiVE1iM3RlVUk5QlduMi9iWDV2UGQzWDFHeVd4?=
 =?utf-8?B?b0Y0YzRldFI1ZlpSQytWWmN0WjdOWG1kNEZIUHFWTmhXdkQzZVRFR3pYd05w?=
 =?utf-8?B?QmxlVVFPT09lS0w1djlHdHVtZGdXNW9RUlRTWWVjdHFHTlQ2Kzk4NHpHNnpi?=
 =?utf-8?B?OE50L1BtbXYrZHBvbHdMRWFEanMwcXhQK1RyUkdmQURkOHp6S3JrUWRKQ09P?=
 =?utf-8?B?dXlYZVQramJ4VWgyT2M3LzNrSnN5TTI2bEhMdG9zVzRYem1sNm9VT24xc2JC?=
 =?utf-8?B?c2hIMTl3ZHMrbTVTNFNDOEVVa25NczUvNzdydjJnbFZYeFZvUUE1NEdScUJ4?=
 =?utf-8?B?THl5aEJEMFJUVGk5dUlrNWs2ckdrdWZQVlFVeDlhWlAvUG5sU2hJVTNXMUVZ?=
 =?utf-8?B?cXhlWFNSRVR2NUoxMnVEMHdUWTNJS3hVY3BhQ1N6ajV1S3VsVFpBNEgreTF3?=
 =?utf-8?B?LzN4eVFtdmdCTW5USC9Vd1QxYVloN3lBcnNKMHVlUTJHMmphc0hUbGR4T1Z4?=
 =?utf-8?B?NzdibnIzbzVlWU04SkhyOHQ0ME83OWI5amxxTFFVdVRsRllKKys0Q2ord0VM?=
 =?utf-8?B?UE9FbXJRcVZCWWlOU29HbDY2Vys0SFhDSDQ4ZmNwWE9tQlE0V3BiaGR4ZTg1?=
 =?utf-8?B?TU1iRS9rSXhqS0Z3K05jZ0ZxYytRZmFjZy9RVHRYVTdnWE5pSVFXYU1GUEww?=
 =?utf-8?B?R1hBN0lwcTdweC9MSDJEV2VNdlVQUElpTGYyMHE3OWdScXpHNE1WY25jQnlC?=
 =?utf-8?B?SE55aU1Jb25QdUNTZCtGZnR4OUpJakFKQzQ1SWF1TFJCYzB0U3h6WWUvZXoz?=
 =?utf-8?B?MUpiTVJFOUp2VnBRcUgwQUt4L2dxcFVQQldERmJGNkhHVGNRSHRFMkIyQkxV?=
 =?utf-8?B?YlljM3A5aWtqMzRhdDI1T1RyRzJzcHl3MExwOHRKelQwNWFoTXZKeGlOc2JZ?=
 =?utf-8?B?cmh3eDZpcEVHcVY4c3pXbVRyTUNMeGpTdDhXTTQ5YWEySTBXVlFISU9HTWg3?=
 =?utf-8?B?bWZNZWY3a1lGV3ZJb3FLTXM1TFk2VHg5RW9wQ2FKZW05eHFQb0dXaFJTdHhV?=
 =?utf-8?B?L2ZzRlVtQW9TTXlCbHhyRjczUGV3blIxNmNBazdiV2pEclVKMU9QYjBIUTZU?=
 =?utf-8?B?MUtxdlN4ZEVSRVQ1clRkSndnVXR5QTMzS1l4aXMxcHV3dmcxNmxuOGhTUzBB?=
 =?utf-8?B?OExNOXNUa1IvRHdlcUFNQlpoRVJHZnkvdWtKNDBZa3RwZWsvVlc4MXF1RFdK?=
 =?utf-8?B?MnVBWCtuajdJNGFkb0N3WWNldHhJRmUwVHkydlhpUHdrOW1aMTFSR0NFSjJt?=
 =?utf-8?B?bUNPOG9RdmRVK1ZTcjRXb0gxRUt0VnBrSzBwQkVLL1ZnYytmVThjVzFHajhB?=
 =?utf-8?B?bDIrRUovbEV2Tld3VUZDSXg2dHJXSGk1VE1DclJaQUZkZ2tZcmxmL2Myc0lU?=
 =?utf-8?B?S3Z3NXhQbkR4V0l0ZXhyN1VJVFdHS0k3ZFR5Y1c4YjVYNkpLS3RBTE8zMThR?=
 =?utf-8?B?SnVyNDJra1V0ZzZHSVdERGNvbmhCUDFkVHpTZ0JvdjF0ZkMyaGZ0V295RVlK?=
 =?utf-8?B?NEVNeEhQeDI1SFVpWG9LQnNTeTNYeXg2ZW1xSS9kUS9IOGxzNUhObFdsb0pv?=
 =?utf-8?B?a0o5QzdZdTREdmNHL090MlcrQ0hvMUI4cURUeUIwZUZBTE9zZ2dXVmUvZG9F?=
 =?utf-8?B?S2luRDV0NHNiRVlNSy9NM3ZCTzhlYnd1VmVRaU91L2lJWWlxNXNoMUxVNjNO?=
 =?utf-8?B?WllOckNqWGxuTldjSyt4UzEyRDZpWnQ1ZWwzY1RiTkJKNHBBaXRWcWpzMnFL?=
 =?utf-8?B?UG5hc25TTkJLaFZzRGk4aGEyWHlsVFRUeEhMY1RtTUM5QWRvdmJTbUc5NlJC?=
 =?utf-8?B?c3pEZXJlWFFDczhhY2pDWGFtWEVhbG1KdkIyWUQ3dTg3Wld0NjM2ZHpVdjUy?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c1e626-0499-486e-192e-08db361a9e50
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 21:13:36.0990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /4WpJowolj5xWaH2Hbi5vWkHm6hfW+Rg/gw1fNzJ+Ff9iaMsiVQOEcwJnjehGDbMoV2X/esUMAZMpfaCOPeDJkE57JL4J+1qBD6xSl2QUvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8053
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
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Intel-GFX@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, DRI-Devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/3/2023 17:34, Matt Roper wrote:
> On Mon, Apr 03, 2023 at 02:33:34PM -0700, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> A pair of pre-Gen12 registers were being included in the Gen12 capture
>> list. GuC was rejecting those as being invalid and logging errors
>> about them. So, stop doing it.
> Looks like these registers existed from gen8-gen11.  With this change,
> it looks like they also won't be included in the GuC error capture for
> gen11 (ICL and EHL/JSL) since those platforms return xe_lpd_lists [1]
> rather than default_lists; do we care about that?  I assume not (since
> those platforms don't use GuC submission unless you force it with the
> enable_guc modparam and taint your kernel), but I figured I should point
> it out.
Yeah, I think the code is treating Gen11 as Gen12 rather than Gen9 or 
it's own thing. I hadn't spotted that before. It certainly seems incorrect.

>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>
>
> [1] Why is the main list we use called xe_lpd (i.e., the name of ADL-P's
>      display IP)?  It doesn't seem like we're doing anything with display
>      registers here so using display IP naming seems really confusing.
I think because no-one has a clue what name refers to what hardware any 
more :(.

What are the official names for IP_VER 9, 11, 12.00, 12.50 and 12.55?

John.

>
>
> Matt
>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> Fixes: dce2bd542337 ("drm/i915/guc: Add Gen9 registers for GuC error state capture.")
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
>> index cf49188db6a6e..e0e793167d61b 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
>> @@ -31,12 +31,14 @@
>>   	{ FORCEWAKE_MT,             0,      0, "FORCEWAKE" }
>>   
>>   #define COMMON_GEN9BASE_GLOBAL \
>> -	{ GEN8_FAULT_TLB_DATA0,     0,      0, "GEN8_FAULT_TLB_DATA0" }, \
>> -	{ GEN8_FAULT_TLB_DATA1,     0,      0, "GEN8_FAULT_TLB_DATA1" }, \
>>   	{ ERROR_GEN6,               0,      0, "ERROR_GEN6" }, \
>>   	{ DONE_REG,                 0,      0, "DONE_REG" }, \
>>   	{ HSW_GTT_CACHE_EN,         0,      0, "HSW_GTT_CACHE_EN" }
>>   
>> +#define GEN9_GLOBAL \
>> +	{ GEN8_FAULT_TLB_DATA0,     0,      0, "GEN8_FAULT_TLB_DATA0" }, \
>> +	{ GEN8_FAULT_TLB_DATA1,     0,      0, "GEN8_FAULT_TLB_DATA1" }
>> +
>>   #define COMMON_GEN12BASE_GLOBAL \
>>   	{ GEN12_FAULT_TLB_DATA0,    0,      0, "GEN12_FAULT_TLB_DATA0" }, \
>>   	{ GEN12_FAULT_TLB_DATA1,    0,      0, "GEN12_FAULT_TLB_DATA1" }, \
>> @@ -142,6 +144,7 @@ static const struct __guc_mmio_reg_descr xe_lpd_gsc_inst_regs[] = {
>>   static const struct __guc_mmio_reg_descr default_global_regs[] = {
>>   	COMMON_BASE_GLOBAL,
>>   	COMMON_GEN9BASE_GLOBAL,
>> +	GEN9_GLOBAL,
>>   };
>>   
>>   static const struct __guc_mmio_reg_descr default_rc_class_regs[] = {
>> -- 
>> 2.39.1
>>

