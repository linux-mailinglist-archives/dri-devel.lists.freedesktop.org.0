Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27192C1D9A5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 23:41:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6192810E866;
	Wed, 29 Oct 2025 22:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZdG64vFn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABBDC10E866;
 Wed, 29 Oct 2025 22:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761777682; x=1793313682;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ITUOcBdACbHIvAUkKc2dQN455DWiWkOfhMPLiwj22ec=;
 b=ZdG64vFnBqKJiBu8SeFRPZl3mllMTq+dfPGcvbi5NWs6VGn4FbYYUA9K
 W0WrQzQYd62g1VHvFsBVvGpSMUMAMf85Un2ywqNws6Mggb8vwrUXSMCQI
 TKffCZGd5l3KISm+LTDSK9dFFCtx8nh1nyUDGNavbtih6QrRJFevcMUs3
 P3S3h++HQWsHnz7aVEMWTX3x8s8bMeCCwUJ0rgY5NM696YBWKY/hWnbEu
 52UDRVdV5FVYjV0e2F5bCnfOIuFm1VKLF85HGWQbNHRRi1SpTYPIpZklX
 XPDQ/OR3I/bp6ldF1W0qVqYYljF3aOijetQqYMDx17z7Bj/8lyRhEWNbs Q==;
X-CSE-ConnectionGUID: a5mjkC+HTQueRv1Fg+6FUg==
X-CSE-MsgGUID: RlWwgsKpS6SKoHccdXrmhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="66528271"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; d="scan'208";a="66528271"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 15:41:22 -0700
X-CSE-ConnectionGUID: EjoTCLAMRD2Z6ZkEs8PeBg==
X-CSE-MsgGUID: gmDbOikYQjKYn4sX9RS1Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; d="scan'208";a="190956922"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 15:41:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 15:41:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 15:41:21 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.33)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 15:41:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CsRx8gPkN1Ltm67QRtoPkYJh8RFHJTbd5LoRlXYBzL9rcs0KDamUir2JFquaHCnwfc0kZyYY1EjOEIPIizA4fk/z92CnWhICg5BJxeVLHhJqb5nHade61JAo64hjnYNaH29LdXsQBXRgAXLxXLaogylmLxkgFZzapMPUYDJgl4PdUa8DATI5jkKNLYWxva7hzEDzP4z4AbgGQ7r2J4rTh698adEhufg5xjn42NDF5I9ZX78BqKmHQe6m+l//vF+wvVGIhOrI0nHDK7w5hNkpxQ7Zv8geF2x6dtbc13dwHUic9lh7R+Y7wOxKNf07WR+91xcPC+gktS6h65FcD5EcPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQFkTa/viyQ6BIGhEwMjSIDPvi1aCnB6trI8DMdqA0Q=;
 b=w8M7Xkjn6vFNdqfWMgBDfsnik5oafkrR8ukAGrsjXc5vZqeOi5GZzem9WL5ZqGw5AcLzFZbevkk0bCkWTZlw8MbplrAQhu+iVPmIrkYImEo39raPuRHUkiVQcd8/m48OwH7920BxCaANzcsWx9RWpU1DmCx4VtyRLEPGNd5BDAceicWMzjbobrd+ZbAPycM5utJu/w76d9K6OKyFfV28k80uwSKORF++uSX+4Z4z//bodyLO4upFn4yTwxtRSl2z5CKeNe43aYudOm2g2+R/RFsm4iEFzi8JOTbNx8oWJXvQK0hcQ2OEPggmMGk6OdEmTrEIX+RFz3kKMHOv8IZ39Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 22:41:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Wed, 29 Oct 2025
 22:41:13 +0000
