Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EF3709558
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 12:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C63D10E0AA;
	Fri, 19 May 2023 10:47:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB53810E080;
 Fri, 19 May 2023 10:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684493222; x=1716029222;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O6WPAl+XIR5iGRnzA7fPE0FZAJOMwCPEILEngtVGsKQ=;
 b=M1t5U/WaQBk3VNTTivEl8b+mwz5mIDIFUbKLLcziYudQQvlJECI4bx1k
 yKNKJ6RL9mY31mzt+00J0nqxPG1GseAc6n3OXQOICY/Dj8nP5/yI9IPYj
 dOcPhFu7rF4GsaDZ+dn8AIuiZL/nTusleLNNFt5hcZ3zVriCiS7ZiBCkS
 yqCnA1hXPSfc3DIytTE4vmjnLv2U1vbAIRJHvzXbsv3IRJmf53oA1Icln
 75+iktBPyKnOFzvSOFbhD4bcR6BxZ59aT0Bqj8pD29ET47R8iXBjFrjm/
 yTnPqKAAe7o8qdss/M5rgQCtqeMGIR8h4B3Bka6GSNDlwOatanfPXxHSz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="351182330"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="351182330"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 03:46:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="696666171"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="696666171"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 19 May 2023 03:46:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 03:46:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 19 May 2023 03:46:58 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 19 May 2023 03:46:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikXKQOmeoD1fvigVI8feSXCKTMkOPmlYc+WAUVxHQE4rEa7/UZRzyl0R0etLS6s56ivS7WTZrQRWGrRkPB4xvMGnQC4wLrA5sm55lX8RLRB998CAnQ90KqWXL9lhjbiILyEPVmgraumCT2wTDqG4SFB0T4otFtrsAW35b31npYWQlLI1ukkhtMfwp+RmfAGFcvJtb+YhAq4lnZiSOnJBXWx23KPkaTLTtITGZ0A8ZYaw3niDlFHl1HprLBdINOl4lY6Q/Z5ImiUKp5RQzrBr4HaP7CwPacYV0hOoHpaR7x6pbH+F+1S/NvLrbwDuKu8WeTADXJk5xHgQM1FCLwRc+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yVpmxcq+l/owYIuE4y+JxT/XJQ9ttg+6YiHGgrXyCNk=;
 b=dHJUU+N1QX8VuX7G8ca4zLtgAGZhrH25GMAzmVujMRTJC/WHwCtwBl6JLeQ99TaJ0iC4wntKHmZD1pwbYbcyzl9jUEWvZjyHMO/iK6cqIS5lMCTi2mWnbUINB6irxVUZvUknAFZ53/RUFfpXrRImNIj/3lKVhRDh/4eQcq4PuQvklnWQrt+U6GLcb0o78uyJSGLhEqwc8nOUtAD/QB07LQvgjB1ZMVMm4EvYdKBLurr4n2/1yjZONrP4Ery2Ly2ZQr5n97CNgsJIch/Dbt88+DBxARhV9+1ESDVzfNak4XuCFkdSxQUwTR9DIo7fWXs2lEWP3KKe4Tit9Zgl9OfXRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 10:46:55 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3c34:3b9d:4abf:d93c]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3c34:3b9d:4abf:d93c%3]) with mapi id 15.20.6411.019; Fri, 19 May 2023
 10:46:55 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: RE: [PATCH v7 6/8] drm/display/dsc: split DSC 1.2 and DSC 1.1
 (pre-SCR) parameters
Thread-Topic: [PATCH v7 6/8] drm/display/dsc: split DSC 1.2 and DSC 1.1
 (pre-SCR) parameters
Thread-Index: AQHZiKpNklz9nwIHl0S1ZcPePAxJcK9hbMXg
Date: Fri, 19 May 2023 10:46:55 +0000
Message-ID: <SN7PR11MB67504AFA37BCFB0C664588EAE37C9@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20230517102807.2181589-1-dmitry.baryshkov@linaro.org>
 <20230517102807.2181589-7-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230517102807.2181589-7-dmitry.baryshkov@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|CO1PR11MB5009:EE_
