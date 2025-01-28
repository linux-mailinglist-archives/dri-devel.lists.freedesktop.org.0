Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 173B3A21258
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 20:46:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2781610E6F4;
	Tue, 28 Jan 2025 19:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l1IVNZBW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7323B10E6F4;
 Tue, 28 Jan 2025 19:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738093553; x=1769629553;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kFBg/vlBp15t5HIUEc6i7dZvMAsK2K2YZoELWnJwHP0=;
 b=l1IVNZBWOGYljMd7ujX1c1OwGQI2Ij6YPNTXLgp2paIuvt9iW5OsJ8uq
 u99N79cdqvm7o4dTlZEyqFzJEXf517dlHjw0TcyxPdnms+t+mofmG6wi4
 a9od8/beoAGX9arV8TCWplBpdnjAczO6Cf/3XElUcL3zaOvtkc0908KfT
 BTlliBMPyst1OwJ05QA6R6H6zgpkFa/8srVVk4weK5SCoLqUlSzpH9AAQ
 LY89T/KzZS2s6W6MT3SgcJnIgNBsgSeH52nQTTevL5+995NjjAqhj4zb5
 /L6mV0f8+wZqYfXdZZaLjzpgj0bM9Owga4yrZ+BBtdacEt3nBLwVI+ntL g==;
