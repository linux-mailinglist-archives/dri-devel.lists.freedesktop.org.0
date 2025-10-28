Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D950AC12F07
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 06:31:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93CF110E363;
	Tue, 28 Oct 2025 05:31:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lRyPwSpY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADCE10E352;
 Tue, 28 Oct 2025 05:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761629477; x=1793165477;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RYEsgK/49znqrrqOcYmE9hXVNRqiJ88oVHaLyzVZVDA=;
 b=lRyPwSpY8aBhdZxMQC+8NUjKX8RbllfVFItFi8O0cbtfKYKINVnKddPK
 IRI7rzw8pEBsJs2YhpFgLBfe6ibaCU55jlPEOLTz+u4QJUBQSOhiEGRAm
 kjP0kABwvEf/hLHX7Y/khRHYhVinU+N5N+9HPICTpkU1C5e1GzrkHUrsX
 ZcgHLADE00bR1G17TCnQria1pcbFDVeH1QU/pwd2Oyx7cBKyAuZYa5a8o
 v2oEu8WJZxDgp0aqie+2nccP0GiT4Rrmb/xGe3a5lUPDZUVp9IWljmrQw
 ppVA3kliTonZUeoRmrzi8RahrZ2v4X4wZYgtEn7bbEnQ3P6b+RA5wPOza w==;
