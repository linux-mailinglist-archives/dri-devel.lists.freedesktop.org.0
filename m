Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC62B7AF9C1
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 06:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12FE10E465;
	Wed, 27 Sep 2023 04:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA9410E464;
 Wed, 27 Sep 2023 04:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695790705; x=1727326705;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ALOIuzbfcy+8OoxTtohjbbuc1+iCTP/uvNq/G86lhlg=;
 b=a+/AwIvHrOdxNv5EpVrANoHUlI9uMraRW82vjAeWdr/DKClCgMwYBbhj
 CRVHzTSeESvd0HDRXdeJxLiR4lf0GnJV/ZYPVB6AWejX1y2q0dnezMJLS
 pn26utbx1SvlQH+OHAxkTuWgyOvtxXu5e6FUaT7NaFZmNCVGv1BogcWs7
 gVeNqLKlB15ixkQMN84Tch8GJ/HXvH4usM9/X2dnsKqZLyHWGBhVIyB+n
 bijx174Yz0/Kxc4OkSjapJevsCSH1Bz7UGzm8uUa/azFW3QriUyIDKkN6
 oulC7yglXMqiehpGHhg1lR1o4id7w8gtintuYAsaU0SR26UulhSdimA0M g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="385586502"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="385586502"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 21:58:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="996033551"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="996033551"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 21:58:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 21:58:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 21:58:23 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 21:58:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kGI5SJACmmNYg8+vnyZ1YgZYYkxPqusGLtXpn8A1mYTTqUL3FWEDKR+E7xd4++K8DXkDZHpnqXTxSV4tUYF2UxdlEqrmNk+69zhKff9jITOB8MKAeFLbtslnYYhSJMzcS2DcRFinQ/AeGSTwmNi/JfQ03FFc/qEbKS4UP5JRlRn9tSbLNha04mcf+QSlEDjW6iEX/jI3Dc4e7i9I0EYbFSRchZ2ve8An+GfEyFaHz0KCs261nyiAQOdZoNKQsjtX6z2O1SLWMky0/Qr8G+GcfR6RET45pz31Nva2Fh1z0D55hQMp8xutQrJOdgrFPp9ExD9Jxx0hHTPxQ0MZ0YM3Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=naX55HUwsgN5R6gkZHbJizcar8YMblhfy/J0ZFTpUPg=;
 b=g6y1G0QDMpwJmA0KaXuck9XG4sU9i5j19UaDh40W1p7OFtAV2XP8N2PEUxn4mIQdTIlukHZVkYdRorGcHr6j2Gci11+LDVCnKmS/V88cK2zQk1iY72DF3V/QveZD2LCwzQm5YFKaOLdS1/1hAkopbWOYqNXOnqmjPuQbRLG7G6H6U5rsDAL/fsr0b6fvpYzJNLe63gNT5qSgAkIGOPTwHWJVy+dfImlriG77yTF44Qn6trsEtf+xuHgqxnNw3OArO5EzV79oQsi/adoS/vgjQARPJAgJA2SEOpu+u0rEOFz+esdsn9flOO0mIQe+YvnrXRwO1srG2o8lWXECeNS14g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by PH8PR11MB6658.namprd11.prod.outlook.com (2603:10b6:510:1c1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.27; Wed, 27 Sep
 2023 04:58:21 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::547b:6763:164a:4283]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::547b:6763:164a:4283%5]) with mapi id 15.20.6813.024; Wed, 27 Sep 2023
 04:58:21 +0000
Message-ID: <be9d6f00-8b23-071c-51e9-62d4164b089b@intel.com>
Date: Wed, 27 Sep 2023 10:28:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Subject: Re: [PATCH 6/6] drm/i915: Implement fdinfo memory stats printing
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20230922134700.235039-1-tvrtko.ursulin@linux.intel.com>
 <20230922134700.235039-7-tvrtko.ursulin@linux.intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20230922134700.235039-7-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0186.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::7) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|PH8PR11MB6658:EE_
