Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C907A3DE0E9
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 22:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A781E6E03E;
	Mon,  2 Aug 2021 20:44:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45956E03E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 20:44:29 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10064"; a="200728846"
X-IronPort-AV: E=Sophos;i="5.84,289,1620716400"; d="scan'208";a="200728846"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 13:44:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,289,1620716400"; d="scan'208";a="418798527"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 02 Aug 2021 13:44:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 2 Aug 2021 13:44:28 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 2 Aug 2021 13:44:28 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 2 Aug 2021 13:44:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D+HgPurJ9jXw9CXP8+vWFMVVt3vH/PL/dsb1lQDqb4I3iffVjma/WiltjYodn9GZFhEPSUoWEFJX0MzfisDYJwqvLF2GHyAXG1CckmVfexSrhF/Yo9peKQf8SN3Q2dbQuHslYHUhlwhkRNn1SPyAsWFFU3rd66f9QKeLIo1STC+n1xm2DkMkjV3kYzXvjyU/sEE1EXuN92JRCkyXJD3nwzFJgj+8i8J4ScB0pahCvlYUq1zyBEe7pEnMFulcTNQD6a/N8csjoVRQB6LfQPpnyrBfroYBanv3dRcJjdSaxh4sHxlTcOWfRv386MaWeQ9vX/aaqQbPrMv59j01DaN2Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fwJhS3tWfzoZCm4a4zTo9d7kfCgmTGnZYVM+8oa5kU=;
 b=Z7HVvrTtDqmZ4pGAKxD77N44A1N0nmvBHL/hlTtZLN0fUX+BYOMLQbuwHcf1CDgpT+hzIkhnj9+8xHkR12HnrAanpfeVUpa5CVNJY3kRZNVnX0ksba3xBWNTmW8bTHzY7oEaR9WNOhRgQ4EpKwuuw9TfoNfP8km/Hv16Tn1MULQJLPWnWMruZ30ixL6d3xMvTbWTLpyWu2BdYOSohZQf0y/ZDU6apUGayBgt10b1zLXfnYdtQ8T5jvcYN1w4W94/MFs2KN/X12ddN6THyEexQCTwS7whdq+4fOT7fWk30j8d50SqWek7t3aKiER2jm08R2hMyZ3CqlR9dtuiSRHpiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fwJhS3tWfzoZCm4a4zTo9d7kfCgmTGnZYVM+8oa5kU=;
 b=UMAlSrl/nkcY1kUU5kLolutFLtyF6hbflpuLTBTYUKiH9K8Rx0kgARC3Gzw/ElPe5U6kb36Iwkf15VDw4AfSjjtw+sHB2/ikVP19kmjjScNejjPh32x5yHXlT5N8zIH3IFWIfCV+4JCgqOFkZ5TdX5EdMUm89d2qpXDJbyo2y34=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BYAPR11MB3672.namprd11.prod.outlook.com (2603:10b6:a03:fa::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.25; Mon, 2 Aug
 2021 20:44:26 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::64ff:14d5:eaf7:315c]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::64ff:14d5:eaf7:315c%7]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 20:44:26 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Dea, 
 Edmund J" <edmund.j.dea@intel.com>
Subject: RE: [PATCH 13/14] drm/kmb: Enable alpha blended second plane
Thread-Topic: [PATCH 13/14] drm/kmb: Enable alpha blended second plane
Thread-Index: AQHXg0gTmuvsnKy8QEiN5EeooE+bN6tX/e+AgAi5lbA=
Date: Mon, 2 Aug 2021 20:44:26 +0000
Message-ID: <BY5PR11MB41821BFC25FECD3D9834C7D58CEF9@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
 <20210728003126.1425028-13-anitha.chrisanthus@intel.com>
 <YQEHQ56Qwl0GzvKg@ravnborg.org>
In-Reply-To: <YQEHQ56Qwl0GzvKg@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: ravnborg.org; dkim=none (message not signed)
 header.d=none;ravnborg.org; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ed239a7-acec-4d9c-6f6c-08d955f6518c
