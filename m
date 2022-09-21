Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BA55C0050
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 16:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99D510E88B;
	Wed, 21 Sep 2022 14:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F68C10E88B;
 Wed, 21 Sep 2022 14:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663772026; x=1695308026;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=s8S8hUnoMZI9SCm1coWWjqmwq0cp5qCOA72CpiQBcCk=;
 b=K0onbjWw0lnr8XsEsQbPFNYzRM1d4dIu7bVMxgKxK3NOCx7mi+/Cd5Vg
 Pc+yK45rblll3FLRNbgLx6kX+Q/Y9XCBoe8lSxrAJsCsp3ohcjMskMVPR
 oBLjqxizfwhfS3v0NoU1UPLdVr4UAiqqzA6ec9o2UedV9docnxLM0avPv
 2qOaH3RHF2X04Vp+qEFxBBQcdyyQmqjKrT3GsQHyQ3kfPvRh1E55kt2CR
 YgQE/N9tsy4S2a+PJ8Yc3RsrsPqKO1b1hCyAsvMXxCp7VvTeK/U11x/G6
 veLVhPEFvpz0yVhnNyj6X6QkfuRxgshT0oGlyqUSrIDPZe03R7753w0f9 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="298740160"
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="298740160"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 07:53:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="614830270"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 21 Sep 2022 07:53:44 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 07:53:43 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 07:53:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 21 Sep 2022 07:53:43 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 21 Sep 2022 07:53:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6bThLRf+VlTDHzutJeHUtDB+qG4ur/UmexGydJR74U6xwZvP/nqN0b13Hzxcha/6laM1r9DEfWyVsSlTdBLt+ItsIcr0N3SFnghd1wEsveehGm3/2yRFd0vQrpj5xK7xi6IYK/9tIjH2QoTAqSkl9oawLaVx+8yT3rXKHGdTNC2wkjUPmN3S8OPt12XIt55aI5BTDa3s/Yd/MAs/r/R3Y+9E2k1eKVbKVgIhoz5k3Jsi8XiSCHhFHNWad7+ni6MYcxFqzOYelO1NOt5e8T1aT+Y25v9SxuUUyufNyPswegtIXqR7D+Rwf/8enx64EyLs2m4+G4O/wTviQNnZwrhCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvjMe34PuzoBJJ6djIQkAufMWL0sTJ4X/lmmFI469AY=;
 b=lNl8zHKm9OfbTr3BQ31nStNTKHmFZuzaFG2Y2txCtT6Rjhtr+ttISFRib7CNSzYpDdYwTeUq4x3WscQ56AEnzSQgM2RKB/UF7a2ZJg1MU8L3GF2KGD4hx1/WVPwvBl/PvXmA18HGWusMz20DBBQCQ7h3/CdrLkcBelJx1Xd1Y0axSq2VtBgXtADXysGR9B/Dz4pm2z/yefBB/tcRjxMPxUF307j55MK2CtzzgNtmUXnXm05IZtUsbImeVNJdV5jO7Si8/d/UoBEZQHOYn65QC1TK6kxfEUrpVRZnV4N8xhrwbSOqX9Z9ZuByR84WSJNxzF13T4twPYymgfR+1I3PNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SA1PR11MB5780.namprd11.prod.outlook.com (2603:10b6:806:233::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Wed, 21 Sep
 2022 14:53:37 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::b8f7:e789:58d6:f0ee]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::b8f7:e789:58d6:f0ee%9]) with mapi id 15.20.5654.016; Wed, 21 Sep 2022
 14:53:37 +0000
Message-ID: <393a7b54-d179-f9b4-e377-ed2c3c8de000@intel.com>
Date: Wed, 21 Sep 2022 20:23:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 3/7] drm/i915/hwmon: Power PL1 limit and TDP setting
Content-Language: en-US
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220916150054.807590-1-badal.nilawar@intel.com>
 <20220916150054.807590-4-badal.nilawar@intel.com>
 <b120c201-d4c4-c9af-26bd-432df71b84ac@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <b120c201-d4c4-c9af-26bd-432df71b84ac@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXPR01CA0084.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::24) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SA1PR11MB5780:EE_
