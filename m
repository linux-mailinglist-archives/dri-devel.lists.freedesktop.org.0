Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFE4B57B23
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 14:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 255C08928D;
	Mon, 15 Sep 2025 12:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="afyfZQyF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A6010E47E;
 Mon, 15 Sep 2025 12:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757939663; x=1789475663;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VXyt9pgHLxnlPp8jvks84EK9KGXjHTEWhmRcAwcLNUc=;
 b=afyfZQyFgoMOCcczSxpLe4YDDKhIX2/puIgaboRKkMByanFx1Q/Iyj0L
 1UaxC8UaAN2372FIoyE7Mrrvx5nzpmkL2Fen4XoqZUWkaLHDOSVzTcK6E
 m6Y6djQoIxv5AQ4B11UbUH8db1e5o+rB9ZaVJqC9Nduw+3s8dF8Cb2Evy
 G9LFo2Anp8ltfD7SQeBiDshEuOSKUMtdF6nUM7XwlaLZqeqdk/iMUiGBR
 bNwzWhjCcOExIpt+eF7z7KhhZkT3v+a+unvu/RxYAy1g/xGkPkTobRWvm
 Zd+//k1DZG+HEBH+3eB5AnEZkvQ485I+nvvZVOl6caX/vjQJLBbJaqb5E Q==;
X-CSE-ConnectionGUID: G9NNzf8yR12Yx8vYclWn2A==
X-CSE-MsgGUID: HcFNwbOPQWeiiMqrKQmu5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="60335475"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="60335475"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 05:34:22 -0700
X-CSE-ConnectionGUID: qcQ4ID+SRxSwDN9qrSb3pw==
X-CSE-MsgGUID: OEFBbkxOSJ6SAcnKYVcg4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="178627125"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 05:34:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 05:34:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 15 Sep 2025 05:34:21 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.14) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 05:34:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdmXN+OMuu8l7wAln4oN5jw/Czm6Hoi5gxrEf05AVoLJV1LGzZN8QhDlpzrphQIPUlJG+sODi45EHZiebH2ssgwzaq6GMvKD8kjyCSlfE8dKbJGVPhDAOFqHaLgzfS8Dx0hZzNB0A+SPOxoh1bgjpn3dOozAAn6rnk/kK6tI2h2NrzdoVen3+tJGlivdvMNi37zEcNv82amdpA9QqbwvrxojLnNSYWiofYEx/30umdOyW9MQMVdFaq7kCBfOQ9XW5mBc0fYVzWvgDEI1joQ4Lx6Sn03rX2QimIuYS5sGJqmnoTbKtFXtWVBphI4Y5nBHrVjLWR8Ao1ruR9GXdlr5RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=owL4bT6zj/qeF5iF1WZ8hqS3V1zmAf+rUo/lqZz/4SI=;
 b=KnNsSFQJ2v5ZSo0CjFcSi56lmvKYLBapqg8Sf4Nv1mm6PUD04/AF/Ti3FUjI9+IS4dLB+/ZdDmUyabzCs4RjUCYTgQqnrt1RvMqS6G29hvUGuLWsUwhymd1+rI+rjzyEf/JREm2sCMo2yTBUN0mq6WbxJ2R5UOgB/FHG7jCFJQfLwSzQlrU60ZP244JIn0XO0JFeuSYjm9KugMiZKLT+vRTfZ5dfd1Q1TwsObMi1yTZahirmw2DbdCHLxI/ef067rU2Xdo5Jt+feTnMwJjOFoMXsLXT05aDd/44MRodlbMhX3BXOLx5orf0Dk/Si+ek18rrZFgDhWf03k5YZOqF+Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY5PR11MB6164.namprd11.prod.outlook.com (2603:10b6:930:27::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 12:34:19 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 12:34:19 +0000
Date: Mon, 15 Sep 2025 08:34:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Matthew Brost <matthew.brost@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] drm/xe: Fix a NULL vs IS_ERR() in
 xe_vm_add_compute_exec_queue()
Message-ID: <aMgHxkTeXQuXkhC8@intel.com>
References: <aJTMBdX97cof_009@stanley.mountain>
 <aMf0gA6Zyj3PpgZn@stanley.mountain>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aMf0gA6Zyj3PpgZn@stanley.mountain>
X-ClientProxiedBy: BY5PR17CA0043.namprd17.prod.outlook.com
 (2603:10b6:a03:167::20) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY5PR11MB6164:EE_
