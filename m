Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DA686C6E9
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 11:29:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E5E10E374;
	Thu, 29 Feb 2024 10:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NLNZYlTh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 918B710E3F0;
 Thu, 29 Feb 2024 10:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709202557; x=1740738557;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tfPYrFpMfMRPe9CKDuVE6zyAjX9q+CuoZJ2Q/XNlP68=;
 b=NLNZYlThqilwtVhItZOhkfbHI/Kw48n074WV0XOK57YiX76ozAxXSL0T
 nAq0qEX27NSL+69nMOnZSrHcaAhgF1gQXvHN4/0UEQKxf0MbHmidcuFcP
 xxrpDIR2JiXel2xK6Ul5kRZFW0s0EtosiaVSADMpSFcOpRIQboCWiV+Lq
 yJrT+kazzbXLzUv8iTgpc1PXiRRzDOp8TMpUbiiEOeMKEaYuSkBukjqr8
 yAzuyNT3i/GmmMCmbb4+NeHqoQLVpCiUDkQeY6quCYP2vYphffR0rCBdE
 KUBhEuioHB0eL2w2Q1T5rLUPKLug9DqVK0lXyyGdvdgVXAdlhh0WEGxnG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="6607135"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="6607135"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 02:28:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7893463"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 02:28:52 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 02:28:52 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 02:28:52 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 02:28:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UpJ4zlLn1PX9HA3keK4OTRFT5heeA5G0Zy4n4BwO1W+QG/qfrbkiDPGfehI0TqrQLgEqV6zRunlscdei3CX8yCvsxCcyY0Rq7UClPxFtS4vaV3Wvuimw9iPIyhzMmy/xHQPaRr27/J0BXhP/PneFpA5GH6Bd40BSEg6c+atwevOKRePo5HkUNyoaicnrawEFMx71arGQQX3zAkLpUfJoAFMXMViMdyVJmFemgVw7QXa9CtgY+io8+zCyFFiV2q5VI1E+w5ilHlhts6eGQ2dwL6y/Cju06GrX0zB8YMjWSLxd03ZOcDSPcNv9JJU/cY8++mAAFpwIKxv6RKeQ2zmolw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jaUzVB1GCI3q9BsBjxVHz7d/OpO+ILFUpvE/FDQDK6o=;
 b=UzLX6c6qEOy27aoRQf3yT7A+QnMrx/NHgNSY5j21kpGJd2zrt3l1VVKv1ah0B+b/vh061hF5VRE/M45m0DEPmVBBQv5gTE8bgPmBMguiz7+3x7cQu+Ff4bEi+3ZGM3P8e0dCFelTuXxCGLUwLXY1A4JjraXlr0JoI5Ka1meQR+rdwPx5DBEcZq7+Dlal2kiM/HISJfVD+dSMp2dkpMwP4g/HoDs/ZCZvds7n8LBSQ+F//w5d/u6cb6Qo79dKWaZeIHEq8oA/XFgwWgFhYMbATLJS0oeADWyqf6xOdFHpApCxtSiCaDZ6LonpugH0JVXso5A254Rw15uzdvRFURAXdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CY8PR11MB7194.namprd11.prod.outlook.com (2603:10b6:930:92::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Thu, 29 Feb
 2024 10:28:46 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2%7]) with mapi id 15.20.7339.024; Thu, 29 Feb 2024
 10:28:46 +0000
Message-ID: <09333cb9-779a-46f5-961d-3b185f5ccef2@intel.com>
Date: Thu, 29 Feb 2024 15:58:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/8] drm/i915/dp: Add Read/Write support for Adaptive
 Sync SDP
