Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF6EC2252B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 21:44:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B4010EA1A;
	Thu, 30 Oct 2025 20:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U3j+4ta5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2CD10E8E6;
 Thu, 30 Oct 2025 20:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761857083; x=1793393083;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=nHTLZ6NGKbZ9Qp+M5LLlWqB88SXJC0pfxgoGfVjunHo=;
 b=U3j+4ta5rViMQJa5lg9KBTqwsBA6e4sidpjtRdfIUhqPwPu85alHlSyr
 C9obwHxnedz3NSROM2eJrskKPHHQBMcq71RrzwQgrfTpspmeXwSvCBgSg
 tpUF38WMLXtWbEfMlpWU1ghk6HYlM+LOkMIRJsbZrQHvbaJvR8mO6hRYi
 ga/fOXD550jledRUGNmc4PwqIKsuSVdkcguqWqSmPQIawzMo0ey4I1iWi
 F5S3zuQGOvTBLxiU4sj3V6ibmnqbjDt0rv1qcqKWOE5osYFquFVme9pca
 D5jRi1oVV0a00Ko+FSnMWhbKDdaJ0ETVKnRRn1gz7u6eWV/KLmaFyoZSP A==;
X-CSE-ConnectionGUID: ONnb0okERWGD6Uo17lzRlw==
X-CSE-MsgGUID: O72LS6EoQKCAMAy2h+Ol+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="67665036"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="67665036"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:44:40 -0700
X-CSE-ConnectionGUID: zFLEFRuyTS2MJ6jIRz4CHQ==
X-CSE-MsgGUID: RF9eDFFCS2mgSIilRjvHpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185714183"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:44:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:44:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 13:44:39 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.16) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:44:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ke0LcpiMzU6Mdd//6r6pqPUzvfXNRbV+E2Ic3j0xJevQeQNgoNvP7+JODpy/AvqZLRnsh/vWdbtz8qyM15lDjMiSyhTe21FflRoTQgOE922GY5nqL1ocNWXiuhM3zeTynlLQhJkDAI1pI0rIvEi0/1SnZZb4DUnFCpsoKttD85F0UQwVFdWzuJB1z5FKtakZ6Ko/5KkXwgNFsClqNE/eBFHRJc66/EqucvsWr0/vkRqjw2VDGmtQPECtWuIekyX0gqx8jeTNP3KQ7y64asTcZV2MhFc0MXq8nTdLBEeMgllMBMW8MoNpDhAIn6mIWd94QwqCnPyo/gFVMhiKg59XMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7zOlb6xbQd0KnsRy/zdEq8bJjtegnt7cK/7gT8B+8D8=;
 b=jRqq8HINJpJ5Y2WacROOFD9Mcu5ZmUkKmdXDIzNJvqZ1+5xBYndAIxlzl9CbWmbbtUZixFMeNdp4sAjSQc7pXs7yHUzO/8vFRe8scRvA8z45Wo9qu4Yi6U3j/fzEtrpE05W+fJkw36uKJe1BMXkamGT1XdRqEKlAzL68ZCoDdh99NAt9VmlsYm/6lA/Q2pAoHtqOcitNVXEJwvx02VewaMR0VgxRHcYda3n5JiBDYkq9jNWLYRWFezwmRIRjUgeHb7BYKkv+9fAac9Hp+ASyyXRK5Uc1s3Bl7hPE4RuZukk8eL/+0yYQWOHgw1BNF+yy99plosXqNWII92tJY23nmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB7502.namprd11.prod.outlook.com (2603:10b6:a03:4d3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 20:44:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 20:44:36 +0000
Date: Thu, 30 Oct 2025 15:44:32 -0500
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
Message-ID: <o2b3lucyitafbbcd5bewpfqnslavtnnpc6ck4qatnou2wwukix@rz6seyfw75uy>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0218.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB7502:EE_
X-MS-Office365-Filtering-Correlation-Id: 0348f578-6f8a-4300-66b4-08de17f52338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?+T0uECE5Q2YABvob3dIpPpWkkj/+vnD2Uy2Z6thcxlOKYtk4uHYsIVycm9?=
 =?iso-8859-1?Q?t2CunvBNrEnUw1l1s2ovQ+YGaxxm0VQZZXKvLzk4Nx2Gq3inERJPniG3sC?=
 =?iso-8859-1?Q?PgEQM2JfK+RaUYCMcFH9Yh68gskRJ13QSzs0m49SdcXBsOvlNAVgH+kS2d?=
 =?iso-8859-1?Q?32E26gSO3CTEOAKS8GmaYPv84vVpV4ERmsk/ifPQpurOqybbd3HkewCqlZ?=
 =?iso-8859-1?Q?nnBlSJ4vh/sqtnl8CQ4AFCn34gAYethuB0sFpc6enkAw6T1aw2BDjX49dT?=
 =?iso-8859-1?Q?zxW+r8qIumK52kKOlHfPEonNMnBchkoJ1lc7uoN7Lytt3Pin5ZN4K53ESI?=
 =?iso-8859-1?Q?iswDAI4YENUnqu1iWasQwbmNB5Kv3Jox0MgjD78rSuDNoyM4bQlD+jCAEa?=
 =?iso-8859-1?Q?SFJ0E82NPUb4DXK3MCwiiHERskVrEB+YuP9mv+wqhhJy9QlQJA6NRdyq9p?=
 =?iso-8859-1?Q?KIcM2c14GMyYELzeTHBAjUlnLSRS3cPlGeYRsjShHAdFM6V1C8EUKqok6A?=
 =?iso-8859-1?Q?WwubUYrVITX4AujlqFC2aPtkSQch9bJH0rAhfBjirlXxTMBXbx7qtO8zEY?=
 =?iso-8859-1?Q?8os5AlgaJ45Vm1ECcF6/x703JmPVJvItrVINjvAcmlSNeu9jCKGdNLXjKj?=
 =?iso-8859-1?Q?RMKgLgoq3/NXDHcT2/O9tsMYKGseTPakGYoFucAvXMRWkQz6CQPhGLLDeG?=
 =?iso-8859-1?Q?pnU3602oaS3SGpzL8dA2Hm9Ysnr1Ye/QQXW39luPuz2PpePlw79W64dKrN?=
 =?iso-8859-1?Q?efjNcizOInzt/24dzfcCyAyEnctqlZvBs5drV7aK1SzdasQnfsT+4lyrhn?=
 =?iso-8859-1?Q?+29vOw5rVqQqiCJzTi93YljDTmRWWmDtLkHtv3a/suXjRFsnHjjuOyKWH2?=
 =?iso-8859-1?Q?iWwdWq5aPF9+TN6PixpAiO9sXpBvQLWRZy69iPfsmCfb1FBMdIaOfTq9w7?=
 =?iso-8859-1?Q?ZLSrQ4qv/axccUPY2guNfEqWvoAVnVxuGBG1SE+6C+U0kkBUeWkmcCc2ON?=
 =?iso-8859-1?Q?JCM7H+qOX1Me4TZ2dRyXHJszM2AfUM+MPzmYUVr+/lPTe7vwHg3IE9uXOG?=
 =?iso-8859-1?Q?6lWY1gfT/ragjslJ11e/NYt+qtpbGHaOvxmaKoKstXXbJrOX2RJTbjajnH?=
 =?iso-8859-1?Q?sSDE50LcjBydh97GqptCaK08wkzGpqiqqzp7hIgFUcAdHuxUqSsv2koxqc?=
 =?iso-8859-1?Q?ZJVKUPELl8shwnE6e5YWOyzx3eBJmGiCNLMq5kTwoLPMmvggXKE/z2JiVK?=
 =?iso-8859-1?Q?+smTubeaRmbyloziRjUplQAFIVHTsWX9Xd/BDHCKJ3W7sIDffUoVTOYlMc?=
 =?iso-8859-1?Q?wiONwvOmEmCjjjkbvoXtHUD1iFmfanFhkErGNf6GZjka8V3fDtZpmjjPLB?=
 =?iso-8859-1?Q?XS1nOrky8LxMlb6d+IDcLXGPEBrW5lchiR7ZTeWhmknmee6K9g6OqZjSVC?=
 =?iso-8859-1?Q?e0eMhdGJDWm5crxcuaN3c42ic+4xjf1qFZ/Rxg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GiUG+soUUmq/01ief2CqjDvmT/3RcKuHbeqH53AznrXy/t105CwJwl5zzw?=
 =?iso-8859-1?Q?mPEqLtB/bQIIEThQfmeHy/aQWFxFmL0w+Ls6S4WYVDkp2Heq+MX2O1n8bv?=
 =?iso-8859-1?Q?HucQFgZ3PRgzL1V8h5wz9qA3XZK0ornjBnco6ZuTEHXXIHqRpzulF4fQdW?=
 =?iso-8859-1?Q?0KIhF3pgl7xGicW7rYomDusI5LXNQf/XrV25zaBIlMATUuvCfiMqR0Tv6N?=
 =?iso-8859-1?Q?fUslMC2YwFjjU6GhuGhcFaoZEXupgUKnDe4wUMzOYZ68QKZ2a2AnFRWc5N?=
 =?iso-8859-1?Q?iVpkiRBiD5bhYTbXyV4YfU/EYu8qr/h4AGgTcaQPa4FSJSiHO+9N0pBGes?=
 =?iso-8859-1?Q?JMap+0UC1k02G9ByniU0ozB8fGTnnmxKpgSNkPAa9oF6Mwr0ItzU5Oq+xG?=
 =?iso-8859-1?Q?UQQ+DDgdQm37sQgNrz9p+JAWith43pFaljKj2kTxJETYBXUpupZcyGMtAh?=
 =?iso-8859-1?Q?do53/AeCo4Rryxr6ndKEgmLV71tCXpI3KzUAVkH5RmPhKipndOaBOcdY5/?=
 =?iso-8859-1?Q?WEXwpCwQEzIUhg263FNr6/5PVUUSFy/86miMAtS9nDhe4kYdbsWImB+zMn?=
 =?iso-8859-1?Q?l2oQ0V2UmeZyGiFmn3U0tN4NJCOgv49Bo4VpT9q2zHsNb3h+FO+9AdXfxG?=
 =?iso-8859-1?Q?SDFrmbf0C6+ZYbQnvh1Q5hikk0rq9fVSDpFgtM/4pee7EOhQK6QIBLOnyd?=
 =?iso-8859-1?Q?+g0rPlr3l+Fwb1DpQ5eDCEJ4rAkZle2XbY+eS7aMaUCF5Jdyn6JGKp06BI?=
 =?iso-8859-1?Q?HcyVoollZee+VkRsGbVjOPbUNyJSEexsU5TZEQBeFRCMG61EY7Y94zO/rM?=
 =?iso-8859-1?Q?zrgj1Khp3GkcAdKH20Z7xHu1Y78fIVQeyygK+n4jrd/aZ9hrWw/SVcpI36?=
 =?iso-8859-1?Q?zR14H11KYLPyLRxXZGdy+qnq0HfUm3T1UEz6dfOzgagFalek40siOu7SJW?=
 =?iso-8859-1?Q?uJc4EBc22JZFK1oam+wwtwR8FR3oUqrqhFMNpGxIHsnN1ivArpMfpvxSt6?=
 =?iso-8859-1?Q?iqvKpmwx4f7GJISfMBEmwvYjczN8bNHSkgGmP5R7KK459guAtgSDCFUsRm?=
 =?iso-8859-1?Q?AB3UBfDn1BC8uaLiMkj1cUejSvVdNXgtxq4CvpGHNKer3AKSAAfPNkYveN?=
 =?iso-8859-1?Q?hbSIfixppiw/nMZUwq1bT9OoB5K4VARvDsFlHzjnG3CG39xV6TD2aG5GCY?=
 =?iso-8859-1?Q?OWiYILk6IvVKI4Du4qJAh7S8ANo9+fmmX+XgebNYjlQU970sSwG77H2SUY?=
 =?iso-8859-1?Q?95fRI8IcQd0iM68KWsU70yn/QqA2JKNVAk4OWfjnfXYN6Qklwk581mfqDg?=
 =?iso-8859-1?Q?W9mZ74cqapkgBRyl2MfyQ4ntPiBV5F9owA1/f/CseyY0T+DUxRtZtHXJkw?=
 =?iso-8859-1?Q?m5Uer4of2tBBKJHmxG7gBfHWvAqs5otEYl7HK//iJrHvYAqevJ85Lv6ZE8?=
 =?iso-8859-1?Q?fbKvoR9pGNuJbsWJd4pnA24CnxOyn9a/d6f8QBJHjQhlfO7B06tbSioJZF?=
 =?iso-8859-1?Q?9BTVt7OUC+mFh2hbGVb+kTQghTvap5+mpSxDlmGgJVN6iFjF9rEvkuwdge?=
 =?iso-8859-1?Q?eLZcDGEXY8IFlqJTgBhU/CAUmKXjw/3KMSK9uhlwGdKfipSjIrWCNv3uX/?=
 =?iso-8859-1?Q?UO+8xtWbAZeqVmDnhGEWShZyUBfPjUhU1qQLi+zWMmaWUTGyXDgbgHug?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0348f578-6f8a-4300-66b4-08de17f52338
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 20:44:36.0388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3+X9FX5jmgDnzAi/yZaAU2E16LU2h+wZpMypA7dZNeiq7/ET2rgxFnVRRREMmVk9tXLHyEkD5ncoZC9MqNU6a6+wvz5VQWGDQDpmkcRjuJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7502
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

Here are the fixes towards 6.18-rc4.

drm-xe-fixes-2025-10-30:
Driver Changes:
  - Fix xe_validation_guard() not guarding (Thomas Hellström)
  - Do not wake device during a GT reset (Matthew Brost)

thanks,
Lucas De Marchi

The following changes since commit dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa:

   Linux 6.18-rc3 (2025-10-26 15:59:49 -0700)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-10-30

for you to fetch changes up to b3fbda1a630a9439c885b2a5dc5230cc49a87e9e:

   drm/xe: Do not wake device during a GT reset (2025-10-29 11:43:30 -0700)

----------------------------------------------------------------
Driver Changes:
  - Fix xe_validation_guard() not guarding (Thomas Hellström)
  - Do not wake device during a GT reset (Matthew Brost)

----------------------------------------------------------------
Matthew Brost (1):
       drm/xe: Do not wake device during a GT reset

Thomas Hellström (1):
       drm/xe: Fix uninitialized return value from xe_validation_guard()

  drivers/gpu/drm/xe/xe_gt.c         | 19 ++++++++++++-------
  drivers/gpu/drm/xe/xe_validation.h |  8 ++++----
  2 files changed, 16 insertions(+), 11 deletions(-)
