Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDEEAEA170
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 16:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A7A10E8CD;
	Thu, 26 Jun 2025 14:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TavUl+GD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B483A10E2CD;
 Thu, 26 Jun 2025 14:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750949716; x=1782485716;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YjHoCcB9EcPr0ZBc5XyzT1vsKNF4pyXLqmZiliUuULI=;
 b=TavUl+GDLqvIF6YdzCmjXWc2o95Wb9ATw5A6ghOHsW60JJpmPJBMArsM
 AbowVK/0X95ye4BDgOGhW8mCE92ZWRQsUt5KMXa7Cv1pFayCed0Wfe+wu
 WSMvBp7vJ4Fiu/j29hNbXw19PPCihvvy2fNqTauLgi4RDbJocdJAL7yeZ
 21/EHcBqSuZyUWA8/0k4QRPk/70uWTX8It+0mcNEy5zmLDwn/GbTBqwUG
 WBH5jixhayUfrAGSv3MgNfi+ltYxZFQmgbZ6TIA+txm+96rh2S0OP+hXN
 kWreX1F5DI6mZsxoPQElQArT6NGkU9RdFra0TmyIn6JprV7ZDPjGWO6E5 A==;
X-CSE-ConnectionGUID: K12Wal+DQdeN6Vnb8oh79Q==
X-CSE-MsgGUID: q+1carenT/Cdje2ZqSE1Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="70818938"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="70818938"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 07:55:16 -0700
X-CSE-ConnectionGUID: Lm/zZcE4T8GO8McLmhYGLA==
X-CSE-MsgGUID: AsL0/IwHRZiWUhrEa9XOpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="156917700"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 07:55:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 07:55:15 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 07:55:15 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.63) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 07:55:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GeWT1ZrVxAZOBA/BKGzv2LwlrfH9ClTfvZL2b4BIgvVg0f5yZKx/tWdblixv7ZtqANUKG+9fNTHdTi8LZOdTwJn8WxG1/JV6zi2DQBr5lGcM0YsVW7F2bqPvjeVUNISm/dYYC+z6xNxsaRrpk7bKOsDZjbShqdWCBEqxBb7U5yiEjF/pbUT4dKBEFnMnwH2Wkr8/zLEo/tWuGaJBYXpkxkhkitOY69ASThhE8To7alZKAJGixd0VduD7685AqTGuKzzC9tXoctxmIy3wFZP3b66MHfnqgz/0ptCBkBlWV+JlS9/rm7UfY8coEQV2thH9TU2P2mWAqSCx2jzUiGGrRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4nt0w5J1lVZy5NlQRP376tT/yAJXpdbhwShgzC/V/W8=;
 b=zNDdgHjhkydDbTES2EHVI66yRXEh87RHVGhi0knSKlcwN0+wROIbQ0MUfonsRjes9cYNQO1YKzAV+lxjptTJRCoMB9QsZzWV23SQTCrfs3Q/+79l5EcvudOkym+E4cXJAPKuTmwBg9p39YEyXB9SxTdB6494i7rKeNuhRgluat4ZjS86QvUNms4cCATpXRqirny7LxdHP4nfwJ07dDyLYZcT+sVvznD6KlzzAJbs89zOpmXy8EeeWAzRd0CXQMtGkE7WtsZmOkBRpwAyJZAaQOCRNiYDfS3DmbAZN8jb81JG2/JFQhC2DIYL0u5iWPvaWEYYycdLk5Y5Y0ocgHeckA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB6243.namprd11.prod.outlook.com (2603:10b6:208:3e7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 26 Jun
 2025 14:54:59 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 14:54:59 +0000
Date: Thu, 26 Jun 2025 10:54:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Frederic
 Weisbecker" <frederic@kernel.org>, Chris Wilson <chris@chris-wilson.co.uk>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH v2] drm/i915/selftests: Change mock_request() to return
 error pointers
Message-ID: <aF1fPx1U1f1h8_7F@intel.com>
References: <685c1417.050a0220.696f5.5c05@mx.google.com>
 <aFw0VyNuV5twrHIQ@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aFw0VyNuV5twrHIQ@intel.com>
X-ClientProxiedBy: SJ0PR05CA0129.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::14) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB6243:EE_
X-MS-Office365-Filtering-Correlation-Id: 970f1bb0-b684-411b-5fa8-08ddb4c16c3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G8LtRyOMCB8ybaA4ssqXrCKy/lbDbbl0kVxFY5sGFjrYPx2ycHyTJntkr8ca?=
 =?us-ascii?Q?wI4D3W0k2lWHEsIeT65cI0WtbMhMPjumOrP2MqNzgzc2PiRB0fial5J7nChz?=
 =?us-ascii?Q?iibc5S+TNfgnM6erNV09EfPP/V5JFKq7g2Cq2ji4k9MN9CBfVIw/mD/wISS3?=
 =?us-ascii?Q?wMo/78xKePnaMt8n9t8HEgU2rCKvnApY1sK2nPimWF2V5A4yMP19L8yQe8KE?=
 =?us-ascii?Q?U95s2bJtggqF2b6sY84rNxaPDTG1lRPbESqbp067xe1lKft4H6DFlf8KLUjr?=
 =?us-ascii?Q?5CPZwB4tufpzE9WvHDTGjddi8q0w4XNoR0lr9WrOZssdaMTbHoViKRYj6mMf?=
 =?us-ascii?Q?sMI8WDY1PX3lgbiqa1AoFVoACHFeRuFkHwBGBsEXHvqHCR+Y2xXufLo8HOLy?=
 =?us-ascii?Q?Fw6l9YkROCQTxehg+y2JDW0n0pJxZS9rJHrkqXf5/V5kYAHQx5tmZUDrgXp+?=
 =?us-ascii?Q?AMsLjivzwpKQCy9h5xY5vLIpgGG0U7n6C9HKMq07Y4o4B1SjlDXcS2NZ/Ltc?=
 =?us-ascii?Q?Ypg2tET3U9Uu2B+fiZ8mNAPP9bb5K/ADxVnyujeGB7lYrJvvz+vosGtqioGi?=
 =?us-ascii?Q?ouMcwBjdgwQ2OejrSl0QgaauCeRqlLx2RI46+bhiP8K9XgrHHNMHmpMvhsIo?=
 =?us-ascii?Q?4QImpAf+tX1hTy+2z/0GfAJZgm/qOkzt7pOac1RyZ3aZyB/hsfMVtWstnFhJ?=
 =?us-ascii?Q?nOR/AkPHVjEr1LfyPJO+otB+HQVT3dHnfb3UtRozpubLuGaYe3uMCu1DzMf+?=
 =?us-ascii?Q?zWx28xiakvOqrXAxkIKPOLUt6bgBB+31RAHF0V75X23gwVmoEs1xytwEXAZa?=
 =?us-ascii?Q?kh/4uZU4jjjs74mu7p21c46/KBRkBdRm+UYFb71SQqGYpyI45vVPPeJJjwzK?=
 =?us-ascii?Q?yDoNlI1cxjY8N9QeYtY5NK7bgBfRlstG3JO9T+ODn8OKCBKnbXn9LfUs05YT?=
 =?us-ascii?Q?7eMrog0231QGDLtlC9T+xE10uKNyOw1XehwAdWYdq7Ekh9YPBkPLbKs4LXxi?=
 =?us-ascii?Q?xhUecS4KyLiDUg9DLWd0EHvjm6eStIj+T418l8QRHFHnVPAQ3eTQeGXBeX0k?=
 =?us-ascii?Q?VDCHwAFqvxwWE45yTkKJ1ZsXurx/TVuzEr0Dr3Wh/+3XB6zF8u9ajwQmHVCl?=
 =?us-ascii?Q?sbP16aRzDW2c7hnewkVAHD69jn0ONiGPPdnOLXRq1HCzbYN0m49epee1mbLf?=
 =?us-ascii?Q?gcMRhbo4J0kgTsxj5G0OFFJ+wEKQpNIs5F6n091KmZNtQkT4v2rPtKzSgHos?=
 =?us-ascii?Q?tKZTV2dvg4M6t4RXWAOpg/dajYG4L91dkZFKMs9hOyk1XPWHdbH9i9aq+4fb?=
 =?us-ascii?Q?EwYXxSeTPaafpYj7nsqWZpedOmOdGJL9NQk6sGljHHTts+AT2Oih18qYmeSI?=
 =?us-ascii?Q?C61yH6861zHTQ6jHcjzSBS5bHBlzbUdtQk4yAUY6orSnj9MWg7J56K1FXegE?=
 =?us-ascii?Q?QnKhjsIIwas=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?irM27ezjh6LLALWShwlVA0GvQZjkJJTZ0IWcx6pWB2R3QCnIAt/gQcAiZrgp?=
 =?us-ascii?Q?Cn++TBfzPcI+I80amZOjL6sgyiJ4PcRf0/GOsd0bgp6mbgGAm+M48kBhwpKy?=
 =?us-ascii?Q?zTryQNW7mSvetppufeKpmUQ31Np0V6jdZwzEkmQ10Ev1mlu7Vy1asm9tDsZr?=
 =?us-ascii?Q?mUZKtoNzwg6WrlFK+ArE4ULBO0UwHTyvTNxoKxKkW6repI8VmpZGoCD6WWiL?=
 =?us-ascii?Q?Apc0XZpalyHpfTHNcV2d3qi21HJT0R1jC+oSY7p0Fq/5lISU1L8HBwO0FYyU?=
 =?us-ascii?Q?4dCOk4LU9O/gU2kF1fjSwVRUsD/QJWjZ6dOgjDHV2P+cI54Etf/gaO+VFJvk?=
 =?us-ascii?Q?KZym3HLoBuRVrok4Ffkq12Hb+RlzHCHzGIECivft68QIy119mGb+69LJRJ/1?=
 =?us-ascii?Q?T0LL2rK0+OtOAbAkAKb3qtqTgupLi8/sC+UuCre1bVCJX5tOgec0UCHfGtNA?=
 =?us-ascii?Q?yOrb+xBL/+0tUeT7ebUPcYOyiQtjcpYF3Abs3bOm8Yk06MmLk4NaSENRnn8x?=
 =?us-ascii?Q?S18QJ46TkmRHCgPZJRnLW3tjxHogiCisgzmWVUdYn0Z3I0dYqO4NKfZ+oIIA?=
 =?us-ascii?Q?mrjtz+4ey4CBC16lvIdKKvXSunJ6HyewKcKu2jSvOUY9EM7vpXpeBb1PFZ00?=
 =?us-ascii?Q?L6y0H2Kft0aAUWRK3YiFTKQKYfuQnelf6YzGBgvV62b+zmqPR94esZ41rjyU?=
 =?us-ascii?Q?TSoP2fHYotQph0CfAY4yR3+Kyf5IjhrRVh5kzg9ZOEABouBHjFKlMZ6Q6dd7?=
 =?us-ascii?Q?OXVSyMpB228BkpgfXhJN6fXd/5ZuT1Kfa1Cglevb2XezhHr7vQcBiG4x+GOY?=
 =?us-ascii?Q?ImNEx5LESbY+AHCXj89fsC1WNaBK5TrKFa8jccoyLPkiurOXlERdLIvIthkI?=
 =?us-ascii?Q?PavZHj8FXGAFMzak9Kp9SLcDNo13MRrjTGkQR8D4JgWpSKhTEq31AWc7k8L0?=
 =?us-ascii?Q?jBBTb4qD0LnkFw3yryxziWrR3i3wH79/brLGtEopJTdhhJoc3Jq2zdv45Bn0?=
 =?us-ascii?Q?VwZHzEGqedPYshinV5PjCvt04uyhvblsBEigpbpVCCVjzvx6plhksSbI1gm6?=
 =?us-ascii?Q?rDgZrY83AZdXxAoi4BqQIwX68+YNgBOjyaQ6rxWjdaQkUIiDaC223WaF8RcI?=
 =?us-ascii?Q?1UzyAdgLXwjeejWip1jS/0csuQGGH0P4CscaMUs/0m64HZSGIapCkYpZRKRw?=
 =?us-ascii?Q?UJxBVQbJOomV2wpHqoaTYwTF2yJvK7KZzJFP+Lg7FjJh9S9bu/E1+Aq5vphU?=
 =?us-ascii?Q?FY5sfuIWOEfdhNwqi/ldZ/98p9qiZ4VTqzUleNu3TedvL168oL6hfO9EgnvW?=
 =?us-ascii?Q?TYr6GLg1ykEUn8t3Y8K/8CM5tXZypdBFEhg+LwQ70p8NWRBdAx2RG8kY1yvF?=
 =?us-ascii?Q?k6+5+xD2e3pVdzu2SjcICzcZAU8fGFc1c7rncLWDqCZXhAHlale3a9Kp5O3T?=
 =?us-ascii?Q?VOlne4Qe+7U63+dVbZkVSsUlB1mUoyHCmiVRMWBI9fp8EJ9cJI6hXdricrXl?=
 =?us-ascii?Q?qTQ7nixtJiP0lHjWWQYKx+VARqoJXnK2tsWBY7YoLUd3YOPfeSqDvjVok9gn?=
 =?us-ascii?Q?trLnaCDg8lv+yXholD8D3Xf2cwu2syWda+WFq7aO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 970f1bb0-b684-411b-5fa8-08ddb4c16c3e
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 14:54:59.8083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zr0NsQ1lU+w2ieVgrhU4JmXu8wQSJG4/ZHMYO6oeloNMNS/jPW8G00D2hjsJQInGmGf9X6v4BHfbvzVjtYXZyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6243
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

