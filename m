Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2C0721C24
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 04:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FEFA10E124;
	Mon,  5 Jun 2023 02:52:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38FF10E11A;
 Mon,  5 Jun 2023 02:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685933540; x=1717469540;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=6YB3y32/DEUYSYVc3+kIQlU69TnzqpXiT1yul17H1tU=;
 b=cVjh/gYol+tOkGe3KjQmCJNu3lhtm7JwSW2VaDgggqopw+6a6K9jAsx9
 4bTIGhoSmrrQKWQbsrGshun3auv7YwUciWzeeQ0MqshH7xmXNh+aI3Lr1
 fbSv7pOBFbq6PmLFaiWB4veEjciQ09mwMHqyiw53oP0u7aUz1VEGiZkZl
 ozE8v6i+wQdIIf+hgMvt8CpnEIy0KWZEbcSIB8gXMCtGVdbqcYdPXPmnb
 MK5wEnBV2H+g03Khl+SG7Nmt0Ijltanv0SNfs+aeILNIW0TXY/hAJy3jp
 20aW4Xgbm/tcr2pY0XtJcXZmJJp6UQ3/lAhPUTOVSySCyo0SvQ8rUurGi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="340901056"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
 d="scan'208,217";a="340901056"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2023 19:52:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="685969321"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
 d="scan'208,217";a="685969321"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 04 Jun 2023 19:52:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 4 Jun 2023 19:52:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 4 Jun 2023 19:52:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 4 Jun 2023 19:52:17 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 4 Jun 2023 19:52:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BueykA/mEHZPDFxMcBSCK9GblSF7Q3MYmD+6+3NedTGU6tfEf50bztPUPL2wteRIWJKt60+umI9NBnIjiHRXXqEmP6WYtQ25c86z12tL5a0YeZW2JBg2c+6apKyBFegvtaqzIDswFL9oiTP53PoJGw56u/rQMQoSXQPq6+GpBZrCq+zw7hyGqALYpy+sa7vS/JW8sk2EulAITJJRxcS2ve6qPdsl4dWPnARBGI02N903p3Q81Ormzjj8jKt260SsHngGL65t9Y2F7InaPXRIjM0uIpO4QA3VaoiDPGOH3Qr5cnHeExpxYkprgCIRlzoYAIhkL/0ousz3BHtpPRljiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X28+EGXIKKIuoSkz8mJ3CCplW/oMnyz5SS+qzCzmYVI=;
 b=knbVvJ6gULlxly4cTtZvx8wzOwtVAXxMBHMci8O89ev7OENfzpaUTkW7TjkhIL5hWjFzj4SPKjQnjGG0y0MCx+oVyfKwlbMMGvL+ojWBWcEOLKyLGtaunwBUy2NTfOsPAEK+/2VFgMwZByAozgaeAdb5G2FEMcFPoqsCAlPwcNvFWELQTCYJ6yUXDm4stKBZKtLRi+CflYGc5+OGAagPiEhk0q82r4gSXJBje3mtc+2jegBPjaouXPJwLVimAu/Iu3YWiOTsTsWSe1v6WYaV4FITm0r8c++LyDVjn0T8HG5UJ33GCE+xcc8WJXVjKvzpHDqWounG3CAoT8qvnnP2iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by IA0PR11MB7750.namprd11.prod.outlook.com (2603:10b6:208:442::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 02:52:12 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::bdc8:7e7b:d8b6:6e8]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::bdc8:7e7b:d8b6:6e8%6]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 02:52:12 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v15 1/1] drm/i915: Allow user to set cache at BO creation
Thread-Topic: [PATCH v15 1/1] drm/i915: Allow user to set cache at BO creation
Thread-Index: AQHZk+KyvMyvSoG8/0WPz+256ysQ0a97AYYAgACHC+U=
Date: Mon, 5 Jun 2023 02:52:12 +0000
Message-ID: <BYAPR11MB25677DB39F436526F473F1A99A4DA@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230531171008.1738759-1-fei.yang@intel.com>
 <20230531171008.1738759-2-fei.yang@intel.com>
 <ZHzbpMce0yJYzIGY@ashyti-mobl2.lan>
