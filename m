Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B28163D991B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 00:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFA46E9F7;
	Wed, 28 Jul 2021 22:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD63A6E9F7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 22:55:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="199982204"
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="199982204"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 15:54:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="506716845"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Jul 2021 15:54:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 28 Jul 2021 15:54:52 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 28 Jul 2021 15:54:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 28 Jul 2021 15:54:52 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 28 Jul 2021 15:54:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWvF0AqICrMaTpxhUe/dyXegUARMCVQC726TyOuSHNv9b/iw3CjVxV07IduEGLVXG3CIkDcSCTHqQ4tskzJIRFiQdtSpm97iEIaLjxNOaYY19DTCqsdZLvNQCpLd3o3mK4xSk5bX0aixVci7Wrw7oQ2o0poGkSrWIssp93+q5IZthq8Tv/FXYG+Yojm6l//7oVroFEFB1v7atni8D4Z1fsxsWhW8dhIeuawXZtZ4WtQhkzpYQu8JI7fyUhgPbowLm+srNpaK3HT/3gsncvjTbANFYhXVqC1neQ+6NZRG17HCfYPbe3CVZ+mTFBhzhINAu9czWtGM73W4sqSwkBfO6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tPOX/EqYnsQrhXcLow26T1dxiXkcKAVAOig7+bXevk=;
 b=NBJQYOnDFO5uLo5PUuHP2hlWqZpV7M2Yy6En1nuxyBYInv9q82W193LPu4pzwkB8Qz4wAWbENBcTBB0+rXzcZWlx1UU9aJf2sWr/XLwEteoqIcn/FAhvUxMziE8UzflpugcLF6PbWTtFbm9Ov2zYTYXaT8xLdNwebBqGXOBP09bGNmRplN5p4ryspnuDXfRBkXkqOBzKwf59tyQkZf1voHM4q5SopJtlMrl/067BBqB4g0BgQVbFhUovCkxtoGka9sSM9gOiYql2ociKhEhzD0QR+XioF7nHiU+u+oCAiJbBOYhCGN/HEcmKKFfriSvWDJgonfgvXGgngjAWkac3eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tPOX/EqYnsQrhXcLow26T1dxiXkcKAVAOig7+bXevk=;
 b=Uji9ck6i9bS+8r9VBuieyAXbL47Chkbqp0brndco7Mq3FUMbUho+JIIi2X/XTOzjVzSMuiRG1LCM61qg9uaZe8Z4sEM98wIa/TGwxpWDps22D4aRdgOnpYGVPuBgrDJrBVYDPhvbld5RKCtqlqQGBmd84AcUR0vsbup14sPqP3A=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BY5PR11MB3896.namprd11.prod.outlook.com (2603:10b6:a03:187::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 28 Jul
 2021 22:54:51 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::cd49:4031:91e6:ec6e]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::cd49:4031:91e6:ec6e%7]) with mapi id 15.20.4352.031; Wed, 28 Jul 2021
 22:54:51 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: RE: [PATCH 04/14] drm/kmb : W/A for 256B cache alignment for video
Thread-Topic: [PATCH 04/14] drm/kmb : W/A for 256B cache alignment for video
Thread-Index: AQHXg0gJpVAFYe9jy0e+AqtsRcEulatX+kiAgAC9AXA=
Date: Wed, 28 Jul 2021 22:54:51 +0000
Message-ID: <BY5PR11MB418293AA35C6402743D9E81E8CEA9@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
 <20210728003126.1425028-4-anitha.chrisanthus@intel.com>
 <YQEEM7YKYd9go3WN@ravnborg.org>
