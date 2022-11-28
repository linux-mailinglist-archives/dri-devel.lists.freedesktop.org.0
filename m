Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 370FF63B1AD
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 19:55:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AEC610E324;
	Mon, 28 Nov 2022 18:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD8910E226;
 Mon, 28 Nov 2022 18:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669661703; x=1701197703;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zBYBf05/foaSjv8CX/AUWA/TaqAcdfLnSHItRjFdoCQ=;
 b=CuPJkv5bQNGufOfRjFOQ6bS4DCneapwd74vca5iW2HL/jTCS4NuMOK/M
 MrRH1Gaff8a0G8KGhGPUHNeksdiCASLEOKaleUi3DRrrR1LOKyaoRHdsY
 8BFXbwcsIbxHOhyzddGYLpVV48mTeozZWoX9KB4z1S8l0QabTB4yB6OLj
 Noogc25A2Qw5BeJp8jwb4DN0vNf3m+BMBp4IRp830MNt5XEyA6aUu5t04
 1zoXXntKfGxTDs4aO0cIeAcDUvuZNzkARJCmkXVqsOJAWirwYpFTMk8Xg
 OxcGqeoiSLZ/dojkceXKVC7PYWP/ceNQv5CjfhXQ1bCmmVeYxhb6ayNJN g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="313627455"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; d="scan'208";a="313627455"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 10:55:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="785747901"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; d="scan'208";a="785747901"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 28 Nov 2022 10:55:02 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 28 Nov 2022 10:55:02 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 28 Nov 2022 10:55:02 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 28 Nov 2022 10:55:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGhE7hesWIHdmRAcO6gbTP6390OZZpqlu+UPk7l7d2X54w+Kjjb25AajT3bSU8PHkS8+NRXj+nTc6ulpRPCFvLLYpIkLkQEh5cejvoxGvcV1lYqa9sPOD6/iBA7nQAzJZ+hHhcTeDjal+ApYDI+vKO8ghf0gllVsDVOXpbI0UzHNcap73ZtJUlEgWTjElydxPSTPc/krq9HSSTvKzNbX61l1uwZF3qKqbJ0tj1o7B9jLecfg0wYr0YkzrhwsE7lI5VLTi6qhjAnGeEXaRU2XmFXT8Gqjy1MVdSUmTaU4wCpL0s3bMhYTRcsH71aKTu9nKCfR/QuXDD5Cwdc5yG/Oog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6bSrHetrKn4qPx7uhF+nz92t866mQCHM42kWYD0Zn0=;
 b=OOcCakTVj5V7TFwNPUkrOE+cm8ySYgvzcyYjU56OTsV5Qp8/7gsQxHJVXd+926nyaz3213YlatNcRWJLigM4PvpcJjodxWEmCW1y3/5SE3IKDgGrJtNcPdhKI1lGauSgwWe9oENmH3h3C/PvDD/SBIXBJgOsNJtApMkHdEOueDDxX2/EPJpTTMf9dFIGvUjJcKzF9PKsp9HLuM1D5PYLhZcK9uACE0uLN0gYDUSrYZEdxwWpAu0Nch0MrBiuWqav4dDvUBrAk5HxShCA9xFMTMzwQUeGuuHPcxmZchrwqZ6yvwq3LthNTgMQFe4f0GALPIpWrcbR+T20rGzDP1GwhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 18:55:00 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::aaaa:56aa:988:ba00]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::aaaa:56aa:988:ba00%7]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 18:54:59 +0000
Message-ID: <67018b39-296e-e4a6-80f6-1802baee240f@intel.com>
Date: Mon, 28 Nov 2022 10:54:56 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.0
Subject: Re: [PATCH] drm/i915/huc: always init the delayed load fence
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20221123235417.1475709-1-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20221123235417.1475709-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR16CA0052.namprd16.prod.outlook.com
 (2603:10b6:907:1::29) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CO1PR11MB5009:EE_
