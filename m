Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E528601400
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 18:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1B910EDA4;
	Mon, 17 Oct 2022 16:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6F210EDA4;
 Mon, 17 Oct 2022 16:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666025592; x=1697561592;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8jT8xJQ1clFl0wCsIxASAUJ1mJOdI3JSP+y9sOwSUiE=;
 b=br/rjwqu3vnKGTcgg6R1ILKgSdiUtKVw5EfvBIczZ0p0YRsYBJWhZ44s
 2sJPB6OS4CF2m1ZAiFZxycLe7LI99zNFzZCLCMHJ4uqgwSpIl0C1MwzbP
 E1slfEuOZKYi2K6jtOEAAfsJdBXZutFp4/H7BlBYD5farNyv6VxKFSFHV
 1Tce5sFYDSVPZsp/pPhhpMPpIr/HnNk62Ict0SNB93xgPyppc+L0xqe1p
 5tY014HFF1SviHJBCS4eSsNMCz5cw+JhgqJI46TVwgjT8+9UqAHr3geyM
 dKBWtzuKrv/dqK0J6VxBHEVuuGR0mElf3wAdVMV5e14ZIY2z0XVQwwSGs w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="289150466"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="289150466"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 09:53:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="753699296"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="753699296"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 17 Oct 2022 09:53:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 09:53:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 17 Oct 2022 09:53:10 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 17 Oct 2022 09:53:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8PMYZVMd6Ou+GIXOc68Y6aBJkmmLMerb4nX0rdv+6emJ+kDdGZi8xP1RKholNyrHHQ+vCsA2ENMEv+HuwAvvLcjyaGp73sLnx7rIdN0Yv835plWk8kYsDerMkU6lLkJOB0R8foOZQXyK0iRZUL3LrdffWIlpjG8elI3Dr3Y79Iqok7Og8oklL7wp5gGy5wDkWY8wA6aNs5PUoGYfYGoIlFRPLTisBmIC+hOJtB8bUADsfpGdAgxXlMo2EG6Wd7rfFNvPQ/HCzk2ZkMqlI3F8GvoGtVlwiC6PlOIoNIYiRVSSQucuxcCfkfc4zRnPOiokiLRjc0JyuesIWtcflki5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VaXIeDpZnxhL2kwHgvHHauWUfZpZM3PdP4iVDoreJgk=;
 b=VqHLT/DXwDrx6bkED4XK4yzkDuL2j0IR3GnGEK50Z7qiBibOhMAqS+YTEwqhPSw8rRnVZScRsVrFmAQkXKMQihkqGFR3gQcUYKVUj38yq4Kd0ndsTSwO2Wg1G9kABRr0/xpSZip1RZzKsZsHWAFZikQk+55Vod3FBzERmyCk/Z+AXzLSyei32Uua2hDXA3yP+RzZcxHnolA8HJzVkeATQrPRqOi3f+bG5PJxdppJfglLdOBYbD1+kMTMWYqfBrv3ncN73Dm15xVAG3TMfGH99P5zGaNHmsyan5QreuOfEND5bxKnp1QOWOk/+6ex2Xoz2H5B43DdHhUhNWtTPCsFTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 DM4PR11MB7350.namprd11.prod.outlook.com (2603:10b6:8:105::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.30; Mon, 17 Oct 2022 16:53:03 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67%3]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 16:53:03 +0000
Date: Mon, 17 Oct 2022 22:22:54 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v3 07/14] drm/i915/gt: Add
 intel_gt_mcr_wait_for_reg_fw()
Message-ID: <Y02IZozfgEvrgkqF@bala-ubuntu>
References: <20221014230239.1023689-1-matthew.d.roper@intel.com>
 <20221014230239.1023689-8-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20221014230239.1023689-8-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN3PR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::20) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|DM4PR11MB7350:EE_
