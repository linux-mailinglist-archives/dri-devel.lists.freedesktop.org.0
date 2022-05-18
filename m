Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2689A52B1F1
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 07:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C88EE10FC16;
	Wed, 18 May 2022 05:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C73F113DF9;
 Wed, 18 May 2022 05:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652852356; x=1684388356;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EsbK6Np/JvCdg3OgO3AMux3CGo6mKsu74X6Dew7NJ70=;
 b=HbH89KnDgNjvWpxH7ZtIKxig+GyfCetfuc8/UwdsmK+OhbM5oFfZzLrC
 lrIoTGnXCSPq1URpfufNqq3uG9QT+3pcJJXV7Hu/xW+uHb1IfKlPVddAF
 S5TVyLHmBBEGc43zvgI+8kwespfBzs/KsUSsr4oJihmGpDmAvMmXV1zJB
 KnA2RZF0RBqeIhVLGoaSwd1W51mUdBGmYmM8SthHQgilyz2dWwtDXwx2A
 YXmIEs7Nvc9QwL+czGzOdpn9yx/gK/QN9kO64KQAj/ODlz9cq8pDqqMD9
 /zwL1tKVWyUTjHM+mgH2XM3I/diTnDVIpQQllrV8Eknq99vQxQVWnyPw7 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="332107293"
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; d="scan'208";a="332107293"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 22:39:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; d="scan'208";a="597538208"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 17 May 2022 22:39:15 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 17 May 2022 22:39:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 17 May 2022 22:39:15 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 17 May 2022 22:39:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ur5taDNPfzYFeKulIO/BhmRaMJwo/blUlWmVN8jEBQfjexPK71GcYvre6bUc2jIQI9tKziBZu6fbF/fcj8ssmb/1mXdMHbEbh8mAUvD/2odNjUnuQlFG2IZ9wy78p1+0DHS0LrWbMOjZ4loVkyk2INZLsC9ICrvYXH5ppqmZH7C7+Zdi3/wMm3ZFtQfNLgVVCxa/xW5XXcZqmzR2kusE7y4YZaG9nZ4QSqZCKmnnF+8lhBllUyKIItgZ3OlOoZ/lWEbXM2vm0Gj5r9HrPdDey0d3NBOfBBxumCKhy/sRGVK8++TzeI9b4jnR/DA4fFIehqn+mj8d/SSJ7gtV2bC6YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NfXBtEwlXLz9SqXqD/2wM7RS3msKSoQKlTCehEzA0+0=;
 b=l4nGwj6LyAwNIzMpoi3Oy6aKkUtrlebvo1JRr6Vs83DLsyvR/jYSaA1KyxBJuu5nDRNk+tofPiJ5rIOkzGuvk7smcEta8vgmcURLNgUA91A6prJSYAhDDqQb4l765F8k59mNrYBwVtTdtkKQjLtUd9w2qfYwZs70yWAnHdqpbayq9gWm+lwBVC/ySP3FOd1bSeZr9CCQWNHKYcgek4LZP29u/79OR3eiXSlhup40Y4yO3gJMMSA6JfaRobEA2XU8Xma53anxj4WxIEGc0DTwrp05G6P6H4XXG4F266U2eTRrVCqt3cmHSfrCz3RERBVw3QIWG5EsI1jB+feYtgbKsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 DM6PR11MB3707.namprd11.prod.outlook.com (2603:10b6:5:144::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.15; Wed, 18 May 2022 05:39:08 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::cd21:2277:8810:fce1]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::cd21:2277:8810:fce1%4]) with mapi id 15.20.5250.018; Wed, 18 May 2022
 05:39:08 +0000
Message-ID: <7a61da79-90ac-b4e2-d06d-758616b12855@intel.com>
Date: Wed, 18 May 2022 11:08:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [Intel-gfx] [V2 3/3] drm/amd/display: Move connector debugfs to
 drm
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, Harry Wentland
 <harry.wentland@amd.com>, "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Sharma,
 Swati2" <swati2.sharma@intel.com>
References: <20220411095129.1652096-1-bhanuprakash.modem@intel.com>
 <20220411095129.1652096-4-bhanuprakash.modem@intel.com>
 <DM6PR11MB31778321FCA58010AE44D867BAFC9@DM6PR11MB3177.namprd11.prod.outlook.com>
 <29f40e83-a9a8-c0ac-1702-f9d0bf0f8861@intel.com>
 <8a9ba046-5e2c-442f-aec2-f1683097d100@amd.com>
 <576d5993-8108-218e-45a0-bab1ae4ca84b@intel.com>
 <b87db6af-a2a0-8fba-b204-140db03ab79b@amd.com>
 <642bd366-7918-0f0f-a6fb-e6422eb7501d@amd.com> <87mtfhhnx4.fsf@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Organization: Intel
