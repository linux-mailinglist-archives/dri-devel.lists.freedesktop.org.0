Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A93457C5DB
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 10:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814932B222;
	Thu, 21 Jul 2022 08:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE14B2B08B;
 Thu, 21 Jul 2022 08:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658391000; x=1689927000;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oHN64mkeDS8xOwMvYqz9RpRSwbmLI2csxxw/dLUM6fI=;
 b=g6XTG9MlGRrCv+EZg2MDCQ0ZCRE8P/jpQnUIO0uN98RJRDtWRKPAdmsz
 KDRs6M0RYrz6NlbAestMUDqpTbGpcaBumlA7vGeBzPNf9nwLPK4Zk0Ju2
 mEzh9TO36UP+Sk0DvKcw3p7u0wBkASHgULJf+0Rw7mzJnBQ/Dfkk/l9kz
 mzl4eTL0Wk1BoVSzuJWERFm68r46idYRTkX3D5GikN0jUx+/MQ+tYtT6a
 lameS9GnsHKF4GOm16ykYn0myMhLezdww0PlQJj/YBbSnu1rxILCGZe8L
 UHORcbr0hhjx/tSjL52dzLy+U37yZgiut6c8oFy/9NVthQEJwcMcTrEcR g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="348678140"
X-IronPort-AV: E=Sophos;i="5.92,289,1650956400"; d="scan'208";a="348678140"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2022 01:09:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,289,1650956400"; d="scan'208";a="925557717"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 21 Jul 2022 01:09:57 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 21 Jul 2022 01:09:56 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 21 Jul 2022 01:09:56 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 21 Jul 2022 01:09:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Laz4ukY5v+EhtbMVbSmso1THN5LmZa/KWp9iaMJsGxOMW/2E/W07TDHzTrHKNC3yAPbRLLt/wPahVqjkodBjRj7nf2Es43oJWdvZybL6txXNpkG7b5ii9LCb9Pp+kr0aPXvOdDtFxuGo25u/YJvEKEgH5c9K8GajmmENf8fIm5X05xKwYirmKI7Kg3tnQ9zPssAvB8xGKbAVdJQZ/Hp1U60L5i4wJMrYttMMg4oXS5oxQWelM6COh82jaB6f/BvcQmlj5ccBu7lUhoRqHBltNDJx/5amr9V1QAe4K0sM/1ho8ISbUJM01Z1lmlWaR3RTSTaz7V214AWX9w7HT+l7iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrMLKx+YU7TXY60ylcyu00P3IPrc72pdsKl86DEhVf0=;
 b=fO6XxipzkXUTI8B6HzDOTyOoUtCNxFVwdaL/Z2pIDtxDoS24Sf7xR7y/DnHFEf5ZfL7VkkGM6HviEtKHb6TEBjqblfLud4ZTsSHK3M0LUe2zE4Dod5NALJaYOWInFlPtCTvS2a0RLE/H2lhWMH5tsmmUcBQpbjDjTeVqYkfn6CxNge0JQeXyBQFYvgCN1x5x6Xw8122uuVw57N9Db6UKZUhnk8/nxcL8fg2sP4eZ1YoxxrhByBx+Pm9xvK5Thti+SyNhPZ7pcmsAUiReN+hEUyKAOAEcd8K+IBWHA4veVoF67a+ign3ys/k5c9beFrhTN2QSYhsDdv/XdzMt+DlC1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4626.namprd11.prod.outlook.com (2603:10b6:5:2a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Thu, 21 Jul
 2022 08:09:55 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%5]) with mapi id 15.20.5458.018; Thu, 21 Jul 2022
 08:09:55 +0000
