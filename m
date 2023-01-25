Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FA767BF88
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 23:04:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF7810E2AD;
	Wed, 25 Jan 2023 22:04:46 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDA510E244;
 Wed, 25 Jan 2023 22:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674684283; x=1706220283;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OQdVwP4ThbeliDGug5Oz9UVyhXioitZIACLLWvPZkm4=;
 b=kIEQNQzPBEC/sMdIlzUJJp4eX5w+RKMKMLhi1qZktX9J++X3SFdqkPh6
 aPR/cFtiEYhbCqdOtaktj/yRDoFGwqYidy/fYMGraJ7plaeDdPxzb5nQH
 3Ra7f0bQBQDqasNsC9vkUYcVy+R39rcLVxYL7ukFPN7GjYqvBfQCCoO+p
 Ch7Aa3FqeafSnE2U35X0SSfRoKdki4TmNomIR/XOa5tB0+KLIbKsmQdLk
 eLToy3qisdzMJ49N2Je1vL2MQoIJ2rv7gY+cPTpQVnJzvI7jfche86F/6
 aKmfqmWDW70u8I/eFQw+7c5qo9+nJ0NVOkC6zSx9KjIjOEuCo2dHPbqeR A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="314596556"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="314596556"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 14:04:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="612589990"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="612589990"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 25 Jan 2023 14:04:43 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 25 Jan 2023 14:04:42 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 25 Jan 2023 14:04:42 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 25 Jan 2023 14:04:42 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 25 Jan 2023 14:04:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m8kw+96LNV8Zug/qg7pokqZt7fYvEEQHZZWf+3+oBMjCeevoD7dm/jxt+M8vn9S0FzrTrN6PtaHjE05/46jnMJI87Pb4gBRy1zEVTkFaw8sqv850nl07xSB0aWEnkvLPrwMjwCKYU5HGWxO5F8kYwlOKmt8xzcQxoUJ0+b61txRX/3QxUgaeXTRDaWO7avC/Emo479ZOV0aE8+kYqJJQiCaaddIEPGS0Jr6//wPChbg3fZ7juJHKQ/O5LYKX+PqTibzYoN+CeaXykOz1+BP17eJNYBR0zPamJveIz1qwz7XVLI+X8kwfMZSKLK7Zqv1jBf4dPq0YK+p7yRkMvitNrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3hcbCs0TEsatHe4RFNgWokuTA/YwP+rFyW4vi3uVgI=;
 b=iWUdMh3lVZJ0Jo+c9G+kQPfo/B5tODeNb6DXak6MT3de0f6rnaE4pdUPULneSm+FItpv0WGG0x65mnUO72IOiCtb4BegkKtlDeJbGbfNiJlpjf3mSCfFNaT7dt//WjyfZqLrP9qEv5P0KqW+jhHsbprPpgFV1wFoUCHmLSJxX07Vw0zBsTBhvPo4LuaklWUoKLZy+pUdnMxKO9PLM9tVrXVR+FT4fgE3/m6ke7oIp4w1rm93TJQdztMdY84yYEYWNTJ0qoLVIAp10CG+ehLUh9eS6PeqzW4ngJx3ykUT2yNE5CQyoLTLpt9lU5ntvQcM4jYHmP+3nqTpUWstKpjIkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH0PR11MB7421.namprd11.prod.outlook.com (2603:10b6:510:281::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Wed, 25 Jan
 2023 22:04:40 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb%2]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 22:04:40 +0000
Message-ID: <147f4a46-7349-3158-5799-1643bfdf13a6@intel.com>
Date: Wed, 25 Jan 2023 14:04:30 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH v4 1/7] drm/i915: Fix request locking during error capture
 & debugfs dump
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230120232831.28177-1-John.C.Harrison@Intel.com>
 <20230120232831.28177-2-John.C.Harrison@Intel.com>
 <fd011cd7-7212-ff77-0e1d-56cdc1372e3a@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <fd011cd7-7212-ff77-0e1d-56cdc1372e3a@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: RO2P152CA0031.LAMP152.PROD.OUTLOOK.COM (2603:10d6:10:28::6)
 To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|PH0PR11MB7421:EE_
