Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1895BCB97
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 14:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC2B10E610;
	Mon, 19 Sep 2022 12:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64AC310E2B0;
 Mon, 19 Sep 2022 12:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663589630; x=1695125630;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Xt8XF1dMI5115YK4mUbOooRLftcwD+HZ4YeOdcS9XQ4=;
 b=jZB0TLYbmo4HqAYkMslfSQWtfD1MEhQ/eddP+DSLgYDbfq7lx+gjx9mN
 /tQnhs1hvtpJinPOMUWXH7DujpA3YzyGT6mR1rlEsyegRBfWUFPgPzytQ
 T8DrR/9lL3mPihe6UCpWn87C0mGfVjwChKihfp/PGLUGbvUIg5QEpb7mT
 T9tJ6fK21KR8OYfirwLXSGVhWX2NDqRHeWT/6e2IRKAtnPi3a16ir/hwU
 m9FpOzRHP2iVMbvODRgRLQTuVXxAqSgsmYeeGIu6Id52bDbSXrhsovYwj
 Qn8k9+lzbxKoB49+DLljnAGMU7KA04RK9l0b9cC9g34i3iJSaVJS5gxH5 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="296976614"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="296976614"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:13:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="596065760"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 19 Sep 2022 05:13:45 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 05:13:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 19 Sep 2022 05:13:45 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 19 Sep 2022 05:13:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CkQlTfyGO8Ix5WTK9MBKO0sXwLXFqE4ale1pXkYosFpgSYYT5UrDUMjL2BMAD6Rr89ydfRXWCiPYx1xN3BWBIEoWAG6tqmOXBde/9HNG2SvmCKH4x8aWuOSyVLGcEUbEwkHsmdEeQA+7POwPsvNr/8Cd7hpRM3z8eowDfLlBhCt+yH8/aE8xw7v0Gf6CYTJr2eQkwCWBHy7nZCdaehY9EGE44KnOLRRmJ8jjc6LYCojKPJ5ZAqe9sLdWxUg7CB/RSF+2FTj1cKtqYL3xk8TCfEm5INoe4mGvvJNN8lp7wR4czksV3u7O1mtObG+FV5J4YFhg5wHBmwplz5khUIAwRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5wi+gzQlvclf73UG7QEGex6leYhKhQ2YCWF+jSWIh+c=;
 b=T4+5yub96roTwKtHDP58ylIMug/g+wEv/1iJ2Rg5JKmkW+DFHOFqq3mQIky9x5G9fopKRJO/tKMVnp53HSqf5Fr9SS9xER3ffy+FxxxUsLPbRtwGm6cVNi+pzIPC6uGoxU5TMfr9JYkJqBoAxBgxvvopKswfBA3t2RUIHpLQDdKMi4r3S1FsquTPGvuEX+WhmAVVCWqnZV0Tgl+ymxYzimx785KLbnV9+Ikd/7pOsmDrjMd3G7l0FsqEwS9Yxj87is34sXwoYkSzgHRO/yN0iEJrH3nmzvOl6MIsPWF9TaX2S26KZSYCAf6kE1peqdXpochgaGtvXknMbinvGbDkqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CO1PR11MB5124.namprd11.prod.outlook.com (2603:10b6:303:92::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 12:13:43 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::b8f7:e789:58d6:f0ee]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::b8f7:e789:58d6:f0ee%8]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 12:13:43 +0000
Message-ID: <d965891e-2b6b-8cad-606e-cf1d8232e39f@intel.com>
Date: Mon, 19 Sep 2022 17:43:34 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 0/7] drm/i915: Add HWMON support
Content-Language: en-US
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20220916150054.807590-1-badal.nilawar@intel.com>
 <CY5PR11MB62110C704EA65EA5A764FCE7954D9@CY5PR11MB6211.namprd11.prod.outlook.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <CY5PR11MB62110C704EA65EA5A764FCE7954D9@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0036.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::11) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CO1PR11MB5124:EE_
