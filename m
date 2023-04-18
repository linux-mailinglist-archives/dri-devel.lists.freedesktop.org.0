Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BA96E5887
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 07:27:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0607310E689;
	Tue, 18 Apr 2023 05:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30FB910E041;
 Tue, 18 Apr 2023 05:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681795645; x=1713331645;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IZ0AzuvjhhdPgyp7i/0MNZchb8pOkhalz84gccsf1GY=;
 b=PRlfxeccDoIDwVOHFUAazsQe7VLPNCGrvInRWt0KTWxJ8SkmlQqY7ExZ
 3PFTWJPq7QFlUmkNKdpICoSeQz0DsBE/QEtqZfaFcWquQUws1uDBSrtjn
 krFlfJ4g3zhvCViXvF2ALUyNSKTjj9UppXdRAb59Ho6DIEEQOj1ZTixoA
 W3wv6KxPFnzElu9YBdqo9DgEf0SBzrvGWB52tMso1s4DHil4fms2IiOPZ
 t/rIIIppjDluXV4xt9yZZnVXn6ZRqr4zaK8KrSnAnX/s2uBW36eb8ADTv
 cXQZTr0Ez0tzrvRaeZ+IdfQfoEGrIYEQ71ghq2TyPyyzgmcXTlU67fZka Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="343831887"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; d="scan'208";a="343831887"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 22:27:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="723507772"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; d="scan'208";a="723507772"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 17 Apr 2023 22:27:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 22:27:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 17 Apr 2023 22:27:23 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 17 Apr 2023 22:27:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rz4P7/cZbQJMtkeZNEriFfCBYvUGOPWu8jp47KFPs6JXcQEok+/k6jT05WGHcz+vlaRDEXe+kEZSSy/RFhjeQx3gqzxOc2tNE34WUjG2Ym8RxJ4C72waQiNNU0YOVeZnJl734/uAftKqJSsOrcfD3xeg6z9X2qUaZ1pgJZAbpExJjbrTXxOkBs2p+c4MjYB5TYIzNDnQv8XP8pEXX5Pj15k9pRbvFuvwC9BqZUzyOpRdrXJ4soc+QxtI9j7279sJApEzzApHIprmv1n43II+ItkquQpK1fbvZyAYntVhRTmCp1jbjGvHiKljk4Hm24L6DMHJblDQVJebYnQ5mkOUKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7Tkv3uuB5d6fH4k4dwQ6IP67oA7RMJoVXXzIT6C7Mo=;
 b=AEAvW8iZT/O2W1gpffn3LTq3+1KGwdwYwKpt+afVjnCeWEKgk/oYi9GZQS+9hMk4X73h1v1A7a8wlWyXxaL+mDDTkxPTRyQX21DV39w/ZbTq8I7Tq8RTDQRu5c96hIufXGSb2w6PbjbzoOD+F1WyTIslJPsSDBD6UrT1PV+WNxoIsuBL5vZWvEX1h8mvkHA12PUPVyDmtDSQCXqoQcLlduySYuhXpeHFNuybLn738t2BswW6vLfGeJ9urgOg/DpXi9EhtAs80m8M2ZqOynMJ1uusQAZ5FH9/7CwG8ZWnRe4tJOhSDNntFPXB2ZghkJDA4AN3InQ53VhwO3mu/VlrSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by MN2PR11MB4677.namprd11.prod.outlook.com (2603:10b6:208:24e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 05:27:18 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3541:e31b:6f64:d993]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3541:e31b:6f64:d993%9]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 05:27:18 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Mark Yacoub <markyacoub@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: RE: [PATCH v9 01/10] drm/hdcp: Add drm_hdcp_atomic_check()
Thread-Topic: [PATCH v9 01/10] drm/hdcp: Add drm_hdcp_atomic_check()
Thread-Index: AQHZbKrjPZ9kALUbhUy+kaVxTME/d68wkN2g
Date: Tue, 18 Apr 2023 05:27:17 +0000
Message-ID: <SN7PR11MB6750FAC866C29F298B1690F6E39D9@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20230411192134.508113-1-markyacoub@google.com>
 <20230411192134.508113-2-markyacoub@google.com>