Date: Thu, 21 Jul 2022 04:09:50 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jason Wang <wangborong@cdjrlc.com>
Subject: Re: [PATCH] drm/i915/gt: Remove unneeded semicolon
Message-ID: <YtkJzu7vKunsqI6G@intel.com>
References: <20220716184439.72056-1-wangborong@cdjrlc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220716184439.72056-1-wangborong@cdjrlc.com>
X-ClientProxiedBy: SJ0PR13CA0217.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::12) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ece0f9e5-41a8-4099-0ab2-08da6af0653d
X-MS-TrafficTypeDiagnostic: DM6PR11MB4626:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oH2kp/Ejw3vb/9utdsMsQBCfY/53APL5ACnn2h2AdjXS+38ve+s250uO8INJ5q2P4gEBERxzc7yP69DAR1rHEVbHDNxGqdXdyzEDP6vsQt+RN1QnOsc2cH1jjHaHbXvL6ABbg7BbWTsdF58xGiY8mVWYx0bpxgFCnlGjYmhE3+1TMG4YIOMvWPMZWgfBmmhCaMy4VFDxYbq2aushnAJiPxW0rpxu8+ySS8CjtJIEt30ZkElk2X0HHzpLvv475FhSae6RfgP3m23s9dpML8ldf6L5aAIUSORiX3eBVucKtHaxYlVuxXEebpGZ1nK7UBcv+k1MHxxThRBf/39msnIld28WYmPqmK85az02nNE9knt+clXI1iuZ+4qV61yPc4qg6/gNAqgw5VUla5Q8+DBsB/5BPi+yqdx4UIQiPETUXM69hLwfuN71YTkl3AyKqpcmf7Nh6qOWBA8NF5Xo/DdQ3Jc2A+Ao92h4HG9RLlU7reTCCMPhIsMYeLASfF6XbIzjm/7sEYPc1wRoanEvqDDWTii6zmomK0bXcsqOdY/174oCHnxs1Vw3+7R9H/0NDAHCIcX5yv1g5EWqeSkBKO4jAJutXTB6kWJERcwauS4K0MbhR+ESiIssoHU6QD9egx7SyvwfGZws9rkr2SKtY6CiWHzMxVp54OFvwZt5YJ19KwJ70wmOrkIMbOtCf49QkdepVdGnL381iyRrpueweR4ReoGzAqQa7Qt9Ks2Ror6SoAbZOA7lqvcmYsbAc0HpylTQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(39860400002)(396003)(136003)(366004)(346002)(83380400001)(186003)(2616005)(6666004)(36756003)(82960400001)(38100700002)(6486002)(4326008)(26005)(6512007)(8676002)(6506007)(66476007)(66556008)(66946007)(478600001)(316002)(41300700001)(86362001)(5660300002)(2906002)(6916009)(8936002)(4744005)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nrpGY8FzPCYjtRIAZbRGH/ftFkVlCQFpEuCS+71CxbRgggcx20vkqZZ//kmP?=
 =?us-ascii?Q?v18gmLQ8xr8+b7ztckwxp52+J5FgMxuMMZV13WiYwpDBU4XzZGD/ENxaXAA3?=
 =?us-ascii?Q?KTTLMMJLLpZFMYieTUbeOXwEhZvLPHpj00S2/Qndcs+FwzhvY1cRWVvQQ9kn?=
 =?us-ascii?Q?VAJo2oObGOmODKI1UUiN3/z0p2HMAln/r66Tz7vcTKVZljIfMlbboN9LuGEn?=
 =?us-ascii?Q?JKJqrbO+aW11JWVPkC8K9ia9h7jKLfJoQCjNEraOMNt7aqLDEoek+IU36raL?=
 =?us-ascii?Q?0jiI3RLgNn+acnoxcUw4Q+Sw0n+Xzri1npBcZprRF7RJZaFygJwt83+LaWCU?=
 =?us-ascii?Q?9V6Aqluwduxuslk+t4nZSDwxQibuzCy8H/PXdkbpHcJKzwD2I0n0CykWbxkm?=
 =?us-ascii?Q?eXc/x12IejLhf5o32IRrANQDZ8/hQ+vLZSKFEYNw/fYqQgAEU79jOOojhGkW?=
 =?us-ascii?Q?Cj5tsQ9lf7eNBKKa6YhQzmqducf3UfNOIbwSrCZ6OovXttNhcBaR3lgNQbGJ?=
 =?us-ascii?Q?FZ4Y8nxw0EPkrTFtZM9SmdNkXkqcQQIIAs6653CkA+75fszAxAXdQJhbWRBt?=
 =?us-ascii?Q?moM1Ax8IFLVRMnj+i5d5IgtIMTgXT9n2jba2bnkEwXURcJRt8xJ5T/kZti5L?=
 =?us-ascii?Q?7X27rb6JG120RnmrtWYFctw3iwyw3w7a2BEHALKaJteOG1Qe+9Co+QoZlpJV?=
 =?us-ascii?Q?ibnQJaqalrcdvWIDP9xa3Jj38QttdWgGcs63pjlw+MyB43mv2kNcbr0nyWYm?=
 =?us-ascii?Q?dgsWMdWTxGfNcaplewF+wN7sDgusBZLIFt8jmKxP7VnTSSGyB9Jm3fHOnGyW?=
 =?us-ascii?Q?yk/hkH3ZvdaY5w272GUmSL+dMbxGAIVBC79Txnf1Qqav9BcknKgLMXY6XiOg?=
 =?us-ascii?Q?+e/oI306Nb0KbF2kdKZe/JFxaaZoygQx6OB3MFMTSJqufxIHfXvc3946U+hD?=
 =?us-ascii?Q?B/GGqxZcotZhpvWHwzitKJkDa/X8cU23s2mMz2i42r7QYtDPeit9h1Nacqg8?=
 =?us-ascii?Q?i+lyXooKOqmIYVNWXhBtoBXev13EeN9Ekaz3udQdk7EKd1CYRcllmDJC2QhJ?=
 =?us-ascii?Q?VVfly336S3jc+gGHzDgTAt8b6xp0fcbEuzUtcd70VULkXsA+uLemf2zjF36a?=
 =?us-ascii?Q?3kt5S0pgpmiVFu6Rg51Jltlyx1vrFjrUatRZPj8RHz6IrBq4wZ9bqJtGWn3l?=
 =?us-ascii?Q?fUEA7xDJlYdJPJ82e5LFUFEEdgxwgWFxCKUaw9gqaKjNaDwhEFJB/FxmxIuM?=
 =?us-ascii?Q?iH2VmGJl5oVIT9aSr/7jaad7aZMN9NvXX6svGU1X3BraULQL671QSXo/XBfI?=
 =?us-ascii?Q?i+yMx/LUDXke4sQps2yLQtzmLEnS/d5Xod4BUXu1iB1G3Kg1y1SB3foEoZZI?=
 =?us-ascii?Q?ICNaGiINIxq04secQT4Bu5TTwRYtkEVSeLix65jejFMm9q5meNTrkz6NKMUz?=
 =?us-ascii?Q?jnpbvniZzvhhCTQbYFZpH1x6pXqMrMZN7u+oFwiyOdQOecTv9nBxdri+TbhP?=
 =?us-ascii?Q?I451lVHVOUo28PD9DAmqQB4GBud8pMe6xN9m5/0NSiYbx1yZixVGXZsyQ9MR?=
 =?us-ascii?Q?3bNXKL+57M1bVLEKzTn2pIiNCBhzWjp+ZVdTaPQ9EYzItue4s28DAB8vJkJQ?=
 =?us-ascii?Q?8w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ece0f9e5-41a8-4099-0ab2-08da6af0653d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 08:09:55.5645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZckaQbTPDRdnzP8rNZSEKcjDhS2XU3rqbQurSPyhernBHEewzwNNidGJ5I6oVgSbAaXq2IB3jtIDYssR+MpNKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4626
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
Cc: tvrtko.ursulin@linux.intel.com, thomas.hellstrom@linux.intel.com,
 airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com, dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 17, 2022 at 02:44:39AM +0800, Jason Wang wrote:
> The semicolon after the `}' in line 648 is unneeded.

I removed the line mention while pushing to drm-intel-gt-next.
Thanks for the patch.

> 
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_migrate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
> index 2c35324b5f68..a69b244f14d0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> @@ -645,7 +645,7 @@ static int scatter_list_length(struct scatterlist *sg)
>  	while (sg && sg_dma_len(sg)) {
>  		len += sg_dma_len(sg);
>  		sg = sg_next(sg);
> -	};
> +	}
>  
>  	return len;
>  }
> -- 
> 2.35.1
> 
