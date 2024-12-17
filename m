Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A13A89F5687
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 19:52:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35EBD10E900;
	Tue, 17 Dec 2024 18:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UVma+gZw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B415B10E663;
 Tue, 17 Dec 2024 18:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734461541; x=1765997541;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qSkgoYMDwxz3GbvU6Mja0+G+REik+Xlw40ipKMHNSJE=;
 b=UVma+gZw4l7Xq3kCFtcWnPtQ3/SrsySsdAhw6H/bcnNeZ8pz9uNtgQds
 2upuXEuOxFHciNxzDNiJZ5YPUWaCqPQV20s66dzPIqXd5dzHgCyNOsuGM
 ESXYIIyTl8HZTgQBK1YFjXw+WtZh0fmH1iFPuS4BhBdkPAQaCp9z2lKW3
 xt+VPW3MVp0pFBi+/lZRo78UAJ7S9RHkWs6zyNJl2M+/DlUxqgcoe++CI
 tvAHQ2KkpZRxztit6DVl85l5i2iKTA4DFwzcHrVPKqaBJnVLcVv75aEga
 3LCHgbPQ0U59l3/TDSQANFD+HOayomSWKxSTnJ+WtmIn6WZG2TCc4nk7/ w==;
X-CSE-ConnectionGUID: syAHtNVrRYyVHUg7aupTwA==
X-CSE-MsgGUID: AKrWLsfoQTC75tX0h2W3rQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="57382004"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="57382004"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 10:52:20 -0800
X-CSE-ConnectionGUID: fGcKIIS9TOyCWa60yBRHkA==
X-CSE-MsgGUID: EgSLQspwS6y8q78d2swSAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101753917"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 10:52:20 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 10:52:19 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 10:52:19 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 10:52:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJyAfhoY9ApuOExhae1hy5Nym/2NTgPWKXrGozFyI0aLIM4StCcaOPOoBuOhsPcKSsbqyrlUdjQG5sFrfcSGLInG6ajObvHa33sI5g08GqapGwx4mobs0ClJA1xTDGwl5ASN/os+vpWzlK4p3fsGuUg0o+BXJijreCqm+F5bh5pBuwKV18clIuraPOya4CKslxL+xbvyXdGQY7PRe/28qaMzhkotqPQJA6YkDXu5bstarMY+NPikOCk5ERtPCyWAeMmJO6v1QhoT8HFqXlIm0JsybIEa3ORKG5ZBUqL+sYM9glTYzEjN3M5T7NpRBcJUFA//9N0Ll5JXU7SFhkS55w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4g6IKaU7ao4q6tW7I+hlVd6IexVqNtN10VpEN3XkUuk=;
 b=r0e0yWyPrFEsXwi5Q0a2E04N4HjD9rzz0hKWxBe+LxpYCH+2axHe0/TS2NTTRf5f+VpdGrjAwgHcyMxeJ/Dq+ynBTeHmwEnY5po2GECVW1QIIi/N3xdEQRUHMsm7PM4w/0oTZS4jlT8GSZzDh2KnHlZeqHyxWrVE4gya4VUi+4ujyefnhXG3GG+Fr+e+7fUIDvfPy+z9k9+mSSPHhU75Vu02U0B46F3xVg8Ae0JbiloBuILHJp4yC1NQV3cWRTXV5pvuKA3ZYDgubmRilC2/dZAWM2SEE6k3MXDMqB1BpJJ8h3GfNG54koOtLJ7FOj4MRvBFpw9naWnaY5GZ6blyCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by PH0PR11MB4871.namprd11.prod.outlook.com (2603:10b6:510:30::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 18:52:17 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 18:52:17 +0000
Date: Tue, 17 Dec 2024 13:52:11 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Arnd Bergmann <arnd@kernel.org>, <michael.j.ruhl@intel.com>,
 <lucas.demarchi@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "David E. Box"
 <david.e.box@linux.intel.com>, Ilpo =?iso-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Michael J. Ruhl"
 <michael.j.ruhl@intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, "Jani
 Nikula" <jani.nikula@intel.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Tejas Upadhyay <tejas.upadhyay@intel.com>, Hans de
 Goede <hdegoede@redhat.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/xe/vsec: enforce CONFIG_INTEL_VSEC dependency
Message-ID: <Z2HIW4c-S_IA9bWb@intel.com>
References: <20241217071852.2261858-1-arnd@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241217071852.2261858-1-arnd@kernel.org>
X-ClientProxiedBy: MW4PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:303:8f::11) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|PH0PR11MB4871:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a4488ba-0bc5-416b-ebfa-08dd1ecbed72
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?016Dz+meUTsJ8n2g1pE/Vmcye8BTRbHwv9FEFq+/VC37J06564Jj94GBc1xg?=
 =?us-ascii?Q?TOiZXwmUyoc1Ck1KYLBzSHJipL3PXgHnud6KyQvJepBFjoTkcjkmbgErQnnK?=
 =?us-ascii?Q?zg7zKl3UkPPyfdB+tVHBy7RhNoPu8Ly36ZabfZPDy0yI+JWY99/R+TkwMrMw?=
 =?us-ascii?Q?pkT5vgqXvMk/Olh7kIxxDSa+jZMmea9KTyUqMhbA0GWvsb67mx9HFJEO6oos?=
 =?us-ascii?Q?8a7AOBHtDewHJZJxgqzFRzPDZAx0gnI0r+7pkcef4GTbOxxZDluQXWKXuiGo?=
 =?us-ascii?Q?JA32fLSMcwN8VRBS+nILdeOAuKw941vPudz0nuaIkFnZM8k4W95Tlseb1v/0?=
 =?us-ascii?Q?KcTzpxfEmsN5ms53Swh0aFmptS6VTBfFi/fWYRL6IIEtckRaNcKexJXFfwiY?=
 =?us-ascii?Q?EFKpgJNKgdpkhYPc2Zgh4d1awkE1+dm4g2qJmWvx2q/JgdeiCQDxOVkkfRVC?=
 =?us-ascii?Q?Vn9r9CPGZMO0COU6PBYE1woXMIyFaBKnfgpAWfeKhqfGjo+1YHrwGxBhO0EA?=
 =?us-ascii?Q?XmS+U6R11jTYKkhYRShqjEsc8d2OK9BceWC1QaTLSrm1FqTjOaxrknpLzSol?=
 =?us-ascii?Q?j6z2Ui7jsGsSZLxmvQkl4fOqk5aAKCuEWpHbrchV/Arum1B+XgG74g2u3KCG?=
 =?us-ascii?Q?Z3+wcgDhbxJBAOWjL5hpbVkLA3dafTm1YKbl/HM7ySP/TXBDdkzLCTyiteE3?=
 =?us-ascii?Q?nsi03TSkxS28KaHlbmE0bq5hxaLCih3OCxyZQYV24ToKoeovEMb7yvdtzkTI?=
 =?us-ascii?Q?Mp8YPr2vLc6pqrnXr57Tnkl15Rw1teLCYJfusZF+Xcn9ZlZ3tC0j0yCjpgxv?=
 =?us-ascii?Q?C8sCrhabsRd+4fJNsvI32dBag8vxrR4yu04V/0An5BqXg+G+ad9GiG9L7evo?=
 =?us-ascii?Q?804uVQCiDgkMvcow9vftcWIo9SmrHv5PAgm1jWAWNY/JxsmtGu3yIVX2EiiN?=
 =?us-ascii?Q?R/PCPmGWBQpmofgb0gCkLWTQDphdEVoAkN1W6KG8stLRJM5zSd7SALePtm15?=
 =?us-ascii?Q?atSpqi+0sKkRmwRaP0V7Xo+283aUfUSu6ErGPiDqcJK7R2fd2ORJ6FbWaY+9?=
 =?us-ascii?Q?jf67/UuJ62INenfs6fm7GPKe7tpP4clzQ/NN5JQSs6AtXDgssl/kkP5TV3G5?=
 =?us-ascii?Q?HxyJ1gp06pHN1etOAV4YsvmIGuNqDoRSJWhsNizJO2sjd84/xuLbNsV7SlDx?=
 =?us-ascii?Q?/f+6PBvOd50i6OwazglEI1j+lY2+YI9Y6SqWmjWBrEratnyvZBvd+AHIoHoU?=
 =?us-ascii?Q?BDvjKZNjIbWpYGdFVfRDpVG7mVpBtF/TmZ297ITUUbSd5xXpczJyzM8LyhGy?=
 =?us-ascii?Q?Q+Z9fqxajHg/ho1fEE/oDIBV5uTZly1JhBTdIqgT32XXlyo0JfZdHMzNL3iw?=
 =?us-ascii?Q?QvmmtDfgfTFVAwe8Un/j5Km7JT4n?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wB7kaWklryPLKvAVU8e3nTXYmGdVKeG22WKJ+xXjFrAq0v/JB3uZeNeLcO9a?=
 =?us-ascii?Q?SjTm2VXaHtEZxNScTHZnRY/xsKjKD0ToGuMij97A7qj5vaY2Stoa4HUKu1yj?=
 =?us-ascii?Q?hscTIuhykfVjwdMBMBA3wRnORVyqnO1eUNL38XSHDsSZvbhBlY+dakrdH984?=
 =?us-ascii?Q?K/x6J5M+hihKnuCdq1JdzicHupkhzwdxCDNuZKIrhp1JxuPWw1kRw32ZVzb9?=
 =?us-ascii?Q?PAOp2iFlnnGmuduVUcnJ6TbrtiSu6O1ufIcy4RAwFXpea+vb+cF+j70Ov93p?=
 =?us-ascii?Q?Z0SvbJRSC9r9MS2OkW2xKwTlTTh/UL8hPd1St7HZQlGgyGNUGe4PxX7yihYg?=
 =?us-ascii?Q?dwfK/xE6L0EI6+8W17M2DHXF0owDdTwYJWaalJxzHlabaZ7uvModDdskrpbv?=
 =?us-ascii?Q?q2kXYVzgLLlpRxa1k8+5oki0IXKRBz/BNf0Va+E2lIqui1Gvoqy6IP/GnmG3?=
 =?us-ascii?Q?0/SnW2QDPvDvHiWJ0IoiJRMN3EottVqTrZkM7UfiyIN4ehO062PFMNpGJJnc?=
 =?us-ascii?Q?toY8AFOA5+JUAUT8H615ZiSoyO8zQ2vcQ6BHIhWcVhXgApTgv3RWxsPEsa8u?=
 =?us-ascii?Q?yePIFpbiKlA41cuV2VREzrq+fCsuPx86g6/UNqNknAiGb0kW+h7dtWYsq5Lj?=
 =?us-ascii?Q?IGKrkF7QKDbaVwtDnqCHfJ5hkPkqSyXM0HZpJjVVp1LHI1/jrzRR5CzlqHul?=
 =?us-ascii?Q?Inu8dMthv/yF/HyCGuX7AWEXrF1Eta+OM2dmi6PkO/BOL9usd9FJfbuUsPEG?=
 =?us-ascii?Q?l1J+0T25gDORrB9f7Rus+7bgET2S9Cs+V2srrQdZH840pLwasC1g4c3ib0r7?=
 =?us-ascii?Q?1qSbzC1tCAD0VBfQxynrox3D8A3jwApBP6CoIL/4Z/9EWV0q13o7YSfwriC6?=
 =?us-ascii?Q?pMBL5GCO8vbtaspOyBD+DImWyNBQWbl5p5aVorDToDurWtu5LnKgdwazEVxI?=
 =?us-ascii?Q?DLL+rqEdYI4kJKbHFIarMRiovfllAN7J463oAwdTBLuobo6SqJQfC5iTznlj?=
 =?us-ascii?Q?7N1sg57DhEnU748dVJ9fFLGQ8l15mwH5+gHEMtUBUs6IQNrcLRA9ubVTNTMQ?=
 =?us-ascii?Q?JXpR7/nvyJ58ZGzfXOegRUF83dNrj2MTWjAk1e/1XxLk6bKzjV0HRPj7wg4U?=
 =?us-ascii?Q?JhRQPGZCY+LLoqHFP8UO3XCG8rNFGseaKmwXaX9odBnmjdU9PQy0PQtbeqeg?=
 =?us-ascii?Q?M+e5ghurnLEuhOzLsp+eKl9UCKoZ0a73DW3Kx4Km1Dj6XpqQlG18o+1l3IB5?=
 =?us-ascii?Q?ZJnbJRB2Rx1EJiGQMgX5HUQFEzCg23fvq++5QQ8TJZbO8VD2y6m8C3QQ+p0V?=
 =?us-ascii?Q?aWfFWEYQWfkxVQn3teQLIsiqp/oFRkH2Msi2A6bxkBz7NE8GY1kG+/BHsTf8?=
 =?us-ascii?Q?2bsd+8CkwqwCOtJonxSC7VStJPfwrlXJ/vbIyCzHTqqQZghtVZ47OtVx+taN?=
 =?us-ascii?Q?acZ9vEO0Y6zwR6gL06gruBSTFOrju/Gn0iCaBt3vwN7Kj/AV5eA1jA9hzNqr?=
 =?us-ascii?Q?Y+ulGoWWEkTRQif+o3h9a2zdYgTXDNa1satMB/UL2qqkLufBzn6+F9aN1ZUM?=
 =?us-ascii?Q?e6y9Af4aQD+6F5IYo1BtxHgHXh/o8R88APb/ViyDidiWNaWte6kPILnTb8Jl?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a4488ba-0bc5-416b-ebfa-08dd1ecbed72
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 18:52:16.9400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GzTTgf/frq9sqmd/I2MbwLOWuDblYZPTGRPVcdl9gU73nr/Ixte+D6DwH6iMTa1btCi17mrB5eSJw/7r0vmOYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4871
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

