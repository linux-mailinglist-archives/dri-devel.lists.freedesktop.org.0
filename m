Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7F56B05B9
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 12:21:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62AE110E07E;
	Wed,  8 Mar 2023 11:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28D910E673;
 Wed,  8 Mar 2023 11:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678274482; x=1709810482;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GWgnttDxkgFXa+s3wFRH39488v/T9+1y/6FkbKg4iPQ=;
 b=cMnM9CCzJ+6oBSz/G0kWxXPtOoB2onzNkzv8d6zMaXgGB77egijTV6T9
 UR+xCOTbk5mC+1pLzut6BboFZcmcQW3/xFaV/WAn39nVChgUxy+CP5xiX
 EZYmXosfkdkd5QSi8dhwzNXDJRC0lqiCQius8eKoegPXdArAuEsxnp2SM
 9Nao+PaLtjr0ipLNPg+6bfXElrAlWEwY5oz7VPE6KGaP/HIrHES4jaJxv
 c6e7ghb5caUsZ6Mb/wXp72DGXqD0QpQohZqocW3TcvSxUdz1IsUaBjx4H
 QmTbeyzoaYVl0V1hWCoWXY9SSdiM/2JzyEIt/+RLwKQ6VbjHdTA/7iLCq Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="315789500"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="315789500"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 03:21:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="679308312"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="679308312"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 08 Mar 2023 03:21:22 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 03:21:22 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 03:21:22 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 03:21:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X3I6rn1w9TsIXD147xfHeS8eUL0dmGsxMBperMPG5g12CK6z2G7Mp1Yido9Z3QDhU9jff1AHQhV5QnLoYI2+pVeXiQ/1YzQzrWSReed1GVXop+4g9Br/r1SzGPmzBBHGkzXqetagn8a9iGKiFk9IdBASemCfLEziar7lW5WXXVZ1JgATWr2cW+QhcO2Pnu3uIeHHbphOGf5FvNrIEELwUVNtskprSZADbw8Te1X2SavaYJXyavBEh2qJnCmvADe+v1vemKJ41wqJrSDJqFGltwoNaJcl15eQQKg13NYOJv4wXOJ6tcxSEw/Iv1Z2Gn4xrhnFWGrv1U/ON80Yol8Agw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghznJ06oMPxlt2ij9Zf/GwFIIS4pJvvpsWBnLUWJzgc=;
 b=bxBRbFgqSAQoeLTWrpxoMtG9M6njzCrVPyoBpAl3d06UV8zfqEym9dO4OtRFFweTEwQdjkmcAehxvhg+Kk/hl1WNZo94/rkoRkbY40RtHaE6KN2BSWK6Es+2dU5L7BTsGQDWKffWDF3OduEv75HoUjZpRpMct06XkdK29KLjf5k9kUge5BxjtIY4qJaAMu63XaDiXYwjNKBn3WRLziKtTOxDuTPtZOCIE2EbgeniSS6x9t6uom0Z+THlrhQMj8wCAuZYVdcS/PHSO73VWkjvAwHGCYo5Z0HExU9ySU1IsldhFmdPq6jeGxnWiPd2wn/oIYA7HKQwuQaUZH7MwS1/3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 IA1PR11MB8150.namprd11.prod.outlook.com (2603:10b6:208:44c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Wed, 8 Mar
 2023 11:21:14 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::f677:36e:9fae:b45e]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::f677:36e:9fae:b45e%6]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 11:21:14 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2 5/7] drm/i915/display: Fill in native_420 field
Thread-Topic: [PATCH v2 5/7] drm/i915/display: Fill in native_420 field
Thread-Index: AQHZTZH7PMF8BoAIm0q27xNSZn5Oc67wxLRA
Date: Wed, 8 Mar 2023 11:21:13 +0000
Message-ID: <DM4PR11MB6360BE1B4F405D14FB039E0FF4B49@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230222053153.3658345-6-suraj.kandpal@intel.com>
 <20230303053431.4123881-1-suraj.kandpal@intel.com>
