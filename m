Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0719CACEBD8
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 10:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76DE910E82E;
	Thu,  5 Jun 2025 08:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NRboUpVx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4012D10E80F;
 Thu,  5 Jun 2025 08:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749112149; x=1780648149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=UPLg6GUF9vYtyxrWcPgE3FKDrb9f7SOUdTWG3w7LAhQ=;
 b=NRboUpVxPtRt61yMOhYeWeWd8VMstjkBIXcuVfaN/Zftk0YKesjzGI03
 Q/z3cuQgujilYcWNnZqzwuq7CQ8EL2qmpsLqj+nMS70c18ZOLV4vqTUUC
 OFEhomdONqvTIj6STjhSEMAA9qP9nllL+RfmqZr5fpQFxvo2Y+szuxDLk
 XczdhrCGLI+uQ0QmocOViWmG2FDVi6zh2dL9Llo4Pz7mD+Fx5Qqfgb5az
 87lXFbL4TqBSoP4PTaQ4gTtqZ4PgjYHkliK+ELtNdG3lN29jZq5ockYdf
 5C1p7JbtiK9f82NEwtz0xO5/U6ifP1FjhbRMM74JqQ9WU9y5YeDn8M5V+ g==;
X-CSE-ConnectionGUID: 2NOKXqI4RO+/y1JWz/kGjg==
X-CSE-MsgGUID: RiqNEbUPSImdDRTCc2IVDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68771636"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="68771636"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 01:29:09 -0700
X-CSE-ConnectionGUID: ml+CTKqFS6WAKsUTWMoBRA==
X-CSE-MsgGUID: fTBI1Y7JTRKireApia7w9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="149274089"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 01:29:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 01:29:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 01:29:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.50) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 01:29:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENMlgmCx1Lxv7DOZcpZQtURwfSnZtrTJz5N68RFgjzcfONtKLhtUm/GPk9DkBIPCNH/UoABX8hMIY29ZVZORaeuGxWBfJ7VoLVwea/3cI0iSvweU5JwXW8KCaBkfanZ510uWP27Kw7wD4SAUCr3qoDDKIuNU3jh7EIL8RUWnVL4DedffCKsvOvmDmkqomUnYQWnDECqMRW2B0BpNDAF7C4HaFgNGxakPB8J7JqHgjCYiy7cdDEoAd82rtaP0fXUIQ27wNtdBfM+QztEN2EbtSNRtRYEeLhy6sc21Cty7z2zCdPXpZqkMOmNFEVpq4MLUUz/EGRcEIdgsl6c3bkTIDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWioKjQLdDncDdmUyAGXDn7g+0RuCpwe1uyjqNkO/60=;
 b=GtOnpp0FH/9jIf8wEDCbmZ3N26yn/zInFDukeZ7rj/XQPSPI8b2g2FI8A5y2bxF7QNBGVbFuVzr2+rn2nh1JUfsR8FE09A9nFSpQsBvM87JRbk5hrxI0ewwDPbtoQfoC7Phg5d96ysyCQyrR93gxLsfZqJHN5FmVPK43vSh3anVoRQX7EVmYNmCf5zrx8pl8Je+/hQZlOuNIXC6301382S9SQBpD/mEdqdsGCvgLfHGAJPyKE2Y7c2/rL4QxlTMKVJ30wmGPxTa7z+eggE1Akyz40IHmXbxFFt06YsbnSRyOZC7+f9WmpcGQ0LznEhqAWNqFwcCn2ygXHl54WQZk+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CY5PR11MB6439.namprd11.prod.outlook.com (2603:10b6:930:34::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 08:29:05 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%2]) with mapi id 15.20.8769.037; Thu, 5 Jun 2025
 08:29:05 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
CC: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v3 3/5] drm/edid: Add support for quirks visible to DRM core
 and drivers
