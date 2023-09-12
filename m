Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 576A179CC67
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 11:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9802810E22C;
	Tue, 12 Sep 2023 09:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78B710E22C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 09:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694512297; x=1726048297;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Wg+LqkS5nMOVVRXNTq6zUiMNQO6ZUKlkuVlgqcqV4gY=;
 b=f5U3DuoFdimEL8Lvi+ReGHAlL8BlBgimExBEJdykdnP9UzcljhvIpBPr
 3Q4FaQ8116FYIcCNiPMBJ8tD0Dka7JDxPoA9aAgu9biMLLEl+yh1TLBbs
 gHM472WAEEC2GsoQBeVS+FP3Dp8KT6cUEVKptYevAZZsn3VCL3MOiZqD1
 oZmDgqvTiS9Siwz5rG3Lxmq0NOh/jeogvdSdbLBzlVuNZQb10UBaISPvW
 qP08X44uyqOnqngn4PoU+1/AE1Jif2t7vH5fotI5wKaHdZEjmOc+8ONWy
 8shuAM1ae8NhthdVkvU4VwAfzNMiKnH8/fFQrqB7R/mqWUp83xhJKv+l1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="368586072"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="368586072"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 02:51:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="858736055"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="858736055"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2023 02:51:34 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 02:51:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 02:51:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 02:51:33 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 12 Sep 2023 02:51:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ye1vTUKzmLl8qVxNmw0nOXPzotKlCl/7v8YBY1nTkef3MyGeqqCdTphqhADDxhJ1oZ9ZsSZKNqhYRMWMJUADC5NP1LYh/5BKTPXsNTQOqnYAHcgmduFo18x2iGsbW6V3CFbsmvnugAwZ2sYmkyz8dP3gR/d51eaQKfNe6ic8QQxhaEMCFzDzvfWoPy05G2zT1DVRYbpizLVGpW02CxQGRIB1cOOd7HMT01MZUayTTF/ypcOakpfolvxxwhwJBa58orsmN6FFHWtI2YmaatrovVR4e9PTshb9Q886eDZihvJAL0cKfHxRFMcxr3ZpWbV93b3GyVTzTInibM0b2Gvtqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ehqu75w1Zl0rAMHBn2d/czKb7nC0d6AEkNZKaXkbkIE=;
 b=IcOna81qm9ugdwbb2/MJyKH6q+tVLgRBeAKDguFVYt/oAbmeNdEo/ZNiUOSRA+HtYExd0itZD/49uaFMt8yP0Nfe3p9Iiy37dKuye4bTcqcLAh6yxKG548vDRM8g4WokmwJXgkon0WKobNRCngeeJ7ucBhZRQEPmfKwzM32DCK/XG4cp+s5KxJ13UNQt3PkEQHjp6rdN2UjjyN1lP0qcQT7RcHOPWfsqO4LrRgBw16kNETLp5QvgqUD8ldwl0C2K35n6fNK6h2qfeOuvTVASaDjsJBg/dw+DVqa2LNNxGBodbT7GnVxFD6oDd0pOXIQg5h8TzPqPZH7Li1/zfwm7pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by CH0PR11MB5692.namprd11.prod.outlook.com (2603:10b6:610:111::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Tue, 12 Sep
 2023 09:51:31 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::59cb:e244:fe8b:184d]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::59cb:e244:fe8b:184d%5]) with mapi id 15.20.6768.036; Tue, 12 Sep 2023
 09:51:30 +0000
