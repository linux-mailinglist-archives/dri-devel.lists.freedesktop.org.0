Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 772FA86C667
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 11:08:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5104710E3F6;
	Thu, 29 Feb 2024 10:08:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MEY+NO+M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0015D10E3F3;
 Thu, 29 Feb 2024 10:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709201327; x=1740737327;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cDtJJeUCVb7Q6Th0AmnoPqCuTcQ0ss818Bw9lJy8WL4=;
 b=MEY+NO+Mh1z0RMwpTcvVSsJmHExTtc3hwIvfmeY9S9w9b1ftmGxj3wr6
 63BgOsafyt0ttUrc+JceeNSajuz6K1C2I/FaXbXkmG3W487aR8Ed/ge55
 RVHLzcJMNynhWhtcU/ShxtrDVnuw+zNByC7B44TP6JGclPYFUDw28dCQ2
 sqA0emlH93fkBgxpktjXhkPZh7vk2YbPnSm29SBLY9zffff6uD2GXPZsm
 tE1t5OMN9Kh6tDZRCYboFBToJAWclJFJkGuDQUHXl8JudguMCmupDxsjU
 IUOv3afJQhK6q1cLHv7farLDkUf/dW53fhdJ2l2ugy+A63ruFKOi3UfyR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="21203518"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="21203518"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 02:08:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7691227"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 02:08:46 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 02:08:45 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 02:08:44 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 02:08:44 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 02:08:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J3EQUWF5ekldCbOMQp/SALmgAweZaUCczFIKoaEGIeOtKkV0d6rsbEcJjLNhkMeSG9Qszc+3UrJwvRJHMZQBmJ6MxF31NO1gWN3srC/iWL7faerZu1LTN1fOpSyXS9GoHr9pa+bMx2H50r/RGAnFO6j7fv7cxRBqpqRZP9+gjEXxNV9AgrYq3eY5rz1Ry6JQYrIJij58JuW1+eU7CjV6Sm/gMbtY2tsOf9qWwa4U1yIv9uAoRMymrrFJR/YWT0ZwWex7W6EcfrB6/qOHqlWNpseEJoQQ0Z9LSZrGmNqMIJHBmoJFRTffpYT2tfSweTBG5MRMIm7s23aja/9eVHdjCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+iuYghr/W9ktL1EsIA6bUKOH8pv9j4zrpoWeldxX4o=;
 b=kSeEzar9oG1zmUteXoPm6xb69hrHEY9tdw/krIOJ3GPrlMofCwOatQu/5M59WjLKBY6UJffQVWYdOKxv6ch2lIdMIrRCcbTgiR32L9vJVs8xVJR2YREW4ZXIqrFLPGMvJxwevydgn9/KXKoq1Yws2H3JMsg3Uq6zmIEreAeXoXBMtJ+ywf7ZqfMnUTpYpfa4aMhtoLUJW4Ckbf3PuaiemKICxkQ/jKH3teCHQHrfRXfTqopLDYzKVF65ZAdoHjfhZCv/+tKg3fP+mHGHrrZ9fecFlJ9iVlKr2rff0YhLzULOcSkJ9RqcQcudo49o344aBgV5VkfqLBKmfsjC0j4zpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by IA1PR11MB7320.namprd11.prod.outlook.com (2603:10b6:208:424::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.15; Thu, 29 Feb
 2024 10:08:03 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2%7]) with mapi id 15.20.7339.024; Thu, 29 Feb 2024
 10:08:03 +0000
