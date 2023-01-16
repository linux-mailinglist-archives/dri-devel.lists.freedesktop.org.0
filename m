Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F7766CF97
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 20:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A605D10E4A1;
	Mon, 16 Jan 2023 19:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F4C210E4A1;
 Mon, 16 Jan 2023 19:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673897748; x=1705433748;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yHHh+mCXmOCcrkPqmCq6wjGH9+wc6KWd7/IHQt6fTcA=;
 b=NOC/XrSOx9+Z0d5uqSwkJTRbVeQmN47OE1dS98iZ4eZ/mGyJnXnbub5j
 yBddTXi+6kOxpvCrD0Ha4oLXysOmCaonMkc2F2M5frVvrdOORzVAeF7bV
 pXehzH9cwoPvjiN78s0jg7acBUKSHqg4Y/H+dlTzhkQimsurnT+MX2W0p
 Ua5DpwPpM/fpgf3H00TTEdbkAnMmXXhTSx4KQfL5Nk1dq1bybH/yp85ZB
 YjHmlBTjjfyI0ohB15AebtJDJb5N5VtbwXLj+921kW6W1KqA0jPlRidVk
 3s4ybE+J6xyvVjyyzWllMnTPE2u9oixV5vUKR6o4BFb4HbGTcsDFX5mze A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="324593225"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; d="scan'208";a="324593225"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 11:35:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="747824727"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; d="scan'208";a="747824727"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 16 Jan 2023 11:35:47 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 16 Jan 2023 11:35:47 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 16 Jan 2023 11:35:46 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 16 Jan 2023 11:35:46 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 16 Jan 2023 11:35:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rbe22sGOz5d1T8f4ZMZb3oTN0fHxnfQeSPm6a5BLTyfFQqdmnv6tlZB5i50gdJwSA2H7YAJNfG89/JwiHvULRLLLpnTomgiBz7c17JKCQkojg/lZJHpevJS8c1sxkoVYKka7G1enSpRZM39r3BDfqMLa8961VH06N0sJJXifY8TTTI6/XPIGHOFXH5YIQrrBb0hNZKEizo+MpkclSFMa4oiczIJlaJu7G5pyECsDA+CJEpA624zONNJlaQwD2aHUYrUbNzK13RpS4zCper0qB/PEUJakGYE2Tsm1C7NK/lY2wQjCQCKvzf1pOzY7ujoXQ7zwAojbOrSJGTQKU8JvwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=17wv3Q6Fz2OOc2ieJ1Nt3vKhvdQ5U/74hQAtcFjTyYk=;
 b=ftDLd4O2ira3zYL8CZd2U6RDO+1Svku1ntkJlqzx0VJXI8/apuPYMV3wQo/2oY3HLtD6zSZxmojDNJgtFoAbCnFYO+eLi0gntdfvmuw4HWRIHM0Hhwwu/jfTigYskKOjA1qv1u0vVGxrF90WxDLvS5VSKzMUV92eE+uw9c6xV3wBI621xVAFSMDUkVAUDlVQRPuMoO5Eu+4BhGcV6rmaTc7KVS9svteUn8Wckr8L3s6hbzg8872LPQp5nC5bVci2LNjvXVDMvobb8sXNLHgbZMdsv+hMhHElnQ4IxCrGlx+f9PmLwdJf2l1JTp9CBTp9F51ZAxyGAQNILENErLvXsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by PH8PR11MB6853.namprd11.prod.outlook.com (2603:10b6:510:22e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 19:35:44 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::f9f6:356f:eaaf:185e]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::f9f6:356f:eaaf:185e%6]) with mapi id 15.20.6002.013; Mon, 16 Jan 2023
 19:35:44 +0000
Message-ID: <3c193ee6-b1cf-52dc-531c-804f8cbe1e4d@intel.com>
Date: Mon, 16 Jan 2023 11:35:41 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Connect root sysfs entries to
 GT0
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230113022752.3151066-1-vinay.belgaumkar@intel.com>
 <874jsvazvi.wl-ashutosh.dixit@intel.com>
 <db1160e1-cfc1-08d0-08b7-84909608b465@intel.com>
 <87358faw34.wl-ashutosh.dixit@intel.com>
 <82e45200-8a95-ec9a-6dba-766f6c23c7fd@intel.com>
 <Y8Wea4b+mot7oVrB@ashyti-mobl2.lan>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <Y8Wea4b+mot7oVrB@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::8) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|PH8PR11MB6853:EE_
