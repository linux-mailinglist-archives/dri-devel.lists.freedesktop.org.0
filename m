Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F4B6E80BA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 19:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D68D010EA37;
	Wed, 19 Apr 2023 17:59:42 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722B410EA39;
 Wed, 19 Apr 2023 17:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681927180; x=1713463180;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X9yks9IkeilYjoxcySGBkgBHlw7AuHUtw7u/vYKq6Qc=;
 b=UfPqNiFh0/BAFMJ8LgiwdUKUxdDGmTVoFZVCU/NnoHe6RRDk4Q6cSV8q
 T3yT41iC2JK1duLwiEjbX9ehUwxveyA3PcP5cwgxm1xLVL2tmpfcYbDPg
 +N502YGX+l8s7dsyBZqQaKOWlp/+C9BppcNtNoFumjlip5cHugxn9ofSS
 d7pVsHJGYXdRfylfE7kl+aLvZcDkcPfcj9WJahwG5f7ee4/gJjHnMr93d
 lDBYPWkUQyHKW6TyQvmWzSy7UgxwHaQCdMImZG1X+KCYM3mQ+L0U0L+wY
 S9cZymrTMex4QASXbsNjc1DkD26teAnhWgpmx1Kab7IpvU9VPCbzfm12A g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="348271951"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="348271951"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 10:59:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="669058800"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="669058800"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 19 Apr 2023 10:59:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 10:59:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 10:59:38 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 10:59:38 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 10:59:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nfGuxH3nEgt0qyc2K6gbek4rLuu619lf3pxavzNgMKXT5krlsr3wqScjwpDJ0kHsZ5o7ulNpUMWfkCD9/0R1kqYjVG3nbCOIltZBqsAz2/+Q6kJ8MSBsTQlcIln22JLrSIpwXMK2C0s1lVnjFvBsKdeHEOUGP0ORpcqZWkJI1AHLSshPXcn08O4GninYUwnX59tvMc6nbojLSd6rOWSQPO0DNUMWoLjiSZ9pKf/6jlrHVlbNOHDq9aU3I8MaN7Tr0nYQ0Hh3poDN9AG+R1WGh4I4YfyK1AQ7313B4ZPRwoLDNPPBWKzP+vJJ5XIirardt+SRGnqU/7QLgtVTug5vWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8T9Bq+543KF+E8JGuO/oa30/FIrifcSXfh2ZPHuU08=;
 b=bsTF0gyrYvtvXKUHQ7sxGe9NYwApzFvdqJv0ZiNvyBwgGfMykPS7Am3YfxrkVw9w8LurWZKa5KvaMkno5YmaUThz8gnnLvqJ78WEvxgJtr1TRsgouHBB1H1FYcps6XKcf6rHsq2KGZmt8tAiN1402hYahCc8Ql9c1rexPELcnsK/JPGuriHGt+Q/LFEh352BuIuJk624Oii27zMAP594v2LS9i0QaKMGa+5KfeSPTgZLSRKc4V1PyTzNDcveKzIABLeqPM/yA/rSfpq9NhUTT4dy6YybuAAKCOnrPBXUrszdEu0HzkOGDefg/4d067tZZK6xYlzgTCGfHScnHeOTcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB3908.namprd11.prod.outlook.com (2603:10b6:405:7d::13)
 by DM4PR11MB6310.namprd11.prod.outlook.com (2603:10b6:8:a7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Wed, 19 Apr
 2023 17:59:36 +0000
Received: from BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::7b09:91d7:6e26:5833]) by BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::7b09:91d7:6e26:5833%2]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 17:59:36 +0000
Message-ID: <688259d2-d29e-439f-44e7-7dca1a3f7037@intel.com>
Date: Wed, 19 Apr 2023 10:59:33 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH 5/5] drm/i915/uc: Reject doplicate entries in
 firmware table
