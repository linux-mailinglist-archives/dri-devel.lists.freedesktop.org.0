Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 689EF60140C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 18:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA5E10EDAC;
	Mon, 17 Oct 2022 16:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D68410EDAE;
 Mon, 17 Oct 2022 16:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666025652; x=1697561652;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lyu4szl0Lv6SIOBCVcr9914LkSDNtZpDBIyrqmhhbyc=;
 b=RlTEk76CGxsdFYkG2fiEE8d16pqLJ3SMfNYz711wGEQz2SeumztUVjKb
 AYpmbCx0JwuCqZBWEQNpG9wmwiikdRboBANJGUX3ExA2pRTMTFoT6TP1Y
 7zRJTWSSoTBLI+sI73qFb5FJBVbiPxaML9klfkkgtv2I49n4c8GCs+MzZ
 Nv3Jltif/3h3C+ngCdytDFTfZrqrqjnQ94K7OK+j8QQ21h30kAtN379vn
 J7ER4mNeFoX75uJwtluVH5WDtMsDrdD3Qm6OJqYqh5dB/wAPjjZ1cDpFD
 +R3aMbRL7l1gig7jA/2IKZmjGhWAO/DWN/YVrKb3prEIkMr+VJzTFjdjm g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="307515193"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="307515193"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 09:54:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="697124727"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="697124727"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 17 Oct 2022 09:54:10 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 09:54:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 09:54:09 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 17 Oct 2022 09:54:09 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 17 Oct 2022 09:54:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZAUyonnHJsuhDDFa7NBGSS7MlrnVOdH1veUaIv/v8/kbo+PYVj4Mq5XWgOYFD/2r3vhR83QxOfVOvRoWHRHYSbc4IbblwZmqYWTenjv8ZfsdpTeQYHFmcmvZOMsZSXZQnWDpEcxXkKbAo27j5M3nWLvgtynrkjVyJCuvYUKLnwVLtF4V1cK9dJArN+R5oPUfOKhze/Lh6tRzUrSug+NntYuL6jwiP7OSkKhoycHm4Cwr2DRzEVSFTGCoTqs3VoSKBTB3w+8KvxcujaN5iALK4oir5TyV1YgKVWL8wQrGC4rvFgSR3oeNFRFVF8bFQRdvgRCcZfT2rNy4VJQGEd47A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6o1fUdH7kqRffnpytDTEVDThPpZp6shlPmLWan58IM=;
 b=UlDPeUdeN8px9GzURs+p5/1a7WcvoyBH827rwdAi69jVA3D/JeyZSYsF/VgYzKooxRIvWY28kvJwqSZLfkgGCYUpQ1USR5UIULBigCgWROUWW8N+p3Q7UOrFhw73lY+GoOE3hgUiegEStl0SzO7Vo/lSLJDFXNTeNm1AMXXoDbCG8bWK//yG8nwbUvFMpMxV0BQUQcDM37ZeRNy7v8/cRZvOmrqFlNVndJPhziQBRr4UOW2ICUodjxrbv9qTms8+GI/o883gyUV6tzC10vimO0lMpD3rU+kpkExBQMDUcbxwnJkyoEQtn3wC9I/poIrEcLUWsBJJUTu0oZeXvuEx6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 DM4PR11MB7350.namprd11.prod.outlook.com (2603:10b6:8:105::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.30; Mon, 17 Oct 2022 16:54:08 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67%3]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 16:54:08 +0000
Date: Mon, 17 Oct 2022 22:23:58 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 09/14] drm/i915/gt: Always use MCR functions on
 multicast registers
Message-ID: <Y02Ippww0nV/hBcy@bala-ubuntu>
References: <20221014230239.1023689-1-matthew.d.roper@intel.com>
 <20221014230239.1023689-10-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20221014230239.1023689-10-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN2PR01CA0235.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::13) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|DM4PR11MB7350:EE_
