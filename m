Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A324CA314E4
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 20:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1EB10E15E;
	Tue, 11 Feb 2025 19:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ORqdIU3p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F95910E15E;
 Tue, 11 Feb 2025 19:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739301643; x=1770837643;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QGSUvw7+CRfqboiApf9nXEVeq9Zn39lsomEBauL+VGk=;
 b=ORqdIU3p/eDCT08tp58yplicCqfyAyY27kbyHkwY9JtOy2Dw1qw10qJA
 8zbhEnGgIxZcLiyhzEriEEW9BAbauXtI4tBxzQ0Siah2JATTgo28kDG9O
 pwq5zwy1awKDM0P0RYpyN1RjjDGKm2eBSknXTvxviEYp630J2XZ/mIw7y
 Jkk1xi7L6DMoLMKHgg26Y7Rbh1ZA76OwPHNO2WhMUByfbi36nD36bOBOP
 3h8JuIXmmDkeigl1jlfjdFa2+p641y7pztJ6s+drktGjJ4+u/C6wXKLNj
 gK2wkFq+Etp3qEezyCXcUutq8YQNHt1u57+1muGiBu4x1LMYV9yqlt5HE Q==;
X-CSE-ConnectionGUID: JHGVCB0YRnekr3HWuFovTg==
X-CSE-MsgGUID: 0CGCN+eVR8mikjow0Wucxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40058291"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40058291"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 11:20:43 -0800
X-CSE-ConnectionGUID: 4Ilo/hSHTseUhbVxzxPNYg==
X-CSE-MsgGUID: pQiqElnRQ42dfy1mP2H2GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="113245365"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 11:20:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 11:20:41 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 11:20:41 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 11:20:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P4qf3yokSi79aDsNg9SxKHYYb8oOEHy5BYffngDjQedtxFj2Ac2OMb7Zg/38K8SEGY5jf2gdzuFa5wn2ayy4v+iudJGKy82JA/J5pFVFPUPCw1MSuFH+GgRfUJu3Fzu35md98rSG4nr0Qp+M9PS8tlOFe6IBOCEaMlphjlwrkvWjLBnUH7RT8rz95kAhMnAphHrEv+Q6BthAETD5f70j7xP7FaU83TItXSiJORwHjPFbzb337BVOEBfCS40vx2gptICuKLqCyRQfChglgmxZearQzvTm+phPF0xDzrp0TNFwarTROvP83ZbKsTmUaiUyyWSFtdMSEHp7w0A9FL/sGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6Qp+pcro1mI47Sp0XeosUjgIMezJu4IDvjo4hfg4cs=;
 b=J7tepAE7iBF1BdnVozJPNkW4Apnd3j9LuuffcY0q28gPc4JJ5/v+3K5LX4/CtY5FammfTObCzfTXtqSRbgVZ9RDLe7VWywg1a7UB5JT9hmRFSu37x1MXupiwv4uar0a+0C9/ZND+12uw0C6gwJGs3kz5rH4BdKM7taIGm+yD+Se/WYdBdil/SLekT6ummkhyGnoEeEIOyuUXgCk9pFg1Hgl3B6DSbsrAU/E1+/LJbLQt/Sr59ulY6WD+F7JKOhyF6bnSiBuWLnG9bO90vR0ozXrcIPEc36BNkDpc4tOU8ewlpkh1AWCZB/rZgQfeNknlm5t+PIa3B+7Ei1Gb1NhcSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB5217.namprd11.prod.outlook.com (2603:10b6:610:e0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 19:20:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 19:20:39 +0000
Date: Tue, 11 Feb 2025 11:21:39 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v4 29/33] drm/xe: Basic SVM BO eviction
Message-ID: <Z6ujQ0G6Wj4QQezs@lstrano-desk.jf.intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-30-matthew.brost@intel.com>
 <ec4bcb3b178a3de6e605216e588e2eba9cc3217a.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec4bcb3b178a3de6e605216e588e2eba9cc3217a.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0183.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB5217:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f8d4541-8375-4144-a20a-08dd4ad12b44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?31N7zxX1B4k2qTbB0GC1rY9hBSim2Y6x4YpzVNrdIt6VPlokCIZV7GVa72?=
 =?iso-8859-1?Q?7ltW9P4K95R61myJqnPeAxQDjZIYS6iil742LWlatqds9wLHJJURWFW3IL?=
 =?iso-8859-1?Q?+0iRFBNZaKU1aEu4T4+t6+lkysP8EBN4D9t6xvVEuf9AII55T29PiiJlsc?=
 =?iso-8859-1?Q?a4fyjN0CzAX9WE8w8oCQURWR1m5RnJQK9CCmOWVLAjQPstT/ApWFZ8LzBh?=
 =?iso-8859-1?Q?gyzW4L1wgfjf5hTHwIClamOBMnMziniIvhso/fNs/Buns1FVe2KgZEKfvB?=
 =?iso-8859-1?Q?vNE+SnHiuLyq40FWcOqTDLAXIx+1uWINSwyp2gOctrGisRWTo6zmWuAvXw?=
 =?iso-8859-1?Q?JSDM/Dud4DvXxNtasVPpVu8prYa7Ag/edgTGYHOzS+xoQo7jHtuU/x4Bmc?=
 =?iso-8859-1?Q?UuKisvIMpmByvoRH8UfyqxeO2ZqQuqMy1m7FkkJoJ+2n8BdhvftUTIijV0?=
 =?iso-8859-1?Q?JCCgD/Cg73SxTIub4QX3H1i74Wo29oJIjWp/mbVrjx1JYm7GYWQDM5UAya?=
 =?iso-8859-1?Q?bAffhqYTPtd4tvQ/rDvwHEpcSdPT1MA+ySSxOpbr3jotWgvZ3SY9gKmnLi?=
 =?iso-8859-1?Q?JIDXoN2MFHy+JDNXMXmgSdBh/yo8/UFvppNcGve7UulbXWD43Z6x0a9QOi?=
 =?iso-8859-1?Q?9FrhqH+koLLDvKL3uOo6CFTnTlr3cQhuSxUlOqLmgXvC6dN4dPRCDWkM+y?=
 =?iso-8859-1?Q?OlOL6faRccanTgklAFi5kwdzzd2OLIA2USPA3ReDQtuJunvKsHz7aqFLEU?=
 =?iso-8859-1?Q?2eQocoqKZ8Gmtc6nl5pUaFFN6XeBUv4NZ52PWSYp7EBv6N6+A6n3HVFHzd?=
 =?iso-8859-1?Q?TmWnGZ/ct3WyWtfCyWzxquyBNS1+PrBOags8K1vjYEW9MkPi/Tzkd5BIWo?=
 =?iso-8859-1?Q?5Bd0bFTL36Jwnrot0QiAXNUP3izQkKn5IgogtTuSj8PjwcBhuCooMQZvXR?=
 =?iso-8859-1?Q?/72wCzZp86MP7+Pxqt0kQBdMjNf6y6nu1DzX87mic+Op+6/1GW53OMzbsH?=
 =?iso-8859-1?Q?bXiHrXHE/XZuKi96kNSFef2waSNOya2Y/sJPS0qGozxFPxHGP+UVyBWL1C?=
 =?iso-8859-1?Q?cm6LHUdTTky2k1u38jsgduo5FTSKMs1e03j/3azv2Lu4QNu1wDJBhdNQ3g?=
 =?iso-8859-1?Q?sugGyR0kYFFgJiwIkdr2SKamycv6wNgJX1kFTUBM8uj1fKZdadOUc/z/Q1?=
 =?iso-8859-1?Q?L7CjN1zRHZRewmOUPRTa4WbKO+Np/F5x+GpAMHvSHnn8av1lgKpE99VRme?=
 =?iso-8859-1?Q?1psAYCe0uTpjYn0GTk9MG059uaGKcejK0+GS/1SuLEur4W6RkqEj2vTCxA?=
 =?iso-8859-1?Q?6IU2Xkg90cdT04Sy4DGR7UC8Hm4xI5RnYX/i1//3PaMfqEfX7MucbQA8Yt?=
 =?iso-8859-1?Q?1m+yFE/6FiguhUwssiqcycwr/hoYsioGZ7kWU8VWTR8qiNSaS99wqoBygH?=
 =?iso-8859-1?Q?5kPt8NuN26dC1wf7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VWbLR31bxL3KEtoxD1shR1ylBlhXtVaXrIEhac4kvQlO6CiOoHbaOwquXj?=
 =?iso-8859-1?Q?5fk1VuCgnun9PWyqZ9IsdvFEvHBPj4DQg/+FVlWpyyqbnnHE8i+1EYktKa?=
 =?iso-8859-1?Q?AwrC5lw+7G2PagKbLLOOSlc1ALFzGK0MvTCTRuY5EfD2BofbJNG6tZW2Bn?=
 =?iso-8859-1?Q?qhKXy23UzFW7zhhrF2J6WPQyP6EQEhEtlf+KIW7y1F+EevBnAQuQZm/4wL?=
 =?iso-8859-1?Q?ZXn7miTJwyEV+vXZo59a6bthCinOHexzaoP4PW+rU0rHktZwBwL4XATzTU?=
 =?iso-8859-1?Q?iO1qW92byvwb8bFW7GAuI9ifdKDHFa5hEw0ZQrB9XiHdiqnAHSm1I9DMpq?=
 =?iso-8859-1?Q?jqx+lIj4hGGdmXzsIwH0CMjbZ6NIe22G/9T9CZHVqdN9D5fARgvXTljcMb?=
 =?iso-8859-1?Q?VATv2Mh5G95cRhqyC7zuv/NDL1WTe1jZhaDUa+7wyVZOugD4pnGAY1c2df?=
 =?iso-8859-1?Q?eI06IlBTiWg+0ydXYCmNQTeO2U2Agpa15qZ+jJzfAYsoKipGZAZSlRihZ7?=
 =?iso-8859-1?Q?y/f/J/7r113//N6/Vov2Ffh2qbAsBHWWYRncbK1fiMdjJYOsekmLow0o7w?=
 =?iso-8859-1?Q?Hk7ght6+hej6AWZmkt+NpscnegIy+BSG3xLu7m/486rbIRot9b3/xqLQp0?=
 =?iso-8859-1?Q?m7EYm3bXM0IZABFuqpjU0MElnESvYCIBDGJmAjpfKdI1K5t5BkG+2aErFw?=
 =?iso-8859-1?Q?iDnHA89pzVKWLrCoL8PV1G2o5G7Nxez/Q1ljeqbSUyPYI5FRaid7sLdKsA?=
 =?iso-8859-1?Q?//hJjwe0DY0L0oE78mrGq36uOrc4qThCtbzI4lgCRmg9hY0PQqSx7Du/bX?=
 =?iso-8859-1?Q?R5VRWgx2zmE5jwyPa+86WZ06n0VRtBl9rmy9N4kB+PejI/9Vb62a5MzJCu?=
 =?iso-8859-1?Q?gqHramq9JiOKqt/3Esh0drId+MH3bSzqWX0xiqPOLxj3xe24HmZ8quALxE?=
 =?iso-8859-1?Q?i2zIzCT0unGmQngpgrsMlltUUcDi3ka/uun2l4kq/bdT/fd/jd0DgqOfyx?=
 =?iso-8859-1?Q?7HvIkoFkMiVEi9WGSNiVRwfgShSAOD3XM5DQpnu1minn+ZWhpIblyz2QUv?=
 =?iso-8859-1?Q?35X7Enq7CyTtfoKWyrPaEMncCifmEI6Y6mkCRFQmLpmhqhGUeuSkigX3ak?=
 =?iso-8859-1?Q?kuDuXaVp1Z5xO8KylwMw4I9MhHKjLmMJKYduRwpEeQ0Ats7SmEw+NYb+4Z?=
 =?iso-8859-1?Q?gSPChvZslfLGcgexn72XFE+LlRSgU4yo94aHoXE2F3s1kah2ke8c78nLWW?=
 =?iso-8859-1?Q?uhfDSMvsZ9VCvxpW8KcNorwSvjMueGfbs9sxCjt7RXl+fNW1DwUbZ7hTSS?=
 =?iso-8859-1?Q?6amOMZnQlFTnqOr8vVeq9cPhFLCj8mu3q2T1oIfCtt7qP+0knTeEA1epUV?=
 =?iso-8859-1?Q?4KyZFVAXo9Qs6spl4TflhNIMaxJSpnVymBHSpEUXcTszY9EhR7X1JAZERf?=
 =?iso-8859-1?Q?MN7G4wtHINo+z4DyPMBj20ZMWoQtK3yWj5W0Ys7gYzx3YKkKytF+Z+8zW3?=
 =?iso-8859-1?Q?0kCaFCH5fhu665RNDvygfeHQ4IjdLaZ6rtQmA/6AvSIDoKUiztfWG7oJFz?=
 =?iso-8859-1?Q?JabXO2tXVAG0nCnCu2XmW/NAy48rd6J7Nvsiy+PXkPqVm0wrJYf6pq+K9D?=
 =?iso-8859-1?Q?o8yt9jt9FybhwZszbPpgYG22RGb/vlrSLQdQ93jyxkM62yQzAv5qNc/g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f8d4541-8375-4144-a20a-08dd4ad12b44
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 19:20:39.2985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LIJjjX78ZVYm5OhKlCaqbmAD3pwxuUCJsCYPiHglsIZ/57J90vL4Nrwt794EpPXYzI6pB0CnsRU+R3Mnm14x8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5217
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

