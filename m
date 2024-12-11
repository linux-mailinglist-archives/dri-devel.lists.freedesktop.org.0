Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1255B9ED642
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 20:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27CD10E40B;
	Wed, 11 Dec 2024 19:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f9YNB4dF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE7CC10E40B;
 Wed, 11 Dec 2024 19:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733944631; x=1765480631;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=t/kdXbtdW3lL1ZKAVn4OMRExKpxVNjmMBPbV2bnLF84=;
 b=f9YNB4dFrXn+BH5HMksD0Z6b3hzPNTjLXiPZsQDOC+l80tYAn8TsjlFw
 hqh9Jpi4sPcNRBMRRXxVJPEc+OrOYuK/x9O74fKSObtzghZ5ZpU0TQX95
 jxpYH+OTzk/tmYvYkqVmHrlw9SxqBDZI3lhCrpSt8Iqh7UEE0yhZ2v5SK
 WlYT/ir7HqqsqaTI3U1skRFbsoX5j0JRBFNOqr/bLHN8cUYgvchiAo/dK
 qbMxdOTxvBYu2fX3purDKXXGrKYsm7l+ZPDWxHxZBnh+4hwhCVoRx3soj
 SzwRYzJpBKlsQAtFEe7O5d1H9UOwMn5sNOjOiiqohzFjFB1gi/cBoEDxJ Q==;
X-CSE-ConnectionGUID: nMwSsoIUSYK/lYxoRDIpYQ==
X-CSE-MsgGUID: uDluatDSSPOKQTjuloQhhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34215074"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="34215074"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 11:17:11 -0800
X-CSE-ConnectionGUID: 2cznH+8+Rq6xsvgfrxyZag==
X-CSE-MsgGUID: wpMSCQ0nScG1X6lzr3YD4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="96120945"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 11:17:10 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 11:17:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 11:17:10 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 11:17:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K0IFZ/pkXwKV6q4VBUudrzkFOnWg/csRWRdbXCUCTek1Qkq8NrSw5RqSZj1I9VbF69RwkhYWYICFChGmdfWh70f8X6uy0wVO1kLYnIDos7WU+kk+WHJ/ej5U6XWD6MOBY6+vBF63El+Rcq06bA4R3JZTaWP95BOq7vEo09o/YrtYcPAurs0A7TmCRGAX4XbbzlPc9UUJ6v9/qGIm4PYfpiIfl68e+zBhqQge5wriTbkpytJIemoPhKxNq85F+ai1VPKShL7RMTTEhQENfhPojnMNjK+z+ujxVGnq0vuIvDC4huNhwlq7IC3JJMpP80Q9mU75sraU+d7TBeELW6I2eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnFMIE4rqiCxzkqh09vbAfJ9GgNJe3OgjyEqSJw5sf0=;
 b=gXOq9Ex2qAPjNOrZimjYf9gRWobtsbUwNmILLe60ecyLkJIY4q6BgW4eHZ0kRpiUgZCUwF8ssBWLo5p4VjOH+AWTZt2ewtca4YXG48DIVU4M3f2a0uefvMlsNk0zOSmdTesZQYW780p/1Uah9t/P/kxQVO5rMImG+SyvB1nkSJbYhtDxCoV47rEy6Uz19YnsYTyvzQrsDafT/5fpCllWA0kVC19ybVJE4lpjJcju+fEPoIW0IPq0v+kDb3FGPVU0N6xxxVviGsdScAlvOeYh5kt3Dqu8bfA4ubIcv5MpmCEPzmkJ3c5Q9+/VRlJZdny6R1U9X1T1bv7YJN48s29OYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV2PR11MB6000.namprd11.prod.outlook.com (2603:10b6:408:17c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 19:17:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 19:17:02 +0000
Date: Wed, 11 Dec 2024 11:17:44 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 12/29] drm/xe: Add SVM garbage collector
Message-ID: <Z1nlWBOgEOMuKbN2@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-13-matthew.brost@intel.com>
 <747e7befa275ac0fcc95dc4e7e7aca27020e8dda.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <747e7befa275ac0fcc95dc4e7e7aca27020e8dda.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0184.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV2PR11MB6000:EE_
