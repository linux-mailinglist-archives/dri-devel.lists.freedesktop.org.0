Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A43C9A294D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 18:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A62510E883;
	Thu, 17 Oct 2024 16:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EJXWMUB8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 160DE10E168;
 Thu, 17 Oct 2024 16:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729183450; x=1760719450;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mF5yBJXuZj8ANZ/cYV+2booiwGLwwA5Utl8RFr3pMqc=;
 b=EJXWMUB8LsnpwrFDtDEzuPACciwhwwNjj68uWYFjTaMBeb9JtC39gyDQ
 fIKKqQ6znJ9Q+BvCn7mgEoY857rqMClFw71GSgKtI34EAsS4zRStekxrg
 e98CWNtgk061tGkjcU0d3BD48Zccn/wPBVPCd5QeLD0zFEfZV0p5V7X9O
 z7aO6gj3Bih4gnw4YmLb2mfs705eWD43FffYwjBqIaJUkSUCZPs3wFYV7
 wl0cuTeVZ80R72S7MJlkg5sWmZzLbqPMI4kjhDdeoJ0hbXP31Nb6MQPJI
 0l0OgJ6QEvNtMp2XT8aWQURsOgSpTJoFR2hKbHfXaPw1YhcSgTx7hGvsB w==;
X-CSE-ConnectionGUID: mzW42sUHTnC50CURRYI5AA==
X-CSE-MsgGUID: I8ivanrOTXK6iIEYnoVPLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32369297"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="32369297"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 09:44:09 -0700
X-CSE-ConnectionGUID: RzoSr1m7T5G+ho9AK33ifA==
X-CSE-MsgGUID: NRpRoUaITsiEFN9HZK8EIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="109411051"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 09:44:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 09:44:07 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 09:44:07 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 09:44:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYrrbi4F+LtwsLZ6BL7kJrDCDiBK4mWPj2nusNPA14LywNmIgMnQtk8YEryK9uNKfs8KXAwMH8M7YV61cgPsiW/1iHq1d13z0pUEE5b8xrfOrVyozCZHmv0zN7qbc3AnyqmXeT4LyAMtN764atIVfArfqDSSjpGGQMG9XiXl2NbgK5Fjoaqnzj649p1yCaFg4RXU6IDJsMbO2he1rEdQ+dqdwNdyjB2xIFe4luanZZfjFjuUIs4+RsYcSZMs3RjlrDzUeO+HAd6Fl0MUZYDlV62AAjiRYaMVSLpcI9Fi8ExF7OL0nXPe1DJeTc5oz3PwZzn4zWvIIBOWAOMwLD69fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWTgg4cchy6tr9B4UWNJ2J4f+f3fmdfeVf1sv64zS/M=;
 b=AhmbQUQsv8O7xftCDcv01g8sGI5Ta2GuY9rNs8DPumSSb2d8xrZQOXgo3+qBnvLFOGrro2iQLu10LQeHD7rUzz0HiaJn9UsfCMPUx6uL1WyckFRdt0nHx1NiE8bZZf82c/jApk7fCrRviRjZcG1D4agknZTQqA95fQ/4Hly/kgQcrwqgqYTke6zVZgaNKuk4OCtS6g7tXC0hE7Uxz+amsLB0a2OyBy3W98JFwfAp2BJjIzR1KdohgJ9oZeXFClFW8x+I4/9xiSdIKH4qJGcnPkhLxRaAeAyXYzCdOVrTWwkIjCAYx1DmLwaqquaKRcUWSpmagmQk5yRE0uZSG9cCcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH8PR11MB6801.namprd11.prod.outlook.com (2603:10b6:510:1c9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 16:44:00 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8069.018; Thu, 17 Oct 2024
 16:44:00 +0000
Date: Thu, 17 Oct 2024 12:43:51 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: Raag Jadav <raag.jadav@intel.com>, <airlied@gmail.com>, <simona@ffwll.ch>, 
 <lucas.demarchi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <jani.nikula@linux.intel.com>, <andriy.shevchenko@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <tursulin@ursulin.net>,
 <lina@asahilina.net>, <intel-xe@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <francois.dugast@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>,
 <andi.shyti@linux.intel.com>, <matthew.d.roper@intel.com>,
 <boris.brezillon@collabora.com>, <adrian.larumbe@collabora.com>,
 <kernel@collabora.com>, <maraeo@gmail.com>, <friedrich.vock@gmx.de>,
 <michel@daenzer.net>, <joshua@froggi.es>, <alexander.deucher@amd.com>,
 <andrealmeid@igalia.com>, <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v7 1/5] drm: Introduce device wedged event