Date: Thu, 5 Jun 2025 11:28:48 +0300
Message-ID: <20250605082850.65136-4-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20250605082850.65136-1-imre.deak@intel.com>
References: <20250605082850.65136-1-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::23) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CY5PR11MB6439:EE_
X-MS-Office365-Filtering-Correlation-Id: 9040fe98-1396-466e-52f6-08dda40b0851
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UjBLWFhsQ2NuWFVoSnNVaXdQSjNIM3Ntazc4a3lLT0paTFp4QVB0R25RUmtY?=
 =?utf-8?B?c1JMYmM2RmxydUw2L1paNjJPV1U0R2dZSjNyZHlUVVNzU3NHWFJ2TDVuQS90?=
 =?utf-8?B?T3lwTllaWXh1anZoYmFjc2xtN2Zva2docEZ1aTFjRVVUdi9aeVVESGVFWDBH?=
 =?utf-8?B?R2llUGdTZkdQcU1WSHNGQXI5YTJFNVpwVjc1R3I2YkYwMlNScU1YN1QyM054?=
 =?utf-8?B?WWtHODVEcWh5MmdlTHl6aFdYTkJ4V21GRldpTHpaSXAwZ1VmcElSS2I3aGVZ?=
 =?utf-8?B?eHJ3bEF0YTVLaVpSOUlTTlpzd1FRcE55RzBmR2hzYmluaWtsNEFVL0wvVkNC?=
 =?utf-8?B?UVc3azFkMGdKQmN1R2E1NEdhNVhRcXNNSVU2bGxEbno3NnZ0RmZCNnl4SHZo?=
 =?utf-8?B?VnN0TFFqUURWTG5IYUQwa3Vqdm5YWjdSblI5TnBQOHVFalduNmZwOE9RL05t?=
 =?utf-8?B?RDVvM0dmMlVVZ1pLZGdCWEZheE1Gd1lhOGRmN0MxQ0FMeDdhZDJNRGJXWW1n?=
 =?utf-8?B?QkJYc0lpQjVXemhBNkpnb0kxaHVxak01dFM5cXY3RlVWVDgyczdMVVU4Rzdz?=
 =?utf-8?B?TXN0Qm1VWUFucmZNYXQ5ZU1VV2FOU0tPQUNsTzduTHZEQzJ5S3BTUXZyZ043?=
 =?utf-8?B?d1lOMjRPUE11TnFuQ3VjakVpeXZrNjVML0FST29PQ3Vhc1YzMjZvZjFVVTVM?=
 =?utf-8?B?eWVyL2dhSDQrTUc5Q3VlMS9COVc4MjBZQjJzcldxRnk4SW95YnZPSXVpK1Bs?=
 =?utf-8?B?QWNWUkRKem8xNXdBeE40SnhkdC9IR0hocy9vaVNoMjFGaFpRZEF4UDZ1aWIx?=
 =?utf-8?B?UUxzUEZ2cXNPTFlNYVIzaHUwc2czZUU0a0c1cm1QOTBJcGkyMjhIbCs3ZDMx?=
 =?utf-8?B?NCtBR3lnbGZQTS9TcjQ2aWhCcWVXaWNZZ2w5NkZGVWdhZXdQaGlmUmVzZDdD?=
 =?utf-8?B?N0JPZUJvMERpQWsxSEdybUN0dUlwSHlXQ3FSOHZRaEI5T3BSRmovcnlGQk9F?=
 =?utf-8?B?QnB3Y1NnMExDb2E4djZFak5RdnRlSVBXTnplamZzWSs2S1hpeHJjdHQzeEJG?=
 =?utf-8?B?V0c1T2hZdGlwRmFlS29DWVhGQTU5WjhEQzJzbUNCOVM4MExWd0VCVGZLVm13?=
 =?utf-8?B?ZUcxeGVpZFJFb1hGYklrMmtmM2JvbWNaS1ZrdEJwbm9oejBmZTUrdk5DRmFX?=
 =?utf-8?B?d3ZzTnpvUC9MOWVidUxwbHVIYnBMRlRWNW9sbzlRNjFzZnc1dzlhV1dNajZv?=
 =?utf-8?B?a0dkUC9OQ0FoQmc2RytPaXZUZXBSOXRoeTAyZFkrNmNYYmNFaDlxcDNUSFlU?=
 =?utf-8?B?T09QUGVNcGFpa1A4NUVlNDhmaWhBbWUxK1I1WTlQRkJnakxUZ2FpNHVxUWxB?=
 =?utf-8?B?eTRzT3FOUnVjVTFiL09HdmJ5aVBtT2ZtVDNGdk0yOG1OZ200TURrL3c5T3Y3?=
 =?utf-8?B?MVRZVVZZQ0k2Z1RKdVh1WUwzZVAxQzdnTUFQNHZwODNxajQwZVRtM0RyNG0x?=
 =?utf-8?B?NGd2QjZpM0Z4ZDFhYTdOaFRJb1paMXR2ckdObU9sSkJBTG90S1JRa3RXNDZ4?=
 =?utf-8?B?WnhtdVFiR0hRVkVWNW1vdjR6aGhPSlpUdUdhaDV4TThBNW9qbVJqRDBJQkZP?=
 =?utf-8?B?TVFOME05QVRaam0yY242VTFzL3dNamkzV2oxbHJjK3haRkNHUWxUaFBhMU44?=
 =?utf-8?B?dFJnY28vWmRESGE3a0Z0eGlDSWJIWnJnUmhwVVZDVHptK0tTQmNwZjgrYzl6?=
 =?utf-8?B?cllWaWZscHdrZk9Vb2IwVnNlOHRUOEE1MTVQYnplMXk1TytCeE11T3oxUTE0?=
 =?utf-8?B?Szlrczg3QkJScFByYW05TnE4SDFTLzNOTlcxMWtJSXM5QzM2UllRaXlwazR2?=
 =?utf-8?B?bFYxOG5NSkJmZVNLcDdRNWVOWVBXRTU3VWxreTI2WEZud1NhTUY2WDR3TVVo?=
 =?utf-8?Q?Po7fkox7dtY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWE1bE5UdDhpYXZyVHpNeDVGWG5mM1ZiUGc1d1NyN21IeCthT0ZhQW94VndS?=
 =?utf-8?B?cVI0MHdDTW5PbW0yMlQzNVB3TjM0OSs2c1QrM0FTSTc4TUF3NjJtTnR6dXJo?=
 =?utf-8?B?bDZYbDJNOUJqNUVKUDdQSFR5NzZZQjlQdklReGVGMzVDaUMzcjg2eSt4WXNV?=
 =?utf-8?B?WGkrOG8rUlBJcnJETzZSUTJSd3BUTGtvZlRPR1hXUWhJSk5JeERhUDErYy9R?=
 =?utf-8?B?dzZpblVZWmFvSFZ2ejRLcVBXdXM2Zzh5K1hJQ09RcUhXaHd5ZFpnUGtEdmRD?=
 =?utf-8?B?VXFVWHE4enhYSkNlbDRlZEFmTGJpTktoU0lodFBXaFdBMitWZHVHMEEzcUdG?=
 =?utf-8?B?Tm43WnJtMmVqQTVKTUU5K2k0V2dEcUVGQ1V0TWlVTjdiQ2FCamZJSFBrWklk?=
 =?utf-8?B?TnlpU3BuS1g3UUw0ejE4aFRTOVFDdVBERzduRlVzYmRwelRtV0JGQzhQNGE0?=
 =?utf-8?B?WDR2YnFDdkthRndwdEV0VzFFbjJwNm9CcThINkpFNEt0K3dVVFZaRnZTbnY4?=
 =?utf-8?B?b3E1VHgzZzJiRlAxeW9Ua2g3SkFZNE9tZy9IaHAxU2dTMm9xV0RKdmNna21s?=
 =?utf-8?B?NHBRUlBYL3Rwb0UrbXNrc1lwSWhhOFUxTTR1Z3hsRFhQelNob1ZmaXNrVllL?=
 =?utf-8?B?NDhuZFZITXFMM3RVV3d3THJYbUhSMDkvSmFUOGZJMW5QTlY4dTJ4SXVTUjFB?=
 =?utf-8?B?WitNWmJYbkdLT1FlQ2daN2I5bVFOYlprQzhZeXlndEU2OVZ0VVZoQ2ZCbmdO?=
 =?utf-8?B?YkdZUC9lc3E1TytvWlQwdzJhQ3FJeUhJcFQ2NCs3aG4ybFRBNndSQWs0eC8v?=
 =?utf-8?B?Wk1BdFpVaXJvR0xCRnZOTitzOVNGdlAwajg4ZEtFdjVuenB1ZXVRNW5PMkl6?=
 =?utf-8?B?WDU0YXdzRnZVRFpyYW1ZMmhsOEhjdWo3T2NGOXpmSDZZSnlldXFLWEdnVENT?=
 =?utf-8?B?VzNydlM3OE4vcGxqamo5ak5sSnV0aUoxdW40ZTR5d1YxTFU4N1J1L1dzeWxt?=
 =?utf-8?B?c1Y1YXZ1ckxXOUtOY1JkSGNiREt6OXlJdUlHd245R2RuS0QzbWlXdmRiNDh1?=
 =?utf-8?B?NFJhUXZZY1RpSTM2K25OUlE1Qnp2eVo5YUJSK0RWbW9Tb0JMYnppU1lsakph?=
 =?utf-8?B?UmRYSno2MWxFcnMxdHFYWTlITGxrMC9xMVpNNUE1WUVUcjJsellHUjFkeGtt?=
 =?utf-8?B?eEo4eEloODFXcU1EeGsvVXBRdXk0V1BFZCsrSTZTbGUrQkdmK3A3cDViaWlp?=
 =?utf-8?B?VW1FS0FmN1VUaXRKaVJtU01ILzRXNmx0UjROMXlDemJhTWw0azd6dmlEdjJZ?=
 =?utf-8?B?Z3p4ekt1dVRBQlR6bU5mbFU0Q3NTWEl6RVJaNEU3MEN2MEVRVGZhbXF1ZmZS?=
 =?utf-8?B?dWJJQWo4YTUrM1NDNmxFcVNtQ2J5NERCVG42U1lYM1BIRE1DTmhQK2lPOGVQ?=
 =?utf-8?B?VW5mdjM4KzFVT0Y3dmliS3BadXNwejF6Y0NuWEZlbERzZlhjaVlrbzcyOUxt?=
 =?utf-8?B?SytENHVoZ1BrZkZDWER6dkNKL2lwb2RxRHR6aGc2ckMrbG1iODMwaTkrVDZ6?=
 =?utf-8?B?WmRwWmt1NFhuQ0FGZlNkU3lhTEZuVnh6dTBhN1I3YWFBV1Bua1pRdGpnOFhq?=
 =?utf-8?B?RjhKWFJHZmwwbm5SRjBEeVBEVEEvZG5ocTFLYTczcndISkppUUFzT2sxZUpk?=
 =?utf-8?B?NE1xeE5BQW0zUlB2WEwzSTNHTmZFdEU1QnViYTZCY2d2dzFVY290YlpuWFpm?=
 =?utf-8?B?eXVDWlFzRTFaOXFWN0U4Z2ZYazRMZUhocmJmS3U0aEVBRk9adkpnSG5VTzRB?=
 =?utf-8?B?enNGZ2kraFI2V1A3OCt4UityTlRKOWtWajljRzBXZUxKVlAvNE8vbFlKbzc2?=
 =?utf-8?B?TDE1aHFqYzdITzd2NFdYSlI4a3BJOGQ5NUdKd25UdEMxQ3dUam9DbTN3MEdO?=
 =?utf-8?B?REJaTmlpY2hCeFhYR1B0L1QwTzVaQW8wTWtOUGFva3ZFSDRGbTVuVVlVTldy?=
 =?utf-8?B?MEhxOTN2ZWQ0OWxlb2xrVzBoYWFzR3pGMHNwRCtrSncvUGg1cFFSMC9VdVZF?=
 =?utf-8?B?S3JucjdTVzV4VnJQWE9UR05oNXdpbi9EeERmTi9XbWg2NDB5UXhMSnJGL3p0?=
 =?utf-8?Q?8kJkZKxPLobyqhysG1bBcKqGu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9040fe98-1396-466e-52f6-08dda40b0851
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 08:29:04.9836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MSUtzNZ4mkWUMzxD3t5grygJp6049Vcd1K/6O2eOe076kE/kCWEk8siXPoyg8gztTA9xi63VaOL5iOheDKrCBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6439
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

