Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 998C43DAB52
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 20:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723F26EE22;
	Thu, 29 Jul 2021 18:48:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0FCF6EE22
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 18:48:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="192548563"
X-IronPort-AV: E=Sophos;i="5.84,279,1620716400"; d="scan'208";a="192548563"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 11:48:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,279,1620716400"; d="scan'208";a="456946616"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 29 Jul 2021 11:48:47 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 29 Jul 2021 11:48:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 29 Jul 2021 11:48:46 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 29 Jul 2021 11:48:46 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 29 Jul 2021 11:48:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CH7fljnPYdGrNC8REH0BZ6VMEY/TsOZTXrdzg2LMfuITgxbiwpTU5aVUupzYDi02V5yfzln2Tso7y4ixCH/gkcMHc50+46w2480z9tS+DURlaX5wtbXkAV/xPXrzCRh/CoEmT9cqBkPX+bct4q3+KDo4OUeSaVg38j7fET2hrqgHxZF79M/MfQTVTpoGuCEW44k7x2/zIldcbMrQrma8m6oHvWn1Crhhj9PacpPuyoCLxzkmmj7lrWq2FUSus/mlNaLrji9ov4eRPMEAmOCGXpVA5HoMtKDf6WMsvvPfi6aJ1i2MsSf4s4B4zDkfHVNX2Z6u0//CVkhUW3l3DDZOsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Szs9H0TtLca9N9SddPgNy7suky80VRljNFQQVnKWP1E=;
 b=L8eGg8hCpXmfO4AvgLdb00QI3uo0HIkPyg3onXM1GtB44EQHF3Rp6nhNbXUQezeGW0nPO5nAHHAfwqpA7N7mHgLgVQaku1DKtVRCtbre5/JELBkTcjymxO1DXF2ZM/pnKWEn2KECsuI3nigFz9ykjfkuuJY9UjDf8F3epCMbRe+ekfySUMXvM5j5t4iTKufC9Mb+eKRNRNRovn/usbcq9h/0ZbwHFy9Lk2W5cMKPli33ejR7TTZHV0MPSP+ETRxEko/SLg0rb96JRKCQiO+6SOjyp+A1yW3elGNAm/Zx3cp1hOaVI6VMQwQyBmjxLRHfYLNqLz+OuUnuRxfVq2J1Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Szs9H0TtLca9N9SddPgNy7suky80VRljNFQQVnKWP1E=;
 b=MLwt4HQRpoet/LXfefkuTsruHrV/xQfs/fr2BVWW+6Rc+ihhOkuqXv9b/udg+7vtYMAsnkchN2r3NXKRgSryT54FKRilPGSJNG54luQb5L5Xhs5tTpeC9QyX0WN78Cps4iaorkGoZqkX6yMv9dBi030UEGvPTrBI6NhAJ/0YDdo=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BYAPR11MB3607.namprd11.prod.outlook.com (2603:10b6:a03:b2::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Thu, 29 Jul
 2021 18:48:45 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::cd49:4031:91e6:ec6e]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::cd49:4031:91e6:ec6e%7]) with mapi id 15.20.4352.031; Thu, 29 Jul 2021
 18:48:45 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: RE: [PATCH 01/14] drm/kmb: Enable LCD DMA for low TVDDCV
Thread-Topic: [PATCH 01/14] drm/kmb: Enable LCD DMA for low TVDDCV
Thread-Index: AQHXg0f4fW9rKegdlEOaC/8vGgE8latX9x0AgAJWM/A=
Date: Thu, 29 Jul 2021 18:48:45 +0000
Message-ID: <BY5PR11MB418225F0DC2E514BB3365C5D8CEB9@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
 <YQEBirrNA+G+GnuP@ravnborg.org>
