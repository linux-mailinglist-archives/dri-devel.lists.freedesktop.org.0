Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC47B9F67B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 15:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A4010E912;
	Thu, 25 Sep 2025 13:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="moTA4yMi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E811E10E912;
 Thu, 25 Sep 2025 13:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758805536; x=1790341536;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=zGFdlgLE6EvodaH+Z9n4aIbkTSvzNJ34jFKdgNrgGQY=;
 b=moTA4yMiYT7bem9bVeBf1pzL87FYYJV71BbT0SwnxUP1PV7FnL0jG1bH
 Fg2ZDemSZSn0tM289XKr2jxDWhk5tF6ip5oHJDIM/kunnNANO7yYBzLuY
 kboj9Jh4o4OVaddwrRNe/UiLuuZUY3s93FS10lS2pIn4bX10VwBuPvfVx
 QvGqOyuite/KPfbQ4Z85UaZmipFEQLs1pJwftfCqLgMtnzpQhUl+89YTu
 jR9QsFnQDsN2NxM1fMN1uNdIPlJwsLz8IqB4AnT6nub1th3guRXdsUdrb
 McWDiRHwjlBAxyPozfuNbLO6HYAd4qzQLJWL4vNXGgiabXt2rvpScLlKV w==;
X-CSE-ConnectionGUID: HAusuwSqS0OrLqZykrUwfg==
X-CSE-MsgGUID: ZaW9yqnkRkaUaN2aPOGdbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="48687289"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="48687289"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 06:05:35 -0700
X-CSE-ConnectionGUID: yBjUYEu1SLGZjhQ5c/RkQg==
X-CSE-MsgGUID: hqMJDm4TS+msOnGqXPRvYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="176464147"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 06:05:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 06:05:33 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 25 Sep 2025 06:05:33 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.42) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 06:05:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bBdz4qw9qmU6Zca33+8RM6t0EdVG05AsVD3A7vwJ7Z6Iy94Rq7xuFx86PBBgviou7m9nM8RoRtafaPLXbThoo/SqOJLJo5utN2ST9W9wnKEmOGvkd6NnpZj+7FgMQuNoVjdoCkhmMlHngS590ljnWgFnvn41cmkjOtnVITddwXVYcC/F933xwsnaMjLbVStqd6lvSpJwMX+/9GBesMsbo3SgAQRD+BI4Fjxw41BQPxDiB2NxI5/M0mj+OSz6O9GdvT8M900tdoEFrnpACs+AmSr+LI2oX2VLv667MFKeC06iY2qFwhmWauTaLfh16+ASAZimKBfwva8vx0Oo/toMwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUDMUAarqP6lSbzCcQ1MJWGRKgMPM8QU0LcW5dY46tw=;
 b=MyWG8Wo+8LkY3S5H1hwYDUpkBu6KXb+AFhijnu+xoS+AwmI80tBUBalBOgLWOD0eSDGFCS2Z632ZMNYbYOZDRiRqnmGMPcOAzxmnKbFPUCjZVAs6BYZl21FHbfStOuf1I1bzhiwryeLnryXOFsF5/jTauw9U+HIIybEN6fhUZpjHMgnGzHvwU/R1lPaDVQ0lULut/k7oem3xXd0i69pXkJRm8wgDnzsD209UuZjeAH/nUUBKMGatxaaxRRoH79RmymDtmZJ/W29xGRsRxS0NckRFDYQ9YXpzWOC/6+Kx0ov6QfiM0+7/EcLWTvMNUw72uOv0OZHwBIelUTKQ2nhhgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB7830.namprd11.prod.outlook.com (2603:10b6:8:f2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 13:05:31 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 13:05:31 +0000
Date: Thu, 25 Sep 2025 09:05:26 -0400
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
Subject: [PULL] drm-xe-fixes
Message-ID: <aNU-FkJEcA3T4aDB@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:a03:74::26) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: b4af083e-9f31-4d9e-f027-08ddfc3434e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Iy6MRfottaMOYxtIDrmgnBFbwCk7wOyTHzX+yJQ8arJaLBWNlQA00t72Yp?=
 =?iso-8859-1?Q?k0gQz4Zhl9B+2SDK6VNvuqM0xQvfIA5MiXKQbp3ndXy9TXuL26JQjH/TdM?=
 =?iso-8859-1?Q?cmGdrhwtuLg2miTZorXN+Xj4P6UIA4oznS/AyFREVvPoFQUXAH26o9BZyI?=
 =?iso-8859-1?Q?sOx7hQbGroW4QfWmv5bdTrthjAsUVzX9q0aal+ktGdKvJjsQodWIrQbjVE?=
 =?iso-8859-1?Q?aMwwajDpprhvMPPDIFbek7FOxLabEfGFdvw787cW4PDUUuLMzUWUU3XubP?=
 =?iso-8859-1?Q?x2dgjTU9MGHvONIfAs/hRSpwU6gphlQaevKb3H67WMzt6B8qxLYTanNV4U?=
 =?iso-8859-1?Q?/T4/8NNvj/OUsIGxRH08LHZE7NJoKwG8+zS9y0n7LEYv7Xlt/0YymKPxfF?=
 =?iso-8859-1?Q?egYBXMY36IFc23MeKHAXNHT21mHzEbk6LeA/HJnE2hD9B77iDRJS7Nnc7N?=
 =?iso-8859-1?Q?4Zpm/ZS+B0oTa8J+RrevkYztHWNavJuKRJ+olr113tIyn7MoWCwsaJEzwN?=
 =?iso-8859-1?Q?4sV4ggh1aJVB5w0MBiRc/r1tpxYglfh1ujbiYMMceVipciI1VsUDhPmeC1?=
 =?iso-8859-1?Q?Zvlqhi2qnmW2THf91Kfvm49i9LraYqhF8VxFOUue/PYNtDUE6i7+e7nXoR?=
 =?iso-8859-1?Q?VSt4ZAo2XpAhfbw+StVzd/vV0xpKSEB3WSqQX2OVSsRrTWP5LwfOAtc0EX?=
 =?iso-8859-1?Q?HLBz7wUh8KbTpT7I2rU+oRysJvNztP9HQVTlQdJyT/AGBjyFhdhztrK788?=
 =?iso-8859-1?Q?DvHwCOvPKlDqid6I0GkWuOxtqFWhrX+JKm4G/6kSSJf23T/rN7fYy/DmZG?=
 =?iso-8859-1?Q?m8OctqeDSjlcra4cfi5Z909EhR/cxwaTqtYEna9FiG2a1FZIVv2KaU61Wm?=
 =?iso-8859-1?Q?Kri+xr2j4vx9kasXdinDdvOOdm1qiStZyIwdv1RDHk82L58wFFS13AonlG?=
 =?iso-8859-1?Q?57u+QQQfkL+3eEY2fiHR2WRtiLjmHKWsI3iypfghrU9ceJdZIkzsUI+62X?=
 =?iso-8859-1?Q?6/S4/ptwMDtHZXHvFHR4odLL1DxA8UD6H5/41Lut5v8srTw3pAwHgoY7a+?=
 =?iso-8859-1?Q?WDSy0y2LMfzRHEXrvtvmBvinbfnq63xADgUdWR++H4Zjy1DfyLep9BMCP6?=
 =?iso-8859-1?Q?1fODyGzw3XJmy2iEHjMReVxA4mJKhlFsmgmbiCrug199jQYGPHZRGVuwsl?=
 =?iso-8859-1?Q?VbuumxcQR9bDISo9Y3KHcBUWanUm0rEp+FB8xAQQ414YgbJCPm1QSmaMc7?=
 =?iso-8859-1?Q?tp7wi0CJvscDY/HNj1eKAtM4mNfQONDb4k90ThTjkw+m+M1jwEXKxqSf5v?=
 =?iso-8859-1?Q?CFO4sJwxpF3YEsE20CGKTc+ONuute0DoHR/4PHxe/DwukAb30VOQrOe2Se?=
 =?iso-8859-1?Q?nA4wGl0WJapqIXvuqOawNDLfx7LlnkqG/q+Ms1ejCBxPtlxhrl1qw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FHGjzSMreBKT3PqawjUw4fTNU+KeLd0EtHEX6jq2ETgV/yCRJFf0ErUu8l?=
 =?iso-8859-1?Q?HWGo41wG15DHEO9QCvJQ2olxg5BOinfkVXsTSRNbSpvFzqM7/MDJjkYEzy?=
 =?iso-8859-1?Q?uU5iCbCE/EQ0mYwRx2SUfQgCgREC6RTnorR8r3LuF4m1biQbpScFjFjEFm?=
 =?iso-8859-1?Q?5lQRpeLUIAqdTglOlvmoErslv3y4afh4TywqXeyxjO1Gl2KCuQNixPvs4C?=
 =?iso-8859-1?Q?zQ5iKdu0ML9ne0B6xxCnPCdy6EA8NS8ufW6fwLpP4l66s39KuXZpHBMs9+?=
 =?iso-8859-1?Q?D6O+efuEHzvAyvrIir+9PVcNqmPujL+uTGeEbIz99P3XCtwSdvhMICVu/4?=
 =?iso-8859-1?Q?5F1D8UX0X2W0mdFqMxCFljw7ha8irYHrHgbA6WhFO2dUMp9X58VqoZcjR7?=
 =?iso-8859-1?Q?iG2ULrKtIVJr1b8xaUvfHqUoeGtAGKRxR6+UtaZDiAuGH+YYShJgS6rNIH?=
 =?iso-8859-1?Q?JUVMxDVrYFElatPrFCgnMPoFPwf1zhNj/DbIwoPlAWp6w53FKTCtn7Fk8q?=
 =?iso-8859-1?Q?rG6bdrsfrBWGbreLB+VgvM94thbDEYklIi8rPOAkgXuN78DGKUOp8KGHuY?=
 =?iso-8859-1?Q?sUY+eucXxtX0B90rvmhOad9ZqOqcVIR6caF9/bqLdY8d+5KZqw+a8lGgnW?=
 =?iso-8859-1?Q?UHF/X2X2zQn5bzX8v0pdZyfVHSSZFCpTylmPJ+8Khmh49/FhZPFmu8P4Tn?=
 =?iso-8859-1?Q?e6V8gzOPf6H98InyQgnZbTqE3usztyC1SCQoZ2arAsi70kO7NBTOzEQiXh?=
 =?iso-8859-1?Q?ZViIDWsBuPVFoPs4EA6Du3uNu5yiH6QkHJbCgDSDQIK84bLy8nDH1MOdER?=
 =?iso-8859-1?Q?Er1WN+pEy4NuK930b751oV6PS9NXSfCY3SXG93ikbXjaCqZ9FsCYo3J0kt?=
 =?iso-8859-1?Q?g5pKyT6tG0/Y4YLU/dZ4QqlnMvvbrGoziMj/DPsgn6GvsitDXh6oBIl+ht?=
 =?iso-8859-1?Q?QE+NR5cYKL5PY6cLlEnp1RYBqG3OjXIRWL7vppMlVlDO2334QpJhjJ121t?=
 =?iso-8859-1?Q?yn6ERfd71aqNZqOTJXjgo6TU8uiELzIqgMUaC0psbioaa1wZpTuqpaQjtB?=
 =?iso-8859-1?Q?RPkGQbvBvxztfyA8j+dFvs4OmSyJBOzodWQbNPXGesa44JrIMYsHqxqDa9?=
 =?iso-8859-1?Q?pQbf0mOCs27698fXcveCgGvqt5GrZ3DlGzUK7yI4WaYqR+jyYmHgl0i9io?=
 =?iso-8859-1?Q?ckOqPR3Ydxm/HcxVzbK33tk7F/gtzIbGkqxV4SRn50XdSnjLBOdQejQPNT?=
 =?iso-8859-1?Q?x/oLlDKkSjXfdVacIq3dT+TjLClD0J4GSNQXfODcO8Or2Yk/YVD6OE13Zx?=
 =?iso-8859-1?Q?47aB7/8sfEEwv1WrUVFpRxMaBnI5txyq/JxDX3f4mLiiPVMm7FPTeOe7vD?=
 =?iso-8859-1?Q?Mk3VuNWUSLZhLaQrhFqRmvB1dcNNojCQRHi+moaSj2iTEgXGXUBpxVQ/zS?=
 =?iso-8859-1?Q?EDON5bPdbQvVQrlt9OYsgNYGJ28RbSyFMQO8vNstcGs5X5JUpKCJ+7531E?=
 =?iso-8859-1?Q?hSNGz5DLMC1D4SODxFIaTaCBQ6D6o7+gFckjQXpGS5nEuJN/fcH3kZo+Qo?=
 =?iso-8859-1?Q?MTJ7KGZT4v4eDx72wrpIhsz3fGCTDTBxr+sxPXFHgwrpUV86/XsXNreXB2?=
 =?iso-8859-1?Q?2wv1q1/m4nbGnul58ZdNVJepXTXFCZvpm3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4af083e-9f31-4d9e-f027-08ddfc3434e9
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 13:05:31.6068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gxlIqZTvl6poYaFsBf8MeyjGkLn+VTUyh51W/2glHI0++o1rEgBLk/afYZPf8kP5NJIw80xtMAquOa3w2WPHAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7830
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

