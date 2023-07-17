Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B211F756E3D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 22:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498FD10E2B0;
	Mon, 17 Jul 2023 20:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D32410E04A;
 Mon, 17 Jul 2023 20:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689625871; x=1721161871;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9zdGZHwjRMZW6YAE92xW28eaA89BDWxci8Mt7nZjrf8=;
 b=I0aFNoJeodZSk/FagKFzUeCU1QZki3wU7PAeynhxcshTnsq4xPPCECj+
 evJJ9UcdIF5SE2XwJFjp7lLKNshCjwEcwGtuDLR+B99Ck4FBITv9CaUJZ
 hY22tM1kbXw2W6QdFWkYqQOl759jR7b3YIhJmOKJaimBU2GAFIH85bADI
 X9gAfLqJ0gH39qtJCxrfZpVAKpaCw5HEJr/lnApCrhU1lTm3cr+B9e0DJ
 RK9z/G+mciSUoK59pRB65HByLMSlgIajbZwxTFvRtdVeaOGCfJsargcM9
 2k/YDfYHw97j3BUewyIg4mg398mXct23YnPxvd4m4arX5Qmi+sXH/H5Hf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="346332570"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="346332570"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 13:31:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="897325839"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="897325839"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 17 Jul 2023 13:31:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 13:31:09 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 17 Jul 2023 13:31:09 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 17 Jul 2023 13:31:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJlUqRYCCzYiKvvCHQTudk1XvP6nihG/OUxzQXJxxhEtwjylX/kIPKxB514h+nJ6tdZKt1HrWn3J1JhxfqXmjLobB9SWU1QhBMhNQ2bt86G1qZafYv1uQX/cEe3WqWKcNk91L8WrtIp8JYWg9q3Wlc+jHt4vES4dYeTi56votYL5dPSw8SeqnZNWh1Yz9QohGU9lgi6GuosUMKX4gKlxi40MExTMx2xQN15THQs47Kup2qlBo7nITWGGVO25ZGjBJVzaSAyn21cFFSG/gJxYcr2VBps7utjU2geR18/0T6WU0vxNmELLmFO2Nm37U7lAseG0BhiQcrHqevIt18fKAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yj375wBcbwZ/xkuUTC0x9IO5srzGYVfwZoCcRkQ2+VA=;
 b=PzxjU8nT4d1YJM/DGIZYiMK+O+9BJq94iN5qxcY2P5N36CE8SKpBXMGY2ZFkF5Cl2CsIcNE31i6PNiiMSwyFF1hTCTiW6ccfPvUVfwYwlBGUHomHGIunDdEoesVrUDogMeMip3SdZsJlLPDejhm2tDDmHROAt9Gx5BKvpNgs3jDtt2Qyc/Cp8dSyAdP0eFAp8vDqlxKF7JOvJ7Ya4+R5tSnn/Dl/l3wcy15OXBjX25BOCX5mSpi2SD6qJD5d5qt6S2+lWIxual55Kywm/jN1YB7LeS2vr0Brr/D1vml+akYKyC7R+ibphnmFeDpryJ8vi1zr+eYOo5ZbztRTH9HdZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 LV3PR11MB8696.namprd11.prod.outlook.com (2603:10b6:408:216::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Mon, 17 Jul
 2023 20:31:07 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 20:31:07 +0000
Date: Mon, 17 Jul 2023 13:31:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v4 2/6] drm/i915/gt: Ensure memory quiesced before
 invalidation
Message-ID: <20230717203103.GG138014@mdroper-desk1.amr.corp.intel.com>
References: <20230717173059.422892-1-andi.shyti@linux.intel.com>
 <20230717173059.422892-3-andi.shyti@linux.intel.com>
 <20230717175425.GB138014@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230717175425.GB138014@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR05CA0063.namprd05.prod.outlook.com
 (2603:10b6:a03:332::8) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|LV3PR11MB8696:EE_
