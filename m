Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DC4CF2AF7
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 10:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3811610E21B;
	Mon,  5 Jan 2026 09:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L/qLK4Xn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A18910E0D6;
 Mon,  5 Jan 2026 09:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767604712; x=1799140712;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gux3D0TP5tHtDqP9aP71uvfVbfiYwvOumUskFpOJnVk=;
 b=L/qLK4Xny5g6lty4+O73KVI8dU757IO1iAWEU5bfiAKiCNWMHv0wegoG
 issYoB+cM2vX5h2I2aIL+fLPERPRvAtONUSvaTjdyZqbtYbvPs4BuS0En
 0gepG4F4VjbSPWdgsMvAPnOQXdSTDe8O4DoROCsGtvl21ZTaTHLTjfOSP
 jviWajel8UHB+WzZT7ce6OWAxO+FVhm0x84lDmh8VAOv1cYlknPg57Hmg
 eB+6hs7eFgA8uAhVL/ixI6cS/GIBK6JkDhfw7rF6J3o6fAzBI5i7uL6os
 qNakAvIadM5q2BAKp/3kGC8OkqgcKl67ULNncvdyuzJRSVCAPfWEIr+Lb Q==;
X-CSE-ConnectionGUID: vSQVe8CATPy4yDh61cW0aw==
X-CSE-MsgGUID: A4Q6W61ZSoWusSlzLYB3+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="86556713"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="86556713"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 01:18:32 -0800
X-CSE-ConnectionGUID: q8WVABagRFCumao9vRB+zA==
X-CSE-MsgGUID: XtXGXRLXTn+4NBSYjTKWRg==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 01:18:31 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 01:18:30 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 01:18:30 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 01:18:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FEydNrfjHVy6Wt+hiAbSWjOy+LFIYXoGYwLTMqDFjbg+vsuHn4XKDsY3trVM0SqQK/vggDccpKZv1kDI+kM+4WlPr1VEAZnjm/wcWfhhg3CNez8PctPqlWgFxolKNGCUmQakRL4BElt+RxJz5nuQiFzbN+53bIEY/hW9iBUuZF3c9/Oqm8Oca0FdUrxw03D8jLJvAxvDavrLbqpTFW94W/pTkrSITjcmFlxZpdZ0g+i42p0z+gnl6zXTkPktM6pDhNC5/8JeNPI/7BXfJi8OsvfnFswUj7IJyVhoiP/Y17Nfg8V4X5k7hIdPzK0InH7WlJZS2/SsT3ylH5LOecz83g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKf56lH8hF5a8lM+9K2bgbHduGRkrRozcXJ8ItpVhMs=;
 b=dm3M6zSceFhQqAyVkKtYPvynUKf0UMr46NpWoGNyB7LnhcmQGTaqHABt6HCi4W3w7OEI10+3E2FzhtDWpEPGP5NtKs2kliUie2caUrlobj2Bm0xVG+by5bu7RqwejU06dEpx9NVSWeLnI+scfKMK/c02zjGOpV6kzwvpVK1NYLuyy9pFbO3UhQNissgRQ21fgb+NUkzICWVP2xZ4zTAP+78iKoWbp2iim4B/tzKuMG6SxuhQKEqofLEvS2ejTP+CXg2r9MrzyrtANHhqzTzWv1bW/sdyDd0c6Cf+c+ZmkHOT43hPXzAWlVOvE+P4QHVGog32y4joPTCfEF6ApumO5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SJ2PR11MB8347.namprd11.prod.outlook.com
 (2603:10b6:a03:544::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 09:18:27 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 09:18:27 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>, "mwen@igalia.com"
 <mwen@igalia.com>, "contact@emersion.fr" <contact@emersion.fr>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "daniels@collabora.com"
 <daniels@collabora.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 09/13] drm/i915/display: Hook up intel_colorop_destroy
Thread-Topic: [PATCH 09/13] drm/i915/display: Hook up intel_colorop_destroy
Thread-Index: AQHccLcHiLmQccIirUuH0Xx0ky/SwrVDZvLg
Date: Mon, 5 Jan 2026 09:18:27 +0000
Message-ID: <DM3PPF208195D8D76BE5F7102B2ED2B86E0E386A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
 <20251219065614.190834-10-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251219065614.190834-10-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SJ2PR11MB8347:EE_
