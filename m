Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 467759247CA
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 21:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4EC10E132;
	Tue,  2 Jul 2024 19:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BcgRX2fL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0EB10E069;
 Tue,  2 Jul 2024 19:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719946961; x=1751482961;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=tSoMpXuSwfOvJusjuUOdj1Wak8ee30ih7zAH2pn2P60=;
 b=BcgRX2fLz94+VErcqNRHoTrzwWZzNIm9ezw+SxCUQiLmLuXbsOcRCL49
 +a5wkPxooZFkb/6/fotMxmyhvtKRVISfPCZImh2oVJV46f7ARTwVah4eF
 vKX6fEbfxydN1qhHcSqyIwBXmypYrZ0U1aMx9ke3Rjgl6TR6IoYYdU7tq
 MOMtVuu2KlTzjO8nDjZ7lD060QmQnOVCtvtTX634kZBlPPjeqP8/wHwX9
 04tYqS3evOupfF4LtB3+Nd218N6y0ErpeUxTW36fATvQ5jkdRHiu1Kvp5
 zFRmuTX0lKtsy2ugeW6/DUDjdc5gwv+BRV+avggKlyvqiImZ0nZURtXAJ g==;
X-CSE-ConnectionGUID: I6egB8txQh6WDkTPAbqt2w==
X-CSE-MsgGUID: TM03Rtr2QG2enhUZeImNtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="12362979"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="12362979"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 12:02:41 -0700
X-CSE-ConnectionGUID: fCTiQxfYSiixDBDYSdoEGQ==
X-CSE-MsgGUID: n20yOIqvS4eZC40cglhfeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="50336321"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jul 2024 12:02:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 12:02:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 2 Jul 2024 12:02:40 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 2 Jul 2024 12:02:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PfcFpTgfHERt5m+HMiS8poAnJRYnLdIMhBIc7ZOdL9yuk7tkC9OWjeF+oPoWS1ep8FcMyKIFWwZMqqF2kqts6bCJQKdQhYuimU+yBrOEttdamVmx7JIgIu8hZcSac2icj7ch+CNjodgqOhEtfi6utQVIWEJ5df/KABlz+WXHRYw0PaUZNZIuJD4vDqg7jID1+lNTefVHxFxxXPZwawCKfBoDLJaplIPq5eHYvtwXtvgvSae1LLrMc4fa/0o5VDWKwRU+n5hzt69Qs5xp8oIfyS0zxOBhukBkU6f0D26uDIB9WDpe9zqnOOZa2XZXHQ1DpsZ7csreGGgDcjc39zLrog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13YY4X4ECIw0aocHOwD+LVOzxkr2tMVRjprEmbUCX4E=;
 b=oJGMt9gaKBe9giyI3vwuYwwOueeWBxi66VVSiRrZUUXP+asTOPXPe79EYrqD0p2VNWDhwd0KfNZUlCXXXrAU1YY46Zl1Pby5+3btMsbOtEMfdDKmE/sd3Eb025/hDk9Glffm/dlogTVVMllp86kEpC3Z2uqhERS+AQaOsLl/zU+v9k1T6en42aAcOlO0+JmoqcvHAppAXoNAn8gFA1yFDYGjoLepqPdHtn34H2fg6YJVW2F6h6zXlPO3hVzu7JZV0Mygvm/PCmOoNRSgFjM5pdG/g6sn0F05O+r73Olfssj0k66/+px/31SrjlxlRBaODZcQUxEHKvkfX4Ko688Mig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB7804.namprd11.prod.outlook.com (2603:10b6:8:f3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Tue, 2 Jul
 2024 19:02:31 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7719.028; Tue, 2 Jul 2024
 19:02:31 +0000
Date: Tue, 2 Jul 2024 15:02:22 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-next
Message-ID: <ZoROvquFrTFhk3Pb@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR03CA0244.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::9) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB7804:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e630a66-80f7-4a48-a619-08dc9ac98608
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?udbuZc8bi+FNOV0hoqf7DnK6DjSK4Sz+sSSW50yz2+/LH3qlNyi6an1nd732?=
 =?us-ascii?Q?U96oEoSjK7wF0UkoyV8JwalJ0g/RO8K02kiCsFsNThHj6Orjk9FQk7oApY8p?=
 =?us-ascii?Q?FGi0GiUOEp7RQspNacWdtAZf41xc5cW8dMMegw+znS4Y3KKS82w0+Vqr3DS+?=
 =?us-ascii?Q?kKCaWpPZrQPKo1QwDwnsA2RfipBdbsKSOJjSJh6U1KmfXeqQoK267paLZ6Gc?=
 =?us-ascii?Q?VfxAYs71qKupKFGnA706YVuWzC25fPDSjg1fuy1bpw4gAoECFEZN/0V5Rhyh?=
 =?us-ascii?Q?1o4eZHsS7neY9vkcDpM11qaMulULkW4Gnc/q4T06CNYuFgJlVE6OuLI97ZjA?=
 =?us-ascii?Q?llB2OqnbszW5Rlb7+mAGVwzFXaJXGtQH0J8CtVeUFGnEFGBuL4dO9w8JEPnG?=
 =?us-ascii?Q?OCmLwWKzh9llczepjTxwHGe+Qt2D2GyOwHVs+LDx8KWQrdxPwfrThIr+yIpX?=
 =?us-ascii?Q?7F7bmIoDSAt9d0XKf1gWbqjxxOdyjMi5IQ+1kaORy3GvxYSexVAm6gFId3l7?=
 =?us-ascii?Q?NYXhnxXK+Pzr8bDVXEML0tVplnYHUCdxaPlpzO2jE3McI7chxGf2/GqwAyoT?=
 =?us-ascii?Q?UlG8/0l2R9mo3B50Gu7QbtDkl7p328k84E4+ZN+fFJtLMFeoZAEGagFdoXcF?=
 =?us-ascii?Q?7xwkInsMUy0nAO9Ta5KDIrnoby1HlewGuRHuTnRnS/CTG3CM9BBtj33wah7L?=
 =?us-ascii?Q?kKhJFXtP+EFaEn63VCGxDrfSuufNMAcgE+AitvBTWeagYol6/sN3C2Jem131?=
 =?us-ascii?Q?qaTdG51uMTdHgPnh9wZEkYJpIxzC3BBvuAC0HVP4FWMJlYUE/LQLgRfzAv+9?=
 =?us-ascii?Q?C1ahOetam+74ul6P4yMMSTtmMYiFC1MIZtvOHY+iAQGk4MWAisZUH9gqTgCI?=
 =?us-ascii?Q?+flA6x7KU4e4R6pV4l44ckASSwmz8QBo0foc4MZZ6Mio2ER/MfrboQy38OCw?=
 =?us-ascii?Q?Mgs0+GGe0MG6uhNp11g53yTHdst1OkFi0l6z8mvPOVr01h3w8oayMno0/ub4?=
 =?us-ascii?Q?QivdQCpgMHAunl+xnCTrg9h1CQxz9B2eBMzd+67jDu68ipRwIAG4fYFdO2WN?=
 =?us-ascii?Q?YwtWB84asxlYqTuQ5fu4plxXfRnHLGmmfhBGshiQ4v2zTkmWCXC5gydlpKQt?=
 =?us-ascii?Q?olLZzxVviTAgddl1NQeDjaybpMDjSZ07o13pq/fB5Nzc8am5f8P9RBSMWTB+?=
 =?us-ascii?Q?tvbpCUrK76cs+YaA95qsXxGqmwe6lZgfLYeWIhOfvCWoKSIstyeK3j7E975E?=
 =?us-ascii?Q?X/k3YPLoBjUSMRv3F3VuRTx7nDBjLb6suSVbOA9uoOlQV7fCX8eyJALITb0J?=
 =?us-ascii?Q?wLQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?juae3skVRj6kBqRdYpfikdDgPldveFitj7mHA/Dm5PFVI1zb7At0EH8WJ4lk?=
 =?us-ascii?Q?b6UNtyVY8NoMaqg6Y1EGk3xz1JOzZsR7oWJxQVFETVsmdHEl3/dpAlzwzRrm?=
 =?us-ascii?Q?dx7kFx5KDxGvu/aGPsdeIckGZIjdekV1TXd3VeX04H+uPaVLu9C91BVhtqur?=
 =?us-ascii?Q?piiKj6BMYNKkoPYv++95GjvIR2+AaTQkF0th17T3Ij7VixfmlJhP7UpZVFQD?=
 =?us-ascii?Q?b8vgYuEyF4mCq47nSTr3hmwKImZV3gEHakyGDDxPFOP+aUtSEgxPC51M/vWF?=
 =?us-ascii?Q?k8HrqjbRm6Xsx6ABHmievP9rgzPAde3se5rgCC/aOnhHN10BBUzKrjItdgQe?=
 =?us-ascii?Q?kAKbh89bl6Jme7f2Gormnc8E4LuRWq+/VvMYgvndxekon9uGDJSpH/QrglAd?=
 =?us-ascii?Q?tUZB6T2HXr2N261k9ubA/sOC4noMcyoucx6CttUM6xrCAZY/6AzAgWT1LAk5?=
 =?us-ascii?Q?v+y4FFhY89X1n7qYsKriomcyCOMIMnbkfHGBRtY2sO39LsfVGg9ROohJqziJ?=
 =?us-ascii?Q?qHUwGcfLDca523cbhVeJWfw2jVDBlM/JkVjD4C+XksN2CTNWSK2P/i1ZdZi6?=
 =?us-ascii?Q?FCZdsMwl3B0mAVg03cIyfti4Ov50aMD9wyxM4vzn77CBsfOT2fkes58JLwc9?=
 =?us-ascii?Q?85BFS23c6nn/ChpBzuO4WAsIRwV4PDXs1SzwdNCEjE9c4Na3V/vx81pJgZKV?=
 =?us-ascii?Q?zyXYp2y5D5Eto+8UiciNjkhsau2srmxyugdep2hrFg9gOip55gBPAQ94p9sK?=
 =?us-ascii?Q?OwXhFe74wH2Wi91WMGVP0dU/pGiuZXywYc6v993/ClEpaGVIVjZbgRzwii4w?=
 =?us-ascii?Q?poSpupNI5lhCfJMqjgBIvKA3EjQwnMTzwJooLQ8WzFnXJrKtC/VxzavXsFii?=
 =?us-ascii?Q?wcBPGEkop7GAZvAL64V7XqpZn0RzFBzIQqdbMcblJlWKhfaFotUXHA64BIHB?=
 =?us-ascii?Q?7gqrMi8XVmvP9RSas8326eM7bWtGpep8WgJoqSYuc6D+rDDceNi6DD2DoxYx?=
 =?us-ascii?Q?pn0yk5DECciZLzesc6zABIbs7lL0/eoeEwEUdxxKL/T5pX766SdvcAl/zEBX?=
 =?us-ascii?Q?U77YOCBHKYaktuV6N5vHN0I9OKT5JAH8kkvNEFSIrQC3VIwKcxHSznJg/KJP?=
 =?us-ascii?Q?tM1xty71yXRLvYaYGKgKH7td/f3ZxUHP1IBW/gee1acUcQ8M4bbunbwjoCsW?=
 =?us-ascii?Q?9v36FalBrETCZmMZxiW/eIyn7C2pe10//uUpWJBt6prs/WJDjEzizYBVuWTc?=
 =?us-ascii?Q?S1XmybdwQVh22h1cqIRWpvNl1kj93O8DilJnYFvEtDE3Mu7VjRj/wKFHor4n?=
 =?us-ascii?Q?C9n6n+Q9d9sGGZZfeq+hK5kjPxgg5r4klqiDagQA0zLowJAVbEJgxNOtj0eS?=
 =?us-ascii?Q?O6eI9KM9114//7lkxCYoGj5bNyFLvUBIuoflo7lHnQPvzZ5ukAo3Epkao3Jy?=
 =?us-ascii?Q?fvngJOzsU1fRlgdNg/wxTqFrhQB9dB9f/Yh6cNQbFDCitxLVRiQUdrNzT7Ok?=
 =?us-ascii?Q?G8k/EO/KA39hSMb5HMz6ptCddja2dEIk+m0xP03TciRkqZS/H74IKxwvKx6l?=
 =?us-ascii?Q?tc3LNBTOhgZeAyVgIJLnzkKskhvH3QYpesKoi+Y6UVBL/Hax0Me3KHCrnW9w?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e630a66-80f7-4a48-a619-08dc9ac98608
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 19:02:30.9987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AAWIIHrTvp5EaZw193f4gw6v99QeNkPlsKWS0zUP4E/H55IGtLWfZ/5ulHMF7Y62RFGVOuNqdT7engrcGOusEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7804
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

