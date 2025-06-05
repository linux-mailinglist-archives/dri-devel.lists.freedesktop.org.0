Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D05ACEBD4
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 10:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0356010E7E1;
	Thu,  5 Jun 2025 08:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C5RhRI3F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BE610E7E1;
 Thu,  5 Jun 2025 08:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749112148; x=1780648148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=msdj1AYmalQuuPBSP9WfLNtk4xirKIfVLhXYVixZSZs=;
 b=C5RhRI3FUoQsBTNZz95pJTEa/iNO0uq0H2etQvgxkK59BDd5vEtAZ408
 X+W9dzdCjp1tCwu1gn4KRvk50VWR1YhLlnNPxFVzpbL8dmKvbN7H1NfUy
 VuXndsi1d2rPMqlUlMTPziSiffDuFCsM8jIa0OHCmY6sSoKIGzTaxrCb/
 XIf3IhrU0mK3CKg6eC5Uczjro5zAjCpWEvrwMM5IXCGkHDzMWAeHKmB9J
 3zVedAHJu6uxmU+zULMwlQu/RKjztULt4vau14nzKZEM9pqpV+KtAyoNQ
 nnWzCCGb1YKCDQn+zlr7VAnwl56jn76D/zfpVxCnnh6GHSKwd2pGpcPDO Q==;
X-CSE-ConnectionGUID: fSkGDgYZQL2N3S0bKMTfOw==
X-CSE-MsgGUID: cE0EfPUcRc2I0VzgjQJimQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="50456224"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="50456224"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 01:29:07 -0700
X-CSE-ConnectionGUID: kDJwkvtoQMySDyP3q2LfhQ==
X-CSE-MsgGUID: /XwMztosR+qQL3fXANruNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="150454093"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 01:29:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 01:29:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 01:29:04 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 01:29:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V7+RFNANCk7m/Xp3acLXzVYoevaNmmeFtZb8vurqWYuvpAnXxm34ah3i56rdNJhBHSKoIewL02emV1fhhPc8ErIdInSxPnvFhdBqS2YGPxMHjlihtI4D5kC+8SPRUubv7kOVK4xhCslSKokro6yS+mOwBrAzBFHjmE3azpMvPq5PjQPno34fgPOZoPzo35/83lBE3525g/elQeQEQeN5uzH0VlukciQDNrsA3B6umTOeix1u8VItnvmxX7gEehO9rpXfd6zle7cwKPE/gbAJM8TMkVx5ZQxh4qjXifhFlpLHxWi7nTaIYtD26uIEXHcwyZ9fyhJS7mK0Zdh0w1+jCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Py4St3eYU6tXRK12AhzJcCBObdzG15huHIV67vfdxo=;
 b=ICe6f3GE/1ac2cubFvi4QyySN8IjoamBeogiw6N6fQpQQtIYm5qDJMaZU1ZEpQpj85waqX8Iofpz0555VkcryGIURGQGjLHM2ZZYnosSF7qSj0LudOfQGM1mT6zbjegrXldzmuICQ74V72AMiKlCif36wuLAfhIqS7f2nbjg1S/1QTreZAgamp6TkoPWaq/xDmP43EsJJQPdxkdy6Tl+RWxeaQxqz772y4belvBPyA0hYgGivYVw/KypQtFjuVpInYNn61CLOJ/aZBdeIDGlIGlyg+m6wVAqzYx6j6DkK0jsinh9o0VIEXKTyJWETzvRxNH+xCLKDNCatgJyGUcFIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CY5PR11MB6439.namprd11.prod.outlook.com (2603:10b6:930:34::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 08:29:02 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%2]) with mapi id 15.20.8769.037; Thu, 5 Jun 2025
 08:29:02 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v3 2/5] drm/edid: Define the quirks in an enum list
