Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1554A203FF
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 06:32:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D890810E3CA;
	Tue, 28 Jan 2025 05:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b0cIvdmQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64F510E334;
 Tue, 28 Jan 2025 05:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738042367; x=1769578367;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=URagOzDAm81liNoaj62dv/XnnW/xyCXPGGe0Bi6wBTI=;
 b=b0cIvdmQMayo/cayUDugPv+y1rlPJxC0AMxk+v3/ARVBUu3RBBF83jz7
 PIaP4IesRHG9Lds6RgtlJMAg53yEwpFfJe/AubsaNpJ+5ZbnPLJXL5LCE
 jwtUYENSZal/AW6RDM5U5CWs+KQB1zS7kHsmEsdD4ta0R3CsORwDhWOEf
 T+B2j4i0ilqz9oeDx9pqqA4YCFSytzW9/wdNTSSYWOmS0JK5mSh45PHmT
 x1d4qSp8y7258Pyf5btlbNU00h2/jm7m89Nw2XpGAosPT14PJa/P6Yzth
 eA9S40sO2JdyP5KRqC0UYKF+MTqzb/kxBdTtCFUhbYPiB+7T5Y4+lr7rv w==;
X-CSE-ConnectionGUID: F8/DpTDvSV6Gz8dyHKQ9Rw==
X-CSE-MsgGUID: 48BNS16jT92azPoFZgU/gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="63876411"
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; d="scan'208";a="63876411"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 21:32:46 -0800
X-CSE-ConnectionGUID: /E8rzi4OR7yBNr3//HAdHA==
X-CSE-MsgGUID: NLV+COlRTTqZ/kzVDCI7zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; d="scan'208";a="139524372"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 21:32:46 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 21:32:45 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 21:32:45 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 21:32:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=utcozumYSa1/WQvZfmx8a1DnP1x3XN+/hQNwCLWgxu/PXo4mHVvPeag62Y9z5Acxch+rhGZ7yOu7lpOGS7o593ZwyuMeyUbGt0jsXpw7i3rEQb0BAzbopMyQYlyUmyCuSycRNkDN8z6T54Yr/A7tNVISFqeWJDrzKgeeQoVanSmiHQrEk/vMjtlYU938IX1nlk1hpmohVi4yiT3SUATZBQanGMjyeb9STD5p51FCeCUdYjwN0hGcaWL7Ke4+MDzRrcQ9sMgPJjtztJ6+Z9i40wfiT7cYzqDJIt1Uat3wRTlUIpoy/JSi6DfwK/Ko0iJnkrXuqR58selvdno/dGHpQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jza2C3aB951pqds+CmiOvEzGrSSXAHJa5ZDU3Q5lJTU=;
 b=s0xn0ATXYpot3ivKomci0obivB01oX6FD08ZJP3NZuyqdJhlAwIHsyPa126BPO+QYgKpBQUgM/UoQa5wAP0U7teYExl7Tay5mxrXxV8lMJwbpiZYWEa0jnyj2dwPhzfxbRD7Cm8Xse3+rkj7w/hxXgtHEdRbEjPoPbBFDVy7hrIrYf3aoLusaa+fVTGjg9u4xHF2egHOZX5A8GJ21sSz47uxJUGq/xnq7tYgnnJTBtPTNgeTDZyVKr4mldcYwD3MRL35x86PTO0tkeubVrEC62qD5sPBa5wHgvQtEvN1XhWTcS4i1RsfwKKcEfC5SEhGw6BrenMvrVXgZv8EOfMs3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6141.namprd11.prod.outlook.com (2603:10b6:8:b3::13) by
 CH3PR11MB7390.namprd11.prod.outlook.com (2603:10b6:610:14e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 05:32:42 +0000
Received: from DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::31fd:4de2:2775:396f]) by DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::31fd:4de2:2775:396f%3]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 05:32:42 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v3 2/5] drm/plane: Expose function to create
 format/modifier blob
Thread-Topic: [PATCH v3 2/5] drm/plane: Expose function to create
 format/modifier blob
