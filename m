Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1684DB00EBD
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 00:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78BD010E981;
	Thu, 10 Jul 2025 22:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fiq+aop+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB2210E981;
 Thu, 10 Jul 2025 22:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752186823; x=1783722823;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=syjAumA+25E0DotkLihzzTU5AJnx+h5o6lBSX/XblAo=;
 b=fiq+aop+IaOZN1sBg9rGfh2auZJrFF9uxf/b/2+ZZkg16zK0s2NXs7HM
 D4gkyFqPv8Qb8eOpejFi6iBsEHfCM8Zfv86jEA4mHEamNkHVuksmJd2Nb
 TXyKswNWpaMKL/3xthUOg/WOJLFVnj17ns/BJlouhQMUglcAT3jirt6zz
 wt1iUydSdbxb4bZRmyUR2sh+FbaLpByUY7LN3yqhcOeYAFlrw1kOsVNXO
 nMQH2MxMfwnur+T03wJH3FlCkVEjWDGnPwTh44pFgmcecd7iEIw7Sk81Q
 gSFdtdvjMnT8xG8DK2l6x8KPcTxTAwSO01BoN9z1cjzsrLkt+o+QSE869 Q==;
X-CSE-ConnectionGUID: 4KUElHcvRYSPTtR3Bugc2w==
X-CSE-MsgGUID: yAYxsZdqQMCcZav8r0ZyRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54611044"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="54611044"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 15:33:42 -0700
X-CSE-ConnectionGUID: xQM9ryMERoepeJsD8UT7Wg==
X-CSE-MsgGUID: YlfnVISAT12BDzoBbyE1VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="161774595"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 15:33:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 15:33:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 15:33:25 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.75) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 15:33:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C9HPmP8xdC5TRDVBXMwrtoTBGGPRE/uVNkpYkbtxMb32MTPvEPqe90Vg4Bwm2Zm0FkKmlaUWo/+dLZ68Gti0Y8wNo3azaxEzyd7wbGtMfEzj//BI4R6u+ldQ1r0i5tPrH3Om3Q/qpuFUV5DvfhgFS0uueL4YFplxrJLzAbfv+KVvqRoPqbcl8dV2UUjqedoAEHZRUgdZ3Gv9onAsLlsWhxagZwIyw0Cbjd7anojYxtO3rC8BMXpIftaXp6ihn6GzzE6KgjjkARDlCIG0gxYtb5QlYOv4CYgrOyWc8FJZCrt6MOotsLhSLqjp6oND1rC9I/9NHIJrC39IMoetqTo7cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HW6Doy3AVrrAVPR7a/5vSCufUqzZf/1jGt/7Xr1+xMQ=;
 b=YPmwITY5fG/LPtXDklDFqj9sz/7i1DfvSZyA1GZukIjyNhZsCtKKiRz/sFZ1bW5tS27q2ylebfQITrQXddURzRIBqpAyUP+7xsKUrWa5pOc2BGmO2xR+jHOpe8Teccuh9z2+PzAHQtP5+khVO5uf/sQvJOh2OaoFqzCR3kU/yns7wkm9GdEo5h7W8/sZIwK7i532w9EOO0m2sqB9ODvjJX5S+F3oDJYbS1hcUDmlewbpNoIghJOsvVrO9CJG4tysxUC4Jjgd3ojBwsiXER90cZx+PQId4d9C70XeA9YwigGSoA+D1+pfojQbHcpJWxzHTozixCxFtaPzQR85uggLDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA0PR11MB7401.namprd11.prod.outlook.com (2603:10b6:208:433::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Thu, 10 Jul
 2025 22:32:32 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 22:32:31 +0000
Date: Thu, 10 Jul 2025 18:32:25 -0400
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
Message-ID: <aHA_eR0G7X2P6_ib@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR03CA0380.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::25) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA0PR11MB7401:EE_
X-MS-Office365-Filtering-Correlation-Id: f8a27abe-e11a-4092-b326-08ddc001a8a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t4vaxy5y3znpOhv4c3ChT0HzAOBnMTFSPmTZOQJGz+rzbQybU5cagx68L+i3?=
 =?us-ascii?Q?MgQ1ji2tyvMjUBF9m4rwtMWhw/yqpFIngBqCBNsUc5jTbtS8pgtfMubAblSt?=
 =?us-ascii?Q?rSHqEm6UM1S3OxOozm0JO1Hyk3cF7KTfEVKhuNTJMmrMpmPC6TJ8Uu6BHXIu?=
 =?us-ascii?Q?O8rSFVUoaTB3SMqfEcL/Hq/c591fy4RO01SnFUiFYcPB9v32UKec9lv2vQja?=
 =?us-ascii?Q?0JhlXwskuT+cqzGj4wtWvvyzr1+c1eq8sO1ncUS7HU5hXvs+dffohhdwSq5V?=
 =?us-ascii?Q?x5IWFpwGLCgNiMFTqQrMRpQ82g/8UblviPAVqWHvi8g9YHtPCmEmDXaeeaku?=
 =?us-ascii?Q?me47UxTj1mkUP5NfRb2Oy6plqb9O5IeeXfvs+tXSGt4OAnfNQ1Z0/uG4rZ3u?=
 =?us-ascii?Q?/He4fsB8oV6xeAwWZhRWouDgCYxGR6B+N39ZJgoAXY3+LXfa7bzxoQ1wM7mQ?=
 =?us-ascii?Q?JZBj48eHBWlATgWBcbxnFxVgANQ7Nv0QypPwz1pGj+W1jH0JhqOLx33r4Bk8?=
 =?us-ascii?Q?stDF7QjtT6BY+kDoZmYSNVVN/msrZKZiK4SMyon/TMQH1NljanPa4APy9oLC?=
 =?us-ascii?Q?HSlLmXQwL+SR2icuUHVs791a1DGXx++8CmjEOlMSGZoJYPIYwa9Ijwt99bcj?=
 =?us-ascii?Q?aA94RqTPju2dnTwx8FoNCVCFpu0T+of9Q4vadtI78i1W+VUZzVUp9lKkcR4s?=
 =?us-ascii?Q?FtGXh425xiRJk1y2h4dM3q91gcTh2Lcs6i1Is/OzAO6mm2UJzyfLTkOKqGSE?=
 =?us-ascii?Q?BCYTPQfWxuiTQNwIb6m8h99TCUO4z6u8GYhU2Ot3Cv3KbLKzPLjf/8426HeM?=
 =?us-ascii?Q?nfFL2dkvmhL2lKNhF780Y2buiHp/kG/EMIMnNKChBrR/6XDwPWNRYcwKrcRq?=
 =?us-ascii?Q?4imW3VJZszH8LDh+nHDg5MQhtB2RwNvpZZaj8Kr8LRcaVfc8uvIPaQah+8tR?=
 =?us-ascii?Q?LkQqW9B7a9DVezwPx2c0Gvi4Nx6Z4Xr32EA2tx6va8bNopDZq/94Hv0LKQ5S?=
 =?us-ascii?Q?UiMGDxLASV1B2WTxwoSmfcAQL8UPa2oAeFCVu+cpRMfz3aeSDJH28BR1q0my?=
 =?us-ascii?Q?rV5OFqZ5vDN0S/swXpkccMaJ8d4uBr1qyoOjtJQOPg94E4twLgCPajMXTL8K?=
 =?us-ascii?Q?UxGvSdHfomIZc1Agzzw57L+XXjDwCL85CX25ttGHkRyNSO4c8TAlxlfYrgA3?=
 =?us-ascii?Q?r0zswQXRL6fUPnhZKAsliRxhj4Pqq6aVz7OJQZvbYRne4t9iY983VnuddvSF?=
 =?us-ascii?Q?WGZAIjzL0obqL6RsAHMQvUjs48eSVCqei81zojfGPvWwhnaAeARopi/chBvs?=
 =?us-ascii?Q?4gcLeUvsByVF913DeW7E3ZrBy7hdZ2dkFFV8/rMHeKQT1zJgwD3hy/2KT6HS?=
 =?us-ascii?Q?ps/Rthw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?81PsoxxuwbAS/nBco1aENSOsazhTLAiTyO0tvxH+Zyb1XR0RF1rr9P0vXWuj?=
 =?us-ascii?Q?SEhGKUQ3D7z3jBybS96Fp7MqhPnqx4Lf5Vhsy1yzHmYgickvjMew+RAL8HHO?=
 =?us-ascii?Q?KPfteZ6wN9odwSMo9KoEDHKWxZqwtWnQDxC6itEHeETXnIYY4/PpYlzHw6it?=
 =?us-ascii?Q?SJz5Cm9RYSuwbohp9X37p/rTXplkXLfLNHofS+BuZGEOLs6scojyLvOdXFVl?=
 =?us-ascii?Q?2fwXuLnBc1voC3/+hrgPV8MpVbQ0AuWlL9QRGbk7LVoCHDTbtikjLNoLh+6W?=
 =?us-ascii?Q?JnHBmNHfP6XzK1PTGfLz88yiQ1+tIXpxW8764ET7yYYQQHdl9WcQH+ZewmtG?=
 =?us-ascii?Q?fQpePDSr4i1ddY8ErK+ZsOH1N5YtOR+PKSZnn6Gqvs9GTHY3LYBoN6RQPwuZ?=
 =?us-ascii?Q?y/pgI4Y0EfYjCKWcQnTJsqWLW1+yw2CBwflAcRyPKtUjpNbPovMvPhu2AYj4?=
 =?us-ascii?Q?Vt1Poz+yMciqoxF8MxMwZGODo2OmoW3JCm3VeUqYyFWd/My4oXZ2SoYtu6I1?=
 =?us-ascii?Q?O8nhPTFdJQqDqBTmPhjO4/tc5MiLaQi18bAOVGnAw2olhbLYLXNXE7w7VRjn?=
 =?us-ascii?Q?H0okDyRfB+U3ofR5VUdXRFW9xnKHnAzm/Ty43g35cJC0GWl+Mp6Erb9xS7a9?=
 =?us-ascii?Q?axdNYJGEyZc/0AMp8gj59KGobZDZuGdQkIPWxNNHZI1ioZDxEJqZnklELYnn?=
 =?us-ascii?Q?mR5ghn1qNdxq+6vZDEdtdUf7BjtEuIyd3jf9JrxakPriYGdKrm/GtyaMIMxN?=
 =?us-ascii?Q?DC42ZQx+SUaNz8GbNIy2LuROCgxccEYnQwbONZaxqrOn1map+VTkH7Kv36Mp?=
 =?us-ascii?Q?RsCOleQrQfmZX6t0EXeicy4AVdGQF6greLbE7OPWiZ22AzzkEyvUa4pdQ5S8?=
 =?us-ascii?Q?8gGeMCUm7VxfwKhfJSzd1t5eHx2DBtrrRgPLL9lGUh+n/wUCH48Po6d4QKDX?=
 =?us-ascii?Q?3sWHydUA5x8TF5gwUU47IEDE5oTM9FqoLp14FPJtIgvHKsY10OVZFDHLoIJd?=
 =?us-ascii?Q?N/x4JgL0Vp7c8xt8E9nctVCF3qO/QR69+oSNb/TfbcJkq658tUPb6pzI1oKR?=
 =?us-ascii?Q?lTzRKxN3orTkGvZmuweENDmjzVfJP9nc59ri4fqDVlOQO1OALD4knmcWcvqw?=
 =?us-ascii?Q?ydkDr/Vc/ngHEMzDSZTnMBL1AVdB5Zpt6lg8tHQm6uFXT2KTCqTdXqkNzIwf?=
 =?us-ascii?Q?nBRAl5h/EDfLt7NsQGeekiWtLkTqezeb+hLkPnLKd6IiH+Ep+14OcsZa6BYA?=
 =?us-ascii?Q?Fi0y8aTD7ZWEsepDJi/Zybb+HYyDk4Ovg+NNadepYfc8UhwNlZo42t75KHWe?=
 =?us-ascii?Q?r3GrzDXZYBMlzJ+gD0LYMmYgOQ15Oom1Ip7Chw3DuT5xzEU0VpY3Le5OZaH+?=
 =?us-ascii?Q?hxQgHMu2kPX6paODrbAwQCdZatsTtdvznJ74qc2POWqLyd1H+aA5YkW6OqBi?=
 =?us-ascii?Q?PltPx62rlOnDJzYSHgCJKQxD+2FUhBhebYvowQjUe9QIVvSLFzD++eRnHOlW?=
 =?us-ascii?Q?+nmSHKM73ndZBqNgzO6Is1QfP+v84eQhirXWZQNsQHpEs3pwNN/PaWvgT63z?=
 =?us-ascii?Q?YJHNClLLdXN9UQHp+v4qcZ/jFZkM7aM7AhKSPBk4toxEZWLBJq71YI4sEeZd?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8a27abe-e11a-4092-b326-08ddc001a8a1
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 22:32:31.5005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: goEYwoRdHTsHjLjYuGm8W08bs0z/sAMLrFB4YB7UsVkWykM+4UJSaAJzE0SH64e85yRDM3iclgnb2BXgebYeyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7401
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

Here goes the drm-intel-fixes of this week as I'm covering for Joonas here.

Also, only the single DSI fix from Hans.

Thanks,
Rodrigo.

drm-intel-fixes-2025-07-10:
Short summary of fixes:
- DSI panel's version 2 mipi-sequences fix (Hans)
The following changes since commit d7b8f8e20813f0179d8ef519541a3527e7661d3a:

  Linux 6.16-rc5 (2025-07-06 14:10:26 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-07-10

for you to fetch changes up to e778689390c71462a099b5d6e56d71c316486184:

  drm/i915/bios: Apply vlv_fixup_mipi_sequences() to v2 mipi-sequences too (2025-07-10 11:35:20 -0400)

----------------------------------------------------------------
Short summary of fixes:
- DSI panel's version 2 mipi-sequences fix (Hans)

----------------------------------------------------------------
Hans de Goede (1):
      drm/i915/bios: Apply vlv_fixup_mipi_sequences() to v2 mipi-sequences too

 drivers/gpu/drm/i915/display/intel_bios.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