Date: Thu, 5 Jun 2025 11:28:47 +0300
Message-ID: <20250605082850.65136-3-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20250605082850.65136-1-imre.deak@intel.com>
References: <20250605082850.65136-1-imre.deak@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::23) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CY5PR11MB6439:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e505c69-d669-44d8-c5ad-08dda40b06e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OUkoeQjnTDZwbKswHG8oDdahiMTEO99z5wgdq7Afo7hZh2bjd/KZv8UyaLNf?=
 =?us-ascii?Q?45k0KWN7e+R0drY1mgo1uwIzwTEpsquFEqLMS8uAvqLiWChwPhyXogyhOxty?=
 =?us-ascii?Q?j2nGl9iFzg21+zPM7c245h9ZbQyEWcMj8lLccTjlMk5tWoJOsPiO1DXkbUED?=
 =?us-ascii?Q?MlDIO8cucU/NXE+3Fk5XcVBvs6CpJwSVYIQYlJspbjKsDJsMZmrlBwI/9vmb?=
 =?us-ascii?Q?ZlWKjWKAROzqjZZJFJ3R7Of9xzaPfuJ2PZAnnUuTuaNEmnEMP1AiGZA8PYKg?=
 =?us-ascii?Q?CRnnsYaUMqpbiLXa/JeH6QyFNIr/K+4W91rsos7CBsMaoPcJ0yWBm2Sv/bOB?=
 =?us-ascii?Q?QXQ0ZCsACOundgJe501RviRUQf3WB5XTl9DAIMHEYD3mB5kpADkFOxQvwfNJ?=
 =?us-ascii?Q?mBOb/L90ihpWH7tH4FoMISenmCXso9wtveaWlFYI73tzyjNddbNMe6ZKbBOS?=
 =?us-ascii?Q?gF4niFlhm3J1KfjnFZAglrMGRRXQgm4p8OpdRlWD2Zo/LL7QWp0dGL0nzjsD?=
 =?us-ascii?Q?cvxbIB5YhoTQAzbVKcxc3wW2IWesfv6mzqmGrOyMNn/oQYFpUweq1wYHTql+?=
 =?us-ascii?Q?DNFQEXNMV2FVQuFWVMWYlLXZfTBMiK3daUITP9BQkMMAqmb/WDfaszsFfQgV?=
 =?us-ascii?Q?iu+ct7NVJUHQVhxyfbNwletFtLeSTdoMHiYgYgfAXP8OJkW17TsRy0LRNOyp?=
 =?us-ascii?Q?a/+x50Tcy3TBtj5vY6y743U996BXV4XAwnU6kAQcq4YA7VV57PzweTHwNI9s?=
 =?us-ascii?Q?OS8HQ4XAShPPIIrC5/r+w2vsaH6Zh5bFE0KlLi0d3Vc0bD07GG8gOYBwjPhD?=
 =?us-ascii?Q?yB2gewgEzaDBJ1RtPhrMXaOjG+ZBEj6uzo/Tf+7VGjs9UaieTJMs3aWUuRV+?=
 =?us-ascii?Q?MAA7zyTwg0TP+rEikYejDdR8ySz+VQKrcHPjEHa+avv1T2xCC/65fILVzd97?=
 =?us-ascii?Q?l1qAJ0eFDNn1WlpfjuaFlj4AXXBfYNKUt96lOhC9qRgnZB+TxoQJ5nyQZM3X?=
 =?us-ascii?Q?yiHFcLr1ILpMr9LhQgBh0cLSMCSE+Ha1l+zPqC67OSD6OMD3+vIz2a0gfhAk?=
 =?us-ascii?Q?0Q41m8XpKpUAd+ivFw+h5oJMen106+X7vpr1LJkdA5vN1NzQrFwK7DNRF03s?=
 =?us-ascii?Q?ZSPSE4Gwku6bvBsYdoaPK1i17Qw2pUbTn5XEZIgsZIxfVop5ML76Thxo3i0g?=
 =?us-ascii?Q?wxLmCImNsUGCpokP0YSAd+zcnnOx4Wlgm2lHBcYbvLk20w9tUP3a6BAQSceK?=
 =?us-ascii?Q?B6uuLUjipds4otm63J0rBbpC777g0a23PVx8LAvE/KcyjYkaZoBbFLtfgtNL?=
 =?us-ascii?Q?fAQI3tN3D/GqC8hIMy+MKx9LKIGRJUN2V5y1xZV900/ws7t75VSM8fJlTf+J?=
 =?us-ascii?Q?zHKb7coiRyOGDGQQubMZC3nKT11urMwnwF0XNogy0MfwBaiYWFjZN4j7cP9m?=
 =?us-ascii?Q?K7Kqvmm7z80=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KBZYdMEbYYrZ/aAwZbOLXILQsPnnKtTUz2kcq8nJFxKZFch5zqxZ87iwLwpV?=
 =?us-ascii?Q?Pkw36PRV+c+U+D4bR6aVr8GP8qTBBvyDCHJWKbF7zhPDMhJnhi/hk96bieh0?=
 =?us-ascii?Q?kBs8ge8k4JCJZFlvazlAKqEMV74uRc/XQepYT9n4NkYGV/xOWser8iwV8ASk?=
 =?us-ascii?Q?tsFcbGxgppiWUZL6q3EJFIiQKvg3g4ihhpPemruQmDby3UD/q6+UK//JlfjT?=
 =?us-ascii?Q?I0DPyAeJ19kqKVQXFf1S1QAJoBDZJ+lNTkBA1bdPqPIv5xMtIRTdMNz/5jpC?=
 =?us-ascii?Q?1FrfytxqyRkxThLES9xUOpqgpk/e7cNj++P6QXNuAPFMjtWqEIJB3exLsap6?=
 =?us-ascii?Q?FewbEMlSxRDIQ+L+bCgKGDhGhhSgqXkNslEEptDHjbevOq+7KeCV2Ng3rv4G?=
 =?us-ascii?Q?JZjm2lHlpYuaodPUBjJQbpLYUcfaujBUmVadWfigaIaXGzoSbsNQr20A7zdM?=
 =?us-ascii?Q?c/qI0Hh1tPURaz4k6DkFzShO00OYw6yNMr3QBwXfsBxCUYRIQLThuI3Sr+zy?=
 =?us-ascii?Q?QlJ4pZ5J3Y9cJ1NAUpQ7owtOnnEkQXof/oM5g9HjXz72/vmK1sQDAzAFWw5B?=
 =?us-ascii?Q?PZGbVJDScm51VdAN4yafREv0U9wRshYwDaAkxWFkX6bT4jKjRfUIzx4y90EQ?=
 =?us-ascii?Q?q7b1RNWbCSSq7M2BqC5xXadY5UDknLhOfMARkRFhgndW75NrcoiBY+DE+vCw?=
 =?us-ascii?Q?I9KgeT5xCL+UukWoMSgWj79d/eU/Vis3giHTdiLsGD0Vd9ROT+qwC0EpowOh?=
 =?us-ascii?Q?6pB36YvcMrdv6ojwzfchO0F/Qw8mD64r9fdy56DppTTabNORqWSJGSwqy92K?=
 =?us-ascii?Q?PSDUYNvTMgjXaGMp7bg3LRlUz6CH6ghLvkAIg+yLZR6UgEAucFt1cmMFME8p?=
 =?us-ascii?Q?BPWr5O0Iv5uhkveSEkRBwJQezbBxzi7oPEiFfR7CvVu363Y8C3Jf8PxZ1lgX?=
 =?us-ascii?Q?jJPGmy/i8ccKvC1PekykdcUPyUOh7rA0w/KT2LgS70Uue2ubm2OrHw5ubk8l?=
 =?us-ascii?Q?64+XP0EFdR/chKO/gHMlIPaDZtXPbSlj0CoIkEWevyJzIVRB23oJVuwfRv+j?=
 =?us-ascii?Q?yVjLnmh4QFyxBV9Bcs9jjmPD7zc79Td8kfKSXPfyCsvRkFZyrr7oC3HXS8Yn?=
 =?us-ascii?Q?JZRCP69YIhP1h25isZYlbaHBViIQMpziYiVsP+vrRlMF5vwcbDjbsfxbFg97?=
 =?us-ascii?Q?sX/MKVxdFmjI0Os+imBHU0jCX8DOS81/hJqDuwDteWHLFeLSASIACQ4cn9+f?=
 =?us-ascii?Q?28t2v4iOQFTuL4gvoZJnxBt8jgBYWg8MUFZzRHfBupRvOJmQWXVnkHrzhN5o?=
 =?us-ascii?Q?x8VEvCPJwk4p6LfJ5uUtprZ6/pvPUG36oMrwm88g46SsvSvf7RlPtftTiOYJ?=
 =?us-ascii?Q?nAZEU5+4i3eErfoZYKtGnpXXB9OeXA62ulGQbK87w+hMKghTQPhQcSFn6rEy?=
 =?us-ascii?Q?sfVfTeFK0KkZOt2qvOneqVEALaJq54B4VferzViQMQZT/guGhogjklvWvbJ8?=
 =?us-ascii?Q?5Khr9WsG8gN96qD9u0jCkzxGot9pxHKRp8zEeqxrSlwCtmJ1h5prPAzWRByV?=
 =?us-ascii?Q?3PqbcsEmapm+wEHooueGpE7jbhI+6g9IlpPcobkZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e505c69-d669-44d8-c5ad-08dda40b06e7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 08:29:02.7787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Km9ziFDp+SN5FHPTPyUtsHbvmrGMbq+CVChCdLKLJjEWbTTnC/2ntuO0Q71BLERiDRG9O6STmFC3/e6VmMeZUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6439
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

