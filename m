Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6663722A70
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 17:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5B410E0A4;
	Mon,  5 Jun 2023 15:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3208510E0A4;
 Mon,  5 Jun 2023 15:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685977787; x=1717513787;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=kv5jBBgu+6Q8mw8rgeIl86+KiHbet1TpdvcVYCaRxGA=;
 b=SAjLeHp8Ma8UyiE4RPsviT+S/WrbH3eeN4tFLO7X5wGYZHGOufmsVPKI
 SWSYbEi59yc8aw3cH7Mse4kWKIHJmpsZJiNeIsh5UfcenG4g881KHvEZL
 KU5811uv6EnCR1s4XvHN1iDaaKgWKkl00ksOhclfGmcQL1f6zRhTGHk2E
 7f0plJF7z2dVewzhWPs1LjvMwwzdepOUIPfD/K8mcap18vFvD5SGwRvCi
 //619CMElAG5jPzrUOC31dISna3f/N01ZSR+wY5MxFa39VRLA9IdQbU2V
 nlaQCVvRqrX6K6LF9npUmLVgibP0Wa1dOfYmCPoXA8G/b7LNKasLd5jub A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="384698012"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
 d="scan'208,217";a="384698012"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 08:09:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="741756594"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
 d="scan'208,217";a="741756594"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 05 Jun 2023 08:09:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 08:09:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 08:09:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 5 Jun 2023 08:09:17 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 5 Jun 2023 08:09:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m7DZVO/mP387Y+/MtqupgWUPf+/F4ojeiknG8Pvc9SLJHWiSRYuX7iJFU+Mi1feJiB4EHzTkRKA4fubDP1rVw9lEWCzFcBJQbzbltFPCzb96oEdfMDGMxYYmcmagE9Mtobcp22tpy2VsudW4MG8d7nXPs3qSLAi64UPU1mOJC/bf4aCinF5yFAECG9G9I0CB38TJPse1LdyAv+QBF3h/5lGk/iqY0OJ1nHUEHkegwswAzGIYmZdSzUBhXcvaZLgYae+mC1fbwnSkm59CIONPworjxJDxS9dCB8i6XSBHHFKVOxEMrVtlWdzq5dLxXJZKRTjZwywGx241hTsvHm/Ywg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvmfAxZoRmO0VR+lcUeSqritZ30dcO/brhsPZdOykso=;
 b=kBVwN04rfDo2n7E6vQpdamXYGPIylFMgg1h92t4Dt+BveEAuAB0QC9x/c5uSdTy0mHJNVWZBahhoiBBrC93d78JPrUNJDwmJ8YPNt/76K5mVWgOSZtMt48tLjnkdm+zgEY+PZJxzhY+mPcUjzEQAleh3+DequgYMWDTK6fmdlfSmPf9cBeNl6/n+aIkj15LzRlipfD9XNb44sgGSh/qiKpIrFIDoiAIptCRV7Fgk7euzSEJiy3V/9LImtGtwBO9jKLvrseEWaoLmW5m5XaZaAy9Hyiwa7xtVZSAlY5SwvCVM5l4fOwLSgJeqLJzyM6ibx7tdQ2S/sSQCqBwWhK7msw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by CO1PR11MB4769.namprd11.prod.outlook.com (2603:10b6:303:95::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 15:09:14 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::bdc8:7e7b:d8b6:6e8]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::bdc8:7e7b:d8b6:6e8%6]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 15:09:14 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v15 0/1] drm/i915: Allow user to set cache at
 BO creation
Thread-Topic: [Intel-gfx] [PATCH v15 0/1] drm/i915: Allow user to set cache at
 BO creation
Thread-Index: AQHZk+K2N9Am0tGChkucHTfKv0IOTK977oOAgAAGgQCAAGCIUw==
Date: Mon, 5 Jun 2023 15:09:14 +0000
Message-ID: <BYAPR11MB2567BB37BFC6803C2406BF619A4DA@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230531171008.1738759-1-fei.yang@intel.com>
 <f7000b2e-e809-3801-48ba-d2a242dcb124@linux.intel.com>
 <2bc9cf75-e8b8-5a98-682b-630685bbe839@linux.intel.com>
