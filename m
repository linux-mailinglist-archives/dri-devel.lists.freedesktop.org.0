Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7354E4C3677
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 21:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CECF110E13B;
	Thu, 24 Feb 2022 20:03:09 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74AA410E13B;
 Thu, 24 Feb 2022 20:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645732988; x=1677268988;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UYEHul+IB3Kkkkp+9llMTJ2nTVho93pjrOUvaF/8cz0=;
 b=ahFo4g6GST8qpYnRoB/kQhgNYU1K70JbGgNrBzZtlaJ6isBU9Z+uSjYb
 MShFOT/c4YL7neypoLOtNlB/5pRv557tHciydxZ5XAS6g4riD+lOyOcUo
 uiLxcfbxixHCSl9lt3PR8cuAqywIvz3H+ADjEYI6/GWP2xKpEIZEvKxPT
 pyZL2OWpt8Lku2JQOF+1En+TB7z/sS9Ztho6WbTL7uKpaTQ5JiuzCIby+
 P9ML5OEfHA85AmME1WdRpfCHqqsNIfmx9DyOtxFJZ4qi1JEJ+1q7li9AP
 D8LGAoNcrkMhHH0g+OUcNZcgZhb5zj+leLpfSCkuqMSr9EJwd0ZZySpST A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="232962864"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="232962864"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 12:03:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="637972306"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 24 Feb 2022 12:03:07 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 24 Feb 2022 12:03:07 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 24 Feb 2022 12:03:06 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 24 Feb 2022 12:03:06 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 24 Feb 2022 12:02:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ba5Dhhu4chKbOuALsDrFAT11Ylqk2VfMWoZJ5acWx0W4ZAjeADWPrm+7OEzda7BbCDgqo4EsObE6Cpt85nAtXPcMyyFELWZzQrHgMyTJd+hnS7/AZtxi3Iwi2ompzQbag6VVBxCDPhA9b6HSD0bdSeMq3BymX7wnWYzsIzwNoDLL4SWbD0saVlaBRLZizQz/yc7G3kMnPWMQEDGoCNhRUcVERlw0E11jcCXgKZ72h7qeRD2jMFzwJ3m8Pik99G0FGT4dqCKMbqPQFPR3aaXgpmww2A/Is2e6x+VpkQkc2oWf4m/FIBKZo3i75SvPsK/G4nO3G5kcGAXbv2/qOAaXLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JrnWtizvqUXICvik2+JWiy3KgCrkSITdHkHRvvfkThE=;
 b=bk67H9h/A0jD/r6YzWXo50qoD1vOAQRNKHYjkBfyb7ywW20wCn0giw73n/JkGTeexBfDNQR9joO2iuqziwrpurocx/sAW4/ZCT0fhCATsHXsxFvqRSvKwOUxcq4TL74qIKc5buEhniXXMH2Ot5kDU8NG4WtlI3AtsRcf1uR2AilUiyT/Eu9BDi0SpuvmxlWXDl+j1bbaSxJEM9mbUVtimPyYkaizFl3jemwHKKM4ZeZhSPZ1ItvsZ5TeSHJnrnUv/2qIUGraOiVel6Ib3pUhDtk3OkLKD94V8VIo5mE8CtQW8aJNC0l6z055E7Y+HMYuJr6S0r4G3434oYuQ0btQ8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MW3PR11MB4763.namprd11.prod.outlook.com (2603:10b6:303:2c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Thu, 24 Feb
 2022 20:02:57 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5017.022; Thu, 24 Feb 2022
 20:02:57 +0000
Message-ID: <6526515c-a4d1-1815-3ee8-6a35dfa5036f@intel.com>
Date: Thu, 24 Feb 2022 12:02:54 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH 0/3] Improve anti-pre-emption w/a for compute
 workloads
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <647b611a-d159-3a6f-2e3a-c8039a9503ec@linux.intel.com>
 <7ceb4723-7ebf-3762-ddb7-b16e48e804d3@intel.com>
 <ccc8d37f-2bcc-b258-4969-430c609c11d0@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ccc8d37f-2bcc-b258-4969-430c609c11d0@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0107.namprd03.prod.outlook.com
 (2603:10b6:303:b7::22) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8ab9cbf-79a4-4ddb-a51d-08d9f7d0a6f0
