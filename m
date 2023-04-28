Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CFF6F1B52
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 17:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0633A10E3DD;
	Fri, 28 Apr 2023 15:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5513C10E3D9;
 Fri, 28 Apr 2023 15:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682695199; x=1714231199;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=n2ZHOpCzqn9CXDcy/CNEmeaDrg77SLVYaUF7rvI8OcA=;
 b=Y06RjkdVqmVpXU5JGa4V2m1Me8j1G4pLsWAWkqypMHBN9/heDnH22ASb
 BKTkS8JledpOXyerVYl1amjBz1coE78n4m4N5OZTqN3ZFoQZB2oqMsbmS
 Ec06BUcZ2kmeP+FVkzQmCfCWnOF0h9HK3C+zBQURUHCWtLxE1XXvkppib
 FJOZcA1B/aFHDNHp4F1TYwVVkLQlkY1KZjItTHVk5BjPumZx7iNtksOXy
 vdm93S1mxKfHRxTPCePyMnuh8t30U7Artb69k8d8j06ZPXLI9Bs6gE6gY
 5g5jZZPEZ3C40j4+jsUhjl0BF73XzB1Ug5csVpxXOvAY9d7CEd3QrLj0C g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="434063925"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; 
 d="scan'208,217";a="434063925"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 08:19:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="941127432"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; 
 d="scan'208,217";a="941127432"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 28 Apr 2023 08:19:15 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 28 Apr 2023 08:19:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 28 Apr 2023 08:19:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 28 Apr 2023 08:19:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 28 Apr 2023 08:19:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqcokbTm4Yiqsxoq5Jtl1oOM/zbIYszl9815z8K+tZup0rBEkblpN6CcsOs+ukj9UZmOPeIMKd7dvNWfgMfEIaJHC/1M0WkaDuJAnxA9PW2W0or3sd71EDC8VSCxHiv6G0hLvGCUpraEUlnK30HZUoN8yDuxyPeZZ/mHWl5nb783MpZQIRBRH39l8BlewpsRASQXK+QFWdI4FrN59475eR4KcQTMKAhFcfHToPgl+Bx7gKgF2qWPvoon0MDIve1XDhhNjdpX55TSaGkqgw3w4l5NBYpKdg5BpUZWfQaHNVqaoqO6I2HQfirqHXJpVOQvtwuSJ0eAC/FAzAA+fbP1Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BejDERvnR68EfCh5JKqfc8AfxfzSxT5wTnXHvwVaF/k=;
 b=Wg5RGFlEEaNuzCNgZ7RjBQ9hOKdhz9Ht6yERnfYm7+IDdIwyOd4Gpnp/tUNuusGhPdQOhtK0rdcKaf93U5z0KYfFSAwhuozHE9SvFlqiIERzQPMEYiQ64LGBzfOE1w9zn1EP8cs5lHq/B4L221cDZAAGXJreMF9WSZVjAEdpYAxUdwuvIszmNuRO+ua+tQP6TdcInblRCCCxObaez+8qMxaOg1xiHwZ6ScyQolLiymc+hNVoSkywGtFgIkv20UKS8uGWKuDd/LwEwAC14DV8Gstc5+WqEyROpkpp1vpK6LkpFPM9i9Z/ycTshEVXJvCGqCjXsNhguZqm4P8dTEz1Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by PH7PR11MB7098.namprd11.prod.outlook.com (2603:10b6:510:20d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.24; Fri, 28 Apr
 2023 15:19:06 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::37e2:bdec:585b:383c]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::37e2:bdec:585b:383c%3]) with mapi id 15.20.6340.023; Fri, 28 Apr 2023
 15:19:06 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: =?iso-8859-1?Q?Thomas_Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 0/5] drm/i915: Allow user to set cache at BO creation
Thread-Topic: [PATCH v3 0/5] drm/i915: Allow user to set cache at BO creation
Thread-Index: AQHZeZTO2gUkMdpWW0SrzgKyn7l+gq9AXZ+AgABuxEc=
Date: Fri, 28 Apr 2023 15:19:06 +0000
Message-ID: <BYAPR11MB25676E1468DEEB827E889DA39A6B9@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230428054737.1765778-1-fei.yang@intel.com>
 <e1c73441-df6f-799c-eda0-8639067a0fea@shipmail.org>
