Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A14F675C620
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 13:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3597B10E661;
	Fri, 21 Jul 2023 11:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD8510E65C;
 Fri, 21 Jul 2023 11:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689940478; x=1721476478;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=37kpL1N9/q4EZkX57PNFRUwucmFY2Xa/V7hk4Xyyh90=;
 b=cc8dFs2rXFZngygDcUw6/SBtz4HLQHncbTay047UjiftJduKk1rOgzc2
 9kDBpkmxI5WQejXTY3wX2CqQApLVVWAdl3lwBpIMzQtuJSrsLqmvxHjKV
 U/AVw/Fnoimn0PxZIjr09IYIsfPyOdxxxKMByPlgWS+uMN8tXevB7PzAQ
 RxdP1oQnV1LhAnxSrRLij1UAq34URkS4oodgpTaTX8vqi2x/fAxKHZZMN
 CsGpMLg0acqQCfVfnw6NKryo+Ln7pWacWn8RjyUc86ZXHHEh2dUzYTF8a
 f11+qLxlfyTMG/V0Ro5MUWen1UU1FYnEy1rLSxYd20Sfu2i/xKtlRmasD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="346600495"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="346600495"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 04:54:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="794935238"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="794935238"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 21 Jul 2023 04:54:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 04:54:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 04:54:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 04:54:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 04:54:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2TOdjOKTBdLCQL/Fl0LTN/Q721p1Mp/aCDCtt/VcyIauUAAdD5WkG5FyliAP/uHBdNHlWixgH5RpQe77sjZCtKlr27GehRapb+8o5IqTELr2ydZAwS/U5Bn67KM6ZAm5ZP/7zNWHca6snL1g1iFcEoe7I/eeOnkMUTIJEmpROEOZYprgD7K37NxD82XfkAVP2sZGkDne4QrIbXTiM80R70NJh2lF30j7vGI1EfX90k/1Fb8byzw7D4xnBPDUVyDQXCI6T+L2sQ5Bds7lCeusCIwld/HlHhK4u64tkHHaQMlLFJcrBjolF81skzhGwL2cRyh++JpSCjX3ox9FEmqvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0yXl5bA0PEKn7biqR8jxHD7EmbQ7aG0lSP2iVYV+Qs=;
 b=cCtRcMh62uKMdxOc5oA21e+Ll0tZ6ciUoZHzaSsHT+jrwWdfGJ6X9PsKPhC85GpRsMvpsDiqGTG1SAavJK3eo4td2/Pz60NLvyqmb3Yr6Cv+u5rPTC19VSPbmM4tZhSHfDLlXuC2J7qKMFHet0f/nkd9rWFEiuWXJYH1DFDZCcAbA48kAhclsFpV2o7Q/0ZBd1/cnehCv2fgOGGOqdWt2zBynTshnw9FKGqdlc0dmxf2MtV9wRS2ZwXPNGGw+ALq24Lm9ldO66uwBDFhoGwa1ElEEh5+ofUyIxQrRZ7sAZ2E06p8LJsULDp2qmt0dcXvIaYX7ni3Bmi30Sd85G7Zfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB6445.namprd11.prod.outlook.com (2603:10b6:8:c6::11) by
 PH7PR11MB6954.namprd11.prod.outlook.com (2603:10b6:510:205::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.28; Fri, 21 Jul 2023 11:54:26 +0000
Received: from DS0PR11MB6445.namprd11.prod.outlook.com
 ([fe80::7a40:3f62:1e7a:5301]) by DS0PR11MB6445.namprd11.prod.outlook.com
 ([fe80::7a40:3f62:1e7a:5301%7]) with mapi id 15.20.6609.024; Fri, 21 Jul 2023
 11:54:25 +0000
From: "Krzysztofik, Janusz" <janusz.krzysztofik@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>, "Mika
 Kuoppala" <mika.kuoppala@linux.intel.com>, "Das, Nirmoy"
 <nirmoy.das@intel.com>, "Hajda, Andrzej" <andrzej.hajda@intel.com>, "Andi
 Shyti" <andi.shyti@linux.intel.com>
Subject: Re: [v7, 6/9] drm/i915/gt: Refactor intel_emit_pipe_control_cs() in a
 single function
Thread-Topic: [v7, 6/9] drm/i915/gt: Refactor intel_emit_pipe_control_cs() in a
 single function
Thread-Index: AQHZu8oYLgr7eDR+1kO0DtxXXgmsKA==
Date: Fri, 21 Jul 2023 11:54:25 +0000
Message-ID: <4521409.cEBGB3zze1@jkrzyszt-mobl2.ger.corp.intel.com>
References: <20230720210737.761400-7-andi.shyti@linux.intel.com>
In-Reply-To: <20230720210737.761400-7-andi.shyti@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB6445:EE_|PH7PR11MB6954:EE_
x-ms-office365-filtering-correlation-id: 552c4ae2-6064-4b24-b86e-08db89e13b31
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qjoWXEsyyqSV6RNd1jH+J1bRL+m+aINMn9G1OG+vId2GuH5kp8LDnZb2+StC1JaNbsQQh0ObNj9PyOqIOMWnzxm8gOIRrDaI1v1ZvnKX4jr7Y2cyHRRw37A8HfhFn9/2OhOF3OmkBrhMtNIPlZfdBkBfHSVgwF+ZnUtFBq8c/vmGg4inmsuHtHfCuzsM9csw0LD5bxqbMYSSOiv5djqhIiC8fpIoFRfZqCHi5PSeAxRR73MZj9Go3vIJwpThNoUJIPv10wm/FOJWpNtP+W0qG/ijxzZAERwUBtiF2HcyXQJbJp4YgVeo2DWKUqd+3ELoycQjdHby36YFdJwyslMl6krIhPcZ7SADce8sLGU02Px069rVluJw8jtVXHF0ZEGUpdjs3EFpLodnMQ1u9IqCl2d8lV+g7XGqCT+fFxpu4zoT5uNMnklEam8JX4DG+Q6H2a+5VUS5sxYjAzyjfnjNKA896uALliPE99d+nM/G/WWIZgdlirmTo95/e2IjLZgDSgu/JeFRDVw46vNfyI/HeccZDHb2AEzeIuGw0EVUuA178JaSgaI/LrArIQt4KfAbZtu/ZKayZixl6hndHdugquFKURg5x5WBTx426vjiSkdX6jbjbA3JszmawRnuMUMcTnNYb65aaZzF/vz8Vso930niQdc63J6ycC2+z8EmJ4s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(396003)(136003)(366004)(39860400002)(451199021)(83380400001)(66476007)(2906002)(8936002)(478600001)(8676002)(66946007)(76116006)(64756008)(41300700001)(91956017)(66556008)(54906003)(316002)(4326008)(110136005)(5660300002)(71200400001)(6506007)(26005)(186003)(6486002)(6512007)(66446008)(38070700005)(86362001)(122000001)(921005)(38100700002)(82960400001)(39026012);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Y5fUAp0Zd9p/MyZd38c6MU8H5dSVgHsl8zRJmXNhGNOUHH5IdjJRGQVbfFmS?=
 =?us-ascii?Q?f21M+9ggRft1s5TPt/adOtStRxC5cczBBEKwq9vko8OK/makN+vWBQUZuKKm?=
 =?us-ascii?Q?oZk1rHOIdsjECLw2G3p0dZCfMfmzpdjrh2wSrL4yR561FK9ejtUlRh9I/z/f?=
 =?us-ascii?Q?OH/S5cEkjdBYWsIoq1lwED7PWnHysk+3WP/sBennCImhxSDilKBsigfUaroV?=
 =?us-ascii?Q?prieVJ2rDqmO/l6AyR2EQ+9Nz8O0dstb1//qA6lgSkabpI4ePq6I6QpF3aZy?=
 =?us-ascii?Q?XSghdgXw3JOhFvQdXBD5Lxi8J2xmAIJ3B49TEpNJ1j4dNcQlhUv02+l4O31e?=
 =?us-ascii?Q?jIvzvTN8XzBb/vIO65CS0gqmb6ZB3GUnuTxAcYyhMoU8QFM0V4yaS57LD72b?=
 =?us-ascii?Q?ucKK9v8pb1rzpY3YYZ8irJavNCc83Wkgg2ssmbV8PEj1WMo7DgA+e6E7gTAh?=
 =?us-ascii?Q?n6IlPLp7BBgvPg2I1sDH02uudn3Feda0HqQaKZoUXHpmQzBBrDe9wmgKkMYW?=
 =?us-ascii?Q?empUvXPd2mJpiyKJ98yazsJrZ1SyYLYdb/oATWKq2mf+mfFFRhF9tkgLSvzh?=
 =?us-ascii?Q?2UpCjJJN68c9XhkNwV/inFX0ogPaSkqAdGEwLueWcJENDWXFfIRowxCM9xkV?=
 =?us-ascii?Q?erSGVWVoD0w7zYFan8lbZpzo3LjC9/Zmdjj/JOfnm9/EkB+Y+R2uMOBo0G23?=
 =?us-ascii?Q?gX6bqhumu+FmYTiyThr+kIW5CK/LPurCotoQB79fJjSmhyoM5hbNaGjR7cnR?=
 =?us-ascii?Q?b49Hp3fFgsO7jz2jY+OyOV1pHvAGmePyGDZmfB4b11I09V5Yuc9dMHoY4IOV?=
 =?us-ascii?Q?LUemAsSnj//Yvwukwn/OmCEjKbp4/MH6iEVxvNNmieJmuT31py8W57K6kC8E?=
 =?us-ascii?Q?tR1wO3PV3KJpOhn2lPrQ061eh3pU8DgEc77d4Vrbh/tH9H+gaq3tH3ivvY4x?=
 =?us-ascii?Q?XhWN02kcrSSv4+TaS7n3fcHnIGKb/Cgn/4RVGa5S2XoBILIfgbaQ6aGMm04b?=
 =?us-ascii?Q?2um4bxaIHPqcRSleRa3P7/+Uq1XKDCCojlOYAvstEMmi/DE2O9//Sn5s2xLr?=
 =?us-ascii?Q?NsCv7ULlM/hFsp6rGWA4C/nCKuTbOlrRRH40M5FxADhG5S4Vn+BQFi6L+VdO?=
 =?us-ascii?Q?o8uU3jVV/UDaLRPWpJ5rR2lLnL5way9h97+qRyw9f/14NP7YeNd9Jfr6+ayM?=
 =?us-ascii?Q?dsERZnMQdU91J80E6goSGqe2strqOynDUyuMzXhRK6ytmEqeyzOAryry1r4z?=
 =?us-ascii?Q?0+pVweYlfura7ghTWEzVmXvj5yFFthlsxjCVyKrmCc1nmMlNl8GtJsgKJ6Wk?=
 =?us-ascii?Q?Xh+pAaISLRahRg2S2jMSQoCJ4t0txQQL764TCi6siTEFpWPqT8Q8yhBHOmNB?=
 =?us-ascii?Q?yjbOIFqJxWsxi5mMlhfmGet+gwb+6ftccgcK2IVvdrBBQRrV7nZ0D0wOrQH3?=
 =?us-ascii?Q?pyRA/E074VzHVQbV1EcBdBEQ6yAWEjFOaotIqmlGn5sx2g/yAMl8ci16uEps?=
 =?us-ascii?Q?Pq65/kDp/lV2CVn8VEOxCUmbXI5DMuN872IKBeu7I4YSHAab+2W4eC+jMgtv?=
 =?us-ascii?Q?cgZdm0dwCEUbh8pL7gLS2JlhjidVPxpAJ6jdmicgIZ3paEZq9zj6af2jr9At?=
 =?us-ascii?Q?qcJu/BBmwWI89UJqcibwlvI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BA0898F7D4832244BDAD2F595A08CA2B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 552c4ae2-6064-4b24-b86e-08db89e13b31
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2023 11:54:25.6407 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zNDUTf1W4pdtAiRG2wuM1g7BrHTCpw/0rAh6daaYcJddyLmLiSDbIgFGQDq+EFvW4OXoTovbgdEOnMBNdcvY9twG+AzC0Pr2a2MClCmknlI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6954
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: quoted-printable
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-evel <dri-devel@lists.freedesktop.org>,
 linux-stable <stable@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andi,

On Thursday, 20 July 2023 23:07:34 CEST Andi Shyti wrote:
> Just a trivial refactoring for reducing the number of code
> duplicate. This will come at handy in the next commits.
> =

> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+
> ---
>  drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 44 +++++++++++++-----------
>  1 file changed, 23 insertions(+), 21 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i=
915/gt/gen8_engine_cs.c
> index 9d050b9a19194..202d6ff8b5264 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -177,23 +177,31 @@ u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, =
u32 *cs, const i915_reg_t inv
>  	return cs;
>  }
>  =

