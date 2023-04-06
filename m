Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B969E6D9B5A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 16:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6987310EC2B;
	Thu,  6 Apr 2023 14:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94B810EC36;
 Thu,  6 Apr 2023 14:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680792954; x=1712328954;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=+SG3liMBBADwHz4yQePnFjqa6EwdAZom+p+Sx84DJdA=;
 b=bH5wYdq6+L4KhZqQXXzbmKCifgSHBSVBf7kdcVMrbiJlN78zVx4C3zRj
 M2deZ2Bt9V2UJyR3pZx1UvX5vHxzOSKoNKw0xk7O6u1o18LYP8oi0E3+v
 IgpjK17qlNnEm/c8uc+ShptDM2Oj22vpAl+npXpEsj5mHPXwCEuVl6kfL
 WRpLawO53vf03YK/ewFGm9aW9Df2v8+HGJrXgCoypyrDWL3L5tL/IyTmG
 TN/pZX3qbH1TQ+8abld0n7aSqH5eavV5AFw/lzuS153jL4zN56L5s/Rat
 aftKPUiwH9MseGwbme7w0TQwhLhh7buwKrdjfqxJMOxgdh9mgfBCNhdqx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="331390454"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
 d="scan'208,217";a="331390454"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 07:55:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="776501605"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
 d="scan'208,217";a="776501605"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 06 Apr 2023 07:55:48 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 07:55:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 07:55:47 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 6 Apr 2023 07:55:47 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 6 Apr 2023 07:55:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkS5SHkLOuLYhuhgu7VOZAzVSwd+Xjio+4yjw3JPGP+STPbaBjAc6WlKH27z25NTHmhvXoV/CFIF6v80mGm6cA3a6rFJMrcEjHrE/2K8II0n9TXgfxQBCNIg58uEzFB/PZj9nUGuXLJ7sS1BpveW7LxhUGKxnprnIFwVxRpsM/i/Ipwj0WzrBawnSqP/s/7e53lqvMJWhLgpLIqbZoaHWPISIyexbNNTDhXCTQXkH0gqAOfVQbH03XAiH1tQ3th3PPlQK/B7Hz8LamNX0CydFIFJDH7hylX72OL+Hyou3kkAgRW582TUQG7Fsuzt8APeAYKTfCQbXO7xzVK2WPioHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSeEcHSw0UHl8Xp19BoeA7WvP65J+Wbwzs96M7h1CJE=;
 b=bsIVfoOZF4gqS9xlDLDWmfLNu2Fsnevk88i/hT3H/RXg2c4FR9pRPCDIC58cgyu0cu6mEmiBawjJSTsylwD8U8Y0XlUyQln57473XO62raA4dBlbpy5LWrpS9CLIrJY8TiyumqgYA3C3GlYe24v1ckWu67KWwtNBWRZU2WcfcDZv0DOPWab1sX4dfSI+ptnzjytGIk5PLMdgG3Zdy6OoGomCve7O5n/uWkuFEoeJ8LmPI+EePp98wQBqdLkMmap1f7T4cVmUylWSmlR5UNdGRBIJA813ud0emKGCKEvzVneZG5/XD5hDS8Si3JCxGy4JAxyWp3G0qfa7E9T8UghIKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by DS0PR11MB6471.namprd11.prod.outlook.com (2603:10b6:8:c1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Thu, 6 Apr
 2023 14:55:43 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::12b1:c9af:ed85:e3ee]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::12b1:c9af:ed85:e3ee%6]) with mapi id 15.20.6277.031; Thu, 6 Apr 2023
 14:55:43 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Das, Nirmoy" <nirmoy.das@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 1/7] drm/i915/mtl: Define MOCS and PAT tables
 for MTL
Thread-Topic: [Intel-gfx] [PATCH 1/7] drm/i915/mtl: Define MOCS and PAT tables
 for MTL
Thread-Index: AQHZZGRifs9AYN1Qf0aiFk10tgB/e68d+sGAgABr5EQ=
Date: Thu, 6 Apr 2023 14:55:43 +0000
Message-ID: <BYAPR11MB25677780C61CCC52B95746619A919@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230401063830.438127-1-fei.yang@intel.com>
 <20230401063830.438127-2-fei.yang@intel.com>
 <e7f8baa8-dbdb-4362-6024-f7349b3ab2ed@linux.intel.com>