Date: Wed, 29 Oct 2025 15:41:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 04/15] drm/pagemap: Add a drm_pagemap cache and shrinker
Message-ID: <aQKYBvXKsj52rHb/@lstrano-desk.jf.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
 <20251025120412.12262-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251025120412.12262-5-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0061.namprd05.prod.outlook.com
 (2603:10b6:a03:332::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6312:EE_
X-MS-Office365-Filtering-Correlation-Id: 16cf3ad6-14bb-440a-aada-08de173c4356
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?FNdzD2WCYbOHWCfeOWDGseFal8rnq3F8E0nB0wStwVXdtDOcMjhROYAY8E?=
 =?iso-8859-1?Q?JKyg6DmWM47MsnTeMNGJGo6K0eIg67313QAdQhkakdUP+aJuy6TnezH2TB?=
 =?iso-8859-1?Q?nNWM8hdGziP8rLafe7hvAUxSnwg79jBCfv+/GN9pXoDgkHnBBFqu/kxl1q?=
 =?iso-8859-1?Q?duEtVeWPN/5Rxbl6gm3Yp+Y/oVCYHU7Joy30yLEBdcEF3McwpzoINEYT9K?=
 =?iso-8859-1?Q?aEt8ky8ep35d4muU4T92j6nAwS/6m0m2FaFIpj54KZWbY6SuEBiIe8VC48?=
 =?iso-8859-1?Q?ageB8oOtlPDW2xvnFp9EwCM+YT3z9RJyyVnC/lRCKxkIiULiLxU0Upo1ql?=
 =?iso-8859-1?Q?g6m5u51a8Tkffd1szX4YS6xFXsIiZ8q2YSRI5gXm2iopbr8TS6QKdntKm6?=
 =?iso-8859-1?Q?mLM1VPtirtosZH0oD9vSgSNAFszG8srLG156ON3xzpuIJjEYH9wLuI8lAq?=
 =?iso-8859-1?Q?D1xtFz90ySoqr4Au3D2UyW09lax379/hqVuyXXalKTXiCMHSd28tFfuqlr?=
 =?iso-8859-1?Q?KbAMBBDZzD+WZOSLKVxZ5sC6sjb0Oxe2be5tlGdhiKWhAOrdAsEVIqlDsF?=
 =?iso-8859-1?Q?qQCp131LVo57or/UHX/slPw92rSguHYOrPwaJyPLbDkk6hCovAv8qUwdRO?=
 =?iso-8859-1?Q?3tJvmsy//39jWzS4HzrGrXQviVdAlZ/y52L4PpUQo5Q2d+mJuRs+UNe79U?=
 =?iso-8859-1?Q?lT1YQU9woerJr29b9H9pe6XN5BU7v/yl7ohUbTWKyLVS+vwcf00l5q3h0R?=
 =?iso-8859-1?Q?GYOtiy70LY6meDADYSe8SlTTPxyb6TpR6y37Rm2XoKkWfgj8/Ga2YNtLML?=
 =?iso-8859-1?Q?qIaC1ZDVCtLbOADK9iVE+pARzMmU0vr91ztMKsM78Ljew2BDRuftnjFxeB?=
 =?iso-8859-1?Q?NvNYmJXpTSGalbYNVJa16kLYbQHCiiwb05uwJHR9tFNt/RJnRca4KlRs5J?=
 =?iso-8859-1?Q?F5rjweuMG1rtgFYOw0ra1ypbuBi44EmRdZfU67UKtmpZffDqJfCXQ+ax1a?=
 =?iso-8859-1?Q?6/+/gTlAC/IHTO/yPtRolKx5cH7HIX1ujLmWpC5nDHJanTble69Lb1IjlF?=
 =?iso-8859-1?Q?lCdwitPwT7p9zdzRlzk5qZCHd9d6zK6JbgTS0nV7oCNAsdA9JVWZYCyodr?=
 =?iso-8859-1?Q?sSnarjRi8bWlnnZmUb2pNbPJiDV/IBwb8IiDhAmHuV6P4dRLmy3oLE5Pmv?=
 =?iso-8859-1?Q?L5kt0a+eFsEXSQKlo1rq34m93sdeVeSNbwc3mrNdGIgKhlZx15BgwL685/?=
 =?iso-8859-1?Q?xL1GH4HTLf1zSsbWCmjJ3Ay/FSJW+8wdAZxd44XHoc01RHovrX1Kvy4yF2?=
 =?iso-8859-1?Q?B1mumPSqJj/EqGdzkDfUdviCmXk8YJz0hbyNXpogio28SAA1r9KO9gssXT?=
 =?iso-8859-1?Q?nr1s2QuZtT4liyIn6LybcGv/9TIxUdlkAGDNiSDWZMQrp6mWbKtZ1tnqyk?=
 =?iso-8859-1?Q?2mF4J+9Yhag3zOEnsXP9Bo3As20xUD9zGxJ+4daSRgaRE7OI2yAenlk4/n?=
 =?iso-8859-1?Q?jnE6O7xMu78gtzS+ZGma9q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?BAJhlSK43oiecdevQ3YlpMgCOpgkDvGGbdSsDhrlROmPMGApHjNxiygfMY?=
 =?iso-8859-1?Q?znPrK+GM7S2d0/5R+gRTbpYdcvnjhmHtv3tjCphl8FDsUxG1XZ4x2/G2tG?=
 =?iso-8859-1?Q?vO8HmXyiUHBRN6wOOtssriG5L8VNqk4GTtvMdNuD+YvqlP1EKaaDgfyYu2?=
 =?iso-8859-1?Q?ZsdEFX1DZLLhMhwcPJMUiESwlB39mL7O0YzUgVlgywR2W4n7lBjhGNuhzr?=
 =?iso-8859-1?Q?idpHXlCN9s8XCpyascauo99qFo2a93EnopMpwX+VyNwgI+kMIqgdAW6tB/?=
 =?iso-8859-1?Q?+vA+sCjcNxw2Ht/UgaU+TdFV8QTkFRedJNSXS88tbZ3EJEtNarVPa5+jdX?=
 =?iso-8859-1?Q?WpUjTMWQYJO7axD+0seWIXdv/xrdH6tOGjAF1PwD8VAOgI4ivnfEE3TQ52?=
 =?iso-8859-1?Q?+odOKO2aK+70KTPdS76GXNNaHYkQz4vSqX5kDAqWWhJEi2Yiw1ONL+AmWY?=
 =?iso-8859-1?Q?sGmzqqAG9D7Elb6SK2bgat4OEw4ydeljGoUuIFwBws5v9kX2kD73FEau/s?=
 =?iso-8859-1?Q?G0uwq8hpcKptkkxLD/nthn0cEfVzFnVcf/87Gf91HgzTgxY0zuRznboQ8n?=
 =?iso-8859-1?Q?Bx+16TVAaTjxGhAw7W7IpRWWXpvBc/QuznD4N+6+V49GwFq9UK+euY+5DO?=
 =?iso-8859-1?Q?zH+Ey4K9Vag1Kt4u95LvckyxJWZQhPCS9ZP7UiThmkRDRCqKd9X0WrwA0O?=
 =?iso-8859-1?Q?6PBI+me3mAV95FqsAMvzxkakXcaXfOYah72WQKhl09HBVQvTiTXA1QYGsW?=
 =?iso-8859-1?Q?kJrDQoxXmhwbq/WL7aHG+b3cWixTRBDR9fAlqwvbW6NGE3CBGDSmWGlavX?=
 =?iso-8859-1?Q?n4iolhzSn5ghkRVfywLFzPjnPB62uDakip+i4cq+fQUD10rImKyTmgljY9?=
 =?iso-8859-1?Q?qEPTM+YdmmPszL9+k58Tc3RuPN1wrrkOvl33Ct7FiVqhuLuU9Ki3dnJVFd?=
 =?iso-8859-1?Q?k4CBFKv9E0ZC2/cWX9czo5YlemW2a+QuFCVIGGl9hF4njw77LHwoGaE6tK?=
 =?iso-8859-1?Q?0wlCc0qOjurjc0s9iIomPoYnitLAwZ6Be0+6ezlRu8ilnC5gYLRHPVpquG?=
 =?iso-8859-1?Q?1AUVYyBjM+q6DymXuMjaOtqZDt3JQqC/G5YuUlwsk4jlfyspV7z2j/VeVZ?=
 =?iso-8859-1?Q?e+kBp0o7YXsALAaF0WblPu9fo6+ghYFZy890SCnVNvOTEpsgBQBT3DwGv/?=
 =?iso-8859-1?Q?IqR9tFGkof1x39IRxs3KMfaysf3z9hNRsj3+LsTZXlX2DYHTCj/yyXvMTR?=
 =?iso-8859-1?Q?Ma/K4PobWnDUmDbyUPT2COzE0n+ItdLbEP5eod0jena3tRKt/JyvEMA2x8?=
 =?iso-8859-1?Q?YcHDmM6vX6pmBcal2N7GV5P+kdQr6HxhBJv3unlBzORcSN2PVcKaDimIWH?=
 =?iso-8859-1?Q?kG9BaOa4qaLF9KoGE7SF5+o3wa/Zzi0uaNAgIKrgxo7i4E1JoHy994V6aD?=
 =?iso-8859-1?Q?UGtd3uih0/H4mBlirUbeQij27emilAAn/V651vCdeyhMwFo4wIzJkNWH+z?=
 =?iso-8859-1?Q?9mWR1f+iVmCnEsn6mnA7VYlNYkc7QlnC/mW8uWFL8737VnZet8uQea85kz?=
 =?iso-8859-1?Q?oPMwHejYxdfPQDglhMLDFD/EhnZPmHzE1fCGScOXYueuyYJnm393v7pCoT?=
 =?iso-8859-1?Q?6OijVRLSO8bY4nOAkZ8MzCUDCsqoTL8/fbwjGq19O12tjM6r08xaqjXw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16cf3ad6-14bb-440a-aada-08de173c4356
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 22:41:13.0546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6qJ8RXoykNuZfeQ4cnSscQpdfrIxERG25AItfB5y2/g5NyQRYLCioO0kourqF/+FwDlqX0h2+pZRxAB3U3ESvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6312
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

On Sat, Oct 25, 2025 at 02:04:01PM +0200, Thomas Hellström wrote:
> Pagemaps are costly to set up and tear down, and they consume a lot
> of system memory for the struct pages. Ideally they should be
> created only when needed.
> 
> Add a caching mechanism to allow doing just that: Create the drm_pagemaps
> when needed for migration. Keep them around to avoid destruction and
> re-creation latencies and destroy inactive/unused drm_pagemaps on memory
> pressure using a shrinker.
> 
> Only add the helper functions. They will be hooked up to the xe driver
> in the upcoming patch.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/Makefile           |   3 +-
>  drivers/gpu/drm/drm_pagemap.c      |  79 +++++-
>  drivers/gpu/drm/drm_pagemap_util.c | 426 +++++++++++++++++++++++++++++
>  include/drm/drm_pagemap.h          |  53 +++-
>  include/drm/drm_pagemap_util.h     |  25 ++
>  5 files changed, 569 insertions(+), 17 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_pagemap_util.c
>  create mode 100644 include/drm/drm_pagemap_util.h
> 
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index c2672f369aed..cdca68fd9f23 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -107,7 +107,8 @@ obj-$(CONFIG_DRM_GPUVM) += drm_gpuvm.o
>  
>  drm_gpusvm_helper-y := \
>  	drm_gpusvm.o\
> -	drm_pagemap.o
> +	drm_pagemap.o\
> +	drm_pagemap_util.o
>  obj-$(CONFIG_DRM_GPUSVM) += drm_gpusvm_helper.o
>  
>  obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index fb18a80d6a1c..5ca5b2b53bc1 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -8,6 +8,7 @@
>  #include <linux/pagemap.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_pagemap.h>
> +#include <drm/drm_pagemap_util.h>
>  #include <drm/drm_print.h>
>  
>  /**
> @@ -578,7 +579,7 @@ static void drm_pagemap_release(struct kref *ref)
>  	 * pagemap provider drm_device and its module.
>  	 */
>  	dpagemap->dev_hold = NULL;
> -	kfree(dpagemap);
> +	drm_pagemap_shrinker_add(dpagemap);
>  	llist_add(&dev_hold->link, &drm_pagemap_unhold_list);
>  	schedule_work(&drm_pagemap_work);
>  	/*
> @@ -628,6 +629,58 @@ drm_pagemap_dev_hold(struct drm_pagemap *dpagemap)
>  	return dev_hold;
>  }
>  
> +/**
> + * drm_pagemap_reinit() - Reinitialize a drm_pagemap
> + * @dpagemap: The drm_pagemap to reinitialize
> + *
> + * Reinitialize a drm_pagemap, for which drm_pagemap_release
> + * has already been called. This interface is intended for the
> + * situation where the driver caches a destroyed drm_pagemap.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int drm_pagemap_reinit(struct drm_pagemap *dpagemap)
> +{
> +	dpagemap->dev_hold = drm_pagemap_dev_hold(dpagemap);
> +	if (IS_ERR(dpagemap->dev_hold))
> +		return PTR_ERR(dpagemap->dev_hold);
> +
> +	kref_init(&dpagemap->ref);
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_pagemap_reinit);
> +
> +/**
> + * drm_pagemap_init() - Initialize a pre-allocated drm_pagemap
> + * @dpagemap: The drm_pagemap to initialize.
> + * @pagemap: The associated dev_pagemap providing the device
> + * private pages.
> + * @drm: The drm device. The drm_pagemap holds a reference on the
> + * drm_device and the module owning the drm_device until
> + * drm_pagemap_release(). This facilitates drm_pagemap exporting.
> + * @ops: The drm_pagemap ops.
> + *
> + * Initialize and take an initial reference on a drm_pagemap.
> + * After successful return, use drm_pagemap_put() to destroy.
> + *
> + ** Return: 0 on success, negative error code on error.
> + */
> +int drm_pagemap_init(struct drm_pagemap *dpagemap,
> +		     struct dev_pagemap *pagemap,
> +		     struct drm_device *drm,
> +		     const struct drm_pagemap_ops *ops)
> +{

Should we be parnoid and assert dpagemap->ref is zero?

> +	kref_init(&dpagemap->ref);
> +	dpagemap->ops = ops;
> +	dpagemap->pagemap = pagemap;
> +	dpagemap->drm = drm;
> +	dpagemap->cache = NULL;
> +	INIT_LIST_HEAD(&dpagemap->shrink_link);
> +
> +	return drm_pagemap_reinit(dpagemap);
> +}
> +EXPORT_SYMBOL(drm_pagemap_init);
> +
>  /**
>   * drm_pagemap_create() - Create a struct drm_pagemap.
>   * @drm: Pointer to a struct drm_device providing the device-private memory.
> @@ -645,22 +698,14 @@ drm_pagemap_create(struct drm_device *drm,
>  		   const struct drm_pagemap_ops *ops)
>  {
>  	struct drm_pagemap *dpagemap = kzalloc(sizeof(*dpagemap), GFP_KERNEL);
> -	struct drm_pagemap_dev_hold *dev_hold;
> +	int err;
>  
>  	if (!dpagemap)
>  		return ERR_PTR(-ENOMEM);
>  
> -	kref_init(&dpagemap->ref);
> -	dpagemap->drm = drm;
> -	dpagemap->ops = ops;
> -	dpagemap->pagemap = pagemap;
> -
> -	dev_hold = drm_pagemap_dev_hold(dpagemap);
> -	if (IS_ERR(dev_hold)) {
> -		kfree(dpagemap);
> -		return ERR_CAST(dev_hold);
> -	}
> -	dpagemap->dev_hold = dev_hold;
> +	err = drm_pagemap_init(dpagemap, pagemap, drm, ops);
> +	if (err)
> +		return ERR_PTR(err);
>  
>  	return dpagemap;
>  }
> @@ -1023,6 +1068,14 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  }
>  EXPORT_SYMBOL(drm_pagemap_populate_mm);
>  
> +void drm_pagemap_destroy(struct drm_pagemap *dpagemap, bool is_atomic_or_reclaim)
> +{

Likewise here, assert ref count is zero?

> +	if (dpagemap->ops->destroy)
> +		dpagemap->ops->destroy(dpagemap, is_atomic_or_reclaim);
> +	else
> +		kfree(dpagemap);
> +}
> +
>  static void drm_pagemap_exit(void)
>  {
>  	flush_work(&drm_pagemap_work);
> diff --git a/drivers/gpu/drm/drm_pagemap_util.c b/drivers/gpu/drm/drm_pagemap_util.c
> new file mode 100644
> index 000000000000..e1a1d6bf25f4
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_pagemap_util.c
> @@ -0,0 +1,426 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_pagemap.h>
> +#include <drm/drm_pagemap_util.h>
> +#include <drm/drm_print.h>
> +
> +/**
> + * struct drm_pagemap_cache - Lookup structure for pagemaps
> + *
> + * Structure to keep track of active (refcount > 1) and inactive
> + * (refcount == 0) pagemaps. Inactive pagemaps can be made active
> + * again by waiting for the @queued completion (indicating that the
> + * pagemap has been put on the @shrinker's list of shrinkable
> + * pagemaps, and then successfully removing it from @shrinker's
> + * list. The latter may fail if the shrinker is already in the
> + * process of freeing the pagemap. A struct drm_pagemap_cache can
> + * hold a single struct drm_pagemap.
> + */
> +struct drm_pagemap_cache {
> +	/** @lookup_mutex: Mutex making the lookup process atomic */
> +	struct mutex lookup_mutex;
> +	/** @lock: Lock protecting the @dpagemap pointer */
> +	spinlock_t lock;
> +	/** @shrinker: Pointer to the shrinker used for this cache. Immutable. */
> +	struct drm_pagemap_shrinker *shrinker;
> +	/** @dpagemap: Non-refcounted pointer to the drm_pagemap */
> +	struct drm_pagemap *dpagemap;
> +	/**
> +	 * @queued: Signals when an inactive drm_pagemap has been put on
> +	 * @shrinker's list.
> +	 */
> +	struct completion queued;
> +};
> +
> +/**
> + * struct drm_pagemap_shrinker - Shrinker to remove unused pagemaps
> + */
> +struct drm_pagemap_shrinker {
> +	/** @drm: Pointer to the drm device. */
> +	struct drm_device *drm;
> +	/** @lock: Spinlock to protect the @dpagemaps list. */
> +	spinlock_t lock;
> +	/** @dpagemaps: List of unused dpagemaps. */
> +	struct list_head dpagemaps;
> +	/** @num_dpagemaps: Number of unused dpagemaps in @dpagemaps. */
> +	atomic_t num_dpagemaps;
> +	/** @shrink: Pointer to the struct shrinker. */
> +	struct shrinker *shrink;
> +};
> +
> +static bool drm_pagemap_shrinker_cancel(struct drm_pagemap *dpagemap);
> +
> +static void drm_pagemap_cache_fini(void *arg)
> +{
> +	struct drm_pagemap_cache *cache = arg;
> +	struct drm_pagemap *dpagemap;
> +
> +	drm_dbg(cache->shrinker->drm, "Destroying dpagemap cache.\n");
> +	spin_lock(&cache->lock);
> +	dpagemap = cache->dpagemap;
> +	if (!dpagemap) {
> +		spin_unlock(&cache->lock);
> +		goto out;
> +	}
> +
> +	if (drm_pagemap_shrinker_cancel(dpagemap)) {
> +		cache->dpagemap = NULL;
> +		spin_unlock(&cache->lock);
> +		drm_pagemap_destroy(dpagemap, false);
> +	}
> +
> +out:
> +	mutex_destroy(&cache->lookup_mutex);
> +	kfree(cache);
> +}
> +
> +/**
> + * drm_pagemap_cache_create_devm() - Create a drm_pagemap_cache
> + * @shrinker: Pointer to a struct drm_pagemap_shrinker.
> + *
> + * Create a device-managed drm_pagemap cache. The cache is automatically
> + * destroyed on struct device removal, at which point any *inactive*
> + * drm_pagemap's are destroyed.
> + *
> + * Return: Pointer to a struct drm_pagemap_cache on success. Error pointer
> + * on failure.
> + */
> +struct drm_pagemap_cache *drm_pagemap_cache_create_devm(struct drm_pagemap_shrinker *shrinker)
> +{
> +	struct drm_pagemap_cache *cache = kzalloc(sizeof(*cache), GFP_KERNEL);
> +	int err;
> +
> +	if (!cache)
> +		return ERR_PTR(-ENOMEM);
> +
> +	mutex_init(&cache->lookup_mutex);

devm_mutex_init ?

> +	spin_lock_init(&cache->lock);
> +	cache->shrinker = shrinker;
> +	init_completion(&cache->queued);
> +	err = devm_add_action_or_reset(shrinker->drm->dev, drm_pagemap_cache_fini, cache);
> +	if (err)
> +		return ERR_PTR(err);
> +
> +	return cache;
> +}
> +EXPORT_SYMBOL(drm_pagemap_cache_create_devm);
> +
> +/**
> + * DOC: Cache lookup
> + *
> + * Cache lookup should be done under a locked mutex, so that a
> + * failed drm_pagemap_get_from_cache() and a following
> + * drm_pagemap_cache_setpagemap() are carried out as an atomic
> + * operation WRT other lookups. Otherwise, racing lookups may
> + * unnecessarily concurrently create pagemaps to fulfill a
> + * failed lookup. The API provides two functions to perform this lock,
> + * drm_pagemap_lock_lookup() and drm_pagemap_unlock_lookup() and they
> + * should be used in the following way:
> + *
> + * .. code-block:: c
> + *
> + *		drm_pagemap_lock_lookup(cache);

s/drm_pagemap_lock_lookup/drm_pagemap_cache_lock_lookup

> + *		dpagemap = drm_pagemap_get_from_cache(cache);
> + *		if (dpagemap)
> + *			goto out_unlock;
> + *
> + *		dpagemap = driver_create_new_dpagemap();
> + *		if (!IS_ERR(dpagemap))
> + *			drm_pagemap_cache_set_pagemap(cache, dpagemap);
> + *
> + *     out_unlock:
> + *		drm_pagemap_unlock_lookup(cache);
> + */
> +
> +/**
> + * drm_pagemap_cache_lock_lookup() Lock a drm_pagemap_cache for lookup
> + * @cache: The drm_pagemap_cache to lock.
> + *
> + * Return: %-EINTR if interrupted while blocking. %0 otherwise.
> + */
> +int drm_pagemap_cache_lock_lookup(struct drm_pagemap_cache *cache)
> +{
> +	return mutex_lock_interruptible(&cache->lookup_mutex);
> +}
> +EXPORT_SYMBOL(drm_pagemap_cache_lock_lookup);
> +
> +/**
> + * drm_pagemap_cache_unlock_lookup() Unlock a drm_pagemap_cache after lookup
> + * @cache: The drm_pagemap_cache to unlock.
> + */
> +void drm_pagemap_cache_unlock_lookup(struct drm_pagemap_cache *cache)
> +{
> +	mutex_unlock(&cache->lookup_mutex);
> +}
> +EXPORT_SYMBOL(drm_pagemap_cache_unlock_lookup);
> +
> +/**
> + * drm_pagemap_get_from_cache() -  Lookup of drm_pagemaps.

Should we normalize all cache functions prefixed with 'drm_pagemap_cache'?

So maybe drm_pagemap_cache_lookup_get ?

> + * @cache: The cache used for lookup.
> + *
> + * If an active pagemap is present in the cache, it is immediately returned.
> + * If an inactive pagemap is present, it's removed from the shrinker list and
> + * an attempt is made to make it active.
> + * If no pagemap present or the attempt to make it active failed, %NULL is returned
> + * to indicate to the caller to create a new drm_pagemap and insert it into
> + * the cache.
> + *
> + * Return: A reference-counted pointer to a drm_pagemap if successful. An error
> + * pointer if an error occurred, or %NULL if no drm_pagemap was found and
> + * the caller should insert a new one.
> + */
> +struct drm_pagemap *drm_pagemap_get_from_cache(struct drm_pagemap_cache *cache)
> +{
> +	struct drm_pagemap *dpagemap;
> +	int err;
> +
> +	lockdep_assert_held(&cache->lookup_mutex);
> +retry:
> +	spin_lock(&cache->lock);
> +	dpagemap = cache->dpagemap;
> +	if (drm_pagemap_get_unless_zero(dpagemap)) {
> +		spin_unlock(&cache->lock);
> +		return dpagemap;
> +	}
> +
> +	if (!dpagemap) {
> +		spin_unlock(&cache->lock);
> +		return NULL;
> +	}
> +
> +	if (!try_wait_for_completion(&cache->queued)) {
> +		spin_unlock(&cache->lock);
> +		err = wait_for_completion_interruptible(&cache->queued);
> +		if (err)
> +			return ERR_PTR(err);
> +		goto retry;
> +	}
> +
> +	if (drm_pagemap_shrinker_cancel(dpagemap)) {
> +		cache->dpagemap = NULL;
> +		spin_unlock(&cache->lock);
> +		err = drm_pagemap_reinit(dpagemap);
> +		if (err) {
> +			drm_pagemap_destroy(dpagemap, false);
> +			return ERR_PTR(err);
> +		}
> +		drm_pagemap_cache_set_pagemap(cache, dpagemap);
> +	} else {
> +		cache->dpagemap = NULL;
> +		spin_unlock(&cache->lock);
> +		dpagemap = NULL;
> +	}
> +
> +	return dpagemap;
> +}
> +EXPORT_SYMBOL(drm_pagemap_get_from_cache);
> +
> +/**
> + * drm_pagemap_cache_set_pagemap() - Assign a drm_pagemap to a drm_pagemap_cache
> + * @cache: The cache to assign the drm_pagemap to.
> + * @dpagemap: The drm_pagemap to assign.
> + *
> + * The function must be called to populate a drm_pagemap_cache only
> + * after a call to drm_pagemap_get_from_cache() returns NULL.
> + */
> +void drm_pagemap_cache_set_pagemap(struct drm_pagemap_cache *cache, struct drm_pagemap *dpagemap)
> +{
> +	struct drm_device *drm = dpagemap->drm;
> +
> +	lockdep_assert_held(&cache->lookup_mutex);
> +	spin_lock(&cache->lock);
> +	dpagemap->cache = cache;
> +	swap(cache->dpagemap, dpagemap);
> +	reinit_completion(&cache->queued);
> +	spin_unlock(&cache->lock);
> +	drm_WARN_ON(drm, !!dpagemap);
> +}
> +EXPORT_SYMBOL(drm_pagemap_cache_set_pagemap);
> +
> +/**
> + * drm_pagemap_get_from_cache_if_active() - Quick lookup of active drm_pagemaps
> + * @cache: The cache to lookup from.
> + *
> + * Function that should be used to lookup a drm_pagemap that is already active.
> + * (refcount > 0).
> + *
> + * Return: A pointer to the cache's drm_pagemap if it's active; %NULL otherwise.
> + */
> +struct drm_pagemap *drm_pagemap_get_from_cache_if_active(struct drm_pagemap_cache *cache)

Then here drm_pagemap_cache_lookup_if_active ?

> +{
> +	struct drm_pagemap *dpagemap;
> +
> +	spin_lock(&cache->lock);
> +	dpagemap = drm_pagemap_get_unless_zero(cache->dpagemap);
> +	spin_unlock(&cache->lock);
> +
> +	return dpagemap;
> +}
> +EXPORT_SYMBOL(drm_pagemap_get_from_cache_if_active);
> +
> +static bool drm_pagemap_shrinker_cancel(struct drm_pagemap *dpagemap)
> +{
> +	struct drm_pagemap_cache *cache = dpagemap->cache;
> +	struct drm_pagemap_shrinker *shrinker = cache->shrinker;
> +
> +	spin_lock(&shrinker->lock);
> +	if (list_empty(&dpagemap->shrink_link)) {
> +		spin_unlock(&shrinker->lock);
> +		return false;
> +	}
> +
> +	list_del_init(&dpagemap->shrink_link);
> +	atomic_dec(&shrinker->num_dpagemaps);
> +	spin_unlock(&shrinker->lock);
> +	return true;
> +}
> +
> +/**
> + * drm_pagemap_shrinker_add() - Add a drm_pagemap to the shrinker list or destroy
> + * @dpagemap: The drm_pagemap.
> + *
> + * If @dpagemap is associated with a &struct drm_pagemap_cache AND the
> + * struct device backing the drm device is still alive, add @dpagemap to
> + * the &struct drm_pagemap_shrinker list of shrinkable drm_pagemaps.
> + *
> + * Otherwise destroy the pagemap directly using drm_pagemap_destroy().
> + *
> + * This is an internal function which is not intended to be exposed to drivers.
> + */
> +void drm_pagemap_shrinker_add(struct drm_pagemap *dpagemap)
> +{
> +	struct drm_pagemap_cache *cache;
> +	struct drm_pagemap_shrinker *shrinker;
> +	int idx;
> +
> +	/*
> +	 * The pagemap cache and shrinker are disabled at
> +	 * pci device remove time. After that, dpagemaps
> +	 * are freed directly.
> +	 */
> +	if (!drm_dev_enter(dpagemap->drm, &idx))
> +		goto out_no_cache;
> +
> +	cache = dpagemap->cache;
> +	if (!cache) {
> +		drm_dev_exit(idx);
> +		goto out_no_cache;
> +	}

Can you explain the above logic, I'm not really following this.

> +
> +	shrinker = cache->shrinker;
> +	spin_lock(&shrinker->lock);
> +	list_add_tail(&dpagemap->shrink_link, &shrinker->dpagemaps);
> +	atomic_inc(&shrinker->num_dpagemaps);
> +	spin_unlock(&shrinker->lock);
> +	complete_all(&cache->queued);
> +	drm_dev_exit(idx);
> +	return;
> +
> +out_no_cache:
> +	drm_pagemap_destroy(dpagemap, true);
> +}
> +
> +static unsigned long
> +drm_pagemap_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
> +{
> +	struct drm_pagemap_shrinker *shrinker = shrink->private_data;
> +	unsigned long count = atomic_read(&shrinker->num_dpagemaps);
> +
> +	return count ? : SHRINK_EMPTY;
> +}
> +
> +static unsigned long
> +drm_pagemap_shrinker_scan(struct shrinker *shrink, struct shrink_control *sc)
> +{
> +	struct drm_pagemap_shrinker *shrinker = shrink->private_data;
> +	struct drm_pagemap *dpagemap;
> +	struct drm_pagemap_cache *cache;
> +	unsigned long nr_freed = 0;
> +
> +	sc->nr_scanned = 0;
> +	spin_lock(&shrinker->lock);
> +	do {
> +		dpagemap = list_first_entry_or_null(&shrinker->dpagemaps, typeof(*dpagemap),
> +						    shrink_link);
> +		if (!dpagemap)
> +			break;
> +
> +		atomic_dec(&shrinker->num_dpagemaps);
> +		list_del_init(&dpagemap->shrink_link);
> +		spin_unlock(&shrinker->lock);
> +
> +		sc->nr_scanned++;
> +		nr_freed++;

sc->nr_scanned and nr_freed will always be the same value, right? I
think nr_freed can be dropped then.

> +
> +		cache = dpagemap->cache;
> +		spin_lock(&cache->lock);
> +		cache->dpagemap = NULL;
> +		spin_unlock(&cache->lock);
> +
> +		drm_dbg(dpagemap->drm, "Shrinking dpagemap %p.\n", dpagemap);
> +		drm_pagemap_destroy(dpagemap, true);
> +		spin_lock(&shrinker->lock);
> +	} while (sc->nr_scanned < sc->nr_to_scan);
> +	spin_unlock(&shrinker->lock);
> +
> +	return sc->nr_scanned ? nr_freed : SHRINK_STOP;
> +}
> +
> +static void drm_pagemap_shrinker_fini(void *arg)
> +{
> +	struct drm_pagemap_shrinker *shrinker = arg;
> +
> +	drm_dbg(shrinker->drm, "Destroying dpagemap shrinker.\n");
> +	drm_WARN_ON(shrinker->drm, !!atomic_read(&shrinker->num_dpagemaps));
> +	shrinker_free(shrinker->shrink);
> +	kfree(shrinker);
> +}
> +
> +/**
> + * drm_pagemap_shrinker_create_devm() - Create and register a pagemap shrinker
> + * @drm: The drm device
> + *
> + * Create and register a pagemap shrinker that shrinks unused pagemaps
> + * and thereby reduces memory footprint.
> + * The shrinker is drm_device managed and unregisters itself when
> + * the drm device is removed.
> + *
> + * Return: %0 on success, negative error code on failure.
> + */
> +struct drm_pagemap_shrinker *drm_pagemap_shrinker_create_devm(struct drm_device *drm)
> +{
> +	struct drm_pagemap_shrinker *shrinker;
> +	struct shrinker *shrink;
> +	int err;
> +
> +	shrinker = kzalloc(sizeof(*shrinker), GFP_KERNEL);
> +	if (!shrinker)
> +		return ERR_PTR(-ENOMEM);
> +
> +	shrink = shrinker_alloc(0, "drm-drm_pagemap:%s", drm->unique);
> +	if (!shrink) {
> +		kfree(shrinker);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	spin_lock_init(&shrinker->lock);
> +	INIT_LIST_HEAD(&shrinker->dpagemaps);
> +	shrinker->drm = drm;
> +	shrinker->shrink = shrink;
> +	shrink->count_objects = drm_pagemap_shrinker_count;
> +	shrink->scan_objects = drm_pagemap_shrinker_scan;
> +	shrink->private_data = shrinker;
> +	shrinker_register(shrink);
> +
> +	err = devm_add_action_or_reset(drm->dev, drm_pagemap_shrinker_fini, shrinker);
> +	if (err)
> +		return ERR_PTR(err);
> +
> +	return shrinker;
> +}
> +EXPORT_SYMBOL(drm_pagemap_shrinker_create_devm);
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index 5cfe54331ba7..4b9af5e785c6 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -9,6 +9,7 @@
>  #define NR_PAGES(order) (1U << (order))
>  
>  struct drm_pagemap;
> +struct drm_pagemap_cache;
>  struct drm_pagemap_dev_hold;
>  struct drm_pagemap_zdd;
>  struct device;
> @@ -124,6 +125,25 @@ struct drm_pagemap_ops {
>  			   unsigned long start, unsigned long end,
>  			   struct mm_struct *mm,
>  			   unsigned long timeslice_ms);
> +	/**
> +	 * @destroy: Destroy the drm_pagemap and associated resources.
> +	 * @dpagemap: The drm_pagemap to destroy.
> +	 * @is_atomic_or_reclaim: The function may be called from
> +	 * atomic- or reclaim context.
> +	 *
> +	 * The implementation should take care not to attempt to
> +	 * destroy resources that may already have been destroyed
> +	 * using devm_ callbacks, since this function may be called
> +	 * after the underlying struct device has been unbound.
> +	 * If the implementation defers the execution to a work item
> +	 * to avoid locking issues, then it must make sure the work
> +	 * items are flushed before module exit. If the destroy call
> +	 * happens after the provider's pci_remove() callback has
> +	 * been executed, a module reference and drm device reference is
> +	 * held across the destroy callback.
> +	 */
> +	void (*destroy)(struct drm_pagemap *dpagemap,
> +			bool is_atomic_or_reclaim);
>  };
>  
>  /**
> @@ -135,6 +155,10 @@ struct drm_pagemap_ops {
>   * @pagemap: Pointer to the underlying dev_pagemap.
>   * @dev_hold: Pointer to a struct drm_pagemap_dev_hold for
>   * device referencing.
> + * @cache: Back-pointer to the &struct drm_pagemap_cache used for this
> + * &struct drm_pagemap. May be NULL if no cache is used.
> + * @shrink_link: Link into the shrinker's list of drm_pagemaps. Only
> + * used if also using a pagemap cache.
>   */
>  struct drm_pagemap {
>  	const struct drm_pagemap_ops *ops;
> @@ -142,6 +166,8 @@ struct drm_pagemap {
>  	struct drm_device *drm;
>  	struct dev_pagemap *pagemap;
>  	struct drm_pagemap_dev_hold *dev_hold;
> +	struct drm_pagemap_cache *cache;
> +	struct list_head shrink_link;
>  };
>  
>  struct drm_pagemap_devmem;
> @@ -210,6 +236,11 @@ struct drm_pagemap_devmem_ops {
>  			   unsigned long npages);
>  };
>  
> +int drm_pagemap_init(struct drm_pagemap *dpagemap,
> +		     struct dev_pagemap *pagemap,
> +		     struct drm_device *drm,
> +		     const struct drm_pagemap_ops *ops);
> +
>  struct drm_pagemap *drm_pagemap_create(struct drm_device *drm,
>  				       struct dev_pagemap *pagemap,
>  				       const struct drm_pagemap_ops *ops);
> @@ -228,9 +259,9 @@ static inline void drm_pagemap_put(struct drm_pagemap *dpagemap)
>  
>  /**
>   * drm_pagemap_get() - Obtain a reference on a struct drm_pagemap
> - * @dpagemap: Pointer to the struct drm_pagemap.
> + * @dpagemap: Pointer to the struct drm_pagemap, or NULL.
>   *
> - * Return: Pointer to the struct drm_pagemap.
> + * Return: Pointer to the struct drm_pagemap, or NULL.
>   */
>  static inline struct drm_pagemap *
>  drm_pagemap_get(struct drm_pagemap *dpagemap)
> @@ -241,6 +272,20 @@ drm_pagemap_get(struct drm_pagemap *dpagemap)
>  	return dpagemap;
>  }
>  
> +/**
> + * drm_pagemap_get_unless_zero() - Obtain a reference on a struct drm_pagemap
> + * unless the current reference count is zero.
> + * @dpagemap: Pointer to the drm_pagemap or NULL.
> + *
> + * Return: A pointer to @dpagemap if the reference count was successfully
> + * incremented. NULL if @dpagemap was NULL, or its refcount was 0.
> + */
> +static inline struct drm_pagemap * __must_check
> +drm_pagemap_get_unless_zero(struct drm_pagemap *dpagemap)
> +{
> +	return (dpagemap && kref_get_unless_zero(&dpagemap->ref)) ? dpagemap : NULL;
> +}
> +
>  /**
>   * struct drm_pagemap_devmem - Structure representing a GPU SVM device memory allocation
>   *
> @@ -284,5 +329,7 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  			    struct mm_struct *mm,
>  			    unsigned long timeslice_ms);
>  
> -#endif
> +void drm_pagemap_destroy(struct drm_pagemap *dpagemap, bool is_atomic_or_reclaim);
>  
> +int drm_pagemap_reinit(struct drm_pagemap *dpagemap);
> +#endif
> diff --git a/include/drm/drm_pagemap_util.h b/include/drm/drm_pagemap_util.h
> new file mode 100644
> index 000000000000..292244d429ee
> --- /dev/null
> +++ b/include/drm/drm_pagemap_util.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: MIT */
>

