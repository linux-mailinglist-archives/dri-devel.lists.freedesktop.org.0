Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BC6402DBF
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 19:33:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E7188D1E;
	Tue,  7 Sep 2021 17:33:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C031688D1E
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 17:33:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="207499164"
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="207499164"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 10:33:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="538076662"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Sep 2021 10:33:06 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 7 Sep 2021 10:33:06 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 7 Sep 2021 10:33:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 7 Sep 2021 10:33:05 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 7 Sep 2021 10:32:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8PQio2qIxEPYwgGYsfDjCi/4am8nSe4KFIckflnuN0OEtZYcobFCKYvLLGMZJGJ3rgYJzxtEfXdF5FL5guUkRIRx2k7UpLqGVhywXLb/5OPNx5wM2cJkzoleHML2rGjqDwUb0GrUcXxMof9301JUC7RLJyXHCDX7Tibvt8307sL40oTp8k5xHY3HNuW/vwfNrhcDrydeMCeGCPfVN7L+zNQ5Iy1BM3I8nJcPaLNn5GiLnmhJGaPAMwpZoxkdPY5ENsU/CVfhdeTxarOKKZjW9+mETRu0Rw8VisWSddKf2b1lCjd3sZltb2ggG1s9XyOnLHknA68RT1fuq2eyDtVvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=vgOMyN8bnaOFNTjXcCHjPEY58hjiKGtfNaBMe2/lkcw=;
 b=UpFlrzMABtgPb4a8Srlz4gCOpTYBVCiXISqtb4ei6x80YiZ7X0oDObAwXmbSU67S9bAsVkwTpbvbHAhzFCXt2Q03ZBQRMGgFMVeLaoFmacbpv84GRb3yBfhXweVKxMPdT6ZIOqn+pj69jdGWZEMEckHTAaNdCRsEeumVqrmOUWJCafyWPCqjiNkb8wzprs5PSdOO97tPpDtQskSzn8Zf9HFIyibdC10nxwuQsXFPHzorY0nO/oBsdhWTDF6KBBQUnsNuaj9sdS/BbtOnQKlcDTE15nxtF36qe1MTfGKMmjUknz0xXN5w2NoF8mBwrL/Z44IJ55YgcBrzBVPhID70Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgOMyN8bnaOFNTjXcCHjPEY58hjiKGtfNaBMe2/lkcw=;
 b=zNWVQLU62aBs01YZD8gS3k2nZxe5AMlXS6wVcDfBU2/KYwGJu91GdENbCNukAQtsPatFvYf5i2uHCVhZvrbciVKGJiq/bttsUHz3sB41A/pQFdcEOBrDU7wb9AaZIW+yx/usNJy/9aQ2F2vj1N3iTE0RXKVT9THRvbrlrjVqRLg=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by SJ0PR11MB5200.namprd11.prod.outlook.com (2603:10b6:a03:2df::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 7 Sep
 2021 17:32:54 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::e189:6f03:9fde:2062]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::e189:6f03:9fde:2062%5]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 17:32:54 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Kees Cook <keescook@chromium.org>
CC: "Dea, Edmund J" <edmund.j.dea@intel.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Subject: RE: [PATCH] drm/kmb: Avoid warnings on impossible plane_id
Thread-Topic: [PATCH] drm/kmb: Avoid warnings on impossible plane_id
Thread-Index: AQHXmd2XU9vEPkR5QkaaPDsb+p2SVauEr1kwgBQ4SdA=
Date: Tue, 7 Sep 2021 17:32:53 +0000
Message-ID: <BY5PR11MB4182FEB7263045FC3855723B8CD39@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <20210825181807.1138053-1-keescook@chromium.org>
 <BY5PR11MB4182ABD607EB99C1F68777928CC69@BY5PR11MB4182.namprd11.prod.outlook.com>
