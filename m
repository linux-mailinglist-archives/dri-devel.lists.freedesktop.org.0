Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A95ACD2211
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 23:41:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513B810F0FB;
	Fri, 19 Dec 2025 22:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vh8ypWcy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B0310F0FB;
 Fri, 19 Dec 2025 22:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766184080; x=1797720080;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=zmStFqU9NXuwEWoBQSDrfBbdyZpKuzTMAOH198b6cj8=;
 b=Vh8ypWcyb8aAkwvgcFMeTXtygxys/9jTaA3YnW1FOAnAE2N6m+tYIXLS
 PqwCgaV2ldb0ypTVpaVquuMI2XihtVzMG8OvG2of32KRtkA+C1hzDcEiY
 MqlUMtS4kWibX24ihKg+avklI1HgNXZ5xqqPyXULaILd+bT/JzsHI32YQ
 2tveMPZyUe7lRtUBDOracRodqevQEV1UQdJt9hnHCVnoL78Bw3FGx+tWT
 U3kdWagyJMAVBbZXNfZiKv0EunX9Qyd5FqKG8EtSjatVR6EizcsW0rjbe
 DRxpfZPYhs3ZlV6efGvEvf7UTtSIG4cUj43x1hV+IYBjU37QCoD5GEQQ1 g==;
