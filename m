Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 769B36C93FB
	for <lists+dri-devel@lfdr.de>; Sun, 26 Mar 2023 13:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E8C310E081;
	Sun, 26 Mar 2023 11:18:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18E310E080;
 Sun, 26 Mar 2023 11:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679829526; x=1711365526;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=J61IB9sp6PhiIP0GlOeuth3wKYOCxgxTKCcvpaHNAnw=;
 b=RrpBeGX0ovQHD2c0eu54dgIORV8BxGnphK2D+HNn0aLQZLWvuOK6AvFN
 0jL0LHaTXGDuHdGcae2ylKMkZRKfiIYv2JuUcM0YDXpiJwWisoc1Y8ldv
 FTn/Fi4ft8jphqfXpx+07YQ1vQgqeiu+bTulrQ5hdv1sHpFm4uGW2GQ0i
 MhT62AFvuadYNp28z4jc3Ca88z8c60LYIwOPg/AHnNojj2nq3V+HFWN9e
 GBo47BEgx3l18i0hXJmJbr4cBjwIRDZ4gs7J+ytSIQ5ZO1B3z/0guPDXA
 4pPrSusPp9ZWNCD8y6i+Wd6KsYdbv3B2Ex7O8sUp9Db8iWr9c9MtV9NZw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="323957469"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; d="scan'208";a="323957469"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2023 04:18:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="826733765"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; d="scan'208";a="826733765"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 26 Mar 2023 04:18:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 26 Mar 2023 04:18:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 26 Mar 2023 04:18:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Sun, 26 Mar 2023 04:18:45 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Sun, 26 Mar 2023 04:18:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ps3hmcDFWfpjrssUwVz+Tlpyo6XMfYdgyiDLKpg3F+aMmcCQS28JUPDnmfg1Da89AlZzFN77YKQSrIVQU9Zwq7q+ALb7tSv5ab+vMYw5Ln/hat0oWQoCuo2oi6QXeSrsGEZqTZQbMDG7WYOy/fejO877+gPdWutjyvzZ0gXueTlZKrMk2GNxlQYxyxeXk9JtIvdUBoMPl+bff6yNOKV8IRA89ObYmYvPjqpsdNVlbQb6jZWtzAPdrZ04kdd2GARTESVug+5q0zsISGnpIm0R9fYiwyUnNM4GgUhq9tkWcuJ7xRaFuuIMrxNRIx8eK2JIg3OYTPcZdiX7InDDktCEog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osFIawZ6MY1Ld1Csa7FqEF9qzniqMwBUTYm7A8Po4ec=;
 b=KJia+fAj7gxkCPtt7FtWruPuByKMHL5mFphdLk7mEbPjBxWWLBcwhg/lOQC00TSImP0nvD+keli65Ett55SygWGIfiBtxOM0IGhvCP3hz/6ykJ/GYhXBzJlOVvpe0pJ/z1cWs9BVIL5WmHGoHtsdewlkkkiCtDKOWIYxkVeuUJlue5XH+n3kq/TBvTxfefUVGhSqvZo4BLqkCg+m8aZVpxUuB6i6ACIB4QArvLCS2x1qKpGFUf6r2dQndCv0g9BwiPPn8Vie88QwYCKsz+LFHyClWbsGLmQUs7j11NeDSy587VEKvFG9sjoSkUuugs4dc9fVzrk+0+gvHTU2g3zgoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7359.namprd11.prod.outlook.com (2603:10b6:8:134::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Sun, 26 Mar
 2023 11:18:43 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6178.041; Sun, 26 Mar 2023
 11:18:43 +0000
Date: Sun, 26 Mar 2023 07:18:38 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH v6 5/8] drm/i915/pxp: Add ARB session creation and cleanup
Message-ID: <ZCAqDlUIp0YmCkyu@intel.com>
References: <20230228022150.1657843-1-alan.previn.teres.alexis@intel.com>
 <20230228022150.1657843-6-alan.previn.teres.alexis@intel.com>
 <fabe4123-53cc-005e-e0af-7683e0d45896@intel.com>
 <3b8091c51677878b968d1d275b9b16e5088d913d.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3b8091c51677878b968d1d275b9b16e5088d913d.camel@intel.com>
