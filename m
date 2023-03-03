Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5E46AA022
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 20:34:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA30B10E73B;
	Fri,  3 Mar 2023 19:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E24910E73B;
 Fri,  3 Mar 2023 19:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677872093; x=1709408093;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JqxxsbGm6L9ZSHJccopfmPG+EXZor3g7u7erTg7xyaU=;
 b=lCva8VO0MqoPPrTANIp235lDgHEVbwgmsNLjMuwQNn5R6FF2FSdGCvgW
 WGBGlCJFAjqwaDM8CNzmC4o10Vuf0r3rhoExcrTaH7+c5WOY4hcRiUHl2
 rgv8m7zV6s890sTPqHmXidFt/5N5TIRUnwyn8rXvk7+05sGCdH/BbRQuv
 +WoFWA+K0Qlgg0EWhtxOjhgr0y3YRaqrwiqiMPPNNlf4iMqzouE2zr9ka
 ohVsU7+noE5rQx0PJ0MAfs7CEIGXIswN1gKfdR2iaNszPjQoSbSyBVEnw
 TNRSp947s4rtP1BaaXwYJRCo3YcaqvWs9/GA+eSgP9sgoPIIfR87w7sg1 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="336658349"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; d="scan'208";a="336658349"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 11:34:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="1004699038"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; d="scan'208";a="1004699038"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 03 Mar 2023 11:34:52 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 11:34:51 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 3 Mar 2023 11:34:51 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 3 Mar 2023 11:34:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGMoruZa65II9vFK2K5+VbqcTIFdlw84jhrXSfkOKQBFfe51hMLuQr46QAhAmIntfGirQiVs7KK3UtjDeW3OQbiNL8Rt5oRJvXlF0xZN8Wt22u4y+HLqI7q1HBr2RhgrZwyhgYd8CcpxiD+BOZMb74+Fep+LvYyEfg7IGaK3ny2LWCbuHSFhjMRvLNqrTHlCYAEMH128kUq4M1xUCB0L9Bx1pi/aRjDT4wkclC6uVG98JOQT3g+aXTue2hwFQQRgX2UYPV7kZEU12V8jVnQexT9UTs0gI4pjf4j4pF0pLjPSuwyYffESB886miYqK9U6z1yeg84uI/9lxNkjOB/JOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Z5OOX6PZnlRzh3QtV7AqB3aYyzfxy/e4hDUiONdI7M=;
 b=Tf00N13Vj0u0z3lCGoM4+6K7ZUL3walmWWWTZf4eolE/R4Z3RnEjYKfxFwHeD287bW2JLZelMHOJB+Y/rnIYpRpqyFJT2eLrwH6IA3QTD6me5OZJscDLa+VOrrTLE3Fe5tz6S6VcRd/Hlac1PKIq0a6lLxpmlO05PEBJSSPv14djRGwNS49KerEW6cY01+HopDDFhVguD23/9RBCNs7LP8ir72zbNsjlJkFf7bs2I3omHegyKMZ6lSOui5AN0ccPJ0dMfttj3mXKlNX9+V87A8wUNWMDzUW0dmxtrPTgwJntDWkz/ONk6JTEKsGL5zY94KinoV2J7ranKkl0HfMRKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 IA1PR11MB7891.namprd11.prod.outlook.com (2603:10b6:208:3fa::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.21; Fri, 3 Mar 2023 19:34:49 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9%6]) with mapi id 15.20.6156.022; Fri, 3 Mar 2023
 19:34:49 +0000
