Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7706DE6B3
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 23:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABAE910E0D8;
	Tue, 11 Apr 2023 21:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A25C310E69B;
 Tue, 11 Apr 2023 21:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681250086; x=1712786086;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=K6F5USi5NJXrqPIENcA+bDQ88LgUk1u3JjgZolGsByc=;
 b=PM012XfAevTqolzbVX72ndAZpaEH1by+f+ajNzGbE+RzStP/azvBHWvn
 N4mWtCY53GuxqoWo2PArLeDyoGCQoAng+Z5LC3aYIgrqLVKexjzvoJ/PS
 D5nMiUWBy0ApNXNXcPv4bZBEmdXgEeVjXW9qO2QYZJYhrJkmSt3gGkkR3
 DK4gDHu9kFPXg49aybnbSVwXAKahNFWSqMPGaGXG6223UQuG6432EerRO
 LU1xYmrWkFRWOznC6AB1jISearAWXh475AOZA6dCvZ8UHxXU1Wxs0J+cv
 HpYbq15W4FIy395am26DphfPKILS55tLZgyjksDXDR1JqxuN6PKEUBRtM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="332436737"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
 d="scan'208,217";a="332436737"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 14:54:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="753290247"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
 d="scan'208,217";a="753290247"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 11 Apr 2023 14:54:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 14:54:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 14:54:44 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 11 Apr 2023 14:54:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 11 Apr 2023 14:54:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mH6FUZ5HihRG787SbhOZuDNeVqA1WAiJnWuJqH/N6x4b4YYUYlYk0hiBFDjQDSF7E1FL7czRJ9OcHFLvJQWH2M9mzpfcdh1ve3zhX6nqc6ubGMN4eLFuDcl2v9pdNQo0uUyjXO18fmS3kQtqAvmQm+lrqJS09KsL3a0Jh82lDIG0KVGxFfqlfjB5WxCYk0Kh0rPVu3zCuHY/RD3Z2K3DfMP+cAllBpCNxgjdDXmj0K6bJsS61nzFUa/6RxKt0qENpXOcUntehz1SIKFm4LbSdbU1kzZALJSyWRW6OCpiltTMCmnlSkZdPRBo7Y+Cyj75S0koALH4t2iMxdFNXBawsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTI6Iz4p4meC+0TEg9iFBH2gRfSgCbbpRFbkhxE9sFo=;
 b=LNHbDz85SzHY8nwSEtS/NdEOzC7ltXSnImtrINAVD+9PHitophKmtpWFZiJhpARSxYNloaCidjOAhR7lDf+j6JVSH/qQNNFkWoA6wYg8P+vgnd3yhpdG8JPe0igMDS95277cn/vJLVO3XXcXubVKd9ag75P0QTBJOymF6OgijvVxzvPWk2Q3+r5jJLkYJloGaagyG/58JSsvzN4beqbQ2lnKK4mYOn+xKF+1WHrZPqmym43CUR4v4X6SNT/IKxbR9aailaYBMkRb8QjfOmlUGPj71uWWF0K8XjOn47QGqBpWbdE6OiVGvvZsoYIKojVuKO/v9iCHjV+T/SGE4wS4UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by DM4PR11MB7326.namprd11.prod.outlook.com (2603:10b6:8:106::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30; Tue, 11 Apr
 2023 21:54:41 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::12b1:c9af:ed85:e3ee]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::12b1:c9af:ed85:e3ee%6]) with mapi id 15.20.6277.038; Tue, 11 Apr 2023
 21:54:41 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [Intel-gfx] [PATCH 1/8] drm/i915/mtl: Define MOCS and PAT tables
 for MTL
Thread-Topic: [Intel-gfx] [PATCH 1/8] drm/i915/mtl: Define MOCS and PAT tables
 for MTL
Thread-Index: AQHZaSAps9DZ2MEczUy95kW+44Z9z68kwmkAgAC1ntCAAQ1kgIAAEYZg
Date: Tue, 11 Apr 2023 21:54:41 +0000
Message-ID: <BYAPR11MB2567BAE00F7E97F7A37A6F159A9A9@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230407071236.1960642-1-fei.yang@intel.com>
 <20230407071236.1960642-2-fei.yang@intel.com>
 <20230410163434.GU4085390@mdroper-desk1.amr.corp.intel.com>
 <BYAPR11MB2567AA0E08E6C8ED118CA8389A9A9@BYAPR11MB2567.namprd11.prod.outlook.com>
 <20230411192847.GY4085390@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20230411192847.GY4085390@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|DM4PR11MB7326:EE_
