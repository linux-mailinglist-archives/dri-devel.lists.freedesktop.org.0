Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B5BA484C0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 17:23:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F9610EB32;
	Thu, 27 Feb 2025 16:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nNyb5EPN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D32910EB32;
 Thu, 27 Feb 2025 16:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740673384; x=1772209384;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=yGi9mjzPSkMSpv0i9G5+JVCO5dn+MrS2qMRn2FriGPQ=;
 b=nNyb5EPN9Ci1fc+wSjdUoSXBBzrR7ZTcsspqHvnVUZHXfLuGh8I1uGFh
 3edRCI3hsvNTvvnzNc5I11xfOhcvZNXrUDOCDy+8x+XB6ylJP8o4978+z
 s0CTA+p6F1UIp/RuW3yz2YNd462/FpFOZ12d4Ls35Dy/ItqMRiT3DfZv3
 1IBftt6yVXIhMsZlID7nWnaXSM/zLuEqTXLm0AfRK9fYoJlJUnPCi3VYO
 1oYV2tOuPRPl97G6BCEInz+jBuGhDy/YRE+oIrhCWQNjv4hiyKe5DSABh
 zPmj/iCeulrYXByLTybA1V9QFEGoWFwgvRCLQNYPBpudJJtDIXfxIh5JD w==;