x-ms-traffictypediagnostic: BYAPR11MB3672:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB3672FE52870A31DCE257001B8CEF9@BYAPR11MB3672.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:175;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BFJHnXkYTjVZLt5P/bYzyCLuc2eNj80b78B7Feu9mryNFIdREJma/1TSVy5ydZK3YKvKV630O+sj0MsPKVM6SfjegiPIeHLew+lR4AaCfuF4oK2CEf7oXiQuscol5djZmi6KalBpLOZNWF4+ILKbuN0OctqdMtgoTdPHCU9NBtBFPuLjT0QlF9nk/CmJHELHEgAPnp4f0BFVpYNk01urLXlfAZY2nVS0ZW/7SwvrzsC60G2skNitDcInX3vcD9FXgsCt6wXjl/1fbK5f1TENUu3rTFZuK41dPvQVDXFe+WXHovCRBvDNLlcnD3i4FOrhpBVLdT92hxOdWZHLwWjOhyP4X7rs+6TBD4rYE5XMp9fAGoM/8qVSo9UaIOVxoGlPPp9oLWpQ9EcKXnZ1cueqI1a6Qf82iO0eEWuVsfXL8IGkpbUMYftWVWHUS9q9l/XNwPE3HFmMbLzqur4uCURbnXuiegdnue+A7yO2DhoyqJoVb5nYDleWRbq8dGHDG0G+o4Kp5VD3GKYpuaU4TWRyspoj1wMg5aj+EvXgsSjQaz5BumvgsvJRtmvYayxwrdRmEFxzMJHkV3rqpI2S1HCTtg1tz4aHQATedTaU62nyIzhdW3Nqhq7CpL2M/5smiDdgHKahugW2gGu/jR6GU4+PFU9RRys8RRkvFywVNVkLxDndBiVipW0Y5FO9pvjUK3XcT0J73V4nsMzHL751HPyJZA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(2906002)(86362001)(53546011)(9686003)(71200400001)(6506007)(478600001)(55016002)(316002)(122000001)(38070700005)(83380400001)(52536014)(7696005)(186003)(38100700002)(66556008)(4326008)(33656002)(66446008)(26005)(64756008)(8936002)(6916009)(66476007)(5660300002)(54906003)(76116006)(8676002)(66946007)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lp1Uvj7JzbLHj/U34O+tGxoaOm7MbrQXHHT9q0FGdDn+hfpkOmQGP+eQaiRi?=
 =?us-ascii?Q?JNknQRrYi5tbiYvdKMRoKMyyH4oHZe++H9gBC9POrnBprtRD4LQpFC69rIq2?=
 =?us-ascii?Q?I4PbMeVnwuSRIMeV2DMMh95tHHRG+4/+RlecIKKGioAQ1arXjn/5bNollzus?=
 =?us-ascii?Q?83djkGt6AvdOq+Nc7DcOIB98ap7Js8IWLTbxa1jz6ALWclmRdReQIgTDWd35?=
 =?us-ascii?Q?bjGxAaWWDxsW50sqEqCvseJ69Wf9YezCirfddRBDuc4Rl8L4Mup46H4J+BFS?=
 =?us-ascii?Q?5mCTrYgToey+vKWVDU4ggDTa1YQv2k5+eAlv2Mda6DG2Z3P6QL9ruCgbUHht?=
 =?us-ascii?Q?JXGche9NOMbMBWYMGI1NCPzf31sJnGbohhoMvRjKWdsD/KLkJXllDeGGsVaV?=
 =?us-ascii?Q?j4Xv+j7C6pU2CoUC6EJWP1wJKjCnlm7CtGBC8dJq6H42DyjVh9E2/e8hjEB3?=
 =?us-ascii?Q?phPu+7J6xgDKoZjiy03/LSdqnz3/68AfPtNVRmKxW8L5jY18g7EaXa14s+7d?=
 =?us-ascii?Q?LUz5b8BhcXDvb9fj1ItvOsmowSwtu3OagCjr93vCIkZXDWcVsW42a3/+muXI?=
 =?us-ascii?Q?y5gDuamtfb/s20fFDsS0ZEgwtcwLzwW8GdmXQqUZJ0WnTRHpGiT98tpgTLoD?=
 =?us-ascii?Q?AlC80PlcGvvApSBOAUuW8sSy4yM3/rQn1vpiMWEVVkbD9quiyBYhMDEYhMrD?=
 =?us-ascii?Q?te/fE4wdE1A+smXyItNH1Ok6/6j1TfzOXZzYWKXkSEjvZWYHqR9/+UAK8aPP?=
 =?us-ascii?Q?5EXxHlCqqMuWZi9ufroz7sFuThOyFSJX4qtTxUwPTnJ9eyN2l5IYR1uiQH8/?=
 =?us-ascii?Q?ZnUlchn+LojO+SFP5XUWbwhMDu69slkID+F2WTZbPL8NU7jI7TwwU1pHcVKd?=
 =?us-ascii?Q?Qd5/c233qSx+7IMrKZ0l4QLlrv+2eJAcE46PLM3Cj8k4wmSLcl2Y3zg2i3Yy?=
 =?us-ascii?Q?4hlw/2SWPl1gq7vEv0q7Z7c89wkmw0IsUwuPR/onfSYtGZwnYjAYPYNFIl6j?=
 =?us-ascii?Q?qMyI8fU9/rE/X8CbMDWGOxl64MWd9FLwKy8VXtlwJNfpkK4skbLBUmcQUJEB?=
 =?us-ascii?Q?pvuw83aRxQDHzDvYCHfpHKy2HhdrusBvaioUZd9WtDxmKWyOdNPnK2idCJQj?=
 =?us-ascii?Q?lhWzF5k/kMvLYH4vaC8PXdM3yTqOVtDd21/k9FjDt/851iDlU5+cmcubHYHW?=
 =?us-ascii?Q?LI51XiupmxYfdJ0TzwaQDhl4By75aZOYMMTMNGwbM7YnJ9waW9CAkUZJCMyU?=
 =?us-ascii?Q?fEQOQDQYD94O0LorOarFXv5rhFju9O2otGghjJPZ4A9iD2M/EPDqMtspY3sB?=
 =?us-ascii?Q?8xQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed239a7-acec-4d9c-6f6c-08d955f6518c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2021 20:44:26.7000 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dcIu2TUeqqAfDGVWjzIy/WooPWgnhLHI3nOoOG1dh8xrKwG30ExNVV5IesM/nLU1A5RIIXD6aMlW2PXTjSWdauuJiRTcjY2ARYDlsTKYObM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3672
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

