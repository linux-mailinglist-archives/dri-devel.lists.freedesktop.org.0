Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B387596DA48
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 15:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F22D10E8B0;
	Thu,  5 Sep 2024 13:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R9BfhTz/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8EA710E8AF;
 Thu,  5 Sep 2024 13:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725542945; x=1757078945;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=Kk0Qhk5Bz2PIR8v0gS04vCVhhCMsC0U+3VvXzladKnU=;
 b=R9BfhTz/F7UPjVYxHvrt0mmr+n2gFxBVh5kGhdL/aWVm+STiFvirHrkB
 2H8nuJS2kFV4a3BxI2dnnww8To996gbmfWkCX14wO3fAJvKAQmpXT6BDx
 DdEE8IflNh7jaqLhvCOwCvzXR+wUBrpOqH4bX9ccV1msVCOpYCc3jRZ5Y
 I6TUPCaX2GHqvnr0vnjEKoaqN/vUmZhSmifcWwRc9uFFAsO4tbu05bBAF
 Sr1GqYtzxDtzp13mjgXYoGUnJ2iNaiHosTCr6Nm7CCpqpIEet6+xs1Bva
 yOM+EzyurREQPIUOOG+EmzSzLa6a41d/ji5UeL5OVyuoBLKJIlSKKNPMS g==;
X-CSE-ConnectionGUID: bPjo/euxSyGliXM5ikX6Uw==
X-CSE-MsgGUID: uNDNeWcRQP2PgamOGD8hHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="28048423"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="28048423"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 06:29:04 -0700
X-CSE-ConnectionGUID: dlrsG2bCQ+ynwWgp5QT9ow==
X-CSE-MsgGUID: S2mVFk1SRryKLgr79BoaYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="65321062"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 06:29:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 06:29:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 06:29:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 06:29:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R33BjCiKOz0aJuWKJo+UsKBJXhFje/a2TF6s0IcVmrgULoIJPVd10ZHc3QlR6MHKJaIM4cD/7cQ5985YdMzWYnvh7qxQktBkAYGnooaK3fez077tDqxMjUJ7dZt2lbGCnPL76ZH+EEQYrfAlGxAjaVb5QAPls3VlOEb2sAipf+RUyoAIzuuYKTu//NdLYKI2hrjQxspBmT6evb9U7h8Q1GFwEHmV5JU0Lbw6p7SLX0Lmop/LNee4p2/tAdW02S6wznq0P7NnW8SOKvnqRw7ADEysQeqhl1Ff06mA8uP0bSDvrVBTDbbDtpJxqWY+bxChisZFE05NufEtSCBLkKB97w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxbWOynt6h7VUmAUSUJww9WzjDcNDHWOR1rY1K4o2kg=;
 b=F77M2VVY6ZluAl47AAZrbaZiWes3v4Ik8cT+UgQiK3fM//7/o5FQUn7I4aeNyJPBvlyoCFOE+xnb9NCM7MJFSYewnYdqsdvJ8odG1iBxhCDSERUO0YPJipLjKAZY0DePdHDFJMtxL86HZpe0uWfeXy4lqRTVNcLZYMAXl9XtT6IMBz3lev7LMxybyy9SfE5ENH1jCv8Myp9rES/ixryyYBwS1FEURFx4CbkB8jX/ptO6kiqS47ytov7+PVISeCsdaj6Sb4QywT+rKrREZ3h2uV1cnBA9Rs/F7lO/iuwo3tLDTKIKqI/QfLQUUhwD6/d70wA/PR8CM51+JTMiTn6vYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MN2PR11MB4712.namprd11.prod.outlook.com (2603:10b6:208:264::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Thu, 5 Sep
 2024 13:29:01 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 13:29:01 +0000