Here goes our drm-xe-fixes PR for this week.
Nothing extraordinary. A quiet week in fixes.

Thanks,
Rodrigo.

drm-xe-fixes-2025-09-25:
- Don't expose sysfs attributes not applicable for VFs (Michal)
- Fix build with CONFIG_MODULES=n (Lucas)
- Don't copy pinned kernel bos twice on suspend (Thomas)
The following changes since commit 07e27ad16399afcd693be20211b0dfae63e0615f:

  Linux 6.17-rc7 (2025-09-21 15:08:52 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-09-25

for you to fetch changes up to 77c8ede611c6a70a95f7b15648551d0121b40d6c:

  drm/xe: Don't copy pinned kernel bos twice on suspend (2025-09-22 12:13:18 -0400)

----------------------------------------------------------------
- Don't expose sysfs attributes not applicable for VFs (Michal)
- Fix build with CONFIG_MODULES=n (Lucas)
- Don't copy pinned kernel bos twice on suspend (Thomas)

----------------------------------------------------------------
Lucas De Marchi (1):
      drm/xe: Fix build with CONFIG_MODULES=n

Michal Wajdeczko (1):
      drm/xe/vf: Don't expose sysfs attributes not applicable for VFs

Thomas Hellström (1):
      drm/xe: Don't copy pinned kernel bos twice on suspend

 drivers/gpu/drm/xe/xe_bo_evict.c     | 4 ++--
 drivers/gpu/drm/xe/xe_configfs.c     | 2 +-
 drivers/gpu/drm/xe/xe_device_sysfs.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
