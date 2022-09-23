Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BCB5E80FC
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 19:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C35FE10E502;
	Fri, 23 Sep 2022 17:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C9510E401;
 Fri, 23 Sep 2022 17:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663954879; x=1695490879;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LYsYBKL7opfKW/cYMt/M76aoMVek3u5WJlx3Iw4bJjk=;
 b=cIY8jAgjmlg2fol/0zhSsWYdwEr2BNzefiF2j5OA7gIXJXW8f+O1LqIH
 KKWHaqAFxny7+MuVJUhSPbnG3rpmjZ1Tya9MeSKxk8Nf5+C/h2h0vZSh2
 oLX2sj2EL7uFd4e3KIPC0Te8Zo0jotXrjOxDiDdB5mg5jGiWqSYQZUGa7
 tUbM2I8Cs+J4qg0IsFzP1vqy0huFuMboQ8Dg4ybvNcQKD2kdVW4K+5MQE
 xbV2E4AEbUIFrofObZPDTvO6RJcGC668BUYjzcItXdHqxsMfLzjrdFX3F
 l0CN3v5ts18A7yLK88234akWzWg3wJXvb/Hkf+ct0SzHQHT4su/4nFF3p A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10479"; a="300628405"
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="300628405"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 10:41:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="653476118"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 23 Sep 2022 10:41:18 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 10:41:18 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 10:41:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 23 Sep 2022 10:41:17 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 23 Sep 2022 10:40:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIVFwv5gwH4ymFKrNLvJuP++AvNt6XAx1JAqcr1yeHAcpYQlu8c/QZ2ztgD9erDtAG0dOn5XPeL3hyJgcR+r2O34aiLwYisvDw2sAonDyqZaxOsKz+7reujEdUj5bDWEVlF9UCSqvvMLsAMXsiAQ5v8wAERHx9n2sngdlkrdsBlM5FEN35ufhGTyMUiI9kFk+zB+El9q22QI7eUn+yzD10RbmjzmoDRPdkb/4lRtnO7GlfrpMbfDUjvrntyWBNL5hFHcW9heydyUzyPjyX6vuc1ekp4AVOO7Vd3zfF9n1JYXTZSsGw6liTkseAXtSsEVWvLnhAkMQ/OJLQg/zu5xLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNEhWNsbF1LM8LSB6n3gr0rhvCkLUEGHIvSnsFZ+kaE=;
 b=M8RjRojkpyfYO0g7l1XK2aqGmbLD5LkXdDrn6MNN6+gFx6XriQtnbwgvPpqlTkDWoRisnllO8mj6BZsKA9nS792rMYA3gLRb5U+aEokZzFXj0DcewaW1hbHXzRFcMFJzrSv/bmaZeoq7oLpoo3u7T4gd51kObwwTbOSNu2TK00dP791p5mol7MRsO9hJMMInsiWyLnt4zG+3pbPkCxALpvwQ474aCcoC0JL5Xe8AHdeTjX4LjoE0dWrqs6MbiZxZ00nOIBgJpLF+vpbSzNBVkST8FYoiDqAkf4Gt+udL1PVaKhCAKIgi1KatApLQ3AclasNWSOO1FZWV3BlSZnOEbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO6PR11MB5603.namprd11.prod.outlook.com (2603:10b6:5:35c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Fri, 23 Sep
 2022 17:40:55 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7246:dc8c:c81f:5a10]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7246:dc8c:c81f:5a10%3]) with mapi id 15.20.5654.020; Fri, 23 Sep 2022
 17:40:55 +0000
Date: Fri, 23 Sep 2022 10:40:53 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: Re: [Intel-gfx] [PATCH v6 1/3] drm/i915: Read graphics/media/display
 arch version from hw
Message-ID: <20220923174053.u3rydkkdfxccpbwy@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20220916014648.1310346-1-radhakrishna.sripada@intel.com>
 <20220916014648.1310346-2-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20220916014648.1310346-2-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: SJ0PR13CA0021.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO6PR11MB5603:EE_