Date: Thu, 5 Sep 2024 09:28:54 -0400
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
Message-ID: <ZtmyFvDfFLPbuf6A@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: MW4PR04CA0363.namprd04.prod.outlook.com
 (2603:10b6:303:81::8) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MN2PR11MB4712:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b751e57-f00f-40dd-e526-08dccdaeb406
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yVUeJYN0iCKdzOTp/ngmh6E9jFShd99Jus1X0Md61VUfNZyU/eKItco2DXT7?=
 =?us-ascii?Q?ybcbSrHqCETpSXXScCY0Ndh0juVjJURYSZB2UQmd03tLqPhN8k06Q7fSk1YI?=
 =?us-ascii?Q?dbrzpvPL0RkdIRvM4votX2Q5K1Tzw4LQex3HC5lqSwUrjUXDWzivUWm210KX?=
 =?us-ascii?Q?IU+8ihQX5JDHWsU8mZPI5aHlCxqMMIXJKsmOoS7foL7OWPzMzpxHY01ykzao?=
 =?us-ascii?Q?PBPCILbzfuY3Yc5ZJxZjYMPmIQOUx+HRT6m9N7FjDklU/X6t4/sq+TPoQtyP?=
 =?us-ascii?Q?bK6yhK5K494BSpBSTirmZ31Rvk7WUBCxQ6tc6Pue/iDel+s2EOtRmcZUBfp6?=
 =?us-ascii?Q?Be6NDtOx7Jy0xIJvOcahyHffMvCcElQ9w9vAq07j2ATh0Unfn6rw+Maw9t4x?=
 =?us-ascii?Q?IGXcdD6VRiEm3hEJgpJQ9sG4oxcivDBlQKPm/lfeXOZjExU8NeeSbfx2ZrzY?=
 =?us-ascii?Q?ZL+QOd/+h8kGoWgQEcvrgCo5r2RzexSHFe/Gro8EAR54r6Cxu6KRlJ2k8mvr?=
 =?us-ascii?Q?LLgwPNCVZal+x7Ka5opE7en0FOZneg1wepW+qOHF7Idr37WVAVa3VhvQyl3t?=
 =?us-ascii?Q?5KDE55f1Pf6INoPdXoqwEhT9VW11zJDBeKcQ9tAu+FpeAG6xWkrMbshH/WBe?=
 =?us-ascii?Q?3Hdi9EbBw++xTnWKt2k4wUm/lchj4Ec881OnmvdHvASv8MrvIYkyRRR6YGdt?=
 =?us-ascii?Q?zftFxZ/0mQ4A+ob+hoLOQTPS8cwdsnVQ6gsO4vcs0BW5eFk537YlwZPneeiT?=
 =?us-ascii?Q?R0tUDnkdOhsBoXTYLtlWIFqjhkPC4ES7kK4mlscB/xiNVZSgNr3eiT+pp9YG?=
 =?us-ascii?Q?zJgwaxwkDsI8wHSAdj6uPGc4Un1GBX4Kw328V589dvOA8v+z7mw77xWFBqFG?=
 =?us-ascii?Q?zIJ7yaOgYoXTgmr7pKzvnD1D+p+W4bvMf5XKheKtXpGTLgaGMLs5xziyldNB?=
 =?us-ascii?Q?vyxb1cH336TlZl3VNUJmotD2Iiz7p+vsU8u8sqtnbEP8dagELGX8RApac/1l?=
 =?us-ascii?Q?d5vlNaUh00/tj6nBmauZEtAyVxjx8PAPPH1ucSiARnGvUR17hRnNdXF2SYZ5?=
 =?us-ascii?Q?C3sBje7AH2/2TbClqT0HSb+aiyb5OJ/gR8DZtuRNgxjGhkLhM8tSAuOt+XSj?=
 =?us-ascii?Q?gGSFY+FQiawZSBrdTy+x5bzkzRePMOFM+he99WcD/1YCPwO5DG40Nfw2k1sZ?=
 =?us-ascii?Q?jfYlFkoYx3eZIaVOHdfvrkgb5ERv/sqir8TuE0AlhaOXBWEWjtKBdB72C28s?=
 =?us-ascii?Q?lOKFxCQteEcTpCTASf0Ay48BZt8CgCoG7K40Egk2xZ/jrzxUzGY9b6HinUck?=
 =?us-ascii?Q?K+c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YwD8qya+7Gww2VKlbH4kVTY7JZkOli8GKxV6Fbr8h/sPs0EY0kUcFLqsTg8D?=
 =?us-ascii?Q?xEB1uCLjprY3iSF1J5kDGzF0H9Sk7AtVXdEajgseKVJeiVOJzGqBintzW1FH?=
 =?us-ascii?Q?o1fKljyOqLEOJ1k1CuLEw0C0FpjuF/abnagKBfEaMxcZlXr/1fG47KwWlqmj?=
 =?us-ascii?Q?vXmqlQl1LT0mRuHE5hnOnKr+u8RIcR3/cwm0duG1XwjM/bOMS1Q+ulRd7GoZ?=
 =?us-ascii?Q?NtQrgWM/yvcEw/gJmP6NgrSxxQmjX3vH5qrfTgxVBrVqrp50cERa42DAbYTW?=
 =?us-ascii?Q?BWHcc7tYXPfzdTkfBkGirDu9B1w9vpPIUo1Mvk/HRyEdtERDDegJq3ZKa5B0?=
 =?us-ascii?Q?xpMvkgwhyJGLLOjldF5aqrFv/VSC7FLTPFA6omxY1U/7zUJcHcxKviKrj/fr?=
 =?us-ascii?Q?GCVHnSrkOtcnpcSdTEGSYa66tG/JFv6KiZp0EiEhjZMl35laj5Fy1MbUSkeb?=
 =?us-ascii?Q?yeRkmNtehSJyHGX9Zut8LdvZ5s6RUfKCK6hwqyBtYs5h4/LqBACvjvJmViHs?=
 =?us-ascii?Q?3AR7YfGvgt1PgI/yE/cYh8xMIsHjjDrIDCWrK9FE3nDJN5OlEeOCPzEXOoz7?=
 =?us-ascii?Q?4E/+4gTHDUs9airnLerMvtLn/04WrJt5KXhgsoW7Xs/yGs0vUV8DyWDqgwuI?=
 =?us-ascii?Q?naIGP4aKx3otDfg42OP/x8/QYw+YCR2IbthLtlvi3vyPykb4Y8enSCDGps6q?=
 =?us-ascii?Q?bxC63n/S3gqq/3C9NV5I14ngw30BYVTWbL9Hv02AyWiJkelftBsE6DQyYbXI?=
 =?us-ascii?Q?5Vm1BxqLMQH46vo7TAk1SZpAe/EvpBJ+TV02nGxNDn0cqK4x7OltAttmgYoY?=
 =?us-ascii?Q?wrTXtfiAFwqpFpRZUkQtLoBohKVaScdfXyYGlJ6hcRkegy7aoufycuvceP63?=
 =?us-ascii?Q?RxruVB5ye2YDPfm/xruTPuX1YdgdvFA4bNs3OUmPrzwLs7rqZhJCgZzJjMgs?=
 =?us-ascii?Q?iOVUqp6mm1TTilSs0NJHHo0KQxTcNsyjpx1H6OtAGuFpG+FQbXdHFGF/7Grd?=
 =?us-ascii?Q?+fV1J/RsGLue/tLKGk/jpqlKcmJatxQmHiyrfBZcbKfWsKDMon8UIHuh4P51?=
 =?us-ascii?Q?TWx2Gh5Yu8RdMiYkh0BXPiskP8I4ZR0S/W/n76CAJmAdnA6IPYxTgr2APBUc?=
 =?us-ascii?Q?M/vgWSt8kWkZKqfCpbchTAWyW3BtfqT/YtZhQlllF0jcve+9Pix1Ohf2iTsa?=
 =?us-ascii?Q?6XDakb/rY754t3Aj8m/vbsB2jii9cHYJrI+hN193a9p3vWUBC4JgnV96qr3T?=
 =?us-ascii?Q?WKj3theMYBsMFqHkNXXp1PkQGBk1xamLy2lZkeKk7KGFO65i5lM6PMxbdvl4?=
 =?us-ascii?Q?bSx8l6wLgPaGIHgzaYPX4DTd6kTpiPf3u9ChWFZpwAK40e/mTvcXeP6zL6e5?=
 =?us-ascii?Q?ZtKglOPyNCeGSK9Iiv+AnMZa5+QsaLlZxlz+eHBkBD9RM3AfiPBr8+Qp10Re?=
 =?us-ascii?Q?K5ArD8UBIm+IkIDflHYmmqmQ8vsbrFHt4Aki3FvqMczZBl02G8PJXgxaMF7B?=
 =?us-ascii?Q?lsMzn8Zt4OMLEgsgMknsmf/LphwaCp+yxRnYTkwZ6vmqyR1HsGcy+L3DkxYj?=
 =?us-ascii?Q?Kd2fbZnC77p5hW7DpDM1zR2GaeO8sWk/to0ct0Ifjkg5pU+rmibxdRW0yQOh?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b751e57-f00f-40dd-e526-08dccdaeb406
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 13:29:01.1468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c8IeFghTE1vQsu3684xfA21HSDGIoNx/jPn4yZLj42uD8T6U/rAnZveS1oRJzSny/v0eVJJUBbVNsNsEicaS/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4712
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