In-Reply-To: <ZHzbpMce0yJYzIGY@ashyti-mobl2.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|IA0PR11MB7750:EE_
x-ms-office365-filtering-correlation-id: d57f351b-a2cd-4f33-37b2-08db656fdce9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3cyXlbb3zy4HM7onDA2A7aAyExuZNkR4hllcuHe20m6LTgbvc5u7V9ZQJa4e2DFUFV//vSbz+Q4Kw+WlDXph2isAyMaztfjRoB9NsHymWYYo31myxPMbPTGF2e7JPue9L8nM2FmdWGVN/5Ooec0Je2KYDoP2uYat429C/gJr25psTk3y3cUjQCKG8YUsPpCHuJASRMdWpk9PUs7Nmq0w2U51FF8Mgu9ydyQiQjbl+ZEKwovTcxUL+FuPdWDY03jcYCCMod3D10bF0o6ioPzfzZ+oXc4pwEld7cPh+WTq31DTZ8svXSOYumvvslwYIRXDjkIc05OsTwW6GyFz+4M6pp7nr1OZ5mGKmH+H00X2NjyJAFQYPgvQxjP0RGbOvF/lQl+YDp3zrgpu1IW8TolxqJlNODwMU2sTfoEILQueKQuzQRdlTKRWXAD06t3OPgXOJ6nCoZj9fwojt1hcxiyXm38sIcwYX4IC/cJcl6/ZRHu4R/Y5X8rhQ9FgbNPTlx7EOHnCwtsKk7tBqPHDEZ7ln3wJUi/eWKgGUYKxeTW3SrKMW64SRkH+9UfRXMZgAVezRRgBsaj+BzsZFjeIpNRobOoBC0F/EC8dIqd7Ax7E+28=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199021)(41300700001)(19627405001)(316002)(54906003)(122000001)(82960400001)(52536014)(5660300002)(2906002)(4326008)(64756008)(66446008)(66946007)(66556008)(66476007)(6916009)(76116006)(8676002)(8936002)(478600001)(71200400001)(38070700005)(7696005)(966005)(86362001)(186003)(38100700002)(55016003)(9686003)(33656002)(26005)(6506007)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?VsDQ/KTVWDNj/CHW9X7VL6wtnpB4lqcuNZGJypeZBqNxksnYGiTGNP5MII?=
 =?iso-8859-1?Q?RG308sFOfeaJKFx8K2jGk/zcgEiXfY3PJS1QGU3PkIPx9j+gHROnx3bunV?=
 =?iso-8859-1?Q?HrlB4iOJce2FYENeQoxD/Xg153QeSvxGIiJHXrVBaNsV5gXjk/jgzOC0S6?=
 =?iso-8859-1?Q?kDfFiSTlNKhUl+2V0YCwlVzZWZbmqTk6WnP6WKnQvffgYNsZFk1qewf5Fj?=
 =?iso-8859-1?Q?4MqVVNB46wOzcPyhKff/8Cem0qNIjmEx2u2vJshQOYx+zkJovnuXJb+ksl?=
 =?iso-8859-1?Q?VmDtA8mXeQ8xbp4BYPBobq54718OSavkd/87ltSAACoQv6PkIjDXz2v1W9?=
 =?iso-8859-1?Q?vkTSeJWOGIs7GzuwQgS3ZkaVhw4KMoswFtXYIhvg4QP2fziSxVtImsKuBa?=
 =?iso-8859-1?Q?0Kh1aY91pxIUZ8gDb80fbHAPWHYwA1W+OIuPhQA/AEaqpNwDFC0C+GhS74?=
 =?iso-8859-1?Q?CVP90yfv3XEKzlrUZOWRTQeIZ4REIUmibsOW6JVHSOl/yzlATuPzUUp1sw?=
 =?iso-8859-1?Q?BLbIVLDivKkNpWeIkS//ydfFj6rvdX6jyx83rpUUW0gEOy/crni2Btl/iv?=
 =?iso-8859-1?Q?qgChYo8JL+L91Tc/5o6LINgLF9+CjTGCSmNmPngkFWDmRStZerHUxY3bR9?=
 =?iso-8859-1?Q?JNYENRuYxTzjm+XCwiOetdOUgQU2W0Ls1BVLeFr6VWEeyERV4kkQxlArkZ?=
 =?iso-8859-1?Q?+mUTq3FQCxULfUQmw7St/sezwff4UKOUZvEIwY6gb7JfVxfB1uPpFfJeLl?=
 =?iso-8859-1?Q?6asH5tJQBPoYOWrj2ImYDuFlGlDmXG5Be5GDmpME4pBUnwNkRT5zumR9r9?=
 =?iso-8859-1?Q?xy6+QPLiI65n8FCV3PKYctKIZAcNry1ku4IdlIIIu1KXWHoPejZIbAuwOn?=
 =?iso-8859-1?Q?sQYAdRLvoZqyjo43j7w2n649Z+dgDvNbEjjBHI8m/Rw5OEERkmG2WZdADX?=
 =?iso-8859-1?Q?fjx1LOhAAC+RRkePhRt2CMZqN3HCxTn5F6Jdj+FF/x4FejfOhcX0yzcGK/?=
 =?iso-8859-1?Q?kcq7sT5hx4O+pRYpYbKbclu45p1qESbzxqEHSvFeywsU+tuw4QOEyJqknr?=
 =?iso-8859-1?Q?Qx7DFWKMOrbzbWsZKuf2Lrmk64ql4heLGD/TPZTDJb+o+yDDh5GgR8Jo+c?=
 =?iso-8859-1?Q?LgTdxD2/wo6kaZ2ETiHxlu/WRU/J1/EXmDNxZa49b5G99F3zS+tm7THFJ+?=
 =?iso-8859-1?Q?XKsFWLwc4oWhpOQBMmjW9ucRz1T1fHvRW2R9wMq9pxbuoGnrap8awTvqG2?=
 =?iso-8859-1?Q?CWHJ4qobdRbLQW19vdEO9LKJw6H4dH4t0olo8QKxQCO0s3FbFG3m71qXBa?=
 =?iso-8859-1?Q?ZryaruZk7lWGc6ZaU0F6ABY1OjmKv2PTySjuPcUGcfAQYGP5rEgXD0sUou?=
 =?iso-8859-1?Q?DrI6ESEjVYr57c0dOOlW81bOMaqrO/tmY1NpDdn2maHLXrkvhNP2VBWp+4?=
 =?iso-8859-1?Q?P9f1HA8R4FfWyGGcY/Q2/cAZGFQ3bmy6F9lrorz81rhrViH+cNJFz8pCEA?=
 =?iso-8859-1?Q?vEC5oQSv/8qlZJxxv9tMde6Kyxj79hpn9/1mmPitLrAr9xiIJEz9hOXD96?=
 =?iso-8859-1?Q?DmaKHfF/crHSFzaS48DhnVMFXLfnNaTMnLz/zWB340zhBu6tUKaacY4PgI?=
 =?iso-8859-1?Q?K0EeOy2uadBsI=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB25677DB39F436526F473F1A99A4DABYAPR11MB2567namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d57f351b-a2cd-4f33-37b2-08db656fdce9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2023 02:52:12.4515 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JYJcjXyXm171SgjxQrTjAfNszs9LKoB/4LS0Xelsk1hlquhXKdmXfdKRffs//AMwNAidL+KT2KdLBmADi1sudw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7750
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Gu,
 Lihao" <lihao.gu@intel.com>, Chris Wilson <chris.p.wilson@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Zhang,
 Carl" <carl.zhang@intel.com>, "Justen, Jordan L" <jordan.l.justen@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR11MB25677DB39F436526F473F1A99A4DABYAPR11MB2567namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> Hi Fei,
