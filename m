Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF8F630182
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 23:52:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ABA610E817;
	Fri, 18 Nov 2022 22:52:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DEA910E816;
 Fri, 18 Nov 2022 22:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668811939; x=1700347939;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AAbdmX5BBqpoaE1vzADf/3hcgqYJST0LRnyDs++4Ir8=;
 b=ENN4ZP+9WVY2bKGebSI5eiCcREY0aHvfWqxgCtRgKnMygne6MyrZPSet
 SVx4Pn8jYuTp/MKFQvb0WYoDj/JiwqF6WXQmpuPd+KWE4P9AK6kR1dr/w
 Z48hgD2vWGioQrdp3UyUt7NSzvuvrt6amYvIXhvZ0KDUMtKHUbVjIfyqG
 3UhWW9yUanYnGuag+zXmprQG6le8jn8nXzZdQDzejcUfjOxLal+61n0q/
 dbRwUbskau6VmVF+8l7LVcACp4PwXLxYlN/GyAm/xtMcoD2OrYqvIrC6/
 LzQ3IuCXbXNO3gVPeig3F4UyvZwDObQF7K91RYbdZitYa03X/3Z3cLpg0 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="375399645"
X-IronPort-AV: E=Sophos;i="5.96,175,1665471600"; d="scan'208";a="375399645"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2022 14:52:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="815086128"
X-IronPort-AV: E=Sophos;i="5.96,175,1665471600"; d="scan'208";a="815086128"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 18 Nov 2022 14:52:18 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 14:52:18 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 18 Nov 2022 14:52:18 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 18 Nov 2022 14:52:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KUoZEJ2iXZFjjkmHQpMuoGUM6M7uOWqwR/jl7tOunrB22cQQwUyjJ6HifdhuVBbF+OplJbLdd0UtnRPxnXeN/xUdxBfH6oKyBEDtQtoBot8VWg+jVl9CMQsYjgICU/lEcHI2ccK70GcgG9+AxqGG1ic8E0z/2wcYqiKUYlnEVw7lkXdD5Ubc7YbRFDra2E/eSBeJmQuw2HT5e9/D/iJ0HyIY2ceatu6K/e+L0EOmGHAOXsAVBh7erzntDdhr/nGQCjxCrbVqk3F6Z3J7ApYHtQFgdWaq/j00dmu503cp9ffzcaKRFwa8wst0U3++8Q4cA8mU0vg+wVvnYaUzEHmYVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8BvRRcQYcW+INFoYSLAkYHQRSl/IwoaS9WtlQDUKZw=;
 b=dSjtTLx1aR6AXwqRvk1lugMCJGDauCeZad1YP5iWNFSvI+8EZ0fxPmzwxOlMBK1MJKtZLAHQV/pLcNIb7PvW6F/6q4g0JLnGSShfaGM4wBhWTjvH3uzgytVfNXh8g6veoUKcclSmqNHe8YnFaERGy7fvgvImG+ZNLV+by59us5TOJFt43EJK0IAYTUjaPJgB5aftDMPZl+1bEhFmPbO8j4HgcHX7n2HYA7FTdoHGZDMF6ONboktzhm5Gru9lPdg+fpsa4VnemQz5PHBxhTxim53dKKFleN7qO0SMRXCBhYPI2kthibvsVgatxozNTODLkHjS3R+sPrrDSovYbjknTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by PH0PR11MB5205.namprd11.prod.outlook.com (2603:10b6:510:3d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20; Fri, 18 Nov
 2022 22:52:15 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::6dfc:c022:bd04:fe3e]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::6dfc:c022:bd04:fe3e%7]) with mapi id 15.20.5834.009; Fri, 18 Nov 2022
 22:52:15 +0000
