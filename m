Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 639F97423B0
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 12:06:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30B110E0DD;
	Thu, 29 Jun 2023 10:06:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C5510E0DD
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 10:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688033173; x=1719569173;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DNXTRe4tj81qA9KWoUJbpg4pK5D8L55+eRKaCu34xlM=;
 b=WkWUsrpuKdFlCbProZlt1d396vfoifTEXK3J/HTd6IoEEDcXK6hY0RUc
 AouXoG8os35bCGniWCHmDQgo5J8mn9SWyyvYPxfPkxDhELcMM1r3Teuy9
 DaoDdhVInlJnVVvlCFp7GSeDSIlWJsY0d037J51qZh1p6hUQ6ekqt8RmT
 5H+SFWEyXtmhkKurEgx0zynVWwLWYIhkXXe5f2xh97RIwnbAMmWhehe/d
 rDA2uR+QDm0UB+KLZeGMF2ZV5/q5eHkbdiqAhA1kEvXDDyFNNS3v4FVcx
 qEQDedAGXa4l8WML5HQOV2HSBUfD3snrqObQvTBjU8gEJd6CzsgbEqxJj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="364619281"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; d="scan'208";a="364619281"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 03:05:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="746972006"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; d="scan'208";a="746972006"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 29 Jun 2023 03:05:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 03:05:37 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 03:05:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 29 Jun 2023 03:05:36 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 29 Jun 2023 03:05:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YCBt15BLc7AIs2RbIlZeLUXCsvDPlnBbbkT9tVMR7NOIy5SrC8pImj/laQCmVEKZKyxo+oxNgQct4oliSg+WXKVjXcO07q4W0XBS+PdJTSa3FIXdql2SlBqU2smR7pw83ciGwfseeKv0PDKWRYhXexdSNqov4jUQ/fZUDgEzzYqmYFzrw2AL4+sIfRIk7he865sHmE0MaMrDuGZBQLkJ7FLqa+KOgTmn0xlyR1dFA4ccOm10GALOZXq5ibx9P7+7unY/vLHv07aZKuTIQPa4HvGUehVJJNVluGaoLR8HvpKPfn+XpWdttJToL5ngjfcbxQ9LdS2TnQQcfm5AkEEfHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ei2ykk2G0UMCpE6GUAXprdnH71CJNmSB/2yf/EHJYXw=;
 b=blrXaS3OOQZLHgoQpSrut17RNSUFEOGx5Y/qCMQQ5KRc+8DoXvMsBsWC9vrlz63s/OoFs9hIxKLbUIVaTdAh0tmZ51JngZVJTFSmAr4H9ofKsqRe800zAAYChQ05UVnBGj8SDJzdIftFZrVITpLOU2CIKBOSAJ1liRUOvQvUfnemztPnpmgw6RRGnI7eJ0MUpZDmPJ9+dGe0AwZhzIQE+EqFh8AQTt15bJQ6txUupVkW1jCAq1GMgb9BXN7PSOcbeETLuJINaCzOuO4zyMjX69HNV285+onXN0anaiRYAM3iEJhURhikOVd2rqZfjrbwJW9tOJHSJNfFbdB2d/ISZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by DS7PR11MB7950.namprd11.prod.outlook.com (2603:10b6:8:e0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 29 Jun
 2023 10:05:34 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::74d2:5fa6:b6e5:7c63]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::74d2:5fa6:b6e5:7c63%6]) with mapi id 15.20.6521.024; Thu, 29 Jun 2023
 10:05:34 +0000
Message-ID: <2721d944-804d-929a-5d63-5119339bdf5b@intel.com>
Date: Thu, 29 Jun 2023 12:05:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC v2 1/3] drm/ttm: Introduce KUnit tests
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>
References: <cover.1687779215.git.karolina.stolarek@intel.com>
 <ccca4b6f62a5b87d4c8c504209c978266d1425ad.1687779215.git.karolina.stolarek@intel.com>
 <4a99ccf2-da23-b64f-6768-548079b2edbd@amd.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <4a99ccf2-da23-b64f-6768-548079b2edbd@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::11) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|DS7PR11MB7950:EE_
