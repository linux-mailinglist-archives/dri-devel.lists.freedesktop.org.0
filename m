Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB83B6E6FE8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 01:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0AE10E126;
	Tue, 18 Apr 2023 23:24:15 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C637510E126;
 Tue, 18 Apr 2023 23:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681860254; x=1713396254;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ICwHsTKAYObp/CceioPcIiDAiBo3d/Atoho13u/vUq8=;
 b=QbN+TI5DU3a+NShcStfI2yiWXYRZVU05MCmV1Sxq7CGkTOgMI58ut7UF
 385NqxT9Bw15Ug6dIbV14H104SI0M1CdkTKdgR09RNZXve3TGTF7QmKE1
 +IjsLeGQA17uXJRrfTaT83P76ANrctYOGmPwGRSlgWY7rYUvbVICp4pgH
 qAu9Tl4qVX0JhD///09KCisEjlfhmw8ny3vJXydD+2jHxyq/aWdJmn0mZ
 WPXhonGBijcbdftbXUJvvjD2YcMJ5sygGVwWjby4yj3HQ8kAq53EeffHS
 LOV5pppQUOITrc1O938aon2XvplOW8JUhxNw5Sg1uY0zb6q7ouGi4bVmw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="408212436"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="408212436"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 16:24:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="1020960099"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="1020960099"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 18 Apr 2023 16:24:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 18 Apr 2023 16:24:13 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 18 Apr 2023 16:24:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 18 Apr 2023 16:24:12 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 18 Apr 2023 16:24:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/OhWbAFWvqY2l2rM6XkSyKP1JPNOdfYIKjbxftO/eZ9wZmD82Fdxal+gjS3+4D8RXAEwCAJMn4HUjfXpgo9nJi0+M14gOsLHSx3fbz40gC3buBwgLDNr7cLbbPEo+3nwOam5YxEOdtfiHxtf2WzD/JfM9L2pgbbxPI+oLMKIzPLDLJaI652D0exvtAxPssTd/6ucfhvVnF7hRUHW39j+Af82IHYwctVaEsIaHpjfFeF4pAYd1gc47xWK3OzcCWRrXhTUfXqrjkDpbwS8y0jXECcDckOY51ts0izfiYpaVvRM7Iw54n+eY4xxQLgG3jRHtzO4MUQ7TRIvvTjn+2ApQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=atvX9gczD7BGnlyGJMWGcrP+bdjm0QdLCWHCb0WojXs=;
 b=n4Hpla05uw+XsMjFEXPa8ebFKghw4tuf3n0YjQzd+YaXytFGVOvaYQ6gWmD9XfHNvSbZzyxWVXMkg61zQMAsAGj3ghm2vPVjKWIrJa7HvDN51B8B1gVEqrM10fhDf8ZhBgd9TeEwJwZjgLEWvGBa5yDu52rtldiRVeL7qBcv3rqGpWZ+t5G0ZtC04OmvozJ2QUjg4QWvCmO+LenlsVGxWhOFIcd4fTAceyIg6znlDbLx15OXYkqEQGnwBO2xf1zBldzzVPRGkUbbNiD5NIWJq+JgzgfxcTer66uvL17Ihb9SrNrzGsBoJP2gvUrFyBLKVB9UyWDKPSVe7OkhAGVQJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SA3PR11MB7555.namprd11.prod.outlook.com (2603:10b6:806:311::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 23:24:10 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0%7]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 23:24:10 +0000
Message-ID: <ff39e6ca-4ee6-149e-e0ba-13490306c577@intel.com>
Date: Tue, 18 Apr 2023 16:24:07 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH 5/5] drm/i915/uc: Reject doplicate entries in
 firmware table
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230415005706.4135485-1-John.C.Harrison@Intel.com>
 <20230415005706.4135485-6-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230415005706.4135485-6-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0082.namprd03.prod.outlook.com
 (2603:10b6:a03:331::27) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SA3PR11MB7555:EE_