X-MS-Office365-Filtering-Correlation-Id: ed04b1aa-0706-45fb-6f06-08ddf454309b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xBy6dk0Inb2S5ouFag9GGcAyVdqJGGXVL8F3+4hJEZu9SLgojo5DGW7ciS4Q?=
 =?us-ascii?Q?9RfsN4UfbXt/7IiRsNJf9je6Jsuyojh6EHQftQpFhlrtV+vfKgUMuP4fcQuB?=
 =?us-ascii?Q?QhjBehVALB2EZn4dLSswhLvzR88S0RzYvnNox5s7kXt7qrpYT1Sj76Hv5pIi?=
 =?us-ascii?Q?rTJ4gdtbgzJzZ9XWlKk3xfVZaFzRpE2i/xyf1I7JsNk69XqjLrle1cw+UFvz?=
 =?us-ascii?Q?wPGb4oBMvFhR4IEwkUK7qunq9AHKUU+6UuX2ZxO/V2iauuc+xdB+t7SEMKJO?=
 =?us-ascii?Q?ajYcfYX3waAGNd5qYR6XJcvPsAUf6ewL6xRmK9wK8RoSWHn76uM7lGJNhQ5g?=
 =?us-ascii?Q?Zmc7yjDSj6o/4ZNA98fZE7GI1gvkBnQVEo3Mn4THGUnCmFZazVlZ4uNz914M?=
 =?us-ascii?Q?GP2y08g9IgeCQbN1FgTivMnDxYPWCDVk/Qp7DO6TpWz/FTWXeuiFUY5mO6HG?=
 =?us-ascii?Q?MUp521WQdwzPivWxPWkBeAIxscryw9w8EzS7GTbf+B5H4BPQTVBAMHF6yrZU?=
 =?us-ascii?Q?FJ7R6s583sxQ2zsuWCjbbuqcOF740mCQ20JgA12rU6gGMuMxuVGdm28oPiew?=
 =?us-ascii?Q?zEVGnHEuCyRTonFA00yFKnUa1khU9mKSJbC7yRcZ6tIiW/8Y2J2D9v5jdm35?=
 =?us-ascii?Q?j6v7hCBQ3IPx+Wn9ukXRGMfhZo3fsKkpzQPcmTDhMlyStkvWRaIzKqGr6av4?=
 =?us-ascii?Q?1kOEgFKT9JOuB7m+AqRGHEaEbV9KWR60rJgnL7L6W+uI/b/H86Pyg2AW4/Sp?=
 =?us-ascii?Q?3LXNQY0Iy928tQxq7BN93w1cltcQfFi3ZbV9xAVCdxV9j0iD6T8k0KLHpW1W?=
 =?us-ascii?Q?FpUHivxOHBK2gJ5nQcVvKw4waf0P024CpmQxB0K2gpyWoa+7+h1gf7e3QfbY?=
 =?us-ascii?Q?cCEMPGXMpgbqMf3xaZBZX/goUbrEbVqDU/NklV56kn+mBdm3jiJY+TM3D218?=
 =?us-ascii?Q?vs9UDNEIsOMrSvXn4i4VYg6xOh2KqE9Wm6O9R5lPDWJMw1FmbpcNpKcuENUL?=
 =?us-ascii?Q?N16Ko1de5nZNZHn5DWMaWYgNE3yAclE4ACxVFhK0C67DnEX3SBUMtKpZUVvN?=
 =?us-ascii?Q?8Z20nThCRRSvykLgywp8BJlyfEr7VDkmhnzOvFG7/c50nyZQl7eRs0HHWuHk?=
 =?us-ascii?Q?mbbDMoQAG+lLaaVv5ptEH9TvwsalUoxs3AdSZ4OpZ49uHRJRQt9Z4GETuAK4?=
 =?us-ascii?Q?73xaqFbLOvLYo0Q3thUhAEGtIcL6MOOOuYzXereO6hkiNzKkAopuertYI8wJ?=
 =?us-ascii?Q?320hhc15c0SI4Snv6zQXaABhj/8SmcNKcj6EomCo6rsGc2qH6VJElvl6fgUr?=
 =?us-ascii?Q?u93JvVEgeJPwc+vE1M9dEnr+XutFehhkWF1dugue9kIuddRpMXfTJkBnFoeP?=
 =?us-ascii?Q?DOr9BGvrFp/zSD3k7cp5xwaM/iDRaz/0hGpNoD0fjH40bWmxraUp89jakptU?=
 =?us-ascii?Q?aByQ4tQKeH8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?REo754kS6KXhfp6DVzFE8lr44vfSymdfnBcF6kMOF3RMtLOhrFPga+tVrf62?=
 =?us-ascii?Q?Q07WnZYvCHkUiA1XsJIKMbIguruaVRJcovfhCPeV943kdr223Knz2OHj7NAA?=
 =?us-ascii?Q?HsDQJ5R40QZc2/NqcC/R3B4yYJH/PkNzmUouXag3/hNotVVF35YfUJG1HQBU?=
 =?us-ascii?Q?RTKTs8Tm1gWo03q+solgeeejNPx+3EqgqbrPdQ+vZsbxTB8FO4ZUgnAmW2eA?=
 =?us-ascii?Q?WwETmwKzyXT1IBbiMHFwJwuhRcyo6CYLA9seQiR2INPHb8sKOjnQ1++O9f7A?=
 =?us-ascii?Q?PnW3n9Y7ngCq8Rv1BMd9y6PtoK8p/VWVxm0N6y/mlmB1vUV1eMg/glkYgfZJ?=
 =?us-ascii?Q?1zvGS0KYZgtqMVuIwE5jFU8+HEficUyR9SQkXjWlq94xTJxaGVNVQUdIcMAA?=
 =?us-ascii?Q?oX2hJLcTG8tVDI8hM/XVGlqp+ULRsKeOr1Bvu7bLCwvotv9aP649m0EpWeCe?=
 =?us-ascii?Q?VXGRizlQvNE+htA6HTIZjupV+bwEtyX0KlrZUBsI16d57FapnqOgMzvaP/Uj?=
 =?us-ascii?Q?8wgFK7ewcMqjr7KMJb7AY++DK1+2ODUD9yFtq9B7vTO6Pb1dDSjjcLOBlE2v?=
 =?us-ascii?Q?HnKo+MVF9t3vAylqPexetOhHhqtdVhDzi2CMGB+8Axv5HdFK7nFC8vtsYc/s?=
 =?us-ascii?Q?0CswVyVfQPIEbaHLjKbFSThsTHq/4TbR0NOik3IDvEUlUH5qUXa6xaGWZoSG?=
 =?us-ascii?Q?OJKgU4VFUIwwpGnuUZrGy5M2qVoE++rZLTHbYQEpKqyAgLz6j7u1kbMYHITc?=
 =?us-ascii?Q?vugktCa22oAbpeDiDx1C86EgZ3WckOFpi3ayaRXdk1SQzwrbfFbx0daWvgLu?=
 =?us-ascii?Q?b2BRSvIBt9j6ARBIrxJkd0CpS//3rIcAVvvd4YR1Ms1HrwRt0Axk2b1eZxlu?=
 =?us-ascii?Q?c6YkEtXJZ1TpYDUxMKbAHK5q9OreW4bbhOXvb8gJio51NuZ07MHEYAE52KJp?=
 =?us-ascii?Q?Kyle72gt68t2VVyOtMluZEkoAT66ZsG8sYr2AJc44zYkjirOg15p5McaH3yN?=
 =?us-ascii?Q?xh91FudUVWmDWjoMVblvdhongc28L9OhfnhOMQFQ/5060PQbZwAvia6AZ2Xl?=
 =?us-ascii?Q?BRnjWlBF1amngvShKCUeT3PcYk2vcxaq+UWMlrRoYOF3kghrI7KJlL2i8Xx0?=
 =?us-ascii?Q?gCfOnL85P1x5B0gBoT98wQZblUBvhungx6m6U/5WIu10F9A8194RgzQq+XpR?=
 =?us-ascii?Q?WZVmS9IfWfqB74a7z2/uWLU8ptVjdvZFiGKnFqKviX8dA06BwHw8GTunNiTo?=
 =?us-ascii?Q?6d8yDhQAJVz7eK+k645Takeluxqkg4ZkChWRes0BpS8SxsIaCkGZlOrvveZh?=
 =?us-ascii?Q?AuJL5HnzfMSR2QmiHviXdmDZN0q1mPmOy6LOHl7tZ0P+LRUveQERTeTrBRHz?=
 =?us-ascii?Q?xIywSVhl+0iPkj6WYveQ3qjId6EsWm3irnUSM/3pn6YWDlmb8DERGLwD2kOv?=
 =?us-ascii?Q?9peqC9I0SUwSN/vmAyty1MrwpvG3Kcn5E1CKVvm032+gX6aw01m6TCct3/5r?=
 =?us-ascii?Q?Zqslv9Fze4znMmRkd/P2wayK4th5eLc2Ru/LiCbamZauX5A3o9f97l092S4h?=
 =?us-ascii?Q?1Z9ry8FcD+TP8n1+DiEo/mY1QEotMH6EMjc4jG8P?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed04b1aa-0706-45fb-6f06-08ddf454309b
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 12:34:18.9505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0bHomvvPlKCs3sjlvF8JHWZvNswJSFOlruQkFMDmfIKGClDX2LYks7S6KWeL2iBeHOMA0xDyga8kDRF0z2sf5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6164
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

On Mon, Sep 15, 2025 at 02:12:00PM +0300, Dan Carpenter wrote:
> Ping?

Sorry for the delay and thank you for the patch.
pushed to drm-xe-next

> 
> regards,
> dan carpenter
> 
> On Thu, Aug 07, 2025 at 06:53:41PM +0300, Dan Carpenter wrote:
> > The xe_preempt_fence_create() function returns error pointers.  It
> > never returns NULL.  Update the error checking to match.
> > 
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 432ea325677d..5c58c6d99dce 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -240,8 +240,8 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
> >  
> >  	pfence = xe_preempt_fence_create(q, q->lr.context,
> >  					 ++q->lr.seqno);
> > -	if (!pfence) {
> > -		err = -ENOMEM;
> > +	if (IS_ERR(pfence)) {
> > +		err = PTR_ERR(pfence);
> >  		goto out_fini;
> >  	}
> >  
> > -- 
> > 2.47.2
