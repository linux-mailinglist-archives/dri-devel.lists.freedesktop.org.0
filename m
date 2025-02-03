Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 152C3A252DD
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 08:13:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7750F10E3CF;
	Mon,  3 Feb 2025 07:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jc0fUwND";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FE610E3CA;
 Mon,  3 Feb 2025 07:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738566826; x=1770102826;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=udBABZtzaEDXKBgkGycw97oFqyIJ1dM2DjDgCYHA+X4=;
 b=Jc0fUwNDwIIbjIXGFRZCI+VW2IC8sC0OVyDmlJWxvNa4vhNk4Pywd4BD
 PunoeMPz8qMSvgY/WY0yaOQ2W9/QgPMNYI9rC4oHfHbCo0j1mWWmGGCt0
 4z3N73jMrubPuiJXYaoXuwt717ghoCN/hqMWi2qepPNLuK2nFp16xFyyx
 LKRRW9h/ZVG+4Dv9Y0kBBUniTaoC4hg728SPJK0Gy3eJOTYwQE+M5ryek
 6OIQmqkG2k/l1/959KRNJ6YBN+npxacSonaq7B64FYR/oQGUaFQ5oJI0b
 o4toD8rx0ki6VEvSowhJXvbE0kdtlrHuY3cQ5u7iL3Enz8tkAON3HhnyN Q==;
