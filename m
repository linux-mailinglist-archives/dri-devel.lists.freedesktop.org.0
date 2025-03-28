Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFEEA74E3E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 17:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FEB310EA58;
	Fri, 28 Mar 2025 16:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SPI61/J4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94EF10EA56;
 Fri, 28 Mar 2025 16:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743178134; x=1774714134;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BHP1H5iKZP6pLnQo3vQgNnqHE1MXeeePdPOFXnBSMjI=;
 b=SPI61/J4JWgLu1rHsQoEEpkK19ES9Qj8msFkENvMwGp5yRjNvDD86NmY
 3THOIILf2ghsEZ6AnlyilED0u9VEITQNxmssN4QJ7JAuZsnw4zYF4YsLm
 iMqz5Onscarhd/EOv7T7Z6GCbr2S7k+GBmqouAwdfbpEanT2jvJXkHX0E
 IMLXzTQrYxkpNVpaGOOe3Bdg7jzk9zDBVR8j1QV7Qtn3AcLwjK+L+17mM
 7vhUlGoK4WRuut/pkKVS5BSUW1eIHSOtVyMAPxc59ja/q9TLV4wWqDtRq
 xA1STLHYruK2+m5iQsBI7RveRSk5pxHsIsGtyzUFwl2fR+2Sp2Wf2YS5/ w==;
X-CSE-ConnectionGUID: GR9DgFCzQ0+pIf5ZxBLjhg==
X-CSE-MsgGUID: VrHeoxDmRGGSYluinPmMRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="69909315"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="69909315"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 09:08:49 -0700
X-CSE-ConnectionGUID: eVWV6sxDQM63r4165HhRiQ==
X-CSE-MsgGUID: /l16WyUHS/uITRpu/hEFKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="126402810"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2025 09:08:47 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 28 Mar 2025 09:08:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 28 Mar 2025 09:08:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 09:08:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xsov0MQ099Coh7hrx/cbfDh8KDKekXOUrvn8d/zNpUqCUXM7m8ceA4xGquoTqp7Q8P9oFhgfAwA+X2TkzL9sVO7z0DQjMCposzils+W0Jk7pIXNIfMXI9mEym8ZUkA+B3YcJpNd3gGC+usQvowyS7F5JkwA3XKaWlkIPDkZ3c4rNXu46fYnmbJ6PccxMJ9vz4utMVd+oV6rrikfdE1GI5wVvJiryFQHpBNanfSMiw6UaUP29usaQiW5/FsnOubsGsTqS11sbFpLVwLsMy5s7T768vzj3rwos23G187BTBS0D6asa0ozmttQbQuJnKO5/OINI8mBVMHZzKfJ9sbSQNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Btlm3OIFNFttPMDf2tnpgTmtRgWyHiW0ry08SsCLPiU=;
 b=MjIpCXfZXdqeO7n43UCIbhdKoHiWDZbpQ7XRoMqOcH+xNOT9bQuWe0BFa0+pOJ6EnkF7SAXVnM757TstQSy28sbt9zhGLMIm6yu5mBsGIBSmV+8Lw4hDVLEg06EeYpqAhshIjrsWAH00hnFgVGK6fC4B+yQM2pO+xTl8/7IWd10aJCPCPPXdn2LThJJtQC6Zt/8h4JobvtmJgOLXfSGMS6HNPQ6cHDc2w9CCD9Il8hZaASSELzsr9TVGBu1rWwvCf8lG0fs9j5y4oU1cQ/hcxL4bldjvpkOcocnuAgRzuamggqhJ+okmkUjehgGBn3+PAY28fOi8N2iItYXCeeaEsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Fri, 28 Mar 2025 16:08:37 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 16:08:36 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>, "Syrjala, Ville" <ville.syrjala@intel.com>
Subject: RE: [PATCH v11 3/5] drm/i915/display: Acomodate format check in
 can_async_flip()
Thread-Topic: [PATCH v11 3/5] drm/i915/display: Acomodate format check in
 can_async_flip()
Thread-Index: AQHbn+F1gSMA8AkYHkWmGsGU9/ItebOIjQeAgAApMoA=
Date: Fri, 28 Mar 2025 16:08:36 +0000
Message-ID: <IA0PR11MB73075B55F64514ACB9B384DABAA02@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250328-asyn-v11-0-ecc2d33aac69@intel.com>
 <20250328-asyn-v11-3-ecc2d33aac69@intel.com> <Z-al1w93rJKHJz82@intel.com>
