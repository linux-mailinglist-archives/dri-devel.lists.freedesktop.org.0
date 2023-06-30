Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDFF743BF2
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 14:36:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86BF10E1CB;
	Fri, 30 Jun 2023 12:36:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84BA10E1CB
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 12:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688128580; x=1719664580;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/eT+sW0epV24puHcbi1XkYi3DHaD9MYzrzQ//3+wnqU=;
 b=DzfT0kKxXOsCdtqF+AxZcW7WFskeC2tLKCh36VPhdWvzonq69awqp4Iy
 wOuHUfUcycyG6kkCpQ/2oRE31s//52pQTTgbah5HDrdl3qZvpC9755ER9
 rdpg4Lx1b3gGTyoEtOfADzsfH59yHV60Rm1vkmYBdl0QQxwL1Osec5l9B
 JYmlYFQaTGVPheMs9ehiO3VZ6NizcpuEUFjhxztrMdyXwdqDo8pYDq7am
 7G9EowpLMbdYPx+r5ENvE4nGg2didKcegXFnffZLjBh9D/l7tS6mKAXpU
 dGZAjrQ9hiPh4kx2Gl/f4R1rOpDS1/0piald8JYYGvtcvKX4DqYhgd6IG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="361229966"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; d="scan'208";a="361229966"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 05:36:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="711806609"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; d="scan'208";a="711806609"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 30 Jun 2023 05:36:19 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 30 Jun 2023 05:36:18 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 30 Jun 2023 05:36:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 30 Jun 2023 05:36:18 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 30 Jun 2023 05:36:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbuHtaRHtSkI8wDsaXM9xwiTCJXHcQE2d9Sv+PQLCdFpgTVRX44jqI4U/Md3O1s1a4xbdbN2BXKMt1eChrKtWOEK3G/58pXa30D+KfkPGmSLYDTkzmyD00vfTEec1EpI/+kt0lu0noWkQ68rCFRAsM0PzPll4YbEWh17FbrzYSJrZQ7C+So6k8OwMPxMvmoSxJR1CxOYPitVUYZGd1Jr+/RoislIiOlalCI4w/rPESw65YiHD7YEi5nLZZN8F5tyFrJ/NDtiRBqnfHaybg/62OhTqSsEg/TsCTVgNu9V6p4X9OxAxD9KMBRFRCBbUmiwYXvFBx6wrf7bVKmdHuRRQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oc6r4CghwDStbOo1S14sDik8PswR9QSwO56lsSeTopc=;
 b=fW1ox/74Fye8zg2FCaCjGpMswmHj34xWFhyDMFSYc/+UKyWyurBFWxz6u7RtZaz/nhy6V+UhraCyRaScTNMTvK+yRjGa528tcZ2FdA79lIzIeZ7lkOr/fjVotG7HOkWbJMeO6UWIQW+g3ei5H6Np6uByCYUXZUJFUluos14ZUmJMrjUjiPJxuDTssJkjprdOaAqOGO91HTho5SDXRWptN7xzcvAQVKVqAXom0G4mIGZgBROA1jXyY6Sg+0fp5KA8TFZ2k+znCgUiOvU/0hAuc/1PiPk7qrym1GFpQO68xqx91KkE/ADfIG9y+uPZGb+o1tN4jj/tHGm+nWNM/owtoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by PH8PR11MB7023.namprd11.prod.outlook.com (2603:10b6:510:221::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 30 Jun
 2023 12:36:15 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::74d2:5fa6:b6e5:7c63]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::74d2:5fa6:b6e5:7c63%6]) with mapi id 15.20.6544.019; Fri, 30 Jun 2023
 12:36:14 +0000
Message-ID: <1e5746c0-ee62-a7a7-9290-a478dced5fd5@intel.com>
Date: Fri, 30 Jun 2023 14:35:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC v2 1/3] drm/ttm: Introduce KUnit tests
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>
References: <cover.1687779215.git.karolina.stolarek@intel.com>
 <ccca4b6f62a5b87d4c8c504209c978266d1425ad.1687779215.git.karolina.stolarek@intel.com>
 <4a99ccf2-da23-b64f-6768-548079b2edbd@amd.com>
 <2721d944-804d-929a-5d63-5119339bdf5b@intel.com>
 <b3b882de-1c41-8521-efc6-dc8f2a2798af@intel.com>
 <f0dd5100-ebf1-92df-cc8d-9a8a3374a843@amd.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <f0dd5100-ebf1-92df-cc8d-9a8a3374a843@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0298.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8a::10) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|PH8PR11MB7023:EE_