X-CSE-ConnectionGUID: cVXbguKlSVurABdxT/EiXA==
X-CSE-MsgGUID: aBdQ6qOMSU6+AAlSZ/f06A==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="79265412"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="79265412"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 14:41:19 -0800
X-CSE-ConnectionGUID: SrYaxhCkTQ6cCsiSUST91g==
X-CSE-MsgGUID: 3piQ8BY7RbWKdQFVf2lNgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="203390169"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 14:41:18 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 14:41:17 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 14:41:17 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.55)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 14:41:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fqsqhc7YN/Iob6rkVDT5OLovKgnkbEyQ1oLoctjZv5SAEo0b+5BBVBu3Cc7KdVYZpLJngw9Iv+9yBtCmoS2HhZYUIJHuD8Y1NBPfCe3q+Klgiqd660qq1zBlDMrUXUB53jGGCme6eGoAp1hncRy3q7nqWgc1PoQTFcd8+P5KHasyfRxYDsq4vgzZwS0BJmIPjMbjTMj8WaM5qXYnHplz3/kuzgTDZUBuYsGvCQaOaJJjx4C1fks82CAWOzjgDyvPYbvNAEZkqOAb6FAARfs6atbmmnbyN69SHYU7GEVTO6elssLgPZW3kqJ4/l2lndcL5XIRcSsMxoygWcw4jXBLwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6F9jZvumQbwPixQO+GsrRNtSEqwjFrSUsYJxc49tYU=;
 b=vMLZg920MPxG6WzGPyeNM3455yV+nNIjdz1Rjz8EuibbrZmuWVJmewS76DMbJDRoSLrjHH3s2aX9nQMmFMFgno/HnKX4/2NK5NxjIW2DS822xClaL0eLDSl1UUUNvJay/c7jcS9xhHAUXrHIkwVTOuymxDEeTmn2oT8dvGv/8IewtrnWhbwSWvHVQSsuWuoJXEyKJ1OXRmTwlyC+lCXFHawN5enw3RB1yp9vdqwZ5w4Iz+mTEsXFrU5S4YGnhTmEyeIZcauKfaMBOE2TRMTxbYodBpPH0fpTlWQ4hbI9CUgzwIgdXDmaCD2gjWBCMaQmAhCvzFCJ3HcgaGo4qzhoFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY8PR11MB7135.namprd11.prod.outlook.com (2603:10b6:930:61::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Fri, 19 Dec
 2025 22:41:15 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 22:41:15 +0000
Date: Fri, 19 Dec 2025 17:41:08 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Oded
 Gabbay" <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-next
Message-ID: <aUXUhEgzs6hDLQuu@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR03CA0051.namprd03.prod.outlook.com
 (2603:10b6:408:e7::26) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY8PR11MB7135:EE_
X-MS-Office365-Filtering-Correlation-Id: a5331147-9460-47c8-8bfd-08de3f4fb779
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlNLMnRDb2VTRXVYZnN2NDM0bVFpU2I4T3NYNk11YjJrZnlCNFc3cGE4dE5K?=
 =?utf-8?B?UWd4dGxCdktZS2V0Mk5qNTdlYzBRbUR4V3NCaS8weTZMektCNGxFQ2ZNbkRZ?=
 =?utf-8?B?UU0zei9wU2wzckVSNDlwUkRoNzBWV3ZMWTkreXpBTzU3cTlkSDNmQWJCUUdD?=
 =?utf-8?B?SkVwd29rVmtHMkt0SzZnODI2VzMvamdMcXpwSjdDQ3ZIRzB6bkFNeXlSNGMw?=
 =?utf-8?B?ZWRWOWhSbEJORXpZMFNRSEd6Rml3WkxEU0RNUTJEMlFZSms1SVZiSGZ5UkJx?=
 =?utf-8?B?Nys4ZWFJK3JnSjdlVlZsSS82RXRzU3grWjh0U1RObFJuWlkzNnN6elF6dVVh?=
 =?utf-8?B?ZzdmM3BJa2wyQ2tCa0JGU2F3RmVvK0hiTVBJZS96aktKcXE3YkRsM01zRkpz?=
 =?utf-8?B?KzlLb0pBb1R4dmt3bHdicjNFYjcvY0piWlZxMXNYTkQ3VWs4Z2ZjM1Q3bkl1?=
 =?utf-8?B?bXo3b1UzU3RqZFVKSUJJRVFlUTNlYTNBc1ZPUWp2aTdFTWZRcE9EWUNScFRw?=
 =?utf-8?B?Q3kxcTkvSWx1dTA3c3YwN1BOV29oWUpsSGRycnp6WU9qYUt0Zis1RVVrcS8r?=
 =?utf-8?B?YStMenVpeE1mT25XZU9MZUNyQmFzTDVaWElIMUdBVThKR01BaTAwY0d3elpF?=
 =?utf-8?B?Sk9Td2FKVGk2UWU3b1NHZ1JoOEkxYzlvRnZuVlA2L21tNlFoZURmaFB4eStP?=
 =?utf-8?B?S2ZpdjRRQjRtT1duWkgzSFZhM2tlWkxSeGVmcVNNaHJrSDVwenJwQmJUOXpM?=
 =?utf-8?B?aUpTbXhMemNUNXpxa1hTajJZenFvRkIwY2ZOdGJKaUJNaFVxN0l5aHB0TVQr?=
 =?utf-8?B?MWFpS2tvMHUwblZWd1JvVzhIRXlPYmIzdjRESjJ6SmpSVzVaS3JLUU54OVFZ?=
 =?utf-8?B?MTNIeDkyNGplNVdBSWVqTWZpUFlvVEY2TnRQa2FNaWVqUGtIa2RMZ2dadk5x?=
 =?utf-8?B?eE43cTB0d3F6SGlKenBmZnR4MDl3QW9PZzVodkpQVzUzdXZxanZPWlZFNkpw?=
 =?utf-8?B?WEpaYnFJdkhrTVNRQTlLYTdlMmppTHl0eE5uVDFPajY1MWNhdEd3L0hWaURq?=
 =?utf-8?B?Nmp2RWtOcEplS2drTkdiaUhESTlCdVQ2RENsYjRPcWtSMnoxNm9KbzZIV0Mr?=
 =?utf-8?B?ZE9kc21teEx0Q1pGWmc4M3pLa1I5TVUwdi85bjF1bDVvc293MXdlQ2IvTU1J?=
 =?utf-8?B?dTV0TXlXcC80TXZESTc1UVo0dWlhbElXdGRLMU1mcXMvcmtGU09XdlhZRDFx?=
 =?utf-8?B?MExpSHhCaFpxUHNud003K1MwQnBOMnR6Z0VHK0R5WWlLeXpnUUtuYWRZM1pQ?=
 =?utf-8?B?QzYxZ2U1T0dndFZZcFB1MDhQZGt5Z2FNNnU0TVRyb293YmpRUzl6TkR1QkZu?=
 =?utf-8?B?NmxHWGV2NzFtOW9NMERXcFBYY2V0S0RJTWR4dGZoWVUzbzJNTFEvMEROM3RK?=
 =?utf-8?B?QnY0Njl5c3RmemxWb1RLTTZ3Q0VTRnRnRFR2LytaZ1kvdTl6MTcyWGNHYUdX?=
 =?utf-8?B?bFNqK1JQRVo1K1lwcEdURElFV0V4dEtZN0lVTG9SRTNFOFdFbU01Qm1lSi9T?=
 =?utf-8?B?QTU5SlpYZ2V3YVNjVEwrMURaSlJ4MGppb3hYT1ZoYStQNWVxNk1WT0xpS0xz?=
 =?utf-8?B?bitjaThIVHUyZ1NrZEkxekNPUUI1L1lhVWlXcFVPeVhuWFpVelBWZXVIVG50?=
 =?utf-8?B?azN4aU9ZRzNKcjl1alJOdU5lNXh6UVRpdVJTMXV0ZWY0QlNVeFh3Q1k5NGNE?=
 =?utf-8?B?Z1FqMVhqSmVHZGI0UFdTQnVVZXN5L3RIb3JreVVPV05lTzNWVFRRT0tEM0hE?=
 =?utf-8?B?Y2tPS1p3RGwzVENLZ1JnWjNWcGZObWd4WWhwelVnWkcrZnA5YlFkeVZ4N3ZX?=
 =?utf-8?B?VklpMSs2QTdmaHFlVFFRMmN2ZGRETWpXc2hEMGIxZGdaQ1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3V5Wjd6VGRoUm5rdFlBdG5sZnVtdDBTZlh5Y3JpREQrYUN4Q0p5N2Q0SmVr?=
 =?utf-8?B?cjJCUHJtanB6Sm4xTitCUngvU2Vrd2h4ZGNvOHlQQnpKQ1hsYUVnaHM0eEVt?=
 =?utf-8?B?bHA4ZHJ2V3F0am93eVB3WVo0eHRubU9xQVZuTXNBbENkcCtjak1mN1lja1dD?=
 =?utf-8?B?OHJTWUhXRVFmRU93cEFaSG1oQkdONUM4dXVrSGRYeS8zZjU0OHZ0WVBTL25H?=
 =?utf-8?B?VEV1dS9QeUdmaXlPN01hRkFDOFVreDBzTXpWMFIwU2FlZDN4SmtQbHBZcmMy?=
 =?utf-8?B?U2E4MVMzSnZPT3JKUVVVVWtsMFpwNHBRUG9tNktYWGdnNDM4YVdQd2Y3Z2Rj?=
 =?utf-8?B?dFJqTTRSRms2SngwNjlkcXhkV0JFMUVsUVZQNlZCVUZ5SHFMOTEvQ09hc2Zr?=
 =?utf-8?B?NmJKVmQ3MGxmK3lBU2x3UFZENGNNc3l6OXBrTE9TNExHczN1bnVSRHJuYkdG?=
 =?utf-8?B?c2drcVZ1TnZNVlByVDhaVXRreFVSejBZZDQ3LzEydUVQSVYvYjVzSDk3SzlK?=
 =?utf-8?B?VzdkY29NUk5rS1pBMTVhcFVXaFFkbWxOSFpWMW9NbHdaR3NMSklwSFJqWVhS?=
 =?utf-8?B?M0ZmLy9mWWx5dHlsZmUwK21TamJrNnRXQWJBNFRmNHVrSVptNlJQNDdTZEVW?=
 =?utf-8?B?Q3VJSk9tREc2dXN4bnhnZ1M4aDg4cUhUQ2p2dU9PN0FQSWlyOE1rd2c1L0Rq?=
 =?utf-8?B?TjB0Z2V2RTBYRWZWUU5aT0dSTFVLVHdBRDA0TkVwTUozdTEzanpHVVhtNEda?=
 =?utf-8?B?eFh3THBtaS9YMXBMZDJYL0ZreEFOUk82aytyUi91eXFnOEprVEpZenJkbTVH?=
 =?utf-8?B?OEhLbTJiRkkwRGhyZnJsUy9jR0pHaVRJTUMzeHBsMCtia2k3THk0NVlFb0Zt?=
 =?utf-8?B?RFN6YUR3NTc5MlFvdURVRmc3TnR4dkswZWgzZ3BldXpXeDJFTTR5OFBnSUZn?=
 =?utf-8?B?ejBMa3RDRnM1S1RabnZvMS9jWGlITmd1RG5OMHF2VUFvWFg0QnRKU0F0YzhS?=
 =?utf-8?B?NmtyVjJUUjNIazlrUWpOeXU3aUZBQWMzK2NVQlNEV0Z4bkZlOExpTGt2Y2Fl?=
 =?utf-8?B?bm9PcVFvNXYrVU5FbjAwaVE2RElRdS9xb0hNd2h5dWt4V2s1Mmdqa3ZwRllB?=
 =?utf-8?B?V212QUVMbkVid2VoWWVFdUVLY1JYeklqdUtnMEt6TW9KM3dSUzM0SEsybGg3?=
 =?utf-8?B?TVpkdWhoZitGT2xNeldBZVc2SWQ4UEdub0htMENtMW5Td29maWtjNE9xbkJz?=
 =?utf-8?B?cWwrajM3ZEFLSGZWSDd6ek1pOEY3Q2xBMG9KU25NWVNiVlZwNS81WCtUK3Ji?=
 =?utf-8?B?MUJ1bjAwakxFdDhxQ3JKVUl3ZHJTZmFsMXFIcmlVaG1HbDNhR0lSOVBkOHFw?=
 =?utf-8?B?Tnh6NW8wN2FrRDl5Y2d2T2FNM3I5dVV5R2dvWWlUemlIZDkrYi9kMURLYml5?=
 =?utf-8?B?V0NNN0p3eWFLNXgwTmk0d3VORlFhLzMrTGI2dkF6b3ZWT3IxNFhsV0xGREFU?=
 =?utf-8?B?cXdBRmJ5Wm4rc1pUU2hmSG13ZEZKbTZYbXByMDh2SHQ5RVN4RVgrbVBUeFF4?=
 =?utf-8?B?M21kRHh5MktWeURMWVM1VU01RDMxSzBzVnRGSnJzay9PMzI2RzlCbFFTeWF5?=
 =?utf-8?B?NXRoNm9HaGdLTXBxenZFU2pMbzdsVzhYQnJxVU9WNzh3bVEvNFZzTXdwVWp5?=
 =?utf-8?B?TUtDZVZrVjBjRkJmUDgzTDdON2F2N29JV2k2TE5tdHdrcWFTelJLTjhhRmdJ?=
 =?utf-8?B?cTJhbk9oUFo0MFRoemZpM3pOZTlhZk1ibnlSYzdUYlZPa3FHMHUvNWNFM2xP?=
 =?utf-8?B?bkt2cytLTytCVjlYU0hsVTM2blVxdjdsMzV0Y3d4bjJtdncrMkI0Vk5GUE16?=
 =?utf-8?B?dndSQ2pMdHBieUNEaTV0YjFrcUdmWDJDSHZEamUybEluL2NmYWxVMHY4SXI5?=
 =?utf-8?B?cjlKVm90T1BLYWlTN2JucjVGMDVvSURDWWRkZlhJdEphNVhGMTNmdEZsbWpp?=
 =?utf-8?B?c0ZMOHpsV002TENYRXMwa1RZVzhIeWx1WXBGMzM0ZjNhcWxUOG16QytFYlB2?=
 =?utf-8?B?c25RQ3lBMHdLeXhnZHNaSHlpTkpvU2NYdFpnUElib1RPTDU1UThwTU81bk9L?=
 =?utf-8?B?Y0p4TVdISVZMamR3VmoyTk5qZFVxdHl2cnA2QllpS1NaYlRDZEZRZUpGR1hw?=
 =?utf-8?B?b0VtVjBCZHFpVWtUeHN2ZE1Pam1ZcDFBOFpHOGlqMjRFOHREdVJjRTBCM1B5?=
 =?utf-8?B?eVR0M1JVa0VwTG1ZdDl4QnpMR0tZZFJmVnV5MVJwYUYrUjAvbklhWHU5ODVk?=
 =?utf-8?B?UTJ4N29uUXhwZkpobFNCcDYwNnBLUEdNZVpzZ0lIKzk4SnV4YzAyZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5331147-9460-47c8-8bfd-08de3f4fb779
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 22:41:14.9486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fRCjd890ZlR8aBNBG932fGALKzSQA0kbaq84YMdcTss7mXGtSi+4TsPqrezVI1wDZvNjMHPrYRRASlbWEY5Cvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7135
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

Here goes our first drm-xe-next PR towards 7.0.

In the big things we have:
 - xe maintainership change.
 - Many uAPI changes.
 - Many SRIOV changes, specially to support migration in BMG,
   but also the introduction of the new xe-vfio driver.
 - and many more changes, fixes and improvements...

Thanks,
Rodrigo.

drm-xe-next-2025-12-19:
UAPI Changes:
- Multi-Queue support (Niranjana)
- Add DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE (Brost)
- Add NO_COMPRESSION BO flag and query capability (Sanjay)
- Add gt_id to struct drm_xe_oa_unit (Ashutosh)
- Expose MERT OA unit (Ashutosh)
- Sysfs Survivability refactor (Riana)

Cross-subsystem Changes:
- VFIO: Add device specific vfio_pci driver variant for Intel graphics (Winiarski)

Driver Changes:
- MAINTAINERS update (Lucas -> Matt)
- Add helper to query compression enable status (Xin)
- Xe_VM fixes and updates (Shuicheng, Himal)
- Documentation fixes (Winiarski, Swaraj, Niranjana)
- Kunit fix (Roper)
- Fix potential leaks, uaf, null derref, and oversized
  allocations (Shuicheng, Sanjay, Mika, Tapani)
- Other minor fixes like kbuild duplication and sysfs_emit (Shuicheng, Madhur)
- Handle msix vector0 interrupt (Venkata)
- Scope-based forcewake and runtime PM (Roper, Raag)
- GuC/HuC related fixes and refactors (Lucas, Zhanjun, Brost, Julia, Wajdeczko)
- Fix conversion from clock ticks to milliseconds (Harish)
- SRIOV PF PF: Add support for MERT (Lukasz)
- Enable SR-IOV VF migration and other SRIOV updates (Winiarski,
  Satya, Brost, Wajdeczko, Piotr, Tomasz, Daniele)
- Optimize runtime suspend/resume and other PM improvements (Raag)
- Some W/a additions and updates (Bala, Harish, Roper)
- Use for_each_tlb_inval() to calculate invalidation fences (Roper)
- Fix VFIO link error (Arnd)
- Fix ix drm_gpusvm_init() arguments (Arnd)
- Other OA refactor (Ashutosh)
- Refactor PAT and expose debugfs (Xin)
- Enable Indirect Ring State for xe3p_xpc (Niranjana)
- MEI interrupt fix (Junxiao)
- Add stats for mode switching on hw_engine_group (Francois)
- DMA-Buf related changes (Thomas)
- Multi Queue feature support (Niranjana)
- Enable I2C controller for Crescent Island (Raag)
- Enable NVM for Crescent Island (Sasha)
- Increase TDF timeout (Jagmeet)
- Restore engine registers before restarting schedulers after GT reset (Jan)
- Page Reclamation Support for Xe3p Platforms (Brian, Brost, Oak)
- Fix performance when pagefaults and 3d/display share resources (Brost)
- More OA MERT work (Ashutosh)
- Fix return values (Dan)
- Some log level and messages improvements (Brost)
The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2025-12-19

for you to fetch changes up to 844758bd99a86e6a07247784727fb337c4b979ca:

  drm/xe: Print GuC queue submission state on engine reset (2025-12-19 11:45:29 -0800)

----------------------------------------------------------------
UAPI Changes:
- Multi-Queue support (Niranjana)
- Add DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE (Brost)
- Add NO_COMPRESSION BO flag and query capability (Sanjay)
- Add gt_id to struct drm_xe_oa_unit (Ashutosh)
- Expose MERT OA unit (Ashutosh)
- Sysfs Survivability refactor (Riana)

Cross-subsystem Changes:
- VFIO: Add device specific vfio_pci driver variant for Intel graphics (Winiarski)

Driver Changes:
- MAINTAINERS update (Lucas -> Matt)
- Add helper to query compression enable status (Xin)
- Xe_VM fixes and updates (Shuicheng, Himal)
- Documentation fixes (Winiarski, Swaraj, Niranjana)
- Kunit fix (Roper)
- Fix potential leaks, uaf, null derref, and oversized
  allocations (Shuicheng, Sanjay, Mika, Tapani)
- Other minor fixes like kbuild duplication and sysfs_emit (Shuicheng, Madhur)
- Handle msix vector0 interrupt (Venkata)
- Scope-based forcewake and runtime PM (Roper, Raag)
- GuC/HuC related fixes and refactors (Lucas, Zhanjun, Brost, Julia, Wajdeczko)
- Fix conversion from clock ticks to milliseconds (Harish)
- SRIOV PF PF: Add support for MERT (Lukasz)
- Enable SR-IOV VF migration and other SRIOV updates (Winiarski,
  Satya, Brost, Wajdeczko, Piotr, Tomasz, Daniele)
- Optimize runtime suspend/resume and other PM improvements (Raag)
- Some W/a additions and updates (Bala, Harish, Roper)
- Use for_each_tlb_inval() to calculate invalidation fences (Roper)
- Fix VFIO link error (Arnd)
- Fix ix drm_gpusvm_init() arguments (Arnd)
- Other OA refactor (Ashutosh)
- Refactor PAT and expose debugfs (Xin)
- Enable Indirect Ring State for xe3p_xpc (Niranjana)
- MEI interrupt fix (Junxiao)
- Add stats for mode switching on hw_engine_group (Francois)
- DMA-Buf related changes (Thomas)
- Multi Queue feature support (Niranjana)
- Enable I2C controller for Crescent Island (Raag)
- Enable NVM for Crescent Island (Sasha)
- Increase TDF timeout (Jagmeet)
- Restore engine registers before restarting schedulers after GT reset (Jan)
- Page Reclamation Support for Xe3p Platforms (Brian, Brost, Oak)
- Fix performance when pagefaults and 3d/display share resources (Brost)
- More OA MERT work (Ashutosh)
- Fix return values (Dan)
- Some log level and messages improvements (Brost)

----------------------------------------------------------------
Alexander Usyskin (1):
      drm/xe/nvm: enable cri platform

Arnd Bergmann (2):
      drm/xe/pf: fix VFIO link error
      drm/xe: fix drm_gpusvm_init() arguments

Ashutosh Dixit (11):
      drm/xe/oa: Use explicit struct initialization for struct xe_oa_regs
      drm/xe/oa/uapi: Add gt_id to struct drm_xe_oa_unit
      drm/xe/oa: Allow exec_queue's to be specified only for OAG OA unit
      drm/xe/rtp: Refactor OAG MMIO trigger register whitelisting
      drm/xe/rtp: Whitelist OAM MMIO trigger registers
      drm/xe/oa/uapi: Expose MERT OA unit
      drm/xe/rtp: Whitelist OAMERT MMIO trigger registers
      drm/xe/oa: Always set OAG_OAGLBCTXCTRL_COUNTER_RESUME
      drm/xe/oa: Move default oa unit assignment earlier during stream open
      drm/xe/oa: Disallow 0 OA property values
      drm/xe/eustall: Disallow 0 EU stall property values

Balasubramani Vivekanandan (1):
      drm/xe/xe3_lpg: Apply Wa_16028005424

Brian Nguyen (8):
      drm/xe/xe_tlb_inval: Modify fence interface to support PPC flush
      drm/xe/guc: Add page reclamation interface to GuC
      drm/xe: Create page reclaim list on unbind
      drm/xe: Suballocate BO for page reclaim
      drm/xe: Prep page reclaim in tlb inval job
      drm/xe: Append page reclamation action to tlb inval
      drm/xe: Optimize flushing of L2$ by skipping unnecessary page reclaim
      drm/xe: Add debugfs support for page reclamation

Dan Carpenter (2):
      drm/xe/vf: fix return type in vf_migration_init_late()
      drm/xe/xe_sriov_vfio: Fix return value in xe_sriov_vfio_migration_supported()

Daniele Ceraolo Spurio (1):
      drm/xe/pf: Add handling for MLRC adverse event threshold

Francois Dugast (1):
      drm/xe/hw_engine_group: Add stats for mode switching

Harish Chegondi (2):
      drm/xe: Fix conversion from clock ticks to milliseconds
      drm/xe/xe3: Remove graphics IP 30.01 from Wa_18041344222 IP list

Himal Prasad Ghimiray (5):
      drm/xe: Add helper to extend CPU-mirrored VMA range for merge
      drm/xe: Merge adjacent default-attribute VMAs during garbage collection
      drm/xe/svm: Extend MAP range to reduce vma fragmentation
      drm/xe/svm: Enable UNMAP for VMA merging operations
      drm/xe/vm: Skip ufence association for CPU address mirror VMA during MAP

Jagmeet Randhawa (1):
      drm/xe: Increase TDF timeout

Jan Maslak (1):
      drm/xe: Restore engine registers before restarting schedulers after GT reset

Jonathan Cavitt (1):
      drm/xe/xe_sriov_packet: Return int from pf_descriptor_init

Julia Filipchuk (2):
      drm/xe/guc: Recommend GuC v70.53.0 for MTL, DG2, LNL
      drm/xe/guc: Recommend GuC v70.54.0 for BMG, PTL

Junxiao Chang (1):
      drm/me/gsc: mei interrupt top half should be in irq disabled context

Lucas De Marchi (3):
      drm/xe/guc: Fix stack_depot usage
      drm/xe/guc_ct: Cleanup ifdef'ry
      MAINTAINERS: Remove myself from xe maintainers

Lukasz Laguna (4):
      drm/xe: Add device flag to indicate standalone MERT
      drm/xe/pf: Configure LMTT in MERT
      drm/xe/pf: Add TLB invalidation support for MERT
      drm/xe/pf: Handle MERT catastrophic errors

Madhur Kumar (1):
      drm/xe/pmu: Replace sprintf() with sysfs_emit()

Matt Roper (32):
      drm/xe/kunit: Fix forcewake assertion in mocs test
      drm/xe/vm: Use for_each_tlb_inval() to calculate invalidation fences
      drm/xe/forcewake: Add scope-based cleanup for forcewake
      drm/xe/pm: Add scope-based cleanup helper for runtime PM
      drm/xe/gt: Use scope-based cleanup
      drm/xe/gt_idle: Use scope-based cleanup
      drm/xe/guc: Use scope-based cleanup
      drm/xe/guc_pc: Use scope-based cleanup
      drm/xe/mocs: Use scope-based cleanup
      drm/xe/pat: Use scope-based forcewake
      drm/xe/pxp: Use scope-based cleanup
      drm/xe/gsc: Use scope-based cleanup
      drm/xe/device: Use scope-based cleanup
      drm/xe/devcoredump: Use scope-based cleanup
      drm/xe/display: Use scoped-cleanup
      drm/xe: Return forcewake reference type from force_wake_get_any_engine()
      drm/xe/drm_client: Use scope-based cleanup
      drm/xe/gt_debugfs: Use scope-based cleanup
      drm/xe/huc: Use scope-based forcewake
      drm/xe/query: Use scope-based forcewake
      drm/xe/reg_sr: Use scope-based forcewake
      drm/xe/vram: Use scope-based forcewake
      drm/xe/bo: Use scope-based runtime PM
      drm/xe/ggtt: Use scope-based runtime pm
      drm/xe/hwmon: Use scope-based runtime PM
      drm/xe/sriov: Use scope-based runtime PM
      drm/xe/tests: Use scope-based runtime PM
      drm/xe/sysfs: Use scope-based runtime power management
      drm/xe/debugfs: Use scope-based runtime PM
      drm/xe/sync: Use for_each_tlb_inval() to calculate invalidation fences
      drm/xe: Track pre-production workaround support
      drm/xe/lnl: Drop pre-production workaround support

Matthew Brost (23):
      drm/xe/vf: Start re-emission from first unsignaled job during VF migration
      drm/gpusvm: Limit the number of retries in drm_gpusvm_get_pages
      drm/xe: Covert return of -EBUSY to -ENOMEM in VM bind IOCTL
      drm/xe: Add properties line to VM snapshot capture
      drm/xe: Add "null_sparse" type to VM snap properties
      drm/xe: Add mem_region to properties line in VM snapshot capture
      drm/xe: Add pat_index to properties line in VM snapshot capture
      drm/xe: Add cpu_caching to properties line in VM snapshot capture
      drm/xe: Add VM.uapi_flags to VM snapshot capture
      drm/xe/uapi: Add DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
      drm/xe: Add replay_offset and replay_length lines to LRC HWCTX snapshot
      drm/xe: Implement DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
      drm/xe: Do not reference loop variable directly
      drm/xe: Do not forward invalid TLB invalidation seqnos to upper layers
      drm/xe: Adjust long-running workload timeslices to reasonable values
      drm/xe: Use usleep_range for accurate long-running workload timeslicing
      drm/xe: Add debugfs knobs to control long running workload timeslicing
      drm/xe: Skip exec queue schedule toggle if queue is idle during suspend
      drm/xe: Wait on in-syncs when swicthing to dma-fence mode
      drm/xe: Add GT stats ktime helpers
      drm/xe: Add more GT stats around pagefault mode switch flows
      drm/xe: Increase log level for unhandled page faults
      drm/xe: Print GuC queue submission state on engine reset

Michal Wajdeczko (6):
      drm/xe/pf: Use div_u64 when calculating GGTT profile
      drm/xe/pf: Fix .bulk_profile/sched_priority description
      drm/xe/guc: Fix version check for page-reclaim feature
      drm/xe: Introduce IF_ARGS macro utility
      drm/xe/guc: Introduce GUC_FIRMWARE_VER_AT_LEAST helper
      drm/xe/pf: Prepare for new threshold KLVs

Michał Winiarski (7):
      drm/xe/pf: Fix kernel-doc warning in migration_save_consume
      drm/xe/pf: Drop the VF VRAM BO reference on successful restore
      drm/xe/pf: Check for fence error on VRAM save/restore
      drm/xe/pf: Enable SR-IOV VF migration
      drm/xe/pci: Introduce a helper to allow VF access to PF xe_device
      drm/xe/pf: Export helpers for VFIO
      vfio/xe: Add device specific vfio_pci driver variant for Intel graphics

Mika Kuoppala (1):
      drm/xe: Fix memory leak when handling pagefault vma

Niranjana Vishwanathapura (18):
      drm/xe/xe3p_xpc: Enable Indirect Ring State for xe3p_xpc
      drm/xe/multi_queue: Add multi_queue_enable_mask to gt information
      drm/xe/multi_queue: Add user interface for multi queue support
      drm/xe/multi_queue: Add GuC interface for multi queue support
      drm/xe/multi_queue: Add multi queue priority property
      drm/xe/multi_queue: Handle invalid exec queue property setting
      drm/xe/multi_queue: Add exec_queue set_property ioctl support
      drm/xe/multi_queue: Add support for multi queue dynamic priority change
      drm/xe/multi_queue: Add multi queue information to guc_info dump
      drm/xe/multi_queue: Handle tearing down of a multi queue
      drm/xe/multi_queue: Set QUEUE_DRAIN_MODE for Multi Queue batches
      drm/xe/multi_queue: Handle CGP context error
      drm/xe/multi_queue: Reset GT upon CGP_SYNC failure
      drm/xe/multi_queue: Teardown group upon job timeout
      drm/xe/multi_queue: Tracepoint support
      drm/xe/multi_queue: Support active group after primary is destroyed
      drm/xe/doc: Add documentation for Multi Queue Group
      drm/xe/doc: Add documentation for Multi Queue Group GuC interface

Oak Zeng (1):
      drm/xe: Add page reclamation info to device info

Piotr Piórkowski (1):
      drm/xe: Move VRAM MM debugfs creation to tile level

Raag Jadav (8):
      drm/xe/vf: Update pause/unpause() helpers with VF naming
      drm/xe/guc_submit: Introduce pause/unpause() helpers for PF
      drm/xe/pm: Assert on runtime suspend if VFs are enabled
      drm/xe/gt: Introduce runtime suspend/resume
      drm/xe/gt: Use scope-based forcewake
      drm/xe/guc_ct: Assert on credits mismatch during runtime suspend
      drm/xe/throttle: Skip reason prefix while emitting array
      drm/xe/cri: Enable I2C controller

Riana Tauro (5):
      drm/xe/xe_survivability: Redesign survivability mode
      drm/xe/xe_survivability: Add support for survivability mode v2
      drm/xe/xe_survivability: Remove unused index
      drm/xe/xe_survivability: Use static for survivability info attributes
      drm/xe/xe_survivability: Add index bound check

Rodrigo Vivi (1):
      MAINTAINERS: Update Xe driver maintainers

Sanjay Yadav (2):
      drm/xe/oa: Fix potential UAF in xe_oa_add_config_ioctl()
      drm/xe/uapi: Add NO_COMPRESSION BO flag and query capability

Satyanarayana K V P (8):
      drm/xe/sa: Shadow buffer support in the sub-allocator pool
      drm/xe/vf: Shadow buffer management for CCS read/write operations
      drm/xe/vf: Enable VF migration only on supported GuC versions
      drm/xe/vf: Introduce RESFIX start marker support
      drm/xe/vf: Requeue recovery on GuC MIGRATION error during VF post-migration
      drm/xe/vf: Add debugfs entries to test VF double migration
      drm/xe/vf: Fix queuing of recovery work
      drm/xe/vf: Reset recovery_queued after issuing RESFIX_START

Shuicheng Lin (6):
      drm/xe: Prevent BIT() overflow when handling invalid prefetch region
      drm/xe: Remove duplicate DRM_EXEC selection from Kconfig
      drm/xe/guc: Fix resource leak in xe_guc_ct_init_noalloc()
      drm/xe: Fix freq kobject leak on sysfs_create_files failure
      drm/xe: Limit num_syncs to prevent oversized allocations
      drm/xe/oa: Limit num_syncs to prevent oversized allocations

Swaraj Gaikwad (1):
      drm/xe: Fix documentation heading levels in xe_guc_pc.c

Tapani Pälli (1):
      drm/xe: Fix NULL pointer dereference in xe_exec_ioctl

Thomas Hellström (4):
      Merge drm/drm-next into drm-xe-next
      drm/xe/bo: Don't include the CCS metadata in the dma-buf sg-table
      drm/xe: Drop preempt-fences when destroying imported dma-bufs.
      Merge drm/drm-next into drm-xe-next

Tomasz Lis (2):
      drm/xe: Protect against unset LRC when pausing submissions
      drm/xe/vf: Stop waiting for ring space on VF post migration recovery

Venkata Ramana Nayana (1):
      drm/xe/irq: Handle msix vector0 interrupt

Vinay Belgaumkar (1):
      drm/xe: Apply Wa_14020316580 in xe_gt_idle_enable_pg()

Xin Wang (3):
      drm/xe/pat: Add helper to query compression enable status
      drm/xe: Refactor PAT dump to use shared helpers
      drm/xe: expose PAT software config to debugfs

Zbigniew Kempczyński (1):
      drm/xe: Add caching pagetable flag

Zhanjun Dong (8):
      drm/xe/guc: Cleanup GuC log buffer macros and helpers
      drm/xe/uc: Change assertion to error on huc authentication failure
      drm/xe/guc: Add log init config abi definitions
      drm/xe/guc: Add LFD related abi definitions
      drm/xe/guc: Add GuC log init config in LFD format
      drm/xe/guc: Add GuC log event buffer output in LFD format
      drm/xe/guc: Only add GuC crash dump if available
      drm/xe/guc: Add new debugfs entry for lfd format output

 .mailmap                                           |   1 +
 .../ABI/testing/sysfs-driver-intel-xe-sriov        |   2 +-
 Documentation/gpu/xe/xe_exec_queue.rst             |  14 +
 MAINTAINERS                                        |   2 +-
 drivers/gpu/drm/drm_gpusvm.c                       |   3 +
 drivers/gpu/drm/xe/Makefile                        |   2 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h           |   6 +
 drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h     |  67 +-
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h              |   9 +
 drivers/gpu/drm/xe/abi/guc_lfd_abi.h               | 171 +++++
 drivers/gpu/drm/xe/abi/guc_lic_abi.h               |  77 +++
 drivers/gpu/drm/xe/abi/guc_log_abi.h               |  42 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c             |  23 +-
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c           |  31 +-
 drivers/gpu/drm/xe/instructions/xe_gpu_commands.h  |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h               |   3 +
 drivers/gpu/drm/xe/regs/xe_gtt_defs.h              |   1 +
 drivers/gpu/drm/xe/regs/xe_guc_regs.h              |   3 +
 drivers/gpu/drm/xe/regs/xe_irq_regs.h              |   1 +
 drivers/gpu/drm/xe/regs/xe_mert_regs.h             |  21 +
 drivers/gpu/drm/xe/regs/xe_oa_regs.h               |  17 +
 drivers/gpu/drm/xe/tests/xe_args_test.c            |  54 ++
 drivers/gpu/drm/xe/tests/xe_bo.c                   |  10 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c              |   3 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c              |  10 +-
 drivers/gpu/drm/xe/tests/xe_mocs.c                 |  27 +-
 drivers/gpu/drm/xe/xe_args.h                       |  27 +
 drivers/gpu/drm/xe/xe_bo.c                         |  41 +-
 drivers/gpu/drm/xe/xe_bo.h                         |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c                    | 143 +++-
 drivers/gpu/drm/xe/xe_devcoredump.c                |  30 +-
 drivers/gpu/drm/xe/xe_device.c                     | 102 ++-
 drivers/gpu/drm/xe/xe_device.h                     |   5 +
 drivers/gpu/drm/xe/xe_device_sysfs.c               |  33 +-
 drivers/gpu/drm/xe/xe_device_types.h               |  27 +
 drivers/gpu/drm/xe/xe_dma_buf.c                    |   2 +-
 drivers/gpu/drm/xe/xe_drm_client.c                 |  67 +-
 drivers/gpu/drm/xe/xe_eu_stall.c                   |   2 +-
 drivers/gpu/drm/xe/xe_exec.c                       |  12 +-
 drivers/gpu/drm/xe/xe_exec_queue.c                 | 455 ++++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue.h                 |  68 ++
 drivers/gpu/drm/xe/xe_exec_queue_types.h           |  62 ++
 drivers/gpu/drm/xe/xe_execlist.c                   |   2 +-
 drivers/gpu/drm/xe/xe_force_wake.c                 |   7 +
 drivers/gpu/drm/xe/xe_force_wake.h                 |  40 ++
 drivers/gpu/drm/xe/xe_ggtt.c                       |   3 +-
 drivers/gpu/drm/xe/xe_gsc.c                        |  21 +-
 drivers/gpu/drm/xe/xe_gsc_debugfs.c                |   3 +-
 drivers/gpu/drm/xe/xe_gsc_proxy.c                  |  17 +-
 drivers/gpu/drm/xe/xe_gt.c                         | 181 ++---
 drivers/gpu/drm/xe/xe_gt.h                         |   2 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c                 |  30 +-
 drivers/gpu/drm/xe/xe_gt_freq.c                    |  31 +-
 drivers/gpu/drm/xe/xe_gt_idle.c                    |  49 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         |  19 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c        |  21 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c      |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c                | 172 +++--
 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c        |  12 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h          |  13 +
 drivers/gpu/drm/xe/xe_gt_stats.c                   |  10 +
 drivers/gpu/drm/xe/xe_gt_stats.h                   |  32 +
 drivers/gpu/drm/xe/xe_gt_stats_types.h             |   5 +
 drivers/gpu/drm/xe/xe_gt_throttle.c                |  11 +-
 drivers/gpu/drm/xe/xe_gt_types.h                   |   5 +
 drivers/gpu/drm/xe/xe_guc.c                        |  80 ++-
 drivers/gpu/drm/xe/xe_guc.h                        |  23 +
 drivers/gpu/drm/xe/xe_guc_ads.c                    |   6 +-
 drivers/gpu/drm/xe/xe_guc_buf.c                    |   2 +-
 drivers/gpu/drm/xe/xe_guc_capture.c                |  16 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                     | 273 +++++---
 drivers/gpu/drm/xe/xe_guc_ct.h                     |   2 +
 drivers/gpu/drm/xe/xe_guc_debugfs.c                |  15 +-
 drivers/gpu/drm/xe/xe_guc_fwif.h                   |  10 +-
 .../gpu/drm/xe/xe_guc_klv_thresholds_set_types.h   |   6 +
 drivers/gpu/drm/xe/xe_guc_log.c                    | 507 +++++++++++---
 drivers/gpu/drm/xe/xe_guc_log.h                    |  30 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                     |  66 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                 | 734 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_submit.h                 |   9 +-
 drivers/gpu/drm/xe/xe_guc_submit_types.h           |  13 +
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c              |  41 +-
 drivers/gpu/drm/xe/xe_heci_gsc.c                   |   4 +-
 drivers/gpu/drm/xe/xe_huc.c                        |   7 +-
 drivers/gpu/drm/xe/xe_huc_debugfs.c                |   3 +-
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c      |  16 +-
 drivers/gpu/drm/xe/xe_hw_engine_group.c            |  79 ++-
 drivers/gpu/drm/xe/xe_hw_engine_group.h            |   4 +-
 drivers/gpu/drm/xe/xe_hwmon.c                      |  52 +-
 drivers/gpu/drm/xe/xe_i2c.c                        |   2 +-
 drivers/gpu/drm/xe/xe_irq.c                        |   2 +
 drivers/gpu/drm/xe/xe_lmtt.c                       |  25 +-
 drivers/gpu/drm/xe/xe_lrc.c                        |  73 +-
 drivers/gpu/drm/xe/xe_lrc.h                        |   7 +-
 drivers/gpu/drm/xe/xe_lrc_types.h                  |   3 +
 drivers/gpu/drm/xe/xe_mert.c                       |  82 +++
 drivers/gpu/drm/xe/xe_mert.h                       |  32 +
 drivers/gpu/drm/xe/xe_migrate.c                    |  57 +-
 drivers/gpu/drm/xe/xe_migrate.h                    |   3 +
 drivers/gpu/drm/xe/xe_mocs.c                       |  18 +-
 drivers/gpu/drm/xe/xe_nvm.c                        |  34 +-
 drivers/gpu/drm/xe/xe_oa.c                         | 106 ++-
 drivers/gpu/drm/xe/xe_oa_types.h                   |   1 +
 drivers/gpu/drm/xe/xe_page_reclaim.c               | 136 ++++
 drivers/gpu/drm/xe/xe_page_reclaim.h               | 105 +++
 drivers/gpu/drm/xe/xe_pagefault.c                  |  36 +-
 drivers/gpu/drm/xe/xe_pat.c                        | 220 ++++--
 drivers/gpu/drm/xe/xe_pat.h                        |  21 +
 drivers/gpu/drm/xe/xe_pci.c                        |  29 +
 drivers/gpu/drm/xe/xe_pci_sriov.c                  |  10 +-
 drivers/gpu/drm/xe/xe_pci_types.h                  |   6 +
 drivers/gpu/drm/xe/xe_pcode_api.h                  |   2 +
 drivers/gpu/drm/xe/xe_pm.c                         |  10 +-
 drivers/gpu/drm/xe/xe_pmu.c                        |   2 +-
 drivers/gpu/drm/xe/xe_pt.c                         | 135 +++-
 drivers/gpu/drm/xe/xe_pt_types.h                   |   5 +
 drivers/gpu/drm/xe/xe_pxp.c                        |  55 +-
 drivers/gpu/drm/xe/xe_query.c                      |  23 +-
 drivers/gpu/drm/xe/xe_reg_sr.c                     |  17 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c              |  81 ++-
 drivers/gpu/drm/xe/xe_ring_ops.c                   |  70 +-
 drivers/gpu/drm/xe/xe_sa.c                         |  67 +-
 drivers/gpu/drm/xe/xe_sa.h                         |  20 +-
 drivers/gpu/drm/xe/xe_sa_types.h                   |   3 +
 drivers/gpu/drm/xe/xe_sriov_packet.c               |   2 +-
 drivers/gpu/drm/xe/xe_sriov_pf.c                   |   4 +
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c           |   6 +-
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c             |  16 +-
 drivers/gpu/drm/xe/xe_sriov_vf.c                   |  84 ++-
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c               |  27 +-
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h               |   1 +
 drivers/gpu/drm/xe/xe_sriov_vfio.c                 |   2 +-
 drivers/gpu/drm/xe/xe_survivability_mode.c         | 279 +++++---
 drivers/gpu/drm/xe/xe_survivability_mode_types.h   |  28 +-
 drivers/gpu/drm/xe/xe_svm.c                        |  88 ++-
 drivers/gpu/drm/xe/xe_svm.h                        |   2 +-
 drivers/gpu/drm/xe/xe_sync.c                       |  33 +-
 drivers/gpu/drm/xe/xe_sync.h                       |   2 +
 drivers/gpu/drm/xe/xe_tile.c                       |   5 +
 drivers/gpu/drm/xe/xe_tile_debugfs.c               |  17 +-
 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c      |   3 +-
 drivers/gpu/drm/xe/xe_tlb_inval.c                  |  27 +-
 drivers/gpu/drm/xe/xe_tlb_inval.h                  |   2 +-
 drivers/gpu/drm/xe/xe_tlb_inval_job.c              |  36 +-
 drivers/gpu/drm/xe/xe_tlb_inval_job.h              |   4 +
 drivers/gpu/drm/xe/xe_tlb_inval_types.h            |   5 +-
 drivers/gpu/drm/xe/xe_trace.h                      |  46 ++
 drivers/gpu/drm/xe/xe_uc.c                         |  35 +-
 drivers/gpu/drm/xe/xe_uc.h                         |   2 +
 drivers/gpu/drm/xe/xe_uc_fw.c                      |  10 +-
 drivers/gpu/drm/xe/xe_vm.c                         | 158 ++++-
 drivers/gpu/drm/xe/xe_vm.h                         |   3 +
 drivers/gpu/drm/xe/xe_vm_types.h                   |   3 +-
 drivers/gpu/drm/xe/xe_vram.c                       |   6 +-
 drivers/gpu/drm/xe/xe_wa.c                         |  60 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules                 |   7 +-
 include/uapi/drm/xe_drm.h                          |  82 ++-
 157 files changed, 5404 insertions(+), 1543 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/abi/guc_lfd_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/guc_lic_abi.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_mert_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_mert.c
 create mode 100644 drivers/gpu/drm/xe/xe_mert.h
 create mode 100644 drivers/gpu/drm/xe/xe_page_reclaim.c
 create mode 100644 drivers/gpu/drm/xe/xe_page_reclaim.h
