Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DF17372B7
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 19:25:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D693E10E305;
	Tue, 20 Jun 2023 17:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E0F10E266;
 Tue, 20 Jun 2023 17:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687281929; x=1718817929;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KhEkcAeuO54RBxhybqPPb0hca4mk4KaxPK4AZTYT/W8=;
 b=mdUcH5EdGWvIcYqp2CeFRHdxFXXNWRnkZgjKtf0p8MYHLCBPFTmNY7rz
 gkyJPuWOm0iOZxjq39R7twdU28jY6E4h+PgLQoPkwt8AdK4sZ8DikvCHM
 kZt/XWUdSpeK2SV4zJYmag/1Shf8wKiQ6BNslDUC1wt1a43+WC8JXR3r3
 hqEdVh8NIkAqKEUHHwtH+fjGuBVemulatq2kZNQq72ULuKGuKj6xw02+J
 9avQc+ns1nocebPSRj6sNfaokmEC5OGrWHarTs7+TdI/uTQhb8B5qialZ
 slGeY76SfJ5hAduxTvvC3d72s6QzrQr3RyZGvJ94k08AAxehSr6W5LcNo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="339543927"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; d="scan'208";a="339543927"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2023 10:25:27 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="748207845"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; d="scan'208";a="748207845"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 20 Jun 2023 10:25:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 20 Jun 2023 10:25:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 20 Jun 2023 10:25:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 20 Jun 2023 10:25:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O8kjgCPscWHGm1onOeosVdnRLmw6dzGCOSG+o3TkqXDwWrTqj7JseQnIXpLwaUiZUrBoWEpfIWLcMuW6FsARsFcQVLc408TzgnbYcnlFm4McneyohKRiiq6I4bcqvhuqA5aymAnobrefLVWOdI2wgTkJfkf01B47jfb6e3ck/QtfXg7GRqNOFuKrqfsSfZ1FPiUD32iZI8EjsJXyEw/ix9zax1nb2baYUF1MscmnLeNaiqFZTHSFOmMa7Sj6dGjSaWEaFHwbiecr01nAcbPGarjJwriLKwniBa2nk1CRFqtcCJxhMX95+eKMMRHVAVxVuzFPIgmGVaoyWqNwZafKqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+Uojxs0vIRAf8fnhIYVffIWx7cL9+fblTTNonKMNq4=;
 b=dM8+FnDg52LURgHsVWwp72kne+r6lvasrEXViAm34y6LHWqMGz7ncBBnrymxvuQoz73TUcanQ4TgDuNZyjga+X2Xt1cAM5SQULYyn9Uj2vOKf+StUO4JrUp4xFy51/fOBUvej4ICqSjR8UyppwZ/zYMkwWxYfyk7zEoc9kxNZ38HUUcL+fCG9qtM136jvkIprzMCevZ0o0r6hFngSsYDjXPDNpeyFOKaLuO+Qv4B3WmIdoiXBeadYBRwOCP13nhR6+75UQuW2owogJc3ajFX/pKJXtucVw1o/MwskQEiJJY7zBHXNVacBhyc+xCr4mHQcFhQ9E6TRMtOSOBga9Ipcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB6229.namprd11.prod.outlook.com (2603:10b6:208:3c6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Tue, 20 Jun
 2023 17:25:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%7]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 17:25:23 +0000
Date: Tue, 20 Jun 2023 10:25:21 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [Intel-xe] [PATCH 2/3] linux/bits.h: Add fixed-width GENMASK and
 BIT macros
Message-ID: <amgwl5mthhqgvgkqnor6tjfcr3x3pgwvpqin5efwwjfpdhvvpa@vhzhiq5mzsdg>
References: <20230509051403.2748545-1-lucas.demarchi@intel.com>
 <20230509051403.2748545-3-lucas.demarchi@intel.com>
 <ZF4fi5B7PPlgZBOI@smile.fi.intel.com> <87pm75kd0h.fsf@intel.com>
 <ZF4j0NPoBGMBT8CO@smile.fi.intel.com> <87mt29kc34.fsf@intel.com>
 <ZIs0CC2J7nu0LHEK@smile.fi.intel.com> <875y7igph5.fsf@intel.com>
 <ZJG91zMQW3Rnvdbe@smile.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZJG91zMQW3Rnvdbe@smile.fi.intel.com>
