Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CECE872382C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 08:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD7510E2AD;
	Tue,  6 Jun 2023 06:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42DE110E22B;
 Tue,  6 Jun 2023 06:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686034273; x=1717570273;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=SN5ofq/nSMAyKFquLaLpCJlwCHREHzOzR0u5DdBQhx0=;
 b=QxHDyTv+jME8RSbF7qDlKi2MWdGoRyDOz6vbrC4iZXXv9k0QqJDBYu+Z
 aLgt8dA1hnyEyNI4lomg39NkHdylEqeQwbRh/Ax1sL6C9trl73T5gCGB6
 WgE9i8cIo+ZLRnuDi13ki1cPPswu39hhd5ranuKctjozwFA2gsnxWpIna
 vIJC524h8+XUQtJ417oz56g3lAHL/mqkT3WmLu2xUvrV+05Bxt+GUSUTH
 JiWQFpuadJFyWoZWbkdYN9Th/M5SdC80FPZAQ2V2VZkVBHoNuy4ItWBQK
 i57URWX5mhK9FLKEjEn6hKs/uNcEKFThE237ihpAYgByT6MALQcLkumDB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="359036922"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
 d="scan'208,217";a="359036922"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 23:51:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="955631386"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
 d="scan'208,217";a="955631386"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 05 Jun 2023 23:51:11 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 23:51:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 5 Jun 2023 23:51:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 5 Jun 2023 23:51:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wk0tHkrBzBCZFIR/55oS1mfueFSANq5LoyhauDsl8ZRXNGIeYR4q3j0gPQV/Ta7iI2DtRBPcAwb59Z1FFSbJwTtAc0RK1SHK5qfN2GpuANOq629os1dHY0WSZcsWSBq6uCxTTgcujVbVOwtt4IckO2Skty0qFsKfSDiXz0vxrhMw7w2GVCTqzmuSOWENhV1Ibuth0rrnTSfg2UNJc1fFbNffZi93l7bP4c6mD8joONZEwej72VRMItQ460f8nZSRW7ErTKIwdpeyil5lHsHvCCJhv565l/3T+vzHe67WW1wuNBUxHO1wLtUqcUPicgWfBUYlX4/QW9XU0dMarTX5Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6j1864yYdo59/U7JY+tz2xpL6uB2/q0t7GKnYOOA4GU=;
 b=F7mRGJBaQu2FVpBHFtlwItRegC9sOf1XoqKkufu3+37jwMMZzzGMegrw1PZupCvfHbvX/MH4tIYuVCkpSQKaoGG83Y2HT/CvO+HjdU7WF0F4gvYbkzVWawiHKOjcVWmyzy0VMw6UF8H9QecnQIFOCMnMqqyF9wKvOY+OV006EKftkh8L2g8LmH/7j/fQBYsZyGWkF+/71vLkLfmAhCFWNSDzv3LmIwaeAH4DpOhAgCG8/sSyd0Y/Nof3B2ATLrjTXJOYnTqTrTYAdXFei3k9Lda5CCM681tkGPRKf/BwUIFpgM2dWdna2iOI5XAhbhs3vn55qb1sJ5+gZH+Gi7ut6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by DS0PR11MB8162.namprd11.prod.outlook.com (2603:10b6:8:166::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 06:51:07 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::bdc8:7e7b:d8b6:6e8]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::bdc8:7e7b:d8b6:6e8%6]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 06:51:06 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v15 1/1] drm/i915: Allow user to set cache at
 BO creation
Thread-Topic: [Intel-gfx] [PATCH v15 1/1] drm/i915: Allow user to set cache at
 BO creation
Thread-Index: AQHZk+KyvMyvSoG8/0WPz+256ysQ0a9784+AgAB8/ruAAOYy3w==
Date: Tue, 6 Jun 2023 06:51:06 +0000
Message-ID: <BYAPR11MB25678E7C7741B66CC439816C9A52A@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230531171008.1738759-1-fei.yang@intel.com>
 <20230531171008.1738759-2-fei.yang@intel.com>
 <be21b183-141d-8b77-fc1c-596208e3e1c2@linux.intel.com>
 <BYAPR11MB2567838CAC92E95C7C68CCE19A4DA@BYAPR11MB2567.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB2567838CAC92E95C7C68CCE19A4DA@BYAPR11MB2567.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|DS0PR11MB8162:EE_
