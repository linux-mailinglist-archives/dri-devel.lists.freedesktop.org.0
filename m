Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4961249EE23
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 23:34:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B4A10E412;
	Thu, 27 Jan 2022 22:34:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3735010E412
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 22:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643322871; x=1674858871;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YIITLw8Y5HSQHJc+YtO2989KxDRsQoBqo0Lvb+Na5DU=;
 b=OumA0oEWC5Z2fYg9MwS0Q2e/CDxzJxjUyAU0Uv2KCYH0NNCPGTKVg99Y
 MowlRBmyig6LbFkVPFn3p+Bz20+cPZEPlp9tZ5+/bfJaSPckE+MZ4b8ul
 AIY2MJVhBDXrCeGJTErmRak4xWYKO9qkuGbqGjrqfFHVeZ2QG/8AAs9B6
 r4rvar4jKjV17PtkK+0JRKaNKl4L7cIyPpsiG4GBY0f7s1Lh662N29PZo
 MH405Hfkb/wAVWLoAEQgxYX2XnagSpK3ONvCF7S8NRUazNfHrjNCstFY8
 4XfBUwNRIlcGg27gKDPlQIgNXkeA15UMAQYUn9ot2eFs82HuGdnGxQn7Z w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="230562650"
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; d="scan'208";a="230562650"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 14:34:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; d="scan'208";a="769900370"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga005.fm.intel.com with ESMTP; 27 Jan 2022 14:34:30 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 27 Jan 2022 14:34:30 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 27 Jan 2022 14:34:30 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 27 Jan 2022 14:34:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpJkqXGK7qYmfRYO1pm3SrQGhMRgjJi9DmB9jpomsv7dvGzrHw+zuoTSmQGfpEB5jjWGkpo/47S6U7zL4wDkE4jamm5jlbmHJyxzlTEzWsN9rPkQAmrE0lvmt+sHoLxTEKjb6475wdCguOEdkDlCxDz9w8ztIYsrlN2K5eOhlbykUPZe7fi6wefA6H9C53Ro24itl0sAVoK0GgFQsiSY2J1tq3AA6j+h0XH4pyqcv875+R89IWu/FZ5+x5Zj6eCYub0BL8ghFInNKIhTj31VY5Tt7+COqR3NaWv4YYjq6GP/4UFFlpCUlBD8Z3XivgvbwOKiwe2GHlNQXJPOYusSTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVjoljeGe+Xm1p4vvM74Hp9LxBhhCbqsWoJ5IpCEVA8=;
 b=UU74fG6nqW5Se2uqQVBBGK5O7sWLYYn4hSMVq5vxPapCt7KdbxFXVt7pXZ1LNUSfqMrwebMhHYOh9RGU+FS5/7qiYI8mMO7hzmBpNHPme8erdUSP7DsNAdW8Omh16TYgdWidTbqzJVdGpthjWnofPfjVvW301lw4nKBPuz0Zdn9jOGuMW9G4bV1ZZajDzr1qf7PVJ402/fMz6fR8L3DKtIyfLYTxU6myvymS8NjkZjRRYTOUOdWXT3YVlVbcOWzRPxYc0qi4dSiTPLWgIYQTj30cGKI063MiGgLiXYPSz3rURiLWHb520uLKxUOddjaIsxqebfgJK6Tz63s/n7fzDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by DM6PR11MB3162.namprd11.prod.outlook.com (2603:10b6:5:55::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 22:34:27 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::4c55:6e72:b6c6:fc9d]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::4c55:6e72:b6c6:fc9d%4]) with mapi id 15.20.4930.018; Thu, 27 Jan 2022
 22:34:27 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Kees Cook <keescook@chromium.org>
Subject: RE: [PATCH] drm/kmb: Fix for build errors with Warray-bounds
Thread-Topic: [PATCH] drm/kmb: Fix for build errors with Warray-bounds
Thread-Index: AQHYE7Yc3Pr76tDptEOmJ7KSdS2Rkqx3XhIAgAAWKDA=
Date: Thu, 27 Jan 2022 22:34:27 +0000
Message-ID: <BY5PR11MB4182C3539E63BFA2D95F183B8C219@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <20220127194227.2213608-1-anitha.chrisanthus@intel.com>
 <202201271312.85B63F9@keescook>
