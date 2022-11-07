Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEA261FE67
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 20:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E4E10E31D;
	Mon,  7 Nov 2022 19:14:32 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF5D10E053;
 Mon,  7 Nov 2022 19:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667848468; x=1699384468;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yGMEdAnXBi0X0SSwOKT0EBIc1jTIW4zMrgVX+N0+440=;
 b=MNPsXZ3MNVkvN3Q6Pii5RbyoV+25gbNVe27UXuMK2EDn69rZMR7L04mZ
 iznjPz3Mlq/s5pbrvrulBuj+vQhqJJKOfI5HmhRFO7XexECuawtdPm3C5
 v9//o1qcgq4ZRkJqZn1+P+7zLa7JPwKi/HQJFnHSCRljJz894fvKF6MJp
 aFIQpYWkHA08sHqrMYbMCXDKOpqrTRvxYfhye/UXnDjnvm6qOdF0nFbsy
 UjyT6EHMwaeJjL15c4XTWp9/7AmTWhsUlcZoh09GRX799ruoNS5WO3L4b
 MNaVHj044LnbuXdYXkMohEW3EVtNgQTj1tfU/zJ/cRzXY7ZkRnVah4IQl w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="293867480"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="293867480"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 11:14:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="725269939"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="725269939"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Nov 2022 11:14:27 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 7 Nov 2022 11:14:26 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 7 Nov 2022 11:14:26 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 7 Nov 2022 11:14:26 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 7 Nov 2022 11:14:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z1+03STd0+adAF/gkCgAlHrux97OAw1dti//YeHm4DZANARbCyGAy20HCz4APzSKMt6guUfCfUQwPCYJgkARMDPyKH498R8IVNTX7CqGvDHx249dhfdDn10+Cb7zAps+3zl3xdmJDkyLVoF8oCQJna4fn9fIEIayWRlKVaC1xYjo9zvr4RFIymQvjiaY+ce0+RHPmdPu+tMalactoj6LSyqTYTdkvUVAt8HqEC69ZtJ0wCxOh1QkzUBdROo6u0cukTR8vlBB0E4i44rmATKOIkadZPw3EEIh/myFpphoQVgj9t4CwbdElwhLP4uN4XT4fnJhMSL6eaqeL8AdG2ze8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+HdHcdGzlZZVNe8W5t4cJebjY91fHFVJ8whY+IYGU3I=;
 b=UohxT3/i15uGZi103SSXi9kj3jNWrUwNqRKf5n83XEYMdUBAlCg6fF5qVuEXsSiJfn4DzzvDHsyqryWSLUKvu+griGnkDBPayIiESwzk98x3tw0sK4EnXt6hWXu1jHDQhBBLArHUr3lGHRjjufKUzI8RXNkboA49lMTG3Qo/6pCZFgRKcqaLKwWZVV5BDcNYMnFByd+vJeIv2IoEtRhb9KHQfD914rL5Ehug+itIQCzkIiKCDxUTWi7HkjfPKIQOFkRWwMk/F+xAOLnyL64P3SrTEAtH7mYI5W1fduff2L3UtrCEbbD10E9udQgdnyQE2YnhLULIsvBHASEJj0rpKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CH3PR11MB7297.namprd11.prod.outlook.com (2603:10b6:610:140::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 19:14:23 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036%7]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 19:14:23 +0000
Message-ID: <2583bccd-82fd-967a-aec9-e6d3837dbbed@intel.com>
Date: Mon, 7 Nov 2022 11:14:20 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.1
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/gt: Add GT oriented dmesg output
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20221104172525.569913-1-John.C.Harrison@Intel.com>
 <20221104172525.569913-2-John.C.Harrison@Intel.com>
 <6a4d1ac0-a1a0-e1d4-7d83-54b43d226371@intel.com>
 <fabaf9ee-f3fc-c18f-56b3-6d073618da41@linux.intel.com>
 <82055e8f-9bee-2b03-3dce-dcf66c30c903@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <82055e8f-9bee-2b03-3dce-dcf66c30c903@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0001.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::14) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CH3PR11MB7297:EE_