x-ms-office365-filtering-correlation-id: 17a92c7d-bb94-438b-0091-08db665a673e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0AyCbwxFNNDIIBi+f18Jox3yR9Qlf91zkCvP7rDpO5QdF9cujeBXKQrrabgXNL0drc8/SI6z+mn5BVVYNZHtCS2nOzHzTuU4ERyDHrNDYLbUNQmWaO9XGRmPqzhMkzIfezYAJ2HAFBpf7tIc7Spf96W5zYh5XCU68QEQIBsay7jIz/IzNGPPKq4Q1crxK9s3mTAVkwr3V78q3u6pT07z8WvAgEfG05F2xYak1dmxxzkpbdNQs57unUn3sberMroQAArCLL1pqYDVFLnHLTJ+NUNg3J6ZvQ8PBYBbao1dDNcOOBYb8cUSXgDV4KpthLThn/wCpam8TTsOwZWkax7WjYbdW+DkB/cH69yiHSCVyaruG0I5Q3YGpHM2pY3xMu5vw76Xd/NLx+eJpagqZ/tjKJzLM+Pi0Dag/lxPAFjFsO5c0nd9t3qm7Sd5Ub+vOb0BzRlcnE75z3o0ySq9AvBl6qhdKYciZBc2SAGslugKADTo0tnoahBjJK1b9maUANhAJASw4g1Ty1OhRJ3UKGkKvu/8Y/UCRGj6QRKT9Y0oy56tYL4lTMJJWcL9kZGAo+rIE+9qsYv6LL+Gd5SaYl0YWS8kmK1P5lVEjVF2FqzmcbMsuV7rxJUI0C/pnAJtyQQSXSoSd4R4BFQfZZf4AMJQUw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199021)(71200400001)(478600001)(4326008)(38100700002)(122000001)(66946007)(82960400001)(76116006)(66446008)(64756008)(110136005)(54906003)(66556008)(8676002)(5660300002)(8936002)(86362001)(55016003)(33656002)(52536014)(2906002)(41300700001)(316002)(66476007)(83380400001)(38070700005)(966005)(26005)(6506007)(9686003)(53546011)(19627405001)(186003)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?oU8kKV03KRnkFKudACYhagr8xSJS7v2esmr6YAy2EYlhhgBcTwHWp/8EqT?=
 =?iso-8859-1?Q?XDodgKc61QbVpNd4wVQkmxTZmosjAOmJihziQdmg+q89GlcGkLKcuWyFXJ?=
 =?iso-8859-1?Q?9JiiiFZBbTqWnGdbE3usQ4BOzQCpa94XGeYs/2O2N97fbj9rpuMPxkrHfs?=
 =?iso-8859-1?Q?fQbdKeU9mdIcYcp+/k9+nIN1Tek5a77iyldjjc8bW5A9wIqd4nbHvb0Rf2?=
 =?iso-8859-1?Q?UAjdrsifxpN5RFF21zLC5GSIBaEgH1Mm8hoZABurx2pemgdYxLZge3WSMJ?=
 =?iso-8859-1?Q?QG6hPqPyl5B08BuzIIHssnuFqu3ufob8xRc08wr7/wq5ZFLMOPluxZSyja?=
 =?iso-8859-1?Q?gCcAcnc4bW3I5vQRix1D1hJAw2FR/2pznQFKThyyXRoPunkZsek6Auj4kc?=
 =?iso-8859-1?Q?cXDUkvg/Nxp3Y1pClyExEw3dNjKl3Rd6pY6N7OLB0pHvX3TvE2oRvXncW8?=
 =?iso-8859-1?Q?vfvK6QQdOYTKXeqDne/qrFsLe8JOq7vpH26Of7kwB72A6pWC5ssqSU6enF?=
 =?iso-8859-1?Q?Q/4bnhBf0LqIu7h5JQKZsCKcM/xstbvdiOb0JupIfy3ntkqtOxoRene7aE?=
 =?iso-8859-1?Q?JjXYwWeSNasYp/7EglaMOorA2Pnw4j80wvGHcjMKIywwDVrOb2HXkdNBOp?=
 =?iso-8859-1?Q?B6bEtUHXB4/kA7GttHb1ejYhkAaO0PBsOVJBB8TpuPxOaadwjbs1/8jNPD?=
 =?iso-8859-1?Q?vw1MhIDolj0Yl+UjJikUS5dx7wC9WHc1LP+3EY+cQDY74aQPAAn5FLU7MG?=
 =?iso-8859-1?Q?vrRAPrwO3KxrIbwRFMdLLwHSVO6xTelywCz9gwBm8b49BdwwT3XpvDwzf7?=
 =?iso-8859-1?Q?NBtY1+GW1fTJtS9PnDO47yzJN0Yz3nZyaVDNvGFs2E0OTVj82AW1nDjHjw?=
 =?iso-8859-1?Q?ZbsX8dFS7TDynDVpgEu5q3Y35A6IMFqR0727rxuy6soNUS6T7edZMCctL1?=
 =?iso-8859-1?Q?agmkZmIJQmm+wsg1h5bK2IisALErTvGzR9PtrpMDkTjICi3QyCzwWhZbw0?=
 =?iso-8859-1?Q?J37EzZ0L1IFaNicWHrIejlHPGEH8s0OkqubiOE1pw4O9w0SWHWMIlxmftJ?=
 =?iso-8859-1?Q?LGbOCVNoqmrZSUS8X2VBAzDympfgxHq69aUCuCQlB1EIvFVJYtfUXFTajb?=
 =?iso-8859-1?Q?kH2jPLx2AJNnAIkP7jDbtbyJ/i/ieP08KPSmw+J3b8/oJHJE0XrlRiMXkc?=
 =?iso-8859-1?Q?6LzGXS8Cni0GknDFuXSeU9UOOP62/c50rJxjS7LgGTQSXn7D7XEbPBybxI?=
 =?iso-8859-1?Q?GeDmzhPQ9+v6cQTQ9OHupLWL/B1kg+gKwHw3jnpYMwPrrvfUTABsYcOAgQ?=
 =?iso-8859-1?Q?u9eVRGbct50/CRMpA0bdgvOjsgenz7vbSXkIv/oOyZTfxkvaeUnjmIRMuo?=
 =?iso-8859-1?Q?ixiskWiUAzeKJpCHe3oIZF8YoAfUUMag020Qdm9MHt7xayoLodRT0W/V4y?=
 =?iso-8859-1?Q?FW36e5z438LMIcBbiJN7EPX9+dO/xwNzzvhMBNDrnq+PQK4h1Mh6c1ozGK?=
 =?iso-8859-1?Q?9BP1U7WVlTdKhgjfA4OEKsTkHe/heEgujifnmk0nNiMpQY9fjhpdg+0RnX?=
 =?iso-8859-1?Q?fbwsLiPsT8CX7nmqLCznkxKY1qmvfOjRmB7W6v/IiRBel1Z+sysh2W3L9F?=
 =?iso-8859-1?Q?NRmViEP3P1YF4=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB25678E7C7741B66CC439816C9A52ABYAPR11MB2567namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17a92c7d-bb94-438b-0091-08db665a673e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 06:51:06.8240 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k51d1vmamKKDZCblM9rrEClxMJb96FwMdQ4OOWzdDNY6nySXeyPj3Wex78IR8tYxWVuOMM4wg91HvBh7HxLl3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8162
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
Cc: "Gu, Lihao" <lihao.gu@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Zhang,
 Carl" <carl.zhang@intel.com>, "Shyti, Andi" <andi.shyti@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR11MB25678E7C7741B66CC439816C9A52ABYAPR11MB2567namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

