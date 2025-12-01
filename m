Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A049C965A2
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 10:19:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FCD10E2ED;
	Mon,  1 Dec 2025 09:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PuMNOMUi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A13B10E2ED;
 Mon,  1 Dec 2025 09:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764580739; x=1796116739;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Zk3Tha2PtnxqRghwEReM+dp+PWSxL20fWA+NlZY3YLQ=;
 b=PuMNOMUiTh7rlnBjaVopKoEK1MQeH+DG2mVhslScZJI1g7j5OyuPQk1Z
 YOqTwsiblaVDnE9QHP5c2zuHfEE3BvZyEfTuurrUnsGQQt3WUJAUglKFA
 t8rw0dBLUr4bujbxSKM5opInlbuHaLFl2rjDWefu6smgI/deyh1fo5D6+
 P0+nmZcgP4CLl3k6tn3nGWjBsY4H/KqASXF79fgs6ZhRtqU0QfJCDTWiv
 2tKnMMqJPCYtpbC6C9OJEKSeyUOBmG5UjdkAuvtUo4qFJwA8crp53i2Sq
 O7Qa4c4did0JxJ6SAXwoYJbP/u4cyF5FnLz1R/0LLNT05uSg1m3eG1Q7N w==;
X-CSE-ConnectionGUID: ftAEBEVURmmWWxXvARJH9g==
X-CSE-MsgGUID: LtyPXaPRTJSqkpLx1uBLhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66544216"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66544216"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 01:18:59 -0800
X-CSE-ConnectionGUID: XkG72hmzR/6zg+eICkIjew==
X-CSE-MsgGUID: 5RMlCoZyS0mnNB9vvA3xTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="193685191"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 01:18:58 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 01:18:57 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 01:18:57 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.24) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 01:18:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I13fYl9daEWFj6IRVJVyvStoSozma70bBy03moVgc23wLQFnq+7Uhcoq4kwJfFlogbpgrOluqdZSI6tbAD6t0EG9v7Dl86VQHF+9PgpOIaFxatLkA3OMJ/ph3n0f9h0haEh4ijjeqJLAjNCLajq/Eb/ABbjTCMTVmEg1m3SgAVwrNWaMvl/5G5IGO0jhozI6ia4pWRYvIMCDBuibV9YCMdYLetF1T9UQpdTcttnP4MFDQxdX8k3EYYcTORUdum7kgJ6m6UgT5oIU2MRS/cJhqs607c1591Ietut/ZdZZBxC+2g2FqwRNMUI1rWB65wMYd9CKQxHkPzxcBbEqEgUXCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTRHGnWBSEibWM8mqmZbZavajkpxx3zLyVX1anviNls=;
 b=GYqNFdzKuViKUXBwgR3pY7+H9iXoA38S4T+TifEXP+MiAXiwWVPdDFBLpvclvm5vyRGbJeUOVIjx8QPZwg1HVDFqjWdZ+LblEOKOgv/BWSTnSwQnDD0hp+rvoUaV5pdFy5+6cRGuIvQkIsSmAq3Mq1c2g+lovNgHe8Eygxr/Zo4Rat5czj+cfLWhoZhzf1cO7f4mFo4QysIhNhRW3w5eHvDoVQF9bnNzqLbm+Ln79A2SdZTvlvEcud5ojUgjjbxdjGMupICiMET/KCtLCLieSGBXA3YYjB5x6uzKs2k/Fa3HBtZAJweY3jupqmBS1q6LCtqCkD1DKYKo86GJhh/bdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CH2PR11MB8835.namprd11.prod.outlook.com
 (2603:10b6:610:285::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 09:18:56 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 09:18:55 +0000
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
 <sebastian.wick@redhat.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: RE: [v7 08/15] drm/i915: Add register definitions for Plane Degamma
Thread-Topic: [v7 08/15] drm/i915: Add register definitions for Plane Degamma
Thread-Index: AQHcYozDnLjKlOFCMkWulcSg7uDsn7UMgcoA
Date: Mon, 1 Dec 2025 09:18:55 +0000
Message-ID: <DM3PPF208195D8D8F0312AEA5B862A60B05E3DBA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251201064655.3579280-1-uma.shankar@intel.com>
 <20251201064655.3579280-9-uma.shankar@intel.com>
In-Reply-To: <20251201064655.3579280-9-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CH2PR11MB8835:EE_
x-ms-office365-filtering-correlation-id: 9deaca96-9e60-4f51-5f51-08de30baa714
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?PHQujskcl7u9gAcuKjzeooD0nzTiZKqc5C+QeU2OY4OAQ8rXGkgDvIec8AyE?=
 =?us-ascii?Q?RvbNgFhW2nbAv24YtmGS5FfqzOW7MPic1I4cPKFiIUR1n1lnUUkmc1w+2j2d?=
 =?us-ascii?Q?nQO3R8ETfo2zHJuxljJn67M7yfpS2Q9mFRZzDRrGTkO4CF7Uneh5cEJilYAa?=
 =?us-ascii?Q?iSBuEohvP3hGSzclN01GmAM3xPnLoywLLs8oZdq08/JKkh/phAzFko4mVdw7?=
 =?us-ascii?Q?7wg52AaTxPnJi9AqNjxSnTDRWsPtzC6zkPf7anwbBVfbGdAHsbSjFI7FYCak?=
 =?us-ascii?Q?nKjJsmoqe1yCR5FOLIAe1Fqf6R2eSHErve80uw8zg/3zL7/KGu+ZvouvsnhM?=
 =?us-ascii?Q?7LPx++7/EY0KsC4KEhmMtvIGMLj9pas1n+pus52Kls7tVMHP0YfKmURT1clH?=
 =?us-ascii?Q?/7ZSRddL0arYkOR5rye8NM8T6fySyvI5lwjG8fK27JwBqQpvT22npJWg5w/h?=
 =?us-ascii?Q?Xk/kRxFkYO5PiRN6aiuI+4nGr+4dIIkAf0Quszy9X7JbMiZfugDXhmcTzFbG?=
 =?us-ascii?Q?tq6d3IDnW3ZvCxZ+y7DLOGkhozlcb6oQ4SC0qDLG/xKO6VQJqj2LrXXVlNRH?=
 =?us-ascii?Q?W3bchm0veqPPcR1lccRarmJqLyGVTmqFOEtTXuKWjL8WEMRsazRRhnDcLQ7p?=
 =?us-ascii?Q?7X4AXn4QTKCOWSAtN7o9BIbSYyQrIDNi4D3v20Rdl4HtsOdIXe/e6Vfoc19B?=
 =?us-ascii?Q?eg06ij3AmQku8O/YS9xA/Ye/BrG4InfnrwkjhfpDamZ/wK4SuZwM34kpLSgS?=
 =?us-ascii?Q?W85nkhL1aCdVO69u4BCMkJ70ZeASqEZnbZMB0g1wIl6YCgQfV2YtaX7xZLBA?=
 =?us-ascii?Q?MCbzRfpUWQUIkbmyXHBlwbEXoE/zu7fRipkhP0cEJyrFg9sXidM7xXl/cWnr?=
 =?us-ascii?Q?TGYKUy23f9QhXDDka3hmADBoy1V45iakKbI/YHmTRfXoVG7fUzG/Vt3XUsPB?=
 =?us-ascii?Q?MzPIjfG4/EgH4N7iTFnRPaDOgak9Nz1vRoFJGHCbYjpMZvgVvwQubeNdXnLx?=
 =?us-ascii?Q?ShXY0Uq+dWelPKm+T+9H1Hv6u4GGWfF6lPBo1ZNRT/1kHr6rZ9yhs7rI+47X?=
 =?us-ascii?Q?+zA8b4IJ4cl3ifJobRVTOzxp7U7koK2lSLDyXGRQYM4mUa173INRz7RQPJoe?=
 =?us-ascii?Q?7164eCpigWodM7mZ9IRUZ9JvzytuUfDF8Kvgy84FCHayFEvQB4XdVc/vGcYW?=
 =?us-ascii?Q?y6gN6GIVTlMsdyfYUoYFAbpbj4vlMWLpO0U+r/s2cnsvTPkrP4MoCnxZRNis?=
 =?us-ascii?Q?NR5VI+D1Sw+1oHVpXV6J6U9VybR584hl5xDXQLMKXtgA4WmHsD0Hfi3LUMii?=
 =?us-ascii?Q?1fPFTGcCu/YWDAf2EXz8Oos+Ly0fimV+dkb63DjXD3/gUpyA363pdDgyTRm7?=
 =?us-ascii?Q?pUiBaS7+iA8GbEFiXhHLH39LqQUbEXgaehI5t59DIBarPXTcIBsa/mRzKPh3?=
 =?us-ascii?Q?xy6B1BF3Msgpx676GwKb2ot6Rdr9xifm2/uBhrdJbCbPniSQBFktvVVD9wpN?=
 =?us-ascii?Q?VPcERX74KdwFP90ya/lE2vow42LFgk6AoIcy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TvMBoth05ot+wiTw8iCLVwnWmKn3ZbvLnWZH2fyXBnRIXpiaIZU8BEhnbMFZ?=
 =?us-ascii?Q?4cS/AYe5xw7SOt+tyVowyzXLdAMWFhpWqe+bnQ8X1z1hRuc4ZihAdBsDwCD3?=
 =?us-ascii?Q?i+6v66beaaqCRGAjB4kmh657C5NIGzk+qZakJo1RIn55n1HJEqtP0ugQ97pP?=
 =?us-ascii?Q?8+omuzFnGxNWKAd6YgmNSWp7zUrNczfHKdhIiebULv6KoutZy23Qr0WeMlws?=
 =?us-ascii?Q?Zk+HupE6MWPYVoDDolmh35+1cDRU3AyqMI5Wgki1XfWSS0IBs44447xCJcWr?=
 =?us-ascii?Q?7mOLQfWaPcTXTL/mvKNkbMCzDSvkmPmyZy2RH/zduCKGS2oNrAKThst87VVe?=
 =?us-ascii?Q?r7bSJOkYV0LGuYkExiH2LtIeoslB7l7UGG6A5gbqrU4xgTaFDaXZn2gRz8AK?=
 =?us-ascii?Q?5XC9M2BTkPYMyljvaDQMboj7qlBkMrfIVupwhjlE5yqIp3ymS7svLJjrpo/m?=
 =?us-ascii?Q?TJK/8YJNme7m4afaXnaEPYIj8UKuXKQjuAZNv+laTCWIxQlTvq3ikYZdZKqP?=
 =?us-ascii?Q?g0qzvTX4GEy7D0fCnlXdrZY2ITKSTVRmBwOgv4z1rZBHkEO0Mm1OQVLEQXUa?=
 =?us-ascii?Q?vhlqUG9xSUBYU046Yw96fzlXW6lCkRDhVXVUYrlMJP2cgJiNFZiRMN1PY+20?=
 =?us-ascii?Q?dS6IbpHVl1WMbpNnxdppP95aO0F99nl5sN0DpUn4HSfzqFUfgbpfPB2ScVZr?=
 =?us-ascii?Q?TTGWQd05Jlb6CHLIwHcHBFua1T9I8X+2f2pWbNf1XomnrmPQlolGyQ/IMWNK?=
 =?us-ascii?Q?rSci22nPtxdqU1CwnpzsEm7RsFYJMLWm5MzdFMXBELOiS42pQT55rXwgCS8X?=
 =?us-ascii?Q?L/rRT/u3cVL8k8A1OBewSpX8uiKssxFpeif9JUUyNj6GM9/2QpuP+6DO18YD?=
 =?us-ascii?Q?piIj6+2fNTMVPVEu9vKNsuw9nkfc1xUU7l47qBRYoP+OG1OEcXQgIS5ZcBJr?=
 =?us-ascii?Q?FMjgfDvu9L5Pp0hM6tIWZZzAPHcGcomWXh+sKaEkWeM58jdHblwAsbj6SubZ?=
 =?us-ascii?Q?7fOFA5yffT8vbdkG5nMJyMVqWXcjKMeeACkUw/2YzbWqSF+ec3k8wDVOOs0b?=
 =?us-ascii?Q?GgWks3FsVFg37hh2ftN+ErwmZCGCt2TEsbUuM2yR/T4RvRAG6jaf/ypfl7mb?=
 =?us-ascii?Q?uMPum6ha325g7RLbAVDWDoGpds0qhPY2l9gFhzvpCry94CMWjyHBQkl49Rup?=
 =?us-ascii?Q?1u45WMzCE4DYKNi2TVYXyQaLbYQfVNdE4+xLaBf88q7E64IvMYTIc4GKIO/1?=
 =?us-ascii?Q?qpFqOpD+cQTS+lflL+bWAK+2KU6VNacU3dcBG6loh75xU/LNHMVNv5MUPDcZ?=
 =?us-ascii?Q?Ob8YeAZ3u+x9sd5o4g4RCvPqsRRRsOI0tN+7CCPXA0LdBtrXWBG3WhkHOB8K?=
 =?us-ascii?Q?sz9ajisQWBrfdvjHkE2Fvj0uG3lBuN7ebCRwOk9ywwA7snB/d1iyKANEh+Cd?=
 =?us-ascii?Q?FY5RnpIiVNKjDo2shDIi35xDakjQVNHqVukMdG5n3FjGdVcxNdqaIYwtOaOC?=
 =?us-ascii?Q?ou58GQ06x5l1I8HbM9JOpELEeaiHdmmoz6PkD2fbh1d1z4hC2KC8aUN/1787?=
 =?us-ascii?Q?98Z+xeBS/YiGiu063wqnHGvKX6P90jCBslpPXSQZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9deaca96-9e60-4f51-5f51-08de30baa714
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 09:18:55.8299 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TnJgY8/sdMfxJHupjqQzIFBiosAbn4C4woPVo2G0cydWm0fu4bJyXxk9g/Vw3zXz9FlxKRMr0Nhr2xcUFgJ66g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8835
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

> Subject: [v7 08/15] drm/i915: Add register definitions for Plane Degamma
>=20
> Add macros to define Plane Degamma registers
>=20
> v2:
>  - Add BSpec links (Suraj)
> v3:
>  - Add Bspec links in trailer (Suraj)
>  - Fix checkpatch issues (Suraj)
>=20
> BSpec: 50411, 50412, 50413, 50414
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  .../i915/display/skl_universal_plane_regs.h   | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
> b/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
> index 6f815b231340..1e5d7ef37f1c 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
> @@ -254,6 +254,7 @@
>  #define   PLANE_COLOR_PIPE_CSC_ENABLE			REG_BIT(23)
> /* Pre-ICL */
>  #define   PLANE_COLOR_PLANE_CSC_ENABLE			REG_BIT(21)
> /* ICL+ */
>  #define   PLANE_COLOR_INPUT_CSC_ENABLE			REG_BIT(20)
> /* ICL+ */
> +#define   PLANE_COLOR_PRE_CSC_GAMMA_ENABLE		REG_BIT(14)
>  #define   PLANE_COLOR_CSC_MODE_MASK
> 	REG_GENMASK(19, 17)
>  #define   PLANE_COLOR_CSC_MODE_BYPASS
> 	REG_FIELD_PREP(PLANE_COLOR_CSC_MODE_MASK, 0)
>  #define   PLANE_COLOR_CSC_MODE_YUV601_TO_RGB601
> 	REG_FIELD_PREP(PLANE_COLOR_CSC_MODE_MASK, 1)
> @@ -290,6 +291,53 @@
>=20
> _PLANE_INPUT_CSC_POSTOFF_HI_1_A, _PLANE_INPUT_CSC_POSTOFF_HI_1_B,
> \
>=20
> _PLANE_INPUT_CSC_POSTOFF_HI_2_A, _PLANE_INPUT_CSC_POSTOFF_HI_2_B)
>=20
> +#define _MMIO_PLANE_GAMC(plane, i, a, b)  _MMIO(_PIPE(plane, a, b) + (i)=
 *