X-CSE-ConnectionGUID: N9J8lQLOSPSnUJrP9hX31w==
X-CSE-MsgGUID: fzqvpwkvRca+M5w3MJvk7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38294516"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="38294516"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 11:45:53 -0800
X-CSE-ConnectionGUID: EspZz06NQlGDblZZs7+Xpw==
X-CSE-MsgGUID: yohzIF87RxaTAp5hqr+zXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109278224"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jan 2025 11:45:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 11:45:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 11:45:52 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 11:45:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I8EzwAHMNOCVWekbNn0RhUqACgXrTY8GRrz7jkgfwZ1bgXr8IyY2WqRcRoy9e4TR9xy2G+3SSZ04Bxf13dT4tcYB+Imx9Rl7iv6oE9ugK6K4UXj9Z13v6xKexpYH4Bllu/5mGzl1YbspUcs/o/puzA+xpR5yd0c4s8JJCRQhyMXYlfm1i0lMMkxG9Fa9OU50Jf74cyeMyLyjAUi39rbv3Wfk2tgSD8ToJYYRyUTLb4wYBWNFL8NhBOZpX/z1MlHILlpbrxosr1KDhYuw1vC1FGfCtB3NY9dW1rtO7Z9wy3toYM22C9ZKUxfM5tp++KPiIpydr+ATF74KrI/EAEaOPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hx8OjGi8IeoSpjcMvbFerACg1y6HSzmZHpRrccw2YyY=;
 b=x/u4c0JyBvmuJampWlBN3L+STvtkesluTbHfpUhXtxOjJALw80viom3O3cgJ4dfWVBvIGFF2yLqTHAHMl/mNNXOclebMeJ4mLRGx7f3JYAqqNN/tDIdvIeHurY72kTCWAzx1L7uR5cvIQEVuy6qTBzRpEcA7nZjpMC9vC7pfO2YDrQwkkccR5u2edDyRzaMItmiMurO2j3HvcAgUHHmsoxnVAsYu8sLIddazRk+0/kpTG/S1vJ/JiDy4XnBk2vGhij2OsBj6kdH96YQwPcAUZfee579cz/y3al6e07Y4xdSIelJkyyYPhbak4PmE3DJYKJN8BhVsl0s1EpRKkQ+kxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6372.namprd11.prod.outlook.com (2603:10b6:208:3ac::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 19:45:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 19:45:21 +0000
Date: Tue, 28 Jan 2025 11:46:17 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v3 03/30] mm/migrate: Trylock device page in do_swap_page
Message-ID: <Z5k0CfutFTMwa9Hd@lstrano-desk.jf.intel.com>
References: <20241217233348.3519726-1-matthew.brost@intel.com>
 <20241217233348.3519726-4-matthew.brost@intel.com>
 <e6e8571882bde6bf1887039ccc6aee989f395e95.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e6e8571882bde6bf1887039ccc6aee989f395e95.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0198.namprd04.prod.outlook.com
 (2603:10b6:303:86::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6372:EE_
X-MS-Office365-Filtering-Correlation-Id: 71647da2-32a9-426d-29a5-08dd3fd44d2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Z6q8T7m57qriGFyIsx/TSTOGjldEHkS+1FjuYpxTKBzyUgZPwwFwsme4Pw?=
 =?iso-8859-1?Q?QrQRt/8rvi+bGak2nXDg6Sd5EtILiRbdeVgmF0bGeaXdyBQKyW+Ngxg7OY?=
 =?iso-8859-1?Q?Yi5Ph1q5LaNSdrZ8QXKPtilTFCSUZRL5X17PSkaSD4KSss7fzAe4RdOGRO?=
 =?iso-8859-1?Q?i5O4qWRJimJUCoHnIXgBIXaQcIOuAIs67lTEVUW9N1YOdYCTPEtMoqECP2?=
 =?iso-8859-1?Q?N/gF2/vHbFtBWrHVbtnYwNdVDCOj3R68TPtv+52SSDkQuQwfkquciTHzFf?=
 =?iso-8859-1?Q?eKhNjAiM99lF4Ef5QCes13CZ0W+rternU+OMN6BFNhK4Zu6RBZ9HTBIPuc?=
 =?iso-8859-1?Q?Flnh+y0AzG581OeuLMG0QHrd6gkvuwl2AcbW7jPeZ6HVf0kAlVv4nNZnHi?=
 =?iso-8859-1?Q?ztrZmooErXPjNoYScuI60UqiujbwwMFSQIyzrCKHRIFEqKyCDm3oKvv3W6?=
 =?iso-8859-1?Q?2GBeE+BvHkqKoDhkmdxpa1u3LfumDZQLYgCVx5X6EhJJ12yHIZhBFaYMcB?=
 =?iso-8859-1?Q?Uelk9H/kLAThw0WLbeb9IeLYU4jheKa2HUA4s++Rt855rsk+XXRa8eNQPd?=
 =?iso-8859-1?Q?mI+T0+RpjVQ70dqSKS6GZAeY28JJ/Y9U4ZFmM7AKWlswqy/gZe9NdNVvTw?=
 =?iso-8859-1?Q?+CI3eca7SlTtHC5WNU1Gr9rUqGLEh0lfpSDIgaFalYUEg+swAVPc9wJ/Uc?=
 =?iso-8859-1?Q?7sCwJ8S3CcQw0hjiKXlX/js2pQHYy8pUR4ZpvutLhVuI6KvScHxHpVOOnM?=
 =?iso-8859-1?Q?O1BR4D55uXetyBsg+yUw1pk2+0AFrfhG4/uL4AMVRbjSzqjX8LVcj0pUFb?=
 =?iso-8859-1?Q?GyB7xcxHkeC0Ji2T46IvBVywYs1bMzfNTxbXRv0hsftJy0Oy7hRWhv7w5U?=
 =?iso-8859-1?Q?wp3SB1os1XpOE9t7Q7n9lIzZGUCP3bQZg6X85OSDoLor3fNalHz0srsOO4?=
 =?iso-8859-1?Q?cTkNkshILkC9M++HtmG10huevvDrgLKhvzgeARlWHwIE/JRYujzsUJb/Io?=
 =?iso-8859-1?Q?/AZn1oqXMIt/JVJq5u06f1+SB0+LBUzDOaPQWkFJGX9AYylRtpbBELo8dC?=
 =?iso-8859-1?Q?dc1wCHUZvGjCxeAkQUHzICTRUnr0Qv2Cxaw7cIw/ciuxBzOOG68qNVc3bK?=
 =?iso-8859-1?Q?3EYSC4qPUv4MQ10NBw1Ty0i3mtknLM/x3RwjpXkjerXkBsBdUafaEdzM7O?=
 =?iso-8859-1?Q?Oz80RmwYvBUGXB61F47oSj5tiGFRl4NU5XYtDLEV57zd5sqxFHE+2uz54b?=
 =?iso-8859-1?Q?I8wGSUDwX0J5jZ7HgRneXbw+051Emp4rn641ygIxbi9dCw4PcD9Gb+F2Es?=
 =?iso-8859-1?Q?zoJDzsTbmCeHE1kxgcpNs/6odNhhIHfkoz6dQ0j8A14vuwd1NuD6r5UesS?=
 =?iso-8859-1?Q?xEiqj5jPulYqXY9EAYNbsrgeIyyUbBkVfxy377+o7P7TPL3KU3A3+9/XxV?=
 =?iso-8859-1?Q?sXcxlMZuEm1230Ah?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dUznjIweYx4CNXQdoMInI2SBooCdwgWe6/mywBEbwNyYQwnw+tWPT3dE1H?=
 =?iso-8859-1?Q?aXVLe4MO1+8xXn0QmQ4Yh7+4aIA4XUbdNZA4UUqWF3yC34KimwcnM347qT?=
 =?iso-8859-1?Q?+ILsJE3cxE7sMCA9VCayj/XNwByqCQHyr08Bdb1n8kxu/yw6CdkbhRq4ZV?=
 =?iso-8859-1?Q?Cd3id1lJKZ5QVznxgeb4YsurLmiwhMxo3ihcvmQ5RcrDbtXRfei92rRRLk?=
 =?iso-8859-1?Q?rlDjUREu3bRZ8cMbcpOWb1HUFtU3ZEUIv/yg4Ff8CwiDOWr0Oh3TFMtpY1?=
 =?iso-8859-1?Q?Vf4AF+G5JK1XWPuw1WQmLILxWgjX40o9PwNbFjLkiEaHbM3mcARTRWwY/O?=
 =?iso-8859-1?Q?gtthnuqEpSHRpcQ3h5fdGWkas9u+yzMaIHu7NRaj6QkORtsG9UyTqhsqgW?=
 =?iso-8859-1?Q?wMBrfJOvu2LZqeJq7KEHZwx2Y29mABcCptLeoATFvdhcQxl/rm5Tnv8VSi?=
 =?iso-8859-1?Q?a/LFAazmbGQqbOnayusAw7OGiYg+2Xw1beTP6CjLCqfXCI2i/irY47ZIrb?=
 =?iso-8859-1?Q?0EPGwnXFClvV8B7xFkWcBQMG+JTrXEkMqVnBeqOoLwI5sY1icjtgiB9bR9?=
 =?iso-8859-1?Q?Fs11VeQJ/kXO3a3CzZRIxSyjwKDk0s634Sq3w+OgM4ua/hrZNf0HM0BlzI?=
 =?iso-8859-1?Q?JroaR0Jy4/5hxcNWpyLxmjaxcaCfAVLzfcchJnPyEnT2OUzuuvyQ6kO7dR?=
 =?iso-8859-1?Q?89sHQW3EK04WA5BpW7xgbbXubrANFFuQ5B0XKvDClggFN4KpAHrAznS8vQ?=
 =?iso-8859-1?Q?2k3+6IydoF7xsYcbAMpAR1a8qH3vsiig/2jXAa1Va4+HGAZfs7P5G+8yTz?=
 =?iso-8859-1?Q?GVFYcBbgJc0AtjZcrepPiblPz32oFUe/Uz5GTmjuetXljqwewhVE/xbOw7?=
 =?iso-8859-1?Q?gowfPisVtZVwRSUEXb9KjXSTWvCzD6lKWM3d2xUmqHb5tzVdmxQCVsyztW?=
 =?iso-8859-1?Q?7ChMqvn3+hV69H5oJifgv/EF/OWX1/w0GTkYF8chb1y3yXWHiy6DQAFGGI?=
 =?iso-8859-1?Q?19NYKZkIek+ZhtaQrE3YDHlqDUuJzBDgc983nDQNG0OmSbuqJm3tcZLgkm?=
 =?iso-8859-1?Q?m1BUTm6oWvFWTCD1WebzC5tXp0whsKi7WTuoQnnkwjKauSmAKNkMo/4fqE?=
 =?iso-8859-1?Q?KJ7U+JoP852aECCXBaizknCDbCtucZk3jJimHSng9c9hL99fVo7D/cftNo?=
 =?iso-8859-1?Q?4IPhtvZARntO1WjsD14pMq7vJ11AEsxa1Eh2Wz9cv76cxfwROaeEVvG/xi?=
 =?iso-8859-1?Q?8jt22tCtZfNqmrx03AOSJhCVU5O8y1lsgrWlGzZRRehbh6p5cd4Lg3O/Rw?=
 =?iso-8859-1?Q?6tSZ23YbuDAgknwy/yRvOT0PSkNTT9hc+u1VLMLhpBykSY3C+HRLjJBIeW?=
 =?iso-8859-1?Q?11BzP9DF+GXcWDa8wGUbu0c/z/L0Mw23RuAkRI8uWzdxy3HvfrYTd46jFO?=
 =?iso-8859-1?Q?YkAEvcayiGBxI1iuipLGI+NSs/XbXtuw5bDybO386t9fq8cC8d9fWLd5t0?=
 =?iso-8859-1?Q?Pitc6rhkMO1N4rbYpSgaXZbKH11YmwTNZ7qaLf2PcXLbmbI+D0AAQsvVdg?=
 =?iso-8859-1?Q?3ylEisuxMK3NwfykmajKvJu/gbE3/1fqDywHkxoVfUHSFvYGPyT1lvyXPo?=
 =?iso-8859-1?Q?hKaXJjJk8BGVByzUTrDhOXlx4O22beu9xKBg3yo/2KRx6ION7saH7rKQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71647da2-32a9-426d-29a5-08dd3fd44d2b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 19:45:21.8017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lr4wBSCE/4qvPYOdJvgcmFuhZ7n3wqsJIE4gAP27VZh6gywBd58TkqXq9KOQmH2Lu8S+l7krDkkt7iWVwMiDDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6372
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

On Tue, Jan 28, 2025 at 06:26:29PM +0100, Thomas Hellström wrote:
> On Tue, 2024-12-17 at 15:33 -0800, Matthew Brost wrote:
> > Avoid multiple CPU page faults to the same device page racing by
> > trying
> > to lock the page in do_swap_page before taking an extra reference to
> > the
> > page. This prevents scenarios where multiple CPU page faults each
> > take
> > an extra reference to a device page, which could abort migration in
> > folio_migrate_mapping. With the device page being locked in
> > do_swap_page, the migrate_vma_* functions need to be updated to avoid
> > locking the fault_page argument.
> > 
> > Prior to this change, a livelock scenario could occur in Xe's (Intel
> > GPU
> > DRM driver) SVM implementation if enough threads faulted the same
> > device
> > page.
> > 
> > v3:
> >  - Put page after unlocking page (Alistair)
> >  - Warn on spliting a TPH which is fault page (Alistair)
> >  - Warn on dst page == fault page (Alistair)
> > 
> > Cc: Alistair Popple <apopple@nvidia.com>
> > Cc: Philip Yang <Philip.Yang@amd.com>
> > Cc: Felix Kuehling <felix.kuehling@amd.com>
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  mm/memory.c         | 13 ++++++---
> >  mm/migrate_device.c | 64 ++++++++++++++++++++++++++++++++-----------
> > --
> >  2 files changed, 55 insertions(+), 22 deletions(-)
> > 
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 75c2dfd04f72..ae8b11131dad 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -4267,10 +4267,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> >  			 * Get a page reference while we know the
> > page can't be
> >  			 * freed.
> >  			 */
> > -			get_page(vmf->page);
> > -			pte_unmap_unlock(vmf->pte, vmf->ptl);
> > -			ret = vmf->page->pgmap->ops-
> > >migrate_to_ram(vmf);
> > -			put_page(vmf->page);
> > +			if (trylock_page(vmf->page)) {
> > +				get_page(vmf->page);
> 
> A couple of questions that I and Matt have been discussing around this
> change and that we aren't completely cleare about. Perhaps somebody
> else has some input:
> 
> 1) The livelock occurs because we do a page reference check in
> migrate_vma_check_page(). However judging from the documentation it
> still uses a page refcount to determine whether it's pinned. 
> 

