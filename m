Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F65A3F7D4F
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 22:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1DE6E41D;
	Wed, 25 Aug 2021 20:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D13F56E41D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 20:44:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="281325932"
X-IronPort-AV: E=Sophos;i="5.84,351,1620716400"; d="scan'208";a="281325932"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 13:44:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,351,1620716400"; d="scan'208";a="598248616"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 25 Aug 2021 13:44:31 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 25 Aug 2021 13:44:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 25 Aug 2021 13:44:31 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 25 Aug 2021 13:44:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esaw7/7zFxQx144FLbVDq9DZm93Ry+QI1jZpJDdMZmpGAHWud/4iTuqTnlU7xc5K2lfLYPi+EJqXo8obYiGFHS6FBpBgNhbZ8KAbcu729CCk4XoX3jpdxJJtjgAga6DzkRGOlajQvpPlb2cH0WFKWGbBaOeA2BQCCfqJJWt+ey+ucOPdu4giRCqYfbYfhmQHgNkdu+BV03zS7ODBMpG4sTNAfd9DU6i27hNY2AuDL5BeTA4TEK9oZCU6di3ONXljwPCCsW0TKmT4aT1fCCl+subFhJCUPFcfpqduJ0rLCR4W3N+7F+En6cyNO+j2uhmF/av4tgJVt7fvyiY8/RJqAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RWRDZayTwoUOf1oegnotAnf4Epo07WpNUPp662Z/Vr0=;
 b=ZduJV5Vvxf5Y0+RulUhh0KyvlEnz98KnmSEq8iuLrVyZRWKsHFSVAcPq9XoeJwUVVTEBsov3YBK5MYTd9unWCrTkzV9GCA+0GByo3AIJNjdYi60PFwJkD2Mkvs0LYlFLGMJhewoCyOJRbdvXrn30TQYMngf2GmnHQ3Q75rRA8IlnYUGrX3d+8tS+s9LFrvvd/kjeOdeukuJE0ea95gfUChdpixYriCPB6Fx+ATBKrhXGJyw+DYNo9OdD8il+YJslBYKo8D3VKbe9kjH+Ldzjbm9whIo5np2pTtN7hAzxi351753Jg7Yqe52f/+oEp/uti5628Cxg3t9W3mukAGWfJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RWRDZayTwoUOf1oegnotAnf4Epo07WpNUPp662Z/Vr0=;
 b=KKB80vtlulRPVIrJfOv/P2DDC9UKe3Ao1QxnepJoOL0JpdDHz5Tw9I3/UjzT3vJKjwXL+t0VetPnytAHRBj0bNjd5BKKkHCO7BEaG/d1zZ0HyEb0O4lN14ticSBYokXvIGiFyH9Onb1YOvudBpSjtf2ZeSH1xiyfFsmE7thieJk=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BYAPR11MB3671.namprd11.prod.outlook.com (2603:10b6:a03:b3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Wed, 25 Aug
 2021 20:44:29 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::e189:6f03:9fde:2062]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::e189:6f03:9fde:2062%5]) with mapi id 15.20.4436.024; Wed, 25 Aug 2021
 20:44:29 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Kees Cook <keescook@chromium.org>