> 4)
> +
> +#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_A	0x701d0
> +#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_B	0x711d0
> +#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_2_A	0x702d0
> +#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_2_B	0x712d0
> +#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_1(pipe)		_PIPE(pipe,
> _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_A, \
> +
> _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_B)
> +#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_2(pipe)		_PIPE(pipe,
> _PLANE_PRE_CSC_GAMC_INDEX_ENH_2_A, \
> +
> _PLANE_PRE_CSC_GAMC_INDEX_ENH_2_B)
> +#define PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, i)
> 	_MMIO_PLANE_GAMC(plane, i,
> _PLANE_PRE_CSC_GAMC_INDEX_ENH_1(pipe), \
> +
> _PLANE_PRE_CSC_GAMC_INDEX_ENH_2(pipe))
> +#define  PLANE_PAL_PREC_AUTO_INCREMENT          REG_BIT(10)
> +
> +#define _PLANE_PRE_CSC_GAMC_DATA_ENH_1_A	0x701d4
> +#define _PLANE_PRE_CSC_GAMC_DATA_ENH_1_B	0x711d4
> +#define _PLANE_PRE_CSC_GAMC_DATA_ENH_2_A	0x702d4
> +#define _PLANE_PRE_CSC_GAMC_DATA_ENH_2_B	0x712d4
> +#define _PLANE_PRE_CSC_GAMC_DATA_ENH_1(pipe)		_PIPE(pipe,
> _PLANE_PRE_CSC_GAMC_DATA_ENH_1_A, \
> +
> _PLANE_PRE_CSC_GAMC_DATA_ENH_1_B)
> +#define _PLANE_PRE_CSC_GAMC_DATA_ENH_2(pipe)		_PIPE(pipe,
> _PLANE_PRE_CSC_GAMC_DATA_ENH_2_A, \
> +
> _PLANE_PRE_CSC_GAMC_DATA_ENH_2_B)
> +#define PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, i)
> 	_MMIO_PLANE_GAMC(plane, i,
> _PLANE_PRE_CSC_GAMC_DATA_ENH_1(pipe), \
> +
> _PLANE_PRE_CSC_GAMC_DATA_ENH_2(pipe))
> +
> +#define _PLANE_PRE_CSC_GAMC_INDEX_1_A		0x704d0
> +#define _PLANE_PRE_CSC_GAMC_INDEX_1_B		0x714d0
> +#define _PLANE_PRE_CSC_GAMC_INDEX_2_A		0x705d0
> +#define _PLANE_PRE_CSC_GAMC_INDEX_2_B		0x715d0
> +#define _PLANE_PRE_CSC_GAMC_INDEX_1(pipe)		_PIPE(pipe,
> _PLANE_PRE_CSC_GAMC_INDEX_1_A, \
> +
> _PLANE_PRE_CSC_GAMC_INDEX_1_B)
> +#define _PLANE_PRE_CSC_GAMC_INDEX_2(pipe)		_PIPE(pipe,
> _PLANE_PRE_CSC_GAMC_INDEX_2_A, \
> +
> _PLANE_PRE_CSC_GAMC_INDEX_2_B)
> +#define PLANE_PRE_CSC_GAMC_INDEX(pipe, plane, i)
> 	_MMIO_PLANE_GAMC(plane, i,
> _PLANE_PRE_CSC_GAMC_INDEX_1(pipe), \
> +
> _PLANE_PRE_CSC_GAMC_INDEX_2(pipe))
> +
> +#define _PLANE_PRE_CSC_GAMC_DATA_1_A		0x704d4
> +#define _PLANE_PRE_CSC_GAMC_DATA_1_B		0x714d4
> +#define _PLANE_PRE_CSC_GAMC_DATA_2_A		0x705d4
> +#define _PLANE_PRE_CSC_GAMC_DATA_2_B		0x715d4
> +#define _PLANE_PRE_CSC_GAMC_DATA_1(pipe)		_PIPE(pipe,
> _PLANE_PRE_CSC_GAMC_DATA_1_A, \
> +
> _PLANE_PRE_CSC_GAMC_DATA_1_B)
> +#define _PLANE_PRE_CSC_GAMC_DATA_2(pipe)		_PIPE(pipe,
> _PLANE_PRE_CSC_GAMC_DATA_2_A, \
> +
> _PLANE_PRE_CSC_GAMC_DATA_2_B)
> +#define PLANE_PRE_CSC_GAMC_DATA(pipe, plane, i)
> 	_MMIO_PLANE_GAMC(plane, i,
> _PLANE_PRE_CSC_GAMC_DATA_1(pipe), \
> +
> _PLANE_PRE_CSC_GAMC_DATA_2(pipe))
> +
>  #define _PLANE_CSC_RY_GY_1_A			0x70210
>  #define _PLANE_CSC_RY_GY_2_A			0x70310
>  #define _PLANE_CSC_RY_GY_1_B			0x71210
> --
> 2.50.1

