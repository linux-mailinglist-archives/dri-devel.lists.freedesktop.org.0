Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FE363EC69
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 10:27:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117CC10E10D;
	Thu,  1 Dec 2022 09:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E8E10E012;
 Thu,  1 Dec 2022 09:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669886808; x=1701422808;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BFVGxKNPNQ5ohJZXGQ/ACF5Qze8/8Kd2FckZq0nfSg8=;
 b=jH4Xpmk5ZokEQMNI6hbJLyjubs1fOfTUEN7I237aFr8f7ZESKsMNs85B
 FtWw+s33jQHXoqdCpUN9CUV21wJbntvNg6i7ic+33WZCMSZLNEle0WQiE
 cHdvV6da4Pd3XLrCMrf3oEi7mr9iAS0hXvZpe3cu6My5XbSy4xvCOM9E1
 TjAA6lhINuvNLfYIcoYJY5QWYGXnQBmjBIP4T7vY7WCvHT7x9kBS1yu9w
 lSlDWEz1VJZT1isho2W2Lu3/bsycIysykNujX7HYlDQBmGg4TC+x7i3TB
 gv0H/RFkeQR2EGVK2qDKR4k/88uyddpEl44FxGgGpuQ8N7efHMMhN9sXj Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="299004650"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="299004650"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 01:26:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="677153520"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="677153520"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 01 Dec 2022 01:26:46 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 1 Dec 2022 01:26:46 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 1 Dec 2022 01:26:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 1 Dec 2022 01:26:45 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 1 Dec 2022 01:26:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SbdN2p91n7TdqYUfuLh9UUrbLOc/urkLkN9V2jFTxKZf22K+Tpd2/OOSgF7qpXeq0yu/wyZlFJPap4Nh2uYAhatyVPg8Uldqg438Reev1foaf1wz8pXdrzOhcfS0Giz9sHuJiz3VgakpGbDzeJtLePA7u47bDWhNV0+FljaUtYEyH0Yw8iSqmlJrUUthjEjUzd1eD8DH8+aQtAh+CYK8czGLWfTO7m184T7w/Ph4Gs/RLXTgVr8LNE9IC3lfDfxZFUO9MxTDe3b5AfZ1L0NJo6DUQYcfqHdh14njULuqj5PGcZW7tMdCsj3ika1a8UHTwYrTZPscxl2/TV3O3TDb1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1iKeO30udo2x6L4zC/qPd+dYPC9wvdMnX1wXLT5eBk=;
 b=NaCG7ocss2t0jhEpdaQjThja/YHH4HHtiBkrAxlex90RWNn/UrK/1Jf5W64pfGQqwBJEZMnW5l2FSfOOty36+rTnDsh1HwYVoht+eft2O9ViwfzupHi/5cHPri7curoL3UMk2O8+Dy0uLlYLvnxSEroEHSZ/EDqQc99x5iATPXcciUFWVT7y1EfrafURKxu+A3KC1UH2U1B8m5DfxmfA+zRUlQGYtynd5BxB+Q1/1JG3qb15OmQ7GcxCBIpi6RdO7RsihC9HilpBwl/duziEOoxLD2W4vnq7n0uxc3aB//9VDBRBA6nsyPwho9wIQE5kvz1TF5EmaemkcEkKkRRxeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 SJ2PR11MB7455.namprd11.prod.outlook.com (2603:10b6:a03:4cd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 09:26:43 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::d7b9:3194:2145:7afb]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::d7b9:3194:2145:7afb%3]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 09:26:43 +0000
Date: Thu, 1 Dec 2022 14:56:30 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 5/5] drm/i915/mtl: Hold forcewake and MCR lock over
 PPAT setup
