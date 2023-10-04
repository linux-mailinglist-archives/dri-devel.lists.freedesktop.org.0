Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4974E7B8E92
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 23:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22EDA10E143;
	Wed,  4 Oct 2023 21:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F36B10E143;
 Wed,  4 Oct 2023 21:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696454127; x=1727990127;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2YVIRbrs0UHXMCnl4FmHR2zPcH00a6+QjO/KzlJIs0c=;
 b=VLcEqPXijAaFeghbo64uOSwquIFajTbvsGdxIhbW00Y5b/hWwLcikT3h
 h983FHYM5rFEf7T/iRsVo0I2IVkku5vYpJog1TtiVKogwf7eJNS7gMsqS
 Ygi5fUW4T75gbJr58Nv1zBbjnmpTaJIWoz637uhElDDAkYnkUbGAzJTcn
 gnKEK0SuVT6AqNX201dWI13Ye8il2mO50yMoy56CKtshqbJbyyIbBwiAy
 Ce+U12t4tPA+zLnINvn7qzIN9dpUBd0Zk5zPAS+JwBbF+0gvxSBPN/nCQ
 kQJSxIKPErTrTo4QCjJk89qDc5c6WZhlDieSrJE9MiVXfgH7m2buxJcte g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="449795033"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="449795033"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 14:15:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="817283077"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="817283077"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 14:15:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 14:15:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 14:15:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 14:15:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 14:15:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cBNtA45jBI4n/0FjCRdKHMHWa/mf/RSqKV12Xqclj11cQ9ZlD7Bl+M9p8xNm6pvoA2a6uzv2ZCy/aK9ihLWMr3utE09zNeyq+XPtCCVj+ZCJzojdE1qUI8G6DRKaqCFRNRNHVBTEmcywUjyQbikqmtMB7CILEx+5CteT+r5Gs6SSR+3ZP3ZO7/75E5TCkk3ctWbc919Y9WUeV+vTdPqWRUwzNOjkMCmzJJ3H71/Ph22/Ngki7KglVW0ihNx1mpo9xkDwsQ+Rezr33lGA1C2P2HtsTmxO5JDMk20Z1h6QTWxua5lUCj209X4ztG56Gkyqz5CXiWaAECRMMIs5/eFcXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQZhFLrufB6v6RU9Q/NXg3FQiU1uGglFvmDFTBnY6NE=;
 b=ILabWTqiSfrSUnLmG1SEOoCevYGR66byt2XN/qarVd1oBOLxi3psOu99IFJnarIssBSGsPteN07HZV1ehkseTm/WQHDsaH9Ugu0AeSsyWHA1o+VqWz2Y5zT2trWynNlvLHxfbICdbTxG5f3pE8PkmNazCHfkQXhR6HAR6k+RNFd0wMgy4yxFw6qKElDQZmWM84hebdQmls1zVR73Od7NfUV56D93L2aJMM3Bvjly04m85f551LIqjjy+mpz0G02v1kQJxnwkPcm4KkQDhp8HY/NQ6o/k0qd40ybTzOLKelbQF/5SSivKXM5MqR4/JhsNTKRLZr+62El9K6o23djQtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB3908.namprd11.prod.outlook.com (2603:10b6:405:7d::13)
 by LV3PR11MB8554.namprd11.prod.outlook.com (2603:10b6:408:1bb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Wed, 4 Oct
 2023 21:15:22 +0000
Received: from BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::92a:bbbf:656b:dcb5]) by BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::92a:bbbf:656b:dcb5%5]) with mapi id 15.20.6838.030; Wed, 4 Oct 2023
 21:15:22 +0000
Message-ID: <2aad4b04-b0b1-a5ee-297b-2a6ba5622c4b@intel.com>
Date: Wed, 4 Oct 2023 14:15:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [RFC PATCH] drm/i915/gt: Do not treat MCR locking
 timeouts as errors
