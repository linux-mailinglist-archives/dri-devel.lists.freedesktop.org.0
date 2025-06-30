Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76466AED512
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 08:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9A110E39F;
	Mon, 30 Jun 2025 06:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="it+M+PvG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3684210E1F4;
 Mon, 30 Jun 2025 06:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751266738; x=1782802738;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lBoRYf2ITFxGCvkUwf72/NNSdR1lDBkY7IvR1BNTL8E=;
 b=it+M+PvGEs78jGahu89CIlmWMWhjKSVBJ1c39JUcTgwdjX/U0KvMQMJz
 C8I5arVnWzZxstmeWP1yV1eE9kGy2hCKlPx5fe957bmkLstHUpf5l4h3S
 hdcMXfM4LhmZBLDni+XshSfeumrDmOXaIb5+NRSt+m+0RtdzPxom9Bjap
 lpyNW6NSfLutH0M3GHR2hGykjVbe+qgUReOI5fKAH1/IXSXV6B26kBpGd
 qZDPc462e97Ewt+nQirSXjxGK5wI5tv89SdvA+2CNAT062YBXVn7hepfX
 1RIgjQxgsjfu2b+SVfbQDLzTqXRvhlVNyi/yMcdwf++QslkpTG/Ls3eNo Q==;
X-CSE-ConnectionGUID: Es1oRBnsRfGOnNZ0Cq9diw==
X-CSE-MsgGUID: OJyEt5abQ9en9ZdGzwMcyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53630665"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="53630665"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2025 23:58:36 -0700
X-CSE-ConnectionGUID: CvW8/iB7ReyLdvH1I6nhmw==
X-CSE-MsgGUID: RF9lTrsuRtC5FdVKS7DXRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="177044748"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2025 23:58:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 29 Jun 2025 23:58:30 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 29 Jun 2025 23:58:30 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.81)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 29 Jun 2025 23:58:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j6Iw0hCzRMl+utY/fnzLgnBNAXgWtAoWYEF6slYkcGo56WPm1EFIsw5OcMbGgymgIaeN/tB/T5k+eOqRUKbLh6px523MsGByRxkBqIx2tMEHaOT/IPTPi41Nyz2JSY6UVehASmZJWZ1X15kMaVBjymQ98zEtGYgenCUF7zHAQXIWNjZ9EA91601jkpYQJeur0d1+2orHtwLfS+xQT8BJGLjPbGkvOxzc8e5IHTA5M/NEN3qQLRNFgKKYi6joIJHtOa1xXpf5rp8cUXrhPWxaPPnnTVWYIwWYC0e+s4gXkzV0a1R16LxsYx/lWjBALe2QoiGKPCnA53XDi8N2muH2Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Po7zU5am+ea6Px8GIKySK7zZkkSh8IbIT3q0vvY8M1Y=;
 b=ba02Hbrm/BgTLS0eNCNTnKIi2Nk5Hq0fRrAtZwTRIGMV9YyAqyMEg74z/nNtkjljgdvWi++3WRTYb2CObqkhfUGv5iB/hDGprnI0fOL8LI4njF5CqdTe3OCLUG58AQUdaxwEvk4JBILRzt8OZrVoOtK85Hpql5+Bj7ZDrzmWqYZiQC59KyC0Ru9eub8nXgIF0U4yRZlrPC8265F4JIJTt82tYfriV+O8iq0XFDXLDkpm0rfmaXni6UyjkqawQp4mlL55wf343en3KkfnVKD8+J4mb/HdZRgSSDPZe0WkQKGSYqQlh30JPp/pDusRXX+cekeBNl+QsgPABpRH6ek0Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by LV3PR11MB8529.namprd11.prod.outlook.com
 (2603:10b6:408:1b3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Mon, 30 Jun
 2025 06:58:28 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64%5]) with mapi id 15.20.8857.026; Mon, 30 Jun 2025
 06:58:28 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Lyude Paul
 <lyude@redhat.com>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH 00/13] Modify drm helpers to use luminance
Thread-Topic: [PATCH 00/13] Modify drm helpers to use luminance
Thread-Index: AQHb4a19aatm4GnqKUaZrU7UJOyb07QTnJQAgAAlcVCAB5NEsA==
Date: Mon, 30 Jun 2025 06:58:28 +0000
Message-ID: <DM3PPF208195D8D2FB711E1C4E38D8E00ABE346A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250620063445.3603086-1-suraj.kandpal@intel.com>
 <4962fc123ddc84edcf02dea8d57df32088c18d5a@intel.com>
 <DM3PPF208195D8DCD368BF05ED5C8398409E37BA@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8DCD368BF05ED5C8398409E37BA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|LV3PR11MB8529:EE_