Message-ID: <Y4hzRs1LY1dnlEgr@bala-ubuntu>
References: <Y4d76483JRj5d4RL@bala-ubuntu>
 <20221130155852.19601-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20221130155852.19601-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN3PR01CA0183.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::8) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|SJ2PR11MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: f688c01e-e5cb-44b2-02ac-08dad37e26e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0/cxhOLDFYLi54Jo8G9I9IHSfFipS357A/S0+whQfqHJoyXfRVZYW4r1LJ94wL5b051QLo0MmehHb1B25EZ55ek4Q2RpU0/+Hz+bNwCv6tH3atQ+GXx8QmiaxYB7Er+lgQbb2Rk+nBDM15lBux084cSLsm9jkiHph+HOnTtPJHXQZENi6jUgj9YQSMEKXpi09N5jNk7XBBSfWA6/XiplBwKlQbSfsNI3VDZQdehVfPugIJWaopGnUGC5R9dovb9S7B/re8sMuJXoNYU1LQ48+ZEaCZyB33j88m4rJDYggsgf2E5Z0Npb3PDbBteFXyqELN5EKCAHDVXEZrISdWjWR3mqTUXevxHpYJDjSOWBMO6ydQh0ycssSSSYPXGqurb6bO0qbOeScSAvleZKANpFJTU+ovXpSO7Bf7oO9N8xMvVSMadpo6kZz3fOPMr3trWprwRRnYLZhupknuzTfE3Yz5a9w+SWB2kVTceUjsPYY8pfjqOwLqUH+xroDdWmkvbueI3BGidSGdTctfgr1plWCu45AHNasb9GPbjrE87T8digG4bRJuaUj+PcL2itnAElIOD+uvw8Q7nE2Ij67hAa9HNgZWbQ/Li0na38qSUhvZP0JjVA6fi1UYHuYu6hLT+r7Q7BPN9EDhaTMMLMMQtT3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(346002)(136003)(396003)(376002)(39860400002)(366004)(451199015)(38100700002)(8676002)(4326008)(450100002)(66476007)(66556008)(66946007)(9686003)(26005)(6512007)(2906002)(186003)(53546011)(33716001)(86362001)(44832011)(83380400001)(41300700001)(8936002)(5660300002)(316002)(478600001)(82960400001)(6506007)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlQwY1AvY3owTlBoRkE2MkpwK20raHlvc1RZa2RWZUJQNzlvY3o2aWJRWkdo?=
 =?utf-8?B?cStXT0xuZTluRW83WmpSR25oRU12MXRoUkVwVVY4RVp6d2wxenZJOTB6eFkz?=
 =?utf-8?B?VitTeUkvd3E2S3FDb3I5M0NvU1NIZ3M3WFJSOWhDc2dWRHlwWHpRNStvNElw?=
 =?utf-8?B?YWxRV3dnNE54RXNiV2FqbVlKL3VzNmFMMFdkUnlkcCtVMHlyZVB2ZERJT2wy?=
 =?utf-8?B?N0wvdHoxaDhJSW1ZbHFFWlp4QWxhckZ4UXRMdXg2ZDVmeXZSUk9rWDBBWGFC?=
 =?utf-8?B?YkJkeStrZlJVYTZJcWVDS3BWOHpHaGpQYmlQUkFaQ3BWNTFvdkd3d1poOUMv?=
 =?utf-8?B?bFYxWFdpU0dxTWtmY1JmTE1GcGlERzByZy9mbjBXTDJWNEVFNHdYTXlEbmpC?=
 =?utf-8?B?OGJMRFlFSmZKQmcyeFZTdzM4VVdDNWJkSmg0b1NZZTIxVEUrL2VvNlp3SGRZ?=
 =?utf-8?B?cXhXSE10OENMS0I4ZVJyeExwQ3Fhb29uV3l2UTNZMWJQdEtrUCtOVlN3eURj?=
 =?utf-8?B?LzYyb3dTaWc4REcxbEZQMHE4SFVkQi9WTGpjMStsWTFiQ2Uyb0V3bFErVGtz?=
 =?utf-8?B?MUpITWpBdHppZDdCZHk1c3lYMzVaWGlWT0hXL1dRUXNPYmRWT3dLRmU5TTll?=
 =?utf-8?B?UitIOThwTWYxZ2VlRTNtWXByZUhIRFNEb0pMaHJtSmJ6NjV4ZEJsNnhXeEJl?=
 =?utf-8?B?cTluNDJESUIxMUJzdU04OC81aUEyeE5ZVGZOU3pOYmJmQWF6MkdNWFdJYW1X?=
 =?utf-8?B?SVZwd3M1NjNENVZ5blJzUDBnSHI5ZWJMZzd5c2JPeHM4dHBEY2tOZUNreVJO?=
 =?utf-8?B?ejFvdzNjQmtpOUpYdXhXaGdzT0tybXRYSGFVSHNlaW1ZZXVkNDVCb25WcUE5?=
 =?utf-8?B?dGpoRnQ1dEo2RGFpeGtmSkhDMm9kaWR4T3grNVliNTh5aE5OaUNmNDNNVmkw?=
 =?utf-8?B?L2RJNXRCRDladEUxVmVyeXZEMWw2dW5EUzFURWlacVFsNkxaVUNlbTNiTlJN?=
 =?utf-8?B?NlRMdTFoSW84d1ozWHFWaWlTU0xReFdpcWduR01SRnZLUjRDRFI5bVhRbDJ2?=
 =?utf-8?B?MmM1SW84SWducnBrM3piZ3IyOFN3SldBMmZVWkJrRmZZY092SjkveHlyQzRJ?=
 =?utf-8?B?WmpSOHd5MzBTMTRZc2FyeEpwTU0vR2hEWkd2M3RXL0dnaG9kS0lNUjNNSEw0?=
 =?utf-8?B?RjV5Mys4RkNwZVpuVXJFTWpBK3U0dkNwZURGa3ltSHRuaU1xSGFTcHBaOVRK?=
 =?utf-8?B?c0ZWZWdqTFZZNEl4UmhVQWV0ZEhzRFU0ZE5Od3hpWWNRZUlFTU9yMStoOXlx?=
 =?utf-8?B?SThTWmx3MUg1SFM0UjZWTlJvQVFsaXVnUlBCYU53cGN6RHgzQTh5bk5NNTRX?=
 =?utf-8?B?NW5rZXZUd05BTkxkZUFHOHFIN3dNQVp2bDNZa2p4NThnc21vaW1QL1VKYkVT?=
 =?utf-8?B?bFF4eDZMUnY3NUd4SkZ6K0l1UUpPN2ZBODlhWDFNZTRlSHFTWXNpWEJVUXBk?=
 =?utf-8?B?OWxPSjVkVllldm1OUlJMaUI2SjF3ODZ2NnN1REdPTkZyQXd1OW1kbGR2WVNV?=
 =?utf-8?B?ZXJ0RHNvc1RCSVA0RkNQVXlHa2ZBR3lNTzQrQ1dBYWxhRDFHbHk3eWRRdEk4?=
 =?utf-8?B?dzNoR21qRTVOKzhSTjAzSEVHcTkvUGZrV2FrN1ZPZDUrdVZQSXdhRjNzU0JE?=
 =?utf-8?B?aVBBQUR3eFBXUUNxN2didlpTZ3d4N2JYZ0h1NHNKOUozeGRuaTA3cHM4cDZD?=
 =?utf-8?B?dFE1eU55bXBObUpjeEltampPM1dOWGs0V0hydEVtVFlXd25Cc00vd1RKZk5G?=
 =?utf-8?B?aWdlS1RKbmkybnAvMlN0WC9ZcFg1STFDd2JKNTVQKzNaVUtzR213Wk1QUU5m?=
 =?utf-8?B?WkhuSW1OVnJWNXJsaE0zcHpibVhMQ3lDSkJYRTFnRVdETHdWamtTYzA3ZTlr?=
 =?utf-8?B?YWpmUWhTSXpMdVNRZFV1U0RWRVh4bksvdDFhOHp4QW9qUXI0TlJ3ZnFacVdJ?=
 =?utf-8?B?OTlFOFdOUHJVL00wRi9SL3EwdFJGVnhNV2VWNmJNVnZhblJvOElkeGhSWHg5?=
 =?utf-8?B?c3dqWGZsdGRVTXd4aEZ2SmpYTFNPb1ZUbXY1YXE3cS95b1MySWNoTE1WYTZz?=
 =?utf-8?B?Nk8zT0Fmemt2SHE5eG4xSkV6aGRKY0VGSHlINkpTa3ZPQmNWY1dVekZIMlkx?=
 =?utf-8?Q?yFHid955lGjIPkOFX1bKs+k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f688c01e-e5cb-44b2-02ac-08dad37e26e5
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 09:26:43.3069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MgFQOxQt1Ti1A4/lOsGZf8nBpTn22joH9d6nxWVL8Q/90R0PUWUoG56uEH1rVuZdqpM/HD8fBojrTUrzVevChjfwyvGwUBHD84mUKzvny+PLXalJEtH/+HqwzjrwMfzR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7455
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

