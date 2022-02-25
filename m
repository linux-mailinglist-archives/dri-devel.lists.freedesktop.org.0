Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4B64C4B38
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 17:47:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BED10E6CB;
	Fri, 25 Feb 2022 16:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28FB510E724;
 Fri, 25 Feb 2022 16:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645807629; x=1677343629;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gzpxakrWpqR+R0wfRmUyYPMQnw5s9jmXbwD/njZb47M=;
 b=l5KIhU7tq5oTt5qaK6iMalEmaLZp1bCdODPJ+71vrmbsea8oFVNWbiaI
 C0KlDDoKCMSFc0t68UOHoufikC3sdwZw5UUkshB6I/gRC3red/VjMAYfc
 kjtPQIf2iklEzh5i3VZZjwwTSywMoF+5FzhRK4oSlObGkZPclWc184qZx
 cVvm0EIbUV7QrVtBQgHu8GjCe1fE+Y9gFtJEApbI0qmpVWNeeyT5tb6ET
 4iAOp10CHyQ944OBChdZzTCd7O3jQWZsk7aha9wZ0Q8Rf8zY6F8ETGSg3
 5hYuhEkV6WVCkH+zMFCCybIXbJWndJ1kITu6kI28AkJfTcbvzpF65SM4I A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="250111145"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="250111145"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 08:46:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="607811018"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 25 Feb 2022 08:46:45 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 08:46:45 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 08:46:45 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 25 Feb 2022 08:46:45 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 25 Feb 2022 08:46:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GensIo2AfN7nDPKx25aFHAWJ+s6eQezb6uP8Y1N7T9RoIAfklBiMTGmLhmx8M4FLIttGKJBoEpo07Juc43X5dB9NhlE8uTYoqmmHJta/T5f5hvzlbBYNstMAZhzGc9uTGB+v98K9VreuciSLk3ZxXyp1KcmhBcL1T6yREY5v6ft5BIxvUzmOkTMUl6/N9IixsuQFBxIwYxeDiMUv7XlepmHNgc7ePLPwj8/sT++TRgRid+p5ph7cdoFU57M72P0suHHaw5FDk2EQmoe+mT0kadv7vD9izwPaSMnn4YcfvYVWcWEoCwtzCv15cEKQCn0j1BTtKS5tB34hz5PsfKZODg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VrczSRW/pLPkBUFaVAGI/slzU8lwcKfr1TRrBBNpcUE=;
 b=WY0vGUw0ih98TJa0l8ANSkJcAxr4TyCOydoIV4xQJ7o/k1KJklzsRj4S4LWeT8AmSJpvSsohbOh6dmK3t/yNg2Bs0QicxL1Rdp2FDcdOsPZmHHjpn4FsWyAXqlcnE3+O8haNdm0SOpyCbJ4CMFJvoN1Q1qOHHvDuNE6FoxMN9R2ap9fGh+tuQANrNyZBPnCR2OSkr3BTdqzcOdCQlri4plBx2Kf6Dh28xlr2gt+3YIeX9i+2LnNnRTsatZqZFnHvWrydiPqplWofRbTLUNT2ZePq1PDVr60hcqm7IU637Bul5g/2AMe84o1y2aefr/Cmnz9bhjXgttH+Gq/GjSdsPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BL0PR11MB3092.namprd11.prod.outlook.com (2603:10b6:208:7d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Fri, 25 Feb
 2022 16:46:41 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5017.022; Fri, 25 Feb 2022
 16:46:40 +0000
Message-ID: <72d84811-b769-4cae-7e18-d076c75ddfa6@intel.com>
Date: Fri, 25 Feb 2022 08:46:37 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH v5 1/4] drm/i915/guc: Add fetch of hwconfig
 table
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Jordan Justen <jordan.l.justen@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
References: <20220222103640.1006006-1-jordan.l.justen@intel.com>
 <20220222103640.1006006-2-jordan.l.justen@intel.com>
 <621be0f6-63e3-a8fb-93e3-e581bf4b2d4b@intel.com>
 <87y21zh70p.fsf@jljusten-skl>
 <0917f555-1303-dadd-6609-f719dcf0ad61@intel.com>
 <3376b185-6a70-c5e1-2c2c-18a4bdeba9a2@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <3376b185-6a70-c5e1-2c2c-18a4bdeba9a2@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CO2PR04CA0112.namprd04.prod.outlook.com
 (2603:10b6:104:7::14) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70ca63ed-b8ed-4059-d3c9-08d9f87e65aa
