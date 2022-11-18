Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFD662FEEA
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 21:37:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF8910E7CE;
	Fri, 18 Nov 2022 20:37:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FC010E7D0;
 Fri, 18 Nov 2022 20:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668803831; x=1700339831;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oXbMMAYdmo7ReTJFCUg7QDAoUCoFyjbG+dJv0DmY6jk=;
 b=aNUaTdPHuYvSC4KGe9FJkJkvt6p1RVxOKhjtSOsRfxDJRBIQqU7reO4G
 2NVndPJwTdXHChrPmrLZkrm2L3VKPuN0o/lP4b/f8FFzCTBB16/l7vXRw
 GIc8HsOLpBZGypEICMexdg2E4C5RtT1CfQ2zAMDD8Cu4CTz4GRXtauJun
 OM6ic071sOxUz5vwg6guTJUBcbNASIENLana9hE4nj1wJw/cXRdzydZSx
 9HH0HYrMKSejHFX073rSsX4vWAD57JJ/Q0gpwRLV0w05e+jqZCU0IIZj8
 J4jrOcyNTcZoSgAZTPccsYthVkPX1zXyWh9CQwfelBxSGf6JPigo346/X Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="293617989"
X-IronPort-AV: E=Sophos;i="5.96,175,1665471600"; d="scan'208";a="293617989"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2022 12:37:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="634549718"
X-IronPort-AV: E=Sophos;i="5.96,175,1665471600"; d="scan'208";a="634549718"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 18 Nov 2022 12:37:09 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 12:37:09 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 12:37:08 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 18 Nov 2022 12:37:08 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 18 Nov 2022 12:37:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2ptNt2RGNlTAJxwQtE/xzovH/PKSj7pCuVTTFOJeG5uIy1rVMTz4rHrWTF46XxT2Dbh5w5yGho3W1coTho7/nqrT2XPey1qQQmWWrQweS30oruiOmmTIvYJ7hvvYQNbYVXiZVzkysoo5LQ+TncRB9iZO5CjOva3DJ6Jyr+roTiPKy+zSzecy3NTJAqYK14fJxgv2U8F5XOT/LVboXbC8ivqzGJ/sX9DE08xyRoa90XG7OaI07u/6u3WR0olJ+9VqwG3/aNnSzuG5Q9P6zMqT+CpMpn1dp+ifCsrfYdvrzN43uZX16Z84PGfpPTmAotRPzY7PwddyfbyTeR9XzqUVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/QXk6rXVMZTgWmMOaJUXYH764DY3lIdGrBwF5WuZi8=;
 b=i5wuWLTdveLiEqxdaNPDUKanTKslji99paH5mSy275Ip2mCUXOGL9CfXoECQu3ugkxcirqRZA5Txf0oKjC+Zcw6OFNe3/plX6EiSrGjz4obux4ZHQkea2BCGR29YkcT08n+5qNz/2ocQYuoy/pvERsrORUiufEmoxTlVbNP072fC6HacJTZhv0HBxZcBrlg7rExJTNHSDWYzA8s89+jPQ+iIFEIk1HYJ3N06foCdZYU4BCiscmhH4l7flNIxmzbbFFaI4teIeOBJLq4hB1HNUqpM2TnXVA/oyt5CoPOjggvJfd9mCHYCc6Rs+Bbc1/mOxtXEIps1AumB0P9xwVCcfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5029.namprd11.prod.outlook.com (2603:10b6:510:30::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 20:37:06 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286%5]) with mapi id 15.20.5813.020; Fri, 18 Nov 2022
 20:37:06 +0000
