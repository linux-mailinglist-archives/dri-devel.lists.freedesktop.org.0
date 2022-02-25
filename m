Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C114C4BB8
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 18:13:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 189A910E824;
	Fri, 25 Feb 2022 17:13:10 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF2C10E824;
 Fri, 25 Feb 2022 17:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645809189; x=1677345189;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Tvh70oCqxGBgSGKiO3n9nzGEn+BPGddu37YR6L8+9zg=;
 b=UqfaC7BhJNbDsZILu4/FmSHKJGoRRVzCzkR5fUo06cpuC5FQWbqvQElK
 /xueg3NvdM2/OZ6mou5nxwO/jw4UBJSt4q47y3t656V8MFK7BPtp8CqdF
 uF77MRmrjJGD/NYsIupUIB8dDXOONJIf9SqhIKiGqikPTNXCrkwuYq40F
 zfumF8dknqfHKQmSBC8J2IR1Jrw6lynWQSM9rx7jwQUcAqu4ZlMnjN3Pk
 3CCB5YWE4Hko/aNFAp+Bpx/gniKiZy2pNo7igqDpnpXuSH0o4gV4LOp3C
 D+geIoKTdKKnSVw9YtrGNcQHByYXyvjNZj3uSHE/aQEOlRV3c2SlgciXN w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="251367969"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="251367969"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 09:11:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="607819063"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 25 Feb 2022 09:11:51 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 09:11:51 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 09:11:50 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 25 Feb 2022 09:11:50 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 25 Feb 2022 09:11:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOCPg2Rqw+BEBqiN5XoYMEb1F7J7UXtvBQX0+K0tDC691mPQjmt14rTBkAok6s/R0zFjBl37ZtFGkS0vldgcmDGvjd43Op1HcNTaZB9ZPWzD6KvlJIU8oa2XVsw4Jr8p1vpoMZXtuUwFRqCeOBBuq3mKLFIbFr1O6b0+0LI+WSC59Y/IMMKlIEoX/RjCfmtRKYxbPvAGCxJwYG5Jo9epleSPXYAlSgNziGIp4PFyHSvhmiLgVPiDX9WWpNhXpbQl1/9b5Zq7YImAjpqQxQQs0qOPZV3VCmBTFVNhUMyZERv5jWesigZDlBMZ0gLJOxx3V6SeelGpc9R2IDCu1BCgdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nU0CzQvSJxEt6ktcreqbV1Si44T8ToAnVOFxRPChg6s=;
 b=Kbf2laUc7UKbO/zQIsbjvOFSPCgQzPvYvsN8Wd5JecdA3rwJnE3HaXybwO93VOJadVVbNLleiy4IQTeTyGU6KXSC1Yf89/gZrrhiKhOJTTMAH8JaJwS7V32cE+5s67mJwqhJCFutmkpTBK3U8LxJRpAkrAod1CnZuKvx3yWjzB49y72Trmqww3xL4iwofYsVnF3gk3/UVF8i6Zid1jycCHrOsd2qRP5i+oA62DQL/HF7tgnUbv/ZD7Mwl7vnKWuGZAkbjvPoHrgpZrTZ1tMigRYg3TurjM6qVlSyxm8ymlk5n9L/CFIC//b5y/Au5kHb89UYx+JVh8S/mYBTPMFNEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MWHPR11MB1246.namprd11.prod.outlook.com (2603:10b6:300:29::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Fri, 25 Feb
 2022 17:11:48 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5017.022; Fri, 25 Feb 2022
 17:11:48 +0000
Message-ID: <bb8d25fa-4b6f-0c53-302a-623787760bcd@intel.com>
Date: Fri, 25 Feb 2022 09:11:46 -0800
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
 <6526515c-a4d1-1815-3ee8-6a35dfa5036f@intel.com>
 <e3abab20-084a-146b-8c6f-274474aa7bc1@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <e3abab20-084a-146b-8c6f-274474aa7bc1@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CO2PR04CA0130.namprd04.prod.outlook.com
 (2603:10b6:104:7::32) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 980a4fa3-80df-4dbf-4d1b-08d9f881e87e
