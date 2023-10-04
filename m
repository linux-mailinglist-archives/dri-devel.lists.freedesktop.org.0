Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7E97B968F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 23:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911FC10E3CA;
	Wed,  4 Oct 2023 21:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F0810E3CA;
 Wed,  4 Oct 2023 21:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696455407; x=1727991407;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LqYuP43CIZUuFMdDAeSMxjd1sp1dmhTK5RyD65LELp4=;
 b=JkGyfSTPhstF5SUjwriZI/+yu2Mpze9BdCFmgUpbVA588HLnbGEyZD0X
 Cb1RJS8p7kT9pXTpQvqA0nbeVJeYVIj9HzoE0kR5vuB+pVmaGcrBLHzHm
 Ad4RL00KH+pi4jrPMbw0ojpvAg2T2xsgVdJNWDmb7XYZStQDFau8yFmrR
 dsCo6aRm5xGEkaCkmhb4ue9EUNxI5DyqaPNDHuuoCeLjUT5dFdsUUVUi2
 ai/tBMhFjQsaTVJihtC9wujcK3d9i2328r0R2vkuA1N+am2y4IjXB854U
 QpBu69+SIjrYQMtqWtv9BPl7Q5ZaA/l+kPY11uzqXxpGlq8V09CeTMjdu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="373657194"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="373657194"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 14:36:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="786689268"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="786689268"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 14:36:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 14:36:45 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 14:36:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 14:36:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q995mqalaM0Qvd3/dMnq1oJrG0lGCOGEA43RIBJH4llGwt8bF5XRiKc4F2Dx6HcsQQi3YDpkUl2+/w+anuVP1LX4gfJ9rISdwRbApMZZFo2ya0yUv2Cohjf8BXxTH5AwkEFddCpyfLvI/3HMpvAhNAlDGA+tvMU+aqM/wJLo7rJ4ixzv+boG2GmhLgoLvlzdWpjP5stpLe3m6l73Ml7itTk3ThFF1AyzTCWkAwpRy0EqGHr3HMljpNgpE2IXea5W58Ep1EgZZ5NXSP8bNL4TyAGKJCTI+1Co91qRy2P2EMK2cTEMNiIN3jUXBf/ZxIDFnOhlsN6Mxk67QpgrqbbJKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8C5a0X4/DRM7VJAtLxze2u3N9FSQxbSyX55A1Ayv+fc=;
 b=dmN27q2LCfMGdrs7/Cvw4W3eHzoi5H2WH8/Zb/pTNNWKXFm1fY91ZKvZbzr/yYnC0SMQQ/Q1nsSWlU8MqRjOLh82/IGL30GKDZVGcN1d23keHmrIAfdYhhiOmEfA4sNFhvbxhAF20WOlm2tc55wd7KZXiWpHKuIywX92YjXtrZJavgK8NLDaEjk9z5+Ip9SY/pF4gITTzQQ87PNgCQoNUdqQfylgBPQFIIlFr49NijaMNoNp/qHa0soD+sW0BvEJNfIJDwOfV/MWyHCj+PPEIr6tdfuyQuEhfhf3BSQBpK3CnieoXj+ZeSgQm9Xijrxh/zjxQOGDzm4Zm0l7x6J3mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB5406.namprd11.prod.outlook.com (2603:10b6:5:395::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.35; Wed, 4 Oct 2023 21:36:40 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0%7]) with mapi id 15.20.6838.024; Wed, 4 Oct 2023
 21:36:40 +0000
Date: Wed, 4 Oct 2023 14:36:35 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH] drm/i915/gt: Do not treat MCR locking
 timeouts as errors
Message-ID: <20231004213635.GR2706891@mdroper-desk1.amr.corp.intel.com>
References: <20231004094357.634895-1-andi.shyti@linux.intel.com>
 <eefc8c62-1ac5-6604-2ee5-576ca87c2be5@linux.intel.com>
 <ZR1x0jlEzrCUNoip@ashyti-mobl2.lan>
 <4feb3f2e-ecbd-1fca-9568-409830f50ee5@intel.com>
 <ZR2+fyV6fW9PyILs@ashyti-mobl2.lan>
 <20231004200544.GE53570@mdroper-desk1.amr.corp.intel.com>
 <ZR3R+Hr5pv/YGeFu@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZR3R+Hr5pv/YGeFu@ashyti-mobl2.lan>