X-MS-Office365-Filtering-Correlation-Id: 181d59f1-5e84-4897-fa05-08db788860b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sjmhnh1/bDCqqoTIJFbq9V0w2pazEgocVfvCggV9x6V4uUddke6M7ejsxTAUlA2FDPD9sSfAnUjT8aXoS68eIZaO7TmJPdajImLyZY01Jo+ZorYV8wW+rqGw6l2xwZSTRy/wDemgCz0pw4RZufRHOgSo2IgmINclLzjeCxLrgXLuyYL2sDMQXVg5WJhYi3eGJodb6aOB4UyyFhnkeUREGqxQ5fAfk/7JBcfNFUyT+cYEITmQ4/CnVE1kKfD3aHt7GG8/idxX4Xt46LVBkZfUtHUKPDHSrWZCm47zUGjuGWNuf93wh7zF0pBW0NAx2ktJTBgTW4uqoApwculH4FrKOt/KfwPbhBcmSQGabIts5FjJ1n80m1kwoNzpTVuxnrIKQ4dQ39q/8BLNKTPezLuhcM7Y4kty9NUyFt+k/q/mMGZ0UZ0fu1eGEc92GLoP0YX0GxUxmAwtRxFhqa1A6Qadzw8nP8mgngKNL5AIea5hgR196uBFnAtogsnssOsx8zNd4hnbHfAwq7rdpFGhIZPFkUISmYW6LJb0En3S42v89lPyyxuq4UWlHRXl6+woZyO7NrYkn8WsJYEDlA5X9DQprTAf2N/tpahRwCJ4FzeCULYS19Ecu8f/W58Kun78fqv8WY33YLvMsXnGO6Y+hxtwew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(136003)(396003)(376002)(366004)(451199021)(82960400001)(38100700002)(31696002)(36756003)(31686004)(86362001)(54906003)(2616005)(6486002)(36916002)(6666004)(41300700001)(66946007)(316002)(53546011)(66556008)(8936002)(8676002)(26005)(4326008)(6512007)(6506007)(186003)(66476007)(2906002)(44832011)(478600001)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1NaTDE3WXpIWFRmQ2hvSC9kVTcwQ2tvWlNSNSsxbFRLcTVMaFZrSG1menRi?=
 =?utf-8?B?ZHd0V0hvYzhEOWxKcVg3L0NsMzlaNFdlcklsM0JoTzJKQ05MSk5CeFNsY1JO?=
 =?utf-8?B?Z09hQjNLRUNKdGRsdzBrQUxUbkloTTBBdXlkMWUzTS9PeENFV0JBQzF0U1dV?=
 =?utf-8?B?Q1I0em4zeHVsL2Znd1Erc1pyQXhrT3lrSm1ucEpTQXhZbkp5OHlUZzBsN0pB?=
 =?utf-8?B?TldzdzZyU3FSd01OSUh4bS94d2dRUnFsblVEcUxudmo4dmJkeVFmTXFLcERh?=
 =?utf-8?B?VVJISGN0NGRaNkEybFhWdUNoRlVSR1FvUDdMc3N6NllJV25SRVhoL214bXpX?=
 =?utf-8?B?V21aSE1oYjFlQnVodDYraHcxNGdEaC8rQWFCb3U3VnROTDh3TWpacko4Vkt2?=
 =?utf-8?B?T1dJc3ZJd3g3eDF6NmszT3R5ak5ubXdyQldOZkpnWUFyWWlpS3Q0TENCYWo5?=
 =?utf-8?B?MGx5d3kveGljS3k2OExyRnhZWWxpa3JIWDA2cXB5OGN1TzlSY2IzZnZjckFT?=
 =?utf-8?B?WW1rOXFSbEUzdXF6RGx0VXpkTWh1bGtINFpDL0I1bEZId2F6a2NMWVhkeXBw?=
 =?utf-8?B?eWh1VGY3ZlF3OFVJcE0zaThJcWdzU1ExTWVsQXcxcWVmUE1WcU5vK3NGYVU2?=
 =?utf-8?B?VVVITDZuemRRcXdIaTdjbFNScGRlb2YvSnNSdnBZUWtBYnA3eS80SFFxOFE2?=
 =?utf-8?B?YVZxZmRHb2RBMFEzWDNzdFBYWVBudDRoVVUrKzdoTUFlTXkxSkhHUnB3cCty?=
 =?utf-8?B?UnBrTDJKaUtwK3BKcmNESkFydndMeG9wbnhDWHoxdzAwSjZaZTk3MnhtNzBp?=
 =?utf-8?B?UmNDMHY0YVpWU0pna1FQb3d4WTdPWEFUdnYrUmdjMk9kM1RLa0EwbHp3RFFO?=
 =?utf-8?B?RmVLUHZSM0lFZEtSTG9yREVQY1pvdko3UWhMN2ppa2JIMTlpZzhMdjZCN2tC?=
 =?utf-8?B?QnNTTVZwQkJKcnVXN0tlQ2RkSW1kdzFpYUp6VzV5NngvWDROQmt4dWRwSVBh?=
 =?utf-8?B?bHRXMkMwQzVSdWl4RGV1b3hlQmRqNjY0MW0ybXlQNitQOUFubllGcmYxcmJJ?=
 =?utf-8?B?MXJkL3dILzVpblo1RExhM2h4MnhNSEsvSjQwY2tXbUVKWXhscGlBcWN2K0Zk?=
 =?utf-8?B?T0FpQy9MRVFFLzBIR1RYYXRub0FzTzdyWm5iQUF3Q0w2VFpneDBkY1V5dUdQ?=
 =?utf-8?B?M3c4ZlliQ1Fmc3dYVXBhWjl5ZC8zQmk2aUN0MDExejc1cFVMYS9XSUFxU09r?=
 =?utf-8?B?ZDI0ZGNGYkF6ZmNCQ0kyUGpQUkdFcDRTWmxpZXh6LzlkQ1JteFltank5Sncz?=
 =?utf-8?B?VENiSENkYjFUWmxHcGx6V0VMcmxQZGdpdVlhelcvZEJ0NkYwdTNJeHhGT0dj?=
 =?utf-8?B?bnlDUW43QWpwTUdEblhKT0djU2Y4VExIeXdydnBnY0tCWUZmU0NrdHloaFp2?=
 =?utf-8?B?SDJyWWZvcVpOdVUwR2Mya0djeFJiZ3B2Vk5qYU1URW1jS3NZcksyUnNkbUJj?=
 =?utf-8?B?R0x4V1pVcGZpem9BYXkyb1diWE1BQWFaWC9ZZGlYWjVreFVUWnZKK0dCakJK?=
 =?utf-8?B?SVpLVmI4R1ZCbGs0MmtsK3M2TzVyd0xNUmt4YkgrUG5rcDJFazEyUjl6S0Fk?=
 =?utf-8?B?YU1pbXVaWHVYeWprV2ovbTJXOWg5NEdMK2JvYmc1THNoT015TjkzVTk4N285?=
 =?utf-8?B?dmNEZENZbDZjVkZzYTFHU01taU5sTUpOR1hQc012VmJzMXNKMzZQNFBlcFJS?=
 =?utf-8?B?VWN6dW51N3hQVVBiQlJFUjI2SXRRWUt0aWRXeER1R0RwMzR0QnBjNHlQbkY4?=
 =?utf-8?B?Z1JrdGZSWUhLUTZYbDhBVHhJc1BvQ2EyekdHb2hSQlE5cmxYblpSdUZ6S043?=
 =?utf-8?B?SElGYzYreU4vT0psenpQQVE3Nkxtd1JESnlYY2dYYStqcFBXZy9lc3FOOVdJ?=
 =?utf-8?B?TzYwY3RqUGNHVjlmRS9hM3hIc2txdC9WakJrOFB2eTVPQ0VZQ0pYNXVtclJy?=
 =?utf-8?B?VEtOQmluT0VOQ2xqNmRDR0dJS0FGOFZWSVVGY0RtdHM4VHh0ZmJNUDI5SFkz?=
 =?utf-8?B?ZEJNQjA2emxwZ3ZxNkxqQzNRdEJpbHhmck44M3M4SXhjTHZGZTFYQThlZ25O?=
 =?utf-8?B?Y2RUSHdzbk1GQTZndk9jQytwTXVQNVAzTXA2MzBZNlZmMi9pRC9ZOFp4VGM5?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 181d59f1-5e84-4897-fa05-08db788860b7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 10:05:33.8127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hgyusfDKkfexxjIwdEwBoFRoWMp9b81OrT0edQkVIp4R1xmShgC5qEn0JdpcwPAnwpJ7zQ/SzTzWdEL9AE2RuMX1yJBCEsnZ+XtmEex74n4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7950
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