x-ms-office365-filtering-correlation-id: 7fb9db78-49f7-4943-80f6-08db3ad75a9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RQwLOT6m4sjzSh9jn2ssd+vtlVkXdIocrrCt0JBWx4y0LX1YcDldeXcZqM0kA8a1h89mxMZpvM1RbMvYldFEVs4JLr6/8M/vobBixH1bVrHGQN/oNJVlaf98Hm7MxEJebApM/IWhHq4hIaWzm2FAEOP871Knk3fw+KnNJj8Pe/dLkXErmKc+oNhhzEOyep0E8pT2ZWe3qjCPVgA4pJUebVjSawxZrNG+ss4vQeGxUiFjFe0qQLFl453cAONmx3CfbszepcM+GwHx38d7Y1Eg+bUvbYNhUAWhYkvaV0IXCR0DptltWsDHfgShVb5mgUSeb2BuZK0N11hahhHt4+gcRjbWae3jIiANcng0Y/2Y3cxRaTZvHuE8jcj7MePHwipD2kKdkc1IsR/lPEOwsSOi3A78UykoW9PExtTn4sjlkCp/NLNzDRDv12YtCdPp2a8HqQ4TEf4FEMSKCL2KulTX1rf9UAeHg+HOcU2LQO2yjAHCIX6LrpkhULZCgROw0dAa4U9ZjXdxa3yxjzHk6oZ3boVzfqoJOCR/v21KIBUgnxKYK+MKPxDKoxUqyCl6SCMvAiewAWJUX61jd03vEf5Qf3RHH+9wU0cLN2jMM+nT/E8T5/pvZ7u//kMcsoZN6KKl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(376002)(396003)(346002)(136003)(451199021)(83380400001)(166002)(55016003)(33656002)(38070700005)(86362001)(6636002)(122000001)(38100700002)(82960400001)(54906003)(478600001)(316002)(26005)(7696005)(71200400001)(52536014)(6862004)(5660300002)(8936002)(41300700001)(8676002)(2906002)(4326008)(64756008)(66476007)(76116006)(450100002)(66446008)(66556008)(6506007)(9686003)(66946007)(186003)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2SJGR+4AvMYQ456W5jcgjg23CljtY4D2sENa830Hsdrs6tU88+PcCJvw11aP?=
 =?us-ascii?Q?H+PROCdaECZs3Pqhvm7HiD0mk979lfdp9fMZSjByEFqE0y/mxpRzVe5bo56j?=
 =?us-ascii?Q?t+KjDbJJzogBY7Z6kzGiimzKumpWgmjmSB2wJdC25Z1/JsdOSc+PXmbNeeNf?=
 =?us-ascii?Q?/Y439wEU84N0oUoazpsr0/HfKrJhzd0+7oA5TSesC1XsN7dHg4XVFb0r4Vrr?=
 =?us-ascii?Q?UuKnkmJWeFyPTRxLWzZivzWi+2Nwm+sXq5wo9hp350gm8humrIdRcdgI8pW7?=
 =?us-ascii?Q?a7fUxUHJ4EVcXuuRrkYSsIVggc9pk9kKvqQiS3q4VCRUhw6WZL8PEJadTP7l?=
 =?us-ascii?Q?Jue5Ep13Wz0WPhH2li1LU9muLcTM+1z29scII/jwHDt3LqOfRf5REzGk6WvS?=
 =?us-ascii?Q?oSP5ZVRLNTh3gEUGCi865wPyaftfxlw/pNfGT+dI2Vz94SaI13AFyXGZsoxm?=
 =?us-ascii?Q?1Wnw3FNx050KfNKJ7ina5d/r3gfTND+/BmkjCxns3oq/QSveQx5ACyq2jnH8?=
 =?us-ascii?Q?vBqHw925f6M2rzl0raOf5qWh+Gr4onUoBtKklFB3QXaEFk6HMgSTDB3jyiKx?=
 =?us-ascii?Q?QdfHnveGVxSgW/FZSfghTGzj5cpBv6Avevs9WEseG78+hCYXLJlGr1MrDihG?=
 =?us-ascii?Q?ZNHCfw22/+sP77nr/9BWFAMyQKNc/inKj/BXjFNjost7YW+YwRKirVG14Soy?=
 =?us-ascii?Q?VGXsQa9jP6KvFdm2r1FX9guz3X2BpaIWch2bdLRiVEo2bVnHYAVqbtIrTovg?=
 =?us-ascii?Q?zsOQwXjO/MmhrhpTuidnoCEEibHdzTLsGeXngxqFaA42I8PN2Dt2sp+jxu6V?=
 =?us-ascii?Q?xeYwtRnWJdjx8jSHU64HSWsZHmasEl7yHGV8J2cph/5zkbwdcJ5fHnjfKEHS?=
 =?us-ascii?Q?hkXJrjdbh9IrosA8ChHjOswPEWqUtU58uW4IbOsPyHQGsuH1lPUQ4gl+VX20?=
 =?us-ascii?Q?i/zKRmL6M6emNpWaOeDqPwEer0LJrc77aKpKQ6NfbCmk/6jtB4YwKEdco4ty?=
 =?us-ascii?Q?0nDpTcyhM78uQe/x1ofLsfAhH0u8aFVveOMn9SopcOuQGqbgriT+rYh8C/l4?=
 =?us-ascii?Q?NqoDzpAuv1eNTXPUvzPjLN+PzNNSc0T5cywCYUgpl9qgDTpEQ9oOAUW84iHo?=
 =?us-ascii?Q?7XlrL4RPQLqAqF+31iJYQq1t4JA96tG6Jk3xLtYk5PZF7JVApbu2qu0wJWjg?=
 =?us-ascii?Q?aWhikMGUdzrEAFWd+q+NEcmiA5JuMejqiePI+I9t73NeUjGyZUPN3DW+TsM1?=
 =?us-ascii?Q?3xUlynSMTf94+4AaAaRMU46eSQFRE816b9T/lOABe3BEyHGXLKnx/Nl533L2?=
 =?us-ascii?Q?uo4S2bi5C27+mrl+xIKC7GQgIBHPa2ZycLA9rKmVHkkEq/XhDez0y3VEkjCX?=
 =?us-ascii?Q?zfftEQ76PYZyCSwjiXT5R2kaOwberTnXT7E9DK05VFoU1sMC+HK5uxkiDvgc?=
 =?us-ascii?Q?eZg8kswegTkxhUpREiUoCHUQwDxECqLK6kUPGBUnELl6Kh4FhpesUpTIzf7H?=
 =?us-ascii?Q?5ntxENCJVH/7Sma00ZZ9Mfo7fQeHQ4bun0MKjbZV+djUicVjj7Wul0SqSvXc?=
 =?us-ascii?Q?olaElO7FDJBOljv89M0=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB2567BAE00F7E97F7A37A6F159A9A9BYAPR11MB2567namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb9db78-49f7-4943-80f6-08db3ad75a9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2023 21:54:41.5706 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DG37JrEwR9MB8fUaPhEh4ehZHZ3OlaNlPA2D7wtLJAzmk6wZAgE/jsSVBfaNmOQpgUhGonKm7u39sDvH1u24zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7326
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR11MB2567BAE00F7E97F7A37A6F159A9A9BYAPR11MB2567namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> Subject: Re: [Intel-gfx] [PATCH 1/8] drm/i915/mtl: Define MOCS and PAT ta=
bles for MTL
>
> On Mon, Apr 10, 2023 at 08:55:16PM -0700, Yang, Fei wrote:
> ...
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h
>>
>>>> b/drivers/gpu/drm/i915/gt/intel_gtt.h
>>
>>>> index 69ce55f517f5..b632167eaf2e 100644
>>
>>>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
>>
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
>>
>>>> @@ -88,9 +88,18 @@ typedef u64 gen8_pte_t;
>>
>>>>  #define BYT_PTE_SNOOPED_BY_CPU_CACHES             REG_BIT(2)
>>
>>>>  #define BYT_PTE_WRITEABLE                            REG_BIT(1)
>>
>>>>
>>
>>>> +#define GEN12_PPGTT_PTE_PAT3    BIT_ULL(62)
>>
>>>>  #define GEN12_PPGTT_PTE_LM          BIT_ULL(11)
>>
>>>> +#define GEN12_PPGTT_PTE_PAT2    BIT_ULL(7)
>>
>>>> +#define GEN12_PPGTT_PTE_NC      BIT_ULL(5)
>>
>>>> +#define GEN12_PPGTT_PTE_PAT1    BIT_ULL(4)
>>
>>>> +#define GEN12_PPGTT_PTE_PAT0    BIT_ULL(3)
>>
>>> Which bspec page is this from?  The PPGTT descriptions in
>>
>>> the bspec are kind of hard to track down.
>>
>>
>>
>>    [9]https://gfxspecs.intel.com/Predator/Home/Index/53521
>
> The bspec tagging is a bit bizarre in this area, but I don't believe
> this page is intended to apply to MTL. Note that this page is inside
> a section specifically listed as "57b VA Support" --- i.e., this
> general section is for platforms like PVC rather than MTL.  MTL only
> has 48b virtual address space (bspec 55416), so I think one of the
> pages in the 48b sections is what we should be referencing instead.
>
> If they screwed up and put MTL-specific details only on a PVC-specific
> page of the bspec, we should probably file a bspec issue about that to
> get it fixed.

