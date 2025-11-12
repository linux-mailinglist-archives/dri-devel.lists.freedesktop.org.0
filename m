Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4317C52737
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:23:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E255D10E72D;
	Wed, 12 Nov 2025 13:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="if9NGFzl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A2D10E72F;
 Wed, 12 Nov 2025 13:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762953825; x=1794489825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=f1DZErlhti0VsaHIsP1YTp6m6db7A1oLttqgvH6reGw=;
 b=if9NGFzlmuFTmHLN069cWCQxYkXGSOwPT8w6kTxKguv0CBwonIXYJPKP
 23pIIeDEd3wReL9ktD377hVlkZGxUNzOHA8NhZIvuRh7yrd0btwkTL0ZK
 i7qcrkNO6XwZVlUlT+CStAUCoBFrN7afKUReWiZPGxJe35S1ukSaIjb8V
 Srf/Oc4U6IYt091istG09i/aw8ttrxVB31scty4IifHYGGPopSjXe0TLN
 hziK/KhI7V0S7Mdn/kjVbMqxEwu0NwcbC0F3Y8EOjYoTcKd+CtuuG1hCj
 RJCzeoa8p15hGkBbN4b8D4WD68ypbTSpr1J4ObkVeycyuH6VfqUXztCvl w==;
X-CSE-ConnectionGUID: U27aUDAlSJiPG09evb9l+g==
X-CSE-MsgGUID: 0o8T8fx8TKOeSqJDjkA1Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="68649729"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="68649729"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:23:45 -0800
X-CSE-ConnectionGUID: H339jE/vTfeGkSY+gkw45A==
X-CSE-MsgGUID: M4VomuPVTYiR/TPOWJn7yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="193468014"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:23:44 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:23:43 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 05:23:43 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.40) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:23:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Un7H3RSg5Fdw9sP096/nbJ84tPeKkg7h038UQBY3gji+JmeJrfSHLLhz6FZoJsQcW3sFQEioFohQJWeRtOv0gzrhR+FviZNG9UdvKihgVbi04OaTJozbDxTVIbMn2YGuOT8DxITKtyWew5BnrbIpDGt8QI3L88YbcaeNGwzORluYiz5pQ73wELitpshYy6uqxh4yBt8pn9kMw/vZMRWlvrfzlG6KxGqmc3ph3WaPqskzALELOMiawJRvM/i6tpYk1IPdnBJ1tkRfNf2dnhN31tXNOGvwimaed0ntKA/37lcuCvKH2n29gUWyovH00Tvmzr1yWgP2qH30Fgp0Zn7Jig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5smbwVEVcZ5Z1I2eLFWpN0NfAqPp6Yorxt7TQ9FpIcM=;
 b=LbrjGkW5RHPk6ke3/IpS/mtFxyoBwi092WTx1lQYu8Cdca06Ycsq/MJl4jWzHI+ieAz8GDwVd0H4Guzl2eQWSbT/lO6rds1FP7MmkI28st1COfAn+XTtj6JHz1psMqFKW4jz1zWh1rxpxFskb6RGzxXsA7kOQxgjhGVX7nlUyKDdjiBFdvUhHn0iDergxz1PgfHPRxtaMd0zUi9pSZHavZLu7cQr8J3d5FLVwWDMo+IbmNPlVWUAjvxVOdMPnSjf+REltujBgYsKFHN62j9KwIAFWJBVp8ghMh52Gf/OssLuVSoIa67DtUdUbGs0cYvCurln/R262k2XFGSnBCY9qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY5PR11MB6534.namprd11.prod.outlook.com (2603:10b6:930:42::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.16; Wed, 12 Nov 2025 13:23:41 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:23:40 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 12/24] drm/xe/pf: Increase PF GuC Buffer Cache size and use it
 for VF migration