CC: "Dea, Edmund J" <edmund.j.dea@intel.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Subject: RE: [PATCH] drm/kmb: Avoid warnings on impossible plane_id
Thread-Topic: [PATCH] drm/kmb: Avoid warnings on impossible plane_id
Thread-Index: AQHXmd2XU9vEPkR5QkaaPDsb+p2SVauEr1kw
Date: Wed, 25 Aug 2021 20:44:29 +0000
Message-ID: <BY5PR11MB4182ABD607EB99C1F68777928CC69@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <20210825181807.1138053-1-keescook@chromium.org>
In-Reply-To: <20210825181807.1138053-1-keescook@chromium.org>
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
x-ms-office365-filtering-correlation-id: cd956689-0446-4742-b190-08d9680922ac
x-ms-traffictypediagnostic: BYAPR11MB3671:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB3671F814EEF9050482E677E58CC69@BYAPR11MB3671.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:318;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bpHTWRdNyLdbys3AUdgk+XcwbyQnxeh2izREYgLyYoOl3fXWQqz7BDDNvUnn/RwXrx9Kd8HY+EavCNSZsFprD6t5r87NhxVVM7ISOWgEsGg1BkteePpRLuXhYBUeV772ljC6SBRRlJnwAfm8OLv/xW2TOymAiFVGA4f2T4UbuLXYwXP9LWTozR1Kv2ono3B+p/1xJNW+p4EAi42ACjCPdUWGQTu8IBXtveotPPJ+KBYCtZ7d9rnKH35Lss59mLZwp8mPrwFZz9e1bfM3/gS69HNNcShqsEii9IRrbRdb069lhVxz9Y9MiuZuXr8bzENFxb98h/gZm/F/jM3FZhwwQHLAOgPjMT2xmYsFFNKRZIEdM/+l9kcWvNTWI9zMDWHZHgXudn5CT8HlJNNRjLPCGIMj7ggkZfcJ1fhLi2BIy9Oe389eR7BZzo77+slu9JUHp0ecGX4k1KLoFfayGggO2BSAVj4v7QiXl5J0JJ0R0Vll/1r+LVPZxTNfGQosle6vGvwQtO5tu6oM9mvh1G3b7vvuadEX3DB9U9npuJEN4VRWbEYv8n8m4h95l+R6FccXWJqocPpB5EUOPwp6J3Wg5fgTXMRKg4n/bfVKxai/gq3TvzG9SFJW/mLlGoNR5S/1EkUBe+9X8Co2LNLIib0ye1RIps9nOxLdLWqp42y4b6ms5ny5q91AyI6PKKxmVYH2DQ16a7LqcIOcT/HZ7msIWtUbiL5fs4T8KyoN5K26NAdMWiVQYGD9op7aEgy4d6VzBEGBfkgxaueKBf2rdjAoeI3D5s1Bu3c32Ny4isuT9hE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(38070700005)(33656002)(86362001)(966005)(55016002)(478600001)(53546011)(7696005)(122000001)(2906002)(71200400001)(26005)(9686003)(6916009)(76116006)(316002)(186003)(6506007)(8676002)(38100700002)(5660300002)(66946007)(64756008)(83380400001)(66556008)(8936002)(66446008)(4326008)(66476007)(54906003)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?n7FWS+16sEgNwg94Iy2PHrumP2RcT0d7SzIrZ8iWOA7oGFfK2JgdQH1rfvlE?=
 =?us-ascii?Q?NYYPdomaBgD1hRNn9FoOkq5dsk1WGO3iWeTr7CvhYs8EkD3e54jttxj/FWTo?=
 =?us-ascii?Q?O26hMsB3BF1oUcelExUjXsBN3w5VVCozxxwk6hmtFFoQsI0V7dqgsp6N8uW3?=
 =?us-ascii?Q?qiCCnJemVPXScd9AVmCRPcWMCQ35eKHgN3VdJKIxpPI507W/wNZJ8NghFiqg?=
 =?us-ascii?Q?hCrqyL1Z7Z6hJXOcge2X2U80K3uSo7y5fPC5WaRK6F9hIfVuve3ZdtK6aJes?=
 =?us-ascii?Q?17Vebwv4MI7Q31Vg9JhwFDQMWsBELNe2q1sms5kQqT/CDQ1R6397mnw0kM4D?=
 =?us-ascii?Q?60oYC7YckDFsyidVw1g4OgMptTmJETEry5QRMTYYU3q3brQVCsd6g6mnooOf?=
 =?us-ascii?Q?Z+ZCJQMrPMZhJlrq30y+SxP9G4pOCbzpi8DoQD1r85ISzJM7XWPj8d6NiUiZ?=
 =?us-ascii?Q?6LtPTAaKRZWbGZEjcRPp5gWJDXDVlJf9HQ1i3ljF9iT6dCuj/jBIMV5VSo0K?=
 =?us-ascii?Q?Qie5J7E173iHKfrYsOjIATVsSJp6mVEwIChyblU93GZsBGz/5xFtcWZV6wOX?=
 =?us-ascii?Q?Sz6+09d6+IlV6CXZC8+LMKKO3tU9c8bKyr9TpYujDFWclRY61viM0S9HAycz?=
 =?us-ascii?Q?VFdZttljX4kZ8d4q6MZ3RNgzkeJo+wsXa7AfsU2sX8Jrm1AUbmYCPKheL3k0?=
 =?us-ascii?Q?vw6Q5TCnFOzu/WNWu0ezL7YuVfy+TeNnkxqCc0siPK8VigSWd4pdSXPaT53T?=
 =?us-ascii?Q?noZqd7wf+hsAFbEsFHQg8Bb6u8ORSfaTkmRTQAtI5dk1n41T9wqHySBh2D6h?=
 =?us-ascii?Q?Em2EuFU6pL8xgc5ZjussAXeIwRiRepM92mfABVnCW4dqgiT5cOdZotN/rATr?=
 =?us-ascii?Q?znLJD/F0yOUIWlKBXnF9kYdc3CRDj+QgQ2/UTShqHm240gezgZlPeNOtqHhi?=
 =?us-ascii?Q?ehCIzVYyrHeg8CxpIbCuCmyH8n97v5FZnZVhrTxU/E1LC1wcQF1WpxUL12kh?=
 =?us-ascii?Q?UtReDyxkFwgqO2EP2PyOSJ4jjjXCf/GPfbIO9WNCfCeS00+TP/1MWpD7PLpw?=
 =?us-ascii?Q?fd+iRX6qbkbxOJrUj4ReCy/0v7E8TmUm8UheIoLm9HglwFlgWBM07Ch9E82O?=
 =?us-ascii?Q?yy6ip42fi0bUQ/QCctnoBo9FH1WfI4+Enx8qOyHuVxib6ywX9ghtrnztf1Qs?=
 =?us-ascii?Q?KF8B0+3JmkN3uB5nxcC7Wxd3zftELA8D36lrfZbN2yl2kxxHKjQVfoZLro9E?=
 =?us-ascii?Q?/yfyYWJsdM0BgQURCXwMUmM6h01o1Fq/UlS21OCSD1pxNzWJDp/k5yDlKhAG?=
 =?us-ascii?Q?7Xs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd956689-0446-4742-b190-08d9680922ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2021 20:44:29.4303 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fg26DVBH76XfWhBWo5l1XI9xGLouJCXT0/p+hPXfnVMS+KRRnVmsw4hLjw25nat/52ziOyjIWp4/kSKd4rr9bjXlTgqErCvikCwRt8+/1YM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3671
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
Thanks for your patch.=20
The switch statement is needed for multiple planes which is already approve=
d in this patch series.
https://patchwork.kernel.org/project/dri-devel/patch/20210728003126.1425028=
-13-anitha.chrisanthus@intel.com/

