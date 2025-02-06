Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D381A2AACE
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 15:11:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF2110E868;
	Thu,  6 Feb 2025 14:11:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SvSrSc1/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046F610E859;
 Thu,  6 Feb 2025 14:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738851112; x=1770387112;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=uq2ufWZadLWDFL6cTdB0G2GKkBal/TLlFIXDn4kCG0o=;
 b=SvSrSc1/HnrRkxBPw9l0wTRI30phpdON9iEpwj3pp36z6B9zshRX4pTS
 K6L3lI2EZdVGf6Mw0Vm8SJ4/GBcz9sg3QqXYO8mHEuAEkuDkicLyO8DgQ
 2i3ew1y2D1O5ISij7QaZgdjOaS59pZPsqWuQSNH8RuImFZXYCSC56MR9a
 49Hot5JJ12phsjPKXmgiEVjGZUzvgYZ3bnNN8F3eJpMGuQ+bixcGM2aOu
 wuFzaMRj4rJOkq4DPHDGOEolLOjxr0QPlAzX1CZAd33nQIu5jAcbD2Jz8
 vBBGYHIB5n22e2ndzGMIyi/J74jS1KkEh6wUD7Ns81CZ1ciFkojkBABA+ A==;
X-CSE-ConnectionGUID: 7yEJk/aoRo6RJiGyc1n8DQ==
X-CSE-MsgGUID: 6IhO+5XoSN2FvwaA590I9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43378900"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="43378900"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 06:11:51 -0800
X-CSE-ConnectionGUID: CS+/g85lRXa68m2ZAaYQYQ==
X-CSE-MsgGUID: YhFYtr2/QduGJ7/7qixRmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134456218"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 06:11:50 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 06:11:50 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 06:11:50 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 06:11:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EiLAp0K2R0EcA8x+dUTpWUviD/7izRmxKmvv/RRfjHJ8Ni314QjcEQ08/Mpc+1LhxRIdMsj3i9ST1iaf/vZe/2/kAPapc9DdDuzrB1BfkomTgtvPD66D9izSNxC//P1DnzQyd9W5A1xXJNmIE7ZirdjQhF3y3rm0CibmLsr6NKM5nJKYr5E+bmVyWOe+M7npH5cK4CXJtrQsLDQPEzWcaXGBwJOPQZiL6kYWVgy4j4scFEFHU6C9UnESxpwAzsDTu7G/RT3acq87QhENhSKOlfEckpFgU0mWj8+a2pEg8aiL8KT58T5+SHA1FgUgoo4F+5M4aQzAGLUItpaXUzF/QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYrVOGJFiv2C9+pIucwheljX0UxC/scg6EVxXOEYCvY=;
 b=cSYSy4lMIxxThHuDxcLZVdQ3Z9fhxus++0tl/SdSTc/KzdCosp/6tVL9DPEmxjCBGz4U0VF+WRkgy0M8XV2wVCTVT1UmG3SG2l3tgJ6vKxnzvxjYtzV9fFJQaiMXKDY1dY2bp5SGlsZHdU/zRzvneZUgufPlC55V1cEdWAR6i6u3Ot4Ymq/1UdHvTxlPcrqempasTVenvw+7xNj2y6C5xAQqptvE1Dz5KjyukO2NLenqkjmroBOSfePFEQW2FUslMOmca0gEj0clz45AGwEB2qNv2MLuZr9mV8ZlWGSAcsQfgrqEZeV+JSz1O2An4Ldi+N8V2SULtLtvzNrspmMmHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by SA0PR11MB4765.namprd11.prod.outlook.com (2603:10b6:806:9b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 14:11:47 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8398.025; Thu, 6 Feb 2025
 14:11:47 +0000
Date: Thu, 6 Feb 2025 09:11:42 -0500
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
Message-ID: <Z6TDHpgI6dnOc0KI@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0090.namprd04.prod.outlook.com
 (2603:10b6:303:6b::35) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|SA0PR11MB4765:EE_
X-MS-Office365-Filtering-Correlation-Id: ea869ed8-973c-4192-ae32-08dd46b8316a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?z6FWejbt2EsSRYEGfqTjOpGGs5vS+cm3OBRYrYbjoFL6mc3rHnHiSS4I0M?=
 =?iso-8859-1?Q?3PKThV2SkTNMmNrgi6GM/eRXYVqc5XMM9ZK0XQD2penIMTAVm2EcsJDfK3?=
 =?iso-8859-1?Q?gJ3PIPqZHEYGyY+xjKiZaVBuUkuyXAljHU3BhNYJMy4NBW5UuXHTZaY/oP?=
 =?iso-8859-1?Q?CiL2t8f5kYnc+pmJLxQV3GCIbChYHL/CazVNJ7K0YFwlWW1kg2+sRjY7nF?=
 =?iso-8859-1?Q?YH1BVe7Yx+iMwj4G+hI19D+AqHtTyCWZOzxkpqufTvgUR1iH6uJdf8Mi9B?=
 =?iso-8859-1?Q?/NmiY5eiRFpTIo74RZIUPNElnv1MJPAxRz2aPE8RAqGcHccZerP7FHYRK8?=
 =?iso-8859-1?Q?A5pQ0kuKKWQHtfGKAyMaDrpYaIrJrbDZ99OzQvkquvfgIhbetUB5dYwBRi?=
 =?iso-8859-1?Q?2f4MTa0Wa/r88kbVxrRNQwOafDQ6alkgwZ+PlEZbepJxaCCwqZR0Azsxkc?=
 =?iso-8859-1?Q?hqwjvXe5dVLcF8W3ARpvlV+IrWLz52e1dFSqpE+382B6enKLkX4WHk7XtW?=
 =?iso-8859-1?Q?+K7MhUYbrr3lAesuD8fOKB70lnQdKKC9pyq847gJtu3DV9jm9q236/lPqW?=
 =?iso-8859-1?Q?Ye5p6+I5eGA1/KpMcdXqNetvXq3+hbzV/InBPVkYWKzddWkF4qCBfzvPYO?=
 =?iso-8859-1?Q?lIk5P7OW7IBC5tvEqJSMa9XQRtBd/2YvfdeAJVYXleMQXYlHmmZnpxwPy4?=
 =?iso-8859-1?Q?uHYZELtmkvWamc6wMAkgyhJH5bjmM3J4vaLNmXAWeZPKuFxCMmR1GDF42k?=
 =?iso-8859-1?Q?8B0Sx2zNBV3LkgdPGyrrYYzrO67umsvxa93oVurwMcutuO16lBpzRKQcAD?=
 =?iso-8859-1?Q?keZvy/5u0FiSQsaXm4NsJ0FQdkBkyAxqysf1WOs7NG4kfJ5LwYjF4xl3HQ?=
 =?iso-8859-1?Q?cTEkPzkN7B5XfEhxKHKJj0jvceGFC+4s6R081CwD9FbwJS4lILSLCeQ9Me?=
 =?iso-8859-1?Q?jTKSZRf+dcdkMdagbhoEe3F7ve1wK5tJFXDK8W7jNZsBqcstlE6DzGiIbi?=
 =?iso-8859-1?Q?TtwjODg3/qOLmw00czYuRe4a5/oY7ASs8r6H+t18B6igr3xQ3XJM6yZJyY?=
 =?iso-8859-1?Q?BhhiABBak7cV4sI84JD480woKf6rF1cvB3CZ6rY1XUuY0RAwIc/+pc4I8a?=
 =?iso-8859-1?Q?lf3EDvM7HJlRHIRlX4fpYvigXKgmGpvLQhnoyQKGxMnwISzMN/S2Mez1p9?=
 =?iso-8859-1?Q?JW4WSXpXEwueyXHZLSx7aCbKRYNMTgIrvChw+aEQcMJSashS0dfk5whOl1?=
 =?iso-8859-1?Q?8bysYroRDObY2es6A38arJQUJh6r1pjKhjJlzau+cMyd+Y7T0mAZYS3u5m?=
 =?iso-8859-1?Q?6Kr6Q7xCxyrvHYNnrPooCdIdZak4r+lJAQeFq+3SghLp343rma9jNwRvjS?=
 =?iso-8859-1?Q?IKih1JVudP7eQJoFecsKZ6OeHexyPEMA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?WcDj9ZNVFoSzkVxPtjUo3X8CqQGedv7eD9amspp+XtkiZwPqYKrqooa0U4?=
 =?iso-8859-1?Q?oazniFgNQ9sd1Hwqx2IPgFCSzd7ikKMifsMjOv65PlElIQcY9PaPrOrvAP?=
 =?iso-8859-1?Q?wvduuWhJFJfSEjasMCL4i8QgkFq1P+2ilLSWf/pj4s6mAkcgiRvZkqILGC?=
 =?iso-8859-1?Q?qQGhagxMsPRwHDaRtP1pr8WEJCmTGQRcufMzvzZzEZ0RnLLSXdEh1nIRQc?=
 =?iso-8859-1?Q?jFzqEXM2U1rKkGIWLSt/C09MXIJ5iciI9p//1MmDwOBo+wHyb15CJeOTaK?=
 =?iso-8859-1?Q?0SIexflxa/J1Pa7SrJRYtJbzcQmMKowRfHpBkEjBXKTOACzH3GgT/9Rvhn?=
 =?iso-8859-1?Q?5Zx5PJJ2xiOm7DDXUUsWSlCHsSIF5CNA5m1S1l+ugrvr/o4MUHAaIZbvvU?=
 =?iso-8859-1?Q?MITC/BzJkuIyNvuKI0n77tPFoIBfEBEZhZ1QzT5CQuWnzFPHhkcy2PgD8y?=
 =?iso-8859-1?Q?ONr8eaZp+cO3cubvFU39XvMQOqkGyQ3qnkvrGj+tZ8hjKLVfTKR/3bvz1c?=
 =?iso-8859-1?Q?hyH2sKChxeQCHZdxJnIOrr7itbGJEscJmVEjLUIXcr4J5CxlCZuUCTZvUR?=
 =?iso-8859-1?Q?iEsfEWycmYRXS1o7nyBIEGV89/WBduffa8Tc2pb6EI8y8XzO3zXs329+8l?=
 =?iso-8859-1?Q?DdIEmKG3x1Z4bu7x9Xz7gz0+FUwiDS+2DUKeRrnzw23mTzn9nSRYMXWX07?=
 =?iso-8859-1?Q?cbACRLXcnTmaUvdWOAOw7P/MXS6pQ5j56cW8hb5ip6p5ziF71/0javi66g?=
 =?iso-8859-1?Q?KwPKVXWgQuv0xTAdGsbMWRg9wcccFDg9OCHqEeG0u3S2Otf2sId/MaNx2B?=
 =?iso-8859-1?Q?vmvJwdGmPciBwU872UhPH/F9FVd/JcpBnM98aBjPqhdRoPtg0tzf9XzTwO?=
 =?iso-8859-1?Q?ChTTkoS0QrVDEiFL4VKoAUi2sljVLH6e9YOi/STnpTPN7lsAmbYd7zhK3t?=
 =?iso-8859-1?Q?jOw06hVC1y3cl5wabgPdeRDv8WkdnBEnVMPV6JgUKa44QJKcSpYBRS+9Pb?=
 =?iso-8859-1?Q?WQVWCkfARnbpY8iFPrcvpzpn/1/o9y0krIJg6QsbWNpxp5Wjb+b5CnlToX?=
 =?iso-8859-1?Q?cum8tR1jTHaduUCatAUcjt2HghnSkF0309J1oKFzzMWEtVtOB5lyYjowWw?=
 =?iso-8859-1?Q?9c+8h2bL+jMdB/72elIIqwP/ByU2kBkZ8bM6HWE4+tghNcLUEqOYElF1VI?=
 =?iso-8859-1?Q?zyOBRbGb5+NwNFrvkU9Tuhf2SJ/3z1QhDv3jd3e5HesOEK/iA6A/s0GUu0?=
 =?iso-8859-1?Q?0f/pIVQUUtkqrGAdG+fEzEWdZavUeGsdmlPhx6eFtSz3waOum7Ftdburl4?=
 =?iso-8859-1?Q?fNnC/u8HUJO3F+Cf2bReOREO8mG8j9Reb8hqYdJEJatImSGxIURCBnxRWC?=
 =?iso-8859-1?Q?cvT5RG6PO+Xm3OKO4j1U4ufN0JU6mMDKHShS0TE5VIaIQVtoXVT/uAbuiY?=
 =?iso-8859-1?Q?9ZG3VYIWZ+DFjLy7t1Ozb45OtlIZRYRKoYY8gNeLbpY/PJSKx3J6ISAafK?=
 =?iso-8859-1?Q?nr+SCkh3McQ0q/ogDaXjyCkGJw7L3g4cOkYLnyb0WB4NU0WnrTqYzQpIKO?=
 =?iso-8859-1?Q?nU0FKKjwc8eybGMc/vc/ea+UkjIfWJM0YzZ0MW5o+xouyS057TXk+L4g5U?=
 =?iso-8859-1?Q?RhrnaczWft/idVU0OPQu0ynEuA5U0ZHvxsbce0pXCNuREUyAWOArZu6A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea869ed8-973c-4192-ae32-08dd46b8316a
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 14:11:47.5349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unHkbGOSaZeb9ekKFgMMctKAyIM1Gtf/IsskKSnJinlh8Pp/osZSm2k6Fh+MRWxehGc47SJDkLc2D3LpfbHUrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4765
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

Here goes the first i915 fixes towards 6.14.

It looks that our CI was dead for the last round, but I double
checked locally in both ADL-P and DG2 and everything is working fine.
In the last round the only addition was the Jani's DP fix, that
looks correct. So, let's move forward.

Thanks,
Rodrigo.

drm-intel-fixes-2025-02-06:
- Fix the build error with clamp after WARN_ON on gcc 13.x+ (Guenter)
- HDCP related fixes (Suraj)
- PMU fix zero delta busyness issue (Umesh)
- Fix page cleanup on DMA remap failure (Brian)
- Drop 64bpp YUV formats from ICL+ SDR planes (Ville)
- GuC log related fix (Daniele)
- DisplayPort related fixes (Ankit, Jani)
The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-02-06

for you to fetch changes up to 069504f1fcfa1532e4e221290df428b15bd9d284:

  drm/i915/dp: Fix potential infinite loop in 128b/132b SST (2025-02-05 14:42:42 -0500)

----------------------------------------------------------------
- Fix the build error with clamp after WARN_ON on gcc 13.x+ (Guenter)
- HDCP related fixes (Suraj)
- PMU fix zero delta busyness issue (Umesh)
- Fix page cleanup on DMA remap failure (Brian)
- Drop 64bpp YUV formats from ICL+ SDR planes (Ville)
- GuC log related fix (Daniele)
- DisplayPort related fixes (Ankit, Jani)

----------------------------------------------------------------
Ankit Nautiyal (2):
      drm/i915/dp: fix the Adaptive sync Operation mode for SDP
      drm/i915/dp: Return min bpc supported by source instead of 0

Brian Geffon (1):
      drm/i915: Fix page cleanup on DMA remap failure

Daniele Ceraolo Spurio (1):
      drm/i915/guc: Debug print LRC state entries only if the context is pinned

Guenter Roeck (1):
      drm/i915/backlight: Return immediately when scale() finds invalid parameters

Jani Nikula (2):
      drm/i915/dp: Iterate DSC BPP from high to low on all platforms
      drm/i915/dp: Fix potential infinite loop in 128b/132b SST

Suraj Kandpal (2):
      drm/i915/hdcp: Fix Repeater authentication during topology change
      drm/i915/hdcp: Use correct function to check if encoder is HDMI

Umesh Nerlige Ramappa (1):
      drm/i915/pmu: Fix zero delta busyness issue

Ville Syrjälä (1):
      drm/i915: Drop 64bpp YUV formats from ICL+ SDR planes

 drivers/gpu/drm/i915/display/intel_backlight.c     |  5 +--
 drivers/gpu/drm/i915/display/intel_dp.c            | 12 +++-----
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  4 +++
 drivers/gpu/drm/i915/display/intel_hdcp.c          | 15 ++++++++-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  4 ---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |  6 +---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  | 36 ++++++++++++++++++----
 7 files changed, 57 insertions(+), 25 deletions(-)
