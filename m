Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAF0AD6F3E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 13:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54F410E7E2;
	Thu, 12 Jun 2025 11:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PbgZM4T3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BE110E7D7;
 Thu, 12 Jun 2025 11:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749728449; x=1781264449;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CSCObXCbnH7yM5sGvlUWgnBzaTFVXUEU2nEDDil9x4g=;
 b=PbgZM4T3x3rV0qRLbhcRSAQ6WTQCLz30ady+mlaiGB2s5l7YrHiGUsIV
 G9oKtpRcyRV8kwZZp0WFbtcGFxZwVgbX2L2zNglQekJseFuFWDAp5aHv4
 nI6EnmokSqddo4NiKHz2uRhRCsV8Gtdvwdz9WiQV1X7UYvW2m0XKWyht6
 9TuK+DrMr93b1lHrawLa8WIUMsgHjHg5Vrw/K32ZcA3kRbifVx8uQE+Gy
 7wjyVRTpK5uf+Llc7cyJXiDS1HjP5GUDyRIJRIn/CmD+uAjU4JU6+LV+S
 MPdet0evaTucd72DP9s7w1awNtu226jfi1ag6zV79bmBrGASbLvBppmQd Q==;
X-CSE-ConnectionGUID: s9jUe2deS1Col8anzmlqdw==
X-CSE-MsgGUID: IBfsy1N4QN+qNzVdFMKEBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="63247639"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="63247639"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:40:48 -0700
X-CSE-ConnectionGUID: InoaF11+QouV5ozPkfN3TQ==
X-CSE-MsgGUID: bPNUN8SfSRKHzoMHor+s2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="178402296"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:40:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 04:40:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 04:40:46 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 04:40:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWS2MDGgCqup+aitp46/csQW8xtb2qNUBnrKPsSsoEEd2/PCAR/FYFAyGvtyFyw7Lml0WERQn4MwJ0r8rizmKFg2GwV+cf9xyAMQdOil13c7cDiMTagAQwXo7OJMG5296vHSRqPGKjVUfwvd4ijX+Qu1gLDCeB3bpTsG3XY0vN5PAjyn8QTix0yZ2pKoOUrkQdo6vjuNkZHFj3WX4a7rkvPaWuBot+1AJXd3elD2asWqqgsDY9b7f6lA74amamCCOseHCpr1QzAsKSQRRDjNBgwL4akcAq+5yPAlZQT+x3wIOtpfhgtN7KNQw+DvBucZcV0patdw0kaKfwGoIZEEAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CoIfgoKxkjLk9wv6R0LEWLpo/thI7IlQUxmzdLC0rx4=;
 b=QNmyjxPlU+PyC9eSmD0k0k03SGQFyYK3NVYK52rS2uFt7cjncZfCWQoRAtsqO41rMfKypJJ0OIm98aHgCslOXMsHLcHgK/jAHUjU6hjJ9YOt/Ab34NtaB8eYm+W7j9smaM1p9kaSOWPg/IHFTzH3i130Ww0Lmc/FpJJ/Zleqxzpljojsymjs03bz4kDXMXGlojOPG7bvHaW12HksJ4ldYS6iGxxe45i+6pkJg5BKJ8lj60giwd3WylOv3uwAAAFWrpiymbJ9tg9APZeFRWD08OGyVAICdo91zHZeXEpnFDXJjr0X/npr9AVqM6qJDhIUcj37W6L5Pjigwibf6CGb4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SJ2PR11MB8450.namprd11.prod.outlook.com
 (2603:10b6:a03:578::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 11:40:25 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64%4]) with mapi id 15.20.8813.020; Thu, 12 Jun 2025
 11:40:25 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 03/13] drm/dp: Add argument for luminance range info in
 drm_edp_backlight_init
Thread-Topic: [PATCH 03/13] drm/dp: Add argument for luminance range info in
 drm_edp_backlight_init
Thread-Index: AQHbrPQjjHgX94DrmU+/a+D20aPY7rP/aJsAgABHZZCAAAwhgIAABp4Q
Date: Thu, 12 Jun 2025 11:40:25 +0000
Message-ID: <DM3PPF208195D8DD3B3CBE1B3B00821BC02E374A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250414041637.128039-1-suraj.kandpal@intel.com>
 <20250414041637.128039-4-suraj.kandpal@intel.com>
 <IA0PR11MB73072A82012F059738260626BA74A@IA0PR11MB7307.namprd11.prod.outlook.com>
 <DM3PPF208195D8D82C92D58A8780E866EE6E374A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <IA0PR11MB7307ED398EE421D9A54A686CBA74A@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB7307ED398EE421D9A54A686CBA74A@IA0PR11MB7307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SJ2PR11MB8450:EE_