An enum list is better suited to define a quirk list, do that. This
makes looking up a quirk more robust and also allows for separating
quirks internal to the EDID parser and global quirks which can be
queried outside of the EDID parser (added as a follow-up).

Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 218 +++++++++++++++++++------------------
 1 file changed, 112 insertions(+), 106 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 74e77742b2bd4..857ae0c47a1c3 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -66,34 +66,36 @@ static int oui(u8 first, u8 second, u8 third)
  * on as many displays as possible).
  */
 
-/* First detailed mode wrong, use largest 60Hz mode */
-#define EDID_QUIRK_PREFER_LARGE_60		(1 << 0)
-/* Reported 135MHz pixel clock is too high, needs adjustment */
-#define EDID_QUIRK_135_CLOCK_TOO_HIGH		(1 << 1)
-/* Prefer the largest mode at 75 Hz */
-#define EDID_QUIRK_PREFER_LARGE_75		(1 << 2)
-/* Detail timing is in cm not mm */
-#define EDID_QUIRK_DETAILED_IN_CM		(1 << 3)
-/* Detailed timing descriptors have bogus size values, so just take the
- * maximum size and use that.
- */
-#define EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE	(1 << 4)
-/* use +hsync +vsync for detailed mode */
-#define EDID_QUIRK_DETAILED_SYNC_PP		(1 << 6)
-/* Force reduced-blanking timings for detailed modes */
-#define EDID_QUIRK_FORCE_REDUCED_BLANKING	(1 << 7)
-/* Force 8bpc */
-#define EDID_QUIRK_FORCE_8BPC			(1 << 8)
-/* Force 12bpc */
-#define EDID_QUIRK_FORCE_12BPC			(1 << 9)
-/* Force 6bpc */
-#define EDID_QUIRK_FORCE_6BPC			(1 << 10)
-/* Force 10bpc */
-#define EDID_QUIRK_FORCE_10BPC			(1 << 11)
-/* Non desktop display (i.e. HMD) */
-#define EDID_QUIRK_NON_DESKTOP			(1 << 12)
-/* Cap the DSC target bitrate to 15bpp */
-#define EDID_QUIRK_CAP_DSC_15BPP		(1 << 13)
+enum drm_edid_internal_quirk {
+	/* First detailed mode wrong, use largest 60Hz mode */
+	EDID_QUIRK_PREFER_LARGE_60,
+	/* Reported 135MHz pixel clock is too high, needs adjustment */
+	EDID_QUIRK_135_CLOCK_TOO_HIGH,
+	/* Prefer the largest mode at 75 Hz */
+	EDID_QUIRK_PREFER_LARGE_75,
+	/* Detail timing is in cm not mm */
+	EDID_QUIRK_DETAILED_IN_CM,
+	/* Detailed timing descriptors have bogus size values, so just take the
+	 * maximum size and use that.
+	 */
+	EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE,
+	/* use +hsync +vsync for detailed mode */
+	EDID_QUIRK_DETAILED_SYNC_PP,
+	/* Force reduced-blanking timings for detailed modes */
+	EDID_QUIRK_FORCE_REDUCED_BLANKING,
+	/* Force 8bpc */
+	EDID_QUIRK_FORCE_8BPC,
+	/* Force 12bpc */
+	EDID_QUIRK_FORCE_12BPC,
+	/* Force 6bpc */
+	EDID_QUIRK_FORCE_6BPC,
+	/* Force 10bpc */
+	EDID_QUIRK_FORCE_10BPC,
+	/* Non desktop display (i.e. HMD) */
+	EDID_QUIRK_NON_DESKTOP,
+	/* Cap the DSC target bitrate to 15bpp */
+	EDID_QUIRK_CAP_DSC_15BPP,
+};
 
 #define MICROSOFT_IEEE_OUI	0xca125c
 