X-MS-Office365-Filtering-Correlation-Id: 49ff269f-7c5e-4707-a311-08dab06034db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hWF0rDiY3QDII/yFMti2hp9Ffwyax1RGCnCYffElTdmueVPq93eU/v5wm1NetoYzGK9nZOJqfSSXX5yYmHZSqyKNVsTFCCbxFh/DJo8IqzksaidAvS+norEBF2z0TDqlUVvspVpXDnjI/oTEV1F9Hv0loqDCKw0kFyZCXEukNxOaaPfXo/+HJiNUFkogTQtoCfBQ+oHk6KiFih32fMEGT1y0yAypOYTc4Qca/Sj7ccbTgmmijQ18UCRE6ZY5nbtBqG6H9LcwW6Ov+rK9VZ40qgalDIl7oZ+bG2QvszwKYt8ANUMbyW/G86Xk4mzg4lHQlHmh5KpdWnTXmOehGNajP3rxPxDXn+mXcfxrCGbjsOimuLWIE+HHG2rEYpyM0Q//QZ6RREqo4OzFuyjPDYseoPpKOaGI/8lZwRweawChHUp6MsMVtnmXOp2pu3pmpz9+t0Jt1PC4LcXB9Dw+NfzpxhrA6bnCQo0nFDr56VQGJztLKvYJ3QwlE8MA8l/VGchXadDyTL7TzEin11SD6MU8LtpmizdnXiV8pdjtULcOGpISxpV0GqPlVvmcInGM6O3bOfDXijSmXPBgHHLAbONM24O+NL9XI8qETYbZeuOcb3QTKHkvPa1Kq/uDChKs9fri7LQhzXqcTeJerM/lsuvP3kHzhl4Yt5txLXUvx4yhPoTT6tIFz88i+KeevtcVfJ3/S6HqRT1IWIj8AxZ01Ic0cg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(39860400002)(136003)(366004)(346002)(376002)(396003)(451199015)(4326008)(5660300002)(44832011)(66476007)(66556008)(41300700001)(66946007)(8676002)(316002)(6486002)(478600001)(6506007)(53546011)(26005)(6512007)(9686003)(186003)(2906002)(8936002)(83380400001)(82960400001)(33716001)(38100700002)(6666004)(450100002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFNNY2UvYmJaWHVUcWo3NzRDWkdXNUtjSXc2aGRuK21qWWw4TXJkU2NCU0Iw?=
 =?utf-8?B?M0dlb0k0Qk1JNmU0SHRBY1lCam5SM2NVMWVyYTFCMk5qbHR4VGszWFhuenBD?=
 =?utf-8?B?MkFHUEFzYUZaYmdESWxGT1ZsaUZJNWY3bjVnWUYyRXd1dUE5Yng5ZGRHYzd0?=
 =?utf-8?B?cE5ETVRzVEZBZlJMWldRcERPL3U3N2pERFNSekZRZVJvNlpqcmVrTm5UWitG?=
 =?utf-8?B?UmtrL0w3TXNqMmhRMWpHMkh0enhpU0pkbVU4QllPZUZvR2c4cEJDdEZmQkov?=
 =?utf-8?B?ek9uS0FOK0pPeEJkYzZoZ21wcVRtTjMrMm8wVkp5amhqTVBVekZDclh2WHg0?=
 =?utf-8?B?RjBmRGMyaGR4VHJTZmxmUEVMU2lsaUxQTDY5OCtUTkFGRXA5dTA1L2huSGcr?=
 =?utf-8?B?VmpwZnkycXh4YW1udzF1RnNuNFloUzdKQVVnUk1uVVhVV0VRQ012eXVmYkd4?=
 =?utf-8?B?RUVKeDZyOFRyRVJiM3BhYVIwbFRQSnA3a2wxT05idVdSUjJWbHdUdTNsUjZP?=
 =?utf-8?B?M2VlRHZsY0tOUnk0RUFtSlkwc2Zja1ltekxIaGhDZi82cFF3TUh2SGxiaDZx?=
 =?utf-8?B?bDdPQ3EyNFpvMWNNaXdQbk56WUNMdGpWRml6VWQvRUxqZTF6QTBlblZ6NE5P?=
 =?utf-8?B?cEdLcjBtYk9BbWJiaERGMWJtN0l2ZjNQcjBDeGhDUXB6UEF4dHJIa25UUlhX?=
 =?utf-8?B?UGRzS2pXWSs2Wnpvc0VhVWxKRW1CaXpKSDI4SzFJTExIY3FSZlBrWFRVTUQ5?=
 =?utf-8?B?T255T29nOHhhaldEQU5QeHhiS0pMNlBjeWp0VndHcW9lZFZpS2JnUzBUTjlh?=
 =?utf-8?B?TjlTR2t6Q1Q0d3AxSU5HNjhKR3ArQ3JRRy8wdlRWR2VRdm9YR2JzOWplRm1D?=
 =?utf-8?B?ZVFEbUdKTWZGRFNaRnUyWi9PZytlaUZHaWN1RkhZc1BXZVNMTjhWZjRURGxs?=
 =?utf-8?B?Yzk2TllVU0gyVkovQVdjcWlPNjcvOHdlVFA4cGgyL2IrMm9WNGNaVnZ5Zkl3?=
 =?utf-8?B?SFNwamtNTFd6TWJENkpXaTlBTFpLaENrazNJUFN2dHVrVS9LNGltSG5SUEI3?=
 =?utf-8?B?R2JyMHZNaVN4RzVCcTIxWGFvbkhjLzdaVS9yaTJiSDhiNkZabCtjSDFzTm4v?=
 =?utf-8?B?aC9yY2lkalYveUgrdGFucGg5WlcwNVFxVjhQTEVOV1hvaENyM0xQTWNOZkFC?=
 =?utf-8?B?YmVtM2Y0bFVFanJaWjdrdU9zWWJCc0lVc0ZJbnFYcHlEVEVZWVFVMlZKcm9a?=
 =?utf-8?B?UndjVkRBdjlPdkRCUmRBS2JCbkpKNUFjN2txa2ViaFdHVnR3OTN2WGZkUS84?=
 =?utf-8?B?R3F2RHRXL2hsRytvanlZSUJJZ1A0M1ZLcmdTWnlndzdaTkx0bkZyT3UxQnAv?=
 =?utf-8?B?dzA2OFo0ME9SSEdGYlhIbTRvcldyMlFzOC9Oei9Ma1NJeThGLzdNTEVXaE5W?=
 =?utf-8?B?Q2tFUzQwV0dPSEJ5Yi84YkZLUVljZEFacUJGT1VxUWNBc3JXV3JSUzY2MWUv?=
 =?utf-8?B?a1VKUVFWQ0NZR0luUHpuVWIyK0JCUzdSNHJ5RVdTckVKSzRNL1ZTTHEzdDdZ?=
 =?utf-8?B?a2V4TTVFQlVJeTRNZHlxNHE0ZCsxenlVbGVTMjdzWDBZelpSMzAzR0VFa2dC?=
 =?utf-8?B?VHY5L3ljdStLTGRYRXR6VDhrdDRrOEVEa3JSeFYzWkF6aml3U3kraUZhdDRD?=
 =?utf-8?B?OGRqdzArRWRvWjZTRTZRbloyS0lWTWxBOXJXV3VoeU9kdjdDUDZ5SVpWUDd6?=
 =?utf-8?B?UHBQWTdRN0pBS28xby9SMWJRZlBHVWlKazFiSHlQZVQzbmM0RFNFZVhLd01J?=
 =?utf-8?B?c0R1K0NCOWlOVkZWWlRoTDBDQkoxcFovNTRJRDZXS0oySTk5ZzdUaUt2Q2Q3?=
 =?utf-8?B?d0RvdmdTUHZTbVprOWg5UENwbzY4by9rbS9SbG96NmQzaXVkUGFaQ1NrYi9Q?=
 =?utf-8?B?b0xMYnRHaEFwZld3RE5xRkdDS3UwSC9lY3JsZTUvSGl5M1lUazV1L0xydzZa?=
 =?utf-8?B?dngwNVZWQlk4ZFdwNXp4TEVScWg3TTN2ZXgyWEh5bmRaK3VGKzJrcjNXNWlx?=
 =?utf-8?B?NDhhK1lnd3IzWUcyeWpucnh5YWtuUW5HbVpEeWRNc3VpNEwwMFp6cTRHeXAr?=
 =?utf-8?B?dXdwV0VDdGVtUm14VU5kdWJVSFU2WnN3Sy9MMnczYWlRSGVIQWFIODFETU9G?=
 =?utf-8?Q?PDIHv4ZnJ9RGHkrW2YyvbBQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49ff269f-7c5e-4707-a311-08dab06034db
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 16:54:07.9785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tD4K3mS78QgUgRzQEsY7mlTcKZnHXPjK3/+xmxI3cU+rn0q8NVQphyeyuCXXeYMFGNcsY/TMTiA3TwYONFfQ+eAwtVq09KVIYiUUe77VwYoZzG+a+/7BatoKTiCZuCgP
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
> Rather than relying on the implicit behavior of intel_uncore_*()
> functions, let's always use the intel_gt_mcr_*() functions to operate on
> multicast/replicated registers.
> 
> v2:
>  - Add TLB invalidation registers
> 
> v3:
>  - Switch more uncore operations in mmio_invalidate_full() to MCR
>    operations for Xe_HP.  (Bala)
> 
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt.c        | 58 ++++++++++++++++-------
>  drivers/gpu/drm/i915/gt/intel_mocs.c      | 13 ++---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 12 +++--
>  drivers/gpu/drm/i915/intel_pm.c           | 19 ++++----
>  4 files changed, 65 insertions(+), 37 deletions(-)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index e14f159ad9fc..3df0d0336dbc 100644
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
>  	static const i915_reg_t gen8_regs[] = {
> @@ -1048,7 +1074,7 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>  	unsigned int num = 0;
>  
>  	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
> -		regs = xehp_regs;
> +		regs = NULL;
>  		num = ARRAY_SIZE(xehp_regs);
>  	} else if (GRAPHICS_VER(i915) == 12) {
>  		regs = gen12_regs;
> @@ -1075,11 +1101,17 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>  		if (!intel_engine_pm_is_awake(engine))
>  			continue;
>  
> -		rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
> -		if (!i915_mmio_reg_offset(rb.reg))
> -			continue;
> +		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
> +			intel_gt_mcr_multicast_write_fw(gt,
> +							xehp_regs[engine->class],
> +							BIT(engine->instance));
> +		} else {
> +			rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
> +			if (!i915_mmio_reg_offset(rb.reg))
> +				continue;
>  
> -		intel_uncore_write_fw(uncore, rb.reg, rb.bit);
> +			intel_uncore_write_fw(uncore, rb.reg, rb.bit);
> +		}
>  		awake |= engine->mask;
>  	}
>  
> @@ -1099,22 +1131,12 @@ static void mmio_invalidate_full(struct intel_gt *gt)
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
> index ecfa5baa5e3f..49fdd509527a 100644
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
> @@ -609,17 +610,17 @@ static u32 l3cc_combine(u16 low, u16 high)
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
> @@ -639,7 +640,7 @@ void intel_mocs_init_engine(struct intel_engine_cs *engine)
>  		init_mocs_table(engine, &table);
>  
>  	if (flags & HAS_RENDER_L3CC && engine->class == RENDER_CLASS)
> -		init_l3cc_table(engine->uncore, &table);
> +		init_l3cc_table(engine->gt, &table);
>  }
>  
>  static u32 global_mocs_offset(void)
> @@ -675,7 +676,7 @@ void intel_mocs_init(struct intel_gt *gt)
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
> index 390802245514..cb18e45f6adf 100644
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
> @@ -4321,22 +4323,22 @@ static void gen8_set_l3sqc_credits(struct drm_i915_private *dev_priv,
>  	u32 val;
>  
>  	/* WaTempDisableDOPClkGating:bdw */
> -	misccpctl = intel_uncore_rmw(&dev_priv->uncore, GEN8_MISCCPCTL, ~GEN8_DOP_CLOCK_GATE_ENABLE,
> -				     0);
> +	misccpctl = intel_gt_mcr_multicast_rmw(to_gt(dev_priv), GEN8_MISCCPCTL,
> +					       ~GEN8_DOP_CLOCK_GATE_ENABLE, 0);
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
> @@ -4496,9 +4498,8 @@ static void skl_init_clock_gating(struct drm_i915_private *dev_priv)
>  	gen9_init_clock_gating(dev_priv);
>  
>  	/* WaDisableDopClockGating:skl */
> -	intel_uncore_write(&dev_priv->uncore, GEN8_MISCCPCTL,
> -			   intel_uncore_read(&dev_priv->uncore, GEN8_MISCCPCTL) &
> -			   ~GEN8_DOP_CLOCK_GATE_ENABLE);
> +	intel_gt_mcr_multicast_rmw(to_gt(dev_priv), GEN8_MISCCPCTL,
> +				   GEN8_DOP_CLOCK_GATE_ENABLE, 0);
>  
>  	/* WAC6entrylatency:skl */
>  	intel_uncore_write(&dev_priv->uncore, FBC_LLC_READ_CTRL, intel_uncore_read(&dev_priv->uncore, FBC_LLC_READ_CTRL) |
> -- 
> 2.37.3
> 