x-ms-office365-filtering-correlation-id: e5afa2cf-7d0c-4fe1-8621-08de4c3b62ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ttC78SxfDO5ENmg+R4B7f0aO54zG32FH0pbNAdXy8DsQEOGzntb1dsNZoSzE?=
 =?us-ascii?Q?JTkLauYDWSxBHH37s1SDxkkaXRSri9fzQgOR9nDNnWrosEnlg9YRQwzhJ7SP?=
 =?us-ascii?Q?oxxT4KWDEh139uDGHfWP/xT3R4U+rXodZJCExJS/IvD20FjjyMazPid6vBpm?=
 =?us-ascii?Q?D9fTOjJ0PRIw9bjEU4VFinSOsBR4a20vwox9ZEoKGcc2HoCSWsI0c7Y7NDWc?=
 =?us-ascii?Q?QTt/zH7oV1pOaaEurgDbRTTLrSgTeiTdW5WN4aitlfmxDNYKMsx7xXMXnZ5q?=
 =?us-ascii?Q?RTLGMhORL4EOCdnUxNj9P5kG1QsWUREv5BsaW78z4A4NuN6423F6Vbx6NpfL?=
 =?us-ascii?Q?F+9fp9nc7bzeRkOqhMw3uSx8rY3BscAeINAcA6PId3gaheS+ux8m8X8BGrUS?=
 =?us-ascii?Q?1vGxv6UKUKC9+pyBAM+9cxzbfsesQHBXYdXoRVZymU6npyQFJa6/LTvWuKik?=
 =?us-ascii?Q?wjDuqmJ0IoY+GxQyYzkRkS9YpsVVaUoSgMI8YhGb+PzCdwWEm1xpehQCrvYN?=
 =?us-ascii?Q?NUVq8rZJxbkqJACRA4NV+vO1iuSOPzMi+L3AhRNGo8tw+G2S3j3hCECR5l82?=
 =?us-ascii?Q?PPEEmKt+872J9FKzTiSp6Dd53YPcZb7uIisvecz2XU7FzmcYDX8sKbIdbjhH?=
 =?us-ascii?Q?uJsz1vPVsZE6E+pTMrN/iYFrkpzw3c/ZRVDhN9UtsWw1E1PelJk6P/YE5lF1?=
 =?us-ascii?Q?UEUWbejclQaxPOHzPLQxM98MqKPbkuNsNzhL2NxkFSy0IGtr8bKWIaitOLJY?=
 =?us-ascii?Q?j2xgZWc9L2xZaMjrWe+MjT8QQusnAtCq+dwlrYj3aquPXwr3zL4qDUaXhA5w?=
 =?us-ascii?Q?sRPXaqaPlSNU3B4gBXQ3jEGMsRII8W9ur6awcLTZwMQkB1dc65Ys6NUru0tM?=
 =?us-ascii?Q?S9iQ1dVmFP1zhXRMJnPstNBoIT2kUtNue+h2NrmBR6ZiDzyWPvEKPtgm/TPk?=
 =?us-ascii?Q?6YHLEvI8I4kIWXtBXf1QeVx55ZXbt+zlWGv8WKx+HIPuOA7oac8Ht8whfh8n?=
 =?us-ascii?Q?kKuw5iDAswJKgOEcTWTg10k/2JWl9QJ24Iy7GadLhHx4WHL+NIjQiucz04N+?=
 =?us-ascii?Q?CR7zdlcdLXQk2TlGW6nlwFrcEDOuhdFxxHsc+Wn0eJcZnQiezBoz1aXrJozf?=
 =?us-ascii?Q?TYfWNoRwWk/B1gDkYmMNOeBbYXJz6PzNwKs/hcdlwHOGNIQu7AHyNlntitsP?=
 =?us-ascii?Q?DxvpePmvIchu0aJ6iETUDPmyy1EPTkvIPc6RV5NwZoxX1y/qCaGOzkFIIAZ5?=
 =?us-ascii?Q?hhWxF/kGAO8hs1lPIsgWkW67t+xjzeYPsdbaczEeR8GM2wRSNS1yc9QeXhrY?=
 =?us-ascii?Q?8pk8L3WBWoRpPe+0tAwBTvS3KLZb56+KumrzrPgo0NH2LWotZqW/tglcsITO?=
 =?us-ascii?Q?vVKD5enkl60eiYykTMIu19/LatXBAg5Ysmp732iOCHZw22VbhVnhV0dMxw3Q?=
 =?us-ascii?Q?IPX6Mn436YSuKhiTkdi6TIR94CrmMxiAeRFWUZ11XbxYIGf2zDIN8kMFp7gH?=
 =?us-ascii?Q?tb1bmAeuvNkreqTf+mWAgvddrYI9FCqNdzjn?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WE5LI3eTFKFqcQSvwy578dWFzlSejL4CN244aEu+5upmtIi6A8WBAmVSPCnt?=
 =?us-ascii?Q?nMa8SBfM37FZi/rzfrPqixgAvBQLgFmiQQ0K3/sd8DfrU2mXIsD4jEwBV38d?=
 =?us-ascii?Q?7QMQKd0k+TQ6zOf2WPaBhEUTuEUElebpg2CptyWo6I1ejtFlJTV103TlfYe+?=
 =?us-ascii?Q?7jNNw7ysfTUXo2ayGk0lX33IMdWvxSYVKNkdilzrl4Ht9cXJoSTSOFBQX6f/?=
 =?us-ascii?Q?zkrXx9zkTUmb2eG7Y2c0g1cmKE7byFidRj8I1MX1FdAEdZbcd5k6jJ3k9g8K?=
 =?us-ascii?Q?lHBJzSmswahUABrFZ5yKCydoMtxwXLkV/TtkgeDCXHKUxAPdWc0FHujdP4wv?=
 =?us-ascii?Q?nko3Zq3nTGKKe+h8BRxtFJdYZay+vbFNWj7SuFwHP5DoN3kD/8brzvyy7xjb?=
 =?us-ascii?Q?ZrTed+uqakUEEO0RwWQd6S8XJMiXULKCYkVIv9dzQ0+KUu/LQ6mRyg4zlhnM?=
 =?us-ascii?Q?WTkbGWgPbDH+pU8BDaTYomrL4QzLXBFXqI+EmMbpPB2swdjecNOLi41mLKxB?=
 =?us-ascii?Q?m/gdx611+KUTZOTX6cLDfkFaTSDbsDL4WwEhnT+Ilnwkjs0BrVKTWum2SfPS?=
 =?us-ascii?Q?vHvuZp7dwfeVJiq6LbVR0SSEAhjOhtjOD2w79VWSr/pETkZ/S0sXLUtIGLa9?=
 =?us-ascii?Q?qMEvX6y+o/pIEGJCTTqgrLdWM8UoS6CuXbKsRDfbvBg+mLh4pfenMe8O9zPd?=
 =?us-ascii?Q?II7qWqgIuISGxrfzASNNNHb6pFlkYzNngIDHrZdyK93y/2X5nkOyi+pXrrqI?=
 =?us-ascii?Q?ujcQ801cDn20BEteSrwZdTPyZ9Cc5ZUbCYwx7Lg4UTcL7MvW7N/M/E92zbAR?=
 =?us-ascii?Q?GQCYX9lv9taqvNd1yMVVea/TTdW1RKGj6832KtQ+/6nNSGxquLp6iuy2vR0S?=
 =?us-ascii?Q?kmR7tZym7PYVHVi2jDhmzuah5BE124Ilp0pY7k7lyJiWakeflFaFggp7pOh+?=
 =?us-ascii?Q?D5Xe9WhPCkq5UUXuZDDfCw7B6zrqul/3UTvMpTVUCE4S67mz6dg9OSiDYu3q?=
 =?us-ascii?Q?imp1IeDfZLbmslbq4tltCKLbfo1eeZHxKGKmhfjprAG3d39WE7hDEGfInXJb?=
 =?us-ascii?Q?WodKICtGwEqXLXTBnbbm/V6RAB/W+JlHKlioqwNUtwJVuM5EDE/+iXDbLFXk?=
 =?us-ascii?Q?EoUI5mZMtDg7ExT55dmPMQyBpHNxQcvfbTxOSdYFZN/km2UJcfaPKgxnfDb9?=
 =?us-ascii?Q?Hu+7AGWtxjDku43I3Jf54K1Z+fHoedNRXWisPBXhYLS6Fv6iLuh5it5Yn0Bs?=
 =?us-ascii?Q?nlglZBr2DA8VEy/m6WNyb/KdyS3sjYvC10CbDEjbhT5dKdPp1/XNDv23+Q92?=
 =?us-ascii?Q?/zChTbTjgEGXa7HnmYW63XDCJr4wgN94rE1FCIgACK/15fjNN0Z2626q8qBJ?=
 =?us-ascii?Q?B4G3xVSnLoDc3bgEUGYUdmIMliOnT3hedt/PcrZ8EZWurWXlVmpUAxN0Yo/L?=
 =?us-ascii?Q?D0afUELh5TFInx4swVgKyuPLbGwU16JnnIHPIhf0bFr5+okvUePo3aELD3e5?=
 =?us-ascii?Q?EekJrKPSMEfzJ9+/uPxxRRD+UsYQrdFjDHZPVnyP3GgTdaqrxuwtGvHvRQth?=
 =?us-ascii?Q?DVFqlxiZQs8EWFmTaeUM72rzNaVTTr+NV35oIO2OiLNOha7v503ttbw9gKSx?=
 =?us-ascii?Q?tJuXrrtRG4NAGgje74h3nJYXHagp6EerkpMKGAxoQwA96d/PhSVLjM7rcsUR?=
 =?us-ascii?Q?DyW2XD0ppFnP3A995xmSbhKcAdXZjVyREYcqNkTA1oWxbcdgyUFApXQGzee5?=
 =?us-ascii?Q?BS4AMybEVg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5afa2cf-7d0c-4fe1-8621-08de4c3b62ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 09:18:27.7543 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zrEOsIgijlEkxlBISvSkjqhtWDOA1WZNuwRt6CYlO73vVHafksCBaxt0e6jpKWIQAHZhVnfZbhoR08O6EKQUDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8347
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

