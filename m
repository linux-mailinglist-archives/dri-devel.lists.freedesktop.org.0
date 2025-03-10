Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07542A5A642
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 22:31:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B88410E337;
	Mon, 10 Mar 2025 21:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GqHZidsi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE77B10E328;
 Mon, 10 Mar 2025 21:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741642265; x=1773178265;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QI6kaIIiYmCik0QTW7j5HPt7KpEFlXnN9bymkF+hfIE=;
 b=GqHZidsi3atjRxHoFhLhjA1kjM1c7jL5D/TPOszUJjdeYm68ZTdpVIyX
 rJp3Bop/GhdwPDa5ALYeMDoi7yIpWh08WOv8pTfB4Gl97TTFIwr/Jx1e+
 4ageM8BsE+yXFK8OYj6EVBlf1QaeydbKezPitAEjNDOhWOVTdxVXaEazJ
 aQrdmaxC92Bq6NpZtDgdkc/KsmP9lMtREtap9iezwIMFSCocAG0n3YEBN
 1UjQgTw6y4Mrg1yX8+sbquni08bF68AsmgQCd4jvameNZW/me3NtHYANY
 WSqedTxqySExsj2wefXACkYRrynIJ2aQhD9ACm+VnvukXkJzDMN1XnpWS g==;
X-CSE-ConnectionGUID: T2fTgqBRSuCdLvD56JsQnQ==
X-CSE-MsgGUID: hrwjb3AbRJ23F5tOxUEXyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42789224"
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; d="scan'208";a="42789224"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 14:30:48 -0700
X-CSE-ConnectionGUID: JIRPcljdSvyctMQgthvtxw==
X-CSE-MsgGUID: 63KG/UeEQUudoJ+VB7N03w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; d="scan'208";a="143309482"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 14:30:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 10 Mar 2025 14:30:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 10 Mar 2025 14:30:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 14:30:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hnkh27MdzxM0Koi+pJ28Gq8Rw7xX7CYl78WvBpj3bH3xpCOFaFAjoE0YSYC6KvqmahZCT6MMfLoOrIgEJxIFNyt+FPi9endWOmjWFu/moh2wADJnshUHBwQ9JVtTOLUzaaeboov7KuvE/2A2rZh3Mmz3JC73DZ08iyNNzACDdxAjrrUT6f2R2EmkbSgsl8FxOc23TCaC14r2jGnJz9bzY4mnZB7WO7rrycUy2YFlM5KbQRnXx6VAnmWr1IJ/1Lyq+yFapgx3eF0ZHQkBlZRnFduee9S5l+wMcZzFZP7S6snSPfMSQqhqMBF91rG4n2ELiW3AaD9kPJcah8v0ARQ7NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggieJf3b+btBGLwqvHKs2GpP6Oz5k2jitfIWIbiUElw=;
 b=IVkgdKIHdGzraE983hEPMwWj/A10xFVB0i8B3qogZvvjVg4ClJ1FPNf85SyTx0SaoNS/nOo03tqO4qhjbd7pqGyDcaJYvRaEqTsAYm3ok8wgbGSfUt96a8EICNiIBgnqUfLusJvzKXzQH/r5jWygq5i4aqzNBUPIciGrC3ltuTg7cispcBlSIWpuVfwYOS0I1jdpEKA09yo0+wIMuhNDpaJ+WDnTQzqUOtUnBOy2de7K+vl7JAD870eoA6c1n2UqDBfX2ipsOWlXwwJiC211VkmJ4j0lEhVZLh+QcQumE/RH3blSt2f4dClpLY8+cjthNE4IR6dgmUGLZiKmYRQ9Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW4PR11MB6910.namprd11.prod.outlook.com (2603:10b6:303:225::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 21:30:15 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8511.026; Mon, 10 Mar 2025
 21:30:15 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Zhang, Jianxun" <jianxun.zhang@intel.com>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v7 2/6] drm/xe/xe_gt_pagefault: Migrate pagefault struct
 to header
Thread-Topic: [PATCH v7 2/6] drm/xe/xe_gt_pagefault: Migrate pagefault struct
 to header
Thread-Index: AQHbkeCB7rRozoYcL0++d5ScR6TumrNsrl8AgAAz2oA=
Date: Mon, 10 Mar 2025 21:30:15 +0000
Message-ID: <CH0PR11MB544460A0C65718325C0B9656E5D62@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250310171834.78299-1-jonathan.cavitt@intel.com>
 <20250310171834.78299-3-jonathan.cavitt@intel.com>
 <74c42086-2beb-429d-bf3b-6093e171aa77@intel.com>
In-Reply-To: <74c42086-2beb-429d-bf3b-6093e171aa77@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW4PR11MB6910:EE_
x-ms-office365-filtering-correlation-id: 605054d9-1af7-4744-5858-08dd601abfa4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?MpnibARLZbX3MoLGMeafZap3SqukW/aZ75+mc+M4dKXPWurMf1b+4HWtCiVd?=
 =?us-ascii?Q?LpY6pJoMlk3cMS8dczOKrtNyUJGwN/aF32qQwdiInAUmIdMuBXWqVkZECgyh?=
 =?us-ascii?Q?e1qNpD79qjpbsNxkfXAFMgWF0qi5f3gy8XecdpmF/uw0MAjMTITf3DHekG9E?=
 =?us-ascii?Q?PjHCXQJ1bcSH/HWsWT6ne3ujkss78o9vtSyfCw+g67mhG+fRJt6x40qkv5t/?=
 =?us-ascii?Q?wKHqtJA8KUdDYtau4HpPqEp9e5w+gNdgg/1ymltQMlOSRNby530eN2MW9dux?=
 =?us-ascii?Q?atMIFhPgsPWpDAZal13W5bI+Dc5js9GEseyeVvScZ5khg3H0yU10G5kzcXOv?=
 =?us-ascii?Q?U9ShKfXpH7q97MN5u8I75nfQ3+VXObMPIUQmmnDhYdA/Z58s4pqkVZZMq/E1?=
 =?us-ascii?Q?uWHfPrcVUgXU6vZoGiTHq3cHQtIFJaQWj8ExX61GQuJ6kkaMhYeZylcE8wPt?=
 =?us-ascii?Q?gTLQLInqgPwDor87etlShXz9mo46TB7Fk9EsOllZTP4njfJNYbrV+TwLyzlO?=
 =?us-ascii?Q?Yg3ZUx4vU8FH9qRXm+m45rf5Xv9WShcRkgx/rJbd+rpZc+DEKY+gm2Uw1E8s?=
 =?us-ascii?Q?waOTOV5DLIoLAUgNZUWmUSJ4/wnugjzuv9nOA0SHqARAt87uyPwSRVsy37ot?=
 =?us-ascii?Q?nhkzY6Ra4J034lnTjVqYwU6L/XHyaos0oFbTOpT1rYIVWvhO/j37mlXdlUZx?=
 =?us-ascii?Q?FcVPPxL+DI9V8qBVdMnoZ9bFqS21hVGSSUiyNECav8wS/rg7imry/qNeGJ+V?=
 =?us-ascii?Q?UNO5GoVZyff474Q/ePFXaERW2HjArEOLrcoLB6ISkZW7RXGm3IVbFIGuBfB8?=
 =?us-ascii?Q?okode70GRHsCI2nx2uxfI7HTWDSJFfYDlikKLijs9ETDz55nwCRGNpzDxUlh?=
 =?us-ascii?Q?zuGVK64NN5/4lcphl3tncxc1QxGGkzxjuLOGRiMT9YbteiHH3c4Rk61pp6/3?=
 =?us-ascii?Q?ctQPT/yrC4WrLCEZaJ5140klE4fT3PUhDulT5Bd80T+/spcBwHwagh5Q+Abg?=
 =?us-ascii?Q?vNyi8wmgay0XRad5qNM91UpjssaGnbWMZ7oW1kJNXqDiZit061U7fE91Ge9S?=
 =?us-ascii?Q?7JU6euwIzgpaMgCV14esNIv1Pq2VAO1GY4HpH8LuW0LipGwqbqVrc2DKKqKR?=
 =?us-ascii?Q?SRAn9wq9ORBM4YLIAyyhl947RKi2GoaI4IxggdPxvUir1UFiI8YfpxhTRRrs?=
 =?us-ascii?Q?OetVkKe1ZfRqJy0dmhy7+7TVdUIlfphdhhNQX3GgkcAhGA0ZAEeTnw2ioK8m?=
 =?us-ascii?Q?UWcehdddl0KO7NmfFHEseoyIoxVx3F6cBOQR9KRuxCuuzO1iTqT9Mcj5EDWn?=
 =?us-ascii?Q?DyksgT+Yn8g4GHU4OUpLmZ+ss1I+KAOfQoBGbTjrhUaHlhUYHdG+CLTXqd3D?=
 =?us-ascii?Q?RWh5h2+hhjzXUObJHDlWmXVNXoBCwjPPmdCLWQoZoFL0xZqu91D9mTF/yRaB?=
 =?us-ascii?Q?31qxkVWk0oRD/zXzzrchUxkDk85u6lEy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ash52bcJrWD/JRqdAERoBL92jHTYr9QCvgn2g9nKSub9JYYSDBTNDTxrZT8U?=
 =?us-ascii?Q?GtmQADvecXDQr/K7TxrNHke8BHJNF4UQjd4hwlBQkSUDjgsHt+9YvjJ7uRDy?=
 =?us-ascii?Q?hRZbtws3LTULqckJQ9W+w91EXxNWUjC1b9v+dZHVu/v/LhcK09TWWy2vorfr?=
 =?us-ascii?Q?nkJ3qVXOlv0olQPimuUlMJiHj/IU1s4fmrbL7tp9BGgIs3cVW0IeQ7klnlnn?=
 =?us-ascii?Q?+Id5HWck0CBDPBMYb5AtgRy983wgIMRAena8EMmTeijj7RdVtRa79FdOZ0Pn?=
 =?us-ascii?Q?FVWrTg7dsAoVVqc2LgaJfK7x3CSyhG2pmveRR69qr2yFexsitRDboxPAj4dt?=
 =?us-ascii?Q?OW53WGdGFjqTN15CF+tipv9LJ3B47ybCu11S31+INYPxdemJrnmzUgbpGWvH?=
 =?us-ascii?Q?fEu4Fx46hkaNffA1EN5NXM9JRCUegBI/3cTIoV4C0tKf1871OGZdYCDXCPEg?=
 =?us-ascii?Q?ulUGzr7rGISs5eveQnjRBmvigaQKH9h+z/1sBucspQV/NfZPbZaG8JNUetED?=
 =?us-ascii?Q?PlQ+G65VQZKnkS2t2AsCwSGZCLRx2qeCrwqFF52knVzfVbRCEBxpZ8s7paRk?=
 =?us-ascii?Q?SYgv9SOTHz0+VEPNirKFRauxFIGB679xcF9Ri+W8pUUxFyWiRta7P+HenaHu?=
 =?us-ascii?Q?FEZJvdY7IPc6PMDAvfJ0e5w1vnl3AarNGj5k/doLjfR9H4iIaitWCffzEsr/?=
 =?us-ascii?Q?VWqPOYXOz0Kmgl0niXMM3rrZpuLficS1ScWRNjnS6mN2FHIU7XO0fh7U+ngP?=
 =?us-ascii?Q?x6uiC+t+JowdSdUxRC/+QybrSpgO99Egx6umcGR1qTT3ghXgnMA97YEaJFXM?=
 =?us-ascii?Q?/qmrMc+bImYshbiZy6ZyCB3o5TB0pnnyg06uHaoi6VWswBCgMQyz6Thk+979?=
 =?us-ascii?Q?Ibl/worfS0JbwqY3Pr3K6JINgypu56Rnn0q6XM2XV/9h88M8xKl+TdCAj+qs?=
 =?us-ascii?Q?NxP0q98O1DEI9D1pW5bjgWCV/j1xlAHptYnEDgEOn6h3/udF9hJ0FGFuoxXH?=
 =?us-ascii?Q?mgKxF3LQCJ7UgFYNu+7k/r7m4diW501HmrFbKCfBXqOMTcu1O1U0EcynYDKZ?=
 =?us-ascii?Q?H5eNsKOxryYeWtQPwI2bQ4oXRPNN18f3aFsClXuX6qkdoI/QO5hUmP1mnjTD?=
 =?us-ascii?Q?ntDbUahpcpWXFRMkxJlEULvt5HgTFUOokNTiYiGNuKbAxxwIo4ikOxctXRd3?=
 =?us-ascii?Q?dIU3G4vZpTzvGHQMWXI7mHIzvJQ5zaYtokrik9wAiLnqcrA+6CGthqc5m2fC?=
 =?us-ascii?Q?1cxmxh9AIyF2wEuHvFG13w/r2gBNag1ylqsIl4I2uD579gx7ENNxn3k2YpWz?=
 =?us-ascii?Q?fV7E1cSfc3SeZi8c2Iw/uqEqQEnCO/QbHKROPXXRWlfAUgDXHawKJ6xAyniC?=
 =?us-ascii?Q?DLggRTCRvBCvrCSmmuN6rOxDiRzCT55c8HKPjCeWS8M2OuE1CAEfyV8VonRg?=
 =?us-ascii?Q?WfprN+JpBqfg3Mfyib3vsddZPqqRWiWl1h3KD6d64cZuMs/kEFWUMkndgq9C?=
 =?us-ascii?Q?f1Xq7BT+Bc+Im6/Zv5SQk1oHI/yQjvBWWYelJRZBYupwcxnD8kFX5g3qPmm/?=
 =?us-ascii?Q?ynBnCBzpGMhzZzXjAj5WMrbEXWnbALUT2Nbfb2fc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 605054d9-1af7-4744-5858-08dd601abfa4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2025 21:30:15.7057 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 12NirqSBwS7+FovufFWxbgO9GT8Sc+BAlrQbXW+05aXx8vy0FOTDvUkBs8LzwIIWoRGtCTCrg+RrZ1eUItyJkWjSG5FARjWr5ORUnRX51mQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6910
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

-----Original Message-----
From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>=20
Sent: Monday, March 10, 2025 11:20 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedeskto=
p.org
Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.c=
om>; joonas.lahtinen@linux.intel.com; Brost, Matthew <matthew.brost@intel.c=
om>; Zhang, Jianxun <jianxun.zhang@intel.com>; Lin, Shuicheng <shuicheng.li=
n@intel.com>; dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 2/6] drm/xe/xe_gt_pagefault: Migrate pagefault struc=
t to header
> >=20
> > On 10.03.2025 18:18, Jonathan Cavitt wrote:
> > > Migrate the pagefault struct from xe_gt_pagefault.c to the
> >=20
> > nit: we use "migrate" verb for different purposes.
> > maybe here (and in the title) the plain "move" will be better?
> >=20
> > > xe_gt_pagefault.h header file, along with the associated enum values.
> >=20
> > hmm, all other components have foo_types.h header file as place for own
> > types and use foo.h header only for function declarations.
> >=20
> > why are we doing it differently here?

