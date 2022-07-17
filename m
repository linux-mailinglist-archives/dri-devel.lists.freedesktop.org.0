Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 321D55777DB
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 21:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B1D93327;
	Sun, 17 Jul 2022 18:59:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07BFE93307;
 Sun, 17 Jul 2022 18:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658084394; x=1689620394;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=yeK1gGwqaj+BUhCGt7fBjG2Ei8/hP0dIzfmfFECvA/s=;
 b=l3LIPy5mzOZuC+SK7TQNnYN9e6NWtxQE7fonQdy7VyZJYHpTcNIJy61Y
 uOGmNJ6jTwafUH1ZgCVpe4a1Gy9zXt9DmpopEzAkuv09+U3Z7fVpNQfA+
 SCdRTIx5ddJrsGrZGD2etQWDB+Ff1Np1cxAXtVgM0FKVHR1IdIGqbu6HJ
 oL+tTvvHN0hDIMF4WBjmhYrrR9WRQvesFFkkBmCDHerLcUZ6Dkc6a7reD
 YcsnLuXrCSIUEV4NgWXFUb+jRpoQYx/rrVWNfJqHZSlc679TGLO53kY4x
 1kEYPI+EOmfrO3ys+Dy4g0E4wIWg+y72aF1wilxqzUQB3uB23EFA6NMF3 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10411"; a="269106484"
