Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E61B03B8262
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 14:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17EC6E9C1;
	Wed, 30 Jun 2021 12:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733446E116;
 Wed, 30 Jun 2021 12:46:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10030"; a="229977505"
X-IronPort-AV: E=Sophos;i="5.83,312,1616482800"; d="scan'208";a="229977505"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2021 05:46:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,312,1616482800"; d="scan'208";a="408547716"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 30 Jun 2021 05:46:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 30 Jun 2021 05:46:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Wed, 30 Jun 2021 05:46:29 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Wed, 30 Jun 2021 05:46:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmjqannLdQpfBtgnofhme9H8aX+zDgHoFUcC358fdSVRKDCqPBuKaGSJB6/b4kPPX+3rozibfYJuC47bjBlv51NB9I4aYz8kyJluYFhcHkjuoluEuNCl1+vt7dwy4MAxQBXPUo2ryTHmJyRKFeXMdfoX4WuGVvUfFCksBaEgTOosOWSa3C7+LJ7aAU+ohb/sVj/hkWpY42JpgzziVcnJ5a1FvxG0oPO/gu3Z06cMVYrR3/hu9BAFZBrWi9Q81NaNTrHKIVPyb/84r5T1GiBCN505TnMhFp7dNIH5aYlaRVS81EdsZOm9sETE2j2PyT5XeG3+wrEYKHgNwaPSJGldqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EijW8681IFNAECgz5++VnJ1Zbu05Csuz6jF4hh8rXgQ=;
 b=YSyQiHBAL7P089eeWFdqy8MOk2t/Rv4+m/3HmEW6na4gpRqKvd2OVymjPtAaORafbd29bGUQlGdzjB6OiF1h7RzqPeJTBmOtYu7cdIKSYX93m1iZlpjqmrNLS6frnqYmRI8zJgmhoKxVJVdedijO69cPmMjW4YEWL1A4RqZnnxhrhiIh+gJclDg590LINjBUeNoG6kZaOgSd1Jq4ceIgQuz7SNiuWJMNq8EKjnAu2r7U+q+/MKGS+YOAxqJk+jNqEg+v1uKyakAo5MFM1NP1CKhv6dQDHOVPHJzTYapFrc4jCfcFu4J/v6eO3/24aEBbVM6CodHwzAdovQ2p/3GyNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EijW8681IFNAECgz5++VnJ1Zbu05Csuz6jF4hh8rXgQ=;
 b=P9XT32ONnO9ICDFrX5Mgxli/rw2rAAOUN6mWfIkoMc3fWo06vG/9Y4FU0wbiZ/BYTS8KtypvyHVfVvRJ1bvdQhkXR51I4sNJ7OHjXL8ZfyuYI/9nyG2mAuq/YNG4+729ejMo3DCI17tpFAKR0K0Qt3ZsDhIEtKd8dJDKMDrSfJI=
