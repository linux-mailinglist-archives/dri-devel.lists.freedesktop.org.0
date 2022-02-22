Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6FB4BFB27
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 15:51:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6866010E7C6;
	Tue, 22 Feb 2022 14:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DCAA10E7C6;
 Tue, 22 Feb 2022 14:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645541463; x=1677077463;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=utcL4SiaLPpS7tlDDDpFEluTvNMhZzn0Cu//om+rQRY=;
 b=ZhcE7mgRtHXgnnDNdhmZbXpYgEYqj7oSXJhfteCq6gdsm++fyWmDn4D5
 Lp7kIvdIMvaN0E2qCicb9l8A+PNCTSWnnoFijyXBz93lw12TLvzA+yDbJ
 mzA0UkkAExfm+jvmwFyFaRtiYDC39wgdFv9Am8XdsdPD2BRhFQ7C2yv5K
 ZfYsBrp98lBgU/EMjKWN4t4coMhwE9o2JA1vxhqodeQA1uwFKNWks69GJ
 jIF0XwlrdkOW+ZNQJNJP+Bsv3lelm7A6IsM/IxbNwCPMHAL9Sv8UOo3pR
 wLLcC8bk62VPWtgf26TuaHrTtW8iKzMefiwJ3wzcm40BXKvdU6+GpGn1e w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="231688090"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="231688090"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 06:51:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="532251940"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga007.jf.intel.com with ESMTP; 22 Feb 2022 06:51:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 22 Feb 2022 06:51:02 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 22 Feb 2022 06:51:02 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 22 Feb 2022 06:51:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ILccR9JkJduksBu1NitXmgivpYEzcjrhC8F5yP0DOeTgeocIrXV28xu3YNfm3v0O3UEdgVnFh0ca7QrY662TET9eY9TbmaL+1iiesTtpyB30UzOJ47+Q0wKXgz5H14gSMPrMaCg8A0OE8asG4CJgDox+DY2wzKPACA5dRkSdxM1OwUU/19AMdBx5kLil+IOfJbI/7hrU5PwWoe7B0P5SFXY7BGG7WAN5piewGjXXyROnx0bdyFBQCSllU3tu+9Fy1c+lBsZCcmmwLKxSSKAgIhkZs8R0NbizKAh+CKzUZX/fu94hKYvSBDfmtH5WAfLcWoCNyW9qeaJZX3M90JbOZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jj2zJb9Tum2wWVmibr+0fDOdnxieR/iLMjHVWVIj1/I=;
 b=QumZfH58JyXAW8FC4ts/XsEba6RS2oKGGVTfGcAargSOjz8vtfhzidyBr55tG1jFXAxsqy4mDCAtzBoScr04D4a1gnIwGj5qeTesqaurucb3+4v6axkCC4KnDfAB8XgBV51LKjT0T3YxvDfjHDKGJGOws3vsQbvWK/cnT9jwVWCbBSxl8ag/BUf+J1qmuHo/4e/L+YQsRsJEsfI2OM3J1V/XXEyJpO1nxaR172m+NsqSIs8GthNYofFysCdRgsZkP7XWpUjSymtUJejoDwCGh1JwJzRkU7ZaFUelrKKuqJ598iYgn3Xg3DuLeOsu3mRF2rwWq6zP5hjd6ZBI7yvKtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by PH0PR11MB5627.namprd11.prod.outlook.com (2603:10b6:510:e4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Tue, 22 Feb
 2022 14:50:59 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475%9]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 14:50:59 +0000
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/7] drm/i915: Use the memcpy_from_wc function from drm
Date: Tue, 22 Feb 2022 20:21:59 +0530
Message-ID: <20220222145206.76118-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BM1PR0101CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:19::11) To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d38ce59-fdb8-4348-57a6-08d9f612bd20
X-MS-TrafficTypeDiagnostic: PH0PR11MB5627:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <PH0PR11MB5627A53614915F36D795AE329F3B9@PH0PR11MB5627.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yNFlIg9QUWlz27CBXO9VJgaMG0lxOnwkr65lKv7YHfKzGcoAnWhOAn1wFZczvBch28cquSdsycStBEeyqVMymUfPPYJH1bkIpwli581Gqko1XxszD1tSLeh/ADeUuK2A00dIuPMIRDswwDJleedIj30kxq1Dqihx6+NJGZoxkSUL/jDN+MIcNDZiFZZiJhQvQDDm2tFTuG2+fHo5EVagRs9/nB9UGDuBAwcy7WkkTwL6n+YXNSryfnHtEd5VvDmXjaczYX0S40acCKqJMDv4QseXOuMnYbf3GCf+8RjUH5vVKCdndLDHNjR2RzeeivwD3LqkxseLa9jks80tTpfegCwHJ5hhl+t+cHiuX0iNhey1VtuI19RZ/8v5KIUpx60sHyBJO/zESwJqlUCep4cVEtdU3J3KAqIduGJ5ogwHexF+ohHminiwz5wBPnGyAB9oT9nkygtuXBcatL3AIuCHJ3ZAnGah5lMEmE8Rsg70Zzot3vfOJpc/piV7f2rQU0iaU1XrEJqgMXLz+onfjRIaf+AsSP7aZmlAORZHCHbj9Q18c6h4/glG+Z7kcsds7i6QXTWPEe9DKzyCSS11pd8ktYifjdlf6Ar4GsHt8XmU2iYx6aUL7XpTUwX2Nfc9pC1qbUZAGnTsVlXpS0+nvVynyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(82960400001)(38100700002)(316002)(66946007)(66556008)(66476007)(4326008)(8676002)(54906003)(8936002)(44832011)(5660300002)(2906002)(2616005)(36756003)(186003)(26005)(1076003)(83380400001)(6486002)(508600001)(966005)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G4WtKEVZykaR0y/y1K3cQHat9+VnjaH5pDHfjYIhQAERtOnrRNBtrtdxz/k4?=
 =?us-ascii?Q?OAdpYiHoloAJVTtaq8YZCGwslHYVQGp/nJBXpfwpFYo+6tLjcn6uH87cqeAH?=
 =?us-ascii?Q?BpiT9a8bxLjbAMbPBSoUvr2r5hDvyt1Nx++dS6pQP3Uzl+8FrgB1Qt1tJkyD?=
 =?us-ascii?Q?JmbGX7YpeMoH9ceE64Rja40KqmUgpXS293t9jA682t7L2KATu5aqBiyJrsOs?=
 =?us-ascii?Q?A8qE5f3MZePw4vEWIEy6NW2u0nOERgL9LhV8ZSUqHzGlN1KordS1bkYB8fL6?=
 =?us-ascii?Q?RWEnYkYlydLO69LSAqRMU0/50yCUl8Dq2Ne+fI09MrGlb+T5j//mEMpCEy3o?=
 =?us-ascii?Q?I+0c4lRrYSbJjtt6EFak2ib6J22EJopMsaPn4vUyDWH6fs9pZT+k28I5rkWC?=
 =?us-ascii?Q?09H3O4JZY4NuU/0ms+t55cn13LK1WjpNJ1Q1NIwrNnf0J3RuoNa1Q8WtLpXX?=
 =?us-ascii?Q?/Azh/OauuzBSOdYUgHIT1HGEBIUIqE2Q4XZdN0YIvZ9Zl36J+fCjZBEw6eRp?=
 =?us-ascii?Q?xgwv3lpoOCis83tRAyv9NJYMvrXDf6Xygax2z2zZn/+kYsfSmboSqM56xYav?=
 =?us-ascii?Q?irWCGDR7DDiQadYDA1NIWTnniA+sTL4f7Wp2el2GUSwigszT0EsQB64a03sa?=
 =?us-ascii?Q?Rim6wVgtk71XBlGt+2cIrZ28L43LbGorAa6NU9QxWjOEW5TxjIpD6SYqUBtE?=
 =?us-ascii?Q?955gSWmOuqsud5stP6Tto8iiDZpccq5bPLWhR+pP4yrK58Gp7Jb8TcikD9tX?=
 =?us-ascii?Q?JY49N1J+PscWqoSq711W7OtcUHqsPHlf/l3h0B/6oB3ECvIU0hyn7KjeZtsN?=
 =?us-ascii?Q?QCfdfcOBdyCFTIUYOYXGM+6W5f1rOaaTqk04/UhoM6yjiHTiaVJjPVDbqj6d?=
 =?us-ascii?Q?FXBJQHrdAfjOB9pmvi75ad5zQ6IWPk6/ea1Tsncov+HOz0j6KHo05rXxkbgr?=
 =?us-ascii?Q?Wpxq8WbpTvPazDJrD+flZyezv2UjpUJv9dVcfpBqQ68j5Z0FUcJmi0XG/Xab?=
 =?us-ascii?Q?SNp/asK/SXUoPgHrNtLjv5xqQqm73D98whK43pnqYgUBuPiyXWBVaQTpctcp?=
 =?us-ascii?Q?a9Bnk95PtRYwzqzda7Gpeuj1HW4SWOtzMX7m6bFRGPMAinGOL+/Eq/ZaZfqc?=
 =?us-ascii?Q?LB5hFDsDPcsoT2xO0uHSKUfUWLCECn6FH+t65C5bG61WBtHGCeB5B4DO6HwF?=
 =?us-ascii?Q?ZkjJj9VGC/D18XA/uGJXWqjvANUw2w+KELcgkCs2bZ8Kp7i0ZJsuHRTKPx2d?=
 =?us-ascii?Q?j2evqUNwkPDdLVWhucKSzssG/KJG3f8FyS5s8kD8+brFjrFKJ0q6rp86Tgh2?=
 =?us-ascii?Q?cgHV4/ZfJvNUWsXbRKeO10v7knfXKPc+hRFu9E1mqqWD9M9taFKXhxa1XmVi?=
 =?us-ascii?Q?ZUAB7qhGta2PQNoCaeA1twRS7Jg5lP4S0Hds1D27ZHkzbOLlJmVyY5HskwWb?=
 =?us-ascii?Q?AYRgK0w9avt/FIwhWK288p4/w8oFWiz7G22VyiivgPSEMTdRHRlWVWQsAyYf?=
 =?us-ascii?Q?sdbRzMeGWDCZkfxwnFRqPFwBWIWTNjjIV3sECJInqtoPNyHoJ+Z0bfeoNEGI?=
 =?us-ascii?Q?InnRR9DyELScI0v6vJfcOqo0mOcYKDdPdZnE+qOXYfGlIS1e1yFSn/f4P2Q3?=
 =?us-ascii?Q?mFMvh6rtggpXqCGtbYbBytuhG/G0e1J0pBBGYvVSKotTwwJihrCz1oyQJDrx?=
 =?us-ascii?Q?8xEWL5NzRSXLlwfAVlD2s9IVJm2zwfR/0m+zu1bigsa24UAX40Qg1wcbE2XO?=
 =?us-ascii?Q?io9O8pYcsQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d38ce59-fdb8-4348-57a6-08d9f612bd20
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 14:50:59.4212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lkNCrrWihWno+kzgpy0Um14YZd/VPziLnglPfPgjInvJHsyregdD+3UDDy9YXrs+sAoSyDGU7ii4Y4BWu8bxomEri92jLAMyIdIxXsab7e8CfQlyGz0aQZ4Ezn1Dx/Zq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5627
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
Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>,
 michael.cheng@intel.com,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 wayne.boyer@intel.com, Jani Nikula <jani.nikula@intel.com>,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com, Chris
 Wilson <chris.p.wilson@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, siva.mullati@intel.com,
 David Airlie <airlied@linux.ie>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_memcpy_from_wc() performs fast copy from WC memory type using
