Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D21FB58BE9E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 02:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2689A11B4D0;
	Mon,  8 Aug 2022 00:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E99011B4C4;
 Mon,  8 Aug 2022 00:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659920313; x=1691456313;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DsHp93eiJuHd0GRJL1CjcvIjvz0juBWrw0W59l6bz0c=;
 b=BLnUo15QIXilkA3GMxSupLYv0+DiVdliqipjdezBr3EKsPaizNLECz3E
 OhfsmI55hfOIppDrgMCTSqGC7q/cJmWFTbPzi9o/HyrJR/ZCSMcsKdDfx
 cFGM0JoBQQgNLawKbAl/PuhOK7JWiLMkljWYzcEIF6ULATJEk4ylC98CY
 5uAcnVSmOXDy+e8dc4XDJF3tjQhu3mj3L262bZMynmirliCfO7XkVQW45
 0O7hVtjQGotFpWQkTLdUqnnCEib7F18ncaJ14w8jMX/RgtzZ6VpAASnWc
 RxSP4TnK6fJa8FSSeWK30etYBNP5NpTSl4HOpzTx7H8WxSD574YReJh6R g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10432"; a="291252052"
X-IronPort-AV: E=Sophos;i="5.93,221,1654585200"; d="scan'208";a="291252052"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2022 17:58:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,221,1654585200"; d="scan'208";a="554719703"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga003.jf.intel.com with ESMTP; 07 Aug 2022 17:58:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Sun, 7 Aug 2022 17:58:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Sun, 7 Aug 2022 17:58:32 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Sun, 7 Aug 2022 17:58:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTrKuY4/VR2D27pG9lrZs3l/9m9P+cQiKnp5jgVS7hHa4Agqz3vxL3C3GdeAyffdaY8ht9TiyvlQy8ZnaxA/Ozx1dkJrMxxueDh6RMhN3wV3Ln80THT79DRisqhlY3ZFQjZgCmqvXUTn/7Qm1j/dE+38zO0IujPmJzeN4LuwKrGJ2JIjNhS/KEogWNBPgMNO09FVu6ll1a9ctM2nbDaqEo+cQOFMnY+/UV14UdPv5/7uWFzKniK9hbo25pe71OBFD5+rTld+JRkiUm+l8krVe7efVkRY5DL6WgEl6gX1xdKaeC2wAdnAeRDkTi1Uojd/ck2g1WR3ZKhpxZlTc5v4ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWlxSQg6Yh2dZNzqrEBBsKeOMGUuk0WFF+S0CWPQKNM=;
 b=d0gvxa52Rpt7Evk1Bo/qGvpROn4oHTpj+0uE+WK1JET28KHlGdwqsX4eiH6ygxF6PN9Js8oBLYKSY4z6x2BNJAdJ2hhqR+vhVbNMHTx5JFXECH2gJrrg9ZU6kyQkiw6n6byQCfihKTLUN+rDcXSb7oR5/QEdrPXZ3ecL1ILrV0GbGvA5K6EiZ7fGXlGLFBB2aUltBz7SXzpBPYOIF2HHlBVvbHJQf/KV4UCynh4KSxvgWO5pJnJEGIwPWKvcQURcqJw594/GFrV36CG9LLlZX13dyBxJICDTMqOBTf+9vLB5HzqcoR6nadUM5urv1hlNxvXOdGrOoWLBLVVrlw/hlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6043.namprd11.prod.outlook.com (2603:10b6:8:62::8) by
 PH8PR11MB7046.namprd11.prod.outlook.com (2603:10b6:510:216::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.11; Mon, 8 Aug 2022 00:58:30 +0000
Received: from DM4PR11MB6043.namprd11.prod.outlook.com
 ([fe80::2dd1:3350:86d8:ed93]) by DM4PR11MB6043.namprd11.prod.outlook.com
 ([fe80::2dd1:3350:86d8:ed93%3]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 00:58:30 +0000
Date: Mon, 8 Aug 2022 06:28:39 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 2/2] drm/i915/ttm: fix CCS handling
Message-ID: <YvBfvwN+p1DKCuu8@ramaling-i9x>
References: <20220805132240.442747-1-matthew.auld@intel.com>
 <20220805132240.442747-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220805132240.442747-2-matthew.auld@intel.com>
X-ClientProxiedBy: PN0PR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::20) To DM4PR11MB6043.namprd11.prod.outlook.com
 (2603:10b6:8:62::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fc1756b-6978-4cfb-3536-08da78d91c10
X-MS-TrafficTypeDiagnostic: PH8PR11MB7046:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d6oOcFr+0th6z/XdxNNEOpegXeylu3E3j4O1sw5zdsclbvBXM2K1O6JaSv8Mu37SxAZIxiKRowXg5ONDH3NrLRC3L1uGpjeGULxY3iclSk1O1h/BAy0IizXh3cq37O3av1HXsQa6HCVBDF8geMlySuBcwmwWzWZZdJ3mWXy1EAJym6w0eXNZs2Fc3Xl6VzjiARNatRRdJKSMB48gQPjxIEkQBSHf9pdV53DUPmKDrchtpGf+O1yihfU0CDFLUq+yY56V1e/yPT6HsxjW0VEAHsZtHM4PVXAnmZzyZBMcHkhZMZyLlSgfVxwzk7xzIrwxUPtsa96wy/UPXBOcAQFMDTZY2UQlqExaWVxw8j4DkYM2AkaF//OWNJyZXqfMVk5I/MVSBLHk+KgiEgq9142mcCJ+VilRdW3YD7io1NoKrO3Mpikwnt5x4FnLSzxlC9qnAQu90cOqHJtNEKLxPAoUbzoKE6PIpDZVSz3fameb26UkM99TvJO4t252qZTsRZ7L8NWlDoRJHhmjU1VejWXuzQFJWHxTRp9MnURN03n2sGTuy918Q/ihAnIYiae8ZrzfOkuLRESSq6uSBhyclCTAFQE9XcnScVtcI2un1mUVbJqOiVut50ZfmkwzRr5xA9ST/xzco8+FXMBI3/KAMqX0CRIdPHw5dZxcifg/dEIAlFxKYF59JnWpDq83otiWQUP5n5MUWgZqGl8+Aw/jQQGfrjLA2ot4TC0/7R4BuhYKGYPImCnZhgwTN572XhG9y/+O9GO/DTqB0mOrXygj2w6dznLTkwzq3HCZmbgHzB8681g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6043.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(376002)(366004)(39860400002)(136003)(346002)(396003)(2906002)(82960400001)(33716001)(6506007)(186003)(6486002)(41300700001)(38100700002)(53546011)(478600001)(6862004)(316002)(8936002)(86362001)(8676002)(66476007)(66556008)(4326008)(26005)(66946007)(5660300002)(83380400001)(9686003)(66574015)(6512007)(6636002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUk0N3VIK25PaE1wVnJWNkpJYzNnbzJKT1JTdFovL0NTY0JlWFQzUStNeXg3?=
 =?utf-8?B?M0p1aHlBSVFqUUt5Q2xwK3hDT2psQ1hnUWdxS0VnWkFvNmxYMmo4MlVucW9h?=
 =?utf-8?B?aXkwU3pMOUFJOXE1aDY1UzlEVlFueFpJUmNGWEgvSTBWMzB1N0hpRmtPbHo1?=
 =?utf-8?B?Sm1QTW43NmNYS2hHcmMrOUhIQVdNS1ZHZWFxVjRraE5zZjlGUzhtajRJY1BX?=
 =?utf-8?B?b0J3VWFDS1lhT3pxSUdVMEJCQ1JPeDIyUmdwUmU3K1ZpSHFpV1VvZVR2Sk90?=
 =?utf-8?B?YUpNaWtVK01pWTN1aFE3MzRHTWF1Sm5vam1mcTZ4TnEyVm5wVmdOaUZuM1Bh?=
 =?utf-8?B?WlRvbVhIV0lra1dpeWlUOE5XKzlsUzNkSlhOcXFQb3VnamExczZiQ0tWVE00?=
 =?utf-8?B?c0pnUzIwbkUvc3lxSjdLcmtBRXBFUWFwRGpqbG1UY1NndjdnTHBNcE0vWk1o?=
 =?utf-8?B?aG8xZmNUSitRaTZaN2tBTVVRN3M1WUV6UnVncGR6WmtaT1RseUhmYXFnMDk2?=
 =?utf-8?B?blNQbGtoUnhOY21Pb0NERU5sZjJlZlo5bzhFV2ZQc0FiUmxkQWpsM2JkK0pu?=
 =?utf-8?B?ZFNoZFJzZVpydzEycDZUQkl5WTJ2NklGVEUxUzVwcGQ3di93TmZRRGF0L2E1?=
 =?utf-8?B?SVY4Q29abGhKcHZZcmcrWVZCdUFBRGNna2dBVkYycGhTN1V4c3NSWEJRcEo4?=
 =?utf-8?B?YklXWnZGc0xEL1FWaEEwdnFRRnZOQkNlSGs3QVdteWJUYXZnSG0reU9BSXJx?=
 =?utf-8?B?QnBMb3ZBMFFMTFVyZUs2TUVTUVRxTjE2dmNLZTNkNUVGbUhFZFl1OTh3aW0r?=
 =?utf-8?B?ZlMybkVXS2ZQM25RLzlmajkyazNobDdpbjYwVzRBeXpUZDMvb2VWS3RsUExo?=
 =?utf-8?B?TlN6dmhmVk9ibm9vQldEV1VQeUVMVy83KzZUWEw5VHEzSnJQdkhZTWppUUQr?=
 =?utf-8?B?QjN1OGhycVlxcWlXL0pob205RUNBcmVyQ0o2Q0ZhMzNSSVF5bXlpcWtpLzcy?=
 =?utf-8?B?WndjbHhHY3NmKzZ2S2l5QmF2Smh5SGtJN1Q0Y3BWTXdhOTBxU1V5cmhSY2Z5?=
 =?utf-8?B?Z0lUekc1QzFHcDg0MFI2K21MMHd0SVhCNmRYMEJtVVFiSDk4M2p0bkc4Y1Ji?=
 =?utf-8?B?M1pHNjVBQ05VSk5QVjA2Q3ppcTFMUzRFS1lvQ0Z0Ym9ZOE8vaHc0QUdMRGxR?=
 =?utf-8?B?cDFGUHdLSjRidDdZVnlOYzltb2hqY1JZeFlucFduYnYvcU9DVlgvbEtHWnN6?=
 =?utf-8?B?SFNrUXpMRXVZem4ySmZtQ1doWjdndjBkSFJEbkw0Zk1qNjU0S2RKQTNqVzBY?=
 =?utf-8?B?L3U5Tml4MEdKWEFKZ2hyRnJrNk5TeWRYVDBWQ3dZZG9HRVVqbkdsenRXMzdw?=
 =?utf-8?B?eUo1T0NQWkNwejlRbnYxSFkvL1pZSlhHcUpIN3EzNWx5ekRmNVBEczRiVEVW?=
 =?utf-8?B?YS9EcFMxaGc0OWo4MjBjZzh6ZGU5Y2dYYzFUOEpxdEpEdnU0eVNLY052OWdx?=
 =?utf-8?B?MEthK3A3T01MWVRNRkx0NTVtSlhzc2Rpd0gvYmFMbWVMaCt2WjlPSllyK1dm?=
 =?utf-8?B?QWZWc2RKaVlJT0ZRUzhnK21ONnF5d2hld3lvRzAwMGFPL09KMUtwY243MlRa?=
 =?utf-8?B?TGpnMk04OS9CZS9DVUV6bHdlZmpPZVhKcXdrK0tmaGxsbWVGZW42R01PYTdv?=
 =?utf-8?B?MjFMRHdkaTd1NnNvZ0dGakRlQmNKdmJ3UDV3UldQS1BIaVBYTy85RkQwaTZT?=
 =?utf-8?B?MENlQk9QNjMyQW9CVUkvVW4ySytBek9ueEpMMzhpZTlabUVqQWo5MGlvNG5E?=
 =?utf-8?B?LzRSc0pneENTcWtmbmltcnJjcHVhMFAxbE55bG5zTHZuZFFjVzFuQTJZbUJZ?=
 =?utf-8?B?cERydjhnTjYrNk1YYVVJNEpRR21FZm1IVXYxYU1UL0tYTTJkNHphanNGZlJY?=
 =?utf-8?B?dFQ2TTF4eVY3b0NEd1hSaGFaenpyNHJ3ZEJPeHVZUmcwcnYvMWtDajhEanYw?=
 =?utf-8?B?ampoU0duQTMxKzQrdzlwekdNcEFGZ3huTGUxb0RjTHBVZ2NvWldndGtyQUpD?=
 =?utf-8?B?dm1aUndNVGlOK0ZvT3U1c3A4OUdYdTRCNHphS1A5TTF1ZEZPd3hjRkw1Y3dt?=
 =?utf-8?Q?Xd9/W9qvAjXmgc1u2Yx/LujIE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fc1756b-6978-4cfb-3536-08da78d91c10
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6043.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 00:58:30.1969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X1//kpWytrvEso8f1yBkF/RN9xp3pwdO8e0Nu/LbZelNrmcfj2yl60bNZk/iPrSza6YC4UovB89/Use8ZcbIyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7046
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
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-08-05 at 14:22:40 +0100, Matthew Auld wrote:
> Crucible + recent Mesa seems to sometimes hit:
> 
> GEM_BUG_ON(num_ccs_blks > NUM_CCS_BLKS_PER_XFER)
> 
> And it looks like we can also trigger this with gem_lmem_swapping, if we
> modify the test to use slightly larger object sizes.
> 
> Looking closer it looks like we have the following issues in
> migrate_copy():
> 
>   - We are using plain integer in various places, which we can easily overflow
>     with a large object.
> 
>   - We pass the entire object size (when the src is lmem) into
>     emit_pte() and then try to copy it, which doesn't work, since we
>     only have a few fixed sized windows in which to map the pages and
>     perform the copy. With an object > 8M we therefore aren't properly
>     copying the pages. And then with an object > 64M we trigger the
>     GEM_BUG_ON(num_ccs_blks > NUM_CCS_BLKS_PER_XFER).
> 
> So it looks like our copy handling for any object > 8M (which is our
> CHUNK_SZ) is currently broken on DG2.
> 
> Fixes: da0595ae91da ("drm/i915/migrate: Evict and restore the flatccs capable lmem obj")
> Testcase: igt@gem_lmem_swapping@basic-big
> Testcase: igt@gem_lmem_swapping@verify-ccs-big
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_migrate.c | 44 ++++++++++++-------------
>  1 file changed, 21 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
> index 1bbed7aa436a..aaaf1906026c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> @@ -609,9 +609,9 @@ static int emit_copy(struct i915_request *rq,
>  	return 0;
>  }
>  
> -static int scatter_list_length(struct scatterlist *sg)
> +static u64 scatter_list_length(struct scatterlist *sg)
>  {
> -	int len = 0;
> +	u64 len = 0;
>  
>  	while (sg && sg_dma_len(sg)) {
>  		len += sg_dma_len(sg);
> @@ -621,28 +621,26 @@ static int scatter_list_length(struct scatterlist *sg)
>  	return len;
>  }
>  
> -static void
> +static int
>  calculate_chunk_sz(struct drm_i915_private *i915, bool src_is_lmem,
> -		   int *src_sz, u32 bytes_to_cpy, u32 ccs_bytes_to_cpy)
> +		   u64 bytes_to_cpy, u64 ccs_bytes_to_cpy)
>  {
> -	if (ccs_bytes_to_cpy) {
> -		if (!src_is_lmem)
> -			/*
> -			 * When CHUNK_SZ is passed all the pages upto CHUNK_SZ
> -			 * will be taken for the blt. in Flat-ccs supported
> -			 * platform Smem obj will have more pages than required
> -			 * for main meory hence limit it to the required size
> -			 * for main memory
> -			 */
> -			*src_sz = min_t(int, bytes_to_cpy, CHUNK_SZ);
> -	} else { /* ccs handling is not required */
> -		*src_sz = CHUNK_SZ;
> -	}
> +	if (ccs_bytes_to_cpy && !src_is_lmem)
Yes this is needed for ccs copy of an obj of >8M from lmem to smem.

Reviewed-by: Ramalingam C<ramalingam.c@intel.com>
> +		/*
> +		 * When CHUNK_SZ is passed all the pages upto CHUNK_SZ
> +		 * will be taken for the blt. in Flat-ccs supported
> +		 * platform Smem obj will have more pages than required
> +		 * for main meory hence limit it to the required size
> +		 * for main memory
> +		 */
> +		return min_t(u64, bytes_to_cpy, CHUNK_SZ);
> +	else
> +		return CHUNK_SZ;
>  }
>  
> -static void get_ccs_sg_sgt(struct sgt_dma *it, u32 bytes_to_cpy)
> +static void get_ccs_sg_sgt(struct sgt_dma *it, u64 bytes_to_cpy)
>  {
> -	u32 len;
> +	u64 len;
>  
>  	do {
>  		GEM_BUG_ON(!it->sg || !sg_dma_len(it->sg));
> @@ -673,12 +671,12 @@ intel_context_migrate_copy(struct intel_context *ce,
>  {
>  	struct sgt_dma it_src = sg_sgt(src), it_dst = sg_sgt(dst), it_ccs;
>  	struct drm_i915_private *i915 = ce->engine->i915;
> -	u32 ccs_bytes_to_cpy = 0, bytes_to_cpy;
> +	u64 ccs_bytes_to_cpy = 0, bytes_to_cpy;
>  	enum i915_cache_level ccs_cache_level;
>  	u32 src_offset, dst_offset;
>  	u8 src_access, dst_access;
>  	struct i915_request *rq;
> -	int src_sz, dst_sz;
> +	u64 src_sz, dst_sz;
>  	bool ccs_is_src, overwrite_ccs;
>  	int err;
>  
> @@ -761,8 +759,8 @@ intel_context_migrate_copy(struct intel_context *ce,
>  		if (err)
>  			goto out_rq;
>  
> -		calculate_chunk_sz(i915, src_is_lmem, &src_sz,
> -				   bytes_to_cpy, ccs_bytes_to_cpy);
> +		src_sz = calculate_chunk_sz(i915, src_is_lmem,
> +					    bytes_to_cpy, ccs_bytes_to_cpy);
>  
>  		len = emit_pte(rq, &it_src, src_cache_level, src_is_lmem,
>  			       src_offset, src_sz);
> -- 
> 2.37.1
> 
