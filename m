Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DC65ED974
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 11:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7706210E3C3;
	Wed, 28 Sep 2022 09:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04DD10E3B0;
 Wed, 28 Sep 2022 09:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664358668; x=1695894668;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/LH61oB68tHt1fX1Y7FouGjG7YH2kFC2JgnS9ZFE+3c=;
 b=dLEeYBjE4+eLJ9K2NqHzwBGQhuuzGpt3KdS4b3O6fpHnr9/hlgfj9nya
 TgUWTMu/odcx0tFzXxLyqn8DjFoMIjRw6Lu3YW+Tirl4sbrWyeDEmES2G
 yPjENCRBYmC9XTeZbsbQEn8ZxLasujoGhcJjJN+iHOKrjClnZRvL02S5p
 g3k2Ym3f/B2rIZH1JodE26tDTjeACvOF8Ipv09dm9W0KOmVKaUKQEQYWM
 9OSVLklNEATYfS581+RQatqeidJbrcVJWpADg0WlVekc2GpST2PojUK1E
 SuRwUinK/a4zPDm34/mGtYgypCUuGWukdqr6+uIAio0DQYdDhKeadBKmJ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="302469500"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; d="scan'208";a="302469500"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 02:51:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="747373210"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; d="scan'208";a="747373210"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 28 Sep 2022 02:51:08 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 02:51:08 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 02:51:07 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 28 Sep 2022 02:51:07 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 28 Sep 2022 02:51:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7Q10r0FXB7kcp9v3muALuM01aUyfXYep9Fto1DSeUJvxeBIQY7FvsxkpbklXHfUSghMnwTbbrXDOS6wrecn9c8/CQx3fKEgL80fvir/ynRAZRRi+KEqscZxLULv47+YVXmOIWFh+5Mg/AaimOzKNexpiH/z8nbdaKDj6etmjqa2uFLgCfCICjjohcN3etP8RXM2ggh9n4Ws7rquLL3FHWRsxCwirJWkEqufCzw8FM/T5AJD5KbbX+JddfaKv70xHtO4NndY1bgD1gMtIt7nAwhAE0BOykS9WJde79Lc/AOzauLNOdCyLv9P1YFEY9qBDys2a5c/PehM4xuaJX4Liw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KLQpq900zPzSO1HPWmho2UO4oJfssJlS489D6+8qjM=;
 b=G9uO5po0h7tNDDdI2tn3yngoMj8k48SumdoALLJE3Vm2wViXdsFJkx6WSj/sP23dNg7NRe4JdGD+fO8DJcVuvwq0NMGRlPSY0NSYdAxzucpydELpDrJ3p4NeJzyePj5FzFj6hSS57iL/4BAJyTgjpF7EGcpD9NFI6QepPENjJb3SKMlpYGe5pPxct5E2tfobr2J8WYGpMI0MHqv4ZCwVtRyu8VYZMEhiClRi58sc2lASsFrCM8gJcOV35PyrX+K5oyOww9Exuxlh2wGdFDOhdy9KLY+A+su4lj5vUvNfhgbp90DHDiTUZ/ihyOt3vlvAmGqqD6HCER+HKdJjPr3Cgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 DM6PR11MB4642.namprd11.prod.outlook.com (2603:10b6:5:2a2::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17; Wed, 28 Sep 2022 09:51:06 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67%3]) with mapi id 15.20.5654.026; Wed, 28 Sep 2022
 09:51:06 +0000
Date: Wed, 28 Sep 2022 15:20:52 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 02/12] drm/i915/xehp: Create separate reg definitions for
 new MCR registers
Message-ID: <YzQY/A0k08hdGsOh@bala-ubuntu>
References: <20220919223259.263525-1-matthew.d.roper@intel.com>
 <20220919223259.263525-3-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220919223259.263525-3-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN2PR01CA0197.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::6) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|DM6PR11MB4642:EE_
