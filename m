Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 556299D3578
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 09:33:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DB310E3C0;
	Wed, 20 Nov 2024 08:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mMSlxXfi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C5DC10E3B5;
 Wed, 20 Nov 2024 08:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732091607; x=1763627607;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K05yIj+ydve/yCf206hzPNmLBh5hXWqDOqwEqIVVh4A=;
 b=mMSlxXfioORfvYKlnN6WYYLJRpSlQZoj9tV+m2s7s0YItD1YC2z+xn3H
 uKoOvlCZ7WF6CDHdgWfXMEXQauMabnqddQ1+S1xkbw+u88F58fVmtDNG4
 H8MO/0tSNaUXrVlAOHdFsXhdXF8GdoHPq8sF9k0uYov1NThBHkMD4qHaZ
 bY2mC7osc/14TEHQWapfCmnsKOsCkB3FTQALg6ZqI0QDE7x12d6x7GlFM
 3zENm4dUHhVxO9BcQV9DuvdVa2KkkaxQM/XpN68P8rDVYeyUFIpkFtUxS
 h6MGcyl1Sulce7azN+vYKSTxJekMIC7syvW9bAHqTVtl+/udEE5Sl4VXl Q==;
X-CSE-ConnectionGUID: Fc3XFeMpTJOHbxh/SEaDdg==
X-CSE-MsgGUID: +OdOiHTdSReIhe/KxvCpyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="35918522"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="35918522"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 00:33:27 -0800
X-CSE-ConnectionGUID: Yp28IbdYRba9KH7nL4arwg==
X-CSE-MsgGUID: H6e6pJCfRQ6KzGh6t+qfKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="90233951"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2024 00:33:27 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 20 Nov 2024 00:33:26 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 20 Nov 2024 00:33:26 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 20 Nov 2024 00:33:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZCuf3utndVDiBkkgibkNLADUDqnbyhaATFaUqb8VIp10CyfQ0stjCIEq37BFfrfK4ywrDoahEIKB7FIfwXC/8+/JIrLg912A/S6wMV42hEfTNdPeavsbkerceUw0SPrfw4ufa34YBKOGW0ToX1rC5goEbhZP/y/PBTCTiiZLCFNEETgNe0kuKJx69bL+yr98Z6yH5vvrj8TtV091bAW9vrKD+CdFO5YVZkjLzchaCqWOZzTsE1iKT8vu9gzjh7NgPF8BzWu8XDJZuHs99BBHwJD3f+SPamZz5mvJWAu0OeNR9zgq28N5Qer5DtvaixGwjEsMgXmQiFy1dLLsZ5whQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2LpU23rC7cTh5C5t+apiU5ZrqQTbATWSPP+5BpUAjwc=;
 b=FuT1WpkIdr1Eypkz9/HcsWbrmVrKsjZt/9x9muag9gNjNEE2tGABFeH9ZbXvisyODeDdvED9DGnLpgAiHFb6WcZD6CaP03a040/luW+Yd5isqStERNh9g440BkfR0xFHGVCOURgp2yavfSy7G2+YXqivzSTGww6Ree17U07pejkWQMOtEkLHWgEu38PoBRE+EKObS9AdV1fh4uWgHfMDNhAQ2QWFKpXGF5k2BkeDcCdyC6THiB4khx4E+3+y3zZze5T0DkUPFZR5E2HHx3EbosNYAlU/JHpE7Oe+734XappogeUZNKE+62qbNY3x73O3i8yhIFZ+9cG8v0sMIHNK0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by CYYPR11MB8305.namprd11.prod.outlook.com (2603:10b6:930:c1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.14; Wed, 20 Nov
 2024 08:33:23 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.8158.021; Wed, 20 Nov 2024
 08:33:23 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCHv5 5/8] drm/i915/histogram: Add crtc properties for global
 histogram
Thread-Topic: [PATCHv5 5/8] drm/i915/histogram: Add crtc properties for global
 histogram