On 30.11.2022 07:58, Matt Roper wrote:
> PPAT setup involves a series of multicast writes.  This can be optimized
> slightly be acquiring forcewake and the steering lock just once for the
> entire sequence.
> 
> v2:
>  - We should use FW_REG_WRITE instead of FW_REG_READ.  (Bala)
> 
> Suggested-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala

> ---
>  drivers/gpu/drm/i915/gt/intel_gtt.c | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
> index 2ba3983984b9..e37164a60d37 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -482,14 +482,25 @@ static void tgl_setup_private_ppat(struct intel_uncore *uncore)
>  
>  static void xehp_setup_private_ppat(struct intel_gt *gt)
>  {
> -	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(0), GEN8_PPAT_WB);
> -	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(1), GEN8_PPAT_WC);
> -	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(2), GEN8_PPAT_WT);
> -	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(3), GEN8_PPAT_UC);
> -	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(4), GEN8_PPAT_WB);
> -	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(5), GEN8_PPAT_WB);
> -	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(6), GEN8_PPAT_WB);
> -	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(7), GEN8_PPAT_WB);
> +	enum forcewake_domains fw;
> +	unsigned long flags;
> +
> +	fw = intel_uncore_forcewake_for_reg(gt->uncore, _MMIO(XEHP_PAT_INDEX(0).reg),
> +					    FW_REG_WRITE);
> +	intel_uncore_forcewake_get(gt->uncore, fw);
> +
> +	intel_gt_mcr_lock(gt, &flags);
> +	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(0), GEN8_PPAT_WB);
> +	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(1), GEN8_PPAT_WC);
> +	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(2), GEN8_PPAT_WT);
> +	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(3), GEN8_PPAT_UC);
> +	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(4), GEN8_PPAT_WB);
> +	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(5), GEN8_PPAT_WB);
> +	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(6), GEN8_PPAT_WB);
> +	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(7), GEN8_PPAT_WB);
> +	intel_gt_mcr_unlock(gt, flags);
> +
> +	intel_uncore_forcewake_put(gt->uncore, fw);
>  }
>  
>  static void icl_setup_private_ppat(struct intel_uncore *uncore)
> -- 
> 2.38.1
> 