>> On 31/05/2023 18:10, fei.yang@intel.com wrote:
>>> From: Fei Yang <fei.yang@intel.com>
>>>
>>> To comply with the design that buffer objects shall have immutable
>>> cache setting through out their life cycle, {set, get}_caching ioctl's
>>> are no longer supported from MTL onward. With that change caching
>>> policy can only be set at object creation time. The current code
>>> applies a default (platform dependent) cache setting for all objects.
>>> However this is not optimal for performance tuning. The patch extends
>>> the existing gem_create uAPI to let user set PAT index for the object
>>> at creation time.
>>> The new extension is platform independent, so UMD's can switch to using
>>> this extension for older platforms as well, while {set, get}_caching ar=
e
>>> still supported on these legacy paltforms for compatibility reason.
>>>
>>> Note: The detailed description of PAT index is missing in current PRM
>>> even for older hardware and will be added by the next PRM update under
>>> chapter name "Memory Views".
>>>
>>> BSpec: 45101
>>>
>>> Mesa support has been submitted in this merge request:
>>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22878
>>>
>>> The media driver is supported by the following commits:
>>> https://github.com/intel/media-driver/commit/92c00a857433ebb34ec575e983=
4f473c6fcb6341
>>> https://github.com/intel/media-driver/commit/fd375cf2c5e1f6bf6b43258ff7=
97b3134aadc9fd
>>> https://github.com/intel/media-driver/commit/08dd244b22484770a33464c2c8=
ae85430e548000
>>
>> On which platforms will media-driver use the uapi? I couldn't easily
>> figure out myself from the links above and also in the master branch I
>> couldn't find the implementation of CachePolicyGetPATIndex.
>
> These commits look like platform independent. Carl, could you chime in he=
re?

Confirmed with Carl and Lihao offline that the media driver is calling set_=
pat
extension in common code path, so the use of set_pat extension is platform
independent. The only problem right now is that the gmm library is not retu=
rning
correct PAT index for all hardware platforms, so on some platforms the call=
 would
be bypassed and fall back to the old way.
I think this is the correct implementation. It should be platform independe=
nt as
long as the application knows what PAT index to set. Updating the gmm libra=
ry to
understand PAT index for each hardware platform is a separate issue.

