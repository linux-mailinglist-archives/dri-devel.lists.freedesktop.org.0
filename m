Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE305FC902
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 18:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B16610E3AE;
	Wed, 12 Oct 2022 16:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD2AB10E3AE;
 Wed, 12 Oct 2022 16:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665591547; x=1697127547;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dCAOIC566VZ6bZoUAplprOxYCvD1diVCQrE0mNH3KIs=;
 b=SLc9AvOUqNtmwEMTFjLE9hhpY5z2LPqeOF5Yw/7aINOZ1eS+gABdkChM
 uOkTb7BI8SIcHMJXOMflJLcaO9088fOOWSF9BRpdf9wfwML9/7/Bog0vL
 QK/j6/r6lsufNFcvJnVugjdQxDa7lW6uN+OVlgVMozGx1rPBMtPozCxIj
 eJrfIhxKa5m19HTkjptIEkLZlKvTwdaOs/ep2F+r42loTcGd+FURgnmjn
 eDJbqotghHnAlTWSMTBnv7hkivq1iRhrWQHX0mJBlEmWKrzAwknfAPz3p
 KrLZRlwNI1w0MNv2GD4iNjAEuZksdTDJ2fmo3RaSQ3xqA8K1vkwwekZuS g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="391142180"
X-IronPort-AV: E=Sophos;i="5.95,179,1661842800"; d="scan'208";a="391142180"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2022 09:19:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="577883017"
X-IronPort-AV: E=Sophos;i="5.95,179,1661842800"; d="scan'208";a="577883017"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 12 Oct 2022 09:19:06 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 12 Oct 2022 09:19:06 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 12 Oct 2022 09:19:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 12 Oct 2022 09:19:05 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 12 Oct 2022 09:19:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mj65UC4PiPHHh2N1AnyWgmG5fkQhbpQsSnn/B9aYlFN6feWb/gz+mIdgFNLayBqg9Q6ypSIJrYMmsxUVoXCQdyYg6p4U6CZgJmhrSzx2EXW5ghRhUTdHBoudnUiD+n/IJfEbvOcpJlXrf2QKhYgl49CGqD+VKb+FER2EtTBLstGZC75LkbctrAHR+vaT/2dwVwoPrf4M2Mzj8QG+cq0sz8hCAy+Wpz7P7s6UuoCpBbNJOL1SEXRxQUfTecQSOEsjVDlNHoNntzFeyk4/6vMP8ElaHLANpSeT1vEOpnA4hzLppZaA/BMMtqh5uHyzn06QRci9z06wy7U7gXqKaCaYQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4GGXgqICN72OxAMdSGfoNRQq2WFTWduhsPC3N5jNiI=;
 b=OH4tNP+R+HaT97gnworkuECOJlDIq95+dRlcMI9tZxmQ1qEJgecbTi8Wm9yIpmDgeo+3jxLJuEcf5M+CIRJPTsF79Q6WmZT22/9lacqSt3MVng1zRjjbTWwfMz7WyDtESqI7IMK3ZK9DzaexLdalxEWu+letz2l1u5Ubm/66VJlq+4Mab2w0igfyamAJitAYYCjT+2w4A9UhU2CYhZKZFT0XaXMsW0Xe2oFmAsz4MIRaSUSpHoavBwS8edBlBWCWnOJB4T6InsWqXrfl21oUBjA9zCSUL1E9RHKNvCweMLMwDqs+1diSmmocvgiHwA2JpLN5jud6g0ih91ikwIEsbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 CH3PR11MB7348.namprd11.prod.outlook.com (2603:10b6:610:14d::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17; Wed, 12 Oct 2022 16:19:03 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67%3]) with mapi id 15.20.5709.021; Wed, 12 Oct 2022
 16:19:03 +0000
Date: Wed, 12 Oct 2022 21:48:53 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 09/14] drm/i915/gt: Always use MCR functions on
 multicast registers
Message-ID: <Y0bo7eV74rhul+sU@bala-ubuntu>
References: <20221001004550.3031431-1-matthew.d.roper@intel.com>
 <20221001004550.3031431-10-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20221001004550.3031431-10-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN3PR01CA0131.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::18) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|CH3PR11MB7348:EE_