Thread-Index: AQHbYZGzWpcbHJL1pUi0hPF0y6Z5nbMgNIsAgAJoH4CAAXY7AIABzzQAgAFG+ACAAyPcwIAAzymAgACrcGA=
Date: Tue, 28 Jan 2025 05:32:42 +0000
Message-ID: <DM4PR11MB614142596C9267D24E9C64AEB9EF2@DM4PR11MB6141.namprd11.prod.outlook.com>
References: <20250108-asyn-v3-0-f4399635eec9@intel.com>
 <20250108-asyn-v3-2-f4399635eec9@intel.com> <Z461PqtBPu2z9GPh@intel.com>
 <IA0PR11MB7307EF2ABEFEF5FE2F0D58B9BAE12@IA0PR11MB7307.namprd11.prod.outlook.com>
 <CH3PR11MB7300A783B09132F6612DDA1EBAE02@CH3PR11MB7300.namprd11.prod.outlook.com>
 <Z5N4ko2GqOhCvdMJ@intel.com>
 <IA0PR11MB73072C33CA9E5584C0654467BAE22@IA0PR11MB7307.namprd11.prod.outlook.com>
 <SJ1PR11MB6129F369898E2962C12D6024B9EC2@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <Z5fa9RyRoZ0CXQjK@intel.com>