In-Reply-To: <YQEEM7YKYd9go3WN@ravnborg.org>
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
x-ms-office365-filtering-correlation-id: fbd48fba-6e70-4f5d-cc3c-08d9521ab55e
x-ms-traffictypediagnostic: BY5PR11MB3896:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB38969B6F9ADF03570131ECFB8CEA9@BY5PR11MB3896.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OTvEwWWVaeg/9UemWemX4ddPGZyw6hx5Uj2HbnWK1x/k2Fw6HykEKUN9EAqfdmSmYRJZ/36N52/7ATs1zrLBvlfsYsTmlLEQPmrRYl/uqQ9T13+1/w3mV0M4hX3SIVS3NssRCkcINBrhQDyOZktTuVCODPQT606XkU17YKC+/ZUAFqoURWocFbVmh0J2U8vfOx82OJGK4kUKGAl4mVKdDnngQYW+eUgZAIfiQsgDbuevp++S0T9RYk+tw86/cIUGD9VrQKgC4RLoAdi5yGKrr+x63WUJpziz34xshFCIvAwMPLxxnvt6/neWg9fsqL6K5Cx8aMAMGgP32p3YNYG4wSVOLM/iiGuJsTF90Ihv/O9eC5+tVbfbifLCfRrxPPua1B+XkbdovOmTgM0ACsJ2gROLtfJ0fnCgJqyIdcIMNvPk0rB1HDPX6OMvQ/ZmT5PzKaZ9HhtIX/w9ewTfUM8OLXtkvRfAaZTS6kcMCgcHq73xv6Q7oXcbTHIqqTrsu3E8myXFcNKdOfRsa4C1IuxjanhJqAB+9M2nl6ZSiHwXdLP6t3mlgImB1NqS1OtH2Hkn6GeCObtYAX1uVi33w9AjfI8ck3wV51qnzth2MBu/WvPH8qQ14tisFADhwqZFgX521UXuDPHkkvy/N4b62HoO6OpUUmS+TsKgLfwDdNdHvnpWmq01y0e4kVIGvVTsBc5miE2BP6f5ws/YcpBFL9U+xA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(396003)(366004)(346002)(66556008)(6506007)(26005)(5660300002)(66946007)(316002)(38100700002)(33656002)(7696005)(478600001)(76116006)(54906003)(53546011)(66446008)(52536014)(83380400001)(38070700005)(66476007)(122000001)(6916009)(64756008)(186003)(8676002)(9686003)(107886003)(55016002)(2906002)(86362001)(8936002)(4326008)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?o6v0QcBLnSHGjEa+PTCaaPl09AWfnidq21ZbhAs+g1LLhfOtSGHiwDR5JDmX?=
 =?us-ascii?Q?WJL0GIoD12Z4/A6kgk64gKdOkVpKRe4PGpOz6SJAUrBma3CyBE5hxYrxwaxF?=
 =?us-ascii?Q?T7d4Ig2yd3x3MBtbJtWZIiJwHccuVBui/XHvXY1vEWF+v6kt/siXytFbNvym?=
 =?us-ascii?Q?QoaSskYRXyr4CFfNKVI9ulsHJTSnVjHa4ObymU1wGNfsKwThn0nc2EP0Q4Vj?=
 =?us-ascii?Q?4D6hFwzvbjkleuEv9pX1cMfMbRMqhilpXfoLIFcm/WFwRFFY1wHbE8mYIknJ?=
 =?us-ascii?Q?YAOIU4ptONS+fB8K0gH7jGjXzllQil3eMXiqqXuJKvRhUy+5enndVUjJT1fR?=
 =?us-ascii?Q?HgvzJDm3V0pO4k8JFXjFOlABm8lhYDCQys5X2Z9t4X95Bx2US+nNH4swhy0b?=
 =?us-ascii?Q?Wz51yFL+hwTUSSDaWYZRWacolr6/3zm1SOZkXrzrbb6+flYx6k8qhZ4WDjZi?=
 =?us-ascii?Q?3vEnC32g5Pa2HkXoxamhun+FRyEe+hhkqyQIIO/QmJ8NisQztdML5+xKCIUl?=
 =?us-ascii?Q?/4q0r4LrivrTfoIM6yw0bsCh6us8co9iKB9fN8Dnf6LRvE7TwgRP4KAY9so1?=
 =?us-ascii?Q?eOlqKpLNqkb4517y0WyzfQcBKZSp8ak+FUUmqWEdEreyvxg9xzulHGF+W3q6?=
 =?us-ascii?Q?AMEH0cEcwKEkdE2nj6OOZeXfB+FWNk7NXgwsFudGf26BDn1IudSUT05PNN+W?=
 =?us-ascii?Q?Bu+sxi0W3RLviAGAC4CwV0iAsXSi2K1hQn0i1Q7BkCV4Soe2B2r3P4pNf569?=
 =?us-ascii?Q?Z8e/IieErjdUmgy5YiPD6ZYZow17Cnhkarmx+rJiSUC1/T7uto0zoACdBZO3?=
 =?us-ascii?Q?3N+eaRKvoxQltg94leZXVDde8sYLMf/w69DM3BVxyWYDCGA0J+wB1MSAM3Gy?=
 =?us-ascii?Q?PSo8iQZka80GCO6BihVogNE3Zxif+FRbvXUD+NsJ/+43U58Tm7j78tGGe5AP?=
 =?us-ascii?Q?++dWo/kH5DYaqEG8Qa5RcMI8cu7kwp06IhWDXX5XVnOKtSMGdOhQKEv1Uj44?=
 =?us-ascii?Q?8px1UAGXmdRw09UHMkGSqaLwerQxJ8nc/YDKTgkVGqEKuZQWGsjvYzd8WZ03?=
 =?us-ascii?Q?ATtnwAWogPhFPnPxDkcntYdDheHVuThfOLtcsfsWmHgV3SDUBlq6CDHjx1pm?=
 =?us-ascii?Q?/N/weED8XvrnifV2gzDCtAqGWGlbbzRB7xphWTNnp3/m+tuIc+ZrJoKkFlkR?=
 =?us-ascii?Q?hbwBA3Kv7JPLaAexDWQ0AcbDGreIj9/LAGNHukANxEoqKtD+ydXBMfV7Mxr1?=
 =?us-ascii?Q?DF6kJSku/O6heZsZxE+JOiib/hzflFehxnkMY6u9Y484p/2OXaT8vtxkd1TA?=
 =?us-ascii?Q?TP4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd48fba-6e70-4f5d-cc3c-08d9521ab55e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2021 22:54:51.3842 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z7b7jk4MaDB5ok6YQEPmB4vTd3ZY7MPcXI3t8eHGLhD4Z9GXpyDlCybRf+RAcVvdGqVMFdsSpxqgynTOi8eGVXHYTLo6fLsNSk1wwUiT+sk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3896
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
Thanks for you review.