X-MS-TrafficTypeDiagnostic: MW3PR11MB4763:EE_
X-Microsoft-Antispam-PRVS: <MW3PR11MB47635EF236C1AC75D86B74A4BD3D9@MW3PR11MB4763.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zP8lRvTsyMZKILNdIX3TfD2mCmpz6RDkY2bTF+3DBeI2s6GtxiLaHqpgmHssFg4BgLHrsuELhyf0j1FaH0BnrgwC11+r1B+0AIxCLYn/EM0zku65RdUroiws5bC2A0l0S6RUWPiuqkHTVg/myrSaUkdHmTwa5GgrbsfGNf91K6rNXQpcw4i+Aw253x+tWUwYf6WCp5qLNDVSI/f7xml3J3zA8x5cdd1FYqIRbcPLwth2AzdW3Z6NctNUnlh4XW/3Zxlo66chT6RcrY18cVKrBaojQHCBhP7s1FKICIPbx9OKaaPhvc/5yN7wkjcNVVYesrcS8oEUIS17OxYTphHl0pCMKO6tzvepkvPjN3hZBZJ6UvikXb19i7TY2RVRQNBtbe46SnbCTWemy2gA10/Hxzzgd5hILKZ62D+/ARB7oShlQ/9zTbkh+1gOU8yNN69haqeQ9uVeOS5xXBtwnKB9P+z9aJyCAXPSR8/bJw74mhHPz2MhuzLw144iiRlbAWx7i/Nme6Q4iRpindFpcauC6Dvq8NOW9Ea6/SpSnvCvhY7tpsKsU93k6ZcHMvXqLSMydtzMAlShdGI27txt3H+RbiAMuwwcKW8hgx4zbwKIOhbuMWuHGEFRJ1tnajMpkzE5SsT8FcOLnam0bkP46/DoUthUAuDMMeKv0f/ZMxcS/ZaX5u91iU3M/yMaWW06WXbEmccg+QcGfsQHycY1Nxo9Eoys8+9RtqQqXRS4YFeyL3Rrlosh0qHvrFKVLe+9TQuD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31686004)(31696002)(6506007)(6512007)(6666004)(66476007)(66556008)(66946007)(4326008)(83380400001)(6486002)(36756003)(316002)(8676002)(38100700002)(2616005)(8936002)(26005)(186003)(53546011)(86362001)(5660300002)(82960400001)(2906002)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTZJTGNwU3pSNys3cU45Q0RUWG8rQVRNWGZRYlJOWjNkclc0VnJPVjBLNHhz?=
 =?utf-8?B?VjZiUWJHMTNaa1JBRW9PNjl5L1l2ZGtucnI5aElLaE1oUGs5ZGJLanZzMnYy?=
 =?utf-8?B?OFhnaWRMWTZLQUJXa3F2aFFPVnIxbm9kZng4NzVoSDF3U2NxQndRNGdFZHdo?=
 =?utf-8?B?Z29CWE40S0ZZK2VYWjF4UjNGVXpzRnNLdmRRRjZSTk1mVkFoci9kb0hXQVlI?=
 =?utf-8?B?YnVVcEFoQ05rWjlQc2E5dmVLV2FWU2F2eTFBNWkycnUraHhjTkY1RWpsRGR5?=
 =?utf-8?B?QXgxb1hNRyt0ckFnbkVPQlFPS2hBazJObnFOL1lFTFZINXJna003M3pnSElD?=
 =?utf-8?B?M0xndFZPUll2QmFiQ0o3UHRkTGZPR2JQMTljNnhtUlNFY2lnSjZaVTBOc2ov?=
 =?utf-8?B?SGdBSlRmRTBjTWl6MEdva2Qvd2o4Q1AwU0I5SWRiTEgwUnlqNkl6NFZDVUF5?=
 =?utf-8?B?YXEwWm5jeEFpa2ZvMDIzYkFRa2RzWWk3ckJxS1h4NEtlK3RRbTFwYWh5TnBa?=
 =?utf-8?B?Q2VPL0NEWWt1RXp1VEo5OTJEVks1cklCQ3pqTEtRdXFoL0pLZi9pZmVOTTg4?=
 =?utf-8?B?b1BSYjZqWkVic1RlNEFTUFZ5eExGNTc0czJVc3BydGVaOWNMcnJWckRDVGxs?=
 =?utf-8?B?WEh3WUFTbVVJd1ZGSDJ5Ty8yWmgrdG5MVmxQY042KzVLT0xEb3dzcWlXZW5G?=
 =?utf-8?B?Q3NmalVkVG81dk1aMG1EYWxodHdrVWIxdjYvNTc1b0lzblZMbVVvd2lWMEVj?=
 =?utf-8?B?bFpFUXJrVm0ycmdGUEVDR1RsbTFpSnJRZU01YzZHdFFvNnBkMDVyUG5RVm82?=
 =?utf-8?B?VktRYk9BbUZXUkRBZzZ4RSszZXBoT3BzNzRzemxRQjUzTjVVNFdidG1hUDZr?=
 =?utf-8?B?eTVrZE1teTVBbnpMVXlzMWJOMlk4N2Qra1VzRWdEYnUxUU1sUHpJcXRSeXFq?=
 =?utf-8?B?OGlCTXpvTGV1Rm1lckFzQUsyZjVFYUlCMTVsSTAyN0MwM2N3eWZicmljRDNz?=
 =?utf-8?B?WFhFcG1GMnJ4dWM1Y2VQYXd2YkMwR0ZFd0ZnKzQvc2R2enpxVHA0KzRRcmpT?=
 =?utf-8?B?MG5La0RqMjFYNWdnUzhmZWlrNjVBT1ArTjZuV0VQWStkeE12SU9zd1Z6TFdn?=
 =?utf-8?B?Uzd0ZGxieFFQWVFVVURyd2s1eGcwTjMwTG1ZV1FpZGYxN3NFMGJuV0VoeGhV?=
 =?utf-8?B?cTJFTWV3TG81bUZ4Z2lYU2VGZEYwS21XUVcvc0NINkVzbzJ0elVQcjVhQTVS?=
 =?utf-8?B?bmhEdlVwdjVqalB3a080dW1lQVpwNWU0L21NSSs5aGtYcFdDRHpQRHhtNXVo?=
 =?utf-8?B?RDNSTmFtVVkxd0tDVWVvTGpObTJvNEFKektUZDcyMlVEazBHalpwWStmeVlt?=
 =?utf-8?B?d2ltM1p5b1ByTGdTM2pyWUxZNXp3cXRuRkhnU1FXTUdPU2doSDUxdkYxcVJJ?=
 =?utf-8?B?Um55SVhLcnVJazBjOXNqRGRhR0Z4ZzA2SithR0VJZUl1UVAvUTVpUzVuNXVj?=
 =?utf-8?B?TU1XUXN6ZnRMaUUzTWdoV0M3djJPcnZyaWprc0pPZEJndkRPUElEdk9Nb2JB?=
 =?utf-8?B?ZXo4S1RFTHY5NUtwSzJGTk9Na2pGWlpuSDdFVWlnUmRmdDBvNmIvcS9STXRN?=
 =?utf-8?B?VjBISXRCVHBjc0ZEZE0vYjZRRnVSNGZEem5CWVpXcVhDcmZkcnZlbHpVNjBn?=
 =?utf-8?B?TW5abXFzbXdVVWpROGNweGYvVDJRckFjelRyTmhUU0ZRdm01MXM1OWphVlVQ?=
 =?utf-8?B?bXc1dzJTcmk3Z3hoNkYwMGdpOFQ2c1lFb3BZY0xxRDB4RytUUDN6VFp6bkt3?=
 =?utf-8?B?d2xtUHBjb2lQWE5xbjNPclRkSFY0VkVlYUYvVEVNUU0xajdwUXd3U0VPY0N5?=
 =?utf-8?B?WGpqZG9VMzVCWnlFQ1JlbnZiVU80RUJUTXNVa3ZFc2Q5eTUyMWJsNnpEQUhJ?=
 =?utf-8?B?MnpJVkFTdmZodzM0NUh5dE5wWFY2YVVRWDEyRDVTVnMrMCtJSnlkQ0d5RjE4?=
 =?utf-8?B?RWI5alkyMVFTQ2d5SXF6eEVqK3h6eWdBRG91cnFMajZLazlHSlI5aWNSTk1R?=
 =?utf-8?B?aG92aTI1K0t3eElkQUxlR2R1OUlYOEREUXord0kxZ0VUUDFQVHpUR1Nxb1RN?=
 =?utf-8?B?d0d5TldIVHdlSWFMc3lrUmh3Njh4djQxcWFwaW5IQnZvN0ZRWHNiWnQ1YWpn?=
 =?utf-8?B?U00rKys1cEhRTTR1NlljOU1vUkRDQnBWWG1HaFpFd3puZ1VFNVdmVGQrQThL?=
 =?utf-8?Q?7AtbM91pCPYykuEoIeV63D9XmBYKRyllM6/gldZva4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ab9cbf-79a4-4ddb-a51d-08d9f7d0a6f0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 20:02:57.6932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7F5cgUCJyiICXt1OD8T8dyavioHXpoOA+hHcUEf0gALqguPycVmZXBOhGbwds9J3GfVpbGthR1CW7BU+ZNzjung0GGANn3WmxKY1NnGkoD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4763
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