X-MS-TrafficTypeDiagnostic: MWHPR11MB1246:EE_
X-Microsoft-Antispam-PRVS: <MWHPR11MB1246C1870859CE472B0B16F0BD3E9@MWHPR11MB1246.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RWNBozX+paaXvVYr68olPB16Sbyk1fng7IqpJB+iUVkhULQF7dZoVKo+cS9/R8kxOaSJVfCtKpnQ+5648xxFoLXs+6L5AydEGxCZH5lgStsje0ikwv+Z0j7g2+Ey+SuKuwmYP6jfkO5IpWzbeieY9elqoXkBlT8Fk90cHFhPAuqjvjtZ9pWz2LBqQxAjECD/C4JqbQnb13n/pzBykq2Q0SZUpZqkUyCqWT1QpvP00lhW4uswb0ZF6q29/+Oxw0jtSDMZS10YGqmpiKwxwbRC1dkYJgV0+2muPIbnpeQ0uRg941o0Bicc5dPipni5c8h+ZcwOa7H0TqE+rTUcLZVDcJW6rmlunlhNnygUlQdbzS18CAXQBwr6yHyMJWC+jsDd5ASnlt2aMrvHpGbpqnVeX4qfpbfXQNlxTtFa5ueeEjW6jqto4Vg7uhiSGGqKm8mQsUPz3AIKYcy7jsya8R4/6rS+VsZ2QXvCNbGNwDtuOm7UeOCDovKKTJeT7NN1HODO4F+zVZbGZQtpTPWoSGhwii0PX205CRKBY7GVItLip8hX2s2eo7RLoQqNn47Ca3FAZl0ihPtKo4YEpaSk09NeywsLwKsLtUTJt/capU7r+HxX3fAs/EFeZB5UvI/2xUbkRMK4KKBB1VkFfzcuShOC+HEQLt0LARjO8U9Yd2ZkfnJTfWOxh0FGPI/LL360NfoxJnZsriEcbOXZrUdMPH4rFp9zPs2hz5QiqIBPL31IL+PHu+xmiuz52XvZM7HHZIixtSHfXY4xdWfhFp/YjO2KxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(66946007)(316002)(186003)(66556008)(66476007)(2616005)(6512007)(6486002)(86362001)(508600001)(31696002)(6506007)(82960400001)(8676002)(53546011)(83380400001)(36756003)(4326008)(5660300002)(2906002)(31686004)(38100700002)(8936002)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUFxcXRMaVJsUWpJaWZCNVRHeWdjQU1mUklDN2pja1Y5ZXZNMVZjRk1RT2VI?=
 =?utf-8?B?S3NvUUFxcG83MzZWT3YydHVaWk9URWMzdGN6Q0pWaURxZ0d2aTNkbWVZVC9M?=
 =?utf-8?B?TFZNMUs2UjZiTmpIS1pLeER4ck5WZDBscTVMbFI2NzFkbmZ2Sk5FcEZOdml1?=
 =?utf-8?B?UDZSUzFmOTduYnVlRzBIcXRNZklwWXVKd2JKeE9LZzZFeGVhcmxiUjFFSU9r?=
 =?utf-8?B?L2kwcVhJUHQxcHNtSUN0WkZvSEsvRzlkVkRhYzhTWEpVRy9FaisycU11cDZl?=
 =?utf-8?B?SU92QzZadnh2cjlVOWNFbzVLV2d4N0ZoVkIzTlNZdXY0SDRTT0RYS2ptbm1Y?=
 =?utf-8?B?cWorcnRTR2psam5abzVqS0Q5MGVETExGTXJHZTV0NXhzUkNxSkgxWlczdGM2?=
 =?utf-8?B?UzRzM3I1cWdKSWNxN0J2ZU9ORDJ4aXpVdTlxTGE3Vk5XRnlaekoxUm00dlR2?=
 =?utf-8?B?V015NVhqdlJnWFVYNHEzTnlrRTMxWGMrcG1rV3N2OEdMSjZaemNZa25nWVR0?=
 =?utf-8?B?d3I0RFo1KzZuVFJObC85Z00yeFpFbEU3Q2lJSkNlVytzdkZ3RGpXNFA1TXNQ?=
 =?utf-8?B?blExMjVYN1BRa21udU5tMGc2ZGMrb2l0M0JON0tBOEs2MWsyeFdlV3BrekRl?=
 =?utf-8?B?aUYyQzBMN1ArTzdrbUlpQVZUT1VUUCtQUzlGM2FDYTlqb1dTZmpwSWNwUzZX?=
 =?utf-8?B?Wjk3M1dTN3NlK204NU1nVVpOYy9uWHA1R0xSd1dwbHUwTjduYUJyM2R2L3Yx?=
 =?utf-8?B?V2RtakZSeG9XSEc3NmhWSHBGQ2wvM3g0N2lYN3pCZnRWU1pkcWtzUWFzdzZB?=
 =?utf-8?B?STgxOWlrbHdGV0pkYm1yLzNWS3lMRmN1dGpJUEtsUEdna3FQWUFFcHJsMmpQ?=
 =?utf-8?B?TU9YQ05tekdnaHd5UXFGckFZNUk5bFNERmI4U0F3dWF3RnJuTjl4YmRBRG1Y?=
 =?utf-8?B?MkFnQ2ljdGwzbEtMT1RpN2dZSCtkWkRyNEdKMUNWYVlCd0ZCTE96elZkbWcx?=
 =?utf-8?B?U0czbHlUN09lcy9LdXpxbkdOVnFYL3lkaHJuZmlQcXN3OXNETUVWUzRoZlla?=
 =?utf-8?B?NXdCaDg2eXR5bWF4YkQ0TEI1YVdzdzI5bTV1czBUVXViUjV6MmZMYXoraC9K?=
 =?utf-8?B?eXVFRm5Yazk0VThSbHEvMlphcGExTXdjYkpLbkt6Z2N4OFpBdHVPc1dINVBt?=
 =?utf-8?B?dk05bWNyWEVvTTBYcGlETWh6ZVgzc3lUNEF3OXgzNUpONXQwOWplOHVrSzIw?=
 =?utf-8?B?Y0tDdU9WTEY1R0k5eFJVczZOQ1U5TU1kdXRDU0dSWG5TbFlUQTRqaXBxN0s3?=
 =?utf-8?B?ZnJIdEl3bWw3TE9IdE9kRDNvLytQUm5Sak1hRWQ0c1dVa1lRRk93QURMc0lS?=
 =?utf-8?B?Smw2dGs0S2s2VGRyRmlNYkgrN28wM2NrUlJORkcyRlhuV2tBRzlUOU95dDBY?=
 =?utf-8?B?VUdndjJNYkZPd2lVN3phNHB1NmxlcE5aNEZJZjFxZ0RBaWJOQ3cwdlkrTnph?=
 =?utf-8?B?TmMxa3FVci9jb0lGdXlTN1U3dHVXV1VPd2U1UEIySTl0NXg0Q1U3blBOT1Z5?=
 =?utf-8?B?ditnT3VBYk5qSWJ6SzduZE1rU0VmQTVNMzY0bXdJL0xpL1ducjdWN3ovcjk5?=
 =?utf-8?B?Y2haeG5kekNJQkZNZUtEMjN3aVFzT0hzZWk5azhVTWpFcmw3VUVIVWZUZjdB?=
 =?utf-8?B?WndYSzBvQWFIMlh1ekcvZWxBaWhHditmQVhjTDV6dGg1OXB5Rjk2Z0daWmUy?=
 =?utf-8?B?M0FQQXVsY2k0SlQxbVhIREMxTlNkdWdrd0JJR3lUTFdoN3hLdTVlMEF3OGJ4?=
 =?utf-8?B?eHNVMWxqMllHc1NUR3BSYXlSM1QrWnIwKzkyOUY4S2p1WDNhbFNXT3BhTGZP?=
 =?utf-8?B?YXZlNnVVeE1kRU1rU2llRHduUlpCMElKQW9Gd2xyV0ZGdDByVjVmdExJbU9q?=
 =?utf-8?B?ZHdua3FEVVVkaFNTZlRralNZeEMyZHp0WGRtSTAwRFU0ZC9oc1lqeDc2MUVC?=
 =?utf-8?B?QkR0TExsL3d5aTZISjZaR2svcnlOWGJsamg0cjBOUDJBRTJhNS9pWFhqVksw?=
 =?utf-8?B?ejV5dzFoVFJZSVVNM2xaekRVNGtCRWQ1Y2VBUTNmRlVlT0ZBUSs5bXhXM2pS?=
 =?utf-8?B?ZVplQzJTNjFITmZmN2lWRE5wYmdtdzl5OWQxWE03aktqNkJabFY3Ty9sLzh1?=
 =?utf-8?B?QWdKdkhRQkNUUGRsV2tDejZRbzQ4S3VQaVcxVEtMYXV5c1VoSUVZT0NZZ2t3?=
 =?utf-8?Q?7MjuGwTLO/ncYIL0ZTKsLBXBQgN3Sb+5VHG0lpfIbI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 980a4fa3-80df-4dbf-4d1b-08d9f881e87e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 17:11:48.6259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HroEfgdqp1e5ZAs+YefeKsmk+9K9T6tr5K+GNBTDbKIlOwc2WMmQwLaPaQivZ69W4syp6TcpSZCRpibBQXeeRsns3MI5ua19q0ltX3gohzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1246
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