>
> On Wed, May 31, 2023 at 10:10:08AM -0700, fei.yang@intel.com wrote:
>> From: Fei Yang <fei.yang@intel.com>
>>
>> To comply with the design that buffer objects shall have immutable
>> cache setting through out their life cycle, {set, get}_caching ioctl's
>> are no longer supported from MTL onward. With that change caching
>> policy can only be set at object creation time. The current code
>> applies a default (platform dependent) cache setting for all objects.
>> However this is not optimal for performance tuning. The patch extends
>> the existing gem_create uAPI to let user set PAT index for the object
>> at creation time.
>> The new extension is platform independent, so UMD's can switch to using
>> this extension for older platforms as well, while {set, get}_caching are
>> still supported on these legacy paltforms for compatibility reason.
>>
>> Note: The detailed description of PAT index is missing in current PRM
>> even for older hardware and will be added by the next PRM update under
>> chapter name "Memory Views".
>
> Documentation has been updated:
>
> https://www.intel.com/content/www/us/en/docs/graphics-for-linux/developer=
-reference/1-0/tiger-lake.html
>
> If it's OK with you, before pushing I can replace this Note with:
>
>"
>The documentation related to the PAT/MOCS tables is currently
>available for Tiger Lake here:
>
>https://www.intel.com/content/www/us/en/docs/graphics-for-linux/developer-=
reference/1-0/tiger-lake.html
>"

Looks good to me. Thank you Andi and Tvrtko for all your help.

-Fei