Date: Fri, 18 Nov 2022 14:52:12 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Subject: Re: [PATCH v3] drm/i915/mtl: Media GT and Render GT share common GGTT
Message-ID: <Y3gMnGqw123WEG1P@mdroper-desk1.amr.corp.intel.com>
References: <20221115150454.2509551-1-aravind.iddamsetty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221115150454.2509551-1-aravind.iddamsetty@intel.com>
X-ClientProxiedBy: BY3PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::35) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|PH0PR11MB5205:EE_
X-MS-Office365-Filtering-Correlation-Id: ff6d4a04-aba2-4ea3-dac2-08dac9b78988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: atQwPLQsQTYe3nVbMU6Fsm/FSk04sDtna4pVV/3/5u8rqap9R9bVG79tAshzKtVl2VVu3ktRpByC4Lgxyj5BSHUkkE4yBbl9LSD4zAF55m8gMpyHA9Yi6g0JcKKzikXIf3P1h4UBsFHMdo81WctR/WB+/OTxZVARMzgdU0j4MUxdrUYQ7gkj6mQDaIgTkRsczXlL2tCDlg4BUW2oQUpFDRmSPisNQXeHcSEX5tREy6iulhhj38SIrVaGmi+QFMmbzZe1shADuiqgQ3ZcGU1RSQONJqdrb0rCLYpgnzARWyumsuMo3qmRWoFKNcpmYPtFTA88xbFVMJ9I0JOfdUb20Q4336IU0LORk1TcL2plu3paohwAQLSgtoFxDTIwUha/Yh7uc8w25PcqI9+K0cO2iUgjSWzb7zWzLU61AVTY59oZAK6OCA5LD9qJwoKzswGI2agidWAtPKnVpxIcfpoOpi/z/li6z9cONUVEqyap/5HbzRmik5LHuq0MsflTDCgQSJZ+P2ylfeRw+wGJu5GrUPFClmEw7b0EGA2/+diJR7zqEehrrGJSGiOMBv/GJVQzk+PqzTkMaMygZoymZ8QSEgNYI9Nrxs2/tgFJ2OvA6R7/CSn+f/oMZrwIWC/7ClXVL/lDHAh+6OO0Dl5ACMXKag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(39860400002)(366004)(136003)(376002)(346002)(451199015)(478600001)(6666004)(6512007)(6506007)(6486002)(86362001)(6636002)(316002)(2906002)(450100002)(38100700002)(82960400001)(66946007)(66476007)(66556008)(4326008)(8676002)(26005)(186003)(83380400001)(41300700001)(8936002)(6862004)(30864003)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4h1pMDxIDcQMtQEgoZC8bpE3zhL9NCvgK+QnXoZdjOLUACzTFHHH7N1kDohy?=
 =?us-ascii?Q?a5ZqWx/ixV/V2cDqjILDaWOz3lhPw5KIkv4dJLDIRBrun4NZHslhlj8fMwYq?=
 =?us-ascii?Q?yiSdtqi15ykOeta3oCcZYXSQ5dqm+SKUf/LBAbG6PpqEkoL+iIxqOGcpO/CT?=
 =?us-ascii?Q?n6eUjLosG/bdnYjQzEGKhnSHNVvB8Yt5mghKCkFEOxBG64juxQM6EwJ+zj+p?=
 =?us-ascii?Q?q5lcRJ9icCDUj87DlEBbpD/JqQWFwIIHwQYvrRAr/sZfrGQx1Qptv4Uyn/Zy?=
 =?us-ascii?Q?iPNc7IM8J9K6PCNVqv7XBn0Wcbl3bh/NFNSRS5bOQ3z7tyt+UKj5nvAy6TRW?=
 =?us-ascii?Q?xYn7YEDTR22ng01ISXfyEiQUZ7+BNnGrcNzyGyofqj3J1/0svJiVsCIUQiHb?=
 =?us-ascii?Q?irkKJr9MQWDSKVt2kum2ur0EqSvhnQHONHEeqaewGgBlMqqKJ1/giAimtv8P?=
 =?us-ascii?Q?CzwbfHcmiF5ltx6rnh6umgPsArDYKfoBn9rN0ZmPOM3P+ZLpalO4UzeDD3eA?=
 =?us-ascii?Q?7+0E4HUOoRooTV77aXRfdJoXsvyq7iTNm5l/wGv9pUjxYK/rrpnRAhPK96mc?=
 =?us-ascii?Q?yI6rw6k0NnjT+mPpAV1QjGv8lXGMe84QglYKUBUfK9uBEnSlzveahHbKrYdw?=
 =?us-ascii?Q?InjNU5ybp7fKhl9JOB1lK9y20dsAdIez603Q3BTlBMqODxPUnw6uAhHdDMgg?=
 =?us-ascii?Q?gKoz/tTuRSyRCn/XSRiKZjP61mSLOVsWKyBE2W1eDMBANC6PGfyCZZ0Tlw3a?=
 =?us-ascii?Q?qUz3mA4AwKrQg8TwRzB8/P67wy6nRWpj/ob6Yj+QKXZL7bMDzat+P+e2lv69?=
 =?us-ascii?Q?+0bi7CdLYgLaDVHxp0dZSx8A8vfPYMO6juDRVPkzY6FOQe48M2eMslcuQ/uD?=
 =?us-ascii?Q?XLLRrznhDCCo+yMazKvMXoixXs5LccqEU5/YbuRo6gUlnstDw/VgwNeSawU+?=
 =?us-ascii?Q?abyw1Zhnw8CJIdT+USss/QLs0NyzMx27Tk4Ojm9W1AjcgwFRDzcQKLCJXvxb?=
 =?us-ascii?Q?QMcoo3pCpT4c0prmBANELSAFsEY0xZ5VRy7IANo6tPdunD3e4RthdP+waKJs?=
 =?us-ascii?Q?DLIKMDZVz1sQUuqOxKUT5l8nhrJMLRvij1TbqkE2TWb6240IuBTqVNHOerfa?=
 =?us-ascii?Q?khDYv+D5nMbFhqZXmfT2+xoYlO/XiKFQ8+kUFulHYFJngbEvPyYkRs4fb3bG?=
 =?us-ascii?Q?J4e3elg/fqiizxVbQQRi3l3079gJmGzXXFr46NzlrSX9hcYrLuzV3Yqk+1TH?=
 =?us-ascii?Q?qsTCbFlNHX4T8FIW7dr/eb2GXmklT9UA5PLDWmAsMsePScKvvymFT7TzNN63?=
 =?us-ascii?Q?crl9RuV78XCJHUHYc/WOoVc7knd0lsHJjpS8rmkrWS1yklv53tnU8ulRCNBb?=
 =?us-ascii?Q?jzYC3i+rLPSyZuBWwiLy+/2Mbh3Cgxsy2x/Tva4aWTRe30MyfJ8Z5Jv9w7up?=
 =?us-ascii?Q?0oYJoNrO22iddpuDQ0wQ3R12rX19L3zreAVm8/DOcw/PqrUZ9/06zMoSpOwj?=
 =?us-ascii?Q?2XX8wTNJZoyR1HlNrzdFk3W9m21E1OON5oLp9JsCZ4rCrKyJP47WFgGGNxmB?=
 =?us-ascii?Q?74Wp+tO4lvS3/RvXRRBheFfNNRVphuKSBA17jgMmvHIlR107Lm/kRfjebo3t?=
 =?us-ascii?Q?Ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff6d4a04-aba2-4ea3-dac2-08dac9b78988
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 22:52:15.1710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4/1++jQu1KWdyl2OX4dILCDxLEkzcJZvA/SPh12Nnj2Dm5SOthCSbXB5cSZH6X5QRrhMof/9g9F/dQUp5KUjdfz3+wrnL0N0qGVeWeQ/x60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5205
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

