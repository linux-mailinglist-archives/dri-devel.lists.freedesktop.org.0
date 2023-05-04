Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F356F6F9B
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 18:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5839F10E170;
	Thu,  4 May 2023 16:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4F310E170;
 Thu,  4 May 2023 16:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683216651; x=1714752651;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=so6epgLgG0NA6TYiWK8rBKKnJhp0B3AAvNQmyYHsp0U=;
 b=c8gOT1fd2JDG0uhU5sn4K4vIl52ylnIA+2oX3t6quQK7HA0KJpMsexIZ
 xyO+R1/G38qaJ3mYxhH1sc3vtWty1+gqRhixxC3YwXYtY+Zhcm37ehWni
 NRiz8txepebBoS39MEgY+KlEgfZNWUBtC+Lv3d1wXbJYlxIx3OaeS/Pwg
 lkkG7xF00WwSiBveaOLiqSakWMvE+UVC4s3Hgp8M2Bt/g/Jp5zwJxEIYE
 gttkz6LgZFrsTSG/uSB4xXnPjWsnZj0INAYeufOd7pTmzosX2ZVTM32oi
 Q2AlbeCozc+XuLnxjjQKBpgaStO4YTw7mIvKkYMBoOyBxe6nHqsBA0Lqe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="351095021"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
 d="scan'208,217";a="351095021"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 09:06:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="729871327"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
 d="scan'208,217";a="729871327"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 04 May 2023 09:06:49 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 09:06:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 09:06:49 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 09:06:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BFIuGfSGEhKoUId9dXvXzniANt3lLoW9es+B/afinn9lGI56qUZVjCcW4x5eYh3Vl3UV6RRTc+w6xK652U+TlZqdiEH1RMnahLpZU3b0dLZO3FAaZ3187aLXmjSbDGVgTb6TJw6spA8SYxa8iWrhe1h7ceGxJ2/L8yMisYa9WvLcdcaUfCwVo0a+4CiRhzn0DOG+UKeW2qQVbUD7s6+MCMpLuG8BevcHqCy3Os4lp+4kDR5xrug0SUudz9o2AUScpsXybIB1tElEi55urdtnATqbiBNbBXeTOpsXqieiyfYiqzVzxW5Cb7uV/LXBBZfIWowpq9bJ6eCX3CtsB4q5hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h//lnqoziKm+Tene6NDRkhyIR6llT3BfM8FgBicQPOE=;
 b=SnVVKTCwqNjyU3fdnsD1xK4TKYtLrf8zKdY/jxUAnkvi5KzpbZsaPR7qf0cS0GcuG5hi3duHcFuzpcY4o3B1kXEfvjrTwLZ24BRxOAicuKZZO+ssfWBrNHBKi/e1CDQqx1yE8vcuIfobGosCsp48Ec0gw1ART1ecSiBJbDinKxLOsDk6+pv3/uo9M0wKeQYo5iVE44D1d56jHZoWLI/9RW5RzIms5P0oly+X9AWO/vYNnWk6qCP4wxi6hTCQX+wdF98Csg7mqPimq+8ySOLvnuukTVJVAL0+802E8xAJKKOqdN2LW3nejM2s3nZ3xsCXVy3jicP8LBsih9cM3Nbbog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by SJ2PR11MB7426.namprd11.prod.outlook.com (2603:10b6:a03:4c2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 16:06:46 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::37e2:bdec:585b:383c]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::37e2:bdec:585b:383c%3]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 16:06:46 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/5] drm/i915: use pat_index instead of cache_level
Thread-Topic: [PATCH v5 2/5] drm/i915: use pat_index instead of cache_level
Thread-Index: AQHZfhMsbjkUvOFLzk+GbHmgDCsyS69KEhgAgAAtgJM=
Date: Thu, 4 May 2023 16:06:46 +0000
Message-ID: <BYAPR11MB2567660DE774E0C2B400D0479A6D9@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230503230211.2834340-1-fei.yang@intel.com>
 <20230503230211.2834340-3-fei.yang@intel.com>
 <4c464bd6-9edc-3098-5c24-6d6da2a75c39@linux.intel.com>
