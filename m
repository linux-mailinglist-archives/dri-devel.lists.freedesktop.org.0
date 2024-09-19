Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 413CC97C7A4
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 12:01:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7461910E6CD;
	Thu, 19 Sep 2024 10:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LYqPVSFV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39AD410E6CB;
 Thu, 19 Sep 2024 10:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726740071; x=1758276071;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lSPhl5YatTez3ppFxSj+3TVW5TNFpr3GsagomZS9Ltk=;
 b=LYqPVSFVljWV0teAQwnSs9i1YqVSFXNFdYTq3koKKxmA4XNy9NhkcN5A
 rfZ/uZfS4LpprT+iGY57wWeQuew4p8FpBx2aWwr76ZDzEzH6zzqf1ZXOj
 GqKSj4FMvnSMBHzlUYbG9oqs13CUjB6l/4TVBmPD8uXV1C0Nx0R4rop43
 ibTq7tD0T5vq105JtKVo1wAPR86lUSNMBUZ7fPpob51DH3ZK4kmSduDmj
 sLMVzncibRkKwsyLInIxwebISrkP/8rDZQatqfJZJ5M3tebJmB9zy0vHz
 i17Etl8IAHM3Ms2Dt118NuuLO+UrdFcEeT8vceUkrkMJvlzjjmVHF7W6o g==;
