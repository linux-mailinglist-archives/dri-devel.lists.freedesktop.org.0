Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B936D9FB1
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 20:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112BE10ECA1;
	Thu,  6 Apr 2023 18:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7CF10ECAD;
 Thu,  6 Apr 2023 18:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680805341; x=1712341341;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=82TN2MzKbmPduRWBS+t7N7EZ2IWEvLKXklBay7ysEKw=;
 b=jFVQWYhUFvsrLlOvXH8Q6ZyC8tpv4uxUfnBmpnbD+8pzsuCsS1XVq+fe
 j8fsWMwQwxY6k11W59wmd6qqpvQx2H1avYnagy4phCypdswjg0FAe1Aec
 Br5j/ZgRGz4j/yjpTYZ6fYM0GDdYo+s9PQvCtNaeYOG0+Mpi3pSJhGfR8
 fu3h5Gqy+0LEFu+0mc4rhhjmyQl+EehmQYuNvLIVLIhEjIFJTGCZeDRAO
 /uVTu38OF/4nt/YQjc9ICSA5Ai53iopCRAnOc+rSodZGhNGy03XoL7Fm+
 NRRhamMTHCSUhr0O3D1TNqr1o7TI4kaNMfJd+ywqluTvnEbZuQruRg1zn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="341550343"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="341550343"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 11:22:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="719796095"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="719796095"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 06 Apr 2023 11:22:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 11:22:20 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 11:22:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 6 Apr 2023 11:22:19 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 6 Apr 2023 11:22:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYO9Ye74cZSLlbr7n2q++XB0FmMjn1F21bSOXdn4NL/d5v/r21fmnPxybZhNKo/IWbplsGw6mQ49XXNC/H8rOguIctQoWj4jUzcBGx2ogm2E7yk5JAiI9rWth5uPUkaCB/f4s1hJkknNuR+y52IQKQ5yKa/JAsv/s/Go7fWQ+jK7ivPyUO/MSOkWijyJj5wH1Egsv3AZjef1uhp7ijUboW9+N72dAHakpZOo0OtxCAB5R6p5Y2UQhx0O5eEKSz5sLVazqOjaVsdL8hexlWPU3g3g932I6P8WJT9kr8tH9w/qLim1q0uYNm4HeCuSu8779hzsJwrpqwY/HqwuUNbxhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+NlPvLMQz8bb+wfPfttM3vTgcUdxljZytR5MHXOl5Fw=;
 b=TsXggjX6+MJnNEPENS6cQ0VmaCkLvIXlV3KUcJ+NANapFqWIQrUp4Aax+4/4dun4Z00dZ6WGJS9bKrEI+kg3Ye8JfFawr50wt66+PkQP4M/F3uooEu7n1T736rSVL0Cp80mjEyw+sxljFRzd1S+i7f5Srp3GFRWXcNPwn0/1iQcgIK61tMKLe4Qn9Df54gM2V5VHUGQAuNXjhV5SSNDaw47e0qYHKJGJXqJY+BVbu3B5kXBh45A6FyyLc884/yzA7W+lWWe4WYRcr0YojbEXq7CPtU5yemyS32lgJ2LQr4joptFpxY+CFH4YshAXYudlBPJcztRysAUE2uUc9Q5nIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by SA0PR11MB4624.namprd11.prod.outlook.com (2603:10b6:806:98::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30; Thu, 6 Apr
 2023 18:22:17 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::12b1:c9af:ed85:e3ee]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::12b1:c9af:ed85:e3ee%6]) with mapi id 15.20.6277.031; Thu, 6 Apr 2023
 18:22:17 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>
Subject: RE: [Intel-gfx] [PATCH 1/7] drm/i915/mtl: Define MOCS and PAT tables
 for MTL
Thread-Topic: [Intel-gfx] [PATCH 1/7] drm/i915/mtl: Define MOCS and PAT tables
 for MTL
Thread-Index: AQHZZGRifs9AYN1Qf0aiFk10tgB/e68ZjPAAgARqfwCAAKdGgA==
Date: Thu, 6 Apr 2023 18:22:16 +0000
Message-ID: <BYAPR11MB25671D22DE5BF065A47784309A919@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230401063830.438127-1-fei.yang@intel.com>
 <20230401063830.438127-2-fei.yang@intel.com> <87o7o5165p.fsf@intel.com>
 <ZC5/5oT7fYV/s1I4@ashyti-mobl2.lan>
