Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C978B705662
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 20:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4C910E0B0;
	Tue, 16 May 2023 18:54:46 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2629010E0B0;
 Tue, 16 May 2023 18:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684263284; x=1715799284;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9bYnaPrf+wXO1T8ECkpRpvpJvSds/56e4gtsVDKX9pc=;
 b=XWmCgCiXvCG8l/0RbAGm1SUJztzj4O8o0Q8s1ZiFFvlQuDhAfUv0Qd6W
 qCRkFNOvd2h+Hd5GIFyIhdGqVwLhHjw8r5CMBcAi/TcHw441xIT+gKMLx
 Wc3gUPiWxWcUPaO1XpKMyevHhP1M+IVLCh0Bn4LQhbVqPvF9Cp7pRNKL7
 YX5J+zQVF9Z4WElORPh1BlsqAuhqWb9dMkawhHqwXgSNs8YgK5uHKm/dl
 ChPno1k9x0nEeMNUrXW6L3yY+HYcwsaH+9fWMuwfziOU2h30PcOuMP6aS
 1q2BkA5wGTRXkOVhDjqGFyac2OtUjZM18mSMxRcGatlUlomArPWNXS1P8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="349063627"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="349063627"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 11:54:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="678959851"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="678959851"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 16 May 2023 11:54:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 11:54:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 11:54:42 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 11:54:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=flhZYwe/MkpY21IxORuQHIBAdN2h2rcaEAPI3Cx3ei8YC7x6F0aw11Vn26fUmRKYf4DwEZIE3VYW/0+690zK/gTL/+T3kxVZsLrNOsttWHnOPSrJbkbMAaZXXfK2HcwZxtponeYjVrNErf7ylgU+cQroXgk1o5vMKeUXdkSL3ZER0vQvnxQ/V7EhJHMbUzGn7reo5zjLuLqmSUlU3V6d+myk/tmEaD/tXAZfvqv36UQVcB1i0Tfz6H1y+kgb5THSxuL3nBZ1MN/WoVGEJd1lpKbMx7KLejk+FzwPG3WjR2j8vW8bUz7ieEsQdjlAxQHlpGqbI68QK1O27ueRsOADhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYsiujCYbExKd6tl8WwtfzbtRAzN3insf0XQcz6yteE=;
 b=n4nXNtwabfkh+1F8WYsDVeqbqXKmCKTZ2MPB7xqMW5tURYuNfRAZ2NNtFrdXqyUUd8f8IAbPulogOqw+J6Uaioy2nI3tTWCXxJrM8hb1D4hwNl/ReVJAtE/ORTrdCEpEitn5uraZcUiESOOjzAfzLxL6X7qZO/XgwgQ+J2KD6fMcKifDhAjaeu4dirjqcYknX02+jzuV0sDVGNj1oUAmvpTfuxjAqOMuLgJ730OtFgveJYdDyaArvvFsc7zWC2iTcTl48RawP0K0RNQMEs6/yz5oA7bSLrP9Aj1xPGqwB14kZ7DgO2uxUdYb9yR5ilXKKoIFpAYbaeGYnVAYVmq8/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by SJ0PR11MB5631.namprd11.prod.outlook.com (2603:10b6:a03:3ae::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 18:54:35 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::5ec8:e1d9:fbae:5b2a]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::5ec8:e1d9:fbae:5b2a%4]) with mapi id 15.20.6387.033; Tue, 16 May 2023
 18:54:35 +0000
Message-ID: <8670b46a-c708-f6e0-a8d8-65acfc7a39c9@intel.com>
Date: Tue, 16 May 2023 11:54:32 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH v2 0/2] Add support for dumping error captures
 via kernel logging
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230418181744.3251240-1-John.C.Harrison@Intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20230418181744.3251240-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0033.namprd08.prod.outlook.com
 (2603:10b6:a03:100::46) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|SJ0PR11MB5631:EE_
