Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4477CAE5B93
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 06:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E39AE10E4B8;
	Tue, 24 Jun 2025 04:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bTIfLXSS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5920710E009;
 Tue, 24 Jun 2025 04:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750740192; x=1782276192;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8U4QUxntS5nMBx9Ki5JrqhSiIRw3NZIQHsmnJcUbVyo=;
 b=bTIfLXSSZhEvUGp+Gff47ecVS+LfjCTGWwD1rRxBknlJL6xLuzqdT/a3
 S8AR1902shccF6Ii9q+pdpX1rRPjmovbWgrgjBYLXTYCb8MoVzlHeW1WZ
 9lEg34HvOqb40BtY9VUQ8iggJfJ/0UYcnDufBiNriTPrSwDDJwMmEHlLw
 dtR3fCxlkb+TZu6yr3r0YthvfQzqpQGL9MAenYqrrP6pgazF1YKHdcBBc
 m7BB8ysMrq7ySM42UQJ6bstNMs+V900u61KUT7EhRoFFsM79rOYhrH4KT
 Owd22YIopXC2sP99SX5URalb+txJBPqDOuZmABkziShR6wFKcU4vsOcfC g==;
X-CSE-ConnectionGUID: QrFBNodZTKOiaOvGq6Asaw==
X-CSE-MsgGUID: paUBIKCFRGyVA/gvbunp1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="78381409"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="78381409"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 21:43:12 -0700
X-CSE-ConnectionGUID: 9Zog+V00QVKRQlyGqsKR5g==
X-CSE-MsgGUID: R75alfzVRpejV4JNREAMcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="156091059"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 21:43:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 21:43:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 21:43:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.50)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 21:43:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gKIrHhuo49NkkFkUblRoCim9HgyzHayWpgrEPOtwZXHOIoYR9UpFUb/T2qiXiK6XbJyhH5baFyR/vpiA4/QBWjA5cfgFv4HHKP6qCuVHhxeWg6fX7o9X9n/74Owb+Aj5mPfSdVUTteGMISi8MZohri1BEpkjeRT1GJMZvnUNmBA3uHfGprXDO00qrzVJTh4MyMkZg6FYzFGMgYNCEB97fxFL7PR7BOHKZYzic4SQstTV/X/xRQc2MvexG0EnYB8cD8pAqOathJVMC3FVnPeLJxaRVBd6kvN+6GMGO9f0tN+c1saeWOYaD0aYpV66CNUxTXCjhLlsRFyKZFrTmpN3TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6BkPQP6G7VFtbzNex2FT9YxNEpY3uawXtW1uSyraFIg=;
 b=p/QlRVj/9rqqJEi+WEiBtT0RLFwT0VPVCyd1LutSZKfudz1oOo2BrvJboFHz3V+m9ydDXdBU+F3vofqN7ONERXth7OuY9KKxBgurOxyBuvjY0/hShJIe81s1nGXC5BGRoCR2b5Vzuf2giBvRxoZVlYx46Y+iH99BhHVFC3ek4QfOw0ow2NW7RiE1ZphfEBMrFwcwhrcWDCJJJIMBa6yJEeR+wH0bNEVZ5wILiVzt5MatNrEcdm9ADhCiVwlfL4UlHjBzk0KvZhdJtgYwrmHnX55/ZyLcNVROn9+H4ZYFFoS4eblfSwBDwakppXzaMMU14W8VVCtVSbYpn/P5BFgF1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by PH7PR11MB7449.namprd11.prod.outlook.com (2603:10b6:510:27a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 04:42:40 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 04:42:39 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Subject: RE: [PATCH v3 03/13] drm/dp: Add argument for max luminance in
 drm_edp_backlight_init
Thread-Topic: [PATCH v3 03/13] drm/dp: Add argument for max luminance in
 drm_edp_backlight_init
Thread-Index: AQHb4a2GOx0JiKe6d0aBt13AvQ1T1bQRwS5g
Date: Tue, 24 Jun 2025 04:42:39 +0000
Message-ID: <IA0PR11MB7307974170540564F0A3B908BA78A@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250620063445.3603086-1-suraj.kandpal@intel.com>
 <20250620063445.3603086-4-suraj.kandpal@intel.com>
In-Reply-To: <20250620063445.3603086-4-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|PH7PR11MB7449:EE_
x-ms-office365-filtering-correlation-id: f060cb35-0e88-4668-5bcb-08ddb2d98cf0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?SQQysPh87FqTmM7kkYQlqmjufIW3vLU0n4u0mlMbvtIRXm92K9rqxxUKxNWJ?=
 =?us-ascii?Q?BDWr6nbrcFs4cDQZlyDZDKfo0/mFxEmrpoht+vbJbgGCpyt90wV6WTHwjDw4?=
 =?us-ascii?Q?Jh9aNjizjusVYjkvdAr98HARHkT8wt47MWqCNdsxyu92ot9ilWP45OHWtigs?=
 =?us-ascii?Q?3N7GuhAW3l2xlMAsdLZnIpOiNUdqjQM0X+wbAovhdW+dALAxDkw1xQxLqRe8?=
 =?us-ascii?Q?zFmnAgf36aagyZIKE5spQSlaFFxYBnvsIecDqBOcOvjuW89pLhi0h7ONT8Lg?=
 =?us-ascii?Q?XINv91FQRwlMov47Wc3NigXCkA273DXVJZT5z4ZGpZIAf5cHve6Tsl5EvqzR?=
 =?us-ascii?Q?iayvCMWe5R/gGWkd6cu4Cxi2R8PpJJF9ud0T0TP/O7TgDxoOlD5qWGZB2IQY?=
 =?us-ascii?Q?EGnB9W4A/uYkMoD7KAMwOXJzLaI502tbAY5K/nQBvP2YMKXyNgp45peMsZsE?=
 =?us-ascii?Q?x5CvfJfTANJQvtB/togVIHRONvkw1Pndcz2kMFXgE9pnoysnvOcjOvAGdv4S?=
 =?us-ascii?Q?Omk4bx58bjKlRl3BizwebD8ZBLcdMFVPCWsxMA9Ty3TAOXyqb76HtB8EfwEh?=
 =?us-ascii?Q?a2cxRC9FzwVkrJY5rZne5Ump+SjP8fyp88f52U9l6Iz0qCwc96593V9TO7jR?=
 =?us-ascii?Q?8wPfmnxb/IuCyUyiNeGjJwnhCWkNu9F6VDtRmeGUH+9ytAN+86thj7BohOYD?=
 =?us-ascii?Q?k1kmr+mLhz9ex9vq6cfb50XSIPhBj0/2IWeIoU4atLY0kn9g0kRvH+DKe6kp?=
 =?us-ascii?Q?HqfIMQhzRnx08NTWITZsEjMqhR5iTvnM1cgFZS4whrLL1cjclQI5/oIXlApX?=
 =?us-ascii?Q?NyexyOGQwG1mVE9E4lKQ4j+pIc6xJUZpe2l4OgC39NfnsKJ9bhhZFyW9MjV5?=
 =?us-ascii?Q?xdRzx9QzGw4xPl7vW3o1XWNQdgZFdgoshMFGYlPWAPswtNjGH4R3TfSw3a3e?=
 =?us-ascii?Q?YAdLOEy7q5T3+PqzY5KClS4iyDDIMPQmJ5YBrhaqPWfq90UCiu3YPRmVb2Ua?=
 =?us-ascii?Q?G1CZkCvKPR47RJUGWMTvfcqms2Wqu9nni5OcvQ4k674eJ63tyVW/gD1O/IAi?=
 =?us-ascii?Q?HbZXan2sUy21ksoByEjHVz/ExEeGGHtkSozxRoe0PbNmorrapgeuakeVpsW+?=
 =?us-ascii?Q?jNcJ1QoI8MsTdyp/wjq1jR+Vvl7O+Uc09kZJACtyJVxS1z6M+riY5brBH6vu?=
 =?us-ascii?Q?MM0CnwBs6MqfM7tIDVbIqtoFTXuhcuiyd6ctoFTZuxWm1hFEifGNm2z7O4r3?=
 =?us-ascii?Q?Qxr+nY2gZSolJx2wu1r1M9jJmvwr0mQ1BtZB36KehjvgemANmFyAaDo3glZY?=
 =?us-ascii?Q?c/pYNfonIN4QcMOKxMSecbHCtcN6sE4bwcwzvSHlJbUgREPTpHI3Aa2GyhCv?=
 =?us-ascii?Q?j3weMzmd+g9XFQMUa3k6903E81RYx1jn+3Fg6SlrorLYZiIFrSYWeK1qEMaW?=
 =?us-ascii?Q?KjGnAJKgvkU7TtE/g4Dzv8vxUfZqYgwvZhd/H166I7lWf+jcST17Q5XetYpc?=
 =?us-ascii?Q?R9TVzDFAhWUYcbE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wze6/J4OtItxNeIui/F2rMhOSVRrLhuJXAEYTyy0DwKVBK5pLH3mZOWrzlZc?=
 =?us-ascii?Q?dITE7gQFKx7HMLFVjVF24G0fB0v9BGS2wqlSL5yuObxhj+o3bMetEvmLn5Tb?=
 =?us-ascii?Q?cV8XvZxtsOdfsHcFadbw2+gqpUNTpZp024uesFwcz9qkiBD6G8q7n0cS5eVM?=
 =?us-ascii?Q?sQ+C4imjF9fZja9YJddANfqIoZR5j5XtOm2nv2NKXE8aYpeBtVw+pj+GWcpC?=
 =?us-ascii?Q?ZfTiOK2kP8YtCNfF6ntxw7GrWvC/Y7W/1bKjbQLWdfsVqEfd7AyE+CmvILq1?=
 =?us-ascii?Q?ZZ6YlgvY+jz6MmIG6TGm8T9p/uG0zBeZK0vVEAu29m8uXBbc4NUq3jXXgQ6s?=
 =?us-ascii?Q?hzJctkSS/wudw3tfk+6QE9FvX0m2c4yzHJA1m82A+7mcJZOgQpDfDI6wb540?=
 =?us-ascii?Q?GQf38ZBKS98ydcT8LWog7FknAjG+/8CjyiCVAQPySYYep9lYilKhcl20ASaN?=
 =?us-ascii?Q?JicPLVbgaWZnEGsNkB0BmKE8rIuNoisKHpzx0VcEkuUZqsh5LoTBUQ78UJnq?=
 =?us-ascii?Q?XsoPN2Zaj9QGS5XdPp99swgMDXq2eAjQ6UwIlevh5wf8mgtNnrx25m2zKoCq?=
 =?us-ascii?Q?7zV9EDZf1Y6N/axa5tpX4JInEMwIJWtjfjJQW6PqGj4YNH/PF0y1SL1MZhlQ?=
 =?us-ascii?Q?pj4F6nvArOla1D2SKmVbDLLau9teqyLMPs6dzRINj/BBQmBbea9Wpz8slchx?=
 =?us-ascii?Q?Z4E/zoyEDRkMJzIcqhsjuWUC/V6Uuvgp19ovXUYwEGGmtwuiKeKKi9c71wqM?=
 =?us-ascii?Q?Pub0KxGub3iqkk+IMSoJFX0b5qWhzZeJe9ZLtwcGpDpFr6X3SZQWIvR998Ac?=
 =?us-ascii?Q?O5+XTeaOOmVkY4MrGlxMy5kcEJlwzA23GM5eiQltM+zjetUHM1tyFIf6ZtHV?=
 =?us-ascii?Q?L/cMzrIiP5OQ+tuv7E1azT2vGZ8jYMSmf/piNobE+7SQiJoGbet7b4nV4Q4j?=
 =?us-ascii?Q?uoomsh7zJwtBWSpcidecbxyl8BeN9KTmmHni9JXIH75EIxq9SVCq8oZXNvxi?=
 =?us-ascii?Q?kogA6gWX+RhUwiptslnCaq/hqaW/l4AmMh6cv1qI1qwvasusnkvFIOY9abMj?=
 =?us-ascii?Q?mtQ5Gz3RZ3AUzAS0/i8y5DiBmeaIe/kBrwVd6xNrVeM7dWl2xfmJopTYDeHv?=
 =?us-ascii?Q?s+c4MERq3st9hDok2j6UL3rvNOGf8QP8ELH4ZHHtPE4BeALZVIHhi3JiF5Ku?=
 =?us-ascii?Q?wRis0nN5UzqEOuaCVQUnoLsJYEPRnkTDjS6er7c7DDYqbOG6RP8VWiMI3hh2?=
 =?us-ascii?Q?BYY5EvhdNa1xPeaivT1RrbgblGpEXZkK6+8DZ1bG3TS6SEe29lctgWusRqDw?=
 =?us-ascii?Q?2b8CpSPhje1CPElxVmxA+oLF5H7AN31qa+HPbdIzqB1Dd5vPk0ZlEVjsvUcZ?=
 =?us-ascii?Q?KYD/GZMvyZDa25aA7vSGK2zvMJzESFBVdANa2utH+dSOuo9VDAQWHlqMJMiW?=
 =?us-ascii?Q?3zmC7kOB+21xKDXA6Y5K+3kzsxaW70I3ID3G6+PPc8E0ySEB/uSKi4Hbe8oa?=
 =?us-ascii?Q?xbdi4gw3OEsNdcKIHneYAEXbSKYMeKKNCfaFS+FTyPHGSdAdHqkEcjzjWmSs?=
 =?us-ascii?Q?GdWI+23I9GEoFutEJaR+ba7gg+o0+zzNm1i5Fywe?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f060cb35-0e88-4668-5bcb-08ddb2d98cf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 04:42:39.8073 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ji4beGqfZiVWbp9cWAtarbM6ryU3BpwZJOX6yp20RGo+s2KwXCn+oWqzABDgZBJ9Un3gZyzZ5dHJj/tYUWELdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7449
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
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Friday, June 20, 2025 12:05 PM
> To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org; nouveau@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: [PATCH v3 03/13] drm/dp: Add argument for max luminance in
> drm_edp_backlight_init
>=20
> Add new argument to drm_edp_backlight_init which gives the max_luminance
> which will be needed to set the max values for backlight.
>=20
> --v2
> -Use pass only max luminance instead of luminance_range_info struct [Arun=
]
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
-------------------
>  drivers/gpu/drm/display/drm_dp_helper.c               | 4 +++-
>  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 6 ++++--
>  drivers/gpu/drm/nouveau/nouveau_backlight.c           | 3 ++-
>  include/drm/display/drm_dp_helper.h                   | 1 +
>  4 files changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> b/drivers/gpu/drm/display/drm_dp_helper.c
> index 2a662951f7a8..9df95776d1cb 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -4251,6 +4251,7 @@ drm_edp_backlight_probe_state(struct drm_dp_aux
> *aux, struct drm_edp_backlight_i
>   * interface.
>   * @aux: The DP aux device to use for probing
>   * @bl: The &drm_edp_backlight_info struct to fill out with information =
on the
> backlight
> + * @max_luminance: max luminance when need luminance is set as true
>   * @driver_pwm_freq_hz: Optional PWM frequency from the driver in hz
>   * @edp_dpcd: A cached copy of the eDP DPCD
>   * @current_level: Where to store the probed brightness level, if any @@=
 -
> 4267,6 +4268,7 @@ drm_edp_backlight_probe_state(struct drm_dp_aux *aux,
> struct drm_edp_backlight_i
>   */
>  int
>  drm_edp_backlight_init(struct drm_dp_aux *aux, struct
> drm_edp_backlight_info *bl,
> +		       u32 max_luminance,
>  		       u16 driver_pwm_freq_hz, const u8
> edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
>  		       u16 *current_level, u8 *current_mode, bool
> need_luminance)  { @@ -4396,7 +4398,7 @@ int
> drm_panel_dp_aux_backlight(struct drm_panel *panel, struct drm_dp_aux
> *aux)
>=20
>  	bl->aux =3D aux;
>=20
> -	ret =3D drm_edp_backlight_init(aux, &bl->info, 0, edp_dpcd,
> +	ret =3D drm_edp_backlight_init(aux, &bl->info, 0, 0, edp_dpcd,
>  				     &current_level, &current_mode, false);
>  	if (ret < 0)
>  		return ret;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index dc6f6680774f..ab594bf028da 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -599,8 +599,10 @@ static int intel_dp_aux_vesa_setup_backlight(struct
> intel_connector *connector,
>  			    connector->base.base.id, connector->base.name);
>  	} else {
>  		ret =3D drm_edp_backlight_init(&intel_dp->aux, &panel-
> >backlight.edp.vesa.info,
> -					     panel->vbt.backlight.pwm_freq_hz,
> intel_dp->edp_dpcd,
> -					     &current_level, &current_mode,
> false);
> +					     luminance_range->max_luminance,
> +					     panel->vbt.backlight.pwm_freq_hz,
> +					     intel_dp->edp_dpcd,
> &current_level, &current_mode,
> +					     false);
>  		if (ret < 0)
>  			return ret;
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> index 7d93266bf26a..d45619db02a2 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -261,7 +261,8 @@ nv50_backlight_init(struct nouveau_backlight *bl,
>  			NV_DEBUG(drm, "DPCD backlight controls supported
> on %s\n",
>  				 nv_conn->base.name);
>=20
> -			ret =3D drm_edp_backlight_init(&nv_conn->aux, &bl-
> >edp_info, 0, edp_dpcd,
> +			ret =3D drm_edp_backlight_init(&nv_conn->aux, &bl-
> >edp_info,
> +						     0, 0, edp_dpcd,
>  						     &current_level,
> &current_mode, false);
>  			if (ret < 0)
>  				return ret;
> diff --git a/include/drm/display/drm_dp_helper.h
> b/include/drm/display/drm_dp_helper.h
> index fcbf447206cf..91094a38594c 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -860,6 +860,7 @@ struct drm_edp_backlight_info {
>=20
>  int
>  drm_edp_backlight_init(struct drm_dp_aux *aux, struct
> drm_edp_backlight_info *bl,
> +		       u32 max_luminance,
>  		       u16 driver_pwm_freq_hz, const u8
> edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
>  		       u16 *current_level, u8 *current_mode, bool
> need_luminance);  int drm_edp_backlight_set_level(struct drm_dp_aux *aux,
> const struct drm_edp_backlight_info *bl,
> --
> 2.34.1

