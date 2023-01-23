Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19535677E11
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 15:31:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5714710E4AC;
	Mon, 23 Jan 2023 14:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEEC410E4AB;
 Mon, 23 Jan 2023 14:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674484289; x=1706020289;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=88KIuvQPzsamoShe6JJz5vCULvS5CdazkolZqX7zGKE=;
 b=NwdzHubzfMd74m0B9yJjIh/CJ+QvRPkYAC9urxCB/4riXagG2cq78dzC
 EqglLCirnXbcYvJt4Hu9GRaOfQr21nywT1nBjFazuQ/xbu7w7AuovqvHW
 l5u8VljRSLeptnADMWO/D/guT+gjP2PHO/Ct8gyGkShVWmWCOLiTPqBDK
 JM2JY1Kne07dr28xbU2yemm5C8DHWUn1nFCHbxIuYIx6C7DPng1F7AUHD
 GfZJyEkXJFVt4odHXnG5sCE1eEsFlJky4T6pikiqp3LtVVEOcoKRdnvvL
 DZ4qHP220Z3x7qG5CdM9fSzhtqXTfJLNjkaYSPxbvEzvT04fkHMHOSoUq A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="313944528"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; d="scan'208";a="313944528"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 06:31:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="907042509"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; d="scan'208";a="907042509"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 23 Jan 2023 06:31:28 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 06:31:27 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 06:31:26 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 23 Jan 2023 06:31:26 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 23 Jan 2023 06:31:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5bfFA2Qx/3kGULwUv3Wg6LOBS00YbPpS+RiwPP3GKxzQhlddeezztyE4Y3fb8o8wyhCunwXaWHJtOhP9HutCleAQUnm8B72VDxir93Age6qhQf29Gpav5cM33E1pGeOVqYhf9Hb4lwmZtITy2NpNSa/ZzSNqbN0mLC3xNDwoYjBLxT5lAxN/WHGLPFgoS/t2Gy/QkkR1eFBVK7ssFNdp9/6OLufl5Lh8DUySFPWU+Ph6VxQML59bcXF/tNX6dIqYnvS98e/UqkvZSamvsWwszRLwxWwmh1weETdvNwu5W3o/x29BNN1juyYzMj3AGP4Uu2k81euTQ6/SJ8aS3MSHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nIf4T223K6XxigwvRtgnH2DNgRMonl5F+XskEcC8gM0=;
 b=Q5VWz6BP1ZSvAcNXoY+DHbUPr7CJx1I9o2pj0qK/nNwz3cS2GCe2hUABTaQe3MF3b4bN/lFl+XWifw8DuhGFYHnD2tULK0hMfvTEK3INxVCTgN766wY6OV28GRKn81MAX/GOSzFrCyjKGK8IheWLanjFnKpYImPrgvfAAi1U0azBwLnNGHAcPy5fKrHP8oqpR+HdHTk/kVKDGvkJPBqF2OEpHCFyaK1YQHUXulDcpdjLY3/he0bWF42OyNopvvsGmW2H0gmodthFH9BngJsvuSc8RCyz/qOrTW/dOO+pT/qx3nXlAtwm9dBAsBURj6ii2ZYFmaOavsNugUe/tWHl9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS7PR11MB7740.namprd11.prod.outlook.com (2603:10b6:8:e0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 14:31:23 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 14:31:23 +0000
Date: Mon, 23 Jan 2023 09:31:18 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 2/6] drm/i915/pxp: add device link between
 i915 and mei_pxp