Hi Sam,
Thanks. Where should this go, drm-misc-fixes or drm-misc-next?

Anitha

> -----Original Message-----
> From: Sam Ravnborg <sam@ravnborg.org>
> Sent: Wednesday, July 28, 2021 12:29 AM
> To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> Cc: dri-devel@lists.freedesktop.org; Dea, Edmund J
> <edmund.j.dea@intel.com>
> Subject: Re: [PATCH 13/14] drm/kmb: Enable alpha blended second plane
>=20
> Hi Anitha,
> On Tue, Jul 27, 2021 at 05:31:25PM -0700, Anitha Chrisanthus wrote:
> > From: Edmund Dea <edmund.j.dea@intel.com>
> >
> > Enable one additional plane that is alpha blended on top
> > of the primary plane.
> >
> > Signed-off-by: Edmund Dea <edmund.j.dea@intel.com>
> Your s-o-b is missing.
>=20
> With this fixed:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > ---
> >  drivers/gpu/drm/kmb/kmb_drv.c   |  8 ++--
> >  drivers/gpu/drm/kmb/kmb_plane.c | 81 +++++++++++++++++++++++++++++-
> ---
> >  drivers/gpu/drm/kmb/kmb_plane.h |  5 +-
> >  drivers/gpu/drm/kmb/kmb_regs.h  |  3 ++
> >  4 files changed, 82 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/kmb/kmb_drv.c
> b/drivers/gpu/drm/kmb/kmb_drv.c
> > index 12f35c43d838..d0de1db03493 100644
> > --- a/drivers/gpu/drm/kmb/kmb_drv.c
> > +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> > @@ -173,10 +173,10 @@ static int kmb_setup_mode_config(struct
> drm_device *drm)
> >  	ret =3D drmm_mode_config_init(drm);
> >  	if (ret)
> >  		return ret;
> > -	drm->mode_config.min_width =3D KMB_MIN_WIDTH;
> > -	drm->mode_config.min_height =3D KMB_MIN_HEIGHT;
> > -	drm->mode_config.max_width =3D KMB_MAX_WIDTH;
> > -	drm->mode_config.max_height =3D KMB_MAX_HEIGHT;
> > +	drm->mode_config.min_width =3D KMB_FB_MIN_WIDTH;
> > +	drm->mode_config.min_height =3D KMB_FB_MIN_HEIGHT;
> > +	drm->mode_config.max_width =3D KMB_FB_MAX_WIDTH;
> > +	drm->mode_config.max_height =3D KMB_FB_MAX_HEIGHT;
> >  	drm->mode_config.funcs =3D &kmb_mode_config_funcs;
> >
> >  	ret =3D kmb_setup_crtc(drm);
> > diff --git a/drivers/gpu/drm/kmb/kmb_plane.c
> b/drivers/gpu/drm/kmb/kmb_plane.c
> > index 4523af949ea1..cbe4e981d73e 100644
> > --- a/drivers/gpu/drm/kmb/kmb_plane.c
> > +++ b/drivers/gpu/drm/kmb/kmb_plane.c
> > @@ -118,9 +118,10 @@ static int kmb_plane_atomic_check(struct
> drm_plane *plane,
> >  	if (ret)
> >  		return ret;
> >
> > -	if (new_plane_state->crtc_w > KMB_MAX_WIDTH || new_plane_state-
> >crtc_h > KMB_MAX_HEIGHT)
> > -		return -EINVAL;
> > -	if (new_plane_state->crtc_w < KMB_MIN_WIDTH || new_plane_state-
> >crtc_h < KMB_MIN_HEIGHT)
> > +	if (new_plane_state->crtc_w > KMB_FB_MAX_WIDTH ||
> > +	    new_plane_state->crtc_h > KMB_FB_MAX_HEIGHT ||
> > +	    new_plane_state->crtc_w < KMB_FB_MIN_WIDTH ||
> > +	    new_plane_state->crtc_h < KMB_FB_MIN_HEIGHT)
> >  		return -EINVAL;
> >
> >  	/* Due to HW limitations, changing plane height or width after
> > @@ -311,6 +312,44 @@ static void config_csc(struct kmb_drm_private
> *kmb, int plane_id)
> >  	kmb_write_lcd(kmb, LCD_LAYERn_CSC_OFF3(plane_id),
> csc_coef_lcd[11]);
> >  }
> >
> > +static void kmb_plane_set_alpha(struct kmb_drm_private *kmb,
> > +				const struct drm_plane_state *state,
> > +				unsigned char plane_id,
> > +				unsigned int *val)
> > +{
> > +	u16 plane_alpha =3D state->alpha;
> > +	u16 pixel_blend_mode =3D state->pixel_blend_mode;
> > +	int has_alpha =3D state->fb->format->has_alpha;
> > +
> > +	if (plane_alpha !=3D DRM_BLEND_ALPHA_OPAQUE)
> > +		*val |=3D LCD_LAYER_ALPHA_STATIC;
> > +
> > +	if (has_alpha) {
> > +		switch (pixel_blend_mode) {
> > +		case DRM_MODE_BLEND_PIXEL_NONE:
> > +			break;
> > +		case DRM_MODE_BLEND_PREMULTI:
> > +			*val |=3D LCD_LAYER_ALPHA_EMBED |
> LCD_LAYER_ALPHA_PREMULT;
> > +			break;
> > +		case DRM_MODE_BLEND_COVERAGE:
> > +			*val |=3D LCD_LAYER_ALPHA_EMBED;
> > +			break;
> > +		default:
> > +			DRM_DEBUG("Missing pixel blend mode case (%s =3D=3D
> %ld)\n",
> > +				  __stringify(pixel_blend_mode),
> > +				  (long)pixel_blend_mode);
> > +			break;
> > +		}
> > +	}
> > +
> > +	if (plane_alpha =3D=3D DRM_BLEND_ALPHA_OPAQUE && !has_alpha) {
> > +		*val &=3D LCD_LAYER_ALPHA_DISABLED;
> > +		return;
> > +	}
> > +
> > +	kmb_write_lcd(kmb, LCD_LAYERn_ALPHA(plane_id), plane_alpha);
> > +}
> > +
> >  static void kmb_plane_atomic_update(struct drm_plane *plane,
> >  				    struct drm_atomic_state *state)
> >  {
> > @@ -341,11 +380,12 @@ static void kmb_plane_atomic_update(struct
> drm_plane *plane,
> >  	fb =3D new_plane_state->fb;
> >  	if (!fb)
> >  		return;
> > +
> >  	num_planes =3D fb->format->num_planes;
> >  	kmb_plane =3D to_kmb_plane(plane);
> > -	plane_id =3D kmb_plane->id;
> >
> >  	kmb =3D to_kmb(plane->dev);
> > +	plane_id =3D kmb_plane->id;
> >
> >  	spin_lock_irq(&kmb->irq_lock);
> >  	if (kmb->kmb_under_flow || kmb->kmb_flush_done) {
> > @@ -467,20 +507,32 @@ static void kmb_plane_atomic_update(struct
> drm_plane *plane,
> >  		config_csc(kmb, plane_id);
> >  	}
> >
> > +	kmb_plane_set_alpha(kmb, plane->state, plane_id, &val);
> > +
> >  	kmb_write_lcd(kmb, LCD_LAYERn_CFG(plane_id), val);
> >
> > +	/* Configure LCD_CONTROL */
> > +	ctrl =3D kmb_read_lcd(kmb, LCD_CONTROL);
> > +
> > +	/* Set layer blending config */
> > +	ctrl &=3D ~LCD_CTRL_ALPHA_ALL;
> > +	ctrl |=3D LCD_CTRL_ALPHA_BOTTOM_VL1 |
> > +		LCD_CTRL_ALPHA_BLEND_VL2;
> > +
> > +	ctrl &=3D ~LCD_CTRL_ALPHA_BLEND_BKGND_DISABLE;
> > +
> >  	switch (plane_id) {
> >  	case LAYER_0:
> > -		ctrl =3D LCD_CTRL_VL1_ENABLE;
> > +		ctrl |=3D LCD_CTRL_VL1_ENABLE;
> >  		break;
> >  	case LAYER_1:
> > -		ctrl =3D LCD_CTRL_VL2_ENABLE;
> > +		ctrl |=3D LCD_CTRL_VL2_ENABLE;
> >  		break;
> >  	case LAYER_2:
> > -		ctrl =3D LCD_CTRL_GL1_ENABLE;
> > +		ctrl |=3D LCD_CTRL_GL1_ENABLE;
> >  		break;
> >  	case LAYER_3:
> > -		ctrl =3D LCD_CTRL_GL2_ENABLE;
> > +		ctrl |=3D LCD_CTRL_GL2_ENABLE;
> >  		break;
> >  	}
> >
> > @@ -492,7 +544,7 @@ static void kmb_plane_atomic_update(struct
> drm_plane *plane,
> >  	 */
> >  	ctrl |=3D LCD_CTRL_VHSYNC_IDLE_LVL;
> >
> > -	kmb_set_bitmask_lcd(kmb, LCD_CONTROL, ctrl);
> > +	kmb_write_lcd(kmb, LCD_CONTROL, ctrl);
> >
> >  	/* Enable pipeline AXI read transactions for the DMA
> >  	 * after setting graphics layers. This must be done
> > @@ -567,6 +619,9 @@ struct kmb_plane *kmb_plane_init(struct
> drm_device *drm)
> >  	enum drm_plane_type plane_type;
> >  	const u32 *plane_formats;
> >  	int num_plane_formats;
> > +	unsigned int blend_caps =3D BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> > +				  BIT(DRM_MODE_BLEND_PREMULTI)   |
> > +				  BIT(DRM_MODE_BLEND_COVERAGE);
> >
> >  	for (i =3D 0; i < KMB_MAX_PLANES; i++) {
> >  		plane =3D drmm_kzalloc(drm, sizeof(*plane), GFP_KERNEL);
> > @@ -598,8 +653,16 @@ struct kmb_plane *kmb_plane_init(struct
> drm_device *drm)
> >  		drm_dbg(drm, "%s : %d i=3D%d type=3D%d",
> >  			__func__, __LINE__,
> >  			  i, plane_type);
> > +		drm_plane_create_alpha_property(&plane->base_plane);
> > +
> > +		drm_plane_create_blend_mode_property(&plane-
> >base_plane,
> > +						     blend_caps);
> > +
> > +		drm_plane_create_zpos_immutable_property(&plane-
> >base_plane, i);
> > +
> >  		drm_plane_helper_add(&plane->base_plane,
> >  				     &kmb_plane_helper_funcs);
> > +
> >  		if (plane_type =3D=3D DRM_PLANE_TYPE_PRIMARY) {
> >  			primary =3D plane;
> >  			kmb->plane =3D plane;
> > diff --git a/drivers/gpu/drm/kmb/kmb_plane.h
> b/drivers/gpu/drm/kmb/kmb_plane.h
> > index 99207b35365c..b51144044fe8 100644
> > --- a/drivers/gpu/drm/kmb/kmb_plane.h
> > +++ b/drivers/gpu/drm/kmb/kmb_plane.h
> > @@ -35,6 +35,9 @@
> >  #define POSSIBLE_CRTCS 1
> >  #define to_kmb_plane(x) container_of(x, struct kmb_plane, base_plane)
> >
> > +#define POSSIBLE_CRTCS		1
> > +#define KMB_MAX_PLANES		2
> > +
> >  enum layer_id {
> >  	LAYER_0,
> >  	LAYER_1,
> > @@ -43,8 +46,6 @@ enum layer_id {
> >  	/* KMB_MAX_PLANES */
> >  };
> >
> > -#define KMB_MAX_PLANES 1
> > -
> >  enum sub_plane_id {
> >  	Y_PLANE,
> >  	U_PLANE,
> > diff --git a/drivers/gpu/drm/kmb/kmb_regs.h
> b/drivers/gpu/drm/kmb/kmb_regs.h
> > index 48150569f702..9756101b0d32 100644
> > --- a/drivers/gpu/drm/kmb/kmb_regs.h
> > +++ b/drivers/gpu/drm/kmb/kmb_regs.h
> > @@ -43,8 +43,10 @@
> >  #define LCD_CTRL_OUTPUT_ENABLED			  BIT(19)
> >  #define LCD_CTRL_BPORCH_ENABLE			  BIT(21)
> >  #define LCD_CTRL_FPORCH_ENABLE			  BIT(22)
> > +#define LCD_CTRL_ALPHA_BLEND_BKGND_DISABLE	  BIT(23)
> >  #define LCD_CTRL_PIPELINE_DMA			  BIT(28)
> >  #define LCD_CTRL_VHSYNC_IDLE_LVL		  BIT(31)
> > +#define LCD_CTRL_ALPHA_ALL			  (0xff << 6)
> >
> >  /* interrupts */
> >  #define LCD_INT_STATUS				(0x4 * 0x001)
> > @@ -115,6 +117,7 @@
> >  #define LCD_LAYER_ALPHA_EMBED			BIT(5)
> >  #define LCD_LAYER_ALPHA_COMBI
> 	(LCD_LAYER_ALPHA_STATIC | \
> >
> LCD_LAYER_ALPHA_EMBED)
> > +#define LCD_LAYER_ALPHA_DISABLED
> 	~(LCD_LAYER_ALPHA_COMBI)
> >  /* RGB multiplied with alpha */
> >  #define LCD_LAYER_ALPHA_PREMULT			BIT(6)
> >  #define LCD_LAYER_INVERT_COL			BIT(7)
> > --
> > 2.25.1