>Thank you Tvrtko for the intution you had about the documentation
>and for pushing for the update. It is greate to have this uAPI
>well documented!
>
>Andi
>
>> BSpec: 45101
>>
>> Mesa support has been submitted in this merge request:
>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22878
>>
>> The media driver is supported by the following commits:
>> https://github.com/intel/media-driver/commit/92c00a857433ebb34ec575e9834=
f473c6fcb6341
>> https://github.com/intel/media-driver/commit/fd375cf2c5e1f6bf6b43258ff79=
7b3134aadc9fd
>> https://github.com/intel/media-driver/commit/08dd244b22484770a33464c2c8a=
e85430e548000
>>
>> The IGT test related to this change is
>> igt@gem_create@create-ext-set-pat
>>
>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>> Acked-by: Jordan Justen <jordan.l.justen@intel.com>
>> Tested-by: Jordan Justen <jordan.l.justen@intel.com>
>> Acked-by: Carl Zhang <carl.zhang@intel.com>
>> Tested-by: Lihao Gu <lihao.gu@intel.com>
>> ---
>>  drivers/gpu/drm/i915/gem/i915_gem_create.c | 36 +++++++++++++++++++
>>  drivers/gpu/drm/i915/gem/i915_gem_object.c |  6 ++++
>>  include/uapi/drm/i915_drm.h                | 41 ++++++++++++++++++++++
>>  3 files changed, 83 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_create.c
>> index bfe1dbda4cb7..644a936248ad 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>> @@ -245,6 +245,7 @@ struct create_ext {
>>        unsigned int n_placements;
>>        unsigned int placement_mask;
>>        unsigned long flags;
>> +     unsigned int pat_index;
>>  };
>>
>>  static void repr_placements(char *buf, size_t size,
>> @@ -394,11 +395,39 @@ static int ext_set_protected(struct i915_user_exte=
nsion __user *base, void *data
>>        return 0;
>>  }
>>
>> +static int ext_set_pat(struct i915_user_extension __user *base, void *d=
ata)
>> +{
>> +     struct create_ext *ext_data =3D data;
>> +     struct drm_i915_private *i915 =3D ext_data->i915;
>> +     struct drm_i915_gem_create_ext_set_pat ext;
>> +     unsigned int max_pat_index;
>> +
>> +     BUILD_BUG_ON(sizeof(struct drm_i915_gem_create_ext_set_pat) !=3D
>> +                  offsetofend(struct drm_i915_gem_create_ext_set_pat, r=
svd));
>> +
>> +     if (copy_from_user(&ext, base, sizeof(ext)))
>> +             return -EFAULT;
>> +
>> +     max_pat_index =3D INTEL_INFO(i915)->max_pat_index;
>> +
>> +     if (ext.pat_index > max_pat_index) {
>> +             drm_dbg(&i915->drm, "PAT index is invalid: %u\n",
>> +                     ext.pat_index);
>> +             return -EINVAL;
>> +     }
>> +
>> +     ext_data->pat_index =3D ext.pat_index;
>> +
>> +     return 0;
>> +}
>> +
>>  static const i915_user_extension_fn create_extensions[] =3D {
>>        [I915_GEM_CREATE_EXT_MEMORY_REGIONS] =3D ext_set_placements,
>>        [I915_GEM_CREATE_EXT_PROTECTED_CONTENT] =3D ext_set_protected,
>> +     [I915_GEM_CREATE_EXT_SET_PAT] =3D ext_set_pat,
>>  };
>>
>> +#define PAT_INDEX_NOT_SET    0xffff
>>  /**
>>   * i915_gem_create_ext_ioctl - Creates a new mm object and returns a ha=
ndle to it.
>>   * @dev: drm device pointer
>> @@ -418,6 +447,7 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, vo=
id *data,
>>        if (args->flags & ~I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS)
>>                return -EINVAL;
>>
>> +     ext_data.pat_index =3D PAT_INDEX_NOT_SET;
>>        ret =3D i915_user_extensions(u64_to_user_ptr(args->extensions),
>>                                   create_extensions,
>>                                   ARRAY_SIZE(create_extensions),
>> @@ -454,5 +484,11 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, v=
oid *data,
>>        if (IS_ERR(obj))
>>                return PTR_ERR(obj);
>>
>> +     if (ext_data.pat_index !=3D PAT_INDEX_NOT_SET) {
>> +             i915_gem_object_set_pat_index(obj, ext_data.pat_index);
>> +             /* Mark pat_index is set by UMD */
>> +             obj->pat_set_by_user =3D true;
>> +     }
>> +
>>        return i915_gem_publish(obj, file, &args->size, &args->handle);
>>  }
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_object.c
>> index 46a19b099ec8..97ac6fb37958 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> @@ -208,6 +208,12 @@ bool i915_gem_object_can_bypass_llc(struct drm_i915=
_gem_object *obj)
>>        if (!(obj->flags & I915_BO_ALLOC_USER))
>>                return false;
>>
>> +     /*
>> +      * Always flush cache for UMD objects at creation time.
>> +      */
>> +     if (obj->pat_set_by_user)
>> +             return true;
>> +
>>        /*
>>         * EHL and JSL add the 'Bypass LLC' MOCS entry, which should make=
 it
>>         * possible for userspace to bypass the GTT caching bits set by t=
he
>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>> index f31dfacde601..4083a23e0614 100644
>> --- a/include/uapi/drm/i915_drm.h
>> +++ b/include/uapi/drm/i915_drm.h
>> @@ -3679,9 +3679,13 @@ struct drm_i915_gem_create_ext {
>>         *
>>         * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
>>         * struct drm_i915_gem_create_ext_protected_content.
>> +      *
>> +      * For I915_GEM_CREATE_EXT_SET_PAT usage see
>> +      * struct drm_i915_gem_create_ext_set_pat.
>>         */
>>  #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
>>  #define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
>> +#define I915_GEM_CREATE_EXT_SET_PAT 2
>>        __u64 extensions;
>>  };
>>
>> @@ -3796,6 +3800,43 @@ struct drm_i915_gem_create_ext_protected_content =
{
>>        __u32 flags;
>>  };
>>
>> +/**
>> + * struct drm_i915_gem_create_ext_set_pat - The
>> + * I915_GEM_CREATE_EXT_SET_PAT extension.
>> + *
>> + * If this extension is provided, the specified caching policy (PAT ind=
ex) is
>> + * applied to the buffer object.
>> + *
>> + * Below is an example on how to create an object with specific caching=
 policy:
>> + *
>> + * .. code-block:: C
>> + *
>> + *      struct drm_i915_gem_create_ext_set_pat set_pat_ext =3D {
>> + *              .base =3D { .name =3D I915_GEM_CREATE_EXT_SET_PAT },
>> + *              .pat_index =3D 0,
>> + *      };
>> + *      struct drm_i915_gem_create_ext create_ext =3D {
>> + *              .size =3D PAGE_SIZE,
>> + *              .extensions =3D (uintptr_t)&set_pat_ext,
>> + *      };
>> + *
>> + *      int err =3D ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ex=
t);
>> + *      if (err) ...
>> + */
>> +struct drm_i915_gem_create_ext_set_pat {
>> +     /** @base: Extension link. See struct i915_user_extension. */
>> +     struct i915_user_extension base;
>> +     /**
>> +      * @pat_index: PAT index to be set
>> +      * PAT index is a bit field in Page Table Entry to control caching
>> +      * behaviors for GPU accesses. The definition of PAT index is
>> +      * platform dependent and can be found in hardware specifications,
>> +      */
>> +     __u32 pat_index;
>> +     /** @rsvd: reserved for future use */
>> +     __u32 rsvd;
>> +};
>> +
>>  /* ID of the protected content session managed by i915 when PXP is acti=
ve */
>>  #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
>>
>> --
>> 2.25.1

