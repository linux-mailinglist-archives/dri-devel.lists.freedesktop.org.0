Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8285E7E7A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 17:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72EA10E418;
	Fri, 23 Sep 2022 15:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFE710E418;
 Fri, 23 Sep 2022 15:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663947262; x=1695483262;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eLDRxQnQiGVlnn4z9UVlz5zrhMiYXHEMyqAMqytLrEM=;
 b=LReQN9DLdAed3g7DkmzIQs/ybn1a0Iv47S8Il6kGIOndDjl8gBfuNKev
 0miRMDpQKl59DbB0jee/O9UyPd5LfAuty4gG5UZWwYuuBRj8QiVlznt19
 AWh6AdJrNqjU3XpZWKe0TwdDrXw7cyKNwB/I7/YEsZDSKkpNJn47LDb1E
 Cje/vvP3UepRVp+/dxEFzLeQsPq+xsTPdKf0Xk48irBXF5KKvlk6HU3wE
 bDKVfP5POn4WVBhC2TbcsNFvcJHiyhuFUfSIpWjKSWTqUxtPqs5WevoP6
 Q4fnsyMJy+lLOG0G0BWD75sQjnVs0aAy+oHNtfHPuQKj5Fe8GMbUXZsS2 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10479"; a="300599110"
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="300599110"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 08:34:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="795538467"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 23 Sep 2022 08:34:21 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 08:34:21 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 08:34:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 23 Sep 2022 08:34:20 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 23 Sep 2022 08:34:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E34EQyVaC692j5yIDyv4IRxLdPcPBh/Y3VyRrHayAfmgnh3A2/VlAOOsDz5sH/2qlidzeLrjxOI/DlEnscggSRo7CKqeRhDf6i1fmTGtBv2/2KXt4wKWPWe3eBV8gmddCacdIff4KPALbT6F9HbcLEAe30vDZedZmfVOZWkqB/0drbfZC6/ZgvGzyl15jy5BUkop89pPQcOBEilRXVuImBO5Zml+fmCnRKNddMD6hQZt6XFqH9wwGFS56+g6vkUbKTZ8SLYkX0Ew6/XbLPW8cjy8lzJAVLAMouXzMv1tjeP+gyNF2mfq+xw/eQAX228h3/mGz6pBZJz21Z6ubEzdmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTqhHqqADCzC0tt9wmFsqWQpL2IngD5YtVguD+2xKZw=;
 b=NaK1qKWujfOVBxplL3qMLMhSEmXVAivcm1x3AKlfGhqCDI5WZQ02O0nJbd+9L/EbU8+kbGCO/aCD9Wcoz1PfAWsRcuiCl5dpyvi/4xg3YpyOzhJ2AlagezBSjhL+EP7Qeh9K0gTJjeQhyM+WDE1ucybxBaIsYFO6bCMK8tFY9GFBlJoZXcecD9NSjnoddwTtFD2YiXIppNK+34OBg4avVAIS/rQqxsrFiTDTqWu4mE32Oj52P2Dah1RCSyQ2tGh4XtnSiPgY2UlR+SsfRZX2YsZ16PolY6Fw8Xc8uYclqB0AonaD/fsWOgT6BgigyTxFeY4SsiKO+HVfCOo0sBm8rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SA1PR11MB7110.namprd11.prod.outlook.com (2603:10b6:806:2b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.19; Fri, 23 Sep
 2022 15:34:18 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::280f:75b5:17ad:1668]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::280f:75b5:17ad:1668%3]) with mapi id 15.20.5654.020; Fri, 23 Sep 2022
 15:34:18 +0000
Message-ID: <366787f7-b606-a642-db2b-a913c9acbc20@intel.com>
Date: Fri, 23 Sep 2022 08:34:14 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [Intel-gfx] [PATCH 5/7] drm/i915/mtl: Handle wopcm per-GT and
 limit calculations.
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220922221117.458087-1-daniele.ceraolospurio@intel.com>
 <20220922221117.458087-6-daniele.ceraolospurio@intel.com>
 <87edw24f5g.fsf@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <87edw24f5g.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0177.namprd03.prod.outlook.com
 (2603:10b6:a03:338::32) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SA1PR11MB7110:EE_