On Fri, Feb 07, 2025 at 03:45:51PM +0100, Thomas Hellström wrote:
> On Wed, 2025-01-29 at 11:52 -0800, Matthew Brost wrote:
> > Wire xe_bo_move to GPU SVM migration via new helper xe_svm_bo_evict.
> > 
> > v2:
> >  - Use xe_svm_bo_evict
> >  - Drop bo->range
> > v3:
> >  - Kernel doc (Thomas)
> > v4:
> >  - Add missing xe_bo.c code
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> I think in the long run, we'd want to do the svm eviction / unbind in
> move_notify(), since that's where we're supposed to unbind other
> subsystems. And then just purge the bo using a NULL placement, but
> since this is equivalent let's postpone that to a more general
> xe_bo_move() cleanup. It's getting pretty hard to follow.
> 

Agree xe_bo_move() could use some cleanup.

Matt

> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> 
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c  | 19 +++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_svm.c | 15 ++++++++++++++-
> >  drivers/gpu/drm/xe/xe_svm.h |  3 +++
> >  3 files changed, 36 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 20c96709e267..657687ee70d0 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -255,6 +255,8 @@ int xe_bo_placement_for_flags(struct xe_device
> > *xe, struct xe_bo *bo,
> >  static void xe_evict_flags(struct ttm_buffer_object *tbo,
> >  			   struct ttm_placement *placement)
> >  {
> > +	struct xe_bo *bo;
> > +
> >  	if (!xe_bo_is_xe_bo(tbo)) {
> >  		/* Don't handle scatter gather BOs */
> >  		if (tbo->type == ttm_bo_type_sg) {
> > @@ -266,6 +268,12 @@ static void xe_evict_flags(struct
> > ttm_buffer_object *tbo,
> >  		return;
> >  	}
> >  
> > +	bo = ttm_to_xe_bo(tbo);
> > +	if (bo->flags & XE_BO_FLAG_CPU_ADDR_MIRROR) {
> > +		*placement = sys_placement;
> > +		return;
> > +	}
> > +
> >  	/*
> >  	 * For xe, sg bos that are evicted to system just triggers a
> >  	 * rebind of the sg list upon subsequent validation to
> > XE_PL_TT.
> > @@ -710,6 +718,17 @@ static int xe_bo_move(struct ttm_buffer_object
> > *ttm_bo, bool evict,
> >  		goto out;
> >  	}
> >  
> > +	if (!move_lacks_source && (bo->flags &
> > XE_BO_FLAG_CPU_ADDR_MIRROR) &&
> > +	    new_mem->mem_type == XE_PL_SYSTEM) {
> > +		ret = xe_svm_bo_evict(bo);
> > +		if (!ret) {
> > +			drm_dbg(&xe->drm, "Evict system allocator BO
> > success\n");
> > +			ttm_bo_move_null(ttm_bo, new_mem);
> > +		}
> > +
> > +		goto out;
> > +	}
> > +
> >  	if (old_mem_type == XE_PL_SYSTEM && new_mem->mem_type ==
> > XE_PL_TT && !handle_system_ccs) {
> >  		ttm_bo_move_null(ttm_bo, new_mem);
> >  		goto out;
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index fc030855d078..dafc5061eb42 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -768,6 +768,20 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64
> > start, u64 end)
> >  	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
> >  }
> >  
> > +/**
> > + * xe_svm_bo_evict() - SVM evict BO to system memory
> > + * @bo: BO to evict
> > + *
> > + * SVM evict BO to system memory. GPU SVM layer ensures all device
> > pages
> > + * are evicted before returning.
> > + *
> > + * Return: 0 on success standard error code otherwise
> > + */
> > +int xe_svm_bo_evict(struct xe_bo *bo)
> > +{
> > +	return drm_gpusvm_evict_to_ram(&bo->devmem_allocation);
> > +}
> > +
> >  #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> >  static struct drm_pagemap_dma_addr
> >  xe_drm_pagemap_map_dma(struct drm_pagemap *dpagemap,
> > @@ -795,7 +809,6 @@ static const struct drm_pagemap_ops
> > xe_drm_pagemap_ops = {
> >  	.map_dma = xe_drm_pagemap_map_dma,
> >  };
> >  
> > ->>>>>>> 133db8ade5f0 (drm/xe: Add drm_pagemap ops to SVM)
> >  /**
> >   * xe_devm_add: Remap and provide memmap backing for device memory
> >   * @tile: tile that the memory region belongs to
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > b/drivers/gpu/drm/xe/xe_svm.h
> > index 4c2576162c39..77dec5aae0ee 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -11,6 +11,7 @@
> >  
> >  #define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
> >  
> > +struct xe_bo;
> >  struct xe_mem_region;
> >  struct xe_tile;
> >  struct xe_vm;
> > @@ -56,6 +57,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  
> >  bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
> >  
> > +int xe_svm_bo_evict(struct xe_bo *bo);
> > +
> >  static inline bool xe_svm_range_pages_valid(struct xe_svm_range
> > *range)
> >  {
> >  	return drm_gpusvm_range_pages_valid(range->base.gpusvm,
> > &range->base);
> 
