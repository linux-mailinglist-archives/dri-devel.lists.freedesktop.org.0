Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3432767B921
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 19:18:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804B110E123;
	Wed, 25 Jan 2023 18:18:17 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68EF610E11F;
 Wed, 25 Jan 2023 18:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674670695; x=1706206695;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Vw8/Lagqi7gWGo2ojdAgGnfuA5ye2H12nNzwoZ4oIns=;
 b=Q8QPZsn7/l25KGqdZcocYqUvaEk//HXsW+RQ5GkdSN3QHosu2wheCgnF
 NVeY6ArxAS7gnV6LTMv6GQlzwYMcpjawOB33uZNnFcUPSgZDIbJi8i+KZ
 kvOcsABCOxaQ/GXkPAuYFtXIEpwnMroYbNk5kn24EP7SoLrc7ruylm4A9
 +PIsTrZOYHUmnjPAS6IResmVCCQ6gOId5CqelY9gBu2GNq/XBnSmN3wej
 LFL2/JgwWhIV5Ufy/UsBIueRTECASdZRxUi2XU2xYPBGx8Ll0us0qz9fp
 g5koWliD8Bg6+ImQWAnEYG+FK8nhbBcXwhtumxoFARJc7k5lZSwUd71qC A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="326661277"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="326661277"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 10:18:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="991362342"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="991362342"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 25 Jan 2023 10:18:11 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 25 Jan 2023 10:18:11 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 25 Jan 2023 10:18:11 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 25 Jan 2023 10:18:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SWQVsXT+jcKdwoc7FKXkO2FPCfwDh2S7yBTgyEYqD3R9w71vMZCX7/oTpyipOB5KuO7vDehNz5/NhAt3qbfvAHxc5eTcb2Xd5323GaPtJcB2SF5NoeOyTAzH6Y6YJikdhIdm/07t5eQtfe2pYEtU6VyvQVKGRYKnN4hR8X5VAyPoDPBZeMfcFEluJHH2gdwVzbNYVuSUiqEolqBnqkahY3c42aKDHe/2/VjHCSAt1LLhRcTzqZQJ3+/ew3t1//4Fi+ZfBUwU1bU+8iyR7h/VRw5zFsA/Vlo9wAWjKqpM8qudKz5HmgN1hUfM6PptUC9f8YAY8w3WG+pKcA/+ISi3Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7Mp0CtW2HojbqjH/x2RMdDYyvrZvgxeZr+7A1iSdQg=;
 b=gpDD/BRQ+Z8NNZDsslY9Q3cqLipR2WNFxUfq9S/qNvSbOVdCpy7MYe/u35MAp5Xy60Z4U203BOIOjcVgr1jO2V5tJr0Y/tl45tGV0IdDs3BmAIUyfeKKvIqJtiuDMggtteqiYRautqFneVQ9RzsEN5nCspcCHfJByei4+L/H9bKh053gmkwqZIRQqn49K6GGCLsagWl3kiMd8yGRPABswTQcE2PxccLPW6aPrlRIC+o/SWhPLtyDvoD/ZsGj/uAPbk9UJIjHn9qKTj2HXH8MfBJC0tHpAcT19CgNaSfs2NqsLa83ywXd8qvECI6Pbt/qkCsvT+EBOx0GfKCxvBWYPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SN7PR11MB6799.namprd11.prod.outlook.com (2603:10b6:806:261::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 18:17:57 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb%2]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 18:17:56 +0000
Message-ID: <476eedef-959a-84df-2c96-64ef80ae6876@intel.com>
Date: Wed, 25 Jan 2023 10:17:53 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH v4 2/7] drm/i915: Fix up locking around
 dumping requests lists
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230120232831.28177-1-John.C.Harrison@Intel.com>
 <20230120232831.28177-3-John.C.Harrison@Intel.com>
 <f2aa8185-216a-2cb8-45be-7b7179de83ba@linux.intel.com>
 <a92d23df-d749-68ba-b707-69b5ddf5899e@intel.com>
 <7f7fa201-4350-07c2-8880-342456f66ddb@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <7f7fa201-4350-07c2-8880-342456f66ddb@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY5PR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:930:1e::26) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SN7PR11MB6799:EE_
