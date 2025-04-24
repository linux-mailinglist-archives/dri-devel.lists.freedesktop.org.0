Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF83A9B5E8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 20:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0342310E12E;
	Thu, 24 Apr 2025 18:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UOKEY4RD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FCA10E052;
 Thu, 24 Apr 2025 18:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745517782; x=1777053782;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fLJJdszS4aV+G6TetGm+VXDI+vo/VlI5AQbjI+z0pvc=;
 b=UOKEY4RDvIhRjxK92MKSboA+Ycz/2JLGQJ0bGcpAbzAnYfTvZZpFsyVM
 fdwJiA51xep06lZxL0EhH0TEuUFHP8Fx00D3HdhrNb+BU/ts+HQHgpB8m
 aITgoLbPVuTyGcfB6/cz/cdoPQv5DX+/EiqOcChwNh76S0QY1l5HUprc/
 6Lrp5PDecHxh3zLbNaczS8GFcOhV0j52MDFlOqEv5uCJUL5cTm9w/jOOr
 01irx4q8rodrd00yGIwiRs3GLGqP597Fvq9Gr30MWDLkIDrjGNoLY3pTW
 h2siF9wkuC0u5Q2OwLUWu2VaTUBPizZdPhaWfLsPeeoIErXIt7G8a8RJz Q==;
X-CSE-ConnectionGUID: N9cFiDY6SmaI2xa0twQ4+g==
X-CSE-MsgGUID: Mx9dVxrhRaWym77BND18Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="46398040"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="46398040"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 11:03:02 -0700
X-CSE-ConnectionGUID: M4S0pQbHRw+Q3IdcsRg/9w==
X-CSE-MsgGUID: 86zz7wwSR/i5l4vCz76ZcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="132675704"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 11:03:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 11:03:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 11:03:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 11:02:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UKYM3lKaJ7c7FEeH3AXO5fdxsgBAQqhxSeysu9Xod5wxY5pCC0ZesFy7oqeLjPqNKIWExdESn70LVwC89FAAdmTwUFYY1XNCrTgAZ9qSjfulf+lQtnHfpJ0afj4v6d+1RX21MCmFBax7NRx6xfs3WE+oClPdfOY7j1ie2T7GYukgEHtXqp4USQQlaGJr/mi3lgGvdOtTY6aB8X6wVr3Odx9V3EcweljILgKHtNJbNe0VMYhwi2R7+ew9ybDVGYxfVjbealxNCD2eLJ92NREY74+/30ZuqIV0ZakTO6T0OrQOwG+a/7QtjXYx7vj1bE8DKi/Dy9w2CYZ48gPibiyxIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfMrylGt28fFmkda7h89iyeZAosoG7yqGMQU42kJPrs=;
 b=Xr2xkqT+QIB4ADRcA4Joie/CfSJiTkNNuvVN021HomY6bEFuhdGGbUXb8A59e2bcvY5EYcHP54o1VeAY5JGfqfXa5VBIisoyi4oyQi9SXkhZ0hRQEHQwojjf5WTPx4v/F1SFYd6sGf6tWAyLFaK6fepvW08eD+mXPDbw1Sp19oA1x6BfXgiOFU7yxFJqNKRgX+WhSBtzqK0ZWSu0ToTfw1AIK5tAy0Umtbw4Sy1z7YLB6qWLpoQ8pXxe+GIoAJs6eMq1ZmEMTx5/Cl6T13VtluEGob1CH4KWiipqFNCfmUttZVq7uklgP9H3m0y9S+c6seczs2STkpNE0JSfroHMvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5056.namprd11.prod.outlook.com (2603:10b6:a03:2d5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.28; Thu, 24 Apr
 2025 18:02:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.037; Thu, 24 Apr 2025
 18:02:10 +0000
Date: Thu, 24 Apr 2025 11:03:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v4 2/5] drm/xe: Strict migration policy for atomic SVM
 faults
