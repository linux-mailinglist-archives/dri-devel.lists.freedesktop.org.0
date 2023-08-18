Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B06427812B3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 20:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E115210E55B;
	Fri, 18 Aug 2023 18:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8092310E55B;
 Fri, 18 Aug 2023 18:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692382622; x=1723918622;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DmIdSx9wgvDX6Xh8SgZIDHx++X5UdnVw8Krd9mU6KTs=;
 b=T5Q70FcYIzpLDzrvT/bcUZdmsGLAJcNnK47LzyLHIRpIcEkX8z7ry+G1
 9YbjP5IkVfWMar2O5LYLVqu/lAd7w+vnouMg2zTHZDsZwPh4aD5Rj9Op+
 uJX1P/zWVqzq5J9rSXqV5/yZLMhR1lD42HJVHOMz87Zk+SbDao+g4Br6r
 IQQh0ZgGR+S0KQ5TaXEIxBj57nUQT1DCUnzP2QygjN35rJbFZ00haK6+c
 I1QLSerKkW4OrZEgdRwAAHSA+fahxVROuco6pOOZynJt+LmN0oXCiw4KA
 Vhz/i4gk14rZfmDlxI1RRtJGU3nSKtYyaS8fMU8cXmbA8QeiN+vRHewHj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="358139782"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="358139782"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 11:17:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="770210393"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="770210393"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 18 Aug 2023 11:16:58 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 11:16:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 11:16:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 18 Aug 2023 11:16:57 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 18 Aug 2023 11:16:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGakqK0btlqBM52EkUBKaa5Db0xqFFJtyZQQdBmnJTd3fGDfTL+4SvTMSufQK0zcxsOlIhx1WqLepTB/DJ/BwlxtCImOUyg/EHNlYvpaV8lfv0u9KmmyutLYwcSZ+4PtMcUvRwdtdpKUW2CbpWjjYwjbBCl3KClwGzCPRpqtM4fTHewDX+2JZ3jq29qfBvtlwhZWylCgYEnwBvmYF92c/zBPyrMItpUjrJBnl7jOOAVyM2/jkZW0/b+9jXS3hqJlYbpf/XDWQT9IPMmnmiQH9as+MN8kRo4xCmaNTYriOdtc3sZPJgpYSmHfsjYJIKdJtrke8ZciH7PCKOrGOUhywQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/W76QAPOqngrtCXOKff6XAv/B5OiQtWPCckJx9vs/+g=;
 b=ly32TcWhiOOKFJtGwcRA2JEPoRrfi5J2dEQ4107Fz597AHOJ++O6hr9YDDPNZQ3FZB7/zJMXWRQ2cmGcibaGT4nF/PpPprGbojl7c7mUB92AUkkWxMniouiR5UkIdGaCK5tbgmgMPA7eiEaPVXFKWqOQTiUiQL/HsMlWXybfCG0D86MlHb22GR4TZ4Vl7XDEW7lTE63nmOmQExM3WqWfRwjb2FhMVwO5HwBfOKh5ZgJOXhosd49MJCFt8FcxLtZh/OKZN3zsu/a8GsOw0vRoX5rPB7VSX+tzkB8ebbb7ZSmMANOFtkRwk4APjl3XYkqR7YO33aGvJgwE7VfX9lbqLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4801.namprd11.prod.outlook.com (2603:10b6:303:9c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 18:16:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69%5]) with mapi id 15.20.6678.031; Fri, 18 Aug 2023
 18:16:55 +0000
Date: Fri, 18 Aug 2023 18:15:56 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 1/4] drm/xe/vm: Use onion unwind for
 xe_vma_userptr_pin_pages()
Message-ID: <ZN+1XHK+3/43k/me@DUT025-TGLU.fm.intel.com>
References: <20230818150845.96679-1-thomas.hellstrom@linux.intel.com>
 <20230818150845.96679-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230818150845.96679-2-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4801:EE_
