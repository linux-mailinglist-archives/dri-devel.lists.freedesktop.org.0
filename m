Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEFA756B08
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 19:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71ABE10E2A2;
	Mon, 17 Jul 2023 17:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E8110E296;
 Mon, 17 Jul 2023 17:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689616490; x=1721152490;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qvI6STkXE7L3svUxftBwa3gHUbn30MGi2OUzLX5ygy8=;
 b=NYDK62ZNSBaGtM7pIpeCbZBRE4MqMeCuEqA7jSW47I5b+CZcvOxqsJ4W
 +UDcfC4vweIcaZs7MyyG/T1lHw4neJ31qBAzmp0EJsU+vLEZnsG10fAkh
 9Kz5zWiv3Tqscq8dlf1OzN6oU/nBSuLkOG/C4lA1JLgLSv/8F8DFeq04E
 mr5VJyfAWNfnTxZ6T/Y9Ju5/v/ShrTpNNMgRnWLIqLrGetF1FWuris/OD
 C+tCHunu+V2fBK39j7yZLaJDTynlxZl/Gr2izsX76py1Dm3DU+3utmRUJ
 IeQnbtMqamYX3aMJbIHJN5a7IH0jrLdh9ea7w90cfpfPAqfXLMAwDf0xm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="432171584"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="432171584"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 10:54:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="836964624"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="836964624"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 17 Jul 2023 10:54:39 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 10:54:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 17 Jul 2023 10:54:38 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 17 Jul 2023 10:54:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E0xJUeNF3u5UA8oWEtjXVowgLU3nBupwu6D/n7273nrEBn7We9UKfxhaJMYFdtUuQ1Er8iQ6AEZaO8aasP9eUhH8sB86ED//mAUnFByw3ZjSf/tP9vbM3KYpNHXs61zfLjAE7pcN6oi9LCEBFuGCPtgrozlGzHyVeaikq6l5ukNwXGeE4xAX80f30KMmKIrHSKLKRDV5v0q5MgahbLdTjOf26lWPzn5tg9Nzko6mYU5V/yldXo6GPLBOnSf16Lg18NSu5BfCYgOX9mve3iiNyaZxDQ1z6sym+E/P/G7G5tO3S6Ds+Ee0PQdf4FJwiPQm/MLBHYRXkoZCRYD+C5G6PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4YUGHvmkYYzwzo22Typxdf4pf8akitCVjNy8Zsb6JSs=;
 b=W0T2+hPc/AE9e/dSg3MyT/YMSMk60NJ2Xb11IDh43nQMtwZb5+c5lc+3ZyOypMzynuAaaM3uC2z4vjT852UYNuK6N6okp4NIyvBZdk2jmrSRLJUqQqoiBZLgX7qXnw/VQJIVSpJEh7x87jmHtVExvsJegMnKpS00ASoSXTrIPX8vfWmf6A7cNNclBvCE+TGyQbkMKhpcfIQtuss8pCTVdLux1LHkBFaLBuZ+Mri2AYxnXlIkZIh+sPPwgXtIv5eC0wFMZRCbbtPFVwrPXmTdcnx+r9Nvidz9A8aS/kwqkrfn2ud+hVXfBA19+4owkw5ENFU4UIbRny9qU0wJb+zkzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CO1PR11MB4882.namprd11.prod.outlook.com (2603:10b6:303:97::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.31; Mon, 17 Jul 2023 17:54:37 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 17:54:37 +0000
Date: Mon, 17 Jul 2023 10:54:25 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v4 2/6] drm/i915/gt: Ensure memory quiesced before
 invalidation
Message-ID: <20230717175425.GB138014@mdroper-desk1.amr.corp.intel.com>
References: <20230717173059.422892-1-andi.shyti@linux.intel.com>
 <20230717173059.422892-3-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230717173059.422892-3-andi.shyti@linux.intel.com>