In-Reply-To: <e1c73441-df6f-799c-eda0-8639067a0fea@shipmail.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|PH7PR11MB7098:EE_
x-ms-office365-filtering-correlation-id: 80d307d3-a5e4-417d-cc5b-08db47fbe850
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: svm1HXVdyvLJzxtVwxH7OjZ9RLLr5NxVx3LF5quLPcXZVhB0G065FHQIqNU7TCqOJKNwZav1hhIRvNVBTBTAJKKGlbOzLnndp5TqH+yxVfhzKgp4Ji8dejvxD1uS1nGvIVgEJ25v4v0pY2mIa2/o5CNhS5lKGSsHxUKph3aWX0JqRA7gRT4FybUw+M2NQ1gWwDyXRGaUZIun4pZJcfWRdXWz3NFZkIS2NuP8XTw2amgiAa6SAwuO36sdSISWe23kdni0QdSDHqQ6xhpsuTr565WSEyKhKSLabvEagVD7gAE27u94S9Z45poJ8FeMr/CSkxOeABc6CFNRF6owVv5CUJu/ui5V2zZe/orlUscRF88tfeekBpyxzMxD2p0Lvr7vZK9l2Jgz4xHit02KqHib4gpSvwGSk832yjNfHJ6NythHemY59nlzbgzH9R3ebBSyYF4R/uBVcKj3mU6g1qbB6voPFJC+z0X/FvDm9Qz206HBnNODjI2NGX1439p83cQzWxUYG6wAsrv/e5SOMzElwGShikPYgVoQfHo04zFWoG0J/WXDMD2Bbe8uW75iN5XA3cPyUKVCfQJSseCL2Nlqaf7tAggxRVMtCq2qSbsG86w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(346002)(366004)(396003)(39850400004)(451199021)(66946007)(66446008)(76116006)(64756008)(66476007)(66556008)(33656002)(71200400001)(2906002)(7696005)(26005)(9686003)(82960400001)(6506007)(53546011)(41300700001)(966005)(55016003)(186003)(4326008)(316002)(38070700005)(122000001)(38100700002)(5660300002)(83380400001)(8676002)(8936002)(52536014)(19627405001)(478600001)(86362001)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?OoZiKypoovXp6zDGfDw/rfKMT4TXUf7oBdliMV+Ush1xeJbY2/zbhkVOM+?=
 =?iso-8859-1?Q?Xhx8/UiEeKjD9Ey/yf0CRTBJ9zUsDhtT4Fkoq8HaAKzt4qi94PJ6LIOjsZ?=
 =?iso-8859-1?Q?UHLTyYPF5NbveGT3j40aoV/LGbi9CMIipZKWK2WOxPWfehRkZyz/616ZAr?=
 =?iso-8859-1?Q?U15KRyGYT89+fIVf9CLbUMl6RLV1Hs+4X3QbfNMjDr34f2YHNE9wRe1hnf?=
 =?iso-8859-1?Q?3zHR5wRdS3cXbhm83d3yIyeh5h+D8RZRBotS97YUMsNNqL8yyBxVlT4U+N?=
 =?iso-8859-1?Q?Tksz7QC7e6yTPVx5Pmf2u3/x16NyE/8piClyObAPKtJMYl+AGwqNtvqL7D?=
 =?iso-8859-1?Q?VMy9IM7O2S7m2iWyfcxfnvg3njhYLZmUQH/7EfblWiiYUojSekMsHT13e1?=
 =?iso-8859-1?Q?dlufcRIFeGs6VETKSsmS3P7L6OcW4lCqxEnM0HLzVzALr3sqMiERijreeI?=
 =?iso-8859-1?Q?f2Ti2mXENbFPCKKwjSjqg1vHd2GLOdDU4n+6r5KBVdbbEmF7q9fLWIEuzJ?=
 =?iso-8859-1?Q?0EoqZa0DDMw9/+5UpAzWjhBnEgXiXYORZhkCrPP7VoGcAO3W7yW6gBqQge?=
 =?iso-8859-1?Q?pC6k908K13R/n/uNBZ3DDtgRnRu8KznR8z0SrrqFvQBP3YIK+hBUCpgOxO?=
 =?iso-8859-1?Q?NP/mN7TKdjIk3Ms5+pnRyR06oEKH3wCijHP+fwkjW8z5qqo9VgCyP0eHWQ?=
 =?iso-8859-1?Q?phz16KBxfg9DSO8VsQnGoU7WIu91EJKq2SgEQ78LgscZWNsateAKbuyPt6?=
 =?iso-8859-1?Q?DZcLgcRjpbxVhwoqiDMY/mdIOqmblRt+cR5LhmU2cpK5Zabmlcd+RDAN8N?=
 =?iso-8859-1?Q?KkcgJN9bvAbHP2F8EC3LXWYcXCWPH+aMMVm3qUP7MuFtphfEVeWGVh4ADc?=
 =?iso-8859-1?Q?6Hpo1m0WrWhz/YUWW38w0Erf13lx9nR+mHF+XIo8I6ZOyInX6dMseZs8X2?=
 =?iso-8859-1?Q?NNgb7aAmd7vaPWRCkQucmjkRIIpq6o5/4RGUVU5Bb7vLGFXs7cWYRYZHSp?=
 =?iso-8859-1?Q?mdqH0ANf5MxOo9+MQHohotrsH9FR553mbXvtEZ5M8dMF/wmOVFqWjNyAZ4?=
 =?iso-8859-1?Q?ySjP6DFDxmTaQ7K33P5WnuDTxmSImZ/61dFYoXU6i6BhrZ7lYfYdZubkXs?=
 =?iso-8859-1?Q?ZRbkrSPjOl2KLJn5jlmD+9oRYnzW7WtpUVzXXsKe/bMiCCUgN1zbn8dmt7?=
 =?iso-8859-1?Q?t9EEd5aIPbD8D2tbD7wXiM4EQLFjDRLEucnphrkGPgwQPd+cJmIubnQiTo?=
 =?iso-8859-1?Q?z6prrCLqt6atH85yxlJ5u4SgWB6vYMLa9lqDgZag53Zv5w/JOmqJF+HxNV?=
 =?iso-8859-1?Q?ZiTrM5JfkOczDJMPaq6d/d6YotPBVIt4lCSh/p4bm74Tyivz1qtrBqPzz0?=
 =?iso-8859-1?Q?wZA+2c+3tzKJ3yl/szo87CM6yxYjr3wDkfuzrkNT7r2VVsEQ9HyE2QgY4w?=
 =?iso-8859-1?Q?UcuGxhdnUu8a5wOFYpT2vpIKWbpN/IsAyD8qjSoa6xAHy+sk5GfwU2PAtv?=
 =?iso-8859-1?Q?jVIvDezHxynKX0hd7GUB/aibk5aFcI78IIuLGUo8PmU51EWFrZXx4saz3i?=
 =?iso-8859-1?Q?ltNxNCxbAZeJn50isejPJ3ZIhVq5QiWzatzPnsdcc5XxIQHskjc1ybpIic?=
 =?iso-8859-1?Q?hFE7ILqO3UkME=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB25676E1468DEEB827E889DA39A6B9BYAPR11MB2567namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d307d3-a5e4-417d-cc5b-08db47fbe850
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2023 15:19:06.2905 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9QhswCJB22bk18UTFHN8PH58JMi8aiMYicz8Fv6IjDIqA/uCAj0AfxPxIuFtaoQTzvWY59jIxU+/zAr4TiubUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7098
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR11MB25676E1468DEEB827E889DA39A6B9BYAPR11MB2567namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> On 4/28/23 07:47, fei.yang@intel.com wrote:
>> From: Fei Yang <fei.yang@intel.com>
>>
>> The first three patches in this series are taken from
>> https://patchwork.freedesktop.org/series/116868/
>> These patches are included here because the last patch
>> has dependency on the pat_index refactor.
>>
>> This series is focusing on uAPI changes,
>> 1. end support for set caching ioctl [PATCH 4/5]
>> 2. add set_pat extension for gem_create [PATCH 5/5]
>>
>> v2: drop one patch that was merged separately
>>      341ad0e8e254 drm/i915/mtl: Add PTE encode function
>> v3: rebase on https://patchwork.freedesktop.org/series/117082/
>
> Hi, Fei.
>
> Does this uAPI update also affect any discrete GPUs supported by i915,

