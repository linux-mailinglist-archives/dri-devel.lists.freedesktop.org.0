Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BE96F468E
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 17:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C5E10E586;
	Tue,  2 May 2023 15:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBAA110E57F;
 Tue,  2 May 2023 15:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683039750; x=1714575750;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Oc4NutQwFA3eDZakhUQLlv4WAM5RRq52FkmscQF/Yvo=;
 b=lTcDkAt0Ss9+4KD+ZdTvqZME7WVyz3Piz7No+RbqQbdfrJu1/XhlkOAC
 dAg0MwGsAy5sxuaotj97Xgm5tctYQfuBd2sgGrRSGJU4GkBOMxUtmCIc5
 NNUwiLOHXzCADgrP0NNd4NgkWWLBEqz/1OTcKzBM3ilWvyNA0/qzU9xRU
 FRXDzhS5lFKt5c8yM768M3ePtny6bQ2AwD0YBlOyMay0wvDW2ul8iAzxA
 dn6xRT73+76gUvuESdQ4Z1WSBikGXXsfKBDS+4u/c4b8/gVuMk+/2Ixij
 Cz6jd22953Bt2NnZjfHcbp7xsvJ07MoWkXjulYOu7Om4n3eCu3DqDqgA4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="345897095"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="345897095"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 08:01:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="646566378"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="646566378"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 02 May 2023 08:01:54 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 2 May 2023 08:01:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 2 May 2023 08:01:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 2 May 2023 08:01:53 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 2 May 2023 08:01:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H9jsmcbbRaqrk2Hn/eKAI/eRWTeC0owFbar03PM6b+zLYcZBIeOqaD9guYcUK6O968Z1rfcNjONB9Ap5t1AuLSJXyZCzrbRFpWv7HmRqOthsdei4mJov6KWPNryuDagcc9tDmTniRpRNFmd1VLpAtcNwqHHVmg18serrkKiMZCAKLYkuUqCJQHgJyr4LGZO3+t9DMEvKvYAIgGkeKZegwmn3yfWPdalTJ5HY5fGfMSx7MXxg1gaKqGQdnkQgJVwHkAQ96BjEIalwcMjLlMYcYhUinKnS1fVy4Yrcy+yMoQeg5qENewP1ixGApCzS51JkLhrbMBslc9nVqcruuEBgSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSuFVLHyDA6Mj8bnIi3j1CrVKNd9b00REIY6HY6szYE=;
 b=IKLF9yW7wweVHmg7XPd3xxmEAJHEbvJbb/DZwvOLVBd3boZukl4EfgPGQn9trCBAGX1FS1NQqVvnCrqXp0Oh0NGhGUwCRpnAC0oAFBPruS+vOAHRiS9PODvGgz7S9TDJitwC6TpCfthcX2cFr/Ct6fnRL1R6GBuP0sT6hD81a3RS64peXtH8TSFmJSIzVOm7MhwYB3Az16+d7Iz+gEPWm4IDME4ruWh1+wgxMyJH78DeBj3gTSxxnObqsN9akucCCj9PF8PSsmzCXWDt5ru1B75MZsmCAUBduw3HN/XROlq8t3pIQRGtIeOVtDlvqFSpMfIgDPFNUf3su3OPcBge+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB5891.namprd11.prod.outlook.com (2603:10b6:303:169::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.20; Tue, 2 May
 2023 15:01:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 15:01:50 +0000
Date: Tue, 2 May 2023 15:01:35 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-xe] [PATCH 08/14] drm/xe: Convert GuC Engine print to
 snapshot capture and print.
