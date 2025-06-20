Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DEDAE12A9
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 06:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2B810EAC7;
	Fri, 20 Jun 2025 04:55:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TEHKmNhO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A595110EAB4;
 Fri, 20 Jun 2025 04:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750395321; x=1781931321;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p/tH1x39gnGzk9Oh0o+unCcyj7Q/wlc9KMf7Nje+aJA=;
 b=TEHKmNhONvL+ozYHYuUdRYvsV79Ht8tI43gyQGSHV9ri0jA1VjqszzdO
 wtfu0PPoOYJT5NBexfXT9SSudsWLyT18hTZWCQ0tTeQo75GmYlTYpyADk
 dydKutlqL5QzIkuxKZ7mgENblhETZLVP3iG92gdVNKzM970ldNwqQWfBY
 tXKxNm1QXm0arUahobP8UAR2nXfRmozuN/qWm5PHmuFYjz6/nWn1W05Eo
 S7S5tccnoVM/mnRTf3Kr/YjixasnQcpWCPNoTQClrpEhyg7PK2whj3UrX
 rdu/BaEMQOVJ9rk/k6IlEB+MsrUoxTPp0jNmFiVQoot8t/zgeWefzlP1l A==;
X-CSE-ConnectionGUID: 8l50e/uQSXmypqIfzWLTcg==
X-CSE-MsgGUID: pRWSJpYBQPioYJVOVcfRqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52574037"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="52574037"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 21:55:21 -0700
X-CSE-ConnectionGUID: J69vRYzPSFezFzoYJ54vng==
X-CSE-MsgGUID: dpz7oGgkR66lK2yIYSFn1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="150297349"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 21:55:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 21:55:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 19 Jun 2025 21:55:20 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.60)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 21:55:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PxdO+om0VzYk55xJy7S93lH5aV+ZUJ4ZyQzGmRrl2P02OaKztr9/zor94+fkupsCYuJm/q5AeRYcqt6kb700KQA7HJH/HDlY4eu+CAu36wn6z06+igT6gqZ1gu/kBspn4aHmNIXuXb4hlj/0UXdbI/13ray3cl08rlw9NC6BxlpITasXsjr07Md3bvHPSJyr/nIZR02ll7GxsVFuMP1x2y2uNU7TkoxE/9aD4Uh4XdTK9y0HQgZ4bC6G/lu3+AFMxWK4pOVaavBAQpOW9gcfUWAYGVYSxNnIEkzNpkmiHLGqcP37cwrFqdX1BxVccXGzjWxhrK0PdzBc/eRZZp39gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MeYWWKU6JrrIrWdLLqp6hjrBplGrwxsyVDpXoy6mbuw=;
 b=nNvN9Kic4RxDODuIYKjlWRH5SHfpMiy4DMdmp8WeoDlKCJk947M//4/OApI/mTCHY/fSiLKj5ole8269HQRQD2o2elKHptHmMtd6nu80X/ZqYXSw0FTquIJkc/J7/OUNjPhG2Rav7DVnTXSkPEBqQ0cZcwxWHf12xuef2nkNDpm5nTIzLgpdYlzMk8u9B8qsNWh/gWd3WaBW/qScMY8Ar2QUI4NvI76pa9rUHLRnaHqI1+C81DKUTJ4jco9H/GvNOdmWdQ7E7zPffzw0UCxiJ/5Apevm/6DpH1Nmuuo5OaBKzzwAP6bj6RIiIVML+eZt+5j/OfzXwFiocb7HqrwxJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SA0PR11MB4718.namprd11.prod.outlook.com (2603:10b6:806:98::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Fri, 20 Jun
 2025 04:55:18 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 04:55:18 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 10/13] drm/dp: Enable backlight control using luminance
