Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA955F3656
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 21:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9843010E4B8;
	Mon,  3 Oct 2022 19:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4489910E011;
 Mon,  3 Oct 2022 19:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664825576; x=1696361576;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pYYggf1QOwRiFqI6IwsjdaQk2Xctlhx2Q7jO54OfZYo=;
 b=VmOEMzV0/n7AH1/HA737SNosMN2PZ3avLm9UJdA+J4gsx9J3lUJqE02n
 FtEr3n3eGGcJQ5IPDOmAobaoCF98/yyJauTygcn0G2Ab++hyol7N7OoCp
 wsc1F6UoBloP0/HfsKY55Ah/qy2L/qkM00Fk0/EKukvDdRD1F3+gnrcpB
 eP2ujJv8XBwepMn7Dfq4M9bxNxAqDyqJDSm0txuZU7T6h4ujhCrRCo9iL
 NYRFLzK5zUm+xpxlnI34vQCdsgnGSbRGEmwgiZv1lSB3jYUKCO6zyWvSE
 v8f1y69jy2xaDTO93DqLL0PB3n/Jql/Q6epOANrwlrbGX1KfRGCbwkT2I g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="302720771"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; d="scan'208";a="302720771"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 12:32:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="692214392"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; d="scan'208";a="692214392"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 03 Oct 2022 12:32:55 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 3 Oct 2022 12:32:55 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 3 Oct 2022 12:32:54 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 3 Oct 2022 12:32:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 3 Oct 2022 12:32:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMOiyPwoy+GFxSEKq411Jxu2l00ZwsQQNsJncWn1ZkHi8QjAjm3I7gmqCwVrMa6Kq+M6m9rqhkrlkjltusAxjI+pc+EyLyjrrGgDu4ZFXoByd2tjrhJGpxmwD1IvG8Ti9j5+mH3cCNRF0N7wLApZRimHbiI818flUcoq1tLEiI19L4982Zi88BMj7MLk3BbADA+Ti5Nhwxnu1z6TYYu2osuwbMy4UWE0b8OyiVQIXAkKXiMJwzJeyTfvYLWdr9AuD4zS/fNoxpOmyVE630mdl6RhTjGENwq78kmUnWF9RhVEYXBx33eRmUuxjUvERQ5LTm+pHqfRmE6EnXGkE2Cu2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGj5DfkPjFf/HcY8Myo4e2vLlBamQW3t6AtnpTWE7AE=;
 b=j00uI/1ZkFIGDP3g3mMUBCP1JzVwFFL/LrO2/aLqa+OAJBu72IQ6LNY/ShM9V0CsL7JC4ostgs9YtiwJVHJ4UZ9dxyOnCBOMxDUFkr4u+OEghN0ni0eqHbKBYX6ltmkM96Ycvy6ts7D+pLugcpIIzcwDMta78HKHwXmYJW6TCKlGAJ7M5gdxi+Wrr7oTSsQ8yajDKLSTl3kCwmA9U577qrl4KceARseF2+W8YsjenlpbBmu4WGwwWB1yOG1/HkBLMgjkkcWtJW+oJcGpo/M6ffwGliin/0z4C2EWhOqqHNMWNYfsjARB1iq79EdizbViY6aFwfKrRgYgbnGhQgZQfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by PH7PR11MB6794.namprd11.prod.outlook.com (2603:10b6:510:1b8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Mon, 3 Oct
 2022 19:32:53 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::29f8:1b74:685c:6198]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::29f8:1b74:685c:6198%8]) with mapi id 15.20.5676.028; Mon, 3 Oct 2022
 19:32:53 +0000
Date: Mon, 3 Oct 2022 12:32:50 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 14/14] drm/i915/mtl: Add multicast
 steering for media GT
Message-ID: <Yzs44t6dUNd8LjZw@mdroper-desk1.amr.corp.intel.com>
References: <20221001004550.3031431-1-matthew.d.roper@intel.com>
 <20221001004550.3031431-15-matthew.d.roper@intel.com>
 <406ebfa6-b00c-b2ba-fd27-04e46de7ffc1@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <406ebfa6-b00c-b2ba-fd27-04e46de7ffc1@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0377.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::22) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|PH7PR11MB6794:EE_
