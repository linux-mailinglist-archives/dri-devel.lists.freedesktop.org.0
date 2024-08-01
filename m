Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 688F89439DF
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B553310E656;
	Thu,  1 Aug 2024 00:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ifI/GVH9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F6010E64A;
 Thu,  1 Aug 2024 00:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722470616; x=1754006616;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=S5sZ2XTX7xz504k1NYbxZ2hejf8P7ZxoTL+gO+bPalw=;
 b=ifI/GVH9HgRSC+KjRt4EyiWXRaCpGIlOYKXF+R3JReeBu6ejT63tozVK
 J6B5gvQ9aQqqX5SHZt0ZgEz0s5o0exMmQZPNghtoYlBIhQqAx4qJABUoE
 qz1tgksGfo6FeZwUhYuCXUDX2m81rCVMFxdwOLJO0Aq/pzepn226ENCw7
 qVBmeqXMybMN36ZyeuJxngKCN5HyeWN8hSj7sL6+83+/AjzhQH9xd1gG6
 NAUqwVtHD/2LrBIkRbGzKWyC4XRU4a/YR9Wm4zt2keCoXlMi2NgUXwucn
 W9r9eMwM03b0aY4emC1KchMlvaWu7y6H00ZXt59nCC0AUH8pH0i7qOmIe A==;
X-CSE-ConnectionGUID: AzuyzPaSQ7+ms/0XUY/utA==
X-CSE-MsgGUID: F6D6xxXpT2G03UxGTLVQ4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="30968859"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="30968859"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 17:03:35 -0700
X-CSE-ConnectionGUID: AvYbif/SRRa0h/PY0azLlg==
X-CSE-MsgGUID: TxrVa67HTueJBBQ3Fj731w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="85462484"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 17:03:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 17:03:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 17:03:34 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 17:03:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V3PkW/5Y2rOQhOk8xgZjHpgA5B0yoLG1COtB1tBNL216Ve2uc9/aWggCJsLu+v45UfetWN9ZW6b5LhSGJ1HJuVEvuoR6RbukAtm3CeeMEV3wqnLJMOc24uvZrUZgBGNSdX6EIJUV1iW7NnqL7I0csefUhGaYHfc89dI2sM7EZj4IQEBrlcFyJqQTBvZ2dyeZdI8tCduNX6QjdFar4wARbhQ3z1zRoCYLU//KaSuWGC+QA0WjkDRYWfHr76lTPwdae0tjYxPr9aoT7K9SXrUv4gAUbnj+gQAV+HdMMopiZKyFygExugJ/saNPMCcseasAZhVY9CIzDCb0hXCGIIa9/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eiOI5c3Rj6DbmB1+3oKwcKm/VGAlVhFEINCfMUiBItY=;
 b=kLIhLUnBoBABx0GKof7cEnjTFYckIs3PMAbqAGAQPRS1iCBrlJYFZtSF6sm/pdE8yZnjgvmfZx6rGdIbDBCWJRUWiIWz6wrHgu6J++31Z4wEEV6XVcZhZzG9SSnndLRVJ4z6Om+3G0XTSaO+c06mmFGxBtwMHnqIK2OenPO9xXhkbQrb5Q+hipLGixD0JfzevN+LFjsdXMIsyMnYibv2N28HaPRXNePmNeYPCmkTcgRvA7qu3JD9Km+zI/l160ry0HPn1TkvVOaiw2hbX8XLxLcejiR7JphHtuN7lm6g0hJfKuo5/3RgPtNT6mqTTlv6J3ANKmoDqVLDDG2byPsp3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.29; Thu, 1 Aug
 2024 00:03:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 00:03:32 +0000