X-MS-Office365-Filtering-Correlation-Id: 548df242-012c-4352-d00c-08daac6d7a48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KuRMvRARb6dD1EX5hT0q24TMDIUaPx/Hq2uqwjPhpubwR4rHkGpUVEiFI032ZJLWxfuljJ1iFkflarQLHs7/7ev2c0ruIfb/fBiCgrZoc59jwzfMwaXH3HHeE7PqjthM7HrkLJTTxFyrWq0xG1sF+/+V5yjNhTBQm9s+m0yVZESZolpaSXw790JuAuOQCO19DYxA29NXpOFtoLrLz3tg4x6pUTSaA9TPgb7wRLEPBOkies6dAPy3NH1DurRpNrE5tyChbuUoJgF7Z2Dp/Xxoh5BuvxAU+UNrJXh7WKwvjxcWuUFjLWn1+zQO6t1HzLQglw994zdu31Ipy1vxaDpcUBxJQd659XJ6syhjzzho/1QFhr4fB1pma33uANpoT8pFN+3ZxClfge0iLDXRDDzA4qdb4nycfvzHCx51sLhqYNeMzUY4mJYvPCzQXibJBjDe738+A/iHMWYnOgkitpXHQDC8JTD2Dfr9vc4eDhKrXlOF2HCMz1ABYRgi5bAQkoLycyszLJzJ82wPPuQ4mJiRm77RSZY7YOTvuSXbvYyzP+IAb/b9u4xR41MqlzSCGFsVYySHiW8hpPDsjZ12eSacvjgdW9WluNqtGgDBKPICCd2zuM+WBveHWX+hXuQbrnS3PeJuPXPLUys/TR28aCSwJibEUQEa+0Tia/d0dUCyduZ7/u7mjyOPnyeMR+VLkYCoQokg6+wXyoaag2Lz0+E8nUbOmgsLaDEtChx6AE6ZSp6gmIWJGT+cZ6HEcFgNKG8j
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199015)(26005)(6506007)(82960400001)(6512007)(6666004)(53546011)(5660300002)(44832011)(2906002)(83380400001)(8936002)(186003)(41300700001)(107886003)(38100700002)(9686003)(33716001)(6486002)(86362001)(450100002)(66946007)(66476007)(8676002)(316002)(66556008)(4326008)(478600001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGRaaFUwUUVXWVlFU1JTUDhLWkM5QlM4bEFXMXRlQU91ZC80TTlIV3pyN0Vu?=
 =?utf-8?B?R2VYQ3NhSjVHM3dBVFJnckpOUWlQQ3dXa001dFZiQlJSMTZneUVBUUNlM2po?=
 =?utf-8?B?NmpSaVJQalMzRG9MQzFUOHV1ekp5QTBYUTlrU1NNeERGM05leElOMjJyVnhw?=
 =?utf-8?B?eVc3cE5vM3Jua1BFaGN6ek9UUkVBZzJzb21mcUk3Q0JIVEZxZ2VmV1FYTFBL?=
 =?utf-8?B?TnZYSXR1OCtWOGJWV0JlcUVReXBNZEhBVmxDell6TzBLSlRMNFB5bTlSUWVG?=
 =?utf-8?B?QU1tZkQ4Z2xodzhPOU1POHpoNVVsc3ZKYTZyTzRGcStiQ3M5OUlZUzhqZktJ?=
 =?utf-8?B?OG5KQU5Qb0h1M2JmVStvemFVODNCamVsdkE3Y2tpRlBWT0gvMTBEY1pRSHlT?=
 =?utf-8?B?RC9EYWZGVFV0TENFK01XZm9UTmJEM1loN3YrM3V1eklVYWFoZjQxN1lpM0w4?=
 =?utf-8?B?TUJubUZOUkpOS0xRa3FaVHJoODZ6ekJUaDZ2Vm5sejIveDdQdmppZ0Nta2Rh?=
 =?utf-8?B?VXJSZDI3Zk5oU0QzSk84Ykh3VFhSNHBYVVpZNkdqUlpFMStSdFNNb2djeTY5?=
 =?utf-8?B?Mk9laCtvZHFxRlR2bVBOZFFqZFA0bWVKTUtQeXBUdTRxek1EU01wL3J1L3Vh?=
 =?utf-8?B?N0pmSHJqL3FiL3YwTjZRbjMwKy9rR2JEN0l5ak9DV1FnNWJsTWdpZnNnMUtI?=
 =?utf-8?B?ZkhlZFlHMWVxR3d4aTljTHNpQnZPNmM0bzhtek5GSy84K0l1YVpJWjlVV2lJ?=
 =?utf-8?B?a3NjUEt4RzRrcWhFSTdDQXBkUjNjR3lkTGNFeFVOek9VVUhaSFJydnR1bG1o?=
 =?utf-8?B?VkhKR2dYZnhNQ0pVZVd4aWpzQUQ0NFRqZnh4SkM3alBaNXA3cnVyaE5YcStX?=
 =?utf-8?B?elY1enRveTFscERQa0dlTTFnWkxPblJGaXJMK1VFT3FVQVBYaFU0T1ZGV2xD?=
 =?utf-8?B?bCs0MEtCUmY3M0ZDZVJPbHpSTFl5bEl1c3VBcS82Wko2L1FEc1NoeXVyemtu?=
 =?utf-8?B?OERMZXhOb2czajZUY1RsTzF3S2JsdlJ1SWZpQ29IN3ZpRm1HUmgyOFhEZWlP?=
 =?utf-8?B?di9QMyszS3ZXNUNQTEc5Z0poWmlpdXpHSFNlaVFUUGtWbmpWZURJWlNmZm1o?=
 =?utf-8?B?Tk91K1RvZ2NacU9OOUYzZGJiTjIzL3hqSm5OcG1WSTl4VExwbFNFS2NiM1M5?=
 =?utf-8?B?TnpDMndnem5SS0tVTjN1dzFTNlpXNzJGVGRLeTA0eVpVbXJxWW5TdFZVdXlt?=
 =?utf-8?B?RnJnMzdzRzBlTy92c005UGR0NS9HK3JjV1hSbGEwMWNZQ21Ic0VhVWNPUVN4?=
 =?utf-8?B?WkJBUjhaa24zMGlPYUpadUNlRW1paitJY1VaNnlTR1p4TWlOSnp6MzBNc1By?=
 =?utf-8?B?NU5uWW5CaUsxcVkvVmZacHJwOW9sOWhlaG9pSDlWYVVVN3FaWTRxdUtZTHZE?=
 =?utf-8?B?N3JJSDREOTlOTTFMbEFzSWJNM2VmZUxBOS9JQmY2cmprMk9heENoazZ2T2lO?=
 =?utf-8?B?UHo2NjNiam5LRm9NM2wrMTdtQytBM0I4dmMvTjBPL2UzbXdRTFFNNEtRSTBk?=
 =?utf-8?B?OVJ5TXVtL3hjQ2xvK0hnbTNWb1RVR1ZOOG1MUFN2bEdaVDlpQ2l0aWliazdG?=
 =?utf-8?B?N0xXVEVFZlpjSDk0NFlDNGhCS2dPVll1Tm5ORVZyMGUyRGpqSnQ1R3ZuWmhW?=
 =?utf-8?B?YWs2dFZzODVGRTFybS84Y0F3dUxLNTRya3l1b091dFFKVjVDWCtiNzVCRWpQ?=
 =?utf-8?B?REd3SHhEbnVaV1FFajFDWG1xSHlieHZEY3QrbVNNM3RDU2oxMmVOMCtUOW9E?=
 =?utf-8?B?c2Z1WFhwSm5wTkkxeStpNEtSUWlUd01EbHdtNmk1MVg2dXZjZzk1dnB4V0F6?=
 =?utf-8?B?UlBTcmZvckQzaG8yUXZVSjU3OUtqaUZmYlhsd1FlL0dBc2dlZUJlY1g1aGpY?=
 =?utf-8?B?NnUrbDZUKzdLeWNjc0Z4dXZkQVR5TkRmT1RWM1JFaExMdFppTE1xaUFOV1d1?=
 =?utf-8?B?WVF2ejhPQkd0R1BwTzg1dXJBNktJcWYxWk52d1ptYzdLYkpKSHJyVTNCSHFu?=
 =?utf-8?B?ZE9uZmFKMzNEOXExZEpSelE0ZERlZnhvbDJVUjM3REVETCtoK2tOc1kxVjkr?=
 =?utf-8?B?c0VJRzRONTd6dUFzN1VFU28zUGpqdDlZcUc2Qk5ISUdmK3BoUUNmQUxUZ3RP?=
 =?utf-8?Q?k/mWWpIIoZboiB3T3B1QeNw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 548df242-012c-4352-d00c-08daac6d7a48
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 16:19:03.3882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Gfb21zk9sMoCQGWZ5PpgF5jPdIN1Me17RhXX0nfq29rdQI2GNAptldiftZ5MFFX6iRWZIym5jbZFotqOAd4hAzBTVuq1icIF9/W7jW0iLZfJyFx4Cvf2GjthlUK/vum
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7348
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
Cc: ravi.kumar.vodapalli@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30.09.2022 17:45, Matt Roper wrote:
> Rather than relying on the implicit behavior of intel_uncore_*()
> functions, let's always use the intel_gt_mcr_*() functions to operate on
> multicast/replicated registers.
> 
> v2:
>  - Add TLB invalidation registers
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt.c        | 42 ++++++++++++++++-------
>  drivers/gpu/drm/i915/gt/intel_mocs.c      | 13 +++----
>  drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 12 ++++---
>  drivers/gpu/drm/i915/intel_pm.c           | 20 ++++++-----
>  4 files changed, 56 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index e14f159ad9fc..e763dc719d3a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -1017,6 +1017,32 @@ get_reg_and_bit(const struct intel_engine_cs *engine, const bool gen8,
>  	return rb;
>  }
>  
> +/*
> + * HW architecture suggest typical invalidation time at 40us,
> + * with pessimistic cases up to 100us and a recommendation to
> + * cap at 1ms. We go a bit higher just in case.
> + */
> +#define TLB_INVAL_TIMEOUT_US 100
> +#define TLB_INVAL_TIMEOUT_MS 4
> +
> +/*
> + * On Xe_HP the TLB invalidation registers are located at the same MMIO offsets
> + * but are now considered MCR registers.  Since they exist within a GAM range,
> + * the primary instance of the register rolls up the status from each unit.
> + */
> +static int wait_for_invalidate(struct intel_gt *gt, struct reg_and_bit rb)
> +{
> +	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 50))
> +		return intel_gt_mcr_wait_for_reg_fw(gt, rb.reg, rb.bit, 0,
> +						    TLB_INVAL_TIMEOUT_US,
> +						    TLB_INVAL_TIMEOUT_MS);
> +	else
> +		return __intel_wait_for_register_fw(gt->uncore, rb.reg, rb.bit, 0,
> +						    TLB_INVAL_TIMEOUT_US,
> +						    TLB_INVAL_TIMEOUT_MS,
> +						    NULL);
> +}
> +
>  static void mmio_invalidate_full(struct intel_gt *gt)
>  {

mmio_invalidate_full() contains a non-MCR register write function - 
`intel_uncore_write_fw(uncore, rb.reg, rb.bit)`
This function is used for MCR registers as well.

I notice in the later patches of the series mmio_invalidate_full() is
modified to use the MCR functions for MCR registers. But I think those
changes should be part of this patch.


Regards,
Bala

>  	static const i915_reg_t gen8_regs[] = {
> @@ -1099,22 +1125,12 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>  	for_each_engine_masked(engine, gt, awake, tmp) {
>  		struct reg_and_bit rb;
>  
> -		/*
> -		 * HW architecture suggest typical invalidation time at 40us,
> -		 * with pessimistic cases up to 100us and a recommendation to
> -		 * cap at 1ms. We go a bit higher just in case.
> -		 */
> -		const unsigned int timeout_us = 100;
> -		const unsigned int timeout_ms = 4;
> -
>  		rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
> -		if (__intel_wait_for_register_fw(uncore,
> -						 rb.reg, rb.bit, 0,
> -						 timeout_us, timeout_ms,
> -						 NULL))
> +
> +		if (wait_for_invalidate(gt, rb))
>  			drm_err_ratelimited(&gt->i915->drm,
>  					    "%s TLB invalidation did not complete in %ums!\n",
> -					    engine->name, timeout_ms);
> +					    engine->name, TLB_INVAL_TIMEOUT_MS);
>  	}
>  
>  	/*
> diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915/gt/intel_mocs.c
> index 06643701bf24..89ef1e06bf1d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_mocs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
> @@ -7,6 +7,7 @@
>  
>  #include "intel_engine.h"
>  #include "intel_gt.h"
> +#include "intel_gt_mcr.h"
>  #include "intel_gt_regs.h"
>  #include "intel_mocs.h"
>  #include "intel_ring.h"
> @@ -601,17 +602,17 @@ static u32 l3cc_combine(u16 low, u16 high)
>  	     0; \
>  	     i++)
>  
> -static void init_l3cc_table(struct intel_uncore *uncore,
> +static void init_l3cc_table(struct intel_gt *gt,
>  			    const struct drm_i915_mocs_table *table)
>  {
>  	unsigned int i;
>  	u32 l3cc;
>  
>  	for_each_l3cc(l3cc, table, i)
> -		if (GRAPHICS_VER_FULL(uncore->i915) >= IP_VER(12, 50))
> -			intel_uncore_write_fw(uncore, XEHP_LNCFCMOCS(i), l3cc);
> +		if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 50))
> +			intel_gt_mcr_multicast_write_fw(gt, XEHP_LNCFCMOCS(i), l3cc);
>  		else
> -			intel_uncore_write_fw(uncore, GEN9_LNCFCMOCS(i), l3cc);
> +			intel_uncore_write_fw(gt->uncore, GEN9_LNCFCMOCS(i), l3cc);
>  }
>  
>  void intel_mocs_init_engine(struct intel_engine_cs *engine)
> @@ -631,7 +632,7 @@ void intel_mocs_init_engine(struct intel_engine_cs *engine)
>  		init_mocs_table(engine, &table);
>  
>  	if (flags & HAS_RENDER_L3CC && engine->class == RENDER_CLASS)
> -		init_l3cc_table(engine->uncore, &table);
> +		init_l3cc_table(engine->gt, &table);
>  }
>  
>  static u32 global_mocs_offset(void)
> @@ -667,7 +668,7 @@ void intel_mocs_init(struct intel_gt *gt)
>  	 * memory transactions including guc transactions
>  	 */
>  	if (flags & HAS_RENDER_L3CC)
> -		init_l3cc_table(gt->uncore, &table);
> +		init_l3cc_table(gt, &table);
>  }
>  
>  #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> index 9229243992c2..5b86b2e286e0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> @@ -10,12 +10,15 @@
>   */
>  
>  #include "gt/intel_gt.h"
> +#include "gt/intel_gt_mcr.h"
>  #include "gt/intel_gt_regs.h"
>  #include "intel_guc_fw.h"
>  #include "i915_drv.h"
>  
> -static void guc_prepare_xfer(struct intel_uncore *uncore)
> +static void guc_prepare_xfer(struct intel_gt *gt)
>  {
> +	struct intel_uncore *uncore = gt->uncore;
> +
>  	u32 shim_flags = GUC_ENABLE_READ_CACHE_LOGIC |
>  			 GUC_ENABLE_READ_CACHE_FOR_SRAM_DATA |
>  			 GUC_ENABLE_READ_CACHE_FOR_WOPCM_DATA |
> @@ -35,8 +38,9 @@ static void guc_prepare_xfer(struct intel_uncore *uncore)
>  
>  	if (GRAPHICS_VER(uncore->i915) == 9) {
>  		/* DOP Clock Gating Enable for GuC clocks */
> -		intel_uncore_rmw(uncore, GEN8_MISCCPCTL,
> -				 0, GEN8_DOP_CLOCK_GATE_GUC_ENABLE);
> +		intel_gt_mcr_multicast_write(gt, GEN8_MISCCPCTL,
> +					     GEN8_DOP_CLOCK_GATE_GUC_ENABLE |
> +					     intel_gt_mcr_read_any(gt, GEN8_MISCCPCTL));
>  
>  		/* allows for 5us (in 10ns units) before GT can go to RC6 */
>  		intel_uncore_write(uncore, GUC_ARAT_C6DIS, 0x1FF);
> @@ -168,7 +172,7 @@ int intel_guc_fw_upload(struct intel_guc *guc)
>  	struct intel_uncore *uncore = gt->uncore;
>  	int ret;
>  
> -	guc_prepare_xfer(uncore);
> +	guc_prepare_xfer(gt);
>  
>  	/*
>  	 * Note that GuC needs the CSS header plus uKernel code to be copied
> diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
> index c694433a7da5..381f3d7ef8a7 100644
> --- a/drivers/gpu/drm/i915/intel_pm.c
> +++ b/drivers/gpu/drm/i915/intel_pm.c
> @@ -30,6 +30,8 @@
>  #include "display/skl_watermark.h"
>  
>  #include "gt/intel_engine_regs.h"
> +#include "gt/intel_gt.h"
> +#include "gt/intel_gt_mcr.h"
>  #include "gt/intel_gt_regs.h"
>  
>  #include "i915_drv.h"
> @@ -4339,22 +4341,23 @@ static void gen8_set_l3sqc_credits(struct drm_i915_private *dev_priv,
>  	u32 val;
>  
>  	/* WaTempDisableDOPClkGating:bdw */
> -	misccpctl = intel_uncore_read(&dev_priv->uncore, GEN8_MISCCPCTL);
> -	intel_uncore_write(&dev_priv->uncore, GEN8_MISCCPCTL, misccpctl & ~GEN8_DOP_CLOCK_GATE_ENABLE);
> +	misccpctl = intel_gt_mcr_read_any(to_gt(dev_priv), GEN8_MISCCPCTL);
> +	intel_gt_mcr_multicast_write(to_gt(dev_priv), GEN8_MISCCPCTL,
> +				     misccpctl & ~GEN8_DOP_CLOCK_GATE_ENABLE);
>  
> -	val = intel_uncore_read(&dev_priv->uncore, GEN8_L3SQCREG1);
> +	val = intel_gt_mcr_read_any(to_gt(dev_priv), GEN8_L3SQCREG1);
>  	val &= ~L3_PRIO_CREDITS_MASK;
>  	val |= L3_GENERAL_PRIO_CREDITS(general_prio_credits);
>  	val |= L3_HIGH_PRIO_CREDITS(high_prio_credits);
> -	intel_uncore_write(&dev_priv->uncore, GEN8_L3SQCREG1, val);
> +	intel_gt_mcr_multicast_write(to_gt(dev_priv), GEN8_L3SQCREG1, val);
>  
>  	/*
>  	 * Wait at least 100 clocks before re-enabling clock gating.
>  	 * See the definition of L3SQCREG1 in BSpec.
>  	 */
> -	intel_uncore_posting_read(&dev_priv->uncore, GEN8_L3SQCREG1);
> +	intel_gt_mcr_read_any(to_gt(dev_priv), GEN8_L3SQCREG1);
>  	udelay(1);
> -	intel_uncore_write(&dev_priv->uncore, GEN8_MISCCPCTL, misccpctl);
> +	intel_gt_mcr_multicast_write(to_gt(dev_priv), GEN8_MISCCPCTL, misccpctl);
>  }
>  
>  static void icl_init_clock_gating(struct drm_i915_private *dev_priv)
> @@ -4514,8 +4517,9 @@ static void skl_init_clock_gating(struct drm_i915_private *dev_priv)
>  	gen9_init_clock_gating(dev_priv);
>  
>  	/* WaDisableDopClockGating:skl */
> -	intel_uncore_write(&dev_priv->uncore, GEN8_MISCCPCTL, intel_uncore_read(&dev_priv->uncore, GEN8_MISCCPCTL) &
> -		   ~GEN8_DOP_CLOCK_GATE_ENABLE);
> +	intel_gt_mcr_multicast_write(to_gt(dev_priv), GEN8_MISCCPCTL,
> +				     intel_gt_mcr_read_any(to_gt(dev_priv), GEN8_MISCCPCTL) &
> +				     ~GEN8_DOP_CLOCK_GATE_ENABLE);
>  
>  	/* WAC6entrylatency:skl */
>  	intel_uncore_write(&dev_priv->uncore, FBC_LLC_READ_CTRL, intel_uncore_read(&dev_priv->uncore, FBC_LLC_READ_CTRL) |
> -- 
> 2.37.3
> 
