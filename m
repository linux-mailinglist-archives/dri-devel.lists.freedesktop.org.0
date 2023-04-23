Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F07766EBDB2
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 09:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA3B10E0BC;
	Sun, 23 Apr 2023 07:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E6B10E0BC;
 Sun, 23 Apr 2023 07:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682235452; x=1713771452;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zDbaj0tHDw1jF4mZTr6bGIsikZvH5PWP6TJ5FSwfPRU=;
 b=SvgOKCHnVtypfRGMisp45t+LeKZX+vb7O9noVQsKWpvU3MRuCWzQu28M
 YkCUh7Z0xVI/laaLoP2Nhi9/VoFlb91NLJFuE+59VbDpBiMWGVK4ixJv1
 nwpVhVKnUWmpe/kG8D0wK7pmHz2xQ4cblQvMfGn7okMGKe2saQQtIcXXK
 kDJU1byVa4foyV7bh2ZeNz6FkJSz8R+EvnY5CUDE5iaUsa1IUGHTwsuov
 tykXxTWBHxWk+q1q+XWG70rmqL9swANwbU5ucbw78t2z0sSAJ90i7aTOf
 embzBEzUb/q3N5KjpQmHlmm2aPPTO6mqZVZyBk4PK2ZykUPfDTmkpXNbv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="411530792"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; d="scan'208";a="411530792"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2023 00:37:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="1022340130"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; d="scan'208";a="1022340130"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 23 Apr 2023 00:37:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 23 Apr 2023 00:37:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 23 Apr 2023 00:37:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 23 Apr 2023 00:37:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 23 Apr 2023 00:37:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oe7mgGxvq0c+glDshekrQcJ+KDdFDC9CtNbB6XXv/IMr9C2SarCtTQc8k3eP7Zb3GaInPB0DY/CIziPtAEQiLWyBZTc++Q03lgi6ok6UmQWxtwa06BKJBxbvjeCH2TyVv3Cm2GVAoQzwb5TCWpKO4B1Cs2erG7jKynoGuLcn9sncATaZj5m5x3yic7Y0almMOX9vnGRPUuVW/2/qX1xF1h6yAtXBj24kWTSHkx19SHeYOjdAT5zwK5kLG7cow20EgUl/IX1TbVdVeLOsGrhZ96c4Z24qhnq0iAL1tMKco5CUoWdRB1q/zfIhrF6tsgeyqGxKUNhkW2L086jwSWJg4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWeA7FUXNhMEgS87PQPFuqIuPVrojm3ng0PrbHNjvS8=;
 b=bBG6OrZT92VaBxZ2uhTmEmo+3uANfHPryWEUC7r2p8dImyXNo7kAQnxA1Ho8vmTgz8hOH8/9q6zKA6UOHRHotIPYlUETKvmhLy4fexy6GTscgv50bXgC9GLs04cbgbjR3H2TvbEIUm3Ljz7dSACklraNup9psQcGtChKCjbW2QSU2lyLVmT8jmZoQAJue7/cCugMjkNnUrCAvv+xuPCkE31MmDdV9mvtKekGENFjmzkhoJYLiaT1nvXZ94XqU+Sdr9yKy7J60KoZQ0yXtIetmDJS9fkK6J/+mDuiGH9MUVajoNHShpjyZ69ejSxSf583tPSDsd2atreufrMnDpAkqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by MN2PR11MB4581.namprd11.prod.outlook.com (2603:10b6:208:26c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Sun, 23 Apr
 2023 07:37:27 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::12b1:c9af:ed85:e3ee]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::12b1:c9af:ed85:e3ee%4]) with mapi id 15.20.6319.032; Sun, 23 Apr 2023
 07:37:27 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [Intel-gfx] [PATCH 3/8] drm/i915/mtl: Add PTE encode function
