Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F1F67DA8B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 01:16:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A11F10E0FE;
	Fri, 27 Jan 2023 00:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4DA10E07E;
 Fri, 27 Jan 2023 00:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674778608; x=1706314608;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f8BKvldgKtmcSbidlomI9XcgNZ9lQ1BMtCqHSJWn4Yc=;
 b=dF66Gmo6C64bXxXHiTFiW3LkasW1Gy9MYXg0Bgf5QCPjsc2nmO/MDXR9
 oxwIGHAaBGbLGqJ7RjkzXnlk4WNPmyJA5XxZclWsy78Qe4ztVcQJbpGOU
 McNIG56DsecPvOq2aYdoMeAPPYWmk/GOAjAjYrq97Q+Ya+GdC8v/ANB3i
 LC8GsLD3+0e1Tdi3SRuu7PmpGL0Gpeli1+5oEIUX40+TG0Lf4bAkzQdAB
 2lzgtA0ODmluLXdnAdKuUTwDWtldwKSsd+JGIWPY2T7co4n7bKpO2eTAy
 3YfDQvCKtWP6R93aYGtkJQKUIPu2H/YW5YxRYvyhFdqizE4wB1Z4MrBKv w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="328281021"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="328281021"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 16:16:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="726500235"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="726500235"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 26 Jan 2023 16:16:30 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 26 Jan 2023 16:16:29 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 26 Jan 2023 16:16:28 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 26 Jan 2023 16:16:28 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 26 Jan 2023 16:16:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NPqYWHPt+yLBK58FRLep64ttwMHhURlE/6XK2DNyBxARWLRuggGgU9hgfuqwnEOeCtil0PcG8Rken3J7R7FLZKa6b9YFqZ2XaLwBewgRV3EonGSbXV+/cd/FweODuuNqeoHie7PvLWRB1h5dxEkpPUz3EWtXPfTd4ieNfeHkzRSgKLCBFY05+AflZmTYe9za480iKSFJEu7a0FlPRjH1eQz4bQdTiU2OF+OjL5nkjQeTDt1ps6K4GOVrtLnTQPka9qHafdumwmAejvkeahgb6LLTlRAqnBZOhn8FEOjiTN5WqWYy6Yvl+M6N1Uxxzv0KoS9xD/0nwXJTY50ym7DJiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QNPY1iNlyIxny7WyKkNr9TuiSOno43Id0Ql2bwzhSPw=;
 b=iXYO2sW9lBnETeSsVfxYE5lt5KWWio0zxZ10+qrKOjYQ1CWiyEeqvciTFtvQCdh2B+jC9ASR9b2J0t1omptWvAVkm8Fk81/kyNuZ8yLuk/MdWazS+NyrajTEmOrPFon9vfpnWAlWA8cNociHB3b+Fm9lALeKHSoyta1i2NdBj1niyp/bM3RIzvX2UI3pk3ASJsjb9VsVdzbbzWcUSqEjlxqgvsiViXi5AQh8beBeOYjrpwJPQ0CPcS1+k7VhoXDqtLg+//YF51bVgr7D9O5s7xCsXY3MqC2lNAF8oXfVpMVjG9gZahmO8JL3gdeao/jhShprPnHvEoBxRQHoMz0p2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SA3PR11MB7535.namprd11.prod.outlook.com (2603:10b6:806:307::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Fri, 27 Jan
 2023 00:16:26 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9%5]) with mapi id 15.20.6043.021; Fri, 27 Jan 2023
 00:16:26 +0000
Message-ID: <e37ba68a-46c5-50ef-4d16-27a07350ddee@intel.com>
Date: Thu, 26 Jan 2023 16:16:23 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/8] drm/i915/pxp: Add GSC-CS back-end resource init
 and cleanup
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230125080651.100223-1-alan.previn.teres.alexis@intel.com>
 <20230125080651.100223-2-alan.previn.teres.alexis@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230125080651.100223-2-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0076.namprd03.prod.outlook.com
 (2603:10b6:a03:331::21) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SA3PR11MB7535:EE_
