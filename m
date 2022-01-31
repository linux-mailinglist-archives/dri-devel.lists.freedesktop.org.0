Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 868344A3CDC
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 05:14:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7682F10E77E;
	Mon, 31 Jan 2022 04:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A464F10E408;
 Mon, 31 Jan 2022 04:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643602492; x=1675138492;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kMEPd9ugunf4HTsKFPUC+hDF2L3yKzlF4BtmupMeOt8=;
 b=Vop8sWifQTk8Q3toCFMbc9bokqx2f56LMdkFUYk+/j+v70ffVr5YR/Ga
 JmJ8X7zsA1FYJHlTW7QkjhgVhQjtHt7IZsytAhI7c8Oa5J//S+nyWxJUc
 PueHwmcYLuvopuOlfoye4lbOP/fvGkKfcVesH86NmW1OmZWpzLoIOTMN+
 DXfo4uHge+kC1QRT6sxLh9i2JoheUYmLidVeIrFWk+kPCiORBUlYZRW77
 et/kxnHScpq9OrlSBGUY4R88gw46P5yC1u8lvkBW6v/5K+MY7+W3jB61V
 Uzvvej+rXaqOuc7yxo553tEmcJr6An8MJJki4kpUseRsSybE46ZXjPf8A Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="246233077"
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; d="scan'208";a="246233077"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2022 20:14:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; d="scan'208";a="564856916"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 30 Jan 2022 20:14:51 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 30 Jan 2022 20:14:51 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Sun, 30 Jan 2022 20:14:51 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Sun, 30 Jan 2022 20:14:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+2/z5JC9uyV7xQbAB3SF4V9HdfVDUnrc2+Kv40x2SEdygwmf8AZ44vAQ9Ac0Qlcq6ssfJQ8p5BhI9EljF+0OmPjsYE0ocvfG/udcq4IkxScmKeRW56E4fo6puVInllYxdDPiKPFxczFHj6SBgolLLqT9OBtIPixkV/ZxqZH+me67LmZAzQAJowUKuSulNiFvaNxMano1DAGWLXknU0SzsxUZ1ezqxsF8q3QYs9+CLOx+ZmjAV17gDrCHeoHcZkZu9LlH5GF6f5S0mNjuMQTKnPBZ1wtxbYeIqOJ/rc4+baQGAPjBWxtMOd2sGqilARBuMaq5dYdqb8W+ER6WGlX4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zWE8Y4HFn5BtgJeyoOAKcFssi5Xh688byfqWbpLydMs=;
 b=V+FjnVIQtxh1qcE9GpVnNGV4/r3z0EW/zeF9SkC/U6Nkz9M80hCjeVXq/twdmp7EkWtv92489daoPl+EBk17ztdfmJwvuE8IDIjyNPbUboFxR6qfHb7T37EnZXQj3RUypbq6d0UCeaC9KNri5VPD8wv3oK8PzmsaF6n7hBndyHs7Fst/8+qjYyUUggx1SlQu6Q7bmMHn22tba5DDYH9Vj2BVYh9OvOejM36xrwpemm1CZpPuf7oIC0gbP1YYLTvFzoOyAAA2DtFqLmYnriojOIXbjjS5InVGl6eN3r/Cslu1zwpTVIY4QjANoHQokWXh+EcUnGph1rntIVigtY2yvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CY4PR11MB1352.namprd11.prod.outlook.com (2603:10b6:903:2a::23)
 by DM6PR11MB4076.namprd11.prod.outlook.com (2603:10b6:5:197::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Mon, 31 Jan
 2022 04:14:48 +0000
Received: from CY4PR11MB1352.namprd11.prod.outlook.com
 ([fe80::fdaf:f5ea:bd3b:21ce]) by CY4PR11MB1352.namprd11.prod.outlook.com
 ([fe80::fdaf:f5ea:bd3b:21ce%4]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 04:14:47 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 3/3] drm/vkms: change vkms driver to use
 drm_writeback_connector.base pointer
Thread-Topic: [PATCH 3/3] drm/vkms: change vkms driver to use
 drm_writeback_connector.base pointer
Thread-Index: AQHYBtNh7dKiDQ0fKEutgzhHtb0faqx8oxDw
Date: Mon, 31 Jan 2022 04:14:47 +0000
Message-ID: <CY4PR11MB1352E1CBA1E27C646D8C04B9E3259@CY4PR11MB1352.namprd11.prod.outlook.com>
References: <20220111101801.28310-1-suraj.kandpal@intel.com>
 <20220111101801.28310-3-suraj.kandpal@intel.com>
In-Reply-To: <20220111101801.28310-3-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5da0e1cc-05b1-4d39-0dc1-08d9e4703826
x-ms-traffictypediagnostic: DM6PR11MB4076:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR11MB4076C5199291FF10283F347FE3259@DM6PR11MB4076.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:510;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oXFNESgN2Bj81UZ9XHBGc33zQx9adPYaHsLS4tJS5Pf1Ap1jqlb96qW1WoqXpaGhNwPWXX6D5Vgwr+6wEZmcXLbm3Q90B+PqN3bh72cjd4YLx+XnL3+QCkxKTbfnAo7u+a7aGa0ODt+DWJWNwXKLgm0mdGFNjmzQYGVOGOgWsNHh/ZFg0M+QMindtYXngZ3eWgG0PVPmHDGlM3Gw/qOMbuSAUi2pH5aP9AGcLIUA1eQzrGVbQvRUBc2G8d5tJjjKsOKCQqNBnNX3Lw82l4b2a5dsj4FG5J3gI75LEJ4oamVsNx5CVUcd+xxMpX63X3S65yDOsw6ICXD2aYDNbWDAqK0I5GEt+dbKgiwymo3nkdLoMY1iLlhfUEyI4VHQpnS3vQlHongJq0ojQXHsW9i42V2AgQ8TpPYAakDEHUGWrBdk5mRGhEaLS67YNiZmo6gaMhObK5x/ygpX3ppDYHf3vJUAFcTFn7nBAyIm8M7GsuDFni5XkkTZGnKfqBVw9jcVhhDAYQnVlhF5e/618tMZDTphtYiukogNxo+MOaBE75cGnbx1SgxPDBhR2vs7TuVuPRksS3GniO8EpTsKBZem8Jqv0ZgNBoT6PWfKEG8gsbtbjzvv2RAFsXAe/P8NGzrQhJx7NV0T+3IwF3K+xABPsyJu/kEsJ1tVyFcMBy0aZuhP57VhygtV4yiQ2iiVY3l9jwHiIyfLgoWOuYtuSWh5jw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB1352.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(110136005)(83380400001)(54906003)(316002)(450100002)(186003)(26005)(2906002)(107886003)(86362001)(82960400001)(8936002)(66446008)(66476007)(66556008)(38070700005)(55016003)(7696005)(52536014)(55236004)(9686003)(5660300002)(508600001)(6506007)(122000001)(38100700002)(8676002)(71200400001)(4326008)(64756008)(66946007)(33656002)(76116006)(20210929001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qrR8MXAemjjleRwMKnp6hY6o0COVyGOkVVKn9RGUEFm0M9i0tH96yvxWojSV?=
 =?us-ascii?Q?I/J46kPBJBw9Tk17XF2tS/Fsj9F1mBGCNYGg/brpZ+LM/FwtnfkgMGsI70rk?=
 =?us-ascii?Q?oww6UgDgNoL8JQeeCwF3rMGR0Gwa8FBKKYLmPiC61zFu8WxO6pBR9hDDa42r?=
 =?us-ascii?Q?ybUcLZdpkEyfK9tZ1zdeGDl21wAnQCYtr091XGC3UQoh9ALYB1XMvmmZmAK9?=
 =?us-ascii?Q?qVZh/4m38PlsDuQcdeVAdtuA+6PHJj1xFJ7sIJxJl5QBH1rPUCsGgp3hlhqI?=
 =?us-ascii?Q?cojyd1rHjZziTgn0yEJ0mZ8QmG941WSXgZaicGhq6UBjCoCZZYhGqHHTNkc/?=
 =?us-ascii?Q?Uq3KrbLQQEErzgfIsSPwkUBsVYyhZEDSMJp64MlsiYkNJfHo5cGEFg4oxLFm?=
 =?us-ascii?Q?CSlKHJcRpQezRWJig74iwd0vyELZbOF3K2tpx4/XGHkzlhfLll+3nTVT9fBG?=
 =?us-ascii?Q?tOlM/u7tdNhDmSIXEALjgSdLpwqkPylqm6qsIiIsaPuXVrCzcKglK+z29mLl?=
 =?us-ascii?Q?1qm59DhXug3yAe8NxH83upaLdEs5WXeQxvNmiuk9x9+LgJZcYjfHETvbGqTg?=
 =?us-ascii?Q?YQ22kt9bS8fq/jsLqpo7wCOUPoG720e18d5bKiF7cmtQDorOvTzV1CYja/es?=
 =?us-ascii?Q?JPQuu/ThrCOpH4HQUWzykFroMa2McHtpNz8nhLwG0R88f3EPU54mexUvwupn?=
 =?us-ascii?Q?kGyQzRMUiNdLjeu/7SmveiLEXKsVIyZRQyJ5G5ZqIy2dRWcqF1szrglb2g6/?=
 =?us-ascii?Q?b6Atl2vodwRmv1ffxDn4R5GmnjsRMZRssKnYpvnXPMDmTTpl02bcGzy2Yx+B?=
 =?us-ascii?Q?ZhpTZUfjZQXF+kysKRPqM3NyQi2E5xD7oAOXRP54V70szmBfqMZcQrOhSHn2?=
 =?us-ascii?Q?ZrXyDTzXqhWYiYxvYifQfqr7bk4WSrhiERR75yh+GNQEqMBIorI5AVvDHPZz?=
 =?us-ascii?Q?2fvGCYZjL2KFlAr2r8p2NqUZ8IfW+yzMPNT3ZOdiso6w4yZ2PX0avFvIWiP+?=
 =?us-ascii?Q?r8+B1jRiia0GSPSmWXXe6rAaZdA3Fgi/BRIu5Z+FXWcWuYQoPe9+7agZZoC6?=
 =?us-ascii?Q?yMU4ZUoq4BRHLv/gI5dGZhIGqvmzWWDkM1jC5qpBUkcR73tlGDGE8egqOMvr?=
 =?us-ascii?Q?jWzInAYzVJJliD2KEaW/naitRLU3b+L6dozS2UEtimz0VtDxUH9X8mdpA3e5?=
 =?us-ascii?Q?HnaWgyL6o51TzoMQUJOAVXQo7y0X5C+FHDY41q3/PGQ7DHgXDg4cRbA76awO?=
 =?us-ascii?Q?5VdL84/lKtstyvxxZ+Cw6FGMQ6vp2237UnOZB0mvOeXfCRjV1Eq1tAHxEyPV?=
 =?us-ascii?Q?CfViZWTIPviLpcGrNEltKj1rf0jHz3NL0st2ro9yW/ME4fF3R/VRUQ2LhhN7?=
 =?us-ascii?Q?SM+J8qH+tzrEYPikOh5X9KY1/keoRTADoHHEryPWpdYF6wvAu0iAraKRhPot?=
 =?us-ascii?Q?gKLIyLg6GrU+jZPhZFeSr771Ft79RZiYsw/Ou3gF5MIn53aijtz5ftL4FuuS?=
 =?us-ascii?Q?0XkYH+YXewR0OsBjvmNHpuB3RCknQRIwMYb7UEZ0MdEDBPEnSvgQD2UbPz5j?=
 =?us-ascii?Q?1htvHv8O3pPK2+tl6VQwXORcS6/k+/Y2jFaiT121LEBgwjLpsaa3D2vc02+C?=
 =?us-ascii?Q?OQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB1352.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da0e1cc-05b1-4d39-0dc1-08d9e4703826
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 04:14:47.8498 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vW874jbbA6AbOcZGpvvDjsnjNCVwiAyf7jhe6AfcTjR0ilm4bzkP1nCn+1BQImBdtilomeOM1snhM2KOxL38Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4076
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,
Gentle Reminder! Any Review comments?

> Changing vkms driver to accomadate the change of
> drm_writeback_connector.base to a pointer the reason for which is
> explained in the Patch(drm: add writeback pointers to drm_connector).
>=20
> Signed-off-by: Kandpal, Suraj <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/vkms/vkms_writeback.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c
> b/drivers/gpu/drm/vkms/vkms_writeback.c
> index 8694227f555f..6de0c4213425 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -114,7 +114,7 @@ static void vkms_wb_atomic_commit(struct
> drm_connector *conn,
>  	struct vkms_device *vkmsdev =3D drm_device_to_vkms_device(conn-
> >dev);
>  	struct vkms_output *output =3D &vkmsdev->output;
>  	struct drm_writeback_connector *wb_conn =3D &output-
> >wb_connector;
> -	struct drm_connector_state *conn_state =3D wb_conn->base.state;
> +	struct drm_connector_state *conn_state =3D wb_conn->base->state;
>  	struct vkms_crtc_state *crtc_state =3D output->composer_state;
>=20
>  	if (!conn_state)
> @@ -140,8 +140,8 @@ int vkms_enable_writeback_connector(struct
> vkms_device *vkmsdev)  {
>  	struct drm_writeback_connector *wb =3D &vkmsdev-
> >output.wb_connector;
>=20
> -	vkmsdev->output.wb_connector.encoder.possible_crtcs =3D 1;
> -	drm_connector_helper_add(&wb->base,
> &vkms_wb_conn_helper_funcs);
> +	vkmsdev->output.wb_connector.encoder->possible_crtcs =3D 1;
> +	drm_connector_helper_add(wb->base,
> &vkms_wb_conn_helper_funcs);
>=20
>  	return drm_writeback_connector_init(&vkmsdev->drm, wb,
>  					    &vkms_wb_connector_funcs,
Regards,
Suraj Kandpal
