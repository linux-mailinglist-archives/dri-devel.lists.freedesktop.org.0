Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F7847E720
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 18:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E45610E2B2;
	Thu, 23 Dec 2021 17:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C022E10E2B2;
 Thu, 23 Dec 2021 17:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640280918; x=1671816918;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7DkNDupvbSz3SJnIsECQ0bSeqmqL8GbY55XjdOB4svE=;
 b=OQVUE9Q3j3YhpFp4hGDeFUaKYb2cUQCulsORfcEFgsRhhpQamewAoo1w
 A4H65R8cQHJJ9Eg2ZhbqYgFXlp/UUisG1/ALxr8giz18Y22bQ87eYOzQu
 l+b+e+y8iKsj84t5PQPeeWfH9eL+vnric0OHYrFyv+xMX8wZJr5o3aQyq
 O9F2eSIE6VRrC4l/cuk3Y1uyV8JtErMhVcTCf3YBmTaYrOpI/cl81Ll3M
 FZgv4sWgmHNUOrORevILy8AL53rO34cO9fdSgk0tNGG5OfBIzpSiZMk8+
 A3GF2KkMIjYBsGq4sG/bBmId7kw65pl6NZrDXs5MrAVtfaGgJJvUO1Muy A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10207"; a="327175073"
X-IronPort-AV: E=Sophos;i="5.88,230,1635231600"; d="scan'208";a="327175073"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 09:35:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,230,1635231600"; d="scan'208";a="485152020"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 23 Dec 2021 09:35:17 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 23 Dec 2021 09:35:17 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 23 Dec 2021 09:35:17 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 23 Dec 2021 09:35:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dObiANQse2L7hzugYVOUE/jh+3rFALLZ7JuRu1UTDU7nbJDYLlDIt/aQznlEH/uzRYYNQJIMxkRmeryQ4CfiumdNSpC4yTVWlF4nZVM1e1DwzIXP4g2ubwer8tOh0bsHCFmuruofqjGxiHRuqV48gCiyT0/MbkeQs1n8nUIjuAYXpbz5VasE+UbOKqCCe6ZcmtFiRg4l481Kweim3ZlMptfepMP40qTFIUau6YCTyrm5foezQpiNlz8YCQ++A05Smqzfh8LrInlzEczOIyJujoz2mCHn+vCGUaeh5KPTzfkyzNlkgWJpmwya0XTJV1rG7huAvzsLR5XFBaqpkI/KlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1zOXv/3rn/QyU/aofuV073+9ZlVkZNCpNkYMvxrk2M=;
 b=n1jXLPn4mk0GAm+wPjE9O+AApSqmsmuMTVkgYrzfvU/W2YkzElzxvlErj+n8hPl71fCx/An9U35qIh4LveQcpodYnMmmCm42MgjWUAcAb2dxISTU9AUTjGXk6or4UMJ3EvuZwOkL3Nfd4CA+6FIozAr7gzwZtnXgb3Xe06yiE12xb8bs1JhAVzg4TopqTFJIfoAff09C5gP+eSLkffTcd22DE9FgtNO4JoXchd+hQ+OpOKVLo1mhHr8uRuZVVfMabbYZ3up2wjxfULJvdRuaB5ea+mBQOhvuEBVMtP+L/PqKsKJLJZvNEDygImjCxOTDPqLkrgsOyEgIN/A9pMjUOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB3908.namprd11.prod.outlook.com (2603:10b6:405:7d::13)
 by BN8PR11MB3668.namprd11.prod.outlook.com (2603:10b6:408:81::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 17:35:14 +0000
Received: from BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::81a3:50a8:5c1f:f754]) by BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::81a3:50a8:5c1f:f754%5]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 17:35:13 +0000
Message-ID: <73fa5b6e-d5a7-b988-8bef-4251b7e40027@intel.com>
Date: Thu, 23 Dec 2021 09:35:09 -0800
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
 <1d78552e-8a7c-84c5-a9e6-7c7476a5e2e5@intel.com>
 <5921ac11-1286-1062-f702-f33bc55e4a0e@linux.intel.com>
 <a00f0ff4-83ef-e267-1f0a-06e6953083f9@intel.com>
 <f860344e-2ef4-99f2-c498-9cbe9ea3b1c0@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <f860344e-2ef4-99f2-c498-9cbe9ea3b1c0@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CO2PR04CA0192.namprd04.prod.outlook.com
 (2603:10b6:104:5::22) To BN6PR11MB3908.namprd11.prod.outlook.com
 (2603:10b6:405:7d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f781ce0-9afc-4b65-4f7e-08d9c63a9377
X-MS-TrafficTypeDiagnostic: BN8PR11MB3668:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN8PR11MB3668CAF0BCA5EA6AA6A257FFBD7E9@BN8PR11MB3668.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cuRJ+x9OkYnF1N/rryHnIlcXZdP//WTRhe+Hg+0X7sAh78sik87n9tFBm/mh9Qp8Ga6R5YkMWkRuaxyHSzQrmwW9P2Su6bbrV82EfGWQp0p+t3a4X7U2FmPzukZv7b22mipJmDRAw/oQ8kd15fh4NX7qCsk0TWMFoZrZEXUcGQHji3D0PT0cyZsKxnZxeocVrqOPHOkKw93MrHwPFdTzrpxzEtYJmUKB+fQsYacndTWhUm04vaIEMpVYM/uA7v4fzm1hC16aThsk7lqJa+iAE2qbhCtRUnidXyWsNOYIIYJZlIjq2iQQlZJXHaJ8G/XX1lhFZ9vKdwpPQNTpXffxMZl+Kcu5ae/JaSn0MEbCzgM0zgrb6U8dCo47le/UOkoLoXCCRm9YkfUDMTMKM3NtRrZ9nT/ND9GTFoDepH67WtD94pWoifq80HWHT28oOMxc2TNk0gP2OgphU6vgjAHeKDKmbRi2iWq3VJW3boXIxgx7dTe7tsCYlvisXLmH8N3zUJtiNxB7TXMP4H8siz/+dIIZ/ZAhD6Mj2N4FXTaSQRgm4IFIuRXmWn0s2pdgnI7648E6Q8lBtVw1RX079RRmO94F1l5n+rH6pz5PeAHArr0qRyi2fOPKGACVrSm1kia6n+0Vg+5MGbnyEt/B3VLGi7+aSvr4S1K+L5Kk7IRQ5rNSsQfV4S7C5Qrpv4pV0WKdIbaqOvydmAexOdAXNj0fxdHbt2rU6D/fHYMrKLk+gQf2y4XpJPY3kbrVTn3+JEK2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB3908.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6636002)(8936002)(4326008)(83380400001)(86362001)(8676002)(110136005)(31686004)(5660300002)(30864003)(316002)(508600001)(82960400001)(26005)(36756003)(66556008)(2616005)(186003)(6506007)(6512007)(66946007)(38100700002)(6486002)(2906002)(6666004)(66476007)(31696002)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OS9lS3hHTSt2V0RNbzgwSStEVllxOUZoV1hDTHByUkF2NWhLNnNsK2h3UzJh?=
 =?utf-8?B?VmVIb2tPb2s4U09UZnJwQnhPUmNMeTF3V1FuNDhJdm9rKzVTaWVuK0kveUFu?=
 =?utf-8?B?L2JBRmQ3SVhHMEkxTWJSOERCdlB5WTI2SUVzbElZL2UySlJ3NXdZZ013c3cz?=
 =?utf-8?B?VEt5QlpycmtleEhoODVOMzhDV1k5NVJDemZaMEF2NllTOHQ3ZGZlQ2NTejda?=
 =?utf-8?B?N2plOFUrTkU4bUtURStPdVgvSWJVS29WeHZmcml4Rld3aC9ZNkI0V2lueGhP?=
 =?utf-8?B?b2c4TzZGd1VBQVBFNVdaSmRYKzdDRStMSEdIMUp6T0N1QWQ1dHluUThPL1Bi?=
 =?utf-8?B?VC8yNjJLRURHL0w4WWRYV3NLZGJUY2hzcEVqWG9wU25wU3FyTWxvVHE1Z3Ni?=
 =?utf-8?B?dlZDWm1wUzZRNmM3S3l0aVpYVkxWTVNZQ2FWczdLRTlqdU8zblVab3MrbFpm?=
 =?utf-8?B?aFMreFNXWlo0Ykg5OWcyd1ZDay94SlNJN1BsRUtiQTVjclFIbjh6U1pJd1Zl?=
 =?utf-8?B?Wm9WZDVUdGVNWnNlYllLbStobEVMRXFEWnpkS1hyUlpXRk1ZQXYySlpTWkkr?=
 =?utf-8?B?STY0b05WOUJUUEhUblV5VmdSdVcyV0N3VVJoYktNYkZxeUw3QjZPdDlJeVUy?=
 =?utf-8?B?cG5EcTNtUGpIQ0tVdFJaVXdHeUxXZStDQW81UDdqMXJPOTJVK1IyNTdCTXh3?=
 =?utf-8?B?amMzL1VFbFhSSVlPZG5qZjMwV3NEQXZhRGVlNnA4VzFvb2VrTmNRYmVJaWtX?=
 =?utf-8?B?SThJYlZlU0JvYld6VEdMdzE2RHR3WUJyODFSZXpBVkJMM21JMDh4Uzc1cUpE?=
 =?utf-8?B?enNocFpFNUpJUXRhTXFpVG9DQ2F2Q0RSbHRqVHI0bEx2am1QOVB3d1laVlI0?=
 =?utf-8?B?cFE0bGpURWZ5elN1bEpmNnVjM3FsNGkwUVU1NTU2NHNTMkZ5U2RtNU5lbHcw?=
 =?utf-8?B?RVNMSnlDY2dVNTI0d2ZqaDRtSDhkMlAvL1FmZFZpYldLbWtoQkpRdUN6M0ZN?=
 =?utf-8?B?ZkszMzYwd0hnbkljY1ZFd0lSZGVNNlRmVTlKdG9kYXloVHlOeG4rbU5jTE02?=
 =?utf-8?B?S3BqaGZzc3RtKzRyYWxWcUcreUV1TndxSFBvTzE0T1hZWW9QaGZOeXlTVUJG?=
 =?utf-8?B?OEFKR291bWtPbmZ6cXdDK3FQOENmYkRMQllMa3VScXhpRzNsbVNlSUhYMVpR?=
 =?utf-8?B?UmErNnFvQ0RuUU55dnE2OWFwUXA2RFRBck1YQ3NqZ3BjV0FJMlFMT2pRVlZ3?=
 =?utf-8?B?YjFOalg3NjBEWkVLejcraldsVXUvamNuWlVVVlVTcXhaaTgyTXJjbEd5RWJz?=
 =?utf-8?B?cWxlZG9abGFaa0ZhejhqYnZySlBQOVN2eTNCWVVDT0ZyQWtJYlozQVJEL1N1?=
 =?utf-8?B?MDRHdHVtUzBUMUZPcHE4SHdBT29GMHZncnJWNDJVUDJ2MDNWbWRreU5DSEVO?=
 =?utf-8?B?UG9WTHBaMXFrRHFFRDYzbjF0WDM3S2lKYk94RXN2L2hSLzU0ZTBkR2o4SExz?=
 =?utf-8?B?Vlp0YnVzd0JuUFdUcVBMYVdTMGlaYS90bVNsVFBISk12OW0rV3h3TGhYOWdV?=
 =?utf-8?B?UEl2dVZNenBGalFjMHJIeUptcFE4WklOV2NhdXpZYkZCU1lQbEV1b2xmRXFO?=
 =?utf-8?B?VlBmUFVKbmorVnNtN0syRVVmckkwWmZ0VE9DZXg4bWVxNERWZWhFYXQ4Sm9G?=
 =?utf-8?B?TnhFK2M5dVNEME9SY3h5d3Jvam9wMkFwZmVLV3c3UlFMeWppdnVBZ3U5UjVj?=
 =?utf-8?B?a3A1aTB5Y0RLL0tCMFNNRmJxSUFRYlVGMk5vemhaWE5MM29ZejNzOXE1bHQw?=
 =?utf-8?B?cUZ4cEkzR0lYOTk4NFEydGhscG5yRW9hNXJ5YzVheWpKMUtoSVhPOHNWZFB4?=
 =?utf-8?B?dERDT0lwYVpRWG92dGtOUExUNkcxQWQ2Sy9CRWNCQ21pWWwzb0ZVOVl6Sy9X?=
 =?utf-8?B?dDdYN1JSdFV2aitrOXF1WHpaQXB5RVpyRVRzb04vL2p3aGhMbWhTTWUzM0xS?=
 =?utf-8?B?TTNlUUUvSENnaUZmeXlKVVVmY2kzWDBYd0xMMEsrQkkwNS9XQUJ1eVRCM29Y?=
 =?utf-8?B?c08rWGFlNXlSUWE4UVF1OUxaSkt5bmhIbWFkSjRkZjFCWHlYVis2QTBRU3dB?=
 =?utf-8?B?a0RPcExZcEhuOVovVFBhUEZLN29uazB1U1hIcFphVHNsbWE0QWFLayt5b29B?=
 =?utf-8?B?M2ZsVVVuZ3F1SlFjOWphcDJTelU0c2p0bkRsamthQ2VUejlPZ3p3eGM4QjBo?=
 =?utf-8?Q?VmdnMrto4BcURJiQYs0oJLENG/RIlPQW+AQZ3p1UZI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f781ce0-9afc-4b65-4f7e-08d9c63a9377
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB3908.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 17:35:13.6452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oc1RbFe/rJenvUSvytXipNSH7nhNDFu1Yk87X9Ss1GRyuc4M4GH2KT3/hy//E2rG0NC9en26+M8zh+aSMFfuxA3BptDv1dEPBk8oU10oCJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3668
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

On 12/23/2021 02:23, Tvrtko Ursulin wrote:
> On 22/12/2021 21:58, John Harrison wrote:
>> On 12/22/2021 08:21, Tvrtko Ursulin wrote:
>>> On 21/12/2021 22:14, John Harrison wrote:
>>>> On 12/21/2021 05:37, Tvrtko Ursulin wrote:
>>>>> On 20/12/2021 18:34, John Harrison wrote:
>>>>>> On 12/20/2021 07:00, Tvrtko Ursulin wrote:
>>>>>>> On 17/12/2021 16:22, Matthew Brost wrote:
>>>>>>>> On Fri, Dec 17, 2021 at 12:15:53PM +0000, Tvrtko Ursulin wrote:
>>>>>>>>>
>>>>>>>>> On 14/12/2021 15:07, Tvrtko Ursulin wrote:
>>>>>>>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>>>>>>
>>>>>>>>>> Log engine resets done by the GuC firmware in the similar way 
>>>>>>>>>> it is done
>>>>>>>>>> by the execlists backend.
>>>>>>>>>>
>>>>>>>>>> This way we have notion of where the hangs are before the GuC 
>>>>>>>>>> gains
>>>>>>>>>> support for proper error capture.
>>>>>>>>>
>>>>>>>>> Ping - any interest to log this info?
>>>>>>>>>
>>>>>>>>> All there currently is a non-descriptive "[drm] GPU HANG: ecode
>>>>>>>>> 12:0:00000000".
>>>>>>>>>
>>>>>>>>
>>>>>>>> Yea, this could be helpful. One suggestion below.
>>>>>>>>
>>>>>>>>> Also, will GuC be reporting the reason for the engine reset at 
>>>>>>>>> any point?
>>>>>>>>>
>>>>>>>>
>>>>>>>> We are working on the error state capture, presumably the 
>>>>>>>> registers will
>>>>>>>> give a clue what caused the hang.
>>>>>>>>
>>>>>>>> As for the GuC providing a reason, that isn't defined in the 
>>>>>>>> interface
>>>>>>>> but that is decent idea to provide a hint in G2H what the issue 
>>>>>>>> was. Let
>>>>>>>> me run that by the i915 GuC developers / GuC firmware team and 
>>>>>>>> see what
>>>>>>>> they think.
>>>>>>>>
>>>>>> The GuC does not do any hang analysis. So as far as GuC is 
>>>>>> concerned, the reason is pretty much always going to be 
>>>>>> pre-emption timeout. There are a few ways the pre-emption itself 
>>>>>> could be triggered but basically, if GuC resets an active context 
>>>>>> then it is because it did not pre-empt quickly enough when 
>>>>>> requested.
>>>>>>
>>>>>>
>>>>>>>>> Regards,
>>>>>>>>>
>>>>>>>>> Tvrtko
>>>>>>>>>
>>>>>>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>>>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>>>> ---
>>>>>>>>>> drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 12 
>>>>>>>>>> +++++++++++-
>>>>>>>>>>    1 file changed, 11 insertions(+), 1 deletion(-)
>>>>>>>>>>
>>>>>>>>>> diff --git 
>>>>>>>>>> a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>>>>>>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>>>>>> index 97311119da6f..51512123dc1a 100644
>>>>>>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>>>>>> @@ -11,6 +11,7 @@
>>>>>>>>>>    #include "gt/intel_context.h"
>>>>>>>>>>    #include "gt/intel_engine_pm.h"
>>>>>>>>>>    #include "gt/intel_engine_heartbeat.h"
>>>>>>>>>> +#include "gt/intel_engine_user.h"
>>>>>>>>>>    #include "gt/intel_gpu_commands.h"
>>>>>>>>>>    #include "gt/intel_gt.h"
>>>>>>>>>>    #include "gt/intel_gt_clock_utils.h"
>>>>>>>>>> @@ -3934,9 +3935,18 @@ static void capture_error_state(struct 
>>>>>>>>>> intel_guc *guc,
>>>>>>>>>>    {
>>>>>>>>>>        struct intel_gt *gt = guc_to_gt(guc);
>>>>>>>>>>        struct drm_i915_private *i915 = gt->i915;
>>>>>>>>>> -    struct intel_engine_cs *engine = 
>>>>>>>>>> __context_to_physical_engine(ce);
>>>>>>>>>> +    struct intel_engine_cs *engine = ce->engine;
>>>>>>>>>>        intel_wakeref_t wakeref;
>>>>>>>>>> +    if (intel_engine_is_virtual(engine)) {
>>>>>>>>>> +        drm_notice(&i915->drm, "%s class, engines 0x%x; GuC 
>>>>>>>>>> engine reset\n",
>>>>>>>>>> + intel_engine_class_repr(engine->class),
>>>>>>>>>> +               engine->mask);
>>>>>>>>>> +        engine = guc_virtual_get_sibling(engine, 0);
>>>>>>>>>> +    } else {
>>>>>>>>>> +        drm_notice(&i915->drm, "%s GuC engine reset\n", 
>>>>>>>>>> engine->name);
>>>>>>>>
>>>>>>>> Probably include the guc_id of the context too then?
>>>>>>>
>>>>>>> Is the guc id stable and useful on its own - who would be the user?
>>>>>> The GuC id is the only thing that matters when trying to 
>>>>>> correlate KMD activity with a GuC log. So while it might not be 
>>>>>> of any use or interest to an end user, it is extremely important 
>>>>>> and useful to a kernel developer attempting to debug an issue. 
>>>>>> And that includes bug reports from end users that are hard to 
>>>>>> repro given that the standard error capture will include the GuC 
>>>>>> log.
>>>>>
>>>>> On the topic of GuC log - is there a tool in IGT (or will be) 
>>>>> which will parse the bit saved in the error capture or how is that 
>>>>> supposed to be used?
>>>> Nope.
>>>>
>>>> However, Alan is currently working on supporting the GuC error 
>>>> capture mechanism. Prior to sending the reset notification to the 
>>>> KMD, the GuC will save a whole bunch of register state to a memory 
>>>> buffer and send a notification to the KMD that this is available. 
>>>> When we then get the actual reset notification, we need to match 
>>>> the two together and include a parsed, human readable version of 
>>>> the GuC's capture state buffer in the sysfs error log output.
>>>>
>>>> The GuC log should not be involved in this process. And note that 
>>>> any register dumps in the GuC log are limited in scope and only 
>>>> enabled at higher verbosity levels. Whereas, the official state 
>>>> capture is based on a register list provided by the KMD and is 
>>>> available irrespective of debug CONFIG settings, verbosity levels, 
>>>> etc.
>>>
>>> Hm why should GuC log not be involved now? I thought earlier you said:
>>>
>>> """
>>> And that includes bug reports from end users that are hard to repro 
>>> given that the standard error capture will include the GuC log.
>>> """
>>>
>>> Hence I thought there would be a tool in IGT which would parse the 
>>> part saved inside the error capture.
>> Different things.
>>
>> The GuC log is not involved in capturing hardware register state and 
>> reporting that as part of the sysfs error capture that user's can 
>> read out. The GuC needs to do the state capture for us if it is doing 
>> the reset, but it is provided via a dedicated state capture API. 
>> There should be no requirement to set GuC log sizes/verbosity levels 
>> or to decode and parse the GuC log just to get the engine register 
>> state at the time of the hang.
>>
>> On the other hand, the GuC log is useful for debugging certain issues 
>> and it is included automatically in the sysfs error capture along 
>> with all the other hardware and software state that we save.
>>
>> There is intended to be a publicly released tool to decode the GuC 
>> log into a human readable format. So end users will be able to see 
>> what engine scheduling decisions were taken prior to the hang, for 
>> example. Unfortunately, that is not yet ready for release for a 
>> number of reasons. I don't know whether that would be released as 
>> part of the IGT suite or in some other manner.
>
> Okay, it would be handy if it was part of IGT, maybe even 
> intel_error_decode being able to use it to show everything interesting 
> to kernel developers in one go. Or at least the log parsing tool being 
> able to consume raw error capture.
I have some wrapper scripts which can do things like take a raw error 
capture, run intel_error_decode, extract the GuC log portion, convert it 
to the binary format the decoder tool expects, extract the GuC firmware 
version from the capture to give to the decoder tool and finally run the 
decoder tool. The intention is that all of the helper scripts will also 
be part of the log decoder release.

If you want to try it all out now, see the GuC log decoder wiki page 
(internal developers only).

>
>>>>>> Also, note that GuC really resets contexts rather than engines. 
>>>>>> What it reports back to i915 on a reset is simply the GuC id of 
>>>>>> the context. It is up to i915 to work back from that to determine 
>>>>>> engine instances/classes if required. And in the case of a 
>>>>>> virtual context, it is impossible to extract the actual instance 
>>>>>> number. So your above print about resetting all instances within 
>>>>>> the virtual engine mask is incorrect/misleading. The reset would 
>>>>>> have been applied to one and only one of those engines. If you 
>>>>>> really need to know exactly which engine was poked, you need to 
>>>>>> look inside the GuC log.
>>>>>
>>>>> I think I understood that part. :) It wasn't my intent to imply in 
>>>>> the message multiple engines have been reset, but in the case of 
>>>>> veng, log the class and mask and the fact there was an engine 
>>>>> reset (singular). Clearer message can probably be written.
>>>>>
>>>>>> However, the follow up point is to ask why you need to report the 
>>>>>> exact class/instance? The end user doesn't care about which 
>>>>>> specific engine got reset. They only care that their context was 
>>>>>> reset. Even a KMD developer doesn't really care unless the 
>>>>>> concern is about a hardware bug rather than a software bug.
>>>>>
>>>>> I was simply aligning both backends to log as similar information 
>>>>> as possible. Information is there, just not logged.
>>>>>
>>>>> Concerning the wider topic, my thinking is end user is mainly 
>>>>> interested to know there are any engine resets happening (to tie 
>>>>> with the experience of UI/video glitching or whatever). Going for 
>>>>> deeper analysis than that is probably beyond the scope of the 
>>>>> kernel log and indeed error capture territory.
>>>> I would still say that the important information is which context 
>>>> was killed not which engine. Sure, knowing the engine is better 
>>>> than nothing but if we can report something more useful then why not?
>>>
>>> Make it so. :)
>>>
>>>>>> My view is that the current message is indeed woefully 
>>>>>> uninformative. However, it is more important to be reporting 
>>>>>> context identification than engine instances. So sure, add the 
>>>>>> engine instance description but also add something specific to 
>>>>>> the ce as well. Ideally (for me) the GuC id and maybe something 
>>>>>> else that uniquely identifies the context in KMD land for when 
>>>>>> not using GuC?
>>>>>
>>>>> Not sure we need to go that far at this level, but even if we do 
>>>>> it could be a follow up to add new data to both backends. Not sure 
>>>>> yet I care enough to drive this. My patch was simply a reaction to 
>>>>> noticing there is zero information currently logged while 
>>>>> debugging some DG2 hangs.
>>>> In terms of just reporting that a reset occurred, we already have 
>>>> the 'GPU HANG: ecode 12:1:fbffffff, in testfw_app [8177]' message. 
>>>> The ecode is a somewhat bizarre value but it does act as a 
>>>> 'something went wrong, your system is not happy' type message. 
>>>> Going beyond that, I think context identification is the next most 
>>>> useful thing to add.
>>>>
>>>> But if you aren't even getting the 'GPU HANG' message then it 
>>>> sounds like something is broken with what we already have. So we 
>>>> should fix that as a first priority. If that message isn't 
>>>> appearing then it means there was no error capture so adding extra 
>>>> info to the capture won't help!
>>>
>>> The issue I have is that "GPU HANG ecode" messages are always "all 
>>> zeros". It thought that was because GuC error capture was not there, 
>>> but maybe its something else.
>> Hmm. All zeros including the platform and engine class part or just 
>> the instdone part?
>
> Class and instdone - all we were seeing was "[drm] GPU HANG: ecode
> 12:0:00000000".
>
> Even on the CI run for this patch I see in the logs:
>
> <5>[  157.243472] i915 0000:00:02.0: [drm] rcs0 GuC engine reset
> <6>[  157.254568] i915 0000:00:02.0: [drm] GPU HANG: ecode 12:0:00000000
>
> So there seem circumstances when the GPU HANG line somehow misses to 
> figure out the engine class.
Class zero is render. So it is correct.

>
>> The instdone value is engine register state and will have been 
>> cleared before i915 can read it if the reset was handled by GuC. That 
>> comes under the heading of state we need the new error capture API 
>> for. However, the context should be correctly identified as should 
>> the platform/engine class.
>>
>> Currently, the recommended w/a is to set i915.reset=1 when debugging 
>> a hang issue. That will disable GuC based resets and fall back to old 
>> school i915 based (but full GT not engine) resets. And that means 
>> that i915 will be able to read the engine state prior to the reset 
>> happening and thus produce a valid error capture / GPU HANG message.
>
> Ah.. that's the piece of the puzzle I was missing. Perhaps it should 
> even be the default until error capture works.
Decision was taken that per engine resets are of real use to end users 
but valid register state in an error capture is only of use to i915 
developers. Therefore, we can take the hit of less debuggability. Plus, 
you do get a lot of that information in the GuC log (as debug prints, 
essentially) if you have the verbosity set suitably high. So it is not 
impossible to get the information out even with GuC based engine resets. 
But the reset=1 fallback is certainly the easiest debug option.

John.


>
> Regards,
>
> Tvrtko

