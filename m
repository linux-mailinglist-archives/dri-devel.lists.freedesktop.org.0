Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5F4A453D5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 04:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 131E410E208;
	Wed, 26 Feb 2025 03:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PmdhausA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9086710E1F0;
 Wed, 26 Feb 2025 03:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740539648; x=1772075648;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nHsyuiRIHeuCpGyhGN6ZhaxzDhTzSh7AncOWx5hNI1E=;
 b=PmdhausAklEq8nkWPFwobh/AdZsukC7lDk+JXofvw25cjCK//DmheTJv
 lCHwhhPXRzbxAlWN0BRgkNfFh5wzNVQLZ+pw+IHkZhmReqdYFrV3yoHrQ
 ncwFBiEL+p7x56kxInYURBotjZ1xD0P6CxJuhcD9aJWAVZXAWVXj/PHb6
 7mL/KZOsWsKRQh7tW2+L5fMrh0NDunihx2qauTrr8MJBF9E/kkd6m3a4c
 MO2hbgblPoxLDJ5kPtBlH38KMnbY1xXBPC0WjK6Oqm61oV21HLPAF0lGl
 UQVyHH2Ic5etzVKreawoVCXDSN/ExBwK7Y3WZCeOIzyhM6q+MrDyfoLmM Q==;
X-CSE-ConnectionGUID: iDGIrp1kQQ23nS9oW4aRJg==
X-CSE-MsgGUID: yCfc7/yHTYKQfmAh9gJH1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41077023"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="41077023"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 19:14:07 -0800
X-CSE-ConnectionGUID: qCqzTTX2QgWlZQWOBf3BEw==
X-CSE-MsgGUID: cbEFQCfATa22PkGDmWm6ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="121677482"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 19:13:53 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Tue, 25 Feb 2025 19:13:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 25 Feb 2025 19:13:52 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 19:13:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mw5ev9IOO7wM3hUpbr9feKVGvmR2AcgD46XYDBoWKrFJDeQHWPl13alLBS6vefHmAUMvBxLvDOYE2s9x/A9t7KP71AjagpriV2i0nSQDYvvm7WZn34i6JWvEqpya30fjDNJxSpuOoBZbK05qS9MNjUCqM+1cvBVc8dZ85W6jb1TnKNtIo2eUQhEUzZjW0RMkhPXyZD4Ck3bEPor0ixnnk1vTr8/itt09mqcfWSeNeefvrlPePVCNYa45Pox0rEl76w3s+o8OKvRaae1bbYsqFrdJIzPebxmDq4tUt/MGoF/maniEuMxntASp534iqCY2opMd4B71lNC4Iy3lEIWvnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5ofoVMSNAMrZGcW8Lc0nBqQLRwixmGyrq4S16zK7Ro=;
 b=mmaYnBA2x32im8OWef0RTwk4YoGDtxZeYCzl/0pIpPmw+8ydK2Mc3gj5Bh8ZO6nDhVzlaubaf59KHeV285v7mmjag/coNCZ8s9bjzmFGxnL8VUoICsJbz8u0oeuLF6cTKS45C9R3SlHQd8R6y7dL1M6YGNqSisRO6ZCQ2M4It8dQY7Kl6EBl48eK6pP4uJxIwTb9oR7Dbb+3xwPNM3phcDAFg0bA2Bf9DqfAx9rwVOR7z/4GAUo2GGEs8KlmTQRiEgAt0sBsDHXqoHIRy7/BlB6IJq+RlUoolynpxPdwUacuW0YtB72sUGIWRuHG348+pnBKbbRziS2VzgYYYEdTjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5019.namprd11.prod.outlook.com (2603:10b6:806:f8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 03:13:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 03:13:14 +0000
Date: Tue, 25 Feb 2025 21:13:09 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <jeffbai@aosc.io>
CC: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?utf-8?B?Sm9zw6k=?= Roberto de Souza
 <jose.souza@intel.com>, Francois Dugast <francois.dugast@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>, Alan Previn
 <alan.previn.teres.alexis@intel.com>, Zhanjun Dong <zhanjun.dong@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Mateusz Naklicki
 <mateusz.naklicki@intel.com>, Mauro Carvalho Chehab
 <mauro.chehab@linux.intel.com>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Kexy
 Biscuit" <kexybiscuit@aosc.io>, Shang Yatsen <429839446@qq.com>,
 <stable@vger.kernel.org>, Haien Liang <27873200@qq.com>, Shirong Liu
 <lsr1024@qq.com>, Haofeng Wu <s2600cw2@126.com>
Subject: Re: [PATCH 1/5] drm/xe/bo: fix alignment with non-4K kernel page sizes
Message-ID: <wcfp3i6jbsmvpokvbvs5n2yxffhrgu6jyoan3e3m6tb7wbjaq6@tbsit7ignlef>
References: <20250226-xe-non-4k-fix-v1-0-80f23b5ee40e@aosc.io>
 <20250226-xe-non-4k-fix-v1-1-80f23b5ee40e@aosc.io>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250226-xe-non-4k-fix-v1-1-80f23b5ee40e@aosc.io>
X-ClientProxiedBy: MW4PR03CA0215.namprd03.prod.outlook.com
 (2603:10b6:303:b9::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5019:EE_
X-MS-Office365-Filtering-Correlation-Id: 2706e845-9c86-4115-813d-08dd56138212
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?apOPR/X2JWKJ6SEcJq1WnL+S9ID28uhT4wM7y11AZ3+M8xujoe1ylPoqAzRL?=
 =?us-ascii?Q?DzgI9Z4D/UItlU1mT+d+iNyPVdUHADPj5e1Pi1DYtf9Z8WsZr2IS2Nko2gNs?=
 =?us-ascii?Q?yht4VyHVgkqfiYuodIsAbgsgbn7L5kJgXrZhXioqvNTReHMK+SBZgcUpUBCr?=
 =?us-ascii?Q?Hey2TFdqSiHdtpePRXRcfAZdJDGyOw+dU4hhb1xQjTvrVCQecVZxz81CKlKG?=
 =?us-ascii?Q?9+9CRauBnNCdc30oPO+WKiEX1TaFO95fduRB4WGTI/A8As5DrpfPcNlBjzKi?=
 =?us-ascii?Q?Kpwq47yyundKviBHZdCRrXUqd0yn3/zQwOVvNlKq5kXqvEtDBo3T+R2j+rDy?=
 =?us-ascii?Q?z95+cVui4fCoRY2LHnPsEZ6/4QiEfodiuqWypKYXW0zkdUM6f1McYrtXWhto?=
 =?us-ascii?Q?jx47KkrzlsgCjjS9WTZP3bTovgvtxfiG+pzia3cYYcN17fXRTLtVgJWdncIS?=
 =?us-ascii?Q?TsSmFReUl5+c5MzfkguRML9IcQFjjY1+2tHQ/gR+Uh6yKRh5fvGueJwxtRqi?=
 =?us-ascii?Q?2Od3FDEagDCXQu+Rcl7wpfXxWm+DqMY2y9kLuifgLwKsJlHL0M7BKPCqnqry?=
 =?us-ascii?Q?66zfnH8UQsaBd7P00zwOLyW/RowYbn4tvB7cnjZIdW+iwquumZvkBxba+3Ro?=
 =?us-ascii?Q?hkaE+Mo6bsFgIUEnYeNzJXTdl9IAPjfwIpkwBDhEqY+1t+K79qbV8N9Szw75?=
 =?us-ascii?Q?bSsQlY+6M+XO2+reeAG9U2MJyTQ14oUV5Bl+pZTtCVYIBPU6pwFHipGuMht3?=
 =?us-ascii?Q?2ThcVWtsRCT7+YMohppaxUjC0a8fXY7TMUEExRVglByA0KfwlkoaIu94Gxtb?=
 =?us-ascii?Q?iVg+IEk3Z4x2w4Ov1p2ScqgpP8Nw+2tTW1H+9BvFwPqrMFBM4Mo6k3umPOcO?=
 =?us-ascii?Q?ery9+c6EQZNm9dMrDYdiZuHAGwKvaF/Gel6MOaHRPAHfPToCED6tWDLTodeu?=
 =?us-ascii?Q?VAb9VWqPDsxutDTHwKn8rIIEYUMTvTFBjwt6ashBgBGJQ2nqnuA3xZ3MLV/n?=
 =?us-ascii?Q?FRxF1rmJ2yvAVausJggiIe5IgIxHcbnzpF4766WPTbENqplqNuk+KVL75Ggh?=
 =?us-ascii?Q?yDOSH85/7DzdVltF7io3vys1cT4/YYwk7h2i7or4jpULga4UuXn2aQ9/XCkS?=
 =?us-ascii?Q?oTNeempirshMz5A0cc6ZMxwHR67IJyyWWM3dd/0RTi0BXN7Km0vZjxFtgEzW?=
 =?us-ascii?Q?fB7EZqckQPdVSiLQpYaIs7xGCw1QybHRf+Pn7HdPIqggpKT0coETVanzbBiY?=
 =?us-ascii?Q?8fJSkCPp9rQrVucvqmhFrZw13jbJD/gb0cB6vURT/lqdy3xhHqw4dh27+Y56?=
 =?us-ascii?Q?SZvSCi9czFp4pPp2ffwP/gew1TsgwodPaqWouLiRYggHjjYHx8Q/gTlRJkWn?=
 =?us-ascii?Q?XL4BTHYWJuPiwr1zyH5KF+kDjOuC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y8FQshM0b9+srA7uhQ4vGa0IjmdIOUeIC4N8TX9Qx0ifianKh89MNQ7PQYbJ?=
 =?us-ascii?Q?fxp5C7sRo+2kBu6FM6hXw9NqiMuAE60M9vns52mxZP+nfS7yai2ltnAOd+Cq?=
 =?us-ascii?Q?LPBvop1xTtfAhTbSBZf5W7Rk4+pingVYeYpP8+3s0TveMgwQtqX+FvYsAn99?=
 =?us-ascii?Q?CimaaYvd0pv7tRdG09YMf5wSyq3sApzhp0x0Hcz2kqc2jzdfHfT6ZGNbFNV6?=
 =?us-ascii?Q?SN8RaAxZ1ZRlfTiPLKRuShXJwkfQ8qyX+uB/ezuDMh+5/s6cCBb3QFTXaGcy?=
 =?us-ascii?Q?J4R89Wku+1dJfPekZBuDYamT9FNftsrejRb8UAFcMxxW1VNyTtrhWZTGMpc+?=
 =?us-ascii?Q?HAwPaeHc56RFRwVtZzsB8SLSOwd319D7LbiS/HxPxwcboIHoVHa40dYCJ3LC?=
 =?us-ascii?Q?zyUw2t/AyOyUS2YwafGiBTqMpyXIMtG2R/kmeUk4VAoPm949pKlrPgSjC7Ua?=
 =?us-ascii?Q?2tgyYQriYyAYkDXqVpPX88x5KMFfWJ6qGYTqrEhjZCJH0FRM5Xj+8gM9JKs6?=
 =?us-ascii?Q?ow8etAh8M7u9wwaW0eHySGrqxSBA+uU1Llg1crxGzdmQ4gN1dI9g+YULwnwr?=
 =?us-ascii?Q?VsXrNwS6EQmL7m9U/A2v6Ao37ZeLu7AF77RdaOSGmwPL5VvWeLor/GEDuM3B?=
 =?us-ascii?Q?IQxwpobS5Tw4w2ebic+CynT1rvjvWIczu3EE2GoemyhlUlZQd8JS5zdEssoJ?=
 =?us-ascii?Q?2d5lwtUvQtbaaswH9AFuICxEMpUAZOO1BX5bd2CKzM2rrLR5zajjwVLdYAnJ?=
 =?us-ascii?Q?CJpX2a6JCZotGLoCV0gQ/TU2hA0CwNCJqNPUrIwTP5+n+69r9nlR3BUh8qnd?=
 =?us-ascii?Q?yXEQEwtV0N66CX1NfUcfzNSlqTHJ2EpW8FaOn4IyHsra6AQOpIqh/l2FvhFx?=
 =?us-ascii?Q?SNl9IAJr9Xqan8u3Qkvm6Pd5FNYtZSXKNHfD9CPgl878xFBS1iJH2AzKa4UL?=
 =?us-ascii?Q?ExQzVAa7Pp+xT2swvsFJ/dzAdjwc+lTWlD+uFJEzIbRJbq31sy1rVp6N8mkQ?=
 =?us-ascii?Q?U0Pcj4Mc6qaFIncXIdQMEyt1KNjDiretLTgj06+Amq6xSKhEU3KdEEB+9VQ/?=
 =?us-ascii?Q?Nh7TuaGA7R1yQZlQ603kkq6XV6ZgJRi7+LK+wu/1MghfsoatdF9MCwvz3KRu?=
 =?us-ascii?Q?IffjCEncJVr+RSNmDvowNamP8JPdr+q5xvy8jONhJLeRjh4HHHFapFI/Wm2L?=
 =?us-ascii?Q?7HrI9eCE/WKy8BXYu2+fUbKhNlIbjtqlAUj1Drzesk5hTnLQ3v3H6deEjsKi?=
 =?us-ascii?Q?qazjpV7uHf9za5/XGF1WNx5KmVvOPTsplVxBuCkGtownnwyuGvXuPVaomsL4?=
 =?us-ascii?Q?v8kFjoVTb2x4hJQztGRwmRPirMWG/lHzXRH5Dn8dKypto7uOUZpn4Hp6BqnI?=
 =?us-ascii?Q?+2EUzHL8PKttNKgQxwAJkS4Ho6L0m1DFAbDWy9dmwJroM2Jh5n2M89miibgf?=
 =?us-ascii?Q?czu8hO7fcbK4RKt3FU5KqjhAIDfoM/NWPdGhDTBETGT28s+LotcTQldvVG5L?=
 =?us-ascii?Q?hCL0S6MKvOThOvfVFOq6vYxfA1TZfEaiFMfQqa7G61+uMOpzhzKb7PNn+Fb0?=
 =?us-ascii?Q?6h8fntjJCn9KtDWBm8rYvRnM/jtmQ+81Vw17XMuTXiVO0u4eZXwfRBnqmI8m?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2706e845-9c86-4115-813d-08dd56138212
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 03:13:14.5060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UGdiP7bNkKpmaitHI3zSo/TakAYhkHNwIeByqKgsfb99M7erThr9uldgfojZjWV3+50GVf4PnQx8QhqVM+FwH6H+H1/Bz21GFfCthpCeFx4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5019
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

On Wed, Feb 26, 2025 at 10:00:18AM +0800, Mingcong Bai via B4 Relay wrote:
>From: Mingcong Bai <jeffbai@aosc.io>
>
>The bo/ttm interfaces with kernel memory mapping from dedicated GPU
>memory. It is not correct to assume that SZ_4K would suffice for page
>alignment as there are a few hardware platforms that commonly uses non-4K
>pages - for instance, currently, Loongson 3A5000/6000 devices (of the
>LoongArch architecture) commonly uses 16K kernel pages.
>
>Per my testing Intel Xe/Arc families of GPUs works on at least
>Loongson 3A6000 platforms so long as "Above 4G Decoding" and "Resizable
>BAR" were enabled in the EFI firmware settings. I tested this patch series
>on my Loongson XA61200 (3A6000) motherboard with an Intel Arc A750 GPU.
>
>Without this fix, the kernel will hang at a kernel BUG():
>
>[    7.425445] ------------[ cut here ]------------
>[    7.430032] kernel BUG at drivers/gpu/drm/drm_gem.c:181!
>[    7.435330] Oops - BUG[#1]:
>[    7.438099] CPU: 0 UID: 0 PID: 102 Comm: kworker/0:4 Tainted: G            E      6.13.3-aosc-main-00336-g60829239b300-dirty #3
>[    7.449511] Tainted: [E]=UNSIGNED_MODULE
>[    7.453402] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05756-prestab
>[    7.467144] Workqueue: events work_for_cpu_fn
>[    7.471472] pc 9000000001045fa4 ra ffff8000025331dc tp 90000001010c8000 sp 90000001010cb960
>[    7.479770] a0 900000012a3e8000 a1 900000010028c000 a2 000000000005d000 a3 0000000000000000
>[    7.488069] a4 0000000000000000 a5 0000000000000000 a6 0000000000000000 a7 0000000000000001
>[    7.496367] t0 0000000000001000 t1 9000000001045000 t2 0000000000000000 t3 0000000000000000
>[    7.504665] t4 0000000000000000 t5 0000000000000000 t6 0000000000000000 t7 0000000000000000
>[    7.504667] t8 0000000000000000 u0 90000000029ea7d8 s9 900000012a3e9360 s0 900000010028c000
>[    7.504668] s1 ffff800002744000 s2 0000000000000000 s3 0000000000000000 s4 0000000000000001
>[    7.504669] s5 900000012a3e8000 s6 0000000000000001 s7 0000000000022022 s8 0000000000000000
>[    7.537855]    ra: ffff8000025331dc ___xe_bo_create_locked+0x158/0x3b0 [xe]
>[    7.544893]   ERA: 9000000001045fa4 drm_gem_private_object_init+0xcc/0xd0
>[    7.551639]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
>[    7.557785]  PRMD: 00000004 (PPLV0 +PIE -PWE)
>[    7.562111]  EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
>[    7.566870]  ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
>[    7.571628] ESTAT: 000c0000 [BRK] (IS= ECode=12 EsubCode=0)
>[    7.577163]  PRID: 0014d000 (Loongson-64bit, Loongson-3A6000-HV)
>[    7.583128] Modules linked in: xe(E+) drm_gpuvm(E) drm_exec(E) drm_buddy(E) gpu_sched(E) drm_suballoc_helper(E) drm_display_helper(E) loongson(E) r8169(E) cec(E) rc_core(E) realtek(E) i2c_algo_bit(E) tpm_tis_spi(E) led_class(E) hid_generic(E) drm_ttm_helper(E) ttm(E) drm_client_lib(E) drm_kms_helper(E) sunrpc(E) la_ow_syscall(E) i2c_dev(E)
>[    7.613049] Process kworker/0:4 (pid: 102, threadinfo=00000000bc26ebd1, task=0000000055480707)
>[    7.621606] Stack : 0000000000000000 3030303a6963702b 000000000005d000 0000000000000000
>[    7.629563]         0000000000000001 0000000000000000 0000000000000000 8e1bfae42b2f7877
>[    7.637519]         000000000005d000 900000012a3e8000 900000012a3e9360 0000000000000000
>[    7.645475]         ffffffffffffffff 0000000000000000 0000000000022022 0000000000000000
>[    7.653431]         0000000000000001 ffff800002533660 0000000000022022 9000000000234470
>[    7.661386]         90000001010cba28 0000000000001000 0000000000000000 000000000005c300
>[    7.669342]         900000012a3e8000 0000000000000000 0000000000000001 900000012a3e8000
>[    7.677298]         ffffffffffffffff 0000000000022022 900000012a3e9498 ffff800002533a14
>[    7.685254]         0000000000022022 0000000000000000 900000000209c000 90000000010589e0
>[    7.693209]         90000001010cbab8 ffff8000027c78c0 fffffffffffff000 900000012a3e8000
>[    7.701165]         ...
>[    7.703588] Call Trace:
>[    7.703590] [<9000000001045fa4>] drm_gem_private_object_init+0xcc/0xd0
>[    7.712496] [<ffff8000025331d8>] ___xe_bo_create_locked+0x154/0x3b0 [xe]
>[    7.719268] [<ffff80000253365c>] __xe_bo_create_locked+0x228/0x304 [xe]
>[    7.725951] [<ffff800002533a10>] xe_bo_create_pin_map_at_aligned+0x70/0x1b0 [xe]
>[    7.733410] [<ffff800002533c7c>] xe_managed_bo_create_pin_map+0x34/0xcc [xe]
>[    7.740522] [<ffff800002533d58>] xe_managed_bo_create_from_data+0x44/0xb0 [xe]
>[    7.747807] [<ffff80000258d19c>] xe_uc_fw_init+0x3ec/0x904 [xe]
>[    7.753814] [<ffff80000254a478>] xe_guc_init+0x30/0x3dc [xe]
>[    7.759553] [<ffff80000258bc04>] xe_uc_init+0x20/0xf0 [xe]
>[    7.765121] [<ffff800002542abc>] xe_gt_init_hwconfig+0x5c/0xd0 [xe]
>[    7.771461] [<ffff800002537204>] xe_device_probe+0x240/0x588 [xe]
>[    7.777627] [<ffff800002575448>] xe_pci_probe+0x6c0/0xa6c [xe]
>[    7.783540] [<9000000000e9828c>] local_pci_probe+0x4c/0xb4
>[    7.788989] [<90000000002aa578>] work_for_cpu_fn+0x20/0x40
>[    7.794436] [<90000000002aeb50>] process_one_work+0x1a4/0x458
>[    7.800143] [<90000000002af5a0>] worker_thread+0x304/0x3fc
>[    7.805591] [<90000000002bacac>] kthread+0x114/0x138
>[    7.810520] [<9000000000241f64>] ret_from_kernel_thread+0x8/0xa4
>[    7.816489]
>[    7.817961] Code: 4c000020  29c3e2f9  53ff93ff <002a0001> 0015002c  03400000  02ff8063  29c04077  001500f7
>[    7.827651]
>[    7.829140] ---[ end trace 0000000000000000 ]---
>
>Revise all instances of `SZ_4K' with `PAGE_SIZE' and revise the call to
>`drm_gem_private_object_init()' in `*___xe_bo_create_locked()' (last call
>before BUG()) to use `size_t aligned_size' calculated from `PAGE_SIZE' to
>fix the above error.
>
>Cc: <stable@vger.kernel.org>
>Fixes: 4e03b584143e ("drm/xe/uapi: Reject bo creation of unaligned size")
>Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>Tested-by: Mingcong Bai <jeffbai@aosc.io>
>Tested-by: Haien Liang <27873200@qq.com>
>Tested-by: Shirong Liu <lsr1024@qq.com>
>Tested-by: Haofeng Wu <s2600cw2@126.com>
>Link: https://github.com/FanFansfan/loongson-linux/commit/22c55ab3931c32410a077b3ddb6dca3f28223360
>Co-developed-by: Shang Yatsen <429839446@qq.com>
>Signed-off-by: Shang Yatsen <429839446@qq.com>
>Signed-off-by: Mingcong Bai <jeffbai@aosc.io>
>---
> drivers/gpu/drm/xe/xe_bo.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index 3f5391d416d469c636d951dd6f0a2b3b5ae95dab..dd03c581441f352eff51d0eafe1298fca7d9653d 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -1441,9 +1441,9 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> 		flags |= XE_BO_FLAG_INTERNAL_64K;
> 		alignment = align >> PAGE_SHIFT;
> 	} else {
>-		aligned_size = ALIGN(size, SZ_4K);
>+		aligned_size = ALIGN(size, PAGE_SIZE);

in the very beginning of the driver we were set to use XE_PAGE_SIZE
for things like this. It seems thing went side ways though.

Thanks for fixing these. XE_PAGE_SIZE is always 4k, but I think we should
uxe XE_PAGE_SIZE for clarity.  For others in Cc...  any thoughts?

> 		flags &= ~XE_BO_FLAG_INTERNAL_64K;
>-		alignment = SZ_4K >> PAGE_SHIFT;
>+		alignment = PAGE_SIZE >> PAGE_SHIFT;
> 	}
>
> 	if (type == ttm_bo_type_device && aligned_size != size)
>@@ -1457,7 +1457,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>
> 	bo->ccs_cleared = false;
> 	bo->tile = tile;
>-	bo->size = size;
>+	bo->size = aligned_size;

the interface of this function is that the caller needs to pass the
correct size, it's not really expected the function will adjust it and
the check is there to gurantee to return the appropriate error. There
are other places that would need some additional fixes leading to this
function. Example:

xe_gem_create_ioctl()
{
	...
	if (XE_IOCTL_DBG(xe, args->size & ~PAGE_MASK))
		return -EINVAL;
	...
}
	

Lucas De Marchi

> 	bo->flags = flags;
> 	bo->cpu_caching = cpu_caching;
> 	bo->ttm.base.funcs = &xe_gem_object_funcs;
>@@ -1468,7 +1468,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> #endif
> 	INIT_LIST_HEAD(&bo->vram_userfault_link);
>
>-	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
>+	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, aligned_size);
>
> 	if (resv) {
> 		ctx.allow_res_evict = !(flags & XE_BO_FLAG_NO_RESV_EVICT);
>
>-- 
>2.48.1
>
>
