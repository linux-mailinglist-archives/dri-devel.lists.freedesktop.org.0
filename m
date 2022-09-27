Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0C95EB919
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 06:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46CC710E8A1;
	Tue, 27 Sep 2022 04:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812F410E8A9;
 Tue, 27 Sep 2022 04:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664251451; x=1695787451;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bFoxltkgzaU3MYrxaH59JfoxFTUp4k+PSCr33XhIgBk=;
 b=JcopQkwun5BM4yPtOW/5E/ikpQ2/b0v18+qWBgplDOSMNUhmNudtQCDA
 49w+DSiZC0Hu3WnPuiK7wd/eyMEI/naVTTS7wxE8i7BzbAdd9gsPAd6PY
 Wmyb8WgTRiGRaGNwgvD9Mz4ABkjoIFZUdqXiI5TGkQ44F9CiZv2jvE3i2
 utQW+ejvXiTc7krkvmFi5SBSgGv44nI9Nve7To16LKcx2DvfwrFDHGAyQ
 3YiANdY3Y/qEc7PUv8aXLHpD+ET5aXWJ+WvBe3c4m18bVQQ8wkV7t1Q5J
 l3wwtVll2QDZMI8d0KwWwJ/np9DRVlfL+c4YhIZdjeIO4+6RWrRr+l3hY w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="301190687"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; d="scan'208";a="301190687"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 21:04:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="599023177"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; d="scan'208";a="599023177"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 26 Sep 2022 21:04:09 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 21:04:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 26 Sep 2022 21:04:09 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 26 Sep 2022 21:04:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1K+lX2OjbpKsI04R0SsGPU3JJhsghftrAPpRnBwTzdep5bnrLNtSzwTnOWC44CQ64vhgXlv19fKiK6v5L4wNcg+HCDpI9P7WXdml0sMGHPc/Ao5VK7UgzXN+OiNSrjMZp794xyHgCII82r2cUMazYcajkHx+1+r/0wMZfT4VFrbXNNlY6WrSq36cNPn0Ty4ivwTXPA9PiAV3aP61rKfAE0jTfkYsEjKGvMOfehJFg8ClaTBdvKDekbeEpRvv2AzzUSmnOr4YIU6yGqBxuu7GTkUk+Mh1+q5GyLVJWiCQz19H5DD1+oqFeU3zAkymCfvmyki183/FGjIFKwje/aQ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRk3PDJf04EoPry/By7HNYNbJlQzAIgeO6qHjn/Lnvg=;
 b=l7PgwlcNwprBXkQqZOMqu6pYAhNg2a0FoSycIsGB9jua3+lZfzG0oSb2jVxkxc9r8zV0XrLmgKj4iZJGnR7F4NqPeDOuTJnYjdE9W+w+OkNCHWVy7243iyFoEG2tifky9G07dG5j8BoTziCUN8+sJtQObFVSyLLgVe+EzUnyXKlslhJrP3Vlw3xz0UzssVZTkxejRdks/J8Obyibvvu5MzFZ6nR7jqRFTzhOZDuWV7+0Q08chnfd9eUA9oYyU4HVamPEw85eANPJff6rsxE6ifAoO0F9hcTp3pdZ+1wUo0+48YWKCS5OZB0t+H/U8w9qMYeV1zPih/Ejjt4pONqOXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH7PR11MB5982.namprd11.prod.outlook.com (2603:10b6:510:1e1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 04:04:07 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::b8f7:e789:58d6:f0ee]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::b8f7:e789:58d6:f0ee%9]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 04:04:07 +0000
Message-ID: <d3c5e46b-1695-b482-95fc-37de2e745b9b@intel.com>
Date: Tue, 27 Sep 2022 09:33:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 0/7] Add HWMON support
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, <intel-gfx@lists.freedesktop.org>
References: <20220926175211.3473371-1-badal.nilawar@intel.com>
 <f995da40-b20a-437b-0b1f-5028b861300d@roeck-us.net>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <f995da40-b20a-437b-0b1f-5028b861300d@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0184.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::8) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH7PR11MB5982:EE_