X-MS-Office365-Filtering-Correlation-Id: 132fdbb9-ca27-426a-7f88-08dafffbba8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hJitGwGZn26/fibjnD/dVhx5knwGqb4Cs40HelZU9NIVZw+FE/EbDGVezUFRWQHmUwYwKZKfCLuu6uuJ/4q1zJkCiL8cB+q2ZPVoZDRcQ1DeDwHG+Y96Tu8shggkrgkGiwy7hFKDmCwYIA/Ctj3cQZwgSH96718Up1E4EdXMJ1KsYHFNSIZ171yqVOXbz14DUNcQtQacmOIUsjDXIPKBR+2/vVyUX7SF0RRbcasFebCUtPDVuwYm2VzE+pyEpBWpAOxf9eKNxbXvtA5zlAJhEh7GNP3HJjCzvFEbQKVsT9wnsMyp315MaFp3+34fMateJRCvOlSlHroCUyftTC94eUgWSoWwwYfybYCMnOZWsS7tSsPPwH5PnrDml0u0i5aEMg+papSODkT4z/VGajes/sIJYpQbZbp39KZg6OaLRyInMRTXPrW3Ai8Qc7mWsVGuGkjA8WbvAY9d1YH73ICV6zf8Fq58GroZOUsNUpwsWZyuW/QgaUhZHBAgRgcGxdskLkP8a0pOAkSWJNwg6KrfPNeMKtNJO2pE7bcHsPYbgEGjJbfwdImQslRhIBXCjXQNy7s/o1gunIL2hFbEBfN8l0QlW4gnoGQWR/LiIExoIw9cJFCHlmWCG+P6qBFqsCgMaR1ePN9Wk3hCgdXDeYR3J5jG6aYsBGWW4ODegTLluJGcLuyo5NpzjBntbC/tTWW3TUdxhvFEhkCtaunvaPUChiW2g64UduIjbU668ADSO04=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(396003)(39860400002)(136003)(346002)(376002)(451199018)(31686004)(38100700002)(66946007)(8936002)(66476007)(186003)(41300700001)(36756003)(2906002)(4326008)(8676002)(31696002)(5660300002)(86362001)(82960400001)(478600001)(66556008)(6486002)(316002)(6512007)(6506007)(53546011)(6666004)(2616005)(26005)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXVTaGtzdXNyOGNSSkFRSFozNkNlb3F0YWdWR0crOUhWREJBQS95VlZtcXpX?=
 =?utf-8?B?YmRiS1FEK3BOdUdaVkY5L0pEQU9SL2VubVk4S0lHY0hNWWF1TzBVS3p2LzVw?=
 =?utf-8?B?THluMjFDWmJNUUUwTlFjYlZ0TlMvZHRTVjFvV1ZDRjFBVUNKbTlCcEtnQmQ4?=
 =?utf-8?B?UkRicGlJK3ppM05veEFYVVJnRWwyK0NnSTN6cjBVYTN6MUFRUTBpVlVjalZE?=
 =?utf-8?B?RGJXaC9TTG90SHpnZVZ5V0hVd1QzTGhhdTVUU1V6NjI0U1hudDduVkxNNzZV?=
 =?utf-8?B?dDZ4eDlTTk5ObXk5ZlU5bXpBMHRzQ2d2ZG9EeHJBNUhiQmducjdzWVFJZWN2?=
 =?utf-8?B?MkVYY2xEWk5DSHRVUS8rMUsyZUtDRzhoOFhHU0w0eHBLVkJQMmZyZjUwdFZr?=
 =?utf-8?B?dWFtaXRrZHF1M1FoZ25kMDNhY3RsL01nWHk2Vm56MExNTVI2OTE3TkRsYVhB?=
 =?utf-8?B?Wll4V014RXlWWlROdzFpWDdIaGlQb3hJQUVGRzNVcDk0TG9JRTJlc3grK0dx?=
 =?utf-8?B?SU1aU2c4VHpQSVkzdHJZSHNkemNaRFI5amx6eXptWmF6MXJCaE56aU53ZUZF?=
 =?utf-8?B?YUR6aHRSb2RQOFNzQzNneDlOdW9HaGlyQUFZeTQ2eGRva3h1TG1vYlNTcW9q?=
 =?utf-8?B?ZTEybDRSYUx6YktmWWtZTnRZODZZQVd4UDlyMEpaQ2pGRmVsbnB0YllHN3Fl?=
 =?utf-8?B?VnBuNnY0b0NYNTA5cW9YeTQzVGh3V3hPZ3FBdVMxL0NqTmRPbnFYQURXUDBD?=
 =?utf-8?B?SEVNdFNMd092Z0xja3FmTEsvdkRDM0tUZGlwaWkxRTZnYWVqTVJ6NmgzaW5L?=
 =?utf-8?B?NnhGdEV4TG9Mcm0xbXNURXNFc3pSdlFBczBBZituL0kzSHUrMDEyQ1RwMUtB?=
 =?utf-8?B?c0RMYnVLMTRoMzl6UU1kMHV4QXhQS3cvamt1VDV5VlJ0YU40ejAzYnZJbWZ5?=
 =?utf-8?B?cXFDTDRQZnRhU29uMzFabzdhalB4Um1DaGN1UW1QQ1J4aDR0c01LMGtCVHFI?=
 =?utf-8?B?K3lxb21UUEliaXpOS2xJYU4rSk9mRytaOXR3d3h0U3lwVFdQcmFVSFdxa0c1?=
 =?utf-8?B?UXNjS29QK3djSklJRFNhM0xBT01nNThrcWJxYk5qTkVIY2x4Q2h3czBsbEwr?=
 =?utf-8?B?RVUyWVp5ak1Jdk5EaVZsUFJxUVpVemozSFVVTko5cUpmRXdPdHladW9aMW1m?=
 =?utf-8?B?RjZwM1Bia2N4a0tSelN6WnlJM3dybDRRUzVnSStwbys1MzlZcFZodGh1cTVv?=
 =?utf-8?B?d0NROXpQYmdYMHpGd0RzU2JzUFlXc09na2RnL3pVSGF0UFp6TWFyR21haUNx?=
 =?utf-8?B?ZEQ5VE04YlZLL0NuYzZTRXl5TjNNYWJyKzdjZTF3WEhOZU5GUHJhQ1NTQ1Zs?=
 =?utf-8?B?anJ4ODFjc2s4a3FPb2UxNmtVaUdRUUREbmcyRmZhSjBJRmNzK0FEMzZJRXNs?=
 =?utf-8?B?a2xIUzdobHNIcmZmemFKaDZvMTM2V3p5UC8xMDNPcXVyU3hoN3NDaEdUdjlt?=
 =?utf-8?B?MjNqdU1pVXFoSW1SY3ZDVW9QT2NjRjFJL3hkb0lrc1hYOW9nVkpKRUh0aWgr?=
 =?utf-8?B?OEhsU3JVSG03RUdQekY2VkpFeWdhbXRnTWRiOThnN3pXa3M1Y29QeFBkRmJh?=
 =?utf-8?B?UFFuU3FzVnhmRzhzMkdNdHpYSXVQdzFiZWtzRFN6YzFvYzZlNWlpTURBc3Ji?=
 =?utf-8?B?cmJBMDVOQURhcHhIWXorKzRnTGkyOFV2QmY1Q1d2Rmh1cFBKUUhNb0l2Kzgy?=
 =?utf-8?B?WXhhUGhNTmdvUEtKbktiNU5lU0hkRVJ1eVkyTE5SVDQ1TnFPS0t1N2hkSTg4?=
 =?utf-8?B?dmtQK2xJY3BVRWxvYldWRFBEY3U3YzN6YWVMbkdnU0ErVEgwMHVvUFUxTTlN?=
 =?utf-8?B?bHhRSnZDZFdtbjBjRm95NnhqanM3T3JrVENYbTdHak1ZZklMeEhuSHNYdWNj?=
 =?utf-8?B?RGxsYmlSY1lxZHI4NFMyZkZPa1pFb2ZDNDhxOGgyZGVKNjA1U0JkQWU1bWVu?=
 =?utf-8?B?ZEhJQzA2WHR0ZForVC8walUyNmw2S2Jydmd6SlhlNGl6dU9oZGkwZFM0Z3Fu?=
 =?utf-8?B?YVJWWmhDQUtzUFdqQUFLQnc5dWU3Vmh6R2xxS2xqLzFnSlZieDlhTksydVFR?=
 =?utf-8?B?V3FvdGgyUTlHTTYwY1d0MmxacnJLR1daVDJ0UzFySzFnOWJnN2JkS1BGLzFr?=
 =?utf-8?Q?6y4kglFC14ZJN0bKjzboM/0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 132fdbb9-ca27-426a-7f88-08dafffbba8d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 00:16:25.9930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VHsyVyPxZlXl9Se7U0vN1JZfPjoDN2uBZnyxDVqivuieSxxVpsNPC8gFlZh+drav+a/B2wlHHA5TJsHpfr2foWK1ie6GEbN5/zPaIrtzl2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7535
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
Cc: Juston Li <justonli@chromium.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/25/2023 12:06 AM, Alan Previn wrote:
> For MTL, the PXP back-end transport uses the GSC engine to submit
> HECI packets through the HW to the GSC firmware for PXP arb
> session management. This submission uses a non-priveleged
> batch buffer, a buffer for the command packet and of course
> a context targeting the GSC-CS.
>
> Thus for MTL, we need to allocate and free a set of execution
> submission resources for the management of the arbitration session.
> Lets start with the context creation first since that object and
> its usage is very straight-forward. We'll add the buffer allocation
> and freeing later when we introduce the gsccs' send-message function.
>
> Do this one time allocation of gsccs specific resources in
> a new gsccs source file with intel_pxp_gsccs_init / fini functions
> and hook them up from the PXP front-end.
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/Makefile              |  1 +
>   drivers/gpu/drm/i915/pxp/intel_pxp.c       | 17 ++++--
>   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c | 65 ++++++++++++++++++++++
>   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h | 29 ++++++++++
>   drivers/gpu/drm/i915/pxp/intel_pxp_types.h |  8 +++
>   5 files changed, 116 insertions(+), 4 deletions(-)
>   create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
>   create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 2184bc5b2be7..5fcbc049ebb3 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -331,6 +331,7 @@ i915-y += \
>   i915-$(CONFIG_DRM_I915_PXP) += \
>   	pxp/intel_pxp_cmd.o \
>   	pxp/intel_pxp_debugfs.o \
> +	pxp/intel_pxp_gsccs.o \
>   	pxp/intel_pxp_irq.o \
>   	pxp/intel_pxp_pm.o \
>   	pxp/intel_pxp_session.o
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> index cfc9af8b3d21..22280408156e 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> @@ -12,6 +12,7 @@
>   #include "i915_drv.h"
>   
>   #include "intel_pxp.h"
> +#include "intel_pxp_gsccs.h"
>   #include "intel_pxp_irq.h"
>   #include "intel_pxp_session.h"
>   #include "intel_pxp_tee.h"
> @@ -132,7 +133,10 @@ static void pxp_init_full(struct intel_pxp *pxp)
>   	if (ret)
>   		return;
>   
> -	ret = intel_pxp_tee_component_init(pxp);
> +	if (HAS_ENGINE(pxp->ctrl_gt, GSC0))
> +		ret = intel_pxp_gsccs_init(pxp);
> +	else
> +		ret = intel_pxp_tee_component_init(pxp);
>   	if (ret)
>   		goto out_context;
>   
> @@ -165,9 +169,11 @@ static struct intel_gt *find_gt_for_required_protected_content(struct drm_i915_p
>   	/*
>   	 * For MTL onwards, PXP-controller-GT needs to have a valid GSC engine
>   	 * on the media GT. NOTE: if we have a media-tile with a GSC-engine,
> -	 * the VDBOX is already present so skip that check
> +	 * the VDBOX is already present so skip that check. We also have to
> +	 * ensure the GSC firmware is coming online
>   	 */
> -	if (i915->media_gt && HAS_ENGINE(i915->media_gt, GSC0))
> +	if (i915->media_gt && HAS_ENGINE(i915->media_gt, GSC0) &&
> +	    intel_uc_fw_is_loadable(&i915->media_gt->uc.gsc.fw))
>   		return i915->media_gt;
>   
>   	/*
> @@ -229,7 +235,10 @@ void intel_pxp_fini(struct drm_i915_private *i915)
>   
>   	i915->pxp->arb_is_valid = false;
>   
> -	intel_pxp_tee_component_fini(i915->pxp);
> +	if (HAS_ENGINE(i915->pxp->ctrl_gt, GSC0))
> +		intel_pxp_gsccs_fini(i915->pxp);
> +	else
> +		intel_pxp_tee_component_fini(i915->pxp);
>   
>   	destroy_vcs_context(i915->pxp);
>   
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> new file mode 100644
> index 000000000000..b304864902c8
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> @@ -0,0 +1,65 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2023 Intel Corporation.
> + */
> +
> +#include "gem/i915_gem_internal.h"
> +
> +#include "gt/intel_context.h"
> +
> +#include "i915_drv.h"
> +#include "intel_pxp_cmd_interface_43.h"
> +#include "intel_pxp_gsccs.h"
> +#include "intel_pxp_types.h"
> +
> +static void
> +gsccs_destroy_execution_resource(struct intel_pxp *pxp)
> +{
> +	struct gsccs_session_resources *strm_res = &pxp->gsccs_res;
> +
> +	if (strm_res->ce)
> +		intel_context_put(strm_res->ce);
> +
> +	memset(strm_res, 0, sizeof(*strm_res));
> +}
> +
> +static int
> +gsccs_allocate_execution_resource(struct intel_pxp *pxp)
> +{
> +	struct intel_gt *gt = pxp->ctrl_gt;
> +	struct gsccs_session_resources *strm_res = &pxp->gsccs_res;
> +	struct intel_engine_cs *engine = gt->engine[GSC0];
> +	struct intel_context *ce;
> +
> +	/*
> +	 * First, ensure the GSC engine is present.
> +	 * NOTE: Backend would only be called with the correct gt.
> +	 */
> +	if (!engine)
> +		return -ENODEV;
> +
> +	mutex_init(&pxp->tee_mutex);

We init this mutex in all paths, so I wonder if it is worth pulling the 
init to the pxp_init func, immediately after we set pxp->ctrl_gt and 
before we select what sub-component to init. not a blocker.

> +
> +	/* Finally, create an intel_context to be used during the submission */
> +	ce = intel_context_create(engine);
> +	if (IS_ERR(ce)) {
> +		drm_err(&gt->i915->drm, "Failed creating gsccs backend ctx\n");
> +		return PTR_ERR(ce);
> +	}
> +	i915_vm_put(ce->vm);
> +	ce->vm = i915_vm_get(pxp->ctrl_gt->vm);

Intel_context_init (inside intel_context_create) is already doing:

ce->vm = i915_vm_get(engine->gt->vm);

so you shouldn't need the put & get here

> +
> +	strm_res->ce = ce;
> +
> +	return 0;
> +}
> +
> +void intel_pxp_gsccs_fini(struct intel_pxp *pxp)
> +{
> +	gsccs_destroy_execution_resource(pxp);
> +}
> +
> +int intel_pxp_gsccs_init(struct intel_pxp *pxp)
> +{
> +	return gsccs_allocate_execution_resource(pxp);
> +}
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
> new file mode 100644
> index 000000000000..354ea9a8f940
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2022, Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef __INTEL_PXP_GSCCS_H__
> +#define __INTEL_PXP_GSCCS_H__
> +
> +#include <linux/types.h>
> +
> +struct intel_pxp;
> +
> +#ifdef CONFIG_DRM_I915_PXP
> +void intel_pxp_gsccs_fini(struct intel_pxp *pxp);
> +int intel_pxp_gsccs_init(struct intel_pxp *pxp);
> +
> +#else
> +static inline void intel_pxp_gsccs_fini(struct intel_pxp *pxp)
> +{
> +}
> +
> +static inline int intel_pxp_gsccs_init(struct intel_pxp *pxp)
> +{
> +	return 0;
> +}
> +
> +#endif
> +
> +#endif /*__INTEL_PXP_GSCCS_H__ */
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> index 7dc5f08d1583..326bd8414407 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> @@ -26,6 +26,14 @@ struct intel_pxp {
>   	 */
>   	struct intel_gt *ctrl_gt;
>   
> +	/**
> +	 * @gsccs_res: resources for request submission for platforms that have a GSC engine.
> +	 */
> +	struct gsccs_session_resources {
> +		u64 host_session_handle; /* used by firmware to link commands to sessions */

Can you move the addition of this variable to the patch that uses it?
with these nits addressed:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +		struct intel_context *ce; /* context for gsc command submission */
> +	} gsccs_res;
> +
>   	/**
>   	 * @pxp_component: i915_pxp_component struct of the bound mei_pxp
>   	 * module. Only set and cleared inside component bind/unbind functions,

