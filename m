Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7505B9E1698
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 10:03:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C200F10E995;
	Tue,  3 Dec 2024 09:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lNoZtD2V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB6C10E991;
 Tue,  3 Dec 2024 09:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733216606; x=1764752606;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lIBkaR7Na5PziF1yFRwnd6S7uCKmGbDF/GGuu1vNyuQ=;
 b=lNoZtD2V+MaGRGHNZMtOV5PB+beXlNYLFMg2sPaXyGgMz+OSSUFPyzpy
 Ask1dWzhsQqytVo6Z3CydzTe6nUnjyhtsukkbFUL17h3HkIMEQq4BJQcB
 4pE7prEnd+VhI18LINcBN9yxLd5pycwpuIPNcfxt8knx8aesR1ZEy9mZ4
 rCywOzV9Y7zM5Qd6DcbZVs3halBCP9AqgKfKL5hojbKs8P3mx6cYnWmqI
 6gxUJnqFXhAkXfvRGC4EqrbeYVnEyYlj3V//WO7zNg7TXocyE8a9+m052
 +db2UTpWnn8dqX7I9MJUr5nrp92q/luLZhGsWydcu1O7XI1ZE/JrWKTKs A==;
X-CSE-ConnectionGUID: KHjkw1awQTi+II01k9Ly3w==
X-CSE-MsgGUID: wqunT4G4TPexccnDBv/cGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="37190597"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="37190597"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 01:03:26 -0800
X-CSE-ConnectionGUID: jIEdjFXySfSCnDlWurxwTw==
X-CSE-MsgGUID: KzUT5IerTNuOfAknEWVLoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="97810632"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Dec 2024 01:03:26 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 01:03:25 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 01:03:25 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 01:03:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bquQBAXvQ6OKhNlHongIoU//fu2U5B6G+0Ed8ZffIBXIKqvjhctK0JVGeSrH84J/Kjjtye15NOZEkfvzHgEEExpyht5mf/7dDCHvlvLN5uHNrlHm8TUzSXLUEN2HGic9XJLRr3OYsDJP7Rzh0vbEzVZ6MJ+Fml8f7o67+haE4zlyn/EMz/VXcvekFUpyMY5PswdHjtiEBie0qRV8qp/Kumpb1oyjZ+mk0ORUzOoP1HbvDy6T9z7scPKd4IW/2aTqutkSeOD3ZNFW9tSbuJKGYlAWQ9pRV1W+qbSWcrTYLtyvehvNQKm5Y+t1ONDQr/IiLfAFW/htFLTjj6MKrOgR6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqjXvahA2m8HOkFKhK3hgNn8/R9y4Iij+t+Tt8xaJBI=;
 b=DWha9jm09cvo8zy33CpsVEVinUgOiifPOdQJz3tcxoE2Xdb5Ya0tjH5UCEH66jdmc8NINVaSOYg4BrAW7qmJS37QC4zrK9u9QR1Zlud/hU772MSwsU+QAKhrXCZJ0WJaQ8TPSQD6IlZG1R71oRZfNNTcG3D1Y2jmve550FuuaeCFLU+SCN2MizFPvCXSCRDnJCdsf8tiFIVRhz661hVIydj3Cttqz9HcgUSnzA7sohAu50ABwF5KJGGoGRQQ+WuNk4jaMqOG0BZqILynCQP9qzO42xpYLhq3D5BjI0Py/0Tj8Hb27t0La2C7Jrrsbp8ZopkrnO0mstL3R1nGNzGjnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 CY5PR11MB6307.namprd11.prod.outlook.com (2603:10b6:930:21::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.18; Tue, 3 Dec 2024 09:03:21 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6%6]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 09:03:21 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "pekka.paalanen@haloniitty.fi" <pekka.paalanen@haloniitty.fi>,
 "sebastian.wick@redhat.com" <sebastian.wick@redhat.com>, "jadahl@redhat.com"
 <jadahl@redhat.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "Kumar, Naveen1"
 <naveen1.kumar@intel.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>