X-MS-Office365-Filtering-Correlation-Id: bc3b56f4-f10e-4f41-cc09-08da9d791457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K4LgSpJp68Z0g+EEuZxHxAeRnay31LexjgsPW0HiIDnuqGwLZjcbgh4ByX4w3F1vLgUNkUYbsHakoaB6NDd30cECzO9zQvxvEBqeXGqxU76QZmNU8XgW/2bq3XXXwCmz+Qn8YAQakb9K4r3ZYkEQTH2JMEoBDg6IIRJPqOMRt6RSMTvwxKSlDobiZtM206/08sPiApKGZHoCCfQ3q9nubF9lX6l5w5KmTB0gjuUuWcTrx0zXwS4ct6xo2U0doPh7gHRbeFIy6wQ4y8u3crKga/Bsvv/7CWyeyWObg7ZiinDvEfNsCYeE6eMT/ekAsSdePbcPgePOh8gOL7I+XrzdI9U5c59AROpVMHBFQn2JUv3GBU0419XP0Ut9Y+fZSzmnvEn7D6XBMPGtUQFjXnlZ5vGaEMaFuS0d25OZ/EtKGQe5ktZLf7e7C+xlgU1mFjNG1ZNeePF/Ju/V1RavzdTTHqbZIw2+lWTasxBPjx3F5w7wW8J4K8O7EK/XtMbskDn7TFv+H75xi7UuganlTkmSfV6uv8OAiZPpCNBM5SKJfehBIMgplY72OrkiMaSRAFiRyrtIjSfub0FJvKxYR7xqahVYN4b7lvGIIWmyzr2p5vicST/JrrxlWc6K6FaFMeYbiGWZvbBFRxfp3SAdllnlrmJAt0q25Jrg9++MbpuRObZsiONbi1PC2gdUEAPtI1PhkDQeMylbAcp4upSYlMZjcprT0GCQjDVm5iV2lzX0snd0bRlRFEzv3XSe8XBgoLe+W9TEreRU9uRSjJmtm54Pw2yhlw/r9GerygQR3OvKN3Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199015)(31686004)(26005)(66899012)(5660300002)(53546011)(36756003)(83380400001)(82960400001)(66556008)(66476007)(66946007)(31696002)(38100700002)(86362001)(6486002)(6666004)(2616005)(6506007)(6512007)(478600001)(8936002)(186003)(316002)(4326008)(8676002)(41300700001)(30864003)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXpIWmZlS01mR2xEaDExcW1KUlZscjN6UndHMHRWZ05QVDVSVUNITG0vTGd3?=
 =?utf-8?B?QkY3OUhOakdFQzgvZmpWS2FXZVpYWHNBWmVob2tKQnpFcEF0WEZPZzFtQU1R?=
 =?utf-8?B?NG1KelB6ZVZicnlvdnc0d2g0QkpLcnBnQWQycDM4bVdOT0ZTZ05iNWJnNDAz?=
 =?utf-8?B?M29OeEcvUEdkbE5JWE1HbVJQNGxWYzhZbnkxRzBKclF4ZmVuL0FCVUVDU0Rz?=
 =?utf-8?B?M2pwQjU5MFdBZTFhSWNuTExPSVNteStHbFMzMjRIN29zRkMwcHZ0SXYyUW5i?=
 =?utf-8?B?R2I1MkJYbXBLMEZZR3JxTzFiNVcyaDBXUHkrRnNtUVVKZG9jR1FkaDIzQ0V0?=
 =?utf-8?B?TDBmM2E3R1RMUUhNeTVIdXBncTZkdTZmeE1NNGQxT2NaQkZ3WnRLcCtYSUZk?=
 =?utf-8?B?SXhnUldZNk13MU16N0xEVmFCUnV0OTh3UFMxOEQ3dUhWY3hJeEswM2pYb1Bo?=
 =?utf-8?B?alBBcVpiVnZWb29XaG9HKy96cVJ0QWt0dDc0RHJnWUtrUG9QV0dLays3bkVI?=
 =?utf-8?B?NHIvUTRmVC8vT0wwUzc5Mk9TYmVvMEZMZENLMDhjdnN6MW01cHRHYzYvNkhk?=
 =?utf-8?B?ZVBuMjg1S3BGdkQxNjZBUGwzdG5sZUJOaUorSjFWMHk0aFh4MVVDQkFKZUo5?=
 =?utf-8?B?TGRQbXRoelc3dDlUNUY0YnFXajJ1N2FIZE5DSXd2NzlHUklweDBKdkV0Yy8v?=
 =?utf-8?B?SU5DTHJRQXlmUUp6a2J0THBsK2psbzhid1ZESCtFeEZzM3M0dVpRSDcya0Zl?=
 =?utf-8?B?QXZ4cGdQV2JtanU0Wm1ieEh5WVNhYjFPVS9VMUh3MUtERUdzNXBYaU1zQkxO?=
 =?utf-8?B?QlAwVnVxNmxQdnhNdkNlSU9ib2hGS2U4VWpkRjlGNnVFQ1hoOWRRT1lzY1E1?=
 =?utf-8?B?Zjl1ZW12Y0RzSWdJamFmUWpSUUZFQ2w5L0FPZXkxSGlOVUtSMjVpZnhOMVZo?=
 =?utf-8?B?bnI1bndZaTE1MVFjNWt4RXIxTGFnMW1xQldWVHdORUdqbGoyNzQzWkluNVc4?=
 =?utf-8?B?S1ZNUXpab1dpd3RQcm9GT2lxZEgxbHl0dGdBY1RDWmM0U2VINVlGWGo5Zitv?=
 =?utf-8?B?WXUxUWhxdFRuU2szSmRmcVZKMXdTVTFVTTVsQVRNejNOd3BkVXNnbk50ckEy?=
 =?utf-8?B?ZTd6eGwzL2FjeVZkMmg5TzdNOUtZckJoZUowNEJRSWhXSkJCRzJ4OUFXc1kx?=
 =?utf-8?B?aWJ2R2cxWXFHQXFiM0E5Q0REN29ucnFQeldoUEhCMy9lKzBadzJwR0Fob0lY?=
 =?utf-8?B?aVNpOTlsWTFoMStaRmxoSWF3bTcvZnNNczZmRWMrNGw5Zm41eXJSS2lOalZ6?=
 =?utf-8?B?bk1TNVVDN3FLM3NxeE1ZUFBjUnBsRDZuaWVOZ0doejVWWjZrZ3dBNFU3d2xS?=
 =?utf-8?B?VEpmYkRWaXBhMXV6WXRUa3ltYS9wbmlsY1VFWklUZUo2dnRJR3Bqc0hxeEpX?=
 =?utf-8?B?NGQ1MFBmR20rdUlpa2p3MU83RTVoS2M5U1A3RTB5bzQ2TEIwTy9CNmdWdmJS?=
 =?utf-8?B?MjFrcnpGa1dQQXRObzJ1bmZ6MWdiSFpFYnVHZ2paMUMwcTlsZHJrbS9WOGdl?=
 =?utf-8?B?M2VqalpLS0xYTFBOYnAxUUJVTzU3RWlacDRmb2J5SW9MS3RxRkxVWEFCMXo3?=
 =?utf-8?B?T1QxWWgvdm9QaFNMeWh4MVJGdTBTYTVweXNlTVZXVzJsZE9YUHgvRUx6VTNK?=
 =?utf-8?B?enZnYW1VWkdmVFp4QUMzV2ljeXNSMXhBcUllRnlUdUhkTU8rQ2dJSWlWN0Ni?=
 =?utf-8?B?S1RweG9ZdTk2NGJNWDlML0N5cTlXWVcrRzhMcVVHZEgwTDlwSElTc0UxZkY1?=
 =?utf-8?B?Qytvak1UK1AvcDRkNjJkMDJtTHZkQWdwQ21WUE45SGZBY1hOMXlMM3RiRGVY?=
 =?utf-8?B?eXdjL0NFdDNFUHFjNEdEaWQxZUFvVGhEZTlrNldDeGJLSnRHMktWT3BWS1Av?=
 =?utf-8?B?UVhJQWl5TDZ1cnBwR25Od3N2NDUwQjdhcVlHb0pkUDcwaldtYXc0TjdZcnpN?=
 =?utf-8?B?VEEwOFRWY25wQ2Zkb29IZ1FuRVJzbU9NdnNHT21kRW9uUm00bU5JTGJsOUhS?=
 =?utf-8?B?S25MNzYzRjZxMG05d29wMmdRQ2Z6MElDWGhSQ1JmVVJMS1BCMjlTaUFuMTBN?=
 =?utf-8?B?Sjg3ZjhOUXJrSkZZQlRtc0N3NWZMKzdZdXR1bFpQSmMzRFUrTEc2Y3V2RldN?=
 =?utf-8?Q?+x0oLAhVT0GELzekWPQqGMA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc3b56f4-f10e-4f41-cc09-08da9d791457
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 15:34:18.7060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zH8FyQ18WTAdkePgXIMRLaESV1qEMnAcK7DepiII55RVDrJ9JI4sR1EPreJHPUdSwEA+yOxNXCnHPLZpUTyJF0AyLkbH5NQ9aKv9baqkAI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7110
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
Cc: dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/23/2022 2:24 AM, Jani Nikula wrote:
> On Thu, 22 Sep 2022, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> wrote:
>> From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>
>> With MTL standalone media architecture the wopcm layout has changed with
>> separate partitioning in WOPCM for GCD/GT GuC and SA Media GuC. The size
>> of WOPCM is 4MB with lower 2MB for SA Media and upper 2MB for GCD/GT.
>>
>>      +=====+===> +====================+ <== WOPCM TOP
>>      ^     ^     |                    |
>>      |     |     |                    |
>>      |    GCD    |   GCD RC6 Image    |
>>      |    GuC    |    Power Context   |
>>      |    WOPCM  |                    |
>>      |    Size   +--------------------+
>>      |     |     |   GCD GuC Image    |
>>      |     |     |                    |
>>      |     v     |                    |
>>      |     +===> +====================+ <== SA Media GuC WOPCM Top
>>      |     ^     |                    |
>>      |   SA Media|                    |
>>      |    GuC    | SA Media RC6 Image |
>>      |   WOPCM   |    Power Context   |
>>      |    Size   |                    |
>>    WOPCM   |     +--------------------+
>>      |     |     |                    |
>>      |     |     | SA Media GuC Image |
>>      |     v     |                    |
>>      |     +===> +====================+ <== GuC WOPCM base
>>      |           |     WOPCM RSVD     |
>>      |           +------------------- + <== HuC Firmware Top
>>      v           |      HuC FW        |
>>      +=========> +====================+ <== WOPCM Base
>>
>> Given that MTL has GuC deprivilege, the WOPCM registers are pre-locked
>> by the bios. Therefore, we can skip all the math for the partitioning
>> and just limit ourselves to sanity checking the values.
>>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: John Harrison <john.c.harrison@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> ---
>>   drivers/gpu/drm/i915/Makefile               |  7 +--
>>   drivers/gpu/drm/i915/gt/intel_ggtt.c        |  2 +-
>>   drivers/gpu/drm/i915/gt/intel_gt.c          |  1 +
>>   drivers/gpu/drm/i915/gt/intel_gt_types.h    |  2 +
>>   drivers/gpu/drm/i915/{ => gt}/intel_wopcm.c | 48 +++++++++++++++------
>>   drivers/gpu/drm/i915/{ => gt}/intel_wopcm.h |  0
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c       |  4 +-
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c    | 14 +++---
>>   drivers/gpu/drm/i915/i915_driver.c          |  2 -
>>   drivers/gpu/drm/i915/i915_drv.h             |  3 --
>>   drivers/gpu/drm/i915/i915_gem.c             |  5 ++-
>>   11 files changed, 56 insertions(+), 32 deletions(-)
>>   rename drivers/gpu/drm/i915/{ => gt}/intel_wopcm.c (86%)
>>   rename drivers/gpu/drm/i915/{ => gt}/intel_wopcm.h (100%)
>>
>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>> index a26edcdadc21..6ed4c745b226 100644
>> --- a/drivers/gpu/drm/i915/Makefile
>> +++ b/drivers/gpu/drm/i915/Makefile
>> @@ -129,7 +129,9 @@ gt-y += \
>>   	gt/intel_timeline.o \
>>   	gt/intel_workarounds.o \
>>   	gt/shmem_utils.o \
>> -	gt/sysfs_engines.o
>> +	gt/sysfs_engines.o \
>> +	gt/intel_wopcm.o
> The comment near the top of the file:
>
> # Please keep these build lists sorted!

