Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6BB6D8F61
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 08:28:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075DA10EADD;
	Thu,  6 Apr 2023 06:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1676E10EADD;
 Thu,  6 Apr 2023 06:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680762510; x=1712298510;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AWIg3hzcgj9U96/6LDAMAt5csJpzomSCScO7VSSi49M=;
 b=CC8+OumlNeGjlQ5eSTdj/8rCuyMT2m/O/a8cP0qTaujag6swR3GOmKBS
 SOSFUKzB7GHhJKv4je89ojNHVo3/R1BWHyeQXrD3rnBcJaUVc5SDODxIb
 3grDHUAzz89B8pq2C2xakOCaPXR2b/qRvtatzF+AnlMZIHbH+IqAQuE2b
 tUT6ISlTRX7m02IotO3dP563tunGg3W1sVIkgSuZs1g5wshU+UZ7PypLz
 o12RlwPkBgcDG+TdYsFMgAeJ6vU0nH6kzA2bClH/wbf7/hWO+9QDrh5Gr
 2azU9rXr3sZGWmHdy+25zAQvdk1osMPpxQaafxb8Vq6/U3FccUVk4NI94 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="340144030"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="340144030"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 23:28:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="861272525"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="861272525"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 05 Apr 2023 23:28:28 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 23:28:28 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 23:28:28 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 23:28:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7hwEi7zJmnjPIlahjz/nzCILOhQWKntH8IfERk8TglwAZXbfNaCJBtyUJkBG1cEcXwZel5Fh+Lvn6oxQ8IoMuAMopI5t29ToKvFkq7Ew12yM0uucwFyF31Db5kWoY7j5BvqnR3xYgzYCZlx/Mb6Vd5V2x+FGEgXBQ+nujN1/ynQeMIxH8TOFml3D6tW3uEPsJqoqsRugqeMUu+PbjXSjrdWIo9uEOM4OYFr6vNsfNbwp8GEPSmBuV9iZ05k3FnfSSICK7Mzngv+y0XZSNwR1EiejqqqAsYbLfrpIOO5QqzWwz3u7xAFDJkjSxQ9wAbsoKIOKxnrA7ce2tv8Nk490A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWIg3hzcgj9U96/6LDAMAt5csJpzomSCScO7VSSi49M=;
 b=OJ8G3aOv9UcW17msNXjQH/ecixUZu4EwKzhimUpMMdSeFgaazxVcv3Qzd7T2NRe8lGHikM17GKRUpsznrNFKkE6TbNIaMPVu4DPWqXMzTFGWwZgkfK7hk1sp8Wl6eUSRoLrsIgBJ1yq6/gO/Y46q2Ac5wmzKiXbWoK43mNBimhS9AoOH2hO5uCVVyFBdq9imuHEWCUCR/B1yDbdpHxCCgOXM0zSYcbhG91psSbGnrK1BzFCqjFwG6qllXFQAI6fXwMf2eWGBRY4wtwfY9O3G5RQjkIvjcA8O+yfDqtT5j6FwOnIn46eDxJu392OdWmW2pILM3adnRE+rygnhTBPgfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by DM4PR11MB7398.namprd11.prod.outlook.com (2603:10b6:8:102::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.23; Thu, 6 Apr
 2023 06:28:26 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::12b1:c9af:ed85:e3ee]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::12b1:c9af:ed85:e3ee%6]) with mapi id 15.20.6277.031; Thu, 6 Apr 2023
 06:28:25 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH 5/7] drm/i915: use pat_index instead of cache_level
Thread-Topic: [PATCH 5/7] drm/i915: use pat_index instead of cache_level
Thread-Index: AQHZZGRhzCzjM8mcJUyzrl8CnRb2/a8ZrnkAgAAix+CAAAWDAIAAJWuggAAGkgCAA9UJkA==
Date: Thu, 6 Apr 2023 06:28:25 +0000
Message-ID: <BYAPR11MB2567CF1240BFBED52CC1FFC89A919@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230401063830.438127-1-fei.yang@intel.com>
 <20230401063830.438127-6-fei.yang@intel.com> <ZCrntC9f1E0MZlXa@intel.com>
 <BYAPR11MB25675C7C3491973BB79379E29A929@BYAPR11MB2567.namprd11.prod.outlook.com>
 <ZCsJgNB1XY1yuq7Y@intel.com>
 <BYAPR11MB2567738B001C8830D130C8279A929@BYAPR11MB2567.namprd11.prod.outlook.com>
 <ZCsuZnNd7EtJHqim@intel.com>