In-Reply-To: <87mtfhhnx4.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0025.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::13) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 819e43da-716e-4961-842c-08da3890ba3c
X-MS-TrafficTypeDiagnostic: DM6PR11MB3707:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB37075FF1DA2B322654420B0B8DD19@DM6PR11MB3707.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G6bEUQ7JZeqz6a+wkmeVa/EquZHqsTt6cf5CfrPEqXw8k/lhbKckAQ3VWxaSRpXqUb7RDZiL7e5I5FRvbXTv6WeC7z6D+BcqvvEhUrswGRpGs0y7DT/xJUhsrYdf8ytidMNh+UuprTSXp588RiqQPM63JVhdr1DNpHmS0/Ssi+jcG6xZ0kLThhVHS1lAQ1sEnetz9HFmCc6atriu+lTl56HLudcH4nEED7e03ergmaqPcrC4Zi6GCkdZezR60lUrPkkTYT4gNsXV/7gg6HEUdqXMIyYXZQDg+WvyIyW1lQWV5gEr0HjS9oSJHFh68w0H9aQ/YmHXq/Qr05DSAblaZiyxGYwxw5bbG0PAavMIy1MnHq40n+QYx0he3O5sRUdFF6gtuRTg0RsSnnt2/EFrC0f0tbGfCRUql3/uyRd9uI998tAgoUJ8t1KTMC7AmK6YtnjDbKmSS7klwf5YShaUBy/ZwIRWl3YaDeYlw7VHSG9aKIdVJ1c/lKCPut7hiVhVAaxym83SFXgZxEs0R51D70LfiO8WKGJP+Tx/5JbGv6zn28wP4sNE4LqdAUKCIQME7+HwL0yplpE/BNbjTySq0YW4QzzvXM4N5jvHfJ/IlIu2LyiHmLUrUP4aFQG3+LP97yas7z8PvzmOU8Bik7OB4Qo89APrN7gy1BU/kGGtJOsoQLZw4zN0xWXFVkJABckfv75TMElfBzSLe1RzFFakBBKtruLX5BvjPnMmEVOy8SZjFIT4blYyv4rRPivbNWrr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(8936002)(6666004)(38100700002)(4744005)(5660300002)(2906002)(36916002)(6636002)(31696002)(86362001)(186003)(6486002)(6512007)(508600001)(26005)(31686004)(4326008)(36756003)(8676002)(66476007)(66946007)(66556008)(82960400001)(921005)(110136005)(6506007)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mzdta1FqdU5hSTJHYVJIWmxRNnpGOCtMaFBxblRSVGh1blZzaTVoNW1jN2RT?=
 =?utf-8?B?ODJkTVJGOW9GRlNvcTIvR0VBRlYwc1hLdytZem1QUGdpQWIzcmdybCtGK0RC?=
 =?utf-8?B?Uk1KS3VpUzNibG1RUm53MS9VQnFnQkdJWFdtOFhWQk4wTE9Db1JWQTVKODNm?=
 =?utf-8?B?VWZTZjVPMHBWdHFQaS9mcFRFb0U3WXBpb1Z6SDJsRjJsSG9KVVJwUVhlNExH?=
 =?utf-8?B?ekJncmk4WlN6THlaZUN3NW5HcWZ1WFRralU4TGtoSXFVbVdaRWlaVUZ4b2JF?=
 =?utf-8?B?b1NSOWk1eG41TURVWEYrQ3hlWTZBeWJVdndkaTVJUFc2cnNTRUUxUXNBSGFE?=
 =?utf-8?B?U2FYZnI2VzdqQVhxeE5PdCtzNnd0NVRFbGpYTnFjQUJQRWI4RlNlTXAxU1Zy?=
 =?utf-8?B?cDBsa1BOWVdmMFhGRmJQREdnaEVHZjZraVRiTm5aSk8zY1A4aUVFeFU0K1NM?=
 =?utf-8?B?Y2dBYlY2RmExS1dEV2V5SEkwejRUb1k2Mjh6dUNZYWd1NytabURhSHRWZ093?=
 =?utf-8?B?VzlqK2pQVjlBdjZSU2dLWENCYkhnMmRjVzI3NzNabmhzMmhJSjNyYjBCN0VY?=
 =?utf-8?B?ZTZvOEJaUXlXZm9wanJyaXFhajBVcXVnekgxSjFFRTlXWERmakFIOTNnUFFC?=
 =?utf-8?B?amlCUFNYU1lZQkRnWTh5VlFlU2lnc20wNk1sOW9DVS9RaVVXZ3pvYjJuRUFT?=
 =?utf-8?B?TWlQbTRvTGpkcTcrd0tPMkw2V2ZCcmp3Q1VmMytCcjVpQVY3NjY5aCthOEky?=
 =?utf-8?B?eWRyNnhUSUJGYXh2VlF6Wk5TQndJa3FsaWdJdm5LTzdMNjhQTXl3dWhXTjdR?=
 =?utf-8?B?NEJPdzd0b2FMeER5NmJnK09HSmVHTkxFNkFWYXBsbHNFaVlrMFh0NFh1WVVs?=
 =?utf-8?B?T1JXWG9QMnp4MTR3Q1hiQXh5QlZ3OFZxSC9aT0kyNExkMDhyVEZ4NkpQb0Fv?=
 =?utf-8?B?bmRiYUxad2dYbTg3Q2U0WUVQZC8xdEI4K3MyeEFabzY5cnFqOEpvRHlwWVpu?=
 =?utf-8?B?L0ZzaVVGYVFROGF6enlCYVQ0a0xCeHo1dzlEclVJcGsyQkp2L1dTbFBoQ2ZE?=
 =?utf-8?B?RWdPYXNtdTFKU2x0VlhUUUhqRzhIVWR6c1FqSGM4RWZmZDI2NkM5elIzL1NF?=
 =?utf-8?B?QjRDTURRNndSbDlsbnBiaVFpMUphRm1tcEdEOG5KeWp3OWVmUkxDdDd1enJO?=
 =?utf-8?B?eEo2QmxaYWRjZ2JzeVdOY0FxNW1heUNOWDhvcUE3U2Y3S1QrVm83NzFGc0lj?=
 =?utf-8?B?N0pGcHpJMjFwNnJnLzRuNG41QWFmY0syTnovZ3NKRE0wWDlVUDQzOHlRYytE?=
 =?utf-8?B?SDNNcU5ZK0tUbkxQQm45ejhYT2U2RFVVL2d5TDQ1SGVjU3dWSXBoT1VJM1Z4?=
 =?utf-8?B?L3NGUVV2c3hMczVGWVA5YVljYW92S1J0dzRDWGE3LzN2Rll2dU5heFpSZmVk?=
 =?utf-8?B?bHphTHNWVFdHTmpnMjJnTTZVdWJlOTZON3VBcTZibS9QQnZlc1drUFBudmpL?=
 =?utf-8?B?cS9sYWNHOGJxY01yZTdCc2RGb2FrM2tnU0NHb0xJNDZLOVNMNUl2WjQ5ejNS?=
 =?utf-8?B?RzRxT2labWkvZ2o2UTQzZzRNTUpNWkZyK0EzZktSN0xkSjkwN2VDaU1MTTJk?=
 =?utf-8?B?amp4TWZOZENGM2VNcy9JcWs0Z2x6NFFzQWJlZnl5REllL0pmQUg4VkN1U2Zi?=
 =?utf-8?B?OTFVampSWnNnYXBac09sdlZINkFDYnREWTlZdE5pVW41MTRmZk1HOE9tbTE4?=
 =?utf-8?B?QnMyS2VPOFluVmhoMU5sTmswMkJ2WWNvNEl1eE0rTDVCY09TOW9Qc1VGV0M4?=
 =?utf-8?B?cC8wQ3BQcGlNS3J0V3NZRkxQMzdxMDVleVAzdmdiZTdjcXNtd1dFUzFveXVE?=
 =?utf-8?B?SFZ6NzBtYmVXZGpGeXhKb1RUcVNQM3d2NnZETXlXTFNoa3Z6eFQ2SzNKejEr?=
 =?utf-8?B?bENSZkVIcmFYc1dSbkhCSERyRDNDTjhhZVJGYnVCTTNYT3dBeFpsQ0pHbHA3?=
 =?utf-8?B?SmZmY3FvbzJFUzZwUGJ1TjJPc1hrTTEwNG51MXptMFM0WitqUzRrZUFjaENF?=
 =?utf-8?B?bTBuWHZXaldsaTBXdldCU0t3b3Z5OXNzL1Rxbkl1REkyZUxjOVIvaW1FeXVS?=
 =?utf-8?B?b09kU1BqQnlNMHhqYXlPRzBoR2RQdCtVQnBBcFhqUTVQcmtmY0lJbzU3bFRV?=
 =?utf-8?B?S1Y3MElnSlJsMnZsSTgzRVVKd1JkS0J6anFVREd6eTBaK0p0T2c2SkRrWE1y?=
 =?utf-8?B?am94Zm9JY3ZRalhXbzUrUFgrYVVZL1pRaTRVeEQ0OHh4SUhlOS85Q3pVVlZh?=
 =?utf-8?B?clJhUUFyNUlGZC9jWU83MXhtejdIN1ZQM1V3UjdvaS9IMWwzR3V5SFNZd1o0?=
 =?utf-8?Q?bI8mrPUxwS7nV4rw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 819e43da-716e-4961-842c-08da3890ba3c
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 05:39:08.0757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 86yud+U0/mhFXx9NHWUTdbUZC+47/cpPurBdYZl3HjWKtkH4t7K3dass9XBZt5CHLJB/msYfbQ9wHJP58mJx5o7vue1jwirt8nti7NL6d1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3707
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
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon-16-05-2022 02:09 pm, Jani Nikula wrote:
> On Mon, 02 May 2022, Harry Wentland <harry.wentland@amd.com> wrote:
>> Both the kernel and IGT series look good to me.
>>
>> I recommend you merge the entire kernel set as one into drm-next. We
>> can pull it into amd-staging-drm-next so as not to break our CI once
>> the IGT patches land.

@Harry

Can we have your Ack-by to merge this series via drm-misc-next?
IGT patches are already landed. :-)

- Bhanu

> 
> Can we read that as an ack to merge via drm-misc-next? :)
> 
> BR,
> Jani.
> 
> 