Date: Wed, 12 Nov 2025 14:22:08 +0100
Message-ID: <20251112132220.516975-13-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112132220.516975-1-michal.winiarski@intel.com>
References: <20251112132220.516975-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIXP296CA0004.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a9::11) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY5PR11MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: 85f99135-b5c5-4318-ce61-08de21eeb225
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUpqNC9qcHgwYzFCdGVyYy9ZMTJLTkJOWGdoNU80eHVzQWZ1MDVlZGtvbWVy?=
 =?utf-8?B?TmJBWS9SZk1lbEx0NStUeWZYNThrSkFkYzc2cGdWaXJqUDcyV2Z2MGdFclhy?=
 =?utf-8?B?QlFyNzJaOTFSQkt0T2VkMjBIOXhRNHVzdFN1aUc1SGMvTDdLNU0xQzBzZWpG?=
 =?utf-8?B?QVBCMldaaXAzZklYOTU2L0UzaGxkNExZZU8rVks1ZEJvNzhLeUd1R2U2ZVFZ?=
 =?utf-8?B?d3NLZVNVQ3k2UjhiWDBVSmhSMFhtdlJiTEZaRkhQU0ZtL0tILzNoUGY1Q0lm?=
 =?utf-8?B?WXhHazVFVitjb1ZORTkrWGQ0N2dKR1dNV0JpMDBVVGVGb3lHOEFmQUpvTTBz?=
 =?utf-8?B?WDNlWGxSUVZvcnh5NVpBNGxINXJQcWVzSFRPZlh0eUlxcUUzdzJmT1VoS3A0?=
 =?utf-8?B?TmtNY1l1aGRTMzZRQTdNL3ZVTHBCa0ZZNUhIZHYzbVpMOFpRZ2dJRmhMTk9a?=
 =?utf-8?B?VEtDTmw1Q1QrY2FPaUhwckdHa01EMk95U3ZPVGN4c0pKSzZtanNpTGNPTkQy?=
 =?utf-8?B?bkI0d203K040ZWZJUkdiUjAxaS9EcTZ2dXo5aksyUGN5VHNjUWhwdW1ocC9k?=
 =?utf-8?B?RkRKbGdCMHF5dnh3YUFPbVI0RS9UcUQ1WDJyU2NIUEVTalRsWGdTNThxZjdG?=
 =?utf-8?B?VmZ2ZEl1YXE5Vll0QUhCc084NDljZ1BLSlFrUmZKcGRwYUx5OE5PMVdHcnBs?=
 =?utf-8?B?WjZucDlKMkFQRi9iSWsxSVQ1STRFaTNOclg4ejV3UDVsc1pVZmZGZjkxTVVI?=
 =?utf-8?B?bGpUTTlQWEx0YkRvUHBxUW52ZXVPem91aTczVE5GbmpnS09XeUlVWXltaFd2?=
 =?utf-8?B?YWt1cmpPeXNBQ3p6TGhxdzRBbENVSk5GWkZVbmc5dU5CQkY2eDJRcnNydzVT?=
 =?utf-8?B?R2prQWxnbkpTcXRGQkRhNktCblZzQnc5d2N4SHdQNzNIVmhVQmljbHZZcXhj?=
 =?utf-8?B?akhDRndXTXhNcVZwNGxhaDlpdlRoQlhPZHI5eVJWL0VrRURhM2RTMmlDMVUv?=
 =?utf-8?B?QXdJNUk0ejByUFBCNmZnc1BUUjNremtaQTk1S0RnT3BNNUZGUXVHMWdaTE53?=
 =?utf-8?B?R1FDNlZWdlNtQ0Z6RXlaUEEvL1g5UFpNQWdRMk05RWpzZ3ZUdGlzN3l6UXBM?=
 =?utf-8?B?ZkNEMk0vd2E0amkvYW5RUzcyWHZkTnV0SWlBeE82T1dsN2xhWWZJV2pHU2RH?=
 =?utf-8?B?YWVPeVFDSlNRZ3RtUThJcFJ3SjgvTlBGaFNiQVpiQm0rUVd2RkErTU0xRWMx?=
 =?utf-8?B?VVhNMkZINGlUZ2RwT1FleVo2Wnc0L3o1Nk5pZ1hqSEloZHpUOW5RWDhoemZi?=
 =?utf-8?B?Z1NYSmd2MGpYUG5rWlhDR2tIbDNqSmhMZEVOOEhiWHc1OFFDaFcvQ1NLMitF?=
 =?utf-8?B?TGFsNm04UFBkaHRIenZxMGtmYjQ0aHV5WDd2NkJMRTcyUGdKWGNwMHJUWmJC?=
 =?utf-8?B?aUpBOFRielp4dmZ4TlNMVFcvcWtVRWtiekhTeW5xdWFwdVdIM2h2bUhOKzNh?=
 =?utf-8?B?MnhCTmNNdDl1dG5GN3A3bGY4QkJ3MUcwVEhjMGJYazY4RUlKQTBkemRpOExR?=
 =?utf-8?B?UWRIZyt2bXFOd2EwRTgzSGhFTFJVdjdTY1FrZ0lDcmhHY3NvK1dLZG5ZNG5B?=
 =?utf-8?B?a2xvejlMVFcvNDNCSmhwejVzZ0R1MmU0LysrSHY0dmNsR0s1MnRkSXZMdkp4?=
 =?utf-8?B?dWp2M0YrZ0owdzkrOHNJcmVLRUJGZ2xDRExGbFY0OWl1Z1l6M09UTFlSWDRC?=
 =?utf-8?B?NDUrUWs4eTdaeGY5WjhoVzdTRW5Ua1puc1AwYXZZQlRRUnljUWdtRXdLUlJN?=
 =?utf-8?B?dmE5L0FOUU9JS1FrdVo1QzRWUlpJVk1HMTBOM1BTSkxROUpjZG8rNWU5VXZR?=
 =?utf-8?B?cVEzZ2JlTlFzTmNUemZIRWVkbjZ5WDFGNTNiUXdodWQ5QUNWRFNKdWxXVW5E?=
 =?utf-8?Q?a9jixNb9cEZaBWRhAO92JeNEpfPFiBQc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnJTYldCN3FGYW5RQ1lhbk1UNXpzeEVqanR5OFN1SjdOa3RBY0tIY2tSZlUz?=
 =?utf-8?B?Qkg1WFJTWUpJaEltckNvQTFNL3N6b3doZVFlbFpIcGw2SjZWNjRjV0d4U0la?=
 =?utf-8?B?eGZablVlaTY1YkNESTF4dnJ2VkZEdDhGSWtUNFhRbGZGYjBuMTNmREZlWnFF?=
 =?utf-8?B?blVSZHRYeUJQK1Z0ZTVMc2JBSHpURUlkZUREZVZYWUlFWTlYNVJpQ2tZNDE2?=
 =?utf-8?B?Q0tZeHFvVXlpd2cxRmpjWGRPQWpndUZoaDVkRi9vL1hFa1BUaS9SNElERGYw?=
 =?utf-8?B?VVE3ZmpFaXJWK0FlRnMwK2VSd0dKeGg1dzdRQVovL1FldHREeDJVSm93VFRu?=
 =?utf-8?B?c3BlZnBiUkFBV0NDZDZIa3UyQ216NVpjQWZRR0JhQy9pN3F6TUhPbEkwS3dx?=
 =?utf-8?B?S3J0TFMwank1cEpxdkNGdmg5RGtlUXIva2s0WElZN3RKbjBBRG9sc2tSdCtl?=
 =?utf-8?B?SkxOdXl0VXZ5RW42Y1N2Q2RRemNZWTNYbUsvZVNmU2Zhc1o3SUt4QmV6TGVj?=
 =?utf-8?B?cFhFRHR5L0xQeEM5Q3kzU3hxNmFBQ2ZNMmIrcGtITnpiTlhYRVh6cEI5UXNx?=
 =?utf-8?B?Z3QvQW9FcGJBc0VmZEgvQVFBMG1pM2FuYkZJMjJGZ3VSaUUvclNNUFEvSkRS?=
 =?utf-8?B?SzVLcjhyN1A2UmZ1bmRhL00xN1NySGlUUHRHL2MyckUvdTJ0UFZwcVJZYytJ?=
 =?utf-8?B?YU5rUXFlSUZYZHRjNVVscStpZWJXTWVuNW5xUnpiVEVzWmpocHRaQlBwamZ6?=
 =?utf-8?B?cUVRSTM5NUl4U1JveHlwVlduQUdodjFmNElHaStQVXRlRm9GMyt3RkQ2VzN6?=
 =?utf-8?B?Z2xrUnFZMXB5SmtaWkZZUEJuWFB3bjFUOEdMY1lYaVExVHpNUktib0xhVDN3?=
 =?utf-8?B?anNzN3Z5SnNVL1dDblZCM0UxcnZvWVlWb00xOHI4cDhhb2lDazJCWnA1VC9t?=
 =?utf-8?B?T2lBUHNuUFdHWjZuenBQWU1jczRmMFZNTGtXQXVqM1JIaURVQXMzNHd1bHA1?=
 =?utf-8?B?Z1dXdkxnbE16Z0V2UkNMWlhKYjZGWG5ibS9iSGRRN2VlK1NLOThteDdUS0l6?=
 =?utf-8?B?UzFvak8yc1owWXdGclNFTnZ1cEUwekdtZkp0ZDM5eFl6S2g4dW9Dc05oKy91?=
 =?utf-8?B?R2Uvekc0UFR4R215V3IxV1RXOUJqVEs1YVdWb2ZrS3pWSE5sTHM3MFBIR2VO?=
 =?utf-8?B?aTJDcklkQmVVa2J1TmpqUkdwUGZJRVRlMkRKakVGdGoxRnNQK0xqa3BLeTF2?=
 =?utf-8?B?enZ1dGtFMGZqWVQvRisxbFRmNWpHTE05ZVNMRHMyWVpYQ0xmVTRjRU1wMHRm?=
 =?utf-8?B?dzVieTV3bGN2YldaRnByZEFiNlFvd1cvaXpNaDdHQ2VHN1ppVkg0MG16R0tX?=
 =?utf-8?B?Y20xM0FFemZ4OVdsb1hpeWdVLzFXYjVtMWt4NUxsNW85bDhxaEtaVCswVlNT?=
 =?utf-8?B?cFJxWTYrN2JYRmptN1FqdS94bk5OYzRRekZjNFh1cnNDSHpRZ2dHUm5WQVRk?=
 =?utf-8?B?V0JLcHNHMEJDWjhPK3RwbTAwUFRueHZaMXY5S1BiOGMrbzUvOUEya28zeGlo?=
 =?utf-8?B?d29TWkpIaU1qaFBXUm04ODgvdWlQRTJXdTY4Mm1KbUY5U1BwVUhkZzVBTFBW?=
 =?utf-8?B?aE8zNC85Nlh4RWtjR3k5RkdlTEdKamp5TkNmTHJJYXNGOVZxREszaXNmQlp4?=
 =?utf-8?B?VHREMHY2MlB3NmNwdFlGSzhRY2xhcndIelZiQTVoc1JnbGQvREdaK2ZyMzNI?=
 =?utf-8?B?d1h3dGdIZkFWNnJ5ZFpMY0xNOXhBMU5YQVFkTnJuVWRKRVhzekMzMTI2ZURx?=
 =?utf-8?B?NEg0MGpXWDB4clByaXYzeDJvWHpVNFc2bWVUUjVnSm5talhmS3paTlRHZTd2?=
 =?utf-8?B?eEgvMjZIMkFlWVNzZlZiRFQ0TnppMWliRmoyT0c4a21xaXoxRWxTLy9VZWJB?=
 =?utf-8?B?VDk0bWNOYjlkTVpIdlpnaGM3Q1RvcTVRM0hCTE9EQlM4QnVOVFlwM1M4SGk4?=
 =?utf-8?B?NDk1YWJjRlVOcHplNDFBZ1U4TzdYb1JJUjErdEkwKzh0dkQ2dkxrVXBuVHZu?=
 =?utf-8?B?OU5lRUZubWxENGsvU2EweitHVWVqM0ZQbFpSNmhNVGdnRUJEV0JEcnJYWlM2?=
 =?utf-8?B?aVJBeDcyMlYweTFRUlp5Y3J0cmxwRDhOZWdCcldjT3hTTk5lQ1lkRUhUMzJn?=
 =?utf-8?B?U3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f99135-b5c5-4318-ce61-08de21eeb225
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:23:40.9136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/upTDMOmGqC+cXTrDUf30/sctdm1xBfga1UYrqsfowwJaHqg/DaHpVRpgePyQOFCs4VYZl6h7GQoF2NS5jv0ul4GH+NmyAE/PFe+00joYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6534
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