In-Reply-To: <2bc9cf75-e8b8-5a98-682b-630685bbe839@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|CO1PR11MB4769:EE_
x-ms-office365-filtering-correlation-id: 643ef7cf-1b4e-48d3-d362-08db65d6d32e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qll6zmZ+a0YEhhWp2BvdwND8Ih7NaqMUc/G7oqggeauaC0Al5e3sH4FNGuip9mBvcD3t5Lb2Tds0ezx3BWsCvynuE6PaO+DbYeMeBVtGXPgzj+eat0dgKKB2P5Zj1s1xzEn8zCCEpLqzSIR0DFFhIZO9Xs7pOkpmL65lq3Gtcr5EZWSewUMsjtTlPW3PBztOAHyLg5cJvGiCGXvVskcVHPaps01iH49fzcJxft0ncFe9LyqNsGc/1s2UxFty8J3rP74Orsf/rRcblxqRXtnqdoX6eAg4abeyln7o0dS0ewXlCI84yGs4vi7Yc5tzO3S2iqFbNGpQ9xoN2+x64/QrIdL8K1d5vLTuNlufIwG3mk5WusO+KnrFuJeqUV3tZIkKKLBONiFNfOIlBv6A9CwpygzlcPQ8aveWJGnclu+mFNwpKBljsDt8cDoN4y44NaiR0ZKarnV23Sfp4q/T67AksUf5ooudNOif+HKmWug5qPIr3FUswYktjiUA7bYE6Ra5L2W4rhikQalFfDXvFMuP2eCux+f8Vxiugr84ZuQfaHwwPlmvQPuRGLIcZs6fkTI1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(376002)(346002)(366004)(39860400002)(451199021)(83380400001)(966005)(110136005)(33656002)(55016003)(478600001)(8676002)(8936002)(38070700005)(316002)(66476007)(66946007)(66556008)(76116006)(52536014)(122000001)(66446008)(5660300002)(38100700002)(64756008)(4326008)(41300700001)(86362001)(82960400001)(7696005)(71200400001)(2906002)(6506007)(19627405001)(186003)(26005)(9686003)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?YY15Vzct8RP6YZP9sB1AvH6uXKyDAa2hRcIJl1gA+ChaevPejdoqlAa+j5?=
 =?iso-8859-1?Q?6ZG8ranKOeYXoUZCxS/YkhRW3wwOtuPa5rL4vd87C0Y1ky1h425A0nOvLy?=
 =?iso-8859-1?Q?CUhKT1eXRY2M//32lYmtktt4Tw6GHwFIha5gbeIUxDc4heGtxj4Jxl+qlA?=
 =?iso-8859-1?Q?sLEH0yYSAlywG1E06On7NV/RASxapL9P1vlLMoNtxmyxQZpzE41xTbo9Sh?=
 =?iso-8859-1?Q?tKTrsMPOsuGU8M1ijovugi1r4p6hpUrBx4pQjSs6Hu1YFkjvgZR5TPYL30?=
 =?iso-8859-1?Q?OP8kgErTLHmE7dAVLklhj81+8e4TpXV+1Y9FzT3jf1s5H28iezzH7zgzSi?=
 =?iso-8859-1?Q?Dhv+FBpxK/Vj9fAZV1gADefC5Le1spdvdKirtVhFMBtYjvU04k/J5LxXxf?=
 =?iso-8859-1?Q?+8BQMjiRmlH0b+H6LIz+O0XbEKXfnoLFUt8PT9AUvJRWE7nUx4Yo+DJ9ao?=
 =?iso-8859-1?Q?sLnJhFrfd4neLczUpStCxPQt8+vfbDLVJcDHklXtrjnZ3x7au1APDbyhO6?=
 =?iso-8859-1?Q?lT0SOro8XXhQkDfw5vBPbN9MaoMTjOkQi9DSRiiopBnqQdFmQ9A/PySOTv?=
 =?iso-8859-1?Q?wARD7CiBqPAiDtts3lrTvz4wLPLMp7hAzTgLAHgsZJ1gWWYZxfOnPc7pmw?=
 =?iso-8859-1?Q?LWjofCx+k0WxafEBoaB5MaZmzqahR4UCUkqZtVU5cXW/WYIpCSMr7sk205?=
 =?iso-8859-1?Q?+Dw/srO4rQt2SWhcwX2j7RfVrNiFC4Y8U36kZglEddKFQ73rityyyDbesu?=
 =?iso-8859-1?Q?gD+sWCcs3Fs9oASk57mg0oKQR8Q6utOm5Z54DKtYcePVkgxbVLdSMNe2Dg?=
 =?iso-8859-1?Q?TSY0aFzDRLRbWHw3+KDjwGmWJnt7GE+8U841tb/14K9WRBrLTyWO8hpGXp?=
 =?iso-8859-1?Q?bdyTuwqDuVy438EMSZJ3i1BU1W9lxVM+kbSAdCiSGeyQfm8fPIIifRPo2f?=
 =?iso-8859-1?Q?E4o1xyD7d88hldAUqHXpWJQtdUsBhM0NjtP2I/ZdgqqKxFW//xIhX9lhHd?=
 =?iso-8859-1?Q?tmpZtdbdynSsNUSdB0NXHh4Z56p00/rdWcZRWTcfDd1lmr/Mps72yp1Z5p?=
 =?iso-8859-1?Q?rQceJJWONrdv03Njte6arNMLeNPqZk1PGBJ3mK3i0O74l27xIDKvoie5gg?=
 =?iso-8859-1?Q?j/uZVt/ih+QvTkm8VR4qiyB7OVwdr2Vy/O8WpUBfebLkVF0aKntgwG/eoO?=
 =?iso-8859-1?Q?kEGPHIzwb7dghlVKh/DUp1lSVs8Oelv557hPUgtEjlnNx4qnPk3dOrcxpJ?=
 =?iso-8859-1?Q?Uai8GorufFoxAYLQlHCZTeaA/R9CkWmdBm25he3Vs8sca8/0qw6v3SZMq2?=
 =?iso-8859-1?Q?mui5fSrCo3FiCyBqMXYuJSGZ/qWfRZuOQJgVwZPwD8J4IGsUWYVcw2ZmxN?=
 =?iso-8859-1?Q?RDBNvMaiTGJANZrG5TQmm9XYSc0N6RDuns6bDfZokLQMrzs92VzhoJVdqH?=
 =?iso-8859-1?Q?+RW/wJQDD6Xps54iIr/tqVwSb8xpfgnJOGlCRgua8oTEJCxvKpmi8LfUTg?=
 =?iso-8859-1?Q?3UUorlaDsys1p9xxqMYpwA7nCS9m1kkTLkQDeJgGuLHDEEUPCDXnRFrKgC?=
 =?iso-8859-1?Q?zyFYbpGiHY7UVBcnK7Sptg8WnxLlqR4fsi6xpvv4Jrif2Sbj0jS3Xqu0wY?=
 =?iso-8859-1?Q?OKU8xfxi1Y+oY=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB2567BB37BFC6803C2406BF619A4DABYAPR11MB2567namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 643ef7cf-1b4e-48d3-d362-08db65d6d32e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2023 15:09:14.3522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Cp1cGprdAJm8rJbkqGHH74PevXUvMd5CvjaPrpUsiOPYts9AWT+q/KGsQUzduu31BXoN2j4fTVkjGy4CZ663Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4769
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

