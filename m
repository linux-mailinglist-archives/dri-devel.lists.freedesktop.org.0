Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A60A57496
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 23:05:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D2C10E1EA;
	Fri,  7 Mar 2025 22:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XM2wqzHM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E41910E1EA;
 Fri,  7 Mar 2025 22:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741385149; x=1772921149;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+0L0uyJbybNFDwZulf9YMS4JBB2Ahp8c1BgakCVZ5+M=;
 b=XM2wqzHMuSRjZTbXLHen4Gq4mFOxTpwDtdh2ZQTUmi0AuHr+DBGDGUXv
 VqjCvAjpIlvatu86eelOKMikz1BQbDaZueh6zplcSG0nQoEX6B/xjLxYa
 +uoWGVVzhELeydM2CtmxVrnF8uo0PdgI7YnIiSpHUdg9qE5xV7C+gSwOZ
 IL7lgKBExevo5NuOfJE/7V3W2dHpuGOoxw1VhZ6JFNjQIQbroJFF/IXDk
 w+KSHp0bBRivTOavY1dNry+ZujfUG/hpAAvcFIzQ4y9s0Uysb0oAwY9as
 1TXUtAbAWpBC36bvqOFSISn5kLb+Weade6vzooWMxl7GgDLZkd2/pr+Nv Q==;
