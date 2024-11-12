Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFA19C5A5D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 15:31:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B8810E5F2;
	Tue, 12 Nov 2024 14:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a7oCfoKQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F29E10E5F2;
 Tue, 12 Nov 2024 14:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731421888; x=1762957888;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lnBoABzZTzWBewKPB/OyP1KKJreT+u59Ne4XnmGCRlg=;
 b=a7oCfoKQUVd0TzG4i+R1ut5IhaOnUGxwv+jhL4FZTHRjzF62vvEgfuit
 4KYRLX8JzO0jRxkMwxplJ3QakBOZn14RMUOAS6Xak0xcmQfA9StDo1BIy
 ppKFO58281nWdkxH+hNKW1bOq2uwdT/T7K+FsKBJ3GYwurdq7ugParDtJ
 DkZfLo2pZCj84EK6yMHBzy1RGxdSIdkRTjz+yz6wB319Ffrndm+S4Sk+v
 mcRC4WL9JFpI5KoL1mEDuxbXz4aCnfZKSVP10m2HAhSEpBM272dribMmi
 w122zEsAcvYiY0t8Kz0t5pBGTf6OCrT6LojlStMczO3+G6IWx6b0P4y1D g==;
X-CSE-ConnectionGUID: AHFgJ2ilQkyIljUmI9Z2xA==
X-CSE-MsgGUID: nWAYiOIcQiWAFa782MSE0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="30661125"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="30661125"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 06:31:26 -0800
X-CSE-ConnectionGUID: xFyGx96GRJGe2hcg8ejzZg==
X-CSE-MsgGUID: sUZxg+PLSkiEfgr3QaMUuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="88317674"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 06:31:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 06:31:25 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 06:31:25 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 06:31:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/AeMhc87TpUyxKkeUEwJFTqtrlrkBlY2RhdxVcm6yb41/6u2vmKoc4MidRLXpHDj2dNFvluPRikXore66KNlVUsli5wmyOGHA5imE4asLOLdVFuIkNq4Ulf7lp0T9e/JWNAGZTSMgNS4KJoEN0YkxStvqySAKkPN+E7LonLs9z/a/f/igS5/HRefzpFTL2KmZlWuqxTvRok0ZaGW0XzF5HvpywaaTPudZlrOyqtS9iqQ/+4YpY/tpiFdZkiZV634qB4YNOm8VAleYpBi/XaGzsNRzURdVCMhiDopYm8WUgA0M/38aGQ5u8Agh5Mxoxvmq0YAzb6GUSbQRE0kWyNww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qz3PJ1hkaobxcD5IOdj36coW6cx2u8HKzRmOqzOxfIw=;
 b=SEBg0kdV4AeTjKtKIiAON1KxB+XloQgKaKDSoofuB64FrbeByZ1JOy8MKJZN06f87HMQtMzru8mOh7BFubIlzjCKQ/3KI284NS2RLzZ6/LmQIklviQxK7SxhgVe2eS4ivh1x+4i9NbxKHFfx1sglZxWEFapR3n/2Yqej74j8hZBYGWx6ODV0ed2qJeVyx6QKw7pnuVa8OvEvdnWjBZ7TU6GG/SBnUJqa47XNw7wEe3DXi/tJM/XULRdB6uBwDaRvU8OxgsOu8JoUk97jST/WxhAOle5oKu8/kTl99Zzogu/hyl1A1cXT/tchbx5YBJRhZ50F6KT8Gxs58WCZJMgDWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB6523.namprd11.prod.outlook.com (2603:10b6:510:211::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 14:31:20 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 14:31:20 +0000
Date: Tue, 12 Nov 2024 15:31:16 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v4 5/7] PCI/IOV: Check that VF BAR fits within the
 reservation
Message-ID: <gu2dw2djqwghzmu2r5xosd2y6w5dtlweay7eprcsegogqupn6y@niv2p72xqxrj>
References: <zbazqug3u77eiydb7p6p6gexwowrjcdl52cszczuww4xow7ebc@tke7k5hewrn5>
 <20241030165501.GA1205366@bhelgaas>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241030165501.GA1205366@bhelgaas>