On 2/25/2022 08:36, Tvrtko Ursulin wrote:
> On 24/02/2022 20:02, John Harrison wrote:
>> On 2/23/2022 04:00, Tvrtko Ursulin wrote:
>>> On 23/02/2022 02:22, John Harrison wrote:
>>>> On 2/22/2022 01:53, Tvrtko Ursulin wrote:
>>>>> On 18/02/2022 21:33, John.C.Harrison@Intel.com wrote:
>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>
>>>>>> Compute workloads are inherently not pre-emptible on current 
>>>>>> hardware.
>>>>>> Thus the pre-emption timeout was disabled as a workaround to prevent
>>>>>> unwanted resets. Instead, the hang detection was left to the 
>>>>>> heartbeat
>>>>>> and its (longer) timeout. This is undesirable with GuC submission as
>>>>>> the heartbeat is a full GT reset rather than a per engine reset 
>>>>>> and so
>>>>>> is much more destructive. Instead, just bump the pre-emption timeout
>>>>>
>>>>> Can we have a feature request to allow asking GuC for an engine 
>>>>> reset?
>>>> For what purpose?
>>>
>>> To allow "stopped heartbeat" to reset the engine, however..
>>>
>>>> GuC manages the scheduling of contexts across engines. With virtual 
>>>> engines, the KMD has no knowledge of which engine a context might 
>>>> be executing on. Even without virtual engines, the KMD still has no 
>>>> knowledge of which context is currently executing on any given 
>>>> engine at any given time.
>>>>
>>>> There is a reason why hang detection should be left to the entity 
>>>> that is doing the scheduling. Any other entity is second guessing 
>>>> at best.
>>>>
>>>> The reason for keeping the heartbeat around even when GuC 
>>>> submission is enabled is for the case where the KMD/GuC have got 
>>>> out of sync with either other somehow or GuC itself has just 
>>>> crashed. I.e. when no submission at all is working and we need to 
>>>> reset the GuC itself and start over.
>>>
>>> .. I wasn't really up to speed to know/remember heartbeats are 
>>> nerfed already in GuC mode.
>> Not sure what you mean by that claim. Engine resets are handled by 
>> GuC because GuC handles the scheduling. You can't do the former if 
>> you aren't doing the latter. However, the heartbeat is still present 
>> and is still the watchdog by which engine resets are triggered. As 
>> per the rest of the submission process, the hang detection and 
>> recovery is split between i915 and GuC.
>
> I meant that "stopped heartbeat on engine XXX" can only do a full GPU 
> reset on GuC.
I mean that there is no 'stopped heartbeat on engine XXX' when i915 is 
not handling the recovery part of the process.