Message-ID: <6f912ee2-4ea1-927b-f1f5-36b4620524bb@intel.com>
Date: Tue, 12 Sep 2023 11:51:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/5] drm/ttm: Update Makefile for KUnit
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>
References: <cover.1694422112.git.karolina.stolarek@intel.com>
 <3782fd55e8479296daab7041430fe7b0848bf621.1694422112.git.karolina.stolarek@intel.com>
 <87fs3lf0ht.fsf@intel.com> <60ffa6fe-4750-c864-9012-7a047a0f1c3b@intel.com>
 <4080bd92-d10e-4cb3-fce4-a76892834baf@amd.com>
 <99ef9f6f-a84b-fa4c-8a33-a214b4b9695c@intel.com>
 <69110ad5-0c6e-ab90-90f6-78a133af183e@amd.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <69110ad5-0c6e-ab90-90f6-78a133af183e@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0213.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::7) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|CH0PR11MB5692:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e7ea57a-701c-423f-156a-08dbb375d71e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RDcUDw/IOROv2u73xU0wNNvKbKRBsjRyK87mQdo48eCZS1scssiY54k4py6yl7y2HBAFBitHDt4/gyOdZjdWQl8wGzPtWmV2IePWvXpZtkK/epXf+kyjEefzVibWlJQ5fDEENKYzZGcWQDML0uGVWRzG5nQwVzTdRJFdYyb6yDT4dcWHaLIPFq67mIMED5rtUlSOvbM2WRpOBV/mstS1eSc4I2GMMFQD9GauDVRND4F3ZbTaG4A06rNYfPMx2T4hhk1Yzbg8uzS3joxBcmgoaiHdVNGCs9YVZ/tkOmKAlbKF4smLvvfbdHUxPb9ab56iEvltCRy6a/W5GbZ7NuSYdrabmfFAhhrW4lW+C98aP/ygpk2U3OkcQ9gKVBx3Ay4pVSXBQia/TEfKpgfBYrGlGtO4oxJ4Zna+5BOpnNotkzgZdKn/RMaVJsqNKcANLODCQl3plcCgihQPooKR2XjiBNf9+lx30l3Y3WSls/oFhzq8w3sFcX+dUUMnrY0lLGCj6POj3JpyXdnGG9Uioa/xBqxiGYIj4pp+X9OcBGvmsZAitJiUGDnz+y+e7xmYZlZuwIrT1lhyeG2ulkynvDvcJcWmMMy/DST3O8KHOy/x6r2xNJ9YqCl+2Jm09RlbZY9MRBAKloNERDfMRsjw9FrW/L4XwczzYGGbYVroANJ8YM+nMIXxicV2l5D52yeM7ft+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(136003)(396003)(39860400002)(376002)(451199024)(186009)(1800799009)(31696002)(8676002)(4326008)(86362001)(8936002)(66899024)(15650500001)(44832011)(5660300002)(2906002)(36756003)(82960400001)(53546011)(36916002)(6512007)(6506007)(6486002)(6666004)(26005)(2616005)(38100700002)(478600001)(966005)(66574015)(83380400001)(31686004)(54906003)(66946007)(41300700001)(66556008)(316002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anFzby9vSVdGeVZwWEtZREZOd294V3NzMTZyT2Q5ZzRpeEs1MldjR25pMDh1?=
 =?utf-8?B?ckp1RXpBM3c5K0MwV1RjNGozaWlRdlZ6bVcrNGlsUk0rSG9kVFVmK0luQitx?=
 =?utf-8?B?VmxWMnpTOHVXbUY3WG5EekozdWdrc001bGFMNnJKTlhSQTkxZXFJN042ODE1?=
 =?utf-8?B?QndMVEx6clhudGdjc1V4QkxLbTE3TVZRcEk3aS9MUVFnZC9KL25TLzdNTkgw?=
 =?utf-8?B?NzNZQ2p5dVF2UEozNk5pMWxvZDNVendFYjdFazQ5U2FwSlRaYlB0VXJONDZP?=
 =?utf-8?B?ZDRPakdBUnlVWklkanpzL2xMMk1mQUpXaVpQdk9mdnFPUU5HcVE5SUdoVWhz?=
 =?utf-8?B?bm5VODlpbUpqR1dWMTQ0WjVDZlpEaXpQMUlYODFRTzY2RENlbEJHa3B4SEZx?=
 =?utf-8?B?QWFxYzNudGxXd3JDamdMNDFjbmxvZ1VyWmsweVV0NjdoMnlma1JuemM4KzRL?=
 =?utf-8?B?Ky9EdzFSeEtmU3crK1NndVZMYVY5M1NsMjI0d2x1QnAyMkl2d281MFZ1YU5x?=
 =?utf-8?B?L1BPaHo2K1hZWFJFY09FVXE1WWVqYllkRUZyVlluMXM3dUVBK3NjV2JDUHpU?=
 =?utf-8?B?TEpjY3dLQXZjOVBpZDd3MXV2aHJReVBjODV6MlI1UU40NVFPdXJvNlQzcG5x?=
 =?utf-8?B?dkFDaDRiMzFWZTVwRWxCRHZUZVltWTBvWUJkcmNTc1ZiYWpDZlRwOUF2bFJG?=
 =?utf-8?B?UzY0Y25YK2orNDJSNUdCQUxOTWRwZTgwUVlGZmhGK0F2T1ErL2JiMndEeU90?=
 =?utf-8?B?dnV1WlkzM3VsdGozSGVEOWdqUkp1L25Sa3NTWHY3ZzhvbzFSN014ZmNtT2xS?=
 =?utf-8?B?SGZtWEU1ZmlaNDl4M1RnZ25YN0Z3TlRISDhIZXN2TkxRSW9Gb1UwSFhTeG9x?=
 =?utf-8?B?d2s3ek8vamUzRjVROVIzNEFCbXZKRnoycDQyeWVkaldDMTZtWjNNOURsY0Qv?=
 =?utf-8?B?OTBaOVpEVWQ1blc0WjJUeDFqQ01GZWJ2M3VlL1VjSVZVVjR5T1Y4dGxGN2ZY?=
 =?utf-8?B?a2w2MmxjVzVvVjRWbXdTQVdWTGZ4QXlnZ05OWERNeUgyTnVlcDFmdWNiVFdz?=
 =?utf-8?B?ZEY2Ylh5a0JodjBxZ2F3SWM3K1pLRDZKZ2trWm54Mm1HRFRZZWtVQWZvWEpH?=
 =?utf-8?B?aXhNcWFoelNjaUs1M3hlQ3dESGlvdGl4WU1kL0FPNEhiakc4ZTdaR3JVaXdX?=
 =?utf-8?B?QWtjaVhqYlRxalZxQlpxR2F6T1ZrYmRnUmE2dTBlTmo3ZmpIVGF6U0dVenU3?=
 =?utf-8?B?N2drL1MxU2F5Nkx5Q1BOWW1jUW0wdkptMEhEQXUxQjlINWJJNkp3b0NXaVp1?=
 =?utf-8?B?YnM3Q0hsM1NSajhNOURTZmVwdzFNbStEbWRkczVWOW1VTDdEakNjQU1COTEz?=
 =?utf-8?B?RWQ4aXorczNRM2Vlb21aNEtOaW5GaDNMdDdId3p3cUJrZUZudm1VNFdYK3dz?=
 =?utf-8?B?b0RoWnpXcFZBMFpNTUNjRDk3VjJrSzRteGNWVDJ3ckhTTVRrWnRESmhrb2Mv?=
 =?utf-8?B?WHRwZVUrNHhmd1VoQVJIUVBTWXVmYWlsUlkveVZucmJjQVEwdW1OOEJWVUxn?=
 =?utf-8?B?b2dKUjBsS09kbk43ZGJENXc3bkQzZ2s4Z1JlRzRsN0ZIWTMzUGxEbWkveUsz?=
 =?utf-8?B?cWRJOGpMQmd3VmFaU3Rib2VXdTV4aStLUGVKRExSdmFPM3BISnUyRmNLalBy?=
 =?utf-8?B?a0lzVkpMME9zYUdCV1NVZWxqb0VtSjJsa2hybEt5b1hGRldOSm1RUWtiVUkz?=
 =?utf-8?B?SFp1RndidGlReThiQkF1SFdORXMvb2gvaU9Nb0lWeVc3NEdhN043MXhkR21n?=
 =?utf-8?B?b2VCSUZ3d2dTbkp3RjA3NWMrcjdmb0E0WFFUZExjSzA3QjZQczZqTUhUT1NO?=
 =?utf-8?B?UUw2YWpoSkhPL2lTY2pBeFFZekkydkNQbTdkWlk5TUphMllIOVRqSHNINzgy?=
 =?utf-8?B?WFJpZi9aWkNOUzc3aGVlMHVmWm1GUTJUNzFGZUdBQzFMN1NGYUEzZnVhWVFi?=
 =?utf-8?B?TFBYWTkwdSt6L3E5bGZUUEtUWU12a0JkY0wrSHoraE1ncnFlamRzcml6RTdB?=
 =?utf-8?B?NnJHTXVneG1wSXhCQUtIbkdaY01PT0JMYStycVFjUDI1MkoxeGtCdG1BLzdn?=
 =?utf-8?B?ZFdBeDZRbmQ0em1GbC9yclJLbktRRHVUZEMvVGxqR2tKSE5hQjh0SnlGbkdP?=
 =?utf-8?B?Q0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e7ea57a-701c-423f-156a-08dbb375d71e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 09:51:30.6442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AHXxp/DISfknwAoaFeu/7trw5XzIa7i7+1NUjmnAlq0EMsoUDpQf1xdROLYfksXVH+yvcQR3Xrtafl5vASiA8pFlEWnr9DOsI7zXdLmfDn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5692
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11.09.2023 15:42, Christian König wrote:
> 
> 
> Am 11.09.23 um 15:33 schrieb Karolina Stolarek:
>> On 11.09.2023 15:12, Christian König wrote:
>>> Am 11.09.23 um 13:47 schrieb Karolina Stolarek:
>>>> On 11.09.2023 12:49, Jani Nikula wrote:
>>>>> On Mon, 11 Sep 2023, Karolina Stolarek 
>>>>> <karolina.stolarek@intel.com> wrote:
>>>>>> Update Makefile so it can produce a module that consists of TTM 
>>>>>> tests.
>>>>>> This will allow us to test non-exported functions when KUnit tests
>>>>>> are built as a module. Remove the tests' Makefile.
>>>>>
>>>>> I'm asking questions instead of making assertions, because I'm not 
>>>>> 100%
>>>>> confident, but I don't feel like this Makefile could work right.
>>>>
>>>> Questions, assertions and comments are fine, I'm glad you're taking 
>>>> a look at the patch :) I'm not 100% confident either, so I welcome 
>>>> suggestions on how to improve it.
>>>>
>>>> The problem is that TTM tests try to test symbols that are not 
>>>> exported, so I have to compile all the files together into one 
>>>> module if I choose to build KUnit tests as a module. The other 
>>>> option that I'm considering is to make the tests are builtin only. 
>>>> I'm tempted to go with it (for the sake of simplicity), but I'm 
>>>> trying to get the module option to work first.
>>>
>>> I have to admit that this looks pretty awkward, but I'm not an expert 
>>> on the Linux build system in the first place.
>>
>> Neither am I, and it shows :)
>>
>>> Would it be an option to build the unit tests into the standard 
>>> ttm.ko module and let them run whenever that module loads?
>>
>> You mean appending the list of tests to ttm-y, depending on 
>> $(CONFIG_DRM_TTM_KUNIT_TEST)?
> 
> Yes.
> 
>> I _think_ I tried something similar, and couldn't get it to work, got 
>> a bunch of "twice exported" warnings.
> 
> You might need to adjust module_init, and things like MODULE_VERSION 
> etc..., but I would give it a try.

