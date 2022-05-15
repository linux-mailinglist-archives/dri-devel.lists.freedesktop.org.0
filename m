Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E55735275DF
	for <lists+dri-devel@lfdr.de>; Sun, 15 May 2022 07:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B5D10FA0D;
	Sun, 15 May 2022 05:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8307710FA03;
 Sun, 15 May 2022 05:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652593594; x=1684129594;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=JQrxHGTRzML8DujrfZLmhIZZm/BLX9z9F/nA9EnSpBA=;
 b=HYTZi3O7rl6D2gzS5aydNW/Fqwdfwa2x3HRuFT4LOWMcj5quBVSpqgVU
 rvTQ4zfzY5+imzyZGeJijjisyZRoIX22DBQLznmZRINsWomUDOZ560sJr
 ynuacQPDr2m3tLvVm5OX7O3exBjd4qZs8KMwwvssDq8NlOyJol+IgRk9y
 5zCH1SMy4TD01aYq1k1B9CK5ob8AeJ/AUtaowd3aDCNW2yVHaawNKkho7
 Na/LI4cR8ypM3kkBHh06bU3mKA0vD4wBVwwrm7CLCd5+iyV9YMf6Ccnmn
 EmD0qdNHCwj1AFRW8EnRh359MKkqOp0sCRqwZp2bowF8QVqjkfz1EBgQS Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10347"; a="258156023"
X-IronPort-AV: E=Sophos;i="5.91,227,1647327600"; d="scan'208";a="258156023"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2022 22:46:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,227,1647327600"; d="scan'208";a="712949332"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 14 May 2022 22:46:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sat, 14 May 2022 22:46:29 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sat, 14 May 2022 22:46:29 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sat, 14 May 2022 22:46:29 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sat, 14 May 2022 22:46:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EuuvVxrlBESff6tJv9O31ZNIzDtD4Klkwt21cwsW52AvKSX/jSDsWZ2RPaH6pMUtUZr2fYiatbXHqHwWKMxg6bxJ5tace70UtL2xQAgDV0v8B/T3ePzMmG4rJz7jp/BDgby4JoOJ2b83mRuQjZI427oJh5Y6+7L+EDZjM9kN9DCrqOV1/oQJav/h0++Vnotx9IB1Hug/DYVirB/7z1Ro8gQORf0TKJJd9/wj/GyioX31HgBM7o5u51dSDAtH8ir/9vONrnlEy7pyLjclPsH04KYdna4IyeWeHbVr/FpjjQH44cCQTNL7ZQQrCs6lFNr+QG+8heLp8QIpOtDKGgK3CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHv914gZJIyY5NRAAh/NTxloavHG0NMLgpdEj9HiuOA=;
 b=QZLdHUkCEClaX3MPxM0TQPcdQKwGOjvxZTwayuS3/d9amsH7jE6gJMNXxFrC/iYh4IxAec/Pz/7NUlYV2gfPp/sNB+j79CK9yXq8pUhR+16PPmqoWw2BN2KkQ7qbUlA0a5eG41bsifpmeGQRLXMWVU23ake3ziCa7Sv9P2PMfwkOSNARvbJjpPYkzFDqcF7cP9H9gwUMSgE7qEWaplk0MTq2dU38fquFoavIx7ibmkrBkJadR3xYYrohVRchBapNlr/AAi1CHKhCDW2Wg2XvNnJXVgFeLkk8GHq2Dm2j0CGSfV0vk6pTtJ4Jn/Ra2ic0s2DJtocYkSaSUTzzRxFr7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by DM6PR11MB3531.namprd11.prod.outlook.com (2603:10b6:5:61::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Sun, 15 May
 2022 05:46:27 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::587d:a946:3907:11c8]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::587d:a946:3907:11c8%6]) with mapi id 15.20.5250.018; Sun, 15 May 2022
 05:46:27 +0000
