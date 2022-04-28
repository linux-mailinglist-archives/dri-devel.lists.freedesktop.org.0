Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A43512B23
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 07:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A045710EB76;
	Thu, 28 Apr 2022 05:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF45E10EB76;
 Thu, 28 Apr 2022 05:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651125197; x=1682661197;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JmHbkHz6O2XOicFh1COMhaHV/DoM3dxATMmRof3iVzA=;
 b=IlmDRadcvrBL3lJ0WygCMiNN/Mf3iWs729goSL2AYLF8iHM0QFmv84V/
 IG398tgyisxbVCDH4abchDet6v5Y71JCtYN5ldMGcZKJAuc0vuowz8jDi
 zsKyH4Rh5emDdln4CWlz7eljC4Jd+vLmxVPlC5ECLa7M5dHhk+4zcFV4E
 4b4HQPbvp2qcO/WxJZoTldxcW4X+Y+JhqLijtsLV8eFjGvJ8nJ4BuJpA+
 iSJ7QmvrjHuf55si/Xm8KIOk3fZxA9Wji0T3y5lEL4YWKe4eaKXXhHpmZ
 LjKY9JyeYJFtSFcwbpgs4UzHTPAx39ETm0246/f3mubgd2gDz/d5MwiAJ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="265695289"
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="265695289"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 22:53:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="808423623"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 27 Apr 2022 22:53:08 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 27 Apr 2022 22:53:07 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 27 Apr 2022 22:53:07 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 27 Apr 2022 22:53:07 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 27 Apr 2022 22:53:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WCPAouf7BPQPPSsax+TKoed4u9rClgY357hfYYPRJ62z7xCJmQ9utinPEjcNc0qEwbPQqCxoN0rBnb/2L0oAxH4lOplvsExywixwxyS9uXyacl8itEGUTN2OWmo+ZCs5u8cDyxek98WB9Qh9jZWES+q6yf4+NpqMBoOMgI1PhtEdyDJex8m3nJggGCS7To01XW2DIw2jbohJ0j8OBcI7RR3p1NrZTatZaTwsChfICE1jUqgGoq3yMn/2feQtcKSoJfOzSzagEAO5b3MRE0ud5d37xQ4Qd6SA7IpYpefWQeuK4SJ7AKemSRWMxiEaEzmu5sjNh+utSzN2DQMhhfQ5Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yC0d37SN1EHa5nj2u0uqlR+H3btIlFwqnd8rMgRB+DU=;
 b=ivoek8iZ/sGtGOlkSwTZxCfhTYFK3MTDoarTOn9dA6aLqI8XFzltL0UJMqZ4fSVIuIylqPQspq4Uf2PvBqjIpiGQNaKpPV7dCwsbtR9JE23mwMN0R4Z97XeW68yTZa2SFVv6gMond0/6zyLKPpDjy0uUGLSLA4B3O6T+nhiggQXavBko1gQozXCA/GR9/HZUKaDysqs1rwgUI5TSNrVXkK9qdYnkucKYcrTuqjINa4J2EfIxLB3jwmA/ezvAZ8liPWtzzx47LOsDe+7A/yeHr8FfXI1CGnyY7oOgL13PSg9Vt6osJqj7GmaUGtT52OmNlcAZ/crqzwVfFySV9WPYuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR11MB1739.namprd11.prod.outlook.com (2603:10b6:3:111::22)
 by SJ0PR11MB4926.namprd11.prod.outlook.com (2603:10b6:a03:2d7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 28 Apr
 2022 05:53:05 +0000
Received: from DM5PR11MB1739.namprd11.prod.outlook.com
 ([fe80::8c3b:8a54:d186:b555]) by DM5PR11MB1739.namprd11.prod.outlook.com
 ([fe80::8c3b:8a54:d186:b555%11]) with mapi id 15.20.5186.021; Thu, 28 Apr
 2022 05:53:05 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [RFC PATCH 2/3] drm/i915: Define WD trancoder for i915
Thread-Topic: [RFC PATCH 2/3] drm/i915: Define WD trancoder for i915
Thread-Index: AQHYVT3fii0ML8IuI0+YWK4ovU7Mvq0E3cTg
Date: Thu, 28 Apr 2022 05:53:05 +0000
Message-ID: <DM5PR11MB1739919EB818E65BF1B7BA16E3FD9@DM5PR11MB1739.namprd11.prod.outlook.com>
References: <20220421050756.2036609-1-suraj.kandpal@intel.com>
 <20220421050756.2036609-3-suraj.kandpal@intel.com>
In-Reply-To: <20220421050756.2036609-3-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.401.20
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be77d422-20d2-448d-c285-08da28db5d66
x-ms-traffictypediagnostic: SJ0PR11MB4926:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <SJ0PR11MB4926043F69BF0A3746C4A496E3FD9@SJ0PR11MB4926.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ldn5YmqweJYZKZgzqnHkhYhOS2y+QNawL3rplfnpeK3mzzplLVR+UTsGs+UvgVMXb7aZhoTR5cSqyhjozR6w6kvb39z4EtbmgwE/ndVCIL1hS04LSA3M9IaJEJM1oGQf8sX68slGaoVjUJgNd++py2eYkCFw07QeQAupRgq5EWu2N59bsTaEei5n2EoWGZaVPKTBXspQpT+XJNEPENlLZHb8SE1c7vsO4Pmml+WHbAOLeq9feB3I3juNHyp7L9lUmV83a67q/v48CRb6P281M92+/A1nPUOAQhmtw2BzsL0kyR47dAgl8BMPugOCsjj2q0KHzPVRn2HQHr184GEKEvErpSccIztoDsLMO19NHc6q3w5V2rO12ld6zyIIunm/DR8HvzPpMxY7Uta8OOgXeBTPAORRpL7mKSI48L/uLTDE3mMGhnvzEoya4wL8hGQF08AO9kfz98VJ7K9hjQGwbbGbpGJqdlvcgypzrI0HHnLB5DKEZuK3gtRTBBQXIK1rAPOcl5nIP/sxyw9NC0Afy+V1pm0dwc2V6ujQxMRgfW/NEExOycwftQdMSXKSAlvFGgNbxEF0F6f3MIqYrJfe8SYZca6rBql74quWoep9DSlqlCwB5P+Ed7d7k6f6kcpF/ltIcfb2+VOcqv9Zv61s07ek662Ai+Wqk4UC86O5BJPn83A5L/sb4Epgeilj5rBSR6+9Y1tbBUkc9xySMGLtUw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1739.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(53546011)(26005)(110136005)(71200400001)(54906003)(9686003)(7696005)(6506007)(55016003)(33656002)(508600001)(5660300002)(38100700002)(86362001)(316002)(2906002)(82960400001)(83380400001)(8676002)(4326008)(8936002)(64756008)(66446008)(66946007)(66476007)(122000001)(38070700005)(52536014)(76116006)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6dkcd6hyJzwiY5LcsDNcIxeOoiS5pRKvMleBOkJfEe/32Hp4d9+8HIejQzO+?=
 =?us-ascii?Q?5PeXSDfa4jhqqPC/9bBUpFvn/kPKZzC0Rk/gYuPfjqrA0NIcrVksh4UP2Fk2?=
 =?us-ascii?Q?WSQqC9TsrrVjeCWzmdKMZC/JnWTZ+BjrRYm3Pbe2gIwKSLJrgbjRzok5mErF?=
 =?us-ascii?Q?FvoIN7+h+7hoDTgzZKbQvFQB5/ShXUvWgpbOivS/R3W7Bs1Jj/p3I7fKAucU?=
 =?us-ascii?Q?+Neh+Un1ezFqKKXh2pwtPUiMPAVqV1cy4jznHYm8edWZTaj3UVWuLj+8o/x8?=
 =?us-ascii?Q?IhHudSFE2ExJHEZzuaxqsKVhhfbcSwELzmn1g3K2Y43wiEzLLssjS9zM+c2X?=
 =?us-ascii?Q?NXFrWlfspzRmtIMChgYhUnH5XZQkZDoofzg+m2RsIUS3cZLQp3D+9T+UvZvV?=
 =?us-ascii?Q?vpw7P5L33t5JOmoxki0m2vqb0g6iG93xUA5f0T9g9ZG0/fk3WcQfwQVlmcMm?=
 =?us-ascii?Q?GWhbJQO0+hJgOSp64EyViLVs3L77/tF0w5WMaex5BCIZIwPsnBhuc45t35Ye?=
 =?us-ascii?Q?6zJ8BKDsfeWSYt2emCoNWEFmFhpKrjGk4tkP4pKbb7p7aexye0anWPWxxP+2?=
 =?us-ascii?Q?uJ19IhrhmaEsd53SNzOO4aKHfqjw5+vJo3GQln//vOGPMCBXPqrgq9p5GI+R?=
 =?us-ascii?Q?9YZGtBsVWvqUO6kPma1EYrVElZO0/cCYQ9AWGUhTL1EvCXqEQuaJ73YugKca?=
 =?us-ascii?Q?XZ0U9idKPH0TYs/gMn/f+BLclnJmz1ZsYa1qLT9364uDPgPG+aKNT2FaswVS?=
 =?us-ascii?Q?vmhYrfXSJ2srH+4Ykf6bWWiREjdb1jMaS19rAPvatCNWWN5SXBxdwpb1gwua?=
 =?us-ascii?Q?NYE2hPgaEQYpmz5QE/hdDsKKuDlP9rz8TiifCpcUV3/kuxtTAZZGhAd80hjI?=
 =?us-ascii?Q?2ebMjlcIvoYOg89hsc/QswYLoP0GdSp9fpfXKqWR4+LhVoJ0FlNwKFReO2bU?=
 =?us-ascii?Q?+m7mb18uU+QrC+tXF/+ag9EGeRwdH0OhNGkpYFEgaj56naKJDVGtsw8DsMr0?=
 =?us-ascii?Q?zzEkPepVB6hCdAU2I/eqLBElVo48Z4107pJ4xt/HG8yOGVQpWeCPEq13nJgx?=
 =?us-ascii?Q?+kPcHE6rGO6Mno7vd4seiT+MY0VT+JN8h2/twz9AIJ+pPmRWOREsMSjLMOCk?=
 =?us-ascii?Q?KbE0V3H8h76mp749DQm9Cwifm/aEdweCaAOevIiTNYEnztuDUTGZzc1te9YU?=
 =?us-ascii?Q?NDIsaDDBO/xwvObuMRbjxILEHCQmvIzD9Lw6HRaGpCeUiMsH5l7VnoAxkE8z?=
 =?us-ascii?Q?VdquQa/FJ8lmtnP4USFoC/qDNXlCam8G+0N8f+q4hC5JIhSZJOodCF3V6ymk?=
 =?us-ascii?Q?ROwS0NAUOway75Aet6r0BUcFYcioju+h1kb36kA4Zcv+O8fYIkZlibTQlqeb?=
 =?us-ascii?Q?osJyRhUhAZMpaPXVG54/E9/Z5v8EafssDaS43l2P846I+tH3Bsa17vUzRkpU?=
 =?us-ascii?Q?b4e27KMXkc1Ns3qi/4JcB7LwmZENI+MMy2ZV6S2VFf/LmgQdDVeJ3UB4optk?=
 =?us-ascii?Q?nIbXkcn/9gPh0baOqWUNeDtMSgpMc+vOWkMv08pDrpQmuZPmnYCGtW+GDNKp?=
 =?us-ascii?Q?fyWfFf147FUFZJ7BLWtWtcSWahdwDLaRsnhol4ArRwjwWwCGvo32nVpQmRtm?=
 =?us-ascii?Q?JErqd90TP9KkbqAoBJaOBD9cle02BvYIpAyDuc1jzs/l+h21ZTvixXMmyi37?=
 =?us-ascii?Q?ltHrSaWOdp7Pd7OGIJhM73/6LKRIIiBQ1ACeQbprqcjJHLiEHms4TuEKKkc5?=
 =?us-ascii?Q?A3ADPAMiLg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1739.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be77d422-20d2-448d-c285-08da28db5d66
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2022 05:53:05.5842 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VD8qRE0iPm1Nrgpjj09ugdhRA7cM3FCe93SyYmLgSXZKTfMPlRJ0rBxsv4x7aDdOMirIwPteYYjqKWtj53uVfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4926
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

++Laurent ,Dmitry, Abhinav and Rob

> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Thursday, April 21, 2022 10:38 AM
> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Nikula, Jani <jani.nikula@intel.com>; ville.syrjala@linux.intel.com;
> Murthy, Arun R <arun.r.murthy@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: [RFC PATCH 2/3] drm/i915: Define WD trancoder for i915
>=20
> Adding WD Types, WD transcoder to enum list and WD Transcoder offsets
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.h       | 6 ++++++
>  drivers/gpu/drm/i915/display/intel_display_types.h | 1 +
>  drivers/gpu/drm/i915/i915_reg.h                    | 2 ++
>  3 files changed, 9 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display.h
> b/drivers/gpu/drm/i915/display/intel_display.h
> index 8513703086b7..8c93a5de8e07 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.h
> +++ b/drivers/gpu/drm/i915/display/intel_display.h
> @@ -119,6 +119,8 @@ enum transcoder {
>  	TRANSCODER_DSI_1,
>  	TRANSCODER_DSI_A =3D TRANSCODER_DSI_0,	/* legacy DSI */
>  	TRANSCODER_DSI_C =3D TRANSCODER_DSI_1,	/* legacy DSI */
> +	TRANSCODER_WD_0,
> +	TRANSCODER_WD_1,
>=20
>  	I915_MAX_TRANSCODERS
>  };
> @@ -140,6 +142,10 @@ static inline const char *transcoder_name(enum
> transcoder transcoder)
>  		return "DSI A";
>  	case TRANSCODER_DSI_C:
>  		return "DSI C";
> +	case TRANSCODER_WD_0:
> +		return "WD 0";
> +	case TRANSCODER_WD_1:
> +		return "WD 1";
>  	default:
>  		return "<invalid>";
>  	}
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 7a96ecba73c0..dcb4ad43cf88 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -79,6 +79,7 @@ enum intel_output_type {
>  	INTEL_OUTPUT_DSI =3D 9,
>  	INTEL_OUTPUT_DDI =3D 10,
>  	INTEL_OUTPUT_DP_MST =3D 11,
> +	INTEL_OUTPUT_WD =3D 12,
>  };
>=20
>  enum hdmi_force_audio {
> diff --git a/drivers/gpu/drm/i915/i915_reg.h
> b/drivers/gpu/drm/i915/i915_reg.h index ddbc7a685a50..6396afd77209
> 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -2023,6 +2023,8 @@
>  #define TRANSCODER_EDP_OFFSET 0x6f000
>  #define TRANSCODER_DSI0_OFFSET	0x6b000
>  #define TRANSCODER_DSI1_OFFSET	0x6b800
> +#define TRANSCODER_WD0_OFFSET	0x6e000
> +#define TRANSCODER_WD1_OFFSET	0x6e800
>=20
>  #define HTOTAL(trans)		_MMIO_TRANS2(trans, _HTOTAL_A)
>  #define HBLANK(trans)		_MMIO_TRANS2(trans, _HBLANK_A)
> --
> 2.35.1

