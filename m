Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D06484BED9
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 21:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D0C112E18;
	Tue,  6 Feb 2024 20:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LB1EzXVx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA244112E16;
 Tue,  6 Feb 2024 20:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707252158; x=1738788158;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=55rYxuni03OhXy6RA/9pJ6/4FpX63mt7o5JijGxoXAE=;
 b=LB1EzXVxtDpwEVjrvYWQB8q7ZZGnGg/OQfPfgLt1NgB7BzsnJtle8Z3/
 ZFSjVFrgeyADbbgJGwRA9hlBzzQ5TKfBIKxvovMTpi62rrs21bUQUHDQW
 GNmcKzyiWcvNt2gKyQrIPhfDkQyCimzOzYWSIz6GsVQfEahkkqHcrTNCs
 9HZLqz0wSF/+cUBrk5KB80V5MyvOW29CXv6c6eROW4ELycEcfHZdFZqbv
 ZOq8rZHFX0ZhvmyPNDri6TUInJpJDRzdBMxZBnihssCoIPvWFaGNLDaUm
 CvOjvUZJXHkpoBBYi5r7GircZQrmYcx/3szsdH95FeBRD5w/CXZ6/J2uM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="999560"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="999560"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 12:42:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="5906007"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2024 12:42:37 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 12:42:36 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 12:42:36 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 12:42:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzvfEAqVHuqIqrfDB0f2OfQHvGhwMYVBC2/8PZyh6DwiV9v+sYIZPiTn5/ok3XsBJvhXm3VncH1WbwrXrfhRLQJlbmirsxDJeOJgG3lRFKV3K1R8Q19m2W0MQ1vKdQsde8gYcjvfPweVa6sFEhPQQrxAgRxWY3iaCCeE5W/cmE5jyuLfdobNcqKcygJ9JnM5gZ9jqkJ21zVseEt6eo03i+BAxqPBD4BX7qsGxIV0Y/7lT3byrNSFHIBCkaD2Lg8R6Ej7VtBLIoYYCLqsKOoy/5dZ0ERxQnOQQTrKLxFmvhkNRpFjvoFWiF+WwECTomFwkr2/zAC59stvCN0CSi4zCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d11ebkrjaLjkAL5kSy66QRPxDeX88EDP+0k9+M9hUqw=;
 b=QftU8HxrQmjjSAB0CblSZjbr6Ks2X4e1FSQcnwnf6wB+FH6yMHwzPs7jAgGj8nKKCaRXZHaFBNmAbEmf/HcYfxQcDmHuQZvovMRP7gAFNiKWsFhAqFY7OarhSk34LJvMydm07yJpFyWGG0xnDBQRsqWkRH6QXXsjuAXy5mzq5GCMdrC50W3THKKz2W7/LXrH+PB1AF5JOsWfqrQEWE6Q39GAg/LQw/nmGroFPSwJs/YHVwofRWPSH5gP08b350yuG2rdl7AeBdz783Je3mOMUA22pq4WEf5OmKsvsa9csjCM/eQyAw1pM0Tmma+zk+62CDK1YY4FxbdXpyU/fgF4Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 PH8PR11MB6777.namprd11.prod.outlook.com (2603:10b6:510:1c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 20:42:34 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d%7]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 20:42:34 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 13/19] drm/i915/dp: Account for tunnel BW limit in
 intel_dp_max_link_data_rate()
Thread-Topic: [PATCH 13/19] drm/i915/dp: Account for tunnel BW limit in
 intel_dp_max_link_data_rate()
Thread-Index: AQHaTecjkTl4G00OhUu4SQ86aLKLTbD93iuw
Date: Tue, 6 Feb 2024 20:42:34 +0000
Message-ID: <DM4PR11MB6360C27E8D66C03297764734F4462@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
 <20240123102850.390126-14-imre.deak@intel.com>