Message-ID: <ea1b44d6-d6bf-aba9-8652-64f97f816aab@intel.com>
Date: Sat, 14 May 2022 22:46:25 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc/slpc: Use non-blocking H2G for
 waitboost
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
References: <20220505054010.21879-1-vinay.belgaumkar@intel.com>
 <de063b19-e5f6-342b-d816-c112c446a68f@linux.intel.com>
 <8c8dea74-aa2b-44c1-e1d7-1f613c05bf32@intel.com>
 <032467b7-8794-882a-e45f-6e9d85a716df@intel.com>
 <1d15f38e-c3d8-a521-4a15-50341dae5000@linux.intel.com>
 <ecea4fbb-32cc-5ff3-9bff-3537833dce49@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <ecea4fbb-32cc-5ff3-9bff-3537833dce49@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0201.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::26) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45023eba-a823-4af8-295b-08da3636410c
X-MS-TrafficTypeDiagnostic: DM6PR11MB3531:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB3531260B3CC5A86F5E7E8B1385CC9@DM6PR11MB3531.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hL5oLlX8ZA+VHr16GCjhnWbDIU41RdfGzgzde/ddrIRtO2Y1gRz2lK5zg1SEP1lovBS62Lx+NNu7RE4uyQpquI9g8TU39wMdoEuxNARms01+LXnvxPxz635rhlpEXJtX5pTFbrFE20hFmEvQcN/2JMfudEvRtSJ0Ry+Io5oeZqoUiBbNohiQt5MTjKl29zX3C1Z7Ks43eJRDQyMPFAAjGjtECf/M8TTvTwTNhXLKqJ118xa9SfHxzRNYdw9d3ya1ReUC1MiMrebw8vwI1i5/wrwva+rixiK0lnvjjdBeNbiz0NMKzrMzltaNUDIhaE+Z84d9R6h7bf2y7xG4voqIUpevT+qIkIUYhagfS4AQGm1ND1mCbEsiJ3c5nIyefExzSOV4N6L7YB4Ony9x78CLNkzIJuUM+uZXDBPUfjsgFGNip/6/RB56EefQf0FSKrOzlUlyyL3tvMtYUZmH7HywPnQSdcFFLullS9vhIt0UE5hv5DOW92gnq1WpJJ2scDENT3SfNQzfGAAJbthSqp/rrlP/fyXuS1Z3fnyRfy3hezov3mkeQtIJeoIOdv+jNXsjHm1MMxhtFso2rETWCncbE9EQe6TLSUETF8l+LOlXg6xW+1X5xlskzW/cXgLZVf8nhwR4xOsQlBPUuY5b0o2JQ0JapZADzu7M9mrxSQ4BSoXpk5x2pie57Zov81e77MdY7ZOvexd0PCtwE0OmeV8/swTtsbbiMDWTzNgueXLhwHQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(82960400001)(53546011)(6512007)(6506007)(2616005)(8676002)(5660300002)(31686004)(36756003)(8936002)(2906002)(38100700002)(508600001)(6486002)(66556008)(66476007)(66946007)(83380400001)(186003)(26005)(31696002)(110136005)(316002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEZXbDYyaC9QYjRMajllSFBrV0gwc3FjTU1aWkdMcFJ5SnA3L1l4emVJQjFh?=
 =?utf-8?B?aXd5MEQ1RkZtYk1oNzNpTi9YRUtEbm02UHkzeW14RGwvRkNYL3ZRN05xdlYw?=
 =?utf-8?B?VFJVak9kK2pNYmxsRi9MWmNUcmlQZEdkeVlKbEVkVHhocHFvQ2NLQUNzbFhh?=
 =?utf-8?B?dnAzb0ZMSVlBQlBLb3R1em1OUHh3Z2drbFZhYWFuNGpSS0dJNlpRcDRSZVY4?=
 =?utf-8?B?MHBQb2lsUUp5aW9JcUhVczF6bUxuZy8wc0xzWjZHekRpanFWRjlRWmc2ZlpL?=
 =?utf-8?B?dkdwYlo3ZVIzL0RFcS81WXkvcWwwelY2dzcwUVI1RVVYR2hBcmgzY0xyemZY?=
 =?utf-8?B?T3VzYlY1dmdCM25wVmFJVUJ4NFNDY0h5V1pJbE9JM3BHN3lHcUtIOXNIeVNv?=
 =?utf-8?B?a09zeHVicWNJVGNQZDE1NmlWdHM3c3loNGZqYVExYkZqZGlHR2M2ZkZ0S0dw?=
 =?utf-8?B?WDlPQmJxOWJ1ZXEyUEhuT3JyQW8raFRxL0hWU3M4MVMxMVZNVWRuemlXb1FM?=
 =?utf-8?B?aUtkVXI0a3hyUEE5Y2s1SDMyOVRHNTJ5NE1HQUpJUHJnS2tQTnUrQklXK2Vt?=
 =?utf-8?B?VjRsME1DR1dXSFpNTlpXTnhUNkh2R3QzeWswdUhBMVNPd1c1WWZiY1E1SGFN?=
 =?utf-8?B?aHU0Vm44N29SbUs2OWZPODBzamFacmtGVmhJMnRSdXVXNmdQWURRTnE4blFF?=
 =?utf-8?B?L0duRWVWWHBYOEk5UlhybENDWDZ6MXRjVkx6anpLVTl0bXY5RVlxZDJuMEE3?=
 =?utf-8?B?eXBQWXhXR01IUjhZc2Y1VnhEMUdDRTJBQVlhS3lRTHRnT21TRUprMVM4SzNo?=
 =?utf-8?B?a2kycE5BempSME9QYzRsaXlMOURNOXloamRPbmhsQjhRaXpMUHJnV3ptN0dF?=
 =?utf-8?B?bERrZ3F1U3VuTUtBS2dRT1RWUnlsakZTUGZucG5vSldNMGZuWTJrL2JSbzV5?=
 =?utf-8?B?VmRIZ3JkRUxTcnREc291dW1CcVJ1TEtPbzRoYXB0dDE0Zzgyei9Ib253SEp1?=
 =?utf-8?B?THBhZ2cvelhKd1pDRmt3THgxUkJZN2hvcjF3TnVFb0VITkNkU1crOWV6OExl?=
 =?utf-8?B?MlptSXEzbjRGQXNpZEZ1bmFMNVdtZ3A0dDgxN1FoTGNKeStCRkZTYWF6K0Ux?=
 =?utf-8?B?Ny9KRXVCd1NLVGNPM3daSUF6UDR1T2NwMzBZVytOZHJGRmFGcTFGbHJ6WkdB?=
 =?utf-8?B?bnF1Q2ZHb2xYdEpZQ2FLOVNwR3ArVjNwMW84ajZXRFUxdnNvU056NndxTHZj?=
 =?utf-8?B?OVJlWmZYUWkwa2tpZHczYnZycG5wZ1VKcHdCbCtDMVJ1ZTNZM2xGVFVvODRv?=
 =?utf-8?B?QmZXUlBtci85UTdpVHdjYmhrV1J2NzNDTTI2eWNXeHdmUFRlWE9ybWVYc2NS?=
 =?utf-8?B?UzIyWEVhakw1cFpEMS91dThlNW9aTHVYR0ZGTS85VXBLbHRuRWtCSHpuVnE0?=
 =?utf-8?B?eGlXNFBCdk5PT24xcDhJcVNZaEQ4RVg3RmJQdUxldmlPS1ZGNkJXdEUvMVMr?=
 =?utf-8?B?aFJBcnZ1UEpVWk5LSC80ZkdzVHFIemdvbFE1dUhJL1hCTXVHTERvYkNiMGRV?=
 =?utf-8?B?RW1SU3Jkb3Z1TVRJVXRabEFNc1U0SFhKNWJsQUZTNGhwOE5reDg2Uk8yd3VT?=
 =?utf-8?B?VzZCS3pPOUlNdFZOaWl5QnVlWmg1Y1J4VDhGblpaczg0cDlPMW83RUNBb3VG?=
 =?utf-8?B?eTRudmw0T2hWSG1Qa21TMHQwQ2JCL2R0TUE0VTZaMGs0ajNOOEYzQis5NklV?=
 =?utf-8?B?MEU2cEd3aE5VM0wwbDlyYWFEOC9kTHg2Q2N6L3QwS0FDaTJET1Zmc3NreHZF?=
 =?utf-8?B?bjhqTGh5TVpVRVZnTWRqanZFSEVEVGVkT0V1QmpPaE94VzhsODNFN2JnSEdv?=
 =?utf-8?B?ZzlOM2FTUFJsT083T2xiamNaZ05wc050WDRNZ254L25qM25SUk9rR2x4NTFh?=
 =?utf-8?B?cWJQcXg4ZG1IdUp5ZmRuWlM1MDN4dGRScjl6bUZBaVVpdlh4UzBENS9GQ0Ey?=
 =?utf-8?B?TCtDUUk0WWN3a3BySzd1ZzdPRzNOOE8xcDlSZVJMMldCMzg1V1RsVHgza3Mv?=
 =?utf-8?B?dytaS0hWMHMzaDZFSW1ma2NrUVIrZG55aENJenN6WW9QaUg0WlUxcGE3dFdD?=
 =?utf-8?B?QmdRYmVGNVZrSkRHU1VZdE1vQ0tZaGNocGZzY29iRG1maDZxZWdnNzBaOUZm?=
 =?utf-8?B?SWh0aE94WndycThWenEvZ0VPTHZycU9hRmkzVVF3VTAvenY5aDJKd05TT203?=
 =?utf-8?B?SVE3TjdKVTg2K1h6SlVjMG9tamEzb01KRldIblRNVEthUWJwcU9Ecm0wMUs2?=
 =?utf-8?B?UjZ6Q2hpTE5Ia0NiRFQrVFFGWjFYdHRpcDlWRWF6RE53R1krVys5S1gxZGRO?=
 =?utf-8?Q?2WQmouyXZYcPZRf8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45023eba-a823-4af8-295b-08da3636410c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2022 05:46:27.5827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LmpHHrLQsP5MbW9sSERJB72tA+oFTRo83sbzqO7Fhez+Q8Rg8B12mXDxlNQNfJ0RBYQ9teoV5caLia/DF5SoOur0v5z73Tiw3BAIeeI0Fg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3531
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/6/2022 9:43 AM, John Harrison wrote:
> On 5/6/2022 00:18, Tvrtko Ursulin wrote:
>> On 05/05/2022 19:36, John Harrison wrote:
>>> On 5/5/2022 10:21, Belgaumkar, Vinay wrote:
>>>> On 5/5/2022 5:13 AM, Tvrtko Ursulin wrote:
>>>>> On 05/05/2022 06:40, Vinay Belgaumkar wrote:
>>>>>> SLPC min/max frequency updates require H2G calls. We are seeing
>>>>>> timeouts when GuC channel is backed up and it is unable to respond
>>>>>> in a timely fashion causing warnings and affecting CI.
>>>>>
>>>>> Is it the "Unable to force min freq" error? Do you have a link to 
>>>>> the GitLab issue to add to commit message?
>>>> We don't have a specific error for this one, but have seen similar 
>>>> issues with other H2G which are blocking.
>>>>>
>>>>>> This is seen when waitboosting happens during a stress test.
>>>>>> this patch updates the waitboost path to use a non-blocking
>>>>>> H2G call instead, which returns as soon as the message is
>>>>>> successfully transmitted.
>>>>>
>>>>> AFAIU with this approach, when CT channel is congested, you 
>>>>> instead achieve silent dropping of the waitboost request, right?
>>>> We are hoping it makes it, but just not waiting for it to complete.
>>> We are not 'hoping it makes it'. We know for a fact that it will 
>>> make it. We just don't know when. The issue is not about whether the 
>>> waitboost request itself gets dropped/lost it is about the ack that 
>>> comes back. The GuC will process the message and it will send an 
>>> ack. It's just a question of whether the i915 driver has given up 
>>> waiting for it yet. And if it has, then you get the initial 'timed 
>>> out waiting for ack' followed by a later 'got unexpected ack' message.
>>>
>>> Whereas, if we make the call asynchronous, there is no ack. i915 
>>> doesn't bother waiting and it won't get surprised later.
>>>
>>> Also, note that this is only an issue when GuC itself is backed up. 
>>> Normally that requires the creation/destruction of large numbers of 
>>> contexts in rapid succession (context management is about the 
>>> slowest thing we do with GuC). Some of the IGTs and selftests do 
>>> that with thousands of contexts all at once. Those are generally 
>>> where we see this kind of problem. It would be highly unlikely (but 
>>> not impossible) to hit it in real world usage.
>>
>> Goto ->
>>
>>> The general design philosophy of H2G messages is that asynchronous 
>>> mode should be used for everything if at all possible. It is fire 
>>> and forget and will all get processed in the order sent (same as 
>>> batch buffer execution, really). Synchronous messages should only be 
>>> used when an ack/status is absolutely required. E.g. start of day 
>>> initialisation or things like TLB invalidation where we need to know 
>>> that a cache has been cleared/flushed before updating memory from 
>>> the CPU.
>>>
>>> John.
>>>
>>>
>>>>>
>>>>> It sounds like a potentially important feedback from the field to 
>>>>> lose so easily. How about you added drm_notice to the worker when 
>>>>> it fails?
>>>>>
>>>>> Or simply a "one line patch" to replace i915_probe_error (!?) with 
>>>>> drm_notice and keep the blocking behavior. (I have no idea what is 
>>>>> the typical time to drain the CT buffer, and so to decide whether 
>>>>> waiting or dropping makes more sense for effectiveness of 
>>>>> waitboosting.)
>>>>>
>>>>> Or since the congestion /should not/ happen in production, then 
>>>>> the argument is why complicate with more code, in which case going 
>>>>> with one line patch is an easy way forward?
>>
>> Here. Where I did hint I understood the "should not happen in 
>> production angle".
>>
>> So statement is GuC is congested in processing requests, but the h2g 
>> buffer is not congested so no chance intel_guc_send_nb() will fail 
>> with no space in that buffer? Sounds a bit un-intuitive.
> That's two different things. The problem of no space in the H2G buffer 
> is the same whether the call is sent blocking or non-blocking. The 
> wait-for-space version is intel_guc_send_busy_loop() rather than 
> intel_guc_send_nb(). NB: _busy_loop is a wrapper around _nb, so the 
> wait-for-space version is also non-blocking ;). If a non-looping 
> version is used (blocking or otherwise) it will return -EBUSY if there 
> is no space. So both the original SLPC call and this non-blocking 
> version will still get an immediate EBUSY return code if the H2G 
> channel is backed up completely.
>
> Whether the code should be handling EBUSY or not is another matter. 
> Vinay, does anything higher up do a loop on EBUSY? If not, maybe it 
> should be using the _busy_loop() call instead?
>
> The blocking vs non-blocking is about waiting for a response if the 
> command is successfully sent. The blocking case will sit and spin for 
> a reply, the non-blocking assumes success and expects an asynchronous 
> error report on failure. The assumption being that the call can't fail 
> unless something is already broken - i915 sending invalid data to GuC 
> for example. And thus any failure is in the BUG_ON category rather 
> than the try again with a different approach and/or try again later 
> category.
>
> This is the point of the change. We are currently getting timeout 
> errors when the H2G channel has space so the command can be sent, but 
> the channel already contains a lot of slow operations. The command has 
> been sent and will be processed successfully, it just takes longer 
> than the i915 timeout. Given that we don't actually care about the 
> completion response for this command, there is no point in either a) 
> sitting in a loop waiting for it or b) complaining that it doesn't 
> happen in a timely fashion. Hence the plan to make it non-blocking.
>
>>
>> Anyway, it sounds okay to me to use the non-blocking, but I would 
>> like to see some logging if the unexpected does happen. Hence I was 
>> suggesting the option of adding drm_notice logging if the send fails 
>> from the worker. (Because I think other callers would already 
>> propagate the error, like sysfs.)
>>
>>   err = slpc_force_min_freq(slpc, slpc->boost_freq);
>>   if (!err)
>>        slpc->num_boosts++;
>>   else
>>        drm_notice(... "Failed to send waitboost request (%d)", err);
> The only error this should ever report would be EBUSY when the H2G 
> channel is full. Anything else (ENODEV, EPIPE, etc.) means the system 
> is already toast and bigger errors will likely have already have been 
> reported.
>
> As above, maybe this should be looping on the EBUSY case. Presumably 
> it is safe to do so if it was already looping waiting for the 
> response. And then printing a notice level warning on more 
> catastrophic errors seems reasonable.

