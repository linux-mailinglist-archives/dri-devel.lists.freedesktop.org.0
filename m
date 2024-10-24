Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8161F9AD96C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 03:51:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC0210E886;
	Thu, 24 Oct 2024 01:51:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YrChBYHo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611A210E249;
 Thu, 24 Oct 2024 01:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729734675; x=1761270675;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hR9fy0/fBYasCrzTSb7TlrhDKG6ASpw0mgsxoKOtVNE=;
 b=YrChBYHoi/V+122zWlrZp4VRuzmYKIMTMFyLP8c8JAnc+7Y9Z3s1sveN
 ujXIYDYui2Ffq24pHmesjxOHWRkwZB+WfpEaFjzB0TiHhzg2/pvfkRYlb
 ga39YvfUtED11njLYt/F8ntE4TkNHXZk2sNTeU40+sdSfAZBcIWKAh4DL
 TeJ0jr+VFSlc0SJ1Gsf5xpwqVjFo3hGMb0DVHQfd1lqt5Nmg/8O2Y7JO2
 y42o+3Uh/HDnGG3W+KO+4GPIaFQfJSgjPgZZsocmwNiZcuJeuDRxkRWwc
 4cWzV4PrhZ9qpdOy8p97uLSmO3MFhHFuaEu9LniAwolyvh3c5RmCvSTeQ w==;
