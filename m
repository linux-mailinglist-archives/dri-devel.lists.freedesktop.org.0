Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DDF752FE1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 05:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D6010E013;
	Fri, 14 Jul 2023 03:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D468910E013;
 Fri, 14 Jul 2023 03:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689305044; x=1720841044;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=meatMYljnMfCMm+9AGBF9E2LXrul73R2nFpl1A5/H5Q=;
 b=QMx94AqdWRhc2V+BniABILtMjTufhNgb7odi+fbeP9q/HDPBgQ9U1pLN
 2Xy72R3+/YB8qCvSRoQfydiDOXB8EM9pTV1Ls6zMV3VlN2BkubIDwY3ly
 qvFts5l2G6XU06Q+HQydf/QxUFJEBZnmD0wSfNFahacsPMp+HVaGzx6Ah
 8uX9XLDcEK745/3Jgva4V5OfrJRHleX2uPKgQHGADKGMaPmfsTm4n+AvO
 NxkJC73rxgfyYgNjIzvr0eyUqxXvnYvhBX93S/P7WpcX9DgTb4AY1VDip
 O2Syidf4Bemw3TqsoCoNTSR6QYswbHCoC8ixtFGCU5RbvkYbdVDpuo0TM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="451741012"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; d="scan'208";a="451741012"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 20:24:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="757421474"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; d="scan'208";a="757421474"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 13 Jul 2023 20:24:02 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 20:24:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 20:24:02 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 13 Jul 2023 20:24:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 13 Jul 2023 20:24:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPAIPbOxZNI3p6451iBa6opQMAqxSl1eFsdIl7J/VhQwhdIRSpXY/drXJFznnsAwr1t15LdtknZ9BnnOupyOV9QfNv/H1aLoOgyEnmBN8fFNUa2ScAX+YECN16VJp2HKJR3UFMQ6vRjvb0T/0CGrUrFCgq6YPu34dyn8tBMk4phkZD6cgQ+a4Ot01pPlWG44PwFNyG1DxKbZA+6/Ots1ucVxVLuPPhXdK+58G58c1zPKb9T/Z+ZxbJw7pBmD4pQQ9xdxlU62hpvT/lgtVtmAjTgZgj8qc8xmyRdobEGzlr++LnUjI37s7XICILBBr+ei2ygYHLFnR22iLu0adWaHKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1WfIXmX7772ymBtoZ0DJooaNWfS8+N9tfMwVIxmRzA=;
 b=ntfl4UwORK/m2PrA9LO8qAC+bo2WP6eqVcADVUHP+hGEplL8imRX9Ex7HTpXL8p6gPPyPM++YSCQUKSoEvmR34HJATbS5CCGgpy0h+7y5ZkZshFLk91Mj/vSaCmLhjLqf0Uf+cCBCwZneG0DAe74PxEzFJ2OePistS74TsYFcqtE6xKg/pOL6cw0Xu2toBN2BStIBm6+RsOTiatD8hgGbXAPFsfbdgwliaTCt7zmtNldLtGksDNIMske2/R9VYO+dhA3c/zojqRMOEtHl07g4en5xPq/8BG+YU7v6T572AKJIMYc4pDe/sQ6DLdBZlbbnsG1FuugfNT4lOpBGjq9YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL0PR11MB3170.namprd11.prod.outlook.com (2603:10b6:208:64::10)
 by CY5PR11MB6317.namprd11.prod.outlook.com (2603:10b6:930:3f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22; Fri, 14 Jul
 2023 03:23:55 +0000
Received: from BL0PR11MB3170.namprd11.prod.outlook.com
 ([fe80::fbc7:d70e:14d0:6e2f]) by BL0PR11MB3170.namprd11.prod.outlook.com
 ([fe80::fbc7:d70e:14d0:6e2f%5]) with mapi id 15.20.6588.024; Fri, 14 Jul 2023
 03:23:55 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH 02/19] drm/i915/dp: Move compressed bpp check
 with 420 format inside the helper
Thread-Topic: [Intel-gfx] [PATCH 02/19] drm/i915/dp: Move compressed bpp check
 with 420 format inside the helper
Thread-Index: AQHZtXYnM+jWcScYsEyPXRQB9+eR0a+4mYLw
Date: Fri, 14 Jul 2023 03:23:54 +0000
Message-ID: <BL0PR11MB3170409142B5338A476F1254BA34A@BL0PR11MB3170.namprd11.prod.outlook.com>
References: <20230713103346.1163315-1-ankit.k.nautiyal@intel.com>
 <20230713103346.1163315-3-ankit.k.nautiyal@intel.com>