Not sure if we need an extensive busy loop here. All we are trying to do 
(through a tasklet) is bump the min freq. If that fails due to EBUSY, we 
will just end up

retrying next time around.

Thanks,

Vinay.

>
> John.
>
>>
>> Something like that.
>>
>> Regards,
>>
>> Tvrtko
>>
>>
>>>> Even if we soften the blow here, the actual timeout error occurs in 
>>>> the intel_guc_ct.c code, so we cannot hide that error anyways. 
>>>> Making this call non-blocking will achieve both things.
>>>>
>>>> Thanks,
>>>>
>>>> Vinay.
>>>>
>>>>>
>>>>> Regards,
>>>>>
>>>>> Tvrtko
>>>>>
>>>>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 38 
>>>>>> ++++++++++++++++-----
>>>>>>   1 file changed, 30 insertions(+), 8 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c 
>>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>>>> index 1db833da42df..c852f73cf521 100644
>>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>>>> @@ -98,6 +98,30 @@ static u32 slpc_get_state(struct 
>>>>>> intel_guc_slpc *slpc)
>>>>>>       return data->header.global_state;
>>>>>>   }
>>>>>>   +static int guc_action_slpc_set_param_nb(struct intel_guc *guc, 
>>>>>> u8 id, u32 value)
>>>>>> +{
>>>>>> +    u32 request[] = {
>>>>>> +        GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
>>>>>> +        SLPC_EVENT(SLPC_EVENT_PARAMETER_SET, 2),
>>>>>> +        id,
>>>>>> +        value,
>>>>>> +    };
>>>>>> +    int ret;
>>>>>> +
>>>>>> +    ret = intel_guc_send_nb(guc, request, ARRAY_SIZE(request), 0);
>>>>>> +
>>>>>> +    return ret > 0 ? -EPROTO : ret;
>>>>>> +}
>>>>>> +
>>>>>> +static int slpc_set_param_nb(struct intel_guc_slpc *slpc, u8 id, 
>>>>>> u32 value)
>>>>>> +{
>>>>>> +    struct intel_guc *guc = slpc_to_guc(slpc);
>>>>>> +
>>>>>> +    GEM_BUG_ON(id >= SLPC_MAX_PARAM);
>>>>>> +
>>>>>> +    return guc_action_slpc_set_param_nb(guc, id, value);
>>>>>> +}
>>>>>> +
>>>>>>   static int guc_action_slpc_set_param(struct intel_guc *guc, u8 
>>>>>> id, u32 value)
>>>>>>   {
>>>>>>       u32 request[] = {
>>>>>> @@ -208,12 +232,10 @@ static int slpc_force_min_freq(struct 
>>>>>> intel_guc_slpc *slpc, u32 freq)
>>>>>>        */
>>>>>>         with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>>>>>> -        ret = slpc_set_param(slpc,
>>>>>> - SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>>>>>> -                     freq);
>>>>>> -        if (ret)
>>>>>> -            i915_probe_error(i915, "Unable to force min freq to 
>>>>>> %u: %d",
>>>>>> -                     freq, ret);
>>>>>> +        /* Non-blocking request will avoid stalls */
>>>>>> +        ret = slpc_set_param_nb(slpc,
>>>>>> + SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>>>>>> +                    freq);
>>>>>>       }
>>>>>>         return ret;
>>>>>> @@ -231,8 +253,8 @@ static void slpc_boost_work(struct 
>>>>>> work_struct *work)
>>>>>>        */
>>>>>>       mutex_lock(&slpc->lock);
>>>>>>       if (atomic_read(&slpc->num_waiters)) {
>>>>>> -        slpc_force_min_freq(slpc, slpc->boost_freq);
>>>>>> -        slpc->num_boosts++;
>>>>>> +        if (!slpc_force_min_freq(slpc, slpc->boost_freq))
>>>>>> +            slpc->num_boosts++;
>>>>>>       }
>>>>>>       mutex_unlock(&slpc->lock);
>>>>>>   }
>>>
>
