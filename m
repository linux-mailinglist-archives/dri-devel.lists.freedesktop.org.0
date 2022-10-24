Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C288C60BD25
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 00:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A8E10E082;
	Mon, 24 Oct 2022 22:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19E510E082;
 Mon, 24 Oct 2022 22:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666649417; x=1698185417;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zZHfbyQ3M5KTBzPkYRnKR7aZXLqfm+YFw8ZortBol8A=;
 b=ZQU50sCxKIcK1NDu8cUeCpW0PLD9LkxZY/HlOh2ZnQqvL+/WPFbVclwV
 UQAFuUBzSzxeW1PmOQSytQpNTB5wbQnc7//Q5D4bRf2ySXeqNDUo86lNj
 IzgJ3FIkUmvVThW90xT1MFPaSZgG+OXhAoU/63v53m2pR/DDpL6dzHbGg
 FX8qtaRs7qsJD3lj4mG9Pcp5Kww/EyRxwPcSBogrHLB7Qz2sWORvyBqwP
 VHQ9BA4fwKImYwQEkhtE2jx7QtejWYInL9a35+ZoAt29NH0ewVRE5x9Us
 KoI3MWFJeNMQHc7/Oy407AVjm57HxAZGwBR1wWGwInzeZRzeya0Sw8sXk A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="334125335"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; d="scan'208";a="334125335"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 15:10:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="806450319"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; d="scan'208";a="806450319"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 24 Oct 2022 15:10:16 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 15:10:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 24 Oct 2022 15:10:16 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 24 Oct 2022 15:10:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aml9qlOSfI3JjdaANjQTt8N5gphOd5dyUWLnrUpeES3BI5mO8N4R6+TbHym2AK3YPXE+j628eZoGpJ0Q5QgH1KWCUWW8qz6C6j/S1FCQtsPF3StDnhgGM6n15owmXJgaYtHJlG0LT2K+sdvoDPsJHn0YFb5vLorwv3Kbwd0vsHTKk3bW2vLjE5qBzpHO5Mv75cNAceILWDoigizjP6RACdwkmRhOjb+t6ZiCbkZM4teVe6JgnsMzMCfcx8asaUUIZ3AbsXyJv3UbyKCC2ny8xrXDjePZTa3BW1miyRmwn72JjBngPZjTUaDLNUFIqEe/k3hesdBbDUOaUVSax3HPNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zr0IaMIRHiWGnh6wZzcgppHAQBUha09g4kN2BmESzEM=;
 b=eC4e1alAgROsj0jHQ+mou9DoqIYNFH65JDaoBME5V7291+nZjV/3MuWt/BMxBplrAcs1L9KqrQl7BpWoA9KQ3BeH7X6NHrDlCE2qDzUaeifdSfFfmaHW5vx+Gsi5rLDKM6TVvDOa5ogSukrMFybPOg/qSKoIqGMIAuWDGeCLn/xpUutQCbQy5fjtwOUB/entL2XBYQolAAgY8CeaEt0cBMj9JI6AvBC+4lcNZVNe42k5LFCtawZqUNZdRiM8QFjIH3hc5AXyDk2Ej9npUifNztyh40gu5adV2XrngcAn1quLpOtzPNtNYAeAtZMDQ/yhVAMCZ3T/AOjq4Wzg09GYFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 MW4PR11MB5912.namprd11.prod.outlook.com (2603:10b6:303:18a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Mon, 24 Oct
 2022 22:10:14 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::bff2:8e4f:a657:6095]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::bff2:8e4f:a657:6095%4]) with mapi id 15.20.5723.033; Mon, 24 Oct 2022
 22:10:13 +0000
Message-ID: <bc1068e3-dcb3-ae73-050a-7593862acd99@intel.com>
Date: Mon, 24 Oct 2022 15:10:11 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 5/7] drm/i915/mtl: Handle wopcm per-GT and limit
 calculations.
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20221022001008.2340224-1-daniele.ceraolospurio@intel.com>
 <20221022001008.2340224-6-daniele.ceraolospurio@intel.com>
 <e444179e-c722-2a06-4fa9-3122dbd39966@intel.com>
 <279ca89a-e00c-5d11-cf92-08873121d04a@intel.com>
 <d01ff118-b1ea-54b2-2782-4e00a7f60e51@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <d01ff118-b1ea-54b2-2782-4e00a7f60e51@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0154.namprd05.prod.outlook.com
 (2603:10b6:a03:339::9) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|MW4PR11MB5912:EE_