Thread-Index: AQHbOnGLbzxgLrGd3Eq8GmhK3BxVYbK/2AYg
Date: Wed, 20 Nov 2024 08:33:23 +0000
Message-ID: <SN7PR11MB6750D73A85B90DD5FB11301AE3212@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20241119104521.575377-1-arun.r.murthy@intel.com>
 <20241119104521.575377-6-arun.r.murthy@intel.com>
In-Reply-To: <20241119104521.575377-6-arun.r.murthy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|CYYPR11MB8305:EE_
x-ms-office365-filtering-correlation-id: 64bfc410-51a2-4762-c54f-08dd093dff27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ePIwJT1vl2z9i+7TP3Y5a7Z77kfc1HFAE4S8GEp1N12AK73WwPXV1J4Gz+7O?=
 =?us-ascii?Q?IALlDRjl2V4EkUrKv8UGGJzxKJOb92R6fJtLWE1HknKV9OEH+zQBWPF30XYO?=
 =?us-ascii?Q?nL8strPhZJ6SHv/ksZKyLkX0JqpWD34TGwJb+XTUK0dZ0VfW2dFkK+UfKcXN?=
 =?us-ascii?Q?jmzru/9aMC5ICXqQl/bgvdiAM2cUiqTw0vnC6ARUh9M+ZnUcCqv4U88+MQ8J?=
 =?us-ascii?Q?i2t0lFZcFHm+ICeku42nhsbLHjbzrsxaGi46tldB2p2Ak38pRdJCoyIrV9fF?=
 =?us-ascii?Q?UcSrqPsMFWesC2kw/4QKJamMXpIWmue8cwtVkYi8RvwHkMCeHgnQfFbAHBm6?=
 =?us-ascii?Q?ViSOzAC+e+09UIe3OuX9EAbIoos9THykJhj30hBqNBU21zOkq2qcfDR0l4h2?=
 =?us-ascii?Q?8IuyeHvFA5OUI7vO2zLAcyDDmEFsv5COLo5PhFaLA3XbNkqa0/3X84hllboz?=
 =?us-ascii?Q?us0jD4PofBs+4jfFh/tjuz4nmp45uarmsqawBMB5ZiUJEQb91P2noVLFbZ6D?=
 =?us-ascii?Q?x/j3h/P9yPss90zyf7orPbR6Xqtzcv6r9LBz8hILSXXWfwLCE+h7TUINRklm?=
 =?us-ascii?Q?qBGdK072bwc7rZqwv1DMN9DLaIeNeq8Ibz6LmuPY71JLC8IsKPuSGTe1gQM6?=
 =?us-ascii?Q?3HoQ8lmWl3h1eT+r0nWXzIxs0I8qRVABi7oj+98NbPNpBKzdBkl3a96MF1/G?=
 =?us-ascii?Q?w8dCNfninTxXkiTURQXqrI0rQX0E1iJd031X71m6i6t8bdyb5HKtEz7nq2aW?=
 =?us-ascii?Q?3cRrBYAYe5mYMJ10aaLHpBoCbO4s2GcoW2HMl7VETIVPoaIvdDFPzd46qx3q?=
 =?us-ascii?Q?kq9DCdND1iqeU0Yhqifl2BaqGPfcU2Z+D8inH5PHqrsHQsOavLjE2XV7EH12?=
 =?us-ascii?Q?iblSNsxDKaIRYioawv2eP7LhHZU+yLHx+tdQXB2kj1a51lvg+d/TT6RqSaon?=
 =?us-ascii?Q?wUq8WSDXmEWL2K2t5mE0KrLWNag3kA1IWVsq5l+ERlHYzoG6JlLAFgUX2apF?=
 =?us-ascii?Q?2iZEwQR2QidbOtgj9uZQntU6Q+Y+FxztC9wPsxzEaAwFhQrR5LXiJFjSgvSy?=
 =?us-ascii?Q?trygYPFg7qX90WRiv0mArCLyp9/74Iws+rEk1BS+TDXeApWJUV4sh+WQJvwY?=
 =?us-ascii?Q?Vi0iWKHmH0KnssLCdeOx2eiDTFFnjHqN5024xzfm72mskdJFSIGGAkc2ncdB?=
 =?us-ascii?Q?3WQK71KR0+p7evOILdQygR6Q4965tHzuE3iHT11pE3vNlVxqE5OJ/BXnu8KW?=
 =?us-ascii?Q?zo7Eilxa73Xn+V7mFxAbhqIl4i7gmJbBNhGO+6mzIc/djItFJjjAYk7DG7DL?=
 =?us-ascii?Q?onuR2Q+bx99qLiACmhr2DOHsM3D8yCZNxFJFjiPiSuzVvMt0XoCpNncESgiH?=
 =?us-ascii?Q?yt23HgE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?StGEcGp12a0+E8kxykv90rKwzrX8Clkhfim/dHqmYoRrnPENqrWQacLzERbS?=
 =?us-ascii?Q?1IDCgDzXtz6FbglKZZDs/5oWpf2axSQ6wIW/QcMJquFm1XQ1xh7vGLFCOsBP?=
 =?us-ascii?Q?8TWvshFCzlUGvZMdGS49rhxcE7QE1beX7YNW9MTzwGlAHwtc3tcXnkCVI0wx?=
 =?us-ascii?Q?UNYAgjqa5WJ7vfqJ1+yZVRWTwr9wJNrh/eDm7VZON4JhaKS7fRwKn7I2nufA?=
 =?us-ascii?Q?6ap/2jH9CSHqcR4gvX9dFxiNKw7/D95cFTYv7ivcctxz1H9fRM9Lg2pE+c7A?=
 =?us-ascii?Q?6dg//yy+zQP2RJKN3cO3HibRHr+D9oCICTW8t+pmkZnjHiqiVbdA0aUpPlrc?=
 =?us-ascii?Q?/4/rjY+md69oa4zVRgCCk0f/rmb/ZoTn4KELSTLLJX/tPw9ZT6UmyvB9pBYk?=
 =?us-ascii?Q?E6x2I57mwnYEVQvjDJ/JGqG60Y/4Lnry7hHgYa4K6lrJOo40xlI/luvxKa9F?=
 =?us-ascii?Q?JHzxKM0zKdX7hEuYVVZa6lTefhq4gfQD5nwHF/83JinSXDY4lAnHuFpNMyKi?=
 =?us-ascii?Q?qdML740BLbWRioD8366Uj2wsEYamWx8pT9m2LkAKpQXMmqk9PC11ZBXBtNQn?=
 =?us-ascii?Q?wAUHUqt1fX/h3COd3BGFUFta4vAWdEOHY7iEcXbUlkS9vcAMFtgFJpPB8iMy?=
 =?us-ascii?Q?ORmXOoa0OIpxvO91m5qmvLJUx7DU31Z3QyQYcsv+jQmby5UODh3HzGc4bzOa?=
 =?us-ascii?Q?IeVw7r2/CbjFo1KA2rrAqA+00B6LltE0ub5tCbpBE11nqNhB6qC4lpOCV1X8?=
 =?us-ascii?Q?wcmWbmuvidv+psDGlJkG75F8yoexOiujnX+Yjb+R+rTQbhbgDxnjr6y73T/x?=
 =?us-ascii?Q?1whgCFAXjHn/7osVXgzG4NwFVN3GBBqr5aSR2u6cpO4eln/j2AgrPiKMYirD?=
 =?us-ascii?Q?v///rDZFFjRZwP9LE0zW4ToGmN1wcQ2/Qv54tE8ZQ9gYH+jIiq741f2nDynZ?=
 =?us-ascii?Q?NiB6wlLf7QFvH8rYXoSX7sdVPaEUDn4sAzvVJDOE1sjqM/NV+Sc3LLjOssJg?=
 =?us-ascii?Q?3+WjhVWof17OLS6jqqQYC+qjafKcAaQlg5YZvcwb02GaN9fu8hoZu6R2xP7z?=
 =?us-ascii?Q?o9qZKvuy0B2M5nMf8v18U6tbjCRr/rSgHSxWs757mPwgA4tDN0HXFB4zj+Yz?=
 =?us-ascii?Q?9ceJPGpeLZeGx5ONyowczJ9lSZfunGOVKoqP6QnQddlbnn+zmYPdFX/d3si8?=
 =?us-ascii?Q?72kHvkYznTMpXsYT/U6DcjKtFFAJXVSnCSFFR0KB6m02aNUOyR2dGFePH8h7?=
 =?us-ascii?Q?8321bqKbQEbrh8xgADvBTM1L2aQQfZtM2nu1Hv1kp52hpDuz7g8qfhCMQP5p?=
 =?us-ascii?Q?AOWNRngZ/qOjtZZ4oiwtl5ah+Ne9Nza1Iwn2WkLnW0+tOJK/rU+HYjnbFsOu?=
 =?us-ascii?Q?+xSM7OIwd4PrGH33M5iD7z2/R7Jgzibc6nAzeSdevfhHe34EERuxv5B6nQ8v?=
 =?us-ascii?Q?unGC8Uxbg663WomUHp+Yv/gzysJMk0taELLo87TF8Ats4M1I955mYQWxdBp+?=
 =?us-ascii?Q?KDDSEUz9MOCDbcUvBzENesw7lYZ0Rf7+HnXvJUC+zsFjZy9AwtLwQhQtXRCn?=
 =?us-ascii?Q?iSnjFBxiQu77l8Qyvd8rShBN1H8uHOA53L3mIAxS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64bfc410-51a2-4762-c54f-08dd093dff27
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2024 08:33:23.4523 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sk4EkJx+VUncPMhgnxry8HqQnO/C49qrFswb1jFSp8LDFSctJM0RayvXk4GbragwlRk43TcenUuX3NxO3wPM0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8305
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



> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> Arun R Murthy
> Sent: Tuesday, November 19, 2024 4:15 PM
> To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: [PATCHv5 5/8] drm/i915/histogram: Add crtc properties for global
> histogram
>=20
> CRTC properties have been added for enable/disable histogram, reading the
> histogram data and writing the IET data.
> "HISTOGRAM_EN" is the crtc property to enable/disable the global histogra=
m
> and takes a value 0/1 accordingly.
> "Histogram" is a crtc property to read the binary histogram data.
> "Global IET" is a crtc property to write the IET binary LUT data.
>=20
> v2: Read the histogram blob data before sending uevent (Jani)
> v3: use drm_property_replace_blob_from_id (Vandita)
>     Add substruct for histogram in intel_crtc_state (Jani)
> v4:  Rebased after addressing comments on patch 1
> v5: histogram check with old/new crtc_state (Suraj)
>=20
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_atomic.c   |   5 +
>  drivers/gpu/drm/i915/display/intel_crtc.c     | 168 +++++++++++++++++-
>  drivers/gpu/drm/i915/display/intel_crtc.h     |   5 +
>  drivers/gpu/drm/i915/display/intel_display.c  |  18 ++
>  .../drm/i915/display/intel_display_types.h    |  13 ++
>  .../gpu/drm/i915/display/intel_histogram.c    |   6 +
>  6 files changed, 214 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c
> b/drivers/gpu/drm/i915/display/intel_atomic.c
> index 03dc54c802d3..a0d64a20b01e 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
> @@ -246,6 +246,8 @@ intel_crtc_duplicate_state(struct drm_crtc *crtc)
>=20
>  	__drm_atomic_helper_crtc_duplicate_state(crtc, &crtc_state->uapi);
>=20
> +	if (crtc_state->histogram.global_iet)
> +		drm_property_blob_get(crtc_state->histogram.global_iet);
>  	/* copy color blobs */
>  	if (crtc_state->hw.degamma_lut)
>  		drm_property_blob_get(crtc_state->hw.degamma_lut);
> @@ -278,6 +280,7 @@ intel_crtc_duplicate_state(struct drm_crtc *crtc)
>  	crtc_state->dsb_color_vblank =3D NULL;
>  	crtc_state->dsb_commit =3D NULL;
>  	crtc_state->use_dsb =3D false;
> +	crtc_state->histogram.histogram_enable_changed =3D false;
>=20
>  	return &crtc_state->uapi;
>  }
> @@ -314,6 +317,8 @@ intel_crtc_destroy_state(struct drm_crtc *crtc,
>  	drm_WARN_ON(crtc->dev, crtc_state->dsb_color_vblank);
>  	drm_WARN_ON(crtc->dev, crtc_state->dsb_commit);
>=20
> +	if (crtc_state->histogram.global_iet)
> +		drm_property_blob_put(crtc_state->histogram.global_iet);
>  	__drm_atomic_helper_crtc_destroy_state(&crtc_state->uapi);
>  	intel_crtc_free_hw_state(crtc_state);
>  	if (crtc_state->dp_tunnel_ref.tunnel)
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c
> b/drivers/gpu/drm/i915/display/intel_crtc.c
> index a2c528d707f4..3be81a5a789b 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc.c
> @@ -11,6 +11,7 @@
>  #include <drm/drm_plane.h>
>  #include <drm/drm_vblank.h>
>  #include <drm/drm_vblank_work.h>
> +#include <drm/drm_atomic_uapi.h>
>=20
>  #include "i915_vgpu.h"
>  #include "i9xx_plane.h"
> @@ -27,6 +28,7 @@
>  #include "intel_drrs.h"
>  #include "intel_dsi.h"
>  #include "intel_fifo_underrun.h"
> +#include "intel_histogram.h"
>  #include "intel_pipe_crc.h"
>  #include "intel_psr.h"
>  #include "intel_sprite.h"
> @@ -210,6 +212,7 @@ static struct intel_crtc *intel_crtc_alloc(void)  sta=
tic
> void intel_crtc_free(struct intel_crtc *crtc)  {
>  	intel_crtc_destroy_state(&crtc->base, crtc->base.state);
> +	intel_histogram_finish(crtc);
>  	kfree(crtc);
>  }
>=20
> @@ -229,6 +232,66 @@ static int intel_crtc_late_register(struct drm_crtc
> *crtc)
>  	return 0;
>  }
>=20
> +static int intel_crtc_get_property(struct drm_crtc *crtc,
> +				   const struct drm_crtc_state *state,
> +				   struct drm_property *property,
> +				   uint64_t *val)
> +{
> +	struct drm_i915_private *i915 =3D to_i915(crtc->dev);
> +	const struct intel_crtc_state *intel_crtc_state =3D
> +		to_intel_crtc_state(state);
> +	struct intel_crtc *intel_crtc =3D to_intel_crtc(crtc);
> +
> +	if (property =3D=3D intel_crtc->histogram_en_property) {
> +		*val =3D intel_crtc_state->histogram.histogram_enable;
> +	} else if (property =3D=3D intel_crtc->global_iet_property) {
> +		*val =3D (intel_crtc_state->histogram.global_iet) ?
> +			intel_crtc_state->histogram.global_iet->base.id : 0;
> +	} else if (property =3D=3D intel_crtc->histogram_property) {
> +		*val =3D (intel_crtc_state->histogram.histogram) ?
> +			intel_crtc_state->histogram.histogram->base.id : 0;
> +	} else {
> +		drm_err(&i915->drm,
> +			"Unknown property [PROP:%d:%s]\n",
> +			property->base.id, property->name);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int intel_crtc_set_property(struct drm_crtc *crtc,
> +				   struct drm_crtc_state *state,
> +				   struct drm_property *property,
> +				   u64 val)
> +{
> +	struct drm_i915_private *i915 =3D to_i915(crtc->dev);
> +	struct intel_crtc_state *intel_crtc_state =3D
> +		to_intel_crtc_state(state);
> +	struct intel_crtc *intel_crtc =3D to_intel_crtc(crtc);
> +	bool replaced =3D false;
> +
> +	if (property =3D=3D intel_crtc->histogram_en_property) {
> +		intel_crtc_state->histogram.histogram_enable =3D val;
> +		return 0;
> +	}
> +
> +	if (property =3D=3D intel_crtc->global_iet_property) {
> +		drm_property_replace_blob_from_id(crtc->dev,
> +						  &intel_crtc_state-
> >histogram.global_iet,
> +						  val,
> +						  sizeof(uint32_t) *
> HISTOGRAM_IET_LENGTH,
> +						  -1, &replaced);
> +		if (replaced)
> +			intel_crtc_state->histogram.global_iet_changed =3D
> true;
> +		return 0;
> +	}
> +
> +	drm_dbg_atomic(&i915->drm, "Unknown property [PROP:%d:%s]\n",
> +		       property->base.id, property->name);
> +	return -EINVAL;
> +}
> +
>  #define INTEL_CRTC_FUNCS \
>  	.set_config =3D drm_atomic_helper_set_config, \
>  	.destroy =3D intel_crtc_destroy, \
> @@ -238,7 +301,9 @@ static int intel_crtc_late_register(struct drm_crtc *=
crtc)
>  	.set_crc_source =3D intel_crtc_set_crc_source, \
>  	.verify_crc_source =3D intel_crtc_verify_crc_source, \
>  	.get_crc_sources =3D intel_crtc_get_crc_sources, \
> -	.late_register =3D intel_crtc_late_register
> +	.late_register =3D intel_crtc_late_register, \
> +	.atomic_set_property =3D intel_crtc_set_property, \
> +	.atomic_get_property =3D intel_crtc_get_property
>=20
>  static const struct drm_crtc_funcs bdw_crtc_funcs =3D {
>  	INTEL_CRTC_FUNCS,
> @@ -383,6 +448,10 @@ int intel_crtc_init(struct drm_i915_private *dev_pri=
v,
> enum pipe pipe)
>  	intel_color_crtc_init(crtc);
>  	intel_drrs_crtc_init(crtc);
>  	intel_crtc_crc_init(crtc);
> +	intel_histogram_init(crtc);
> +
> +	/* Initialize crtc properties */
> +	intel_crtc_add_property(crtc);
>=20
>  	cpu_latency_qos_add_request(&crtc->vblank_pm_qos,
> PM_QOS_DEFAULT_VALUE);
>=20
> @@ -737,3 +806,100 @@ void intel_pipe_update_end(struct
> intel_atomic_state *state,
>  out:
>  	intel_psr_unlock(new_crtc_state);
>  }
> +
> +static const struct drm_prop_enum_list histogram_enable_names[] =3D {
> +	{ INTEL_HISTOGRAM_DISABLE, "Disable" },
> +	{ INTEL_HISTOGRAM_ENABLE, "Enable" },
> +};
> +
> +/**
> + * intel_attach_histogram_en_property() - add property to
> +enable/disable histogram
> + * @intel_crtc: pointer to the struct intel_crtc on which the global his=
togram
> is to
> + *		be enabled/disabled
> + *
> + * "HISTOGRAM_EN" is the crtc propety to enable/disable global
> +histogram  */ void intel_attach_histogram_en_property(struct intel_crtc
> +*intel_crtc) {
> +	struct drm_crtc *crtc =3D &intel_crtc->base;
> +	struct drm_device *dev =3D crtc->dev;
> +	struct drm_property *prop;
> +
> +	prop =3D intel_crtc->histogram_en_property;
> +	if (!prop) {
> +		prop =3D drm_property_create_enum(dev, 0,
> +						"Histogram_Enable",
> +						histogram_enable_names,
> +
> 	ARRAY_SIZE(histogram_enable_names));
> +		if (!prop)
> +			return;
> +
> +		intel_crtc->histogram_en_property =3D prop;
> +	}
> +
> +	drm_object_attach_property(&crtc->base, prop, 0); }
> +
> +/**
> + * intel_attach_global_iet_property() - add property to write Image
> +Enhancement data
> + * @intel_crtc: pointer to the struct intel_crtc on which global
> +histogram is enabled
> + *
> + * "Global IET" is the crtc property to write the Image Enhancement LUT
> +binary data  */ void intel_attach_global_iet_property(struct intel_crtc
> +*intel_crtc) {
> +	struct drm_crtc *crtc =3D &intel_crtc->base;
> +	struct drm_device *dev =3D crtc->dev;
> +	struct drm_property *prop;
> +
> +	prop =3D intel_crtc->global_iet_property;
> +	if (!prop) {
> +		prop =3D drm_property_create(dev, DRM_MODE_PROP_BLOB |
> DRM_MODE_PROP_ATOMIC,
> +					   "Global IET", 0);
> +		if (!prop)
> +			return;
> +
> +		intel_crtc->global_iet_property =3D prop;
> +	}
> +
> +	drm_object_attach_property(&crtc->base, prop, 0); }
> +
> +/**
> + * intel_attach_histogram_property() - crtc property to read the histogr=
am.
> + * @intel_crtc: pointer to the struct intel_crtc on which the global his=
togram
> + *		was enabled.
> + * "Global Histogram" is the crtc property to read the binary histogram =
data.
> + */
> +void intel_attach_histogram_property(struct intel_crtc *intel_crtc) {
> +	struct drm_crtc *crtc =3D &intel_crtc->base;
> +	struct drm_device *dev =3D crtc->dev;
> +	struct drm_property *prop;
> +	struct drm_property_blob *blob;
> +
> +	prop =3D intel_crtc->histogram_property;
> +	if (!prop) {
> +		prop =3D drm_property_create(dev, DRM_MODE_PROP_BLOB |
> +					   DRM_MODE_PROP_ATOMIC |
> +					   DRM_MODE_PROP_IMMUTABLE,
> +					   "Global Histogram", 0);
> +		if (!prop)
> +			return;
> +
> +		intel_crtc->histogram_property =3D prop;
> +	}
> +	blob =3D drm_property_create_blob(dev, sizeof(uint32_t) *
> HISTOGRAM_BIN_COUNT, NULL);
> +	intel_crtc->config->histogram.histogram =3D blob;
> +
> +	drm_object_attach_property(&crtc->base, prop, blob->base.id); }
> +
> +int intel_crtc_add_property(struct intel_crtc *intel_crtc) {
> +	intel_attach_histogram_en_property(intel_crtc);
> +	intel_attach_histogram_property(intel_crtc);
> +	intel_attach_global_iet_property(intel_crtc);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc.h
> b/drivers/gpu/drm/i915/display/intel_crtc.h
> index de54ae1deedf..4e0a3c43d4f8 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc.h
> +++ b/drivers/gpu/drm/i915/display/intel_crtc.h
> @@ -7,6 +7,7 @@
>  #define _INTEL_CRTC_H_
>=20
>  #include <linux/types.h>
> +#include <drm/drm_crtc.h>
>=20
>  enum i9xx_plane_id;
>  enum pipe;
> @@ -59,4 +60,8 @@ void intel_wait_for_vblank_if_active(struct
> drm_i915_private *i915,
>  				     enum pipe pipe);
>  void intel_crtc_wait_for_next_vblank(struct intel_crtc *crtc);
>=20
> +int intel_crtc_add_property(struct intel_crtc *intel_crtc); void
> +intel_attach_histogram_en_property(struct intel_crtc *intel_crtc); void
> +intel_attach_global_iet_property(struct intel_crtc *intel_crtc); void
> +intel_attach_histogram_property(struct intel_crtc *intel_crtc);
>  #endif
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index e790a2de5b3d..0c3008a2d774 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -93,6 +93,7 @@
>  #include "intel_fifo_underrun.h"
>  #include "intel_frontbuffer.h"
>  #include "intel_hdmi.h"
> +#include "intel_histogram.h"
>  #include "intel_hotplug.h"
>  #include "intel_link_bw.h"
>  #include "intel_lvds.h"
> @@ -4607,6 +4608,10 @@ static int intel_crtc_atomic_check(struct
> intel_atomic_state *state,
>  	if (ret)
>  		return ret;
>=20
> +	/* HISTOGRAM changed */

No need for the above comment=20

Regards,
Suraj Kandpal
> +	if (crtc_state->histogram.histogram_enable_changed)
> +		return intel_histogram_atomic_check(crtc);
> +
>  	return 0;
>  }
>=20
> @@ -6826,6 +6831,11 @@ int intel_atomic_check(struct drm_device *dev,
>  		if (new_crtc_state->uapi.scaling_filter !=3D
>  		    old_crtc_state->uapi.scaling_filter)
>  			new_crtc_state->uapi.mode_changed =3D true;
> +
> +		/* Histogram updates */
> +		if (old_crtc_state->histogram.histogram_enable !=3D
> +		    new_crtc_state->histogram.histogram_enable)
> +			new_crtc_state-
> >histogram.histogram_enable_changed =3D true;
>  	}
>=20
>  	intel_vrr_check_modeset(state);
> @@ -7892,6 +7902,14 @@ static void intel_atomic_commit_tail(struct
> intel_atomic_state *state)
>  		 */
>  		old_crtc_state->dsb_color_vblank =3D
> fetch_and_zero(&new_crtc_state->dsb_color_vblank);
>  		old_crtc_state->dsb_commit =3D
> fetch_and_zero(&new_crtc_state->dsb_commit);
> +
> +		/* Re-Visit: HISTOGRAM related stuff */
> +		if (new_crtc_state->histogram.histogram_enable_changed)
> +			intel_histogram_update(crtc,
> +					       new_crtc_state-
> >histogram.histogram_enable);
> +		if (new_crtc_state->histogram.global_iet_changed)
> +			intel_histogram_set_iet_lut(crtc,
> +						    (u32 *)new_crtc_state-
> >histogram.global_iet->data);
>  	}
>=20
>  	/* Underruns don't always raise interrupts, so check manually */ diff -
> -git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 351441efd10a..300e90998463 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1306,6 +1306,15 @@ struct intel_crtc_state {
>=20
>  	/* LOBF flag */
>  	bool has_lobf;
> +
> +	/* Histogram data */
> +	struct {
> +		int histogram_enable;
> +		struct drm_property_blob *global_iet;
> +		struct drm_property_blob *histogram;
> +		bool global_iet_changed;
> +		bool histogram_enable_changed;
> +	} histogram;
>  };
>=20
>  enum intel_pipe_crc_source {
> @@ -1415,6 +1424,10 @@ struct intel_crtc {
>  	struct pm_qos_request vblank_pm_qos;
>=20
>  	struct intel_histogram *histogram;
> +	/* HISTOGRAM properties */
> +	struct drm_property *histogram_en_property;
> +	struct drm_property *global_iet_property;
> +	struct drm_property *histogram_property;
>=20
>  #ifdef CONFIG_DEBUG_FS
>  	struct intel_pipe_crc pipe_crc;
> diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c
> b/drivers/gpu/drm/i915/display/intel_histogram.c
> index 16f29923ef10..cba65f4260cd 100644
> --- a/drivers/gpu/drm/i915/display/intel_histogram.c
> +++ b/drivers/gpu/drm/i915/display/intel_histogram.c
> @@ -82,6 +82,11 @@ static void intel_histogram_handle_int_work(struct
> work_struct *work)
>  	intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
>  		     DPST_CTL_BIN_REG_FUNC_SEL |
> DPST_CTL_BIN_REG_MASK, 0);
>  	if (intel_histogram_get_data(intel_crtc)) {
> +		drm_property_replace_global_blob(display->drm,
> +				&intel_crtc->config->histogram.histogram,
> +				sizeof(histogram->bin_data),
> +				histogram->bin_data, &intel_crtc->base.base,
> +				intel_crtc->histogram_property);
>  		/* Notify user for Histogram rediness */
>  		if (kobject_uevent_env(&display->drm->primary->kdev->kobj,
>  				       KOBJ_CHANGE, histogram_event)) @@ -
> 203,6 +208,7 @@ static void intel_histogram_disable(struct intel_crtc
> *intel_crtc)
>=20
>  	cancel_delayed_work(&histogram->work);
>  	histogram->enable =3D false;
> +	intel_crtc->config->histogram.histogram_enable =3D false;
>  }
>=20
>  int intel_histogram_update(struct intel_crtc *intel_crtc, bool enable)
> --
> 2.25.1

