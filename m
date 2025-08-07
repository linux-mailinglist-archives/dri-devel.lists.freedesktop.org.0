Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AC4B1D23A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 07:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E0710E0AD;
	Thu,  7 Aug 2025 05:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jCtUAI0X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188FB10E0AD;
 Thu,  7 Aug 2025 05:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754546264; x=1786082264;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=dOj0r5My2R7csVXxYqF63HKi26dx5nhZqmKxEDsgUoo=;
 b=jCtUAI0XX8I3dxszRqRUsQRyf/I/llwvMooGiYyyHIqFKgChCfxhuh6D
 UUiAYRjCPNzMex+npTrx2WqCaiqhnmc7+jYi6pamc3enxuluy6XVA0RSH
 3+jhwW5Vakgl0IZd64LYqybHg1Wzigppe+Jg4OZE3Z281jpepMa3TKBm+
 GEBqAAuzgQ552xN+LGJCBgUt0MSNpgldeQ1V863quXCFSTe0aUmV0/wcV
 8DDKGuV8qZGSSCTzuRSXMbytHP6iH2GHwi6f5tWcBdbeU5/CLFcY0ebFt
 V130kuxGDnna6mrLnu9XIB8MjmC6rOvCpdl6rq/LtApBOs5X6EuDy/mxR Q==;
X-CSE-ConnectionGUID: 6JFi3X2ARXKz5WWUivUjng==
X-CSE-MsgGUID: eUSoZX1tTeC+ws04nSBSbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="74331616"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="74331616"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 22:57:43 -0700
X-CSE-ConnectionGUID: ZuZXNkGVRteCIbFm7KZTGQ==
X-CSE-MsgGUID: YKJjAg3YSOyCQkoBe6HVsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="164495501"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 22:57:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 22:57:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 6 Aug 2025 22:57:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.48)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 22:57:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=szXehPyD5sBomMECC9zXJCpsJAVOshypwgotYNR7SUCqoIS5scKcOHD+tiRNdBoukDgitgQCJHLS4lKcFckOFZLNAoDbyulC5PylhX57O4Cov6B0Fp7n37EPKWbtr84riTLlG/i22UT5sP8mJeJTRc8w4F0P+HQgc856ksECnapI6euWBV09i59oiP4rMwua6BnqvfGAMFKPtIjvReVVaijWhRn5DonjAbdei8Gq5iz0H2K1MNaJyLwCg+79IBSmk7sCXTAScIQYualA/5rotDZK6ZbBF+vnz1kL5+W5TS9U13T6OlLS+t6FVvSpHPEGky/11cB27rfc/A0Y5QMlJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTfz7nLrZ10D+gTP6NDl5a82dco6DXCtYLP0zOQxuzw=;
 b=zO0Mb77eEmP3gxX0UKjVrT0Bi1bjC7aX2/Q9vQmsuLmsTE7arxkdCOzf9r3Tz0a3tDRCxCBRLU3tSZ7Zjuq9WgzNAts9aXU0/p4PbDaK4aLGta4MnyLBm7NMg420oAhZHq2qP8u0eI2THkRP0VMmVUIXd7qqwHE/1dOgcEiJFPWKdbf9suDunsexPVYYoiiV2nntCXIiJ2PP2gYsNzyD1x91Cnrps99K+K4zN+KhJ/BX0eFHecoPQ3ETXPaxdtRPoV5QvssfuHRO7gq2+cBeFdyKHdPqAtfzd0EPLVlgHgHVh2sI05gLy2yvkqIt8rhlszycw9BJ4/c2JX+tvumGJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CYXPR11MB8709.namprd11.prod.outlook.com (2603:10b6:930:dd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Thu, 7 Aug
 2025 05:57:32 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%2]) with mapi id 15.20.8989.018; Thu, 7 Aug 2025
 05:57:31 +0000
