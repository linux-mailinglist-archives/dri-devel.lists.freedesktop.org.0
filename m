Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8478456A32F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 15:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D1B118A8CA;
	Thu,  7 Jul 2022 13:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C5118A8D0;
 Thu,  7 Jul 2022 13:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657199499; x=1688735499;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=5IMvRqffyMCOIcj2nkiEhOlw/AuVz1O4Y2IimSR32KY=;
 b=lkt9vK8pHbYVXZQFx6lc9cZJ//PZk0QUgPuL6jWLJ4KaeZ1J3o5Tk/u7
 iNKxY+LRbqKSggs3hzN59FEdBIsF2yBI5Dp4gPnjLdmtkYMlfc3KbGghH
 x72fp9CuDwv9I/QDFawmHy86wy/vxwnAqXXdLWut9rBULyKZGwouZ+2o7
 0cv0YXSCe9SQc1ctK8qjWnnXRQ7hK07JAkMXcHPsUqxYOYd9g2d5tAJtA
 DQkRz+ptQSGpUoemBKf5yix0DA/luwqxAESK3YyoFoWVXQ/tpw5QkbttI
 f3iPKCuPQJ5vg6KJLeaTy/vI3ZERN+cXrikZOtvIMAe/YVOLPXi29pqg7 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="272814188"
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; d="scan'208";a="272814188"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 06:11:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; d="scan'208";a="683304940"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Jul 2022 06:11:37 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 7 Jul 2022 06:11:37 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 7 Jul 2022 06:11:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 7 Jul 2022 06:11:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gty6WuLelQxpvgMMETPZuyOv4BHKnqv7UCDnpsFXXA45MZIq/zNkMAaDQvPpTXTQy9cZXVwFH53PbYkHaAOaPT46dnaXMqRxF24EsR+dEsWzORcUrqBct5OhKDtW+sxlXwCsa841qYBTtHf26qliB574J94hWcyN/oXvx/6tbTmXa+/5w0JOM8kUeuGT7WoslmNXsGerxMxu7o5MiZoMYnKhO8hDTNCTkTdeRYrYl9eTagMcXYZgRuJn26xz5+PXxp5g5QN56MX6MfgAR125BoKWJhTvSUU9iddLzwMzlFgtj5qikMC3/dit/Pvq+JJjltRlsBiaYh8eAmWDsqYyyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfUZ0TbXw05khgC2QWxiXyTgjico1/GpYJQ8gIb5w3U=;
 b=R1vmWDWqfskE0dux10hVULthUO/HGhuUWffPQDA861zUcrfkwZj4YVHfWSJ8b2ZTupw7O9IBAMNg4xJfx85OnOKZg8Fp+flJZhekTW4uED6NejMWMCyBjpuFpKwQIwZmxfVxxE//yma6SGNofya0hQMP6dnXIHnWaS0tVP8use+8b8MYQZxS9vTsRmnet9jCNSUSP7OMyAphiFNoFPYC9nSm0zoE3h/aPd6vUTEYKYO256BFSvesh6Kw3LLiWMy+/dP2iJLejc+r1x0VES7tog+k+vs7WNJodpseH/0UGN3HSycEXghYJMeD+ergmSVT1WEnKCOZpMX3G9myW3O1Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4428.namprd11.prod.outlook.com (2603:10b6:5:202::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Thu, 7 Jul
 2022 13:11:35 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5395.021; Thu, 7 Jul 2022
 13:11:35 +0000