X-ClientProxiedBy: BE1P281CA0375.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:82::9) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB6523:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a511129-c2f9-4cad-1530-08dd0326acc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KzFta3RNVlQ4L212ZDdhSDBTZ2RLWWw2S0w1OXpTam1JZUkvSUlITXlHanM5?=
 =?utf-8?B?NzVveHNJUjlLOENoTXVnL2c2VStoTkU2SWs1MUlKUmxOa1NXL25IbkRFejIw?=
 =?utf-8?B?S29PY2I0M0ZUbXBEYW5JNVI0L2NBMm8vK2dwUGxKWXpWQkxwVFRpaVo3aklP?=
 =?utf-8?B?ZWNqYlExZkhERmdERlN3ZDJGb0UvZ1BOSW11WWo3WU0zNFErd2txcnVsZTlP?=
 =?utf-8?B?ZlZ2aFFuTUdOUmZ4SFpVdEZDVXc4TEpOeEdRRkk1V0tyQnVnNmp5bEZ3aDBy?=
 =?utf-8?B?MkYzNjNxaGhlR1dVSFpObTB6amFCazBiZTIvQUg0Ym52ZFhtczBhZ2VQU0ly?=
 =?utf-8?B?dEdkZnVmcUtQWHJVTDVGc2ZxdjNYSFhwR1VSWCtURllwVWJRMEJRM1gwZEw5?=
 =?utf-8?B?dmNSVFh4NG1ucFJFbmVycEpic1QxTm5JbGdLRVF0NGhhMTBya3VuWDdYWEVZ?=
 =?utf-8?B?MER6MkVIZGJhV3Jja2JmYnpQcisvUjNqTlNtbGNSbzRaTjI0aVJEKzFrR3Q5?=
 =?utf-8?B?SXNDMGN6NW5TdUZKRFloQWVROE1HQS8vYXlQVGc2T1hzdnN1aUhNU2xOSnhT?=
 =?utf-8?B?MzRpZE4vcGhGT1JodGt6TVNaSGlmQjZwVmVOUHpsZ0laUkJmc0ZzTHZBSFpr?=
 =?utf-8?B?dFdwVUx2ZU0wdk8relM5N0N1UktKQmNGWG5ZWFVpS2lXOFVRMUpNVVMrWjhT?=
 =?utf-8?B?bkxRQlFkVS9MeW5iQ2hKQXp3MFM0T3l3VjVERUFtaFVyWDVrUGd4djJDaVRu?=
 =?utf-8?B?Vy82WHhDV1l5VjNEVmtuc054dDFEYWhPd2NjSTRNU2I3SmNpUE9NYkR0UVVr?=
 =?utf-8?B?MnY1eVV2a1FZNkFIeVNIcHRkOEtpSVVPRUc4WDhVMnR1YUZsSnlaaWt6UlRL?=
 =?utf-8?B?ZS8wN3d4TDJDVmtPbk51MDIyb21DRGRocW5jRWF5U3k1ZjExMUo3RnpvVkRN?=
 =?utf-8?B?cXl3c0wyUDNWWmY3a0RaMHF4SDdUOEd2Q1lGcmhsSVB6Ukxzekl4MXZzVkhj?=
 =?utf-8?B?UkFtK3hTQlY4b0F6bGNISDdzd2wvb3BIb1dWUWc4dmw1c2lnd2NiK2hPU2VZ?=
 =?utf-8?B?cmcyRTR3ckUxR1N0VGRYT1BIS1pqZ0orYVZJVG5YVTFyczh3UVhlSEcwZHQv?=
 =?utf-8?B?anpGZjdtb1B2L3laVEtnbkFtS0ZSUmlZaVpwUkR5aGtIUFoxbEZMUm0xYXpB?=
 =?utf-8?B?Mm9FS3JoMEs5TVlTTzVLYXFFQnVPMDJ0QTNFc0p4NDB2NWJRWFJ4MW1TNWZs?=
 =?utf-8?B?c0hiaEY2UzNZYnBqQ1FYMW5kTFdjcEFJRUxPcWdjVUdHYWwvOGNOYmJTakJY?=
 =?utf-8?B?TFN4UUtQYkE0Q3lmSllvM2Mwcmt2R255Y3lRek5mcHJyM01vRGt3UnpMc2FH?=
 =?utf-8?B?VmZEcW5jVDJsSTdOeC81Q0t5Z0ZvRC9nYnBkRitLZTBYRURWRmlZelovVGsz?=
 =?utf-8?B?VE8yMzRVcG9lMkZIQUh6b1dLSGlBME15SFZEOTdIb05taDBXYWlNYVBieDRR?=
 =?utf-8?B?U2hCaklCRzRpbUpKQXFXemcvZDFvaklUV21FcGZoTGdIOUkyR0tyMEUzTDBF?=
 =?utf-8?B?Y0htVDlsMG9LbEhvR3ZoL2swS3h6SU82YlEvd09GeUVObW1yN2QyZWRjMk1o?=
 =?utf-8?B?bitZQ3BVR0hiKzAxNnZ6OGhwMk52UVJvNnQ1RTVLbzJiQmZXWEZ0ejB2ZlpL?=
 =?utf-8?Q?HCYz3it9F1wVfqGocAY4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2RoOXFEYWoveG4vWlJqRTBHOXhlZzBSTm5yR2Y0dkRaNWhTd0Y2S0pVeXpF?=
 =?utf-8?B?V3UxZ1VvMjlLditTZGU0QWs0Wmcxaitkb0J2MlVMeUkxbEFaUmFlVjZzWnRu?=
 =?utf-8?B?N3lIWERmcFloN3ZzQzFaR1RtSnNWeFV4ODlybDdaUFZRdmRxQitXZlN2Y1U0?=
 =?utf-8?B?TVZ5ODR1MEUvMFpnd0pKODhYSVJOZlBpMndseS8wVFZxclFYS3RxT0NXR2Ri?=
 =?utf-8?B?M0dHQ1BVZm5kWVp3VG5Zdmdsam1GUkowcmpkL1FRVGxuNG02U1JxWTdaQ1BJ?=
 =?utf-8?B?TVFRRXhjZmFGNVJla0xSNmFlS1pDYjFYeENPN1R6UCtpZmJsTlRxSzdVWGN4?=
 =?utf-8?B?VVc2SEZZVmQ5d2hmaTZ0SFFMaUlyc3Mrb0hLWUlaa01laUxFdTZTelA4UzFH?=
 =?utf-8?B?VGdWUlNxSmVpTXIxTjdJNE1EUUNFV3d2WDFGeEdYc1pZaEdPb1NpUG1tZ3pU?=
 =?utf-8?B?d2FmOEpWblEybjdvMnEzZmg4SmJWOEZHM1RHRGx5TnpaTUp0NnJpekcxM1Jv?=
 =?utf-8?B?SmRPZTlqSlRydnRsUFRwMzJ2LzdVYjg1RnZ4MmlVQ0svNVRXRmJ3Zzd4U0pU?=
 =?utf-8?B?UkxTN3hwazIvYUFnNTRvZmc0RXVFLzA0bWlqSTlOSkQrMGF1ODBlZFZobXpi?=
 =?utf-8?B?UmNqVThuMEU5dGlpTWVkNWdocGo1YjQ3LzJIa21NWXV4MGcyTmJpWVpCcTRV?=
 =?utf-8?B?d2doa0w3clVlNGJKUVUwQzYvZjlGTUJxdXRRN0Y2bmhsbHVSUXBabTAzWTll?=
 =?utf-8?B?Z2IyclVFeWRIeUZSWXRWY0lhQ0M4ZUZCNGkxanZHZlZLaG9WQ3JGcEM1b2Nj?=
 =?utf-8?B?RW11dFRDV0h5cWdlNGpZWTdZK1JRUTVuYmQ5QlhlYlNGVWNvcEJTeXNDRDcx?=
 =?utf-8?B?UE9OWWZRWHBQOWc2cC9RRU9XOUlUZk9rMzFvaldneFR2eTBUZWpzRHU0YjFa?=
 =?utf-8?B?cDVHT2ljdk9zbzBLYkRLc2t4THF1RERQMkJMbjdNdldDSDdTbzNXUnVOenRw?=
 =?utf-8?B?bW52cjBLNlN1Q1Z2RFFaVWx4MEVrVWNhQ25BUHhvc2ZJamJZODdURk5TS0cr?=
 =?utf-8?B?S0tyWEtad1hBcVdET1phamJNenVHY2gwd2liTVhUMWlvcjVxNzBucmtIQ1J0?=
 =?utf-8?B?cG5NZVFhY0d3NWJnMUt1eUVQTmdHYWFUQTN3VE0veGV2RUY0YU10a1RrWmcw?=
 =?utf-8?B?S0dCMTdGMzR6aVVvdlRLT21FR2VlTTd4eEFPVW1KbGhGTmc5dGdmWjhBUE81?=
 =?utf-8?B?TS9mRjJFVUZVOXVOeEM0ZXorRDRvYlhGcm9WbmxsZUlzemlKWjAvcVY5MmdV?=
 =?utf-8?B?aUJkUUlUTHFWeFR0OUxCVzVOVURzOHJHRVQvSWwvVnd1dDFoeTgyWTA2RGMw?=
 =?utf-8?B?clNFU3hlV2ZPNXdRblcxUTArQ2JacHJlcFUzQTFBZGpxWS9IUVZqd2IvV0tR?=
 =?utf-8?B?VjJKWDYxVHlxbGM3RzJ5TWVKRUJFNHF4SDcydVJYVFZLOGZ4NnlWTHFFUEtk?=
 =?utf-8?B?d1ZiRXpMS1hpQ0lDOExrVHlmbDcyQmNrZktzc3pOS0JIejR2R3p3eXEyenZo?=
 =?utf-8?B?U2xCdldBaSttSmRCS3FuNWNkQ3Fjd21zWTloWGNGc1ZDSzJjci96WFRIZHd2?=
 =?utf-8?B?b0ErNHViR1RFOFJuSndNNHdpSGZzSlJGcnN4V0cvVEFtQjV3SkdDSW4zNmMy?=
 =?utf-8?B?ZENRaHFrNE8rck5DY0lWa3RXWVFid1hvL2kxUzNyMkpqK3YxVGtCMTlndXhh?=
 =?utf-8?B?emxxOFRPMzNMWmNoOENyS2VRZ0x5OHh1SlNhS0didnVJcFVJTkhWZFpxUkZJ?=
 =?utf-8?B?WWhyOERCYzBiR2dpNFRaTkFqQlRXTHZCam1yVmRkMlEzWG1POUhJUk5JbUF2?=
 =?utf-8?B?aVBha1JxbmJnMUVyckFpcHZhNlhaeVpVOUFQYzNWZ3lPVXRlS3VmVUZEUW8y?=
 =?utf-8?B?elRMaW1JU0ZhUllUQkx0VFRjaHFHYWVkamlkdFQycml3T05xVlFRTkc3VVhH?=
 =?utf-8?B?T0tRUG9pNy9lUm9rdHJtYUpUcUpKSS9JbzJ6N3VBZU4yclBJZjBlbnVGOHp3?=
 =?utf-8?B?dm9aVXpQZ04yVWYxT25iVHd4dExheWMraUk5S2RQSkp1N0JDTGhXNHVXZ3cx?=
 =?utf-8?B?cHRMZUNyRnpoMUxKMklBbUR1Ulo0alpmODZ5c0dsVE5LV25YTjhSVm85Mk1Z?=
 =?utf-8?B?SWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a511129-c2f9-4cad-1530-08dd0326acc2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 14:31:20.0813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wdJHc3//mCkjbkuegmF7c1VejUcDo0Dp96QRBrw1LNLsL7qxkB/65HH9zDs7PFy99j72WfguQzt6CWknfMub4m28B0PDgiLVUbW1dpr8HuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6523
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

