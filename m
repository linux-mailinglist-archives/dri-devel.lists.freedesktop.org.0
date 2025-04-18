Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E20A5A931A1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 07:43:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9C010E1F9;
	Fri, 18 Apr 2025 05:43:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KDINgeIp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A57910E074;
 Fri, 18 Apr 2025 05:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744955015; x=1776491015;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=b8gcj2FP5jfpdsGgCzoj3heJgJIJd+Z6uyQbxmaJdMs=;
 b=KDINgeIpFE1Sx9Lb4u7ORy9tT1tjs/O243cP2ZOEoGEws0pi20pkeQKq
 OWi2KLl9X0BsBPBRYgAoYEy3gdwytRPTgTWxy3ATCEeVGfJYwk5hZEHNI
 p7xdgxEEC2wx4rszzh+s6OGnC77SiQG7UXlveCprpW49hoLBcoxHex7BY
 I07kGOhe3OWaKZscuE58/aBcYSW1SwbE5U7FckHNTr10neUJZttZrFNfU
 N0oBxSgarQGuSn+k/jRUK+MUc7wdTwy1D1MvfBcpJm7Zrqvh5oodYugX2
 B3vsD4SgC9zOOmHKv1AqMDUc53GKQpkVd7Yp9afm2u1FwSSRT2wRhwr5m g==;