It does.

> And in that case, does it allow setting non-snooping PAT indices on
> those devices?

It allows setting PAT indices specified in https://gfxspecs.intel.com/Preda=
tor/Home/Index/45101 .
KMD does a sanity check so that it won't go over the max recommended
by bspec.

> If so, since the uAPI for discrete GPU devices doesn't allow incoherency
> between GPU and CPU (apart from write-combining buffering), the correct
> CPU caching mode matching the PAT index needs to be selected for the
> buffer object in i915_ttm_select_tt_caching().

The patch doesn't affect the CPU caching mode setting logic though.
And the caching settings for objects created by kernel should remain
the same for both CPU and GPU, objects created by userspace are
managed completely by userspace.

One question though, what do you mean by non-snooping PAT indices?
The PAT index registers don't really control coherency mode in the past,
I believe MTL is the first one that has COH_MODE in the PAT registers.
Aren't discrete GPUs snooping CPU cache automatically?

-Fei

> Thanks,
> Thomas
>
>>
>> Fei Yang (5):
>>    drm/i915: preparation for using PAT index
>>    drm/i915: use pat_index instead of cache_level
>>    drm/i915: make sure correct pte encode is used
>>    drm/i915/mtl: end support for set caching ioctl
>>    drm/i915: Allow user to set cache at BO creation
>>
>>   drivers/gpu/drm/i915/display/intel_dpt.c      | 12 +--
>>   drivers/gpu/drm/i915/gem/i915_gem_create.c    | 36 +++++++++
>>   drivers/gpu/drm/i915/gem/i915_gem_domain.c    | 46 ++++++-----
>>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 10 ++-
>>   drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  3 +-
>>   drivers/gpu/drm/i915/gem/i915_gem_object.c    | 67 +++++++++++++++-
>>   drivers/gpu/drm/i915/gem/i915_gem_object.h    |  8 ++
>>   .../gpu/drm/i915/gem/i915_gem_object_types.h  | 26 +++++-
>>   drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  9 ++-
>>   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  2 -
>>   drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  4 +-
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  | 16 ++--
>>   .../gpu/drm/i915/gem/selftests/huge_pages.c   |  2 +-
>>   .../drm/i915/gem/selftests/i915_gem_migrate.c |  2 +-
>>   .../drm/i915/gem/selftests/i915_gem_mman.c    |  2 +-
>>   drivers/gpu/drm/i915/gt/gen6_ppgtt.c          | 10 ++-
>>   drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 73 +++++++++--------
>>   drivers/gpu/drm/i915/gt/gen8_ppgtt.h          |  3 +-
>>   drivers/gpu/drm/i915/gt/intel_ggtt.c          | 76 +++++++++---------
>>   drivers/gpu/drm/i915/gt/intel_gtt.h           | 20 +++--
>>   drivers/gpu/drm/i915/gt/intel_migrate.c       | 47 ++++++-----
>>   drivers/gpu/drm/i915/gt/intel_migrate.h       | 13 ++-
>>   drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  6 +-
>>   drivers/gpu/drm/i915/gt/selftest_migrate.c    | 47 +++++------
>>   drivers/gpu/drm/i915/gt/selftest_reset.c      |  8 +-
>>   drivers/gpu/drm/i915/gt/selftest_timeline.c   |  2 +-
>>   drivers/gpu/drm/i915/gt/selftest_tlb.c        |  4 +-
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 10 ++-
>>   drivers/gpu/drm/i915/i915_debugfs.c           | 55 ++++++++++---
>>   drivers/gpu/drm/i915/i915_gem.c               | 16 +++-
>>   drivers/gpu/drm/i915/i915_gpu_error.c         |  8 +-
>>   drivers/gpu/drm/i915/i915_pci.c               | 79 ++++++++++++++++---
>>   drivers/gpu/drm/i915/i915_vma.c               | 16 ++--
>>   drivers/gpu/drm/i915/i915_vma.h               |  2 +-
>>   drivers/gpu/drm/i915/i915_vma_types.h         |  2 -
>>   drivers/gpu/drm/i915/intel_device_info.h      |  5 ++
>>   drivers/gpu/drm/i915/selftests/i915_gem.c     |  5 +-
>>   .../gpu/drm/i915/selftests/i915_gem_evict.c   |  4 +-
>>   drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 15 ++--
>>   .../drm/i915/selftests/intel_memory_region.c  |  4 +-
>>   .../gpu/drm/i915/selftests/mock_gem_device.c  |  9 +++
>>   drivers/gpu/drm/i915/selftests/mock_gtt.c     |  8 +-
>>   include/uapi/drm/i915_drm.h                   | 36 +++++++++
>>   tools/include/uapi/drm/i915_drm.h             | 36 +++++++++
>>   44 files changed, 621 insertions(+), 243 deletions(-)
>>


