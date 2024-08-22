Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 723E995B994
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 17:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90CA10EB2E;
	Thu, 22 Aug 2024 15:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BktS2b7h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2826310EB2F;
 Thu, 22 Aug 2024 15:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724339589; x=1755875589;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=ChdyoKyTwoqbwsfnBXRlP/J0ZgTA1kPrw2HULNJfj64=;
 b=BktS2b7hv9ufJxbCDgKcEBloSNHiGR4N2JW7RbsIluy6uad4965bdie9
 SNZ3/c+16ASijwlebZCwlDzXmKE1n0edVf9GwkzTxmE3CeBZtRPyhIP/s
 VRahMHJjkpudw4Jjp+cauxtjO4osQqzmswZDD/DApUCLDGhl3wT9XjZ9p
 Ot/u9OiOyI/g6ktpIFyXUn9AZ1uyXDYb77nv3udA5uOKJI7phUhcZcP0Z
 vw9Dwoper6RLbOcgpsUfql8MAk14rgsqVKQD0fr16GgrBrdN14oagk3e1
 igySgSAumguOxIGf7t4R9fbTK25RvZfVOW/tmYCN1LBQzajR1YfwQi6Ne A==;
X-CSE-ConnectionGUID: T4/Du/S8QU+AR921jVlFGQ==
X-CSE-MsgGUID: SJtVlObvRieTlQiozFKriA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22890574"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="22890574"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 08:13:08 -0700
X-CSE-ConnectionGUID: nKpdii5ATTC8zf4JzDIvig==
X-CSE-MsgGUID: 55QBnilMRj+hjUTPM+dl3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="92276117"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Aug 2024 08:13:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 08:13:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 22 Aug 2024 08:13:07 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 08:13:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XAh1WlPejTFUqEcV7ADL6hIqiD0sfHc6C/SeH6ujC/sXn/1vNrlUvz7mTcX5VflWZlj5MIAO1xXWe9hGe3brDSBUyhnwhHfUllpAVF298iRqCZO1WfWoJk7hGe1WiwfV/psH24Q/mEbwzFdKBR1joecgjbVhVJxEI9gh8b90xqg3mySWGPbtZLsmjVxRbEa30/7U8RkTyR5a5ZFjYqaU8bcLoi7grMPOU0lzR0yLq+vH8EqoV5vyVOe55uaGhl7Cwqb9vsZsmamXRPuaIu2bAiHtfjroVlhFMiVYob+p+Uxv1QeJNBwVZYwR6c6j3RzKnHXj+px3RpXJFaGJGIdelA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJ8LplakcEhxl5nOrKG4MwjitPod/k7SD2ZeiSrakdk=;
 b=qrJbi77qnyPI0/hBrPnVaqbyjMvP867QySQHuk4Vaz9ewC0Omk2Z5KH0fp65cxcKJXf4o3wMFD2N5GUl9wqPfM/0D/Tct9ECUeghievB5lo7nAA0UEFNUtOqrpjCSDdtD8GXlihE9tE4E19Xje59OZALrRUQghnmCWM4zM3oqqDilUPwQdcSn+RUXlKg9ua+GVwOteRUXE9UzEFNiF5Gu0DysfPpzXaBGYsp/1La8SU1Gw1L/P3Yp6bQl+Z2lx5iANZ7q5To3ATi1t939jHcHDc6njbVGkSM+TBVOEUlx9xcvglnKkNxWG6qboRhkjfDM1uCs4/5sf9RS//txdeUUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by BL1PR11MB5270.namprd11.prod.outlook.com (2603:10b6:208:313::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Thu, 22 Aug
 2024 15:13:04 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Thu, 22 Aug 2024
 15:13:04 +0000
