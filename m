Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B1A52D67D
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 16:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB63C10E1FD;
	Thu, 19 May 2022 14:54:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C1A10E1F4;
 Thu, 19 May 2022 14:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652972046; x=1684508046;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oPg4CsUGSZjLRY+RA/+gOHrhi49Re/cgHt26A8b5360=;
 b=e/fwhnmnEMSqioOCwZ+0SJIJWhb7My0IZ7M51IuH0uUeyT9p73f2WKQ3
 Ki10rhW0X/F/+ldIb9L70m2D2t9IyogU3s/X2f2IGBfTYmS9bHtu4fEHa
 GLxR8eXh3kxpPojMib2RIwqbjn0rVDMiSFzuFjwpMh32t6GkJY2dukf/1
 y3xhyBn6L/AxXj2CaFKMOELpIzGdpXZH6x+S2ESxs7eMSzqkgEL0GkNIj
 229yY6uRV0i/9TyPowmQojsCdDll9aOEKLTyOGiQ/NHDzDt4+uVFs1ORY
 LZu2mFgSI9s6vyh5tczYuvhYYL2N/uCtSv4JETxrixtMR72qHocOvUv4X A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="297536128"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="297536128"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 07:54:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="818007955"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga006.fm.intel.com with ESMTP; 19 May 2022 07:54:05 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 19 May 2022 07:54:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 19 May 2022 07:54:04 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 19 May 2022 07:54:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHwM6poF2c4sXRoBnWeP2444EuXYK/OE/PEqCbzM4H97EEaBDngVqt75VTLi7HOtujEngV4dF4iHmI7NKa8/smj/2ylsrNt1cBHC7BfkRnH6W0PHL2B5twsHdzz+aAhFhLRtz5+KnC7yPSEuxJ2UxxwYVlD9g/QpH2XJVLnLDo5Wt85d7SlpG9XFHsYp41mzIEWfDQ1zJ98sWhmRsgbg9V5TSBAVeH7UcN3VMOo4VY5myPGOep3c4S7BUtVdxZx3XNwVrJ+KT1/+qu9wahlJyU0dItutqCUIypKXB+OvfMKnkjHhOKLSjxAXU7j2gTbheyQSJTp6MmYzKqFiqw5CLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KnKVNSo6QCZVJQWAzKyTdiLT59CESA65i7Zc/T3+Hj0=;
 b=XxDspcFCQgfGIuGWRJQRfqVhBM2e7Xkmsq7sJWsRBKs0xZ11vfLk/O6qCZvfHOwv6uZvwAzxUB4A7Vp4RSTMiLUpJu3H0HYrrTp2wZpSRWBVEtt+FK3cpJLxgR3mRu8jAisFzhT79SFhhftG/rYeOtXtTiBpJxJr0YIzhDjNoqJsqkIFMxz7lVbmNu2xb71LttWoocWagaIP+1i13p21v94iDuragcNEMpRfVkjpckJYdrYcGqHvZ+J3yMdpOvg66/fIYuetzUUkrgSzqjdvfFVFr2Iqce3rsa0GWKffzigqjh359CxdGqu+xcJh2TQfExDfBcd4XCi+Ia1ttRRFng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 by MWHPR11MB1679.namprd11.prod.outlook.com (2603:10b6:301:f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Thu, 19 May
 2022 14:54:01 +0000
Received: from CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::7c52:237a:52ad:9206]) by CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::7c52:237a:52ad:9206%6]) with mapi id 15.20.5273.017; Thu, 19 May 2022
 14:54:01 +0000
Message-ID: <c29bd965-eaff-5767-34a4-1eee27a7fe3f@intel.com>
Date: Thu, 19 May 2022 07:53:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v7 3/7] drm/i915: Prepare for multiple GTs
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, Intel GFX
 <intel-gfx@lists.freedesktop.org>, DRI Devel
 <dri-devel@lists.freedesktop.org>
References: <20220318233938.149744-1-andi.shyti@linux.intel.com>
 <20220318233938.149744-4-andi.shyti@linux.intel.com>
 <218ed800-d267-fc6c-2e07-233d1519f2b6@intel.com>