--_000_BYAPR11MB25676E1468DEEB827E889DA39A6B9BYAPR11MB2567namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted2">
&gt; On 4/28/23 07:47, fei.yang@intel.com wrote:
<div class=3D"ContentPasted0">&gt;&gt; From: Fei Yang &lt;fei.yang@intel.co=
m&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; The first three patches in this seri=
es are taken from</div>
<div class=3D"ContentPasted0">&gt;&gt; https://patchwork.freedesktop.org/se=
ries/116868/</div>
<div class=3D"ContentPasted0">&gt;&gt; These patches are included here beca=
use the last patch</div>
<div class=3D"ContentPasted0">&gt;&gt; has dependency on the pat_index refa=
ctor.</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; This series is focusing on uAPI chan=
ges,</div>
<div class=3D"ContentPasted0">&gt;&gt; 1. end support for set caching ioctl=
 [PATCH 4/5]</div>
<div class=3D"ContentPasted0">&gt;&gt; 2. add set_pat extension for gem_cre=
ate [PATCH 5/5]</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; v2: drop one patch that was merged s=
eparately</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp;341ad0e8e254 drm=
/i915/mtl: Add PTE encode function</div>
<div class=3D"ContentPasted0">&gt;&gt; v3: rebase on https://patchwork.free=
desktop.org/series/117082/</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Hi, Fei.</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Does this uAPI update also affect any di=
screte GPUs supported by i915,</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">It does.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt; And in that case, does it allow setting =
non-snooping PAT indices on</div>
<div class=3D"ContentPasted0">&gt; those devices?</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">It allows setting PAT indices specified in ht=
tps://gfxspecs.intel.com/Predator/Home/Index/45101 .</div>
<div class=3D"ContentPasted0">KMD does a sanity check so that it won't go o=
ver the max recommended</div>
<div class=3D"ContentPasted0">by bspec.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt; If so, since the uAPI for discrete GPU d=
evices doesn't allow incoherency</div>
<div class=3D"ContentPasted0">&gt; between GPU and CPU (apart from write-co=
mbining buffering), the correct</div>
<div class=3D"ContentPasted0">&gt; CPU caching mode matching the PAT index =
needs to be selected for the</div>
<div class=3D"ContentPasted0">&gt; buffer object in i915_ttm_select_tt_cach=
ing().</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">The patch doesn't affect the CPU caching mode=
 setting logic though.</div>