X-MS-Office365-Filtering-Correlation-Id: 83a5c179-348a-469f-85ce-08da9d8ac479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +G1ASrlTCDDmNttFzhfUB9lK6TEh448Xs61A5TWyOhmPLAOQdOLJ2Jk86eub1/w8JFy225RwpCm+sQ1wlAKnq3Q+a1CCB0nS/wKMp4Ir7v9rTEYTID8+9mP8vXNCSjnfik0U9N1isfg15/unXVYnadumUroBZuvyqA4ZqVA5ypHtqCBW7e1zb/13duRMQpqwB5rzYqrYijvTEp6XmuwWS2SZJbbK1b5IX6wiqSgBN3Pj4sBUd87rCoEHJwC71NBXYiuqVAFB9o171YnqyeldZxlGcv0xrtf5UuA2iEmUbs/KdQNoYDLJabsSnvzytI0dXWGWkOu0CgozXhwqTh2VQhgDKJ5CClDdMbYVLolcyBiWzNu1J81Gvn93OTRNh2+LEXrmxWNc2pUZv2EhZvMwNYUBiqtZQDxUdJ9xa2WW8p31dAFgSYCv5ZFcmQkuwXcAInDw1QMSB03pUf7Nzgtr9plYJZ+iSeCg1MNrOruZb63iZVZr40Pf9BH24+4Y4OUquxcjfpASzhHK/twlHukz5rnIMAXqr0NlP4CKxcnW2Gk32I2F8xoM+jI8f1xVdBxSmIhBp92gAIvWGGt2Y8O56iwAUHuhEmKUScYbif1gmyhA89EHX6MFM822mewk8KwP2XBQFXJ727pcLayDDoErIMMyWa0rXRBxIe0DC6DgBjoF8jpl/TgZMbxk6rey+urRdOcfdDDTQ59iyUdrktYlAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(136003)(39860400002)(376002)(346002)(451199015)(66476007)(478600001)(316002)(6486002)(66556008)(450100002)(66946007)(6636002)(8676002)(4326008)(2906002)(41300700001)(26005)(6512007)(82960400001)(30864003)(5660300002)(9686003)(8936002)(6862004)(6506007)(36756003)(1076003)(186003)(83380400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EJehjZAyXps/rcz7sc4R8ftjC9PsPABkIlHDQGbLQMdMF4rc3U2hRnjcNw9m?=
 =?us-ascii?Q?JMasyz5JW5XylWzODH7TrIHR/uOXdVOa5uGtvV5a0950rFMRvyLod3kOjpec?=
 =?us-ascii?Q?3sW6pTzxoVCMulnjC4zNylp/bA/EXqOm6GiCmqX4gf70r4KhC0/DdiOyU5f2?=
 =?us-ascii?Q?0FUKRDpi4TGUvMfYMYi7LVjurRtxrjzM1h3QawdnWd1Os0wnJ/aKmyexRJfe?=
 =?us-ascii?Q?Zw8GbKjlBHpP6QbINKOBZB2mBhihRCxGB6vbEzEnBIM9834C+5wBg+amtxdW?=
 =?us-ascii?Q?jHQ5yFaIKyLUSghVMTmddOP/bdOJUGifFg7zdf5ePKEfkui1ekXytl1KDqDL?=
 =?us-ascii?Q?VCmJfHnT1IPwo6HI91mfHsZchc2cKTPbhzMLcKIbXeoVGpd5hcYCjMBFRpy5?=
 =?us-ascii?Q?NhsnDPcEyttralanyOo/InKMuoZwUr7sXFFUT/vf33pyFN0JQKEI69pBqSFL?=
 =?us-ascii?Q?gRXJNhogwzd06Lh6NcUWPaR6eLx/PLfMDrgd85TROCGgwQIPhiXBV6VWrWfM?=
 =?us-ascii?Q?Qm5bfqkQEi86LW8qvwk3K9k6BSRFuy/rhOyKMvQ34TeGqNnmAgto0hhNFRpG?=
 =?us-ascii?Q?rNYnV9tOuDXdzBJVqFiSzFOh4FgmDXEwdKkso2rzA2IiDWE3IT/dvDF/G4ee?=
 =?us-ascii?Q?kmyAN/cuzIOBCNL0mhbxrZtL2FcymWJqMygC9bhIPa5rfCmYBbR4seBg1UoB?=
 =?us-ascii?Q?imRQz1NPpSbVqB3p6VVenaSDE1JEB0e7uPNgxLF9uPzeGXS9Krg4MATvaU6J?=
 =?us-ascii?Q?rkVoUi7TAUwJHHmc2+amh8UfX4ix1gsqYXu17CUi/uuhyG++PySECiCimSaZ?=
 =?us-ascii?Q?UF47qNvWIdr4etIPxT9U+lB4gDVWGbsKX2+l5FaScIQE36AdaCCXrg2TX9Rp?=
 =?us-ascii?Q?R5lEX6HsyHeaN8R0UIC6qbwcFWFkZgYAcv4RuU02mPu8iuwIdsEeD8Z+U8pE?=
 =?us-ascii?Q?mIw7bYMLI3+75R0o9+vZcHxvafmBVm9zxIqkjYCKQJkU2ESuYY5KY8YX24KD?=
 =?us-ascii?Q?aLnpqbaNhJDV16tSrmfVce63kYVUYIKA5mI4KRdUmkDh2j5OlW5KxRPj7QE4?=
 =?us-ascii?Q?HIwstWvC2tAA6GV9kkVXUQEoHAyBnfycemnt3i7w9uCZ1JBJxGN/oXesSapU?=
 =?us-ascii?Q?Bqi8VLI8gXEqVgEC/ZY4Ygj1HkpFOF1R29tV8myeW6xhANDv4/nqs+tcv2Xr?=
 =?us-ascii?Q?lnIrWrm/Ls5rLvB/S2kNTvbyPO0tvUhQVHh7DNie7nC12Q0DCAsSGYlapncP?=
 =?us-ascii?Q?Z3Y5zge2CAqSz4n4sb0ZHesx0m9H/vVY85Z76gMevHtefABEeMoJDeKTAM0k?=
 =?us-ascii?Q?Qzz2AxLJ2qjioU45nGWOTZeuJrsNwYqT0j0Kr3fZaKsk0Rrkp5/7kIU5ewfA?=
 =?us-ascii?Q?8BT0gLUEJvAm+8NVZl1IVmr0gQs4VDPY5Ruq0jSq2Xhoy0xMg1JZoQ5OYcEA?=
 =?us-ascii?Q?ylaREv8dxrnZEjcwQtNFpg/IhyzIRkL/JoGez+rjmYor1PJHCc5w9QHRVQgX?=
 =?us-ascii?Q?ZkvI6nBEwHz51ltY7EoXwUmw1w2q0EW7AUdsghH4YXB9nl2nSKjZXkQ98WBa?=
 =?us-ascii?Q?HFXFM7/m8OyLl8FBeVS+y2c3J4eTWr10or1rOCZBVDhv0d3G9ulcIGcuD4BF?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a5c179-348a-469f-85ce-08da9d8ac479
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 17:40:55.5879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8lPRem6UriP41ftEXpzDXGQhT25xzU2IVtfVqm1MbBgdlsNqnPpTrvoIX30VqobCE9Tn21M3vGXr+NIM6ZI1pZFasWaz9M36FX/vGQFNYcY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5603
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

On Thu, Sep 15, 2022 at 06:46:46PM -0700, Radhakrishna Sripada wrote:
>From: Matt Roper <matthew.d.roper@intel.com>
>
>Going forward, the hardware teams no longer consider new platforms to
>have a "generation" in the way we've defined it for past platforms.
>Instead, each IP block (graphics, media, display) will have their own
>architecture major.minor versions and stepping ID's which should be read
>directly from a register in the MMIO space.  New hardware programming
>styles, features, and workarounds should be conditional solely on the
>architecture version, and should no longer be derived from the PCI
>device ID, revision ID, or platform-specific feature flags.

I'd just remove "New hardware programming ..." until the end, because:

1) Binding to the device will always happen by using the PCI ID.
2) I don't see us moving away from grouping them per-platform.
3) Flags may still be convenient to convey paths to take in the software
regardless of what the hardware provides.