X-MS-Office365-Filtering-Correlation-Id: d546bbf7-68ca-4631-e210-08daff007bb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pfVpW5d+SGKm0fKa2Nbdu1rxiB/6ULZxPpJEYBeK3a62nv5H5X53GuzjmvqTQUxWpDoTnTgy/N+RyKtyrVWY5K43AU3jEA4W8I+Jk3gtl8S7FWpfnfM58Lez3LihHhp9pMXaLgZ4vb4Kb/agmEBvEzB/69yCxPGLqrzbZK5ye2GYy8XCxxHmB37nQfMGaOyFE7xuGwuxuMIiWnzGRM/Vh9mt33q8sc939Ilbbd/aLJV2xkMPsEDuYtOXz3ijuc4eP+e95eL8g7tst5S0fVvWrPan1INtup+TJ/ij17pJQ8hTocEExFbo0YTHB7Dg8tNGDC+WSjFVSNLBPnrMuyzIcwkJLVs+ZQouJtwCxMEYosO7EJBuDqKrNXa5NgVhznad/oVPYLWbPoGicNG2bPGBFjb7tcoZewufNxRu1UrlZexMHcEZRo4eHOsuWEbiWhLgbKsZ/kfbMf+2zZcKQzo0/80UC2Kbm0PioDqfOfbG7RJGTRMioilKVIi53ic829DNOxlndAg3y9ubXkhcNV2BzFDSw3waaE/m0XGaLAnIPcmUxplwv2QoKwg+CVpY9oDX5t/ABbf68GTjKQ76l4OmveX+CaK979Zx1hBcMV+wjtinZxAdepirIFcJzvVOImq6Jg/ryfXK8p/wSrdmcWev9PdvIuDehb+u/GTO9RBcTy2pjyfgZA6TeLpvyVahlfFhM6UuFdqzgkZtox6NVJTrBX7Ec9f/VbxfsfAUMV1qc24=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(376002)(396003)(346002)(39860400002)(366004)(451199018)(82960400001)(4326008)(41300700001)(36756003)(86362001)(2906002)(6512007)(8676002)(186003)(6506007)(6486002)(26005)(31686004)(66556008)(66946007)(53546011)(6666004)(5660300002)(30864003)(66476007)(83380400001)(8936002)(2616005)(38100700002)(478600001)(31696002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0d3ZlpzTmcvVW40cHA0ejFtOXBINnc4SDNaeVRmbmQxZ3hKQU1rZ1ZOYnRF?=
 =?utf-8?B?dVU0aG9ZcVhMUkVvVTlDT2Y2b2huM0ZLbUFReHg3bVMvNDV5UFhkbGlUWENr?=
 =?utf-8?B?TGx1aTlqT0IvWlI3Sk0xbWtpVFZHRzhQQlpQS1dvc1I2MHNwcjBFdnRVMDVs?=
 =?utf-8?B?M3dLS0h5TFIxdnV4N1NhMDh2TDRVYUVHVGFxSy9sRkxtZEtobU1iVGtrOE1s?=
 =?utf-8?B?SlBCMFkxQVg0QjJGd2V2eTF6YW5MQTAvTHJXL2F0Y042VEVCTFFKa3k0U21r?=
 =?utf-8?B?Y0RndFJwOEtRRUlWNSs0eU5zYVdiZFJ1OTFBcytTdFMzaTA5ckpWY21uYjk3?=
 =?utf-8?B?cTgxd1VqakxCclpRVFdESXVRckRKbjRISnNMOE5GTGx1OEpuclI1OW5Cbldn?=
 =?utf-8?B?TXY4Y3EyZytPRllhSkZTdXMzbkRRL1hFUjhjajRqRWtTOUNyUnB1b2hmNHNp?=
 =?utf-8?B?NTJQV3lwUS9PM3NuS2FzWmltNHhMcFV6c1ZwRFJXRGlTUUZaY2xpWTV5V3Nu?=
 =?utf-8?B?N3pZNEptdjJ3L2k3N2dqbWlLaTZkZ0d1bzh1eC9ubDR4cmhOcTVKa2hLR01V?=
 =?utf-8?B?SVlLM2MxZ2N3VXZ0aU12Syt3dGJ5ZW44VG5yZG1MV0NYOEY2dUJLeEhROS9k?=
 =?utf-8?B?RzA4SUN1SHZnZUhmREJpZXcwdmIza21pTUh1eGRnU2cyNVFwV3FobGM1dVB4?=
 =?utf-8?B?RU1YMU1raE01T3RnaDRyYnRBUDA0MTMwQlduVUk1VUwrNmNGODM5R3NqbFMy?=
 =?utf-8?B?QXEyZ1NxMnJPM2ZMRHl6N3JrWWd0c3Z2R28yQWRjalBQV2QvRENtVllNdTUz?=
 =?utf-8?B?d2NJMTFJREkvdzdWNW9tdFR0OFJCRXFDRXFWSEowcnNiMFlYL1JZcGUyREtB?=
 =?utf-8?B?U1J5OHlLU3lzanZ6a3VjNEFUOHYwcUw0SUl4M0kxb1diVXJYZkdIYkFndE42?=
 =?utf-8?B?MVRjNWV5VlNaT1hFZmFMUmVSdlN3Zzg4NGhsMThPWCtCRUhXTUFQaUhGczRl?=
 =?utf-8?B?OG9OWHgvRHFtUVNsckRocDRLc1diNThrbnpCbHE1cWwyZVhveXZWK09JT3Bv?=
 =?utf-8?B?d24vTW8wMnFwZFh5S0J2V1NzNCs5VGtyc28yTXdYZmhDQm50MzEzTzZIR2hM?=
 =?utf-8?B?OXlpdmdtS1pNTUFIUkJGd2s4Ujh1blVZQUw2Wk1LdHRrRXFoMFM1QzFMZnEr?=
 =?utf-8?B?b0JPdWs5WFJvTVdScjNTaFRRRUZjQXVxOEthZVVESFUxL0ZKaHhXSGVFS2VY?=
 =?utf-8?B?K1lRTVRPRzlEcXQ5Mm5pVTdHUzJHWFkxZyt6YUJSMHJPTE84UHlNUHhrckNO?=
 =?utf-8?B?WVE3UnUxcWNHaExyR295TzN6UjNsZ1ZUYWhSbE16N0FLY0Vib1Nxb3FSNGJC?=
 =?utf-8?B?TmlrSEdhZ0haNlNnMkwyTzM1a1kvT0FmS2NGZFZZQXNOcXRSQXlKbUN1blFs?=
 =?utf-8?B?ZUpJNlRWUkdYbUQvbTQ1dGpIVnBBRy8yQUFtbzRHa3JPTlhGUW85RjZLbEov?=
 =?utf-8?B?MjVHSmZOZGRwTlNoSHFrMU0zYnVmenA4NXZoVUN6aXJ0YVRVcmhCTDJmQTRT?=
 =?utf-8?B?RUdSVHZRQXFRV2lMYUdubkd1VGpib0NiazFodVJwdGEzOFhzeWtWUThYZFpX?=
 =?utf-8?B?eEhEQnpuak9XcnpzSVdnVmdoQWtQN1FTejhmd2FuQlBTRGtNWlB3RkVOTHMy?=
 =?utf-8?B?bFF5WnVSdzNpc2thYUk3SU5LZElRdDRXQVZwQXZJNE9VVjl1aDBzcFlQZzdB?=
 =?utf-8?B?ZEJ5S0V2M3BBZXJ2UEZ1cVRwQ0FPejdpS2VCNmhic1RLdVBJejFkQW9iQklI?=
 =?utf-8?B?emRMaDZSUHJWanNvd3JDL0pGUkFuOElyNzVmcmRqaUhHU1JuWlByMkUyaDhR?=
 =?utf-8?B?RmhCR0F4a2JYWHFrVFBXckRYT0ljNFp5OTV1TUxBV0JBSHJIQTkxYmpzNEc0?=
 =?utf-8?B?S0prbXY0c01HK2VUYXJ0Sk96OFFKeXM0aEpyU3RZMld4VVAwRW5QbWF6WWtF?=
 =?utf-8?B?MDhNakxQczJicC9HY1Y2SUVwSjBWRVlhaDF6SEErbjdQbUtHY3ZnbGVGUTY1?=
 =?utf-8?B?N1haME9uU0pNOFFuQVlxaFhMdTRxdjl5OUhDUmF0NGsyVDY1WEpzczlGOWV1?=
 =?utf-8?B?OW5zOFQ5RE9wZVRsKzUvMkp5V01tNGEyRzZKVWhRdWNKYzNsYStBR1cxY3R5?=
 =?utf-8?B?b1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d546bbf7-68ca-4631-e210-08daff007bb1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 18:17:56.9340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dn/BG5XAaJQQfNcvvbtQERsJaRedQeEhCcIqK3NxhN9B6NZsMxo67QN8WgBjRXQ66Ls6yb95r8wA45Tp8GkY8ASS9VFFH9tHccKl2aBpSQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6799
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

On 1/25/2023 10:12, Tvrtko Ursulin wrote:
> On 25/01/2023 18:00, John Harrison wrote:
>> On 1/24/2023 06:40, Tvrtko Ursulin wrote:
>>> On 20/01/2023 23:28, John.C.Harrison@Intel.com wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> The debugfs dump of requests was confused about what state requires
>>>> the execlist lock versus the GuC lock. There was also a bunch of
>>>> duplicated messy code between it and the error capture code.
>>>>
>>>> So refactor the hung request search into a re-usable function. And
>>>> reduce the span of the execlist state lock to only the execlist
>>>> specific code paths. In order to do that, also move the report of hold
>>>> count (which is an execlist only concept) from the top level dump
>>>> function to the lower level execlist specific function. Also, move the
>>>> execlist specific code into the execlist source file.
>>>>
>>>> v2: Rename some functions and move to more appropriate files 
>>>> (Daniele).
>>>
>>> Continuing from yesterday where you pointed out 2/7 exists, after I 
>>> declared capitulation on 1/7.. I think this refactor makes sense and 
>>> definitely improves things a lot.
>>>
>>> On the high level I am only unsure if the patch split could be 
>>> improved. There seem to be three separate things, correct me if I 
>>> missed something:
>>>
>>> 1) Locking fix in intel_guc_find_hung_context
>> This is the change already it's own patch - #1/7. Can't really split 
>> that one up any further. Changing the internal GuC code requires 
>> changing the external common code to match.
>>
>>> 2) Ref counting change throughout
>>> 3) Locking refactor / helper consolidation
>> These two being the changes in this patch - #2/7, yes?
>>
>> The problem is that the reference counting fixes can only be done 
>> once the code has been refactored/reordered. And the refactor/reorder 
>> can only be done if the reference counting is fixed. I guess there 
>> would be some way to do the re-order first but it would require 
>> making even more of a mess of the spinlock activity to keep it all 
>> correct around that intermediate stage. So I don't think it would 
>> noticeably simplify the patch.
>>
>>>
>>> (Or 2 and 3 swapped around, not sure.)
>>>
>>> That IMO might be a bit easier to read because first patch wouldn't 
>>> have two logical changes in it. Maybe easier to backport too if it 
>>> comes to that?
>> I'm not seeing 'two logical changes' in the first patch. Patch #1 
>> fixes the reference counting of finding the hung request. That 
>> involves adding a reference count internally within the spinlock on 
>> the GuC side and moving the external reference count to within the 
>> spinlock on the execlist side and then doing a put in all cases. That 
>> really is a single change. It can't be split without either a) 
>> introducing a get/put mis-match bug or b) making the code really ugly 
>> as an intermediate (while still leaving one or other side broken).
>
> I was thinking this part is wholy standalone:
>
> @@ -4820,6 +4821,8 @@ void intel_guc_find_hung_context(struct 
> intel_engine_cs *engine)
>
>      xa_lock_irqsave(&guc->context_lookup, flags);
>      xa_for_each(&guc->context_lookup, index, ce) {
> +        bool found;
> +
>          if (!kref_get_unless_zero(&ce->ref))
>              continue;
>
> @@ -4836,10 +4839,18 @@ void intel_guc_find_hung_context(struct 
> intel_engine_cs *engine)
>                  goto next;
>          }
>
> +        found = false;
> +        spin_lock(&ce->guc_state.lock);
>          list_for_each_entry(rq, &ce->guc_state.requests, sched.link) {
>              if (i915_test_request_state(rq) != I915_REQUEST_ACTIVE)
>                  continue;
>
> +            found = true;
> +            break;
> +        }
> +        spin_unlock(&ce->guc_state.lock);
> +
> +        if (found) {
>              intel_engine_set_hung_context(engine, ce);
>
>              /* Can only cope with one hang at a time... */
> @@ -4847,6 +4858,7 @@ void intel_guc_find_hung_context(struct 
> intel_engine_cs *engine)
>              xa_lock(&guc->context_lookup);
>              goto done;
>          }
> +
>  next:
>          intel_context_put(ce);
>          xa_lock(&guc->context_lookup);
>
> Am I missing something?
Doh.

