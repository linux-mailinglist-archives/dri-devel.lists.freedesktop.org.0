Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E9567A19A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 19:43:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8249110E0B0;
	Tue, 24 Jan 2023 18:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D476610E08A;
 Tue, 24 Jan 2023 18:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674585828; x=1706121828;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Tdk3H170RumNlFamA2CiHoTHME6gEhvsvkxH1CMddhE=;
 b=a4++0TplZMnz1w7eqXCIds5WpmOmqfBC1NFNVQi3kj2d92nX2xGb0nqI
 AzoVwdf3IahOPz544IOQYMw/LFw2v+Y19FDoKheffeYTk9Prh7IkDbUh8
 zjxmv8fhmdBcNImc8EzXMMEvdaSbBsqXDwxApNAHKRemiRSQxSZf/02kW
 SGm/9MXZoFh2SIZfmxo0TBLBAw9/jcOIYtrrs7/6hs6Ug2jHhnIe1BJos
 hj8g5W3Tcha9/r4Y8w7AGOUTRRX3mKv8X0WjlIXuTy7wUgkueW+SkTUBJ
 /8sP/AjhclmpZsliGw6tjlImaCQJ7zIJoaN7GqPwC823KXwkRP5n4Tagr g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="328460889"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; d="scan'208";a="328460889"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 10:43:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="662226681"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; d="scan'208";a="662226681"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 24 Jan 2023 10:43:36 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 24 Jan 2023 10:43:31 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 24 Jan 2023 10:43:31 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 24 Jan 2023 10:43:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wji4TUCu+HIlWtixHcex8GZZlUd7qGN3ZJyD6tDV9YvrEBUSDFZ1FPMGK0fHhbl978Np6la9v5ccTE1cgKh2TBS0L/ncie2EvUbyteh9B0HdLh6/yfmjDTvvBn97T0lqsncVyPk7ywxu/k9zynQtuyFWe2R5mPoW+xntGQPWTX3LmlV3vtYCoLGkRHvwqCa+xuFB4JNpTDgYDgNKd9Yu99BTzKhJlgU3Ous6zuQypfqB7GXx5cvUg1j+R8uyvW5P8KWHAeZzp83IXzOjMujIjWkqHqFVXPt18Fij2G07YxsgWdJF+lLHkeq6Mlb4nTGumyJpKXbXtnIgki9eOQx2ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBe1qqbd2JXwTJNWZrtVMq8yF9M6pXZZYtetCtSuar0=;
 b=atUptkiVfLaNQfZefYRbFpshUfGfwaXFppHgRQOIn3LnTHfekcEji+jgoDXrSo5f+jex229rQRjL+DF4SmlZWX6KVO5NJSBstXqiH45i+4CKX1SzGdStGO/o0iP4rvnvwvEw5CxrZ7h0ub03IeEASjVC/Vln42GPZgDmv13azz7OB6ugCBfw1Cns/kmkrolkEyUCI3cJX7U5b5iQT+8jg6UiImVvTMq0KtWnXYW3BUY5ZNMfXcIH28uP2RQ2Qw3gh4R9iJ89v5KovUlITi+khBWxbG6p7Hkojy/o0zlyOtpNG5swaeEhfNvlNJESDIf2fNsNb2SW8y6GTPoaiKX6Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB7854.namprd11.prod.outlook.com (2603:10b6:208:3f6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 18:43:29 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 18:43:29 +0000
Date: Tue, 24 Jan 2023 13:43:25 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Juston Li <justonli@chromium.org>
Subject: Re: [Intel-gfx] [PATCH v6 5/6] drm/i915/pxp: Trigger the global
 teardown for before suspending
Message-ID: <Y9AmzVXhLTvPv3gC@intel.com>
References: <20230124053150.3543928-1-alan.previn.teres.alexis@intel.com>
 <20230124053150.3543928-6-alan.previn.teres.alexis@intel.com>
 <Y8/2iTQ1t3siFHKx@intel.com>
 <8fcafb5a34aba0a0080cd19a3a6c01ed8af1d3b8.camel@chromium.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8fcafb5a34aba0a0080cd19a3a6c01ed8af1d3b8.camel@chromium.org>
X-ClientProxiedBy: SJ0PR13CA0175.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB7854:EE_
X-MS-Office365-Filtering-Correlation-Id: 97f96fa4-4360-4aa5-8847-08dafe3ae2ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wrSj00R3higuq3zD6fcEgit+rGzflivOEwQ5t8pTLWaatbE6MNNdYtaicZkelzmuY1trhwtZVtiud5vIoERUnIimY8C9M9EPrS0X7+HvM5JIAuVON2DhuTH6l0Pr3EBYldXo787P3tGGmB/tSQnE5vc91wXIoe0DRaY376+mU3s7v489Rq0A8wyvpO5J6gFOEaLpNLwrk+ADzYY8uN3mQ1OOjcRYj4zd3+kRW7dWgiMH4/ztwXI1apId9fCw1+iS2tgdCntRrzRapIwJ1W4lxy+phC4AgwDBBnJ4yvX7AXo4E9scwxiUF4FZRD2a8kdzwmM2MYEBRVEbYSZKtwlEXTTrWuYc2D6HVS13PKq7q+yr7XQHzcP1SdZsKFjBa/mDIKULXYVg5CyM4LTZxknk0gbzW+zlc1E5REYXkYQa2aavxc/7tXmm6l5mwvG6D9P+BVILWkkz2M/f48uqNWG1YiSnLzfQqtyBpU8xv8w0p7ktR6L3LIYytrUqB1uI4eLp4FaUHMNCAPcL35egKnzW+W4tJrFTFNOG84f2Vh97aN+9IBHFgc3ZIU74uylIa360aytIb4Ydj+wpc+K1aIywdnVsjxj0IWqjbaPVl8/mdWgHFf1F+AwpGwO+QGLZ9cO7ztMQjQ50TvmbiGX20t4/8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230024)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199017)(6916009)(8676002)(6512007)(186003)(26005)(66476007)(54906003)(6506007)(107886003)(83380400001)(6666004)(86362001)(66556008)(4326008)(478600001)(82960400001)(2906002)(6486002)(2616005)(8936002)(44832011)(36756003)(66946007)(316002)(41300700001)(15650500001)(5660300002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qPuCqlD+tdwiP+hV2y5tg+ZiuqbubFgnCRJTgKmgM9xY6ufp4xDc4YWYQW?=
 =?iso-8859-1?Q?f9UpfxE3DkF/cFclVBImAMStEdOP9tfo9gBJOsivwrNlPJccf9E9UMJNme?=
 =?iso-8859-1?Q?HNLT9xsPbjKpPX0PN5gGZh2vn8dL9HtlxRvzu7OztmDnh5Cl15C1lHNrQ9?=
 =?iso-8859-1?Q?l1TJg/LzwboukLq8dejtmB42pD07dhAmPZDEUsWvp2lvmXHZ+k5qJdQrVt?=
 =?iso-8859-1?Q?lR6w6ypU3MT6aCiov5d8Gi8CISruiH72urBwrIvWhIzUKNQ+93u5Z0vuVN?=
 =?iso-8859-1?Q?EAzKgEWIufWPjvCpGI/sLEH5IBzEq29qYPe16MDHrMtt41BmSmKsQOEVhf?=
 =?iso-8859-1?Q?6BkUEwLcLJfgUFa9dPfIQ5i69Xx1NOOw3mvsBTGN9VUmvqV5EzJRpk22EN?=
 =?iso-8859-1?Q?UJfaZmlr4w+zjQ0UFd7oxikW8pooD5xNXOQpLRqItXHWTvm0LotYggTJ+j?=
 =?iso-8859-1?Q?qkzzLvZfvp9TxKN8Q7G5ZCXKLi5HIL2C49gCf9JSYqKRGkRxWuRY6i7yYQ?=
 =?iso-8859-1?Q?FoJGr04ocCE4LiJYrPWfAWcFlSvM/6LHSVFkaPBP9jaMCP+PCkMS78lnPi?=
 =?iso-8859-1?Q?XFtOjRuNkU5jlww32RaOcJzaD2psoRS9ZTx1RoF1JTFHt91G7KY2cSWP9z?=
 =?iso-8859-1?Q?sZgja0G/ASq2Ix+Hxbsdbd+GoULQLeq5k0Lv926KkaGz60ZZR90gWjQSWu?=
 =?iso-8859-1?Q?bF1AHt+R9CcTHeQBtgrmD7hl7BdlV0dSdjB6oRwIbhKg7Ge/Z7zoBRQ3mO?=
 =?iso-8859-1?Q?kjzGZytkqsr0DF0wlM8yZrEyVwPfbUDOFms4Mqzc/oc5erd/3ZkAcjrNT2?=
 =?iso-8859-1?Q?cwg7rd+Hv3fvTDWk0ci5VpMHk21y5P7fODu1RlyHZtKq6WZMk/txPE3DBA?=
 =?iso-8859-1?Q?jZKj506O8T6x1tEp847i6ALvLxl1B0lV4nWy90eRtA9nMDJ3x8X2Q0flWs?=
 =?iso-8859-1?Q?8HJrynV5eoe+NBrCj8GIRiaWD9eKV3dhDZYWXnSJD7iUnaRDPJVkbjrvv4?=
 =?iso-8859-1?Q?dBzLuhNJra3b7d2V5q8vtrQ+hteVVVTCbShGmTFzUNaf/4oZfZEDo4Q1lP?=
 =?iso-8859-1?Q?0ZyS91D0M9qWQsEqXiyuJ52B36eAGjnTW94Y5R7d7M3F7HivIWleFpWISQ?=
 =?iso-8859-1?Q?4C2btxlctvbafC0Dv4i3JuSd8Yj/4s1clGegpXvc/NHxeEb+ndflJcw5Gg?=
 =?iso-8859-1?Q?e58ymoGLCqVZcUKKGhwadzau70ezXsdayWkKfTk9EMVYXr7ZD1XNbpT1Kh?=
 =?iso-8859-1?Q?pOveU0c17VbSsF8676Ywi/kxKqA9ZeTm8g7iy6l11lqs8qMxX0xEFlOcGp?=
 =?iso-8859-1?Q?EtX7Q6iGRCrbe3AtgOWLCaOZzlqWJQYMELhjRHSd1qLTAgv1KtllyaXfPu?=
 =?iso-8859-1?Q?lfb4Zzihn0pO+/N9y4dncfk8pRaR1MWRG+nSoSYVzrYm10Vc+2R6TDeBDz?=
 =?iso-8859-1?Q?y4M4k+VAZHVcuU+lkv6eFAiKaNHAkwXAj4jhcvmb9DdsFEg67biR/oqQ9r?=
 =?iso-8859-1?Q?y5G+W5qTQn4seSRSrEjwEaTmIGMlCjrC4Jl/NYNtW8g/FiLhFmMEj0qAJn?=
 =?iso-8859-1?Q?YKAUEToH7wyyZn615CLxEdl2kUoTiGp7g0MEDCC8z427CufwbTzq+LrX4d?=
 =?iso-8859-1?Q?wt7Pttf3hq1AqnDOXlQr0foGIVNzc5wlP3lSI0VrijAhApBf7wcVsI7g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f96fa4-4360-4aa5-8847-08dafe3ae2ee
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 18:43:29.7531 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cfEnMkX2bhmA3QtqLj+ck7/10MdqRQjzXHWNmfobdEZs+7tfOPYt76Ar5Za4I7LIIQVX4J9TvsKE4QbK6j332Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7854
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, Alexander
 Usyskin <alexander.usyskin@intel.com>, dri-devel@lists.freedesktop.org,
 Vivi@freedesktop.org, Tomas Winkler <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 24, 2023 at 10:08:52AM -0800, Juston Li wrote:
> On Tue, 2023-01-24 at 10:17 -0500, Rodrigo Vivi wrote:
> > On Mon, Jan 23, 2023 at 09:31:49PM -0800, Alan Previn wrote:
> > > A driver bug was recently discovered where the security firmware
> > > was
> > > receiving internal HW signals indicating that session key
> > > expirations
> > > had occurred. Architecturally, the firmware was expecting a
> > > response
> > > from the GuC to acknowledge the event with the firmware side.
> > > However the OS was in a suspended state and GuC had been reset.
> > > 
> > > Internal specifications actually required the driver to ensure
> > > that all active sessions be properly cleaned up in such cases where
> > > the system is suspended and the GuC potentially unable to respond.
> > > 
> > > This patch adds the global teardown code in i915's suspend_prepare
> > > code path.
> > > 
> > > Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> > > Reviewed-by: Juston Li <justonli@chromium.org>
> > 
> > it should probably contain some revision history above so the
> > reviewer can know what changed from the time he reviewed and now.
> > 
> > it looks we have another function that I don't remember...
> > Juston, could you please confirm your review stands in this version?
> > if so feel free to add my ack with that.
> 
> Sure, v6 is:
> Reviewed-by: Juston Li <justonli@chromium.org>


Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> Appreciate the reviews/revisions Rodrigo and Alan!
> 
> > 
> > > ---
> > >  drivers/gpu/drm/i915/pxp/intel_pxp.c         | 65
> > > +++++++++++++++++---
> > >  drivers/gpu/drm/i915/pxp/intel_pxp.h         |  1 +
> > >  drivers/gpu/drm/i915/pxp/intel_pxp_pm.c      |  2 +-
> > >  drivers/gpu/drm/i915/pxp/intel_pxp_session.c |  6 +-
> > >  drivers/gpu/drm/i915/pxp/intel_pxp_session.h |  5 ++
> > >  5 files changed, 66 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c
> > > b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> > > index cfc9af8b3d21..9d4c7724e98e 100644
> > > --- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
> > > +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> > > @@ -270,6 +270,60 @@ static bool pxp_component_bound(struct
> > > intel_pxp *pxp)
> > >         return bound;
> > >  }
> > >  
> > > +static int __pxp_global_teardown_final(struct intel_pxp *pxp)
> > > +{
> > > +       if (!pxp->arb_is_valid)
> > > +               return 0;
> > > +       /*
> > > +        * To ensure synchronous and coherent session teardown
> > > completion
> > > +        * in response to suspend or shutdown triggers, don't use a
> > > worker.
> > > +        */
> > > +       intel_pxp_mark_termination_in_progress(pxp);
> > > +       intel_pxp_terminate(pxp, false);
> > > +
> > > +       if (!wait_for_completion_timeout(&pxp->termination,
> > > msecs_to_jiffies(250)))
> > > +               return -ETIMEDOUT;
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int __pxp_global_teardown_restart(struct intel_pxp *pxp)
> > > +{
> > > +       if (pxp->arb_is_valid)
> > > +               return 0;
> > > +       /*
> > > +        * The arb-session is currently inactive and we are doing a
> > > reset and restart
> > > +        * due to a runtime event. Use the worker that was designed
> > > for this.
> > > +        */
> > > +       pxp_queue_termination(pxp);
> > > +
> > > +       if (!wait_for_completion_timeout(&pxp->termination,
> > > msecs_to_jiffies(250)))
> > > +               return -ETIMEDOUT;
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +void intel_pxp_end(struct intel_pxp *pxp)
> > > +{
> > > +       struct drm_i915_private *i915 = pxp->ctrl_gt->i915;
> > > +       intel_wakeref_t wakeref;
> > > +
> > > +       if (!intel_pxp_is_enabled(pxp))
> > > +               return;
> > > +
> > > +       wakeref = intel_runtime_pm_get(&i915->runtime_pm);
> > > +
> > > +       mutex_lock(&pxp->arb_mutex);
> > > +
> > > +       if (__pxp_global_teardown_final(pxp))
> > > +               drm_dbg(&i915->drm, "PXP end timed out\n");
> > > +
> > > +       mutex_unlock(&pxp->arb_mutex);
> > > +
> > > +       intel_pxp_fini_hw(pxp);
> > > +       intel_runtime_pm_put(&i915->runtime_pm, wakeref);
> > > +}
> > > +
> > >  /*
> > >   * the arb session is restarted from the irq work when we receive
> > > the
> > >   * termination completion interrupt
> > > @@ -286,16 +340,9 @@ int intel_pxp_start(struct intel_pxp *pxp)
> > >  
> > >         mutex_lock(&pxp->arb_mutex);
> > >  
> > > -       if (pxp->arb_is_valid)
> > > -               goto unlock;
> > > -
> > > -       pxp_queue_termination(pxp);
> > > -
> > > -       if (!wait_for_completion_timeout(&pxp->termination,
> > > -                                       msecs_to_jiffies(250))) {
> > > -               ret = -ETIMEDOUT;
> > > +       ret = __pxp_global_teardown_restart(pxp);
> > > +       if (ret)
> > >                 goto unlock;
> > > -       }
> > >  
> > >         /* make sure the compiler doesn't optimize the double
> > > access */
> > >         barrier();
> > > diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h
> > > b/drivers/gpu/drm/i915/pxp/intel_pxp.h
> > > index 9658d3005222..3ded0890cd27 100644
> > > --- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
> > > +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
> > > @@ -27,6 +27,7 @@ void
> > > intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp);
> > >  void intel_pxp_tee_end_arb_fw_session(struct intel_pxp *pxp, u32
> > > arb_session_id);
> > >  
> > >  int intel_pxp_start(struct intel_pxp *pxp);
> > > +void intel_pxp_end(struct intel_pxp *pxp);
> > >  
> > >  int intel_pxp_key_check(struct intel_pxp *pxp,
> > >                         struct drm_i915_gem_object *obj,
> > > diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> > > b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> > > index 892d39cc61c1..e427464aa131 100644
> > > --- a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> > > +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> > > @@ -16,7 +16,7 @@ void intel_pxp_suspend_prepare(struct intel_pxp
> > > *pxp)
> > >         if (!intel_pxp_is_enabled(pxp))
> > >                 return;
> > >  
> > > -       pxp->arb_is_valid = false;
> > > +       intel_pxp_end(pxp);
> > >  
> > >         intel_pxp_invalidate(pxp);
> > >  }
> > > diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> > > b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> > > index 74ed7e16e481..448cacb0465d 100644
> > > --- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> > > +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> > > @@ -115,11 +115,11 @@ static int
> > > pxp_terminate_arb_session_and_global(struct intel_pxp *pxp)
> > >         return ret;
> > >  }
> > >  
> > > -static void pxp_terminate(struct intel_pxp *pxp)
> > > +void intel_pxp_terminate(struct intel_pxp *pxp, bool
> > > post_invalidation_needs_restart)
> > >  {
> > >         int ret;
> > >  
> > > -       pxp->hw_state_invalidated = true;
> > > +       pxp->hw_state_invalidated =
> > > post_invalidation_needs_restart;
> > >  
> > >         /*
> > >          * if we fail to submit the termination there is no point
> > > in waiting for
> > > @@ -167,7 +167,7 @@ static void pxp_session_work(struct work_struct
> > > *work)
> > >  
> > >         if (events & PXP_TERMINATION_REQUEST) {
> > >                 events &= ~PXP_TERMINATION_COMPLETE;
> > > -               pxp_terminate(pxp);
> > > +               intel_pxp_terminate(pxp, true);
> > >         }
> > >  
> > >         if (events & PXP_TERMINATION_COMPLETE)
> > > diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.h
> > > b/drivers/gpu/drm/i915/pxp/intel_pxp_session.h
> > > index 903ac52cffa1..ba5788127109 100644
> > > --- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.h
> > > +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.h
> > > @@ -12,9 +12,14 @@ struct intel_pxp;
> > >  
> > >  #ifdef CONFIG_DRM_I915_PXP
> > >  void intel_pxp_session_management_init(struct intel_pxp *pxp);
> > > +void intel_pxp_terminate(struct intel_pxp *pxp, bool
> > > post_invalidation_needs_restart);
> > >  #else
> > >  static inline void intel_pxp_session_management_init(struct
> > > intel_pxp *pxp)
> > >  {
> > >  }
> > > +
> > > +static inline void intel_pxp_terminate(struct intel_pxp *pxp, bool
> > > post_invalidation_needs_restart)
> > > +{
> > > +}
> > >  #endif
> > >  #endif /* __INTEL_PXP_SESSION_H__ */
> > > -- 
> > > 2.39.0
> > > 
> 
