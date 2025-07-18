Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8391DB09A2C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 05:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E015110E0FE;
	Fri, 18 Jul 2025 03:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aDqdnsv4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AEF710E033;
 Fri, 18 Jul 2025 03:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752809520; x=1784345520;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=xN0Lf9oDVvmoBtRXCqdxbrsDqluq1vZ1xIqv+8fqWM8=;
 b=aDqdnsv4tJkabfblTv68MoF8WFqTYuV1rZO00LslEKRqtP9SDx2KLv8V
 8zPXmMUARFso8FTh5Aq/Ft/kQhwzHUIN3dp42MvhJRH2sOYFnPHR9Vz1j
 SMM7gsd2AW5emDMtFkZhHL8WYj5+73YSBN2Uu3a9XKhZxXUJzojw38deB
 3m42KIPUuf7Va6INicHC1ZFH7hcbyKGbzgABKHuO0o+2Th+DYbpYuk/Af
 vI6B0eW003a5KOv0ZYTC6S3+Oh3xXYyNvd05ESq6xs+niLKWLFKGVWuTo
 6Q1ShHtLIXpMx0Y+qajyzv9ScqLsB+G9BiUrhngsfXnm5rHsWcJQOBobi Q==;
X-CSE-ConnectionGUID: CeWZLgT+QS+DFSLsNz16HQ==
X-CSE-MsgGUID: LxettuAFTFi2bQp8r0EvVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="54979991"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; d="scan'208";a="54979991"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 20:31:59 -0700
X-CSE-ConnectionGUID: OcZ0lJrfSlGPAjGqiJwT2g==
X-CSE-MsgGUID: cMKWfbuuRlqAn5gXhy8oLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; d="scan'208";a="158653835"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 20:31:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 20:31:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 17 Jul 2025 20:31:57 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.81)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 20:31:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VV5rNA5/zbaRpNXQk1iPFMGvYDNzfJK52uDPabeAloI/vNvt5ie0uWMBQAgAYUsS8bw55QP+NXWXNDiH/pOe9vJ1NmFBdXxNF57hGvYTF5/9qcDsWPhOEKewex5a6MMnL81iYGa+3eDGNwUZyIfiO44gXSm6tJcfCO+sGLHHOKRJIzgcUQfDufTtU0LWzJhRCRI6/ExtYh5sKLD6j3CVmN/prbLsoQ71Mfnvt3L4XgIspc6hJKhqfILAL0QUl8rlGRaSfmRIwYzDaQ6u/t8hK57YGbQqjVdNYqhx/hwTxKr+M1PckkKq43vgkUL8wzuevxYyPdi7ANCQ6seG8rdwhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDTlUp9HrkXFwsYiSItyn1rFUgWKlw7GgyePttVxztY=;
 b=I9w/UISgEIleePihVKQJ1vkT/AcOqQd+c+4YqwRFs9ycH+Jsm4SnX3HUEIE5kQGxn3+SSeeudR4UDrrZldGdKJNWC3X1eQ2qVfcOub479PSjuKaryr/ARuU2Hl3uezkHjyQbYoGw6aOew3hUPa0PXQ1hitPYnCWqOqvLctsavS3KaAV5PukUSdHmYm2p4afNJDEiUK8VpL3Aux98ZgTxKvFiivAdgMBzeOsEVI07HDz80ZQrjExxfkjrNLEOBRzJ3wGK/qAeoMD836urFRD5nDIFLF5I754i9mpz0KcaYQw85pgYXE9e2oNht/M3nEcCzu5tVyXBqdekNuwtq2Jjcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 03:31:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 03:31:49 +0000
