Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC6D628BDA
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 23:15:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB7910E330;
	Mon, 14 Nov 2022 22:15:09 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06A610E32E;
 Mon, 14 Nov 2022 22:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668464102; x=1700000102;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BsWj7xDJ8Wyu6PvlWZOQUKQDnbj6NsfUh7QDkqJWImc=;
 b=ITPJN0ZaI2H+lcTXhA4rA7TgTeV0S1RzM9BI1WsNIU3DRooH+b/vLO/V
 5hnSbNL4XGsiWvwDfq8LchMJflqdR7uGMgJJiBa8nuhIsUqeKLtNJxkWB
 ptjeQhG7sNph8LA30HFH0VuuRCPuv8YzJ1D1hdEMDZvhlCDyt/6LXvae8
 idqAu980XzRtN82+sjvUcIs8XcUZ9FOuyy1D315klRe7LxxEeWchojIOF
 UucceX9Lhv5cYUW5qOW7WBhrFt91wmICmZrR0eEPmcD/vsGPMNYQ5ujcE
 tAXSZoVi5+MEz4KoTpyew5hHduqFrR48uKZlS4m+pVxoHSq4zNTl/oMws w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="313242287"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="313242287"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 14:15:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="632979498"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="632979498"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 14 Nov 2022 14:15:01 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 14:15:00 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 14:15:00 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 14 Nov 2022 14:15:00 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 14 Nov 2022 14:15:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2GBf9UV/b/kMU5wK76pxF4RT+g3/WL4er61jnNOwGOd2YmkXVe9M4LKPTdOjuSHPSHhykjOeqN+JcGzioYQh71l/e+pQL8D6RjjqpM4jtw0MMxueouNKm5TbhFwtnhbacfahdfKYEx8dIpdpRi27H1jAwD+XRkBcZG6ve9V9uWAQISjaIkxJeiv/7lnq6iIyPRksx+1ZajEJsUDlZPJgjiDQ39gGqJg7PYshe+h3MPzNB9sVnMHoqVOFoEPFESvK9+BfYFyxOb8gMTdQCkA6Dn+unNgW/ZR+sWbZpRVuDOBQL/ILkqvEaNepRYq83bjvKtF39z4+7896BLktpQ1qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GK3Xgb768G2U17WPnaRMk+NOi1FZCNNS1lwXNZDBAOQ=;
 b=BujSaLJLkk3+INTveCYKFD1xJmZKjDxDd7vsJNRZLFK0SwQK7wb/zFqEuwfF7aTkz9+TcLhG8ud0OJCK3RZDoAwRdDBY6VG9htT1eS72GiXGXsGr4sp6P4+vEAfjNgbypnVuvTZ3wgQN3O9K4HvqkQnA7TpLqMqdkRzme3jiXh3LlU3MsE3QE2UfxCgF2bS9+7vsv5YZm3TwT/itTKpXTa8cHfG3C6qqN4kkkLOb7GBj+D1eo3FFgeG5tQxC5ox6YWg6U544sEVp98ugwkDt99Zxig6qbqmlkcbtRqlM5b6m4s7lT2pnLdntBkKl8vCk0uR9p8sBpBLslR/et1h5aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM4PR11MB5247.namprd11.prod.outlook.com (2603:10b6:5:38a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 22:14:58 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a9e2:5c97:e3f0:1f12]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a9e2:5c97:e3f0:1f12%4]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 22:14:58 +0000
Message-ID: <8ea74b82-b5df-24ae-67f0-8e3c96bf7520@intel.com>
Date: Mon, 14 Nov 2022 14:14:54 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.1
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/gt: Add GT oriented dmesg output
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Ceraolo Spurio, Daniele"
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
 <76d41194-1a81-b5eb-ee29-601b64fa6a49@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <76d41194-1a81-b5eb-ee29-601b64fa6a49@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR06CA0068.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::45) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|DM4PR11MB5247:EE_
