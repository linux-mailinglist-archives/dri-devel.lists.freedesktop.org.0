Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D932D59FB48
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 15:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904FF10F985;
	Wed, 24 Aug 2022 13:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E41614B312;
 Wed, 24 Aug 2022 13:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661347564; x=1692883564;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2q2Z6eZCxclcCnZdngG1zX3dE5MJIorD17kjZXHomIg=;
 b=d8GyioMgYmsWFY92IKjITcSln7QttdAR7wCNO39rOIAW70e+Jhq7OKg3
 5QnOosh+OyGxAN1KLtRHYB1Y9J+1s1x9LaQpgEkm9Di4Fuw2GFiXQGs/r
 wSdkjtaUU8kUkDnYxnAl5zJkloddpJiFW6/Ckkq/Db9aSI6nzrmWi2Y7r
 ZwGOaRcAcBnG8101E/RhN8QSHihMTg+sAaKLoSMDDpjmciFO043L/D5iT
 rksXCyICuqNkM2mWjPshmvTC9vb//LP8E7/Zgm5+feN38xmisGPaUyzNX
 dxw2b1YCnYvCBG6/r7aydSRTsUa3Z9I2f6KJwcxzKh1GZskXdmg+Ch5Zb A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="295246665"
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; d="scan'208";a="295246665"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2022 06:25:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; d="scan'208";a="678044955"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 24 Aug 2022 06:25:46 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 24 Aug 2022 06:25:46 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 24 Aug 2022 06:25:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 24 Aug 2022 06:25:46 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 24 Aug 2022 06:25:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHG5SSnJsuSeNGsgHsUUcXJApFvmBE5gFUfF/7XZnJF/I+xtrbsu4+0rdZbiq5qBUnJKGeMFdVxTGIGRl1UeXkGyOimVQXojm8C2yyN/Yug/Z/b6SNsEZuWZhG+FTvH2CLkXN9vROcb0tVgK7GFRTyHbNxMZbpvy/W54Mr9y1hSw7D8QtNN/DPnH1oclZSMQCeY1sCAczmFvLd+faQi4XeprP3FqJ8xq1eNHL4pSv0XEDMMxPYNg6D5qDrAl+YgnfYCsDHI3Oe/eXrARIu6Vaero85xY83oGD7+xe88tbpmjJNyVknJ7ouCCFy6rrJ63RaKYQRTYKU8zJ1rMV4z7mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Q5t+DTyvk0VRnGDZjwLrNd/mOFFAJb0WnHS2KTZrMQ=;
 b=Mi1rGvIje+U7ru8Eo45dUvvxQzsMpGTJgaCuXSok/tE3uPG7D3HD70y8MWgPnlLBReq2t/Y7ezmnDCglKI+iespD/Wtw1K9/heTZYDjwuuFHAuB2d0mCuwuvzuXCgDAS0hsTUHjQfgFWZq3ocWRkorfpROfibaxQmFDOxjgYl/ndhthIwNvQNotCyQHBsF//Jud9kMr0428WHsNFt12Ka8ImNvnvPPDLVfIdSelt1rYS6wuKrZ4mhpl3iO3RKYp1KSEnEVA1oC2VH/1o9Hr+1Ny/xmtDzlpXz0+hICKGIHSV4Pmr7mbtvTWwfJ3bpix0nrBSD69+CEQMiFQuy7Dk/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 SA0PR11MB4608.namprd11.prod.outlook.com (2603:10b6:806:94::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.18; Wed, 24 Aug 2022 13:25:44 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::46f:6936:6441:5a7a]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::46f:6936:6441:5a7a%8]) with mapi id 15.20.5546.024; Wed, 24 Aug 2022
 13:25:44 +0000
Date: Wed, 24 Aug 2022 18:55:28 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 03/21] drm/i915/mtl: MMIO range is now 4MB
Message-ID: <YwYmyM8xsr/UYTmk@bala-ubuntu>
References: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
 <20220818234202.451742-4-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220818234202.451742-4-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: BM1P287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::23) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6a1a2f7-f3f9-437d-54cd-08da85d425ce
