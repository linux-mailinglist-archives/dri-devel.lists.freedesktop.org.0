Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F841A252CF
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 08:10:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A1710E33F;
	Mon,  3 Feb 2025 07:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L7TSFnUY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC85710E10C;
 Mon,  3 Feb 2025 07:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738566619; x=1770102619;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=udBABZtzaEDXKBgkGycw97oFqyIJ1dM2DjDgCYHA+X4=;
 b=L7TSFnUYfEGjCMvXdsjg87VUu9P1xp6Z0oxIeCl6qmFxuaTm3KVxzwdH
 GNNwLGbIrAD+CLVk08BvCBW4mXr5V+8MD+RHXzFlNuOAFmYzVISBMJ3dM
 q9i1uQGEYuAzCiUMY/KsweOrUKmDUFbf1YE2UEU0n7zgxKsP7CX2VUvv/
 i0hIsjmNMIJ85pgG3d0ygS+NqpTqeUVf6GAcbxHLtkTQfvaTptBU/Rvkq
 m7aMYUK9vORadBlSESSIUD37jiXysHhjPWZGgba4cUIOVwLog2L89iQB8
 daoT4Am5hI+9Ul8uHIk3n/IjrZMo9LW/j489cKAG4Hg1ChQr8g4k+GsXH Q==;
X-CSE-ConnectionGUID: afEQW/saQa6CJxG44OGGEQ==
X-CSE-MsgGUID: MwF6M+6CTnaLegi+xz9u/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="49306029"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="49306029"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2025 23:10:18 -0800
X-CSE-ConnectionGUID: qSo7yz+DRxectk8SmJ79lg==
X-CSE-MsgGUID: VrXbIuzgRMGWn5qNNnYSNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="115187781"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2025 23:10:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 2 Feb 2025 23:10:17 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 2 Feb 2025 23:10:17 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 2 Feb 2025 23:10:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WWqqc2wvTp4LMlsYAZKeLDxzjQxAWK2UyTe/Fk7fzQJw+NA/CujJTaaABbi4Rw3mYsboBttD4qtHGCi5JNbcZZyYpIyLbnB/CIGJ8qzRpji2wYpD1SLet3syPYXcSht72SjqdPpEKDto9hzxETvij0vhi09DYQAiF24tJPs8bQHcePBbrKOytp7p9KTHgHPypeeCi/nUrtJdEVBYfpBiJEW+1MZx7S8oy5T6ktVgN+HjZMviJJrVmC4s6xJ2B9yQP1QjOi/DDG+hLkxjsv19iY5Agh1M784tC37RiMgYR1MsJG0tkEqG84nJ8lM3yyKDQvR9c9H39FE/8FmvG4YS6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udBABZtzaEDXKBgkGycw97oFqyIJ1dM2DjDgCYHA+X4=;
 b=xGlyo4TcQf8lzkODKI5P9GKPaKYISGeqIZJzjkGXcV45hnnozm11cW+Znjs1Dz2E+EwO0irry7keP4OC7AnYBXTmFua5tNz7Ugbvi9BEeMOn7QOae0FTT6iP2+ZvzK3JaS2mxaFvRIS55k5Ev65kCf0f22pgcL+3PXbSK052Lsx8kBihBE4h9ajAxYHhW9II5ZgplB52pN49S7P/GIANAzd4/4YpDxtSo+/h+fkwECk/KDFbyo+QKsD4hwrzKJ+tfzX6KkMmVUoe+gtUbN/TkaQz8C0C+NazkwQ+vscDeY/RY54oLQ48qqUy8vH1idVAJmMHjKvhNv6zwiEKSQtDmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB7343.namprd11.prod.outlook.com (2603:10b6:208:424::21)
 by SN7PR11MB6775.namprd11.prod.outlook.com (2603:10b6:806:264::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 07:10:15 +0000
Received: from IA1PR11MB7343.namprd11.prod.outlook.com
 ([fe80::8fd2:c734:bda9:b14b]) by IA1PR11MB7343.namprd11.prod.outlook.com
 ([fe80::8fd2:c734:bda9:b14b%6]) with mapi id 15.20.8398.018; Mon, 3 Feb 2025
 07:10:15 +0000
From: "Kao, Ben" <ben.kao@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH 1/7] drm/dp: Add eDP 1.5 bit definition
Thread-Topic: [PATCH 1/7] drm/dp: Add eDP 1.5 bit definition
Thread-Index: AQHbbiN1RO1GRjLuOECoAsG53koH2LM1NPGA
Date: Mon, 3 Feb 2025 07:10:15 +0000
Message-ID: <IA1PR11MB7343D833613543FC7D198873EDF52@IA1PR11MB7343.namprd11.prod.outlook.com>
References: <20250124054631.1796456-1-suraj.kandpal@intel.com>
 <20250124054631.1796456-2-suraj.kandpal@intel.com>