In-Reply-To: <ZC5/5oT7fYV/s1I4@ashyti-mobl2.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|SA0PR11MB4624:EE_
x-ms-office365-filtering-correlation-id: 795dba5f-4f70-4e59-5698-08db36cbda26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xTAsyKhJZIq3jXC6Y2CmT7QjyPDvuuYEyf3yg8vdm5hjyNwWwoZM733B5FfScKYaFk6lmat8BKwEAF89ouh4pZoBrS9rqpmobfLUKo8CInV3lPA3SQ1OkH6057GKpK1+wTqBl7Fcdmf0Z4KBt5s7wrwO3dydPKHD8jRe79JslU+TqzRX63a/54utMD/I5+fHhz+p2Hk/7lluUtPNjPB8H49pILsHGmF/s2T95h1dFkMpdTp/Jykx5/aHU+oVnj33CzimfuADHiXKE1Ybvs/UWGGYX1ze5TTHXWVHItQgHcrEnoOhwIHoeMpuTvbMWe0+i2E07IyFLBebtevd0Oxz0SK+DAm4GKupulK36AggZT2wlprsPAwyqEFdgtAvI25VgQZR9KNVZXy21y5rx8K9OFoXDlfFkp3q1Fivq8ArbtxdC5z1w2B0BsTahQnBf8KkehvrkIs9xXF4EtCgQBeBauE8IwuhDZJHBEd3GRRbDACM6zlnUJ5c+x6LULV6NN04ECOFHe9hvZEwue+sKTrn1Oi5siVyXJIkpZzUyhie7K1LZjwj6ktODji/J0k/emfW9Vr7XwlJ8C652mv3pNKNIqRsUWsQw0NuP0PGNJ+AueFp/1LnAZxLMUwqyH7pkYfz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(136003)(396003)(39860400002)(346002)(451199021)(71200400001)(110136005)(55016003)(2906002)(478600001)(83380400001)(38070700005)(7696005)(6506007)(54906003)(122000001)(5660300002)(41300700001)(30864003)(9686003)(8936002)(33656002)(26005)(86362001)(186003)(316002)(52536014)(82960400001)(4326008)(8676002)(64756008)(66446008)(66946007)(66556008)(66476007)(76116006)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NXdXoipmmYDzs4HBTO/XgNTxs7eF3RSeZJytwWrZLjZIRoZnVMVz68Q+T7c4?=
 =?us-ascii?Q?anxKVGU2krCttlCRzfvCxpFknOvnPq50Fr4/zCqkNNM9oePqXeODuaeCzf/W?=
 =?us-ascii?Q?aj/cr/nb3KQv+1SfFalfFWYcmdV/x7UTxEbhHutirHSdVVyDtlAjeCT4Fgyl?=
 =?us-ascii?Q?zyziPqMNibkak5tvGqFGu41SSxHYEiRMqBv0Pmg1fhH6/S7KNO6TTsiRDC0f?=
 =?us-ascii?Q?tmhd6VMA2wgAXMKY8iC2/PF+BtKH70KDG7DRByvyxPe/p+FWSCarruh1FAKc?=
 =?us-ascii?Q?6QdD5fMSborQNrqOaHwKKqv4jQGDoZ7km20gMTPICOaq+zgBu7TwIy0pOXkk?=
 =?us-ascii?Q?FpuQrktBfcoqAceAwE7BI8aiemvefsCemH2Sy+FQjAdhkniy8S/pQtyvIy1d?=
 =?us-ascii?Q?O/qqJVsSJR8eQ33QUud1n1jBuhxPMglaB1A9xozWBVafrLGXCO8VAMs6JmHJ?=
 =?us-ascii?Q?sNEBJxjXWOULavB/1/u6dQgbV8/XtfRrPdtsaqZjVwMaRpdvMbvhwj1bkde+?=
 =?us-ascii?Q?OdrZMpOirVZLOe/IoYB+BGHqf0YbrqgtO9oYy2KP6MzpL1v6gID119QU7WLj?=
 =?us-ascii?Q?1LQIujt4daZv3imwVBrClF8Db6DiBK/vMgo8KeJhlI7qq8Nn3LwjdzSwb4MA?=
 =?us-ascii?Q?KXJYnMI39nQ1/9JYSEhIvuHsBmV2+WnKtQDXYVlFt8x5bIX9WLSz24+/J8Fa?=
 =?us-ascii?Q?vU8tE68Ho7DSTrFsQAKjOlI2X24A4Nz4C9Laxq4TGw8ep5ULb5ji94g6Hfj4?=
 =?us-ascii?Q?kvFOfoT2X2+HDnPNa/tjN28FavheGufarFHaXG+8Gut47qCgEV7HhMIzNWWc?=
 =?us-ascii?Q?mlEb9o6sd0MeQEyokd4+jNc2MGLgj2JypCbVYi44lROCflsF/zk0Kw4JWroV?=
 =?us-ascii?Q?D7GNcI63uTPEt1+OnW5qu09p5MwrSf6ZzDPVH7llUZQ3xn5giZHUceUO4kZW?=
 =?us-ascii?Q?xf8/TQWxhmutspmadRL5J8NqCoFP07X8LKO4UmRCzwSw/+uUdDs+rm8X8N0K?=
 =?us-ascii?Q?qlxSY8FQxLZ+5Njulr/tZ6E7n1IxgWVbUFpN65K7IBxppCjDijXZOwgQXKA2?=
 =?us-ascii?Q?u/JmQzIjPcvmBqkQJQANRGo0I6HXzSBGIB7aHHa9Hmp4/RxcmKHtBGPKtOdl?=
 =?us-ascii?Q?cfultpC07F4h9mDeO1cHwkzoMecbtdmdbLv7zpVEtBpYVFkWC5RAaZstvhP2?=
 =?us-ascii?Q?V5gkjsxGdH/ChOKptnYVsAJitcBsS3w7alhQUWG/nGTR4iy3mvXNVUbjNbgo?=
 =?us-ascii?Q?DCGSHieDhevc+2brwO1GV1X2cUzTXiO4JFNGo40OwJ04fwCMkq73iN2ecBAF?=
 =?us-ascii?Q?ZS+Dgbhy7YBGrRlKiErYduZ5+wq+C7PKr9evUnocJmWtU97890A40kDdDMZ5?=
 =?us-ascii?Q?LPXVtqZAfXq6Zh9BhMM10hozjHJW0/MxeJO6miyOmTzlp2zNJhuvx3K4khz6?=
 =?us-ascii?Q?JPf7J2c8CiQ37NNVWvAfeiocdkxny7PXMUweLb2Tkeav1LgNe8Nnop7JVBmc?=
 =?us-ascii?Q?KEEWlHYKfdexM/7RklScM3Q8IWgFi9SyTquH+7zq3qqsj18rLYwGF9H46eAT?=
 =?us-ascii?Q?SBhwnQzY7xNYwxFIwH8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 795dba5f-4f70-4e59-5698-08db36cbda26
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2023 18:22:16.8748 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XvMQqgUZ5JKlm2oya/Og3yUBcK42UuDZ0fYffPgeiPfsv7R0X3TIY6zVcQ0om9EZLkAi1b47LgT8LE+o69EBYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4624
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>Subject: Re: [Intel-gfx] [PATCH 1/7] drm/i915/mtl: Define MOCS and PAT tab=
les for MTL
>
> Hi Fei,
>
> On Mon, Apr 03, 2023 at 03:50:26PM +0300, Jani Nikula wrote:
>> On Fri, 31 Mar 2023, fei.yang@intel.com wrote:
>>> From: Fei Yang <fei.yang@intel.com>
>>>
>>> On MTL, GT can no longer allocate on LLC - only the CPU can.
>>> This, along with addition of support for ADM/L4 cache calls a=20
>>> MOCS/PAT table update.
>>> Also add PTE encode functions for MTL as it has different PAT index=20
>>> definition than previous platforms.
>>=20
>> As a general observation, turning something into a function pointer=20
>> and extending it to more platforms should be two separate changes.
>
> Agree with Jani. Fei, would you mind splitting this patch? It eases the r=
eview, as well.