On 2/23/2022 04:00, Tvrtko Ursulin wrote:
> On 23/02/2022 02:22, John Harrison wrote:
>> On 2/22/2022 01:53, Tvrtko Ursulin wrote:
>>> On 18/02/2022 21:33, John.C.Harrison@Intel.com wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> Compute workloads are inherently not pre-emptible on current hardware.
>>>> Thus the pre-emption timeout was disabled as a workaround to prevent
>>>> unwanted resets. Instead, the hang detection was left to the heartbeat
>>>> and its (longer) timeout. This is undesirable with GuC submission as
>>>> the heartbeat is a full GT reset rather than a per engine reset and so
>>>> is much more destructive. Instead, just bump the pre-emption timeout
>>>
>>> Can we have a feature request to allow asking GuC for an engine reset?
>> For what purpose?
>
> To allow "stopped heartbeat" to reset the engine, however..
>
>> GuC manages the scheduling of contexts across engines. With virtual 
>> engines, the KMD has no knowledge of which engine a context might be 
>> executing on. Even without virtual engines, the KMD still has no 
>> knowledge of which context is currently executing on any given engine 
>> at any given time.
>>
>> There is a reason why hang detection should be left to the entity 
>> that is doing the scheduling. Any other entity is second guessing at 
>> best.
>>
>> The reason for keeping the heartbeat around even when GuC submission 
>> is enabled is for the case where the KMD/GuC have got out of sync 
>> with either other somehow or GuC itself has just crashed. I.e. when 
>> no submission at all is working and we need to reset the GuC itself 
>> and start over.
>
> .. I wasn't really up to speed to know/remember heartbeats are nerfed 
> already in GuC mode.
Not sure what you mean by that claim. Engine resets are handled by GuC 
because GuC handles the scheduling. You can't do the former if you 
aren't doing the latter. However, the heartbeat is still present and is 
still the watchdog by which engine resets are triggered. As per the rest 
of the submission process, the hang detection and recovery is split 
between i915 and GuC.


