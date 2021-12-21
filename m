Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B85A147C91E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 23:14:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B8410E1E3;
	Tue, 21 Dec 2021 22:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B7F10E1E3;
 Tue, 21 Dec 2021 22:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640124848; x=1671660848;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BIiDk7gTkg2MSh2KmUQBwz5kIUdGNmgbXgjd4ebbApA=;
 b=GG1BR9H9FtVXI+iB4Z6fYWHn+AluVg3mqIJHoAdAfkreAWR6ijAPRQ2k
 CMNZ8HhGwrIA9sAQZCzvdgHdzM+I1599hZYzVt1/dAYxSPCmFhT0TCIu/
 Hm2j2AptD8ROecOHY0nz3H0JaI3DwvtfCZ1TzTPFLQF1jGGVPl3OGAmhM
 a4qsdmre1RIzMxluPDWvq9jP+Qd9XcS/ZwmVHFCRymwlvV0JzjvM8dJGq
 WodwPLrjvQms1v4UAAbmjbgcp3Id0DEaOs3aFWn/O8JCdhOFZWwBRhTOV
 hvdU3eYklEHFWQelEJQ7IohdBs6bmw2+yqc9eMUxzfU3WFa+It4FZjzzr w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="239252406"
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; d="scan'208";a="239252406"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 14:14:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; d="scan'208";a="684809704"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 21 Dec 2021 14:14:07 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 21 Dec 2021 14:14:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 21 Dec 2021 14:14:06 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 21 Dec 2021 14:14:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F7Opfm74J5cPXcXJ6Qm+uJNwcQGLuIr18ih6QKLhamj9EXIPp5ubJxz45WTj/i0c58jWzdb8fw2eZecqMGzVkn0d3miOYJpFyMZ7uIE7dKSHQIKR9O39J09oN9tt/dHIxDADB3pmZKx0R31Q81eS5gVZdRNvJfCVJ1eumFrrrvbYbFLo2EJ7h4P33bfe40JJCgyQJx35wImgifal5ghnaRDL0NVot0u6/xx6heTMvVX7NUGBkfxvgHFMcS6obW55f8tph3OGJ4rXkJDmOK9Vbve97P4MjSp9WdvKcbN57WqH/knbdF5wOV9CzVqJayuRQyzQnJtIXny+AsY7NQrykA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTkcWVXcd4BGWxdnmv4xmiv7ozZYUhFVqNaJpkRb49M=;
 b=YGP7QJUwjlJLADj6rE+kwFeUROzrukVhwWRsuIViKOHznj3SRuXvOx9uHHw4ArMHfu9bfjZWhY71wqy4I5Glmwb0p3Z8AN2MyGgX7twnSCVmbIi2/0Fm8gqCBl3shkJYQ0N3e57giCClZas1ISKOzhRqjkvlN/oABklH4dwYccXWuv8aPW+ysMt3QtPv6GMr3qvn/Yv4fug0MAqT2RNePa4IPKQyk00Ejx9IEZDM6Dm/IWqB0dUGgnYyZy4vCNShQfDdhKTFxp8YQZbjOm9iXtnrMuQXVnLald68GgE15IXvJ8CEWRuCxnP8gy5kNR7d6OByQ9OGqPcOhGvQwUnAKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB3908.namprd11.prod.outlook.com (2603:10b6:405:7d::13)
 by BN6PR11MB4019.namprd11.prod.outlook.com (2603:10b6:405:78::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Tue, 21 Dec
 2021 22:14:04 +0000
Received: from BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::81a3:50a8:5c1f:f754]) by BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::81a3:50a8:5c1f:f754%5]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 22:14:04 +0000
Message-ID: <1d78552e-8a7c-84c5-a9e6-7c7476a5e2e5@intel.com>
Date: Tue, 21 Dec 2021 14:14:00 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Log engine resets
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Matthew Brost
 <matthew.brost@intel.com>