x-ms-office365-filtering-correlation-id: 9ca15f33-e9db-4f0f-1577-08db58565d0b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jvrb0Y2a5KeBgT+oE7r5FJr9TWKP2huYxYH1wmnenOv7rS5/x/KCvBUmB1AfVzx2Eu5TbRYO1utxBrgUDTALAV8+H5jmb6xau5aOE+TSrpMV9IBM1QpWs61hSiNGNfPeweh6xQGhT2nB+RemCLmDyZGKXPItQ0QHxWLIatiqwE95OAEwrTpU41+lP9Y+rILEImqAoOskWPXtwsbqmffzqb2jsT3OAwCUdGK3b/Gc3Sjw5/QsnKyIzX1xp/r9HUMa4i33hrSrvs59gT2aPfFNJTyaA5oyLyL9sJP0jIgPA8iyPonTNZBZi7HVmygppCRNyKpHMTPs2TMj2a3CbNAJpgq9yVW4vvyt8AEtwWsTyOXOCeimKaLbFHfopCtQhZkugVDBAVZIdEi+UTUa+HyENwJT2DCPNij8hC05w1piYo+VLXuY8jmGTSXYtFVTh7dPCC1megZrI799cvfnNOdAzNCsCrCqkjh/15dGyJh7pZgcGGcuGeoVsV/4fpPs8cc4DsLXDflxcuyw8YFYRrR4mqqY4i7ZtVm4HPX/ycDoJBRvZlbn6Q8ytsDDuSnoNDALNoiAUnTqRgmAIXxMvSGJ90QnhALAFnnedVyxviCP4dXPy85gEDwS98ihfKcUNquC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(376002)(396003)(346002)(366004)(451199021)(76116006)(64756008)(66556008)(66946007)(4326008)(66476007)(66446008)(110136005)(54906003)(82960400001)(8936002)(55016003)(8676002)(478600001)(316002)(122000001)(41300700001)(7696005)(71200400001)(30864003)(2906002)(33656002)(86362001)(921005)(53546011)(6506007)(9686003)(26005)(38100700002)(83380400001)(186003)(38070700005)(52536014)(5660300002)(7416002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?2OpgZFPF84hWJ3IwuhkoeUx1GNmE5rhG+M5vQ0epi09LWC+zXkQ7socNKb?=
 =?iso-8859-1?Q?WGv3++MjRtNUGR8YuJWqbxm7FT5ZVTcbU3sVnag2kaJ6VADgAPTgVqSBF1?=
 =?iso-8859-1?Q?W3kUXWkiC8Sx6Wret4OnMmbFzj7vVN0+2xx8petIUeNl5T4RJ431WLjGGx?=
 =?iso-8859-1?Q?pyDlTMP2O3Uh7ujP1xsQQLLoxLHEqjpOxbvh8JR97xTPiFYAOnkcDdG0e6?=
 =?iso-8859-1?Q?2ob7I2ccl3I/pOIxQG2X5gd5KMbK7KtFeeCTRQ1tjXqEg5PZVOZVnt2w0V?=
 =?iso-8859-1?Q?Q49K/5Ug+BiSCD6dO+/sSVKG9tvwBEQ5P1Bw4vZQ2RDmrKZKmsxngi1Wc6?=
 =?iso-8859-1?Q?+jtCNQ3VSIXOUQf7xwVQFPUlh7bXa+qZeKbedGvIqnp+Bz1PS41XmsUBmE?=
 =?iso-8859-1?Q?JfcVL5DMb2rPbA9jrszYdmAAPeu2DNnUnpQ1Pb66XFmxymOUoygMJJrF88?=
 =?iso-8859-1?Q?tPSOIQq0XulovBSMfRCDfLIVcXrJm1ep22Lwrlkp/rLFR2OKyUzlWxSgWQ?=
 =?iso-8859-1?Q?dfUD2NG5GtyL7xiU/CAPkVovMq5AoI3Fi0LEOFhVIDfLMmAuabMum6WTeI?=
 =?iso-8859-1?Q?JZMKoMbJ3TgcWzFzigmJHJV+t+L6Sprtez84GAHMcLjrOznRFZB94m5jZA?=
 =?iso-8859-1?Q?jfzEdgBbIIdo4E9ZUu00dEuK7cVipPPHALrsRVf1uEQcgxIfZ+CCYXFHIO?=
 =?iso-8859-1?Q?nNBbLT6D9iaLaApgAauYPUTF61lbj8/6nVWeGuqT7TMf4ljGj+OH/+nZDk?=
 =?iso-8859-1?Q?vSU8dPAYn/R1qfyiF/MW+cUIBOzcRbLQ40kXTA8mSekxl+xtyYTAlHoPz5?=
 =?iso-8859-1?Q?6rkHx+avov37ff2i8sfs/PWJCWmHBU2Q9CVJDhGo/X6WWvPU8+NkAADw2E?=
 =?iso-8859-1?Q?8vKQ68s3+ILJFIFk5IXIivoS+Zewoy+p92KOyqN5pbeDrylJKtJDhgw045?=
 =?iso-8859-1?Q?U6KxsCeE8lS82Lfas9zGdSHElWJ4N4BNus1cOu1vAItPoBLNBaWEld/REJ?=
 =?iso-8859-1?Q?ZsNsLXv5nbzINdJNlP39JwaNtMycfaAoQAm7gkn1K+vH1FgcfiH5U+c8le?=
 =?iso-8859-1?Q?VHfqMx8e3z2ncwxiZwczBTou5zY2wVetdjpyiGbO8xIjPL4vL4txIj8U2Z?=
 =?iso-8859-1?Q?5/oKJGhUB3xVZthynuQJphn0T7o/TD0QgGol0Z3ANVt3AtiBE7qGmlOqi4?=
 =?iso-8859-1?Q?VtiGxsicmVE6y4rxpyEFLMyxyCrSbgErtTEFBWDceTyyBo71LNqdjAXbMi?=
 =?iso-8859-1?Q?9mnVjzkrZuI2RrqEbDqiz/6ABtz+FmobO6QHVW/+mPSKWEuj1D3j2zAkst?=
 =?iso-8859-1?Q?XOAwdQ6YRn8zIXCMhbxoGdWHswXdBwBcVO5MVSOWNVvj7LUMjNXq87HKn6?=
 =?iso-8859-1?Q?kgmLYeHOqHE4kUPbGvYUc/XldvFhnw3I20Y4JsHU7abRyK/qXYH+hZkWBH?=
 =?iso-8859-1?Q?MAbhEoDxrcIKtJllmjhLhp7RHltHl3coPcC5F9biSaJ98rqwIrsIhkFYtO?=
 =?iso-8859-1?Q?xuxLCeN4wPbOl/dU83Pt0FdghVN6qPPHHTjZU07zn/rj/T9e9eWAybdnNt?=
 =?iso-8859-1?Q?H7eVYZ4/CAYGdVtSpB2ChRG2pP4WjpgF20VZgn48J6PRC/1c//UKGnT5uy?=
 =?iso-8859-1?Q?ecepf20LGhoVAlCPf9/d2vgHzXYNZqYyku?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca15f33-e9db-4f0f-1577-08db58565d0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2023 10:46:55.4346 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vNvUOXR24i7OUrlzLTzTYlaUZfr/lclP2wr5WV2z3I4t13x9KB7K0YVQoqUCill/Fx+cBIpy/cnUm2HgacPNMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5009
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
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Sent: Wednesday, May 17, 2023 3:58 PM
> To: David Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Ja=
ni
> Nikula <jani.nikula@linux.intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; Joonas Lahtinen
> <joonas.lahtinen@linux.intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>=
;
> Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>; Rob Clark
> <robdclark@gmail.com>; Abhinav Kumar <quic_abhinavk@quicinc.com>;
> Sean Paul <sean@poorly.run>; Marijn Suijten
> <marijn.suijten@somainline.org>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>; dri-
> devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; linux-arm-
> msm@vger.kernel.org; freedreno@lists.freedesktop.org
> Subject: [PATCH v7 6/8] drm/display/dsc: split DSC 1.2 and DSC 1.1 (pre-S=
CR)
> parameters
>=20
> The array of rc_parameters contains a mixture of parameters from DSC 1.1
> and DSC 1.2 standards. Split these tow configuration arrays in preparatio=
n to
> adding more configuration data.
>=20

LGTM.

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_dsc_helper.c  | 139 ++++++++++++++++++----
> drivers/gpu/drm/i915/display/intel_vdsc.c |  10 +-
>  include/drm/display/drm_dsc_helper.h      |   7 +-
>  3 files changed, 129 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c
> b/drivers/gpu/drm/display/drm_dsc_helper.c
> index acb93d4116e0..f1ba39df5708 100644
> --- a/drivers/gpu/drm/display/drm_dsc_helper.c
> +++ b/drivers/gpu/drm/display/drm_dsc_helper.c
> @@ -325,10 +325,88 @@ struct rc_parameters_data {
>  #define DSC_BPP(bpp)	((bpp) << 4)
>=20
>  /*
> - * Selected Rate Control Related Parameter Recommended Values
> - * from DSC_v1.11 spec & C Model release: DSC_model_20161212
> + * Rate Control Related Parameter Recommended Values from DSC_v1.1
> spec
> + prior
> + * to DSC 1.1 fractional bpp underflow SCR (DSC_v1.1_E1.pdf)
> + *
> + * Cross-checked against C Model releases: DSC_model_20161212 and
> + 20210623
>   */
> -static const struct rc_parameters_data rc_parameters[] =3D {
> +static const struct rc_parameters_data rc_parameters_pre_scr[] =3D {
> +	{
> +		.bpp =3D DSC_BPP(8), .bpc =3D 8,
> +		{ 512, 12, 6144, 3, 12, 11, 11, {
> +			{ 0, 4, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
> +			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
> +			{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 }, { 5, 12, -12 },
> +			{ 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(8), .bpc =3D 10,
> +		{ 512, 12, 6144, 7, 16, 15, 15, {
> +			/*
> +			 * DSC model/pre-SCR-cfg has 8 for
> range_max_qp[0], however
> +			 * VESA DSC 1.1 Table E-5 sets it to 4.
> +			 */
> +			{ 0, 4, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 5, 10, -2 },
> +			{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
> +			{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
> +			{ 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(8), .bpc =3D 12,
> +		{ 512, 12, 6144, 11, 20, 19, 19, {
> +			{ 0, 12, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 9, 14, -2 },
> +			{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
> +			{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 19, -10 },
> +			{ 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
> +			{ 21, 23, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(12), .bpc =3D 8,
> +		{ 341, 15, 2048, 3, 12, 11, 11, {
> +			{ 0, 2, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
> +			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
> +			{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 },
> +			{ 5, 12, -12 }, { 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(12), .bpc =3D 10,
> +		{ 341, 15, 2048, 7, 16, 15, 15, {
> +			{ 0, 2, 2 }, { 2, 5, 0 }, { 3, 7, 0 }, { 4, 8, -2 },
> +			{ 6, 9, -4 }, { 7, 10, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
> +			{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
> +			{ 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(12), .bpc =3D 12,
> +		{ 341, 15, 2048, 11, 20, 19, 19, {
> +			{ 0, 6, 2 }, { 4, 9, 0 }, { 7, 11, 0 }, { 8, 12, -2 },
> +			{ 10, 13, -4 }, { 11, 14, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
> +			{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 19, -10 },
> +			{ 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
> +			{ 21, 23, -12 }
> +			}
> +		}
> +	},
> +	{ /* sentinel */ }
> +};
> +
> +/*
> + * Selected Rate Control Related Parameter Recommended Values from DSC
> +v1.2, v1.2a, v1.2b and
> + * DSC_v1.1_E1 specs.
> + *
> + * Cross-checked against C Model releases: DSC_model_20161212 and
> +20210623  */ static const struct rc_parameters_data
> +rc_parameters_1_2_444[] =3D {
>  	{
>  		.bpp =3D DSC_BPP(6), .bpc =3D 8,
>  		{ 768, 15, 6144, 3, 13, 11, 11, {
> @@ -388,22 +466,18 @@ static const struct rc_parameters_data
> rc_parameters[] =3D {
>  		{ 512, 12, 6144, 3, 12, 11, 11, {
>  			{ 0, 4, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
>  			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
> -			{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 }, { 5, 12, -12 },
> -			{ 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
> +			{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 10, -10 }, { 5, 11, -12 },
> +			{ 5, 11, -12 }, { 9, 12, -12 }, { 12, 13, -12 }
>  			}
>  		}
>  	},
>  	{
>  		.bpp =3D DSC_BPP(8), .bpc =3D 10,
>  		{ 512, 12, 6144, 7, 16, 15, 15, {
> -			/*
> -			 * DSC model/pre-SCR-cfg has 8 for
> range_max_qp[0], however
> -			 * VESA DSC 1.1 Table E-5 sets it to 4.
> -			 */
> -			{ 0, 4, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 5, 10, -2 },
> +			{ 0, 8, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 5, 10, -2 },
>  			{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
> -			{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
> -			{ 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
> +			{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 14, -10 }, { 9, 15, -12 },
> +			{ 9, 15, -12 }, { 13, 16, -12 }, { 16, 17, -12 }
>  			}
>  		}
>  	},
> @@ -412,9 +486,9 @@ static const struct rc_parameters_data
> rc_parameters[] =3D {
>  		{ 512, 12, 6144, 11, 20, 19, 19, {
>  			{ 0, 12, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 9, 14, -2 },
>  			{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
> -			{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 19, -10 },
> -			{ 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
> -			{ 21, 23, -12 }
> +			{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 18, -10 },
> +			{ 13, 19, -12 }, { 13, 19, -12 }, { 17, 20, -12 },
> +			{ 20, 21, -12 }
>  			}
>  		}
>  	},
> @@ -498,8 +572,8 @@ static const struct rc_parameters_data
> rc_parameters[] =3D {
>  		{ 341, 15, 2048, 3, 12, 11, 11, {
>  			{ 0, 2, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
>  			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
> -			{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 },
> -			{ 5, 12, -12 }, { 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
> +			{ 3, 8, -8 }, { 3, 9, -10 }, { 5, 9, -10 }, { 5, 9, -12 },
> +			{ 5, 9, -12 }, { 7, 10, -12 }, { 10, 11, -12 }
>  			}
>  		}
>  	},
> @@ -508,8 +582,8 @@ static const struct rc_parameters_data
> rc_parameters[] =3D {
>  		{ 341, 15, 2048, 7, 16, 15, 15, {
>  			{ 0, 2, 2 }, { 2, 5, 0 }, { 3, 7, 0 }, { 4, 8, -2 },
>  			{ 6, 9, -4 }, { 7, 10, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
> -			{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
> -			{ 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
> +			{ 7, 12, -8 }, { 7, 13, -10 }, { 9, 13, -10 }, { 9, 13, -12 },
> +			{ 9, 13, -12 }, { 11, 14, -12 }, { 14, 15, -12 }
>  			}
>  		}
>  	},
> @@ -518,9 +592,9 @@ static const struct rc_parameters_data
> rc_parameters[] =3D {
>  		{ 341, 15, 2048, 11, 20, 19, 19, {
>  			{ 0, 6, 2 }, { 4, 9, 0 }, { 7, 11, 0 }, { 8, 12, -2 },
>  			{ 10, 13, -4 }, { 11, 14, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
> -			{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 19, -10 },
> -			{ 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
> -			{ 21, 23, -12 }
> +			{ 11, 16, -8 }, { 11, 17, -10 }, { 13, 17, -10 },
> +			{ 13, 17, -12 }, { 13, 17, -12 }, { 15, 18, -12 },
> +			{ 18, 19, -12 }
>  			}
>  		}
>  	},
> @@ -602,7 +676,8 @@ static const struct rc_parameters_data
> rc_parameters[] =3D {
>  	{ /* sentinel */ }
>  };
>=20
> -static const struct rc_parameters *get_rc_params(u16 dsc_bpp,
> +static const struct rc_parameters *get_rc_params(const struct
> rc_parameters_data *rc_parameters,
> +						 u16 dsc_bpp,
>  						 u8 bits_per_component)
>  {
>  	int i;
> @@ -622,11 +697,13 @@ static const struct rc_parameters
> *get_rc_params(u16 dsc_bpp,
>   * function.
>   *
>   * @vdsc_cfg: DSC Configuration data partially filled by driver
> + * @type: operating mode and standard to follow
>   *
>   * Return: 0 or -error code in case of an error
>   */
> -int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg)
> +int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum
> +drm_dsc_params_type type)
>  {
> +	const struct rc_parameters_data *data;
>  	const struct rc_parameters *rc_params;
>  	int i;
>=20
> @@ -634,7 +711,19 @@ int drm_dsc_setup_rc_params(struct
> drm_dsc_config *vdsc_cfg)
>  			 !vdsc_cfg->bits_per_component))
>  		return -EINVAL;
>=20
> -	rc_params =3D get_rc_params(vdsc_cfg->bits_per_pixel,
> +	switch (type) {
> +	case DRM_DSC_1_2_444:
> +		data =3D rc_parameters_1_2_444;
> +		break;
> +	case DRM_DSC_1_1_PRE_SCR:
> +		data =3D rc_parameters_pre_scr;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	rc_params =3D get_rc_params(data,
> +				  vdsc_cfg->bits_per_pixel,
>  				  vdsc_cfg->bits_per_component);
>  	if (!rc_params)
>  		return -EINVAL;
> diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c
> b/drivers/gpu/drm/i915/display/intel_vdsc.c
> index d4340b18c18d..bd9116d2cd76 100644
> --- a/drivers/gpu/drm/i915/display/intel_vdsc.c
> +++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
> @@ -226,7 +226,15 @@ int intel_dsc_compute_params(struct
> intel_crtc_state *pipe_config)
>  	if (DISPLAY_VER(dev_priv) >=3D 13) {
>  		calculate_rc_params(vdsc_cfg);
>  	} else {
> -		ret =3D drm_dsc_setup_rc_params(vdsc_cfg);
> +		if ((compressed_bpp =3D=3D 8 ||
> +		     compressed_bpp =3D=3D 12) &&
> +		    (vdsc_cfg->bits_per_component =3D=3D 8 ||
> +		     vdsc_cfg->bits_per_component =3D=3D 10 ||
> +		     vdsc_cfg->bits_per_component =3D=3D 12))
> +			ret =3D drm_dsc_setup_rc_params(vdsc_cfg,
> DRM_DSC_1_1_PRE_SCR);
> +		else
> +			ret =3D drm_dsc_setup_rc_params(vdsc_cfg,
> DRM_DSC_1_2_444);
> +
>  		if (ret)
>  			return ret;
>=20
> diff --git a/include/drm/display/drm_dsc_helper.h
> b/include/drm/display/drm_dsc_helper.h
> index 1681791f65a5..66eac7276d04 100644
> --- a/include/drm/display/drm_dsc_helper.h
> +++ b/include/drm/display/drm_dsc_helper.h
> @@ -10,12 +10,17 @@
>=20
>  #include <drm/display/drm_dsc.h>
>=20
> +enum drm_dsc_params_type {
> +	DRM_DSC_1_2_444,
> +	DRM_DSC_1_1_PRE_SCR, /* legacy params from DSC 1.1 */ };
> +
>  void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header);  int
> drm_dsc_dp_rc_buffer_size(u8 rc_buffer_block_size, u8 rc_buffer_size);
> void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set
> *pps_sdp,
>  			      const struct drm_dsc_config *dsc_cfg);  void
> drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg); -int
> drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg);
> +int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum
> +drm_dsc_params_type type);
>  int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
>=20
>  #endif /* _DRM_DSC_HELPER_H_ */
> --
> 2.39.2