In-Reply-To: <e7f8baa8-dbdb-4362-6024-f7349b3ab2ed@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|DS0PR11MB6471:EE_
x-ms-office365-filtering-correlation-id: 33ad14e4-bf24-4a9d-7a43-08db36aefefd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EGPJQmYT+hm/eIAt7EGVhlj79G9QAXALVqE37WMEqsCO/8xlAih3/JsS0jg7HTT/1KnLadWKBJ8i8bMaKMQzgWrsV1XUCnmhcZAhZ6LXlN5GED4Tj+TB8TXLKtOhCkvdNJR2qq4X/vd1EmVcg6dN97Z1ze0BYwJ2fPaWBxS03A1LqOwgStEpfOi+bAn8nIod5vTcHt12L1uw9FJfS/gCekYQlNB/5fn5pwcxz9/AwOXncvoY+H8QGMk/SK9LRKXTd4rBjeatK/I/2Ej4OhliOX/WioxqysAeiEAIO9KTwyr2lOwSXSyxuA/BJm5aObCCRgsmVCOv/SBjvU6ImybPVpE6ISYSlj2Fg/R2kBTk+IPtv5rghqxPG4UdL9ylPKtw2sjuV7wsIx/lTkf5EHabEm6DTL4dv5fGpy+c8CFDvKaekkBi8ta0bg+g9mMT6NxigQe2nGMeoxEU0+teVAOqUe7JkEKEOmexb31oVtj8v6eukUpKbfdsLEmOjGBeIkFAJ4nzRR0setznLadky34X/44Kl6SgPDe8xBts4eq0/7ZgRJfMPw0+7e2YL7Iizs7czuUue6LkP1NhNV3GsIpXg9kJ58BgZRX9iwpXgEP6BfLyDsdwDRlzmFwG6NH9Ha9E
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(396003)(136003)(366004)(376002)(451199021)(55016003)(8676002)(64756008)(66446008)(478600001)(66556008)(66476007)(76116006)(122000001)(82960400001)(41300700001)(38100700002)(316002)(110136005)(8936002)(5660300002)(54906003)(30864003)(52536014)(66946007)(4326008)(53546011)(71200400001)(7696005)(83380400001)(186003)(26005)(6506007)(9686003)(86362001)(33656002)(38070700005)(2906002)(19627405001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?wbMmCfpPawASn22aexRTSFS/7PhUwbSWnp8T7E8EWMuJTSfJ6nm/fFcfPN?=
 =?iso-8859-1?Q?JAOw9o1x2hbOJsQZd8IT/AfKZTMAJYlVaK5i1+NQcD4mOdGE9j6wG/G2Ix?=
 =?iso-8859-1?Q?Eozc3a+LM7bd9nQx+7vCEHdvuqMiSz5VaUaRJotTi8Q8tl/VbSYvBKuMzO?=
 =?iso-8859-1?Q?Eoc0MCIQiEeeVvJCnfIqhbR9w4FGDLfMxw9JHkREUHDj0DdeoSJ2JKQIk4?=
 =?iso-8859-1?Q?M2FO2rTVmxYnY1cPC1YibiFgJze0gNCI8GpqnpUf5XVjdQr70fHn8xi58o?=
 =?iso-8859-1?Q?rjCEDVqafdkAuF+bJ78zNNLoi6VR+8HgrM3mYMAAd+L9AkO9B7xMYswTmQ?=
 =?iso-8859-1?Q?lEpSL0HynO9rit4v7ztUSUx/xeLGwbCpay93Zx2FGyisnRCHX1nw1Y7gKa?=
 =?iso-8859-1?Q?wFwF4Y+W+YiiM9QFXoP5KSB4ol0xRUkEJnhCJOp6suE8NQ73kLl0RV32Rc?=
 =?iso-8859-1?Q?x1g5W/y0KGLGe9fZOd9laas54OGrpaGNY4leL9qCC2RPpqRKegKnBkouoG?=
 =?iso-8859-1?Q?U+4vFqh5P+UY1xdizmAIlF8VM44uqyng3YkxQ0lR2W1CHZS+CqLzh/jcpK?=
 =?iso-8859-1?Q?vFk+UDASt1lO4KeJHbLkfZh9aJLlOgDKx5sjfzLNxErVt2FbiGLqIMNaBd?=
 =?iso-8859-1?Q?omxY+W/gqq+w7gcuOwJEPriz6sJuDGmhx+sFNmQCZ14uPQfgjhvYkRdAgF?=
 =?iso-8859-1?Q?9SZvyBu1REW6yg5J3X9iQG73KVKBGFDzeVKc2LOqGEt+XLk8k4M5y41dru?=
 =?iso-8859-1?Q?R7gFHCAjQ1CPerifEZ0n2dyOrK+pR+bgOi/6cbFf5BIx2HsUajldO9sX6T?=
 =?iso-8859-1?Q?5zbI0TazNHwwNq4825BSkUg3+b560SHxN10abr9p+hDuGEwxYr44LiSFRg?=
 =?iso-8859-1?Q?CeVc7YSD6dDdOO8+8+FegARsDL/ms0tFg6mgHMTGNgq3h5LUjM1GJ4Y3mk?=
 =?iso-8859-1?Q?ABpGmomfRS2F9ys7seuEiXs05lzCUwVVhYwDaqe5q+nKdzg0LO86cOURDF?=
 =?iso-8859-1?Q?LGyv7Mk+pw7UQo66/V3kLHV4Ll6LmO5AHjIiKBAuRraRTgJXW8vQsyDZfL?=
 =?iso-8859-1?Q?tqW8bQhXnj9ypoq7QCA98ehoYOmHErg7juW8I3AV9iLLKEwo3nho0JUFBQ?=
 =?iso-8859-1?Q?v1a0H2f5toygxc45YC4pAL1W0T8MhscAx2lW4WJiSH5kqfJSH+dNXrwQvC?=
 =?iso-8859-1?Q?bufvGe0emjsGz39EZB8xhckscaqArZW1ReLcO1V+Mrzw3ry714Vxc9yaJC?=
 =?iso-8859-1?Q?hAghRfUgp4g/JT7tDwTpEu1Jp5Gcsttbcqov9Djt8Ftww8LwqAj5UB42dO?=
 =?iso-8859-1?Q?4ZgpS665sFH9euXPTETNiPnF4JBSAZOlolB3S3FiVLZm4CIOUbMcIzz+8u?=
 =?iso-8859-1?Q?cJ1KOfW6fuDyhtH5ZMZCpTygT4v7FcRhP/c2Pl4AmaxuN2tGMbWbtPKW2r?=
 =?iso-8859-1?Q?XJb6WyMWXyzjyEW+29n/HjcBYhJ9OxL5CTYJkRgHTvewNplMpLajmHB0GR?=
 =?iso-8859-1?Q?hkV/YRDoeZIgUmvNVDMLh7liUqIWfbRGtGdGL/bznzNXeY2wus9CaFEWjx?=
 =?iso-8859-1?Q?gp9mAczgp+ECdcaCtLv2a+sSGHtwRX63/v5Uk++3SKQpLb/ewlPV/FKors?=
 =?iso-8859-1?Q?lAPh0xuTu7qQc=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB25677780C61CCC52B95746619A919BYAPR11MB2567namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ad14e4-bf24-4a9d-7a43-08db36aefefd
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2023 14:55:43.3014 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EK24BSYzafsTHVMhDA3TQ5BDJEFm1xzIB0Rf6rrL45wH9bookDPjFnIEUcPnXbsqBWMNrs0z93qshDsdFxemqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6471
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR11MB25677780C61CCC52B95746619A919BYAPR11MB2567namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> On 4/1/2023 8:38 AM, fei.yang@intel.com wrote:
>> From: Fei Yang <fei.yang@intel.com>
>>
>> On MTL, GT can no longer allocate on LLC - only the CPU can.
>> This, along with addition of support for ADM/L4 cache calls a
>> MOCS/PAT table update.
>> Also add PTE encode functions for MTL as it has different PAT
>> index definition than previous platforms.
>>
>> BSpec: 44509, 45101, 44235
>>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Signed-off-by: Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahall=
i.pradeep@intel.com>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_dpt.c |  2 +-
>>   drivers/gpu/drm/i915/gt/gen8_ppgtt.c     | 43 ++++++++++++--
>>   drivers/gpu/drm/i915/gt/gen8_ppgtt.h     |  3 +
>>   drivers/gpu/drm/i915/gt/intel_ggtt.c     | 36 ++++++++++-
>>   drivers/gpu/drm/i915/gt/intel_gtt.c      | 23 ++++++-
>>   drivers/gpu/drm/i915/gt/intel_gtt.h      | 20 ++++++-
>>   drivers/gpu/drm/i915/gt/intel_mocs.c     | 76 ++++++++++++++++++++++--
>>   drivers/gpu/drm/i915/gt/selftest_mocs.c  |  2 +-
>>   drivers/gpu/drm/i915/i915_pci.c          |  1 +
>>   9 files changed, 189 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/=
i915/display/intel_dpt.c
>> index b8027392144d..c5eacfdba1a5 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dpt.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dpt.c
>> @@ -300,7 +300,7 @@ intel_dpt_create(struct intel_framebuffer *fb)
>>        vm->vma_ops.bind_vma    =3D dpt_bind_vma;
>>        vm->vma_ops.unbind_vma  =3D dpt_unbind_vma;
>>
>> -     vm->pte_encode =3D gen8_ggtt_pte_encode;
>> +     vm->pte_encode =3D vm->gt->ggtt->vm.pte_encode;
>>
>>        dpt->obj =3D dpt_obj;
>>        dpt->obj->is_dpt =3D true;
>> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915=
/gt/gen8_ppgtt.c
>> index 4daaa6f55668..4197b43150cc 100644
>> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>> @@ -55,6 +55,34 @@ static u64 gen8_pte_encode(dma_addr_t addr,
>>        return pte;
>>   }
>>
>> +static u64 mtl_pte_encode(dma_addr_t addr,
>> +                       enum i915_cache_level level,
>> +                       u32 flags)
>> +{
>> +     gen8_pte_t pte =3D addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
>> +
>> +     if (unlikely(flags & PTE_READ_ONLY))
>> +             pte &=3D ~GEN8_PAGE_RW;
>> +
>> +     if (flags & PTE_LM)
>> +             pte |=3D GEN12_PPGTT_PTE_LM | GEN12_PPGTT_PTE_NC;
>> +
>> +     switch (level) {
>> +     case I915_CACHE_NONE:
>> +             pte |=3D GEN12_PPGTT_PTE_PAT1;
>> +             break;
>> +     case I915_CACHE_LLC:
>> +     case I915_CACHE_L3_LLC:
>> +             pte |=3D GEN12_PPGTT_PTE_PAT0 | GEN12_PPGTT_PTE_PAT1;
>> +             break;
>> +     case I915_CACHE_WT:
>> +             pte |=3D GEN12_PPGTT_PTE_PAT0;
>> +             break;
>> +     }
>> +
>> +     return pte;
>> +}
>> +
>>   static void gen8_ppgtt_notify_vgt(struct i915_ppgtt *ppgtt, bool creat=
e)
>>   {
>>        struct drm_i915_private *i915 =3D ppgtt->vm.i915;
>> @@ -427,7 +455,7 @@ gen8_ppgtt_insert_pte(struct i915_ppgtt *ppgtt,
>>                      u32 flags)
>>   {
>>        struct i915_page_directory *pd;
>> -     const gen8_pte_t pte_encode =3D gen8_pte_encode(0, cache_level, fl=
ags);
>> +     const gen8_pte_t pte_encode =3D ppgtt->vm.pte_encode(0, cache_leve=
l, flags);
>>        gen8_pte_t *vaddr;
>>
>>        pd =3D i915_pd_entry(pdp, gen8_pd_index(idx, 2));
>> @@ -580,7 +608,7 @@ static void gen8_ppgtt_insert_huge(struct i915_addre=
ss_space *vm,
>>                                   enum i915_cache_level cache_level,
>>                                   u32 flags)
>>   {
>> -     const gen8_pte_t pte_encode =3D gen8_pte_encode(0, cache_level, fl=
ags);
>> +     const gen8_pte_t pte_encode =3D vm->pte_encode(0, cache_level, fla=
gs);
>>        unsigned int rem =3D sg_dma_len(iter->sg);
>>        u64 start =3D vma_res->start;
>>
>> @@ -743,7 +771,7 @@ static void gen8_ppgtt_insert_entry(struct i915_addr=
ess_space *vm,
>>        GEM_BUG_ON(pt->is_compact);
>>
>>        vaddr =3D px_vaddr(pt);
>> -     vaddr[gen8_pd_index(idx, 0)] =3D gen8_pte_encode(addr, level, flag=
s);
>> +     vaddr[gen8_pd_index(idx, 0)] =3D vm->pte_encode(addr, level, flags=
);
>>        drm_clflush_virt_range(&vaddr[gen8_pd_index(idx, 0)], sizeof(*vad=
dr));
>>   }
>>
>> @@ -773,7 +801,7 @@ static void __xehpsdv_ppgtt_insert_entry_lm(struct i=
915_address_space *vm,
>>        }
>>
>>        vaddr =3D px_vaddr(pt);
>> -     vaddr[gen8_pd_index(idx, 0) / 16] =3D gen8_pte_encode(addr, level,=
 flags);
>> +     vaddr[gen8_pd_index(idx, 0) / 16] =3D vm->pte_encode(addr, level, =
flags);
>>   }
>>
>>   static void xehpsdv_ppgtt_insert_entry(struct i915_address_space *vm,
>> @@ -820,7 +848,7 @@ static int gen8_init_scratch(struct i915_address_spa=
ce *vm)
>>                pte_flags |=3D PTE_LM;
>>
>>        vm->scratch[0]->encode =3D
>> -             gen8_pte_encode(px_dma(vm->scratch[0]),
>> +             vm->pte_encode(px_dma(vm->scratch[0]),
>>                                I915_CACHE_NONE, pte_flags);
>>
>>        for (i =3D 1; i <=3D vm->top; i++) {
>> @@ -963,7 +991,10 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_g=
t *gt,
>>         */
>>        ppgtt->vm.alloc_scratch_dma =3D alloc_pt_dma;
>>
>> -     ppgtt->vm.pte_encode =3D gen8_pte_encode;
>> +     if (GRAPHICS_VER_FULL(gt->i915) >=3D IP_VER(12, 70))
>> +             ppgtt->vm.pte_encode =3D mtl_pte_encode;
>> +     else
>> +             ppgtt->vm.pte_encode =3D gen8_pte_encode;
>>
>>        ppgtt->vm.bind_async_flags =3D I915_VMA_LOCAL_BIND;
>>        ppgtt->vm.insert_entries =3D gen8_ppgtt_insert;
>> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.h b/drivers/gpu/drm/i915=
/gt/gen8_ppgtt.h
>> index f541d19264b4..6b8ce7f4d25a 100644
>> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
>> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
>> @@ -18,5 +18,8 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *=
gt,
>>   u64 gen8_ggtt_pte_encode(dma_addr_t addr,
>>                         enum i915_cache_level level,
>>                         u32 flags);
>> +u64 mtl_ggtt_pte_encode(dma_addr_t addr,
>> +                     unsigned int pat_index,
>> +                     u32 flags);
>>
>>   #endif
>> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915=
/gt/intel_ggtt.c
>> index 3c7f1ed92f5b..ba3109338aee 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> @@ -220,6 +220,33 @@ static void guc_ggtt_invalidate(struct i915_ggtt *g=
gtt)
>>        }
>>   }
>>
>> +u64 mtl_ggtt_pte_encode(dma_addr_t addr,
>> +                     enum i915_cache_level level,
>> +                     u32 flags)
>> +{
>> +     gen8_pte_t pte =3D addr | GEN8_PAGE_PRESENT;
>> +
>> +     GEM_BUG_ON(addr & ~GEN12_GGTT_PTE_ADDR_MASK);
>> +
>> +     if (flags & PTE_LM)
>> +             pte |=3D GEN12_GGTT_PTE_LM;
>> +
>> +     switch (level) {
>> +     case I915_CACHE_NONE:
>> +             pte |=3D MTL_GGTT_PTE_PAT1;
>> +             break;
>> +     case I915_CACHE_LLC:
>> +     case I915_CACHE_L3_LLC:
>> +             pte |=3D MTL_GGTT_PTE_PAT0 | MTL_GGTT_PTE_PAT1;
>> +             break;
>> +     case I915_CACHE_WT:
>> +             pte |=3D MTL_GGTT_PTE_PAT0;
>> +             break;
>> +     }
>> +
>> +     return pte;
>> +}
>> +
>>   u64 gen8_ggtt_pte_encode(dma_addr_t addr,
>>                         enum i915_cache_level level,
>>                         u32 flags)
>> @@ -247,7 +274,7 @@ static void gen8_ggtt_insert_page(struct i915_addres=
s_space *vm,
>>        gen8_pte_t __iomem *pte =3D
>>                (gen8_pte_t __iomem *)ggtt->gsm + offset / I915_GTT_PAGE_=
SIZE;
>>
>> -     gen8_set_pte(pte, gen8_ggtt_pte_encode(addr, level, flags));
>> +     gen8_set_pte(pte, ggtt->vm.pte_encode(addr, level, flags));
>>
>>        ggtt->invalidate(ggtt);
>>   }
>> @@ -257,8 +284,8 @@ static void gen8_ggtt_insert_entries(struct i915_add=
ress_space *vm,
>>                                     enum i915_cache_level level,
>>                                     u32 flags)
>>   {
>> -     const gen8_pte_t pte_encode =3D gen8_ggtt_pte_encode(0, level, fla=
gs);
>>        struct i915_ggtt *ggtt =3D i915_vm_to_ggtt(vm);
>> +     const gen8_pte_t pte_encode =3D ggtt->vm.pte_encode(0, level, flag=
s);
>>        gen8_pte_t __iomem *gte;
>>        gen8_pte_t __iomem *end;
>>        struct sgt_iter iter;
>> @@ -981,7 +1008,10 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
>>        ggtt->vm.vma_ops.bind_vma    =3D intel_ggtt_bind_vma;
>>        ggtt->vm.vma_ops.unbind_vma  =3D intel_ggtt_unbind_vma;
>>
>> -     ggtt->vm.pte_encode =3D gen8_ggtt_pte_encode;
>> +     if (GRAPHICS_VER_FULL(i915) >=3D IP_VER(12, 70))
>> +             ggtt->vm.pte_encode =3D mtl_ggtt_pte_encode;
>> +     else
>> +             ggtt->vm.pte_encode =3D gen8_ggtt_pte_encode;
>>
>>        return ggtt_probe_common(ggtt, size);
>>   }
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/=
gt/intel_gtt.c
>> index 4f436ba7a3c8..1e1b34e22cf5 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
>> @@ -468,6 +468,25 @@ void gtt_write_workarounds(struct intel_gt *gt)
>>        }
>>   }
>>
>> +static void mtl_setup_private_ppat(struct intel_uncore *uncore)
>> +{
>> +     intel_uncore_write(uncore, GEN12_PAT_INDEX(0),
>> +                        MTL_PPAT_L4_0_WB);
>> +     intel_uncore_write(uncore, GEN12_PAT_INDEX(1),
>> +                        MTL_PPAT_L4_1_WT);
>> +     intel_uncore_write(uncore, GEN12_PAT_INDEX(2),
>> +                        MTL_PPAT_L4_3_UC);
>> +     intel_uncore_write(uncore, GEN12_PAT_INDEX(3),
>> +                        MTL_PPAT_L4_0_WB | MTL_2_COH_1W);
>> +     intel_uncore_write(uncore, GEN12_PAT_INDEX(4),
>> +                        MTL_PPAT_L4_0_WB | MTL_3_COH_2W);
>> +
>> +     /*
>> +      * Remaining PAT entries are left at the hardware-default
>> +      * fully-cached setting
>> +      */
>> +}
>> +
>>   static void tgl_setup_private_ppat(struct intel_uncore *uncore)
>>   {
>>        /* TGL doesn't support LLC or AGE settings */
>> @@ -603,7 +622,9 @@ void setup_private_pat(struct intel_gt *gt)
>>
>>        GEM_BUG_ON(GRAPHICS_VER(i915) < 8);
>>
>> -     if (GRAPHICS_VER_FULL(i915) >=3D IP_VER(12, 50))
>> +     if (IS_METEORLAKE(i915))
>> +             mtl_setup_private_ppat(uncore);
>
>
> Could you please sync this with DII. We should be programming PAT for
> media tile too.
>
> I have refactor this patch in DII along with taking care of media tile
> and I think we should
>
> get those changes here too.

I don't think the PAT index registers are multicasted for MTL. The register=
s
are at 0x4800 for the render tile and 0x384800 for the media tile, and they
get programmed in gt_init separately when iterating through each gt. No?

-Fei

> Regards,
>
> Nirmoy
>
>> +     else if (GRAPHICS_VER_FULL(i915) >=3D IP_VER(12, 50))
>>                xehp_setup_private_ppat(gt);
>>        else if (GRAPHICS_VER(i915) >=3D 12)
>>                tgl_setup_private_ppat(uncore);
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/=
gt/intel_gtt.h
>> index 69ce55f517f5..b632167eaf2e 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
>> @@ -88,9 +88,18 @@ typedef u64 gen8_pte_t;
>>   #define BYT_PTE_SNOOPED_BY_CPU_CACHES       REG_BIT(2)
>>   #define BYT_PTE_WRITEABLE           REG_BIT(1)
>>
>> +#define GEN12_PPGTT_PTE_PAT3    BIT_ULL(62)
>>   #define GEN12_PPGTT_PTE_LM  BIT_ULL(11)
>> +#define GEN12_PPGTT_PTE_PAT2    BIT_ULL(7)
>> +#define GEN12_PPGTT_PTE_NC      BIT_ULL(5)
>> +#define GEN12_PPGTT_PTE_PAT1    BIT_ULL(4)
>> +#define GEN12_PPGTT_PTE_PAT0    BIT_ULL(3)
>>
>> -#define GEN12_GGTT_PTE_LM    BIT_ULL(1)
>> +#define GEN12_GGTT_PTE_LM            BIT_ULL(1)
>> +#define MTL_GGTT_PTE_PAT0            BIT_ULL(52)
>> +#define MTL_GGTT_PTE_PAT1            BIT_ULL(53)
>> +#define GEN12_GGTT_PTE_ADDR_MASK     GENMASK_ULL(45, 12)
>> +#define MTL_GGTT_PTE_PAT_MASK                GENMASK_ULL(53, 52)
>>
>>   #define GEN12_PDE_64K BIT(6)
>>   #define GEN12_PTE_PS64 BIT(8)
>> @@ -147,6 +156,15 @@ typedef u64 gen8_pte_t;
>>   #define GEN8_PDE_IPS_64K BIT(11)
>>   #define GEN8_PDE_PS_2M   BIT(7)
>>
>> +#define MTL_PPAT_L4_CACHE_POLICY_MASK        REG_GENMASK(3, 2)
>> +#define MTL_PAT_INDEX_COH_MODE_MASK  REG_GENMASK(1, 0)
>> +#define MTL_PPAT_L4_3_UC     REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MA=
SK, 3)
>> +#define MTL_PPAT_L4_1_WT     REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MA=
SK, 1)
>> +#define MTL_PPAT_L4_0_WB     REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MA=
SK, 0)
>> +#define MTL_3_COH_2W REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 3)
>> +#define MTL_2_COH_1W REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 2)
>> +#define MTL_0_COH_NON        REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK=
, 0)
>> +
>>   enum i915_cache_level;
>>
>>   struct drm_i915_gem_object;
>> diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915=
/gt/intel_mocs.c
>> index 69b489e8dfed..89570f137b2c 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_mocs.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
>> @@ -40,6 +40,10 @@ struct drm_i915_mocs_table {
>>   #define LE_COS(value)               ((value) << 15)
>>   #define LE_SSE(value)               ((value) << 17)
>>
>> +/* Defines for the tables (GLOB_MOCS_0 - GLOB_MOCS_16) */
>> +#define _L4_CACHEABILITY(value)      ((value) << 2)
>> +#define IG_PAT(value)                ((value) << 8)
>> +
>>   /* Defines for the tables (LNCFMOCS0 - LNCFMOCS31) - two entries per w=
ord */
>>   #define L3_ESC(value)               ((value) << 0)
>>   #define L3_SCC(value)               ((value) << 1)
>> @@ -50,6 +54,7 @@ struct drm_i915_mocs_table {
>>   /* Helper defines */
>>   #define GEN9_NUM_MOCS_ENTRIES       64  /* 63-64 are reserved, but con=
figured. */
>>   #define PVC_NUM_MOCS_ENTRIES        3
>> +#define MTL_NUM_MOCS_ENTRIES 16
>>
>>   /* (e)LLC caching options */
>>   /*
>> @@ -73,6 +78,12 @@ struct drm_i915_mocs_table {
>>   #define L3_2_RESERVED               _L3_CACHEABILITY(2)
>>   #define L3_3_WB                     _L3_CACHEABILITY(3)
>>
>> +/* L4 caching options */
>> +#define L4_0_WB                      _L4_CACHEABILITY(0)
>> +#define L4_1_WT                      _L4_CACHEABILITY(1)
>> +#define L4_2_RESERVED                _L4_CACHEABILITY(2)
>> +#define L4_3_UC                      _L4_CACHEABILITY(3)
>> +
>>   #define MOCS_ENTRY(__idx, __control_value, __l3cc_value) \
>>        [__idx] =3D { \
>>                .control_value =3D __control_value, \
>> @@ -416,6 +427,57 @@ static const struct drm_i915_mocs_entry pvc_mocs_ta=
ble[] =3D {
>>        MOCS_ENTRY(2, 0, L3_3_WB),
>>   };
>>
>> +static const struct drm_i915_mocs_entry mtl_mocs_table[] =3D {
>> +     /* Error - Reserved for Non-Use */
>> +     MOCS_ENTRY(0,
>> +                IG_PAT(0),
>> +                L3_LKUP(1) | L3_3_WB),
>> +     /* Cached - L3 + L4 */
>> +     MOCS_ENTRY(1,
>> +                IG_PAT(1),
>> +                L3_LKUP(1) | L3_3_WB),
>> +     /* L4 - GO:L3 */
>> +     MOCS_ENTRY(2,
>> +                IG_PAT(1),
>> +                L3_LKUP(1) | L3_1_UC),
>> +     /* Uncached - GO:L3 */
>> +     MOCS_ENTRY(3,
>> +                IG_PAT(1) | L4_3_UC,
>> +                L3_LKUP(1) | L3_1_UC),
>> +     /* L4 - GO:Mem */
>> +     MOCS_ENTRY(4,
>> +                IG_PAT(1),
>> +                L3_LKUP(1) | L3_GLBGO(1) | L3_1_UC),
>> +     /* Uncached - GO:Mem */
>> +     MOCS_ENTRY(5,
>> +                IG_PAT(1) | L4_3_UC,
>> +                L3_LKUP(1) | L3_GLBGO(1) | L3_1_UC),
>> +     /* L4 - L3:NoLKUP; GO:L3 */
>> +     MOCS_ENTRY(6,
>> +                IG_PAT(1),
>> +                L3_1_UC),
>> +     /* Uncached - L3:NoLKUP; GO:L3 */
>> +     MOCS_ENTRY(7,
>> +                IG_PAT(1) | L4_3_UC,
>> +                L3_1_UC),
>> +     /* L4 - L3:NoLKUP; GO:Mem */
>> +     MOCS_ENTRY(8,
>> +                IG_PAT(1),
>> +                L3_GLBGO(1) | L3_1_UC),
>> +     /* Uncached - L3:NoLKUP; GO:Mem */
>> +     MOCS_ENTRY(9,
>> +                IG_PAT(1) | L4_3_UC,
>> +                L3_GLBGO(1) | L3_1_UC),
>> +     /* Display - L3; L4:WT */
>> +     MOCS_ENTRY(14,
>> +                IG_PAT(1) | L4_1_WT,
>> +                L3_LKUP(1) | L3_3_WB),
>> +     /* CCS - Non-Displayable */
>> +     MOCS_ENTRY(15,
>> +                IG_PAT(1),
>> +                L3_GLBGO(1) | L3_1_UC),
>> +};
>> +
>>   enum {
>>        HAS_GLOBAL_MOCS =3D BIT(0),
>>        HAS_ENGINE_MOCS =3D BIT(1),
>> @@ -445,7 +507,13 @@ static unsigned int get_mocs_settings(const struct =
drm_i915_private *i915,
>>        memset(table, 0, sizeof(struct drm_i915_mocs_table));
>>
>>        table->unused_entries_index =3D I915_MOCS_PTE;
>> -     if (IS_PONTEVECCHIO(i915)) {
>> +     if (IS_METEORLAKE(i915)) {
>> +             table->size =3D ARRAY_SIZE(mtl_mocs_table);
>> +             table->table =3D mtl_mocs_table;
>> +             table->n_entries =3D MTL_NUM_MOCS_ENTRIES;
>> +             table->uc_index =3D 9;
>> +             table->unused_entries_index =3D 1;
>> +     } else if (IS_PONTEVECCHIO(i915)) {
>>                table->size =3D ARRAY_SIZE(pvc_mocs_table);
>>                table->table =3D pvc_mocs_table;
>>                table->n_entries =3D PVC_NUM_MOCS_ENTRIES;
>> @@ -646,9 +714,9 @@ void intel_mocs_init_engine(struct intel_engine_cs *=
engine)
>>                init_l3cc_table(engine->gt, &table);
>>   }
>>
>> -static u32 global_mocs_offset(void)
>> +static u32 global_mocs_offset(struct intel_gt *gt)
>>   {
>> -     return i915_mmio_reg_offset(GEN12_GLOBAL_MOCS(0));
>> +     return i915_mmio_reg_offset(GEN12_GLOBAL_MOCS(0)) + gt->uncore->gs=
i_offset;
>>   }
>>
>>   void intel_set_mocs_index(struct intel_gt *gt)
>> @@ -671,7 +739,7 @@ void intel_mocs_init(struct intel_gt *gt)
>>         */
>>        flags =3D get_mocs_settings(gt->i915, &table);
>>        if (flags & HAS_GLOBAL_MOCS)
>> -             __init_mocs_table(gt->uncore, &table, global_mocs_offset()=
);
>> +             __init_mocs_table(gt->uncore, &table, global_mocs_offset(g=
t));
>>
>>        /*
>>         * Initialize the L3CC table as part of mocs initalization to mak=
e
>> diff --git a/drivers/gpu/drm/i915/gt/selftest_mocs.c b/drivers/gpu/drm/i=
915/gt/selftest_mocs.c
>> index ca009a6a13bd..730796346514 100644
>> --- a/drivers/gpu/drm/i915/gt/selftest_mocs.c
>> +++ b/drivers/gpu/drm/i915/gt/selftest_mocs.c
>> @@ -137,7 +137,7 @@ static int read_mocs_table(struct i915_request *rq,
>>                return 0;
>>
>>        if (HAS_GLOBAL_MOCS_REGISTERS(rq->engine->i915))
>> -             addr =3D global_mocs_offset();
>> +             addr =3D global_mocs_offset(rq->engine->gt);
>>        else
>>                addr =3D mocs_offset(rq->engine);
>>
>> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915=
_pci.c
>> index 621730b6551c..480b128499ae 100644
>> --- a/drivers/gpu/drm/i915/i915_pci.c
>> +++ b/drivers/gpu/drm/i915/i915_pci.c
>> @@ -1149,6 +1149,7 @@ static const struct intel_device_info mtl_info =3D=
 {
>>        .has_flat_ccs =3D 0,
>>        .has_gmd_id =3D 1,
>>        .has_guc_deprivilege =3D 1,
>> +     .has_llc =3D 0,
>>        .has_mslice_steering =3D 0,
>>        .has_snoop =3D 1,
>>        .__runtime.memory_regions =3D REGION_SMEM | REGION_STOLEN_LMEM,


--_000_BYAPR11MB25677780C61CCC52B95746619A919BYAPR11MB2567namp_
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
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted0">
&gt; On 4/1/2023 8:38 AM, fei.yang@intel.com wrote:
<div class=3D"ContentPasted0">&gt;&gt; From: Fei Yang &lt;fei.yang@intel.co=
m&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; On MTL, GT can no longer allocate on=
 LLC - only the CPU can.</div>
<div class=3D"ContentPasted0">&gt;&gt; This, along with addition of support=
 for ADM/L4 cache calls a</div>
<div class=3D"ContentPasted0">&gt;&gt; MOCS/PAT table update.</div>
<div class=3D"ContentPasted0">&gt;&gt; Also add PTE encode functions for MT=
L as it has different PAT</div>
<div class=3D"ContentPasted0">&gt;&gt; index definition than previous platf=
orms.</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; BSpec: 44509, 45101, 44235</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Cc: Matt Roper &lt;matthew.d.roper@i=
ntel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Cc: Lucas De Marchi &lt;lucas.demarc=
hi@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Signed-off-by: Madhumitha Tolakanaha=
lli Pradeep &lt;madhumitha.tolakanahalli.pradeep@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Signed-off-by: Aravind Iddamsetty &l=
t;aravind.iddamsetty@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Signed-off-by: Fei Yang &lt;fei.yang=
@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; ---</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/display/=
intel_dpt.c | &nbsp;2 +-</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/gen8_=
ppgtt.c &nbsp; &nbsp; | 43 ++++++++++++--</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/gen8_=
ppgtt.h &nbsp; &nbsp; | &nbsp;3 +</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/intel=
_ggtt.c &nbsp; &nbsp; | 36 ++++++++++-</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/intel=
_gtt.c &nbsp; &nbsp; &nbsp;| 23 ++++++-</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/intel=
_gtt.h &nbsp; &nbsp; &nbsp;| 20 ++++++-</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/intel=
_mocs.c &nbsp; &nbsp; | 76 ++++++++++++++++++++++--</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/selft=
est_mocs.c &nbsp;| &nbsp;2 +-</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/i915_pci=
.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;1 +</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; 9 files changed, 189 insertio=
ns(+), 17 deletions(-)</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/di=
splay/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index b8027392144d..c5eacfdba1a5 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/display/i=
ntel_dpt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/display/i=
ntel_dpt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -300,7 +300,7 @@ intel_dpt_create=
(struct intel_framebuffer *fb)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;vm-&gt;vm=
a_ops.bind_vma &nbsp; &nbsp;=3D dpt_bind_vma;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;vm-&gt;vm=
a_ops.unbind_vma &nbsp;=3D dpt_unbind_vma;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; vm-&gt;pte_encode =
=3D gen8_ggtt_pte_encode;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; vm-&gt;pte_encode =
=3D vm-&gt;gt-&gt;ggtt-&gt;vm.pte_encode;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;dpt-&gt;o=
bj =3D dpt_obj;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;dpt-&gt;o=
bj-&gt;is_dpt =3D true;</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/gt=
/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index 4daaa6f55668..4197b43150cc 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gt/gen8_p=
pgtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gt/gen8_p=
pgtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -55,6 +55,34 @@ static u64 gen8_p=
te_encode(dma_addr_t addr,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;return pt=
e;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; +static u64 mtl_pte_encode(dma_addr_=
t addr,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enum i915_cache_level level,</di=
v>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u32 flags)</div>
<div class=3D"ContentPasted0">&gt;&gt; +{</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; gen8_pte_t pte =3D a=
ddr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; if (unlikely(flags &=
amp; PTE_READ_ONLY))</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; pte &amp;=3D ~GEN8_PAGE_RW;</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; if (flags &amp; PTE_=
LM)</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; pte |=3D GEN12_PPGTT_PTE_LM | GEN12_PPGTT_PTE_NC;</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; switch (level) {</di=
v>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; case I915_CACHE_NONE=
:</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; pte |=3D GEN12_PPGTT_PTE_PAT1;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; break;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; case I915_CACHE_LLC:=
</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; case I915_CACHE_L3_L=
LC:</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; pte |=3D GEN12_PPGTT_PTE_PAT0 | GEN12_PPGTT_PTE_PAT1;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; break;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; case I915_CACHE_WT:<=
/div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; pte |=3D GEN12_PPGTT_PTE_PAT0;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; break;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; return pte;</div>
<div class=3D"ContentPasted0">&gt;&gt; +}</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static void gen8_ppgtt_notify=
_vgt(struct i915_ppgtt *ppgtt, bool create)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct dr=
m_i915_private *i915 =3D ppgtt-&gt;vm.i915;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -427,7 +455,7 @@ gen8_ppgtt_inser=
t_pte(struct i915_ppgtt *ppgtt,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u32 flags)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct i9=
15_page_directory *pd;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; const gen8_pte_t pte=
_encode =3D gen8_pte_encode(0, cache_level, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; const gen8_pte_t pte=
_encode =3D ppgtt-&gt;vm.pte_encode(0, cache_level, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;gen8_pte_=
t *vaddr;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;pd =3D i9=
15_pd_entry(pdp, gen8_pd_index(idx, 2));</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -580,7 +608,7 @@ static void gen8=
_ppgtt_insert_huge(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; enum i915_cache_level cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; u32 flags)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; const gen8_pte_t pte=
_encode =3D gen8_pte_encode(0, cache_level, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; const gen8_pte_t pte=
_encode =3D vm-&gt;pte_encode(0, cache_level, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;unsigned =
int rem =3D sg_dma_len(iter-&gt;sg);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;u64 start=
 =3D vma_res-&gt;start;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -743,7 +771,7 @@ static void gen8=
_ppgtt_insert_entry(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;GEM_BUG_O=
N(pt-&gt;is_compact);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;vaddr =3D=
 px_vaddr(pt);</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; vaddr[gen8_pd_index(=
idx, 0)] =3D gen8_pte_encode(addr, level, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; vaddr[gen8_pd_index(=
idx, 0)] =3D vm-&gt;pte_encode(addr, level, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;drm_clflu=
sh_virt_range(&amp;vaddr[gen8_pd_index(idx, 0)], sizeof(*vaddr));</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -773,7 +801,7 @@ static void __xe=
hpsdv_ppgtt_insert_entry_lm(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;vaddr =3D=
 px_vaddr(pt);</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; vaddr[gen8_pd_index(=
idx, 0) / 16] =3D gen8_pte_encode(addr, level, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; vaddr[gen8_pd_index(=
idx, 0) / 16] =3D vm-&gt;pte_encode(addr, level, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static void xehpsdv_ppgtt_ins=
ert_entry(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -820,7 +848,7 @@ static int gen8_=
init_scratch(struct i915_address_space *vm)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;pte_flags |=3D PTE_LM;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;vm-&gt;sc=
ratch[0]-&gt;encode =3D</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; gen8_pte_encode(px_dma(vm-&gt;scratch[0]),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; vm-&gt;pte_encode(px_dma(vm-&gt;scratch[0]),</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
I915_CACHE_NONE, pte_flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;for (i =
=3D 1; i &lt;=3D vm-&gt;top; i++) {</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -963,7 +991,10 @@ struct i915_ppg=
tt *gen8_ppgtt_create(struct intel_gt *gt,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; */</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;ppgtt-&gt=
;vm.alloc_scratch_dma =3D alloc_pt_dma;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; ppgtt-&gt;vm.pte_enc=
ode =3D gen8_pte_encode;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; if (GRAPHICS_VER_FUL=
L(gt-&gt;i915) &gt;=3D IP_VER(12, 70))</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; ppgtt-&gt;vm.pte_encode =3D mtl_pte_encode;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; else</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; ppgtt-&gt;vm.pte_encode =3D gen8_pte_encode;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;ppgtt-&gt=
;vm.bind_async_flags =3D I915_VMA_LOCAL_BIND;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;ppgtt-&gt=
;vm.insert_entries =3D gen8_ppgtt_insert;</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/gt=
/gen8_ppgtt.h b/drivers/gpu/drm/i915/gt/gen8_ppgtt.h</div>
<div class=3D"ContentPasted0">&gt;&gt; index f541d19264b4..6b8ce7f4d25a 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gt/gen8_p=
pgtt.h</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gt/gen8_p=
pgtt.h</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -18,5 +18,8 @@ struct i915_ppgtt =
*gen8_ppgtt_create(struct intel_gt *gt,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; u64 gen8_ggtt_pte_encode(dma_=
addr_t addr,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enum i915_cache_level level=
,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u32 flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; +u64 mtl_ggtt_pte_encode(dma_addr_t =
addr,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; unsigned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u32 flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #endif</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/gt=
/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index 3c7f1ed92f5b..ba3109338aee 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gt/intel_=
ggtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gt/intel_=
ggtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -220,6 +220,33 @@ static void guc=
_ggtt_invalidate(struct i915_ggtt *ggtt)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; +u64 mtl_ggtt_pte_encode(dma_addr_t =
addr,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enum i915_cache_level level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u32 flags)</div>
<div class=3D"ContentPasted0">&gt;&gt; +{</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; gen8_pte_t pte =3D a=
ddr | GEN8_PAGE_PRESENT;</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; GEM_BUG_ON(addr &amp=
; ~GEN12_GGTT_PTE_ADDR_MASK);</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; if (flags &amp; PTE_=
LM)</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; pte |=3D GEN12_GGTT_PTE_LM;</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; switch (level) {</di=
v>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; case I915_CACHE_NONE=
:</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; pte |=3D MTL_GGTT_PTE_PAT1;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; break;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; case I915_CACHE_LLC:=
</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; case I915_CACHE_L3_L=
LC:</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; pte |=3D MTL_GGTT_PTE_PAT0 | MTL_GGTT_PTE_PAT1;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; break;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; case I915_CACHE_WT:<=
/div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; pte |=3D MTL_GGTT_PTE_PAT0;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; break;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; return pte;</div>
<div class=3D"ContentPasted0">&gt;&gt; +}</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; u64 gen8_ggtt_pte_encode(dma_=
addr_t addr,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enum i915_cache_level level=
,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u32 flags)</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -247,7 +274,7 @@ static void gen8=
_ggtt_insert_page(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;gen8_pte_=
t __iomem *pte =3D</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;(gen8_pte_t __iomem *)ggtt-&gt;gsm + offset / I915_GTT_P=
AGE_SIZE;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; gen8_set_pte(pte, ge=
n8_ggtt_pte_encode(addr, level, flags));</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; gen8_set_pte(pte, gg=
tt-&gt;vm.pte_encode(addr, level, flags));</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;ggtt-&gt;=
invalidate(ggtt);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -257,8 +284,8 @@ static void gen8=
_ggtt_insert_entries(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; enum i915_cache_level level,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; u32 flags)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; const gen8_pte_t pte=
_encode =3D gen8_ggtt_pte_encode(0, level, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct i9=
15_ggtt *ggtt =3D i915_vm_to_ggtt(vm);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; const gen8_pte_t pte=
_encode =3D ggtt-&gt;vm.pte_encode(0, level, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;gen8_pte_=
t __iomem *gte;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;gen8_pte_=
t __iomem *end;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct sg=
t_iter iter;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -981,7 +1008,10 @@ static int gen=
8_gmch_probe(struct i915_ggtt *ggtt)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;ggtt-&gt;=
vm.vma_ops.bind_vma &nbsp; &nbsp;=3D intel_ggtt_bind_vma;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;ggtt-&gt;=
vm.vma_ops.unbind_vma &nbsp;=3D intel_ggtt_unbind_vma;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; ggtt-&gt;vm.pte_enco=
de =3D gen8_ggtt_pte_encode;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; if (GRAPHICS_VER_FUL=
L(i915) &gt;=3D IP_VER(12, 70))</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; ggtt-&gt;vm.pte_encode =3D mtl_ggtt_pte_encode;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; else</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; ggtt-&gt;vm.pte_encode =3D gen8_ggtt_pte_encode;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;return gg=
tt_probe_common(ggtt, size);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/gt=
/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index 4f436ba7a3c8..1e1b34e22cf5 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gt/intel_=
gtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gt/intel_=
gtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -468,6 +468,25 @@ void gtt_write_=
workarounds(struct intel_gt *gt)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; +static void mtl_setup_private_ppat(=
struct intel_uncore *uncore)</div>
<div class=3D"ContentPasted0">&gt;&gt; +{</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; intel_uncore_write(u=
ncore, GEN12_PAT_INDEX(0),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MTL_PPAT_L4_0_WB);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; intel_uncore_write(u=
ncore, GEN12_PAT_INDEX(1),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MTL_PPAT_L4_1_WT);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; intel_uncore_write(u=
ncore, GEN12_PAT_INDEX(2),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MTL_PPAT_L4_3_UC);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; intel_uncore_write(u=
ncore, GEN12_PAT_INDEX(3),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MTL_PPAT_L4_0_WB | MTL_2_C=
OH_1W);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; intel_uncore_write(u=
ncore, GEN12_PAT_INDEX(4),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MTL_PPAT_L4_0_WB | MTL_3_C=
OH_2W);</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; /*</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* Remaining PA=
T entries are left at the hardware-default</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* fully-cached=
 setting</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;*/</div>
<div class=3D"ContentPasted0">&gt;&gt; +}</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static void tgl_setup_private=
_ppat(struct intel_uncore *uncore)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;/* TGL do=
esn't support LLC or AGE settings */</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -603,7 +622,9 @@ void setup_priva=
te_pat(struct intel_gt *gt)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;GEM_BUG_O=
N(GRAPHICS_VER(i915) &lt; 8);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; if (GRAPHICS_VER_FUL=
L(i915) &gt;=3D IP_VER(12, 50))</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; if (IS_METEORLAKE(i9=
15))</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; mtl_setup_private_ppat(uncore);</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Could you please sync this with DII. We =
should be programming PAT for</div>
<div class=3D"ContentPasted0">&gt; media tile too.</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; I have refactor this patch in DII along =
with taking care of media tile</div>
<div class=3D"ContentPasted0">&gt; and I think we should</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; get those changes here too.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">I don't think the PAT index registers are mul=
ticasted for MTL. The registers</div>
<div class=3D"ContentPasted0">are at 0x4800 for the render tile and 0x38480=
0 for the media tile, and they</div>
<div class=3D"ContentPasted0">get programmed in gt_init separately when ite=
rating through each gt. No?</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">-Fei</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt; Regards,</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Nirmoy</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; else if (GRAPHICS_VE=
R_FULL(i915) &gt;=3D IP_VER(12, 50))</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;xehp_setup_private_ppat(gt);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;else if (=
GRAPHICS_VER(i915) &gt;=3D 12)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;tgl_setup_private_ppat(uncore);</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/gt=
/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h</div>
<div class=3D"ContentPasted0">&gt;&gt; index 69ce55f517f5..b632167eaf2e 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gt/intel_=
gtt.h</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gt/intel_=
gtt.h</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -88,9 +88,18 @@ typedef u64 gen8_=
pte_t;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #define BYT_PTE_SNOOPED_BY_CP=
U_CACHES &nbsp; &nbsp; &nbsp; REG_BIT(2)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #define BYT_PTE_WRITEABLE &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; REG_BIT(1)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; +#define GEN12_PPGTT_PTE_PAT3 &nbsp;=
 &nbsp;BIT_ULL(62)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #define GEN12_PPGTT_PTE_LM &n=
bsp;BIT_ULL(11)</div>
<div class=3D"ContentPasted0">&gt;&gt; +#define GEN12_PPGTT_PTE_PAT2 &nbsp;=
 &nbsp;BIT_ULL(7)</div>
<div class=3D"ContentPasted0">&gt;&gt; +#define GEN12_PPGTT_PTE_NC &nbsp; &=
nbsp; &nbsp;BIT_ULL(5)</div>
<div class=3D"ContentPasted0">&gt;&gt; +#define GEN12_PPGTT_PTE_PAT1 &nbsp;=
 &nbsp;BIT_ULL(4)</div>
<div class=3D"ContentPasted0">&gt;&gt; +#define GEN12_PPGTT_PTE_PAT0 &nbsp;=
 &nbsp;BIT_ULL(3)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; -#define GEN12_GGTT_PTE_LM &nbsp; &n=
bsp;BIT_ULL(1)</div>
<div class=3D"ContentPasted0">&gt;&gt; +#define GEN12_GGTT_PTE_LM &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;BIT_ULL(1)</div>
<div class=3D"ContentPasted0">&gt;&gt; +#define MTL_GGTT_PTE_PAT0 &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;BIT_ULL(52)</div>
<div class=3D"ContentPasted0">&gt;&gt; +#define MTL_GGTT_PTE_PAT1 &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;BIT_ULL(53)</div>
<div class=3D"ContentPasted0">&gt;&gt; +#define GEN12_GGTT_PTE_ADDR_MASK &n=
bsp; &nbsp; GENMASK_ULL(45, 12)</div>
<div class=3D"ContentPasted0">&gt;&gt; +#define MTL_GGTT_PTE_PAT_MASK &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;GENMASK_ULL(53, 52)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #define GEN12_PDE_64K BIT(6)<=
/div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #define GEN12_PTE_PS64 BIT(8)=
</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -147,6 +156,15 @@ typedef u64 gen=
8_pte_t;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #define GEN8_PDE_IPS_64K BIT(=
11)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #define GEN8_PDE_PS_2M &nbsp;=
 BIT(7)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; +#define MTL_PPAT_L4_CACHE_POLICY_MA=
SK &nbsp; &nbsp; &nbsp; &nbsp;REG_GENMASK(3, 2)</div>
<div class=3D"ContentPasted0">&gt;&gt; +#define MTL_PAT_INDEX_COH_MODE_MASK=
 &nbsp;REG_GENMASK(1, 0)</div>
<div class=3D"ContentPasted0">&gt;&gt; +#define MTL_PPAT_L4_3_UC &nbsp; &nb=
sp; REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 3)</div>
<div class=3D"ContentPasted0">&gt;&gt; +#define MTL_PPAT_L4_1_WT &nbsp; &nb=
sp; REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 1)</div>
<div class=3D"ContentPasted0">&gt;&gt; +#define MTL_PPAT_L4_0_WB &nbsp; &nb=
sp; REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 0)</div>
<div class=3D"ContentPasted0">&gt;&gt; +#define MTL_3_COH_2W REG_FIELD_PREP=
(MTL_PAT_INDEX_COH_MODE_MASK, 3)</div>
<div class=3D"ContentPasted0">&gt;&gt; +#define MTL_2_COH_1W REG_FIELD_PREP=
(MTL_PAT_INDEX_COH_MODE_MASK, 2)</div>
<div class=3D"ContentPasted0">&gt;&gt; +#define MTL_0_COH_NON &nbsp; &nbsp;=
 &nbsp; &nbsp;REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 0)</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; enum i915_cache_level;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; struct drm_i915_gem_object;</=
div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/gt=
/intel_mocs.c b/drivers/gpu/drm/i915/gt/intel_mocs.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index 69b489e8dfed..89570f137b2c 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gt/intel_=
mocs.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gt/intel_=
mocs.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -40,6 +40,10 @@ struct drm_i915_m=
ocs_table {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #define LE_COS(value) &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ((value) &lt;&lt; 15)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #define LE_SSE(value) &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ((value) &lt;&lt; 17)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; +/* Defines for the tables (GLOB_MOC=
S_0 - GLOB_MOCS_16) */</div>
<div class=3D"ContentPasted0">&gt;&gt; +#define _L4_CACHEABILITY(value) &nb=
sp; &nbsp; &nbsp;((value) &lt;&lt; 2)</div>
<div class=3D"ContentPasted0">&gt;&gt; +#define IG_PAT(value) &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;((value) &lt;&lt; 8)</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; /* Defines for the tables (LN=
CFMOCS0 - LNCFMOCS31) - two entries per word */</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #define L3_ESC(value) &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ((value) &lt;&lt; 0)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #define L3_SCC(value) &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ((value) &lt;&lt; 1)</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -50,6 +54,7 @@ struct drm_i915_mo=
cs_table {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; /* Helper defines */</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #define GEN9_NUM_MOCS_ENTRIES=
 &nbsp; &nbsp; &nbsp; 64 &nbsp;/* 63-64 are reserved, but configured. */</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #define PVC_NUM_MOCS_ENTRIES =
&nbsp; &nbsp; &nbsp; &nbsp;3</div>
<div class=3D"ContentPasted0">&gt;&gt; +#define MTL_NUM_MOCS_ENTRIES 16</di=
v>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; /* (e)LLC caching options */<=
/div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; /*</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -73,6 +78,12 @@ struct drm_i915_m=
ocs_table {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #define L3_2_RESERVED &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; _L3_CACHEABILITY(2)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #define L3_3_WB &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; _L3_CACHEABILITY(3=
)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; +/* L4 caching options */</div>
<div class=3D"ContentPasted0">&gt;&gt; +#define L4_0_WB &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;_L4_CACHEABILITY(0=
)</div>
<div class=3D"ContentPasted0">&gt;&gt; +#define L4_1_WT &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;_L4_CACHEABILITY(1=
)</div>
<div class=3D"ContentPasted0">&gt;&gt; +#define L4_2_RESERVED &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;_L4_CACHEABILITY(2)</div>
<div class=3D"ContentPasted0">&gt;&gt; +#define L4_3_UC &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;_L4_CACHEABILITY(3=
)</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #define MOCS_ENTRY(__idx, __c=
ontrol_value, __l3cc_value) \</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;[__idx] =
=3D { \</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;.control_value =3D __control_value, \</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -416,6 +427,57 @@ static const st=
ruct drm_i915_mocs_entry pvc_mocs_table[] =3D {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;MOCS_ENTR=
Y(2, 0, L3_3_WB),</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; };</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; +static const struct drm_i915_mocs_e=
ntry mtl_mocs_table[] =3D {</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; /* Error - Reserved =
for Non-Use */</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; MOCS_ENTRY(0,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;IG_PAT(0),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;L3_LKUP(1) | L3_3_WB),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; /* Cached - L3 + L4 =
*/</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; MOCS_ENTRY(1,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;IG_PAT(1),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;L3_LKUP(1) | L3_3_WB),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; /* L4 - GO:L3 */</di=
v>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; MOCS_ENTRY(2,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;IG_PAT(1),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;L3_LKUP(1) | L3_1_UC),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; /* Uncached - GO:L3 =
*/</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; MOCS_ENTRY(3,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;IG_PAT(1) | L4_3_UC,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;L3_LKUP(1) | L3_1_UC),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; /* L4 - GO:Mem */</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; MOCS_ENTRY(4,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;IG_PAT(1),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;L3_LKUP(1) | L3_GLBGO(1) | L3_1_UC),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; /* Uncached - GO:Mem=
 */</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; MOCS_ENTRY(5,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;IG_PAT(1) | L4_3_UC,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;L3_LKUP(1) | L3_GLBGO(1) | L3_1_UC),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; /* L4 - L3:NoLKUP; G=
O:L3 */</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; MOCS_ENTRY(6,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;IG_PAT(1),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;L3_1_UC),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; /* Uncached - L3:NoL=
KUP; GO:L3 */</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; MOCS_ENTRY(7,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;IG_PAT(1) | L4_3_UC,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;L3_1_UC),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; /* L4 - L3:NoLKUP; G=
O:Mem */</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; MOCS_ENTRY(8,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;IG_PAT(1),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;L3_GLBGO(1) | L3_1_UC),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; /* Uncached - L3:NoL=
KUP; GO:Mem */</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; MOCS_ENTRY(9,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;IG_PAT(1) | L4_3_UC,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;L3_GLBGO(1) | L3_1_UC),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; /* Display - L3; L4:=
WT */</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; MOCS_ENTRY(14,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;IG_PAT(1) | L4_1_WT,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;L3_LKUP(1) | L3_3_WB),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; /* CCS - Non-Display=
able */</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; MOCS_ENTRY(15,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;IG_PAT(1),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;L3_GLBGO(1) | L3_1_UC),</div>
<div class=3D"ContentPasted0">&gt;&gt; +};</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; enum {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;HAS_GLOBA=
L_MOCS =3D BIT(0),</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;HAS_ENGIN=
E_MOCS =3D BIT(1),</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -445,7 +507,13 @@ static unsigned=
 int get_mocs_settings(const struct drm_i915_private *i915,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;memset(ta=
ble, 0, sizeof(struct drm_i915_mocs_table));</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;table-&gt=
;unused_entries_index =3D I915_MOCS_PTE;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; if (IS_PONTEVECCHIO(=
i915)) {</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; if (IS_METEORLAKE(i9=
15)) {</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; table-&gt;size =3D ARRAY_SIZE(mtl_mocs_table);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; table-&gt;table =3D mtl_mocs_table;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; table-&gt;n_entries =3D MTL_NUM_MOCS_ENTRIES;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; table-&gt;uc_index =3D 9;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; table-&gt;unused_entries_index =3D 1;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; } else if (IS_PONTEV=
ECCHIO(i915)) {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;table-&gt;size =3D ARRAY_SIZE(pvc_mocs_table);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;table-&gt;table =3D pvc_mocs_table;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;table-&gt;n_entries =3D PVC_NUM_MOCS_ENTRIES;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -646,9 +714,9 @@ void intel_mocs_=
init_engine(struct intel_engine_cs *engine)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;init_l3cc_table(engine-&gt;gt, &amp;table);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; -static u32 global_mocs_offset(void)=
</div>
<div class=3D"ContentPasted0">&gt;&gt; +static u32 global_mocs_offset(struc=
t intel_gt *gt)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; return i915_mmio_reg=
_offset(GEN12_GLOBAL_MOCS(0));</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; return i915_mmio_reg=
_offset(GEN12_GLOBAL_MOCS(0)) + gt-&gt;uncore-&gt;gsi_offset;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; void intel_set_mocs_index(str=
uct intel_gt *gt)</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -671,7 +739,7 @@ void intel_mocs_=
init(struct intel_gt *gt)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; */</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;flags =3D=
 get_mocs_settings(gt-&gt;i915, &amp;table);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (flags=
 &amp; HAS_GLOBAL_MOCS)</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; __init_mocs_table(gt-&gt;uncore, &amp;table, global_mocs_offset());=
</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; __init_mocs_table(gt-&gt;uncore, &amp;table, global_mocs_offset(gt)=
);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;/*</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * Initia=
lize the L3CC table as part of mocs initalization to make</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/gt=
/selftest_mocs.c b/drivers/gpu/drm/i915/gt/selftest_mocs.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index ca009a6a13bd..730796346514 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gt/selfte=
st_mocs.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gt/selfte=
st_mocs.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -137,7 +137,7 @@ static int read_=
mocs_table(struct i915_request *rq,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;return 0;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (HAS_G=
LOBAL_MOCS_REGISTERS(rq-&gt;engine-&gt;i915))</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; addr =3D global_mocs_offset();</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; addr =3D global_mocs_offset(rq-&gt;engine-&gt;gt);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;else</div=
>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;addr =3D mocs_offset(rq-&gt;engine);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/i9=
15_pci.c b/drivers/gpu/drm/i915/i915_pci.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index 621730b6551c..480b128499ae 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/i915_pci.=
c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/i915_pci.=
c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -1149,6 +1149,7 @@ static const s=
truct intel_device_info mtl_info =3D {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;.has_flat=
_ccs =3D 0,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;.has_gmd_=
id =3D 1,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;.has_guc_=
deprivilege =3D 1,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; .has_llc =3D 0,</div=
>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;.has_msli=
ce_steering =3D 0,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;.has_snoo=
p =3D 1,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;.__runtim=
e.memory_regions =3D REGION_SMEM | REGION_STOLEN_LMEM,</div>
<br>
</div>
</body>
</html>

--_000_BYAPR11MB25677780C61CCC52B95746619A919BYAPR11MB2567namp_--