X-CSE-ConnectionGUID: 5EhLP37zTfmqkZNCMmgI2Q==
X-CSE-MsgGUID: mlshxFFBQUWxw2VE67q/HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="66945101"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="66945101"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 08:23:01 -0800
X-CSE-ConnectionGUID: WNTHvfXbQKOY0SZZMOjFfA==
X-CSE-MsgGUID: iyw+gasDS+q+xngqu9FtxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="122311358"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 08:23:01 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Feb 2025 08:22:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Feb 2025 08:22:58 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 08:22:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tb37vnbgEnRAUDXRPae9RVsI9wgii3hS4eQld6mQJDNIaSwyh2MOcZ+O5MhujtkWvactV/17MSRpYlhmLTgIhcPQpE2rnZtslFjmtmAoC6x5jke09/+yWTUfDrwTiysuCpwwxdpvZiFiEMnSfvL+7QL85+P0ffBfU+jG/AshPIJgQ7jzMO5McF40Gqe7JFczAiE5a2RDbkFlPahpm2aeHy6eSYG0eayaGpvuPQ3nzKHCQaGKvBj+YbSDyWjE3uk99qRJ0qhjChxlD1l6iWZupX6Rlrx+34YgLkEB+0MNX+79vr6I9OEdD8PJPcqXN0ub/Cg8GxTRzYfskC9cYzT9Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPO1W+V9zJd9sVdcW8DaesJwiueZ46vSxzAQmbeaJro=;
 b=Qj5WGN5kK/v55SBRL78BTS6r/9Bxq7PRhXRcn6+vmuQOZGUtxXVSkColinBvH95sW9nLhSmUFwXlgJluXIUIOO+TBfliSBShSDlDcBrzhfGIQPywnDjOmip6V/Qedq2M/LT0eZwuQbSXE8bnGy01lmlHVaP0Lc2gdv4Lk4jdRsHeJUhTCWSoYe31OMFSysL18c9krsEOpyP1x+emurOKLUtMDpwjBD2Hl5BATeYTvzccK0wlz5eCxxrsnX/8L/mCByNT4vLxalSvEA53yOR72eTJewGyXrgCTKTN95tJxD6UGi4J6yzteE5sFtDLmUrZmvsOSAm3WVSTpY5RJ2bJQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by PH7PR11MB7049.namprd11.prod.outlook.com (2603:10b6:510:20c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.21; Thu, 27 Feb
 2025 16:22:16 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 16:22:16 +0000
Date: Thu, 27 Feb 2025 11:22:11 -0500
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
Message-ID: <Z8CRM7XzlerbWSJy@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: MW4PR03CA0259.namprd03.prod.outlook.com
 (2603:10b6:303:b4::24) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|PH7PR11MB7049:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b0b80eb-38ca-4cb6-f05a-08dd574ae676
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0SXxIGND08om5aGNkq6apmz4rgi1UEcoLwi4WF8WiPZcBlLZc56+q/pNa9Si?=
 =?us-ascii?Q?SgfCCOvK3wmzVeuhiCGHeFLz5nd5PRV+gCOVRlHTeXNf6TZg+yDc/6vEF6Qz?=
 =?us-ascii?Q?3yZmupDGVXhJiP2XMbMyKlSql+E+shzloumGG+v0ej2baYx6E+FsU15TUI9m?=
 =?us-ascii?Q?YdFr7k0W2sSMuGVKgGTu47mJJsJ28rNlqbCVGOqMADZZ3bfJlo9PylCvkIpr?=
 =?us-ascii?Q?7jKKulOT3YTpNIiRtw0hx7HoqkS56QTEN45cctDJWCdyCf2plgvzo5fQTeqE?=
 =?us-ascii?Q?uQEbIR7OUMrtJhT8V30vnByUjG9MJXPvN72JVI4ZdjkkWNf0n5bevouuM0rd?=
 =?us-ascii?Q?YdCC0II7KBcnSZku2K6pz8SlYyiTKl8DaXzYkU0ureEsGXgRmlwDmInlVEqx?=
 =?us-ascii?Q?eMB/bv6nZ6WmM0cjQlTyffJyitSNR29GOk8IGzWQPqYlJPjRWqQp+fwVPyBT?=
 =?us-ascii?Q?Ji6aly7CfoOgq8F7KJcYtZXtunQBTwJghRHzvNBzns7s89PhgOJnMMebI2AV?=
 =?us-ascii?Q?1b6yVkAEKbuPLFNrNctzORq+/dcRs/ttEwhx66sW3W9FxVFzAhBNUSJY/PhQ?=
 =?us-ascii?Q?tJnWHlERFhTaCTxeO+GsimWpFBKgQDPlcPPH4bS9ZKUqh8+RUVz7x98QdaME?=
 =?us-ascii?Q?zBYt1q4W2s31M6lKu2ehaMiqUDH8RMlME0HwQI2xP0TVYbhZOMMeLoz70Lh2?=
 =?us-ascii?Q?7IIuy92LI/wofj7Riuz5wiQiKsC8MPNXuRgZN3VkjdKTzi8zZ68kRo7s0k4o?=
 =?us-ascii?Q?vuEepZYacuoEThIHopgvF3XCNuyN7fJoUGPAmgi2Bd1w/uDJ/Jx+vzw3GVUp?=
 =?us-ascii?Q?axyuul5sSkLlmQAvVfzJpdoxr+r7rPNtwCKyenzxpQE6TPLhdRBJ20LDUJnf?=
 =?us-ascii?Q?28YyV0om3pPz5VsHWTxjHgHXHq9cfrdrafxWaiI+gqjYkHBh+PPrJPQe4pOt?=
 =?us-ascii?Q?VqpXgLi0guN/tx+Rsji9Db9dMk1++H46ILFjy6gySxC+mbqwZLW3UxC7/2xo?=
 =?us-ascii?Q?gV5gOq5S15pRl7NsZM2FrGXwgqi8C1jNWPc4zCeVv6/sSFkdqh8aJ+LkqtS0?=
 =?us-ascii?Q?nltlTlbiThgVGPwHmsp7w2bMIQdkVZxB6yLnEkNGMu3tyJgQW4Fz1jmcdkDB?=
 =?us-ascii?Q?NG+7L7C4Sdatcg3fqG+7WUktaRU64rBzoG7AO7WBwpGc8jB082oN9BocgpE+?=
 =?us-ascii?Q?cL/RWG0Mg5SCZakLEri5MX9uRW0KD39Iud7pt1OdcZJRwGnq9iHT68Xy0lkJ?=
 =?us-ascii?Q?cukuddDJ12H2yOxdZqI5RqA2dSO8FFq7cJH4bIwkOwj0fz6noA0xShTzljTZ?=
 =?us-ascii?Q?e2E2TREIHliJt4MRVnnnE87iRzXkq4gesw9PZAe2ch90jg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u737yXEUGLP/Kypcajgz4t7PE5p+T1VOkPC7zdL/liZZrdTnp70TuDJeH2p6?=
 =?us-ascii?Q?MW4dTfYMN87I+ubUO+gQ9g05UHId2UNvBOjDvmKZgQ50L/9T6+z7k4GjUa7k?=
 =?us-ascii?Q?qogzsBJ/rHUmGs7HS0PSn7BQFv4JAAX33sVbAvr6AWjWBVEicQzaru3QkNa4?=
 =?us-ascii?Q?6kGTaUpN7EEbu5awqJ21a6dwhXZ9J2VGaf9gQ2Aob7Q59gMGuCb5x3OYjitw?=
 =?us-ascii?Q?ySAXRM3kR4sddsFNY/RvDt25oS4fOdIfsSyIWX0+vprSEtmZ/76E8xELZWDB?=
 =?us-ascii?Q?zgxl5KwWymViiV/QScYQjY7cI6s7BJdl4dPR2qB0Z0nOSaOmFzQYqJaKuhJ7?=
 =?us-ascii?Q?hrlW0TvUBnK46S9l7Apmhnl67E7K7CN/2QKYj3XAhzrn9aIomuTwf3xzuPa4?=
 =?us-ascii?Q?fUsTgqf8ZUpcmqlc+zmxvqCesKeA0pDRcmH80qk8wYPHqT/mbL2P8XHACFgk?=
 =?us-ascii?Q?Nv2NXu+BjIlRpRrSE7Y8A+m5tIwtVmU5HL/pdk+gVQm6LS/3/Gx2Ec0pyfbB?=
 =?us-ascii?Q?gwCuHYrinm6NdW75/sg8+8g4LKCWKjwGxLwoBaDrcUeuNzhcH8Up/2OfxmGS?=
 =?us-ascii?Q?VNQJ+7zSB+SPz6ld3FDEA1NqIsYCfZ9vcdSuOOLiZrVwguSZJsbzm+W8hbk6?=
 =?us-ascii?Q?dEkX2GFNLWoZf59ZFXTakh7j2ZQF+3L+wEKX8N64QXe3vFYvz8uXm8i3KeAY?=
 =?us-ascii?Q?/X8TCRgb6FfAFxT8DzcN2cMf16bW6hfGoruPWYc9LR/2CJWNfVq8UF/lBoWq?=
 =?us-ascii?Q?W+6p9zxHp1i7slOjqYN+L2FHc5DpGfM+KyZDDQsIiDZWhYeh4tb4EeIx/Dan?=
 =?us-ascii?Q?T66IpL8BNLMgEWvxVu4f3EUmAfa4tvd/4J5jpYHhkLd/EGoWpMtD0hucLvb3?=
 =?us-ascii?Q?OuH4p3XmdWxaY34KolsLuWGV/D2MJfgqi8bZDidUCK/qsLgxQxN4QG6P+8pd?=
 =?us-ascii?Q?LQ9Atw0bNSetgAG/u2bxpcT0BzREpaxRPjfT0i6JuFrcP1a6IwYAUpJRnQTv?=
 =?us-ascii?Q?ufgG829arJIJnRmxXDeFhH91puflAFIRaDN28PJwW6T+ij6Z//LTISV+xZmJ?=
 =?us-ascii?Q?O9EE0MVhQWfyYy7bKTS71dJ5LMprwOB6qI4Kid3Y1MAXHHo6xpxIUrj2u1cb?=
 =?us-ascii?Q?rQsKM80FBVKXot2kn4MKDnmA2/erlOOHe72rWjr0Kvk0fY7BZIPOitFhBcs8?=
 =?us-ascii?Q?REDA6Lmk6CZkiE57RiQkAwYZnUpI19VzWBWjFmWmYJbgBZwI6o0O2tnqZvPu?=
 =?us-ascii?Q?FdZhlKeriVW9SgbPRJvPp1ta0OCkr/rRbX8G4A/b6A2LNzDcy5WVpP8PmN6U?=
 =?us-ascii?Q?tjaKPLaQ7yajhVyWGaj3TBJ8ZdAII3DTSLYt1hAueWgyOR3cpGZ6vGfzCgBf?=
 =?us-ascii?Q?d+5uwIgwhcV4ZuC+e85+fdZ39YoezmHuxdMf2LBWOx8u2GmAhRSHi/GXx/DI?=
 =?us-ascii?Q?QnRO/yJUnYeeLb2X9b2oMQj4d3Kn8QY8X0aHEPvWhKhe2IjJAvTCEaa6sPan?=
 =?us-ascii?Q?SSCh2/cW9DFbEWNQUwUEZE3Etz361DL8vlImg/5tSnhVejbk2+BMVTdMsZu0?=
 =?us-ascii?Q?snRgIpo+nA5w7F/wySaaohtlI0sSERKBRYi7Iy6X1vgWx+BSlRkG2w3tbXC/?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b0b80eb-38ca-4cb6-f05a-08dd574ae676
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 16:22:16.4829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +U6F+Cj6AxEaDoIrwju0PJsGClkYZF59W1G406YENRESOW8DmlqQ1u11F7jHyUqyNUbfseEqrx+ZEknmnZQE6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7049
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

Here goes our only i915 fix for this round.

Thanks,
Rodrigo.

drm-intel-fixes-2025-02-27:
- Fix encoder HW state readout for DP UHBR MST (Imre)
The following changes since commit d082ecbc71e9e0bf49883ee4afd435a77a5101b6:

  Linux 6.14-rc4 (2025-02-23 12:32:57 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-02-27

for you to fetch changes up to 16fef33fdb1e2269c20697d9b61ae8022bc92665:

  drm/i915/dp_mst: Fix encoder HW state readout for UHBR MST (2025-02-26 08:16:23 -0500)

----------------------------------------------------------------
- Fix encoder HW state readout for DP UHBR MST (Imre)

----------------------------------------------------------------
Imre Deak (1):
      drm/i915/dp_mst: Fix encoder HW state readout for UHBR MST

 drivers/gpu/drm/i915/display/intel_ddi.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
