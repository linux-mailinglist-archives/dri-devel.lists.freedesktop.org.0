Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4128DB20747
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 13:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68EE410E452;
	Mon, 11 Aug 2025 11:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QUCVSDuT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F8810E446;
 Mon, 11 Aug 2025 11:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754911005; x=1786447005;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gubdRIw4qolRSA/WaX0THH1KD4/lZteejq+6cgQmrxA=;
 b=QUCVSDuTIwB0mWtXhiQt6cPPLUNOS8QStmnoU/tVTKLRXFn7a5MB8Iz7
 9pxzwpmwRDGgMm9Q796vPuV95el0MEjAaguTKbKnCausBUrFQ5rciQ/CD
 7bnnOwpudVXEFn/6KiYICfC5RokVo9WfCYRv+YqPWwasyQaSRO14iX89w
 88PkXdeiy7ivv78VmNQu1iLlUxsMFIzCh6Z4rM6UEbnyU1vxplJKPzVqq
 LrLjjRrKruMe9ViSX67aoaBanZsuUWrE75mg3GdxU3oRCerHbyVeB+vpt
 uLCIMIpIgL33iI91BtalbalxiF3vf2GBQs0vM247N3oWQbE/wU139oGya g==;
X-CSE-ConnectionGUID: 5yt/7utaQqeRiqp4kVCPjw==
X-CSE-MsgGUID: AXaHRLCDRHWUXd7tIwkHdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="59773109"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="59773109"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 04:16:44 -0700
X-CSE-ConnectionGUID: IowEEHGRRHmG449UqMd/cg==
X-CSE-MsgGUID: kBQFs4mZQ6G7nTXRtbmY3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="170327469"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 04:16:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 04:16:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 04:16:43 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.72)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 04:16:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xdua5kzMYZYdAeiQPL4Sb8KaUHwbP2x/f2OjI33MwUDliwgi9HUvM2xazJK1TBhnz5h0peh9O7q220Yn16kpgUK8/dG9tjBnnTAls8bswW82WjcQWzxf5bJ5pqGX81vkbgp8WJv1PvytrZnuv6nQCaVF31NRw7t6aVupfEqx0QqBbHymLvTQ3aaZQ+/OujtoRGL5WeHiBnQbuHW4jYQupYrIYHViGJxAJS/5CzFRT4WdmPUl2P3ROQe/78/AwJGcrHdETmDXOVyYUNWlqCyqYREedYmwPHspOhZdvhQ8R/aXZrCqiLW5Vmg2suIm3/GPZUjKCZ3vfXT57JbXAClbJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fI22yhOi0JF5qjOSV0vVipUQik9neP3jgiDF4G+2zso=;
 b=aj/WGtrBsoNXq0eONl4NyEva9pgcW1lPA8HNX924bKzWL0f2u0aOq4pj2iz3KiUYBoHESCJtqv7Af2y6bVBvIuc2d5BJy70AvluZSUp3pvltUcV58R2OTqrfm+C/dSxpOL/YtVVahoqMvrpFcd/egBA0RoAgNey2//o6gVMlKbL6573VnAk+D9rU73XlvkiZ35OMHyyi/lpkhPGcYAv8YF4OzbzDdyuhuZm9iw/THvwYSUOe4i8lSJe7c1uyRJssnPehJC4qCiw6G/NfFH3ogil5whAtpYNMPjo+kG80aOCNkMyV/U6kULQFc8aVvoQ0FEgFDnCH9Zbmq5oQjaKJ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SJ0PR11MB5816.namprd11.prod.outlook.com
 (2603:10b6:a03:427::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Mon, 11 Aug
 2025 11:16:36 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01%5]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 11:16:36 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
CC: "kernel-list@raspberrypi.com" <kernel-list@raspberrypi.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "siqueira@igalia.com" <siqueira@igalia.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "liviu.dudau@arm.com" <liviu.dudau@arm.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "robin.clark@oss.qualcomm.com"
 <robin.clark@oss.qualcomm.com>, "abhinav.kumar@linux.dev"
 <abhinav.kumar@linux.dev>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "jessica.zhang@oss.qualcomm.com" <jessica.zhang@oss.qualcomm.com>,
 "sean@poorly.run" <sean@poorly.run>, "marijn.suijten@somainline.org"
 <marijn.suijten@somainline.org>, "mcanal@igalia.com" <mcanal@igalia.com>,
 "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
 "tomi.valkeinen+renesas@ideasonboard.com"
 <tomi.valkeinen+renesas@ideasonboard.com>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>, "louis.chauvet@bootlin.com"
 <louis.chauvet@bootlin.com>