Message-ID: <aAp88xbpx3ik3H4p@lstrano-desk.jf.intel.com>
References: <20250422170415.584662-1-matthew.brost@intel.com>
 <20250422170415.584662-3-matthew.brost@intel.com>
 <1391a2ab3cbf8b690f1ec371cdc932032a647645.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1391a2ab3cbf8b690f1ec371cdc932032a647645.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0107.namprd04.prod.outlook.com
 (2603:10b6:303:83::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5056:EE_
X-MS-Office365-Filtering-Correlation-Id: 90f9af47-7be4-4400-f183-08dd835a2230
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?aun/WvhAgyVmxHPHo3bIo8bdueOmLt6t84A+2Qa3U6ESzNYwXDols35yiM?=
 =?iso-8859-1?Q?WwctP7wxtIKo8hHZLCTVHnfqH+l6sX9xpszNvIJaOyhexwjKOYFLEweZ/4?=
 =?iso-8859-1?Q?Z3qKt8Bvr+Rb4OAxsbzRt4X7uPtL5gx10clO2UiDEohlv1aOf8RA/zqnQh?=
 =?iso-8859-1?Q?RcsC1K1JjTwXkJHZlscUHyjIzo0o2oLu+kqMIdOCXgyt+EtC5yBBtOKWb+?=
 =?iso-8859-1?Q?5gLuAipUwwqDATJ+BdhqaOOcBDU8nZ2Z2C3WGpGJ0pDoRUx6WcSxtx08qj?=
 =?iso-8859-1?Q?6nA+xEgDEpNYmQsNv83rfoX5hy1Qgrg65F7VrDXLWtTvO/dnz29PZOE0fC?=
 =?iso-8859-1?Q?h9oc8DezziYvs5YfnB3rT4ULvvJo7viNacsu0ierGHFvbb2/Zyl503btjI?=
 =?iso-8859-1?Q?sTu4KTANEd+QEvqX3SIRCmnClFDaZn6CUFTZ1KHTVacAApsh2zBw/xsWBW?=
 =?iso-8859-1?Q?+It/j3RsWZIrrHigr8U4Xa0trNWGwq/ewc5yD+toUsJCUvQf/0BA9Pzg17?=
 =?iso-8859-1?Q?3cfpMkGyipG+5mfEroggw9hKnIH+O77A6CD5LeXd45WQ3yhCltpJznIfhM?=
 =?iso-8859-1?Q?YZmMHrdUJwZik1hpr9OWDCzDFi6fFNOND2w7J3R6bVa5J51IoHepSZ0C9K?=
 =?iso-8859-1?Q?j4VocONNN+wsdwFtN7clYETb6k+fSvIg05RKuVlDF568cDLLAo3GJoz1zx?=
 =?iso-8859-1?Q?0dXsrpoR3tFeV4MlTa5akoH49nRIm+BvBoaP6Q4Ll0lDTmUsL+S9EKTLFJ?=
 =?iso-8859-1?Q?fsijadeAcxMeSQVKVWvMKcuPaaCkZtbDO0V1cb+6z9Qw9W/Ogd5eOmb/Jd?=
 =?iso-8859-1?Q?QV8wa1sS8zYSgO2cVAAF7DKyRGGVz9dLAGXJsGr1GXopZujGfs2TBuo68Y?=
 =?iso-8859-1?Q?3hSKBdSrlOMDtFJwlm/ROty2AptYjuBQ4eSnWMX6Kbd5RSWWHOqRVLX7qo?=
 =?iso-8859-1?Q?ei/GkS569iD4UHRUxigWyMiQNFuGLIlpRagTYSEPjjC3k7WVuFd9le4vUm?=
 =?iso-8859-1?Q?6xPDgEmgJbA4UVezcBpzxonUGtWvBJqbArL48b2x5UEgrehwAFITGx/glX?=
 =?iso-8859-1?Q?HNxXrWRks1iXf4FKFAHlHbbpjgRl69XURQwRM585KXbFdUZVnw9AtJAnQE?=
 =?iso-8859-1?Q?hNR7Xy7ig3CSjVlz6+a+r0uD0GSysCeTngHRAgJ9Qp+NSQyOX69ZfGWvTb?=
 =?iso-8859-1?Q?03K8PqBKLLOOgmchaTkTIjkdaQxM3oCBI6J/rB/8w0+bx9O/v5MLRuhPu3?=
 =?iso-8859-1?Q?TI0fIADv7pRDWXRAIfSIl0HqjVQ+1Ye5DyUG9GC2+sWNt746Pog8KZi4Tf?=
 =?iso-8859-1?Q?fhxSqngwLmaLyn9nX6hhMAxBS8EoWYSQcz+HOAmAi9JtAip0uCIR2l2vT0?=
 =?iso-8859-1?Q?Lmh+prlrogcC/nXdtndwYWhLBVTt15Eqi/KkmBcnWouLJ+93Bd8cs13QPL?=
 =?iso-8859-1?Q?S+A7BB9o2ZihCt4cZRtPpeZkAnP5k1bbhs/PnZGv7MngenHB6WmrRO42lM?=
 =?iso-8859-1?Q?A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?AcyaG04CW+7bCkqHrLxXhqO5nql1/8UdU2M7uGAV+7H6p/20ki+7Nisksa?=
 =?iso-8859-1?Q?KDpTdp8AUk7GYJGcjZxgtnl4XwpCVXTK9JlL7MN5Iwjw7ndFDO+GMU1Ncu?=
 =?iso-8859-1?Q?T0iVOrTkM0tT51zL7lZyXByErOqfq+i5S+7S2sxmUavufwu65Vt+9x3q4j?=
 =?iso-8859-1?Q?fIQoWLio/kGiFdloNfxqLXJjN3dWw8MoVi7029dsy44fOK9kaIqEhYET7O?=
 =?iso-8859-1?Q?QAJF9wHEtMuRDb5AykG4UyuIEKmGG5vDzXKdG2ge5m+j05wVape2ljKAuu?=
 =?iso-8859-1?Q?i9+/ID0zH8AN4kQsIAosqv+W30JlEmuECCc31YmBls4iyoKvN9h8ibNAm3?=
 =?iso-8859-1?Q?y9qGVOgop+vlpJBWdZlBOydyHtN5dJ0xVjmYShbuxoHwtrw8ROEgXayKAQ?=
 =?iso-8859-1?Q?eQlmKPmp3TEc/9Bb5g/E7aW6gG8kEun90ZvefM5PQXtNizKhI/mcBZ5lbK?=
 =?iso-8859-1?Q?MpEoOSGUAfHlq6ewlJUgF6NACQMNyWxxTyVC97On0Mq7dkYzj0DUwH4h9t?=
 =?iso-8859-1?Q?0bzhxAUFDbtGf8v8CHtlpSpQ4A4jyhgDyjJWIbyZXoB5eKIOipwqnOyAXn?=
 =?iso-8859-1?Q?TV7vVOGuvGb898eAKkv1CUG9Rj1gkBNZugerySgUR+foBCY2Zm67FFEPaj?=
 =?iso-8859-1?Q?IqhKyfnH+Vj9ogNTDY/R8ivVPPZgCEnDFZQXAb9v+SUXg1VsSIg6YI9PEA?=
 =?iso-8859-1?Q?QFfteAOMeYXig0kk3WmE0gjW0b2lGSXtxerJaX3+oClfUTBc8KKgHWrEDp?=
 =?iso-8859-1?Q?TrW6Up/GMs+diD2jCxIgf4kSXBNfNqL1ZxefSe2y2Rl9/uAoReQGuAPdOR?=
 =?iso-8859-1?Q?7M9+63+jW5+eLfoWky+7J6/vjy3ujXyO/ZuARidbo+dwxzE6hPcIHUz/PR?=
 =?iso-8859-1?Q?V3Md9BToo4Cun6fgloxAXdLCr+bzRg8DSGQ/0k7iJaInxBindhFQshDPn7?=
 =?iso-8859-1?Q?sYdf9I3FBkgWC8F5+h/OSEfO+vVRDz+MdxWS7oLAnmAgTQPNKLLQIbHIKJ?=
 =?iso-8859-1?Q?dqlzkFKm8bRWmxwn1EOC8/pDiQyPO1782myQxoKg5z57AXqil+5Elgm5nT?=
 =?iso-8859-1?Q?JS3mPY/m0CbMLlClnjPhRkRkJei+dlx4ZE3NYL0DNP/f1t0CqukphmE2r5?=
 =?iso-8859-1?Q?+CiUtW4ykjbYM2Jlim9xknJlBSjJ5sFqZseTDLgivGD2etJwRCppOSAeKL?=
 =?iso-8859-1?Q?wB65z/aGSt8aMYAUUiZ2VGddrf1CeQ4wonhc5WvxihmKC7p7S7NNsnPT4N?=
 =?iso-8859-1?Q?Gldq8A+FMQbD/Pw0khsdDRKcHMXF0dSYSVtu1pABFBqIbpzcW/UaaD7nZ7?=
 =?iso-8859-1?Q?rSYJhI6IR8kKK1JzhalWCBH9pGj8A9R67bO3UCqk54tq/YMuK4HBkOGWxF?=
 =?iso-8859-1?Q?zz8btZX1k87mmt48CedT7/lT1PEy5L2lyAw//eCy2rVoltsR6LEzgQa7wf?=
 =?iso-8859-1?Q?1vH5VxkWn0tW1vIQFamOwg7IHVLrFbWH9cytIlXFpMP9Du2e1ZtrzUEH96?=
 =?iso-8859-1?Q?90fyXWgIjrYlgO3X8rXljxiy9vyA9wq8kC++lnVyPJAq/y+rFKvYDagWqr?=
 =?iso-8859-1?Q?zNWh8fBo/ya90j/agB51Kk4HHmxE4inmL7mTF3jA1f/9QS7rbY07CrDV2r?=
 =?iso-8859-1?Q?SHSsXRr0TqSXsJ0CL4OzbtgW7raAJXm/CBMXXyeWo6iNkmu6fGzb0aCw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f9af47-7be4-4400-f183-08dd835a2230
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 18:02:10.3799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9K7MEpTOnIEHf8el2igCAW7/Yq/f4e6/2c3de4Pth8k/3TAsZRXASbrnUHSZ+K5cGaJD9P4BWPyfiGB9sX1zlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5056
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

On Thu, Apr 24, 2025 at 04:39:21PM +0200, Thomas Hellström wrote:
> On Tue, 2025-04-22 at 10:04 -0700, Matthew Brost wrote:
> > Mixing GPU and CPU atomics does not work unless a strict migration
> > policy of GPU atomics must be device memory. Enforce a policy of must
> > be
> > in VRAM with a retry loop of 2 attempts, if retry loop fails abort
> > fault.
> > 
> > v2:
> >  - Only retry migration on atomics
> >  - Drop alway migrate modparam
> > v3:
> >  - Only set vram_only on DGFX (Himal)
> >  - Bail on get_pages failure if vram_only and retry count exceeded
> > (Himal)
> >  - s/vram_only/devmem_only
> >  - Update xe_svm_range_is_valid to accept devmem_only argument
> > v4:
> >  - Fix logic bug get_pages failure
> > 
> > Signed-off-by: Himal Prasad Ghimiray
> > <himal.prasad.ghimiray@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_module.c |  3 --
> >  drivers/gpu/drm/xe/xe_module.h |  1 -
> >  drivers/gpu/drm/xe/xe_svm.c    | 89 +++++++++++++++++++++++++-------
> > --
> >  drivers/gpu/drm/xe/xe_svm.h    |  5 --
> >  4 files changed, 65 insertions(+), 33 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_module.c
> > b/drivers/gpu/drm/xe/xe_module.c
> > index 05c7d0ae6d83..1c4dfafbcd0b 100644
> > --- a/drivers/gpu/drm/xe/xe_module.c
> > +++ b/drivers/gpu/drm/xe/xe_module.c
> > @@ -33,9 +33,6 @@ struct xe_modparam xe_modparam = {
> >  module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size,
> > uint, 0600);
> >  MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size(in
> > MiB), must be power of 2");
> >  
> > -module_param_named(always_migrate_to_vram,
> > xe_modparam.always_migrate_to_vram, bool, 0444);
> > -MODULE_PARM_DESC(always_migrate_to_vram, "Always migrate to VRAM on
> > GPU fault");
> > -
>  module_param_named_unsafe(force_execlist,
> > xe_modparam.force_execlist, bool, 0444);
> >  MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_module.h
> > b/drivers/gpu/drm/xe/xe_module.h
> > index 84339e509c80..5a3bfea8b7b4 100644
> > --- a/drivers/gpu/drm/xe/xe_module.h
> > +++ b/drivers/gpu/drm/xe/xe_module.h
> > @@ -12,7 +12,6 @@
> >  struct xe_modparam {
> >  	bool force_execlist;
> >  	bool probe_display;
> > -	bool always_migrate_to_vram;
> >  	u32 force_vram_bar_size;
> >  	int guc_log_level;
> >  	char *guc_firmware_path;
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index 890f6b2f40e9..f749ae367a8f 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -650,9 +650,11 @@ void xe_svm_fini(struct xe_vm *vm)
> >  }
> >  
> >  static bool xe_svm_range_is_valid(struct xe_svm_range *range,
> > -				  struct xe_tile *tile)
> > +				  struct xe_tile *tile,
> > +				  bool devmem_only)
> >  {
> > -	return (range->tile_present & ~range->tile_invalidated) &
> > BIT(tile->id);
> > +	return ((range->tile_present & ~range->tile_invalidated) &
> > BIT(tile->id))
> > +		&& (!devmem_only || range-
> > >base.flags.migrate_devmem);
> >  }
> 
> So let's say devmem_only is true here, and range-
> >base.flags.migrate_devmem is false. Wouldn't that mean the range is
> unusable and needs to be freed and re-allocated?
>

This is typo, this should be s/migrate_devmem/has_devmem_pages.

This translates to:

Either devmem_only is not required or we have devmem pages with a valid mapping.

If migrate_devmem is false and devmem_only is true, that is a fatal
error actually, we should have check for that and kill the fault. An
example of this would be shared mapping which cannot be migrated to
devmem.
 
> Also another thing going back to older code, it seems like range-
> >tile_invalidated is protected by the notifier lock, so shouldn't we
> assert that to be held in the function? It seems not to be held further
> below:

Yea techincally to get a stable value we'd need the notifier lock but
this is an opportunistic check - at worst if we read a valid range we
skip the page faults and will immediately get another page fault. So we
could take the notifier lock here but I don't think this is strickly
required. Let me know what you think here.

> 
> >  
> >  #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> > @@ -726,6 +728,35 @@ static int xe_svm_alloc_vram(struct xe_vm *vm,
> > struct xe_tile *tile,
> >  }
> >  #endif
> >  
> > +static bool supports_4K_migration(struct xe_device *xe)
> > +{
> > +	if (xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
> > +		return false;
> > +
> > +	return true;
> > +}
> 
> Do we have any hardware that supports pagefaults but not 4K VRAM pages?
> 

PVC

> > +
> > +static bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range
> > *range,
> > +					       struct xe_vma *vma)
> > +{
> > +	struct xe_vm *vm = range_to_vm(&range->base);
> > +	u64 range_size = xe_svm_range_size(range);
> > +
> > +	if (!range->base.flags.migrate_devmem)
> > +		return false;
> > +
> > +	if (xe_svm_range_in_vram(range)) {
> > +		drm_dbg(&vm->xe->drm, "Range is already in VRAM\n");
> > +		return false;
> > +	}
> > +
> > +	if (range_size <= SZ_64K && !supports_4K_migration(vm->xe))
> > {
> > +		drm_dbg(&vm->xe->drm, "Platform doesn't support
> > SZ_4K range migration\n");
> > +		return false;
> > +	}
> > +
> > +	return true;
> > +}
> >  
> >  /**
> >   * xe_svm_handle_pagefault() - SVM handle page fault
> > @@ -750,12 +781,15 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> >  		.check_pages_threshold = IS_DGFX(vm->xe) &&
> >  			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
> > SZ_64K : 0,
> > +		.devmem_only = atomic && IS_DGFX(vm->xe) &&
> > +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> >  	};
> >  	struct xe_svm_range *range;
> >  	struct drm_gpusvm_range *r;
> >  	struct drm_exec exec;
> >  	struct dma_fence *fence;
> >  	struct xe_tile *tile = gt_to_tile(gt);
> > +	int migrate_try_count = ctx.devmem_only ? 3 : 1;
> >  	ktime_t end = 0;
> >  	int err;
> >  
> > @@ -777,23 +811,26 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  		return PTR_ERR(r);
> >  
> >  	range = to_xe_range(r);
> > -	if (xe_svm_range_is_valid(range, tile))
> > +	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only))
> 
> Requires notifier lock. Also see comment on re-allocating the range
> above.
> 

Same as above.

> >  		return 0;
> >  
> >  	range_debug(range, "PAGE FAULT");
> >  
> > -	/* XXX: Add migration policy, for now migrate range once */
> > -	if (!range->skip_migrate && range->base.flags.migrate_devmem
> > &&
> > -	    xe_svm_range_size(range) >= SZ_64K) {
> > -		range->skip_migrate = true;
> > -
> > +	if (--migrate_try_count >= 0 &&
> > +	    xe_svm_range_needs_migrate_to_vram(range, vma)
> 
> Requires notifier lock.
> 

Same as above.

> Should we have some sort of timeout instead of a try-count? Perhaps as
> a last resort fall back to a 4K range?
> 

I did have code like that at one point to reduce range size but it is a
bit complicated as we'd have to remove the range... I'd rather stick
with the retry loop for now and if this becomes problematic, circle back
to reducing the size of the fault page on each retry loop.

Matt

> /Thomas
> 
> 
> 
> > ) {
> >  		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
> >  		if (err) {
> > -			drm_dbg(&vm->xe->drm,
> > -				"VRAM allocation failed, falling
> > back to "
> > -				"retrying fault, asid=%u,
> > errno=%pe\n",
> > -				vm->usm.asid, ERR_PTR(err));
> > -			goto retry;
> > +			if (migrate_try_count || !ctx.devmem_only) {
> > +				drm_dbg(&vm->xe->drm,
> > +					"VRAM allocation failed,
> > falling back to retrying fault, asid=%u, errno=%pe\n",
> > +					vm->usm.asid, ERR_PTR(err));
> > +				goto retry;
> > +			} else {
> > +				drm_err(&vm->xe->drm,
> > +					"VRAM allocation failed,
> > retry count exceeded, asid=%u, errno=%pe\n",
> > +					vm->usm.asid, ERR_PTR(err));
> > +				return err;
> > +			}
> >  		}
> >  	}
> >  
> > @@ -801,15 +838,22 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
> >  	/* Corner where CPU mappings have changed */
> >  	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
> > -		if (err == -EOPNOTSUPP) {
> > -			range_debug(range, "PAGE FAULT - EVICT
> > PAGES");
> > -			drm_gpusvm_range_evict(&vm->svm.gpusvm,
> > &range->base);
> > +		if (migrate_try_count > 0 || !ctx.devmem_only) {
> > +			if (err == -EOPNOTSUPP) {
> > +				range_debug(range, "PAGE FAULT -
> > EVICT PAGES");
> > +				drm_gpusvm_range_evict(&vm-
> > >svm.gpusvm,
> > +						       &range-
> > >base);
> > +			}
> > +			drm_dbg(&vm->xe->drm,
> > +				"Get pages failed, falling back to
> > retrying, asid=%u, gpusvm=%p, errno=%pe\n",
> > +				vm->usm.asid, &vm->svm.gpusvm,
> > ERR_PTR(err));
> > +			range_debug(range, "PAGE FAULT - RETRY
> > PAGES");
> > +			goto retry;
> > +		} else {
> > +			drm_err(&vm->xe->drm,
> > +				"Get pages failed, retry count
> > exceeded, asid=%u, gpusvm=%p, errno=%pe\n",
> > +				vm->usm.asid, &vm->svm.gpusvm,
> > ERR_PTR(err));
> >  		}
> > -		drm_dbg(&vm->xe->drm,
> > -			"Get pages failed, falling back to retrying,
> > asid=%u, gpusvm=%p, errno=%pe\n",
> > -			vm->usm.asid, &vm->svm.gpusvm,
> > ERR_PTR(err));
> > -		range_debug(range, "PAGE FAULT - RETRY PAGES");
> > -		goto retry;
> >  	}
> >  	if (err) {
> >  		range_debug(range, "PAGE FAULT - FAIL PAGE
> > COLLECT");
> > @@ -843,9 +887,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  	}
> >  	drm_exec_fini(&exec);
> >  
> > -	if (xe_modparam.always_migrate_to_vram)
> > -		range->skip_migrate = false;
> > -
> >  	dma_fence_wait(fence, false);
> >  	dma_fence_put(fence);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > b/drivers/gpu/drm/xe/xe_svm.h
> > index 3d441eb1f7ea..0e1f376a7471 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -39,11 +39,6 @@ struct xe_svm_range {
> >  	 * range. Protected by GPU SVM notifier lock.
> >  	 */
> >  	u8 tile_invalidated;
> > -	/**
> > -	 * @skip_migrate: Skip migration to VRAM, protected by GPU
> > fault handler
> > -	 * locking.
> > -	 */
> > -	u8 skip_migrate	:1;
> >  };
> >  
> >  /**
> 