--_000_BYAPR11MB2567BB37BFC6803C2406BF619A4DABYAPR11MB2567namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> On 05/06/2023 09:53, Tvrtko Ursulin wrote:
>> On 31/05/2023 18:10, fei.yang@intel.com wrote:
>>> From: Fei Yang <fei.yang@intel.com>
>>>
>>> This series introduce a new extension for GEM_CREATE,
>>> 1. end support for set caching ioctl [PATCH 1/2]
>>> 2. add set_pat extension for gem_create [PATCH 2/2]
>>>
>>> v2: drop one patch that was merged separately
>>>      commit 341ad0e8e254 ("drm/i915/mtl: Add PTE encode function")
>>> v3: rebased on https://patchwork.freedesktop.org/series/117082/
>>> v4: fix missing unlock introduced in v3, and
>>>      solve a rebase conflict
>>> v5: replace obj->cache_level with pat_set_by_user,
>>>      fix i915_cache_level_str() for legacy platforms.
>>> v6: rebased on https://patchwork.freedesktop.org/series/117480/
>>> v7: rebased on https://patchwork.freedesktop.org/series/117528/
>>> v8: dropped the two dependent patches that has been merged
>>>      separately. Add IGT link and Tested-by (MESA).
>>> v9: addressing comments (Andi)
>>> v10: acked-by and tested-by MESA
>>> v11: drop "end support for set caching ioctl" (merged)
>>>       remove tools/include/uapi/drm/i915_drm.h
>>> v12: drop Bspec reference in comment. add to commit message instead
>>> v13: sent to test with igt@gem_create@create-ext-set-pat
>>> v14: sent to test with igt@gem_create@create-ext-set-pat
>>> v15: update commit message with documentation note and t-b/a-b from
>>>       Media driver folks.
>>>
>>> Fei Yang (1):
>>>    drm/i915: Allow user to set cache at BO creation
>>>
>>>   drivers/gpu/drm/i915/gem/i915_gem_create.c | 36 +++++++++++++++++++
>>>   drivers/gpu/drm/i915/gem/i915_gem_object.c |  6 ++++
>>>   include/uapi/drm/i915_drm.h                | 41 +++++++++++++++++++++=
+
>>>   3 files changed, 83 insertions(+)
>>>
>>
>> Try with:
>>
>> Test-with: 20230526172221.1438998-1-fei.yang@intel.com
>>
>> That is how it is supposed to be done, to do a CI run against a test
>> case not yet merged that is.

Yes, the result can be found at https://patchwork.freedesktop.org/series/11=
6870/
, under rev14, expand Fi.CI.IGT, you would see,