The Bspec is a bit confusing on these. Looked at the Bsec with filter set
to TGL/ADL/MTL/ALL respectively. Here are the differences,
>>    PAT_Index[2:0] =3D {PAT, PCD, PWT} =3D BIT(7, 4, 3)

These 3 PAT index bits are defined for all gen12+.
>>    PAT_Index[3] =3D BIT(62)

PAT_Index[3] is defined for MTL/ARL, will update this one to MTL_xxx

>>    PAT_Index[4] =3D BIT(61)

PAT_Index[4] shows up only when there is no filter set. And this bit is
marked as [NOT VALID FOR SPEC: GENERALASSETSXE], not sure how to interpret
this, but seems like it should not be used at all. Any suggestion?

>>
>>
>>> But if these only apply to MTL, why are they labelled as "GEN12?"
>>
>>    These apply to GEN12plus.
>
> That's not what your patch is doing; you're using them in a function
> that only gets called on MTL.

That PTE encode will be generalized to gen12 in a patch after after the
pat_index change.

> So the question is whether these
> definitions truly applied to older platforms like TGL/RKL/ADL/etc too
> (and we need to go back and fix that code), or whether they're
> Xe_LPG-specific, in which case the "GEN12_" prefix is incorrect.

The only difference is that MTL has PAT[3] defined, so we can still apply
the same PTE encode function for all gen12+.

