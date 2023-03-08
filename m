Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D966B051B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 11:55:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C6410E5C2;
	Wed,  8 Mar 2023 10:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BB710E5C2;
 Wed,  8 Mar 2023 10:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678272932; x=1709808932;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=C7tvTxpAWzf47P7nAVxq+B2EjjFp/TELbWzbE3XQZII=;
 b=ZxGBNwtzBdi+TCNgYnGIxlfAlHt//NzNolxVJV+pJUZxMBpPWfJMADl9
 36FDuXB1xlGCOJw3zZ5E7jcMGX2v+Vt5VbSB3j7Sk6R+eIsLHKsw67naa
 bKTkNPs9U0qqJtJWMTM4xVt4RQpW7XnjGSp2qtsvJQcpA/5HQn9Pl6Bab
 Oxvhy+9fk0zbX5jXYz/2/Nny7TnFSZ4XCCayr/Tfe0xFVK/oQdMCfofuk
 oxNccjP0P2ZQcrExwIB8dmHMwouWIXFxxf5IW/JxAfm/MQTGlMEYGFK91
 8oqk/FIwcZJiS0Eb7m1IsrlWcYRT9T7hVpjRBnzT7aN+oKMJsoOukSC2M A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="333594939"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="333594939"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 02:55:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="654303973"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="654303973"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 08 Mar 2023 02:55:31 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 02:55:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 02:55:31 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 02:55:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxogI187aCksP9/gVPA66dE36zADxjvIP0LgZayx7O5ImuzE0hyeKgQgZGOKaPW6+6BDtbPHc6JXljXH8Z+pDkT9kWqJVqOfR737DiisBB5asEEg9TO6Njekx4b9Y7M59pW7gBF5UBv6WiHf7Vbbitnwu73yCmFHfKwBNRG5mVv0zcpiOaVSqGaWDIN6LGf7J3WFuPVKoXQdbNHuUvjAWZ6zTt1nYvXYT1C4EPkBjgP9qnOX5NG0ego819uAlhOUfwWoK0OuuGNp5NjccYAuBEJPyowmtnlRdyUN8QBtJ5sf2EoVlwwwH+cN+UcbQGvjuoHprQ+YKhTDgdJXerbb+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MeSPwHz6IYIZ+qwJwu4tY3Jv4/cnhT8WfUAyCcYkWns=;
 b=Loru1dfx1JsZvzbJkZb4l1CJn6XcZeWgg2CZHpQlb2RpDdV1vW27Gl8/6WTK4YV8phEhBGpABLEXg7cEKD88b3PTkTjaBl5b/xqPelJ+YqoTDywxoPL8SO6aHQkVisR4XFYXQw9vYz8eL3JS3yR2SNS+Clz80IiZ+lfVjR0YS1CKEaQguJCYSFSby+v6/+sl5Ifmah1E9chTxpiotMyz8CPCuIGIV71lLLXSinnNjzBV5LLTQk/8OqCCGE+6gIh6h0jng7riNSKSfPxtgqjQ8qRe8HkP1haYntyzG3Q8O5/deJ5xF5zmDY1MGQ9rNZmTd+ImEHOkUanknGHCf7XZ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 MN2PR11MB4518.namprd11.prod.outlook.com (2603:10b6:208:24f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Wed, 8 Mar
 2023 10:55:29 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::f677:36e:9fae:b45e]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::f677:36e:9fae:b45e%6]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 10:55:29 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/7] drm/i915/dp: Check if DSC supports the given
 output_format
Thread-Topic: [PATCH 2/7] drm/i915/dp: Check if DSC supports the given
 output_format
Thread-Index: AQHZRn8ps0tMYzxWFEqra11JOAYIv67wy2GA
Date: Wed, 8 Mar 2023 10:55:29 +0000
Message-ID: <DM4PR11MB6360D9C94E3E8996211B4EB0F4B49@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230222053153.3658345-1-suraj.kandpal@intel.com>
 <20230222053153.3658345-3-suraj.kandpal@intel.com>