Date: Thu, 1 Aug 2024 00:02:39 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4 2/3] drm/printer: Allow NULL data in devcoredump printer
Message-ID: <ZqrQn8BwrVdXtdjG@DUT025-TGLU.fm.intel.com>
References: <20240731213221.2523989-1-matthew.brost@intel.com>
 <20240731213221.2523989-3-matthew.brost@intel.com>
 <CH0PR11MB5444E19C7B2423D654F3B2AEE5B12@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444E19C7B2423D654F3B2AEE5B12@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0337.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5880:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b61d4b3-5cb0-4a71-9a0b-08dcb1bd617b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xzT4XvpkatgHbrflNbasmcQd6kKWyvYIWQVnvx1k6sK7nWgZKl4nFFrgN2ku?=
 =?us-ascii?Q?cBjWwpG4dSNFjDyo30xn9IGS4/3g1x+SPxcu0JNIibz0JOV7PXiHoHG8hZKu?=
 =?us-ascii?Q?WDQJMtCCnwOULz2baGcEqaKfmgaBPS7zunXAIyh9TyxLahq4t+ZNlV2QFrSe?=
 =?us-ascii?Q?e9XbilP/1AJZKA87V9+L1gyOzzCaVLKAatNM3bHdM0N+bH1Hid7wTh23Fgtn?=
 =?us-ascii?Q?NH79hzesm9V3vwm/6/oxy5M44+ZNs4ZGhWGn1A9DzA8L/OHbLBrSGUR0FTCZ?=
 =?us-ascii?Q?wlGJxN/YD1KpTTcPEugmp1jjMReD19g4KNNAI/5aU0IDoID3Z9Pspy5dSV3/?=
 =?us-ascii?Q?EkbM7ovxxxEgzTSBAliNeBCOP698OT+gRZXjiK6fiunce7+kip9msSZiY3B5?=
 =?us-ascii?Q?YDuGq7gVq5u8nGN0EkhAYPpt3uIWlc8487QfjpoKBoyUWhfrDdTU3kqremCV?=
 =?us-ascii?Q?AYdlt1Xyro2at8VrBc6UDBRO4N1N87gAVix8QuB7RdBXvuUwwtY8SY+XZWHO?=
 =?us-ascii?Q?j5hLnOT7Z8qbajSvV3tGdT735DXq514XZeROUAL2PAgG0BRj0sQmNuKh2yje?=
 =?us-ascii?Q?qJ2TJg8pmdfz7qiNsQatLHBjPXJbWgZjLP+yQe+7nC07RiXd8rkNqG/xn0//?=
 =?us-ascii?Q?Pro+oPVkS2v3oDQ7P6ZObZyFXVEnTACgNynWUKQRqVkacTdCvqaSzThRCu2H?=
 =?us-ascii?Q?5QhRCRRq0eCQsAew7Px3FIZqZauAIn7yOCYpksQayxzq1kaI3f714OR2qNQQ?=
 =?us-ascii?Q?k6wO0+AP0BYLBlcIs9Tk82A2mcsJi8QIEZtiYswut9GlZuJq3M34w3C5MOj2?=
 =?us-ascii?Q?0K0gPDSZv9k1tQcRwPhCLPn3l1DYpvzx/oq8aTYIsr7VYy3VYGSAFbRNe5h7?=
 =?us-ascii?Q?ffmgAK3+DAVHKtIhZn2IGJutDH9lZ0BFtBG5IUIrNlroPmwv0SspYluqcmnO?=
 =?us-ascii?Q?XQTt4uhTz1gH4V2YHJVHCXW7XnQJbdyUjQB8zuxKZ6F7myWcpGs9wH7Xlwv8?=
 =?us-ascii?Q?ODX/5ygiliSaM1IDPxL0z+oKMOESP+G4ZVq+EKMW0Lcu3lfsYZoo7hUX/u12?=
 =?us-ascii?Q?nGNffWRz1OnDPZAlT6wUZGtgsKazT8/o2TeeBqehxRl7GdG+b7rHZh2esxX9?=
 =?us-ascii?Q?X2dH7ltfut/mMLrAHagHO7aCKpgRTTxupbHu1rKnu5cEdAHRazFYoHbbLXDU?=
 =?us-ascii?Q?M/u5CIuQIsiFMcjX0aK/zps8BGtjx9GrOvdeUUBW8M0J3F6+Uml3CfvBtzny?=
 =?us-ascii?Q?yQmyJaIcMUXKRZYNqXiqKFO4R1IkAJjSTvbfYgAp/Lz5eghybR0BvzA9/tyn?=
 =?us-ascii?Q?+OWEBacvIlzqS5mSDVhYhPRwZx2Tvj81f/R/+tN5LkEbMQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qUE19vvhxWRelszKOh4eNzI28NQfOnSFm+klkKpOfM3EfZicQZNNnM5KKLTD?=
 =?us-ascii?Q?jvxsq0tTszfiUbE04X34sXWTp4kxrdQGgc5pk57/b79ak3zdwvwoPiuI/R1R?=
 =?us-ascii?Q?iu5mIXbwpkhznEo5xDU7dFzpWHf2vHqPfdikKSNV/aZH+Xrl3otqpbHTUzmk?=
 =?us-ascii?Q?IanPdwO/M9r1Bj85x1PLYgzFzQI6rXW9MlAPT+YVvmgNYxk/gkE3kP9t/kDW?=
 =?us-ascii?Q?NALafr8pswT6efW6bpcjWuKtqY1eaTQRr8KSj/8GtBTHITI3N2e/khDvKudF?=
 =?us-ascii?Q?HiwU6KhQKjAIaiEzUKKKeg1mkZ0hu7YkdL+6PKoYmYx0sxmJvIZRFCnosLwU?=
 =?us-ascii?Q?MyzK4ZzYLVY2RAJE/iPp3amM3x8xI/OBOzxPusLYThVvCeTtDJX+zoZqviTi?=
 =?us-ascii?Q?Avkkts37BDAbhPbnAm6Z287sIrPUtCNmdthx2xMWYHiz87bApXZwyDQZUuht?=
 =?us-ascii?Q?Ne6LXsrngOxcjd1qWqzzXMc2Dt8vMsc8Oe8GGwkDYl13Oq/l5ojx34VYUgol?=
 =?us-ascii?Q?vfxH93rbK5sIw5IrsEjmhGAJSLBa7G/C/sO8EhKsgIic2ubdpp9Tab7rBVpr?=
 =?us-ascii?Q?d/Ho1ckYhb80FrsxTbYduKshb2GOtIfh0LOz+XTQ1KtsT6BR3fNrgE/ZCOgW?=
 =?us-ascii?Q?OjKJVsf+3CDAUxw1gLE60nyQe7y7N3YM89/IBMAP8AOiOZhDSclJN+Rq2fpN?=
 =?us-ascii?Q?3TI1ln/trGeJzZyLg2zcGN08JvILVwTkakDSEGHr0mv7YNIBRovWwQWEW7AH?=
 =?us-ascii?Q?8TePpnG9XRp3cqefiE6uSYbugpNOku7cwZ6fVYVdCQL7d6zD4YLKIQiAOgSl?=
 =?us-ascii?Q?ZubhVSkO4XQj88du5aejP6ipOiuX5q+eFUAfM9p/wt4/NUasdzrVmHUyUsXu?=
 =?us-ascii?Q?mgKUkagnht2PLIRY9OYWA1MYQon5Udcz/oABbrD0J8fcJOeC8Qvn1nBRURwJ?=
 =?us-ascii?Q?gCpzAS6fhqeWKVKAGvQ0CEE2venSS9ldG9lhdbIlUfgdtWMFkR/+mCO9nGCK?=
 =?us-ascii?Q?FNeOjwoKa1FDfpkcDHJFo2Gad6EOmC5vL2xUHsSSlNH4t+2k1Mt0Vc54p6Cu?=
 =?us-ascii?Q?g7VNjQQcVQawBZ368DWIwMc8tnKpkYCUF4IpUpNPGaZdENGjoD1uoMwixM7Z?=
 =?us-ascii?Q?SUh1zmqOEaNC6axFQbeBZ3zy+me+sawKHsGOji1xnkI19EZWdYbY7pw5HtGE?=
 =?us-ascii?Q?DJ4bIIT7G25uNT4JM3woWgRDhjYy3USov6DdwrD1EkdVThSlCanbV2WWqQqx?=
 =?us-ascii?Q?oc6Pghaz/T2AbbUPIAbDmJBpZ0rkpVH0xX9a1+/8PVBFgKTKsdBD0gRVhbpA?=
 =?us-ascii?Q?hlUr/5mWSQ60EsvV9mMk8JjgBc3GoVLBCnUUNILmAbb6QP6LTSRIaPT/NJNz?=
 =?us-ascii?Q?NGv8egofQE0rfMxVqOUqZgAuxIi7ekhouvnjrKU8LKC80qiJEe5xJeUmIgZI?=
 =?us-ascii?Q?Lt2ZJ/PAAAfuHs1j9l1aLLqjDAZCQRmrA0CAPu4KKMD7lbWJrVjTpvBVWdk3?=
 =?us-ascii?Q?3XH5aYPzsclJ0h7o1wtmZ8XlhpfBmuJob5DNZMIl/pSxMmG/7FyDLkDc/98e?=
 =?us-ascii?Q?lTKLKbFEYQBDZbnGhqDwXr6OME9Q1zIq4y+hnuidbgLp1xGLQbcyaqd8qvB6?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b61d4b3-5cb0-4a71-9a0b-08dcb1bd617b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 00:03:32.3089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cmz5wZ3GnaQspUm6opSEl+sUJTd9gXVuD2h0sraO3JFmvDdUTcleph/RP5Z/2arqmtAL3xGYAMROoTo/6HOX0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5880
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 31, 2024 at 04:22:03PM -0600, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew Brost
> Sent: Wednesday, July 31, 2024 2:32 PM
> To: intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: maarten.lankhorst@linux.intel.com; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: [PATCH v4 2/3] drm/printer: Allow NULL data in devcoredump printer
> > 
> > Useful to determine size of devcoreump before writing it out.
> > 
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> It seems this patch prevents us from copying strings into the data field if the data
> field hasn't been initialized.  I'm not certain if it could ever be uninitialized at this
> point, but I recognize it as good practice to check just in case regardless.
> 