X-CSE-ConnectionGUID: /2Yqb+5WTumCN6HGaYLm5w==
X-CSE-MsgGUID: /aSC1jU6QDGN1dMvo+vraw==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="51103318"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="51103318"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 03:01:10 -0700
X-CSE-ConnectionGUID: 53cyO1zxRC2Q+ROJUVFloA==
X-CSE-MsgGUID: 3r6SN1uGSQCBM5EUR24L4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="70350503"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 03:01:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 03:01:09 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 03:01:09 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 03:01:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dV7FTGrw6OU5lcgUyLGszy6g5IHs20j9i9mHIZfK45vjLwo2lBkV6pZBYSsp9GsFHESsuGcQ6P/Jc2AG8nGjgOixWAwAnB1DAD1KgC5LACsjKH8kUfml5flK5Hx+EgBwUw+pnRjdEhADQJKz5yYLZMcUFr4qxhjyytR6mI43CyJACkIuYIeExmn4bhB+NC8d0we6wz7s4LhSU+nuFY1iQV+egACF41Px911FMy+0N2nP9/hGjO9dmFxwMl92o6K7yC7aJ0fM0nUd08XyV1q25fiO8tsJ4Hglvs27IzwWpCVoLwY3yLa7f3afKvBpQahmqsgGrt6ldPsE81brT4uEcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0BnN4hD+VdMZsyzLpMm1dWSqI05T0wUCxPx4mamT4A=;
 b=jOrdZd8+cgBUaED0b+k3jI1Mc8PAtRAYq432ttf5+h0F0fhFPVvtDg4uJJFxd4KV/HzWvqKKRx9wC0ypA4QRGPof2rWU+TEobGP8cBrwJYj/LTVn7Xh6y000seNhzIWQE2R+Qsfbdh0tHuNZB28d/RM0tPyeyX2YlVsiEEh0dCupobRZgGDpscIG3mxoz20DUovv2CaD26pzfOoIHt8TsJOlH8/Jy574dozs2yOQKBZHMJktrLqPrPBpBOYUK6s2qsHgaXmBXQ7AxlOkTho02Ezhrwkc9yZGWDPbe9bL74HJ/6T0NyX6buE1HTKrkYXipgThEf2D5mRao3MvhdI44A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SA3PR11MB7535.namprd11.prod.outlook.com (2603:10b6:806:307::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Thu, 19 Sep
 2024 10:01:07 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.7962.022; Thu, 19 Sep 2024
 10:01:07 +0000
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: Mark Brown <broonie@kernel.org>, "Usyskin, Alexander"
 <alexander.usyskin@intel.com>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, =?iso-8859-1?Q?Thomas_Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, "Lubart,
 Vitaly" <vitaly.lubart@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v6 04/12] spi: intel-dg: spi register with mtd
Thread-Topic: [PATCH v6 04/12] spi: intel-dg: spi register with mtd
Thread-Index: AQHbCEBsHBtR/xYtrEC+XDJy6l4vT7Jdj6eAgAFUH9A=
Date: Thu, 19 Sep 2024 10:01:06 +0000
Message-ID: <PH7PR11MB7605B60D43732A60C0A32D46E5632@PH7PR11MB7605.namprd11.prod.outlook.com>
References: <20240916134928.3654054-1-alexander.usyskin@intel.com>
 <20240916134928.3654054-5-alexander.usyskin@intel.com>
 <ZurX4xcy7TK45Omq@finisterre.sirena.org.uk>
In-Reply-To: <ZurX4xcy7TK45Omq@finisterre.sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB7605:EE_|SA3PR11MB7535:EE_
x-ms-office365-filtering-correlation-id: 663ed988-0ee8-419d-d9f9-08dcd891fad2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?lyodomO0zS9SauIA/8e24nj/yVDPRgMUORl2WHdMZLJJvFkvrtaym9Pp7N?=
 =?iso-8859-1?Q?xmrgpJ4T7QA2b39xk1U/MuvqYaIR2uX+pRAZXDL8K/2QrZDyrQsfp4RG8s?=
 =?iso-8859-1?Q?fOVLXuRWvSkok2sE3dwA4NRf5vSxP/M0+OKugmz2bKOPLUJKcafFQnNInv?=
 =?iso-8859-1?Q?ZydMOMtBg0kAps6RQbIUa/r6JnqfApFu8OaVi1E165CgEazR62MgiJf78t?=
 =?iso-8859-1?Q?W3YWgyBTQlYCsRZHKkeY3tQowk9IlU+GuMagYmMgaQ0DTe9ccF71NlLNgZ?=
 =?iso-8859-1?Q?plaS2jt0F6B4Bb8Vm/68lRRGSDpQFZO0H+Wzv8B6ais7wvYC6ghkzqgkfm?=
 =?iso-8859-1?Q?xYWuviA6TcvmPkaHcGqOSVoSUvdRsnh8Y2VMM5EH2p1mjJIIG9vq9TF0Vw?=
 =?iso-8859-1?Q?WzmDlkhJzh0CqvmhecBxW8kyZ4BdgMThodm89OKsJNS0oGbKJG2IX5cCOu?=
 =?iso-8859-1?Q?1N8KfXGg6a45taB2TEQpqKqU+9NAg8h1Op3TmqmkcIugEj+NiQYuhQaoH9?=
 =?iso-8859-1?Q?QNt2kk5kToYFZ0Ka8yC6BU6obBpnlqtPIDCjwKyIxX0AQ5aAgmmmJ1FYfD?=
 =?iso-8859-1?Q?BoWc0rnARDBGYfRAN4KU8rScIpluBr7Jp4QjWEqOjiijEwpjq1zhUyABq3?=
 =?iso-8859-1?Q?0yQkMWg2AA9ki0u2G2TXTR0HxpahOa0iYxo3g3OEDkPDEPnGigz9IhfctC?=
 =?iso-8859-1?Q?LbtDO4vHeJPQQD4FxsVOrkUXgfAigIlye0lNySEQ/nQLW04hWMcMLG+tqR?=
 =?iso-8859-1?Q?W9VQgSCS2GZKw4kyCwUerGyi9h9SS+IxWDhX7sxZpZ3O87eCcFOlxOv4F/?=
 =?iso-8859-1?Q?97n+dQnliTs9ybMPKdXwfFnl9mDOIpqog6Z1PKrR2g1WAMoT+fXBQAjrFg?=
 =?iso-8859-1?Q?vTby02pZk7YNSbMIAaTt3vjHLESuwBxf1oEo96l+SdY1v5B3UEguiqC3qh?=
 =?iso-8859-1?Q?O6whQsAAehjtNmrUK3tFJGISop915AmN4OyHB+Kn+bqLILq2AC6wQdTz4C?=
 =?iso-8859-1?Q?vOwUw3qSyd+3u1iUVwmhI4bvYoupSHaJQpD8YxAPZecXNm+allwYds1NwB?=
 =?iso-8859-1?Q?axGlWJRcIesCSCPJQ7P1vWqQQNW+WJxqFbiW3srRgnKGoE3CpLMiE3tpD8?=
 =?iso-8859-1?Q?J227G8/65awW5xm3KDyKW8G5iUENrsq/B0HawwSqlAJ4zPebqzZrcyC3NS?=
 =?iso-8859-1?Q?mrl1culKF80+nkM1GQlEele0d+LVTYjxxVZYvRw+m0aOLRNdBlj30VVEtV?=
 =?iso-8859-1?Q?JVUKjKQhlhqlRzLE+H/WpVhZn18NquSX7Cgs6F7PIV5vCvnSBqHMs7znOI?=
 =?iso-8859-1?Q?9F+tL9msWfV/UzGtvTAfXdnQr/Y+HuIiXW2ypBbpNTbIR0l7yeYuNBqCC9?=
 =?iso-8859-1?Q?MxThLi3ofYp2LWhXfGUfZwnl8XDc26KYvUT+i5Lpz6c+0kX+GC7qDCxdHR?=
 =?iso-8859-1?Q?6lMZXNO4jV+K3obTnNBOgzzwvlFXf9DAOoZQZA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?5Gt9pyOjhIfhVT+VLwALLFWZx7KQHWHqak0ALuEDQjVXTOuv5kK3rlPl1l?=
 =?iso-8859-1?Q?pWo+a2dgUEa1KatKHCNnVLlHwHGx3FNW8MzBWeNB9VYvjc0JvaStlPwvjB?=
 =?iso-8859-1?Q?yzhWyNt56BqukBgG/iEHdG9rKxvlKVU/6EPfO24BMuIeumjzt0kO1cHDmj?=
 =?iso-8859-1?Q?FiNqE/MV8+VV05CPRjGJOZrjJ/4sbvC+FEyiq6u5bq4IzD6o/qt7f8MsEG?=
 =?iso-8859-1?Q?XJ/3IPz2WAbNOPDeK07mCtWzXx671Humub760Q3iXnd5VpEWJut9Gwm0qL?=
 =?iso-8859-1?Q?ltsUaUyuIfMjO5nMD9p8eBt0bCjnZ3yGG2VJ1hJ46+NLAnygSU7Xz2GmWJ?=
 =?iso-8859-1?Q?5eY36QZNwv7PEzhOnalMB9Pgv0ip/fFRZS3d4xH3wy7XR1gWbQCzfv9UOc?=
 =?iso-8859-1?Q?2p9/wT4LQvrsHk7whWWsiRk/cpEDD6i1Brep1/wWBpVPjJMY7+PC434qXL?=
 =?iso-8859-1?Q?SRkxFUUSUoDPwZqHJvBqU8/7fGw9+bJP+a7XaFIXCKo4+/lWAwAIv2HIpl?=
 =?iso-8859-1?Q?2o9xlso6uYVgdR5WHHbW+f3jl1fOOmL79r/cr/jEO21dWnnP7DsIe4AW6G?=
 =?iso-8859-1?Q?XntYVZcWi9t6TvtsaQ25dIxEtoJ/lENERGzdga2mvVCWsh5MGEiULS19ck?=
 =?iso-8859-1?Q?7JgoGRNynZC2BuDtbJLZrY7xwf4lb6AH+eQ+ZTFVu3RHaXxkT8SfYRx80z?=
 =?iso-8859-1?Q?1fGHRFllrr0U1vHboGD/cvdIubRDkbGJUijGHCWWFHwtEU9YYE7OjthqAQ?=
 =?iso-8859-1?Q?5rcM8yRl8s62UOuS9dMhrDBJ8MN5Btgf+WA1RMDgJOqd4W+b5+ZC74oBoa?=
 =?iso-8859-1?Q?9eA6pJrdbsF+IlGZ+YNzkc+8ZkIaO2mO2/JRo1anO+7NFL0Ur6a7ICSDbg?=
 =?iso-8859-1?Q?gxL3SxqkyrYrYcXlpePpJLO5f1ufUvaaEfwxodY0oCQTuHfV7o0i3kJQ5K?=
 =?iso-8859-1?Q?lQUoPQXG8VppcF8CISGSNopKJFEKpffnNA3P5qbfEOJhKu6ZRCH1IH/7HM?=
 =?iso-8859-1?Q?XDBS6cwu5/YjTJ/sMlKeve5Rq5iVt3JvCv5+79kXih2OjVlp68g2KCHsMx?=
 =?iso-8859-1?Q?e1F9QVkGaxRHLv24DNAsBpskCHss1k9Vhut/oZJt+mNhvtpqo/L7ah3IXe?=
 =?iso-8859-1?Q?yK+hgIK52/L4TNL6xWZaGdmnCQSg7wSgG23RW2zYr1Di1DqQz7KhSPXKfK?=
 =?iso-8859-1?Q?t1mG6RlPPSe+X31+tfGd86VYRYmM7fl2CrSoCtmHiKnbn+r3XLkUIB0T4Z?=
 =?iso-8859-1?Q?AC+TWB+sAKPDyWcap1QnKTKKQ8ccSvvV79vzKFlxS+6He1L9nCXm0vMtQH?=
 =?iso-8859-1?Q?5ol+nV2sQQVMbd79N0X+Y9JTO7ds2Af8P4pNy7nTbfYRM8eTIkWsIhyR5E?=
 =?iso-8859-1?Q?Ku+FbdhuBGDWCvPGspMXeI5nZsHAsAOkOasku3rtKnAHSiz2XcJROF3wOp?=
 =?iso-8859-1?Q?dQih5mTxxDFdzE6jWjVjJ3sYplwpw1oRrOxY10Rjc5mXuK8q94t4+J7Bbm?=
 =?iso-8859-1?Q?YGuiOnkxsxuI5c+M43Iz+4w9JC4NTutVGIsAe6EQhJVMFWaJvKB3rH5kKl?=
 =?iso-8859-1?Q?JtyOCCoT3hWL2wWDAqciHLohlx9rBMCgBqKKptUeo1e589XSrJ+RgADjXO?=
 =?iso-8859-1?Q?XqYl7UPdk6oQSyn/6XIBBhHOtLe4+z2lBQ?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 663ed988-0ee8-419d-d9f9-08dcd891fad2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2024 10:01:06.9319 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f/YST9inwNu4aIlkpZqHekqBE2HV5CftqQck3/8a3XsQFtnCV2dgrXn0R7e3WktajUsg0piLbvl/SGwK/kz22Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7535
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


>=20
> On Mon, Sep 16, 2024 at 04:49:20PM +0300, Alexander Usyskin wrote:
>=20
> > From: Tomas Winkler <tomas.winkler@intel.com>
> >
> > Register the on-die spi device with the mtd subsystem.
> > Refcount spi object on _get and _put mtd callbacks.
>=20
> This is a MTD driver, it should be in drivers/mtd.

Okay.

>=20
> > +static int intel_dg_spi_erase(struct mtd_info *mtd, struct erase_info
> > +*info) {
> > +	return 0;
> > +}
> > +
> > +static int intel_dg_spi_read(struct mtd_info *mtd, loff_t from, size_t=
 len,
> > +			     size_t *retlen, u_char *buf)
> > +{
> > +	return 0;
> > +}
> > +
> > +static int intel_dg_spi_write(struct mtd_info *mtd, loff_t to, size_t =
len,
> > +			      size_t *retlen, const u_char *buf) {
> > +	return 0;
> > +}
>=20
> If these functions can legitimately be empty they should be removed.

Those are place holder so the code will compile and implemented in followin=
g patches, this is compromise on not making too big changes.
It use dot be acceptable compromise in past.