>
> I am not sure it was the best way since full reset penalizes everyone 
> for one hanging engine. Better question would be why leave heartbeats 
> around to start with with GuC? If you want to use it to health check 
> GuC, as you say, maybe just send a CT message and expect replies? Then 
> full reset would make sense. It also achieves the goal of not 
> seconding guessing the submission backend you raise.
Adding yet another hang detection mechanism is yet more complication and 
is unnecessary when we already have one that works well enough. As 
above, the heartbeat is still required for sending the pulses that cause 
pre-emptions and so let GuC detect hangs. It also provides a fallback 
against a dead GuC by default. So why invent yet another wheel?

>
> Like it is now, and the need for this series demonstrates it, the 
> whole thing has a pretty poor "impedance" match. Not even sure what 
> intel_guc_find_hung_context is doing in intel_engine_hearbeat.c - why 
> is that not in intel_gt_handle_error at least? Why is hearbeat code 
> special and other callers of intel_gt_handle_error don't need it?
There is no guilty context if the reset was triggered via debugfs or 
similar. And as stated ad nauseam, i915 is no longer handling the 
scheduling and so cannot make assumptions about what is or is not 
running on the hardware at any given time. And obviously, if the reset 
initiated by GuC itself then i915 should not be second guessing the 
guilty context as the GuC notification has already told us who was 
responsible.

And to be clear, the 'poor impedance match' is purely because we don't 
have mid-thread pre-emption and so need a stupidly huge timeout on 
compute capable engines. Whereas, we don't want a total heatbeat timeout 
of a minute or more. That is the impedance mis-match. If the 640ms was 
acceptable for RCS then none of this hacky timeout algorithm mush would 
be needed.

John.


>
> Regards,
>
> Tvrtko