X-CSE-ConnectionGUID: oQF25OftTS2PFHRODS9sEg==
X-CSE-MsgGUID: VS45OtZTSveYJiNs0gp5ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74007002"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="74007002"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 22:31:17 -0700
X-CSE-ConnectionGUID: AYwyXRxnQ16Nh1XMjvy/ZQ==
X-CSE-MsgGUID: IHa4W7qBRM6/vV/mM8C1LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="189559919"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 22:31:17 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 22:31:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 22:31:16 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.23) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 22:31:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u2lKoVxd71KApJJLlWU31RS2pQWIrVg/NWavpYTjIxqbgWgIHUvrUyZNBHSvcHsODTBq8o9Ljmr6qN+Wn6h+WEZU8WQtqt/e8kci124qa+uS3+yPF4fLkUfFelQ3iKoyHEXuGxrho5d93sZC7GbswTPoX1D49RDTnFccCZMsrzUKoAzC2y9hptwh146sDhnl1PVtayIxu7osTRVJtMbsXwioa5PyQjpKDnrawb1XidORw8k9L0cLaj/j8zcXgj5SYfhIwsDOyJ/HyjoIetv0PN5nijy0ETtZEFCpst4rShw4GQmiEy1vK1VyqmThvdQccG0KjybmpNugJQA12bOYUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9nfLGYITDtF/ICenjIfxGfPdxTsrjTcunNLd1J4gg0=;
 b=BPwfh+V7h6WQSJrH3QzLeWkDLUVFBWK1tJBk5D8fyuburjGra+ppZ0tZ7jSYyvjhgNJqKRRB34G0WAu5hQgNYgpq9Fvaszv0yvZZkDOI/dhPtc5sfquVyG4CFfG4a8nh9n7ywi2aB5uCqlOZcTWzJSAFgcNxFoQ9fVR0KbUo8OJWhQGXu1MvMSEyXT7LXk9Ow8aUjXry4UJQl+F0SGnUHpk5wYxkVP3H85AYXAcMfAJxmk6cMW2MY0axk+nyDMDzmOasmWGwgs4u3J/dKicZy+G294laQRK20MKz8yNZFmd1ErXhUb04ru+lT1qRLyQPBlUtw/XWXAZ0VsEmrOvs1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by PH0PR11MB7562.namprd11.prod.outlook.com
 (2603:10b6:510:287::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 28 Oct
 2025 05:31:09 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 05:31:09 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "Shankar, Uma"
 <uma.shankar@intel.com>
Subject: RE: [v5 03/24] drm: Add Color ops capability property
Thread-Topic: [v5 03/24] drm: Add Color ops capability property
Thread-Index: AQHb6zDZ/jCMR0+NDUOkhQJetYEeZrTXwVPg
Date: Tue, 28 Oct 2025 05:31:09 +0000
Message-ID: <DM3PPF208195D8D241EA5868693CA249139E3FDA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
 <20250702091936.3004854-4-uma.shankar@intel.com>
In-Reply-To: <20250702091936.3004854-4-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|PH0PR11MB7562:EE_
x-ms-office365-filtering-correlation-id: a12be829-325e-4e3e-02fa-08de15e33331
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Nh/p8WekKxe6CUEzjsVY63EfOd/J/05O3rHBXYEB/7fKFrdMbaRFIMxExR8b?=
 =?us-ascii?Q?yfrDCYjFYy88N8a8idHNxX6yC6UW3U0F75Ry3nzZ6hWYYvSg6NXL3EpUvxAw?=
 =?us-ascii?Q?IkumKYpZg+KkJb+B/vR53JvNki54hTgV1mwpwjSLBDReTMGydDNEZed/4MYH?=
 =?us-ascii?Q?+x5sFk/R3yR2PsyA00A7f/oIjxE0JNhoKsTr9U44dC0CehcVcYlXolWmNgCd?=
 =?us-ascii?Q?NA3GNYnkrNJFlvFyKDCJDsZCw/vjzvrPN0Vg8/+/y/U/EIfu3guBQ4ws7ZHL?=
 =?us-ascii?Q?3NpjJxLkL+oU+Jpjcw5Q71QrdU0Zj1SKSBIP5n9qYUlrfFoSRHCSaqXTt25T?=
 =?us-ascii?Q?ejFS4nfBMJx2JrXbieBcnUAAa2lWONvv37L4uN9JUEuazic24uDH0rP10hhV?=
 =?us-ascii?Q?7aq1S5pXNQEU8m1dG6nX/6Gqv+Tu6iejSBbyisNgKMmgkTk8ZQTfhxc1f3ka?=
 =?us-ascii?Q?9x3nMaqUMv4vXt/AfA18AZnKkkOXE5NDuZyyG0ipQDRXsQUhgjSWgYFQjRdb?=
 =?us-ascii?Q?9jkPOQwzku1nwM/Ns/wGIDJkbr3ocC42rWeXlN+RLLhYSlTxHt5gWPd38ExR?=
 =?us-ascii?Q?wRvg6HscaILYOPmwWjk1CBUJLRCxNnrkXd/AW9xok90vCz/JSA2Rl6xFSpR3?=
 =?us-ascii?Q?vlapBVVYh5bP8tHUQemF2vC+ZdRkGMIYn+KxenRI9NkUsEQVA0HybrD/600e?=
 =?us-ascii?Q?dUrfBEiEncrbAMqiPX89KeuOKwYWbAVIEahwMkKaYy0K/XK6GwhZECoSwSpN?=
 =?us-ascii?Q?a0qcSaLTM3GdYTZKnOhAAG1GSjwEzDQr6/YolEQIW7FZBugqp7eaYec23Qyd?=
 =?us-ascii?Q?g4ESDQPnfYJF1Za6yrsNZp5pBp4Bd4/XFjSjq4112i2Kh7HJsLcx9/mB37C5?=
 =?us-ascii?Q?oXK0LlXboOIcZrOivZcu5kUynwnQnYc8FV1J8VHygpqY7K34HjCc2T6xJups?=
 =?us-ascii?Q?jsW6/Qtwl+knwM8IfMph9tY05TfjecEsm1U2rPpeQ+8NiD4T0DzBlBycq/IW?=
 =?us-ascii?Q?tcrcsY9ok0HniHbtiwbJCqu1c0TG05Q7UvLk0NXF/3xy0g5QyoxOek0NZEpi?=
 =?us-ascii?Q?7AEwy8thZFGhIkZMFVKVdoMZTzGJbgpIYm0tT8EbXmgAv1CDxZrYhJC73vKl?=
 =?us-ascii?Q?6AZDqWxg2SuC9ph6XbRchJnowynjgehGgQD9ptIG1YeQuNxg23T4p5XM5C13?=
 =?us-ascii?Q?+R29qQM3FcNuGOVQYZyJuChrC2o2ppOjE1fRE6/CFwbbiyVe0QWskmbHeEGj?=
 =?us-ascii?Q?PKPJ+p0rmqklXkNgVhABOrlXtv/yRkIteEMHE30UYwW2snckoF1JRzgPqA7t?=
 =?us-ascii?Q?Ba2JSqkG3Pz/q+PaHj4svBC4L453e5tZI3+8xy/E4p2jU+ODA7U+pmC0ysMo?=
 =?us-ascii?Q?9yMudDf4Mj24PFb9eW8qlDZVfr9EG3PAUhJ+KuB2GgA+55PUdzjSqgxXrE0g?=
 =?us-ascii?Q?pTLreZexx7t2IIpdasb52ZbqwPMCPUn10FHibBylklEtHekXBCsazFLJduRe?=
 =?us-ascii?Q?gDf3Y37WbPXPrEUTG3PhGNvi1w59aWI4SoA2?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qo2l2ISw+er2wYzHPtJzDHZYUXstHuGGAi3C8UBADnZn+rGYrlmy5AWR9d4v?=
 =?us-ascii?Q?HW8zfOYVjvpUJPobzwhHVaRdGdO0mlU0Qz2OQH0xDaormBKYonsQbE8103Gs?=
 =?us-ascii?Q?6q3aVBYM3wfXdpsb47xzxxlrXxHdzjcz9NwW2Es6ZFYSnThHVTIKMWuAZeil?=
 =?us-ascii?Q?fcqgpePAE8DrfZfsmCNSyZE4nhwbvU5GayyqnTsul0mK936DN3/kbiqBotOr?=
 =?us-ascii?Q?C2DYXUCuIugD8A0w2Jngljp3UttW5hGgow1j4N9DV8hr28iDKioVWwnBH+vv?=
 =?us-ascii?Q?SWW13wZlisN7PAe1r2EaXFeQBFJ0Riqto+M3CCH1Y7RyC7AYxyYB46pfB25p?=
 =?us-ascii?Q?if4xZSWZhOSynbsTp1eh1+TpYn8rMEABq7SGBa3kUNjqOBWowMQXbk7DLgev?=
 =?us-ascii?Q?JenwojtryULWhx3lUeet3c7rXLuXGr6mc9Z00BgIK6nVMpFDQKyx8tV9XDRi?=
 =?us-ascii?Q?Jda1S4JQUMZUdG9XwDTWIAqcd0kMT7q5BA5MyE3UzaXCy36Pkk4kOtggwIPU?=
 =?us-ascii?Q?9IjUp8j8Ok/nMKAe5he1IUj5MgUYeg296+v/J5PMqP/SKkLnXOCw00mrjXx2?=
 =?us-ascii?Q?H2VgU73FPT9LDXeYtZafUIGbE/NwVYXd55+jl5geLF9Bk0YlkOK8k471yyzi?=
 =?us-ascii?Q?T/UhmqviEPdZk4qp7qPip0NiNKQZJi2SU+Jog6oYi+Kfw0vqRBGJEqIFXLEq?=
 =?us-ascii?Q?OFeXHtPZJRC7NStK1Nt5Q+WiM8AK7jZnZ7oz+urOAWANZVUJMBkwrWXRaeMQ?=
 =?us-ascii?Q?GTe6k6Vxh0tkF87pK2KEtdHT1bLO7FM1BrLsyrmvcQ6JDpK511RgHLTgIz1M?=
 =?us-ascii?Q?MngzcHqWFQ7rJ5b1+znSGKrnSjdJ6l4OwNzTYw5v1OC6oplzIDyC1QW1K7v3?=
 =?us-ascii?Q?vd5EfSimN09OBbvC3i3jWx5z1+tCtvNi6+gNqPDOm7lJLcijOGULiN+Fif2a?=
 =?us-ascii?Q?jr2vXOkC9Szb9P9RUdvfL3QGDngoTjdVpIsqklSzFHujSeDCqi+sdmT+FKHt?=
 =?us-ascii?Q?jAEOX07cK5MD4G7JMBju3MMV7zp+S77KygYJEdlhav/EhbzhH+CAWSw2P3Ch?=
 =?us-ascii?Q?4KjDKk8iQLS+IpPE3o4blYBIpksLiAX9Tzf/p3tEGaUPajn5XJM0R4MKehVF?=
 =?us-ascii?Q?SPHhqWJYOZDzw4w1JghegY6Jt4uaqC/opepUncAzB5k5YcN0sS7qSTdxwYBQ?=
 =?us-ascii?Q?zjLwMAtkEKicwEy3dwBE9eBCTU6pXPsfAZuEvWELWkroY4E6KtVzZCvYD2d7?=
 =?us-ascii?Q?Fb/eLjejKzzMPVdnXkJn9pTdGxi6LlcL7RmeWUNSSvNKs/Fg2Ci1wKOJ/mc1?=
 =?us-ascii?Q?OBt/dZp8Qu9KI6JbkD+LQvtObp9qJnZe0wzNSBDhRFVShbVaVWv/sh4QQokK?=
 =?us-ascii?Q?vWklytlC7STPWeUPkEdA5RA8VHrqFrwlRfJcWQbTmAbls3MilLL+xnzRuMbE?=
 =?us-ascii?Q?LqmRY2v3FyIEJOawwkWSu1Bm4fh8lrImGrykk+4xC4c5FJGlYhwwfoeeYcnG?=
 =?us-ascii?Q?HbASSjVvuv904JIJUTsRPh751Lt72VqvTTWZjX02eOlktghhrPTA7j1U+oB7?=
 =?us-ascii?Q?8gD844WpnbLqW7C0IchQrazp7dtzyNnxQi3tjm++?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a12be829-325e-4e3e-02fa-08de15e33331
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 05:31:09.3181 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ElW1kVNZup5yKWMhsoUGEcZzNyBR68sF6kR5W8nWZhiwnNCula0FuVWmQrEgYDl6qyPxPSLvCaQkgDZYZO8KPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7562
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


> Subject: [v5 03/24] drm: Add Color ops capability property
>=20
> Add capability property which a colorop can expose it's hardware's abilit=
ies.
> It's a blob property that can be filled with respective data structures
> depending on the colorop. The user space is expected to read this propert=
y
> and program the colorop accordingly.
>=20
> v2: Added documentation for hw_caps blob (Dmitry)
>=20
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c |  3 +++
>  include/drm/drm_colorop.h         | 17 +++++++++++++++++
>  2 files changed, 20 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c
> b/drivers/gpu/drm/drm_atomic_uapi.c
> index 3a9dc98d7653..81a8da09fbfe 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -785,6 +785,9 @@ drm_atomic_colorop_get_property(struct
> drm_colorop *colorop,
>  		*val =3D colorop->lut3d_interpolation;
>  	} else if (property =3D=3D colorop->data_property) {
>  		*val =3D (state->data) ? state->data->base.id : 0;
> +	} else if (property =3D=3D colorop->hw_caps_property) {
> +		*val =3D state->hw_caps ?
> +			state->hw_caps->base.id : 0;
>  	} else {
>  		return -EINVAL;
>  	}
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h index
> d5aebe46970f..46099e81bbfa 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -155,6 +155,16 @@ struct drm_colorop_state {
>  	 */
>  	uint64_t multiplier;
>=20
> +	/**
> +	 * @hw_caps:
> +	 *
> +	 * This blob will be of type struct drm_color_lut_range which contains
> the
> +	 * hardware capabilities of 1D LUT. These include number of LUT
> segments,
> +	 * number of LUT samples per segment, start and end point of
> respective
> +	 * segments and the precision of the LUT sample along with the
> normalization factor
> +	 */
> +	struct drm_property_blob *hw_caps;

From the comment and description and all the function names given later on
lut_caps seems a more appropriate name.

> +
>  	/**
>  	 * @data:
>  	 *
> @@ -305,6 +315,13 @@ struct drm_colorop {
>  	 */
>  	struct drm_property *curve_1d_type_property;
>=20
> +	/**
> +	 * @hw_caps_property:
> +	 *
> +	 * Property to expose hardware lut capabilities.
> +	 */
> +	struct drm_property *hw_caps_property;

Same here lut_caps_property maybe

Regards,
Suraj Kandpal

> +
>  	/**
>  	 * @multiplier_property:
>  	 *
> --
> 2.42.0

