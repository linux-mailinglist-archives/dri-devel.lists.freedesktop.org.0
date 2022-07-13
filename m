Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C90573F6E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 00:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C030A10FFA6;
	Wed, 13 Jul 2022 22:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FC610EA90;
 Wed, 13 Jul 2022 22:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657750113; x=1689286113;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QgxXkO69j3K2W/qsSQ/5JiuAHm8lgV8h9Ld96beQ06Y=;
 b=I/bvBiQQOKWtESaIEqEjfupqvtFDq2zwXxobnFq08+LiTrKuqsYrTQB+
 wZTFmMY55fmXIM8F7bH7/Kr6Uz2T2yLczgtAEvwPx/+GqB77Fz8Q7zL3v
 LnvAlD3oCh5UPFT4FrLk7n6rxgWmNQPxSK3moOowFET94+Mw3J4BmbXkg
 1/10N3Qdz+8e7bfXAy9o2VURiIqG0nbwzZyZ6Okrx3zGAAfhemq3mkXgX
 +CoMRBnz9wxqx/qrnVh8B02zZECMny3W6rXVRsRZFXFDdSNIG+Sb9h9J/
 8TXTzg4+AydLb6p1i2//VXPgfcd/MK1xKjuG2c1CNjnIbj9k2mXzQDNEV Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="286495774"
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="286495774"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 15:08:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="653594872"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 13 Jul 2022 15:08:30 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Jul 2022 15:08:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 13 Jul 2022 15:08:30 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 13 Jul 2022 15:08:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSmoY0S7lmocI937bTWjJ0ivTwAb9gTwNNteegupmGi5Hrnme2Mh3MXt9kNVbujLewZ8qNX+VBb+DJTkhKJlq+PZEhWXV721dxZB8JL4q/CvgzSUrLdOgz+bbXiJfnCCmF+9AYs2ehK7tPmJqOV4y5PZ8MuVeu4100JkRo1jYfH33+51yr0WRbj9EQOI0cKNaQkM/kYdqDhvJW7OI+Ny2J5up7ctnBLv9FiXsGFF4fYiOT8VQb7SZSr4T7+GIOXMlt3FbkRlpa7ay8ZDNMBHh/KjSS4hc698mC6A5j56PrAwz/UL6WM8Thrlg+xtcjndODSDHAQGD11ELxO99Ju9Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nd/aeUFOMU4dCEXbJetXxB0106Im7iYEAOg4DfIx4/Q=;
 b=lvDrITQdlOgbAbZ+PL8xsUG6Bf8FdAlazDQ26FHnRzoFVGH7PETGFE+7xpU8J9ZrA8Cjw9Co9OI824uAYwB/9AtYvGxUyzTbZO9DuCORFFRkMyp7pKS1k2rnflJKEywq3vZ4RkSZkLXTnupoibZrwKy04eY9gQ1ILDhfSzRVIyNj1ey+acTiVu5Zxe7KhxvFEwxyB2qQBCPDd4ffpMOKV7WnqLQkMlmvv7WHeLCQWGys06ngOX/+RdNenguHtKkw6nMdxb96nXzyTqfzcd7REG3y9bpJcPFOrPDqq6/SZgF+eRVz2t7jJuH5Z5yb6hdfpX9un49xr6YmiDYBY8lQ/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Wed, 13 Jul
 2022 22:08:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 22:08:28 +0000