X-MS-Office365-Filtering-Correlation-Id: e0aa7bce-63d6-43bf-74a4-08dac68daa69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b5m+JiaUVXV8rCLjbFLd+Bii3qaaT/bzx5zs47VwtU44w2W8c8kU9Ku8ad2Pnk/rVEXvG8rFwCcR311+/xdT0E06qTR2cDemzEXD3Hlryl8vA8tdumKqwEAjPWuEoFiTNjgLdSMNvoXX2pB4wI7WOCQtJ1tU1c1G/7p7JBkkdGn0WnEKqV6h9nFIeaQpYBbjnKX1PZPESH6GJJNcnRP8xOmwP+o7BZHOv2fHVdy9wkb5ZfH+sGNEvhlFQm85n7MhzSoCMKTC1HwN1hfSDyBmaiPw6PlK89nwZjY3URRGSp+2KT9+DcdgbaRjMc6qg9eTLyUZJVGGN//T9oIf20dT+FuROTffa0ZPETMX7w51RfyofohJnE5SentyVow4/G65ncN6Dz9O2OoJrtNNW8uq01UDXk2yaOX6ofYjw9MQ4gKa7bZXrWx7UeAZ9kkuBLNdJce6lgns8lX2zZkjtJmQHV0hIfmWHCF/LFJq3bpXXOyai+x/UZBqFTFCxG4+McSUj/VuHD7hzKJYrxclJTmJhKlcX5fu2pbvzCzuU9KAxPLxKJrzH7S+OTTBrHEYcF6XtBXLd0H7JR2/LnKnOpu8l7D3kupXsLdQ+RX4WuzapzgISrr0Lzx9MmDT5tHwfZ715Wf/mYhOztwsWH8ph9RXmRxlq6KBj8KVKHi6G7tJvpiZhTfu+JQcDU2ZD+uAQg5qqx/+bl9sLIH/nMuuqA8yUqT+KifTgFmaMVX11qk+gDlrvQnxC/+ETfzBEAjXBJunjSlMzzlkkf4RpMrZzndUXgcYHT/ajc0g4B24R3lK3bZJTL3o9ZWwcYCQaMPckokaAOq8P3UzZU5Mi9xDqUBIaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(366004)(39860400002)(136003)(376002)(396003)(451199015)(6666004)(6486002)(31686004)(83380400001)(478600001)(6506007)(110136005)(54906003)(6512007)(26005)(66946007)(66556008)(66476007)(8676002)(4326008)(186003)(41300700001)(53546011)(8936002)(36756003)(316002)(5660300002)(2616005)(30864003)(2906002)(82960400001)(31696002)(86362001)(38100700002)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXNoMUR4OGtuZXNaeXRtV2NWY0QxZlQ2eTFhQVc4enQyWFUrQ2J2TjhHclpX?=
 =?utf-8?B?WW9naEZEU3VncFVBcFpXdS9hK2lYRVF5dTNtMHNqbWFUaHJkOVg0a2JjaWM3?=
 =?utf-8?B?STJhZjdSVTJzY1ozWmhMRi9sTW4zZjVqdjdIU2FwRXphRVRQdHpPQU5YenRa?=
 =?utf-8?B?dzQ2blFQdFRkZzAwSUhHMXJsdTBNUTZqQU1TWG5FUFMxb2ppQWpaYlRGUGFC?=
 =?utf-8?B?TVJmMVlaVHpvQjhMU0hrY3RyZElERzVlSUcxSm1KVGxOcm0xS0VqUWtkWEdC?=
 =?utf-8?B?RFBLa1NZUkt2cXFya1g4NGZNdkFKZEpsM3kyUi9vSy9sTmNIUUdlWSswZWN1?=
 =?utf-8?B?aVFDdk1EMmtuREVSTXNrNFNwd1lmRHZlc1hFWEFkaG55VGYwc3hYb0hubzg1?=
 =?utf-8?B?eXBWd0cvTHpTS3pOOG10TkcxYzlEanhyNEJhYlNkc0ZaNlZDYU9XdVo0dWt2?=
 =?utf-8?B?U3FEak5TUHY5aFBPU2k0ZDd6SE5tbUtUNklBRklqOEI3UjAwdnludkE1ZlBZ?=
 =?utf-8?B?Q0Z3Q0pGdGYrQ1Z6TStFS1dJS0t0dk5Db0o2U0h2cHFNYnpjRVNtRzNYNmxs?=
 =?utf-8?B?QWpYbE5nYTJoSzdBZG5LNWlpMmoxVFNyOVB3SmprNmxCTnArUFU4a0htU040?=
 =?utf-8?B?Zk1vWVducWRJcWhzd2JhS2FwYmtiUTJjc1BuZHJtcXJFeGVwbE9qSStPdTVl?=
 =?utf-8?B?N1dMTGlEcStlSUdjamxqN1pacFFRMzJCWEpoeTBpbzAvRkMvdzY3d1piWnVv?=
 =?utf-8?B?SEpVNGI1Z040MllEaFM5KzYrQ1VUNnlqUjNuWjFqSWFNbkFvaU94M2MvcWMv?=
 =?utf-8?B?OW1DSUUxaVk0N3V6c3Eva1VoZlBwNGZyM2FzNDIva0s2WG5oemVzY2NGdXZ0?=
 =?utf-8?B?djVPeUhUektXVDgvK25ubW9LK0wvLytha2g0d3U2cjZUM3VhNXl5REI1ZCtO?=
 =?utf-8?B?Vnp5T0Y0ZWNDTVpMNEtWVkJreFZpOXQxRTl5MC9uRnl6emREcXEwdkdoMDdN?=
 =?utf-8?B?d09mcHNKNVhBQUIzUVZzbzc5am9uMVJ1OUN4T2lkNDVQT1MwSGVvWmxHTlQ0?=
 =?utf-8?B?QlBPWFYyUjZBN0xGUkdWYWJLUW5pWjZiN2toZWNnWnozSHdWMjdoWUhEY0JJ?=
 =?utf-8?B?eDI3cjJENHk1cExqc0VhU1ZGVTE3OURIK1J2Um1mSDJId2gxTDlnclZQMUpS?=
 =?utf-8?B?YmJHY0pveEpoNEY2Sm8rUVRUdEE2dWFZbnREam4zQXV5NUxZdkVJZjRTdnh6?=
 =?utf-8?B?cFpzZjdrSmNEdXoxT3dmc3FnTlljOUR6aTJ6cTBGdG9FWCs0MUM3dFc3bnN1?=
 =?utf-8?B?WDZ4TS9OVXA0dlBzdlRtOFZOU1h4YmtYNUgwYzFPeldsK0RVRHVMbXNJcHdJ?=
 =?utf-8?B?MW95akNBYm1OV2xDTExMdUlZRXE1MXVmNTUybTZIVlM1NGtZL3BwSVRKTGpB?=
 =?utf-8?B?RDA2dk5zaFRtRWRzRXFSYVBEeW95eGNjcE5nNFduQ3NIVStCQWNST1BMS0Fa?=
 =?utf-8?B?OGdFRFpMUTBjNGRlV3djWVF4dy9ucEVsWTM2bkNpRGxqY0lMb1ZRUDNISGx3?=
 =?utf-8?B?N1RKUmdQL0JYQXkrTXVzTnVWVVhXM2RHSzF4REQxR2FWeHNhMXZpQU9CcTFo?=
 =?utf-8?B?cjcrdFRNUGNFT1JvRUNhcnAzOFRycG55TmMzNjlxRUNxeVBrcWJUaEJWRXps?=
 =?utf-8?B?c1UrOExBa2ROYWlVdkRSa2M2RmtiZ2o5OXpvMkNWRDF2MlAxVVFORnBkUCs0?=
 =?utf-8?B?RDBoeHlhNWV1VFFrd2FuYzlZM3JUYWVWY0xsVTl3VmkwN1A3dDBuOHBTM1FJ?=
 =?utf-8?B?WmswS3psaklLZ3d0MWpxcTRnbGppdGVUTEcrOXdaWXozQS91SEdYdlFxTVRy?=
 =?utf-8?B?VDBiMFJEUWovYnU1d1Zod280TmU1aFduNWZqWlBXSjdJVTIxMWw0MmxWcE5V?=
 =?utf-8?B?b2VXMkRsYzVkc0F6OU9wblBHWDNxamZVRkxKZ09MKzByTXhvOFJSOHdNU1Ns?=
 =?utf-8?B?ak1MaGRTZW1Td0tzNm1mdFd2eUlGOWVDOGhDZ3ZwbStQbFJWTmNMelJ2eGts?=
 =?utf-8?B?RXpxQ085R1hHOVRHbkJXS1pLTmtSRVpnVGJjd3g0eFk4TG0zbVF6RjVEZ3Vw?=
 =?utf-8?B?eHFxQ2g1ZVgxc0F6SStabUppc1p2VmU2NHlETE9DTHpabjBwQ2pYWGUweGU5?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0aa7bce-63d6-43bf-74a4-08dac68daa69
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 22:14:57.9322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cqLJlq4ZWBjzTe4VALrjsZVTdpjwaKgLT79RzHKGKx3Dtn9+mYEESMZmmbL/tMX6YzT+1SAD8I7alMKObfcK8vyV5hz6aesTUR0lkSNzH80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5247
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
Cc: "Ewins, Jon" <jon.ewins@intel.com>, DRI-Devel@Lists.FreeDesktop.Org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/10/2022 01:43, Tvrtko Ursulin wrote:
> On 09/11/2022 17:46, John Harrison wrote:
>> On 11/9/2022 03:05, Tvrtko Ursulin wrote:
>>> On 08/11/2022 20:15, John Harrison wrote:
>>>> On 11/8/2022 01:01, Tvrtko Ursulin wrote:
>>>>> On 07/11/2022 19:14, John Harrison wrote:
>>>>>> On 11/7/2022 08:17, Tvrtko Ursulin wrote:
>>>>>>> On 07/11/2022 09:33, Tvrtko Ursulin wrote:
>>>>>>>> On 05/11/2022 01:03, Ceraolo Spurio, Daniele wrote:
>>>>>>>>> On 11/4/2022 10:25 AM, John.C.Harrison@Intel.com wrote:
>>>>>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>>>>
>>>>>>>>>> When trying to analyse bug reports from CI, customers, etc. 
>>>>>>>>>> it can be
>>>>>>>>>> difficult to work out exactly what is happening on which GT in a
>>>>>>>>>> multi-GT system. So add GT oriented debug/error message 
>>>>>>>>>> wrappers. If
>>>>>>>>>> used instead of the drm_ equivalents, you get the same output 
>>>>>>>>>> but with
>>>>>>>>>> a GT# prefix on it.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>>>
>>>>>>>>> The only downside to this is that we'll print "GT0: " even on 
>>>>>>>>> single-GT devices. We could introduce a gt->info.name and 
>>>>>>>>> print that, so we could have it different per-platform, but 
>>>>>>>>> IMO it's not worth the effort.
>>>>>>>>>
>>>>>>>>> Reviewed-by: Daniele Ceraolo Spurio 
>>>>>>>>> <daniele.ceraolospurio@intel.com>
>>>>>>>>>
>>>>>>>>> I think it might be worth getting an ack from one of the 
>>>>>>>>> maintainers to make sure we're all aligned on transitioning to 
>>>>>>>>> these new logging macro for gt code.
>>>>>>>>
>>>>>>>> Idea is I think a very good one. First I would suggest 
>>>>>>>> standardising to lowercase GT in logs because:
>>>>>>>>
>>>>>>>> $ grep "GT%" i915/ -r
>>>>>>>> $ grep "gt%" i915/ -r
>>>>>>>> i915/gt/intel_gt_sysfs.c: gt->i915->sysfs_gt, "gt%d", 
>>>>>>>> gt->info.id))
>>>>>>>> i915/gt/intel_gt_sysfs.c:                "failed to initialize 
>>>>>>>> gt%d sysfs root\n", gt->info.id);
>>>>>>>> i915/gt/intel_gt_sysfs_pm.c: "failed to create gt%u RC6 sysfs 
>>>>>>>> files (%pe)\n",
>>>>>>>> i915/gt/intel_gt_sysfs_pm.c: "failed to create gt%u RC6p sysfs 
>>>>>>>> files (%pe)\n",
>>>>>>>> i915/gt/intel_gt_sysfs_pm.c: "failed to create gt%u RPS sysfs 
>>>>>>>> files (%pe)",
>>>>>>>> i915/gt/intel_gt_sysfs_pm.c: "failed to create gt%u 
>>>>>>>> punit_req_freq_mhz sysfs (%pe)",
>>>>>>>> i915/gt/intel_gt_sysfs_pm.c: "failed to create gt%u throttle 
>>>>>>>> sysfs files (%pe)",
>>>>>>>> i915/gt/intel_gt_sysfs_pm.c: "failed to create gt%u 
>>>>>>>> media_perf_power_attrs sysfs (%pe)\n",
>>>>>>>> i915/gt/intel_gt_sysfs_pm.c: "failed to add gt%u rps defaults 
>>>>>>>> (%pe)\n",
>>>>>>>> i915/i915_driver.c: drm_err(&gt->i915->drm, "gt%d: 
>>>>>>>> intel_pcode_init failed %d\n", id, ret);
>>>>>>>> i915/i915_hwmon.c: snprintf(ddat_gt->name, 
>>>>>>>> sizeof(ddat_gt->name), "i915_gt%u", i);
>>>>>>>>
>>>>>>
>>>>>> Just because there are 11 existing instances of one form doesn't 
>>>>>> mean that the 275 instances that are waiting to be converted 
>>>>>> should be done incorrectly. GT is an acronym and should be 
>>>>>> capitalised.
>>>>>
>>>>> Okay just make it consistent then.
>>>>>
>>>>>> Besides:
>>>>>> grep -r "GT " i915 | grep '"'
>>>>>> i915/vlv_suspend.c: drm_err(&i915->drm, "timeout disabling GT 
>>>>>> waking\n");
>>>>>> i915/vlv_suspend.c:                     "timeout waiting for GT 
>>>>>> wells to go %s\n",
>>>>>> i915/vlv_suspend.c:     drm_dbg(&i915->drm, "GT register access 
>>>>>> while GT waking disabled\n");
>>>>>> i915/i915_gpu_error.c:  err_printf(m, "GT awake: %s\n", 
>>>>>> str_yes_no(gt->awake));
>>>>>> i915/i915_debugfs.c:    seq_printf(m, "GT awake? %s [%d], %llums\n",
>>>>>> i915/selftests/i915_gem_evict.c: pr_err("Failed to idle GT (on 
>>>>>> %s)", engine->name);
>>>>>> i915/intel_uncore.c:                  "GT thread status wait 
>>>>>> timed out\n");
>>>>>> i915/gt/uc/selftest_guc_multi_lrc.c: drm_err(&gt->i915->drm, "GT 
>>>>>> failed to idle: %d\n", ret);
>>>>>> i915/gt/uc/selftest_guc.c: drm_err(&gt->i915->drm, "GT failed to 
>>>>>> idle: %d\n", ret);
>>>>>> i915/gt/uc/selftest_guc.c: drm_err(&gt->i915->drm, "GT failed to 
>>>>>> idle: %d\n", ret);
>>>>>> i915/gt/intel_gt_mcr.c: * Some GT registers are designed as 
>>>>>> "multicast" or "replicated" registers:
>>>>>> i915/gt/selftest_rps.c:                 pr_info("%s: rps counted 
>>>>>> %d C0 cycles [%lldns] in %lldns [%d cycles], using GT clock 
>>>>>> frequency of %uKHz\n",
>>>>>> i915/gt/selftest_hangcheck.c: pr_err("[%s] GT is wedged!\n", 
>>>>>> engine->name);
>>>>>> i915/gt/selftest_hangcheck.c:           pr_err("GT is wedged!\n");
>>>>>> i915/gt/intel_gt_clock_utils.c:                 "GT clock 
>>>>>> frequency changed, was %uHz, now %uHz!\n",
>>>>>> i915/gt/selftest_engine_pm.c:           pr_err("Unable to flush 
>>>>>> GT pm before test\n");
>>>>>> i915/gt/selftest_engine_pm.c: pr_err("GT failed to idle\n");
>>>>>> i915/i915_sysfs.c:                       "failed to register GT 
>>>>>> sysfs directory\n");
>>>>>> i915/intel_uncore.h:     * of the basic non-engine GT registers 
>>>>>> (referred to as "GSI" on
>>>>>> i915/intel_uncore.h:     * newer platforms, or "GT block" on 
>>>>>> older platforms)?  If so, we'll
>>>>>>
>>>>>>
>>>>>>
>>>>>>>> Then there is a question of naming. Are we okay with GT_XXX or, 
>>>>>>>> do we want intel_gt_, or something completely different. I 
>>>>>>>> don't have a strong opinion at the moment so I'll add some more 
>>>>>>>> folks to Cc.
>>>>>>>
>>>>>> You mean GT_ERR("msg") vs intel_gt_err("msg")? Personally, I 
>>>>>> would prefer just gt_err("msg") to keep it as close to the 
>>>>>> official drm_* versions as possible. Print lines tend to be 
>>>>>> excessively long already. Taking a 'gt' parameter instead of a 
>>>>>> '&gt->i915->drm' parameter does help with that but it seems like 
>>>>>> calling the wrapper intel_gt_* is shooting ourselves in the foot 
>>>>>> on that one. And GT_ERR vs gt_err just comes down to the fact 
>>>>>> that it is a macro wrapper and therefore is required to be in 
>>>>>> upper case.
>>>>>>
>>>>>>> There was a maintainer level mini-discussion on this topic which 
>>>>>>> I will try to summarise.
>>>>>>>
>>>>>>> Main contention point was the maintenance cost and generally an 
>>>>>>> undesirable pattern of needing to add many 
>>>>>>> subsystem/component/directory specific macros. Which then 
>>>>>>> typically need extra flavours and so on. But over verbosity of the 
>>>>>> How many versions are you expecting to add? Beyond the tile 
>>>>>> instance, what further addressing requirements are there? The 
>>>>>> card instance is already printed as part of the PCI address. The 
>>>>>> only other reason to add per component wrappers would be to wrap 
>>>>>> the mechanism for getting from some random per component object 
>>>>>> back to the intel_gt structure. But that is hardware a new issue 
>>>>>> being added by this wrapper. It is also not a requirement. Much 
>>>>>> of the code has a gt pointer already. For the parts that don't, 
>>>>>> some of it would be a trivial engine->gt type dereference, some 
>>>>>> of it is a more complex container_of type construction. But for 
>>>>>> those, the given file will already have multiple instances of 
>>>>>> that already (usually as the first or second line of the function 
>>>>>> - 'intel_gt *gt = fancy_access_method(my_obj)' so adding one or 
>>>>>> two more of those as necessary is not making the code harder to 
>>>>>> read.
>>>>>>
>>>>>>> code is obviously also bad, so one compromise idea was to add a 
>>>>>>> macro which builds the GT string and use drm logging helpers 
>>>>>>> directly. This would be something like:
>>>>>>>
>>>>>>>  drm_err(GT_LOG("something went wrong ret=%d\n", gt), ret);
>>>>>>>  drm_info(GT_LOG(...same...));
>>>>>> Seriously? As above, some of these lines are already way too 
>>>>>> long, this version makes them even longer with no obvious 
>>>>>> benefit. Worse, it makes it harder to read what is going on. It 
>>>>>> is much less intuitive to read than just replacing the drm_err 
>>>>>> itself. And having two sets of parenthesis with some parameters 
>>>>>> inside the first and some only inside the second is really 
>>>>>> horrid! Also, putting the 'gt' parameter in the middle just 
>>>>>> confuses it with the rest of the printf arguments even though 
>>>>>> there is no %d in the string for it. So now a quick glances tells 
>>>>>> you that your code is wrong because you have three format 
>>>>>> specifiers but four parameters.
>>>>>>
>>>>>> Whereas, just replacing drm_err with gt_err (or GT_ERR or 
>>>>>> intel_gt_err) keeps everything else consistent. The first 
>>>>>> parameter changes from 'drm' to 'gt' but is still the master 
>>>>>> object parameter and it matches the function/macro prefix so 
>>>>>> inherently looks correct. Then you have your message plus 
>>>>>> parameters. No confusing orders, no confusing parenthesis, no 
>>>>>> excessive macro levels, no confusion at all. Just nice simple, 
>>>>>> easy to read, easy to maintain code.
>>>>>
>>>>> I am personally okay with gt_err/GT_ERR some other folks might 
>>>>> object though. And I can also understand the argument why it is 
>>>>> better to not have to define gt_err, gt_warn, gt_info, gt_notice, 
>>>>> gt_debug, gt_err_ratelimited, gt_warn_once.. and instead have only 
>>>>> one macro.
>>>> A small set of trivial macro definitions vs a complicated and 
>>>> unreadable construct on every single print? Erm, isn't that the 
>>>> very definition of abstracting to helpers as generally required by 
>>>> every code review ever?
>>>>
>>>> And what 'other folks might object'? People already CC'd? People 
>>>> outside of i915?
>>>>
>>>>
>>>>>
>>>>> Because of that I was passing on to you the compromise option.
>>>>>
>>>>> It maybe still has net space savings since we wouldn't have to be 
>>>>> repeating the gt->i915->drm whatever and gt->info.id on every line.
>>>>>
>>>>> You are free to try the most compact one and see how hard those 
>>>>> objections will be.
>>>> Um. I already did. This patch. And you are the only person to have 
>>>> objected in any manner at all.
>>>
>>> Where I have objected?
>> Only in everything you have written. Or are you saying that actually I 
>
> ???
>
>> could have just taken the r-b from Daniele and merged it while 
>> completely ignoring everything you have said because you didn't say 
>> 'NACK' at the top of your email?
>
> No, but because we don't do that while there is an ongoing discussion.

Which is exactly my point. If it is not an ack or r-b then by definition 
it is an objection.

>
>>> I was a) asking to convert all gt/ within one kernel release, b) 
>>> transferring the maintainer discussion from IRC to this email chain 
>>> to outlay one alternative, for which I said I could see the pros and 
>>> cons of both, and c) raised the naming question early since that can 
>>> usually become a churn point later on when we have large scale code 
>>> transformations.
>>>
>>> As said, FWIW you have my ack for GT_XXX naming and approach, but 
>>> please do convert the whole of gt/ so we don't ship with a mish-mash 
>>> of log messages.
>>>
>> That sounds like a quite a lot of objections to me - don't do it that 
>> way, do it this way; fine do it that way but expect lots of 
>> complaints when you do; oh all right, do it that way but re-write the 
>> entire driver all at once.
>
> No, I'll repeat what I said one last time.
>
> I said it's good idea, raised the topic of naming, since it is good to 
> get consensus before starting a wide renaming exercise. I also chatted 
> with other maintainers and passed on here one alternative proposed, 
> with its pros and cons. Finally I said your initial approach has my 
> ack at least, even though not everyone liked it. And I asked to 
> convert all gt/, since I think it is a good idea, and frankly it's not 
> a very big ask. It is just how it works.
>
>> I really don't get the 'we must not ship with a mish-mash of log 
>> messages' argument. It's hardly like the current total mish-mash of 
>> DRM_DEBUG, DRM_DEBUG_DRIVER, pr_dbg, drm_dbg, ... is even remotely 
>> consistent. It's also not like the patch is massively changing the 
>> format of the output messages. So some prints get a useful extra 
>> three characters in advance of others. Does anyone care? Would anyone 
>> except us even notice?
>>
>> Is it really a problem to merge this patch now to get the process 
>> started? And other sub-components get updated as and when people get 
>> the time to do them? You could maybe even help rather than posting 
>
> It can be a problem. You opened up a topic which leads to an overall 
> improvement and if we merge churn before we decide on the final 
> direction, then we just get more churn later.
>
>> completely conflicting patch sets that basically duplicate all the 
>> effort for no actual benefit.
>
> Completely conflicting?
>
> Yours:
>
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 25 +++--
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  9 +-
>  .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 50 ++++------
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  9 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     | 17 ++--
>  drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    | 49 +++++-----
>  drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c     |  3 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   |  6 +-
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 56 ++++++------
>  drivers/gpu/drm/i915/gt/uc/intel_huc.c        | 20 ++--
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c         | 84 ++++++++---------
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 91 +++++++++----------
>  drivers/gpu/drm/i915/gt/uc/selftest_guc.c     | 36 ++++----
>  .../drm/i915/gt/uc/selftest_guc_hangcheck.c   | 22 ++---
>  .../drm/i915/gt/uc/selftest_guc_multi_lrc.c   | 10 +-
>  15 files changed, 228 insertions(+), 259 deletions(-)
>
> Mine:
>
>  drivers/gpu/drm/i915/gem/i915_gem_context.c   |  2 +-
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 23 ++++++----
>  .../drm/i915/gt/intel_execlists_submission.c  | 13 +++---
>  drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c  |  4 +-
>  drivers/gpu/drm/i915/gt/intel_gt.c            |  4 +-
>  drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  8 ++--
>  drivers/gpu/drm/i915/gt/intel_rps.c           |  6 ++-
>  drivers/gpu/drm/i915/gt/intel_workarounds.c   | 43 +++++++++++--------
>  .../gpu/drm/i915/gt/intel_workarounds_types.h |  4 ++
>  .../gpu/drm/i915/gt/selftest_workarounds.c    |  4 +-
>  drivers/gpu/drm/i915/i915_debugfs.c           |  4 +-
>  drivers/gpu/drm/i915/i915_gem.c               |  2 +-
>  drivers/gpu/drm/i915/i915_getparam.c          |  2 +-
>  drivers/gpu/drm/i915/i915_irq.c               | 12 +++---
>  drivers/gpu/drm/i915/i915_perf.c              | 14 +++---
>  drivers/gpu/drm/i915/i915_query.c             | 12 +++---
>  drivers/gpu/drm/i915/i915_sysfs.c             |  3 +-
>  drivers/gpu/drm/i915/i915_vma.c               | 16 ++++---
>  drivers/gpu/drm/i915/intel_uncore.c           | 21 +++++----
>  19 files changed, 116 insertions(+), 81 deletions(-)
>
> I deliberately did not touch gt/uc so they don't touch a single same 
> file!
>
> Unless you are referring to the fact gt logging will need to touch 
> some of the same lines my patch touches. Well yes, some, not all, and 
> I reckoned it will be much quicker since there aren't really any 
> contentious points with DRM_XXX -> drm_xxx. Plus I added struct 
> intel_gt or whatever or it wasn't before so it would make your patch 
> easier/smaller.
Except that it is quite clearly a change that is 'still under 
discussion' and is quite clearly changing exactly the same lines of code 
in a number of places. Therefore, by your definition, your patch set 
cannot be merged because it is causing 'churn'. Alternatively, your set 
can be merged because we don't actually care that a few lines will get 
changed one way and then quickly changed another way in a follow up 
patch and the overall benefit is worth the 'churn'. In which case 
exactly the same rule should apply to this patch set. Merge something 
that adds immediate benefit and if necessary update it to a better 
version later.

Of course, there is also the view that you have just taken the task over 
by posting a more encompassing change that cleans up debug prints in the 
whole of i915. Therefore it is now up to you to update all 
sub-components to use appropriate prints - GT, KMS, GuC, Gem, etc.. 
because "frankly it's not a very big ask. It is just how it works".

John.

>
> Regards,
>
> Tvrtko