> -----Original Message-----
> From: Sam Ravnborg <sam@ravnborg.org>
> Sent: Wednesday, July 28, 2021 12:16 AM
> To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> Cc: dri-devel@lists.freedesktop.org; Dea, Edmund J
> <edmund.j.dea@intel.com>
> Subject: Re: [PATCH 04/14] drm/kmb : W/A for 256B cache alignment for vid=
eo
>=20
> Hi Anitha,
> On Tue, Jul 27, 2021 at 05:31:16PM -0700, Anitha Chrisanthus wrote:
> > For B0 silicon, the media driver pads the decoded video dmabufs for 256=
B
> > alignment. This is the backing buffer of the framebuffer and info in th=
e
> > drm frame buffer is not correct for these buffers as this is done
> > internally in the media driver. This change extracts the meta data info
> > from dmabuf priv structure and uses that info for programming stride an=
d
> > offsets in kmb_plane_atomic_update().
> >
> > Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
> > Signed-off-by: Edmund Dea <edmund.j.dea@intel.com>
> > Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
>=20
> Drop extra space in subject before ':'
ok
>=20
>=20
> > ---
> >  drivers/gpu/drm/kmb/kmb_drv.h    |  1 +
> >  drivers/gpu/drm/kmb/kmb_plane.c  | 38 ++++++++++++++++++++---
> >  drivers/gpu/drm/kmb/kmb_vidmem.h | 52
> ++++++++++++++++++++++++++++++++
> >  3 files changed, 87 insertions(+), 4 deletions(-)
> >  create mode 100644 drivers/gpu/drm/kmb/kmb_vidmem.h
> >
> > diff --git a/drivers/gpu/drm/kmb/kmb_drv.h
> b/drivers/gpu/drm/kmb/kmb_drv.h
> > index ebbaa5f422d5..0904e6eb2a09 100644
> > --- a/drivers/gpu/drm/kmb/kmb_drv.h
> > +++ b/drivers/gpu/drm/kmb/kmb_drv.h
> > @@ -49,6 +49,7 @@ struct kmb_drm_private {
> >  	int				kmb_under_flow;
> >  	int				kmb_flush_done;
> >  	int				layer_no;
> > +	struct viv_vidmem_metadata	*md_info;
> I cannot see this member used in this patch - can it be dropped?
Good catch, yes will remove it.
>=20
> >  };
> >
> >  static inline struct kmb_drm_private *to_kmb(const struct drm_device *=
dev)
> > diff --git a/drivers/gpu/drm/kmb/kmb_plane.c
> b/drivers/gpu/drm/kmb/kmb_plane.c
> > index 2888dd5dcc2c..e45419d6ed96 100644
> > --- a/drivers/gpu/drm/kmb/kmb_plane.c
> > +++ b/drivers/gpu/drm/kmb/kmb_plane.c
> > @@ -11,12 +11,16 @@
> >  #include <drm/drm_fb_helper.h>
> >  #include <drm/drm_fourcc.h>
> >  #include <drm/drm_gem_cma_helper.h>
> > +#include <drm/drm_gem_framebuffer_helper.h>
> >  #include <drm/drm_managed.h>
> >  #include <drm/drm_plane_helper.h>
> >
> > +#include <linux/dma-buf.h>
> > +
> >  #include "kmb_drv.h"
> >  #include "kmb_plane.h"
> >  #include "kmb_regs.h"
> > +#include "kmb_vidmem.h"
> >
> >  const u32 layer_irqs[] =3D {
> >  	LCD_INT_VL0,
> > @@ -294,8 +298,10 @@ static void kmb_plane_atomic_update(struct
> drm_plane *plane,
> >  	unsigned int ctrl =3D 0, val =3D 0, out_format =3D 0;
> >  	unsigned int src_w, src_h, crtc_x, crtc_y;
> >  	unsigned char plane_id;
> > -	int num_planes;
> > +	int num_planes, i;
> >  	static dma_addr_t addr[MAX_SUB_PLANES];
> > +	struct viv_vidmem_metadata *md =3D NULL;
> > +	struct drm_gem_object *gem_obj;
> >
> >  	if (!plane || !new_plane_state || !old_plane_state)
> >  		return;
> > @@ -325,6 +331,16 @@ static void kmb_plane_atomic_update(struct
> drm_plane *plane,
> >  	drm_dbg(&kmb->drm,
> >  		"src_w=3D%d src_h=3D%d, fb->format->format=3D0x%x fb-
> >flags=3D0x%x\n",
> >  		  src_w, src_h, fb->format->format, fb->flags);
> > +	gem_obj =3D drm_gem_fb_get_obj(fb, plane_id);
> > +	if (gem_obj && gem_obj->import_attach &&
> > +	    gem_obj->import_attach->dmabuf &&
> > +	    gem_obj->import_attach->dmabuf->priv) {
> > +		md =3D gem_obj->import_attach->dmabuf->priv;
> > +
> > +		/* Check if metadata is coming from hantro driver */
> > +		if (md->magic !=3D HANTRO_IMAGE_VIV_META_DATA_MAGIC)
> > +			md =3D NULL;
> > +	}
> >
> >  	width =3D fb->width;
> >  	height =3D fb->height;
> > @@ -332,6 +348,11 @@ static void kmb_plane_atomic_update(struct
> drm_plane *plane,
> >  	drm_dbg(&kmb->drm, "dma_len=3D%d ", dma_len);
> >  	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LEN(plane_id), dma_len);
> >  	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LEN_SHADOW(plane_id),
> dma_len);
> > +	if (md) {
> > +		for (i =3D 0; i < 3; i++)
> > +			fb->pitches[i] =3D md->plane[i].stride;
> > +	}
> > +
> >  	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LINE_VSTRIDE(plane_id),
> >  		      fb->pitches[0]);
> >  	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LINE_WIDTH(plane_id),
> > @@ -339,18 +360,22 @@ static void kmb_plane_atomic_update(struct
> drm_plane *plane,
> >
> >  	addr[Y_PLANE] =3D drm_fb_cma_get_gem_addr(fb, new_plane_state, 0);
> >  	kmb_write_lcd(kmb, LCD_LAYERn_DMA_START_ADDR(plane_id),
> > -		      addr[Y_PLANE] + fb->offsets[0]);
> > +		      addr[Y_PLANE]);
> >  	val =3D get_pixel_format(fb->format->format);
> >  	val |=3D get_bits_per_pixel(fb->format);
> >  	/* Program Cb/Cr for planar formats */
> >  	if (num_planes > 1) {
> >  		kmb_write_lcd(kmb,
> LCD_LAYERn_DMA_CB_LINE_VSTRIDE(plane_id),
> > -			      width * fb->format->cpp[0]);
> > +				fb->pitches[1]);
> >  		kmb_write_lcd(kmb,
> LCD_LAYERn_DMA_CB_LINE_WIDTH(plane_id),
> >  			      (width * fb->format->cpp[0]));
> >
> >  		addr[U_PLANE] =3D drm_fb_cma_get_gem_addr(fb,
> new_plane_state,
> >  							U_PLANE);
> > +		if (md) {
> > +			addr[U_PLANE] +=3D md->plane[1].offset -
> > +					 (addr[U_PLANE] - addr[Y_PLANE]);
> > +		}
>=20
> I failed to follow why:
> 1) offsets is no logner needed
That's a mistake, will put back the offsets
> 2) If pitches is always set or only set with a hantro buffer
Pitches is set by hantro driver to a different value, I'm going to send v2 =
which combines this with patch 09 which reverts some of the above changes.
> 3) Why addr[U_PLANE] is assigned twice in the md !=3D NULL case
I agree this is confusing, will make send v2 with simplified and separate c=
alculations for addr[U and V plane} for md=3D=3DNULL and !=3DNULL case
>=20
> >  		/* check if Cb/Cr is swapped*/
> >  		if (num_planes =3D=3D 3 && (val & LCD_LAYER_CRCB_ORDER))
> >  			kmb_write_lcd(kmb,
> > @@ -364,7 +389,7 @@ static void kmb_plane_atomic_update(struct
> drm_plane *plane,
> >  		if (num_planes =3D=3D 3) {
> >  			kmb_write_lcd(kmb,
> >
> LCD_LAYERn_DMA_CR_LINE_VSTRIDE(plane_id),
> > -				      ((width) * fb->format->cpp[0]));
> > +				      fb->pitches[2]);
> >
> >  			kmb_write_lcd(kmb,
> >
> LCD_LAYERn_DMA_CR_LINE_WIDTH(plane_id),
> > @@ -373,6 +398,11 @@ static void kmb_plane_atomic_update(struct
> drm_plane *plane,
> >  			addr[V_PLANE] =3D drm_fb_cma_get_gem_addr(fb,
> >
> 	new_plane_state,
> >  								V_PLANE);
> > +			if (md) {
> > +				addr[V_PLANE] +=3D
> > +					md->plane[2].offset -
> > +					(addr[V_PLANE] - addr[Y_PLANE]);
> > +			}
> Likewise - is pitches always valid and why assing addr[V_PLANE] twice?
Answered above, will send V2
>=20
> >
> >  			/* check if Cb/Cr is swapped*/
> >  			if (val & LCD_LAYER_CRCB_ORDER)
> > diff --git a/drivers/gpu/drm/kmb/kmb_vidmem.h
> b/drivers/gpu/drm/kmb/kmb_vidmem.h
> > new file mode 100644
> > index 000000000000..06198d413f50
> > --- /dev/null
> > +++ b/drivers/gpu/drm/kmb/kmb_vidmem.h
> > @@ -0,0 +1,52 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only
> > + *
> > + * Copyright (c) 2018-2020 Intel Corporation
> > + */
> > +
> > +#ifndef __KMB_VIDMEM_H__
> > +#define __KMB_VIDMEM_H__
> > +
> > +#define HANTRO_MAGIC(ch0, ch1, ch2, ch3) \
> > +	    ((unsigned long)(unsigned char)(ch0) | \
> > +	    ((unsigned long)(unsigned char)(ch1) << 8) | \
> > +	    ((unsigned long)(unsigned char)(ch2) << 16) | \
> > +	    ((unsigned long)(unsigned char)(ch3) << 24))
> ...
>=20
> This header looks like it belongs outside the drm driver - I assume the
> hantro driver needs this?
This is from hantro driver and I agree it does not belong here, but we need=
 this struct to extract the meta data info. Hantro driver is not upstreamed=
 yet, how should I tackle this?
> Or is this some uapi stuff?
>=20
> 	Sam
