Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F16B984BEDC
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 21:44:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE6A10E1D8;
	Tue,  6 Feb 2024 20:44:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YbWXwVgl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91548112E1E;
 Tue,  6 Feb 2024 20:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707252257; x=1738788257;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YHqMqGqi/VT+Tv8JUhNzyyoIDp5p4mEkaU2nWlVYAeI=;
 b=YbWXwVglYD5fSEWKLIbqwUsTF6RKvwXErRE9FGyToROKou4djuUH2i7f
 BRdPdFVy5pMxrIZRwj2QiBSUlUHRp0Rg0cQ8kqmz+Xa+C2qExsxjWs1nk
 GwKoSSrDbEzFF99us5S1cCryNZou8AzFaRwjvnJMgi9qSyNsZPEvE5AOk
 XYIM9e1eEITka8wyyH9s1DwPHOJnJEjRizZwZMgxwPtwbhSNYoR0xt8+x
 2E2TDlBTwQoLbJAJhGP0PQC5JUcbouV7UkJRKnFrjkEIwzLc6nHEJqE+g
 WyY0bIe6Yqi6JDiOlADXrIbyXEdLvikWj4zqQkirGA4pGXCUtLQZqW6Lc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="11483943"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; d="scan'208";a="11483943"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 12:44:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="5736560"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2024 12:44:12 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 12:44:11 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 12:44:11 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 12:44:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n2fY43vZD+f4LqTSQoH8Ce0DcS5AfLJ9JTv4q2aBEzJxgJlkqOibEC2M+8jpC/rrv3XkPwyiW8pbHmQHTKhGPD1qVOb3Ii7NnSCsxHiQMEUZjgg3N9Zv4wFvEV7NGHv24FRFqSfX0weV3/zLutKubRo/LROTaqcvRACH4D5J+27U4iSKFHOQY1bj8w6NHGBDz67+s3IMLXMQj6oYuRseZViFqw853e59Y5Wkj25KaoQ/x1cBIpLRTmLnbPtZb9UxwMMwS6WXHhJ8PnGli2OADgUR6+t7AM+75qcbNeVUvxddKB8o5WIT45urRZX3p+wK6jHA5q5Cq2HzkqL0u2CtCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AcpRCXs2x1kN160arQj3BYnjZJutQ9Q5DZQxe4SHJzE=;
 b=gWO7HFaSq6L1V9gzwHKXBASAv3YwgCNoPdd0RkZ8RyjEboA32Wli3AruYH48iLohhlJiQlHTkGA1Ini8QBDniRMV/nmcllaXT/XvhDq8qsOcqBYXPlPGK0uLynpqsKJA5bGhSQ8J7eJD4/CVbTwLZZquKemnhXXb7shkAP2cy+uL9jpQHr2dV+R6IbwcIrAM3m1nGxAZDKDMGM+dM//px0ZMOCN4MQR9SPnjwE5Srwh06KqfhejNTqYNOxu6AIlvUU4FyO6CY7zi9rXqZtlk1TVxTaUMNBj751PiD5CXFh05iwSHppshNb9aFnecHZwHDyQdQRoPMiUZuhHSLilUxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 20:44:10 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d%7]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 20:44:10 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 14/19] drm/i915/dp: Compute DP tunel BW during encoder
 state computation
Thread-Topic: [PATCH 14/19] drm/i915/dp: Compute DP tunel BW during encoder
 state computation
Thread-Index: AQHaTecd+5eniDsr9ESGAUQJHzX9KrD93ouA
Date: Tue, 6 Feb 2024 20:44:09 +0000
Message-ID: <DM4PR11MB6360A17AA5BCE2F25FD899A2F4462@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
 <20240123102850.390126-15-imre.deak@intel.com>