>> Now that PRMs for Tigerlake have been published and Meteorlake situation
>> is documented indirectly in Mesa code, my only remaining concern is with
>> the older platforms. So if there is no particular reason to have the
>> extension working on those, I would strongly suggest we disable there.
>
> What's the concern? There is no change required for older platforms, exis=
ting
> user space code should continue to work. And this extension should be mad=
e
> available for any new development because the cache settings for BO's nee=
d
> to be immutable. And that is platform independent.
>
>> For a precedent see I915_CONTEXT_PARAM_SSEU and how it allows the
>> extension only on Gen11 and only for a very specific usecase (see
>> restrictions in set_sseu() and i915_gem_user_to_context_sseu()).
>>
>> Regards,
>>
>> Tvrtko
>>
>>>
>>> The IGT test related to this change is
>>> igt@gem_create@create-ext-set-pat
>>>
>>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>>> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>>> Acked-by: Jordan Justen <jordan.l.justen@intel.com>
>>> Tested-by: Jordan Justen <jordan.l.justen@intel.com>
>>> Acked-by: Carl Zhang <carl.zhang@intel.com>
>>> Tested-by: Lihao Gu <lihao.gu@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gem/i915_gem_create.c | 36 +++++++++++++++++++
>>>   drivers/gpu/drm/i915/gem/i915_gem_object.c |  6 ++++
>>>   include/uapi/drm/i915_drm.h                | 41 +++++++++++++++++++++=
+
>>>   3 files changed, 83 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/d=
rm/i915/gem/i915_gem_create.c
>>> index bfe1dbda4cb7..644a936248ad 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>> @@ -245,6 +245,7 @@ struct create_ext {
>>>        unsigned int n_placements;
>>>        unsigned int placement_mask;
>>>        unsigned long flags;
>>> +     unsigned int pat_index;
>>>   };
>>>
>>>   static void repr_placements(char *buf, size_t size,
>>> @@ -394,11 +395,39 @@ static int ext_set_protected(struct i915_user_ext=
ension __user *base, void *data
>>>        return 0;
>>>   }
>>>
>>> +static int ext_set_pat(struct i915_user_extension __user *base, void *=
data)
>>> +{
>>> +     struct create_ext *ext_data =3D data;
>>> +     struct drm_i915_private *i915 =3D ext_data->i915;
>>> +     struct drm_i915_gem_create_ext_set_pat ext;
>>> +     unsigned int max_pat_index;
>>> +
>>> +     BUILD_BUG_ON(sizeof(struct drm_i915_gem_create_ext_set_pat) !=3D
>>> +                  offsetofend(struct drm_i915_gem_create_ext_set_pat, =
rsvd));
>>> +
>>> +     if (copy_from_user(&ext, base, sizeof(ext)))
>>> +             return -EFAULT;
>>> +
>>> +     max_pat_index =3D INTEL_INFO(i915)->max_pat_index;
>>> +
>>> +     if (ext.pat_index > max_pat_index) {
>>> +             drm_dbg(&i915->drm, "PAT index is invalid: %u\n",
>>> +                     ext.pat_index);
>>> +             return -EINVAL;
>>> +     }
>>> +
>>> +     ext_data->pat_index =3D ext.pat_index;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>>   static const i915_user_extension_fn create_extensions[] =3D {
>>>        [I915_GEM_CREATE_EXT_MEMORY_REGIONS] =3D ext_set_placements,
>>>        [I915_GEM_CREATE_EXT_PROTECTED_CONTENT] =3D ext_set_protected,
>>> +     [I915_GEM_CREATE_EXT_SET_PAT] =3D ext_set_pat,
>>>   };
>>>
>>> +#define PAT_INDEX_NOT_SET    0xffff
>>>   /**
>>>    * i915_gem_create_ext_ioctl - Creates a new mm object and returns a =
handle to it.
>>>    * @dev: drm device pointer
>>> @@ -418,6 +447,7 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, v=
oid *data,
>>>        if (args->flags & ~I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS)
>>>                return -EINVAL;
>>>
>>> +     ext_data.pat_index =3D PAT_INDEX_NOT_SET;
>>>        ret =3D i915_user_extensions(u64_to_user_ptr(args->extensions),
>>>                                   create_extensions,
>>>                                   ARRAY_SIZE(create_extensions),
>>> @@ -454,5 +484,11 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, =
void *data,
>>>        if (IS_ERR(obj))
>>>                return PTR_ERR(obj);
>>>
>>> +     if (ext_data.pat_index !=3D PAT_INDEX_NOT_SET) {
>>> +             i915_gem_object_set_pat_index(obj, ext_data.pat_index);
>>> +             /* Mark pat_index is set by UMD */
>>> +             obj->pat_set_by_user =3D true;
>>> +     }
>>> +
>>>        return i915_gem_publish(obj, file, &args->size, &args->handle);
>>>   }
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/d=
rm/i915/gem/i915_gem_object.c
>>> index 46a19b099ec8..97ac6fb37958 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>> @@ -208,6 +208,12 @@ bool i915_gem_object_can_bypass_llc(struct drm_i91=
5_gem_object *obj)
>>>        if (!(obj->flags & I915_BO_ALLOC_USER))
>>>                return false;
>>>
>>> +     /*
>>> +      * Always flush cache for UMD objects at creation time.
>>> +      */
>>> +     if (obj->pat_set_by_user)
>>> +             return true;
>>> +
>>>        /*
>>>         * EHL and JSL add the 'Bypass LLC' MOCS entry, which should mak=
e it
>>>         * possible for userspace to bypass the GTT caching bits set by =
the
>>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>> index f31dfacde601..4083a23e0614 100644
>>> --- a/include/uapi/drm/i915_drm.h
>>> +++ b/include/uapi/drm/i915_drm.h
>>> @@ -3679,9 +3679,13 @@ struct drm_i915_gem_create_ext {
>>>         *
>>>         * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
>>>         * struct drm_i915_gem_create_ext_protected_content.
>>> +      *
>>> +      * For I915_GEM_CREATE_EXT_SET_PAT usage see
>>> +      * struct drm_i915_gem_create_ext_set_pat.
>>>         */
>>>   #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
>>>   #define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
>>> +#define I915_GEM_CREATE_EXT_SET_PAT 2
>>>        __u64 extensions;
>>>   };
>>>
>>> @@ -3796,6 +3800,43 @@ struct drm_i915_gem_create_ext_protected_content=
 {
>>>        __u32 flags;
>>>   };
>>>
>>> +/**
>>> + * struct drm_i915_gem_create_ext_set_pat - The
>>> + * I915_GEM_CREATE_EXT_SET_PAT extension.
>>> + *
>>> + * If this extension is provided, the specified caching policy (PAT in=
dex) is
>>> + * applied to the buffer object.
>>> + *
>>> + * Below is an example on how to create an object with specific cachin=
g policy:
>>> + *
>>> + * .. code-block:: C
>>> + *
>>> + *      struct drm_i915_gem_create_ext_set_pat set_pat_ext =3D {
>>> + *              .base =3D { .name =3D I915_GEM_CREATE_EXT_SET_PAT },
>>> + *              .pat_index =3D 0,
>>> + *      };
>>> + *      struct drm_i915_gem_create_ext create_ext =3D {
>>> + *              .size =3D PAGE_SIZE,
>>> + *              .extensions =3D (uintptr_t)&set_pat_ext,
>>> + *      };
>>> + *
>>> + *      int err =3D ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_e=
xt);
>>> + *      if (err) ...
>>> + */
>>> +struct drm_i915_gem_create_ext_set_pat {
>>> +     /** @base: Extension link. See struct i915_user_extension. */
>>> +     struct i915_user_extension base;
>>> +     /**
>>> +      * @pat_index: PAT index to be set
>>> +      * PAT index is a bit field in Page Table Entry to control cachin=
g
>>> +      * behaviors for GPU accesses. The definition of PAT index is
>>> +      * platform dependent and can be found in hardware specifications=
,
>>> +      */
>>> +     __u32 pat_index;
>>> +     /** @rsvd: reserved for future use */
>>> +     __u32 rsvd;
>>> +};
>>> +
>>>   /* ID of the protected content session managed by i915 when PXP is ac=
tive */
>>>   #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
>>>