X-MS-Office365-Filtering-Correlation-Id: 242db8ed-54ac-49c5-482a-08db40640382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p0eHSDyqDLHl2wUy4phFrpUWSkU5SMAZMzuTl4hAO4Tp7wAbuaNjOZS4I1l5c2XVqwcyAxJoOF08KAB1TjzfFROOxcFxtnEtrhO8iFRxNhaaNGTsleGDDqdrtnakl3C1UnXMcgQRwxcijXSR6k+tN+dLxq0VQhononAyGtpK9Er4fyc1tDLod2I6iImPpyS14i3P3sA0E0AvvfU4q7vXTSwDqF0TYVXberlbEZqUNvTbkikFQWt2ikMgsqAzxXPgNTUjh68qsP2bh4qAqkzjYrO3JJpK3ZdB70jXAiy7Fd0xm7PZrYfgy/N95AigEM2MmxqnlRh/Yx8uP3WY4gYpf6+UltDpzaNlMERfzmnCYvb8wnOxUD7lER8PtbKR4G/CpqGuBxE6MJZvhgaaRj9zGHD/uAL2Ig4ZvUM9pyFeMX4S9EVSFphgd22Syyj2ddIFL2XGp1al6ZvC2QCAdG1RmW5A78jIfuHbpHxodgUaWGxwwfZ2YYUAQAcVwEjdtwBCHAInsD6JjWvSIKi2Rrh1VGDZwMP4RmabAxy5osT9fYWgPmfSM8uOR7NnPBoYDQUb64ZP4Ch1dwJBH9nBl0NRgO6mqBhA7OSr8myiZdFZ3g/hyFCIkYoa6bDMFHINYuqjDBePkWCxfnzqb2pX26HYqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(136003)(346002)(376002)(366004)(451199021)(31696002)(86362001)(2906002)(36756003)(31686004)(6666004)(6486002)(53546011)(186003)(2616005)(83380400001)(6512007)(6506007)(26005)(82960400001)(4326008)(66556008)(478600001)(316002)(450100002)(66476007)(41300700001)(38100700002)(66946007)(5660300002)(8936002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U05UTnplUHFIQVFRVVV3aEJQZHYrRm5sNmRBdXBYVkdxaEJuUnNEK3UxRStr?=
 =?utf-8?B?ZTF6UGgza1dDNHJHQll5aXdvVUNxUEZjN0lVdjZmaTFzS0hSbklWM2NnNm1T?=
 =?utf-8?B?OVhxMlc4ZWtaQUcyeXE2U3kxYzBYS0lhd2g4ZEZPdy9lQUtZb2daWWdDVHJk?=
 =?utf-8?B?MlJqV3N6dVQ4K1h1cU1ZQ3pwUzd5cVp5bzJScmpZRXFsMVFVdmV4bFZsaHoz?=
 =?utf-8?B?T1ZRYjVzMUlvRXJ0SkRDQWNmZWh5dTdxcUEvSndlU3hpYmN0cVVvdGhHems2?=
 =?utf-8?B?Z3h5QThrTUZIVWNjNHNIODFlZ0hHTFo5NXZUaVB2dHEvMllaN2Q4aTdrbENM?=
 =?utf-8?B?azUvejc4WGpYWDU0akRkN24vSkRodURzQkNSSzFyQnZ3SDRWcXZVdGhrQ0N0?=
 =?utf-8?B?MnRlRksyYUlnL0U2UnQxL0xyMjZOR1BCTDVrS09aZVZ5MWY3SjluSjBKcFlr?=
 =?utf-8?B?cmlId250cm5aS1dHdWdEMWFUL3paak12TGpHUTdJcUoyQXhwT0N1M2NUOEIv?=
 =?utf-8?B?Yk9BWUM1ZW5XdFpCVUt0OCtyWTBRV3kxUjZGZEdtbmhBQklLRjNlaHFNZGRx?=
 =?utf-8?B?eG92YzRMeG1PN3BXS2I5cnhVVCs0Y084NVdGV1Y4MUVpTUlmOExoL1RpbmZJ?=
 =?utf-8?B?WkxDUy9kd1NIUlNBWW4yRGJhaVhFZEtMRUZtOCtWQlNaWEd5MDdyenJWNUwz?=
 =?utf-8?B?ajloby8yLzRBY1RwMHQxSU9XclVaV0xLWnNrelVHNDJWQjhJOUN2SjkraWVx?=
 =?utf-8?B?cC9vVkxDMUV4WVBVSE1MU2FlZGJPOGZKQTRqWlEwaTNpbE5CV1F0alR4eWNy?=
 =?utf-8?B?b0VSSDdUYUxzRHF4ejBpdUlWS2w0WUhBMi9vdU5USzFXVmxUR1RtL1daNDhm?=
 =?utf-8?B?Q0Zlbkw0YWMrSVBZeTduV0gzQmxIZDVGa0tPK1dCeEZsZTE3QWhENUwxaUZq?=
 =?utf-8?B?OXJJUDlXc3JnekdPanA3QjQ5OXV6ZXlIT2ljMEMyTWNMamJZM05VbFVOZU5P?=
 =?utf-8?B?NWhiRXFVSWxmSTcwUEVtdHJoMm9DOGYzVGkvdVZ5ZzkwM1YyNnhTcEw5Q2l6?=
 =?utf-8?B?OCtha25wYUVYYzRSUGQyWjQ4RGNRbTQ1eE9JdXphcmFTbFJIWmdreUZUUUNF?=
 =?utf-8?B?WDRsZGpSNy9WMjFWL1huOVFlbm9mMVE4M0MzOVd2TE5paVdQTVhrWDU4SVpO?=
 =?utf-8?B?OEc5SERNQkxvbHRCTmFWWUhSeEhNZ1NKSjNVbnFvcENYM3NpMlkxLytrV2wv?=
 =?utf-8?B?c2ZjRWxUbmtsME5kVHV2S2JYalBPck50MXlGRW5SUnVFL3hnS2Z5SVVIV0NJ?=
 =?utf-8?B?Qk1MazJrcjI3RkZuU3VYK3VSenhoSmI0L2RCTzlrOXV1MTFybjRPWTFnOTNW?=
 =?utf-8?B?ZzkzTHI5ZDFCMCtUWDM3bGdiVWlPaFJqVlhNY1lTcjN0aHhSTUp5Vmo4WkVk?=
 =?utf-8?B?dm1Ha1RmbEhtaWUxTkZpTFExdzlwRThxQi91Z1RDOFZQQURaUHlPbDVyaFNo?=
 =?utf-8?B?bVR3RmxPNmtyMFp0cGJ0cDNuUHlsbVNIR1BONFJGV3hzYWNCS3lwaHFzQnMw?=
 =?utf-8?B?cVJhTTBwcDQ4M1lCeGU1RWdOZDJxUFRqaWZhT050OXBnSUdRKzJrMnVpZXF6?=
 =?utf-8?B?RWNDMlJ5MERCNDlGN1Zubng0VHh5cTQ4RE5iZjVKdUJDT082dno5T2g0UEFR?=
 =?utf-8?B?d09JbVd4cEU4ZDk2ZW50dXFLY1RzSzAwUTU3U3ZTZll5R3h3UmRGNk5tUTkr?=
 =?utf-8?B?NXdPY0pydy8xcjZ5UC8wTFNzSmErZWpXVDZIVnhpNk1QWU5rbVdBbzlWdDFB?=
 =?utf-8?B?M0czSDFUTGtlb1l5eVBYZHNoeVJrN2lEeTZNV3U4TWVSRGtIQmhjQVpaak01?=
 =?utf-8?B?NkVBVGY4YzdFQStsSEtxSVdacVVPYk5taDYvNFdVNFlhdk4vbU9selI2NFZP?=
 =?utf-8?B?WDNvZjRacGI0YmFUTXRvQVBqQVlNcHBNZmtyaUNldnh5UlQ5UDNLb21ucVk3?=
 =?utf-8?B?czRCcWU5RVBHenVHTmJrYjIyOE5tckphWWNDalZCUG05cy9xL2JvbXFTYlhi?=
 =?utf-8?B?VmFlNWhubTJvakRaTmQwV2F3S3dlenpkcFNRZDJKQ1JXaFQvb0VpMlFMME00?=
 =?utf-8?B?dXB4Mncva1oya0xrWHF4SlcwS1VOcVVvU0cwaG5ENjY2QXZqMmJNSHJZd1JO?=
 =?utf-8?Q?rCnTdsTdzBU/bSQJ0vuP2jg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 242db8ed-54ac-49c5-482a-08db40640382
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 23:24:10.4774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qLJ1Sh6Nei+4uib07MRDIHQvHh2lIzUJsYJNtOfnWxoTBQGpN20X8J0eoP08VHN7EXPfKD7buai1RluLT+/Pei34GGqkqqvqPXvFlehbk64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7555
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Typo doplicate in patch title

On 4/14/2023 5:57 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> It was noticed that duplicte entries in the firmware table could cause

typo duplicte

> an infinite loop in the firmware loading code if that entry failed to
> load. Duplicate entries are a bug anyway and so should never happen.
> Ensure they don't by tweaking the table validation code to reject
> duplicates.

Here you're not really rejecting anything though, just printing an error 
(and even that only if the SELFTEST kconfig is selected). This would 
allow our CI to catch issues with patches sent to our ML, but IIRC the 
reported bug was on a kernel fork. We could disable the FW loading is 
the table for that particular blob type is in an invalid state, as it 
wouldn't be safe to attempt a load in that case anyway.

>
> For full m/m/p files, that can be done by simply tweaking the patch
> level check to reject matching values. For reduced version entries,
> the filename itself must be compared.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 27 +++++++++++++++++++++---
>   1 file changed, 24 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index c589782467265..44829247ef6bc 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -319,7 +319,7 @@ static void validate_fw_table_type(struct drm_i915_private *i915, enum intel_uc_
>   {
>   	const struct uc_fw_platform_requirement *fw_blobs;
>   	u32 fw_count;
> -	int i;
> +	int i, j;
>   
>   	if (type >= ARRAY_SIZE(blobs_all)) {
>   		drm_err(&i915->drm, "No blob array for %s\n", intel_uc_fw_type_repr(type));
> @@ -334,6 +334,27 @@ static void validate_fw_table_type(struct drm_i915_private *i915, enum intel_uc_
>   
>   	/* make sure the list is ordered as expected */
>   	for (i = 1; i < fw_count; i++) {
> +		/* Versionless file names must be unique per platform: */
> +		for (j = i + 1; j < fw_count; j++) {
> +			/* Same platform? */
> +			if (fw_blobs[i].p != fw_blobs[j].p)
> +				continue;
> +
> +			if (fw_blobs[i].blob.path != fw_blobs[j].blob.path)
> +				continue;
> +
> +			drm_err(&i915->drm, "Diplicaate %s blobs: %s r%u %s%d.%d.%d [%s] matches %s r%u %s%d.%d.%d [%s]\n",

Typo Diplicaate

Daniele

> +				intel_uc_fw_type_repr(type),
> +				intel_platform_name(fw_blobs[j].p), fw_blobs[j].rev,
> +				fw_blobs[j].blob.legacy ? "L" : "v",
> +				fw_blobs[j].blob.major, fw_blobs[j].blob.minor,
> +				fw_blobs[j].blob.patch, fw_blobs[j].blob.path,
> +				intel_platform_name(fw_blobs[i].p), fw_blobs[i].rev,
> +				fw_blobs[i].blob.legacy ? "L" : "v",
> +				fw_blobs[i].blob.major, fw_blobs[i].blob.minor,
> +				fw_blobs[i].blob.patch, fw_blobs[i].blob.path);
> +		}
> +
>   		/* Next platform is good: */
>   		if (fw_blobs[i].p < fw_blobs[i - 1].p)
>   			continue;
> @@ -377,8 +398,8 @@ static void validate_fw_table_type(struct drm_i915_private *i915, enum intel_uc_
>   		if (fw_blobs[i].blob.minor != fw_blobs[i - 1].blob.minor)
>   			goto bad;
>   
> -		/* Patch versions must be in order: */
> -		if (fw_blobs[i].blob.patch <= fw_blobs[i - 1].blob.patch)
> +		/* Patch versions must be in order and unique: */
> +		if (fw_blobs[i].blob.patch < fw_blobs[i - 1].blob.patch)
>   			continue;
>   
>   bad:

