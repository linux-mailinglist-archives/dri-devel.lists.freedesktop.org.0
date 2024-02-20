Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 900B785B2E4
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 07:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E50310E11A;
	Tue, 20 Feb 2024 06:27:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fBYiw5im";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D40610E162;
 Tue, 20 Feb 2024 06:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708410456; x=1739946456;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wXcvy/AkKbUnrqFX7Mq5tbb6inYuE/gVQI6nm651WJQ=;
 b=fBYiw5imjyuAmJWyZoEVMMCY1zXFEUo2+KZxY+PFsICHNvADpN09IDKe
 Wu7aaONyhLR0dafQwSbD+HqC5pWPXpMLMDQ+VMJ7T/2kkkLDrjPht0Ffx
 +eO6hSgaqSLmBLlJ04EwZz7FW97F8tZQGp7WSBKzm1oXGBMlmC40AfJap
 gNnzBzPKLuXbD0DDM2L0suJWpgA3IMiZZ8Ij2H4SiXnYdHbmCeucwKoX8
 oppT61eTElus8ndoxA0geE9C37SVGAJQDEjETWjGjz8gI+4YA98wsc0W8
 s9XUZPTE7FPpWKzXg9tZpzxFO704F1FJplXOpwMN/XtWse2wJgQMYchWo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2367277"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2367277"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 22:27:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="4679930"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Feb 2024 22:27:35 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 22:27:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 19 Feb 2024 22:27:34 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 19 Feb 2024 22:27:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ldZprdNCWn+BetFGPlfPIFVCUhURpDrk811gVjX9ehOm37faZKqjuHsxfLF6Y4UVNXhqFcUjxX7PCP39PmEbsXKdpHDye5SWPa7Mp2giSbqGeQXwCE0j8Fw5CPnFjFxKqMaZjnNi4/AKC1+d6PhOTOXMd342D6ZfZy16j4BNGUFxoytnNoJlKN9h2KoZpicX5Yx3bw8QEBEEpCkswfEyv91oPVfoMfwomh8rJMgGCC1MwdIlpuwOj8wCO5oxy/XBAouN5uKU+r6NblFYqIO9TX+1zVzxc2F0Obc3PSY0jcnYn85T8LFObiYnLLiMSeUYr9mNwLz1TTYVuM22q3PXLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7uOqaowD8UORsuUHWLWK1T0q3qB7aZYiZPokED0gSg=;
 b=dXhJaT7fI2Pm0hPWUgwv1yTUW+kEeaIh09e5RifuUzImqMCnuSSN2PBx21XBTuS+RqBYzq3A/ELfEW3qxKtEWUOGOlvBzJ5BNZZSnV7wIJEF9kir4BWpaGOL/wX/Jb9uaGEsHBazTP49ob5KZ7oVjDzRq5HJY3yc4oJLyoxGy2GSAo2Lmpml3U69TxoN305x2uDANS0NWuNOqBuSqnE0g4eUagGIb4XIQD8s2cgG9w71gdvymi5UDjJeDwNLAPEui/Fw/fW4TZANetnqiHmUS73wnJdGJpq+c3aze6U9PeNHMYBKDvxtRNpsok2nveU4ZB+y3YjhCnfLukYGkkpreg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CH0PR11MB5395.namprd11.prod.outlook.com (2603:10b6:610:ba::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Tue, 20 Feb
 2024 06:27:31 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2%7]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 06:27:31 +0000