Message-ID: <Y86aNv0G6qC+DNHx@intel.com>
References: <20230113011850.1463965-1-alan.previn.teres.alexis@intel.com>
 <20230113011850.1463965-3-alan.previn.teres.alexis@intel.com>
 <Y8mZGMjjlTW3U0jA@intel.com>
 <CY5PR11MB63660409E141F1D0E65A9B95EDCB9@CY5PR11MB6366.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CY5PR11MB63660409E141F1D0E65A9B95EDCB9@CY5PR11MB6366.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR07CA0044.namprd07.prod.outlook.com
 (2603:10b6:a03:60::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS7PR11MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: d4812e9f-6822-4357-68ca-08dafd4e8096
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U9v8e1SbHKlH6SP+RFWEEy1978ZghXL/+LSBpCH2bfSViEn/Ry0txTrMHGCo1DHb1cuaBXqYbGZMSSQl7JzNPgW5HTOVrg8i76YfpbpQdSjUiKufaHDsFMCYZupgr2Utr3BUCbN3r125EmPjl7TO9gWvb/IIUAMuo+X/058nALoZ5nmu8giPq9MPFU01BZRPIysmLgBCBPPYto6/JGqpNdJJXjShgwqKiCwrunP8Y5l2GUyNggIWWVDdBVUULiL2tdAG1nNq4AaN3ygY8B94ZK8QBqRohjen3YgkenqHGKBnVGMclKgG9oLRZ80s/VODfL6qv308ZcOwMXHHdznQoGP19u6h1CmAoW0RRPXuLHhzpYTcmcwrhMetrXtTTjLP7ws4jLfGc3mzF0puAm0iU44qFU/KSRUPWP60+GU1pEPzGOvjk8MKUogmcJ8aJvk7J5H/jVcGzpp/+IF8MTnf1eiwalLH/TrQJmyIlUXQpUqpowuwT6aBbWdRDdnXlDfRGsd+yGFewcvBo4GluwAvr6+OPWK/bXN8VC08zQ1LPwY0DLD04ahb9k+v1dtXUW+uHhJEzeJbnr8XY2PyQehqJ2cRnNyAy/4YGbmzLTVLh2NSTfLw+SGwIkfINhKADJBs11H05px7o2TOS/j6TMWCgnWg0bT/owG4DZHI0JPmZacGezfwnd+wCRssgYJ3Mn6J
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(396003)(136003)(366004)(346002)(451199015)(478600001)(82960400001)(6486002)(38100700002)(6666004)(36756003)(6506007)(6512007)(86362001)(26005)(186003)(8676002)(4326008)(66476007)(37006003)(66946007)(66556008)(316002)(83380400001)(41300700001)(2616005)(54906003)(6636002)(2906002)(5660300002)(8936002)(6862004)(44832011)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Enbh8EYVBrlWJt5CswTRtCgK63OAd/fXMIO/rdQzTegE/meSHsfo7cIJn/Yh?=
 =?us-ascii?Q?qCRpbMFh80uw1ZgWbdbOKwgFVe4ta4BcenhekjyYsFnLZe0eJ58MOwpNk3nh?=
 =?us-ascii?Q?Y1sMBiqMYVbC2dVxjSBVoG9008jryllXDXfqYi8+6V6NNb+yFdB82XeVLlXQ?=
 =?us-ascii?Q?k9Rjyd659sx2ysazAnWlUHEksP037vU8LQdEVC9JFqmOwXTgTAQXAg4FXk+n?=
 =?us-ascii?Q?ufZTTXCpwzHThuxLMBo/yxlIromELZ2+or/fgIgIgF1nOfCOBZd1yK7pZyeh?=
 =?us-ascii?Q?i1ZEvzvxHVjLmTC+yvQ4RoPB3fZbIdftRCDlRk4Y/32orxC6sYHpR0lLGg3Z?=
 =?us-ascii?Q?pV1raMIs3NgJwpmqL9pIM7bZhZ57FvChBFH44ZHtLDY/e/iURMQaPTrj3K15?=
 =?us-ascii?Q?hxwcjBBTfSoFkdhjoa/DZLVYFxvmG6djUShTKxBGpNTxVgIW5yGuHDe2hhTY?=
 =?us-ascii?Q?akyfdAquSSR7FogZIlQQfqho4XVD97ZB2OEAoDB8ByOKu0HUykq0qihOalsv?=
 =?us-ascii?Q?4Qq4ZJe2e4ULu7MBoLAeRar86efjQ28k8sXdf1Z36Fouqpc7A7Sxq6ZRHP3R?=
 =?us-ascii?Q?n4zvTcIpIGg3aM2Jg3Pwn3+m4BOQuc6R86LigSfHMrSTUVrwA/N4LjG8hler?=
 =?us-ascii?Q?6Mzl3TnrRTVAk6Od96a+MIuvBYArgWnSZm/lJABhVlr4oRg3bRphMJUwxaPd?=
 =?us-ascii?Q?0yFfBLxvxeFP2OQtd3jQUJLM6DuTUXmg2w903s/7zkbpDC7QoqAeJ0xoaCM3?=
 =?us-ascii?Q?FybewOrJI4LcyP01Bj9CnU0hmUsNrTyBUPT6Wdl+nnxdVHYMGRyvTOPJegLX?=
 =?us-ascii?Q?+KOJhK/3ApNLOo9FilyfRnejUGA/LUSt+/R87SzrDAayGS7Cs91y2ZBgilsX?=
 =?us-ascii?Q?ZAXkkg4gBJs3zlpAN3EjTF+SSfYbQWFtbSj+K/QaZyGMuXhvVtj1EZtS5tdS?=
 =?us-ascii?Q?47GCCq5zKe9oThCc5xKkb7yHrhWu5OkI91pSSJacuq6DQi5xM19/5MW4aM1T?=
 =?us-ascii?Q?si+ZydS9fCrCI29D+5ypeCNiR+TofYCUBNMRmqQ/HwlYzLgnhUAx26XDXe4O?=
 =?us-ascii?Q?TV7TZ8lW8nlGjCKXcQqFOg2NAUrPVbfaNpBInc14D6ZVs6JaoDsJVZh5uH6i?=
 =?us-ascii?Q?5n1ERGnE5UiGLs+/6t5iqIlZdZmxY/lE1onwYX1J9Eey9vyDlSRWlH9D9/Ox?=
 =?us-ascii?Q?tz7MtTtwlxNEIJjAX9yqvmcSh4zP7iwMnHsuewFRO+CvHmuYFPIYBLmVTo4F?=
 =?us-ascii?Q?4bFsaFuFJ5+VPdHCIiisLcdIS/VmDF/rWTMxDR2365ySKR3RqOmBfDJyBhMX?=
 =?us-ascii?Q?eOhG9ZWEIXZ60Ts9PcaYMQTHWcBWvSyuNTgYtYfHp9q80Mkngp8GWxhflLUn?=
 =?us-ascii?Q?yYP7yMbQ0F71rCcXQlxUwCq+T92HjWFgRbmGTfMU21+1QykUQG5ZnSMPmekc?=
 =?us-ascii?Q?N8czg7moQl/xDzLb5ZPDl/YK2idf0uKTx88m/cvNsqNkHGK3nP0bxOXUkWUg?=
 =?us-ascii?Q?rPl6N1qFcZg/E7cLi2Mqkiml6F2HicqJuRxMDZVpf/Exqfz6e+RYOuv0qn0o?=
 =?us-ascii?Q?jxqViPj1EDAlmiC7hddbxpxI6UX3TMYNihMidJUxBWs7Tqpv2IwGgsoP3I9s?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4812e9f-6822-4357-68ca-08dafd4e8096
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 14:31:23.6582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PMseP4lLNYFj8mTcz6mJgrouhdxQQBnoALPtfNgLuTx22W6pB+6jp1o1b3vDKSpjOXZ5uQC0Pz+dlA4ioH+btA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7740
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
Cc: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Vivi@freedesktop.org" <Vivi@freedesktop.org>, "Winkler,
 Tomas" <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 22, 2023 at 06:57:24AM +0000, Usyskin, Alexander wrote:
> > > diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> > b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> > > index d50354bfb993..bef6d7f8ac55 100644
> > > --- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> > > +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> > > @@ -127,6 +127,10 @@ static int i915_pxp_tee_component_bind(struct
> > device *i915_kdev,
> > >  	intel_wakeref_t wakeref;
> > >  	int ret = 0;
> > >
> > > +	if (!HAS_HECI_PXP(i915) &&
> > > +	    drm_WARN_ON(&i915->drm, !device_link_add(i915_kdev,
> > tee_kdev,
> > 
> > I don't like the action here hidden behind the drm_WARN_ON.
> > Please notice that almost every use of this and other helpers like
> > this expect the param as a failure. Not an actual action. So,
> > most of lazy readers like me might ignore that the main function
> > is actually a param inside  this warn condition.
> > 
> Honestly, copy-pasted from drivers/gpu/drm/i915/display/intel_audio.c +1266
> I don't have deep knowledge of drm macros, so thought this should be ok.
> Can make it any other form that acceptable in drm tree...

something like I suggested in my previous reply please.

> 
> > We should probably stash the link as well...
> > 
> > pxp->dev_link = device_link_add(i915_kdev, tee_kdev,...);
> > 
> > so in the end below, instead of checking the HAS_HECI_PXP again
> > and use the remove version you check the dev_link and use the del
> > function.
> > 
> > something like:
> > 
> > if (pxp->dev_link)
> >    device_link_del(pxp->dev_link);
> > 
> Not sure that this simplification warrants additional clutter in struct.
> 
> > Also, do you really need the WARN to see the stack when this happens
> > or you already know the callers?
> > Why not a simple drm_error msg?
> > 
> > if (!HAS_HECI_PXP(i915) {
> > 	pxp->dev_link = device_link_add(i915_kdev, tee_kdev,...);
> > 	if (!pxp->dev_link) {
> > 	   drm_error();
> > 	   return -ESOMETHING;
> > 
> > >  DL_FLAG_STATELESS)))
> > 
> > do we need the RPM in sync as well?
> > I mean:
> > 
> > DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME)))
> > 
> > ?
> 
> No, the mei device should not be active all the time when i915 is active, only when pxp requires it.

okay then

> 
> > 
> > > +		return -ENOMEM;
> > 
> > why ENOMEM?
> Copy-paste from i915 audio.

It doesn't make sense to me.
Looking to other derivers -ENODEV or -EINVAL seems to be
the most used choices...

looking to the error codes probably ECHILD would make sense
but no one is using it... so let's stay with ENODEV?!

> 
> > 
> > > +
> > >  	mutex_lock(&pxp->tee_mutex);
> > >  	pxp->pxp_component = data;
> > >  	pxp->pxp_component->tee_dev = tee_kdev;
> > > @@ -169,6 +173,9 @@ static void i915_pxp_tee_component_unbind(struct
> > device *i915_kdev,
> > >  	mutex_lock(&pxp->tee_mutex);
> > >  	pxp->pxp_component = NULL;
> > >  	mutex_unlock(&pxp->tee_mutex);
> > > +
> > > +	if (!HAS_HECI_PXP(i915))
> > > +		device_link_remove(i915_kdev, tee_kdev);
> > >  }
> > >
> > >  static const struct component_ops i915_pxp_tee_component_ops = {
> > > --
> > > 2.39.0
> > >
