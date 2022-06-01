Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4655053A0EB
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 11:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0E210EA8D;
	Wed,  1 Jun 2022 09:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B5710EA8D
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 09:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654076566; x=1685612566;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:reply-to:content-transfer-encoding: mime-version;
 bh=8YaIvjlkPbEp4R03Md8rEvPNoiJDsmN6Q4lcYrAKLAI=;
 b=U632bUitPkdieFfP0hQHTm4sDUDXMXjoty2YXAY2l7TVz/fq1WqlDaIy
 w00Zx60ashQ+uljbEWm5m7lpRy11VtS5SSWWGqmQ2Js61Wmepl+KRLMrs
 LVMM/ZR/01TCZkRwb/eB3PsM7urLSkahP8p189FVFSozoeVMccgcvazXC
 ww457HcX8jFg8fp7E72MGqazKh1AAp+5dQXe/uFzz/Xg8/AVSAoFdKIsI
 /rtSgmHppJMEcdKv02kX5YRO+5JNbZUoiuPgsdS15Wk1Mt0IiEQgCyvkV
 63vQ8J2248dH3ZYxeP/5tzzT75NTVGjvPju/IeSJ4ko+ESCk3V2NxT7zx w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="275542131"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="275542131"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 02:42:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="645419338"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga004.fm.intel.com with ESMTP; 01 Jun 2022 02:42:45 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 1 Jun 2022 02:42:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 1 Jun 2022 02:42:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 1 Jun 2022 02:42:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I47Yj/aAkHFQYCoIcnA0MJRWw7SmtbQTystlj6fZsTFVi2JMEIZZSrTG+jJ1onWgxYgxYaTLZ7GDTQgcm3l7W//ATq2D5ytjuBV5g6GFuLQsBrHCtJMv2uXv2tyiW5CMjIU4cRX2saVq1vq0q8/p7arn29QKi0ZZq/2/dhMTbNKRG7CyvXmN93W3FR5ck0id8w8hd4YOHTZpWENeQK6EbbFyoorJHH6S/lqJ+KGEcCOnl1q15sPA8tD3iUWLa0I5BaFA1/PhOwXx0FqbQBha8zkL1s8qLZAMGFUfkOjQgj1s2pyFOfGNKNSrUe+KGjS73S8UU/gzn6u9KNNc/dkJpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhfvs9wH0Zo7upVYPCR5yBmaGWu2dmpRAcEk0tmAmr8=;
 b=bjzrMmC9BzYfmk4jsODxXdJxN/EIQAeOhyFb2N8h4uiXNtMicMnGdamONFr7tUwt3mHIwENmHcRHPN2RqUxQi9AZUe5MtSveOFNpCGf6MitHH9LLYVlGhA5dTfl3fkryQU5uS7waPhJ41Sgww6H93r87qd+g9tEmYMRlQLIqeIx0VA61tDXvoh4PACw3EmRIAo5z+f2QCKC1MyAB9M/Ycb7HHNIkO/klnlkfqkpHQYzvo82Y7u+1y+U2RpcThdi97Bvq7cpaEFG7Z5nhwh7QAY9mN+5Xac4xWwGkxRe62F+I8+3jZ0kjdcyqzTjcSD/l+PYZxDpkpu3x/Mvq2XDj7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5894.namprd11.prod.outlook.com (2603:10b6:a03:42a::19)
 by BN6PR11MB1492.namprd11.prod.outlook.com (2603:10b6:405:b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 1 Jun
 2022 09:42:42 +0000
Received: from SJ0PR11MB5894.namprd11.prod.outlook.com
 ([fe80::9151:e836:1a4c:a04b]) by SJ0PR11MB5894.namprd11.prod.outlook.com
 ([fe80::9151:e836:1a4c:a04b%7]) with mapi id 15.20.5314.012; Wed, 1 Jun 2022
 09:42:42 +0000
From: "Tseng, William" <william.tseng@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/edid: ignore the CEA modes not defined in CEA-861-D
Thread-Topic: [PATCH] drm/edid: ignore the CEA modes not defined in CEA-861-D
Thread-Index: AQHYdNoDFbj7+FwOkEGNuWjZxEpXuK040FOAgAF4+iA=
Date: Wed, 1 Jun 2022 09:42:42 +0000
Message-ID: <SJ0PR11MB5894305F454B077333083BBAF1DF9@SJ0PR11MB5894.namprd11.prod.outlook.com>
References: <20220531103421.11363-1-william.tseng@intel.com>
 <87y1yiq8ce.fsf@intel.com>
In-Reply-To: <87y1yiq8ce.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 105bf546-48f8-4026-cdbe-08da43b312d8
x-ms-traffictypediagnostic: BN6PR11MB1492:EE_
x-microsoft-antispam-prvs: <BN6PR11MB1492A596173E1A0ACC662900F1DF9@BN6PR11MB1492.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xoSeYcPiOjK82jG6AsRx12kjj/b+MSF1ME9UriqQFsfU4eUA9+RNuslr90Npx9gGcXK3LD7sQFeToY7OYrk/g8FITlfYWiC6dtR+/VKfoZJ3DQ0Ii39+jxhREEABb4AJW+OK50WRgGf+r2nAvMvNdMKArKIzwoK9498yaVPwjCZsqisUbogpZWaUYhyFViF62CqwpvbiK+MdVnmnEHzMenN8TpO6hopKkitTSStEZbQd9YIeCy8TvVBNBh1vv7aAjTzt6UnFmefu96x/gNV0wJYb3sXka97RIwyZRevqmpYZinBFchKe4qJ2pSEPCmBkd7rdnpq81S5UvEmV+l3zz3sk9GZs9im49EiaEuWtU3jdIuhxISKHweyGXw/6HC6SSsu15o5lyIltKlCSYzjxqxNjxPsz0Tmx5TET0bhXIiDROCCIjQVR4Vq5GzJfYPOOyuEGb/aYYje9sFM9uDzg8yVMjwFbz1i3M8fNhf8T5bs6YCUUPCbHT0yK/WrXbT/Aq/PDmqIwQ8j8jsNQaMMcl8jAyjHHShVnWnfRou4juQvEAlJQCSWuqY8iTcMEi/ARcThSL9sMFSIuRltt7t3IGnM0d3A22QICkfeMCOylp8cmXQhj2WRd342ff4rYmbBKaO2ABHzECVr1ZzoZALhsaV+bet18zoUsePuGLTeY5/jIdXDgZ8uCe9o6Ue3gmrlO6Q0mA9nvO5JUTtY/g8sWlQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(5660300002)(7696005)(86362001)(6506007)(53546011)(2906002)(71200400001)(54906003)(110136005)(38100700002)(38070700005)(316002)(52536014)(8936002)(4326008)(8796002)(8676002)(76116006)(66946007)(66556008)(82960400001)(64756008)(66446008)(66476007)(122000001)(66574015)(9686003)(26005)(33656002)(186003)(55016003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?sIM+RorZ1AeBRXvuAsv49XQTFlyjrEfNzeZL2pLW5/N6B6iMBFD+ZFORbA?=
 =?iso-8859-1?Q?3482fL0x36OwUdyL2jgVLEiBzn6yPpZbRi3rs2YKvAYGjea4yrHNPLRtog?=
 =?iso-8859-1?Q?t+whHinoyEZN8UnRhu6QyB0tj3Ax31rL/mSn0ROt8yh9fR/80TEYQnLyjk?=
 =?iso-8859-1?Q?E5qtl/DKIMpSTQDnOv7YHmRDcXXUYogoQXVoC6803fNT4R5gp/B4a0FWnc?=
 =?iso-8859-1?Q?QKw49gVfGxReLbK31whD7074l2EuhqT1fIoJLDst1k7gNBG2/lUoC2jrc/?=
 =?iso-8859-1?Q?rJBDuQqnI8DGt31qOgkHWcjMZldgRl9lstppUUEadwi5I2onsA3rnpx7yR?=
 =?iso-8859-1?Q?gzSUAV5LuACq6SYeUzKwohzVKdt2FO8p2zqSaWRTwvBBJiyf9XIbS3hqqG?=
 =?iso-8859-1?Q?K5jvgyAulDY1DeNspvHeHdy4vv8/jviEB4W1k2DI0df7sAWV2CCchdT5BU?=
 =?iso-8859-1?Q?QgBk0cXWyQdM0euxMCcWNnf147hBxYEVTDoGtaiUhL7oNu77ZeDcOuRKkE?=
 =?iso-8859-1?Q?EdXQSaYJsWoWitiqhvzdB8D0E9WxRDwKmydmPy9W7mmCoLKHtnis0te40A?=
 =?iso-8859-1?Q?aIc7P8KUUDkLQCOoJPmlAugZZmXWc1aXk43vfEAHAZHYJMXh3kLWSxG22/?=
 =?iso-8859-1?Q?gqT5L9kklYoywkO8ZXjDs7yoh914cX55R6Wy90Qm8//jPG6lYdyix/YDz1?=
 =?iso-8859-1?Q?5GxQZPYqFQ5b6Ni5ihyuU/fLPFtbHiIdLMYyPTKlB96pdXgwHoWeLzIjQf?=
 =?iso-8859-1?Q?1M/zUFkBsj/4/Sr4piJAHK2eF58g8uhO4SEYStMI1gfyB3LN96PJB+DLlV?=
 =?iso-8859-1?Q?1LolXdoyvf+2YclF3puEhwULQqwE9txxFCEs4NEuMJ/AOI90YEz3awU3JY?=
 =?iso-8859-1?Q?6v8tGsGralN+qJ7TzQaRlZT/P8GlDuMeBld0k39wMfDye/AZyXHEWalUVA?=
 =?iso-8859-1?Q?DhwVYY7KTQBZMbJn51iRHYhoQ9cEJ+SWN26AtrVp/VgJygpTHJsq97RjL9?=
 =?iso-8859-1?Q?xbYWwNQnJ7daxT0ZnqK3pK5DMwPYogZLHIB0aqzkULsdaGlFcOzPN+JS2z?=
 =?iso-8859-1?Q?h5VoDXpf5hSHyVWS1dDyG2yAJWwuktovFcGO2BE0xXja8Inb/ZVVqHGwwy?=
 =?iso-8859-1?Q?nCnxX1NWbXOd4s1z26+1k6m1nDzczcf3IwrqI2jClycr0PBMw0daBRnFXM?=
 =?iso-8859-1?Q?CaD24ck4ehnEKLupwY+udk0sm5vh1P7Er3od9C+i4cWqu/2sfAfu2xfE8m?=
 =?iso-8859-1?Q?EdlYEO4NxLup0jZ0ryMrxk/sSKhLI8LICQioZCAHJH59Bq6nV4PHkhScB3?=
 =?iso-8859-1?Q?4rmTRlALKdKS52C09ixO3y2DQ2Vskd82A740HhkzQ0eYTsdIY4ika94ZyU?=
 =?iso-8859-1?Q?t6GtWabeFFOUKAdnQLVgOj26Ga6Vyr//aiTfBijARS/vrCVQTENmJN+fSq?=
 =?iso-8859-1?Q?bVfDuq3q3rwdIjy987W1xRXvSd9EFnZc8YyRjcHkabP7hSzBMJyrmD/Uy3?=
 =?iso-8859-1?Q?DU+mCLHu4DRMOLRo1UsVeJd0zuT7pRJTY4l5XvJqeePDsEI6j6YcuZqiBb?=
 =?iso-8859-1?Q?eiWbe3Cs5iYdsr9l0J2jzqqiZi5wuLP+s/ucAXDCapIRKvwsaMUntXsYKZ?=
 =?iso-8859-1?Q?vxEZKJEKlle0eBIBhtHHJCcAoUe8AIpaLKUQayq6TpwgTEAEmNSEr4aPeL?=
 =?iso-8859-1?Q?fVCY+qHRFREvZPwYi0rnL1eObF9Q5mwnvHRgB3H2J0PUy2E/hIbLRcqsnQ?=
 =?iso-8859-1?Q?b0L//ubbfpMLtHT1ho575ojL5VcoJK6yHRozjeybLq8qwu3mFg/ku44i8W?=
 =?iso-8859-1?Q?NKKSg7QLNQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 105bf546-48f8-4026-cdbe-08da43b312d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2022 09:42:42.0595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 335McwvuVWtZoLc3892hJpeRf3LyIrd2iM5l7Drv4kQSRjSTmNDRfqNJzjQIaZreIwNXSbbCy92RhMeKUDTlvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1492
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
Reply-To: "20220531103421.11363-1-william.tseng@intel.com"
 <20220531103421.11363-1-william.tseng@intel.com>
Cc: Wayne Lin <waynelin@amd.com>, "Lee, Shawn C" <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks, Jani.

Maybe it is better to make drm_display_mode_from_vic_index() return a mode =
with valid VIC.
So it ends up with that all probed modes have valid VICs for HDMI 1.4 and 2=
.0 respectively.


Regards
William

-----Original Message-----
From: Jani Nikula <jani.nikula@linux.intel.com>=20
Sent: Tuesday, May 31, 2022 6:56 PM
To: Tseng, William <william.tseng@intel.com>; dri-devel@lists.freedesktop.o=
rg
Cc: Lee, Shawn C <shawn.c.lee@intel.com>; Wayne Lin <waynelin@amd.com>; Tse=
ng, William <william.tseng@intel.com>
Subject: Re: [PATCH] drm/edid: ignore the CEA modes not defined in CEA-861-=
D

On Tue, 31 May 2022, William Tseng <william.tseng@intel.com> wrote:
> This is a workaround for HDMI 1.4 sink which has a CEA mode with=20
> higher vic than what is defined in CEA-861-D.
>
> As an example, a HDMI 1.4 sink has the video format 2560x1080p to be=20
> displayed and the video format is indicated by both SVD (with vic 90=20
> and pictuure aspect ratio 64:27) and DTD.  When connecting to such=20
> sink, source can't output the video format in SVD because an error is=20
> returned by drm_hdmi_avi_infoframe_from_display_mode(), which can't=20
> fill the infoframe with pictuure aspect ratio 64:27 and the vic, which=20
> is originally 90 and is changed to 0 by drm_mode_cea_vic().
>
> To work around it, this patch ignores such CEA modes in do_cea_modes()=20
> so the modes won't be processed in drm_hdmi_avi_infoframe_from_display_mo=
de().
> And only the video format in DTD can be dispalyed.
>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Wayne Lin <waynelin@amd.com>
> Cc: Lee Shawn C <shawn.c.lee@intel.com>
> Signed-off-by: William Tseng <william.tseng@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 39=20
> +++++++++++++++++++++++++-------------
>  1 file changed, 26 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c=20
> index bc43e1b32092..a93f68878bfd 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3982,6 +3982,19 @@ drm_display_mode_from_cea_vic(struct drm_device=20
> *dev,  }  EXPORT_SYMBOL(drm_display_mode_from_cea_vic);
> =20
> +static bool is_hdmi2_sink(const struct drm_connector *connector) {
> +	/*
> +	 * FIXME: sil-sii8620 doesn't have a connector around when
> +	 * we need one, so we have to be prepared for a NULL connector.
> +	 */
> +	if (!connector)
> +		return true;
> +
> +	return connector->display_info.hdmi.scdc.supported ||
> +		connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR420;=20
> +}
> +
>  static int
>  do_cea_modes(struct drm_connector *connector, const u8 *db, u8 len) =20
> { @@ -3993,6 +4006,19 @@ do_cea_modes(struct drm_connector *connector,=20
> const u8 *db, u8 len)
> =20
>  		mode =3D drm_display_mode_from_vic_index(connector, db, len, i);
>  		if (mode) {
> +			u8 vic =3D svd_to_vic(db[i]);
> +
> +			if (!drm_valid_cea_vic(vic))
> +				continue;

drm_display_mode_from_vic_index() returns NULL in this case.

> +
> +			/*
> +			 * HDMI 1.4 VIC range: 1 <=3D VIC <=3D 64 (CEA-861-D) but
> +			 * HDMI 2.0 VIC range: 1 <=3D VIC <=3D 107 (CEA-861-F). So we
> +			 * have to make sure we dont break HDMI 1.4 sinks.
> +			 */
> +			if (!is_hdmi2_sink(connector) && vic > 64)
> +				continue;

I'll need to double check if this is the right thing to do... but I guess t=
he question becomes if this shouldn't be within drm_display_mode_from_vic_i=
ndex().

Duplicating the condition from drm_mode_cea_vic() is probably not a good id=
ea.

The continues in both above branches leak the mode.


BR,
Jani.


> +
>  			/*
>  			 * YCBCR420 capability block contains a bitmap which
>  			 * gives the index of CEA modes from CEA VDB, which @@ -5846,19=20
> +5872,6 @@ void drm_set_preferred_mode(struct drm_connector=20
> *connector,  }  EXPORT_SYMBOL(drm_set_preferred_mode);
> =20
> -static bool is_hdmi2_sink(const struct drm_connector *connector) -{
> -	/*
> -	 * FIXME: sil-sii8620 doesn't have a connector around when
> -	 * we need one, so we have to be prepared for a NULL connector.
> -	 */
> -	if (!connector)
> -		return true;
> -
> -	return connector->display_info.hdmi.scdc.supported ||
> -		connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR420;
> -}
> -
>  static u8 drm_mode_hdmi_vic(const struct drm_connector *connector,
>  			    const struct drm_display_mode *mode)  {

--=20
Jani Nikula, Intel Open Source Graphics Center