In-Reply-To: <20230222053153.3658345-3-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|MN2PR11MB4518:EE_
x-ms-office365-filtering-correlation-id: e69aca0c-90c9-41a2-5e77-08db1fc3a1b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2rU7Es/Ps4lIyQUo1va/9kMDdT7ga35BsOBsv+BQ3IHS64bHAiCX5pA4hwELFwGxCb9btGUgxH0TU9wZPouIHuj+H9zARUeUr85nPQptoV/diq4C0bxjazfknARU68Pp30isY0hxP7mZnaMCCoQJpKPmbPZQBx5VH+u756Q+6Uy92iTUTsGJWfA3bccPVWILQsSbyrjj0X40f60JIumcgrSGet3D2RmGPFTZKf5W+fKSnpspOqNvffPvqwB35F55XN88d8cs9pWRXhjZTu+Zr+18JLm1j/KO9ZC9GxGh98IPAbuh55cFhj9vJurP/ZDJgt/r1ndJ7qdRdJEQ9/Ba/x3vwWhR/wm+dnNSv/bXvxFkA6pKsnbBloSF9NX5uPGpBX4i74Egp6SGYrKbqAtVbM864FLATLwZUhdkfOSfG4LOTzArjavrK/jY4P6w8W1mt7weIVqMOAmNiZHRF8TNqovxbbD4bUyMfNQgyQWH1UNPiwYtgLNc2OlL0XOJc4MUn3afTessUW3ifnSC8Y94/jcmC/iuvWeSio1LyvJkflJjDY5E3QmlZQM7+F0+YUChc/jIbN9dNWho+r2Wb8fQl4/MRZMPwgTsWez2KWrju8Ap/sTrfiVnVzwKxcajwrv93MKVfgoHIp6JVM7NIr8exzzQjsCjnoLa8GMhCWSK+qHvHvpGhTAdw0Th+Jfk8SBSwbOma3zHHgY2Zf8QTyeY5g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(39860400002)(346002)(366004)(136003)(451199018)(107886003)(33656002)(478600001)(83380400001)(110136005)(2906002)(9686003)(6506007)(76116006)(26005)(450100002)(53546011)(66476007)(82960400001)(5660300002)(41300700001)(66946007)(52536014)(4326008)(8936002)(64756008)(8676002)(86362001)(186003)(66446008)(66556008)(55016003)(316002)(7696005)(122000001)(71200400001)(38100700002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RAnKfBxTz1DAJ2RtOMnk4Q68sujNiO6DlEOf95UsL/4D/6s49AouCANW1PQF?=
 =?us-ascii?Q?n8W24ww87vJzrhEClPvJ179Nl0/zflcLUGJncRKnCiClY+dNF4wD6jkz0kbq?=
 =?us-ascii?Q?IjzvdtCXbLGjeo4rLKukgYbx7MCZZTWQWMHqLY3VXbuDse45lSFkdVoVVyi2?=
 =?us-ascii?Q?ugwT32+XI2tjjGtLDbYo0dFag7irRHtChg724WWDtzU93RuxLjwwFQfvNmy2?=
 =?us-ascii?Q?Bmtbrrff3mkrNALnW6r8u+LKfRr289nvFty+ZZfGc6dRM1flCcX5Z78gLsHc?=
 =?us-ascii?Q?pqLsbOK5NsnWOiQAxxyFesl7Txr3srIihJ0dCIig91ZtY7MeVnTjlrOULzi4?=
 =?us-ascii?Q?vcMMJjfPulWXkjVUzGcCz7mzICuVD24BxZIdnFbvCnhAxXVw1d/vuzJHynEb?=
 =?us-ascii?Q?pPkl8NVvTGL3Bzpg3wNvcUkTZLNbORT0FyCl4Oj18Yimy7LxtjkVyTBNQf8c?=
 =?us-ascii?Q?KIfpCEkt4i/xOqYc91yWguLY0AL0rmOvzqTsFOG6rY0D6bcq7A3A69PTVGKg?=
 =?us-ascii?Q?xSydxheD5+B6MBKsz2mhClUDtf4TxrucBdWOoSfNRtS6ekJb8NVY2a/XdvtS?=
 =?us-ascii?Q?hyFb+qnjHjfUS1tk79Hm8avoRXDdTz+Wz7/moy8atJxJVCKGQFLKHltKgI76?=
 =?us-ascii?Q?REcwlF4a8zjKgwM7ogQ/jfScHFJ7sTsczsE1soCGWQsGFUJVaQHkHzoYPiW9?=
 =?us-ascii?Q?mdVHeZ+Or486iVS/1EiOa+m2pGNyLUMASbzAU9i3ZkoRu91GXI84r4SEylK6?=
 =?us-ascii?Q?56d/sV/ZXFoTSl8u8nqDFC2u7Nf27gRxlqfulIK4dLNEIGe3TewSgJAqNPHa?=
 =?us-ascii?Q?ek4/goewgVseaeRBzPCr6bKJr7itTiV5VZ/pRIpj397xZHtwOMEYV+nDqQg6?=
 =?us-ascii?Q?S4uxmD43zFxAg46wHrtrdN+sHNvJyOmbASFwkjM1lkR7L2ZCYD9u8CwahnM6?=
 =?us-ascii?Q?z/8tKka8pxw4Ugb8DuhalXBUYfJ3Ik7OEhcHv1Zj1mna+Q3mketISVJiZrMi?=
 =?us-ascii?Q?mUUb9bR2Wndz1Hv3ZZKqNJ69dSqPmuo66FhvT+yK8SNCVVv2eyqAkbDduPJq?=
 =?us-ascii?Q?NVsqdrFf6g5nMDqOCn3m20THLg2rpEOSzRBBoq7dEqZJb0ZgqX8rwQ7yZfXY?=
 =?us-ascii?Q?qJ6NzhZIBiNzSuZJlEFeP/Qv2yLPQp9r9EiU7feHHIYE6VVc0Kgjb6VZsePt?=
 =?us-ascii?Q?yOyqgWF0gSNBwF/bEDoPltmRkg/HxhB1FRDvhZpeU4T780VlkaJAg4jlSthR?=
 =?us-ascii?Q?CbsoMb9OHNO7INvL9UCt7TiZGpdLrIYjxd4CqSlQkYDAzIzEo+uyhqQChTvK?=
 =?us-ascii?Q?o8jdAG+fmqAV0e4pdVtGREFnG+X2U5PlIbqRzWadRHEb7co0PC7CxA5JdB+Z?=
 =?us-ascii?Q?NbU20mPzekBhgpUUUBIlc6SvDh8FkccILoD07/VdwIdWwXojyDkaWVckSMVh?=
 =?us-ascii?Q?rvZQtAq+BoA6O0UghZAt5rUkOJRKMy0o5+ra/YXe0jyioauSuPQ3j45vWqEm?=
 =?us-ascii?Q?nu0bXfcLXhrNCUTEBRhl/BN0qu9yevL0+ORZZyMnbJrb6Ai8fBihUZS1c2OV?=
 =?us-ascii?Q?MWLELPjqpBli655HLOSDyV02OUtuZzO7oTj0Rj5s?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e69aca0c-90c9-41a2-5e77-08db1fc3a1b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2023 10:55:29.4493 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fwNGCLDUCMHhH/2MidSkVtwDeXyIGgfPKVtJJWonuehen9NbIOKHSQy2fvmWaGekL+VL9mGVKJ8Qxjktc0C/PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4518
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
Cc: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Wednesday, February 22, 2023 11:02 AM
> To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>
> Subject: [PATCH 2/7] drm/i915/dp: Check if DSC supports the given output_=
format
>=20
> From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>=20
> Go with DSC only if the given output_format is supported.
>=20
> v2: Use drm helper to get DSC format support for sink.
>=20
> v3: remove drm_dp_dsc_compute_bpp.

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Cc: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 28 +++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index fe98c7dec193..f2fb3ec2dd99 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1491,6 +1491,31 @@ static int intel_dp_dsc_compute_params(struct
> intel_encoder *encoder,
>  	return drm_dsc_compute_rc_parameters(vdsc_cfg);
>  }
>=20
> +static bool intel_dp_dsc_supports_format(struct intel_dp *intel_dp,
> +					 enum intel_output_format output_format)
> {
> +	u8 sink_dsc_format;
> +
> +	switch (output_format) {
> +	case INTEL_OUTPUT_FORMAT_RGB:
> +		sink_dsc_format =3D DP_DSC_RGB;
> +		break;
> +	case INTEL_OUTPUT_FORMAT_YCBCR444:
> +		sink_dsc_format =3D DP_DSC_YCbCr444;
> +		break;
> +	case INTEL_OUTPUT_FORMAT_YCBCR420:
> +		if (min(intel_dp_source_dsc_version_minor(intel_dp),
> +			intel_dp_sink_dsc_version_minor(intel_dp)) < 2)
> +			return false;
> +		sink_dsc_format =3D DP_DSC_YCbCr420_Native;
> +		break;
> +	default:
> +		return false;
> +	}
> +
> +	return drm_dp_dsc_sink_supports_format(intel_dp->dsc_dpcd,
> +sink_dsc_format); }
> +
>  int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
>  				struct intel_crtc_state *pipe_config,
>  				struct drm_connector_state *conn_state, @@ -
> 1511,6 +1536,9 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_=
dp,
>  	if (!intel_dp_supports_dsc(intel_dp, pipe_config))
>  		return -EINVAL;
>=20
> +	if (!intel_dp_dsc_supports_format(intel_dp, pipe_config->output_format)=
)
> +		return -EINVAL;
> +
>  	if (compute_pipe_bpp)
>  		pipe_bpp =3D intel_dp_dsc_compute_bpp(intel_dp, conn_state-
> >max_requested_bpc);
>  	else
> --
> 2.25.1

