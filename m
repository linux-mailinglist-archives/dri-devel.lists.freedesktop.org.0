Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0D16C71BB
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 21:43:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC3710EB23;
	Thu, 23 Mar 2023 20:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3737610E47F;
 Thu, 23 Mar 2023 20:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679604217; x=1711140217;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=UVCscdAD2FoCuMi/RtK/WJsFTy2Zsovsq/zEvn1+boU=;
 b=b67M6mAcR2dmVg1NPaSoZXtX/Qh4bFsnmya67v5KMMjqkrunDD2gnN8B
 /z0LwDjvFF5/TXt4YIxUTXJXukJdPd44+OWwmGPTj1nkGU1AHwyL6hNJZ
 JcbECWftbIve3UtsdHNcgcLFPPJ4T8DAJh2eOx0nVWlLQwOz1W2PsA8Sv
 eUzQbOkcGk8Xog83svbQCvkgwSuR/JRkjR6ecx0sEZP1bgjPaoX0SuAaX
 FUKTGdkynEz05MqC/I+6kfAAuc4qpz9quPZB4ymowgN8o+uRcX+YNSn6P
 pIg4x0d0uapWflSiOqEI/S17wIdWAdxyhrk/P60uwmtwYzbLcXmFuiuGS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="323482397"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; d="scan'208";a="323482397"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 13:43:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="856624778"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; d="scan'208";a="856624778"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 23 Mar 2023 13:43:35 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 13:43:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 13:43:34 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 23 Mar 2023 13:43:34 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 23 Mar 2023 13:43:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNhSwNOfAH2xLo8lQ7jUfctYYBdK8BaddkvMMXtU8VU4m9VKoPgo9gY3AEu29Aiub0dHtDdxVYSZim97pjkhl4ffVYAb4lzwUaDsu4p4H3BFI19BcWhmXojSqJ2aenzmhcYKeTSRu4PSWlovnYdXUU5edR3yD3+rZW9vYcyp+zOXdqqEIr9GyZ55Sz78Aucjjd9et4DMGG2Qj57SGq25bPcXAbxv6s1eMt2s/6LfcE5zrDGMZu/r+HGXnWHgWqNnHN6eq/V0RnbC0P1TivbzOow3pD+DH464HUBwg/8Nt95mm0qd+z2x4ZxXqcB8jt7MX+oSKWTd39loTHVUjpz/3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIXYwpdZddW2agUuDm4dRp4DW8fAMFe2UGrfl2tUwjg=;
 b=fAsdUCh1Af2gyCmlgEarh7IcyXSTYFZbDwwcsgEZDTwx30vKeZYw/jzQdYkRFdXDEtGl8C6CnC5aNDxQmhoKRFR9Pl8KpC4IbtbjSw4Fqqg4vIICc/Nf5VVxWyXewwEfy1lbh1usZBXzSY8zz/l6ES46SB2dk43ZcrApsycgqau5I/qT303Lz1KZjPjbU4lklVHOhh/FSp0EEMoEITs0W28sL2LiAr3KmplgoBNawpF7XCTwMyEnuAjZKiRSlSlp6w/nvB7Mn6RD5ANGwjsZ0/s+U9TPuze6gQHNbj9JYNXHrBOXgHTUOpuwVthIwqJqNUZYEGxvz5zWEXKKkgILHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB7387.namprd11.prod.outlook.com (2603:10b6:208:421::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Thu, 23 Mar
 2023 20:43:30 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 20:43:29 +0000
Date: Thu, 23 Mar 2023 16:43:22 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next
Message-ID: <ZBy56qc9C00tCLOY@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0022.namprd08.prod.outlook.com
 (2603:10b6:a03:100::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB7387:EE_
X-MS-Office365-Filtering-Correlation-Id: 111d4781-5699-4da7-31e8-08db2bdf41fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k1ICmhblMob83uPoUb5Ieo/Q3tmYJWO+ZOLRQ+Sodcw+HI04vq9bsxRQm5aephDBXFzMZfwW4QbCC1fquMNTgOVnciLOBMP5ttQvlaKWSKIAwycUEdYt3/kUXUgLeB0FF01YVpeuqxRdoZK/6Lm17QltcEkaC6BRIKmq0b5hVd5F2XpDkwhUWBfeRhtsWKzEjl0ROrYWnfI/N3NrawEsHndDXAkAnunS517TF65yAtBBTd0ySURRt2q1uBPQMOK/iJX9TiUsEEcbwVNfCbDAj5A5FGHVbPqZHD8AQOH/TjELG96+bjkGU6ELXflptGNKpblVIXGjPgC6o0BjOtdNrbsnRCojlKjYf2pWIZW3LbzuIeI/+orUGTRVXzVOreCHrucT1opwgK68l6Jw2r/9s0fb9LLTXJY0D9b9yyfa2WMmi5ifJ6fpoqNBrIEgHcEpck/8mDZj9Al0yF8uqsFebW6Z9oRG2qZTDfuSxhsoHV2zLPinj3f1bCPY1LnBeDXvJUWhGIC1iQUiU1PXyLdRD63fg4TSwTPa3XQFNNtXDtBJ5J8Q5Cwr/t0soGWPxka5GhdwlULje8dCIPw550TTlqg4/nhJcrZ8BpXFxMXXgp8WFLz+avryZImJNFq5c2bgt4BXBWHMCZ8geTUSV4t10Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(396003)(39860400002)(376002)(136003)(346002)(451199018)(66476007)(66946007)(8676002)(66556008)(4326008)(316002)(54906003)(7416002)(41300700001)(82960400001)(8936002)(44832011)(5660300002)(110136005)(26005)(6512007)(66574015)(6506007)(6666004)(186003)(2616005)(83380400001)(478600001)(6486002)(86362001)(36756003)(38100700002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4jBkebwoy8rq1+3pyNl++pESHmqoWoTXHcBOxpExf1R/iU3myzmZ+SfAbF?=
 =?iso-8859-1?Q?zZi61qL/QZnaMCg7KFaWZUWEwzYwI1IThWFtZUVaOxrQG7qC4O8hKzj8Cl?=
 =?iso-8859-1?Q?bsnKbgI/XvzrTmyx6znmVQeLVqhuuQIVZfrn7E8WHMqcKCSeR3x4wQGf5M?=
 =?iso-8859-1?Q?pzdrprwbpz9w8EYzHd+SHnXc235Hb+7jsUFjycoPA012yEtnBXkwoZ9UVM?=
 =?iso-8859-1?Q?7RLDF2pJGCs4QJ7sBZ+n2BtWRBqvFiNqzZh5Y4wO8r+ng82IK8kO6ysCrl?=
 =?iso-8859-1?Q?iTowZbkTvy4hFpup0zQcA1CnKgm3lOXAE2n5EodE4Fpz/j9IvjXuG3ekmN?=
 =?iso-8859-1?Q?qColyBAZTDHXXIsIvmLpcF6VrGGgVg/ZJFtrO8y2q0NdiwBe5DGGCHo0vm?=
 =?iso-8859-1?Q?ibTZj/dKM1BVG0KPW/3+Hk7WqUd2PR1UH0uSlLejEUnWEAJUajWFNvuhAj?=
 =?iso-8859-1?Q?LwaWJZNXR7csiU0zmNr9HgjbzyFafcYgO/G2bV/2vYUj+5Kz+IOsiUq/SU?=
 =?iso-8859-1?Q?3BIkI7Kj/MBTL6QgX862DbHspXHLu/lFEFAorMj6i/T8dSAAYnLTh54pnu?=
 =?iso-8859-1?Q?H8X9xEivKEE90xmTrGI3KPYU2swCl70Z7J5+DElc2Pw55CZJ+sy294/BAO?=
 =?iso-8859-1?Q?uYAjKWBYYotyf6N5IKhs7ujEYgE7V4RN+QPfGNQu++Jr4Xs5/lHdOgwzbs?=
 =?iso-8859-1?Q?B14uPyk1AfYR+qKBAknFo3i3Dpf51Lh/OyM3CjmayX6dHQBQtsq20YlZ00?=
 =?iso-8859-1?Q?xOSgzLm4HKmL2eLrBKQfRfqBKxNqYqDmBr2zf104cqrbtfgcQQcl21i6kS?=
 =?iso-8859-1?Q?yxV2faA/JqQSjc7S4Az23rYk/+KTi8WG3Wj7PXHYhpPjXsYwX90D+Ug6IK?=
 =?iso-8859-1?Q?w5BfCdwOSWfL4w2s4FrhNqMRDZEhma9IURu/+JjmId15bxT0bMKtOvMhfi?=
 =?iso-8859-1?Q?eu195hnfDHJqaQZCBF1IPcvsKUH2aDRX1nJv1er2vj3k6QaIyGdgLqyQUK?=
 =?iso-8859-1?Q?q0OlBktjukqcLgryqtRTaxQE49VBnOc7566FYWe/ne/jUuUNdw8ySkF6qN?=
 =?iso-8859-1?Q?kaSJhfWlNt+EcPhqkTpiWbveC6gl7GTtvUrMrLO1psPey3sNf0C+NucV5U?=
 =?iso-8859-1?Q?sv0LgfqB+ueDtaSJ1Owv+s0iDt93x66qAvapZLTQwaJPn7qtGXuH/uLAtr?=
 =?iso-8859-1?Q?DYvbFwX3Jz/yCNdSymns4XvKS/1QGWkmkPqGAXUEEbB1ljpIfuwT74UZUQ?=
 =?iso-8859-1?Q?HfgIj4yhqHeya96Bi+JmoomOsvE0/hGvtMGdS0FlOiUYSdHjcUrBrvn1kq?=
 =?iso-8859-1?Q?R2+WTATivsIyonoaXWvXTCe4GbTSNTHmesphcvKaClrgUl7IdXR7eU7RXo?=
 =?iso-8859-1?Q?+xbGuggVAh58N+aE0EouV7FvIW4hvSfVBJLdbt/0a9ZnDnyDuuu2Lkq9PH?=
 =?iso-8859-1?Q?HfFrYHeoS70PcyTrrFLQkm1QpDxYnhhaLO8JF/lrtCpQRv7J0OLoPnDyi7?=
 =?iso-8859-1?Q?ZfDrpLl7rKVXyMGt01trceVXKl8O1j9UzNtgtRxLtwzvMzqr9Lo93mF7yH?=
 =?iso-8859-1?Q?c/y9fSIFClnnr4q38zGkNf1yzO+YVTDwaeoxCk7i9XYgjGp/LVVFm50ghr?=
 =?iso-8859-1?Q?UeMHNyAS3HI4iLRDxvtlIeZoHCzAwnetxVQvm8axfj/B9g0zSkxZ+QIg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 111d4781-5699-4da7-31e8-08db2bdf41fb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 20:43:29.3065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Zd30wEgmWFxrsq+KVsYDxa5y5IMlpcCmTWP7325ZFgH/lcQBfJ2+lCddGN/fXd4NOYHEcPGOSz4nqcgp5Vg6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7387
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

Hi Daniel,

Here goes drm-intel-next-2023-03-23:

Core Changes:
- drm: Add SDP Error Detection Configuration Register (Arun)

Driver Changes:
- Meteor Lake enabling and fixes (RK, Jose, Madhumitha)
- Lock the fbdev obj before vma pin (Tejas)
- DSC fixes (Stanislav)
- Fixes and clean-up on opregion code (Imre)
- More wm/vblank stuff (Ville)
- More general display code organization (Jani)
- DP Fixes (Stanislav, Ville)
- Introduce flags to ignore long HPD and link training issues \
  for handling spurious issues on CI (Vinod)
- Plane cleanups and extra registers (Ville)
- Update audio keepalive clock values (Clint)
- Rename find_section to bdb_find_section (Maarten)
- DP SDP CRC16 for 128b132b link layer (Arun)
- Fix various issues with noarm register writes (Ville)
- Fix a few TypeC / MST issues (Imre)
- Create GSC submission targeting HDCP and PXP usages on MTL+ (Suraj)
- Enable HDCP2.x via GSC CS (Suraj)

Thanks,
Rodrigo.

The following changes since commit 4b736ed40583631e0cf32c55dbc1e5ec0434a74b:

  drm/i915: Get rid of the gm45 HPD live state nonsense (2023-03-07 19:09:20 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2023-03-23

for you to fetch changes up to 883631771038d1b0c10c0929e31bbd5ffb5e682c:

  drm/i915/mtl: Add HDCP GSC interface (2023-03-23 12:17:22 +0530)

----------------------------------------------------------------
Core Changes:
- drm: Add SDP Error Detection Configuration Register (Arun)

Driver Changes:
- Meteor Lake enabling and fixes (RK, Jose, Madhumitha)
- Lock the fbdev obj before vma pin (Tejas)
- DSC fixes (Stanislav)
- Fixes and clean-up on opregion code (Imre)
- More wm/vblank stuff (Ville)
- More general display code organization (Jani)
- DP Fixes (Stanislav, Ville)
- Introduce flags to ignore long HPD and link training issues \
  for handling spurious issues on CI (Vinod)
- Plane cleanups and extra registers (Ville)
- Update audio keepalive clock values (Clint)
- Rename find_section to bdb_find_section (Maarten)
- DP SDP CRC16 for 128b132b link layer (Arun)
- Fix various issues with noarm register writes (Ville)
- Fix a few TypeC / MST issues (Imre)
- Create GSC submission targeting HDCP and PXP usages on MTL+ (Suraj)
- Enable HDCP2.x via GSC CS (Suraj)

----------------------------------------------------------------
Ankit Nautiyal (1):
      drm/i915/dp: Don't roundup max bpp, while computing compressed bpp

Anshuman Gupta (1):
      drm/i915/hdcp: Use generic names for HDCP helpers and structs

Arun R Murthy (2):
      drm: Add SDP Error Detection Configuration Register
      i915/display/dp: SDP CRC16 for 128b132b link layer

Clint Taylor (1):
      drm/i915/audio: update audio keepalive clock values

Imre Deak (18):
      drm/i915/opregion: Fix opregion setup during system resume on platforms without display
      drm/i915/opregion: Cleanup opregion after errors during driver loading
      drm/i915/opregion: Register display debugfs later, after initialization steps
      drm/i915/opregion: Fix CONFIG_ACPI=n builds adding missing intel_opregion_cleanup() prototype
      drm/i915/tc: Abort DP AUX transfer on a disconnected TC port
      drm/i915/tc: Fix TC port link ref init for DP MST during HW readout
      drm/i915/tc: Fix the ICL PHY ownership check in TC-cold state
      drm/i915/tc: Fix system resume MST mode restore for DP-alt sinks
      drm/i915/tc: Wait for IOM/FW PHY initialization of legacy TC ports
      drm/i915/tc: Factor out helpers converting HPD mask to TC mode
      drm/i915/tc: Fix target TC mode for a disconnected legacy port
      drm/i915/tc: Fix TC mode for a legacy port if the PHY is not ready
      drm/i915/tc: Fix initial TC mode on disabled legacy ports
      drm/i915/tc: Make the TC mode readout consistent in all PHY states
      drm/i915/tc: Assume a TC port is legacy if VBT says the port has HDMI
      drm/i915: Add encoder hook to get the PLL type used by TC ports
      drm/i915/tc: Factor out a function querying active links on a TC port
      drm/i915/tc: Check the PLL type used by an enabled TC port

Jani Nikula (6):
      drm/i915/debugfs: move IPS debugfs to hsw_ips.c
      drm/i915/psr: move PSR debugfs to intel_psr.c
      drm/i915/psr: switch PSR debugfs to struct intel_connector
      drm/i915/psr: clean up PSR debugfs sink status error handling
      drm/i915/debugfs: switch crtc debugfs to struct intel_crtc
      drm/i915/debugfs: add crtc i915_pipe debugfs file

José Roberto de Souza (1):
      drm/i915/display/mtl: Program latch to phy reset

Maarten Lankhorst (1):
      drm/i915/bios: Rename find_section to find_bdb_section

Madhumitha Tolakanahalli Pradeep (1):
      drm/i915/dmc: Load DMC on MTL

Radhakrishna Sripada (1):
      drm/i915/mtl: Fix Wa_16015201720 implementation

Stanislav Lisovskiy (1):
      drm/i915: Ensure DSC has enough BW and stays within HW limits

Suraj Kandpal (5):
      drm/i915/gsc: Create GSC request submission mechanism
      drm/i915/hdcp: HDCP2.x Refactoring to agnostic hdcp
      drm/i915/hdcp: Refactor HDCP API structures
      drm/i915/mtl: Add function to send command to GSC CS
      drm/i915/mtl: Add HDCP GSC interface

Tejas Upadhyay (1):
      drm/i915/fbdev: lock the fbdev obj before vma pin

Ville Syrjälä (23):
      drm/i915: Preserve crtc_state->inherited during state clearing
      drm/i915: Extract skl_wm_latency()
      drm/i915: Reject wm levels that exceed vblank time
      drm/i915: Don't switch to TPS1 when disabling DP_TP_CTL
      drm/i915: Don't send idle pattern after DP2.0 link training
      drm/i915: Stop using pipe_offsets[] for PIPE_MISC*
      drm/i915: s/PIPEMISC/PIPE_MISC/
      drm/i915: Define more pipe timestamp registers
      drm/i915: Program VLV/CHV PIPE_MSA_MISC register
      drm/i915: Define skl+ universal plane SURFLIVE registers
      drm/i915: Define vlv/chv sprite plane SURFLIVE registers
      drm/i915: Clean up skl+ plane alpha bits
      drm/i915: Relocate intel_plane_check_src_coordinates()
      drm/i915: Extract intel_sprite_uapi.c
      drm/i915: Update vblank timestamping stuff on seamless M/N change
      drm/i915: Add belts and suspenders locking for seamless M/N changes
      drm/i915: Relocate intel_crtc_update_active_timings()
      drm/i915: Extract intel_crtc_scanline_offset()
      drm/i915: Split icl_color_commit_noarm() from skl_color_commit_noarm()
      drm/i915: Move CSC load back into .color_commit_arm() when PSR is enabled on skl/glk
      drm/i915: Add a .color_post_update() hook
      drm/i915: Workaround ICL CSC_MODE sticky arming
      drm/i915: Disable DC states for all commits

Vinod Govindapillai (2):
      drm/i915/display: ignore long HPDs based on a flag
      drm/i915/display: ignore link training failures in CI

 drivers/gpu/drm/i915/Makefile                      |   3 +
 drivers/gpu/drm/i915/display/hsw_ips.c             |  37 +
 drivers/gpu/drm/i915/display/hsw_ips.h             |   2 +
 drivers/gpu/drm/i915/display/icl_dsi.c             |   2 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |  60 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |   1 +
 drivers/gpu/drm/i915/display/intel_audio.c         |   6 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |  46 +-
 drivers/gpu/drm/i915/display/intel_color.c         | 101 ++-
 drivers/gpu/drm/i915/display/intel_color.h         |   1 +
 drivers/gpu/drm/i915/display/intel_crtc.c          |  10 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |   1 -
 drivers/gpu/drm/i915/display/intel_ddi.c           |  61 +-
 drivers/gpu/drm/i915/display/intel_ddi.h           |   3 +
 drivers/gpu/drm/i915/display/intel_display.c       | 157 ++--
 drivers/gpu/drm/i915/display/intel_display.h       |   3 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |  19 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   | 353 +--------
 .../gpu/drm/i915/display/intel_display_debugfs.h   |   6 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |   8 +
 drivers/gpu/drm/i915/display/intel_display_types.h |   8 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |  36 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |  39 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |  15 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |  48 +-
 .../gpu/drm/i915/display/intel_dp_link_training.h  |   2 +
 drivers/gpu/drm/i915/display/intel_fbdev.c         |  24 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |   4 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          | 158 ++--
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c      | 831 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.h      |  26 +
 drivers/gpu/drm/i915/display/intel_hotplug.c       |   9 +
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |   1 +
 drivers/gpu/drm/i915/display/intel_opregion.c      |  40 +-
 drivers/gpu/drm/i915/display/intel_opregion.h      |   5 +
 drivers/gpu/drm/i915/display/intel_psr.c           | 299 ++++++++
 drivers/gpu/drm/i915/display/intel_psr.h           |   3 +
 drivers/gpu/drm/i915/display/intel_sprite.c        | 183 -----
 drivers/gpu/drm/i915/display/intel_sprite_uapi.c   | 127 ++++
 drivers/gpu/drm/i915/display/intel_sprite_uapi.h   |  15 +
 drivers/gpu/drm/i915/display/intel_tc.c            | 322 ++++++--
 drivers/gpu/drm/i915/display/intel_tc.h            |   5 +-
 drivers/gpu/drm/i915/display/intel_vblank.c        |  92 +++
 drivers/gpu/drm/i915/display/intel_vblank.h        |   2 +
 drivers/gpu/drm/i915/display/skl_universal_plane.c |   1 -
 drivers/gpu/drm/i915/display/skl_watermark.c       | 156 +++-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |   2 +-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h       |   2 +
 .../drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c  | 109 +++
 .../drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h  |  61 ++
 drivers/gpu/drm/i915/i915_driver.c                 |   6 +-
 drivers/gpu/drm/i915/i915_reg.h                    |  87 ++-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |   6 +-
 drivers/misc/mei/hdcp/mei_hdcp.c                   | 105 ++-
 drivers/misc/mei/hdcp/mei_hdcp.h                   | 354 ---------
 include/drm/display/drm_dp.h                       |   3 +
 include/drm/i915_hdcp_interface.h                  | 539 +++++++++++++
 include/drm/i915_mei_hdcp_interface.h              | 184 -----
 58 files changed, 3322 insertions(+), 1467 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_sprite_uapi.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_sprite_uapi.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
 create mode 100644 include/drm/i915_hdcp_interface.h
 delete mode 100644 include/drm/i915_mei_hdcp_interface.h