In-Reply-To: <20230713103346.1163315-3-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR11MB3170:EE_|CY5PR11MB6317:EE_
x-ms-office365-filtering-correlation-id: aa2b9bd5-e942-40c4-2920-08db8419c0fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hXqjRIreOMgOissh3c565Llm73aEbNl7xSTi7uK7iPv6XC/FeGlcHTtkqQj5/T/8lhHGIL2k66U/8pWuQshD7fVdNUmu88sBnYLpqfX2sWthyh3E89Pm6gnoPjYA2/ErhZHsZ8Djpj1h5glx29ywOfjF9gKXTLJgqGjTZztXsPiI+3zAzlpCfQuu4z/AB8PNemtmZKFdGrIqLVu8RyJ8u0XGgqrUF3u5jDgvs4RK1AjRicB24xi82vMNq2rq589dcXS+OaIRc8ZTrDGu48sxj//IYpov+PCGdE3fOa2/hcZKj+1JRZ2tLB4XlIDtfhWbFsXMhtdi987kCMrX7afM4HQYLU2mItRyCewd8AE1Ui/2onNpQ18b4SghZ8GJhsgEgYu641kormb1BkzgmjhXGBH3SFko0os9A7/yTXhmQyeyoUGBGgrBi4tEKunLNgHMTyf/k6XIbDDDx8aASisUFcDeWZnUPYgckQmKMIdaeZZTyAvXfsVCspo9fN1T8MeqWH+MHqQFMHk5UROoEHu9EPi8OiC1WU3CvRkSTHMdkyyTbaf32lki+eFPdgtwyi7t/y+dhJ1JAvGt5E33pzBG4ewmx0/ozLB4Oqx4fTmV9q9Eqwep3gAcXlak636eB08Q
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB3170.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(376002)(366004)(396003)(346002)(451199021)(2906002)(38070700005)(122000001)(82960400001)(38100700002)(83380400001)(55016003)(64756008)(66946007)(66446008)(76116006)(71200400001)(316002)(450100002)(6506007)(66476007)(53546011)(66556008)(186003)(26005)(41300700001)(33656002)(478600001)(7696005)(9686003)(110136005)(8676002)(8936002)(52536014)(5660300002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OzfSfKO6gzMTbxVGZCepJoKmVb5N/m6JtXG7rQVIvadPr0owCMfiM+b+o3uq?=
 =?us-ascii?Q?CKNTl1vafrx7aa3qfXyT6JjLJegdzUs0HGGF7/P+CVpBjyLd9b7u+itdhJBF?=
 =?us-ascii?Q?y9ToSGq72XR8EkytwG6B2R+0EJTBOk96/vsx2anPr43zOpcdY0WJ8n4rYIe8?=
 =?us-ascii?Q?GxhwICxDNxX6qCx0F0SPdAFTPT7JXdpwUnxUcVgVFix4UCtkOh0pMCgRirqj?=
 =?us-ascii?Q?3KtNPirGl+XXeP362lZh4TPlLGjlq1dNzPI6kX3o2FZixDrr/fwV4uczj5hS?=
 =?us-ascii?Q?3odF7AvwGTv9p9r5egXKKuvRfZi1X24iATiNbp7l/e3ZRlEKFiYbPKuZ+/vR?=
 =?us-ascii?Q?+UN6GkzMuvjkKE0ilnWVEbfDtKISfozP97abrJjdfghb1NzjkYr1pYVTWFoo?=
 =?us-ascii?Q?6Iv4L6Dm8SjPfucDRNse5Lx34KMDiMp0m8s2A8zFhZ4X4D5sy3AQvwIcqwTH?=
 =?us-ascii?Q?y9rR+887rhJkJmERnJNmKQNJg0ZHJ2d1l28r5rXw2+JY6i0rNE7VxHqksa4u?=
 =?us-ascii?Q?onwLRGaURF3LYa++TzXQR0guQvfTpOta9OQhHJa5HCS5VgJ6uAAJbbJbWJ+B?=
 =?us-ascii?Q?Ji/nWD1AwVTNdAkAqr5ySZWhy/qkVb9IXlazNSnAKSlzGxWu+k5aX/W55nw0?=
 =?us-ascii?Q?R34zfOFeox8myGZA+gWu7U61yDIPUNzDGzkYPEpq/XtQc1FmIa9IHikGwrH9?=
 =?us-ascii?Q?5h12Oqn6bvvpME7VUm6lE/4UtzDpZ3XUKw0m9q78HJlxoOk+BM8utUAyCgS/?=
 =?us-ascii?Q?4p9rE9w4WMHPESEO3Iv6wKmB/7ECViYGlJMaP31sguW6rZHuaHUrixtXzg4K?=
 =?us-ascii?Q?6uV8/Z7TmRyh90TgM/z/I8go4Mib9URsIiJXOLagW+cx2sa9ji2tThGyJsWL?=
 =?us-ascii?Q?Gl2smhFN2xDNYC2fPcSOGeB8F7Xu7bdRT31Ml8OmWLK7f49+IiQmPW03X+Xw?=
 =?us-ascii?Q?7hTgwv89VdzP69K3n46Dh6IHb0wK0aF+Cv77FdhXpFFq/HDoSTm7Qw0W/zCv?=
 =?us-ascii?Q?YBaZsUW2d1s0VejZ68AX4R3ZvpNTL6OrlgnRANC71N9ZrVdgqZYXqxZGpcbA?=
 =?us-ascii?Q?26c5j5BIry4PsGs1ZLNFjIOUPzEq76ZuGSox6SMDKJhsyeC/4XPX7p5/P6nw?=
 =?us-ascii?Q?GTRe74Jinpuime7FoywZYJhXzjHGtjnjN3XNzOwLhgzg1xukYQaRhjoFVqG+?=
 =?us-ascii?Q?Kh4itEx/HL7QrcnAc3cPhANQwwtmAu3koSR7hf45/wbibUXqgTGQfe9UVIgV?=
 =?us-ascii?Q?Ux7T6jfJk35oGR/zcfXz3VBOHRnFVz/N0EzwkAltuAQoHwruOgkIWgVFlYKD?=
 =?us-ascii?Q?MgSEqAcUzOGePd2xJP8L6FaI1l6PS4bwxtFuSN8lUbkxaF5gaI8/IG6jksdh?=
 =?us-ascii?Q?qW4k+URdrP4EiBjiLze2M/ReDjew31tge80Hs1wIMhOMI1z4G5ZuzkAHqEFr?=
 =?us-ascii?Q?KJKf3S571KLQUFKLkHriWm/Bd6yAPBNry043fi2wwhzXolghMawKFq79iYBr?=
 =?us-ascii?Q?pzXG0vDKSRRzz7uc+0zfE5JcaasW2KIpvRCtXnBPSHH8ufGlaMyN7vL7QmSq?=
 =?us-ascii?Q?arMVS29tEy8ShO0cIK/dJrDYBfgVrXUv25wKcwTt?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3170.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa2b9bd5-e942-40c4-2920-08db8419c0fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2023 03:23:54.9600 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HqNbZPqEsKalB3lCMyCHB0apWLe+REPG20TkgMYgjfBzgDEBiqjwYZsPnm89QFXE6YWnB9yXr57rx16JY63TQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6317
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
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of An=
kit
> Nautiyal
> Sent: Thursday, July 13, 2023 4:03 PM
> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Subject: [Intel-gfx] [PATCH 02/19] drm/i915/dp: Move compressed bpp check
> with 420 format inside the helper
>=20
> Move the check for limiting compressed bite_per_pixel for 420,422 formats
> in the helper to compute bits_per_pixel.
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
Looks good!

Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
--------------------

>  drivers/gpu/drm/i915/display/intel_dp.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index e0d9618fccab..d1db457fb17c 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -773,6 +773,15 @@ u16 intel_dp_dsc_get_output_bpp(struct
> drm_i915_private *i915,
>  	if (output_format =3D=3D INTEL_OUTPUT_FORMAT_YCBCR420)
>  		bits_per_pixel *=3D 2;
>=20
> +	/*
> +	 * According to DSC 1.2a Section 4.1.1 Table 4.1 the maximum
> +	 * supported PPS value can be 63.9375 and with the further
> +	 * mention that for 420, 422 formats, bpp should be programmed
> double
> +	 * the target bpp restricting our target bpp to be 31.9375 at max.
> +	 */
> +	if (output_format =3D=3D INTEL_OUTPUT_FORMAT_YCBCR420)
> +		bits_per_pixel =3D min_t(u32, bits_per_pixel, 31);
> +
>  	drm_dbg_kms(&i915->drm, "Max link bpp is %u for %u timeslots "
>  				"total bw %u pixel clock %u\n",
>  				bits_per_pixel, timeslots,
> @@ -1738,15 +1747,6 @@ int intel_dp_dsc_compute_config(struct intel_dp
> *intel_dp,
>  							    pipe_config-
> >output_format,
>  							    pipe_bpp,
>  							    timeslots);
> -			/*
> -			 * According to DSC 1.2a Section 4.1.1 Table 4.1 the
> maximum
> -			 * supported PPS value can be 63.9375 and with the
> further
> -			 * mention that bpp should be programmed double
> the target bpp
> -			 * restricting our target bpp to be 31.9375 at max
> -			 */
> -			if (pipe_config->output_format =3D=3D
> INTEL_OUTPUT_FORMAT_YCBCR420)
> -				dsc_max_output_bpp =3D min_t(u16,
> dsc_max_output_bpp, 31 << 4);
> -
>  			if (!dsc_max_output_bpp) {
>  				drm_dbg_kms(&dev_priv->drm,
>  					    "Compressed BPP not
> supported\n");
> --
> 2.40.1

