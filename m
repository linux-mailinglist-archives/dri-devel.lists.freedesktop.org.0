Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D46A628BCD
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 23:10:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF8E10E10F;
	Mon, 14 Nov 2022 22:10:23 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727C410E10F;
 Mon, 14 Nov 2022 22:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668463820; x=1699999820;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Yk4mS76NH8cwMvm1iLn1NiJ5eTgSTSNtRulV9ZT1nyA=;
 b=AvpTphoK0qPyncro2NpvJmNp0yXigs2nCauS1Gi9qR3l0uyCj3TXcR/K
 r9aPDR6UsqiS2/Cp8j0FS5ombeXM4yC2g1fP5kXqvCM/+Agele9bDnLkh
 SN/ECw7DxVVDAJ1FjiPB36ikwXUIzUJokN8Zu50JHuxZV3+q/mY5fNuFR
 dTv1/EEhIFnKmUIMzkrUq+KwDBZcTVECY8F8/iJRkLBcBDMV6ms3QFKES
 9qWsxljNjn2ExLA3TxBX7RIFFQ7F0hebVUSWG6K0oHrnA8yhXX4zsaTCt
 OSxWRcyGq9KTQkCMqXAf7EY0jQF0xo0C940Z92ykBlWEfiMklMraG1nks w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="313241629"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="313241629"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 14:10:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="632978068"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="632978068"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 14 Nov 2022 14:10:19 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 14:10:19 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 14 Nov 2022 14:10:19 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 14 Nov 2022 14:10:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N34aJ39RieMEdhbEQG/R7KR7l6IYSa5PxQvp3itEmkqpanKVBIGiIb7LDhz6bt02eZemDkMvGqaw+yXJNkQgrQQEkCI+xVLmfeAeP4EMEz4Fpn5q69pw8TXzpMHYDJc/ptodvIPYcGybpIZ9q79bdux7U0tkaZJaiy8WVv6a2KeVv+fhTfCsCNJAIrursRjLd9VpFZClmPyHkUe5y1PWOEyz0J7j01ZtPmL8+thmWLMBf81wOHoJWKaUTFbBnsrqU4tepx3w9mnBBQimkJJkUQEd7cWvp/K/yQmzI6UTCAIYFWlZ0JqJnN8sE5DE/lOeieo6wXf/3MJK5X2vO9Gk3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xOv81ULMPA82694ZQI/C0jOlunj0MM2ut6ktOxPCS8=;
 b=kFKX/lmb5M7SwtejZlSfcWoi6J6afL0yKPOVvcEqBAY4LNykJD2CsCxhNFUyAmwMwXC4wt3gZAgSRkMyBeODs2kjfz7z6D5+ReVg6bYFK/s/wr3Btg1fpitT9xhCh/S8aApxg8jlR2awMDMy+DETiUMabGot+CjNd58lLD8qh3UlZXCEUGka0jaW9Oa7BOTzbT7deRqUFDXfcwzEW33VXcCQagOeOZk9fhZ0XrXUMEhTE/n3AY6BYJMjAIy9wtVJH0Ey5UmJO4qR2KL6trLI/H6SQwV3JNbkz12cVCNzDsty7ISiFDotG92VtxPFE4q+w3hjwgssriqLQGk+sNpH+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SA1PR11MB6781.namprd11.prod.outlook.com (2603:10b6:806:25d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 22:10:12 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a9e2:5c97:e3f0:1f12]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a9e2:5c97:e3f0:1f12%4]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 22:10:12 +0000