In-Reply-To: <20240123102850.390126-15-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|SJ0PR11MB5087:EE_
x-ms-office365-filtering-correlation-id: 1c70ede1-7acc-4acb-a1a3-08dc27545eb8
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zObgbCuM4cYccOllmTM6oyR7PnxL6BPP0VIOK8bmNbeNk8Qn56HiGXgJPgHHCIJaXVXCqI2xPPIHq/CwciGmVF9xRx4UH8p6PcUbFTNSJl0ASEh6DLU+vqfQYlZj+7qZ60dXWmF0oWYnMo9E27x43+F+T/jjR40C8OEIhDYsYD9baxba7ugg4cxfq5GHJsnTbPkqd30E8GqSpsrdpBje0hE4hRMtyQluxrH5pRVMLxjO7rk99NX86CoxxRQ2cEnU8gfowoD7hvk3lzz7tJw2NkTlY7klrCu8cei62F3U2Vcvr1A4CZIOrn7OpvjZk2ITXdri27k3m/P/L2bU4ejkE05ou2+CE7a0I/moqc/qN594X2xjWnyKxG6lKcA9xNvAT1ubxMhlfijjVSTseos4K6y4E2Kbfazl+WMIZ5JSrpbTjRsdArHI6nDekRegHmDI9gILCS7QKtQJ4+XyjwFoYDS38T4FSY9gEXx+FsOr7JclHjgxm5ONLqD7PzonvEXQ09oozvwPnttvCv0o394lG13tuTlyINBtGEMfntVF0EOr1YZzCBIgKFfl3RCQ7PeKk6lwCqqpdT1hQIAtqy4kLyJw18IDDP8wKvCuSDLTzriojUlGq1m9VHXXAk+A9tE0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(136003)(346002)(366004)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(38100700002)(82960400001)(33656002)(53546011)(6506007)(83380400001)(7696005)(122000001)(55016003)(86362001)(26005)(41300700001)(52536014)(4326008)(8676002)(8936002)(9686003)(71200400001)(478600001)(2906002)(5660300002)(64756008)(66446008)(38070700009)(450100002)(66946007)(66476007)(316002)(66556008)(110136005)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Pt+2eom9A9gCV/9ytKKGdfbVruC2OHc024ZDS6SIdl7lNUiiQiAhSgVhLuMv?=
 =?us-ascii?Q?9gND9fkVYuPusTQtg5a4p33xCnM67O/JG19kiFLskvZGtAEmW9fRS19noBlR?=
 =?us-ascii?Q?cocpS/5ogdAn43GP1uvxxgzNPN4ND++SC7kypXXNah31Vq+F7FkLcVWFJqpX?=
 =?us-ascii?Q?q0WyIBuONas4z5I5jRiLsNgFFJWSG9/wigRF0f3ChPBzKkHLSS5BaTGs2ZSw?=
 =?us-ascii?Q?kgdmUKk2qHxhbNHZzYKOr3m9gPWch5kRuZPIw7DUWyeuZ7OFRr18xEk9rRC5?=
 =?us-ascii?Q?wtYvlWayuzwxjCdeZQ9cgekBR+HjvIwnvz/9gYSmBMnQ1MDjZEiBG5zBw9lI?=
 =?us-ascii?Q?ZZZTY5vQL8KLmq7Nuq9mPpXDchQ2QN5rYzoQ4BFUSLFXsZ6S0RFX4C3/kNw6?=
 =?us-ascii?Q?qpEteJhiKO/qcvGcpIVetVUtjI7qMc8gJVXH5rdDa7OLLjWxoQGoLtXF520F?=
 =?us-ascii?Q?5ktRqdo7ijKXexvOT9xhMZOc62J+IgukLDJ6SuRLKsR2HHssStfmNNr7hnoi?=
 =?us-ascii?Q?QA8DT+X7Zkmxr8cmFLm60mCvBKLh8RM0UcodAKkWBGie1BmKhd5nHSWHEAhs?=
 =?us-ascii?Q?A6KBegDp357rB2jb4k0a0rq5W1Ky52uGwiVT0h0zhWKEf64gVDPYxF5aX2av?=
 =?us-ascii?Q?qHS9pBbChMG7Qw7TQoAwynNBg6AhXqSwwwjN+H5qqz0CkMcJ8JRkrNF2aPyN?=
 =?us-ascii?Q?cnTt+3Cgwkcwi51GA+EtKZv8a247GgkDsiFyyHjzjsQC7UvKDVw4Z7sskrJY?=
 =?us-ascii?Q?Jmn/7N9nTJAOw6x04d9PmoWLBA9qIjAeSozGJfGLtz4DJ6NVfmlG7m/fLT86?=
 =?us-ascii?Q?uC7YiPeA9rV0hUYj7zMKVUv+PUrctbcl+UNBgth+gxcUEwvuoMEuCjuBh43/?=
 =?us-ascii?Q?2TW2rS4G+Xjo072ndDfb5hTfhEU9BUux6EZDvMvbG2hCGF5UnKECrmgw4bTn?=
 =?us-ascii?Q?WYBSlpkMzXMBWgaKYxF64sVSrDFlwqLARGyi4uNXa5lo991qR84yeNTrtoI4?=
 =?us-ascii?Q?nfr4L/r5zhTfczfrq+/NOqOFDeHJaoUdMQwermEVWrJNxMmr8vDbktBD1tcL?=
 =?us-ascii?Q?XECumuZVwfmB1hhzG4J8LDMQssHwtSesOrhSd5lG591VStzGJnTkV+rRT/E/?=
 =?us-ascii?Q?k+KCu6utLgPh2Es2HKsbIEPRiB0glitXCdPL8wZYVdQ482Vz5ZB2sa1QUMXD?=
 =?us-ascii?Q?H8g3m0cqB+F6HETUXx/IwKjIOlp0NQli0PHskV68doV+/hTk6OOj17ds7ZYU?=
 =?us-ascii?Q?cLqp3wCd2b1qbq6gJT4y78phRQ1xBO5bl2gY8GubBD8YYs/Na+oKvrU60MrI?=
 =?us-ascii?Q?U4Zt70zulHTYl/gRdzUoe4r9m7z4m44uHZR3Tu0SqxWe8OVXsiuKsPkTWhUH?=
 =?us-ascii?Q?ESe1kRnQe3KR37fDJQk7eEO0tQCaZmi2/ZAE6PLxT+QXR5uDDExe2Djhyiqj?=
 =?us-ascii?Q?kVhfoSpEqRg65sEvzHIs8ak7qc4BMufv2UoIZxIX2pwG7XIIMphDVsvbd6Cw?=
 =?us-ascii?Q?Y4Ls8vn8OooC7ochN83iG0pdNQeP98Izv+ETtxRZO29jeoH+bAC0Ew0XoGb2?=
 =?us-ascii?Q?TGo+KDN9gwOcXZsN/q4hyloybo4zmMbQ5iEdMnIY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c70ede1-7acc-4acb-a1a3-08dc27545eb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 20:44:09.9411 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 89SIRSjsLgW0H6mcGcJm3pMV8bTjppPnRI1EQLhoiGDttnKCXUFAwZv9lYDvmcjCihqRQ84HJkFOc3tx4sJfRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Im=
