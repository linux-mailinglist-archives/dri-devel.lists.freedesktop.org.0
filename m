Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A7AC75B0D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 18:32:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB26210E79E;
	Thu, 20 Nov 2025 17:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Spmw8mgG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA4710E7A6;
 Thu, 20 Nov 2025 17:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763659963; x=1795195963;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7ow6AaSQB9Mf1qMtnxvrgIE74Tqpb2/4xaCy3kqdsRU=;
 b=Spmw8mgGpPWQKSghVsHcSllymte/v5n55fGyChnxsaxertZRCvsSRLzk
 hVcUQDuW/cLw7N++5jDF4bVjm2Gd58x04grj/KMZ9G2T3/UFcJvAgchsr
 1RKvUCZFwQRT/mkQkvISlbXc5ybSRp8ogY0qm+tZlH7jeKvUzJZFzo0l4
 VGt1lTpRMFXrigGHROtCvm2NmbadvnqbQ8hFJ7+c/9kzACE+BlGqjcqWJ
 HkkzuLql4oIQekLqLTFYWBaBRdZNkkyf+cG3GPhyclIPH+xswMT2VAEl+
 YLiJ40z1Ci3KK8d3DQxreElUf2e7E1+qhS8H3EpMv+gPKcLwgyo0mchUs g==;