X-MS-Office365-Filtering-Correlation-Id: b4e0e1ae-4c53-46cc-2222-08da9a386520
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RKlbiltNKDOTyoNL+9kNqgEZaAw5N3pNaflzpStFXqrKKzcJpJTrSzpbBv24vunhZ9FgK/TlKtfnIaFwG0jfGQk3e7wbwj/+h5QCbO2DHcVXAol8C6n2pP6uMnIjEiHsMLXqiBiri+auID1IHcM7c0/Qq4JNRQs5lt5/u4o/eJi7tnv5MzGR31mm/W+drLkHUCVFi50wjrtYue6O/5vmg6DOZ2ryyWfGXclTotYn/7BYZRXFMEvYnLq8oJ5ECNEYgXvXkkGGhyMeWHs8kHFt0Lb5rx7BMStdccPN90DRj3bUkeEkuu59e8apsRchDpDVhaxYfXf+dDfGNqBKFau7Ilmj08shq4l2eTKIrfmknOvdCdI6RPQT7yRQ99kYrXCl2CRCJLnh1ROPWaXnUidm1I+84P3pyG8EtKqN9d5WDN93PONbGbCwdkGapPlddDcM9nfstDd7ZhW1FiyVv5y+kw2es24zNbOWQxCXlhtaKY2aT+zIpIE3F7TUrvXdWCt/tXMqfw1XYbPB8XCgv+xIaXL5aWldslam4ILfbOC/z9pLTNW+rYX76664HSUWIXtBOtBkfVqltMncxPtHVV9LpJw2VUk5bXCDS36ptb+cBkghd1P1MdDv/U/uHFXnx5rk7MVkGErkutEeG96dFH6APBs3pHdVKYP+ICbQ4hFgQZoy5LvsfPQjd6SGKqqeSkqGAb7PuZ5C+Q0Bae5zjC7DAM/8uSTx/3V2t7dRoP3+IRH1q+fCMJd3/jGkha5HnzBbNMW3U+n69grsd/Fx65eUWSX+eB7R8jhauD5wxDam3yM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(136003)(396003)(39860400002)(376002)(451199015)(26005)(6512007)(41300700001)(6506007)(53546011)(36756003)(6666004)(186003)(8936002)(82960400001)(8676002)(4326008)(83380400001)(31696002)(54906003)(110136005)(316002)(86362001)(38100700002)(2616005)(66476007)(66556008)(66946007)(6486002)(478600001)(31686004)(2906002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVZYOGdCeTl2eUhVRUdwTTE5WGR0MUUyditrWnMyQ1dtYy9SdU84eUYxNk9u?=
 =?utf-8?B?aGJZK05FM1QxZVBuZ0lNTzEzdFBjeWpOaFNGYkpnQStVVElCRUlvWFBkd1Mw?=
 =?utf-8?B?bkJpcS9BY3FYK1pQaHhKQjNEWWloMlJIZzBDajBWQzNVNGJNbXJtOTlJSU9E?=
 =?utf-8?B?L1hIRWhBdFp4MXdUQW1iMnZWMXNSbTQzNkgyMGFRZTVXS3VwaDlFY21RcWV6?=
 =?utf-8?B?c05rVEFZSDhMWVo1WEVmdlhhbWo1UGUvUU1oM3dYY0VXN2Mwc0lVWmlSTUxH?=
 =?utf-8?B?NElUSmRwLzlXdVFjZ2hycjJWUytQbXJDMzdhSFFoaDBqMHVIdTgzRk91SEMz?=
 =?utf-8?B?OTcrRVByRzBhWmw4eUZRWk1Mbm5xRk54YjV3L3Y5ZVlYaW1yS1VJZEVKUUpT?=
 =?utf-8?B?cmtqZGsyWmlIUE01bkNBT3NUMEpsSm9ZNHBFWWJybzkxRFY3ejFPbTFkK1RJ?=
 =?utf-8?B?TjdzTXZkWE9OOFdtRk8zRVcwRjBLSnRoQzgvcGpIMUJ3Q1BVQXZZT0RFUytD?=
 =?utf-8?B?cWF0Y3dVQjRDQlE1SnFNc2pLTXE4MW1RQUhxTC9ydmRDcElNeHROQnhzN0xJ?=
 =?utf-8?B?ZFhnODBXRnVLQWttN3dhZUJqUkpQeWs4NHM4L3FIZ2R1aTc0UjFmbFlSa2wz?=
 =?utf-8?B?Q3ZNdWVwK0RhNHFKTzNKUzI0aHNKMkhObTNPUHBDOXptVkNTVllUS0FndEtV?=
 =?utf-8?B?TjFaQVFPRXZselljM09aaFczejlTK0kzS0VLK3pWbk5uaERCNEZiL0FzOWsw?=
 =?utf-8?B?alM5V0lNcUZ2OXNMS2NZZ3o5WHNSQ25ydEhLaGxhMFUyTEtnRlpFTHcweldR?=
 =?utf-8?B?dDhFVjAzQTB4VnBhWTlPRHJaWlJ6QUdQZ0pFdTJ3VUVnSzl4VEQreWRma1lK?=
 =?utf-8?B?MGRTUTJBN2ZYM3Z4RXUzaFJYYWxmZE1rSmdHb1hKcStHZ2oxTFBEN2FKd05T?=
 =?utf-8?B?UTlOc1k2cldWcGpRNU5JbThEZTFoTnhJN3lGaG9xUHBybUk1LytWTEVCa21x?=
 =?utf-8?B?cE9EbjNPc2Y5Z1Q4UFRVOEpYRTFUNXpzOG9XNTZ6akZIQnFLb2FEendLckln?=
 =?utf-8?B?cURtRkNuQzlWUDA5UzJXWWhYNDdidEoyTm5mMUlFNEJ2M0FOd2VSUUNhVHE5?=
 =?utf-8?B?bGlhRTZmaC9iTUgrVVNYaUw4V3dZbnI4ZGEwZGhzR3ZQZ1MzczZicXBqS3Rv?=
 =?utf-8?B?UU9OZVpkUzg4VjFlZm9TYmFGa0lPNTV0R05mZGdpcUUvdUVYWFJQQnZ5WXdv?=
 =?utf-8?B?b1B2TmZsZGU2T21sSWF1Y0NoUFZZeGlQOEZpQ3hMeTJWM2RmaDFKSEJpM2dm?=
 =?utf-8?B?MmtXZmlhZjlPZFoweDZnSVQ2eGE5Sk9WWnJnWmE4SUdJMWNiSDFwT1RxSC9J?=
 =?utf-8?B?d1Nlb3dISDhxUHJwM1pneE5rbnlVMWZQQ2psaklpdFVNVVdQMHNIUmVtVjBw?=
 =?utf-8?B?R3MrdHFYS0k3ZU93K0J6NzlpcVd4SjJiS3c3NWZ6NG9BcUpiYW5Kb2VNTVV0?=
 =?utf-8?B?Z3VhMFhYTHkrT3N1ZThmYjlyNWlzbEVmQ1JrV3RlUFIvY281aXY5WnJ3Z2to?=
 =?utf-8?B?bFk3RjQ3cDVqS21OM2VUZWNROWQ3N2l1Y3EzeXJnZ2pVMndHR3RoRGltWm9C?=
 =?utf-8?B?ZFArdmdBWVB5OUo3RWNzcmJIcnV0bHJSS1R1MU01VWorMnRPS3lsWDZaa3hM?=
 =?utf-8?B?OExxeFkxVGJLTXNHeWw1RElsc0dmWDJVcDhtK1ZDVU50UUdtQk9DNzFmYnhp?=
 =?utf-8?B?WkJVL0p6Y0JPRWxNclNoZkRzUW51RU9WVmZmNGNMcHg3OEpVeUR3eURzSWV1?=
 =?utf-8?B?Z3oyajI2bk90VWRYSm91MXNjN0g3VmdDT1FBaEQzdXBPeUFvSXczK1V4TGh6?=
 =?utf-8?B?NlpKdXN4R0g1QmFackRENjhJZ0ViMnZQeUF2eUtndmltbmc1ZkFMS2pFb3Er?=
 =?utf-8?B?THhSemJPMWRpWHJpeHVnR3pEVDltSFQ5SVF2WEJLTmgxVXJUZ1RLa2g4Zm4z?=
 =?utf-8?B?dkNtUk5zSUJGNFF2T01PTjloblZwUjFPOXJSVGxkM1hlNHpSRGZSaHo3ZU1C?=
 =?utf-8?B?TWlkWG5DS3lENnBuTm5IMitTMFlBcU9xYnhVUDREZjhyUGN3UlBLRWpoQUhj?=
 =?utf-8?B?RzMwRmJIaUk2KzhSaDdiUTJLZTdOZWVrYnMzR0k0em1XSStOcHZKYm5xTVlI?=
 =?utf-8?B?T3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e0e1ae-4c53-46cc-2222-08da9a386520
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 12:13:43.5547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fO8BlAoT6jHQasdukLXGEsdsW7Djx6FjWIgYtmnbnNv7V+bwE4LsDx6YWdZtd8qOiaiKiRROK6ZtgEIg4tSBNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5124
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
Cc: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Ewins,
 Jon" <jon.ewins@intel.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Tauro,
 Riana" <riana.tauro@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19-09-2022 15:45, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Nilawar, Badal <badal.nilawar@intel.com>
>> Sent: Friday, September 16, 2022 8:31 PM
>> To: intel-gfx@lists.freedesktop.org
>> Cc: Dixit, Ashutosh <ashutosh.dixit@intel.com>; Tauro, Riana
>> <riana.tauro@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>;
>> Ewins, Jon <jon.ewins@intel.com>; linux-hwmon@vger.kernel.org; dri-
>> devel@lists.freedesktop.org
>> Subject: [PATCH 0/7] drm/i915: Add HWMON support
>>
>> This series adds the HWMON support for DGFX
>>
>> Test-with: 20220914140721.3500129-1-riana.tauro@intel.com
> CI-BAT is failing with this series,
> Could you please check the failures, whether related to this series ?
Thanks for pointing out. I checked the failures, those are not related 
to this series. I responded to "✗ Fi.CI.BAT: failure" thread

Regards,
Badal Nilawar
> 
> Thanks,
> Anshuman Gupta.
>>
>> v2:
>>    - Reorganized series. Created first patch as infrastructure patch
>>      followed by feature patches. (Ashutosh)
>>    - Fixed review comments (Jani)
>>    - Fixed review comments (Ashutosh)
>>
>> v3:
>>    - Fixed review comments from Guenter
>>    - Exposed energy inferface as standard hwmon interface (Ashutosh)
>>    - For power interface added entries for critical power and maintained
>>      standard interface for all the entries except
>>      power1_max_interval
>>    - Extended support for XEHPSDV (Ashutosh)
>>
>> v4:
>>    - Fixed review comment from Guenter
>>    - Cleaned up unused code
>>
>> v5:
>>    - Fixed review comments (Jani)
>>
>> v6:
>>    - Fixed review comments (Ashutosh)
>>    - Updated date and kernel version in documentation
>>
>> Ashutosh Dixit (2):
>>    drm/i915/hwmon: Expose card reactive critical power
>>    drm/i915/hwmon: Expose power1_max_interval
>>
>> Dale B Stimson (4):
>>    drm/i915/hwmon: Add HWMON infrastructure
>>    drm/i915/hwmon: Power PL1 limit and TDP setting
>>    drm/i915/hwmon: Show device level energy usage
>>    drm/i915/hwmon: Extend power/energy for XEHPSDV
>>
>> Riana Tauro (1):
>>    drm/i915/hwmon: Add HWMON current voltage support
>>
>>   .../ABI/testing/sysfs-driver-intel-i915-hwmon |  75 ++
>>   drivers/gpu/drm/i915/Makefile                 |   3 +
>>   drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   8 +
>>   drivers/gpu/drm/i915/i915_driver.c            |   5 +
>>   drivers/gpu/drm/i915/i915_drv.h               |   2 +
>>   drivers/gpu/drm/i915/i915_hwmon.c             | 761 ++++++++++++++++++
>>   drivers/gpu/drm/i915/i915_hwmon.h             |  21 +
>>   drivers/gpu/drm/i915/i915_reg.h               |  14 +
>>   drivers/gpu/drm/i915/intel_mchbar_regs.h      |  12 +
>>   9 files changed, 901 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
>>   create mode 100644 drivers/gpu/drm/i915/i915_hwmon.c  create mode
>> 100644 drivers/gpu/drm/i915/i915_hwmon.h
>>
>> --
>> 2.25.1
> 