@@ -128,124 +130,124 @@ static const struct edid_quirk {
 	u32 quirks;
 } edid_quirk_list[] = {
 	/* Acer AL1706 */
-	EDID_QUIRK('A', 'C', 'R', 44358, EDID_QUIRK_PREFER_LARGE_60),
+	EDID_QUIRK('A', 'C', 'R', 44358, BIT(EDID_QUIRK_PREFER_LARGE_60)),
 	/* Acer F51 */
-	EDID_QUIRK('A', 'P', 'I', 0x7602, EDID_QUIRK_PREFER_LARGE_60),
+	EDID_QUIRK('A', 'P', 'I', 0x7602, BIT(EDID_QUIRK_PREFER_LARGE_60)),
 
 	/* AEO model 0 reports 8 bpc, but is a 6 bpc panel */
-	EDID_QUIRK('A', 'E', 'O', 0, EDID_QUIRK_FORCE_6BPC),
+	EDID_QUIRK('A', 'E', 'O', 0, BIT(EDID_QUIRK_FORCE_6BPC)),
 
 	/* BenQ GW2765 */
-	EDID_QUIRK('B', 'N', 'Q', 0x78d6, EDID_QUIRK_FORCE_8BPC),
+	EDID_QUIRK('B', 'N', 'Q', 0x78d6, BIT(EDID_QUIRK_FORCE_8BPC)),
 
 	/* BOE model on HP Pavilion 15-n233sl reports 8 bpc, but is a 6 bpc panel */
-	EDID_QUIRK('B', 'O', 'E', 0x78b, EDID_QUIRK_FORCE_6BPC),
+	EDID_QUIRK('B', 'O', 'E', 0x78b, BIT(EDID_QUIRK_FORCE_6BPC)),
 
 	/* CPT panel of Asus UX303LA reports 8 bpc, but is a 6 bpc panel */
-	EDID_QUIRK('C', 'P', 'T', 0x17df, EDID_QUIRK_FORCE_6BPC),
+	EDID_QUIRK('C', 'P', 'T', 0x17df, BIT(EDID_QUIRK_FORCE_6BPC)),
 
 	/* SDC panel of Lenovo B50-80 reports 8 bpc, but is a 6 bpc panel */
-	EDID_QUIRK('S', 'D', 'C', 0x3652, EDID_QUIRK_FORCE_6BPC),
+	EDID_QUIRK('S', 'D', 'C', 0x3652, BIT(EDID_QUIRK_FORCE_6BPC)),
 
 	/* BOE model 0x0771 reports 8 bpc, but is a 6 bpc panel */
-	EDID_QUIRK('B', 'O', 'E', 0x0771, EDID_QUIRK_FORCE_6BPC),
+	EDID_QUIRK('B', 'O', 'E', 0x0771, BIT(EDID_QUIRK_FORCE_6BPC)),
 
 	/* Belinea 10 15 55 */
-	EDID_QUIRK('M', 'A', 'X', 1516, EDID_QUIRK_PREFER_LARGE_60),
-	EDID_QUIRK('M', 'A', 'X', 0x77e, EDID_QUIRK_PREFER_LARGE_60),
+	EDID_QUIRK('M', 'A', 'X', 1516, BIT(EDID_QUIRK_PREFER_LARGE_60)),
+	EDID_QUIRK('M', 'A', 'X', 0x77e, BIT(EDID_QUIRK_PREFER_LARGE_60)),
 
 	/* Envision Peripherals, Inc. EN-7100e */
-	EDID_QUIRK('E', 'P', 'I', 59264, EDID_QUIRK_135_CLOCK_TOO_HIGH),
+	EDID_QUIRK('E', 'P', 'I', 59264, BIT(EDID_QUIRK_135_CLOCK_TOO_HIGH)),
 	/* Envision EN2028 */
-	EDID_QUIRK('E', 'P', 'I', 8232, EDID_QUIRK_PREFER_LARGE_60),
+	EDID_QUIRK('E', 'P', 'I', 8232, BIT(EDID_QUIRK_PREFER_LARGE_60)),
 
 	/* Funai Electronics PM36B */
-	EDID_QUIRK('F', 'C', 'M', 13600, EDID_QUIRK_PREFER_LARGE_75 |
-				       EDID_QUIRK_DETAILED_IN_CM),
+	EDID_QUIRK('F', 'C', 'M', 13600, BIT(EDID_QUIRK_PREFER_LARGE_75) |
+					 BIT(EDID_QUIRK_DETAILED_IN_CM)),
 
 	/* LG 27GP950 */
-	EDID_QUIRK('G', 'S', 'M', 0x5bbf, EDID_QUIRK_CAP_DSC_15BPP),
+	EDID_QUIRK('G', 'S', 'M', 0x5bbf, BIT(EDID_QUIRK_CAP_DSC_15BPP)),
 
 	/* LG 27GN950 */
-	EDID_QUIRK('G', 'S', 'M', 0x5b9a, EDID_QUIRK_CAP_DSC_15BPP),
+	EDID_QUIRK('G', 'S', 'M', 0x5b9a, BIT(EDID_QUIRK_CAP_DSC_15BPP)),
 
 	/* LGD panel of HP zBook 17 G2, eDP 10 bpc, but reports unknown bpc */
-	EDID_QUIRK('L', 'G', 'D', 764, EDID_QUIRK_FORCE_10BPC),
+	EDID_QUIRK('L', 'G', 'D', 764, BIT(EDID_QUIRK_FORCE_10BPC)),
 
 	/* LG Philips LCD LP154W01-A5 */
-	EDID_QUIRK('L', 'P', 'L', 0, EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE),
-	EDID_QUIRK('L', 'P', 'L', 0x2a00, EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE),
+	EDID_QUIRK('L', 'P', 'L', 0, BIT(EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE)),
+	EDID_QUIRK('L', 'P', 'L', 0x2a00, BIT(EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE)),
 
 	/* Samsung SyncMaster 205BW.  Note: irony */
-	EDID_QUIRK('S', 'A', 'M', 541, EDID_QUIRK_DETAILED_SYNC_PP),
+	EDID_QUIRK('S', 'A', 'M', 541, BIT(EDID_QUIRK_DETAILED_SYNC_PP)),
 	/* Samsung SyncMaster 22[5-6]BW */
-	EDID_QUIRK('S', 'A', 'M', 596, EDID_QUIRK_PREFER_LARGE_60),
-	EDID_QUIRK('S', 'A', 'M', 638, EDID_QUIRK_PREFER_LARGE_60),
+	EDID_QUIRK('S', 'A', 'M', 596, BIT(EDID_QUIRK_PREFER_LARGE_60)),
+	EDID_QUIRK('S', 'A', 'M', 638, BIT(EDID_QUIRK_PREFER_LARGE_60)),
 
 	/* Sony PVM-2541A does up to 12 bpc, but only reports max 8 bpc */
-	EDID_QUIRK('S', 'N', 'Y', 0x2541, EDID_QUIRK_FORCE_12BPC),
+	EDID_QUIRK('S', 'N', 'Y', 0x2541, BIT(EDID_QUIRK_FORCE_12BPC)),
 
 	/* ViewSonic VA2026w */
-	EDID_QUIRK('V', 'S', 'C', 5020, EDID_QUIRK_FORCE_REDUCED_BLANKING),
+	EDID_QUIRK('V', 'S', 'C', 5020, BIT(EDID_QUIRK_FORCE_REDUCED_BLANKING)),
 
 	/* Medion MD 30217 PG */
-	EDID_QUIRK('M', 'E', 'D', 0x7b8, EDID_QUIRK_PREFER_LARGE_75),
+	EDID_QUIRK('M', 'E', 'D', 0x7b8, BIT(EDID_QUIRK_PREFER_LARGE_75)),
 
 	/* Lenovo G50 */
-	EDID_QUIRK('S', 'D', 'C', 18514, EDID_QUIRK_FORCE_6BPC),
+	EDID_QUIRK('S', 'D', 'C', 18514, BIT(EDID_QUIRK_FORCE_6BPC)),
 
 	/* Panel in Samsung NP700G7A-S01PL notebook reports 6bpc */
-	EDID_QUIRK('S', 'E', 'C', 0xd033, EDID_QUIRK_FORCE_8BPC),
+	EDID_QUIRK('S', 'E', 'C', 0xd033, BIT(EDID_QUIRK_FORCE_8BPC)),
 
 	/* Rotel RSX-1058 forwards sink's EDID but only does HDMI 1.1*/
-	EDID_QUIRK('E', 'T', 'R', 13896, EDID_QUIRK_FORCE_8BPC),
+	EDID_QUIRK('E', 'T', 'R', 13896, BIT(EDID_QUIRK_FORCE_8BPC)),
 
 	/* Valve Index Headset */
-	EDID_QUIRK('V', 'L', 'V', 0x91a8, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK('V', 'L', 'V', 0x91b0, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK('V', 'L', 'V', 0x91b1, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK('V', 'L', 'V', 0x91b2, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK('V', 'L', 'V', 0x91b3, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK('V', 'L', 'V', 0x91b4, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK('V', 'L', 'V', 0x91b5, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK('V', 'L', 'V', 0x91b6, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK('V', 'L', 'V', 0x91b7, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK('V', 'L', 'V', 0x91b8, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK('V', 'L', 'V', 0x91b9, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK('V', 'L', 'V', 0x91ba, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK('V', 'L', 'V', 0x91bb, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK('V', 'L', 'V', 0x91bc, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK('V', 'L', 'V', 0x91bd, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK('V', 'L', 'V', 0x91be, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK('V', 'L', 'V', 0x91bf, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('V', 'L', 'V', 0x91a8, BIT(EDID_QUIRK_NON_DESKTOP)),
+	EDID_QUIRK('V', 'L', 'V', 0x91b0, BIT(EDID_QUIRK_NON_DESKTOP)),
+	EDID_QUIRK('V', 'L', 'V', 0x91b1, BIT(EDID_QUIRK_NON_DESKTOP)),
+	EDID_QUIRK('V', 'L', 'V', 0x91b2, BIT(EDID_QUIRK_NON_DESKTOP)),
+	EDID_QUIRK('V', 'L', 'V', 0x91b3, BIT(EDID_QUIRK_NON_DESKTOP)),
+	EDID_QUIRK('V', 'L', 'V', 0x91b4, BIT(EDID_QUIRK_NON_DESKTOP)),
+	EDID_QUIRK('V', 'L', 'V', 0x91b5, BIT(EDID_QUIRK_NON_DESKTOP)),
+	EDID_QUIRK('V', 'L', 'V', 0x91b6, BIT(EDID_QUIRK_NON_DESKTOP)),
+	EDID_QUIRK('V', 'L', 'V', 0x91b7, BIT(EDID_QUIRK_NON_DESKTOP)),
+	EDID_QUIRK('V', 'L', 'V', 0x91b8, BIT(EDID_QUIRK_NON_DESKTOP)),
+	EDID_QUIRK('V', 'L', 'V', 0x91b9, BIT(EDID_QUIRK_NON_DESKTOP)),
+	EDID_QUIRK('V', 'L', 'V', 0x91ba, BIT(EDID_QUIRK_NON_DESKTOP)),
+	EDID_QUIRK('V', 'L', 'V', 0x91bb, BIT(EDID_QUIRK_NON_DESKTOP)),
+	EDID_QUIRK('V', 'L', 'V', 0x91bc, BIT(EDID_QUIRK_NON_DESKTOP)),
+	EDID_QUIRK('V', 'L', 'V', 0x91bd, BIT(EDID_QUIRK_NON_DESKTOP)),
+	EDID_QUIRK('V', 'L', 'V', 0x91be, BIT(EDID_QUIRK_NON_DESKTOP)),
+	EDID_QUIRK('V', 'L', 'V', 0x91bf, BIT(EDID_QUIRK_NON_DESKTOP)),
 
 	/* HTC Vive and Vive Pro VR Headsets */
-	EDID_QUIRK('H', 'V', 'R', 0xaa01, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK('H', 'V', 'R', 0xaa02, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('H', 'V', 'R', 0xaa01, BIT(EDID_QUIRK_NON_DESKTOP)),
+	EDID_QUIRK('H', 'V', 'R', 0xaa02, BIT(EDID_QUIRK_NON_DESKTOP)),
 
 	/* Oculus Rift DK1, DK2, CV1 and Rift S VR Headsets */
-	EDID_QUIRK('O', 'V', 'R', 0x0001, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK('O', 'V', 'R', 0x0003, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK('O', 'V', 'R', 0x0004, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK('O', 'V', 'R', 0x0012, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('O', 'V', 'R', 0x0001, BIT(EDID_QUIRK_NON_DESKTOP)),
+	EDID_QUIRK('O', 'V', 'R', 0x0003, BIT(EDID_QUIRK_NON_DESKTOP)),
+	EDID_QUIRK('O', 'V', 'R', 0x0004, BIT(EDID_QUIRK_NON_DESKTOP)),
+	EDID_QUIRK('O', 'V', 'R', 0x0012, BIT(EDID_QUIRK_NON_DESKTOP)),
 
 	/* Windows Mixed Reality Headsets */
-	EDID_QUIRK('A', 'C', 'R', 0x7fce, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK('L', 'E', 'N', 0x0408, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK('F', 'U', 'J', 0x1970, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK('D', 'E', 'L', 0x7fce, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK('S', 'E', 'C', 0x144a, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK('A', 'U', 'S', 0xc102, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('A', 'C', 'R', 0x7fce, BIT(EDID_QUIRK_NON_DESKTOP)),
+	EDID_QUIRK('L', 'E', 'N', 0x0408, BIT(EDID_QUIRK_NON_DESKTOP)),
+	EDID_QUIRK('F', 'U', 'J', 0x1970, BIT(EDID_QUIRK_NON_DESKTOP)),
+	EDID_QUIRK('D', 'E', 'L', 0x7fce, BIT(EDID_QUIRK_NON_DESKTOP)),
+	EDID_QUIRK('S', 'E', 'C', 0x144a, BIT(EDID_QUIRK_NON_DESKTOP)),
+	EDID_QUIRK('A', 'U', 'S', 0xc102, BIT(EDID_QUIRK_NON_DESKTOP)),
 
 	/* Sony PlayStation VR Headset */
-	EDID_QUIRK('S', 'N', 'Y', 0x0704, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('S', 'N', 'Y', 0x0704, BIT(EDID_QUIRK_NON_DESKTOP)),
 
 	/* Sensics VR Headsets */
-	EDID_QUIRK('S', 'E', 'N', 0x1019, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('S', 'E', 'N', 0x1019, BIT(EDID_QUIRK_NON_DESKTOP)),
 
 	/* OSVR HDK and HDK2 VR Headsets */
-	EDID_QUIRK('S', 'V', 'R', 0x1019, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK('A', 'U', 'O', 0x1111, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('S', 'V', 'R', 0x1019, BIT(EDID_QUIRK_NON_DESKTOP)),
+	EDID_QUIRK('A', 'U', 'O', 0x1111, BIT(EDID_QUIRK_NON_DESKTOP)),
 };
 
 /*
@@ -2951,6 +2953,12 @@ static u32 edid_get_quirks(const struct drm_edid *drm_edid)
 	return 0;
 }
 
+static bool drm_edid_has_internal_quirk(struct drm_connector *connector,
+					enum drm_edid_internal_quirk quirk)
+{
+	return connector->display_info.quirks & BIT(quirk);
+}
+
 #define MODE_SIZE(m) ((m)->hdisplay * (m)->vdisplay)
 #define MODE_REFRESH_DIFF(c,t) (abs((c) - (t)))
 
@@ -2960,7 +2968,6 @@ static u32 edid_get_quirks(const struct drm_edid *drm_edid)
  */
 static void edid_fixup_preferred(struct drm_connector *connector)
 {
-	const struct drm_display_info *info = &connector->display_info;
 	struct drm_display_mode *t, *cur_mode, *preferred_mode;
 	int target_refresh = 0;
 	int cur_vrefresh, preferred_vrefresh;
@@ -2968,9 +2975,9 @@ static void edid_fixup_preferred(struct drm_connector *connector)
 	if (list_empty(&connector->probed_modes))
 		return;
 
-	if (info->quirks & EDID_QUIRK_PREFER_LARGE_60)
+	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_PREFER_LARGE_60))
 		target_refresh = 60;
-	if (info->quirks & EDID_QUIRK_PREFER_LARGE_75)
+	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_PREFER_LARGE_75))
 		target_refresh = 75;
 
 	preferred_mode = list_first_entry(&connector->probed_modes,
@@ -3474,7 +3481,6 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
 						  const struct drm_edid *drm_edid,
 						  const struct detailed_timing *timing)
 {
-	const struct drm_display_info *info = &connector->display_info;
 	struct drm_device *dev = connector->dev;
 	struct drm_display_mode *mode;
 	const struct detailed_pixel_timing *pt = &timing->data.pixel_data;
@@ -3508,7 +3514,7 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
 		return NULL;
 	}
 
-	if (info->quirks & EDID_QUIRK_FORCE_REDUCED_BLANKING) {
+	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_FORCE_REDUCED_BLANKING)) {
 		mode = drm_cvt_mode(dev, hactive, vactive, 60, true, false, false);
 		if (!mode)
 			return NULL;
@@ -3520,7 +3526,7 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
 	if (!mode)
 		return NULL;
 
-	if (info->quirks & EDID_QUIRK_135_CLOCK_TOO_HIGH)
+	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_135_CLOCK_TOO_HIGH))
 		mode->clock = 1088 * 10;
 	else
 		mode->clock = le16_to_cpu(timing->pixel_clock) * 10;
@@ -3551,7 +3557,7 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
 
 	drm_mode_do_interlace_quirk(mode, pt);
 
-	if (info->quirks & EDID_QUIRK_DETAILED_SYNC_PP) {
+	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_DETAILED_SYNC_PP)) {
 		mode->flags |= DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC;
 	} else {
 		mode->flags |= (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
@@ -3564,12 +3570,12 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
 	mode->width_mm = pt->width_mm_lo | (pt->width_height_mm_hi & 0xf0) << 4;
 	mode->height_mm = pt->height_mm_lo | (pt->width_height_mm_hi & 0xf) << 8;
 
-	if (info->quirks & EDID_QUIRK_DETAILED_IN_CM) {
+	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_DETAILED_IN_CM)) {
 		mode->width_mm *= 10;
 		mode->height_mm *= 10;
 	}
 
-	if (info->quirks & EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE) {
+	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE)) {
 		mode->width_mm = drm_edid->edid->width_cm * 10;
 		mode->height_mm = drm_edid->edid->height_cm * 10;
 	}
@@ -6734,26 +6740,26 @@ static void update_display_info(struct drm_connector *connector,
 	drm_update_mso(connector, drm_edid);
 
 out:
-	if (info->quirks & EDID_QUIRK_NON_DESKTOP) {
+	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_NON_DESKTOP)) {
 		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] Non-desktop display%s\n",
 			    connector->base.id, connector->name,
 			    info->non_desktop ? " (redundant quirk)" : "");
 		info->non_desktop = true;
 	}
 
-	if (info->quirks & EDID_QUIRK_CAP_DSC_15BPP)
+	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_CAP_DSC_15BPP))
 		info->max_dsc_bpp = 15;
 
-	if (info->quirks & EDID_QUIRK_FORCE_6BPC)
+	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_FORCE_6BPC))
 		info->bpc = 6;
 
-	if (info->quirks & EDID_QUIRK_FORCE_8BPC)
+	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_FORCE_8BPC))
 		info->bpc = 8;
 
-	if (info->quirks & EDID_QUIRK_FORCE_10BPC)
+	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_FORCE_10BPC))
 		info->bpc = 10;
 
-	if (info->quirks & EDID_QUIRK_FORCE_12BPC)
+	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_FORCE_12BPC))
 		info->bpc = 12;
 
 	/* Depends on info->cea_rev set by drm_parse_cea_ext() above */
@@ -6918,7 +6924,6 @@ static int add_displayid_detailed_modes(struct drm_connector *connector,
 static int _drm_edid_connector_add_modes(struct drm_connector *connector,
 					 const struct drm_edid *drm_edid)
 {
-	const struct drm_display_info *info = &connector->display_info;
 	int num_modes = 0;
 
 	if (!drm_edid)
@@ -6948,7 +6953,8 @@ static int _drm_edid_connector_add_modes(struct drm_connector *connector,
 	if (drm_edid->edid->features & DRM_EDID_FEATURE_CONTINUOUS_FREQ)
 		num_modes += add_inferred_modes(connector, drm_edid);
 
-	if (info->quirks & (EDID_QUIRK_PREFER_LARGE_60 | EDID_QUIRK_PREFER_LARGE_75))
+	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_PREFER_LARGE_60) ||
+	    drm_edid_has_internal_quirk(connector, EDID_QUIRK_PREFER_LARGE_75))
 		edid_fixup_preferred(connector);
 
 	return num_modes;
-- 
2.44.2