Content-Language: en-GB
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230415005706.4135485-1-John.C.Harrison@Intel.com>
 <20230415005706.4135485-6-John.C.Harrison@Intel.com>
 <ff39e6ca-4ee6-149e-e0ba-13490306c577@intel.com>
 <c3632e2e-c064-d3f6-a68e-c77a662b1d2c@intel.com>
 <2cd1381b-10c6-f5ce-e868-39615d24280c@intel.com>
 <f102d291-6284-52aa-a92e-7b911e9470b1@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <f102d291-6284-52aa-a92e-7b911e9470b1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::23) To BN6PR11MB3908.namprd11.prod.outlook.com
 (2603:10b6:405:7d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR11MB3908:EE_|DM4PR11MB6310:EE_
X-MS-Office365-Filtering-Correlation-Id: 87ada0dc-111f-4f72-4d04-08db40ffd695
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LL/5FAd4OKxi5p6IzWY3RhS8EjKhgrVXg7B3ZW1UVy+V+k79iXRXur7zs2OnXofdFz+WdXiVjo5Dlw8s4IS+xol9OyTvIpw+B99FAc4it7N1PXxyjiBjhSWzFmd3ZQccRN8TrFMlXlYzfOpMUsD5I0+kJ7E4vNgIzj8/5QfnsarayNxSdvC/pQxG0kQbAIfYIESf46QWrRuJ5emwwLoRXTWnA8sW42gdL6atRA3qatQuoFFnT4Cv7ew0sZIWBgaL9dERzbiRVuml5OyQtU8WZuBuK1LzaGl/IbS0Z9g9HdexbK9tI/SktqZmpi0zhGwHcPkDKHwzlACL/wpYJszBKxVVoc1Qk0/fwB60sfK2cbey9saVKeGZvPb+kf7h7+nLh2NmlWGdiYlMTlitTb54cHyBuyATrc4o0lRdYdOe11FR2EpK+upB76+oWkBZFWg3RwOdU66eTiTHj+bLBcYKs+XpplVPBCGBhQWs12BGCw6Mu3npRk5pWFqj/5J8gv7YB+Igq58V2xHc9e9AESOTt0cu8kClIAdGSQQL+2IA3HFgPM9yeu3w/LGVHiEZ/myiYAX78+QdOC4+ohK9zL6VHIbVk8chpNveU+kLmUr23uZvGO4pYE1dETRusu3pamyjG/1G/oyZYOJBSeygqWN1/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB3908.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(136003)(366004)(396003)(39860400002)(451199021)(2906002)(8936002)(38100700002)(8676002)(5660300002)(36756003)(86362001)(31696002)(6486002)(6666004)(6512007)(6506007)(26005)(478600001)(2616005)(31686004)(83380400001)(53546011)(186003)(316002)(4326008)(82960400001)(66556008)(66476007)(450100002)(66946007)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enBHMzRjekdubXdtemI4c0xxcG9EZ21BbUdqWXNNbXNuaCs1NXBvUkhMY2di?=
 =?utf-8?B?L29CbGhuZGx2WUlNaUlid1NMOG5iL2VKWnpzL3k1TjFSK1hqSDRGSVJhTWZi?=
 =?utf-8?B?NGkxYWRNbmJTUUxmRmhFVnRWYUpPdnYrUUNMWHNtQXFsTGlsTU9NVnhxVnlw?=
 =?utf-8?B?N1ZLazFEbm9MQndoU0FNeWwxOFFYRDBjVnBwQzFYUUJ2Zm1mdHdGb0xvMHFH?=
 =?utf-8?B?YmtzUThaZGpmY1FCMEl4dURrTFJvOGloSW5nRDlqTEU4N2hvbXVVTkRsZ2M4?=
 =?utf-8?B?VDBTb0VaTnFZSkFFODF5cmlGZG92Ull2NDJQemNUNnFnUElZTTlaR1kydVNV?=
 =?utf-8?B?NFZTakU2SHlNaVM1clF3aU82dVZ0WDQwNElPWlN2MDdCSUxyY2VxT045bGgw?=
 =?utf-8?B?U0dta1h5V0lMV2ovdWdEV3UvV0paZjV5ZllQRjZIb0Q0MVZWMjVzNkhoZjlM?=
 =?utf-8?B?cm1QaGtCd3Myc293QzliNE0zRDVETWdOMVB2SlZVbnc3SXZ3Vm83NU9kbUxu?=
 =?utf-8?B?SmlVWmZVeFExVWNSemN2ODAwR2tRWktPdlpTWTU1RFVHZWRtWC9nVkFOY3M0?=
 =?utf-8?B?ZFZGMmMxbUVXZkVHeFJtMFE1bXlmN0ZjeU1CY2NwMXlOMnpVbW1wekZjVFZo?=
 =?utf-8?B?VStoM1BkZjRvSkgzUXFxWXlyMmJuYmh4U1p4QW5aMTFqSzFwRXkwQkR6bk9O?=
 =?utf-8?B?WFk1bGpRL0hhNFBDV2xVWmY4aU5kODludXZLelFUTWRWRHVjc3JaZE9YN2or?=
 =?utf-8?B?RHBaamZSM3FFSDRDVFZZSlExT2ZhR0FHZ1VFTEp1TGRUd1QrMWkzMVJ2M3RM?=
 =?utf-8?B?WDZiOEFDWXhhdHZ3WHFtNUl2d2N0ak9KZGhFU094Vk1sMGhpQVVLd1pWQ0lp?=
 =?utf-8?B?TGszOFg0QWNMdEViRHFvcWdyNVZjME0za2V0RFVCd2hxejg0RmxXcFRXdDBK?=
 =?utf-8?B?V1NibkdYNm5nUnQ1SzhVV21yZnYyWmozbkdyUlFwOEdKU0t1YWNscUIraXYx?=
 =?utf-8?B?aG9TbUlFTWRUZEtXTzRMVDdySncvdkRYMHVFdUVwcEVNSW9qTG45ZU16eVRp?=
 =?utf-8?B?YmVrSnBFcC9TK2RSNWg5UGNucmJRTWVrWW9MNktXNkFZTFYwT25xN1J4ZmEw?=
 =?utf-8?B?ZnpkSlFER1Nxc2diZThDYVJKQUxudG9GakJXaVhDUGJjcXoxY3NWVlQ0TFpZ?=
 =?utf-8?B?c3pxOFpMWUNtYW1hSVFYUG5tTGdIN0xVU0ZYNVRZR0gzbG8yTUtWak9OUUF2?=
 =?utf-8?B?UVh0QmZxU0IzcXI1a0lLVHJLclVpamJ0OWcxR0FFMGFCUkFBU3hxcnQvU3Ur?=
 =?utf-8?B?MFgwVHI2UGNpQWtwaHd6aFgzVjJ3SFp5ZlpWb0w3LytUaFZEYTJpbGllblYr?=
 =?utf-8?B?cmRlTzN2S0daVW1rM1JSbk9oZ1UxYmZQR1ppcTlRcmZLbXZxWU1HYUJrM0I4?=
 =?utf-8?B?WnU2Q0xKNDJsUWppYW5MUU1VSEgwZmpKTHZ6RjFuMzR3TW5STUdySE9sZGNp?=
 =?utf-8?B?QStxbEp3bmRZbnhMRFB6aWlmWHlUUHduSDZrN2JpU3hUdmJHNUNiOUhQYXNr?=
 =?utf-8?B?eFdrUHlJYjlWbWxOa0ltV28xdUdkeVhvUGcyQTI2TklXTjlGZ0NneDlNZkdI?=
 =?utf-8?B?WTRybzl2VHU0Q3FLRm05N1hsd0p6THNNS2cyYnY5clp0cFlGV3llb1Mxamgw?=
 =?utf-8?B?bGN2cE05Q0xzYjE0TEhXZzhCMWZITTZnY1hWMzU3NG9nTmlMZGd4blR1Mktq?=
 =?utf-8?B?RytYaS9IRUE0di9pZitHd2JqbmFObU9YaUpjdTkvbVBPd0o4YnJweis4K0tL?=
 =?utf-8?B?Q1dQTS9pZjc1SVkxZFVLOXd4OHJ2UDE2dmUrQUxBTzE0ZnRxTStOVjZpa1hl?=
 =?utf-8?B?ajc1ZnhzL2dkOVJHU0NBVzhVMDk0QXRpTjBvSEVmNUNWb2JubVNWdkJBZlgx?=
 =?utf-8?B?VnVTY1U5VS9ZbGJnT0NXaFZSeElUYWFRazkwa0FFNFVFZGxLV0M1ZTAwTThX?=
 =?utf-8?B?bndRRWlmOGZsSXdmYVFVOGV3MDBpdVZoTFhucW93Si82TGV0aENBMjd6Ryta?=
 =?utf-8?B?Z2sydlI0ZzJUcmtOV3RjRGYwLzBzcHZhUjlMR2tteVROSUZXc0RNdVU1cFJJ?=
 =?utf-8?B?MmVFb2dpOVJQUldXK1dxSTcvOWtMangvUmNQSXlqOHRucFlSWUdIWEhmWDhD?=
 =?utf-8?B?cmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87ada0dc-111f-4f72-4d04-08db40ffd695
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB3908.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 17:59:36.6242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ffO/CtNgC9MnQefaVPZpID04PKKtQAAsulwootCammdvpC65pY+qsdL9I36D8Uj0KnCjFsA81/8ENrchs6CTugRnGmvrUULNbBXYJnnYmlg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6310
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

On 4/19/2023 10:33, Ceraolo Spurio, Daniele wrote:
> On 4/19/2023 10:12 AM, John Harrison wrote:
>> On 4/19/2023 10:02, John Harrison wrote:
>>> On 4/18/2023 16:24, Ceraolo Spurio, Daniele wrote:
>>>> Typo doplicate in patch title
>>>>
>>>> On 4/14/2023 5:57 PM, John.C.Harrison@Intel.com wrote:
>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>
>>>>> It was noticed that duplicte entries in the firmware table could 
>>>>> cause
>>>>
>>>> typo duplicte
>>>>
>>>>> an infinite loop in the firmware loading code if that entry failed to
>>>>> load. Duplicate entries are a bug anyway and so should never happen.
>>>>> Ensure they don't by tweaking the table validation code to reject
>>>>> duplicates.
>>>>
>>>> Here you're not really rejecting anything though, just printing an 
>>>> error (and even that only if the SELFTEST kconfig is selected). 
>>>> This would allow our CI to catch issues with patches sent to our 
>>>> ML, but IIRC the reported bug was on a kernel fork. We could 
>>>> disable the FW loading is the table for that particular blob type 
>>>> is in an invalid state, as it wouldn't be safe to attempt a load in 
>>>> that case anyway.
>>> The validation code is rejecting duplicates. Whether the driver 
>>> loads or not after a failed validation is another matter.
>>>
>>> I was basically assuming that CI will fail on the error message and 
>>> thus prevent such code ever being merged. But yeah, I guess we don't 
>>> run CI on backports to stable kernels and such. Although, I would 
>>> hope that anyone pushing patches to a stable kernel would run some 
>>> testing on it first!
>>>
>>> Any thoughts on a good way to fail the load? We don't want to just 
>>> pretend that firmware is not wanted/required on the platform and 
>>> just load the i915 module without the firmware. Also, what about the 
>>> longer plan of moving the validation to a selftest. You can't fail 
>>> the load at all then.
>> Actually, forgot we already have a INTEL_UC_FIRMWARE_ERROR status. 
>> That works fine for aborting the load. So just go with that and drop 
>> the plan to move to a selftest?
>>
>> John.
>
> I do actually like the idea of moving this code to a mock selftest. 
> Maybe just add a comment above the tables making clear that duplicated 
> entries are not allowed and will break the loading flow?
The point is about accidental breakages. The 'issue' was not an actual 
failure but that a failure could potentially occur if, for example, a 
patch got applied twice due to some backport error/confusion. Adding a 
comment doesn't help with that.

Given that it is trivial to return FIRMWARE_ERROR on a validation 
failure, I'm inclined to go with that for now. The validation is still 
only being done once (and moving it to _early time means we don't 
actually need the static bool at all) and the driver is guaranteed to 
not try to process a broken table and get confused. It is also instantly 
evident if a backport is broken for any reason without worrying about 
what kind of explicit testing may or may not be run.

John.


>
> Daniele
>
>>
>>
>>>
>>> John.
>>>
>>>>
>>>>>
>>>>> For full m/m/p files, that can be done by simply tweaking the patch
>>>>> level check to reject matching values. For reduced version entries,
>>>>> the filename itself must be compared.
>>>>>
>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 27 
>>>>> +++++++++++++++++++++---
>>>>>   1 file changed, 24 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>>>> index c589782467265..44829247ef6bc 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>>>> @@ -319,7 +319,7 @@ static void validate_fw_table_type(struct 
>>>>> drm_i915_private *i915, enum intel_uc_
>>>>>   {
>>>>>       const struct uc_fw_platform_requirement *fw_blobs;
>>>>>       u32 fw_count;
>>>>> -    int i;
>>>>> +    int i, j;
>>>>>         if (type >= ARRAY_SIZE(blobs_all)) {
>>>>>           drm_err(&i915->drm, "No blob array for %s\n", 
>>>>> intel_uc_fw_type_repr(type));
>>>>> @@ -334,6 +334,27 @@ static void validate_fw_table_type(struct 
>>>>> drm_i915_private *i915, enum intel_uc_
>>>>>         /* make sure the list is ordered as expected */
>>>>>       for (i = 1; i < fw_count; i++) {
>>>>> +        /* Versionless file names must be unique per platform: */
>>>>> +        for (j = i + 1; j < fw_count; j++) {
>>>>> +            /* Same platform? */
>>>>> +            if (fw_blobs[i].p != fw_blobs[j].p)
>>>>> +                continue;
>>>>> +
>>>>> +            if (fw_blobs[i].blob.path != fw_blobs[j].blob.path)
>>>>> +                continue;
>>>>> +
>>>>> +            drm_err(&i915->drm, "Diplicaate %s blobs: %s r%u 
>>>>> %s%d.%d.%d [%s] matches %s r%u %s%d.%d.%d [%s]\n",
>>>>
>>>> Typo Diplicaate
>>>>
>>>> Daniele
>>>>
>>>>> + intel_uc_fw_type_repr(type),
>>>>> +                intel_platform_name(fw_blobs[j].p), fw_blobs[j].rev,
>>>>> +                fw_blobs[j].blob.legacy ? "L" : "v",
>>>>> +                fw_blobs[j].blob.major, fw_blobs[j].blob.minor,
>>>>> +                fw_blobs[j].blob.patch, fw_blobs[j].blob.path,
>>>>> +                intel_platform_name(fw_blobs[i].p), fw_blobs[i].rev,
>>>>> +                fw_blobs[i].blob.legacy ? "L" : "v",
>>>>> +                fw_blobs[i].blob.major, fw_blobs[i].blob.minor,
>>>>> +                fw_blobs[i].blob.patch, fw_blobs[i].blob.path);
>>>>> +        }
>>>>> +
>>>>>           /* Next platform is good: */
>>>>>           if (fw_blobs[i].p < fw_blobs[i - 1].p)
>>>>>               continue;
>>>>> @@ -377,8 +398,8 @@ static void validate_fw_table_type(struct 
>>>>> drm_i915_private *i915, enum intel_uc_
>>>>>           if (fw_blobs[i].blob.minor != fw_blobs[i - 1].blob.minor)
>>>>>               goto bad;
>>>>>   -        /* Patch versions must be in order: */
>>>>> -        if (fw_blobs[i].blob.patch <= fw_blobs[i - 1].blob.patch)
>>>>> +        /* Patch versions must be in order and unique: */
>>>>> +        if (fw_blobs[i].blob.patch < fw_blobs[i - 1].blob.patch)
>>>>>               continue;
>>>>>     bad:
>>>>
>>>
>>
>