X-ClientProxiedBy: MW4PR03CA0222.namprd03.prod.outlook.com
 (2603:10b6:303:b9::17) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB5406:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cb217a6-b962-4518-3683-08dbc521fe20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +w0KkkjPKx67I1432QKndNIBOOJG8Y48pU8WPLEqe/5dCHe2vLAbTGrmuVqAMmNbrQsAjDYKbu5IFmNDUJFjr56DQY85X2oT22l2S3CDGKbUtvwrhM3zEGzYyIR1M7/qvdlp6se/3lHNZJGSj7zotMQ0KGdeEUL2E6iuwpWAt+tLTh67ibwoHCNQL6CakWAN+v9gsEQz7rzopE30w0EoA5UNLTJTCMVO4Jb9uDr8PDj6Tx4i57ceCsIXNjtDAoLf9vUwzJytW0LCE5zg5FAXg6rOjqFfKUyLzbmrJzaB2+FrEqXBHGVds8JXjej1CCAUOUrsXVy5h/Ep9v+s+5s8jxhjC+7Ob6kNqf/auUTnRONODXbDSXKUsPXWb+tZa0H7363LxWkfM/gVK2hp4WvDgPG16Brpa7pBnbgpQo1xEnBB0r0nNZMRWoaj2uphJvkW7mzOmSo+42/z2A57KWNPbNaCWeT/6YHQ8bBRZDgqSHdXyAZEX/D7ib06SvNVBCibNZcps1Mi1D+bIZURDUpnD90+tVI8W/Rgc59y7WR55sIdy6qoEuxJk4QwM1UVZRuD0WC3pmykItKinivBXNs0VA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(396003)(39860400002)(346002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6506007)(6666004)(478600001)(6486002)(966005)(2906002)(83380400001)(6512007)(26005)(1076003)(30864003)(41300700001)(316002)(66946007)(6916009)(66476007)(66556008)(5660300002)(4326008)(8676002)(8936002)(54906003)(33656002)(86362001)(38100700002)(82960400001)(66899024);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WGmY7MYX82Ey20NWPx4Q54uk5BZA8pZN+8MM56JJu9Iky1BwvCvN+Hvl3l1F?=
 =?us-ascii?Q?nrE2vtmW0Ni1yygmt2KxCJvPZYwH4I3AIpxD0nB+z7Oe1RGRSWwR3hBoUPXk?=
 =?us-ascii?Q?49h/6qipn5SGMby3wCedN6Fx3nN4Qy/m6CNPbyv6Z1CMxm8uMinKw5lJqta/?=
 =?us-ascii?Q?jAYZfwc84KvmpxkTE3msdxOCbS+HSZPm6bbma9DSS8WeensvPo6WTwA4yMpN?=
 =?us-ascii?Q?xxX4Dd7qo3QOeouBxy+veMMDCNhiK9PXN7M+5pMQCNdNS7Fzs1BM5wFJFtw7?=
 =?us-ascii?Q?DbsWEbbnUh3dpGCVMQPFn2IvyaYWytZm8IDHQyUyzsvkTQyHum9Q83Alj8PH?=
 =?us-ascii?Q?bQPiHKGTc8JJquidum9UwB6t9L/mhxSG440ZwkqX2DTX2pwgoU1FjQsrjWei?=
 =?us-ascii?Q?mUg6rhUbNNWHgkX1mGYmafGjw2ez7REeVl+FAMT9mObR/aXW9JrpaCE3tqGv?=
 =?us-ascii?Q?EzSE5fzz9+I4ZQQqdHSLKopebLtC15h78Q4MG7x1GhSIB802Tyw74KU03gxi?=
 =?us-ascii?Q?JSAzXJm0QgB14nzuSdTV3keO/vuRz/kY3i09Ajekp0okCctlmok1SrlJU707?=
 =?us-ascii?Q?mrsPYfuCOp3OizEj1fcrqCVCuEJLL5+1yxMq39ND6I4DEz+Uno6w6WKl6Pv/?=
 =?us-ascii?Q?lGARkZeAHiDpjMk54dNMFiK2+Z3cAHpyqqJpvGl8j/mQfT09KcVq+p2ranKp?=
 =?us-ascii?Q?lQ8om64yzOgxumaTz970/cw3N9Qqo8/TAhqYt6soAk5orsfzbBH4zOhnGc8E?=
 =?us-ascii?Q?BKfBHA0yFrjfsXmG831ScLG4fMEZfEKlvFCIsRyl69jU1QU4Soa8Uly46vlx?=
 =?us-ascii?Q?QbMgnxb06BTXWJWnzutbvyKnVF60hp9b551SZPU5fqtxxmoBnAVfNx8XzN++?=
 =?us-ascii?Q?widaEjkLW+3wObXwHxHNifuX9ud09jI9ww3ObfgRrP+L4DfhChDG7C9f7AqW?=
 =?us-ascii?Q?XqXS9Z3Lo16X1PjrnwhHiEb4f30FDtggV+ojV7dy7s1YNgrulYDdeEgbQffF?=
 =?us-ascii?Q?pK1VzOOO+NmdvQmr06IHnI+Gsm97h9yY818bw6XCoRDFaKxNpwsAWqlZIHLi?=
 =?us-ascii?Q?3wA6PQ8NU+JLZWiE5rWoZx9A3KaXS6f4L3sGyljPnDvq4A57sq4uXGDQJknz?=
 =?us-ascii?Q?1fahI1tIUFr8OpoYGMNXAFEXTjWv+F1ozEX/s0CFAD/NKkPXxMImlrvEZJA6?=
 =?us-ascii?Q?z8KnAciWApTzE9HOZWxooHhGN9uubsrKQhXRNbFmvJOv+lz2CBzi5UNDc5Fu?=
 =?us-ascii?Q?acIjj1I7wHBD4EBPNneQFQ5y8nfpTIsyKETrPWqmnYu2DadYXIiNT5++TDDU?=
 =?us-ascii?Q?sH3Ui5qt0mvj5KwwqjWVshoDcAixhRSlZiytT+IWPErldqjLStNEjkOBI4Zv?=
 =?us-ascii?Q?09o1ph7IMNlZp1f+hL0Q7C1CBlN87CHDdXp7Bmw+ERXBfrdBjQVDc7+vdckY?=
 =?us-ascii?Q?qVSLDII7YhnuontDKlpqfD4QACg+icEP/sVPgo0DwZvngeW66OstsNmP9QZp?=
 =?us-ascii?Q?lXt+h5c5nyAEsI0t/eCB3yv8dQTaDb2B+7HCYiYFe4eQEcO6COignAHwra9b?=
 =?us-ascii?Q?0H8ZS0rR6lYeVnZrLTTXdha14gBWkQN/5D60cRtSObtHU2u21Nz6r43BLGwL?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb217a6-b962-4518-3683-08dbc521fe20
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 21:36:39.3959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zsIz+hKQCoa3RLuD3whMy1khL2zTI5NV9+DmVn15lby9RtT7/YeutvZ5bENKNKVYf3RDQeWRQtwmt1xBaD41IHIyB68+/gfZ6LpQyyneSeo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5406
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
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, gregory.f.germano@intel.com,
 John Harrison <john.c.harrison@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 04, 2023 at 10:58:32PM +0200, Andi Shyti wrote:
> Hi Matt,
> 
> > > > > > > The MCR steering semaphore is a shared lock entry between i915
> > > > > > > and various firmware components.
> > > > > > > 
> > > > > > > Getting the lock might sinchronize on some shared resources.
> > > > > > > Sometimes though, it might happen that the firmware forgets to
> > > > > > > unlock causing unnecessary noise in the driver which keeps doing
> > > > > > > what was supposed to do, ignoring the problem.
> > > > > > > 
> > > > > > > Do not consider this failure as an error, but just print a debug
> > > > > > > message stating that the MCR locking has been skipped.
> > > > > > > 
> > > > > > > On the driver side we still have spinlocks that make sure that
> > > > > > > the access to the resources is serialized.
> > > > > > > 
> > > > > > > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > > > > > > Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > > > Cc: Nirmoy Das <nirmoy.das@intel.com>
> > > > > > > ---
> > > > > > >    drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 6 ++----
> > > > > > >    1 file changed, 2 insertions(+), 4 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > > > > > > index 326c2ed1d99b..51eb693df39b 100644
> > > > > > > --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > > > > > > +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > > > > > > @@ -395,10 +395,8 @@ void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags)
> > > > > > >    	 * would indicate some hardware/firmware is misbehaving and not
> > > > > > >    	 * releasing it properly.
> > > > > > >    	 */
> > > > > > > -	if (err == -ETIMEDOUT) {
> > > > > > > -		gt_err_ratelimited(gt, "hardware MCR steering semaphore timed out");
> > > > > > > -		add_taint_for_CI(gt->i915, TAINT_WARN);  /* CI is now unreliable */
> > > > > > > -	}
> > > > > > > +	if (err == -ETIMEDOUT)
> > > > > > > +		gt_dbg(gt, "hardware MCR steering semaphore timed out");
> > > > > > >    }
> > > > > > >    /**
> > > > > > Are we sure this does not warrant a level higher than dbg, such as
> > > > > > notice/warn?
> > > > > We might make it a warn, but this doesn't change much the economy
> > > > > of the driver as we will keep doing what we were supposed to do.
> > > > > 
> > > > > > Because how can we be sure the two entities will not stomp on
> > > > > > each other toes if we failed to obtain lock?
> > > > > So far, in all the research I've done, no one looks like using
> > > > > MCR lock, but yet someone is stuck in it.
> > > > 
> > > > If someone has the lock then that someone thinks they are using it. Just
> > > > because you can't see what someone piece of IFWI is doing doesn't mean it
> > > > isn't doing it. And if it is a genuinely missing unlock then it needs to be
> > > > tracked down and fixed with an IFWI update otherwise the system is going to
> > > > be unstable from that point on.
> > > 
> > > But I'm not changing here the behavior of the driver. The driver
> > > will keep doing what was doing before.
> > > 
> > > Because this most probably won't be noticed by the user, then I
> > > don't see why it should shout out loud that the system is
> > > unusable when most probably it is.
> > 
> > That's like saying that any random race condition isn't likely to be
> > noticed by the user so it's not a big deal if we're missing a few
> > mutexes or spinlocks somewhere...even though there's likely to be no
> > user-visible impact to any race condition 99% of the time, it's the 1%
> > that winds up being absolutely catastrophic.
> 
> Not really... normally if you hit a spinlock/mutex race
> condition, you end up in a deadlock and stall the system. In this
> case, I agree that the lock should be sorted out by the hardware,
> but in the meantime i915 is *already* ignoring it.
> 
> I'm not making any behavioral change with this patch.
> 
> What I'm trying to say is that if the system doesn't crash, then
> let it go... don't crash it on purpose just because there is a
> locking situation and we think it has a catastrophic effect, but
> in reality is not producing anything (like practically in our
> case, you can check the CI results[*]).
> 
> [*] https://patchwork.freedesktop.org/patch/560733/?series=124599&rev=1

But hiding the error message is the opposite of the direction we should
be moving.  If anything we need to be escalating this harder, for
example by wedging the GT to truly prevent if from being used further.
We obviously don't want a BUG() or something that would crash the whole
system and potentially cause non-graphics data loss, but we really
shouldn't let regular operation keep going.  The goal of ignoring the
the semaphore and moving forward is that we keep the system alive for a
developer to gather more debug information.

If this is ever seen in the wild by a regular user, we definitely want
to be getting bug reports about that ASAP because it means they have a
system that they can't safely use.

> 
> > If we're not obtaining the MCR lock as expected and are simply moving
> > forward to force our own steering (possibly at the same time firmware is
> > programming steering to a different value), you probably won't actually
> > see a problem either because the operations won't wind up interleaving
> > in a problematic order, or because the driver and the firmware both
> > happen to be trying to steer to the same instance (e.g., instance #0 is
> > a quite common target).  But even if they're hard to hit, the
> > possibility for a major problem is still there and basically we need to
> > consider the whole platform to be in an unknown, unstable state once
> > we've detected one of these issues.
> > 
> > Based on some earlier experiments, it sounds like the problem at the
> > moment is that we've just been too hasty with deciding that the lock is
> > "stuck."  There's no formal guidance on what an appropriate timeout is,
> > but Jonathan's patch to increase the timeout by 10x (from 100ms to 1s)
> > should hopefully take care of those cases and prevent us from causing
> > any unprotected races.
> 
> Unfortunately it doesn't. Here[**] you can see how the situation
> doesn't change in mtlp-8.
> 
> [**] https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_124576v2/index.html?

That's unfortunate. :-(

Probably the next step is to re-run the ftrace experiements and confirm
once again that it's still definitely an external firmware agent that
we're stuck waiting on and not some other i915 thread.  "MCR lock
timeout" is a general type of problem that could potentially be caused
by different things in different situations; i915 wasn't the culprit for
the suspend/resume case, but we should confirm that it also isn't the
culprit for whichever specific CI tests are failing here.  I know we've
already audited our critical sections to make sure that they're all
short and aren't holding the lock for a long time, but I'm imagining a
case where an IGT stress test spawns thousands of threads, each one
doing something that will wind up triggering MCR operations at the same
time, and one of those threads just winds up waiting too long for the
crowd to thin out and give it a chance with the lock.  I think our CI
system runs with KASAN enabled now, which often brings CPU performance
to a crawl, so if this is some kind of thundering herd situation that's
being exacerbated by KASAN, we should be able to figure that out with
tracepoints.


Matt

> 
> > If we have any other problems where the lock is
> > truly stuck (as was seen after an S3 resume), that's a critical error
> > that needs to be escalated to whichever component is the culprit --- any
> > such system simply cannot be used safely.  Even if the KMD didn't notice
> > such stuck semaphores itself, one misbehaving firmware agent could still
> > block other firmware agents and cause major problems for the health of
> > the system.
> 
> Agree... we are working with hardware guys to get down to the
> root cause. We knew already when we merged this patch[***] that
> this wouldn't fix the issue as the issue still lies underneath.
> 
> [***] 37280ef5c1c4 ("drm/i915: Clean steer semaphore on resume")
> 
> > > BTW, at my understanding this is not an IFWI problem. We checked
> > > with different version of IFWI and the issue is the same.
> > 
> > It may not be an IFWI _regression_, but unless we're contending with
> > ourselves (via different CPU threads, which I think we've already ruled
> > out through some ftrace experiments), then it does mean that something
> > in the IFWI is causing the lock to be held longer than expected.  That
> > may have always been the behavior since day 1 and we just didn't notice
> > until we got a relatively clean CI setup to start seeing these errors.
> > 
> > > 
> > > Besides we received reports also from systems that are not using
> > > IFWI at all.
> > 
> > What does this mean?  IFWI is just the generic term we use for the blob
> > we flash onto the system that bundles a bunch of different types of
> > firmware.  E.g., stuff like pcode firmware, csme, EFI GOP, etc.  If a
> > 3rd party is putting together a MTL device, they probably refer to their
> > firmware bundles with some term other than "IFWI" and may swap out some
> > of the specific components, but at the end of the day the system still
> > has the important low-level firmware running for things like pcode.
> > 
> > > 
> > > > 
> > > > > 
> > > > > > (How can we be sure about
> > > > > > "forgot to unlock" vs "in prolonged active use"?
> > > > > There is a patch from Jonathan that is testing a different
> > > > > timeout.
> > > > > 
> > > > > > Or if we can be sure, can
> > > > > > we force unlock and take the lock for the driver explicitly?)
> > > > > I sent a patch with this solution and Matt turned it down.
> > > > 
> > > > Presumably because both forcing a lock and ignoring a failed lock are Bad
> > > > Things to be doing!
> > > > Just because some entity out of our control isn't playing friendly doesn't
> > > > mean we can ignore the problem. The lock is there for a reason. If someone
> > > > else owns the lock then any steered access by i915 is potentially going to
> > > > be routed to the wrong register as the other entity re-directs the steering
> > > > behind out back. That is why there is an error message being printed.
> > > > Because things are quite possibly going to fail in some unknown manner.
> > > 
> > > Yes, agree. This has been already discussed here[*] where I sent
> > > such RFC for the sole purpose of receiving some opinions and
> > > check how CI would behave.
> > > 
> > > BTW, we are already doing this during the GT resume[**]... it's a
> > > bit of a different context, but it still forces the release of
> > > the lock.
> > 
> > That resume-time patch is only deemed safe because we got explicit
> > confirmation from the architects that it's not possible for any of the
> > external agents to truly be using the MCR lock at that point during
> > driver load and S3 resume.  It's still a serious bug in some firmware
> > component, but in that specific case it's one that we can fix up
> > ourselves without risk.  Any locking failures seen later on during
> > regular system use cannot be solves safely.
> 
> Yes! Agree! :-)
> 
> Thanks, Matt!
> Andi

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