Do we need an Intel copywrite?

 +#ifndef _DRM_PAGEMAP_UTIL_H_
> +#define _DRM_PAGEMAP_UTIL_H_
> +
> +struct drm_device;
> +struct drm_pagemap;
> +struct drm_pagemap_cache;
> +struct drm_pagemap_shrinker;
> +
> +void drm_pagemap_shrinker_add(struct drm_pagemap *dpagemap);
> +
> +int drm_pagemap_cache_lock_lookup(struct drm_pagemap_cache *cache);
> +
> +void drm_pagemap_cache_unlock_lookup(struct drm_pagemap_cache *cache);
> +
> +struct drm_pagemap_shrinker *drm_pagemap_shrinker_create_devm(struct drm_device *drm);
> +
> +struct drm_pagemap_cache *drm_pagemap_cache_create_devm(struct drm_pagemap_shrinker *shrinker);
> +
> +struct drm_pagemap *drm_pagemap_get_from_cache(struct drm_pagemap_cache *cache);
> +
> +void drm_pagemap_cache_set_pagemap(struct drm_pagemap_cache *cache, struct drm_pagemap *dpagemap);
> +
> +struct drm_pagemap *drm_pagemap_get_from_cache_if_active(struct drm_pagemap_cache *cache);

I'd add an extra newline here.

Matt

> +#endif
> -- 
> 2.51.0
> 