X-ClientProxiedBy: MW3PR06CA0012.namprd06.prod.outlook.com
 (2603:10b6:303:2a::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB6229:EE_
X-MS-Office365-Filtering-Correlation-Id: cb0dbedd-6b92-43c0-1fb9-08db71b35498
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4vUlrZdkVdYZHgy8jqGArTid88Be8Hxv4M9Dww/PCEdNaYTtdIMtga6dK1NXpguf+kRrE4qGy+TkYyuQnDf0L9DuMqDUjqKOkhyW2CI8YDvdv8PZsd4nXH6qonTrCYnJizqBkUWGhXPYR6UTO5/OyYUUmbYJofGKAcAEAaM3N92pjv94u4FvEBg+dNXhDU37VQKnrPGOnHjbqCqTUJAMIQ1DmoVWFSCjg1UAY9zITx3uDPRB8cbRnfUnhTth3AneFWjYS508xgC+s75GcRMOMDuP/9hOrfqfkMw0wIycQEp5/4HX4+w5JeLfSUiE7hCnKTBpcxg3FH3Il8Sv9/gOF9DBPmOlMosbKtD5ft7JSPKWiMSeOYnmhwoJordvSnRgv51tTaC2cVuHxggJjcFjC7jVhmiuDImGuK6xIcqz0EplUSf6PzKB9SszeRDJpURwjP5VO2tgBYMasFrYyVj6RYPynJVPQMkKIj8uDe3hFhN8Dk6M1CgQYP8DGHXH31FVpLRS/qPJ+a9UJt9KWEV9M9FzwljDqT2tTMklGQOg5apHbk9XkO+QF/24sXk2gThe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(396003)(346002)(376002)(39860400002)(136003)(451199021)(6486002)(478600001)(83380400001)(54906003)(6512007)(186003)(26005)(6506007)(9686003)(2906002)(7416002)(5660300002)(33716001)(38100700002)(4326008)(66946007)(316002)(86362001)(82960400001)(8936002)(8676002)(41300700001)(6916009)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KCPkbAol7CUjdAYXkTrSTO11ByEfovwuBjd1gKzr1l+Vztf/pVkwHcI7/1dU?=
 =?us-ascii?Q?WVEzOzgfuCfDizplfG9Ofl3mfxpTuireE9sq2DvIwR+bg+Wj3oT1MYel4siT?=
 =?us-ascii?Q?uSJo8f9oFipfRntWJtnfae0MIm2VCenAR5EPpnMy1VwVT0UgiHhKvfv5exB6?=
 =?us-ascii?Q?wy6cv+Bvt9MAueLDFevh/oevvXUwjT+kNxZd6J4T4keyKty083P4ARk3T8Qo?=
 =?us-ascii?Q?Lv937EGzRB12w4zRJffuOnDWrt09Y9/UZrmg0zXahh9jyw7MDzOYQdMq2jVD?=
 =?us-ascii?Q?AOkaXa436MK5TZFKEO4tc2A4JMDrquZ6F+sN+ZgmUdYJkLj3dAMREICajJf8?=
 =?us-ascii?Q?DMVAj2linoqCk1w7iGdQm3wTc+gKRY3pKLa94VbvItVJtz55saULGt3e4EMV?=
 =?us-ascii?Q?0JdxP5CwgS6B66eg5+QI+wIWuTSEdmazRyoC1a0SRwe3d+/ovdKUYx06m8mO?=
 =?us-ascii?Q?FjLfv1YlCDSZMIPf3cTCjdE81wv9YxPNBgZDZ6VxyVroosm6X+p1j1vHcwgw?=
 =?us-ascii?Q?2t7e+5VUTgnIy6EI2AE1MOONnIlDMXpYO8oyJ3b6MnHlKh8cavQlVkeG9aMU?=
 =?us-ascii?Q?JCV0cySHN2YorSvcHaciy4eq/WnSMpcYENmanCaHQtbblj7hPWZQkhB24t9b?=
 =?us-ascii?Q?q80OeMemxoHieazNFWnGcBiyvi3lB4jU2mY5fZrDPr9B1RgEJCD5DePVPGc+?=
 =?us-ascii?Q?cR64I/K/N4LlTGQty0z0dO1mZocpu7cBuoZkhkP6CpjheKoT/TkILXpXS18z?=
 =?us-ascii?Q?TFvGXGWoMNJHUapSA/viAJZ4rOuUMJ0VrLYe5LxxrWbJ1Dpv9s+CAQvlUmLE?=
 =?us-ascii?Q?yfHX7UYmXPYWpSNtEfMoLUNJc/n5/wh6cZ0MCubWdE6K5kEaJfX3K8W//mdk?=
 =?us-ascii?Q?5FTnHAP+ufqLOhAdCdlwrY1Gc8P0sIYBP2mUzEw3AoPlLmjCQpOnfnYRuOn9?=
 =?us-ascii?Q?YvkFRibjhknMahyIGF6ftEWr3U8+6al347n8gNPxUj9cIQ7r3Nr6pat7uWED?=
 =?us-ascii?Q?h8WhdWsR9WDAsL7nM91SvQxwC9IPW7qUEQ9AefFFb4F3RKPBYcNyvxh2kYk3?=
 =?us-ascii?Q?Ty15atWbE9mS7csOl12t/ZtgoUwe+iW18xtM7mCyr4sP0MWWkRhwcePLY3o6?=
 =?us-ascii?Q?EInedAZUcK/T68enCVg89Djf/Tr5bZyS/DdUrXSH7LOPApuM6jmekCzkf4fj?=
 =?us-ascii?Q?XVt9467wb/6z4a9z8ZlNjt3ckQAJBovWu7XA3aoVbMS3qGAnqtrYyPYDFLRz?=
 =?us-ascii?Q?KI/x2/JVZrkJ+MNhjrLtdqnpES3Z87Zyhx8Q7Gzxmfl5VSjGrK6DX0iVtDDB?=
 =?us-ascii?Q?0OxKWgKHMEupQO0DX1JpE1JKasxGxpaIOoG0Lm9qv3RiRm5ukADQNCHEFBxU?=
 =?us-ascii?Q?ok21ZvX4Uty7aOW83Snzx2hQVZtdhUUQX3SfbdrC3B5MANyhf+szy+t609y1?=
 =?us-ascii?Q?9EKyxEUA/FS9P71ZvsXqmSzPxGrFE5yOBIRX2BCH+KhFGeOGvEE+frmxTH21?=
 =?us-ascii?Q?SUi/wdXFKvJYO5E/UWRUT9iXtHr9NSOGs0JgcAY1eI2yz+DwsYqhhm1ex8Ex?=
 =?us-ascii?Q?PmWBKE7cevDoSH8ebTxG2cNERynPV88nibgA7YHatzb28WCXgkutecpwldPW?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb0dbedd-6b92-43c0-1fb9-08db71b35498
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 17:25:23.7020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vbv+ceeZZczK9WLPiGezcX1tYriqP3V65FPBUh8UhmlPleOvwkcUQrBz8lk+M4h6pKhNbd4gCDoGpc/12sk86/H/JPvWutEuHZtjOWzB+t8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6229
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
Cc: intel-gfx@lists.freedesktop.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Thomas
 Gleixner <tglx@linutronix.de>, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 20, 2023 at 05:55:19PM +0300, Andy Shevchenko wrote:
>On Tue, Jun 20, 2023 at 05:47:34PM +0300, Jani Nikula wrote:
>> On Thu, 15 Jun 2023, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>> > On Fri, May 12, 2023 at 02:45:19PM +0300, Jani Nikula wrote:
>> >> On Fri, 12 May 2023, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>> >> > On Fri, May 12, 2023 at 02:25:18PM +0300, Jani Nikula wrote:
>> >> >> On Fri, 12 May 2023, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>> >> >> > On Mon, May 08, 2023 at 10:14:02PM -0700, Lucas De Marchi wrote:
>> >> >> >> Add GENMASK_U32(), GENMASK_U16() and GENMASK_U8()  macros to create
>> >> >> >> masks for fixed-width types and also the corresponding BIT_U32(),
>> >> >> >> BIT_U16() and BIT_U8().
>> >> >> >
>> >> >> > Why?
>> >> >>
>> >> >> The main reason is that GENMASK() and BIT() size varies for 32/64 bit
>> >> >> builds.
>> >> >
>> >> > When needed GENMASK_ULL() can be used (with respective castings perhaps)
>> >> > and BIT_ULL(), no?
>> >>
>> >> How does that help with making them the same 32-bit size on both 32 and
>> >> 64 bit builds?
>> >
>> > 	u32 x = GENMASK();
>> > 	u64 y = GENMASK_ULL();
>> >
>> > No? Then use in your code either x or y. Note that I assume that the parameters
>> > to GENMASK*() are built-time constants. Is it the case for you?
>>
>> What's wrong with wanting to define macros with specific size, depending
>> on e.g. hardware registers instead of build size?
>
>Nothing, but I think the problem is smaller than it's presented.

not sure about big/small problem you are talking about. It's a problem
for when the *device* register is a 32b fixed width, which is
independent from the CPU you are running on. We also have registers that
are u16 and u64. Having fixed-width GENMASK and BIT helps avoiding
mistakes like below. Just to use one example, the diff below builds
fine on my 64b machine, yet it's obviously wrong:

	$ git diff 
	diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
	index 0b414eae1683..692a0ad9a768 100644
	--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
	+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
	@@ -261,8 +261,8 @@ static u32 rw_with_mcr_steering_fw(struct intel_gt *gt,
			 * No need to save old steering reg value.
			 */
			intel_uncore_write_fw(uncore, MTL_MCR_SELECTOR,
	-                                     REG_FIELD_PREP(MTL_MCR_GROUPID, group) |
	-                                     REG_FIELD_PREP(MTL_MCR_INSTANCEID, instance) |
	+                                     FIELD_PREP(MTL_MCR_GROUPID, group) |
	+                                     FIELD_PREP(MTL_MCR_INSTANCEID, instance) |
					      (rw_flag == FW_REG_READ ? GEN11_MCR_MULTICAST : 0));
		} else if (GRAPHICS_VER(uncore->i915) >= 11) {
			mcr_mask = GEN11_MCR_SLICE_MASK | GEN11_MCR_SUBSLICE_MASK;
	diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
	index 718cb2c80f79..c42bc2900c6a 100644
	--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
	+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
	@@ -80,8 +80,8 @@
	 #define   GEN11_MCR_SLICE_MASK                 GEN11_MCR_SLICE(0xf)
	 #define   GEN11_MCR_SUBSLICE(subslice)         (((subslice) & 0x7) << 24)
	 #define   GEN11_MCR_SUBSLICE_MASK              GEN11_MCR_SUBSLICE(0x7)
	-#define   MTL_MCR_GROUPID                      REG_GENMASK(11, 8)
	-#define   MTL_MCR_INSTANCEID                   REG_GENMASK(3, 0)
	+#define   MTL_MCR_GROUPID                      GENMASK(32, 8)
	+#define   MTL_MCR_INSTANCEID                   GENMASK(3, 0)
	 
	 #define IPEIR_I965                             _MMIO(0x2064)
	 #define IPEHR_I965                             _MMIO(0x2068)

If the driver didn't support 32b CPUs, this would even go unnoticed.

Lucas De Marchi

>And there are already header for bitfields with a lot of helpers
>for (similar) cases if not yours.
>
>> What would you use for printk format if you wanted to to print
>> GENMASK()?
>
>%lu, no?
>
>-- 
>With Best Regards,
>Andy Shevchenko
>
>