X-MS-Office365-Filtering-Correlation-Id: c598aa0d-67c4-45a6-ae8a-08db563efdbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a6u0vYpEd0xR4Qb4bGJCL93vcdmnaJjoAHOhJOT1CXXMkheI2uBOs5zDXyIRTMxTBN9plXqLgP18obRDUix0x1+5616Jmvqeu5/njQOloangjil1nagz5Tp/7Gs1Az02pKqgyXljr8ksA4A8BA/f9/SULg9+8FrSb86W2JA6Ia8JE+Z/3OIkxO+6NB71Mdu3sIr9yi/qv6m+xzr+IflXxor8If127PVhAJ9tDbG1MSIe4/i4ITTyzouvimFXF7JUpo+OBv3aPcvmF8ucJYlqXikOOX9c87zj7Qamu4t18yTyiPDEBRmzziYXi5Fct0XgFv8nkEzxfwjHFOR+S21RH/uWnJ8UiqZF+pbabp9j6TBEb8ZJ+DeT3dtVHMvzgC5gVSlX5NLOTokdGQEy6GJFUH+TbOwZUdOUiJ9pjuqCZDMQ0UzBDhHXUs/kAF3pXi61NinraU3U6ObQ5/xrML2ORShOREf6VjCYnqhFZlGvQ/KqfCyKIU7tUrWsrS6816GIf7e1g7DUVMoMBI5fQxvqeVLq7miU/EYUFOO+R82h73tv+HZV3EF5j8gjRU7FUNXtiTvUR+CgEOJfgWEf2bdADq0XL3JF2uIvezFwPw2ZGlhu0DH+CRmr9wJPJ5ndakNMs9xrO8JtyAybRRlfYQ2fQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(366004)(346002)(136003)(376002)(451199021)(31686004)(66476007)(66556008)(450100002)(4326008)(66946007)(478600001)(6512007)(6506007)(53546011)(186003)(38100700002)(83380400001)(2616005)(36756003)(41300700001)(8936002)(2906002)(31696002)(8676002)(6666004)(6486002)(316002)(86362001)(5660300002)(82960400001)(4744005)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2J3NUJ4bk4zVHZYMWJWZVNsWXZ0M2RYN2QzazBiWWRkTzJ6RXowT3JmM3VB?=
 =?utf-8?B?RXpzdHZpTDBiUTVuU2txL2hWTzlZSVN5RmMrdHdjK245bkRBbGVmVi9QZTBY?=
 =?utf-8?B?UVhaZWR6dVp2aTkzQXdoNXRyQ1UyYklmcmhkdFZJaCtzQ2JCZFozcE1PL2Vz?=
 =?utf-8?B?bDVnckZHSlF3SXRTVDdKZVdWa1VRd2FjUXpwVGFUNkxHSzVmQThtdW9WZENy?=
 =?utf-8?B?UUNYMXNVcld1WDExTVM0ZFdIbGo3UkhNNlVCTzRYUGNXdk0xaWRqUFA2WXhQ?=
 =?utf-8?B?MUhETDJkWE1hSTNzTkxOQnpBMmc1SHZXK3ZKTS93R1A2eUlBMGQxVVc4TFR2?=
 =?utf-8?B?T3BOelFyUE4wVnc4MHMyRUUxSUxmQmk1M1dtdDFuSmQ2cmJsOWo4NmN6ZDZr?=
 =?utf-8?B?elJhZGRhSXNHZzhlSEl1U3NIbFp1SEVHRVpYUy92MUdFc2tMeDVvVmZSeU4w?=
 =?utf-8?B?V2UxNVV3V2ozVzNkMDRaZGJ2ckNkYnZJZlNKVmVVRjBiQ0FaeERoN0dUUWVJ?=
 =?utf-8?B?WkszWmlZWUVsWEhvMi9lZVk0RWRBMXhJd2Yyd1FwNStHbEh5bEJ0N3Nmbi9D?=
 =?utf-8?B?MWMrWEllcnBLcHgwSmFmL1RJQWtRVk8rQ1hGaVQrcmpuUVdOSTJBS09EWDlJ?=
 =?utf-8?B?d3lEci9BTkFwUHpJZjJlcm1jM3YzdU1yY0xkdEJLMGVra1VLZHRGemJxMDJY?=
 =?utf-8?B?dklQRXQxNzJzN2QwWExWNzBFM2NoMzZQRlNoQTUxWmxlYnRmenBhZncvcm80?=
 =?utf-8?B?RVJGM3FIMUlKTHFyai9PbmdsbmZteDlZVkJyLzJ2MjA2U0VNZkY3aHdhL29s?=
 =?utf-8?B?aVV3UGcwSW0wWEJyL1MrQXBDUm9VaWtQQ1lUOWhhbVFmdFEzYUlzdXN1d1pj?=
 =?utf-8?B?c1VIR3lMYjBpbUgwcDZtWHV2MmY1NlhBNFZEOEFsVFRRQjhlVnQ3NUFacnd2?=
 =?utf-8?B?Slp5YjNTZWRLcFVWSnNPNzdWL0ljdWhkc1BmT3lZcThQR0syRlp4T2RmakdC?=
 =?utf-8?B?SFFuWFE5bm13TVd5REJpN1FwVmd5cWcyTmZhTjVMVkNFcWZrTVNtOHR2aVEy?=
 =?utf-8?B?MWF6WlY5dWE1UUdLb1BmVHhiL0pJS2E1WU1ZdFVUa25kUTEwNXRSRnBXVkha?=
 =?utf-8?B?eUNnMVV3YzJ6dlBER2d2NCtvY1dsUWRwRGl0a1ZmS3h0a25VRnBqUk16T2xm?=
 =?utf-8?B?alplSDFKMFM0TjN3UVRDNHhodjgyTk9mU0tVbDFwRDBGVExPWXpRTkxwd2Y0?=
 =?utf-8?B?cm5qdTNUeXl2bHhINlVjMWFYODFSTkJRbmRSWDBNOGJYa2tDWnUxWXhYVTZM?=
 =?utf-8?B?Zzl2M0xFS2dUalkwK2VMTXVWQVMxTVI5VVdZOXBjTFdla0ZKWnVna0VZWm4y?=
 =?utf-8?B?cFQyL0MwMElhaTBCYm5FeUVoSVA3Y0QwMUM3YkpWY3ltSlRudmtaQ2ZjNFpT?=
 =?utf-8?B?alBuem9yVzdySkZLc3JyL0hpVWRzL3FOdk9FcEVCNWR5d2xDTFZraXpYQW42?=
 =?utf-8?B?OHNicnZJaTRzelkzd2J2RE5MaTVwU3BnNVdZa1AvdkZsZUpsQnJjbno0cm12?=
 =?utf-8?B?Y3BpTkZjMGhzc05IeS9VcWkzRmkwRUxKbElMUGtFQW9Mby84TTFZODhjRGFz?=
 =?utf-8?B?QU1MaXA3czFLZ3B6KzJURWlqVnhIRmNsVTJzUCtGQzVYVitBWGJSMzZrQjMr?=
 =?utf-8?B?b0cwZEJWc2p5T1d4OWRRcjVDZDdPWHVPWVIyNXR6Q2xGT0Q1RmVnUWVLa3dv?=
 =?utf-8?B?ZzhBNEFoZWxjRXBXaGpVdnFvcGhTSm9tODBHRTl0N3JiTUE5V0dsM1BFZHJD?=
 =?utf-8?B?YkNVTmwvQVRNd3N0QjI2cklFMXFYMkI3UmhvR1NkdFMxQjc5Zm1lVEdIK2Ro?=
 =?utf-8?B?MHdoS3F1bWxKOHdpaC9hVG9lazIzUEV4UWpIaEVGVzZZd3EycmpGRXV4VlFC?=
 =?utf-8?B?VHZpbkVsejNmNFJmNXJ1R0xCbUFzZXFobEU1NlhGUU1rdmpoUUdhazRFNkhj?=
 =?utf-8?B?OVpidWxNSW9yTG92UlphaUJFZGp2ZE5JMDZ5dUZpdkVPazRxdEx6N2JScmVr?=
 =?utf-8?B?OGRaWHcxVDJEL011aU1FT3NlRFh1N25MdFkxb1Q1TXIzeGdxekpvZ2gxbUJF?=
 =?utf-8?B?MFpxMGtiQk9McTR4aGo2bEJkV2pBUmRoWjkvWkhiMXp5SlV3RWVoTHhrR0hE?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c598aa0d-67c4-45a6-ae8a-08db563efdbc
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 18:54:35.0068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j13GbX1DBDjhhgNkfZlf61yR6gNVGodMPC8tHFY1B6kTi4QuwTz1YGwmI2TV1lV/VrZaW8GFaJoVFtKcqJkaOkq+FFZ4vZgcNv6lMzkob64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5631
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


On 4/18/2023 11:17 AM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> Sometimes, the only effective way to debug an issue is to dump all the
> interesting information at the point of failure. So add support for
> doing that.
>
> v2: Extra CONFIG wrapping (review feedback from Rodrigo)
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

series LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>
>
> John Harrison (2):
>    drm/i915: Dump error capture to kernel log
>    drm/i915/guc: Dump error capture to dmesg on CTB error
>
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c |  53 +++++++++
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |   6 +
>   drivers/gpu/drm/i915/i915_gpu_error.c     | 132 ++++++++++++++++++++++
>   drivers/gpu/drm/i915/i915_gpu_error.h     |  10 ++
>   4 files changed, 201 insertions(+)
>