X-MS-Office365-Filtering-Correlation-Id: 16de8645-1c6e-45d4-cdc4-08dab60c8659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b9xOXiYAz1RMMTHHL+kWDYzhgOq6jwbX8jnJ9qSbEf5NrB60GEXdq1Tmb9GGMJKSETdr7RGnfvttCubmJz21dbyd9A3vfaQGYY6Jt8xrvlhD74XI6lKEwftXboAQnU+VSYUoAqMssGROB18bWYos1SMtmt7bStySnoX883sEBEROLqyOA4+9U6vsknUTiZMWnGP7gV7KmPKfzY27biqwtCd0I68yZcmX+tkUnZBrmyQS9/VU618hcSQpdVmk1PsqXIAywUCQuuwg/bDM1qsvMFPQgyEgsBsyPNxM9tfjb9ksjdV7GtccudP5WuQqgxx/8F6auc80qdT0P1wQh2GSTolVAFlK/Szixs+22Wo5v48J2vV51DEfvEoNRAq9ICErB4o7o5pEK6Pzf/6ltdwOXQ/oB8LCOPygjvVIX1P1wNmFpHIqBMZhmx6qzqI29Zvn8S+TL6z2uemuq6Ykc+pVFn/rO6cXO+koglpcZKapub+fRJ4dTF2zjyFhFe8HpMf2kSq6NBfiwjsAHpDPn5oneXtvamqS59TrzEf1+kbqO0SJ66Qv9sylEUbAJ0D1hagxzS98E8aCL6r98eXyix48d1tdYam5vOuiiFOakCCaOYTJnem9OBXxtDyBFHcq5qM1LiET9trK88T23M3jrR0McKiL5ssJSJBhc6EVyUp2iyRjO/AoLyVkdHzUEeKQ/UFN4aEdgcNBnuuQqB5GLmFhEam6DWuVyhQ4Sr3fDErteOEILi+TWr6zA0VUoYMrUcvK96tOVbXjVZAOyNIlIcXCIZ0pJl4VrrQU7VWJXj2CMdY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(376002)(136003)(346002)(39860400002)(451199015)(36756003)(82960400001)(86362001)(31696002)(38100700002)(83380400001)(54906003)(66899015)(66946007)(316002)(66556008)(31686004)(30864003)(5660300002)(6506007)(66476007)(2906002)(2616005)(6486002)(8676002)(186003)(478600001)(53546011)(26005)(4326008)(6512007)(8936002)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGtiK0QyTk1GTXBXZEdpdkJqODhUQlVseFk1WkhwaTkxWmxML0puUHFVYnhm?=
 =?utf-8?B?L1RtQXlacFhyNENTMW9XOVJBWlRybnB6TXVQSWZWSEVBS2JoVVhrSlJFSmIy?=
 =?utf-8?B?YUJ6eDcyS3lUYVN3cHJiZmhXVFUva2s1UUdBNjdIejJZWFl5eDRPbnQ0UmtZ?=
 =?utf-8?B?aFVkSkJPdDhNRUxOM3orb3pyazltMjJEVit1NFpMRzB5L1g5NVF5ZWlhd2lW?=
 =?utf-8?B?aTJlWERVSXB3UkF0WHhzQjlqWkVMU2dwVXpOT0pISmcyeTZuVFY2MjBaWHVp?=
 =?utf-8?B?TEswWU05QU9aTGZFSkxyNlZoejZzaUx5bDBxL3B4VnNTT2J2bW1lOUp6anRu?=
 =?utf-8?B?eUhCRDZ3a1FCZDZUZkxuNG1IR3FIZ0V6STl5VlRPZS9uWGdQZytmM0RCR0VQ?=
 =?utf-8?B?em5ia1FzZTNkU01qL2hSSEI4ZmNtaE9VdDVTRmVYNkdobUtEUE9qRWZNaDVS?=
 =?utf-8?B?VDRqUHpaR3RwZk9oY0NmMFpHRVpJVVN6VGtBWFVXZk5Oc2I2V3JFNElvRHd6?=
 =?utf-8?B?Y0RrWjAyaGtpWVcxY2hWQ0x3Q3hHaUs0QjFFUVBsVjVPNmF6bi9MbEE4OG1F?=
 =?utf-8?B?dHo0c0ZQb1NRVnFMVXZTeXRudHJKTWg0eW5ZQTB1SjBNVERuM1ZRSDBPSUxy?=
 =?utf-8?B?ZmY3emNaSDBwUkFwUmsxUXVKUzlxa1ZYWDNqcXZQV05palBBWkkyd1pxeWxl?=
 =?utf-8?B?elE2ZnFBN0pKRFFRNjhNYVZ4aWdUODBVSkxJMjdEekF0d1UxZnVib2Zhbjl6?=
 =?utf-8?B?M1FFN3NWajJORnR0MjRyNGtVNGJ0YkRpa09jMFlOTzN3RHgwaHord280T0tF?=
 =?utf-8?B?aHNMQVhUeWl5VElNZERXQW9DdzB4VWE5eHRyR1ZzOVhHNngvM0tJZ1NkeFNk?=
 =?utf-8?B?T2JvbHBZRHBlWGZmTlpsYit1Um5aZ0hpVmpPZHBWMGNWY3hkRzBzaVFHcGlW?=
 =?utf-8?B?ZS9IMnFDYkZVRGp5RHV2cW9YSjRhcEhSanlyMUgvSnJDeXV2NVluYWlqVnl4?=
 =?utf-8?B?QXAzakNkL0tGdkpyaHFiWm1ueGc4Y2ljR1dNcnlVVEptOE9KNkRXL0ttWXYx?=
 =?utf-8?B?SzhwdUFET1ZUUDNLbURyOXluNDl0QmJHK2F1SFlkQlkwM29UY3JjVkFEbkQz?=
 =?utf-8?B?RkZyUDNPdFlqczV2aTJ6dU85dSs4cmh4K2QxZWV4MFJ5ZWdJaHN1RjFxa01q?=
 =?utf-8?B?bXlseng2bE5JbERuQ1BlSnZoKy9BbzUvcTRLSUN1TnVSaUhIQnY4bTFHY2dx?=
 =?utf-8?B?Q3kzR2M5bENLZkNINDNQT0JiNlRVM1MwQS9tTm51OTluTHRQN05jbFE2RllS?=
 =?utf-8?B?alJnOFV0ZkdZUXovQitNN1J6SXJPV2YxQkFPb1JvZnpYTWZYWG8rQ2VTY1FC?=
 =?utf-8?B?blZyYS8yNTNzZFBMRjBMQ0hIY2VxUmtwcFZrZU93OGVqczN6MXdxRlpsS2E4?=
 =?utf-8?B?M2hVTC9ZbmFxSzU2V0lyVkdPeGZGdnVJdGZvLzF4TU1pZVhpcldFamhwc2N1?=
 =?utf-8?B?SWJuV0RBT0VGb1gxWUR5T2MyajluSWszdC92b0hHVkY1bG0ycFZhdGRDRksv?=
 =?utf-8?B?SmhHTFpCSTVDb1hXZFVMVmEwOGw2cmh6RGZobWthY0ZjcFlyTFZtRm1GQktm?=
 =?utf-8?B?eUdOV0FRb1ZFQ3RCbFJqSnNGbW9XRG93bmh5d1BnY2xBMFJIUTNCYlNUTnVM?=
 =?utf-8?B?SUlsRGcvS0ZLUzh5VG5ZWHNxckZHdEloanFFaGM4aW9xSTdkUUVFYmZJTVhC?=
 =?utf-8?B?bzlOVEppQm82amlVWDBJaEpjWitvRUp2UTh4czg0ellEcVMwcnc0NlpSYzNY?=
 =?utf-8?B?Vkk0TjBCNkpuU0p2Sm9FVXBmcmUxZWN2dEl4TVRzMmlRUmhVT1NxMDZ1MWl4?=
 =?utf-8?B?aVgvRHBHd1BaYm90Znl6RS9MQUhtcGlvL29zTkw3N3hmU01hRWIxZFRQcmJN?=
 =?utf-8?B?dlpQV3RDNi9Udk00ZjNnY29hdzEyZ3huajJvcWFUYnkyaWVLOG1MOUgwWDlm?=
 =?utf-8?B?Qll2TWY2QmwzRUxEUVRxUnJsK2x4Qk54bWZ5WEt0TmRDejVtS0dOakpjK1Z1?=
 =?utf-8?B?VTViUStWQk1BME4vNjFnNDVvY1FHdmw2bEd1UU1CSGtkcXl6Tk1mV3ZiSStB?=
 =?utf-8?B?bndTYXo4SVl5R2lhUVcyeU1NUWNTeGFGclZlRmdHelZxZ1B6ZXBHbnZCMDVK?=
 =?utf-8?Q?QjfokRRdOhKNk3Fs6V2DOv0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16de8645-1c6e-45d4-cdc4-08dab60c8659
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 22:10:13.7660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B119zbAftbTyP2BGQ36EUwFU0hUA2pu+Z2m/ydk0ivhm4ZEEZQ3pqC3753qrtaPZpi5ABzTW6ibB/3Fcl8XKq0S0PxyDoNsM2EOoo+oJJy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5912
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
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 dri-devel@lists.freedesktop.org, Alan
 Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/24/2022 2:46 PM, John Harrison wrote:
> On 10/24/2022 14:39, Ceraolo Spurio, Daniele wrote:
>> On 10/24/2022 2:33 PM, John Harrison wrote:
>>> On 10/21/2022 17:10, Daniele Ceraolo Spurio wrote:
>>>> From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>>>
>>>> With MTL standalone media architecture the wopcm layout has changed 
>>>> with
>>>> separate partitioning in WOPCM for GCD/GT GuC and SA Media GuC. The 
>>>> size
>>>> of WOPCM is 4MB with lower 2MB for SA Media and upper 2MB for GCD/GT.
>>> Given that GCD is not a term used anywhere in the driver, I think it 
>>> either needs to be either explained or dropped. Plus, Graphics 
>>> Companion Die seems a confusing name for the root GT. Surely the 
>>> media GT is the companion? Especially as the code seems to be 
>>> written such that the 'companion' is required but the media is 
>>> optional.
>>>
>>> While on the subject, the explanation of SA should be more explicit. 
>>> E.g. "With MTL Stand Alone Media architecture, the wopcm...".
>>
>> would this work:
>>
>> With MTL standalone media architecture the wopcm layout has changed, 
>> with
>> separate partitioning in WOPCM for the root GT GuC and the media GT GuC.
>> The size of WOPCM is 4MB with the lower 2MB reserved for the media GT 
>> and
>> the upper 2MB for the root GT.
> Except that the diagram below still talks about GCD and SA...

