Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D145E5BE01A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 10:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D74110E428;
	Tue, 20 Sep 2022 08:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CF210E157;
 Tue, 20 Sep 2022 08:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663662729; x=1695198729;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7OfYPkIj+SpLGkXYa5qLJfehclWQ5Ii9vZ8JBQG0Mh8=;
 b=kBnqqEDzLw2d00DsBYrb11xlIjS4J2N1dm9nsnoiacezw2V/uKARc/ZE
 yw/3w7JPuc6r/5q+bvaVpTft59/cNd5sC09TSe0BT9p3T/OwluU0fRLHZ
 u+KGpcVozDLGukODs/Ks8x9vNyDBbpgOXHgg6IECjz9Xyu6A9+lOo6jdz
 sAlafnZUGh8Gasnl+cCVvX2FIpXfYmdt7frlcVhiDOmsq7vw8YgC2zsSn
 G99my3td4Ayu9jO27egD01nRnTr5SRW3bCkDgGZXdDkaatshBIcnAhqhk
 GYfRBp2wbBuR9F4b0RRXJy9PhMi3IFvI1tEUQI4nElc9DEIwh4Rv8p6LS w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="299625239"
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="299625239"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 01:32:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="618829571"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 20 Sep 2022 01:32:01 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 01:32:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 20 Sep 2022 01:32:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 20 Sep 2022 01:31:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHgX3k/vhV08Ijei5jOyTqOvEQka9scFDgIUkT1Ekz/42ndWK32elX97+e54NDMPsmKp+tl+LIVivHi92EXob4PEZS1U5uY0RUXtb4ZnzjKcxWbxFHK6eB17ebjBN4n/a5HBPpD9Nuvy9wA26Q9GRQ+1h3w8dM1mEBAWxMPx/pWTa/5TH1H+ef3RiZor6UL3YKUWxQSYk6939B1yF+X1LDpOqNXHsPOnviPUkoh7cFXlkxje+98mxSv75lz2p/0r2pyPWcI8mNyOjE6h7SSHraBtBu7ueVPsOFTHXU1dKUFwGHdOHjIvmiOXjhi+JETyz+RZqmORfPx3/BrxT8ugSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=793Ffc36UdZBQbtrP+Us1GyJVfbRQal899qhvu2UmCA=;
 b=nBxLnkSRqLcPrvxU84zHQJPTnEuL1ZDQNInPnY/c39LU/JgjPqnNPBA1hJA5AM4L4rSuFdUdArW1NgJsHC7IR3JvpV8ZPxwXQilUN3djWmzFM8lrTbdV/vC1HPZIAbjHFl47/uyCeEYdUKBspgKDEaEidg5EM9pffIdJiAd6KxxQqHtT9bFQ2sE7aVJZuETueidpV0SiE/f0qjQBRL4DWHqFE//B+zJ6r2Knb56b0SB2KChzAy7b4Egba36ybiDwcEBxTfTtb7n4Rx2hDVwIjLijCoryuR2Tpxr6aXLDvB8GUAOsrAkJPZXYBgqE6PQidbJg8puWPnLlh+0uDQYjfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6821.namprd11.prod.outlook.com (2603:10b6:806:29d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 08:31:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7b64:871c:564d:91fa]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7b64:871c:564d:91fa%6]) with mapi id 15.20.5632.019; Tue, 20 Sep 2022
 08:31:51 +0000
