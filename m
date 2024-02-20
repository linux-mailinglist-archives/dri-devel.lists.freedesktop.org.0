Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF26185B237
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 06:21:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E70B10E15E;
	Tue, 20 Feb 2024 05:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QBAr9A8P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDF010E13C;
 Tue, 20 Feb 2024 05:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708406470; x=1739942470;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Js7ByLZEY7zG1Rwj+j2wAJ9p3m4g6AFG5MsICl6F1DQ=;
 b=QBAr9A8PJ4gU6/06ZmKBRrsqneYX2y2sJC2GrM59Ye63VCfDIyJV//lC
 9hEZYaEDSdrkrqf7F1EQXosa62BfYHePUo2MIZP6Wl3+knEE5PDbHY8Y2
 I697tEIwZS8yRK295MVmgoajSq1lmgTxTBRpXryyQSJky69/Ra42mS/ar
 LZRp7fjD2T7TpxjK5VkBneKFr+ULYS1iNBblyQwYY2jbwDiop3FzTe/Tq
 Be7r2bSzjGC4qUwO1Wp6JvapTP4O+oVsszCoiaCZGSqIYSiFK/r0BXmWH
 VY2l8/QlCwxAKPGHSbiyx4NsK0vA84cS2iXt6TZNXZXv+gDyvVSYXb7TW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2638734"
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="2638734"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 21:21:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="4821791"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Feb 2024 21:21:10 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 21:21:09 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 19 Feb 2024 21:21:09 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 19 Feb 2024 21:21:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AsYhGaV44/c6sTnagEWkXZE7uXbHm7EB9HpcoJsXbimax/Tmq0jWCd4aKbJZXWAhDHUhmvopweGaVH3IHxkCOkkPyRi5ZWBpOxZLjY30WE+syDKEq7XCfYNhVFsdtb0zdRS/0lp4t0JeIVpLdDbHYpgc9oKPoNznQDe2xbSmpeeeK69YK14uUp4AJN+76NwvAY266Huh+qkcy3mXTCBhz/hePVGDo2A9UDqq/2PPdOoxaCDa1Fs/Wv+h7PsMySQlmR9FKi+mjEp/Riv0L/lmDBI9DEtkPthT0866YdtI2hYIUpnX2eA2d0jMipdiKVYN3BGopEmjxWpF7gvrk17WOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zvFnpxU/US9wcZofMbFjh/jGz0GM1GQhte4PtEnHj0=;
 b=MgURSryQ1asfQ67VhfTR+r18fd1Bh3fa8nSX2JhTClUk2kiH20/+GvnH8mvddQw6FdkBWf8sjfuejMD1nb0HphWY19goRnYkpkZzGE4SUczJ7U1pkQ/4vgSwn/3TzycsciUOIFBP0sZD2uYQguhmwVUOAhMFFL/i19c73Lq7uD30cLaACfMrP9tl5nxszFD7UyQLjtExGEZ9mz4AgYfDZ3vPyCfdx8gUa30Uon3GsD+o2XZjyOuLB/COPZl/VsxbP+wPw/hINNTjMajWBCZFqG+zF9r1vF58Pm8wbA+GBwM4Jb9aO8gY+MNBna0Pg+QvtKg33Zsupxt+mhrG4KvyqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DS7PR11MB7908.namprd11.prod.outlook.com (2603:10b6:8:ea::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.38; Tue, 20 Feb 2024 05:21:07 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2%7]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 05:21:07 +0000