X-MS-Office365-Filtering-Correlation-Id: 63b8bfb4-6e42-40f7-83e0-08dab0600e57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sqn7GpL3wig0Tj0fysnjtv1Dam2qiaveKBhfKqMCaWOHsOzO+eQOO1Ln4xIpDUNm3I3D5kKAs4D9EDKSzsFQaCDx1PuEJMhbU4t1jEkByfFxhHFMYeA+TdLAROXs08kEIOkkkjmaTn4naJ8MHoklr0GXmxBaJiNVRc9Bh1hHJYqkN3JsUJz8dEm5ibuMOyzJPUA0RO2TAh/t6z6nDbre7hZXtQ2YrZcWcvJbnnxnBKNsPY0LsrRZe+Srfz08KKa4QfmNCh10/ZU3z09/UtwqLk2V+5jjETZzRx5476yyXdTWrmnoqHSowqhub1/BrngjKQCWCjAnHj+HTaTfIIbOLsEpyz0+9giHxBrz2ycPDSDCWMpra9oagR9yAoHH6hxumEAe27UfZmltfypNlD791YPpBUMB0fwbjxxj0LnsjQBEvuYQR6a7SJHj5tJJstN/inCPGEVk8Uhqe09Qfn697WCPkNj34ZPDXO7QyQ/hRbR04sevdBTtntNstQf8u//ELOU2d19vZPXvBbqBnyt6jAa85zCtOKTEayqHJqFNdQTBmXIKkKcjy1OM9DDPQ1EkPC2RYz3OThTkNajRS9XfPm72mtvzL2knQFycEQYXhsnkQL7N1gMi6xg0G2D2LQ+PjggXV8vRmKFN7ehnbMNtpeprs0fAjZQ/01IPvMVClCVjb1Rj7QjQetYBc5tUmjeHi3e2cZDBNBVoRzNzueWFjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(39860400002)(136003)(366004)(346002)(376002)(396003)(451199015)(4326008)(5660300002)(44832011)(66476007)(66556008)(41300700001)(66946007)(8676002)(316002)(6486002)(478600001)(6506007)(53546011)(26005)(6512007)(9686003)(186003)(2906002)(8936002)(83380400001)(82960400001)(33716001)(38100700002)(6666004)(450100002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWpuM1EzOUtmOURjaDR0eStvb2lKayswclBiRnBkekRKVW5xMXEyRVdmSWV6?=
 =?utf-8?B?dnoxMHBTRkdLWkpXa0RQNlRZNlRNcUZBUXlUYWFhREg4aHROc2dSaHFLK2Vu?=
 =?utf-8?B?blhHZnA2a0Qxa3N5QzlJMUdLVEJndGhYYktXa29LMEdCa2xiRVpud1dZYUtK?=
 =?utf-8?B?a2FDRUdFUUIrbk5uU2pGeVY0aUptcXBUc1ZER0M1bU1XYzNwS3M2YXZ6NStp?=
 =?utf-8?B?ZHBFSTM1eWQvRVA0SjFzbXVhT3BDZmlkRWNaM0w0Y1AraDBrd0tJcmdBRXln?=
 =?utf-8?B?QUZicEdSYytlQXMrRXdOZnQ5aDVxSzFSbWNLR2N4WCsrL1BzVzZBa0ltbXFh?=
 =?utf-8?B?MDZyUDRKMUQ5elc1QjAzYVRIMmhlUTUyWFpFZHhHTXQrenB0TnhZNnFHc2Iw?=
 =?utf-8?B?aGdEWnhMNG90UTliY1Izbzhxc05OOHBzRll1YmROaVpTNGtRUkJiM3VzMTlS?=
 =?utf-8?B?MkVGVWs4KzFqRjN1ZlJleWszYjN0L3Z3Ui8vY2EzcVZ4UWZOUE5RMHFVSDRU?=
 =?utf-8?B?UXIyVVZkWlY5amlkV29BOUhiUXBJaHZ1TU1QSUhIMmlUY1pMZ2d6OGFabWg0?=
 =?utf-8?B?dGplMjNrQllPRUQrVGNXTForN2FHZUpRUUVmNEtYT0VVZS91TVdPaWtVUkhT?=
 =?utf-8?B?b3dkL3RGSkdPVU5OMi95ekpCN2xUMytRVTM4MGN4WENiNFFJRko4NmJGaW10?=
 =?utf-8?B?d2NRSkU4K3NqbEFCNE9GRWt6RER1K1hzNjdzdnRWUnN5UzF5aDcxMzFYWDk0?=
 =?utf-8?B?ZWhlL2hxaHdRb1V3R3g0WjJZajRYaG1QWTRrR3pRSWZoRyt5RVVsY1FEQ2pL?=
 =?utf-8?B?RkpxeSt0RE9RWVNENEFUOW5PZXpCM2VoRklQY2l2YkxTb3R1TWVSY2V4eFV5?=
 =?utf-8?B?eGRmM1RHRVkrUmdaUDRYVTB0eGM3MEtWSkNHZEtvOFZ4eGlEY1JsK25KcDJE?=
 =?utf-8?B?NUhUY3NEeW96SWdVMmtQeE10RGRKU0txZkxNV2NzSTQ5andibmJTSm1lRm56?=
 =?utf-8?B?MVFJTkJFRkVjT1YvYUNFSkhDN1hBRjZOWkR1Q1pNc2M2M1JFTWQxVE5jZk9I?=
 =?utf-8?B?dUV6dXpWOXJOcVF2OEZBWFUzVG1rZHBCbk1BVmc3dGpWNFdlczhaQkw0OTdx?=
 =?utf-8?B?WG9mb3gwUmROOUgrdXgzLzZucEdVU2ZaU3FmQU1zcm8yTkxHbWRRWURNQVFT?=
 =?utf-8?B?T0QwY1hnMkFISnY2WXZyWEZyNWZoaHFlUi80YzNUckpWdFhET0dsZGpNRUVB?=
 =?utf-8?B?emhCSWU1OUlWa3Rhck9Panp0TzhHaGQ5QmRxeTBUVkZodk5xSDRBbkEzalN1?=
 =?utf-8?B?eDB5MEhNYlIrMEoyV2tMblBwbFdBWVBzRDNJZkZQY3ZzZkpkbUp4Wm5MNGc1?=
 =?utf-8?B?M1pMVUx5VTJNTE1ONFpOZ296c2g3djBLT1lHR291ZnlpUUdXQTYrbndWTlVF?=
 =?utf-8?B?d3BOS3ZmTHF3dXZSczE5MEhEcnNZNExRRytNTEFsaGVFZEpqZXo1QkhtNkFF?=
 =?utf-8?B?c0xQWVl6cWc1OEdDSEt0TmhobHAwazdoUDY0Sklxb2QrRjJkcVFLWWp4bUtk?=
 =?utf-8?B?WUloOEdPc3dDSzVEUVJDVFZVY29ROEVsRjFIemNYdG93WFMrU3F4dklmWkVW?=
 =?utf-8?B?RFhXRG0rYVZYdzFvSXpFckRvZG9CNkVuMUgyTFlNZytPUlB4MnRkRk9VNHh5?=
 =?utf-8?B?REwxM2pxODllak1wTjVBb3ZlOWJzaXJUemQxUU5zaUxQV29vVGVCUTJFd3B2?=
 =?utf-8?B?RnZzN3AzRDR3U0w5TytsL1dRRFFkci9oVm5BdkRzTHVhczltTmNYVUlVRHlB?=
 =?utf-8?B?L2VHcm83aWg3YlpsZ2N6TElVRmRkbGdqTlR4dFZFd0VYZ1F4K0J0OVJmSW9Z?=
 =?utf-8?B?VkZlUkpSbi92cjJqTjZDL3RjN1VGQXBWNE1qYnVjRnVOdnRRdTNZb0JKcEdN?=
 =?utf-8?B?em42UVYzblJodTFlOVZPcXBBaVJKNHFJbGZDK1JNTWtkRmkxdEMwVTNGcjB0?=
 =?utf-8?B?UWVKOGhWeVNxc0JQOEdqYTdRZWwvRzZSamgwclB2d3NlQ2NIRFlLamRsd2xM?=
 =?utf-8?B?UERvMWJRZDVoT0ZwYS9jT2RIMVV5MjhkZWk0SG1kNURBaGJHOG92cVdaZzR0?=
 =?utf-8?B?VllBNUVzbWxId0I3TVY3MzBsRDVVMURCNEhMWjI3R3k1MGJLN3F4a3pkS3hY?=
 =?utf-8?Q?325DT24vu7TGNFDMGjPNfDs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b8bfb4-6e42-40f7-83e0-08dab0600e57
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 16:53:03.1874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JKPyx7ViBuelAZaFhwimAvTmJr6I+mcWK/MaS4AQ12CmROJz9C1N64As5L8h5hyWjR1liXNZA97IeYB8g/CD6sdB2/LYZyojI3j1PO3TN+NhBMBg4cw9JyRHJmta4Hsu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7350
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