Add support for EDID based quirks which can be queried outside of the
EDID parser iteself by DRM core and drivers. There are at least two such
quirks applicable to all drivers: the DPCD register access probe quirk
and the 128b/132b DPRX Lane Count Conversion quirk (see 3.5.2.16.3 in
the v2.1a DP Standard). The latter quirk applies to panels with specific
EDID panel names, support for defining a quirk this way will be added as
a follow-up.

v2: Reset global_quirks in drm_reset_display_info().
v3: (Jani)
- Use one list for both the global and internal quirks.
- Drop change for panel name specific quirks.
- Add comment about the way quirks should be queried.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/drm_edid.c  | 8 +++++++-
 include/drm/drm_connector.h | 4 +++-
 include/drm/drm_edid.h      | 5 +++++
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 857ae0c47a1c3..9cca1e6e4736c 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -68,7 +68,7 @@ static int oui(u8 first, u8 second, u8 third)
 
 enum drm_edid_internal_quirk {
 	/* First detailed mode wrong, use largest 60Hz mode */
-	EDID_QUIRK_PREFER_LARGE_60,
+	EDID_QUIRK_PREFER_LARGE_60 = DRM_EDID_QUIRK_NUM,
 	/* Reported 135MHz pixel clock is too high, needs adjustment */
 	EDID_QUIRK_135_CLOCK_TOO_HIGH,
 	/* Prefer the largest mode at 75 Hz */
@@ -2959,6 +2959,12 @@ static bool drm_edid_has_internal_quirk(struct drm_connector *connector,
 	return connector->display_info.quirks & BIT(quirk);
 }
 
+bool drm_edid_has_quirk(struct drm_connector *connector, enum drm_edid_quirk quirk)
+{
+	return connector->display_info.quirks & BIT(quirk);
+}
+EXPORT_SYMBOL(drm_edid_has_quirk);
+
 #define MODE_SIZE(m) ((m)->hdisplay * (m)->vdisplay)
 #define MODE_REFRESH_DIFF(c,t) (abs((c) - (t)))
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 73903c3c842f3..137773dd138ea 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -843,7 +843,9 @@ struct drm_display_info {
 	int vics_len;
 
 	/**
-	 * @quirks: EDID based quirks. Internal to EDID parsing.
+	 * @quirks: EDID based quirks. DRM core and drivers can query the
+	 * @drm_edid_quirk quirks using drm_edid_has_quirk(), the rest of
+	 * the quirks also tracked here are internal to EDID parsing.
 	 */
 	u32 quirks;
 
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index b38409670868d..77fd42608e706 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -109,6 +109,10 @@ struct detailed_data_string {
 #define DRM_EDID_CVT_FLAGS_STANDARD_BLANKING (1 << 3)
 #define DRM_EDID_CVT_FLAGS_REDUCED_BLANKING  (1 << 4)
 
+enum drm_edid_quirk {
+	DRM_EDID_QUIRK_NUM,
+};
+
 struct detailed_data_monitor_range {
 	u8 min_vfreq;
 	u8 max_vfreq;
@@ -476,5 +480,6 @@ void drm_edid_print_product_id(struct drm_printer *p,
 u32 drm_edid_get_panel_id(const struct drm_edid *drm_edid);
 bool drm_edid_match(const struct drm_edid *drm_edid,
 		    const struct drm_edid_ident *ident);
+bool drm_edid_has_quirk(struct drm_connector *connector, enum drm_edid_quirk quirk);
 
 #endif /* __DRM_EDID_H__ */
-- 
2.44.2