That's not the intent. The intent to call the print functions with NULL
data so the printer can calculate the size of buffer required to print
out all the devcoredump data.

Matt

> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
> 
> > ---
> >  drivers/gpu/drm/drm_print.c | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> > index cf24dfdeb6b2..a1a4de9f9c44 100644
> > --- a/drivers/gpu/drm/drm_print.c
> > +++ b/drivers/gpu/drm/drm_print.c
> > @@ -100,8 +100,9 @@ void __drm_puts_coredump(struct drm_printer *p, const char *str)
> >  			copy = iterator->remain;
> >  
> >  		/* Copy out the bit of the string that we need */
> > -		memcpy(iterator->data,
> > -			str + (iterator->start - iterator->offset), copy);
> > +		if (iterator->data)
> > +			memcpy(iterator->data,
> > +				str + (iterator->start - iterator->offset), copy);
> >  
> >  		iterator->offset = iterator->start + copy;
> >  		iterator->remain -= copy;
> > @@ -110,7 +111,8 @@ void __drm_puts_coredump(struct drm_printer *p, const char *str)
> >  
> >  		len = min_t(ssize_t, strlen(str), iterator->remain);
> >  
> > -		memcpy(iterator->data + pos, str, len);
> > +		if (iterator->data)
> > +			memcpy(iterator->data + pos, str, len);
> >  
> >  		iterator->offset += len;
> >  		iterator->remain -= len;
> > @@ -140,8 +142,9 @@ void __drm_printfn_coredump(struct drm_printer *p, struct va_format *vaf)
> >  	if ((iterator->offset >= iterator->start) && (len < iterator->remain)) {
> >  		ssize_t pos = iterator->offset - iterator->start;
> >  
> > -		snprintf(((char *) iterator->data) + pos,
> > -			iterator->remain, "%pV", vaf);
> > +		if (iterator->data)
> > +			snprintf(((char *) iterator->data) + pos,
> > +				iterator->remain, "%pV", vaf);
> >  
> >  		iterator->offset += len;
> >  		iterator->remain -= len;
> > -- 
> > 2.34.1
> > 
> > 