X-MS-Office365-Filtering-Correlation-Id: 09bf376d-55b6-47e9-19d6-08daff202813
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eWEROxphmhZJLtyGPfCEGIbNTlJkqEzzm/GYSvXoHK9xG+Nky6mp9PBdKj53L/rKPV70lISx/eNCXBYmGlQ461F/6/p8HffKOCxA9RBLPf0djkrBXZv7/hGNX8SHBEgEeGqFZYChPYSN4I3LQgKLShIo6qzFXyHnzgioqxyKlufmfP8SLXJ/ZJg0dCay51lv6ybHmAg29t1pxHyz4Jw3BFowS4lweIrxlgJn1fUnNY0oSAEv6WNZCX78isQqXcG5yhwhgkYlxTo8nAPjd8UblV3l+wlr//NNpZOqBLKI9NG7bF38H+HSsNfHMjMGfbbi0yvmC1bmJbyAA84GCoio2LyL87XnUjxTnuqDKocsGP3IdUTwXloxSq5fwCdag6xpMI3KBTfT2vNAgTpWzFZ8fCLbKBMK1kSKnCY9+fjHjSYnOI3FhWH8sCTVpeeongNXJjA14qOpjxQnoOxDfueYWWpG4uY52Vkt/dSObRyCWF9irks69DsO2am43Ty8njBfCPiNNdQ+RG63FWyjl0z8Q+bhvIm7F5Yuhg8QDIc03nxAO9TIzhbamacMcpbCWO29MJqLamT2cdaTqw0tLlKrQe6BtUaDoESz8CwboHlZEeB7XUTnUBUo4r5JQOmWKivIZHhNlg4hv219ykIxgYz65veT16M7wl0yPaHW6Yf1g52uG6TXSkn2o+JLNw0vc0GENIHgK+gjuX5GHoLdLnjnNW/gZCrvcaOK1Ep6qtqhzpM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199018)(5660300002)(186003)(2906002)(66946007)(4326008)(8936002)(66556008)(8676002)(66476007)(31686004)(41300700001)(83380400001)(6486002)(478600001)(6666004)(6506007)(53546011)(6512007)(26005)(316002)(2616005)(38100700002)(82960400001)(4744005)(36756003)(86362001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXhtMkhqbk9Icm40dnUyYkx3d3o4R0JoZGZGMCtHc0RMWnlGaCs2eW5WTEls?=
 =?utf-8?B?N0s0Q1h6OFdGbmw0U2MzRWVsWTNOL1hFSEFaWXlZWDNDSW04SFZsc1dSZkg2?=
 =?utf-8?B?ZUZPdi9QNmw5QktkWm9jU2VCU3FaTXlzaHI1V1VPN0RPdldINTNzZkk1RWZW?=
 =?utf-8?B?OTF6S2dERERxZS9lK0hjWGV5WVpzK3JuL1hzRzBPZ01Hb1NlbkNpakdVRWE0?=
 =?utf-8?B?UnUwbHNKWjN2RjV5ZU80OXFVRENZcTl1aHB4aFQyYXJGUDUwZXhrZktMdnFh?=
 =?utf-8?B?Sm04Y2E1RURLVTRabEZ6NGxKemJuWWhyZW9WN1Y1NzRuZFhmZUdYeXhUOERs?=
 =?utf-8?B?N3pHRHVtSkpaQ0ZEaGkxUXY2MHZCV2xCaC91UFNWTnlERXdGZzI3RlRCTFV2?=
 =?utf-8?B?MHlpZkVhUEdKbDU0QytQdDhiVzhLMXNvK2c4a2x4aVRWTVFZd1BHc0x2Rk1X?=
 =?utf-8?B?aXBVRk15UzJaS1NUeGxDNVp0RXBrejhFemxVS1RTUitrSkwwK3R2ZTlDcnFV?=
 =?utf-8?B?UFNQbGZLUVcwRVhiRmlLUTNMbzJXdyttcnBIdEhyWFNTTThkT3gzZURNdlV6?=
 =?utf-8?B?L1pBUnJ4NjJ1V3RWWXBabE5QOStNa0I4QzV2eGJuSFk5d243VnNyN0htNVht?=
 =?utf-8?B?ekZSenNvcXNpSEJRek1xWmNSRTIvY1V0WHNPeFp3RXpEa1VqTXBKTVJHNklk?=
 =?utf-8?B?cnVMbEQ5bC91ajVvOUZNSDJLZnltcUFScGgvQ1E2c3lOTkhWVzliRU9wbHg2?=
 =?utf-8?B?Lzk1TEZ2S3RTR3QzUmF6eEc3cnFXSFVSUERvNmIrYWRoOFA3UStOdWFmMjlI?=
 =?utf-8?B?by9kLzFablQxdmlGQS9QdUxWM2FnRXZXWmxPVC9RcDN3dHlSNjYxQWREUVVr?=
 =?utf-8?B?ZjRXNGMxZU9ZWkxRK3NiV3dBN01MY2h5enRMKzM0TXdGc2ptbnBneFFUbGhH?=
 =?utf-8?B?WGU3STZJVGsrdzBCZ0d4WURUakhmQ3ZMMnhGcVpvRWNVOEgxTUlVSjVaL05R?=
 =?utf-8?B?cUhoVzJOTTlucWRWdE4xdndlNXhjZmVjQWY2a0R0bXkxK0lNZ0hKbDhWWVZq?=
 =?utf-8?B?Nm53RHA5ZXlPRWZQNXU4SmxRTlJRNDlyUklQTUp6WXFOVm5TSUlHRnFUNFB1?=
 =?utf-8?B?WHcrZUF3YkdFd0QrR2FGRWJ2RStJRXFuSjdXdC9Gd0lpZmx5TWYxaUNnYnFY?=
 =?utf-8?B?RjkxdHFrMEZ2ZUZZTHVkYlJxNDVJeTNZLzdGNk1BaHJYcXRRYWdhakZHNW0z?=
 =?utf-8?B?NUVqYUZ2bEFUdFlSZ0owcmJuT0dCYm5YSUxRd3RtMUxCYTZPVW9FVkhqaHFa?=
 =?utf-8?B?dmdjNVNRVVJhbmxmV2U3MDJyK3l5bmcyaUZRZDluWjFtNWdDc24xTmEwdFQz?=
 =?utf-8?B?a0d1MEl0bVlXQm82d3JVbGd2ZzBjS25jMXBqRzgySXdwYW1BOEN2UDNkVWlt?=
 =?utf-8?B?MDQraFBCbEhYb2ZURzFiWWREYThKSUtDN1dXZm1UbUxSYWxSZnR4OE1kQlZY?=
 =?utf-8?B?YXhqc044SmhERmZzeTFKUFVRYkNQK1BSazFVSmU0QncxYzg4QWdmL1o0OFJn?=
 =?utf-8?B?SzhTS0Uxbko3Z3UxUHh5RHdxekcwbnVxdzJGYzhtemgvWHQ0cTdNOWRkRnov?=
 =?utf-8?B?UGluL0UvMVpsZG10V3B3RTZGSWhFbHhlV3lDa3FhSjE0YTNYbjRvQmhpSWVV?=
 =?utf-8?B?YWoxaDRuQ0NnQzcycWNGRTYzZUxvd2JjYmlPZ2JkRU1uOEtaWGk2cUcvNXY0?=
 =?utf-8?B?VTc0ckpkQ2J1N2lqL2lPRzlNL1Q0K0JuODNXN1JZNit2QjVFR3JKK1NUc3hx?=
 =?utf-8?B?R3RhbTNZMUFtR01hN1pXSGFsUFlNQzMrRnlQWmhkVmpsVEdjZmR6eklnbDNj?=
 =?utf-8?B?cWRveFd2RGYvNUZIa3Q1WmNLNUh1bmlwWnp2cmMxT25US044dVB3V2dzMnhE?=
 =?utf-8?B?R2ExZFdzWGJNbmU1QXJuSnhFT0MwaXRZSHFIbGptVTJNaWxjQXM5dDh0a2dy?=
 =?utf-8?B?VzVxb2ZwZitWQi9Ia0kwOCttcUlRMkpaeHNhakxvK3A3YTc2NlRzZ2d5Wk8y?=
 =?utf-8?B?OXlwRUdYOFhrVnRCVWFrNXdrbExiVDVrVGNhRDc3cWJVWittMnd0cE9WbFhB?=
 =?utf-8?B?Rml6ZE8xdzYyT0pXdm0xTWdGeGt0U1F6VzRnNE5meFhNR3BhQUo2ZUlZZkEw?=
 =?utf-8?B?aEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09bf376d-55b6-47e9-19d6-08daff202813
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 22:04:40.8660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2r3cwuhhqhmqNS4kR0UANWlY94ULIgx3+d+bmkYwb2NLxV+jIucNk3WHfCp7PsSNM81FKiW9R7x5OXPxuDPakAafZT4KhJAH3KWGGNTNLWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7421
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/23/2023 09:51, Tvrtko Ursulin wrote:
> On 20/01/2023 23:28, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> <snip>
>>
>>   -struct i915_request *intel_context_find_active_request(struct 
>> intel_context *ce)
>> +struct i915_request *intel_context_find_active_request_get(struct 
>> intel_context *ce)
>
> TBH I don't "dig" this name, it's a bit on the long side and feels out 
> of character. I won't insist it be changed, but if get really has to 
> be included in the name I would be happy with 
> intel_context_get_active_request().
Daniele sided with you on this one. Will use your naming.

John.

