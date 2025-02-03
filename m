Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CED1A252D2
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 08:11:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8564B10E3AC;
	Mon,  3 Feb 2025 07:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IDRIOQSs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A9910E10C;
 Mon,  3 Feb 2025 07:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738566710; x=1770102710;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=udBABZtzaEDXKBgkGycw97oFqyIJ1dM2DjDgCYHA+X4=;
 b=IDRIOQSsz11npL9x3JFB45wMXvGusUkJSMO3rfy6O3N1dMLUaj67SxLS
 7wHPcGgy3x00qO3/jEydI2/7naVYSW9v4sGDhSxBPXOkpa3hUNyf37f29
 1UcgfC+fSUe7oBbFEE/HmY9mvT3JF1YtBdh9/yIrc6yXvA27Cc6YdW9kQ
 QRES/fyPtMnKzy9ZCJHw+F8cCie13OiUL5eQb6fACJ/RDz0ak0d5CxDQf
 AKcXRIgxkR3O8RoDUpi1Yb5Sjrp7PVwEfiw3D0zV/6pg5OzkEgQKcd1Wd
 UXohDMj6qlSuUtXugxiA4f4HK5WssL+xPOQETjRdCCI5cER/OrpKHU4El g==;
X-CSE-ConnectionGUID: CX6zRci7Ray+42NcOmViug==
X-CSE-MsgGUID: uoShLRxAQEmgi0WBq1qbyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="49306247"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="49306247"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2025 23:11:49 -0800
X-CSE-ConnectionGUID: wFGz3TSqTJOWo1eF1Zaqlg==
X-CSE-MsgGUID: mlXrUMLPQS6h1Vyri9CsuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="115188162"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2025 23:11:49 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 2 Feb 2025 23:11:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 2 Feb 2025 23:11:48 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 2 Feb 2025 23:11:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kCOJqanjSQntEU0SnXugOv5mzS3J+UyZInDDq5Zpj1VNElWgUGmnTOe/L3T/lAiyz+Id/ZeP+W3XiC72QPeqJtL4zi+ybI8n5SscwTNc8gS2BoWE1GTZwwmzKTH+3jFDKtec5ZI9Wf/P+XccHWlQXphhRKdm+4e2D7c2FvFNj1MBH3NPtSzrnyaYXX73Y6ksOmgYEbfuQ0S6J55GcTWLmihjFK0KX/sUyHVMkqlseCIeMW/ytt5ImPaAauD68KjpsuY+7/NGrnoIR5eGmYUiCql2cYfv1FWszaDqBuICcf09BC8Kod8LU4tG9agjXwRGy2Y75uTpltMRbG4fBVxhRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udBABZtzaEDXKBgkGycw97oFqyIJ1dM2DjDgCYHA+X4=;
 b=smNgDXNQCQSXTMQmmJIAn0I15WGA63Tb1RdEukM80+hryPIR4e9UQfSqB1h3wh/ZQfJwzy8VqzB9dQc/MKTt0m7n015ap5No8U0XBMFtKl9Bl2Gm/GMmeySeKJcMPiLgt/0of1FTbQ6iGmBl+V3yBS4yeXwOv8fTu6Rp/S+19qrC4G1qipjBEZSOQpzcNSyR1qd5lgjWzRf1LxR3pvub+5KE8ozax+liMl/dqLv02n8SLodpf64gPGU1tJ+DtW2k4bFRJPjL3o3ahLdsh7WSBpfzcA03jjUUL1r8MN7g8GzAPE1s2PWVCpyQ9MNDyVTbLJ60FMuDaWhNb6Kmk/k0XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB7343.namprd11.prod.outlook.com (2603:10b6:208:424::21)
 by SN7PR11MB6775.namprd11.prod.outlook.com (2603:10b6:806:264::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 07:11:05 +0000
Received: from IA1PR11MB7343.namprd11.prod.outlook.com
 ([fe80::8fd2:c734:bda9:b14b]) by IA1PR11MB7343.namprd11.prod.outlook.com
 ([fe80::8fd2:c734:bda9:b14b%6]) with mapi id 15.20.8398.018; Mon, 3 Feb 2025
 07:11:05 +0000
From: "Kao, Ben" <ben.kao@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH 2/7] drm/i915/backlight: Use proper interface based on eDP
 version
Thread-Topic: [PATCH 2/7] drm/i915/backlight: Use proper interface based on
 eDP version
Thread-Index: AQHbbiN1BkCIusRSEUKCzUFEumHo1LM1OS/w
Date: Mon, 3 Feb 2025 07:11:05 +0000
Message-ID: <IA1PR11MB7343926369AE8B038D387DCEEDF52@IA1PR11MB7343.namprd11.prod.outlook.com>
References: <20250124054631.1796456-1-suraj.kandpal@intel.com>
 <20250124054631.1796456-3-suraj.kandpal@intel.com>
