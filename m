Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8644A7B20D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 00:31:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A97710E137;
	Thu,  3 Apr 2025 22:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MDFOE5pc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BDDB10E046;
 Thu,  3 Apr 2025 22:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743719486; x=1775255486;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=J2AkQAkKKHg0kfeyQvaeHQcAFXePGAoES6v5y7HBBfc=;
 b=MDFOE5pcxdGhfevYvemZtn+yhkY/m0T54XEaXDz/ccpktiFeoYwxz89X
 DqUCFs0S4xbutjtmbxBUmFxGruv0G/OrQ2+cPg3uCso61CH0sdW5psKtA
 vo3Alq7aqF/Nve9LWkzS7jwTPT/WHSymZguh4WhGAJIOOv/55dIvJDbxk
 mGSOw+3k+64K0SZGEte5FiOwIAjWaxtw38VUuQHSN2UW7sggTWV4KDLmU
 gKssqIX+QBjKKzrV0h3RfUUDWdwR8axcbHUrjmmphHPL51kpvvsaYwFii
 0Q/c/wuonu9AgWa4PLS3zLZE/cty2XhBesEepFS8Wskrz9fZG+mzjzz// A==;
X-CSE-ConnectionGUID: eCLHAeUOQhG7fGCyQkxyHQ==
X-CSE-MsgGUID: EuUoh4qhTEOCMu3kEg1hcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45043594"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="45043594"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 15:31:25 -0700
X-CSE-ConnectionGUID: NOpCr+ZrQwuvdxPhVa3Dcw==
X-CSE-MsgGUID: k1ORxxlQQ+SHCI9v3Tj2Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="132351697"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 15:30:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 3 Apr 2025 15:30:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 15:30:56 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 15:30:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QdYUivmAv/2Im/e2L06QsqPEgaFkuauLLTUcYN1kynQHNxb4LxjHxrSKNqg6/y3YyKOhDUz1k3LP063n6Sr0gvTUI/ebb8nyb2uWJX4gX0tKn0zLCXhC5JzIpSENqRHC8DmDhHsmkvA1WrJKlosJuRLUfKKLKpmQR+SIX3k+f3q3BtlHFWSlPMVuZ3x3sJSA73dJGYzqT1NMq13O4NDA38yt87hrYDvEn62Rvu6DkhgBsbVZ+j0j+j4bHfouU9UQDsnIIUL75fSgOcKidSrr1dgbERz19KmYfk4R2oiG1KiQYKKoLOSL+960iiOG9EjtP309MN6iQzMx9ytHwQgqUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3+uG9EXAXRMYzvnu1weW8J0S34tPPmMhUYo+gJBZiQ=;
 b=f3dPrXYojAAWbgeEM9jg+Weg5mexZGVH6JKbY+No3IJaerAuSgxRZAI4Y3uRnZh6P/FgwGIVCnDBh0FhDIM0PbJCmh9a7xyWmbHCSCoCrFVlYuUwWbu9fONW61uO7+Pu5ZK9FDdlQGhERJHD83zB/ejDCePeya4aYCEdoPO3JY7AHyFSoQesjlVgVqN/8EjhOYHk5koD9uM5Ra8/bx4lr+k44gwYzmEddh5itCIiBLsb+8JuF8spD2Lw5E4tNERCup9o8KxQyuOH0d7R4nT3jyO6NZ5dPPlDGXrYQ1drjB8FktHlsxhgTz7mcmI/x2GjREQ66PJYZXgmdMXPQV6VBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7253.namprd11.prod.outlook.com (2603:10b6:8:10f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Thu, 3 Apr
 2025 22:30:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8534.052; Thu, 3 Apr 2025
 22:30:51 +0000
Date: Thu, 3 Apr 2025 15:32:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/4] drm/xe: Add devcoredump chunking
Message-ID: <Z+8MZriWfnG0m9va@lstrano-desk.jf.intel.com>
References: <20250403202705.18488-1-matthew.brost@intel.com>
 <20250403202705.18488-2-matthew.brost@intel.com>
 <3716deb0-563c-49fb-9360-743e4c45682c@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3716deb0-563c-49fb-9360-743e4c45682c@intel.com>