In-Reply-To: <YQEBirrNA+G+GnuP@ravnborg.org>
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
x-ms-office365-filtering-correlation-id: 74dc7083-4567-4a46-88b4-08d952c17e89
x-ms-traffictypediagnostic: BYAPR11MB3607:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB36073F8F9788140669114EC18CEB9@BYAPR11MB3607.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0vuvTo5sOsM3+SzIhtQJcwdY8aDTUa62KOH5rgQu4q9BHro1BfFeyRr4sV2w8z/YnFbe/tRxmnQnN0bJBz4ClwgskdCc+x8CgZ0koNAmRHcUEqYK5EYjf1CwcQSiVBadmc56VkSbywI1F+D1Cv+NI4bIy4ltrJ8zPZYeTRmS1H7tlG+sSKG8oEyQE3MQ0IGNTrbiu8dzMDRTDjSfIlVRY1YbIarwG5Ds37ncoVSTGYJ+rkbyaMhXDmqmwqIqwl3YjfV9qeLK6xbFE/1JFxnVfugvxBZKFgWHhs4eyh1f8i0P2ZDhV0caIRx+ORrXGkgPxPlew1y8wlUYKJXFKPr+zeNauJUVyIRjcOsn/CPD+niM/gQiGwU6WmTdA9GOQDxXiNsVRvAXYkkhooQU1ZuIwbnnXDSW7SqI6kmLnQnKnrClpDopqXGIz7LZcawJKKkKSVISNyK6oP4XNxEOT5dmL2jrdB3bGvFjTOb12hT1CJstiLV0GjBjWucUHfmV8FV90DpFCmQBOjRWlOoqD/CiK4ohvGGtsAPwHtoCeNeuOk9H7fbuNTbwzMkx7fG+art+aDkeicWvDJbcHSc5YeJNcWFfqlTzn8kdl9I7QoQb2tJQ01TFrcs/FUbKMfIPMG6CHX/tVI204MVC7i3e9GAPWmY6NJSOc1GqMXir91pxnAqjb8lxIlRGcQyWBjZ+8CZ0CZogdOtQ1VReX5hFtTGWhA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(55016002)(86362001)(8676002)(6506007)(53546011)(9686003)(8936002)(508600001)(26005)(54906003)(52536014)(83380400001)(66446008)(66556008)(64756008)(76116006)(6916009)(5660300002)(316002)(71200400001)(66476007)(186003)(38070700005)(7696005)(4326008)(2906002)(107886003)(38100700002)(122000001)(33656002)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YbbOyHl2a56OVcDDkKIiXjKozc3mxAGVOcFya4unnpugg7KwRqnAZR56ELJC?=
 =?us-ascii?Q?6idsbl8vP/wvD/+EcVzljPr5NxjiB6i+QSSP7A2Bn8Gup4zwzAUlGM0T13I0?=
 =?us-ascii?Q?89H0thtg3he3JWfKXp9mCfq0zMkP2afWZuNZwHmQ39RSk2MDzWYwyIVizaBf?=
 =?us-ascii?Q?PJLx+f7thfNECR2+WsureaufdGUlwn//1lgdx5yae7JbtkYmMP2pql4/Nt89?=
 =?us-ascii?Q?hVNvElQaC67bKG+tkVkEjgHm0zwnWC3U2KZxS+IOnZrT/lRSd06uCpTh3W+w?=
 =?us-ascii?Q?okPHYvkIg0enfs8uz+k15bWQtKLqbuf21y3cQU+exFsYtz7MAh8IRdKwqbYM?=
 =?us-ascii?Q?hrYEf7CoAH6tAZSdLwV/0P2Z9sMlrbfKD/QxIewA78uLa8/rUD9MannG6qrw?=
 =?us-ascii?Q?vrxakfZXN1J1uSdZY4vSGB2oojO/3SWlbwEaZCjrMVhlXIR7vBJLriZD2cgw?=
 =?us-ascii?Q?FLYf2n9Ql97Ai3+PYfTinPG+gxsty+9ftyFVVOCTivnceDAjJRawXO3mwwf5?=
 =?us-ascii?Q?skgusrJ2TQWul3UkOJgZQ50Zw5REa12Z2eC5JVVI7A7b1XYBk9zO5ejO47AH?=
 =?us-ascii?Q?EnAzrA8nt/wh+Umx1unDB/el6jNJNPJZXleqDycQKt0sbOoyJXqzv4IQnZwY?=
 =?us-ascii?Q?c6Z3DO1ZK7iRuVdvk8jmvN7DLjazvzY/D8YiPonZZ03LLsYstsydFY6dFD32?=
 =?us-ascii?Q?SL5WZau88efzUlkC+AVKgMZ8DCMeJYY43gUaR9+P24EF2bSozA+k4XrwNmaS?=
 =?us-ascii?Q?FQKrT/s4VGWdw8QkXYL+Arlspw+VEJVhyste4pOUhJt+SYGL2TxubRlOAPMi?=
 =?us-ascii?Q?nqabFDPlp5ccHXcdArvRGajgwnEchrvwDz8zwzDPdrKC1Pp6MmFG4zEi7Ym2?=
 =?us-ascii?Q?xG373sYECjk1LfyCiQcCGUIANnkBRCormhUS8rZt5ATJsypLB2GCunvj9Ndm?=
 =?us-ascii?Q?BQ4P4rnjM7PE0T19NI+EsNbJSxMCubJ+srUPxl20I4PsOa6PbdClcNb26iJp?=
 =?us-ascii?Q?uW3DMWJjrl2D/vWG1Yt3HjTM/i8Yh/7RbrnSSVZkwpAHpJxtoc3opM6NxPk/?=
 =?us-ascii?Q?KsfNsVx2AID5e7fEBiYslsEcJM6O8QVswMf35g2TJtXE6N+B9K6U8yhKMwhC?=
 =?us-ascii?Q?lKJPQVuqdwGSq72turq47VprSWoyZup+2W90gOrgBQIhaSVTX3s+cS4S/MQW?=
 =?us-ascii?Q?6XojfXc0W63kpgQPuvyTb9RCqbtq15pbT7QefbIXYNi+v9Yp5euTDOndMLDX?=
 =?us-ascii?Q?ivAd9tlZ6zdc3K/fjaH6zYZLvhp6voB9xPLkIKTAw68nC0mRQpPPfrjjzLH4?=
 =?us-ascii?Q?KwY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74dc7083-4567-4a46-88b4-08d952c17e89
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2021 18:48:45.3015 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AyP3DnXNMSyBxJ6mERUwo9ElF7Xf/u/aeyjv/zSuvaLFYJB0EbpbP7X6AXkRIdGj2CtmUugh8p8DaDhPXy++118iT0DxKn83p4bWmi7oUyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3607
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
Cc: "Dea, Edmund J" <edmund.j.dea@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,
Please help! I tried to push the first two patches to drm-misc-fixes using =
dim push, but it pushed other things too besides these patches. I am sorry,=
 don't know what went wrong.