X-MS-Office365-Filtering-Correlation-Id: 36b3ab4a-69cf-4919-9cec-08daa03d5273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NBEttHT8IsFmxZFYrdcZ87uSkVsCnzhmhh3hBFfVGqIz57maivFhgnhbI6GjRnVOwULu3kpXPGe38Zon0Hrxxvei6QCHNZDHk++wikLjPNpprgOvi7dJUsAgdPAWo8HrjY98AK4cVRNCNc6NZGJu21KfCIWRVFzCE/MQBGb8hh6p+ZIdKT/unZ06YstTOYwN8L1C/N7HtuZVzvoiAxtmY3DRQuQKdGJyYgqcKXS2Sk/qaubrOhIT5M2S1eSM7jIQhvOq3PdsgYYiFAkQORnkkUffKat5Qw70O4AXZcNvjpUQCWqVZmDDfTw/VRjsySiNHB6eTV74EeHxflxTDvkjjeGMuNNzs3DKsgmOAsNa39Wv5FDeNt6YvjtfLzJZdNcUDW9TxZI5TDg5JAYZx87Q02NUpDbn3O2lDubBVhkbZl1EIO++8udwTeF+OfC35oBFhXwuFG7VQmZF6tEIBkEke3+UAQilCCeRdi0ON1DqJVPVlL+JsmaoUqMY6yzW4QLXwWOdBCQH9s+Ig0aKUXLqcRt/s56ECQvh+NUdx2BiqFFzZaKllh3tUUAZbVODlSIwt+4KzyQydjVducVJuUFEx2a022R8M46ciDrvJNl7i+KGSqfJxSI3XcSI+9TZ/KJeIiD5teQ0m9cNVbgkDrmdz55jqSF/LtL3/Lm6+7zW0FOQFnJlWXRacj4T5G2MkX3jqmQKImDzhifnwwyeDbPSbEjJ6UtKw1ceFYQwEuPf8f0A7j35pUX+Go8ZyL2GgOXslBggpGhj0Hv4UihVFeDF+AguY4iuMRzB/L+ql5HIRIw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(346002)(376002)(366004)(136003)(451199015)(36756003)(31686004)(6486002)(6506007)(26005)(6512007)(53546011)(83380400001)(8936002)(5660300002)(2906002)(86362001)(31696002)(66946007)(66556008)(66476007)(186003)(316002)(82960400001)(38100700002)(2616005)(107886003)(478600001)(6666004)(8676002)(41300700001)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVM4cWxnTFRPRnlnTmh1cWJCV2FOREt4TkR0ZHRwcnMrcTREUE92SXZsb2lL?=
 =?utf-8?B?cng4U2pTbksrU2hkR1E3amxtUXExT2VJcGlNVitWOWMzZVlEMVZnWWxlTzAz?=
 =?utf-8?B?NCtKdXJqYkUvUWpHU25ETE5XaE1OeVZoQVRLRmVUWGhnSEMvUk80SkpJSERS?=
 =?utf-8?B?Yk02Q0tFSjJEWnFHdExvOCtocDFPK2I3TlpKMkJCMk44OUpoWHVmdVpJR1I3?=
 =?utf-8?B?T2luWHVpZkdqckhVQ3B1YkhLdERwMlZVOEZ2VDNRNlF4MDRmNTlwemx6N3Y2?=
 =?utf-8?B?N2pKbEx4bDVUaW5lc2xxZHVhdlVyNFkzVGtQR3NjOURnRnFIYUJaNmVRRjQy?=
 =?utf-8?B?MG9PS0lnR1poVUlGV3J1VE1YN1NESy9wbVJISmJyeEJCNXI2M0VsdGNpZU5O?=
 =?utf-8?B?dmtIcWlzbzRKaTVZWFNZd1hIUVhRWHlLR3pocVpZbjVEamYyOG9kZ3JBMkpZ?=
 =?utf-8?B?SDIxWlN1cmZTYTJ0VEV6RnpDVXRPQ1R0TUsxSjl1eXBjOU9oeEFkYW0xZ1VO?=
 =?utf-8?B?b2pKUUFjTldpb3lMaGZpRU1vYWtMbUpINE9nSXgwV0NaRDQyeWFtOE5hOTBj?=
 =?utf-8?B?VmZaOExXOUpzMmNvMm0vOWFpOGNYNFJjSEFTMTBqWmpvNkorcHhrVXBOWmEz?=
 =?utf-8?B?WG5VQTZzRUN1R0F4dVJ5NngvMC9KRVVwL3plYm5QeWtqVytlMTc4YVVFWWhL?=
 =?utf-8?B?cHhRWWhkS2dhYUE5WjlZalluU2FnZjFiM21RdTR0MkpHaUdEdUlkdVJ1amRl?=
 =?utf-8?B?MStVWTViNklZeDgwU2xVc2V4MXV6R0ltd2xBcDNnckQvdm51eUVCSFowUzVP?=
 =?utf-8?B?czNVT096YVZDMzRobTVjOG9CbTQzd3BYZEFjejUrS2dSVGVsN2tjYnVvVkU0?=
 =?utf-8?B?SGNvV2R6N3Y4ZWQ0ZTZ4c0hJTEFzUjlEUWVuaXczR0M2WVI5ZEw2eXB1bWR3?=
 =?utf-8?B?c0ZPR0xicjBmSGUzT2dyM3drNzJocTduYnBVWDFlc2dwVUtYMXNacng5cUFp?=
 =?utf-8?B?bUkzcFNFUnlWalJzYitKZ1RYeE54SEcxK0tBckl3TXIzTEhMWWhCaG9NNmlS?=
 =?utf-8?B?Q3BDMExhcnRDU1JONFZyYXFoSURtLzhhZXdRb0ZZNlg2cUNvS0Y4OElFVytl?=
 =?utf-8?B?bUc3VURFUGdaN1pJMWZSenJQTlc1ZXpHUUVyZXY1WFZkbkh1QjR4NGdBRzVV?=
 =?utf-8?B?dHhKWHQybmxlYmR4RzkyQks4b1hvb1Q5UFkwZFRQK2lNMGxKRFhoQVkxV0dn?=
 =?utf-8?B?TERRVDZNdEhHWkNFRnZkZ3dNSnJOaXNmblMvRzRGMkZTbmlYQUxLcmJyaTR5?=
 =?utf-8?B?UHIwOTZTZytSWUl6OEhBTTRsMWlCbjVPajVXSERQLzBZV3pibm1QNkxYWXEr?=
 =?utf-8?B?THE5RGZYQjlveG80dGVka2MzbnFmNXNtM1FoZnovcjhNSWNPMGpzWXIrOWpj?=
 =?utf-8?B?VVFDYkhielRNaW1TRUg3Ukk4OU9TY0lNVmhnblZLUDZXZVQvbFpOWDlxMGcx?=
 =?utf-8?B?TVZiWno5Q2h0WnpucUVES3lFR3hzMnRQVExsenErbkZQMXhmSUh6Wkpid0I4?=
 =?utf-8?B?NjNPY1BWVHhPQWM2aTltSks0cHU2OVZIZkFXZXlRdy9hSndLeEMydkhicGJN?=
 =?utf-8?B?OWxnV1hPNVhwSGxkblVwaERFcmRnR29IYUdBUDF6ZVFKRldVdEFNU2F6SHBy?=
 =?utf-8?B?Y2ZxZ2p2SmdtSGNrMHNsT28weWd5YUhDTU1QRk90ODMwQ3JOOHZSOHZablFN?=
 =?utf-8?B?YW02dk1XSG5ORWROWWtWZTBmd0FxL25yWkxJNCtpVjNLRlhQNTcwcnRIQlhq?=
 =?utf-8?B?d0RDcFpnRGhwTHlhZ1ZSZEpXd1JITk56U2tnOGFXYUtSN1FDVzArRWlSYXJL?=
 =?utf-8?B?M29OMmpoamdCZGI3N00ySTVkQ3UyT25UVUFJLzJrVEI2V1pMdHgzUjBvbVFG?=
 =?utf-8?B?RDlwN284QkVVQmZqK0J2V1o0czJtUkVWNDR0aVIwTnVEZldLdnowVm93eFJa?=
 =?utf-8?B?Tmd0c1VnWURZOHBrTlErVCt0TDFEd2J6NkNvUXVvUE5TK3pHalpYSkRkTjJ0?=
 =?utf-8?B?cEVieFdUcXVVbkVMSjdoQXQvRXJoV055T0dlODZpV3lKMlk3VTU3MjRLR3kz?=
 =?utf-8?B?QjFJQWkyN1cwdkJnSGgyRVdNUEYwWURvSkFlQ3FmRm83UEZjV1J4d1MwVU9K?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b3ab4a-69cf-4919-9cec-08daa03d5273
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 04:04:06.8259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: APPGRZ3CQs4Yc1nUnLVtoGARRdPqqNmvQhhFS7wvd+ucV+uQLRDUbq+6zVSrWWgrFh2IzktdgqA5ydWMP+thXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5982
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
Cc: linux-hwmon@vger.kernel.org, andi.shyti@intel.com, tvrtko.ursulin@intel.com,
 anshuman.gupta@intel.com, dri-devel@lists.freedesktop.org,
 ashutosh.dixit@intel.com, jon.ewins@intel.com, riana.tauro@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 27-09-2022 02:39, Guenter Roeck wrote:
> On 9/26/22 10:52, Badal Nilawar wrote:
>> This series adds the HWMON support for DGFX
>>
>> Test-with: 20220919144408.251981-1-riana.tauro@intel.com
>>
>> v2:
>>    - Reorganized series. Created first patch as infrastructure patch
>>      followed by feature patches. (Ashutosh)
>>    - Fixed review comments (Jani)
>>    - Fixed review comments (Ashutosh)
>>
>> v3:
>>    - Fixed review comments from Guenter
>>    - Exposed energy inferface as standard hwmon interface (Ashutosh)
>>    - For power interface added entries for critical power and maintained
>>      standard interface for all the entries except
>>      power1_max_interval
>>    - Extended support for XEHPSDV (Ashutosh)
>>
>> v4:
>>    - Fixed review comment from Guenter
>>    - Cleaned up unused code
>>
>> v5:
>>    - Fixed review comments (Jani)
>>
>> v6:
>>    - Fixed review comments (Ashutosh)
>>    - Updated date and kernel version in documentation
>>
>> v7:
>>    - Fixed review comments (Anshuman)
>>    - KernelVersion: 6.2, Date: February 2023 in doc (Tvrtko)
>>
>> v8: s/hwmon_device_register_with_info/
>>        devm_hwmon_device_register_with_info/ (Ashutosh)
>>
> 
> Is there some reason for not actually versioning this patch series ?
> Just wondering.
Sorry I miss typed cover letter title. I will correct the title as 
"drm/i915: Add HWMON support" and resend the series to maintain versioning.

