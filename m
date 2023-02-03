Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A8A68A251
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 19:56:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41AED10E86E;
	Fri,  3 Feb 2023 18:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB6510E0B1;
 Fri,  3 Feb 2023 18:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675450591; x=1706986591;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CDIInXxeq+fgHSGeO9DeqddgSZJHiVFtXCy8t3RFVnI=;
 b=IFb8u8IiQSm6bHxrrWAEYyd3whSAR+OCmAKPMmb2iT9dXi/p+uV8CThF
 9LAR5Wv6fbmjLcDRirJ/AKaoVf0twdKMOj5aXR4Bjh89i7EBmv4FL738T
 zpZuyLKpuJE83I69kDqiZWHrSPxKuxEYY8o+enGXseJhgUScS/BcuR4Pc
 6Ci3smUU1B5pwenaf88VO2xJyFdDUaSdRfq3v7mTmOmYKUfvl+81oFZg/
 FBCW/OK0JESTnu1G88DZbBJhyaB0jmZTWv8Yw75Upv0xMxbPHjdcAvXu6
 lgIKdRR7DNAqHytx7MzQf+GeO446SJ7TK8uQfmrYOt2AnfG3Uyjpnfo/3 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="330952856"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="330952856"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 10:56:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="615806109"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="615806109"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 03 Feb 2023 10:56:31 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 10:56:30 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 10:56:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 10:56:29 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 10:56:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SAhxKmEvfcwA9z/6micmBR80mKFCcfShcIw3JfYradgJW8Sz6ep/HuRAnUtOzxsf2hM5hpWn0KjkLOTMOvDW6sawybbfcw3gVxisSnaO3JSmDA5NbPzQgmPq7PbdUoUsc1fLKye6KCOJwHmHLoajcvfKrSJSxe+R/YQgpF09HGg/08e4gCISGEaMPLxX6urqxG4IhFMk7WLnlnEhvbhkfi05bVbmf4KsdxZU+N+TzMjSfQ9/iVJzo8FWc4u9Q6N6/QPIXBNQLEV9yfbQMxzP1J6J1yf6H/sx686jSJsAgEPmmKZXnVY9lyvQNeIuQ4jW8y40TeEFDKYWRmP+3xayCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/CMr7tpp8WeL8ZuqVsry2UwfoOMMD/KJdAZ6ybfstbE=;
 b=F5tRpLwRKltDQCi7fzlM2yDl31Zd7zGSEM4AvFW7xrQcYrJE35E+qQdTl7x90Nxt2LTucFDMRYRqgE0bJY8PVC9W6uJGn/9VgBxukk21QFuMsQv4OXVst880tgUfCNj0iAT0y6Qi0K55drCOiwkyQOfqOAVgIiI9uiD1TJJQFA+j/aeJqOSEkn+JZlPy7z7HRT5AFgLI+NzOljRVZTnwM8IuTAaUl/26VHRLt1h+ow4NSJ9aKHLzP7u0AjSw37G79Ns3fktzUb2RvfChINILodJHkxlu/F+IzcNsFfC3GPPhN7I2X3ipw72CGaypCDl2YJ03JNirPEPrd+udgBgxpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7341.namprd11.prod.outlook.com (2603:10b6:208:426::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.31; Fri, 3 Feb
 2023 18:56:27 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a%7]) with mapi id 15.20.6064.031; Fri, 3 Feb 2023
 18:56:27 +0000
