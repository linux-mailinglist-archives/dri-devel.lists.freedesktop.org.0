Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0284F9FBA
	for <lists+dri-devel@lfdr.de>; Sat,  9 Apr 2022 00:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C95410E07F;
	Fri,  8 Apr 2022 22:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F50210E07F;
 Fri,  8 Apr 2022 22:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649458045; x=1680994045;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=FGOYVX1KEM+aU+bdgEhD1k2LT7YEHn/8bxdt50sh3ZE=;
 b=ieY6lJ5GAIG0DWrQz4agYjcxnKL0ovHt0GM0XyV2LCAo6G+HQUe7lgUk
 zOTIbdO5Llzyngl+NrlSnt84FPQArcFeyTSU6l3w80nV3sqeTNASn4YZx
 YkjlqD2jeY2LZumlsjS3VP+WLTrFEgoUYnELuPJJ/aN8ViuHi3pUuiMAg
 25Utp18YrN+4Rj89jA6ZTB7ra6g6Yr55njvd9T7UBXa+pNAhvoBJS8n8A
 2HFMoDuviTtFDC0NBQuxQK7sgUjRAq+zVsbzYO5P5PG92jF0eH/X+zH1O
 C/MzpjuJLKP8XLo6fZD0EslObSjJOiVa8TGey7gl6Lz1B9ngeRCwPZk2+ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10311"; a="242306487"