In-Reply-To: <Z-al1w93rJKHJz82@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|DM4PR11MB6019:EE_
x-ms-office365-filtering-correlation-id: 42c9dae8-361b-4800-c8ba-08dd6e12cc00
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?rv7nyxFZ3WmpvquN09rUM8ABt7vm+e9Rldfx6JKfD7dPyyNSR9Oa1o79zT?=
 =?iso-8859-1?Q?PIZp0KWcQFWSPATR8zNR5BeXwZxJWu0xyS0M5oL06wPwj7BO2n9uxaL3MU?=
 =?iso-8859-1?Q?wE7kfLmA1ovqdGGBJ1TgYpk51EAFjkWrfwWnrFKmjoszNJ0VCpIvW//LYj?=
 =?iso-8859-1?Q?uydqdyY1RLxqc0XRpdmBwMjOvHXC1xCNakcJD3Dwog32n4twQoj7BFzXd8?=
 =?iso-8859-1?Q?YIifa64BfmKTd2wZ9z9YHnOA7GtFOoy//vFvfUDWdxNTiv54dOL38tbChH?=
 =?iso-8859-1?Q?Z4oueK8Qwivl2hDkIfgxb64kZsb6+S4JlwhRnZpcNkrALtoQFHiFpvgrZ4?=
 =?iso-8859-1?Q?rU3adRdYBwa3OVP85Zbfb5W+iYhQXr41Gg+jI8FI7tkVdoCtEXysFEvnH6?=
 =?iso-8859-1?Q?MWCGJA1lwDWuxJmNNZSajJi9khunGfHFbnWwOGVIcZa3vpEqCjE3Dhf6in?=
 =?iso-8859-1?Q?diCChjni4dpS5qOwp9wRP9faBleZ5OYwQwTNZ14DelrTB3HtGgB1nZBddX?=
 =?iso-8859-1?Q?tmh+dGqoAjhepI7qyMiQPPy6YA3ws0JJ+DLmcP7nh8YQA0beZKl8vLoZQZ?=
 =?iso-8859-1?Q?fAXyv1kM9+qy4rl+dcxeTUMvHAM39RlOvVYtaU9Vu5uJ1CMnnO01cQQJXl?=
 =?iso-8859-1?Q?Guw53jIhZNfneJ62XaOJvdPU1uANISY5WZMn//8poTsj9INC8/E4XxlsXX?=
 =?iso-8859-1?Q?r5T8UN94werzTY49klyQ2fHCoQvEDcP1x6sXA9LiMDr1vY7Qf/QuwUhgx6?=
 =?iso-8859-1?Q?i9fsvobYmDzzv+XWh1J4Zsq3P8dNEYLXa+40Wg0XcfUg0I0AbKB6thxox+?=
 =?iso-8859-1?Q?hmt5nKJziBPiWXTj7TwoE+No4sXFMRw4d1/SFGGT/3+yjMpHisPv4RFgoJ?=
 =?iso-8859-1?Q?EiKpXGJz/7feX0pc8bxBPruizqfpWrg1seiP+bkuxnXJwrFDDB8Og0o07z?=
 =?iso-8859-1?Q?VEfQhcYrMaVuC8HDYuPSZCIELAhC7SmW0EipQhQPJc//V1XEb0MZRqty3e?=
 =?iso-8859-1?Q?lTSoXo9QlHQMFkwLBUTWzS/HlV0bE7e+IMZDpsZ3brcgHSBuAhwIjj+dDD?=
 =?iso-8859-1?Q?hUtaaCQaUTXSD8KewqExtB4dm+7Z12IRhtsr41yNJOrePtV83HUMoayASw?=
 =?iso-8859-1?Q?LQ1cS9dZgVqEewlOK4kPZKPPBTcuhGl4sM7bD/hD7IhAeKdye2OQ0Zjodo?=
 =?iso-8859-1?Q?Gne2VtE+gxgWz+jya+1FuloT7oAlyvaM2YjbCHSTjbuqBQfOQUHguaqMQ+?=
 =?iso-8859-1?Q?56kTyTQgn/3XwMaPR0lLgjnVQ15MDcYPmfFmnoFH7PhT1PMqKq4fURAaW6?=
 =?iso-8859-1?Q?xQbfl2L5VzBCLkeJTbi7suQSzfQDyaSJB6zkKAGabez/ha9DH+HZnDbZ+k?=
 =?iso-8859-1?Q?gs3hUWNFJoymon62K3MMmJ5RN5wJrDmDel7mSp9h2QVyrOpMT0AovRDt7d?=
 =?iso-8859-1?Q?hsnEzvQh50YI3I0CEO4HPPsKMR8r1H1VOtNtgGIpML8iScz00WFAluweH/?=
 =?iso-8859-1?Q?kzzo20X3mn96WOI8Z5d2oX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?6QOvL2ixPFs/JrK80WSoyOwJlAgHIp0mQiEaB5ykOx3pZtY1Ux3thG0xuv?=
 =?iso-8859-1?Q?D9o25iaoZm316HosagQpKqOaUtuBXgAeHp9BJaWp+y1CLeUOTCP5Ig66nv?=
 =?iso-8859-1?Q?cNTjgbk11djOb5LWC4gYe1f/6sK06YshjNGep72U3TvUz+Kybqf8PWS9cv?=
 =?iso-8859-1?Q?ycYidT44VPR6HCbze/rzdNvZiCI/acvUmi9rn8gbpS6MktUKc92W45A+yZ?=
 =?iso-8859-1?Q?D/RwpwIHKmhcwk/YnDkq7ftuwdtmmqtpn6sHCY0JRhgb38pA/Ulwb8PlJT?=
 =?iso-8859-1?Q?nBw16cVVXgtycg/+QobK1XiQq+06uWzZuwJjaD8ZJP75tgHumvX6R+jYt7?=
 =?iso-8859-1?Q?2YC8NawfzYpeKPX7bIKMlYmkzC5kjubQftqsBoFaJIGlBN+OZ/s4NgFp7V?=
 =?iso-8859-1?Q?+QsBw/YMFhzD6uwPBYAJtMQOyqVYpI5fdybzX7cH0xgLiCIS5IBCAu1s9C?=
 =?iso-8859-1?Q?nwMLf7oFaiD8MtUwWdjVD30GKsjbIyRwoZU+tIgMoyz7WEUdaqKKPY3VMe?=
 =?iso-8859-1?Q?BkntFNbCjWqxblbFmcaP9Bz2XYi675al1ftIvW7QRxmw7mUiMw08eP6MR3?=
 =?iso-8859-1?Q?LxeF+YKPHOXbUMXhEIWZyhY8H9tJRy5aDYrJqaDSzjm2NFEsbSqj7XQr5Q?=
 =?iso-8859-1?Q?CQD1EF4CGoabTyglG8fGt2UQ9EGnxqoR2eRFT0AJ28l3S9zezcUEdIXKGB?=
 =?iso-8859-1?Q?bg58eXvgxLnQkrqO7RAJ78H9PQSX02qVVH2/0zgryMOvoKooZriwlFsgWA?=
 =?iso-8859-1?Q?fWeCD0mKiJieYml7UhQtL0iOnW0rlJWpQgjVxIYxrK10k5olINtPy+eEAa?=
 =?iso-8859-1?Q?UoTPC/jD3Ymu7mq0WMtU8En9WQjQ8vrDvJ7CC4/PC20KlSWTMHAVE5UPkm?=
 =?iso-8859-1?Q?RFdMp7Xu6aVRhX+Y6y3NKRT2igm19ErSTDRJfQufbV5aChF0/y6Tt/dEKe?=
 =?iso-8859-1?Q?lg24/wRM18H3bGkdeSyiIazDc/DZMF5phCK6HwK/P0DnSm5i9vOE+ZSoCB?=
 =?iso-8859-1?Q?PuAI1adEAUQAJHEiX8AOrYGGNlUYm9j1l84oNQ9c1AKjx+dsmwlqaLhMW5?=
 =?iso-8859-1?Q?vgyyjJ1NdS+coEP884uSrvk/ZG6imm42U8+lNlgFC+n7zvDo8+puNQ0f2+?=
 =?iso-8859-1?Q?qmHS/VzQYMB9djP/6BoS2k4ZeBpIhdDa+j2hMi/x1NIjUXxCqZROyeqSez?=
 =?iso-8859-1?Q?A8WhK5hpwo5tsANFGov2FGDlzvQ84GHPGXtLi259sEDoEY0rVPnxXM7JAo?=
 =?iso-8859-1?Q?klq+lDKp8xJVvQ1+fJrkUHHKsT2OAybz4xBRPir1xV49nxNvjFFCFhyTNN?=
 =?iso-8859-1?Q?xCQOhrlJTvY0NVTAacRtWkB45qnUu03bOlQAnGMzwoJMECl+E893+tpLea?=
 =?iso-8859-1?Q?U24fOISrjVK7goe13cmiLSoezhzCQex5B5WoxsDxHxcl6rIYFlvkEAkMAN?=
 =?iso-8859-1?Q?tVwhrsfnqdNxFWrZScK5u7leSv2B40GKvg53GTm7ee0NtlYjOTHESctxJj?=
 =?iso-8859-1?Q?ClFs/pDxm8MVkKIKVENC83Lh7JAZDBTp+ua5QMwDK/Po048bzMrV4Jp/OA?=
 =?iso-8859-1?Q?nUbfW0uEVgGffHjIeUNCVsn5uGuD9N/NCcubEPlfkoe8Ve+9eICz/HkEqs?=
 =?iso-8859-1?Q?86ouf4hu25neQOc36kOSY2sSSQubLn9trX?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c9dae8-361b-4800-c8ba-08dd6e12cc00
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 16:08:36.7277 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: avRF9cb20/jr0lpTo/6rDKm22WECVoxCZHGr5E1wbzxVOZhG5KL3Qo/IJ45zbg3bGJ9LbFzIuXiXuGEgXYATGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6019
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