--_000_BYAPR11MB25677DB39F436526F473F1A99A4DABYAPR11MB2567namp_
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
tPasted1 ContentPasted2 ContentPasted3 ContentPasted4 ContentPasted5">
&gt; Hi Fei,
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; On Wed, May 31, 2023 at 10:10:08AM -0700=
, fei.yang@intel.com wrote:</div>
<div class=3D"ContentPasted0">&gt;&gt; From: Fei Yang &lt;fei.yang@intel.co=
m&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; To comply with the design that buffe=
r objects shall have immutable</div>
<div class=3D"ContentPasted0">&gt;&gt; cache setting through out their life=
 cycle, {set, get}_caching ioctl's</div>
<div class=3D"ContentPasted0">&gt;&gt; are no longer supported from MTL onw=
ard. With that change caching</div>
<div class=3D"ContentPasted0">&gt;&gt; policy can only be set at object cre=
ation time. The current code</div>
<div class=3D"ContentPasted0">&gt;&gt; applies a default (platform dependen=
t) cache setting for all objects.</div>
<div class=3D"ContentPasted0">&gt;&gt; However this is not optimal for perf=
ormance tuning. The patch extends</div>
<div class=3D"ContentPasted0">&gt;&gt; the existing gem_create uAPI to let =
user set PAT index for the object</div>
<div class=3D"ContentPasted0">&gt;&gt; at creation time.</div>
<div class=3D"ContentPasted0">&gt;&gt; The new extension is platform indepe=
ndent, so UMD's can switch to using</div>
<div class=3D"ContentPasted0">&gt;&gt; this extension for older platforms a=
s well, while {set, get}_caching are</div>
<div class=3D"ContentPasted0">&gt;&gt; still supported on these legacy palt=
forms for compatibility reason.</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Note: The detailed description of PA=
T index is missing in current PRM</div>
<div class=3D"ContentPasted0">&gt;&gt; even for older hardware and will be =
added by the next PRM update under</div>
<div class=3D"ContentPasted0">&gt;&gt; chapter name &quot;Memory Views&quot=
;.</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Documentation has been updated:</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; https://www.intel.com/content/www/us/en/=
docs/graphics-for-linux/developer-reference/1-0/tiger-lake.html</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; If it's OK with you, before pushing I ca=
n replace this Note with:</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt;&quot;</div>
<div class=3D"ContentPasted0">&gt;The documentation related to the PAT/MOCS=
 tables is currently</div>
<div class=3D"ContentPasted0">&gt;available for Tiger Lake here:</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt;https://www.intel.com/content/www/us/en/d=
ocs/graphics-for-linux/developer-reference/1-0/tiger-lake.html</div>
<div class=3D"ContentPasted0">&gt;&quot;</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Looks good to me. Thank you Andi and Tvrtko f=
or all your help.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">-Fei</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt;Thank you Tvrtko for the intution you had=
 about the documentation</div>
<div class=3D"ContentPasted0">&gt;and for pushing for the update. It is gre=
ate to have this uAPI</div>
<div class=3D"ContentPasted0">&gt;well documented!</div>
&gt;
<div class=3D"ContentPasted1">&gt;Andi</div>
<div class=3D"ContentPasted1">&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; BSpec: 45101</div>
<div class=3D"ContentPasted1">&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; Mesa support has been submitted in t=
his merge request:</div>
<div class=3D"ContentPasted1">&gt;&gt; https://gitlab.freedesktop.org/mesa/=
mesa/-/merge_requests/22878</div>
<div class=3D"ContentPasted1">&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; The media driver is supported by the=
 following commits:</div>