In-Reply-To: <4c464bd6-9edc-3098-5c24-6d6da2a75c39@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|SJ2PR11MB7426:EE_
x-ms-office365-filtering-correlation-id: 214742a5-2af8-444f-463f-08db4cb98fd1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JTgt58wX7oRlI9UhfRArJjinkXMU4f/v0gnHvJhdPUqk8QK2dm0OBbJZ/3DZ/ZBMzkpHXUGbJ+GUh1p2Hpcr6AQbJtz9FaiUrJ9/uKDsMHVZTmrtPOsTBR8UwRBK9Vg1XbQFQWf5cBbV0YNoEfZWq0KRQ98GgZuKtnRbwXMnHzU7hBbxxPlCjmRBe5a9i4NvyuaS8vaJrjUaSCAZ4wn9VbgI+XIKuztSJPr2Q479x68KQi4woF+ChRH+XOCh+mL+9aN3nuVqFIxz1sxoAYvEE0ywVe4gvBqdaExHdO/sIIdrZzqjd5bK640XzH0G6dHF0L3VG7RA7SqThrPNEeykvn3h04dg03EvSHXEquF89m9B9Yzv9n2zTH3A+VZ5ciWTcWRLr2a+COFIpQWaIlaQK22iPkKGOi/qqCB6pGFBDCO4QkBk6uEFZdc84km5oMpyalsp01QIPvy1z8Lnvhu0vci5A2C1Uv+6gmEWHIsd71g84fUWlBk66sjhdQMMxLYPlDko+Sr+6dLtxlRJRpiQ85RhYIW6eFCOpldXRTfNG6NrqArcLxwKzPiB9qr4jJ/NQ30h3NXMZYPhIKPgK30C5Tyoiencolde9mcKzs8kqy6G07qBmzJTy+9q+vPx53Xw
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199021)(55016003)(71200400001)(38100700002)(110136005)(86362001)(478600001)(54906003)(38070700005)(186003)(9686003)(6506007)(26005)(53546011)(122000001)(33656002)(7696005)(82960400001)(5660300002)(52536014)(8676002)(8936002)(41300700001)(19627405001)(66446008)(64756008)(2906002)(316002)(76116006)(66476007)(66556008)(4326008)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Y+qcae5pxFb3YV/nXCu7tJ3GS0ryn3UfkwRo326c8sX4XHPiy1248y5qEO?=
 =?iso-8859-1?Q?kVWYgmuNCnse8moWJzaDnx/pvWU+T9PQYh7d+ibwZ5jjiAZZXeqljc05aR?=
 =?iso-8859-1?Q?NB0TbunwN9BH1G5ch1nP8WHKbAfK4S5ukwTVbZ0vHNRPsLX0OJrUTcqPdz?=
 =?iso-8859-1?Q?hbFuaONP8ypCKn5SFtWdP4SdlIDp6s8149BMwjETfbolyRy/7GWH5fWXDs?=
 =?iso-8859-1?Q?RC5Y6c9QeZCst/DyCub66iOc6eKqU6uhGVR6UeR4AIY8F0OtuzHzmyNDwY?=
 =?iso-8859-1?Q?czGqFrYCxVOObKB5pSBrN/NbcfIHCPLm1hOF7Xhr/Q7e8GctJhnGH/xgeZ?=
 =?iso-8859-1?Q?yEVbKelcODdduJVtqvboZzR0A1nKP+MZY72MxFJiP8JpUm0nlDeZe+g6HZ?=
 =?iso-8859-1?Q?rGCeBwhcNJiTVLBxFI5/rsLUNn7ULvVXyh9pJSEWs1gLADgeI5DXBgh246?=
 =?iso-8859-1?Q?Pi2TYw1GP9wR2Ql8/a1ZI/BoQs0fPACQrFyz3Nk9qwPNz31KQrb3k9MoDI?=
 =?iso-8859-1?Q?toV8pEywGIh/9Xyn985c/VEPovTF933Kn5oN8RDNSNoRWhD8ixo7wmGUhR?=
 =?iso-8859-1?Q?pbKCFprmI8oh4v95aii/qHWKhUGmZnMMZ59t6vo9qPtPxLw00H6tWVNYIH?=
 =?iso-8859-1?Q?iA63kRP/cXLe3Pe3FeNzGkXjOIv7ONJx6BpnMqemORxM2QZjgfR68CkQ6m?=
 =?iso-8859-1?Q?HQ7c4C66wi7xwxLv8dlX0jmYrkUZXNgVpEmQxeQUVdr2lnR8xtxQyrqePF?=
 =?iso-8859-1?Q?XlpiQFOpCWsTOIdXcMj9Sy1ZEpSBRqeNfiUkVoilTfigcG2uVmzz2ahpek?=
 =?iso-8859-1?Q?g6kDDameSOuMfEMmR70re7BJyK/FYEkUOVrJhQIDFSkrln/eZ0ESraaDBc?=
 =?iso-8859-1?Q?xzYrqVvibsQSgl2hYOLi7zzTep/t+OF4LEOOD+QplORpNN4aMcoi5Bk2SJ?=
 =?iso-8859-1?Q?G54mlu+FIdwcqA7tw4kL9vZzHC4F0bqnE8vLPIocMZatVtxvV+kxn4IZJK?=
 =?iso-8859-1?Q?R5bmIQzGCnoecTmmxRnSWGER+Wyor7LwZmzwsIvGjzUpkKIgKEaCsTQVlB?=
 =?iso-8859-1?Q?RfhySsTph7M8qXsFcHwQDNBtMKgV+6iP6wu6h+GLHwpV4ocwLeCFyAelBO?=
 =?iso-8859-1?Q?uIpNa5Ou0Ud48YDOgpf3/0Xgzr7UOymPo6CkNRCZx5cfvol998uOLEt8BE?=
 =?iso-8859-1?Q?/S+duLZ6eNmcNBjAb2QsXbqvIsZ8fVIGYbVtuYxAJ2lUNm7z5ghhPPt8Nd?=
 =?iso-8859-1?Q?3cPhD0lMfTBEL1HjQhdwg7Y/WX3q0SFp5zOoY5y9zXcSb+DEwt8LtBDfJR?=
 =?iso-8859-1?Q?de6Fp0pLEc29vewKyC8O1yTOs6J2NUhRDTx04yaB4U/RzKSPc3UVrmlU4C?=
 =?iso-8859-1?Q?QpyxJEBohmyX+xGK+tsIXVbxeVN3NMn624az9dlqh5shNzK5VsLfk6BXN3?=
 =?iso-8859-1?Q?rg16y4s1PbmjqQEKkxje6/s2T+pQmsOG+LCTf5l2bh4irzgFXSruJ1FPLq?=
 =?iso-8859-1?Q?zotKjlY1vVNWw2lCWvUrQrPlrUd7qJojcKXFO59jucnxC4i57HJEgxlUBt?=
 =?iso-8859-1?Q?ud4yNmgoakBDlb+9/kQ+uboHCjnm5FgUVI0yGfPuBdvOzJRDFHJowZcajR?=
 =?iso-8859-1?Q?WavPts7rEyNHk=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB2567660DE774E0C2B400D0479A6D9BYAPR11MB2567namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 214742a5-2af8-444f-463f-08db4cb98fd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 16:06:46.8245 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sCTxQs5KTRTJ7BWOSQ8yucnay8akJJNcGFv79je34lRB7CrvGeRtCWnrgcumNe5ecJ6bl6owzxpF6V5+NGNaow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7426
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR11MB2567660DE774E0C2B400D0479A6D9BYAPR11MB2567namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> On 04/05/2023 00:02, fei.yang@intel.com wrote:
>> From: Fei Yang <fei.yang@intel.com>
>>
>> Currently the KMD is using enum i915_cache_level to set caching policy f=
or
>> buffer objects. This is flaky because the PAT index which really control=
s
>> the caching behavior in PTE has far more levels than what's defined in t=
he
>> enum. In addition, the PAT index is platform dependent, having to transl=
ate
>> between i915_cache_level and PAT index is not reliable, and makes the co=
de
>> more complicated.
>>
>>>From UMD's perspective there is also a necessity to set caching policy f=
or
>> performance fine tuning. It's much easier for the UMD to directly use PA=
T
>> index because the behavior of each PAT index is clearly defined in Bspec=
.
>> Having the abstracted i915_cache_level sitting in between would only cau=
se
>> more ambiguity.
>>
>> For these reasons this patch replaces i915_cache_level with PAT index. A=
lso
>> note, the cache_level is not completely removed yet, because the KMD sti=
ll
>> has the need of creating buffer objects with simple cache settings such =
as
>> cached, uncached, or writethrough. For such simple cases, using cache_le=
vel
>> would help simplify the code.
>>
>> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>
> [snip]
>
>> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915=
/gt/gen8_ppgtt.c
>> index bb6998d67133..f2334a713c4e 100644
>> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>> @@ -56,7 +56,7 @@ static u64 gen8_pte_encode(dma_addr_t addr,
>>   }
>
>^^^
>
> How come there are no changes to gen8_pte_encode?

