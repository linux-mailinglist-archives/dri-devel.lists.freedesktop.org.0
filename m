Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3F59AF5C1
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 01:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB8510E3D2;
	Thu, 24 Oct 2024 23:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QB04y1L2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8371110E3D2;
 Thu, 24 Oct 2024 23:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729811773; x=1761347773;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=gLmeHvv+P1eQUjdjXbaBLyUYW6YB4DHvwqpet9L0f/g=;
 b=QB04y1L2hMVQtVSg5X7wsD9q0746JMK520l2gH2Ff/CyGoTQgluMBSfX
 KNU6ZXu57SSpi49xQOE/RWCGT409po0mlJCOuiNShfgfd1ZlpOp0t+7Ec
 uSCJz5QLKruXMOsLtomvhZ5lMykaAGzcQIvsUp+sl1JUFrsvA8WJiEtTj
 nlCQEnZo4Bb6XXj3RbYcrJLXpUc4pCblhWjErk5nCSBZAAbklKP5hXTgg
 tD6a7RmL7qJZoWD+xnozPQ55aErtmEZXaKROj6twjew582ntP9L3I4M5X
 u1pldRwtPkSrNtdUNfPSj4SXdJUiJcaVJscSD4SG/MPANru4YnXSJEm6k A==;
X-CSE-ConnectionGUID: Gaps6AARR6i25nbyQ24N5w==
X-CSE-MsgGUID: 0aWbb1zdRe2AekQkdSLV/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="33274186"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; d="scan'208";a="33274186"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 16:16:13 -0700
X-CSE-ConnectionGUID: X2vo1drvSbiHzEmIPzaKEA==
X-CSE-MsgGUID: +BzR1qY4RKOkHa09kmWPjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; d="scan'208";a="80650161"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 16:16:13 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 16:16:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 16:16:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 16:16:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXk2NArf52Du6UX2TA4j02ndtf+LomYHrwjVYwJDFB9JNuplkEYEwf80DF1OOkX9PKq8Iv45GLcPkDiXh3wHpkY0xoPG8/b40qriOGOV+OA6MsoBma7PnuqUvInTY+S5StShwIDUgPkwfmEH/kmqv8E4Zye8f4acnV56DYo2knmY0aIKesUBAFeyOjxS6OMJjoCZVOsO8HT/3yjm72e4AJMZ/k16eG7K1zwoMLFa04Seh89y9EI6GjMIgN7NZVktJbBlvOskOAYyhwKQd1GZ4hATshhi8ipep27zR43USVN0AascBd22EkS++1mb+YZrR2GuPwrLdUhclVh5iKbA6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F02WOFlq05HZr9Ham9MjBtg/7khkGzKmEFn4SOMwX3o=;
 b=G22wRaF7nRgAAZkNu5xZ6eEUKEshHmCndeTZq/5By3Q9m8XqNTnhzkxnfkMZXpk4rrNKPwv74XduJjYcO/GMYbvpO7W6gJ01iTYyaZoNR1hkIiGRXPqwqS0wU9orYPMC9qWy5tRD3S6xescXbg2BIYOE09SWMYPwt6dEVSOPvIhYAW/WnXK05Dxq43c5ye01lmYup/PUmdiH2zGbHJESUFEjq68CC2i6/Gtqxc94eZpJ0g4BtCtuwSe/qMw5+mJ3VsIA3sEGc3EPVp7Gr0GNHmj23SFkkcIRC4BZRk0LoT/c8usoss4ww4NHMwSvNZJN+6/wevF0FApOfcG90gR/ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH8PR11MB6706.namprd11.prod.outlook.com (2603:10b6:510:1c5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.30; Thu, 24 Oct
 2024 23:16:09 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 23:16:09 +0000
Date: Thu, 24 Oct 2024 18:15:59 -0500
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
Message-ID: <trlkoiewtc4x2cyhsxmj3atayyq4zwto4iryea5pvya2ymc3yp@fdx5nhwmiyem>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
X-ClientProxiedBy: MW3PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:303:2b::12) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH8PR11MB6706:EE_
X-MS-Office365-Filtering-Correlation-Id: 8827c62a-4793-4857-1107-08dcf481d7c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zqEGoiV7cEn2vax+k3DDFF3GTi2rUZlOy9Yb/DUhqt0J/9fu9XTav6YOh0jf?=
 =?us-ascii?Q?sFpMprIYcMwhiY3ttG8PaL6SW0svpoU3scWQ8p9O4lLyMVs+hrPYSUGeLl7L?=
 =?us-ascii?Q?N0aqzeg36L5gpnNoYc5Ee81rTcAoYC/yPblJXoEiOnms2AROrHjnem8bSiOE?=
 =?us-ascii?Q?ajsL7z6ZOdkbnm1x3+No9Y97E7udM72dDY4zSselq5+ckW8a+KGKBRUY+Y8r?=
 =?us-ascii?Q?kv9+ykhvV8/+tZh1qUiwgyb9rAboReSvhXOMGhK9ICKcwsiXRwxcc031xgiz?=
 =?us-ascii?Q?Beh2NFwzWOWKMt0+goCX6O4+dw8ZmulUxDSP8kTJ3VvjtTtBA2niTv/mlPbq?=
 =?us-ascii?Q?0MyWfSlxEO13enO60a5tzBhj3OMd8ZWo+WXtYtB4MQ9d5A2l1x/7XBOU/khv?=
 =?us-ascii?Q?cF0h4JfbqhW40RziRyZ9WwQbUG/1/C3T90GoI3JKaIAciL1V0Eb9/AUnTgdL?=
 =?us-ascii?Q?KrtyyQBMz65noKF74hm53qYHs463wQ4TJAdlujla064YU8QOAOECliZlc5dq?=
 =?us-ascii?Q?k92tQcp2zkr6cPf9pwWBaq3aVXdRevDM7ZiCZyad0euSbiFPFNjIqhyxfoEY?=
 =?us-ascii?Q?Bbq5faIw20jQmAfcYwJ0p04ion+2SvM3cTlU1a97uiPTpKVjIqrg9+uppB9g?=
 =?us-ascii?Q?bJYXyceC8lkJ3vQR/haIm4P7MO0BH1zAuI8yZGgQ2LVArwVBE5C/FDNgeeOi?=
 =?us-ascii?Q?4gyDgjtM9Nj9+J/w6M42caftZEHm/yv7D8WsKkDBpn76/GQqoJmWt+VpQXe6?=
 =?us-ascii?Q?/PcAPhhWT+Sx4LCccSml6kxIPYsf0f9/+5lr+gnjAFFFLUR4oe5aJuhJ1W3w?=
 =?us-ascii?Q?N/dqboVZA1yboHogy1E9QICNxoXOfvUZQHmTraCVcWSZR3tn7id/lOzS+cTD?=
 =?us-ascii?Q?1H/sUZZk0rvBWOp4IoXOiKx9f1flZ+xwIiWlS4vPRHIlzQOpZCO1M1gPkGSf?=
 =?us-ascii?Q?RVQD6FowxbxmMHUQvZ0v6FH3v1+DLpWViwjt2sY33ipgD2LddvCTlqCtuFhz?=
 =?us-ascii?Q?hwHRJldLdoZpjFhgmufie1HM3kVdYC4wq/l/5QgA/KWkEiQkZC+hbP4dLgZw?=
 =?us-ascii?Q?OBcMQe/2z89f2hY5gQ8oxtKpfAIy/sbm8MwWzI83qHoik8baMyc2XZ1AaqlI?=
 =?us-ascii?Q?n7fIONyWKSD+hcqgvylpU0F/JSEplimESPIiZoe8CHfeQI6KHazr8RJPXAHw?=
 =?us-ascii?Q?8ez5WyDm1pnj71s504XOAkl2EUEo0GLSiz2VoH1y2KKKScoAH2HAvJoAnnPb?=
 =?us-ascii?Q?iqZMTi20LDsnTAXCmkEXtP7AgRIWDdZ0clZG36k30w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MMOxl7IlJIR8Vuxn9Tldn5FLzRR2J+OrmtyqX8RLFYgZUFtU0f3fut5oMXoM?=
 =?us-ascii?Q?hROXKQBe1qaVVS9kYfOCJeG8z15F6Xtx3XFKQQy2BEoeyKYYdZYY9Rb9g1Mn?=
 =?us-ascii?Q?aTM9lkEyZ1tvWEgnVOkPMdRJGKPKGg7PaDInLMolwXFfkbdOQSX+w7pIiNiO?=
 =?us-ascii?Q?mXNQfXQtRPLP4MNqgFfZFGU39fbLTY+M2Hn04S7ngi6i8psmXtNoN2VisSVp?=
 =?us-ascii?Q?1Ge2lqBPF6xJjuUSRWkh+1S+dqaCJnQvd0Ootw0GfW1NZDkOn6pHM/GoZ/w3?=
 =?us-ascii?Q?WOjul0LwYdVaS3yA4hSZJHCW9ljcP16too2SzVRR6hdKlHSRONPncXNiTU9o?=
 =?us-ascii?Q?4bnvqVBFgU2fC25QZ3Kih+JfZ8W8WsB8Mg1yEXfUL/ZDbgxGFQ2QcvwIbjFv?=
 =?us-ascii?Q?YI33B3mmTVeV3OfPSTps1wpg7kVQhwyuVcF3O5CPj89+3hlABHZlV7ZZItOG?=
 =?us-ascii?Q?FUQfBs52ayVtIx9Eepwedu47NhYOGT9Wmn12f8fI1oGrcGltEeYPBFNmWH3E?=
 =?us-ascii?Q?bsi/dImLCuaicjB+giOzB3lkvXb83cnH6HpcVSpz9Olk5hPVTBEIjdvsB9MA?=
 =?us-ascii?Q?DHLFhOmlcIGuXXZHKcJTpNTdJn6D/otM6l/IM+wKCyJA1FxF4cfzbx5mGHQD?=
 =?us-ascii?Q?Cfr/8dtHiEWaNXaCN+869k6X6lSBdglmXVjbwyem/d3C+RCVKrqsV+ogbqzp?=
 =?us-ascii?Q?hi2p3nT5ezK2mxYJ5c0W9iu4o/KOgv2SfpCdx4U23s32yhIXccezjJBGXobX?=
 =?us-ascii?Q?azLkatFayJWxOF+p0cYT7+cnTHetJ+4V+gE2gpjZG4MBswd/V0psQeZTJD/V?=
 =?us-ascii?Q?ilsGvv6W/qzwaBAGiubcL00pMVnFgD0IrJC+uZbFCzf2kjc0tbee0oC54Ybl?=
 =?us-ascii?Q?mEfBUP23LYu0mt60mF6NtpygKUYgIgpUqLV//e6eQh8JxEmaL0s5xXDzF/nA?=
 =?us-ascii?Q?W3LCmYEKoEQnn4xrPL29m/fLhjCNE8AVt4iXczw+HUAXCy61B16L0h9bZlEu?=
 =?us-ascii?Q?aSa2r9iFv831yxAkRzkRzH95W54WgWBLdUaoR2fpqL2pv4Kpuqgcsto5Be9D?=
 =?us-ascii?Q?CP9T06q/5OvlZDJkExZXmUUSWDJrozEWZ97bofNwbr2+HPnNOfwB5akTsYux?=
 =?us-ascii?Q?gaHE4UumCRREEKLsXWe24CgTBpz/NaeUtlCJB+m0J2r7MsXIWJDSY7FT9DU0?=
 =?us-ascii?Q?jQkak2+3VdkE+LTSphuX9KnDkIkNwRZPRx0mivzKbeSBAKCQ48EPOD7DH22K?=
 =?us-ascii?Q?jTMoulfT6qEhhTRrqrDKe2u4EQX5DJCkCQHMQAfLsDUtmZ9GNQs+8OILGI9p?=
 =?us-ascii?Q?J67ACwHEuRDrXNJ9eOcUeepy4HNvZsAkwWxBEA4+2BGQimzRczPtdx5w57at?=
 =?us-ascii?Q?X2X29RLPJrUm1cYQ6gy0Vp3mV8NsG3HK7e0pXV1mSKdHNQnBj5+IJ1CqdfHk?=
 =?us-ascii?Q?iI2pC5FVA7Esz60B8WpLOM+OFCiWgNNPtb+PbMY9AMmUhYsHewBvQW9etjKf?=
 =?us-ascii?Q?xYOh59l7isogb8m9jxqcA4toWGrUmm6ldhGtg/awkZb3m9uDHTto3+irN3sQ?=
 =?us-ascii?Q?KepR6S+WfjswhsU+SgXz5fCZjPI/bBAMLG7XtkxF/r+7iLZcz2m6XVH8alml?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8827c62a-4793-4857-1107-08dcf481d7c1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 23:16:09.0164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xo2ku6t7r7fMGElY8Dn3wT8bC8mlmvZ/MrpaquRUxVcxPkUbpDJ/RqBvHkYRa7Y0oTSinQEwCixa3gzavNYl7D39cDj6aglrGBHeKbI85ic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6706
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