Content-Language: en-GB
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20231004094357.634895-1-andi.shyti@linux.intel.com>
 <eefc8c62-1ac5-6604-2ee5-576ca87c2be5@linux.intel.com>
 <ZR1x0jlEzrCUNoip@ashyti-mobl2.lan>
 <4feb3f2e-ecbd-1fca-9568-409830f50ee5@intel.com>
 <ZR2+fyV6fW9PyILs@ashyti-mobl2.lan>
 <e8747e83-a78b-058b-e76b-06bb63e85c7d@intel.com>
 <ZR3GgUGu6GeZlk1b@ashyti-mobl2.lan>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZR3GgUGu6GeZlk1b@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0311.namprd04.prod.outlook.com
 (2603:10b6:303:82::16) To BN6PR11MB3908.namprd11.prod.outlook.com
 (2603:10b6:405:7d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR11MB3908:EE_|LV3PR11MB8554:EE_
X-MS-Office365-Filtering-Correlation-Id: f2733895-b01c-422b-e6f6-08dbc51f0543
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5sakGQJQzCW2kcu8S9bYEHNwMNkidH9mezUJcHBB0QPsmIQjSp58MRopg2jOPe/Pa28K2C+HDfjfrD0/0aBrI0szZ4mur6a0tzk7CxpnA+Z3ESI2BsbtSmMg1wrEe6bPlqiccVv3wXBgtrgZMXNXdh+YHG0t2dirG4aRLUBgxPqYnfmAvF3/5Y9VyyMbRBBMHRZnlrgpmvjcN6GBeRg5LRVC8b73Hk3bAnK+EPIr0l0rW3dNdRGJc+q1i6GKhWh+UV4GC17MD8tr/I9xd/Oaam3fxAvVCSB0noJ/JwRSkbLf8LelUs7cr4wlgGStXAXF5jeAyOJUpeHe/HwAzt0zVPNC69dzQV0XqNsEK2z4ZGS+nnzaGqS3Qq61R/NDj2mIz8PvwBdKVkaRcnY3T8/Q3kh7IY365crTcrbvNsc6uLvReOrXCkc8E7+hoWGAsvqmWQkkDf/pccS2SS2jUk4igt3qqzPpponMpPUFqpAB+6bKgdY5bsTfaRp1M+2YbD3EJz1yXZnK2+0/7/dRsRu4ASaMAHLduItc3VLpbVWfvlz1bDCBmfzcBS+xJ/kqWohuJaTlBWOfsqI1uKkHREodxEneSgTUPigqbxvzXthdMs0m276koNhiqinFt1b6onU7PZXMpMKexdHu4Jv/20RQeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB3908.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(39860400002)(136003)(366004)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(6506007)(478600001)(53546011)(6512007)(6486002)(6666004)(26005)(83380400001)(2616005)(2906002)(8936002)(6916009)(54906003)(316002)(66556008)(8676002)(66946007)(66476007)(41300700001)(5660300002)(36756003)(4326008)(82960400001)(31696002)(86362001)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHM4NmJHanJmOEpBbkpienhzU1YwMzk2WHB0eEtUTzgxVFAzeHhOUXhneGRF?=
 =?utf-8?B?blQ1NXhUbGlYdlMzL3hMS0gzTHVuNE1tRkxNejJBc0FzazB3aW5FdFFJeTdV?=
 =?utf-8?B?YnVNc1RmNGVYekFyMDJRWElucnoxczh4Q3dzeG9QMEpOYUE3UVc2YVlPTEpk?=
 =?utf-8?B?TXFLN1I2dFhwUCtKbTZwL0RFYkpMQ0hwNUMwdlc4VFJJMGoyODdZSWU4cFRE?=
 =?utf-8?B?QXFlQ1FGbEFybGRSd0VoWW55aGxiUm9xZEE4WXBhMEk2cVNYeng4TVZtZmF2?=
 =?utf-8?B?RDhlV2tCa1VZdFJXUFVEWnBuZXh2OGJLVDduTXl3V2ZuYXZzUmh3eTlrdHNY?=
 =?utf-8?B?NkhZbWpsaUZkRjdvTDVvS2JSZStVYjdPN2Rxek9rbDVBbHdsZ3JkZHEzMzRM?=
 =?utf-8?B?V3R3UmlJRkJHQnpBNk5RMyt3cFRld1psQkdxUUsxWDJsaHRINnFtcmlYeE8x?=
 =?utf-8?B?TXVNc3BSR2ZSVWpjUVQzb3lBeTdkYWJGdVlJOG9LS2ZDY3BuVnNHUWR2QjRO?=
 =?utf-8?B?RXBYRkpoUHM5eFlTKzlGM1owdnpWOWg3WFAxNkh5MDFibHVtZy9PWGFVVU91?=
 =?utf-8?B?SS9Renk1bzVnYTluQmdpR01DRW9XQW5RTUVDTHp4QnduVDhlOVRNbGoxNnlR?=
 =?utf-8?B?MEU2dXZlWmEwdWl3SHRCaHBmbEsvbUtTalAxZWxVL0wwdHd1amRUVmlrT25I?=
 =?utf-8?B?TERwS0sxL3N5T3lJM1ZxUFVvMHhTWmFJU0l5MlpaZnZuM2J6VWV6eUdVUy92?=
 =?utf-8?B?ZDRIdFhFOHJFR0JvVmtORUxLRnJzVFNJaGc0NFVtZ081UDFlZ2lSS2xYUWlQ?=
 =?utf-8?B?WHpud3VoZGxEUjh5ejVIVnhrUDFScGZNdXhYZC9oSGhnbTFMRmdmUVFSUUgz?=
 =?utf-8?B?UGN4UmxLN3FvTG1sejVHUmdIV1pPdU9ZTzJNMGo1ZXhKNCtTSFdzR091WUk0?=
 =?utf-8?B?ZDBSVE5DbzJkRFhzS1lWRWZMNFYxT01SNlV5aThYK2NTemdhWkY2c1AwSHBZ?=
 =?utf-8?B?STJYNnV0ZDVaWEt1bGYrb21PNVdtTWRNaTc1eG84OU9qV1AzSWFPU1RtYjJv?=
 =?utf-8?B?Y0FVandQY2JjNVdpUjlPREFoY3pKdkc4QldmM0MxdUZhT0t2NGJsSGRFNy9V?=
 =?utf-8?B?THFGSHZUSFEwa2xJZy95ZTRhV0s4SE96bVdiaGJVZ3lQbXU2eWpXRVBobUxO?=
 =?utf-8?B?TjIzLzBSd2NDOXIzcXRhWC81VllQL0ZlVEpzR0tYdkppQlFXdlJDWG5HalQ2?=
 =?utf-8?B?WG93VmUrQkwzU05FQXJ1S1dhMndPaFB5bStkanVpQ1VxbTBjK0crVXAyZklB?=
 =?utf-8?B?eklzREVveE9ESFNuNEtDZjZTQVpOQy9wZHAzWStCeW11TkdzTTNZYk0xWGlw?=
 =?utf-8?B?MXFuTHdaT05xeHBjZkJjVnhFdTRhZXBQUDBuOWt1Z1E3aWlDQ3B5NWlmN2lS?=
 =?utf-8?B?YjV0OEJyd2lTTjNLbENCWW1lLzU2VkFoZmZnNUpFRnc4WEhTL2FkVU5jTXBW?=
 =?utf-8?B?RE5WRkJhNWlWK2pSTm1jZlEwampoZGlNeFBJSU9FanFIQTlVd3hwUW81L1JT?=
 =?utf-8?B?WlVDTEhsSGdxUW9pWWFHdXFCbUFtQloyYVIzN01XcldTQVo1Zllzem5WVUVQ?=
 =?utf-8?B?WnVVbHluRzlzUmJRbTF3VHFtR0tRUWxtRFFQSm9HU3lQR2hTOEwvenJySzVV?=
 =?utf-8?B?UzZvUGordWk2NjdnZ0V3WU1aZ09BNmpVc1E2SEMwZlErNldibTFQQ1IxNlpQ?=
 =?utf-8?B?RU9vRlRZSWM3WVdUQmxqYjhVb1V3bWkxTFd3VWFSa3ZJM3pROTdqa2FsNDMz?=
 =?utf-8?B?VjBtKzdGYVg4ZERXL1FJMTkyYXZKMkpqMW1McW9CQnpTODRtTURYKzdvQUh1?=
 =?utf-8?B?LzhwTE1wMGVnMGIwZkdoQ1lKNUlOdjJzTGtOM0JoRWFTTzZnVTdDRlQ3cWNK?=
 =?utf-8?B?YlhHTkdySmVDR3RyWTUwcjlnYk8yakxJdVgvNjE2a1V3TUxkUmVKN0ZadGtx?=
 =?utf-8?B?QnZXczdwQU52TnJDalRRRHFyTWF5ZnFUNm5ESmNGWmNBTW53SGNycC90M1ps?=
 =?utf-8?B?UU1XeitXN2pjcDBhd1JDT2Z3TEJyaWdIUmxEaVhnNHZqY292eDFxTUMwR09a?=
 =?utf-8?B?QTdwcmQrU2Z1MlI3WVIvc09pNDhkZVBTUVVqVkRiREVRKzZqVUt6c1M2S3ho?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2733895-b01c-422b-e6f6-08dbc51f0543
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB3908.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 21:15:22.7837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: anfM6VKveUwV23w0W3nwKyxJSI7Xfpc38RMedTv18m33oCUAWYbTU7bpRUV5aD712Ra6X8ldgoILRSod/LmRKk6t6+0YL5Exs9SvDFTX3xc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8554
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, gregory.f.germano@intel.com,
 Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/4/2023 13:09, Andi Shyti wrote:
> Hi John,
>
>>>>>>> The MCR steering semaphore is a shared lock entry between i915
>>>>>>> and various firmware components.
>>>>>>>
>>>>>>> Getting the lock might sinchronize on some shared resources.
>>>>>>> Sometimes though, it might happen that the firmware forgets to
>>>>>>> unlock causing unnecessary noise in the driver which keeps doing
>>>>>>> what was supposed to do, ignoring the problem.
>>>>>>>
>>>>>>> Do not consider this failure as an error, but just print a debug
>>>>>>> message stating that the MCR locking has been skipped.
>>>>>>>
>>>>>>> On the driver side we still have spinlocks that make sure that
>>>>>>> the access to the resources is serialized.
>>>>>>>
>>>>>>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>>>>>> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>>>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>>>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 6 ++----
>>>>>>>      1 file changed, 2 insertions(+), 4 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>>>>>>> index 326c2ed1d99b..51eb693df39b 100644
>>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>>>>>>> @@ -395,10 +395,8 @@ void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags)
>>>>>>>      	 * would indicate some hardware/firmware is misbehaving and not
>>>>>>>      	 * releasing it properly.
>>>>>>>      	 */
>>>>>>> -	if (err == -ETIMEDOUT) {
>>>>>>> -		gt_err_ratelimited(gt, "hardware MCR steering semaphore timed out");
>>>>>>> -		add_taint_for_CI(gt->i915, TAINT_WARN);  /* CI is now unreliable */
>>>>>>> -	}
>>>>>>> +	if (err == -ETIMEDOUT)
>>>>>>> +		gt_dbg(gt, "hardware MCR steering semaphore timed out");
>>>>>>>      }
>>>>>>>      /**
>>>>>> Are we sure this does not warrant a level higher than dbg, such as
>>>>>> notice/warn?
>>>>> We might make it a warn, but this doesn't change much the economy
>>>>> of the driver as we will keep doing what we were supposed to do.
>>>>>
>>>>>> Because how can we be sure the two entities will not stomp on
>>>>>> each other toes if we failed to obtain lock?
>>>>> So far, in all the research I've done, no one looks like using
>>>>> MCR lock, but yet someone is stuck in it.
>>>> If someone has the lock then that someone thinks they are using it. Just
>>>> because you can't see what someone piece of IFWI is doing doesn't mean it
>>>> isn't doing it. And if it is a genuinely missing unlock then it needs to be
>>>> tracked down and fixed with an IFWI update otherwise the system is going to
>>>> be unstable from that point on.
>>> But I'm not changing here the behavior of the driver. The driver
>>> will keep doing what was doing before.
>> And what it is doing is dangerous and can lead to unpredictable results
>> because a critical section resource access is no longer wrapped with a
>> critical section lock. Hence there is an error message to say Here Be
>> Dragons.
> hehe!
>
> What are you suggesting, then? Should we reset the GT after
> hitting the MCR lock issue?
No. I'm suggesting that you don't hide the issue by removing the error 
message. It is there for a reason. Just because that reason is being hit 
doesn't mean you should remove the message.

>
> We could, but I rather prefer to work with what's available.
>
>>> Because this most probably won't be noticed by the user, then I
>>> don't see why it should shout out loud that the system is
>>> unusable when most probably it is.
>> Just because a race condition is hard to hit doesn't mean it won't be hit.
> We are hitting it, constantly, but it's not producing any effect.
> Even when raising the MCR wait timeout. Which means that most
> probably someone is having a nap on the lock.
No. You are hitting the lock contention problem constantly and so far 
are not seeing any *visible* effect.

The point is that there is still a potential race condition which you 
haven't hit yet which could lead to data corruption, page faults, 
crashes, etc. (because a TLB invalidation access went to the wrong 
target) or the CPU/GPU melting itself of the board (because a power 
management access went to the wrong target).

>
>> The point of shouting out loud is that we know for a fact a problem has
>> occurred. That problem might lead to nothing or it might lead to subtle data
>> corruption, gross crashes or anything in between.
> yes, agree... the message still stays, though, with a bit of a
> lower catastrophy.
>
>>> BTW, at my understanding this is not an IFWI problem. We checked
>>> with different version of IFWI and the issue is the same.
>> Which implies it is a driver bug after all? In which case you absolutely
>> should not be papering over it in the driver.
> This section is serialized by a spinlock and besides I haven't
> found any place else except for the TLB invalidation and the
> resume where we can incur a locking situation.
There is a bug somewhere. Either it is IFWI or it is KMD. You can't say 
"I can't find a problem therefore there is no problem".

John.


>
> Thanks a lot for your inputs and discussion!
> Andi

