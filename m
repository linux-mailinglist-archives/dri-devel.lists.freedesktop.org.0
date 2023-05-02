Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D80CB6F4D69
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 01:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7750210E118;
	Tue,  2 May 2023 23:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F5E10E118;
 Tue,  2 May 2023 23:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683068804; x=1714604804;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jOBEI657COf2yafmS0HrrhKDDWbflyAENc5IbV+w5JM=;
 b=HWH0rJfM6S3JvaAK8FhT0vk9xCzYuL6XTT1AGQrZD6zElV8SGR5LTnZ6
 3ECbjmA9neh1AjZ69H7kjcor//tt+EHenBbfc4s4qLeFYnmGt0hwSzLr+
 btkAzAveGOsPadX6dAFGev/mXJkXN1Scwi19S99dmEnAYrf0lQsYr8k+i
 u7XpU41cz1tz7D7yMDKcwOZjZkTPicNTHPHP/vlGE6a1UTJ6tFMdYhRqx
 2JYCWohmKE5oOsoV1iB8C3OGjXVSXluR0GbWZCykg4t1sRxxcgCBlaqji
 QQ65ZaOfREr1Us9/An3JfUFYTrf3jE1pgb0HJ0ZuvOjco+83WlWF2zX3p Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="346003977"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; d="scan'208";a="346003977"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 16:06:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="690466378"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; d="scan'208";a="690466378"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 02 May 2023 16:06:25 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 2 May 2023 16:06:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 2 May 2023 16:06:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 2 May 2023 16:06:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 2 May 2023 16:06:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCMRzMWacC75lW+b5M8IlZKfZ9YaWdV9X2cy5U1JorWI2vA6vglVyCdM05t1s9XCR0uEw8PJFJTCe4sfPDYYvNN9TOju72o0yVUAgeKNdT1KpsLhOupf5Spc0MmHm7xez86y8nBXk1UcMro8YuSct1usWHJgb7O6gQkSerO1GKlAkVF2PnCtafgt9AfsRTikBeuN11vFVtKwXY1Oe6/uGpmCp6A1m7zvI5xqiGjncIEu9TxKo0GAKhsqBpb0F4Vcx1b6FR1DCgv/bO1My5e0HpwF3giSo9orZducgtbkiN8tIZUdbeSh6DMKTL/SFtnQCAh2BMb15ZlLpIfJPCuHvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EdljPpb57vN5N/kltXhrqToP4MvLyvJGcHG+C7D50Ek=;
 b=U2zclFQddm4zDJSUf/0e6b9Lsz2JCN63yRnSzLx63ARyF4Sfx9qulxztfOWnby2OVacp1wC0pjfEyAZrkd+cvDCK1209YmMiA10o+X8A9daIjmXfS6tq35Roa6eHl1H5JQEfohJHDn+x1FXa6VQn2IImN2M1XmngHSL5jiGZlK5W0g3ant2iaslYZ4zXsEd+W/zw9M3ecpVdmJnaMDS0H1dEdLtLQ3XEkaKRA7qjOaHGuOKQKDxs+Lxi9tMdpu4dbSxYR2ErWj+rso326bIPKeMR5JEScuoBnnywkZJ1EB8a7KkuO1F3AOrbJJ/YZHPJgytXL3Y8lPbNcAkgBT3Iuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB7102.namprd11.prod.outlook.com (2603:10b6:303:22b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.20; Tue, 2 May
 2023 23:06:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 23:06:17 +0000
Date: Tue, 2 May 2023 23:06:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Subject: Re: [Intel-xe] [PATCH 03/14] drm/xe: Do not take any action if our
 device was removed.
Message-ID: <ZFGXWiozW+stGJF3@DUT025-TGLU.fm.intel.com>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
 <20230426205713.512695-4-rodrigo.vivi@intel.com>
 <ZFEvAuZRXl5U6ntH@DUT025-TGLU.fm.intel.com>
 <ZFFGp1XD5Nfum0H7@rdvivi-mobl4>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZFFGp1XD5Nfum0H7@rdvivi-mobl4>
X-ClientProxiedBy: SJ0PR03CA0163.namprd03.prod.outlook.com
 (2603:10b6:a03:338::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB7102:EE_
X-MS-Office365-Filtering-Correlation-Id: 01146345-82cb-42a9-8a26-08db4b61d5be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lbPN8vM0whxgK92z9Q75inIqbC2FtmqagIzoF+2WPwFMIfZkat9qSw9QPKG4FY3frOIhvc9mQsaAfGpb5NGK7EmZALRBZ5GNdHbn3CDnxxOc8OMrRcKIM1xuVPXymCvnyThIxkp7jeiPYSFjPoVx/7nr3CV1fflGgfy+3SVbhtSjtiUvYOCc5uRxLAv8WM3oK/ICZBjt7OGObpwqAaP8yUMomB6CV8B2pc8HxSv1QTJLLFgaqn//w1ox2ekf+2usH2woSPzWOPnp0lSitzQMOYN4q5G7adR8mYMYlxpIX/ylTt1qM6/trz5fYNdEVSpqXCga8CN8VeSQHy3YqwYdMgYofM3gp2SpBYvBWXp8NRepIOI1goyiK/02iFQkUoJisnsGQTe2Bl9g3z3aQONJxd4R3MU+S462rBrVDckV1+bHPKaMgSsIDoJtoKcyd5SL88RP+JWJvvW76g3SkIa1izzk7I0PEuGc0+vG/hQmDHD7ySfc3pCzVFAQf/yLlQs8kOTFBtJnp/ebARs/ysFQtIGmnuPL3BJjsa4JuNZfjnBTxrs2XAjZZ7QTWUfR7gX28ZZ9ZiGXujc9QVUEYyyw1qLcMADVRI8374vrvCdIIMY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(366004)(136003)(376002)(396003)(451199021)(5660300002)(44832011)(86362001)(83380400001)(6506007)(107886003)(186003)(26005)(6512007)(82960400001)(38100700002)(41300700001)(8676002)(8936002)(6486002)(6666004)(316002)(4326008)(478600001)(6916009)(66946007)(66556008)(66476007)(2906002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U3lStJvvJo1XrzhFe6sK8GurmSL72mMgPJaWJ9cIPAGKGTjK7q2LUr6UOKuR?=
 =?us-ascii?Q?XfmP00MVmrIJ8vym4dAeD3z3ws1Aj30uUS198A4ys9Zl3yIbv2TBWRQL8aaY?=
 =?us-ascii?Q?DeDqSQ+9G2kp6xwiQPHhjjOt4zlOQKejHXnMxb1teQbfProlYBHle+risVVj?=
 =?us-ascii?Q?x5HgpjJ9cqjJQ2zQvO14q74DgJ8G7YRpJ/bWum3Cx4ilpR8iyAp3hnnb8+6r?=
 =?us-ascii?Q?NNCW+gmkhyCE9sGk7GvDxw/je3HyMzJIGJNdF12ArjK9dmFCKHmwpeDwVzD+?=
 =?us-ascii?Q?tFTx/9jWfty0kTJNT/B5LMYQD/ayubge7RpSByghE1IOBk0MKx96/bq2ue1i?=
 =?us-ascii?Q?HefPUo8OOV/4kw/p3ZgxZU0E40F8CifIEeit25kj5vbkQfxbzLpdqla+nScF?=
 =?us-ascii?Q?/uhVpbAGnspdyPKih17cW6p7jfLpqWJdJYZCJo95K1Jl1JjHslchk6rCTDBq?=
 =?us-ascii?Q?dmWyYvSdRRkZE4oKQ3A2j+sn08WApuHx6IGhKN7k0HEvXzZzbrGHIRz5zvIL?=
 =?us-ascii?Q?+k78gvS03JCkZB8KbAWyo/xVfd6BspLKl1YAK2KDZRWPTVV6vLP/jWeQfpji?=
 =?us-ascii?Q?Po0T9VpDAseMzi+Na2uhz0hMgOWIHUncjnELhgZWVsTMJx3hReeT0oCV9qmH?=
 =?us-ascii?Q?6Nnz8kT48U4HpjAnPPesjVAMQlGVbfOOjB9S+bUJ40X/tmjTxKVNVlW0aeXn?=
 =?us-ascii?Q?B/ou/vLjixAd795gRU0glqbf02J1Omo/9zelM4QIA/BHOaRhXJDr65KRtebz?=
 =?us-ascii?Q?FOBxwCuDAvEKT7G4BZM2x/czaHyTxxwwJfqdVd7ym3uvsbst9ONDf+gTRacm?=
 =?us-ascii?Q?d8cunIItlllniWkYsK/jvCwEmpFu2AipLmOB45s+6SXm36gFg8qz2QgZgBju?=
 =?us-ascii?Q?O05SlNfXodxfpNRft4zvtgj+WMLo8223wLZVA4dod5llmWROlfkIgrD3tNWf?=
 =?us-ascii?Q?cRd5ye0w/ZXpU30lI6X0ZjdQgLTUplOZz8TOq1SuuEof+39mQS1JQ3+xyqAw?=
 =?us-ascii?Q?wEEG3ireUMOaCPxq6M6JPYkVlUc7w7iCbxpgRDAE7rQtKjZ8JTMbPSYgksjN?=
 =?us-ascii?Q?x6trHAEmcTw/+JqTrSsQOy+yQfq7A+JvbjrfIRJc7qNGk9pl0jfNitnQ52yC?=
 =?us-ascii?Q?jKC3IT8v7FTrPvdVU5+efnGpcGDaWRW5IsZmgoXy60yz+24ArE2v9PQXch6o?=
 =?us-ascii?Q?ihHBYD8Ub8DTmx1FTVBFTRMFgb6fCkKMc9AzzzEKjSC92Z2I96pUIl74sytb?=
 =?us-ascii?Q?AUjsLduOYWttRoIWzV5md1DNQBV/woTGSrNrz2lt7yXA6NsjkW1FhhJfUGpK?=
 =?us-ascii?Q?9LHFrVYDPZLDLRQWMcgOGwxfM+HmAdHSz7p1raZYDnN27J8I2nYlOy58ionw?=
 =?us-ascii?Q?mVFV/waYkSuUkrVmkbmARPHClOkBCIWJ9kH0x0pl8LzZfyQCbtTVAyZLPBkc?=
 =?us-ascii?Q?m3lzWgdcUagemh0+Cf5yTee9W4f4bQm8b8OOzd4tOSLAr16LYj8uBwbio4TS?=
 =?us-ascii?Q?/8B5Nftg36rSpk6Cs0C2ynAe1NIim/loYD3ho1hDLW5OrpaWF8ViNp6r5YvY?=
 =?us-ascii?Q?9GBHpL3ged/DW6aVrTub3Ceo4SKPDEe0tAfNJ6Ldak8slVKqG/30pwIHUSNd?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01146345-82cb-42a9-8a26-08db4b61d5be
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 23:06:17.6307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPNqMrL4flPhQQCKFzX7XAgq3jOION4YamXEEfSg6iCnYDdCaIDnBtZcGhTcGmUIlpEkYOm3Eaq257N8989HdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7102
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 02, 2023 at 01:21:43PM -0400, Rodrigo Vivi wrote:
> On Tue, May 02, 2023 at 03:40:50PM +0000, Matthew Brost wrote:
> > On Wed, Apr 26, 2023 at 04:57:02PM -0400, Rodrigo Vivi wrote:
> > > Unfortunately devcoredump infrastructure does not provide and
> > > interface for us to force the device removal upon the pci_remove
> > > time of our device.
> > > 
> > > The devcoredump is linked at the device level, so when in use
> > > it will prevent the module removal, but it doesn't prevent the
> > > call of the pci_remove callback. This callback cannot fail
> > > anyway and we end up clearing and freeing the entire pci device.
> > > 
> > > Hence, after we removed the pci device, we shouldn't allow any
> > > read or free operations to avoid segmentation fault.
> > > 
> > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_devcoredump.c | 19 ++++++++++++++++---
> > >  1 file changed, 16 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > index d9531183f03a..a08929c01b75 100644
> > > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > @@ -42,6 +42,11 @@
> > >   * hang capture.
> > >   */
> > >  
> > > +static struct xe_device *coredump_to_xe(const struct xe_devcoredump *coredump)
> > > +{
> > > +	return container_of(coredump, struct xe_device, devcoredump);
> > 
> > Confused how still would ever return NULL, can you explain?
> 
> Very good question! I'm honestly still confused myself.
> 
> There's something not quite right with the device relationship that
> is getting created with the failling_device and the virtual coredump device.
> 
> Once failing_device is removed, the devcoredump should be removed as well,
> or both removals blocked. However this is not what happens.
> 
> On rmmod xe, the device removal is called and we free all xe structs.
> The pci device removal is a void function. We cannot fail. The module
> removal ends up blocked because the relationship, but that doesn't
> saves the day since the device itself is already gone, by the pci
> removal function.
> 
> But the devcoredump device is there and active. There's no callback on
> devcoredump infra that we could call to force the device removal. Then
> any read function will hit a NULL xe device and BOOM!
> 
> This is one of the things I planned to tackle on the devcoredump side
> after we get this basic infra in use in our driver. This patch allows
> us to be protected from this scenario while we don't fix this at the
> devcoredump side.
> 
> It's worth saying that the devcoredump virtual device is auto removed
> after a time elapsed... couple minutes? (I can't remember by heart now).
> 

After some serious thought, I think I get this. With that:

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

But agree this goofy and try to fix this properly after this is merged.

> > 
> > Matt
> > 
> > > +}
> > > +
> > >  static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> > >  				   size_t count, void *data, size_t datalen)
> > >  {
> > > @@ -51,6 +56,10 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> > >  	struct drm_print_iterator iter;
> > >  	struct timespec64 ts;
> > >  
> > > +	/* Our device is gone already... */
> > > +	if (!data || !coredump_to_xe(coredump))
> > > +		return -ENODEV;
> > > +
> > >  	iter.data = buffer;
> > >  	iter.offset = 0;
> > >  	iter.start = offset;
> > > @@ -80,12 +89,16 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> > >  static void xe_devcoredump_free(void *data)
> > >  {
> > >  	struct xe_devcoredump *coredump = data;
> > > -	struct xe_device *xe = container_of(coredump, struct xe_device,
> > > -					    devcoredump);
> > > +
> > > +	/* Our device is gone. Nothing to do... */
> > > +	if (!data || !coredump_to_xe(coredump))
> > > +		return;
> > > +
> > >  	mutex_lock(&coredump->lock);
> > >  
> > >  	coredump->faulty_engine = NULL;
> > > -	drm_info(&xe->drm, "Xe device coredump has been deleted.\n");
> > > +	drm_info(&coredump_to_xe(coredump)->drm,
> > > +		 "Xe device coredump has been deleted.\n");
> > >  
> > >  	mutex_unlock(&coredump->lock);
> > >  }
> > > -- 
> > > 2.39.2
> > > 