> Also, handling the MTL-specific PTE encoding later in the series, after
> the transition from cache_level to PAT index, might be best since then
> you can just implement it correctly at the time the code is introduced;
> no need to add the cache_level implementation first (which can't even
> use all the bits) just to come back a few patches later and replace it
> all with PAT code.

I will squash the PTE encode patches.

>>>> -#define GEN12_GGTT_PTE_LM           BIT_ULL(1)
>>>> +#define GEN12_GGTT_PTE_LM                         BIT_ULL(1)
>>>> +#define MTL_GGTT_PTE_PAT0                          BIT_ULL(52)
>>>> +#define MTL_GGTT_PTE_PAT1                          BIT_ULL(53)
>>>> +#define GEN12_GGTT_PTE_ADDR_MASK       GENMASK_ULL(45, 12)
>>>> +#define MTL_GGTT_PTE_PAT_MASK          GENMASK_ULL(53, 52)
>>>>
>>>>  #define GEN12_PDE_64K BIT(6)
>>>>  #define GEN12_PTE_PS64 BIT(8)
>>>> @@ -147,6 +156,15 @@ typedef u64 gen8_pte_t;  #define
>> GEN8_PDE_IPS_64K
>>
>>>> BIT(11)
>>
>>>>  #define GEN8_PDE_PS_2M   BIT(7)
>>
>>>> +#define MTL_PPAT_L4_CACHE_POLICY_MASK
>> REG_GENMASK(3, 2)
>>>> +#define MTL_PAT_INDEX_COH_MODE_MASK              REG_GENMASK(1,
>> 0)
>>>> +#define MTL_PPAT_L4_3_UC
>>    REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 3)
>>>> +#define MTL_PPAT_L4_1_WT
>>    REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 1)
>>>> +#define MTL_PPAT_L4_0_WB
>>    REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 0)
>>>> +#define MTL_3_COH_2W     REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK,
>>    3)
>>>> +#define MTL_2_COH_1W     REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK,
>>    2)
>>>> +#define MTL_0_COH_NON
>> REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 0)
>>>
>>> The values for these definitions don't seem to be aligned.
>>    These are aligned with
>>    [10]https://gfxspecs.intel.com/Predator/Home/Index/45101
> I mean spacing aligned.  If your tabstops are set to 8, then the values d=
on't line up visually.