> Subject: [PATCH 09/13] drm/i915/display: Hook up intel_colorop_destroy
>=20
> i915 embeds struct drm_colorop inside struct intel_colorop, so the defaul=
t
> drm_colorop_destroy() helper cannot be used. Add an
> intel_colorop_destroy() helper that performs common DRM cleanup and frees
> intel_colorop object.
>=20
> This ensures correct teardown of plane color pipeline objects.
>=20
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_color_pipeline.c | 13 +++++++++----
>  drivers/gpu/drm/i915/display/intel_colorop.c        |  6 ++++++
>  drivers/gpu/drm/i915/display/intel_colorop.h        |  1 +
>  3 files changed, 16 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> index d3d73d60727c..8fecc53540ba 100644
> --- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> @@ -13,6 +13,10 @@
>  #define PLANE_DEGAMMA_SIZE 128
>  #define PLANE_GAMMA_SIZE 32
>=20
> +static const struct drm_colorop_funcs intel_colorop_funcs =3D {
> +	.destroy =3D intel_colorop_destroy,
> +};
> +
>  static
>  int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct
> drm_prop_enum_list *list,
>  				     enum pipe pipe)
> @@ -25,7 +29,7 @@ int _intel_color_pipeline_plane_init(struct drm_plane
> *plane, struct drm_prop_en
>=20
>  	colorop =3D intel_colorop_create(INTEL_PLANE_CB_PRE_CSC_LUT);
>=20
> -	ret =3D drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base,
> plane, NULL,
> +	ret =3D drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base,
> plane,
> +&intel_colorop_funcs,
>  						  PLANE_DEGAMMA_SIZE,
>=20
> DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS); @@ -39,7 +43,7 @@ int
> _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop=
_en
>  	prev_op =3D &colorop->base;
>=20
>  	colorop =3D intel_colorop_create(INTEL_PLANE_CB_CSC);
> -	ret =3D drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
> NULL,
> +	ret =3D drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
> +&intel_colorop_funcs,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
>  		return ret;
> @@ -52,7 +56,8 @@ int _intel_color_pipeline_plane_init(struct drm_plane
> *plane, struct drm_prop_en
>  	    plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY) {
>  		colorop =3D intel_colorop_create(INTEL_PLANE_CB_3DLUT);
>=20
> -		ret =3D drm_plane_colorop_3dlut_init(dev, &colorop->base,
> plane, NULL, 17,
> +		ret =3D drm_plane_colorop_3dlut_init(dev, &colorop->base,
> plane,
> +						   &intel_colorop_funcs, 17,
>=20
> DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
>  						   true);
>  		if (ret)
> @@ -64,7 +69,7 @@ int _intel_color_pipeline_plane_init(struct drm_plane
> *plane, struct drm_prop_en
>  	}
>=20
>  	colorop =3D intel_colorop_create(INTEL_PLANE_CB_POST_CSC_LUT);
> -	ret =3D drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base,
> plane, NULL,
> +	ret =3D drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base,
> plane,
> +&intel_colorop_funcs,
>  						  PLANE_GAMMA_SIZE,
>=20
> DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS); diff --git
> a/drivers/gpu/drm/i915/display/intel_colorop.c
> b/drivers/gpu/drm/i915/display/intel_colorop.c
> index f2fc0d8780ce..fae4383f8518 100644
> --- a/drivers/gpu/drm/i915/display/intel_colorop.c
> +++ b/drivers/gpu/drm/i915/display/intel_colorop.c
> @@ -33,3 +33,9 @@ struct intel_colorop *intel_colorop_create(enum
> intel_color_block id)
>=20
>  	return colorop;
>  }
> +
> +void intel_colorop_destroy(struct drm_colorop *colorop) {
> +	drm_colorop_cleanup(colorop);
> +	kfree(to_intel_colorop(colorop));
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_colorop.h
> b/drivers/gpu/drm/i915/display/intel_colorop.h
> index 21d58eb9f3d0..79824506bbab 100644
> --- a/drivers/gpu/drm/i915/display/intel_colorop.h
> +++ b/drivers/gpu/drm/i915/display/intel_colorop.h
> @@ -11,5 +11,6 @@
>  struct intel_colorop *to_intel_colorop(struct drm_colorop *colorop);  st=
ruct
> intel_colorop *intel_colorop_alloc(void);  struct intel_colorop
> *intel_colorop_create(enum intel_color_block id);
> +void intel_colorop_destroy(struct drm_colorop *colorop);
>=20
>  #endif /* __INTEL_COLOROP_H__ */
> --
> 2.25.1

