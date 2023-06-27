Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B7173FFDC
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 17:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40FA510E04A;
	Tue, 27 Jun 2023 15:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6153610E010;
 Tue, 27 Jun 2023 15:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687880211; x=1719416211;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=0RYPEJJwUVBBj8eOFjovF3g6inzPXy2DbYuzbUwjOOw=;
 b=lZgMqMm0c7Omt924sunDu5CO/0AJZ8zj7w2KJKMkHcfxiRpp7g+Ojiqf
 SFiU9ujXqyz/Zr3OaM60J3IF3TSeMfUB8Tv0ApIPZOTinJv9OJ1VwpbKk
 zIahJva8RVNDQD9XEap1vEe/m5GdY4dti9VPysFkiEidj5qG76WHGfubp
 8Ru4Eee3aCrFvBxlmXPtEBD7I2Q8SNdVdTUDwN6AxweSC3SuhIKKleO41
 YFK+iF/BB0OC1aJNqu76Vm6pivsTbPKa3Zord7VdWNx89b8sZqoelB85A
 nX15AiMVD9+nqN4GhZM05SWbAV09L9tSMf0ELoU9a4kZUBD7QF/CWQVCV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="425276618"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
 d="scan'208,217";a="425276618"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 08:36:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="751772060"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
 d="scan'208,217";a="751772060"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 27 Jun 2023 08:36:50 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 08:36:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 08:36:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 27 Jun 2023 08:36:49 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 27 Jun 2023 08:36:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLJ8w4ENU9aj3juS8lSIdbmKavgIw5sQllgrWtU0YVKPuI3pOoHphYttt2SizEyn6t2af/Dw6qJRbzPX1g+R6vuGgVTVUJPXcwUKqTVYJbFbSCzdTDMa2Ofoyr4zSjNi+jzx7xAvuOFVTog39Lkzw/9c43HThqih3Z5ewEcBwtjCL2RKFZR98jgAMvdSGukJSs1Ap9cF8GgyRo4QgDA+KMjBlTH9PxTm4SL1FOwgX8bxtLLnpOwMaKd1ULwiMOOeWAKB2SnrN3QmuVjPAw2DW7Q3rv0O3DCk9gsX7rfzXYn0X4AJ4ynXt1N5xSI1SjPLALA5A0YUn7wKUo05M2d1Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZmfU9Y28rly+++3lIdzw8OIOE2aMqCYUhH5MVaxJfY=;
 b=FDUy5oL6TXIJs1VFA++GL7+xE7tRSsMYIus7Pz4zaONub568tCnVpEtfIEStXWQVTumyVNrjkCS9OPcT+VwzlNGBdv7f+46jsayBl0coPTCymoUmjQ/qCsAatET/fbUdOZdKRwhR3h0O6HAkTsak5j5tCDoeQ76/nLV2saaeeX3fwM6Wqm0p54yLJQGsubHTFsbe7IATz+Pha6aOIIkCpQkc9YJEGBZpO3Ds86DqgyyOKWPPpQgEkq5X7IwWf/EvW+1eSXPbsch5vUE7WUHysRcBdDCKlnoxoFg/dve1MWSyk3xPoRg2P/1YWYTfPcJGK9y/A8DPZNaMhle4Xrpdog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by SA3PR11MB8076.namprd11.prod.outlook.com (2603:10b6:806:2f0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Tue, 27 Jun
 2023 15:36:47 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::28b4:ae85:a4f0:3f46]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::28b4:ae85:a4f0:3f46%4]) with mapi id 15.20.6521.020; Tue, 27 Jun 2023
 15:36:47 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v8 1/2] drm/i915: preparation for using PAT index