X-MS-Office365-Filtering-Correlation-Id: 9939e5c1-f559-4dc7-a22f-08dad1720c98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rxDhHQg6xioRSklHM5/1txl2UKDjTtGBN5/gBMNcH1l4AILHYd98ywc5huIlcsydYNtcc3nbslfsKu+R/hY4vr0Cqybbh2G4nHhRTQWpl6fqbyVXaSqOHBYHNXH2WM6QiYJzFMVOs78/F5Z5GUNnPHs2R7rnI9YbyZDc27+NA7V7wjL2ycI3vM8BARhMxmh9XzgmD2VLiGsh5f0j/xGYQbu3opkluNpk1fJdBs4Xfn8oC9MZ8GKz7EFv9Gq7W4yWN8TVH55YwGbgSOdcH9q1YlKOrGajzrgELBDXjUN/E3d3gHXuzlSU+Dr3UR4PL42QM/LITbNCB2uV0eZo8QhL+WYTzHtlVnJAmQVLMGl/xKplezJ3qFDU/FfNke4bYFxf/M0+8TIg+sk/iQEMD4Zgo9Ysif6m3MpeIPqUcbTTdogPQRySXXbeoAeDNfl1xWMxl7obqk2TwdswJTBaOkjFx9pKZOUGnsj8MFpco+XvbFnh+zF9fxUEi+6OZfKrEt2Tf6dF3Cy+ALQnbRVtm1jX+9fxnlCQT9VIIEUycvUQ7hCRPhd5CMKtL35WNnhuQg1J0jJd720HIRCqLsIeUlbHRyqIKKSmhPKTN5Y5KHCSzCWfi5kEQ4QvOkfmtVUCKgNfxMfmWXAg5UNfhzLVCa0QvG2tXVUxz/JUyTV08fSvXJhnHkzaj5zMTek6eknGrSvyS0tR1MHOY+F6JBfh8TjYtfJh1/tfgf0/b06FMYAupbs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199015)(6486002)(31686004)(186003)(2616005)(41300700001)(478600001)(53546011)(36756003)(82960400001)(38100700002)(6506007)(316002)(107886003)(6666004)(26005)(6512007)(86362001)(450100002)(66946007)(31696002)(8676002)(4326008)(66556008)(66476007)(5660300002)(8936002)(83380400001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUhCT0lVQXI5ZGY2VCs2S3pVZ0dzUFNUcjRRbkhHN3lHTlUwS0k0SDN0SDJJ?=
 =?utf-8?B?elFmZ21ETnVodEFaMVYvUzl5NDNjTGdJQ1lUckZGSDBYVFdISkJhM0tQK255?=
 =?utf-8?B?UVZYYXdibVhVK2xldHRRbmxBdjY0cWtJRGZQWnZ2blI0OUpHNVRuaDFBaU4y?=
 =?utf-8?B?K2NjTDVpb1hTTXNCelR0azBQbG9xMExrUDNhNUhSUFJxZWU1ZHkxYklmVTRR?=
 =?utf-8?B?Q2I1V3A2YUNCRmZWeVkzUjJQdVhpbkJXbzVnYk5UMDFUS2hMQUwwVGUvSG81?=
 =?utf-8?B?b3BoNWl3UHM1dnFNYTlUVFo4d2k4d1o3NDBzaGMzV1Y3bVkxSW5BMFAzM2dR?=
 =?utf-8?B?aWxSOGZOaVdyb0xKcVgzKzE2UlNGUFBaUzdOcmNaRTJFQlVTUmdiWnFBZEZH?=
 =?utf-8?B?eEdENWhYQUhPNEVUZFp4b0d2aTZKU3BpaXdTYkR1WVZuejl2dFFvaXRIM0JM?=
 =?utf-8?B?RG1sTzU2aklXQ2NYaCtlSTFNYUhrWkUxQWtwdnliMFZ3RS9rVy9sc1IwWDQx?=
 =?utf-8?B?VlRkZy9TcWhwYTF2UXNwZXBvekdRZ1BpTWt3NENhSm1VemxuVEIvdldJRzBR?=
 =?utf-8?B?STEvNmR5am4rdXBsd0JwOXVUR1dNNlduQTcra3M3MGZXajZKVFNveEVMMnp4?=
 =?utf-8?B?SGdjV1JPc0NnTGdvajN6YU8yTkVVT2Z5Q3JXOStKbXVhdlIyWUNSeG5XRnpr?=
 =?utf-8?B?Y2FBTkhHUXRoL3RBdG5kcDIwWEhHMDVLaXNHbEIwQUFzSTZXWWljMm45b0kz?=
 =?utf-8?B?WDZMUUROK0k0QmtpTThmWkxEckUzdllMclRqVm5HSHhZdndodzQwYkMwMGtN?=
 =?utf-8?B?RlY3MUZhM3J4dFJ2OVp0NWtXZXdJbnF2WlUwcVoxbDMwKzRtak5oNWNCQjZ4?=
 =?utf-8?B?aGdjR3V6TkxtVHRibncxc3BzU25UNHpsNVJ2TlJRckxTOFIrTlM0cUxpLzZG?=
 =?utf-8?B?WmtDaXBTejFJVjVoVGJ3OGFVcmVLelY3Vzl2Ukg1N0V4NUJ3WmYyLzJnN0RD?=
 =?utf-8?B?UDAwY0k5VmtWZitmQkF0Mjc3K2JVUEpqalpWU3dKMkxzYVZPa0U0UGpHWDZ1?=
 =?utf-8?B?dDdVWFBYSWZ2U3hORGJOYWhEaTFDRkY4eW9Sa3c3S0VOTkthUHR4TSszd2Nk?=
 =?utf-8?B?blpEMjVyVCt6akN2Z3g1NjMxNG1ENnFIQ29nMkxEeHdOakxhbUNCM1k0TFZh?=
 =?utf-8?B?WjRnUmR6dkF2cTlQT2twR3kzYXVSTzRzWnlKQ1U5L0x1MXplSTdJcXJiWjQy?=
 =?utf-8?B?eTFkL1pFakRGQWZVRnVPM3hLaWRkUktHWlp0TFl1RnRWWTQwNTVsc3kyWXk5?=
 =?utf-8?B?c2h4eWd4MDBHOGI2eEFlWFNEbTh2bXJTQXdLWDZJNDZOZFZxVlFldld1amxX?=
 =?utf-8?B?TEErZWdzSXJRY0VTUzlvSDN0Q2FCdGxaaThJcXB3OGRGbmZzaEh3dkIvTldi?=
 =?utf-8?B?a1QveFpjU2hCNEpvQjFkbDRSR25jenlTWWsvNjdJcHdLOE1XYW82VG15UTc5?=
 =?utf-8?B?QktueEk3UkFpQjVPVUExMGZ6YWRUZVBMTnJXYi9NRUZpK2FKMzNHc2JKakRa?=
 =?utf-8?B?U1R5aVJjTVRPMlhpb29zWTBBS1BhZmNpU3BPbCtVaEJXeTlacDhRNkh2MXg3?=
 =?utf-8?B?OUJPQ2lwQzYrOFFCNVlLMUVEeTBVZkE4b3pUOXZmZytnSUc5RExacnRQSDJF?=
 =?utf-8?B?Rk5hZm9mMFNkV05PVE5meStIaHRvM25ZTStKTkhTOUFtcHZlNER6Smk4Vlpl?=
 =?utf-8?B?SE96VHF2NElWNVplWTR2VlNSdzdhWjlIK2NSWGJDSkQydTdlSE9nODZ5d1lF?=
 =?utf-8?B?NzJ5U2RXODMwRjBqMkxaMUIxaFU3YkdRbEtIQ2VsNHk4cGlXbUNYSU1GNnFD?=
 =?utf-8?B?dUlqekpkT2I4MjhRODBabFV1MGhuQXF5TlFBYjYycjJDK09LNG5yaC9BR3hH?=
 =?utf-8?B?R0tLcisxWVBScmtwTTlQU3h1bC9aeVRzN25vS1ZhZ0JNVUlCaXpuMG5GOUFK?=
 =?utf-8?B?Q0JpS0NMejBDTmFTblE5OXhQWDVJMVBVam5iYUMzdTYrTWQ5K3RUUGpPajFS?=
 =?utf-8?B?dHhlV3JVVFZXY3k4T3d2Y2puUW91dFpROGVlK25aVHVyb2NjTmZhbDRUdkJq?=
 =?utf-8?B?em5xY2VHc3llS2kzSXVybEVTaGdPWXErcjVyR1gzSGFCdVM0NDhsUlorZHBV?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9939e5c1-f559-4dc7-a22f-08dad1720c98
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 18:54:59.5715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JlVgKwSzeFY+Wky0gkbl3DxuiPg3ZPhAMV+0Q4Np9atY0+pvemhLIjAjohNhDrNippdZIlNcVven0IAStTQFphCyBDsInG91lOVGVJh8WI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5009
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/23/2022 15:54, Daniele Ceraolo Spurio wrote:
> The fence is only tracking if the HuC load is in progress or not and
> doesn't distinguish between already loaded, not supported or disabled,
> so we can always initialize it to completed, no matter the actual
> support. We already do that for most platforms, but we skip it on
> GTs that lack VCS engines (i.e. MTL root GT), so fix that. Note that the
i.e. -> e.g., there is more than just MTL root GT.

> cleanup is already unconditional.
>
> While at it, move the init/fini to helper functions.
>
> Fixes: 02224691cb0f ("drm/i915/huc: fix leak of debug object in huc load fence on driver unload")
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c | 47 +++++++++++++++++++-------
>   1 file changed, 34 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index 0976e9101346..5f393f8e8b2e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -211,6 +211,30 @@ void intel_huc_unregister_gsc_notifier(struct intel_huc *huc, struct bus_type *b
>   	huc->delayed_load.nb.notifier_call = NULL;
>   }
>   
> +static void delayed_huc_load_init(struct intel_huc *huc)
> +{
> +	/*
> +	 * Initialize fence to be complete as this is expected to be complete
> +	 * unless there is a delayed HuC reload in progress.
reload -> load?

> +	 */
> +	i915_sw_fence_init(&huc->delayed_load.fence,
> +			   sw_fence_dummy_notify);
> +	i915_sw_fence_commit(&huc->delayed_load.fence);
> +
> +	hrtimer_init(&huc->delayed_load.timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> +	huc->delayed_load.timer.function = huc_delayed_load_timer_callback;
> +}
> +
> +static void delayed_huc_load_fini(struct intel_huc *huc)
> +{
> +	/*
> +	 * the fence is initialized in init_early, so we need to clean it up
> +	 * even if HuC loading is off.
> +	 */
> +	delayed_huc_load_complete(huc);
> +	i915_sw_fence_fini(&huc->delayed_load.fence);
> +}
> +
>   static bool vcs_supported(struct intel_gt *gt)
>   {
>   	intel_engine_mask_t mask = gt->info.engine_mask;
> @@ -241,6 +265,15 @@ void intel_huc_init_early(struct intel_huc *huc)
>   
>   	intel_uc_fw_init_early(&huc->fw, INTEL_UC_FW_TYPE_HUC);
>   
> +	/*
> +	 * we always init the fence as already completed, even if HuC is not
> +	 * supported. This way we don't have to distinguish between HuC not
> +	 * supported/disabled or already loaded, band can focus on if the load
band -> and

Looks good otherwise. So with the typos fixed:
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> +	 * is currently in progress (fence not complete) or not, which is what
> +	 * we care about for stalling userspace submissions.
> +	 */
> +	delayed_huc_load_init(huc);
> +
>   	if (!vcs_supported(gt)) {
>   		intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_NOT_SUPPORTED);
>   		return;
> @@ -255,17 +288,6 @@ void intel_huc_init_early(struct intel_huc *huc)
>   		huc->status.mask = HUC_FW_VERIFIED;
>   		huc->status.value = HUC_FW_VERIFIED;
>   	}
> -
> -	/*
> -	 * Initialize fence to be complete as this is expected to be complete
> -	 * unless there is a delayed HuC reload in progress.
> -	 */
> -	i915_sw_fence_init(&huc->delayed_load.fence,
> -			   sw_fence_dummy_notify);
> -	i915_sw_fence_commit(&huc->delayed_load.fence);
> -
> -	hrtimer_init(&huc->delayed_load.timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> -	huc->delayed_load.timer.function = huc_delayed_load_timer_callback;
>   }
>   
>   #define HUC_LOAD_MODE_STRING(x) (x ? "GSC" : "legacy")
> @@ -333,8 +355,7 @@ void intel_huc_fini(struct intel_huc *huc)
>   	 * the fence is initialized in init_early, so we need to clean it up
>   	 * even if HuC loading is off.
>   	 */
> -	delayed_huc_load_complete(huc);
> -	i915_sw_fence_fini(&huc->delayed_load.fence);
> +	delayed_huc_load_fini(huc);
>   
>   	if (intel_uc_fw_is_loadable(&huc->fw))
>   		intel_uc_fw_fini(&huc->fw);