Basically there is a new way to read the individual IP versions: we
didn't have that before and we were just hardcoding the info per
platform. And the new scheme for reading the stepping replaces what we
were reading before from PCI config space.


>
>Bspec: 63361, 64111
>
>v2:
>  - Move the IP version readout to intel_device_info.c
>  - Convert the macro into a function
>
>v3:
>  - Move subplatform init to runtime early init
>  - Cache runtime ver, release info to compare with hardware values.
>  - Use IP_VER for snaity check(MattR)
>
>v4:
>  - Minor doccumentation changes.
>  - Normalize HAS_GMD_ID macro value.(JaniN)
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>---
> drivers/gpu/drm/i915/gt/intel_gt_regs.h  |  2 +
> drivers/gpu/drm/i915/i915_driver.c       |  3 +-
> drivers/gpu/drm/i915/i915_drv.h          |  2 +
> drivers/gpu/drm/i915/i915_pci.c          |  1 +
> drivers/gpu/drm/i915/i915_reg.h          |  7 +++
> drivers/gpu/drm/i915/intel_device_info.c | 67 +++++++++++++++++++++++-
> drivers/gpu/drm/i915/intel_device_info.h | 12 ++++-
> 7 files changed, 91 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>index 2275ee47da95..2d2044f2ed9d 100644
>--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>@@ -39,6 +39,8 @@
> #define FORCEWAKE_ACK_RENDER_GEN9		_MMIO(0xd84)
> #define FORCEWAKE_ACK_MEDIA_GEN9		_MMIO(0xd88)
>
>+#define GMD_ID_GRAPHICS				_MMIO(0xd8c)
>+
> #define MCFG_MCR_SELECTOR			_MMIO(0xfd0)
> #define SF_MCR_SELECTOR				_MMIO(0xfd8)
> #define GEN8_MCR_SELECTOR			_MMIO(0xfdc)
>diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
>index c459eb362c47..e86798eaecb6 100644
>--- a/drivers/gpu/drm/i915/i915_driver.c
>+++ b/drivers/gpu/drm/i915/i915_driver.c
>@@ -337,7 +337,8 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
> 	if (i915_inject_probe_failure(dev_priv))
> 		return -ENODEV;
>
>-	intel_device_info_subplatform_init(dev_priv);
>+	intel_device_info_runtime_init_early(dev_priv);
>+
> 	intel_step_init(dev_priv);
>
> 	intel_uncore_mmio_debug_init_early(dev_priv);
>diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>index 9f9372931fd2..7034ea848d65 100644
>--- a/drivers/gpu/drm/i915/i915_drv.h
>+++ b/drivers/gpu/drm/i915/i915_drv.h
>@@ -940,6 +940,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>
> #define HAS_GMCH(dev_priv) (INTEL_INFO(dev_priv)->display.has_gmch)
>
>+#define HAS_GMD_ID(i915)	(INTEL_INFO(i915)->has_gmd_id)
>+
> #define HAS_LSPCON(dev_priv) (IS_DISPLAY_VER(dev_priv, 9, 10))
>
> #define HAS_L3_CCS_READ(i915) (INTEL_INFO(i915)->has_l3_ccs_read)
>diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
>index 77e7df21f539..cace897e1db1 100644
>--- a/drivers/gpu/drm/i915/i915_pci.c
>+++ b/drivers/gpu/drm/i915/i915_pci.c
>@@ -1143,6 +1143,7 @@ static const struct intel_device_info mtl_info = {
> 	.display.has_modular_fia = 1,
> 	.extra_gt_list = xelpmp_extra_gt,
> 	.has_flat_ccs = 0,
>+	.has_gmd_id = 1,

heh... this basically proves what I just said above ;)