X-MS-Office365-Filtering-Correlation-Id: a5c09e4c-088e-465e-0688-08da9be110a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qwp4uCC9oD2X+oy3DuCwSGIRFIdxI/GKueAVTpJR6FEOx8ar/22gn3YQ9iKHb8k1aJkR//NoBE4JNsWKexAeVBgzgzNlXcEw/+R/daOv/LAy/9bhF/sOYUXw+qCqyj22uoL5LGytbNWPXmTMXoAjve2nI0tx96ddLaHUshWhCo/ECWtvEc9fpy1UnIiOLLBmWARq7UG9OscIImWTytOILQAPCBUHDFvb7+pXnZvd/ubGXkMuYc5/5QzYR7CdUxfaEbQV9SSLEh7VbHlr2MUyQTcZjwAFJx9F94uLrqkUyOcPaxw+kJOvkb7clGKHDiIgOtwigkqWHSKg61EWVa4IwDmSOxoj0cvGqLAXgVrjQ0H2dJ/VGd5Qn2atxr/3jYlpgOEpE+7dSVbUX+iVD4pRD3LnHX3dWC5oPxzSVDSaTE9+56RSX4Ctk43HaLxptfxcBAwx6X9Hrw60Gb4yV2R21BZ/pkBtAutkP1l1JLTt/k+p7aUkMF0uLGy+MGMJDCWZNIRmA/4GCSiOebPX/m8zJ3HLY1FrS8/ZDNhz8uMM9dq0/WELxfQByeTCOsXRRf+kvjl/O9vMlPvtHoSXWGivCMRCia7FXT9Fme2H0807jI3qGWEYTJ76hP/QWww+rOGOF6mpaVsbB00NdmN14TWkFkjZFbvFuDxf7Lyoqs0VkbV/i/+pKbari1NRwqHcU/SJVH/pjlLroZUEzWoVzzQZH29/XH63j9YhtpTnHZqqG6uZbi1IsyAOGNwn/OsyN0fxiHbwEJtpM+pBdZIW844SQIWVYhqZy2gKUeaWSJ1D0aU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(366004)(136003)(396003)(346002)(451199015)(4326008)(36756003)(6506007)(2906002)(8936002)(26005)(53546011)(38100700002)(6486002)(86362001)(6512007)(66476007)(66946007)(41300700001)(31696002)(6666004)(66556008)(82960400001)(83380400001)(186003)(5660300002)(2616005)(8676002)(31686004)(478600001)(30864003)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjVzbGIrbS94YThJSFdMUXBuR25zVUpXSERrNURSNkVhUGJsZUZSSlJ2b3Zq?=
 =?utf-8?B?K3hOcEZZZ21MaVN1bWw1VTE0aG9mbVM3RDR2NGpKVkRhMFpiTlM5YUdkcnRa?=
 =?utf-8?B?NlBucGNEM21GVzZFbk5BYXRSOGllbzdtQnhoTWYyUkgydW84S0VQeDVVbmFy?=
 =?utf-8?B?Y3h2bTE2YldaUlJuZHNlLzh1aVl5aWoyelRLVE9NNFc0TzYzanhEWFVEVVZP?=
 =?utf-8?B?K1RVMGZOVGV6TUJZN0RTQUVpZ1dmallCL053T1lUZjJNS3FTNk42MCtKNHA2?=
 =?utf-8?B?dWh0SjBCL3FYMnpJaDJFNlhnNUlnUW9zSXNDdElOVkN3a05jOWk0SUhjVjlX?=
 =?utf-8?B?MHRaOTJzeDM4QVN2Q3dab0l5NmxlSWVSRUlpeVpHMnI1eFZKTjZ0Syt6elVC?=
 =?utf-8?B?TkJVSFFnVlF1SStrN3NHck0vU0RCT05weU5ybEdhZ0VVb0xOeUlQV0RxeHhQ?=
 =?utf-8?B?T2RTVG1ycXFLbncwMk53bjE0bkhPdzVmRExzcnExZTF6Vm9hbk1Ra0xDNFRP?=
 =?utf-8?B?aGV5YjZ5S2x5ejVyN0F3MmN3UmQySGRhQ085Qy9HTGpLcWE0OS9USjRyeEZL?=
 =?utf-8?B?ZGJBMHZoWFFnb1h0MHFDSnJSTll6ZDJvdU4zaVVvMTFjQjNDVmFNNFMyRUt6?=
 =?utf-8?B?aWVrWUJGL0QzZW9yenNSSVg2bjAyU20zeWJSYXFDWXpUbzlrandpT1psbnk4?=
 =?utf-8?B?c3lVT1hnN2tYMkpnZXV5N3FUQUl1UmF5M1FIL0FNc1oyaU1Ud0tlNWYvQitB?=
 =?utf-8?B?OEVwQThXQ3Ztbk5JdEdqL1FCQ0p1ZTRvS1I1cGkxSU1xeVp6RXBHVFoxRTAy?=
 =?utf-8?B?a3NVais4MC9yZTExbTRTS0IvZ1hPYUlKaWFZN0Y0QjlaaWNTUjlEOUhCQXZ5?=
 =?utf-8?B?TWVHZGVuUXFPakx3Rmdtd1NvdjE4dEZzOW5pY2k3ZFVEQVllRWN6ckNINUdK?=
 =?utf-8?B?OW1US1pnUzFoZmJNaVRXMnBNdHcrTVJQSUs3b1E1NUx0YzVzZmNYNndydlg2?=
 =?utf-8?B?UWJtSEpidUEzN0ZCQ1hOWWROSk1mUlRlZmc3R25MWmJ1ZThSb3ZGVk0xbUlG?=
 =?utf-8?B?dldpWHFkZkVUU0tCRUl4U1ZWRkpPdE4vZHpoNDlMMllhV3RYa0dkT1ZrYnVK?=
 =?utf-8?B?YzMzZzJNdjZRUFNWQzZmYnBMcllJTVlPUzUxUWxSS0Qra3ZtWXE0MUN4NnM5?=
 =?utf-8?B?ZE5aUlhDeVBTTTdHSVMwZytPMVVLd05ROWM1a0tJYS9MdmFmenFEN0JvNFFp?=
 =?utf-8?B?SDBKaTlQRS9wbEFhTHBUeU5PZnFwQjFQeVJKUGFCbnQ1TWQyUjYzeE5SSy9R?=
 =?utf-8?B?azEvbnZVQU1UOXVITWt1SExjSkg4T055MENNWWRzbFdEd0JUT3BXaDJNV082?=
 =?utf-8?B?YVdkWGJOZ1I0NkNNRjlvN1o4Rlh6WXg5ZlR5c05GaVMrZW9aYzB1SHVLRmM5?=
 =?utf-8?B?R0twNUxsejlLaXl0cW5GWm9meWxUcFJ3NG1FM1Q5ZEx1RVFYbWU2bXV1eDFQ?=
 =?utf-8?B?bTBKY2V6QzYwNTFkTzUxUXdTeG84K2JRZ1MrTVh2QlRRTmFFM0o5Nk5ZVytQ?=
 =?utf-8?B?VjVienMyOFRZNnY2eVZ1UHFJQ1BQQTViS29EaCtZS1FDelYvcjVneFJoT1ZY?=
 =?utf-8?B?TWZRamRxS3BjK1VkRlY3SUZlVG45aEQxcHZ6WjhOOUY4VGpLNzkwSTNvaXBR?=
 =?utf-8?B?cTh4ZkdGd1hobUFSTGpBYXREcXZONWlPcXdQS3JINlhKdDlzbGNQZE5yWVM0?=
 =?utf-8?B?cDRBa0tLMG9mQmt5MG9ucTVFTmovVGpsaDdkWHRkS01vMDl3U1VuMHRZU01h?=
 =?utf-8?B?Y0hTM2ZkZkRDenBmc24rZWxZUXk4RGJWS0ZodGJjdi9JS09Cb00vZHV2RUpa?=
 =?utf-8?B?NFVGak9yVHlVQm9JMTdVNUlQcDdrRWl5WUJDbkVmdGQzck0xV3ZtcW16bFRo?=
 =?utf-8?B?R2lBTCswUU15eWlITWF0OWIwZEY2cisyL0VnZlFXaW1EdlMyQ1d6NU9zZVpr?=
 =?utf-8?B?VDlHenU1diswQUJsUzZUUHVlUnd6NFk4THByRm8vNGlzU1gzY2FlNVAzVVZG?=
 =?utf-8?B?b1RQRVFib3VJUkhlRDJId2J4aUFVc2t1eFcxVmU3MUJJdFI4MnhWNUlkRjdT?=
 =?utf-8?B?d0NsYzNjcDdsL1JtYmhMLy9xenN3T01Qa0R5ZXNhUk85OWZlbXdsNzNwcW55?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c09e4c-088e-465e-0688-08da9be110a0
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 14:53:37.7104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4CDAqjn+EnFG8sugrLEDIT5+gDYaH21PJEGcElgA2LirAozpmprawUn2Qh1Fxe2G08RKEIQkpGmUneBb0b6ayw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5780
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
Cc: ashutosh.dixit@intel.com, jon.ewins@intel.com, linux-hwmon@vger.kernel.org,
 dri-devel@lists.freedesktop.org, riana.tauro@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 21-09-2022 17:15, Gupta, Anshuman wrote:
> 
> 
> On 9/16/2022 8:30 PM, Badal Nilawar wrote:
>> From: Dale B Stimson <dale.b.stimson@intel.com>
>>
>> Use i915 HWMON to display/modify dGfx power PL1 limit and TDP setting.
>>
>> v2:
>>    - Fix review comments (Ashutosh)
>>    - Do not restore power1_max upon module unload/load sequence
>>      because on production systems modules are always loaded
>>      and not unloaded/reloaded (Ashutosh)
>>    - Fix review comments (Jani)
>>    - Remove endianness conversion (Ashutosh)
>> v3: Add power1_rated_max (Ashutosh)
>> v4:
>>    - Use macro HWMON_CHANNEL_INFO to define power channel (Guenter)
>>    - Update the date and kernel version in Documentation (Badal)
>> v5: Use hwm_ prefix for static functions (Ashutosh)
>> v6:
>>    - Fix review comments (Ashutosh)
>>    - Update date, kernel version in documentation
>>
>> Cc: Guenter Roeck <linux@roeck-us.net>
>> Signed-off-by: Dale B Stimson <dale.b.stimson@intel.com>
>> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> Acked-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>   .../ABI/testing/sysfs-driver-intel-i915-hwmon |  20 +++
>>   drivers/gpu/drm/i915/i915_hwmon.c             | 158 +++++++++++++++++-
>>   drivers/gpu/drm/i915/i915_reg.h               |   5 +
>>   drivers/gpu/drm/i915/intel_mchbar_regs.h      |   6 +
>>   4 files changed, 187 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon 
>> b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
>> index e2974f928e58..bc061238e35c 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
>> @@ -5,3 +5,23 @@ Contact:    dri-devel@lists.freedesktop.org
>>   Description:    RO. Current Voltage in millivolt.
>>           Only supported for particular Intel i915 graphics platforms.
>> +
>> +What:        /sys/devices/.../hwmon/hwmon<i>/power1_max
>> +Date:        September 2022
>> +KernelVersion:    6
>> +Contact:    dri-devel@lists.freedesktop.org
>> +Description:    RW. Card reactive sustained  (PL1/Tau) power limit in 
>> microwatts.
>> +
>> +        The power controller will throttle the operating frequency
>> +        if the power averaged over a window (typically seconds)
>> +        exceeds this limit.
>> +
>> +        Only supported for particular Intel i915 graphics platforms.
>> +
>> +What:        /sys/devices/.../hwmon/hwmon<i>/power1_rated_max
>> +Date:        September 2022
>> +KernelVersion:    6
>> +Contact:    dri-devel@lists.freedesktop.org
>> +Description:    RO. Card default power limit (default TDP setting).
>> +
>> +        Only supported for particular Intel i915 graphics platforms.
>> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c 
>> b/drivers/gpu/drm/i915/i915_hwmon.c
>> index 45745afa5c5b..5183cf51a49b 100644
>> --- a/drivers/gpu/drm/i915/i915_hwmon.c
>> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
>> @@ -16,11 +16,16 @@
>>   /*
>>    * SF_* - scale factors for particular quantities according to hwmon 
>> spec.
>>    * - voltage  - millivolts
>> + * - power  - microwatts
>>    */
>>   #define SF_VOLTAGE    1000
>> +#define SF_POWER    1000000
>>   struct hwm_reg {
>>       i915_reg_t gt_perf_status;
>> +    i915_reg_t pkg_power_sku_unit;
>> +    i915_reg_t pkg_power_sku;
>> +    i915_reg_t pkg_rapl_limit;
>>   };
>>   struct hwm_drvdata {
>> @@ -34,10 +39,68 @@ struct i915_hwmon {
>>       struct hwm_drvdata ddat;
>>       struct mutex hwmon_lock;        /* counter overflow logic and 
>> rmw */
>>       struct hwm_reg rg;
>> +    int scl_shift_power;
>>   };
>> +static void
>> +hwm_locked_with_pm_intel_uncore_rmw(struct hwm_drvdata *ddat,
>> +                    i915_reg_t reg, u32 clear, u32 set)
>> +{
>> +    struct i915_hwmon *hwmon = ddat->hwmon;
>> +    struct intel_uncore *uncore = ddat->uncore;
>> +    intel_wakeref_t wakeref;
>> +
>> +    mutex_lock(&hwmon->hwmon_lock);
>> +
>> +    with_intel_runtime_pm(uncore->rpm, wakeref)
>> +        intel_uncore_rmw(uncore, reg, clear, set);
>> +
>> +    mutex_unlock(&hwmon->hwmon_lock);
>> +}
>> +
>> +/*
>> + * This function's return type of u64 allows for the case where the 
>> scaling
>> + * of the field taken from the 32-bit register value might cause a 
>> result to
>> + * exceed 32 bits.
>> + */
>> +static u64
>> +hwm_field_read_and_scale(struct hwm_drvdata *ddat, i915_reg_t rgadr,
>> +             u32 field_msk, int nshift, u32 scale_factor)
>> +{
>> +    struct intel_uncore *uncore = ddat->uncore;
>> +    intel_wakeref_t wakeref;
>> +    u32 reg_value;
>> +
>> +    with_intel_runtime_pm(uncore->rpm, wakeref)
>> +        reg_value = intel_uncore_read(uncore, rgadr);
>> +
>> +    reg_value = REG_FIELD_GET(field_msk, reg_value);
>> +
>> +    return mul_u64_u32_shr(reg_value, scale_factor, nshift);
>> +}
>> +
>> +static void
>> +hwm_field_scale_and_write(struct hwm_drvdata *ddat, i915_reg_t rgadr,
>> +              u32 field_msk, int nshift,
>> +              unsigned int scale_factor, long lval)
>> +{
>> +    u32 nval;
>> +    u32 bits_to_clear;
>> +    u32 bits_to_set;
>> +
>> +    /* Computation in 64-bits to avoid overflow. Round to nearest. */
>> +    nval = DIV_ROUND_CLOSEST_ULL((u64)lval << nshift, scale_factor);
>> +
>> +    bits_to_clear = field_msk;
>> +    bits_to_set = FIELD_PREP(field_msk, nval);
>> +
>> +    hwm_locked_with_pm_intel_uncore_rmw(ddat, rgadr,
>> +                        bits_to_clear, bits_to_set);
>> +}
>> +
>>   static const struct hwmon_channel_info *hwm_info[] = {
>>       HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
>> +    HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
>>       NULL
>>   };
>> @@ -71,6 +134,64 @@ hwm_in_read(struct hwm_drvdata *ddat, u32 attr, 
>> long *val)
>>       }
>>   }
>> +static umode_t
>> +hwm_power_is_visible(const struct hwm_drvdata *ddat, u32 attr, int chan)
>> +{
>> +    struct i915_hwmon *hwmon = ddat->hwmon;
>> +
>> +    switch (attr) {
>> +    case hwmon_power_max:
>> +        return i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit) ? 0664 : 0;
>> +    case hwmon_power_rated_max:
>> +        return i915_mmio_reg_valid(hwmon->rg.pkg_power_sku) ? 0444 : 0;
>> +    default:
>> +        return 0;
>> +    }
>> +}
>> +
>> +static int
>> +hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
>> +{
>> +    struct i915_hwmon *hwmon = ddat->hwmon;
>> +
>> +    switch (attr) {
>> +    case hwmon_power_max:
>> +        *val = hwm_field_read_and_scale(ddat,
>> +                        hwmon->rg.pkg_rapl_limit,
>> +                        PKG_PWR_LIM_1,
>> +                        hwmon->scl_shift_power,
>> +                        SF_POWER);
>> +        return 0;
>> +    case hwmon_power_rated_max:
>> +        *val = hwm_field_read_and_scale(ddat,
>> +                        hwmon->rg.pkg_power_sku,
>> +                        PKG_PKG_TDP,It seems a dead code, 
>> pkg_power_sky register in initialized with 
> INVALID_MMMIO_REG, why are we exposing this, unless i am missing 
> something ?
Agree that for platforms considered in this series does not support 
hwmon_power_rated_max. In fact hwm_power_is_visible will not allow to 
create sysfs entry if pkg_power_sku is not supported. Considering future 
dgfx platforms we didn't remove this entry. In future for supported 
platforms we just need to assign valid register to pkg_power_sku.

Regards,
Badal
> Br,
> Anshuman.
>> +                        hwmon->scl_shift_power,
>> +                        SF_POWER);
>> +        return 0;
>> +    default:
>> +        return -EOPNOTSUPP;
>> +    }
>> +}
>> +
>> +static int
>> +hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
>> +{
>> +    struct i915_hwmon *hwmon = ddat->hwmon;
>> +
>> +    switch (attr) {
>> +    case hwmon_power_max:
>> +        hwm_field_scale_and_write(ddat,
>> +                      hwmon->rg.pkg_rapl_limit,
>> +                      PKG_PWR_LIM_1,
>> +                      hwmon->scl_shift_power,
>> +                      SF_POWER, val);
>> +        return 0;
>> +    default:
>> +        return -EOPNOTSUPP;
>> +    }
>> +}
>> +
>>   static umode_t
>>   hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>>              u32 attr, int channel)
>> @@ -80,6 +201,8 @@ hwm_is_visible(const void *drvdata, enum 
>> hwmon_sensor_types type,
>>       switch (type) {
>>       case hwmon_in:
>>           return hwm_in_is_visible(ddat, attr);
>> +    case hwmon_power:
>> +        return hwm_power_is_visible(ddat, attr, channel);
>>       default:
>>           return 0;
>>       }
>> @@ -94,6 +217,8 @@ hwm_read(struct device *dev, enum 
>> hwmon_sensor_types type, u32 attr,
>>       switch (type) {
>>       case hwmon_in:
>>           return hwm_in_read(ddat, attr, val);
>> +    case hwmon_power:
>> +        return hwm_power_read(ddat, attr, channel, val);
>>       default:
>>           return -EOPNOTSUPP;
>>       }
>> @@ -103,7 +228,11 @@ static int
>>   hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>>         int channel, long val)
>>   {
>> +    struct hwm_drvdata *ddat = dev_get_drvdata(dev);
>> +
>>       switch (type) {
>> +    case hwmon_power:
>> +        return hwm_power_write(ddat, attr, channel, val);
>>       default:
>>           return -EOPNOTSUPP;
>>       }
>> @@ -124,11 +253,36 @@ static void
>>   hwm_get_preregistration_info(struct drm_i915_private *i915)
>>   {
>>       struct i915_hwmon *hwmon = i915->hwmon;
>> +    struct intel_uncore *uncore = &i915->uncore;
>> +    intel_wakeref_t wakeref;
>> +    u32 val_sku_unit;
>> -    if (IS_DG1(i915) || IS_DG2(i915))
>> +    if (IS_DG1(i915) || IS_DG2(i915)) {
>>           hwmon->rg.gt_perf_status = GEN12_RPSTAT1;
>> -    else
>> +        hwmon->rg.pkg_power_sku_unit = PCU_PACKAGE_POWER_SKU_UNIT;
>> +        hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
>> +        hwmon->rg.pkg_rapl_limit = PCU_PACKAGE_RAPL_LIMIT;
>> +    } else {
>>           hwmon->rg.gt_perf_status = INVALID_MMIO_REG;
>> +        hwmon->rg.pkg_power_sku_unit = INVALID_MMIO_REG;
>> +        hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
>> +        hwmon->rg.pkg_rapl_limit = INVALID_MMIO_REG;
>> +    }
>> +
>> +    with_intel_runtime_pm(uncore->rpm, wakeref) {
>> +        /*
>> +         * The contents of register hwmon->rg.pkg_power_sku_unit do 
>> not change,
>> +         * so read it once and store the shift values.
>> +         */
>> +        if (i915_mmio_reg_valid(hwmon->rg.pkg_power_sku_unit)) {
>> +            val_sku_unit = intel_uncore_read(uncore,
>> +                             hwmon->rg.pkg_power_sku_unit);
>> +        } else {
>> +            val_sku_unit = 0;
>> +        }
>> +
>> +        hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, 
>> val_sku_unit);
>> +    }
>>   }
>>   void i915_hwmon_register(struct drm_i915_private *i915)
>> diff --git a/drivers/gpu/drm/i915/i915_reg.h 
>> b/drivers/gpu/drm/i915/i915_reg.h
>> index 1a9bd829fc7e..55c35903adca 100644
>> --- a/drivers/gpu/drm/i915/i915_reg.h
>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>> @@ -1807,6 +1807,11 @@
>>   #define   POWER_LIMIT_1_MASK        REG_BIT(10)
>>   #define   POWER_LIMIT_2_MASK        REG_BIT(11)
>> +/*
>> + * *_PACKAGE_POWER_SKU - SKU power and timing parameters.
>> + */
>> +#define   PKG_PKG_TDP            GENMASK_ULL(14, 0)
>> +
>>   #define CHV_CLK_CTL1            _MMIO(0x101100)
>>   #define VLV_CLK_CTL2            _MMIO(0x101104)
>>   #define   CLK_CTL2_CZCOUNT_30NS_SHIFT    28
>> diff --git a/drivers/gpu/drm/i915/intel_mchbar_regs.h 
>> b/drivers/gpu/drm/i915/intel_mchbar_regs.h
>> index ffc702b79579..b74df11977c6 100644
>> --- a/drivers/gpu/drm/i915/intel_mchbar_regs.h
>> +++ b/drivers/gpu/drm/i915/intel_mchbar_regs.h
>> @@ -189,6 +189,10 @@
>>   #define  DG1_QCLK_RATIO_MASK            REG_GENMASK(9, 2)
>>   #define  DG1_QCLK_REFERENCE            REG_BIT(10)
>> +#define PCU_PACKAGE_POWER_SKU_UNIT        
>> _MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5938)
>> +#define   PKG_PWR_UNIT                REG_GENMASK(3, 0)
>> +#define   PKG_TIME_UNIT                REG_GENMASK(19, 16)
>> +
>>   #define GEN6_GT_PERF_STATUS            _MMIO(MCHBAR_MIRROR_BASE_SNB 
>> + 0x5948)
>>   #define GEN6_RP_STATE_LIMITS            _MMIO(MCHBAR_MIRROR_BASE_SNB 
>> + 0x5994)
>>   #define GEN6_RP_STATE_CAP            _MMIO(MCHBAR_MIRROR_BASE_SNB + 
>> 0x5998)
>> @@ -198,6 +202,8 @@
>>   #define GEN10_FREQ_INFO_REC            _MMIO(MCHBAR_MIRROR_BASE_SNB 
>> + 0x5ef0)
>>   #define   RPE_MASK                REG_GENMASK(15, 8)
>> +#define PCU_PACKAGE_RAPL_LIMIT            
>> _MMIO(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>> +#define   PKG_PWR_LIM_1                REG_GENMASK(14, 0)
>>   /* snb MCH registers for priority tuning */
>>   #define MCH_SSKPD                _MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5d10)