X-CSE-ConnectionGUID: sziFsFhBQ6aGXjQXtb/Gqg==
X-CSE-MsgGUID: EECclJ2HRxW9D/NltQx2Sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="26652342"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="26652342"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2025 23:13:45 -0800
X-CSE-ConnectionGUID: IrhsWixLSXOMhvGvRQrAQQ==
X-CSE-MsgGUID: SqBuAv5eR3aWU6PoG+97QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114836845"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2025 23:13:45 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 2 Feb 2025 23:13:44 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 2 Feb 2025 23:13:44 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 2 Feb 2025 23:13:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GMQZ7AR0AXWfJjLsr4yARFvThmmOSm9SIhwEjJZPFivWeDVIYphEwKWrrLUh+sk6qO6NGR01PJ/2hgif2dqqIjk03GyM839buQkBY/+PAZr5mtlmsCkT0qnT/kxmq9lm6CkwIx7//YNpPV8VPdmNQ9bVPIOIquoRjjYE883u4MfiQWRTOVGhJpENyFAEG6VUA5wLUVCDUgrzHCvn9YUxXd9Laumfy8/hwoLzbIhrAfYYGTUM5skig18gTe5H1zw+byAWoYXlHsegYRu52PrIg+jqN7/D2zZlt/PvinehM3Ob68mtvaNVAGbsDumRaEhdjL11eO12+tlDpY6T0QIZEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udBABZtzaEDXKBgkGycw97oFqyIJ1dM2DjDgCYHA+X4=;
 b=h4sizwlCZi1Voc7650JgM38IkKT0PO0V/1vh09dQ/jdyj37xwTAGWIVT1Hrjh1rK+Rm+7Et4l/iKuqZLgEYV8wSEBoaEXaZj/Y0yISbgiDIWG0J5wEoalwV1IDGi8+mQwgspWr2Fp8tqiAkUBOV/LabAAtdulhdB5uA3y+XL7aT5IcL9LSWw4CVVuatTJHApKxEaKQhFhobRK38CMzCNid17bjy1BQKxPn8srdTzgYNz2ZjioER0IOlj/UItLG/XQ/gC4bF7FWqK7ysEMFvuqg/GE1TtYTWu26g/Egvo9W/EU1q8Q01ViicfdC/9vU0iSHzU6RiIyUT9pwGK10ojGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB7343.namprd11.prod.outlook.com (2603:10b6:208:424::21)
 by SN7PR11MB6775.namprd11.prod.outlook.com (2603:10b6:806:264::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 07:13:42 +0000
Received: from IA1PR11MB7343.namprd11.prod.outlook.com
 ([fe80::8fd2:c734:bda9:b14b]) by IA1PR11MB7343.namprd11.prod.outlook.com
 ([fe80::8fd2:c734:bda9:b14b%6]) with mapi id 15.20.8398.018; Mon, 3 Feb 2025
 07:13:42 +0000
From: "Kao, Ben" <ben.kao@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH 0/7] Enable Aux based Nits brightness control for eDP
Thread-Topic: [PATCH 0/7] Enable Aux based Nits brightness control for eDP
Thread-Index: AQHbbiNyeARPOjP6RkGXWHqNMlR2C7M1OfmQ
Date: Mon, 3 Feb 2025 07:13:42 +0000
Message-ID: <IA1PR11MB7343D33A88BB596E20BB53B9EDF52@IA1PR11MB7343.namprd11.prod.outlook.com>
References: <20250124054631.1796456-1-suraj.kandpal@intel.com>
In-Reply-To: <20250124054631.1796456-1-suraj.kandpal@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB7343:EE_|SN7PR11MB6775:EE_
x-ms-office365-filtering-correlation-id: f657b584-9cfd-42d6-6afb-08dd44224a4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?G5lGY2dh9hFdgM2kEljAvMnUJUvlyX0o0PF6L0mcshzJvsFPz3mRLArfaDGU?=
 =?us-ascii?Q?wKLv15h01/rmae4zyp+ElBfS/thpaIyLNUUneLkjS+9xuz1D3bbrrbd1WZfG?=
 =?us-ascii?Q?TqdA5sxKMLHzB2CerV1De57jTIeAnqIc7WbASh4g7q63iWPce+dyU4w+dTJh?=
 =?us-ascii?Q?MxZndKLqXFs/AlhEiSdzBTTC2jsEmmI+pMEXHPzvU48We6CHE0aSK+QwrWj1?=
 =?us-ascii?Q?iYZzYoeZU5Vcp4PV2t4lrrnptXkdyo8vPP+/9t5If1LhYCGjJ0B+9J+6GT7D?=
 =?us-ascii?Q?MHKqFR/LchAWKg8oLjTpWCAKDt0pdci1CBvKB33JxxSU65TNWPqM9pEvn0SK?=
 =?us-ascii?Q?fToJGGRrBKmI6iIawdVcjPNzN8XU124SOOLxT1hM9kJn74u8M+/dR/RcAA47?=
 =?us-ascii?Q?WZmfr3XQsfuWj3qhpfjvvJRIgnzFMxDPHVmbN9oV0pSxYWjpwGr8/nQeCcc2?=
 =?us-ascii?Q?wDvkHBzc9t1e5w65Z9WYBRkQhjF+OogR3MWN17Tzb3Tm85CXd82jWPR5aIgT?=
 =?us-ascii?Q?tv7GE7hVuMBhHfidqi5jHjTS9mNQJbPjSX7QPfeQKZCFnW2Jqw2DWoyB0Wpj?=
 =?us-ascii?Q?wBYWa3V2QFPtqtW3lUEfqopbs7ku7Pn7mGYiJTbVcN45WnN+nYS82rgq2hT+?=
 =?us-ascii?Q?bOUI1eLTLwbdOsowOS8KV0gbc+ym30FbpSnCu+AQm1QkITENk3TQhONd6hC+?=
 =?us-ascii?Q?pl8OirAs0+ileJ/N8EBBn10XHvO0vaO7NZ2DDLX4h7N7XIXUZLrYmiUh5pCz?=
 =?us-ascii?Q?xVgq2ipP/2EOLE8PJ0MpxvZGH6yCifa1NvRWJ2tFskvlaSXKse3CX3aYieo/?=
 =?us-ascii?Q?ZP5OLL3UO3VamSz+Aw3J1NrQ/RuOQuZkYcu6e/oralBg+tFY0qYCWfggxqy2?=
 =?us-ascii?Q?fqSxn5NUtM31HTk8TYyKr2a+43aJWpsTeiNkwpV+4MJN2mqkV8JbIolZcGY2?=
 =?us-ascii?Q?wQhAX8fOBLa7kESJetM/7kDIrDp1UvjGfq3o+tf7e8SnMjJjQ7qz/uiZEL6S?=
 =?us-ascii?Q?ShXt+eAt7s/9APJ0ZfUOZmhKuoOF4mJqulH8202WZejy4yMHsMdkzFM3AxPG?=
 =?us-ascii?Q?Ib5VhMlFkL3bqjglO/EVVsWpWruZWjlotSpEkqgnK1xS70H6S0mhCGapRALW?=
 =?us-ascii?Q?94tqBGwd53AqJX8x9kbRUhv5TdWS3D0trNqBlavey/FxeH+Z3rkKblMOWlum?=
 =?us-ascii?Q?IONK1vRdee3SHRanHDT4s7VSiTYx6sFz9toQKL1pp91Li7hQQI0V1t4tL0Hg?=
 =?us-ascii?Q?jyiZE8J8Osn7OaWr9kB0Dqi1+960Uto1HbMM0tjLvCZGSl0BuobQ/V5Z1rbn?=
 =?us-ascii?Q?vj7j3KLc/vX7+OWtXnzzxbzzpNopSZ2503wGuW0vomxlfXLMD/Ug/WSj2sVB?=
 =?us-ascii?Q?JlZTj1uEF7tlbkV9fT5X+q6ae3wYCBjBDKZIKUa/UEfS/i7SZFzbhatxEkpV?=
 =?us-ascii?Q?Ody137NVCsaUuL8raFEi5hZUsC+5vTDG?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7343.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jaeTH0NMoVXjUHVM25fv0SgnGspVWIdsJT5dajx6o+Gxb0KTdCsZWojJbdB/?=
 =?us-ascii?Q?F8ligSsY0Xwf0fLGIQbzqaNK0SFt613AZYrkgm3JibORUwnc9ydPuJ3qRlAH?=
 =?us-ascii?Q?nKsH0yVwiuErKxizIUHCemrawkgujlC1xB3D41R4xlusGBF9OFmtIdBczNVV?=
 =?us-ascii?Q?15cKIMtLWIlQBXqWXPWbgWgJuC27s+WfAPNEej9UjQduUlINhM6SYpmKhobc?=
 =?us-ascii?Q?TghHsRrBdr4mnOj3szyiZKISFV7QKL3sxTNwXeuM4y/zBbdLlvE9Ui8WHMe3?=
 =?us-ascii?Q?VkVeOvppef+XmUQ20p+hqbj5U8YKFwzVP4dfWn4RLKoXs+ovfdOhDoXnHT2j?=
 =?us-ascii?Q?kQKkswT2GLBKDiaT/94qGtVGZjI7kHnlYtG/4UlY5MFzX8i/lSqHl0Dvr3qK?=
 =?us-ascii?Q?3+yCSiDhB21X5busz6HE0uaWfiMjHsAB3hLStraYUPJ/PTGvRlM1lqHzyvTW?=
 =?us-ascii?Q?88N8No+EdFFomCqVv2NG/L0JiINUXSeLo041xcG1YmTAHOdkqrUmnA9iIlm0?=
 =?us-ascii?Q?7nLOlNcuy9e9WvZ9AD46uyA8+7DSfeFoMvXrHYgD1YtPgKLsTElOs32t0a/6?=
 =?us-ascii?Q?Md9AMVkNczGIHCZfK3OUqXpfF0P3lOPjmegZBuz5iv0wGRIIKiaeg2naXtYu?=
 =?us-ascii?Q?HOpgvousOaoWjQBOxviEB26Q/TNjukH7dxC0VlCf9f2tV2LK2pbRqMFVs3/h?=
 =?us-ascii?Q?5POwj/H0Cskrvvz6h6FQvcpfDP2FBTMbgDOEMf8+O9aHS6lXjk/Y11HlLMdb?=
 =?us-ascii?Q?cxQxAi5GAVD6tIjy68O7z40TblepDwn81KeF7VvCXMWf9aqAkmLTuFXW2vDG?=
 =?us-ascii?Q?Iq+3X/XpXcuqhSaf024MymM1OeXp5wtaKQLY4HrJtEL2lFeLZ2HyxfAiGXgR?=
 =?us-ascii?Q?ZkEER5rIcqgdGTMLC5a6zW/fM6umbK47YbCFW9RE8mL3EIh7fjEYuh9b09G+?=
 =?us-ascii?Q?cp/Htmn5w6sBthSipmr7qAYpXbVuBClairhvEQepVr7RyE59k5ksXYJacM+M?=
 =?us-ascii?Q?lSck7Gk2BPWBie2H6c9f2XEDM3HL8ADm/ryuepJp1kM8K3vP9K8eh6x+dkmg?=
 =?us-ascii?Q?9cOeF7JS49vp4GCBkMHdALzKNpFRnv20CiUM0vWyihVppWOBO+lh4teK5/IZ?=
 =?us-ascii?Q?dW8OfHvwrrS/I+yiNhFRbLo5GSGeWvRx52PJPnSd3oUNJzaUGu14vrnBmTrc?=
 =?us-ascii?Q?B5H3z15PzKRwNQSCe8UO/KHRMhHcuiHSL7bRUpzNyIsJxtZkxOSfLwqeL4Eo?=
 =?us-ascii?Q?1eqJrDQHc3/woIA1vFQCcTuHHoWn54/jdHBwLqAvriZNBNwfSSFU/W4u8/O3?=
 =?us-ascii?Q?MHlnvL0ZqWWbJ/aeE16wwOYlWSTpD3ZwQalFmlqWWS72lvpuk3jgjtwAdHJY?=
 =?us-ascii?Q?LQZ9654/G9iK40rj0E2PAq9dXAPJ8RVY196qzqckFeHKI6kKtUYbF3UIpXoI?=
 =?us-ascii?Q?v2XVmnqsk46BECmPQW/k3/lFxc9gDiciM3cTflH1dCFmUGbEtojcwesU59Cs?=
 =?us-ascii?Q?jK7G/r1K2cCkMB9Am4/iK0YsexgsERTlxsbccCOVVK9rS78lurCG6ajYB1VH?=
 =?us-ascii?Q?Fu0g1QpmmRP12zKp3hk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7343.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f657b584-9cfd-42d6-6afb-08dd44224a4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2025 07:13:42.2628 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Bc78td4JzHaKL0UmQOUsgmm0bvitiQ/snfj9jfhUkr5Xx5ip9jBXCMekm5RgIJac1ddu+rOSjgV4vImgqhy2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6775
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

This patch works as expected with 6.13.0-rc7 on Dell Bolan.

Tested-by: Ben Kao <ben.kao@intel.com>