X-MS-Office365-Filtering-Correlation-Id: 59ac150a-d755-4737-ae65-08db796697ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: loVZ+GNND53VJ9VEkmPjdf/iubeB+buZ+j+TwQI4HwlQZ1MWudFxAM6JcrFoX4/EyaNP2/x1FSzGKxZ1ypmIjtpkKYKwKeSW45DzU2bJzIs/njXYiwceC7wb9LDKleg9+U4G7mbAIV5WCP1w8JpxDQOEWSj//sCdQVpZwRIPMcLahptQOnFH8cc+aPmIiXfdIVX9s/mtMdY+a7kt1e5zbL/syViX5Mf/fhoXNehiSgeJZRA4syCYqqLUNXUK/Q1Z5lUTTeOkprD+p1PZ/c63NJak8L1Y29xnUZT5stfWznA0RAT1RdmsrPhuLd741lliTyo2k/YIjzoXHg66YpOxBVxzurvdrwy4Twp2VfO6P0w5U+1vxZtdcal24BesNcrc9Ze0kDWPbmNsbmCZMgG9GI2ozwd4LK+OkhWRmqe35U1yuR1T48GazUdMnqnFJD+lXCWkO4QTzkRl0/ngC0uFF+uI7AS5VA4r2PAmGN84UytiEQk3opLM5A3HejS7OP4Ne1ZmWa0rAfd+4g/b8URszp9yxKqUCXVbRiv7bTMYilcEwKmHBSMQgybR4uq6A82zdMOhdi3E3ApG3KUlMf/tOcqankacrz224uiE1LrR4CSJVWFGVxKamnODQdntMPnr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(376002)(136003)(346002)(39860400002)(451199021)(31686004)(66899021)(53546011)(36756003)(30864003)(5660300002)(44832011)(86362001)(66476007)(66556008)(41300700001)(8676002)(316002)(31696002)(4326008)(8936002)(38100700002)(82960400001)(66946007)(966005)(2906002)(36916002)(478600001)(6506007)(186003)(6512007)(26005)(2616005)(6666004)(6486002)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1hVRFlTaGxWd1BZWDN4WnNKMVhScDcrVWk2ZVFRakJTQURPeFZKaXVlQ3l1?=
 =?utf-8?B?aDVXUVo1NE1TSVF1eDQwRldVNzl2WkFMWmMvS2xWQjFtbk9yRGkxTEtacEV6?=
 =?utf-8?B?TkNpWDdCSm9Vb0NWeUFDVzhDaENaK3cydUtnSVpBV1F5eDV5Q0JvampKWFlx?=
 =?utf-8?B?SFBpeGZndUpjWnZ4b1Q2L1o3V1hlTzZiRC84R0I0SWdGaThGeEZTSThMc25H?=
 =?utf-8?B?L3VpUnNSampJR2lIZmY5UmxnZzFGaXgvVHFZY2hwNjdrWm96anNLNisvSlc5?=
 =?utf-8?B?aE5GZGgvQjZTWlZxaHJqVzVpendyL0J6bDJCeXhMT0dYM1FOYlMwNFY4aWJN?=
 =?utf-8?B?NUlXK2tLMFR1aGxoYmtlbkJsNWt4S2RpUEd4K0pSZEVzQlhWeTJsZFdpaCtr?=
 =?utf-8?B?N0hOOURoVU4vTFRoZTA2ZVpwVjJmQlBXamRFdGo2SHF2RTZMQXRLaXRnQUV1?=
 =?utf-8?B?djZqNERuMWU2bEVRVnhmaWZYRExXWDFkamtwN2NPVUdUVVZ1M1FFNlk3bXF3?=
 =?utf-8?B?R0NGREYzTGhtRHM3cnU1NStuMHprTHF0QUpMdjBpcDl4alVqVjczb2xFaDE1?=
 =?utf-8?B?UE5Ya0hRM0hHd2ZXVk1YWnVDUzc3T1JTaStHeGFuU0h5cC9CZE1HcGFXOHBD?=
 =?utf-8?B?dXdDQXFMMGtMQmhzbThuMzZQT1NrMlRoajE4N1Ewanpwd1VRNHdCYmEveTBa?=
 =?utf-8?B?QUpCSjlDTDFKVjZRUy9TRkViVTNwaEk3blM1U0daN2I0TURETVJTWjN3eFN4?=
 =?utf-8?B?N1djaVFBdzVuSkdRbFZURC9oYjBkbUFIa1NsZzJxNzFpemRnS3ZteVBUVkVI?=
 =?utf-8?B?TjJVeTliM29pVnhqUXVCcHF4RjRidFcwem05REY2UzU1QWpKd09pck16TDF3?=
 =?utf-8?B?MElIWXF1MmR5Q08xMEdCbEtpWTh0YlU0b3huNFI1UkxLMFJ3SU9MUWZTaXpN?=
 =?utf-8?B?LzVOc0Fwb0J5T05VYVhHWkd4Q0w2RnFoU3p2bkREa2pqckt2NllUektBNFRO?=
 =?utf-8?B?blBpeHFVeVlGMEZMc0lSSHU2Z01obDYzSzBsRUNCUVdaUkthUGg1V3VYd2Rn?=
 =?utf-8?B?aUFDU2taYWNRRjFpNktLby9aU21rcDYzRzNONEE1b2pIVGNnVWhaMUpma1d1?=
 =?utf-8?B?TFg1YzVmWlI1amV4aWtuaGtGZkl2aXBXYkl6Rkc5SlRjZ2djZmo1YW5qWVFX?=
 =?utf-8?B?anJZUlJJODQyT082WEhWRVdGaFlEOXFlbFpBRk9RdnY1WTFidUJZZmhnSDdy?=
 =?utf-8?B?SnlkMnB0eUQ5TDF3K0xOYm93TGVUNzlXUzZCUVZtSk5yanpzNkJhbU4xVzY0?=
 =?utf-8?B?RTlKYzUvcE9yWDBCOTZERi9rQkg2Uk5TQnp5MFc1VmhrN2w1STQ2K3F6WXRr?=
 =?utf-8?B?NThwMWpiZ0Q4OU9sSmtMYm80ZmsyQjJLdXQxMS8wbktrbkNCQ0JHMUcrWFQ0?=
 =?utf-8?B?Rnc1ZTAwanQyTlBFQm1paktrbXlYSkIrVUU0NFV3eUR5eTd6K0dJQ2JGTFI1?=
 =?utf-8?B?cGhjbmtKSVZYK01Jd0l2cFFuUUM5N3VKSUNCbWJHNlZlSU1LbW5NQktnMFdR?=
 =?utf-8?B?WStrMzFjSThWem9Ea1V4NGtQcHZlVlVhWDJVVmpLSm1WOERFT1RCeUQ1NGE4?=
 =?utf-8?B?WDd1bVdqN250RGo4QWluUS8zcE9oc3lJOU5OT2xLZS8vV280dmRFNmtlaFBT?=
 =?utf-8?B?RDB2TG1hdHpoeHRoNCsxQlVPMHVIUmZOR0src0xJUTB5NFZXdzlRSkF3R2pD?=
 =?utf-8?B?Q3htZGE5N1RJa3FFQzExUWFkNTJLblhHcndkRlZpM29zYlVISytWbzFvSGgz?=
 =?utf-8?B?OC80c29mUThsc0c3a3BaSHBpRHlMcStTR290dVlmWW9hOHM0bWFOdVBHWG9t?=
 =?utf-8?B?MFJtVjZPa1pkVEhkdElXeEhBV2pZYjNHU2tlWWNKVzBvcnp0Vk1kcGgzWURn?=
 =?utf-8?B?STBMbTRXdC9HRXBlZzg0SmluQVYyb3VRQ3d1WkU4Z2JGWnQwNW9ITmNkdHMw?=
 =?utf-8?B?S3VwQUg3aEc5NnRNU084VkI3NXVDdDFpT3hPZlkzWldTOXVmVFhzWXJyc1Mr?=
 =?utf-8?B?ZVdpdjNLVDBNOHN2bHRYcm9xUzRNeEhraC9Xa0U5VVozamNnTU1aNW5tcXl5?=
 =?utf-8?B?TlJtTTVHRk84NXhMVUFITHNqaWIzY2M5K1FuZmFZbTdiRjljUGFNTENYLzNJ?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59ac150a-d755-4737-ae65-08db796697ed
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 12:36:14.7135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RC9e0bEndSWSIpKqaGbeCh4dcC4CqJ5+PoIO2BX35ekgXPZ71yt9DI8aKBcMaU58pc+DQ0a/Jx0XqgkoGH8f7m4a4Wsp29yWklCt7HPh6ik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7023
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
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Shuah Khan <shuah@kernel.org>, Andi Shyti <andi.shyti@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30.06.2023 13:18, Christian König wrote:
> Am 30.06.23 um 13:09 schrieb Karolina Stolarek:
>> Hi Christian,
>>
>> I'm taking a second look at this, and I wonder what would be the 
>> benefit of combining the initialization of device and ttm_device. 
>> (drm_)device can be initialized indepedently from the test params, so 
>> we can utilize .init and .exit callbacks offered by KUnit[1] to 
>> prepare and release the device indepedently of our setup. If we were 
>> to change it so ttm_device is also initialized there, we'd have to 
>> manually call init/fini in every single test. What's more, ttm_pool 
>> tests don't depend on ttm_device, and I can imagine that some structs 
>> can be tested in a similar way.
>>
>> Would it be fine with you to rename ttm_kunit_helper_alloc_device(), 
>> but leave its definition as it is?
> 
> Yeah, sure. It's perfectly up to you how to structurize that, I wasn't 
> even aware that there are .init and .exit callbacks.
> 
> I just found that the function name didn't match what the function was 
> doing.