Hi Christian,

Thanks a lot for taking a look at my patches.

On 29.06.2023 09:50, Christian König wrote:
> Am 27.06.23 um 10:32 schrieb Karolina Stolarek:
>> Add the initial version of unit tests for ttm_device struct, together
>> with helper functions.
>>
>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
>> ---
>>   drivers/gpu/drm/Kconfig                       | 15 +++++
>>   drivers/gpu/drm/ttm/Makefile                  |  1 +
>>   drivers/gpu/drm/ttm/tests/.kunitconfig        |  4 ++
>>   drivers/gpu/drm/ttm/tests/Makefile            |  5 ++
>>   drivers/gpu/drm/ttm/tests/ttm_device_test.c   | 54 +++++++++++++++++
>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 59 +++++++++++++++++++
>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h | 29 +++++++++
>>   7 files changed, 167 insertions(+)
>>   create mode 100644 drivers/gpu/drm/ttm/tests/.kunitconfig
>>   create mode 100644 drivers/gpu/drm/ttm/tests/Makefile
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_device_test.c
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index afb3b2f5f425..53024e44a2d5 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -194,6 +194,21 @@ config DRM_TTM
>>         GPU memory types. Will be enabled automatically if a device 
>> driver
>>         uses it.
>> +config DRM_TTM_KUNIT_TEST
>> +        tristate "KUnit tests for TTM" if !KUNIT_ALL_TESTS
>> +        default n
>> +        depends on DRM && KUNIT
>> +        select DRM_TTM
>> +        select DRM_EXPORT_FOR_TESTS if m
>> +        select DRM_KUNIT_TEST_HELPERS
>> +        default KUNIT_ALL_TESTS
>> +        help
>> +          Enables unit tests for TTM, a GPU memory manager subsystem 
>> used
>> +          to manage memory buffers. This option is mostly useful for 
>> kernel
>> +          developers.
>> +
>> +          If in doubt, say "N".
>> +
>>   config DRM_BUDDY
>>       tristate
>>       depends on DRM
>> diff --git a/drivers/gpu/drm/ttm/Makefile b/drivers/gpu/drm/ttm/Makefile
>> index f906b22959cf..dad298127226 100644
>> --- a/drivers/gpu/drm/ttm/Makefile
>> +++ b/drivers/gpu/drm/ttm/Makefile
>> @@ -8,3 +8,4 @@ ttm-y := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o 
>> ttm_module.o \
>>   ttm-$(CONFIG_AGP) += ttm_agp_backend.o
>>   obj-$(CONFIG_DRM_TTM) += ttm.o
>> +obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += tests/
>> diff --git a/drivers/gpu/drm/ttm/tests/.kunitconfig 
>> b/drivers/gpu/drm/ttm/tests/.kunitconfig
>> new file mode 100644
>> index 000000000000..75fdce0cd98e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ttm/tests/.kunitconfig
>> @@ -0,0 +1,4 @@
>> +CONFIG_KUNIT=y
>> +CONFIG_DRM=y
>> +CONFIG_DRM_KUNIT_TEST_HELPERS=y
>> +CONFIG_DRM_TTM_KUNIT_TEST=y
>> diff --git a/drivers/gpu/drm/ttm/tests/Makefile 
>> b/drivers/gpu/drm/ttm/tests/Makefile
>> new file mode 100644
>> index 000000000000..7917805f37af
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ttm/tests/Makefile
>> @@ -0,0 +1,5 @@
>> +# SPDX-License-Identifier: GPL-2.0 AND MIT
>> +
>> +obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
>> +        ttm_device_test.o \
>> +        ttm_kunit_helpers.o
>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_device_test.c 
>> b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
>> new file mode 100644
>> index 000000000000..08d7314b1e35
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
>> @@ -0,0 +1,54 @@
>> +// SPDX-License-Identifier: GPL-2.0 AND MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +#include <drm/ttm/ttm_resource.h>
>> +#include <drm/ttm/ttm_device.h>
>> +#include <drm/ttm/ttm_placement.h>
>> +
>> +#include "ttm_kunit_helpers.h"
>> +
>> +static void ttm_device_init_basic(struct kunit *test)
>> +{
>> +    struct ttm_test_devices_priv *priv = test->priv;
>> +    struct ttm_device *ttm_dev;
>> +    struct ttm_resource_manager *ttm_sys_man;
>> +    int err;
>> +
>> +    ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>> +
>> +    err = ttm_kunit_helper_alloc_device(test, ttm_dev, false, false);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +
>> +    KUNIT_EXPECT_PTR_EQ(test, ttm_dev->funcs, &ttm_dev_funcs);
>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_dev->wq);
>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_dev->man_drv[TTM_PL_SYSTEM]);
>> +
>> +    ttm_sys_man = &ttm_dev->sysman;
>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_sys_man);
>> +    KUNIT_EXPECT_TRUE(test, ttm_sys_man->use_tt);
>> +    KUNIT_EXPECT_TRUE(test, ttm_sys_man->use_type);
>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_sys_man->func);
>> +
>> +    KUNIT_EXPECT_PTR_EQ(test, ttm_dev->dev_mapping,
>> +                priv->drm->anon_inode->i_mapping);
>> +
>> +    ttm_device_fini(ttm_dev);
>> +}
>> +
>> +static struct kunit_case ttm_device_test_cases[] = {
>> +    KUNIT_CASE(ttm_device_init_basic),
>> +    {}
>> +};
>> +
>> +static struct kunit_suite ttm_device_test_suite = {
>> +    .name = "ttm_device",
>> +    .init = ttm_test_devices_init,
>> +    .exit = ttm_test_devices_fini,
>> +    .test_cases = ttm_device_test_cases,
>> +};
>> +
>> +kunit_test_suites(&ttm_device_test_suite);
>> +
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c 
>> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>> new file mode 100644
>> index 000000000000..d03db0405484
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>> @@ -0,0 +1,59 @@
>> +// SPDX-License-Identifier: GPL-2.0 AND MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +#include "ttm_kunit_helpers.h"
>> +
>> +struct ttm_device_funcs ttm_dev_funcs = {
>> +};
>> +EXPORT_SYMBOL_GPL(ttm_dev_funcs);
>> +
>> +int ttm_kunit_helper_alloc_device(struct kunit *test,
> 
> Since this function is only initializing the ttm device I think we 
> should name it ttm_kunit_helper_init_device().
> 
> On the other hand I don't see a good reason why it can't also allocate 
> the device.

I believe that's a leftover from times when I thought I'll reuse DRM 
device between the tests. No problem, I can put them into one function.

All the best,
Karolina

> 
> Apart from that looks like a good start,
> Christian.
> 
>> +                  struct ttm_device *ttm,
>> +                  bool use_dma_alloc,
>> +                  bool use_dma32)
>> +{
>> +    struct ttm_test_devices_priv *priv = test->priv;
>> +    struct drm_device *drm = priv->drm;
>> +    int err;
>> +
>> +    err = ttm_device_init(ttm, &ttm_dev_funcs, drm->dev,
>> +                  drm->anon_inode->i_mapping,
>> +                  drm->vma_offset_manager,
>> +                  use_dma_alloc, use_dma32);
>> +
>> +    return err;
>> +}
>> +EXPORT_SYMBOL_GPL(ttm_kunit_helper_alloc_device);
>> +
>> +int ttm_test_devices_init(struct kunit *test)
>> +{
>> +    struct ttm_test_devices_priv *priv;
>> +
>> +    priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, priv);
>> +
>> +    test->priv = priv;
>> +
>> +    priv->dev = drm_kunit_helper_alloc_device(test);
>> +    KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->dev);
>> +
>> +    priv->drm = __drm_kunit_helper_alloc_drm_device(test, priv->dev,
>> +                            sizeof(*priv->drm), 0,
>> +                            DRIVER_GEM);
>> +    KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
>> +
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(ttm_test_devices_init);
>> +
>> +void ttm_test_devices_fini(struct kunit *test)
>> +{
>> +    struct ttm_test_devices_priv *priv = test->priv;
>> +
>> +    drm_kunit_helper_free_device(test, priv->dev);
>> +    drm_dev_put(priv->drm);
>> +}
>> +EXPORT_SYMBOL_GPL(ttm_test_devices_fini);
>> +
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h 
>> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>> new file mode 100644
>> index 000000000000..69fb03b9c4d2
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>> @@ -0,0 +1,29 @@
>> +/* SPDX-License-Identifier: GPL-2.0 AND MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +#ifndef TTM_KUNIT_HELPERS_H
>> +#define TTM_KUNIT_HELPERS_H
>> +
>> +#include <drm/drm_drv.h>
>> +#include <drm/ttm/ttm_device.h>
>> +
>> +#include <drm/drm_kunit_helpers.h>
>> +#include <kunit/test.h>
>> +
>> +extern struct ttm_device_funcs ttm_dev_funcs;
>> +
>> +struct ttm_test_devices_priv {
>> +    struct drm_device *drm;
>> +    struct device *dev;
>> +};
>> +
>> +int ttm_kunit_helper_alloc_device(struct kunit *test,
>> +                  struct ttm_device *ttm,
>> +                  bool use_dma_alloc,
>> +                  bool use_dma32);
>> +
>> +int ttm_test_devices_init(struct kunit *test);
>> +void ttm_test_devices_fini(struct kunit *test);
>> +
>> +#endif // TTM_KUNIT_HELPERS_H
> 
