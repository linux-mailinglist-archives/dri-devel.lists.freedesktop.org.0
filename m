Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 714298D21B8
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 18:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A47610E580;
	Tue, 28 May 2024 16:36:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XUp6LBYf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D733910E2B8;
 Tue, 28 May 2024 16:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716914203; x=1748450203;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2LHLcBUfPWNCzDFZkEG9AJmjku+aWM1LY+04q186xPw=;
 b=XUp6LBYfJ52XvY0eXmbh2wbk7eVwKiyZQnMyczoBRcOqr5C1xE9YQYtM
 hRvl2vSKcFLglT47djMJMDrmXFZyEiBoWSzEjHcWhljnKA3eAYpGOfyDm
 vQAHsqa/F4OcuibLRALedGo7ev9H+gANWKyg2wSiBE0QKcmYbNfGLLoky
 +uQuhr/BKm75BULSkfIFEZr3GY3Eq5Hsw7EeqxNbAamLWIHiWUDlYr3qn
 ox8gb5umB662zZZV0hodCBiNenD0sYhJ+0aL+xlVmZhqfdHfO+nPXpQ0O
 BojL44YFsm92Sb0fbzXYY7SqtVE6Jcei0NMrtv/NWb9QtqO41bV1BxI/q g==;
X-CSE-ConnectionGUID: gfQvr4OeQYuNSCh83k25xA==
X-CSE-MsgGUID: 8X/Q3MrLSgqdSPtwtwXWFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24402571"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="24402571"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 09:36:43 -0700
X-CSE-ConnectionGUID: Cj9XW0U/Suevjcg1e47oQw==
X-CSE-MsgGUID: iOMVt241RXSRA+nBnC4ifQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="35742144"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 09:36:42 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 09:36:42 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 09:36:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 09:36:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WzIQJHEyUy/+tqsaCnJZRRgQYfR997ZmbMnInG6f2NWAzl/sCOuJ/vO/oSBzmCCSZvTzU+o2PWeRIiAPuZ42MLfTW1J9zpXBj/1ibJtpqDOcYNDfnB6rOLHvCnE//+Ijx/1RWh4rJv8pyVCBvpeVv27g9cqpTMwD5uHI7COvzIn440KZQsFaMKH6xtBpyFzGHdLvViBSo8CRa5mpSIV/ZYTus4PoMR52qGt3k2L1fKM+StWVd21+msjkxj9XC3wQaVNO+53DOVAk9e+gfJdIy+OG7cbELAOJT0qwm83hSypARMwwKM+73RKrAGOHL5GHn0PUjReGoRQTvEVqiUAMyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=im3gFxHOgrONhzYjgSPBo4QoCo4cNj41zA+L1g/SNaQ=;
 b=OQvWTjNL3eGtyGBPNZ5Wgh/aQa8G9cH+vEe5CAhiBN2nYv+tRinSPgt9rFJWtLyw16M69ANF6me2ISv1n2YWpscxtvO1it/d3UiwzHOj65QN5A7nYGQRrvIu+rUFPVjtYPXKO4ExhYRTIImoEutH0yDBZRXR2oQf3uP9Y8K6ztWQaNznmFsppIm8uWDITHuoO09XpRDtKoho5vZ3HYo2CxaLOD1ZXZRvZcBr4jB4ceV3pMnVs2TqmCu0q/SzfTQ2cAcUTmAYXeH8g9ZtIQUoBf8FhO+vF0ft5qbdBxtaPVEilfe9IuqWfbBiAISTTM/ZRyOYwstr027whoWDiREYUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6244.namprd11.prod.outlook.com (2603:10b6:208:3e6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Tue, 28 May
 2024 16:36:39 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7611.025; Tue, 28 May 2024
 16:36:39 +0000
Date: Tue, 28 May 2024 12:36:35 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@intel.com>, "Janusz
 Krzysztofik" <janusz.krzysztofik@linux.intel.com>, Andi Shyti
 <andi.shyti@kernel.org>
Subject: Re: [PATCH v2] drm/i915: Increase FLR timeout from 3s to 9s
Message-ID: <ZlYIE5I269lozmW1@intel.com>
References: <20240523235853.171796-1-andi.shyti@linux.intel.com>
 <ZlCfMPZpvQJmHybR@intel.com> <ZlRk1Qdr8i2YPITh@ashyti-mobl2.lan>
 <ZlSgCVqT5vhW7kKI@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZlSgCVqT5vhW7kKI@ashyti-mobl2.lan>
X-ClientProxiedBy: SJ0PR03CA0222.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6244:EE_
X-MS-Office365-Filtering-Correlation-Id: c1dd41f7-bdd0-4831-8efa-08dc7f34595b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W9nJlX0iSxwAGrAeDp4c8uj/iakik2QX/Ku+v9o/qx96I8xn34zHPMX+IJq4?=
 =?us-ascii?Q?8HIutCbAPNuIyxyJrv5aKmVik3aAgmkG5DEeNfzWBXjFhce/lRhuEe9K6IGO?=
 =?us-ascii?Q?LMfKEQHgDGQt+EXeWMdjWgjeiAn46vtB7uEa/BZdbngqWnv7w4lXMauf2ytN?=
 =?us-ascii?Q?l3ePmS9z/c34Dh6rsavi8d0W4A994LJhNuZ02vOv+Nwamz3h8wH578+30Hk1?=
 =?us-ascii?Q?MsPfFNR3i6XF9J5k07yissKBzFQM2SuMgMDp3r2+s45OzcpIqebmzKwDLAi+?=
 =?us-ascii?Q?67tE/dMjwOOQvLRPoqrd2sNlHNhFcRqp3Ez7cuEiiWT/9cUQIK52FfJXsP+A?=
 =?us-ascii?Q?63BLWCXYdIw3vSXE49vmJtVH49xcpgZL99JZdYELlei5doqqdNgO833nCA3x?=
 =?us-ascii?Q?PR1Q1lT2ICKZwxWNEcGaZa8VI8Q0zcewBcNBkVA+lZhridsJFAOEThvqYeO7?=
 =?us-ascii?Q?rBsBVwBy1rR0ARK+xkVm1ynSAFe6E9KinNBiBQ5s0rctJmZCPuzvVz/SDipv?=
 =?us-ascii?Q?vR13yGIkqrPm3l1YI6AvnJ5bvlckCzursjrhXbt/ifLs+e/zyCyILQD7wXUx?=
 =?us-ascii?Q?NWhMpF2wvKhY5yCwIExUBPam7RgjfB/MKYnGX1DcWQBG/mIWWpFrHowpvmvr?=
 =?us-ascii?Q?Z1VckBQMTjYu99jqvCwJ9/vn2f4sGIHbxhOY6EBWbp+dTeqo+tsYuV41zcxd?=
 =?us-ascii?Q?cKbmzOYvgV9i4Ld9Tl1SZHPzVwIT8Ok1wb4wQLF1OjF/IFZ+IVjHHrEY7KC1?=
 =?us-ascii?Q?DRLGsN6e85QVTX3GctahDLmHf3LIgGUf8L5dYcXt+wLnog/X4YlIwxDdC32Y?=
 =?us-ascii?Q?brTb+tEUCp4xC1/an6dhk3JuHIdNpNilhPZqz0ELxCzeG0kYyrIweAPdYHaw?=
 =?us-ascii?Q?uGhhE2jApUppHq5N+8LWM/k5Gi0kiH3xvZ3OfIkIAplnxo/ySQK0oNjrn3+m?=
 =?us-ascii?Q?zlFx2SeQfISI386rsfkVcd8OaWDnbmW0HRwFRTDoZQekIucRZqBFxmb/gfww?=
 =?us-ascii?Q?VdP8gE/nYDywUhutQxZpurfNJMvrlYJQP0r1PuUDke0HVIlZQOIhNxLJQVhP?=
 =?us-ascii?Q?Qt6iI54IAAqc+E8F4+VteVWx0dG6hSQhCQANOIYx48jJAWuwcdJsW7p9Odm3?=
 =?us-ascii?Q?S/rEhTziggPWwWrZzO7ryut5jThB6bWqpFyLrmD1cQy3rptHDbK907ccYBpS?=
 =?us-ascii?Q?U2YmDJNVRFSB1jICZ33IJeOyRZfW2moE+6xTGc/XLoAVvW3J8/yBG0vwxdUG?=
 =?us-ascii?Q?mFRnCxf/JmdVwXmh8E8vUjCA+z11BQ3ZGJvzDW3ahQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NZFyuvB1VC2oLvU8VLNjJoI5Hn8fWD97U9xRvYU7N9+QiRUrmmce9w674O74?=
 =?us-ascii?Q?L8NW/xz1WRdhRt9ZaYbO+/ieBKnI7/oRsQSCa6Hl5S7dAZVWryz9DeKMJR2O?=
 =?us-ascii?Q?TKc4sf6F2+QlJOjaZCx2lOFuiszU8rJVQQsC4dNRCJaqLineCajeTDoqRMXT?=
 =?us-ascii?Q?D3Y4bgrAYIbnNkGxHnq8lw5tj/xMq0tAbDI1qVqw+KMGhqIYaMQZ5f8oiyDf?=
 =?us-ascii?Q?JChdCA3ZXTq6PjwRFouMI/kE232RoohR+TiSn8BPPqkq13quq4nAbUhCQWqN?=
 =?us-ascii?Q?TDjIlaG5kD7Q5zqkveUqbfAEw2lXVdPB07atiexopgjoeynKEwCW5mDoF0qb?=
 =?us-ascii?Q?J8HEzp7ETHmbz4uPYsTnKBn7HsvGW5fmN9WPUHLPegBayZSnF1vvE44pJMQs?=
 =?us-ascii?Q?/9G3cRPLdPXRXpeBsqIdKiR0kE6MgLh4auu9HR65flsYhvR8UKXAyYu3j6VT?=
 =?us-ascii?Q?z5Ns6rv3ZJ/m4ZT11XOnBdIMJ/kZqDJldVdsledFwAmm2KM/6dc2B/+Tburj?=
 =?us-ascii?Q?RQz637Y+dmZY59zi5xtG5gp2gGOe4icnMJnp/T6EqnyR3YmW4O76nfya0Bgm?=
 =?us-ascii?Q?KbOWsppUVbJnQr4Hc8phxJbyyxmpt+d/UvlKQ7EhseP70LqdYxqXQ9TaxNRv?=
 =?us-ascii?Q?XveE1c8sG5GQyxIdpf8iDCL/EG9yt7WGcyApoa7hl9Lo48RhRd1zi3TsdLPx?=
 =?us-ascii?Q?MKc83AFF6EhiaShO//RyA95Ju9kgDAJURE8vAK9y6rb4AHbnnhPgeHO+J5WU?=
 =?us-ascii?Q?SudN4Ol5B4Hn97Gs5vyanAwlZsS4IfoSs2E8SB8BCq4iyO5UkpntVK/kjTs+?=
 =?us-ascii?Q?sNkSQ7nEs1yiDwmSSvGn+ybrcTPecvN8BlNtXctqMtChKxIyyHhzaKhhehT3?=
 =?us-ascii?Q?FqZhLCTv1N1GdXAJLXKwqrf5e7GfbKLowL6VutRsFVdyaSRD70mdhXxE1md+?=
 =?us-ascii?Q?AltMZlebfFnIidbe1LTJOHXkk0RBPdh2Ut0RsIiYQKnBQ/+m7o+Yb8JuUOvH?=
 =?us-ascii?Q?3NAqkHIDMRLX0k1bv0GMdkZHvL12CAFttMeHZLJc/m6rGKSrBs9Z8C92tmNC?=
 =?us-ascii?Q?rlOeq4b+DTLdG3eFIrvegDrKYGLJNoxZDlPUXMB/vNpHd+mP2d090tKTOghX?=
 =?us-ascii?Q?lyj2smk6CkTM1W4UrgDdGQ1FntpN890+xdjk0qTlUnHxyFGd/tXjJmWAfHNa?=
 =?us-ascii?Q?XKyRxMjgboEsjsdC59HBAYd5mMkfrNLm82YEm3nmBmE3v5c4NVetfsZzAt4t?=
 =?us-ascii?Q?gnC++7zK1Ea13Qp64IUDCGPmgRtUsRC9f1daeDN78qyOlyok56StSjjolJcJ?=
 =?us-ascii?Q?ulhc4u8EVPWNgT9+9rUGDxoRgXeyNigDs2ah3Yig1RA5s533P7LUOMDeyXa4?=
 =?us-ascii?Q?dKPLlHinpsFyfmZpVgddHcoXrAqaVyzbV8COKV9VRWlCnXy8jF/D7BXf4bQo?=
 =?us-ascii?Q?Hdvgf8s2ZxqlmaRKXPpPqCww0Z7/Ut/IiYjQrJgM+42NXO2g+IvEWvgoCmcn?=
 =?us-ascii?Q?Z0Q8oitMYBO1ZSqjJSqSmGSkGRfowRGQE2PRoRB3dvpUTYvEIEOQOF0gcjhX?=
 =?us-ascii?Q?rHCy4eQhaNqelD+mQZWiLwb+OqfgWw2g58KSLr/q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1dd41f7-bdd0-4831-8efa-08dc7f34595b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 16:36:39.6416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4m3BI11FckI7l/WwMZL4EIAQVLypRKvrtpo0X3q4eF7lA9kU3Pesi7zjM6UFfL0+miwoHCyp2XnGhBwU8twAwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6244
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

On Mon, May 27, 2024 at 04:00:25PM +0100, Andi Shyti wrote:
> On Mon, May 27, 2024 at 11:47:49AM +0100, Andi Shyti wrote:
> > On Fri, May 24, 2024 at 10:07:44AM -0400, Rodrigo Vivi wrote:
> > > On Fri, May 24, 2024 at 01:58:53AM +0200, Andi Shyti wrote:
> > > > Following the guidelines it takes 3 seconds to perform an FLR
> > > > reset. Let's give it a bit more slack because this time can
> > > > change depending on the platform and on the firmware
> > > 
> > > But did we see any issue with that?
> > 
> > yes, we have some FLR expiration timeouts that apparently are not
> > able to bring up the device and the memory is not accessible
> > anymore. It's worth giving it a bit more time.
> > 
> > > if that changes per platform and per firmware, shouldn't it all
> > > be explicit in the spec as well?
> > 
> > Is it always documented? We might anyway die after the FLR reset
> > failure, so that I see it quite safe to wait and pray a little
> > more.
> 
> if needed I can improve the log with the dmesg error print.

very good points indeed. I believe it would be worth some mentions
about the faced issues and good idea about dmesg as well. but up to you.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Andi