X-ClientProxiedBy: CPYP284CA0049.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:81::18) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CO1PR11MB4882:EE_
X-MS-Office365-Filtering-Correlation-Id: 323d7fe4-b95c-491e-e6aa-08db86eee2c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kiMLF2y9FySLcpo2uxDxskvEdix9WIpzVG48jhcL4LmgB8LmOyN6FUS/plbY7PbDhovPfGprC7ax/cA2CqUF2+xIHhA1ihl2/sHcON7w/3dWZraFDUsSCD4JqW7xICoxXtevD04WbVpVK+T8SfWZstg/PdUr0MzMR5eFlF0ibr5J8pgWjXOKP/4eI3+Po3bT0HXE0DRr+maN+q7u4PyrRD/WoKr1Nf/rEbIxOWa+FYX15ZGaleN43i1Yuv7bkOO5DpDbwg3KKpV3sn4aHufTi6LXX8o7Anog2C+3+nm51sUr+Bol42ETUNtP27hXbMrMdAfvepTM5KYN3KY7qpUp0RCmDmGaK7OvUl1lSaAiTz2vJ4JT37U8+8qtTV1eY6W35o0fXiKmVSYnj76dzsT4q0di2GLl0D93hOgCOdhbgAaI5vvV1RPeFLxwx5pl7W+8YgpKawiZv9u5/HDlTxP154XPswq8aoD2XPdHHjUDMZyTbpOaymLobPPnMpj4U5Q/fEJE8fbhkD5IxUoU0PYsTLVtq4NyNbI7OcgUIYuGvxo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(136003)(346002)(366004)(39860400002)(451199021)(8676002)(41300700001)(82960400001)(86362001)(5660300002)(8936002)(38100700002)(6916009)(316002)(4326008)(83380400001)(66556008)(66476007)(33656002)(66946007)(2906002)(478600001)(54906003)(6486002)(6666004)(6512007)(966005)(186003)(26005)(1076003)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fOBJjoXEkn8vfjLT2b+hMxJLWAqLMbP1lDHoZItllvYtMCj3BxbWa0AkWZBC?=
 =?us-ascii?Q?sgfiuusS59RNj8/NbkurtZh8wd5BH+FAPjXXwWujblbDTp7TH0tW3iiTPZ6K?=
 =?us-ascii?Q?t3dqrLq0glFV9/rPmusxwIH5ZCF3PJuqI9pDlm3UKjfKwVowxuKhCNIpuqB4?=
 =?us-ascii?Q?mtwNg7FOIxRnZIKdwrtlZz8AzZ64tWrW5AcOdPBf+XhDvp8W1rViLVyWOqiW?=
 =?us-ascii?Q?FH9Jt15UUOPa6HhFCJsJhaU9kolqFO6qQ/vh5gVdJCO+Ob4E0u6MyegMd2nK?=
 =?us-ascii?Q?Ki6pBQTkGt+Xdm8qwK8mURarcA6gXJYYxTZlbOCnoxM6Ss1Ft1zyaPQOnZWl?=
 =?us-ascii?Q?6Bo1jGDUfqakhvqVTsmHtoweKCwnmjxRFw3Zeb6O1Q3cdmtRLl1Tz+c8XVaK?=
 =?us-ascii?Q?mBTbvNYqrHPIdhgr5UGh5Wj78OP289CUyaCUYYp5H3DoVcrVPPcdYP4NxSKV?=
 =?us-ascii?Q?EfoneKjCX1BLkSCcfyrjt5HRtOUC55zZujihnFfxwlkZaCqqsawDPDRK1KwM?=
 =?us-ascii?Q?MD0LC9dmwnfzCHTHnxLTtnWKUaOokyntXblpmd9VnS+47UfzDMxWVuOUQOTY?=
 =?us-ascii?Q?MZERZyRqFrDKnwoHts7/Wu9tv6tzQzIEyvHDgW5Y9BCUgHoEd8fpW8SKzcxv?=
 =?us-ascii?Q?tOarHnyvSV1nF57dtVBKrAPX2sXmkjQRCOiWq2Asz28cHODszYkwhXsXobeU?=
 =?us-ascii?Q?pyp2ET5Rx1NUdizhfdBGGr5VoDwFQhBL0hODVaoVrKnVNOyS3ZkkxTcW7wic?=
 =?us-ascii?Q?9vhFpF+qPs5uzxIqwT0YbNyC/tspQrOr2lgflkFsYSn1VzsFkx/sjcLbBPZk?=
 =?us-ascii?Q?ER8DDSh7WMAbdQnJDr+l/PpWZWaLFetJAZF/hHKNDoNgreIA5jZz15f5lIxl?=
 =?us-ascii?Q?jx0llgf0TiNYCT+LXKtUBOknHkjOpUUMXvdzOly6ml7MiT3CdHrFum4Rbn7g?=
 =?us-ascii?Q?XUjAIKhLZxpSDJX5e+CMH9dgqDe0pMFGKRBcWBWYmJnhoIBzuSr51Y0HcMe0?=
 =?us-ascii?Q?snf+Rp4hUoxWffbjchDv2++1o9dNuXv2ukvMZyEVGVEYr4W+X/Xec/+uAnXh?=
 =?us-ascii?Q?G3R0za5RIbxXyNjQYuyFojdmugr6eNDZ0Fr+KMf4Qfqb+OmQ8m8ZSbyN7eoU?=
 =?us-ascii?Q?9orAHBcfDFkX789O8gYvkuPuYQwhqUOLyBoDhdFb2XSTdYGd1A5RvMjaeJGP?=
 =?us-ascii?Q?Edd1jzAQ71m88+hiGR0RDXy4R78mYuvlFblPYtZk6teCLwh+zL1BbyXZhgsO?=
 =?us-ascii?Q?3IIEABpIZfNnWV6ZedUQzssEkkzo7oWgxuYlF/HenK3+/JzguF0UDBFktRwk?=
 =?us-ascii?Q?XRFaHunTRvSP5YaxhjraKkVJ9aSpfONlNxWbXZ2qXadx51j+r5x+PWgtqfz9?=
 =?us-ascii?Q?asr3xQfDGbaHV4FIBk3CbLVaRxcxAEQc/RNl8gM2Dw9qdW3B6BNLKVktg3uW?=
 =?us-ascii?Q?D/8qOhVrbCkD+YkYOuv8xxQvkhUTq2Z1qvb7IU0TPMB41/pHbz3CotmOGYqB?=
 =?us-ascii?Q?20mM+qU/rHISpU5ezLNyPrvNQKfJzt2a78hiKWxWxO4wXqvzfV/KAoQeIsDL?=
 =?us-ascii?Q?EFpl4qYOd74KzXOl2v5RVIvQIiNRWULaccOjzWR+f87ADuWugjJH8JJ7+ao2?=
 =?us-ascii?Q?HA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 323d7fe4-b95c-491e-e6aa-08db86eee2c4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 17:54:36.9148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ohmbX8BjfPjxwz4J68KGqvKJ0r8eQLgd8f5P0ZHs+voMxsm93BQI8jBPOL/9uLf8/wfFAPkG9G+UkJCqTUB06ebxy4bfggWdBV+jb9P+XcU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4882
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 17, 2023 at 07:30:55PM +0200, Andi Shyti wrote:
> From: Jonathan Cavitt <jonathan.cavitt@intel.com>
> 
> All memory traffic must be quiesced before requesting
> an aux invalidation on platforms that use Aux CCS.
> 
> Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+
> ---
>  drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 563efee055602..bee3b7dc595cf 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -202,6 +202,13 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>  {
>  	struct intel_engine_cs *engine = rq->engine;
>  
> +	/*
> +	 * Aux invalidations on Aux CCS platforms require
> +	 * memory traffic is quiesced prior.
> +	 */
> +	if ((mode & EMIT_INVALIDATE) && !HAS_FLAT_CCS(engine->i915))

It's a pre-existing mistake in drm-tip at the moment, but we shouldn't
assume !flatccs always implies auxccs.  PVC has neither, and there may
be other similar platforms in the future.  We should probably add a
helper function for AuxCCS, similar to what we added to the Xe driver
recently:

https://patchwork.freedesktop.org/patch/539304/?series=118334&rev=1


Matt


> +		mode |= EMIT_FLUSH;
> +
>  	if (mode & EMIT_FLUSH) {
>  		u32 flags = 0;
>  		int err;
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