Yes, I'm working on this. Still need to address another comment from Ville.
Will send an update soon.

>Thanks,
>Andi
>
>> BR,
>> Jani.
>>=20
>>>
>>> BSpec: 44509, 45101, 44235
>>>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Signed-off-by: Madhumitha Tolakanahalli Pradeep=20
>>> <madhumitha.tolakanahalli.pradeep@intel.com>
>>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>>> ---
>>>  drivers/gpu/drm/i915/display/intel_dpt.c |  2 +-
>>>  drivers/gpu/drm/i915/gt/gen8_ppgtt.c     | 43 ++++++++++++--
>>>  drivers/gpu/drm/i915/gt/gen8_ppgtt.h     |  3 +
>>>  drivers/gpu/drm/i915/gt/intel_ggtt.c     | 36 ++++++++++-
>>>  drivers/gpu/drm/i915/gt/intel_gtt.c      | 23 ++++++-
>>>  drivers/gpu/drm/i915/gt/intel_gtt.h      | 20 ++++++-
>>>  drivers/gpu/drm/i915/gt/intel_mocs.c     | 76 ++++++++++++++++++++++--
>>>  drivers/gpu/drm/i915/gt/selftest_mocs.c  |  2 +-
>>>  drivers/gpu/drm/i915/i915_pci.c          |  1 +
>>>  9 files changed, 189 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c=20
>>> b/drivers/gpu/drm/i915/display/intel_dpt.c
>>> index b8027392144d..c5eacfdba1a5 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_dpt.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_dpt.c
>>> @@ -300,7 +300,7 @@ intel_dpt_create(struct intel_framebuffer *fb)
>>>  	vm->vma_ops.bind_vma    =3D dpt_bind_vma;
>>>  	vm->vma_ops.unbind_vma  =3D dpt_unbind_vma;
>>> =20
>>> -	vm->pte_encode =3D gen8_ggtt_pte_encode;
>>> +	vm->pte_encode =3D vm->gt->ggtt->vm.pte_encode;
>>> =20
>>>  	dpt->obj =3D dpt_obj;
>>>  	dpt->obj->is_dpt =3D true;
>>> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c=20
>>> b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>>> index 4daaa6f55668..4197b43150cc 100644
>>> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>>> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>>> @@ -55,6 +55,34 @@ static u64 gen8_pte_encode(dma_addr_t addr,
>>>  	return pte;
>>>  }
>>> =20
>>> +static u64 mtl_pte_encode(dma_addr_t addr,
>>> +			  enum i915_cache_level level,
>>> +			  u32 flags)
>>> +{
>>> +	gen8_pte_t pte =3D addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
>>> +
>>> +	if (unlikely(flags & PTE_READ_ONLY))
>>> +		pte &=3D ~GEN8_PAGE_RW;
>>> +
>>> +	if (flags & PTE_LM)
>>> +		pte |=3D GEN12_PPGTT_PTE_LM | GEN12_PPGTT_PTE_NC;
>>> +
>>> +	switch (level) {
>>> +	case I915_CACHE_NONE:
>>> +		pte |=3D GEN12_PPGTT_PTE_PAT1;
>>> +		break;
>>> +	case I915_CACHE_LLC:
>>> +	case I915_CACHE_L3_LLC:
>>> +		pte |=3D GEN12_PPGTT_PTE_PAT0 | GEN12_PPGTT_PTE_PAT1;
>>> +		break;
>>> +	case I915_CACHE_WT:
>>> +		pte |=3D GEN12_PPGTT_PTE_PAT0;
>>> +		break;
>>> +	}
>>> +
>>> +	return pte;
>>> +}
>>> +
>>>  static void gen8_ppgtt_notify_vgt(struct i915_ppgtt *ppgtt, bool=20
>>> create)  {
>>>  	struct drm_i915_private *i915 =3D ppgtt->vm.i915; @@ -427,7 +455,7=20
>>> @@ gen8_ppgtt_insert_pte(struct i915_ppgtt *ppgtt,
>>>  		      u32 flags)
>>>  {
>>>  	struct i915_page_directory *pd;
>>> -	const gen8_pte_t pte_encode =3D gen8_pte_encode(0, cache_level, flags=
);
>>> +	const gen8_pte_t pte_encode =3D ppgtt->vm.pte_encode(0, cache_level,=
=20
>>> +flags);
>>>  	gen8_pte_t *vaddr;
>>> =20
>>>  	pd =3D i915_pd_entry(pdp, gen8_pd_index(idx, 2)); @@ -580,7 +608,7=20
>>> @@ static void gen8_ppgtt_insert_huge(struct i915_address_space *vm,
>>>  				   enum i915_cache_level cache_level,
>>>  				   u32 flags)
>>>  {
>>> -	const gen8_pte_t pte_encode =3D gen8_pte_encode(0, cache_level, flags=
);
>>> +	const gen8_pte_t pte_encode =3D vm->pte_encode(0, cache_level,=20
>>> +flags);
>>>  	unsigned int rem =3D sg_dma_len(iter->sg);
>>>  	u64 start =3D vma_res->start;
>>> =20
>>> @@ -743,7 +771,7 @@ static void gen8_ppgtt_insert_entry(struct i915_add=
ress_space *vm,
>>>  	GEM_BUG_ON(pt->is_compact);
>>> =20
>>>  	vaddr =3D px_vaddr(pt);
>>> -	vaddr[gen8_pd_index(idx, 0)] =3D gen8_pte_encode(addr, level, flags);
>>> +	vaddr[gen8_pd_index(idx, 0)] =3D vm->pte_encode(addr, level, flags);
>>>  	drm_clflush_virt_range(&vaddr[gen8_pd_index(idx, 0)],=20
>>> sizeof(*vaddr));  }
>>> =20
>>> @@ -773,7 +801,7 @@ static void __xehpsdv_ppgtt_insert_entry_lm(struct =
i915_address_space *vm,
>>>  	}
>>> =20
>>>  	vaddr =3D px_vaddr(pt);
>>> -	vaddr[gen8_pd_index(idx, 0) / 16] =3D gen8_pte_encode(addr, level, fl=
ags);
>>> +	vaddr[gen8_pd_index(idx, 0) / 16] =3D vm->pte_encode(addr, level,=20
>>> +flags);
>>>  }
>>> =20
>>>  static void xehpsdv_ppgtt_insert_entry(struct i915_address_space=20
>>> *vm, @@ -820,7 +848,7 @@ static int gen8_init_scratch(struct i915_addre=
ss_space *vm)
>>>  		pte_flags |=3D PTE_LM;
>>> =20
>>>  	vm->scratch[0]->encode =3D
>>> -		gen8_pte_encode(px_dma(vm->scratch[0]),
>>> +		vm->pte_encode(px_dma(vm->scratch[0]),
>>>  				I915_CACHE_NONE, pte_flags);
>>> =20
>>>  	for (i =3D 1; i <=3D vm->top; i++) {
>>> @@ -963,7 +991,10 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_=
gt *gt,
>>>  	 */
>>>  	ppgtt->vm.alloc_scratch_dma =3D alloc_pt_dma;
>>> =20
>>> -	ppgtt->vm.pte_encode =3D gen8_pte_encode;
>>> +	if (GRAPHICS_VER_FULL(gt->i915) >=3D IP_VER(12, 70))
>>> +		ppgtt->vm.pte_encode =3D mtl_pte_encode;
>>> +	else
>>> +		ppgtt->vm.pte_encode =3D gen8_pte_encode;
>>> =20
>>>  	ppgtt->vm.bind_async_flags =3D I915_VMA_LOCAL_BIND;
>>>  	ppgtt->vm.insert_entries =3D gen8_ppgtt_insert; diff --git=20
>>> a/drivers/gpu/drm/i915/gt/gen8_ppgtt.h=20
>>> b/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
>>> index f541d19264b4..6b8ce7f4d25a 100644
>>> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
>>> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
>>> @@ -18,5 +18,8 @@ struct i915_ppgtt *gen8_ppgtt_create(struct=20
>>> intel_gt *gt,
>>>  u64 gen8_ggtt_pte_encode(dma_addr_t addr,
>>>  			 enum i915_cache_level level,
>>>  			 u32 flags);
>>> +u64 mtl_ggtt_pte_encode(dma_addr_t addr,
>>> +			unsigned int pat_index,
>>> +			u32 flags);
>>> =20
>>>  #endif
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c=20
>>> b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>> index 3c7f1ed92f5b..ba3109338aee 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>> @@ -220,6 +220,33 @@ static void guc_ggtt_invalidate(struct i915_ggtt *=
ggtt)
>>>  	}
>>>  }
>>> =20
>>> +u64 mtl_ggtt_pte_encode(dma_addr_t addr,
>>> +			enum i915_cache_level level,
>>> +			u32 flags)
>>> +{
>>> +	gen8_pte_t pte =3D addr | GEN8_PAGE_PRESENT;
>>> +
>>> +	GEM_BUG_ON(addr & ~GEN12_GGTT_PTE_ADDR_MASK);
>>> +
>>> +	if (flags & PTE_LM)
>>> +		pte |=3D GEN12_GGTT_PTE_LM;
>>> +
>>> +	switch (level) {
>>> +	case I915_CACHE_NONE:
>>> +		pte |=3D MTL_GGTT_PTE_PAT1;
>>> +		break;
>>> +	case I915_CACHE_LLC:
>>> +	case I915_CACHE_L3_LLC:
>>> +		pte |=3D MTL_GGTT_PTE_PAT0 | MTL_GGTT_PTE_PAT1;
>>> +		break;
>>> +	case I915_CACHE_WT:
>>> +		pte |=3D MTL_GGTT_PTE_PAT0;
>>> +		break;
>>> +	}
>>> +
>>> +	return pte;
>>> +}
>>> +
>>>  u64 gen8_ggtt_pte_encode(dma_addr_t addr,
>>>  			 enum i915_cache_level level,
>>>  			 u32 flags)
>>> @@ -247,7 +274,7 @@ static void gen8_ggtt_insert_page(struct i915_addre=
ss_space *vm,
>>>  	gen8_pte_t __iomem *pte =3D
>>>  		(gen8_pte_t __iomem *)ggtt->gsm + offset / I915_GTT_PAGE_SIZE;
>>> =20
>>> -	gen8_set_pte(pte, gen8_ggtt_pte_encode(addr, level, flags));
>>> +	gen8_set_pte(pte, ggtt->vm.pte_encode(addr, level, flags));
>>> =20
>>>  	ggtt->invalidate(ggtt);
>>>  }
>>> @@ -257,8 +284,8 @@ static void gen8_ggtt_insert_entries(struct i915_ad=
dress_space *vm,
>>>  				     enum i915_cache_level level,
>>>  				     u32 flags)
>>>  {
>>> -	const gen8_pte_t pte_encode =3D gen8_ggtt_pte_encode(0, level, flags)=
;
>>>  	struct i915_ggtt *ggtt =3D i915_vm_to_ggtt(vm);
>>> +	const gen8_pte_t pte_encode =3D ggtt->vm.pte_encode(0, level,=20
>>> +flags);
>>>  	gen8_pte_t __iomem *gte;
>>>  	gen8_pte_t __iomem *end;
>>>  	struct sgt_iter iter;
>>> @@ -981,7 +1008,10 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt=
)
>>>  	ggtt->vm.vma_ops.bind_vma    =3D intel_ggtt_bind_vma;
>>>  	ggtt->vm.vma_ops.unbind_vma  =3D intel_ggtt_unbind_vma;
>>> =20
>>> -	ggtt->vm.pte_encode =3D gen8_ggtt_pte_encode;
>>> +	if (GRAPHICS_VER_FULL(i915) >=3D IP_VER(12, 70))
>>> +		ggtt->vm.pte_encode =3D mtl_ggtt_pte_encode;
>>> +	else
>>> +		ggtt->vm.pte_encode =3D gen8_ggtt_pte_encode;
>>> =20
>>>  	return ggtt_probe_common(ggtt, size);  } diff --git=20
>>> a/drivers/gpu/drm/i915/gt/intel_gtt.c=20
>>> b/drivers/gpu/drm/i915/gt/intel_gtt.c
>>> index 4f436ba7a3c8..1e1b34e22cf5 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
>>> @@ -468,6 +468,25 @@ void gtt_write_workarounds(struct intel_gt *gt)
>>>  	}
>>>  }
>>> =20
>>> +static void mtl_setup_private_ppat(struct intel_uncore *uncore) {
>>> +	intel_uncore_write(uncore, GEN12_PAT_INDEX(0),
>>> +			   MTL_PPAT_L4_0_WB);
>>> +	intel_uncore_write(uncore, GEN12_PAT_INDEX(1),
>>> +			   MTL_PPAT_L4_1_WT);
>>> +	intel_uncore_write(uncore, GEN12_PAT_INDEX(2),
>>> +			   MTL_PPAT_L4_3_UC);
>>> +	intel_uncore_write(uncore, GEN12_PAT_INDEX(3),
>>> +			   MTL_PPAT_L4_0_WB | MTL_2_COH_1W);
>>> +	intel_uncore_write(uncore, GEN12_PAT_INDEX(4),
>>> +			   MTL_PPAT_L4_0_WB | MTL_3_COH_2W);
>>> +
>>> +	/*
>>> +	 * Remaining PAT entries are left at the hardware-default
>>> +	 * fully-cached setting
>>> +	 */
>>> +}
>>> +
>>>  static void tgl_setup_private_ppat(struct intel_uncore *uncore)  {
>>>  	/* TGL doesn't support LLC or AGE settings */ @@ -603,7 +622,9 @@=20
>>> void setup_private_pat(struct intel_gt *gt)
>>> =20
>>>  	GEM_BUG_ON(GRAPHICS_VER(i915) < 8);
>>> =20
>>> -	if (GRAPHICS_VER_FULL(i915) >=3D IP_VER(12, 50))
>>> +	if (IS_METEORLAKE(i915))
>>> +		mtl_setup_private_ppat(uncore);
>>> +	else if (GRAPHICS_VER_FULL(i915) >=3D IP_VER(12, 50))
>>>  		xehp_setup_private_ppat(gt);
>>>  	else if (GRAPHICS_VER(i915) >=3D 12)
>>>  		tgl_setup_private_ppat(uncore);
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h=20
>>> b/drivers/gpu/drm/i915/gt/intel_gtt.h
>>> index 69ce55f517f5..b632167eaf2e 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
>>> @@ -88,9 +88,18 @@ typedef u64 gen8_pte_t;
>>>  #define BYT_PTE_SNOOPED_BY_CPU_CACHES	REG_BIT(2)
>>>  #define BYT_PTE_WRITEABLE		REG_BIT(1)
>>> =20
>>> +#define GEN12_PPGTT_PTE_PAT3    BIT_ULL(62)
>>>  #define GEN12_PPGTT_PTE_LM	BIT_ULL(11)
>>> +#define GEN12_PPGTT_PTE_PAT2    BIT_ULL(7)
>>> +#define GEN12_PPGTT_PTE_NC      BIT_ULL(5)
>>> +#define GEN12_PPGTT_PTE_PAT1    BIT_ULL(4)
>>> +#define GEN12_PPGTT_PTE_PAT0    BIT_ULL(3)
>>> =20
>>> -#define GEN12_GGTT_PTE_LM	BIT_ULL(1)
>>> +#define GEN12_GGTT_PTE_LM		BIT_ULL(1)
>>> +#define MTL_GGTT_PTE_PAT0		BIT_ULL(52)
>>> +#define MTL_GGTT_PTE_PAT1		BIT_ULL(53)
>>> +#define GEN12_GGTT_PTE_ADDR_MASK	GENMASK_ULL(45, 12)
>>> +#define MTL_GGTT_PTE_PAT_MASK		GENMASK_ULL(53, 52)
>>> =20
>>>  #define GEN12_PDE_64K BIT(6)
>>>  #define GEN12_PTE_PS64 BIT(8)
>>> @@ -147,6 +156,15 @@ typedef u64 gen8_pte_t;  #define=20
>>> GEN8_PDE_IPS_64K BIT(11)
>>>  #define GEN8_PDE_PS_2M   BIT(7)
>>> =20
>>> +#define MTL_PPAT_L4_CACHE_POLICY_MASK	REG_GENMASK(3, 2)
>>> +#define MTL_PAT_INDEX_COH_MODE_MASK	REG_GENMASK(1, 0)
>>> +#define MTL_PPAT_L4_3_UC	REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK,=
 3)
>>> +#define MTL_PPAT_L4_1_WT	REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK,=
 1)