On Wed, Oct 30, 2024 at 11:55:01AM -0500, Bjorn Helgaas wrote:
> On Wed, Oct 30, 2024 at 12:43:19PM +0100, Michał Winiarski wrote:
> > On Mon, Oct 28, 2024 at 11:56:04AM -0500, Bjorn Helgaas wrote:
> > > On Fri, Oct 25, 2024 at 11:50:36PM +0200, Michał Winiarski wrote:
> > > > VF MMIO resource reservation, either created by system firmware and
> > > > inherited by Linux PCI subsystem or created by the subsystem itself,
> > > > should contain enough space to fit the BAR of all SR-IOV Virtual
> > > > Functions that can potentially be created (total VFs supported by the
> > > > device).
> > > 
> > > I don't think "VF resource reservation ... should contain enough
> > > space" is really accurate or actionable.  It would be *nice* if the PF
> > > BAR is large enough to accommodate the largest supported VF BARs for
> > > all possible VFs, but if it doesn't, it's not really an error.  It's
> > > just a reflection of the fact that resource space is limited.
> > 
> > From PCI perspective, you're right, IOV resources are optional, and it's
> > not really an error for PF device itself.
> > From IOV perspective - we do need those resources to be able to create
> > VFs.
> > 
> > All I'm trying to say here, is that the context of the change is the
> > "success" case, where the VF BAR reservation was successfully assigned,
> > and the PF will be able to create VFs.
> > The case where there were not enough resources for VF BAR (and PF won't
> > be able to create VFs) remains unchanged.
> > 
> > > > However, that assumption only holds in an environment where VF BAR size
> > > > can't be modified.
> > > 
> > > There's no reason to assume anything about how many VF BARs fit.  The
> > > existing code should avoid enabling the requested nr_virtfn VFs if the
> > > PF doesn't have enough space -- I think that's what the "if
> > > (res->parent)" is supposed to be checking.
> > > 
> > > The fact that you need a change here makes me suspect that we're
> > > missing some resource claim (and corresponding res->parent update)
> > > elsewhere when resizing the VF BAR.
> > 
> > My understanding is that res->parent is only expressing that the
> > resource is assigned.
> > We don't really want to change that, the resource is still there and is
> > assigned - we just want to make sure that VF enabling fails if the
> > caller wants to enable more VFs than possible for current resource size.
> > 
> > Let's use an example. A device with a single BAR.
> > initial_vf_bar_size = X
> > total_vfs = 4
> > supported_vf_resizable_bar_sizes = X, 2X, 4X
> 
> In addition, IIUC we're assuming the PF BAR size is 4X, since the
> conclusion is that 4 VF BARs of size X fill it completely.