>
>     intel_gt_handle_error(engine->gt, engine->mask,
>                   I915_ERROR_CAPTURE,
>                   "stopped heartbeat on %s",
>                   engine->name);
>
> intel_gt_handle_error:
>
>     /*
>      * Try engine reset when available. We fall back to full reset if
>      * single reset fails.
>      */
>     if (!intel_uc_uses_guc_submission(&gt->uc) &&
>         intel_has_reset_engine(gt) && !intel_gt_is_wedged(gt)) {
>         local_bh_disable();
>         for_each_engine_masked(engine, gt, engine_mask, tmp) {
>
> You said "However, the heartbeat is still present and is still the 
> watchdog by which engine resets are triggered", now I don't know what 
> you meant by this. It actually triggers a single engine reset in GuC 
> mode? Where in code does that happen if this block above shows it not 
> taking the engine reset path?
i915 sends down the per engine pulse.
GuC schedules the pulse
GuC attempts to pre-empt the currently active context
GuC detects the pre-emption timeout
GuC resets the engine

The fundamental process is exactly the same as in execlist mode. It's 
just that the above blocks of code (calls to intel_gt_handle_error and 
such) are now inside the GuC not i915.

Without the heartbeat going ping, there would be no context switching 
and thus no pre-emption, no pre-emption timeout and so no hang and reset 
recovery. And GuC cannot sent pulses by itself - it has no ability to 
generate context workloads. So we need i915 to send the pings and to 
gradually raise their priority. But the back half of the heartbeat code 
is now inside the GuC. It will simply never reach the i915 side timeout 
if GuC is doing the recovery (unless the heartbeat's final period is too 
short). We should only reach the i915 side timeout if GuC itself is 
toast. At which point we need the full GT reset to recover the GuC.

John.


>
>>> I am not sure it was the best way since full reset penalizes 
>>> everyone for one hanging engine. Better question would be why leave 
>>> heartbeats around to start with with GuC? If you want to use it to 
>>> health check GuC, as you say, maybe just send a CT message and 
>>> expect replies? Then full reset would make sense. It also achieves 
>>> the goal of not seconding guessing the submission backend you raise.
>> Adding yet another hang detection mechanism is yet more complication 
>> and is unnecessary when we already have one that works well enough. 
>> As above, the heartbeat is still required for sending the pulses that 
>> cause pre-emptions and so let GuC detect hangs. It also provides a 
>> fallback against a dead GuC by default. So why invent yet another wheel?
>
> Lets first clarify the previous block to make sure there aren't any 
> misunderstandings there.
>
> Regards,
>
> Tvrtko
>
>>> Like it is now, and the need for this series demonstrates it, the 
>>> whole thing has a pretty poor "impedance" match. Not even sure what 
>>> intel_guc_find_hung_context is doing in intel_engine_hearbeat.c - 
>>> why is that not in intel_gt_handle_error at least? Why is hearbeat 
>>> code special and other callers of intel_gt_handle_error don't need it?
>> There is no guilty context if the reset was triggered via debugfs or 
>> similar. And as stated ad nauseam, i915 is no longer handling the 
>> scheduling and so cannot make assumptions about what is or is not 
>> running on the hardware at any given time. And obviously, if the 
>> reset initiated by GuC itself then i915 should not be second guessing 
>> the guilty context as the GuC notification has already told us who 
>> was responsible.
>>
>> And to be clear, the 'poor impedance match' is purely because we 
>> don't have mid-thread pre-emption and so need a stupidly huge timeout 
>> on compute capable engines. Whereas, we don't want a total heatbeat 
>> timeout of a minute or more. That is the impedance mis-match. If the 
>> 640ms was acceptable for RCS then none of this hacky timeout 
>> algorithm mush would be needed.
>>
>> John.
>>
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>