Received: from SN6PR11MB3421.namprd11.prod.outlook.com (2603:10b6:805:cd::27)
 by SN6PR11MB3022.namprd11.prod.outlook.com (2603:10b6:805:d8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Wed, 30 Jun
 2021 12:46:27 +0000
Received: from SN6PR11MB3421.namprd11.prod.outlook.com
 ([fe80::5c0d:c982:3e51:d948]) by SN6PR11MB3421.namprd11.prod.outlook.com
 ([fe80::5c0d:c982:3e51:d948%4]) with mapi id 15.20.4264.027; Wed, 30 Jun 2021
 12:46:27 +0000
From: "Surendrakumar Upadhyay, TejaskumarX"
 <tejaskumarx.surendrakumar.upadhyay@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [Intel-gfx] [PATCH] drm/vgem: Use 256B aligned pitch
Thread-Topic: [Intel-gfx] [PATCH] drm/vgem: Use 256B aligned pitch
Thread-Index: AQHXbakVRM4wImWfdUKyyJp8VPDkpKsseaSAgAAF3jA=
Date: Wed, 30 Jun 2021 12:46:27 +0000
Message-ID: <SN6PR11MB3421C4C9144583F681277273DF019@SN6PR11MB3421.namprd11.prod.outlook.com>
References: <20210630120215.930829-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <YNxh1UZew73jE0vb@phenom.ffwll.local>
In-Reply-To: <YNxh1UZew73jE0vb@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
x-originating-ip: [103.240.169.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cec8d04a-0913-4ca0-3df9-08d93bc513ec
x-ms-traffictypediagnostic: SN6PR11MB3022:
x-microsoft-antispam-prvs: <SN6PR11MB3022A5297FE37C7CE0CB1888DF019@SN6PR11MB3022.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:169;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E5knGAO8K7avy/QKgJmb0DzBx4rSQpTtR+2i06OQwUspS1qzaNOLYEbcM5//CmJlr6e0E9gesMvfZKWiVlF02D/M0fo134ZSixgAk2Om5MpAnE08985JQy0uIhN/2ZlTbi7Nj2AakIfFApcWKnvWtclHn9Xz+xKWTlro3Apy3S/iC46RvLlLyaoQvWnoz8/FwkDGBAXAx0UUqAU2b85TpaAypsjx1NMDCS6WcbIRhq7TUmf+bDZkJz3NENUkBNTZiwomn7sti0aqqV6MRUQhQ0/qmA5+RXQm/IylK+RDZzV2gRnO2tadl2P3FT3HGcSUyZmygZ3H3mJuoyuCpvL5Uw5dcw/8ZBIKjvGjmclr5kWA65tvnJqUEP7aBhtlJ2x+01mVsJeuzNZeHQR3Ks8Idvp0iJarr1rioe1p8WuXTJq2hqJx3AOyLeH6BnetghRIPOp/lHxdEyaTvk4EEykHZ2bkmpWgnDvDjUtQalGQFDvMcaTGzvaW4jctGsufPHYOgPUNilWXuSbgw4iqwRecQ/0P4TjobZc5eEOSv0KrhELks7OzaPHpajKhHmYzYLsMbSzilutq3lO5qWhrCc2fXjlbZ3BMGO0rZVGKJ6zgwZLxpbYYZYp/AGoQA49RGV2ZuyJ4kjKYZS2I9yk/yEiyuwfAKTd2qw10yB/wyGv0lA+ETDd+5YLnOs54R9Ei45/dLAGdDVwqEsa2M2TBrQLyBMhFWQoia48dQs2xGkFYm1Uj0uvA+VIsSf7ylxxI1ekyHxc2p2GgZI2tkn929VMejg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3421.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(376002)(366004)(346002)(136003)(9686003)(71200400001)(86362001)(7696005)(54906003)(66556008)(66476007)(66446008)(6506007)(64756008)(5660300002)(55016002)(53546011)(316002)(8936002)(8676002)(76116006)(122000001)(38100700002)(66946007)(186003)(26005)(83380400001)(966005)(2906002)(478600001)(52536014)(6916009)(4326008)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xi7eH7YmZx3PCA4tMwnMEtfPxzjhHZBgOFqDxXirAhx4irz4eueOk43yagIX?=
 =?us-ascii?Q?mpKDHy1DFhJ3OuLeTO6OcNwDAcCSTYdm2oc6S7S1Xvw6EwD6Q92M/1jFRs+D?=
 =?us-ascii?Q?qqKRD/p5ba06NY1/09+NAPJsBYoI7OinxftnxFVdkbxoHiL48DFAQwQnosM5?=
 =?us-ascii?Q?ypJvuEI7TbTaIX7LeCQxOdeU2QPtjIwNygxUx0EKRhhSUv22ys5SwjWhrWm5?=
 =?us-ascii?Q?encQg7TpR/p63GylfpErtmbVYhw+udoDu6xRq1kli7MviFspjVyeUcmZmwi3?=
 =?us-ascii?Q?y1a/qD3NX0FzRbGgchsVw9XKDWGlaFJOzm2fy0w80fPJuL33p8nWJNLgie7X?=
 =?us-ascii?Q?2T0lm7Og/lI6emzxpGJ9/aD0i55CADQ7GM30t67ym1CLqm4Vbm+4tT7Xd0Ls?=
 =?us-ascii?Q?gwtQFpkBUN+eShmNpb4RDsz9sK1m0tvu8/2UlDXRHuLQBn/pLh6wzmY1PyNJ?=
 =?us-ascii?Q?E0jvsHHPityp19PFEROQBVijHa+YOr1ZGPxBi6rdERi84kY4KWWK77X0R0wW?=
 =?us-ascii?Q?4nV3PEu+S4RjyksjM7f7sm35pHHHzpIq6PokETq+6yA4UQ9Pn3JVinUb9yOD?=
 =?us-ascii?Q?L4rYr4igxGOvFeH6kEEsFFHhw0/QDpUp2wyNGqSKCHbzu9r17dQ6oT7idRHp?=
 =?us-ascii?Q?E4qQYjjHgM2WWuwXM3dn7p5gKK04kPfDhMqYEOLFLbGLyxOKP5hDSJ0WjtJc?=
 =?us-ascii?Q?MtOaUDj4UmN0aSpz5uvHGAsTZSkdvV7MIZ0nNi70uCPs6QVBHbJhqSOxwdHZ?=
 =?us-ascii?Q?baGvFPqhpp6YaXCOrk2JKkhAaVFqxwj2nRheg7FWjw+qfNeDk8MXG65DjPqF?=
 =?us-ascii?Q?qOmlQxKDuDw/hmxha1c6uWDMYWd59wh6wxtmighICtOv3FjjS9ToN/6UiYOK?=
 =?us-ascii?Q?T+9zD1pFx/On+wo4FyC+lQ+7EEIJQc8F4rvuUdWDRDXrGDFldqnshS66sVcs?=
 =?us-ascii?Q?pZ1jB8zXCiMZF9ea2ruwNxWn8Z2irAFCKdh9WVumtvDWQVSWoyz70I9J2b3o?=
 =?us-ascii?Q?2wflM6IV2pLlnL5AJkz7m3Gb5Kk78vtnHf1hjPzMDKlqXzeLzshvUnpScrGn?=
 =?us-ascii?Q?HWybp93j2O9OztM0mFbD3sBsqENQL5JU6eZZ3jXC+EsQvorDcnZrIyoDYSpY?=
 =?us-ascii?Q?EgDauQXVco/TPbYD3S4Y/jrm05J74PzcPbu2PYw/BnWzcTDC+XZgn3n0rN1X?=
 =?us-ascii?Q?o72NpN/mUkVNM4nIYkG8xd/6vcQOdr+uh+iAixTN5r/kmPNetCUR+L1U3Qie?=
 =?us-ascii?Q?DvnNKRnEguuTaaIHfl1c4giUZ17pnx/e56F6CzJDohuj7FPKihYPsWX69uM7?=
 =?us-ascii?Q?qFxLj5IdImIjqV6yUzFUhvMi?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3421.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cec8d04a-0913-4ca0-3df9-08d93bc513ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2021 12:46:27.7551 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 044erP3AjFKM2nHyOsTy2y8KwH9czUm+vfomAQVDD+Pb/0qD75DNPZQC7C4OR6I+JauwyioWTf4UeBNQNClcdtdkv4cYY6hfF874HjREwVmxERxbfho9jF4c8y2bxPhAtc7sEAy8x5PlP4y1PUXe1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3022
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Daniel Vetter <daniel@ffwll.ch>
> Sent: 30 June 2021 17:52
> To: Surendrakumar Upadhyay, TejaskumarX
> <tejaskumarx.surendrakumar.upadhyay@intel.com>
> Cc: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org;
> chris@chris-wilson.co.uk
> Subject: Re: [Intel-gfx] [PATCH] drm/vgem: Use 256B aligned pitch
>=20
> On Wed, Jun 30, 2021 at 05:32:15PM +0530, Tejas Upadhyay wrote:
> > Having different alignment requirement by different drivers, 256B
> > aligned should work for all drm drivers.
>=20
> What.
>=20
> Like yes vgem abuses dumb_create, but it's not a kms driver. Pitch is
> meaningless, and that's why we align it minimally to 1 byte (bpp =3D bits=
 per
> pixel here).
>=20
> Maybe start with explaining what you're trying to do here.
> -Daniel
> >

Igt tool tests which are trying to exercise tests through VGEM are getting =
failure (if not 64B aligned) on Intel platforms in creating framebuffer as =
they need them to be 64B aligned. Then 64B alignment is not=20
A requirement for all drm drivers.

Thanks,
Tejas

> > Signed-off-by: Tejas Upadhyay
> > <tejaskumarx.surendrakumar.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/vgem/vgem_drv.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/vgem/vgem_drv.c
> > b/drivers/gpu/drm/vgem/vgem_drv.c index bf38a7e319d1..1da6df5e256a
> > 100644
> > --- a/drivers/gpu/drm/vgem/vgem_drv.c
> > +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> > @@ -215,7 +215,7 @@ static int vgem_gem_dumb_create(struct drm_file
> *file, struct drm_device *dev,
> >  	struct drm_gem_object *gem_object;
> >  	u64 pitch, size;
> >
> > -	pitch =3D args->width * DIV_ROUND_UP(args->bpp, 8);
> > +	pitch =3D ALIGN(args->width * DIV_ROUND_UP(args->bpp, 8), 256);
> >  	size =3D args->height * pitch;
> >  	if (size =3D=3D 0)
> >  		return -EINVAL;
> > --
> > 2.31.1
> >
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>=20
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
