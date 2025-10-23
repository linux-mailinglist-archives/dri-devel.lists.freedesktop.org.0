Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0E9C01334
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 14:46:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF8EA10E403;
	Thu, 23 Oct 2025 12:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tn+JOJhJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E557110E401;
 Thu, 23 Oct 2025 12:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761223565; x=1792759565;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=wCe4CWWBF6j2mKOG/KNowUXOKEnYO6Glk78qfD4LH/U=;
 b=Tn+JOJhJ7byohTuhfUHani1+wvMet4x9EkV9v8ozN/7K0H5zV4UqQMT/
 qMMlYywS9ueae+hxsxaavCHXEwjyA+Vj7uA8+9z5apMlKeqmZlt0wyB5e
 fJIUNB/yheQPNuiCVfRXgeh5OC9P22HuubPztwIgJsxFY44PbnLeTaMQ7
 CcdrTXg0t7j5RB/O24VEBXR+M5pPtJ5Z3XBEUaIkhw0J0PQq4m7or1e5w
 WKqvws30YMB6kTM28MRWl56POy66hMoennWXzHgaF+WMeeryLLspWd6w+
 mrJQfrjudP+rhB6eq3+bweheesCIdAX7xU21SdDU6OYJOj4XTc00RwZzI Q==;
X-CSE-ConnectionGUID: +Dj7SSqnThquwCmHfRJW4A==
X-CSE-MsgGUID: oBNqytKVREqXHqtKETUAFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63283950"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="63283950"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 05:46:05 -0700
X-CSE-ConnectionGUID: yVQKjmL8QzS/5TPD5B7mrQ==
X-CSE-MsgGUID: hGcRbJnjTia0EB4C6+kcig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="183370223"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 05:46:04 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 05:46:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 05:46:03 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 05:46:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sfvlsWq+aSybk2iOKd9UBjZw6s+Yw6pLZNjGrOvjI6ZxmmrTUYHVQht/l2P/LpvkNLvFAeMuzsTvN1igCWcfOGhll6f+uwC/USbVfpkBl+wc6C5gPUCB8sNSqcZIoOoOZrNyRXA01kep/6/wxxy1ZW/KmBXsGEvcGXTuHfy4Y6HxCxrc6QjbhRdrrK0tU/6ZvqvCIOnH2S3PIZiKP5e9CunSbkuCIS0ghpw8akIsIsVrroB+8O6xL759ZQT5Fq87BwMnQ6Ft7S9QaBvNJKuGXNOYMJeA8pE9OrI/Va1ikWIYpToSFBFer2YRVExJn2RshFddpD7nRPx7pZVVqLcEcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c5bVV7XO5kJnd/OjOtpn/5d2y1i4IVoZkFnKK/64AmE=;
 b=EegEdjDr89PWFk+v5dficUlW9oMpqEBGfLi7n0GZ8HCLvJwY2WIs6b25SqqcVt+QCZtDtx26DTrZRu0DaxQWg739SgEj5MHRk3kZ7cnBUQX4zv4VP+eWzZ2cbCdPWyEMFbOw03pTveWpDmRFWd2lCuAXz1M/+4rXSkaRdfXB6wYYXEncMplnJ9XOuyunAZacbDZ5nENjpxHY56siulQ7YCBGdMYiIVjbgOykEz8l2VKIaAdR/B3GdJaKlILc05Hib4Qz6fnsTZGB4/ye64ZmnNLWOF2jjzyrxTysTWRnOoJVRPpXo7c5TTkHKsdTyoM0QHK1o6wmpnhHFRuYQjrLMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MN6PR11MB8241.namprd11.prod.outlook.com (2603:10b6:208:473::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 12:46:00 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 12:46:00 +0000
Date: Thu, 23 Oct 2025 08:45:54 -0400
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
Subject: [PULL] drm-intel-fixes
Message-ID: <aPojgsvNYOU0tN4U@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::29) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MN6PR11MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aa48666-4dfc-4659-b414-08de12321e56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o10ph95zH1CVw2UR+nfF7ij4aDS7Jv/gmJqEJLtJS0hhq5I2Wgh/o0zWkW8t?=
 =?us-ascii?Q?QL83Rj7sn2BYTjl3sDrwzU64FCrXhT9MY0u363R5uwiiP1T2jKfClVMYzJny?=
 =?us-ascii?Q?shRuzLA4T/9N93K35TLtQ9w8japF6+frIvF+R1ogyaWR90yCTUfO2YVt9LhQ?=
 =?us-ascii?Q?FKIGVWmoT8zIu32koFnO001ezzgkESjh3D+FXkI6+wONrtcs5bAG5MoMeUiT?=
 =?us-ascii?Q?dmyrEAgobYTZPCjaDy05YhFrccv73f0FdpNoXzU/ajZPIm+FdQ4Cu/uU+w+w?=
 =?us-ascii?Q?vJdQtNNqMXNksusDJsu4z/p6DUTNNGoIhN9Vz/xfTBGI0h/jPk5sjYirT6uZ?=
 =?us-ascii?Q?hyD6HuUGl9hpAJr1jFfEYvKysFcP7dQmLLUKzcKV2gAjUOvt4yK7eRekRSMd?=
 =?us-ascii?Q?yk5x4k95ss8XgUJZsMEFrul9k/owy7J/8QnsnW5yy+7yoE54e9EOc2NS93y5?=
 =?us-ascii?Q?eVoHDORMYjPGv9hVx1iGkWARX1O+BzOEjvYG7jpzrguTUn2xaNezF+xwyCHp?=
 =?us-ascii?Q?+2C2N2EctqqjEt6W44g301z6vzif2ucuXocDiHgce/c8STckHPhNg/z2pT+/?=
 =?us-ascii?Q?f27d1ETUV30wzeGc0wwaK0aVYNEwEFC2EmgQXusdHnF21x+mLigBC3wiWS1P?=
 =?us-ascii?Q?zv4tkSsbvR73LouHCs8gfWgNoJltA53o883I6EdImWnMOzV5t2Tc13CwiiFb?=
 =?us-ascii?Q?9ouqj+hwW7sawHlxGY89wFQbnmk/8SVnQAAI6sx015MudegtaCuWRMMNXyMO?=
 =?us-ascii?Q?rcxlnWsZUnbgb43i9dh2PpSHlz5wQVHVD1+PXCnD2WY3nNcsBKvj/od2ENr2?=
 =?us-ascii?Q?2ESn8iGIbBWMR4DJDCmrFNQwPwyTWOVaqlYVw37QOvdHm/VhameFul7gxEWx?=
 =?us-ascii?Q?AfNbdC1U+eB252ahZahyi/RThkuK29p2v2+xuad1ofKejFSrY5IXMaQkyi+t?=
 =?us-ascii?Q?58kfW/iycPmgsFu+ju5UwxrAFUSGwVGso8hPMlzONyrKlRvAB4yE65I8ktDk?=
 =?us-ascii?Q?yggu23LpfuPVfGkVwQ0z2FS798N9jPpmP+ogzVerNsV02O+ApJyWWxJVVeP9?=
 =?us-ascii?Q?JveFKftyJZXSdNcIcB9Vsx5QqzgP9nmN6If/6OL5FLOHbtZdCdtnN43f0zDU?=
 =?us-ascii?Q?WkYSidLI4RvNQwsgKUkyMQfSAIIXOPS6SsVklNUijOnDJpUYd8u4NJeWrQxV?=
 =?us-ascii?Q?iKmJVwpCUF/8RgDSC5DKcqE5ILghB8RdjFd8KfGqD9Mk1JAdCGL+/d+ERCs4?=
 =?us-ascii?Q?HEICNvPqz3x0OJ5UIJS3E5O4mbbQOLR1DDZnI4zbkqW94S/FLyDRStrf4V91?=
 =?us-ascii?Q?c00CErhq6kJU7NdZCdkTNyl1p5lJ0xtoFTL/nQtEvfq4LBcILL8GIqP5UFXa?=
 =?us-ascii?Q?Nn2dFs/8dq4eyHZJiTPCtAm3GFS8LfWD1m2okvkBGexw3dv7zA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0OO1TCw3CahiHgGVW+s5Y022Bzz997Zg0wk/kGB/vgo7UPLe0rgJZLmDIW85?=
 =?us-ascii?Q?T61rMC33f0y+8o/ktpzNf5i2uqZqV4gVUHBGTLuVa9q9B80eAWCGwEK437xh?=
 =?us-ascii?Q?7UGnXFz8NNzMysw6X799Dkny6o5XFlgV/DAr+bCFU3R5QoMEaEhCGUZ64Dl7?=
 =?us-ascii?Q?DVoGLVV6XGQ4NuRxlbe9Auu0262aSnbURQhWVpGCDEQkDiJ6q7qLrGFaxdjE?=
 =?us-ascii?Q?nl1rgeNXFCaiU/l8GOEb1JUXKftJgfkEV/SJKNDds9fHlW80vFyu4Gg6xR7M?=
 =?us-ascii?Q?fbuHXInqecq3+nC/OPlpIrX7wzMjarQOBp+6+Vt/LMrQ/E09sfpub94aEPI6?=
 =?us-ascii?Q?hZsXREwPz5d6J5CPHdJ9n17UHrhpdBVv0JLxgZ24pcWDZCGCkOrQfCa7wnG0?=
 =?us-ascii?Q?yy14tg+r6TKQjlA/DwgX7+XtNDGIPlx18o+uN4c2ocQQ9RLvTV8jDvdgqdvw?=
 =?us-ascii?Q?SRy+UlsL6Hk0//+d4GDZo9vTQoshtZbt2cdpIAFi94TOFKIICLo4AJZJPgF5?=
 =?us-ascii?Q?4A7rp9HwkiLk4U8mcMyMV46PiTJZSlbFXBkcUuc4sNhXeZt6zpOU9SjX/+F4?=
 =?us-ascii?Q?bRcIfOLP5JvJTerR4MQjjeBJSJvUMFGEgmXcWj7MQm5PqJVVWFS0OdZWNhpN?=
 =?us-ascii?Q?TRAlbq6NnPjMpO5sdUkYDeDmimWeBOmEuW53FjfdIaZ6DxVt91HQyZab2FLV?=
 =?us-ascii?Q?BFnd9zzG83CpYeudUKfP3D86E74Wzdtn4TTNElPGHWWyKwllmEZIT/GitmBU?=
 =?us-ascii?Q?UEZTfsMq5IlUA+7M49xYrdi8/WwFHAZ3BJc+NMhl5e3llDM+gu2UyIkKR3Tc?=
 =?us-ascii?Q?glYnUgvkV7FcG/LQIfezA1yJdExFSy2L96Llwn1Z5sP5im7r+DgfMgCWVGif?=
 =?us-ascii?Q?1wpWmv3i3sJqt3EQY6rFQpAyhr2D2q/BFBC24up28CGrN9tz2gGftwzDVwr3?=
 =?us-ascii?Q?9GEqUuDayHW3rZ1tfGto9SfB04/P9E+5jVJHnbaGHuI3P1mNBPcHAAKzAIcX?=
 =?us-ascii?Q?YMHqBuFghq2LwyFuNrjGv0H/uqbLzxhY9auXUo22pTAUgukkGp5/I7OejYbP?=
 =?us-ascii?Q?11WafRj/Qa4fD0q/e474gNhaUO5oLsdYXUny6+AGvZY9RBB8xRj/ZOXg1K1H?=
 =?us-ascii?Q?39IM4hX+1XBqZTbX8W+QUzlNybJbZ7TGnVfOEniGISwwdSk9TKaxMv7/Tmu1?=
 =?us-ascii?Q?fUkK4F83l4kIIoHoi7Bte3Aw+qubaPc74TmxDHYtPHlb55cskulEZIevaWIA?=
 =?us-ascii?Q?UyLa9DzCS097VnbMj/YYPv+Og/9e50NXKHqmUGH04ukdt9Z32AaceL1uun5P?=
 =?us-ascii?Q?0xi17ufg/qQYgT7eHF1GZRB++7GCZek6awx72OLLTXZS0WqUhNn37BGnbmoQ?=
 =?us-ascii?Q?g4gnLkaCi2TWL/vZozAJZGgm1JkwLnj3M4ZTLNDHbjRmWutGVzuNIp1o7v1H?=
 =?us-ascii?Q?rTX9M23viGTr7avc81+HAQ5oALS2ymJpg42nl4SVJrt5EFf8Bf6QoU5o9o+S?=
 =?us-ascii?Q?rns4VyaVlGgsIxwPNxrOMc/hsCNGWJVhl5sI48aJMe12VBHoIjlZ7vzUsJxW?=
 =?us-ascii?Q?HKvl1QIykYSpALSOi077KL8Dc5r7u043jAq9Vlfb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa48666-4dfc-4659-b414-08de12321e56
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 12:46:00.1810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N6KAU/J6l+D9Vc5XDSPizHrwsXI4bn4Z99EjVev0Hr9J2puw640+lQE8rQfbOh32nBthLvVtYmiTgkuZkW6GZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8241
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

Here goes our drm-intel-fixes PR with a single fix this round.

Thanks,
Rodrigo.

drm-intel-fixes-2025-10-23:
- Fix panic structure allocation memory leak (Jani)
The following changes since commit 211ddde0823f1442e4ad052a2f30f050145ccada:

  Linux 6.18-rc2 (2025-10-19 15:19:16 -1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-10-23

for you to fetch changes up to 789e46fbfca1875671717a20a916ca1a920268e4:

  drm/i915/panic: fix panic structure allocation memory leak (2025-10-20 12:53:57 -0400)

----------------------------------------------------------------
- Fix panic structure allocation memory leak (Jani)

----------------------------------------------------------------
Jani Nikula (1):
      drm/i915/panic: fix panic structure allocation memory leak

 drivers/gpu/drm/i915/display/intel_fb.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)