X-ClientProxiedBy: BY3PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:a03:254::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: 01bcad05-c6ea-4582-9478-08db2debdb71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: noXyDju6u0W2pT2+/G5uvRhDSrCHKOc3M+nlG9nots+9F3eovW6bY6avXmdu2Azj7xqj7KMxl+GDIpXPT41Asw11n8JFQDeGzsneCo+PyTQEZ4y580osTMx3e45AfsNFjt/ChFGw03rYc4U9QhCQY5fg06x1r+b6alLS/MT53LCQYOnEI32reeSRVfEF0Bvoj0IGzvsWQPcWT0CzUHKMNqq27Cax6IfSJXXTWKnK6dLXnTrkd0x59CTpbniNHE5UlsMq/tuISBdUASKrZ1a/kEqsu6nVe40m7G9R+CaOuXAiOW8iJvgAw4kWMhClAN1UzUKz9FECNsYZcmg3VxuquP2HNO+HAifLRhck8bmD3aSFluhn+E9FYrHOmMHrZYjnHIkf1KvIN4ZKQZPq+FWFDClwrMYjd5XgNamRUc+jA4sY/Dlp9cEczNY8oMEBmRRwiAGLxvIG/qLcmV+oWW3LwVXDayIIKexe6CyHGxQXVh2OMTibb3ZaaH9+ga6i1U1aqo+bcb4pN3gDDFzKzaCdlUMtF+8nEJ0XIXkOkHrWaNYPoOFgeubYHG7bFjQ4VdXM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199021)(86362001)(36756003)(2906002)(44832011)(478600001)(6486002)(26005)(6666004)(107886003)(83380400001)(2616005)(37006003)(54906003)(4326008)(6636002)(316002)(66946007)(66556008)(66476007)(8676002)(186003)(6512007)(6506007)(82960400001)(38100700002)(6862004)(5660300002)(8936002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+ol2TuUXAIjPXRESamQhdfZMf2EzvOez9a8EVa1NwUp7MI4KZFgZ3YWWhlU2?=
 =?us-ascii?Q?klm2urNNsJbZoGsIUgz7fgyLdUcpuLncb0fDjjd3Yi88WCgcYOdn22wluEsb?=
 =?us-ascii?Q?ahy8/ajhBTb49+0Jq5nEcjIbSTjBZLWvhcOqOaCQuLeBaHedaMdKWUjqy77D?=
 =?us-ascii?Q?RrG5nS/DDbJroYR8/1o17ctUt9pftH3CGdqtud59bOZnG9vBR5/NQd4IvkNK?=
 =?us-ascii?Q?NkPvFcV50kO4LNTz15AYR/9l5JmQZN+Z+DVGonkkEkWpSzhhcHG3n62x+6y0?=
 =?us-ascii?Q?gssU0x0EtyYUqDXa5uQuRviy5MJ3Yw7UozZN9/+XnriLGHBOaqoPJVGARa1s?=
 =?us-ascii?Q?QGSb21Bh8UdBfdP5TxFwZWwQbo+Sn50BYenmQ2cfrbJrDgz6vAC6BrkltNBs?=
 =?us-ascii?Q?n+JJw4nd/FkmQnMCvTWMIFWURD9ZDg5+Qxd4SUa0JAL0KydIJYbcDUB3Vjlg?=
 =?us-ascii?Q?T1Z1En7KKulbGINv7hTbOChf7KAiW/hCn273wlBuJ4A05TzTvA39XYKPX7tc?=
 =?us-ascii?Q?aEMeXd5Ba02MgMwEgtW/1ieojrVtwmtMKDyvendaZkhHdyLZyYdtgT8UE9U/?=
 =?us-ascii?Q?OnyhSnsRYfgRKH9vkSESN4w87G2qLh+D0OS5C/FyRs+VsToewgBz+zBGWIsk?=
 =?us-ascii?Q?gtIVKjT9RtjRL3on8mvs2W31w3ABfyVXxyye+XRqwrGiVVCUuBXcmLRcPdNP?=
 =?us-ascii?Q?XIsxjf4ckHfjruO63jmaT3Jv4TNRE694L1X/6u14ofGzgEBP+supy3+Njgq5?=
 =?us-ascii?Q?PtVpamCRIiVebZSOLqEKRkAbT7Gm+sHR0wMWKNHx/G6QksjKOzNSwwnchT9I?=
 =?us-ascii?Q?ttAbuNEsCMYeNMoABV5sov4G1wyE4x4FWVj3ctvSfIWghjq+jJXsliSfuGGN?=
 =?us-ascii?Q?EVSPEvHBwRHWRHMikHfsAmjrAGmO+YBu9c3tIZ1bI/JRXSEHAGl50pREkF2K?=
 =?us-ascii?Q?qMjEm4dOWsp7W1eh5/GyHGNWecGxKbus6H7f+fFCxm2besIGFksdVIdsGaQV?=
 =?us-ascii?Q?thvOt+69LrGoko5ZWOsf8eU5SFuVop+9h2KFIuDisbuSSHTfDUNtvqzPXOBJ?=
 =?us-ascii?Q?VxePfq5ng2Zpv+PagO6lpcc+FI60OocoKzbFjT2/99HJr9gyqGKGX8kVifxf?=
 =?us-ascii?Q?YhuE5hVT24YXA62u1ksd0kp4TrHP0l2ipPvK4r27otbG2rtOXVJ7Xzo/Cj3q?=
 =?us-ascii?Q?ON/ALaKOHvHEC6sp7zv75PgNVMsIXRhH9QHVAbeQ7R0J9m81j8u0OPBPpR+v?=
 =?us-ascii?Q?7+IOInjl5yfLvGsHUTKHqdOl72rnj9xemy5gRzvStg53POayhLXdd/0I/Kp5?=
 =?us-ascii?Q?McDjLlzaYZBb6dzON04hLvLkc8MSi8vGQYgarFga5SWiLgBqwOMfLxR6ryrA?=
 =?us-ascii?Q?LWD2mih5hYfu/dwzOCcF5/CYhKwezx2g3sAV2lJAQbBL9i48iSCHshuEi3iC?=
 =?us-ascii?Q?l6VtYJIgs+GnlaVMrogGMnvu4aKHw6UOZQy7cNTWQtDUhRnH5CT6uJjmAYQc?=
 =?us-ascii?Q?M3rh2Txhg1PKVsmi6MTSFFVyD1Cv6o0myWUnL5YLCa+CRXQmYSG0svGG0L5J?=
 =?us-ascii?Q?BNZxn71HA71gUMOwOTMmLP3RDK0/WsBBBVjbgyid?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01bcad05-c6ea-4582-9478-08db2debdb71
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2023 11:18:42.7618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KLvZTvqF5yVEDy9bq1DY2lb5AorfzDaCt1vZ/d9uoq9Gx1lL6a9ccXCcd2f2QfY888Nm1ZhAvaWf4i+Dntbt1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7359
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
Cc: "justonli@chromium.org" <justonli@chromium.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>, "Lahtinen,
 Joonas" <joonas.lahtinen@intel.com>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 25, 2023 at 02:19:21AM -0400, Teres Alexis, Alan Previn wrote:
> alan:snip
> 
> > 
> @@ -353,8 +367,20 @@ int intel_pxp_start(struct intel_pxp *pxp)
> alan:snip
> > > +	if (HAS_ENGINE(pxp->ctrl_gt, GSC0)) {
> > > +		/*
> > > +		 * GSC-fw loading, GSC-proxy init (requiring an mei component driver) and
> > > +		 * HuC-fw loading must all occur first before we start requesting for PXP
> > > +		 * sessions. Checking HuC authentication (the last dependency)  will suffice.
> > > +		 * Let's use a much larger 8 second timeout considering all the types of
> > > +		 * dependencies prior to that.
> > > +		 */
> > > +		if (wait_for(intel_huc_is_authenticated(&pxp->ctrl_gt->uc.huc), 8000))
> > 
> > This big timeout needs an ack from userspace drivers, as intel_pxp_start 
> > is called during context creation and the current way to query if the 
> > feature is supported is to create a protected context. Unfortunately, we 
> > do need to wait to confirm that PXP is available (although in most cases 
> > it shouldn't take even close to 8 secs), because until everything is 
> > setup we're not sure if things will work as expected. I see 2 potential 
> > mitigations in case the timeout doesn't work as-is:
> > 
> > 1) we return -EAGAIN (or another dedicated error code) to userspace if 
> > the prerequisite steps aren't done yet. This would indicate that the 
> > feature is there, but that we haven't completed the setup yet. The 
> > caller can then decide if they want to retry immediately or later. Pro: 
> > more flexibility for userspace; Cons: new interface return code.
> > 
> > 2) we add a getparam to say if PXP is supported in HW and the support is 
> > compiled in i915. Userspace can query this as a way to check the feature 
> > support and only create the context if they actually need it for PXP 
> > operations. Pro: simpler kernel implementation; Cons: new getparam, plus 
> > even if the getparam returns true the pxp_start could later fail, so 
> > userspace needs to handle that case.
> > 
> 
> alan: I've cc'd Rodrigo, Joonas and Lionel. Folks - what are your thoughts on above issue?
> Recap: On MTL, only when creating a GEM Protected (PXP) context for the very first time after
> a driver load, it will be dependent on (1) loading the GSC firmware, (2) GuC loading the HuC
> firmware and (3) GSC authenticating the HuC fw. But step 3 also depends on additional
> GSC-proxy-init steps that depend on a new mei-gsc-proxy component driver. I'd used the
> 8 second number based on offline conversations with Daniele but that is a worse-case.
> Alternatively, should we change UAPI instead to return -EAGAIN as per Daniele's proposal?
> I believe we've had the get-param conversation offline recently and the direction was to
> stick with attempting to create the context as it is normal in 3D UMD when it comes to
> testing capabilities for other features too.
> 
> Thoughts?

I like the option 1 more. This extra return handling won't break compatibility.