X-MS-Office365-Filtering-Correlation-Id: eaf2c6c1-7f49-4642-d4e1-08daa136f61c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BNPorjOzAKEWslc6e52rYV3l2+B+95gi0a1GEQ3UOSbkhTPQt0tzhoIUrvhsFKHs32ET2pNWfO57J4AFuvpDRuoIJs3uznVKMyg/WtGWlgMSNlbo/T+taZEKsvKrCUt9Z80m7/DUe35WI3565JFtdxv3wfOfcD9wD4BJKa6C88a85YBMLJHkfvXXzUD9wesqrnp9kiz2mDCaRDNssgK023HgXBVN0jRENnGxEeh2SWkTTCazroCwpq4jIg8TG8Ft9CQ9iUt/Uvy4EzXxDLo23yOb0riFSj4rk+yP8CTiQvXBJ0i4xuNM5C28tcG2Kgmh377iAT0Oj04eGXcAlBA0ccfw2Ox8t8U1ZlHckmPBz+FH8mwL+PjoKDJlKOVI40YKaWSfOdE12Yaztd0nlV/KFSv3SgWw598mD/N8SGRjSwesgbUyDYM544IVQCP0Nfcy8eBjiTaQDwAW2782h12BH+0+MYWh/GbNRbrfUmHi4wfHpW2jY9ye4ZjNMZIXKg96J1JkRtz9BmZ2+zgisV75RGvkwno53t8f1f9n2i+ISSKkFqTBN5jwW1dArx8/R1TM4ccyPA/DVOSzJvN2vFmtxKZUmIItsNW1qpFg6LFwoZx2byo2bFsj42ZB3RxsQ0BvGWNxlslEkTvepD7vmRUEvPHYLLm5jjRWPnBlo1CpFucWe5IHrimgLgBnqq3EYPbywvKj6QV3uWV6aze1XZ4JZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(136003)(346002)(376002)(366004)(396003)(39860400002)(451199015)(53546011)(316002)(33716001)(82960400001)(6506007)(26005)(186003)(6512007)(66476007)(86362001)(8936002)(8676002)(2906002)(9686003)(41300700001)(66574015)(83380400001)(38100700002)(4326008)(450100002)(66946007)(66556008)(6486002)(478600001)(30864003)(6666004)(44832011)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3pHYXU0TG40K2hIbkdNQ1M2TVhiR0Jrb3RNS0hEMnhHY3RrcTdRMDdNNVo2?=
 =?utf-8?B?NEZtbWk4S2pUbjlVOHlUSWNLaHllMkRmVzFGbkZidHk3enRBV3ZWUGVsZGZ1?=
 =?utf-8?B?SkFXWExQdCtxbXdMRGRqTGpUWkNieXU5eFYrTGZKVHZMdWljM1A2aW9SWjZ1?=
 =?utf-8?B?aFpDekZCNlhleC9jdlp1aDlkL0Y4ZVM1V1JKU2dzaFVQT3dGZkhaV2J6ejlm?=
 =?utf-8?B?NXhZVWxJWGxDTFRDVklTRkE1RXdyenhkVlNGYnBlUnl0QVp6d2NiZk4rY2Fq?=
 =?utf-8?B?bDFsc1N4T1RWM1hsYmNRTnQ4Z3h2S0toZWFJZFVFOU5wYUFxRVFWVEUrOXhG?=
 =?utf-8?B?clBnOXlVWTFTd1c1c2JrZUpNSkRucVVTNXJvODdMaUpQcDNCeE5PaHB6NmRV?=
 =?utf-8?B?MXUyTVl4MHNNb0JIK1IrUEhHb2NaU01Jc01VNkppL1p1N1c4U2tCSVF4YzEz?=
 =?utf-8?B?czdPREY1UFNYdTBqYmxPWnVFYXVRTHpCdm9QVXNvU3pPMmJ4aEdjc2ZnQVBm?=
 =?utf-8?B?YWFXM1NNY0ZDZmdaTThlbmNwK1dKa3BUaXVzMHltK2J0RTBMYzdMS0kva3ln?=
 =?utf-8?B?M0toS0pZL0VZMVQ3dEo0RVRxNWhCeFhyQlVnZG5GOUZYOGdsbEpWMjhLUHVo?=
 =?utf-8?B?cDNNS0ROQzR0UVVOSWt3SGJjdDVTMXZMTVNiSHBZL2d0V21XNXlLYzdkRE9Y?=
 =?utf-8?B?RllXaTdVYThSaUU5T2QvckdGUzhNMjJINFdzZFRvRjhzT1Vra0ZvcTk2UWRx?=
 =?utf-8?B?QTBwTmI4YlR0dVZsS09rNHJPQWF4cC9JQ21ZcnBOTzRxZS9OelNKNUpRMUh4?=
 =?utf-8?B?R1pZRWpmSmF3Z1ViSDRhTkwrQ1lkbmp3d01BZmdENUVSODVzSUNQMEMzY053?=
 =?utf-8?B?SGZPTTZNS0MxV2hyRFdtOU5PeFlFaUJpQzVGQ2dubEtSN1gwZWZadlY2MS9D?=
 =?utf-8?B?VW5GSVpDa1ZRSmg4bnVBU3UyWkhPQnY5OGRLSW1KSVFUdzU5SjJmVmdJTWdu?=
 =?utf-8?B?RHpMT3dyU1dzdmNUOWdsZjIxdTNBMDRTRTc4WE0xck93eDBjN0NHaWdEUVU1?=
 =?utf-8?B?ZjRuUVp5Qng3c3IvdEpHMmdiTXVaaFJINHBHaE42KzZOd2RLQlNPaFdwYjdS?=
 =?utf-8?B?OHZ6L2M4czd0ZXNtT0lQZW9qV3FYTFJ0ZUY0OHFjd0hMY3VrVWRrbUViNldk?=
 =?utf-8?B?UVJWM3dZNjNuTExpTmtFcWI1NjE4VE5kajdrS3NuNDZ0ajZVSmJMVFFoR1lS?=
 =?utf-8?B?U0JLVkhwN1NWN1NvUWFHOURxK2tUYitIeDgzNTdWYXJsRXJ1aktBOHdhd2px?=
 =?utf-8?B?T3RNRjgrZnlndEQrbDRnV0grRHdXbXNzclY4elUrN1JoZnlLZkdabFFZRC9O?=
 =?utf-8?B?R1BBQ1YyMFIvc0RCWXN4RTVtTXgvODhLUWRnQnlCd01nYU1uQlo0aGF2ZUlQ?=
 =?utf-8?B?TUpkaEtmbTQzRU9lN2o0UzBaOW4vUDRIS0VaNU9CVjdlMUtiTE9mUVhiRzAy?=
 =?utf-8?B?ZjRWWUM0UGJYKzBxYVF1dEcyMHV5Q1FSM1ZoUy91WHRrOElocE9mKzBHdTlm?=
 =?utf-8?B?V0R5Sm9Ya1N0MkNIczJucW0yT0drdHdBWGJrcjNGdEJhV044ek1teEdrRGk0?=
 =?utf-8?B?bHhKUC9ubnk0bjE0WjFqNjBJMHhhbHp6MEIyMVVLWDF4ZWd2WEV4cXdGYkJo?=
 =?utf-8?B?MnEyZjB5MUoxdFZ3M0czMEZYa1NqaUw3MktBQ0NoOFJJQVpwTno0bkJBWnZs?=
 =?utf-8?B?bU9wV3ZnSi9SNVB0cG04L0RVZGJ0MFBrN21yTC9Rc21Bdzk1YW5ML0plejNJ?=
 =?utf-8?B?UkZZb3FUUHhVRmREUTR1UVZFMCs3MmlBeVgwVUE4dENYdER3ZC9PT1VsUS9T?=
 =?utf-8?B?clh4ZC84RDFUSTEyT3RXUHRlckRmUjl5b0VOV1BkWFYxaS8wYUpyTGlqeDBC?=
 =?utf-8?B?YngyQW5EdERHQjdsdGtkRFpjVEZJQm03bVAxMzJlenpUVmRvQ2srOHlWOFFJ?=
 =?utf-8?B?a3VQWGh4dXpDU3dlTWpmV1Eyd2lpYWdYSURlOWtUa2FqMGpQYU9LcHViWnBV?=
 =?utf-8?B?N0h5eHczeWd2L01WMWlkSEdvdEJjelVWT2I1SkVrWDdSaHJRMzZ1M1UybUx2?=
 =?utf-8?B?MlFFYjhyNjRQL1FXM3FQeGV4S296MXRiV0pVSTZ6TFkwTWN6TGZ3SDQrN3ZJ?=
 =?utf-8?Q?sdEBJ/107SE9/Cwb4kkGEUT4/sUHSCV3eseI6lBCVlQW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf2c6c1-7f49-4642-d4e1-08daa136f61c
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 09:51:05.9799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: grTPh39OV+fXl1hwChrcF7BKNVorL+AJy6ONwb7tCVH9/flTQbzOVxcYx9AtZop0WX8hRgVN9x4kWpQQ3eiYSvZSpxGwBiKSoe0dTkelxDXq7/n8yp4VrV7NKDkqMWGG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4642
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19.09.2022 15:32, Matt Roper wrote:
> Starting in Xe_HP, several registers our driver works with have been
> converted from singleton registers into replicated registers with
> multicast behavior.  Although the registers are still located at the
> same MMIO offsets as on previous platforms, let's duplicate the register
> definitions in preparation for upcoming patches that will handle
> multicast registers in a special manner.
> 
> The registers that are now replicated on Xe_HP are:
>  * PAT_INDEX (mslice replication)
>  * FF_MODE2 (gslice replication)
>  * COMMON_SLICE_CHICKEN3 (gslice replication)
>  * SLICE_COMMON_ECO_CHICKEN1 (gslice replication)
>  * SLICE_UNIT_LEVEL_CLKGATE (gslice replication)
>  * LNCFCMOCS (lncf replication)
> 
> Bspec: 66534
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h     | 18 ++++++++-----
>  drivers/gpu/drm/i915/gt/intel_gtt.c         | 29 ++++++++++++++-------
>  drivers/gpu/drm/i915/gt/intel_mocs.c        |  5 +++-
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 24 ++++++++---------
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c  |  7 +++--
>  5 files changed, 52 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index e5a1ea255640..559e3473f14c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -329,6 +329,7 @@
>  #define GEN7_TLB_RD_ADDR			_MMIO(0x4700)
>  
>  #define GEN12_PAT_INDEX(index)			_MMIO(0x4800 + (index) * 4)
> +#define XEHP_PAT_INDEX(index)			_MMIO(0x4800 + (index) * 4)
>  
>  #define XEHP_TILE0_ADDR_RANGE			_MMIO(0x4900)
>  #define   XEHP_TILE_LMEM_RANGE_SHIFT		8
> @@ -387,7 +388,8 @@
>  #define   DIS_OVER_FETCH_CACHE			REG_BIT(1)
>  #define   DIS_MULT_MISS_RD_SQUASH		REG_BIT(0)
>  
> -#define FF_MODE2				_MMIO(0x6604)
> +#define GEN12_FF_MODE2				_MMIO(0x6604)
> +#define XEHP_FF_MODE2				_MMIO(0x6604)
>  #define   FF_MODE2_GS_TIMER_MASK		REG_GENMASK(31, 24)
>  #define   FF_MODE2_GS_TIMER_224			REG_FIELD_PREP(FF_MODE2_GS_TIMER_MASK, 224)
>  #define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
> @@ -442,6 +444,7 @@
>  #define GEN8_HDC_CHICKEN1			_MMIO(0x7304)
>  
>  #define GEN11_COMMON_SLICE_CHICKEN3		_MMIO(0x7304)
> +#define XEHP_COMMON_SLICE_CHICKEN3		_MMIO(0x7304)
>  #define   DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN	REG_BIT(12)
>  #define   XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE	REG_BIT(12)
>  #define   GEN11_BLEND_EMB_FIX_DISABLE_IN_RCC	REG_BIT(11)
> @@ -455,10 +458,9 @@
>  #define   DISABLE_PIXEL_MASK_CAMMING		(1 << 14)
>  
>  #define GEN9_SLICE_COMMON_ECO_CHICKEN1		_MMIO(0x731c)
> -#define   GEN11_STATE_CACHE_REDIRECT_TO_CS	(1 << 11)
> -
> -#define SLICE_COMMON_ECO_CHICKEN1		_MMIO(0x731c)
> +#define XEHP_SLICE_COMMON_ECO_CHICKEN1		_MMIO(0x731c)
>  #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE	REG_BIT(14)
> +#define   GEN11_STATE_CACHE_REDIRECT_TO_CS	(1 << 11)
>  
>  #define GEN9_SLICE_PGCTL_ACK(slice)		_MMIO(0x804c + (slice) * 0x4)
>  #define GEN10_SLICE_PGCTL_ACK(slice)		_MMIO(0x804c + ((slice) / 3) * 0x34 + \
> @@ -703,7 +705,8 @@
>  #define   GAMTLBVEBOX0_CLKGATE_DIS		REG_BIT(16)
>  #define   LTCDD_CLKGATE_DIS			REG_BIT(10)
>  
> -#define SLICE_UNIT_LEVEL_CLKGATE		_MMIO(0x94d4)
> +#define GEN11_SLICE_UNIT_LEVEL_CLKGATE		_MMIO(0x94d4)
> +#define XEHP_SLICE_UNIT_LEVEL_CLKGATE		_MMIO(0x94d4)
>  #define   SARBUNIT_CLKGATE_DIS			(1 << 5)
>  #define   RCCUNIT_CLKGATE_DIS			(1 << 7)
>  #define   MSCUNIT_CLKGATE_DIS			(1 << 10)
> @@ -718,7 +721,7 @@
>  #define   VSUNIT_CLKGATE_DIS_TGL		REG_BIT(19)
>  #define   PSDUNIT_CLKGATE_DIS			REG_BIT(5)
>  
> -#define SUBSLICE_UNIT_LEVEL_CLKGATE		_MMIO(0x9524)
> +#define GEN11_SUBSLICE_UNIT_LEVEL_CLKGATE	_MMIO(0x9524)
>  #define   DSS_ROUTER_CLKGATE_DIS		REG_BIT(28)
>  #define   GWUNIT_CLKGATE_DIS			REG_BIT(16)
>  
> @@ -943,7 +946,8 @@
>  
>  /* MOCS (Memory Object Control State) registers */
>  #define GEN9_LNCFCMOCS(i)			_MMIO(0xb020 + (i) * 4)	/* L3 Cache Control */