In-Reply-To: <20230303053431.4123881-1-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|IA1PR11MB8150:EE_
x-ms-office365-filtering-correlation-id: f7019cf5-ff50-4fbb-b9b6-08db1fc73a27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OYR6CWP8RCTm/MQ1n5/vlVE5phr/Cmha5U6QRVUtEUU+a9am3viX19VOnhk2oOuz7rKJSELDkyp1oJijbxymctm6z5JnkZuERb+F/24IkXU4MKOLKkL9dhvNHkE1XyVMcYR+B5RrRt9PYwSvkX9BLtG6q3ncSCjXHIYWy2F72hKP/CXsuMo8GypkDU1mg8PMJZi+zvaa162g7VMr7nZtU1gL3e9vEwcwaEF32DjEK+hPl+Y+6n4EwyTSKPWSbu0qlkUPeZ3WnHZDnejyRZHIeDLezZ8SOajh3nUuR+W2r+70bDFloVKKhmb3mcKaEEpqCdnX/p3UkVLpuKuDB6CiMvCEQcopzKj8f0irqr1FaJ/PERCZytp/lDmIH7gJjAnOQWffHvnr7tDe+cokTuuUQCKn4ZdkNwnImt0iK8iwd8gbuNHdUlx5yIiRNmY8KLUJ9dWgfaKQ0QWVgXlJinDzjUBn3asFR7doyuevXUj7wukDFxG8c/zLdRBOYPW3OGSiXSA+Hq47VjOGbdWiYf1pLOBG4mGBrMuv16J4uLxe6zfNfuHrv/BR8xNaSKn/dgGEi+Zx6qqUnJ55Z35xdDpQwsFGOauDXwg1uHgW1CZyDnOtt4DC0nFQf6bNAp+VZzE6+VvnYMJwkJl1Wqvzb7kAlbkryOjEKKC128hYcFUbQKP5NgoLgDYBDMhJ8dzXCBV02jCFg215FPemm6ML9UtjGQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(396003)(376002)(366004)(346002)(136003)(451199018)(33656002)(38070700005)(8676002)(4326008)(64756008)(66556008)(66446008)(8936002)(41300700001)(71200400001)(2906002)(76116006)(5660300002)(66946007)(86362001)(122000001)(82960400001)(66476007)(38100700002)(54906003)(55016003)(478600001)(26005)(110136005)(316002)(52536014)(83380400001)(53546011)(6506007)(186003)(7696005)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1niyjUGKGZ4o2Ia0ELezUhA7dL469w0LIcRXdPF4zrBP4Hp1riXvQoi0EOIn?=
 =?us-ascii?Q?hFHxHvzTBNwRcGOW7mF383XIYU11bfO9Gjc61p/yavJLSZSfhH0wn3eDO7Xp?=
 =?us-ascii?Q?543/wYzXOcqpTGdq3Jn5NzKh82vQ+8NPNyOOaXj6bPqjKbElH/594x2F0NBt?=
 =?us-ascii?Q?5rvZRv6OlIrUYGcx4ckuqco8xVBpDn2Bs0AFOE7qCjdhJP6ZJ806BJeL/6nr?=
 =?us-ascii?Q?VK8MiPUiIOAA8hAjxlcORQjr2Z3t7Oqcn2dzM5MAP68euL6s5RqzItgmDt+A?=
 =?us-ascii?Q?I3WD7wRjiMhGyeHgBVXhUC9McmhiOKxVKy/0KZbOOxzpZYzqrVBc3+J/DgbT?=
 =?us-ascii?Q?OtiepiA3X+RChj9ZLjanIfLar57tQLMx105Ln1yYqvrb0ONoDyE6TE9O/yWo?=
 =?us-ascii?Q?7YctamGGZnw4zJ/sKlGpAnA8jLy1LB5vP+kk/ttlzzwu0JWZvWqZmHbuPfaj?=
 =?us-ascii?Q?Mhkn8F7pXuvSsEePzpCMSYOOaFySq3FhSYhAV3VjAgZbqpLTHPwcT2ZVS5G4?=
 =?us-ascii?Q?+ptfQZMBB9JvNzD9K5/x2PTxfahLVEjzMlvO5bst2OdLKza6QvuhFugWWcAZ?=
 =?us-ascii?Q?IGX0/7aTRVTthAlHR2FeMY45lL0SxByjh1SxRrbhtXTDz/4RYrD6S2tfygvr?=
 =?us-ascii?Q?w91pXJm+1gXjw/+I8u1EH77ydJNELqt7opwNdmNbDnn3L8B9/2pPzjnjwerD?=
 =?us-ascii?Q?uqrb2SnZk8qV8rMgCQl+PDoLF6opH4nGggJxEL0Q2ANwPMPebHMCNv5t90v+?=
 =?us-ascii?Q?P7xOYtOYqsivcWyDDPIq18R5YXFBbMQPBgbjfcOgH4PJYkI4Nyd9rV04Ol7d?=
 =?us-ascii?Q?HafpjKdZI3+7pc4xndWCHQCUBicMnakEGNXDJe/zoMgzT9X7iEHX7oy3OCFq?=
 =?us-ascii?Q?zqxMx7o9R+bb4vK/jxUWfKtA4jvUU0io4qDkLUcAtS7qcHBDKUl7n5b2CfVd?=
 =?us-ascii?Q?V6CntFSqPLtgIWFKNDOHN3X77TRzTavj9QPf8DUYxkYTidhD+ZjtXowj+AQA?=
 =?us-ascii?Q?3b67bjQyV6irXuj/q3BqRDxZQj/Qtdy6X/gJ8bQcRVgiepR7XS14QQ4U8Gys?=
 =?us-ascii?Q?tF4n/tzcSODNKZ6zuHbS/JPmfDAV1iiktOo8dD5591Kq7e3Yb9jcG1yGR1Mv?=
 =?us-ascii?Q?XPv1UARepmyj6YxT4S6rAg3PPMbbf21J/0SMHtrjHUsGuq36y2o5MhXs1WFg?=
 =?us-ascii?Q?v0JVfBQWRox+vtPVLP8Y8pvrei4+rIrU1UfILbXtTq7wlu//Yr6Qqz3i+/HA?=
 =?us-ascii?Q?W1nNCP9cbNQTdxZn7YenNNI0LA9osxeD+51CqzlQ23jItltTIo39jxEsIitI?=
 =?us-ascii?Q?9B98z1K6NHqaz2VSc5s6q1iCu46gv+nGbQWkz6uSpE2CBUrPWHgaQczuIK7t?=
 =?us-ascii?Q?d9BxNLaz2v6Luldn04y9M/FAUyJHXhTE+8U2YxFyNOFXyTogBgpXAASZa60v?=
 =?us-ascii?Q?j6zytdCgPL4tuqUHX5N9RFcsI2odxr6f2vznfe6kAS7OawU1Y/3U2NIDBp+3?=
 =?us-ascii?Q?CsizUb/aIwhwsTIh0sPzijP7LjY1UhzMQsWb4lzm5coWDeBoomPzaBbSMFqa?=
 =?us-ascii?Q?uCa3JAX2+NNB67sQ4Im9q9JNDFAUyT9dJ6qQd5hR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7019cf5-ff50-4fbb-b9b6-08db1fc73a27
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2023 11:21:13.7380 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YGRcjRqXa3uj/31Bs5YjLTsi9pdRuIKDflWgl0Mtum6EfFBRWvZTqPbteTwUR4aUWj/t13yZfZlZBufFdS8Pcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8150
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
> Sent: Friday, March 3, 2023 11:05 AM
> To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>; J=
ani Nikula
> <jani.nikula@linux.intel.com>
> Subject: [PATCH v2 5/7] drm/i915/display: Fill in native_420 field