In-Reply-To: <20250124054631.1796456-3-suraj.kandpal@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB7343:EE_|SN7PR11MB6775:EE_
x-ms-office365-filtering-correlation-id: 77319eca-e107-4e16-334b-08dd4421eca0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?6veU6s3GemjfpUK5fR3t6tUjBwkpWmLy29MQLbNcbtR7qELNbONDVsfGWwUo?=
 =?us-ascii?Q?e13e2EPat8iPhfTU+XTdLcIAJ/WPwYXFG0/o5oKjFNamD6x2UCI59TyhheEv?=
 =?us-ascii?Q?0DY//oAK5ZZhXrIeMlGXzX3yzfoW47WW3nj+PAbU7t4AAxyxdyweuxXj9xSi?=
 =?us-ascii?Q?yK0gFpVf+LjJDxNq1oN8RVjIxi2VfywbWq5B5mA7H+0dAhfAOlmac2533GA8?=
 =?us-ascii?Q?4Ppgbz+nkkaAPZoTw7M70qSBsVQvL8qgJvx7gO9RjQpbSJElpQACmnvAFee+?=
 =?us-ascii?Q?m9YdsOMV5JPOrX2F6gz5WG0TLHoBgqvPjcUbVJZwg4vM0g22+CVHupzd7GyE?=
 =?us-ascii?Q?n7ruObCRy9mo8p82yqInMdJ7mHCyYdetpiDIEgALMZzSS4xMjxpcMUN9vEUb?=
 =?us-ascii?Q?b9L/I3WNUYJPIcsBJpyFEYmbG6vS/VlS7vsuDuJJIk2VymMN87HRWkCCPQ8a?=
 =?us-ascii?Q?hh5NOkLivzQZiOzKFIHBmDdDLEdUauNtdJbvrCSLJ/ymz6QV6VfnoJDbXuZS?=
 =?us-ascii?Q?skdP72H2MUTRZl3v+1XMLqA2mMFInrCUviOBgxyJS/Kul/qaOBbYoX/zs2sC?=
 =?us-ascii?Q?9cTOLhAlvGa9zjjNnzPeXx4FP5ug9LndktlUvO2FfYbV9yuYANNCXo4fmCnh?=
 =?us-ascii?Q?DdBGL7NjQ0RwIwd+uDFHwSUurYbNWppFEcF7v9RwAHJUZT3aXoeTNvrL+DwS?=
 =?us-ascii?Q?iTN4PmvtfRBdXzg26R7xm35thCB27Pz5/vidH/aKUgbrhVe1EAeSgABHzJO7?=
 =?us-ascii?Q?RB6As7gXA7aVfBTwDj05qWim20UigaUEsjk/xZ5MgTNxhKtZDCZqpjqrjYLn?=
 =?us-ascii?Q?qaIalhqY81m4+6XA+YtEfjezjdKFfrjiuLh0ShuUNPJZ7vtI3iyp4OSE0PZx?=
 =?us-ascii?Q?qH4GPexyB9oeysa7YlJxsOLXLslo/KTsHO1lGtkc9OiIFkb4Co6Ly6+RPJgA?=
 =?us-ascii?Q?kSSU3BYXZwxkifxegpNcwBsxV9pibsdUUnvVdSEz3yj3koBhBUyCoAJMQV0B?=
 =?us-ascii?Q?7an506mM8KzzKBe3MHXkNFrChTSIUaaeofkRXaZaD/gcyHTS5BVl89b6W7VR?=
 =?us-ascii?Q?Prb97BBioHzBJWQ/MpLoSHENVnT5ERvd8X20A83ydoMKrv/rD7G5ndMCNx5w?=
 =?us-ascii?Q?9WbQZGnj+J9WnPZ2SSsMBO5xu71kSBpaUWi8++oqALhLjPh9djkOKtsPBmTq?=
 =?us-ascii?Q?YTKQUZ8qy4Snh638/1RTEbXozE/A5/hyHD3Akmsj/o4tQKrbBRchCStGzDKT?=
 =?us-ascii?Q?CocWBnaubNVs+8Kl85353lgxE5Q4XB0WXLoIotqgCoWvr1S7WCazqKvI2XBd?=
 =?us-ascii?Q?8QPbiCtZN8pTQh02vUQQ+wC+/YgCM6dPbiy/B5wC798/UhbeQfZxJnVzw4Ua?=
 =?us-ascii?Q?T71+RLL1XCq0/PPiLKtbI6m/jRl7P2uECvv0nlq3ttjy7/Od7ZsBp+oG+ym6?=
 =?us-ascii?Q?3PSrjlMtI49jZYGq7x+OyjfhyrLiN7wf?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7343.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TH7CUnOAM8I2Fod8BUfur8mYphks/tnNVO8AaJxxiZIiHpF+GgvQgHciJPw+?=
 =?us-ascii?Q?tU4lqY6VZksX9lAN9eibhCMr6G3B91Q7orCHeuXOw3hk2w4wGGWXjEWR9Gv6?=
 =?us-ascii?Q?TNvwhgpQEMGnF47p5gwsIbfsSEA8bLyG1378Gpxwp+IN5p3VYm1+bniAkf/E?=
 =?us-ascii?Q?4U+33SF8uoB3eBeuXNwvFj08RUSWe3ygmcZYwi3lOSPhCmNGdjfRuyoN+vCj?=
 =?us-ascii?Q?nbggOueEw76ctu9QV3RQ0nLGsN23x1PrPoy3g7hBB4Tcob+KkbFtJ8XXt6qJ?=
 =?us-ascii?Q?npMCf0zXdmF4cYsXIzQwxasnAXlLUiJdEAZG1xLV+maigiRtc22ylK5bQ3Yv?=
 =?us-ascii?Q?a76eKzqbVCaEieSVVYZmL84XSmX3CHixF+v0QulkYxPhpTlkc/Z3YAINJ3pp?=
 =?us-ascii?Q?RWmyxDzpb/bnR7Go8t5A8S1OQk6orcp9aRxkanv55stizJWDSouA24exgd+i?=
 =?us-ascii?Q?GiurBf2JMITONwjkJkmbbNqCCvDy/dFkwxC6GelskJ34VEsATSPA0Z+t1I5M?=
 =?us-ascii?Q?fRpSAOOT2/dgYlqht9mEvneg2FjDtuyFj9iRkjPF0AKAPE6Laszxk61XcWRK?=
 =?us-ascii?Q?eYro4tr1qYGa8mOMbQfQB5CA/aA/YAceKDYFOBYHx8pmjUmdQZZPhMONKVXz?=
 =?us-ascii?Q?hTkkOO79QxQfAOGKa9Kuf2s7ZU1Ir/Mvbnzr7l/3Z/WxNqoYSLH7fk4eRH64?=
 =?us-ascii?Q?kY0GCBmHA6mrw/LTejCzbtJQZMWollIyf6o5lgK+QLCw6ZDfjUQrLbfBbb5m?=
 =?us-ascii?Q?CQ8JJ1gq3aPj8ifY2bOwJYNyFSIGrdhtbTQXOt/7xJQzpf0LTC2npXs6PvUC?=
 =?us-ascii?Q?vMecgEgEY0wM6d5eKskJrIGf0T9Dkxrkpb5dGxztpaPy1tX6RsjhLRRerWOq?=
 =?us-ascii?Q?Fp+4tnK/DRAlSpBduJQF39ksgwqBRf2+armvqMUYqpp41fsTNuPC/XzXha40?=
 =?us-ascii?Q?2Qh2+LTXskgM6lLBEYi74xigElBkHaajY2POq/noJn2uhptJYk9hKG1H8rvf?=
 =?us-ascii?Q?68XnpmzitEZIaedPs/p1iYxCrefr69A5evX2qkv2/rEJBVSoxJyFfMuZqou6?=
 =?us-ascii?Q?GCnAoUt9ztOBFFUvD7eGPS4PCFhQeCrUEIC6Z4BQisp6Il5ayzS53NWruZ8V?=
 =?us-ascii?Q?nQgORHWLdcTRiAcFhABcWKM7gP/7h42ylIDOTeMiFpLHKmTPn9FVmICIkWj7?=
 =?us-ascii?Q?363x4VbOnYGKBsBNWXdosfGyQL7svPqn75XaVcSlEthWQemj+I36I6UDU4DV?=
 =?us-ascii?Q?LdSbK+XXCJBsuxdqSV1kQsdTqSQC/umethpnn4IPNxs2bLSGZZd/swP22e5u?=
 =?us-ascii?Q?2apSXFQVZFbv2UjYEgvE1vDcj97QrLGeQx9HjacausjghTwLjF0iyvG1QbD0?=
 =?us-ascii?Q?HDKo91pmVkau3fxE6pM5FD2Dpmg+0ZJi5IZooAgUEyix+IwsXmRTm+ZfdGjV?=
 =?us-ascii?Q?HEOcwm9JBpGIe4qnhyyyzVKaDwukT+0tanQtqKkByDolPtmZobXtz2ypb7NO?=
 =?us-ascii?Q?W+cuhPi3GdzoyO3kmqyHHzjhSFJWt211gcmoNbOxpvhJX7w1n7U2bUhK/M+/?=
 =?us-ascii?Q?MRMZzk+t8HaHEsxn8EA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7343.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77319eca-e107-4e16-334b-08dd4421eca0
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2025 07:11:05.0924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g+GydmGXT0UhhBfG6HagdKT19DpIriGKVxwvvM26q5++NVcjGKdYH6uI/3oxWsIZNjZk+TWmGODUnWRQl+yhTQ==
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