Message-ID: <026ca7fd-6a84-42ce-b9ed-8f2bb5877066@intel.com>
Date: Tue, 20 Feb 2024 10:50:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm: Add Adaptive Sync SDP logging
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>
References: <20240216142024.1884258-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240216142024.1884258-3-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240216142024.1884258-3-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::17) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DS7PR11MB7908:EE_
X-MS-Office365-Filtering-Correlation-Id: ae27ddac-ac1d-4f4e-c693-08dc31d3bd45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SzVvLbUM4+/sT9VC3qxMegF5dFvMQRTaqQ/DcuY1FmWS63xW8rGWXcIAdIoqkn83GSUh1qddctoYaramLTbguJe+1vqgRiwfjElD5TrLN8AhQdZz1iSnmN5QXe7psaOWMalu0uhC3hmom6rk6BweW9aju0UJ1C+hg3UEcu8riyoK/7I4+wWnovLmVqUVSJLlL3Jw5XBTCQOkhBqXBX4kfj9CZXu6d4XMKFwqlOLLbntVB04qh6dwgwv8q9/NCVr/JAlIpeABp3BF1s1WxxstndmXN8AwOq3vupt9Tj753fi/uuNIx20AIdzuKXEmC7GPrajiBe1GsxVzA67Sbut/M1jk+kpWuqJYQBizc0fU7rj7vM30lbujv0sm2T4wdVjMoV9UPT2LK7b4hrILRFUT7IRPOTjOP7Kmw+zx9BOyo+PHtPpyWlfqIJg9DdaxHUaYqmk5fZv/aCQUektMMi3hWF5mDPa7YGk7Q7pZFQ1mSVE33zqb+v4nuLpS9CuYSd7z9I7taMfWCNMvUESwo+cviovnkFbb5tIPlx7XL19+7qQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWNKTHljckh6MHRVUkRZdzN6S3NDcTdwZHBYV25OVFhyVm1lOEtFQ3RqK3hl?=
 =?utf-8?B?a0JUSUxWREZkYWs1allranZKTXhGUWFoQUsyZFRTb3paVm5UQUdUVUcxWmha?=
 =?utf-8?B?bEtTa1NTRFMvSHVjNDJKZG51UEFmQWRMWm5iVzhxK2taZVI5Vi9KVlBYSEZs?=
 =?utf-8?B?OHdhR3E2Y3F5ZUNqa2l5N24vM1FNdlR1VGFNK2J3ZDZDUUQ0TmNGNFh5eHZY?=
 =?utf-8?B?dzJzdkFXMDRwL2tQdCtXTUhHR0VHUkpPR21pNkd6YXhPRXkrRDRPckY1ODd6?=
 =?utf-8?B?YkpMRUgweklQMEt1TlhxQy8ybWNvR21JK1doenpOenBXQjdMcS84T3AwKzNM?=
 =?utf-8?B?THBYblJ4akdsTUpYc2JTU1cxc29mMHg3Qmdqa3hrZXZ1QkxMaFZTUmhaK1l1?=
 =?utf-8?B?bTJCcVpiTWpZVks2QzJ4czl5ZXRubHR5YkZubFRQbGZ3OGRLOGRYUTdnL2l6?=
 =?utf-8?B?ZS9QSjZZRUthTFM4NkJqSFpDTEZBdlBEcExsM1ZSV0JvZUNRR0VGZG9SV2V2?=
 =?utf-8?B?ZG93OXBVN2luNlAzcnQ2cVdTSXRGdVdkTDJ4NGlNZVIvNU1LbXY0M1NGMGlm?=
 =?utf-8?B?TFYwb21HMzg4VENmVjlabGZKUzl6TjdKT2dQVkNPMmhSUVh3aXE0V2hQbUx6?=
 =?utf-8?B?OVljYmw2WTdIYjVlc0tOQlF6dERMZ2dwd1NmTFlxTTVZUTREeTFHWGpzb1d2?=
 =?utf-8?B?andlN0tCU3R5SUx2aEYvcUVqZTJXQXkzRnNvQzlCUDY4cXVTaTlQZmxHV0Nu?=
 =?utf-8?B?NlJ5elREOHBsMTlwdng3TXE3Y0pCaXdMYUR6OFFwNTFzeHVyQkxLNm9DZElO?=
 =?utf-8?B?UmlRZFZOYXZrRWhNWTRMRlYxTFg0bWhqdllROGNFRVdxT0VpYjlabmJtWU5r?=
 =?utf-8?B?NXBRZnFoR3M0aG1VL3NpRmVrQzJRbllGcDk2SndrdEVBaEpScGNieXlJWTZX?=
 =?utf-8?B?UHozcmE3WEU1NUU5RmtqWVdROUxyR2NvdmJRMk0xak9JZHlLV2FBNHB5YWRT?=
 =?utf-8?B?dmpOSlRURWJWTFNEVkFXRklDU2d5ZFgzblJXTVdCT2lsK2ZjSEFtUXZteXNG?=
 =?utf-8?B?S3BvYk9kRUl4V0RXaEJCTHJiRDlwRlFlK3ZtSG5lTUxaWE8rSEJyT3AvVnJN?=
 =?utf-8?B?R1gwamg3eHhqbVowMmJPRHlLNjU5N1NLSysxV1JKRWM3Yzg1Qk9vUEY3VjYv?=
 =?utf-8?B?S0NMV1VlM01hSDEyS1o3OG0wT1RGTTVSVUJhZUE0bnhBWWErLzhsdnZ4ZG5z?=
 =?utf-8?B?eElzV2pGRDY2dU9sc2lOZG5lcnFyRGppUEF1Szl2dlY1SWdHWjJ5UkEzbWxS?=
 =?utf-8?B?QTRNVkV3YXorTzFsNG9ERkdGM0FFVmhnMDEyZmZrTnFLZUtaLzNjNDJud2NO?=
 =?utf-8?B?Mk5WSXZQUWVCTWJlMXdpSTVsd3VHYytkU2o4N3RYMFpQMmw2K2l4Skw4TjN4?=
 =?utf-8?B?bVdydkhXaDJ4VVczdUlQbXp2V1BSL3g0ZUt3TDJjTXdPWVRYYk0rS2w0STV1?=
 =?utf-8?B?Y05mUzVnLy9scnpKZ3QwcTZMUUZES1N4L0EyamQxN0VNaE8vZm5kUmNYaDh1?=
 =?utf-8?B?cWtINjVKVy9KMTd0Q0xBWkFPYmluRS9Dcnh0c05XQ052RmtUMTEyQlUwcVdR?=
 =?utf-8?B?c0FmRmZFSXcxSFRzTTBTdFArNjRacnZlRHR4T1VjSzVNZG4rTGNzeUFiM0Ix?=
 =?utf-8?B?SUNaSFFOVEkvaUR4N1cwRUhibEhPb2RrV2RUc0pXZW5YcGdMUDBBbHpub1lL?=
 =?utf-8?B?K1V0OE5CNVFpb29RSnhIaGRoa3ZKVkdQT0JkaDVDeDJobGpVeDIyNnNDTkJO?=
 =?utf-8?B?c2NmK3hHdUNsMDlacVVlelpKSmZDRmthVTdOQjN5VklRb1lINzBEcmlIVzBG?=
 =?utf-8?B?TjBQYTczREs2V2J5UDNXZU5uaUtmdmFzVzBYM0haei9QOG4zdWd2MlpKRnly?=
 =?utf-8?B?aGR5Q1k1ZDd6SUJ4dzhNYU9pTnpzYzR6TVU1a042RG1SN09Rb1pOeFRlbkhh?=
 =?utf-8?B?ZWNKTVMzV0ZXN2dBU3ZMbDFmUG1pOE9uQlZ6enM1RlFWWDRNTHZQVXROZmYw?=
 =?utf-8?B?Mk5lTmV4NkMyZU9oMyswcWIyZzFKbFlURTRzTUNVWkxtN0VJWnlSaEc2NEVY?=
 =?utf-8?B?OVEyVE5MTXdwUld3SXNIdnh6WHg2OEtHbjhDMWMrbnBNMitMcFVvcEJ1ek9R?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae27ddac-ac1d-4f4e-c693-08dc31d3bd45
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 05:21:07.8326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9+8bk7ZGfwHJYXUj7Gjcnhdy4XICZAp8sBl6rbBBXI4Wwxu9gIdh71g2p40TZAo5STQbw8t8jZzTp1miIW4+0MiExCOi5d7uLOewXdZvbkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7908
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