X-CSE-ConnectionGUID: gYcvBVAQTPGSLIXb+W+dQA==
X-CSE-MsgGUID: uzPrsiemQhiZZpClkbOoTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="91221048"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="91221048"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 09:32:05 -0800
X-CSE-ConnectionGUID: c4hSo2D6R/2CM3TnJ3QuLA==
X-CSE-MsgGUID: A1biKxK0RAOYqtAnCIrf0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="191239425"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 09:32:05 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 09:32:04 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 09:32:04 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.29) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 09:32:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2m79Cj5KP220vaguqwoVFuuAmNcJv2mMWuHV/wS/9hTiceX4GDcNcQ4iv5BSiYPGnm9XBQCzbGg/4DCenBIFQMYBHmFy2xUGyMH3xv7p80k6qiIpU5QiVLdITjEGrdt+8jVfMpHlqoN32f0rns6sQWWavFQAR4HbzX+RT1X2m7BJIXA+pBg4lgwj00Knm3TmyGwUl2/kaHfAzUaka0/VCOCfbvJLpXWaWvXg5zVVttgFzq3AojkeEnVP5odcrcni8gW5pCM5JpqVTZW+VHTdTzxotvM62UgGCR0z6jqxPBWo6mSMRoH9S/wiP4Ay/gWJSSXMUK9XPyFkPMRdDTzaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/gSC3bG4tsYEe5/HN2yGSBAm4QKrfBe3s+MKjG1aLw=;
 b=cnzeH808PSsTFrVfy25TctXEx7MXAqivi7O5QEM7e/zaP2DOD9XA8ToXBF9/g6L8g4brLSVR7BWn8NmxCAF1hvvr/f7FRhvgooO+Lxx429qF50Y2GwM+0vKtd2mAUl1CbzE+xKy9Gp4pI4qvI+5izK/1Kg/yYfI77E3MHaOzoAjgvVhQUe34EYaZpxrEKsMLb0cghsXzR0t31Wv7IuBHEChHz0+P+P2Pq9kU46Zrd93vYsz6Ryxuhq7Wv5UWRVJ650+a0wSvp3cmEKV27RFUdYuWhYFVRGXvjKYeLOKYVDz/GAoffnpmdjWyv8M93onkc5VBYu6ghVtQNi8qsOP3tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6894.namprd11.prod.outlook.com (2603:10b6:806:2b1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 17:32:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 17:32:01 +0000
Date: Thu, 20 Nov 2025 09:31:58 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <jianxun.zhang@intel.com>, <shuicheng.lin@intel.com>,
 <dri-devel@lists.freedesktop.org>, <Michal.Wajdeczko@intel.com>,
 <michal.mrozek@intel.com>, <raag.jadav@intel.com>,
 <john.c.harrison@intel.com>, <ivan.briano@intel.com>,
 <matthew.auld@intel.com>, <dafna.hirschfeld@intel.com>
Subject: Re: [PATCH v26 1/4] drm/xe/xe_pagefault: Disallow writes to
 read-only VMAs
Message-ID: <aR9QjgvKcmKPhB3u@lstrano-desk.jf.intel.com>
References: <20251119195322.86585-6-jonathan.cavitt@intel.com>
 <20251119195322.86585-7-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251119195322.86585-7-jonathan.cavitt@intel.com>
X-ClientProxiedBy: SJ0PR05CA0076.namprd05.prod.outlook.com
 (2603:10b6:a03:332::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6894:EE_
X-MS-Office365-Filtering-Correlation-Id: 590248a2-f37b-4e34-5b7b-08de285ab6b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RHKnLReAYPe455PS7vuwFFx0VvmBHAYuLUGJUOSd5G4SVFAglB0YgjmJAoii?=
 =?us-ascii?Q?gakuQx+N6mXMppvmwG2SR/M3XQIrdlZ2nIeAhknp/W2icOin3P3r+US+G+KT?=
 =?us-ascii?Q?HJR28O0zQSlNGGNbZwUOHThQFBCPss8B9dKmSG0JAtUBhBtOzqYWHzKBoA53?=
 =?us-ascii?Q?DGfMLsltl+xsP1FDghbRQBmlrfRArcAPpCDfwWi1QdLZP/Vvjb2yvAHKijnS?=
 =?us-ascii?Q?DAilcOeNXrHfMFV28anaMuTSFQATQQskT9Ko0wL827iMhgUb2tUQd57lxc/J?=
 =?us-ascii?Q?9r+pexLJeSL67UQ5n0KEbyt+9NQdQGm+u2QJXPam3rFHJsubno7DjRuVI0EY?=
 =?us-ascii?Q?AIG2r+pf0NyD7y+XbJ7YSiOFYbzjIKNQDPFUGl+AN1bqcVZFMSNDt0qaZSpB?=
 =?us-ascii?Q?3ZMyusHtiIMlRJ0p5smlC7lKYe+sHwdQ18dgn6wzkISiVCZmg/rZxBc2zJDL?=
 =?us-ascii?Q?T4SreSwdzvYGFc1XbrFlB8X53N3cVZ1bxdiEfnp5kS/7mVO/O0siFom3D6QX?=
 =?us-ascii?Q?v4b+E1tBLy/5U0nFV8569NqPQP7ukowuJkWo3ennzWoWzIiqNAg713GP0XP1?=
 =?us-ascii?Q?JWyNXPVJGBayNwS6jzPgwraY7n6bmPdwP8UmWXj9RdJXG85bWpa/U8KCgnsm?=
 =?us-ascii?Q?FhWZTZp/QtTOXpEN9nvmL87mB16arbwF2gaTE0TKHWinai0rQoOfBg9MzCP0?=
 =?us-ascii?Q?WxIRXzh1gm3slSA80SxF6IsEMEZnV2QT9ufmYqFzwzYps5ddjRtNIWYrPv0F?=
 =?us-ascii?Q?EEz+FTZPmwYpvd7ScU9CmqIrgVjKUZHL2hVZtA/g2471BX4THP1JCHl5x2KC?=
 =?us-ascii?Q?Ubgd7afpi0cGI3lvg4QdHpkg8cVqsWRgHqROMoOdVbVzxduM15Jj2DyOcCUh?=
 =?us-ascii?Q?1HCnh279ttFZDZKvJAhQHs5yViR6VtOd7iI1C1TwjHE+vZcxZ3eqX+JTYV54?=
 =?us-ascii?Q?MAvNXuQ0xnJl6sed1Nbz0NZn7nGB/3zSRhVDSkXmyNA54O8gPO5OWYUfvSJw?=
 =?us-ascii?Q?8PXRCrUM2gdpS+aPe5Pqp/6NSeSgy0yvKtK/nfEn2nJ2yW/GfH9VJAuP8RDi?=
 =?us-ascii?Q?jc+tIoinF5HPkhBjiMZK2l9Ak+2oXXmYrOKR8fdPWY9eSPSL6CAUKp06LUgb?=
 =?us-ascii?Q?AoCs2ASTO3ithsO0IxxutZgDHJw6RnQONej9P0FK+ijAITJyj6hfLBn2UAWM?=
 =?us-ascii?Q?5Cp81IA/OcXPyl3Cs0Vn+LQfRHOF77gNsBBx34RB7wwlRa2KBIcCWUvTky41?=
 =?us-ascii?Q?cqYBI2Tgd5JKWqYTLuMpgiBV25xTG/K7ejCWsjGM+r6mO2K2O8EevW6Bik+h?=
 =?us-ascii?Q?uZzOQS9FZwWrs1BU+qjD013FaJOEYhQ6YPQOirK7xW+AlLQpW1rQend7l9GU?=
 =?us-ascii?Q?ac+YYkWNAClTN4fWcanjyRtYtEUsIMKdNq1MPJb4YFyF26z+SRXTMHjK9yRp?=
 =?us-ascii?Q?1pORuvv17AjFk+KuCqZlVghz62ThEKas?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oEGwL3Y/L60rWdv3onRZq4rIvoxOq9AE7xT3Jc9JKAH3CcglPtbwE4KihDOx?=
 =?us-ascii?Q?0l9Qi+Bc59ZW6EiHN40eE7xKXKFuNJH7vMyAKohBHxfR6mUQZ5xM8A5cZ2xd?=
 =?us-ascii?Q?XVsTOuihQ2LT4zkkU9YMotg2FygMc3f9HbNS9PKQhZSQbx+2JshBqHWtxuB5?=
 =?us-ascii?Q?Mq4cq7QLCH4+D7VEmrD6Vzwpe8EIC8GbVsq9fw0lvjildS1GoilI7QfFTwSt?=
 =?us-ascii?Q?VtvHVB/8txd3r1lQbJsCr/OkrsVTuDUBgoBbGL3rTE9hbzAH+9+tKU16UMR3?=
 =?us-ascii?Q?TlduZWFsczh+D4FEQU/ZJgv4HWkzt8pzIVcNbDJH8AlEuEMlGm2w5E4jGS1t?=
 =?us-ascii?Q?eO29WughTKFJn4SnQvdS7iRFOHBsNtcWhzH0CB4pfcu5rjUmJTeR14+L98pm?=
 =?us-ascii?Q?6bGYRO543xSNYFSeGvkIVZGBY9dfxnfDnd9rtCydLWD9FFYtiAhjUSC48nz1?=
 =?us-ascii?Q?DF8sYDZw46F0OPTcvEmBBm310dXOZ432jOa8LpXGMeNermgvGGiu9eeXLaqh?=
 =?us-ascii?Q?Aiir/MVrsMrnHRWH4oIWru0kf12bJrbym86XqMi2DyOA8JGpdByijFi8CWjB?=
 =?us-ascii?Q?8xdczvsZpMIRd7q+An56QFbdNDEWe0/2thDZbJ6MSgpyKhrZAUmKBm9fxj+e?=
 =?us-ascii?Q?k28jvwEytFy6qhehzwasQyuOn1MIDlxqNcrOYWnyZi3wc9Dhl6lqfpogy4H+?=
 =?us-ascii?Q?ac/UO3uQCYU1dsYyzGBvrtWF5kNW1tIqCaFoIiKGQ3G3aqOwMGxLQ6LRZHYi?=
 =?us-ascii?Q?YENtN5Z3stI510ed0wXoGi3sk6ms6IIBsT+ibiOZWhOW1OA+vDopk+HGppHm?=
 =?us-ascii?Q?55+0fOo8Xu3RF+k9yPztSDyor7s6QMJXp5CyYFsYblim7DIUC6w+Vd1AVNEQ?=
 =?us-ascii?Q?z9eTpbgoOuHnV+uIRG4v0lHYFi4Wo+pH1r4VNpaQDy7oOWpkW2Xv1I0gV7Ou?=
 =?us-ascii?Q?1dQIDl8JYM4WGN+2Zf4iLFBKffV7xYrKa0o2zc/P7fqP01QQ0QPcDFhUxezH?=
 =?us-ascii?Q?FaxKSSRSR7Acx60wl4QCddgGlwkRyzlmzwGjvvzT0nRfAE1m3h0yQP8pof2K?=
 =?us-ascii?Q?P62ShD0WftU/77oFBcFd6smcl2MJzfc5X+FsCpf0p0xGhdhk3BWv0rT8AwJB?=
 =?us-ascii?Q?oOG+rgaei4HYf4QMtatKa76JNqxYVksA00tiP3azjcwSw0A1tZt0anlg7P/4?=
 =?us-ascii?Q?NYsYCIeBQQZBCaJzJ55YT2uNAwnX8dK9BRjHBUU11ESpQ19VzSZ5Fz1oPMcH?=
 =?us-ascii?Q?UOAWphjJjLzl0TaVtNhL+wp5I8n/k/E8uB2OP8gJ7KVSPmyjXBwnNvyLADXM?=
 =?us-ascii?Q?60skWbSIUI6qe7ZDgbcjbsKGr++hyxjoqoxGL/M1F8DuLTJh7avJHatgaMKs?=
 =?us-ascii?Q?vs/erGaQZH+esEd2LC7ZLcUw8orEgOVxcQ88SNNCM+1/eVKgQ1ggC9WByYxX?=
 =?us-ascii?Q?ZivKgTNz/qz6iOOwrUIlBwaAeZG/Mare8toPcVYhH8rXBfIZCTaKFInwT/Nt?=
 =?us-ascii?Q?UnSoS1iai9m/59uB+pNCOu6pmx7zeZTcgivp/fx4sQxAt6ffamumNrmfs+LA?=
 =?us-ascii?Q?PW0KRBWSz3LqnkaIlWKc85i6rdH0x5gmy3phdYGlYA3Ow/jOCgdFqMWbxNS3?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 590248a2-f37b-4e34-5b7b-08de285ab6b4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 17:32:01.2871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ht/zzFRQBMcpP6yV/ZAl7L9P3gGlVNyFJpILQTeJ5gSylWH9qy9ZdUEgy5WAxluzrVzSR2B+kSO162aXYXHT4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6894
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

On Wed, Nov 19, 2025 at 07:53:24PM +0000, Jonathan Cavitt wrote:
> The page fault handler should reject write/atomic access to read only
> VMAs.  Add code to handle this in xe_pagefault_service after the VMA
> lookup.
> 
> Fixes: fb544b844508 ("drm/xe: Implement xe_pagefault_queue_work")
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pagefault.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index fe3e40145012..836c39010f02 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -188,6 +188,11 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
>  		goto unlock_vm;
>  	}
>  
> +	if (xe_vma_read_only(vma) && pf->consumer.access_type != XE_PAGEFAULT_ACCESS_TYPE_READ) {

Nit: Prefer 80 characters per line if possible and doesn't made the code
super ugly. That really is a personal preference but all code I author
(this file) tries to do this, so prefer to keep that way.

Either way:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +		err = -EPERM;
> +		goto unlock_vm;
> +	}
> +
>  	atomic = xe_pagefault_access_is_atomic(pf->consumer.access_type);
>  
>  	if (xe_vma_is_cpu_addr_mirror(vma))
> -- 
> 2.43.0
> 
