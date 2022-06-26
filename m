Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A54555B412
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 22:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC83010F07F;
	Sun, 26 Jun 2022 20:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E3310F07F;
 Sun, 26 Jun 2022 20:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656276822; x=1687812822;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bi+i0Q73yIq0P77pzF0JVkKrE7bjRzcXp5Op3TL7jQI=;
 b=DEDxlHfKZ+K2+PefljiWz4cr4W8QBKwS5/sDU6AlBhX7KEe35Mq9+zhn
 yIxte54LcQWVSvBOsRPzeg8DfeQQp3lreLH0GfaDR8tYhb704uFo25xjn
 yAPD430NGJ1azInlT/g+fmxYvY3wlU+wENXSxdsse9DVNjDmxkc2pzmD0
 UPpSO39ikg4vp3hIIhwKeu/1TdPrK1Hg1UzLtL9JaOnGuP6f+IWsB9bJV
 qjcXmNmY5Z7XP2n37OZORpDhZU4cYQxkVPNYZTjMfoUEYhEF4hmRSckkg
 pTQtoSYDzmSX36bjIHb6YFGspucFZxDyP6iBP/QLvc4bsyMgMN6gnlT8e Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10390"; a="282046656"
X-IronPort-AV: E=Sophos;i="5.92,224,1650956400"; d="scan'208";a="282046656"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2022 13:53:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,224,1650956400"; d="scan'208";a="835911508"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga006.fm.intel.com with ESMTP; 26 Jun 2022 13:53:40 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 26 Jun 2022 13:53:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sun, 26 Jun 2022 13:53:40 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sun, 26 Jun 2022 13:53:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gs0W3kVXIsWzfXQGwR6KiNS17d6Z8nvlkCCDciv8x+r+l9NgxuSz5f59o8ksF6Oly6I9uuRF178+muc4U6tWNaj2g4kSwIU9iVt+b9VH/SX8EA+hFnkio53UviGrfsnakbwz/uHOjPUKelPO/zU0Mv0S9PtXQoJTitScc/rnF27Hz083mctSWxQUsgxS3Sok7gmZtwx9IfQjsVyt9N9+03diLaYp5JWlOVnk9mclDCNZgQ39bltTqI1zHrtD7peYW2CSuTOo3mz3eTvrRYPue/HD1/Zd+5qaEkE8JHyNPSA3FOmoLHYAPF/o5bcszj/cDb4M3g0ia1mGgNYHiXVZ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/XEHxYhxMh010DGpFX9dPULX2OP3Psf5yPpQK4wd50=;
 b=QvsP8VH20iGZEPVPoRiyTp9qrttoBtVffkgBCnOzrhJw5tzbLKagudf/GRCf3ur8G3B+DlTCZWcUMD+9VN8/omOqKytArGcoCQEH9gQsK9++8yow4FPPBsUxGp9wM06gwLCER+3aAGDcGohQghaZWP0B5PcHxjfq61BBL8n+v48VWGm7ffBQmoHq4kWxTcuIHwwrgT8ujNRiE0GzpqMXbQu6KO4qQ1UHiw8UvSfSquwfho1VvG6VSyWlyy1QjL+ZvL5IzxNHg6CsZokfgegfo0mbZ2d+BedX3o96GnIxxMbZ5fyw0zCJHcmsom7eoNqi0mr9lKoctg6Du4NO4QY4hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN2PR11MB3856.namprd11.prod.outlook.com (2603:10b6:208:ef::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Sun, 26 Jun
 2022 20:53:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fc50:22fd:6bdb:5769]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fc50:22fd:6bdb:5769%7]) with mapi id 15.20.5373.018; Sun, 26 Jun 2022
 20:53:36 +0000
Date: Sun, 26 Jun 2022 13:53:34 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/2] drm/i915: Correct duplicated/misplaced GT register
 definitions