Thread-Topic: [Intel-gfx] [PATCH 3/8] drm/i915/mtl: Add PTE encode function
Thread-Index: AQHZcxKnCuG3NwvExEaiiwkKEl7V0K80qqoAgAFaUACAAAZFAIACep+Q
Date: Sun, 23 Apr 2023 07:37:27 +0000
Message-ID: <BYAPR11MB2567E74CCD65192A9F699B169A669@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230419230058.2659455-1-fei.yang@intel.com>
 <20230419230058.2659455-4-fei.yang@intel.com>
 <20230420204056.GZ4085390@mdroper-desk1.amr.corp.intel.com>
 <BYAPR11MB2567042124B3E0D09E1696489A609@BYAPR11MB2567.namprd11.prod.outlook.com>
 <20230421174252.GO4085390@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20230421174252.GO4085390@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|MN2PR11MB4581:EE_
x-ms-office365-filtering-correlation-id: a33e32d1-813f-4c50-4149-08db43cd9654
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hfu9zK5O1V0UqaVBI9kLPU/R/RJbvXwvp65xX5Thp5yljBzSj1KW7OdTokVngPrzYqFOE0T2s+bhTGj0gOpCIN8VJvx2ssYfTqFWnmta0dIJBlSNuuBSeL5b9w+ay8W6B/WQsZMMYprsp6wJBRTvpWIORkcx7QLNm/qR7Js0f/udJ9NN5zM1FE56w58RjMzOYubRU9tmpBfUqK2Sshu5QpogYj/EappWXiF8i/WpxzBv0dQLDBjW8c+4YE3zuyzQ4pebPrLEt48Vzhap84uGMsCHI8pmoglToj6Vn6YLJsDUjeH5+ifG7tKbGayUllkT9zh4FjEGFZJ4bb9Tq5cr8LaR1vc+c/AcmUM3ErYgGAPU547atxOT+Ca2Z6JUr1+NWOf7M0I8LeCrcmRiRganj52QrPt/1IyjtSsr7z1Ew7eg448Mts1+Rc6vK4TaM759cD54cepCWwQgrAHR884HYDWc/NPEkRa5nGBvMAh4GW+lKLaTLD8yIB7u4ssRWSFqqHlHYEYzcVmrAMqcmPRl7J3QRN8wDr8l9dy6114V1IW4DSlpQ3vO9riUF7yFp0/Tyl06/tMEnq1415eBI3RTQGI9oRcM6AeBfcUSUHDzJQtmf0dVX+XGrziiLU5TRsP0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199021)(478600001)(54906003)(6636002)(86362001)(186003)(7696005)(26005)(9686003)(6506007)(55016003)(33656002)(71200400001)(4326008)(64756008)(66446008)(66476007)(66556008)(316002)(82960400001)(83380400001)(66946007)(76116006)(450100002)(2906002)(38100700002)(122000001)(41300700001)(8676002)(6862004)(8936002)(38070700005)(5660300002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wZf42I4pOddVoT518ozk7toKa9aLhROdyCP8YSsD+B116v+xFiAfzkHsNHq4?=
 =?us-ascii?Q?kHNFf0vWT1X+posVF4Pr2/E0UKvt0aSGzmBPJ1qzyv0CEKmFyakr6VFqkTS0?=
 =?us-ascii?Q?/O66to/mWephwyVzx0deiHuT6O0ntaNQjGysBwd9MFyoBY3CMfeVjmT9ZPxR?=
 =?us-ascii?Q?5yt4b/sSP5NPbJKSQsekQFtQ6O+zcvKTAVQwm6GSZwhr6W+XIPwbSur9Ob1j?=
 =?us-ascii?Q?/mvmKLAfD1huyCDpSYZSKAiLtwXJpuVtjioBfAinLIuGWM85guZjdN1bIF/g?=
 =?us-ascii?Q?N3IeqdDnXmDXuLOUBWdxpSKFVrJFUfWoudL/yHIxVH0qG/gsgVbPFhI3FNiE?=
 =?us-ascii?Q?BWO+tuOTEi7PvJwDPWZtS1SbpNZlMl5TH21a2E430UfO3OGzb3GHkKqxKYHI?=
 =?us-ascii?Q?7dW0Z4bcdMEwFAcQm/V2umoUxyvw0eaMgQa27PF/rlcoREiydQGMl0i2mBTh?=
 =?us-ascii?Q?lsJkPsjFIv8N6JpeodGMxw2fz7lJH4eOF7smtBdMTE2BcSInY/vbtJk2okmv?=
 =?us-ascii?Q?HvGRUwC/i3gXzujmBK0nC8nqEZD4JpLX9BnHcM0M5iiWv2SDuDU5SgwS1cqU?=
 =?us-ascii?Q?FTMn1S5Dz7S6L2DgZ8xMJfdyUbXwMKm/jZGl6lILUdqi+wJjQ/QNoviYlCbB?=
 =?us-ascii?Q?L6O8qw8Y1nO29NpkXyIRaYbbaQJPcK5HUk2u5r1cRtATCjus/l0UjK6Is6Dj?=
 =?us-ascii?Q?honWOkWeotfioYACr6Evl4AvfSAN+QWovIYXz0ShCJIHdU9dkqQhtKkp4Hmx?=
 =?us-ascii?Q?+Ry/2zgdUnqDg+V+oucKeSXWXIwh7sPOg7vp4mVmYaVJ1WxItphttEuU8hQ6?=
 =?us-ascii?Q?AQBiwp2cEbraa3eNoU1QUpxELhnzN+rIUsTM4eDZ6H71TbOb7Hn5umx+B7Z1?=
 =?us-ascii?Q?BKO4H3tlJ4EKu6suATAVLefZ5u1dt97GK3suAzuvya1hEvH+X57A7oZzvUt9?=
 =?us-ascii?Q?p0UcjRZZcUySrFkCqtHdvMzmIde+uNvmdYqbRvoM9cTkoyBE0jpBKPzHjTIw?=
 =?us-ascii?Q?/LIpRL+vcUdPmlsjn171AS1k5dQojF4jLARTlKNvEfmap2Z8K48CCmipEAKp?=
 =?us-ascii?Q?9f9MW4X9+lDZuExBwiGYvHVc39RLJuqZXxTkaoh++utwrDtkNVw3aaKuwsZh?=
 =?us-ascii?Q?AA0O6NsgshxjHXBUWXpiXVuUaObMXwE/PtIHoiWBftHJ8A6qazNHsNDbEow/?=
 =?us-ascii?Q?yjpJGMDU8csEIbMCI+EMSTUId/RidijYJsHgUOHYssszkZaK5aGDa3VIH069?=
 =?us-ascii?Q?X5aTpcYsusvY5o5HsmCAL+29eg9rFdggdfK7LL2KEdYJ2RuEf43AjuI91uC0?=
 =?us-ascii?Q?Z8dFNfOrye/9FhHPqfcszvHesmSNklFZ86HxD9SIGt5/Ye6KPJ6Tk/tQn3zk?=
 =?us-ascii?Q?jQ+SHQUBAXcUEgG8uYdtV4ZijUZkweccU0EjIQgip8bgUAD41riVGnscV0yB?=
 =?us-ascii?Q?J+F7txkptk7Lyv74iD6hZO5wK76LdfEBhd2a1UzoeNl/RbJCqtrtdY/TQj8e?=
 =?us-ascii?Q?/eI39IEIokcHWe1mQQp0uTd0hbuyULGDQvKVLSI+VD8pb4YlTI+6rjrb3SSS?=
 =?us-ascii?Q?0cheknQUAZkcBTQGYNs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a33e32d1-813f-4c50-4149-08db43cd9654
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2023 07:37:27.2274 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4iSmDR8Cb6+ReAClNDSOmgaUjD79kIdCx4kDUWET7Whi6qgpAO1rjbxKVhwGmXfyaR5N5USyEWf3FlryjiJFeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4581
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Hajda,
 Andrzej" <andrzej.hajda@intel.com>, "Das, Nirmoy" <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> On Fri, Apr 21, 2023 at 10:27:22AM -0700, Yang, Fei wrote:
>>> On Wed, Apr 19, 2023 at 04:00:53PM -0700, fei.yang@intel.com wrote:
>>>> From: Fei Yang <fei.yang@intel.com>
>>>>
>>>> PTE encode functions are platform dependent. This patch implements
>>>> PTE functions for MTL, and ensures the correct PTE encode function
>>>> is used by calling pte_encode function pointer instead of the
>>>> hardcoded gen8 version of PTE encode.
>>>>
>>>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>>>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>>>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>>>> Acked-by: Nirmoy Das <nirmoy.das@intel.com>
>>>
>>> Bspec: 45015, 45040
>>>
>>>> ---
>>>>  drivers/gpu/drm/i915/display/intel_dpt.c |  2 +-
>>>>  drivers/gpu/drm/i915/gt/gen8_ppgtt.c     | 45 ++++++++++++++++++++---=
-
>>>>  drivers/gpu/drm/i915/gt/intel_ggtt.c     | 36 +++++++++++++++++--
>>>>  3 files changed, 72 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c
>>b/drivers/gpu/drm/i915/display/intel_dpt.c
>>>> index b8027392144d..c5eacfdba1a5 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_dpt.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_dpt.c
>>>> @@ -300,7 +300,7 @@ intel_dpt_create(struct intel_framebuffer *fb)
>>>>        vm->vma_ops.bind_vma    =3D dpt_bind_vma;
>>>>        vm->vma_ops.unbind_vma  =3D dpt_unbind_vma;
>>>>
>>>> -     vm->pte_encode =3D gen8_ggtt_pte_encode;
>>>> +     vm->pte_encode =3D vm->gt->ggtt->vm.pte_encode;
>>>>
>>>>        dpt->obj =3D dpt_obj;
>>>>        dpt->obj->is_dpt =3D true;
>>>> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>>>>  b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>>>> index 4daaa6f55668..11b91e0453c8 100644
>>>> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>>>> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>>>> @@ -55,6 +55,34 @@ static u64 gen8_pte_encode(dma_addr_t addr,
>>>>        return pte;
>>>>  }
>>>>
>>>> +static u64 mtl_pte_encode(dma_addr_t addr,
>>>> +                       enum i915_cache_level level,
>>>> +                       u32 flags)
>>>> +{
>>>> +     gen8_pte_t pte =3D addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
>>>> +
>>>> +     if (unlikely(flags & PTE_READ_ONLY))
>>>> +             pte &=3D ~GEN8_PAGE_RW;
>>>> +
>>>> +     if (flags & PTE_LM)
>>>> +             pte |=3D GEN12_PPGTT_PTE_LM | GEN12_PPGTT_PTE_NC;
>>>
>>> GEN12_PPGTT_PTE_NC got defined in the previous patch as BIT(5).  But
>>> according to bspec 45040, bit 5 is ignored in the PTE encoding.  What i=
s
>>> this trying to do?
>>
>> This takes effect only for PTE_LM, doesn't affect MTL.
>> PTE_NC is needed for PVC (use of access counter).
>> I believe this function was writen based on the one for PVC. And this
>> function did get extended to cover all gen12 in a later patch.
>
> Even though MTL doesn't have local memory, PTE_LM is supposed to be
> used on MTL for access to BAR2 stolen memory.

You were right, but I still think this code is fine because this bit is
ignored for MTL anyway and it is needed for other platforms with LMEM.
Otherwise this code would have some sort of platform checking which is
hard to do because we don't have platform info here.
Or we would have to define another PTE encode function for platforms
needing PTE_NC just for this one difference, then manage the function
pointer correctly.

-Fei

> Matt
>
>> -Fei
>>> Matt
>>>
>>>> +
>>>> +     switch (level) {
>>>> +     case I915_CACHE_NONE:
>>>> +             pte |=3D GEN12_PPGTT_PTE_PAT1;
>>>> +             break;