--_000_BYAPR11MB25678E7C7741B66CC439816C9A52ABYAPR11MB2567namp_
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
&gt;&gt; On 31/05/2023 18:10, fei.yang@intel.com wrote:
<div class=3D"ContentPasted0">&gt;&gt;&gt; From: Fei Yang &lt;fei.yang@inte=
l.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; To comply with the design that b=
uffer objects shall have immutable</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; cache setting through out their =
life cycle, {set, get}_caching ioctl's</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; are no longer supported from MTL=
 onward. With that change caching</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; policy can only be set at object=
 creation time. The current code</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; applies a default (platform depe=
ndent) cache setting for all objects.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; However this is not optimal for =
performance tuning. The patch extends</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; the existing gem_create uAPI to =
let user set PAT index for the object</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; at creation time.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; The new extension is platform in=
dependent, so UMD's can switch to using</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; this extension for older platfor=
ms as well, while {set, get}_caching are</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; still supported on these legacy =
paltforms for compatibility reason.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Note: The detailed description o=
f PAT index is missing in current PRM</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; even for older hardware and will=
 be added by the next PRM update under</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; chapter name &quot;Memory Views&=
quot;.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; BSpec: 45101</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Mesa support has been submitted =
in this merge request:</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; https://gitlab.freedesktop.org/m=
esa/mesa/-/merge_requests/22878</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; The media driver is supported by=
 the following commits:</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; https://github.com/intel/media-d=
river/commit/92c00a857433ebb34ec575e9834f473c6fcb6341</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; https://github.com/intel/media-d=
river/commit/fd375cf2c5e1f6bf6b43258ff797b3134aadc9fd</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; https://github.com/intel/media-d=
river/commit/08dd244b22484770a33464c2c8ae85430e548000</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; On which platforms will media-driver=
 use the uapi? I couldn't easily</div>
<div class=3D"ContentPasted0">&gt;&gt; figure out myself from the links abo=
ve and also in the master branch I</div>
<div class=3D"ContentPasted0">&gt;&gt; couldn't find the implementation of =
CachePolicyGetPATIndex.</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; These commits look like platform indepen=
dent. Carl, could you chime in here?</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Confirmed with Carl and Lihao offline that th=
e media driver is calling set_pat</div>
<div class=3D"ContentPasted0">extension in common code path, so the use of =
set_pat extension is platform</div>
<div class=3D"ContentPasted0">independent. The only problem right now is th=
at the gmm library is not returning</div>
<div class=3D"ContentPasted0">correct PAT index for all hardware platforms,=
 so on some platforms the call would</div>