<div class=3D"ContentPasted1">&gt;&gt; https://github.com/intel/media-drive=
r/commit/92c00a857433ebb34ec575e9834f473c6fcb6341</div>
<div class=3D"ContentPasted1">&gt;&gt; https://github.com/intel/media-drive=
r/commit/fd375cf2c5e1f6bf6b43258ff797b3134aadc9fd</div>
<div class=3D"ContentPasted1">&gt;&gt; https://github.com/intel/media-drive=
r/commit/08dd244b22484770a33464c2c8ae85430e548000</div>
<div class=3D"ContentPasted1">&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; The IGT test related to this change =
is</div>
<div class=3D"ContentPasted1">&gt;&gt; igt@gem_create@create-ext-set-pat</d=
iv>
<div class=3D"ContentPasted1">&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; Signed-off-by: Fei Yang &lt;fei.yang=
@intel.com&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; Cc: Chris Wilson &lt;chris.p.wilson@=
linux.intel.com&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; Cc: Matt Roper &lt;matthew.d.roper@i=
ntel.com&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; Cc: Andi Shyti &lt;andi.shyti@linux.=
intel.com&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; Reviewed-by: Andi Shyti &lt;andi.shy=
ti@linux.intel.com&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; Acked-by: Jordan Justen &lt;jordan.l=
.justen@intel.com&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; Tested-by: Jordan Justen &lt;jordan.=
l.justen@intel.com&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; Acked-by: Carl Zhang &lt;carl.zhang@=
intel.com&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; Tested-by: Lihao Gu &lt;lihao.gu@int=
el.com&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; ---</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp;drivers/gpu/drm/i915/gem/i915_=
gem_create.c | 36 +++++++++++++++++++</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp;drivers/gpu/drm/i915/gem/i915_=
gem_object.c | &nbsp;6 ++++</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp;include/uapi/drm/i915_drm.h &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 41 +++++++++++++++++=
+++++</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp;3 files changed, 83 insertions=
(+)</div>
<div class=3D"ContentPasted1">&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; diff --git a/drivers/gpu/drm/i915/ge=
m/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c</div>
<div class=3D"ContentPasted1">&gt;&gt; index bfe1dbda4cb7..644a936248ad 100=
644</div>
<div class=3D"ContentPasted1">&gt;&gt; --- a/drivers/gpu/drm/i915/gem/i915_=
gem_create.c</div>
<div class=3D"ContentPasted1">&gt;&gt; +++ b/drivers/gpu/drm/i915/gem/i915_=
gem_create.c</div>
<div class=3D"ContentPasted1">&gt;&gt; @@ -245,6 +245,7 @@ struct create_ex=
t {</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;unsigned =
int n_placements;</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;unsigned =
int placement_mask;</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;unsigned =
long flags;</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp; unsigned int pat_ind=
ex;</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp;};</div>
&gt;&gt;
<div class=3D"ContentPasted2">&gt;&gt; &nbsp;static void repr_placements(ch=
ar *buf, size_t size,</div>
<div class=3D"ContentPasted2">&gt;&gt; @@ -394,11 +395,39 @@ static int ext=
_set_protected(struct i915_user_extension __user *base, void *data</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;return 0;=
</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp;}</div>
<div class=3D"ContentPasted2">&gt;&gt;</div>
<div class=3D"ContentPasted2">&gt;&gt; +static int ext_set_pat(struct i915_=
user_extension __user *base, void *data)</div>
<div class=3D"ContentPasted2">&gt;&gt; +{</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; struct create_ext *e=
xt_data =3D data;</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; struct drm_i915_priv=
ate *i915 =3D ext_data-&gt;i915;</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; struct drm_i915_gem_=
create_ext_set_pat ext;</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; unsigned int max_pat=
_index;</div>
<div class=3D"ContentPasted2">&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; BUILD_BUG_ON(sizeof(=
struct drm_i915_gem_create_ext_set_pat) !=3D</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;offsetofend(struct drm_i915_gem_create_ext_set_=
pat, rsvd));</div>
<div class=3D"ContentPasted2">&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; if (copy_from_user(&=
amp;ext, base, sizeof(ext)))</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; return -EFAULT;</div>
<div class=3D"ContentPasted2">&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; max_pat_index =3D IN=
TEL_INFO(i915)-&gt;max_pat_index;</div>
<div class=3D"ContentPasted2">&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; if (ext.pat_index &g=
t; max_pat_index) {</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; drm_dbg(&amp;i915-&gt;drm, &quot;PAT index is invalid: %u\n&quot;,<=
/div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ext.pat_index);</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; return -EINVAL;</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; }</div>
<div class=3D"ContentPasted2">&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; ext_data-&gt;pat_ind=
ex =3D ext.pat_index;</div>
<div class=3D"ContentPasted2">&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; return 0;</div>
<div class=3D"ContentPasted2">&gt;&gt; +}</div>
<div class=3D"ContentPasted2">&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp;static const i915_user_extensi=
on_fn create_extensions[] =3D {</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;[I915_GEM=
_CREATE_EXT_MEMORY_REGIONS] =3D ext_set_placements,</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;[I915_GEM=
_CREATE_EXT_PROTECTED_CONTENT] =3D ext_set_protected,</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; [I915_GEM_CREATE_EXT=
_SET_PAT] =3D ext_set_pat,</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp;};</div>
<div class=3D"ContentPasted2">&gt;&gt;</div>
<div class=3D"ContentPasted2">&gt;&gt; +#define PAT_INDEX_NOT_SET &nbsp; &n=
bsp;0xffff</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp;/**</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; * i915_gem_create_ext_ioctl -=
 Creates a new mm object and returns a handle to it.</div>
&gt;&gt; &nbsp; * @dev: drm device pointer
<div class=3D"ContentPasted3">&gt;&gt; @@ -418,6 +447,7 @@ i915_gem_create_=
ext_ioctl(struct drm_device *dev, void *data,</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (args-=
&gt;flags &amp; ~I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS)</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;return -EINVAL;</div>
<div class=3D"ContentPasted3">&gt;&gt;</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; ext_data.pat_index =
=3D PAT_INDEX_NOT_SET;</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;ret =3D i=
915_user_extensions(u64_to_user_ptr(args-&gt;extensions),</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; create_extensions,</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; ARRAY_SIZE(create_extensions),</div>
<div class=3D"ContentPasted3">&gt;&gt; @@ -454,5 +484,11 @@ i915_gem_create=
_ext_ioctl(struct drm_device *dev, void *data,</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (IS_ER=
R(obj))</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;return PTR_ERR(obj);</div>
<div class=3D"ContentPasted3">&gt;&gt;</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; if (ext_data.pat_ind=
ex !=3D PAT_INDEX_NOT_SET) {</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; i915_gem_object_set_pat_index(obj, ext_data.pat_index);</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; /* Mark pat_index is set by UMD */</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; obj-&gt;pat_set_by_user =3D true;</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; }</div>
<div class=3D"ContentPasted3">&gt;&gt; +</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;return i9=
15_gem_publish(obj, file, &amp;args-&gt;size, &amp;args-&gt;handle);</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp;}</div>
<div class=3D"ContentPasted3">&gt;&gt; diff --git a/drivers/gpu/drm/i915/ge=
m/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c</div>
<div class=3D"ContentPasted3">&gt;&gt; index 46a19b099ec8..97ac6fb37958 100=
644</div>
<div class=3D"ContentPasted3">&gt;&gt; --- a/drivers/gpu/drm/i915/gem/i915_=
gem_object.c</div>
<div class=3D"ContentPasted3">&gt;&gt; +++ b/drivers/gpu/drm/i915/gem/i915_=
gem_object.c</div>
<div class=3D"ContentPasted3">&gt;&gt; @@ -208,6 +208,12 @@ bool i915_gem_o=
bject_can_bypass_llc(struct drm_i915_gem_object *obj)</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (!(obj=
-&gt;flags &amp; I915_BO_ALLOC_USER))</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;return false;</div>
<div class=3D"ContentPasted3">&gt;&gt;</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; /*</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; &nbsp;* Always flush=
 cache for UMD objects at creation time.</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; &nbsp;*/</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; if (obj-&gt;pat_set_=
by_user)</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; return true;</div>
<div class=3D"ContentPasted3">&gt;&gt; +</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;/*</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * EHL an=
d JSL add the 'Bypass LLC' MOCS entry, which should make it</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * possib=
le for userspace to bypass the GTT caching bits set by the</div>
<div class=3D"ContentPasted3">&gt;&gt; diff --git a/include/uapi/drm/i915_d=
rm.h b/include/uapi/drm/i915_drm.h</div>
<div class=3D"ContentPasted3">&gt;&gt; index f31dfacde601..4083a23e0614 100=
644</div>
<div class=3D"ContentPasted3">&gt;&gt; --- a/include/uapi/drm/i915_drm.h</d=
iv>
&gt;&gt; +++ b/include/uapi/drm/i915_drm.h
<div class=3D"ContentPasted4">&gt;&gt; @@ -3679,9 +3679,13 @@ struct drm_i9=
15_gem_create_ext {</div>
<div class=3D"ContentPasted4">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; *</div>
<div class=3D"ContentPasted4">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * For I9=
15_GEM_CREATE_EXT_PROTECTED_CONTENT usage see</div>
<div class=3D"ContentPasted4">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * struct=
 drm_i915_gem_create_ext_protected_content.</div>
<div class=3D"ContentPasted4">&gt;&gt; + &nbsp; &nbsp; &nbsp;*</div>
<div class=3D"ContentPasted4">&gt;&gt; + &nbsp; &nbsp; &nbsp;* For I915_GEM=
_CREATE_EXT_SET_PAT usage see</div>
<div class=3D"ContentPasted4">&gt;&gt; + &nbsp; &nbsp; &nbsp;* struct drm_i=
915_gem_create_ext_set_pat.</div>
<div class=3D"ContentPasted4">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; */</div>
<div class=3D"ContentPasted4">&gt;&gt; &nbsp;#define I915_GEM_CREATE_EXT_ME=
MORY_REGIONS 0</div>
<div class=3D"ContentPasted4">&gt;&gt; &nbsp;#define I915_GEM_CREATE_EXT_PR=
OTECTED_CONTENT 1</div>
<div class=3D"ContentPasted4">&gt;&gt; +#define I915_GEM_CREATE_EXT_SET_PAT=
 2</div>