Content-Language: en-US
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>
References: <20240228143823.2762595-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240228143823.2762595-4-mitulkumar.ajitkumar.golani@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240228143823.2762595-4-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0036.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::11) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CY8PR11MB7194:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a8ead30-a7de-4a7b-5032-08dc391135e7
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Am8BCR9kL0YV54GFgpgehixnyn6q8hWByo796aTIoCfhSXk5QHXpjzzbX7gqvIrkUtl/ffpxB2Se6g2U+MF5w92ZIICP1Co6HU3QJXmu+HCqoIVy3d8QH/ahOIZTGPpGw+UXuuuaJF8xXZlfW/xAS2d2o0Ra5IfcxNVsDyKiQTx2PSf9Aq/JIf+5yjge5GPGFnTbu5XABwzVbFIx/InNLrh2EF+j3QD2mpuc2Q8SMoj+jjimubHx8EHmaudcPODIxQhrtNvLmL6Dn/LJjjRZ+ywJXUgYuvlIt2nIkofd4XkVqjQokhwqJhVOA8htDBMJ6iQ04jRKDgcwlUPPAXiEM/rMKg3mdkQO/mr/L5ZUHrSAahgNdTrK9l4fWq26ncMLhhjCKJwL5jO/VpDAFrDpbMrLiFp2XizqM8Mz2Sv3QDOqO1ZH5RV7J8l0+h8ZbqTyZPvwUCpDOIEC6O+nrO93QbuqZIWAqimbv8rhHydVGLHAkkdJo7lenLQPKoHpkq7hE5JT0+XjnIMFTuMmXflIIaEYy6Jz2QJYbGv0YTqmJXmEuf+Cn7Co6weYj4IPwa2lxNqhndUpHvpsnz3StPGsZFiAaYriDnN6jvwm3apLRbFGOYFUOgTqN5O2tMjI6nMA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajJiMnVoMGd4eVFuUFNtbTJtWUd2NXB1OFZMWElCUWgzUzR1VnBKWlFBZHhY?=
 =?utf-8?B?aWpQSjJQUGdtYnBiLzQvbHc4bVJSa1pONFJFWE5GMnZTaXNjUW9DMnFMOGU1?=
 =?utf-8?B?UnlTOXd1eVEraExjWUUwTjVUUUFCdFV1aWN2NGdlaHhtRWFZcG84bmNWYm5P?=
 =?utf-8?B?dzV3Q1MvbXdVci9lWHFSdktaVVY0SUJ4bWcxVnZmTWgvQ2lDQ0k3MS9hcUh0?=
 =?utf-8?B?LzA0SmZ1ekJWMWpGdUVwcVBOb1JmSlNFU3Z3Ykhxc3FjRit6M09FdTk0Rmt1?=
 =?utf-8?B?TjJLZTIraWU2MnZPRlhkYy9xaEZYTFVIcTFDdnVIYTVmMTc1clNLM0NvaFlS?=
 =?utf-8?B?ZHk2VEd2WVhTbkFWeW1jOHZLS01HKzF4Nk5NSU9lTEZHOGJyRGF5ejZKeDhD?=
 =?utf-8?B?bDJ1bTh4KzhwQ1BQRW5SaUhIUVo1SFNJMUV5QlBQOUM4Q3R3RVJpdkRmRkpw?=
 =?utf-8?B?c3Z5M3AyVXJhSU1mWWRRNFNVZkJiaHltVHQ0YUt6TVBQemRFUDVWNVB4b2Zh?=
 =?utf-8?B?MVZyYVJtZFhGOUJ1dHVUb3BJWVRadU4ybnlCbUh4STlzT3ZsbDZYb1kwSDdQ?=
 =?utf-8?B?a0hSRmlGamVkU1ZBTzFXOFpYNkowMFZQVmk5VWkyMmNWbm56NkRZTGlmM2sy?=
 =?utf-8?B?b0FuWDJBSTA1NzBrTlRVOEp4RWFzbkxWT2tndVl0NFRub1NnMnQzY2xhdUM2?=
 =?utf-8?B?aUVnZ1BKb3YxVFlkN0doS1dVSXpjbk5XdFZRWmtlK28rK1MzeFZpQ1BoR05k?=
 =?utf-8?B?VUp3MjhGRGRYczBwSkhDL2UzMGJuSS9teVkxUFVBWDV0OGRXN1ptNVA1M0l5?=
 =?utf-8?B?NWFLbzdQSFpWQnFWc1JEU25NQWVBMDlEMnE1dWQzZUl3RU9wZE9FSVNldkxG?=
 =?utf-8?B?TjJxRVF2OWZVMHRNZnlJc2lUb2tMNFFEQUJQZzNaNFdYYnUxN2RjRWVHdE9G?=
 =?utf-8?B?UTFSTnBQUlUvWFV3b0VPR20rMXN0SHRVNFRldlI5QlVqc3ZkRDBZZFdUdFYy?=
 =?utf-8?B?dVRhSUJYREJaNGR4NnN6akZJc0d6eHBJMkhRV3RrL0ZDVm9NeGZSR25yOUJJ?=
 =?utf-8?B?NDJMRllwTjU1UjdnVmhLQUduR3liNHlzdmVOeURXelcxaVN3VnJEMDVkMGxP?=
 =?utf-8?B?d0EwOTdHSW5HQkdSRkhCNVpTSkJLZWlVWEJTNDJTckwzaWpCTGRpMXE1allS?=
 =?utf-8?B?QlIxRnpPMVh0anZTcTVtUHRKVmdoS1NxYTNDR0RWUVh1Z244OXhUUjZyS1FI?=
 =?utf-8?B?ekQ0YzZZMFlmTkF3NjB1L3IraVd4ei9WK1ZLcmMwTFE5UEIzMlN3THJHWW84?=
 =?utf-8?B?U3ZHV3VHbm5vRXV5anZMT3lYemd1ajUvaTNqRWpHS3BNZk0rY1J1SC9FYlk0?=
 =?utf-8?B?TThGQkFlUUk3RUJrWUcvR0tRdnVtWUloU0toNWIybC9YaFJJWGFkMnl2VDRF?=
 =?utf-8?B?ZTBJekgyL09HaklpQmdxc2Mxc1FXSWNBUXpzRi8vS3BpTEtFa1NkWWg1eUlY?=
 =?utf-8?B?Q05lNXNoUjJFd1pEd2tnV0lkK1dmMUxWWG1XWkt5M1BCenNFU3VtNmFyZ2pk?=
 =?utf-8?B?UkdaalpEUXU4R2JINHZZVGM3T3NsZlQraW9IMHBiQjlIYnJsOTZJNG1wMGtQ?=
 =?utf-8?B?WGlLUHdSdGVwNGU4OVlQcXZrWWYxUmlYQ3pNWmpsbmF0cS8zNnVKV29tS1Fp?=
 =?utf-8?B?V0ZOamZOVHh1NUtTbHJiaHBNYWRwdlZyN2dBUG1JRlU5Z2VUTjVLOWNqODZw?=
 =?utf-8?B?eEdUVmdjcUtCdnJ4QXNnRURGejVrNU1FQ21rZ1FVd2xBd25IMk9uOUJEdDhS?=
 =?utf-8?B?ZlFSc2krSm5UQXVGcVZ2ckpWK00wTXd5QkNUR1VkVWlYcTZrZzRjWFI3ckpK?=
 =?utf-8?B?SnB3L0l4RlM0bEtmZ3kyWTk4QXVpVU8wdld1NUg5OGtjTlVLc0tzS25GSUUr?=
 =?utf-8?B?aDUvWXdJV3NBN3gyR3M2T2hmQ1BaV2IzdlJZOG9MSyt4M2RkKy95Z1BmSEVi?=
 =?utf-8?B?M3ZtQnRPc3VpRUxlb1M5MWRGek9zNzkxQmFTM2RjNU1DekFoREtmVUxoOEtn?=
 =?utf-8?B?NzA2U1dBWlR1cEZzK2ovYWRkaXp4L2I5SDMrNnJQVHc1VnNPRjNEWmU4L2Vw?=
 =?utf-8?B?dmtlcHZCN2dVTFFPZHNBMXRibk5yaFovSkNYMWF4bUM4ZEQ2QnQ1MS9lc0h5?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a8ead30-a7de-4a7b-5032-08dc391135e7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 10:28:46.2587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XstRd1TbVVO1u1bC8DjOSnk7kZFYZlooWbUb9zIpDd1BqDoJ7eHVc4gRl+SV3FCL3TdAcJihKPaIfMJtpMAG1Msz1z+YnN0RDlz/2lmEQ3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7194
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
> Add the necessary structures and functions to handle reading and
> unpacking Adaptive Sync Secondary Data Packets. Also add support
> to write and pack AS SDP.
>
> --v2:
> - Correct use of REG_BIT and REG_GENMASK. [Jani]
> - Use as_sdp instead of async. [Jani]
> - Remove unrelated comments and changes. [Jani]
> - Correct code indent. [Jani]
>
> --v3:
> - Update definition names for AS SDP which are starting from
> HSW, as these defines are applicable for ADLP+.(Ankit)
>
> --v4:
> - Remove as_sdp_mode from crtc_state.
> - Drop metadata keyword.
> - For consistency, update ADL_ prefix or post fix as required.
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_dp.c   | 88 ++++++++++++++++++++++-
>   drivers/gpu/drm/i915/display/intel_hdmi.c | 12 +++-
>   drivers/gpu/drm/i915/i915_reg.h           |  8 +++
>   include/drm/display/drm_dp_helper.h       |  1 +
>   4 files changed, 106 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index e13121dc3a03..e5377cdc71c6 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4089,6 +4089,32 @@ intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
>   	return false;
>   }
>   
> +static ssize_t intel_dp_as_sdp_pack(const struct drm_dp_as_sdp *as_sdp,
> +				    struct dp_sdp *sdp, size_t size)
> +{
> +	size_t length = sizeof(struct dp_sdp);
> +
> +	if (size < length)
> +		return -ENOSPC;
> +
> +	memset(sdp, 0, size);
> +
> +	/* Prepare AS (Adaptive Sync) SDP Header */
> +	sdp->sdp_header.HB0 = 0;
> +	sdp->sdp_header.HB1 = as_sdp->sdp_type;
> +	sdp->sdp_header.HB2 = 0x02;
> +	sdp->sdp_header.HB3 = as_sdp->length;
> +
> +	/* Fill AS (Adaptive Sync) SDP Payload */
> +	sdp->db[0] = as_sdp->mode;
> +	sdp->db[1] = as_sdp->vtotal & 0xFF;
> +	sdp->db[2] = (as_sdp->vtotal >> 8) & 0xFF;
> +	sdp->db[3] = as_sdp->target_rr;
> +	sdp->db[4] = (as_sdp->target_rr >> 8) & 0x3;
> +
> +	return length;
> +}
> +
>   static ssize_t
>   intel_dp_hdr_metadata_infoframe_sdp_pack(struct drm_i915_private *i915,
>   					 const struct hdmi_drm_infoframe *drm_infoframe,
> @@ -4188,6 +4214,10 @@ static void intel_write_dp_sdp(struct intel_encoder *encoder,
>   							       &crtc_state->infoframes.drm.drm,
>   							       &sdp, sizeof(sdp));
>   		break;
> +	case DP_SDP_ADAPTIVE_SYNC:
> +		len = intel_dp_as_sdp_pack(&crtc_state->infoframes.as_sdp, &sdp,
> +					   sizeof(sdp));
> +		break;
>   	default:
>   		MISSING_CASE(type);
>   		return;
> @@ -4208,7 +4238,8 @@ void intel_dp_set_infoframes(struct intel_encoder *encoder,
>   	i915_reg_t reg = HSW_TVIDEO_DIP_CTL(crtc_state->cpu_transcoder);
>   	u32 dip_enable = VIDEO_DIP_ENABLE_AVI_HSW | VIDEO_DIP_ENABLE_GCP_HSW |
>   			 VIDEO_DIP_ENABLE_VS_HSW | VIDEO_DIP_ENABLE_GMP_HSW |
> -			 VIDEO_DIP_ENABLE_SPD_HSW | VIDEO_DIP_ENABLE_DRM_GLK;
> +			 VIDEO_DIP_ENABLE_SPD_HSW | VIDEO_DIP_ENABLE_DRM_GLK |
> +			 VIDEO_DIP_ENABLE_AS_ADL;
>   	u32 val = intel_de_read(dev_priv, reg) & ~dip_enable;
>   
>   	/* TODO: Sanitize DSC enabling wrt. intel_dsc_dp_pps_write(). */
> @@ -4230,6 +4261,36 @@ void intel_dp_set_infoframes(struct intel_encoder *encoder,
>   	intel_write_dp_sdp(encoder, crtc_state, HDMI_PACKET_TYPE_GAMUT_METADATA);
>   }
>   
> +static
> +int intel_dp_as_sdp_unpack(struct drm_dp_as_sdp *as_sdp,
> +			   const void *buffer, size_t size)
> +{
> +	const struct dp_sdp *sdp = buffer;
> +
> +	if (size < sizeof(struct dp_sdp))
> +		return -EINVAL;
> +
> +	memset(as_sdp, 0, sizeof(*as_sdp));
> +
> +	if (sdp->sdp_header.HB0 != 0)
> +		return -EINVAL;
> +
> +	if (sdp->sdp_header.HB1 != DP_SDP_ADAPTIVE_SYNC)
> +		return -EINVAL;
> +
> +	if (sdp->sdp_header.HB2 != 0x02)
> +		return -EINVAL;
> +
> +	if ((sdp->sdp_header.HB3 & 0x3F) != 9)
> +		return -EINVAL;
> +
> +	as_sdp->mode = sdp->db[0] & AS_SDP_OP_MODE;
> +	as_sdp->vtotal = ((u64)sdp->db[2] << 32) | (u64)sdp->db[1];
> +	as_sdp->target_rr = (u64)sdp->db[3] | ((u64)sdp->db[4] & 0x3);
> +
> +	return 0;
> +}
> +
>   static int intel_dp_vsc_sdp_unpack(struct drm_dp_vsc_sdp *vsc,
>   				   const void *buffer, size_t size)
>   {
> @@ -4300,6 +4361,27 @@ static int intel_dp_vsc_sdp_unpack(struct drm_dp_vsc_sdp *vsc,
>   	return 0;
>   }
>   
> +static int
> +intel_read_dp_infoframe_as_sdp(struct intel_encoder *encoder,
> +					struct intel_crtc_state *crtc_state,
> +					struct drm_dp_as_sdp *as_sdp)
> +{
> +	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
> +	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
> +	unsigned int type = DP_SDP_ADAPTIVE_SYNC;
> +	struct dp_sdp sdp = {};
> +	int ret;
> +

Check if AS_SDP bit is set in crtc_state->infoframes.enable. If not return.

With this check we dont need to explicitly check if dp_as_sdp is 
supported before reading in last patch#8


> +	dig_port->read_infoframe(encoder, crtc_state, type, &sdp,
> +				 sizeof(sdp));
> +
> +	ret = intel_dp_as_sdp_unpack(as_sdp, &sdp, sizeof(sdp));
> +	if (ret)
> +		drm_dbg_kms(&dev_priv->drm, "Failed to unpack DP AS SDP\n");
> +
> +	return ret;
> +}
> +
>   static int
>   intel_dp_hdr_metadata_infoframe_sdp_unpack(struct hdmi_drm_infoframe *drm_infoframe,
>   					   const void *buffer, size_t size)
> @@ -4406,6 +4488,10 @@ void intel_read_dp_sdp(struct intel_encoder *encoder,
>   		intel_read_dp_hdr_metadata_infoframe_sdp(encoder, crtc_state,
>   							 &crtc_state->infoframes.drm.drm);
>   		break;
> +	case DP_SDP_ADAPTIVE_SYNC:
> +		intel_read_dp_infoframe_as_sdp(encoder, crtc_state,
> +							&crtc_state->infoframes.as_sdp);
> +		break;
>   	default:
>   		MISSING_CASE(type);
>   		break;
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 90d2236fede3..300a2bab9885 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -137,6 +137,8 @@ static u32 hsw_infoframe_enable(unsigned int type)
>   		return VIDEO_DIP_ENABLE_GMP_HSW;
>   	case DP_SDP_VSC:
>   		return VIDEO_DIP_ENABLE_VSC_HSW;
> +	case DP_SDP_ADAPTIVE_SYNC:
> +		return VIDEO_DIP_ENABLE_AS_ADL;
>   	case DP_SDP_PPS:
>   		return VDIP_ENABLE_PPS;
>   	case HDMI_INFOFRAME_TYPE_AVI:
> @@ -164,6 +166,8 @@ hsw_dip_data_reg(struct drm_i915_private *dev_priv,
>   		return HSW_TVIDEO_DIP_GMP_DATA(cpu_transcoder, i);
>   	case DP_SDP_VSC:
>   		return HSW_TVIDEO_DIP_VSC_DATA(cpu_transcoder, i);
> +	case DP_SDP_ADAPTIVE_SYNC:
> +		return ADL_TVIDEO_DIP_AS_SDP_DATA(cpu_transcoder, i);
>   	case DP_SDP_PPS:
>   		return ICL_VIDEO_DIP_PPS_DATA(cpu_transcoder, i);
>   	case HDMI_INFOFRAME_TYPE_AVI:
> @@ -186,6 +190,8 @@ static int hsw_dip_data_size(struct drm_i915_private *dev_priv,
>   	switch (type) {
>   	case DP_SDP_VSC:
>   		return VIDEO_DIP_VSC_DATA_SIZE;
> +	case DP_SDP_ADAPTIVE_SYNC:
> +		return VIDEO_DIP_ASYNC_DATA_SIZE;
>   	case DP_SDP_PPS:
>   		return VIDEO_DIP_PPS_DATA_SIZE;
>   	case HDMI_PACKET_TYPE_GAMUT_METADATA:
> @@ -558,7 +564,8 @@ static u32 hsw_infoframes_enabled(struct intel_encoder *encoder,
>   
>   	mask = (VIDEO_DIP_ENABLE_VSC_HSW | VIDEO_DIP_ENABLE_AVI_HSW |
>   		VIDEO_DIP_ENABLE_GCP_HSW | VIDEO_DIP_ENABLE_VS_HSW |
> -		VIDEO_DIP_ENABLE_GMP_HSW | VIDEO_DIP_ENABLE_SPD_HSW);
> +		VIDEO_DIP_ENABLE_GMP_HSW | VIDEO_DIP_ENABLE_SPD_HSW |
> +		VIDEO_DIP_ENABLE_AS_ADL);

Check for HAS_AS_SDP() before setting this bit.


>   
>   	if (DISPLAY_VER(dev_priv) >= 10)
>   		mask |= VIDEO_DIP_ENABLE_DRM_GLK;
> @@ -570,6 +577,7 @@ static const u8 infoframe_type_to_idx[] = {
>   	HDMI_PACKET_TYPE_GENERAL_CONTROL,
>   	HDMI_PACKET_TYPE_GAMUT_METADATA,
>   	DP_SDP_VSC,
> +	DP_SDP_ADAPTIVE_SYNC,
>   	HDMI_INFOFRAME_TYPE_AVI,
>   	HDMI_INFOFRAME_TYPE_SPD,
>   	HDMI_INFOFRAME_TYPE_VENDOR,
> @@ -1212,7 +1220,7 @@ static void hsw_set_infoframes(struct intel_encoder *encoder,
>   	val &= ~(VIDEO_DIP_ENABLE_VSC_HSW | VIDEO_DIP_ENABLE_AVI_HSW |
>   		 VIDEO_DIP_ENABLE_GCP_HSW | VIDEO_DIP_ENABLE_VS_HSW |
>   		 VIDEO_DIP_ENABLE_GMP_HSW | VIDEO_DIP_ENABLE_SPD_HSW |
> -		 VIDEO_DIP_ENABLE_DRM_GLK);
> +		 VIDEO_DIP_ENABLE_DRM_GLK | VIDEO_DIP_ENABLE_AS_ADL);
>   
>   	if (!enable) {
>   		intel_de_write(dev_priv, reg, val);
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index e00557e1a57f..dce276236707 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -2312,6 +2312,7 @@
>    * (Haswell and newer) to see which VIDEO_DIP_DATA byte corresponds to each byte
>    * of the infoframe structure specified by CEA-861. */
>   #define   VIDEO_DIP_DATA_SIZE	32
> +#define   VIDEO_DIP_ASYNC_DATA_SIZE	36
>   #define   VIDEO_DIP_GMP_DATA_SIZE	36
>   #define   VIDEO_DIP_VSC_DATA_SIZE	36
>   #define   VIDEO_DIP_PPS_DATA_SIZE	132
> @@ -2350,6 +2351,8 @@
>   #define   VIDEO_DIP_ENABLE_VS_HSW	(1 << 8)
>   #define   VIDEO_DIP_ENABLE_GMP_HSW	(1 << 4)
>   #define   VIDEO_DIP_ENABLE_SPD_HSW	(1 << 0)
> +/* ADL and later: */
> +#define   VIDEO_DIP_ENABLE_AS_ADL	REG_BIT(23)
>   
>   /* Panel fitting */
>   #define PFIT_CONTROL	_MMIO(DISPLAY_MMIO_BASE(dev_priv) + 0x61230)
> @@ -5040,6 +5043,7 @@
>   #define _HSW_VIDEO_DIP_SPD_DATA_A	0x602A0
>   #define _HSW_VIDEO_DIP_GMP_DATA_A	0x602E0
>   #define _HSW_VIDEO_DIP_VSC_DATA_A	0x60320
> +#define	_ADL_VIDEO_DIP_AS_DATA_A	0x60484
>   #define _GLK_VIDEO_DIP_DRM_DATA_A	0x60440
>   #define _HSW_VIDEO_DIP_AVI_ECC_A	0x60240
>   #define _HSW_VIDEO_DIP_VS_ECC_A		0x60280
> @@ -5054,6 +5058,7 @@
>   #define _HSW_VIDEO_DIP_SPD_DATA_B	0x612A0
>   #define _HSW_VIDEO_DIP_GMP_DATA_B	0x612E0
>   #define _HSW_VIDEO_DIP_VSC_DATA_B	0x61320
> +#define _ADL_VIDEO_DIP_AS_DATA_B	0x61484
>   #define _GLK_VIDEO_DIP_DRM_DATA_B	0x61440
>   #define _HSW_VIDEO_DIP_BVI_ECC_B	0x61240
>   #define _HSW_VIDEO_DIP_VS_ECC_B		0x61280
> @@ -5083,6 +5088,9 @@
>   #define GLK_TVIDEO_DIP_DRM_DATA(trans, i)	_MMIO_TRANS2(trans, _GLK_VIDEO_DIP_DRM_DATA_A + (i) * 4)
>   #define ICL_VIDEO_DIP_PPS_DATA(trans, i)	_MMIO_TRANS2(trans, _ICL_VIDEO_DIP_PPS_DATA_A + (i) * 4)
>   #define ICL_VIDEO_DIP_PPS_ECC(trans, i)		_MMIO_TRANS2(trans, _ICL_VIDEO_DIP_PPS_ECC_A + (i) * 4)
> +/*ADLP and later: */
> +#define ADL_TVIDEO_DIP_AS_SDP_DATA(trans, i)	_MMIO_TRANS2(trans,\
> +							     _ADL_VIDEO_DIP_AS_DATA_A + (i) * 4)
>   
>   #define _HSW_STEREO_3D_CTL_A		0x70020
>   #define   S3D_ENABLE			(1 << 31)
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index 7b7729488ad8..cfde18f6613c 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -132,6 +132,7 @@ void drm_dp_as_sdp_log(struct drm_printer *p,
>   void drm_dp_vsc_sdp_log(struct drm_printer *p, const struct drm_dp_vsc_sdp *vsc);
>   
>   bool drm_dp_vsc_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
> +

This addition of extra line doesnt belong to this patch.


Regards,

Ankit


>   bool drm_dp_as_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
>   
>   int drm_dp_psr_setup_time(const u8 psr_cap[EDP_PSR_RECEIVER_CAP_SIZE]);