Hi Dave and Simona,

drm-xe-fixes for 6.12-rc5 with commits mostly improving error handling.
The g2h flush helps some LNL we are seeing, but we still have other 2
similar ones - however they didn't make it in time to drm-xe-next to be
properly tested, so I'm leaving for later.

There are 2 conflicts when merging drm-next on top that I fixed
in drm-tip: the first is trivial, just taking drm-next. The second is
also trivial, preferring xa_erase() over xa_erase_irq(), but the diff
context is more scary, so I'm pasting here (with a | prefix so bots
don't try anything funny):

| remerge CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_ct.c
| index c6caf8f92421..c260d8840990 100644
| --- a/drivers/gpu/drm/xe/xe_guc_ct.c
| +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
| @@ -1019,7 +1019,6 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
|          ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
|   
|          /*
| -<<<<<<< 3cf59b00bd34 (Merge remote-tracking branch 'drm-xe/drm-xe-fixes' into drm-tip)
|           * Occasionally it is seen that the G2H worker starts running after a delay of more than
|           * a second even after being queued and activated by the Linux workqueue subsystem. This
|           * leads to G2H timeout error. The root cause of issue lies with scheduling latency of
| @@ -1044,22 +1043,10 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
|           * correct ordering, and we lack the needed barriers.
|           */
|          mutex_lock(&ct->lock);
| -       if (!ret) {
| -               xe_gt_err(gt, "Timed out wait for G2H, fence %u, action %04x, done %s",
| -                         g2h_fence.seqno, action[0], str_yes_no(g2h_fence.done));
| -               xa_erase_irq(&ct->fence_lookup, g2h_fence.seqno);
| -=======
| -        * Ensure we serialize with completion side to prevent UAF with fence going out of scope on
| -        * the stack, since we have no clue if it will fire after the timeout before we can erase
| -        * from the xa. Also we have some dependent loads and stores below for which we need the
| -        * correct ordering, and we lack the needed barriers.
| -        */
| -       mutex_lock(&ct->lock);
|          if (!ret) {
|                  xe_gt_err(gt, "Timed out wait for G2H, fence %u, action %04x, done %s",
|                            g2h_fence.seqno, action[0], str_yes_no(g2h_fence.done));
|                  xa_erase(&ct->fence_lookup, g2h_fence.seqno);
| ->>>>>>> c9ff14d0339a (Merge tag 'drm-intel-gt-next-2024-10-23' of https://gitlab.freedesktop.org/drm/i915/kernel into drm-next)

thanks
Lucas De Marchi

drm-xe-fixes-2024-10-24-1:
Driver Changes:
- Increase invalidation timeout to avoid errors in some hosts (Shuicheng)
- Flush worker on timeout (Badal)
- Better handling for force wake failure (Shuicheng)
- Improve argument check on user fence creation (Nirmoy)
- Don't restart parallel queues multiple times on GT reset (Nirmoy)
The following changes since commit 42f7652d3eb527d03665b09edac47f85fb600924:

   Linux 6.12-rc4 (2024-10-20 15:19:38 -0700)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-10-24-1

for you to fetch changes up to cdc21021f0351226a4845715564afd5dc50ed44b:

   drm/xe: Don't restart parallel queues multiple times on GT reset (2024-10-24 12:42:52 -0500)

----------------------------------------------------------------
Driver Changes:
- Increase invalidation timeout to avoid errors in some hosts (Shuicheng)
- Flush worker on timeout (Badal)
- Better handling for force wake failure (Shuicheng)
- Improve argument check on user fence creation (Nirmoy)
- Don't restart parallel queues multiple times on GT reset (Nirmoy)

----------------------------------------------------------------
Badal Nilawar (1):
       drm/xe/guc/ct: Flush g2h worker in case of g2h response timeout

Nirmoy Das (2):
       drm/xe/ufence: Prefetch ufence addr to catch bogus address
       drm/xe: Don't restart parallel queues multiple times on GT reset

Shuicheng Lin (2):
       drm/xe: Enlarge the invalidation timeout from 150 to 500
       drm/xe: Handle unreliable MMIO reads during forcewake

  drivers/gpu/drm/xe/xe_device.c     |  2 +-
  drivers/gpu/drm/xe/xe_force_wake.c | 12 +++++++++---
  drivers/gpu/drm/xe/xe_guc_ct.c     | 18 ++++++++++++++++++
  drivers/gpu/drm/xe/xe_guc_submit.c | 14 ++++++++++++--
  drivers/gpu/drm/xe/xe_sync.c       |  3 ++-
  5 files changed, 42 insertions(+), 7 deletions(-)