Message-ID: <ZxE-x6osh_jFHl5X@intel.com>
References: <20240930073845.347326-1-raag.jadav@intel.com>
 <20240930073845.347326-2-raag.jadav@intel.com>
 <ZxB6yKRrgvCoRK7y@black.fi.intel.com>
 <9b720b21-6195-408c-88bf-a092e0e7555c@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b720b21-6195-408c-88bf-a092e0e7555c@amd.com>
X-ClientProxiedBy: MW4P222CA0008.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::13) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH8PR11MB6801:EE_
X-MS-Office365-Filtering-Correlation-Id: b8855940-146e-43f1-b0df-08dceecae6b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?M3rEXuCYE5kLvszGNMxWse9cK9HbOGDCuZVD9ff2GISpL5gV93iDZaiUSJ?=
 =?iso-8859-1?Q?4I0wElDsMXjo41KjTY3yTkpfsp1cxUC+6UYANLkT2RESSKeXCPTjrOyL4Y?=
 =?iso-8859-1?Q?iGlbj+udp1FdN085cQ8TsyhMl7DHNuprRNaqxD5p0RqrRYNNnYPK3gemGl?=
 =?iso-8859-1?Q?iTbdhVqfhgyWwKE8GxOU+ySzxJjDNd+1z42vrvoQHgF++Yye6i8ekF/c+3?=
 =?iso-8859-1?Q?E/+mUaHWCWC4Y9zEDJnCk9qiW47cWFvlnCsZlebOjdb5RowjXgJq3F3uBj?=
 =?iso-8859-1?Q?7ewTsmUFFy04qPAFFW3/r2G9iCMORcRvmWrxt0nA+XSDKq51Ru5rfeEKha?=
 =?iso-8859-1?Q?qq2s3p/T/udc/7pe30FGlrJ3jDmh9cTXKM5ctErFSDNKVkkasaPiB3BXpu?=
 =?iso-8859-1?Q?PcgNAckqbTJWLzzB5D4QsP9B5wx7jaDumjTfXVvmjM0H7B8b1zaGpbfEvP?=
 =?iso-8859-1?Q?81dKrCUepxCmGiJDJwiTKhCbzvyPqBQvACrA43y0TiE1Ku3a8iNbqti0sQ?=
 =?iso-8859-1?Q?oISwG+VT5uYDZFePbor0QebbfRepMvRyILDRtoBsGTRTbVO+hIM/uAFKfQ?=
 =?iso-8859-1?Q?I3N0WwqyCDhgreqAm1TWDYud8YUAgTsR+R5NXQF9uAuxVUu7ZER0Yo1iu/?=
 =?iso-8859-1?Q?eLurdxqFCOeyB9mv4/xu6Fv6Iv9iUOLdwYbTRm4ybyRbJF3cY+seMS05Tm?=
 =?iso-8859-1?Q?njI4S440Bzv9hMfbynca7AfMoIw1324oNNFMFO2zmMHi6Evh1LKpaGYyWC?=
 =?iso-8859-1?Q?R5ZfS5HROGPn/BY0xpd/w41QRpn/WHN/JAn0mDIrue6iq//zIpqON2ftE3?=
 =?iso-8859-1?Q?bh0ATjz0eUEPQQDp9Vpgzyr3rVLHNiK5MBkJjUh2hOAsoVQJxhJ6tLMNfm?=
 =?iso-8859-1?Q?SCUhN72UoLcfKET7KXLdLu5vIW1Mb9kL3COUBCjD2aqEnISvhQL/d/IdvO?=
 =?iso-8859-1?Q?hwvdrF4auMVd+dPv5WgfLSLRxFjZtDdceKu9JijydK5cAgsykeJcD3sGvd?=
 =?iso-8859-1?Q?pMvMshZU7bxwvaNTk5hecc1+wK5mVR4vY5vdq7UF7u7yeFPCzuYSsiU/fn?=
 =?iso-8859-1?Q?bZRMCv3+/2t2Y7xz0pRqUpN3oQYUOL9fOfudhiGb3hlul9SfjdMT3gxEw3?=
 =?iso-8859-1?Q?mN9IkRU7ab3R7rf8j0ZIcjmKSky2pZvej0qJerlNxyKyfgu4acO/k0Um3M?=
 =?iso-8859-1?Q?aDlt1zQfoSFIBDiwWQAe65Z0PKTYbEGRWHSMUiKHh+a2AYEQ6mFK5ynKTw?=
 =?iso-8859-1?Q?8laxsvTOPmaBTXOhBichBXaKi4XfslrqbC7cCSb9nQAH4heWY7ZMkGtC4r?=
 =?iso-8859-1?Q?AhTjzOs3vKpGvHYHbU/vspi3fTpCFPHeHXoXcuYGj2sv6JRvQFijo0NT6F?=
 =?iso-8859-1?Q?Onb7JyhiWZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mHaGNO9HTWXNqay4Cnmxmn1xs1Yu03T3MDkHyFk7lwwybDAZEBTfvpi5qN?=
 =?iso-8859-1?Q?UMU0Cnd/hvsNFZcMDAoxuMkOQng8zxBaACiCWySlHh1sEEtNfxGLV/1nkv?=
 =?iso-8859-1?Q?vDor/BaprtMHhBfMsKJ4srySO5Najvm4Q9ebyPCoOTrhnVm3nHSoTtZ21i?=
 =?iso-8859-1?Q?gkW2aRJn7643uVsE40V7XCO/2NnMCeqFNHh32tvx1qOZjXHz25vFRein7H?=
 =?iso-8859-1?Q?hsNskiFO00bCt45VE/5hUm1DVW8nUgIzwv+NPL174hgUwClKvISZAmX9e7?=
 =?iso-8859-1?Q?oWd9nwaSrn/JePt8HuTVAU5r7ODz4bq8ZM0f9eTf/94Dzm2qnE6V1fAYpT?=
 =?iso-8859-1?Q?VecOhT/ZCo0uGUaUNekVaID31LElHFed8rmgOiOvPFxK6k1FQm1C/My7OV?=
 =?iso-8859-1?Q?LXWCOFozvDraV7FufAvqUeH+QlbkKK558sC/5OyENxSfMWW9kjz2825dMK?=
 =?iso-8859-1?Q?TkGPnVMDlUoaIS+hl8+bMaLZ9sdRnW7U7k3lM2uDuTNHCf0sQLDO3de3Qo?=
 =?iso-8859-1?Q?o0YPwHmhNqSoR3vSFJjK5eGNPC7ULjSVLZXpzAb72fGzoenG1IZ95TtBzb?=
 =?iso-8859-1?Q?EypKT/rrkvZ8kgGIYYQUr71P/wSklNrMg+p18DXS/rzGCLwOj5d7YbgixG?=
 =?iso-8859-1?Q?62jjBGr1+s1zGk9VUReI4cfOnhn5wljyfvFyJOsZccjp4efpqdqIONK1xX?=
 =?iso-8859-1?Q?GCtv+hKAEIADb3EcSTFKQR4kY2u4CGrzrOB0KDZ1fuSQ8NBSyXk5X1n1wR?=
 =?iso-8859-1?Q?0IHRt6614DRh4O5w0zZF72oJ+sHKSXj0LvQrtGS6sRvTVEIU3kPL1+IlvQ?=
 =?iso-8859-1?Q?IRrcq83rem+wKBYQw1diHFrv4UIvqhrm3p2Jgfi3W1jZ4O0dDvNrTQ4BKV?=
 =?iso-8859-1?Q?QmFW7jTjI/2T17OuSPmPqLSWuZZ7LwKYNPNwPjbOsy+XRW2OS8baHtfD5D?=
 =?iso-8859-1?Q?2UEtLihjEDW5MXmFeiNa/o/O7IAnQbYtV++8ICsXzDKlMmv4wsL/ElO9ov?=
 =?iso-8859-1?Q?gbQk/2cblQarjdk6o33ZvhrH5BxSu9CzirYEtEEvQ3PicWI6ujktv0g/PM?=
 =?iso-8859-1?Q?HkdfXSxpeS/YSIDl2Lc9ws+t4i28UdqNhUPXqeja4bsLhfvUsW8N73Wsm0?=
 =?iso-8859-1?Q?xCACaSbA7bV2IA3CGok4bl9hVx68NaOKSC2fyuwscTMZHr8uG7LmmxIBFS?=
 =?iso-8859-1?Q?LSqgm1Tts7ZygZ2KMQLWIupFdYUi8KlsORIQc51mYUi6V+DjV3bfxET5Ce?=
 =?iso-8859-1?Q?hqvEuJHuvEKD8wOiYqWxicxIpq6WPpcaVjupNCF0XAH/jRe+NBX0nrvReR?=
 =?iso-8859-1?Q?hxLR1RbD2o7tEI9ZLR4z0XmVofhQgU92PmddN0pCcsnyT0g44fsJsCJCB3?=
 =?iso-8859-1?Q?2jLD+OothkydEA3dOAdcdOKcKzWY81D9PBohk740QbtYJ/7rr8tt3mIrKB?=
 =?iso-8859-1?Q?4LitzMl9DkgdV8BspDYrRIt0RWRt+9QSO1yX3n+9/vgZdSWxLfvsQxgGGJ?=
 =?iso-8859-1?Q?Ya6QemzVsYFFdGeDiaJd21NXj51iJn7SO/uyPA4PT73NjbZCAjfkt9ysPS?=
 =?iso-8859-1?Q?h0Zbpf6hekfcDq6ipV46unkXGhHWMC7ZdXf42MnlyLuvylcND3WfcmcyMu?=
 =?iso-8859-1?Q?CrCyUG8l684iBiSTTiWsMuKfg+ssW9yzyPKNjeBN6Pj2UzMeeAoIxxrw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8855940-146e-43f1-b0df-08dceecae6b9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 16:44:00.4710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y7mfkAbzoyRfFq6y+V/70dpGPNbq0XH0E6gT7BAMvy2GrnlGUoiqnZwA7f7uU/GqvdKhMUx720wywgDMGmm7hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6801
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