Right, and that was a good call, thanks a lot.

All the best,
Karolina

> 
> Regards,
> Christian.
> 
>>
>> All the best,
>> Karolina
>> -------------------------------------------------------------------
>> [1] - 
>> https://kunit.dev/third_party/kernel/docs/api/test.html#c.kunit_suite
>>
>> On 29.06.2023 12:05, Karolina Stolarek wrote:
>>> Hi Christian,
>>>
>>> Thanks a lot for taking a look at my patches.
>>>
>>> On 29.06.2023 09:50, Christian König wrote:
>>>> Am 27.06.23 um 10:32 schrieb Karolina Stolarek:
>>>>> Add the initial version of unit tests for ttm_device struct, together
>>>>> with helper functions.
>>>>>
>>>>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/Kconfig                       | 15 +++++
>>>>>   drivers/gpu/drm/ttm/Makefile                  |  1 +
>>>>>   drivers/gpu/drm/ttm/tests/.kunitconfig        |  4 ++
>>>>>   drivers/gpu/drm/ttm/tests/Makefile            |  5 ++
>>>>>   drivers/gpu/drm/ttm/tests/ttm_device_test.c   | 54 +++++++++++++++++
>>>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 59 
>>>>> +++++++++++++++++++
>>>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h | 29 +++++++++
>>>>>   7 files changed, 167 insertions(+)
>>>>>   create mode 100644 drivers/gpu/drm/ttm/tests/.kunitconfig
>>>>>   create mode 100644 drivers/gpu/drm/ttm/tests/Makefile
>>>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_device_test.c
>>>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>>>>>
>>>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>>>> index afb3b2f5f425..53024e44a2d5 100644
>>>>> --- a/drivers/gpu/drm/Kconfig
>>>>> +++ b/drivers/gpu/drm/Kconfig
>>>>> @@ -194,6 +194,21 @@ config DRM_TTM
>>>>>         GPU memory types. Will be enabled automatically if a device 
>>>>> driver
>>>>>         uses it.
>>>>> +config DRM_TTM_KUNIT_TEST
>>>>> +        tristate "KUnit tests for TTM" if !KUNIT_ALL_TESTS
>>>>> +        default n
>>>>> +        depends on DRM && KUNIT
>>>>> +        select DRM_TTM
>>>>> +        select DRM_EXPORT_FOR_TESTS if m
>>>>> +        select DRM_KUNIT_TEST_HELPERS
>>>>> +        default KUNIT_ALL_TESTS
>>>>> +        help
>>>>> +          Enables unit tests for TTM, a GPU memory manager 
>>>>> subsystem used
>>>>> +          to manage memory buffers. This option is mostly useful 
>>>>> for kernel
>>>>> +          developers.
>>>>> +
>>>>> +          If in doubt, say "N".
>>>>> +
>>>>>   config DRM_BUDDY
>>>>>       tristate
>>>>>       depends on DRM
>>>>> diff --git a/drivers/gpu/drm/ttm/Makefile 
>>>>> b/drivers/gpu/drm/ttm/Makefile
>>>>> index f906b22959cf..dad298127226 100644
>>>>> --- a/drivers/gpu/drm/ttm/Makefile
>>>>> +++ b/drivers/gpu/drm/ttm/Makefile
>>>>> @@ -8,3 +8,4 @@ ttm-y := ttm_tt.o ttm_bo.o ttm_bo_util.o 
>>>>> ttm_bo_vm.o ttm_module.o \
>>>>>   ttm-$(CONFIG_AGP) += ttm_agp_backend.o
>>>>>   obj-$(CONFIG_DRM_TTM) += ttm.o
>>>>> +obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += tests/
>>>>> diff --git a/drivers/gpu/drm/ttm/tests/.kunitconfig 
>>>>> b/drivers/gpu/drm/ttm/tests/.kunitconfig
>>>>> new file mode 100644
>>>>> index 000000000000..75fdce0cd98e
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/ttm/tests/.kunitconfig
>>>>> @@ -0,0 +1,4 @@
>>>>> +CONFIG_KUNIT=y
>>>>> +CONFIG_DRM=y
>>>>> +CONFIG_DRM_KUNIT_TEST_HELPERS=y
>>>>> +CONFIG_DRM_TTM_KUNIT_TEST=y
>>>>> diff --git a/drivers/gpu/drm/ttm/tests/Makefile 
>>>>> b/drivers/gpu/drm/ttm/tests/Makefile
>>>>> new file mode 100644
>>>>> index 000000000000..7917805f37af
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/ttm/tests/Makefile
>>>>> @@ -0,0 +1,5 @@
>>>>> +# SPDX-License-Identifier: GPL-2.0 AND MIT
>>>>> +
>>>>> +obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
>>>>> +        ttm_device_test.o \
>>>>> +        ttm_kunit_helpers.o
>>>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_device_test.c 
>>>>> b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
>>>>> new file mode 100644
>>>>> index 000000000000..08d7314b1e35
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
>>>>> @@ -0,0 +1,54 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0 AND MIT
>>>>> +/*
>>>>> + * Copyright © 2023 Intel Corporation
>>>>> + */
>>>>> +#include <drm/ttm/ttm_resource.h>
>>>>> +#include <drm/ttm/ttm_device.h>
>>>>> +#include <drm/ttm/ttm_placement.h>
>>>>> +
>>>>> +#include "ttm_kunit_helpers.h"
>>>>> +
>>>>> +static void ttm_device_init_basic(struct kunit *test)
>>>>> +{
>>>>> +    struct ttm_test_devices_priv *priv = test->priv;
>>>>> +    struct ttm_device *ttm_dev;
>>>>> +    struct ttm_resource_manager *ttm_sys_man;
>>>>> +    int err;
>>>>> +
>>>>> +    ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>>>>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>>>>> +
>>>>> +    err = ttm_kunit_helper_alloc_device(test, ttm_dev, false, false);
>>>>> +    KUNIT_ASSERT_EQ(test, err, 0);
>>>>> +
>>>>> +    KUNIT_EXPECT_PTR_EQ(test, ttm_dev->funcs, &ttm_dev_funcs);
>>>>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_dev->wq);
>>>>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_dev->man_drv[TTM_PL_SYSTEM]);
>>>>> +
>>>>> +    ttm_sys_man = &ttm_dev->sysman;
>>>>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_sys_man);
>>>>> +    KUNIT_EXPECT_TRUE(test, ttm_sys_man->use_tt);
>>>>> +    KUNIT_EXPECT_TRUE(test, ttm_sys_man->use_type);
>>>>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_sys_man->func);
>>>>> +
>>>>> +    KUNIT_EXPECT_PTR_EQ(test, ttm_dev->dev_mapping,
>>>>> +                priv->drm->anon_inode->i_mapping);
>>>>> +
>>>>> +    ttm_device_fini(ttm_dev);
>>>>> +}
>>>>> +
>>>>> +static struct kunit_case ttm_device_test_cases[] = {
>>>>> +    KUNIT_CASE(ttm_device_init_basic),
>>>>> +    {}
>>>>> +};
>>>>> +
>>>>> +static struct kunit_suite ttm_device_test_suite = {
>>>>> +    .name = "ttm_device",
>>>>> +    .init = ttm_test_devices_init,
>>>>> +    .exit = ttm_test_devices_fini,
>>>>> +    .test_cases = ttm_device_test_cases,
>>>>> +};
>>>>> +
>>>>> +kunit_test_suites(&ttm_device_test_suite);
>>>>> +
>>>>> +MODULE_LICENSE("GPL");
>>>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c 
>>>>> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>>>> new file mode 100644
>>>>> index 000000000000..d03db0405484
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>>>> @@ -0,0 +1,59 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0 AND MIT
>>>>> +/*
>>>>> + * Copyright © 2023 Intel Corporation
>>>>> + */
>>>>> +#include "ttm_kunit_helpers.h"
>>>>> +
>>>>> +struct ttm_device_funcs ttm_dev_funcs = {
>>>>> +};
>>>>> +EXPORT_SYMBOL_GPL(ttm_dev_funcs);
>>>>> +
>>>>> +int ttm_kunit_helper_alloc_device(struct kunit *test,
>>>>
>>>> Since this function is only initializing the ttm device I think we 
>>>> should name it ttm_kunit_helper_init_device().
>>>>
>>>> On the other hand I don't see a good reason why it can't also 
>>>> allocate the device.
>>>
>>> I believe that's a leftover from times when I thought I'll reuse DRM 
>>> device between the tests. No problem, I can put them into one function.
>>>
>>> All the best,
>>> Karolina
>>>
>>>>
>>>> Apart from that looks like a good start,
>>>> Christian.
>>>>
>>>>> +                  struct ttm_device *ttm,
>>>>> +                  bool use_dma_alloc,
>>>>> +                  bool use_dma32)
>>>>> +{
>>>>> +    struct ttm_test_devices_priv *priv = test->priv;
>>>>> +    struct drm_device *drm = priv->drm;
>>>>> +    int err;
>>>>> +
>>>>> +    err = ttm_device_init(ttm, &ttm_dev_funcs, drm->dev,
>>>>> +                  drm->anon_inode->i_mapping,
>>>>> +                  drm->vma_offset_manager,
>>>>> +                  use_dma_alloc, use_dma32);
>>>>> +
>>>>> +    return err;
>>>>> +}
>>>>> +EXPORT_SYMBOL_GPL(ttm_kunit_helper_alloc_device);
>>>>> +
>>>>> +int ttm_test_devices_init(struct kunit *test)
>>>>> +{
>>>>> +    struct ttm_test_devices_priv *priv;
>>>>> +
>>>>> +    priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
>>>>> +    KUNIT_ASSERT_NOT_NULL(test, priv);
>>>>> +
>>>>> +    test->priv = priv;
>>>>> +
>>>>> +    priv->dev = drm_kunit_helper_alloc_device(test);
>>>>> +    KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->dev);
>>>>> +
>>>>> +    priv->drm = __drm_kunit_helper_alloc_drm_device(test, priv->dev,
>>>>> +                            sizeof(*priv->drm), 0,
>>>>> +                            DRIVER_GEM);
>>>>> +    KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +EXPORT_SYMBOL_GPL(ttm_test_devices_init);
>>>>> +
>>>>> +void ttm_test_devices_fini(struct kunit *test)
>>>>> +{
>>>>> +    struct ttm_test_devices_priv *priv = test->priv;
>>>>> +
>>>>> +    drm_kunit_helper_free_device(test, priv->dev);
>>>>> +    drm_dev_put(priv->drm);
>>>>> +}
>>>>> +EXPORT_SYMBOL_GPL(ttm_test_devices_fini);
>>>>> +
>>>>> +MODULE_LICENSE("GPL");
>>>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h 
>>>>> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>>>>> new file mode 100644
>>>>> index 000000000000..69fb03b9c4d2
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>>>>> @@ -0,0 +1,29 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0 AND MIT */
>>>>> +/*
>>>>> + * Copyright © 2023 Intel Corporation
>>>>> + */
>>>>> +#ifndef TTM_KUNIT_HELPERS_H
>>>>> +#define TTM_KUNIT_HELPERS_H
>>>>> +
>>>>> +#include <drm/drm_drv.h>
>>>>> +#include <drm/ttm/ttm_device.h>
>>>>> +
>>>>> +#include <drm/drm_kunit_helpers.h>
>>>>> +#include <kunit/test.h>
>>>>> +
>>>>> +extern struct ttm_device_funcs ttm_dev_funcs;
>>>>> +
>>>>> +struct ttm_test_devices_priv {
>>>>> +    struct drm_device *drm;
>>>>> +    struct device *dev;
>>>>> +};
>>>>> +
>>>>> +int ttm_kunit_helper_alloc_device(struct kunit *test,
>>>>> +                  struct ttm_device *ttm,
>>>>> +                  bool use_dma_alloc,
>>>>> +                  bool use_dma32);
>>>>> +
>>>>> +int ttm_test_devices_init(struct kunit *test);
>>>>> +void ttm_test_devices_fini(struct kunit *test);
>>>>> +
>>>>> +#endif // TTM_KUNIT_HELPERS_H
>>>>
> 