x-ms-office365-filtering-correlation-id: d50bc343-582e-45b6-f03f-08ddb7a38470
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?5ga5cKcT3Ivwm/BKlqML0zzS0P9Dc9uDRU/4T/nYYGskudNR1mFbkBvjrLjy?=
 =?us-ascii?Q?ZEestEk1nU/5mHu4hG+5Orp5uW787blRrhMgDXnFyR12SPFf6N71m+zFOHp7?=
 =?us-ascii?Q?j7A9Nzl8T2Ar/oV5/0ogmXE6m0a7GN+B8TvQOQvx3VDnO0pK62jj4chM2Vhk?=
 =?us-ascii?Q?PuGJeCibrbiwAlhxB32BmP1LMNS8LGRrGc4nXc2cxYm2FY8JWPmJrGeiHGyj?=
 =?us-ascii?Q?vJQVHKipxlobnFAAp4hxCbxYGUNJgWuTXGNLWE4n0nt48+B7YrMvQosXISIw?=
 =?us-ascii?Q?naG5lEphLH/5JRrwrQ5AfvPiQ7KRmlLzwiqz4dWsGk+VjQKsI1sY34xeb+RI?=
 =?us-ascii?Q?RWz79p51dgzTYRupYICn40fUIfeULre6g3KHf0+zZ1NE/d9O9syTrYN1rlR+?=
 =?us-ascii?Q?XvrOuL63wqaHFZ2FZPmtW5CnQfVkWeOTTJ9Phu0qTbKgoDxqLkr7oV2xMRTk?=
 =?us-ascii?Q?HD/mTPEkrx/XcFgySjQQA0/2jBE6pIWzZJ+9II669t5p2s06vEBjJ/+dWILi?=
 =?us-ascii?Q?WZC2DM5uUW2IUi1FCzHrhnOkLxCK8ZPH1QcJ6T5l+OP5Qa0IOUeFMacS3FAc?=
 =?us-ascii?Q?tVrCTmmGCCZDmjciBAEpv+9uuA4tLTSnfxmODa1MvSJM0jUcftWm6Yx2SzfI?=
 =?us-ascii?Q?7dGtB0BnTThGb4135hZ+dngDVQVz/4iJyKVvCHRiu5XSCKgmRrFKJ6K6rbkl?=
 =?us-ascii?Q?4npHB1/NQ24vKYkstyymVgfbQru1CZlrMYZJ4IChayn0s4YQdfEN/fEd2sYE?=
 =?us-ascii?Q?gxA9AKd1ruWnqSB40G44m4Qq2XLItu8lVwBGEIF/zUuze1IWiF3O1HSInoH+?=
 =?us-ascii?Q?f0tDPI7UE01U8/I5DT0ZVHWqFYboAzWHp/i/YzszOueWny6x7zOA4x/wd4eO?=
 =?us-ascii?Q?w3c7Qn8dgWTyo5qMkMj0Tcy9rvn1VN5WZ2rQcSLrbAG1R9LpzBQMMhWYyeda?=
 =?us-ascii?Q?Xsw/K6aZNM/KFnpvGWZTpoMyz0TzJE568TjwdyDclW+qMFIqB1Z5tNabfzZg?=
 =?us-ascii?Q?f64h1HwxD6oNXlkthvVUQ6LUGkdv0lYf6NeHybGRzZeKR7rkw2ErMztQsw67?=
 =?us-ascii?Q?zNy1o7ObamGxbA5FljbaKaODZw517Bzh7IhJbnxaSDK9A4G7/DGDCxU+x/BY?=
 =?us-ascii?Q?Xtfn51vsS3gNiu2A7etQQ7H+93r10AOlQU4J5T7GxUoVZZNme0nhEPUKl8jF?=
 =?us-ascii?Q?ib42wowv0SrtlBmH7+8NFuYkmataSMLg1bhKuXrV2xaJNTxzmlvNJUfqtfCE?=
 =?us-ascii?Q?oz/2f7lAZ7+TjH+Dr+buPIB3Kg0QV97r0mZ+MfPy7xmrtFBnJJa3GBZKpa+i?=
 =?us-ascii?Q?eiM5vb1YGOTx9+hOAD19F/y3fNEPBn5odHBrVa0+xbl+DKEA1S6V5qqcUgoE?=
 =?us-ascii?Q?pdyZYWKXFWmmVNd8QCviZxvbHlKvo/lBKRBtnUYYfxZtSVS5Rxy9f3NbMkhb?=
 =?us-ascii?Q?C2VwFvsXwrR1sG24105iVsb1o5fOF9Sf6Sn0Qs9N8XAoOGHeWv0Zcg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1Lcy0l8BiaIo74XTPbxY4SoJB/Z5S2sSOXhmGsHoamyUbbZ8D2NAZkVABpoU?=
 =?us-ascii?Q?ZDObnm74zdreeXJiCkk4VAHFrIU4wIWIGQV3zm8zQ5Lu/2Ftp4eDtn1P1DL5?=
 =?us-ascii?Q?FJoRVn9/tyO4zgjqAOOPux3QeU/ltIeEApkKkp5QJo2rJB5q9shUDdU+TTgV?=
 =?us-ascii?Q?GgRJEiC4sZa3YIWBDWrC9vMlx6qA+DNgfyHGDc8GtggiGSZa159O3vjL81MW?=
 =?us-ascii?Q?sE0jdNuoLJjURqxpL369/KVswjSpyRwuYmMvhiz27gxcM+t6+F5j0kIPZEgm?=
 =?us-ascii?Q?cGxCgf+FQcCb7sGV0cX/mfoFBdX6cV/LS1CFO59i4OSjLHm9ZNCjNNNlFkXP?=
 =?us-ascii?Q?hAanqXaYmPm0TOGF6mrXER1imjSRdKgBnosJzGQBYY0vBTkd03kihwBbEOXi?=
 =?us-ascii?Q?bTluj6iLQKJczUmqsVoc6/0H2z6fAgEFJNJbM9SrQkldz/hH1D+QkitWYp9o?=
 =?us-ascii?Q?3hkGn4Qf81wqeFqm2jtxlMT88Ytonc4dze6D58i7+k3MZEfhu7ogLqDC9rCC?=
 =?us-ascii?Q?3nBqc2IzqhqdkCDtIp2hADxoZmutKLu/E8Sd9MuNGCCawrwnQ1EaZcAWW+tO?=
 =?us-ascii?Q?w+8b+SLP+jfKD8uaF54n/NbAIAAMxYrXWtUKP4N5j/3nkPExQ+uxFf10U63Y?=
 =?us-ascii?Q?SLURaAzjvhCLcxctqsweLxZ4PCsu+uOFkEX99X368lsnCDZm/ZoSGPYagGOo?=
 =?us-ascii?Q?0YKK17SNDbxVWYObIY/rkixb2d8+Rk08Z5X/ZDfzcUDelsoM1BbOjGIdwurT?=
 =?us-ascii?Q?kuX8ixV8DxSEmZ0KS01SJv/xSHuf3tonEHd7S47KIRKwXTPHu2mCwh5dFSu+?=
 =?us-ascii?Q?SpVUB8sDivlcm7UiXEXruVHA+6JXsNJs3pJiFiYyf9VRww8wFFVTOusrx6hb?=
 =?us-ascii?Q?//O8d/JzCzlfg8CKJuTzleXQiFzP3NIwv+5/hjtb/8PiM45hYejXV8uQsr10?=
 =?us-ascii?Q?JtBb650aP+AD5//j+yrnEBL0GNKeoQymjikuV0gb+mp0niWwZLMhtrlu+JpM?=
 =?us-ascii?Q?4hknEcXxyDppHWcqwO4Nb1JXkeB6MFBngEO0scZssnT61l7ZHGskPhonYCU6?=
 =?us-ascii?Q?onJsaa5+QXBOGBYJ1+khpyehyJWP7kvI9Aj65l+cHIevQMow/qfcjCoOk1+e?=
 =?us-ascii?Q?K9RWWvjHN+tXOukJaUBRCSaZ3oPr5iHQPGb7lhrL9vsUg2imm+/GxKE0ZUEF?=
 =?us-ascii?Q?laRQ1erEYFbgHytOURu2VeiE0YiBK6jlwz9WDk+x9J9nZbp0fKPm7P+7rGTz?=
 =?us-ascii?Q?iuQJck1ebPb4AQoYoZE3oLj5iUSEHKu97TfL8yhUwttoAs9OTh+rviOQKp4V?=
 =?us-ascii?Q?CvI3500oUG82udz7986M24zNr2Uh/vHwCKCF+jayKqihfZjHkbyW3SWVg9BE?=
 =?us-ascii?Q?ouARAKQZRuS2ZUaqvqJ/kaUUViaAfDrXIMfsLKc0pmXgtGJPM5KeYry5zPAH?=
 =?us-ascii?Q?D9fwW0R+HRmHOynJ5xA6qNO1UltwQPyyiXMgb8Ci8fDSpCggPfD0PCjlqvYg?=
 =?us-ascii?Q?Hz6xWhuwrKIs+yQZ47hZm504CQRWzjRUX6rlH7w7yDa+xg7bX57CLu29jzSa?=
 =?us-ascii?Q?L0eUT0tB9hxXiTizhHZPwv5VNyJZZuHX/XnaqJ9/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d50bc343-582e-45b6-f03f-08ddb7a38470
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2025 06:58:28.5910 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +VGAGIu2WNXLWgbB55w+zp2ud/v/7xDizta92zE+/oar606yRPYhkGODa5x+lUtEjDxoUieYrU/XQAFuHVmnvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8529
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
> From: Kandpal, Suraj
> Sent: Wednesday, June 25, 2025 4:50 PM
> To: Jani Nikula <jani.nikula@linux.intel.com>; intel-xe@lists.freedesktop=
.org;
> intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
> nouveau@lists.freedesktop.org; Lyude Paul <lyude@redhat.com>
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: RE: [PATCH 00/13] Modify drm helpers to use luminance
>=20
>=20
>=20
> > -----Original Message-----
> > From: Jani Nikula <jani.nikula@linux.intel.com>
> > Sent: Wednesday, June 25, 2025 2:33 PM
> > To: Kandpal, Suraj <suraj.kandpal@intel.com>;
> > intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org;
> > dri-devel@lists.freedesktop.org; nouveau@lists.freedesktop.org; Lyude
> > Paul <lyude@redhat.com>
> > Cc: Murthy, Arun R <arun.r.murthy@intel.com>; Kandpal, Suraj
> > <suraj.kandpal@intel.com>
> > Subject: Re: [PATCH 00/13] Modify drm helpers to use luminance
> >
> > On Fri, 20 Jun 2025, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> > > This series modifies drm dp edp helpers so that drivers can now use
> > > them to manipulate brightness using luminance value via the
> > > PANEL_TARGET_LUMINANCE_VALUE register. This feature was introduced
> > > frin eDP 1.5.
> > >
> > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > >
> > > Suraj Kandpal (13):
> > >   drm/dp: Introduce new member in drm_backlight_info
> > >   drm/dp: Add argument in drm_edp_backlight_init
> > >   drm/dp: Add argument for max luminance in drm_edp_backlight_init
> > >   drm/dp: Move from u16 to u32 for max in drm_edp_backlight_info
> > >   drm/dp: Change current_level argument type to u32
> > >   drm/dp: Modify drm_edp_probe_state
> > >   drm/dp: Change argument type for drm_edp_backlight_set_level
> > >   drm/dp: Modify drm_edp_backlight_set_level
> > >   drm/dp: Change argument type of drm_edp_backlight_enable
> > >   drm/dp: Enable backlight control using luminance
> > >   drm/i915/backlight: Use drm helper to initialize edp backlight
> > >   drm/i915/backlight: Use drm helper to set edp backlight
> > >   drm/i915/backlight: Use drm_edp_backlight_enable
> >
> > Acked-by: Jani Nikula <jani.nikula@intel.com>
> >
> > for merging the last three patches via drm-misc.
> >
> > However, would be great to solicit feedback on the series from
> > non-Intel folks too. Cc: Lyude who's worked on DPCD brightness before.
>=20
> Sure will wait and see if we have any more comments on this till Friday b=
efore
> merging this.
>=20

No comments here will be merging this today

> Regards,
> Suraj Kandpal
>=20
> >
> > BR,
> > Jani.
> >
> > >
> > >  drivers/gpu/drm/display/drm_dp_helper.c       |  92 ++++++++----
> > >  .../drm/i915/display/intel_dp_aux_backlight.c | 140 ++++++----------=
--
> > >  drivers/gpu/drm/nouveau/dispnv50/disp.c       |   2 +-
> > >  drivers/gpu/drm/nouveau/nouveau_backlight.c   |   7 +-
> > >  include/drm/display/drm_dp_helper.h           |  10 +-
> > >  5 files changed, 127 insertions(+), 124 deletions(-)
> >
> > --
> > Jani Nikula, Intel