Subject: RE: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
Thread-Topic: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
Thread-Index: AQHcCqI6AGKw1/GB0USjdMcIW4UewrRdM8uAgAAKoACAAA7SUA==
Date: Mon, 11 Aug 2025 11:16:36 +0000
Message-ID: <DM3PPF208195D8DA7D1DA361E677513D3BAE328A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-2-suraj.kandpal@intel.com>
 <20250811094429.GE21313@pendragon.ideasonboard.com>
 <awtqznhquyn7etojonmjn7karznefsb7fdudawcjsj5g2bok3u@2iqcdviuiz2s>
In-Reply-To: <awtqznhquyn7etojonmjn7karznefsb7fdudawcjsj5g2bok3u@2iqcdviuiz2s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SJ0PR11MB5816:EE_
x-ms-office365-filtering-correlation-id: 30294692-fa83-4e68-8941-08ddd8c88935
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?K3Yt1rgHIxqSgRlr/mRljE3Widp2ba+9L2Oi6teR7Ynpg4uwXkfJN+fjUCqZ?=
 =?us-ascii?Q?IJCSc6FGv1ENEGBETlUu+6eUrS1PYFtp+vsZ8FNcEhtRfYYS1X9D370A354j?=
 =?us-ascii?Q?v/YVoQRRuahFljCUTaNp+hP8xfHL3LUd4MNPXY11sbAtcd3+vGqQC9Gxwe6q?=
 =?us-ascii?Q?dppRJ/tSNQnnIvm48z63v3wHJZJ83IGbFGrNDFbIY6Wvs3r76DlBV8EfQl6N?=
 =?us-ascii?Q?mkSsPA9FDy4x66dKjpdseVOM3J0yQmQ2ehkolKhlUKoZeQyBR2tcasTkDrnb?=
 =?us-ascii?Q?WQQqBifPDEBr2Ob5Dzk86VnS3fDJ4mFJq/9NOTg1f5p21A1GXB4wajpNznOo?=
 =?us-ascii?Q?wDOndYCjqk1mDxOOprfCSMhpxpDgmWNFI+kbtxyQFAaEDmPsj32pP3sKNYUy?=
 =?us-ascii?Q?1XkswucPuzQuy+0gRksaTPmStJ6eX4r8RBGBAmWYyWnQId/3Vge7oGfoDaOi?=
 =?us-ascii?Q?EEY69bH5Gp7hbPlSZ3WO/SL0YMpsdu0ppzmapcQlkZcZGKLPbs1dRm/AQ9WW?=
 =?us-ascii?Q?0v+nc8ZVRgXTNJvcGJ6dPGfFrt4YH3Nq1immi/1Gd50thHbUkPg3AQKTfFgW?=
 =?us-ascii?Q?piImjnyHzpJOv4pd4QZHW6SLqhxxEMwyQRyX3NF8NAw5cfk7DaoQRYkHKfkj?=
 =?us-ascii?Q?NSXxWyckV6UMHA11ZuKRdDzgFxH0eLppiLpSXxJCWp/bzL4ekn1i2hjFE2Pm?=
 =?us-ascii?Q?/nGmT9XSMXcA/Bou2y8KAQussClf9j9/qkedRvqrq/vO3vQW7pne+gRpaC6c?=
 =?us-ascii?Q?tajI4n997DBzjdoNTsN7Dh/n3PX8dJG82K0DpDEI123+I9MNoA7ixgzEF4n7?=
 =?us-ascii?Q?vmJhmjsWBeln+GAy1eoBkwt4fEeNYphKWcBshz4K9j2QXD97uIxqq4QNvsDD?=
 =?us-ascii?Q?NMSRCcvRmd4iKwSoohfvTU7lurLXhYIULRgTd1nV5Sg+vuoKi3KH7cwMx2mr?=
 =?us-ascii?Q?Xj9f3rDlaeqeGs90bQrll5vxWkTvg5z0rYy5JVTyPrzUk8D8RVVPXYXuX6Rz?=
 =?us-ascii?Q?O+4oy3vu9Zm48puOr7ahhE95e53pg+Mrrenka4FHgm3iP4BaeqpFqIuW4w3g?=
 =?us-ascii?Q?wRrFDlTPRFLJK1FmQZSMwe8EONJc2fIwgiqCScaLe+Z6Y9C18EYm3IGZMrLb?=
 =?us-ascii?Q?VeMbFUl8GMhvPmzYJboSxDR9v3jdQRW4J5oyYdI8Zffp3xjlFtKd50UpAp8K?=
 =?us-ascii?Q?QUmeHZ/XZ0JhxQhv7TUVGlPwefaCdKMQjVSCMd26NaXur9jE5hUPiKs0Nsun?=
 =?us-ascii?Q?I1lEFn2QXDqSuhDpwrwe6RlmZTXolumS0/PGou3g2Zigi5bXUrUGZvq6w7d0?=
 =?us-ascii?Q?C2eraOunNRFGqwHwGYX7n6C7h5fJuGz+LWkJNkHr6BPemxv04Y5SrgoEb0XX?=
 =?us-ascii?Q?OSv6m1eCnvxtC33pgXaTG590wyo8hmlSEFs7lfqeJ/So05Ll2YIcnebfNpab?=
 =?us-ascii?Q?QhQzWyPh/ny9/+gjnNKDFM2Fyu4/4EaQG8wP29V+KRxLUOUR8cVvBw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aEC4I5dOUosJAyiHwhMzGmAYO+/LvAwrH8qjE1yXsyatnXkDaywl5EBm+XM0?=
 =?us-ascii?Q?liu43na3VM5OBKg7QpacTvYJT87jYV5HNVbBIiDTRYxpKWWXM3BCXTPf7BE3?=
 =?us-ascii?Q?pSijtQ7HILMhgqLgjtdqGkGms49cAqaWz/nvdv+P6L0txGyfIUF1eAoC1ANz?=
 =?us-ascii?Q?f+J7P5r+N4ztRFIEqUxGttR/59JRX+babpVVDH01Rz1/n5zqPbB6B4q+UJxD?=
 =?us-ascii?Q?/zTecvPWt1Gliiq34DUIxRQiK5GNhZ8RSyybra+OVe2PcROhvqjdCqVUioSJ?=
 =?us-ascii?Q?mA2TbpIjoSGPpzUESgiIr5KBoNUWHmbLObpptcj2WV/80/83AHiV2sgWu7gq?=
 =?us-ascii?Q?wtAP1hF7bT7nve0hGcvh1vQsrUkKO6FnHMFvHRRp18vRJdS7OrIZgSqnMLID?=
 =?us-ascii?Q?Jl81U+qZfhwD7MY1Md9isomJeUmk0s2veFXC5Tfa0Dmb+hL9gkCHaIux4s3J?=
 =?us-ascii?Q?LDVt/mWDMNGoEcIqH7bqHV8S1k6zcj8Rrxy4qm7uOUcZzE6rVXqdEG7kU7Tg?=
 =?us-ascii?Q?eIax3wxvMZKw+NIUt3mvqLIAW6nDO6EGl2bxO4HWt/H/EZiSoMkd1dpYgTjt?=
 =?us-ascii?Q?A4GO9OKl9JZnIWg777XiENOx6tMBjO7/oyD+CQP4pS4g3nV4QMyRhzTLDvMt?=
 =?us-ascii?Q?NkAny75P0b612BCIHwFB5t7d5umQMoeq6MeyqZR0+E+m0XLWxPa2N98VIxMx?=
 =?us-ascii?Q?9+f8zUZTfzr7GpN40dBk0yxd6P44xwa0J0FiddOGuq02BymjF+aabWj2DlGP?=
 =?us-ascii?Q?0NAqd5UaMKF1yxOMscnn8e5qU6vUMHRybKGMK6WfnxzBEeNylaUW0Mw2Jcjg?=
 =?us-ascii?Q?3EOOsFtUm6nqRMGPBn/+3IAUNf424fSQhp1fsJdTT4e4Ee1hrm+djQ5+/1u9?=
 =?us-ascii?Q?xXhGfacl8azlLN7dJuSCkX8MgU136QsSjjDVDyg+ekZ5I7WRLcI8GQTvZ1+i?=
 =?us-ascii?Q?Axclfsnqm/ZsheL0tIic7+ImXezJQLiXg/4drTWrbwiCuaGJkIeq29KeA3JP?=
 =?us-ascii?Q?cD2RxloTF5E0DbMyDqjvWRueeBGbv67HkjP4As4Cje11MfW9a9w333+y1m0K?=
 =?us-ascii?Q?XMUV3hkBIJidbJq8e/LAn0c9HxP8cIRz3RpMotSyGse6Xxos8ClBtJ7PTdzc?=
 =?us-ascii?Q?/3FR5UklmZJKiIijZ5JQcqjzpNQ6Do6LM4n8aSjQwdaLTULo8lqAG8S/IqMJ?=
 =?us-ascii?Q?JaUR2YCAX3nML7VdyVDqpYrK8y+BxgkIcrda+1H+1xAc2tRcXQhYnSKhksAP?=
 =?us-ascii?Q?wvr407vX31gDcyLzdT1U/QnyJeupQhGehsH1KFjYJSXZdEDaC4apONKJb6vU?=
 =?us-ascii?Q?sKGzIHKCo16EA7uK2usO4+uy/9BMPJQBLzYspeJEC0feowJcAF1Yn+zPn6wN?=
 =?us-ascii?Q?Ws11GWGwVp83Zi9P4HNcXDG0GlgDvy5b3FCiY5Ie336uiqlKy7mCYP6vi83r?=
 =?us-ascii?Q?58W4FWVMOvMF+mExL2JlEwfbyweAb1DEGnWqECmaghqQ1DTGE+kaGcAiuf/E?=
 =?us-ascii?Q?PcimmlzsUImKph7EvAxnSTBxudFTGrYjFdaIs1S5OJF7GsD8Xu9f//pRv2tG?=
 =?us-ascii?Q?jbsfzJc/JLHvgjjslj4SrMj9psimuN4myYutjrD1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30294692-fa83-4e68-8941-08ddd8c88935
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2025 11:16:36.2914 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1yeT5XUsqCbpVVoiMXDzmtuH7opG8+XMr+NDnYZR8sW1XRJr5ClWIVtA7aCUJzr1P6FAxBBUWILEEj9+eLISqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5816
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