Thread-Topic: [PATCH v8 1/2] drm/i915: preparation for using PAT index
Thread-Index: AQHZqPtKSp2FRhkCV0qbq97s7geB/6+eruEAgAAQaICAAACqwIAABpi8
Date: Tue, 27 Jun 2023 15:36:47 +0000
Message-ID: <BYAPR11MB25674285D57AABCCCAA9D62F9A27A@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230509165200.1740-1-fei.yang@intel.com>
 <20230509165200.1740-2-fei.yang@intel.com> <874jmtt4pb.fsf@intel.com>
 <b22c7111-0587-19b5-d912-9d07b81d2bb0@linux.intel.com>
 <ZJr6aRb8SrLug7SQ@ashyti-mobl2.lan>
 <BYAPR11MB2567CE754B9EE98E5646D05D9A27A@BYAPR11MB2567.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB2567CE754B9EE98E5646D05D9A27A@BYAPR11MB2567.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|SA3PR11MB8076:EE_
x-ms-office365-filtering-correlation-id: 5a908e6f-330f-4476-21d4-08db77245188
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FyV/sO53k1n4knXEfPxrqvH94iFBsjXIxo+chX0x042w3+1hJLFVjaxP7IhmSYmLdos1qDkoNJsYv9+s4N0ZxYxG2D2FbEE/D8k459DNQG0gMtVc61BYTptbd1wdPXzFeQQ1dLkrkkCuW2pfDDjROhZBKTpMQ2pZnPx36j+uF1V3WWhkmCfn/5axsKKEvHkPJOO04kSYeJsoGJrF/RRv/6AwuIesYClCNaFsaItteKKQZL4THKHuiALfh7zyILUqyecNKl1Qx20fUyFuyHFfL64x2wTxjT4UKcDdT+K1S/BMkZzb7fj/dYQbrW6UM81V9h8JenHyzAr0hA7rkKrVuBUx0k2OE1ub7/UIGIsagHW/rrkrDoJeGpuBcxasv0NJKxU15I6J5FSk6AAHTE3E8rdnDcF1BEqSO66ufHdkNl7bkEnwu7TDRhXiIUf37CWJi6GtMf+nuxsQU8p4JvM6EurtynVpnJo2nhkvcS5IEf+0x492EiVUO8GNahKl674Uw0pUV5sa0BqSjLYBY9YWuEfqNF0GBEPx1/Hoq+NyxJGo0qMqpNSjYl28n0pTy9jfl0n1wDmJpCCrCW//RDvOmvfKfFaPgIn+PZRNbIA++JY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(39860400002)(366004)(136003)(376002)(451199021)(19627405001)(966005)(2940100002)(110136005)(54906003)(478600001)(7696005)(83380400001)(55016003)(38070700005)(82960400001)(86362001)(66446008)(64756008)(71200400001)(66476007)(6506007)(9686003)(33656002)(53546011)(26005)(186003)(66946007)(2906002)(66556008)(4326008)(8936002)(122000001)(41300700001)(76116006)(38100700002)(91956017)(316002)(52536014)(8676002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?g2oiLyjD2rT/6TXd5jY5BD1KnJSoCRazJ+1zl3ejgFb4SxwVzIYBTy9TwH?=
 =?iso-8859-1?Q?HA1QqSqT6IQ9W58Z+h2uQKellVdQh1SsaxKgvpzuM7FdlDPxZO5vx6XhbW?=
 =?iso-8859-1?Q?PqClqe6dZwds3nieHATrOjnyx9XVBQxWjt3KLUJxPf590GmnHlRBR8WytM?=
 =?iso-8859-1?Q?jBFGVnPMpM/jSR/XbU2/JMTlIcNYnjq2/Dsdvky3bDepiYBHytUvJpFhrO?=
 =?iso-8859-1?Q?PZqiaNALIccYP+AjsEv7bhsx6yB8xNsb0qrRh1sP+0SUCXHNdY/dW0Cfll?=
 =?iso-8859-1?Q?gqpU1vRGtDlJpghKQmeJXFudJUNZd48wubTuGWFc3LxysfWjTY9TAYDibT?=
 =?iso-8859-1?Q?+W3OLkAbcMtrQZ3WPrBcgTfJvat6l5liJy27isd0oY1clyVEkKkMlpkAht?=
 =?iso-8859-1?Q?R7uw8Z8dUbhgPpJ8JVQ2yfBPYZgOl7A0lBfJkm7RCv6Cn+jcLFmPT+mRWR?=
 =?iso-8859-1?Q?xNn5g5TFuErvOAdCdxauWo5pb1lj47UW5St48j6IQogKk4lwJ6r5czaOU8?=
 =?iso-8859-1?Q?amZSFYbztgH52nhy6yUsABQXXE/TAUFjqB9PXHXWW4ZpI6akzdyRFy7fEl?=
 =?iso-8859-1?Q?vtMn7BlYv7UF9cWD3C44Fwu6xw2035Q8fBp23CoI4Ju//bBruY4GDM3OED?=
 =?iso-8859-1?Q?cJXhSgFcOiBDN2F5JlpjosPw4kGjFxxOl3ZAJDOvgb++LJtOeG6m5cPXuw?=
 =?iso-8859-1?Q?mYxfVPe5Cp4ze7waSfgJ0rEadGAlCdeXzco/4QhQvVv+9jY2doZ9zytRLI?=
 =?iso-8859-1?Q?yIA4pKa2ANqn2zug9wDthsbw//PWRIb9cGyn0G5L9da1dWvYp8TyjKpRPO?=
 =?iso-8859-1?Q?NXlG9IoL5xkFRuQnIWYHAzYf5kzF2yR/tyMsAltzWUusksCOVBRaRpTSp4?=
 =?iso-8859-1?Q?xK+2FXrxTMmdT25J519RBTB2tMfWPPnwg0QZ4cM1LD4hIOp1t/DER+IaDy?=
 =?iso-8859-1?Q?70PL0zdq4OMPWjlNpdxn6lNy/SuPZ8Un4oXMz3JJEpjS+AJomgbbmfBGno?=
 =?iso-8859-1?Q?HVTPDXyjfJHkzFcyJYDQ/wXODctVWKsKw9TVv0HrdNS6DlpBnXHFPvf1Xu?=
 =?iso-8859-1?Q?wXBmA0g62v07VUHD5wV5BnuW2B/hLuL5ybXVFKEgW/5eVVad2XuCiysI7a?=
 =?iso-8859-1?Q?0oxAvUQEG+k2zE9YsPKk91UAPMv8ZAlKJymPJUw7o+gMFMkBcICpysamfk?=
 =?iso-8859-1?Q?I+KYp8PGZnrOhNL7AInItIzSLqbaUCwHVC7eRKMSxWJ33+Rwey5LohsTEB?=
 =?iso-8859-1?Q?7J2JdCrL2/gVBBiZHWcPOlpn8StOYzoXmKj0LP2WuPOgbRBespHqLONOf/?=
 =?iso-8859-1?Q?B+qk84gTFz5gjdVKDsHf6iQ2RZuQb5ylDgHIe7pfmwdZpchb7kovtAYptb?=
 =?iso-8859-1?Q?4r+M3i0+LIwRXfoUi5jX+dDTV0mRcQjFw0mTW/CwOVWkjE/ejD6Nv3pMRr?=
 =?iso-8859-1?Q?gd22X0ZeIfgEH/Lt+2qBVsGZDPybk4go38FXvrLFrYJlDX/bGfEG0zwosd?=
 =?iso-8859-1?Q?VOCnvqzyast+iMdXUuwZmhf73nZwfLdJKDWQwZw5BWN9vQhmDuVg3GwiuW?=
 =?iso-8859-1?Q?LAmB2B3udieMzy57v56gFmSq2KAhdBRqthS8dDM9wKdp1uPxv7bNeKyKlY?=
 =?iso-8859-1?Q?FrOyxbd5f8Lkk=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB25674285D57AABCCCAA9D62F9A27ABYAPR11MB2567namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a908e6f-330f-4476-21d4-08db77245188
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2023 15:36:47.3198 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9pSbnIRfpQGw/EjJ22VRzCKgAi7f7GON3604b1LDHWNqgFBlVE8Cs8GJeQeO+op14SQfrs7edpGj2PHPszwAJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8076
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Hajda, 
 Andrzej" <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR11MB25674285D57AABCCCAA9D62F9A27ABYAPR11MB2567namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> On 27/06/2023 14:28, Jani Nikula wrote:
>> On Tue, 09 May 2023, fei.yang@intel.com wrote:
>>> From: Fei Yang <fei.yang@intel.com>
>>>
>>> This patch is a preparation for replacing enum i915_cache_level with
>>> PAT index. Caching policy for buffer objects is set through the PAT
>>> index in PTE, the old i915_cache_level is not sufficient to represent
>>> all caching modes supported by the hardware.
>>>
>>> Preparing the transition by adding some platform dependent data
>>> structures and helper functions to translate the cache_level to pat_ind=
ex.
>>>
>>> cachelevel_to_pat: a platform dependent array mapping cache_level to
>>>                     pat_index.
>>>
>>> max_pat_index: the maximum PAT index recommended in hardware specificat=
ion
>>>                 Needed for validating the PAT index passed in from user
>>>                 space.
>>>
>>> i915_gem_get_pat_index: function to convert cache_level to PAT index.
>>>
>>> obj_to_i915(obj): macro moved to header file for wider usage.
>>>
>>> I915_MAX_CACHE_LEVEL: upper bound of i915_cache_level for the
>>>                        convenience of coding.
>>>
>>> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>>
>> [snip]
>>
>>> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
>>> b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
>>> index f6a7c0bd2955..0eda8b4ee17f 100644
>>> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
>>> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
>>> @@ -123,7 +123,9 @@ struct drm_i915_private *mock_gem_device(void)
>>>     static struct dev_iommu fake_iommu =3D { .priv =3D (void *)-1 };
>>>   #endif
>>>     struct drm_i915_private *i915;
>>> +   struct intel_device_info *i915_info;
>>>     struct pci_dev *pdev;
>>> +   unsigned int i;
>>>     int ret;
>>>
>>>     pdev =3D kzalloc(sizeof(*pdev), GFP_KERNEL); @@ -180,6 +182,13 @@
>>> struct drm_i915_private *mock_gem_device(void)
>>>             I915_GTT_PAGE_SIZE_2M;
>>>
>>>     RUNTIME_INFO(i915)->memory_regions =3D REGION_SMEM;
>>> +
>>> +   /* simply use legacy cache level for mock device */
>>> +   i915_info =3D (struct intel_device_info *)INTEL_INFO(i915);
>>
>> This is not okay. It's not okay to modify device info at runtime. This
>> is why we've separated runtime info from device info. This is why
>> we've made device info const, and localized the modifications to a
>> couple of places.
>>
>> If you need to modify it, it belongs in runtime info. Even if it's
>> only ever modified for mock devices.
>>
>> We were at the brink of being able to finally convert INTEL_INFO()
>> into a pointer to const rodata [1], where you are unable to modify it,
>> but this having been merged as commit 5e352e32aec2 ("drm/i915:
>> preparation for using PAT index") sets us back. (With [1] this oopses
>> trying to modify read-only data.)
>>
>> This has been posted to the public list 20+ times, and nobody noticed
>> or pointed this out?!
>>
>> Throwing away const should be a huge red flag to any developer or
>> reviewer. Hell, *any* cast should be.
>>
>> I've got a patch ready moving cachelevel_to_pat and max_pat_index to
>> runtime info. It's not great, since we'd be doing it only for the mock
>> device. Better ideas? I'm not waiting long.
>>
>>
>> BR,
>> Jani.
>>
>>
>> [1]
>> https://patchwork.freedesktop.org/patch/msgid/0badc36ce6dd6b030507bdfd
>> 8a42ab984fb38d12.1686236840.git.jani.nikula@intel.com
>>
>>
>>> +   i915_info->max_pat_index =3D 3;
>>> +   for (i =3D 0; i < I915_MAX_CACHE_LEVEL; i++)
>>> +           i915_info->cachelevel_to_pat[i] =3D i;
>>> +
>
> I'd simply suggest having a local static const table for the mock device.
> It should be trivial once i915->__info becomes a pointer so in that serie=
s
> I guess.
>
> While I am here - Fei - any plans to work on the promised cleanup?
> Abstracting the caching modes with a hw agnostic sw/driver representation=
,
> if you remember what we discussed.