New IGT tests (1)
        igt@gem_create@create-ext-set-pat:
        Statuses : 6 pass(s)
        Exec time: [0.0] s

> Or I see that IGT has been since merged so you probably have results
> already?

Seems like the last update ran into some random failure which caused CI to =
stop.

> Regards,
>
> Tvrtko


--_000_BYAPR11MB2567BB37BFC6803C2406BF619A4DABYAPR11MB2567namp_
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
tPasted1">
&gt; On 05/06/2023 09:53, Tvrtko Ursulin wrote:
<div class=3D"ContentPasted0">&gt;&gt; On 31/05/2023 18:10, fei.yang@intel.=
com wrote:</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; From: Fei Yang &lt;fei.yang@inte=
l.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; This series introduce a new exte=
nsion for GEM_CREATE,</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; 1. end support for set caching i=
octl [PATCH 1/2]</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; 2. add set_pat extension for gem=
_create [PATCH 2/2]</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; v2: drop one patch that was merg=
ed separately</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp;commit 341ad=
0e8e254 (&quot;drm/i915/mtl: Add PTE encode function&quot;)</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; v3: rebased on https://patchwork=
.freedesktop.org/series/117082/</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; v4: fix missing unlock introduce=
d in v3, and</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp;solve a reba=
se conflict</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; v5: replace obj-&gt;cache_level =
with pat_set_by_user,</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp;fix i915_cac=
he_level_str() for legacy platforms.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; v6: rebased on https://patchwork=
.freedesktop.org/series/117480/</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; v7: rebased on https://patchwork=
.freedesktop.org/series/117528/</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; v8: dropped the two dependent pa=
tches that has been merged</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp;separately. =
Add IGT link and Tested-by (MESA).</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; v9: addressing comments (Andi)</=
div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; v10: acked-by and tested-by MESA=
</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; v11: drop &quot;end support for =
set caching ioctl&quot; (merged)</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; remove tool=
s/include/uapi/drm/i915_drm.h</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; v12: drop Bspec reference in com=
ment. add to commit message instead</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; v13: sent to test with igt@gem_c=
reate@create-ext-set-pat</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; v14: sent to test with igt@gem_c=
reate@create-ext-set-pat</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; v15: update commit message with =
documentation note and t-b/a-b from</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; Media drive=
r folks.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Fei Yang (1):</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp;drm/i915: Allow use=
r to set cache at BO creation</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; drivers/gpu/drm/i915/gem/=
i915_gem_create.c | 36 +++++++++++++++++++</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; drivers/gpu/drm/i915/gem/=
i915_gem_object.c | &nbsp;6 ++++</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; include/uapi/drm/i915_drm=
.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 41 ++++++++++++=
++++++++++</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; 3 files changed, 83 inser=
tions(+)</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Try with:</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Test-with: 20230526172221.1438998-1-=
fei.yang@intel.com</div>
&gt;&gt;
<div class=3D"ContentPasted1">&gt;&gt; That is how it is supposed to be don=
e, to do a CI run against a test</div>
<div class=3D"ContentPasted1">&gt;&gt; case not yet merged that is.</div>
<div><br class=3D"ContentPasted1">
</div>
<div class=3D"ContentPasted1">Yes, the result can be found at https://patch=
work.freedesktop.org/series/116870/</div>
<div class=3D"ContentPasted1">, under rev14, expand Fi.CI.IGT, you would se=
e,</div>
<div><br class=3D"ContentPasted1">
</div>
<div class=3D"ContentPasted1">New IGT tests (1)</div>
<div class=3D"ContentPasted1">&nbsp; &nbsp; &nbsp; &nbsp; igt@gem_create@cr=
eate-ext-set-pat:</div>
<div class=3D"ContentPasted1">&nbsp; &nbsp; &nbsp; &nbsp; Statuses : 6 pass=
(s)</div>
<div class=3D"ContentPasted1">&nbsp; &nbsp; &nbsp; &nbsp; Exec time: [0.0] =
s</div>
<div><br class=3D"ContentPasted1">
</div>
<div class=3D"ContentPasted1">&gt; Or I see that IGT has been since merged =
so you probably have results</div>
<div class=3D"ContentPasted1">&gt; already?</div>
<div><br class=3D"ContentPasted1">
</div>
<div class=3D"ContentPasted1">Seems like the last update ran into some rand=
om failure which caused CI to stop.</div>
<div><br class=3D"ContentPasted1">
</div>
<div class=3D"ContentPasted1">&gt; Regards,</div>
<div class=3D"ContentPasted1">&gt;</div>
<div class=3D"ContentPasted1">&gt; Tvrtko</div>
<br>
</div>
</body>
</html>

--_000_BYAPR11MB2567BB37BFC6803C2406BF619A4DABYAPR11MB2567namp_--