<div class=3D"ContentPasted0">be bypassed and fall back to the old way.</di=
v>
<div class=3D"ContentPasted0">I think this is the correct implementation. I=
t should be platform independent as</div>
long as the application knows what PAT index to set. Updating the gmm libra=
ry to
<div class=3D"ContentPasted1">understand PAT index for each hardware platfo=
rm is a separate issue.</div>
<div><br class=3D"ContentPasted1">
</div>
<div class=3D"ContentPasted1">&gt;&gt; Now that PRMs for Tigerlake have bee=
n published and Meteorlake situation</div>
<div class=3D"ContentPasted1">&gt;&gt; is documented indirectly in Mesa cod=
e, my only remaining concern is with</div>
<div class=3D"ContentPasted1">&gt;&gt; the older platforms. So if there is =
no particular reason to have the</div>
<div class=3D"ContentPasted1">&gt;&gt; extension working on those, I would =
strongly suggest we disable there.</div>
<div class=3D"ContentPasted1">&gt;</div>
<div class=3D"ContentPasted1">&gt;&nbsp;What's the concern? There is no cha=
nge required for older platforms, existing</div>
<div class=3D"ContentPasted1">&gt;&nbsp;user space code should continue to =
work. And this extension should be made</div>
<div class=3D"ContentPasted1">&gt;&nbsp;available for any new development b=
ecause the cache settings for BO's need</div>
<div class=3D"ContentPasted1">&gt;&nbsp;to be immutable. And that is platfo=
rm independent.</div>
<div class=3D"ContentPasted1">&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; For a precedent see I915_CONTEXT_PAR=
AM_SSEU and how it allows the</div>
<div class=3D"ContentPasted1">&gt;&gt; extension only on Gen11 and only for=
 a very specific usecase (see</div>
<div class=3D"ContentPasted1">&gt;&gt; restrictions in set_sseu() and i915_=
gem_user_to_context_sseu()).</div>
<div class=3D"ContentPasted1">&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; Regards,</div>
<div class=3D"ContentPasted1">&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; Tvrtko</div>
<div class=3D"ContentPasted1">&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; The IGT test related to this cha=
nge is</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; igt@gem_create@create-ext-set-pa=
t</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; Signed-off-by: Fei Yang &lt;fei.=
yang@intel.com&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; Cc: Chris Wilson &lt;chris.p.wil=
son@linux.intel.com&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; Cc: Matt Roper &lt;matthew.d.rop=
er@intel.com&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; Cc: Andi Shyti &lt;andi.shyti@li=
nux.intel.com&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; Reviewed-by: Andi Shyti &lt;andi=
.shyti@linux.intel.com&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; Acked-by: Jordan Justen &lt;jord=
an.l.justen@intel.com&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; Tested-by: Jordan Justen &lt;jor=
dan.l.justen@intel.com&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; Acked-by: Carl Zhang &lt;carl.zh=
ang@intel.com&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; Tested-by: Lihao Gu &lt;lihao.gu=
@intel.com&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; ---</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; &nbsp; drivers/gpu/drm/i915/gem/=
i915_gem_create.c | 36 +++++++++++++++++++</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; &nbsp; drivers/gpu/drm/i915/gem/=
i915_gem_object.c | &nbsp;6 ++++</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; &nbsp; include/uapi/drm/i915_drm=
.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 41 ++++++++++++=
++++++++++</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; &nbsp; 3 files changed, 83 inser=
tions(+)</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; diff --git a/drivers/gpu/drm/i91=
5/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c</div>
&gt;&gt;&gt; index bfe1dbda4cb7..644a936248ad 100644
<div class=3D"ContentPasted2">&gt;&gt;&gt; --- a/drivers/gpu/drm/i915/gem/i=
915_gem_create.c</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; +++ b/drivers/gpu/drm/i915/gem/i=
915_gem_create.c</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; @@ -245,6 +245,7 @@ struct creat=
e_ext {</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;unsig=
ned int n_placements;</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;unsig=
ned int placement_mask;</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;unsig=
ned long flags;</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; + &nbsp; &nbsp; unsigned int pat=
_index;</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; &nbsp; };</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; &nbsp; static void repr_placemen=
ts(char *buf, size_t size,</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; @@ -394,11 +395,39 @@ static int=
 ext_set_protected(struct i915_user_extension __user *base, void *data</div=
>
<div class=3D"ContentPasted2">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;retur=
n 0;</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; +static int ext_set_pat(struct i=
915_user_extension __user *base, void *data)</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; +{</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; + &nbsp; &nbsp; struct create_ex=
t *ext_data =3D data;</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; + &nbsp; &nbsp; struct drm_i915_=
private *i915 =3D ext_data-&gt;i915;</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; + &nbsp; &nbsp; struct drm_i915_=
gem_create_ext_set_pat ext;</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; + &nbsp; &nbsp; unsigned int max=
_pat_index;</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; + &nbsp; &nbsp; BUILD_BUG_ON(siz=
eof(struct drm_i915_gem_create_ext_set_pat) !=3D</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;offsetofend(struct drm_i915_gem_create_ext_=
set_pat, rsvd));</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; + &nbsp; &nbsp; if (copy_from_us=
er(&amp;ext, base, sizeof(ext)))</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; return -EFAULT;</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; + &nbsp; &nbsp; max_pat_index =
=3D INTEL_INFO(i915)-&gt;max_pat_index;</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; + &nbsp; &nbsp; if (ext.pat_inde=
x &gt; max_pat_index) {</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; drm_dbg(&amp;i915-&gt;drm, &quot;PAT index is invalid: %u\n&quo=
t;,</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ext.pat_index);</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; return -EINVAL;</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; + &nbsp; &nbsp; }</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; + &nbsp; &nbsp; ext_data-&gt;pat=
_index =3D ext.pat_index;</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; + &nbsp; &nbsp; return 0;</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; +}</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt; +</div>
&gt;&gt;&gt; &nbsp; static const i915_user_extension_fn create_extensions[]=
 =3D {
<div class=3D"ContentPasted3">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;[I915=
_GEM_CREATE_EXT_MEMORY_REGIONS] =3D ext_set_placements,</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;[I915=
_GEM_CREATE_EXT_PROTECTED_CONTENT] =3D ext_set_protected,</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; + &nbsp; &nbsp; [I915_GEM_CREATE=
_EXT_SET_PAT] =3D ext_set_pat,</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; &nbsp; };</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; +#define PAT_INDEX_NOT_SET &nbsp=
; &nbsp;0xffff</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; &nbsp; /**</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; &nbsp; &nbsp;* i915_gem_create_e=
xt_ioctl - Creates a new mm object and returns a handle to it.</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; &nbsp; &nbsp;* @dev: drm device =
pointer</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; @@ -418,6 +447,7 @@ i915_gem_cre=
ate_ext_ioctl(struct drm_device *dev, void *data,</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (a=
rgs-&gt;flags &amp; ~I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS)</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;return -EINVAL;</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; + &nbsp; &nbsp; ext_data.pat_ind=
ex =3D PAT_INDEX_NOT_SET;</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;ret =
=3D i915_user_extensions(u64_to_user_ptr(args-&gt;extensions),</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; create_extensions,</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; ARRAY_SIZE(create_extensions),</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; @@ -454,5 +484,11 @@ i915_gem_cr=
eate_ext_ioctl(struct drm_device *dev, void *data,</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (I=
S_ERR(obj))</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;return PTR_ERR(obj);</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; + &nbsp; &nbsp; if (ext_data.pat=
_index !=3D PAT_INDEX_NOT_SET) {</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; i915_gem_object_set_pat_index(obj, ext_data.pat_index);</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; /* Mark pat_index is set by UMD */</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; obj-&gt;pat_set_by_user =3D true;</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; + &nbsp; &nbsp; }</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; +</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;retur=
n i915_gem_publish(obj, file, &amp;args-&gt;size, &amp;args-&gt;handle);</d=
iv>
<div class=3D"ContentPasted3">&gt;&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; diff --git a/drivers/gpu/drm/i91=
5/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; index 46a19b099ec8..97ac6fb37958=
 100644</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; --- a/drivers/gpu/drm/i915/gem/i=
915_gem_object.c</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; +++ b/drivers/gpu/drm/i915/gem/i=
915_gem_object.c</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; @@ -208,6 +208,12 @@ bool i915_g=
em_object_can_bypass_llc(struct drm_i915_gem_object *obj)</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (!=
(obj-&gt;flags &amp; I915_BO_ALLOC_USER))</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;return false;</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; + &nbsp; &nbsp; /*</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp;* Always f=
lush cache for UMD objects at creation time.</div>
<div class=3D"ContentPasted3">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp;*/</div>
&gt;&gt;&gt; + &nbsp; &nbsp; if (obj-&gt;pat_set_by_user)
<div class=3D"ContentPasted4">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; return true;</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; +</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;/*</d=
iv>
<div class=3D"ContentPasted4">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * EH=
L and JSL add the 'Bypass LLC' MOCS entry, which should make it</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * po=
ssible for userspace to bypass the GTT caching bits set by the</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; diff --git a/include/uapi/drm/i9=
15_drm.h b/include/uapi/drm/i915_drm.h</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; index f31dfacde601..4083a23e0614=
 100644</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; --- a/include/uapi/drm/i915_drm.=
h</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; +++ b/include/uapi/drm/i915_drm.=
h</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; @@ -3679,9 +3679,13 @@ struct dr=
m_i915_gem_create_ext {</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; *</d=
iv>
<div class=3D"ContentPasted4">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * Fo=
r I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * st=
ruct drm_i915_gem_create_ext_protected_content.</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp;*</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp;* For I915=
_GEM_CREATE_EXT_SET_PAT usage see</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp;* struct d=
rm_i915_gem_create_ext_set_pat.</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; */</=
div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; &nbsp; #define I915_GEM_CREATE_E=
XT_MEMORY_REGIONS 0</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; &nbsp; #define I915_GEM_CREATE_E=
XT_PROTECTED_CONTENT 1</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; +#define I915_GEM_CREATE_EXT_SET=
_PAT 2</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;__u64=
 extensions;</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; &nbsp; };</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; @@ -3796,6 +3800,43 @@ struct dr=