Date: Fri, 18 Jul 2025 00:31:41 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-fixes
Message-ID: <6jworkgupwstm4v7aohbuzod3dyz4u7pyfhshr5ifgf2xisgj3@cm5em5yupjiu>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR03CA0096.namprd03.prod.outlook.com
 (2603:10b6:a03:333::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6391:EE_
X-MS-Office365-Filtering-Correlation-Id: da3a500e-3a91-45e0-b25a-08ddc5aba0e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O31xgNHMEVOcbOhchEaMECYxZELjk7aqBXIdK7R6Z8aPe4riLaawwAJVWMv5?=
 =?us-ascii?Q?bOv2H1QkgGy+7RBnzP/mTAKFr/KdnZYhJGP0chZho97QomYO9gs7CUC0KQyc?=
 =?us-ascii?Q?fbBxpPuhIVBODZ33VlZ01pUntQWd7xsZOw2jeOYxlcXnN6uDunV2MLOx8sn3?=
 =?us-ascii?Q?8a0uz4gDJ5Yfq0jQ3CuGF7KffN0XH3F7S0F5bxNKVvFK1u3V8c4rU8KeFxKq?=
 =?us-ascii?Q?IzYSAbWbMalCtqLht9dZCfmc2n1aYdLFvBE1Ao62c8Xd7Ag08Fx5b8MUSZcE?=
 =?us-ascii?Q?iYtNDrE/j2eF56NaMcaO7/ZhFby5zJz/9f95uiHS6vH3CsO41f4U4ovPjNBI?=
 =?us-ascii?Q?RP2FwZOtHwXJpL8inMD+6ySTWe7P9QXCw0qQSSq0BOV4L6VPNn4wJyGmLlk4?=
 =?us-ascii?Q?RL11dXY1NRyOnvPdE4t3VR8zHALCj70xdyANd/XxpxqxJJHpOoY1odnJEwyr?=
 =?us-ascii?Q?nhnSV4mWGlQM0kit+7w3OT738XAvOPJvV+LemZG6KT/u0iEz13B+gz6hEMFw?=
 =?us-ascii?Q?O56oba7UqIZlKAK5eM/BVeDunZrEEX8NYTbCxGonrVcS/r8R5B7W4x7fb8SY?=
 =?us-ascii?Q?GheZ86dq53imX2NzVnb6dPhgJYhFMj+vB6iG41YneeU5NGTuI3vsAr7z6U+F?=
 =?us-ascii?Q?jUXS0EafqwzKn0Iq3V0UaVlNDJK0VL8/o41GDgx6OWO4V3iuLzueZ2Dix7Qx?=
 =?us-ascii?Q?M+PfdGVGebvuoEUr2IPtrvIS1msFUhwjomOBtlFbXdXa4RcSD5oIsUKtdANe?=
 =?us-ascii?Q?KlL0h3YYq2Cl4aw8J7Fgk5QKZgCHJW+1wHQwHfrDaKhbW1jCEcHGxU3Dz/oM?=
 =?us-ascii?Q?rtUQu2S4iTarLZPja1p4oljbIYMxWeGbnZjB0e5LD0RabpSy6VWew+4Pq7wm?=
 =?us-ascii?Q?OEWt3JJKAsPvVpXzMqkDyyHmMD17m4lZ+ZwKd6r8WA5DzRITiLmzj4vbzgyq?=
 =?us-ascii?Q?ta3WO+ByMzziyP97qFo0NGHSIrmiEvjmqz/fb+GYjyHDxgnzvRqv9PikP9IP?=
 =?us-ascii?Q?/ENXNHxdZmfsJVHiab8POZPo17sMl7djrk3E3WdaO7BsbWZx95DIl2pv9m7P?=
 =?us-ascii?Q?ANLwjF1yzIZR+CbhtR7y7pPt519Sw3b6/jYnAGiA4zowJFQWioKuJnTPvR0O?=
 =?us-ascii?Q?jgzc+rohXwGTosVCzQx4nwXEDY2vn2ljV6EdEytDvGxryAw6LVYLf5JBqqwg?=
 =?us-ascii?Q?IkWFkBx2KjlOtUn9Niv/C8yX/PT+WOT6YoDda9sASxsMk1xxvt6Btlyvueit?=
 =?us-ascii?Q?byNl6T++7gU2O2hYRQKjsv24OQxgi2qc2Yw7I9MoNbVENcDzjc6azh8zcfpK?=
 =?us-ascii?Q?epaBPjJstX44e9o4+bKxiHq0rRvWJocEHCWFj0fB/YApASpo+86RVt0l9x38?=
 =?us-ascii?Q?Bhq+KJk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1cmwnMRybsZhPZutcm2Pex5g6jAkfNxGdbbIt09H1NB2OhkaN4YbVtNGqT4r?=
 =?us-ascii?Q?VIrjGf8ue9dozHoUhRjKC8979JOFcvnnfBOrSH9H3iS9njvJINNmNAp63a7U?=
 =?us-ascii?Q?nA2Ngrjn4p1oti8CZfsqpJaqKFjgu5J6/+BJFR4wsc2KqelNg9vRMKrRyoKC?=
 =?us-ascii?Q?OqEZ+cWaCmq0lsWtc0ORtvSXZ3CfPXzQH7/RZ4FGVTkWxglKt2TiwNCqA+ye?=
 =?us-ascii?Q?dwZWhlbZzT9oyArP5DnKwPy184cSUu2OEoDoMGkyHHQPpEITM7akba4hw1ln?=
 =?us-ascii?Q?RaweGT3TU5cgLZQHG51AIzZeQ9oh3g5LtonMIVLSaoDomqcJlGbDvZfo/Bu1?=
 =?us-ascii?Q?Wn++AjB2KzMlniAD42pKO6Fkcju5JY1iy3RA0sXIte3KstuOZ329+1tCHqlK?=
 =?us-ascii?Q?yuSs+gp0Hxh0qlCojuuaY9lRQD/DjMvr0QYleOLMNFLbYs7igyGoyRfLHsLt?=
 =?us-ascii?Q?i0iSA5VkEdRrDf6WWPDxjRp1CUhlWvAktRXeJM9H1jlxNrXPIDOZqe+1TsaF?=
 =?us-ascii?Q?AoSfZfBuzCYcH6MMtZlBZSHAUuzxO6idauhw0LbEEI56s5KoM3EbIzrPbqp0?=
 =?us-ascii?Q?fPNWIbKLvAvKCzTZR1crTn0kJ0gEugBMlLGDj69aAavm4pGyx1Q9xjm3J+YB?=
 =?us-ascii?Q?z4PuFeAJDvJ/bdrchubRwKfxLdVHoM7LYGFIkmjnhGwUZd6ole8u6m2AutZQ?=
 =?us-ascii?Q?/lokGMT9/Np+wVOelPlksFWdDsXfXYIwlz/JeX5pX2IC9XmDWwsUSHwPHA9i?=
 =?us-ascii?Q?l0+Inafcufc0WDA2T0k1haj44VrOEkts1lJLOV93r7E+NkUCYSQ0tP6e9OLF?=
 =?us-ascii?Q?1vuU+00yLSGweXkU6PyI/oRLE4l2sFKSVxA2/xDYGxAzn1JPVCt7oa0ceiil?=
 =?us-ascii?Q?o30B93X2k3f03xB/Ooht8Ox5Y9kvSSLTFzbqLA4Mjc9sBF24nKgI62fXxRid?=
 =?us-ascii?Q?bngppX+KSN5u1d7OdNmG630fhtvr/7HbBUmlLUJsO44C0vedEB7FMa33G4DE?=
 =?us-ascii?Q?SI1ytorVWheCBuYPJo4adqYfYhBdkSMICHqEg4huTu8c1wQcmyUixILfEp7t?=
 =?us-ascii?Q?7ePMm8W5sWscV2y1LEhDgZGAQB+9kBgjzeLCJ51bluVhsSwpoySV7D6/+ym7?=
 =?us-ascii?Q?ZRWFEvzinNMMKIzmPQdgc8abHnal8h1kxlamqVW8Bhjoja7vGTByY8XGeT0z?=
 =?us-ascii?Q?ddbvYWXP1Rf6+NWj6Gvk/c1Z8QAwrmdp4o6zReQ4JneC+MMMKB6CpPI1oNkr?=
 =?us-ascii?Q?6Yjv4TXV9I9ZdghCUfjjsxAQdwVeL8CqGtB7N4KhzoY1QsWL6artnPMbtWss?=
 =?us-ascii?Q?HHJ3Cxegktr2HO+8VBnih8+1P2Gdb6tJ5HClaVWgaEtWqBkHLAVf2QWnmNWy?=
 =?us-ascii?Q?qq2eGaXMp5NjEVYrTASjx6qDB7qmw3OletlrM54abS0tpyqHqYvbDjSJVr3G?=
 =?us-ascii?Q?qZZGgv2xb35jgR4cW9630LcRfdpVd653P18fn1/A5md4ElFOk/HXT8zdCgwe?=
 =?us-ascii?Q?ilMNQ6dFJS6Y5RrE9Obd0AzsUSGDwzEhVC0Oi6Rz0HjTpdP5rz2LiJa01bBb?=
 =?us-ascii?Q?KjEjgkvqJXytZL8Dg8XIKbJQIePsnKbFcQLG8m7Y1nT4j+/C8QSXFe47P4bz?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da3a500e-3a91-45e0-b25a-08ddc5aba0e4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 03:31:48.9850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TwNDxwPsH50xSP4YZg8RHSnGEO9D4EwDX17OjXim+vbd47Z2HR6Rg0wG+cLoRn/UEboPF61Z+reunrZAItLVZFu8ienHXHctjFx52Lr5Npc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6391
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

Here is drm-xe-fixes targeting v6.16-rc7:

drm-xe-fixes-2025-07-17:
Driver Changes:
- SR-IOV fixes for GT reset and TLB invalidation
- Fix memory copy direction during migration
- Fix alignment check on migration
- Fix MOCS and page fault init order to correctly
   account for topology

There's a small conflict when applying drm-next and when applying
drm-xe-next on top of them, but should be trivial and already solved in
drm-tip.


thanks,
Lucas De Marchi.

The following changes since commit 347e9f5043c89695b01e66b3ed111755afcf1911:

   Linux 6.16-rc6 (2025-07-13 14:25:58 -0700)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-07-17

for you to fetch changes up to 5c244eeca57ff4e47e1f60310d059346d1b86b9b:

   drm/xe/pf: Resend PF provisioning after GT reset (2025-07-17 09:51:51 -0300)

----------------------------------------------------------------
Driver Changes:
- SR-IOV fixes for GT reset and TLB invalidation
- Fix memory copy direction during migration
- Fix alignment check on migration
- Fix MOCS and page fault init order to correctly
   account for topology

----------------------------------------------------------------
Balasubramani Vivekanandan (1):
       drm/xe/mocs: Initialize MOCS index early

Lucas De Marchi (1):
       drm/xe/migrate: Fix alignment check

Matthew Auld (1):
       drm/xe/migrate: fix copy direction in access_memory

Matthew Brost (1):
       drm/xe: Move page fault init after topology init

Michal Wajdeczko (2):
       drm/xe/pf: Prepare to stop SR-IOV support prior GT reset
       drm/xe/pf: Resend PF provisioning after GT reset

Tejas Upadhyay (1):
       drm/xe: Dont skip TLB invalidations on VF

  drivers/gpu/drm/xe/xe_gt.c                 | 15 +++++++++------
  drivers/gpu/drm/xe/xe_gt_sriov_pf.c        | 19 +++++++++++++++++++
  drivers/gpu/drm/xe/xe_gt_sriov_pf.h        |  5 +++++
  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 27 +++++++++++++++++++++++++++
  drivers/gpu/drm/xe/xe_migrate.c            |  6 +++---
  drivers/gpu/drm/xe/xe_ring_ops.c           | 22 ++++++++++------------
  6 files changed, 73 insertions(+), 21 deletions(-)
