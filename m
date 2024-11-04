Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BAA9BC00C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 22:28:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5556010E4D3;
	Mon,  4 Nov 2024 21:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="akIGUoD2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE9610E103;
 Mon,  4 Nov 2024 21:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730755709; x=1762291709;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VfmKdyh01yLq5iJ15RvaBgkkpZtn8IlzMzZCX8+67BE=;
 b=akIGUoD29fkgi7m/63E5qcec2K5VOVYKV4L+uzdRAMFmBVQ81zQ64SKh
 AiqVabUFR4QgbbY2RMtTCUTh1T+XyP4pYovZcgWTt3ZK5aWNOz4NrfM8O
 duegqYBIlR5eECs4nKZ2IwzlY9AxtK8u6wglQgGZAwMHbg9nxmrEOxTAX
 2T5cNq12V0xA88983Vma0eWJjdEbj0gk111eZnniUReVwkmc+n9tQi7s2
 MKKQkYF+oMMSK/JDd/sRcSyYWR3YokPwcNZaoyjoe1o+jDPv3XWfUf/vr
 5MTNFts2vvFRfAdPAnhlRE5lbu5rhZTQbE6Ejuqftgu0rxY4yG74J7dxd g==;
X-CSE-ConnectionGUID: 6kMRkyccSRS4fOhgsNIzfQ==
X-CSE-MsgGUID: BXstZB7ESP2htwR/iUDi2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30419037"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30419037"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 13:28:28 -0800
X-CSE-ConnectionGUID: Xijpxq3VQXSWzCfzh/yz2w==
X-CSE-MsgGUID: cEGb4b19SMSE1uHitpoKQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="88598445"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 13:28:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 13:28:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 13:28:28 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 13:28:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A6z97E7itgXR1G+dxjxgQ8qdoNvPN67xk1HkwCYwmCvBG2Gd/0gicQkXCD/tqou02796nKtT3uU4jIf3hCVeEUkB1DrP5fKBaFpxM28IO/saBG60A9Yq1EKcCo5U9PfClOeEVIUOzE4lC3Ro7wYUwbY/sXz/p8eVLbbugJWCEu20TZKon0VJ1NI/iwAepz1ASrp3n6Y58rxjz4wFxzRgujeDzSU57j/OegRNXN8BgTHLgwRTnupiowPHI7Suh5VZ5qyM4HHmlZy2K2cvHsODCC4xBYT/gAFDuVos41/iVprNnQ2gg4ky6l37Ra8GxQPg7l6N8ijLvpLRP/1ySQHSAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zW8ulCjp622VYIBwQt6IAZ+iuRnn7WbVsDMGJl+S/aA=;
 b=P+dLxNK3WNSojiScfNaO0GKc3jue/w8IyiLMGysMdmtwgOXp+1pBU4Vq21PWApaEJSgiqW0GMeIIITINOR5PiI+4H6nKZmRSCmr43Z4wLzQ1vNpFqiFlzAWbj6HwXcdK3B56iZJIkJLhQkFz6UNCF+8gEIDjrpegKv9bOLytmuNx+m6LTJhmdLUFzlGqcr1JGLBDjQciCGs8weWFB6lZtRzL8lIWbu1GwoQFbUeWcsZDc+ZDOUI9GAyK4in6VubZf0qe2yYcfX1D5abc7Uxdc7fkMprDh02k6LOe8UJw0DzLOhSfrypYBueNPX96cy0xTi3beF+xZcXx891zEo18Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by LV1PR11MB8790.namprd11.prod.outlook.com (2603:10b6:408:2b1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 21:28:25 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Mon, 4 Nov 2024
 21:28:25 +0000
Date: Mon, 4 Nov 2024 16:28:20 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Giedrius =?utf-8?Q?Statkevi=C4=8Dius?= <giedriuswork@gmail.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/i915/lspcon: do not hardcode settle timeout
Message-ID: <Zyk8dFthM0EA2A_K@intel.com>
References: <20241017075725.207384-1-giedriuswork@gmail.com>
 <CALt+6nqxMZjuZuOKaj8Cx4dcNZx0n-0F9aa97d-vZoMWeN=bOw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALt+6nqxMZjuZuOKaj8Cx4dcNZx0n-0F9aa97d-vZoMWeN=bOw@mail.gmail.com>
X-ClientProxiedBy: MW4PR04CA0320.namprd04.prod.outlook.com
 (2603:10b6:303:82::25) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|LV1PR11MB8790:EE_
X-MS-Office365-Filtering-Correlation-Id: 1beafb0a-70f5-46f7-9d10-08dcfd179dca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2VFMmoxUDg3bHNoYTBDNDk2NDhiTmhvMGVwakZNaVZzZ0ZzVTRSTlZsZmN2?=
 =?utf-8?B?a0pUVWxhOUxmdjRPWEZGekF2RnNBb3FtM013aHFhSGNXTHdiN1lYNDBHTE05?=
 =?utf-8?B?YytKMEdIZWNxZEtnZDdCdXFOL1Q4SVNocmNKcHdlNkFqU1BEb2N3RlVOUEl1?=
 =?utf-8?B?S3JJTEdNM2U5SXJxMGpneGVGb0dBMTBFcTYvRzNaTmJ0cHp4Q1hqa0w3Tkh3?=
 =?utf-8?B?bGN5a1N2VWxsclI5MFV1MVVwUnRSeUFuTGNCR0VmbTBtd0hXQUhKSTRpWHhC?=
 =?utf-8?B?U1hoMjloeTV3Tkg0bVVPb1lVQkhIYnBwUEhoVmpMRUg3V2ZIL2FWa3ZuZitM?=
 =?utf-8?B?ejA2TUg4YlpaaEJvRzNiOFpKOXlhOGR0VWdSMHZRdjJ1dEx1TklZZGdmck45?=
 =?utf-8?B?TTh5SUlXVmR3NzJvbGlCMzdVdmRRTnV1cHQ3K3FlajlVTVY3SDFSTVRYNFha?=
 =?utf-8?B?YTFGN1FMT0tUSVB2d3ZPbVZRNkQ3SStFYmN0aFFGWlZ2dnN0aEM4RUdMcFFx?=
 =?utf-8?B?ekdMOE9QRWJkM3hoaXE4M1pHQnZtN0ZOOXl5Kzh6K1JPUnFmbjQ3RzhjemFk?=
 =?utf-8?B?d2lxYk1UL3JwcWd0WFhqMjJlUWFHSHplK3NYRWdNNE5UNEYvV3lQdDliUDBQ?=
 =?utf-8?B?RG5keHVQTTVWTTdZQlNnb3VFdG9TdlUrYURoYVZsU2NrSmVmOE0rak82Y3Mx?=
 =?utf-8?B?eldwWWJ0ZEhQdUJxTjU3U1dvWEJQa0REbGJkaW9nSGwrb3E4a21XMnhhenZD?=
 =?utf-8?B?YjVxaUJ3WjA1RnpqQ3JzN28yRG4zVjlQS204TlRmZXh5cnBxYWI0SlEwRTF6?=
 =?utf-8?B?TUJueDJQN3REVE1nREY0am5tRE0xZW80S2h6ZS8xR3VNbm5GemVXdkhpbnBu?=
 =?utf-8?B?RGhnM3YveFFUSHk1VW1YQWRtZFJhZzFLVjJjaHo2dHU3aWRYZFE2SzE2aG0y?=
 =?utf-8?B?a2xwcCtFZmtVaTZpR2pMa1JlQTd2dVMrSHdJZU5Bd21oblE0SW1zejJwMDhR?=
 =?utf-8?B?SElJUWFWb2lJNlhNYXUvZHVHWDNmSWxvWkJzaS8vOTdCRUNNUGNISTVPMVZ1?=
 =?utf-8?B?ZGhjbHF1aVYyVGVvOTI4ZisyRGZiYzg1dmFRSkF1ZDdtTFErVXEweEh2Skhn?=
 =?utf-8?B?R0p0MGhpVEpvQ3YwN0pMOWJ1bU9iYnhwUkVNRTRURFVYbUtEM1NqajA1QXZK?=
 =?utf-8?B?SStjeW1mcm1NZnBuaDR2UVNnUUo4TEtnSXpmcW9La1JiMlN6dStVNjRyVVhC?=
 =?utf-8?B?L0xiK2M0TVkrVVVjc3VGQzI1NDhxbThoTm95NTB1TGJGZ0hJb2JhSnd2S0d1?=
 =?utf-8?B?Z1VSSEhKUjJBcU5KZGx0aTIwR0liWTBUWjc1cGFYYnJEWkhjUTFaTXhiRi9Z?=
 =?utf-8?B?QTZCNlgrM2w0ckk2WU1HOGw3RXpaODd2REpXSFQ2cXBMK3AxejJIV3lsSlZ5?=
 =?utf-8?B?VEF5K290Ukp6WHpRVUdnZTJZNUthWUJWZTRlajlia25YOTZEOFArSzFRZzNr?=
 =?utf-8?B?dVpwUlZaQ3lVTndSemxxZ0FndEtUVGRndElhWlU0YzlxMDlHakE4WmtlcmFY?=
 =?utf-8?B?RnYvdXg1M01SMWMvamxpcGVuaGplMFJFNHBJbktPT3hwNHEzN0hEbWN0Ympl?=
 =?utf-8?B?ZGZGajlSNzBiRFlVZkxZQmp2Z1NIVHI4eGNweE5zaFpWUlV4SENRcngxKzNS?=
 =?utf-8?B?UlhSdkZVNjh3WGtwRVFqRUlXMFYwOWlYbXNKcU5IZ2wrVDYrb1ZYR3BMU3Q0?=
 =?utf-8?Q?o3Waw9cmVFN0TGe5V+6wnm8kVtokvGh2wjxS9bR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3NocXBLWTFXb2tKK1J0aGV6WnZYYTlnQytGZkxocW5Sc0xCTkVFaEdJZHU1?=
 =?utf-8?B?ZUVHN2xHWXF5YVp0cHNPaDJvcVh2S2lIZWk5d3hlS2dZQ2JEVnh6VWFmMUlL?=
 =?utf-8?B?WUc5bXNJMW9sSldBOVc1K0FvTmVjUytRRGZxR1dXKzc4ckdDOEVhWjVveG1W?=
 =?utf-8?B?RzFpTXgzcHNUTVBldkFpV1krRTRBa1ZrN2hkUGlnT2UzeGY5eFdtSXhHQXVk?=
 =?utf-8?B?a3FIWkFqdnMrU2FQazdobnRyV0xpVEZaK1Y5bGE4MjVVbjFhSmNsOU8xNFRo?=
 =?utf-8?B?TFNaME1ucmFvN1NDSE5VeUJTMlVPZGR6bVNObWxObEp3YUxRUDd5VEJLYTZx?=
 =?utf-8?B?emJVU0wvaHNIejlON0J1VndHMXFSTSs3M3NUcytWRWNOZzkrN2tmeGo1WFlE?=
 =?utf-8?B?RjZITVY3RCtUakhWRkx4RTFHdzdSKy84Q0QvMGVBNFZBTlZlUnpCeXVaZGsr?=
 =?utf-8?B?bFQwMGtOVk1hUTJUQmRxTCtvb0RmSGh3YlRpNlpiWnM1Ty83b1hrTGpldHRs?=
 =?utf-8?B?b3ZnVS92ODUrNFIzYVJoZXFNUU1ORWlVT3AwRklPQU5Ddm5teURxbXhqbzdr?=
 =?utf-8?B?dmMvcDlPOXJabmp0d1JWSlRWTXh1SlE5RW9ISmxqek1EQkV5czNiQUNSaG8w?=
 =?utf-8?B?UktMbjYrY3dGRFJqeElwNlc1Q0w1Mmo3N3FWVjRvTUs2RHpIbFlQZG91NUpt?=
 =?utf-8?B?a3E2amlLNWJONEs5Mkt0MW1jWHczaWN4U05QaEFjNnVRa1M3bngxSHdTaU84?=
 =?utf-8?B?VDNGOHlTY0lOY3I1ZjJ1OG5YZ1FWY1RhbkVUTWZETE11dCttOTlnSXZrMDdp?=
 =?utf-8?B?RzZLeGhsV1JWUkg3UStlTFNWWGd2WlVEMWZ4bHhXUElEdFNDaVU0cmhNVVdv?=
 =?utf-8?B?ZFZiaVhmMTZkTDkvNUxnR2g2NDd3ek1KdGJjYUhMbTBQKzF4bTBhMDFnUXJV?=
 =?utf-8?B?dEl1T040OGVITVNrS1JaRGtWdVh1NFFYSEVlWkUrWS9UMTUrTm1nWW4xandF?=
 =?utf-8?B?dk94R2VGSS9MMTVOWmdGMjcydmpWd001eDFpY3p1cjAvUk9pZDNuak92TGls?=
 =?utf-8?B?Tyt3ZVB3TTBFZFJicGdQSGpBejdIU0MxSFdMZC91dU5EV0ZlTyszSkU5VUFR?=
 =?utf-8?B?cVhuZHRyM0J5TjRRRGY3V3NlY3JqanQ2cllwbTUxc1lHOC9nSFpaNGVhT1VQ?=
 =?utf-8?B?OFkrU3QwY0hXSFlCUkNKRU5iYkhvSS9EOTg3VTZhRVlSMlpSMklnNTJwaWJy?=
 =?utf-8?B?TXVRZ0pyR1kwb3QreHR0R1RwdXFMdVBMUFE5dysvV1k3N1BOdUZLUTVTS0JG?=
 =?utf-8?B?dUU0SXgyY1UzekhndTYwWGp4V0tzeDFMdkNlNWloM0NJbjVTRC9Yc1BVckVD?=
 =?utf-8?B?bWRIWk43LzJIcmxsaGxiRU52NTZrNkN0Um1HWEJyaTM5NEtoWlJSdmlmNWlz?=
 =?utf-8?B?d0ZHNmphLzdmd0xNNW04Uk9hWVdQNXpldFVKandGNnRPYTVycm1CS05YLzJL?=
 =?utf-8?B?N0NwUkdyQmdyZ1A0TWJwMi9zcU5aY3JaL0hDejZrNnNiTWFXZUdmYmJ4NG9T?=
 =?utf-8?B?dUM4K1RhcGVJNDd5dkhKcHBNUUZscy94dk1VOERCWmhYNllOd0RtVWdTbzVE?=
 =?utf-8?B?ckt5N3dLZmRqa1BCa2ZyT2o3WG1sckxUMnBVVXFsTmIzMmNaKzZCbnBZNTdU?=
 =?utf-8?B?QWVtVmMyMTQyb2h5VWdmR05pY215WU5HMHh1SEhoZzl1VXhtNTQvcVNBUWw1?=
 =?utf-8?B?MGZXeFoxL2NQZTlHcmhNME5Bd28zZDFkNEhaYVZSd0RaSklPdUd6MzFkdDc0?=
 =?utf-8?B?dGQvc1k5VE9aTUprMVdHZnFUVVBJbmQ2bDY4Rng3U0NBVEk2OHBZNlF2TU1s?=
 =?utf-8?B?bDBkTnJ2QlRDNmNiSW45bE1oSjRndWR4d1QrcThSUG84ZitLS01ONU5FbEFm?=
 =?utf-8?B?My9FbVh0TDF0UnZleTVGd2dVMTIxZk8yMVJBajJpdXlGaHBodnYxdngxeUZR?=
 =?utf-8?B?TkVpajdKZlBPTCs0OENWampqbTE5bG15U3d5L0x3amRJaFlUZmloUGYvS1J0?=
 =?utf-8?B?Yk5kMmV1V25MMkZpaGhWS1pHUXgzMU9UNjRGZmc5UU9keG03Vjl6SzdCSjIx?=
 =?utf-8?B?SWhMcFRhT0dGalBqRy9vS1h3eTRoU3JPMUQ2aVphdkNoeVUvWHNEcFRGY01E?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1beafb0a-70f5-46f7-9d10-08dcfd179dca
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 21:28:25.4430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: carkZ58RyjvRU87kb+GoKr/Y/uRu1fKbkez6xYNRrpG+qlciZxqr1YDzh3bYedqwuAldMctP+as3M+HXrh6ZEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8790
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

On Mon, Nov 04, 2024 at 02:09:46PM +0200, Giedrius Statkevičius wrote:
> Hello,
> 
> Kind ping.

There was a pipe underun in CI... I honestly don't believe this patch is
causing it, but anyway I decided to trigger a retest there before I push this.

Thanks for the patch and review.

> 
> 
> On Thu, 17 Oct 2024 at 10:57, Giedrius Statkevičius
> <giedriuswork@gmail.com> wrote:
> >
> > Avoid hardcoding the LSPCON settle timeout because it takes a longer
> > time on certain chips made by certain vendors. Use the function that
> > already exists to determine the timeout.
> >
> > Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > Signed-off-by: Giedrius Statkevičius <giedriuswork@gmail.com>