In-Reply-To: <20250124054631.1796456-2-suraj.kandpal@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB7343:EE_|SN7PR11MB6775:EE_
x-ms-office365-filtering-correlation-id: 876016ef-4486-49d4-14c7-08dd4421cedc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?XboJu5eeyU6LmSgl46b48VFmGH2l/qiSVXoS4kEVSvhdziiAW8bf4YgN94OE?=
 =?us-ascii?Q?FcagrnwqzCgjviYlrbcok/MX/yDwprxnbxH2I7J7YDL+vFplHW5BB8aa5qlb?=
 =?us-ascii?Q?GJPluZFrFnB97LEH/bnmtk4sjFuKjMze2XHtPPYxr/Ia/uijcFmyrv4ijFlC?=
 =?us-ascii?Q?tm28FrWdcmhlWkgENSzvWl/j01UsC67ezH/bopiLIA9EwSyxfk5m9P8aATp9?=
 =?us-ascii?Q?kAvOLokHT77G/XnNPE3EZ5Qe/d/aS66x3vxG81trP1tc3eo+ZUc7qMPMSWML?=
 =?us-ascii?Q?VpwdxJT20QqwJWn4tlPyFW9DctX7PjL8QwIhUUjc+FJ9VnMR3+p6G1oluGFc?=
 =?us-ascii?Q?/OsuhCBcbq8OZ6ZIlQR379ZmeCPqYdtpGEr5bDFwIgeQyWQOcoM098TWla5n?=
 =?us-ascii?Q?VYLoM1dI0wI9Jxxxv3qwNhYvAZH3tSaCKA2YfyfSuGWHDSakfdILSZfwR7fU?=
 =?us-ascii?Q?mx9pLsOhq/OSHySeDYlPdTjUuHoBaX0ktDfdISu4pWoyoaQz5Eq5mFLjMUj1?=
 =?us-ascii?Q?4ivtPuuxFKWZupV1etnJzINrTDb1I3VapstvLYnvJXanEbbvZ7gMpDesIb6h?=
 =?us-ascii?Q?klLhlKR6t3jpRxr6yPEUJVQU8V3cwdAtQ1x5XPGcUS8PmTk2uTgWcjxgRA9c?=
 =?us-ascii?Q?D7Z0hnj4koT3QY9YHWqgh2JooAUeZpyzkTCxANiR84svF1EAaaW2GoBnF6Dv?=
 =?us-ascii?Q?XzT/+/8fnA6j7B2CAZNvIXgF3weqKucm+mFOzFHWsSAvA27MKVbQ3V+w8zdn?=
 =?us-ascii?Q?7SwFwEasWk4jch5FtXhi4F+3rzRGbgmMMxqmQbSVK39DQsVkoebY4rJyVJeg?=
 =?us-ascii?Q?YQLZkLiO/SX/+eVRTfnjuM2EKtV7yIkhBlodcxE+o7v+GTLFeW9nephJ/6PX?=
 =?us-ascii?Q?c9TWk84L72a7qPWNiIO3B+rhZ/fmsNACbyYV1v+dT8S7OVDbEYqBdlIdLB6Z?=
 =?us-ascii?Q?nPEhe6k7XS24rdG7qEbKxGwkAQn2padSVHDsZANoIUS994JLJO/fABwLtUNc?=
 =?us-ascii?Q?Oor5HhCF6eeBmLbMyFwSfp8ECPhdwYrCZGbenCYRHd6NjOFKHTqUBk3hN2i/?=
 =?us-ascii?Q?WLeZAxDESlby3cqjnlYAu64sSmTAhIEZawPDBROrPhtuno1my4uFIxvQtfpW?=
 =?us-ascii?Q?pgikRy/vebsgXe5gOpX9zE4a+l0Is9GxnoNfquw/qhbak6/8ssCP/mA+Ax9i?=
 =?us-ascii?Q?PEuU+YUU1Ag19oSLNG0EScxKsnbiLpjzmN0UoTJf4VNV3P/m56KhGmNolYaO?=
 =?us-ascii?Q?WO9/5mlsIvinV0g4ofP2eVzRzyt/l0KhspjHfIeUmfv68cqCoy4wTf1d482t?=
 =?us-ascii?Q?sNSO0j4RXwbzumH0zREbPPYk3FgAKh9mRw2Vlu69mTMxG7PW2J+VmgCSPr+x?=
 =?us-ascii?Q?nTBW5/nDclkvJEEhyUgeG+3CfTjQ/J7XcX+V/kthUVHVZeFVeAVaU1U4vixk?=
 =?us-ascii?Q?eIooQB/yZVWgFiH8Fcn6dWFNd/4bCo9j?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7343.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ctCEDOVnxMAFgj3mhOBBw31WMXfXx2Ks4DWuTPaXmNNdqXwiUVcVeod27Eam?=
 =?us-ascii?Q?MhkTefTarBFj3urDeZIeIVQ6mIIoJj2cCRN5vh0nOwkTwsvsc0CR89uguCRJ?=
 =?us-ascii?Q?mAeOyVbnTQSNCMOyzOxurDxhiifoPY1F3ZqkitdalxtasheWRHBttrsjsjg4?=
 =?us-ascii?Q?TKku/NLM+OQ1COQfC520ao/zxUHPMrIglHHGgActJ2muHd43Upc9q6rIaYb2?=
 =?us-ascii?Q?hUQRVkqCzMDD7g9HPHVFdj0Z9bUZe9EAIkHcAAJffz7JAmKxXqxPwJq3vsoQ?=
 =?us-ascii?Q?o9rL0oZAoR/9TTyKTJiwXEQIJCffXvhXTH/VR6aiiskabgwDb9XuWdBp4Tm1?=
 =?us-ascii?Q?QgLkcuWIii27eCxm/CxO6QfUF6FT6AMo17RSaWGLuil+k/NnMHkklSjzR0Ch?=
 =?us-ascii?Q?2oRoYOL1fuM2BeIyqOsjLQ4uDGkzrsBVZpMxV0+f2zyqxwz0YLt0WmtdZpKQ?=
 =?us-ascii?Q?AM9HZ29ImfFxgNtJKlLCx+GlgqBWLOStzg5+jJfN5CUR/Mj+vd8KF5VSm/QU?=
 =?us-ascii?Q?Lq+Ij4UfdPUyZqaQIy/2JdQCmHSEhWuMQu+SMWo936CU1Drhp/YjkKtVoLKZ?=
 =?us-ascii?Q?Pghw6M2ONPe6GGfGDnNbSUnIUL6nVNeYr5OxCtM6UV/72p8m0uT3x/3jsdkz?=
 =?us-ascii?Q?/6x4QMVEW/SQrZvEVEBfY+acju4T2TaFyTpFZDSA0LoE/jGhHddyygvoB/UE?=
 =?us-ascii?Q?7vrs1IhPpW6MGnG7Z+Ds0d0hj/4WKfLGtoks1LL/9PGlEwvxjr5FJzvZurvy?=
 =?us-ascii?Q?1nDmVNqzlVxolIY5BeHeIiujnrU9JmuE5IbbBoNiIzSCb/olTbo86Joe1d1V?=
 =?us-ascii?Q?aZvh8BdXAjBHq1QzVS1jiDfsFhI7e907bJfslAhPfGbNjLZLEVcfqWxPwVlI?=
 =?us-ascii?Q?f3ACADYE3mZQq5JbPj1KcGq8B3pv2kkackGZrOPsBAnj8vSRT31NMmI7oird?=
 =?us-ascii?Q?Cf4Q5GyvA7Rl9tyntUZCdl5BjjPBUVeTuBB9Z/JjSwZfDF0tRuro41CxVZCl?=
 =?us-ascii?Q?bHDiW1FcgULBiv2GrH6907ckCxgv9chFw2SqrPQIzawiBUnPuorNpEsezYC1?=
 =?us-ascii?Q?d9xRcPvl7YmFBx9jBa3FtqmUTaq/jodcSG0Q+p3yE/rq/x3ZHC2owNJKioHb?=
 =?us-ascii?Q?eZqqyGl8FezeVDhPXdBJXu3DFl1rXktbGNFcvnkookcMQfG038e1DzJMG1i5?=
 =?us-ascii?Q?HKHHp7v5728vw+0nYXptWY/nOJ8EJzV+KKj8Nx8VdXYImfgmJdmjR5pC5q8j?=
 =?us-ascii?Q?+DpzQmOfhgI/f8Lpu+R3OezASuWUuOaUAWePNkUYcU1aiGR9P6L9BDLFWt0f?=
 =?us-ascii?Q?RJtHZczFy425ez2iC2FObDf95rYkeC2pu83LakQrD2u7oeVOWOhm8HiBqlF0?=
 =?us-ascii?Q?916i/eFKWii4PCOzhwjSgub/pifpbL2jKNRWFniHYEkmRcTINYJOTtSVdpVF?=
 =?us-ascii?Q?uFIboGeDPurrqoCcOA3BiOMlYgyPX8fI/hyPJuBAZ6Mqh3e3J61K1q3cxxDd?=
 =?us-ascii?Q?OrTw8oneDAKbZuD7qsIUC6nK1Ij2jbtMDMB/Dej6MfUQ6is8rjHProLGsqJ8?=
 =?us-ascii?Q?/n7bq54FkvicWoj6Duk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7343.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 876016ef-4486-49d4-14c7-08dd4421cedc
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2025 07:10:15.1451 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Qw2RWefhxSaYPxZo5Lt2r4qpDWcQgpoZj8ZBilbSfWZuQzyRGePP8lJ/3LF6j4d+qGPO0eI83AO1hbGH75vWw==
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