<div class=3D"ContentPasted0">And the caching settings for objects created =
by kernel should remain</div>
<div class=3D"ContentPasted0">the same for both CPU and GPU, objects create=
d by userspace are</div>
<div class=3D"ContentPasted0">managed completely by userspace.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">One question though, what do you mean by non-=
snooping PAT indices?</div>
<div class=3D"ContentPasted0">The PAT index registers don't really control =
coherency mode in the past,</div>
<div class=3D"ContentPasted0">I believe MTL is the first one that has COH_M=
ODE in the PAT registers.</div>
<div class=3D"ContentPasted0">Aren't discrete GPUs snooping CPU cache autom=
atically?</div>
<div class=3D"ContentPasted1"><br>
</div>
<div class=3D"ContentPasted1">-Fei</div>
<div class=3D"ContentPasted1"><br>
</div>
<div class=3D"ContentPasted1">&gt; Thanks,</div>
<div class=3D"ContentPasted1">&gt; Thomas</div>
<div class=3D"ContentPasted1">&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; Fei Yang (5):</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; &nbsp;drm/i915: preparation f=
or using PAT index</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; &nbsp;drm/i915: use pat_index=
 instead of cache_level</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; &nbsp;drm/i915: make sure cor=
rect pte encode is used</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; &nbsp;drm/i915/mtl: end suppo=
rt for set caching ioctl</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; &nbsp;drm/i915: Allow user to=
 set cache at BO creation</div>