Date: Fri, 18 Nov 2022 15:37:01 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/i915/dg2: Drop force_probe requirement
Message-ID: <Y3fs7XFL0Mqs0q0V@intel.com>
References: <20221109001328.732000-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221109001328.732000-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR06CA0022.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5029:EE_
X-MS-Office365-Filtering-Correlation-Id: c1f4402a-23a7-4e5b-9ac3-08dac9a4a815
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7e0nOUZN+4Rb8H8SyM4P2yOuzwTR38Q6gnzlkXxMTtpZHuxDzp6dJjYL2NkvMa5abbTil0ghzdcTtkeSyZSwXuVyEvB8LUgR3tzbDV3sBYQCbSQkcWRc5sG2G2uvzfJ9zo9fcirzOsNNT0oG8T4KoMH07FU208QpYzctgox/NBLwrzvQbB+uurmhOX+xGlUlSTSQIV0zbj+A6Ga4f6yt+ofBo8NWKeKQv5xB4+2R5+IpA942zX4eXTTdJtToLCN+B3UhKQ3UN/S21uWchxmR0h2/QldzcgE8y03ecp029Z1PSqh5rUpMDARNarVJzyshDl+/w9obSKY6bqRo/V25PeukC91sr3s1hqtP6BTKpgzyKzhiOuPYtZ0jW60blhQVzfNP5nKL1k86Ahhk3myznq3s0nj0v9RhGoAtcEILit6RpSr1IdCQuQgCqoTAkY8QojDtmSiAB90JU0CRrMm8KA6K5Fxiym4nzxojlGpUyqUCaHIs/hOJvagzn9m59mkAq2XASg6dkJ3zWGiDoEaia9SlnbK9SH6gziJSYbINSd48GMkhWHqqHPxN6bANqyWUzOZSFeWJD+XGVGe1yab4nv8SMKaVxBQQTz9RAvHwAlhUvkfWztO1gMESMPAQytT+Lnm1Tv9rjfavRulGXbprAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199015)(37006003)(6636002)(82960400001)(6512007)(316002)(26005)(86362001)(8676002)(66476007)(66556008)(4326008)(38100700002)(66946007)(83380400001)(44832011)(2906002)(36756003)(2616005)(41300700001)(5660300002)(8936002)(186003)(6862004)(478600001)(6486002)(6506007)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gebeE/p+HYShMcRywFJhShi/p21d2gUcGZip+j3jIHM67LLdDAg4JD3f+dDk?=
 =?us-ascii?Q?1lGyUAuAxZHABYOv2OyZ9Bl6liWfS1gvMbRS7l0AEzAFtda1dpkrSFFov4Y4?=
 =?us-ascii?Q?gqceWDWqu1THNzWbg+P3QqjkhtQmtQFaCHLwcK3+YaO/2W90d2kZ5isCa8+R?=
 =?us-ascii?Q?UgLWhcghi+LX8wLfYxjJ1wo+2TI868MRZBbVbBjzvZb7BxCkMuK2b/xcwMsq?=
 =?us-ascii?Q?Ise7s+Ex2QTpMps4JrVLMDyDLQ7khtj2h08oG6gwkbx8Jb0qy9luzvaDotIr?=
 =?us-ascii?Q?wLZqGPETzVua32u7Ezq9Js+advqbDjlQYZhhf3tOb0TVVOOMJdld1sfIHs6b?=
 =?us-ascii?Q?vlLqeCA/XnyPCwRLeeeN2FFTjCAICAYq4NNcVb3t64ssm37Laqz98s5XZ1Am?=
 =?us-ascii?Q?QTVk/bzsOax8zptrlJ4qS+69jXHu6k/iIP0nJ4ON/5Si8cMzOxyUK2HJwtfv?=
 =?us-ascii?Q?/rbwds6xLjLOvd1y3ozu+c0353kNcZKxN+XublzTeEdwXT7e30bS6fZeGdei?=
 =?us-ascii?Q?6hZISzu+YbGIbJcdvJA6DaFuPpeZd7WeK4ZlzZ53OELMxdZUnbpXRHXWs6Tm?=
 =?us-ascii?Q?A8fKYYs1nj+eF4RBd/9FpYN7M0823lyluPKyQW6s++3q7AnAwHNYFnZeKoLp?=
 =?us-ascii?Q?eioAXF2tXKq13sEeum+CSXkcRWfpqlL/CpgY0FjyliiO8SsrEB7orP5JSY1M?=
 =?us-ascii?Q?4uvtlD/QABQ8QBFxHpOkuUz9xl0l5hngZGq1fqn6PBoJ26MYu+dUgovv8pAz?=
 =?us-ascii?Q?9WUqTAGL5GknQBP0/oh9HdATHUgQ08Znx3TAdkdaBVnjhz/HdAVZ9GQC3pe2?=
 =?us-ascii?Q?GkonlpjlQfMt435wmxd2c+4PI23M8fIJYFU59dYtUSr8DM0T3N7Bz2fBsVXs?=
 =?us-ascii?Q?QlA4jbxW1URisReBoxSxuTwR3FolEHtAmqr3vkv4ZUbphJ3/UCdnmpQZgpnU?=
 =?us-ascii?Q?z2UiI+DC2B5Pko4EAiRC0NlHA0a1Bdty5Uk6zBS09LsagZiVYW6/Vb+xWxQj?=
 =?us-ascii?Q?P+Retz4e2STZWv9W56s00RpC7y3KliFLlQNsRj1iFnGSaRGclZcboNo0+Jad?=
 =?us-ascii?Q?3Y3TOIFRc1IkPOnVyN6CUq/BDZxax2ST6X6fJ7bHdQZ8yqPjUQboYL05ZvJq?=
 =?us-ascii?Q?JhouPSlpIIcft3o7InB1hxKRv5Vj0DyL7U7/or69hHKw5HqpqH9l3b6MVlm6?=
 =?us-ascii?Q?MXpGYNhKqWxLzxtHAVZh5NKhi3e7amPsyRIBWSFdJ8ztoiWytzzeAMVCx9tv?=
 =?us-ascii?Q?hWOnkXazwb3DSq8tQErTdB4Jvn/pqrapc2IjCg47L5+/88naOwDKLUlv2CyU?=
 =?us-ascii?Q?eCxYIAdXhsuIelwI6AM3OtVJ1CtzziiILWksl4RIPibrk9FuavXFwexEeLP7?=
 =?us-ascii?Q?Umj0jknRz7X+bPxPZi3xNZANY/dM//zRU31M7fsaS2rNfEyrPE+RwWGHqGBS?=
 =?us-ascii?Q?GDd/oRx3gK2HvkrNPkkaw7afsmrqeOdzyKqVXAYHtUSfWZRhP8iWyX/wSQEl?=
 =?us-ascii?Q?+54YpCdaPw8kl8uEatlES8+ALpimVMMqGQyGOBkhSSO7bJpK2bHIpq1QaAa/?=
 =?us-ascii?Q?qzMoEJkROa83hBtcaULS1pftEF07L5F25VSqqo8J?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1f4402a-23a7-4e5b-9ac3-08dac9a4a815
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 20:37:06.0341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vXmINMkZdR7WZt0xgDKfp8wihmdwe7JeTVPf7T1vHlV7MbdOW1pKFfQXGo8QqoJKb8TQjCYP/JZIybAokE98jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5029
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 08, 2022 at 04:13:28PM -0800, Matt Roper wrote:
> DG2 has been very usable for a while now, and all of the uapi changes
> related to fundamental platform usage have been finalized.  Recent CI
> results have also been healthy, so we're ready to drop the force_probe
> requirement and enable the platform by default.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

I'm going to merge this soon. Thanks to everyone involved.

> ---
> 
> There was some recent offline discussion questioning whether we'd fully
> identified the root cause of some historic CI failures, or whether it
> was possible we might still have a bug lurking somewhere causing
> sporadic failures.  Let's use this patch to centralize discussion about
> any remaining concerns and make sure they're addressed before we apply
> this.
> 
>  drivers/gpu/drm/i915/i915_pci.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 211913be40ce..0866300243aa 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1078,7 +1078,6 @@ static const struct intel_device_info dg2_info = {
>  	XE_LPD_FEATURES,
>  	.__runtime.cpu_transcoder_mask = BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
>  			       BIT(TRANSCODER_C) | BIT(TRANSCODER_D),
> -	.require_force_probe = 1,
>  };
>  
>  static const struct intel_device_info ats_m_info = {
> -- 
> 2.38.1
> 