Message-ID: <4b7b2711-040c-4aed-ab05-e752527cf5cb@intel.com>
Date: Thu, 29 Feb 2024 15:37:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/8] drm: Add Adaptive Sync SDP logging
Content-Language: en-US
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>
References: <20240228143823.2762595-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240228143823.2762595-3-mitulkumar.ajitkumar.golani@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240228143823.2762595-3-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0166.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::10) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|IA1PR11MB7320:EE_
X-MS-Office365-Filtering-Correlation-Id: dbc9ec60-342c-41c7-7071-08dc390e5128
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ifsFVnCkLgttowac5ccWzudgH5katub1+gwsZm1XJFIIZ194rHteIMhI+3oWkdNnv23g10hP2CvTWhT7WsvkaDkd9tN8hph9sm4I5kb0I1SpC/QSg0/u4mWk9OEJPqTNiafjON3o2Io39t5Z5y/tvpsj8/15dIpmf3JCYBuxpiMPTWeLHIiuZWfHntXzbm80S8Nlwe8a8pTsJZPJ8O09xrPv88o2v3yZCUnAEorrdYsIGmCiSsefAPbctL2TXwa9rF/DiDOCv9heSyfbIAznAVaO+KpPXZLGsQmNxdZvzpBcpy+oFUKYRkFvs0Nwp9Hd0sNvvdmcdH7WD9jPNcs2MzXdeoG4FWLjSDcUMo8IfRmvYGVlFz4bHef0cojfwmL22OqT09f1wYz7zQ4tGpwJMa1sXwk9xNbpo9BQv8VhZR19htArd2S0R2u+5bbHwG8xvHdHwe/97RHo6u9oYExOZpXXfIQlWSI0hDsgG4dvFJIWnuMpbG+YgesNd+neWKuLBuIf9CsZLUofCr4gQwNgjWsFZ6SZlPoX0+xtLn7s5oirsmKoD37myaAqa/EwoxXG5ibEXOdnu7jzyfpDLOhHFATVXRWjRyV0XYTQBUCaXCrrYihqQre7KMeYUgsHlMg7KGsGEf5cJBBV5Jp/x4dyzg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGRISXQzWFNENWhjYUlQK0xoSlFhMno0bG9xejd6ZlMzamU2d0hqd3VtbUgw?=
 =?utf-8?B?akRWbFJuaVFBZENqakxmdk5EcHBnZFZ1c3JZL29sMkNUTG0yU1o2OVVUNDdE?=
 =?utf-8?B?R0ZuNWFCNVZZRENPdlpLejRRRy9DZURNT2pSVUdwT01zakxTSTJublNsMmR6?=
 =?utf-8?B?Q2d5Q1ppMk9QMHJWREJTUzFrOHFBay9hS3BIaURiUXFjcnBzdWp6T0JuWW9N?=
 =?utf-8?B?OC9idklicmplbE4zb0VnRDVtempUOEhDR1JLYTJFZm00Z0lmRE0wUldlRjdO?=
 =?utf-8?B?L2pnWjlETXJxcFFDcHVTSkM4SEs3OVBWdlJCeStIOEM2RTd0VnBvSGRnVDlz?=
 =?utf-8?B?VlMySHQxcWZ5UGVsV3ViY2poZldJbjM2SEttSXJnUFZZOUYwd3BzdnRXSjRm?=
 =?utf-8?B?WDJZT3B4SytDV3RqYkhYclIvcDFkZGhMdVdhekVtZlpZUFVjYU5uUnZrY1JC?=
 =?utf-8?B?ZWZzYzZBN1diU1BWSUdNaGVWMTYxZmovVUcyam9RTHY2SEZyalNKa2xwY1J1?=
 =?utf-8?B?dElZTWhaWjFxZ3BkQjlkR1l2eDJHOG9icjVSVi9FODdqa08xNmUwTlNua3Vi?=
 =?utf-8?B?a1IzcG9Pdk1vOWM0WXNVQ1d5Z0FKZFg3R0VPYVdBNWl0bnJIR0xxNVZCMk9B?=
 =?utf-8?B?cEFKSHhpUHlRY00xd1VraWRWWFVCeEpNR1JvRExFallHbDRPZkpUU2VoV0p0?=
 =?utf-8?B?Q2RvVllPTGZOUWhZd2o5dHBmZXRFRTZ6cXNBWEJqRVhwZEtQeGUvOU9KNE5j?=
 =?utf-8?B?RGc0OHFuM2s0eVgvSlFHYUNYRTNwemhLSkt5UTg0VlpRVjVLazAyY3V3dVFy?=
 =?utf-8?B?OUlMUWRRanIyTmdDN3FnZkZFZmp2bkp3M1ZmcnNhRko4SzJOTTVmcEhRZTY0?=
 =?utf-8?B?V0RjSk9McEI5VUlRcUxvMHhKUWlkOGVVbnlhWXRrM3U3TW1RL3ZTQ3VWcVhW?=
 =?utf-8?B?eW90aDVlLzZtOWg0Rkl2dFU2Um5BV2FnSHJMUHY2b2I2UklPWHNvYkJ6NlE1?=
 =?utf-8?B?T2NWd1Q3VGF2elBkUWM4dVAwdFlvYk1VK0Z6TDBueFRwYlgwWmhPd2JwVXE1?=
 =?utf-8?B?MEVvaXltbjJKNkNGVU4rYlIxOVZxWGNOUVh3TTU3WnY5cWIwMVdNR3ZQMzB1?=
 =?utf-8?B?Rys1bGhQZHhwcmVnc2VwNlZ4dTZLL3ZWaldxc3FmdUZQYVc1VWZQMFlzZ1VH?=
 =?utf-8?B?Q1RuZFZKRWhCL1ArR3ZObGVWZ1NPMnBndEk4T0RGTjJ4cGpNOFpsbjdRVERz?=
 =?utf-8?B?T2FsWUtvQ0U2WlcybVp0OFJhRE8xR2ZtNUxncElFcnB2bVJyY2xMM0tyYi9o?=
 =?utf-8?B?TDlwemludlhmQ1FGUHNiMVowcGR3cVpZZWJ2K2w2ZWJwcmVFM0xYL05zNFdh?=
 =?utf-8?B?WDZGUFdZcDNlanFGK2daVlVmUlZSdDFjR1ZFNmRzMFpDSjlrR0Z1elorY053?=
 =?utf-8?B?azRUeEZKTU1lYXl1b283VURZYTZZVzg3ZnpJZjhvUkJ5SkUyUlQ1MDRtbmEx?=
 =?utf-8?B?MzhnZWNWaVNaOUhScTR4MHU4T1NaL3prcC9LMW5KTXBHSkNJM21GVlI1UEpq?=
 =?utf-8?B?dmVhY0NDN0pncnY1OUptU0s3NDRoTllNd1ZVcXNMM2V0eVVMRXREanordUNY?=
 =?utf-8?B?R1VQQk5UaHNpdXkwSnViNUxrbzVYTGVNZ1lvN3FaTlBTQkRHeTVVRmw3UUZl?=
 =?utf-8?B?MWI3bVJUNmhqUUk4aDFrOWJrNkwvMU1qaGZNT0srY29kMnZKM0lhbG92K05u?=
 =?utf-8?B?NWI3YndvWkNlcmRzYm1WSDl5WktyRUxCWVFoTmpHZm9OS2dmUTlRSFhzMzNl?=
 =?utf-8?B?TmJNeGYxWUxTdU5EY0cwa2EzUlpMZjhuK0ZRd0QwdDNQcWZnbytPRVRLL2Rs?=
 =?utf-8?B?QUcyMXdCSFlyR2l3VHg1S2U4VTRZSzk2L1ZTZUkyYVBpV3QxbStnVVJGcSs2?=
 =?utf-8?B?YmRhdCs1cFBrRGx1R2hqdDBBQjYxRElNUzJhUnIycWFvb2tGSkR4ZjBwVUtz?=
 =?utf-8?B?OW1UYTVuZzBvbHQ5dDRLYXFNZWFSczJTNHBzZFZBSVJZSmNNcjRsSUZ6M1Bj?=
 =?utf-8?B?dTJxdXJhdllMNUhkVVY3a1lveE9KSk1mc1BnY1Vmc1pjdlJqVWRiUy94Qkor?=
 =?utf-8?B?SllzMVFTbUIrTTVKMjJhMSt0ZElyN2lsRkNONTlMQ2ZKbFpLV2J1V3NBYUto?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc9ec60-342c-41c7-7071-08dc390e5128
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 10:08:03.7052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W4NEorj+gQfw+vPLs9wrsfStFiYxnapHJBpF1huYcXvONqfdeO9aYLrVWWKzgHafIrtWdn9FkmuT8nPdCaoNFgPlRUxpjuwCxM6wwCIII38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7320
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2/28/2024 8:08 PM, Mitul Golani wrote:
> Add structure representing Adaptive Sync Secondary Data Packet (AS SDP).
> Also, add Adaptive Sync SDP logging in drm_dp_helper.c to facilitate
> debugging.
>
> --v2:
> - Update logging. [Jani, Ankit]
> - Use 'as_sdp' instead of 'async' [Ankit]
> - Correct define placeholders to where they are actually used. [Jani]
> - Update members in 'as_sdp' structure to make it uniform. [Jani]
>
> --v3:
> - Added changes to dri-devel mailing list. No code changes.
>
> --v4:
> - Instead of directly using operation mode, use an enum to accommodate
> all operation modes (Ankit).
>
> --v5:
> Nit-pick changes to commit message.
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/display/drm_dp_helper.c       | 12 +++++++
>   .../drm/i915/display/intel_crtc_state_dump.c  | 12 +++++++
>   .../drm/i915/display/intel_display_types.h    |  1 +
>   include/drm/display/drm_dp.h                  |  9 +++++
>   include/drm/display/drm_dp_helper.h           | 33 +++++++++++++++++++
>   5 files changed, 67 insertions(+)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index f94c04db7187..b1459ac92aea 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2913,6 +2913,18 @@ void drm_dp_vsc_sdp_log(struct drm_printer *p, const struct drm_dp_vsc_sdp *vsc)
>   }
>   EXPORT_SYMBOL(drm_dp_vsc_sdp_log);
>   
> +void drm_dp_as_sdp_log(struct drm_printer *p, const struct drm_dp_as_sdp *as_sdp)
> +{
> +	drm_printf(p, "DP SDP: AS_SDP, revision %u, length %u\n",
> +		   as_sdp->revision, as_sdp->length);
> +	drm_printf(p, "    vtotal: %d\n", as_sdp->vtotal);
> +	drm_printf(p, "    target_rr: %d\n", as_sdp->target_rr);
> +	drm_printf(p, "    duration_incr_ms: %d\n", as_sdp->duration_incr_ms);
> +	drm_printf(p, "    duration_decr_ms: %d\n", as_sdp->duration_decr_ms);
> +	drm_printf(p, "    operation_mode: %d\n", as_sdp->mode);
> +}
> +EXPORT_SYMBOL(drm_dp_as_sdp_log);
> +
>   /**
>    * drm_dp_as_sdp_supported() - check if adaptive sync sdp is supported
>    * @aux: DisplayPort AUX channel
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> index 4bcf446c75f4..26d77c2934e8 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> @@ -60,6 +60,15 @@ intel_dump_dp_vsc_sdp(struct drm_i915_private *i915,
>   	drm_dp_vsc_sdp_log(&p, vsc);
>   }
>   
> +static void
> +intel_dump_dp_as_sdp(struct drm_i915_private *i915,
> +		     const struct drm_dp_as_sdp *as_sdp)
> +{
> +	struct drm_printer p = drm_dbg_printer(&i915->drm, DRM_UT_KMS, "AS_SDP");
> +
> +	drm_dp_as_sdp_log(&p, as_sdp);
> +}
> +
>   static void
>   intel_dump_buffer(struct drm_i915_private *i915,
>   		  const char *prefix, const u8 *buf, size_t len)
> @@ -299,6 +308,9 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
>   	if (pipe_config->infoframes.enable &
>   	    intel_hdmi_infoframe_enable(HDMI_PACKET_TYPE_GAMUT_METADATA))
>   		intel_dump_infoframe(i915, &pipe_config->infoframes.drm);
> +	if (pipe_config->infoframes.enable &
> +	    intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC))
> +		intel_dump_dp_as_sdp(i915, &pipe_config->infoframes.as_sdp);
>   	if (pipe_config->infoframes.enable &
>   	    intel_hdmi_infoframe_enable(DP_SDP_VSC))
>   		intel_dump_dp_vsc_sdp(i915, &pipe_config->infoframes.vsc);
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 8ce986fadd9a..1256730ea276 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1335,6 +1335,7 @@ struct intel_crtc_state {
>   		union hdmi_infoframe hdmi;
>   		union hdmi_infoframe drm;
>   		struct drm_dp_vsc_sdp vsc;
> +		struct drm_dp_as_sdp as_sdp;
>   	} infoframes;
>   
>   	u8 eld[MAX_ELD_BYTES];
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index 281afff6ee4e..0601b95d53db 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -1578,10 +1578,12 @@ enum drm_dp_phy {
>   #define DP_SDP_AUDIO_COPYMANAGEMENT	0x05 /* DP 1.2 */
>   #define DP_SDP_ISRC			0x06 /* DP 1.2 */
>   #define DP_SDP_VSC			0x07 /* DP 1.2 */
> +#define DP_SDP_ADAPTIVE_SYNC		0x22 /* DP 1.4 */
>   #define DP_SDP_CAMERA_GENERIC(i)	(0x08 + (i)) /* 0-7, DP 1.3 */
>   #define DP_SDP_PPS			0x10 /* DP 1.4 */
>   #define DP_SDP_VSC_EXT_VESA		0x20 /* DP 1.4 */
>   #define DP_SDP_VSC_EXT_CEA		0x21 /* DP 1.4 */
> +
>   /* 0x80+ CEA-861 infoframe types */
>   
>   #define DP_SDP_AUDIO_INFOFRAME_HB2	0x1b
> @@ -1737,4 +1739,11 @@ enum dp_content_type {
>   	DP_CONTENT_TYPE_GAME = 0x04,
>   };
>   
> +enum operation_mode {
> +	DP_AS_SDP_AVT_DYNAMIC_VTOTAL = 0x00,
> +	DP_AS_SDP_AVT_FIXED_VTOTAL = 0x01,
> +	DP_AS_SDP_FAVT_TRR_NOT_REACHED = 0x02,
> +	DP_AS_SDP_FAVT_TRR_REACHED = 0x03
> +};