In-Reply-To: <BY5PR11MB4182ABD607EB99C1F68777928CC69@BY5PR11MB4182.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56001d0b-64ec-4b72-1cd1-08d97225863f
x-ms-traffictypediagnostic: SJ0PR11MB5200:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR11MB5200B71D935D2FCA1091A3BB8CD39@SJ0PR11MB5200.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:332;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vTKjQxdQeezETPUKymbTqBYK8hbm/eahywWq+zxb7DX5e27N+9NJaM6VgJhPE1VWc443SyF6fKrNJjkLW7K+Drztuf3NXUYYBnl0PQ1F+Aa3WOFNjnneNKO/H0oI+6QEwH3pBMgrLEQfz1hCEf6YeVLBkq0103chDlqhqJ5EfllKrTzvHUmcJEM6bhon1JmRI/vyNmGBDhIq9e8+BF9BHtf6azMmmU6EuuREB2HTWvH151330spOPRPuyOgd5trl/zJ7Eb2feUdWyHOjXTTy3Bxi2fk2EZLrsYaB6O1+2/QXov4dPZ7AtpZ/dOuBcFAlmpgdxfDRlARF9dfyDex+0bCVji/ZvqmDrGeV4cUJwaFP9WiFxuPSRGwu3tnORVjr3p6JMw7Q4a0KErdLdD5pE85Aj40zjPeDq/MAsm7XdjMelbqBKiTPP2qI9/pSui/R9x0KVxE9EaKPHrh6hU+jOWvXjeREvS0XbZqSuP9VoxwVUe4RV71yiFJbnAUrizOJkxZn0j2KPPfDyaqGa2E8NoP69z7qodycxWQCGhw03D/OI/sMtZRrt+KNUD3pH+KOskZ8wA5QRgGGOfLPdcrzDRvajNYsfSDQp8J0ngRIUGUN/XbURkBDhUaIET2TIcgbUMH1lxPTMWsrsNZ743MlMr74lZ5XVDXz/YJZMPmfxm91W6iAJCY2HZnVhQFfxXd4M0sOVTMiQPb40QCLWlGWqQQZSwR9W91ztsvWZaINGLu2LFQFv2N1ElGprpmJzu8UmrEFI5SHvObo1cHdcLmg18A5/OSdFwrTsYKInYvJiWlqzpuT0TLxINcPW67yd6vxInGukdppElNUWFS2WqZnNg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(396003)(136003)(366004)(122000001)(33656002)(4326008)(54906003)(66446008)(2906002)(66556008)(66476007)(5660300002)(71200400001)(64756008)(76116006)(53546011)(6506007)(66946007)(7696005)(8936002)(26005)(52536014)(38070700005)(186003)(55016002)(8676002)(966005)(478600001)(6916009)(9686003)(316002)(83380400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8UnCjb1jU7TYyKANVY/+fhUFCYuJ3DzD5vC1YDkRXYBO5CNOPjOZBItQ+Tia?=
 =?us-ascii?Q?sMF8BFvZFdZ0Ei8hpmB/SJdqHIz7YT/qYIV4aRY2acc6hCiBXRSfU8Pvqa+D?=
 =?us-ascii?Q?LoYiTuxaCUEUoP4IWm9acH9SQcX4gnA+3t8MYPwpNZR+E/N9BUtQCpFC4PaN?=
 =?us-ascii?Q?Mu1Z0lLPXS+ncV2GV/dC4Ci4RYmV321rM3P9sptJ64GUOHiQP+SSH7KgFHpc?=
 =?us-ascii?Q?/4oxSPQvhHkJsjpJobipODVr0pnHqWI8WdpE9sFvoasEqCeKbS91n31n69xV?=
 =?us-ascii?Q?2nMUUxsamdlmi4IoBZ5JDGBueoym6G90nOxBSItxlfe6iR9weyo+OxPDpHO6?=
 =?us-ascii?Q?bcNNHgGhdq0MTC7nzjlK4pTAZj66XZL49E7dfK9JyWUM3imw+LjeJAzhHEBU?=
 =?us-ascii?Q?Di3aEbVjekBuwd9bs2KjNkuqPYK+Ya35crLInK5TvY5hiKT5iXDsVwtQKDzd?=
 =?us-ascii?Q?g/C9e1QZ2uOAATcXRHtTrw0H8WkNKlx1z6KC8lZvPwPCrSVVdCA99NJQMr8H?=
 =?us-ascii?Q?h9W8zjy2vwsEyTv1BzUwlPed2UJJXNZJoPEQa2ivhczNxLYV8owcDZF/kw1I?=
 =?us-ascii?Q?jyoNf3CnMo9NbpAKosQ8zVqcNoo8fgKnlsX/HORNQe6t4C17xqmIiyV/kRYW?=
 =?us-ascii?Q?jyoef45JupeydSFPUtUYgRsiQEXTk5KuBfv6eFCFjrHSYj2ha8wnkWfKTlC8?=
 =?us-ascii?Q?zxxOerOX8DVdLnP/baCgBJLCmTM0uj+TNL/JrxFrHlDbn4K1bw2LFpwp2/6A?=
 =?us-ascii?Q?vaXoJ8fT2OqpjiNuXXzgWYO32Mi1Xkv96tf87IbA8bhJN1hyMjoztPk+jBZr?=
 =?us-ascii?Q?xa27aksPlSnMp3UaZACW3Ux/ZWFuTbA9veEavKISVO6bHAkYp/qEMeusPS2P?=
 =?us-ascii?Q?1LnV/niz6um8cOY8H1qtZu4G3N8GLsfTSJTgYba2BjLFgCPLWuLvapS5DKnv?=
 =?us-ascii?Q?TT/m419kTAA0qQthKq+ym6BCR/XL68whlq64zMhuGUHVjUqtwGOrMwu0jtg7?=
 =?us-ascii?Q?/Pi/7bAwPu2/KMFWZr7/fdHpDw3rmTfxQD0NmF3hpB1MtLRFTBU5/+M+YmbQ?=
 =?us-ascii?Q?pTKkLRSSQyqq+CQbwOQXJxjxQy9zuX1UTekYqbFPZfFYmnPQzG1ba8skyFMk?=
 =?us-ascii?Q?CeZEroCdj2l2UTrMzBwkupChZ19wXEco/yKpppUK53mPVAvv/Brm5zWWNBYY?=
 =?us-ascii?Q?5Slg6fdbud2qXkJ7BlaR5BCeMlZgqeX8k7cmV+uroXb7xRDCwPgd3JI89fL+?=
 =?us-ascii?Q?eilnYg2lMZiXeGrJ+im2lqZF2SxhUYoCPr3SQ159tY40Vr/C8xrQMAQ2XzmD?=
 =?us-ascii?Q?jao=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56001d0b-64ec-4b72-1cd1-08d97225863f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2021 17:32:53.9496 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hQy3j/vRnLQ1Ww5vH1Sxjf9ItN1WuWaUjYakSWGaY5dI5TRsd12iXS9PzWz1sUKJxZjYcK/Z2kAN1wXejynvWXmj6tDAGLuseAENEEsPYLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5200
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

Hi Kees,
This patch https://patchwork.kernel.org/project/dri-devel/patch/20210728003=
126.1425028-13-anitha.chrisanthus@intel.com/ is pushed to drm-misc-fixes. T=
his change should fix the below warnings.

I apologize for all the inconveniences.=20

Thanks,
Anitha

> -----Original Message-----
> From: Chrisanthus, Anitha
> Sent: Wednesday, August 25, 2021 1:44 PM
> To: Kees Cook <keescook@chromium.org>
> Cc: Dea, Edmund J <edmund.j.dea@intel.com>; David Airlie <airlied@linux.i=
e>;
> Daniel Vetter <daniel@ffwll.ch>; dri-devel@lists.freedesktop.org; Sam
> Ravnborg <sam@ravnborg.org>; linux-kernel@vger.kernel.org; linux-
> hardening@vger.kernel.org
> Subject: RE: [PATCH] drm/kmb: Avoid warnings on impossible plane_id
>=20
> Hi Kees,
> Thanks for your patch.
> The switch statement is needed for multiple planes which is already appro=
ved
> in this patch series.
> https://patchwork.kernel.org/project/dri-
> devel/patch/20210728003126.1425028-13-anitha.chrisanthus@intel.com/
>=20
> This patch has dependencies on the previous patches in this series, and w=
e are
> waiting for reviews on those before this can be checked in.
>=20
> Thanks,
> Anitha
>=20
> > -----Original Message-----
> > From: Kees Cook <keescook@chromium.org>
> > Sent: Wednesday, August 25, 2021 11:18 AM
> > To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> > Cc: Kees Cook <keescook@chromium.org>; Dea, Edmund J
> > <edmund.j.dea@intel.com>; David Airlie <airlied@linux.ie>; Daniel Vette=
r
> > <daniel@ffwll.ch>; dri-devel@lists.freedesktop.org; Sam Ravnborg
> > <sam@ravnborg.org>; linux-kernel@vger.kernel.org; linux-
> > hardening@vger.kernel.org
> > Subject: [PATCH] drm/kmb: Avoid warnings on impossible plane_id
> >
> > KMB_MAX_PLANES is defined as 1, yet kmb_plane_atomic_disable() had
> code
> > for writing beyond 1. It is gated by a WARN_ON() that would skip it,
> > though, but under some compiler versions, poor Dead Code Elimination
> > wasn't optimizing away the unused switch cases, leading to array bounds
> > warnings when building with -Warray-bounds:
> >
> > drivers/gpu/drm/kmb/kmb_plane.c:135:20: warning: array subscript 3 is
> > above array bounds of 'struct layer_status[1]' [-Warray-bounds]
> > drivers/gpu/drm/kmb/kmb_plane.c:132:20: warning: array subscript 2 is
> > above array bounds of 'struct layer_status[1]' [-Warray-bounds]
> > drivers/gpu/drm/kmb/kmb_plane.c:129:20: warning: array subscript 1 is
> > above array bounds of 'struct layer_status[1]' [-Warray-bounds]
> >
> > Instead, just remove the switch statement entirely and adjust the index
> > type to match the struct "id" member.
> >
> > Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> > Cc: Edmund Dea <edmund.j.dea@intel.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: dri-devel@lists.freedesktop.org
> > Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  drivers/gpu/drm/kmb/kmb_plane.c | 18 ++----------------
> >  1 file changed, 2 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/kmb/kmb_plane.c
> > b/drivers/gpu/drm/kmb/kmb_plane.c
> > index ecee6782612d..3d46e756f2fe 100644
> > --- a/drivers/gpu/drm/kmb/kmb_plane.c
> > +++ b/drivers/gpu/drm/kmb/kmb_plane.c
> > @@ -113,7 +113,7 @@ static void kmb_plane_atomic_disable(struct
> > drm_plane *plane,
> >  				     struct drm_atomic_state *state)
> >  {
> >  	struct kmb_plane *kmb_plane =3D to_kmb_plane(plane);
> > -	int plane_id =3D kmb_plane->id;
> > +	unsigned char plane_id =3D kmb_plane->id;
> >  	struct kmb_drm_private *kmb;
> >
> >  	kmb =3D to_kmb(plane->dev);
> > @@ -121,21 +121,7 @@ static void kmb_plane_atomic_disable(struct
> > drm_plane *plane,
> >  	if (WARN_ON(plane_id >=3D KMB_MAX_PLANES))
> >  		return;
> >
> > -	switch (plane_id) {
> > -	case LAYER_0:
> > -		kmb->plane_status[plane_id].ctrl =3D LCD_CTRL_VL1_ENABLE;
> > -		break;
> > -	case LAYER_1:
> > -		kmb->plane_status[plane_id].ctrl =3D LCD_CTRL_VL2_ENABLE;
> > -		break;
> > -	case LAYER_2:
> > -		kmb->plane_status[plane_id].ctrl =3D LCD_CTRL_GL1_ENABLE;
> > -		break;
> > -	case LAYER_3:
> > -		kmb->plane_status[plane_id].ctrl =3D LCD_CTRL_GL2_ENABLE;
> > -		break;
> > -	}
> > -
> > +	kmb->plane_status[plane_id].ctrl =3D LCD_CTRL_VL1_ENABLE;
> >  	kmb->plane_status[plane_id].disable =3D true;
> >  }
> >
> > --
> > 2.30.2

