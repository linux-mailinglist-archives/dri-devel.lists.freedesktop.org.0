Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDE36E98A7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 17:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5794A10E982;
	Thu, 20 Apr 2023 15:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED6510E960;
 Thu, 20 Apr 2023 15:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682005518; x=1713541518;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6e3jcl3rEySDZ3OzVkYBdUYdtTR0Kym9pe0zLXi6izE=;
 b=MjRPbaVtgv4dWNj84yDAWRU71HigpOF6Cg9mtfX8HA4OvtfU4ktWSoTF
 sdmeDFZm/b8iTUMJKOcVEXJQ1BbQv4p/MDVLBWn5CriKFzYk4Nl0PYwSB
 vHoVzNb0sr54wRqnmMw9ULQFizrKxv0ybyDK/ebOZQDtqV5YfWiY4ll+h
 JKcUUN3/Zk9SkhMs3glz3kwiaeBTnHu+9aFMT7D85/bY9HTDwwWUBSqIF
 qskosWRW6LoPur8lzqvIlnusA49gu2foEPjRqf5jffMt9xoHNqqLYuV+b
 cSF9nItf1mQNGOeCYryegi4ScZWECvRfGqi12WWhcfcJX2MDxQPoYxGVz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="325376435"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="325376435"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 08:45:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="669390592"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="669390592"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 20 Apr 2023 08:45:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 08:45:16 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 08:45:16 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 08:45:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BtWKU7UKs/Wi6MAs4OMXhwxsAmSyUV6sVLNXLMENGCLP6LqzMV6baU9cT9cXr6BDaH0ag+ad6Hye1YmZ1oFF9f802LodFireTgJ+gwK0fePjSrYniYLoSXZ05MReRr4EnSmYFtwYYi4vaNCFdrOsHaZRhtYA7ZbZEAibLsn4XCYpLbdxMbePakjTwiMxUVmqBwotWJsFFnl05NKLvz1cSxiMI5qIbPELn9tCuifVo8C5gxjKfdmQU8Fuf9WEsV37A/9brKtsp8N9G/Eu/LVXW8CtXmiI3B7rMTgnsWXdBEjpOMIL5cAIfrhwqJETCgo/dGXZr0iteU5S1AeBy7zfXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzR3w1QLL0Wrl7onzGIfJVE3dbzzcGkuVOCnsRNRv+w=;
 b=XyvznyKFvHP8Oj6n4QmGFEGT5v7Eyw8GQINv4eEruS6EykXCpWXjXd7xsw5vsazhtFFP5qQ85Q1zWxwF6mxp4Ho4v+rVX+eNQ7pKfdGOd0b/BQFZTtIDRe/zDKWZ4EQty4Urqpz+KzmWfxtRNx9iQRDahhYBMF9HkN2nSKJUF8pYTYJvsNXlQcDnLNpN2jEi08cRDRJyXGKf6pAitn9vlM2pM8UhTlqVe1EOBx1WmA+6Wz0uOCNXVFhaIg7ZkgizCXSgEsDq3gCA2Tvcr6E7o+p1QjxVVT+jB6lta5xqTmfk5i8voGHJH1Du9ymzfoaN1/QrwB8DKwk2rphgaFWdTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW3PR11MB4540.namprd11.prod.outlook.com (2603:10b6:303:56::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Thu, 20 Apr
 2023 15:45:14 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 15:45:14 +0000
Date: Thu, 20 Apr 2023 11:45:09 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915/hwmon: Block waiting for GuC
 reset to complete
Message-ID: <ZEFeBeVtcEfBk0PJ@intel.com>
References: <20230410223509.3593109-1-ashutosh.dixit@intel.com>
 <20230410223509.3593109-4-ashutosh.dixit@intel.com>
 <ZD4sPiMDhhr1wO8+@intel.com>
 <874jpdje8p.wl-ashutosh.dixit@intel.com>
 <ZEBDvKq0vEx/Ow5Z@intel.com>
 <87zg73msgb.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87zg73msgb.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY3PR10CA0025.namprd10.prod.outlook.com
 (2603:10b6:a03:255::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW3PR11MB4540:EE_
X-MS-Office365-Filtering-Correlation-Id: c46d4889-782f-41a7-fdf1-08db41b63b79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PVprNIPcMbMl6WQUXAjfuu172sbfjslPEG12uIavbTh0GovfS85rPDeOtOLXrIGi6NImvwBU2FbVF+N3QaSg1A0hICx5om9z14cGciQqVMT0pxU46bwENFVo7FA+IKAIMTfoOFMB4BHHchZoib/rPWkvz96K8wM10qETR0ROFsWqdX76HumaAg2q5M+yae4ytM5hUAfJ3KDXMTAzINuapIBjVs/vQZEf8vubtEPIXdvMezIxhknkhrSjPuFeDzb/W/RUxJL52fJa7SJi5P6B9/M2s5FUerxbph6Hbyy107QmtOZrb8+1KPL9nm/otu35DNyu/fjnqZBgvdddW67YdCVysEXISX02OJoBO/hLl5tzwQgrjbaBAQiRC6EbZUaq0hFpo9tshUuZP3FnCMRiejE8e64OkyiLtdHr0kfrxVVufJ+nj1XrZK6mcFbmeX1ThEpIQA1C4YY4XptgSvVRMydfkwNxSPabRUEFlNXWpUo6XEzDeZ7lCLah91yVvyf/6K0G6tak+Im0BkK3f0GJt4Y8c0r/JWXbDwWQ71fQxFiz3PDniN9xao08+sLtMTIe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(39860400002)(136003)(396003)(376002)(451199021)(5660300002)(6486002)(41300700001)(316002)(66946007)(4326008)(450100002)(66476007)(478600001)(66556008)(6636002)(44832011)(37006003)(8936002)(6862004)(8676002)(82960400001)(38100700002)(186003)(83380400001)(2616005)(6666004)(26005)(6512007)(6506007)(86362001)(36756003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cz+eb7WbZgNbcWDYd9lIsiqAhhgHiwFlyCLjgAcKhm6DSxbpTHAqerX7ueYt?=
 =?us-ascii?Q?EED0wrZoP4+RGDFoJLFoBGClny6dPp0GP3IpiMhAsGYg5o9ev+zyeDD8eNJ4?=
 =?us-ascii?Q?sGvh2fqdEaIUugiUdXM8uNLadmrbp54F6W/KSEelfjOFhV0R/dkHaMO9GbCq?=
 =?us-ascii?Q?EicuIku7XBEC6p8OHMPJ8sHIUzeZ6OPzE8W0zatUaBAMvwXL5QCOZgyUJuOd?=
 =?us-ascii?Q?0eicofcvq9kEyRatfcjF+yIm/qZcNeqalj0PQ46o08AxHO7UnFS/MRq48JqG?=
 =?us-ascii?Q?gLcp2esyakPsAOIJ2vh2xRLSyysd85/1QtzqSFu4p/8CGjmPJ+3FFFZ1x7z9?=
 =?us-ascii?Q?+jXx4tNH9IWz+Pw2Nh2jV7vE/GOUyfapTnqMREyGjT/GqEiGgTFHPHXcK27I?=
 =?us-ascii?Q?VWEgauzzbb8MAfipOqgmv772GcFYw7Jr3LiQX2zGX7sf1EnsXpQhrlOyOTG3?=
 =?us-ascii?Q?WTYD3FAxgaYB2AgAr4BykX1yaXDmBeB3tq65A4gn5i23Gq4wsVHNRrF5/pOh?=
 =?us-ascii?Q?3nTsrAIm0q/mGqZ9Svd8/OME0NyTBIrxG6rAylSG8HqhPDYT2warlpBBK5XW?=
 =?us-ascii?Q?zb8Q7J9G3uTFD0FYqh2Yf5RL8tZaTWN9DcN6mk5PWaonD7VM5w2b8t7Mr0ia?=
 =?us-ascii?Q?Ix+JNWkdT45Zw/7srwHnYrSF5hlZzTYBU3YMSKJYX7gYz27bO4i1GzAaLa4q?=
 =?us-ascii?Q?xHV/7Qx9J6463LcVv5VcsUCcH6yrbIgmIejQjec3vaTlYv6ijBgmBdXH7xET?=
 =?us-ascii?Q?DUCDEUZAyQ3+btqlXfMNZM9tFkBE++epQzaka1j9PVRDoGYb/T/7/ajBIpbt?=
 =?us-ascii?Q?gxpbG7+ARrZqcnv+puJ1zdlM6/ttEm46WHAxjpiSpXt+7s5EYzr3Y25AlCQE?=
 =?us-ascii?Q?hQs/XqSm+Vs2avT7NKpU9BN8JvDSRTu38PJ4pcp0BTXh923nLHCO7O5U/ZTT?=
 =?us-ascii?Q?+YZZ6MZVvZ+WCcPpW/tQF8hBknM9Bqc6oB+3enBVkpRxerIOwkwOwIM3rFik?=
 =?us-ascii?Q?8uKsfz7aVYM/Ssn235UvVxjmJKNqRzEdwRZAUWoGONUzrFHxisU/4iKS+k8/?=
 =?us-ascii?Q?TsxShDj/iVPSo61OXc0dCYMG6yO4oJy0a0QTrnM7rW41ccEQf3g7zCyArd3M?=
 =?us-ascii?Q?LNKAI1zB9jnKvK7acDl1mvmkBMTt5db91mHJ+FI3Lc7s/EBpMOsalD7/JAf5?=
 =?us-ascii?Q?Ay/3BITtajOi3uDyiT/xjpY+TKoBObXbshxG8DKs5p1be5sLJ1WkLwUBJFwZ?=
 =?us-ascii?Q?F0XVRcPAX1sodtvAsDtfltIu/0jEW8z4GP6In7tAQ/No5yA/GwJT9rJJiwmb?=
 =?us-ascii?Q?NnudmvGzTrSSzN010XHZvviF6V3JqtbQm5TlimUG/U03otB6rZYIBDUcRVIw?=
 =?us-ascii?Q?ObnQElwrETUivDFTB3yqdtwcxkjZUXsfdpv8hZ1ld35FTzdtRGKdzwhzckEn?=
 =?us-ascii?Q?MZbrnW2KB4iGdZPqNCcxh39RJ6GbuUytiCpwrc/MobBRrfu4VsziGocsu8Yg?=
 =?us-ascii?Q?R+K2lvo5q/qGePsj+ISkhTE03ncT8aThV2jyoNHP1CjIJYskw/hzLPphECBR?=
 =?us-ascii?Q?Z8RutO7jD09N4+2EkIJNgPeu7f/MMWvgwRAacckq5Llk2q9aD6LzwTHTsEwz?=
 =?us-ascii?Q?og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c46d4889-782f-41a7-fdf1-08db41b63b79
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 15:45:14.5582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uqq0flqPkqwxftbxbYzBonFfcdAii/Rju4GT7TL5zI2ZTbw57ViGQFDLEw1B17SFKHFyA+y2w3bdHFaaKB9zBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4540
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

On Wed, Apr 19, 2023 at 03:13:08PM -0700, Dixit, Ashutosh wrote:
> On Wed, 19 Apr 2023 12:40:44 -0700, Rodrigo Vivi wrote:
> >
> 
> Hi Rodrigo,
> 
> > On Tue, Apr 18, 2023 at 10:23:50AM -0700, Dixit, Ashutosh wrote:
> > > On Mon, 17 Apr 2023 22:35:58 -0700, Rodrigo Vivi wrote:
> > > >
> > >
> > > Hi Rodrigo,
> > >
> > > > On Mon, Apr 10, 2023 at 03:35:09PM -0700, Ashutosh Dixit wrote:
> > > > > Instead of erroring out when GuC reset is in progress, block waiting for
> > > > > GuC reset to complete which is a more reasonable uapi behavior.
> > > > >
> > > > > v2: Avoid race between wake_up_all and waiting for wakeup (Rodrigo)
> > > > >
> > > > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/i915/i915_hwmon.c | 38 +++++++++++++++++++++++++++----
> > > > >  1 file changed, 33 insertions(+), 5 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> > > > > index 9ab8971679fe3..8471a667dfc71 100644
> > > > > --- a/drivers/gpu/drm/i915/i915_hwmon.c
> > > > > +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> > > > > @@ -51,6 +51,7 @@ struct hwm_drvdata {
> > > > >	char name[12];
> > > > >	int gt_n;
> > > > >	bool reset_in_progress;
> > > > > +	wait_queue_head_t waitq;
> > > > >  };
> > > > >
> > > > >  struct i915_hwmon {
> > > > > @@ -395,16 +396,41 @@ hwm_power_max_read(struct hwm_drvdata *ddat, long *val)
> > > > >  static int
> > > > >  hwm_power_max_write(struct hwm_drvdata *ddat, long val)
> > > > >  {
> > > > > +#define GUC_RESET_TIMEOUT msecs_to_jiffies(2000)
> > > > > +
> > > > > +	int ret = 0, timeout = GUC_RESET_TIMEOUT;
> > > > >	struct i915_hwmon *hwmon = ddat->hwmon;
> > > > >	intel_wakeref_t wakeref;
> > > > > -	int ret = 0;
> > > > > +	DEFINE_WAIT(wait);
> > > > >	u32 nval;
> > > > >
> > > > > -	mutex_lock(&hwmon->hwmon_lock);
> > > > > -	if (hwmon->ddat.reset_in_progress) {
> > > > > -		ret = -EAGAIN;
> > > > > -		goto unlock;
> > > > > +	/* Block waiting for GuC reset to complete when needed */
> > > > > +	for (;;) {
> > > > > +		mutex_lock(&hwmon->hwmon_lock);
> > > >
> > > > I'm really afraid of how this mutex is handled with the wait queue.
> > > > some initial thought it looks like it is trying to reimplement ww_mutex?
> > >
> > > Sorry, but I am missing the relation with ww_mutex. No such relation is
> > > intended.
> > >
> > > > all other examples of the wait_queue usages like this or didn't use
> > > > locks or had it in a total different flow that I could not correlate.
> > >
> > > Actually there are several examples of prepare_to_wait/finish_wait
> > > sequences with both spinlock and mutex in the kernel. See
> > > e.g. rpm_suspend(), wait_for_rtrs_disconnection(), softsynthx_read().
> > >
> > > Also, as I mentioned, except for the lock, the sequence here is identical
> > > to intel_guc_wait_for_pending_msg().
> > >
> > > >
> > > > > +
> > > > > +		prepare_to_wait(&ddat->waitq, &wait, TASK_INTERRUPTIBLE);
> > > > > +
> > > > > +		if (!hwmon->ddat.reset_in_progress)
> > > > > +			break;
> > > >
> > > > If this breaks we never unlock it?
> > >
> > > Correct, this is the original case in Patch 2 where the mutex is acquired
> > > in the beginning of the function and released just before the final exit
> > > from the function (so the mutex is held for the entire duration of the
> > > function).
> >
> > I got really confused here...
> 
> Sorry, the patch is a little confusing/tricky but I thought I'd better
> stick to the standard 'for (;;)' loop pattern otherwise it will also be
> hard to review.
> 
> > I looked at the patch 2 again and I don't see any place where the lock
> > remains outside of the function. What was what I asked to remove on the
> > initial versions.
> 
> So it was in Patch 1 where we changed the code to take the lock in the
> beginning of the function and release it at the end of the function (you
> can see it Patch 1).
> 
> In Patch 2 the 'unlock' label and 'goto unlock' is introduced and the lock
> is released at the 'unlock' label (it is visible in Patch 2).
> 
> > But now with this one I'm even more confused because I couldn't follow
> > to understand who will remove the lock and when.
> 
> In Patch 3 again the lock is released at the the 'unlock' label (i.e. the
> destination of 'goto unlock', not visible in Patch 3). But we execute 'goto
> unlock' only when 'ret != 0' in the 'for (;;)' loop. But when 'ret == 0'
> (when 'ddat.reset_in_progress' flag is clear) we hold the mutex, execute
> the entire function and finally release the lock at the end of the
> function.
> 
> Hopefully this helps.

more coffee also helped! I'm sorry for the noise.

with the timeout thing sorted out:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> Thanks.
> --
> Ashutosh
> 
> >
> > >
> > > >
> > > > > +
> > > > > +		if (signal_pending(current)) {
> > > > > +			ret = -EINTR;
> > > > > +			break;
> > > > > +		}
> > > > > +
> > > > > +		if (!timeout) {
> > > > > +			ret = -ETIME;
> > > > > +			break;
> > > > > +		}
> > > > > +
> > > > > +		mutex_unlock(&hwmon->hwmon_lock);
> > > >
> > > > do we need to lock the signal pending and timeout as well?
> > > > or only wrapping it around the hwmon->ddat access would be
> > > > enough?
> > >
> > > Strictly, the mutex is only needed for the hwmon->ddat.reset_in_progress
> > > flag. But because this is not a performance path, implementing it as done
> > > in the patch simplifies the code flow (since there are several if/else,
> > > goto's, mutex lock/unlock and prepare_to_wait/finish_wait to consider).
> > >
> > > So if possible I *really* want to not try to over-optimize here (I did try
> > > a few other things when writing the patch but it was getting ugly). The
> > > only real requirement is to drop the lock before calling schedule_timeout()
> > > below (and we are reacquiring the lock as soon as we are scheduled back in,
> > > as you can see in the loop above).
> > >
> > > >
> > > > > +
> > > > > +		timeout = schedule_timeout(timeout);
> > > > >	}
> > > > > +	finish_wait(&ddat->waitq, &wait);
> > > > > +	if (ret)
> > > > > +		goto unlock;
> > > > > +
> > > > >	wakeref = intel_runtime_pm_get(ddat->uncore->rpm);
> > > > >
> > > > >	/* Disable PL1 limit and verify, because the limit cannot be disabled on all platforms */
> > > > > @@ -508,6 +534,7 @@ void i915_hwmon_power_max_restore(struct drm_i915_private *i915, bool old)
> > > > >	intel_uncore_rmw(hwmon->ddat.uncore, hwmon->rg.pkg_rapl_limit,
> > > > >			 PKG_PWR_LIM_1_EN, old ? PKG_PWR_LIM_1_EN : 0);
> > > > >	hwmon->ddat.reset_in_progress = false;
> > > > > +	wake_up_all(&hwmon->ddat.waitq);
> > > > >
> > > > >	mutex_unlock(&hwmon->hwmon_lock);
> > > > >  }
> > > > > @@ -784,6 +811,7 @@ void i915_hwmon_register(struct drm_i915_private *i915)
> > > > >	ddat->uncore = &i915->uncore;
> > > > >	snprintf(ddat->name, sizeof(ddat->name), "i915");
> > > > >	ddat->gt_n = -1;
> > > > > +	init_waitqueue_head(&ddat->waitq);
> > > > >
> > > > >	for_each_gt(gt, i915, i) {
> > > > >		ddat_gt = hwmon->ddat_gt + i;
> > > > > --
> > > > > 2.38.0
> > > > >
> > >
> > > From what I understand is the locking above is fine and is not the
> > > point. The real race is between schedule_timeout() (which suspends the
> > > thread) and wake_up_all() (which schedules it back in). But this
> > > prepare_to_wait/finish_wait pattern is so widespread that the kernel
> > > guarantees that this works correctly as long as you do things in the
> > > correct order (otherwise we'd see a lot more kernel hangs/deadlocks).
> > >
> > > Thanks,
> > > Ashutosh