References: <20211214150704.984034-1-tvrtko.ursulin@linux.intel.com>
 <597d4ad0-fdae-49a6-b471-3a83d4c25b98@linux.intel.com>
 <20211217162254.GA22048@jons-linux-dev-box>
 <3d32df02-c02e-9c35-5165-79af1cb10100@linux.intel.com>
 <1c3b1b53-0e9e-a89c-1a77-90cbc229c637@intel.com>
 <01320c8c-a9c9-8c21-7601-75860bf11838@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <01320c8c-a9c9-8c21-7601-75860bf11838@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR21CA0053.namprd21.prod.outlook.com
 (2603:10b6:300:db::15) To BN6PR11MB3908.namprd11.prod.outlook.com
 (2603:10b6:405:7d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ec2355d-07d0-43de-4919-08d9c4cf3326
X-MS-TrafficTypeDiagnostic: BN6PR11MB4019:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN6PR11MB4019E5A5F529CBBE24B02A13BD7C9@BN6PR11MB4019.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HQU54/4sAlu0O4INmV1+wCRw4QY8vR6xyLzTvc0S9vkgJv8Fv7J5rD7KFGWxcAhcjsqThrkX/jx0PkhwVN5pTvH42obwZV0QNdRamVOdkfn78HKygNsrIEgej8HVWKwU0x91muHMu9uhWKtq9Ju/Gt3nYIyEeFvsmm0gVwjl9/cKjPRhFqOqknKMW0CfYZYI1ate1CvGbluL51iPNBQ72PNJpNR5dn7valyetzxB+crJDERpLfB54T2w52qmPGTz8k6e9rZxZELkhK/VPYOAavDnw4lVq70ChMZiVW3KISFK8MJpgGUqnSPrzhctbYY2dDwkUJHSeH4F1ip2e5z71DRVNmb6jgSRv+EykFHF7ds5aMK1m7UqKk2lQqSh+B3++A5c7DeIwlldOc9p7dMkJ/QWomZozfyb4P1eJL3sBG9k5zJfEEOIQvIE9scWBHdxYuxgDQNm0kxMyHVR+kiw+tmRQu4m+Anh+XGuj0MpsIEHa7OA/WfEI2PKLfZPwXkMVXzfvrBpWYLF9mLYpj3TdAfXsvol86GhXGQLlG2fGcMVD1eb8kAT+yx3B8JGzjUQ2lPMeZqwiYj7JGu3yOtzpLWUC1AKit8faDjEjaelEIJV8pbz7hYpriVh/4YzAF9gvKK4uJCbCrGmXlX1rWzuXS8IZTo7W3X9Rrj/rKHxWE1OQh1P4pcnmIuE6LCJ3DiqqL9PRzvWDK5frr5zkQWGw3PKD2haD/md0TLQYogYrvsTKyIWeReBrLumSf4sy2NI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB3908.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(6636002)(2906002)(83380400001)(6512007)(5660300002)(66556008)(86362001)(38100700002)(110136005)(66946007)(31696002)(66476007)(8936002)(2616005)(53546011)(508600001)(36756003)(6666004)(4326008)(8676002)(26005)(31686004)(6486002)(82960400001)(6506007)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUtja3dybVFna3dPaDhiejc3aS9aUmJBckZQbktad1dLNVNhMXdsSTdGRGhz?=
 =?utf-8?B?S09FMmxORjJIdG1nNzQ2d2duWHBaNXo1YmNVRUEzNUFoQTJnS0hIdFVJM3Zr?=
 =?utf-8?B?Y3dqV0NOQThPMzdQU3oxQ0Q0SGQ3cWFJYitCRW8xd3ROaUR5QlpncTdtUkxm?=
 =?utf-8?B?VTQvNXZqM0s1MzBsdWs4WW5ZMGVySnUxV3FWaEFMeDRaRU9nSTZ1eW9DaXIz?=
 =?utf-8?B?Vnk1K1FMR3dRaUgyNnVadUxxWkZNWEU2MDljTUdpazFXSmJ4MWltWEtBSXFU?=
 =?utf-8?B?UjVhMTYxVmtXVWVsMXRRczkyUGg2TExqZnlCcmdiaC8zT3plMHVqZXp6VHh1?=
 =?utf-8?B?YzlSTUIzb2QzbkJDb0JzeUZNcllvcTV0bGE0TEV1dFNRK0FySXF6aW5tTEha?=
 =?utf-8?B?UWdCUi9sUFlOdkt4VGg4RkY0anoxRUJXQm50Ukw3WWQ3NUFMWVFBS1ZYQktN?=
 =?utf-8?B?RktqVHVOUG9hMGlnMWtaOS8vSWx2Si9hZmNWSDR1ZXAzUlgxNjlRSmU0MHV4?=
 =?utf-8?B?cjBwMGRvZGc5aTUveVYvVXhtKzZwMFg5WHlxdS9xQndSWFp2R3YveWI2eG0r?=
 =?utf-8?B?WVNkWk1lbWxXMnFXMnNobyszL3dHbUZvNHBtSGdoU0tnUDd2NStDZy82OWFX?=
 =?utf-8?B?U1JYd1B5Q3E5UXhLSUtzbmNXK1l5NG9NdWdaTWJNRmM0TE8xRFJ1Yk1TckV1?=
 =?utf-8?B?Z0RyTXdXMGxaRC9uNUNnNkY2WUlLRWMreW52WGtMRXQwdlY5RnpFQy8rL2Y1?=
 =?utf-8?B?ajZ2OWIwOXRicXBmVjJSN0hzRWdOZXZjYVlFclBERkp5VTU0VENjQ1kwcWFE?=
 =?utf-8?B?TkNyMVp1b3pUUW13YXMxTzdJZmY5Rnpxb2VtdWVwUUFlaElmSks5akhNVVNj?=
 =?utf-8?B?blZ1ajFBNWdtOGc3c1MvbE9teWh4UjdpRUpjUHlNVlIzQTBrVEh0SEI5TXFu?=
 =?utf-8?B?alZSWWpXdlltU2luMktKZkEzUEFiYlcxUWR2QUkraXVrcGhKYmUvMnA2WjhL?=
 =?utf-8?B?NVlqdUx6YVZQYmRaR3Vzdk85WXNlbUJjWEZNbm44TkpaTWY2TFJHVEI4clhD?=
 =?utf-8?B?akJqZVIzaEt5TldTYTNRMGdld2oweWxwd295QzFKaGw3anJBZlhWOFIvZkx5?=
 =?utf-8?B?NVgvYnF3blZ1M002dEwvaVRObCtjMVhJNzFjR3BRZHRiaENlL3RRamlaVW5M?=
 =?utf-8?B?YTUzKzBmSjhwa2xFeHNXSXJwRTAwRUpDZDlWSjkwcGM2TDI1VVBRQzlwUnRq?=
 =?utf-8?B?K0ZEc1ZXNVhrTVZhQjNLOFZidWlxdVdsR1NoMHpiTjVvaDdyNldKeVV1bzFB?=
 =?utf-8?B?dUs5ZC9uK1N3NVAyOW42L0JFWVdXWExNRnBTeDN3SDFzc1M1V1NMTUtQcC9p?=
 =?utf-8?B?QmVxM1d5TTRYakpGdno2aWJMbDBSS2xXTzVjZEprTENYOFQzRzlyVDJTckk4?=
 =?utf-8?B?UU1tekxGU3Z0Zmg1SGZqSytUQ3VhNkJoMkJucTVjMjFjSFVKMnpWZVR0M0NL?=
 =?utf-8?B?TXprd29zWitUWmF5WHpoQ1VKMEtrdTZMakltT0lLTnFxRFZsaHhjUlBRanhB?=
 =?utf-8?B?b2drRDlzT3N3QThzMU85K2hKWUxmRW5EU0tOcFRrTGxyd1VFRkhFMUhoY09n?=
 =?utf-8?B?em94VUN0cWllT2twQk50anBxZXovVjRDZWVleWJOL0Z0cTBGd0Rrc1Roc0Rl?=
 =?utf-8?B?d0hkME8zS0pTb3hybENCSU5FUE5Zc0RnTHpiMGtlek5LWHErK202NUtISE9K?=
 =?utf-8?B?MjE5ZWI4SEY4WGh1bUpoS0FvVTBrcjBJN200Nmw3Q2dFVW5NeHVSc0dyemg0?=
 =?utf-8?B?RURKK3Nnajd6N3pOL29uS0hNdWNTODV4cE9EZXRBek5wcmsvVitUSmNvYW5u?=
 =?utf-8?B?M2ZweTNTYm1Ic2pSc1h5bzJWc0NSbmJFaU5PUU9uWld4NEZ4eFJNYThEUDN3?=
 =?utf-8?B?OUxuYWtXcmErV3hWbFlQL1o5akFqQWltTWRzb3h5ZlFCSVE1ZDRQOVRLZk1O?=
 =?utf-8?B?eFkyNGNlRTQ5NjBab3pPY2hMejhpSGR6TUp1U2dENHA5c2NhRXJSZHRQRTll?=
 =?utf-8?B?TG85OU1RRXJTNm5udmpLdk9pSks2TmdtV01sU1NvTVR6bzlYQjJhUjVIaE1h?=
 =?utf-8?B?QXhWd2haMFRBM2l3K29TeXlUU2NDaTFkVHBiYm1NSFlJWG54cmRjb0U0cDcy?=
 =?utf-8?B?bFBjVXZaL1dJQjBXSnhvQU9zallzaEVVRTBRMk9VcWQ0Y0tBL0VZNkxhbU9B?=
 =?utf-8?Q?blCOsUeTFrt2IhqgTlg1f5mszGyidnWnQZgvvieqV0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec2355d-07d0-43de-4919-08d9c4cf3326
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB3908.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 22:14:04.6775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sHyMHkURIRtRuU7+eN/Afw1RNgW2au3BD5sAhIaVGcUeItqCzdFIrDA2lbWJeXNR3XS+JTwCSSXJG4/evT5Is7SLDWtR9RN9/GCX/qMj240=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4019
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/21/2021 05:37, Tvrtko Ursulin wrote:
> On 20/12/2021 18:34, John Harrison wrote:
>> On 12/20/2021 07:00, Tvrtko Ursulin wrote:
>>> On 17/12/2021 16:22, Matthew Brost wrote:
>>>> On Fri, Dec 17, 2021 at 12:15:53PM +0000, Tvrtko Ursulin wrote:
>>>>>
>>>>> On 14/12/2021 15:07, Tvrtko Ursulin wrote:
>>>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>>
>>>>>> Log engine resets done by the GuC firmware in the similar way it 
>>>>>> is done
>>>>>> by the execlists backend.
>>>>>>
>>>>>> This way we have notion of where the hangs are before the GuC gains
>>>>>> support for proper error capture.
>>>>>
>>>>> Ping - any interest to log this info?
>>>>>
>>>>> All there currently is a non-descriptive "[drm] GPU HANG: ecode
>>>>> 12:0:00000000".
>>>>>
>>>>
>>>> Yea, this could be helpful. One suggestion below.
>>>>
>>>>> Also, will GuC be reporting the reason for the engine reset at any 
>>>>> point?
>>>>>
>>>>
>>>> We are working on the error state capture, presumably the registers 
>>>> will
>>>> give a clue what caused the hang.
>>>>
>>>> As for the GuC providing a reason, that isn't defined in the interface
>>>> but that is decent idea to provide a hint in G2H what the issue 
>>>> was. Let
>>>> me run that by the i915 GuC developers / GuC firmware team and see 
>>>> what
>>>> they think.
>>>>
>> The GuC does not do any hang analysis. So as far as GuC is concerned, 
>> the reason is pretty much always going to be pre-emption timeout. 
>> There are a few ways the pre-emption itself could be triggered but 
>> basically, if GuC resets an active context then it is because it did 
>> not pre-empt quickly enough when requested.
>>
>>
>>>>> Regards,
>>>>>
>>>>> Tvrtko
>>>>>
>>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 12 
>>>>>> +++++++++++-
>>>>>>    1 file changed, 11 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>> index 97311119da6f..51512123dc1a 100644
>>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>> @@ -11,6 +11,7 @@
>>>>>>    #include "gt/intel_context.h"
>>>>>>    #include "gt/intel_engine_pm.h"
>>>>>>    #include "gt/intel_engine_heartbeat.h"
>>>>>> +#include "gt/intel_engine_user.h"
>>>>>>    #include "gt/intel_gpu_commands.h"
>>>>>>    #include "gt/intel_gt.h"
>>>>>>    #include "gt/intel_gt_clock_utils.h"
>>>>>> @@ -3934,9 +3935,18 @@ static void capture_error_state(struct 
>>>>>> intel_guc *guc,
>>>>>>    {
>>>>>>        struct intel_gt *gt = guc_to_gt(guc);
>>>>>>        struct drm_i915_private *i915 = gt->i915;
>>>>>> -    struct intel_engine_cs *engine = 
>>>>>> __context_to_physical_engine(ce);
>>>>>> +    struct intel_engine_cs *engine = ce->engine;
>>>>>>        intel_wakeref_t wakeref;
>>>>>> +    if (intel_engine_is_virtual(engine)) {
>>>>>> +        drm_notice(&i915->drm, "%s class, engines 0x%x; GuC 
>>>>>> engine reset\n",
>>>>>> + intel_engine_class_repr(engine->class),
>>>>>> +               engine->mask);
>>>>>> +        engine = guc_virtual_get_sibling(engine, 0);
>>>>>> +    } else {
>>>>>> +        drm_notice(&i915->drm, "%s GuC engine reset\n", 
>>>>>> engine->name);
>>>>
>>>> Probably include the guc_id of the context too then?
>>>
>>> Is the guc id stable and useful on its own - who would be the user?
>> The GuC id is the only thing that matters when trying to correlate 
>> KMD activity with a GuC log. So while it might not be of any use or 
>> interest to an end user, it is extremely important and useful to a 
>> kernel developer attempting to debug an issue. And that includes bug 
>> reports from end users that are hard to repro given that the standard 
>> error capture will include the GuC log.
>
> On the topic of GuC log - is there a tool in IGT (or will be) which 
> will parse the bit saved in the error capture or how is that supposed 
> to be used?
Nope.

However, Alan is currently working on supporting the GuC error capture 
mechanism. Prior to sending the reset notification to the KMD, the GuC 
will save a whole bunch of register state to a memory buffer and send a 
notification to the KMD that this is available. When we then get the 
actual reset notification, we need to match the two together and include 
a parsed, human readable version of the GuC's capture state buffer in 
the sysfs error log output.

The GuC log should not be involved in this process. And note that any 
register dumps in the GuC log are limited in scope and only enabled at 
higher verbosity levels. Whereas, the official state capture is based on 
a register list provided by the KMD and is available irrespective of 
debug CONFIG settings, verbosity levels, etc.

>
>> Also, note that GuC really resets contexts rather than engines. What 
>> it reports back to i915 on a reset is simply the GuC id of the 
>> context. It is up to i915 to work back from that to determine engine 
>> instances/classes if required. And in the case of a virtual context, 
>> it is impossible to extract the actual instance number. So your above 
>> print about resetting all instances within the virtual engine mask is 
>> incorrect/misleading. The reset would have been applied to one and 
>> only one of those engines. If you really need to know exactly which 
>> engine was poked, you need to look inside the GuC log.
>
> I think I understood that part. :) It wasn't my intent to imply in the 
> message multiple engines have been reset, but in the case of veng, log 
> the class and mask and the fact there was an engine reset (singular). 
> Clearer message can probably be written.
>
>> However, the follow up point is to ask why you need to report the 
>> exact class/instance? The end user doesn't care about which specific 
>> engine got reset. They only care that their context was reset. Even a 
>> KMD developer doesn't really care unless the concern is about a 
>> hardware bug rather than a software bug.
>
> I was simply aligning both backends to log as similar information as 
> possible. Information is there, just not logged.
>
> Concerning the wider topic, my thinking is end user is mainly 
> interested to know there are any engine resets happening (to tie with 
> the experience of UI/video glitching or whatever). Going for deeper 
> analysis than that is probably beyond the scope of the kernel log and 
> indeed error capture territory.
I would still say that the important information is which context was 
killed not which engine. Sure, knowing the engine is better than nothing 
but if we can report something more useful then why not?

>
>> My view is that the current message is indeed woefully uninformative. 
>> However, it is more important to be reporting context identification 
>> than engine instances. So sure, add the engine instance description 
>> but also add something specific to the ce as well. Ideally (for me) 
>> the GuC id and maybe something else that uniquely identifies the 
>> context in KMD land for when not using GuC?
>
> Not sure we need to go that far at this level, but even if we do it 
> could be a follow up to add new data to both backends. Not sure yet I 
> care enough to drive this. My patch was simply a reaction to noticing 
> there is zero information currently logged while debugging some DG2 
> hangs.
In terms of just reporting that a reset occurred, we already have the 
'GPU HANG: ecode 12:1:fbffffff, in testfw_app [8177]' message. The ecode 
is a somewhat bizarre value but it does act as a 'something went wrong, 
your system is not happy' type message. Going beyond that, I think 
context identification is the next most useful thing to add.

But if you aren't even getting the 'GPU HANG' message then it sounds 
like something is broken with what we already have. So we should fix 
that as a first priority. If that message isn't appearing then it means 
there was no error capture so adding extra info to the capture won't help!

John.


>
> Regards,
>
> Tvrtko