Hi Dave and Sima,

Here goes our actual last PR towards 6.11.
One extra to make the drm-xe-next-fixes smoother.

Mostly with fixes that would be anyway part of the
drm-xe-next-fixes, plus some more SRIOV preparation
and a BMG w/a.

Thanks,
Rodrigo.

drm-xe-next-2024-07-02:
Driver Changes:
- Fix in migration code (Auld)
- Simplification in HWMon related code (Karthik)
- Fix in forcewake logic (Nirmoy)
- Fix engine utilization information (umesh)
- Clean up on MOCS related code (Roper)
- Fix on multicast register (Roper)
- Fix TLB invalidation timeout (Nirmoy)
- More SRIOV preparation (Michal)
- Fix out-of-bounds array access (Lucas)
- Fixes around some mutex utilization (Ashutosh, Vinay)
- Expand LNL workaround to BMG (Vinay)
The following changes since commit 406d058dc323ae152d380ac90153eb56a75850c1:

  drm/xe/oa/uapi: Allow preemption to be disabled on the stream exec queue (2024-06-26 18:25:46 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2024-07-02

for you to fetch changes up to aaa08078e7251131f045ba248a68671db7f7bdf7:

  drm/xe/bmg: Apply Wa_22019338487 (2024-07-02 12:14:00 -0400)

----------------------------------------------------------------
Driver Changes:
- Fix in migration code (Auld)
- Simplification in HWMon related code (Karthik)
- Fix in forcewake logic (Nirmoy)
- Fix engine utilization information (umesh)
- Clean up on MOCS related code (Roper)
- Fix on multicast register (Roper)
- Fix TLB invalidation timeout (Nirmoy)
- More SRIOV preparation (Michal)
- Fix out-of-bounds array access (Lucas)
- Fixes around some mutex utilization (Ashutosh, Vinay)
- Expand LNL workaround to BMG (Vinay)

----------------------------------------------------------------
Ashutosh Dixit (1):
      drm/xe/oa: Destroy the stream_lock mutex

Karthik Poosa (1):
      drm/xe/hwmon: Remove xe_hwmon_process_reg

Lucas De Marchi (1):
      drm/xe/rtp: Fix out-of-bounds array access

Matt Roper (3):
      drm/xe/mocs: Update MOCS assertions and remove redundant checks
      drm/xe/mocs: Clarify difference between hw and sw sizes
      drm/xe/mcr: Avoid clobbering DSS steering

Matthew Auld (1):
      drm/xe: fix error handling in xe_migrate_update_pgtables

Michal Wajdeczko (3):
      drm/xe/pf: Remove inlined #ifdef CONFIG_PCI_IOV
      drm/xe/pf: Skip fair VFs provisioning if already provisioned
      drm/xe/pf: Restart VFs provisioning after GT reset

Nirmoy Das (2):
      drm/xe/client: Check return value of xe_force_wake_get
      drm/xe/guc: Configure TLB timeout based on CT buffer size

Umesh Nerlige Ramappa (1):
      drm/xe: Get hwe domain specific FW to read RING_TIMESTAMP

Vinay Belgaumkar (2):
      drm/xe/guc: Prevent use of uninitialized mutex
      drm/xe/bmg: Apply Wa_22019338487

 drivers/gpu/drm/xe/tests/xe_mocs.c          |  8 +--
 drivers/gpu/drm/xe/xe_drm_client.c          | 11 +++-
 drivers/gpu/drm/xe/xe_ggtt.c                | 11 +++-
 drivers/gpu/drm/xe/xe_gt.c                  |  6 +-
 drivers/gpu/drm/xe/xe_gt_mcr.c              |  6 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c         | 12 ++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h         |  5 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  | 78 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h  |  4 ++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 30 +++++++---
 drivers/gpu/drm/xe/xe_guc_ct.c              | 17 ++++++
 drivers/gpu/drm/xe/xe_guc_ct.h              |  2 +
 drivers/gpu/drm/xe/xe_guc_pc.c              | 15 ++++-
 drivers/gpu/drm/xe/xe_hw_engine.c           |  5 ++
 drivers/gpu/drm/xe/xe_hw_engine.h           |  1 +
 drivers/gpu/drm/xe/xe_hwmon.c               | 89 +++++++++++++----------------
 drivers/gpu/drm/xe/xe_migrate.c             |  8 +--
 drivers/gpu/drm/xe/xe_mocs.c                | 74 ++++++++++++------------
 drivers/gpu/drm/xe/xe_oa.c                  |  2 +
 drivers/gpu/drm/xe/xe_pci.c                 |  4 --
 drivers/gpu/drm/xe/xe_pci_sriov.c           | 13 +++++
 drivers/gpu/drm/xe/xe_pci_sriov.h           |  7 +++
 drivers/gpu/drm/xe/xe_rtp.c                 |  2 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules          |  1 +
 24 files changed, 290 insertions(+), 121 deletions(-)