non-temporal instructions. Now there are two similar implementations of
this function. One exists in drm_cache.c as drm_memcpy_from_wc() and
another implementation in i915/i915_memcpy.c as i915_memcpy_from_wc().
drm_memcpy_from_wc() was the recent addition through the series
https://patchwork.freedesktop.org/patch/436276/?series=90681&rev=6

The goal of this patch series is to change all users of
i915_memcpy_from_wc() to drm_memcpy_from_wc() and a have common
implementation in drm and eventually remove the copy from i915.

Another benefit of using memcpy functions from drm is that
drm_memcpy_from_wc() is available for non-x86 architectures.
i915_memcpy_from_wc() is implemented only for x86 and prevents building
i915 for ARM64.
drm_memcpy_from_wc() does fast copy using non-temporal instructions for
x86 and for other architectures makes use of memcpy() family of
functions as fallback.

Another major difference is unlike i915_memcpy_from_wc(),
drm_memcpy_from_wc() will not fail if the passed address argument is not
alignment to be used with non-temporal load instructions or if the
platform lacks support for those instructions (non-temporal load
instructions are provided through SSE4.1 instruction set extension).
Instead drm_memcpy_from_wc() continues with fallback functions to
complete the copy.
This relieves the caller from checking the return value of
i915_memcpy_from_wc() and explicitly using a fallback.

Follow up series will be created to remove the memcpy_from_wc functions
from i915 once the dependency is completely removed.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com> 
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Chris Wilson <chris.p.wilson@intel.com> 
Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com> 
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>

Balasubramani Vivekanandan (7):
  drm: Relax alignment constraint for destination address
  drm: Add drm_memcpy_from_wc() variant which accepts destination
    address
  drm/i915: use the memcpy_from_wc call from the drm
  drm/i915/guc: use the memcpy_from_wc call from the drm
  drm/i915/selftests: use the memcpy_from_wc call from the drm
  drm/i915/gt: Avoid direct dereferencing of io memory
  drm/i915: Avoid dereferencing io mapped memory

 drivers/gpu/drm/drm_cache.c                   | 98 +++++++++++++++++--
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  8 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c      | 21 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    | 11 ++-
 drivers/gpu/drm/i915/i915_gpu_error.c         | 45 +++++----
 .../drm/i915/selftests/intel_memory_region.c  |  8 +-
 include/drm/drm_cache.h                       |  3 +
 7 files changed, 148 insertions(+), 46 deletions(-)

-- 
2.25.1

