Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63919C684D3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 09:52:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB7CC10E452;
	Tue, 18 Nov 2025 08:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZyQRspci";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1CD10E460;
 Tue, 18 Nov 2025 08:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763455935; x=1794991935;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N9ilKHpkGy9CtDJn4qr8H2YPsg0Gq9XWHw83Ir28iL0=;
 b=ZyQRspcioeH/lEzW+sDKNL/5BXL6NJEd95RpancIgnPoCXUu6ltExqSE
 zJuE0Jw9RNrDpe/hiYIHzla1y25caaGf9VNhh4j5YT40eNqnSVHcviziL
 cSWFbo8+ygUCvLh4/YgVT5yqnehnGRz7moUSUfCvL9Jp3oUzqUfgWTjaE
 b90jUSL9cv/0CwzA0ypkcGvvUPOU4qVU78uE3xzv+/ULbMUjA8punfEti
 XaJ0iopTXmL5HAH+gAeUkH95UFnbX7b4fc9x8HEOgAbF2gS5HgXjGXxbM
 pQA/9GfXsx/FTwJ0KC9B5hRY6ZquhaeKtWHW+QQbstbjJ5HcIp2ZaReSl Q==;
X-CSE-ConnectionGUID: DsadNw2NQU+kYws+U9smrw==
X-CSE-MsgGUID: T1DSBCGlQt20KjmmAR54Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="83095966"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="83095966"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 00:52:14 -0800
X-CSE-ConnectionGUID: OWfiMCsxTZGdfNRIVmqm9w==
X-CSE-MsgGUID: dAHmg9o6S4awe1jTYqRepw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190367510"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 00:52:14 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 00:52:13 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 00:52:13 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.15) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 00:52:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z223Cqs04Xi1RWl06TrWLjqL8ywgDgppbaOSQbkvYhbo5Ft67cG/NC74q9TmntVbSzGsBWNv4clc51Y3LfVqqQTK6tTrOiHVd+fOwlTMD3xDawcuC75Jqlm76OvwObaVyKPyx8TFKlHPx0NYVkznhh2DCt/HeE0+UrtN09fDuxFTJeBR3HFIjtVoSbFQ7feEw7eGgemsm7bp7GRtQ4tKsSlfvLJ8vUEay2afyU5hc56vnTZGgvUuS5nLb2OoqAVlZw5FIeXdf7d1ob47gRZAnoEcTc27JxVmSn4oknXmO/r+iODFKyXE0gORrS5Cz3zsXlBdjpPxsxdutfmtR9HEEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WhblAt5R2YDG0NLKtXLAY0hJOiga+HKVxJyTxcH4IWA=;
 b=mpvvE9A0T0R0a7IQug7x0XxyN3pmh+MbKYkkt3Mr8fD7x9lFGzXJDxQVqnzIWuoml9pFIx32kcCPiTgulmnJi+CPiUCtPV0iXLBPV3rPJyxgdrds1rbSly2Iv9jj8OHYgNgXQS0uvSxuE3mShfyaZ8ESaUKfOeMA0pmo6G+qO2X5V6Q/V5QlMn3Odo82NsIoHIFeacIo23qCqE4TwjEuuBwWEjcDKuPTYr5E319hfy2elGEx8ej0ytUoWCUAjcu/0MumDUIO/Mqe1TWsAVH+Itt43s6k14yS1zKw6csqycUepNNnI5nmWmbQtNGuz8VG30sZQ3aQk8cBnJXS4bHPdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SA0PR11MB4527.namprd11.prod.outlook.com
 (2603:10b6:806:72::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 08:52:11 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 08:52:11 +0000
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
 "alex.hung@amd.com" <alex.hung@amd.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [v6 16/16] drm/i915/color: Enable Plane Color Pipelines
Thread-Topic: [v6 16/16] drm/i915/color: Enable Plane Color Pipelines
Thread-Index: AQHcTk8aoHxjl9OftkW9UKEkeZOTgLT4NISw
Date: Tue, 18 Nov 2025 08:52:11 +0000
Message-ID: <DM3PPF208195D8DF2FF04E54B9F808A2ADAE3D6A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251105123413.2671075-1-uma.shankar@intel.com>
 <20251105123413.2671075-17-uma.shankar@intel.com>
In-Reply-To: <20251105123413.2671075-17-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SA0PR11MB4527:EE_
x-ms-office365-filtering-correlation-id: d45f9e44-0855-4833-2a68-08de267fc38f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?hL944Js7V8bypcR57iCAU69UjuYmCRkFp5mWXg+R6kAp35xohH8WBdwp3aZP?=
 =?us-ascii?Q?TtUwyBbZL9eTk9dPLv3Q1XMNe98buY5c0g99v1ruOZN0RocJLDpkNN8MA3+A?=
 =?us-ascii?Q?vdY/scTvkSNO9nJnDIFhwdG4mLnAOO+mkALGveei7XlHpMVqwvbUR3DU97B1?=
 =?us-ascii?Q?1a/jSi9+h0pe3PJs+JRCG81kUR1c5spRIM+1ovWsYbPIEka9uD7wKfNAwVye?=
 =?us-ascii?Q?uQhqdlPM7L++/6/JOb56oj5LEKTp7H9bXEbDfiEENQDYEFbfAekjdcYXCqT6?=
 =?us-ascii?Q?KvRFq5zr5xp7qDrea7ygQwl5Y5DGeHN11S4kg9U4t9UC4GGH+TFf5aHqOkOp?=
 =?us-ascii?Q?pGAQg4IQ2BpAPEVU+oAalnxYJBcLw/C505xUpcv4qMYbqGJr9eFpmkyS99Qy?=
 =?us-ascii?Q?0BhRe9KlDFnbxShezKwB6lvTi0+Apl7blVxQWSwI0fspEJ5OVbtOxqpxkFw2?=
 =?us-ascii?Q?H3dEZtMpva+aOIAzkl4dBdDQAWP5Va45AoJNr+HNoXbohjkyjab3O6evNBvz?=
 =?us-ascii?Q?3HoK6MhJR18jO1NJqDD8gg3L+KzdjPofbNBO3if4mvtdt0llNX6fpB890Kq3?=
 =?us-ascii?Q?aSsM9s97/AdzsP7z8jrdOHnbrEzWDw/oQOLEuIpDt7tfgbTTu1ncieAG/vQz?=
 =?us-ascii?Q?myzFbNKvl+kVORaPcZJIT3p2UjqlR7mPDximElFGKTLMqsdXVy/CHZhMG57C?=
 =?us-ascii?Q?5nokHB/9UpWr72nF4A8B1wjVsnpmnNEj5GbBs2fdFUK4KnytunsAQ/mBKnnr?=
 =?us-ascii?Q?o54g+W9gej4Mh0oRV+r+NEMTWOuAdGQSmiTgTgw8JE2A5GBwGZ8KTbfv26Fc?=
 =?us-ascii?Q?5WsjAwrSF44VbEaL5uNGFFHlwBqSrm9kfxY3uMkmJgBWltJ6Uld5TnasUX0j?=
 =?us-ascii?Q?FDn0+HcHVxhw7Q3pqOt9KCNmPS/fwxaE0qh/9bF2+/FOiiaXyuX63wOdYzgD?=
 =?us-ascii?Q?vpRQzjUDHxLyH21eTmxlYcp6IiKi4gUmdLabvNQ7dIqsA4rbW1NcgDlgHWRp?=
 =?us-ascii?Q?6ar015xRZMwOZTBh82Sk1uz/VhRAwsoKfzhggvSoZ/9GFq9VMSXHY/ZIHqRU?=
 =?us-ascii?Q?ArFYpKhMBieTuF0GHfvHut4J7qST90jFuzb3Mm03m7NukQgR1oXmfdHZAUjs?=
 =?us-ascii?Q?ZFBo96hGokcEydZbeP6l/r4ed9PiOYbnPuaYnDcGwXdwNn8vCg6zC/BG1YzX?=
 =?us-ascii?Q?XmG2BWR9v8PEw/MhlO333aQScJdYxTFvk+6tGh8A+nQ0vBcA8GAb9m3sbQKl?=
 =?us-ascii?Q?b30uaD8tw+CHHeY+sFx+a3lEZjUIwexH+8BmI4TLZTZ6LpdNTK8mukBSmmgz?=
 =?us-ascii?Q?hLk+uUJ5Smny33qOr7qja0Z++P1XOeVo1CRD5Nk5d0ZP6yKZXVqkiseOHH5S?=
 =?us-ascii?Q?IGwZXeOZO4ZEKITvBhu3ToiJDK3XSW7YPYDQa4/yqqMcNTsQVMqFmoGwnRDl?=
 =?us-ascii?Q?Z8WbQP8R52loqrxvzo5hok8Cy9svDhnfNrK7tZ5T3kUDaeyAuILdJB/dSP3j?=
 =?us-ascii?Q?g0I6vBR1S1/flyE+VsO2C7QXFbvsKxIZIYht?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XV9OzNG3gl4shm+nW3TqpIeLouuVZ0m1MQzdzn0hXfsiz0cj2DlzorcebCPB?=
 =?us-ascii?Q?r75IgAw0Ff67XeTs5myHEw4vI8Rn/igGqghCLid9LW56ubyP4oJcX/1I4SsD?=
 =?us-ascii?Q?Tpz/AhIkyip1SfewsUMQCT75DkoJarlSLqN7XWwmOuRqSt7yJcbdZ6iJ+f5R?=
 =?us-ascii?Q?TcWFzGfoqSCj/wGxRAZy1o6Ui+vP0pBVO9XVxWFCuV7VtPd08T2RzDHk4tYZ?=
 =?us-ascii?Q?wzo6XhOkc5B0YdQqeqXTnGCxQPgaie7t0gL/yClH65zZqULsLjPjSf7oh0Qd?=
 =?us-ascii?Q?d+fLEGW2d6VDJKvfM/KUNxmclAHCpnXSskIyiM1dqO7u9ocBUzIMSXdZUaFf?=
 =?us-ascii?Q?XUwU2cRqCk0njOcBtiJhrO+dIjxKs1Plldu20n76A5D28l5vtQAf2X2Pd0sB?=
 =?us-ascii?Q?Xymh8+rWkkXl8Q3TNJ6NUQr0UMsTNMP8NCyyKv67qn0DiVWLkyVYOJWr6wOM?=
 =?us-ascii?Q?qrvmITtL4lHxIDqcIxSqZm9fhP/EaE/A1NTKTDFVFB+WKNlmdZXj1Y8HPy+k?=
 =?us-ascii?Q?K8kUwW4Fo3lb8E1KDyBINentizAs24mg08qy1eEBbUCO8HY9A8IehAGjs7ig?=
 =?us-ascii?Q?ufdzPzglazbFV5UOMNM4Ib9GvY1fyIONtRyDf7z5nkRmC/1YI4zLqsKM2tRK?=
 =?us-ascii?Q?42xD+p/4uj9xyXhjWetJ5uApOQR9IflLNVndA93IDXBAAdr3oaxiWxpopbnU?=
 =?us-ascii?Q?H7cd2sGP+sRnhvrptb0UZ8gyI3vAkyyXIGjKZdyJvbv02ev9La+iycHtNyFB?=
 =?us-ascii?Q?Lr7FSr7jlmXY7sBOJr9G8SNAnNF1iKtdN5DZIgKBeW+wYpMy8PdmNCkWMVQS?=
 =?us-ascii?Q?Mqv+3HT6mmw1HlylnMrumrGJAansjcy78QCL6OQgU4umaqNU/KyOMhZ00ioi?=
 =?us-ascii?Q?3qNw4J4LptrHGt2DLl+iwCCvL1HWW3mxB9rkViyyD21iC3FhmI7V40Y4HNXz?=
 =?us-ascii?Q?VKNapBYSJPrO8PcgiypbH1jvG7CFaHCyMvKhNspmxtGroWcYjyxweG5J1Twn?=
 =?us-ascii?Q?9j+3+PXHgT+RoYDeFq+IJ+vtj5j41bxRa+/yztltiwsR/GB+hPPoZeA5O6le?=
 =?us-ascii?Q?A/EccAqexEZk/2s+VBLCF648I1XNq9r5p1jFeWKbtoYxbPumeJTSY/wnbeOz?=
 =?us-ascii?Q?xnq0Dk5Oy1qY8B/+AEUSsT4pHtXb4ymf848xSQwSOoyLKB+oUw01F7oTjIUF?=
 =?us-ascii?Q?BPbKXIySIkH53s77J3PoM97UNOE/ST0G3Yq3koHpB5KKFDXQDGg9us1mZ/ll?=
 =?us-ascii?Q?vspWT0ipmSIvKpBd9z3pt6aFx78wu8CMI2uMIWlPFAFbKmmmf/ZQzfXC67YV?=
 =?us-ascii?Q?qaneeOg62Tqpc2v9CWstxB4bAVnIqRKIdC6NpXRvEVXA2x8uipI8PWaNQNBY?=
 =?us-ascii?Q?pybEO7xECN15qayHKu96cJrU3u7XgxdrhV1sDT5FvgwxT+7LpC6uFgPoqTJv?=
 =?us-ascii?Q?Ye7Ee/+oFD1sJl4YU69SLLtIGEupOmxuPFGXnOikLNrRm7qZgt1alRolG+PG?=
 =?us-ascii?Q?YAYJBkHBNAqbI+QqXuWOQZxDbAAsyVZ0d7oilF92DMUsHmQxMwHJWJH9NYTv?=
 =?us-ascii?Q?GWRDTfF/uWAfjAfKvy0XTdh/LKKDuerxco+8aX6P?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d45f9e44-0855-4833-2a68-08de267fc38f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 08:52:11.6211 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QlutIdUds+SdvCt+/hE6ae3FW/Lgl4yTIOoDYhDKcKvO3Je5nIq6TUUGPq5Ez2HfEci7AthLQlynhiI1UX76QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4527
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

> Subject: [v6 16/16] drm/i915/color: Enable Plane Color Pipelines
>=20
> Expose color pipeline and add ability to program it.
>=20
> v2: Set bit to enable multisegmented lut
> v3: s/drm_color_lut_32/drm_color_lut32 (Simon)
> v4: - Fix dsb programming
>     - Remove multi-segment LUT, they will be added in later patches
>     - Add pipeline only to TGL+
>     - Code Refactor
>=20
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_display.c  |  5 ++++-
>  .../drm/i915/display/skl_universal_plane.c    | 21 +++++++++++++++++++
>  2 files changed, 25 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index 42ec78798666..ea898a0bdefb 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -7284,6 +7284,7 @@ static void intel_atomic_dsb_finish(struct
> intel_atomic_state *state,
>  	struct intel_display *display =3D to_intel_display(state);
>  	struct intel_crtc_state *new_crtc_state =3D
>  		intel_atomic_get_new_crtc_state(state, crtc);
> +	unsigned int size =3D new_crtc_state->plane_color_changed ? 8192 :
> 1024;
>=20
>  	if (!new_crtc_state->use_flipq &&
>  	    !new_crtc_state->use_dsb &&
> @@ -7294,10 +7295,12 @@ static void intel_atomic_dsb_finish(struct
> intel_atomic_state *state,
>  	 * Rough estimate:
>  	 * ~64 registers per each plane * 8 planes =3D 512
>  	 * Double that for pipe stuff and other overhead.
> +	 * ~4913 registers for 3DLUT
> +	 * ~200 color registers * 3 HDR planes
>  	 */
>  	new_crtc_state->dsb_commit =3D intel_dsb_prepare(state, crtc,
> INTEL_DSB_0,
>  						       new_crtc_state->use_dsb
> ||
> -						       new_crtc_state-
> >use_flipq ? 1024 : 16);
> +						       new_crtc_state-
> >use_flipq ? size : 16);
>  	if (!new_crtc_state->dsb_commit) {
>  		new_crtc_state->use_flipq =3D false;
>  		new_crtc_state->use_dsb =3D false;
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index ba1bf0bd4c55..f58d17842c24 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -11,6 +11,8 @@
>=20
>  #include "pxp/intel_pxp.h"
>  #include "intel_bo.h"
> +#include "intel_color.h"
> +#include "intel_color_pipeline.h"
>  #include "intel_de.h"
>  #include "intel_display_irq.h"
>  #include "intel_display_regs.h"
> @@ -1276,6 +1278,18 @@ static u32 glk_plane_color_ctl(const struct
> intel_plane_state *plane_state)
>  	if (plane_state->force_black)
>  		plane_color_ctl |=3D PLANE_COLOR_PLANE_CSC_ENABLE;
>=20
> +	if (plane_state->hw.degamma_lut)
> +		plane_color_ctl |=3D
> PLANE_COLOR_PRE_CSC_GAMMA_ENABLE;
> +
> +	if (plane_state->hw.ctm)
> +		plane_color_ctl |=3D PLANE_COLOR_PLANE_CSC_ENABLE;
> +
> +	if (plane_state->hw.gamma_lut) {
> +		plane_color_ctl &=3D
> ~PLANE_COLOR_PLANE_GAMMA_DISABLE;
> +		if (drm_color_lut32_size(plane_state->hw.gamma_lut) !=3D 32)
> +			plane_color_ctl |=3D
> PLANE_COLOR_POST_CSC_GAMMA_MULTSEG_ENABLE;
> +	}
> +
>  	return plane_color_ctl;
>  }
>=20
> @@ -1557,6 +1571,8 @@ icl_plane_update_noarm(struct intel_dsb *dsb,
>  	plane_color_ctl =3D plane_state->color_ctl |
>  		glk_plane_color_ctl_crtc(crtc_state);
>=20
> +	intel_color_plane_program_pipeline(dsb, plane_state);
> +
>  	/* The scaler will handle the output position */
>  	if (plane_state->scaler_id >=3D 0) {
>  		crtc_x =3D 0;
> @@ -1658,6 +1674,8 @@ icl_plane_update_arm(struct intel_dsb *dsb,
>=20
>  	icl_plane_update_sel_fetch_arm(dsb, plane, crtc_state, plane_state);
>=20
> +	intel_color_plane_commit_arm(dsb, plane_state);
> +
>  	/*
>  	 * In order to have FBC for fp16 formats pixel normalizer block must be
>  	 * active. Check if pixel normalizer block need to be enabled for FBC.
> @@ -3001,6 +3019,9 @@ skl_universal_plane_create(struct intel_display
> *display,
>  					  DRM_COLOR_YCBCR_BT709,
>=20
> DRM_COLOR_YCBCR_LIMITED_RANGE);
>=20
> +	if (DISPLAY_VER(display) >=3D 12)
> +		intel_color_pipeline_plane_init(&plane->base, pipe);
> +
>  	drm_plane_create_alpha_property(&plane->base);
>  	drm_plane_create_blend_mode_property(&plane->base,
>=20
> BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> --
> 2.50.1