> 	.has_snoop = 1,
> 	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
> 	.__runtime.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
>diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
>index 1a9bd829fc7e..acfcd155c8d0 100644
>--- a/drivers/gpu/drm/i915/i915_reg.h
>+++ b/drivers/gpu/drm/i915/i915_reg.h
>@@ -5839,6 +5839,11 @@
> #define ICL_DSSM_CDCLK_PLL_REFCLK_19_2MHz	(1 << 29)
> #define ICL_DSSM_CDCLK_PLL_REFCLK_38_4MHz	(2 << 29)
>
>+#define GMD_ID_DISPLAY				_MMIO(0x510a0)
>+#define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
>+#define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
>+#define   GMD_ID_STEP				REG_GENMASK(5, 0)
>+
> /*GEN11 chicken */
> #define _PIPEA_CHICKEN				0x70038
> #define _PIPEB_CHICKEN				0x71038
>@@ -8356,4 +8361,6 @@ enum skl_power_gate {
> #define   MTL_TRAS_MASK			REG_GENMASK(16, 8)
> #define   MTL_TRDPRE_MASK		REG_GENMASK(7, 0)
>
>+#define MTL_MEDIA_GSI_BASE		0x380000
>+
> #endif /* _I915_REG_H_ */
>diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
>index 1434dc33cf49..3464de801b67 100644
>--- a/drivers/gpu/drm/i915/intel_device_info.c
>+++ b/drivers/gpu/drm/i915/intel_device_info.c
>@@ -29,6 +29,7 @@
>
> #include "display/intel_cdclk.h"
> #include "display/intel_de.h"
>+#include "gt/intel_gt_regs.h"
> #include "intel_device_info.h"
> #include "i915_drv.h"
> #include "i915_utils.h"
>@@ -231,7 +232,7 @@ static bool find_devid(u16 id, const u16 *p, unsigned int num)
> 	return false;
> }
>
>-void intel_device_info_subplatform_init(struct drm_i915_private *i915)
>+static void intel_device_info_subplatform_init(struct drm_i915_private *i915)
> {
> 	const struct intel_device_info *info = INTEL_INFO(i915);
> 	const struct intel_runtime_info *rinfo = RUNTIME_INFO(i915);
>@@ -288,6 +289,70 @@ void intel_device_info_subplatform_init(struct drm_i915_private *i915)
> 	RUNTIME_INFO(i915)->platform_mask[pi] |= mask;
> }
>
>+static void ip_ver_read(struct drm_i915_private *i915, u32 offset, struct ip_version *ip)
>+{
>+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
>+	void __iomem *addr;
>+	u32 val;
>+	u8 ver = ip->ver;
>+	u8 rel = ip->rel;

s/ver/expected_ver/
s/rel/expected_rel/

>+
>+	addr = pci_iomap_range(pdev, 0, offset, sizeof(u32));
>+	if (drm_WARN_ON(&i915->drm, !addr))
>+		return;
>+
>+	val = ioread32(addr);
>+	pci_iounmap(pdev, addr);
>+
>+	ip->ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val);
>+	ip->rel = REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
>+	ip->step = REG_FIELD_GET(GMD_ID_STEP, val);
>+
>+	/* Sanity check against expected versions from device info */
>+	if (IP_VER(ip->ver, ip->rel) < IP_VER(ver, rel))
>+		drm_dbg(&i915->drm,
>+			"Hardware reports GMD IP version %u.%u but minimum expected is %u.%u\n",
>+			ip->ver, ip->rel, ver, rel);