X-CSE-ConnectionGUID: KCgcq73CQQaAsQYYNK+2bg==
X-CSE-MsgGUID: vwv47ilpTtSC2v/tjuhTMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="45815922"
X-IronPort-AV: E=Sophos;i="6.15,221,1739865600"; d="scan'208";a="45815922"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 22:43:33 -0700
X-CSE-ConnectionGUID: Oq94/S8BQxS4SueAYfXa3Q==
X-CSE-MsgGUID: /XRc7D0HRt+BYkZ02brW3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,221,1739865600"; d="scan'208";a="135848620"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 22:43:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 22:43:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 22:43:32 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 22:43:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJC+DOJIhwIoidpkVluc/CgnaYKnqehdQNmk4H+KTx47+6s+hgcMLU+sV6J13bs5SPUVpfZGqFiRAw9tsc7YMCg/OYWTN4/yi82A+HynfPmv1puZyy0cQSzmujzheVmBWDqabBxtoVuNAxmsoJ7ZjCFFLsFGUnc5givy7CaPtQmFqZK9+m0KzkrfiaEyrg8ZF0jo1zvC3rLwR9EIQQinL+nYTjwR/KZP9nPL5CPwUF09ezCKrFbWpF0DDKsgQa5hlzqQDHBuZHid7kPHpESpBtjnfwaE6oFqM28IG+bn3GrTqz42APXmYXVBkbMF9/ASPQXyTnyzCvFcpQFh5/WJsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHD4sE6Pzbt6jB7bspjKTSOxx+2tXfYju0mMSNlVhfE=;
 b=ZOUPk9rkmRLB2rVo2kdpDGyYAdFvAhosdS5GS/4HoZedxTuzkMZqsuLoBuHvU0R5zEKnoWELWKrQtZ3rbBegh2HfOCegVx7707ZsEtOo8pBooF3umCZVzy7lKXTQMotSpeDro2FK5Oq5BSeOQWUAWvo6sQohyIiOY1r/kVkxHSP0ULmXDZ0H+SizKHpgoE204McklgYexti2dt9LRBv2VJU0yhPQAKOAq1ib6yoshtM/xGUFrwj6wXB9Gd3Ad6HIZK68e3bOfmKLCUdcNKcgYCiu6r5suRd1bU4XQkIWxvSFpUkGJfEODF3TWvF/JKrI1gfc25iqkBU6OUe0Y91ugQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB7252.namprd11.prod.outlook.com (2603:10b6:610:144::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Fri, 18 Apr
 2025 05:43:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 05:43:26 +0000
Date: Fri, 18 Apr 2025 00:43:19 -0500
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
Message-ID: <ndinq644zenywaaycxyfqqivsb2xer4z7err3dlpalbz33jfkm@ttabzsg6wnet>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
X-ClientProxiedBy: MW2PR16CA0059.namprd16.prod.outlook.com
 (2603:10b6:907:1::36) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB7252:EE_
X-MS-Office365-Filtering-Correlation-Id: 13dacbd5-a234-4e03-bf87-08dd7e3bf0e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cC2rD9I0JzVOct3+Q/BMue036+SVQXPXBtcHOBHzrJ2l2Mx2jdeNLm5lRf53?=
 =?us-ascii?Q?vne0WMCkP/HRKXVW68BQiZvka01DuvjDmod6b4/2ChoQU5GmcCePeXVMC+zz?=
 =?us-ascii?Q?FE5RXcgg2bj5R4OiUvGFVQ6MM8PECrD/n4KtOCQIJtJk/j8VhuChAWp9Z38D?=
 =?us-ascii?Q?0nv9GbuSJjRIBFVntpjotRhTg3nOPTn9xgFvjAPqJYB105z/QGx9f1cNy+gn?=
 =?us-ascii?Q?ZfEYHsS2rTl8A4VNJT7/4O3K1SJ1kNdTPhzog/ACi4/COFxN/jLOFumUauqC?=
 =?us-ascii?Q?/Ixq9YPDdKw3+oTGyQ4cu6kCIg3PpsI6/sJb15DOErsyqMl+cEn+4ccskzjr?=
 =?us-ascii?Q?x3vJYg1EkY/T0EufP7rHytAiXGYP/gaCyy+Y7T1anVGdQVJJgAkOGnAe5o4w?=
 =?us-ascii?Q?8Z29JMXz8h97zMPobzKhXGJUUffz/mIobnzbhASugo9Z+ibS1EZsRNvF3rK6?=
 =?us-ascii?Q?x+7np+aU0Y/1me5gbIeTI9chC6VrwuZ1dX08XblJGWid6Wqinapa6UmvMdvS?=
 =?us-ascii?Q?5icZ5Z+gXyQIuNnX4efvhoxKFJyfkqf28VJ8AOC6v7ejn8/6H1Bs0JyHR+QY?=
 =?us-ascii?Q?fU7ctyxFAUujkJiWwprqTcFlHjrr72vS+u2pV8zDkCIjVL8BdqAwMNNQ7OrT?=
 =?us-ascii?Q?MafmSqSOPX30BrQhIiZLzgZGZKhN3V7XZnKInAxJr/pp5QMqhYmKr0FEVjhT?=
 =?us-ascii?Q?sWeaoNaYS+aTVZn1UVvpoFroV2Z+neZ6A6zat/s85BiTtyv61Zzo0wnxbAKF?=
 =?us-ascii?Q?V+1V/XHrMl1Y7/qynfFlU6IlQRvblMEgrpC1kwl4trVNrvoGAAK+0xFZgWUT?=
 =?us-ascii?Q?YB5zyHt2OyDy0KgnWDvbslzGOjGU3jg1ZB0N9Vdv7GrlXzbCJGXdbZ77yFo9?=
 =?us-ascii?Q?LutImn4r5coluMf/VyEvxHOCri1FOINIvIto9FkAPdEw+9vhsZcCetPECF+O?=
 =?us-ascii?Q?JLWF3ezI5393xTcjDK33PZkKp1yC8ZDFA91Mh6lg1i9E5U77fs9K1SqS2O05?=
 =?us-ascii?Q?I29MnAsYRM0U8GD39lpMJnPGWdOZuewPyCtJE3nxoSUvIDXeEy55y4DBRPv5?=
 =?us-ascii?Q?Ln+6FaNdEyA0y+/QrLpJcnlrrf6iLMWk8eJ2PvfaWNK5rfadT7Ena7axx25t?=
 =?us-ascii?Q?p3sNXaCARXXIxLQ9RUnhbi1inG/8wFfIl/FKIA2fra74ncF45/z9h9urK8vq?=
 =?us-ascii?Q?h1tMerbmwCPr8e33n9a2c42TTF6XNUGgcwWTA5OVaBtzxaGzBZzoUJrVOEqP?=
 =?us-ascii?Q?o2Ec4og4oX81H0TK+GVx0euaTJqD6VXECyMVSB2Q4vv2FkxH3b/ZouyX0HdK?=
 =?us-ascii?Q?GboQoNmAqnskGoQLX3TDWVXzgxJL3WwxsG8ocwUUcXmdXyy7LTZAcCr2hnDx?=
 =?us-ascii?Q?GGgnzTc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Pu8iMN0Wctehhcl8AQ/gjIuFwkDEktRYRmsdzV00ZQ5CGPiWmxTz++eR6tHA?=
 =?us-ascii?Q?Ui+KatKGx8nKzCp/iX31STMe+2maQYW4rEkjWp6qsYimju2XMdWx4gAr1gyH?=
 =?us-ascii?Q?es5pMsoAyDKW/H1BD7sFYfYZpkW43rLIB7iarF4ovgcdRdDO89k2Y9W3OgDD?=
 =?us-ascii?Q?vHhMKnsSCtx7AsnkLrKazOynxevnQGRRZo1c6p1TwGcrS7+LHf7XF9F4F2sJ?=
 =?us-ascii?Q?zOwL4hT6p1uunSRL30xJSpJsTZALOM5g1mdE0Rs7Ktd9x/UlPfQYE7PjHBue?=
 =?us-ascii?Q?IbGOsCYae6PKXxEUefdj7q3m2pkU4Y0UaamHzfBq07iWlwr6yF4/7/WBykBk?=
 =?us-ascii?Q?OvWuP/bi/Yc2Rq5kypAm9ZGbxZ5Ep8eSaJ92o35vZkGxiIqQzU6bkNx/+Qt2?=
 =?us-ascii?Q?6iJZ/ctCRFJH8KBSgC+OlUyS+pys09SXvbvgD4aR4dH13kFYnmXzOKJmne3A?=
 =?us-ascii?Q?Ue0rDRG3WyCXrLcQWRjQaRjoTvmBheGBVakmLafn1RrTUyv6GKw634eqrQcF?=
 =?us-ascii?Q?9K9lM7F/USPWVtIhOUdyBed7KXTCPWUJKlgdEU8GlLmTy9itnndOdX96c5LD?=
 =?us-ascii?Q?dQbgXPzq76SxL7CqRKKvv6fM87NrCbYMQX+aOfN4aiwq/p27MaAxc09BIIMd?=
 =?us-ascii?Q?u7BmsJzVttaGOlF1iPcBZs2FV8eZgEo8xBCqds5J/aL0V2FkZYJdj62cfWya?=
 =?us-ascii?Q?zDXCtJW022r+Q0/zDhZcmhbGFkUuewcK9EbN5VWhhwPGbXmEerP9M4mhoYkp?=
 =?us-ascii?Q?jPmuP+zzMVFQdCq+UjXgfAVg1pH5BYetWBWzmx4IrGiGbcErVUmOsAZcQb/F?=
 =?us-ascii?Q?hfVgmBJ0H+SIeWwmsc8v168BfLlKEs4BQQYMcFlP9C6BKhVPItaKUSVPw1H0?=
 =?us-ascii?Q?F6Za6WVSCAFc3w1cdQje9e41t/foHqjV8ApLCYzSrWpa3i20A/DXJjxGEkmF?=
 =?us-ascii?Q?6ZftIt642MGpAjaA9XwCWSE1IIa9v+O1WwUnsHUYyWRVV6kHTTIBHr+pADRA?=
 =?us-ascii?Q?gG+OMIAnZmjcpNZ8i2e1kHsWDVrt2aAZuK1N8+B0HSqimcAIS4b8w9FpJ5/p?=
 =?us-ascii?Q?6HScfdNVFoa1WTSzxZeZc3eAyZpQKt47x2B2dH6dBgzTHodlKK5VkpAdrGiP?=
 =?us-ascii?Q?KSE8c8HDaBtM3YGsO/UnkJGnJCGvR7i31d9oWaT9XDfO4WwGxSc2OGiAs08i?=
 =?us-ascii?Q?bSFQ/hHy5m6b4x2p9m1pmhq59UGEsVzAYRV1owPG2VIcFIzij2wQIKmJp7Ky?=
 =?us-ascii?Q?sN4Cd7U+0H19YRVFXdhqAu6iVH9yzfXwN5Ep6XrPTyM8ReDs6ejPapXPW7BM?=
 =?us-ascii?Q?NjaZzk2DhScqoq6C8Mc8XdtNuy1G9pmd1nSB7/m7uNNYA3wrm+Pl1F4ascQU?=
 =?us-ascii?Q?rITJrvO2oAAtQ4PRHHXgc+TjFx66O6Wth827vgjJwX0x28+9fLGKgSE0evV6?=
 =?us-ascii?Q?cwDcDPYpsG2unEXDOYhgniwiUXRRnWSL+ECUgG+/NYE+tHMo8hFrhpDv0pK4?=
 =?us-ascii?Q?Rm0Axq3f4GeKZinYBAsGrG9NcBFLZl/T5LZMcgVk9d8D3WApeGhWW3xxAO55?=
 =?us-ascii?Q?GBrFMLqxyspuI2h2dDzOlcRYh7OaaIGNEQJAHS9s5zY+xk1Z+mJiTWL5pkJA?=
 =?us-ascii?Q?9g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13dacbd5-a234-4e03-bf87-08dd7e3bf0e9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 05:43:26.8413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s2v5ti93w5XVYtHggB69vuhgIDlvq4JmBGcCEoVss1SOuKy62RbueJyDEa/FkGqsgJj+1iqY7utphoIwZUtSoEHlpSOFELEJoChQKjwhct8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7252
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

A few fixes for 6.15-rc3. Nothing really special.

drm-xe-fixes-2025-04-18:
Driver Changes:
- Fix LRC address being written too late for GuC
- Fix notifier vs folio deadlock
- Fix race betwen dma_buf unmap and vram eviction
- Fix debugfs handling PXP terminations unconditionally

Thanks,
Lucas De Marchi

The following changes since commit 8ffd015db85fea3e15a77027fda6c02ced4d2444:

   Linux 6.15-rc2 (2025-04-13 11:54:49 -0700)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-04-18

for you to fetch changes up to 78600df8f593407a3df2d6c48c35d0ad203d7fb4:

   drm/xe/pxp: do not queue unneeded terminations from debugfs (2025-04-17 18:53:38 -0700)

----------------------------------------------------------------
Driver Changes:
- Fix LRC address being written too late for GuC
- Fix notifier vs folio deadlock
- Fix race betwen dma_buf unmap and vram eviction
- Fix debugfs handling PXP terminations unconditionally

----------------------------------------------------------------
Daniele Ceraolo Spurio (1):
       drm/xe/pxp: do not queue unneeded terminations from debugfs

Lucas De Marchi (1):
       drm/xe: Set LRC addresses before guc load

Matthew Auld (2):
       drm/xe/userptr: fix notifier vs folio deadlock
       drm/xe/dma_buf: stop relying on placement in unmap

  drivers/gpu/drm/xe/xe_dma_buf.c     |  5 +--
  drivers/gpu/drm/xe/xe_guc_ads.c     | 75 ++++++++++++++++++++++---------------
  drivers/gpu/drm/xe/xe_hmm.c         | 24 ------------
  drivers/gpu/drm/xe/xe_pxp_debugfs.c | 13 ++++++-
  4 files changed, 57 insertions(+), 60 deletions(-)