m_i915_gem_create_ext_protected_content {</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;__u32=
 flags;</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; &nbsp; };</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; +/**</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; + * struct drm_i915_gem_create_e=
xt_set_pat - The</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; + * I915_GEM_CREATE_EXT_SET_PAT =
extension.</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; + *</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; + * If this extension is provide=
d, the specified caching policy (PAT index) is</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; + * applied to the buffer object=
.</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; + *</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; + * Below is an example on how t=
o create an object with specific caching policy:</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; + *</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; + * .. code-block:: C</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; + *</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; + * &nbsp; &nbsp; &nbsp;struct d=
rm_i915_gem_create_ext_set_pat set_pat_ext =3D {</div>
<div class=3D"ContentPasted4">&gt;&gt;&gt; + * &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;.base =3D { .name =3D I915_GEM_CREATE_EXT_SET_PAT },</d=
iv>
&gt;&gt;&gt; + * &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.pat_index=
 =3D 0,
<div class=3D"ContentPasted5">&gt;&gt;&gt; + * &nbsp; &nbsp; &nbsp;};</div>
<div class=3D"ContentPasted5">&gt;&gt;&gt; + * &nbsp; &nbsp; &nbsp;struct d=
rm_i915_gem_create_ext create_ext =3D {</div>
<div class=3D"ContentPasted5">&gt;&gt;&gt; + * &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;.size =3D PAGE_SIZE,</div>
<div class=3D"ContentPasted5">&gt;&gt;&gt; + * &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;.extensions =3D (uintptr_t)&amp;set_pat_ext,</div>
<div class=3D"ContentPasted5">&gt;&gt;&gt; + * &nbsp; &nbsp; &nbsp;};</div>
<div class=3D"ContentPasted5">&gt;&gt;&gt; + *</div>
<div class=3D"ContentPasted5">&gt;&gt;&gt; + * &nbsp; &nbsp; &nbsp;int err =
=3D ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &amp;create_ext);</div>
<div class=3D"ContentPasted5">&gt;&gt;&gt; + * &nbsp; &nbsp; &nbsp;if (err)=
 ...</div>
<div class=3D"ContentPasted5">&gt;&gt;&gt; + */</div>
<div class=3D"ContentPasted5">&gt;&gt;&gt; +struct drm_i915_gem_create_ext_=
set_pat {</div>
<div class=3D"ContentPasted5">&gt;&gt;&gt; + &nbsp; &nbsp; /** @base: Exten=
sion link. See struct i915_user_extension. */</div>
<div class=3D"ContentPasted5">&gt;&gt;&gt; + &nbsp; &nbsp; struct i915_user=
_extension base;</div>
<div class=3D"ContentPasted5">&gt;&gt;&gt; + &nbsp; &nbsp; /**</div>
<div class=3D"ContentPasted5">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp;* @pat_ind=
ex: PAT index to be set</div>
<div class=3D"ContentPasted5">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp;* PAT inde=
x is a bit field in Page Table Entry to control caching</div>
<div class=3D"ContentPasted5">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp;* behavior=
s for GPU accesses. The definition of PAT index is</div>
<div class=3D"ContentPasted5">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp;* platform=
 dependent and can be found in hardware specifications,</div>
<div class=3D"ContentPasted5">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp;*/</div>
<div class=3D"ContentPasted5">&gt;&gt;&gt; + &nbsp; &nbsp; __u32 pat_index;=
</div>
<div class=3D"ContentPasted5">&gt;&gt;&gt; + &nbsp; &nbsp; /** @rsvd: reser=
ved for future use */</div>
<div class=3D"ContentPasted5">&gt;&gt;&gt; + &nbsp; &nbsp; __u32 rsvd;</div=
>
<div class=3D"ContentPasted5">&gt;&gt;&gt; +};</div>
<div class=3D"ContentPasted5">&gt;&gt;&gt; +</div>
<div class=3D"ContentPasted5">&gt;&gt;&gt; &nbsp; /* ID of the protected co=
ntent session managed by i915 when PXP is active */</div>
<div class=3D"ContentPasted5">&gt;&gt;&gt; &nbsp; #define I915_PROTECTED_CO=
NTENT_DEFAULT_SESSION 0xf</div>
<div class=3D"ContentPasted5">&gt;&gt;&gt;</div>
<br>
</div>
</body>
</html>

--_000_BYAPR11MB25678E7C7741B66CC439816C9A52ABYAPR11MB2567namp_--