On Tue, Dec 17, 2024 at 08:18:44AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When INTEL_VSEC is in a loadable module, XE cannot be built-in any more:
> 
> x86_64-linux-ld: vmlinux.o: in function `xe_vsec_init':
> (.text+0x19861bf): undefined reference to `intel_vsec_register'
> 
> This could be enforced using a 'depends on INTEL_VSEC || !INTEL_VSEC'
> style dependency to allow building with VSEC completely disabled.
> My impression here is that this was not actually intended, and that
> continuing to support that combination would lead to more build bugs.
> 
> Instead, make it a hard dependency as all other INTEL_VSEC users are,
> and remove the inline stub alternative. This leads to a dependency
> on CONFIG_X86_PLATFORM_DEVICES, so the 'select' has to be removed
> to avoid a circular dependency.
> 

I really don't want us to hard lock this X86 dependency here.
What if we add a new DRM_XE_DGFX_PMT_SUPPORT and that
depends on INTEL_VSEC ?

and our if statement changes to
if (IS_ENABLED(DRM_XE_DGFX_PMT_SUPPORT)

We could even leave this enabled by default, but at least
it is an easy path to someone willing to run experiments
without depending on X86 I believe...

Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>

> Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/xe/Kconfig | 2 +-
>  include/linux/intel_vsec.h | 7 -------
>  2 files changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 6c5b665d9384..217b51468497 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -2,6 +2,7 @@
>  config DRM_XE
>  	tristate "Intel Xe Graphics"
>  	depends on DRM && PCI && MMU && (m || (y && KUNIT=y))
> +	depends on INTEL_VSEC
>  	select INTERVAL_TREE
>  	# we need shmfs for the swappable backing store, and in particular
>  	# the shmem_readpage() which depends upon tmpfs
> @@ -28,7 +29,6 @@ config DRM_XE
>  	select INPUT if ACPI
>  	select ACPI_VIDEO if X86 && ACPI
>  	select ACPI_BUTTON if ACPI
> -	select X86_PLATFORM_DEVICES if X86 && ACPI
>  	select ACPI_WMI if X86 && ACPI
>  	select SYNC_FILE
>  	select IOSF_MBI
> diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> index b94beab64610..f2d55e686476 100644
> --- a/include/linux/intel_vsec.h
> +++ b/include/linux/intel_vsec.h
> @@ -138,13 +138,6 @@ static inline struct intel_vsec_device *auxdev_to_ivdev(struct auxiliary_device
>  	return container_of(auxdev, struct intel_vsec_device, auxdev);
>  }
>  
> -#if IS_ENABLED(CONFIG_INTEL_VSEC)
>  void intel_vsec_register(struct pci_dev *pdev,
>  			 struct intel_vsec_platform_info *info);
> -#else
> -static inline void intel_vsec_register(struct pci_dev *pdev,
> -				       struct intel_vsec_platform_info *info)
> -{
> -}
> -#endif
>  #endif
> -- 
> 2.39.5
> 