X-MS-Office365-Filtering-Correlation-Id: bc92282f-ab77-4ee9-e53e-08db8704bfbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JCJgDmW4HV+xdEGK2XQRxpghvb3hFNVteAutn51LYk+f5zoYkt78u6qxSTfVFimBmc8OvD4J3G3YNeFQN77lL1y3gZ9DCOzHgDWH9eWB8yFa/BZVbdw/NlPCcvN+fOLMz1KEntXEUJBtz6l85KO6LsC5mDqhsMv8Pukbwn6iBUL4lCa2wZ7F45c7ds/qQ96S1immuMZAmSxXKbEJ7bhp5BHQCThY3EoNsQa0gwR7DFVyhA8g+yJcwVc5Oi9qcj8aYUKanel5tDj04on/6+bKgoe+y/NT3L1kXQLuJfdUgP3xhaAlW5Ta1V2oxGrktxA+XVBkrYiePXUGVX5Pkrt7syE9M86QMAQ5OkdABZBLCF4OSr0xU+yjLop+ZZjDJwmBGht/QS4zdQwyZzl0NTuYn9rbwUmuFeZ4GMd4PE245+Id9M9tG32Z4JDGShMZ3Ac6an7BaxiHS3XKQXykar5KmlJ3OZIJeZKjcG0cqgIr3MJFp9jJmF8VdpJ9QypEVS9a3g7L6pNdOzQTcOFeZlN9qSaTvV4ggvuVnmWvozrBaZM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(396003)(346002)(136003)(39860400002)(451199021)(478600001)(6486002)(6666004)(54906003)(186003)(6506007)(1076003)(26005)(6512007)(966005)(2906002)(316002)(66556008)(41300700001)(66946007)(66476007)(6916009)(4326008)(8676002)(5660300002)(8936002)(38100700002)(82960400001)(33656002)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BJcK9mtAVsuazNEY+1nt5nwqqyt24EDRtAB4mZP+05+zAx4LIp+zdJXoKFwm?=
 =?us-ascii?Q?0T7830uMo9z5+Y8BR1jssiGK+LnsvNJ0fItpnB4MGzYtcSegVolKcPbHFQiL?=
 =?us-ascii?Q?vf3fi6pyQkYuaeefy1joqv6q/NA2tks+h1fQ49Z36+Lw2syOooJytFlEFADp?=
 =?us-ascii?Q?Pik5UDU6KJfpHvrXrU+DkrK+y2Bb9KKRWD7Qr343glpeAqObDnjkxaaRfMMf?=
 =?us-ascii?Q?Lg1B7fd3PAQ7PrBrNHX49bSmDwi9yle/HWojTVi1VtKix9NgeLfyCEavEN2U?=
 =?us-ascii?Q?H4klftZwxIbeCbzRhwC5WqHCFLigpD6FM7TlGWQCNu5Ci9m9au3lu0fJWvr/?=
 =?us-ascii?Q?722UmeiCLUg1OqbkAXBHTgpgdGF81bn65gmfOqvIo4xrH7kNJvDaA7JX8ezb?=
 =?us-ascii?Q?HfOmRLo4O957h7yyp67ss15bnA16xv4eMpu120joesrKf2ne/01trRMQHkUi?=
 =?us-ascii?Q?tKpHPh0pgfN7kR7+xqEsCXaolLH6spL/zfmabAjG1VB1/aNXqitNBt8uFQ62?=
 =?us-ascii?Q?z/o+WHqgCC2+BIyK2U00DCE+wKTovIlXFuxGe7bK5zYkCNhDayXAGoJmb3kq?=
 =?us-ascii?Q?eIDluVF9juH4HNE75ngRbEFNY6AGWs99Ra5JtvylTFAZ7AN/iycdiOiMo7Fw?=
 =?us-ascii?Q?UqBZTbsnZyBWuWdrIlTq1kVshWfDH/wjrLyqeivLuKrNPApt3a/EcGblEVrT?=
 =?us-ascii?Q?0Yn/UIgtCyEHGUBkBbw9LT9iSqlWAKM7B3FJ/6fRJ6fnV/gp9GhyRqefLpR4?=
 =?us-ascii?Q?hSbNhkNJPhHeSQu8K0JxG9hUd2qkOCO0qgPE3yQ2A3had0qnrH+JKvqnWGrR?=
 =?us-ascii?Q?I9/hSY9vud7OSiun8xBBzk00mcdaCU8RTRH5o+a865VTOerzcR6NJ2v+5CbD?=
 =?us-ascii?Q?uXKLv1StUkAbn/GpSswNOrctEZtiaHbJKiWkOG+AVi/CDV+XsAkYXPjTljBc?=
 =?us-ascii?Q?VyjApc+4njaNUdUzxGHTCmxgLoIV0LsFdNQ8RDYob3ibZ20JCVGbx14EuU0y?=
 =?us-ascii?Q?s3WCV79vhxUwf4dzU5L3JdjlRLd1LrgcQFkp3tjbEVKZFHZm/3Dyxo9zekhr?=
 =?us-ascii?Q?VmyxJeiumRiaCWydUFessB69p/EwjDCuvdOuwcFzb2XOrzvsCKVC/iJ3d9gx?=
 =?us-ascii?Q?YJOEvXMdgVbehB7F/gOocDPsBP9eIznmZdiheT3OMZWFidWUbMdJirOETJrd?=
 =?us-ascii?Q?OsCi7h2TC7L/OPTlIADGHMmY/FKNqnmP4pr6BrvYsNrO9u8oxcFeV5jEPGoq?=
 =?us-ascii?Q?bC9o0ecexG9wIuFBAjt6GCwM/NapGQcySVY960Bkyt21RtNb52Du9Ao8VFFS?=
 =?us-ascii?Q?dK5eQ1XnkUpgX7jdssyntRLWpTYJWrSaNNpc0isz0fHLFfmLtHcNOefUFVlo?=
 =?us-ascii?Q?pnHzQgM1u/ARhGjxq09EegTOdoHZZZCiQySS5qF45kaEtzt2ZT7PDGScDa4m?=
 =?us-ascii?Q?SfPYoW9GI13iYPPnUv3jw/U/1S6+RMcxYCZXjw5l6Su4elaEQY7DWFarsdeE?=
 =?us-ascii?Q?f7ijUkAybs6AVyvyEvRJK+NLYVdECLiU2H0x+C5ERk8b6vRXK/h+DgbNUl0I?=
 =?us-ascii?Q?bcOKCzN05x+D/q7Q592Jgd9Alr2tRIj8sgcE4xjASz1Bibie8chiccspdhtf?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc92282f-ab77-4ee9-e53e-08db8704bfbd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 20:31:07.0893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GkPod61fvBCfB+0syPTKwKibzM0LWCEgjHuMHmiD15yXfgIxWeeTFAGlzfNddZmIMz5N02YkJ55nzdFCrLu8glgrQh+ENN0+Bjr6L99dgMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8696
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