For legacy platforms cache_level is equal to pat_index, so I was thinking
more about reducing number of lines changed.

>vvv
>
>>
>>   static u64 mtl_pte_encode(dma_addr_t addr,
>> -                       enum i915_cache_level level,
>> +                       unsigned int pat_index,
>>                          u32 flags)
>
> Prototype and implementation changed here for mtl_pte_encode.
>
> And we have:
>
>        if (GRAPHICS_VER_FULL(gt->i915) >=3D IP_VER(12, 70))
>                ppgtt->vm.pte_encode =3D mtl_pte_encode;
>        else
>                ppgtt->vm.pte_encode =3D gen8_pte_encode;
>
> So should be same prototype. And:
>
>         u64 (*pte_encode)(dma_addr_t addr,
>-                         enum i915_cache_level level,
>+                         unsigned int pat_index,
>                           u32 flags); /* Create a valid PTE */
>
> Patch relies on the compiler considering enum equal to unsigned int?

yes, caller is passing in unsigned int and gets used as enum.

> But the implementation of gen8_pte_encode and most ggtt counterparts is
> looking at the passed in pat index and thinks it is cache level.
>
> How is that supposed to work?! Or I am blind and am missing something?

For legacy platforms translation through LEGACY_CACHELEVEL would not
change the value of cache_level. The cache_level and pat_index are basicall=
y
the same for these platforms.