We can drop the initialization here.


> +
>   #endif /* _DRM_DP_H_ */
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index 7c1aa3a703c8..7b7729488ad8 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -98,6 +98,37 @@ struct drm_dp_vsc_sdp {
>   	enum dp_content_type content_type;
>   };
>   
> +/**
> + * struct drm_dp_as_sdp - drm DP Adaptive Sync SDP
> + *
> + * This structure represents a DP AS SDP of drm
> + * It is based on DP 2.1 spec [Table 2-126:  Adaptive-Sync SDP Header Bytes] and
> + * [Table 2-127: Adaptive-Sync SDP Payload for DB0 through DB8]
> + *
> + * @sdp_type: Secondary-data packet type
> + * @revision: Revision Number
> + * @length: Number of valid data bytes
> + * @vtotal: Minimum Vertical Vtotal
> + * @target_rr: Target Refresh
> + * @duration_incr_ms: Successive frame duration increase
> + * @duration_decr_ms: Successive frame duration decrease
> + * @operation_mode: Adaptive Sync Operation Mode
> + */
> +
> +struct drm_dp_as_sdp {
> +	unsigned char sdp_type;
> +	unsigned char revision;
> +	unsigned char length;
> +	int vtotal;
> +	int target_rr;
> +	int duration_incr_ms;
> +	int duration_decr_ms;
> +	enum operation_mode mode;
> +};
> +
> +void drm_dp_as_sdp_log(struct drm_printer *p,
> +		       const struct drm_dp_as_sdp *as_sdp);
> +
>   void drm_dp_vsc_sdp_log(struct drm_printer *p, const struct drm_dp_vsc_sdp *vsc);
>   
>   bool drm_dp_vsc_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
> @@ -810,6 +841,8 @@ int drm_dp_pcon_convert_rgb_to_ycbcr(struct drm_dp_aux *aux, u8 color_spc);
>   #define DRM_DP_BW_OVERHEAD_FEC		BIT(3)
>   #define DRM_DP_BW_OVERHEAD_DSC		BIT(4)
>   
> +#define AS_SDP_OP_MODE			GENMASK(1, 0)

I think we can keep this along the enum.

Apart from the above minor things, patch LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>




> +
>   int drm_dp_bw_overhead(int lane_count, int hactive,
>   		       int dsc_slice_count,
>   		       int bpp_x16, unsigned long flags);