X-MS-Office365-Filtering-Correlation-Id: 43d24f23-6ac3-4363-ba11-08dba0174da9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fChb6tVOxnMGVRYfHqlUIp8m99n4UP7OK8NqErNUBHZZQOY+bZWeIhcrQp/9yDw5MVkZWrWIZCH79JKmjhUieI2r8ERVNo14ePjqBnuK7YUmDwOpVGJPTi9O+D1wpCM4YAC9dImH+TzbPjdnI67Ekgk1s3DHsfPBNa0+NhrwUIMSMRJKIzfXO4+B4fcSCGTPiCH+Luh7N7sRlh+GqPmFfJhIhlCja2F6tQATxEb4UeJC9JAK8Zju3Q/pYeOQxxvzbxY9AlwWC81RQpTm1qfAHzFpdzBtHcmX+oJ9keL0hZd5wmBHc9ZoADLMvtlIPeNJEqViOFgrZWNlejNQcqZD3b0RiIkH0gL/G/l2wZnIrr/1OsayKOG6GQ0U6XrjTiukjmQ7SYDHPDk7kF9LCyqaH8k4nbs1gvaVhctPoeqCODjUDchO+PVp0kXMBtiWteExCDYzS8QZ5yFOyB3fnrHOEDVUsa1nzPmw30KleHHPJfbOwZQPFPa96x8MQcangCrfNn4tfX+7z7EcnBVhBbjDZegThPUeHn5qClKvpRxNwOpKV6eqW1t5tVYZxK9x4dCO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(396003)(39860400002)(366004)(186009)(1800799009)(451199024)(6486002)(6506007)(38100700002)(6512007)(82960400001)(26005)(83380400001)(86362001)(2906002)(66556008)(54906003)(316002)(6916009)(66476007)(66946007)(41300700001)(44832011)(5660300002)(8676002)(4326008)(8936002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vcmP1unISCS0G0IMb+3R/DBsT603c0lrshPWVQRm7evDDsJifEOQCQcD56?=
 =?iso-8859-1?Q?09225ueH1xzTUkWk04gFslFHOKlDkMZaToHlPtZyXtcgQlqsSAINMPrIyr?=
 =?iso-8859-1?Q?XV2imekoCvySgDkFo+Asxd+llx7b3Dv9QtsBfFYjv/yqlCrEAsAR2nxKX7?=
 =?iso-8859-1?Q?SaZB+eHVBXwKkW3wELTsJxcKgJ8UPOBthnx7DE3AjKsRoYzJN2VKEWmeVj?=
 =?iso-8859-1?Q?USs3HIguyt2KLySxRbr4ct/gcrO16SFPNk8kbiBinclI3IT3JPUJzRazIx?=
 =?iso-8859-1?Q?OrGE0Dg0rshjWAqsyMYxQy6PUUUsL4S8BHgVkUg4XvQsjCxC0Mk2E/QxVF?=
 =?iso-8859-1?Q?LsQsoY7BI63zeA+PBz8DAVFR/xOwyWqAICubpg8JBFl+m1Op6PYbF0Uwo8?=
 =?iso-8859-1?Q?+EiXBMy+gfdcqA3J12k05c/vr1eqV1IW3EPIZCCU2OC2jv4zDHvhveoArE?=
 =?iso-8859-1?Q?Al8IRSb8/xxi377kVx4rKz04jzzU0CXosmqHZV4QB6Z1SPS/aXDjk73GGz?=
 =?iso-8859-1?Q?pateL6YpQHDcuN831sawagpH8f4BH2teSWQ0lIpNEF5DQDGpBZUmcKPzHD?=
 =?iso-8859-1?Q?Y5/S6NLZXhG1nJiwtaJ+InQjnzWD0wcP18idckXcg1tuQ21QGMlMVcvywp?=
 =?iso-8859-1?Q?twONLJg5VmiX31yR1yFGVNQgVSqbRPbmwijgNXpo79EfActvewgj97z5j4?=
 =?iso-8859-1?Q?uCnHa5nu0DpNOz+WyKVHrkxbfPtjvSS+P8pc57WkMJhi/AoUr1mL3rwnwh?=
 =?iso-8859-1?Q?6S/m42V+pbGuQsb0vlNR0B0kNEyb2mbt88JifieVEtsohrq1NhP4frVc/h?=
 =?iso-8859-1?Q?XisbORTkvuaqtcpcNNkIqVzdVdx+N/WwhhzfhEhz8NNImErdpIyMa5zrwG?=
 =?iso-8859-1?Q?lSfDvum5u7a2dVNCIphuBdwwi2qIWzdtIUjOwOCplIQh4ffBiSLFiLmLhv?=
 =?iso-8859-1?Q?wPxVLjTHXnCnXLrj/wMk3hRoa38N4Y9SSndZ7vfZUoTN2JFj2OZ58UKMKC?=
 =?iso-8859-1?Q?OwA/YZcgnfmDYLcFnFos3bSmY7syw5IeOp3W+JTclU2lMXFTIF6x4GD9G/?=
 =?iso-8859-1?Q?l4FTHDeTNbZpGYwnPLLVSKa98c/r85TFA7Los6Uk5JLftkctDXpGTgEag1?=
 =?iso-8859-1?Q?4xLBGNIEAfKOj+0UUe4Of/eu5envqXEZPkM/FrYYsxMOrFQXc9I6/Iu079?=
 =?iso-8859-1?Q?yTtcs9jiHAYyQa3uQB0EGSI8cMVozEsI4JHF/nIwemT5GwV6cPQzxH/nEX?=
 =?iso-8859-1?Q?6lcV0+at1FZp3uAgngMbezflC0KG65iOISCaNr5TGNlFfDotLJI2I4+Bl6?=
 =?iso-8859-1?Q?uCxp4kBAnq7UZhUHytgmzh4I7okIXkJF5MO9aa1bXNKc6WAYWzPNHXp8Qv?=
 =?iso-8859-1?Q?kGDj/tCrqUXa/4ElJmvwaXe702FscOyuSgrQHeQGg2KIE94gc3udEU8xRh?=
 =?iso-8859-1?Q?d60RJHKkXcB+Rin43A2LHF5/ub5QpJQPcWND5f4tjSHW6m4Rwp//CJYoIR?=
 =?iso-8859-1?Q?HuzsNw+KxkfdiFGfzW8dlpdb1ZK3Nv7GPXZ76KsWMqIEu2X4mXFP2Bulpm?=
 =?iso-8859-1?Q?sNwsYOaJZIFiHHmYj3zLcVFslqi+Nhlw9PHaR7rj83Aez4ZcBIIr/cQDdJ?=
 =?iso-8859-1?Q?O15r1PbB57LAELsGcsb2j7ia5sjQ9OCEWOG8jjtk/C+cyLhLXrQ3at0Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43d24f23-6ac3-4363-ba11-08dba0174da9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 18:16:55.2035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zHNhfGCigOV7hhG5aJtOQdRG61PULSOzgPrxedGLm+EkudHkBRzNeqjfRe2+yE+Y3SnwrXp8TzcNb3M/aGqIyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4801
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
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 18, 2023 at 05:08:42PM +0200, Thomas Hellström wrote:
> Use onion error unwind since that makes the function easier to read
> and extend. No functional change.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 37 +++++++++++++++++++------------------
>  1 file changed, 19 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2e99f865d7ec..8bf7f62e6548 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -116,19 +116,17 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>  		kthread_unuse_mm(vma->userptr.notifier.mm);
>  		mmput(vma->userptr.notifier.mm);
>  	}
> -mm_closed:
>  	if (ret)
> -		goto out;
> +		goto out_release_pages;
>  
>  	ret = sg_alloc_table_from_pages_segment(&vma->userptr.sgt, pages,
>  						pinned, 0,
>  						(u64)pinned << PAGE_SHIFT,
>  						xe_sg_segment_size(xe->drm.dev),
>  						GFP_KERNEL);
> -	if (ret) {
> -		vma->userptr.sg = NULL;
> -		goto out;
> -	}
> +	if (ret)
> +		goto out_release_pages;
> +
>  	vma->userptr.sg = &vma->userptr.sgt;
>  
>  	ret = dma_map_sgtable(xe->drm.dev, vma->userptr.sg,
> @@ -136,11 +134,8 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>  			      DMA_BIDIRECTIONAL,
>  			      DMA_ATTR_SKIP_CPU_SYNC |
>  			      DMA_ATTR_NO_KERNEL_MAPPING);
> -	if (ret) {
> -		sg_free_table(vma->userptr.sg);
> -		vma->userptr.sg = NULL;
> -		goto out;
> -	}
> +	if (ret)
> +		goto out_free_sg;
>  
>  	for (i = 0; i < pinned; ++i) {
>  		if (!read_only) {
> @@ -152,17 +147,23 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>  		mark_page_accessed(pages[i]);
>  	}
>  
> -out:
>  	release_pages(pages, pinned);
>  	kvfree(pages);
>  
> -	if (!(ret < 0)) {
> -		vma->userptr.notifier_seq = notifier_seq;
> -		if (xe_vma_userptr_check_repin(vma) == -EAGAIN)
> -			goto retry;
> -	}
> +	vma->userptr.notifier_seq = notifier_seq;
> +	if (xe_vma_userptr_check_repin(vma) == -EAGAIN)
> +		goto retry;
> +
> +	return 0;
>  
> -	return ret < 0 ? ret : 0;
> +out_free_sg:
> +	sg_free_table(vma->userptr.sg);
> +	vma->userptr.sg = NULL;
> +out_release_pages:
> +	release_pages(pages, pinned);
> +mm_closed:
> +	kvfree(pages);
> +	return ret;
>  }
>  
>  static bool preempt_fences_waiting(struct xe_vm *vm)
> -- 
> 2.41.0
> 