> On Fri, Mar 28, 2025 at 06:15:37PM +0530, Arun R Murthy wrote:
> > The function pointer can_async_flip() checks for async supported
> > modifier, add format support check also in the same function.
>=20
> You are changing intel_plane_can_async_flip(), not the
> .can_async_flip() vfunc. So this commit message doesn't really fit the ac=
tual
> patch.
>=20
Done!

> >
> > v11: Move filtering Indexed 8bit to a separate patch
> >
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/i9xx_plane.c          |  4 ++--
> >  drivers/gpu/drm/i915/display/intel_atomic_plane.c  | 10 +++++++++-
> > drivers/gpu/drm/i915/display/intel_atomic_plane.h  |  3 ++-
> >  drivers/gpu/drm/i915/display/intel_display.c       | 14 ++++----------
> >  drivers/gpu/drm/i915/display/skl_universal_plane.c |  2 +-
> >  5 files changed, 18 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c
> > b/drivers/gpu/drm/i915/display/i9xx_plane.c
> > index
> >
> 5e8344fdfc28a311dc0632bb848a0e08f9e6c6d2..20c47de6d8bfd1d8ddafae02e
> d68
> > 370df799e22b 100644
> > --- a/drivers/gpu/drm/i915/display/i9xx_plane.c
> > +++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
> > @@ -828,7 +828,7 @@ unsigned int vlv_plane_min_alignment(struct
> > intel_plane *plane,  {
> >  	struct intel_display *display =3D to_intel_display(plane);
> >
> > -	if (intel_plane_can_async_flip(plane, fb->modifier))
> > +	if (intel_plane_can_async_flip(plane, fb->format->format,
> > +fb->modifier))
> >  		return 256 * 1024;
> >
> >  	/* FIXME undocumented so not sure what's actually needed */ @@
> > -852,7 +852,7 @@ static unsigned int g4x_primary_min_alignment(struct
> > intel_plane *plane,  {
> >  	struct intel_display *display =3D to_intel_display(plane);
> >
> > -	if (intel_plane_can_async_flip(plane, fb->modifier))
> > +	if (intel_plane_can_async_flip(plane, fb->format->format,
> > +fb->modifier))
> >  		return 256 * 1024;
> >
> >  	if (intel_scanout_needs_vtd_wa(display))
> > diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > index
> >
> 7276179df878658b7053fe6d8dc37b69f19625e3..6cf12801e1f1f11766ff4d6faf
> 17
> > a21b2c375e8a 100644
> > --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > @@ -174,8 +174,16 @@ bool intel_plane_needs_physical(struct intel_plane
> *plane)
> >  		DISPLAY_INFO(display)->cursor_needs_physical;
> >  }
> >
> > -bool intel_plane_can_async_flip(struct intel_plane *plane, u64
> > modifier)
> > +bool intel_plane_can_async_flip(struct intel_plane *plane, u32 format,
> > +				u64 modifier)
> >  {
> > +	if (intel_format_info_is_yuv_semiplanar(drm_format_info(format),
> modifier)) {
> > +		drm_dbg_kms(plane->base.dev,
> > +			    "[PLANE:%d:%s] Planar formats do not support
> async flips\n",
> > +			    plane->base.base.id, plane->base.name);
>=20
> I don't think we want this spam either.
>=20
Ok!

> > +		return false;
> > +	}
> > +
> >  	return plane->can_async_flip && plane->can_async_flip(modifier);  }
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.h
> > b/drivers/gpu/drm/i915/display/intel_atomic_plane.h
> > index
> >
> 6efac923dcbc757e6f68564cbef2919c920f13cb..772a12aa9c6997d77b9393f96
> 4e9
> > 1f3e8747d149 100644
> > --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.h
> > +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.h
> > @@ -21,7 +21,8 @@ enum plane_id;
> >
> >  struct intel_plane *
> >  intel_crtc_get_plane(struct intel_crtc *crtc, enum plane_id
> > plane_id); -bool intel_plane_can_async_flip(struct intel_plane *plane,
> > u64 modifier);
> > +bool intel_plane_can_async_flip(struct intel_plane *plane, u32 format,
> > +				u64 modifier);
> >  unsigned int intel_adjusted_rate(const struct drm_rect *src,
> >  				 const struct drm_rect *dst,
> >  				 unsigned int rate);
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> > b/drivers/gpu/drm/i915/display/intel_display.c
> > index
> >
> ee7812126129227971be89d3a79f944155620b03..ff349355ac95a039272f2fe1
> 7403
> > 4ca06a555249 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -5998,22 +5998,16 @@ static int intel_async_flip_check_hw(struct
> intel_atomic_state *state, struct in
> >  		if (!plane->async_flip)
> >  			continue;
> >
> > -		if (!intel_plane_can_async_flip(plane, new_plane_state->hw.fb-
> >modifier)) {
> > +		if (!intel_plane_can_async_flip(plane, new_plane_state->hw.fb-
> >format->format,
> > +						new_plane_state->hw.fb-
> >modifier)) {
> >  			drm_dbg_kms(display->drm,
> > -				    "[PLANE:%d:%s] Modifier 0x%llx does not
> support async flip\n",
> > +				    "[PLANE:%d:%s] Format %p4cc Modifier
> 0x%llx does not support
> > +async flip\n",
> >  				    plane->base.base.id, plane->base.name,
> > +				    &new_plane_state->hw.fb->format->format,
> >  				    new_plane_state->hw.fb->modifier);
> >  			return -EINVAL;
> >  		}
> >
> > -		if (intel_format_info_is_yuv_semiplanar(new_plane_state-
> >hw.fb->format,
> > -							new_plane_state-
> >hw.fb->modifier)) {
> > -			drm_dbg_kms(display->drm,
> > -				    "[PLANE:%d:%s] Planar formats do not
> support async flips\n",
> > -				    plane->base.base.id, plane->base.name);
> > -			return -EINVAL;
> > -		}
> > -
> >  		/*
> >  		 * We turn the first async flip request into a sync flip
> >  		 * so that we can reconfigure the plane (eg. change modifier).
> > diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > index
> >
> 8739195aba696d13b30e1b978c8b2bb5e188119b..8f6170a5c108a000582f341
> 5f78b
> > ad279254d8cf 100644
> > --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > @@ -601,7 +601,7 @@ static u32 tgl_plane_min_alignment(struct
> intel_plane *plane,
> >  	 * Figure out what's going on here...
> >  	 */
> >  	if (display->platform.alderlake_p &&
> > -	    intel_plane_can_async_flip(plane, fb->modifier))
> > +	    intel_plane_can_async_flip(plane, fb->format->format,
> > +fb->modifier))
>=20
> This introduces a slight change in behaviour where planar formats will no
> longer use the extra 16K alignment on ADL. I think that is fine (and sort=
 of
> unavoidable given how I implemented this stuff), but it should be highlig=
hted in
> the commit message.
>=20
Done !

> >  		return mult * 16 * 1024;
> >
> >  	switch (fb->modifier) {
> >
> > --
> > 2.25.1
>=20
> --
> Ville Syrj=E4l=E4
> Intel
