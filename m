Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B51515EA611
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 14:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B8A10E699;
	Mon, 26 Sep 2022 12:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142C210E699;
 Mon, 26 Sep 2022 12:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664195330; x=1695731330;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=22pIydllmdSvt+3+8YjorINcXPzvQmTr097Y9dIe6ZU=;
 b=mnDNfQ1d2T8wTsfLWsVOpMJcSPUy1xjM3qanIdV2QM2OL6iargemZctu
 uuhP/oc+LJ4/Wsh/HZzVjghOE+MFjPhfEnd09TdJ7VE8TVG1uJTftjulO
 rjvTNj2vC2Sn5B6KlpnCGNB4CzN5U1Y1AV/bj7d7ghZOYz1PuufY8qtf4
 78XRjurVFzo9uggPQgX4GqT8/Raw/ySrlAMU5JlZvdMP++PZIiN2LxbX8
 xGc3HypLMkkeaNsMf8ujluklSu/TPcc2F2L8nqz1Lazy1SuYDPxmf5CZL
 uRSK1BlZfQz8F7fREL7kPe33PqLGM6DqaQV3j27mrS3FT82VbExh1XhoY w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10481"; a="365045496"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="365045496"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 05:28:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10481"; a="683508684"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="683508684"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 26 Sep 2022 05:28:48 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 05:28:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 26 Sep 2022 05:28:48 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 26 Sep 2022 05:28:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tx81PrBrZDqOdQvg8YLJzKHnIWraZiHdLg9ZFDko0VehLZ1aea7W4VE9H4Hwt3iPAf9LGt3mfJpBKez+mmBMPTcE6eO6Csobe1lFePEpbnkcGK90wvOSVQlwTI2+v4KdieV2I9m5NZK/vazSX4Gav+qE8qqgHPwosiCYCYGZTp0C+GfcJ6VATCKzSwhjBjzHQzTjFHUdMH87ql2zVvrtOwLH3f8ABmXRaEzWwCRGeZJv42/rvC2SI/IHvbQ75aKJwrlPrBApkreNZWbSCd5lp+Was4wkP5SAwxeCOzqYyr+xkqSzqegGmdvrTk3LgMfSdTEm3X9tpAcqbFhqKFNzeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GEm5f2OQTlL/UXt3Eb0iyo7pbZI7EvAdJe37G0x4j0c=;
 b=X58zzxb+JSLstRnrY+n2oqdwNSA5yt6kPzHba/hZYi4fmtkgWv75TyxZwOBIqvsZmolCYNTRb/uhaOlQbx+D4kw73OsQGmrOYlD8s8E3nrqSeZ4WMNpNt6SU8yD907z0D+3dUfzDwlklyWwJ+KKFhq/jtMDE1IhZWEmOK21IjOtEnbEDr0lyHzx/DHAmxgj3UTQ9SwHfsKgUJxvW2bFUbXMB4sbAGz8fcYSEmz5VXfyN8m3iORrj71B5kaNqu4h8M5cqvs8/d14LXHX8DEqoXBZ65CZFAcA/5+0tbiKKZFC4Z3TnugGFzLYY5ajoPJLF90Ek5mTBfG+BRpxR+8xu/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 DM4PR11MB5245.namprd11.prod.outlook.com (2603:10b6:5:388::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.26; Mon, 26 Sep 2022 12:28:46 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::fc2f:babb:578c:f03e]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::fc2f:babb:578c:f03e%6]) with mapi id 15.20.5654.024; Mon, 26 Sep 2022
 12:28:46 +0000
Date: Mon, 26 Sep 2022 17:58:36 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 05/12] drm/i915/xehp: Check for faults on
 primary GAM
Message-ID: <YzGa9OyMKfHJ1S71@bala-ubuntu>
References: <20220919223259.263525-1-matthew.d.roper@intel.com>
 <20220919223259.263525-6-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220919223259.263525-6-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN2PR01CA0235.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::13) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|DM4PR11MB5245:EE_