I just learnt about the existence of EXPORT_SYMBOL_FOR_TESTS_ONLY() 
macro. It's defined as a part of drm_util.h and used by DRM selftests. 
Thankfully, the TTM KUnit KConfig already selects 
CONFIG_DRM_EXPORT_FOR_TESTS, so we could use that macro (almost) for 
free. Only 2-3 line additions to ttm_tt and ttm_resource files, no 
significant changes to the Makefile.

What do you think?

Many thanks,
Karolina

> 
> Thanks for looking into this,
> Christian.
> 
>>
>>> On the other hand if this solution here works, why not?
>>
>> Because it's complicated and, well, awkward. I'm still thinking about 
>> a use case where we would prefer to have KUnit tests defined as a 
>> module. IIRC, in CI we enable KUnit tests as bultins and run them 
>> during the boot. kunit.py helper also defines the tests as builtins.
>>
>> All the best,
>> Karolina
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>>>
>>>>>>
>>>>>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
>>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>>> Closes: 
>>>>>> https://lore.kernel.org/oe-kbuild-all/202309010358.50gYLkmw-lkp@intel.com/
>>>>>> Closes: 
>>>>>> https://lore.kernel.org/oe-kbuild-all/202309011134.bwvpuyOj-lkp@intel.com/
>>>>>> Closes: 
>>>>>> https://lore.kernel.org/oe-kbuild-all/202309011935.bBpezbUQ-lkp@intel.com/
>>>>>> ---
>>>>>>   drivers/gpu/drm/ttm/Makefile       | 18 +++++++++++++-----
>>>>>>   drivers/gpu/drm/ttm/tests/Makefile |  6 ------
>>>>>>   2 files changed, 13 insertions(+), 11 deletions(-)
>>>>>>   delete mode 100644 drivers/gpu/drm/ttm/tests/Makefile
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/ttm/Makefile 
>>>>>> b/drivers/gpu/drm/ttm/Makefile
>>>>>> index dad298127226..6322a33e65ed 100644
>>>>>> --- a/drivers/gpu/drm/ttm/Makefile
>>>>>> +++ b/drivers/gpu/drm/ttm/Makefile
>>>>>> @@ -2,10 +2,18 @@
>>>>>>   #
>>>>>>   # Makefile for the drm device driver.  This driver provides 
>>>>>> support for the
>>>>>>   -ttm-y := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o 
>>>>>> ttm_module.o \
>>>>>> -    ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o 
>>>>>> ttm_pool.o \
>>>>>> -    ttm_device.o ttm_sys_manager.o
>>>>>> +ttm := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
>>>>>> +       ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o 
>>>>>> ttm_pool.o \
>>>>>> +       ttm_device.o ttm_sys_manager.o
>>>>>> +obj-$(CONFIG_DRM_TTM) += $(ttm)
>>>>>
>>>>> Does that not lead to each object in $(ttm) becoming its own module?
>>>>
>>>> Huh, yes, that is what would happen here. Not good...
>>>>
>>>>>
>>>>>>   ttm-$(CONFIG_AGP) += ttm_agp_backend.o
>>>>>
>>>>> Does this not create a ttm.o with just one object, depending on
>>>>> CONFIG_AGP?
>>>>
>>>> I just left it as it was before my changes.
>>>>
>>>>>
>>>>>>   -obj-$(CONFIG_DRM_TTM) += ttm.o
>>>>>> -obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += tests/
>>>>>> +ttm-tests := tests/ttm_kunit_helpers.o tests/ttm_device_test.o \
>>>>>> +             tests/ttm_pool_test.o
>>>>>
>>>>> I'd preserve the one object per line syntax. It's nicer for the 
>>>>> diffs in
>>>>> subsequent updates.
>>>>
>>>> OK, will update it in the next version (if such comes). I just 
>>>> followed the style of "ttm-y".
>>>>
>>>>>
>>>>>> +
>>>>>> +ifeq ($(CONFIG_DRM_TTM_KUNIT_TEST),m)
>>>>>> +    ttm-test-objs := $(ttm) $(ttm-tests)
>>>>>
>>>>> Isn't the -objs syntax for host/userspace programs? And if not, 
>>>>> doesn't
>>>>> it lead to objects with exported symbols being present in two places?
>>>>
>>>> I saw it in use in other Makefiles, so I followed it. As for the 
>>>> exported symbols, I tested both builtin and module configs, and it 
>>>> was fine, but it's possible I missed something. I suspect that the 
>>>> variables are first expanded, and then processed by the Makefile.
>>>>
>>>> Many thanks,
>>>> Karolina
>>>>
>>>>>
>>>>> Confused.
>>>>>
>>>>> BR,
>>>>> Jani.
>>>>>
>>>>>> +    obj-m := ttm-test.o
>>>>>> +else
>>>>>> +    obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += $(ttm-tests)
>>>>>> +endif
>>>>>> diff --git a/drivers/gpu/drm/ttm/tests/Makefile 
>>>>>> b/drivers/gpu/drm/ttm/tests/Makefile
>>>>>> deleted file mode 100644
>>>>>> index ec87c4fc1ad5..000000000000
>>>>>> --- a/drivers/gpu/drm/ttm/tests/Makefile
>>>>>> +++ /dev/null
>>>>>> @@ -1,6 +0,0 @@
>>>>>> -# SPDX-License-Identifier: GPL-2.0 AND MIT
>>>>>> -
>>>>>> -obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
>>>>>> -        ttm_device_test.o \
>>>>>> -        ttm_pool_test.o \
>>>>>> -        ttm_kunit_helpers.o
>>>>>
>>>
> 