<div class=3D"ContentPasted4">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;__u64 ext=
ensions;</div>
<div class=3D"ContentPasted4">&gt;&gt; &nbsp;};</div>
<div class=3D"ContentPasted4">&gt;&gt;</div>
<div class=3D"ContentPasted4">&gt;&gt; @@ -3796,6 +3800,43 @@ struct drm_i9=
15_gem_create_ext_protected_content {</div>
<div class=3D"ContentPasted4">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;__u32 fla=
gs;</div>
<div class=3D"ContentPasted4">&gt;&gt; &nbsp;};</div>
<div class=3D"ContentPasted4">&gt;&gt;</div>
<div class=3D"ContentPasted4">&gt;&gt; +/**</div>
<div class=3D"ContentPasted4">&gt;&gt; + * struct drm_i915_gem_create_ext_s=
et_pat - The</div>
<div class=3D"ContentPasted4">&gt;&gt; + * I915_GEM_CREATE_EXT_SET_PAT exte=
nsion.</div>
<div class=3D"ContentPasted4">&gt;&gt; + *</div>
<div class=3D"ContentPasted4">&gt;&gt; + * If this extension is provided, t=
he specified caching policy (PAT index) is</div>
<div class=3D"ContentPasted4">&gt;&gt; + * applied to the buffer object.</d=
iv>
<div class=3D"ContentPasted4">&gt;&gt; + *</div>
<div class=3D"ContentPasted4">&gt;&gt; + * Below is an example on how to cr=
eate an object with specific caching policy:</div>
<div class=3D"ContentPasted4">&gt;&gt; + *</div>
<div class=3D"ContentPasted4">&gt;&gt; + * .. code-block:: C</div>
<div class=3D"ContentPasted4">&gt;&gt; + *</div>
<div class=3D"ContentPasted4">&gt;&gt; + * &nbsp; &nbsp; &nbsp;struct drm_i=
915_gem_create_ext_set_pat set_pat_ext =3D {</div>
<div class=3D"ContentPasted4">&gt;&gt; + * &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;.base =3D { .name =3D I915_GEM_CREATE_EXT_SET_PAT },</div>
<div class=3D"ContentPasted4">&gt;&gt; + * &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;.pat_index =3D 0,</div>
<div class=3D"ContentPasted4">&gt;&gt; + * &nbsp; &nbsp; &nbsp;};</div>
<div class=3D"ContentPasted4">&gt;&gt; + * &nbsp; &nbsp; &nbsp;struct drm_i=
915_gem_create_ext create_ext =3D {</div>
<div class=3D"ContentPasted4">&gt;&gt; + * &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;.size =3D PAGE_SIZE,</div>
<div class=3D"ContentPasted4">&gt;&gt; + * &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;.extensions =3D (uintptr_t)&amp;set_pat_ext,</div>
<div class=3D"ContentPasted4">&gt;&gt; + * &nbsp; &nbsp; &nbsp;};</div>
<div class=3D"ContentPasted4">&gt;&gt; + *</div>
<div class=3D"ContentPasted4">&gt;&gt; + * &nbsp; &nbsp; &nbsp;int err =3D =
ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &amp;create_ext);</div>
<div class=3D"ContentPasted4">&gt;&gt; + * &nbsp; &nbsp; &nbsp;if (err) ...=
</div>
&gt;&gt; + */
<div class=3D"ContentPasted5">&gt;&gt; +struct drm_i915_gem_create_ext_set_=
pat {</div>
<div class=3D"ContentPasted5">&gt;&gt; + &nbsp; &nbsp; /** @base: Extension=
 link. See struct i915_user_extension. */</div>
<div class=3D"ContentPasted5">&gt;&gt; + &nbsp; &nbsp; struct i915_user_ext=
ension base;</div>
<div class=3D"ContentPasted5">&gt;&gt; + &nbsp; &nbsp; /**</div>
<div class=3D"ContentPasted5">&gt;&gt; + &nbsp; &nbsp; &nbsp;* @pat_index: =
PAT index to be set</div>
<div class=3D"ContentPasted5">&gt;&gt; + &nbsp; &nbsp; &nbsp;* PAT index is=
 a bit field in Page Table Entry to control caching</div>
<div class=3D"ContentPasted5">&gt;&gt; + &nbsp; &nbsp; &nbsp;* behaviors fo=
r GPU accesses. The definition of PAT index is</div>
<div class=3D"ContentPasted5">&gt;&gt; + &nbsp; &nbsp; &nbsp;* platform dep=
endent and can be found in hardware specifications,</div>
<div class=3D"ContentPasted5">&gt;&gt; + &nbsp; &nbsp; &nbsp;*/</div>
<div class=3D"ContentPasted5">&gt;&gt; + &nbsp; &nbsp; __u32 pat_index;</di=
v>
<div class=3D"ContentPasted5">&gt;&gt; + &nbsp; &nbsp; /** @rsvd: reserved =
for future use */</div>
<div class=3D"ContentPasted5">&gt;&gt; + &nbsp; &nbsp; __u32 rsvd;</div>
<div class=3D"ContentPasted5">&gt;&gt; +};</div>
<div class=3D"ContentPasted5">&gt;&gt; +</div>
<div class=3D"ContentPasted5">&gt;&gt; &nbsp;/* ID of the protected content=
 session managed by i915 when PXP is active */</div>
<div class=3D"ContentPasted5">&gt;&gt; &nbsp;#define I915_PROTECTED_CONTENT=
_DEFAULT_SESSION 0xf</div>
<div class=3D"ContentPasted5">&gt;&gt;</div>
<div class=3D"ContentPasted5">&gt;&gt; --</div>
<div class=3D"ContentPasted5">&gt;&gt; 2.25.1</div>
</div>
</body>
</html>

--_000_BYAPR11MB25677DB39F436526F473F1A99A4DABYAPR11MB2567namp_--