Please ignore this series.

Regards,
Badal
> 
> Thanks,
> Guenter
> 
>> Ashutosh Dixit (2):
>>    drm/i915/hwmon: Expose card reactive critical power
>>    drm/i915/hwmon: Expose power1_max_interval
>>
>> Dale B Stimson (4):
>>    drm/i915/hwmon: Add HWMON infrastructure
>>    drm/i915/hwmon: Power PL1 limit and TDP setting
>>    drm/i915/hwmon: Show device level energy usage
>>    drm/i915/hwmon: Extend power/energy for XEHPSDV
>>
>> Riana Tauro (1):
>>    drm/i915/hwmon: Add HWMON current voltage support
>>
>>   .../ABI/testing/sysfs-driver-intel-i915-hwmon |  75 ++
>>   drivers/gpu/drm/i915/Makefile                 |   3 +
>>   drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   8 +
>>   drivers/gpu/drm/i915/i915_driver.c            |   5 +
>>   drivers/gpu/drm/i915/i915_drv.h               |   2 +
>>   drivers/gpu/drm/i915/i915_hwmon.c             | 736 ++++++++++++++++++
>>   drivers/gpu/drm/i915/i915_hwmon.h             |  20 +
>>   drivers/gpu/drm/i915/i915_reg.h               |   6 +
>>   drivers/gpu/drm/i915/intel_mchbar_regs.h      |  21 +
>>   9 files changed, 876 insertions(+)
>>   create mode 100644 
>> Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
>>   create mode 100644 drivers/gpu/drm/i915/i915_hwmon.c
>>   create mode 100644 drivers/gpu/drm/i915/i915_hwmon.h
>>
> 