X-ClientProxiedBy: MW4PR04CA0147.namprd04.prod.outlook.com
 (2603:10b6:303:84::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7253:EE_
X-MS-Office365-Filtering-Correlation-Id: 36f0ea47-5925-43a6-0f48-08dd72ff3075
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ta1asGSMPTQ8g4m0M2cnf+PE0j4wzalCjBTgidvzulBtmXnvQ2t7wSuzTix4?=
 =?us-ascii?Q?QyNg332o+h9jRarVcTKI+bCLGSwbnqQkGJiFmkQFvuqd6NiOj41A3o7wzZrA?=
 =?us-ascii?Q?3VrR+pXzzvx5vwlMzyYJrOx/ARbm/3Qcs0MF+0bESRgjCSDX5EyVZiYy8NZM?=
 =?us-ascii?Q?EpK/Mmd16e4O1P1I5zMTz7aA28th2bCz5yZACo2OtZFQoPmNVedjOt8sWJYA?=
 =?us-ascii?Q?44hVgDaJxQTGicg1nSMunNLstSmjQzXqkssxc1kjNBJQ0faA8x3TowCQY6d0?=
 =?us-ascii?Q?g7JneZvhuIE1lz3iPgQlTly1CoE1GQqiu7XymV0ZrCIgFO/Hm0dqwrPDeFJA?=
 =?us-ascii?Q?fcpOJsRNybC+NL7+TTPlfoGV02PFzO8XUdUN9owG5g47kVKa1sqD+ZhR3dT3?=
 =?us-ascii?Q?voqCM+u7lp6CUG4Eq+uIYwNhgi3HYBik2LE833rRKk1VH5ednwmhS8t0f++H?=
 =?us-ascii?Q?QH8udNrFXIkQZldCsyALltuaN9goKgTc+bIhaHgDIaKGy8SpSoCXNuru2lpk?=
 =?us-ascii?Q?wTbdNkf5Tr/fQYGgVDnaiNwK7xv2CM7AOXnVGvTVKLn5mXgwGkApz48MPr3Y?=
 =?us-ascii?Q?40iA4Zyg6g1cvpqHnHZ4cDGgn36G5tqxH9CNf6vaebHFyeXsc5yr+b0GWNQj?=
 =?us-ascii?Q?I7yP1WCzNvZWQqgJojBB+KlSwpPETcA1sARpEewxv4pZua6/8OimcFqrU1+o?=
 =?us-ascii?Q?ZryRAOrf1r5kSRJZocd386aDIufK8GgNmLVFpiw2QyUXvXm9ZnRCIyrgJKYB?=
 =?us-ascii?Q?CxkcOLpeGfGsy4PATFsbvGatnF8SEb1jRnDSCXOVU3MMP1WJ4q9RUE1GwW+i?=
 =?us-ascii?Q?KPG0G+58k3Cguccejduk5xOE5ROyWidAgpHPs/2Fg8nf9VHXawzI0ZHcjmEa?=
 =?us-ascii?Q?hRvT2pZaVUa/v4IwBFysb3x+5BZOiEL7VS7sFGYYhMKoe5b4FlrVEyCqFOGJ?=
 =?us-ascii?Q?pttRPWgX7GOpu4EmXSbQ6Yuau9R8fc/W1e0dritZPez/Qc6tOJ0XSbUAtfBY?=
 =?us-ascii?Q?+m10fa4IG0GJtxU/KYvVXkW4hq1bVk3D2EIzjZaOaqxPAa5wkoqWrn3Hmcjq?=
 =?us-ascii?Q?381lnD751zPq5G/+YVHTHFehZ6PXKvjM/yzll1P8xJbCfhaRD89G7rpg8apD?=
 =?us-ascii?Q?hM/wClLvu2G5O1FsPSFBSMhppu1q3+emalEsSYCmksLQxenUEzuQnp914IQ+?=
 =?us-ascii?Q?Rl250+f8YWXP0mEry34N1aXfImjEXejL6t7YfqdW2m8ZXMPXdGmi9hFTfbft?=
 =?us-ascii?Q?Qx0SU6+Uqd5jpljE+nGFnZwdIPSZEw+fZUN1oegOpVd1yTXmA9ho9UZoQryY?=
 =?us-ascii?Q?f8A36S+UIUyhZ9PodV+cSStogRaWfm/jF1VJJgS5WHK9C0f+3B59dbKFARGT?=
 =?us-ascii?Q?uMbHHJadqZ1qnaSUoLiWdkMfNbVX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L93/6r3QmE+GP0RoaWwgKbdPxjox5hAZmT2IG1fzsHt95q1tNDZIPZzzSaZm?=
 =?us-ascii?Q?f/XoWlFh2WzZBZGRdL9EDy2lpT6GIiA8ImqMIok3GQtzDvLd8gGcXQQtrXZ3?=
 =?us-ascii?Q?s0ZoBSKr/NwyIlqRqPGA7RjGgmUUOIEIyFanl9+WSQBEteTpZUHWN0dNWIL1?=
 =?us-ascii?Q?B/ree3nz2K/zNy4qmtxMqkDRcBLgQhZlZ50N4ffuVvEiJ1LSq8qFPP20Zano?=
 =?us-ascii?Q?RDi5sb66UxKGO+V/z8U/VkChp22yiWFU2pxPh8YDs55BdabZQJwN0qPbodFR?=
 =?us-ascii?Q?pI4iCo3zSwOZPWUuoZ7aKk+petrYy032nw8BchIjOPcU8biIaShltx/Io6gD?=
 =?us-ascii?Q?RpuNhMbiRjI6191/LW6XAsIVqIlx9xrJkd0enjnQSTlRoWykGfaIFuppUJR0?=
 =?us-ascii?Q?AtKVfcDkKTtmb3DTDfwx63tzsWERLHockMlYuObG21X2Ycam//EjMGfH/38Q?=
 =?us-ascii?Q?b81L3QiPQ3t6cNy9docOynp/J5iuGeFl16Wr+GfCn1kJFi6ofy7b+Gptp6lk?=
 =?us-ascii?Q?QZy2ARv5AMfABC7+aijgUd2wSYxzsQJ9N3BKZFXoh4kBb3sCol6hWgaasO00?=
 =?us-ascii?Q?HDKKLcaj08rcR49IiviNoDo8BME+TGjYQYxFbq9QsoJxJPB0WH0DB1VoU5nw?=
 =?us-ascii?Q?jOCvxhBDepbhAVOXAUo/Bk0NSlxB20lu+c4rziyi6JM4hq7mwLQsRLN47dZp?=
 =?us-ascii?Q?vCJ/oHZucSTzN0Bj8c/AmsWK1Z0MJWQTXswiWt8uDU/pLGnXlOOMjW7DJdvO?=
 =?us-ascii?Q?AOtWrfJAphegRiE8YtXGBV/bQRIDbIAoH8Xu3TKdKoVQVkQW7xn8FnpleImI?=
 =?us-ascii?Q?9lqsVvTSFl/OcDJThOMVLFAfi3gO5V1dSbaQPJQ1FdJHNmowI02wKa14/0Cp?=
 =?us-ascii?Q?Q6X4TLNm2qHuA2pQcccwwFizqTMd+bUcBV5AXhQUuKF0DY4qmWmA1bpbsqOS?=
 =?us-ascii?Q?rtZbt0cWLpq4lpJJlGJUF9Oxcv7BpvBo/UZyYcuoQbgsAtc2bwYlx+aRL4Wf?=
 =?us-ascii?Q?GJcFYm6fMx7SEeW71t5NGXHgnlkwyXmL831DuUX9FovT9QuOYnfJGQHqeaJU?=
 =?us-ascii?Q?TPQsQCfmj7cHAQosy3+stkLG+y1i7zNXDCJ2LuTAXsshvIb+oHcdo5bbWcnU?=
 =?us-ascii?Q?Aq12Xyo3WfZBS2rzdX0n9X+A2CVDUX15EYKFWyUT8RtqZ7bBbjaUdqfQvQBv?=
 =?us-ascii?Q?abiZtMhHQqzWlosLvzpAlASfjMe5HvzkHF61udY5CKDZLWk/I20wmH5OCd9R?=
 =?us-ascii?Q?IaLyXVhMzP65FFgvOlfcmA99NK9rw4zAFGvM9bSPU7fkOL4zkq9v2Hi0zLFY?=
 =?us-ascii?Q?Aq1zJ4EGly2b9JTwsKJEXZw8STTdsnRTM5JHEHHnPKiUHgxxT7GzVbfxqIsp?=
 =?us-ascii?Q?/0a+lmGa1yaqyWdYmCKhXJKEv5vWkK8ht+67oZmXiz2Hc2DnolDW7E5kRBHd?=
 =?us-ascii?Q?/eE1cOui+l3EuhkCLzqLtissGi3sOd25QTTUNAYwZzIeyMRtpHwA30Y/Bxy2?=
 =?us-ascii?Q?v9KO0qjrfr2996U7Pnn70MwkpgCWjoqkbibwCNhC3GQ19ny5SYR+qhJuQ/Md?=
 =?us-ascii?Q?UVYVz858/H1lxL8BqSyChlLbJanlhe0z2J+xYUCELJHThEdOylx0Av4MLoad?=
 =?us-ascii?Q?FQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36f0ea47-5925-43a6-0f48-08dd72ff3075
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 22:30:51.3771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gLSldLGxPAaGd6K2ACxI3yzd0z+U2AeTGyNqZ/7GheAs5vGznxcYypMx3ncdsiHhcW71cn4WfQljd3+HX8kfqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7253
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

On Thu, Apr 03, 2025 at 02:39:16PM -0700, John Harrison wrote:
> On 4/3/2025 1:27 PM, Matthew Brost wrote:
> > Chunk devcoredump into 1.5G pieces to avoid hitting the kvmalloc limit
> > of 2G. Simple algorithm reads 1.5G at time in xe_devcoredump_read
> > callback as needed.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_devcoredump.c       | 59 ++++++++++++++++++-----
> >   drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 +
> >   drivers/gpu/drm/xe/xe_guc_hwconfig.c      |  2 +-
> >   3 files changed, 50 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > index 81b9d9bb3f57..a9e618abf8ac 100644
> > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > @@ -80,7 +80,8 @@ static struct xe_guc *exec_queue_to_guc(struct xe_exec_queue *q)
> >   	return &q->gt->uc.guc;
> >   }
> > -static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
> > +static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
> > +				     ssize_t start,
> >   				     struct xe_devcoredump *coredump)
> >   {
> >   	struct xe_device *xe;
> > @@ -94,7 +95,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
> >   	ss = &coredump->snapshot;
> >   	iter.data = buffer;
> > -	iter.start = 0;
> > +	iter.start = start;
> >   	iter.remain = count;
> >   	p = drm_coredump_printer(&iter);
> > @@ -168,6 +169,8 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
> >   	ss->vm = NULL;
> >   }
> > +#define XE_DEVCOREDUMP_CHUNK_MAX	(SZ_512M + SZ_1G)
> > +
> >   static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> >   				   size_t count, void *data, size_t datalen)
> >   {
> > @@ -183,6 +186,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> >   	/* Ensure delayed work is captured before continuing */
> >   	flush_work(&ss->work);
> > +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
> > +		xe_pm_runtime_get(gt_to_xe(ss->gt));
> > +
> >   	mutex_lock(&coredump->lock);
> >   	if (!ss->read.buffer) {
> > @@ -195,12 +201,26 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> >   		return 0;
> >   	}
> > +	if (offset >= ss->read.chunk_position + XE_DEVCOREDUMP_CHUNK_MAX ||
> > +	    offset < ss->read.chunk_position) {
> > +		ss->read.chunk_position =
> > +			ALIGN_DOWN(offset, XE_DEVCOREDUMP_CHUNK_MAX);
> > +
> > +		__xe_devcoredump_read(ss->read.buffer,
> > +				      XE_DEVCOREDUMP_CHUNK_MAX,
> > +				      ss->read.chunk_position, coredump);
> > +	}
> > +
> >   	byte_copied = count < ss->read.size - offset ? count :
> >   		ss->read.size - offset;
> > -	memcpy(buffer, ss->read.buffer + offset, byte_copied);
> > +	memcpy(buffer, ss->read.buffer +
> > +	       (offset % XE_DEVCOREDUMP_CHUNK_MAX), byte_copied);
> >   	mutex_unlock(&coredump->lock);
> > +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
> > +		xe_pm_runtime_put(gt_to_xe(ss->gt));
> > +
> >   	return byte_copied;
> >   }
> > @@ -254,17 +274,32 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
> >   	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
> >   	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
> > -	xe_pm_runtime_put(xe);
> > +	ss->read.chunk_position = 0;
> >   	/* Calculate devcoredump size */
> > -	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
> > -
> > -	ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
> > -	if (!ss->read.buffer)
> > -		return;
> > +	ss->read.size = __xe_devcoredump_read(NULL, LONG_MAX, 0, coredump);
> > +
> > +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX) {
> > +		ss->read.buffer = kvmalloc(XE_DEVCOREDUMP_CHUNK_MAX,
> > +					   GFP_USER);
> > +		if (!ss->read.buffer)
> > +			goto put_pm;
> > +
> > +		__xe_devcoredump_read(ss->read.buffer,
> > +				      XE_DEVCOREDUMP_CHUNK_MAX,
> > +				      0, coredump);
> > +	} else {
> > +		ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
> > +		if (!ss->read.buffer)
> > +			goto put_pm;
> > +
> > +		__xe_devcoredump_read(ss->read.buffer, ss->read.size, 0,
> > +				      coredump);
> > +		xe_devcoredump_snapshot_free(ss);
> > +	}
> > -	__xe_devcoredump_read(ss->read.buffer, ss->read.size, coredump);
> > -	xe_devcoredump_snapshot_free(ss);
> > +put_pm:
> > +	xe_pm_runtime_put(xe);
> >   }
> >   static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> > @@ -425,7 +460,7 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix, char suffi
> >   	if (offset & 3)
> >   		drm_printf(p, "Offset not word aligned: %zu", offset);
> > -	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
> > +	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_ATOMIC);
> Is this related? Or should it be a separate patch?
> 