slightly more useful if it says what register this is about so we know
if it's graphics, media or display

		drm_dbg(&i915->drm,
			"Hardware reports GMD IP version %u.%u (REG[0x%x] = 0x%08x) but minimum expected is %u.%u\n",
			ip->ver, ip->rel, offset, val, expected_ver, expected_rel);

>+}
>+
>+/*
>+ * Setup the graphics version for the current device.  This must be done before
>+ * any code that performs checks on GRAPHICS_VER or DISPLAY_VER, so this
>+ * function should be called very early in the driver initialization sequence.
>+ *
>+ * Regular MMIO access is not yet setup at the point this function is called so
>+ * we peek at the appropriate MMIO offset directly.  The GMD_ID register is
>+ * part of an 'always on' power well by design, so we don't need to worry about
>+ * forcewake while reading it.
>+ */
>+static void intel_ipver_early_init(struct drm_i915_private *i915)
>+{
>+	struct intel_runtime_info *runtime = RUNTIME_INFO(i915);
>+
>+	if (!HAS_GMD_ID(i915))
>+		return;
>+
>+	ip_ver_read(i915, i915_mmio_reg_offset(GMD_ID_GRAPHICS),
>+		    &runtime->graphics.ip);
>+	ip_ver_read(i915, i915_mmio_reg_offset(GMD_ID_DISPLAY),
>+		    &runtime->display.ip);
>+	ip_ver_read(i915, MTL_MEDIA_GSI_BASE + i915_mmio_reg_offset(GMD_ID_GRAPHICS),

this belongs to a GMD_ID_MEDIA macro?

#define GMD_ID_MEDIA	(MTL_MEDIA_GSI_BASE + 0xd8c)

>+		    &runtime->media.ip);
>+}
>+
>+/**
>+ * intel_device_info_runtime_init_early - initialize early runtime info
>+ * @i915: the i915 device
>+ *
>+ * Determine early intel_device_info fields at runtime. This function needs
>+ * to be called before the MMIO has been setup.
>+ */
>+void intel_device_info_runtime_init_early(struct drm_i915_private *i915)
>+{
>+	intel_ipver_early_init(i915);
>+	intel_device_info_subplatform_init(i915);
>+}
>+
> /**
>  * intel_device_info_runtime_init - initialize runtime info
>  * @dev_priv: the i915 device
>diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
>index 09b18910d3ab..e3aa88d33d63 100644
>--- a/drivers/gpu/drm/i915/intel_device_info.h
>+++ b/drivers/gpu/drm/i915/intel_device_info.h
>@@ -153,6 +153,7 @@ enum intel_ppgtt_type {
> 	func(has_4tile); \
> 	func(has_flat_ccs); \
> 	func(has_global_mocs); \
>+	func(has_gmd_id); \
> 	func(has_gt_uc); \
> 	func(has_heci_pxp); \
> 	func(has_heci_gscfi); \
>@@ -198,9 +199,18 @@ enum intel_ppgtt_type {
> struct ip_version {
> 	u8 ver;
> 	u8 rel;
>+	u8 step;
> };
>
> struct intel_runtime_info {
>+	/*
>+	 * On modern platforms, the architecture major.minor version numbers
>+	 * and stepping are read directly from the hardware rather than derived
>+	 * from the PCI device and revision ID's.
>+	 *
>+	 * Note that the hardware gives us a single "graphics" number that
>+	 * should represent render, compute, and copy behavior.
>+	 */

humn... "modern" doesn't read nice a few months/years from now. This is
already in the intel_runtime_info so it's expected that it's not
hardcoded somewhere in the ro data

I'd just make this paragrapho read like:

	/*
	 * Single "graphics" IP version that represents
	 * render, compute, and copy behavior.
	 */


A few nits above, but this is in general good to me. Feel free
to add  Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

> 	struct {
> 		struct ip_version ip;
> 	} graphics;
>@@ -309,7 +319,7 @@ struct intel_driver_caps {
>
> const char *intel_platform_name(enum intel_platform platform);
>
>-void intel_device_info_subplatform_init(struct drm_i915_private *dev_priv);
>+void intel_device_info_runtime_init_early(struct drm_i915_private *dev_priv);
> void intel_device_info_runtime_init(struct drm_i915_private *dev_priv);
>
> void intel_device_info_print(const struct intel_device_info *info,
>-- 
>2.34.1
>