GEN9_LNCFCMOCS is used in few functions in file selftest_mocs.c. This
patch has untouched those instances. Is it by intention to handle it
part of a separate series?  If the plan is to handle it later sometime
can we create a ticket to keep track of it?

Regards,
Bala

> -#define GEN9_LNCFCMOCS_REG_COUNT		32
> +#define XEHP_LNCFCMOCS(i)			_MMIO(0xb020 + (i) * 4)	/* L3 Cache Control */
> +#define LNCFCMOCS_REG_COUNT			32
>  
>  #define GEN7_L3CNTLREG3				_MMIO(0xb024)
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
> index b67831833c9a..601d89b4feb1 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -479,15 +479,26 @@ void gtt_write_workarounds(struct intel_gt *gt)
>  
>  static void tgl_setup_private_ppat(struct intel_uncore *uncore)
>  {
> -	/* TGL doesn't support LLC or AGE settings */
> -	intel_uncore_write(uncore, GEN12_PAT_INDEX(0), GEN8_PPAT_WB);
> -	intel_uncore_write(uncore, GEN12_PAT_INDEX(1), GEN8_PPAT_WC);
> -	intel_uncore_write(uncore, GEN12_PAT_INDEX(2), GEN8_PPAT_WT);
> -	intel_uncore_write(uncore, GEN12_PAT_INDEX(3), GEN8_PPAT_UC);
> -	intel_uncore_write(uncore, GEN12_PAT_INDEX(4), GEN8_PPAT_WB);
> -	intel_uncore_write(uncore, GEN12_PAT_INDEX(5), GEN8_PPAT_WB);
> -	intel_uncore_write(uncore, GEN12_PAT_INDEX(6), GEN8_PPAT_WB);
> -	intel_uncore_write(uncore, GEN12_PAT_INDEX(7), GEN8_PPAT_WB);
> +	if (GRAPHICS_VER_FULL(uncore->i915) >= IP_VER(12, 50)) {
> +		intel_uncore_write(uncore, XEHP_PAT_INDEX(0), GEN8_PPAT_WB);
> +		intel_uncore_write(uncore, XEHP_PAT_INDEX(1), GEN8_PPAT_WC);
> +		intel_uncore_write(uncore, XEHP_PAT_INDEX(2), GEN8_PPAT_WT);
> +		intel_uncore_write(uncore, XEHP_PAT_INDEX(3), GEN8_PPAT_UC);
> +		intel_uncore_write(uncore, XEHP_PAT_INDEX(4), GEN8_PPAT_WB);
> +		intel_uncore_write(uncore, XEHP_PAT_INDEX(5), GEN8_PPAT_WB);
> +		intel_uncore_write(uncore, XEHP_PAT_INDEX(6), GEN8_PPAT_WB);
> +		intel_uncore_write(uncore, XEHP_PAT_INDEX(7), GEN8_PPAT_WB);
> +	} else {
> +		/* TGL doesn't support LLC or AGE settings */
> +		intel_uncore_write(uncore, GEN12_PAT_INDEX(0), GEN8_PPAT_WB);
> +		intel_uncore_write(uncore, GEN12_PAT_INDEX(1), GEN8_PPAT_WC);
> +		intel_uncore_write(uncore, GEN12_PAT_INDEX(2), GEN8_PPAT_WT);
> +		intel_uncore_write(uncore, GEN12_PAT_INDEX(3), GEN8_PPAT_UC);
> +		intel_uncore_write(uncore, GEN12_PAT_INDEX(4), GEN8_PPAT_WB);
> +		intel_uncore_write(uncore, GEN12_PAT_INDEX(5), GEN8_PPAT_WB);
> +		intel_uncore_write(uncore, GEN12_PAT_INDEX(6), GEN8_PPAT_WB);
> +		intel_uncore_write(uncore, GEN12_PAT_INDEX(7), GEN8_PPAT_WB);
> +	}
>  }
>  
>  static void icl_setup_private_ppat(struct intel_uncore *uncore)
> diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915/gt/intel_mocs.c
> index c6ebe2781076..06643701bf24 100644
> --- a/drivers/gpu/drm/i915/gt/intel_mocs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
> @@ -608,7 +608,10 @@ static void init_l3cc_table(struct intel_uncore *uncore,
>  	u32 l3cc;
>  
>  	for_each_l3cc(l3cc, table, i)
> -		intel_uncore_write_fw(uncore, GEN9_LNCFCMOCS(i), l3cc);
> +		if (GRAPHICS_VER_FULL(uncore->i915) >= IP_VER(12, 50))
> +			intel_uncore_write_fw(uncore, XEHP_LNCFCMOCS(i), l3cc);
> +		else
> +			intel_uncore_write_fw(uncore, GEN9_LNCFCMOCS(i), l3cc);
>  }
>  
>  void intel_mocs_init_engine(struct intel_engine_cs *engine)
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index e382cb4c6971..eff5f4f85374 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -572,7 +572,7 @@ static void dg2_ctx_gt_tuning_init(struct intel_engine_cs *engine,
>  	wa_write_clr_set(wal, GEN11_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
>  			 REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f));
>  	wa_add(wal,
> -	       FF_MODE2,
> +	       XEHP_FF_MODE2,
>  	       FF_MODE2_TDS_TIMER_MASK,
>  	       FF_MODE2_TDS_TIMER_128,
>  	       0, false);
> @@ -599,7 +599,7 @@ static void gen12_ctx_gt_tuning_init(struct intel_engine_cs *engine,
>  	 * verification is ignored.
>  	 */
>  	wa_add(wal,
> -	       FF_MODE2,
> +	       GEN12_FF_MODE2,
>  	       FF_MODE2_TDS_TIMER_MASK,
>  	       FF_MODE2_TDS_TIMER_128,
>  	       0, false);
> @@ -637,7 +637,7 @@ static void gen12_ctx_workarounds_init(struct intel_engine_cs *engine,
>  	 * to Wa_1608008084.
>  	 */
>  	wa_add(wal,
> -	       FF_MODE2,
> +	       GEN12_FF_MODE2,
>  	       FF_MODE2_GS_TIMER_MASK,
>  	       FF_MODE2_GS_TIMER_224,
>  	       0, false);
> @@ -670,7 +670,7 @@ static void dg2_ctx_workarounds_init(struct intel_engine_cs *engine,
>  
>  	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0, STEP_B0)) {
>  		/* Wa_14010469329:dg2_g10 */
> -		wa_masked_en(wal, GEN11_COMMON_SLICE_CHICKEN3,
> +		wa_masked_en(wal, XEHP_COMMON_SLICE_CHICKEN3,
>  			     XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE);
>  
>  		/*
> @@ -678,12 +678,12 @@ static void dg2_ctx_workarounds_init(struct intel_engine_cs *engine,
>  		 * Wa_22010613112:dg2_g10
>  		 * Wa_14010698770:dg2_g10
>  		 */
> -		wa_masked_en(wal, GEN11_COMMON_SLICE_CHICKEN3,
> +		wa_masked_en(wal, XEHP_COMMON_SLICE_CHICKEN3,
>  			     GEN12_DISABLE_CPS_AWARE_COLOR_PIPE);
>  	}
>  
>  	/* Wa_16013271637:dg2 */
> -	wa_masked_en(wal, SLICE_COMMON_ECO_CHICKEN1,
> +	wa_masked_en(wal, XEHP_SLICE_COMMON_ECO_CHICKEN1,
>  		     MSC_MSAA_REODER_BUF_BYPASS_DISABLE);
>  
>  	/* Wa_14014947963:dg2 */
> @@ -1255,14 +1255,14 @@ icl_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  
>  	/* Wa_1406680159:icl,ehl */
>  	wa_write_or(wal,
> -		    SUBSLICE_UNIT_LEVEL_CLKGATE,
> +		    GEN11_SUBSLICE_UNIT_LEVEL_CLKGATE,
>  		    GWUNIT_CLKGATE_DIS);
>  
>  	/* Wa_1607087056:icl,ehl,jsl */
>  	if (IS_ICELAKE(i915) ||
>  	    IS_JSL_EHL_GRAPHICS_STEP(i915, STEP_A0, STEP_B0))
>  		wa_write_or(wal,
> -			    SLICE_UNIT_LEVEL_CLKGATE,
> +			    GEN11_SLICE_UNIT_LEVEL_CLKGATE,
>  			    L3_CLKGATE_DIS | L3_CR2X_CLKGATE_DIS);
>  
>  	/*
> @@ -1322,7 +1322,7 @@ tgl_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  	/* Wa_1607087056:tgl also know as BUG:1409180338 */
>  	if (IS_TGL_UY_GRAPHICS_STEP(i915, STEP_A0, STEP_B0))
>  		wa_write_or(wal,
> -			    SLICE_UNIT_LEVEL_CLKGATE,
> +			    GEN11_SLICE_UNIT_LEVEL_CLKGATE,
>  			    L3_CLKGATE_DIS | L3_CR2X_CLKGATE_DIS);
>  
>  	/* Wa_1408615072:tgl[a0] */
> @@ -1341,7 +1341,7 @@ dg1_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  	/* Wa_1607087056:dg1 */
>  	if (IS_DG1_GRAPHICS_STEP(i915, STEP_A0, STEP_B0))
>  		wa_write_or(wal,
> -			    SLICE_UNIT_LEVEL_CLKGATE,
> +			    GEN11_SLICE_UNIT_LEVEL_CLKGATE,
>  			    L3_CLKGATE_DIS | L3_CR2X_CLKGATE_DIS);
>  
>  	/* Wa_1409420604:dg1 */
> @@ -1445,7 +1445,7 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  			    CG3DDISCFEG_CLKGATE_DIS);
>  
>  		/* Wa_14011006942:dg2 */
> -		wa_write_or(wal, SUBSLICE_UNIT_LEVEL_CLKGATE,
> +		wa_write_or(wal, GEN11_SUBSLICE_UNIT_LEVEL_CLKGATE,
>  			    DSS_ROUTER_CLKGATE_DIS);
>  	}
>  
> @@ -1457,7 +1457,7 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  		wa_write_or(wal, UNSLCGCTL9444, LTCDD_CLKGATE_DIS);
>  
>  		/* Wa_14011371254:dg2_g10 */
> -		wa_write_or(wal, SLICE_UNIT_LEVEL_CLKGATE, NODEDSS_CLKGATE_DIS);
> +		wa_write_or(wal, XEHP_SLICE_UNIT_LEVEL_CLKGATE, NODEDSS_CLKGATE_DIS);
>  
>  		/* Wa_14011431319:dg2_g10 */
>  		wa_write_or(wal, UNSLCGCTL9440, GAMTLBOACS_CLKGATE_DIS |
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index 74cbe8eaf531..7d9f4f57ca95 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -372,8 +372,11 @@ static int guc_mmio_regset_init(struct temp_regset *regset,
>  					false);
>  
>  	/* add in local MOCS registers */
> -	for (i = 0; i < GEN9_LNCFCMOCS_REG_COUNT; i++)
> -		ret |= GUC_MMIO_REG_ADD(gt, regset, GEN9_LNCFCMOCS(i), false);
> +	for (i = 0; i < LNCFCMOCS_REG_COUNT; i++)
> +		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50))
> +			ret |= GUC_MMIO_REG_ADD(gt, regset, XEHP_LNCFCMOCS(i), false);
> +		else
> +			ret |= GUC_MMIO_REG_ADD(gt, regset, GEN9_LNCFCMOCS(i), false);
>  
>  	return ret ? -1 : 0;
>  }
> -- 
> 2.37.3
> 