> +static u32 *intel_emit_pipe_control_cs(struct i915_request *rq, u32 bit_=
group_0,
> +				       u32 bit_group_1, u32 offset)
> +{
> +	u32 *cs;
> +
> +	cs =3D intel_ring_begin(rq, 6);
> +	if (IS_ERR(cs))
> +		return cs;
> +
> +	cs =3D gen12_emit_pipe_control(cs, bit_group_0, bit_group_1,
> +				     LRC_PPHWSP_SCRATCH_ADDR);
> +	intel_ring_advance(rq, cs);
> +
> +	return cs;
> +}
> +
>  static int mtl_dummy_pipe_control(struct i915_request *rq)
>  {
>  	/* Wa_14016712196 */
>  	if (IS_MTL_GRAPHICS_STEP(rq->engine->i915, M, STEP_A0, STEP_B0) ||
> -	    IS_MTL_GRAPHICS_STEP(rq->engine->i915, P, STEP_A0, STEP_B0)) {
> -		u32 *cs;
> -
> -		/* dummy PIPE_CONTROL + depth flush */

NIT: Maybe you could keep that comment, above intel_emit_pipe_control_cs(..=
.).

Anyway, LGTM.

Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>


> -		cs =3D intel_ring_begin(rq, 6);
> -		if (IS_ERR(cs))
> -			return PTR_ERR(cs);
> -		cs =3D gen12_emit_pipe_control(cs,
> -					     0,
> -					     PIPE_CONTROL_DEPTH_CACHE_FLUSH,
> -					     LRC_PPHWSP_SCRATCH_ADDR);
> -		intel_ring_advance(rq, cs);
> -	}
> +	    IS_MTL_GRAPHICS_STEP(rq->engine->i915, P, STEP_A0, STEP_B0))
> +		intel_emit_pipe_control_cs(rq,
> +					   0,
> +					   PIPE_CONTROL_DEPTH_CACHE_FLUSH,
> +					   LRC_PPHWSP_SCRATCH_ADDR);
>  =

