Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 611BEB986F2
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 08:50:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A891510E0BF;
	Wed, 24 Sep 2025 06:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y/v9Am04";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E9DB10E056;
 Wed, 24 Sep 2025 06:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758696623; x=1790232623;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YE04mHXfVM4lBcJW4FBoyVop2THH0TM/UWTmDMZ/pyk=;
 b=Y/v9Am04BpxELiAlZcZT/YcLso7m9quXfh3xZgrlKB/YZPmQUvSYB42r
 RaNroDaYkh21nmsAqjsWcOq5IEQCmWMwsbpIzAeZnJs9cylUO7hXNafZH
 kcGeuYjCjRrvlF6625gxaIr/CzKc01HvYPlBbpO1wmOLavh3GI/uW/gnB
 Pr/8iKnLyi3T40Pskjgs1Q+q354e5TmAwlEWuf1LEBzjTnYz+YGQgy6mD
 /kmMG+b6l2xiBLqd7D56i20rZy5O0NDLnoUQocM+YSa7/XWt46I8xXjLI
 djqiUjnqS3zwU6PGN8bxJlANh1mpK2PNXyvt2vIZ6WQBH8h4uoekNHS1I Q==;
X-CSE-ConnectionGUID: +Xe0VMcQRfyBEQmdty8RRg==
X-CSE-MsgGUID: b6DybSj0RmyIWJV7QCViNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="64625050"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="64625050"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 23:50:22 -0700
X-CSE-ConnectionGUID: 2CS8qCbhR+uhlKCdNjgo7w==
X-CSE-MsgGUID: qEq5iDxxT9+XKj5QsecQ1g==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 23:50:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 23 Sep 2025 23:50:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 23 Sep 2025 23:50:21 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.4) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 23:50:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CY3VFRV1M3EBQVBnPW0xl+LKguO42K7RgEnLDsCXAhC/1iiVzYD9poMcQVsrSlGQoXxB4wStAQftetUq9ia/JTn5Cr222vtfVQTTlBW2cJ4MlIGWFuoCLFukkc9zrCc8ghVClN1A/c0dbMqNi6YNtkEHmD60Vx/0kRxUIYcRmWPPizN0caWP6VaJSYtGjSK72mpnkQAcJdDuwVCC/DYuWn1ytcPbvqMeOB5dj6Lqu7d8J88U3nrfP0et8JdeC4XwHgWdujhfK0eVOZOgyuOdbdvfWdk95+uKdo2xplP9J4R4oVQeJ5PV0CrCjBqh2e/F0mA7FkXRoNqrrmKCzun/Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YE04mHXfVM4lBcJW4FBoyVop2THH0TM/UWTmDMZ/pyk=;
 b=DGiXxQXsY7yjIS9kBq1SfAgtSHkzGpBHxSnC2snMFGNILKNKpLghII7rymuqNkgHtRxLhV9QW02MoYqrVqBdZEuwPSqR8sENGKbKFH3Y8e8jnfAOFPdkpVkmzYdYHbihi94mw0cROVSBIYO08oDaqHGyTldIdypj/eFbrPyb7E3LnhuQT9ZH0lJI6/rldE29gN6TpcYnbegT9utha30eyYeL90LYeeVVsJ0VaqqP9h7rno+yYrg5CfJLkuXNSKW36w8VmDfwK4FlYtyoiVDEJkPZK2jl7oTmKV+ujuCQyM1GmH4Mu9yilPiVHdUmTFL0dnmVZkStH+3/JmS+OSQMeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by IA4PR11MB8914.namprd11.prod.outlook.com (2603:10b6:208:56b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 06:50:19 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 06:50:19 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, "Jason
 Gunthorpe" <jgg@nvidia.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>, "Logan
 Gunthorpe" <logang@deltatee.com>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, =?iso-8859-1?Q?Thomas_Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: RE: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Thread-Topic: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Thread-Index: AQHcJhH5Hi/XzGn7NEC5e+4cxcvJFLSWGoCAgAIWItCAAKwBgIAASuAwgAFOcYCAAGQ08IAEQCiAgAAQEACAAJXxIIAAmVaAgAAFRQCAABLXAIAASZgAgAAITACAAAe3gIAABICAgAACuoCAAALjgIAAnAEg
Date: Wed, 24 Sep 2025 06:50:19 +0000
Message-ID: <IA0PR11MB71855457D1061D0A2344A5CFF81CA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <045c6892-9b15-4f31-aa6a-1f45528500f1@amd.com>
 <20250922122018.GU1391379@nvidia.com>
 <IA0PR11MB718580B723FA2BEDCFAB71E9F81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <aNI9a6o0RtQmDYPp@lstrano-desk.jf.intel.com>
 <aNJB1r51eC2v2rXh@lstrano-desk.jf.intel.com>
 <80d2d0d1-db44-4f0a-8481-c81058d47196@amd.com>
 <20250923121528.GH1391379@nvidia.com>
 <522d3d83-78b5-4682-bb02-d2ae2468d30a@amd.com>
 <20250923131247.GK1391379@nvidia.com>
 <8da25244-be1e-4d88-86bc-5a6f377bdbc1@amd.com>
 <20250923133839.GL1391379@nvidia.com>
 <5f9f8cb6-2279-4692-b83d-570cf81886ab@amd.com>
In-Reply-To: <5f9f8cb6-2279-4692-b83d-570cf81886ab@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|IA4PR11MB8914:EE_
x-ms-office365-filtering-correlation-id: 3426d197-f36d-461e-077b-08ddfb36a056
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?/VcCmlCX/K1h8uEcTHCdTIdCKTF0FvXUuSD+YEHZ+zXzN2kl+XmRaf65MG?=
 =?iso-8859-1?Q?UANJ9PUGGX0bQv9r5YQWj8VYMjFzjT3otBB5ZS6/p4ALJ/JKjTLrCXNr5u?=
 =?iso-8859-1?Q?+UGal5jUclTIIIhDB/JKU4AdT4tNMIBy5Ut4yGeB5FX/Z1NXdV0xI3Tcih?=
 =?iso-8859-1?Q?oGhD0IYy+uL9l2VgX1jMsjJobnyd0++FVwBQSM6mPLqnqAX3PPRdUNaMLj?=
 =?iso-8859-1?Q?2juCii/fTQX9MIBe7tIKAOWLw+bv4Vj9Z441Sa/GsedKJGVWId4XCXrBiw?=
 =?iso-8859-1?Q?kC0iUyCljeGTCMS4bo1TuQi4BmF46KNYjJ3E0TfYkTfHajJ0egphar+FC+?=
 =?iso-8859-1?Q?t32C4pVlkymN5q9d1/+3q/lz8OGWWjDj9WIAbmCkDqjm5NmLhQmU9LTZfB?=
 =?iso-8859-1?Q?+056hOVJj0+iztAX1NbWrJA6bjdcn0aheFbmrP0v0ooL8X1mXiWPrrIflV?=
 =?iso-8859-1?Q?JtZkKBWHPQdaZtOZXYU3G3+6tOdopHFLgp+ThvoE1jK+vIHh6kef+We+XZ?=
 =?iso-8859-1?Q?Y9LMWhn8uMLoUD3eo6uBv9Za0cmLlrY7ZwU+nckYTL9ESF4wEhbo+moiaa?=
 =?iso-8859-1?Q?QaVDiduQ7IFyCXb+ymIjIR/nqgpZ7nFjGxDkEYM9v+8iUBP8RP+yfpdXa4?=
 =?iso-8859-1?Q?UUmY4VYexj6FY9HWm3Gh0mY1NWYvy6pbQ7ZwV3kNwF+kE6/6WlHIccJ9gW?=
 =?iso-8859-1?Q?pjuv6NzMjP6C4Ew24V904O26YlZl22vvrqB22p4zYUgi0RwXQORRskaC49?=
 =?iso-8859-1?Q?IQZoNuyAa6hRIYOK6r5Dv/QAdLPl+gpae2iECY4AJ/OMlyfMty4lMfR/RJ?=
 =?iso-8859-1?Q?IPVKfBG93HSEe66xdjf+2W5XWU3KLDUaDy3otTUwtV8uWe0NFJptds/GQ1?=
 =?iso-8859-1?Q?Sywrw2a6fG3g94d43ScYr3gsYM1tuQwmzA6QXG7mWPNgY0a3JlLpCWwlg0?=
 =?iso-8859-1?Q?c7k7G+oK7JktGwvPDn+q9KGgERRcpaj/5OYg+VmzaN2+4jwurngB9vCb6i?=
 =?iso-8859-1?Q?2/eBjWmZha26BKUtNp8qgwAjoBpKT9ovlbCz9GH6SR9ThfOALGi872WGzY?=
 =?iso-8859-1?Q?WNOPuFnfk2MIxBwODpcjnP0U9qEDbJ2L0RaiuzzXI3QA4NttbzIMURXKXP?=
 =?iso-8859-1?Q?atFLOkrbvET4p3uw/iRQZONtb1KJDS0/N+mCGNzS8Odu8jeVLpyoOHa1oG?=
 =?iso-8859-1?Q?0DSbewyz66Il6vrCvydBEpmc/QkrlkzOqJPb0PdPZNO2MusR1TJmKgzsWp?=
 =?iso-8859-1?Q?zZGNCUmGAKo4ljErUmyIpYcGziS8WSFCqoFOz4lCN1r4x+nxFN5NNJMBj6?=
 =?iso-8859-1?Q?r2u+s0GfK+wZc1bJD+gBI+ExqJlSQcuYnO/tD8m35aohHVW1o0/mdxk/n2?=
 =?iso-8859-1?Q?lTRYGnspooPym9yRzzKhJztIb821QEakBIx4cOkojxu6ourtqJBACwhHD1?=
 =?iso-8859-1?Q?FqUj0a6j11uq5yjtn/Zp+Y11Q4I2t2omfmXQm4J/u5T2ciOopZ2H+98li6?=
 =?iso-8859-1?Q?/nItloWb2to4dICq8sx4qTsn5niXMhL61JZhGQVkmn8i0WLGhqLTdrP/g/?=
 =?iso-8859-1?Q?KOAck50=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?3M+4EynqHiTMRIXQE9nqQznlZPrYgdrb9Ovdng26dAC7V0xjru5cE10qPG?=
 =?iso-8859-1?Q?nUDWGlcXD7oDa48/zWMjMaVfNTZ5wiNNf+fxNtRqDxmTJdfHWgyNbRN6Vh?=
 =?iso-8859-1?Q?r7gcCzbsN71uPtP1XQlxI12/xyWHS2Puz54QTR7hit+KeBWkOScyu/Mu7q?=
 =?iso-8859-1?Q?awURZnxUsza9eFwFiDnMtrS0d+zf3f0fMvy7VWIeAhQk6Iz0YNHp/wj30Q?=
 =?iso-8859-1?Q?KoHwbISAcqIT7YnvtYsEQVCDph9u+y3bds9oHyVi4NqPvxGRPn4NHX503h?=
 =?iso-8859-1?Q?YQOGj5fStNrKoie1anBQ0M2S1bbRo92TFyT/L6xHj2wJCPp1KoC9c50V7R?=
 =?iso-8859-1?Q?Z+OlthsMv7UMj6F/f3go1b+QiEl226X62BDHY4CVplmf/MOb0ha+N9Os1e?=
 =?iso-8859-1?Q?MCrFdPlwDaupYVmzKsdNJyrUx32pTVBGz/iRgtPdGcTTuNs30AbUBU5zIn?=
 =?iso-8859-1?Q?sEfMjOYmgAxSYvcUFBdl9Glf8qxM7U/8buLz+9N6M00iou0sLMQ/7A+FcI?=
 =?iso-8859-1?Q?5+4zimuJ5BzuvVIMNIUCJD+CFVHbp06pEn6Rxjh5261y6ENzwEIgTyvkmU?=
 =?iso-8859-1?Q?dpFrnK5yH1qt+QQ0mv4sStuLskFdVGLzIDLb3F4uo1YU12ZD4HYfxhRwgV?=
 =?iso-8859-1?Q?OFoPzMmvC2Mz2vHrZQQqeDAB/wBo4L0QKgrtu8OrXD9dUjFkCzs4JnzMy6?=
 =?iso-8859-1?Q?/+2Z7r4uKcCG37WGfmmOrqzZeEgWOLDG4Svc/GGfinJZzzk1vRSe51e2Qe?=
 =?iso-8859-1?Q?wVTTV3XHxvheZl6+1OaGqM/Q8LWNN1ziF4Cc1vrslu3aRv+SUfDjteVvWK?=
 =?iso-8859-1?Q?miVU9ogZ0qHiI3+utd4uEGob13VsGL/SkJpMzdzm8erO5LEhMKejAs3KAz?=
 =?iso-8859-1?Q?xP2ZjjEw47B7qvrZzW5loGnALpHx7+3pM+dIcKDydSRa0ozdfN/kbpfEfx?=
 =?iso-8859-1?Q?nHm/RqGBapU0lr7V1P+TsIK17t3kmDQN07VKU1Sg/sJIR7bf4Umse7uRm/?=
 =?iso-8859-1?Q?sOGUa2+tbYyOAPsNghWAjMNA0puHzips6v8r7IuQdsgrcTxb84ki+/7YSn?=
 =?iso-8859-1?Q?Tu9hHbfK/ebu9Q49m0LngCF8qXqBUuxEfox7PoTbej1usFbZ7mRXrK5JoJ?=
 =?iso-8859-1?Q?X/m4gsKDNo2V1QDe6hQhRFAdNga82LFpnZ61bxcdzzMaRUavr6mc3mr67H?=
 =?iso-8859-1?Q?WsrDsm4RrL9wJ+ROYjJ6+6tWclv+6NKd0qh0y7QdL7/wCbav8MMF0NccBk?=
 =?iso-8859-1?Q?7anqtHxMRuJmI79og021nU4hXtfoxHrbQMMqZAp6Eit48HeVOhxYDBvck4?=
 =?iso-8859-1?Q?VjAvIRRndi0zZIR7ASFXa6GniXKVrS6bqqFyDUJUUgf1M5F/UC4KKaWSBs?=
 =?iso-8859-1?Q?XqC9ugmCBi6TzcGlzq/4CwxOWZBlmOhSWg5niekBuNpTugIN4kCpoGNrc1?=
 =?iso-8859-1?Q?9lk3U8Iszlx6YeJ92ICJ8nLcg3UkA/ww+5KaI0/76OI/eqbBdpuVrHx53a?=
 =?iso-8859-1?Q?bpeVcc4zIKZDtYV92q+4bTlVk2MLKSKTH+fNLMjUFjHfzFFaVCvJqwGsYx?=
 =?iso-8859-1?Q?AOFF4wbwgC1nGDEI+RMCekarpDYvSQQJz58xYhx8R+BZLhHGaN6ZLOO95H?=
 =?iso-8859-1?Q?AHRtPGpW29TFCtBC0CyiorfVATKgRd5PVZ?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3426d197-f36d-461e-077b-08ddfb36a056
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2025 06:50:19.2986 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O1e8Xb0Wed5NHygmu+FPF8mLhHBeJsWyKz2RP4V+6/8C2538JL1WrIv7ZlIZP22cICIwu4NN2RFZZ+Y8ECli8V0kHTTIW5bkUkBR0ylTryk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8914
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

Hi Christian,

> Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for devic=
e
> functions of Intel GPUs
>=20
> On 23.09.25 15:38, Jason Gunthorpe wrote:
> > On Tue, Sep 23, 2025 at 03:28:53PM +0200, Christian K=F6nig wrote:
> >> On 23.09.25 15:12, Jason Gunthorpe wrote:
> >>>> When you want to communicate addresses in a device specific address
> >>>> space you need a device specific type for that and not abuse
> >>>> phys_addr_t.
> >>>
> >>> I'm not talking about abusing phys_addr_t, I'm talking about putting =
a
> >>> legitimate CPU address in there.
> >>>
> >>> You can argue it is hack in Xe to reverse engineer the VRAM offset
> >>> from a CPU physical, and I would be sympathetic, but it does allow
> >>> VFIO to be general not specialized to Xe.
> >>
> >> No, exactly that doesn't work for all use cases. That's why I'm
> >> pushing back so hard on using phys_addr_t or CPU addresses.
> >>
> >> See the CPU address is only valid temporary because the VF BAR is
> >> only a window into the device memory.
> >
> > I know, generally yes.
> >
> > But there should be no way that a VFIO VF driver in the hypervisor
> > knows what is currently mapped to the VF's BAR. The only way I can
> > make sense of what Xe is doing here is if the VF BAR is a static
> > aperture of the VRAM..
> >
> > Would be nice to know the details.
>=20
> Yeah, that's why i asked how VFIO gets the information which parts of the
> it's BAR should be part of the DMA-buf?
>=20
> That would be really interesting to know.
As Jason guessed, we are relying on the GPU VF being a Large BAR
device here. In other words, as you suggested, this will not work if the
VF BAR size is not as big as its actual VRAM portion. We can certainly add
this check but we have not seen either the GPU PF or VF getting detected
as Small BAR devices in various test environments.

So, given the above, once a VF device is bound to vfio-pci driver and
assigned to a Guest VM (launched via Qemu), Qemu's vfio layer maps
all the VF's resources including the BARs. This mapping info (specifically =
HVA)
is leveraged (by Qemu) to identity the offset at which the Guest VM's buffe=
r
is located (in the BAR) and this info is then provided to vfio-pci kernel d=
river
which finally creates the dmabuf (with BAR Addresses).

Thanks,
Vivek

>=20
> Regards,
> Christian.
>=20
> >
> >> What Simona agreed on is exactly what I proposed as well, that you
> >> get a private interface for exactly that use case.
> >
> > A "private" interface to exchange phys_addr_t between at least
> > VFIO/KVM/iommufd - sure no complaint with that.
> >
> > Jason

