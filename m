Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9399BC012
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 22:30:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8381010E4D4;
	Mon,  4 Nov 2024 21:30:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mVwPfe8t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8BF10E4D4;
 Mon,  4 Nov 2024 21:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730755813; x=1762291813;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6DS8Bu4zfIfy9CWYLJGtQ8Ezqy3xV/R67KR96HEpqPA=;
 b=mVwPfe8tzqXFfKIwYDkIU38GgouDrPe04D5nucwxfkOJqopsbMEtxlYS
 nHpO8aULDwE8DZEB6t3yRRRH6EevXYd+fyVyGhZEooyFD3gCTJn4dL2xt
 tsRCnjOg9M8jCqib7B3f6ks7Z8x78NQMhxK6ySBT89xHo+n0wODwITIz6
 bQP3cSNxMPtB/UhY69tQtLkEUm2aJvlq9o4NSR+kBhsCQLq8KPtf3CMV4
 gSDAUAKJclDkD6MQy3w+x6vyspq14LxrMsoxGyxvsR0Y8VStdhh3cwgTv
 Ki05ijtxgqJV7AC3xYk85HwKn/VQ4JwShybf+gIIg7BAsa414l4ofyWw6 Q==;
X-CSE-ConnectionGUID: HAMNxGHMRgiuj/ke09wVZw==
X-CSE-MsgGUID: h8NPN249SuaMFXJfeqFjtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30419284"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30419284"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 13:30:13 -0800
X-CSE-ConnectionGUID: XkPC36TvSI+NYKH7PsV7lQ==
X-CSE-MsgGUID: q8ZuwqSNQWeBlLhF7OvajA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="88599255"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 13:30:13 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 13:30:12 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 13:30:12 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 13:30:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y4xXlBtkOo+rWlQjz76YmCaJm59M5Xm8HLIm9KaRjyOC+0ReSlo6Z5OglEgCBeqs9AK90Qpqz7/uzRJC75ILNTLPYw6NYCI3stl8J8/3K+1PsQd54t+tLw9xbObOkv7XciXlaM5OuQApLoMfAmf8p12H2PzcX102OQo56SdzHEG5jiQHCb+a9zM0+n8erHfeUX8uWOqTyAR6PjEGlSo1sGwmO+rFbi4GZWxaFUL8akqkUMLClKH1MMl2Xy5oZqldRwnZotDb4PxYwR/mtL0v2QMDnmB6/TC8nz95kp6guK+nrWRiB0gXGrlCmORGDmwu7CDD7C/+pi0Ld9znBGjCrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHUqXuf8zNSDI3WphWkf+yrBr7jLRNJ5I59o6ahz0NU=;
 b=qmcDSZCVWgAj6cQ2P3mxlYoVreScfsGSrH62C7ZYX2BET3k8HAg6qP3qWDoiv5j51yj1ywwoayL+MPImm6pH/jtPi3krXDPQV0PGCQXBzLqV2wNIhyT5bvGH8ywLuwjZl8lBxH8dShJeq2QSt2MhMiXyE4fZ2fQPm2MN0PR7tJQp1GlBXU+lfKR4SK4uE1TMchxfNokpe/oV9xJrMUWvumbd4W0A1aqVjfn4XOu2RYGoFA13bYGCpZ7hmnJ+BCdPEb6fxa5fz7FPxntv8zS/bypMfUkxNwvq+/JjzTx7Aaza20BQ1OlBymJQXQt1vbFfmW0GznQRaPUlcqPAq4I/NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB8064.namprd11.prod.outlook.com (2603:10b6:510:253::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 21:30:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 21:30:10 +0000
Date: Mon, 4 Nov 2024 13:30:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <matthew.auld@intel.com>
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
Message-ID: <Zyk9AUmjSimlG4OL@lstrano-desk.jf.intel.com>
References: <20241031181048.2948948-1-matthew.brost@intel.com>
 <20241031181048.2948948-3-matthew.brost@intel.com>
 <ZyQWF/k9VFo99tDB@lstrano-desk.jf.intel.com>
 <eb0b672c-3300-4501-96c4-bc310b80f63e@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb0b672c-3300-4501-96c4-bc310b80f63e@gmail.com>
X-ClientProxiedBy: MW4PR04CA0379.namprd04.prod.outlook.com
 (2603:10b6:303:81::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB8064:EE_
X-MS-Office365-Filtering-Correlation-Id: 5287c97a-a381-4d31-34e8-08dcfd17dc6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?zoaVu+8phJ1plW4lEBxqPuPYr+jlzi4hpNJZYo1bVm4xc7j5Eeirw8fQbT?=
 =?iso-8859-1?Q?rDnmifGcgwUdte7nQbUrjMXHwMVG0sUwp+sX/z3PNIJIX3VxOdUa60caO1?=
 =?iso-8859-1?Q?SKX8sxF42lmBAuKqqCg3NqCNPn+PLM1JkwIwZUUkII8kkgj6H2rPxhXZgY?=
 =?iso-8859-1?Q?QLrMOjd/vBlFi/0UM4bhRddcLT4G+Fv/lYbYXrCfwesFxCaUZCfx6EcHeu?=
 =?iso-8859-1?Q?1Ra8T6ZQ341kJ3LdiVUW+jkddvhRlm2cuSaMD8GNi5cnFh1DQEJVfUbMzG?=
 =?iso-8859-1?Q?/Ae1hLH50Lx19i4lobW62E+nITI+Gnyi2TzVrTAkURcb8+D51qC9frgbas?=
 =?iso-8859-1?Q?YoveVVP7YDHAEXsseRegifd99/66WHsJDqFk3V8WoanCy3RvAC7+iye0Ej?=
 =?iso-8859-1?Q?ICQ6VK+D5G0rxaAXTEhtFW6MohBxdUVKbNEGXN0AIk8krn/xXcf79j9TfC?=
 =?iso-8859-1?Q?/ZgZQOCAgnmT/LS0+K5sl0nJcp96kol9Ga58cRah9yTbuRmtvLUlNQoYV7?=
 =?iso-8859-1?Q?kAmt4AeuD/dCx9R+BKX1REoTITFJRDi6VdbSUEZZtKAaIf76Gr4vL1AzMK?=
 =?iso-8859-1?Q?cfgCgf3OaHxSoG0evBFUUJO3QdFP8mKLW2WbV2ezS2JIvvqxlf32ToZyDZ?=
 =?iso-8859-1?Q?5GweoLEGHmdE+qqm4Ww68fUVnrBeLCAjxbhSf9nLF8axwuCI+p4a30v1uC?=
 =?iso-8859-1?Q?EUkfZGZPg2F+6VSL/4HZeOWJ8Gpt8AZHrov9wWXqn4wdPh2FPWqUdD82kF?=
 =?iso-8859-1?Q?NlC7dNH6jtYf9PUN1VspaH+UbZOthgO5COJdYuo30nzE24FYWVL7I7MNES?=
 =?iso-8859-1?Q?p/vtZx7zWEIPq1paQdH6Z96/8mauvyVPjxnnoPZSXW56BEIF9anwO1laFE?=
 =?iso-8859-1?Q?jL9zasBwqqcbf5MRcsujCno9fkqUlIDdECXJ++gXIggKbunpcVWJAm4fS3?=
 =?iso-8859-1?Q?xNZIDycRtOKzEdFHcIqe4dByDIaV1VSLAe2QNBzaC6uGmKE+/VGUSt3g/s?=
 =?iso-8859-1?Q?KjIN57zGwodzvLwKhjszNeJ8W7W6hLYzdf8JYEyISOuu3a4p5sC3oR6Z2V?=
 =?iso-8859-1?Q?aoyA9hJXEWZyUrWJlTiDv3BuSeuJRt+5Upg81/a1YVtXxRSDIrAkA4mdzX?=
 =?iso-8859-1?Q?dgpfxag8HGioQWaPbYxgPubaSNhWd4qAg5lVlH4+TJEWq239HLHYFuFzmp?=
 =?iso-8859-1?Q?fnlWsXGJ5fjfpmTy+ACkak4QgRJsr3LxAZMHrFEg/Gdx/v+hHFeACt1V6A?=
 =?iso-8859-1?Q?5mE1j2VxYgfMewP91pMUCyYP9a5RA61fKfMKwEiqCLIo+yXinfLxfCmcmk?=
 =?iso-8859-1?Q?CqdKgvzPoKW07+GZ3KUj6da4QZ22PANwC8l6zUpBMayf/aI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?EyQ5iabR14ApvZr/iWj9QmeZUUZ2mBNrhDp5zPNGduEZB1F1gxu9ZjTOTZ?=
 =?iso-8859-1?Q?P8Naw8ezl5U2kSgaqmW1lQtH+xLz/JzVgtuXKCFegPBZ2X7zYb28V6gJZP?=
 =?iso-8859-1?Q?L/lKuTS3ag87tLaUhIO/J3n0v2I6z8px7wdjGIwU4bfHp2nJLu93dwShnl?=
 =?iso-8859-1?Q?kVS14vkC42rEjDpZABy6uOQe41GaoVUiN1fKYAaT+KTFU2cLcpKbJSfphJ?=
 =?iso-8859-1?Q?wS/g/sIq0qDjuaV65CyBCHvQqc9m3wFnrL2TGj/DTV39ghmOCk4ozIIFX7?=
 =?iso-8859-1?Q?7GoCJ60JPP+wzD+8PGV+BVHCNz3GVmOryei5r/o6FDNBlWQgYSFUhY7H3B?=
 =?iso-8859-1?Q?nJv8eOQt1qAHA33rE842nzhZUqJUQDCCNDHPWpmaPUNkuy07inugqg3kWc?=
 =?iso-8859-1?Q?ZunNG+WZB39kV88w1kC+9BgLXpYLQSaug2TltZvvudkbc4TCar9l2TB0Hm?=
 =?iso-8859-1?Q?58b2SV5dC8iI435b/rS36TmpNZaK0vTuwpsHjzarb+t8Lh2vGB7MAzYT79?=
 =?iso-8859-1?Q?BUhDInS55mWyPGz0g1q6pY5yGH6BK/Ya2YYcGb/DvcJz/4B4Lbcs2Nbt+C?=
 =?iso-8859-1?Q?zoubWB+0mxTpCKFWJ2Cb5AE8hUNuoZDpkHy5k3owzrJKL1RMZHS+G4YY/+?=
 =?iso-8859-1?Q?lzrvdpiiw1fFuqIP/QUcVic6AwWlhuAmvG42Yl0ineRS19LYYwYQ6jKFF6?=
 =?iso-8859-1?Q?b7MYtSqkzFyviBZUjWux8Kwb91ZwEjImnuJ1TbjA7/KcNbOHyZXLL5Ih1g?=
 =?iso-8859-1?Q?iltf9ucYHmzK+EG1psdBFaeBX1eXVFEbFlOcnsbVVY08B+Eiw4spYmUVrq?=
 =?iso-8859-1?Q?PcoAuDZnL8cgoayRYGZallv7d/wI401g/JTePcwh3AkIcZajJNWcWQpB4h?=
 =?iso-8859-1?Q?uAeLtvslxbWXu3zOhF/jtNu2weVqOQT0M8O3paIWjqErBAmT94CcgnSBUL?=
 =?iso-8859-1?Q?auHTtvozH6dd57bmpz3IMNQfR6RStzO+upPZiLlc2DTQo21MfNWwj3Yd3s?=
 =?iso-8859-1?Q?uIzUQqDQyL6XnStZG7W1Xl0VTVNI8jPrPzW137VSd/jBs7Eak09fFMYLoU?=
 =?iso-8859-1?Q?19UNV89VFZMlWgDbS7f66v8G+vjSRB/R+QvFd7MUsHjp7w2xM0H+aZ83lN?=
 =?iso-8859-1?Q?gfMzhcF9fkUr/YW8wRuP8HXmN0Rfh37IPpgXruc0TdGLAzKRXlfM81SAue?=
 =?iso-8859-1?Q?SzYZ52R1tqDNkHQVY6HIkX5KFrlN9LQRJwZ3Btlo/eQR6+h/bNoaGC7zvp?=
 =?iso-8859-1?Q?gueMqKpy29oOhuYERyroH2J84HcmRg9lOxbB2XhYkEikjDe5vLp2w57OJ7?=
 =?iso-8859-1?Q?dD91Gdm5JWMuMIvM0uTr/y9k58kD6Zbaz7EzBtQY5Jmj2BE1mwPz55uuD+?=
 =?iso-8859-1?Q?gCSaMdeD03ja/T107bMNyogPGA2XdIFJkCQ6LyVMN+/9ZVSfQ0YZlgjkG5?=
 =?iso-8859-1?Q?ivU6riF+kIeBGHFl9kBUTtu96N9qftqq9Csy65pFRETuxbFpsQAkFVmPK7?=
 =?iso-8859-1?Q?4GclRNVu/uVmcru5GzgD3CyCtVMnIZxFU525SqsUShi8LTQgdh9z9Ql4s3?=
 =?iso-8859-1?Q?ul7vDvCCene/Aqc6T+0XI0NmQlc3mAeABzKUtjL3ES7nrbrt/zQbk+kW3P?=
 =?iso-8859-1?Q?6eNjFGbFLKvSjNOGz8Ws1ipzvKxQCZ/ucdPXeXVbchDiqPP6p1/qWi3w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5287c97a-a381-4d31-34e8-08dcfd17dc6a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 21:30:10.5497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w6xOfXJxPY0Bc0TWNquOUuSm1IUoWv/yUBLXnnNBy6ZicWv7JK1bzRHKfpJS7XsOh2Z2xOuA/AXc8V2VnuACTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8064
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

On Mon, Nov 04, 2024 at 08:47:01PM +0100, Christian König wrote:
> Am 01.11.24 um 00:43 schrieb Matthew Brost:
> > On Thu, Oct 31, 2024 at 11:10:42AM -0700, Matthew Brost wrote:
> > > Non-contiguous VRAM cannot easily be mapped in TTM nor can non-visible
> > > VRAM easily be accessed. Add ttm_bo_access, which is similar to
> > > ttm_bo_vm_access, to access such memory.
> > > 
> > > v4:
> > >   - Fix checkpatch warnings (CI)
> > > v5:
> > >   - Fix checkpatch warnings (CI)
> > > v6:
> > >   - Fix kernel doc (Auld)
> > > 
> > Christian - Do you mind if I merge patch along with the rest of the
> > series to drm-xe-next?
> 
> I don't see the original patch anywhere in my inbox, please make sure to CC
> me while sending things out.
> 

I think I had you on an earlier revision but used the wrong alias to send out
this latest one. I will be sure to include you on future patches.

Would you like to continue the discussion here, or should I send out a fresh
revision with you included and an updated commit message?

> Apart from that I absolutely don't see any justification for this patch. You
> move stuff into ttm_bo_util.c which not even remotely belongs in there.
> 

The justification is that EuDebugger requires essentially the same functionality
as ptrace -> vm_access. This patch simply adds a helper to achieve this. There
is no functional change to the existing code.

Regarding the statement about ttm_bo_util.c, that seems quite aggressive. It is
a TTM BO helper function, so it could logically belong in either ttm_bo.c or
ttm_bo_util.c. A BO helper definitely shouldn't call into ttm_bo_vm.c, nor
should it reside there. Perhaps I chose the wrong ttm_bo* file? I apologize for
that. It would be helpful to know why you think this is the wrong place so I can
better understand your expectations for TTM.

Matt

> Regards,
> Christian.
> 
> > 
> > Matt
> > 
> > > Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
> > > Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Tested-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> > > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> > > ---
> > >   drivers/gpu/drm/ttm/ttm_bo_util.c | 86 +++++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/ttm/ttm_bo_vm.c   | 65 +----------------------
> > >   include/drm/ttm/ttm_bo.h          |  2 +
> > >   3 files changed, 89 insertions(+), 64 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > index d939925efa81..77e760ea7193 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > @@ -919,3 +919,89 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
> > >   	return progress;
> > >   }
> > > +
> > > +static int ttm_bo_access_kmap(struct ttm_buffer_object *bo,
> > > +			      unsigned long offset,
> > > +			      void *buf, int len, int write)
> > > +{
> > > +	unsigned long page = offset >> PAGE_SHIFT;
> > > +	unsigned long bytes_left = len;
> > > +	int ret;
> > > +
> > > +	/* Copy a page at a time, that way no extra virtual address
> > > +	 * mapping is needed
> > > +	 */
> > > +	offset -= page << PAGE_SHIFT;
> > > +	do {
> > > +		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
> > > +		struct ttm_bo_kmap_obj map;
> > > +		void *ptr;
> > > +		bool is_iomem;
> > > +
> > > +		ret = ttm_bo_kmap(bo, page, 1, &map);
> > > +		if (ret)
> > > +			return ret;
> > > +
> > > +		ptr = (void *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
> > > +		WARN_ON_ONCE(is_iomem);
> > > +		if (write)
> > > +			memcpy(ptr, buf, bytes);
> > > +		else
> > > +			memcpy(buf, ptr, bytes);
> > > +		ttm_bo_kunmap(&map);
> > > +
> > > +		page++;
> > > +		buf += bytes;
> > > +		bytes_left -= bytes;
> > > +		offset = 0;
> > > +	} while (bytes_left);
> > > +
> > > +	return len;
> > > +}
> > > +
> > > +/**
> > > + * ttm_bo_access - Helper to access a buffer object
> > > + *
> > > + * @bo: ttm buffer object
> > > + * @offset: access offset into buffer object
> > > + * @buf: pointer to caller memory to read into or write from
> > > + * @len: length of access
> > > + * @write: write access
> > > + *
> > > + * Utility function to access a buffer object. Useful when buffer object cannot
> > > + * be easily mapped (non-contiguous, non-visible, etc...).
> > > + *
> > > + * Returns:
> > > + * @len if successful, negative error code on failure.
> > > + */
> > > +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
> > > +		  void *buf, int len, int write)
> > > +{
> > > +	int ret;
> > > +
> > > +	if (len < 1 || (offset + len) > bo->base.size)
> > > +		return -EIO;
> > > +
> > > +	ret = ttm_bo_reserve(bo, true, false, NULL);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	switch (bo->resource->mem_type) {
> > > +	case TTM_PL_SYSTEM:
> > > +		fallthrough;
> > > +	case TTM_PL_TT:
> > > +		ret = ttm_bo_access_kmap(bo, offset, buf, len, write);
> > > +		break;
> > > +	default:
> > > +		if (bo->bdev->funcs->access_memory)
> > > +			ret = bo->bdev->funcs->access_memory
> > > +				(bo, offset, buf, len, write);
> > > +		else
> > > +			ret = -EIO;
> > > +	}
> > > +
> > > +	ttm_bo_unreserve(bo);
> > > +
> > > +	return ret;
> > > +}
> > > +EXPORT_SYMBOL(ttm_bo_access);
> > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > index 2c699ed1963a..20b1e5f78684 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > @@ -366,45 +366,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma)
> > >   }
> > >   EXPORT_SYMBOL(ttm_bo_vm_close);
> > > -static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
> > > -				 unsigned long offset,
> > > -				 uint8_t *buf, int len, int write)
> > > -{
> > > -	unsigned long page = offset >> PAGE_SHIFT;
> > > -	unsigned long bytes_left = len;
> > > -	int ret;
> > > -
> > > -	/* Copy a page at a time, that way no extra virtual address
> > > -	 * mapping is needed
> > > -	 */
> > > -	offset -= page << PAGE_SHIFT;
> > > -	do {
> > > -		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
> > > -		struct ttm_bo_kmap_obj map;
> > > -		void *ptr;
> > > -		bool is_iomem;
> > > -
> > > -		ret = ttm_bo_kmap(bo, page, 1, &map);
> > > -		if (ret)
> > > -			return ret;
> > > -
> > > -		ptr = (uint8_t *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
> > > -		WARN_ON_ONCE(is_iomem);
> > > -		if (write)
> > > -			memcpy(ptr, buf, bytes);
> > > -		else
> > > -			memcpy(buf, ptr, bytes);
> > > -		ttm_bo_kunmap(&map);
> > > -
> > > -		page++;
> > > -		buf += bytes;
> > > -		bytes_left -= bytes;
> > > -		offset = 0;
> > > -	} while (bytes_left);
> > > -
> > > -	return len;
> > > -}
> > > -
> > >   int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> > >   		     void *buf, int len, int write)
> > >   {
> > > @@ -412,32 +373,8 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> > >   	unsigned long offset = (addr) - vma->vm_start +
> > >   		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
> > >   		 << PAGE_SHIFT);
> > > -	int ret;
> > > -
> > > -	if (len < 1 || (offset + len) > bo->base.size)
> > > -		return -EIO;
> > > -	ret = ttm_bo_reserve(bo, true, false, NULL);
> > > -	if (ret)
> > > -		return ret;
> > > -
> > > -	switch (bo->resource->mem_type) {
> > > -	case TTM_PL_SYSTEM:
> > > -		fallthrough;
> > > -	case TTM_PL_TT:
> > > -		ret = ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
> > > -		break;
> > > -	default:
> > > -		if (bo->bdev->funcs->access_memory)
> > > -			ret = bo->bdev->funcs->access_memory(
> > > -				bo, offset, buf, len, write);
> > > -		else
> > > -			ret = -EIO;
> > > -	}
> > > -
> > > -	ttm_bo_unreserve(bo);
> > > -
> > > -	return ret;
> > > +	return ttm_bo_access(bo, offset, buf, len, write);
> > >   }
> > >   EXPORT_SYMBOL(ttm_bo_vm_access);
> > > diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> > > index 5804408815be..8ea11cd8df39 100644
> > > --- a/include/drm/ttm/ttm_bo.h
> > > +++ b/include/drm/ttm/ttm_bo.h
> > > @@ -421,6 +421,8 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo);
> > >   int ttm_bo_evict_first(struct ttm_device *bdev,
> > >   		       struct ttm_resource_manager *man,
> > >   		       struct ttm_operation_ctx *ctx);
> > > +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
> > > +		  void *buf, int len, int write);
> > >   vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
> > >   			     struct vm_fault *vmf);
> > >   vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
> > > -- 
> > > 2.34.1
> > > 
> 