Date: Tue, 20 Sep 2022 01:31:49 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/mtl: enable local stolen memory
Message-ID: <20220920083149.pfgk62ugajc7trth@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20220920071940.3775059-1-aravind.iddamsetty@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20220920071940.3775059-1-aravind.iddamsetty@intel.com>
X-ClientProxiedBy: BY3PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:254::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6821:EE_
X-MS-Office365-Filtering-Correlation-Id: 6462f00a-8b3f-42fc-ab66-08da9ae290fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nmFK4mWZmghJ90FdBvRNqwgUzPYZf1Crij35EYneJFkwVDP/b8+SA7vxiWY9mjr88D3HatwUHMnin0i4D30fSeoA/ERLNMx2YVNx1hi8gDFoKEdYt+LmnnNksqHpjAUDufCuncs/5z75JL13LEq3prQvsn32r3wjSi8w1nGrfR7Pg6y5QiZRS5fmduuZQ8OeDCgEYVKksmGuR8xPGQ1VIPZdvQO/8uyU1ovorxzTOHzTEkRu+l08zwJcOeIVbPUXg9iz1Wiq0ZJOBK4qjwSr3C+8AVxpSmtOzI1Mg5M1SQhAxAmoky4OTzVW0oZABrLtyqXAZDzaBU9JARrCehwwePdUGdAH1dhr7IGhDWKQ+kf9jSsJmnUWNQHhjntRF2FQeqM4J0NQmAs/BEYCY6vgIlGW8xzfLRjCWXVUb3JAIybhTsTmd1xZDOnTZoWGjH6AHOxzlymSZRhv0BhVJUENtNgqen/UcD21cLO7NXGABqNiCyS1V5qmi8y4inalpz9mGcPRODAM7CggbL+JTKvPe2aLilcwyMmK0bNnRhfFWcm5/0xmqqOqscaUoTHcmM+lcxOYVbXiYCeSwKzDa08EtcT6XkcABzHlFmp3OdmG8bOwyroyLi2VHzvypnsYTpjv41hyuc2l0bMrvV36eIk5WA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(136003)(366004)(396003)(39860400002)(346002)(451199015)(36756003)(2906002)(38100700002)(66476007)(316002)(4326008)(8676002)(66946007)(66556008)(86362001)(82960400001)(6862004)(5660300002)(6636002)(450100002)(8936002)(83380400001)(26005)(1076003)(186003)(478600001)(9686003)(6512007)(6506007)(966005)(6486002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZuVaNYxyYFb4ScckavdDI4fEyZMI2DK6XJy5+VxTyNRxgLGKBeQC8ScJS3YO?=
 =?us-ascii?Q?ii+mg/YVWCb8BFG5FOrXHfUNAHg3h7q4QDg3nUTLHfXV1fZMohVTPvK9Qkt9?=
 =?us-ascii?Q?yBk/OV5nITyO8+GBpv8lwyggOkBh92jPb77fJgU8T9UXZ5Mzuh9dIZpRY6ot?=
 =?us-ascii?Q?1LiFoUvx7h2vDKYHqEUxBpOXSxStffIHWEAZjdAJe/CKvlvI+xeLT9C4RGtk?=
 =?us-ascii?Q?cSelrU6L3qkEyT2ipJMoWFb/bJvMBIbhFEJASIpxCUgGxZLNEzlgj1zRa4IE?=
 =?us-ascii?Q?ZbpZ6xog2ndfdNCxzHG/mCA1OmbuIHp8SNICXyo/8hP9TPsvLaDnHjTL4jQy?=
 =?us-ascii?Q?oSVq8oHU5Q4Y3ig23nVfT2jVWSwa7kEy5iBR3o9aLOE3f+Dc52ktujKTmz3O?=
 =?us-ascii?Q?GMva5rEK/ZW3t6IVDbAqBsuwDr36D01jSsWi6HnFWGsajNjG9i8fI7c1cYAQ?=
 =?us-ascii?Q?nJVYVEznVLL6TzxpeP8ALuaom8HDgU6/gTb83Ayxnq0KJ1VaW+gtHhaa4K3p?=
 =?us-ascii?Q?6G0C4EBN2one9K1g+58DI/Eyl7adHI+xPrPyaVQZjM6t+8nDm6GNQLi9bwQY?=
 =?us-ascii?Q?/5cR1kyqHbio4PvVVXNe+kje3lRn3ZgGzK9gGqos0fTmUborxl1043UXDN0m?=
 =?us-ascii?Q?Ce9j9ti54Zyey4Rw1IXwnxrKmwPBM/eqnEaKgxApfyY8XDaM3cj1synjQMZa?=
 =?us-ascii?Q?1t9TP6FPzthxhpSiz0Nwyr8YuQErOaXHIWHR+PDSR8wZyp4mOIS4e988YDhg?=
 =?us-ascii?Q?DxLg17Atvvs2+4amacUP9NPe6YFNVGHAEVbTIJl7CGELx1TaMHRZFYygAXN+?=
 =?us-ascii?Q?d2i2HKJ1Vb0T3FNwmQn176VE4HeLCV2JUcPXPPvVJ9viPcPYxAepdo7/2HNo?=
 =?us-ascii?Q?aMoZslEusj19l3NWPmbqvTxWnwXQNrCT+CQIpw7hVLyqzXeaBIMlIxXNh0q6?=
 =?us-ascii?Q?wk+bDIrS+WoMdRUd6nel2pTis92k/ov6UHSP8A6rG8keCcBXdeZM84ccRZfK?=
 =?us-ascii?Q?9hPB6dPoaffI/3n/yJwonW/CDH2GxTf9kHkhqrifmJSSWhfoJJmy8Qdli9nK?=
 =?us-ascii?Q?I+Egu9Cmh+fFoPr6ZwXsqs2LCkWfD3VNx7Ceq3ScvbEma7xFIgwWVzVafCAB?=
 =?us-ascii?Q?CtOixm2C9Oh3XsOZB21snIU2e+UMZiK3MgTdTYCTxtb7D+a/LbTOR1gAQYuT?=
 =?us-ascii?Q?KxOtqK3yeXejO1nlQLIfMGHOT4+IxaDGn5PtO3Fm5vUr6jr+LJqIXuNzYmro?=
 =?us-ascii?Q?NlcrYAFoOm7xS1d2//jna30NJlCMZhphqZezrVbU6+S9WbZ68fr1r/66twxz?=
 =?us-ascii?Q?u0/jtLVfvm4368n08q+PgTKkjga+DqE6SvqwVRuj4Tdc4OAVg5cLFkt1WFfj?=
 =?us-ascii?Q?qvHpyVtXIPCwaC1G3Ydr1vqGisH75JekhDLDEuyZSFfyKfP3wdqq3nevsi+m?=
 =?us-ascii?Q?nypMu+G8Zg5YiVbHnxDu+3T5eCt31mBJoZB15hYGCfkDTSJKlQDgbrP6hgWc?=
 =?us-ascii?Q?w6x2flNamp2ebkaU+a7E5M5BgaUSEAtSbd9MSplb7wb2If6o3dOai+J3KnzD?=
 =?us-ascii?Q?rM40C4Juo+Hm2eImnsI8Gh0EqmaSNsYBOFm8rscxKZwxjerFZxSVGOxjgysL?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6462f00a-8b3f-42fc-ab66-08da9ae290fa
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 08:31:51.3230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8sg3aW1MsWLOoIq3k+yBP+rJIv2kVehZgqllJQTwlY+evK4xGotbfj+DAPOXIaYbwdH4IM8vsT6TaTFHI8GAytW6VHHXVpEkCUA1qa8kwe0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6821
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

On Tue, Sep 20, 2022 at 12:49:40PM +0530, Aravind Iddamsetty wrote:
>As an integrated GPU, MTL does not have local memory and
>HAS_LMEM() returns false.  However the platform's stolen memory
>is presented via BAR2 (i.e., the BAR we traditionally consider
>to be the LMEM BAR) and should be managed by the driver the same
>way that local memory is on dgpu platforms (which includes
>setting the "lmem" bit on page table entries).  We use the term
>"local stolen memory" to refer to this model.
>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Signed-off-by: CQ Tang <cq.tang@intel.com>
>Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>Original-author: CQ Tang
>---
> drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 113 +++++++++++++++++----
> drivers/gpu/drm/i915/gt/intel_ggtt.c       |   2 +-
> drivers/gpu/drm/i915/i915_drv.h            |   3 +
> 3 files changed, 100 insertions(+), 18 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>index acc561c0f0aa..bad5250fb764 100644
>--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>@@ -77,6 +77,19 @@ void i915_gem_stolen_remove_node(struct drm_i915_private *i915,
> 	mutex_unlock(&i915->mm.stolen_lock);
> }
>
>+static bool is_dsm_invalid(struct drm_i915_private *i915, struct resource *dsm)
>+{
>+	if (!HAS_BAR2_SMEM_STOLEN(i915)) {

I called a similar function as is_dsm_valid() in
https://patchwork.freedesktop.org/series/108620/

sounds weird  with "invalid" and the double negation on return early
style.

>+		if (dsm->start == 0)
>+			return true;
>+	}
>+
>+	if (dsm->end <= dsm->start)
>+		return true;
>+
>+	return false;
>+}
>+
> static int i915_adjust_stolen(struct drm_i915_private *i915,
> 			      struct resource *dsm)
> {
>@@ -84,7 +97,7 @@ static int i915_adjust_stolen(struct drm_i915_private *i915,
> 	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
> 	struct resource *r;
>
>-	if (dsm->start == 0 || dsm->end <= dsm->start)
>+	if (is_dsm_invalid(i915, dsm))
> 		return -EINVAL;
>
> 	/*
>@@ -136,7 +149,7 @@ static int i915_adjust_stolen(struct drm_i915_private *i915,
> 	 * overlaps with the non-stolen system memory range, since lmem is local
> 	 * to the gpu.
> 	 */
>-	if (HAS_LMEM(i915))
>+	if (HAS_LMEM(i915) || HAS_BAR2_SMEM_STOLEN(i915))

comment above makes no sense when you add this.  For this specific case
it's still system memory, reserved by the BIOS and that we access by
mapping the lmembar

> 		return 0;
>
> 	/*
>@@ -371,8 +384,6 @@ static void icl_get_stolen_reserved(struct drm_i915_private *i915,
>
> 	drm_dbg(&i915->drm, "GEN6_STOLEN_RESERVED = 0x%016llx\n", reg_val);
>
>-	*base = reg_val & GEN11_STOLEN_RESERVED_ADDR_MASK;
>-
> 	switch (reg_val & GEN8_STOLEN_RESERVED_SIZE_MASK) {
> 	case GEN8_STOLEN_RESERVED_1M:
> 		*size = 1024 * 1024;
>@@ -390,6 +401,12 @@ static void icl_get_stolen_reserved(struct drm_i915_private *i915,
> 		*size = 8 * 1024 * 1024;
> 		MISSING_CASE(reg_val & GEN8_STOLEN_RESERVED_SIZE_MASK);
> 	}
>+
>+	if ((GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70)) && !IS_DGFX(i915))
>+		/* the base is initialized to stolen top so subtract size to get base */
>+		*base -= *size;

that doesn't necessarily holds true.  According to the spec the wopcm
base is 1MB aligned so even if it is "at the top", it may not mean it is at the
very very top that we can just subtract the size.


>+	else
>+		*base = reg_val & GEN11_STOLEN_RESERVED_ADDR_MASK;
> }
>
> static int i915_gem_init_stolen(struct intel_memory_region *mem)
>@@ -423,8 +440,7 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
> 	if (i915_adjust_stolen(i915, &i915->dsm))
> 		return 0;
>
>-	GEM_BUG_ON(i915->dsm.start == 0);
>-	GEM_BUG_ON(i915->dsm.end <= i915->dsm.start);
>+	GEM_BUG_ON(is_dsm_invalid(i915, &i915->dsm));
>
> 	stolen_top = i915->dsm.end + 1;
> 	reserved_base = stolen_top;
>@@ -796,6 +812,46 @@ static const struct intel_memory_region_ops i915_region_stolen_lmem_ops = {
> 	.init_object = _i915_gem_object_stolen_init,
> };
>
>+static int get_mtl_gms_size(struct intel_uncore *uncore)
>+{
>+	u16 ggc, gms;
>+
>+	ggc = intel_uncore_read16(uncore, _MMIO(0x108040));

??

>+
>+	/* check GGMS, should be fixed 0x3 (8MB) */
>+	if ((ggc & 0xc0) != 0xc0)
>+		return -EIO;
>+
>+	/* return valid GMS value, -EIO if invalid */
>+	gms = ggc >> 8;
>+	switch (gms) {
>+	case 0x0 ... 0x10:
>+		return gms * 32;
>+	case 0x20:
>+		return 1024;
>+	case 0x30:
>+		return 1536;
>+	case 0x40:
>+		return 2048;
>+	case 0xf0 ... 0xfe:
>+		return (gms - 0xf0 + 1) * 4;
>+	default:
>+		return -EIO;
>+	}
>+}
>+
>+static inline bool lmembar_is_igpu_stolen(struct drm_i915_private *i915)

doesn't deserve an inline. lmembar_is_igpu_stolen() doesn't make much
sense as the lmembar is never igpu stolen.... you probably mean
something else here

>+{
>+	u32 regions = RUNTIME_INFO(i915)->memory_regions;
>+
>+	if (regions & REGION_LMEM)
>+		return false;
>+
>+	drm_WARN_ON(&i915->drm, (regions & REGION_STOLEN_LMEM) == 0);
>+
>+	return true;
>+}
>+
> struct intel_memory_region *
> i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
> 			   u16 instance)
>@@ -806,19 +862,16 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
> 	struct intel_memory_region *mem;
> 	resource_size_t io_start, io_size;
> 	resource_size_t min_page_size;
>+	int ret;
>
> 	if (WARN_ON_ONCE(instance))
> 		return ERR_PTR(-ENODEV);
>
>-	if (!i915_pci_resource_valid(pdev, GEN12_LMEM_BAR))
>+	if (!i915_pci_resource_valid(pdev, GFXMEM_BAR))

at least for MTL, Bspec 63830 still calls this lmembar. So the rename
for me is a net loss

> 		return ERR_PTR(-ENXIO);
>
>-	/* Use DSM base address instead for stolen memory */
>-	dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE);
>-	if (IS_DG1(uncore->i915)) {
>-		lmem_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
>-		if (WARN_ON(lmem_size < dsm_base))
>-			return ERR_PTR(-ENODEV);
>+	if (lmembar_is_igpu_stolen(i915) || IS_DG1(i915)) {
>+		lmem_size = pci_resource_len(pdev, GFXMEM_BAR);

this looks confusing, but apparently correct. For DG1 the stolen is
on top of lmem. For MTL, it's on the end of lmembar (256M). This works
because on DG1 aperture == lmem size.

> 	} else {
> 		resource_size_t lmem_range;
>
>@@ -827,13 +880,39 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
> 		lmem_size *= SZ_1G;
> 	}
>
>-	dsm_size = lmem_size - dsm_base;
>-	if (pci_resource_len(pdev, GEN12_LMEM_BAR) < lmem_size) {
>+	if (HAS_BAR2_SMEM_STOLEN(i915)) {
>+		/*
>+		 * MTL dsm size is in GGC register, not the bar size.

it's not exclusive to MTL. it has been there for ages and it was never
the BAR size like this comment says. Or at least it doesn't match the
else condition that is using the GEN12_DSMBASE register

>+		 * also MTL uses offset to DSMBASE in ptes, so i915
>+		 * uses dsm_base = 0 to setup stolen region.
>+		 */
>+		ret = get_mtl_gms_size(uncore);
>+		if (ret < 0) {
>+			drm_err(&i915->drm, "invalid MTL GGC register setting\n");
>+			return ERR_PTR(ret);
>+		}
>+
>+		dsm_base = 0;

if we stop handling part of the values in the registers as relative to
the mapping and rather handle them as we read from the registers
(physical addresses), the size calculations should still match and we
shouldn't need all the if/else dance. If we pass the right io_start we
can then make them relative to the mapping by subtracting it, or if we
don't want GTT to be in the mapping we subtract it.

That makes me wonder if choosing the i915_gem_stolen_lmem_setup() for
all of this is even the right choice given we are actually talking about
system memory that is mapped through the lmembar.

>+		dsm_size = (resource_size_t)(ret * SZ_1M);
>+
>+		GEM_BUG_ON(pci_resource_len(pdev, GFXMEM_BAR) != 256 * SZ_1M);
>+		GEM_BUG_ON((dsm_size + 8 * SZ_1M) > lmem_size);
>+	} else {
>+		/* Use DSM base address instead for stolen memory */
>+		dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE);
>+		if (WARN_ON(lmem_size < dsm_base))
>+			return ERR_PTR(-ENODEV);
>+		dsm_size = lmem_size - dsm_base;
>+	}
>+
>+	io_size = dsm_size;
>+	if (pci_resource_len(pdev, GFXMEM_BAR) < dsm_size) {
> 		io_start = 0;
> 		io_size = 0;
>+	} else if (HAS_BAR2_SMEM_STOLEN(i915)) {
>+		io_start = pci_resource_start(pdev, GFXMEM_BAR) + 8 * SZ_1M;

should be the GGSM?


Lucas De Marchi

> 	} else {
>-		io_start = pci_resource_start(pdev, GEN12_LMEM_BAR) + dsm_base;
>-		io_size = dsm_size;
>+		io_start = pci_resource_start(pdev, GFXMEM_BAR) + dsm_base;
> 	}
>
> 	min_page_size = HAS_64K_PAGES(i915) ? I915_GTT_PAGE_SIZE_64K :
>diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>index 30cf5c3369d9..b31fe0fb013f 100644
>--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>@@ -931,7 +931,7 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
> 	unsigned int size;
> 	u16 snb_gmch_ctl;
>
>-	if (!HAS_LMEM(i915)) {
>+	if (!HAS_LMEM(i915) && !HAS_BAR2_SMEM_STOLEN(i915)) {
> 		if (!i915_pci_resource_valid(pdev, GTT_APERTURE_BAR))
> 			return -ENXIO;
>
>diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>index 134fc1621821..ef3120322077 100644
>--- a/drivers/gpu/drm/i915/i915_drv.h
>+++ b/drivers/gpu/drm/i915/i915_drv.h
>@@ -973,6 +973,9 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>
> #define HAS_ONE_EU_PER_FUSE_BIT(i915)	(INTEL_INFO(i915)->has_one_eu_per_fuse_bit)
>
>+#define HAS_BAR2_SMEM_STOLEN(i915) (!HAS_LMEM(i915) && \
>+				    GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
>+
> /* intel_device_info.c */
> static inline struct intel_device_info *
> mkwrite_device_info(struct drm_i915_private *dev_priv)
>-- 
>2.25.1
>
