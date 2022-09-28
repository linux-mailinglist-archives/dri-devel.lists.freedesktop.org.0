Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA105ED7A6
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 10:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B030310E347;
	Wed, 28 Sep 2022 08:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A178A10E368;
 Wed, 28 Sep 2022 08:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664353550; x=1695889550;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=P8Oq990P6H6DU+r5LMSDI3FThlfKSAbBhM8QF2hhvQI=;
 b=n2Sd2dr9q4yYgQxv9GV2FfyKLpk7C2bSN1ela/s7xlIAXB4JFoG8xEHF
 5e4u6kN/cDr5isQywX0DTlg4WHoOMEjjX7ePKApqzukWtmIZFdd/PwF5I
 4lDapTeffe3GESoL0M950NUXkDHIhW0nqkAXFMvMbAk251TEoVfKJ6B0O
 XnLK2Vqb/FG5Cj+0J8HYQk0iIeRctdmasjaAHnHcH+5dfCsLTmgs+c5Yt
 0b+ZvybAaEYQomRgwfpo0ivSu9A96CVwwcDTYfka/S1TtpNhkFnD0hRf/
 V/DhQJaP2JkU8cbr5yo3eqG//Pi+lRaqTr/KWDFm2xvCAkZLvvzJji+kR w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="300260484"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; d="scan'208";a="300260484"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 01:25:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="950612941"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; d="scan'208";a="950612941"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 28 Sep 2022 01:25:47 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 01:25:46 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 28 Sep 2022 01:25:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 28 Sep 2022 01:25:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YFB6BfFUYKYWxJU/WtRlexQxrQohSKbYLNUG+WFE1Og2aqbP4hv7uJU8NKUTG05TPgvKzxy2A7EW2gEcI13nMVUMM1MOrRuDWGLvu5dlWgvwPbW0kvCZPicbTPEpQY1YZ6alxC6N5KLOeRhfcX7rPqY78od3uvBbAHB4xc9rxCwBnxM8GjN+Yuj3vh5yBvWSGwWXKaDiaboUTSvzwS4EL2GIkX5q/Gv6PKSGR9CukqkVgRCI5ccgTg+qSCYrSlqhxLrZUOubsScWRqlgufDTFToh76s3hDi2q4ePPyqqzoi+W/PFLYPQDz8mGAbaZKohzPZThk7gkaJSKf3zsgZuLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJbw43k3EylxsIF0tSt7EcgsfWcYvj/JAmi3r6pyCwY=;
 b=MJWvHyTY51/koQP4H49MWbksF9DjWFhgKaLijxH0BtsXpA7s+DdFfyTOBOcBF3xhYBUJnvbsZMnXpmxC7c0w20girZLl3fcX0bjbXE6KC0l7m854i7liA17rP2nGnX5q7UqmMxKf2iZry5dgrJRDvWNMBzxHdRgbqChUV98arMuAutHpIkdfahskEKAZE1hRDjGVgAOLCH876gtOhmdXiF3/fBcphUcgDDQKP95kUAHL4kBlZtZvHpl+0hdOutiyB8xJij6R+QFY+UN6NBuGtJ4p6WOXZK8P/BHf22DZCOofxAnBCeLz12jNa5ytZmNe3OMPx/oY2auJEK5XzF69fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 IA1PR11MB7366.namprd11.prod.outlook.com (2603:10b6:208:422::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.25; Wed, 28 Sep 2022 08:25:44 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67%3]) with mapi id 15.20.5654.026; Wed, 28 Sep 2022
 08:25:44 +0000
Date: Wed, 28 Sep 2022 13:55:33 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 01/12] drm/i915/gen8: Create separate reg definitions for
 new MCR registers