X-IronPort-AV: E=Sophos;i="5.92,279,1650956400"; d="scan'208";a="269106484"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2022 11:59:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,279,1650956400"; d="scan'208";a="924085882"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 17 Jul 2022 11:59:52 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 17 Jul 2022 11:59:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 17 Jul 2022 11:59:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sun, 17 Jul 2022 11:59:51 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sun, 17 Jul 2022 11:59:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCPFqna+nl+wxEQn83Ybj8A+4tcjABdLiq6qbcNojFFongJhwtFmJwrq5poDbXdyvY6IXhUyJKEHTVSPK8zrLYMvxZ6ix3FBEOq7QLL44P+Q97hy0cvehILios4S01jLeNnB3GnRFiSVbhMRKy8CKHktCiIP3ZGYRGTz1+jwGI4gCaC8ceUjo/lrdAFNZh4iiEpwiVcgCoOGS5Yim4+yPbjmuLDxxDarri+rewq3oYv0aUgw4JyLrhITY/pUbz5/C+dt8OHt+hPQrfnL3kI5OXfpvD+hLt3CvzzQjRo7Hexnhjm4dcWXj9EPSLdvEb4eNNTcTc3h8gWPivTpDscY9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=av06JehzF8AtWVVy9sqmpXS3UrSI2dQa/9vwEbWMtTk=;
 b=Qjuii7a+NGLukCIcnkPUA2AewzDD3T0ZambMeF0lTFH1QVBx9HNum0Szm9B7wekQVDtP0X/AX6pmj49GsvQ/qwq5pNV4/GsVs3vTJ3LdPJLJ5UeJqLQDATdMh2HqLRNNMqmIniQ+aNGiCz7U+rAH7uzC0gK79chJH/vjfjJ31ZAJdkVk9f3ll2z6gBA2dZ2EyZEDZ2Ydtrve9Xz2SwzctqH9+6RVWVxM0KSEXgdtk20YXuBPxmAQwSqJECJYr+nNehfJjn+ju4OFb5V+UxPmdl8G5JRlVd7ctfhreKr2vTbX8WH7WtNEo4RfAuLAyloWMZuZLoN2+c+3dbbslyiiCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA2PR11MB4809.namprd11.prod.outlook.com (2603:10b6:806:112::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17; Sun, 17 Jul
 2022 18:59:48 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5438.022; Sun, 17 Jul 2022
 18:59:48 +0000
Date: Sun, 17 Jul 2022 14:59:42 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PULL] drm-intel-fixes
Message-ID: <YtRcHpDGMbVYRU5v@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: BYAPR08CA0046.namprd08.prod.outlook.com
 (2603:10b6:a03:117::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d373381-6e58-4b84-cc6d-08da6826852d
X-MS-TrafficTypeDiagnostic: SA2PR11MB4809:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FZijzpDLrUVJhepXaMPW9Lz4xY9/2u+jVlhUkq5pwfj7FoK6r+Z4OolDzGYVOQT7X5bkVUdwK/ccvdNZh54osWRo2jpjwspiVtA/i4sfaQWOTYNmbwh9cWVH/+BQ6dtO4E/GDWynQ3cyPTGsoWYvIW8oDE6YXU2I5eAqyqJKJRvgHIdYf6lXgJX465UdEu7+kJOgJmjdU1qzSAGSBuf6ZxmEfq8oDKsRcvvry6yzoTYyR1YQK4YqkPceTsT9JImGSHll1x4c3Pe18JWaHJw5pH7Ws13hGwkkai4OOPXfnSIO8huEKl+qPaCIgUB0EsiHvwzTUc3QpCcnb2qeZalNGyhpclFMK9zDNT3+q4leHTxrLKVE4ju3xytgcbVCjpoq1bB7+8WWBPoqurMCG0BuNLBXw7RZfMB1emv4pujLZwh8lzev9bc1KRAZNRBNtYdCtpKTUxYSFlqtsC8blLu0jXX4JeG6U2BoAdXLOo9pGv9nM5cE/8V/vKmIheLxhK3h92o13yy5ufMpMhrBnMJjszI02rjqNGeEZPJnypxEzz5JQqke8o9pn4xFal6Vrpi+GnXbiBJwr1hLLjzff96kujxGQcCgYRyUO5hMBbcvAOtf0xTpOojBzALtRNxSHGh+Eg6ellsN/YvX5a/ZXj+CXJg1IgsazWPY1NkwALHrws8SaKMwW7lARX6yqZAGjV5db/nWfp/F5klFjwv7rwC8TrrktbIWtusXLGLa7vdBWnL2B0KMURf99gt7yYnPAwypHW7CeYfi+z7Ds0z4G7RFNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(346002)(366004)(376002)(136003)(39860400002)(6486002)(478600001)(41300700001)(6506007)(6512007)(6666004)(2906002)(26005)(66556008)(66946007)(36756003)(66476007)(316002)(110136005)(86362001)(38100700002)(83380400001)(2616005)(5660300002)(8676002)(7416002)(44832011)(8936002)(4326008)(186003)(82960400001)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Mg057vRF/+8oqJ0UMaNpujc1M673a6DYl+sfjNgZayADMmesz79a8VCRtdXQ?=
 =?us-ascii?Q?yK8SjSEwx99gpadPhyqXRVU5X4k+KtbfThQmBuF7W1+7hrP89VUArAcLldFP?=
 =?us-ascii?Q?7YkzpXitMayFSpkliOJScJb3hemjLoDTsr4ghJbrIl/l5/3k2R9GavFRrSIe?=
 =?us-ascii?Q?dClvMEucYDMu1C4PMek69My1xDvS4gSgkcZlGfk19TJwtYrChHCyphKCBQst?=
 =?us-ascii?Q?y1B2YNOaeCQKmGzPAbN8FX8FBBh7i84iX1mm2wG7NVNLhfkYXfnT9GY7sJdz?=
 =?us-ascii?Q?dlFkZxNhOwzSH3j77W3WrMD/x9PelBzZ683dGa9eEUSHHzZ4DBrPpPiyqixT?=
 =?us-ascii?Q?MjiF9yd02UI1QPp8Vx1LkCSX4xLew17ACYD+O8fZovt9fKp0hz9plZj/XI6q?=
 =?us-ascii?Q?cyXuEOa9gsYknOjh2NsKwHx6SpKYLJq28n3B61oGbcLG0YKYr/3HLQL6j+C5?=
 =?us-ascii?Q?QCJhEjRnRrUxTOrh/RzPzcs86kCg/w25RtJURY5TwXjYVCPBBOOEIqykPW95?=
 =?us-ascii?Q?Md1/Lcj8/wvhYUo7tgor3Chy4U7EGpXQxJDnQoxges40aNn7ksUNmTjbz/Ws?=
 =?us-ascii?Q?MmQhShvFy2JrcrjbHHks5LHoscUGDwyW0K7HnNcm1rvbyF4dW4Azd6d/JhAW?=
 =?us-ascii?Q?O5GShKqK0RIzw9EqEpOp2lPOQdEk+a/Lalwhu7cA4i5F5HUYBmwG/wwwMwPe?=
 =?us-ascii?Q?8+DZUoTyrNHeP2Cg1GKrBoVAKD9LjvJW9Yz6yGY/zGrnrXpcDYK9/ijvNVqU?=
 =?us-ascii?Q?Z0M5QGWEmPWZkybBdNy2AJMvRbb8ny3EAS38BOtrW180ANs6tPQy5IaJq3vD?=
 =?us-ascii?Q?6MCdSmIhk05eUu0/1VuoBb197T0smW5qxijbzLGWUdt5LZMKQY4GJLJz8vKm?=
 =?us-ascii?Q?4d6c7PdhQ6rfKTcTYS6l3/6u4Ks1+/11hCCzhPJe48M4aP+ZTlTwDFI0UFg9?=
 =?us-ascii?Q?1COmSD1fbC3tqzrRSmJvIxOXd41PWykx/56mwHgAEIgHhO/IU4VjyuBQUh9S?=
 =?us-ascii?Q?SaRTdnMMDlN5Qvucrywc4HE1U9k72l/ShmEm3cH7rAd0XrOOyQyLFybZ8CxV?=
 =?us-ascii?Q?AKLJ2ACY4YihTWLz2MHsorYG7U+yI/8u2Le9FJ4HAKRJTVZ2/HiLiYrMLUbC?=
 =?us-ascii?Q?fo3zH+QQrIuC2Ba0FIvZvmi2G1mSlB7YzKwAXSMB0BAdtsmLfb082YTbG5WP?=
 =?us-ascii?Q?fHgfJZ/zbtzpMz+gbOXo8jKnMYPBrVVSpeyLzpI10dIyTxQQdzwDp9TemFGb?=
 =?us-ascii?Q?dW58cO4a0MD9plNGXKOE41VHsAB+U1h99EzYcUJpP/whBP/l4OXa/CParfXD?=
 =?us-ascii?Q?8updQ6s9Xfwf7fZYXcZdbuzb6xrlqZAYCtYpCkatDk8WCIQAPPnadvBhZd/0?=
 =?us-ascii?Q?TOAIMrelLswiS0zx65R2BDlophEkK6pfD6DAEGU+6AcN/cCBr8bH+ya6GEg/?=
 =?us-ascii?Q?ANhZNTqtgH7xsgwIwiBEaM3ZpZCLtLsKsViaPzSwGr3O/agecEsuG2eKw573?=
 =?us-ascii?Q?LYALsSAPf9W9xrzTbLVObdzutq751XOFLgInbx7YWrhdfeFv5fIzacpns4E9?=
 =?us-ascii?Q?jF23Imz/2MG5W2H6Rx0tSGi0ufBWsdChPkpjphE39DRFqJjLeKWdJD2gJMpg?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d373381-6e58-4b84-cc6d-08da6826852d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2022 18:59:48.1263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9jS7X5fnqwwCb2SIYLoRt2F9SN1QmASXjY7ggA82ZwCVQR99UWgKlqCilLUzaIO9ti+oUV6EhBEUAoP0dBaC0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4809
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

Hi Dave and Daniel (and Linus),

Our 'dim' flow has a problem with fixes of fixes getting missed.
We need to take a look on that later.

Meanwhile, please allow me to quickly propagate this fix
here upstream.

Here goes drm-intel-fixes-2022-07-17:

- Fix 32b build

Thanks,
Rodrigo.

The following changes since commit 333991c4e66b3d4b5613315f18016da80344f659:

  drm/i915/selftests: fix subtraction overflow bug (2022-07-12 18:21:58 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2022-07-17

for you to fetch changes up to ced7866db39fc5c59ee05e154d4abc0977a17f6b:

  drm/i915/ttm: fix 32b build (2022-07-17 14:53:47 -0400)

----------------------------------------------------------------
- Fix 32b build

----------------------------------------------------------------
Matthew Auld (1):
      drm/i915/ttm: fix 32b build

 drivers/gpu/drm/i915/gem/i915_gem_region.c |  2 ++
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |  2 +-
 drivers/gpu/drm/i915/i915_scatterlist.c    | 16 ++++++++--------
 drivers/gpu/drm/i915/i915_scatterlist.h    |  4 ++--
 drivers/gpu/drm/i915/intel_region_ttm.c    |  2 +-
 drivers/gpu/drm/i915/intel_region_ttm.h    |  2 +-
 6 files changed, 15 insertions(+), 13 deletions(-)