On Thu, Oct 17, 2024 at 09:59:10AM +0200, Christian König wrote:
> Am 17.10.24 um 04:47 schrieb Raag Jadav:
> > On Mon, Sep 30, 2024 at 01:08:41PM +0530, Raag Jadav wrote:
> > > Introduce device wedged event, which will notify userspace of wedged
> > > (hanged/unusable) state of the DRM device through a uevent. This is
> > > useful especially in cases where the device is no longer operating as
> > > expected even after a hardware reset and has become unrecoverable from
> > > driver context.
> 
> Well introduce is probably the wrong wording since i915 already has that and
> amdgpu looked into it but never upstreamed the support.

in i915 we have the reset and error uevents, but not one specific for 'wedge'.
This would indeed be a new one.

> 
> I would rather say standardize.
> 
> > > 
> > > Purpose of this implementation is to provide drivers a generic way to
> > > recover with the help of userspace intervention. Different drivers may
> > > have different ideas of a "wedged device" depending on their hardware
> > > implementation, and hence the vendor agnostic nature of the event.
> > > It is up to the drivers to decide when they see the need for recovery
> > > and how they want to recover from the available methods.
> > > 
> > > Current implementation defines three recovery methods, out of which,
> > > drivers can choose to support any one or multiple of them. Preferred
> > > recovery method will be sent in the uevent environment as WEDGED=<method>.
> > > Userspace consumers (sysadmin) can define udev rules to parse this event
> > > and take respective action to recover the device.
> > > 
> > >      =============== ==================================
> > >      Recovery method Consumer expectations
> > >      =============== ==================================
> > >      rebind          unbind + rebind driver
> > >      bus-reset       unbind + reset bus device + rebind
> > >      reboot          reboot system
> > >      =============== ==================================
> 
> Well that sounds like userspace would need to be involved in recovery.
> 
> That in turn is a complete no-go since we at least need to signal all
> dma_fences to unblock the kernel. In other words things like bus reset needs
> to happen inside the kernel and *not* in userspace.
> 
> What we can do is to signal to userspace: Hey a bus reset of device X
> happened, maybe restart container, daemon, whatever service which was using
> this device.