X-IronPort-AV: E=Sophos;i="5.90,246,1643702400"; d="scan'208";a="242306487"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 15:47:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,246,1643702400"; d="scan'208";a="796504580"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 08 Apr 2022 15:47:24 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 8 Apr 2022 15:47:24 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 8 Apr 2022 15:47:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 8 Apr 2022 15:47:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IDiDpJwbHql2XSkkzZRuB7u0VDS3Fs1U60ul271IqPpmxf6/SSghnk17MZrzhT3NUjWRY4Wy/10kz8La8woxC7Y4QSSVKIyrHKQYs9cnLAfin8BwZiu76JBIrxfQeQWFszS2sw+go9Mi0F+wut6SdWppuLKzETMxhbfi3aRhz1c2MnFPcPAYo7Hus8M+qfTBskcgDSxub63owcP5UUi5V1bU5g8Mbaf7H00KIdVfiTZfamExP0WsL+jMV85HOpLQEKMO8R3K8xDvWnsc/Wa21Y8xAOTA9H300qJgqd2YXcmrWTgVhyLOSnLHBFKh5AiI4d3cPft4JE1Nv8c2pJvBRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kD6aBKC2A0nl8KcSIaBaXc/8pEzptG+PtAffGbaIa54=;
 b=iRi2J8zkJJDAmf4GG14wxp4eowM87L3lkGGYxdJEXlh3EVmCnuy/GnZE+ZGcl1mruIv1AZPX2hLVvxFT5+Jhd23IY2RVEbnYqkZUhx2dcGFjh0Pu4ARM3q4VBQeXggpyaWUzlyIyAo8S+pzwDb/9q0vW4IHaP0FbXXdLU5t9GmWhGAo3BV2NwXGKo+pHFEl81STKL9FlbjEqBtyuavABpfH/G8I0nCdwDNtZ1l9276cSLeggiCW/LqqFgxxLijzchYd7zYrofO7zkOwfDd/NCR8/rsduPz+7nyZ3/RtjrR8jmDWAPPJWEBLXbIuEY5UlXPhLx/kcUNnkkO0KmRLKuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4620.namprd11.prod.outlook.com (2603:10b6:303:54::14)
 by MN2PR11MB3600.namprd11.prod.outlook.com (2603:10b6:208:fa::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 22:47:22 +0000
Received: from MW3PR11MB4620.namprd11.prod.outlook.com
 ([fe80::574:a47e:1595:c1b]) by MW3PR11MB4620.namprd11.prod.outlook.com
 ([fe80::574:a47e:1595:c1b%6]) with mapi id 15.20.5144.027; Fri, 8 Apr 2022
 22:47:22 +0000
From: "Almahallawy, Khaled" <khaled.almahallawy@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Deak, Imre" <imre.deak@intel.com>
Subject: Re: [v2,1/2] drm/dp: Factor out a function to probe a DPCD address
Thread-Topic: [v2,1/2] drm/dp: Factor out a function to probe a DPCD address
Thread-Index: AQHYS5qbuPambRqWIE6KGh8uaC7j7g==
Date: Fri, 8 Apr 2022 22:47:21 +0000
Message-ID: <4a7027ccd8a5007f460dead096961b5a03bf68aa.camel@intel.com>
References: <20220408172154.807900-1-imre.deak@intel.com>
In-Reply-To: <20220408172154.807900-1-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e4fb7c95-605e-4e9a-a9d6-08da19b1be68
x-ms-traffictypediagnostic: MN2PR11MB3600:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MN2PR11MB360085F075A3E0FA2E0EB9C389E99@MN2PR11MB3600.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: icDJAs9dN4CVZTJD8BfPKowUcBoovZuUxLn/nWy+SGX64uVHnAJxpLzdBCJn+uiK4ZU20rs83oYc3G1nnX9H3LdXeY4+nC1ICP1hdtGe8R4n0gStqyKWQy9+32wZ5H5UZOmWBzxr6lUDgPwPXuJwBffo4N0/td9F/mKMHScuM5DRx+Yqb6imGZRGdJlvp/kSuueJStOPSwmLEysErU7LLP9E3OOZDxBN3mU15TKHP0Uax4sdiYRovRA4TCitImFk9WKYjtY2Wo6o0xq3c9bt1vPLm4gpG8X+pOD1t+oAF65TKuMAbM6IvpYlAX1aC1jVi6gw1OZDURL0WuIeo9x8sZEqwH/AMyU0bsipEv9uybzScJ2Uf8r85WwNlTmtkpHHIWCDGqqPPFc74PQ6rL/2nSlLF/LP2YWdjmgW3Sn5ZoOpn3BE//Z/7/DS+IZGRhf5i0QS+PgS6MdQOCzFnwmJKz52Kv7UXiJ9PsenltD8+tUtJZ7J5IYL1KbZX9pCYP82GOwLwgOK2hY7Jl/DvyGoQHndsqw0cEWswxnXBYKIBwPUR+zlvUKKSP+mi0SdV85JQBGr99CAT16A+wZzY9I9L4lTuILCC1n/tFB2PTI/5NQAd5bLqcjbDmLIFwdCWbMG7OuKmVnINQcv+Uap8EENZrkbSTLND7Yb75qDbvj3TgqDKJLCpEzH5M7J6aRG7q2BYxBt7kDUW4rfPOnlX87Rmg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4620.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(450100002)(6486002)(66946007)(316002)(508600001)(110136005)(86362001)(66446008)(64756008)(66476007)(66556008)(82960400001)(4326008)(71200400001)(76116006)(91956017)(38100700002)(36756003)(2906002)(122000001)(6636002)(5660300002)(186003)(38070700005)(26005)(2616005)(8676002)(83380400001)(6506007)(6512007)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?15LVUo868zs+4laeKwq2Ux4Sb0G2rMXB1wpL9/66mieIs4dl4O8fpJgC3?=
 =?iso-8859-15?Q?dcs0bipnqaGQqLwhcew2bV1PfCffATD8jI1UUPvN6ULiYoG+LxL64TYpq?=
 =?iso-8859-15?Q?ewpFX4dLQf43ohJb64lTiHlW1k3oH28UCdVM78/qNIqJ+bX8RjjlQcJNU?=
 =?iso-8859-15?Q?V3ZPiTIzsf6gQtbSA0JBBNHYJaXGFKqGECCugUirEo/gvaUSsZo7CX8vz?=
 =?iso-8859-15?Q?xW4TQirasFYD+Ao669YAl5zYupY8yVbdXEFCun7Pcy1eVkPyKH++UA0dZ?=
 =?iso-8859-15?Q?kI7ikTVOvK7VNGDNhz/N8hnB/QSM2b32pkhaDMyc0Bew02R6KZviQ0A6+?=
 =?iso-8859-15?Q?BMjPuD2MK5PKzbjlyEwGIFNLR1boCYlexHXhRz0T2LSC1d76laXQaoFy7?=
 =?iso-8859-15?Q?fuyuWIw+aTHQrpP8sN560/w0Sb+nZ/SFbSuguGHbJ1NdfZbH503sve8Nf?=
 =?iso-8859-15?Q?HtGF6aaKXwar6qgyzmP4k7FgO+4PTL0bBD1+42X90PskkEEsQN1aedndc?=
 =?iso-8859-15?Q?jZvbAzNIYGZkcd2o19VqWVzATfzIfDxSxCm/h61XCi2ekZumw8UmTY5VK?=
 =?iso-8859-15?Q?E11djGmWhEU7BlVvEeaU0r6pg3lzIi/O+HeT8yqotn0hfG1n6mCoWGlth?=
 =?iso-8859-15?Q?Yxz2JrOeH5X8/4Sgkj0DL2+ynhbeV7nOA64PovSW9gQyny8n1RDpdYZy7?=
 =?iso-8859-15?Q?eLTPeqyG9Yls+vzZIrJ+xu5w/8iU3qCR6FKHsuduZaKf0iYQqiH1cOV8V?=
 =?iso-8859-15?Q?DId4bSkcEDstFXCdSzTxtBVSVE9LiKtO2Q2FpF6HT4FyIKshkvc57yAbG?=
 =?iso-8859-15?Q?H9xXBSwbuvVIlCAeaPZGXQzol8i4FNZPAf4khF9JEjt+TLg8Awzx9O8Fq?=
 =?iso-8859-15?Q?qIjuZMbe45DGc1yJYqnUuOpTlgsr4nDVIKx3wa8pPu69p5aZqSGhfXM3m?=
 =?iso-8859-15?Q?1xdLV3T/qKSigm56LrvE7yb/CysEzZ3zWaJSspdeDSjISFhtxvq23fw+J?=
 =?iso-8859-15?Q?T2Ldmied03Z/heqjjkHLblDYPF1UoHVoL9+8jOl/IF82zAinoQk8OFMR5?=
 =?iso-8859-15?Q?auhujk50VK3uoUa+qzPRbVZXTY9BMMDDQDbEWDqFnovQv9IPXMoyocL/W?=
 =?iso-8859-15?Q?hJ1AUX3s5TDhCoZ5c9DBdHong6U9GwQa80Z3FkrXCOqcatowmA0Sx3ijm?=
 =?iso-8859-15?Q?3S7tTC66w73mRe7xJMg+lPdW45G+qOBCiF17Qa+fZo+VwbNlUrf3DCV3X?=
 =?iso-8859-15?Q?0/qBrY9LJZcns2BqN3OUtKsbrawKg7H3Hs/eUZI/Yq60zcWWrMVkq29dS?=
 =?iso-8859-15?Q?nbzXQwj8ZkHgMEyOd7lZIeHteZSo4U7Krpp10Zdlvnp4PMiyh+xQJSBrN?=
 =?iso-8859-15?Q?V1h68cE4sqHzK9D4NZlNc8HOsFbl5ZpvO9L/fzjUuFoGf+VD90uNP/GGF?=
 =?iso-8859-15?Q?CLLTsoPp1Z2ybvYGIbxRd/xLWwBEqlmLCUG48GMutvCwmkw/3z6h1AtDt?=
 =?iso-8859-15?Q?S7wUdv+PTDWFiL0xcgqeIxPA0eQnbxJrLPN5zWb7BtqedGpPPvMZUajP3?=
 =?iso-8859-15?Q?S/Z6ZH37JlXpaS0iGASbEdPgh8UIHEFRIOexLESVzyG5Djp9UbTLR2F03?=
 =?iso-8859-15?Q?YKUjnTeNWEsIu5Ls1cyFKGMf1MhQjsZ8xKb+DwSCNy8DejcxONxqX/v1L?=
 =?iso-8859-15?Q?Rk9PhuOm3jHBZiezcYKtFuOUXFncgMmrQ+Do5e1tYCz2011o08/EPV312?=
 =?iso-8859-15?Q?UNk32cjjBI3S+jYJW3kM/mjO6wT+ErOcRAirCueuofjPD/YX9gtUvmA10?=
 =?iso-8859-15?Q?7tQEqF/c50zyeispetO91BJyzsjq4urVbJDA9tFn1Rc/IWIFs/KUXVAKA?=
 =?iso-8859-15?Q?rWsVBsh2hQoxOook5F+guwXoS?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <A6EC267CAC0954428C342A250E905F61@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4620.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4fb7c95-605e-4e9a-a9d6-08da19b1be68
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2022 22:47:22.0001 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HgBV6B+p9XfpVdiSKIx6azqZYEpuOPg2Nj6CjZduSoujq9COxZ3xhH3bTWy0wQyvCOAFV17rZ6//ypdv6kYexUGJU7Bx8SjJT1c0zcao8dY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3600
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

On Fri, 2022-04-08 at 20:21 +0300, Imre Deak wrote:
> Factor out from drm_dp_dpcd_read() a function to probe a DPCD address
> with a 1-byte read access. This will be needed by the next patch
> doing a
> read from an LTTPR address, which must happen without the preceding
> wake-up read in drm_dp_dpcd_read().
>=20
> v2: Add a probe function instead of exporting drm_dp_dpcd_access().
> (Jani)
>=20
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/dp/drm_dp.c    | 28 +++++++++++++++++++++++++---
>  include/drm/dp/drm_dp_helper.h |  1 +
>  2 files changed, 26 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/dp/drm_dp.c
> b/drivers/gpu/drm/dp/drm_dp.c
> index 580016a1b9eb7..b58e30132768d 100644
> --- a/drivers/gpu/drm/dp/drm_dp.c
> +++ b/drivers/gpu/drm/dp/drm_dp.c
> @@ -527,6 +527,29 @@ static int drm_dp_dpcd_access(struct drm_dp_aux
> *aux, u8 request,
>  	return ret;
>  }
> =20
> +/**
> + * drm_dp_dpcd_probe() - probe a given DPCD address with a 1-byte
> read access
> + * @aux: DisplayPort AUX channel (SST)
> + * @offset: address of the register to probe
> + *
> + * Probe the provided DPCD address by reading 1 byte from it. The
> function can
> + * be used to trigger some side-effect the read access has, like
> waking up the
> + * sink, without the need for the read-out value.
> + *
> + * Returns 0 if the read access suceeded, or a negative error code
> on failure.
> + */
> +int drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsigned int offset)
> +{
> +	u8 buffer;
> +	int ret;
> +
> +	ret =3D drm_dp_dpcd_access(aux, DP_AUX_NATIVE_READ, offset,
> &buffer, 1);
> +	WARN_ON(ret =3D=3D 0);
> +

Could you add "drm_dp_dump_access" similar to drm_dp_dpcd_read/write
in order for this aux tranaction appears in the log?

Thanks
Khaled
> +	return ret < 0 ? ret : 0;
> +}
> +EXPORT_SYMBOL(drm_dp_dpcd_probe);
> +
>  /**
>   * drm_dp_dpcd_read() - read a series of bytes from the DPCD
>   * @aux: DisplayPort AUX channel (SST or MST)
> @@ -559,9 +582,8 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux,
> unsigned int offset,
>  	 * monitor doesn't power down exactly after the throw away
> read.
>  	 */
>  	if (!aux->is_remote) {
> -		ret =3D drm_dp_dpcd_access(aux, DP_AUX_NATIVE_READ,
> DP_DPCD_REV,
> -					 buffer, 1);
> -		if (ret !=3D 1)
> +		ret =3D drm_dp_dpcd_probe(aux, DP_DPCD_REV);
> +		if (ret < 0)
>  			goto out;
>  	}
> =20
> diff --git a/include/drm/dp/drm_dp_helper.h
> b/include/drm/dp/drm_dp_helper.h
> index 1eccd97419436..91af98e6617c6 100644
> --- a/include/drm/dp/drm_dp_helper.h
> +++ b/include/drm/dp/drm_dp_helper.h
> @@ -2053,6 +2053,7 @@ struct drm_dp_aux {
>  	bool is_remote;
>  };
> =20
> +int drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsigned int offset);
>  ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int
> offset,
>  			 void *buffer, size_t size);
>  ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int
> offset,