Hmm... the three COH macro's are aligned, are you saying they should aligne=
d with those PPAT macro's as well?

>
> Matt


--_000_BYAPR11MB2567BAE00F7E97F7A37A6F159A9A9BYAPR11MB2567namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">&gt; Subject: Re: [Intel-gfx] [PATCH 1/8] drm/i915/m=
tl: Define MOCS and PAT tables for MTL<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; On Mon, Apr 10, 2023 at 08:55:16PM -0700, Yang,=
 Fei wrote:<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; ...<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; diff --git a/drivers/gpu/drm/i915/g=
t/intel_gtt.h<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; b/drivers/gpu/drm/i915/gt/intel_gtt=
.h<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; index 69ce55f517f5..b632167eaf2e 10=
0644<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; --- a/drivers/gpu/drm/i915/gt/intel=
_gtt.h<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; +++ b/drivers/gpu/drm/i915/gt/intel=
_gtt.h<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; @@ -88,9 +88,18 @@ typedef u64 gen8=
_pte_t;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;&nbsp; #define BYT_PTE_SNOOPED_BY_CP=
U_CACHES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;=
&nbsp;REG_BIT(2)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;&nbsp; #define BYT_PTE_WRITEABLE&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; REG_BIT(1)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; +#define GEN12_PPGTT_PTE_PAT3&nbsp;=
&nbsp;&nbsp; BIT_ULL(62)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;&nbsp; #define GEN12_PPGTT_PTE_LM&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BIT_ULL(11)<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; +#define GEN12_PPGTT_PTE_PAT2&nbsp;=
&nbsp;&nbsp; BIT_ULL(7)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; +#define GEN12_PPGTT_PTE_NC&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; BIT_ULL(5)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; +#define GEN12_PPGTT_PTE_PAT1&nbsp;=
&nbsp;&nbsp; BIT_ULL(4)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; +#define GEN12_PPGTT_PTE_PAT0&nbsp;=
&nbsp;&nbsp; BIT_ULL(3)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt; Which bspec page is this from?&nbsp; Th=
e PPGTT descriptions in<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt; the bspec are kind of hard to track dow=
n.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp;&nbsp; [9]<a href=3D"https://gfx=
specs.intel.com/Predator/Home/Index/53521">https://gfxspecs.intel.com/Preda=
tor/Home/Index/53521</a><o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; The bspec tagging is a bit bizarre in this area=
, but I don't believe<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; this page is intended to apply to MTL. Note tha=
t this page is inside<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; a section specifically listed as &quot;57b VA S=
upport&quot; --- i.e., this<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; general section is for platforms like PVC rathe=
r than MTL.&nbsp; MTL only<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; has 48b virtual address space (bspec 55416), so=
 I think one of the<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; pages in the 48b sections is what we should be =
referencing instead.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; If they screwed up and put MTL-specific details=
 only on a PVC-specific<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; page of the bspec, we should probably file a bs=
pec issue about that to<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; get it fixed.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The Bspec is a bit confusing on these. Looked at the=
 Bsec with filter set<o:p></o:p></p>
<p class=3D"MsoNormal">to TGL/ADL/MTL/ALL respectively. Here are the differ=
ences,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp;&nbsp; PAT_Index[2:0] =3D {PAT, =
PCD, PWT} =3D BIT(7, 4, 3)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">These 3 PAT index bits are defined for all gen12+.<o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp;&nbsp; PAT_Index[3] =3D BIT(62)<=
o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">PAT_Index[3] is defined for MTL/ARL, will update thi=
s one to MTL_xxx<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp;&nbsp; PAT_Index[4] =3D BIT(61)<=
o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">PAT_Index[4] shows up only when there is no filter s=
et. And this bit is<o:p></o:p></p>
<p class=3D"MsoNormal">marked as [NOT VALID FOR SPEC: GENERALASSETSXE], not=
 sure how to interpret<o:p></o:p></p>