This patch has dependencies on the previous patches in this series, and we =
are waiting for reviews on those before this can be checked in.

Thanks,
Anitha

> -----Original Message-----
> From: Kees Cook <keescook@chromium.org>
> Sent: Wednesday, August 25, 2021 11:18 AM
> To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> Cc: Kees Cook <keescook@chromium.org>; Dea, Edmund J
> <edmund.j.dea@intel.com>; David Airlie <airlied@linux.ie>; Daniel Vetter
> <daniel@ffwll.ch>; dri-devel@lists.freedesktop.org; Sam Ravnborg
> <sam@ravnborg.org>; linux-kernel@vger.kernel.org; linux-
> hardening@vger.kernel.org
> Subject: [PATCH] drm/kmb: Avoid warnings on impossible plane_id
>=20
> KMB_MAX_PLANES is defined as 1, yet kmb_plane_atomic_disable() had code
> for writing beyond 1. It is gated by a WARN_ON() that would skip it,
> though, but under some compiler versions, poor Dead Code Elimination
> wasn't optimizing away the unused switch cases, leading to array bounds
> warnings when building with -Warray-bounds:
>=20
> drivers/gpu/drm/kmb/kmb_plane.c:135:20: warning: array subscript 3 is
> above array bounds of 'struct layer_status[1]' [-Warray-bounds]
> drivers/gpu/drm/kmb/kmb_plane.c:132:20: warning: array subscript 2 is
> above array bounds of 'struct layer_status[1]' [-Warray-bounds]
> drivers/gpu/drm/kmb/kmb_plane.c:129:20: warning: array subscript 1 is
> above array bounds of 'struct layer_status[1]' [-Warray-bounds]
>=20
> Instead, just remove the switch statement entirely and adjust the index
> type to match the struct "id" member.
>=20
> Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> Cc: Edmund Dea <edmund.j.dea@intel.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  drivers/gpu/drm/kmb/kmb_plane.c | 18 ++----------------
>  1 file changed, 2 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/kmb/kmb_plane.c
> b/drivers/gpu/drm/kmb/kmb_plane.c
> index ecee6782612d..3d46e756f2fe 100644
> --- a/drivers/gpu/drm/kmb/kmb_plane.c
> +++ b/drivers/gpu/drm/kmb/kmb_plane.c
> @@ -113,7 +113,7 @@ static void kmb_plane_atomic_disable(struct
> drm_plane *plane,
>  				     struct drm_atomic_state *state)
>  {
>  	struct kmb_plane *kmb_plane =3D to_kmb_plane(plane);
> -	int plane_id =3D kmb_plane->id;
> +	unsigned char plane_id =3D kmb_plane->id;
>  	struct kmb_drm_private *kmb;
>=20
>  	kmb =3D to_kmb(plane->dev);
> @@ -121,21 +121,7 @@ static void kmb_plane_atomic_disable(struct
> drm_plane *plane,
>  	if (WARN_ON(plane_id >=3D KMB_MAX_PLANES))
>  		return;
>=20
> -	switch (plane_id) {
> -	case LAYER_0:
> -		kmb->plane_status[plane_id].ctrl =3D LCD_CTRL_VL1_ENABLE;
> -		break;
> -	case LAYER_1:
> -		kmb->plane_status[plane_id].ctrl =3D LCD_CTRL_VL2_ENABLE;
> -		break;
> -	case LAYER_2:
> -		kmb->plane_status[plane_id].ctrl =3D LCD_CTRL_GL1_ENABLE;
> -		break;
> -	case LAYER_3:
> -		kmb->plane_status[plane_id].ctrl =3D LCD_CTRL_GL2_ENABLE;
> -		break;
> -	}
> -
> +	kmb->plane_status[plane_id].ctrl =3D LCD_CTRL_VL1_ENABLE;
>  	kmb->plane_status[plane_id].disable =3D true;
>  }
>=20
> --
> 2.30.2