Subject: RE: [v2 02/25] drm: Add support for 3x3 CTM
Thread-Topic: [v2 02/25] drm: Add support for 3x3 CTM
Thread-Index: AQHbQAXePtijgNiPMUC/1IddtFtKf7LPlw8AgAStA9A=
Date: Tue, 3 Dec 2024 09:03:21 +0000
Message-ID: <DM4PR11MB6360EDFC1A8D0C194A44E5D4F4362@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20241126132730.1192571-1-uma.shankar@intel.com>
 <20241126132730.1192571-3-uma.shankar@intel.com>
 <yalwndln5a7apkfj27txgbvwxjgfhdut27wlor6wm6pn2slx7m@jjm6rwfjbfdc>
In-Reply-To: <yalwndln5a7apkfj27txgbvwxjgfhdut27wlor6wm6pn2slx7m@jjm6rwfjbfdc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|CY5PR11MB6307:EE_
x-ms-office365-filtering-correlation-id: 47f68784-1110-41b1-60d2-08dd1379560b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?vymnM0kxIjPSCvJ3URaAXfqGtYYNox8Wk4JPHWH4Nfjc3IqS2+ORxGmuWv0l?=
 =?us-ascii?Q?b5YZT4NAb+DXN6Y7F8IdQ2m1wWRGbr0iwuIP6DQHg8SOBhB8vOgEXpCEiX+k?=
 =?us-ascii?Q?LNnYsfdiufIxYWmWlUoWi6ou9Go0axYU6nYquTCnDIdlfoER/G2uxq8F6Y7x?=
 =?us-ascii?Q?4yT0a04qmq5fCJjG0YveelZWmUITXh2RkyjIAk6mZy+OAxzI+Sd7tRfSI902?=
 =?us-ascii?Q?jfEGuD746a0AaDZGK0UyauAaowcHaysgO9lOMypwdfIaaISqbJAB4cKxm6l4?=
 =?us-ascii?Q?pB6Cr8OdbvB726Z7VIFnbwt8fJ77WuEqXzIHwXvcePID2sfgJpb12zCNjUpG?=
 =?us-ascii?Q?hLvuEarlBnJT320pjjYvjlD4/X38O6Yj7iG5EbeaywjRGugeZYvWmLf7EHrd?=
 =?us-ascii?Q?uVfuH1QY6jKd4YalNhmvk8jjnWgCn/i66BlT9Ihtg69fpRQfEcodbu4HuswO?=
 =?us-ascii?Q?z8+OImE/QWIfl+82NvOKTTHtLrsobzxmlD7mBaUX4WooaZCXHADdE3WsQxdw?=
 =?us-ascii?Q?uW21ZiF1T2MSD4jBiSlk082BNaho6b57mEc5aiujb6YLAuIhlcFuiNLDZWCh?=
 =?us-ascii?Q?d5a4uLaW586eX7V2YaKKJaHPd5ec0Vxs2tnKBBZc34eytL3g31dqEz4Sq9CP?=
 =?us-ascii?Q?4BpLq82HKX2WeI+Sse1Q/GV7MYugoh5c6EJxwU6W6DihWmdDDrRjMDXbzg63?=
 =?us-ascii?Q?7NFDwg/kYc7Ec22iGNKJYOoKraW+onQ1SU0En8MhqN87JMw7K7vtzXk2nVH7?=
 =?us-ascii?Q?1gt1ed7A8aM7dIzbU8v2uMK1qAi2ipesuvxo92ZlvoskQeY/rf2VrRqoypto?=
 =?us-ascii?Q?WXOIxQugRjmmnDs/AolGV5IsN9OyKsBTzfsq5QusvGfrx8u4Srd5sUCujS/Z?=
 =?us-ascii?Q?Z5TU2EQDa9h5DBB8jU3s7SjjHxDomk1oZybmR4wjdocqrIUHEGRNl5adujeb?=
 =?us-ascii?Q?XSdkr/074caHP0whhYIMhdTE1xah5gHRwlw05cy/e6g+nkr6RNpJbzw4nPE3?=
 =?us-ascii?Q?JMOwdEC3HfV8XWlx08+FysbYyiij917syAdOuxBN6ayOuKcn3dcrksugw7sf?=
 =?us-ascii?Q?bP2hxHe4t2D8agPadA3Fk3lYNa5+Zqo+DMXFGQ6c139dBu53PhEbrnnQZnyv?=
 =?us-ascii?Q?Q9b4uVf3c4CRZpPVbVpgvtZ4SnVL8mOmtULmM4Jl31EQsuj6JWrP+dFSQhmX?=
 =?us-ascii?Q?uj/YCILQNX1o03eTK1Duutc+j+GJMeLLK43woBOtCxVSKEdULx+YHs0ST0Cr?=
 =?us-ascii?Q?ElToyA1NjD+AxD9BnEgIh4nJD+AtQOcJdfQH8TWytc6THKZAAb1GygZB3wVU?=
 =?us-ascii?Q?Pg4QcM19sRw6wRwjlfHsLz8j5HjTbSZUFmXeXpeRSUexjHOpWXVjbsDhN1Wi?=
 =?us-ascii?Q?2CbS8CKAaW4GA6X5ufcTHi0U1XhJR+yHmbqg02SREpQ9ZWeKoA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VSlF6U9hJ7AIxwMA9y0cER4Y3Ky01j/QsVWgqpdNrrDZEbiawynseRyDd/T6?=
 =?us-ascii?Q?hTjuppKpWvu8OItkBOQH4A7Dpz+PUUHwrI1P5+AnPXRAZDrqH46syIvMy8wG?=
 =?us-ascii?Q?oFuJh7zoHmu77UyUiz7orizT/vi4Tz90WjwWv5j93OsziGxZdQPRTki6s/3a?=
 =?us-ascii?Q?ZzBN/nS5pM35Orm55YoK7vNNOptwnn0x0P/Is9OR3P4hPCam5JCPKve7vdcI?=
 =?us-ascii?Q?FC79uc5wJ/rvVdkiPrhw8K4n4Tlkr/X1WRnKaSlTshh41OxdogkeDld0k5Gr?=
 =?us-ascii?Q?F7BkkBAHOtI+lHgzHLzNlR0dwOGW2y2WO2aBJqvWkg8w0vCihP6DpzJEHoLE?=
 =?us-ascii?Q?e+HIcgfGXVXbTDbMJU/6nrnB63Z7veY18StlG7hcqhX1M5ftl0S+joXKZ+mB?=
 =?us-ascii?Q?QsvlC86uykWW6eyDoER/o95yBDAxPa4XR0GhRvVBBmFHMZ+/fP7VmEXFE8Lb?=
 =?us-ascii?Q?cuSFDTGNfJjivw1ZPIYi5dnpWdfDHME6v+NdUcM4C7voXGb39pITB91ghezN?=
 =?us-ascii?Q?APfI3wn4Nny4TtfEy14iAv5wdPnaEikBrnUe5H9oxJSsTsXGuiGfauvb+vCD?=
 =?us-ascii?Q?SMS+x/vKx+I/yTzn3iEE6iQGd7PzlClEqMUnXdh/CaHlosy600yIoVapgQAl?=
 =?us-ascii?Q?YAxekY+jOsNLRSVAYk9q0vjpxS0T7yTTiagU4sj4A5LIlYqVYJjUdhp8+70f?=
 =?us-ascii?Q?fE4iuqJCRl50wXMWkUYBZgW2useHZxVumj13xDNWhoq0E9AC9xo7O/X6R5Vt?=
 =?us-ascii?Q?AhdTyLsLgiBzUY2d4jUGszYc+7PzEo8eTtU7N3sqnsD1uCl5+kgLg4bWMHPE?=
 =?us-ascii?Q?ljCyYpoCz1pWPY3fdN0jrP/9/prNU35L4A+uTjvPgi0ZHsVXhczi51tZ8xJb?=
 =?us-ascii?Q?uRu86ETn6TBT/+pobQXmSMG6jZd/fOzqlpOfkB8aggwShAk69d3KRua1O7CN?=
 =?us-ascii?Q?1FsVfFB2bTISrN6NEndYcWd9+sgiYOnHUJ2RuM3n3DWrqddaaorUvbP9aC1T?=
 =?us-ascii?Q?UAUYRYBg4rRm9eOIE4kUPr+CBSQtC08UFygLk6GCM0SgKmmP1qrzXl7EjOX1?=
 =?us-ascii?Q?+5ax7pARmpoFt3Z7ZEeL1WsZuuSHELlTGgAtOWvS8/6e4YBLpRI5mn8NQ8il?=
 =?us-ascii?Q?JyKwhLYPjJg6WI5PZfMO9PMJs30M5I3jdTvR4DPH1zxFAst/WHQws1BPj2NH?=
 =?us-ascii?Q?+PhOStI/n82W4SSvksa4LHJp4V6u83Dmm+4KzeOV1hyNCZwAvhkTC+7VH//D?=
 =?us-ascii?Q?skkYxjmMNj8gv1PIuhAvStzoR0DtHdNki9kN1tCQLhVUbiOLgwACcGWgkIsX?=
 =?us-ascii?Q?nLK0Up98PSHmxWfoTrKadkhw6aDNyQKDrpeRpBu/FjYbvBC6o90phqH0AXR8?=
 =?us-ascii?Q?ni4mNtO1TpjCJywNY7YXSU+8V26dBlbbb6pJT0xbk9HZ5UVk8N5D7GTJdkH3?=
 =?us-ascii?Q?hC7IBbsGlS2cihgnSf6UjUcJpcNMcCklkvc3AEjXmFihPh5Jaiedy8kx0jCY?=
 =?us-ascii?Q?8p6wNGChEi7yikr3locdTA3M9EUZ4A6VhHirHVG4/oVWp2uGpSck0m8MHOu/?=
 =?us-ascii?Q?JqIwp3O1aRAVeeS/pxJTlbn8pJx31qQ21TGDhBbC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f68784-1110-41b1-60d2-08dd1379560b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2024 09:03:21.2000 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dNP/b0+AW1RPfvvnS6dboL+tVziFZAGnlTiMYKzjnstYcp+/zoWqL7lZ4hTW3X8zDMKRYBB1idjW4MqPKTdXsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6307
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
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Dm=
itry
> Baryshkov
> Sent: Saturday, November 30, 2024 3:08 PM
> To: Shankar, Uma <uma.shankar@intel.com>
> Cc: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; int=
el-
> xe@lists.freedesktop.org; ville.syrjala@linux.intel.com;
> harry.wentland@amd.com; pekka.paalanen@haloniitty.fi;
> sebastian.wick@redhat.com; jadahl@redhat.com; mwen@igalia.com;
> contact@emersion.fr; Kumar, Naveen1 <naveen1.kumar@intel.com>; Borah,
> Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Subject: Re: [v2 02/25] drm: Add support for 3x3 CTM
>=20
> On Tue, Nov 26, 2024 at 06:57:07PM +0530, Uma Shankar wrote:
> > From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> >
> > Add support for 3x3 Color Transformation Matrices in Color Pipeline.
> >
> > Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > ---
> >  drivers/gpu/drm/drm_atomic.c      |  3 +++
> >  drivers/gpu/drm/drm_atomic_uapi.c |  3 +++
> >  drivers/gpu/drm/drm_colorop.c     | 29 +++++++++++++++++++++++++++++
> >  include/drm/drm_colorop.h         |  2 ++
> >  include/uapi/drm/drm_mode.h       |  8 ++++++++
> >  5 files changed, 45 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic.c
> > b/drivers/gpu/drm/drm_atomic.c index 3161e2ab4efc..8a75f4a0637a 100644
> > --- a/drivers/gpu/drm/drm_atomic.c
> > +++ b/drivers/gpu/drm/drm_atomic.c
> > @@ -802,6 +802,9 @@ static void drm_atomic_colorop_print_state(struct
> drm_printer *p,
> >  		drm_printf(p, "\tinterpolation=3D%s\n",
> drm_get_colorop_lut1d_interpolation_name(colorop->lut1d_interpolation));
> >  		drm_printf(p, "\tdata blob id=3D%d\n", state->data ? state->data-
> >base.id : 0);
> >  		break;
> > +	case DRM_COLOROP_CTM_3X3:
> > +		drm_printf(p, "\tdata blob id=3D%d\n", state->data ? state->data-
> >base.id : 0);
> > +		break;
> >  	case DRM_COLOROP_CTM_3X4:
> >  		drm_printf(p, "\tdata blob id=3D%d\n", state->data ? state->data-
> >base.id : 0);
> >  		break;
> > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c
> > b/drivers/gpu/drm/drm_atomic_uapi.c
> > index d6c71135f290..ba68358c0ffe 100644
> > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > @@ -708,6 +708,9 @@ static int drm_atomic_color_set_data_property(struc=
t
> drm_colorop *colorop,
> >  	case DRM_COLOROP_CTM_3X4:
> >  		size =3D sizeof(struct drm_color_ctm_3x4);
> >  		break;
> > +	case DRM_COLOROP_CTM_3X3:
> > +		size =3D sizeof(struct drm_color_ctm);
> > +		break;
> >  	case DRM_COLOROP_3D_LUT:
> >  		index =3D state->lut_3d_mode_index;
> >  		if (index >=3D (state->lut_3d_modes->length / sizeof(struct
> > drm_mode_3dlut_mode))) diff --git a/drivers/gpu/drm/drm_colorop.c
> > b/drivers/gpu/drm/drm_colorop.c index fd1cd934df48..a427cfc5bbbc
> > 100644
> > --- a/drivers/gpu/drm/drm_colorop.c
> > +++ b/drivers/gpu/drm/drm_colorop.c
> > @@ -315,6 +315,35 @@ int drm_colorop_ctm_3x4_init(struct drm_device
> > *dev, struct drm_colorop *colorop  }
> > EXPORT_SYMBOL(drm_colorop_ctm_3x4_init);
> >
> > +/**
> > + * drm_colorop_ctm_3x3 - Initialize a DRM_COLOROP_CTM_3X3
>=20
> Please build with W=3D1 to trigger kerneldoc warnings. Here the prototype=
 in the
> doc comment doesn't match the actual function name.

Thanks Dmitry for the feedback. Yeah we missed it.
Will fix it in the next version.

Regards,
Uma Shankar

> > + *
> > + * @dev: DRM device
> > + * @colorop: The drm_colorop object to initialize
> > + * @plane: The associated drm_plane
> > + * @allow_bypass: true if BYPASS property should be created, false if =
bypass of
> > + *                this colorop is not possible
> > + * @return zero on success, -E value on failure  */ int
> > +drm_colorop_ctm_3x3_init(struct drm_device *dev, struct drm_colorop
> *colorop,
> > +			     struct drm_plane *plane, bool allow_bypass) {
> > +	int ret;
> > +
> > +	ret =3D drm_colorop_init(dev, colorop, plane, DRM_COLOROP_CTM_3X3,
> allow_bypass);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D drm_colorop_create_data_prop(dev, colorop);
> > +	if (ret)
> > +		return ret;
> > +
> > +	drm_colorop_reset(colorop);
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(drm_colorop_ctm_3x3_init);
> > +
> >  /**
> >   * drm_colorop_mult_init - Initialize a DRM_COLOROP_MULTIPLIER
> >   *
> > diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> > index bf5117f30c80..56b51fafebdf 100644
> > --- a/include/drm/drm_colorop.h
> > +++ b/include/drm/drm_colorop.h
> > @@ -377,6 +377,8 @@ int drm_colorop_curve_1d_lut_init(struct drm_device
> *dev, struct drm_colorop *co
> >  				  struct drm_plane *plane, uint32_t lut_size,
> >  				  enum drm_colorop_lut1d_interpolation_type
> lut1d_interpolation,
> >  				  bool allow_bypass);
> > +int drm_colorop_ctm_3x3_init(struct drm_device *dev, struct drm_coloro=
p
> *colorop,
> > +			     struct drm_plane *plane, bool allow_bypass);
> >  int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_coloro=
p
> *colorop,
> >  			     struct drm_plane *plane, bool allow_bypass);  int
> > drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop
> > *colorop, diff --git a/include/uapi/drm/drm_mode.h
> > b/include/uapi/drm/drm_mode.h index 290c2e32f692..a4a7ab689631 100644
> > --- a/include/uapi/drm/drm_mode.h
> > +++ b/include/uapi/drm/drm_mode.h
> > @@ -905,6 +905,14 @@ enum drm_colorop_type {
> >  	 */
> >  	DRM_COLOROP_CTM_3X4,
> >
> > +	/**
> > +	 * @DRM_COLOROP_CTM_3X3:
> > +	 *
> > +	 * A 3x3 matrix. Its values are specified via the
> > +	 * &drm_color_ctm struct provided via the DATA property.
> > +	 */
> > +	DRM_COLOROP_CTM_3X3,
> > +
> >  	/**
> >  	 * @DRM_COLOROP_MULTIPLIER:
> >  	 *
> > --
> > 2.42.0
> >
>=20
> --
> With best wishes
> Dmitry