Date: Fri, 3 Feb 2023 10:56:25 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/i915: Make sure dsm_size has correct granularity
Message-ID: <20230203185625.zdihasbypgb2jb76@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20230202180243.23637-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230202180243.23637-1-nirmoy.das@intel.com>
X-ClientProxiedBy: MW4PR04CA0294.namprd04.prod.outlook.com
 (2603:10b6:303:89::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7341:EE_
X-MS-Office365-Filtering-Correlation-Id: f0d5aaf1-7673-40c0-5b37-08db06185ac8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZnUXzs84PZf8hix46z5JYKAB6pvDqNeBZK5wjVeR4JMXfHYDnR9cTLGcPI3uYQPoERZpc3rYhJqEHRfxJNu7WNnXKHL2kIBXK9qkFKdKf6LmN1ufI7Eue2iI88SMXy2USfq0JN6dhw3NszWwlSiIbVzlaPQWDqYygnr4gAz7yPuKW85etP4DOBjYoijXHNSJwg62OrVlF79X+23k0KyyL+qUGe2y9I9zyKncqZ2DhfjjHgXLvCnuNYPAhE3lRYb8zyOxh1aYRLfVjIwAqHXoHELsM5AWbcWpKs6LPJsncMHX5pCcc5DTa9fRuepO76LQ99PyhqxP0db4oP5WoAGbemuQKQDq6nwVI09aLy/f+XsQuyc9w6OuCg36jTMwCK1FmAkmN/IH1c4BAGfdQNCqvUGo0qwzWpkCqmxYativQO4khfHktI7vvTHWRyMF3CYVetLFjdsY9qaZJhQLTmjTIJjIF8wZDZ8eX9CUfLaEC6Nxji/kIa54CoEhT7ZXv2FinOwMlyx8z9AKvdMFXGZL5L7//jl+oFokkBs+NtMKnuJiT5GKDtIelNRwHzqWmDI3eGVd9iZ8AkHOd/zStCDIWxx+8dZ5lUt1O2Tb5MALEEvOvImKZeg/y5sL8qFtOAOsUlpIbLpuk4/nSO8tvoA7BA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(376002)(346002)(396003)(366004)(136003)(39860400002)(451199018)(33716001)(26005)(9686003)(6512007)(82960400001)(6506007)(186003)(2906002)(1076003)(6486002)(38100700002)(6636002)(66556008)(66476007)(450100002)(66946007)(4326008)(83380400001)(8936002)(41300700001)(54906003)(478600001)(5660300002)(8676002)(86362001)(316002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qa9wH+kQTljXL9PXDKfDD1+l/kEVWTZ4Du2H1EVr0c5gPsCvRtuY2Pal5KNF?=
 =?us-ascii?Q?YlRrGpm3y10foQVI0wgwwOWkZ69mnWOA/QYnuKHPoACwWY3/HxDQSgAlMfZ/?=
 =?us-ascii?Q?ktfkW+DrK/7hGPZL1hKkdjnOCDjGiFC2iALz77h2QHfc6IlgNOQx6reCGDJa?=
 =?us-ascii?Q?3TLLBritZaaQv186NUxQkFS4/bNF5A68SfEPskxWm9um0iTZjheLadSo3ES1?=
 =?us-ascii?Q?+LnPAc0P/if1wAiZllK+1THz4udbi1mvzgT9qKcU7qgSJFg3WsLaAgqFysfm?=
 =?us-ascii?Q?FVfyHFICGj+u8ewkY1+y/2SSKUz7URYLkrOPxF6RPrryKVLBRfHsJznFka1e?=
 =?us-ascii?Q?80GY6UVyBs8FxTXagu5ABp1V780l66000tqjwlkobLP9AokPmO0Vbi+Bh0ne?=
 =?us-ascii?Q?utUDbpNyNnkjZS4yjkKZWC+4v2GNskZjUVtK5g1jzAxUpPrRIZdHrpFGkxyk?=
 =?us-ascii?Q?0stslKpkyCcN60SPlTZpVAxd66TBaOsfUDx4ld2EoRp7Ck8C5da81otqsqb/?=
 =?us-ascii?Q?IOcNibQn6F59eLmbZT3KmU+1GFrlNzaXVBBr96NJgt2XeisFcTykN328Bogf?=
 =?us-ascii?Q?oDu+St+GdwYw1vVLeT0aQNbXpixqsKSGHTJZBEqMldSKuyzQwJVDu95YZmNF?=
 =?us-ascii?Q?Itu/8LwQrq7pYLg+dK0aV4reQL6QmrWlA7i7rvleMBq88E1IjQiHU/whu9dA?=
 =?us-ascii?Q?rGxBmvtRUNLCWT1YQlaost1gZlE/6s7OPkkcOofmVaMyob6w0BRLr86bk/3Y?=
 =?us-ascii?Q?/jbmqIh9jUGOWnXRYM8tSJJGlIvqeMCh8+sUhN4NY1mkkOmc0Yb9hylIDTj6?=
 =?us-ascii?Q?0ZHgctuhTwOYNKi1GUCP2gPAPnjYoSd7NxL8j/pEDSKv7MKTWx9mPTNhXqNX?=
 =?us-ascii?Q?1K94am4bvq26PQ41quKi8u8InzAukZc4mw2e5jM/hAiTaBjNIoHylR9GNcji?=
 =?us-ascii?Q?uRh1C7KGptFNuyRTZkzlmPrHUPl1smMx7zP+/P1UBaUwzEwbVYmzCP8vrx8/?=
 =?us-ascii?Q?Y9DYby7bFvSfQ8uyIr4onuACiBmOetU7v9ffG+QqP0wY5TOo+5XmWEdDaj60?=
 =?us-ascii?Q?WPoX9t5flqPmjiID6kRMEWAyoUM0VpIaWG6iPgCCWnblSTw9nZfzp4UNJyT2?=
 =?us-ascii?Q?DI5SbY+G1beM3H07zuFyV4GQ1NtkIy105SMQhYnPbTeIhu/+a8ndb11YQuJ0?=
 =?us-ascii?Q?enzwoKNy3MGtMxJUDBUL52knT3yW5Vwg1CjCPuSi/J5KOt/YF7pGs2wxrVVr?=
 =?us-ascii?Q?Ai9GzAnDRW0SO87SDOyGCB95VVq48lH6kPkf45W/xoakEMp8/MftfJ09jmuB?=
 =?us-ascii?Q?DC7P8zXOfRo8nNp3zktZ0hkErNxHYA4lC+MgFM67HMMHAuQ8mvMO/T9Nzprd?=
 =?us-ascii?Q?LsD8iKLYI5bppo/V9rJguY/Lyqk9/dP2u7nL6MhVtg7FZYFbcUWH2bJvy6Kv?=
 =?us-ascii?Q?/AD4C3Csa2/5cABeikxR5aHa4uExFTChHMPDyEuqg0C/KuRK4FU40f8BcI18?=
 =?us-ascii?Q?OXezGarnXWG1V3b6TK+22xULStgZnYWaS63Te8ygieJuDbUzkq8MjXUhHspW?=
 =?us-ascii?Q?oFYoGXIIgrHiL4ThlWOn+2bqqefaZXk46/SSV02XE3/9f9UjwsUHvi/A5U6c?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0d5aaf1-7673-40c0-5b37-08db06185ac8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 18:56:27.6850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LAve74PtENJtZ5p6BJCuM64e0KkWVjrrny18OqUdiJG09Cj82JkttxGb+H7sc4E6x4VsXrjlaOQwRSY/HHvMPH0r76zwiQZZVEQebPNkD5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7341
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 02, 2023 at 07:02:43PM +0100, Nirmoy Das wrote:
>DSM granularity is 1MB so make sure we stick to that.

I think we need to be a bit more verbose here, because in future we may
need to refer to this commit if/when things change (e.g. the granularity
or the additional size needed on top of DSM).

The issue this is fixing is that the address set by firmware in GEN12_DSMBASE
and read here doesn't mean "anything above it until the of lmem is part of DSM".
There may be a few KB that is not part of DSM. How large is that space
is platform-dependent, but since it's always less than the DSM
granularity, it can be simplified by simply aligning the size like
is done here.

>
>v2: replace "1 * SZ_1M" with SZ_1M (Andrzej).
>
>Cc: Matthew Auld <matthew.auld@intel.com>
>Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Are you ok with me amending the commit message and applying?

After this patch I think you can follow the process to request committer
access.

Lucas De Marchi

>---
> drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>index 90a967374b1a..d8e06e783e30 100644
>--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>@@ -909,7 +909,7 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
> 		dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE) & GEN12_BDSM_MASK;
> 		if (WARN_ON(lmem_size < dsm_base))
> 			return ERR_PTR(-ENODEV);
>-		dsm_size = lmem_size - dsm_base;
>+		dsm_size = ALIGN_DOWN(lmem_size - dsm_base, SZ_1M);
> 	}
>
> 	io_size = dsm_size;
>-- 
>2.39.0
>