Message-ID: <ZFElz+wLsmlbDUqm@DUT025-TGLU.fm.intel.com>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
 <20230426205713.512695-9-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230426205713.512695-9-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR02CA0063.namprd02.prod.outlook.com
 (2603:10b6:a03:54::40) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB5891:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ac2b2ba-39a1-4e67-73c8-08db4b1e2881
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qdlCK+NAavwO9szNVUW2MDN5x5wOkzdS5JVpgPUw5dObOnM/QrPz4tAbB8266sjXF5Gd7RrKkGeI40sxOSjMKAPVh2FSrRp0ypBE4g6qP7153utud7EN8ZRZbPTHrlDlH14T2F77UDZwvu74Pq0K4T8IJZBnpALWAlOLrZ0Y2TfNYKaBXgQxEQU7+V8oB074fK9H50mH7Vn0eZMRGtERUiHPC/NOo5qLk4Q5pFrWLVUv2TDzjVKxjVExH9DwDT7VEEYDcCBTa+hfgEYFOg3G/L0WD5AHcj/Mj46kbozGT4SoUgvfPR89ev/i4zzbT0K2Fn3BcH+Kqrmf+R+b60NWvmfXHO6+P4hR32EI8oSKvEnn3xIfa2lvh0wBWH11e+nS8MZhUY4EXDt0ezNI6te+H5yLlbsHgZlRIZbWtqT6XP4ABZwjgAZcCQMW0A9owhRCjOG0pPYMXTa/6mMkQGAgsNeR7j7Yn6AUOlAezJVN3VjoMllb9rQH8F6AvBXCPQswqv8E4gQohzs3Ihm7o5b6d9GOZfYFFHh4ZEUbYPpeOK56umbsRHaX3j4ldt3knYoEF7HOCDxKHW3vlEto9cjQFSmlqbJEE6+kmeAaFk/D0bw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(366004)(396003)(39860400002)(136003)(451199021)(6486002)(66946007)(66556008)(66476007)(6636002)(4326008)(45080400002)(6666004)(450100002)(316002)(86362001)(478600001)(83380400001)(6512007)(6506007)(26005)(5660300002)(8936002)(44832011)(8676002)(30864003)(2906002)(41300700001)(6862004)(82960400001)(38100700002)(186003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tSWFflGZe5nFfcUVsVYx92dxqDHtBrhN4hDiyf7HFOUxeJZ9LqY9CjUL1zr0?=
 =?us-ascii?Q?8G8qBWK27Z8kR8pAb6msrtl3X6bJ/dcojPu2/Y4VDD/9LZ9RaELPECIKDQj0?=
 =?us-ascii?Q?jAak5lP/drCimLyUAAkdUyuiJgWpXbYi8TbD2OuO5+L2AnnoG/PKGsKdK04T?=
 =?us-ascii?Q?8AuYjymiZTAB1LJ4uBKrZoCOxEW5fB7srNUy1UShl/MJVyLBSsh+/Ekj3pSZ?=
 =?us-ascii?Q?XO8ByjAZj1f1akFzIJlXZZ2oaDwOGqeTmNrV0xsWgOBsfTzAhMj4CblKGCuQ?=
 =?us-ascii?Q?RryyGjA0tsXuUQch5ANwS0LKkdn29SpW/Z55spBiJY63DJDufpzrsp5L9ik6?=
 =?us-ascii?Q?003gtUiIBYVC3PSmFbsFFbTuG+LLg4ebnLkcplPwJBHTMHPLj7dJdpu2yRhv?=
 =?us-ascii?Q?Ca2NBdJ2ThFDgIyQMBogwB3SdU7iHfOnH0A7yTmR08MI6kXPVt9ySlWNASRw?=
 =?us-ascii?Q?zxocfKBKDvQM3JAKPAyzP/JBG1clFy3xwDf51SBVTYuonag8IHiGZnctiSPa?=
 =?us-ascii?Q?wT9JrXUbj7lq9o6TTH4uM8YkAaihQqTcWTeW0i4EaHgLXvvmFnMCuI3bIZcW?=
 =?us-ascii?Q?c+2DtWATGTCehg+Djm3ASgkRCi69iK6OEZQ2RnJlj0DiBrjWSvoTTcDNOST+?=
 =?us-ascii?Q?YOwJwWPPzbChkpqeYCVczxSAReeipMVisEYmhUp5Koz82q9r8jYLUz1CTksy?=
 =?us-ascii?Q?Cu+J4II7BkkQ8WhdVh7ARhxZTEFH3XuXzgQ7tQbVGgWxkSj+K7HCvpCQY6tA?=
 =?us-ascii?Q?HlXm61VR9R3Eixy2n2n0PD8P/+PPPxgXeRVdLwFbU1id6/wk2QF496Ztv1x+?=
 =?us-ascii?Q?/Wgod80Y8bxhAE7A0vFolquUbvKYS3CPD6tbVk4m2SAxcUWum4c7ETRMWOYG?=
 =?us-ascii?Q?oWumDC+m2qRCDUyceRpTNc3ChCyHhdzZ59CDCdiCHy4SGAo2sncOCGPUp5ZM?=
 =?us-ascii?Q?hm8Vte5XnVXqwVMWwTNAUGq6JRhZDcA1exX8DvsFFpdXQCnc2i2B/Ol2XmZD?=
 =?us-ascii?Q?Npow8OxRIyBVyBB89jRrQiKI+oMnmrh7lAicBto2B0+kZPt1B3/4p5KvVVcQ?=
 =?us-ascii?Q?ODNcm/LKroAUjyXpzHeBg9ZxdmopSnazXy328NB1C4c7Wuxg/vDx4kXaE5Y9?=
 =?us-ascii?Q?o0efdCNwzOf+Tor6rmAY7QJr7WcFT+YtYhPEnQKPO8UPjQekeylIqBsELfDa?=
 =?us-ascii?Q?M2NoE+IuCLPSJDJP5OgiRluwdi1C7MH86T9ioO5fObwUkBAe2u9z/dg/2WeV?=
 =?us-ascii?Q?nXX6Et83EgVhXZKnNnW+xJ8hL9J1mKB0SrAuYUmbEUm18bwLVDLgN82FqC54?=
 =?us-ascii?Q?sj+BY9V43viDiAshnGw+2eM3kG8PT8YUNXuvD7HP2k1jRFFO4blKkHM7N49z?=
 =?us-ascii?Q?TUhblYgJ20OYYQjsi8dqNa3FXWI5o/cmb62stksDA77qetY5hqsbt3xfJ2yE?=
 =?us-ascii?Q?Ic2osAG/Rz9ONv2wbgRt9EQfGp03bncD5dzJOMDVgk1xf26AATSqn48ZUeDL?=
 =?us-ascii?Q?qL2BNncLSBXgEgVkgSdVV8XAyH21cM5Uo3kDlYZxZL0Er2uBuIu/i1yKOkaQ?=
 =?us-ascii?Q?heA1of0NGxHam94qItiBgoXHq81qfTCYhGeth816ZUQdb4zvxmDaBIOxxcgG?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ac2b2ba-39a1-4e67-73c8-08db4b1e2881
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 15:01:50.5562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9K2PNmxhIwMVa3qJtueyvK8A49Td+AvCKjHhFwpzQbeS/Cr/X6oab8xc3SqhPF3PhD+tiq8ROHr6LrW1dozh+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5891
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 26, 2023 at 04:57:07PM -0400, Rodrigo Vivi wrote:
> The goal is to allow for a snapshot capture to be taken at the time
> of the crash, while the print out can happen at a later time through
> the exposed devcoredump virtual device.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 212 +++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_guc_submit.h       |  10 +-
>  drivers/gpu/drm/xe/xe_guc_submit_types.h |  91 ++++++++++
>  3 files changed, 274 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index a5fe7755ce4c..9c06411f857f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1596,75 +1596,211 @@ int xe_guc_engine_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	return 0;
>  }
>  
> -static void guc_engine_wq_print(struct xe_engine *e, struct drm_printer *p)
> +static void
> +guc_engine_wq_snapshot_capture(struct xe_engine *e,
> +			       struct xe_guc_submit_engine_snapshot *snapshot)
>  {
>  	struct xe_guc *guc = engine_to_guc(e);
>  	struct xe_device *xe = guc_to_xe(guc);
>  	struct iosys_map map = xe_lrc_parallel_map(e->lrc);
>  	int i;
>  
> +	snapshot->guc.wqi_head = e->guc->wqi_head;
> +	snapshot->guc.wqi_tail = e->guc->wqi_tail;
> +	snapshot->parallel.wq_desc.head = parallel_read(xe, map, wq_desc.head);
> +	snapshot->parallel.wq_desc.tail = parallel_read(xe, map, wq_desc.tail);
> +	snapshot->parallel.wq_desc.status = parallel_read(xe, map,
> +							  wq_desc.wq_status);
> +
> +	if (snapshot->parallel.wq_desc.head !=
> +	    snapshot->parallel.wq_desc.tail) {
> +		for (i = snapshot->parallel.wq_desc.head;
> +		     i != snapshot->parallel.wq_desc.tail;
> +		     i = (i + sizeof(u32)) % WQ_SIZE)
> +			snapshot->parallel.wq[i / sizeof(u32)] =
> +				parallel_read(xe, map, wq[i / sizeof(u32)]);
> +	}
> +}
> +
> +static void
> +guc_engine_wq_snapshot_print(struct xe_guc_submit_engine_snapshot *snapshot,
> +			     struct drm_printer *p)
> +{
> +	int i;
> +
>  	drm_printf(p, "\tWQ head: %u (internal), %d (memory)\n",
> -		   e->guc->wqi_head, parallel_read(xe, map, wq_desc.head));
> +		   snapshot->guc.wqi_head, snapshot->parallel.wq_desc.head);
>  	drm_printf(p, "\tWQ tail: %u (internal), %d (memory)\n",
> -		   e->guc->wqi_tail, parallel_read(xe, map, wq_desc.tail));
> -	drm_printf(p, "\tWQ status: %u\n",
> -		   parallel_read(xe, map, wq_desc.wq_status));
> -	if (parallel_read(xe, map, wq_desc.head) !=
> -	    parallel_read(xe, map, wq_desc.tail)) {
> -		for (i = parallel_read(xe, map, wq_desc.head);
> -		     i != parallel_read(xe, map, wq_desc.tail);
> +		   snapshot->guc.wqi_tail, snapshot->parallel.wq_desc.tail);
> +	drm_printf(p, "\tWQ status: %u\n", snapshot->parallel.wq_desc.status);
> +
> +	if (snapshot->parallel.wq_desc.head !=
> +	    snapshot->parallel.wq_desc.tail) {
> +		for (i = snapshot->parallel.wq_desc.head;
> +		     i != snapshot->parallel.wq_desc.tail;
>  		     i = (i + sizeof(u32)) % WQ_SIZE)
>  			drm_printf(p, "\tWQ[%zu]: 0x%08x\n", i / sizeof(u32),
> -				   parallel_read(xe, map, wq[i / sizeof(u32)]));
> +				   snapshot->parallel.wq[i / sizeof(u32)]);
>  	}
>  }
>  
> -static void guc_engine_print(struct xe_engine *e, struct drm_printer *p)
> +/**
> + * xe_guc_engine_snapshot_capture - Take a quick snapshot of the GuC Engine.
> + * @e: Xe Engine.
> + *
> + * This can be printed out in a later stage like during dev_coredump
> + * analysis.
> + *
> + * Returns: a GuC Submit Engine snapshot object that must be freed by the
> + * 	    caller, using `xe_guc_engine_snapshot_free`.
> + */
> +struct xe_guc_submit_engine_snapshot *
> +xe_guc_engine_snapshot_capture(struct xe_engine *e)
>  {
>  	struct drm_gpu_scheduler *sched = &e->guc->sched;
>  	struct xe_sched_job *job;
> +	struct xe_guc_submit_engine_snapshot *snapshot;
>  	int i;
>  
> -	drm_printf(p, "\nGuC ID: %d\n", e->guc->id);
> -	drm_printf(p, "\tName: %s\n", e->name);
> -	drm_printf(p, "\tClass: %d\n", e->class);
> -	drm_printf(p, "\tLogical mask: 0x%x\n", e->logical_mask);
> -	drm_printf(p, "\tWidth: %d\n", e->width);
> -	drm_printf(p, "\tRef: %d\n", kref_read(&e->refcount));
> -	drm_printf(p, "\tTimeout: %ld (ms)\n", sched->timeout);
> -	drm_printf(p, "\tTimeslice: %u (us)\n", e->sched_props.timeslice_us);
> -	drm_printf(p, "\tPreempt timeout: %u (us)\n",
> -		   e->sched_props.preempt_timeout_us);
> +	snapshot = kzalloc(sizeof(struct xe_guc_submit_engine_snapshot),
> +			   GFP_ATOMIC);

For the whole file you need to check if any of the allocs fail. Also
let's say if just the last alloc fails I wouldn't fail the entire
capture, just abort at that point (i.e. some info is better than none).

Matt

> +
> +	snapshot->guc.id = e->guc->id;
> +	memcpy(&snapshot->name, &e->name, sizeof(snapshot->name));
> +	snapshot->class = e->class;
> +	snapshot->logical_mask = e->logical_mask;
> +	snapshot->width = e->width;
> +	snapshot->refcount = kref_read(&e->refcount);
> +	snapshot->sched_timeout = sched->timeout;
> +	snapshot->sched_props.timeslice_us = e->sched_props.timeslice_us;
> +	snapshot->sched_props.preempt_timeout_us =
> +		e->sched_props.preempt_timeout_us;
> +
> +	snapshot->lrc = kmalloc_array(e->width, sizeof(struct lrc_snapshot),
> +				GFP_ATOMIC);
> +
>  	for (i = 0; i < e->width; ++i ) {
>  		struct xe_lrc *lrc = e->lrc + i;
>  
> +		snapshot->lrc[i].context_desc =
> +			lower_32_bits(xe_lrc_ggtt_addr(lrc));
> +		snapshot->lrc[i].head = xe_lrc_ring_head(lrc);
> +		snapshot->lrc[i].tail.internal = lrc->ring.tail;
> +		snapshot->lrc[i].tail.memory =
> +			xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL);
> +		snapshot->lrc[i].start_seqno = xe_lrc_start_seqno(lrc);
> +		snapshot->lrc[i].seqno = xe_lrc_seqno(lrc);
> +
> +	}
> +
> +	snapshot->schedule_state = atomic_read(&e->guc->state);
> +	snapshot->engine_flags = e->flags;
> +
> +	snapshot->parallel_execution = xe_engine_is_parallel(e);
> +	if (snapshot->parallel_execution)
> +		guc_engine_wq_snapshot_capture(e, snapshot);
> +
> +	spin_lock(&sched->job_list_lock);
> +	snapshot->pending_list_size = list_count_nodes(&sched->pending_list);
> +	snapshot->pending_list = kmalloc_array(snapshot->pending_list_size,
> +					 sizeof(struct pending_list_snapshot),
> +					 GFP_ATOMIC);
> +	i = 0;
> +	list_for_each_entry(job, &sched->pending_list, drm.list) {
> +		snapshot->pending_list[i].seqno = xe_sched_job_seqno(job);
> +		snapshot->pending_list[i].fence =
> +			dma_fence_is_signaled(job->fence) ? 1 : 0;
> +		snapshot->pending_list[i].finished =
> +			dma_fence_is_signaled(&job->drm.s_fence->finished)
> +			? 1 : 0;
> +		i++;
> +	}
> +	spin_unlock(&sched->job_list_lock);
> +
> +	return snapshot;
> +}
> +
> +/**
> + * xe_guc_engine_snapshot_print - Print out a given GuC Engine snapshot.
> + * @snapshot: GuC Submit Engine snapshot object.
> + * @p: drm_printer where it will be printed out.
> + *
> + * This function prints out a given GuC Submit Engine snapshot object.
> + */
> +void
> +xe_guc_engine_snapshot_print(struct xe_guc_submit_engine_snapshot *snapshot,
> +			     struct drm_printer *p)
> +{
> +	int i;
> +
> +	drm_printf(p, "\nGuC ID: %d\n", snapshot->guc.id);
> +	drm_printf(p, "\tName: %s\n", snapshot->name);
> +	drm_printf(p, "\tClass: %d\n", snapshot->class);
> +	drm_printf(p, "\tLogical mask: 0x%x\n", snapshot->logical_mask);
> +	drm_printf(p, "\tWidth: %d\n", snapshot->width);
> +	drm_printf(p, "\tRef: %d\n", snapshot->refcount);
> +	drm_printf(p, "\tTimeout: %ld (ms)\n", snapshot->sched_timeout);
> +	drm_printf(p, "\tTimeslice: %u (us)\n",
> +		   snapshot->sched_props.timeslice_us);
> +	drm_printf(p, "\tPreempt timeout: %u (us)\n",
> +		   snapshot->sched_props.preempt_timeout_us);
> +
> +	for (i = 0; i < snapshot->width; ++i ) {
>  		drm_printf(p, "\tHW Context Desc: 0x%08x\n",
> -			   lower_32_bits(xe_lrc_ggtt_addr(lrc)));
> +			   snapshot->lrc[i].context_desc);
>  		drm_printf(p, "\tLRC Head: (memory) %u\n",
> -			   xe_lrc_ring_head(lrc));
> +			   snapshot->lrc[i].head);
>  		drm_printf(p, "\tLRC Tail: (internal) %u, (memory) %u\n",
> -			   lrc->ring.tail,
> -			   xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL));
> +			   snapshot->lrc[i].tail.internal,
> +			   snapshot->lrc[i].tail.memory);
>  		drm_printf(p, "\tStart seqno: (memory) %d\n",
> -			   xe_lrc_start_seqno(lrc));
> -		drm_printf(p, "\tSeqno: (memory) %d\n", xe_lrc_seqno(lrc));
> +			   snapshot->lrc[i].start_seqno);
> +		drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->lrc[i].seqno);
>  	}
> -	drm_printf(p, "\tSchedule State: 0x%x\n", atomic_read(&e->guc->state));
> -	drm_printf(p, "\tFlags: 0x%lx\n", e->flags);
> -	if (xe_engine_is_parallel(e))
> -		guc_engine_wq_print(e, p);
> +	drm_printf(p, "\tSchedule State: 0x%x\n", snapshot->schedule_state);
> +	drm_printf(p, "\tFlags: 0x%lx\n", snapshot->engine_flags);
>  
> -	spin_lock(&sched->job_list_lock);
> +	if (snapshot->parallel_execution)
> +		guc_engine_wq_snapshot_print(snapshot, p);
>  
> -	list_for_each_entry(job, &sched->pending_list, drm.list)
> +	for(i = 0; i < snapshot->pending_list_size; i++)
>  		drm_printf(p, "\tJob: seqno=%d, fence=%d, finished=%d\n",
> -			   xe_sched_job_seqno(job),
> -			   dma_fence_is_signaled(job->fence) ? 1 : 0,
> -			   dma_fence_is_signaled(&job->drm.s_fence->finished) ?
> -			   1 : 0);
> -	spin_unlock(&sched->job_list_lock);
> +			   snapshot->pending_list[i].seqno,
> +			   snapshot->pending_list[i].fence,
> +			   snapshot->pending_list[i].finished);
> +}
> +
> +/**
> + * xe_guc_engine_snapshot_free - Free all allocated objects for a given
> + * snapshot.
> + * @snapshot: GuC Submit Engine snapshot object.
> + *
> + * This function free all the memory that needed to be allocated at capture
> + * time.
> + */
> +void xe_guc_engine_snapshot_free(struct xe_guc_submit_engine_snapshot *snapshot)
> +{
> +	kfree(snapshot->lrc);
> +	kfree(snapshot->pending_list);
> +	kfree(snapshot);
> +}
> +
> +static void guc_engine_print(struct xe_engine *e, struct drm_printer *p)
> +{
> +	struct xe_guc_submit_engine_snapshot *snapshot;
> +
> +	snapshot = xe_guc_engine_snapshot_capture(e);
> +	xe_guc_engine_snapshot_print(snapshot, p);
> +	xe_guc_engine_snapshot_free(snapshot);
>  }
>  
> +/**
> + * xe_guc_submit_print - GuC Submit Print.
> + * @guc: GuC.
> + * @p: drm_printer where it will be printed out.
> + *
> + * This function capture and prints snapshots of **all** GuC Engines.
> + */
>  void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p)
>  {
>  	struct xe_engine *e;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 8002734d6f24..4153c2d22013 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -13,7 +13,6 @@ struct xe_engine;
>  struct xe_guc;
>  
>  int xe_guc_submit_init(struct xe_guc *guc);
> -void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
>  
>  int xe_guc_submit_reset_prepare(struct xe_guc *guc);
>  void xe_guc_submit_reset_wait(struct xe_guc *guc);
> @@ -27,4 +26,13 @@ int xe_guc_engine_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  					   u32 len);
>  int xe_guc_engine_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
>  
> +struct xe_guc_submit_engine_snapshot *
> +xe_guc_engine_snapshot_capture(struct xe_engine *e);
> +void
> +xe_guc_engine_snapshot_print(struct xe_guc_submit_engine_snapshot *snapshot,
> +			     struct drm_printer *p);
> +void
> +xe_guc_engine_snapshot_free(struct xe_guc_submit_engine_snapshot *snapshot);
> +void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
> index d369ea0bad60..0b726609dc14 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
> @@ -61,4 +61,95 @@ struct guc_submit_parallel_scratch {
>  	u32 wq[WQ_SIZE / sizeof(u32)];
>  };
>  
> +struct lrc_snapshot {
> +	u32 context_desc;
> +	u32 head;
> +	struct {
> +		u32 internal;
> +		u32 memory;
> +	} tail;
> +	u32 start_seqno;
> +	u32 seqno;
> +};
> +
> +struct pending_list_snapshot {
> +	u32 seqno;
> +	bool fence;
> +	bool finished;
> +};
> +
> +/**
> + * struct xe_guc_submit_engine_snapshot - Snapshot for devcoredump
> + */
> +struct xe_guc_submit_engine_snapshot {
> +	/** @name: name of this engine */
> +	char name[MAX_FENCE_NAME_LEN];
> +	/** @class: class of this engine */
> +	enum xe_engine_class class;
> +	/**
> +	 * @logical_mask: logical mask of where job submitted to engine can run
> +	 */
> +	u32 logical_mask;
> +	/** @width: width (number BB submitted per exec) of this engine */
> +	u16 width;
> +	/** @refcount: ref count of this engine */
> +	u32 refcount;
> +	/**
> +	 * @sched_timeout: the time after which a job is removed from the
> +	 * scheduler.
> +	 */
> +	long sched_timeout;
> +
> +	/** @sched_props: scheduling properties */
> +	struct {
> +		/** @timeslice_us: timeslice period in micro-seconds */
> +		u32 timeslice_us;
> +		/** @preempt_timeout_us: preemption timeout in micro-seconds */
> +		u32 preempt_timeout_us;
> +	} sched_props;
> +
> +	/** @lrc: LRC Snapshot */
> +	struct lrc_snapshot *lrc;
> +
> +	/** @schedule_state: Schedule State at the moment of Crash */
> +	u32 schedule_state;
> +	/** @engine_flags: Flags of the faulty engine */
> +	unsigned long engine_flags;
> +
> +	/** @guc: GuC Engine Snapshot */
> +	struct {
> +		/** @wqi_head: work queue item head */
> +		u32 wqi_head;
> +		/** @wqi_tail: work queue item tail */
> +		u32 wqi_tail;
> +		/** @id: GuC id for this xe_engine */
> +		u16 id;
> +	} guc;
> +
> +	/**
> +	 * @parallel_execution: Indication if the failure was during parallel
> +	 * execution
> +	 */
> +	bool parallel_execution;
> +	/** @parallel: snapshot of the useful parallel scratch */
> +	struct {
> +		/** @wq_desc: Workqueue description */
> +		struct {
> +			/** @head: Workqueue Head */
> +			u32 head;
> +			/** @tail: Workqueue Tail */
> +			u32 tail;
> +			/** @status: Workqueue Status */
> +			u32 status;
> +		} wq_desc;
> +		/** @wq: Workqueue Items */
> +		u32 wq[WQ_SIZE / sizeof(u32)];
> +	} parallel;
> +
> +	/** @pending_list_size: Size of the pending list snapshot array */
> +	int pending_list_size;
> +	/** @pending_list: snapshot of the pending list info */
> +	struct pending_list_snapshot *pending_list;
> +};
> +
>  #endif
> -- 
> 2.39.2
> 