X-MS-Office365-Filtering-Correlation-Id: 584f9093-dc69-4353-46d6-08dd1a18649a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?0cuk4mMiyM7fsezdHOtxSt/eOPuhrgeXqXnL89tQ84ApKSYYELEY/G2FZi?=
 =?iso-8859-1?Q?e3AJIY7Pq2yD+D9UOpLO255AhseCbBzUz6kkZhxT78RnVVTMxSPfBfNSrU?=
 =?iso-8859-1?Q?oWGgTp980OxQykDpklwehVLigVxjYioCZMd9jnMLnJbueaqKOLWAMK8x+n?=
 =?iso-8859-1?Q?pLbhhtQdAxgB/c2n5MZ2ti1u5dZByCGXeqXpdiBK22KJW86mC3Yyw6PY07?=
 =?iso-8859-1?Q?SmHeUmxPZBpmad0d5IDBvT3F60/oLGzCflOL36SZcx7CU2kpf2/hCitCPo?=
 =?iso-8859-1?Q?5LXu8GFP7XQjAWbdbTO5eWjI+6paM7fh1G1mD12X2ccK+Zp1RDhRmk6Gze?=
 =?iso-8859-1?Q?JVWPIwc7qexufGRQFygmz3iwtYKYjGOlVWRotAdv1xrDFGb2iNUS9COPRA?=
 =?iso-8859-1?Q?qxCyPCJ83TEy28UUP45A+k4WHMe8mDdxS1pR+/uKKfA8gF2scz92Wuq1/q?=
 =?iso-8859-1?Q?vB6M8ROVtQtn8wRIkPf24EuX6BzJLmo34Ft/pOTfUXXAoul82765eAqKmd?=
 =?iso-8859-1?Q?+3l/2CXTJVp6QpciO0xXjbDYX/We/x/cNmq5RhmW8NbKu+dhi0SF8EzD21?=
 =?iso-8859-1?Q?iAZTtgoyrlXb+I88uuN3Ze0q1SGgqeZTKwBB9DeOzrqEVlTUREi7OFTGj8?=
 =?iso-8859-1?Q?NKlJwYmrI78A3GAJrqGeHo+MaReyIggxdxKNAOdv4x7RDc7WYhwKuGRE5S?=
 =?iso-8859-1?Q?WdtELO0V8yOqtScUcGav+Vm1ulZ7mZSrrTW9SaPftyoBqLlH7yPJBwCPZB?=
 =?iso-8859-1?Q?D2WQAr+qR8RTSeAUyxu3ivzLrmPRctirQRAwqyrDJuDAQv7QX8Rn33Uc0P?=
 =?iso-8859-1?Q?nsRSSzXd+m2n+uWZn66AtuQfB08kb8Xs+IH+67Bo1kiMhQstmrfZcHuiCd?=
 =?iso-8859-1?Q?2RxN3U4uN0poG3fzcotekFAWbZ7LKiitkcd+tVHw2WdOnn431uwuu/zOV+?=
 =?iso-8859-1?Q?6phCDKsXaEmmQybhr6cnAAwBeYNRB3NaN4OAY0lF8F6dEUwT9/Ep6DF/Sa?=
 =?iso-8859-1?Q?ZZ6NY6eK6IN7mstXjeWZAo8I1VuBKJVIAZlF34OZCDM+2e7kY8yMUO6vwP?=
 =?iso-8859-1?Q?7uNjLWjq3YHisr9ZTEMH7jesRWyciAhy1KPvmqFfvfEAKyr5m4MM1kVYXS?=
 =?iso-8859-1?Q?eq4I1wtpcDj+MKUZz3qid4Zec1L/Uw2ecvmA/zoVib0DDvz+gqQlsOuVi3?=
 =?iso-8859-1?Q?XJ4ANyorxo0EvQbwkj2wzu1FLQQSwpY3W5NWpHmhgrgRRzUO4Hc6Pkew6G?=
 =?iso-8859-1?Q?SHGJZxLKoZ2WVUAtCkBqQ1YalP9Qp7SwJIOVks9+0VP/x/bsF9uFoRbcHK?=
 =?iso-8859-1?Q?tzI378J5ExDuvww7FanYlEVLICCQfE5MQkGx0B8lSyyED2fYrx+jLejLvo?=
 =?iso-8859-1?Q?l9lzQ2PAljBROPuE5oXUbGrHyXnwMzhQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Uzj5D4Z/y27bOJK8nbxASOcL5as11UD9JwUFG2pxcoYU5Z+evn6njwJ2OO?=
 =?iso-8859-1?Q?JmGkGp09zx+oHfKHwiAmHzBK+O/dC6GfghrAryT8B5whNVfERAqrOImi+a?=
 =?iso-8859-1?Q?KxuGwx0h9riY7GxzXLoN6Pbpqw59rY3rn5ndt6/qbKjp13Anc7ZIKsRscX?=
 =?iso-8859-1?Q?w0JDy9z3iVV3CB7ggWsXWQvCv0cmcC4ZcAoAqwAdLQ8n3zSsb+5myIBHth?=
 =?iso-8859-1?Q?5VevFJWTDX0SnQQZNsRbiJLymHq9FjiqLbXW7LeG9TWaP7xmAi1VQ7cbvo?=
 =?iso-8859-1?Q?LWB5efqGaOc6dzgGts/KfsGdk6Hgzb6E9sywdYigrRCoWVSjwd0N7ioftE?=
 =?iso-8859-1?Q?xKrxog18uuYL1VstP5T/5dhTrr+XtLN/5wYqAJylRJzjDlpo5DEcVq0Pcn?=
 =?iso-8859-1?Q?UXiCZK8VvECahscncyZDTbT4izCUT9s6AHrFCvMHa7/fCMKfTor4+0OTid?=
 =?iso-8859-1?Q?lHgsRcnVJhkO9lBuGBntaVNaYVQjPFRskZlYsXWHQy1cxmggSj4VyZqK//?=
 =?iso-8859-1?Q?1UwWtn7AN8SeOrPPiY4FQB/oC1WVjj69LajEIljPgbYxGwin2agUov8qgd?=
 =?iso-8859-1?Q?DcQvt7Ohq+BqfHdp+rfoV3Jacelse6TtE1j5YOFwiqmyH7PXv4mEdrdKOF?=
 =?iso-8859-1?Q?7bf9hMb0Qyz9i54oC0cFW5JXjaG7YKmqEywOR5Yzsfnor5YmSrLaLzQXho?=
 =?iso-8859-1?Q?b05cL/ChQzCzh+DKyTzr6pRYndXzag4m7bXRYfvUfKXZS55WDX0fVMCqBb?=
 =?iso-8859-1?Q?FsxEiZivfN1FsAxiSvvB00o7JjZ3qZrkOZ/iSPY9kn18aI7LaYs5Ju5XGr?=
 =?iso-8859-1?Q?AuqG3DBIaw+Xh8IHA85e14L6UzfrIhbVoxcIHxqMBul9hrphwrC6BXoKvd?=
 =?iso-8859-1?Q?Zx0grtYyAbf7taaW+0+Y9s854gEDf2CgkQqoqpaWau2fNgolC7ahPUrNLr?=
 =?iso-8859-1?Q?4mSu8lbI1IHHkSHo1rzerb9DcrqSQWdhBIf/fyjmPs8tdDEjSeimdWQQLH?=
 =?iso-8859-1?Q?dSuG+cwlbhrXA+WZACn62qtsbZOM3+IBVqc8Kp0hOniNle6VUv6KJCKiT4?=
 =?iso-8859-1?Q?n/mnD24WN3141EAttyz7K8rM717A9Cdt6Fc0NpqZPBSy5C+yETPOmRPFBr?=
 =?iso-8859-1?Q?16g/ltv7iMXdVXSEkkYL4NXucdM4N42yg6twZabnsYS+QdIVVcU2JEp93X?=
 =?iso-8859-1?Q?8CxrUkBukYIQZDrqJQIThkv5bs68UGsubeg42AKL4yJVQyiKeyJCJ27w6/?=
 =?iso-8859-1?Q?6in/DwROUfEHyxhyJWjn6rXSY1vE0RDYvZKbjotncCjzUikKgvKmVmO4eR?=
 =?iso-8859-1?Q?Ks8zTbnIzLrc4hW3mgHrevuHdELD0KpPXZTn+/eZBl2GmiJ/jZ/6kui4AA?=
 =?iso-8859-1?Q?jsSQl46b2oJiR0UtrkumG54JoAYNNBoPGTs05gZM/oXFHGeSl35ZrvxgJJ?=
 =?iso-8859-1?Q?8DIGE5RwdzKcx9jBNcpviwznXutx2yjVWsa7PzRN563utXcbx89w1/6nL6?=
 =?iso-8859-1?Q?xiGUmuTisIUras1Nh4cSd5pDlSSBN98YRiyTpDt/ojgbR0BlZw/Gn8rwuU?=
 =?iso-8859-1?Q?dmEp7NqnltiLijXGxLBH8Q44sbolZQt9dDsQMPc7tZZP174kPEzc0D4cXV?=
 =?iso-8859-1?Q?ev8W8KPfrzNn4bIrvuQK+zGSOcudopstSPTMe9Rdq/IZU9vEuZvzhpcA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 584f9093-dc69-4353-46d6-08dd1a18649a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 19:17:02.7761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bEMc54UcWHHYNv3TyRQHhA9nq6pjmYxo306x54c9YcokHADSjahy8In3tiqwBe/EB4+gtxM8pNzvkr5c+y4BBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6000
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

