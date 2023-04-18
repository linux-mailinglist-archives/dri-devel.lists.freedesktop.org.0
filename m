Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DABD6E6BB4
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 20:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA0510E385;
	Tue, 18 Apr 2023 18:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED7010E836;
 Tue, 18 Apr 2023 18:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681841230; x=1713377230;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PQlevWlQXmUclBX0KPTCa4pxPqPZVgQcttjyIrdLTk0=;
 b=nOaNeS6IEtAcfcpKhxhXhRmem0W+lzSB56SPQrVT3WqVKgnDI1i9unI+
 P49mWDWUHNTitx+Du8+cKH7/X1Ebw9t6Xan2S3qvtZeNAsnu4MC9WmeVb
 SeRrnCzBIH9RQBxmepwxPhD3/DDvhDpLar8fFiClvFF6jeUO5IzWc/ydZ
 Z7W75RPdJOm5WVkSL0RTpNzZ/VdcUavOlwH1e9Zrm2gSnXaSAz3WgnZCc
 d6rdWAWCbUw9TJ7U0qEWepRDEWIUW9xiB4Vcv2GfOwY9sRDzEgMYu5nFn
 +2Qd6xbpHy+LmgvfwVNC13Uc57vK1HWXrBAk5RyF4N/GvYkodUpP3R9Kn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="343997528"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="343997528"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 11:06:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="693726303"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="693726303"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 18 Apr 2023 11:06:42 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 18 Apr 2023 11:06:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 18 Apr 2023 11:06:43 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 18 Apr 2023 11:06:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IX7PMHwfR+JnlyW/tACaRTt9hwHolJ8CgHbhkv6GgoVsyC8SfaucBNN8d3GnN0Urwg+wbpfKVmakVnr3p5YpH+jY7V8RynPKtrjJlcT1cJFuosxjnADJI9SJq5NuTJA3hsg3vb6eflQ6X6xDUqY3WcwVIjjVmA874Ji3qfQuBrseCccNNC+lQp0N+Gg84r00L3SHT8cdh5x04B47/4ORA5/yWy/12P8uJRkHVOF7y0YegGJGRNGc3CtSJ8WUSDDQbTRZcGGZvBbzmiQyQb5tUwn8GTooMvTkVsYCvgE75/XCvZgLwh1DhkW4zSzo2j1VtKHv/+jlSesy0Xf0eeYszQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iOKKPUcNRrJjrKL1nAAB9l/JoQEMTEuVlRsIn34eSZQ=;
 b=f721dQ4H91fggxDsz3Gz+NcfsLZZnkvRfKa45Z1ICqb16xWKejaUohVIDP8rQlPjpVjAOi89K0WuYBH9EIvqCQXfOmOdw7pheAO3CXx6992Tm+TJYi9FWiwLfjbYGrTNVkD1S/NMC5z3yewTMUI8oaEBnzAyPoiBan01PlqAdsDjWETH6NJaGMKU7+CrqCY5xwfsTJlAR2Gc9GGFs4XRKEjeVQRw3ciRosOczJ2FymibRo9lmhx0ng+doboCsAc0y3QN7o+PqUrcUG0eacp/7KRIv7TQsE27xZ446HH4M5hxZXrUeGyLocXvI10TUPHuSKVSIi1Kcb9Gk7EuuwGUqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by CY5PR11MB6138.namprd11.prod.outlook.com (2603:10b6:930:2a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 18:06:35 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::ab78:f580:c203:edb8]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::ab78:f580:c203:edb8%5]) with mapi id 15.20.6298.030; Tue, 18 Apr 2023
 18:06:35 +0000