X-CSE-ConnectionGUID: sao9fK2aTcaUFf7t2IXZew==
X-CSE-MsgGUID: lJmWtJQkQ8+HotN41gGeqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="46370247"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="46370247"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 14:05:44 -0800
X-CSE-ConnectionGUID: c/do1FAmQ2yRX7BdjagnhQ==
X-CSE-MsgGUID: +aJdFEwQSOWkIu52Medevw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="119621492"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2025 14:05:45 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Mar 2025 14:05:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 14:05:44 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 14:05:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xFOG4bjTyNhhl5gmaGlnE3JeGML47ZIIdu+otypMWFjL01ZY5AptNMNSCzHytHFwu3sW+E7I+xRxuA+IlAMuvc+RBpiiy51RGgAw+c9giUh7RTHKPXsaqGCttRA0ETZGSIzWm8+dEVzLuaMpVwOuY9VVbHzyEaUQzhu2va72QjMGbgcC2uO6DchR/iom4jsE1WAzYc5GS+fl1Snil/6tn20ZgsaM53/TPH8BMBR9C9EUnHr+Nt+ezzDIIgZvDqiU7Gmx6U8a5yPnavPgW/IYOVpote9Bj2JtGlcvDKtNzDeyQ9E00icuWBQbpbI5AiLo4ExpfHzuNgcrgJvBKxPcIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wi/jHvXmYjrc5NYFl5EKBndPHMuGSXrccowxG1WZ/nw=;
 b=vzNDqylNVXWj8kz8Cc+5rUrM0SLenGq4YGsQo3B4jcX5TFDlZ6POm5oshK+bn95jFmOthdUImDA6ODCK4bL0bg1yo2N8Ut1bg4zN4brY+BI5ckH6Bh1/0PSeUlSr3Dyt/y2tiHcjH1UsOlJhKPrVlEGoZqB2tsGRXNFMSpL3wzS6iuDIYg69itCyQCQ+QglU09+pLqjRs31MY6wWE8dkkG2psp2W+vudXAm5TdXUbyQl1DV2HXxAn1PZLaP1fyY2Th/oGuMH2D1SZcrw203foF0z/+iv42lGNK5rpcpzd7nxM/H1z59pNCNft1DM5IeFdAaQrbWU537ZtPxfpRp8fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY8PR11MB7393.namprd11.prod.outlook.com (2603:10b6:930:84::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Fri, 7 Mar
 2025 22:05:07 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8511.020; Fri, 7 Mar 2025
 22:05:07 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Zhang, Jianxun" <jianxun.zhang@intel.com>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v5 1/6] drm/xe/xe_gt_pagefault: Disallow writes to
 read-only VMAs
Thread-Topic: [PATCH v5 1/6] drm/xe/xe_gt_pagefault: Disallow writes to
 read-only VMAs
Thread-Index: AQHbjSg0QG7YGkOWJEi+2rrei7xzSbNnftUAgACvr+A=
Date: Fri, 7 Mar 2025 22:05:07 +0000
Message-ID: <CH0PR11MB5444A4326927971BC70691C4E5D52@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250304170854.67195-1-jonathan.cavitt@intel.com>
 <20250304170854.67195-2-jonathan.cavitt@intel.com>
 <fcc8167b-5416-48bb-a8ad-b6896d3d8b8c@intel.com>
In-Reply-To: <fcc8167b-5416-48bb-a8ad-b6896d3d8b8c@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY8PR11MB7393:EE_
x-ms-office365-filtering-correlation-id: a32fb643-89e7-4d30-5a76-08dd5dc41f3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?OMuAV0uy7Lwt6NCLMBolZuCplbZGw2JRRIU3NnIusI7+hzWmXMksCFiB41gY?=
 =?us-ascii?Q?uwk7+OkCHTH0nDdtUs/9DR4bhrLEliCB04rLPxI4kDVlAtTamfNAg9TyjgKK?=
 =?us-ascii?Q?iqazvQLbOAOJJALEhIii9L4ytt70HLYhFgpty1HLr0GaGPxYp9ob9pCjJTlE?=
 =?us-ascii?Q?zl7qjczmGwug/+jLUUlKD7W4LMIo/THXaUWTPd3peOAgbm6wmvCFy5fL1E4Q?=
 =?us-ascii?Q?yBQjrsYt8QQ9LA0OVgjnE43nJ3oQK4eet1f+Qrgtv7Xt7KYOeTXE5WxPLVN7?=
 =?us-ascii?Q?2sfWnBmIzrr/QecNhv8rtSHJb+VO5IzsKMjr0Z3qnXCNV3Foo715TJuCbbdX?=
 =?us-ascii?Q?3fxArDeNgo8yeBkZWV1DkMpwJ3eJDUIfuJHkuSkAh0eb2A41fIivfb6WKgO/?=
 =?us-ascii?Q?UJjKYvMo+WWCUN6g/KlMDJiN3hhN0fFxMx06VwfzotckSdiaCj5nih5/DHlr?=
 =?us-ascii?Q?B8Kiw9bfqkLds2RlC9uXSeFgok2yGNvDjVZXtNp14cr8RQofxxWdQ0buZQRW?=
 =?us-ascii?Q?Kh+RhtnBQGDJA65PNzcPQyUrcD0eEBbAnK2XgH+NSWQ3slXtlbSTOCmo2pt6?=
 =?us-ascii?Q?xoQ9O2IszcZIdz2g6PACnu/335uvUX6tqRb/iD5jYdWNxnRs1Oq8nGeMz1yC?=
 =?us-ascii?Q?x21WABfEltHwKW0MMH0k0eGDPeIHSbbWZvnI5Okx691B446QrrPP0xJx31gm?=
 =?us-ascii?Q?2h+3DyTpl0+2aZPIfTwHI4PKZuQcEFFk4dghoKNOQ536B0dMeKdGnCt5YCb9?=
 =?us-ascii?Q?/A+sz/M09e/Fcq7YTU7U8Uszc4d7jgn5IQhI2AZknL+ihdGkNHZfycc/jqMZ?=
 =?us-ascii?Q?BO+akA6TWi+LRRd4WVRdHs0aE3Nje7gW2zg7cgjY4BXfkio1eKaayDwFmHjJ?=
 =?us-ascii?Q?P4tTtKOBwlg9uz5ggry+Qyl5sdTv+El6aVfWs8pt8Vcg9i02ma4Klt9k9yZc?=
 =?us-ascii?Q?TNvGGPQvOlgagQYcBsY7zHypZSChe9aM69PGAYTJIJ/qwhs2tUM4B5tTjAK4?=
 =?us-ascii?Q?xBgTOTyVMKFXJu7zHGANlWeD1LNnMyc9WgtFTQhm6EYmWvksbJB6IvAYpn13?=
 =?us-ascii?Q?9BTN5ge6xW0vjV0To63y84/y/cEMNmM/xY1ts20Y7ru0/eRMUheGMUjIyOI5?=
 =?us-ascii?Q?OYET6XD2J7pIiPBDilz3wOQR+ECAV6A3n9K1ewax0/cr51X0uih3WBVt9uqj?=
 =?us-ascii?Q?mT6aZfnQKJnXFAdtelHK/RFD6Yjs0B7n9YKYv9QvCk4ikIcYDxTJUdRgYfVP?=
 =?us-ascii?Q?n6nIbKhIWN+0xLcG/EK0m8g5rDCHcXslLm8XavdiufNe5KAxbktzdi/YtbMV?=
 =?us-ascii?Q?GLTBddxV6d5Q9SYZTbgwSEgr/MvyHZ2nM6WNdnRPRTDWD6aSYK/mAUzOb0gK?=
 =?us-ascii?Q?nfQOTeWqUsPQftRL635zNixndwLCVYm/7NpKzGPcLEK+0gO60A8AjCsJsyTX?=
 =?us-ascii?Q?+wzFiQgPaccXjlxbr5uqOZT+v88dPoVs?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jYiw1HePMeSKBR8xgajRt95mpq0GWrriupq4ESU5CoPjGSlOqSHOvEAuAt2R?=
 =?us-ascii?Q?o+ZuVHE0ZUreMCCouGr3BoUMifcp8+pGjFFVpkIwVOdmgxhLNC6rMqZZs/HS?=
 =?us-ascii?Q?j6DVWeXOazvH6R7xt6hQTwn/k7HxaFPy+ticqQ6W+XLWqxXA5fpys8Ut8xyR?=
 =?us-ascii?Q?HW9fRD8qVxHUQuwIfg1C4/kge+CgRc1UQDHaLQsIKSZzydFZXYyGcVNoTnBc?=
 =?us-ascii?Q?quVJ1cqq3kozJ8IVF3z8m/5I9xEwh2f/pCY/WdWlreITdK1ahS4flYn+OyLl?=
 =?us-ascii?Q?lnG2uOqn/wrQKwZf7ZY/Y6EA6rLJahFqAwxD1yWA7CHB1LnmhXljBFRo71md?=
 =?us-ascii?Q?kntm9uWFb9qexm21YgCbiHB1YcE5V2VALnwjNUr4TbsNFFsCaUERoUagmg+n?=
 =?us-ascii?Q?vkOBIWinFnQ4ah0ftiPoNfml9Qa4QduF2giQbO2VUp8vO8xQFxHjnEYo2DRf?=
 =?us-ascii?Q?I9qUbgGujp+Ua2qoBEb/cej80hvNzXTi/3JvDlZZYKn1b/5cqZ7+RsIk2H5B?=
 =?us-ascii?Q?koGJC2RoHGih2ZKPEmEdldZANDSE2Hg5atAWhUCftYBZ1dvf5r8gWSxId546?=
 =?us-ascii?Q?5r/2wa9sAMbJgjP8oQvJz4l8EVd5EPE5Vmy9972pxpoDrhTuBpLcoMpVajJZ?=
 =?us-ascii?Q?OQgtib0T7YUK9DvMm2zSgpNs2wzVXj8PL7zlWDdYcUt9X3SK72T1OyD9kYAe?=
 =?us-ascii?Q?xZHbnoet9yI7gfd/0CSCQPh/9+yaEBnjpwMuSv2SsoWzgtpyPU2AzKvDYv/R?=
 =?us-ascii?Q?KqdgSd4ef15wtyti6RjEDec+A0gRMaYHPO3Lsg3/mXvY2xGyoIAHzaBHUu6k?=
 =?us-ascii?Q?KzeNHSpHpE3lKaVHPBQaXZ6YkLBGTSpOEmJvd6XtmiaksF/802u2Dxwx0plN?=
 =?us-ascii?Q?IEptkeOW3N0SFx1y6C1rgM0SYylgBFZKOGaXl5Ma2LDQ7QITPc33G+3E0qgQ?=
 =?us-ascii?Q?bxK4kWE9R5jfSyeMjDJyzueh9VN+bYFbRC4nr1FgqFSuACfIuyQPJFEYuWQE?=
 =?us-ascii?Q?771VjDHbCEvUjSeF8EqV+lspMGs6XGzgvISYdxnnWDeQbbTeEBVbcIPbhYvh?=
 =?us-ascii?Q?WE/DALg+GGGnHPILuiJCtNPJCP7F5B/Zv/3dieiLU7kmi+cbFDGCU4MXGcsj?=
 =?us-ascii?Q?RlEG8YQH6l8LlpmICaktvO6cgdUEUuTesh6jdwhkffALz01MXCnDhyEbROD3?=
 =?us-ascii?Q?BYYIICVAZTQ/yuqXnNvd0M8KJagh2rXItF7LP7PuTkwPlvUJNY82ZTQMuTF+?=
 =?us-ascii?Q?s4sTthrm3g2eUj75sBaIpDnUNzVb5c9YWuEH//dL3YKr5kqVkr2FHas8fEik?=
 =?us-ascii?Q?aLbDfEftAsjkX7qkwNwmQdJoPZZB8UEaveD7GxsD20X4fg0DSD0PEocq76+y?=
 =?us-ascii?Q?TmhEDsQ3jePUnXlSYN7iPADSFkiHVCZhHz+5i1V28ZMAZxjm2g2biGQYFMxM?=
 =?us-ascii?Q?xWpeDeB4/htt6+Y08DkjRjtGgkMPzsh2lJ5g7+ElEXOzIm3+zrk2sFlo2qFV?=
 =?us-ascii?Q?3EdijVKLGiAS3rDyvye23eb8jzQiEN1U40o82mCwAkarsNo5e4QYqECGGw4X?=
 =?us-ascii?Q?D/zEQx+aBAL6rwB3BMsqN/IlcgDYqfbay/Tj4bbm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a32fb643-89e7-4d30-5a76-08dd5dc41f3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 22:05:07.4901 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LIdnGqkX++aOHKoNedHUxlX2IPmg3UrGObuZeCc+qGrkdIAoE1+5V4CA+yVIjsa0ElYfz4XaIErkQRz6S6IiN0DoCYiZzp1QcbHfLji1wm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7393
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
From: Mun, Gwan-gyeong <gwan-gyeong.mun@intel.com>=20
Sent: Friday, March 7, 2025 2:35 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedeskto=
p.org
Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.c=
om>; joonas.lahtinen@linux.intel.com; Brost, Matthew <matthew.brost@intel.c=
om>; Zhang, Jianxun <jianxun.zhang@intel.com>; Lin, Shuicheng <shuicheng.li=
n@intel.com>; dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 1/6] drm/xe/xe_gt_pagefault: Disallow writes to read=
-only VMAs
>=20
> On 3/4/25 7:08 PM, Jonathan Cavitt wrote:
> > The page fault handler should reject write/atomic access to read only
> > VMAs.  Add code to handle this in handle_pagefault after the VMA lookup=
.
> >=20
> > Fixes: 3d420e9fa848 ("drm/xe: Rework GPU page fault handling")
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_gt_pagefault.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/=
xe_gt_pagefault.c
> > index 17d69039b866..f608a765fa7c 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -235,6 +235,11 @@ static int handle_pagefault(struct xe_gt *gt, stru=
ct pagefault *pf)
> >   		goto unlock_vm;
> >   	}
> >  =20
> > +	if (xe_vma_read_only(vma) && pf->access_type !=3D ACCESS_TYPE_READ) {
> one question, if the PTE Present bit is disabled and the page fault is=20
> caused by atomic load/store eu instruction, will the GuC deliver=20
> pagefault request to KMD with ACCESS_TYPE_READ/ACCESS_TYPE_WRITE Fault=20
> type instead of ACCESS_TYPE_ATOMIC?

I'm not certain.  Matthew Brost would probably know better.
Though, if this becomes an issue, we can always update the pagefault handle=
r in the
future to manage this case separately.  And at any rate, I think it would b=
e best to
manage that case in a separate patch.

-Jonathan Cavitt

>=20
> G.G.
> > +		err =3D -EPERM;
> > +		goto unlock_vm;
> > +	}
> > +
> >   	err =3D handle_vma_pagefault(gt, pf, vma);
> >  =20
> >   unlock_vm:
>=20
>=20