Anitha

> -----Original Message-----
> From: Sam Ravnborg <sam@ravnborg.org>
> Sent: Wednesday, July 28, 2021 12:05 AM
> To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> Cc: dri-devel@lists.freedesktop.org; Dea, Edmund J
> <edmund.j.dea@intel.com>
> Subject: Re: [PATCH 01/14] drm/kmb: Enable LCD DMA for low TVDDCV
>=20
> Hi Anitha,
> On Tue, Jul 27, 2021 at 05:31:13PM -0700, Anitha Chrisanthus wrote:
> > From: Edmund Dea <edmund.j.dea@intel.com>
> >
> > There's an undocumented dependency between LCD layer enable bits [2-5]
> > and the AXI pipelined read enable bit [28] in the LCD_CONTROL register.
> > The proper order of operation is:
> >
> > 1) Clear AXI pipelined read enable bit
> > 2) Set LCD layers
> > 3) Set AXI pipelined read enable bit
> >
> > With this update, LCD can start DMA when TVDDCV is reduced down to
> 700mV.
> >
> > Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
> > Signed-off-by: Edmund Dea <edmund.j.dea@intel.com>
> Patch is missing your s-o-b.
>=20
> > ---
> >  drivers/gpu/drm/kmb/kmb_drv.c   | 14 ++++++++++++++
> >  drivers/gpu/drm/kmb/kmb_plane.c | 15 +++++++++++++--
> >  2 files changed, 27 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/kmb/kmb_drv.c
> b/drivers/gpu/drm/kmb/kmb_drv.c
> > index 96ea1a2c11dd..c0b1c6f99249 100644
> > --- a/drivers/gpu/drm/kmb/kmb_drv.c
> > +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> > @@ -203,6 +203,7 @@ static irqreturn_t handle_lcd_irq(struct drm_device
> *dev)
> >  	unsigned long status, val, val1;
> >  	int plane_id, dma0_state, dma1_state;
> >  	struct kmb_drm_private *kmb =3D to_kmb(dev);
> > +	u32 ctrl =3D 0;
> >
> >  	status =3D kmb_read_lcd(kmb, LCD_INT_STATUS);
> >
> > @@ -227,6 +228,19 @@ static irqreturn_t handle_lcd_irq(struct drm_devic=
e
> *dev)
> >  				kmb_clr_bitmask_lcd(kmb, LCD_CONTROL,
> >  						    kmb-
> >plane_status[plane_id].ctrl);
> >
> > +				ctrl =3D kmb_read_lcd(kmb, LCD_CONTROL);
> > +				if (!(ctrl & (LCD_CTRL_VL1_ENABLE |
> > +				    LCD_CTRL_VL2_ENABLE |
> > +				    LCD_CTRL_GL1_ENABLE |
> > +				    LCD_CTRL_GL2_ENABLE))) {
> > +					/* If no LCD layers are using DMA,
> > +					 * then disable DMA pipelined AXI read
> > +					 * transactions.
> > +					 */
> > +					kmb_clr_bitmask_lcd(kmb,
> LCD_CONTROL,
> > +
> LCD_CTRL_PIPELINE_DMA);
> > +				}
> > +
> This function could benefit from a few helper functions to avoid all the
> indent. But this is un-related to this patch.
>=20
> >  				kmb->plane_status[plane_id].disable =3D false;
> >  			}
> >  		}
> > diff --git a/drivers/gpu/drm/kmb/kmb_plane.c
> b/drivers/gpu/drm/kmb/kmb_plane.c
> > index d5b6195856d1..2888dd5dcc2c 100644
> > --- a/drivers/gpu/drm/kmb/kmb_plane.c
> > +++ b/drivers/gpu/drm/kmb/kmb_plane.c
> > @@ -427,8 +427,14 @@ static void kmb_plane_atomic_update(struct
> drm_plane *plane,
> >
> >  	kmb_set_bitmask_lcd(kmb, LCD_CONTROL, ctrl);
> >
> > -	/* FIXME no doc on how to set output format,these values are
> > -	 * taken from the Myriadx tests
> > +	/* Enable pipeline AXI read transactions for the DMA
> > +	 * after setting graphics layers. This must be done
> > +	 * in a separate write cycle.
> > +	 */
> > +	kmb_set_bitmask_lcd(kmb, LCD_CONTROL,
> LCD_CTRL_PIPELINE_DMA);
> > +
> > +	/* FIXME no doc on how to set output format,these values are taken
>                                                     ^ add space
> > +	 * from the Myriadx tests
> >  	 */
> >  	out_format |=3D LCD_OUTF_FORMAT_RGB888;
> >
> > @@ -526,6 +532,11 @@ struct kmb_plane *kmb_plane_init(struct
> drm_device *drm)
> >  		plane->id =3D i;
> >  	}
> >
> > +	/* Disable pipeline AXI read transactions for the DMA
> > +	 * prior to setting graphics layers
> > +	 */
> > +	kmb_clr_bitmask_lcd(kmb, LCD_CONTROL,
> LCD_CTRL_PIPELINE_DMA);
> > +
> >  	return primary;
> >  cleanup:
> >  	drmm_kfree(drm, plane);
>=20
> With the two nits fixed:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