In-Reply-To: <202201271312.85B63F9@keescook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe6ef747-d3cf-4020-0b96-08d9e1e52da1
x-ms-traffictypediagnostic: DM6PR11MB3162:EE_
x-microsoft-antispam-prvs: <DM6PR11MB31623FA0AD15B8DF9841929B8C219@DM6PR11MB3162.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EWtLgsKsqA35onbd+EpU+tBYGJkkmYIh29ht/hgnM7Ey4a9kKTY9vLnpfP2Sx1VosaqJzWXPM0lqZ1OF645hSptjiLS6ME2OwTgGDDFkcr4aP1fupKaAGkvpAERc+7qgnp+e7JagIPtCvC6y79ScWxwHUaIVCjh3Xvo4Q//0jFmcwEZNMGSMU0oxoKsEU2D8woL0wPbP2QIbFepsZtoXXWvLq1u5gWJfK1b+F9oa2UapcdrWBNJPlU56hHpnI8AJodtcNiFWFEdcJ2jlOiK3cPVvDkhYXMDEQRmA1vwLAiSAY2DZqrKoAuLbgr5zzYaCNd+vb0NFAvdEWeUs5yT4ma3w/gtwwBHek+5A+9msnXG1DZeL2zprvqtEGARmNGBpgWn9FbS4kbvhuy/W+q2hD+UxCIXs4XfVsCJYBHnkp+muvQa0KiGnxlFyTxU6OWGLhxqO69OVFSUah5+vfvnHnj1nibz+IaeLYKUObWfed/3eKqZTySkHc/plYXssoB1JGKHwEj4+SuH499TdCnQytxnaBVai4sLiNZHmwBQmHGzEawgWVCwnZfTMBViPO4uZrATtquZFAbOPrXnSeJhmYzSIoa/K4VR+gRqac63K5n/cuKpmeg4fXnZTnS5gOyLG5yNCXYdKpo2Z69x2/CNMhbanQB8KJIajdEsZHCBjasj2k91Fp47TrD3I1j3cQHFI49KfaROwLgL8qG9ascSFKA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(86362001)(53546011)(9686003)(6506007)(508600001)(38070700005)(7696005)(316002)(54906003)(6916009)(33656002)(5660300002)(71200400001)(64756008)(8936002)(66946007)(4326008)(26005)(8676002)(76116006)(82960400001)(122000001)(52536014)(55016003)(83380400001)(186003)(66556008)(66476007)(66446008)(38100700002)(20210929001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?c0CRG5jwgLdPJ1nfvn43h71vBcgSzC3xrMjoF0GYoa7Pj8/Kethq6S7PuBcU?=
 =?us-ascii?Q?YCuTWRAlVNeLEo7YFBaG6grvcO160imJxI0hI1wsWKOhC/eU0VIQWsVC7+2m?=
 =?us-ascii?Q?BewuJ5t18LE6wO+PE8GuTvqi4JpAF1IHuwYPdGYihoYEGjfwBwYUrMbBg6Nb?=
 =?us-ascii?Q?YDxj3rxRtzGMJCinnoOI29rJ5apfnzqQDsf/KnAx5AGuCbn17PeRKXFG7yBv?=
 =?us-ascii?Q?nT3wXVJdr2q/xQtDPqWnVKsHh2mZNxJ04Yo3SPZ2SoEkIGeqAROhf92Xkr+v?=
 =?us-ascii?Q?qzmlO3Eb7u9L98AipiXYZLBzvMt7LKbJgi0tO2AH5485AhpdoWsNlEck4gRK?=
 =?us-ascii?Q?ONcmlqlIm67Jg7oaTwTePU9iwxsPHaPeHVDLFaN3dzbnx7C7mNsJWBvCaLnJ?=
 =?us-ascii?Q?04v0gSuYPr1vZ+WohcYjPOKVBT6Ajbg6Ye+0Bl1hRPDlWYsxD1MtrRDFSPQJ?=
 =?us-ascii?Q?nlhQGjZM46NSXFs8OGouUednVyWCQeLXUN4+rWMtBDR6Yz82weF2oWBHqpZH?=
 =?us-ascii?Q?M5qRl6YpRuGb3K4IlpV9WNcQSMgsvxWDlartzhdunCIxxEoVPDQ5EyjWPprQ?=
 =?us-ascii?Q?K3QOKTNYxvolGghT3BcVVHqLG4Z0VK9xD3omRRdFwt9MCTMfdzLYneQD5v3e?=
 =?us-ascii?Q?2pxAmWXp5o4JsmtrVyo8OWeEpkLx0g2IyZrp74q0PxU83Dgg0nEKtokUONvR?=
 =?us-ascii?Q?sI6Ge6FKEm4Ko+OLPoWkpoDhs/v79EXzBds2LD+7gOGmxUZxCbcqhrh6YyWw?=
 =?us-ascii?Q?Tq3Ch28pvq71kyWzEzdmeoykr8xD0/zf0q0iIh/ZLANPmzapsoQUZA451K4S?=
 =?us-ascii?Q?1JOqZtkZTHFgUHO+59nP4bvxuW4REhRJSLYAAdE3I3VTp01rlAX+j1aqzIAD?=
 =?us-ascii?Q?5kG3ozJUvwl02evVvjqi9TPuDmLxy3W6Ixo7ny4i9CIGW9sYZM3LpYSKeqam?=
 =?us-ascii?Q?fR4oGFtmX6iBLQUo6HxLYMnPPQFEIr+6Lxs6kUtWnpJSmRuzRvbtLiIoIG/E?=
 =?us-ascii?Q?nEVTm9mlarzk0FV0fy9/kVxPJBder2RLOdV/NwTCamPN1ThXzg2S/fbqC0DH?=
 =?us-ascii?Q?yjxwyXqex/MyH90mfd9VBCs8UHt2UGaxx0dIfnfxAFQQi2NinMeEjaByG9ec?=
 =?us-ascii?Q?jrtc0BZRjcCaVoVTAuqQvJNaM5Mz9t6qsHUhOFjbBe5mvx+e4UxoaZfD+JhT?=
 =?us-ascii?Q?svIDF0PG8Xql/jWMmylJvX9luIlV80G/bNaa0fHPnqBApLGSW80wR+2GNd5z?=
 =?us-ascii?Q?7qos9ePBUJo5HuLBarp6Tpmxl/cnwAGseRZJnGXadrM55Ke/QKzfp7nwCluV?=
 =?us-ascii?Q?aQ86ExIJ5taq+SIUY43qZm+y3pF4k2eoqgoLSE/JdPumU17pZ6xNYQG1yQ9H?=
 =?us-ascii?Q?lt5xerEFErRgDRrJAIC6A4zg9IlOfUxKmwU6fcfGh85tu8LAJpSS0yXUJwBH?=
 =?us-ascii?Q?xNnjDKubMVbs61WZoGDz1G6PnZXz/Ta+zmxqQWoybh6WkytlDR+IMTHnAgE5?=
 =?us-ascii?Q?u2aQIH1NOuvoWGppsqWGACVJ2Hf6w9d+qTG3m2YB7RXRrwld68ZjD0bwg84+?=
 =?us-ascii?Q?lvqABaZU+vBf9Lo7s0GtHZqzs5OmMCPU8C+7EIzwqmf9fs5HgrntDea6AB8P?=
 =?us-ascii?Q?ep6Fo+2+tQ5sf7aIoR6l4RIItY9L01PTGDlPEQOiCYO6cumDIGDnrORes44h?=
 =?us-ascii?Q?+8XwLg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe6ef747-d3cf-4020-0b96-08d9e1e52da1
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2022 22:34:27.8144 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yf851rktC9fBdVr2bT7mbPAZPX+Gv4Pd1bDMr9Fjo0LZB8nHKl+DMz2gqZACTsNb0UN8+eBF3cdZqIjpQxxzGgALi62OjkVrH1MWxE+kCF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3162
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
Cc: "sam@ravnborg.org" <sam@ravnborg.org>, "Dea,
 Edmund J" <edmund.j.dea@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks. Fixed line wrapping and change is pushed to drm-misc-fixes.

> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Ke=
es
> Cook
> Sent: Thursday, January 27, 2022 1:14 PM
> To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> Cc: Dea, Edmund J <edmund.j.dea@intel.com>; sam@ravnborg.org; dri-
> devel@lists.freedesktop.org; sfr@canb.auug.org.au
> Subject: Re: [PATCH] drm/kmb: Fix for build errors with Warray-bounds
>=20
> On Thu, Jan 27, 2022 at 11:42:27AM -0800, Anitha Chrisanthus wrote:
> > This fixes the following build error
> >
> > drivers/gpu/drm/kmb/kmb_plane.c: In function 'kmb_plane_atomic_disable'=
:
> > drivers/gpu/drm/kmb/kmb_plane.c:165:34: error: array subscript 3 is
> > above array bounds of 'struct layer_status[2]' [-Werror=3Darray-bounds]
> >   165 |                 kmb->plane_status[plane_id].ctrl =3D
> >   LCD_CTRL_GL2_ENABLE;
> >   |                 ~~~~~~~~~~~~~~~~~^~~~~~~~~~
> >   In file included from drivers/gpu/drm/kmb/kmb_plane.c:17:
> >   drivers/gpu/drm/kmb/kmb_drv.h:61:41: note: while referencing
> >   'plane_status'
> >   61 |         struct layer_status
> >   plane_status[KMB_MAX_PLANES];
>=20
> This would be better without the line wrapping (to match the actual
> output), but otherwise:
>=20
> Reviewed-by: Kees Cook <keescook@chromium.org>
>=20
> >   |                                         ^~~~~~~~~~~~
> >   drivers/gpu/drm/kmb/kmb_plane.c:162:34: error: array
> >   subscript 2 is above array bounds of 'struct
> >   layer_status[2]' [-Werror=3Darray-bounds]
> >   162 |
> >   kmb->plane_status[plane_id].ctrl =3D
> >   LCD_CTRL_GL1_ENABLE;
> >   |                 ~~~~~~~~~~~~~~~~~^~~~~~~~~~
> >   In file included from
> >   drivers/gpu/drm/kmb/kmb_plane.c:17:
> >   drivers/gpu/drm/kmb/kmb_drv.h:61:41: note:
> >   while referencing 'plane_status'
> >   61 |         struct layer_status
> >   plane_status[KMB_MAX_PLANES];
> >   |
> >   ^~~~~~~~~~~~
> >
> > Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
> > Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> > ---
> >  drivers/gpu/drm/kmb/kmb_plane.c | 6 ------
> >  1 file changed, 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/kmb/kmb_plane.c
> b/drivers/gpu/drm/kmb/kmb_plane.c
> > index 00404ba4126d..2735b8eb3537 100644
> > --- a/drivers/gpu/drm/kmb/kmb_plane.c
> > +++ b/drivers/gpu/drm/kmb/kmb_plane.c
> > @@ -158,12 +158,6 @@ static void kmb_plane_atomic_disable(struct
> drm_plane *plane,
> >  	case LAYER_1:
> >  		kmb->plane_status[plane_id].ctrl =3D LCD_CTRL_VL2_ENABLE;
> >  		break;
> > -	case LAYER_2:
> > -		kmb->plane_status[plane_id].ctrl =3D LCD_CTRL_GL1_ENABLE;
> > -		break;
> > -	case LAYER_3:
> > -		kmb->plane_status[plane_id].ctrl =3D LCD_CTRL_GL2_ENABLE;
> > -		break;
> >  	}
> >
> >  	kmb->plane_status[plane_id].disable =3D true;
> > --
> > 2.25.1
> >
>=20
> --
> Kees Cook