Message-ID: <377bd642-7dca-456b-adca-05876c361e07@intel.com>
Date: Tue, 20 Feb 2024 11:57:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/i915/display: Compute vrr_vsync params
Content-Language: en-US
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>
References: <20240216142024.1884258-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240216142024.1884258-6-mitulkumar.ajitkumar.golani@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240216142024.1884258-6-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::13) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CH0PR11MB5395:EE_
X-MS-Office365-Filtering-Correlation-Id: 01906ff7-ab16-419c-902d-08dc31dd0472
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kvrNJ77GepZx20VgmXBiCrv0HodqCuk6Yz5Drccfg14KpCAHZGYypyDnliMmoee6pGEtNr/5tCOC/PIa4ins+5ePF1wKLv/ab3eyot7r/bnPGR141C6zaT3DjAYYgw14DRY3/LSRX1pMM24jMNH4w9A0of5Av7I49vUs/Efli6I8AeAD18CKlC41YGMX4ivVsMX9K3/qY9l6te9umahgY1KnjCqEiaTSTFPeuhtsfLZHnimiXGB5nftHKX4Pw0ZF156ie/Rqt92SOPnlfuHxpPwhSPDTzIV0griwsFykMkfknjTqUJsnZcNpt4TBMSUVGlK0NrmrNAY8lJH26no5R2to1Xv6QWdeJyJgaUrSAp8I8Z8P2Lvn5pqnN8cTWTltH1W1R22OQOyYmsuigzwL3xhBiAjDeGgH/BJoDoWoF5mAlRKZQrvrs4Thqf07+wAVotncl7Un0DsUjcAZOMxtdtkxDRFUc8oSvLoA31uRDBie51VoHLWJQc60KKvGeR1HxBQM9A0+XzPZo5gE8suLSczmHnwU/pk5XK7kz7pGkwQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDNYdUMxU2hTVW9kSjMxSHJyTzhyRjNxTFREQ3RUcHlGWTZUVnV5cWNLNG8z?=
 =?utf-8?B?YjhqeWJsMldxSU8wRmdPRjRtQW1oN3oyVlVpVmwrc1AxdjFlRnY1M1ZHNytS?=
 =?utf-8?B?bjFJUjBMWHBuNUVJRnAyYWpnY1VuZVA5RTQxZlBPcGw5U2I3TWRYN28rc01o?=
 =?utf-8?B?aVNRWHkzaE5WNmpEV24yNmlHa0c1bE44MERKdGFOYmd4dFZWWkg5dkkxMlJC?=
 =?utf-8?B?VmdPVkZCMVFHZUlUQ1FNVWptVjg5S2pXUU1oU3RpOG9ydEU2UEx1WDZjUGQr?=
 =?utf-8?B?V2tPZmNZMjhvVDJDZ1Nua1FYcnVQdkpvV3pYTyt6cmQ0a252OEh0S3ZmVWRV?=
 =?utf-8?B?WjFsczB2czl1eGs4S3RFWkF5Z3ZRNlVVVmVtcVVYTjgrS1JrOG9uODNFVE1X?=
 =?utf-8?B?Ukk5bDRybVdoSTJITlNVMW9LZkNVdVd1U1Z6d0ZsMk1yWlI1cmxEaXRZVWxs?=
 =?utf-8?B?bnBGUVNsNXdhRTRiRldib1JGNDB3ZGp0VUU3RkVTWDFLWmljRXU3ZTVEcEpo?=
 =?utf-8?B?YXdidk1kUlZFKzl3NWlrYlNGWHlIOFdlVk56RFBkb1FWWVhtSjlISm9XbkxL?=
 =?utf-8?B?bzVqcjVpckR2Ni8zdjVLdFJTVGJKNWp4dWh4QWhVWTBxR0MrZ1pzRHIwSTQw?=
 =?utf-8?B?WFBvT0VMYk9KMW50L1RzZDFMb28raTFyVGRCUG05TlBVZS9iSzU1MXRvam1k?=
 =?utf-8?B?UmhVY085Rmw5bWI2WHdEZy9hMGtJZ0tiODBIVTQ1U2dDclZ0cm9JTEZDTDZI?=
 =?utf-8?B?N3EyN1gyeUNDQ2V0K3BZMjYwZ2EzUENMZ0luZ2ZIaXExTzFCZFBGVlA1Rm93?=
 =?utf-8?B?VXJnVlN5MXA3MmU3SlBvT1FNTm9xd2tJWGpVa3NiWjJlMmp0R0Y1TmZoRDhV?=
 =?utf-8?B?N0pySFVzOWVTRnJUVFdUbk53RXZrMFZlNi9rWGE5NFJULzRBQWcyVG85VWQ3?=
 =?utf-8?B?QjlRM3hzdkFvNG9uYXVWd0JtWnZTd1R4ajlXczJNSHcrcExmMTBwcVo0R05M?=
 =?utf-8?B?M0ZUSjE3ODcwOG9XeDMyaXRzemVLbGN1KzE0d0JRZ2w2d2pPM2F5QVNMSmE0?=
 =?utf-8?B?S0FTSW1uYXZscTc4Y2ZpbDVoMExiTW1EeUVWMldKbXg3dnZjZ2F4NVB6TFhL?=
 =?utf-8?B?UUs5SE5TdFBhUVl6MFV4NWVPTWlyNXFZQVc3WTkwR2sveVYzbHpaYkhydURT?=
 =?utf-8?B?NW55Y1hmbkE2aWpWZ1Z0M1NscVg2c2t4TTRqOHI2bFNHYTI5ZUU3M0s0RTd4?=
 =?utf-8?B?OGNJWThHNGZ1VmxFMEFOVlhFdzc5NnpzVThDTzIxU2dtdWcrNHJ4YTZucG8v?=
 =?utf-8?B?TWFYd0Q0bVdHVlJzZ0lhOGhuRCtnY2daNnRqcTNVR01vWEJVbXlNOEtSZEg0?=
 =?utf-8?B?SS9lTDVIUHhwQWJ3bzNHWDhsSmxVUmxwQ1UybUtPUzFBdXYyRTRyTS9hNnJr?=
 =?utf-8?B?ejIzLzhIakxsRWNVMXpPWTEwaW5DNWJvMUxVZis0RlZHZEJnRnRiMDJOQTAw?=
 =?utf-8?B?NjZlbVhzL0ZJUVZxeUNDWHljbGFoYy9zZnBJbkIvNWhHanl2cTdWMlFsclY1?=
 =?utf-8?B?TTlHZ0RjRklWbzJ0dW81alVUakJMUGVyQmlzZnA1dmFZVmFNeGdWZWE4SkZn?=
 =?utf-8?B?S1R0dFJKeEVlSXc2SHltd2VPTm8xdEVYS2lOc3grajMxUkhVcndTUjRWbTNl?=
 =?utf-8?B?dHJ4Z2ZaQkFyczVjNExvQm9VN2xZaDc3aXhVR1pLVnRINk9yK0hmVmVURmVa?=
 =?utf-8?B?TURHbjZaUXovQkFmQU5IQ2hEQTZjcWYxbXlJajVxbEVVMnNRL2NLUkcycFpJ?=
 =?utf-8?B?blJqckUyMEo5b3d1QTNybFA4M2NHQTFMZWlVQnlBSHJKa2VJWnY0OXl5Zjdq?=
 =?utf-8?B?M01TbUxzVHE1b09kSldMcjdSUWVMN3RWdFJwRmIwNVRyeTVUK3hSRVFCaklD?=
 =?utf-8?B?SVJwMGFBYm9Ld2Y5eGFzeTE2a3ZTSG44NTdHNXdWREVFUjlRb2xibVRQZ2pC?=
 =?utf-8?B?MVIvcHpsZHMwdVdMZ2RrZnNSbkJ2VWtTUTlMTUlnYmQzbmtJdVNLTnI2SzJ6?=
 =?utf-8?B?V1Z0dGUrODBXaE9DR1Y5bTU3N3I4enZRbGtZSWdiM1JCa0N4OHNSdEZZaDgz?=
 =?utf-8?B?c0Y0OGQ3VUNyTkU3a0dGMWV1U1I5QnAxclFVMzdWOXVjUDBBV2dlSUw0STc2?=
 =?utf-8?B?RlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01906ff7-ab16-419c-902d-08dc31dd0472
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 06:27:31.5022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Jp7mTzn5uaq23yNPu8JKCYmygQulTzusii5z6Qs2XEvggZoWfhXjPn7skPGLx8talDUWMQ/O1FV2Gk7qNhewaoUCAo0u2RPKc1w97Nb/Ds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5395
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
> Compute vrr_vsync_start/end  which sets the position
> for hardware to send the Vsync at a fixed position
> relative to the end of the Vblank.
>
> --v2:
> - Update, VSYNC_START/END macros to VRR_VSYNC_START/END.(Ankit)
> - Update bit fields of VRR_VSYNC_START/END.(Ankit)
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_display_types.h |  1 +
>   drivers/gpu/drm/i915/display/intel_vrr.c           |  7 +++++++
>   drivers/gpu/drm/i915/i915_reg.h                    | 11 +++++++++++
>   3 files changed, 19 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index a6991bc3f07b..015ed846b896 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1414,6 +1414,7 @@ struct intel_crtc_state {
>   		bool enable, in_range;
>   		u8 pipeline_full;
>   		u16 flipline, vmin, vmax, guardband;
> +		u32 vsync_end, vsync_start;
>   	} vrr;
>   
>   	/* Stream Splitter for eDP MSO */
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 5d905f932cb4..2fa0004d00c7 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -149,6 +149,13 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
>   
>   	crtc_state->vrr.flipline = crtc_state->vrr.vmin + 1;
>   
> +	crtc_state->vrr.vsync_start =
> +			(crtc_state->hw.adjusted_mode.crtc_vtotal -
> +			VRR_VSYNC_START(crtc_state->hw.adjusted_mode.vsync_start));
> +	crtc_state->vrr.vsync_end =
> +			(crtc_state->hw.adjusted_mode.crtc_vtotal -
> +			(VRR_VSYNC_END(crtc_state->hw.adjusted_mode.vsync_end) >> 16));
> +
>   	/*
>   	 * For XE_LPD+, we use guardband and pipeline override
>   	 * is deprecated.
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index c02ea07af4c2..f73e95b18819 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -1955,6 +1955,10 @@
>   #define   VSYNC_END(vsync_end)		REG_FIELD_PREP(VSYNC_END_MASK, (vsync_end))
>   #define   VSYNC_START_MASK		REG_GENMASK(15, 0)
>   #define   VSYNC_START(vsync_start)	REG_FIELD_PREP(VSYNC_START_MASK, (vsync_start))
> +#define   VSYNC_END_MASK		REG_GENMASK(31, 16)
> +#define   VSYNC_END(vsync_end)		REG_FIELD_PREP(VSYNC_END_MASK, (vsync_end))
> +#define   VSYNC_START_MASK		REG_GENMASK(15, 0)
> +#define   VSYNC_START(vsync_start)	REG_FIELD_PREP(VSYNC_START_MASK, (vsync_start))

I think this is typo, we really dont need to touch these.


>   #define _TRANS_EXITLINE_A	0x60018
>   #define _PIPEASRC		0x6001c
>   #define   PIPESRC_WIDTH_MASK	REG_GENMASK(31, 16)
> @@ -2007,7 +2011,9 @@
>   #define _TRANS_VRR_CTL_B		0x61420
>   #define _TRANS_VRR_CTL_C		0x62420
>   #define _TRANS_VRR_CTL_D		0x63420
> +#define _TRANS_VRR_VSYNC_A		0x60078
>   #define TRANS_VRR_CTL(trans)			_MMIO_TRANS2(trans, _TRANS_VRR_CTL_A)
> +#define TRANS_VRR_VSYNC(trans)			_MMIO_TRANS2(trans, _TRANS_VRR_VSYNC_A)
>   #define   VRR_CTL_VRR_ENABLE			REG_BIT(31)
>   #define   VRR_CTL_IGN_MAX_SHIFT			REG_BIT(30)
>   #define   VRR_CTL_FLIP_LINE_EN			REG_BIT(29)
> @@ -2087,6 +2093,11 @@
>   #define TRANS_VRR_STATUS2(trans)	_MMIO_TRANS2(trans, _TRANS_VRR_STATUS2_A)
>   #define   VRR_STATUS2_VERT_LN_CNT_MASK	REG_GENMASK(19, 0)
>   
> +#define   VRR_VSYNC_END_MASK		REG_GENMASK(28, 16)
> +#define   VRR_VSYNC_END(vsync_end)	REG_FIELD_PREP(VSYNC_END_MASK, (vsync_end))
> +#define   VRR_VSYNC_START_MASK		REG_GENMASK(12, 0)
> +#define   VRR_VSYNC_START(vsync_start)	REG_FIELD_PREP(VSYNC_START_MASK, (vsync_start))

Here too, we need to use the correct VRR_VSYNC_STAR/END_MASK


Regards,

Ankit

> +
>   #define _TRANS_PUSH_A			0x60A70
>   #define _TRANS_PUSH_B			0x61A70
>   #define _TRANS_PUSH_C			0x62A70