On Wed, Jun 25, 2025 at 01:39:35PM -0400, Rodrigo Vivi wrote:
> On Wed, Jun 25, 2025 at 10:21:58AM -0500, Dan Carpenter wrote:
> > There was an error pointer vs NULL bug in __igt_breadcrumbs_smoketest().
> > The __mock_request_alloc() function implements the
> > smoketest->request_alloc() function pointer.  It was supposed to return
> > error pointers, but it propogates the NULL return from mock_request()
> > so in the event of a failure, it would lead to a NULL pointer
> > dereference.
> > 
> > To fix this, change the mock_request() function to return error pointers
> > and update all the callers to expect that.
> > 
> > Fixes: 52c0fdb25c7c ("drm/i915: Replace global breadcrumbs with per-context interrupt tracking")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > V2: In v1 I just updated __mock_request_alloc() to return an error pointer
> >     but in v2, I changed mock_request() to update an error pointer and
> >     updated all the callers.  It's a more extensive change, but hopefully
> >     cleaner.
> 
> Thank you
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushed to drm-intel-next
Thanks again

> 
> 
> > 
> >  drivers/gpu/drm/i915/selftests/i915_request.c | 20 +++++++++----------
> >  drivers/gpu/drm/i915/selftests/mock_request.c |  2 +-
> >  2 files changed, 11 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
> > index 88870844b5bd..2fb7a9e7efec 100644
> > --- a/drivers/gpu/drm/i915/selftests/i915_request.c
> > +++ b/drivers/gpu/drm/i915/selftests/i915_request.c
> > @@ -73,8 +73,8 @@ static int igt_add_request(void *arg)
> >  	/* Basic preliminary test to create a request and let it loose! */
> >  
> >  	request = mock_request(rcs0(i915)->kernel_context, HZ / 10);
> > -	if (!request)
> > -		return -ENOMEM;
> > +	if (IS_ERR(request))
> > +		return PTR_ERR(request);
> >  
> >  	i915_request_add(request);
> >  
> > @@ -91,8 +91,8 @@ static int igt_wait_request(void *arg)
> >  	/* Submit a request, then wait upon it */
> >  
> >  	request = mock_request(rcs0(i915)->kernel_context, T);
> > -	if (!request)
> > -		return -ENOMEM;
> > +	if (IS_ERR(request))
> > +		return PTR_ERR(request);
> >  
> >  	i915_request_get(request);
> >  
> > @@ -160,8 +160,8 @@ static int igt_fence_wait(void *arg)
> >  	/* Submit a request, treat it as a fence and wait upon it */
> >  
> >  	request = mock_request(rcs0(i915)->kernel_context, T);
> > -	if (!request)
> > -		return -ENOMEM;
> > +	if (IS_ERR(request))
> > +		return PTR_ERR(request);
> >  
> >  	if (dma_fence_wait_timeout(&request->fence, false, T) != -ETIME) {
> >  		pr_err("fence wait success before submit (expected timeout)!\n");
> > @@ -219,8 +219,8 @@ static int igt_request_rewind(void *arg)
> >  	GEM_BUG_ON(IS_ERR(ce));
> >  	request = mock_request(ce, 2 * HZ);
> >  	intel_context_put(ce);
> > -	if (!request) {
> > -		err = -ENOMEM;
> > +	if (IS_ERR(request)) {
> > +		err = PTR_ERR(request);
> >  		goto err_context_0;
> >  	}
> >  
> > @@ -237,8 +237,8 @@ static int igt_request_rewind(void *arg)
> >  	GEM_BUG_ON(IS_ERR(ce));
> >  	vip = mock_request(ce, 0);
> >  	intel_context_put(ce);
> > -	if (!vip) {
> > -		err = -ENOMEM;
> > +	if (IS_ERR(vip)) {
> > +		err = PTR_ERR(vip);
> >  		goto err_context_1;
> >  	}
> >  
> > diff --git a/drivers/gpu/drm/i915/selftests/mock_request.c b/drivers/gpu/drm/i915/selftests/mock_request.c
> > index 09f747228dff..1b0cf073e964 100644
> > --- a/drivers/gpu/drm/i915/selftests/mock_request.c
> > +++ b/drivers/gpu/drm/i915/selftests/mock_request.c
> > @@ -35,7 +35,7 @@ mock_request(struct intel_context *ce, unsigned long delay)
> >  	/* NB the i915->requests slab cache is enlarged to fit mock_request */
> >  	request = intel_context_create_request(ce);
> >  	if (IS_ERR(request))
> > -		return NULL;
> > +		return request;
> >  
> >  	request->mock.delay = delay;
> >  	return request;
> > -- 
> > 2.47.2
> > 