>>> +#define MTL_PPAT_L4_0_WB	REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK,=
 0)
>>> +#define MTL_3_COH_2W	REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 3)
>>> +#define MTL_2_COH_1W	REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 2)
>>> +#define MTL_0_COH_NON	REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 0)
>>> +
>>>  enum i915_cache_level;
>>> =20
>>>  struct drm_i915_gem_object;
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c=20
>>> b/drivers/gpu/drm/i915/gt/intel_mocs.c
>>> index 69b489e8dfed..89570f137b2c 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_mocs.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
>>> @@ -40,6 +40,10 @@ struct drm_i915_mocs_table {
>>>  #define LE_COS(value)		((value) << 15)
>>>  #define LE_SSE(value)		((value) << 17)
>>> =20
>>> +/* Defines for the tables (GLOB_MOCS_0 - GLOB_MOCS_16) */
>>> +#define _L4_CACHEABILITY(value)	((value) << 2)
>>> +#define IG_PAT(value)		((value) << 8)
>>> +
>>>  /* Defines for the tables (LNCFMOCS0 - LNCFMOCS31) - two entries per w=
ord */
>>>  #define L3_ESC(value)		((value) << 0)
>>>  #define L3_SCC(value)		((value) << 1)
>>> @@ -50,6 +54,7 @@ struct drm_i915_mocs_table {
>>>  /* Helper defines */
>>>  #define GEN9_NUM_MOCS_ENTRIES	64  /* 63-64 are reserved, but configure=
d. */
>>>  #define PVC_NUM_MOCS_ENTRIES	3
>>> +#define MTL_NUM_MOCS_ENTRIES	16
>>> =20
>>>  /* (e)LLC caching options */
>>>  /*
>>> @@ -73,6 +78,12 @@ struct drm_i915_mocs_table {
>>>  #define L3_2_RESERVED		_L3_CACHEABILITY(2)
>>>  #define L3_3_WB			_L3_CACHEABILITY(3)
>>> =20
>>> +/* L4 caching options */
>>> +#define L4_0_WB			_L4_CACHEABILITY(0)
>>> +#define L4_1_WT			_L4_CACHEABILITY(1)
>>> +#define L4_2_RESERVED		_L4_CACHEABILITY(2)
>>> +#define L4_3_UC			_L4_CACHEABILITY(3)
>>> +
>>>  #define MOCS_ENTRY(__idx, __control_value, __l3cc_value) \
>>>  	[__idx] =3D { \
>>>  		.control_value =3D __control_value, \ @@ -416,6 +427,57 @@ static=20
>>> const struct drm_i915_mocs_entry pvc_mocs_table[] =3D {
>>>  	MOCS_ENTRY(2, 0, L3_3_WB),
>>>  };
>>> =20
>>> +static const struct drm_i915_mocs_entry mtl_mocs_table[] =3D {
>>> +	/* Error - Reserved for Non-Use */
>>> +	MOCS_ENTRY(0,
>>> +		   IG_PAT(0),
>>> +		   L3_LKUP(1) | L3_3_WB),
>>> +	/* Cached - L3 + L4 */
>>> +	MOCS_ENTRY(1,
>>> +		   IG_PAT(1),
>>> +		   L3_LKUP(1) | L3_3_WB),
>>> +	/* L4 - GO:L3 */
>>> +	MOCS_ENTRY(2,
>>> +		   IG_PAT(1),
>>> +		   L3_LKUP(1) | L3_1_UC),
>>> +	/* Uncached - GO:L3 */
>>> +	MOCS_ENTRY(3,
>>> +		   IG_PAT(1) | L4_3_UC,
>>> +		   L3_LKUP(1) | L3_1_UC),
>>> +	/* L4 - GO:Mem */
>>> +	MOCS_ENTRY(4,
>>> +		   IG_PAT(1),
>>> +		   L3_LKUP(1) | L3_GLBGO(1) | L3_1_UC),
>>> +	/* Uncached - GO:Mem */
>>> +	MOCS_ENTRY(5,
>>> +		   IG_PAT(1) | L4_3_UC,
>>> +		   L3_LKUP(1) | L3_GLBGO(1) | L3_1_UC),
>>> +	/* L4 - L3:NoLKUP; GO:L3 */
>>> +	MOCS_ENTRY(6,
>>> +		   IG_PAT(1),
>>> +		   L3_1_UC),
>>> +	/* Uncached - L3:NoLKUP; GO:L3 */
>>> +	MOCS_ENTRY(7,
>>> +		   IG_PAT(1) | L4_3_UC,
>>> +		   L3_1_UC),
>>> +	/* L4 - L3:NoLKUP; GO:Mem */
>>> +	MOCS_ENTRY(8,
>>> +		   IG_PAT(1),
>>> +		   L3_GLBGO(1) | L3_1_UC),
>>> +	/* Uncached - L3:NoLKUP; GO:Mem */
>>> +	MOCS_ENTRY(9,
>>> +		   IG_PAT(1) | L4_3_UC,
>>> +		   L3_GLBGO(1) | L3_1_UC),
>>> +	/* Display - L3; L4:WT */
>>> +	MOCS_ENTRY(14,
>>> +		   IG_PAT(1) | L4_1_WT,
>>> +		   L3_LKUP(1) | L3_3_WB),
>>> +	/* CCS - Non-Displayable */
>>> +	MOCS_ENTRY(15,
>>> +		   IG_PAT(1),
>>> +		   L3_GLBGO(1) | L3_1_UC),
>>> +};
>>> +
>>>  enum {
>>>  	HAS_GLOBAL_MOCS =3D BIT(0),
>>>  	HAS_ENGINE_MOCS =3D BIT(1),
>>> @@ -445,7 +507,13 @@ static unsigned int get_mocs_settings(const struct=
 drm_i915_private *i915,
>>>  	memset(table, 0, sizeof(struct drm_i915_mocs_table));
>>> =20
>>>  	table->unused_entries_index =3D I915_MOCS_PTE;
>>> -	if (IS_PONTEVECCHIO(i915)) {
>>> +	if (IS_METEORLAKE(i915)) {
>>> +		table->size =3D ARRAY_SIZE(mtl_mocs_table);
>>> +		table->table =3D mtl_mocs_table;
>>> +		table->n_entries =3D MTL_NUM_MOCS_ENTRIES;
>>> +		table->uc_index =3D 9;
>>> +		table->unused_entries_index =3D 1;
>>> +	} else if (IS_PONTEVECCHIO(i915)) {
>>>  		table->size =3D ARRAY_SIZE(pvc_mocs_table);
>>>  		table->table =3D pvc_mocs_table;
>>>  		table->n_entries =3D PVC_NUM_MOCS_ENTRIES; @@ -646,9 +714,9 @@ void=
=20
>>> intel_mocs_init_engine(struct intel_engine_cs *engine)
>>>  		init_l3cc_table(engine->gt, &table);  }
>>> =20
>>> -static u32 global_mocs_offset(void)
>>> +static u32 global_mocs_offset(struct intel_gt *gt)
>>>  {
>>> -	return i915_mmio_reg_offset(GEN12_GLOBAL_MOCS(0));
>>> +	return i915_mmio_reg_offset(GEN12_GLOBAL_MOCS(0)) +=20
>>> +gt->uncore->gsi_offset;
>>>  }
>>> =20
>>>  void intel_set_mocs_index(struct intel_gt *gt) @@ -671,7 +739,7 @@=20
>>> void intel_mocs_init(struct intel_gt *gt)
>>>  	 */
>>>  	flags =3D get_mocs_settings(gt->i915, &table);
>>>  	if (flags & HAS_GLOBAL_MOCS)
>>> -		__init_mocs_table(gt->uncore, &table, global_mocs_offset());
>>> +		__init_mocs_table(gt->uncore, &table, global_mocs_offset(gt));
>>> =20
>>>  	/*
>>>  	 * Initialize the L3CC table as part of mocs initalization to make=20
>>> diff --git a/drivers/gpu/drm/i915/gt/selftest_mocs.c=20
>>> b/drivers/gpu/drm/i915/gt/selftest_mocs.c
>>> index ca009a6a13bd..730796346514 100644
>>> --- a/drivers/gpu/drm/i915/gt/selftest_mocs.c
>>> +++ b/drivers/gpu/drm/i915/gt/selftest_mocs.c
>>> @@ -137,7 +137,7 @@ static int read_mocs_table(struct i915_request *rq,
>>>  		return 0;
>>> =20
>>>  	if (HAS_GLOBAL_MOCS_REGISTERS(rq->engine->i915))
>>> -		addr =3D global_mocs_offset();
>>> +		addr =3D global_mocs_offset(rq->engine->gt);
>>>  	else
>>>  		addr =3D mocs_offset(rq->engine);
>>> =20
>>> diff --git a/drivers/gpu/drm/i915/i915_pci.c=20
>>> b/drivers/gpu/drm/i915/i915_pci.c index 621730b6551c..480b128499ae=20
>>> 100644
>>> --- a/drivers/gpu/drm/i915/i915_pci.c
>>> +++ b/drivers/gpu/drm/i915/i915_pci.c
>>> @@ -1149,6 +1149,7 @@ static const struct intel_device_info mtl_info =
=3D {
>>>  	.has_flat_ccs =3D 0,
>>>  	.has_gmd_id =3D 1,
>>>  	.has_guc_deprivilege =3D 1,
>>> +	.has_llc =3D 0,
>>>  	.has_mslice_steering =3D 0,
>>>  	.has_snoop =3D 1,
>>>  	.__runtime.memory_regions =3D REGION_SMEM | REGION_STOLEN_LMEM,
>>=20
>> --
>> Jani Nikula, Intel Open Source Graphics Center