Thread-Topic: [PATCH 10/13] drm/dp: Enable backlight control using luminance
Thread-Index: AQHbrPQsb0MNKLgTfkSBqlLbvJf4S7QL4IRAgAAEHACAAAA74A==
Date: Fri, 20 Jun 2025 04:55:18 +0000
Message-ID: <IA0PR11MB7307077434E292DBE1305FA7BA7CA@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250414041637.128039-1-suraj.kandpal@intel.com>
 <20250414041637.128039-11-suraj.kandpal@intel.com>
 <IA0PR11MB7307A074AEC006084B87C350BA7CA@IA0PR11MB7307.namprd11.prod.outlook.com>
 <DM3PPF208195D8D784D6B49529CD251A527E37CA@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8D784D6B49529CD251A527E37CA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SA0PR11MB4718:EE_
x-ms-office365-filtering-correlation-id: bb2d409b-7dc1-4add-ac6a-08ddafb6a77f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|10070799003|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?n8cDXFHB7Z6NKv7ZiV7XYn0tH9qbF2Tesh7fAIYbaV8BhlVTYh/C33VIcsC8?=
 =?us-ascii?Q?/pd23z7MXp1VM2+PAEoLUXlXu9HRGdzhHCBwNS9I2VxZ+xzIcDhQas0VSYQ4?=
 =?us-ascii?Q?B0DLb7xnnYpfo+hBRfx9Gb+ljH7MNWH1MPb/laI/OZ+62SfHst2cHKeZVs6B?=
 =?us-ascii?Q?1zuNUvnh7aCHUh9V+KJSaEc/WinmIFeIY+ultXGi3aNf3J1DkvJP5uIo3ZaP?=
 =?us-ascii?Q?LQtMV7SyR9kFVd5WGOiPmsHnm5z8aYTL3ZdFiGecqNw6blFxA3KaOWjatwMG?=
 =?us-ascii?Q?eRzg2xWdQXiodCRX9+0RbyW7juhb1I/KM2ap2Cc1AMqsHjyRybLA1mkcFSiW?=
 =?us-ascii?Q?UUk0yhCb7U302BISO0bxSVPp1am9+SFq+LlDO3+7tZf0GIfGwWXRXCuw2O3v?=
 =?us-ascii?Q?4tzMtSUREVEfmrJXxAhevQRyJLBhNOakgYne8im9s7DkVEPU71jslpXu7Pwx?=
 =?us-ascii?Q?L7JOG7B9RjW7p+jgVupfgB2WcWggtJeHBXkzHoXu3ze8PFWyRzfRT3pL3+7u?=
 =?us-ascii?Q?XIpVrz44vMaNexl2FYQA21S6ftm5fM3hWldajYSGoZE2eSwMozozmqAi42Th?=
 =?us-ascii?Q?7pM3IujRe0Mid0ud1KKivTZvntZLIy6O+CAP8jMZwwAdojX3K4u+132/qL3t?=
 =?us-ascii?Q?+eUZWbSEmGCIgsX1MaR6IsqDw+TbMy/r7e5EP6AbW9m3Zvs9rW5LkjMAJb7V?=
 =?us-ascii?Q?kuKAz29Fac8kSgyBlUPZDs8RTX7mvrRVwAWAdaxJaHyxQ3TZgrmgBBLsQQM6?=
 =?us-ascii?Q?Gej/UhPCgeUIfYffxe6/Lf6JTw+xr/7Wr+SHJi6QYJ96yxNXbM9ZoH5TWy55?=
 =?us-ascii?Q?6YtWeccAm8rYyx8fgFUaIW+EX3wXoeQaPJnCi5pDYr/9H1O9XyeLgbno3Er7?=
 =?us-ascii?Q?HUtwHqKVbq2CkzCaYg4Zf5U9WVMpgQQw+IHvvaCtqvjtFBqvjAODUJ+62/Dy?=
 =?us-ascii?Q?6cmJ5Ujf8C2qpssVFSCZxzm1FPvHY9G9sZw55GegI2KRWcaaFxzbvW2V+2yl?=
 =?us-ascii?Q?6R/rpdNdX5eZYC9BeiOmCK7GXqeJ80NWK+hLhTXidpXvOC5TLzf0bzw2mvUJ?=
 =?us-ascii?Q?DakITUTTdNv0B6DrRsGYwOASUlP2t6KGDUEslCbyGmATXP5XxfGurjriVU8Y?=
 =?us-ascii?Q?ieq3yg91DJtKcUT8SCXMu5XuWsMXcLZ5E8eG81Wlqx/t47rsPIAlDCWMrz3v?=
 =?us-ascii?Q?a7HevUpDJixnssxG4PXiM8TvnkYMX03NsMz0zUF1GArjkrhWcmxutUk1Re5G?=
 =?us-ascii?Q?czQTQlgAFbMKT3BhH7mvYcyIXREQdBIA2IcHVOUNQj8jsVgs6sNHOKATJfRe?=
 =?us-ascii?Q?YM/OrSrsgMt/NxifxoMM5K+sUyB3W9aXWqhKed+KYqcjTb7x+t9z+4JxlCgo?=
 =?us-ascii?Q?cdaqdW6RrV3v9lHDYxBJICzVYXsFn9NYbZZl4uZuN078gNuwFzOQKgvN0ows?=
 =?us-ascii?Q?evxky8NXJtRvssTts3iYTORQ2B6SecfiyJaNtz8RxrQPkbTSoX6NFeEu42N+?=
 =?us-ascii?Q?WtunHVRahSW+hJM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6DjrkVwNMwHxp5auweWWnPtyH/mlPPMDRIq9/2P1IiAtLTfpNS2X/zpwoPLa?=
 =?us-ascii?Q?j9pza+my6L1DvJOVeQsQk2MFoSqzTwn2mzYHkeWEsMB7hUeMPw86xk96r72q?=
 =?us-ascii?Q?MwVWa/poDVfqM/QwpUNRBPv+66TtMvA9OtmV9+MZaDRr6xVQSAkZgMI1eQzz?=
 =?us-ascii?Q?sss5YeHF47Kcb4pBpOYuR5PgMxl4mV9zP0OBcOkcUoEHYaksp18pF20nYTh4?=
 =?us-ascii?Q?QRo/nmJ6hzaCvyWCxWFczDxthpLaPa1ohwe42ZkR8d4hju7b8oFAjLUx5m4l?=
 =?us-ascii?Q?H3BNPndA2WgAAQrR3/r8xSoJktqMfc/gHE5U3T6OpuVHpQC4c12GZB7XmMDv?=
 =?us-ascii?Q?QDefxqm7p9cz0pb/xukPpZHMTPsy/B2kejgJ4tJGD9ze5NwQn0LOgTCTs4UE?=
 =?us-ascii?Q?VrDb6gJQMZTCaArREKJX5lhJByarsn2B40NcXS7eAqbtsgVXPt9Fy6JNxgWd?=
 =?us-ascii?Q?A48QxaKidGO0SjLQLno5gKrE8QTDPG5F8J8RWapAaRYV61jzGICbfF4JkdZj?=
 =?us-ascii?Q?qNv6OmSFjZ4rNWsNjpyfEJqHsBC2oTu8OK3tWRwrMt11qIR4bIHPWNQM06Yd?=
 =?us-ascii?Q?tobpe3zcJdUF5ARLEsgaCBcWddkaxDBCL6/omHBxjsiHqFilrQUoE0BPeQ3j?=
 =?us-ascii?Q?6bkmaxCmk68AEWLg0rgbEDYC+Tyyso6r29cGClI4XAmNM6k7E+7zwkYVKFuD?=
 =?us-ascii?Q?48MklrM3JAvx7/Mk+UP1Is1VxYNa2BI0hEdGRt4j6yMabkXZv1f4+buKcXnq?=
 =?us-ascii?Q?CxpcU+GjpXKCkWRfQ9IwictVkB8JNOuWJhNjcLw1b6aLS+jJ3/z65z0rm3b2?=
 =?us-ascii?Q?xCBp8sG63ZAl9G2u0z1N2VJalmsf1Jsq+mA0YWrPI1HtcGC9xYRSxXeCVvOc?=
 =?us-ascii?Q?WNlVRTh+R/+xPx0M6XV7bVZ24xuu2RDBsDYJ4PFVWT9YDfzmgfOeJeKLfiUE?=
 =?us-ascii?Q?wktc0hI3mbG9RX6sgRAS6oBl3xfbNvvbrAOZza43nJlHKdH+komfmn6nixRR?=
 =?us-ascii?Q?tgoDo71Am0BXHuX8koZy1giZrUzHUVcAaKuDGe6KYwEZ9KqMBmE/YM1GAYkq?=
 =?us-ascii?Q?j+cx8tF6rwDI0TwSFM/2pK3h8wQ99QEjf2pV/GtNR6+X51dmFQV9yuOAEDXW?=
 =?us-ascii?Q?0xPrfLylWELVGRCA7kl0ywWBY3AKI62GXfbvs21uLUdmxMWoGh3kMMZy7HUc?=
 =?us-ascii?Q?TKzXk1iA/Yz2Ari0TT1hhDt0Mkma4etA/YXIVLiSpxjjrxt6CnXM3shxw4rC?=
 =?us-ascii?Q?QmAOOFf2G3J40mJU65kN2I8anm6E3+XvHSYjP3vOVVVKLSPGZPqPvKCdqxkY?=
 =?us-ascii?Q?OEPAV/GqPxohiLQ0BIl8fBa5fjSvjNWXG4dD09ITyu0lXyyfCdQ64hoRRCxe?=
 =?us-ascii?Q?vuLLRH+RUfiXy90DhO+i3c7bS63/OmmicqJUFLL4GijdRTxwIfmUI8kBVt0t?=
 =?us-ascii?Q?P2FwQhEqWSRMs230qGT+bVhR6JZTomXATJ5TbzDObjvLT9X/M82oM6YZHJUV?=
 =?us-ascii?Q?fBznCMhFnT2I/zkaEQUBU85tc7iubW4wJiQv7Bn/a/I9M/Brx+Z8bLzvVAJn?=
 =?us-ascii?Q?5sx8HopDI/5i4VuTmNZfNa2gt+hoNlzMSOLtCR81UttJ17BR/0GhGjIJCwpa?=
 =?us-ascii?Q?TgvS3ecUkO/UVc8S9mSESt4FyIe3zMxstsDkq+sJ/qvr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2d409b-7dc1-4add-ac6a-08ddafb6a77f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2025 04:55:18.5476 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gkY8BUbVY6KZYwWe3rS1RpB5XSIyS85KH9ErdHPavBoC+SPPCzab/lbwMkfGnp8sWuXeRTTiiyrVKRPCRqWsUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4718
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

> > > Add flag to enable brightness control via luminance value when
> > > enabling edp backlight.
> > >
> > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > ---
> > >  drivers/gpu/drm/display/drm_dp_helper.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> > > b/drivers/gpu/drm/display/drm_dp_helper.c
> > > index 0421b2ed9bd4..4e2caba8311a 100644
> > > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > > @@ -4030,6 +4030,9 @@ int drm_edp_backlight_enable(struct
> > drm_dp_aux
> > > *aux, const struct drm_edp_backli
> > >  	else
> > >  		dpcd_buf =3D DP_EDP_BACKLIGHT_CONTROL_MODE_PWM;
> > >
> > > +	if (bl->luminance_set)
> > > +		dpcd_buf |=3D
> > DP_EDP_PANEL_LUMINANCE_CONTROL_ENABLE;
> > Can the backlight control by luminance be used along with PWM or AUX ct=
l?
> >
>=20
> It does work.
>=20
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
-------------------