Yes, I'm still working on that as a side task. Hopefully I would be able to
post something to the mailing list after the July 4th holiday.

> Regards,
>
> Tvrtko


--_000_BYAPR11MB25674285D57AABCCCAA9D62F9A27ABYAPR11MB2567namp_
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
tPasted1 ContentPasted2">
&gt; On 27/06/2023 14:28, Jani Nikula wrote:
<div class=3D"ContentPasted0">&gt;&gt; On Tue, 09 May 2023, fei.yang@intel.=
com wrote:</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; From: Fei Yang &lt;fei.yang@inte=
l.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; This patch is a preparation for =
replacing enum i915_cache_level with</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; PAT index. Caching policy for bu=
ffer objects is set through the PAT</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; index in PTE, the old i915_cache=
_level is not sufficient to represent</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; all caching modes supported by t=
he hardware.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Preparing the transition by addi=
ng some platform dependent data</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; structures and helper functions =
to translate the cache_level to pat_index.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; cachelevel_to_pat: a platform de=
pendent array mapping cache_level to</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pat_index.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; max_pat_index: the maximum PAT i=
ndex recommended in hardware specification</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; Needed for validating the PAT index passed in from =
user</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; space.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; i915_gem_get_pat_index: function=
 to convert cache_level to PAT index.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; obj_to_i915(obj): macro moved to=
 header file for wider usage.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; I915_MAX_CACHE_LEVEL: upper boun=