> > > @@ -2305,6 +2360,11 @@ struct drm_connector {
> > >  	 * @cec: CEC-related data.
> > >  	 */
> > >  	struct drm_connector_cec cec;
> > > +
> > > +	/**
> > > +	 * @writeback: Writeback related valriables.
> > > +	 */
> > > +	struct drm_writeback_connector writeback;
> >
> > No, sorry, that's a bad idea. Most connectors have nothing to do with
> > writeback, you shouldn't introduce writeback-specific fields here.
> > drm_writeback_connector happens to be a drm_connector because of
> > historical reasons (it was decided to reuse the connector API exposed
> > to userspace instead of exposing a completely separate API in order to
> > simplify the implementation), but that does not mean that every
> > connector is related to writeback.
> >
> > I don't know what issues the Intel driver(s) have with
> > drm_writeback_connector, but you shouldn't make things worse for
> > everybody due to a driver problem.
>=20
> Suraj is trying to solve a problem that in Intel code every drm_connector=
 must
> be an intel_connector too. His previous attempt resulted in a loose abstr=
action
> where drm_writeback_connector.base wasn't initialized in some cases (whic=
h is
> a bad idea IMO).
>=20
> I know the historical reasons for drm_writeback_connector, but I think we=
 can
> do better now.
>=20
> So, I think, a proper approach would be:
>=20
> struct drm_connector {
>     // other fields
>=20
>     union {
>         struct drm_connector_hdmi hdmi; // we already have it
>         struct drm_connector_wb wb;  // this is new
>     };
>=20
>     // rest of the fields.
> };
>=20
> I plan to add drm_connector_dp in a similar way, covering DP needs (curre=
ntly
> WIP).
>=20

Right we are seeking to get an ACK on this design.

Regards,
Suraj Kandpal

> --
> With best wishes
> Dmitry
