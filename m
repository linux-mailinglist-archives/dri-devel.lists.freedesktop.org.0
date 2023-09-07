Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3957796DD9
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 02:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3909110E029;
	Thu,  7 Sep 2023 00:12:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36D710E029;
 Thu,  7 Sep 2023 00:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694045539; x=1725581539;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ahsxyc1B4V5EON0jKYZrFJvzGJCP3gjg8BT6vsV4kZk=;
 b=RZH8i/UI3zfixRqVEL2qRVRAn9zLIxTkniO5ovzw/wH5ZuUDyqbTq2P+
 t3CFzu23gYY++FiBzBiB/3QNwjT1F17RVVB8cx2vQ6VNJNuHkY2sUZCXB
 9+90zHcVt2VAkHFOr4/EyyBy0yWMS/FV/7Q70YG21wDee/vo8AU3Z1riQ
 Tf/KRY8URDbcQ/wAhByoZfqRrI1CQHw6m6J4WTgmWTuSUDwc2zHbARzJD
 0RbOEIA+MsD5x9SXiv6rGrI4Dxh9X+OpX595fIJVw6ThlipiKhYuOBLmR
 Igf7GAxB197uLwxlGhoidxW8Yind1egSKUO4eNpSEbDcb4RvCdERXfezX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="377133598"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="377133598"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 17:12:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="807291274"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="807291274"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 17:12:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 17:12:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 6 Sep 2023 17:12:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 6 Sep 2023 17:12:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 17:12:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TrVkjsZaebP8j80wi8zllKPuppjSYgur1Ir6zLm7QFAsnaMtMVu+pADT859YybgS541WuQci+gIOaAGE3LiBIDCdehM2NUP4CvOAnUvxhXfIOTrI1tHxJGS24SiSCV3SKpiUHBWfTS2X+rXykoVuAo5ZHirxBKwRqCAt1iXrqFeLYhM0oirO0vE7jXV3gmUlsVnF3bpYkkaaf64YRGmzkf8hsfi8aQ6sFDL8CgcP8Do0T4jHYR6d+ppq5N3Rf5/i7/Gotgb4PnXToa4yQDBimsQlNa65pdHZkv7mx5In1QJ3Tk2QguXpfERCyAJ7nJbCRcQNt7tkA424Y47mRfAGVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LnRAb19NABQWi9dTaR4haoh5J9N84T88fAGkMks5CAY=;
 b=EnWOFcLYgmyQEatk7BvbaaUhvnOHf0DJJk/w0e//eRDLLEBHLVOiHainJRNaATYLHBJSkMnZBOJ4kBWPWCFofjhSUzPR0zuDD4IsecfaIJIhQLhmV0k3Yt9tbMPPhFphPkDmHW3+CiTWREjj9JvtOtcVPxyY72lhrHevSuJMJut/YSH79kpz86zT5MNlghpKqTzsQ7braU4YW8f3ywPvpgFNolB5jIfpDdlSHiBJSHbMgg+GIamQGuovHdMr/7vF4p1w8uhd9ylgik9P+jjzXsZXO9liIsadoQclREGUJYmqwRciamgrsHkCBUrFKo+kW4z7xOkJ4Ra8KkOkPY1d5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by PH7PR11MB8122.namprd11.prod.outlook.com (2603:10b6:510:235::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Thu, 7 Sep
 2023 00:12:15 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::cbe3:986c:d3a9:5724]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::cbe3:986c:d3a9:5724%5]) with mapi id 15.20.6745.030; Thu, 7 Sep 2023
 00:12:15 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v3 2/5] drm/kmb: add trailing newlines to drm_dbg msgs
Thread-Topic: [PATCH v3 2/5] drm/kmb: add trailing newlines to drm_dbg msgs
Thread-Index: AQHZ4PTS6MVvL+xkKEu8IIjQT/7TH7AOfZUQ
Date: Thu, 7 Sep 2023 00:12:15 +0000
Message-ID: <BY5PR11MB41825E994FE2043614F3D1268CEEA@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <20230906190224.583577-1-jim.cromie@gmail.com>
 <20230906190224.583577-3-jim.cromie@gmail.com>