<p class=3D"MsoNormal">this, but seems like it should not be used at all. A=
ny suggestion?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt; But if these only apply to MTL, why are=
 they labelled as &quot;GEN12?&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp;&nbsp; These apply to GEN12plus.=
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; That's not what your patch is doing; you're usi=
ng them in a function<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; that only gets called on MTL.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">That PTE encode will be generalized to gen12 in a pa=
tch after after the<o:p></o:p></p>
<p class=3D"MsoNormal">pat_index change.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; So the question is whether these<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; definitions truly applied to older platforms li=
ke TGL/RKL/ADL/etc too<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; (and we need to go back and fix that code), or =
whether they're<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; Xe_LPG-specific, in which case the &quot;GEN12_=
&quot; prefix is incorrect.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The only difference is that MTL has PAT[3] defined, =
so we can still apply<o:p></o:p></p>
<p class=3D"MsoNormal">the same PTE encode function for all gen12+.<o:p></o=
:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; Also, handling the MTL-specific PTE encoding la=
ter in the series, after<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; the transition from cache_level to PAT index, m=
ight be best since then<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; you can just implement it correctly at the time=
 the code is introduced;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; no need to add the cache_level implementation f=
irst (which can't even<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; use all the bits) just to come back a few patch=
es later and replace it<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; all with PAT code.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I will squash the PTE encode patches.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; -#define GEN12_GGTT_PTE_LM&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BIT_ULL(1)<o:p></o:p></=
p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; +#define GEN12_GGTT_PTE_LM&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BIT_ULL(1)<o:p=
></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; +#define MTL_GGTT_PTE_PAT0&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BIT_ULL(=
52)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; +#define MTL_GGTT_PTE_PAT1&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BIT_ULL(=
53)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; +#define GEN12_GGTT_PTE_ADDR_MASK&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GENMASK_ULL(45, 12)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; +#define MTL_GGTT_PTE_PAT_MASK&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GENMASK_ULL(53, 52)<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;&nbsp; #define GEN12_PDE_64K BIT(6)<=
o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;&nbsp; #define GEN12_PTE_PS64 BIT(8)=
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; @@ -147,6 +156,15 @@ typedef u64 ge=
n8_pte_t;&nbsp; #define <o:p>
</o:p></p>
<p class=3D"MsoNormal">&gt;&gt; GEN8_PDE_IPS_64K<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; BIT(11)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;&nbsp; #define GEN8_PDE_PS_2M&nbsp;&=
nbsp; BIT(7)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; +#define MTL_PPAT_L4_CACHE_POLICY_M=
ASK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 <o:p>
</o:p></p>
<p class=3D"MsoNormal">&gt;&gt; REG_GENMASK(3, 2)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; +#define MTL_PAT_INDEX_COH_MODE_MAS=
K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; REG_GENMASK(1,
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; 0)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; +#define MTL_PPAT_L4_3_UC&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p><=
/o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp;&nbsp; REG_FIELD_PREP(MTL_PPAT_L=
4_CACHE_POLICY_MASK, 3)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; +#define MTL_PPAT_L4_1_WT&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p><=
/o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp;&nbsp; REG_FIELD_PREP(MTL_PPAT_L=
4_CACHE_POLICY_MASK, 1)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; +#define MTL_PPAT_L4_0_WB&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p><=
/o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp;&nbsp; REG_FIELD_PREP(MTL_PPAT_L=
4_CACHE_POLICY_MASK, 0)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; +#define MTL_3_COH_2W&nbsp;&nbsp;&n=
bsp;&nbsp; REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp;&nbsp; 3)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; +#define MTL_2_COH_1W&nbsp;&nbsp;&n=
bsp;&nbsp; REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp;&nbsp; 2)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; +#define MTL_0_COH_NON&nbsp;&nbsp; =
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK,=
 0)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt; The values for these definitions don't =
seem to be aligned.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp;&nbsp; These are aligned with<o:=
p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp;&nbsp; [10]<a href=3D"https://gf=
xspecs.intel.com/Predator/Home/Index/45101">https://gfxspecs.intel.com/Pred=
ator/Home/Index/45101</a><o:p></o:p></p>
<p class=3D"MsoNormal">&gt; I mean spacing aligned.&nbsp; If your tabstops =
are set to 8, then the values don't line up visually.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hmm&#8230; the three COH macro&#8217;s are aligned, =
are you saying they should aligned with those PPAT macro&#8217;s as well?<o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; Matt<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BYAPR11MB2567BAE00F7E97F7A37A6F159A9A9BYAPR11MB2567namp_--