>  	return 0;
>  }
> @@ -210,7 +218,6 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32=
 mode)
>  		u32 bit_group_0 =3D 0;
>  		u32 bit_group_1 =3D 0;
>  		int err;
> -		u32 *cs;
>  =

>  		err =3D mtl_dummy_pipe_control(rq);
>  		if (err)
> @@ -244,13 +251,8 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u3=
2 mode)
>  		else if (engine->class =3D=3D COMPUTE_CLASS)
>  			bit_group_1 &=3D ~PIPE_CONTROL_3D_ENGINE_FLAGS;
>  =

> -		cs =3D intel_ring_begin(rq, 6);
> -		if (IS_ERR(cs))
> -			return PTR_ERR(cs);
> -
> -		cs =3D gen12_emit_pipe_control(cs, bit_group_0, bit_group_1,
> -					     LRC_PPHWSP_SCRATCH_ADDR);
> -		intel_ring_advance(rq, cs);
> +		intel_emit_pipe_control_cs(rq, bit_group_0, bit_group_1,
> +					   LRC_PPHWSP_SCRATCH_ADDR);
>  	}
>  =

>  	if (mode & EMIT_INVALIDATE) {
> =


---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydz=
ial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-31=
6 | Kapital zakladowy 200.000 PLN.
Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu usta=
wy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w trans=
akcjach handlowych.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata=
 i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wi=
adomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiek=
olwiek przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the s=
ole use of the intended recipient(s). If you are not the intended recipient=
, please contact the sender and delete all copies; any review or distributi=
on by others is strictly prohibited.