It is broken for gen12 here. I was asked to separate the gen12_pte_encode
change to another patch in the series, but that breaks bisect. Should I
squash 2/5 and 3/5?

> Regards,
>
> Tvrtko


--_000_BYAPR11MB2567660DE774E0C2B400D0479A6D9BYAPR11MB2567namp_
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
&gt; On 04/05/2023 00:02, fei.yang@intel.com wrote:
<div class=3D"ContentPasted0">&gt;&gt; From: Fei Yang &lt;fei.yang@intel.co=
m&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Currently the KMD is using enum i915=
_cache_level to set caching policy for</div>
<div class=3D"ContentPasted0">&gt;&gt; buffer objects. This is flaky becaus=
e the PAT index which really controls</div>
<div class=3D"ContentPasted0">&gt;&gt; the caching behavior in PTE has far =
more levels than what's defined in the</div>
<div class=3D"ContentPasted0">&gt;&gt; enum. In addition, the PAT index is =
platform dependent, having to translate</div>
<div class=3D"ContentPasted0">&gt;&gt; between i915_cache_level and PAT ind=
ex is not reliable, and makes the code</div>
<div class=3D"ContentPasted0">&gt;&gt; more complicated.</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;From UMD's perspective there is a=
lso a necessity to set caching policy for</div>
<div class=3D"ContentPasted0">&gt;&gt; performance fine tuning. It's much e=
asier for the UMD to directly use PAT</div>
<div class=3D"ContentPasted0">&gt;&gt; index because the behavior of each P=
AT index is clearly defined in Bspec.</div>
<div class=3D"ContentPasted0">&gt;&gt; Having the abstracted i915_cache_lev=
el sitting in between would only cause</div>
<div class=3D"ContentPasted0">&gt;&gt; more ambiguity.</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; For these reasons this patch replace=
s i915_cache_level with PAT index. Also</div>
<div class=3D"ContentPasted0">&gt;&gt; note, the cache_level is not complet=
ely removed yet, because the KMD still</div>
<div class=3D"ContentPasted0">&gt;&gt; has the need of creating buffer obje=
cts with simple cache settings such as</div>
<div class=3D"ContentPasted0">&gt;&gt; cached, uncached, or writethrough. F=
or such simple cases, using cache_level</div>
<div class=3D"ContentPasted0">&gt;&gt; would help simplify the code.</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Cc: Chris Wilson &lt;chris.p.wilson@=
linux.intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Cc: Matt Roper &lt;matthew.d.roper@i=
ntel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Signed-off-by: Fei Yang &lt;fei.yang=
@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Reviewed-by: Andi Shyti &lt;andi.shy=
ti@linux.intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; [snip]</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/gt=
/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index bb6998d67133..f2334a713c4e 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gt/gen8_p=
pgtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gt/gen8_p=
pgtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -56,7 +56,7 @@ static u64 gen8_pt=
e_encode(dma_addr_t addr,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt;^^^</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; How come there are no changes to gen8_pt=
e_encode?</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">For legacy platforms cache_level is equal to =
pat_index, so I was thinking</div>
more about reducing number of lines changed.
<div><br class=3D"ContentPasted1">
</div>
<div class=3D"ContentPasted1">&gt;vvv</div>
<div class=3D"ContentPasted1">&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; static u64 mtl_pte_encode(dma=
_addr_t addr,</div>
<div class=3D"ContentPasted1">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enum i915_cache_level level,</di=
v>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; unsigned int pat_index,</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u32 flags)</div>
<div class=3D"ContentPasted1">&gt;</div>
<div class=3D"ContentPasted1">&gt; Prototype and implementation changed her=
e for mtl_pte_encode.</div>
<div class=3D"ContentPasted1">&gt;</div>
<div class=3D"ContentPasted1">&gt; And we have:</div>
<div class=3D"ContentPasted1">&gt;</div>
<div class=3D"ContentPasted1">&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (GRAPHICS_=
VER_FULL(gt-&gt;i915) &gt;=3D IP_VER(12, 70))</div>
<div class=3D"ContentPasted1">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;ppgtt-&gt;vm.pte_encode =3D mtl_pte_encode;</div>
<div class=3D"ContentPasted1">&gt; &nbsp; &nbsp; &nbsp; &nbsp;else</div>
<div class=3D"ContentPasted1">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;ppgtt-&gt;vm.pte_encode =3D gen8_pte_encode;</div>
<div class=3D"ContentPasted1">&gt;</div>
<div class=3D"ContentPasted1">&gt; So should be same prototype. And:</div>
<div class=3D"ContentPasted1">&gt;</div>
<div class=3D"ContentPasted1">&gt; &nbsp; &nbsp; &nbsp; &nbsp; u64 (*pte_en=
code)(dma_addr_t addr,</div>
<div class=3D"ContentPasted1">&gt;- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enum i915_cache_level level,</=
div>
<div class=3D"ContentPasted1">&gt;+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; unsigned int pat_index,</div>
<div class=3D"ContentPasted1">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u32 flags); /* Create a =
valid PTE */</div>
<div class=3D"ContentPasted1">&gt;</div>
<div class=3D"ContentPasted1">&gt; Patch relies on the compiler considering=
 enum equal to unsigned int?</div>
<div><br class=3D"ContentPasted1">
</div>
<div class=3D"ContentPasted1">yes, caller is passing in unsigned int and ge=
ts used as enum.</div>
<div><br class=3D"ContentPasted1">
</div>
<div class=3D"ContentPasted1">&gt; But the implementation of gen8_pte_encod=
e and most ggtt counterparts is</div>
<div class=3D"ContentPasted1">&gt; looking at the passed in pat index and t=
hinks it is cache level.</div>
<div class=3D"ContentPasted1">&gt;</div>
<div class=3D"ContentPasted1">&gt; How is that supposed to work?! Or I am b=
lind and am missing something?</div>
<div><br class=3D"ContentPasted1">
</div>
<div class=3D"ContentPasted1">For legacy platforms translation through LEGA=
CY_CACHELEVEL would not</div>
<div class=3D"ContentPasted1">change the value of cache_level. The cache_le=
vel and pat_index are basically</div>
<div class=3D"ContentPasted1">the same for these platforms.</div>
<div><br class=3D"ContentPasted1">
</div>
<div class=3D"ContentPasted1">It is broken for gen12 here. I was asked to s=
eparate the gen12_pte_encode</div>
<div class=3D"ContentPasted1">change to another patch in the series, but th=
at breaks bisect. Should I</div>
squash 2/5 and 3/5?
<div><br class=3D"ContentPasted2">
</div>
<div class=3D"ContentPasted2">&gt; Regards,</div>
<div class=3D"ContentPasted2">&gt;</div>
<div class=3D"ContentPasted2">&gt; Tvrtko</div>
<br>
</div>
</body>
</html>

--_000_BYAPR11MB2567660DE774E0C2B400D0479A6D9BYAPR11MB2567namp_--