Message-ID: <20220626205334.ble47o2f3dv77enj@ldmartin-desk2>
References: <20220624210328.308630-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20220624210328.308630-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR04CA0293.namprd04.prod.outlook.com
 (2603:10b6:303:89::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ffd2ff0-0c80-4fea-e3e7-08da57b5f08e
X-MS-TrafficTypeDiagnostic: MN2PR11MB3856:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TiPc145TTNZn7umzE57+rQV03CDSiBHhbrL9pWPXQFkLydLuColjK8mWABXZMuUY6XZQHbf3G1EK/gM4jvEyrcOFb4iv1qUU2RQ0YNbmggh3cacBwcXvZb75kqWM2YPE2siF+pRiDSy5qrhRIGbGX57XapCcivbh1Emx5mPCL7EOrJTfQoAcdklBRs3+j0uGm8cqJKU+twA+Hj8xKqcijL3cBGOTFouf9KwBe3SWLTP85HUY2RWTAzWyLjuUDxcnh7xPt+tLmhgqHIgA6aj+NaCGsiCGy5ZN/jNutZMG/G0WYoe/ucxPzTSRBz62DmoUD4WaMNOQHKHiIR/ZCVS/ZZn4WHzzalIM9sxv/Wff+7CH/o4eLynWa3VepNDjFM97OE8fZFP/u3eS5i8aYW3618nBh2hxmdfVuKvIGqsXiDKnr8pb53HjwRYdiN5Cfg1NCM8d5ZiOrTJfI+TA4TBNG5n8QCrPP2K+GFJfVNLp4YK6OvrIPhFvl5ZQ/pF+Ex4l4PL64ciANCmyWxh+W76Xv3JEURT2Y0AgqNQDbnnIshvQA8uRZ25AJyaf+YX9IZ8ssiLRMqwOkzSUMdea2cKmOgxU5Okf+Ih5QPAU5Y3lP9m6DCx3D02LhDS+g2ZRb+SYMvf2aCd1AzZUwgFArX+LQ4E953E9SML8Kl55zXNsOcjJE4pApR13WPY6YKXwMyqYTTUm33KvY+4Qzlg2U4cRpav+ItDgl45WrK4khjDrXnU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(136003)(346002)(376002)(39860400002)(366004)(396003)(5660300002)(8936002)(6862004)(6506007)(478600001)(6486002)(33716001)(83380400001)(26005)(38100700002)(9686003)(82960400001)(6636002)(1076003)(86362001)(41300700001)(4326008)(450100002)(2906002)(186003)(8676002)(316002)(6512007)(66556008)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZaiDBhl3bbvtjqQDAUp+h6/k4H7aktevN+WqQkWWe6MC+o4X97JtVVH8GXCd?=
 =?us-ascii?Q?zNAWj/FIHpN1TyXFv1wGUu7k7/wzPmaeLJdfeBlQ7uPqDpaZ3Hur/woCCAFS?=
 =?us-ascii?Q?V7Rjy0eN/3SM0nnLaI9Kymp3oGBfO80VZ4vcAJ4jl0bglc6ND3a7pj119fmP?=
 =?us-ascii?Q?G67qKauKywhloVlzshoEJe6z2Z4r33ElKSHpQBWnTQLcNlYwLR1paw0yVdVI?=
 =?us-ascii?Q?yp0GIjzHHQmgoRsFfWep1Gkc0LyKj/anGBX4I2klqLqTJ+/8qtnmXHE3qc2m?=
 =?us-ascii?Q?EBPLrfR1SlRrwz5RLbIJLz+uei7sKzbypE2089HeO+qFrwkpJAriU4xzMKpL?=
 =?us-ascii?Q?5NUTWzUxsl+RRTAR8flsSDMxwgJj3N1ofjV6SSBuNcVyAaiZFxv3OJo6mlrN?=
 =?us-ascii?Q?60FSyyn0DpP/UPCfNVdcvbUxfu/Is456UULk9pL3wDAtNWjQk7oZdrNsblJl?=
 =?us-ascii?Q?i8MvS7lEWFnXxz6uNd/92nuLy50QykABCbJLEPFZYmcB9GJ4dZ9H1ugI2xWY?=
 =?us-ascii?Q?EbV5F8f0SiwQ9K2mW6CVc4tAZ/SQ2QPfbP4iGaLkIqSeJN1sdzTauziiA/1H?=
 =?us-ascii?Q?MHphVnuqUyFfMdRe4NfD34zTfXcAPfL8XH1fcMLwkj9NQZuP97d5vS5XxSGB?=
 =?us-ascii?Q?jS6eQXBfJBgLXRomccO4rMdyAc5qhFCn0kidRWDJJK9433KpBg/nSCfs0Yzs?=
 =?us-ascii?Q?xHt0LvWRcm/u+hTkf5z13/jIJON42A6ppxKW0wQl6h/QHgagwjDVTjKCUiNU?=
 =?us-ascii?Q?MN/R55DnUZyBUI4ot7+Kd25c6pyEJqBgSG49G4iy4nfd63N8UByz7HYXw0wW?=
 =?us-ascii?Q?W+Hf+R+PJw0appI6u5xgd3186cJAVFgssM+kTIGnVOkS5E48ikPKuP1Q7GDC?=
 =?us-ascii?Q?BAURWfvgmHg7l3jeUOlmSQfhA4R7ovhD/ax2vsq+bB1mT17sK55wL59QGuG3?=
 =?us-ascii?Q?1yT6BdikVSW1YBP2NX+1dbrqhPKvj+r3D2k8CAhKvOdt70lkgRuNC3vhNHk2?=
 =?us-ascii?Q?vqRdPs0XveB34eruUs+11X40kHb5nlp0QJwH2PGzTvNKNwcmG193jP9/e6+A?=
 =?us-ascii?Q?ubbFMeRQNPuVk89A1xs7hQsWOmRILX9aPKp6j18iczSZ7iNDmNmzoosEwySe?=
 =?us-ascii?Q?88X89mXA0LcfgueWl0wskPhunASV+11wNcaWuIdg4wqdHABISEgm26fowfSG?=
 =?us-ascii?Q?eWeA96j9HBkzTtvHPcpxUC7yNatsWFjJK89yUa9bfUHk9+0AVkeevmRDMkkz?=
 =?us-ascii?Q?UIuP89j1j0KOLcFxAPntEhhPJGPKJXq7Nz+0DIy/DTtwLQko5qCgZ4aqekeN?=
 =?us-ascii?Q?m5Faf7XbqiKvBwWRGHFqbAMxGYi6YKIPys6I4q4+phqvLZkO8CuRz4S9xjuj?=
 =?us-ascii?Q?1QL4KCdRiDLVLJ9FPeRKR/VsATqm2ERD14ebSIcM7QCa843ZAHteNQeg/5kM?=
 =?us-ascii?Q?GKpi9lGdbCigLWuAQEjr5MAfwd21uAFVQHmqfJ2BsADjZGRE/3BRNUOHl899?=
 =?us-ascii?Q?r7IvgGPyDuCmrTTfzWmZpn1skx87NMHVImb5Xw1oJKZmYqiFYRhat9y3FeK8?=
 =?us-ascii?Q?h/O2sJwxAGsUeGMnmPkEsE02W7rBNSp1w3zz2iWnsralHntXZtwI1TB8L3oX?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ffd2ff0-0c80-4fea-e3e7-08da57b5f08e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2022 20:53:36.4970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B0lDNparivBk2R0efil+y5Ch2kzQaoXG2j36nrAprFnHWq+YxQ3DccaWTRGXoHUNt2vXcI50mEopgYJXr8IMamxEC5l1PBHVuVi8jZ49U18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3856
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 24, 2022 at 02:03:27PM -0700, Matt Roper wrote:
>XEHPSDV_FLAT_CCS_BASE_ADDR, GEN8_L3_LRA_1_GPGPU, and MMCD_MISC_CTRL were
>duplicated between i915_reg.h and intel_gt_regs.h.  These are all GT
>registers, so we should drop the copy from i915_reg.h.
>
>XEHPSDV_TILE0_ADDR_RANGE was defined in i915_reg.h, but really belongs
>in intel_gt_regs.h.  Move it.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi <lucas.demarchi@intel.com>

>---
> drivers/gpu/drm/i915/gem/i915_gem_stolen.c |  1 +
> drivers/gpu/drm/i915/gt/intel_gt_regs.h    |  3 +++
> drivers/gpu/drm/i915/i915_reg.h            | 17 -----------------
> 3 files changed, 4 insertions(+), 17 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>index fa54823d1219..e63de9c06596 100644
>--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>@@ -14,6 +14,7 @@
> #include "gem/i915_gem_region.h"
> #include "gt/intel_gt.h"
> #include "gt/intel_gt_mcr.h"
>+#include "gt/intel_gt_regs.h"
> #include "gt/intel_region_lmem.h"
> #include "i915_drv.h"
> #include "i915_gem_stolen.h"
>diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>index 07ef111947b8..61815b6e87de 100644
>--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>@@ -324,6 +324,9 @@
>
> #define GEN12_PAT_INDEX(index)			_MMIO(0x4800 + (index) * 4)
>
>+#define XEHPSDV_TILE0_ADDR_RANGE		_MMIO(0x4900)
>+#define   XEHPSDV_TILE_LMEM_RANGE_SHIFT		8
>+
> #define XEHPSDV_FLAT_CCS_BASE_ADDR		_MMIO(0x4910)
> #define   XEHPSDV_CCS_BASE_SHIFT		8
>
>diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
>index 932bd6aa4a0a..cf5e16abf6c7 100644
>--- a/drivers/gpu/drm/i915/i915_reg.h
>+++ b/drivers/gpu/drm/i915/i915_reg.h
>@@ -8345,23 +8345,6 @@ enum skl_power_gate {
> #define   SGGI_DIS			REG_BIT(15)
> #define   SGR_DIS			REG_BIT(13)
>
>-#define XEHPSDV_TILE0_ADDR_RANGE	_MMIO(0x4900)
>-#define   XEHPSDV_TILE_LMEM_RANGE_SHIFT  8
>-
>-#define XEHPSDV_FLAT_CCS_BASE_ADDR	_MMIO(0x4910)
>-#define   XEHPSDV_CCS_BASE_SHIFT	8
>-
>-/* gamt regs */
>-#define GEN8_L3_LRA_1_GPGPU _MMIO(0x4dd4)
>-#define   GEN8_L3_LRA_1_GPGPU_DEFAULT_VALUE_BDW  0x67F1427F /* max/min for LRA1/2 */
>-#define   GEN8_L3_LRA_1_GPGPU_DEFAULT_VALUE_CHV  0x5FF101FF /* max/min for LRA1/2 */
>-#define   GEN9_L3_LRA_1_GPGPU_DEFAULT_VALUE_SKL  0x67F1427F /*    "        " */
>-#define   GEN9_L3_LRA_1_GPGPU_DEFAULT_VALUE_BXT  0x5FF101FF /*    "        " */
>-
>-#define MMCD_MISC_CTRL		_MMIO(0x4ddc) /* skl+ */
>-#define  MMCD_PCLA		(1 << 31)
>-#define  MMCD_HOTSPOT_EN	(1 << 27)
>-
> #define _ICL_PHY_MISC_A		0x64C00
> #define _ICL_PHY_MISC_B		0x64C04
> #define _DG2_PHY_MISC_TC1	0x64C14 /* TC1="PHY E" but offset as if "PHY F" */
>-- 
>2.36.1
>