X-MS-Office365-Filtering-Correlation-Id: 90553ee0-2b52-4233-c032-08da9fbaa801
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aJOHneByBeLl00epvH8HRkSJRniw6fSSHEO6Ryj4ey76SORZreg5XzQkRwpSEfoTPzUNRhj4fb/lexsZZ7hbuTHYmH7G0bOZ78UVGaOMES/jiYun/EZ0akcrWpKXGd3dfCnBadg9lRGhH95m4DneN77vyB+Kh7I24RNkz4FoJYvs/ls0L/DdRTjMTJYeb1QZTr9Q7Vrd7EcbqdiqJhhANR0cLgW8eyYUq6cMKSS54tv1vOy1bycblfrHx8iT8abUOSJiw5cyuXVez19nma146cAMRCjJ8QgawAb3xxH19YXQPY4J3sk2d9x/UweLWBEYw/uKXGH5KiWiLbcnSaiU4VAoYFzY2XGshPTSnkVlMraqWOQcjFFmNam5VkGba6ZrwL6PmJvTQudPcFmpRbVF49quS5Hdp6kXnZb0gVInY1w/JJACKuN0E5eZyFmtnVhI4eiaZlvWCs+UuWoM8NSZuqaWQgxhBG1Na7FK194d4P9mEkqTbdmN+xt/VZQJVfZ+Hk31oETwl9a9d0boFyLnBjbjRvxgNEsVblp5JloEe5Nhdn46Y8Lo8bPR8IHWTCatubKawBIzL3A9uuWGxY2hfgHv64411poK9lx5WoGC5vo79mZCRXoFo2pBMARZTpIO9Jun+JhplwLQ7IiUOwYtfYEQhav6Mmwcybpzk0mhznVe9vNi8IjhL1j6CkftFQCy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(136003)(366004)(39860400002)(396003)(376002)(346002)(451199015)(316002)(8676002)(478600001)(6486002)(450100002)(66946007)(66476007)(66556008)(4326008)(44832011)(5660300002)(6666004)(38100700002)(33716001)(53546011)(9686003)(26005)(6512007)(2906002)(8936002)(186003)(6506007)(41300700001)(83380400001)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVhqNFN5UjVHZWg0S2pRMjlyOFhmdEVjQTdtd0hvUjV2Vlc4YkFJN3pYZUdV?=
 =?utf-8?B?UXk5TktRL0R6YXJLaHRZMmcvdEhvRU5yVDFkRWhDUElJbU00TUdTU3NHUkVE?=
 =?utf-8?B?cFJEWDJ3MDBSVFRqSE5qL2RaUmdwaUdMcklFUForMGJRWGhMbjZGNjFmYUxN?=
 =?utf-8?B?NC9Ud3lnbTN1dG5jL1FOQUtnanh5eWJLTU1xKytFWUVwb3RLR1QyN1RBWVZ6?=
 =?utf-8?B?K3c3Mk9aVktEM1hTS21hSUZSSlpnQ01IcHYvcWc2RlpWemRyc2tNMlkzQ0hy?=
 =?utf-8?B?QUNJSWkwNE1mMmVDUnJ2R2xjWDR1c3ZxaU5xRDBoOTlZTjVJQlgzOEFDUUo1?=
 =?utf-8?B?aEQxbVlPRjhiSnRQUWthU0YvM1I4WCs1Vk8wVUhQcVJGUENRaHBQZ0ZRUUQ3?=
 =?utf-8?B?d0JYWHFEaWRGYndGdFEwNEoxQVhrSE5XMVpJTlhwSFBNLy81dlAyWVAvVjVJ?=
 =?utf-8?B?aFRjekNtMDBKMjI4TVp3VnphM3pIN0RNTUNlMEw4citiQzN5cVU3alpiSUZx?=
 =?utf-8?B?WTVoOEMrclNvNDJzL0Rsc3hEMS9HQmVuOXVYM0N0NDBCUHlXWXlZNmdvamgy?=
 =?utf-8?B?UHkyTE1jVGZta3B3eHc3RTNXejZUcVZhN0FXVGtKMkI3Rkl3NkJsdVRPcFhn?=
 =?utf-8?B?TVN4dmpTYUdGaGJnK3BDRlVyYm9tbkNIV1NSSVp2VlhSU3Z0cXFmWENWTFpK?=
 =?utf-8?B?bzJsellOUDM4T2tYTTlnWmt6bFBQNkJZU2ZBZnloY2FvaWhnUlpvM2cxclN5?=
 =?utf-8?B?dDFZWXkrbWs1VVNLNmhkQkVoN2hSTDlBa1lCSDVrNVRXYldmWFBNWmJzbXRB?=
 =?utf-8?B?RHdwcSt0WU1Tb2hvLzA0SmVHRXpDSm5jemtUZG1GZHdMdGxQeDFteTBpVjcy?=
 =?utf-8?B?REltZHA2YzN5L0Z0NDI5R3I4QlNrcnV6c3E2bWJPTmJLdnk4NDMxVUxXYWJh?=
 =?utf-8?B?M21IY1JtOHViYUZocWU4VnBnUlAvb3RBaTNkK2xLR2ZOalpNOVVEOHJDdFQ2?=
 =?utf-8?B?NmpFL0NVKzFZQVU4WjRkTjkwaElOSVZBMk83aEhYTURiOWQ2emRTM2JjTGN2?=
 =?utf-8?B?TStON1VRUCtOZHU4TzVITVRYUHlqYlhhaG4zTS9LN1lZZDI2SCtReDVLNFpU?=
 =?utf-8?B?Ly95VWFuVStaMms1UkJOYnFwdmFiRnAyNWVTNkZYTGt1VXN5NWU4elZicUg2?=
 =?utf-8?B?YXJuc3dtcDI1RGF6YU9jNDJuUWNDNWRxWkp3anljYUJZd051dzgvbVR5TEt4?=
 =?utf-8?B?V0sxRlF1dlo3cGxHSnVYY1NpeEhSNWFBTFp6UTFGVUNKTG9McTA1SVFhMzNK?=
 =?utf-8?B?K0w5WlU3SGd1d1FSazlVTTFhMjlkQ2dMTUVjZ1lndncwNTFINXkwVVFNcVlO?=
 =?utf-8?B?NzBabTBMNGRiZ2kzcDlXS2VzczNKVmVhUUJvYnQ1SjVYdjBDdU9EUE9paU12?=
 =?utf-8?B?SlFsdHJjWWc0SDRhenBvK3J2VGNSUW9rSE81aTEwTkp0RE5LT2dBclhKdUdQ?=
 =?utf-8?B?RUJWT1krQnM0TnpPVy9hUnRycG1lTmlodStFcGNPdDQyWTNsT2dVSzh5ODAw?=
 =?utf-8?B?L1NSd1M4ZFduOCtFNXZCTkM4MEExekErMkdWdnNMZ2lhMjRoQ2k0M0pDWWNJ?=
 =?utf-8?B?cS95QUl0UzJPdmVpcDhaa3JieWlCNkltbmkyNG5JSmpwdkNvN0tZMittQ0J3?=
 =?utf-8?B?RGcvb1MrYXVBNHU3UVppRWJXUXlKM1JNS1I5YWdrd3JFMDBEZzg2Y2Y1TWUy?=
 =?utf-8?B?MHpjeUNJcENlbDVRdEhiZGdsOXhVUFZFTG5nUWsyNUlQOFM0Q1ZOY25JZlFw?=
 =?utf-8?B?dVVZRkhDVGN4QkhVNlZ0TVcyYm5DaHBqWHBWMGhUNjg3cDEzMGhnM1lGdWhU?=
 =?utf-8?B?NXFVNUN6ZTAxSTRuQzFUdXB5M0dHVldDY2N6YlhuV3Q5WVRwZUUrK2RnRGFl?=
 =?utf-8?B?NDNQVytDQnFVWGRzSUpWK1BseWYzUG5RU09oUkVlS05wVEFuTTF4UzgxVHhK?=
 =?utf-8?B?US81d0JRNkpSM1JVU3JBN0dHNkRrY25PS0hOckVwRUZDNDFaQkNkVHh3U1du?=
 =?utf-8?B?ak1CSDN1M0RGUHFvVUVBeGlUNkNwamIxaGwva2JmNHZYNnlrcFJDZXJPU21u?=
 =?utf-8?B?NEhYSHNrRExLQW1kWUZHNVRESnRtUGYwdUc4RWhGNXB2M2ljVFZTQlV2MmFX?=
 =?utf-8?Q?VUIt52FV+WNNQPHECr1+MTw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90553ee0-2b52-4233-c032-08da9fbaa801
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 12:28:46.2610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jd0ub7WfXpkhyV7DwUnPi8MwOgPRQHWe+Bvkl2dgknJf/N1d3LngPdKvnHlyCBdbXNZDByJUu/aTFRis31Ph8/3bK1RI0hTx9znVeZd5S3tmyu9guWcZd367iG3uEoC+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5245
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
> On Xe_HP the fault registers are now in a multicast register range.
> However as part of the GAM these registers follow special rules and we
> need only read from the "primary" GAM's instance to get the information
> we need.  So a single intel_gt_mcr_read_any() (which will automatically
> steer to the primary GAM) is sufficient; we don't need to loop over each
> instance of the MCR register.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt.c      | 40 ++++++++++++++++++++++++-
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h |  3 ++
>  2 files changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 5ddae95d4886..1cb7dd40ec47 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -304,6 +304,42 @@ static void gen6_check_faults(struct intel_gt *gt)
>  	}
>  }
>  
> +static void xehp_check_faults(struct intel_gt *gt)
> +{
> +	u32 fault;
> +
> +	/*
> +	 * Although the fault register now lives in an MCR register range,
> +	 * the GAM registers are special and we only truly need to read
> +	 * the "primary" GAM instance rather than handling each instance
> +	 * individually.  intel_gt_mcr_read_any() will automatically steer
> +	 * toward the primary instance.
> +	 */
> +	fault = intel_gt_mcr_read_any(gt, XEHP_RING_FAULT_REG);
> +	if (fault & RING_FAULT_VALID) {
> +		u32 fault_data0, fault_data1;
> +		u64 fault_addr;
> +
> +		fault_data0 = intel_gt_mcr_read_any(gt, XEHP_FAULT_TLB_DATA0);
> +		fault_data1 = intel_gt_mcr_read_any(gt, XEHP_FAULT_TLB_DATA1);
> +
> +		fault_addr = ((u64)(fault_data1 & FAULT_VA_HIGH_BITS) << 44) |
> +			     ((u64)fault_data0 << 12);
> +
> +		drm_dbg(&gt->i915->drm, "Unexpected fault\n"
> +			"\tAddr: 0x%08x_%08x\n"
> +			"\tAddress space: %s\n"
> +			"\tEngine ID: %d\n"
> +			"\tSource ID: %d\n"
> +			"\tType: %d\n",
> +			upper_32_bits(fault_addr), lower_32_bits(fault_addr),
> +			fault_data1 & FAULT_GTT_SEL ? "GGTT" : "PPGTT",
> +			GEN8_RING_FAULT_ENGINE_ID(fault),
> +			RING_FAULT_SRCID(fault),
> +			RING_FAULT_FAULT_TYPE(fault));
> +	}
> +}
> +
>  static void gen8_check_faults(struct intel_gt *gt)
>  {
>  	struct intel_uncore *uncore = gt->uncore;
> @@ -350,7 +386,9 @@ void intel_gt_check_and_clear_faults(struct intel_gt *gt)
>  	struct drm_i915_private *i915 = gt->i915;
>  
>  	/* From GEN8 onwards we only have one 'All Engine Fault Register' */
> -	if (GRAPHICS_VER(i915) >= 8)
> +	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
> +		xehp_check_faults(gt);
> +	else if (GRAPHICS_VER(i915) >= 8)
>  		gen8_check_faults(gt);
>  	else if (GRAPHICS_VER(i915) >= 6)
>  		gen6_check_faults(gt);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index cf87a1b36a21..dff38b0c4430 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1024,11 +1024,14 @@
>  #define GEN9_BLT_MOCS(i)			_MMIO(__GEN9_BCS0_MOCS0 + (i) * 4)
>  
>  #define GEN12_FAULT_TLB_DATA0			_MMIO(0xceb8)
> +#define XEHP_FAULT_TLB_DATA0			_MMIO(0xceb8)
>  #define GEN12_FAULT_TLB_DATA1			_MMIO(0xcebc)
> +#define XEHP_FAULT_TLB_DATA1			_MMIO(0xcebc)
>  #define   FAULT_VA_HIGH_BITS			(0xf << 0)
>  #define   FAULT_GTT_SEL				(1 << 4)
>  
>  #define GEN12_RING_FAULT_REG			_MMIO(0xcec4)
> +#define XEHP_RING_FAULT_REG			_MMIO(0xcec4)

The fault registers GEN12_FAULT_TLB_DATA0, GEN12_FAULT_TLB_DATA1,
GEN12_RING_FAULT_REG are used in few other places in the driver for
platforms including Xe_HP. Don't we need to take care of them?

Regards,
Bala

>  #define   GEN8_RING_FAULT_ENGINE_ID(x)		(((x) >> 12) & 0x7)
>  #define   RING_FAULT_GTTSEL_MASK		(1 << 11)
>  #define   RING_FAULT_SRCID(x)			(((x) >> 3) & 0xff)
> -- 
> 2.37.3
> 