It is related. Now that __xe_devcoredump_read is called under
'coredump->lock' we are in the path of reclaim, __xe_devcoredump_read
calls xe_print_blob_ascii85.

Both cases the allocation is relatively small, so would be fairly
unlikely to fail.

I could make this a seperate prep patch if you think that would be
better.

> >   	if (!line_buff) {
> >   		drm_printf(p, "Failed to allocate line buffer\n");
> >   		return;
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > index 1a1d16a96b2d..a174385a6d83 100644
> > --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > @@ -66,6 +66,8 @@ struct xe_devcoredump_snapshot {
> >   	struct {
> >   		/** @read.size: size of devcoredump in human readable format */
> >   		ssize_t size;
> > +		/** @read.chunk_position: position of devcoredump chunk */
> > +		ssize_t chunk_position;
> >   		/** @read.buffer: buffer of devcoredump in human readable format */
> >   		char *buffer;
> >   	} read;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > index af2c817d552c..21403a250834 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > @@ -175,7 +175,7 @@ int xe_guc_hwconfig_lookup_u32(struct xe_guc *guc, u32 attribute, u32 *val)
> >   	if (num_dw == 0)
> >   		return -EINVAL;
> > -	hwconfig = kzalloc(size, GFP_KERNEL);
> > +	hwconfig = kzalloc(size, GFP_ATOMIC);
> Likewise this?
> 

Same as above.

Matt

> John.
> 
> >   	if (!hwconfig)
> >   		return -ENOMEM;
> 