I asked to add "display" but please change to "/drm/i915/dsc" as that is mo=
re relevant.
Use that for whole series.

Change Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Now that we have laid the groundwork for YUV420 Enablement we fill up nat=
ive_420
> field in vdsc_cfg and add appropriate checks wherever required.
>=20
> ---v2
> -adding native_422 field as 0 [Vandita]
> -filling in second_line_bpg_offset, second_line_offset_adj and nsl_bpg_of=
fset in
> vds_cfg when native_420 is true
>=20
> ---v3
> -adding display version check to solve igt issue
>=20
> --v7
> -remove is_pipe_dsc check as its always true for D14 [Jani]
>=20
> --v10
> -keep sink capability check [Jani]
> -move from !(x =3D=3D y  || w =3D=3D z) to x !=3Dy && w !=3D z [Jani]
>=20
> --v11
> -avoid native_420 computation if not gen14 [Uma]
>=20
> --v12
> -fix state mismatch issue of compressed_bpp
>=20
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/icl_dsi.c    |  2 -
>  drivers/gpu/drm/i915/display/intel_dp.c   | 16 +++-
>  drivers/gpu/drm/i915/display/intel_vdsc.c | 98 ++++++++++++++++++++---
>  3 files changed, 100 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c
> b/drivers/gpu/drm/i915/display/icl_dsi.c
> index b5316715bb3b..fb7efab8e9e6 100644
> --- a/drivers/gpu/drm/i915/display/icl_dsi.c
> +++ b/drivers/gpu/drm/i915/display/icl_dsi.c
> @@ -1539,8 +1539,6 @@ static int gen11_dsi_dsc_compute_config(struct
> intel_encoder *encoder,
>  	if (crtc_state->dsc.slice_count > 1)
>  		crtc_state->dsc.dsc_split =3D true;
>=20
> -	vdsc_cfg->convert_rgb =3D true;
> -
>  	/* FIXME: initialize from VBT */
>  	vdsc_cfg->rc_model_size =3D DSC_RC_MODEL_SIZE_CONST;
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 2649e8b8ef57..86b9348b74bb 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1467,9 +1467,10 @@ static int intel_dp_dsc_compute_params(struct
> intel_encoder *encoder,
>  	vdsc_cfg->dsc_version_minor =3D
>  		min(intel_dp_source_dsc_version_minor(intel_dp),
>  		    intel_dp_sink_dsc_version_minor(intel_dp));
> -
> -	vdsc_cfg->convert_rgb =3D intel_dp-
> >dsc_dpcd[DP_DSC_DEC_COLOR_FORMAT_CAP - DP_DSC_SUPPORT] &
> -		DP_DSC_RGB;
> +	if (vdsc_cfg->convert_rgb)
> +		vdsc_cfg->convert_rgb =3D
> +			intel_dp->dsc_dpcd[DP_DSC_DEC_COLOR_FORMAT_CAP -
> DP_DSC_SUPPORT] &
> +			DP_DSC_RGB;
>=20
>  	line_buf_depth =3D drm_dp_dsc_sink_line_buf_depth(intel_dp->dsc_dpcd);
>  	if (!line_buf_depth) {
> @@ -1587,6 +1588,15 @@ int intel_dp_dsc_compute_config(struct intel_dp
> *intel_dp,
>  							    pipe_config-
> >bigjoiner_pipes,
>  							    pipe_bpp,
>  							    timeslots);
> +			/*
> +			 * According to DSC 1.2a Section 4.1.1 Table 4.1 the
> maximum
> +			 * supported PPS value can be 63.9375 and with the further
> +			 * mention that bpp should be programmed double the
> target bpp
> +			 * restricting our target bpp to be 31.9375 at max
> +			 */
> +			if (pipe_config->output_format =3D=3D
> INTEL_OUTPUT_FORMAT_YCBCR420)
> +				dsc_max_output_bpp =3D min_t(u16,
> dsc_max_output_bpp, 31 << 4);
> +
>  			if (!dsc_max_output_bpp) {
>  				drm_dbg_kms(&dev_priv->drm,
>  					    "Compressed BPP not supported\n"); diff
> --git a/drivers/gpu/drm/i915/display/intel_vdsc.c
> b/drivers/gpu/drm/i915/display/intel_vdsc.c
> index ed16f63d6355..44243fc81b46 100644
> --- a/drivers/gpu/drm/i915/display/intel_vdsc.c
> +++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
> @@ -460,14 +460,50 @@ int intel_dsc_compute_params(struct intel_crtc_stat=
e
> *pipe_config)
>  	vdsc_cfg->pic_width =3D pipe_config->hw.adjusted_mode.crtc_hdisplay;
>  	vdsc_cfg->slice_width =3D DIV_ROUND_UP(vdsc_cfg->pic_width,
>  					     pipe_config->dsc.slice_count);
> -
> -	/* Gen 11 does not support YCbCr */
> +	/*
> +	 * According to DSC 1.2 specs if colorspace is YCbCr then convert_rgb i=
s 0
> +	 * else 1
> +	 */
> +	vdsc_cfg->convert_rgb =3D pipe_config->output_format !=3D
> INTEL_OUTPUT_FORMAT_YCBCR420 &&
> +				pipe_config->output_format !=3D
> INTEL_OUTPUT_FORMAT_YCBCR444;
> +
> +	if (DISPLAY_VER(dev_priv) >=3D 14 &&
> +	    pipe_config->output_format =3D=3D INTEL_OUTPUT_FORMAT_YCBCR420)
> +		vdsc_cfg->native_420 =3D true;
> +	/* We do not support YcBCr422 as of now */
> +	vdsc_cfg->native_422 =3D false;
>  	vdsc_cfg->simple_422 =3D false;
>  	/* Gen 11 does not support VBR */
>  	vdsc_cfg->vbr_enable =3D false;
>=20
>  	/* Gen 11 only supports integral values of bpp */
>  	vdsc_cfg->bits_per_pixel =3D compressed_bpp << 4;
> +
> +	/*
> +	 * According to DSC 1.2 specs in Section 4.1 if native_420 is set:
> +	 * -We need to double the current bpp.
> +	 * -second_line_bpg_offset is 12 in general and equal to 2*(slice_heigh=
t-1) if
> slice
> +	 * height < 8.
> +	 * -second_line_offset_adj is 512 as shown by emperical values to yeild=
 best
> chroma
> +	 * preservation in second line.
> +	 * -nsl_bpg_offset is calculated as second_line_offset/slice_height -1 =
then
> rounded
> +	 * up to 16 fractional bits, we left shift second line offset by 11 to =
preserve
> 11
> +	 * fractional bits.
> +	 */
> +	if (vdsc_cfg->native_420) {
> +		vdsc_cfg->bits_per_pixel <<=3D 1;
> +
> +		if (vdsc_cfg->slice_height >=3D 8)
> +			vdsc_cfg->second_line_bpg_offset =3D 12;
> +		else
> +			vdsc_cfg->second_line_bpg_offset =3D
> +				2 * (vdsc_cfg->slice_height - 1);
> +
> +		vdsc_cfg->second_line_offset_adj =3D 512;
> +		vdsc_cfg->nsl_bpg_offset =3D DIV_ROUND_UP(vdsc_cfg-
> >second_line_bpg_offset << 11,
> +							vdsc_cfg->slice_height - 1);
> +	}
> +
>  	vdsc_cfg->bits_per_component =3D pipe_config->pipe_bpp / 3;
>=20
>  	for (i =3D 0; i < DSC_NUM_BUF_RANGES - 1; i++) { @@ -594,8 +630,13 @@
> static void intel_dsc_pps_configure(const struct intel_crtc_state *crtc_s=
tate)
>  		DSC_VER_MIN_SHIFT |
>  		vdsc_cfg->bits_per_component << DSC_BPC_SHIFT |
>  		vdsc_cfg->line_buf_depth << DSC_LINE_BUF_DEPTH_SHIFT;
> -	if (vdsc_cfg->dsc_version_minor =3D=3D 2)
> +	if (vdsc_cfg->dsc_version_minor =3D=3D 2) {
>  		pps_val |=3D DSC_ALT_ICH_SEL;
> +		if (vdsc_cfg->native_420)
> +			pps_val |=3D DSC_NATIVE_420_ENABLE;
> +		if (vdsc_cfg->native_422)
> +			pps_val |=3D DSC_NATIVE_422_ENABLE;
> +	}
>  	if (vdsc_cfg->block_pred_enable)
>  		pps_val |=3D DSC_BLOCK_PREDICTION;
>  	if (vdsc_cfg->convert_rgb)
> @@ -906,6 +947,33 @@ static void intel_dsc_pps_configure(const struct
> intel_crtc_state *crtc_state)
>  				       pps_val);
>  	}
>=20
> +	if (DISPLAY_VER(dev_priv) >=3D 14) {
> +		/* Populate PICTURE_PARAMETER_SET_17 registers */
> +		pps_val =3D 0;
> +		pps_val |=3D DSC_SL_BPG_OFFSET(vdsc_cfg-
> >second_line_bpg_offset);
> +		drm_dbg_kms(&dev_priv->drm, "PPS17 =3D 0x%08x\n", pps_val);
> +		intel_de_write(dev_priv,
> +			       MTL_DSC0_PICTURE_PARAMETER_SET_17(pipe),
> +			       pps_val);
> +		if (crtc_state->dsc.dsc_split)
> +			intel_de_write(dev_priv,
> +
> MTL_DSC1_PICTURE_PARAMETER_SET_17(pipe),
> +				       pps_val);
> +
> +		/* Populate PICTURE_PARAMETER_SET_18 registers */
> +		pps_val =3D 0;
> +		pps_val |=3D DSC_NSL_BPG_OFFSET(vdsc_cfg->nsl_bpg_offset) |
> +			   DSC_SL_OFFSET_ADJ(vdsc_cfg->second_line_offset_adj);
> +		drm_dbg_kms(&dev_priv->drm, "PPS18 =3D 0x%08x\n", pps_val);
> +		intel_de_write(dev_priv,
> +			       MTL_DSC0_PICTURE_PARAMETER_SET_18(pipe),
> +			       pps_val);
> +		if (crtc_state->dsc.dsc_split)
> +			intel_de_write(dev_priv,
> +
> MTL_DSC1_PICTURE_PARAMETER_SET_18(pipe),
> +				       pps_val);
> +	}
> +
>  	/* Populate the RC_BUF_THRESH registers */
>  	memset(rc_buf_thresh_dword, 0, sizeof(rc_buf_thresh_dword));
>  	for (i =3D 0; i < DSC_NUM_BUF_RANGES - 1; i++) { @@ -1180,7 +1248,7 @@
> void intel_dsc_get_config(struct intel_crtc_state *crtc_state)
>  	enum pipe pipe =3D crtc->pipe;
>  	enum intel_display_power_domain power_domain;
>  	intel_wakeref_t wakeref;
> -	u32 dss_ctl1, dss_ctl2, val;
> +	u32 dss_ctl1, dss_ctl2, pps0 =3D 0, pps1 =3D 0;
>=20
>  	if (!intel_dsc_source_support(crtc_state))
>  		return;
> @@ -1203,13 +1271,21 @@ void intel_dsc_get_config(struct intel_crtc_state
> *crtc_state)
>=20
>  	/* FIXME: add more state readout as needed */
>=20
> -	/* PPS1 */
> -	if (!is_pipe_dsc(crtc, cpu_transcoder))
> -		val =3D intel_de_read(dev_priv, DSCA_PICTURE_PARAMETER_SET_1);
> -	else
> -		val =3D intel_de_read(dev_priv,
> -				    ICL_DSC0_PICTURE_PARAMETER_SET_1(pipe));
> -	vdsc_cfg->bits_per_pixel =3D val;
> +	/* PPS0 & PPS1 */
> +	if (!is_pipe_dsc(crtc, cpu_transcoder)) {
> +		pps1 =3D intel_de_read(dev_priv,
> DSCA_PICTURE_PARAMETER_SET_1);
> +	} else {
> +		pps0 =3D intel_de_read(dev_priv,
> +				     ICL_DSC0_PICTURE_PARAMETER_SET_0(pipe));
> +		pps1 =3D intel_de_read(dev_priv,
> +				     ICL_DSC0_PICTURE_PARAMETER_SET_1(pipe));
> +	}
> +
> +	vdsc_cfg->bits_per_pixel =3D pps1;
> +
> +	if (pps0 & DSC_NATIVE_420_ENABLE)
> +		vdsc_cfg->bits_per_pixel >>=3D 1;
> +
>  	crtc_state->dsc.compressed_bpp =3D vdsc_cfg->bits_per_pixel >> 4;
>  out:
>  	intel_display_power_put(dev_priv, power_domain, wakeref);
> --
> 2.25.1

