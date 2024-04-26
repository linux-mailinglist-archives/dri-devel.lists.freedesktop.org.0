Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E59498B2E27
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 02:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B88510F956;
	Fri, 26 Apr 2024 00:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="njr8CPq3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157D410F659;
 Fri, 26 Apr 2024 00:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714092821; x=1745628821;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Iwqv3x2dm2d6mH/j/Lhl/lZZHyrbuhKdjv8qOocoROk=;
 b=njr8CPq3n+ai4Zpt7TzuyI8WiAaexEPb0ZPJfrtgcztghMt/JzXfrhTY
 zM1VFLQ2lZerb2ANw3xdA2bY1TyL0uH58vxgHuxiLPSmIcEK/gP9omfFB
 DDCc3qerhEDlQmLAJoZ+BxssGpX70kh8p3ZIcEm30UoLYWqiQ59Y8cKQr
 e38iEaBRQfXGUzlELuINotlni8CTPJJVIk9aT3saMIynvg/mxvkcwhA+a
 eIdDR91lmcKHdLa8Wr8qd5VqOH4uVg4MIralAPW3j22sfhoKCzOqIP66w
 YIpQZd7Lhw9pSLjuCIwH30TnA73Q43XID52VI4xbufwP+qoDfx0NlPoDy g==;
X-CSE-ConnectionGUID: cpqyitpBQH6yu87l3gf3nQ==
X-CSE-MsgGUID: cf5DbyFqSxW21lprQQYn6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="10034511"
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; d="scan'208";a="10034511"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 17:53:40 -0700
X-CSE-ConnectionGUID: YpYGbANDQJKD605i+pzC/Q==
X-CSE-MsgGUID: tZqtcTopR9WoknSwT39+fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; d="scan'208";a="25223979"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Apr 2024 17:53:40 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 17:53:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Apr 2024 17:53:39 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Apr 2024 17:53:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LQSa95Xc7IFqfa0/8d435BXZU5a0zJI+owv0EZEOV/1k2v9g8EMv5rZlcsNuXtE2N7OAne5Bx0HNoh0fLTppwcAej9ufGe/hOvKm8vZEMu4IZywKKmVPWA7zc0GiSkG9BjMk/cNRTDtriHTqdUSA9DsbhKMleKaJ897xd387Dzsz9OtqjmYEFvcEFIslZoc0kmvVB2LExgywT+lmTf7GwPuwAHYan5G3xb3ZyIb+/gv5NSvBeUmcIcQBYjCH57H2IiKSM7cESIX6r4jqx9yxcoFj3Pv49LVQLJqSQET0IANsgx5v/Cjq+a2qC3vVxV9lRbRjufmtQuQucjm2oq7GhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqey3T7cK8pfvtq/y37XUMPIF1c+GwGzYOkmOreN0eI=;
 b=ZhwzBJz11MKDRVWHfsyGxxLLMAxB+Z7oPKkFD+le160kebzcn+GFPV3/OHvtvOPbfeeQe+bdlNU1BiPdQ0Y0PRIgZPdiyhq3W45V2wOyTi5XyYXG2qJCHKaJFNhI0YcIEwezfpGjQb88UatKdehhvKF8u+5hq248U/lH5IdsdqmK/j7aL+HOP40s3bC5wlYXmvLPixFKJ6yfkuzMxxNPBYC16gixPbzDYPgTY+P7Nj3ZjpQQadZQrk7Al3QQrwvExum02Lkb2DOs/44Dz3rt8PYHimyY1yl9L7nGDZrW6PI9gKXCKjfEwz81fLOor6UkHafyLODy3YIss8nW/UgNkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY8PR11MB7010.namprd11.prod.outlook.com (2603:10b6:930:56::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7519.16; Fri, 26 Apr 2024 00:53:36 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b7ca:3c22:811c:2d1b]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b7ca:3c22:811c:2d1b%7]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 00:53:36 +0000
Date: Fri, 26 Apr 2024 02:53:34 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
CC: <dri-devel@lists.freedesktop.org>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <airlied@gmail.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v3 4/4] drm/xe/FLR: Support PCIe FLR
Message-ID: <forn7m5f2m6bwpspktrmjzvxcezcmoqyuuclu64x77uxdo5c5u@fcg3kphdb5re>
References: <20240422065756.294679-1-aravind.iddamsetty@linux.intel.com>
 <20240422065756.294679-5-aravind.iddamsetty@linux.intel.com>
 <2sls3mnsjhd3zo2e7qel5zsc5zgrtv7sby3xvsh2yf5elnvjks@mulhpzx3lxjk>
 <39f107b3-f95d-4a60-989c-c39aac33303c@linux.intel.com>
 <gnauhvd3q5i3qe33suveqxmoxin3xhvlbslcfxiv76qvf27rxi@c6dwq3xgcjbz>
 <f297b6c9-2352-45a0-8eea-3e6956ddd1ce@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f297b6c9-2352-45a0-8eea-3e6956ddd1ce@linux.intel.com>