xe_gt_pagefault_types.h does not exist and would have to be created to sati=
sfy this
request.  It would also basically only contain the below xe_pagefault struc=
t and its
related enums.  Is this amenable?
-Jonathan Cavitt

> >=20
> > >=20
> > > v2: Normalize names for common header (Matt Brost)
> > >=20
> > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt_pagefault.c | 41 +++++---------------------=
--
> > >  drivers/gpu/drm/xe/xe_gt_pagefault.h | 28 +++++++++++++++++++
> > >  2 files changed, 35 insertions(+), 34 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/x=
e/xe_gt_pagefault.c
> > > index a4e688e72efd..c8a9058aa09f 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > @@ -23,33 +23,6 @@
> > >  #include "xe_trace_bo.h"
> > >  #include "xe_vm.h"
> > > =20
> > > -struct pagefault {
> > > -	u64 page_addr;
> > > -	u32 asid;
> > > -	u16 pdata;
> > > -	u8 vfid;
> > > -	u8 access_type;
> > > -	u8 fault_type;
> > > -	u8 fault_level;
> > > -	u8 engine_class;
> > > -	u8 engine_instance;
> > > -	u8 fault_unsuccessful;
> > > -	bool trva_fault;
> > > -};
> > > -
> > > -enum access_type {
> > > -	ACCESS_TYPE_READ =3D 0,
> > > -	ACCESS_TYPE_WRITE =3D 1,
> > > -	ACCESS_TYPE_ATOMIC =3D 2,
> > > -	ACCESS_TYPE_RESERVED =3D 3,
> > > -};
> > > -
> > > -enum fault_type {
> > > -	NOT_PRESENT =3D 0,
> > > -	WRITE_ACCESS_VIOLATION =3D 1,
> > > -	ATOMIC_ACCESS_VIOLATION =3D 2,
> > > -};
> > > -
> > >  struct acc {
> > >  	u64 va_range_base;
> > >  	u32 asid;
> > > @@ -61,9 +34,9 @@ struct acc {
> > >  	u8 engine_instance;
> > >  };
> > > =20
> > > -static bool access_is_atomic(enum access_type access_type)
> > > +static bool access_is_atomic(enum xe_pagefault_access_type access_ty=
pe)
> > >  {
> > > -	return access_type =3D=3D ACCESS_TYPE_ATOMIC;
> > > +	return access_type =3D=3D XE_PAGEFAULT_ACCESS_TYPE_ATOMIC;
> > >  }
> > > =20
> > >  static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
> > > @@ -205,7 +178,7 @@ static struct xe_vm *asid_to_vm(struct xe_device =
*xe, u32 asid)
> > >  	return vm;
> > >  }
> > > =20
> > > -static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> > > +static int handle_pagefault(struct xe_gt *gt, struct xe_pagefault *p=
f)
> > >  {
> > >  	struct xe_device *xe =3D gt_to_xe(gt);
> > >  	struct xe_vm *vm;
> > > @@ -237,7 +210,7 @@ static int handle_pagefault(struct xe_gt *gt, str=
uct pagefault *pf)
> > >  		goto unlock_vm;
> > >  	}
> > > =20
> > > -	if (xe_vma_read_only(vma) && pf->access_type !=3D ACCESS_TYPE_READ)=
 {
> > > +	if (xe_vma_read_only(vma) && pf->access_type !=3D XE_PAGEFAULT_ACCE=
SS_TYPE_READ) {
> > >  		err =3D -EPERM;
> > >  		goto unlock_vm;
> > >  	}
> > > @@ -271,7 +244,7 @@ static int send_pagefault_reply(struct xe_guc *gu=
c,
> > >  	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> > >  }
> > > =20
> > > -static void print_pagefault(struct xe_device *xe, struct pagefault *=
pf)
> > > +static void print_pagefault(struct xe_device *xe, struct xe_pagefaul=
t *pf)
> > >  {
> > >  	drm_dbg(&xe->drm, "\n\tASID: %d\n"
> > >  		 "\tVFID: %d\n"
> > > @@ -291,7 +264,7 @@ static void print_pagefault(struct xe_device *xe,=
 struct pagefault *pf)
> > > =20
> > >  #define PF_MSG_LEN_DW	4
> > > =20
> > > -static bool get_pagefault(struct pf_queue *pf_queue, struct pagefaul=
t *pf)
> > > +static bool get_pagefault(struct pf_queue *pf_queue, struct xe_pagef=
ault *pf)
> > >  {
> > >  	const struct xe_guc_pagefault_desc *desc;
> > >  	bool ret =3D false;
> > > @@ -378,7 +351,7 @@ static void pf_queue_work_func(struct work_struct=
 *w)
> > >  	struct xe_gt *gt =3D pf_queue->gt;
> > >  	struct xe_device *xe =3D gt_to_xe(gt);
> > >  	struct xe_guc_pagefault_reply reply =3D {};
> > > -	struct pagefault pf =3D {};
> > > +	struct xe_pagefault pf =3D {};
> > >  	unsigned long threshold;
> > >  	int ret;
> > > =20
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.h b/drivers/gpu/drm/x=
e/xe_gt_pagefault.h
> > > index 839c065a5e4c..33616043d17a 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.h
> > > @@ -11,6 +11,34 @@
> > >  struct xe_gt;
> > >  struct xe_guc;
> > > =20
> > > +struct xe_pagefault {
> >=20
> > shouldn't this be "xe_gt_pagefault" ?
> > all functions seem to be related to the gt
> >=20
> > > +	u64 page_addr;
> > > +	u32 asid;
> > > +	u16 pdata;
> > > +	u8 vfid;
> > > +	u8 access_type;
> > > +	u8 fault_type;
> > > +	u8 fault_level;
> > > +	u8 engine_class;
> > > +	u8 engine_instance;
> > > +	u8 fault_unsuccessful;
> > > +	bool prefetch;
> > > +	bool trva_fault;
> > > +};
> >=20
> > missing kernel-doc (for struct and members)
> > and for below enums
> >=20
> > > +
> > > +enum xe_pagefault_access_type {
> > > +	XE_PAGEFAULT_ACCESS_TYPE_READ =3D 0,
> > > +	XE_PAGEFAULT_ACCESS_TYPE_WRITE =3D 1,
> > > +	XE_PAGEFAULT_ACCESS_TYPE_ATOMIC =3D 2,
> > > +	XE_PAGEFAULT_ACCESS_TYPE_RESERVED =3D 3,
> > > +};
> > > +
> > > +enum xe_pagefault_type {
> > > +	XE_PAGEFAULT_TYPE_NOT_PRESENT =3D 0,
> > > +	XE_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION =3D 1,
> > > +	XE_PAGEFAULT_TYPE_ATOMIC_ACCESS_VIOLATION =3D 2,
> > > +};
> > > +
> > >  int xe_gt_pagefault_init(struct xe_gt *gt);
> > >  void xe_gt_pagefault_reset(struct xe_gt *gt);
> > >  int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len);
> >=20
> >=20
>=20