X-MS-TrafficTypeDiagnostic: BL0PR11MB3092:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BL0PR11MB3092D9EB9C7041558CCF7E3ABD3E9@BL0PR11MB3092.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yRFFpCiWylvOrWGGikjn8HNVbpX8KhVE9acp48x1OLAF/CiIjH7+2B0Os3mQlFufLSWce0i3N0eYxnQUO0FUebMPskO8WaxSNJtPrOSEEskrGPG8PlTSl56CWEcumYFQqI7SV6giwlktYElz8odl7wCOzEIofe9evIFHfrHXvUSNhWtHezUDyqOCczLuRncXnOVV3lXYwWTnOo6cCZ8c23QY1ZfzmCZQvOCtLxbuZU6HUqKKDv/m+bEt8HScUowW41Yy5/K9Qxt0Ga8a89u6Ns92GUXDPvN5+V4bzrO1Zz/jIUClbwUMbArtABc12Zhr3sQyrQgajoJK+B8IqdPbSIMhqqBSLEgHY/frRQZ5Nqlmx/lk7//vtTvYAfVr5Q4gtfPaPL3yUJZkPGuszkihbrGhfwN35cg+WLKYmsgap5VzzR2A5l9dzanSZbPN56YFxBP6W53Xm+EPyI4rjZpEYY1crizP/pWyUOV2tyWRHMoC9W5xGRmzw05owOp6punMlaPgaGuwQJ6Xdg++KJ3pSFUlMRKGTkpQrio3CTzx484UdkU7H5ega/eEyn9YV5Gd4leIbCsWoCNjcRPAgB2cVrlt9F/lLqbkiWJ43hg8YuH2/uA2A+R7NB+q6KOMvSZwxRN7lPILkATs8fweH1YKVmcFuTF8/Ur3vmmB/YZwTal89oQw3JqYXpyYfi6Bw9jldr2fP8uSYQbowE4+MNFrw+5jsdDPTc6PzFoY5LnLCT3+k1/Fia3kfDPPChWkRurt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31696002)(2616005)(2906002)(83380400001)(31686004)(6666004)(36756003)(26005)(186003)(6512007)(38100700002)(8936002)(82960400001)(5660300002)(86362001)(6506007)(53546011)(54906003)(316002)(110136005)(508600001)(6486002)(966005)(66476007)(66556008)(8676002)(4326008)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjhCU3hyZHozV1hRcEFhRDd3OTdJdEErNlgyOHNCSE8zbUU0QkpNZThiK1JC?=
 =?utf-8?B?dm1XdzQ3NGNRVnhwUlBybHBPdDhQM3hTdmhEM0plNS96eEgyMlFPMWJGUlBB?=
 =?utf-8?B?K2pOMlFXckdmN25iTmlMVXBJRUszdXUvampTTmxYSjJlS0EvZ1BCRTdqRFlP?=
 =?utf-8?B?SWU2YmtuVGIzbTc1NnhYUU9obnQxTFdEV3NHcjNDT0Y3bGlKWXVQRXUvejRR?=
 =?utf-8?B?d2QwdEJIRmo5aWNzeEFEa2ZDQkxKNGp3YVZqZC9rK1FiRDBNUTBLa0pHSFNB?=
 =?utf-8?B?VU1mUlhUNXpiRkhtdCtaSDRacEM3MW0xVW40QjNHQ0llTk1XN3kwS2hTc05I?=
 =?utf-8?B?a21RQkEvVU9SZk5Mb3ZSRDFaM0R6b09TRFNpRlVKYUhEQVd0Y1pCRXlJbG1T?=
 =?utf-8?B?OExXYWVoSG5FWkZvMUcvbzU5ZkwvOTZMY2NhOGQxbW9GUTQ3UmRucWtTTVE4?=
 =?utf-8?B?aWN0cU1XQlMxQ3JnVWZuNmRzNkxsV3krb0REczhjMzZ1a2pBY0UramkwUnFh?=
 =?utf-8?B?WDNsVWZKTGJ4QjVEK055aEVqVlJUR3hvMUpabGZHbFVmTkhFYktHSWswZmo0?=
 =?utf-8?B?NlNzVVlSd3lld1JPVmI2K0Y2WFU5Vk12TEJFNjFpRjFqdHNMcTFIL3VZL1RK?=
 =?utf-8?B?MFJkVVR6K0R1L1JZUEI4b0tnb01DbXVuemM5QmpUdDhyMFN5WGcyYUk3Q2V5?=
 =?utf-8?B?QlZIK1RKWGl1d0VWYXBMMW9EZm8yQldDYmRUbXhPVzBMdjN3R2VnV0Z1YW1C?=
 =?utf-8?B?cjhCWHNDUzNUdDFBekpjbEt6Z2NYdXR3M0JNQUNMRWloZ1Q2aTRuTHVSS053?=
 =?utf-8?B?bnhHYi9SZzRPd1FjQ2JPTjRkbG54ekI3eENQYnpOeUJHSUZYeUlhcnpEek9m?=
 =?utf-8?B?MCthc051SGd3WEd4eFZIeXJYRUplcTVCdGxpWnZxTWVWQlVPR3BCQXhnSlpH?=
 =?utf-8?B?eUZrTUVuMERKdk5IWlBSWTNYbCtXNC9rODI5aUovMnR0TEZzb1FhcXZJNW9h?=
 =?utf-8?B?Mk1kY1hiSG56eklzcXNzSEpkVmxXLzVCTjhYUVVLZ0NMQ2p0VUozc2l5VEVJ?=
 =?utf-8?B?NXRpWGxPM3V1b2MxdHZWUS9DbDF6Skhjb0R2QnArQTR5cGpvWVNwcE9sVkpR?=
 =?utf-8?B?cFUxY2ZBazUzazlFZkVRS0tYd3pvTHZnbmJWRjgvQkFLeFlPU2Y5TFVJTVgz?=
 =?utf-8?B?STFSd1FYTEdhazcxQlprUG8rTTJaYlUrdENrTkh3ajB5QzlXOXF1MkpaUHZQ?=
 =?utf-8?B?YVVoUWMvbDVldXNuLzg4UWRsRk10L1ZCRDBWZzl6NzVpc0VTRDRYSmJFN1M1?=
 =?utf-8?B?Y0FYQ1NvbWV0MTVPMjFOSWk0Y2toclkxM3ZWanZDRVR0bGpDbWgzN24rNWpD?=
 =?utf-8?B?Rm1pT3gxN2YzU0FHMkk3V2pGUTQ4cW9ublJYNWgrdmQ3QWZGQ3pKcUZZcnpv?=
 =?utf-8?B?T0EzSHdYZU54Y3lESHVVYk1oQ2NuTWxEc3FPOTBDa1JrbFFjRGRIYmowdGNr?=
 =?utf-8?B?QkxtTlcxdTA4Wm1zUVNLdFltQ2FhT0w2UE42NGhhMzh4SWF6eC9CUWl4UWo1?=
 =?utf-8?B?RUNxZmpHTmp0aHVYdU9Wb3g5UWtQY0NQQnMySDlnWG9uaWRpbXg2NnhBalJh?=
 =?utf-8?B?aUo2LzRKdUlUWUszQXA4SVR2ZXY3dy9Id0t2Q21RNG5yYzNhQkRBbmM5aC9z?=
 =?utf-8?B?eFU1MHFkeEZRODVmZ09rS09yWi9GdXpGeUxZUm5zVFdKbEpiT21mTDJ6bGRt?=
 =?utf-8?B?eWEyRFhtTlhzOHUxOFV6NnNrTlBhOTZqdlRDZWFiekZVUW90NXlheFgyallq?=
 =?utf-8?B?YmRNQ2hPZE1KaWR3dmE4TGZ0ci91TkdpQnhrUmR1cmdtRHFiYWZqazNHSDUr?=
 =?utf-8?B?SVhtenNEZVg4NkZVSHYxUU5XMXUwNkFsNkdlYXRweWtPRTZDdUp4OWR3dWpa?=
 =?utf-8?B?RHFybW5scVBUbDYrVzcwMjlpNDQrVHp5c3FERDV2SitmNDcrMGlHSWhJay8v?=
 =?utf-8?B?cVRqdXFsVGhYMG4wWisxcGpjTmwrdzQzUmQvdDJwWW5JQy9pSWphTnFLVXEv?=
 =?utf-8?B?R1hkVHVnOHc0S2NLL1lWUUJIMk1FLzc0QWVvUzZtQjhUV0E1MGhpRS9vWjVD?=
 =?utf-8?B?L2d1QzRGUWRNUEUwRWhaNHdtTWNyR1pEOTExSjFQRVBtaHUwQTR1L3JabUdp?=
 =?utf-8?B?azU5ak5LYTJ4ZTdMbDlsMkFnV1o1M0JyZzFudmx0QmxxWU8ydk9IYjRQSmVX?=
 =?utf-8?Q?mhEASxiB9PnOP9nvTyYWcyxwA4hGcSjFbojnqoEqNQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70ca63ed-b8ed-4059-d3c9-08d9f87e65aa
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 16:46:40.6928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Taajp0G3poZRrs1oboxt/jUp3MylrzvGU/ESi1NVH+70xLjuckGDDYljG7YyCaFy6zVRldWKYpTWvHu5or0IMDJFl7X+A7ISA73yypJSAcU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3092
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/25/2022 05:26, Tvrtko Ursulin wrote:
> On 25/02/2022 09:44, Michal Wajdeczko wrote:
>> On 25.02.2022 06:03, Jordan Justen wrote:
>>> John Harrison <john.c.harrison@intel.com> writes:
>>>
>>>> On 2/22/2022 02:36, Jordan Justen wrote:
>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>
>>>>> Implement support for fetching the hardware description table from 
>>>>> the
>>>>> GuC. The call is made twice - once without a destination buffer to
>>>>> query the size and then a second time to fill in the buffer.
>>>>>
>>>>> Note that the table is only available on ADL-P and later platforms.
>>>>>
>>>>> v5 (of Jordan's posting):
>>>>>    * Various changes made by Jordan and recommended by Michal
>>>>>      - Makefile ordering
>>>>>      - Adjust "struct intel_guc_hwconfig hwconfig" comment
>>>>>      - Set Copyright year to 2022 in intel_guc_hwconfig.c/.h
>>>>>      - Drop inline from hwconfig_to_guc()
>>>>>      - Replace hwconfig param with guc in __guc_action_get_hwconfig()
>>>>>      - Move zero size check into guc_hwconfig_discover_size()
>>>>>      - Change comment to say zero size offset/size is needed to 
>>>>> get size
>>>>>      - Add has_guc_hwconfig to devinfo and drop has_table()
>>>>>      - Change drm_err to notice in __uc_init_hw() and use %pe
>>>>>
>>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>>>> Acked-by: Jon Bloomfield <jon.bloomfield@intel.com>
>>>>> Signed-off-by: Jordan Justen <jordan.l.justen@intel.com>
>>>>> ---
>>>>>    +    ret = intel_guc_hwconfig_init(&guc->hwconfig);
>>>>> +    if (ret)
>>>>> +        drm_notice(&i915->drm, "Failed to retrieve hwconfig 
>>>>> table: %pe\n",
>>>> Why only drm_notice? As you are keen to point out, the UMDs won't work
>>>> if the table is not available. All the failure paths in your own
>>>> verification function are 'drm_err'. So why is it only a 'notice' if
>>>> there is no table at all?
>>>
>>> This was requested by Michal in my v3 posting:
>>>
>>> https://patchwork.freedesktop.org/patch/472936/?series=99787&rev=3
>>>
>>> I don't think that it should be a failure for i915 if it is unable to
>>> read the table, or if the table read is invalid. I think it should 
>>> be up
>>> to the UMD to react to the missing hwconfig however they think is
>>> appropriate, but I would like the i915 to guarantee & document the
>>> format returned to userspace to whatever extent is feasible.
>>>
>>> As you point out there is a discrepancy, and I think I should be
>>> consistent with whatever is used here in my "drm/i915/guc: Verify
>>> hwconfig blob matches supported format" patch.
>>>
>>> I guess I'd tend to agree with Michal that "maybe drm_notice since we
>>> continue probe", but I would go along with either if you two want to
>>> discuss further.
>>
>> having consistent message level is a clear benefit but on other hand
>> these other 'errors' may indicate more serious problems related to use
>> of wrong/incompatible firmware that returns corrupted HWconfig (or we
>> use wrong actions), while since we are not using this HWconfig in the
As stated ad nauseam, you can rule out 'corrupted' hwconfig. The GuC 
firmware is signed and will not load if it has become corrupted somehow. 
Likewise, a 'wrong/incompatible' firmware will refuse to load. So it is 
physically impossible for the later verification stage to ever find an 
error.


>> driver we don't care that much that we failed to load HWconfig and
>> 'notice' is enough.
>>
>> but I'm fine with all messages being drm_err (as we will not have to
>> change that once again after HWconfig will be mandatory for the driver
>> as well)
>
> I would be against drm_err.
>
> #define KERN_EMERG      KERN_SOH "0"    /* system is unusable */
> #define KERN_ALERT      KERN_SOH "1"    /* action must be taken 
> immediately */
> #define KERN_CRIT       KERN_SOH "2"    /* critical conditions */
> #define KERN_ERR        KERN_SOH "3"    /* error conditions */
> #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
> #define KERN_NOTICE     KERN_SOH "5"    /* normal but significant 
> condition */
> #define KERN_INFO       KERN_SOH "6"    /* informational */
> #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
>
> From the point of view of the kernel driver, this is not an error to 
> its operation. It can at most be a warning, but notice is also fine by 
> me. One could argue when reading "normal but significant condition" 
> that it is not normal, when it is in fact unexpected, so if people 
> prefer warning that is also okay by me. I still lean towards notice 
> becuase of the hands-off nature i915 has with the pass-through of this 
> blob.
 From the point of view of the KMD, i915 will load and be 'functional' 
if it can't talk to the hardware at all. The UMDs won't work at all but 
the driver load will be 'fine'. That's a requirement to be able to get 
the user to a software fallback desktop in order to work out why the 
hardware isn't working (e.g. no GuC firmware file). I would view this as 
similar. The KMD might have loaded but the UMDs are not functional. That 
is definitely an error condition to me.

>
>>>> Note that this function is called as part of the reset path. The reset
>>>> path is not allowed to allocate memory. The table is stored in a
>>>> dynamically allocated object. Hence the IGT test failure. The table
>>>> query has to be done elsewhere at driver init time only.
>>>
>>> Thanks for clearing this up. I did notice on dg2 that gpu resets were
>>> causing a re-read of the hwconfig from GuC, but it definitely was not
>>> clear to me that there would be a connection to the IGT failure that 
>>> you
>>> pointed out.
>>>
>>>>
>>>>> +               ERR_PTR(ret));
>>>>> +
>>>>>        ret = guc_enable_communication(guc);
>>>>>        if (ret)
>>>>>            goto err_log_capture;
>>>>> @@ -562,6 +567,8 @@ static void __uc_fini_hw(struct intel_uc *uc)
>>>>>        if (intel_uc_uses_guc_submission(uc))
>>>>>            intel_guc_submission_disable(guc);
>>>>>    +    intel_guc_hwconfig_fini(&guc->hwconfig);
>>>>> +
>>>>>        __uc_sanitize(uc);
>>>>>    }
>>>>>    diff --git a/drivers/gpu/drm/i915/i915_pci.c 
>>>>> b/drivers/gpu/drm/i915/i915_pci.c
>>>>> index 76e590fcb903..1d31e35a5154 100644
>>>>> --- a/drivers/gpu/drm/i915/i915_pci.c
>>>>> +++ b/drivers/gpu/drm/i915/i915_pci.c
>>>>> @@ -990,6 +990,7 @@ static const struct intel_device_info 
>>>>> adl_p_info = {
>>>>>            BIT(RCS0) | BIT(BCS0) | BIT(VECS0) | BIT(VCS0) | 
>>>>> BIT(VCS2),
>>>>>        .ppgtt_size = 48,
>>>>>        .dma_mask_size = 39,
>>>>> +    .has_guc_hwconfig = 1,
>>>> Who requested this change? It was previously done this way but the
>>>> instruction was that i915_pci.c is for hardware features only but that
>>>> this, as you seem extremely keen about pointing out at every
>>>> opportunity, is a software feature.
>>>
>>> This was requested by Michal as well. I definitely agree it is a
>>> software feature, but I was not aware that "i915_pci.c is for hardware
>>> features only".
>>>
>>> Michal, do you agree with this and returning to the previous method for
>>> enabling the feature?
>>
>> now I'm little confused as some arch direction was to treat FW as
>> extension of the HW so for me it was natural to have 'has_guc_hwconfig'
>> flag in device_info
>>
>> if still for some reason it is undesired to mix HW and FW/SW flags
>> inside single group of flags then maybe we should just add separate
>> group of immutable flags where has_guc_hwconfig could be defined.
>>
>> let our maintainers decide
>
> Bah.. :)
>
> And what was the previous method?
>
> [comes back later]
>
> Okay it was:
>
> +static bool has_table(struct drm_i915_private *i915)
> +{
> +    if (IS_ALDERLAKE_P(i915))
> +        return true;
>
> Which sucks a bit if we want to argue it does not belong in device info.
>
> Why can't we ask the GuC if the blob exists? In fact what would happen 
> if one would call __guc_action_get_hwconfig on any GuC platform?
That was how I originally wrote the code. However, other parties refuse 
to allow a H2G call to fail. The underlying CTB layers complain loudly 
on any CTB error. And the GuC architects insist that a call to query the 
table on an unsupported platform is an error and should return an 
'unsupported' error code.

John.

>
> Regards,
>
> Tvrtko