On 14.10.2022 16:02, Matt Roper wrote:
> Xe_HP has some MCR registers that need to be polled for completion of
> operations like TLB invalidation.  Those registers are in the GAM range,
> which rolls up the status from each unit into the 'primary' instance's
> value.  This makes it useful to have a dedicated 'wait for register'
> function that handles this on MCR registers, similar to the
> __intel_wait_for_register_fw() function we already have for regular
> registers.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 55 ++++++++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_gt_mcr.h |  7 ++++
>  2 files changed, 62 insertions(+)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> index 4dc360f4e344..1ed9bc4dccfd 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> @@ -568,3 +568,58 @@ void intel_gt_mcr_get_ss_steering(struct intel_gt *gt, unsigned int dss,
>  		return;
>  	}
>  }
> +
> +/**
> + * intel_gt_mcr_wait_for_reg_fw - wait until MCR register matches expected state
> + * @gt: GT structure
> + * @reg: the register to read
> + * @mask: mask to apply to register value
> + * @value: value to wait for
> + * @fast_timeout_us: fast timeout in microsecond for atomic/tight wait
> + * @slow_timeout_ms: slow timeout in millisecond
> + *
> + * This routine waits until the target register @reg contains the expected
> + * @value after applying the @mask, i.e. it waits until ::
> + *
> + *     (intel_gt_mcr_read_any_fw(gt, reg) & mask) == value
> + *
> + * Otherwise, the wait will timeout after @slow_timeout_ms milliseconds.
> + * For atomic context @slow_timeout_ms must be zero and @fast_timeout_us
> + * must be not larger than 20,0000 microseconds.
> + *
> + * This function is basically an MCR-friendly version of
> + * __intel_wait_for_register_fw().  Generally this function will only be used
> + * on GAM registers which are a bit special --- although they're MCR registers,
> + * reads (e.g., waiting for status updates) are always directed to the primary
> + * instance.
> + *
> + * Note that this routine assumes the caller holds forcewake asserted, it is
> + * not suitable for very long waits.
> + *
> + * Return: 0 if the register matches the desired condition, or -ETIMEDOUT.
> + */
> +int intel_gt_mcr_wait_for_reg_fw(struct intel_gt *gt,
> +				 i915_reg_t reg,
> +				 u32 mask,
> +				 u32 value,
> +				 unsigned int fast_timeout_us,
> +				 unsigned int slow_timeout_ms)
> +{
> +	u32 reg_value = 0;
> +#define done (((reg_value = intel_gt_mcr_read_any_fw(gt, reg)) & mask) == value)
> +	int ret;
> +
> +	/* Catch any overuse of this function */
> +	might_sleep_if(slow_timeout_ms);
> +	GEM_BUG_ON(fast_timeout_us > 20000);
> +	GEM_BUG_ON(!fast_timeout_us && !slow_timeout_ms);
> +
> +	ret = -ETIMEDOUT;
> +	if (fast_timeout_us && fast_timeout_us <= 20000)
> +		ret = _wait_for_atomic(done, fast_timeout_us, 0);
> +	if (ret && slow_timeout_ms)
> +		ret = wait_for(done, slow_timeout_ms);
> +
> +	return ret;
> +#undef done
> +}
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
> index 781b267478db..548f922cd9fa 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
> @@ -37,6 +37,13 @@ void intel_gt_mcr_report_steering(struct drm_printer *p, struct intel_gt *gt,
>  void intel_gt_mcr_get_ss_steering(struct intel_gt *gt, unsigned int dss,
>  				  unsigned int *group, unsigned int *instance);
>  
> +int intel_gt_mcr_wait_for_reg_fw(struct intel_gt *gt,
> +				 i915_reg_t reg,
> +				 u32 mask,
> +				 u32 value,
> +				 unsigned int fast_timeout_us,
> +				 unsigned int slow_timeout_ms);
> +
>  /*
>   * Helper for for_each_ss_steering loop.  On pre-Xe_HP platforms, subslice
>   * presence is determined by using the group/instance as direct lookups in the
> -- 
> 2.37.3
> 