On Mon, Jul 17, 2023 at 10:54:37AM -0700, Matt Roper wrote:
> On Mon, Jul 17, 2023 at 07:30:55PM +0200, Andi Shyti wrote:
> > From: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > 
> > All memory traffic must be quiesced before requesting
> > an aux invalidation on platforms that use Aux CCS.
> > 
> > Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > Cc: <stable@vger.kernel.org> # v5.8+
> > ---
> >  drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > index 563efee055602..bee3b7dc595cf 100644
> > --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > @@ -202,6 +202,13 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
> >  {
> >  	struct intel_engine_cs *engine = rq->engine;
> >  
> > +	/*
> > +	 * Aux invalidations on Aux CCS platforms require
> > +	 * memory traffic is quiesced prior.
> > +	 */
> > +	if ((mode & EMIT_INVALIDATE) && !HAS_FLAT_CCS(engine->i915))
> 
> It's a pre-existing mistake in drm-tip at the moment, but we shouldn't
> assume !flatccs always implies auxccs.  PVC has neither, and there may
> be other similar platforms in the future.  We should probably add a
> helper function for AuxCCS, similar to what we added to the Xe driver
> recently:
> 
> https://patchwork.freedesktop.org/patch/539304/?series=118334&rev=1
> 

BTW, since this patch didn't handle it I was expecting to see another
patch in the series that quiesces memory for the non-RCS/CCS engines,
but it looks like there isn't one yet.  So we should probably add the
necessary MI_FLUSH_DW logic for the other engines to this patch as well.


Matt

> 
> Matt
> 
> 
> > +		mode |= EMIT_FLUSH;
> > +
> >  	if (mode & EMIT_FLUSH) {
> >  		u32 flags = 0;
> >  		int err;
> > -- 
> > 2.40.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
