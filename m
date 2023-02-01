Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7BE687048
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 22:05:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D655910E19E;
	Wed,  1 Feb 2023 21:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032F310E19E;
 Wed,  1 Feb 2023 21:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675285539; x=1706821539;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CHOGje7WrWN8XQNE6o1EJYJzlOvZAbGQuyqMKaWMEUc=;
 b=Gq5401bSckFJ4ckhhHSi/wrpffNEsQ4iXl+6AJYlhY8/YfGBlqpDdjpu
 k4Xqtj82xolIQTomZfjg59dsIC10ywv9Ozrko2IW1QgR4ZReVM/ba6wzZ
 lGr9uG/I1taZwGhPyZ7886QHlz6kKUoxT5+KkDUONGZyMwGkptrutZAqj
 PA3r256qg7PnUBXyuFUu5DFU5dqdAd8TNfyhynD13QYoElQptEjbbQWpG
 0zzFy3trXmkTO4AQb20ZoyWhIuwJSfm2jRPRJxXvSAkNTQ0SL6LAgZCW8
 cDWBk+mTcJcclBu9v8adoEs5WM+e8v3PdMQNZENKZflSDreZIIhj0PvFH w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="355608733"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; d="scan'208";a="355608733"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 13:05:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="733718511"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; d="scan'208";a="733718511"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 01 Feb 2023 13:05:38 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 1 Feb 2023 13:05:38 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 1 Feb 2023 13:05:37 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 1 Feb 2023 13:05:37 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 1 Feb 2023 13:05:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2nySh16HeG5iqMJ+bqw/Dbv3nSCIvvstRSPh+JAOC1Ok0co96k2mFecdBgxWD6maGWqwCI199BGrxDFKbZkxhtnJMAc2z2CsDyafIDknIf9TcYIHF81eXF8UzzPcVp7kBsD75GE5er7eEtgP/mWftix0NlShhAvx3Nx1H+3V6DYpKxKwEXqUAA78mugy92L1d4h0F3Ro8/eDdHDvVWEEC+RGpimzEFmkvga8olB6h3OTU70d+WpY2PmniMFhWqr/zC1hnImD78XWFO+iTpN/P67ATPd2MkuvT2Wq4z/bv+PomIeJCQdtojH2ml4ZjHGRZ7nVj/DEDptQCO6tPf8Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=few3VwTjZs9z/B6IH1YxxPqvFQPHrCyTsY12yuUgO0A=;
 b=CKbesNlKCSJ2bhKFfpkw6/HuZEZluzNP12Jm38RGj+ZoGHlXwMapJlBflmh27N+0lpcZ+EZP5RpDyQEtw1h9sz/l+HiiSjRNlrb6ZL16NfFHvM7TdIaHdA9IqINEXKy8fkLJdp7X8FspaPTu5O3X1aSHX9CYwQQFDAhiyAaiERRXV9kJ2E5DR5roxfISG2WEmgEJWfkihfS/9t0wbie7MWLbbTf5YyckslkQcGBVgdGY9QIyBjA3hTxNgiJ3pBcFAeuVt3pczx7TKqK4H/cs3p6eXiAWAzXjSyK2/w4YxlX5PVi75F1p02ho4AIoohaT7J5yM9CwYjo3HbEgw+7mTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6444.namprd11.prod.outlook.com (2603:10b6:208:3a7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Wed, 1 Feb
 2023 21:05:31 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Wed, 1 Feb 2023
 21:05:31 +0000
Date: Wed, 1 Feb 2023 16:05:25 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: linux-next: manual merge of the usb tree with the
 drm-intel-fixes tree
Message-ID: <Y9rUFf+fqwzi/EGC@intel.com>
References: <20230131130305.019029ff@canb.auug.org.au>
 <Y9kNRVppj5Uxa9ub@smile.fi.intel.com>
 <9566dc52-2ff1-760d-c9cb-fdfef9278f05@intel.com>
 <20230201151113.22382269@oak.ozlabs.ibm.com>
 <Y9qFmmi2C20AFQB7@intel.com>
 <fed121a6-8ad8-676b-ff6b-f7c6611058ca@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fed121a6-8ad8-676b-ff6b-f7c6611058ca@intel.com>
X-ClientProxiedBy: SJ0PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6444:EE_
X-MS-Office365-Filtering-Correlation-Id: 73da909f-f314-454b-8f72-08db04980d69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tIVz1qOP48naDHdyDfCyRxj9VUFXkTydEI54UyLGXD74hrzvZd7iIxeGw9uXWYRLnZ+3nRKJMuN2mVeUZS5rASFHVAtyCsrst73q5WeC+cw0CD+5P9k1vPSwtYJ7T5UqEyr7FQCMhGUO1tlnxVDJS7pCk1ZCPZSLnFwcYOEnq4rgw8wuKAy678Df1rlCODP42CGluwk5JHZxuLSGZudQXTNBALf6Y6FKrQa0zR66AexfLpLD8i6srZLzxBhqwj9o5RfWgo4fhiPkGlAS/zR+t2RPpRO0p3V2mrUtVL+aDFmCEB/kkNjX7xJroQtMZsSjb9rUZuPPNmVtUeAQv0owSxr4y7uLP1YE9RQhSPqVhTE6aaals9FszTjKiEfxOpikg2iOZ9B5h+MuoMQ3WtQLllORDMR0se26fzqiasu/BA6RhI/qrwK5StJhs963a8PFN4PsVBBuJHXh8i5VM2dRabmLpLLc/xJPsJxR8Yn3Mu4n1T7Bk6OCPTXGlykaA3HjyXi81mMqFXLgshY71BROeVzeUoGF3CgvWxJx1MH+L2fQTs4VR2XXRajhtaAFWO+OeG9WMI+M39yckdcaLzUNZB8U56+ir9hnaTUacH94rynDfF1W0AvmVMe0jF86vdgjUlc1c0RHVNQpwbGBd1B0ZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(396003)(346002)(39860400002)(376002)(136003)(451199018)(66946007)(8936002)(66476007)(37006003)(6862004)(4326008)(66556008)(8676002)(316002)(5660300002)(6636002)(7416002)(54906003)(44832011)(2906002)(6506007)(41300700001)(6486002)(478600001)(53546011)(186003)(6666004)(2616005)(36756003)(6512007)(26005)(83380400001)(86362001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/dZ21InAQ0lObKNrZzcjeJUOgN+fcHwGbzOfMEwUKrJqJTWyUl5dKTF/PADj?=
 =?us-ascii?Q?MUu+cei9NpjW+hifU6wHTsGAabRQI+yPIjsnZX3GvrC9CLRjB4WdD0EL3dWk?=
 =?us-ascii?Q?1hjdjPuyfGT9dZJ494vNRrjQHoODnBkXtjq02t3we0fqMKpNCNu3JyPeWMdW?=
 =?us-ascii?Q?pv5oWN1C0nYXkLWQF1mAjabSNRAA41OrOlSfV+59Kk2NQ6eFA8Y0rBNDZ5Fx?=
 =?us-ascii?Q?OyZZUhX9wbcOdVG12UCvF3wG443xBvECgBpxTL5MVO8kn3bBZ7RSxfe1V4ze?=
 =?us-ascii?Q?AQhMr8XMX5UWHmkgWiw+PG6Ld/FA0T5fycY6Q/nrgSQUpvtU9uR87BE85nZN?=
 =?us-ascii?Q?Z1PcR6iqlZfZ/fkLn6eKIeY+NFJxY7hZGaErG1b6JSLfy3xDeVcbY+YUc1Fv?=
 =?us-ascii?Q?7e01aNsqBOxev6UxVC4x+xUmDpB+VvXa7HSYUgBQUWIXchLW+nyh68r1RbZH?=
 =?us-ascii?Q?KGPXpgUskg1zU/2otOsCEDrGrtMPAsqtUMj03CaxqdZ/+5xIgxG2M3eoy1vT?=
 =?us-ascii?Q?0GCgsLxp+MeRer6GTQ3EdiMGeaHfO1gHqThEEg1tPf/NzoLJKQ5tDcQI0s7N?=
 =?us-ascii?Q?dgSj+XbHLzQp6HiwL/KEy9vISj+trn8cdhq4ieqzX1HrVSasKuU9H5sdQier?=
 =?us-ascii?Q?K0MLi4UvzKceW4luH90gChKDg9LCnqQV+ARbigOggrP1grka85z0QJwOuQlF?=
 =?us-ascii?Q?WeaCt1Z+KCzrAecaDlh3Wv+6I4tnF3qfaIGiIV5qAAmf+MwZu2E/08GICF+B?=
 =?us-ascii?Q?URCRWK5f2/HB+wBx7rrKGMEm9lqdkJyzcXATztWR5FbqLT9NcN0sjEos53bQ?=
 =?us-ascii?Q?ZnacED0kTZJbq+d/xXjAOEfXuFw6Fc06Tm+cP28vOXp5q4m4L0KWplHhigJp?=
 =?us-ascii?Q?2npQipE9ohNS2TGUjcasoU3zXorZPMMyAUxQ+SPaoEcZ1Pl/zTV5M/GVbZU9?=
 =?us-ascii?Q?VsRosNMBEff6/MtquMKH9fiISmd5Pq0sSwPit10h4+rXYeM4djPG9KF8PRJC?=
 =?us-ascii?Q?uHz/zCqmAdShfdu7LugjnE2i3VgL3QCINCrDhYnb4CojuYmKXVW5Iab7YFw+?=
 =?us-ascii?Q?0PTF1T3dqgdz3S1e10F7qRgD/L9/uRxn2BIinO+rb8jxtPoABAbnBSGNJfBq?=
 =?us-ascii?Q?Cm7nqK08E20Yfs0qZDxJdjQTAuXOQ+Ff8U+8GA04xmMKDVe2tYpbu2yyphaQ?=
 =?us-ascii?Q?cX3n/goSddk0B5j6JZQ09RGWC9FTcneI5dS5lUF+2mERDoMtJJuTDSLhyCLH?=
 =?us-ascii?Q?VClHYkgrSsPCqa+g4IFGI33cwdVLUcAWPnOPN91WkWLV4jbqcRcPwF1zIEvl?=
 =?us-ascii?Q?ZGo8cPI9RmD5wXFC72eCG0PRAc49TS7FRRzcxwW5hNHC2NMh/z7HcM5W1JZj?=
 =?us-ascii?Q?vQFdkxMWjT75nIOFO503Fog5Ae/+TU08qdizerlYtpKRckix+946kwyGQPYb?=
 =?us-ascii?Q?SFRcCElFfreCsTQaImKLewJnogPOKTMgapia9bujYRxUvPVc4K48hOaOp+MM?=
 =?us-ascii?Q?440rWyrNNgEkONro6HiCCL3g2bt4oeQ/MRQpHKSPqWhmNewpYe66G+qwdEkh?=
 =?us-ascii?Q?913KpnL79NApVrIHIR/L4T61TvwJoHGd4kWpTx41sz13YCPkMQ4YW0lkpcXn?=
 =?us-ascii?Q?+w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73da909f-f314-454b-8f72-08db04980d69
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 21:05:31.2899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U6Z7qnn9H4qcsc/0QVZ1U99TL/Z0JNPVIwOkzXjxS37Cc9ETo6NZ33HeGN29XVB7ei3ZUhM+lVT72ZX1bjJivA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6444
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Greg KH <greg@kroah.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 01, 2023 at 10:37:06AM -0800, John Harrison wrote:
> On 2/1/2023 07:31, Rodrigo Vivi wrote:
> > On Wed, Feb 01, 2023 at 03:11:31PM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > On Tue, 31 Jan 2023 10:27:29 -0800 John Harrison <john.c.harrison@intel.com> wrote:
> > > > On 1/31/2023 04:44, Andy Shevchenko wrote:
> > > > > On Tue, Jan 31, 2023 at 01:03:05PM +1100, Stephen Rothwell wrote:
> > > > > > Today's linux-next merge of the usb tree got a conflict in:
> > > > > > 
> > > > > >     drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > > > > > 
> > > > > > between commit:
> > > > > > 
> > > > > >     5bc4b43d5c6c ("drm/i915: Fix up locking around dumping requests lists")
> > > > > > 
> > > > > > from the drm-intel-fixes tree and commit:
> > > > > > 
> > > > > >     4d70c74659d9 ("i915: Move list_count() to list.h as list_count_nodes() for broader use")
> > > > > > 
> > > > > > from the usb tree.
> > > > > > 
> > > > > > I fixed it up (the former removed the code changed by the latter)
> > > > > Hmm... Currently I see that 20230127002842.3169194-4-John.C.Harrison@Intel.com
> > > > > moves the code to the drivers/gpu/drm/i915/gt/intel_execlists_submission.c.
> > > > > 
> > > > > Is there any new series beside the above mentioned that touches that file and
> > > > > actually _removes_ that code?
> > > > As long as the removal is limited to list_count/list_count_nodes,
> > > > that's fine. I only moved it from one file to another because the one
> > > > and only function that was using it was being moved to the other
> > > > file. If someone else has found a use for the same and wants to move
> > > > it to a more common place then great. I assume there was no conflict
> > > > happening in the i915 specific code.
> > > I have added this fix up patch to linux-next today (more or less - this
> > > is a hand hacked version, but you get the idea):
> > > 
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Date: Wed, 1 Feb 2023 13:13:01 +1100
> > > Subject: [PATCH] i915: fix up for "drm/i915: Fix up locking around dumping requests lists"
> > > 
> > > interacting with "i915: Move list_count() to list.h as list_count_nodes() for broader use"
> > > 
> > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > ---
> > >   .../gpu/drm/i915/gt/intel_execlists_submission.c    | 15 +------------
> > >   1 file changed, 2 insertion(+), 13 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > > index 3c573d41d404..e919d41a48d9 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > > @@ -4150,17 +4150,6 @@ void intel_execlists_show_requests(struct intel_engine_cs *engine,
> > >   	spin_unlock_irqrestore(&sched_engine->lock, flags);
> > >   }
> > > -static unsigned long list_count(struct list_head *list)
> > > -{
> > > -	struct list_head *pos;
> > > -	unsigned long count = 0;
> > > -
> > > -	list_for_each(pos, list)
> > > -		count++;
> > > -
> > > -	return count;
> > > -}
> > > -
> > >   void intel_execlists_dump_active_requests(struct intel_engine_cs *engine,
> > >   					  struct i915_request *hung_rq,
> > >   					  struct drm_printer *m)
> > > @@ -4172,7 +4161,7 @@ void intel_execlists_dump_active_requests(struct intel_engine_cs *engine,
> > >   	intel_engine_dump_active_requests(&engine->sched_engine->requests, hung_rq, m);
> > > -	drm_printf(m, "\tOn hold?: %lu\n",
> > > -		   list_count(&engine->sched_engine->hold));
> > > +	drm_printf(m, "\tOn hold?: %zu\n",
> > > +		   list_count_nodes(&engine->sched_engine->hold));
> > something awkward here.
> > The resolution on linux-next should align with the resolution on drm-tip
> > where we have the list_count still there as we preferred the version
> > on drm-intel-gt-next as the resolution of the conflict instead of the
> > fixes one.
> Not following why you want to keep list_count as a local function in the
> i915 driver? Surely the correct fix is to move it to the common header and
> share the code? In which case, the correct name is list_count_nodes() as
> that is what got merged to the common header.

right. please ignore my previous email and accept my apologies for the
unnecessary noise. I had just read the commit '4d70c74659d9 ("i915: Move
 list_count() to list.h as list_count_nodes() for broader use")'
and it now the final resolution makes total sense. And that patch had
been reviewed and acked by us, so everything is good.

I just confused with other conflict that we have with our on gt-next
and -fixes tree but with an easier resolution.

Sorry,
Rodrigo.

> 
> John.
> 
> > 
> > >   	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
> > >   }
> > > -- 
> > > 2.35.1
> > > 
> > > -- 
> > > Cheers,
> > > Stephen Rothwell
> > 
> 