In-Reply-To: <20230411192134.508113-2-markyacoub@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|MN2PR11MB4677:EE_
x-ms-office365-filtering-correlation-id: e8a6eedf-e01b-4871-ec01-08db3fcd938e
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LnlfmJMoDoXkma3Vbiw5sxcmeRWi9MZaUgbnSURGqmDgZ5KdnuZcC86Cl55/yhLnFGYG9758NubodKW/wTw3f26zVtU2rXnPNs4XCdhQM3vX/16JLkUyzDuMuXKooEerhuGegewb6BxZYWv8kbIZMEk76u+RoAHci52FySZU6R9GJWeJh0vkPP0SYeVJ58xWoFPCPT/9rC3xlmKyYSKsCuhCwEAwAiO179YJLNfW7W9bavvX0rRGAr86vste6BT0DCUL0vTs4Kgt7OL+qcShVci3N9z6Y9s2NaPhEhRgAxvxYL14bjNaOQ45wDPV0v0j6ZmTNkRRj6am3VXTrLZljmUPFrrwATA8LV4I6xUbjwP32EZ5lMoqwJSPOFW7O6IplaJcLZe1kLqs/ohVoPL6B635MqJZ08qrMdnyv0rbTIJebK+BLcn1Qiqlc/lR1EguqgtlE7SJ1jwLYH55m2pSPqNGuAyPZLwSIksCkBy3kPN2rBz55xJwIvLAK8RtEKc39+n2XA/pE4wQChAnklWOLcSwZeCg5bgF75wbmhUCbYtHFy276+679JDhfLssRUHGs2qdCpDS+46BhsPEatxf1p9vp+d/OVNAX0j6QbwupS+aIKkpEiJhINaZTT0shU/z
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(376002)(39860400002)(136003)(346002)(451199021)(54906003)(110136005)(55016003)(7696005)(71200400001)(478600001)(83380400001)(82960400001)(316002)(41300700001)(64756008)(4326008)(66556008)(186003)(66446008)(9686003)(6506007)(26005)(76116006)(66476007)(66946007)(5660300002)(7416002)(2906002)(8936002)(38100700002)(8676002)(38070700005)(122000001)(33656002)(86362001)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KgFgG54gMOHFx/v/pybB7eRDGnjlGq+5ThMnJkCKlmJKZMAP8KBio6wSfMkr?=
 =?us-ascii?Q?PXNBsB66XYcW95llx07eFf3fC26nwNnRhD0qY1HnjQzBT7aB1yKYzXt41aNd?=
 =?us-ascii?Q?WDD6OuO1lVElXLi/vgfw/D2n6AukaLSv7g3SGkOPYzUZsLlj0fYxtaSyzfCh?=
 =?us-ascii?Q?9tWt/rGqJBzV+wslwTHMDXKwDfOrCCvmGNik/nr7hVJFc8fGXs4Bg6uA45iT?=
 =?us-ascii?Q?v8TZqGjOD189Vns9DN29c5iQS1m47lXCyBW4LNgRltSccOIIcO3j1twoHgQ4?=
 =?us-ascii?Q?QutKIsREcTOlMRLSo2X+y6Ma97hcgigFsc1O9eLUTT/n6wRdfQrHDdcXlTWA?=
 =?us-ascii?Q?ujSui4NxPH6fWc7xb8cJAi6x1+zc7xBKG5VeF0gngNEfU80zVnqwLBRQGd0W?=
 =?us-ascii?Q?Jld65ZZcAKlifnPHUyDmPhhXvQdZdgk+Rofek2NKaQCTtPSYu+38GYiDL0Ly?=
 =?us-ascii?Q?6yiIauK+/9zUOwyN0bXahy4sATJCgb0n98fVhy2Sc0waUrYLaQJ5zfa8qA5Y?=
 =?us-ascii?Q?2ot+HVJUfNuAYDI6QAn+8yBndc2N2qDl9az+qMYw7uACySzwpQyiyuERVOOZ?=
 =?us-ascii?Q?l4Injl22lXX4QoZhtKkqFpRH9r39BKo2Nzbmh/KqgycrUqhFPf85IUDM2+vv?=
 =?us-ascii?Q?hJ89cx1bs2wsq6lr0G4Y8PjXCawELZV6RZgX6ZmuQ7Xd7Pc8VovXvn+yzf6e?=
 =?us-ascii?Q?/AEbIgwTj82IKg1wzFEJVDjN1/avZWS5/YL2y9n43Pf+ZuKsl6f1IA6dpXON?=
 =?us-ascii?Q?Jx/NS8q6BwSY+MawTdQHovM8IvkcRHNukx///mPohVFrUozMPw9HVkFmmOe7?=
 =?us-ascii?Q?dFNoPgx4LoME2P1Lz5LdAuBWmpiMsFPd8yjOGZKe6vq9Xxkag3zmnMPOnWRh?=
 =?us-ascii?Q?8ACFQRBNMEWbLymtQZYR1tMSnBvPqd8K7JX5nJWfamBFLVbyU20He0jJdLuk?=
 =?us-ascii?Q?cGYRgtnGKW4Phq4EC/hBdDyqqZgesbRd98hGa/TmMnc9d2cXXIkZWu3fWqdC?=
 =?us-ascii?Q?7W9cMJlBc9or7VtpmPB+FfCDrAVoLAzhsJQ/k0a90odmKtqv6ZUbs4v+SEG3?=
 =?us-ascii?Q?4Wxn6vB19elJ5ZS5a0PXcyDxEw/A7g1JXSJ4CCLetmOE3e4nybWHHRntY3Z7?=
 =?us-ascii?Q?CLQrdlUgjDWGnBibT4ybOnutkUx+daCbwVSzSLr2nW9WeNxnfjBrQpDVi5G0?=
 =?us-ascii?Q?ehFKzs0ZjJgKSLZl2Bd6K6QjJlTbv0VbwR67ue9QpiKNLt92OMSv/OKxlgCB?=
 =?us-ascii?Q?w7B5/fQN104VRcl3qVs2QkwDjnyEbrU+nM25ZdbpYDZAlJxljXPLIwXMYx4e?=
 =?us-ascii?Q?zu8WTNlv4zTAEfgkQBU+KPlFjVNjW9vWitEmH0QROevwzr8U8P28cAaMK4ha?=
 =?us-ascii?Q?oOwgspo38gkjGlRAV19j4wAsiVYAkvgqUAW+bE/3mkYPKVfdI46s0MXTqQZN?=
 =?us-ascii?Q?No8OLvSh4VQoeLowV47nFX/lBdmGuUTyd2oG3ANljaMusaao1udnVzfA5lrY?=
 =?us-ascii?Q?M3KwYVbJADnXW8XLoC0NK7uBFQYOlhuLOs9BtHdemXc4z8TUOuRxg7yjpQ+s?=
 =?us-ascii?Q?8/TYI+FeqMIg8bMjf04aIherewXOb92km2PThbLl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a6eedf-e01b-4871-ec01-08db3fcd938e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2023 05:27:17.9118 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JkgjKL3LrAPeQ/KpXwH+Zgfzx/Cr/+xssDGE2DSztT1987VS4u2FkfkKNTkDikJ+K+LWigEIidXcYJanuoB7Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4677
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Yacoub
> <markyacoub@chromium.org>; linux-kernel@vger.kernel.org
> Subject: [PATCH v9 01/10] drm/hdcp: Add drm_hdcp_atomic_check()
>=20
> From: Sean Paul <seanpaul@chromium.org>
>=20
> Move the hdcp atomic check from i915 to drm_hdcp so other drivers can use
> it. No functional changes, just cleaned up some of the code when moving i=
t
> over.
>=20
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
>=20
> ---
> Changes in v2:
> -None
> Changes in v3:
> -None
> Changes in v4:
> -None
> Changes in v5:
> -None
> Changes in v6:
> -Rebase: move helper from drm_hdcp.c to drm_hdcp_helper.c Changes in
> v7:
> -Removed links to patch from commit msg (Dmitry Baryshkov)
>=20
>  drivers/gpu/drm/display/drm_hdcp_helper.c   | 64
> +++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_atomic.c |  4 +-
>  drivers/gpu/drm/i915/display/intel_hdcp.c   | 47 ---------------
>  drivers/gpu/drm/i915/display/intel_hdcp.h   |  3 -
>  include/drm/display/drm_hdcp_helper.h       |  3 +
>  5 files changed, 69 insertions(+), 52 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdcp_helper.c
> b/drivers/gpu/drm/display/drm_hdcp_helper.c
> index e78999c72bd77..7ca390b3ea106 100644
> --- a/drivers/gpu/drm/display/drm_hdcp_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdcp_helper.c
> @@ -20,6 +20,7 @@
>  #include <drm/drm_property.h>
>  #include <drm/drm_mode_object.h>
>  #include <drm/drm_connector.h>
> +#include <drm/drm_atomic.h>
>=20
>  static inline void drm_hdcp_print_ksv(const u8 *ksv)  { @@ -419,3 +420,6=
6
> @@ void drm_hdcp_update_content_protection(struct drm_connector
> *connector,
>  				 dev-
> >mode_config.content_protection_property);
>  }
>  EXPORT_SYMBOL(drm_hdcp_update_content_protection);
> +
> +/**
> + * drm_hdcp_atomic_check - Helper for drivers to call during
> +connector->atomic_check
> + *
> + * @state: pointer to the atomic state being checked
> + * @connector: drm_connector on which content protection state needs an
> +update
> + *
> + * This function can be used by display drivers to perform an atomic
> +check on the
> + * hdcp state elements. If hdcp state has changed, this function will
> +set
> + * mode_changed on the crtc driving the connector so it can update its
> +hardware
> + * to match the hdcp state.
> + */
> +void drm_hdcp_atomic_check(struct drm_connector *connector,
> +			   struct drm_atomic_state *state)
> +{
> +	struct drm_connector_state *new_conn_state, *old_conn_state;
> +	struct drm_crtc_state *new_crtc_state;
> +	u64 old_hdcp, new_hdcp;
> +
> +	old_conn_state =3D drm_atomic_get_old_connector_state(state,
> connector);
> +	old_hdcp =3D old_conn_state->content_protection;
> +
> +	new_conn_state =3D drm_atomic_get_new_connector_state(state,
> connector);
> +	new_hdcp =3D new_conn_state->content_protection;
> +

Nit: Why not assign these as right when they are declared we would end up u=
sing less lines

> +	if (!new_conn_state->crtc) {
> +		/*
> +		 * If the connector is being disabled with CP enabled, mark it
> +		 * desired so it's re-enabled when the connector is brought
> back
> +		 */
> +		if (old_hdcp =3D=3D
> DRM_MODE_CONTENT_PROTECTION_ENABLED)
> +			new_conn_state->content_protection =3D
> +
> 	DRM_MODE_CONTENT_PROTECTION_DESIRED;
> +		return;
> +	}
> +
> +	new_crtc_state =3D
> +		drm_atomic_get_new_crtc_state(state, new_conn_state-
> >crtc);
> +	if (drm_atomic_crtc_needs_modeset(new_crtc_state) &&
> +	    (old_hdcp =3D=3D DRM_MODE_CONTENT_PROTECTION_ENABLED &&
> +	     new_hdcp !=3D DRM_MODE_CONTENT_PROTECTION_UNDESIRED))
> +		new_conn_state->content_protection =3D
> +			DRM_MODE_CONTENT_PROTECTION_DESIRED;
> +
> +	/*
> +	 * Nothing to do if content type is unchanged and one of:
> +	 *  - state didn't change
> +	 *  - HDCP was activated since the last commit
> +	 *  - attempting to set to desired while already enabled
> +	 */
> +	if (old_hdcp =3D=3D new_hdcp ||
> +	    (old_hdcp =3D=3D DRM_MODE_CONTENT_PROTECTION_DESIRED &&
> +	     new_hdcp =3D=3D DRM_MODE_CONTENT_PROTECTION_ENABLED) ||
> +	    (old_hdcp =3D=3D DRM_MODE_CONTENT_PROTECTION_ENABLED &&
> +	     new_hdcp =3D=3D DRM_MODE_CONTENT_PROTECTION_DESIRED)) {
> +		if (old_conn_state->hdcp_content_type =3D=3D
> +		    new_conn_state->hdcp_content_type)
> +			return;
> +	}
> +
> +	new_crtc_state->mode_changed =3D true;
> +}
> +EXPORT_SYMBOL(drm_hdcp_atomic_check);
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c
> b/drivers/gpu/drm/i915/display/intel_atomic.c
> index a9a3f3715279d..e9d00b6a63d39 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
> @@ -32,6 +32,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/display/drm_hdcp_helper.h>
>=20
>  #include "i915_drv.h"
>  #include "i915_reg.h"
> @@ -39,7 +40,6 @@
>  #include "intel_cdclk.h"
>  #include "intel_display_types.h"
>  #include "intel_global_state.h"
> -#include "intel_hdcp.h"
>  #include "intel_psr.h"
>  #include "intel_fb.h"
>  #include "skl_universal_plane.h"
> @@ -124,7 +124,7 @@ int intel_digital_connector_atomic_check(struct
> drm_connector *conn,
>  		to_intel_digital_connector_state(old_state);
>  	struct drm_crtc_state *crtc_state;
>=20
> -	intel_hdcp_atomic_check(conn, old_state, new_state);
> +	drm_hdcp_atomic_check(conn, state);
>=20
>  	if (!new_state->crtc)
>  		return 0;
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c
> b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 6406fd487ee52..396d2cef000aa 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -2524,53 +2524,6 @@ void intel_hdcp_cleanup(struct intel_connector
> *connector)
>  	mutex_unlock(&hdcp->mutex);
>  }
>=20
> -void intel_hdcp_atomic_check(struct drm_connector *connector,
> -			     struct drm_connector_state *old_state,
> -			     struct drm_connector_state *new_state)
> -{
> -	u64 old_cp =3D old_state->content_protection;
> -	u64 new_cp =3D new_state->content_protection;
> -	struct drm_crtc_state *crtc_state;
> -
> -	if (!new_state->crtc) {
> -		/*
> -		 * If the connector is being disabled with CP enabled, mark it
> -		 * desired so it's re-enabled when the connector is brought
> back
> -		 */
> -		if (old_cp =3D=3D
> DRM_MODE_CONTENT_PROTECTION_ENABLED)
> -			new_state->content_protection =3D
> -
> 	DRM_MODE_CONTENT_PROTECTION_DESIRED;
> -		return;
> -	}
> -
> -	crtc_state =3D drm_atomic_get_new_crtc_state(new_state->state,
> -						   new_state->crtc);
> -	/*
> -	 * Fix the HDCP uapi content protection state in case of modeset.
> -	 * FIXME: As per HDCP content protection property uapi doc, an
> uevent()
> -	 * need to be sent if there is transition from ENABLED->DESIRED.
> -	 */
> -	if (drm_atomic_crtc_needs_modeset(crtc_state) &&
> -	    (old_cp =3D=3D DRM_MODE_CONTENT_PROTECTION_ENABLED &&
> -	    new_cp !=3D DRM_MODE_CONTENT_PROTECTION_UNDESIRED))
> -		new_state->content_protection =3D
> -			DRM_MODE_CONTENT_PROTECTION_DESIRED;
> -
> -	/*
> -	 * Nothing to do if the state didn't change, or HDCP was activated
> since
> -	 * the last commit. And also no change in hdcp content type.
> -	 */
> -	if (old_cp =3D=3D new_cp ||
> -	    (old_cp =3D=3D DRM_MODE_CONTENT_PROTECTION_DESIRED &&
> -	     new_cp =3D=3D DRM_MODE_CONTENT_PROTECTION_ENABLED)) {
> -		if (old_state->hdcp_content_type =3D=3D
> -				new_state->hdcp_content_type)
> -			return;
> -	}
> -
> -	crtc_state->mode_changed =3D true;
> -}
> -
>  /* Handles the CP_IRQ raised from the DP HDCP sink */  void
> intel_hdcp_handle_cp_irq(struct intel_connector *connector)  { diff --git
> a/drivers/gpu/drm/i915/display/intel_hdcp.h
> b/drivers/gpu/drm/i915/display/intel_hdcp.h
> index 8f53b0c7fe5cf..7c5fd84a7b65a 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.h
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.h
> @@ -22,9 +22,6 @@ struct intel_digital_port;  enum port;  enum transcoder=
;
>=20
> -void intel_hdcp_atomic_check(struct drm_connector *connector,
> -			     struct drm_connector_state *old_state,
> -			     struct drm_connector_state *new_state);
>  int intel_hdcp_init(struct intel_connector *connector,
>  		    struct intel_digital_port *dig_port,
>  		    const struct intel_hdcp_shim *hdcp_shim); diff --git
> a/include/drm/display/drm_hdcp_helper.h
> b/include/drm/display/drm_hdcp_helper.h
> index 8aaf87bf27351..dd02b2e72a502 100644
> --- a/include/drm/display/drm_hdcp_helper.h
> +++ b/include/drm/display/drm_hdcp_helper.h
> @@ -11,6 +11,7 @@
>=20
>  #include <drm/display/drm_hdcp.h>
>=20
> +struct drm_atomic_state;
>  struct drm_device;
>  struct drm_connector;
>=20
> @@ -18,5 +19,7 @@ int drm_hdcp_check_ksvs_revoked(struct drm_device
> *dev, u8 *ksvs, u32 ksv_count)  int
> drm_connector_attach_content_protection_property(struct drm_connector
> *connector,
>  						     bool hdcp_content_type);
>  void drm_hdcp_update_content_protection(struct drm_connector
> *connector, u64 val);
> +void drm_hdcp_atomic_check(struct drm_connector *connector,
> +			   struct drm_atomic_state *state);
>=20
>  #endif
> --
> 2.40.0.577.gac1e443424-goog