d of i915_cache_level for the</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;convenience of coding.</=
div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Cc: Chris Wilson &lt;chris.p.wil=
son@linux.intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Cc: Matt Roper &lt;matthew.d.rop=
er@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Signed-off-by: Fei Yang &lt;fei.=
yang@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Reviewed-by: Andi Shyti &lt;andi=
.shyti@linux.intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Reviewed-by: Andrzej Hajda &lt;a=
ndrzej.hajda@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; [snip]</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; diff --git a/drivers/gpu/drm/i91=
5/selftests/mock_gem_device.c</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; b/drivers/gpu/drm/i915/selftests=
/mock_gem_device.c</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; index f6a7c0bd2955..0eda8b4ee17f=
 100644</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; --- a/drivers/gpu/drm/i915/selft=
ests/mock_gem_device.c</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; +++ b/drivers/gpu/drm/i915/selft=
ests/mock_gem_device.c</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; @@ -123,7 +123,9 @@ struct drm_i=
915_private *mock_gem_device(void)</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; static struct dev_=
iommu fake_iommu =3D { .priv =3D (void *)-1 };</div>
&gt;&gt;&gt; &nbsp; #endif
<div class=3D"ContentPasted1">&gt;&gt;&gt; &nbsp; &nbsp; struct drm_i915_pr=
ivate *i915;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; + &nbsp; struct intel_device_inf=
o *i915_info;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; &nbsp; &nbsp; struct pci_dev *pd=
ev;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; + &nbsp; unsigned int i;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; &nbsp; &nbsp; int ret;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; &nbsp; &nbsp; pdev =3D kzalloc(s=
izeof(*pdev), GFP_KERNEL); @@ -180,6 +182,13 @@</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; struct drm_i915_private *mock_ge=
m_device(void)</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; I915_GTT_PAGE_SIZE_2M;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; &nbsp; &nbsp; RUNTIME_INFO(i915)=
-&gt;memory_regions =3D REGION_SMEM;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; +</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; + &nbsp; /* simply use legacy ca=
che level for mock device */</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; + &nbsp; i915_info =3D (struct i=
ntel_device_info *)INTEL_INFO(i915);</div>
<div class=3D"ContentPasted1">&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; This is not okay. It's not okay to m=
odify device info at runtime. This</div>
<div class=3D"ContentPasted1">&gt;&gt; is why we've separated runtime info =
from device info. This is why</div>
<div class=3D"ContentPasted1">&gt;&gt; we've made device info const, and lo=
calized the modifications to a</div>
<div class=3D"ContentPasted1">&gt;&gt; couple of places.</div>
<div class=3D"ContentPasted1">&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; If you need to modify it, it belongs=
 in runtime info. Even if it's</div>