Message-ID: <f8dd390e-311d-bd84-7c90-ac640498d01c@intel.com>
Date: Mon, 14 Nov 2022 14:10:09 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.1
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/gt: Add GT oriented dmesg output
Content-Language: en-GB
To: Jani Nikula <jani.nikula@linux.intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20221104172525.569913-1-John.C.Harrison@Intel.com>
 <20221104172525.569913-2-John.C.Harrison@Intel.com>
 <6a4d1ac0-a1a0-e1d4-7d83-54b43d226371@intel.com>
 <fabaf9ee-f3fc-c18f-56b3-6d073618da41@linux.intel.com>
 <82055e8f-9bee-2b03-3dce-dcf66c30c903@linux.intel.com>
 <2583bccd-82fd-967a-aec9-e6d3837dbbed@intel.com>
 <1ad6bce7-9626-afa6-d73e-6d8f7a9c4d2a@linux.intel.com>
 <c9742b0f-546f-cccc-021a-7bad68410838@intel.com>
 <ad19d7ce-4102-4f8f-903d-7390b004b2e9@linux.intel.com>
 <67d18d17-8a01-32a1-1ff6-099c708ab290@intel.com>
 <02454937-4213-c558-590f-e1e7c83083e3@intel.com> <87wn835caz.fsf@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <87wn835caz.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0047.namprd08.prod.outlook.com
 (2603:10b6:a03:117::24) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SA1PR11MB6781:EE_