Also in folio_migrate_mapping & __folio_migrate_mapping via
folio_ref_count & folio_ref_freeze respectfully to clear. I have same
questions as Thomas too.

Matt 

> If we were to use folio_maybe_dma_pinned() which uses the pin-count
> instead problem would be solved? However if there already is a refcount
> that we don't know about, that holder could possibly upgrade it to a
> pin-count. Does anybody know why not folio_maybe_dma_pinned() is used?
> 
> 
> 
> > +				pte_unmap_unlock(vmf->pte, vmf-
> > >ptl);
> > +				ret = vmf->page->pgmap->ops-
> > >migrate_to_ram(vmf);
> 
> 
> 2) Second question is allocating memory under a page-lock. There
> appears to be code avoiding that, arguing that page-locks may be taken
> during reclaim. At least unless GFP_NOFS is used. Here we'd allow
> GFP_KERNEL allocations under page-locks but can argue that it's only
> device_private pages that are safe. Although some drivers do GFP_KERNEL
> locks also under ordinary page-locks in migrate_to_ram(), probably
> arguing that those pages are taken off LRU. Seems a bit fragile, is
> there any known policy regarding this?
> 
> Thanks,
> Thomas
> 
> 
> > +				unlock_page(vmf->page);
> > +				put_page(vmf->page);
> > +			} else {
> > +				pte_unmap_unlock(vmf->pte, vmf-
> > >ptl);
> > +			}
> >  		} else if (is_hwpoison_entry(entry)) {
> >  			ret = VM_FAULT_HWPOISON;
> >  		} else if (is_pte_marker_entry(entry)) {
> > diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> > index 19960743f927..3470357d9bae 100644
> > --- a/mm/migrate_device.c
> > +++ b/mm/migrate_device.c
> > @@ -60,6 +60,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >  				   struct mm_walk *walk)
> >  {
> >  	struct migrate_vma *migrate = walk->private;
> > +	struct folio *fault_folio = migrate->fault_page ?
> > +		page_folio(migrate->fault_page) : NULL;
> >  	struct vm_area_struct *vma = walk->vma;
> >  	struct mm_struct *mm = vma->vm_mm;
> >  	unsigned long addr = start, unmapped = 0;
> > @@ -88,11 +90,16 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >  
> >  			folio_get(folio);
> >  			spin_unlock(ptl);
> > +			/* FIXME support THP */
> > +			if (WARN_ON_ONCE(fault_folio == folio))
> > +				return
> > migrate_vma_collect_skip(start, end,
> > +								walk
> > );
> >  			if (unlikely(!folio_trylock(folio)))
> >  				return
> > migrate_vma_collect_skip(start, end,
> >  								walk
> > );
> >  			ret = split_folio(folio);
> > -			folio_unlock(folio);
> > +			if (fault_folio != folio)
> > +				folio_unlock(folio);
> >  			folio_put(folio);
> >  			if (ret)
> >  				return
> > migrate_vma_collect_skip(start, end,
> > @@ -192,7 +199,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >  		 * optimisation to avoid walking the rmap later with
> >  		 * try_to_migrate().
> >  		 */
> > -		if (folio_trylock(folio)) {
> > +		if (fault_folio == folio || folio_trylock(folio)) {
> >  			bool anon_exclusive;
> >  			pte_t swp_pte;
> >  
> > @@ -204,7 +211,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >  
> >  				if
> > (folio_try_share_anon_rmap_pte(folio, page)) {
> >  					set_pte_at(mm, addr, ptep,
> > pte);
> > -					folio_unlock(folio);
> > +					if (fault_folio != folio)
> > +						folio_unlock(folio);
> >  					folio_put(folio);
> >  					mpfn = 0;
> >  					goto next;
> > @@ -363,6 +371,8 @@ static unsigned long
> > migrate_device_unmap(unsigned long *src_pfns,
> >  					  unsigned long npages,
> >  					  struct page *fault_page)
> >  {
> > +	struct folio *fault_folio = fault_page ?
> > +		page_folio(fault_page) : NULL;
> >  	unsigned long i, restore = 0;
> >  	bool allow_drain = true;
> >  	unsigned long unmapped = 0;
> > @@ -427,7 +437,8 @@ static unsigned long
> > migrate_device_unmap(unsigned long *src_pfns,
> >  		remove_migration_ptes(folio, folio, 0);
> >  
> >  		src_pfns[i] = 0;
> > -		folio_unlock(folio);
> > +		if (fault_folio != folio)
> > +			folio_unlock(folio);
> >  		folio_put(folio);
> >  		restore--;
> >  	}
> > @@ -536,6 +547,8 @@ int migrate_vma_setup(struct migrate_vma *args)
> >  		return -EINVAL;
> >  	if (args->fault_page && !is_device_private_page(args-
> > >fault_page))
> >  		return -EINVAL;
> > +	if (args->fault_page && !PageLocked(args->fault_page))
> > +		return -EINVAL;
> >  
> >  	memset(args->src, 0, sizeof(*args->src) * nr_pages);
> >  	args->cpages = 0;
> > @@ -799,19 +812,13 @@ void migrate_vma_pages(struct migrate_vma
> > *migrate)
> >  }
> >  EXPORT_SYMBOL(migrate_vma_pages);
> >  
> > -/*
> > - * migrate_device_finalize() - complete page migration
> > - * @src_pfns: src_pfns returned from migrate_device_range()
> > - * @dst_pfns: array of pfns allocated by the driver to migrate
> > memory to
> > - * @npages: number of pages in the range
> > - *
> > - * Completes migration of the page by removing special migration
> > entries.
> > - * Drivers must ensure copying of page data is complete and visible
> > to the CPU
> > - * before calling this.
> > - */
> > -void migrate_device_finalize(unsigned long *src_pfns,
> > -			unsigned long *dst_pfns, unsigned long
> > npages)
> > +static void __migrate_device_finalize(unsigned long *src_pfns,
> > +				      unsigned long *dst_pfns,
> > +				      unsigned long npages,
> > +				      struct page *fault_page)
> >  {
> > +	struct folio *fault_folio = fault_page ?
> > +		page_folio(fault_page) : NULL;
> >  	unsigned long i;
> >  
> >  	for (i = 0; i < npages; i++) {
> > @@ -824,6 +831,7 @@ void migrate_device_finalize(unsigned long
> > *src_pfns,
> >  
> >  		if (!page) {
> >  			if (dst) {
> > +				WARN_ON_ONCE(fault_folio == dst);
> >  				folio_unlock(dst);
> >  				folio_put(dst);
> >  			}
> > @@ -834,6 +842,7 @@ void migrate_device_finalize(unsigned long
> > *src_pfns,
> >  
> >  		if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE) || !dst) {
> >  			if (dst) {
> > +				WARN_ON_ONCE(fault_folio == dst);
> >  				folio_unlock(dst);
> >  				folio_put(dst);
> >  			}
> > @@ -841,7 +850,8 @@ void migrate_device_finalize(unsigned long
> > *src_pfns,
> >  		}
> >  
> >  		remove_migration_ptes(src, dst, 0);
> > -		folio_unlock(src);
> > +		if (fault_folio != src)
> > +			folio_unlock(src);
> >  
> >  		if (folio_is_zone_device(src))
> >  			folio_put(src);
> > @@ -849,6 +859,7 @@ void migrate_device_finalize(unsigned long
> > *src_pfns,
> >  			folio_putback_lru(src);
> >  
> >  		if (dst != src) {
> > +			WARN_ON_ONCE(fault_folio == dst);
> >  			folio_unlock(dst);
> >  			if (folio_is_zone_device(dst))
> >  				folio_put(dst);
> > @@ -857,6 +868,22 @@ void migrate_device_finalize(unsigned long
> > *src_pfns,
> >  		}
> >  	}
> >  }
> > +
> > +/*
> > + * migrate_device_finalize() - complete page migration
> > + * @src_pfns: src_pfns returned from migrate_device_range()
> > + * @dst_pfns: array of pfns allocated by the driver to migrate
> > memory to
> > + * @npages: number of pages in the range
> > + *
> > + * Completes migration of the page by removing special migration
> > entries.
> > + * Drivers must ensure copying of page data is complete and visible
> > to the CPU
> > + * before calling this.
> > + */
> > +void migrate_device_finalize(unsigned long *src_pfns,
> > +			unsigned long *dst_pfns, unsigned long
> > npages)
> > +{
> > +	return __migrate_device_finalize(src_pfns, dst_pfns, npages,
> > NULL);
> > +}
> >  EXPORT_SYMBOL(migrate_device_finalize);
> >  
> >  /**
> > @@ -872,7 +899,8 @@ EXPORT_SYMBOL(migrate_device_finalize);
> >   */
> >  void migrate_vma_finalize(struct migrate_vma *migrate)
> >  {
> > -	migrate_device_finalize(migrate->src, migrate->dst, migrate-
> > >npages);
> > +	__migrate_device_finalize(migrate->src, migrate->dst,
> > migrate->npages,
> > +				  migrate->fault_page);
> >  }
> >  EXPORT_SYMBOL(migrate_vma_finalize);
> >  
> 