In-Reply-To: <ZCsuZnNd7EtJHqim@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|DM4PR11MB7398:EE_
x-ms-office365-filtering-correlation-id: 8de7f0a2-6b60-46a0-eeb5-08db366820d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0pIJQ7OcK/pwubhziX9hBaFmuRTSfUn8lKrhwcetZ39Q3jmTtS91Eq0HrrtZcUA+wVs1X6/Fm3LDJ+9dUh4nFHhUJ8suooMy6Uxpb3e7LRLzeRVMynmhJdRXnO6VVd0qnKAEvYcI8tvtaNZLS47OX76zmmFdy8s5SpD9aEP+lWFNzb6n9glrj216k/M1TEA8HRWBulZM9vwWiqtudDB/XnI43kHNoarTNmZ+K9xbA2LWaqcxzdz66WJQccO0g1mULSUmfgTZ/665lCG7/7RuVnK/H6ixntDNyiejPxSrB82y4iCpJfQAF4nmamvbvVSAEaSULXYP9d7pCc4fNTkLFchFPwcV4snQ6rLJpP9GIKtQIHSKR1U2J6lmy8vRHlyusU4VuEHIX8KaLyixI8bjtjH3cvgoELfH/KK13tg0/dUdiubG6BT9rxvnzbyGMIa7+CMYO+4LFM1zTGs73/1biB8bKHtZz/OuMgEMl6nbHXo2CCXCzxpZHdkbJv9rm+wW/uJ927qC+ch35gkb5xIc8YD6aY+xCW3cllpbbt+sSAHT7hSyeprnKT7HMqA9Z91KMdpmRfVt8qCZav6xKiGgfFsvEYaHoKnQBHrsIlIPn2w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(376002)(396003)(136003)(39860400002)(451199021)(66446008)(8936002)(55016003)(6506007)(26005)(186003)(5660300002)(66556008)(9686003)(86362001)(76116006)(122000001)(2906002)(38070700005)(7696005)(41300700001)(54906003)(52536014)(66574015)(316002)(66476007)(83380400001)(66946007)(64756008)(6916009)(966005)(33656002)(82960400001)(478600001)(8676002)(4326008)(71200400001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?awcf8URjXar7FbcbpoFbtOuNC5gpmgx30Pf9N+MgdXtwxHkPZ+vhwnEsU4?=
 =?iso-8859-1?Q?4IPYDnSGHwtljJ05SFRXDU7nEyghng1Qeinw9Ghm2mGXXVIi5Tx6o0qLCF?=
 =?iso-8859-1?Q?ccw6xoS2RYg9V1xjMDzXRMTXm3jqHPCb6zzfPHsV8hpYEHvXzCskUb4yp1?=
 =?iso-8859-1?Q?GrvqddrRzSEHgaSMSEwX1EkEyqAhSpb+0+2xQ4r5o1Vvd4pM8o4xRKsmSl?=
 =?iso-8859-1?Q?uVeItQ/EmDtM2StzAYnas5gpmsv6BtoDDzuJBZsNf5d/OqCY1ZLtsWIrv5?=
 =?iso-8859-1?Q?zgAo4HMcoj+KGM7rS1Qpzx5MVdg9dVVFSYFflBnXjFUA8rXTtl2lKNSqYp?=
 =?iso-8859-1?Q?27e5JG8OQ6ENL4KJEqW8NZ5+va4Puq5BYgZpM+ecoaqKjVESL6E4ok9Eeb?=
 =?iso-8859-1?Q?PTyVMcEP/I/jOTfZ93ZvEKUnWXjJSCo/kHA5bXSlKN8y3weL7rguaexJWC?=
 =?iso-8859-1?Q?EXXwMcdv+UKhmG8LPStkjLImnI1m2ZuD4dBoGqFl02E+MTNJ6XPeeoAZv8?=
 =?iso-8859-1?Q?cK3/aMD8JJEnu2iU0Qm2w9gJt2mLbdGF2Om3q4N2PnifWlphqvfXnx5GnZ?=
 =?iso-8859-1?Q?HDi/40sbBYywcjb9HM7WNie8gt5xuG7JcKo+D1yVsluM0NDVrx2AtU1oqX?=
 =?iso-8859-1?Q?OoWp4yDS0D7yJFVUsEVpXD6LAm/a5Mo3yK9bp/oaHb77HHaekMqZDFSyB1?=
 =?iso-8859-1?Q?PrFLG7InPfpTDa8ZWC3os/6UXp2N84/l+F5iyDfkz2S63rwSpRWqBfvwrg?=
 =?iso-8859-1?Q?8nmEt8nH6GKGR2pLyG2X8kQHzLMLrTwELLP1QCGBYV12RDMs+RrdCoLpRk?=
 =?iso-8859-1?Q?Ay39KzsH5EHCuML6N9SX8/TqAPh8l7hqkG7N1uD+pn2dMU1uEObdUWKsAw?=
 =?iso-8859-1?Q?6IyHwxFJ9WYlSWWFjF3V7dgYbrH+k5aoYg1HnJ1E/Cl0NAuZtNwwSjrT0G?=
 =?iso-8859-1?Q?4P0OFx+BNmowfrQ7Nygkm4nI7Oz/P33ijm781S+5RYU+ARLLSavyBF6A2o?=
 =?iso-8859-1?Q?FDPrxm3IGr0HSPWc0bLjONch8lFbK1lXoL8ZIaft7RDSaKJpZ/Ecylc299?=
 =?iso-8859-1?Q?gkIoO+QmaA+MYkVK9aVXTj3Pmx4HoTds0WA8bIWZwweluWLlNQ6NuQnhwx?=
 =?iso-8859-1?Q?GhMUkH4y6C8Bdlkp5qWHhiVuhRB797tX+oO6zjBEJ1g3qIc/MqSYh3Frpa?=
 =?iso-8859-1?Q?iEaxO+fZMaaMUe4+xK+R4074ZgOLOLEI2swbHsJ9kMMGxfD5dmoOgLKEXl?=
 =?iso-8859-1?Q?Ll396y8Koq0bFUOYVAZySz9aI+T3DmLTRdUVFvlUTF5Ps4KEbmrjziJY9u?=
 =?iso-8859-1?Q?2bEMJ4EwxCV39+PRrv3UHSbjd688IbXXZFsRx9/B8uhZB97E0gahkTFAzH?=
 =?iso-8859-1?Q?8qgRRYUXZjgJz1Ur7rPwBHyQStwKOOVpnm0qqAAHYxYhwX4TLrvC75c/rN?=
 =?iso-8859-1?Q?6SHj4Ko/K8SUl/wQ7URxZUKKim9jCRWf1HNu8Uk9J8MqPitO42SwRcqXM6?=
 =?iso-8859-1?Q?Ox52RjpeWPAcyKv8opG9gVvGYPzNVwSQfPXvxMEbiJaHq0KkG1MgYK9Fgd?=
 =?iso-8859-1?Q?7XHF/iO1m0Z1Valk5qRRHRlheMBykg4PlB5S1twhQFfOE/+mAzRGWgYhhC?=
 =?iso-8859-1?Q?YorIE0OL8sxLM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de7f0a2-6b60-46a0-eeb5-08db366820d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2023 06:28:25.8196 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pTkuBSMljwvFpMcWp9Ff56HiSS8wQQzcmw+BkE3pHhxGk0Taz7BSMjromeOizwmRt3ry/19NDtn18JVaJP/HtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7398
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> On Mon, Apr 03, 2023 at 07:39:37PM +0000, Yang, Fei wrote:
>>> Subject: Re: [PATCH 5/7] drm/i915: use pat_index instead of cache_level
>>>
>>> On Mon, Apr 03, 2023 at 04:57:21PM +0000, Yang, Fei wrote:
>>>>> Subject: Re: [PATCH 5/7] drm/i915: use pat_index instead of
>>>>> cache_level
>>>>>
>>>>> On Fri, Mar 31, 2023 at 11:38:28PM -0700, fei.yang@intel.com wrote:
>>>>>> From: Fei Yang <fei.yang@intel.com>
>>>>>>
>>>>>> Currently the KMD is using enum i915_cache_level to set caching
>>>>>> policy for buffer objects. This is flaky because the PAT index
>>>>>> which really controls the caching behavior in PTE has far more
>>>>>> levels than what's defined in the enum.
>>>>>
>>>>> Then just add more enum values.
>>>>
>>>> That would be really messy because PAT index is platform dependent,
>>>> you would have to maintain many tables for the the translation.
>>>>
>>>>> 'pat_index' is absolutely meaningless to the reader, it's just an
>>>>> arbitrary number. Whereas 'cache_level' conveys how the thing is
>>>>> actually going to get used and thus how the caches should behave.
>>>>
>>>> By design UMD's understand PAT index. Both UMD and KMD should stand
>>>> on the same ground, the Bspec, to avoid any potential ambiguity.
>>>>
>>>>>> In addition, the PAT index is platform dependent, having to
>>>>>> translate between i915_cache_level and PAT index is not reliable,
>>>>>
>>>>> If it's not realiable then the code is clearly broken.
>>>>
>>>> Perhaps the word "reliable" is a bit confusing here. What I really
>>>> meant to say is 'difficult to maintain', or 'error-prone'.
>>>>
>>>>>> and makes the code more complicated.
>>>>>
>>>>> You have to translate somewhere anyway. Looks like you're now
>>>>> adding translations the other way (pat_index->cache_level). How is th=
at better?
>>>>
>>>> No, there is no pat_index->cache_level translation.
>>>
>>> i915_gem_object_has_cache_level() is exactly that. And that one does
>>> look actually fragile since it assumes only one PAT index maps to
>>> each cache level. So if the user picks any other pat_index anything
>>> using
>>> i915_gem_object_has_cache_level() is likely to do the wrong thing.
>>
>> That is still one way transaltion, from cache_level to pat_index.
>
> Not really. The actual input to the thing is obj->pat_index.
> And as stated, the whole thing is simply broken whenever
> obj->pat_index isn't one of the magic numbers that you get
> back from i915_gem_get_pat_index().

I proposed a patch for diic which is directly applicable to drm-tip as well=
.
Could you review http://intel-gfx-pw.fi.intel.com/series/19405/ and let me
know if that would address your concern here?

-Fei

> --
> Ville Syrj=E4l=E4
> Intel