X-MS-Office365-Filtering-Correlation-Id: 60b3eb2e-7e76-4999-9cf5-08daf7f8dc10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0CC+9MaJwcEb40yWERY5+Syd+t2aasaKPyIiI92lCvToHJv0qo3HT9Skbk9HWDvMJeJlYAsh2ueXOR3rdADx8ZJrKXPf6A0Etxka/oXePG+4yM2W+EEenho7rtdB4IVuNHlu8lVY4JIAvp0plU+EAUdhl/gNrWZE6I29Ktuafh6/4bqDPsP+mYz0sa415omp58lMiKXW86dHUYA4HS0UmMSSSAZXy+ADkQH95EaBKjrFIRqeLYacaVMk4jR6z4tW3fyuOy2EsdRwWB7hJQ9nKdffqw6uERSkOwhaERILzjWX0f1wmIzWo007mTJrnhJ36VgB98wTGkJA+dNlGV/itsHezxgbSvozlCB9tcE5s9g+y8cVw9XtA0g66BOC3k8SHt+PDm+AcSLoYG1pCD8n0z/Qk0al6mWpk5GIu98pdRZpOkKSLU9DOSPVskKwpbcj8DX5t2v7eru1+qdd/oE0pCplUwGvrI1hpWUEKcXD0wOmyLJkYAU8n6fhTFWGDck025jFIHJc6jjiBbyeDP7OkXJ81kzPJ2vSqK0SnlzCwfEidThRpsFhsbwP1Rl3PUZuHDuysGTl+mDMMwQRLqbezYEUYxQre+kBPi8BfOl30dTm+JqAgZANxysLeE0TLJrmOvgrSfsLp08p4xE6TkaxVOXlM8ercQm7W9lyhs5dWi1H8YVQf2WAK0zfmBpg9QgcaR++2oAiyGTwSJzjjNqI1iWTimqFQ7dAfZc0SdYolFU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(136003)(396003)(39860400002)(366004)(376002)(451199015)(26005)(6512007)(478600001)(186003)(31686004)(53546011)(82960400001)(5660300002)(6666004)(6486002)(6506007)(54906003)(2616005)(6916009)(316002)(8676002)(36756003)(66946007)(4326008)(83380400001)(66556008)(66476007)(38100700002)(8936002)(41300700001)(2906002)(31696002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnVWN2UrYnlRQ1BqZDlSamJRTCt5T3lLYlFSTVNFUERNanVMdkNuRXJaTG8r?=
 =?utf-8?B?YUk0TnQvWDV6NXFDTGphcitDMitpYUtqa1o1cEppTi9wN0pRc2pwWHFGTEhw?=
 =?utf-8?B?OEdlQ1F0OUhxcWRQaG9OZW5nMHdDNW9UM0UyWnhibTV0KzZiMSs5UVErTWF6?=
 =?utf-8?B?OWdLcks4eS95blpnRHR2N0hpaWpjdE42b2huZmNXZzFTZWJ4cmtHUzZmeHNr?=
 =?utf-8?B?YmRia1RWS2J2MmxqSzRRZm5ZbFBaRjFDQzVnUzF6NFlaUERvNnNmRTBCVEV2?=
 =?utf-8?B?MzYydTFvd3R2eVpGamRJZUVHUzU4U0pkK3BYTzIvTmpEUlBjRFo3b3VWakY4?=
 =?utf-8?B?UCttOWxMSDgvNG1wQTN1UHR4aUxQRUQwaUtCRm1PWWYzUldQNFhWOW5qY0pw?=
 =?utf-8?B?N2VCS2N2T2Z5bnNReTZjWVVSMUEySFdMYkpHbjEwRkplMHRmRHRLU3RQQ2RI?=
 =?utf-8?B?S2tQN09yZlJTRHBvc3cvSEtOdWNHU1J5NXRMblhyY0VscW1meHpSMjFTb1FR?=
 =?utf-8?B?cjBPbjN4aXF4RVVlYmoySklsZVZJZ2I0SGtHN2VBV0VYWC9YaURBK2ROYXFO?=
 =?utf-8?B?Q0xPZWhLSFJ4eEdBYzRMcjNONUVFK2tYYS9MZU01TVBWVUNMRHdKYWtDNGJn?=
 =?utf-8?B?ZDVkZk03a1FQWS9XUjR3SnhpOUp4UlRjR0JBUXVHb3Q0VWVaVS9vSzlZQzJn?=
 =?utf-8?B?UlNrdW5lZ3ZQREhCT0MzeWtweS9sN3M0Mnk0ZzgyL0g4K0MyaDEyUGN5Q1ZV?=
 =?utf-8?B?YTY1L1h2d3lyQnhPMDdZT3NPSEZiRlpuK2JHN0lSeVI2VlBQam9GdTlKOGlZ?=
 =?utf-8?B?b3J3bnhXYWZYL1F3ZGJmTHRtck5ZeVJ2eWhhZ2VPS1g0YlpLbElNNlBSbFA1?=
 =?utf-8?B?QkVRdkJKQmx0TTRMRjQyRkxwaFBRWTNsWnI1YVNFeUlPZnM0OStXMDdJbjkv?=
 =?utf-8?B?VW00OWQwSVdUWjgrbHU2elhodEQvcWNUQkZUSURtVGkzeHVTVmkrTXJEbHNj?=
 =?utf-8?B?UjRDL21zTmxwWHcyN3c0b1NTVW9SaHBiTjZzN3liT0RkbThRKzI2YktGQjR1?=
 =?utf-8?B?WTJ3NVJXMmtzQUVSWVVBWlplTWZLNlBTVmQ0b2c4aEhFMDJuWFB6ak9UcWFy?=
 =?utf-8?B?SEpXK3laV0c3S3VnSEpFZjBSUWFjYmxtbFg5bEpObm5BdlE2NnN1MUZTK2ZE?=
 =?utf-8?B?VHVGdDMzRWI2ZytrYmFMd0lVQWdCUGM4Skp2cG5sZ0tnanNlUnViQ3FoZDJJ?=
 =?utf-8?B?VlRRRTZ2VUE1MlVtVXFSS0RBU2VpNjhiZ2xJU0JjajZObWZrQXlVV21KSHpW?=
 =?utf-8?B?RzZ3VFgxdDRqV2xkR3dTMWxWTlg2YmhQdDZ6T1c2eTBZM1hYcCtRcWgxL0ww?=
 =?utf-8?B?aFNhT1B0Uk9mMzhYTGlUdnI0TFU2bGd3dXkwT0dUcURrdWdWaXhhbjZVVW9T?=
 =?utf-8?B?dE5kVzEvem4zU212bGV0RzE5TjlpWFlLKzZpUmJWdHY2dVNGQ1lVc1hmYnFW?=
 =?utf-8?B?NlpYY2tUd3UvZkxaTnNZVXN0T2xsZEREUVE4ZFJ3VVJQRjNnTlRnUE1LdGxG?=
 =?utf-8?B?eFAvMzlGVC84SmN1VG1IQ21ndmY4aUZMK241V3NuK1ZreDByaHY5cEtFNVF3?=
 =?utf-8?B?c2E0QUlMaHc3RlRpN05OdlRkdDVlOSt4R1doN3FGbUhYVTNibnZWZDJvTzRt?=
 =?utf-8?B?bE03UGcxQzFmYS9WMEtKcURlN0NJM0p0ejMwRmlvUjF0VGt5d0laN0xGMERz?=
 =?utf-8?B?em5CQnJXSFNmWk5UVFc4eEtjK2g4T1Y1VGU4aUtTNTVqUVFmS3gwQmRGczgw?=
 =?utf-8?B?NEU5M0hxM3kvY2VLSHFvV3dKZjZBWEdiVjFMQmlYcHF1bTFnSDdFRW1EUGQr?=
 =?utf-8?B?L1pGMXBucThoS0FuUVZ2VFB0SGhVN1dBY0RINWZvMlNUYTJTaUtWRW5oV3Uv?=
 =?utf-8?B?RVk3OTgvbVIxd1R1ZDJIcXFLY21FY1NJMjRGOG1xZDZlQnJTcm9sOW5nQjBV?=
 =?utf-8?B?SFBZK1lLS2JUKy9WUlRzSGRnclFxVmtudnhzMkVwQTF3cHRPcXI0N2VBbjBr?=
 =?utf-8?B?RnhlT1lVQjZRNHpzYmpzVEROTkczQUw3TkY2TXZGYm03VUdCQXppalpERTFP?=
 =?utf-8?B?UlV6T3RhZlZQWUlKRFFCYklBVjRZVVl2MDJpdVdxOXNQSnJadVhNb0N2NndL?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b3eb2e-7e76-4999-9cf5-08daf7f8dc10
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 19:35:44.3935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XJCh28uQA3RM3VM8r3YsmsIoTRdqFe+XnFJ82gcfHtjipEy6yokK/V/0TG8961xnZso8zr8T5KnuVyz9LeBiRgoukOm1BYRxl+EA9d/7Jv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6853
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
Cc: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Tvrtko
 Ursulin <tvrtko.ursulin@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/16/2023 10:58 AM, Andi Shyti wrote:
> Hi,
>
> On Thu, Jan 12, 2023 at 08:48:11PM -0800, Belgaumkar, Vinay wrote:
>> On 1/12/2023 8:37 PM, Dixit, Ashutosh wrote:
>>> On Thu, 12 Jan 2023 20:26:34 -0800, Belgaumkar, Vinay wrote:
>>>> I think the ABI was changed by the patch mentioned in the commit
>>>> (a8a4f0467d70).
>>> The ABI was originally changed in 80cf8af17af04 and 56a709cf77468.
> In theory the ABI has never changed, we just needed to agree once
> and for all what to do when reading the upper level interface.
> There has never been a previous multitile specification before
> this change.
>
> There have been long and exhaustive discussions on what to do and
> the decision is that in some cases we show the average, in others
> the maximum. Never the GT0, though.
>
>> Yes, you are right. @Andi, did we have a plan to update the IGT tests that
>> use these interfaces to properly refer to the per GT entries as well? They
>> now receive average values instead of absolute, hence will fail on a
>> multi-GT device.
> I don't know what's the plan for igt's.
>
> Which tests are failing? I think we shouldn't be using the upper
> level interfaces at all in IGT's. Previously there has been an
> error printed on dmesg when this was happening. The error has
> been removed in order to set the ABI as agreed above.

Tests like perf_mu and gem_ctx_freq will fail as they read upper level 
sysfs entries and expect them to change as per the test. I think this 
includes all of the tests that read RC6 or Trubo related sysfs entries 
for that matter.

Thanks,

Vinay.

>
> Andi