X-MS-Office365-Filtering-Correlation-Id: 842ed440-6e51-4e0d-cf20-08dac0f44779
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v3pQUZgoH2k74GGHa25di4XejeraUPcMGGhWYRpIBG50igUbl3HzFHOsvpC1zNqoCGceKVuQ3Tp2glkUB1M00a7QfZLSbZMSHvc0k3xZzEiwA4QPVf4KXPKGztWaXMwuS0GJI6ZgqzzF+KAs5bABQ+37Qa+H5NjrHMe0pfzCYN5/r/dNWzt3vrC6icja1DXCow+ecv+1xDgQ+oaZTCapi58nlinQw/MPgQ3M/ffEplKPPNLxlG5B3ATUURRSg1+rna4/LI5gqvrr1JGfBeNuuZL/KdB282hoeEI8+uSCzBRWyWkcMTZkYcQE+5j7R7/ah/z3vM0Tl6R6yq46Zmhoo+2mgs1kELt1sP9ARBiTctd48Na/Py09L+XceyRgmr3HrPMIbLfdp5UNUnbTx0CDylhniOhKwKzUN4fJOvk7eLSI3SYlGwpoJNPSHNeQbtU9zsHOuxsPa2FFBmV8Hg6dWkQM6hGm0g4aTXEML5BcGydehoFpWRlaCT2KPpbalkZPZdtS9mdbupssFEqk1VIsiFFF/3HreomnO9PMW3TP3rh0I2Gr+sCb87QlMFglvY3D2WOffeAbm19a7pu6QuklB9AVz4DGOGSCxoZIyLD//FxE31rReELNwBl41E/nUibEYkxnJ7t/BETnnZNRWgYg9/3FKAVeN0CKWgfqve3n4Q+E3QWwlrF+94KKSokwGci5VZnNvevHFxkM2lm2NoC8c0r5PNEXnQNCbnTq2xlJMWvO2fLjdMcOF08hFhgPphym7pLCNmDCEH09tmgT+iO2irMs9R/Evy2GbFWxpH9Df8eOvGJtC9Wafm79eBq9PXdu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(346002)(376002)(366004)(136003)(39860400002)(451199015)(31686004)(6486002)(478600001)(82960400001)(316002)(54906003)(110136005)(2616005)(2906002)(5660300002)(53546011)(66476007)(6506007)(4326008)(8676002)(36756003)(66556008)(66946007)(38100700002)(41300700001)(83380400001)(8936002)(26005)(31696002)(6512007)(86362001)(186003)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVROVkphR29GTzRSK0ZzdithU053Y3plR0pvQU1VWE1RY3drbkJ3eUVDRjdX?=
 =?utf-8?B?dTlHNStiNGFJdFU1UlZLeDV1UjhJWW40bysyekttMjI1cHc4RFVZSmlmbnJP?=
 =?utf-8?B?ZmNUTDU0MnVGcVN5QkVSOFBJcnpBUGNDRFZ6NjJrVGtBamRYOVRLSExCOHhT?=
 =?utf-8?B?U2N4Y2lyY0xiWGE2ZU9OWXNxZlhQMk83ZEZyT1FDV00wVWYzWnJaaktTcFNw?=
 =?utf-8?B?UnhrUEZWVHQvV3NqMGQ5aDc3L0dMOG1uUjNkOGMvSjk2RCtEZEJidGFBbm04?=
 =?utf-8?B?eDZXeXhwTExRb3pFZFp0dHY5cElXY1RRQ2dTbXBGYmZISTNYOTFwb0dnNWxq?=
 =?utf-8?B?ZkNDVXVPQlJLbkVWc0p1ekdBV09pT3VLa3Z0bVVKMUE0clZOeVpRdW1PYmEw?=
 =?utf-8?B?UlloSE9nRUFtMlFPbkxVdGY5V2xCelNLMzVndWxFLzN3NkhJNVFrR3hiRVhN?=
 =?utf-8?B?cW1kU0wrTzVUR0NVTG1pMkRiQjRHenYwdTYyc01GV3I3aDRjZ3E3ZVkrRWov?=
 =?utf-8?B?cWc1WHFVdmd6dTVLc3NBSFhLUVN0N2hRci8vZnJSMzRiU2JicDFvT3RucUw4?=
 =?utf-8?B?RHpSNTJpcjNpUkxBZXJSUHp0TkhGS01wL0h2c1pPUnJRQzJXQlJZRmZTL3hZ?=
 =?utf-8?B?RVd0NjIxUkJCSzROUndSYjNHZGNaWTdOUDNNVnowYmdxbklLTGZEZUdqS0U5?=
 =?utf-8?B?VXFuemxmUHZpd25GQ2NnN1dtMFlHSmxWMjdkeXE4dk1DemhPOUMrVmJjTDkz?=
 =?utf-8?B?NlJQdlZtb2VhR1BJVHVtcjRCU0dhYjNVaDAzdXZJY0hNakhvNk9Hd2hhMXpG?=
 =?utf-8?B?cENSbjNSbGhIbXM2bTlTcmQyeVoxK0xFV3JHdm5aYXFZYjhRTW1aOUZZT25x?=
 =?utf-8?B?RG5RaW5pWGt4UE56WG1FMzhNMm42RnR2YkNGNWlEU011Tm4wcEl2S0ZEQlNX?=
 =?utf-8?B?cFY1MnhwMjZZeFRrMTNMMS9ETGVuS1dxUUVxZ1U5ckRhUWVZUXVjaVF3d2xH?=
 =?utf-8?B?WFZqQ0ZkNGszd2M2UDNUY3d6NXlHdkNNT3JHRFkwblI0ZjNCdlFXL2xXM0pS?=
 =?utf-8?B?dXY5aVk2cjMwSnZOZ3Q5OG93S20zTGRNWC9pNWlJRHl6R0xtTTFHVTVEYXIy?=
 =?utf-8?B?TjBRdDFiRXBSMUcxV2pVSDhZeXI0aFFVNUtjdGozcGdkSVdvWkVwcy9jWU5R?=
 =?utf-8?B?d0R3VktBYk9pTjFXcDIvenhRRTJsTE9DNHpLQlRxL2FRMlM2b1ZLRUgwMUZH?=
 =?utf-8?B?VG1PZkgxWGdyMDdDbXFNdWlhYTdZODZHZGp1ZEVzSXVUdUtwd2dibzJ3enRx?=
 =?utf-8?B?MXpVd1RwNzhnY3V1OEF4VWpXUzNSeUUzWXFRdHhQUlBBanJmSzQyYzMzSnd0?=
 =?utf-8?B?RHZoUkM2SzV2S3o0eHBtNmsxTXV1MU43dGJhS1N0Tm5SazBNa0dMeHQ5K0J0?=
 =?utf-8?B?REw4NWd5enRub2ZmZjdNNU9reS9hektHZXcvdUxxd0NCVElrYUtZWElwTUtq?=
 =?utf-8?B?R09HUytsSkpFUlRYZ0xNVjRreTNTMEYrbTg1d3RuOWliVHFWME9wYmhta0ZL?=
 =?utf-8?B?SWVmZXkzbFV2YStZdDlZTjIvWm1EUzU2c2NlbzJtcDlKc1RURHIzRVVkdnNs?=
 =?utf-8?B?b2Q1S2U2bnNxYWd4Ty8rZ1VGdVRGUmUrZUJwRnJqaTdseFgwS1pXNTJDMlVJ?=
 =?utf-8?B?ZlJscUxtU3lpRCtNbmU5SUVEaXdDbTlNTlZWckMwSnI2WC9RRThCbnR3Zk4y?=
 =?utf-8?B?WlZZSE9JNWhkRk9PRU5zWDJQSjFQdkxxZWl2YkY4cEMxajlxNkh4K20wM1lR?=
 =?utf-8?B?RU1UK3I5RCsxV1RBNW9wMFIrQmJWeXBPeVB4RnNXYzU3d09CeUxSbXZJZnZj?=
 =?utf-8?B?cTdsMFBYbzc2T0VpZllQaUJFZlVXNWJwVTE5cWZQbjlqc0xMOGtMdkl0RFJP?=
 =?utf-8?B?aUpEaXRXQXV4RmJFVHhIZk9FbnNBbURzVllFM3FuRUU5aDF6czVWSGxPYndU?=
 =?utf-8?B?RU1jMVFZWWxtb2xpQlBTTldtcHlQWllocnlMS2JZKzhmVWlhSEFqanBIQlpN?=
 =?utf-8?B?L083OURaSDFZSjRHcm1JNVFMNkIzQlFIU2JyVjZUMEZxUXlKZ1dUaHBET0lO?=
 =?utf-8?B?OHY0cjlQVEg0ZVRtVmhpQUM5bEJ4TUMzdUtmaUVBSm40UDJPV3F0dlVwdVNr?=
 =?utf-8?B?eUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 842ed440-6e51-4e0d-cf20-08dac0f44779
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 19:14:23.1471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LrXxxyUIgSkncji/Oyp8L+QcRVDDJdrf26EQx8OoX1IZAMsPsZQqEfqWR5VjnHumB5Hjxl/kmlQ8JoMjhg7M66HQG4Y81ULFiGKMJOSWqsw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7297
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
Cc: DRI-Devel@Lists.FreeDesktop.Org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/7/2022 08:17, Tvrtko Ursulin wrote:
> On 07/11/2022 09:33, Tvrtko Ursulin wrote:
>> On 05/11/2022 01:03, Ceraolo Spurio, Daniele wrote:
>>> On 11/4/2022 10:25 AM, John.C.Harrison@Intel.com wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> When trying to analyse bug reports from CI, customers, etc. it can be
>>>> difficult to work out exactly what is happening on which GT in a
>>>> multi-GT system. So add GT oriented debug/error message wrappers. If
>>>> used instead of the drm_ equivalents, you get the same output but with
>>>> a GT# prefix on it.
>>>>
>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> The only downside to this is that we'll print "GT0: " even on 
>>> single-GT devices. We could introduce a gt->info.name and print 
>>> that, so we could have it different per-platform, but IMO it's not 
>>> worth the effort.
>>>
>>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>
>>> I think it might be worth getting an ack from one of the maintainers 
>>> to make sure we're all aligned on transitioning to these new logging 
>>> macro for gt code.
>>
>> Idea is I think a very good one. First I would suggest standardising 
>> to lowercase GT in logs because:
>>
>> $ grep "GT%" i915/ -r
>> $ grep "gt%" i915/ -r
>> i915/gt/intel_gt_sysfs.c: gt->i915->sysfs_gt, "gt%d", gt->info.id))
>> i915/gt/intel_gt_sysfs.c:                "failed to initialize gt%d 
>> sysfs root\n", gt->info.id);
>> i915/gt/intel_gt_sysfs_pm.c:                     "failed to create 
>> gt%u RC6 sysfs files (%pe)\n",
>> i915/gt/intel_gt_sysfs_pm.c:                             "failed to 
>> create gt%u RC6p sysfs files (%pe)\n",
>> i915/gt/intel_gt_sysfs_pm.c:                     "failed to create 
>> gt%u RPS sysfs files (%pe)",
>> i915/gt/intel_gt_sysfs_pm.c:                     "failed to create 
>> gt%u punit_req_freq_mhz sysfs (%pe)",
>> i915/gt/intel_gt_sysfs_pm.c:                             "failed to 
>> create gt%u throttle sysfs files (%pe)",
>> i915/gt/intel_gt_sysfs_pm.c:                             "failed to 
>> create gt%u media_perf_power_attrs sysfs (%pe)\n",
>> i915/gt/intel_gt_sysfs_pm.c:                     "failed to add gt%u 
>> rps defaults (%pe)\n",
>> i915/i915_driver.c: drm_err(&gt->i915->drm, "gt%d: intel_pcode_init 
>> failed %d\n", id, ret);
>> i915/i915_hwmon.c:              snprintf(ddat_gt->name, 
>> sizeof(ddat_gt->name), "i915_gt%u", i);
>>

Just because there are 11 existing instances of one form doesn't mean 
that the 275 instances that are waiting to be converted should be done 
incorrectly. GT is an acronym and should be capitalised.

Besides:
grep -r "GT " i915 | grep '"'
i915/vlv_suspend.c:             drm_err(&i915->drm, "timeout disabling 
GT waking\n");
i915/vlv_suspend.c:                     "timeout waiting for GT wells to 
go %s\n",
i915/vlv_suspend.c:     drm_dbg(&i915->drm, "GT register access while GT 
waking disabled\n");
i915/i915_gpu_error.c:  err_printf(m, "GT awake: %s\n", 
str_yes_no(gt->awake));
i915/i915_debugfs.c:    seq_printf(m, "GT awake? %s [%d], %llums\n",
i915/selftests/i915_gem_evict.c: pr_err("Failed to idle GT (on %s)", 
engine->name);
i915/intel_uncore.c:                  "GT thread status wait timed out\n");
i915/gt/uc/selftest_guc_multi_lrc.c: drm_err(&gt->i915->drm, "GT failed 
to idle: %d\n", ret);
i915/gt/uc/selftest_guc.c: drm_err(&gt->i915->drm, "GT failed to idle: 
%d\n", ret);
i915/gt/uc/selftest_guc.c: drm_err(&gt->i915->drm, "GT failed to idle: 
%d\n", ret);
i915/gt/intel_gt_mcr.c: * Some GT registers are designed as "multicast" 
or "replicated" registers:
i915/gt/selftest_rps.c:                 pr_info("%s: rps counted %d C0 
cycles [%lldns] in %lldns [%d cycles], using GT clock frequency of %uKHz\n",
i915/gt/selftest_hangcheck.c:                   pr_err("[%s] GT is 
wedged!\n", engine->name);
i915/gt/selftest_hangcheck.c:           pr_err("GT is wedged!\n");
i915/gt/intel_gt_clock_utils.c:                 "GT clock frequency 
changed, was %uHz, now %uHz!\n",
i915/gt/selftest_engine_pm.c:           pr_err("Unable to flush GT pm 
before test\n");
i915/gt/selftest_engine_pm.c:                           pr_err("GT 
failed to idle\n");
i915/i915_sysfs.c:                       "failed to register GT sysfs 
directory\n");
i915/intel_uncore.h:     * of the basic non-engine GT registers 
(referred to as "GSI" on
i915/intel_uncore.h:     * newer platforms, or "GT block" on older 
platforms)?  If so, we'll



>> Then there is a question of naming. Are we okay with GT_XXX or, do we 
>> want intel_gt_, or something completely different. I don't have a 
>> strong opinion at the moment so I'll add some more folks to Cc.
>
You mean GT_ERR("msg") vs intel_gt_err("msg")? Personally, I would 
prefer just gt_err("msg") to keep it as close to the official drm_* 
versions as possible. Print lines tend to be excessively long already. 
Taking a 'gt' parameter instead of a '&gt->i915->drm' parameter does 
help with that but it seems like calling the wrapper intel_gt_* is 
shooting ourselves in the foot on that one. And GT_ERR vs gt_err just 
comes down to the fact that it is a macro wrapper and therefore is 
required to be in upper case.

> There was a maintainer level mini-discussion on this topic which I 
> will try to summarise.
>
> Main contention point was the maintenance cost and generally an 
> undesirable pattern of needing to add many 
> subsystem/component/directory specific macros. Which then typically 
> need extra flavours and so on. But over verbosity of the 
How many versions are you expecting to add? Beyond the tile instance, 
what further addressing requirements are there? The card instance is 
already printed as part of the PCI address. The only other reason to add 
per component wrappers would be to wrap the mechanism for getting from 
some random per component object back to the intel_gt structure. But 
that is hardware a new issue being added by this wrapper. It is also not 
a requirement. Much of the code has a gt pointer already. For the parts 
that don't, some of it would be a trivial engine->gt type dereference, 
some of it is a more complex container_of type construction. But for 
those, the given file will already have multiple instances of that 
already (usually as the first or second line of the function - 'intel_gt 
*gt = fancy_access_method(my_obj)' so adding one or two more of those as 
necessary is not making the code harder to read.

> code is obviously also bad, so one compromise idea was to add a macro 
> which builds the GT string and use drm logging helpers directly. This 
> would be something like:
>
>  drm_err(GT_LOG("something went wrong ret=%d\n", gt), ret);
>  drm_info(GT_LOG(...same...));
Seriously? As above, some of these lines are already way too long, this 
version makes them even longer with no obvious benefit. Worse, it makes 
it harder to read what is going on. It is much less intuitive to read 
than just replacing the drm_err itself. And having two sets of 
parenthesis with some parameters inside the first and some only inside 
the second is really horrid! Also, putting the 'gt' parameter in the 
middle just confuses it with the rest of the printf arguments even 
though there is no %d in the string for it. So now a quick glances tells 
you that your code is wrong because you have three format specifiers but 
four parameters.

Whereas, just replacing drm_err with gt_err (or GT_ERR or intel_gt_err) 
keeps everything else consistent. The first parameter changes from 'drm' 
to 'gt' but is still the master object parameter and it matches the 
function/macro prefix so inherently looks correct. Then you have your 
message plus parameters. No confusing orders, no confusing parenthesis, 
no excessive macro levels, no confusion at all. Just nice simple, easy 
to read, easy to maintain code.

>
> Whether or not to put the gt as parameter to the helper macro or 
> outside wasn't really decided upon. Anyway the macro would be adding 
> the magic "gt%u: " prefix, drm device and all.
>
> Also the name GT_LOG (or case) is just for illustration, that part 
> wasn't really discussed.
>
> If agreeable this pattern could then be used to consolidate some other 
> macros that we have. Although apart from CT_DEBUG/ERROR I don't know 
> if we have any others.
By consolidating as what? I hope you aren't meaning something like 
'drm_err(CT_DEBUG(GT_LOG("msg")))?'

John.

>
> I hope I have transferred the idea correctly. Please shout if I have not.
>
> Regards,
>
> Tvrtko
>
>
>> What I'd would like to see tried is to converting all of i915/gt 
>> within one kernel release so we don't have a mish-mash of log formats.
If each subsystem's team would like to convert their own section...

John.

>>
>> Regards,
>>
>> Tvrtko
>>
>>>> ---
>>>>   drivers/gpu/drm/i915/gt/intel_gt.h | 15 +++++++++++++++
>>>>   1 file changed, 15 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h 
>>>> b/drivers/gpu/drm/i915/gt/intel_gt.h
>>>> index e0365d5562484..1e016fb0117a4 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
>>>> @@ -13,6 +13,21 @@
>>>>   struct drm_i915_private;
>>>>   struct drm_printer;
>>>> +#define GT_ERR(_gt, _fmt, ...) \
>>>> +    drm_err(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, 
>>>> ##__VA_ARGS__)
>>>> +
>>>> +#define GT_WARN(_gt, _fmt, ...) \
>>>> +    drm_warn(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, 
>>>> ##__VA_ARGS__)
>>>> +
>>>> +#define GT_NOTICE(_gt, _fmt, ...) \
>>>> +    drm_notice(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, 
>>>> ##__VA_ARGS__)
>>>> +
>>>> +#define GT_INFO(_gt, _fmt, ...) \
>>>> +    drm_info(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, 
>>>> ##__VA_ARGS__)
>>>> +
>>>> +#define GT_DBG(_gt, _fmt, ...) \
>>>> +    drm_dbg(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, 
>>>> ##__VA_ARGS__)
>>>> +
>>>>   #define GT_TRACE(gt, fmt, ...) do {                    \
>>>>       const struct intel_gt *gt__ __maybe_unused = (gt);        \
>>>>       GEM_TRACE("%s " fmt, dev_name(gt__->i915->drm.dev),        \
>>>