Message-ID: <badf0bc0-e5b9-06ba-0d07-a244e5778b7b@intel.com>
Date: Fri, 3 Mar 2023 11:34:46 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] drm/i915/pxp: limit drm-errors or warning on firmware API
 failures
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230204054852.592917-1-alan.previn.teres.alexis@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230204054852.592917-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::28) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|IA1PR11MB7891:EE_
X-MS-Office365-Filtering-Correlation-Id: 126e5e24-be7f-4771-afa2-08db1c1e5a3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OOT6xiJTZfpfeL0JeJSsx3mwSIA5rN5dERZ7e3N2BKsT3ogdcsORIVEdxcJbtyk2ev/EFuP/kEfQ/h5MCn+zb11sD/hsv57luZfAHPSpTjtMt2Y3on6EFbo15d+IWlDylgxTlMAEZiyyGGXLuISsLoSjgPMWCbRqVGn6zrk5/GecFOc5EF1Sdkpxx4ii/t6Gzvt/0Ou7zcS99vASS9BBYAolrCC3vvavs38tX5KwSZ9kU2fozMDy7Qroie6W0b4lA+7ADrp/9k6GPN3MIVND9mzivBJxj9bqSXDjd4MDu7eZEyAa/UCa/Gcu7OawkO4OK7DBw3cNtjUIPJWuhAt1oaLhBfDlYOn8755ocYNeIv8rZTf4YZ486y6llyj3EqvxiDUO3+BlyA5Y9ICuijbZTIpoF+KRA526EI19aLBbhzuf9OCjwKyAbkcn2x6fg+pyvMdYNOkkGKcslffCZ1mcw9HsLCMyf+xqIHwPZN+3/w31Dt80NqsUIt8dNth6uWzNO7BqVdfOXVASN0pWK/Z2LJ7TiUmKK+XV66qGVvwiQRwjS15+dklRxKOGsc1Oc7qjokD7vcMMKOth7N8e4DAdwZMmE1mKrJQGzvotFiWEGzvUunNAIYxjHlzXYG8/LHVCDYZevUx48/f35l0/K4nkCNIe1bXyRDqA/oP9/4aanLdCGQy5bUGhhcrQvVkoCmMgVtCFaLlYiwc5UbzwVAgEzl6TqyDtCDxVaR969Fr9hCg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(346002)(39860400002)(136003)(396003)(366004)(451199018)(316002)(41300700001)(53546011)(38100700002)(66556008)(36756003)(6506007)(86362001)(66476007)(83380400001)(6486002)(6666004)(2906002)(6512007)(478600001)(8676002)(31696002)(2616005)(5660300002)(4326008)(8936002)(186003)(26005)(66946007)(82960400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWh0azFQNW12WlRXc0tLam9tT21qUEdJZ3pCY0xtZkFHdmZBOHBOVm9ZRFZ6?=
 =?utf-8?B?RmdMd084RVBNbGt3R3U2ZmQydXVJd0EyQ2haNm5kSXlPVEZPeXBVUldTZ2k3?=
 =?utf-8?B?ZG1VSUNIZWg5Y1JndTk1RktvN282KzFSZ0N1SDRvRzUxRUNEM1dwZC9nM3A4?=
 =?utf-8?B?c3dHSlNJdWNRZkZuaFJPNFRyc3NxYjNneWY0QzVEZGlWQU50MmhxRi9ZVVNq?=
 =?utf-8?B?cWJ6QUpaZEFpSU5jUWJmUGhaNmJ5ejBjVkNraVIweDNwMFlCZkEzMDdjSHFN?=
 =?utf-8?B?MmtWRzdZZGludUliK29vS25oOENXU3BjTEg5VGhobjNqVG9US0hUbzNOYml1?=
 =?utf-8?B?eFZRdVRYOGdCNndBMHFSZEVjMWEvMGk2dnFNQ2RRV0RacXQrY1I3RzFHbU1s?=
 =?utf-8?B?QmZ2by9UbkV1eXNsS1ZUTGUxK1V5UlFHeE1ZNTZrVE1DWStLWHlwTkpwRGxp?=
 =?utf-8?B?QW03SVQrZVQwd0VERmh5dHp4bFlzdnhSK1FYRERUZ1UyZG5BNmVPRlRXOUQ5?=
 =?utf-8?B?T1V6TWZ3WGRMVG9SU3hqcWQ4anpWRmpoYzNUVEF6K29aeTkyMWIrZC9ZUkNh?=
 =?utf-8?B?cENhM2FjRTB2Nk1sNjJnZW9uUGtnUmNMaXg0bXdWNEZ4eGdaajlMamhndlBG?=
 =?utf-8?B?OHNRWVowM0hCMHRxSXM5K1ZoU1JxRlE5NndGNTQvVjc4RGV0b2lJRFM5cENi?=
 =?utf-8?B?TkwvSEtjdk9oTmtVWFBJc3M5MzVYeUFvMVVHancweDZZcStiOEJCUkx3SVlM?=
 =?utf-8?B?RENFQ3hvcEpZUW5zbXFyK1hpN1dPeEpiZ0ljU3c4SXN3MjByNmlBNnFqU0tY?=
 =?utf-8?B?RjRQcEF2R3k0RS9uV0N4SlMxZXZkU2REbXpVenBnWHdyYU5EOHVWaC90VHYr?=
 =?utf-8?B?RlR1bTBtaWtPVjUvTmY4WFh3ajJoTXhzZmx3NGNtcmsySTVCQ3licDF1MmhY?=
 =?utf-8?B?TWl4TFpHWlkwQXZaZU5RaDM1aXJMSGxSRXhNUGpGd3FwMGF4enNaU1JTUGZT?=
 =?utf-8?B?VjNBRnhoczF3STg4cHgxWEtjRGxoTzgwTE1ZYTlOZk1IL3RKYUtJYnBRYXNW?=
 =?utf-8?B?aEQ5Z0QrL0tlY2pnUUU3VnJiQUFSWDR1N2ZYTG5IcHRqZWVKcFdGaTdRRWhB?=
 =?utf-8?B?UVZhSjVHNnVBRjBxbGxsVXdXSzlSdUlkVXZxZHpubXlqa00zS2h1S2o1SGcr?=
 =?utf-8?B?Yk02Y3h1S1NZNWZieHhpYkpwcFJ5NFdoeWxHZFlYSEU0ZzFHRXdhNmk0Z0kw?=
 =?utf-8?B?d2tFN2lPNnlGUzk2dVU3SDhPNXFETmFDd0xETlUrY1dTc21MalpaU1pmTGZy?=
 =?utf-8?B?bUlpTE1icGY4RHZiL2hZZ0xBK3NBL1FsaVZ1aUFjOFdXdEtkUjRqeUVKTXJN?=
 =?utf-8?B?R1IzaDhFYU1pelZDbVFyQ0FMVXYydGMybkxNVmxmc251R2RsS3QwSWQ4ZTlx?=
 =?utf-8?B?SXc2TTF0dE1ucVVIUUtlanZQeGNZQ0lTdkRZVm1pWkNFVlc3N0dSTGdRVXdC?=
 =?utf-8?B?azBNR3E4NFVMNU85U2lRWDNidDNhTFNubnNKeTgzRUtFNmJZZlJZalNuTTFB?=
 =?utf-8?B?L3hlck1ucUhHV3lRb2dXM2NYOWMrUG95MWYzM0hZMWlqTjhsTm5sOVk0RU5N?=
 =?utf-8?B?QXhodlBHcnNNVjZPUmdnY3BOZDhTRVlqT05wYXdwZEJUbEJTYkhCWE5TUXhV?=
 =?utf-8?B?TEhReVpnTEtONlI3MGRrRXhDWGxRYXRFbXNXeUg0K2l2TWhiWHZ2YUQwTFEw?=
 =?utf-8?B?SnovVlhDMVM2c3VNb2pxdUFJTWhxaUdPT3VWbVlqT09IejdCYlZmZmYzY1dE?=
 =?utf-8?B?aWZqL3N0QmN6RlpwSUZwdVh5TDZMYm1mRFNQUFdnU1FVaVpmbHlibVB5QnZY?=
 =?utf-8?B?RWp5UVpPZ3lBb0ZkZnloeVI1T2w1a291MnRlR05MM0JsdU93OEUzZ3VSdFho?=
 =?utf-8?B?YW5WVGp0YTNTY002SUlpWStBU0RWK2V2cGxQWnZHT1djMTJqVlBOWlpLOGVR?=
 =?utf-8?B?NHRhVHFmRXhkSkp6aVEyV1hUVFgzUkkrTnkvNjFpSno5T0I0UzhySE5uRWhS?=
 =?utf-8?B?OUg3S29vWVlMUXo2S0c5c2RvUWExMDFsQnZpbnpzWDh0R084Y3FkQmhZMkor?=
 =?utf-8?B?MHVhVFRQZ3ByRml0a3N4cEpKRlBWL09GbVFuUjRQa3V4UXVtaWpscjVyZDZ3?=
 =?utf-8?Q?Czov+I6RJxRMfXeIf/3+EjA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 126e5e24-be7f-4771-afa2-08db1c1e5a3e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 19:34:49.3586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HOZCJuq6+so/lXgMCB6loDBf2hD4uWEnNC3N1aq2zAld8eRbQ+gWKgN/HfsyzFuaYLPhJ++5zIsmj88+JrIqL5U/JB+0SmRax/TMSd+AUEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7891
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/3/2023 9:48 PM, Alan Previn wrote:
> MESA driver is creating protected context on every driver handle
> creation to query caps bits for app. So when running CI tests,
> they are observing hundreds of drm_errors when enabling PXP
> in .config but using SOC fusing or BIOS configuration that cannot
> support PXP sessions.
>
> The fixes tag referenced below was to resolve a related issue
> where we wanted to silence error messages, but that case was due
> to outdated IFWI (firmware) that definitely needed an upgrade and
> was, at that point, considered a one-off case as opposed to today's
> realization that default CI was enabling PXP in kernel config for
> all testing.
>
> So with this patch, let's strike a balance between issues that is
> critical but are root-caused from HW/platform gaps (louder drm-warn
> but just ONCE) vs other cases where it could also come from session
> state machine (which cannot be a WARN_ONCE since it can be triggered
> due to runtime operation events).
>
> Let's use helpers for these so as more functions are added in future
> features / HW (or as FW designers continue to bless upstreaming of
> the error codes and meanings), we only need to update the helpers.
>
> NOTE: Don't completely remove FW errors (via drm_debug) or else cusomer
> apps that really needs to know that content protection failed won't
> be aware of it.
>
> Fixes: b762787bf767 ("drm/i915/pxp: Use drm_dbg if arb session failed due to fw version")
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   .../i915/pxp/intel_pxp_cmd_interface_cmn.h    |  3 +
>   drivers/gpu/drm/i915/pxp/intel_pxp_session.c  |  2 +-
>   drivers/gpu/drm/i915/pxp/intel_pxp_tee.c      | 73 +++++++++++++++----
>   3 files changed, 64 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
> index ae9b151b7cb7..6f6541d5e49a 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
> @@ -18,6 +18,9 @@
>   enum pxp_status {
>   	PXP_STATUS_SUCCESS = 0x0,
>   	PXP_STATUS_ERROR_API_VERSION = 0x1002,
> +	PXP_STATUS_NOT_READY = 0x100e,
> +	PXP_STATUS_PLATFCONFIG_KF1_NOVERIF = 0x101a,
> +	PXP_STATUS_PLATFCONFIG_KF1_BAD = 0x101f,
>   	PXP_STATUS_OP_NOT_PERMITTED = 0x4013
>   };
>   
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> index 448cacb0465d..7de849cb6c47 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> @@ -74,7 +74,7 @@ static int pxp_create_arb_session(struct intel_pxp *pxp)
>   
>   	ret = pxp_wait_for_session_state(pxp, ARB_SESSION, true);
>   	if (ret) {
> -		drm_err(&gt->i915->drm, "arb session failed to go in play\n");
> +		drm_dbg(&gt->i915->drm, "arb session failed to go in play\n");
>   		return ret;
>   	}
>   	drm_dbg(&gt->i915->drm, "PXP ARB session is alive\n");
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> index d9d248b48093..2d3bcff93da3 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> @@ -19,6 +19,37 @@
>   #include "intel_pxp_tee.h"
>   #include "intel_pxp_types.h"
>   
> +static bool
> +is_fw_err_platform_config(u32 type)
> +{
> +	switch (type) {
> +	case PXP_STATUS_ERROR_API_VERSION:
> +	case PXP_STATUS_PLATFCONFIG_KF1_NOVERIF:
> +	case PXP_STATUS_PLATFCONFIG_KF1_BAD:
> +		return true;
> +	default:
> +		break;
> +	}
> +	return false;
> +}
> +
> +static const char *
> +fw_err_to_string(u32 type)
> +{
> +	switch (type) {
> +	case PXP_STATUS_ERROR_API_VERSION:
> +		return "ERR_API_VERSION";
> +	case PXP_STATUS_NOT_READY:
> +		return "ERR_NOT_READY";
> +	case PXP_STATUS_PLATFCONFIG_KF1_NOVERIF:
> +	case PXP_STATUS_PLATFCONFIG_KF1_BAD:
> +		return "ERR_PLATFORM_CONFIG";
> +	default:
> +		break;
> +	}
> +	return NULL;
> +}
> +
>   static int intel_pxp_tee_io_message(struct intel_pxp *pxp,
>   				    void *msg_in, u32 msg_in_size,
>   				    void *msg_out, u32 msg_out_max_size,
> @@ -307,15 +338,21 @@ int intel_pxp_tee_cmd_create_arb_session(struct intel_pxp *pxp,
>   				       &msg_out, sizeof(msg_out),
>   				       NULL);
>   
> -	if (ret)
> -		drm_err(&i915->drm, "Failed to send tee msg ret=[%d]\n", ret);
> -	else if (msg_out.header.status == PXP_STATUS_ERROR_API_VERSION)
> -		drm_dbg(&i915->drm, "PXP firmware version unsupported, requested: "
> -			"CMD-ID-[0x%08x] on API-Ver-[0x%08x]\n",
> -			msg_in.header.command_id, msg_in.header.api_version);
> -	else if (msg_out.header.status != 0x0)
> -		drm_warn(&i915->drm, "PXP firmware failed arb session init request ret=[0x%08x]\n",
> -			 msg_out.header.status);
> +	if (ret) {
> +		drm_err(&i915->drm, "Failed to send tee msg init arb session, ret=[%d]\n", ret);
> +	} else if (msg_out.header.status != 0) {
> +		if (is_fw_err_platform_config(msg_out.header.status))
> +			drm_WARN_ONCE(&i915->drm, true,
> +				      "PXP init-arb-session-%d failed due to BIOS/SOC:0x%08x:%s\n",
> +				      (int)arb_session_id, msg_out.header.status,
> +				      fw_err_to_string(msg_out.header.status));
> +		else
> +			drm_dbg(&i915->drm, "PXP init-arb-session--%d failed 0x%08x:%st:\n"

I think we usually prefer to emit 2 separate drm_dbg instead of having a 
newline in the middle

> +				"CMD-ID-[0x%08x]:API-Ver-[0x%08x]\n",
> +				(int)arb_session_id, msg_out.header.status,

Isn't arb_session_id already an int? why the need to cast it?

> +				fw_err_to_string(msg_out.header.status),
> +				msg_in.header.command_id, msg_in.header.api_version);
> +	}
>   
>   	return ret;
>   }
> @@ -347,10 +384,20 @@ void intel_pxp_tee_end_arb_fw_session(struct intel_pxp *pxp, u32 session_id)
>   	if ((ret || msg_out.header.status != 0x0) && ++trials < 3)
>   		goto try_again;
>   
> -	if (ret)
> +	if (ret) {
>   		drm_err(&i915->drm, "Failed to send tee msg for inv-stream-key-%d, ret=[%d]\n",
>   			session_id, ret);
> -	else if (msg_out.header.status != 0x0)
> -		drm_warn(&i915->drm, "PXP firmware failed inv-stream-key-%d with status 0x%08x\n",
> -			 session_id, msg_out.header.status);
> +	} else if (msg_out.header.status != 0) {
> +		if (is_fw_err_platform_config(msg_out.header.status))
> +			drm_WARN_ONCE(&i915->drm, true,
> +				      "PXP inv-stream-key-%d failed due to BIOS/SOC :0x%08x:%s\n",
> +				      (int)session_id, msg_out.header.status,

This time this is a u32, so why not just use %u?

Patch LGTM apart from these nits.

Daniele

> +				      fw_err_to_string(msg_out.header.status));
> +		else
> +			drm_dbg(&i915->drm, "PXP inv-stream-key-%d failed 0x%08x:%s:\n"
> +				"CMD-ID-[0x%08x]:API-Ver-[0x%08x]\n",
> +				(int)session_id, msg_out.header.status,
> +				fw_err_to_string(msg_out.header.status),
> +				msg_in.header.command_id, msg_in.header.api_version);
> +	}
>   }