Message-ID: <fcc2efa1-87ad-d780-6d2e-cae2027971de@intel.com>
Date: Tue, 18 Apr 2023 21:06:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH v7 6/8] drm/i915/uapi/pxp: Fix UAPI spec comments and add
 GET_PARAM for PXP
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20230406174419.471256-1-alan.previn.teres.alexis@intel.com>
 <20230406174419.471256-7-alan.previn.teres.alexis@intel.com>
 <35d5f2da-115e-5873-1e3e-ba4db16537eb@intel.com>
 <ae72a0dfb157a9944434b773a93d82d40c7cb4e7.camel@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <ae72a0dfb157a9944434b773a93d82d40c7cb4e7.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::17) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|CY5PR11MB6138:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a2800d6-7365-4d8c-4485-08db4037a57f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PVTmtRh4cOUXDHGWQT55eBc5Ujek+PDmhepL9YX70QcyKTbfKNbWCOpuQIKfY3dOSF56+wHeGxssULe35ht8ny1ZzAKHa1VBoM6W9jIT9+yaRd8LbFPWF43iWO3QiwQ8sDBDMx7XVNu742D6w+fPvflvHYbwaRLHwzdexaThL8nC4PztSvhQARd+ub7rQuVRMyCkIh0gQE9Xu7f5ooaKWfmtwidyquZc35kN4MAcJnBGa8LvMEzGf57b+Dv0vN42IOA9l6OtpSJy7zcozsn3IqShtZ3Ai7ROvYuI1ZQsHVEXbjF/pvMlqR5MqGeUHXmzMGEf2RpB6qqjc5ffNKYt+9Z0BxBgAIM1m7H1P0UB1qHV6o3idPJCFNZ2iU7qmbspFQofmZddO+WZOfaJTf3qw+K7bkaJwE0Y1UBWJrtSb9OnsudAOkgF3lbpTod6wE1bajIA0VVESDPZJb8BaQk3gZQr5BY3gzdererZCGSN6VraRzE6EvFcmxres3H/ECbGKjOr90iCbGh8fIHbSZN5v1vOQAcfQgPP1f8n6e82fAFT9F2cxFMHbhVTKAA6803IazkNRWUGjNmkS5un6sKGc1vw++ZAHyGS8Z0O6IVHQ146IbHXuHiOG2hT6e4WAqG/O+OLK01z9GNoyjhrd6o5gg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(39860400002)(136003)(376002)(396003)(451199021)(478600001)(316002)(54906003)(110136005)(5660300002)(8936002)(8676002)(31696002)(36756003)(86362001)(2906002)(4326008)(82960400001)(66476007)(66556008)(66946007)(38100700002)(41300700001)(83380400001)(107886003)(186003)(26005)(53546011)(6506007)(6512007)(6486002)(2616005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlJidGl0aGhlQTgrYUJNQXhpZUJyb29nc1RzUk55aXlvbXdoaUNlWUk3dE1m?=
 =?utf-8?B?aWpRdjRIQW9TU2l0QnlzWUVZandNN0U1Z0d1MEY4Vy9LL3pBZFJ1UVlra0Jx?=
 =?utf-8?B?U0p5bDlHYzNHL3Y3SjkrNVRST0FVTmNqQlNaNVAvNnhnazhCK2pEYXZFSHlW?=
 =?utf-8?B?RUVTTENocTNxdGNodHFKODlmMFp0ZkJwQkFvT1ZjYzdLeU5yUVRNemtuMzhI?=
 =?utf-8?B?WDZ6TFhTQ1RwTXcvYWJEZW9zSWtNQWk2RGRGRjFzVHpTUXgxZkdVNHgvRmg0?=
 =?utf-8?B?bEkyQ2lJOGh3WmRMQzNSNWtyYkRBRlFVOUF5L25tMW0rZVlhQTFXNkdYVURH?=
 =?utf-8?B?dWxnamFYOVdZMFp6YXlsRCtoN2Jmck9jV3IzelNUb0hjWXdUekhKNkVyd3dL?=
 =?utf-8?B?WWpGY2xnc1FaZXhLZmJ3UzVmUHJZbHZxcUtyS0xiQjJpcVNpU0RXNkhaeTN5?=
 =?utf-8?B?Z09MdndMOVY2bER1blFPNUk3a0owL3FYMGJyeXBFOTd5STVVdFNBcU14dDlp?=
 =?utf-8?B?dU9BNGdQNEN0WkhEWVpLRVhsOTFmd3hEcDRSdEFxOUlFNUkrMm5KUDhIWnBL?=
 =?utf-8?B?bmEvUk50Y1hMd3ZpVjRQY3ViQkpCMCtVYnhRZkpsZk0zY3Q3ZWVob3FyYkZG?=
 =?utf-8?B?UVQxc3hZUFY0SkIrd1M2bFd1cGxwQzFVUHVpNXNNcy9sbGFPMWZ6RFo3LzFi?=
 =?utf-8?B?alFMUnBWa1JBZXFKUllkR2g4QWdCQWJ2RnhyZW0wVGFjYzFmRFJPMVVtK25R?=
 =?utf-8?B?UWk5Qi9zQUFZQ3lYUVhaMlBETXJjTyt3Tm1wNnNHYk9GQVp5RVowbVdSMzZn?=
 =?utf-8?B?VndoZ0VUN1puTWJ6QkRXK1hOanhlcUEzTkc4Q2NBVHU2OG9XbGswaGtESmp2?=
 =?utf-8?B?RlB2a2hnS3lHSkZVUXZPRy9qaTkxR250YnJoVFAxTlRGQkMrMnpkQUtUaEFT?=
 =?utf-8?B?ZXIzU0V0L0J1UTZlK3RZd2xwS3RzUGJSQ2pJTm40Yi9CcU94dHJoaXpRUDlG?=
 =?utf-8?B?eDBtZ0JHakgwUlhIcVhvZjIrYkRvakJpbjJXa3JlYWhrYktPeUFkUXlYVFJl?=
 =?utf-8?B?MkkzWWdyVXY4bkptNWRhWU5IS01Hb25uZWIyY2o0ZEZUcVdMMnNFTUtzOE0y?=
 =?utf-8?B?Vis4Y0gyNjRNeCtoaEFCWDRUeVg0cFFDUTgwYkZQamFOT1BEWFhjWG1mQmxB?=
 =?utf-8?B?MmIvS2c3WHduNFpTVFVuK2E2TDFBQm00SVlVUjlkNXJNY09lT3JEbHhjMWh2?=
 =?utf-8?B?dCtleFdpdnY3TW8wYkdUcUZuVTYxTWJFRzVPKytXVGkyUTF5UkJFMzh2dVZk?=
 =?utf-8?B?emdVNS9Gam1pejl4Q1hkb0ovVzgyRklDRUtzV3NEaHpEQWhzK3FFVlg5Nmhl?=
 =?utf-8?B?alp2bnNUOGR0cHBXWGVYVElmaFhuT1NDcE85emhPME5uVnJCbmlZdGpvOFRa?=
 =?utf-8?B?U2FkRVBXSkZuVGxQV0poUHZQVDNEK2hqeHBEVVlDRmNDeGJDSnR5QWhyU1Vo?=
 =?utf-8?B?ZHk2LytTOTFjTUIrZU9BVm9YY3RURWU4OXI3NEJaWkgrdnpob0J4bkhVSlJY?=
 =?utf-8?B?bkpmNWJtWEhVNWZYQ25QWlFJd3FmR2JxREJrdHlsS2JETWcyamJlMUhMN3Iz?=
 =?utf-8?B?SVRJNTcvbk9wS3pJZzd6bXVuN08yU081Ry9iSEI5dTI4aTR0ZWxhOFRDYUZa?=
 =?utf-8?B?Q1FQMC80UERqUFVkODNWcXdhNHAwcTNqSXp1MDNQUXFxWk55V1ByV2FzWW1U?=
 =?utf-8?B?NkVwUHdEejJDQ29nRmpsVTM3Ti9lTlcwUGg5RUs2SHFVSHJiT25GVDVkamtj?=
 =?utf-8?B?em9vY3U3Qjlla3owRE1HTXlmNlM4TDE4L0ovWTVXK3J6dnUrSlVrc1M4WlNX?=
 =?utf-8?B?dzg2TC9SNG9odE5XVXpJRUZiNE9sOTB0N0MzdHI1dDRuWlExMnVaVHpPUVVC?=
 =?utf-8?B?OWhwSFJxN3hVSXEyMG5udTZRK3c1Wkh4R0xRZ05JM3Qxam10WjdUVklIMG1t?=
 =?utf-8?B?am9aQ2tlV1gzNTVVTjlZOFE5SGIvYTZmdnF5Ui9XZWo1Vjl5V1Z3SjduSU4x?=
 =?utf-8?B?bEk0dlFMa0U4SFI1bnpWaTIxWlY4THU5NU4vU2pqVHE4VjFEUUhaRVR1WmVz?=
 =?utf-8?B?MjloTFNmaTFqb1ZXRDEwZGk0ZU9CVGNCYUpkSUxFTE1rNnY3c0dyazh2enV2?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a2800d6-7365-4d8c-4485-08db4037a57f
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 18:06:35.0032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WOIAN3x+R/AwGMQQkAZU1Ucn8sl+xe1Mv+ktZChdD9oD7y9571k+g2k0YP8XDGocMG1YcfRNN15DI23Ng8Q8ozfDkpQ8nNCkdw4v531NMlU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6138
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
Cc: "justonli@chromium.org" <justonli@chromium.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/04/2023 18:17, Teres Alexis, Alan Previn wrote:
> Hi Lionel, does this patch work for you?


Hi, Sorry for the late answer.

That looks good :


Acked-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>


Thanks,


-Lionel


>
> On Mon, 2023-04-10 at 10:22 -0700, Ceraolo Spurio, Daniele wrote:
>> On 4/6/2023 10:44 AM, Alan Previn wrote:
> alan:snip
>
>>> +/*
>>> + * Query the status of PXP support in i915.
>>> + *
>>> + * The query can fail in the following scenarios with the listed error codes:
>>> + *  -ENODEV = PXP support is not available on the GPU device or in the kernel
>>> + *            due to missing component drivers or kernel configs.
>>> + * If the IOCTL is successful, the returned parameter will be set to one of the
>>> + * following values:
>>> + *   0 = PXP support maybe available but underlying SOC fusing, BIOS or firmware
>>> + *       configuration is unknown and a PXP-context-creation would be required
>>> + *       for final verification of feature availibility.
>> Would it be useful to add:
>>
>> 1 = PXP support is available
>>
>> And start returning that after we've successfully created our first
>> session? Not sure if userspace would use this though, since they still
>> need to handle the 0 case anyway.
>> I'm also ok with this patch as-is, as long as you get an ack from the
>> userspace drivers for this interface behavior:
>>
>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>
>> Daniele
> alan:snip
>