Date: Thu, 22 Aug 2024 11:12:59 -0400
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
Subject: [PULL] drm-xe-fixes
Message-ID: <ZsdVe0XI2Pq8C-ON@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR03CA0122.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::7) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|BL1PR11MB5270:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f9128a3-75ad-444f-a1e4-08dcc2bceb44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2eek2wpqN1FSxY9eXkFRleQFTeW/VpzatE/I3ouQB2LbI1mfK5665CyszPok?=
 =?us-ascii?Q?euLWpq4Rpagwo3eJJXBMOiX6J7OBfgHo2Idk9eKQPWydB0iSIxXToLXQV7Pe?=
 =?us-ascii?Q?RvYEjE3OO0dCOEh6bAB0M4Jy+oHu0KaA8Zr2kNtQe8QUnKq10cCqR9MScy7m?=
 =?us-ascii?Q?h6R8sh/tkg0j/2tCFYzQyJbzvglQbXEa8jxi3v8oydiTHh4eDwrZQM7ly+mA?=
 =?us-ascii?Q?/UMl3D9t7rpQzWmyxnjEJLYtCknzgaJOnj9I0Vvkf9us4yE+Dv6lJN47w6jo?=
 =?us-ascii?Q?GwH/u0G8ppO4j9j3B+KuoXCH4nJdZogWJSa1Jerw49Eb6qXEGioC9ObPTdlV?=
 =?us-ascii?Q?/KZjNgwYeNpvWTBVJwz7cDnh03ysRXfhc1J/Sf40fmtml2LLTVtk13mRe/cB?=
 =?us-ascii?Q?IobwAFDpcIfIitEG/wKLRv1axzSkaf2WwAFzxSWxhj4n22/7UC9WBVAOe671?=
 =?us-ascii?Q?mdQImDQLy6VJnM57lklUowjWBKzBi2G35/7SFjyScqGfnkeCByrXKC08bSQO?=
 =?us-ascii?Q?W6rr1PzYP+Awacg+FYD0hPkldJ1E9ltw5ZV6dUt5s+pBbJOok0Lm1CDUWlZS?=
 =?us-ascii?Q?UihfbxTNIbp/2aKqUkLAd0x+Z/omOg/d6RCiSUHvJ6Qn77Ezjkw2a1kXsQP3?=
 =?us-ascii?Q?S+AUjJXpMgdHoEkaswD5SBfcsyK0JYnPpblEzyWsQyMAK3yJMu3iHoCXhQbm?=
 =?us-ascii?Q?k8TE8muzYdCBIPs5JmnK6mWEiF4BoORdpLgBC4YGntjzoseho8dh3Pqq6NTz?=
 =?us-ascii?Q?80uZgrTjVNLv0k9Ciqq5GXZt9STQdY9+k93oKxdJLjV7J5D0/t5o8tqk8PgI?=
 =?us-ascii?Q?z9XymNeTOHXutp8KbjAw4GXlx1+VAw07KWogLPrUK8FYjZDqjKw4H73sC7cn?=
 =?us-ascii?Q?Rb4sG/R8lK9gbrYsW3ZtzeF+Ckn54WLfwmWOGb4iGKjNFw82TkzILejFShtO?=
 =?us-ascii?Q?Js1GAtK7Z+PfWTYnNjMsLMY8Xs3RyoI7qkpKZCTZa852ly/e1BquCEsw7L/U?=
 =?us-ascii?Q?n7c9HGoLRI62j1ex3eSWLR/kIEx4oI/LUk6DmiRHYqkDBS5QjdOLZhARBNVh?=
 =?us-ascii?Q?Q+SWCpmai2YWbmtZ8oimUlTkUoJME6s8qPqg4dxXvx9qlp2Rc6hDqeZZxGvZ?=
 =?us-ascii?Q?15JGPgjdQr/n6JYbRI0K4WRowr5lw8gtniiRcll+QhAVIvnSdppn9uyiObSA?=
 =?us-ascii?Q?836p1xDeCk3kyAkfgAQKb4WNCFNhRd5Z2ytNe2lAB9fMA/0/CAgDLDMoUA2t?=
 =?us-ascii?Q?GapKo3G8KwWz2/6NgbZZzmOggC5ns7kWi01G34BxH8ArdoLXeaRmslR419QT?=
 =?us-ascii?Q?uT8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nGTvqyduYWDGNfPxz4tfAYoy17mg+CkUaZye286ADULubtTdEwDZtJz6fmNP?=
 =?us-ascii?Q?VQyKGZCQKlmskQn8BOXOP3mBppyWN3qBFXhgwelApxaJJgZmxiKjjOvUe6ql?=
 =?us-ascii?Q?npq+yL6NMwhl8K48F8LRLGVp+b3JG0i6Jealova66braEAN8SmBTMfEQUl+3?=
 =?us-ascii?Q?xeC11y/4dk3DIk22UB1IuABwz5DfwdB0A4MtJZCfZF1phG30aBMQBiBDIkRC?=
 =?us-ascii?Q?LgYXDuJ48Fp7LkdjOYDv4fC0Xy8NKqB3gcsDFzp7pxzazAKE9BtDPlEwbbs+?=
 =?us-ascii?Q?3YMGO88/HE55dQyTRdrNhxrV+IR3WpG0Pv5QKg6TgCpitXRcRDVCaD1GpUWo?=
 =?us-ascii?Q?5ADCI38wDQAzIXVbvWoz+gJLB8zAJc5egS9YWHHk0sue7ci+q5Q9IvY4O6yb?=
 =?us-ascii?Q?DjZCR4sPWzZqWmbRzeaFs9/0kmQ4m8uN/35s/Vr5Km/hVK0bLNfsZo3SUdHZ?=
 =?us-ascii?Q?Q8PnpMuEhKZ4z67RL8x8dPuWsQcrfvibBSCkrxM9ZnJl3ThXrlE0JcxhClDY?=
 =?us-ascii?Q?Q7vNz/IBwEmO9DJKVgP/K9nWkdKMnVN7LeEJr2aGuOxhhwrT4w4d5aA8xJyo?=
 =?us-ascii?Q?RYZpwsQcLj3VpGcJ7JV7ZaYCFb0fOiaAY+FenM/0j1vBLUsKd4zJOkQRJz0z?=
 =?us-ascii?Q?tjRk+C3XAUmWHS4IeEgz0GaRMf44+/6Rv6N192kmQLtuLu9m7iP90KsrRn/1?=
 =?us-ascii?Q?2vBKuEWGzwrjUgUwRjtxhokoRDjo+dt0crxcfwmr+IWWof9DGoKOgld6BPhS?=
 =?us-ascii?Q?CPftDXyo8EuKt064BfFDMuQxXiQu0mEimu4a63hYgNqyMGNi+GbnZZbKbpBs?=
 =?us-ascii?Q?KRz5oqJEXrt/XDxdX6TnWj2TfDIdAWyTbXfi0kJL6CM4HytKKNvm8wXiPifh?=
 =?us-ascii?Q?SCXYs2aBSaHmpU8yn6HQhx1CPwIzE0yHxiSPqnFojXgObUocPD5ge9NH2ski?=
 =?us-ascii?Q?1yPH09wlV1duMA46ss5PTQy2FXtc8EZABnPJ6ge1Gx7HAZzRmyWDQpQkHxpf?=
 =?us-ascii?Q?zNs4Vfmz4fxvtCG5MXFh1DA70YT5QupyU2+X+0cdHWKrvMxvJPMrT1mr/xrP?=
 =?us-ascii?Q?tXdoTj/TeFuRZX0zgnd9zf/d2QEcsJ5TURsat6vEXF8yotsIi0uPWXyBij5n?=
 =?us-ascii?Q?BygOHWbNbVTMcOPx7n04LQts43AZtaV9+d+9MgaTxOkGaYSk+I/Rpe69Tgap?=
 =?us-ascii?Q?0Kd1DUuawbXQHWomqbLFzKPpV2HP2R7q8s0znb6aqiA8YqbJiMf/YeWOYctC?=
 =?us-ascii?Q?067H9ir87j5CRDYJeXNgno43VYod3/dVtvejmEcV7NHzSnRJXhqedOjdd03Z?=
 =?us-ascii?Q?1prjzfEnc0mY7GwfUw8Y7ilV9roHrMyrdY8Aptt8HZAI6tDXN2uJISZ1Qhrz?=
 =?us-ascii?Q?cHhyB4hoXQvWU4CIL6do0Lw74dTW3iXa4GAJ8kYgH+9zYfvZGJjwnovDH0g5?=
 =?us-ascii?Q?FycJR6pCk61G3obtJEMOpi8v3lKMsSGahhWhToRVZWXmZgaRYn91yE/kjrCY?=
 =?us-ascii?Q?w6PnZ7xdUaPHXFfNUR/b45tjVY3B3K19n+G4jUy7GZcI7MIEoCNFDaMq8C2a?=
 =?us-ascii?Q?+oU0Aya47yBDAyd/vRfO8eG5QE5nntwz7ilco0iMx6UqNHzujdKtIXyMJELG?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f9128a3-75ad-444f-a1e4-08dcc2bceb44
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 15:13:03.9519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DwrM8bHOdrIZriLqSi2pzZ/H7BB5GFeHBcTaeHotXkCR22seZVskT6FeB3qC9W8tgebjOmjpRirxAaGNAfAVFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5270
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