In-Reply-To: <218ed800-d267-fc6c-2e07-233d1519f2b6@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0175.namprd03.prod.outlook.com
 (2603:10b6:a03:338::30) To CH0PR11MB5475.namprd11.prod.outlook.com
 (2603:10b6:610:d6::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf7aba7a-dd7b-426d-2856-08da39a768f7
X-MS-TrafficTypeDiagnostic: MWHPR11MB1679:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <MWHPR11MB167924B9C6C4B2529CA40C13F4D09@MWHPR11MB1679.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L7L9iEhCsxxt6WGbMwFujf4WajCt6Y7AZbnmoYIWpTQPLXbIbYm4fnrzN065LE3CLlAeRq3iWZ5eTg6sM6q0mHqjtkXOBJClFylUBQSCDyjPTuzVU9Owm3MzpXOI21ht2fQ1HWz8w6LbpTXpoCH4G84XcOyQ5uuqqnYft4gToVeIe+CDY4AmmYuntVlh/yOUztRqpoRUWfiaU09lwxAq/eJmOhBW8B0qaPJq+4qltu5nurSEX8NUA/TDqQy/KZyNqmZjGb6p4eU0dvTEsAb2i0ByoiJ7TPZtPsFLBFflnD9pcv3/ECjN2gv2OwgoO1egH14tK55ZbZKNfUX8Mind9Lp8YOMKOvEJanRC/XKz3kVdVxIY/dN4JsWsKPGnkV4nlMK9ZJR9gpmSvSyohIB2wvGFNVsjSwvljuQvm6Y4u3e/FlHln/aZ2f4UHOFXgo6jgz5V53Bxxx0BoDDjTQpQGT+bBC3IArQgWrNUD+W0bVdX4vxxAqvFvcg4psqvFrUNWxxHSGJibohgpkm7rWEANS+6Gk/wV8TDrCCg6Ojg/UFZWjdlb4UlwbLtsrJahlSPJtAWwfqaFKII0f0g6AAx/9rTfrKWUEp4Cn8cc4rFlleT9eVV5SzKjWx6fZqA7Kk0KrfaY3j5HWzJhCZw4KNuwulqVX3I5nlC/cI3e7dDguXs9WLW4CM4gsuocEdyB7wX9tlqZwZQNQdbEQzigfX6ivqMVEAsYqkHpZXXPNEQWpA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5475.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(186003)(82960400001)(83380400001)(6506007)(6486002)(53546011)(6512007)(26005)(5660300002)(2906002)(30864003)(36756003)(31686004)(508600001)(2616005)(86362001)(6666004)(31696002)(8676002)(66476007)(66556008)(54906003)(66946007)(4326008)(110136005)(8936002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M05MS2licktRLy9YOUh3REpwRE5VZEpJZkdjcUN5TnAveTZyRFFUcDFydWkw?=
 =?utf-8?B?SkxwZmhDbGlDUUQxZzd5d2FqNlduT0c2M09vY1dFQUVKcXpyLzgyMTFCNWZt?=
 =?utf-8?B?M0NIQ1dwaDA4cmxZUmtJdC9NNzBnd1B6alhLc1FYUEpBN0tZMVgxMnZqdjVj?=
 =?utf-8?B?QU5ZWENRbEpZUENIeFp3bmZHb2twUVg4eC9EMkRHMHRBdlpKdGVTZ1NhOWxu?=
 =?utf-8?B?dWlpMk1JRzM2MUo0MHFQUXhTN1J3c3l6NlNHYTRSSXpzWjlNSyt4WS9KTVVR?=
 =?utf-8?B?K1h3S0lNZWhwNTdobkgyOG5nOGdYQlpZdG1zdWpqNHdWZENRUjNHU3RTeWR0?=
 =?utf-8?B?UmJXZzhLcTFlMUVzaW5KQm9iNzdicG0rZno1WkY3TDZuZFBCcGUzUHNQT0Zn?=
 =?utf-8?B?ZHM1Z1NFc05DRXZVNW9vT013QkxINFlXWXJZeTJCYTlBcU8wT1dTR2ZjcWRh?=
 =?utf-8?B?c2JBc2NrT1BDSGUxMHdSV2RUT3IrTVdFNHBoSEVUNmI1VVRURnorRDJLVnVl?=
 =?utf-8?B?d2FOVjhvWU9TQnBmUEdCQXNTcFlkUjU3QUUvemo0RWxSb1Iwd21DZm9lTWFw?=
 =?utf-8?B?MjhOL25RRkdBSm9abE4rdUZaVytuYWFGdGYvSjlydnl1d1VYT2JESnpUa09E?=
 =?utf-8?B?S0hDYlRLT05qUHJ5N0FHOU9wbUNjbUZlbkc1dzVnYlZlc0txUkg0UW1OVkNy?=
 =?utf-8?B?NDg0SHZ6QW56a3psMFFyWWJvSG5pZkQrUGhheUxVTmtWYnNGTkpLcWs3dEJq?=
 =?utf-8?B?VndNZnVZWWcza3kycGluZHRNU2I0VzNvbzVwSCtya3NRRU1vbkpXYWl6NmQ2?=
 =?utf-8?B?SldTUHY0SStGVTMyVElaVm53WFJqc3lqWkV3cjZlRFB2TmxVcDFKbG5RbGdh?=
 =?utf-8?B?Z04wMDNhRkEvMm5vWW1NcElMaHl3RTZQdzVPbm9ibVlWZTM3UnV2c0J6T1Ey?=
 =?utf-8?B?eWNVeW11UzkvR1NzSzRkeU92eTJVWnNOb1gvY2txOUl1Z3YzSURNMVJOK0ZK?=
 =?utf-8?B?MGVCcXpuYXJuVXZKcmh1OWlTWWZYalJGcnhTMTRRT0FmSG5ubGxiemZJN0JM?=
 =?utf-8?B?SVRaMHZ3SzJJNlRYTm5kTGVLMzBlQTVmQkYzR1hQWHc5ZzBBYzRtcmtpZitC?=
 =?utf-8?B?TjJQVXE0Z2xiOWQ4ZzFjbEhvd1RXakMwRW9oWFpoQ21DS2Z1WTVEOHZjQVRo?=
 =?utf-8?B?TGQ4SmxIMTRPb2lKN3dCRkR1UjFETncxUFBENUxTdlRzWlNDVlQxa3VJR3NL?=
 =?utf-8?B?NGkyTlc1emhPWGFWTG13LzB0VGFWc3AyWWdBT0hVdkR2RVZKbHVCN3c0RzlM?=
 =?utf-8?B?ZHlLWG1LbTBzOW5JUy9VV0xDVyt1dG5Wd21VdFRoVHBCMlhDUGN5QzlqQ2w0?=
 =?utf-8?B?cVViZG1NL21PU3JEd3NObFl1aDBCS0tBcVA4bitaU1lhYXo2ZDJ2a0ZvcjNS?=
 =?utf-8?B?ellmaGRYOFhKTkJOYTNKbjZTWUhqTmRVRUhlMGFDRHVlby90N2Z2aDZZaW9p?=
 =?utf-8?B?UTFSSEc2YjZrZFZaZDN4ajJnaUJ0bWV1TTZpclNDMDczd3NvazN6U3BjcDJn?=
 =?utf-8?B?Uk9nekFlWTg0TEQva1F0c2dqUjdrUmFJendDSEdPVVZrUUwxRWszeFpYMVFU?=
 =?utf-8?B?Snp6UGU5SWR5dnZYekc1TzFBeDMxYmlsL2lKMjYvajh3M3M0bDVyMGQwOEFl?=
 =?utf-8?B?VlJDYmVZOFc5VDFRVlpwa200dzZXa0dlNnBCT0xUK1ppYnpGSzJjNGxLVjY1?=
 =?utf-8?B?cDJycEk0L3VzM21IazlRS1VzZ0I1UUtkUm0rZ1pCSWIrUXo2QXc1RzBtT0Vv?=
 =?utf-8?B?Qkgxd2hBRVdueVZLeXlsV1JkQy9mTEFYcVZEdS8ycEhsTFJKZ0FrNFpGTkw1?=
 =?utf-8?B?ZkF1NFZqQkNPcFY3SHhPNU0wYzkxUTFHSHB4MmNhak9IZ1haVlR5UE9DcnFL?=
 =?utf-8?B?ZjlVVG8yR3oyYmZ4OGlOWjlhaytUQTUwZ2Zaa1g3L3pEMjVpRmtrRk1uZFh4?=
 =?utf-8?B?ZTV0WDlBQ2YvdmZhRmN0aUh5YXk4S2t1OENscmVzWXFoWlFqZU1TYitDUWFw?=
 =?utf-8?B?ZW9VTFJaOHRjTHo2b3g3N2dFQnN3Undtc01CdTVDb24xSVpRTTJjbVhWVGZV?=
 =?utf-8?B?VUZPSlRJdXBjWXQzcG1mT0g2ci94R3JJK2R4a2pkWFhuOXcxYXV1T29nR2lI?=
 =?utf-8?B?dytMWDZMSmpPTkhZUFFiQm5UMzk5eGZ0NHliZm9NQUpoQWlxMVJTWkovWVpL?=
 =?utf-8?B?eUl4RERvNTJNMzlvandzc25zM1NMQ0dYRXNESEdSQ0hTdWFmVkRNT0hpUjNL?=
 =?utf-8?B?a3VBbEtHZHJBT0xRcE1oU3V0SFU5dkdxTHh4V04xNzRTZW9MUGk5KzdTcFZD?=
 =?utf-8?Q?i1M92aNBVODNdw9dVp2KsS6yqjXtwU/qUWZxq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf7aba7a-dd7b-426d-2856-08da39a768f7
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5475.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 14:54:01.1895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V5dqns16M8by6jPdIypEhRzpZ6a6gVxaXr8iWYWCJq0hsJgddUnxNIq9cPb9TUcK2bB1NDUZsIunloEh7GvwJUetB+qXfGLEjFgwaSSUX7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1679
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi@etezian.org>, Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/11/2022 12:11 PM, Ceraolo Spurio, Daniele wrote:
>
>
> On 3/18/2022 4:39 PM, Andi Shyti wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> On a multi-tile platform, each tile has its own registers + GGTT
>> space, and BAR 0 is extended to cover all of them.
>>
>> Up to four GTs are supported in i915->gt[], with slot zero
>> shadowing the existing i915->gt0 to enable source compatibility
>> with legacy driver paths. A for_each_gt macro is added to iterate
>> over the GTs and will be used by upcoming patches that convert
>> various parts of the driver to be multi-gt aware.
>>
>> Only the primary/root tile is initialized for now; the other
>> tiles will be detected and plugged in by future patches once the
>> necessary infrastructure is in place to handle them.
>>
>> Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_gt.c            | 133 ++++++++++++++++--
>>   drivers/gpu/drm/i915/gt/intel_gt.h            |  17 ++-
>>   drivers/gpu/drm/i915/gt/intel_gt_pm.c         |   9 +-
>>   drivers/gpu/drm/i915/gt/intel_gt_types.h      |   7 +
>>   drivers/gpu/drm/i915/i915_driver.c            |  28 ++--
>>   drivers/gpu/drm/i915/i915_drv.h               |   6 +
>>   drivers/gpu/drm/i915/intel_memory_region.h    |   3 +
>>   drivers/gpu/drm/i915/intel_uncore.c           |  11 +-
>>   drivers/gpu/drm/i915/intel_uncore.h           |   3 +-
>>   .../gpu/drm/i915/selftests/mock_gem_device.c  |  13 +-
>>   10 files changed, 184 insertions(+), 46 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c 
>> b/drivers/gpu/drm/i915/gt/intel_gt.c
>> index ca875ba3e2a9d..cfac4a913642e 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>> @@ -29,7 +29,7 @@
>>   #include "intel_uncore.h"
>>   #include "shmem_utils.h"
>>   -void __intel_gt_init_early(struct intel_gt *gt, struct 
>> drm_i915_private *i915)
>> +static void __intel_gt_init_early(struct intel_gt *gt)
>>   {
>>       spin_lock_init(&gt->irq_lock);
>>   @@ -51,17 +51,23 @@ void __intel_gt_init_early(struct intel_gt *gt, 
>> struct drm_i915_private *i915)
>>       intel_rps_init_early(&gt->rps);
>>   }
>>   -void intel_gt_init_early(struct intel_gt *gt, struct 
>> drm_i915_private *i915)
>> +/* Preliminary initialization of Tile 0 */
>> +void intel_root_gt_init_early(struct drm_i915_private *i915)
>>   {
>> +    struct intel_gt *gt = to_gt(i915);
>> +
>>       gt->i915 = i915;
>>       gt->uncore = &i915->uncore;
>> +
>> +    __intel_gt_init_early(gt);
>>   }
>>   -int intel_gt_probe_lmem(struct intel_gt *gt)
>> +static int intel_gt_probe_lmem(struct intel_gt *gt)
>>   {
>>       struct drm_i915_private *i915 = gt->i915;
>> +    unsigned int instance = gt->info.id;
>> +    int id = INTEL_REGION_LMEM_0 + instance;
>>       struct intel_memory_region *mem;
>> -    int id;
>>       int err;
>>         mem = intel_gt_setup_lmem(gt);
>> @@ -76,9 +82,8 @@ int intel_gt_probe_lmem(struct intel_gt *gt)
>>           return err;
>>       }
>>   -    id = INTEL_REGION_LMEM_0;
>> -
>>       mem->id = id;
>> +    mem->instance = instance;
>>         intel_memory_region_set_name(mem, "local%u", mem->instance);
>>   @@ -807,16 +812,21 @@ void intel_gt_driver_release(struct intel_gt 
>> *gt)
>>       intel_gt_fini_hwconfig(gt);
>>   }
>>   -void intel_gt_driver_late_release(struct intel_gt *gt)
>> +void intel_gt_driver_late_release_all(struct drm_i915_private *i915)
>>   {
>> +    struct intel_gt *gt;
>> +    unsigned int id;
>> +
>>       /* We need to wait for inflight RCU frees to release their grip */
>>       rcu_barrier();
>>   -    intel_uc_driver_late_release(&gt->uc);
>> -    intel_gt_fini_requests(gt);
>> -    intel_gt_fini_reset(gt);
>> -    intel_gt_fini_timelines(gt);
>> -    intel_engines_free(gt);
>> +    for_each_gt(gt, i915, id) {
>> +        intel_uc_driver_late_release(&gt->uc);
>> +        intel_gt_fini_requests(gt);
>> +        intel_gt_fini_reset(gt);
>> +        intel_gt_fini_timelines(gt);
>> +        intel_engines_free(gt);
>> +    }
>>   }
>>     /**
>> @@ -1013,6 +1023,105 @@ void intel_gt_report_steering(struct 
>> drm_printer *p, struct intel_gt *gt,
>>       }
>>   }
>>   +static int intel_gt_tile_setup(struct intel_gt *gt, phys_addr_t 
>> phys_addr)
>> +{
>> +    int ret;
>> +
>> +    if (!gt_is_root(gt)) {
>> +        struct intel_uncore_mmio_debug *mmio_debug;
>> +        struct intel_uncore *uncore;
>> +
>> +        uncore = kzalloc(sizeof(*uncore), GFP_KERNEL);
>> +        if (!uncore)
>> +            return -ENOMEM;
>> +
>> +        mmio_debug = kzalloc(sizeof(*mmio_debug), GFP_KERNEL);
>> +        if (!mmio_debug) {
>> +            kfree(uncore);
>> +            return -ENOMEM;
>> +        }
>> +
>> +        gt->uncore = uncore;
>> +        gt->uncore->debug = mmio_debug;
>> +
>> +        __intel_gt_init_early(gt);
>> +    }
>> +
>> +    intel_uncore_init_early(gt->uncore, gt);
>> +
>> +    ret = intel_uncore_setup_mmio(gt->uncore, phys_addr);
>> +    if (ret)
>> +        return ret;
>> +
>> +    gt->phys_addr = phys_addr;
>> +
>> +    return 0;
>> +}
>> +
>> +static void
>> +intel_gt_tile_cleanup(struct intel_gt *gt)
>> +{
>> +    intel_uncore_cleanup_mmio(gt->uncore);
>> +
>> +    if (!gt_is_root(gt)) {
>> +        kfree(gt->uncore->debug);
>> +        kfree(gt->uncore);
>> +        kfree(gt);
>> +    }
>> +}
>> +
>> +int intel_gt_probe_all(struct drm_i915_private *i915)
>> +{
>> +    struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
>> +    struct intel_gt *gt = &i915->gt0;
>> +    phys_addr_t phys_addr;
>> +    unsigned int mmio_bar;
>> +    int ret;
>> +
>> +    mmio_bar = GRAPHICS_VER(i915) == 2 ? 1 : 0;
>> +    phys_addr = pci_resource_start(pdev, mmio_bar);
>> +
>> +    /*
>> +     * We always have at least one primary GT on any device
>> +     * and it has been already initialized early during probe
>> +     * in i915_driver_probe()
>> +     */
>> +    ret = intel_gt_tile_setup(gt, phys_addr);
>> +    if (ret)
>> +        return ret;
>> +
>> +    i915->gt[0] = gt;
>> +
>> +    /* TODO: add more tiles */
>> +    return 0;
>> +}
>> +
>> +int intel_gt_tiles_init(struct drm_i915_private *i915)
>> +{
>> +    struct intel_gt *gt;
>> +    unsigned int id;
>> +    int ret;
>> +
>> +    for_each_gt(gt, i915, id) {
>> +        ret = intel_gt_probe_lmem(gt);
>> +        if (ret)
>> +            return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +void intel_gt_release_all(struct drm_i915_private *i915)
>> +{
>> +    struct intel_gt *gt;
>> +    unsigned int id;
>> +
>> +    for_each_gt(gt, i915, id) {
>> +        intel_gt_tile_cleanup(gt);
>> +        i915->gt[id] = NULL;
>> +    }
>> +}
>> +
>>   void intel_gt_info_print(const struct intel_gt_info *info,
>>                struct drm_printer *p)
>>   {
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h 
>> b/drivers/gpu/drm/i915/gt/intel_gt.h
>> index ce471aa5c83d7..e76168e10a21b 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
>> @@ -39,10 +39,8 @@ static inline struct intel_gt *huc_to_gt(struct 
>> intel_huc *huc)
>>       return container_of(huc, struct intel_gt, uc.huc);
>>   }
>>   -void intel_gt_init_early(struct intel_gt *gt, struct 
>> drm_i915_private *i915);
>> -void __intel_gt_init_early(struct intel_gt *gt, struct 
>> drm_i915_private *i915);
>> +void intel_root_gt_init_early(struct drm_i915_private *i915);
>>   int intel_gt_assign_ggtt(struct intel_gt *gt);
>> -int intel_gt_probe_lmem(struct intel_gt *gt);
>>   int intel_gt_init_mmio(struct intel_gt *gt);
>>   int __must_check intel_gt_init_hw(struct intel_gt *gt);
>>   int intel_gt_init(struct intel_gt *gt);
>> @@ -52,7 +50,7 @@ void intel_gt_driver_unregister(struct intel_gt *gt);
>>   void intel_gt_driver_remove(struct intel_gt *gt);
>>   void intel_gt_driver_release(struct intel_gt *gt);
>>   -void intel_gt_driver_late_release(struct intel_gt *gt);
>> +void intel_gt_driver_late_release_all(struct drm_i915_private *i915);
>>     int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout);
>>   @@ -97,6 +95,17 @@ u32 intel_gt_read_register(struct intel_gt *gt, 
>> i915_reg_t reg);
>>     void intel_gt_report_steering(struct drm_printer *p, struct 
>> intel_gt *gt,
>>                     bool dump_table);
>> +
>> +int intel_gt_probe_all(struct drm_i915_private *i915);
>> +int intel_gt_tiles_init(struct drm_i915_private *i915);
>> +void intel_gt_release_all(struct drm_i915_private *i915);
>> +
>> +#define for_each_gt(gt__, i915__, id__) \
>> +    for ((id__) = 0; \
>> +         (id__) < I915_MAX_GT; \
>> +         (id__)++) \
>> +        for_each_if(((gt__) = (i915__)->gt[(id__)]))
>> +
>>   void intel_gt_info_print(const struct intel_gt_info *info,
>>                struct drm_printer *p);
>>   diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c 
>> b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>> index e4ecc17889d34..eeead40485fbc 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>> @@ -129,7 +129,14 @@ static const struct intel_wakeref_ops wf_ops = {
>>     void intel_gt_pm_init_early(struct intel_gt *gt)
>>   {
>> -    intel_wakeref_init(&gt->wakeref, gt->uncore->rpm, &wf_ops);
>> +    /*
>> +     * We access the runtime_pm structure via gt->i915 here rather than
>> +     * gt->uncore as we do elsewhere in the file because gt->uncore 
>> is not
>> +     * yet initialized for all tiles at this point in the driver 
>> startup.
>> +     * runtime_pm is per-device rather than per-tile, so this is 
>> still the
>> +     * correct structure.
>> +     */
>> +    intel_wakeref_init(&gt->wakeref, &gt->i915->runtime_pm, &wf_ops);
>>       seqcount_mutex_init(&gt->stats.lock, &gt->wakeref.mutex);
>>   }
>>   diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h 
>> b/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> index bbba885d45bd5..937b2e1a305ed 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> @@ -188,7 +188,14 @@ struct intel_gt {
>>           u8 instanceid;
>>       } default_steering;
>>   +    /*
>> +     * Base of per-tile GTTMMADR where we can derive the MMIO and 
>> the GGTT.
>> +     */
>> +    phys_addr_t phys_addr;
>> +
>>       struct intel_gt_info {
>> +        unsigned int id;
>> +
>>           intel_engine_mask_t engine_mask;
>>             u32 l3bank_mask;
>> diff --git a/drivers/gpu/drm/i915/i915_driver.c 
>> b/drivers/gpu/drm/i915/i915_driver.c
>> index 92a625a174e22..64e6f76861f95 100644
>> --- a/drivers/gpu/drm/i915/i915_driver.c
>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>> @@ -321,9 +321,7 @@ static int i915_driver_early_probe(struct 
>> drm_i915_private *dev_priv)
>>       intel_device_info_subplatform_init(dev_priv);
>>       intel_step_init(dev_priv);
>>   -    intel_gt_init_early(to_gt(dev_priv), dev_priv);
>> intel_uncore_mmio_debug_init_early(&dev_priv->mmio_debug);
>> -    intel_uncore_init_early(&dev_priv->uncore, to_gt(dev_priv));
>>         spin_lock_init(&dev_priv->irq_lock);
>>       spin_lock_init(&dev_priv->gpu_error.lock);
>> @@ -354,7 +352,7 @@ static int i915_driver_early_probe(struct 
>> drm_i915_private *dev_priv)
>>         intel_wopcm_init_early(&dev_priv->wopcm);
>>   -    __intel_gt_init_early(to_gt(dev_priv), dev_priv);
>> +    intel_root_gt_init_early(dev_priv);
>>         i915_gem_init_early(dev_priv);
>>   @@ -375,7 +373,7 @@ static int i915_driver_early_probe(struct 
>> drm_i915_private *dev_priv)
>>     err_gem:
>>       i915_gem_cleanup_early(dev_priv);
>> -    intel_gt_driver_late_release(to_gt(dev_priv));
>> +    intel_gt_driver_late_release_all(dev_priv);
>>       intel_region_ttm_device_fini(dev_priv);
>>   err_ttm:
>>       vlv_suspend_cleanup(dev_priv);
>> @@ -394,7 +392,7 @@ static void i915_driver_late_release(struct 
>> drm_i915_private *dev_priv)
>>       intel_irq_fini(dev_priv);
>>       intel_power_domains_cleanup(dev_priv);
>>       i915_gem_cleanup_early(dev_priv);
>> -    intel_gt_driver_late_release(to_gt(dev_priv));
>> +    intel_gt_driver_late_release_all(dev_priv);
>>       intel_region_ttm_device_fini(dev_priv);
>>       vlv_suspend_cleanup(dev_priv);
>>       i915_workqueues_cleanup(dev_priv);
>> @@ -425,13 +423,9 @@ static int i915_driver_mmio_probe(struct 
>> drm_i915_private *dev_priv)
>>       if (ret < 0)
>>           return ret;
>>   -    ret = intel_uncore_setup_mmio(&dev_priv->uncore);
>> -    if (ret < 0)
>> -        goto err_bridge;
>> -
>>       ret = intel_uncore_init_mmio(&dev_priv->uncore);
>>       if (ret)
>> -        goto err_mmio;
>> +        return ret;
>>         /* Try to make sure MCHBAR is enabled before poking at it */
>>       intel_setup_mchbar(dev_priv);
>> @@ -449,9 +443,6 @@ static int i915_driver_mmio_probe(struct 
>> drm_i915_private *dev_priv)
>>   err_uncore:
>>       intel_teardown_mchbar(dev_priv);
>>       intel_uncore_fini_mmio(&dev_priv->uncore);
>> -err_mmio:
>> -    intel_uncore_cleanup_mmio(&dev_priv->uncore);
>> -err_bridge:
>>       pci_dev_put(dev_priv->bridge_dev);
>>         return ret;
>> @@ -465,7 +456,6 @@ static void i915_driver_mmio_release(struct 
>> drm_i915_private *dev_priv)
>>   {
>>       intel_teardown_mchbar(dev_priv);
>>       intel_uncore_fini_mmio(&dev_priv->uncore);
>> -    intel_uncore_cleanup_mmio(&dev_priv->uncore);
>>       pci_dev_put(dev_priv->bridge_dev);
>>   }
>>   @@ -598,7 +588,7 @@ static int i915_driver_hw_probe(struct 
>> drm_i915_private *dev_priv)
>>       if (ret)
>>           goto err_ggtt;
>>   -    ret = intel_gt_probe_lmem(to_gt(dev_priv));
>> +    ret = intel_gt_tiles_init(dev_priv);
>>       if (ret)
>>           goto err_mem_regions;
>>   @@ -849,10 +839,14 @@ int i915_driver_probe(struct pci_dev *pdev, 
>> const struct pci_device_id *ent)
>>         intel_vgpu_detect(i915);
>>   -    ret = i915_driver_mmio_probe(i915);
>> +    ret = intel_gt_probe_all(i915);
>>       if (ret < 0)
>>           goto out_runtime_pm_put;
>>   +    ret = i915_driver_mmio_probe(i915);
>> +    if (ret < 0)
>> +        goto out_tiles_cleanup;
>> +
>>       ret = i915_driver_hw_probe(i915);
>>       if (ret < 0)
>>           goto out_cleanup_mmio;
>> @@ -909,6 +903,8 @@ int i915_driver_probe(struct pci_dev *pdev, const 
>> struct pci_device_id *ent)
>>       i915_ggtt_driver_late_release(i915);
>>   out_cleanup_mmio:
>>       i915_driver_mmio_release(i915);
>> +out_tiles_cleanup:
>> +    intel_gt_release_all(i915);
>
> We don't seem to call intel_gt_release_all() from driver_release(), so 
> we might be leaking something there. I wanted to send a patch to add 
> the call at the same place in the flow as in this error path, but then 
> I noticed that i915_driver_late_release(), which we call a few lines 
> below, calls intel_gt_driver_late_release_all(), which seems to expect 
> that the GTs are still allocated, so we probably need to flip the 
> order those are called in, or move the cleanup code from 
> late_release() to late_release_all() (or vice versa).
> Andi, can you have a look at this?
>

Ping! :)

Daniele

> Thanks,
> Daniele
>
>>   out_runtime_pm_put:
>>       enable_rpm_wakeref_asserts(&i915->runtime_pm);
>>       i915_driver_late_release(i915);
>> diff --git a/drivers/gpu/drm/i915/i915_drv.h 
>> b/drivers/gpu/drm/i915/i915_drv.h
>> index 97622d3ccfc2a..8e4083d413592 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.h
>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>> @@ -777,6 +777,12 @@ struct drm_i915_private {
>>       /* Abstract the submission mechanism (legacy ringbuffer or 
>> execlists) away */
>>       struct intel_gt gt0;
>>   +    /*
>> +     * i915->gt[0] == &i915->gt0
>> +     */
>> +#define I915_MAX_GT 4
>> +    struct intel_gt *gt[I915_MAX_GT];
>> +
>>       struct {
>>           struct i915_gem_contexts {
>>               spinlock_t lock; /* locks list */
>> diff --git a/drivers/gpu/drm/i915/intel_memory_region.h 
>> b/drivers/gpu/drm/i915/intel_memory_region.h
>> index cc7078bcbfbfc..3d8378c1b4478 100644
>> --- a/drivers/gpu/drm/i915/intel_memory_region.h
>> +++ b/drivers/gpu/drm/i915/intel_memory_region.h
>> @@ -30,6 +30,9 @@ enum intel_memory_type {
>>   enum intel_region_id {
>>       INTEL_REGION_SMEM = 0,
>>       INTEL_REGION_LMEM_0,
>> +    INTEL_REGION_LMEM_1,
>> +    INTEL_REGION_LMEM_2,
>> +    INTEL_REGION_LMEM_3,
>>       INTEL_REGION_STOLEN_SMEM,
>>       INTEL_REGION_STOLEN_LMEM,
>>       INTEL_REGION_UNKNOWN, /* Should be last */
>> diff --git a/drivers/gpu/drm/i915/intel_uncore.c 
>> b/drivers/gpu/drm/i915/intel_uncore.c
>> index ef8ffc01ad19c..8b9caaaacc21f 100644
>> --- a/drivers/gpu/drm/i915/intel_uncore.c
>> +++ b/drivers/gpu/drm/i915/intel_uncore.c
>> @@ -2039,14 +2039,11 @@ static int 
>> i915_pmic_bus_access_notifier(struct notifier_block *nb,
>>       return NOTIFY_OK;
>>   }
>>   -int intel_uncore_setup_mmio(struct intel_uncore *uncore)
>> +int intel_uncore_setup_mmio(struct intel_uncore *uncore, phys_addr_t 
>> phys_addr)
>>   {
>>       struct drm_i915_private *i915 = uncore->i915;
>> -    struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
>> -    int mmio_bar;
>>       int mmio_size;
>>   -    mmio_bar = GRAPHICS_VER(i915) == 2 ? 1 : 0;
>>       /*
>>        * Before gen4, the registers and the GTT are behind different 
>> BARs.
>>        * However, from gen4 onwards, the registers and the GTT are 
>> shared
>> @@ -2063,7 +2060,7 @@ int intel_uncore_setup_mmio(struct intel_uncore 
>> *uncore)
>>       else
>>           mmio_size = 2 * 1024 * 1024;
>>   -    uncore->regs = pci_iomap(pdev, mmio_bar, mmio_size);
>> +    uncore->regs = ioremap(phys_addr, mmio_size);
>>       if (uncore->regs == NULL) {
>>           drm_err(&i915->drm, "failed to map registers\n");
>>           return -EIO;
>> @@ -2074,9 +2071,7 @@ int intel_uncore_setup_mmio(struct intel_uncore 
>> *uncore)
>>     void intel_uncore_cleanup_mmio(struct intel_uncore *uncore)
>>   {
>> -    struct pci_dev *pdev = to_pci_dev(uncore->i915->drm.dev);
>> -
>> -    pci_iounmap(pdev, uncore->regs);
>> +    iounmap(uncore->regs);
>>   }
>>     void intel_uncore_init_early(struct intel_uncore *uncore,
>> diff --git a/drivers/gpu/drm/i915/intel_uncore.h 
>> b/drivers/gpu/drm/i915/intel_uncore.h
>> index 9a760952d46af..52fe3d89dd2b8 100644
>> --- a/drivers/gpu/drm/i915/intel_uncore.h
>> +++ b/drivers/gpu/drm/i915/intel_uncore.h
>> @@ -29,6 +29,7 @@
>>   #include <linux/notifier.h>
>>   #include <linux/hrtimer.h>
>>   #include <linux/io-64-nonatomic-lo-hi.h>
>> +#include <linux/types.h>
>>     #include "i915_reg_defs.h"
>>   @@ -221,7 +222,7 @@ void
>>   intel_uncore_mmio_debug_init_early(struct intel_uncore_mmio_debug 
>> *mmio_debug);
>>   void intel_uncore_init_early(struct intel_uncore *uncore,
>>                    struct intel_gt *gt);
>> -int intel_uncore_setup_mmio(struct intel_uncore *uncore);
>> +int intel_uncore_setup_mmio(struct intel_uncore *uncore, phys_addr_t 
>> phys_addr);
>>   int intel_uncore_init_mmio(struct intel_uncore *uncore);
>>   void intel_uncore_prune_engine_fw_domains(struct intel_uncore *uncore,
>>                         struct intel_gt *gt);
>> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c 
>> b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
>> index 573d9b2e1a4a3..9c31a16f83800 100644
>> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
>> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
>> @@ -73,7 +73,7 @@ static void mock_device_release(struct drm_device 
>> *dev)
>>       destroy_workqueue(i915->wq);
>>         intel_region_ttm_device_fini(i915);
>> -    intel_gt_driver_late_release(to_gt(i915));
>> +    intel_gt_driver_late_release_all(i915);
>>       intel_memory_regions_driver_release(i915);
>>         drm_mode_config_cleanup(&i915->drm);
>> @@ -112,6 +112,11 @@ static struct dev_pm_domain pm_domain = {
>>       },
>>   };
>>   +static void mock_gt_probe(struct drm_i915_private *i915)
>> +{
>> +    i915->gt[0] = &i915->gt0;
>> +}
>> +
>>   struct drm_i915_private *mock_gem_device(void)
>>   {
>>   #if IS_ENABLED(CONFIG_IOMMU_API) && defined(CONFIG_INTEL_IOMMU)
>> @@ -180,11 +185,11 @@ struct drm_i915_private *mock_gem_device(void)
>>       spin_lock_init(&i915->gpu_error.lock);
>>         i915_gem_init__mm(i915);
>> -    intel_gt_init_early(to_gt(i915), i915);
>> -    __intel_gt_init_early(to_gt(i915), i915);
>> +    intel_root_gt_init_early(i915);
>>       mock_uncore_init(&i915->uncore, i915);
>>       atomic_inc(&to_gt(i915)->wakeref.count); /* disable; no hw 
>> support */
>>       to_gt(i915)->awake = -ENODEV;
>> +    mock_gt_probe(i915);
>>         ret = intel_region_ttm_device_init(i915);
>>       if (ret)
>> @@ -229,7 +234,7 @@ struct drm_i915_private *mock_gem_device(void)
>>   err_drv:
>>       intel_region_ttm_device_fini(i915);
>>   err_ttm:
>> -    intel_gt_driver_late_release(to_gt(i915));
>> +    intel_gt_driver_late_release_all(i915);
>>       intel_memory_regions_driver_release(i915);
>>       drm_mode_config_cleanup(&i915->drm);
>>       mock_destroy_device(i915);
>