Message-ID: <YzQE/X/9kr6ggkL8@bala-ubuntu>
References: <20220919223259.263525-1-matthew.d.roper@intel.com>
 <20220919223259.263525-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220919223259.263525-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN2PR01CA0216.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::14) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|IA1PR11MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d38cd6e-51e6-47ef-952b-08daa12b0930
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZLN4fl6ieNKn761UxleKEuC3K6kHe6w4+9x/3OBA953P2LhDgPe2lr+QE6949hqRLIGjOTkO6tDGo9EtSQl+V6I4ugto2NCOekB5/XOlqeBKCiLK910Y7MUSOLrKk6u0qX0jXwI+GbThNXSlGHWcQywTuBD3Hh52aFYtwZ4SO0fbM7sAgJo7zgWr6ISr76X3lWZlC0+XrIR8bkl1RNJFQw4xqtj42N7H9KN0YWhuRSn5obhUcLOyPg/7B9zorXlW8CWE7ddK0jWDe9ymcbmi0ITXQCtlAGwc4258JgYTeD6HMqGL4n4+NOJ5XgOEWZ1oalfkrzUtaAFFqTxD2mUV38EhhmaUSmICuTuH3b0UHLRS61hLk7OkSmuiYeMDFjGjNOo7nOoowRZZrT1DijHiNaxfLVORYybU5iYaKEhKGwU5RY04y9mivigY/o3S3nGxgO4znyb/KvrIw0//ituZytNXl6RsLjEXe8k3ErB8589Jdtyj7uGspFf/nNiSRw1n58hUYXc9B7SUaIzxlNQUo8btH0fDBGIvgiTwvLB6J/Q954IqzgyawE7i7R/3Ryt0wSii9K3nS1MnUxY9uszRsFz5xk65ph9L2JGQhHpL57Xp/0YHJwPdgghO1YQFNpWIT5K/YpSqLW6gLa+0hfkDlZk3Xl27q4ZbYQicijuJ0OjNwVDvvsJVaXZJINl3Cmcu4VxDahpvs/1ce55i31mPJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(366004)(376002)(396003)(346002)(136003)(39860400002)(451199015)(6666004)(8936002)(38100700002)(6512007)(44832011)(26005)(82960400001)(33716001)(41300700001)(30864003)(5660300002)(2906002)(83380400001)(186003)(53546011)(9686003)(6506007)(6486002)(86362001)(66476007)(66946007)(66556008)(316002)(8676002)(4326008)(450100002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2FTS1VZZG9IVUpNc0NITnZmY3JubUVTeXhNcHZJSlo0U2pJVkhYQkZhY0p5?=
 =?utf-8?B?Rm1VN0MybmRSK2w3b1Rvb3kwYURCWHBFUkJzQUhYMEQyWDRWU0tBT1k4L3pJ?=
 =?utf-8?B?VVBBc3lnM21zbUdyUnFzczZHa3pKZ0hEaC9jeCtRTnFObDh4RjdPYm1hc2l6?=
 =?utf-8?B?bjl0YnlaTUNUbHNQMFIxQkswQlBQT1g4eEphSXMyTzNSYWtuOHBLSy8wSk9r?=
 =?utf-8?B?cVJORG9uLzBieGwvU1hHL2hLTkZNNmEvRUlNd3VZeGdkVk0wQXVpK01XT0ZP?=
 =?utf-8?B?N0twQUU4UnI4MUtTMXBBT2xwOU94c2VDMTdIckhabFVkSjFYOFh6R2JETElJ?=
 =?utf-8?B?WjNYNnlndHdTRGRPSWdCSjVPYUtzdDNxbGdreHJOK1JBQVVabW8wRm8rY0RZ?=
 =?utf-8?B?cG5MWkZUNHlrQTAzREVUMDJiRTQrOTlXSWF5WWYzVUVLZERRTGZpVHBmZU5D?=
 =?utf-8?B?ZW5OZExtckpFN2REelNLNzNNWFR2VktpbFFJLzc4aC9JRnRiaklwV3lKZy9s?=
 =?utf-8?B?cDZOa2ljSElLNnY0Q2s2eWtFYnZQNVlXUzhTSEVxL0JnTjhxbmlibkpOVHJh?=
 =?utf-8?B?elU5MnZCWnY3TU9wSUNDUkxRRndvV0ZZLzdTT293YWplY1JQVmlxdUIvektU?=
 =?utf-8?B?RzFXWUk5d0ZCc1M4VUluUGVGY0ZHYWx2VnVOZTNzSGZnWlA0NkNGU0tic2VU?=
 =?utf-8?B?N1FkRE5na2ZYWlFqc0ZKMG84eHFpcS9vd3NpK3RNbkVvTlZZQ2Ewc2JrZnJn?=
 =?utf-8?B?VEM5cTRacklDQi9BVzZKd0dOTDNvNjgrSmlTQmVjVTZvTFZtNURkU2h5SEVD?=
 =?utf-8?B?aE44WWpIaCtZK1lIZitjZFNod2g1SkhQcE1aYld3Z0ZUV2RrT0dINFdRdVJF?=
 =?utf-8?B?NzJ2MENZZnoxOTJRQ2xuYVp1VVlCM0cxRlEycjE4WndzL0o2OFZBZHNWaGYz?=
 =?utf-8?B?WGpJYmN0NDVwL0tkODM0M1l1ajJINmtsb05CdEliUHhzT01tTEtCVWtFV3dX?=
 =?utf-8?B?LzVpSTNjT0JrSkV3WDVva1dRaXo0T1kzazR3Mm5nK2VTLy9TT21ZSUhVZzNi?=
 =?utf-8?B?RzhsaThmMXNaS1BwSGhEckdwVEdCTjBXTkJzblorMXdwZjh2dHc4QjQzV2kr?=
 =?utf-8?B?OGNEOVBFRFdZMlVmRGVxYmNQendYN2Vnak9vQVlocFN6WXNoRitQT2wydDBu?=
 =?utf-8?B?Sm14WlVPZ0lTOEROMjY2ZTIvREhxRXMzN3Zuc2xsSWhnVDhYbUt4RjRLZmhF?=
 =?utf-8?B?QVNuVElQeVd6SkNLMm9mbDlXZ1pwaTdYQ1lsOWh3Y1N2dzdEY3hpL3drcEtO?=
 =?utf-8?B?YnJsVzBBUXJVY09ObHFyd0RkNkM2M3dLZStKNWI1L3RpWGlvQWFKZ0VaVnFw?=
 =?utf-8?B?M2U2emtrUW12UjhNUjlmclN5VXFBQ043ZEQvWDV3UlJNaGRNV3c2cHAvblVr?=
 =?utf-8?B?Y0dHQVdGdy9TNEZiWStZL0toN0VOVUFOaysxMHc2MmVMYWdLYWYwbVpJa3dP?=
 =?utf-8?B?dWxlZG92ckpDTTVhZ2ZNV2trTUJrOE5NaDhCK3pNVWVDVWxLcW5iNEdQOS93?=
 =?utf-8?B?MHhvTHZMRUVtdmdZZkdXUHZkYVZEZFhEZXlGYVZVS3NZZ3ZYdWpYSERwd1BZ?=
 =?utf-8?B?Qm1GZjlCN1lKK2ZoUGxhSnNtb2N6VUx5N0RWdDZvK0d4VzJqbEI4QUZ4WlVQ?=
 =?utf-8?B?UWVGemxZc3hnN1U0ZTk1eHBUZXh6dXozTDE2T2R3NXFoV01Nck45bU9QNCt4?=
 =?utf-8?B?UGh3dzJrRTZrYWhldFNQR2NFVkxTMktzRXNEc0tkWVpJVHRpMEFKTW93QXRX?=
 =?utf-8?B?dXpxbjM5MnNBTjBtMExTQUZqOFBUNGFmb1RrZzNxWTlPSWNkNFB2ME9ORHAy?=
 =?utf-8?B?YnIwVElEakZjak5rVkR4U0poWlhDY2tBZW9Cam8yYUZFQlZXU3pkWVBPbkNL?=
 =?utf-8?B?NjQ1dkg5VzFGY3BZOVA0Y3JHWVB1RzFPVUlEUDBGQ251di9QQUVTY00rMWMx?=
 =?utf-8?B?Y2FmQlVCaUdzblAvSFpyVDJnUk1jV0JDWmJXc2diVDN5T3JWK2NEekgrTzdm?=
 =?utf-8?B?ZEpVOUhPQTh2NGVPUFppNUNzU3FqdmJYWnFRYmlnTUx4ck9yS2Fkdy82UzV4?=
 =?utf-8?B?MTVNN09pekxRTUFLZ09Ecm1pSnhscFh6ZjZWZkxUUWhsMnJ6MjlNM1JnYjhO?=
 =?utf-8?Q?3vafkbU714G8IxQxVHg7R3Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d38cd6e-51e6-47ef-952b-08daa12b0930
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 08:25:43.8378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yYdQe8+nDTnJbflVNZ2gT9tVo9vgGqGLYUeZ4vBfGsxcYDTsfSiqCX6q4zWotM+F370d93P/tiaERWXD0+phXkhg2xkwKK8CNm9mTVgGBoNjOGTcxtEnOPzFQqJz5eLk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7366
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
> Gen8 was the first time our hardware had multicast registers (or at
> least the first time the multicast nature was exposed and MMIO accesses
> could be steered).  There are some registers that transitioned from
> singleton behavior to multicast during the gen7 -> gen8 transition;
> let's duplicate the register definitions for those registers in
> preparation for upcoming patches that will handle MCR registers in a
> special manner.
> 
> The registers adjusted are:
>  * MISCCPCTL
>  * SAMPLER_INSTDONE
>  * ROW_INSTDONE
>  * ROW_CHICKEN2
>  * HALF_SLICE_CHICKEN1
>  * HALF_SLICE_CHICKEN3
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  4 ++--
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h       | 11 +++++++++-
>  drivers/gpu/drm/i915/gt/intel_workarounds.c   | 22 +++++++++----------
>  .../gpu/drm/i915/gt/uc/intel_guc_capture.c    |  4 ++--
>  drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |  2 +-
>  drivers/gpu/drm/i915/gvt/handlers.c           |  2 +-
>  drivers/gpu/drm/i915/gvt/mmio_context.c       |  2 +-
>  drivers/gpu/drm/i915/intel_gvt_mmio_table.c   |  2 +-
>  drivers/gpu/drm/i915/intel_pm.c               | 10 ++++-----
>  9 files changed, 34 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 2ddcad497fa3..c408bac3c533 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -1559,11 +1559,11 @@ void intel_engine_get_instdone(const struct intel_engine_cs *engine,
>  		for_each_ss_steering(iter, engine->gt, slice, subslice) {
>  			instdone->sampler[slice][subslice] =
>  				intel_gt_mcr_read(engine->gt,
> -						  GEN7_SAMPLER_INSTDONE,
> +						  GEN8_SAMPLER_INSTDONE,
>  						  slice, subslice);
>  			instdone->row[slice][subslice] =
>  				intel_gt_mcr_read(engine->gt,
> -						  GEN7_ROW_INSTDONE,
> +						  GEN8_ROW_INSTDONE,
>  						  slice, subslice);
>  		}
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 1cbb7226400b..e5a1ea255640 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -647,6 +647,9 @@
>  
>  #define GEN7_MISCCPCTL				_MMIO(0x9424)
>  #define   GEN7_DOP_CLOCK_GATE_ENABLE		(1 << 0)
> +
> +#define GEN8_MISCCPCTL				_MMIO(0x9424)
> +#define   GEN8_DOP_CLOCK_GATE_ENABLE		REG_BIT(0)

When I went through the driver to check if is there any instance where
platforms above Gen7 still using Gen7 registers, I found the following
two functions still using GEN7_MISCCPCTL. Can you check?

  * dg2_gt_workarounds_init
  * pvc_gt_workarounds_init

Regards,
Bala

>  #define   GEN12_DOP_CLOCK_GATE_RENDER_ENABLE	REG_BIT(1)
>  #define   GEN8_DOP_CLOCK_GATE_CFCLK_ENABLE	(1 << 2)
>  #define   GEN8_DOP_CLOCK_GATE_GUC_ENABLE	(1 << 4)
> @@ -1068,18 +1071,22 @@
>  #define GEN12_GAM_DONE				_MMIO(0xcf68)
>  
>  #define GEN7_HALF_SLICE_CHICKEN1		_MMIO(0xe100) /* IVB GT1 + VLV */
> +#define GEN8_HALF_SLICE_CHICKEN1		_MMIO(0xe100)
>  #define   GEN7_MAX_PS_THREAD_DEP		(8 << 12)
>  #define   GEN7_SINGLE_SUBSCAN_DISPATCH_ENABLE	(1 << 10)
>  #define   GEN7_SBE_SS_CACHE_DISPATCH_PORT_SHARING_DISABLE	(1 << 4)
>  #define   GEN7_PSD_SINGLE_PORT_DISPATCH_ENABLE	(1 << 3)
>  
>  #define GEN7_SAMPLER_INSTDONE			_MMIO(0xe160)
> +#define GEN8_SAMPLER_INSTDONE			_MMIO(0xe160)
>  #define GEN7_ROW_INSTDONE			_MMIO(0xe164)
> +#define GEN8_ROW_INSTDONE			_MMIO(0xe164)
>  
>  #define HALF_SLICE_CHICKEN2			_MMIO(0xe180)
>  #define   GEN8_ST_PO_DISABLE			(1 << 13)
>  
> -#define HALF_SLICE_CHICKEN3			_MMIO(0xe184)
> +#define HSW_HALF_SLICE_CHICKEN3			_MMIO(0xe184)
> +#define GEN8_HALF_SLICE_CHICKEN3		_MMIO(0xe184)
>  #define   HSW_SAMPLE_C_PERFORMANCE		(1 << 9)
>  #define   GEN8_CENTROID_PIXEL_OPT_DIS		(1 << 8)
>  #define   GEN9_DISABLE_OCL_OOB_SUPPRESS_LOGIC	(1 << 5)
> @@ -1132,6 +1139,8 @@
>  #define   DISABLE_EARLY_EOT			REG_BIT(1)
>  
>  #define GEN7_ROW_CHICKEN2			_MMIO(0xe4f4)
> +
> +#define GEN8_ROW_CHICKEN2			_MMIO(0xe4f4)
>  #define   GEN12_DISABLE_READ_SUPPRESSION	REG_BIT(15)
>  #define   GEN12_DISABLE_EARLY_READ		REG_BIT(14)
>  #define   GEN12_ENABLE_LARGE_GRF_MODE		REG_BIT(12)
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 6d2003d598e6..e382cb4c6971 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -295,10 +295,10 @@ static void bdw_ctx_workarounds_init(struct intel_engine_cs *engine,
>  	 * Also see the related UCGTCL1 write in bdw_init_clock_gating()
>  	 * to disable EUTC clock gating.
>  	 */
> -	wa_masked_en(wal, GEN7_ROW_CHICKEN2,
> +	wa_masked_en(wal, GEN8_ROW_CHICKEN2,
>  		     DOP_CLOCK_GATING_DISABLE);
>  
> -	wa_masked_en(wal, HALF_SLICE_CHICKEN3,
> +	wa_masked_en(wal, GEN8_HALF_SLICE_CHICKEN3,
>  		     GEN8_SAMPLER_POWER_BYPASS_DIS);
>  
>  	wa_masked_en(wal, HDC_CHICKEN0,
> @@ -386,7 +386,7 @@ static void gen9_ctx_workarounds_init(struct intel_engine_cs *engine,
>  	    IS_KABYLAKE(i915) ||
>  	    IS_COFFEELAKE(i915) ||
>  	    IS_COMETLAKE(i915))
> -		wa_masked_en(wal, HALF_SLICE_CHICKEN3,
> +		wa_masked_en(wal, GEN8_HALF_SLICE_CHICKEN3,
>  			     GEN8_SAMPLER_POWER_BYPASS_DIS);
>  
>  	/* WaDisableSTUnitPowerOptimization:skl,bxt,kbl,glk,cfl */
> @@ -490,7 +490,7 @@ static void kbl_ctx_workarounds_init(struct intel_engine_cs *engine,
>  			     GEN8_SBE_DISABLE_REPLAY_BUF_OPTIMIZATION);
>  
>  	/* WaDisableSbeCacheDispatchPortSharing:kbl */
> -	wa_masked_en(wal, GEN7_HALF_SLICE_CHICKEN1,
> +	wa_masked_en(wal, GEN8_HALF_SLICE_CHICKEN1,
>  		     GEN7_SBE_SS_CACHE_DISPATCH_PORT_SHARING_DISABLE);
>  }
>  
> @@ -514,7 +514,7 @@ static void cfl_ctx_workarounds_init(struct intel_engine_cs *engine,
>  		     GEN8_SBE_DISABLE_REPLAY_BUF_OPTIMIZATION);
>  
>  	/* WaDisableSbeCacheDispatchPortSharing:cfl */
> -	wa_masked_en(wal, GEN7_HALF_SLICE_CHICKEN1,
> +	wa_masked_en(wal, GEN8_HALF_SLICE_CHICKEN1,
>  		     GEN7_SBE_SS_CACHE_DISPATCH_PORT_SHARING_DISABLE);
>  }
>  
> @@ -2107,7 +2107,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  
>  	if (IS_DG2_GRAPHICS_STEP(i915, G11, STEP_A0, STEP_B0)) {
>  		/* Wa_14013392000:dg2_g11 */
> -		wa_masked_en(wal, GEN7_ROW_CHICKEN2, GEN12_ENABLE_LARGE_GRF_MODE);
> +		wa_masked_en(wal, GEN8_ROW_CHICKEN2, GEN12_ENABLE_LARGE_GRF_MODE);
>  
>  		/* Wa_16011620976:dg2_g11 */
>  		wa_write_or(wal, LSC_CHICKEN_BIT_0_UDW, DIS_CHAIN_2XSIMD8);
> @@ -2156,7 +2156,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  			    DISABLE_128B_EVICTION_COMMAND_UDW);
>  
>  		/* Wa_22012856258:dg2 */
> -		wa_masked_en(wal, GEN7_ROW_CHICKEN2,
> +		wa_masked_en(wal, GEN8_ROW_CHICKEN2,
>  			     GEN12_DISABLE_READ_SUPPRESSION);
>  
>  		/*
> @@ -2253,7 +2253,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  	if (IS_ALDERLAKE_P(i915) || IS_ALDERLAKE_S(i915) || IS_DG1(i915) ||
>  	    IS_ROCKETLAKE(i915) || IS_TIGERLAKE(i915)) {
>  		/* Wa_1606931601:tgl,rkl,dg1,adl-s,adl-p */
> -		wa_masked_en(wal, GEN7_ROW_CHICKEN2, GEN12_DISABLE_EARLY_READ);
> +		wa_masked_en(wal, GEN8_ROW_CHICKEN2, GEN12_DISABLE_EARLY_READ);
>  
>  		/*
>  		 * Wa_1407928979:tgl A*
> @@ -2282,7 +2282,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  	    IS_DG1_GRAPHICS_STEP(i915, STEP_A0, STEP_B0) ||
>  	    IS_ROCKETLAKE(i915) || IS_TIGERLAKE(i915)) {
>  		/* Wa_1409804808:tgl,rkl,dg1[a0],adl-s,adl-p */
> -		wa_masked_en(wal, GEN7_ROW_CHICKEN2,
> +		wa_masked_en(wal, GEN8_ROW_CHICKEN2,
>  			     GEN12_PUSH_CONST_DEREF_HOLD_DIS);
>  
>  		/*
> @@ -2449,7 +2449,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  	if (IS_HASWELL(i915)) {
>  		/* WaSampleCChickenBitEnable:hsw */
>  		wa_masked_en(wal,
> -			     HALF_SLICE_CHICKEN3, HSW_SAMPLE_C_PERFORMANCE);
> +			     HSW_HALF_SLICE_CHICKEN3, HSW_SAMPLE_C_PERFORMANCE);
>  
>  		wa_masked_dis(wal,
>  			      CACHE_MODE_0_GEN7,
> @@ -2747,7 +2747,7 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
>  		wa_write_or(wal, XEHP_L3NODEARBCFG, XEHP_LNESPARE);
>  
>  		/* Wa_14010449647:xehpsdv */
> -		wa_masked_en(wal, GEN7_HALF_SLICE_CHICKEN1,
> +		wa_masked_en(wal, GEN8_HALF_SLICE_CHICKEN1,
>  			     GEN7_PSD_SINGLE_PORT_DISPATCH_ENABLE);
>  
>  		/* Wa_18011725039:xehpsdv */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
> index 8f1165146013..9495a7928bc8 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
> @@ -244,8 +244,8 @@ struct __ext_steer_reg {
>  };
>  
>  static const struct __ext_steer_reg xe_extregs[] = {
> -	{"GEN7_SAMPLER_INSTDONE", GEN7_SAMPLER_INSTDONE},
> -	{"GEN7_ROW_INSTDONE", GEN7_ROW_INSTDONE}
> +	{"GEN8_SAMPLER_INSTDONE", GEN8_SAMPLER_INSTDONE},
> +	{"GEN8_ROW_INSTDONE", GEN8_ROW_INSTDONE}
>  };
>  
>  static void __fill_ext_reg(struct __guc_mmio_reg_descr *ext,
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> index a0372735cddb..9229243992c2 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> @@ -35,7 +35,7 @@ static void guc_prepare_xfer(struct intel_uncore *uncore)
>  
>  	if (GRAPHICS_VER(uncore->i915) == 9) {
>  		/* DOP Clock Gating Enable for GuC clocks */
> -		intel_uncore_rmw(uncore, GEN7_MISCCPCTL,
> +		intel_uncore_rmw(uncore, GEN8_MISCCPCTL,
>  				 0, GEN8_DOP_CLOCK_GATE_GUC_ENABLE);
>  
>  		/* allows for 5us (in 10ns units) before GT can go to RC6 */
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
> index daac2050d77d..700cc9688f47 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -2257,7 +2257,7 @@ static int init_generic_mmio_info(struct intel_gvt *gvt)
>  	MMIO_DFH(_MMIO(0x2438), D_ALL, F_CMD_ACCESS, NULL, NULL);
>  	MMIO_DFH(_MMIO(0x243c), D_ALL, F_CMD_ACCESS, NULL, NULL);
>  	MMIO_DFH(_MMIO(0x7018), D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
> -	MMIO_DFH(HALF_SLICE_CHICKEN3, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
> +	MMIO_DFH(HSW_HALF_SLICE_CHICKEN3, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
>  	MMIO_DFH(GEN7_HALF_SLICE_CHICKEN1, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
>  
>  	/* display */
> diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i915/gvt/mmio_context.c
> index 1c6e941c9666..ac58460fb305 100644
> --- a/drivers/gpu/drm/i915/gvt/mmio_context.c
> +++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
> @@ -111,7 +111,7 @@ static struct engine_mmio gen9_engine_mmio_list[] __cacheline_aligned = {
>  	{RCS0, GEN9_SCRATCH_LNCF1, 0, false}, /* 0xb008 */
>  	{RCS0, GEN7_HALF_SLICE_CHICKEN1, 0xffff, true}, /* 0xe100 */
>  	{RCS0, HALF_SLICE_CHICKEN2, 0xffff, true}, /* 0xe180 */
> -	{RCS0, HALF_SLICE_CHICKEN3, 0xffff, true}, /* 0xe184 */
> +	{RCS0, HSW_HALF_SLICE_CHICKEN3, 0xffff, true}, /* 0xe184 */
>  	{RCS0, GEN9_HALF_SLICE_CHICKEN5, 0xffff, true}, /* 0xe188 */
>  	{RCS0, GEN9_HALF_SLICE_CHICKEN7, 0xffff, true}, /* 0xe194 */
>  	{RCS0, GEN8_ROW_CHICKEN, 0xffff, true}, /* 0xe4f0 */
> diff --git a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
> index 8279dc580a3e..638b77d64bf4 100644
> --- a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
> +++ b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
> @@ -102,7 +102,7 @@ static int iterate_generic_mmio(struct intel_gvt_mmio_table_iter *iter)
>  	MMIO_D(_MMIO(0x2438));
>  	MMIO_D(_MMIO(0x243c));
>  	MMIO_D(_MMIO(0x7018));
> -	MMIO_D(HALF_SLICE_CHICKEN3);
> +	MMIO_D(HSW_HALF_SLICE_CHICKEN3);
>  	MMIO_D(GEN7_HALF_SLICE_CHICKEN1);
>  	/* display */
>  	MMIO_F(_MMIO(0x60220), 0x20);
> diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
> index 8f86f56e7ca4..1aa77b18fd3c 100644
> --- a/drivers/gpu/drm/i915/intel_pm.c
> +++ b/drivers/gpu/drm/i915/intel_pm.c
> @@ -4325,8 +4325,8 @@ static void gen8_set_l3sqc_credits(struct drm_i915_private *dev_priv,
>  	u32 val;
>  
>  	/* WaTempDisableDOPClkGating:bdw */
> -	misccpctl = intel_uncore_read(&dev_priv->uncore, GEN7_MISCCPCTL);
> -	intel_uncore_write(&dev_priv->uncore, GEN7_MISCCPCTL, misccpctl & ~GEN7_DOP_CLOCK_GATE_ENABLE);
> +	misccpctl = intel_uncore_read(&dev_priv->uncore, GEN8_MISCCPCTL);
> +	intel_uncore_write(&dev_priv->uncore, GEN8_MISCCPCTL, misccpctl & ~GEN8_DOP_CLOCK_GATE_ENABLE);
>  
>  	val = intel_uncore_read(&dev_priv->uncore, GEN8_L3SQCREG1);
>  	val &= ~L3_PRIO_CREDITS_MASK;
> @@ -4340,7 +4340,7 @@ static void gen8_set_l3sqc_credits(struct drm_i915_private *dev_priv,
>  	 */
>  	intel_uncore_posting_read(&dev_priv->uncore, GEN8_L3SQCREG1);
>  	udelay(1);
> -	intel_uncore_write(&dev_priv->uncore, GEN7_MISCCPCTL, misccpctl);
> +	intel_uncore_write(&dev_priv->uncore, GEN8_MISCCPCTL, misccpctl);
>  }
>  
>  static void icl_init_clock_gating(struct drm_i915_private *dev_priv)
> @@ -4500,8 +4500,8 @@ static void skl_init_clock_gating(struct drm_i915_private *dev_priv)
>  	gen9_init_clock_gating(dev_priv);
>  
>  	/* WaDisableDopClockGating:skl */
> -	intel_uncore_write(&dev_priv->uncore, GEN7_MISCCPCTL, intel_uncore_read(&dev_priv->uncore, GEN7_MISCCPCTL) &
> -		   ~GEN7_DOP_CLOCK_GATE_ENABLE);
> +	intel_uncore_write(&dev_priv->uncore, GEN8_MISCCPCTL, intel_uncore_read(&dev_priv->uncore, GEN8_MISCCPCTL) &
> +		   ~GEN8_DOP_CLOCK_GATE_ENABLE);
>  
>  	/* WAC6entrylatency:skl */
>  	intel_uncore_write(&dev_priv->uncore, FBC_LLC_READ_CTRL, intel_uncore_read(&dev_priv->uncore, FBC_LLC_READ_CTRL) |
> -- 
> 2.37.3
> 