In-Reply-To: <20230906190224.583577-3-jim.cromie@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4182:EE_|PH7PR11MB8122:EE_
x-ms-office365-filtering-correlation-id: 6b633902-2adc-4325-e517-08dbaf371794
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8IyMJEOyB6s8Nk4Zk5VO8rkGHUYhD5YwK+7Mc9nx/aF6WESTrbwA2dg947CRiD+uNwSbEnCA+iA2dlik336nasTAQlvrcrHxxeyqPr4UaYFbTFUDIeaXrous1ZaZHsKQ22eGoD7oFIayPyZipKMBhf+tYLqt7HsV7W7NbRYCaPGBFMwBbdWAO318dtHMjBk2TlZWdtbonGRJuv07pMQwMgKc/sDDLTX1LA/xrf1HptkNYZDHc4fo7Ul7R3AuU+0cDA5W4JZp2+Z6Sta7qmdEoGgcUT5ywaxmmf2YsT1z/A86HJSXQShyeqdhpoGeU8s6SZyW/73SkxNMAtjppkyDVXdZcvBGEdevUN7ycZ9S6aWU1WyiY8gvzZtg2Y2erGd/bvU8Qpm1904tJ1HdgkFtiH3kxXg/Ll6l8VBDbCNuDx7hN7hGtMmZL8G0RjN7Mw0boBQ0cynhwrCN/fV0FQfR5MKk0Q5bu7XNtRYCWf7LmjeMry83qdwfm7EWfwPUd55xIiuMTX7qDpG99FzcsGQsa3oxAq9tbwS59pLSBqPPVhXvHXlenNCHxr2kpb1da+zkNMsWhg4q8PNK+mRB+wHOlrZlIRGcd6QZgkaCtNn1nHNP3lTjrjPyryd3AHkoSCUE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(366004)(376002)(39860400002)(1800799009)(186009)(451199024)(66556008)(66476007)(41300700001)(478600001)(5660300002)(83380400001)(52536014)(110136005)(76116006)(64756008)(66446008)(54906003)(66946007)(71200400001)(316002)(26005)(9686003)(7696005)(6506007)(53546011)(2906002)(4326008)(38100700002)(82960400001)(122000001)(38070700005)(8676002)(86362001)(8936002)(33656002)(7416002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?t9I75GQXI93IfRAJdZ0UEbdTBN6wqOQkvPD5eliQkehsZvgpPgoGZl08dU3u?=
 =?us-ascii?Q?1B7ayWTD8bwfnVnLT6rfVSmWUJ3K8eimgY6AvScr4eNe6cKmiIXW1PZyOpEd?=
 =?us-ascii?Q?zTfAFSmIFjpioHaL7Q628BCcXwYdSez+ch26oEoFbEjhNRkbxqa8VW6Q2Xs2?=
 =?us-ascii?Q?a7NafBZei0qakxf9KwWfB9MSztreUUPLd3dqRScyt6xOxeqPKfNABj3V5p0G?=
 =?us-ascii?Q?5+tMQYyanHNsm12Dqwocly+jIMU07P7lmqGdcqluaaEFvlKct6yUFy6R13Sb?=
 =?us-ascii?Q?Vb5CQhRDUyT44jeb2/2v3iUbOWFAL+jVcJXzufE0263jAucc0elS0iRNAjXU?=
 =?us-ascii?Q?9NarF3gjh3naZDrrB+8EJivbjP7HsQOa//FXxK/SM5Gp3hZjEX04jl7/0M8x?=
 =?us-ascii?Q?qztoEsxO8PfNG8g/UYaTWgZmD5EXhI50Fxdtqvvl0FSjWIJtq+n0hlLRmUbF?=
 =?us-ascii?Q?hfwmfe6A1OnuwMqvr6v3IE6b1dxkadzLuKsvvp5GJEWBJaGrRerrsJ57gDJJ?=
 =?us-ascii?Q?twtgND6pOFIccTJdJT7XjZaymp6k5qxO1zk8QfGE7YmFioRqvQxqRWNAkGte?=
 =?us-ascii?Q?Qh71IwUqe91K9sguBprB+57oGAX8MFRMgy3E2QKNJ0Ht0bLMN0QHt3lH4VpF?=
 =?us-ascii?Q?jred5SfaQBz3cJqaGT1g3cpulP+XqoAAa8Yv7Ddxd3Vce/GszpXl07OuVYAc?=
 =?us-ascii?Q?Eh3IPkJ+I5KuOqllO4WWii53S87e7NgweG8qtvAm15xEh4e94SM8G2MJ3qxT?=
 =?us-ascii?Q?zfAD/VTdhbyLUybvhReAUSa5pN6B4YdhoRHq+aaflfrsDQxgtivD8ZKaCVIO?=
 =?us-ascii?Q?BxU20ISwuuVn75HmVSe/ObpNBgns7nDxPIcZarbnEnNU/KCBMhhd+tb9RCw3?=
 =?us-ascii?Q?AaW84gsz3oeogFV0POZ8TCuLh+mDddzmsoe2Du2JgHIQtvxcx74vRDKuIE4y?=
 =?us-ascii?Q?BzwYZBvLAnnlEi9bUwICVkMooxGg8+G9Hc7PnWKZJduSU880F6Kl04IkCLEj?=
 =?us-ascii?Q?mIduL57p3LmCV8Xbva135TXpKayXSDtIj/tvHefEthGbiwc/tyqf1Wh8lnAn?=
 =?us-ascii?Q?zGVhr4e9mrJ6H3ermHgPSQ5i2GN9kErq8jzmkSLOOLBzEjH42GUjJ1zolEXZ?=
 =?us-ascii?Q?NTiDnNVpAjJzpSH8gLZwvbh28LC7YjhrNnOUz6OefL30eHmGvkA0qYBIkl8a?=
 =?us-ascii?Q?FOQ/n7Xs8ckRjo5ONOU3FaSEX7xUXO8SlWl31vdX0aGMrBmcI0hRRiqkIJON?=
 =?us-ascii?Q?LHZ8KoMEV6yl1v1x1w0i03zW1dv584JHsntlKLWMjUc6VA5Y03HBIEscpq9r?=
 =?us-ascii?Q?s5DhA2FVnB6HtSMhrZKSGL3GYK8So82qxgd+3OFlgQyvsZOtNY5BO0lLh9vG?=
 =?us-ascii?Q?hAKXVCia5sZ4Gc/lgKKkQ4LNyyMgiBCK3MvKMp0fS7VpcGCrlZIhd0jqN102?=
 =?us-ascii?Q?k6VuE4iYB8ytdOP142py/eAcd0QSRW6ZzzwLWYXKS4nYtbjq8e2xPEOuP1FM?=
 =?us-ascii?Q?MjjrjfA7/517buf0SRA++EYM8Si4c1I/qUj/Eakx27ifot6QPMdTtziysB/i?=
 =?us-ascii?Q?N68KSNAHOuw+jDe4vd+bB/eiZOR7RMTiQdNzWZjYKGQZ9dVx5ZyDIBnMwQ3I?=
 =?us-ascii?Q?qA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b633902-2adc-4325-e517-08dbaf371794
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2023 00:12:15.6300 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qmFWsGScE0yiDRke0Mh0LKVCRR1KsEEmMeIOAAFpDhVT5wLfFuIgAz/HEYxLChOjKfbw0IoxpCcFf7Oun84wjCKicLTuOY5cG6QyLNDLxSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8122
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 Edmund Dea <edmund.j.dea@intel.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>

> -----Original Message-----
> From: Jim Cromie <jim.cromie@gmail.com>
> Sent: Wednesday, September 6, 2023 12:02 PM
> To: linux-kernel@vger.kernel.org; dri-devel@lists.freedesktop.org; amd-
> gfx@lists.freedesktop.org; intel-gvt-dev@lists.freedesktop.org; intel-
> gfx@lists.freedesktop.org
> Cc: daniel.vetter@ffwll.ch; daniel@ffwll.ch; Nikula, Jani
> <jani.nikula@intel.com>; ville.syrjala@linux.intel.com;
> seanpaul@chromium.org; robdclark@gmail.com; Jim Cromie
> <jim.cromie@gmail.com>; Chrisanthus, Anitha
> <anitha.chrisanthus@intel.com>; Edmund Dea <edmund.j.dea@intel.com>;
> David Airlie <airlied@gmail.com>
> Subject: [PATCH v3 2/5] drm/kmb: add trailing newlines to drm_dbg msgs
>=20
> By at least strong convention, a print-buffer's trailing newline says
> "message complete, send it".  The exception (no TNL, followed by a call
> to pr_cont) proves the general rule.
>=20
> Most DRM.debug calls already comport with this: 207 DRM_DEV_DEBUG,
> 1288 drm_dbg.  Clean up the remainders, in maintainer sized chunks.
>=20
> No functional changes.
>=20
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
>  drivers/gpu/drm/kmb/kmb_crtc.c  | 10 +++++-----
>  drivers/gpu/drm/kmb/kmb_plane.c |  6 +++---
>  2 files changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/kmb/kmb_crtc.c
> b/drivers/gpu/drm/kmb/kmb_crtc.c
> index 647872f65bff..a58baf25322d 100644
> --- a/drivers/gpu/drm/kmb/kmb_crtc.c
> +++ b/drivers/gpu/drm/kmb/kmb_crtc.c
> @@ -94,7 +94,7 @@ static void kmb_crtc_set_mode(struct drm_crtc *crtc,
>  	vm.hback_porch =3D 0;
>  	vm.hsync_len =3D 28;
>=20
> -	drm_dbg(dev, "%s : %dactive height=3D %d vbp=3D%d vfp=3D%d vsync-w=3D%d
> h-active=3D%d h-bp=3D%d h-fp=3D%d hsync-l=3D%d",
> +	drm_dbg(dev, "%s : %dactive height=3D %d vbp=3D%d vfp=3D%d vsync-w=3D%d
> h-active=3D%d h-bp=3D%d h-fp=3D%d hsync-l=3D%d\n",
>  		__func__, __LINE__,
>  			m->crtc_vdisplay, vm.vback_porch, vm.vfront_porch,
>  			vm.vsync_len, m->crtc_hdisplay, vm.hback_porch,
> @@ -194,24 +194,24 @@ static enum drm_mode_status
>  	int vfp =3D mode->vsync_start - mode->vdisplay;
>=20
>  	if (mode->vdisplay < KMB_CRTC_MAX_HEIGHT) {
> -		drm_dbg(dev, "height =3D %d less than %d",
> +		drm_dbg(dev, "height =3D %d less than %d\n",
>  			mode->vdisplay, KMB_CRTC_MAX_HEIGHT);
>  		return MODE_BAD_VVALUE;
>  	}
>  	if (mode->hdisplay < KMB_CRTC_MAX_WIDTH) {
> -		drm_dbg(dev, "width =3D %d less than %d",
> +		drm_dbg(dev, "width =3D %d less than %d\n",
>  			mode->hdisplay, KMB_CRTC_MAX_WIDTH);
>  		return MODE_BAD_HVALUE;
>  	}
>  	refresh =3D drm_mode_vrefresh(mode);
>  	if (refresh < KMB_MIN_VREFRESH || refresh > KMB_MAX_VREFRESH) {
> -		drm_dbg(dev, "refresh =3D %d less than %d or greater than %d",
> +		drm_dbg(dev, "refresh =3D %d less than %d or greater than
> %d\n",
>  			refresh, KMB_MIN_VREFRESH, KMB_MAX_VREFRESH);
>  		return MODE_BAD;
>  	}
>=20
>  	if (vfp < KMB_CRTC_MIN_VFP) {
> -		drm_dbg(dev, "vfp =3D %d less than %d", vfp,
> KMB_CRTC_MIN_VFP);
> +		drm_dbg(dev, "vfp =3D %d less than %d\n", vfp,
> KMB_CRTC_MIN_VFP);
>  		return MODE_BAD;
>  	}
>=20
> diff --git a/drivers/gpu/drm/kmb/kmb_plane.c
> b/drivers/gpu/drm/kmb/kmb_plane.c
> index 9e0562aa2bcb..308bd1cb50c8 100644
> --- a/drivers/gpu/drm/kmb/kmb_plane.c
> +++ b/drivers/gpu/drm/kmb/kmb_plane.c
> @@ -78,7 +78,7 @@ static unsigned int check_pixel_format(struct drm_plane
> *plane, u32 format)
>  	 * plane configuration is not supported.
>  	 */
>  	if (init_disp_cfg.format && init_disp_cfg.format !=3D format) {
> -		drm_dbg(&kmb->drm, "Cannot change format after initial
> plane configuration");
> +		drm_dbg(&kmb->drm, "Cannot change format after initial
> plane configuration\n");
>  		return -EINVAL;
>  	}
>  	for (i =3D 0; i < plane->format_count; i++) {
> @@ -124,7 +124,7 @@ static int kmb_plane_atomic_check(struct drm_plane
> *plane,
>  	if ((init_disp_cfg.width && init_disp_cfg.height) &&
>  	    (init_disp_cfg.width !=3D fb->width ||
>  	    init_disp_cfg.height !=3D fb->height)) {
> -		drm_dbg(&kmb->drm, "Cannot change plane height or width
> after initial configuration");
> +		drm_dbg(&kmb->drm, "Cannot change plane height or width
> after initial configuration\n");
>  		return -EINVAL;
>  	}
>  	can_position =3D (plane->type =3D=3D DRM_PLANE_TYPE_OVERLAY);
> @@ -375,7 +375,7 @@ static void kmb_plane_atomic_update(struct
> drm_plane *plane,
>  	spin_lock_irq(&kmb->irq_lock);
>  	if (kmb->kmb_under_flow || kmb->kmb_flush_done) {
>  		spin_unlock_irq(&kmb->irq_lock);
> -		drm_dbg(&kmb->drm, "plane_update:underflow!!!!
> returning");
> +		drm_dbg(&kmb->drm, "plane_update:underflow!!!!
> returning\n");
>  		return;
>  	}
>  	spin_unlock_irq(&kmb->irq_lock);
> --
> 2.41.0