This is indeed a hectic week on our drm-xe-fixes.

- 10 of the patches here are patches that got recent merged.
- 9 are extra patches, mostly workarounds, which were already
in drm-xe-next, but not picked up for fixes due the lack of
Fixes tag. Lucas had identified them on a backport effort and
they look important for the overall stability, hence we are
adding this for this round on top of the 10 regular fixes.

The conflicts on taking them now were only trivial and solved
getting the -next tree versions on a drm-tip rebuild.
Everything recorded directly in drm-rerere, with no extra
manual conflict handling needed.

Thanks,
Rodrigo.

drm-xe-fixes-2024-08-22:
UAPI Changes:
- Fix OA format masks which were breaking build with gcc-5 (Geert)

Driver Changes:
- Fix opregion leak (Lucas)
- Fix OA sysfs entry (Ashutosh)
- Fix VM dma-resv lock (Brost)
- Fix tile fini sequence (Brost)
- Prevent UAF around preempt fence (Auld)
- Fix DGFX display suspend/resume (Maarten)
- Many Xe/Xe2 critical workarounds (Auld, Ngai-Mint, Bommu, Tejas, Daniele)
- Fix devm/drmm issues (Daniele)
- Fix missing workqueue destroy in xe_gt_pagefault (Stuart)
- Drop HW fence pointer to HW fence ctx (Brost)
- Free job before xe_exec_queue_put (Brost)
The following changes since commit 47ac09b91befbb6a235ab620c32af719f8208399:

  Linux 6.11-rc4 (2024-08-18 13:17:27 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-08-22

for you to fetch changes up to 9e7f30563677fbeff62d368d5d2a5ac7aaa9746a:

  drm/xe: Free job before xe_exec_queue_put (2024-08-21 11:53:15 -0400)

----------------------------------------------------------------
UAPI Changes:
- Fix OA format masks which were breaking build with gcc-5 (Geert)

Driver Changes:
- Fix opregion leak (Lucas)
- Fix OA sysfs entry (Ashutosh)
- Fix VM dma-resv lock (Brost)
- Fix tile fini sequence (Brost)
- Prevent UAF around preempt fence (Auld)
- Fix DGFX display suspend/resume (Maarten)
- Many Xe/Xe2 critical workarounds (Auld, Ngai-Mint, Bommu, Tejas, Daniele)
- Fix devm/drmm issues (Daniele)
- Fix missing workqueue destroy in xe_gt_pagefault (Stuart)
- Drop HW fence pointer to HW fence ctx (Brost)
- Free job before xe_exec_queue_put (Brost)

----------------------------------------------------------------
Ashutosh Dixit (1):
      drm/xe/observation: Drop empty sysctl table entry

Bommu Krishnaiah (1):
      drm/xe/xe2lpg: Extend workaround 14021402888

Daniele Ceraolo Spurio (3):
      drm/xe: fix WA 14018094691
      drm/xe: use devm instead of drmm for managed bo
      drm/xe/uc: Use devm to register cleanup that includes exec_queues

Geert Uytterhoeven (1):
      drm/xe/oa/uapi: Make bit masks unsigned

Lucas De Marchi (1):
      drm/xe: Fix opregion leak

Maarten Lankhorst (1):
      drm/xe/display: Make display suspend/resume work on discrete

Matthew Auld (2):
      drm/xe: prevent UAF around preempt fence
      drm/xe/bmg: implement Wa_16023588340

Matthew Brost (4):
      drm/xe: Move VM dma-resv lock from xe_exec_queue_create to __xe_exec_queue_init
      drm/xe: Fix tile fini sequence
      drm/xe: Drop HW fence pointer to HW fence ctx
      drm/xe: Free job before xe_exec_queue_put

Ngai-Mint Kwan (1):
      drm/xe/xe2lpm: Extend Wa_16021639441

Stuart Summers (1):
      drm/xe: Fix missing workqueue destroy in xe_gt_pagefault

Tejas Upadhyay (3):
      drm/xe/xe2: Make subsequent L2 flush sequential
      drm/xe/xe2: Add Wa_15015404425
      drm/xe/xe2hpg: Add Wa_14021821874

 drivers/gpu/drm/xe/Makefile                 |  2 ++
 drivers/gpu/drm/xe/display/xe_display.c     | 28 ++++++++++++++-
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c  |  8 +++++
 drivers/gpu/drm/xe/display/xe_fb_pin.c      |  3 ++
 drivers/gpu/drm/xe/regs/xe_gt_regs.h        |  9 +++++
 drivers/gpu/drm/xe/xe_bo.c                  |  6 ++--
 drivers/gpu/drm/xe/xe_device.c              | 32 +++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h              |  1 +
 drivers/gpu/drm/xe/xe_exec_queue.c          | 24 +++++++------
 drivers/gpu/drm/xe/xe_exec_queue_types.h    |  2 --
 drivers/gpu/drm/xe/xe_gsc.c                 |  8 ++---
 drivers/gpu/drm/xe/xe_gt.c                  | 55 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_pagefault.c        | 18 ++++++++--
 drivers/gpu/drm/xe/xe_gt_types.h            |  6 ++++
 drivers/gpu/drm/xe/xe_guc_submit.c          |  4 +--
 drivers/gpu/drm/xe/xe_hw_fence.c            |  9 ++---
 drivers/gpu/drm/xe/xe_hw_fence_types.h      |  7 ++--
 drivers/gpu/drm/xe/xe_mmio.c                | 28 ++++++++++++++-
 drivers/gpu/drm/xe/xe_observation.c         |  1 -
 drivers/gpu/drm/xe/xe_pat.c                 | 11 +++++-
 drivers/gpu/drm/xe/xe_pm.c                  | 11 +++---
 drivers/gpu/drm/xe/xe_preempt_fence.c       |  3 +-
 drivers/gpu/drm/xe/xe_preempt_fence_types.h |  2 ++
 drivers/gpu/drm/xe/xe_sched_job.c           |  3 +-
 drivers/gpu/drm/xe/xe_trace.h               |  2 +-
 drivers/gpu/drm/xe/xe_wa.c                  | 18 ++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules          |  1 +
 include/uapi/drm/xe_drm.h                   |  8 ++---
 28 files changed, 265 insertions(+), 45 deletions(-)
