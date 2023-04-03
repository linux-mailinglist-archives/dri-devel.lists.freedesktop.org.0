Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9716D3D86
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 08:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E7210E135;
	Mon,  3 Apr 2023 06:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B75610E135;
 Mon,  3 Apr 2023 06:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680504311; x=1712040311;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5hu0vU2O0RmNyIhWT7DImm/nzmRnKBEOR2r5d8WOs0s=;
 b=n7OkIIjb5vM/UvQ7GaCMEBPAn3b5s2aeBmmI5k79mDsL6MVyvqITuwjJ
 p2WrGtFHrBwIp2e273vnJJQI394WmyOHfIKff+5UpiFiWXVGaWM7xu5Tw
 qH4/PplHsHSTYTfiPHFZm5PpA/nqPDOOx3uvx/uag/sJaP0ku2VDdzizm
 EYOFecOVtW04N61XCLS8A8SQOkTtWTw9Uq7BK56aL53tzbASC7pvOuxTf
 xtQ+K5M9DzmmUSeC2Z4DZ78krQoXpWO8df+WDQBXLQt+TDvg/2OB+ydk/
 gfvuCoycKGjA3Ag+eN24x6F7J5FDUO9X4YtV8oaBPc5nIc/mXJesKf2+5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="369631577"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="369631577"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2023 23:45:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="663105818"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="663105818"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 02 Apr 2023 23:45:09 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 2 Apr 2023 23:45:09 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 2 Apr 2023 23:45:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Sun, 2 Apr 2023 23:45:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Sun, 2 Apr 2023 23:45:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e5G1JpE6ddJSlwE5kL2UYstbGkmNHIPmm6IEEGqOchEB2+q6Gz8101XStRg2POnyNovGuFgamEeSEcAjUjhQo9qs5hplhLYQ44D6MoJQHEJsXCrlPhiAe9m2R4+LmYXalDK9LJAQg4At1PMtQtsv4nxHIWo0XRxCxhoAlL27SNLH3nRiSk3toxxSGPnkdbOfZxj2aL/ke1gzygOqVP5VRAjf6vcMcy3FlTsF0d1Re6Z9j9pBEXadRB/79R0Cjy8N5XK+XyIIgBGWia7GNDxMJE+6uuH8n3VQoEv7VglAdES0jnCsA8stGqNWfurtUHzKzMHQRKXfLwlNsR10JYMD6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbBgpU0MU+AxKi5JkuLqcLbe9C8Izi3lmVZg/H7vIXM=;
 b=Ub/bPkI3B3RggsNJ6xFQpSvV6Zdodtih2NBZMkGZjqoJPns6szHWysW6idTupEOX6N11DWZSa655t7RPLVVSJhX/N7oPDkaFad6TCxKk/vAkKwL3S40p9OLfHkNNb4hlyn5r12ASVJ1BoLVx8U6SO5Twa2SSumzxkX5H67c/9JL7+vVM6nQyNs+4H2rrmsU45EorWGm120vI9hUaNbQ/yRAqqKMCuMf895R/7snch3rYbn67fVPDdV0buGZO+suK26/4QtpUdgWA4vAaPO5MtaLHpguMk/xg8aJzD6QBqBPzLhfCDnDxyxQsnmhslLO4CRuJKlKOqPD2oQVc7VUeUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by SJ2PR11MB7714.namprd11.prod.outlook.com (2603:10b6:a03:4fd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Mon, 3 Apr
 2023 06:45:02 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3541:e31b:6f64:d993]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3541:e31b:6f64:d993%9]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 06:45:01 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Mark Yacoub <markyacoub@chromium.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH v8 06/10] drm/i915/hdcp: Retain hdcp_capable return codes
Thread-Topic: [PATCH v8 06/10] drm/i915/hdcp: Retain hdcp_capable return codes
Thread-Index: AQHZZB32rT2PKcOuxkSyG2n0H7FHKa8ZJd3QgAABChA=
Date: Mon, 3 Apr 2023 06:45:01 +0000
Message-ID: <SN7PR11MB67503B0FD94492D6F2EE01F4E3929@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20230331221213.1691997-1-markyacoub@google.com>
 <20230331221213.1691997-7-markyacoub@google.com>
 <SN7PR11MB67503C1B1FB74267EE7042A6E3929@SN7PR11MB6750.namprd11.prod.outlook.com>