Contiguous PF GGTT VMAs can be scarce after creating VFs.
Increase the GuC buffer cache size to 8M for PF so that we can fit GuC
migration data (which currently maxes out at just over 4M) and use the
cache instead of allocating fresh BOs.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 47 ++++++-------------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  3 ++
 drivers/gpu/drm/xe/xe_guc.c                   | 13 ++++-
 3 files changed, 30 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 0ffe64ee469fe..7b5338be15065 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -11,7 +11,7 @@
 #include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_migration.h"
 #include "xe_gt_sriov_printk.h"
-#include "xe_guc.h"
+#include "xe_guc_buf.h"
 #include "xe_guc_ct.h"
 #include "xe_sriov.h"
 #include "xe_sriov_packet.h"
@@ -58,73 +58,56 @@ static int pf_send_guc_query_vf_state_size(struct xe_gt *gt, unsigned int vfid)
 
 /* Return: number of state dwords saved or a negative error code on failure */
 static int pf_send_guc_save_vf_state(struct xe_gt *gt, unsigned int vfid,
-				     void *buff, size_t size)
+				     void *dst, size_t size)
 {
 	const int ndwords = size / sizeof(u32);
-	struct xe_tile *tile = gt_to_tile(gt);
-	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_guc *guc = &gt->uc.guc;
-	struct xe_bo *bo;
+	CLASS(xe_guc_buf, buf)(&guc->buf, ndwords);
 	int ret;
 
 	xe_gt_assert(gt, size % sizeof(u32) == 0);
 	xe_gt_assert(gt, size == ndwords * sizeof(u32));
 
-	bo = xe_bo_create_pin_map_novm(xe, tile,
-				       ALIGN(size, PAGE_SIZE),
-				       ttm_bo_type_kernel,
-				       XE_BO_FLAG_SYSTEM |
-				       XE_BO_FLAG_GGTT |
-				       XE_BO_FLAG_GGTT_INVALIDATE, false);
-	if (IS_ERR(bo))
-		return PTR_ERR(bo);
+	if (!xe_guc_buf_is_valid(buf))
+		return -ENOBUFS;
+
+	/* FW expects this buffer to be zero-initialized */
+	memset(xe_guc_buf_cpu_ptr(buf), 0, size);
 
 	ret = guc_action_vf_save_restore(guc, vfid, GUC_PF_OPCODE_VF_SAVE,
-					 xe_bo_ggtt_addr(bo), ndwords);
+					 xe_guc_buf_flush(buf), ndwords);
 	if (!ret)
 		ret = -ENODATA;
 	else if (ret > ndwords)
 		ret = -EPROTO;
 	else if (ret > 0)