On Tue, Nov 19, 2024 at 03:45:33PM +0100, Thomas Hellström wrote:
> On Tue, 2024-10-15 at 20:25 -0700, Matthew Brost wrote:
> > Add basic SVM garbage collector which can destroy an SVM range upon
> > an
> > MMU UNMAP event.
> > 
> > v2:
> >  - Flush garbage collector in xe_svm_close
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_svm.c      | 87
> > +++++++++++++++++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_svm.h      |  1 +
> >  drivers/gpu/drm/xe/xe_vm.c       |  4 ++
> >  drivers/gpu/drm/xe/xe_vm_types.h |  5 ++
> >  4 files changed, 95 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index a9addaea316d..9c2f44cba166 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -30,6 +30,7 @@ xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
> >  	if (!range)
> >  		return ERR_PTR(-ENOMEM);
> >  
> > +	INIT_LIST_HEAD(&range->garbage_collector_link);
> >  	xe_vm_get(gpusvm_to_vm(gpusvm));
> >  
> >  	return &range->base;
> > @@ -46,6 +47,24 @@ static struct xe_svm_range *to_xe_range(struct
> > drm_gpusvm_range *r)
> >  	return container_of(r, struct xe_svm_range, base);
> >  }
> >  
> > +static void
> > +xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct
> > xe_svm_range *range,
> > +				   const struct mmu_notifier_range
> > *mmu_range)
> > +{
> > +	struct xe_device *xe = vm->xe;
> > +
> > +	drm_gpusvm_range_set_unmapped(&range->base, mmu_range);
> > +
> > +	spin_lock(&vm->svm.garbage_collector.lock);
> > +	if (list_empty(&range->garbage_collector_link))
> > +		list_add_tail(&range->garbage_collector_link,
> > +			      &vm-
> > >svm.garbage_collector.range_list);
> > +	spin_unlock(&vm->svm.garbage_collector.lock);
> > +
> > +	queue_work(xe_device_get_root_tile(xe)->primary_gt-
> > >usm.pf_wq,
> > +		   &vm->svm.garbage_collector.work);
> > +}
> > +
> >  static u8
> >  xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct
> > drm_gpusvm_range *r,
> >  				  const struct mmu_notifier_range
> > *mmu_range,
> > @@ -88,7 +107,9 @@ xe_svm_range_notifier_event_end(struct xe_vm *vm,
> > struct drm_gpusvm_range *r,
> >  	struct drm_gpusvm_ctx ctx = { .in_notifier = true, };
> >  
> >  	drm_gpusvm_range_unmap_pages(&vm->svm.gpusvm, r, &ctx);
> > -	/* TODO: Add range to garbage collector */
> > +	if (mmu_range->event == MMU_NOTIFY_UNMAP)
> > +		xe_svm_garbage_collector_add_range(vm,
> > to_xe_range(r),
> > +						   mmu_range);
> >  }
> >  
> >  static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
> > @@ -184,6 +205,58 @@ static void xe_svm_invalidate(struct drm_gpusvm
> > *gpusvm,
> >  		xe_svm_range_notifier_event_end(vm, r, mmu_range);
> >  }
> >  
> > +static int __xe_svm_garbage_collector(struct xe_vm *vm,
> > +				      struct xe_svm_range *range)
> > +{
> > +	/* TODO: Do unbind */
> > +
> > +	drm_gpusvm_range_remove(&vm->svm.gpusvm, &range->base);
> > +
> > +	return 0;
> > +}
> > +
> > +static int xe_svm_garbage_collector(struct xe_vm *vm)
> > +{
> > +	struct xe_svm_range *range, *next;
> > +	int err;
> > +
> > +	lockdep_assert_held_write(&vm->lock);
> > +
> > +	if (xe_vm_is_closed_or_banned(vm))
> > +		return -ENOENT;
> > +
> > +	spin_lock(&vm->svm.garbage_collector.lock);
> > +	list_for_each_entry_safe(range, next,
> > +				 &vm-
> > >svm.garbage_collector.range_list,
> > +				 garbage_collector_link) {
> > +		list_del(&range->garbage_collector_link);
> > +		spin_unlock(&vm->svm.garbage_collector.lock);
> 
> This looks broken, what if someone removed the "next" entry here?
> You probably want to use list_next_entry_or_null();
> 

Yea, let me fix this loop structure.

> > +
> > +		err = __xe_svm_garbage_collector(vm, range);
> > +		if (err) {
> > +			drm_warn(&vm->xe->drm,
> > +				 "Garbage collection failed: %d\n",
> > err);
> > +			xe_vm_kill(vm, true);
> > +			return err;
> > +		}
> > +
> > +		spin_lock(&vm->svm.garbage_collector.lock);
> > +	}
> > +	spin_unlock(&vm->svm.garbage_collector.lock);
> > +
> > +	return 0;
> > +}
> > +
> > +static void xe_svm_garbage_collector_work_func(struct work_struct
> > *w)
> > +{
> > +	struct xe_vm *vm = container_of(w, struct xe_vm,
> > +					svm.garbage_collector.work);
> > +
> > +	down_write(&vm->lock);
> > +	xe_svm_garbage_collector(vm);
> > +	up_write(&vm->lock);
> > +}
> > +
> >  static const struct drm_gpusvm_ops gpusvm_ops = {
> >  	.range_alloc = xe_svm_range_alloc,
> >  	.range_free = xe_svm_range_free,
> > @@ -198,6 +271,11 @@ static const u64 fault_chunk_sizes[] = {
> >  
> >  int xe_svm_init(struct xe_vm *vm)
> >  {
> > +	spin_lock_init(&vm->svm.garbage_collector.lock);
> > +	INIT_LIST_HEAD(&vm->svm.garbage_collector.range_list);
> > +	INIT_WORK(&vm->svm.garbage_collector.work,
> > +		  xe_svm_garbage_collector_work_func);
> > +
> >  	return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe-
> > >drm,
> >  			       current->mm, NULL, 0, vm->size,
> >  			       SZ_512M, &gpusvm_ops,
> > fault_chunk_sizes,
> > @@ -211,6 +289,8 @@ void xe_svm_close(struct xe_vm *vm)
> >  	/* Flush running notifiers making xe_vm_close() visable */
> >  	xe_svm_notifier_lock(vm);
> >  	xe_svm_notifier_unlock(vm);
> > +
> > +	flush_work(&vm->svm.garbage_collector.work);
> >  }
> >  
> >  void xe_svm_fini(struct xe_vm *vm)
> > @@ -241,7 +321,10 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  	lockdep_assert_held_write(&vm->lock);
> >  
> >  retry:
> > -	/* TODO: Run garbage collector */
> > +	/* Always process UNMAPs first so view SVM ranges is current
> > */
> > +	err = xe_svm_garbage_collector(vm);
> > +	if (err)
> > +		return err;
> >  
> >  	r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm,
> > fault_addr,
> >  					    xe_vma_start(vma),
> > xe_vma_end(vma),
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > b/drivers/gpu/drm/xe/xe_svm.h
> > index ee0bd1ae655b..06d90d0f71a6 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -17,6 +17,7 @@ struct xe_vma;
> >  
> >  struct xe_svm_range {
> >  	struct drm_gpusvm_range base;
> > +	struct list_head garbage_collector_link;
> >  	u8 tile_present;
> >  	u8 tile_invalidated;
> >  };
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 63aa0a25d3b7..399cbbdbddd5 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -3071,6 +3071,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> > void *data, struct drm_file *file)
> >  		goto put_exec_queue;
> >  	}
> >  
> > +	/* Ensure all UNMAPs visable */
> > +	if (xe_vm_in_fault_mode(vm))
> > +		flush_work(&vm->svm.garbage_collector.work);
> 
> Hmm, what is someone added an UNMAP here?
>

What we really trying to guard to against is user space doing something
like this:

addr = malloc();
gpu access
free(addr)
bind_bo(addr);

We want to make sure all SVM mappings from the GPU access have processed
the UNMAP events from the 'free(addr)'. So I think the code is fine as
is - we just want to make sure UNMAP events prior to the IOCTL are
processed.

Matt

 
> Thanks,
> Thomas
> 
> > +
> >  	err = down_write_killable(&vm->lock);
> >  	if (err)
> >  		goto put_vm;
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > index b736e53779d2..2eae3575c409 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -146,6 +146,11 @@ struct xe_vm {
> >  	struct {
> >  		/** @svm.gpusvm: base GPUSVM used to track fault
> > allocations */
> >  		struct drm_gpusvm gpusvm;
> > +		struct {
> > +			spinlock_t lock;
> > +			struct list_head range_list;
> > +			struct work_struct work;
> > +		} garbage_collector;
> >  	} svm;
> >  
> >  	struct xe_device *xe;
> 