X-MS-TrafficTypeDiagnostic: SA0PR11MB4608:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kAwEDHa80dVcaiiZUpvWGc+BD1adkibbhn1GhI3mRmQjJab5P1UV+bDdbH12d6Ioc4Gq7BUAHPQaqs18BcmVkV8GtclSAs+wxy5e7qim5KSsv2QHChst8zMmihhEO4qEaqNiy3f3DekVoxkIFptqX2IgmxBz026nWO5bd9vP9BilioVl65239XYlqLokXza7P1HQmHK4T7rcIpcBKArLChnfV+Cw7f9+3GPlDGB2IOrpaPql0TS3BJD7jNb1c0n8t8rn0ZqQMESOGHlXVNAUgGWdJITriOc4SmttIKnpKGDMYgzfSB1yHnK3InQt0hBNPGEX3M0Oxqya6DPpjQ8uJlwgL/zA25ooTnZrNN4ffJbEtgyvi3SP6I6I4w1KD7wpunf9yGHFIKPrrcZMxpHoGmXa5eMTuxkxaPU+e7J98VuS7dLJilTxW2wqSjkYNxAGIFLkk6ZwsWKv6EEUL9bL8aRvSXfxu4wmPIkhKjNMKOisnFSVjJ6fQmKcfmx/SEqgTY3gDzGGbxBfUYOWGoX5RZfy5dxWbj9sCpQqQSzbKdzMjUgBrqr6kz7eMY53vizMBfUjR577iHHffogkbdqF+0RDYRcBlTClb7Oivgw6lBpCp3Pb4b4KB8czfMyK0+tZToPItnJkbP3j0tDgvvKOqmnmsGwLFJ+wYa/00IhFpVoXU0+Cvuyzn72ZhKmwsA9uGL9RNiKcoQRkJZh8rPOfWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(366004)(346002)(376002)(39860400002)(396003)(136003)(38100700002)(316002)(66946007)(66556008)(4326008)(66476007)(8676002)(450100002)(83380400001)(33716001)(6512007)(26005)(6486002)(53546011)(9686003)(86362001)(6506007)(2906002)(6666004)(186003)(44832011)(41300700001)(478600001)(82960400001)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEZ3YlVHT0NVWmpUUGc1Vzd0MWx2WlgrQ2NIY3dDN2JxY05kUFEzRzJYZWgx?=
 =?utf-8?B?enVIZTNzRE9wSldVTDM3VXZ2dW9jSXcvUmxPaGhmOTNDeGJJVllqRFl2dG9q?=
 =?utf-8?B?ZHZXNXlBS2kwVzZIT3gwa25tUCtzM3RudEQzMFRpalNUK2xYa3R4NTVVbk9q?=
 =?utf-8?B?LzhReVpPNzRKUG1hZ3Z0ZVBsUTF6U0VKa0RsZnZTSE4vRmVpTGlhUWhTU3NU?=
 =?utf-8?B?V0NEVlBydVArcFdFa0lDcktlR3FCQ094Q0JpeXozNE05VGRzQzJIcE9ObnAx?=
 =?utf-8?B?cmhPaG1yUGFTdzFGU3hUd0ZCR3dSR2xKTHE3Mk56K3FDbDgwTm1FSm1ja3Np?=
 =?utf-8?B?aTJ3aVdoVklPTFBDODc2L2xkTkVmS0M5WEZCWjB6RSs0OWtlczRVa3l6MHhy?=
 =?utf-8?B?eExXS1QyeUllYXBrdWpQcHZYS2JvUVZCSDhtdU56UFBTZWd4NkE5WGloOWFw?=
 =?utf-8?B?SzFyT0Z4WWZNT2Zsd3luQjFOdTVlSlA2bVJuK2dvSlRsNEtsVEk1bG5oOVlu?=
 =?utf-8?B?Z2wrL1BFQTBMeXpMeUhscGIzRldxRkdZQ1hUVm5BM1hZOHBEaHV6bEVNKzBV?=
 =?utf-8?B?aW0zZjRza0RtMGxIZGpFUFhZMDQzbk5TNW5zV3JXWkFVQmZMQ3R6bHZQOXVo?=
 =?utf-8?B?eHNxSisyNmZNVjNxaVhtU2tnYitwaXdINXFJSUkzc1JOeER4dHRTUmJjc1gv?=
 =?utf-8?B?UmN5Z0xGcTJHdFIzQnIzMzQ5dWhudTZ2TkJQQnNLTGRKcHUrU1RxK3JvTlA0?=
 =?utf-8?B?R1hXM3E2cWVhbEFWYWdoMnZtQllIYWJSNFgyb1poU3d0Q3VpeXkrOTZMMENa?=
 =?utf-8?B?akE5N0IxQXRzNVN1TkNZd2FpR09kdTdDNDhXL2R6OUExVWF2ekNaZDlHdjYy?=
 =?utf-8?B?U2VsWDhudHU2UG0wZEJZTVhzd1BvSDIzUkI3bUhDUDFwK0ZrQnhCaGo1ZXpK?=
 =?utf-8?B?NFZrdTRZTmg4anJYTlJTTmd2SHpkTksvRWxTK3k5d1RPdUdzN2xrNVBBSGdo?=
 =?utf-8?B?R2dyVnd2VEJWZnBZdnNyRDJlWlA1TFA4UXRwa3E4d2NnSFdjUzQxOWRYZyty?=
 =?utf-8?B?bHRlSER3ZzJnUUc0cUZMVlIrNjNWQ1Vxd21XcjBwMXRyZlk5T0phR043SVNT?=
 =?utf-8?B?aXc2OG9RU21tOG1jdFRrUzE3VjA2eVRjRDUzUXc0SEhwZU1uekQ5RlR6ZnZ5?=
 =?utf-8?B?TUVRMTkyY0pjL2RXZXNDYi9QV3RwWXNYN0U3QkxubVFJc0FkS0pMYjBFbWpL?=
 =?utf-8?B?OWlLQ295M2t1Y1JLTkhxOHVKY0gybkhoSnFHdVhVM0Jzc0hzTURtYjJRTE55?=
 =?utf-8?B?QXI4Z3pGUHA0Um9naXdUWHlQdGYzZFRGQ3ltSUp6eDNTQlhMYklRcmsvR1Ni?=
 =?utf-8?B?WDVGYmxiNFZmT1E1aldra2NGempUNTR1L1BtQThWSkRUYW04YW1TS2xZTGNW?=
 =?utf-8?B?QXJ1RDNFSFpkZnlkMEJqVkh4dFJ1MTA0ZmdHWVJTcUxOdER2K3kwUm9wU2hx?=
 =?utf-8?B?Vm5EUXpwNXBaMHEycHlieHJldWRVbzRLYVltcFJuamp0M05LcUhTbzBLZjNH?=
 =?utf-8?B?SVhuUFQvZFJPZTR1ajZ2Qnh4dmxYOUM4L1RHLy9YVCt6S2d0NjRmL3NJTVZ2?=
 =?utf-8?B?Sm5SOGRpbk5EY0VhMlMyN0ZQUXc4NmhaaWlUc3JNSWxKY3pjdDhHdEZJakZY?=
 =?utf-8?B?QkdhWStyMllPa3pja25ZNzZuZEdZTFpaWDh5K3ZaNEQxVjNKN2xydWhXZ2Fv?=
 =?utf-8?B?U2RVZlRFTWlhYVJucHNkSlRrTUFXNnU4ZnFTb0hNQ0p5SkRYajRJYlJlR2J4?=
 =?utf-8?B?YjI3dFBzYko1REdxZTk3TFBKdFpkQnlOS05peGN5QVQ1N2F4ck9DL2pEc1VJ?=
 =?utf-8?B?Zld4OWhWTlpvVUtpeXYxaDgxR0dmcDlSbEd0SXpQVzZORmNBSkdtQ0VTQkRJ?=
 =?utf-8?B?eTVqZDI0UlIvU01ZTGFEWVUzTGpKbDRtdHhkcDRIUFlJVVU4N1RaR2Q1T0sw?=
 =?utf-8?B?UHNjOUw0b0FoM1NZbnRiOVJ2UjJpWW1aYjNUeVBWc2pVQkpOTWljZ1ZyTUtr?=
 =?utf-8?B?SUlFUjZRNnRNZktGRWRrWFFub0JiRjFKRzFFcGoxbERVaVNxeENlbVZ2YUZT?=
 =?utf-8?B?U1RDWmtZLzdxdDJBRTRidUVlYU1LYUFQNUxJOEhkQlByRVl3NWhqQ3ArL3d2?=
 =?utf-8?Q?uxrPNZBUIN7VI2b1nrouK7Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a1a2f7-f3f9-437d-54cd-08da85d425ce
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 13:25:44.2217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCbLrnNgE5O0jf+6ZmdSkwxpy+mSMEol8LmMnBYS+5anej9dSgjzcxmXfoN9r/3Rfl3ZxDHsvfNKqCj2/9K2J2kNHj5Vt/AktQmcuOigOmV+j6A9F8TbCaUR0i76lvDC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4608
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