Message-ID: <760a5fa2-8e7c-4eb7-9f71-eb44b9550ba4@intel.com>
Date: Thu, 7 Aug 2025 11:27:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] drm/drm-crtc: Introduce sharpness strength property
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
References: <20250724134544.284371-1-nemesa.garg@intel.com>
 <20250724134544.284371-2-nemesa.garg@intel.com>
 <ad3693fa-a8d4-4310-8522-5795d2fedc36@intel.com>
Content-Language: en-US
In-Reply-To: <ad3693fa-a8d4-4310-8522-5795d2fedc36@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::26) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CYXPR11MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: 9473f92a-56c3-40a9-b924-08ddd5774c63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WStlOVVFcGdBOU9mU3lCQWtCb1A1Z0RVM0Q2ZEQ5UVFtdmtuK0FJWXNzalB2?=
 =?utf-8?B?aTFORWphR3lwRlR6dk1EaGRoVFhkVkVxeEErbWpKeXhvUlJubnhyTTdZTGdX?=
 =?utf-8?B?S0UzS3E3WW5oa2FKSG1xOVBPQXhoekZyWWxpMkU1TUFDd0tkWnhjWWZ3TjY4?=
 =?utf-8?B?bU5va1lmaGFnR0hIWGRwWkVEcGlQNytFQ2dPT1ZZV3lzek9Mc05FVFBmWVJU?=
 =?utf-8?B?Wk9mTDNkL2J5clVEZVNmaTVmb25ZN0w4OEh2NHdBRTNXdFNJOUZ6NTVNNXUw?=
 =?utf-8?B?T1NEYXlNSS8yM1ZPa1pVMlI1eGFjMXVLNGx4bE5sQmIyckF2d0JMd0FYVG1I?=
 =?utf-8?B?Q0g0Q2NDZ3BuaTJ6Zit4V0hEaU01c3BxY25yOE1GU0plaW1XbEpENldDdHR2?=
 =?utf-8?B?Z0xFV1VGNCtzWm1GTkJpKy9qYW5oTEdpMUhJcW9wd0hORCt4cnEvWlVuNzhl?=
 =?utf-8?B?OE41NTFBY2JIRWpablo1RDB3MEoyTjFWZUxIZUJ5REdBZm1jNzZoQnNaVCt5?=
 =?utf-8?B?R2Zic0VNQnBXU0ZyRlUvSGZzcFViL2ZjRk9IWjBVcXM3NEdIcmYrekVpVUdl?=
 =?utf-8?B?YVlvblk1aklPa2tFREFaOU9HRksyL2x3a3RsbDk5TWw3VUxWOUhuOForbWhx?=
 =?utf-8?B?Yy8xc2E2a3hhUkthMzBxcitzUTVxR0JSQWFHck13WTJFc3FocmJaTTFIQUVz?=
 =?utf-8?B?MWR5bXU5NTJPaThlMCtOZEZXSyt3ZUE4SzQxVFZLM2grZ3ZaSnpPMzRXQjcw?=
 =?utf-8?B?bGgySTlEM2NUQW1JTFhuVkw2OWd4aUVDTnEwQmdiRFlBeVJ6aWZJR1NwRDlY?=
 =?utf-8?B?aFRzMzRneC94NGh0TWw0NmZWOUJjNDZHd0dPMytrd0dRTDZabklNMVNzL0tU?=
 =?utf-8?B?UDRSN2NjaHdNYmJZK0pDd3FjRWsxZnJOUG9TOWMrcjI1em5rNHpYcEJ6R1lZ?=
 =?utf-8?B?VTIvRmpsZUlYdUU5QVlsbWlibmZTNUgrM2ZqcDNDc3VibzduVFM5aUI0cmdy?=
 =?utf-8?B?MUNpQ3F4WGROajBLZVdZVFNwQTZ5MXpaMHpWNnZnWER3STMxL1psYnYwN3Rj?=
 =?utf-8?B?ckFVVnFBMUh0QVlPOGx0R0RCbmtvc0ZEcWloeUR6c214NU5WUjB2VjBwdGtQ?=
 =?utf-8?B?c1JrZ09Uenc4QzZVc1UzZlpCbmU1YlFaL2g1czRDeGF0OTZFTVZ1QUJac29U?=
 =?utf-8?B?akF1eU1tZEhzZmowbWE0NERQME5Qb3NEQld5RnU5eHpxRDZHLzg2bHFCVVFv?=
 =?utf-8?B?STZjQ0RML25DSkcwMythTG9tYm5MR2xKWWxKRkhYSWFCNXZ2ejEwQVUvc0hW?=
 =?utf-8?B?b05BRHRwRkZXQW1HTmh4bEVWTEhwN2FZQXRWMjlTKzNvUWVKWEhubFlYdHUw?=
 =?utf-8?B?RjFaV1JmR2hicTRhN2UzTk1jaG5EVFJVMjNzSFA2VWVlc0ZjUmdlL0FOdElB?=
 =?utf-8?B?emRTV0VJU2pDaWRoU3BuWkw0cTlUZnhVdGN4TkNHUXFDL0RhQytWV29tbFZL?=
 =?utf-8?B?cVJrK2Fob3BYY2ZRRWlzKzQ3SDlNY2ViSUhicVpaVUs0S1J5Zm1TbHZwN1dC?=
 =?utf-8?B?YzUwRC9SQnJlcWY0T3g3TGNDeVFKZzFYcnptcThRdmlvZmFMaWNnVkJ2eHlr?=
 =?utf-8?B?dVg0R1dIMlpnb1d0T21vWW5jV2JuOUFzSUlReVNBZlZaLzkxcC9MWFVMRlZa?=
 =?utf-8?B?QWhLVGljNis5QVpLcTdzeWVBbnpwZjdkSFE5bDdtTXBMdCthMmxjTVRyM284?=
 =?utf-8?B?UkZqZTlBRjUyOVprWEcyZDg5ZmdEb29qS2Vra0pNNUpiQXJlUG5KaXZGbDh2?=
 =?utf-8?B?U0RndVlaOFRGbi83U2laWS9DK2lJZTJ0V2FiTVBudnQrTXB2NmVOQXBtdFJ4?=
 =?utf-8?B?d1VnVkgyOEhnV2F3T0ZDRkxpZ2hGMUIzZ3Z3WElQMjRqaHlFTkNrRUJvK1VD?=
 =?utf-8?Q?DtvVxCLXG+k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjRYMllTZHpIVVcwclYrSjV4aEQ1blVvbkRZK1llRDJpekQ1SndUQ3BIRC9y?=
 =?utf-8?B?MWE1VWltNEZhQU9VcXoydkpDQTdRNzNHTEFvb1VpTE9xcDJJYm9VMmxHVkk4?=
 =?utf-8?B?UjJJTlNENFdVek5QeWNBSjZpTGRDU2xwbnR2VHRMaHZyS1ZsUVNxWGd6MkZ0?=
 =?utf-8?B?MUtRQk5kMGRMbDNyaGFxcXg2WExubzl6My9BQXRxd0wvVmFKaHgvWDVWOW1J?=
 =?utf-8?B?RzhwendpTFdYeGZZR0xtcitRbWg2SnN0YVlHMXhDcjVjTExhOTlFOXAwclE4?=
 =?utf-8?B?RVZXakpGU28vY3ZQc01PVGp2N3Y4Y2FKZW45bGNRenJPZ0twVWhhVDFnaSsv?=
 =?utf-8?B?UXFtQ1FHRkw4c0w4RjZlYUpFL3I3b1hMa2RQYTZzeUFxZndldWtRQTZOMTJP?=
 =?utf-8?B?VWpDVG1QRWpZOFRPZzhHMFp0MzlGb2F4dk04TWhWaFFhb3JXZ1VuQ2g4K1hy?=
 =?utf-8?B?Y1lXQWtJbi9CMXBwUlBSWWxNd0FvSG4zUmhCMVNpbmk0czJXdXRyUVVVb01F?=
 =?utf-8?B?UmloTWlWTlFXS2dBNkNOWmxsSEhrVE42RzIzK1NlNlptb3ZvN1JTQTZCbTZu?=
 =?utf-8?B?YzNybGdkUzltZEJDSXBtYUJrdzY3TVhoaG9YZlFEQ1FkakdjWlFPOXJUNTk4?=
 =?utf-8?B?WXlPMm5IWVdNK3JSZDQ1VHNtVzlSNTQrcjJuTm4xTU1paldYWk5pbURTakwr?=
 =?utf-8?B?bWpmdDBsUTkzVVozWmQrL3RhVkhtUS9hYWRpRmVQZ1dYT1dBNlBzWmliMnZE?=
 =?utf-8?B?bVR6eU0vOWdDMStUYUppaFh4RjF3TjJoOUs3dHNMVXZDVVQ4ZU9lbnNXZ1dI?=
 =?utf-8?B?aFhCMDlpRFJtTnZ6V0RZWXhoZU80RXcydEdyYXhDYnlBSlA0WWVhMUlWVHZw?=
 =?utf-8?B?YWZSaS9qbVpZTkdqTnBpMTAyNVRFeWlFSndVSUUzZmhHemZkYTl6ZzhGZ3pk?=
 =?utf-8?B?TUpRdjVLTmRJYTR6RGh4V1V1eEYxK2t1U0FnSlBtVkVkREdxYkhMbFhyLy82?=
 =?utf-8?B?elMyTVFpVDVtUVhzMGQrNlorK3I2VFQ3ckp4K0ZjcDEwNkhTSWs0TGlDM3NX?=
 =?utf-8?B?bXE2dllGY05VVisvWmlXVG45SGRza09jYlFLTmMyV3hpSXA3cjRRRHA0anNO?=
 =?utf-8?B?SlpVaXB2UHV6S2d2WXJXTGRNajVnenhQUTQ3bmxTazFoQ0EzS25DTkxHMmZU?=
 =?utf-8?B?Ui9keFlhMDJiYkJSa2tNdEtXM29YV2lkbEdTcnVyd3JuSG5hM2ljTVZTa2Vr?=
 =?utf-8?B?K0ExVlVPdjlaMXpFSHNud3d4dWlOdEE1enBONXhNMzRlZU9MbFNXWkRodnR2?=
 =?utf-8?B?VzNmanBnY2x5ZS9jZjhzNHhYUmlyL3hWY09EOCtjOVUrbnhPSFNwdGRBVFN2?=
 =?utf-8?B?eDYrUDZYOG1zcW45azk4TVNHVDZKVzhCOXNHdWhQZXYzOGZhcndPMm5YaTIx?=
 =?utf-8?B?NFlUZDY3UTRjRVNEMmpYWjhQbjBSTjBrVjJYbmN2VnFOcUpTa2NUaE03TDAy?=
 =?utf-8?B?NHVlUCtlbCtVMlUvRG9XTXp6NXhiRE1XRGZaZzVNeFVOa0I0dVNpQWdabkdm?=
 =?utf-8?B?WDRzODMzQ3VuKzFOVjdpaEZZZ0hvY3Z1L0RUVUY1bnl0OVhUYnlOTmk2Nlp6?=
 =?utf-8?B?K3B1dk5nOVZVUU9ndkFTcUtrcnQ5MHJjSlZrd2R6L2ZJdHltMGtZekxKM280?=
 =?utf-8?B?eHJ2MkdGVDArK2hrcERrYnVpZFEwb0dhOXc0Y05RLzBTT2ZnajF6djA1Z2dw?=
 =?utf-8?B?bnI3ZWZscENMbTFPNFhEQVNoVDhERE9ISWRDakkvOEg4ZU16NEdvZS9QR2Rw?=
 =?utf-8?B?dFNxQjJ5bFRiU1hqeUd5ZjA0MlRaekdQTUpRc01ydkdaeVBPcWVOT2RhM2Qy?=
 =?utf-8?B?d1VIeVFlY1hkUkN3L080alVnV0FYYkJOS3NWYzhaQzE3TXhDTXMzRXd6cFNq?=
 =?utf-8?B?V3RPdFBxNmFXRDVndlB2OVdxWDVXQzVTRlZiOGZVcWFNcUwyMnpzV2tZbDBN?=
 =?utf-8?B?M0pRQVZlNVlHWi9jWGp1TGRSc3RoSTFmQ2lYRU9vQnk0OFVFZ2tSNTBBc1J3?=
 =?utf-8?B?U3JKK0xTRlYzWEdBQlJQMjRTaW42eWhudEdIRXhFZUwxVE1IYTZrem1BVGoy?=
 =?utf-8?B?UjZsV3VPYWZHcEFaZ2h4bTNKOGpzWDgvbTU2SUgyRGlBVWo0Y0trL1dGRGJT?=
 =?utf-8?B?K2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9473f92a-56c3-40a9-b924-08ddd5774c63
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 05:57:31.9113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h5CgcyM5kaR/JDXemSCtGRp6awpyMiPdkd6p7NiSydDnZ7dIC3tYHiQXpW5FurB9K0+mjSPziSZFI/KG5zATgKua8wWwggIOUq/g73zaS74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8709
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