The PF BAR is initially sized based on VF BAR size [1]. So yeah - that's
the assumption for the initial state (prior to doing any resizing).
For VF PCI device BAR 0, it would be PF PCI device resource 7 (and it's
programmed using PCI SR-IOV extended capability - so slightly different
path then regular PCI BARs).
Note that this resource is completely independent from actual PF BAR 0
(resource 0), which is why I'm calling it "underlying resource" or
"reservation".

[1] https://elixir.bootlin.com/linux/v6.11/source/drivers/pci/iov.c#L807


> > With that - the initial underlying resource looks like this:
> >             +----------------------+
> >             |+--------------------+|
> >             ||                    ||
> >             |+--------------------+|
> >             |+--------------------+|
> >             ||                    ||
> >             |+--------------------+|
> >             |+--------------------+|
> >             ||                    ||
> >             |+--------------------+|
> >             |+--------------------+|
> >             ||                    ||
> >             |+--------------------+|
> >             +----------------------+
> > Its size is 4X, and it contains BAR for 4 VFs.
> > "resource_size >= vf_bar_size * num_vfs" is true for any num_vfs
> > Let's assume that there are enough resources to assign it.
> > 
> > Patch 4/7 allows to resize the entire resource (in addition to changing
> > the VF BAR size), which means that after calling:
> > pci_resize_resource() with size = 2X, the underlying resource will look
> > like this:
> >             +----------------------+ 
> >             |+--------------------+| 
> >             ||                    || 
> >             ||                    || 
> >             ||                    || 
> >             ||                    || 
> >             |+--------------------+| 
> >             |+--------------------+| 
> >             ||                    || 
> >             ||                    || 
> >             ||                    || 
> >             ||                    || 
> >             |+--------------------+| 
> >             |+--------------------+| 
> >             ||                    || 
> >             ||                    || 
> >             ||                    || 
> >             ||                    || 
> >             |+--------------------+| 
> >             |+--------------------+| 
> >             ||                    || 
> >             ||                    || 
> >             ||                    || 
> >             ||                    || 
> >             |+--------------------+| 
> >             +----------------------+ 
> > Its size is 8X, and it contains BAR for 4 VFs.
> > "resource_size >= vf_bar_size * num_vfs" is true for any num_vfs
> 
> With the assumption that the PF BAR size is 4X, these VFs would no
> longer fit.  I guess that's basically what you say here:

Exactly - it wouldn't fit, unless we resize the underlying resource as
well.
Which is what the successfull call to pci_resize_resource() with size =
2X, will do.

> > It does require an extra 4X of MMIO resources, so this can fail in
> > resource constrained environment, even though the original 4X resource
> > was able to be assigned.
> > The following patch 6/7 allows to change VF BAR size without touching
> > the underlying reservation size.
> > After calling pci_iov_vf_bar_set_size() to 4X and enabling a single VF,
> > the underlying resource will look like this:
> >             +----------------------+ 
> >             |+--------------------+| 
> >             ||░░░░░░░░░░░░░░░░░░░░|| 
> >             ||░░░░░░░░░░░░░░░░░░░░|| 
> >             ||░░░░░░░░░░░░░░░░░░░░|| 
> >             ||░░░░░░░░░░░░░░░░░░░░|| 
> >             ||░░░░░░░░░░░░░░░░░░░░|| 
> >             ||░░░░░░░░░░░░░░░░░░░░|| 
> >             ||░░░░░░░░░░░░░░░░░░░░|| 
> >             ||░░░░░░░░░░░░░░░░░░░░|| 
> >             ||░░░░░░░░░░░░░░░░░░░░|| 
> >             ||░░░░░░░░░░░░░░░░░░░░|| 
> >             |+--------------------+| 
> >             +----------------------+ 
> > Its size is 4X, but since pci_iov_vf_bar_set_size() was called, it is no
> > longer able to accomodate 4 VFs.
> > "resource_size >= vf_bar_size * num_vfs" is only true for num_vfs = 1
> > and any attempts to create more than 1 VF should fail.
> > We don't need to worry about being MMIO resource constrained, no extra
> > MMIO resources are needed.
> 
> IIUC this series only resizes VF BARs.  Those VF BARs are carved out
> of a PF BAR, and this series doesn't touch the PF BAR resizing path.
> I guess the driver might be able to increase the PF BAR size if
> necessary, and then increase the VF BAR size.