On 2/16/2024 7:50 PM, Mitul Golani wrote:
> Add structure representing Adaptive Sync Secondary Data
> Packet (AS SDP). Also, add Adaptive Sync SDP logging in
> drm_dp_helper.c to facilitate debugging.
>
> --v2:
> - Update logging. [Jani, Ankit]
> - use as_sdp instead of async [Ankit]
> - Correct define placeholders to where it is being actually used. [Jani]
> - Update members in as_sdp structure and make it uniform. [Jani]
>
> --v3:
> - Add changes dri-devel mail list. No code changes.
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/display/drm_dp_helper.c       | 12 ++++++++
>   .../drm/i915/display/intel_crtc_state_dump.c  | 12 ++++++++
>   .../drm/i915/display/intel_display_types.h    |  1 +
>   include/drm/display/drm_dp.h                  |  2 ++
>   include/drm/display/drm_dp_helper.h           | 30 +++++++++++++++++++
>   5 files changed, 57 insertions(+)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 81c5507928f5..5911b20de2ea 100644
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
> +	drm_printf(p, "	vtotal: %d\n", as_sdp->vtotal);
> +	drm_printf(p, "    target_rr: %d\n", as_sdp->target_rr);
> +	drm_printf(p, "    duration_incr_ms: %d\n", as_sdp->duration_incr_ms);
> +	drm_printf(p, "    duration_decr_ms: %d\n", as_sdp->duration_decr_ms);
> +	drm_printf(p, "    operation_mode: %d\n", as_sdp->operation_mode);
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
> index 0d4012097db1..a6991bc3f07b 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1332,6 +1332,7 @@ struct intel_crtc_state {
>   		union hdmi_infoframe hdmi;
>   		union hdmi_infoframe drm;
>   		struct drm_dp_vsc_sdp vsc;
> +		struct drm_dp_as_sdp as_sdp;
>   	} infoframes;
>   
>   	u8 eld[MAX_ELD_BYTES];
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index 281afff6ee4e..af6790fb4791 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -1578,10 +1578,12 @@ enum drm_dp_phy {
>   #define DP_SDP_AUDIO_COPYMANAGEMENT	0x05 /* DP 1.2 */
>   #define DP_SDP_ISRC			0x06 /* DP 1.2 */
>   #define DP_SDP_VSC			0x07 /* DP 1.2 */
> +#define DP_SDP_ADAPTIVE_SYNC    0x22 /* DP 1.4 */
>   #define DP_SDP_CAMERA_GENERIC(i)	(0x08 + (i)) /* 0-7, DP 1.3 */
>   #define DP_SDP_PPS			0x10 /* DP 1.4 */
>   #define DP_SDP_VSC_EXT_VESA		0x20 /* DP 1.4 */
>   #define DP_SDP_VSC_EXT_CEA		0x21 /* DP 1.4 */
> +
>   /* 0x80+ CEA-861 infoframe types */
>   
>   #define DP_SDP_AUDIO_INFOFRAME_HB2	0x1b
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index a0356721de0f..8a692a86d8d6 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -98,6 +98,36 @@ struct drm_dp_vsc_sdp {
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
> + * @sdp_type: secondary-data packet type
> + * @length: number of valid data bytes
> + * @vmin: minimum vtotal
> + * @vmax: maximum vtotal
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
> +	int operation_mode;

I think this should be enum, to represent different AVT and FAVT modes.

Regards,

Ankit


> +};
> +
> +void drm_dp_as_sdp_log(struct drm_printer *p,
> +		       const struct drm_dp_as_sdp *as_sdp);
> +
>   void drm_dp_vsc_sdp_log(struct drm_printer *p, const struct drm_dp_vsc_sdp *vsc);
>   
>   bool drm_dp_as_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