Date: Thu, 7 Jul 2022 09:11:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <YsbbgWnLTR8fr4lj@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0PR07CA0071.namprd07.prod.outlook.com
 (2603:10b6:510:f::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cbad8f9-6c9d-4e57-67c6-08da601a37ca
X-MS-TrafficTypeDiagnostic: DM6PR11MB4428:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lbfeLYDO+rMmE8Xohv6voh051HBQVGon+Lhc5y3cOaACOietrA31+eI/ZcjMyyoJ/CieYcHgZjelkMUcmL7qheWrsP95/PbKvFS0gf+bNSpp/zdeNbaXXflKus8bU5ObYZ9K+dlRqfg8nOhxyp3v1G153jR0FeAO99eVBcPFLuYtMYxAtvR3QUQo5SODD47pH79NRq//ul34Q2Ei60BIQ/xCh2lkXU7uzpdi/rR8jPlDE8J9k6F+hqsAb54ywtXtfHu8yPGJpUHds2iMtX9zqtvqZL0CdXXoNkdyfQnLyd9Em8x9SVaMmU1YOjjkvAaUqERdFPerqxNRjVsOt9rlbobpg6Pe8w1f/kNxBQ0FOK4aoFn/Lqvzk8Bht59OBFdmnliuwx1QNvRgpnn9U3ixs2EnNOJnnsL2O5gHTlkAwsveVL2v7Xi0PggnMn/XNbgcJFWQsls1fjNyv9pcN3qHoiVJhjN+kqv0WPVH7gbEAmacp61Nd/0om9ZErI4OTKYp7XtYcC62ZEH6NCNHIHzwbNtWaHSIp1FPj1rRAdrJoFhWJICqgInJx6o4DVpezXMxs3krhgRRv5Dtc33F9/VpxEC4UUkI9CEX0jiJcB1fjthrUNY+4pkvaGeKztxeEqc/LpVGmnkGmyyU26rtwtXrj5Ho7A1gQ7Bb69QJ/xDEXduugmCxng6Wj2rSw3QdrvHvUYtXsLI91qb4US3HU1slyFkYztqV0DkBY1Lqw9TQ4EWPIqOgBqH4yaJaL/PbRn3X
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(376002)(396003)(366004)(346002)(136003)(8936002)(7416002)(478600001)(2906002)(83380400001)(6506007)(5660300002)(82960400001)(66556008)(6666004)(8676002)(4326008)(38100700002)(66476007)(36756003)(186003)(26005)(41300700001)(110136005)(66574015)(6486002)(2616005)(66946007)(86362001)(316002)(44832011)(6512007)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0enRw8qgBP6utgcoAODcNkrwxTwPgSpmIwnpgpazXJzon/gR91Uf44lP2Z?=
 =?iso-8859-1?Q?IH5hicDlqEw09vBWV/EKa800rpyZ7W2mjv3qh3HzngOG3yWTC/vhTxLGdA?=
 =?iso-8859-1?Q?DHeSzDTZ8QtDSNzoH3OQnzJESZKxkY7AQ5xFnpDyHLgM9ypOcmdh3zh1At?=
 =?iso-8859-1?Q?ZOG201xKzfCedWMq0XNCGK47nzunPY7NnJOvAMweUEObu0NHJ3s0cBmzrT?=
 =?iso-8859-1?Q?2Bqpm08gjzA8hPs+gD9ozJUFE4xtQI8v5Ums2/2ykaB7kZ8iOLMt6FqZuQ?=
 =?iso-8859-1?Q?qgtDcOTRTcEwJUoZvYVyNtuk9dco8aCWlYSY+qMJs86B0tqajqR1q/utU2?=
 =?iso-8859-1?Q?8XWfw+QAZan5COPk7qvj+hHm3ZJGPzMvNpLrVQu+O1xSMgkjr5nsT1bGwR?=
 =?iso-8859-1?Q?jg/x0NowXKTWEIQzVWQx+Wl8jLSeZuYB95+42G8IkgAuEUBmCSLo81QV31?=
 =?iso-8859-1?Q?k0BW+9ErLmOBIfZfLyi+mKbTpMpWICNojrPVpywWQ76LSb9EIf/WVLOmKj?=
 =?iso-8859-1?Q?zd48EpIUgmI4Dgd0+vTNEiuU32k2gsVGQVi/NqnnR9TPDgWUszj3XFqf/M?=
 =?iso-8859-1?Q?ZUAQyVMAlL3ic39wfoPXuXyioSibxhYdEn/JkpM0uZf7zIxDRKOOarb/zJ?=
 =?iso-8859-1?Q?V4gHVPgumObcM0Mqqjd9cn6klG5keuWFxNR1PuBBENi3LUOiwfDrmmGTAM?=
 =?iso-8859-1?Q?dInze1cPgZz36E1A/VQRme4OATwi1rfQ5ifjr+WjaJJNgLdLdQ52dEehWU?=
 =?iso-8859-1?Q?O6t/p3WVeECfjLA2R2yMLUp42/dzXvfSsZGx1Df4b47cKptDQxB2lwiMBC?=
 =?iso-8859-1?Q?i/0AQpXZ554QP5XefNgTvInhM1Cu0KfBPwMvJxakmeAdiXTfC9Thw0UV+U?=
 =?iso-8859-1?Q?+BGlmBjL+W22GFJaB6l5FznQtGkQ0KDokRDFL8ibZcxSJWoTLTpREoaWmq?=
 =?iso-8859-1?Q?Iv7eFo+3fb9mpwN9NCSLV6bKMcwYoxLJk+SVxCDrZIyCF9r4iiBV88s04M?=
 =?iso-8859-1?Q?aLJohaLxx2N2Uv8agruABCPYjN8PMDYKcA4YSU6n9fLRnZ4vWU1BMy/v8o?=
 =?iso-8859-1?Q?yMF6oZVQjweC5I8UQadMHXKElIX75EMmLFwQL3hYic06yCONXxki8Jiz2W?=
 =?iso-8859-1?Q?IEhHjCou2/OP4IfXqLLyrFLVN3ZFqUnyWMYrCS3vlAmW8KmIm6LmAhyreb?=
 =?iso-8859-1?Q?8DyiREqlEpItC/ybHCnKF3eqIv65Vl4mxPtKgiKi9IDfj6msVzSUOp3UzN?=
 =?iso-8859-1?Q?aVPJw+V/G/96Xb+nrBFPgGt3FVPwea0Ze+4S+/b+j+QStY6W47BvEzGOEn?=
 =?iso-8859-1?Q?gNex2fHg3DcHU1GbiCSHDtheUCOJeAn3YLPXpkRNLHFgnhgAuFUz4DYNZ/?=
 =?iso-8859-1?Q?3bA4P6vdGtg9Rj1K49PKp+kxRKZWuunQiGSDmx17awMYUoyO6dVCV0O6TT?=
 =?iso-8859-1?Q?t6xbS0oON5Lbb6kTTPwps6SQYah7/Ng66V+IVTIy0TjpKS2TbeMNIC54am?=
 =?iso-8859-1?Q?8Fm6egPHNZBKECo/tPIbF3oj2o/zRpQN4jL80QUm7CkaPx9A27+mW43y83?=
 =?iso-8859-1?Q?/TdZ9S2fhSeNyclmyKY3NOI+LakbDS0axnhuZ6UPcS5P2zGgLnZOYWYRkQ?=
 =?iso-8859-1?Q?fViKVTG1w960R3NHv8PMbwZS7XlsymjY6/MB+livVU1f8TJfKPUzsygw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cbad8f9-6c9d-4e57-67c6-08da601a37ca
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 13:11:34.9649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 39btRGDSjQPSIrs7DcAXQHgh47s6dHPnCBoHrYCuAsk2ArRZXe0XHGGBXPfkupnpFrU1gilHN42oK9wRo2anWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4428
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Here goes our fixes targeting 5.19-rc6.

There will probably be a couple more important fixes coming
next week for the -rc7

drm-intel-fixes-2022-07-07:

- Fix a possible refcount leak in DP MST connector (Hangyu)
- Fix on loading guc on ADL-N (Daniele)
- Fix vm use-after-free in vma destruction (Thomas)

Thanks,
Rodrigo.

The following changes since commit 79538490fd7ade244dba400923e792519a2bdfea:

  drm/i915: tweak the ordering in cpu_write_needs_clflush (2022-06-27 18:12:10 +0300)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2022-07-07

for you to fetch changes up to 12058077b2e963d16d2d673d46233a7f46add7c9:

  drm/i915: Fix vm use-after-free in vma destruction (2022-07-06 23:04:55 -0400)

----------------------------------------------------------------
- Fix a possible refcount leak in DP MST connector (Hangyu)
- Fix on loading guc on ADL-N (Daniele)
- Fix vm use-after-free in vma destruction (Thomas)

----------------------------------------------------------------
Daniele Ceraolo Spurio (1):
      drm/i915/guc: ADL-N should use the same GuC FW as ADL-S

Hangyu Hua (1):
      drm/i915: fix a possible refcount leak in intel_dp_add_mst_connector()

Thomas Hellström (1):
      drm/i915: Fix vm use-after-free in vma destruction

 drivers/gpu/drm/i915/display/intel_dp_mst.c |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c    |  9 +++++++++
 drivers/gpu/drm/i915/i915_vma.c             | 12 ++++++++----
 3 files changed, 18 insertions(+), 4 deletions(-)