Well, when we declare device 'wedged' it is because we don't want to take
any drastic measures inside the kernel and want to leave it in a protected
and unusable state. In a way that users wouldn't lose display for instance,
or at least the device is in a debugable state.

Then, the instructions here is to tell what could possibly be attempted
from userspace to get the device to an usable state.

The 'wedge' mode (the one emiting this uevent) needs to be responsible
for signaling all the fences and everything needed for a clean unbind
and whatever next step might be indicated to userspace.

That should already be part of any wedged mode, regardless the uevent
to inform the userspace here.

> 
> Regards,
> Christian.
> 
> > > 
> > > v4: s/drm_dev_wedged/drm_dev_wedged_event
> > >      Use drm_info() (Jani)
> > >      Kernel doc adjustment (Aravind)
> > > v5: Send recovery method with uevent (Lina)
> > > v6: Access wedge_recovery_opts[] using helper function (Jani)
> > >      Use snprintf() (Jani)
> > > v7: Convert recovery helpers into regular functions (Andy, Jani)
> > >      Aesthetic adjustments (Andy)
> > >      Handle invalid method cases
> > > 
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > ---
> > Cc'ing amd, collabora and others as I found semi-related work at
> > 
> > https://lore.kernel.org/dri-devel/20230627132323.115440-1-andrealmeid@igalia.com/
> > https://lore.kernel.org/amd-gfx/20240725150055.1991893-1-alexander.deucher@amd.com/
> > https://lore.kernel.org/dri-devel/20241011225906.3789965-3-adrian.larumbe@collabora.com/
> > https://lore.kernel.org/amd-gfx/CAAxE2A5v_RkZ9ex4=7jiBSKVb22_1FAj0AANBcmKtETt5c3gVA@mail.gmail.com/
> > 
> > 
> > Please share feedback about usefulness and adoption of this.
> > Improvements are welcome.
> > 
> > Raag
> > 
> > >   drivers/gpu/drm/drm_drv.c | 77 +++++++++++++++++++++++++++++++++++++++
> > >   include/drm/drm_device.h  | 23 ++++++++++++
> > >   include/drm/drm_drv.h     |  3 ++
> > >   3 files changed, 103 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > > index ac30b0ec9d93..cfe9600da2ee 100644
> > > --- a/drivers/gpu/drm/drm_drv.c
> > > +++ b/drivers/gpu/drm/drm_drv.c
> > > @@ -26,6 +26,8 @@
> > >    * DEALINGS IN THE SOFTWARE.
> > >    */
> > > +#include <linux/array_size.h>
> > > +#include <linux/build_bug.h>
> > >   #include <linux/debugfs.h>
> > >   #include <linux/fs.h>
> > >   #include <linux/module.h>
> > > @@ -33,6 +35,7 @@
> > >   #include <linux/mount.h>
> > >   #include <linux/pseudo_fs.h>
> > >   #include <linux/slab.h>
> > > +#include <linux/sprintf.h>
> > >   #include <linux/srcu.h>
> > >   #include <linux/xarray.h>
> > > @@ -70,6 +73,42 @@ static struct dentry *drm_debugfs_root;
> > >   DEFINE_STATIC_SRCU(drm_unplug_srcu);
> > > +/*
> > > + * Available recovery methods for wedged device. To be sent along with device
> > > + * wedged uevent.
> > > + */
> > > +static const char *const drm_wedge_recovery_opts[] = {
> > > +	[DRM_WEDGE_RECOVERY_REBIND] = "rebind",
> > > +	[DRM_WEDGE_RECOVERY_BUS_RESET] = "bus-reset",
> > > +	[DRM_WEDGE_RECOVERY_REBOOT] = "reboot",
> > > +};
> > > +
> > > +static bool drm_wedge_recovery_is_valid(enum drm_wedge_recovery method)
> > > +{
> > > +	static_assert(ARRAY_SIZE(drm_wedge_recovery_opts) == DRM_WEDGE_RECOVERY_MAX);
> > > +
> > > +	return method >= DRM_WEDGE_RECOVERY_REBIND && method < DRM_WEDGE_RECOVERY_MAX;
> > > +}
> > > +
> > > +/**
> > > + * drm_wedge_recovery_name - provide wedge recovery name
> > > + * @method: method to be used for recovery
> > > + *
> > > + * This validates wedge recovery @method against the available ones in
> > > + * drm_wedge_recovery_opts[] and provides respective recovery name in string
> > > + * format if found valid.
> > > + *
> > > + * Returns: pointer to const recovery string on success, NULL otherwise.
> > > + */
> > > +const char *drm_wedge_recovery_name(enum drm_wedge_recovery method)
> > > +{
> > > +	if (drm_wedge_recovery_is_valid(method))
> > > +		return drm_wedge_recovery_opts[method];
> > > +
> > > +	return NULL;
> > > +}
> > > +EXPORT_SYMBOL(drm_wedge_recovery_name);
> > > +
> > >   /*
> > >    * DRM Minors
> > >    * A DRM device can provide several char-dev interfaces on the DRM-Major. Each
> > > @@ -497,6 +536,44 @@ void drm_dev_unplug(struct drm_device *dev)
> > >   }
> > >   EXPORT_SYMBOL(drm_dev_unplug);
> > > +/**
> > > + * drm_dev_wedged_event - generate a device wedged uevent
> > > + * @dev: DRM device
> > > + * @method: method to be used for recovery
> > > + *
> > > + * This generates a device wedged uevent for the DRM device specified by @dev.
> > > + * Recovery @method from drm_wedge_recovery_opts[] (if supprted by the device)
> > > + * is sent in the uevent environment as WEDGED=<method>, on the basis of which,
> > > + * userspace may take respective action to recover the device.
> > > + *
> > > + * Returns: 0 on success, or negative error code otherwise.
> > > + */
> > > +int drm_dev_wedged_event(struct drm_device *dev, enum drm_wedge_recovery method)
> > > +{
> > > +	/* Event string length up to 16+ characters with available methods */
> > > +	char event_string[32] = {};
> > > +	char *envp[] = { event_string, NULL };
> > > +	const char *recovery;
> > > +
> > > +	recovery = drm_wedge_recovery_name(method);
> > > +	if (!recovery) {
> > > +		drm_err(dev, "device wedged, invalid recovery method %d\n", method);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	if (!test_bit(method, &dev->wedge_recovery)) {
> > > +		drm_err(dev, "device wedged, %s based recovery not supported\n",
> > > +			drm_wedge_recovery_name(method));
> > > +		return -EOPNOTSUPP;
> > > +	}
> > > +
> > > +	snprintf(event_string, sizeof(event_string), "WEDGED=%s", recovery);
> > > +
> > > +	drm_info(dev, "device wedged, generating uevent for %s based recovery\n", recovery);
> > > +	return kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
> > > +}
> > > +EXPORT_SYMBOL(drm_dev_wedged_event);
> > > +
> > >   /*
> > >    * DRM internal mount
> > >    * We want to be able to allocate our own "struct address_space" to control
> > > diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> > > index c91f87b5242d..fed6f20e52fb 100644
> > > --- a/include/drm/drm_device.h
> > > +++ b/include/drm/drm_device.h
> > > @@ -40,6 +40,26 @@ enum switch_power_state {
> > >   	DRM_SWITCH_POWER_DYNAMIC_OFF = 3,
> > >   };
> > > +/**
> > > + * enum drm_wedge_recovery - Recovery method for wedged device in order of
> > > + * severity. To be set as bit fields in drm_device.wedge_recovery variable.
> > > + * Drivers can choose to support any one or multiple of them depending on
> > > + * their needs.
> > > + */
> > > +enum drm_wedge_recovery {
> > > +	/** @DRM_WEDGE_RECOVERY_REBIND: unbind + rebind driver */
> > > +	DRM_WEDGE_RECOVERY_REBIND,
> > > +
> > > +	/** @DRM_WEDGE_RECOVERY_BUS_RESET: unbind + reset bus device + rebind */
> > > +	DRM_WEDGE_RECOVERY_BUS_RESET,
> > > +
> > > +	/** @DRM_WEDGE_RECOVERY_REBOOT: reboot system */
> > > +	DRM_WEDGE_RECOVERY_REBOOT,
> > > +
> > > +	/** @DRM_WEDGE_RECOVERY_MAX: for bounds checking, do not use */
> > > +	DRM_WEDGE_RECOVERY_MAX
> > > +};
> > > +
> > >   /**
> > >    * struct drm_device - DRM device structure
> > >    *
> > > @@ -317,6 +337,9 @@ struct drm_device {
> > >   	 * Root directory for debugfs files.
> > >   	 */
> > >   	struct dentry *debugfs_root;
> > > +
> > > +	/** @wedge_recovery: Supported recovery methods for wedged device */
> > > +	unsigned long wedge_recovery;
> > >   };
> > >   #endif
> > > diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> > > index 02ea4e3248fd..d8dbc77010b0 100644
> > > --- a/include/drm/drm_drv.h
> > > +++ b/include/drm/drm_drv.h
> > > @@ -462,6 +462,9 @@ bool drm_dev_enter(struct drm_device *dev, int *idx);
> > >   void drm_dev_exit(int idx);
> > >   void drm_dev_unplug(struct drm_device *dev);
> > > +const char *drm_wedge_recovery_name(enum drm_wedge_recovery method);
> > > +int drm_dev_wedged_event(struct drm_device *dev, enum drm_wedge_recovery method);
> > > +
> > >   /**
> > >    * drm_dev_is_unplugged - is a DRM device unplugged
> > >    * @dev: DRM device
> > > -- 
> > > 2.34.1
> > > 
> 