On Tue, Nov 15, 2022 at 08:34:54PM +0530, Aravind Iddamsetty wrote:
> On XE_LPM+ platforms the media engines are carved out into a separate
> GT but have a common GGTMMADR address range which essentially makes
> the GGTT address space to be shared between media and render GT. As a
> result any updates in GGTT shall invalidate TLB of GTs sharing it and
> similarly any operation on GGTT requiring an action on a GT will have to
> involve all GTs sharing it. setup_private_pat was being done on a per
> GGTT based as that doesn't touch any GGTT structures moved it to per GT
> based.
> 
> BSPEC: 63834
> 
> v2:
> 1. Add details to commit msg
> 2. includes fix for failure to add item to ggtt->gt_list, as suggested
> by Lucas
> 3. as ggtt_flush() is used only for ggtt drop i915_is_ggtt check within
> it.
> 4. setup_private_pat moved out of intel_gt_tiles_init
> 
> v3:
> 1. Move out for_each_gt from i915_driver.c (Jani Nikula)
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_ggtt.c      | 54 +++++++++++++++++------
>  drivers/gpu/drm/i915/gt/intel_gt.c        | 13 +++++-
>  drivers/gpu/drm/i915/gt/intel_gt_types.h  |  3 ++
>  drivers/gpu/drm/i915/gt/intel_gtt.h       |  4 ++
>  drivers/gpu/drm/i915/i915_driver.c        | 12 ++---
>  drivers/gpu/drm/i915/i915_gem.c           |  2 +
>  drivers/gpu/drm/i915/i915_gem_evict.c     | 51 +++++++++++++++------
>  drivers/gpu/drm/i915/i915_vma.c           |  5 ++-
>  drivers/gpu/drm/i915/selftests/i915_gem.c |  2 +
>  9 files changed, 111 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index 8145851ad23d..7644738b9cdb 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -8,6 +8,7 @@
>  #include <linux/types.h>
>  #include <linux/stop_machine.h>
>  
> +#include <drm/drm_managed.h>
>  #include <drm/i915_drm.h>
>  #include <drm/intel-gtt.h>
>  
> @@ -196,10 +197,13 @@ void i915_ggtt_suspend_vm(struct i915_address_space *vm)
>  
>  void i915_ggtt_suspend(struct i915_ggtt *ggtt)
>  {
> +	struct intel_gt *gt;
> +
>  	i915_ggtt_suspend_vm(&ggtt->vm);
>  	ggtt->invalidate(ggtt);
>  
> -	intel_gt_check_and_clear_faults(ggtt->vm.gt);
> +	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
> +		intel_gt_check_and_clear_faults(gt);
>  }
>  
>  void gen6_ggtt_invalidate(struct i915_ggtt *ggtt)
> @@ -225,16 +229,21 @@ static void gen8_ggtt_invalidate(struct i915_ggtt *ggtt)
>  
>  static void guc_ggtt_invalidate(struct i915_ggtt *ggtt)
>  {
> -	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
>  	struct drm_i915_private *i915 = ggtt->vm.i915;
>  
>  	gen8_ggtt_invalidate(ggtt);
>  
> -	if (GRAPHICS_VER(i915) >= 12)
> -		intel_uncore_write_fw(uncore, GEN12_GUC_TLB_INV_CR,
> -				      GEN12_GUC_TLB_INV_CR_INVALIDATE);
> -	else
> -		intel_uncore_write_fw(uncore, GEN8_GTCR, GEN8_GTCR_INVALIDATE);
> +	if (GRAPHICS_VER(i915) >= 12) {
> +		struct intel_gt *gt;
> +
> +		list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
> +			intel_uncore_write_fw(gt->uncore,
> +					      GEN12_GUC_TLB_INV_CR,
> +					      GEN12_GUC_TLB_INV_CR_INVALIDATE);
> +	} else {
> +		intel_uncore_write_fw(ggtt->vm.gt->uncore,
> +				      GEN8_GTCR, GEN8_GTCR_INVALIDATE);
> +	}
>  }
>  
>  u64 gen8_ggtt_pte_encode(dma_addr_t addr,
> @@ -986,8 +995,6 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
>  
>  	ggtt->vm.pte_encode = gen8_ggtt_pte_encode;
>  
> -	setup_private_pat(ggtt->vm.gt);
> -
>  	return ggtt_probe_common(ggtt, size);
>  }
>  
> @@ -1196,7 +1203,14 @@ static int ggtt_probe_hw(struct i915_ggtt *ggtt, struct intel_gt *gt)
>   */
>  int i915_ggtt_probe_hw(struct drm_i915_private *i915)
>  {
> -	int ret;
> +	struct intel_gt *gt;
> +	int ret, i;
> +
> +	for_each_gt(gt, i915, i) {
> +		ret = intel_gt_assign_ggtt(gt);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	ret = ggtt_probe_hw(to_gt(i915)->ggtt, to_gt(i915));
>  	if (ret)
> @@ -1208,6 +1222,19 @@ int i915_ggtt_probe_hw(struct drm_i915_private *i915)
>  	return 0;
>  }
>  
> +struct i915_ggtt *i915_ggtt_create(struct drm_i915_private *i915)
> +{
> +	struct i915_ggtt *ggtt;
> +
> +	ggtt = drmm_kzalloc(&i915->drm, sizeof(*ggtt), GFP_KERNEL);
> +	if (!ggtt)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_LIST_HEAD(&ggtt->gt_list);
> +
> +	return ggtt;
> +}
> +
>  int i915_ggtt_enable_hw(struct drm_i915_private *i915)
>  {
>  	if (GRAPHICS_VER(i915) < 6)
> @@ -1296,9 +1323,11 @@ bool i915_ggtt_resume_vm(struct i915_address_space *vm)
>  
>  void i915_ggtt_resume(struct i915_ggtt *ggtt)
>  {
> +	struct intel_gt *gt;
>  	bool flush;
>  
> -	intel_gt_check_and_clear_faults(ggtt->vm.gt);
> +	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
> +		intel_gt_check_and_clear_faults(gt);
>  
>  	flush = i915_ggtt_resume_vm(&ggtt->vm);
>  
> @@ -1307,9 +1336,6 @@ void i915_ggtt_resume(struct i915_ggtt *ggtt)
>  	if (flush)
>  		wbinvd_on_all_cpus();
>  
> -	if (GRAPHICS_VER(ggtt->vm.i915) >= 8)
> -		setup_private_pat(ggtt->vm.gt);
> -
>  	intel_ggtt_restore_fences(ggtt);
>  }
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 0325f071046c..bd874a4edfc1 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -110,9 +110,18 @@ static int intel_gt_probe_lmem(struct intel_gt *gt)
>  
>  int intel_gt_assign_ggtt(struct intel_gt *gt)
>  {
> -	gt->ggtt = drmm_kzalloc(&gt->i915->drm, sizeof(*gt->ggtt), GFP_KERNEL);
> +	/* Media GT shares primary GT's GGTT */
> +	if (gt->type == GT_MEDIA) {
> +		gt->ggtt = to_gt(gt->i915)->ggtt;
> +	} else {
> +		gt->ggtt = i915_ggtt_create(gt->i915);
> +		if (IS_ERR(gt->ggtt))
> +			return PTR_ERR(gt->ggtt);
> +	}
>  
> -	return gt->ggtt ? 0 : -ENOMEM;
> +	list_add_tail(&gt->ggtt_link, &gt->ggtt->gt_list);
> +
> +	return 0;
>  }
>  
>  int intel_gt_init_mmio(struct intel_gt *gt)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> index c1d9cd255e06..8d915640914b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> @@ -277,6 +277,9 @@ struct intel_gt {
>  	struct kobject *sysfs_defaults;
>  
>  	struct i915_perf_gt perf;
> +
> +	/** link: &ggtt.gt_list */
> +	struct list_head ggtt_link;
>  };
>  
>  struct intel_gt_definition {
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
> index 4d75ba4bb41d..d1900fec6cd1 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> @@ -390,6 +390,9 @@ struct i915_ggtt {
>  	struct mutex error_mutex;
>  	struct drm_mm_node error_capture;
>  	struct drm_mm_node uc_fw;
> +
> +	/** List of GTs mapping this GGTT */
> +	struct list_head gt_list;
>  };
>  
>  struct i915_ppgtt {
> @@ -584,6 +587,7 @@ void i915_ggtt_disable_guc(struct i915_ggtt *ggtt);
>  int i915_init_ggtt(struct drm_i915_private *i915);
>  void i915_ggtt_driver_release(struct drm_i915_private *i915);
>  void i915_ggtt_driver_late_release(struct drm_i915_private *i915);
> +struct i915_ggtt *i915_ggtt_create(struct drm_i915_private *i915);
>  
>  static inline bool i915_ggtt_has_aperture(const struct i915_ggtt *ggtt)
>  {
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index 69103ae37779..4e1bb3c23c63 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -612,10 +612,6 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
>  
>  	i915_perf_init(dev_priv);
>  
> -	ret = intel_gt_assign_ggtt(to_gt(dev_priv));
> -	if (ret)
> -		goto err_perf;
> -
>  	ret = i915_ggtt_probe_hw(dev_priv);
>  	if (ret)
>  		goto err_perf;
> @@ -1316,7 +1312,8 @@ int i915_driver_suspend_switcheroo(struct drm_i915_private *i915,
>  static int i915_drm_resume(struct drm_device *dev)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(dev);
> -	int ret;
> +	struct intel_gt *gt;
> +	int ret, i;
>  
>  	disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>  
> @@ -1331,6 +1328,11 @@ static int i915_drm_resume(struct drm_device *dev)
>  		drm_err(&dev_priv->drm, "failed to re-enable GGTT\n");
>  
>  	i915_ggtt_resume(to_gt(dev_priv)->ggtt);
> +
> +	for_each_gt(gt, dev_priv, i)
> +		if (GRAPHICS_VER(gt->i915) >= 8)
> +			setup_private_pat(gt);
> +
>  	/* Must be called after GGTT is resumed. */
>  	intel_dpt_resume(dev_priv);
>  
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index 8468ca9885fd..086c4702e1bf 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -1143,6 +1143,8 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
>  	for_each_gt(gt, dev_priv, i) {
>  		intel_uc_fetch_firmwares(&gt->uc);
>  		intel_wopcm_init(&gt->wopcm);
> +		if (GRAPHICS_VER(dev_priv) >= 8)
> +			setup_private_pat(gt);
>  	}
>  
>  	ret = i915_init_ggtt(dev_priv);
> diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
> index f025ee4fa526..99319ef92f47 100644
> --- a/drivers/gpu/drm/i915/i915_gem_evict.c
> +++ b/drivers/gpu/drm/i915/i915_gem_evict.c
> @@ -43,16 +43,25 @@ static bool dying_vma(struct i915_vma *vma)
>  	return !kref_read(&vma->obj->base.refcount);
>  }
>  
> -static int ggtt_flush(struct intel_gt *gt)
> +static int ggtt_flush(struct i915_address_space *vm)
>  {
> -	/*
> -	 * Not everything in the GGTT is tracked via vma (otherwise we
> -	 * could evict as required with minimal stalling) so we are forced
> -	 * to idle the GPU and explicitly retire outstanding requests in
> -	 * the hopes that we can then remove contexts and the like only
> -	 * bound by their active reference.
> -	 */
> -	return intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
> +	struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
> +	struct intel_gt *gt;
> +	int ret = 0;
> +
> +	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link) {
> +		/*
> +		 * Not everything in the GGTT is tracked via vma (otherwise we
> +		 * could evict as required with minimal stalling) so we are forced
> +		 * to idle the GPU and explicitly retire outstanding requests in
> +		 * the hopes that we can then remove contexts and the like only
> +		 * bound by their active reference.
> +		 */
> +		ret = intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
> +		if (ret)
> +			return ret;
> +	}
> +	return ret;
>  }
>  
>  static bool grab_vma(struct i915_vma *vma, struct i915_gem_ww_ctx *ww)
> @@ -149,6 +158,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
>  	struct drm_mm_node *node;
>  	enum drm_mm_insert_mode mode;
>  	struct i915_vma *active;
> +	struct intel_gt *gt;
>  	int ret;
>  
>  	lockdep_assert_held(&vm->mutex);
> @@ -174,7 +184,14 @@ i915_gem_evict_something(struct i915_address_space *vm,
>  				    min_size, alignment, color,
>  				    start, end, mode);
>  
> -	intel_gt_retire_requests(vm->gt);
> +	if (i915_is_ggtt(vm)) {
> +		struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
> +
> +		list_for_each_entry_rcu(gt, &ggtt->gt_list, ggtt_link)

This isn't an RCU list is it?

> +			intel_gt_retire_requests(gt);
> +	} else {
> +		intel_gt_retire_requests(vm->gt);
> +	}
>  
>  search_again:
>  	active = NULL;
> @@ -246,7 +263,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
>  	if (I915_SELFTEST_ONLY(igt_evict_ctl.fail_if_busy))
>  		return -EBUSY;
>  
> -	ret = ggtt_flush(vm->gt);
> +	ret = ggtt_flush(vm);
>  	if (ret)
>  		return ret;
>  
> @@ -332,7 +349,15 @@ int i915_gem_evict_for_node(struct i915_address_space *vm,
>  	 * a stray pin (preventing eviction) that can only be resolved by
>  	 * retiring.
>  	 */
> -	intel_gt_retire_requests(vm->gt);
> +	if (i915_is_ggtt(vm)) {
> +		struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
> +		struct intel_gt *gt;
> +
> +		list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
> +			intel_gt_retire_requests(gt);
> +	} else {
> +		intel_gt_retire_requests(vm->gt);
> +	}
>  
>  	if (i915_vm_has_cache_coloring(vm)) {
>  		/* Expand search to cover neighbouring guard pages (or lack!) */
> @@ -438,7 +463,7 @@ int i915_gem_evict_vm(struct i915_address_space *vm, struct i915_gem_ww_ctx *ww)
>  	 * switch otherwise is ineffective.
>  	 */
>  	if (i915_is_ggtt(vm)) {
> -		ret = ggtt_flush(vm->gt);
> +		ret = ggtt_flush(vm);
>  		if (ret)
>  			return ret;
>  	}
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 3b969d679c1e..2b637f27e3b4 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -1544,6 +1544,8 @@ static int __i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>  			   u32 align, unsigned int flags)
>  {
>  	struct i915_address_space *vm = vma->vm;
> +	struct intel_gt *gt;
> +	struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
>  	int err;
>  
>  	do {
> @@ -1559,7 +1561,8 @@ static int __i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>  		}
>  
>  		/* Unlike i915_vma_pin, we don't take no for an answer! */
> -		flush_idle_contexts(vm->gt);
> +		list_for_each_entry_rcu(gt, &ggtt->gt_list, ggtt_link)

Same here.


Matt

> +			flush_idle_contexts(gt);
>  		if (mutex_lock_interruptible(&vm->mutex) == 0) {
>  			/*
>  			 * We pass NULL ww here, as we don't want to unbind
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
> index e5dd82e7e480..2535b9684bd1 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
> @@ -127,6 +127,8 @@ static void igt_pm_resume(struct drm_i915_private *i915)
>  	 */
>  	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>  		i915_ggtt_resume(to_gt(i915)->ggtt);
> +		if (GRAPHICS_VER(i915) >= 8)
> +			setup_private_pat(to_gt(i915));
>  		i915_gem_resume(i915);
>  	}
>  }
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
