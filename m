Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7B4BFF537
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 08:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974B910E05C;
	Thu, 23 Oct 2025 06:22:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DEFojGHb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8206A10E05C;
 Thu, 23 Oct 2025 06:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761200561; x=1792736561;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aWI0GtJMtuEJPijvIHP7m/xJ67YhXhuFF/ILXUfb8ts=;
 b=DEFojGHby3NF93xNeP6xQxpQ4WcDHkcnlNW4GSHTxpLTb1BAU3GnEbmz
 meqS1oRqkuqwRpjvNXlBtj/xCkAFpTXqeen9TKGoixMAn0tJjO5pRK9PN
 y70j51WIagUMeLutrzD8dTsk4nYg4vvgqEB8lSYGftTGGAUBEw7i9KhgL
 diRMR7VAMGSJRLYL4EMoTjkfHIwGD0egpW7sv5YnVOUHtF2VO/5fQsS0K
 IrfC9Yhc/C16IgN1SUqSe4rGpxRJlEbtTOI9L8qf2SVbgZkUQppCADg20
 BWk34BG5AJ7jzpHie+QUQePcpo9ZCg6nLd+ZkROhstcWA+/fDHomdJc/5 Q==;
X-CSE-ConnectionGUID: nfHNWqUlQE6O8bwTEfoY1w==
X-CSE-MsgGUID: 2waa/og4QPuYEh4QRCtMzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63269019"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="63269019"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 23:22:40 -0700
X-CSE-ConnectionGUID: ACZbzgRnSoeG5oqhB63/5g==
X-CSE-MsgGUID: ErXjqgcWR/C2Nwo49CWMdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="183291546"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 23:22:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 23:22:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 23:22:39 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 23:22:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOYwk6FV/aAudB0gTJ2aRStO4Cpk8Re43wKO9zdePgsg88rNQFywel8slUCBkkstWbbUtipdd5NLpLIPZYxlFZ0cKczL6wX+uJMq3QdifkWnaAVVLyX9N9fZ3nrextu3OYefeS2NIdWityqWgbhRGC2yIJ2kZB/mRrIeaJdDT5Fu0obpFMqVgeGv6c9fxGc8LFTbbDD3WA8ucTPB7Ygm1LmS0fiDGGyKoBFPX6HTe1jxv9p3rj1UCyHXk98jrOMGkIQdRHtkCFaOTilWeXCR15ooCNdi5pHlmAuhlb1WZ58ypzzodcXfeHIQdX19+5hMJQ8UnZCvs65+v3ax4i3nKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdePKbPhv4CR9q5VRrujIn49nCxFlYpbte5Ryu3yBJU=;
 b=oXcTnsBjGlntJVr+36dTcV4Rvt+AJAhrKVttvcoLromGdklzitc2s2rSlyclQyrmu09E9ju4SGmJ5dcw27+ZgMhv97R9ai8hIqXeUcPQxy/RQggwpyzoa4zS8M+XxCPoFxpJBthpbExo73Q+5boMrKJ8i21jdCOmdneN8HwA0S42AAbYtSkLhO+1tCLs6R4SSq1vyYNNcFDpbeJTOissc7ChRhttykAtGlTlfRpVlEdcAWm/CV+QpdPjBd9A9UUIgH6qgPMeA3A1hEW4nCIAAfIKRicUfzTQzXfbwROntZzdFT9t65x9HusZLorylZmIYNHSw1IAoJ8DkF1vYaAzJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by MN2PR11MB4709.namprd11.prod.outlook.com
 (2603:10b6:208:267::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Thu, 23 Oct
 2025 06:22:37 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 06:22:37 +0000
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
Subject: RE: [v5 17/24] drm/i915: Add register definitions for Plane Degamma
Thread-Topic: [v5 17/24] drm/i915: Add register definitions for Plane Degamma
Thread-Index: AQHb6zD38v+Er/nY+ESt/nRJbphEnLTP9CEw
Date: Thu, 23 Oct 2025 06:22:37 +0000
Message-ID: <DM3PPF208195D8DFE75B407E070C49DED95E3F0A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
 <20250702091936.3004854-18-uma.shankar@intel.com>
In-Reply-To: <20250702091936.3004854-18-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|MN2PR11MB4709:EE_
x-ms-office365-filtering-correlation-id: 25dcf13c-b8ee-4236-7aa4-08de11fc8fa5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?qFR/owGOe+O8LUYd2Z1B6pa90IDpE8C2nv7lggconQV1ffaDpXoUS9fBSXTf?=
 =?us-ascii?Q?658seyhEax87aJu06ftCjn5xh1PKeZe9Umlc+xDA3IbENsPLa/q0TTAQCH09?=
 =?us-ascii?Q?m74FO6Q8U27nBNHMBxR//DvrLjStRk47IlMABADgvfgjSt9Qe1b5P11RjKn1?=
 =?us-ascii?Q?8NqIjNfNE4pjfg29leI+TBXC+TG1GYRxpXakRw+Cte2zBPZJGY5rLasRbsUd?=
 =?us-ascii?Q?6/egBH6wecxs66qjBFEtscB0ASccyQDc8LgaE/u7w8JsnjQDvBZQPb7tyRDl?=
 =?us-ascii?Q?dW+sUN8lQgxREZI+usPt2KfQJgHI7Ly0gKm+oGAeTn02RU0Z8xWkNhFiJrG3?=
 =?us-ascii?Q?QcUX4Lf3EFQsCIqdm6Yf8/OTCjbr3sTGUnzgIH/fcy6AIR323109prU45gU2?=
 =?us-ascii?Q?SqNcjeynZtGYRz25QUK1nL6jqMYk0pJEXZrZ2UzmC211kFBejgnyiwrNhPno?=
 =?us-ascii?Q?VqZhiUxnIrZzR9tuFf0LHI3nlLfighgEzNq39bmHLI2fYVwBEFkX9/zmH72/?=
 =?us-ascii?Q?Qyx6rtyNuqxQW07p6US7qqWJJqah8XRJE9Rkau79jWbbyxbY6ENCn5RUIsVs?=
 =?us-ascii?Q?fZ+Ci0K74TuJXUyXwJaIwUMl9fQyh3wJivpX8aptQ/Yz+JeUtHgbvk2E6F5b?=
 =?us-ascii?Q?/diETQ2TTt1VM5IYpC20qaLYDhEOGuMUZLSfE9/SG1tYcWxLM5TiPfTiB671?=
 =?us-ascii?Q?UOgEomzy/si0g3lMxoziT5Wf7perk66xAtWZ6cFFfjJOBUWu2ZKF9RedIwtI?=
 =?us-ascii?Q?UPH64F9gcZc62BEP145zI2NRcvu+bS1jDJbLTztnfHtD9oggXQTlTQa2265k?=
 =?us-ascii?Q?1YRc1QQ2WZFaB+GJuwHlYTCSbizVD6H0cyoguUb9OxdAAeKpVhKbQ9nYhFRU?=
 =?us-ascii?Q?dEz8dKzl/GoWJ8+NWJoQI6MWLf/Xn79JoWvzhqeCg9VHTeyzRncBPBTHWLV2?=
 =?us-ascii?Q?yjaI2A7/L8odxax/awwol31NqoISkgB+Pyx3bYwyVOo4mZfaj8jf80m6B4iX?=
 =?us-ascii?Q?JNzbo/MKI7eqjCtE+kb94lNMSmKXRZ7i8IxPffnyOp8lwVfZ7AAeRmFVeKvf?=
 =?us-ascii?Q?sltAwgS7KvRqCDBsuctfgHPMWOFC/MSxSXwStqKiZQG/KWxxlf05iea5ppIT?=
 =?us-ascii?Q?Q1R4wlINBhL8KPjcmRTQAGQzbpkBcfIa+UrEJnw5JF96ko9SlkXptqhUDHnl?=
 =?us-ascii?Q?dA6vh13RsnPBEFZ7KTAaqzumsmyV/evMUKS1ii7EYB0DT4ztws9fC4Ml7RNr?=
 =?us-ascii?Q?eKJqYvixjTR9Y/5zn/miPslmUyb7K+73euBNTcH8JPMo8348o7L3bsLQgS/t?=
 =?us-ascii?Q?3lg8DgInaJu4gAHSm50/HVIY99LexM9BlvKlLkFJJZ+Nm3tyw+29NdkLJzOe?=
 =?us-ascii?Q?aJqkn9AY5MaKwCnbHdU0lk+zwNSIyjSdm0l1Xe0FsXbpitt6Lf1Q2//EHflx?=
 =?us-ascii?Q?J5gBhMb+rM8lmRJKz1GinCI+/NqiTJhMz0kpww0srW4iFVTcDauyihyOQLHP?=
 =?us-ascii?Q?v4FRK9gRrKHUILQSd5ebYe+nbwMW5DfB1uqs?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gDpnmQoSd6dgmFXWDkCG5pt8EAJMAHtXMmXKaDEZHdPQUem2iAKuKxY51LES?=
 =?us-ascii?Q?LmHVNPTpjNdKzI17yRP3MbV0BUFCoYNdkhFnSjefrShB5MlvIIM6U5izH7lH?=
 =?us-ascii?Q?vn4WOtsI3h5fYxuhFoErIY/M0gSl3lq2Kq24OMkZnkb1SrbgnCBAH9Pso8tb?=
 =?us-ascii?Q?+qKcV4pPA3i3iimzgHME4VPzr8bl1IAzz5SyjGll3IoBXvDAB1aI/cZABoPI?=
 =?us-ascii?Q?O9fx2sNN28RVRaIiWgse7uUSZAY3Uza2/7KA29UTw7XDIzLFOaVcapshe5md?=
 =?us-ascii?Q?uaRzQfiTwnOLDg9voOjgNW0EHHHqqMXjuV5X8jfLgCRcSRQmiH67gYKciQff?=
 =?us-ascii?Q?wXYsrEj/+3c2b0/TWqzDBugLHIIhLr7gveDiFHadCzhmQt/ULdl6ju9jT/pg?=
 =?us-ascii?Q?+LMV7SUlBsbup5L2/2uxp8Pnmj6YugmdP4kl8ErQkuoyVT0kljNGfa++kAZE?=
 =?us-ascii?Q?ZrPVlqgQMcPAv3fVXnq2GNdOqQLjplFae26QPSyjbtJ2Nfq4dizr/Tbk/9PN?=
 =?us-ascii?Q?U6kCq1iUXupeo9M6A8sQHOjzetngOry17GpTQ8MpcWOor2FYCTFojtgTyY0j?=
 =?us-ascii?Q?m1OChvWsf48VIBcrEUu2uOtM+rUUmkScaZpqifHTY0Cg/EXHZzoieoKLBF+O?=
 =?us-ascii?Q?3XM2boXzBoxtDqA5jdLqNNMqZ5USO+L61DCwtyFYTASnbzhLJ/JreubgTM0U?=
 =?us-ascii?Q?E5i6lM6PHX2YjS9aiLdiLAhtmgLk20bAQd5P5Yy8jGhWnUsq081BGHjtCpnu?=
 =?us-ascii?Q?JF9HmWdYUrHT4+9Komav15V5w1Xiw2wOb7WnsqamxqSoLVhd2uyCr70ZFopG?=
 =?us-ascii?Q?rCpB8x3IcbmfAlWgrbimprODEPOi87hYMhFctBddzqb94hlJlEZsP57inQgN?=
 =?us-ascii?Q?DAQWJvl6cGJ8Bwxro9+BtlmvOhJCXQh9bHkNg6eRBNofiEl6skvIAxtYziDx?=
 =?us-ascii?Q?Df1lYG97JEWhe1mkRwV+vmK/yk0+Q7k4qHctlyHwVg1Ffo6nPuhj7lRDlJCY?=
 =?us-ascii?Q?q/7TDZxQb5H417YR9cFJyvcnTwdkd1+HrLGo4MYWfx5lIPGHR6qT5YwullAw?=
 =?us-ascii?Q?zxF68qq6OwCtOujxf3Wa6ghQxl+rxUkYatzsmVX0YBTGmtZlhUmL5nbl2Ok9?=
 =?us-ascii?Q?z4c3eKhRBZUhc2SlK+nOWiE9Jb1EdFh1s2JjcBv4NwiyWV2YDBywR/tGlJoo?=
 =?us-ascii?Q?eVdb+4358GcRIc8VSGXvcKGYo8Ro1iC56B27qNBp8Ug0MvpNcK0bJrhBe4zZ?=
 =?us-ascii?Q?UpTh9FFqfn2mCtT0WIxE+LVnmaoIhgn4jTuC5tc6S/hn8uZBSYJbj6/4kDgw?=
 =?us-ascii?Q?nnP7E2yk1Sy3WyFvIhSBzo036F5wXV89dB/95DbM46LUtrwrW6SUpA7cjwEJ?=
 =?us-ascii?Q?1nRAjofKRZQcGwndBDvOCQ1lWaxnzak0/VvHVteFYVCkzMRb0vrQA8fwCMIx?=
 =?us-ascii?Q?BmF55PNNy8GJE2hZqkPKM5fgJO0u72+flqPPGYD3zqYxATKvHH9ouYs5H1dF?=
 =?us-ascii?Q?P7XtHva5L6JHEGuT85sRi0YQt3CXbvmklDVbugge49d8p1wUNJpe459XA5u0?=
 =?us-ascii?Q?P0p35gbTYs43Nb0A4ABBlUI7EpJMJ46Tczt7kqcr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25dcf13c-b8ee-4236-7aa4-08de11fc8fa5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 06:22:37.2007 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2SiqYBrXLvg5uhsyaZmHXZ+lB143y6Kpywuq4fy83BiW+2DTcLCF8w0sQ2XP5tHGH2jC9tVzAtHwsxDufscHDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4709
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

> Subject: [v5 17/24] drm/i915: Add register definitions for Plane Degamma
>=20
> Add macros to define Plane Degamma registers
>=20

Add the Bspec link for the registers defined here=20

Regards,
Suraj Kandpal

> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  .../i915/display/skl_universal_plane_regs.h   | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
> b/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
> index ca9fdfbbe57c..2cad4ee9fe04 100644
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
> @@ -290,6 +291,58 @@
>=20
> _PLANE_INPUT_CSC_POSTOFF_HI_1_A, _PLANE_INPUT_CSC_POSTOFF_HI_1_B,
> \
>=20
> _PLANE_INPUT_CSC_POSTOFF_HI_2_A, _PLANE_INPUT_CSC_POSTOFF_HI_2_B)
>=20
> +#define _MMIO_PLANE_GAMC(plane, i, a, b)  _MMIO(_PIPE(plane, a, b) +
> +(i) * 4)
> +
> +/* Display13 Plane Degmma Reg */
> +#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_A      0x701d0
> +#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_B      0x711d0
> +#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_2_A      0x702d0
> +#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_2_B      0x712d0
> +#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_1(pipe)  _PIPE(pipe,
> _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_A, \
> +
> +_PLANE_PRE_CSC_GAMC_INDEX_ENH_1_B)
> +#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_2(pipe)  _PIPE(pipe,
> _PLANE_PRE_CSC_GAMC_INDEX_ENH_2_A, \
> +                                               _PLANE_PRE_CSC_GAMC_INDEX=
_ENH_2_B)
> +#define PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, i)   \
> +               _MMIO_PLANE_GAMC(plane, i,
> _PLANE_PRE_CSC_GAMC_INDEX_ENH_1(pipe), \
> +               _PLANE_PRE_CSC_GAMC_INDEX_ENH_2(pipe))
> +#define         PLANE_PAL_PREC_AUTO_INCREMENT          REG_BIT(10)
> +
> +#define _PLANE_PRE_CSC_GAMC_DATA_ENH_1_A       0x701d4
> +#define _PLANE_PRE_CSC_GAMC_DATA_ENH_1_B       0x711d4
> +#define _PLANE_PRE_CSC_GAMC_DATA_ENH_2_A       0x702d4
> +#define _PLANE_PRE_CSC_GAMC_DATA_ENH_2_B       0x712d4
> +#define _PLANE_PRE_CSC_GAMC_DATA_ENH_1(pipe)   _PIPE(pipe,
> _PLANE_PRE_CSC_GAMC_DATA_ENH_1_A, \
> +                                               _PLANE_PRE_CSC_GAMC_DATA_=
ENH_1_B)
> +#define _PLANE_PRE_CSC_GAMC_DATA_ENH_2(pipe)   _PIPE(pipe,
> _PLANE_PRE_CSC_GAMC_DATA_ENH_2_A, \
> +                                               _PLANE_PRE_CSC_GAMC_DATA_=
ENH_2_B)
> +#define PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, i)    \
> +               _MMIO_PLANE_GAMC(plane, i,
> _PLANE_PRE_CSC_GAMC_DATA_ENH_1(pipe), \
> +               _PLANE_PRE_CSC_GAMC_DATA_ENH_2(pipe))
> +
> +#define _PLANE_PRE_CSC_GAMC_INDEX_1_A  0x704d0 #define
> +_PLANE_PRE_CSC_GAMC_INDEX_1_B  0x714d0 #define
> +_PLANE_PRE_CSC_GAMC_INDEX_2_A  0x705d0 #define
> +_PLANE_PRE_CSC_GAMC_INDEX_2_B  0x715d0
> +#define _PLANE_PRE_CSC_GAMC_INDEX_1(pipe)      _PIPE(pipe,
> _PLANE_PRE_CSC_GAMC_INDEX_1_A, \
> +                                               _PLANE_PRE_CSC_GAMC_INDEX=
_1_B)
> +#define _PLANE_PRE_CSC_GAMC_INDEX_2(pipe)      _PIPE(pipe,
> _PLANE_PRE_CSC_GAMC_INDEX_2_A, \
> +                                               _PLANE_PRE_CSC_GAMC_INDEX=
_2_B)
> +#define PLANE_PRE_CSC_GAMC_INDEX(pipe, plane, i)       \
> +               _MMIO_PLANE_GAMC(plane, i,
> _PLANE_PRE_CSC_GAMC_INDEX_1(pipe), \
> +               _PLANE_PRE_CSC_GAMC_INDEX_2(pipe))
> +
> +#define _PLANE_PRE_CSC_GAMC_DATA_1_A   0x704d4
> +#define _PLANE_PRE_CSC_GAMC_DATA_1_B   0x714d4
> +#define _PLANE_PRE_CSC_GAMC_DATA_2_A   0x705d4
> +#define _PLANE_PRE_CSC_GAMC_DATA_2_B   0x715d4
> +#define _PLANE_PRE_CSC_GAMC_DATA_1(pipe)       _PIPE(pipe,
> _PLANE_PRE_CSC_GAMC_DATA_1_A, \
> +                                               _PLANE_PRE_CSC_GAMC_DATA_=
1_B)
> +#define _PLANE_PRE_CSC_GAMC_DATA_2(pipe)       _PIPE(pipe,
> _PLANE_PRE_CSC_GAMC_DATA_2_A, \
> +                                               _PLANE_PRE_CSC_GAMC_DATA_=
2_B)
> +#define PLANE_PRE_CSC_GAMC_DATA(pipe, plane, i)        \
> +               _MMIO_PLANE_GAMC(plane, i,
> _PLANE_PRE_CSC_GAMC_DATA_1(pipe), \
> +               _PLANE_PRE_CSC_GAMC_DATA_2(pipe))
> +
>  #define _PLANE_CSC_RY_GY_1_A			0x70210
>  #define _PLANE_CSC_RY_GY_2_A			0x70310
>  #define _PLANE_CSC_RY_GY_1_B			0x71210
> --
> 2.42.0