In-Reply-To: <Z5fa9RyRoZ0CXQjK@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6141:EE_|CH3PR11MB7390:EE_
x-ms-office365-filtering-correlation-id: 6eff4bb5-ac7d-4585-69de-08dd3f5d2ffe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?Rgd9y2OyJYtGiX50IKQykEaiA1E/nGmjNEkIJa94bpHcu7ZBhYz5ko3TRg?=
 =?iso-8859-1?Q?wg47YApPAsVEY0U2cf64aRpxDPy9S8g5pjsH3Xk0NBvKs2s2HOY0KrIu0d?=
 =?iso-8859-1?Q?I9vZ0VX6QoDtuvhidvpkfdzIxoHs1nbOI3EqNGXVMVTKFYYFVUNzoqpJt/?=
 =?iso-8859-1?Q?FsHyHXULbOCZk3KHHpVVGS9FXjppYOSMji2GOFtu6WWZjA4IDz+9ANn2fL?=
 =?iso-8859-1?Q?vMlw2redncWJbZTmnb4hSAdUpE4UgDhdPvwOKyminFI9O6A+3255GFKIoC?=
 =?iso-8859-1?Q?5V1LbN4CHey2jKNvSYdqSWXlb64li4F2GNwuwRdTAkrphw/36zaQAmrlrp?=
 =?iso-8859-1?Q?UtqVaXgEMf3LPQ0zrPX7cBGHsKgHHGi0P0jiIoltMRl74pvD5B4Sk2WGbZ?=
 =?iso-8859-1?Q?kBJVmhvS+LmzQOQovisUGL0rJcLdBqeSOb06aAgevyBj3roK8ZOnzn7Fmf?=
 =?iso-8859-1?Q?jtTgD42QbaIwTc0YHiWZs0sndjQ6XWNh/R0y90Y7cUwAZY6P0saoRpBGg7?=
 =?iso-8859-1?Q?sL3TVF8yuilmhPq/jKdOp+8IM8G9p9l3OEe+7kUMD8M2qF/YTk6mqWUDxG?=
 =?iso-8859-1?Q?6Eu4y0r7Oa/UGeCtXo+lkFA7cRIoI9i+1obOZL+KRa22vRRi4xk4XfYI+S?=
 =?iso-8859-1?Q?6hX9nU896Sp4zxWiLR80tDv/NMyaQYyl5ba/kVtM6Zvn4WeuJaiwGJT9y5?=
 =?iso-8859-1?Q?pOMFAJPrNZQilwm9h7wZkZBjjmQOsbrWLnfvTX2cLLGItUG7b7M5ZtQL4L?=
 =?iso-8859-1?Q?UEwKbx3hTGVWJ9sCZtKuNVsJJiVtZytkYS7RevUBLMAMnopjA805dRl9GO?=
 =?iso-8859-1?Q?RjUzXWT1h/G51rg8OizMjMl4UoKN9+KoTIEWLjod+kvosvammBOFD2ocFS?=
 =?iso-8859-1?Q?Snwlq2dtHKfe/qvLuIgl8YOj7Lf2eATHsy3exRLwo/NeadNn0NZO9sOMLa?=
 =?iso-8859-1?Q?h4rI25xjE/9gn8VUXYPXpgcXxZg/Y4LjRm1oO58BkU8mFLG3xFX0SaMj24?=
 =?iso-8859-1?Q?Mqf6Yqf4qCgmvaRd0z/3W4jNwXM0ydkRGXWifFX+lpBAg2B6S4iShMHM0D?=
 =?iso-8859-1?Q?ADm9KwpgaaupLTpaM9HkjLQKxqR48shack2+cDqXSnQO1yKa7M6q6ccz+i?=
 =?iso-8859-1?Q?NJ6YouCX4nhBe0uF8C4zhOQ7BRzXd7OwMP0ZD634E2QoRcaR0bJDJYJgx1?=
 =?iso-8859-1?Q?YYxgyAsxPUiDCs+BwYUqYWsHY+p/9DPPRNCl41t8lp5vgIHJkOEwVaD3V6?=
 =?iso-8859-1?Q?NCsDpdYtkIKrM+ctUMNh7FMpoVSFvhVcR36KgtD6NcHJLI6N1qMFSLFFoC?=
 =?iso-8859-1?Q?8MW96QqoW+C6e34bSKz2mO6Ytje6Ueh9KpXt+xP6lDZBU22iFadQSfIORP?=
 =?iso-8859-1?Q?FxW9r2wtdO9BhPC0Z19fReDK4YBxbLWvjg+wk/1hKVPOx0rrtdJsLFiRbj?=
 =?iso-8859-1?Q?n1GvJtHlwWSZXmVghMBwBlr7AGGxJWEDcPnS+BMQd7Sx274nJMQrIKi2M2?=
 =?iso-8859-1?Q?97IiiZK9SoT1ANJ9S8Vni/?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6141.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?7t90B82N/NGU2RwXWZQ7Uew1c3iXrXMxcpePB15zk6pLICbCF6iUAxxQrq?=
 =?iso-8859-1?Q?Dp6jtOP9i764OP+QC0sfTPTLbf2x/F6ksZh9N9w02Ykw0DOhpSbmeL9d93?=
 =?iso-8859-1?Q?Po32aheqInKbCRG16pKVNf+jSY5buwwYPGnIH1P17Mn39zoDIxxBlkSGmv?=
 =?iso-8859-1?Q?Njpbbpm4fgXTPtC+/O5/LQ38GzowrmwhAM++cYR45Wj2zygkeiRlL8+LIn?=
 =?iso-8859-1?Q?jk7vdjumAIPnkHkdmqKiY/JqukrINU9+QkHlFRU01iQuciBKC2O85APatV?=
 =?iso-8859-1?Q?0o/yUs5BWgAv/yN9d3cPi6ecj7thnP4UIGSSXFkjLPEeYGTmF5JUFPSqIx?=
 =?iso-8859-1?Q?eICxzpCF7armAWgpsMqk5UZRK5Ygh1EGs1tx5ZuobedCt/vdj5nGK9e7G7?=
 =?iso-8859-1?Q?i7I1fmES6DfEWztf4rCtw9/ls5yxEbYidjBmQ7ClbsENW02ZAVkGRWnYFy?=
 =?iso-8859-1?Q?5Q6UGEtLYkpFZiCGLgL+qznnvHXpFpnGeImO4EbUwwORF6JsOzntDO3heD?=
 =?iso-8859-1?Q?atTqwLA3J+usCBWXEPXhe7jzZ8VxK4Z90D2iwMejyZvi0JcxPxH5bMJ20f?=
 =?iso-8859-1?Q?+3Ym2olv/QJewrBgWt+sc0VUkZ1b3zRnDnVtKy4lQ1wTR6Mq3d0fR0pnnm?=
 =?iso-8859-1?Q?xitGEwwoBZMk59c6FTwkYjxRICj86elP3LgptHdjOuQrTsD6pAo31I1s8d?=
 =?iso-8859-1?Q?KIEHc593rfXzW0t+469P459NNepz1+07bhzYjoHai2kBqKR7uPaQZWrqza?=
 =?iso-8859-1?Q?/yGmnrXx49RGY6Lky4AM3gcDWNBte7/O2UzkgK4BzEg6g4D9q0vcNhC5OE?=
 =?iso-8859-1?Q?lKX5EohTkzkTD3teVVNGUl5ziPIGvVmFZRiahvWs2VED5CkYZUoJGSino8?=
 =?iso-8859-1?Q?gi/QOJBXhHkQOie7GKr+feLIFsMVBX8mL/9SXb5mJqUuNs9Q6u+uBgz6UN?=
 =?iso-8859-1?Q?qTHXhjlmdOQk32yHycAuUlQb7AnrbKYluR3s/xHKMV7gmGyGJxYF8GWfmT?=
 =?iso-8859-1?Q?1lWbass3KhHxwWHKGREfEQO4nqTUCSTuD9ZLdpsbXUpvBa7mViThXvH31I?=
 =?iso-8859-1?Q?JYqM58EkFfYh73rsgndvegdKO4HDPbs9JD3oZHVABuBgLilyQ0sKeO7WnI?=
 =?iso-8859-1?Q?g4ySrt9nMH2awyTBTCiKPg0brPqxY1lXkSxl+Q1fJC/ZrdoIE2zrAVlWjp?=
 =?iso-8859-1?Q?sg8BJMriUAvzE2fJKpGt6IHWyz+BkW1leUHJ3Ycownj0O61kTrao8nR2Te?=
 =?iso-8859-1?Q?CuTemxx+CPo63WXMnrz/j86KEmvOz/E2ZgzQMBkfGnjaTMSq3kkKISxJAA?=
 =?iso-8859-1?Q?G6w+THNExV6EqffmJgZ7BLWMc6Xdaf4KGC+aGXgP7bQoNDAj8Eg7D5Ou41?=
 =?iso-8859-1?Q?EgrnE4pL9QgjR8rG81VIt4L65QvuSkkmCgVUMuIiVGEe9xQf6q/9tQaW11?=
 =?iso-8859-1?Q?ISINLmzqm5Ogr7HFTwC+gyUWnyTUPbdZrpWYl1ygdhA/pQHrUPqDK4DG2c?=
 =?iso-8859-1?Q?JYgk+C/6IKNbRoeT8QWLNN2nZ3dVtUb3tEFOKkF8oN4vJ3apkYvbaRlLaq?=
 =?iso-8859-1?Q?U19SA9q1gHHMhy4uj8fSKGSpTg4W9brkFs9FxL9q15cm6W8JWo1RWBmFE3?=
 =?iso-8859-1?Q?o7kPKaSZ+8NNwHeVQs+pODsAH8hTAt6GLLsZhbCtfi8ESu27OD5Ls9jw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6141.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eff4bb5-ac7d-4585-69de-08dd3f5d2ffe
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 05:32:42.5844 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3knIqpr/Dk1+N0cwealE5Pmt3PI6YhrHsCsm9aUe2phDBHcvm2dvqTWbv1e/M1BXfpkl8gmbUesujT3nsqn8boxJP4d9XiEsmkLsSy3phOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7390
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
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Sent: Tuesday, January 28, 2025 12:44 AM
> To: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>; dri-
> devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; intel-
> xe@lists.freedesktop.org
> Subject: Re: [PATCH v3 2/5] drm/plane: Expose function to create
> format/modifier blob
>=20
> On Mon, Jan 27, 2025 at 07:25:31AM +0000, Borah, Chaitanya Kumar wrote:
> > Hello Ville,
> >
> > > -----Original Message-----
> > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > > Murthy, Arun R
> > > Sent: Saturday, January 25, 2025 12:25 PM
> > > To: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > Cc: dri-devel@lists.freedesktop.org;
> > > intel-gfx@lists.freedesktop.org; intel- xe@lists.freedesktop.org
> > > Subject: RE: [PATCH v3 2/5] drm/plane: Expose function to create
> > > format/modifier blob
> > >
> > > > On Thu, Jan 23, 2025 at 07:47:14AM +0000, Murthy, Arun R wrote:
> > > > > > > On Wed, Jan 08, 2025 at 11:09:00AM +0530, Arun R Murthy wrote=
:
> > > > > > > > Expose drm plane function to create formats/modifiers blob.
> > > > > > > > This function can be used to expose list of supported
> > > > > > > > formats/modifiers for sync/async flips.
> > > > > > > >
> > > > > > > > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/drm_plane.c | 44
> > > > > > > > +++++++++++++++++++++++++++++-------
> > > > > > > --------
> > > > > > > >  include/drm/drm_plane.h     |  4 ++++
> > > > > > > >  2 files changed, 33 insertions(+), 15 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpu/drm/drm_plane.c
> > > > > > > > b/drivers/gpu/drm/drm_plane.c index
> > > > > > > >
> > > > > > >
> > > > > >
> > > >
> > >
> 416818e54ccffcf3d3aada2723e96ce8ccf1dd97..4f35eec2b7770fcc90c3e07a90
> > > > > > 6
> > > > > > > 8
> > > > > > > > b31c0563a4c0 100644
> > > > > > > > --- a/drivers/gpu/drm/drm_plane.c
> > > > > > > > +++ b/drivers/gpu/drm/drm_plane.c
> > > > > > > > @@ -191,7 +191,10 @@ modifiers_ptr(struct
> > > > > > > > drm_format_modifier_blob
> > > > > > > *blob)
> > > > > > > >  	return (struct drm_format_modifier *)(((char *)blob) +
> > > > > > > > blob->modifiers_offset);  }
> > > > > > > >
> > > > > > > > -static int create_in_format_blob(struct drm_device *dev,
> > > > > > > > struct drm_plane *plane)
> > > > > > > > +int drm_plane_create_format_blob(struct drm_device *dev,
> > > > > > > > +				 struct drm_plane *plane, u64
> > > > *modifiers,
> > > > > > > > +				 unsigned int modifier_count, u32
> > > > *formats,
> > > > > > > > +				 unsigned int format_count, bool
> > > > is_async)
> > > > > > > >  {
> > > > > > > >  	const struct drm_mode_config *config =3D &dev->mode_confi=
g;
> > > > > > > >  	struct drm_property_blob *blob; @@ -200,14 +203,14 @@
> > > static
> > > > > > > > int create_in_format_blob(struct drm_device
> > > > > > > *dev, struct drm_plane *plane
> > > > > > > >  	struct drm_format_modifier_blob *blob_data;
> > > > > > > >  	unsigned int i, j;
> > > > > > > >
> > > > > > > > -	formats_size =3D sizeof(__u32) * plane->format_count;
> > > > > > > > +	formats_size =3D sizeof(__u32) * format_count;
> > > > > > > >  	if (WARN_ON(!formats_size)) {
> > > > > > > >  		/* 0 formats are never expected */
> > > > > > > >  		return 0;
> > > > > > > >  	}
> > > > > > > >
> > > > > > > >  	modifiers_size =3D
> > > > > > > > -		sizeof(struct drm_format_modifier) * plane-
> > > >modifier_count;
> > > > > > > > +		sizeof(struct drm_format_modifier) * modifier_count;
> > > > > > > >
> > > > > > > >  	blob_size =3D sizeof(struct drm_format_modifier_blob);
> > > > > > > >  	/* Modifiers offset is a pointer to a struct with a 64
> > > > > > > > bit field so it @@ -223,37 +226,45 @@ static int
> > > > > > > > create_in_format_blob(struct drm_device *dev, struct
> > > > > > > > drm_plane *plane
> > > > > > > >
> > > > > > > >  	blob_data =3D blob->data;
> > > > > > > >  	blob_data->version =3D FORMAT_BLOB_CURRENT;
> > > > > > > > -	blob_data->count_formats =3D plane->format_count;
> > > > > > > > +	blob_data->count_formats =3D format_count;
> > > > > > > >  	blob_data->formats_offset =3D sizeof(struct
> > > drm_format_modifier_blob);
> > > > > > > > -	blob_data->count_modifiers =3D plane->modifier_count;
> > > > > > > > +	blob_data->count_modifiers =3D modifier_count;
> > > > > > > >
> > > > > > > >  	blob_data->modifiers_offset =3D
> > > > > > > >  		ALIGN(blob_data->formats_offset + formats_size, 8);
> > > > > > > >
> > > > > > > > -	memcpy(formats_ptr(blob_data), plane->format_types,
> > > formats_size);
> > > > > > > > +	memcpy(formats_ptr(blob_data), formats, formats_size);
> > > > > > > >
> > > > > > > >  	mod =3D modifiers_ptr(blob_data);
> > > > > > > > -	for (i =3D 0; i < plane->modifier_count; i++) {
> > > > > > > > -		for (j =3D 0; j < plane->format_count; j++) {
> > > > > > > > -			if (!plane->funcs->format_mod_supported ||
> > > > > > > > +	for (i =3D 0; i < modifier_count; i++) {
> > > > > > > > +		for (j =3D 0; j < format_count; j++) {
> > > > > > > > +			if (is_async ||
> > > > > > > > +			    !plane->funcs->format_mod_supported ||
> > > > > > > >  			    plane->funcs-
> > > >format_mod_supported(plane,
> > > > > > > > -							       plane-
> > > > > > > >format_types[j],
> > > > > > > > -							       plane-
> > > > > > > >modifiers[i])) {
> > > > > > > > +							       formats[j],
> > > > > > > > +
> > > > modifiers[i])) {
> > > > > > > >  				mod->formats |=3D 1ULL << j;
> > > > > > > >  			}
> > > > > > > >  		}
> > > > > > > >
> > > > > > > > -		mod->modifier =3D plane->modifiers[i];
> > > > > > > > +		mod->modifier =3D modifiers[i];
> > > > > > > >  		mod->offset =3D 0;
> > > > > > > >  		mod->pad =3D 0;
> > > > > > > >  		mod++;
> > > > > > > >  	}
> > > > > > > >
> > > > > > > > -	drm_object_attach_property(&plane->base, config-
> > > > > > > >modifiers_property,
> > > > > > > > -				   blob->base.id);
> > > > > > > > +	if (is_async)
> > > > > > > > +		drm_object_attach_property(&plane->base,
> > > > > > > > +					   config-
> > > > >async_modifiers_property,
> > > > > > > > +					   blob->base.id);
> > > > > > > > +	else
> > > > > > > > +		drm_object_attach_property(&plane->base,
> > > > > > > > +					   config->modifiers_property,
> > > > > > > > +					   blob->base.id);
> > > > > > >
> > > > > > > IMO the function should only create the blob. Leave it to
> > > > > > > the caller to attach
> > > > > > it.
> > > > > > >
> > > > > > Prior to this change for sync formats/modifiers the property
> > > > > > attach was also done in the same function. So retained it as it=
.
> > > > > >
> > > > > > > The 'is_async' parameter could also be replaced with with a
> > > > > > > function pointer to the appropriate format_mod_supported()
> > > > > > > function. That makes the implementation entirely generic.
> > > > > > >
> > > > > > If the list of formats/modifiers for sync and async is passed
> > > > > > to this function, then based on the list the corresponding
> > > > > > function pointer can
> > > > be called.
> > > > > > This was done in the earlier patchset.
> > > > > >
> > > > > > > >
> > > > > > > >  	return 0;
> > > > > > > >  }
> > > > > > > > +EXPORT_SYMBOL(drm_plane_create_format_blob);
> > > > > > > >
> > > > > > > >  /**
> > > > > > > >   * DOC: hotspot properties @@ -476,7 +487,10 @@ static
> > > > > > > > int __drm_universal_plane_init(struct
> > > > > > > drm_device *dev,
> > > > > > > >  	}
> > > > > > > >
> > > > > > > >  	if (format_modifier_count)
> > > > > > > > -		create_in_format_blob(dev, plane);
> > > > > > > > +		drm_plane_create_format_blob(dev, plane, plane-
> > > > >modifiers,
> > > > > > > > +					     format_modifier_count,
> > > > > > > > +					     plane->format_types,
> > > > > > > format_count,
> > > > > > > > +					     false);
> > > > > > > >
> > > > > > > >  	return 0;
> > > > > > > >  }
> > > > > > > > diff --git a/include/drm/drm_plane.h
> > > > > > > > b/include/drm/drm_plane.h index
> > > > > > > >
> > > > > > >
> > > > > >
> > > >
> > >
> e8749e6fc3bc0acfc73bbd8401f85c3126e86759..eb84830fbb723e39436bfbadf
> > > > > > > 369
> > > > > > > > 894a5657cd45 100644
> > > > > > > > --- a/include/drm/drm_plane.h
> > > > > > > > +++ b/include/drm/drm_plane.h
> > > > > > > > @@ -1008,5 +1008,9 @@ int
> > > > > > > > drm_plane_create_scaling_filter_property(struct drm_plane
> > > > > > > > *plane, int
> > > > > > > drm_plane_add_size_hints_property(struct drm_plane *plane,
> > > > > > > >  				      const struct drm_plane_size_hint
> > > *hints,
> > > > > > > >  				      int num_hints);
> > > > > > > > +int drm_plane_create_format_blob(struct drm_device *dev,
> > > > > > > > +				 struct drm_plane *plane, u64
> > > > *modifiers,
> > > > > > > > +				 unsigned int modifier_count, u32
> > > > *formats,
> > > > > > > > +				 unsigned int format_count, bool
> > > > is_async);
> > > > > > >
> > > > > > > I don't think this needs to be exposed to anyone.
> > > > > > > __drm_universal_plane_init() should just populate both the
> > > > > > > normal blob, and and the async blob (iff
> > > > > > > .format_mod_supported_async() is provided).
> > > > > > >
> > > > > > Ok!
> > > > > >
> > > > > For __drm_universal_plane_init() to have both the sync/async
> > > > format/modifiers list we will have to add new elements to struct
> > > > drm_plane to hold the async formats/modifiers.
> > > >
> > > > No, you can just use the already existing format/modifier lists.
> > > > .format_mod_supported_async() will filter out what's not wanted.
> > > >
> > > Agree, to populate the struct drm_format_modifier
> > > .format_mod_supported_async along with the existing formats/modifier
> > > list should be sufficient.
> > > In case of async for the struct drm_format_modifier_blob the
> > > elements format_offset includes the list of formats supported by
> > > async only. For this we will need to have the static list. So can
> > > passing this list be done by adding new elements in drm_plane specifi=
cally
> for async.
> >
> > Just to add to Arun's point. We had this discussion on thread [1].
> >
> > If we populate struct drm_format_modifier_blob for async using just
> > the existing format/modifier lists in struct drm_plane, We will be
> > mis-representing the following members of the structure to the user
> > space
> >
> > struct drm_format_modifier_blob {
> >         /* Number of fourcc formats supported */
> >         __u32 count_formats;
> >
> >        /* Number of drm_format_modifiers */
> >         __u32 count_modifiers;
> > };
>=20
> Nothing is misrepresentd. Those things just tell you what the bits in the
> bimask mean.
>=20

At the very least, it makes the comments inaccurate. But perhaps something =
we can live with.

> >
> > However, as you correctly point out, it should still work because of th=
e
> format-modifier bit mask.
> > But it leaves the overall blob unnecessarily bloated (for example, with
> unnecessary entries in the format list).
> >
> > We could however change the function in such a way that the loop
> >
> > for (i =3D 0; i < modifier_count; i++) {
> >                 for (j =3D 0; j < format_count; j++)
> >
> > runs before filling up these members.
> >
> > I am not sure how much juggling that would take but it could be a solut=
ion.
> >
> > Anything you would suggest?
>=20
> You're complicating things needlessly. The slightly bloated blob should m=
ake
> no practical difference anywhere.
>=20

I agree, if bloated blob is not a concern then we can re-use the existing s=
truct drm_plane members and keep the function more or less the same.

Regards

Chaitanya

> --
> Ville Syrj=E4l=E4
> Intel