On 8/7/2025 11:21 AM, Nautiyal, Ankit K wrote:
> Hi Nemesa,
>
> Patch looks good to me. Just a couple of minor suggestions in the 
> inline comments for slight improvements in documentation.
>
> Also, IMO,  drm_crtc might be better than drm-crtc in the subject line.
>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>
>
> On 7/24/2025 7:15 PM, Nemesa Garg wrote:
>> Introduces the new crtc property "SHARPNESS_STRENGTH" that allows

`Introduce a new crtc property` ...

Missed to mention this earlier.

Regards,

Ankit

>> the user to set the intensity so as to get the sharpness effect.
>> The value of this property can be set from 0-255.
>> It is useful in scenario when the output is blurry and user
>> want to sharpen the pixels. User can increase/decrease the
>> sharpness level depending on the content displayed.
>>
>> v2: Rename crtc property variable [Arun]
>>      Add modeset detail in uapi doc[Uma]
>> v3: Fix build issue
>>
>> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
>> ---
>>   drivers/gpu/drm/drm_atomic_uapi.c |  4 ++++
>>   drivers/gpu/drm/drm_crtc.c        | 35 +++++++++++++++++++++++++++++++
>>   include/drm/drm_crtc.h            | 17 +++++++++++++++
>>   3 files changed, 56 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c 
>> b/drivers/gpu/drm/drm_atomic_uapi.c
>> index ecc73d52bfae..2302c2bea28a 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -419,6 +419,8 @@ static int drm_atomic_crtc_set_property(struct 
>> drm_crtc *crtc,
>>           set_out_fence_for_crtc(state->state, crtc, fence_ptr);
>>       } else if (property == crtc->scaling_filter_property) {
>>           state->scaling_filter = val;
>> +    } else if (property == crtc->sharpness_strength_property) {
>> +        state->sharpness_strength = val;
>>       } else if (crtc->funcs->atomic_set_property) {
>>           return crtc->funcs->atomic_set_property(crtc, state, 
>> property, val);
>>       } else {
>> @@ -456,6 +458,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
>>           *val = 0;
>>       else if (property == crtc->scaling_filter_property)
>>           *val = state->scaling_filter;
>> +    else if (property == crtc->sharpness_strength_property)
>> +        *val = state->sharpness_strength;
>>       else if (crtc->funcs->atomic_get_property)
>>           return crtc->funcs->atomic_get_property(crtc, state, 
>> property, val);
>>       else {
>> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
>> index 46655339003d..1b7ce99cea5e 100644
>> --- a/drivers/gpu/drm/drm_crtc.c
>> +++ b/drivers/gpu/drm/drm_crtc.c
>> @@ -229,6 +229,25 @@ struct dma_fence *drm_crtc_create_fence(struct 
>> drm_crtc *crtc)
>>    *         Driver's default scaling filter
>>    *     Nearest Neighbor:
>>    *         Nearest Neighbor scaling filter
>> + * SHARPNESS_STRENGTH:
>> + *    Atomic property for setting the sharpness strength/intensity 
>> by userspace.
>> + *
>> + *    The value of this property is set as an integer value ranging
>> + *    from 0 - 255 where:
>> + *
>> + *    0 means feature is disabled.
>
>
> Should mention here that this is the default value.
>
>> + *
>> + *    1 means minimum sharpness.
>> + *
>> + *    255 means maximum sharpness.
>
> These can just be:
>
> 0: Sharpness feature is disabled (default value).
>
> 1: Minimum sharpness.
>
> 255: Maximum sharpness.
>
>
>> + *
>> + *    User can gradually increase or decrease the sharpness level 
>> and can
>> + *    set the optimum value depending on content and
>
>> this value will be
>> + *    passed to kernel through the Uapi.
>
> Use UAPI. Also, this  can be a separate sentence.
>
>
>> + *    The setting of this property does not require modeset.
>> + *    The sharpness effect takes place post blending on the final 
>> composed output.
>> + *    If the feature is disabled, the content remains same without 
>> any sharpening effect
>> + *    and when this feature is applied, it enhances the clarity of 
>> the content.
>>    */
>>     __printf(6, 0)
>> @@ -940,6 +959,22 @@ int 
>> drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
>>   }
>>   EXPORT_SYMBOL(drm_crtc_create_scaling_filter_property);
>>   +int drm_crtc_create_sharpness_strength_property(struct drm_crtc 
>> *crtc)
>> +{
>> +    struct drm_device *dev = crtc->dev;
>> +    struct drm_property *prop =
>> +        drm_property_create_range(dev, 0, "SHARPNESS_STRENGTH", 0, 
>> 255);
>> +
>> +    if (!prop)
>> +        return -ENOMEM;
>> +
>> +    crtc->sharpness_strength_property = prop;
>> +    drm_object_attach_property(&crtc->base, prop, 0);
>> +
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL(drm_crtc_create_sharpness_strength_property);
>> +
>>   /**
>>    * drm_crtc_in_clone_mode - check if the given CRTC state is in 
>> clone mode
>>    *
>> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
>> index caa56e039da2..2b26b90e82e6 100644
>> --- a/include/drm/drm_crtc.h
>> +++ b/include/drm/drm_crtc.h
>> @@ -317,6 +317,16 @@ struct drm_crtc_state {
>>        */
>>       enum drm_scaling_filter scaling_filter;
>>   +    /**
>> +     * @sharpness_strength:
>> +     *
>> +     * Used by the user to set the sharpness intensity.
>> +     * The value ranges from 0-255.
>
> Perhaps we can add about default value:
>
> Default value is 0, which disables the sharpness feature.
>
>> +     * Any value greater than 0 means enabling the featuring
>
> can simply be: Any value greater than 0 enables sharpening with the 
> specified strength.
>
>
> Regards,
>
> Ankit
>
>> +     * along with setting the value for sharpness.
>> +     */
>> +    u8 sharpness_strength;
>> +
>>       /**
>>        * @event:
>>        *
>> @@ -1088,6 +1098,12 @@ struct drm_crtc {
>>        */
>>       struct drm_property *scaling_filter_property;
>>   +    /**
>> +     * @sharpness_strength_property: property to apply
>> +     * the intensity of the sharpness requested.
>> +     */
>> +    struct drm_property *sharpness_strength_property;
>> +
>>       /**
>>        * @state:
>>        *
>> @@ -1324,4 +1340,5 @@ static inline struct drm_crtc 
>> *drm_crtc_find(struct drm_device *dev,
>>   int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
>>                           unsigned int supported_filters);
>>   bool drm_crtc_in_clone_mode(struct drm_crtc_state *crtc_state);
>> +int drm_crtc_create_sharpness_strength_property(struct drm_crtc *crtc);
>>   #endif /* __DRM_CRTC_H__ */