Here goes this week's drm-xe-fixes, mostly
with power-management related fixes.

drm-xe-fixes-2024-09-05:
- GSC loading fix (Daniele)
- PCODE mutex fix (Matt)
- Suspend/Resume fixes (Maarten, Imre)
- RPM fixes (Rodrigo)
The following changes since commit 431c1646e1f86b949fa3685efc50b660a364c2b6:

  Linux 6.11-rc6 (2024-09-01 19:46:02 +1200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-09-05

for you to fetch changes up to 4bfc9c553f5ea8cbfe085824f3283885cf173c20:

  drm/xe/display: Avoid encoder_suspend at runtime suspend (2024-09-04 12:24:47 -0400)

----------------------------------------------------------------
- GSC loading fix (Daniele)
- PCODE mutex fix (Matt)
- Suspend/Resume fixes (Maarten, Imre)
- RPM fixes (Rodrigo)

----------------------------------------------------------------
Daniele Ceraolo Spurio (1):
      drm/xe/gsc: Do not attempt to load the GSC multiple times

Imre Deak (1):
      drm/xe: Suspend/resume user access only during system s/r

Maarten Lankhorst (1):
      drm/xe/display: Match i915 driver suspend/resume sequences better

Matt Roper (1):
      drm/xe/pcode: Treat pcode as per-tile rather than per-GT

Rodrigo Vivi (2):
      drm/xe: Add missing runtime reference to wedged upon gt_reset
      drm/xe/display: Avoid encoder_suspend at runtime suspend

 .../gpu/drm/xe/compat-i915-headers/intel_pcode.h   |   8 +-
 .../gpu/drm/xe/compat-i915-headers/intel_uncore.h  |   7 ++
 drivers/gpu/drm/xe/display/xe_display.c            |  23 +++--
 drivers/gpu/drm/xe/xe_device_types.h               |   6 ++
 drivers/gpu/drm/xe/xe_gsc.c                        |  12 +++
 drivers/gpu/drm/xe/xe_gt.c                         |   7 +-
 drivers/gpu/drm/xe/xe_gt_types.h                   |   6 --
 drivers/gpu/drm/xe/xe_guc_pc.c                     |   2 +-
 drivers/gpu/drm/xe/xe_hwmon.c                      |   4 +-
 drivers/gpu/drm/xe/xe_pcode.c                      | 104 ++++++++++-----------
 drivers/gpu/drm/xe/xe_pcode.h                      |  16 ++--
 drivers/gpu/drm/xe/xe_tile.c                       |   3 +
 drivers/gpu/drm/xe/xe_uc_fw.h                      |   9 +-
 drivers/gpu/drm/xe/xe_vram_freq.c                  |   6 +-
 14 files changed, 124 insertions(+), 89 deletions(-)
