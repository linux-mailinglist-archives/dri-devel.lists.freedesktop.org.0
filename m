Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2747670AF
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 17:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412FC10E71E;
	Fri, 28 Jul 2023 15:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849D010E71E;
 Fri, 28 Jul 2023 15:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690558598; x=1722094598;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rB98HxIQxjEj5xHf2VoW/ZxxZpplp8n1gtqtWz/ZoAY=;
 b=fo1SLyKA2C0UegqltUUZ8qVL5rqCiJtxAwJZBfoREFBM4G/rH98n5Gj4
 1TILTfqm6kkJ6rqYiTkM9gtRjmR7gmokO0UVmfrIVt2V20UEH2Zc1yXjl
 kDJDdcv35KSTDyGnVRHJQ+wDgj2XnJczXZs2isc6EvMwF4cs9h1ANPVUF
 mv1mC392/8VvGLoAUy0iCfOPZ3j9+xq/0sK94zbda/lJvWplnCdhvQCPQ
 R8e3wm1HPeIetjiKBbVOjXq5RCOayGqf6YQXh+bEFSt4ScJzQj6db1rAX
 +pD0lls6dxrnQXzFCB8kKKMysBZEvMAIMRL03FZOTB0HT1Xgit9961Kuo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="353529855"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; d="scan'208";a="353529855"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 08:36:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="792978237"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; d="scan'208";a="792978237"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 28 Jul 2023 08:36:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 08:36:37 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 08:36:36 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 28 Jul 2023 08:36:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 28 Jul 2023 08:36:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDU+H6DzbvloNGIcVAdAMCj2Cbi5sRIMeAmtXc6Wr4iIW/h3A8YPEJxmlJUaN59oM/9c/f5VIny8HypJVYQlAbU6EeLYWfoY2iljA7+zLNqKKQngJhwxUzWmiJfgQ6KyDwQTXcpbvo11fYZbeyfXqR5svf+WmNpsh0CHLMZ+A1rtWAl2E6W/9U5Jz0WRWtHjhwxpG18JqDymtod/GGr0V8mmUuVNiL0MXwkpGDnGOA1CApJIF0sSBZnTS7aoagHjWWepXI+hd0Hk4/8eAWZtC0YbvJ8WFniZUx1mdPcLTa0lbcii0UJn66aZ8ZRU5bCg12ys84zkBFP6I0UsvRL7RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQAOmQzZqM2IVdMf69jTOyIWU7/Y3WP20kVddBx5NLo=;
 b=FClENI4P+ZYjBMG3xK/9At/Q42T6UFI7UzAioIDCTY1x5347yLDs3UVaZjhzB1me2N8O1xP0LUar1847RQC9QX/5ISYgaQ4MeOWWYLIFXF0ESM4McMhvPd2iXwM8jm4Y3uPv6zNXakGlqit44v3ikEssO2tHlcxXVwP7PVRxq1U0LBI1KxpuKNf5c4DxL9UH7u9vwAsEOQQIqU3uZu9qZBbBLAmzSD3X/17ie3VWLMF7ZXDip1aI9wSAU+Qtc/NXkgHCws44cCtireUm/pLETobCLVEFVMuCG23noxZXRe43KQDHk5zvuchXJZN/vfzhgyXi83XfXaksGTRDXj4htg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN6PR11MB8217.namprd11.prod.outlook.com (2603:10b6:208:47d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 15:36:35 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 15:36:35 +0000
Date: Fri, 28 Jul 2023 11:36:30 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/guc/slpc: Restore efficient freq
 earlier
Message-ID: <ZMPgfvUneE1RjROi@intel.com>
References: <20230726010044.3280402-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230726010044.3280402-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SJ0PR03CA0124.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::9) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN6PR11MB8217:EE_
X-MS-Office365-Filtering-Correlation-Id: f862ae4a-feec-47ca-ca5f-08db8f806cc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 30Y6OxjkKFuxbPF+9ifahTafOPWh/Bd9C/5u6II0+1kxiLR15yR4kKLUQAwwt+vtRzXYAuR3VT1Gxfdvc3FNx6+ZmUC3cGt4UF2CoV6e5kpwDiB6Jikhtcv7GgcxC4DsB1GJW4EA6Hkh65kwdI4whfTILWAyCBilNHkb9LdBUbvABN6dLlSnOCaC0plkeGasZZCmsGmP7LSieBhXJaH84N02CjLr8IM1MOj6BAU0YdoO6l6C/FH9c5YAwS9EU2QVzbIl/ZwzLF+U6zXGpoBJDgxTYfbhJjRzibJdwGqYOb+qpSs8oVEcKN362uKLCKaWRdAn4TSZn8sV9+5XdmdPj9N0NcyxW5Jksb9I9lQGoLz1UqEmBcF/QkTFw70j1HOzi/bndVkZUbfkzQ5QXTHa21D3mS4EZoAmujuBpVQWCo0FoBGjM07LkpD2sBNKnD7xSXtgsvn2itMeuy8LagaUJiLPTqkL9MuNnx/2oE05LSRCJPhWk2qyh1gALGuVylJ29SyFlWFbVdPyuI0g0V66KbwWA6fXbKW0u4sjCxLtrYM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(396003)(346002)(136003)(366004)(451199021)(37006003)(82960400001)(6506007)(26005)(186003)(6486002)(6666004)(478600001)(66476007)(6636002)(4326008)(450100002)(2616005)(966005)(83380400001)(6512007)(38100700002)(66946007)(66556008)(5660300002)(44832011)(41300700001)(316002)(2906002)(8936002)(6862004)(8676002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gkdozt6+Yc0yD6TXtNmRK/O1OIyCGWqEQsCmTZ9/twbHoIxeSC0tfLTHgtxp?=
 =?us-ascii?Q?cqvAlO80fW6dr8RG/0bVvJexyQbJD6A0B/a7j4IXhsejQhggfSOVlN4pge6g?=
 =?us-ascii?Q?DkvoFlKkUF3f1IyqJDKPH0F2UKR0Q/krI/RooKQBdCJ5rgXrbQZObPvzSgJt?=
 =?us-ascii?Q?aEtstrrAZHq21KKigMANTsbVIC3IckTSbQT6yBXJJKWxU1eJ7MuJ8VNd0CcD?=
 =?us-ascii?Q?An5yGw5FYLIzkMhnZPpHnFjDK4odK+fiFnmMOEQI7958X6BzWyEC0Pv+GjWD?=
 =?us-ascii?Q?+JlmmW1l0nu9Ew1aLEyltSFf4FYNBxkoUMuC+1k9ch66h7P4728Vb8m37U3e?=
 =?us-ascii?Q?xQPUOeo/4sAHUubY/4sYt5Nwth+OxEqYW4Rf0PqCxD5P8+zDh6m7bOSiRuH+?=
 =?us-ascii?Q?X6L+h3uFCQLl1jc8yLpTJvD8JGOeH0eCunO6sjgGcS8KFlCnnr3WqqVLQCcv?=
 =?us-ascii?Q?Z5j3243vu8PiCmw+OY8lSE0xTawo26HumVQ30Y80G0Eslit5ZhkxgmhADGuv?=
 =?us-ascii?Q?/97ARMP9+RB0T7hN5bNfpEmrsMzTyiIDySh5kqDL/5oZ3BaXT6NMO/eefav+?=
 =?us-ascii?Q?75EREQopXXrAX3ukSG181UdpOVNapAaA9GNSmbsiMiUaoEgtZ7hj24c8soE/?=
 =?us-ascii?Q?oReB7CJveylfM8RiJMhseK7PriESkmysg0l+LG1t5dqof0ycjgyA98WUEzFf?=
 =?us-ascii?Q?QO4mN7ITvCFzsrxCV3ClLwyFriHG9DuG6JMD5ufLpGxv+XgHzEXC7k26dTsu?=
 =?us-ascii?Q?nKuLbgMcEVzi9y2+MJL5Vg37vkVYKB0fNXM/fCce7Zl5GS9BiqmFB7i8gJHJ?=
 =?us-ascii?Q?XQ1OgTwKyERmy5LWloijNMVhoLtEnkv8heQQn7FI1iBkBMDnXlm3eXuxCat1?=
 =?us-ascii?Q?1/fYs+/hB+Uwp3C/xDdHiT4oqKbtaMWAJgtodvIGlRb1ALmwNX4KL0MiwbjP?=
 =?us-ascii?Q?NheY4HGvvsgAVrOTSyeea0XwAtV4RXpW71mfl5lZbA2w5TP56yTNTvHAinXg?=
 =?us-ascii?Q?ysV5Zn7Sx53GvT6FenKraoD7IjU80BmJjb+DPOF07B5V5p+qRAhGJ9xgYc8H?=
 =?us-ascii?Q?+gDa4/8ddpXU/hfNrxf8Q0vh5BlgDpQnB1aTlVdq83BZAdVldxpLV5sw9dRu?=
 =?us-ascii?Q?FvAWFRMfKIYKG9qQ+qIH538xH8rbBupAwmkucf30Y16/NXz92unK7UaBoOk9?=
 =?us-ascii?Q?VLC0Zlr/Dioto+fxxqp8sqO526j+LmjHA0g01QbQ8H4t6d5/uH8t2Fz6EP8l?=
 =?us-ascii?Q?uSu11VnGj/Bt6LTq0WvGpzbRb0toORFAjzNt3oUxtIxpypNwJny7CBEo+3Ja?=
 =?us-ascii?Q?FJIC4EiPQxUgY1tPW5CMczF1l8v3aq0tCnDcAbUXLFmcRXumwg9fvq7D/iOG?=
 =?us-ascii?Q?ewjNbXqODi1PcORYFrarU9MGQQa7SIcWadZpRzXaVI1uojTA49ylyXAIqO1V?=
 =?us-ascii?Q?r/j8MFoHSuqJk1sbYtx2xmnwEiH4lradODbtq0MxfSFcOrXY9hMG/qSV+WVh?=
 =?us-ascii?Q?zW9p4AxE/qNflXvZ6PafWZ3E6pD2bJknqwE8q131JQSOEjnYTL/TKxZ5lt5/?=
 =?us-ascii?Q?y0sXlCWkYVVJ/DbCGUGrerPKpTgE8N6ZEPuO6oDV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f862ae4a-feec-47ca-ca5f-08db8f806cc7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 15:36:35.0429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kEYGtmLcrYpiRs01X/QQDIBfjt7SBygqGRBjrGmSROcaXhJ9eXhmLJQ1RUke0hMkj6V+1xHTICPjMPdJFJVEpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8217
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 25, 2023 at 06:00:44PM -0700, Vinay Belgaumkar wrote:
> This should be done before the soft min/max frequencies are restored.
> When we disable the "Ignore efficient frequency" flag, GuC does not
> actually bring the requested freq down to RPn.
> 
> Specifically, this scenario-
> 
> - ignore efficient freq set to true
> - reduce min to RPn (from efficient)
> - suspend
> - resume (includes GuC load, restore soft min/max, restore efficient freq)
> - validate min freq has been resored to RPn
> 
> This will fail if we didn't first restore(disable, in this case) efficient
> freq flag before setting the soft min frequency.
> 
> v2: Bring the min freq down to RPn when we disable efficient freq (Rodrigo)
> Also made the change to set the min softlimit to RPn at init. Otherwise, we
> were storing RPe there.

Thanks
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Link: https://gitlab.freedesktop.org/drm/intel/-/issues/8736
> Fixes: 55f9720dbf23 ("drm/i915/guc/slpc: Provide sysfs for efficient freq")
> Fixes: 95ccf312a1e4 ("drm/i915/guc/slpc: Allow SLPC to use efficient frequency")
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 22 +++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index ee9f83af7cf6..477df260ae3a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -470,12 +470,19 @@ int intel_guc_slpc_set_ignore_eff_freq(struct intel_guc_slpc *slpc, bool val)
>  	ret = slpc_set_param(slpc,
>  			     SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
>  			     val);
> -	if (ret)
> +	if (ret) {
>  		guc_probe_error(slpc_to_guc(slpc), "Failed to set efficient freq(%d): %pe\n",
>  				val, ERR_PTR(ret));
> -	else
> +	} else {
>  		slpc->ignore_eff_freq = val;
>  
> +		/* Set min to RPn when we disable efficient freq */
> +		if (val)
> +			ret = slpc_set_param(slpc,
> +					     SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
> +					     slpc->min_freq);
> +	}
> +
>  	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
>  	mutex_unlock(&slpc->lock);
>  	return ret;
> @@ -602,9 +609,8 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
>  		return ret;
>  
>  	if (!slpc->min_freq_softlimit) {
> -		ret = intel_guc_slpc_get_min_freq(slpc, &slpc->min_freq_softlimit);
> -		if (unlikely(ret))
> -			return ret;
> +		/* Min softlimit is initialized to RPn */
> +		slpc->min_freq_softlimit = slpc->min_freq;
>  		slpc_to_gt(slpc)->defaults.min_freq = slpc->min_freq_softlimit;
>  	} else {
>  		return intel_guc_slpc_set_min_freq(slpc,
> @@ -755,6 +761,9 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>  		return ret;
>  	}
>  
> +	/* Set cached value of ignore efficient freq */
> +	intel_guc_slpc_set_ignore_eff_freq(slpc, slpc->ignore_eff_freq);
> +
>  	/* Revert SLPC min/max to softlimits if necessary */
>  	ret = slpc_set_softlimits(slpc);
>  	if (unlikely(ret)) {
> @@ -765,9 +774,6 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>  	/* Set cached media freq ratio mode */
>  	intel_guc_slpc_set_media_ratio_mode(slpc, slpc->media_ratio_mode);
>  
> -	/* Set cached value of ignore efficient freq */
> -	intel_guc_slpc_set_ignore_eff_freq(slpc, slpc->ignore_eff_freq);
> -
>  	return 0;
>  }
>  
> -- 
> 2.38.1
> 