X-ClientProxiedBy: WA0P291CA0012.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::7)
 To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY8PR11MB7010:EE_
X-MS-Office365-Filtering-Correlation-Id: 832d158d-d877-45a0-7b8f-08dc658b4e0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STJyVkxZNFVHQzVQT3N3M2w4VFR3aFlaaGRMbmhRRUk3TmRGTWlmOVZEd1RV?=
 =?utf-8?B?cmtmRmtFMmNjMlp4UWs5Q0J4YjMvbjVha1p2Nk5FU2JyRWVsclQrenR2WXE3?=
 =?utf-8?B?S2VXWmU0akJQSXkyNmJROVRyTnEzU1pQUDVmZ3BJOEZiVU1wV09jQkE1N0Jm?=
 =?utf-8?B?RFlYYTJqdkEvZ1lNWEZOWHQyTTEzMVdpcEhZT2taUjR6cHZQdmlBZy9CdzAz?=
 =?utf-8?B?bTYxK1N1R3IvUWU2TFJYVEh2WVE2c1dQeVVCQ1hHS3FJZUI3NTk2dkZJWVNE?=
 =?utf-8?B?WTMwdzhWaUJ1ckNZMHBGM0tlSmhtQ1hMTGtxeTJLeXU3OVhNckZnemlVSFp6?=
 =?utf-8?B?KysxbnpwMVpBWk9JQTlFOVZmYmRKenZ3RHBFTUE0eHZwbm9QRm9rdHc4bHFE?=
 =?utf-8?B?Z0xkT045a1V5MzFUNzRXV3Z5clNwTWVVODB2VWJEemlrQWV0NHlMTkRzTUZr?=
 =?utf-8?B?QUJwTy83R29tSjN4a3RDeDhuRkllWjQxNEhKUDMvY3hYTFVFLzBuMVFQWjFs?=
 =?utf-8?B?OWNxalhGdzRFRjd5MWNadHVuS1RTeFZVQjJxcTVTZUVUUFNCS3puZ2FJYlc2?=
 =?utf-8?B?NnhEaThzVnJHTnhNaC96RTlEUzhIWVFWR3p5Z0pCSmJTbndmcFJINnJVN09Y?=
 =?utf-8?B?S3AyRW5xTFl2Y2tncmNJei9MUm9qNEJZbFJHREtaVW5iem9pL0Z6OTFvbkNm?=
 =?utf-8?B?aGJWcU54bDFnTGRROW1MSmlpL1B4Yy9jUlBqZ0NpRThEU2hTMSthUEl6V1lD?=
 =?utf-8?B?M1JqT012VkcxMjQyOXdmVFhaekh1alduN2psMnN2SkZBSUNpdFQwYVRmVWtL?=
 =?utf-8?B?Z20wQXR4aFAzbEVoNFdWTUk2QlNJNm1lNzZpMUdIWWZISXZxL0pDbnQvUEd0?=
 =?utf-8?B?cDB0ZXhYNFROdTBwSVdUQ1pXS1Z3SS8xQ0d4ZEJqaHU4SVd6MTgvVjl1eWtl?=
 =?utf-8?B?ajllWXdMS3ZqenVoRDZ2b1U2NG1xQ0hKTmVHVHNRWFNyY1hsa2NDT1pWbjNJ?=
 =?utf-8?B?bXMvdGo1c3A5cHkwcVA4SkRHNEdZL1FZWW9kbWlpeFBoZVBrd1lHZys2NlI4?=
 =?utf-8?B?U0Q5Y0E5ZVNEbVpSUzhjWDFlSlJUMVhZd2dtYUJxY0ZzM3Zyb2NQTURTSCtU?=
 =?utf-8?B?WGtyTU1BM3NSZnQxdTA4YmhzVmw4QWpNTWh6UjFnQVZBb2pDM1FTNDNSQ1hH?=
 =?utf-8?B?MXNDZ09IMVdBZU95ZTcwcHcyQndQVjdabXZxQmZiWXdXVkxaU0I0YURIalU0?=
 =?utf-8?B?YTJZZ2tYSjBBYWVKL2NENHh1ZlkyOEx2L1JpYWtMeGg4ZlBDeVRlVUI2Vlhm?=
 =?utf-8?B?eXI4YlR4Ylk3Zk9PWVRnVEMzSE1YQTNlRzdCbTY2Y0tSeisxSEZOcUg0TjNs?=
 =?utf-8?B?Z0xvZ0RndCtTbDl6bVVIL0I4QXRtN0JCT3hMVTlZQ245M0p6b3pmWjBuSW5G?=
 =?utf-8?B?dmRKVEkyVUh4WU90eElMMU5yN1lRQ0gzdmtrVG9Bd2w3U2NVZFJ6eG5uVDc1?=
 =?utf-8?B?aWx5eGx0VTFuUDBNdEZ5azErYlRNZVVMbEU5dHBHOW9jM2tFVjNGY01PUW9q?=
 =?utf-8?B?QXMrS3ZzWXJycE1zMm92SWdpWEtXaUNzMDQ1YnlJN1M3Q2Jnb1duYUs5ZFVY?=
 =?utf-8?Q?wcTPot+N19Vv8rzKDUMLwfrb7McNJvkUVPS8Lzy2Ymqs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bytjOHd6eEowQkN4ZGhxbmhzWUpCQ2cybnJ4QnJGRFU2bjNkNlZZVW9xVTlF?=
 =?utf-8?B?cEdFYUR2TVh2M1gwNUwrSWh5OG91K2tpNFBvMkRKQnp3eXFvaERLN2VNclVa?=
 =?utf-8?B?MGlTOGlPM0N1S29EWE5FVlpPTzhUaC84Y1ZjYldGZ2lqV04xUlNmM0YzdTlI?=
 =?utf-8?B?NER0OHEyd3hXdU1va2NHcThHNnc0aGdFQW1nbmZDeHM5RG83ZUtOQW1VY2ZE?=
 =?utf-8?B?Y3R3bzVSRmkrbFh3VDVXckhWdG00M1dQdVdleHFtVW9jK1dQeTJBZ21KRjND?=
 =?utf-8?B?ZE1MNEFMc25kSFJyOTAyOVNMVU1qbjBPcllDdFZ0RjlkWDRXakl1MW9NbVRB?=
 =?utf-8?B?RGpkc2krang4ZlkrdHRJb1hud0g4WUpxeHFMQVAvTk1mUkc1cUNQMXcwNXZz?=
 =?utf-8?B?WEhpUk9ubEllWGdEMzlUbUhwdVBCQVNKUU5pc2JGa055SEdEZVREV2Z0Tld0?=
 =?utf-8?B?SEdNVEJnRUZDWkJYUmdKWm0rSjYxUDZtdldaWlg4UllxQ0pzcVNONzhzaUVi?=
 =?utf-8?B?TzlCME5mQ1hEdXl3eU4yQmk5UDRicFRqOTZubCtiZ3VkQUtsRjd4ck84SXc1?=
 =?utf-8?B?VWVQK0Q2YnlOWEVrYnljcHNHODJTYTRQRHNWbjUyUXlPeEV0aEJnRURhQk9F?=
 =?utf-8?B?TmFpcVJEVTRlSFI1eDMzUWE4b0VkdHVqSGVGcEJxK3krRWFXOUU0Zzd5NDcz?=
 =?utf-8?B?SStnTFJnNjlkbVU3WnRuczJrcmhBc0xoUm9zTGxCaDNyc25ZZnpuZDNBaS9i?=
 =?utf-8?B?YzFwMVoyMUVaaVVDSmJIVUJJTERTV1BBQ1lRODArU2RuY2UyYkwxYlh3L0Vu?=
 =?utf-8?B?cDBrNVY5S3k3V1RINUw2TEdBUTd4dC9KQTBqbytGT1UyYnkwUGJrb01pTjZF?=
 =?utf-8?B?b1YwWFdZRHpGdGN6ZlZtQjlDK0VVUmpna1ZvWVgvMklFcXMrMzVCaWZTMnd5?=
 =?utf-8?B?TFNuYnhiQ2xPckp3dld2d0pwd2dKZkxIS0dUTkpIbTk5d2hCSGt0QS9Tcjdk?=
 =?utf-8?B?S1k0OTVaK3ZaTGgwVFMwOVBQWnJkOTZRQ0c1dW53eVFKMVZWTytLU2dvR1d0?=
 =?utf-8?B?b2kwMzhHNTJ5cXZTQ0taTHlWZk5XaG9tRUJYRGFDZmRzeFJ6MDdPWDVkM3BX?=
 =?utf-8?B?UTNoU0RlWENXbnJnaDNFelRwcG95WXErayt0NEp6cUdMVCtCOG5MWXlYajVp?=
 =?utf-8?B?T1cxVWZHdCtURTFsZlBkaE1QckUrVG5JMDQ4OXFFOUZrRlMwSlcyRFdHS1Ja?=
 =?utf-8?B?Kzl4ejNRWldaMk9rRVN0RTFUL1JEMHJSMWI0TDZJMU81Y1k2MldCQjN0MEx0?=
 =?utf-8?B?Q3h3OVJaTTUvbjBYUmlabWY4allXTldCTWlQTnQvcUJKSGIyWGFvYTREVlJz?=
 =?utf-8?B?WEU0NWdOdGlmZ1l6MittL3R6VlRiV0JLSHdENG13N2NseXlSRUF1UkVCcllZ?=
 =?utf-8?B?Y0VhVDV6L3R2L0dRMWw1em02aDhzc0NpanFaeVVaY1ZqOGgvK1lLNmZ1Q3pk?=
 =?utf-8?B?RmNiakRIZ0FqZk9QaVJyclQyeHE0S0RVaEh5K0VwNHlONmpPelpGd1NGNmVN?=
 =?utf-8?B?SCszVSsrSVlzcVRKRWRjTUtzMFZQOFM4ZEdoZGtKL25wN2hmdXBrajhqRVd1?=
 =?utf-8?B?VzVUZXBHMjc3WWQ1aWhoM2VZandRam53Q1JJVXhrOHA2RFBuNGRyN2d4bEM2?=
 =?utf-8?B?ZHdZRWl2NVNkTVI1enNja3I1QmxIYncxS3NkWnRSZzl3MExKK21YNmNYNExL?=
 =?utf-8?B?R0cvVWxTMVZ1eVJJN2pxdUoxbVhWZy9oK2xiVVdVdVQ2NHZYOVRteGovdXVu?=
 =?utf-8?B?MFdBVG1YRmxHa0c3S1k2T09tbmRSV0JSYkdKaWYrdmlXL3JYMUR2eG9adWRy?=
 =?utf-8?B?SGI2akVpeVlRUm5kY0Npb3B2bVlOcVBabUVvU3dSME9BYmp1RVNiY1hObUdH?=
 =?utf-8?B?RnVqd1dFekxLcDFFRTZ4T1BPSmZ0bEdJUG40RjNOUkVjVm5IL0h1Zm5XRnJa?=
 =?utf-8?B?T0hBSEpESUF1ZS9qZDgrQmRUblNRTkFBbGxodGkrbkE3WUFDelBaTG1zUVdt?=
 =?utf-8?B?TUtURlFnbVdmVXRuQmhRUW83UjNqYlY2MHdieGRWRXkrWmZCek9nUGZOeDNs?=
 =?utf-8?B?N2xxOXdOQitYN3A3d0pTeHZPaTZkZGhJcmRTQUM3ekxtQkZsaWU1elRibnhq?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 832d158d-d877-45a0-7b8f-08dc658b4e0b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 00:53:36.6621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gPFfCLYqAP7e0SaZKGGMWG/tDdwgv/xaK+L9tFsNmX//m0lkm8u6XtHjpGqXilDSE/zx6ZfK02BZMmErUUK0EE8IK8LW7MB91zKf5x7OXzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7010
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