<div class=3D"ContentPasted1">&gt;&gt; only ever modified for mock devices.=
</div>
<div class=3D"ContentPasted1">&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; We were at the brink of being able t=
o finally convert INTEL_INFO()</div>
<div class=3D"ContentPasted1">&gt;&gt; into a pointer to const rodata [1], =
where you are unable to modify it,</div>
<div class=3D"ContentPasted1">&gt;&gt; but this having been merged as commi=
t 5e352e32aec2 (&quot;drm/i915:</div>
<div class=3D"ContentPasted1">&gt;&gt; preparation for using PAT index&quot=
;) sets us back. (With [1] this oopses</div>
<div class=3D"ContentPasted1">&gt;&gt; trying to modify read-only data.)</d=
iv>
<div class=3D"ContentPasted1">&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; This has been posted to the public l=
ist 20+ times, and nobody noticed</div>
<div class=3D"ContentPasted1">&gt;&gt; or pointed this out?!</div>
<div class=3D"ContentPasted1">&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; Throwing away const should be a huge=
 red flag to any developer or</div>
<div class=3D"ContentPasted1">&gt;&gt; reviewer. Hell, *any* cast should be=
.</div>
<div class=3D"ContentPasted1">&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; I've got a patch ready moving cachel=
evel_to_pat and max_pat_index to</div>
<div class=3D"ContentPasted1">&gt;&gt; runtime info. It's not great, since =
we'd be doing it only for the mock</div>
<div class=3D"ContentPasted1">&gt;&gt; device. Better ideas? I'm not waitin=
g long.</div>
<div class=3D"ContentPasted1">&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt;</div>
&gt;&gt; BR,
<div class=3D"ContentPasted2">&gt;&gt; Jani.</div>
<div class=3D"ContentPasted2">&gt;&gt;</div>
<div class=3D"ContentPasted2">&gt;&gt;</div>
<div class=3D"ContentPasted2">&gt;&gt; [1]</div>
<div class=3D"ContentPasted2">&gt;&gt; https://patchwork.freedesktop.org/pa=
tch/msgid/0badc36ce6dd6b030507bdfd</div>
<div class=3D"ContentPasted2">&gt;&gt; 8a42ab984fb38d12.1686236840.git.jani=
.nikula@intel.com</div>
<div class=3D"ContentPasted2">&gt;&gt;</div>
<div class=3D"ContentPasted2">&gt;&gt;</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; + &nbsp; i915_info-&gt;max_pat_i=
ndex =3D 3;</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; + &nbsp; for (i =3D 0; i &lt; I9=
15_MAX_CACHE_LEVEL; i++)</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; i915_info-&gt;cachelevel_to_pat[i] =3D i;</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;</div>
<div class=3D"ContentPasted2">&gt; I'd simply suggest having a local static=
 const table for the mock device.</div>
<div class=3D"ContentPasted2">&gt; It should be trivial once i915-&gt;__inf=
o becomes a pointer so in that series</div>
<div class=3D"ContentPasted2">&gt; I guess.</div>
<div class=3D"ContentPasted2">&gt;</div>
<div class=3D"ContentPasted2">&gt; While I am here - Fei - any plans to wor=
k on the promised cleanup?</div>
<div class=3D"ContentPasted2">&gt; Abstracting the caching modes with a hw =
agnostic sw/driver representation,</div>
<div class=3D"ContentPasted2">&gt; if you remember what we discussed.</div>
<div><br class=3D"ContentPasted2">
</div>
<div class=3D"ContentPasted2">Yes, I'm still working on that as a side task=
. Hopefully I would be able to</div>
<div class=3D"ContentPasted2">post something to the mailing list after the =
July 4th holiday.</div>
<div><br class=3D"ContentPasted2">
</div>
<div class=3D"ContentPasted2">&gt; Regards,</div>
<div class=3D"ContentPasted2">&gt;</div>
<div class=3D"ContentPasted2">&gt; Tvrtko</div>
<br>
</div>
</body>
</html>

--_000_BYAPR11MB25674285D57AABCCCAA9D62F9A27ABYAPR11MB2567namp_--