Date: Wed, 13 Jul 2022 18:08:24 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 07/39] drm/i915: gvt: fix kernel-doc trivial warnings
Message-ID: <Ys9CWElnKJknLVDb@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <375c0c0ca2ef414f25e14f274457f77373a9268d.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <375c0c0ca2ef414f25e14f274457f77373a9268d.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: BYAPR05CA0076.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e712852b-cd9b-411d-fdc9-08da651c36fe
X-MS-TrafficTypeDiagnostic: CY5PR11MB6211:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MBU2z/XMs3VpXupd40ejNEXJOAGvqZbukYug6YzQvbmmM3Wo22HuT5icdvVgVKGoEcf5tyMAmgMJlmSzaC9SkBZksf51xAkPGmr0nl/vMojzhrIDvlKlnTqkUZ/8Nbdp612q6+LrEGfxFfxJo2S2oHNf8q7l4c/aQbHfyw0Npdm9dvUxcPXqwPf+EO+pfFDrjdeE1mzCBnc/Fl5njUixCsGiVOjLKINTerm+dXsEMRv6D9l3GXhEWEf/AQ+kSXIZa2Q9B/CoypF/ai/GsMcIyeHAaWeHGbKH7AVbCoWu5D/QOit0oZJiag8GCoir5n4zVwjRaf7A8v80+8x34rH9G0depM2mV3JOKeYHD53CQvnZU/TUxAazic+cpY94QqWQBSGchLHIdO/V1ePE9OlRa4659dHlWOjPGGXTW1kXFdNK6qvOykmKiiwd/vkkJvEMcx4eYrvfJdZdEr3fK3nsYqSdxXDlS1DLoIrr4FUe3giCyf2xdjf/R+gWaQ7xKs5FhX98Qw+3aFBs7dFi/X7SmyX8Ovtw45PZILFO8ba2XvrqbhZMLL19u+T10P774CJgqPhjFWQGfH3SWBEr2hL+g1D7fSK76GUNw73mXNma7OZzdaQP3vheJ8Vsp/ggSPGMlKiBwtvrzzCZy+5L6jGA0m6xCasuSVcue7Lcnm7whPv0coQfRWvSbRDJHMtJlstnq8vGGl2U5woFfBn2MCJfDF3IvpmEmb+2Px5VwBjCe1kJ9M+Fytj+cq6vWg9CyXGH7oXjFkHkh+4hf3axIU09ralR7D/gn4fBGsnYYjnQYV8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(376002)(396003)(39860400002)(346002)(136003)(54906003)(66556008)(38100700002)(6486002)(2616005)(66476007)(2906002)(478600001)(966005)(41300700001)(5660300002)(6666004)(66946007)(44832011)(186003)(8676002)(36756003)(8936002)(6506007)(6512007)(83380400001)(26005)(82960400001)(316002)(4326008)(86362001)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5oCKSlKu0SJWQmKKVP/gH423yZZopOV6NRUhlbcqyIhzjmGgRXLcFejFSa51?=
 =?us-ascii?Q?982+usLWcqxQx0E2a+0OMQ+aO61R4TLLROycWIMdtk13D+UsqoOX7lP1UHsY?=
 =?us-ascii?Q?gPbt01GjaXwXWw033+UorRhsNKTCrlFXlLCCa6Uz/F9qPdFCE4JZjDRUMmt1?=
 =?us-ascii?Q?NEbGX98/X+VKtw9dGef8c/OzDYNIToohVOXS9fBbkNEq2gVLrODamy6EiOxt?=
 =?us-ascii?Q?6feU90i7YR0hV8wWrfn74/Go1FvcBD8GCGDkFp0iRF7THCMCxC/loTW/Z3UI?=
 =?us-ascii?Q?YEDXIWJq8yaw2yj1XC5sObgfgdEUHxGTcY8PX0F92YLtUN5q/q55jAgDDshA?=
 =?us-ascii?Q?3zttx0J/gQeXRDZ0CtCDSgQuxvTlOqD0d8JonXtrytBennaomLMC0KDv1KLP?=
 =?us-ascii?Q?vKxLdCbkHJ2mGq0cYc910bKFlBAOHnOWwBtEfTzxqU0hqgqEUa18A7cWqy6q?=
 =?us-ascii?Q?ZHBa04kDgDlJtTjOmQxQHP8NP37zoOCd1kAWzftfFbA7yMTjbbAnhKTtGQ+s?=
 =?us-ascii?Q?ILZHzK5uMGjTItsEwGdrY79KlJ6DlGnddW76FeRlTGUFG4k6rzXjoxGx+YuW?=
 =?us-ascii?Q?CYHCVO44/v22tIvpsG1s4Ym9oR9KM/L7IOywH29U6fL1wfNVkNZeW6IcN7BY?=
 =?us-ascii?Q?+q1+xVD0N17VyhzuO2YXpIFhaeHuRGuWlnE+I54F0U+9XJpwabrA+xw9nxYm?=
 =?us-ascii?Q?kC10YiP5k4Qn0yU/mte5VOKSBVrgoPXT+Hs6zFylr8LU+T9+3EhPTroTN7m8?=
 =?us-ascii?Q?MAIf+/4adpj/Dp5kUtvtkDVgXdlwRDpS4IzIeghWCM00dIiQTGERAVQhVq3h?=
 =?us-ascii?Q?5tK/Fxc3+n5TGdZOkzasfLJIa4iaE2Naihw5XFvd+ERlEOu87XG8keHpDpTf?=
 =?us-ascii?Q?wS8/HGgGKEdRKWdhc0Hnj5l2O1fbJym6KPF++6YEqTJ9gtlvw3I8n7muXyl8?=
 =?us-ascii?Q?em4To77ZdH/pBfKOl7lfwN5KLpcNgkwJFzrly4tqxRf5I1Tru74LlbifUuiY?=
 =?us-ascii?Q?YBIYajoCZ1sKCdMzGdvQGOahUJNoBnNdSPUCk4gAjP8SqSPM/JYgjOgafvNr?=
 =?us-ascii?Q?E+9IinGRirDrlW4DrBGwEwYQTmPkWXNGgRXApu9QT/nIvPE43V/7HuWA2aOE?=
 =?us-ascii?Q?ugDSntGco+gFs4Pr1H+kZcgzvxTwsKj7AIgRfg8yIhAtSJ7733jhjEa0PLhX?=
 =?us-ascii?Q?RBnjIcQetiOTMCTKxRnroYD+HY/IlcIUY9EyiNYpOpvIR1TzSMgVqn6NejBr?=
 =?us-ascii?Q?D1lHY3u1pVhy3L+6c3KHb7PpN5QwHBBv7Lvo1bcddBuPnzG2eQqqSh0ttV8q?=
 =?us-ascii?Q?TcCNVC9sbvbWe8sOjFaKovtU8XY/Y6jZ/IU6BE0c0V4oFTb8Oj9g3PXlDOpG?=
 =?us-ascii?Q?yhJ/2r6yTrQ3OTuTFWXscNFWkko/qTok8mx0E+mXtUNlX3quRqCxkMncSxzu?=
 =?us-ascii?Q?GDD5DvUAu0tUdgi7lKb9pAImcPczl4eEsPMfSCg7soE8q6JwjUyPAg3fkTkv?=
 =?us-ascii?Q?xbL/xCbdTXaGGAdrUrkbnlJHD7VIuXhIRjCKRGk+jHSioIW5fTDr0Ecr6d6Y?=
 =?us-ascii?Q?gESN1Wf7YINDU78ulKsJw8P6CDsxv3lLAuLW27XNufya7gjjhmXuz/OkUK6/?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e712852b-cd9b-411d-fdc9-08da651c36fe
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 22:08:28.5485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zGSA6LR+Wf1k4A0p4xKjtFKVcDS1ksXp5umCfpxMCkEUIv06xOW+MJJYiR9Lj2zVJJSsFooaA3SRKeVZByAD9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6211
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
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 09:11:55AM +0100, Mauro Carvalho Chehab wrote:
> Some functions seem to have been renamed without updating the kernel-doc
> markup causing warnings. Also, struct intel_vgpu_dmabuf_obj is not
> properly documented, but has a kerneld-doc markup.
> 
> Fix those warnings:
> 	drivers/gpu/drm/i915/gvt/aperture_gm.c:308: warning: expecting prototype for inte_gvt_free_vgpu_resource(). Prototype was for intel_vgpu_free_resource() instead
> 	drivers/gpu/drm/i915/gvt/aperture_gm.c:344: warning: expecting prototype for intel_alloc_vgpu_resource(). Prototype was for intel_vgpu_alloc_resource() instead
> 	drivers/gpu/drm/i915/gvt/cfg_space.c:257: warning: expecting prototype for intel_vgpu_emulate_cfg_read(). Prototype was for intel_vgpu_emulate_cfg_write() instead
> 	drivers/gpu/drm/i915/gvt/dmabuf.h:61: warning: Function parameter or member 'vgpu' not described in 'intel_vgpu_dmabuf_obj'
> 	drivers/gpu/drm/i915/gvt/dmabuf.h:61: warning: Function parameter or member 'info' not described in 'intel_vgpu_dmabuf_obj'
> 	drivers/gpu/drm/i915/gvt/dmabuf.h:61: warning: Function parameter or member 'dmabuf_id' not described in 'intel_vgpu_dmabuf_obj'
> 	drivers/gpu/drm/i915/gvt/dmabuf.h:61: warning: Function parameter or member 'kref' not described in 'intel_vgpu_dmabuf_obj'
> 	drivers/gpu/drm/i915/gvt/dmabuf.h:61: warning: Function parameter or member 'initref' not described in 'intel_vgpu_dmabuf_obj'
> 	drivers/gpu/drm/i915/gvt/dmabuf.h:61: warning: Function parameter or member 'list' not described in 'intel_vgpu_dmabuf_obj'
> 	drivers/gpu/drm/i915/gvt/handlers.c:3066: warning: expecting prototype for intel_t_default_mmio_write(). Prototype was for intel_vgpu_default_mmio_write() instead
> 	drivers/gpu/drm/i915/gvt/mmio_context.c:560: warning: expecting prototype for intel_gvt_switch_render_mmio(). Prototype was for intel_gvt_switch_mmio() instead
> 	drivers/gpu/drm/i915/gvt/page_track.c:131: warning: expecting prototype for intel_vgpu_enable_page_track(). Prototype was for intel_vgpu_disable_page_track() instead
> 	drivers/gpu/drm/i915/gvt/vgpu.c:215: warning: expecting prototype for intel_gvt_active_vgpu(). Prototype was for intel_gvt_activate_vgpu() instead
> 	drivers/gpu/drm/i915/gvt/vgpu.c:230: warning: expecting prototype for intel_gvt_deactive_vgpu(). Prototype was for intel_gvt_deactivate_vgpu() instead
> 	drivers/gpu/drm/i915/gvt/vgpu.c:358: warning: expecting prototype for intel_gvt_destroy_vgpu(). Prototype was for intel_gvt_destroy_idle_vgpu() instead
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  drivers/gpu/drm/i915/gvt/cfg_space.c  | 2 +-
>  drivers/gpu/drm/i915/gvt/dmabuf.h     | 2 +-
>  drivers/gpu/drm/i915/gvt/page_track.c | 2 +-
>  drivers/gpu/drm/i915/gvt/vgpu.c       | 6 +++---
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/cfg_space.c b/drivers/gpu/drm/i915/gvt/cfg_space.c
> index dad3a6054335..a0fc6d356588 100644
> --- a/drivers/gpu/drm/i915/gvt/cfg_space.c
> +++ b/drivers/gpu/drm/i915/gvt/cfg_space.c
> @@ -243,7 +243,7 @@ static void emulate_pci_bar_write(struct intel_vgpu *vgpu, unsigned int offset,
>  }
>  
>  /**
> - * intel_vgpu_emulate_cfg_read - emulate vGPU configuration space write
> + * intel_vgpu_emulate_cfg_write - emulate vGPU configuration space write
>   * @vgpu: target vgpu
>   * @offset: offset
>   * @p_data: write data ptr
> diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.h b/drivers/gpu/drm/i915/gvt/dmabuf.h
> index 5f8f03fb1d1b..3dcdb6570eda 100644
> --- a/drivers/gpu/drm/i915/gvt/dmabuf.h
> +++ b/drivers/gpu/drm/i915/gvt/dmabuf.h
> @@ -48,7 +48,7 @@ struct intel_vgpu_fb_info {
>  	struct intel_vgpu_dmabuf_obj *obj;
>  };
>  
> -/**
> +/*
>   * struct intel_vgpu_dmabuf_obj- Intel vGPU device buffer object
>   */
>  struct intel_vgpu_dmabuf_obj {
> diff --git a/drivers/gpu/drm/i915/gvt/page_track.c b/drivers/gpu/drm/i915/gvt/page_track.c
> index 3375b51c75f1..df34e73cba41 100644
> --- a/drivers/gpu/drm/i915/gvt/page_track.c
> +++ b/drivers/gpu/drm/i915/gvt/page_track.c
> @@ -120,7 +120,7 @@ int intel_vgpu_enable_page_track(struct intel_vgpu *vgpu, unsigned long gfn)
>  }
>  
>  /**
> - * intel_vgpu_enable_page_track - cancel write-protection on guest page
> + * intel_vgpu_disable_page_track - cancel write-protection on guest page
>   * @vgpu: a vGPU
>   * @gfn: the gfn of guest page
>   *
> diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
> index 46da19b3225d..8e71cda19995 100644
> --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> @@ -205,7 +205,7 @@ static void intel_gvt_update_vgpu_types(struct intel_gvt *gvt)
>  }
>  
>  /**
> - * intel_gvt_active_vgpu - activate a virtual GPU
> + * intel_gvt_activate_vgpu - activate a virtual GPU
>   * @vgpu: virtual GPU
>   *
>   * This function is called when user wants to activate a virtual GPU.
> @@ -219,7 +219,7 @@ void intel_gvt_activate_vgpu(struct intel_vgpu *vgpu)
>  }
>  
>  /**
> - * intel_gvt_deactive_vgpu - deactivate a virtual GPU
> + * intel_gvt_deactivate_vgpu - deactivate a virtual GPU
>   * @vgpu: virtual GPU
>   *
>   * This function is called when user wants to deactivate a virtual GPU.
> @@ -348,7 +348,7 @@ struct intel_vgpu *intel_gvt_create_idle_vgpu(struct intel_gvt *gvt)
>  }
>  
>  /**
> - * intel_gvt_destroy_vgpu - destroy an idle virtual GPU
> + * intel_gvt_destroy_idle_vgpu - destroy an idle virtual GPU
>   * @vgpu: virtual GPU
>   *
>   * This function is called when user wants to destroy an idle virtual GPU.
> -- 
> 2.36.1
> 