No - it is possible to resize the PF BAR as well.

In addition to adding pci_iov_vf_bar_set_size() /
pci_iov_vf_bar_get_size(), the series expands the pci_resize_resource()
function, so that it can accept IOV resources (PF BARs 7+, or
"underlying resource" for VF BAR).
The usage of pci_resize_resource() for IOV resources is the same as for
the regular PCI BARs, with the caller expected to release all the
resource prior to resizing it (as the bridge windows may need to be
reprogrammed).

> It sounds like this patch is really a bug fix independent of VF BAR
> resizing.  If we currently allow enabling more VFs than will fit in a
> PF BAR, that sounds like a bug.

It's not really a bug fix. Without the ability to control VF BAR size
independently of PF BAR size (via pci_iov_vf_bar_set_size()
/ pci_iov_vf_bar_get_size()), PF BAR size is always tied to the VF BAR
size and the total (max) number of VFs supported by the device, so
there's no need to check if the "nr_virtfn" will fit - as "nr_virtfn" is
guaranteed to be smaller than the total number of VFs supported by the
device.

> So if we try to enable too many VFs, sriov_enable() should fail.  I
> still don't see why this check should change the res->parent test,
> though.

The logic for res->parent isn't really changed - we are still failing VF
enabling if the resource is not assigned.

Previously we were incrementing resource counter if the resource is
assigned:

if (res->parent)
	nres++;

Now, we're not incrementing the resource counter if the resource is not
assigned or if it is too small to fit all enabled VFs:

if (!res->parent || vf_bar_sz * nr_virtfn > resource_size(res))
	continue;

I can split it into two conditions, if you think it would be clearer:

if (vf_bar_sz * nr_virtfn > resource_size(res))
	continue;

if (res->parent)
	nres++;

-Michał

> 
> > > > Add an additional check that verifies that VF BAR for all enabled VFs
> > > > fits within the underlying reservation resource.
> > > > 
> > > > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > > > ---
> > > >  drivers/pci/iov.c | 8 ++++++--
> > > >  1 file changed, 6 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
> > > > index 79143c1bc7bb4..5de828e5a26ea 100644
> > > > --- a/drivers/pci/iov.c
> > > > +++ b/drivers/pci/iov.c
> > > > @@ -645,10 +645,14 @@ static int sriov_enable(struct pci_dev *dev, int nr_virtfn)
> > > >  
> > > >  	nres = 0;
> > > >  	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> > > > +		int vf_bar_sz = pci_iov_resource_size(dev,
> > > > +						      pci_resource_to_iov(i));
> > > >  		bars |= (1 << pci_resource_to_iov(i));
> > > >  		res = &dev->resource[pci_resource_to_iov(i)];
> > > > -		if (res->parent)
> > > > -			nres++;
> > > > +		if (!res->parent || vf_bar_sz * nr_virtfn > resource_size(res))
> > > > +			continue;
> > > > +
> > > > +		nres++;
> > > >  	}
> > > >  	if (nres != iov->nres) {
> > > >  		pci_err(dev, "not enough MMIO resources for SR-IOV\n");
> > > > -- 
> > > > 2.47.0
> > > > 