In-Reply-To: <20240123102850.390126-14-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|PH8PR11MB6777:EE_
x-ms-office365-filtering-correlation-id: 71c62738-c38f-4b1f-f523-08dc275425a5
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pbaD2jFmjm3G9BHj0D4qg07ahxctDY5JdlhdMK7gxdnn19mTp1CsjFzOu/2mnhPf2HCPi2MleGvPSpOF82BVchXpvk9a9erLy+QMLOeFYigcpNTeiTnyvPYok3alyLX2sgmDyBrIdxtZHXK0MeQtI5kXhZzyYmBTkvgzk9Iax5JyHOIb523PZA1pTGVKuxVQTX+qlPNvBux4rU4nt5jSI7PvQ8FQ2OskD+DqWMTD3p6DRbUPd9v6vr/9+eUbSaeUjQPC3nJ3j7zkmF7OemgRISUh4+mYFoYDZ6EQzYe4U91zZhzpM3pf4HgMonb0sV+difaIHOsalgVAQQ669dyh4Wf0Y7/424XYfXYx8MKcPQ5FJG8pPxlFxs0y6AttUWXUqIzQ6X0VGlVyOKJ4evL9PYrJMrUe98wlK9Cw7jvi+sjwoyT3/RTsxR/nH8zBXn3vhN7Uq+o/GO833sl2Ly7MF89O6s7/WxZG9RgwQEQQllRecwaF+COvEocWG8IEXWxjMEQiA2eHmu6tWk4qW0AWUCEFVIKtqzIXsbxY+e8fU6feEBlpwSSfOkDsUlQ4sD56LiuRmjDtOj+5kWzqqNtDE+uNMGMbAd/gr4rzslv9vMmydDfVTeKE1coISsDd+ig1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(346002)(39860400002)(366004)(136003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(38100700002)(82960400001)(33656002)(6506007)(53546011)(55016003)(7696005)(122000001)(83380400001)(86362001)(26005)(41300700001)(9686003)(8676002)(8936002)(4326008)(52536014)(71200400001)(478600001)(2906002)(66946007)(5660300002)(450100002)(76116006)(66556008)(64756008)(316002)(66446008)(110136005)(66476007)(15650500001)(38070700009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ndP01klKjt1XCGMFUkk/5DqWj+YG6IsCFwpEznwyVO4Yr4FlGXrKYdbNUmSk?=
 =?us-ascii?Q?LNlWVObfBO7aUI3etgY60db7RVNtIfl4Bn5sngnFeeXeTYFm1K/XDt5VIrY8?=
 =?us-ascii?Q?8Ik+7hK4N+B3sw2wWSg+tMTQaoCuwRI2JR8rHmc1zS/He/ySZN5dOUOQrWGG?=
 =?us-ascii?Q?6rWH46akvfjOO+Cop56yCcUlpZDHIXzGSgMnAhLdfyUIRXyHEHmDIJt6Qtkb?=
 =?us-ascii?Q?uOuq32o/KtV12FF1OpvnjXaRPqyyEkCwtPsYwbyru6nmLOi6sM5j3kl0xNFJ?=
 =?us-ascii?Q?tWVwkyxFF2IfDrE+ZMqshxa2Ok9s+NVwOFnHB8UhjsprSaHHGVY+TnFoE7q1?=
 =?us-ascii?Q?AEeIrzfGuGLWkTDF4gyPXaaWnlCO6uT0axJCLskLV3ODLhOi/OvPRgmUydxF?=
 =?us-ascii?Q?gw7/+0JzukBv+DsRGzDWkonzXI72JZqYTTgqUQnC7PRqNGOcxT8wRQarm787?=
 =?us-ascii?Q?fcUPY9SJmTekA9k4gKrUH01cfzlHHfoyf8RNiYChplXK0gmKLeHN3pBOI6Bx?=
 =?us-ascii?Q?Nd/y058hRTmrfVRduEJeJ70rnu/15IKNjyHhJH7btRzlegEjqcdP3pFhB8BP?=
 =?us-ascii?Q?b3f1juQc1tiBN/vDxxIkomNYothN0njcWO6NjKtAw4mD6o1TO4/GOdR3vXl0?=
 =?us-ascii?Q?lc1G4ZXmRvkPiEgVTN+X8nViaEtnW6VwqJCQr06caanC4HtT0FhFQSA1qF5q?=
 =?us-ascii?Q?z1tyGqKQNfEDcZhS2ngw82eXoT/FvSdIfZNfcSOgeht4BDE3nbjn0FlrLvJ2?=
 =?us-ascii?Q?PkGdflplC5TnqFb3XqkSGJQ7u6JZuZi+gMdzAARBecqcieMPf8VSY97Hz5+d?=
 =?us-ascii?Q?kSQIKRcCdYszAETyD9qUC1BrjGmjGBiaqXeaGttyy49f/SY1hjKadTKolzne?=
 =?us-ascii?Q?gbPROz1gvn+Z7TGMX46h5N6mIZG/F8v6akLQHh+mfgOitlOOhNg6kJJiXqov?=
 =?us-ascii?Q?hnnmCrY0DwYg6Rzg/5sEJYwNIur35QKGgdnHulEQKm1+R3kifVnhwsVU0udu?=
 =?us-ascii?Q?r3yLMGchSt8PcDLI+mkBF5MwEXY/lb3D7BHJYGII2iHKmAEHD8r7VqHl9nL3?=
 =?us-ascii?Q?HpLJKNVOG4pdYpFc0a1N0hXsIcE6af3AerXPgUee0khToWrXrMW5rsAxoNfB?=
 =?us-ascii?Q?EKbVmaGQUJwfeMduSCrpfQV4IVQPrS+jZU/Mhcok006zSeEZDEyuMT6zurrR?=
 =?us-ascii?Q?wUzzsjg+N1p4LsCufpeVUQlMkGvE0JYdPjDlpdEUAYshpWOpBOEgJFoGVz8V?=
 =?us-ascii?Q?HQE6Ag4pezn9dvSNv1nmrm5WePIgvFLjYc8VZOdVXrUhqUVi6jItdlPGusGU?=
 =?us-ascii?Q?VcLWzDiutskXFmPUvjX6xBZc67prN6Mi3Unw9Y2AEE6rISVRk6QaFnJOaQd9?=
 =?us-ascii?Q?Wd5qcrvflW1V8Ay/Cy7gucYoJpLyRIIAoJKMMve4Sc5UuToiQFyXZiXiLq7Z?=
 =?us-ascii?Q?VSstixLX1XxTnFpVZyYKM0/+SRwcVcQm7MpXh8irVYzd0Fy8DASZfiXTkUR9?=
 =?us-ascii?Q?7W0Ty7fEe7isbd27rXh5/Z7So8+7duWV0W99S96yobSUTTboUZsYIzS7nW7e?=
 =?us-ascii?Q?C7/OSgrQDdzEzFDj3u0vbqd9LLtpOmAuKW6gYF8k?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c62738-c38f-4b1f-f523-08dc275425a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 20:42:34.2084 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NWDB3NQkXl0RTE1yYehSbmcrFNv8Y3VDG7u59iZemZsmPvxrIAE37p8CTHUVC5ETiun9guGjPvTMQtaihLVNpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6777
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
> Subject: [PATCH 13/19] drm/i915/dp: Account for tunnel BW limit in
> intel_dp_max_link_data_rate()
>=20
> Take any link BW limitation into account in intel_dp_max_link_data_rate()=
. Such a
> limitation can be due to multiple displays on (Thunderbolt) links with DP=
 tunnels
> sharing the link BW.

Looks good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 32 +++++++++++++++++++++----
>  1 file changed, 28 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 323475569ee7f..78dfe8be6031d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -63,6 +63,7 @@
>  #include "intel_dp_hdcp.h"
>  #include "intel_dp_link_training.h"
>  #include "intel_dp_mst.h"
> +#include "intel_dp_tunnel.h"
>  #include "intel_dpio_phy.h"
>  #include "intel_dpll.h"
>  #include "intel_fifo_underrun.h"
> @@ -152,6 +153,22 @@ int intel_dp_link_symbol_clock(int rate)
>  	return DIV_ROUND_CLOSEST(rate * 10, intel_dp_link_symbol_size(rate));
> }
>=20
> +static int max_dprx_rate(struct intel_dp *intel_dp) {
> +	if (intel_dp_tunnel_bw_alloc_is_enabled(intel_dp))
> +		return drm_dp_tunnel_max_dprx_rate(intel_dp->tunnel);
> +
> +	return drm_dp_bw_code_to_link_rate(intel_dp-
> >dpcd[DP_MAX_LINK_RATE]);
> +}
> +
> +static int max_dprx_lane_count(struct intel_dp *intel_dp) {
> +	if (intel_dp_tunnel_bw_alloc_is_enabled(intel_dp))
> +		return drm_dp_tunnel_max_dprx_lane_count(intel_dp->tunnel);
> +
> +	return drm_dp_max_lane_count(intel_dp->dpcd);
> +}
> +
>  static void intel_dp_set_default_sink_rates(struct intel_dp *intel_dp)  =
{
>  	intel_dp->sink_rates[0] =3D 162000;
> @@ -180,7 +197,7 @@ static void intel_dp_set_dpcd_sink_rates(struct intel=
_dp
> *intel_dp)
>  	/*
>  	 * Sink rates for 8b/10b.
>  	 */
> -	max_rate =3D drm_dp_bw_code_to_link_rate(intel_dp-
> >dpcd[DP_MAX_LINK_RATE]);
> +	max_rate =3D max_dprx_rate(intel_dp);
>  	max_lttpr_rate =3D drm_dp_lttpr_max_link_rate(intel_dp-
> >lttpr_common_caps);
>  	if (max_lttpr_rate)
>  		max_rate =3D min(max_rate, max_lttpr_rate); @@ -259,7 +276,7
> @@ static void intel_dp_set_max_sink_lane_count(struct intel_dp *intel_dp=
)
>  	struct intel_digital_port *intel_dig_port =3D dp_to_dig_port(intel_dp);
>  	struct intel_encoder *encoder =3D &intel_dig_port->base;
>=20
> -	intel_dp->max_sink_lane_count =3D drm_dp_max_lane_count(intel_dp-
> >dpcd);
> +	intel_dp->max_sink_lane_count =3D max_dprx_lane_count(intel_dp);
>=20
>  	switch (intel_dp->max_sink_lane_count) {
>  	case 1:
> @@ -389,14 +406,21 @@ int intel_dp_effective_data_rate(int pixel_clock, i=
nt
> bpp_x16,
>   * @max_dprx_rate: Maximum data rate of the DPRX
>   * @max_dprx_lanes: Maximum lane count of the DPRX
>   *
> - * Calculate the maximum data rate for the provided link parameters.
> + * Calculate the maximum data rate for the provided link parameters
> + taking into
> + * account any BW limitations by a DP tunnel attached to @intel_dp.
>   *
>   * Returns the maximum data rate in kBps units.
>   */
>  int intel_dp_max_link_data_rate(struct intel_dp *intel_dp,
>  				int max_dprx_rate, int max_dprx_lanes)  {
> -	return drm_dp_max_dprx_data_rate(max_dprx_rate, max_dprx_lanes);
> +	int max_rate =3D drm_dp_max_dprx_data_rate(max_dprx_rate,
> +max_dprx_lanes);
> +
> +	if (intel_dp_tunnel_bw_alloc_is_enabled(intel_dp))
> +		max_rate =3D min(max_rate,
> +			       drm_dp_tunnel_available_bw(intel_dp->tunnel));
> +
> +	return max_rate;
>  }
>=20
>  bool intel_dp_can_bigjoiner(struct intel_dp *intel_dp)
> --
> 2.39.2

