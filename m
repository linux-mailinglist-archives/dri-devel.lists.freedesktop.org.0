Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F2BAD2FDE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 10:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904B610E491;
	Tue, 10 Jun 2025 08:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ob5gJWPM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D6F10E485;
 Tue, 10 Jun 2025 08:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749543675; x=1781079675;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4waiilDd4i3H/CoUX4EwbhClC00S2qB0ltxUpVX6OK8=;
 b=Ob5gJWPM58+bLU8uRu+iPy3IIux53EGp9vcc2EnazOIewsFakLUAg6La
 prcg7epsFLJs8EZ26kGdbqskEX+EVhat7dbTx+YzNgirQPr4kQFhc+uZf
 Z9rlhZr901BHGT7fPCjtApzqlfpjBjA67rh/w1BZLGeNQ7EaS23GquhCT
 a6JOb5iZswDM8fl4WHaIxntTu9sGShAI3X5SfGLtZmgiSl5slcwkMmiOg
 WQQ4FQXY5wXNLZ/WAqN4/vgJcDR7U7yygTztsoSiKWQcGsjg9HN/rprq5
 SOkkJxEYP7vS1FS3EPQCYyXjpAYVXObh1W4M8YxCH13JtuKHkmZBOsYX6 g==;
X-CSE-ConnectionGUID: OYQvMkYXSz+mj0vCmG7shA==
X-CSE-MsgGUID: sFNkNId4T3KkN+l3TpKf5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51784578"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="51784578"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 01:21:15 -0700
X-CSE-ConnectionGUID: GMjQP9X1R9+W59xjRvvDtg==
X-CSE-MsgGUID: NOY4eYwiQlaTRiEkWIGoRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="147276922"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 01:21:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 01:21:13 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 01:21:13 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.72)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 01:21:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iwt4OxE/1yLFi+FmE/daJir+F2Jw4pqoqTICTSaHLnJsqSfJtuTEKw5Y/+TWnUxM9JN/FNVCXargPtA8hhhXcY0kLMr/wpgEtexVLkC1udF1nVhohC9F3fI/A+fjpWJhKflzSSfWYesbCRmB8ww3HaTHvN50+309H7Iohhszf7qTd8sPh2j3fbbgEqt2ERkwmdYwg8b6cownecCDUgFGVgOxJrbXwGN4BfYDaxWKPxItxFetwArC7o83rb1zmehYQ403XT5mavPMMzmkTibaXnoH25eOh1nVbWQ11M1uXr3CmQe2xnouYTD82Sw24V8i1Yy5Oit3Fh0AKyJCPDTpgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FX+LSVaErHjAmYEwSul5rZzjFyo0IKj2nzTaWNW4coA=;
 b=smw43EgBaXdjXW+jit7k6O9JH3QnlKx+sjaEXpOucuBYkXMMvlpWTJY6iU2944poGHwHS6iuy7ndd1yG5i5OwuCVBHK/QspijE6cTugb8M6EXbnDaxaiM3QgDT229R26zOqZXbsnUHRDZv8OguaVGmSFv+wYUxrwNfcrr3x1bGvyGduQRu51c1WBPesm4R2EZr1AryfNu3QhA0H/ITdJ0rsB5E7kGhurSycTwmdFkuMfr3n4SyIT4FkeCd4xjrZvP3Ovtlzmf1GhyPbS65gu/Rjx/n647+gjXZH9fWcwKaMAnJ71KPo9D/kuY0NrcFLwRIaMjDd07xu4h52aj5K7Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7300.namprd11.prod.outlook.com (2603:10b6:610:150::21)
 by DM4PR11MB6214.namprd11.prod.outlook.com (2603:10b6:8:ac::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.26; Tue, 10 Jun 2025 08:21:05 +0000
Received: from CH3PR11MB7300.namprd11.prod.outlook.com
 ([fe80::cfdc:6323:1353:350d]) by CH3PR11MB7300.namprd11.prod.outlook.com
 ([fe80::cfdc:6323:1353:350d%4]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 08:21:05 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Heikki
 Krogerus" <heikki.krogerus@linux.intel.com>, "Wysocki, Rafael J"
 <rafael.j.wysocki@intel.com>, "Lee, Shawn C" <shawn.c.lee@intel.com>, "Yang,
 Simon1" <simon1.yang@intel.com>, Doug Anderson <dianders@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH 3/4] drm/i915/panel: register drm_panel and call
 prepare/unprepare for ICL+ DSI
Thread-Topic: [PATCH 3/4] drm/i915/panel: register drm_panel and call
 prepare/unprepare for ICL+ DSI
Thread-Index: AQHb1sJZilAE3PzbnEObGpeQxNN2KLP8EHJw
Date: Tue, 10 Jun 2025 08:21:05 +0000
Message-ID: <CH3PR11MB73009C44BA5A2F9A4A56DCB5BA6AA@CH3PR11MB7300.namprd11.prod.outlook.com>
References: <cover.1749199013.git.jani.nikula@intel.com>
 <13d15c1414e65ffb21944d66e2820befdab54e98.1749199013.git.jani.nikula@intel.com>
In-Reply-To: <13d15c1414e65ffb21944d66e2820befdab54e98.1749199013.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7300:EE_|DM4PR11MB6214:EE_
x-ms-office365-filtering-correlation-id: 831c08a2-0fe4-4530-771f-08dda7f7be98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?rd1ZLbThpmuj/C+oLjLxEbNZodViHXkFwj3LVnAw/MsvEQGQnPnZS+2tGDeH?=
 =?us-ascii?Q?fA496dwNyGWLJ7W3zHYtJsg5lfvBV/0V/EvLWgJVOcLz+Y4NZLOBztcJmlzS?=
 =?us-ascii?Q?POuSzr6s8+opucIFaXbFwPcPPbyS9Sk1GI3A4VnkBM+5ZSHshNZsdRWsX3Nq?=
 =?us-ascii?Q?eEeuzLaeiqQnG6UhOY3Pz6VVfi8HU93KooqEOAiI+ix3e+UXnG7BJCrTpkTl?=
 =?us-ascii?Q?+YR3f7COStz73FFEJIFmaiZUcfPkgyKVF5BOUVcAFVKNUoi3IpY0TwQxWAc3?=
 =?us-ascii?Q?O8iqW2TdSyxEG0QMjgUTYIPEego+D11fpu5Tr9Q0haG8asBrtUAMGN5/eoTz?=
 =?us-ascii?Q?g3BsoJDQ8sghxNgy3tIvb53lavP+8Vu+18EAJTahk1loAqCc3P7cdaRqLeVr?=
 =?us-ascii?Q?pVlCkI8awp7ckQjNxFVJFLIbCLTGhUXEVDxytNmiuK9TUw64+m2dsmgi+vT4?=
 =?us-ascii?Q?NXCJRNCFQHnEV+9OvtiD4U0bvd3zu4Tr2045Fc1lmA9tNdIKOEDI1nnBPY0Y?=
 =?us-ascii?Q?vAAsCzhzxhhcu6o1AgYMdFaJgNT9zBH3fkA3Ee97oRjd9PDczxARSY51ytky?=
 =?us-ascii?Q?YR7I3x3rF/po6ObdwMbmFgZ6Igqd7vkPmz1ill0saL5NCOX58cFnwo7QkiNJ?=
 =?us-ascii?Q?MeyayUWivfy2YgXKGtelPWIH+iJzv1wjcpWByeyy0K8eIdSoiQbN1rF/2cwM?=
 =?us-ascii?Q?yk+/p0UqUxZoW66RIGQuGSMdW32xpqjk1s6gz9NEsSzSmpH9gyEcRF1NBgI+?=
 =?us-ascii?Q?Q6XuCsn90/G9NeKZl0gyizK5bo6U+8Zii+tmI0JLbwIwyF24+BgP506JXa+p?=
 =?us-ascii?Q?D8ulL883JuN8YVvsCHElLq3hJRcmOY9N7ralCeHaki6rRPli+ReBiyJAN4rE?=
 =?us-ascii?Q?/36oL7R0jmQ94V77vfb+rgd4Lkk8EX9Ee26zB5UIPlRt70LPB7VNzGBQfIx2?=
 =?us-ascii?Q?Nw0T3uNq6daNhm1yUrpbgowjlutx3X4kCgzK4SqlhcRCUR2nSoPd8Lii261x?=
 =?us-ascii?Q?w3kWpXb6dk4smbjG98FSx5CBvmzDuaTSTXltBGNN8A5p7y0Hm/ks6h8d2rUx?=
 =?us-ascii?Q?8kdTmSN1XOAoRM+KcBpWT7T07xeTfOs7WMQh/TCHyZqO0zqgRfu9UYzdOOn1?=
 =?us-ascii?Q?wStiszogP/u8k+a4iKQJeChPMIuk/hs+y0bKHfKYNN0C08Gx+P6p+Fta/sGm?=
 =?us-ascii?Q?bFVlPRUygJuwya8zQkY5Ngn6XLxyB8G7AG1XoXd7pNedEv7gS/3Hm6boKGuW?=
 =?us-ascii?Q?bLZ+0NKhHjEslrhNBBY6T2CGVEI0E7GxTh/eD8P36J+L+E/JrwoJEHrjM0rS?=
 =?us-ascii?Q?gKqJOsDI4nYpBs0BJA9K/T/l+KmpuKhVS2SdZPCuifPLeGdLttkOnt0w8PNx?=
 =?us-ascii?Q?SSGyipnE/TsUC6OFSavaCf8NO1CDT7WjMB7rEEC4T39tTiKTb6cwevGj5WWi?=
 =?us-ascii?Q?aq7lnGk23fCHb7YOd+tlQC76wKk7ni3JPvyXRueHUd9+6alfiNP0t7pM+DlY?=
 =?us-ascii?Q?fCjRjRQzyu05bg0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7300.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OoTIsK5Z24bbDyOnfoxFn/S3GDUlp9z5XjKEghFo8lsT9xxCtG3/0j2xtHoN?=
 =?us-ascii?Q?ynf+b0Y/SmRfZwd1UTv7SR0EPXA0flktFbPDo1RMpRED6niKeSfOEaOuhhIy?=
 =?us-ascii?Q?ODXlTIL7bnIl5YEIvHVst3bU1ku8hooi2/1QxqIZ9qq6irv6oYTV3qdsSynY?=
 =?us-ascii?Q?14GfjFLxJ9hm3HeydvO69SIz8lOH9gBRyDJCH2fIpRxmpnLygrZuan7c/xVe?=
 =?us-ascii?Q?tj1KFBhvxzRm0cRwZ2PZTBXm3zO2k247xaDo9oF6i2U1dmjOf1yIZIRF48y6?=
 =?us-ascii?Q?wW5vAoOP+gFbn3XW6ywb3uiyS1bseoO4fEyN6iMsetrsyZFBUPMvfhM9A1BQ?=
 =?us-ascii?Q?visNiiaPt3DaRMfb9X0LRCKMeHRMJ4DfRbZuFhCmlJdpNOVHVRRBJQJClPmX?=
 =?us-ascii?Q?sBR+42sVPqZHua9BWuOWviQeyD/BRWmABRSiWoaH6RjEAaj9PBdoTZm9oN7Y?=
 =?us-ascii?Q?Cu3W+Yj6LGWSQTyHvAT8dcDjUbJ7otWoSpbSZQMWBikQYIMbWau4oJnXDDKQ?=
 =?us-ascii?Q?/JCOe9E1VhY5MQmXTTvUTLyJLvGhNa7EaPsSWtYIaruOfwFx2OmAdg3kU1AB?=
 =?us-ascii?Q?p66u1HJuWY+BpTcWu2JEMHY9+pQsvKoP+Bt7ssjy2rgLyKkDjGo4sDYf+mqz?=
 =?us-ascii?Q?Q2ZPj97l2FN2mo4FmQMl52nRf+T26vXfxcoE4GZPvQpWTVSmJQjOS14nNe1E?=
 =?us-ascii?Q?PbHO1BvRZOumog5pQTRUJZDKat0H5u3Tg7Blou7g4llSDMMU1LpCZ8savD05?=
 =?us-ascii?Q?+iYhUVizpNspY1h4esgGDcQcr/8l2HsFC3XIDOU8tsW7k9UnpdX+dcQXK4uV?=
 =?us-ascii?Q?FtAWJ+yn6KYwbbpsrO7JxVIe+yazGEp2kw8pSQ72ooBxXKLpM5+uWFJiFED0?=
 =?us-ascii?Q?KQjGvjQQSEkXsR82TgP9xjrlCwyko/Cecj80QfCG1/yhn5FvbTPkI7B4Gl/j?=
 =?us-ascii?Q?ki56l1s5irGiOp9AfOzp24wUfF78jrTN0QPjJf1YV8IlNpijyAC30o+I2hgN?=
 =?us-ascii?Q?ZrSm40kpDLUoNIVN5gALvRCn2MUuJuSL9MQ2SGW4GzjBozwGvUW2+/9zPM73?=
 =?us-ascii?Q?UzGfyWUEk0SS7wgJ10vGt+Ag3JroCi/iW8UNa0Yi3enMmUsEhQlvWnLBh0tk?=
 =?us-ascii?Q?ds7hrfhwKMNFJ4smae0ezNX2JxBayVdK8Mw1cGZSyWjvQbkRjb4nmnXJdEp6?=
 =?us-ascii?Q?itmll8BuC9RCxxkvA7gZzeZ7QUnKWyVuzdDel8PC7w/aHIaSfnODos6o4lJj?=
 =?us-ascii?Q?lY0Z3EhTih6ibLW3orJj8Ib/QEtzbkwdj8l6aU+VWuUkFqNXS04hUj2/5peJ?=
 =?us-ascii?Q?8/ntvKs9jQBDEMuP7kDrAtg7nyUqEvM+xIs6PlZGELZM5HdrntBVcDcEl7FT?=
 =?us-ascii?Q?Qs/zUaEZBM0PvIJ/JsUmMRDTsKJwXjvno5NzvEW5mzTUkYC1Bgu0qB+4C7/H?=
 =?us-ascii?Q?mP9fWEKbpcWxl4CMtSg4g1nVKSddh/JGlPYGzuof9whBPZajWQIRbxt8Zr39?=
 =?us-ascii?Q?QsLyJbScapCJFtIz2FeokuOStHCkgWMbk0WWOUQejtIrfoM3w7za794/QGmH?=
 =?us-ascii?Q?bDkMbxbAYjcWwdeEoz4adAYzWBc8crWCwSS+EVBM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7300.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 831c08a2-0fe4-4530-771f-08dda7f7be98
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 08:21:05.2769 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wJA4ZLGd0IxINJ2fhYYdMTDf1iw0IRU1RQ8oGMxObnFi3rIC0e8aZCWj/Jv8iqVPMLDN5lKlb86lpVO7y2XHrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6214
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
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Ja=
ni
> Nikula
> Sent: Friday, June 6, 2025 2:35 PM
> To: dri-devel@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Heik=
ki
> Krogerus <heikki.krogerus@linux.intel.com>; Wysocki, Rafael J
> <rafael.j.wysocki@intel.com>; Lee, Shawn C <shawn.c.lee@intel.com>; Yang,
> Simon1 <simon1.yang@intel.com>; Doug Anderson <dianders@chromium.org>;
> Maxime Ripard <mripard@kernel.org>; Nikula, Jani <jani.nikula@intel.com>
> Subject: [PATCH 3/4] drm/i915/panel: register drm_panel and call
> prepare/unprepare for ICL+ DSI
>=20
> Allocate and register a drm_panel so that drm_panel_followers can find th=
e
> panel. Pass the drm_connector::kdev device to drm_panel allocation for
> matching. That's only available after drm_sysfs_connector_add(), so we ne=
ed to
> postpone the drm_panel allocation until .late_register() hook.
>=20
> The drm_panel framework is moving towards devm_drm_panel_alloc(). It
> requires a wrapper struct, and struct intel_panel would be the natural
> candidate. However, we can't postpone its allocation until .late_register=
(), so we
> have to use __devm_drm_panel_alloc() directly for now.
>=20
> Call the drm_panel_prepare() and drm_panel_unprepare() functions for
> ICL+ DSI, so that followers get notified of the panel power state
> changes. This can later be expanded to VLV+ DSI and eDP.
>=20
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Lee Shawn C <shawn.c.lee@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/icl_dsi.c        |  4 +
>  .../drm/i915/display/intel_display_types.h    |  4 +
>  drivers/gpu/drm/i915/display/intel_panel.c    | 82 ++++++++++++++++++-
>  drivers/gpu/drm/i915/display/intel_panel.h    |  4 +
>  4 files changed, 93 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c
> b/drivers/gpu/drm/i915/display/icl_dsi.c
> index 026361354e6f..81410b3aed51 100644
> --- a/drivers/gpu/drm/i915/display/icl_dsi.c
> +++ b/drivers/gpu/drm/i915/display/icl_dsi.c
> @@ -1276,6 +1276,8 @@ static void gen11_dsi_enable(struct
> intel_atomic_state *state,
>  	intel_backlight_enable(crtc_state, conn_state);
>  	intel_dsi_vbt_exec_sequence(intel_dsi, MIPI_SEQ_BACKLIGHT_ON);
>=20
> +	intel_panel_prepare(crtc_state, conn_state);
> +
Should this be done before the intel_backlight_enable() ?

>  	intel_crtc_vblank_on(crtc_state);
>  }
>=20
> @@ -1409,6 +1411,8 @@ static void gen11_dsi_disable(struct
> intel_atomic_state *state,  {
>  	struct intel_dsi *intel_dsi =3D enc_to_intel_dsi(encoder);
>=20
> +	intel_panel_unprepare(old_conn_state);
> +
>  	/* step1: turn off backlight */
>  	intel_dsi_vbt_exec_sequence(intel_dsi, MIPI_SEQ_BACKLIGHT_OFF);
>  	intel_backlight_disable(old_conn_state);
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index ed4d743fc7c5..30c7315fc25e 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -37,6 +37,7 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_framebuffer.h>
> +#include <drm/drm_panel.h>
>  #include <drm/drm_rect.h>
>  #include <drm/drm_vblank_work.h>
>  #include <drm/intel/i915_hdcp_interface.h> @@ -384,6 +385,9 @@ struct
> intel_vbt_panel_data {  };
>=20
>  struct intel_panel {
> +	/* Simple drm_panel */
> +	struct drm_panel *base;
> +
>  	/* Fixed EDID for eDP and LVDS. May hold ERR_PTR for invalid EDID. */
>  	const struct drm_edid *fixed_edid;
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_panel.c
> b/drivers/gpu/drm/i915/display/intel_panel.c
> index 5ae302bee191..b1d549e6cf53 100644
> --- a/drivers/gpu/drm/i915/display/intel_panel.c
> +++ b/drivers/gpu/drm/i915/display/intel_panel.c
> @@ -463,12 +463,92 @@ void intel_panel_fini(struct intel_connector
> *connector)
>  	}
>  }
>=20
> +const struct drm_panel_funcs dummy_panel_funcs =3D { };
> +
>  int intel_panel_register(struct intel_connector *connector)  {
> -	return intel_backlight_device_register(connector);
> +	struct intel_display *display =3D to_intel_display(connector);
> +	struct intel_panel *panel =3D &connector->panel;
> +	int ret;
> +
> +	ret =3D intel_backlight_device_register(connector);
> +	if (ret)
> +		return ret;
> +
Do we need to assign the backlight_device created in intel_backlight_device=
_register() to the element backlight in struct drm_panel, so as to use the =
drm_panel framework for panel backlight control?

Thanks and Regards,
Arun R Murthy
-------------------

> +	if (connector->base.connector_type =3D=3D DRM_MODE_CONNECTOR_DSI)
> {
> +		struct device *dev =3D connector->base.kdev;
> +		struct drm_panel *base;
> +
> +		/* Sanity check. */
> +		if (drm_WARN_ON(display->drm, !dev))
> +			goto out;
> +
> +		/*
> +		 * We need drm_connector::kdev for allocating the panel, to
> make
> +		 * drm_panel_add_follower() lookups work. The kdev is
> +		 * initialized in drm_sysfs_connector_add(), just before the
> +		 * connector .late_register() hooks. So we can't allocate the
> +		 * panel at connector init time, and can't allocate struct
> +		 * intel_panel with a drm_panel sub-struct. For now, use
> +		 * __devm_drm_panel_alloc() directly.
> +		 *
> +		 * The lookups also depend on drm_connector::fwnode being
> set in
> +		 * intel_acpi_assign_connector_fwnodes(). However, if that's
> +		 * missing, it will gracefully lead to -EPROBE_DEFER in
> +		 * drm_panel_add_follower().
> +		 */
> +		base =3D __devm_drm_panel_alloc(dev, sizeof(*base), 0,
> +					      &dummy_panel_funcs,
> +					      connector->base.connector_type);
> +		if (IS_ERR(base)) {
> +			ret =3D PTR_ERR(base);
> +			goto err;
> +		}
> +
> +		panel->base =3D base;
> +
> +		drm_panel_add(panel->base);
> +
> +		drm_dbg_kms(display->drm, "[CONNECTOR:%d:%s] Registered
> panel device '%s', has fwnode: %s\n",
> +			    connector->base.base.id, connector->base.name,
> +			    dev_name(dev), str_yes_no(dev_fwnode(dev)));
> +	}
> +
> +out:
> +	return 0;
> +
> +err:
> +	intel_backlight_device_unregister(connector);
> +
> +	return ret;
>  }
>=20
>  void intel_panel_unregister(struct intel_connector *connector)  {
> +	struct intel_panel *panel =3D &connector->panel;
> +
> +	if (panel->base)
> +		drm_panel_remove(panel->base);
> +
>  	intel_backlight_device_unregister(connector);
>  }
> +
> +/* Notify followers, if any, about power being up. */ void
> +intel_panel_prepare(const struct intel_crtc_state *crtc_state,
> +			 const struct drm_connector_state *conn_state) {
> +	struct intel_connector *connector =3D to_intel_connector(conn_state-
> >connector);
> +	struct intel_panel *panel =3D &connector->panel;
> +
> +	drm_panel_prepare(panel->base);
> +}
> +
> +/* Notify followers, if any, about power going down. */ void
> +intel_panel_unprepare(const struct drm_connector_state *old_conn_state)
> +{
> +	struct intel_connector *connector =3D to_intel_connector(old_conn_state=
-
> >connector);
> +	struct intel_panel *panel =3D &connector->panel;
> +
> +	drm_panel_unprepare(panel->base);
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_panel.h
> b/drivers/gpu/drm/i915/display/intel_panel.h
> index 3d592a4404f3..56a6412cf0fb 100644
> --- a/drivers/gpu/drm/i915/display/intel_panel.h
> +++ b/drivers/gpu/drm/i915/display/intel_panel.h
> @@ -53,4 +53,8 @@ void intel_panel_add_vbt_sdvo_fixed_mode(struct
> intel_connector *connector);  void intel_panel_add_encoder_fixed_mode(str=
uct
> intel_connector *connector,
>  					struct intel_encoder *encoder);
>=20
> +void intel_panel_prepare(const struct intel_crtc_state *crtc_state,
> +			 const struct drm_connector_state *conn_state); void
> +intel_panel_unprepare(const struct drm_connector_state
> +*old_conn_state);
> +
>  #endif /* __INTEL_PANEL_H__ */
> --
> 2.39.5