re
> Deak
> Sent: Tuesday, January 23, 2024 3:59 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Subject: [PATCH 14/19] drm/i915/dp: Compute DP tunel BW during encoder st=
ate
> computation
>=20
> Compute the BW required through a DP tunnel on links with such tunnels
> detected and add the corresponding atomic state during a modeset.

Looks good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c     | 16 +++++++++++++---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 13 +++++++++++++
>  2 files changed, 26 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 78dfe8be6031d..6968fdb7ffcdf 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2880,6 +2880,7 @@ intel_dp_compute_config(struct intel_encoder
> *encoder,
>  			struct drm_connector_state *conn_state)  {
>  	struct drm_i915_private *dev_priv =3D to_i915(encoder->base.dev);
> +	struct intel_atomic_state *state =3D
> +to_intel_atomic_state(conn_state->state);
>  	struct drm_display_mode *adjusted_mode =3D &pipe_config-
> >hw.adjusted_mode;
>  	struct intel_dp *intel_dp =3D enc_to_intel_dp(encoder);
>  	const struct drm_display_mode *fixed_mode; @@ -2980,6 +2981,9 @@
> intel_dp_compute_config(struct intel_encoder *encoder,
>  	intel_dp_compute_vsc_sdp(intel_dp, pipe_config, conn_state);
>  	intel_dp_compute_hdr_metadata_infoframe_sdp(intel_dp, pipe_config,
> conn_state);
>=20
> +	intel_dp_tunnel_atomic_compute_stream_bw(state, intel_dp, connector,
> +						 pipe_config);
> +
>  	return 0;
>  }
>=20
> @@ -6087,6 +6091,15 @@ static int intel_dp_connector_atomic_check(struct
> drm_connector *conn,
>  			return ret;
>  	}
>=20
> +	if (!intel_connector_needs_modeset(state, conn))
> +		return 0;
> +
> +	ret =3D intel_dp_tunnel_atomic_check_state(state,
> +						 intel_dp,
> +						 intel_conn);
> +	if (ret)
> +		return ret;
> +
>  	/*
>  	 * We don't enable port sync on BDW due to missing w/as and
>  	 * due to not having adjusted the modeset sequence appropriately.
> @@ -6094,9 +6107,6 @@ static int intel_dp_connector_atomic_check(struct
> drm_connector *conn,
>  	if (DISPLAY_VER(dev_priv) < 9)
>  		return 0;
>=20
> -	if (!intel_connector_needs_modeset(state, conn))
> -		return 0;
> -
>  	if (conn->has_tile) {
>  		ret =3D intel_modeset_tile_group(state, conn->tile_group->id);
>  		if (ret)
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 520393dc8b453..cbfab3173b9ef 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -42,6 +42,7 @@
>  #include "intel_dp.h"
>  #include "intel_dp_hdcp.h"
>  #include "intel_dp_mst.h"
> +#include "intel_dp_tunnel.h"
>  #include "intel_dpio_phy.h"
>  #include "intel_hdcp.h"
>  #include "intel_hotplug.h"
> @@ -523,6 +524,7 @@ static int intel_dp_mst_compute_config(struct
> intel_encoder *encoder,
>  				       struct drm_connector_state *conn_state)  {
>  	struct drm_i915_private *dev_priv =3D to_i915(encoder->base.dev);
> +	struct intel_atomic_state *state =3D
> +to_intel_atomic_state(conn_state->state);
>  	struct intel_dp_mst_encoder *intel_mst =3D enc_to_mst(encoder);
>  	struct intel_dp *intel_dp =3D &intel_mst->primary->dp;
>  	const struct intel_connector *connector =3D @@ -619,6 +621,9 @@ static
> int intel_dp_mst_compute_config(struct intel_encoder *encoder,
>=20
>  	intel_psr_compute_config(intel_dp, pipe_config, conn_state);
>=20
> +	intel_dp_tunnel_atomic_compute_stream_bw(state, intel_dp, connector,
> +						 pipe_config);
> +
>  	return 0;
>  }
>=20
> @@ -876,6 +881,14 @@ intel_dp_mst_atomic_check(struct drm_connector
> *connector,
>  	if (ret)
>  		return ret;
>=20
> +	if (intel_connector_needs_modeset(state, connector)) {
> +		ret =3D intel_dp_tunnel_atomic_check_state(state,
> +							 intel_connector-
> >mst_port,
> +							 intel_connector);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	return drm_dp_atomic_release_time_slots(&state->base,
>  						&intel_connector->mst_port-
> >mst_mgr,
>  						intel_connector->port);
> --
> 2.39.2