X-MS-Office365-Filtering-Correlation-Id: b152c5f8-4755-46fd-8fec-08dac68d000b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X7dRP6101G7QlGKjfeyAK3eIYutiTVCxzsj4A1zu5dBsL+BtzDuHfQV6k7C4ZStkq09bXYA8bKMJjVuJpB4BjStoxntS1MRwAgGB96fsOzBzcdfs75Nw3P3IWGTTp1S3sBtRwXfWvJ9V7fk7sy8anNi77RCdNh4w8z5uGZVa/4zcxKers5HY8ppoWH4ro/AUYCeYYhLdw4VRqPaCIcHoPCSB28tBJyagKrwN5V1cSPzBd8wHj+V8/iLWqyeipqu5n2+MTLHwLdwwH46d2BaGcC+A/y/MbHDng86QwkfTMb3RMdbnWVfekPGleIkSunTM7w2bxfv3G0fqqgP6SM8qXaMFTbFwcAgS/5ocwWNTJMgt+My42j7WrlcpSaVPp2FEkvgX/33VwGkpUPZPZQTM5wG4/Hg5ubUFFl51ijXW5X8ctoECvNm5u+wrYI/RyND2w6wD9uP0oSMSpLsTVvmEClkJrLiRPax6yXyaplK3/m5Q4N3CPULcn3AiArHaLddJnGZTa5sr4hMnUbYUsQMV7AhSuaEDrouIXMthmW0llhpvafTIEOnwC0SCFzI/onn51COijRBe71B4y+wkzxCysz4J0c/dFkFTTu6lNk1Xy1iwsVj5MMk9dWx8eC5+5M81zicR62SxvkQVkfEazCTacUoMtMSMijpFSHeEWQX/JvqQmupgqU7RBKlLyFHj0pAWttrLUCmF3MQGEAwkdI/NFaAeZmRttEdVrl78N5zPiPcCuJLaCtmTp3YjHnzo5HS+nEA+E/EOSTEfE2HCLG5tT/jePsrykDT/Iwy9MakOSh5zn+TN++qmBgoy5bl3E+QgQQ83K6zrTZvnFsFF10N2vg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(396003)(376002)(136003)(366004)(451199015)(6486002)(478600001)(38100700002)(5660300002)(8936002)(110136005)(316002)(86362001)(66946007)(83380400001)(6666004)(82960400001)(4326008)(66476007)(66556008)(31696002)(186003)(2616005)(6512007)(53546011)(41300700001)(6506007)(26005)(31686004)(8676002)(2906002)(36756003)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzNPVFM0cURCSTUwekdVcDRsZWNGR0p2aHR2T2pMUHp4dkcrYjNEWHZ6WkVz?=
 =?utf-8?B?MDF4VnhycVhwcDZTTmlRUG94dlRUY2Z4a0M0dXRhQUgyTDVxTGU4czFDTFRU?=
 =?utf-8?B?TFhCeC94aFJDRUlzWUVNTmcwTllmWGxXUlpyN2UwakQzd203VkdEMzVpVjI4?=
 =?utf-8?B?eWRtSWNnU29ONy9xY0dyQnJLQzJ2eVdqUUY3ZU9HVHRPQ0ZTOVZuSEpuSnJ0?=
 =?utf-8?B?dWVUT05ZbUFSckhZandaWW14NUxhQWlVSlh4VktHVTBRQzNHNHFkS2VHWENt?=
 =?utf-8?B?VmZQeDhrWnlxS3Ntem5zcHk3YkI0Qmx1dGN4dFhncmErbEVRdTl4UXNsZVIr?=
 =?utf-8?B?bEtPZngvOEpnbEtkUUpLajRuR0p2czhDZEtDUzNkaUR1ajZyNklmSFcvMjJD?=
 =?utf-8?B?L2t4U1MzSGVUR1VPWXRmWkRsQzN0TGdVV3dpcXNPUWRHQWRtN25hT1BBajJy?=
 =?utf-8?B?V3Fya3FaL0JUMU5oMDUxZEU3ckhMMW9yM3FQeXhUSGw3WXRQcGExa3VwcWdP?=
 =?utf-8?B?SmZPdHRzZkp0amZac1NndDhvRUdPbFZmQmJRemgwQlp4UnJ2dzBhaEpNcGJo?=
 =?utf-8?B?SDJsZm9kWkN0aXhqSjFIZU1vejBkSU8zV0wvUW4yZktTWWR1SzFHQ29mTVcy?=
 =?utf-8?B?and6WW9SdkUyMTFTcmhHOWk5TGlRSHpZdzd3N0c5Y0VGdnluMnQ0eEQwdCtk?=
 =?utf-8?B?RHBkY0psREIyNFFvZ1YvbGk5SU0va1NyZThqbFRZQ3JHWXJlSTF2VlRISGxu?=
 =?utf-8?B?NlJhZjBlWWw2L1poTlR0Vml6cFEzRC96cmRrYVdGS0poNUhqaXp5VjZlYXBL?=
 =?utf-8?B?M0FCK1IvUVpTcWZpcEZIbUZVWjBwWDBHZzdPemY4OWZrL3NTYThGclFTUnRK?=
 =?utf-8?B?cUowWExCTmtKRUZRWENkM2VnY2NEQ0REcEhET1M2QXF1M1ZuMEVWVWhDZWt3?=
 =?utf-8?B?SWhwYTg0RCtaeXcwZi9kNVNBc3F5WkdKWkNuVDdHS0hEeW91UVExMkpLOWRP?=
 =?utf-8?B?TlZwcVBrRWRlM1JyeUl2Uk9LZWgxMnZGNUNJN3lKQjNKbEFHOTVpOW5zYmhL?=
 =?utf-8?B?U0kvYzNyRU1ib0QzTWczYnZ5cTJRWkpGc004dGtzWWFhTGViVjlZVVJIcUpO?=
 =?utf-8?B?NlZrbjZjWXNGL3Q5MmVHeEo4TmZFK1BJUXR1UEMyYkYvS0k5RnVEV1d3eHht?=
 =?utf-8?B?ODQ0WGFqeEhTemFKc2wveTV3ckJ5K1kybzU5SUxsbDN6clYxS2pJTHVmbWdm?=
 =?utf-8?B?bElrSEhwYkZTclNhR2dRd2o5dWxSZWc5T2JROWY0ZjhzVGEzT2o0OWU4c3Fy?=
 =?utf-8?B?K012RVJWN2tIOElQSE1YR096Yzh2NFVOT2hpOTVUSUR5NDFSTGNCdHNZQWdH?=
 =?utf-8?B?RzBVdksvOTRXa0NnS0FGTVdlcWNoS1hjVWRlb1l5d0JqLzVWMVd3MG1yekpC?=
 =?utf-8?B?blNQNU04TFpwYXNtcGFueTQrY2g2TC9uTWtaRDRmay8rWGJZcUVqa05FQ2w5?=
 =?utf-8?B?ZEY2cDAyWm1kRjkyckpkaUNQa1R6OHBmNUxabGF0djBpdE41bEVQenhpRzAy?=
 =?utf-8?B?dDhtNE1sZkxKVkpaWlhUeWJLMXUwcUJZd3hGMExTbXNyU241TjJJdGMrNlpV?=
 =?utf-8?B?ZlAxamZyN0dSVlFvN0t3S2hXZzVjeWlhcDBBSHlrNENRMXc5c3cwZVlXUGsy?=
 =?utf-8?B?RGFZVjBCQXhqaklvQml4azl5bVVpYVVQQnFIaDdHQmFPRGpjRStLcVYrYVBn?=
 =?utf-8?B?cnV3WHlpbk9CUjErNnJpc01nelFhSEQvc1I5QkhmdStqbDBCVU51Y0JqRnhM?=
 =?utf-8?B?b0pHTElVdFNMK2xma2RMQitucTRCSTlzblMwWjNidURpa3kwS3Q3Vlk3WTFr?=
 =?utf-8?B?MzhncHFtRGcwaXVuTE1mWkFzMXlWd0dnS2xRRkUrRWd1ejVqcnVqRytYVFNp?=
 =?utf-8?B?dnRPdmRwQ3FtY2N4ODBNNHFaME9JN21La0VSZXJ0eVhRbjdQaVQwWDhMZ1BK?=
 =?utf-8?B?MU1kaWhzQmlDMytKN0JEWC9kLzhVS2QxMzNBdGIxUjVxVFhkZCtCVkx6V293?=
 =?utf-8?B?dlZSTU5xZytvdnNhVWN2aWV5UGtMNVgrNG44cnZLQmZYTkVReGpBN0p4Ukpq?=
 =?utf-8?B?bkl4SC9IcUNSRVJoaHRlNDE4OEtMcERSbXJZeFhUNnFHNEVPK01Wc0JPc21Z?=
 =?utf-8?B?UFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b152c5f8-4755-46fd-8fec-08dac68d000b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 22:10:12.1198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rHNmEBoldpTQfeF+Tg3ATqhM5AmNayHyazSzbgALjfPtBesEzyktwUNBDvorUpk8ITmyNlwDSxZIDwUZU4ZSu8q/6G/LupMPmv+1LP88z7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6781
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
Cc: DRI-Devel@Lists.FreeDesktop.Org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/10/2022 02:33, Jani Nikula wrote:
> On Wed, 09 Nov 2022, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
>> Instead of merging this patch now, oriented on GT only, I would rather
>> wait until we discuss and plan solution for the all sub-components.
>>
>> Once that's done (with agreement on naming and output) we can start
>> converting exiting messages.
>>
>> My proposal would be:
>>   - use wrappers per component
>>   - use lower case names
>>   - don't add colon
>>
>> #define i915_xxx(_i915, _fmt, ...) \
>> 	drm_xxx(&(_i915)->drm, _fmt, ##__VA_ARGS__)
>>
>> #define gt_xxx(_gt, _fmt, ...) \
>> 	i915_xxx((_gt)->i915, "GT%u " _fmt, (_gt)->info.id, ..
>>
>> #define guc_xxx(_guc, _fmt, ...) \
>> 	gt_xxx(guc_to_gt(_guc), "GuC " _fmt, ..
>>
>> #define ct_xxx(_ct, _fmt, ...) \
>> 	guc_xxx(ct_to_guc(_ct), "CTB " _fmt, ..
>>
>> where
>> 	xxx = { err, warn, notice, info, dbg }
>>
>> and then for calls like:
>>
>> 	i915_err(i915, "Foo failed (%pe)\n", ERR_PTR(err));
>> 	  gt_err(gt,   "Foo failed (%pe)\n", ERR_PTR(err));
>> 	 guc_err(guc,  "Foo failed (%pe)\n", ERR_PTR(err));
>> 	  ct_err(ct,   "Foo failed (%pe)\n", ERR_PTR(err));
>>
>> the output would look like:
>>
>> [ ] i915 0000:00:02.0: [drm] *ERROR* Foo failed (-EIO)
>> [ ] i915 0000:00:02.0: [drm] *ERROR* GT0 Foo failed (-EIO)
>> [ ] i915 0000:00:02.0: [drm] *ERROR* GT0 GuC Foo failed (-EIO)
>> [ ] i915 0000:00:02.0: [drm] *ERROR* GT0 GuC CTB Foo failed (-EIO)
>>
>> Would that work for all of you?
> I think we borderline have too many wrappers already. I've basically
> blocked the i915_* variants early on in favour of just using the drm_*
> calls directly - which, themselves, are also wrappers on dev_*.
>
> In general, there's aversion in the kernel to adding wrappers that hide
> what's actually going on. WYSIWYG.
That is blatantly not the case. There is a very strong push in kernel 
code reviews to abstract common code into helper functions. How is this 
any different? If you removed all helper functions with the desire to 
have truly WYSIWYG code then each line of code would be a paragraph long.

>
> So I wasn't thrilled to see the GT_* wrappers either.
>
> And indeed part of it is that anything you do sets an example for the
> next developer coming along. You add wrappers for this, and sure enough
> someone's going to cargo cult and add wrappers for some other
> component. We didn't even have to merge this to see that idea pop up.
>
> The thing with logging is that it's not just one wrapper. It's info,
> notice, warn, err, multiplied by the "once" variants, with some
> duplicated by the "ratelimited" variants. (And yeah, C sucks at this.)
>
> Arguably the display code could use logging wrappers for connectors,
> encoders and crtcs, too. Not just i915, but across drm. See:
>
> git grep "\[\(CONNECTOR\|ENCODER\|CRTC\)"
>
> But we've opted not to.
>
> This is just my educated guess, but what I think is more likely to
> happen is adding a "debug name" member to the relevant structs that you
> could use like:
>
> 	drm_dbg_kms(connector->dev, "%s foo\n", connector->dbg_id);
Huh? You want the wrapper to be called drm_dbg_gt instead of gt_dbg but 
otherwise it is identical to what is currently in the patch? Other than 
being a longer name, how is that any different? It is still very much a 
wrapper of exactly the type that you don't seem to like? And as noted 
already, in that case shouldn't we be pushing a patch to rename drm_dbg 
to dev_dbg_drm first? In which case the above should be dev_dbg_drm_kms?


>
> ---
>
> I'm not going to block this patchset, but I also really *really* don't
> want to see a cargo culted copy of this for other components. Which kind
> of makes me anxious.
I really don't understand the problem with adding such wrappers. Sure, 
there are a bunch of varients - dbg, err, warn, etc. But the variant 
list is contained and unlikely to grow at any point. It is trivially 
easy to look up gt_dbg to find out what it is doing. It makes the code 
much easier to read. I mean, who cares that gt_dbg is implemented via 
drm_dbg which is implemented via dev_dbg? Only someone that is actively 
wanting to further change the implementation. Anyone who is using it 
just wants to know that they are calling the correct debug printer for 
their module and are giving it the correct parameters. Having a nice 
simple name makes that totally clear.


>
> So what if you looked again what you could do to make using the drm_*
> logging variants easier?
Not a lot. All other proposals so far have been adding complicated and 
unwieldy constructs to every single print.

Fundamentally, the drm_dbg wrappers as they stand do not allow for 
further customisation. So your choice is to replace, rewrite or wrap. 
Replacing it with an entirely parallel implementation is fundamentally 
the wrong direction. Re-writing the DRM layer to take a pointer to a 
custom printer object instead of a 'struct drm_device' (where each 
sub-module defines it's own private printer that adds it's preferred 
string and chains on to the next printer) seems like a huge change to 
the entire DRM code base for very little benefit. The option of wrapping 
the just arguments makes for messy code. The option of wrapping the 
function call itself means wrapping five functions. Pick your poison.

John.


>
>
> BR,
> Jani.
>
>
>