-		xe_map_memcpy_from(xe, buff, &bo->vmap, 0, ret * sizeof(u32));
+		memcpy(dst, xe_guc_buf_sync_read(buf), ret * sizeof(u32));
 
-	xe_bo_unpin_map_no_vm(bo);
 	return ret;
 }
 
 /* Return: number of state dwords restored or a negative error code on failure */
 static int pf_send_guc_restore_vf_state(struct xe_gt *gt, unsigned int vfid,
-					const void *buff, size_t size)
+					const void *src, size_t size)
 {
 	const int ndwords = size / sizeof(u32);
-	struct xe_tile *tile = gt_to_tile(gt);
-	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_guc *guc = &gt->uc.guc;
-	struct xe_bo *bo;
+	CLASS(xe_guc_buf_from_data, buf)(&guc->buf, src, size);
 	int ret;
 
 	xe_gt_assert(gt, size % sizeof(u32) == 0);
 	xe_gt_assert(gt, size == ndwords * sizeof(u32));
 
-	bo = xe_bo_create_pin_map_novm(xe, tile,
-				       ALIGN(size, PAGE_SIZE),
-				       ttm_bo_type_kernel,
-				       XE_BO_FLAG_SYSTEM |
-				       XE_BO_FLAG_GGTT |
-				       XE_BO_FLAG_GGTT_INVALIDATE, false);
-	if (IS_ERR(bo))
-		return PTR_ERR(bo);
-
-	xe_map_memcpy_to(xe, &bo->vmap, 0, buff, size);
+	if (!xe_guc_buf_is_valid(buf))
+		return -ENOBUFS;
 
 	ret = guc_action_vf_save_restore(guc, vfid, GUC_PF_OPCODE_VF_RESTORE,
-					 xe_bo_ggtt_addr(bo), ndwords);
+					 xe_guc_buf_flush(buf), ndwords);
 	if (!ret)
 		ret = -ENODATA;
 	else if (ret > ndwords)
 		ret = -EPROTO;
 