X-MS-Office365-Filtering-Correlation-Id: 79c30f9f-60aa-4541-fb72-08daa5761085
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UdK8B5vQfv8ga35fMLQobC+dawS3UgZ8OlYsypcfhEWeRY0Rxm4u8VzsF9Dp12QL1BBby6zuE/92LDcpGVIqO5Igh8TObAEafXfzk2ViXedk8IiyJnyQE24HVirRj9EXROHJd4jjiEQ1CKR1mvTYKCnzi00HuwxpriTssA9W70IA2ikjFNxVHA8DsbZfR3s7FEeujlXLWGX6lvPqxeTTrmCmbslXcBd8NRhkprZAf3/mZXGVDctPWpscSIlVqB3ZlDFn2HQcwIouzCShUA9wu2DFwsx/osHx9kgdEXgO6/8uARe+i6atTn/RVmM/GqAdgKx4mLwwFnf0p7KH4WQTYoPFnW8p4FQJwThfJwFUSct0ttqMW4/aR0kA9P5nenXvePAvyUwHwXFivDzwXIxDoAs2GOAuA/5aaiKld1G41pLasc6pz7LWV0pu13Z+CTrB60asgcXzaC9h/JvFaGUHKxca/+5UEoZ+dmuOyub92j32BTgl+jwz7caEntZzWDEa9PIxtmDdrNhDIupPzIc0gMh9NLX78JcKqftVGTby6E19uSTa5RbQtieiRCb5uBjiCYwidarW+u2Fik5weca63XAzKca97cMROAeOy6JEz7L7v//Efza4iuiWNyYx0PKx3gGAl7PJAjJR8rZH8y6UmxOrjZlY1g+GeKUIiz/rdxIsnBNf2bUG1Ic0Vi+oMvcZCRvP6DhviMS9lo4aj0nqYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199015)(38100700002)(82960400001)(478600001)(6486002)(6916009)(66946007)(66556008)(8936002)(4326008)(53546011)(66476007)(316002)(41300700001)(6506007)(26005)(8676002)(86362001)(5660300002)(6512007)(2906002)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eNX4Fe9snSGvHr8G5xu9ejn0bPrmqVSJPQteCseFP/sUfHoqWR3efcbtGxST?=
 =?us-ascii?Q?9r6D7MIf+fVjcoBkUoejr1I2NvVNxToEMzuUI8dmDSp10IF3KnsENcPhBtZh?=
 =?us-ascii?Q?RULfEW99DyXb0j1cBzjD3QbZTmJ0V7GnOZTjNRMjY41reK0wBB9O+bVoV00/?=
 =?us-ascii?Q?VRD3lkin1F/1ytR9aVVEwUv/I9PjWWS0/5czrLEmKAYaVXWhWGRhH3sW9pLv?=
 =?us-ascii?Q?UL/1bIfWNmrDp4jLDcVJljgjaaEaMjR8rkz4dXLlshbWtDYRNFOWTeVzSJFy?=
 =?us-ascii?Q?e68gCTCxuSgZt894a19ubuGxBVu2mOLFiQcExBGSFpcsEP9+VVVhg3SxW89/?=
 =?us-ascii?Q?IPJejK86Au69BBVLr2QZgmHfOLh0C+8jAEbKq6ZyhtXu+4546tg+262NC5BE?=
 =?us-ascii?Q?gZqLo97tv4S6Rt84W8EKZDol/iuVqg9zNOQV8Vx9VPZKK2TLMd+LLfN/Ke+h?=
 =?us-ascii?Q?S8mT4qzOvRAXoah+zcxKXz5y3Zdt0nSyGsPJ0cQKR1ojnLeANGMfQ8Ms6gkV?=
 =?us-ascii?Q?ajALrObPawnG1jIAAdDRkLIEwq02/1/Us/N6aKkWr/TQKikgwMcIu7fsTqoN?=
 =?us-ascii?Q?CEmDzDjyB1t6s3kLFhGlE+mLwwv4a7TORw8MQvlugBA+8fWVxFcqw8gkkJiZ?=
 =?us-ascii?Q?PZgVR4DUDZe1GTztq+0qwOM3FoRLC1itJ3HohyGTdkaSmwA04KA/Ndl/GQy1?=
 =?us-ascii?Q?d1Y/Efw8q/LHWMMJwDjmuhTHIEzETdVGvZX0qMSFYOe8c/J1mxZ3oUGwPH4h?=
 =?us-ascii?Q?6CN6qKeJYVt5wbZk8XSOpswHMU7HNpuu/VIztFqyvUmZdbSOakU3DZyV4Ei2?=
 =?us-ascii?Q?HHJ3c1GuISYlxwc7QT9y1zqbmWrabOTGDYIuTBsIUHg4U3/3cs6v4FGD/E7H?=
 =?us-ascii?Q?nQKSCgPCyTVJS5ot1SWLjKJDNGU8GmJPClvYzB1/HZDHCWl6iKt6zbunAX3M?=
 =?us-ascii?Q?zHTKXhblzwPbP8QtC5pnvF7Exn3dYoGXTNcXllr6vsMBhr2B6EU79kgzpWNV?=
 =?us-ascii?Q?J1eyrocbBEHvNDrEoI/ORA4aLrfm0rVblIhfWcLii4zvL7j1sWNor8iopfQ7?=
 =?us-ascii?Q?C64YkbdOnIE4rPbENfiudXTiih0HMI5k0c6ngYF2l7ZMMfNbhk2RZl9Aoegq?=
 =?us-ascii?Q?6oztH0wuklw4uDzgUdxeM6GECiTCFos4t79R6C8h3TssfhUhx0jHAD0wt7xV?=
 =?us-ascii?Q?e2tKGI0ITUxOSoZC2YRUiwATpzsVrYjw9aqw1QOJl/U+esAB2ZCsjFQKd2ZM?=
 =?us-ascii?Q?TnsVV1eYr6QWZYfPvSQFHtAVSz/P8RPMNKnt3hxdtQX5J2MxNqJnhqIedW4D?=
 =?us-ascii?Q?oD6qH520D7i2sZ5zme6ShcuGHpuAiCnZMy0qGGVJC/1HNiHPC2k/3UIBDwHv?=
 =?us-ascii?Q?sw0SsFk6qIARuLqehHW3aFsTXVqltj9h9E++cBciww9Lz/IXSZwu5Kunzi3a?=
 =?us-ascii?Q?yx7e5s+PBMUVGrkAi45kkLd1SUpuwVDft1sgqvJCuP+9yZNtqgVEJxkiATOB?=
 =?us-ascii?Q?NOUxCYBoY5yIz3A0YFaWtSo/uPV+yD14kuB38+j3nLwQz2hPGUEi4HNjBAXH?=
 =?us-ascii?Q?tHq3FTBd3VTEQEP07kKY7lHOMRZyPcwNB+tVAhzJK077gd+GVdJYn+/COS3n?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79c30f9f-60aa-4541-fb72-08daa5761085
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 19:32:53.0786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lh++kX/rjOaCA7I7cGixxU7MkSNCrAGv/kB2cMPw/GQ2qsKyIiJ5FIo1+dwXAeWSPQjTXGsY25gtpb5kmY8fBcULkGP3xCfla5dgGCkcnNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6794
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
Cc: ravi.kumar.vodapalli@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 03, 2022 at 09:56:18AM +0100, Tvrtko Ursulin wrote:
> 
> Hi Matt,
> 
> On 01/10/2022 01:45, Matt Roper wrote:
> > MTL's media GT only has a single type of steering ("OAADDRM") which
> > selects between media slice 0 and media slice 1.  We'll always steer to
> > media slice 0 unless it is fused off (which is the case when VD0, VE0,
> > and SFC0 are all reported as unavailable).
> > 
> > Bspec: 67789
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/intel_gt_mcr.c      | 19 +++++++++++++++++--
> >   drivers/gpu/drm/i915/gt/intel_gt_types.h    |  1 +
> >   drivers/gpu/drm/i915/gt/intel_workarounds.c | 18 +++++++++++++++++-
> >   3 files changed, 35 insertions(+), 3 deletions(-)
> 
> [snip]
> 
> > +static void
> > +mtl_media_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> > +{
> > +	/*
> > +	 * Unlike older platforms, we no longer setup implicit steering here;
> > +	 * all MCR accesses are explicitly steered.
> > +	 */
> > +	if (drm_debug_enabled(DRM_UT_DRIVER)) {
> > +		struct drm_printer p = drm_debug_printer("MCR Steering:");
> > +
> > +		intel_gt_mcr_report_steering(&p, gt, false);
> > +	}
> > +}
> > +
> >   static void
> >   gt_init_workarounds(struct intel_gt *gt, struct i915_wa_list *wal)
> >   {
> >   	struct drm_i915_private *i915 = gt->i915;
> > -	if (IS_METEORLAKE(i915) && gt->type == GT_PRIMARY)
> > +	if (IS_METEORLAKE(i915) && gt->type == GT_MEDIA)
> > +		mtl_media_gt_workarounds_init(gt, wal);
> > +	else if (IS_METEORLAKE(i915) && gt->type == GT_PRIMARY)
> >   		mtl_3d_gt_workarounds_init(gt, wal);
> >   	else if (IS_PONTEVECCHIO(i915))
> >   		pvc_gt_workarounds_init(gt, wal);
> 
> Casually reading only - wouldn't it be nicer if the if-ladder in here
> (gt_init_workarounds) would have a single case per platform, and then you'd
> fork further (3d vs media) in MTL specific function?

Actually, that reminds me that we probably need to change this in a
different direction --- starting with MTL, we should stop tying
workarounds to the platform (IS_METEORLAKE) but rather tie them to the
IP version (i.e., GRAPHICS_VER or MEDIA_VER) since in the future the
same chiplets can potentially be re-used on multiple platforms.
Conversely, you could also potentially have variants of the same
"platform" (e.g., MTL) that incorporate chiplets with different IP
versions (and thus need distinct lists of workarounds and such).

At the moment MTL is the only platform we have with the standalone media
design so there's no potential for mix-and-match of chiplets yet, and
IS_METEORLAKE works fine in the short term, but we do need to start
planning ahead and moving off of platform checks in areas of the driver
like this.

> 
> Also, series ends up with mtl_media_gt_workarounds_init and
> mtl_3d_gt_workarounds_init apparently 100% identical. You will need two
> copies in the future?

Yes, the two GTs are expected to end up with completely different sets
of workarounds once the platform is enabled.  We've just been delaying
on actually sending the new MTL workarounds upstream to give the
workaround database a bit more time to settle.


Matt

> 
> Regards,
> 
> Tvrtko

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