In-Reply-To: <SN7PR11MB67503C1B1FB74267EE7042A6E3929@SN7PR11MB6750.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|SJ2PR11MB7714:EE_
x-ms-office365-filtering-correlation-id: 2e4a04cb-83e9-48bf-2b9f-08db340ef2ef
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SaQ0njlROVTJ9Yr8fiQM93UBUmt/eN0GsLNoz1Js77QeNqkAgwcudbmfzVzMp1URdZwZ+mHJBwgQacoaDzSjqnPCwwnaSOrgOxyIJb8coyf9DnX93lRJOaoWCfzjtElNm06rr685bsVf/+7ilT8AGsl1ACDtB7yI4YCIn8/Zgz3WylpJb+AFmRZLufiRrVto1o2QMFTKXPaXzgNNKMYJIV15pRMIX5cD5ES1QzTq4RaXyymF+6KPNVfLQ/QkoKYIec68Pn9Tzz8ZOPA3cWkPelBlASSFrQu+5PMlEXyDh1yfPE7dWJfc0l/EJM50DzvRASpQpIXGrsMjIH2aoyI2yW2rr3vvReTvY0JEYfM+z92FivLo3vvL6UXDsgF+JLOGAtfmZLWmeYOPJk/fEokE1I3415C7ou2aINP4dzXLt3Lv6IoC2lIrhY3L9mxMnz75fuxVEyw4MjX/nN2qWmWK+eaxv6yfftYD3PpWH13r5Y7gChFEG8Dc8jGmMyodrkcDnZ9K6p/Ez2urr2ynpuc1UttFkFfsTGFUJCfsU7komLByplhMzezQzwmh/Kjz/znezj4X4ghHsHMglDu9rnXuJkbl8UYVJF5KbTNTfw9nzf+jBa8ytk35Swrh7mNIf5D6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(39860400002)(346002)(376002)(396003)(451199021)(316002)(6506007)(122000001)(86362001)(82960400001)(2940100002)(8936002)(5660300002)(52536014)(110136005)(41300700001)(64756008)(66556008)(53546011)(66946007)(76116006)(66476007)(66446008)(4326008)(186003)(26005)(8676002)(54906003)(9686003)(55016003)(38100700002)(33656002)(38070700005)(478600001)(83380400001)(71200400001)(2906002)(7696005)(7416002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pGr27Nel/w6CtJ5kGIo0HeNQS63wqwyCM6p13ga9LzwfzA6QkezbTCnAr0TE?=
 =?us-ascii?Q?ZjZsbKkx/nm9PEm78lNiySnaxoAhSnP8PuoYHjvwWnYq6V6r9k4/kmv5aQ1p?=
 =?us-ascii?Q?UO0jQEMThJBGv8e1LSJLUN9ZPzi7TBXMXC3r62VOLhioDeSROzW+QHXynl91?=
 =?us-ascii?Q?4iEkmSAO038dQYd7LSTdp0uyS4OYy+mFgMzoCUo+3NP/UYR8NqNd0HAESEMh?=
 =?us-ascii?Q?c5cW9P3eoKGuwJIZUh6JfErXnFwzJVaNXicIBaWyUehFPWE4M+YjlEaMm7IB?=
 =?us-ascii?Q?w50RR4xXXV8EiOqb/bJvsauxOQHnr1lLzd/2b8qfHn5vGE8CmJRNQaIHowda?=
 =?us-ascii?Q?Hpz36RATGWXnxdzJ2pM8SxiVw1h4Uqe/8vZZcpv/uthaWxNSXg6jspUlqzfT?=
 =?us-ascii?Q?/ODPklzTmrTcqncQbiZPizIORKdiZczrWYlDohpa6lb04tqF9qxAatir6opD?=
 =?us-ascii?Q?WOWKMhGx4cinGHNbgzjF1CbE67iXi5tiLVt4bbZwUWFGkMGq7fzjWkth+XdO?=
 =?us-ascii?Q?uzoeFiMUzaLbAy0P9sUvAqKNwKVRuT5jvfMBvWv9NfiLiIH7yX8L39/2Njdn?=
 =?us-ascii?Q?L+owRIzPgfxULApBIltpLyXAeraL6YEhPObOOcVDRkr/QOCn4q7UkY1PRznj?=
 =?us-ascii?Q?Pbk+X9VZzja4XPHAKYzZwZXLJNGMuGv6EjLZgIJiJYovYT3VuUDPii0hOATw?=
 =?us-ascii?Q?A9P5FrYemXQ2ZLU5DTk3pSEuf9TWeH7JcGoWKTYzQr3/268gELY1Oz+7p8qi?=
 =?us-ascii?Q?iTIixrQfZWnOcocyqNbhhYddx/a1SyNEQAWS3hic9J2tqgYrObWS9dICmfXx?=
 =?us-ascii?Q?mRyYxhOmAViTpoKa9Yy6x5oIl0u6sZRLSGLn07qDUTNz9eMOUqnTH/rUcCo4?=
 =?us-ascii?Q?4ss0zX+dz2bXtctkAjxUZtGks+TsvsO6FvJH5gSQQ/KSFGDU3tIp5uvKV8AD?=
 =?us-ascii?Q?fLJPXgIYyZl7kLAgP8n4yBR5zAygzDmlTRViDgB8ngK+PTFb0CVeX3UjQSrb?=
 =?us-ascii?Q?WDN/2lL+3zx58bUs139E3GxHL+xt63fYHGHyUU65XQ2ycqZe2ReRB9WqAdOC?=
 =?us-ascii?Q?U7xFihg3Zi13OP5MP1DoI2KNjufyOpPiWypQiYK7nZZrX0+KDA9B5VVnNXde?=
 =?us-ascii?Q?utqk4MkcsgesfEi7XSUBAJv1K0Gu3PimoZ42gXpTiPQnzpt4XreJCf7FujoV?=
 =?us-ascii?Q?hVFDXM2lmwUB4Cyz5rcERUMg9YiipzVSiPAX2FFWQbXHwzDOnwSzGnu38TKR?=
 =?us-ascii?Q?uW7E2baUBc0dYJ0ykZKvZrUgNaBKCoO/3syISt9MmWfB5CUSwbePlYqcb1qY?=
 =?us-ascii?Q?Wi4tkjAvj4Zv24C07ENxOBVwmBDcQuaxx/n5l2YcBHle9Uurlw4rmqmuji/p?=
 =?us-ascii?Q?xpFjFKTlfToEI1HQ+lJ6Ang28ghKKx4VDtAw1aNio8W8rb94VNpuRasmotpw?=
 =?us-ascii?Q?H+B/Oi7KHwEJGHm2fOagPxd8/nAPu6UvFuZemzCCvq6VZeRS3M5f+yH3vY+F?=
 =?us-ascii?Q?8ehZdbd3MJb6XVlyPxrRhVEw5Pyed/pYc1tGxBxnWQIUbItBRbxjY36qr2Jb?=
 =?us-ascii?Q?OcdYkjoBw4LnXQpFtRRrySQNNmRAj0DQ/2r1jVCN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4a04cb-83e9-48bf-2b9f-08db340ef2ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2023 06:45:01.2509 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vncwXlZ6knZX9byGXfupHVKHfq9wv7wP2GVVQJf6vdnF7CTHKs5eLozDXjSuHMVLAM6NkUQ2VqnFMd3bVXRYWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7714
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
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Kandpal, Suraj
> Sent: Monday, April 3, 2023 12:12 PM
> To: Mark Yacoub <markyacoub@chromium.org>; Jani Nikula
> <jani.nikula@linux.intel.com>; Joonas Lahtinen
> <joonas.lahtinen@linux.intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>=
;
> Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>; David Airlie
> <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>
> Cc: seanpaul@chromium.org; dianders@chromium.org; dri-
> devel@lists.freedesktop.org; freedreno@lists.freedesktop.org; intel-
> gfx@lists.freedesktop.org; Nikula, Jani <jani.nikula@intel.com>; linux-
> kernel@vger.kernel.org
> Subject: RE: [PATCH v8 06/10] drm/i915/hdcp: Retain hdcp_capable return
> codes
>=20
>=20
>=20
> > -----Original Message-----
> > From: Mark Yacoub <markyacoub@chromium.org>
> > Sent: Saturday, April 1, 2023 3:42 AM
> > To: Jani Nikula <jani.nikula@linux.intel.com>; Joonas Lahtinen
> > <joonas.lahtinen@linux.intel.com>; Vivi, Rodrigo
> > <rodrigo.vivi@intel.com>; Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com>; David Airlie <airlied@gmail.com>;
> > Daniel Vetter <daniel@ffwll.ch>
> > Cc: seanpaul@chromium.org; Kandpal, Suraj <suraj.kandpal@intel.com>;
> > dianders@chromium.org; dri-devel@lists.freedesktop.org;
> > freedreno@lists.freedesktop.org; intel-gfx@lists.freedesktop.org;
> > Nikula, Jani <jani.nikula@intel.com>; Mark Yacoub
> > <markyacoub@chromium.org>; linux- kernel@vger.kernel.org
> > Subject: [PATCH v8 06/10] drm/i915/hdcp: Retain hdcp_capable return
> > codes
> >
> > From: Sean Paul <seanpaul@chromium.org>
> >
> > The shim functions return error codes, but they are discarded in
> > intel_hdcp.c. This patch plumbs the return codes through so they are
> > properly handled.
> >
> > Acked-by: Jani Nikula <jani.nikula@intel.com>
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> >
> > ---
> > Changes in v2:
> > -None
> > Changes in v3:
> > -None
> > Changes in v4:
> > -None
> > Changes in v5:
> > -None
> > Changes in v6:
> > -Rebased
> > Changes in v7:
> > -None
> > Changes in v8:
> > -None
> >
> >  .../drm/i915/display/intel_display_debugfs.c  |  9 +++-
> >  drivers/gpu/drm/i915/display/intel_hdcp.c     | 51 ++++++++++---------
> >  drivers/gpu/drm/i915/display/intel_hdcp.h     |  4 +-
> >  3 files changed, 37 insertions(+), 27 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> > b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> > index 7bcd90384a46d..a14b86a07e545 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> > @@ -494,6 +494,7 @@ static void intel_panel_info(struct seq_file *m,
> > static void intel_hdcp_info(struct seq_file *m,
> >  			    struct intel_connector *intel_connector)  {
> > +	int ret;
> >  	bool hdcp_cap, hdcp2_cap;
> >
> >  	if (!intel_connector->hdcp.shim) {
> > @@ -501,8 +502,12 @@ static void intel_hdcp_info(struct seq_file *m,
> >  		goto out;
> >  	}
> >
> > -	hdcp_cap =3D intel_hdcp_capable(intel_connector);
> > -	hdcp2_cap =3D intel_hdcp2_capable(intel_connector);
> > +	ret =3D intel_hdcp_capable(intel_connector, &hdcp_cap);
> > +	if (ret)
> > +		hdcp_cap =3D false;
> > +	ret =3D intel_hdcp2_capable(intel_connector, &hdcp2_cap);
> > +	if (ret)
> > +		hdcp2_cap =3D false;
> >
> >  	if (hdcp_cap)
> >  		seq_puts(m, "HDCP1.4 ");
> > diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > index 0a20bc41be55d..61a862ae1f286 100644
> > --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > @@ -177,50 +177,49 @@ int intel_hdcp_read_valid_bksv(struct
> > intel_digital_port *dig_port,  }
> >
> >  /* Is HDCP1.4 capable on Platform and Sink */ -bool
> > intel_hdcp_capable(struct intel_connector *connector)
> > +int intel_hdcp_capable(struct intel_connector *connector, bool
> > +*capable)
> >  {
> >  	struct intel_digital_port *dig_port =3D
> > intel_attached_dig_port(connector);
> >  	const struct intel_hdcp_shim *shim =3D connector->hdcp.shim;
> > -	bool capable =3D false;
> >  	u8 bksv[5];
> >
> > +	*capable =3D false;
> > +
> >  	if (!shim)
> > -		return capable;
> > +		return 0;
> >
> > -	if (shim->hdcp_capable) {
> > -		shim->hdcp_capable(dig_port, &capable);
> > -	} else {
> > -		if (!intel_hdcp_read_valid_bksv(dig_port, shim, bksv))
> > -			capable =3D true;
> > -	}
> > +	if (shim->hdcp_capable)
> > +		return shim->hdcp_capable(dig_port, capable);
> > +
> > +	if (!intel_hdcp_read_valid_bksv(dig_port, shim, bksv))
> > +		*capable =3D true;
> >
> > -	return capable;
> > +	return 0;
> >  }
> >
> >  /* Is HDCP2.2 capable on Platform and Sink */ -bool
> > intel_hdcp2_capable(struct intel_connector *connector)
> > +int intel_hdcp2_capable(struct intel_connector *connector, bool
> > +*capable)
> >  {
> >  	struct intel_digital_port *dig_port =3D
> > intel_attached_dig_port(connector);
> >  	struct drm_i915_private *dev_priv =3D to_i915(connector->base.dev);
> >  	struct intel_hdcp *hdcp =3D &connector->hdcp;
> > -	bool capable =3D false;
> > +
> > +	*capable =3D false;
> >
> >  	/* I915 support for HDCP2.2 */
> >  	if (!hdcp->hdcp2_supported)
> > -		return false;
> > +		return 0;
> >
> >  	/* MEI interface is solid */
> >  	mutex_lock(&dev_priv->display.hdcp.comp_mutex);
> >  	if (!dev_priv->display.hdcp.comp_added ||  !dev_priv-
> > >display.hdcp.master) {
> >  		mutex_unlock(&dev_priv->display.hdcp.comp_mutex);
> > -		return false;
> > +		return 0;
> >  	}
> >  	mutex_unlock(&dev_priv->display.hdcp.comp_mutex);
> >
> >  	/* Sink's capability for HDCP2.2 */
> > -	hdcp->shim->hdcp_2_2_capable(dig_port, &capable);
> > -
> > -	return capable;
> > +	return hdcp->shim->hdcp_2_2_capable(dig_port, capable);
> >  }
> >
> >  static bool intel_hdcp_in_use(struct drm_i915_private *dev_priv, @@ -
> > 2355,6 +2354,7 @@ int intel_hdcp_enable(struct intel_connector
> > *connector,
> >  	struct intel_digital_port *dig_port =3D
> > intel_attached_dig_port(connector);
> >  	struct intel_hdcp *hdcp =3D &connector->hdcp;
> >  	unsigned long check_link_interval =3D DRM_HDCP_CHECK_PERIOD_MS;
> > +	bool capable;
> >  	int ret =3D -EINVAL;
> >
> >  	if (!hdcp->shim)
> > @@ -2373,21 +2373,27 @@ int intel_hdcp_enable(struct intel_connector
> > *connector,
> >  	 * Considering that HDCP2.2 is more secure than HDCP1.4, If the
> > setup
> >  	 * is capable of HDCP2.2, it is preferred to use HDCP2.2.
> >  	 */
> > -	if (intel_hdcp2_capable(connector)) {
> > +	ret =3D intel_hdcp2_capable(connector, &capable);
> > +	if (capable) {
> >  		ret =3D _intel_hdcp2_enable(connector);
> > -		if (!ret)
> > +		if (!ret) {
> >  			check_link_interval =3D
> > DRM_HDCP2_CHECK_PERIOD_MS;
> > +			goto out;
> > +		}
> >  	}
> >
> >  	/*
> >  	 * When HDCP2.2 fails and Content Type is not Type1, HDCP1.4 will
> >  	 * be attempted.
> >  	 */
> > -	if (ret && intel_hdcp_capable(connector) &&
> > -	    hdcp->content_type !=3D DRM_MODE_HDCP_CONTENT_TYPE1) {
> > +	ret =3D intel_hdcp_capable(connector, &capable);
> > +	if (ret)
> > +		goto out;
> > +
> > +	if (capable && hdcp->content_type !=3D
> > DRM_MODE_HDCP_CONTENT_TYPE1)
> >  		ret =3D _intel_hdcp_enable(connector);
> > -	}
> >
> > +out:
> >  	if (!ret) {
> >  		schedule_delayed_work(&hdcp->check_work,
> > check_link_interval);
> >  		intel_hdcp_update_value(connector,
> > @@ -2395,7 +2401,6 @@ int intel_hdcp_enable(struct intel_connector
> > *connector,
> >  					true);
> >  	}
>=20
> Hi Mark,
> These changes here in intel_hdcp_enable are not necessary as this functio=
n is
> getting removed entirely in the next patch.
>=20
> With that fixed
>=20
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
>=20

Just to clarify I mean the addition of "goto out" I understand since you ar=
e changing the capability function
You need those changes to build this patch.

Regards,
Suraj Kandpal
> >
> > -out:
> >  	mutex_unlock(&dig_port->hdcp_mutex);
> >  	mutex_unlock(&hdcp->mutex);
> >  	return ret;
> > diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.h
> > b/drivers/gpu/drm/i915/display/intel_hdcp.h
> > index 7c5fd84a7b65a..f06f6e5a2b1ad 100644
> > --- a/drivers/gpu/drm/i915/display/intel_hdcp.h
> > +++ b/drivers/gpu/drm/i915/display/intel_hdcp.h
> > @@ -33,8 +33,8 @@ void intel_hdcp_update_pipe(struct
> > intel_atomic_state *state,
> >  			    const struct intel_crtc_state *crtc_state,
> >  			    const struct drm_connector_state *conn_state);
> bool
> > is_hdcp_supported(struct drm_i915_private *dev_priv, enum port port);
> > -bool intel_hdcp_capable(struct intel_connector *connector); -bool
> > intel_hdcp2_capable(struct intel_connector *connector);
> > +int intel_hdcp_capable(struct intel_connector *connector, bool
> > +*capable); int intel_hdcp2_capable(struct intel_connector *connector,
> > +bool *capable);
> >  void intel_hdcp_component_init(struct drm_i915_private *dev_priv);
> > void intel_hdcp_component_fini(struct drm_i915_private *dev_priv);
> > void intel_hdcp_cleanup(struct intel_connector *connector);
> > --
> > 2.40.0.348.gf938b09366-goog

