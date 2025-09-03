Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79322B42930
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 20:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8C010E90A;
	Wed,  3 Sep 2025 18:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bROyH9Zw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECAB10E90A;
 Wed,  3 Sep 2025 18:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756925923; x=1788461923;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=9iFoyw5WT0+boxhxVmAAPFEJfwA3o/aH5jk6o/xfJn0=;
 b=bROyH9ZwnrX+D5hHfc98HoqV94xlniCJ43Q8TsYDqW/7TF+rXi71UL9q
 dgUuEtF7QAEnabf25r94ieTnEOpkjkOtGatviw7qww8XCsZa7xb6NyfZf
 63rvKtwL8YuYzoU0cTikMNNQOEL+kRCsf2ruLykmjBxMOnfAQ0lcc0Q0i
 W2H/l5sE+9XnLCtAatmWr0BxLupNymVc1Faic9fIb7Zo1971wbwRt4CVn
 nNpgLhjJZB+uh9UQdig8hLow8KkBBUlPQHnXUdI3n+39Epf9NQruUYjAm
 zSCUwO5QCJ0GSuRHA5I9gqC1LgSpEgLbFB8WZUWlu0iI7cn4t7nLPIVUB w==;
X-CSE-ConnectionGUID: Gqn40QfjSUmQOArRLjNYfw==
X-CSE-MsgGUID: RS5qd6NPQhOs0KKk1z+e6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="69863919"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="69863919"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 11:58:43 -0700
X-CSE-ConnectionGUID: PY9H/fC7TfKps3Tyt0m5PQ==
X-CSE-MsgGUID: 8m1HW6USR1+Q7Ye5BFcDNw==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 11:58:42 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 11:58:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 3 Sep 2025 11:58:42 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.85)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 11:58:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1nzAmIhn3XVVQSNtWESVWv2cRaAgwO/qZFAsS1JMA21pPSeeI4MwBN8m+78XOrvB45aOMsb5NxQ4YKp52h2WW6r5ox1KmTLucYcgmbavMIGzU1jEaFj9U3ZtUlVxtjMST/NAXRfxoVjDQfY0ZV4NowK6Ks4yq6IWyIh6aeEcW5VQl8kwuHXmAvrUAQtEFc09oUVNoJDqH678HJMsdTduhUW1iZZnVUY00v/cL43WBwCl910hmnOdg+jWn8Bc8mbGCiQHRRJB2tz1GPm2UDsjyj8/Lhbs/EGCObrp5Ce8PkVUpQ+XrHoadZ5/NJUybN9XNN0MVrAzBwVWp262uTT8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lL34JJECEj2cft7HRPuFbHW/72pVsGGVCwW8+3Adgb8=;
 b=hOFvcVn+Kn/8LIF7GceT55HI0wUjSNoY1ZyGs84KMq+Nk/okfJ28faORRjsNWQqjhIWIQSUvEYXHeYDmuHO/uu6HBBKLuB5bCIWPS4vv+P5ZuJ2aLr5bKjZ7N9U5JJQ0BuJN94zfbad4QA5qfr63iv0Fb306hCWmiItSA7lW54XaosrS3bWgdpFgqZCXhJj2kYVsI/B5+knAGt/E2cSDpJZ+kW6t6WnUYeRK6TZR4a9lxjDD8mUhQhabSbKwc+q+CUuurgQRze4GpRHHfALwn2TS6cwukjU1jMYgwpL8Sa84Pp+YKn/0o57/C/tbuZOhd1FtgmEDTVQglBsDPQ/jrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB8719.namprd11.prod.outlook.com (2603:10b6:8:1a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 18:58:40 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9094.016; Wed, 3 Sep 2025
 18:58:40 +0000
Date: Wed, 3 Sep 2025 14:58:35 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-fixes
Message-ID: <aLiP26TiHkYxtBXL@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::32) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB8719:EE_
X-MS-Office365-Filtering-Correlation-Id: e9336b4d-19a1-4b21-63b5-08ddeb1be4d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?z3Q4TiJChsiULCh3kV3ej7c2X+8ePbX9oOavoOW6ZVTioMFFZT8f9fGQ2Y?=
 =?iso-8859-1?Q?9aKu7sICyqzTQN6HvWxZp2bHsX8GyGyfWuqmnXyBuD5Q4N+wxnjTsoMzko?=
 =?iso-8859-1?Q?lKUDMOh3PvwY04HALptvqKu23PgpXW1MwpSUzsXfmIx++jRXQWvzCYHf8w?=
 =?iso-8859-1?Q?cW3suA9sJ1xDFzoHlq3KVoW5XBFxi1f3ZaezM+0F4J45v+VDISiMbd38By?=
 =?iso-8859-1?Q?qYJGFmcIa4EcB+j7Mt++CUdi1aoBP0P1fejNvABmF5EYMUJMq8eNI1c72Y?=
 =?iso-8859-1?Q?ZjXuZDjF3+aHtkG0GCLyHNVc0Bgs4GAxFFFk+XrFyoRG10cilgL1T8YHZS?=
 =?iso-8859-1?Q?D1oex+tQMCZbsmBlJCIiQMQXHQVQPBSXQ5GeU8RgS9Pu4UgwNrbtEwlMXz?=
 =?iso-8859-1?Q?OoJQBG9+kP+YXDemHlVBYBPBlyPF6kkqD5nDvG4qheB/+RNGgy5iH5Q4zt?=
 =?iso-8859-1?Q?IVGjyTfhRv4rHaN3dV7gBHOiInye+Ot/0W4ySBwKZmBgGmRNyVWzwVBX/1?=
 =?iso-8859-1?Q?+9c6GFVduD8qD2hlW6ARmj0ZeROsTJdCsZP5Q66HincD7kAckb8kAg/gTV?=
 =?iso-8859-1?Q?arrCjgdIBoEGKX9mFCy/2hYexxfdNg1OW2jX1H9IzD0YjUHi1/ZZZ7biil?=
 =?iso-8859-1?Q?8YWxMfBbrmoYpU2EvY5JZEMomjdu1YnY7uLFMSaIRg/FdilsqDF32bnoau?=
 =?iso-8859-1?Q?VW77RqjYiIwobdyzXPP1sEOMJuir8y1pLzetkEuV6pdNNKAdoUFAxD2aFh?=
 =?iso-8859-1?Q?BgwR1NDYOCz3e3cbOQr2WBKq7IXFBTY0XyYfafkzZQYbPvZajHpSW3BRUa?=
 =?iso-8859-1?Q?sGzw4psAlVFlHFrj3IMuEyTvLKMRAN6S9NNGXpW7e9pPFVKGeVYqlXX5CK?=
 =?iso-8859-1?Q?R4ly2nolb2FcX2RZ1k0NE0d5JKrWC09AgIz/EV9ZR3O9Mu3BvaZXV/NzOS?=
 =?iso-8859-1?Q?aEq3ze+W+f3XO3ltCYPzZFXG8wVhP97HyGK3r8QdQ1rNiEACE8pCBz+qGC?=
 =?iso-8859-1?Q?RKKD03gY9so+rk3f2o67mzjMc84oin/PLmAKC5FiglBBOv4HmChUjDgQTu?=
 =?iso-8859-1?Q?aHlxDXf/i7gvJaG1TlH8jXp4pLFzKsJcO2zkGq/aHlXRJIFDFRihnor/HM?=
 =?iso-8859-1?Q?2JyFpLezJxGSRM22BlZWHBc1n5YaG7no3YfBKbb/6BrKQUjhmY/Jl04IKK?=
 =?iso-8859-1?Q?8Bbo+NcVkq+also0Q1sJXdNZg40rzPCdwofCiad7oXb+PFHZd2Szi4m5Y2?=
 =?iso-8859-1?Q?qJPTS9P4Usx3SOixtQ1J70SmttG9yX8eE5vDQlOOg6xbZUE4uAIF/XGa4O?=
 =?iso-8859-1?Q?mgtIa7l6b/a2yUpNpzTMuIPQHgBg0V81o2FZbUDyeI+2zWMsncnzdt8SIW?=
 =?iso-8859-1?Q?bqDrGrR3YYWXHmJkuXgqzh5T9r0p+iMJjq3j5ehzTv5zWB+EUWBXQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?BHLhF7N2wqJqQ0bD8FNhCeKCNBfUJZlNNEyuTcrqxrjcpQQfztLhQLawOI?=
 =?iso-8859-1?Q?xqxV0Z7n+aUg5ygTAwgLZJHv/yE71GY/yADAXTVRXnWXBEc2GTX4qEzf+B?=
 =?iso-8859-1?Q?v808nQCwWBriesJqxu26mKzwZKNKCC4aZMbe87HQOG6NhME5r6c0d3EAOy?=
 =?iso-8859-1?Q?udcDrqTbJGRLqIktq4uPWXCinovQzV4paekoJLChIbQChoSvb7sODywFfY?=
 =?iso-8859-1?Q?UkEF0Hw059ANbXWB85M2wxM95ufW9jT56UF0j38l/eJWgAeEUdF3kkJj/5?=
 =?iso-8859-1?Q?qvT5CaAXsuHW8dcxvd2w3oz5PdbKQe8fCpAak5hGZwF32AucvBHNKIreAw?=
 =?iso-8859-1?Q?b5wTgg1e16CVpLY+S7iOOXcGhqQUukbI3x7jzOuLXWlskt4z6XRCZ7fflu?=
 =?iso-8859-1?Q?XOGOXURGTlGZ4rNTrkIDmZIZYX5TrxjOR81TDWJndL/+12ujJZpiCLq5fv?=
 =?iso-8859-1?Q?/j3DbyU0rG/ooCAbAZ4XkCsiPjS6Ppa78NtLu5KfPBOGVD8+qBVVo6ehtc?=
 =?iso-8859-1?Q?PY4ZYXDIMvGxVUx4PEgSPt3kYR/n/o/saYzwVchREAXOIaciNisgikwVNh?=
 =?iso-8859-1?Q?Xx+9/hibZi6BmPIicvlHOUHqUQqgMurq2xIJJDcrp0B38o9G7eZ33Rfvoc?=
 =?iso-8859-1?Q?HN12lD9Dj2WPBURKpix7yNc+U91RhKH9TIz+notTagh2Rh8RkrZF5TVMGO?=
 =?iso-8859-1?Q?mmDZDmkFcR1EQAMCYvXeu7P3hNmB7andqw56Fo4jt06QTuVcLdYkm9czqn?=
 =?iso-8859-1?Q?RWKJUK+K3gItA0TRBn8Ve4lmerWCHzIUoG24ESK+f9KKp41OWNrluvETvE?=
 =?iso-8859-1?Q?ehEj0DSdibKUrMATGsmY28ZoOUT/lKRiuCCNXLbbGb4ZdVyGZrzN03N2ZB?=
 =?iso-8859-1?Q?Yhfi8sVvEwfwItqFyYXx5RzAlDT0e+SiZYi0gL6iuWWl/ddxUGGNzYOBJs?=
 =?iso-8859-1?Q?CC0/8zekv/eN8bS/BR02fUZbF2HUX5DnqGdpvp+l48nFWIb5hqwwOxl6xr?=
 =?iso-8859-1?Q?5JzpgYOY+9S+qW0RfB2Z+Sb+bB5bJZFZlALViI39iAR/zHac/cPglluTHn?=
 =?iso-8859-1?Q?S6LHVKlx3sPBVOkfi7Gm02hw7VGwDUv9+h5qu+FkNX0Sa72O9clMbGBCKW?=
 =?iso-8859-1?Q?b1vYCbjLKn8/NQPtRUUqtuSmtS1HsDcR2u6om0PZ4SXaR5kILt9PVVu7Vm?=
 =?iso-8859-1?Q?EVsdnyJ4SJtYlbPiFLFmL18fl1bVqvUl5hpkagbGkDBNAGwGT9/DDtv2dO?=
 =?iso-8859-1?Q?ZkJpgcNLSAe6PKtHwlJDub1pd+4Sxsf+ue6uDDSCE0ujuIyIXtw9D19cEJ?=
 =?iso-8859-1?Q?QEBfq3IFDikN5IDldZjr1bW3LfJB/5lJVGqS6xxDZIClDg/DrvYRBwErp4?=
 =?iso-8859-1?Q?0l/EPtp/x8bxWm9lK4zthtDtaCGJBHdCBLgBDOtjyPZrItjEEv0xRlm1yc?=
 =?iso-8859-1?Q?98RAlpUiWn1dRoImjmYx6L1+WOwbx5qb6/RxS5QRr7pGF04A//bhQKJFxC?=
 =?iso-8859-1?Q?+B/QnDV8PwkPj1J4rG8lFslB1/GwRByhZ7CXZVBLh/4dB1YaSyoVR12u6x?=
 =?iso-8859-1?Q?UdBTqqVMR2I/rpLeBUJFEdQmL8yrumEVAd7RsZ30bT6V9YKzPDwdS5Al48?=
 =?iso-8859-1?Q?dTw9EESbQCgAlrOQoLjDojpgjnCfiITpby?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9336b4d-19a1-4b21-63b5-08ddeb1be4d5
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 18:58:39.5201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t8hlyWl3bgzc7nRGV/F+7wZaV9Oux2gFJz51jDiXGLkfwmDHzQEmX2HJ12Kx9im26R7CMCF4b1CQmriK56F3zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8719
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

Hi Dave and Sima,

Here goes our drm-xe-fixes targeting -rc5,
with only one fix.

Thanks,
Rodrigo.

drm-xe-fixes-2025-09-03:
- Fix incorrect migration of backed-up object to VRAM (Thomas)
The following changes since commit b320789d6883cc00ac78ce83bccbfe7ed58afcf0:

  Linux 6.17-rc4 (2025-08-31 15:33:07 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-09-03

for you to fetch changes up to 379b3c983fc0257c183052278832ac68e3ccd33b:

  drm/xe: Fix incorrect migration of backed-up object to VRAM (2025-09-02 09:00:47 -0400)

----------------------------------------------------------------
- Fix incorrect migration of backed-up object to VRAM (Thomas)

----------------------------------------------------------------
Thomas Hellström (1):
      drm/xe: Fix incorrect migration of backed-up object to VRAM

 drivers/gpu/drm/xe/xe_bo.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