D'oh! My monkey brain saw that "wopcm" was correctly ordered after 
"engines" and completely ignored the first part of the name :/
Will fix next rev.

Daniele

>
>> +
>>   # x86 intel-gtt module support
>>   gt-$(CONFIG_X86) += gt/intel_ggtt_gmch.o
>>   # autogenerated null render state
>> @@ -183,8 +185,7 @@ i915-y += \
>>   	  i915_trace_points.o \
>>   	  i915_ttm_buddy_manager.o \
>>   	  i915_vma.o \
>> -	  i915_vma_resource.o \
>> -	  intel_wopcm.o
>> +	  i915_vma_resource.o
>>   
>>   # general-purpose microcontroller (GuC) support
>>   i915-y += gt/uc/intel_uc.o \
>> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> index 30cf5c3369d9..605e1aa674d4 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> @@ -560,7 +560,7 @@ static int init_ggtt(struct i915_ggtt *ggtt)
>>   	 * why.
>>   	 */
>>   	ggtt->pin_bias = max_t(u32, I915_GTT_PAGE_SIZE,
>> -			       intel_wopcm_guc_size(&ggtt->vm.i915->wopcm));
>> +			       intel_wopcm_guc_size(&ggtt->vm.gt->wopcm));
>>   
>>   	ret = intel_vgt_balloon(ggtt);
>>   	if (ret)
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
>> index b367cfff48d5..a95eb0b656d2 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>> @@ -56,6 +56,7 @@ void intel_gt_common_init_early(struct intel_gt *gt)
>>   	seqcount_mutex_init(&gt->tlb.seqno, &gt->tlb.invalidate_lock);
>>   	intel_gt_pm_init_early(gt);
>>   
>> +	intel_wopcm_init_early(&gt->wopcm);
>>   	intel_uc_init_early(&gt->uc);
>>   	intel_rps_init_early(&gt->rps);
>>   }
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> index f19c2de77ff6..c20a32d2700f 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> @@ -30,6 +30,7 @@
>>   #include "intel_migrate_types.h"
>>   #include "intel_wakeref.h"
>>   #include "pxp/intel_pxp_types.h"
>> +#include "intel_wopcm.h"
>>   
>>   struct drm_i915_private;
>>   struct i915_ggtt;
>> @@ -97,6 +98,7 @@ struct intel_gt {
>>   
>>   	struct intel_uc uc;
>>   	struct intel_gsc gsc;
>> +	struct intel_wopcm wopcm;
>>   
>>   	struct {
>>   		/* Serialize global tlb invalidations */
>> diff --git a/drivers/gpu/drm/i915/intel_wopcm.c b/drivers/gpu/drm/i915/gt/intel_wopcm.c
>> similarity index 86%
>> rename from drivers/gpu/drm/i915/intel_wopcm.c
>> rename to drivers/gpu/drm/i915/gt/intel_wopcm.c
>> index 322fb9eeb880..487fbbbdf3d6 100644
>> --- a/drivers/gpu/drm/i915/intel_wopcm.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_wopcm.c
>> @@ -43,6 +43,7 @@
>>   /* Default WOPCM size is 2MB from Gen11, 1MB on previous platforms */
>>   #define GEN11_WOPCM_SIZE		SZ_2M
>>   #define GEN9_WOPCM_SIZE			SZ_1M
>> +#define XELPM_SAMEDIA_WOPCM_SIZE	SZ_2M
>>   #define MAX_WOPCM_SIZE			SZ_8M
>>   /* 16KB WOPCM (RSVD WOPCM) is reserved from HuC firmware top. */
>>   #define WOPCM_RESERVED_SIZE		SZ_16K
>> @@ -64,9 +65,9 @@
>>   #define GEN9_GUC_FW_RESERVED	SZ_128K
>>   #define GEN9_GUC_WOPCM_OFFSET	(GUC_WOPCM_RESERVED + GEN9_GUC_FW_RESERVED)
>>   
>> -static inline struct drm_i915_private *wopcm_to_i915(struct intel_wopcm *wopcm)
>> +static inline struct intel_gt *wopcm_to_gt(struct intel_wopcm *wopcm)
>>   {
>> -	return container_of(wopcm, struct drm_i915_private, wopcm);
>> +	return container_of(wopcm, struct intel_gt, wopcm);
>>   }
>>   
>>   /**
>> @@ -77,7 +78,8 @@ static inline struct drm_i915_private *wopcm_to_i915(struct intel_wopcm *wopcm)
>>    */
>>   void intel_wopcm_init_early(struct intel_wopcm *wopcm)
>>   {
>> -	struct drm_i915_private *i915 = wopcm_to_i915(wopcm);
>> +	struct intel_gt *gt = wopcm_to_gt(wopcm);
>> +	struct drm_i915_private *i915 = gt->i915;
>>   
>>   	if (!HAS_GT_UC(i915))
>>   		return;
>> @@ -157,14 +159,18 @@ static bool check_hw_restrictions(struct drm_i915_private *i915,
>>   	return true;
>>   }
>>   
>> -static bool __check_layout(struct drm_i915_private *i915, u32 wopcm_size,
>> +static bool __check_layout(struct intel_gt *gt, u32 wopcm_size,
>>   			   u32 guc_wopcm_base, u32 guc_wopcm_size,
>>   			   u32 guc_fw_size, u32 huc_fw_size)
>>   {
>> +	struct drm_i915_private *i915 = gt->i915;
>>   	const u32 ctx_rsvd = context_reserved_size(i915);
>>   	u32 size;
>>   
>>   	size = wopcm_size - ctx_rsvd;
>> +	if (MEDIA_VER(i915) >= 13)
>> +		size += XELPM_SAMEDIA_WOPCM_SIZE;
>> +
>>   	if (unlikely(range_overflows(guc_wopcm_base, guc_wopcm_size, size))) {
>>   		drm_err(&i915->drm,
>>   			"WOPCM: invalid GuC region layout: %uK + %uK > %uK\n",
>> @@ -181,12 +187,14 @@ static bool __check_layout(struct drm_i915_private *i915, u32 wopcm_size,
>>   		return false;
>>   	}
>>   
>> -	size = huc_fw_size + WOPCM_RESERVED_SIZE;
>> -	if (unlikely(guc_wopcm_base < size)) {
>> -		drm_err(&i915->drm, "WOPCM: no space for %s: %uK < %uK\n",
>> -			intel_uc_fw_type_repr(INTEL_UC_FW_TYPE_HUC),
>> -			guc_wopcm_base / SZ_1K, size / SZ_1K);
>> -		return false;
>> +	if (VDBOX_MASK(gt)) {
>> +		size = huc_fw_size + WOPCM_RESERVED_SIZE;
>> +		if (unlikely(guc_wopcm_base < size)) {
>> +			drm_err(&i915->drm, "WOPCM: no space for %s: %uK < %uK\n",
>> +				intel_uc_fw_type_repr(INTEL_UC_FW_TYPE_HUC),
>> +				guc_wopcm_base / SZ_1K, size / SZ_1K);
>> +			return false;
>> +		}
>>   	}
>>   
>>   	return check_hw_restrictions(i915, guc_wopcm_base, guc_wopcm_size,
>> @@ -228,8 +236,8 @@ static bool __wopcm_regs_writable(struct intel_uncore *uncore)
>>    */
>>   void intel_wopcm_init(struct intel_wopcm *wopcm)
>>   {
>> -	struct drm_i915_private *i915 = wopcm_to_i915(wopcm);
>> -	struct intel_gt *gt = to_gt(i915);
>> +	struct intel_gt *gt = wopcm_to_gt(wopcm);
>> +	struct drm_i915_private *i915 = gt->i915;
>>   	u32 guc_fw_size = intel_uc_fw_get_upload_size(&gt->uc.guc.fw);
>>   	u32 huc_fw_size = intel_uc_fw_get_upload_size(&gt->uc.huc.fw);
>>   	u32 ctx_rsvd = context_reserved_size(i915);
>> @@ -274,6 +282,19 @@ void intel_wopcm_init(struct intel_wopcm *wopcm)
>>   		goto check;
>>   	}
>>   
>> +	/*
>> +	 * On platforms with a media GT, the WOPCM is partitioned between the
>> +	 * two GTs, so we would have to take that into account when doing the
>> +	 * math below. There is also a new section reserved for the GSC ctx
>> +	 * that w would have to factor in. However, all platforms with a media
>> +	 * GT also have GuC depriv enabled, so the WOPCM regs are pre-locked
>> +	 * and therefore we don't have to do the math ourselves.
>> +	 */
>> +	if (unlikely(i915->media_gt)) {
>> +		drm_err(&i915->drm, "Unlocked WOPCM regs with media GT\n");
>> +		return;
>> +	}
>> +
>>   	/*
>>   	 * Aligned value of guc_wopcm_base will determine available WOPCM space
>>   	 * for HuC firmware and mandatory reserved area.
>> @@ -289,13 +310,14 @@ void intel_wopcm_init(struct intel_wopcm *wopcm)
>>   
>>   	/* Aligned remainings of usable WOPCM space can be assigned to GuC. */
>>   	guc_wopcm_size = wopcm_size - ctx_rsvd - guc_wopcm_base;
>> +
>>   	guc_wopcm_size &= GUC_WOPCM_SIZE_MASK;
>>   
>>   	drm_dbg(&i915->drm, "Calculated GuC WOPCM [%uK, %uK)\n",
>>   		guc_wopcm_base / SZ_1K, guc_wopcm_size / SZ_1K);
>>   
>>   check:
>> -	if (__check_layout(i915, wopcm_size, guc_wopcm_base, guc_wopcm_size,
>> +	if (__check_layout(gt, wopcm_size, guc_wopcm_base, guc_wopcm_size,
>>   			   guc_fw_size, huc_fw_size)) {
>>   		wopcm->guc.base = guc_wopcm_base;
>>   		wopcm->guc.size = guc_wopcm_size;
>> diff --git a/drivers/gpu/drm/i915/intel_wopcm.h b/drivers/gpu/drm/i915/gt/intel_wopcm.h
>> similarity index 100%
>> rename from drivers/gpu/drm/i915/intel_wopcm.h
>> rename to drivers/gpu/drm/i915/gt/intel_wopcm.h
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> index dbd048b77e19..4cd8a787f9e5 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> @@ -357,8 +357,8 @@ static int uc_init_wopcm(struct intel_uc *uc)
>>   {
>>   	struct intel_gt *gt = uc_to_gt(uc);
>>   	struct intel_uncore *uncore = gt->uncore;
>> -	u32 base = intel_wopcm_guc_base(&gt->i915->wopcm);
>> -	u32 size = intel_wopcm_guc_size(&gt->i915->wopcm);
>> +	u32 base = intel_wopcm_guc_base(&gt->wopcm);
>> +	u32 size = intel_wopcm_guc_size(&gt->wopcm);
>>   	u32 huc_agent = intel_uc_uses_huc(uc) ? HUC_LOADING_AGENT_GUC : 0;
>>   	u32 mask;
>>   	int err;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> index d6ca772e9f4b..a9ff9abb66db 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> @@ -469,10 +469,11 @@ static int check_gsc_manifest(const struct firmware *fw,
>>   	return 0;
>>   }
>>   
>> -static int check_ccs_header(struct drm_i915_private *i915,
>> +static int check_ccs_header(struct intel_gt *gt,
>>   			    const struct firmware *fw,
>>   			    struct intel_uc_fw *uc_fw)
>>   {
>> +	struct drm_i915_private *i915 = gt->i915;
>>   	struct uc_css_header *css;
>>   	size_t size;
>>   
>> @@ -514,10 +515,10 @@ static int check_ccs_header(struct drm_i915_private *i915,
>>   
>>   	/* Sanity check whether this fw is not larger than whole WOPCM memory */
>>   	size = __intel_uc_fw_get_upload_size(uc_fw);
>> -	if (unlikely(size >= i915->wopcm.size)) {
>> +	if (unlikely(size >= gt->wopcm.size)) {
>>   		drm_warn(&i915->drm, "%s firmware %s: invalid size: %zu > %zu\n",
>>   			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
>> -			 size, (size_t)i915->wopcm.size);
>> +			 size, (size_t)gt->wopcm.size);
>>   		return -E2BIG;
>>   	}
>>   
>> @@ -545,7 +546,8 @@ static int check_ccs_header(struct drm_i915_private *i915,
>>    */
>>   int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>>   {
>> -	struct drm_i915_private *i915 = __uc_fw_to_gt(uc_fw)->i915;
>> +	struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
>> +	struct drm_i915_private *i915 = gt->i915;
>>   	struct intel_uc_fw_file file_ideal;
>>   	struct device *dev = i915->drm.dev;
>>   	struct drm_i915_gem_object *obj;
>> @@ -553,7 +555,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>>   	bool old_ver = false;
>>   	int err;
>>   
>> -	GEM_BUG_ON(!i915->wopcm.size);
>> +	GEM_BUG_ON(!gt->wopcm.size);
>>   	GEM_BUG_ON(!intel_uc_fw_is_enabled(uc_fw));
>>   
>>   	err = i915_inject_probe_error(i915, -ENXIO);
>> @@ -595,7 +597,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>>   	if (uc_fw->loaded_via_gsc)
>>   		err = check_gsc_manifest(fw, uc_fw);
>>   	else
>> -		err = check_ccs_header(i915, fw, uc_fw);
>> +		err = check_ccs_header(gt, fw, uc_fw);
>>   	if (err)
>>   		goto fail;
>>   
>> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
>> index 9d1fc2477f80..51fc030774fa 100644
>> --- a/drivers/gpu/drm/i915/i915_driver.c
>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>> @@ -369,8 +369,6 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
>>   	if (ret)
>>   		goto err_ttm;
>>   
>> -	intel_wopcm_init_early(&dev_priv->wopcm);
>> -
>>   	ret = intel_root_gt_init_early(dev_priv);
>>   	if (ret < 0)
>>   		goto err_rootgt;
>> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>> index 8ca575202e5d..587e43ad7941 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.h
>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>> @@ -63,7 +63,6 @@
>>   #include "intel_runtime_pm.h"
>>   #include "intel_step.h"
>>   #include "intel_uncore.h"
>> -#include "intel_wopcm.h"
>>   
>>   struct drm_i915_clock_gating_funcs;
>>   struct drm_i915_gem_object;
>> @@ -236,8 +235,6 @@ struct drm_i915_private {
>>   
>>   	struct intel_gvt *gvt;
>>   
>> -	struct intel_wopcm wopcm;
>> -
>>   	struct pci_dev *bridge_dev;
>>   
>>   	struct rb_root uabi_engines;
>> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
>> index a5b192ac885c..cfc8b17c1ee5 100644
>> --- a/drivers/gpu/drm/i915/i915_gem.c
>> +++ b/drivers/gpu/drm/i915/i915_gem.c
>> @@ -1140,9 +1140,10 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
>>   	if (ret)
>>   		return ret;
>>   
>> -	for_each_gt(gt, dev_priv, i)
>> +	for_each_gt(gt, dev_priv, i) {
>>   		intel_uc_fetch_firmwares(&gt->uc);
>> -	intel_wopcm_init(&dev_priv->wopcm);
>> +		intel_wopcm_init(&gt->wopcm);
>> +	}
>>   
>>   	ret = i915_init_ggtt(dev_priv);
>>   	if (ret) {