I'm just going to drop the diagram since we don't use that info at all 
because the WOPCM is pre-programmed.

Daniele

>
>>
>>>
>>>>
>>>>      +=====+===> +====================+ <== WOPCM TOP
>>>>      ^     ^     |                    |
>>>>      |     |     |                    |
>>>>      |    GCD    |   GCD RC6 Image    |
>>>>      |    GuC    |    Power Context   |
>>>>      |    WOPCM  |                    |
>>>>      |    Size   +--------------------+
>>>>      |     |     |   GCD GuC Image    |
>>>>      |     |     |                    |
>>>>      |     v     |                    |
>>>>      |     +===> +====================+ <== SA Media GuC WOPCM Top
>>>>      |     ^     |                    |
>>>>      |   SA Media|                    |
>>>>      |    GuC    | SA Media RC6 Image |
>>>>      |   WOPCM   |    Power Context   |
>>>>      |    Size   |                    |
>>>>    WOPCM   |     +--------------------+
>>>>      |     |     |                    |
>>>>      |     |     | SA Media GuC Image |
>>>>      |     v     |                    |
>>>>      |     +===> +====================+ <== GuC WOPCM base
>>>>      |           |     WOPCM RSVD     |
>>>>      |           +------------------- + <== HuC Firmware Top
>>>>      v           |      HuC FW        |
>>>>      +=========> +====================+ <== WOPCM Base
>>>>
>>>> Given that MTL has GuC deprivilege, the WOPCM registers are pre-locked
>>>> by the bios. Therefore, we can skip all the math for the partitioning
>>>> and just limit ourselves to sanity checking the values.
>>>>
>>>> v2: fix makefile file ordering (Jani)
>>>> v3: drop XELPM_SAMEDIA_WOPCM_SIZE, check huc instead of VDBOX (John)
>>>>
>>>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>>> Signed-off-by: Daniele Ceraolo Spurio 
>>>> <daniele.ceraolospurio@intel.com>
>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>> Cc: John Harrison <john.c.harrison@intel.com>
>>>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>>>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>>>> ---
>>>>   Documentation/gpu/i915.rst                  |  2 +-
>>>>   drivers/gpu/drm/i915/Makefile               |  5 ++-
>>>>   drivers/gpu/drm/i915/gt/intel_ggtt.c        |  2 +-
>>>>   drivers/gpu/drm/i915/gt/intel_gt.c          |  1 +
>>>>   drivers/gpu/drm/i915/gt/intel_gt_types.h    |  2 +
>>>>   drivers/gpu/drm/i915/{ => gt}/intel_wopcm.c | 44 
>>>> +++++++++++++++------
>>>>   drivers/gpu/drm/i915/{ => gt}/intel_wopcm.h |  0
>>>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c       |  4 +-
>>>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c    | 14 ++++---
>>>>   drivers/gpu/drm/i915/i915_driver.c          |  2 -
>>>>   drivers/gpu/drm/i915/i915_drv.h             |  3 --
>>>>   drivers/gpu/drm/i915/i915_gem.c             |  5 ++-
>>>>   12 files changed, 52 insertions(+), 32 deletions(-)
>>>>   rename drivers/gpu/drm/i915/{ => gt}/intel_wopcm.c (87%)
>>>>   rename drivers/gpu/drm/i915/{ => gt}/intel_wopcm.h (100%)
>>>>
>>>> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
>>>> index 4e59db1cfb00..60ea21734902 100644
>>>> --- a/Documentation/gpu/i915.rst
>>>> +++ b/Documentation/gpu/i915.rst
>>>> @@ -494,7 +494,7 @@ WOPCM
>>>>   WOPCM Layout
>>>>   ~~~~~~~~~~~~
>>>>   -.. kernel-doc:: drivers/gpu/drm/i915/intel_wopcm.c
>>>> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_wopcm.c
>>>>      :doc: WOPCM Layout
>>>>     GuC
>>>> diff --git a/drivers/gpu/drm/i915/Makefile 
>>>> b/drivers/gpu/drm/i915/Makefile
>>>> index 2535593ab379..cf3a96b3cd58 100644
>>>> --- a/drivers/gpu/drm/i915/Makefile
>>>> +++ b/drivers/gpu/drm/i915/Makefile
>>>> @@ -127,9 +127,11 @@ gt-y += \
>>>>       gt/intel_sseu.o \
>>>>       gt/intel_sseu_debugfs.o \
>>>>       gt/intel_timeline.o \
>>>> +    gt/intel_wopcm.o \
>>>>       gt/intel_workarounds.o \
>>>>       gt/shmem_utils.o \
>>>>       gt/sysfs_engines.o
>>>> +
>>>>   # x86 intel-gtt module support
>>>>   gt-$(CONFIG_X86) += gt/intel_ggtt_gmch.o
>>>>   # autogenerated null render state
>>>> @@ -183,8 +185,7 @@ i915-y += \
>>>>         i915_trace_points.o \
>>>>         i915_ttm_buddy_manager.o \
>>>>         i915_vma.o \
>>>> -      i915_vma_resource.o \
>>>> -      intel_wopcm.o
>>>> +      i915_vma_resource.o
>>>>     # general-purpose microcontroller (GuC) support
>>>>   i915-y += gt/uc/intel_uc.o \
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c 
>>>> b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>>> index 6b58c95ad6a0..9263f10ecd28 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>>> @@ -560,7 +560,7 @@ static int init_ggtt(struct i915_ggtt *ggtt)
>>>>        * why.
>>>>        */
>>>>       ggtt->pin_bias = max_t(u32, I915_GTT_PAGE_SIZE,
>>>> - intel_wopcm_guc_size(&ggtt->vm.i915->wopcm));
>>>> + intel_wopcm_guc_size(&ggtt->vm.gt->wopcm));
>>>>         ret = intel_vgt_balloon(ggtt);
>>>>       if (ret)
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c 
>>>> b/drivers/gpu/drm/i915/gt/intel_gt.c
>>>> index 27dbb9e4bd6c..8c751314df3d 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>>>> @@ -56,6 +56,7 @@ void intel_gt_common_init_early(struct intel_gt *gt)
>>>>       seqcount_mutex_init(&gt->tlb.seqno, &gt->tlb.invalidate_lock);
>>>>       intel_gt_pm_init_early(gt);
>>>>   +    intel_wopcm_init_early(&gt->wopcm);
>>>>       intel_uc_init_early(&gt->uc);
>>>>       intel_rps_init_early(&gt->rps);
>>>>   }
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h 
>>>> b/drivers/gpu/drm/i915/gt/intel_gt_types.h
>>>> index 64aa2ba624fc..2d18fd9ab11f 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
>>>> @@ -30,6 +30,7 @@
>>>>   #include "intel_migrate_types.h"
>>>>   #include "intel_wakeref.h"
>>>>   #include "pxp/intel_pxp_types.h"
>>>> +#include "intel_wopcm.h"
>>>>     struct drm_i915_private;
>>>>   struct i915_ggtt;
>>>> @@ -100,6 +101,7 @@ struct intel_gt {
>>>>         struct intel_uc uc;
>>>>       struct intel_gsc gsc;
>>>> +    struct intel_wopcm wopcm;
>>>>         struct {
>>>>           /* Serialize global tlb invalidations */
>>>> diff --git a/drivers/gpu/drm/i915/intel_wopcm.c 
>>>> b/drivers/gpu/drm/i915/gt/intel_wopcm.c
>>>> similarity index 87%
>>>> rename from drivers/gpu/drm/i915/intel_wopcm.c
>>>> rename to drivers/gpu/drm/i915/gt/intel_wopcm.c
>>>> index 322fb9eeb880..c91f234adc55 100644
>>>> --- a/drivers/gpu/drm/i915/intel_wopcm.c
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_wopcm.c
>>>> @@ -64,9 +64,9 @@
>>>>   #define GEN9_GUC_FW_RESERVED    SZ_128K
>>>>   #define GEN9_GUC_WOPCM_OFFSET    (GUC_WOPCM_RESERVED + 
>>>> GEN9_GUC_FW_RESERVED)
>>>>   -static inline struct drm_i915_private *wopcm_to_i915(struct 
>>>> intel_wopcm *wopcm)
>>>> +static inline struct intel_gt *wopcm_to_gt(struct intel_wopcm *wopcm)
>>>>   {
>>>> -    return container_of(wopcm, struct drm_i915_private, wopcm);
>>>> +    return container_of(wopcm, struct intel_gt, wopcm);
>>>>   }
>>>>     /**
>>>> @@ -77,7 +77,8 @@ static inline struct drm_i915_private 
>>>> *wopcm_to_i915(struct intel_wopcm *wopcm)
>>>>    */
>>>>   void intel_wopcm_init_early(struct intel_wopcm *wopcm)
>>>>   {
>>>> -    struct drm_i915_private *i915 = wopcm_to_i915(wopcm);
>>>> +    struct intel_gt *gt = wopcm_to_gt(wopcm);
>>>> +    struct drm_i915_private *i915 = gt->i915;
>>>>         if (!HAS_GT_UC(i915))
>>>>           return;
>>>> @@ -157,14 +158,16 @@ static bool check_hw_restrictions(struct 
>>>> drm_i915_private *i915,
>>>>       return true;
>>>>   }
>>>>   -static bool __check_layout(struct drm_i915_private *i915, u32 
>>>> wopcm_size,
>>>> +static bool __check_layout(struct intel_gt *gt, u32 wopcm_size,
>>>>                  u32 guc_wopcm_base, u32 guc_wopcm_size,
>>>>                  u32 guc_fw_size, u32 huc_fw_size)
>>>>   {
>>>> +    struct drm_i915_private *i915 = gt->i915;
>>> This is no longer required now that the MEDIA_VER check is gone?
>>
>> This is still needed because i915 is still used (e.g. in the line 
>> below). It was passed as a parameter before, but now that we pass in 
>> intel_gt we need to define it locally.
> Doh! Just call me blind.
>
> John.
>
>>
>>>>       const u32 ctx_rsvd = context_reserved_size(i915);
>>>>       u32 size;
>>>>         size = wopcm_size - ctx_rsvd;
>>>> +
>>> Likewise, is this blank line still intended?
>>
>> No, I'll drop it.
>>
>> Daniele
>>
>>>
>>> John.
>>>
>>>>       if (unlikely(range_overflows(guc_wopcm_base, guc_wopcm_size, 
>>>> size))) {
>>>>           drm_err(&i915->drm,
>>>>               "WOPCM: invalid GuC region layout: %uK + %uK > %uK\n",
>>>> @@ -181,12 +184,14 @@ static bool __check_layout(struct 
>>>> drm_i915_private *i915, u32 wopcm_size,
>>>>           return false;
>>>>       }
>>>>   -    size = huc_fw_size + WOPCM_RESERVED_SIZE;
>>>> -    if (unlikely(guc_wopcm_base < size)) {
>>>> -        drm_err(&i915->drm, "WOPCM: no space for %s: %uK < %uK\n",
>>>> -            intel_uc_fw_type_repr(INTEL_UC_FW_TYPE_HUC),
>>>> -            guc_wopcm_base / SZ_1K, size / SZ_1K);
>>>> -        return false;
>>>> +    if (intel_uc_supports_huc(&gt->uc)) {
>>>> +        size = huc_fw_size + WOPCM_RESERVED_SIZE;
>>>> +        if (unlikely(guc_wopcm_base < size)) {
>>>> +            drm_err(&i915->drm, "WOPCM: no space for %s: %uK < 
>>>> %uK\n",
>>>> + intel_uc_fw_type_repr(INTEL_UC_FW_TYPE_HUC),
>>>> +                guc_wopcm_base / SZ_1K, size / SZ_1K);
>>>> +            return false;
>>>> +        }
>>>>       }
>>>>         return check_hw_restrictions(i915, guc_wopcm_base, 
>>>> guc_wopcm_size,
>>>> @@ -228,8 +233,8 @@ static bool __wopcm_regs_writable(struct 
>>>> intel_uncore *uncore)
>>>>    */
>>>>   void intel_wopcm_init(struct intel_wopcm *wopcm)
>>>>   {
>>>> -    struct drm_i915_private *i915 = wopcm_to_i915(wopcm);
>>>> -    struct intel_gt *gt = to_gt(i915);
>>>> +    struct intel_gt *gt = wopcm_to_gt(wopcm);
>>>> +    struct drm_i915_private *i915 = gt->i915;
>>>>       u32 guc_fw_size = intel_uc_fw_get_upload_size(&gt->uc.guc.fw);
>>>>       u32 huc_fw_size = intel_uc_fw_get_upload_size(&gt->uc.huc.fw);
>>>>       u32 ctx_rsvd = context_reserved_size(i915);
>>>> @@ -274,6 +279,19 @@ void intel_wopcm_init(struct intel_wopcm *wopcm)
>>>>           goto check;
>>>>       }
>>>>   +    /*
>>>> +     * On platforms with a media GT, the WOPCM is partitioned 
>>>> between the
>>>> +     * two GTs, so we would have to take that into account when 
>>>> doing the
>>>> +     * math below. There is also a new section reserved for the 
>>>> GSC context
>>>> +     * that would have to be factored in. However, all platforms 
>>>> with a
>>>> +     * media GT also have GuC depriv enabled, so the WOPCM regs are
>>>> +     * pre-locked and therefore we don't have to do the math 
>>>> ourselves.
>>>> +     */
>>>> +    if (unlikely(i915->media_gt)) {
>>>> +        drm_err(&i915->drm, "Unlocked WOPCM regs with media GT\n");
>>>> +        return;
>>>> +    }
>>>> +
>>>>       /*
>>>>        * Aligned value of guc_wopcm_base will determine available 
>>>> WOPCM space
>>>>        * for HuC firmware and mandatory reserved area.
>>>> @@ -295,7 +313,7 @@ void intel_wopcm_init(struct intel_wopcm *wopcm)
>>>>           guc_wopcm_base / SZ_1K, guc_wopcm_size / SZ_1K);
>>>>     check:
>>>> -    if (__check_layout(i915, wopcm_size, guc_wopcm_base, 
>>>> guc_wopcm_size,
>>>> +    if (__check_layout(gt, wopcm_size, guc_wopcm_base, 
>>>> guc_wopcm_size,
>>>>                  guc_fw_size, huc_fw_size)) {
>>>>           wopcm->guc.base = guc_wopcm_base;
>>>>           wopcm->guc.size = guc_wopcm_size;
>>>> diff --git a/drivers/gpu/drm/i915/intel_wopcm.h 
>>>> b/drivers/gpu/drm/i915/gt/intel_wopcm.h
>>>> similarity index 100%
>>>> rename from drivers/gpu/drm/i915/intel_wopcm.h
>>>> rename to drivers/gpu/drm/i915/gt/intel_wopcm.h
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c 
>>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>>> index dbd048b77e19..4cd8a787f9e5 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>>> @@ -357,8 +357,8 @@ static int uc_init_wopcm(struct intel_uc *uc)
>>>>   {
>>>>       struct intel_gt *gt = uc_to_gt(uc);
>>>>       struct intel_uncore *uncore = gt->uncore;
>>>> -    u32 base = intel_wopcm_guc_base(&gt->i915->wopcm);
>>>> -    u32 size = intel_wopcm_guc_size(&gt->i915->wopcm);
>>>> +    u32 base = intel_wopcm_guc_base(&gt->wopcm);
>>>> +    u32 size = intel_wopcm_guc_size(&gt->wopcm);
>>>>       u32 huc_agent = intel_uc_uses_huc(uc) ? HUC_LOADING_AGENT_GUC 
>>>> : 0;
>>>>       u32 mask;
>>>>       int err;
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>>> index 81e06d71c1a8..0c80ba51a4bd 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>>> @@ -478,10 +478,11 @@ static int check_gsc_manifest(const struct 
>>>> firmware *fw,
>>>>       return 0;
>>>>   }
>>>>   -static int check_ccs_header(struct drm_i915_private *i915,
>>>> +static int check_ccs_header(struct intel_gt *gt,
>>>>                   const struct firmware *fw,
>>>>                   struct intel_uc_fw *uc_fw)
>>>>   {
>>>> +    struct drm_i915_private *i915 = gt->i915;
>>>>       struct uc_css_header *css;
>>>>       size_t size;
>>>>   @@ -523,10 +524,10 @@ static int check_ccs_header(struct 
>>>> drm_i915_private *i915,
>>>>         /* Sanity check whether this fw is not larger than whole 
>>>> WOPCM memory */
>>>>       size = __intel_uc_fw_get_upload_size(uc_fw);
>>>> -    if (unlikely(size >= i915->wopcm.size)) {
>>>> +    if (unlikely(size >= gt->wopcm.size)) {
>>>>           drm_warn(&i915->drm, "%s firmware %s: invalid size: %zu > 
>>>> %zu\n",
>>>>                intel_uc_fw_type_repr(uc_fw->type), 
>>>> uc_fw->file_selected.path,
>>>> -             size, (size_t)i915->wopcm.size);
>>>> +             size, (size_t)gt->wopcm.size);
>>>>           return -E2BIG;
>>>>       }
>>>>   @@ -554,7 +555,8 @@ static int check_ccs_header(struct 
>>>> drm_i915_private *i915,
>>>>    */
>>>>   int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>>>>   {
>>>> -    struct drm_i915_private *i915 = __uc_fw_to_gt(uc_fw)->i915;
>>>> +    struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
>>>> +    struct drm_i915_private *i915 = gt->i915;
>>>>       struct intel_uc_fw_file file_ideal;
>>>>       struct device *dev = i915->drm.dev;
>>>>       struct drm_i915_gem_object *obj;
>>>> @@ -562,7 +564,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>>>>       bool old_ver = false;
>>>>       int err;
>>>>   -    GEM_BUG_ON(!i915->wopcm.size);
>>>> +    GEM_BUG_ON(!gt->wopcm.size);
>>>>       GEM_BUG_ON(!intel_uc_fw_is_enabled(uc_fw));
>>>>         err = i915_inject_probe_error(i915, -ENXIO);
>>>> @@ -615,7 +617,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>>>>       if (uc_fw->loaded_via_gsc)
>>>>           err = check_gsc_manifest(fw, uc_fw);
>>>>       else
>>>> -        err = check_ccs_header(i915, fw, uc_fw);
>>>> +        err = check_ccs_header(gt, fw, uc_fw);
>>>>       if (err)
>>>>           goto fail;
>>>>   diff --git a/drivers/gpu/drm/i915/i915_driver.c 
>>>> b/drivers/gpu/drm/i915/i915_driver.c
>>>> index ffff49868dc5..ba4b71aedc40 100644
>>>> --- a/drivers/gpu/drm/i915/i915_driver.c
>>>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>>>> @@ -371,8 +371,6 @@ static int i915_driver_early_probe(struct 
>>>> drm_i915_private *dev_priv)
>>>>       if (ret)
>>>>           goto err_ttm;
>>>>   -    intel_wopcm_init_early(&dev_priv->wopcm);
>>>> -
>>>>       ret = intel_root_gt_init_early(dev_priv);
>>>>       if (ret < 0)
>>>>           goto err_rootgt;
>>>> diff --git a/drivers/gpu/drm/i915/i915_drv.h 
>>>> b/drivers/gpu/drm/i915/i915_drv.h
>>>> index 9453fdd4205f..66aa2cd9aefe 100644
>>>> --- a/drivers/gpu/drm/i915/i915_drv.h
>>>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>>>> @@ -62,7 +62,6 @@
>>>>   #include "intel_runtime_pm.h"
>>>>   #include "intel_step.h"
>>>>   #include "intel_uncore.h"
>>>> -#include "intel_wopcm.h"
>>>>     struct drm_i915_clock_gating_funcs;
>>>>   struct drm_i915_gem_object;
>>>> @@ -235,8 +234,6 @@ struct drm_i915_private {
>>>>         struct intel_gvt *gvt;
>>>>   -    struct intel_wopcm wopcm;
>>>> -
>>>>       struct pci_dev *bridge_dev;
>>>>         struct rb_root uabi_engines;
>>>> diff --git a/drivers/gpu/drm/i915/i915_gem.c 
>>>> b/drivers/gpu/drm/i915/i915_gem.c
>>>> index 9093d2be9e1c..7a9ce81600a0 100644
>>>> --- a/drivers/gpu/drm/i915/i915_gem.c
>>>> +++ b/drivers/gpu/drm/i915/i915_gem.c
>>>> @@ -1140,9 +1140,10 @@ int i915_gem_init(struct drm_i915_private 
>>>> *dev_priv)
>>>>       if (ret)
>>>>           return ret;
>>>>   -    for_each_gt(gt, dev_priv, i)
>>>> +    for_each_gt(gt, dev_priv, i) {
>>>>           intel_uc_fetch_firmwares(&gt->uc);
>>>> -    intel_wopcm_init(&dev_priv->wopcm);
>>>> +        intel_wopcm_init(&gt->wopcm);
>>>> +    }
>>>>         ret = i915_init_ggtt(dev_priv);
>>>>       if (ret) {
>>>
>>
>