Yes, I guess that part is stand alone. I was getting myself confused and 
thinking that was part of moving a get inside the spinlock. But you are 
right, that part is just about using the correct spinlock for that loop.

So yeah, I can split that chunk out to a separate patch. But that is 
splitting patch #1 into #1a and #1b. It doesn't help with patch #2. 
Which is the one I though you were complaining about being too complex. 
Which it is :(. But I'm really not seeing anyway to simplify it given 
how much of a mess the code is in.

John.


>
> Regards,
>
> Tvrtko
>
>>
>> John.
>>
>>>
>>> On the low level it all looks fine to me - hopefully Daniele can do 
>>> a detailed pass.
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>> P.S. Only that intel_context_find_active_request_get hurts my eyes, 
>>> and inflates the diff. I wouldn't rename it but if you guys insist 
>>> okay.
>>>
>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/gt/intel_engine.h        |  4 +-
>>>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 74 
>>>> +++++++++----------
>>>>   .../drm/i915/gt/intel_execlists_submission.c  | 27 +++++++
>>>>   .../drm/i915/gt/intel_execlists_submission.h  |  4 +
>>>>   drivers/gpu/drm/i915/i915_gpu_error.c         | 26 +------
>>>>   5 files changed, 73 insertions(+), 62 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h 
>>>> b/drivers/gpu/drm/i915/gt/intel_engine.h
>>>> index 0e24af5efee9c..b58c30ac8ef02 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
>>>> @@ -250,8 +250,8 @@ void intel_engine_dump_active_requests(struct 
>>>> list_head *requests,
>>>>   ktime_t intel_engine_get_busy_time(struct intel_engine_cs *engine,
>>>>                      ktime_t *now);
>>>>   -struct i915_request *
>>>> -intel_engine_execlist_find_hung_request(struct intel_engine_cs 
>>>> *engine);
>>>> +void intel_engine_get_hung_entity(struct intel_engine_cs *engine,
>>>> +                  struct intel_context **ce, struct i915_request 
>>>> **rq);
>>>>     u32 intel_engine_context_size(struct intel_gt *gt, u8 class);
>>>>   struct intel_context *
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c 
>>>> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>> index fbc0a81617e89..1d77e27801bce 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>> @@ -2114,17 +2114,6 @@ static void print_request_ring(struct 
>>>> drm_printer *m, struct i915_request *rq)
>>>>       }
>>>>   }
>>>>   -static unsigned long list_count(struct list_head *list)
>>>> -{
>>>> -    struct list_head *pos;
>>>> -    unsigned long count = 0;
>>>> -
>>>> -    list_for_each(pos, list)
>>>> -        count++;
>>>> -
>>>> -    return count;
>>>> -}
>>>> -
>>>>   static unsigned long read_ul(void *p, size_t x)
>>>>   {
>>>>       return *(unsigned long *)(p + x);
>>>> @@ -2216,11 +2205,11 @@ void 
>>>> intel_engine_dump_active_requests(struct list_head *requests,
>>>>       }
>>>>   }
>>>>   -static void engine_dump_active_requests(struct intel_engine_cs 
>>>> *engine, struct drm_printer *m)
>>>> +static void engine_dump_active_requests(struct intel_engine_cs 
>>>> *engine,
>>>> +                    struct drm_printer *m)
>>>>   {
>>>> +    struct intel_context *hung_ce = NULL;
>>>>       struct i915_request *hung_rq = NULL;
>>>> -    struct intel_context *ce;
>>>> -    bool guc;
>>>>         /*
>>>>        * No need for an engine->irq_seqno_barrier() before the 
>>>> seqno reads.
>>>> @@ -2229,29 +2218,20 @@ static void 
>>>> engine_dump_active_requests(struct intel_engine_cs *engine, struct d
>>>>        * But the intention here is just to report an instantaneous 
>>>> snapshot
>>>>        * so that's fine.
>>>>        */
>>>> - lockdep_assert_held(&engine->sched_engine->lock);
>>>> +    intel_engine_get_hung_entity(engine, &hung_ce, &hung_rq);
>>>>         drm_printf(m, "\tRequests:\n");
>>>>   -    guc = intel_uc_uses_guc_submission(&engine->gt->uc);
>>>> -    if (guc) {
>>>> -        ce = intel_engine_get_hung_context(engine);
>>>> -        if (ce)
>>>> -            hung_rq = intel_context_find_active_request_get(ce);
>>>> -    } else {
>>>> -        hung_rq = intel_engine_execlist_find_hung_request(engine);
>>>> -        if (hung_rq)
>>>> -            hung_rq = i915_request_get_rcu(hung_rq);
>>>> -    }
>>>> -
>>>>       if (hung_rq)
>>>>           engine_dump_request(hung_rq, m, "\t\thung");
>>>> +    else if (hung_ce)
>>>> +        drm_printf(m, "\t\tGot hung ce but no hung rq!\n");
>>>>   -    if (guc)
>>>> +    if (intel_uc_uses_guc_submission(&engine->gt->uc))
>>>>           intel_guc_dump_active_requests(engine, hung_rq, m);
>>>>       else
>>>> - intel_engine_dump_active_requests(&engine->sched_engine->requests,
>>>> -                          hung_rq, m);
>>>> +        intel_execlist_dump_active_requests(engine, hung_rq, m);
>>>> +
>>>>       if (hung_rq)
>>>>           i915_request_put(hung_rq);
>>>>   }
>>>> @@ -2263,7 +2243,6 @@ void intel_engine_dump(struct intel_engine_cs 
>>>> *engine,
>>>>       struct i915_gpu_error * const error = &engine->i915->gpu_error;
>>>>       struct i915_request *rq;
>>>>       intel_wakeref_t wakeref;
>>>> -    unsigned long flags;
>>>>       ktime_t dummy;
>>>>         if (header) {
>>>> @@ -2300,13 +2279,8 @@ void intel_engine_dump(struct 
>>>> intel_engine_cs *engine,
>>>>              i915_reset_count(error));
>>>>       print_properties(engine, m);
>>>>   - spin_lock_irqsave(&engine->sched_engine->lock, flags);
>>>>       engine_dump_active_requests(engine, m);
>>>>   -    drm_printf(m, "\tOn hold?: %lu\n",
>>>> - list_count(&engine->sched_engine->hold));
>>>> - spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
>>>> -
>>>>       drm_printf(m, "\tMMIO base:  0x%08x\n", engine->mmio_base);
>>>>       wakeref = intel_runtime_pm_get_if_in_use(engine->uncore->rpm);
>>>>       if (wakeref) {
>>>> @@ -2352,8 +2326,7 @@ intel_engine_create_virtual(struct 
>>>> intel_engine_cs **siblings,
>>>>       return siblings[0]->cops->create_virtual(siblings, count, 
>>>> flags);
>>>>   }
>>>>   -struct i915_request *
>>>> -intel_engine_execlist_find_hung_request(struct intel_engine_cs 
>>>> *engine)
>>>> +static struct i915_request 
>>>> *engine_execlist_find_hung_request(struct intel_engine_cs *engine)
>>>>   {
>>>>       struct i915_request *request, *active = NULL;
>>>>   @@ -2405,6 +2378,33 @@ 
>>>> intel_engine_execlist_find_hung_request(struct intel_engine_cs 
>>>> *engine)
>>>>       return active;
>>>>   }
>>>>   +void intel_engine_get_hung_entity(struct intel_engine_cs *engine,
>>>> +                  struct intel_context **ce, struct i915_request 
>>>> **rq)
>>>> +{
>>>> +    unsigned long flags;
>>>> +
>>>> +    *ce = intel_engine_get_hung_context(engine);
>>>> +    if (*ce) {
>>>> +        intel_engine_clear_hung_context(engine);
>>>> +
>>>> +        *rq = intel_context_find_active_request_get(*ce);
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * Getting here with GuC enabled means it is a forced error 
>>>> capture
>>>> +     * with no actual hang. So, no need to attempt the execlist 
>>>> search.
>>>> +     */
>>>> +    if (intel_uc_uses_guc_submission(&engine->gt->uc))
>>>> +        return;
>>>> +
>>>> + spin_lock_irqsave(&engine->sched_engine->lock, flags);
>>>> +    *rq = engine_execlist_find_hung_request(engine);
>>>> +    if (*rq)
>>>> +        *rq = i915_request_get_rcu(*rq);
>>>> + spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
>>>> +}
>>>> +
>>>>   void xehp_enable_ccs_engines(struct intel_engine_cs *engine)
>>>>   {
>>>>       /*
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c 
>>>> b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>>> index 18ffe55282e59..05995c8577bef 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>>> @@ -4150,6 +4150,33 @@ void intel_execlists_show_requests(struct 
>>>> intel_engine_cs *engine,
>>>>       spin_unlock_irqrestore(&sched_engine->lock, flags);
>>>>   }
>>>>   +static unsigned long list_count(struct list_head *list)
>>>> +{
>>>> +    struct list_head *pos;
>>>> +    unsigned long count = 0;
>>>> +
>>>> +    list_for_each(pos, list)
>>>> +        count++;
>>>> +
>>>> +    return count;
>>>> +}
>>>> +
>>>> +void intel_execlist_dump_active_requests(struct intel_engine_cs 
>>>> *engine,
>>>> +                     struct i915_request *hung_rq,
>>>> +                     struct drm_printer *m)
>>>> +{
>>>> +    unsigned long flags;
>>>> +
>>>> + spin_lock_irqsave(&engine->sched_engine->lock, flags);
>>>> +
>>>> + 
>>>> intel_engine_dump_active_requests(&engine->sched_engine->requests, 
>>>> hung_rq, m);
>>>> +
>>>> +    drm_printf(m, "\tOn hold?: %lu\n",
>>>> + list_count(&engine->sched_engine->hold));
>>>> +
>>>> + spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
>>>> +}
>>>> +
>>>>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>>>>   #include "selftest_execlists.c"
>>>>   #endif
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h 
>>>> b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
>>>> index a1aa92c983a51..cb07488a03764 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
>>>> @@ -32,6 +32,10 @@ void intel_execlists_show_requests(struct 
>>>> intel_engine_cs *engine,
>>>>                               int indent),
>>>>                      unsigned int max);
>>>>   +void intel_execlist_dump_active_requests(struct intel_engine_cs 
>>>> *engine,
>>>> +                     struct i915_request *hung_rq,
>>>> +                     struct drm_printer *m);
>>>> +
>>>>   bool
>>>>   intel_engine_in_execlists_submission_mode(const struct 
>>>> intel_engine_cs *engine);
>>>>   diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c 
>>>> b/drivers/gpu/drm/i915/i915_gpu_error.c
>>>> index 5c73dfa2fb3f6..b20bd6365615b 100644
>>>> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>>>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>>>> @@ -1596,35 +1596,15 @@ capture_engine(struct intel_engine_cs *engine,
>>>>   {
>>>>       struct intel_engine_capture_vma *capture = NULL;
>>>>       struct intel_engine_coredump *ee;
>>>> -    struct intel_context *ce;
>>>> +    struct intel_context *ce = NULL;
>>>>       struct i915_request *rq = NULL;
>>>> -    unsigned long flags;
>>>>         ee = intel_engine_coredump_alloc(engine, ALLOW_FAIL, 
>>>> dump_flags);
>>>>       if (!ee)
>>>>           return NULL;
>>>>   -    ce = intel_engine_get_hung_context(engine);
>>>> -    if (ce) {
>>>> -        intel_engine_clear_hung_context(engine);
>>>> -        rq = intel_context_find_active_request_get(ce);
>>>> -        if (!rq || !i915_request_started(rq))
>>>> -            goto no_request_capture;
>>>> -    } else {
>>>> -        /*
>>>> -         * Getting here with GuC enabled means it is a forced 
>>>> error capture
>>>> -         * with no actual hang. So, no need to attempt the 
>>>> execlist search.
>>>> -         */
>>>> -        if (!intel_uc_uses_guc_submission(&engine->gt->uc)) {
>>>> - spin_lock_irqsave(&engine->sched_engine->lock, flags);
>>>> -            rq = intel_engine_execlist_find_hung_request(engine);
>>>> -            if (rq)
>>>> -                rq = i915_request_get_rcu(rq);
>>>> - spin_unlock_irqrestore(&engine->sched_engine->lock,
>>>> -                           flags);
>>>> -        }
>>>> -    }
>>>> -    if (!rq)
>>>> +    intel_engine_get_hung_entity(engine, &ce, &rq);
>>>> +    if (!rq || !i915_request_started(rq))
>>>>           goto no_request_capture;
>>>>         capture = intel_engine_coredump_add_request(ee, rq, 
>>>> ATOMIC_MAYFAIL);
>>