X-CSE-ConnectionGUID: BfQ0TZfrQJi21vZAqJy0bg==
X-CSE-MsgGUID: /ZjRtDvbSvy/Xv+LcUwmFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="29453948"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="29453948"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 18:51:03 -0700
X-CSE-ConnectionGUID: 0jlzq+jOTUea4vmsY7jKnQ==
X-CSE-MsgGUID: KndqvzOOSbWfjZlyqwuLrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="85050415"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 18:51:02 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 18:51:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 18:51:02 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 18:51:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lg/UaFgowBLyyj1R/lTxiuKxYRx3S8UdguyUkytuQ0+2C5tKd4qxcHxkOYaQXsJkggmT0YLF/WO6P4RNkxpOwXmByFtoziP66p5fbNaM7xYWEW47krrehB8ZtPaV9bnRWVNSksuWaTuJvHRs7xZxPpYRBk+jnIgOGSS8FGQ1tOnpjF1mMtyF58IXlXpxtG4M6RK0m0aWGopTH27ch5kIAznCdE3qG9iHasJPNP7Fr46GkFIz1B1/9n8qCOeg5C97tjsky8TkSoLqw0247JV8SUrt9L82jzw5GjDa+2rQD1zjQqivCdwAQI/Kz9f300oNFeCMJNQrCSZQH5NLNBZYSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3V08m6r3WzBjX0++8EKZ6NWtT4iX+mrzQlb5pd3Yu0A=;
 b=XatPqFZCNOSXfIhOkB71AxvEdo7sTWMWK7ZdnJ1tsK31JG/4hMeVyBOtOuMZf41pWao5C99vFZgR1tsw+7AedWXq8ahJT24mQVP4dHisj8tf+FenO7CKmyQMOd+b00FCxenSyOgcbBt9fsluXXeI3kfMClGrwlSpkabS4aNAQqRI4IqpOcfUkfCizC6v+kSH13+OzMUFWTe6/xy59OJWIJSzvtTXTI4noI6N+kEvc4iVkog+/n30jPx3sXEha282GG7xXvve5x4TQ2s54ZCSqiC0BLzbQDO0sc+DBbPZgP1CLWxK8uoqnFM4vznV+M+BQmvDbOfUZpE9c+vqj0wV0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8590.namprd11.prod.outlook.com (2603:10b6:610:1b8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 01:50:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 01:50:54 +0000
Date: Thu, 24 Oct 2024 01:50:34 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <apopple@nvidia.com>
Subject: Re: [PATCH v3 1/1] mm/migrate: Add migrate_device_pfns
Message-ID: <Zxmn6uGSOgi11rO2@DUT025-TGLU.fm.intel.com>
References: <20241023233944.1798835-1-matthew.brost@intel.com>
 <20241023233944.1798835-2-matthew.brost@intel.com>
 <20241023182217.147ee87197b53d47057a4c06@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241023182217.147ee87197b53d47057a4c06@linux-foundation.org>
X-ClientProxiedBy: BY5PR17CA0061.namprd17.prod.outlook.com
 (2603:10b6:a03:167::38) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8590:EE_
X-MS-Office365-Filtering-Correlation-Id: f77489b5-56de-40c7-8aab-08dcf3ce4bd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8ePsbb+1Bc7bHJ2BileJ8621Y4NcwSm6iQYAW8jqleW5tpK3iY4/WAbcNbQi?=
 =?us-ascii?Q?E1jpW5bwafvqOOJfv0oAmIqLZyiFYFr7ijguag0I12QPdyDJ1lx9UJatcPL+?=
 =?us-ascii?Q?EAFcLq9P9yoIA0GPInJIOfUuYt8HpulXkPYX217lxDWm3mMjr9vXOj40BqjK?=
 =?us-ascii?Q?oHqc/2O0nooEL6f3AcMHNqYwKlnw8Iy0IkDKiE+Od7h5USXt6j9MyiHSsro6?=
 =?us-ascii?Q?7+m6k9EFvuiRrHQrncPZbOFBL0dMTRzFLaonTsDqWQl8II6i1sZR27+nUXFI?=
 =?us-ascii?Q?B5akrGSQPv2TkvWd+zsflg7CFhqW/anbW4kM5Mdu+GFiX6Ya1QqVWF8eeCDI?=
 =?us-ascii?Q?WJZ9EnOjQ5pxd43hRxAlT0/PN8xNhp1uqVeoMLs3Ce8LPot8Ymnn9yiViEJe?=
 =?us-ascii?Q?7q+u/tuYJntjW6DCr4jm438vqe/4wqRx82I2cbznhVtMlNDmhiXGaVQEsuiN?=
 =?us-ascii?Q?DlDUe5nYNjHx8pejCJtCqHsK8j7VwSN7nYseKhvCzA9ICnRPf2DO4P/bCPjF?=
 =?us-ascii?Q?XkPbkd6wMy1D9xBQ4CGqXL6R++UU68XbsgBXKITf59iLd8iZ9911zK1eqhAy?=
 =?us-ascii?Q?weSi8rNzkridvEPGZITcqmWagani2rik4HCUHUSgkw4s2gZ64Mf2LYwRY6LF?=
 =?us-ascii?Q?YhyVLSJI/gTmsXuWQo3i2/r5SfjpArkQUAn682ZUVe0y0VlpxNYCqsrAyKXl?=
 =?us-ascii?Q?iAIy30oR5BEUwwJ122N0RXstIic/K0tjTOwl4pAu7syBylRAbUIzqFs53bG3?=
 =?us-ascii?Q?/UPcB0cKs1U1LO/V3Kah/rEG5S4IZWFjr5rPX/kZOxMecrbYBMqn3gfnVsRx?=
 =?us-ascii?Q?lwp+XuqDo+3sQ6AP0scgAlye5BICYPd4PzjWv0DNu66VB60bF8/Ff5P3dpFf?=
 =?us-ascii?Q?4dOf4Ud034LEydxjCcNJ8n2oq7B8SQiHXbVckekeN/yGkI0gJN6vbVtiA/qr?=
 =?us-ascii?Q?gqXFHwAWfh8Uzd2j6sCS0jslL2NAhGsAqnq4k7stGau2YP4T4mmfbnRbPHDn?=
 =?us-ascii?Q?A96NJRrylBPzoAvOc/WtOgtK4zuuG5rMEb5miM6qrNasjBF8xgReEP+W7tib?=
 =?us-ascii?Q?ziPlMXPT+bpl8YQ1Z4m6xzUNlzxFXFnsiMqRKrb1semPEuCUnE6EhPg9Ll3S?=
 =?us-ascii?Q?G4If54ddWgHNT21yIubAzLXz9k0uzdbGVLFmhPsMSUXzLckaydTzFJ7zEwWa?=
 =?us-ascii?Q?l7+Rdl7gazZmcsMhsjCuz7imqh+S1pGK+VU0tv+KLbWqJhKiUkSuHxzOgeiN?=
 =?us-ascii?Q?0J0YOhmW1h6j1nGFJkWTNBLvdPnh26GcH0HuVZH5ec2WkxSjMGKzhjFbIHcz?=
 =?us-ascii?Q?10o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sJAm5FzM4HXImJfGLm0AXpz7I6qNGl9QcQ3HrtMl2K+DmIQFk33YAdQVo0GH?=
 =?us-ascii?Q?HEaXhYGBmMJSSgyJfGwMGT/24sgbA0gzTP/Rlb3eN8mZkY9iYe4ovFip64y9?=
 =?us-ascii?Q?rRlbKrW57ayAnOETCIZL3+ZPjXE/8iSm770gaWWLferCjYuFHgDux0ucuBjn?=
 =?us-ascii?Q?ohoo6DvlGDyIjcHEua0CBHAlugzlMV5HcXqa1LfKewBanpZALfioeUWXCv7c?=
 =?us-ascii?Q?szVZmVO3c+b0PAWuyhvRjtidFetADG3SxF1FHPWUi7RnT5w2nSCIBLhcWKWV?=
 =?us-ascii?Q?lvfkhlLzSoJRIf0ATiENqVvZ7TIF10XwhMR8MwtrXWXGyKNA+rkVU/JrIjjf?=
 =?us-ascii?Q?de5U/wdnOkmFm2sJNF8pc7VUU3jfyn/UCqud7B30cqOFloZ0dE4jc9kzqbcV?=
 =?us-ascii?Q?+xvy0w/+HAwfygw5wO6X0FW082UHkOWeyeLHTtbwpcG2RezpVu8hY7vvqxPK?=
 =?us-ascii?Q?nmjoNyUdCYNAGsFdMAo6Yra1wZm7C90vDcZuGr7ht6FQTzNzT5qW995gEhWN?=
 =?us-ascii?Q?65w0SDEw+rdhKF/HFLTBJ0yj4JHi2f5toTUG/WgIW/q8YVzNddSfmV71dIPu?=
 =?us-ascii?Q?j2agF2NBvsO8RiqrLoSIMDM/fDgDZao2RqUrXL2FJVaeYBY4pNJLOvztF4/d?=
 =?us-ascii?Q?SUM8NoNzPCdxV7Y1RIIa27i9LbNnUA74gbMFFhFaTfTSKku/XBBFNwwRdNyY?=
 =?us-ascii?Q?uJbrb92DAB4YRPyGBkuVq3mOZtejFK2Qd4Ay7LVrXfXNQ0WwxXJwqZbt52Ap?=
 =?us-ascii?Q?ESLW6PgW+XzLIyIxWkQHks0bk87P/wXQjSpdoG8KYDULq2sfcE8wM9b37ZPI?=
 =?us-ascii?Q?JlkLPgfd02SBwQpvRfPmZL45EU7M2Y5X53phvBxp4fAYnKMXuHgWebQ98A52?=
 =?us-ascii?Q?mLsElUMbIY7yuAmcfXCN7p5llkIbytyyU1/Vxzv/GhL2brNmzKPhEGOvfghF?=
 =?us-ascii?Q?R7QaPFK82xDIIaVId27jEaM02XB5iO3rjydcGk5huj35P1dWSjbYQfsSLBDU?=
 =?us-ascii?Q?WqS+D2AYjrIxoevlFCSyjEYG8GtqWbEHonPsz+TDBnt6o/WgsOdcdQkE4GbT?=
 =?us-ascii?Q?voD1NJ3G1G7OtTX63hh6bzybVMaWr4Z9DGW1bpGLqlVDypr++kIHBlNXx1Tt?=
 =?us-ascii?Q?YTsh7aZFLD1sAcRXCnSO1dRonLLPaeo3aLwATaCq6bO4C6H5LylMaRdQdakI?=
 =?us-ascii?Q?LX8/YIzA+ZmtooZ/CsS88E6OhW58kuZuOTYEyjjWGPM+1APMqr6J8YRjnbaC?=
 =?us-ascii?Q?eXUJhn6d5XdLVYLk7mYlhNwSbpEwj/UME3++/U5G/GC8F7aq99Qn2dh8FYuN?=
 =?us-ascii?Q?aOgTyhinTvLFZzI2qxfg5GKhzaizrBRzheM7PaAanSwN4fuoCrTN3Wn6aijr?=
 =?us-ascii?Q?tCDdZ0LzdkOd0ZFRK5CfnIiV4KC1nuBy4uTR2s8DT+0OTcsJcrYco9zVJjhU?=
 =?us-ascii?Q?puXTAVCdcC2yM8OZqtG7EHMTQW4oGpqx+8oalQ4Kl2qACKv41eTCcFg3/fpv?=
 =?us-ascii?Q?YCff1+XglbmSMbAbDW9UFR5fylM2j4VMPDEBlzmq40AFsr8XvsC7uMV20Z3Q?=
 =?us-ascii?Q?+1/QNIIltOwhFLhf8xoYiDNwo0dFH+bedzNKvntB78f/ZvUzXh8/NIvgVgwn?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f77489b5-56de-40c7-8aab-08dcf3ce4bd7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 01:50:54.2269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gpTwxQxCUypdzHSdkF58cVJFpYas1z9sCeJ6PudJaxukVVGCvLxu/yHNJPZLMsD4rhBqj1mOhwSNBoZ4LdRpYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8590
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

On Wed, Oct 23, 2024 at 06:22:17PM -0700, Andrew Morton wrote:
> On Wed, 23 Oct 2024 16:39:43 -0700 Matthew Brost <matthew.brost@intel.com> wrote:
> 
> > Part of series [1]. Sending as individual patch ahead of that series as
> > this is a prerequisite for merging.
> 
> That's news to me - singleton patches are perfectly OK?
> 

I've merged a couple of other patches outside of the DRM subsystem for
pending series which we then have picked up in a following kernel
release. If I have this flow wrong, my mistake.

> On Wed, 23 Oct 2024 16:39:44 -0700 Matthew Brost <matthew.brost@intel.com> wrote:
> 
> > Implement migrate_device_pfns to prepare an array of PFNs for migration.
> > Handles non-contiguous ranges of device pages that require migration.
> 
> OK, that's "what".  We're more interested in "why".
> 

Sure can add. The 'why' is:

A non-contiguous allocation of device pages can occur if a device is
under memory pressure within a single driver allocation of device
memory. Additionally, a driver allocation of memory can also be evicted
under memory pressure. Therefore, an interface for migrating a set of
non-contiguous device pages is required.

Matt

> > +EXPORT_SYMBOL(migrate_device_pfns);
> 
> And it's exported to modules, which adds to the significance.
> 
> Please fully describe the reasons for proposing this change.