On 18.08.2022 16:41, Radhakrishna Sripada wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> Previously only dgfx platforms had a 4MB MMIO range, but starting with
> MTL we now use the larger range for all platforms.
> 
> Bspec: 63834, 63830
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  drivers/gpu/drm/i915/intel_uncore.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index a852c471d1b3..e0a8a8cb2052 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -2232,14 +2232,15 @@ int intel_uncore_setup_mmio(struct intel_uncore *uncore, phys_addr_t phys_addr)
>  	 * clobbering the GTT which we want ioremap_wc instead. Fortunately,
>  	 * the register BAR remains the same size for all the earlier
>  	 * generations up to Ironlake.
> -	 * For dgfx chips register range is expanded to 4MB.
> +	 * For dgfx chips register range is expanded to 4MB, and this larger
> +	 * range is also used for integrated gpus beginning with Meteor Lake.
>  	 */
> -	if (GRAPHICS_VER(i915) < 5)
> -		mmio_size = 512 * 1024;
> -	else if (IS_DGFX(i915))
> +	if (IS_DGFX(i915) || GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
>  		mmio_size = 4 * 1024 * 1024;
> -	else
> +	else if (GRAPHICS_VER(i915) >= 5)
>  		mmio_size = 2 * 1024 * 1024;
> +	else
> +		mmio_size = 512 * 1024;
>  
>  	uncore->regs = ioremap(phys_addr, mmio_size);
>  	if (uncore->regs == NULL) {
> -- 
> 2.25.1
> 