On Thu, Apr 25, 2024 at 11:47:46AM +0530, Aravind Iddamsetty wrote:
> 
> On 25/04/24 04:59, Michał Winiarski wrote:
> > On Wed, Apr 24, 2024 at 10:42:59AM +0530, Aravind Iddamsetty wrote:
> >> On 24/04/24 05:19, Michał Winiarski wrote:
> >>> On Mon, Apr 22, 2024 at 12:27:56PM +0530, Aravind Iddamsetty wrote:
> >>>> PCI subsystem provides callbacks to inform the driver about a request to
> >>>> do function level reset by user, initiated by writing to sysfs entry
> >>>> /sys/bus/pci/devices/.../reset. This will allow the driver to handle FLR
> >>>> without the need to do unbind and rebind as the driver needs to
> >>>> reinitialize the device afresh post FLR.
> >>>>
> >>>> v2:
> >>>> 1. separate out gt idle and pci save/restore to a separate patch (Lucas)
> >>>> 2. Fixed the warnings seen around xe_guc_submit_stop, xe_guc_puc_fini
> >>>>
> >>>> v3: declare xe_pci_err_handlers as static(Michal)
> >>>>
> >>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >>>>
> >>>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >>>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> >>>> ---
> >>>>  drivers/gpu/drm/xe/Makefile          |  1 +
> >>>>  drivers/gpu/drm/xe/xe_device_types.h |  3 +
> >>>>  drivers/gpu/drm/xe/xe_guc_pc.c       |  4 ++
> >>>>  drivers/gpu/drm/xe/xe_pci.c          |  9 ++-
> >>>>  drivers/gpu/drm/xe/xe_pci.h          |  2 +
> >>>>  drivers/gpu/drm/xe/xe_pci_err.c      | 88 ++++++++++++++++++++++++++++
> >>>>  drivers/gpu/drm/xe/xe_pci_err.h      | 13 ++++
> >>>>  7 files changed, 119 insertions(+), 1 deletion(-)
> >>>>  create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
> >>>>  create mode 100644 drivers/gpu/drm/xe/xe_pci_err.h
> >>>>
> >>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> >>>> index 8bc62bfbc679..693971a1fac0 100644
> >>>> --- a/drivers/gpu/drm/xe/Makefile
> >>>> +++ b/drivers/gpu/drm/xe/Makefile
> >>>> @@ -117,6 +117,7 @@ xe-y += xe_bb.o \
> >>>>  	xe_module.o \
> >>>>  	xe_pat.o \
> >>>>  	xe_pci.o \
> >>>> +	xe_pci_err.o \
> >>>>  	xe_pcode.o \
> >>>>  	xe_pm.o \
> >>>>  	xe_preempt_fence.o \
> >>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> >>>> index 0a66555229e9..8c749b378a92 100644
> >>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
> >>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> >>>> @@ -465,6 +465,9 @@ struct xe_device {
> >>>>  	/** @pci_state: PCI state of device */
> >>>>  	struct pci_saved_state *pci_state;
> >>>>  
> >>>> +	/** @pci_device_is_reset: device went through PCIe FLR */
> >>>> +	bool pci_device_is_reset;
> >>>> +
> >>>>  	/* private: */
> >>>>  
> >>>>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> >>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> >>>> index 509649d0e65e..efba0fbe2f5c 100644
> >>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> >>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> >>>> @@ -902,6 +902,10 @@ static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
> >>>>  		return;
> >>>>  	}
> >>>>  
> >>>> +	/* We already have done this before going through a reset, so skip here */
> >>>> +	if (xe->pci_device_is_reset)
> >>>> +		return;
> >>>> +
> >>>>  	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
> >>>>  	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
> >>>>  	XE_WARN_ON(xe_guc_pc_stop(pc));
> >>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> >>>> index a62300990e19..b5a582afc9e7 100644
> >>>> --- a/drivers/gpu/drm/xe/xe_pci.c
> >>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
> >>>> @@ -23,6 +23,7 @@
> >>>>  #include "xe_macros.h"
> >>>>  #include "xe_mmio.h"
> >>>>  #include "xe_module.h"
> >>>> +#include "xe_pci_err.h"
> >>>>  #include "xe_pci_types.h"
> >>>>  #include "xe_pm.h"
> >>>>  #include "xe_sriov.h"
> >>>> @@ -738,7 +739,7 @@ static void xe_pci_remove(struct pci_dev *pdev)
> >>>>  	pci_set_drvdata(pdev, NULL);
> >>>>  }
> >>>>  
> >>>> -static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> >>>> +int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> >>>>  {
> >>>>  	const struct xe_device_desc *desc = (const void *)ent->driver_data;
> >>>>  	const struct xe_subplatform_desc *subplatform_desc;
> >>>> @@ -986,6 +987,11 @@ static const struct dev_pm_ops xe_pm_ops = {
> >>>>  };
> >>>>  #endif
> >>>>  
> >>>> +static const struct pci_error_handlers xe_pci_err_handlers = {
> >>>> +	.reset_prepare = xe_pci_reset_prepare,
> >>>> +	.reset_done = xe_pci_reset_done,
> >>>> +};
> >>>> +
> >>>>  static struct pci_driver xe_pci_driver = {
> >>>>  	.name = DRIVER_NAME,
> >>>>  	.id_table = pciidlist,
> >>>> @@ -995,6 +1001,7 @@ static struct pci_driver xe_pci_driver = {
> >>>>  #ifdef CONFIG_PM_SLEEP
> >>>>  	.driver.pm = &xe_pm_ops,
> >>>>  #endif
> >>>> +	.err_handler = &xe_pci_err_handlers,
> >>>>  };
> >>>>  
> >>>>  int xe_register_pci_driver(void)
> >>>> diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
> >>>> index 73b90a430d1f..9faf5380a09e 100644
> >>>> --- a/drivers/gpu/drm/xe/xe_pci.h
> >>>> +++ b/drivers/gpu/drm/xe/xe_pci.h
> >>>> @@ -7,8 +7,10 @@
> >>>>  #define _XE_PCI_H_
> >>>>  
> >>>>  struct pci_dev;
> >>>> +struct pci_device_id;
> >>>>  
> >>>>  int xe_register_pci_driver(void);
> >>>>  void xe_unregister_pci_driver(void);
> >>>>  void xe_load_pci_state(struct pci_dev *pdev);
> >>>> +int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent);
> >>>>  #endif
> >>>> diff --git a/drivers/gpu/drm/xe/xe_pci_err.c b/drivers/gpu/drm/xe/xe_pci_err.c
> >>>> new file mode 100644
> >>>> index 000000000000..5306925ea2fa
> >>>> --- /dev/null
> >>>> +++ b/drivers/gpu/drm/xe/xe_pci_err.c
> >>>> @@ -0,0 +1,88 @@
> >>>> +// SPDX-License-Identifier: MIT
> >>>> +/*
> >>>> + * Copyright © 2024 Intel Corporation
> >>>> + */
> >>>> +
> >>>> +#include <linux/pci.h>
> >>>> +#include <drm/drm_drv.h>
> >>>> +
> >>>> +#include "xe_device.h"
> >>>> +#include "xe_gt.h"
> >>>> +#include "xe_gt_printk.h"
> >>>> +#include "xe_pci.h"
> >>>> +#include "xe_pci_err.h"
> >>>> +#include "xe_pm.h"
> >>>> +#include "xe_uc.h"
> >>>> +
> >>>> +/**
> >>>> + * xe_pci_reset_prepare - Called when user issued a PCIe reset
> >>>> + * via /sys/bus/pci/devices/.../reset.
> >>>> + * @pdev: PCI device struct
> >>>> + */
> >>>> +void xe_pci_reset_prepare(struct pci_dev *pdev)
> >>>> +{
> >>>> +	struct xe_device *xe = pci_get_drvdata(pdev);
> >>>> +	struct xe_gt *gt;
> >>>> +	int id, err;
> >>>> +
> >>>> +	pci_warn(pdev, "preparing for PCIe reset\n");
> >>>> +
> >>>> +	drm_warn(&xe->drm, "removing device access to userspace\n");
> >>> Warn? Shouldn't it be info?
> >> I believe warn is appropriate as this is not a usual path the users apps expect
> >> to hit and as they loose device connection.
> > It's an expected path after issuing a reset via /sys/bus/pci/devices/.../reset.
> > DRM device disappearing - yeah, that's probably not expected, fully
> > agree on that.
> >
> >>>> +	drm_dev_unplug(&xe->drm);
> >>>> +
> >>>> +	xe_pm_runtime_get(xe);
> >>>> +	/* idle the GTs */
> >>>> +	for_each_gt(gt, xe, id) {
> >>>> +		err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >>>> +		if (err)
> >>>> +			goto reset;
> >>>> +		xe_uc_reset_prepare(&gt->uc);
> >>>> +		xe_gt_idle(gt);
> >>>> +		err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >>>> +		XE_WARN_ON(err);
> >>>> +	}
> >>>> +	xe_pm_runtime_put(xe);
> >>>> +
> >>>> +reset:
> >>>> +	pci_disable_device(pdev);
> >>>> +}
> >>>> +
> >>>> +/**
> >>>> + * xe_pci_reset_done - Called when PCIe reset is done.
> >>>> + * @pdev: PCI device struct
> >>>> + */
> >>>> +void xe_pci_reset_done(struct pci_dev *pdev)
> >>>> +{
> >>>> +	const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
> >>>> +	struct xe_device *xe = pci_get_drvdata(pdev);
> >>>> +
> >>>> +	dev_info(&pdev->dev,
> >>>> +		 "device went through PCIe reset, reenabling the device\n");
> >>>> +
> >>>> +	if (pci_enable_device(pdev)) {
> >>>> +		dev_err(&pdev->dev,
> >>>> +			"Cannot re-enable PCI device after reset\n");
> >>>> +		return;
> >>>> +	}
> >>>> +	pci_set_master(pdev);
> >>>> +	xe_load_pci_state(pdev);
> >>>> +
> >>>> +	xe->pci_device_is_reset = true;
> >>>> +	/*
> >>>> +	 * We want to completely clean the driver and even destroy
> >>>> +	 * the xe private data and reinitialize afresh similar to
> >>>> +	 * probe
> >>>> +	 */
> >>>> +	pdev->driver->remove(pdev);
> >>> Do we really want to do that?
> >>> First of all, that fairly unusual - none of the other PCI drivers makes
> >>> changes in the device/driver model during reset, which makes me wonder
> >>> if this is really what the user expects.
> >>> I would expect that the device is reset, but the driver is not unloaded
> >>> and previously created FDs are still valid.
> >> We cannot continue to work with previous instance of driver as post
> >> reset GuC , LMEM and most of the soc is reset, so  we need to reinitialize
> >> device afresh like in driver probe, hence we remove to clean the previous
> >> stale driver state and re-probe again.
> > GuC, LMEM and most of the soc is reset when we're doing S3 / S4, and
> > yet, we're not removing the driver in this scenario.
> ya there we are migrating the buffer from device memory to system memory, but I'm little
> doubtful if we can do that in case of reset as device might already be a bad state or error state.
> Also, that this is a reset and expectation is to have clean slate not resume from previous state.

We don't necessarily have to migrate - I'm just trying to highlight that
we do have most of the code needed to reinitialize the device extracted
as part of PM flows - there's no need to detach the driver from the
device in order to achieve that.

> >
> >> All applications are expected to reopen the device handles afresh.
> > Current UMDs are not handling that case.
> 
> strange then how is it handled today, without these callback implemented
> the only way to do FLR and recover from it is to unbind the driver->initiate FLR->rebind.
> also i do not think it is automatically handled the admin or privileged application initiating a 
> reset should re launch those UMDS.

It's possible to just call reset "today" without unbinding the driver,
and it's not a user error to do so.
The fact that the driver can't deal with it is a bug and the unbind ->
reset -> bind dance is just a way to workaround it.

If it is absolutely necessary to kill all clients - the driver could
just do whatever it needs in order to reinitialize on its own instead of
setting up driver-specific expectations for generic PCI-level sysfs
interface,
See e.g. what habanalabs driver is doing as part of its .reset_done()
handler:
https://elixir.bootlin.com/linux/latest/source/drivers/accel/habanalabs/common/device.c#L1381

> >
> >>> Note that messing with the driver model at reset also makes it difficult
> >>> to do a proper cleanup if SR-IOV is enabled, as PCI-core expects drivers
> >>> to remove VF devices during driver->remove.
> >>> Removal of said devices depends on pci_cfg_access_lock, which is already
> >>> held for the duration of the reset (wh
> >> I haven't verified SRIOV use case, i believe we can take this up as next step.
> >> Also, since this is not an automatic reset but a user/admin initiated i believe
> >> the onus can be on admin to close all VFs before initiating a reset.
> > That's not the contract for reset. It's not a "user/admin" interface,
> > there doesn't necessarily have to be an "interactive" user interfacing
> > with it through shell.
> > It's just a regular stable sysfs uAPI - it could very well be called by
> > application as well.
> the application issuing a reset cannot be a normal one it should be a privileged one,
> and not every application is granted that access eg; L0 sysman who initiates the reset
> takes care of closing all open connections before initiating a reset.

It's the kernel's job to make sure the reset goes smoothly - not
the userspace application that's using the interface (privileged or not).

> >
> >>> ich includes calling reset_done),
> >>> which will cause a deadlock.
> >>>
> >>> In current form, it also causes WARN if there are open FDs to DRM
> >>> device during reset.
> >> I did verify using igt@device_reset@reset-bound which has a open connection haven't seen this error
> >> but will re verify again but again certain warns are expected but driver reload should be successful.
> >> similarly here as well we can expect the admin to close any applications using the device before
> >> initiating a reset.
> > Can we expect this?
> > If we can - why are you stating that "all applications are expected to
> > reopen the device handles afresh"?
> > I believe that the expectation for reset is that it behaves simiarly to
> > the PM flows, which is mostly transparent to the users.
> Like I mentioned the definition of a reset is to start afresh from clean state
> and since we cleared previous state of device applications cannot continue to work
> without re initializing device connections.
> 
> and today that is the case even without these callbacks.

It's not. Doing reset today will result in both existing clients and new
clients to not be able to submit any work. Driver will just throw
multitude of errors, warnings and generally won't be able to recover
itself. Some of those warnings are WARNs, which means that the kernel is
now tainted (or it gets promoted to panic, on panic_on_warn systems).
There is a workaround that allows the user to avoid this behavior - just
unbind -> reset -> bind, and that allows new clients to be able to
submit work.
The series is just automating that - calling reset does the unbind and
bind for the user. It moves the workaround (unbind -> reset -> bind)
from userspace to kernel but that's not what the user wanted. If the
user wanted to destroy the device and create a new one - there's an
interface for that (unbind -> bind).

Thanks,
-Michał

> 
> Thanks,
> Aravind.
> >
> > Thanks,
> > -Michał
> >
> >> Thanks,
> >>
> >> Aravind.
> >>> [29357.277699] sysfs: cannot create duplicate filename '/devices/pci0000:00/0000:00:02.0/tile0'                                                                                                                            01:06:58 [142/47263]
> >>> [29357.286158] CPU: 7 PID: 3479 Comm: bash Not tainted 6.9.0-rc5-xe+ #78
> >>> [29357.305870] Call Trace:
> >>> [29357.308342]  <TASK>
> >>> [29357.310453]  dump_stack_lvl+0x139/0x1d0
> >>> [29357.314305]  ? __pfx_dump_stack_lvl+0x10/0x10
> >>> [29357.318680]  ? __pfx__printk+0x10/0x10
> >>> [29357.322450]  ? kmalloc_trace+0x1c1/0x3a0
> >>> [29357.326394]  ? sysfs_create_dir_ns+0x162/0x210
> >>> [29357.330861]  sysfs_create_dir_ns+0x195/0x210
> >>> [29357.335154]  ? __pfx_sysfs_create_dir_ns+0x10/0x10
> >>> [29357.339965]  ? strcmp+0x2f/0x60
> >>> [29357.343134]  kobject_add_internal+0x2af/0x600
> >>> [29357.347517]  kobject_add+0xfb/0x190
> >>> [29357.351028]  ? __link_object+0x1c7/0x280
> >>> [29357.354976]  ? __pfx_kobject_add+0x10/0x10
> >>> [29357.359093]  ? __create_object+0x62/0x140
> >>> [29357.363111]  ? rcu_is_watching+0x20/0x50
> >>> [29357.367055]  ? kmalloc_trace+0x1c1/0x3a0
> >>> [29357.370998]  ? xe_tile_sysfs_init+0x4b/0x100 [xe]
> >>> [29357.376016]  xe_tile_sysfs_init+0x91/0x100 [xe]
> >>> [29357.380868]  xe_tile_init_noalloc+0xaf/0xc0 [xe]
> >>> [29357.385936]  xe_device_probe+0x60c/0x750 [xe]
> >>> [29357.390674]  ? __asan_memcpy+0x40/0x70
> >>> [29357.394461]  ? __drmm_add_action+0x1ac/0x210 [drm]
> >>> [29357.399413]  xe_pci_probe+0x5dc/0x680 [xe]
> >>> [29357.403882]  pci_reset_function+0x108/0x140
> >>> [29357.408100]  reset_store+0xb5/0x120
> >>> [29357.411623]  ? __pfx_reset_store+0x10/0x10
> >>> [29357.415751]  ? __pfx_sysfs_kf_write+0x10/0x10
> >>> [29357.420149]  kernfs_fop_write_iter+0x1b8/0x260
> >>> [29357.424620]  vfs_write+0x5ce/0x660
> >>> [29357.428067]  ? __pfx_vfs_write+0x10/0x10
> >>> [29357.432028]  ? __rcu_read_unlock+0x60/0x90
> >>> [29357.436181]  ksys_write+0xe4/0x190
> >>> [29357.439612]  ? __pfx_ksys_write+0x10/0x10
> >>> [29357.443657]  do_syscall_64+0x7b/0x120
> >>> [29357.447348]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> >>> [29357.452423] RIP: 0033:0x7f4f1ff14887
> >>> [29357.456030] Code: 10 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
> >>> [29357.474761] RSP: 002b:00007ffe54e95068 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> >>> [29357.482343] RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007f4f1ff14887
> >>> [29357.489487] RDX: 0000000000000002 RSI: 0000559eb4076e30 RDI: 0000000000000001
> >>> [29357.496630] RBP: 0000559eb4076e30 R08: 0000000000000000 R09: 0000559eb4076e30
> >>> [29357.503775] R10: 0000000000000077 R11: 0000000000000246 R12: 0000000000000002
> >>> [29357.510947] R13: 00007f4f2001b780 R14: 00007f4f20017600 R15: 00007f4f20016a00
> >>> [29357.518174]  </TASK>
> >>> [29357.520539] kobject: kobject_add_internal failed for tile0 with -EEXIST, don't try to register things with the same name in the same directory.
> >>>
> >>> -Michał
> >>>
> >>>> +	if (pci_dev_msi_enabled(pdev))
> >>>> +		pci_free_irq_vectors(pdev);
> >>>> +
> >>>> +	devm_drm_dev_release_action(&xe->drm);
> >>>> +	pci_disable_device(pdev);
> >>>> +
> >>>> +	/*
> >>>> +	 * if this fails the driver might be in a stale state, only option is
> >>>> +	 * to unbind and rebind
> >>>> +	 */
> >>>> +	xe_pci_probe(pdev, ent);
> >>>> +}
> >>>> diff --git a/drivers/gpu/drm/xe/xe_pci_err.h b/drivers/gpu/drm/xe/xe_pci_err.h
> >>>> new file mode 100644
> >>>> index 000000000000..95a4c8ce9cf1
> >>>> --- /dev/null
> >>>> +++ b/drivers/gpu/drm/xe/xe_pci_err.h
> >>>> @@ -0,0 +1,13 @@
> >>>> +/* SPDX-License-Identifier: MIT */
> >>>> +/*
> >>>> + * Copyright © 2024 Intel Corporation
> >>>> + */
> >>>> +
> >>>> +#ifndef _XE_PCI_ERR_H_
> >>>> +#define _XE_PCI_ERR_H_
> >>>> +
> >>>> +struct pci_dev;
> >>>> +
> >>>> +void xe_pci_reset_prepare(struct pci_dev *pdev);
> >>>> +void xe_pci_reset_done(struct pci_dev *pdev);
> >>>> +#endif
> >>>> -- 
> >>>> 2.25.1
> >>>>