-	xe_bo_unpin_map_no_vm(bo);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index 3ad3c3609b415..148ee07dd23a9 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -11,6 +11,9 @@
 struct xe_gt;
 struct xe_sriov_packet;
 
+/* TODO: get this information by querying GuC in the future */
+#define XE_GT_SRIOV_PF_MIGRATION_GUC_DATA_MAX_SIZE SZ_8M
+
 int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
 int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index ecc3e091b89e6..a686b04879d64 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -24,6 +24,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_gt_throttle.h"
+#include "xe_gt_sriov_pf_migration.h"
 #include "xe_guc_ads.h"
 #include "xe_guc_buf.h"
 #include "xe_guc_capture.h"
@@ -40,6 +41,7 @@
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
 #include "xe_sriov.h"
+#include "xe_sriov_pf_migration.h"
 #include "xe_uc.h"
 #include "xe_uc_fw.h"
 #include "xe_wa.h"
@@ -821,6 +823,14 @@ static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
 	return 0;
 }
 
+static u32 guc_additional_cache_size(struct xe_device *xe)
+{
+	if (IS_SRIOV_PF(xe) && xe_sriov_pf_migration_supported(xe))
+		return XE_GT_SRIOV_PF_MIGRATION_GUC_DATA_MAX_SIZE;
+	else
+		return 0; /* Fallback to default size */
+}
+
 /**
  * xe_guc_init_post_hwconfig - initialize GuC post hwconfig load
  * @guc: The GuC object
@@ -860,7 +870,8 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 	if (ret)
 		return ret;
 
-	ret = xe_guc_buf_cache_init(&guc->buf);
+	ret = xe_guc_buf_cache_init_with_size(&guc->buf,
+					      guc_additional_cache_size(guc_to_xe(guc)));
 	if (ret)
 		return ret;
 
-- 
2.51.2