<div class=3D"ContentPasted1">&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; drivers/gpu/drm/i915/display/=
intel_dpt.c &nbsp; &nbsp; &nbsp;| 12 +--</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gem/i915=
_gem_create.c &nbsp; &nbsp;| 36 +++++++++</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gem/i915=
_gem_domain.c &nbsp; &nbsp;| 46 ++++++-----</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; .../gpu/drm/i915/gem/i915_gem=
_execbuffer.c &nbsp; &nbsp;| 10 ++-</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gem/i915=
_gem_mman.c &nbsp; &nbsp; &nbsp;| &nbsp;3 +-</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gem/i915=
_gem_object.c &nbsp; &nbsp;| 67 +++++++++++++++-</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gem/i915=
_gem_object.h &nbsp; &nbsp;| &nbsp;8 ++</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; .../gpu/drm/i915/gem/i915_gem=
_object_types.h &nbsp;| 26 +++++-</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gem/i915=
_gem_shmem.c &nbsp; &nbsp; | &nbsp;9 ++-</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gem/i915=
_gem_shrinker.c &nbsp;| &nbsp;2 -</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gem/i915=
_gem_stolen.c &nbsp; &nbsp;| &nbsp;4 +-</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gem/i915=
_gem_ttm_move.c &nbsp;| 16 ++--</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; .../gpu/drm/i915/gem/selftest=
s/huge_pages.c &nbsp; | &nbsp;2 +-</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; .../drm/i915/gem/selftests/i9=
15_gem_migrate.c | &nbsp;2 +-</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; .../drm/i915/gem/selftests/i9=
15_gem_mman.c &nbsp; &nbsp;| &nbsp;2 +-</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/gen6_=
ppgtt.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 10 ++-</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/gen8_=
ppgtt.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 73 +++++++++--------</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/gen8_=
ppgtt.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;3 +-</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/intel=
_ggtt.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 76 +++++++++---------</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/intel=
_gtt.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 20 +++--</div>
&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/intel_migrate.c &nbsp; &nbsp; &nbsp=
; | 47 ++++++-----
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/intel=
_migrate.h &nbsp; &nbsp; &nbsp; | 13 ++-</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/intel=
_ppgtt.c &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;6 +-</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/selft=
est_migrate.c &nbsp; &nbsp;| 47 +++++------</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/selft=
est_reset.c &nbsp; &nbsp; &nbsp;| &nbsp;8 +-</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/selft=
est_timeline.c &nbsp; | &nbsp;2 +-</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/selft=
est_tlb.c &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;4 +-</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/uc/in=
tel_uc_fw.c &nbsp; &nbsp; &nbsp;| 10 ++-</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; drivers/gpu/drm/i915/i915_deb=
ugfs.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 55 ++++++++++---</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; drivers/gpu/drm/i915/i915_gem=
.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 16 +++-</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; drivers/gpu/drm/i915/i915_gpu=
_error.c &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;8 +-</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; drivers/gpu/drm/i915/i915_pci=
.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 79 ++++++++++++++++--=
-</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; drivers/gpu/drm/i915/i915_vma=
.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 16 ++--</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; drivers/gpu/drm/i915/i915_vma=
.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;2 +-</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; drivers/gpu/drm/i915/i915_vma=
_types.h &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;2 -</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; drivers/gpu/drm/i915/intel_de=
vice_info.h &nbsp; &nbsp; &nbsp;| &nbsp;5 ++</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; drivers/gpu/drm/i915/selftest=
s/i915_gem.c &nbsp; &nbsp; | &nbsp;5 +-</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; .../gpu/drm/i915/selftests/i9=
15_gem_evict.c &nbsp; | &nbsp;4 +-</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; drivers/gpu/drm/i915/selftest=
s/i915_gem_gtt.c | 15 ++--</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; .../drm/i915/selftests/intel_=
memory_region.c &nbsp;| &nbsp;4 +-</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; .../gpu/drm/i915/selftests/mo=
ck_gem_device.c &nbsp;| &nbsp;9 +++</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; drivers/gpu/drm/i915/selftest=
s/mock_gtt.c &nbsp; &nbsp; | &nbsp;8 +-</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; include/uapi/drm/i915_drm.h &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 36 ++++++++=
+</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; tools/include/uapi/drm/i915_d=
rm.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 36 +++++++++</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; 44 files changed, 621 inserti=
ons(+), 243 deletions(-)</div>
<div class=3D"ContentPasted2">&gt;&gt;</div>
<br>
</div>
</body>
</html>

--_000_BYAPR11MB25676E1468DEEB827E889DA39A6B9BYAPR11MB2567namp_--
