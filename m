Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FFFA0945D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 15:55:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C5F10F0F4;
	Fri, 10 Jan 2025 14:55:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XyIpSKQi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D60010F0F2;
 Fri, 10 Jan 2025 14:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736520910; x=1768056910;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=sdKTLwAn0W3j+54ocRki9Q9VF5+FK5IP5GcEuVwO9W0=;
 b=XyIpSKQiZxKz+ejwX0+EaJFixByk7SLh3bBbwUE0Qp0CI64A4lDu7M6q
 iK5Iwas5ibFh9ZKLkx9gni4imgZrsKzq0fPeHSbyEZJR1R4QsrzWR93JB
 VC/5jg+AWx59T4htNg3lla2fjjkM0+c5Eh11VYDNkcYq5Ehop6bre3hWK
 jS4bkUMNniRvcH3MkJlLS/2jtBsIHYCyj8BvlaId7OTavw40C7Oo5Zt2Y
 kwU9W79DtSK22sbDJdzk/X+nvK9CHlFDdDNCq7PmjsE6iSlMfSSOhQ9Q8
 ppRtaoLRQs7wgcgEjhWhR8Z3VmffDBKFSSsvnt/4cUnOsF5MsBZiwoQsU A==;
X-CSE-ConnectionGUID: F/ZJ4yFUSPeBJwTlOvh+ig==
X-CSE-MsgGUID: sKHBFEJMRYmmNNN/DOaGtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="54356638"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="54356638"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 06:55:10 -0800
X-CSE-ConnectionGUID: MbbDMkUWTCKY6x0BV/4ozA==
X-CSE-MsgGUID: zWpI9MSkTTeEqBSMh7I3rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="108670486"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jan 2025 06:55:09 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 10 Jan 2025 06:55:08 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 10 Jan 2025 06:55:08 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 10 Jan 2025 06:55:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ufWV8sH1xgmo0DDOcq0niPHpLm2HoeYxUgLRXwLzpPx+OWEbd6DT3Nv0xhtkJtxkQA5YPnDf8vVxQ2Xhuukq1Dq4dCiLSkr8n345hL31XtHj4h2doELequEyZtrDsW04ifhQFuqf4BawYnzQaruJ8lpFaovxGyZLPtlrXOP3BYylRdspDccJ4mjd/SVRyTOzXFaCOIKuIhcwPaYUUpGBPYhth8cVNFE4rwp3aJ1QxyW6z4EGa0JXxs2hAshukpCdeswqzuDe1Ux5Y7ShrZmFS4Jx3mc5rI0+tj/t7oNOw6YiqxSCigBvgAt5BLu3wo4iaiCe9Vho02XDZIJHia+6eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jDe7xTtg8Er7PMDSSkZ1kojKhzs0CaaOQkbbpQD8oI=;
 b=MxSuF6JhZVTSQeBS24p8fVR145YJ2g3/nz6SfgxoxRxy9y1eebKQTQEDNhZQqLgk6sZIVHA96hXCxENl/zdsrXSuf0rAtbd/iOd0xDjRvz+ot12I1sK2QyJBBQPD2t2bEetKhUnaoQdkLKtW2wtXdpOENfar67iiDEsxoWIUmQ2ZXNkxOCfw03Jj6rOHAa/L39KG5AywOOHxr7AAsoyaSECh9DcfN+i999+AfhfAqxJyf7I+36voOgFtLNkdl4cmDzZc/pLKFC1+m/6THqTAcEs2Gs1nkfaJT3M/J0/P4heahWKTBU8YCmOTPxQE4iInTx/BqhSZqmbiJTwu29Oeeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by LV2PR11MB6024.namprd11.prod.outlook.com (2603:10b6:408:17a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Fri, 10 Jan
 2025 14:54:51 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 14:54:51 +0000
Date: Fri, 10 Jan 2025 09:54:46 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
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
Message-ID: <Z4E0tlTAA6MZ7PF2@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: MW4PR04CA0042.namprd04.prod.outlook.com
 (2603:10b6:303:6a::17) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|LV2PR11MB6024:EE_
X-MS-Office365-Filtering-Correlation-Id: e8b82e47-c1b4-4a5f-a8c6-08dd3186bc2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pDhlnTPXYJQBEvrmcYy6TnRyjJeVAMq9Vubjy2l21e4VClKSuD4d63RtR+5i?=
 =?us-ascii?Q?+ZS0CmkyB4Pj2n3ZVC+/N/caAOjNhp4qbbwYT2jjrZrlmTyKo1YISiAWmbyL?=
 =?us-ascii?Q?aITa4NIiSoIN/us6AuDE9afhyVZb5IBWySWFIqlra2uRqoIWltf5uHZx25vr?=
 =?us-ascii?Q?DFWybfaqUkjFbEQtU07qXA+bkDGzIcHfNAYUrXzwLGcbEyvXsh+JQG2qvuqY?=
 =?us-ascii?Q?CvNII7RoVDLcTDR64VbynqO/H3SsBLzgPsfhsPtzHm1nDoNE0IoT5pR6Cw0l?=
 =?us-ascii?Q?vqLrrjYE+r4pSL58HL5OwRwZGkr0TfCg1kvbgAW7fYqDVGeJ1uJ4jkAmZ47F?=
 =?us-ascii?Q?MBCWcgvYj1VncLdPb+50McRDTAC9cE212UCOhJUujwCKXCqAWT9eo2sKz9Pi?=
 =?us-ascii?Q?a2NmabJpgGpK6lBSkM/zlsfMbLYANJMuqYEIGAPwsGqNuvB2n27Rx/4a2Xss?=
 =?us-ascii?Q?z2oEUiLM58zUo2rSz/lzQshbhViIbQb1ljfL+fZYDP7f3+2/QG/oiowZMosV?=
 =?us-ascii?Q?ZbqiCxqz4TQWCwukkv0b/ZT32DFLoRF7K4g7BgqJE93W1ghZd0i9BdmBWnV6?=
 =?us-ascii?Q?i0jpaD67gsLR+7n5HwB2oCtF7DqV4blAPdi4dW+i2ic3S7NSKmO50YSkvami?=
 =?us-ascii?Q?uGaf58WgBqNDpto5DCld0wZKUh3svJzH++HHpbMsNmFTk6c1uHp4VAvwWkHB?=
 =?us-ascii?Q?DunVf87O7co1PdJXyLDEhHC0iUunCc/ADHNAGz5t7wIlH9oIUMsIdLUfKEfP?=
 =?us-ascii?Q?tcuX6gf58+ScY3HmG7uzVRLRS87dJKFoiVlhKPEQVGhT4aE3cSwSRE9zTgxL?=
 =?us-ascii?Q?EASJtCumFLJ8zYPyVtGHbTqHhcGJKtnwdPhKptA1MB22FpMF00ebJ+wnX4v6?=
 =?us-ascii?Q?igfjo3PLxpOJpJMZFqBwbsNAZVQXVy7zYi45TAy/z7uhi/rJnGeyai0tDZp1?=
 =?us-ascii?Q?iZ5ydgdyW47QqS2YGQnKkJ8lOdGyAJdU88BqkPy4lSHvaS/l54xIOFJ7KDAK?=
 =?us-ascii?Q?JwAKdPGofJ5ILqPGBXCWsl630wZYvQQ4y8eLQWkxcsvoiEkKiPan278ZxnAQ?=
 =?us-ascii?Q?Cg1vDfYueakEfA7c3KgHc1VN3ZAjb1IPStMWOBm7I5X+kRAD29Fvr0VPWzbw?=
 =?us-ascii?Q?hOkN8Yvgf3LKp/7YS+hs1SyvWduUuG+YiQJx6ZNiS9G4vi4lH8Hi71SJfiEw?=
 =?us-ascii?Q?tWchc4stLZd1Dv+6Ikw1MUDus5jEihjLIKGQlB0pngL1bBIU7ykc5fjTphYb?=
 =?us-ascii?Q?nkMco23mBRoZS2jM6cR6bxmXYiBt8PMyMLXU0efLPvmr/iIxlfOwDoUvsXx3?=
 =?us-ascii?Q?ZOlkpz9yjEEt8gB6SImLDn7g/YFiOrFM0v+QGW011IC9gA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aefd02qsIA+SEycv0vy3nf0fPY8f55/8UPAhIOtCufQeKZBWaageNgRBg8B0?=
 =?us-ascii?Q?aMia7oxX8fo3C1bw6NQhTS4JuqcW9lnAfz+sROcb4joIqj7hv0sw28Gn3o2d?=
 =?us-ascii?Q?3UihOI0cYPLRraa3M/HoDzunyeW8KX+2qRGFS3M488OitqnucPCPw3b2QRCV?=
 =?us-ascii?Q?aQHWTnjN+YpsKrLU0oeYGe6r6eBfpg+mUbhYBtV/vIGP01PxqUxw0gJ/7ifb?=
 =?us-ascii?Q?hjKuNX8yrz4tHzVXQtUtiw0G8+EAGcnhbqNvL2xR8jh7FAlbOUERHgdm/wRN?=
 =?us-ascii?Q?txtO9H3NnTWeGTFsL75obLxzVBvcf8d3wf5TTlljTU2HPD1UakFj80MGxHsN?=
 =?us-ascii?Q?rf24ceWwH8qOx7e2VTRuBQoIsIx9i/CnTz1HZ73AG4PKgfkhSZnjvyRMb8nL?=
 =?us-ascii?Q?Hkk+iKEjhDijhTG5nCeB15cwUagiNLSf5qivaAjrQUEt6CXe+Xzo7KIMCF8N?=
 =?us-ascii?Q?x+3O8MVzfhaplj6GCmd5IjcA2LFnKdQwQlpaACoWvX1vDGiVfR58fWTSOB78?=
 =?us-ascii?Q?UQYeCVRjeGbVWXUEN7WaBWdfF2QRre9JmpuMpVsAvLHs8csUWOeRS18EI5z6?=
 =?us-ascii?Q?lWL3OZ4vrmsIZNmOa+bIw0q4bSSErmcvRhrTUwr+6vs+782MY8gBj5DjgSaW?=
 =?us-ascii?Q?5gJL4tAZjIHadpXWFPyfXy2Vw4DOO8i5XNUANamXWXFFls5+gtJbwFihulJ3?=
 =?us-ascii?Q?QDxcBvmdjhQBuaI2GT9pmOGjKmSmn3YGzTnIlbtQyYd3bAEcebwVjcOl1uBb?=
 =?us-ascii?Q?+OXKHo/xT94BaN3yRSEvYuwsxElkAPyYPEMfsECC5DrZMXWRa88GhsCTEzzI?=
 =?us-ascii?Q?3bs4qrbHMV1ZfDNxrwQXz1bk4QX6VQ9vXAhARWGIu9vvNgkgI/c9PVw3ZJxf?=
 =?us-ascii?Q?or8e2MyG6I0teAPF1ORUO0akMN1SpzrEklbwuksDXb0kfG9Z26B+BWUQSSj0?=
 =?us-ascii?Q?8rqadvR3qG6UJ5eb4YrBNAFskuzyxkeSadsGlB/GPi28LHhNhLTtBh+PS3tZ?=
 =?us-ascii?Q?s+Sm48mFuDvdY57IfPm49vGnbfwKjtFF5kXvSKV2Sht4u8yOajuKAxl7eODT?=
 =?us-ascii?Q?8snP1jpCu/Ybdub2sDbH7N+0m9GOagCF1wGs2dVlWINaAwZjvtzn8gvUD9J+?=
 =?us-ascii?Q?xM8S4rEuC+cvYNw28fluwUrzEwOzTbM5BGPYZXJ11/A4K7yPMVYS3B//IiFw?=
 =?us-ascii?Q?VL5xkvH9UTMU/S85A1lxLNXl3bnCdyrfRL+5lt/QYmgszV80KchQQf6zDE/a?=
 =?us-ascii?Q?h4QuhWgGz0GOqRls30lVKjn8Ao6/6F7bUGFugWHsqnAvLzwNIzW8AJdGp88j?=
 =?us-ascii?Q?FSN8CHPpR3iDQ62xhqwzgKxaVhtZzNdO7GdSsW9BvSJsnTygRnI37Emx/Jjh?=
 =?us-ascii?Q?F9vZONwk9hDzTOsG5HsVhUwrHde0REoY3T43HiwX87ktV8KIXANo5UhTk0vS?=
 =?us-ascii?Q?EChmAuo4Nt6IpGgio9taLyYABgT9TNMrKgtp7qW7FT6rMy5aTwC3jFUknH5T?=
 =?us-ascii?Q?qIk3yv67X2DHfBjAJoQo4nKThU+JI247IdMdh3xMxOyaPAXXS4yQUjxW1DTx?=
 =?us-ascii?Q?0KkhuKAfQm0ZKbalSBTteawuhPe/0BuOdRV6vAozBeR25O9sYBnamgXQGfoX?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b82e47-c1b4-4a5f-a8c6-08dd3186bc2f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 14:54:51.1113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2qte7AVypgDfPdBWCOvm83VhQV+C31Qlx35+1yncpKB5AJcHllB+23ezIgwBH96amSC77o6fTsJqjXYCgHT/sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6024
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

Hi Sima and Dave,

Here goes one extra drm-xe-next.
The reason for this last minute and extra one towards 6.14 is
because we have 2 patches that we would like to propagate
as soon as possible to avoid later conflicts:
1. A big patch fixing typos everywhere.
2. A patch killing xe_pciids.h and adding missing PCI IDs.

Please consider taking this extra one.

Thanks in advance,
Rodrigo.

drm-xe-next-2025-01-10:
Driver Changes:
- SRIOV VF: Avoid reading inaccessible registers (Jakub, Marcin)
 - Introduce RPa frequency information (Rodrigo)
 - Remove unnecessary force wakes on SLPC code (Vinay)
 - Fix all typos in xe (Nitin)
 - Adding steering info support for GuC register lists (Jesus)
 - Remove unused xe_pciids.h harder, add missing PCI ID (Jani)
The following changes since commit 6acea03f98f5d0028cae1d9d4c60914bfdfb6d27:

  drm/xe: Remove "graphics tile" from kernel doc (2025-01-03 12:43:02 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2025-01-10

for you to fetch changes up to 6a04bb5a2046067681257d5dd69a724856c8fbcb:

  drm/xe: remove unused xe_pciids.h harder, add missing PCI ID (2025-01-10 11:02:15 +0200)

----------------------------------------------------------------
Driver Changes:
- SRIOV VF: Avoid reading inaccessible registers (Jakub, Marcin)
 - Introduce RPa frequency information (Rodrigo)
 - Remove unnecessary force wakes on SLPC code (Vinay)
 - Fix all typos in xe (Nitin)
 - Adding steering info support for GuC register lists (Jesus)
 - Remove unused xe_pciids.h harder, add missing PCI ID (Jani)

----------------------------------------------------------------
Jakub Kolakowski (1):
      drm/xe/vf: Don't check has flat ccs in bios on VF

Jani Nikula (1):
      drm/xe: remove unused xe_pciids.h harder, add missing PCI ID

Jesus Narvaez (1):
      drm/xe/guc: Adding steering info support for GuC register lists

Marcin Bernatowicz (2):
      drm/xe/rtp: Add match helper to omit SR-IOV VF device
      drm/xe/vf: Don't apply Wa_22019338487 for VF

Nitin Gote (1):
      drm/xe: Fix all typos in xe

Rodrigo Vivi (1):
      drm/xe: Introduce the RPa information

Vinay Belgaumkar (1):
      drm/xe/slpc: Remove unnecessary force wakes

 drivers/gpu/drm/xe/Kconfig.debug           |   4 +-
 drivers/gpu/drm/xe/abi/guc_capture_abi.h   |   2 +-
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h      |   6 +-
 drivers/gpu/drm/xe/regs/xe_reg_defs.h      |   2 +-
 drivers/gpu/drm/xe/regs/xe_regs.h          |   4 +
 drivers/gpu/drm/xe/tests/xe_mocs.c         |   2 +-
 drivers/gpu/drm/xe/xe_bb.c                 |   2 +-
 drivers/gpu/drm/xe/xe_bo.c                 |   8 +-
 drivers/gpu/drm/xe/xe_bo_doc.h             |   2 +-
 drivers/gpu/drm/xe/xe_devcoredump.c        |   2 +-
 drivers/gpu/drm/xe/xe_device.c             |   4 +-
 drivers/gpu/drm/xe/xe_drm_client.c         |   2 +-
 drivers/gpu/drm/xe/xe_exec.c               |   2 +-
 drivers/gpu/drm/xe/xe_ggtt.c               |   2 +-
 drivers/gpu/drm/xe/xe_gt.h                 |   2 +-
 drivers/gpu/drm/xe/xe_gt_freq.c            |  15 ++
 drivers/gpu/drm/xe/xe_gt_mcr.c             |   8 +-
 drivers/gpu/drm/xe/xe_gt_mcr.h             |   4 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |   2 +-
 drivers/gpu/drm/xe/xe_guc_ads.c            |  15 ++
 drivers/gpu/drm/xe/xe_guc_capture.c        |   2 +-
 drivers/gpu/drm/xe/xe_guc_capture_types.h  |   4 +-
 drivers/gpu/drm/xe/xe_guc_ct.c             |   4 +-
 drivers/gpu/drm/xe/xe_guc_pc.c             |  79 +++++++---
 drivers/gpu/drm/xe/xe_guc_pc.h             |   1 +
 drivers/gpu/drm/xe/xe_guc_pc_types.h       |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c         |   2 +-
 drivers/gpu/drm/xe/xe_hmm.c                |   2 +-
 drivers/gpu/drm/xe/xe_migrate.c            |   2 +-
 drivers/gpu/drm/xe/xe_pci.c                |   4 +-
 drivers/gpu/drm/xe/xe_pcode.c              |   2 +-
 drivers/gpu/drm/xe/xe_pm.c                 |   2 +-
 drivers/gpu/drm/xe/xe_pt.c                 |   2 +-
 drivers/gpu/drm/xe/xe_rtp.c                |   5 +
 drivers/gpu/drm/xe/xe_rtp.h                |  15 +-
 drivers/gpu/drm/xe/xe_uc_fw_types.h        |   2 +-
 drivers/gpu/drm/xe/xe_vm.c                 |   4 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules         |   2 +-
 include/drm/intel/pciids.h                 |   3 +-
 include/drm/intel/xe_pciids.h              | 235 -----------------------------
 40 files changed, 162 insertions(+), 302 deletions(-)
 delete mode 100644 include/drm/intel/xe_pciids.h