X-MS-Office365-Filtering-Correlation-Id: dfcce46d-f169-4b52-a687-08dbbf165f04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FoFGOFY37AjV8CVlmqWhhUMojAZ66R5jJiF4wmG4vrafvggLgewx8WkaNLf4++G/9MrV8ujJ8Jmia4OprPR+Xm4OuENAsnb9qDWshN3NhFNXfxXZrUR1ny/E3otnc7cLoexMKHwQ4sx01DjZTRWsRMycXPJjplK3Mcm5FHRlWRqh/ZrzGW7uZtzkLkusTA4XCY10mRSOUANCUAb4I+IPSdAdr+AcgiZ3mlMX0lYRhx0NxdcJcoh23XHK9MfkVwsN534qMofY4+yABczt5nlaN8au7YFGxi+QNEMhD/zfP1i3dUzvwuvjrkmYkCtXKK5f9VxtdGHpUv1OYBcVOu+9R+nayCua6LAkRZgAZT0PE2T2sKw1Qs1wYM2FoiBLiv8/O0aUCOEx8S2/GhZa59QEKkjZjXoKGEsgV7Kx2ooCFFG5CAsnU8TdQtCQyu+WYGQF07it7XNrlveJPNcx4sxsvibdXAfjr8NOjsl0E162hZ1FyKb19c1xsF9WZl0dG+YiQ98Cy+VylcPwZL3Y71OKl2N/1dL6ECn97j0r4rrj3/lF4NJSx8N6OJ2qMJHawWB/o1qLA57BlDtyunNqESliZ0QO+8/vL4t4lkq/RBAIUVEEYH3PkyiOMFt1ZEEaC4VLMoobjn741NHOjJICMR2g1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(396003)(366004)(376002)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(26005)(6666004)(6486002)(478600001)(2616005)(36756003)(83380400001)(31696002)(86362001)(82960400001)(6506007)(5660300002)(53546011)(38100700002)(6512007)(31686004)(4326008)(8936002)(8676002)(41300700001)(2906002)(54906003)(316002)(66946007)(66476007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dllJZEtGZEJPenpyblNkV09xWkl5U3RMcnhqYUtkWTRZNi96UjVzakFYOWhi?=
 =?utf-8?B?clhGVXVIWEk5VU9LMW5EN1B1cVRiRTBqTUQzZC9MVkdDRWMvZS9SOVhBV25D?=
 =?utf-8?B?RFltOHc5SXgvYThlZDZvY3B6UkJTQzBXenlHcVpNVGZMcE0xRUt2dmIyYUZk?=
 =?utf-8?B?MzNVZ2J5QTBWQVdHRFhnZzZVT3RzR0V4ZHRpdzhVbkFzQjFub09TcFA5U2RR?=
 =?utf-8?B?akY4YnpjdlJoSHRsM3RXcENMb3JCZ2EwdU4wNFB6NWM0dDU1R2lxaVFEWmRH?=
 =?utf-8?B?UUM3cVpGVFEwVjMrUTlVRmh6U1B5bFVnT21xUmNHeVRNMVkyTjEvV1dSWFhY?=
 =?utf-8?B?NVhsRnZSMUNZRUJZQ1FuNjRwYlYyRVh4cGFxWE5PNnRJdmlCTmNyRkpCVGx1?=
 =?utf-8?B?UnFpTUpkMFFONTNLNWlxQW5palVjMnBZWEJpQmpKUFowUWNDRFpINmxxTVcr?=
 =?utf-8?B?MEJKL0hGMEZESG9RaHQrdEo2S1dpcXp3MWNzMG1qa0pCK2hsRjErajNMdjdj?=
 =?utf-8?B?VjZmVUh2SW1ZcUZra1NySnhpZnVYcHhlWEJsMGt4OWZYMlBtYnlvb2Vha01w?=
 =?utf-8?B?ZzFuQTF2ZjJTY2Q5R2dDTDVtWTQ0YzhrV3hQYisxT1M4RDArMFd0MzVVNUYy?=
 =?utf-8?B?dWNDZ1NyTk40N0JqV3NyblpvaFVvdVYxa1JQRzMydTFWUDh4UjlNNkIrMUE3?=
 =?utf-8?B?OHd5bnNpZkZPMCtXZjEzRVlvSmVoa2czQXdXTXVzT3phb3F3aUFUakVhNEIx?=
 =?utf-8?B?b1Q3QWtYQjQwNTdvb2tpWTgvdGVBQXgya2g3K3NSYnVJQTEwUEszbzRxeTF5?=
 =?utf-8?B?ZXZEK294clFaT1FsNG1XY281MmxHaXd0NngzVEVJYWhjaGFUN0U5MHZUMUJL?=
 =?utf-8?B?aWRxV04vVUZUUEJCa3FWVEJXOUFMV3N2cTVtcG5ZOEx0bmJjeUxEdDhGbjJl?=
 =?utf-8?B?OEpDK3pzZnNaUWd5dDNBL2RJUzA1MGRlamJ3aDRkc09XdnQyVEdKZzdKc0xU?=
 =?utf-8?B?dmsyTG9JSzVlWlozOExjZnNScUQraDVBemE2REhYWlo3UlNIMnpLbEtiaTgw?=
 =?utf-8?B?RlFzamJ5dFQvT2gwTTBMSXZmYXBPUlg1em1Mbk1ENWdHbDRUWjY5MCtrQ3gy?=
 =?utf-8?B?NmpWU3haT3BEYXlidWlqeXZSZ0ZWcFV6RWRRWldTL2RJZHBBN3Y4bXRwYWFZ?=
 =?utf-8?B?VUpGY1dpRmR4TkVWVVZ2U0VwUEJlVG01ZktRbEQ1QmJjYkZVTDhJdmVuaklE?=
 =?utf-8?B?SHRSc21teDF0RDYvdytYVi9Pd1dGeVFZeXh1Z0EzcE9pR25jcW9FNGFTelZZ?=
 =?utf-8?B?RzJKazhGQjBUT01NbVM4dkM4YUtSdWdrTnE0ZnpJUmN5TVFmNGtsYytqdlVQ?=
 =?utf-8?B?VHZoUUFYWnBpN3o0d1FRalhRbm9HK1hkbTlvRTFRUUhSbmc1cnl3dVJTdG1G?=
 =?utf-8?B?YW04M2ZQZkR0VzdheU9xZXprZnJxV2oxbmw0TnJqUEU4dkNKbWtHSTgrN0xp?=
 =?utf-8?B?alplSkZod2lCdnB6Mm9qcisxdDVWMjJyUSsxa0VudDltUlVsRHNzcGwwZmtZ?=
 =?utf-8?B?NmRQSjl2RHpDSXRsdG1haEViampKQjRhbHZMOFpVN2EwSkRXNCs4S25tZm1p?=
 =?utf-8?B?RDhIUk9CM1BnZTNESkRYNTJaM2k5cStKeWYyVE13R0JsUDM4a3c1QlBIb28r?=
 =?utf-8?B?K1hCTXhZdzI1SitwY1dWeitYSEJrNThjQVFWQ1hVd1dyQ3M0dXNUQ2NRQVlC?=
 =?utf-8?B?M1ludVN1ekh5bHZzc25yMDNMRkNpY0p0TkRWdUFlOE5wQWluZktzNldkNnNJ?=
 =?utf-8?B?VFh4eS9RTUE0cnZLejlwU1lxdG56Rk9vdkRIMVJZZ1ZuVTF2NXZNZGZ1ZW01?=
 =?utf-8?B?N1ZKT1htdlZONzBUYUFDMlpiMHNqYnJhRkN6Qjg5ODVpT2dZbE1ydFJQRCtq?=
 =?utf-8?B?emhZSzBOc1YrTFgzTFl2VHpoNnlBRVRDN210MU9adEttYWwxTmpOSnFUSlZp?=
 =?utf-8?B?WS9kYVNJMmwxR1R4alEvR0dHVEpGQU12OGlDVVNWTm1MVlVFamhFRHpzYXE2?=
 =?utf-8?B?YjJDYnM3SnBsZG8rUTQ4L1hDZWo4aTZMUExPaU1Qay9IanpzSHp1UDFoSGJH?=
 =?utf-8?B?ZkxsSVJOa0FBZ0xnMVRRQ3M5VzJHalZYaHpGUkRBc2VSZ3JHdUlRaG8vR0Rz?=
 =?utf-8?B?TlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dfcce46d-f169-4b52-a687-08dbbf165f04
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 04:58:21.0840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CFn3ndx1HryepuLaWDVihjdcyiWXdCvZ7pBPC1/ZNqIjnJjkyEtRdig15vNeyFxeuFRxslhUqZ+EVnLng6+mPtI86WdGylRQltxRyEfc8uk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6658
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
Cc: Tejas
 Upadhyay <tejas.upadhyay@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 22-09-2023 19:17, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Use the newly added drm_print_memory_stats helper to show memory
> utilisation of our objects in drm/driver specific fdinfo output.
> 
> To collect the stats we walk the per memory regions object lists
> and accumulate object size into the respective drm_memory_stats
> categories.
> 
> v2:
>  * Only account against the active region.
>  * Use DMA_RESV_USAGE_BOOKKEEP when testing for active. (Tejas)
> 
> v3:
>  * Update commit text. (Aravind)
>  * Update to use memory regions uabi names.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> # v1
> Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com> # v2

Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

Thanks,
Aravind.
> ---
>  drivers/gpu/drm/i915/i915_drm_client.c | 64 ++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
> index a61356012df8..7efffdaa508d 100644
> --- a/drivers/gpu/drm/i915/i915_drm_client.c
> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
> @@ -45,6 +45,68 @@ void __i915_drm_client_free(struct kref *kref)
>  }
>  
>  #ifdef CONFIG_PROC_FS
> +static void
> +obj_meminfo(struct drm_i915_gem_object *obj,
> +	    struct drm_memory_stats stats[INTEL_REGION_UNKNOWN])
> +{
> +	const enum intel_region_id id = obj->mm.region ?
> +					obj->mm.region->id : INTEL_REGION_SMEM;
> +	const u64 sz = obj->base.size;
> +
> +	if (obj->base.handle_count > 1)
> +		stats[id].shared += sz;
> +	else
> +		stats[id].private += sz;
> +
> +	if (i915_gem_object_has_pages(obj)) {
> +		stats[id].resident += sz;
> +
> +		if (!dma_resv_test_signaled(obj->base.resv,
> +					    DMA_RESV_USAGE_BOOKKEEP))
> +			stats[id].active += sz;
> +		else if (i915_gem_object_is_shrinkable(obj) &&
> +			 obj->mm.madv == I915_MADV_DONTNEED)
> +			stats[id].purgeable += sz;
> +	}
> +}
> +
> +static void show_meminfo(struct drm_printer *p, struct drm_file *file)
> +{
> +	struct drm_memory_stats stats[INTEL_REGION_UNKNOWN] = {};
> +	struct drm_i915_file_private *fpriv = file->driver_priv;
> +	struct i915_drm_client *client = fpriv->client;
> +	struct drm_i915_private *i915 = fpriv->i915;
> +	struct drm_i915_gem_object *obj;
> +	struct intel_memory_region *mr;
> +	struct list_head *pos;
> +	unsigned int id;
> +
> +	/* Public objects. */
> +	spin_lock(&file->table_lock);
> +	idr_for_each_entry(&file->object_idr, obj, id)
> +		obj_meminfo(obj, stats);
> +	spin_unlock(&file->table_lock);
> +
> +	/* Internal objects. */
> +	rcu_read_lock();
> +	list_for_each_rcu(pos, &client->objects_list) {
> +		obj = i915_gem_object_get_rcu(list_entry(pos, typeof(*obj),
> +							 client_link));
> +		if (!obj)
> +			continue;
> +		obj_meminfo(obj, stats);
> +		i915_gem_object_put(obj);
> +	}
> +	rcu_read_unlock();
> +
> +	for_each_memory_region(mr, i915, id)
> +		drm_print_memory_stats(p,
> +				       &stats[id],
> +				       DRM_GEM_OBJECT_RESIDENT |
> +				       DRM_GEM_OBJECT_PURGEABLE,
> +				       mr->uabi_name);
> +}
> +
>  static const char * const uabi_class_names[] = {
>  	[I915_ENGINE_CLASS_RENDER] = "render",
>  	[I915_ENGINE_CLASS_COPY] = "copy",
> @@ -106,6 +168,8 @@ void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
>  	 * ******************************************************************
>  	 */
>  
> +	show_meminfo(p, file);
> +
>  	if (GRAPHICS_VER(i915) < 8)
>  		return;
>  