x-ms-office365-filtering-correlation-id: 49e8e2ef-8d55-4472-71da-08dda9a5ec5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?TpdT4Nu625vjgYth9vSwySShwDRIKKPMPf0RSdz75PaG2Xh8QZeHlCVpmGfk?=
 =?us-ascii?Q?p+rUgB1sTDa4wehiX0RDPJa8I4akUGw/xsEWiNey8GqC0YmcsmJbakqn5Bsj?=
 =?us-ascii?Q?fA0sT9/QoIUgBFnX/K/wI7Yg23bRzufyYyDoo8k15+q7K6Qw/8DMzyDdSI9P?=
 =?us-ascii?Q?GfgVC4brdCo2pRwNwWTVpU1RJwBhz9eBou4F+082sRq4OX3Ohs51/258qP2N?=
 =?us-ascii?Q?J4c6jkZYjaksLzR8QGbdj2EOOeUyD87khU6XquklQCSdjKx48hvLAssgWdD8?=
 =?us-ascii?Q?+A7n2Cv0NZQlDlizDbR4WwULV9PQifkrfDGBnfUToNJPbxUXOc97t1Y1QqqU?=
 =?us-ascii?Q?/pkHCrLWi6m5ntSZPhgQnboBzlWzO9WFO1Rp9k2V9111PS/HkwSAcaGhUGcg?=
 =?us-ascii?Q?at+yJMvPcpj2JxQgEeNexwg0R65gH1ateWt/unu+wR2IMwRvBfqNQXKpNCGa?=
 =?us-ascii?Q?1ke4iV2dCgDBrL/434CRYboa4RSxin6AtKDo13xGghaTQSR5AyJlFPjc00WP?=
 =?us-ascii?Q?zDb2OvvSKtzd6wE1hXVZLvpv84BW9asZAJAjX0y+IQMmOtRVSkE0N4TmvKAd?=
 =?us-ascii?Q?5wDHKyoWmREnTJtgaXHAgZBmIM8kVrRcVBkBqMG4xcMAbHD+ebxw0wHB+ijQ?=
 =?us-ascii?Q?eEuIWsPkSjtb9yWlndBxyon4kpo2nTHDMJsqs8tJf25ZoYbhxu4oaZrvrK45?=
 =?us-ascii?Q?Fw0aeVsf7u7+NDpM2X1Ffe8yLS+JmvpS3CapbiW6aVfgin6uep9gFPZNqvHP?=
 =?us-ascii?Q?wUA42hP7m4xcXEv+KZoWoHRDta8xv9O9Uvr1TwdR2t1i3azMf67PpeXCK9sD?=
 =?us-ascii?Q?6uyeUTKi8QU3ADg/UAjktejoshWRGfj5So4ITJ916gTsXqnyPUFWTwAq83uo?=
 =?us-ascii?Q?NBud6PU7/3K7K23T3gE6zw9g1mDUmHme6VfjIFB+7LJyxizlj229Ls7EmvWw?=
 =?us-ascii?Q?5U/uMuNmgT9qR8nUhRzh7zGcZv/7Nc9PX6vudWRA0V/rsRspE/PTLcXrXRDg?=
 =?us-ascii?Q?AFQrZ52cSPBjpBfiROPTl3fdwZS2L9/o8khsAQVwRm2W3vf7CFujOI5NQbU8?=
 =?us-ascii?Q?dUxX1PQ5NhgGwa42R3nlxuf3iNYB9z8L5DJOcDkIW2D5vVrTKfZbcevOgFPy?=
 =?us-ascii?Q?Vz40ergNFZ7C4uFuGeYV5L2aRC94pJJe7l/75h+GxAyUbAW3IzvJbOfMPiNP?=
 =?us-ascii?Q?e4vH5VqOC4K79sB6PjFacwQXnSy9wCRiAvrBPB03Fxj7Gr5yTQTSyFURjxSL?=
 =?us-ascii?Q?tUEAEn/S+6Tx7pgKZU2ZQT71WttHboUtOrM6BMcf7lM9+Mrimkdgq+Fb4Dlh?=
 =?us-ascii?Q?76c6HzEnKAYYUWz9uSmC/Uq4Kk63d2lwlL4Ib2is0VOIqcPTemo0jYEKcCbY?=
 =?us-ascii?Q?dvEMKYxcIoQJ+Y0t6eOstVAtCdpzjQkLGakhDB2g+bSZMZr+qUMDHVy3Y/6H?=
 =?us-ascii?Q?mtgFrwUS4ZaJhD8WqejuAPc+cy2PiyuTLiG3kSonLtuzkPKCcKN3C5P2qpKE?=
 =?us-ascii?Q?hHXWWiJpEp7AMUQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HDDSI7rD0YcGyhGEa0rFUooCW2OuE3joVe2I9cZWnbf7/lkkCVFVP9Fd0KCn?=
 =?us-ascii?Q?B+7UJLTkBoCLG94dUetiIk7mDMW51A/eD4FNJoNwmGSaNAp6LAHYwe3TDIph?=
 =?us-ascii?Q?S+NZP8rcllD489UKYqaSdpuQdBvH0CO2r7K6FkUWWdyX+LcTDUINCs5XUpvp?=
 =?us-ascii?Q?oUJXXpgsrhUbrsr+S0foClErD5r6AXyMPsq7n1r65VKJn1+PaiAwIm+YW9r2?=
 =?us-ascii?Q?pD8P75G0JXiJ2N8mV0im5hLIZsgul67MVxJkzJT/5MbO4lECBG9bxhLiE/a5?=
 =?us-ascii?Q?csF4B0E1wA0yxKaRQvC8Q5fItfZjaZ/NwFqqbwXZx20tF/KnkAISQ9J4idFL?=
 =?us-ascii?Q?oo6eck898RzGt0nhVVpfLq3XU+RoSdCK1oNvUTzwEEO0Hrs5qjY6POQz1ToJ?=
 =?us-ascii?Q?isVU+Uvy3Q29uKnlRPyEFAjsy6FCvoH8vfIhO6HHaKBW8Ts2w01FPSjW5VxZ?=
 =?us-ascii?Q?JZlWsxsEfhGa3BrGxIlc31WjBwD7tq15VSsqL0FW1ufdrjXqnCn8KC5no82J?=
 =?us-ascii?Q?7k1vaEpac33XkEd9A0L0UBTQ/fgT9c3mVDXFAxFLOy/+q4MoKfUvQsjmbgnM?=
 =?us-ascii?Q?O2H2h5qyBjcvg03xHDdHvl8vy21eHjKQ4ust/Q3dzpB3+9LIu616Zsaj3MFy?=
 =?us-ascii?Q?ERpHK+01QDsPnG93SwYNNvNZULuq3sg6x+JNeVujgxTo0nJKoCNCltt24LNF?=
 =?us-ascii?Q?O0GRuGP6sez5ShW8N1BjEJ7k5RJaPiU+pmMWULJID/XEhYIx3xXdsyqhIXiJ?=
 =?us-ascii?Q?e7rf0Mmatdgmh8LQuiJ23859hGtnItYeyQheLJqLFHa1K6eoLvoivmOe2eyA?=
 =?us-ascii?Q?rMSa+gU2plRko7PzCwVeWDn4G1PysodlJo6W/fwXnMVG4ECz825dzsiJQMOY?=
 =?us-ascii?Q?O71Jgc9eyBt6B65mBXEXCcYra6JSNtmqRuwWfnZr8XMuOjYLdoMLPiPg9JV7?=
 =?us-ascii?Q?QOY8bVtmchgtVTzUfu0dobbRzdM860dk34hpF2MdW+D5qYxI6OdWFt6o7WsP?=
 =?us-ascii?Q?Jq3yQl+6jbscsF6o1a5ZZhJ6K71wNflJiSnhA8VWYG9KbyUOpNQnCXnWolr6?=
 =?us-ascii?Q?RDoOu78ydAHFL1wc7sYetZuDchydrkJXBh8e1CqYhJTurgayRRNckMApcMwU?=
 =?us-ascii?Q?NKLVFLk+a6jBPYmIlm5CYOyjbo//uepZ+IG/HfCpedPNOkfIEO+l6zxnCUd9?=
 =?us-ascii?Q?LoSIKBafRE5nKw44PRNz3BBUuAZwo+nlj8qKcGSJPG752f49QHGx3L3j696u?=
 =?us-ascii?Q?fpzT+dBKY2LkXcH/CbDPdNvnN823zmGfTiPLoLVJgoL81+r6CtAggIb3hN+F?=
 =?us-ascii?Q?Ycp2prwg8gdmYDL/Rxcs8lvt9UEXPS7bh3e/XycFFFdZiD4PhYigq7+pwar9?=
 =?us-ascii?Q?2yospSuuCPcZ4oCcRP+dmKQCgh6libpUSRAag0y9LESlF/R6cF5reaZcyO1g?=
 =?us-ascii?Q?F+zrwsB4acfzeX0cgZyLUM5HdT5OHa5NUNfr4pDknXO+Krn/4iV9AAL+YSxb?=
 =?us-ascii?Q?EuAK4xrFbTrQ9B7TIacXiLShxxaHCa6tJIph3z7WV8KJ6IoYcEjBNSqXL3hy?=
 =?us-ascii?Q?MX8fzpq1+zVXDuAH44P/Parywsw5GTn8vwTndZbQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49e8e2ef-8d55-4472-71da-08dda9a5ec5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 11:40:25.6358 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DkqwbABsSTLkJ34UTW/ANBBjbGbwAb94V0gL6FbJRsf0szKkab8GZkcz3HNnwnfV6aLzGxCNwdwNq/vH4qkHeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8450
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
> From: Murthy, Arun R <arun.r.murthy@intel.com>
> Sent: Thursday, June 12, 2025 4:43 PM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>;
> nouveau@lists.freedesktop.org; dri-devel@lists.freedesktop.org; intel-
> xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
> Subject: RE: [PATCH 03/13] drm/dp: Add argument for luminance range info =
in
> drm_edp_backlight_init
>=20
> > > > -----Original Message-----
> > > > From: Kandpal, Suraj <suraj.kandpal@intel.com>
> > > > Sent: Monday, April 14, 2025 9:46 AM
> > > > To: nouveau@lists.freedesktop.org;
> > > > dri-devel@lists.freedesktop.org;
> > > > intel- xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> > > > Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> > > > <arun.r.murthy@intel.com>; Kandpal, Suraj
> > > > <suraj.kandpal@intel.com>
> > > > Subject: [PATCH 03/13] drm/dp: Add argument for luminance range
> > > > info in drm_edp_backlight_init
> > > >
> > > > Add new argument to drm_edp_backlight_init which gives the
> > > > drm_luminance_range_info struct which will be needed to set the
> > > > min and max values for backlight.
> > > >
> > > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/display/drm_dp_helper.c               | 5 ++++-
> > > >  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 5 +++--
> > > >  drivers/gpu/drm/nouveau/nouveau_backlight.c           | 5 ++++-
> > > >  include/drm/display/drm_dp_helper.h                   | 1 +
> > > >  4 files changed, 12 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> > > > b/drivers/gpu/drm/display/drm_dp_helper.c
> > > > index 99b27e5e3365..3b309ac5190b 100644
> > > > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > > > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > > > @@ -4227,6 +4227,8 @@ drm_edp_backlight_probe_state(struct
> > > drm_dp_aux
> > > > *aux, struct drm_edp_backlight_i
> > > >   * interface.
> > > >   * @aux: The DP aux device to use for probing
> > > >   * @bl: The &drm_edp_backlight_info struct to fill out with
> > > > information on the backlight
> > > > + * @lr: The &drm_luminance_range_info struct which is used to get
> > > > + the min max when using *luminance override
> > > >   * @driver_pwm_freq_hz: Optional PWM frequency from the driver in
> hz
> > > >   * @edp_dpcd: A cached copy of the eDP DPCD
> > > >   * @current_level: Where to store the probed brightness level, if
> > > > any @@ -
> > > > 4243,6 +4245,7 @@ drm_edp_backlight_probe_state(struct
> drm_dp_aux
> > > > *aux, struct drm_edp_backlight_i
> > > >   */
> > > >  int
> > > >  drm_edp_backlight_init(struct drm_dp_aux *aux, struct
> > > > drm_edp_backlight_info *bl,
> > > > +		       struct drm_luminance_range_info *lr,
> > > Would it be better to have this drm_luminance_range_info inside the
> > > drm_edp_backlight_info?
> >
> > The thing is we fill drm_edp_backlight_info struct in
> > drm_edp_backlight_init Which means we would have to pass it anyways.
> > So having a reference of this in drm_edp_backlight_info didn't make sen=
se.
> >
> The main intention for this ask is two xx_info struct passed as argument.
> Moreover luminance is part of backlight and this new element is _info and
> there already exists backlight_info. So wondering is luminance can be put
> inside backlight_info. The caller of this function can fill the luminance=
 part
> and then make a call.
>=20

I see you point but the thing is luminance range is not something we will b=
e using later and is
only used the set the max level of brightness that can be set.
That being said I do get your point on sending two xx_info struct here, I w=
as thinking we send only the
U32 max luminance here since that's the only one we actually use. Drivers c=
an send the max luminance they like.
What do you think?

Regards,
Suraj Kandpal

> Thanks and Regards,
> Arun R Murthy
> --------------------
