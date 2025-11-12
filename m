Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EEEC52776
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:24:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8540010E741;
	Wed, 12 Nov 2025 13:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="epCycDtw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4C910E742;
 Wed, 12 Nov 2025 13:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762953875; x=1794489875;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=/LsDogIh/fIIpzuhpbV6lVZldSc8H9rcNkRK+TQOpT4=;
 b=epCycDtwcymT4AgdBfvzS96Oxs+fdLMbw9J7SeM8R77S+MZslXTNwOWT
 ABECi6pZ0MnaNmpM6O6JvcIpKV3miImyjTzp9DBmckGjkdMlKu87dZ8Dn
 +HTnO+9rrougECa55pOz4pDX+yPEbxEbVXE0xx8zyneEvIpY23IjYlTLr
 Td+uVcOH5wrMQNvp55IuwF+XP9NzUTvOyD/ddhOOIjxMiNvNCNBlg9mbr
 mYgUsskb/rb4VRIHCqpCVZ5eth2YeNbugiIQz5J+uksqhfGaeoDAKh3be
 sVRBqMpxu/D3IhnTg96x0ZNzZbcpc4YNW8fHu5y9DpH1bld6zx3DFm9yJ w==;
X-CSE-ConnectionGUID: aC9jA5HDQ6ajCEh424T4/A==
X-CSE-MsgGUID: nlIQRINmTqqkUgSKmCEXgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="75322795"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="75322795"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:24:35 -0800
X-CSE-ConnectionGUID: Ae1EJoxGQgeWrducHuOL/w==
X-CSE-MsgGUID: 8BCzE4hISlKruzOcn/tS/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="188858108"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:24:35 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:24:34 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 05:24:34 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:24:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mALTVZuSprWG1he59C/ODlzQOnzwXxxyjfKsltpdD3vsSSWDn0rx8dK/IIwqxxHTosu48KQal2O1LgEG9HEFfwIq4+MB2bLM2koVk+mx2YtzgL1fUzzysY9poDr2WLi9L3Y3z58zIU1P2UvkaFphTLsvRAgPKVfX2UOlfPx7Pr6cswOWo0GufV0RP9cwmToMh2DRoNZ2FSb8504qQAf/eCLgSxiUpi1NjollFWAM7eEA6APR1/ie9iFSPHjfaZ6R1NuNw3p9mB3IMz02g1Y98AXB9b2lXbN4j3Ayoz7ShFm+x4WkomHHdH07E6J9HMszsW3ZCLtyZGqXqU51+AoqFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMQmn7VegruCdovVcQlbC23p09kpu33Eqba+ifgVVQM=;
 b=duT+j6jLYA4lMYnJPo3dTyv0yfj9mh6OSttudoYoh7yCvVWP/WM85dVpk4DB69TrHigawAfyl2bBrxlZ4MLiUGTdAwaBTClPH8GxHz4rrbnIuciwRcMsbm3VPn7yGPBz1TVsusk9rUJ0lU4nyWbCSeC633EGfRRI13VWN8XVEr6mgoAOwZFnXGJTf4ZYHSMzyd9/RwrFPmTrOASamp3Zp819kAUfUFB4oXpWT4gURzgyYuKtD3ivKvWOgZJOOOWUE5sjjYw2gH1Uq2nU4yHPzUU71A66hMaP46UU3gQ6YZe+LnWqeKlSue+OIEmXZjmy58uBd3I8VutuufoOLxlOtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 LV1PR11MB8849.namprd11.prod.outlook.com (2603:10b6:408:2b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 13:24:31 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:24:31 +0000
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
Subject: [PATCH 24/24] drm/intel/bmg: Allow device ID usage with
 single-argument macros
Date: Wed, 12 Nov 2025 14:22:20 +0100
Message-ID: <20251112132220.516975-25-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112132220.516975-1-michal.winiarski@intel.com>
References: <20251112132220.516975-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::19) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|LV1PR11MB8849:EE_
X-MS-Office365-Filtering-Correlation-Id: d4c71740-084d-4303-0f44-08de21eed02e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0Npb2xmWWduVms2ZHlkNTN4Rk1rVWxiQk1GSHFIcWR2R0lWUDRKWTFOaXVD?=
 =?utf-8?B?U3hSbTRraENpZjdYcUE1TEVoL1ZzUHpFcjk4NmlBREVTdG9ZaG1rUmlodzZp?=
 =?utf-8?B?THpmcnRQM05CQnpNRVh4WmNtTmJHS3ZYMkQrNmZsSkdpNEdocnVuc1JSUk91?=
 =?utf-8?B?VGliUTJIS1ZMRXRNM2U5RHM4blEyK3MydnoraEpnZmp2MGRqR0hDSnUvT2dE?=
 =?utf-8?B?aSsxUUFKSlZpL0NQaGt5N0p0bExCNXFRRThueURMamNiT3MzUm02dEZ6RWh0?=
 =?utf-8?B?QlFBSmlSRDd1RUZvTk9KTUdDZzB0dDZjVzFuKy9Uc3NqK0haYzBwZ3dXT2NH?=
 =?utf-8?B?TjJXcWJweVFiS2pCNTFTcE9uVWlSRzhTcm1qRVd6RFJtd0JTSk5nUU1PWW9w?=
 =?utf-8?B?bzhKYldtdjl4T2tidlBQYTdrTjlwS0JVeUNDNzFqTlJ4alRaSGhmZGl6dktv?=
 =?utf-8?B?Qi9uUXlxZGh3SWxSM08zTld3WGtsM1ZxdHcxSEhMczkzRUpWbHhDRDZKZDBk?=
 =?utf-8?B?TVhXZEVSSlNrMWVrU3FmRFpDT2NFQXhjMXZDKzJMRkpMVlFQT1pPb0VjZXgx?=
 =?utf-8?B?UHBUOVBONDJhZU02bm5XS0ZFeVpKOHBoa1VoSEFNUXNjdC8zS0NiNlNlT01C?=
 =?utf-8?B?NEF0MTJsQmdQTWNaN0F3cEg3ZTF1d2xSakZWbUk1RGY2N1M4bU1pQk5kdEJs?=
 =?utf-8?B?aFYvcDUwaG5oY0JCVXhUbkZFajZoaDgyQUFGZXVJZ2gyWDFzdFpkQy8xL3c5?=
 =?utf-8?B?SDlVL0FwaWFoM2hzSVVXTEpPQkt1eStxd055ZVdYZE1zaERJQUppdkVkb01z?=
 =?utf-8?B?VXV1blNjaldEVWg3TEJ5cktSZlo2eWdyanp4VDlnOEpIV0QxNGl3M2t2SWMx?=
 =?utf-8?B?RTA1R0VoMkYvTlc3b3JyaWRiZEN6Q0IvdnVEZkJrM3o4enRGTnM5Rk5nOFRO?=
 =?utf-8?B?TGl2dTJ0a3JBeWRQWUVIdHBCMTVlOWszYXFVSXIvbTgwc2YyajNXQkQ2WEFO?=
 =?utf-8?B?cy9aTUZFTGRaOFdQTVhtbGFtVHZWMXlXL1lpQkZ5eGszVko0Y29NTXgyclh1?=
 =?utf-8?B?YnFKYlZQeWFMT2pMWkdZcjRMd3VaeFVudTJ3djZYZ3VXVlV4OUZZNUcwMG9I?=
 =?utf-8?B?K3hiSU9WVkJBaFU0RTBaY3NxMDQ5Wk5oOEQyK0x3b0dJV2xwenhmOWs3RFpq?=
 =?utf-8?B?Q1pQaFoyUW54akR3ekFKRjlqd3VOUUwrbkdjSDkrYVZHWFAyVTVkSzVoRW5W?=
 =?utf-8?B?aTdGTFZSQ0N1cWhxd2lvR2FzL1ZKVFVMejVFSWtQeUdTNVRMeUNmSnFPRjVM?=
 =?utf-8?B?SW9jdjk5MHFEdVdSWndzT2RxV1V0ZGtuN1BSZW1IZ0gyazU1amRmVUVudmw1?=
 =?utf-8?B?UFJUVmdXMisrTFNwSGdDRnVWQVJiRGVBR3hCMlRDSUpSc1dTa3dsbU4wV2Nm?=
 =?utf-8?B?anBYKzZRamxYOWhVWDVYd1dYdXRmOWhyU1BNL1ZEeTFidnJXaXFrY0hMU3V0?=
 =?utf-8?B?eFVobzF3NFJoM3FhNllzV3hVOEU0Ny9BRFBLNk0wdTB0em9xZyswakpWTGt3?=
 =?utf-8?B?TGpQcHJ2V2p3TWlZNGMwckllaCtLOTBkcFJoVEZ3c0MvN2NBZ0N4N3A5M0Vy?=
 =?utf-8?B?cm14bVBMV0N5WEZMWmIvaVFVYWdieFBoSjZlcHhab1VZSUxiemZDTkh3eHpP?=
 =?utf-8?B?WjYxUEM0WVdhTnB5djdTckpETzVocjhscjN4bkFnUzRGaUdlT3FNbDNiTVRk?=
 =?utf-8?B?eXUyb0lqWlUwbGpUSmdWRW5EMjVjWlhJUDFxZUFLWmFrRFBhOFFUVDM2RE4z?=
 =?utf-8?B?eUdmcXl2TGpLdmVQQS80VHFmRkR6c3piMWlEa0xiUDVidlNSSm8xZmFGSFp3?=
 =?utf-8?B?ZHNSbG95K0Rad1JzUmFCZU1YVWF0SjdhN05hMUk0QXJIeklyVXpVeE80Rjc4?=
 =?utf-8?Q?z8xAYWZxE0P33V1Rye2PUZRAvbfcs7E5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2RBanJudWN0c0dhMTJUU1J5WHMzcHJRSmNpL1JXejA1ZFRTV25zcS9rQWlX?=
 =?utf-8?B?anhwR0ZWeDhPcnFXTU54TEJmVFpTYXN0Q0Zxa1VXVHQ0ZzZUSllDNDNSc3hJ?=
 =?utf-8?B?SW91OVFjVkx5Q0x1dEsvbkg1VGhrdXlZcjRDUU14d3Uwb2VsY05FR21RM0lF?=
 =?utf-8?B?a3NDSXRXY1RrMGlyblRvNFp6TzhpTUhDcVVJTkZESUl5MUlqSXNCemc5OU9R?=
 =?utf-8?B?YXRvYXZORjF1ME9mWFZTYjRrT2V1R2V6ZGZTSXJOTHlZelIzZlMrNGNpZTUx?=
 =?utf-8?B?YUtjTE5kb3oyL2x0MFpBSndpTHpSSDBoZDRZVk9xY1lwaE9kR3J4MjdyZktM?=
 =?utf-8?B?ZU1VRHJRa2d4cG1kSWxNZkk3SnM5V29BMGNNeG5vZ2Fad25yMFFQRld0V0lh?=
 =?utf-8?B?SVBWY0pSTythN25JY3YvK25lUVgwQmpGTVEvemdMTUJtb1BCV0swT1B0Wm5K?=
 =?utf-8?B?YnpEZlRlUXZRMGlJbk1uL3RtQmNDRkZCbEFhUlJMYTNhY1F3d2dvOHFGQnYv?=
 =?utf-8?B?SUZLMVVCVGJWZGtvREs2aUxsSnduNGFwdzNyWXR5azJZSVhkdkJqOTRGM3Fq?=
 =?utf-8?B?WW15OHU0QThxbVk2Z3RRaGM5aDhNMmVNZ0FCTndkd1NIaXpCNjNidHFHYm4r?=
 =?utf-8?B?NVBMUFhkWUZMaDE4K0Q5dDh4MnhnUEdsUU83QXRBT0xWYWZsWVdtYnRyT2FT?=
 =?utf-8?B?Z2JSang4S2lIVTZxbEdMQnpqVHdZcFBNU0hyMDJ0Q0xJY1ZOQWZzK0NySE05?=
 =?utf-8?B?ZjN3dlRZMnI0ZEI4TjZQNGV3K2VQVW5aQ2ZvNGtsMWZFWVZHTnhsdEVLbVQz?=
 =?utf-8?B?bm5XRXBmL1AyditwaFBST2luTzNFcXRGbTVrNUs2OHVoM1VUMDkyUkNHNmVK?=
 =?utf-8?B?dUJyOUltenFnZkthSE5FNGhBVWtrV203UHBGdHhtTXBORjF0K1plSEhlVjhu?=
 =?utf-8?B?OWs1dk1Oa2FnaStUeVZBSlJvd1hCQUJyMml6aHdQN29seFRSZlJiV0xmQUY5?=
 =?utf-8?B?a2g0QVdSYTNrWUxTclBFZnNGKzl1cUgzaWVUQjZuc0x4aGRDZktBMWhPMGp3?=
 =?utf-8?B?MVJYWkgrbEhBdnMvWGVWU2hTazBvK2pPekJPZ1hETCtPaW5lTHJRekFMdnlj?=
 =?utf-8?B?d1lCdS9uNW5JUzg4TnpiOCtYYWNHVVNLQU1IRFczdG9MZUN0aVJtejA2RGZy?=
 =?utf-8?B?S1UvUW5DVTNNSnZCeUFGU0tuK3FBd0d1V2t2NjNZWUVsaTA4b2FNVTZDWUpo?=
 =?utf-8?B?dTZCQVN6QTQ5TENRaXNhUU9LbWtxb25oRmJPQzRDYkxDSVVHUkkrRXZxUjY3?=
 =?utf-8?B?b2NCaUZQbzE2ak00aGlWRHI2SE83Q0hFMHRHbVVsV2VOU3BSV3lJSlVZVmRL?=
 =?utf-8?B?Rm9UVjE0ai91cXlSU1FDdk9FYWJxTE1aaFlMTGtzbW5tNkxpUC9WUG0xSjYz?=
 =?utf-8?B?V2QrNEwrUytOWlRkOEM5VGV2UlhSVFlIZjliUXJXVytzQ1RnQ2lndHpjYUJJ?=
 =?utf-8?B?eHBTWTgwR2htVWtrTXlRd1g2bVJDOFNZUkw3U3NtNHdsSVRpa3FjNkpFWmdQ?=
 =?utf-8?B?Q2RJKzlFSHMwa2haNnZNTzhYd0JUcG1EeERBTXZqM0RJVGVEQWYzS1VzUE9D?=
 =?utf-8?B?bXFtdkNPeGlEYUpYZG82WEpiRlhFTzA3eEJxa2tOanlFMXArbUwwRUZjS3E5?=
 =?utf-8?B?R0NURkllMTNLaXk2UjBBbmcvR2kvdmFJWnQ4QkhsbndMOE9HcDNjSzN5ZGtj?=
 =?utf-8?B?T0Y2VXMxWm5CNGQ2QTdteFNId3JubTAxdE0zSTlTZjB2dWZCaWtYSktqQjJz?=
 =?utf-8?B?L01vUy9TQW5nSzA1Rm9lL1RGNVJsZ1JsTm53LytEOHpHUDNNVHZobG4xUzNl?=
 =?utf-8?B?RFdmQkVpcWI3MlpEZUs5dFZNZzhrZ25ndHZlUW1JSEZJdis0Q3lRQnFFN2hl?=
 =?utf-8?B?OVdFRXNYR1VRWnhnZ1dQR25aU3RRU0cxOEpMNEZDdGs5REtIQURwdEhFNVNM?=
 =?utf-8?B?VE5TRHJsUnFydlJFMFhsNDR1cjNwYzhDQjBRbXdpUUVKa3AzUzk4eFNmN0Q3?=
 =?utf-8?B?UnVDbFJsVTVKL241c0lHdjlxM3BmOXpaNHpLK3BWaytpWTRQVFJ2TzBZdWhM?=
 =?utf-8?B?Q3NVdEZza0tCbzBZdkI5TldqbUg4bWtBdlNoVVRsZnhkR2tSVGRRS0p5UXBO?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c71740-084d-4303-0f44-08de21eed02e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:24:31.3290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XOvi5e+TB3OD478T5a2CvBr2iMT2kY1sfMezuTjANahoOd0rdMBQ+49s4jmr0KxYocUIEMX5shy/Ghm0tkM5u3WfJXtloDCFGIYed2pxuMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8849
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

When INTEL_BMG_G21_IDS were added as a subplatform, token concatenation
operator usage was omitted, making INTEL_BMG_IDS not usable with
single-argument macros.
Fix that by adding the missing operator.

Fixes: 78de8f876683 ("drm/xe: Handle Wa_22010954014 and Wa_14022085890 as device workarounds")
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 include/drm/intel/pciids.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index b258e79b437ac..52520e684ab19 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -861,7 +861,7 @@
 	MACRO__(0xE216, ## __VA_ARGS__)
 
 #define INTEL_BMG_IDS(MACRO__, ...) \
-	INTEL_BMG_G21_IDS(MACRO__, __VA_ARGS__), \
+	INTEL_BMG_G21_IDS(MACRO__, ## __VA_ARGS__), \
 	MACRO__(0xE220, ## __VA_ARGS__), \
 	MACRO__(0xE221, ## __VA_ARGS__), \
 	MACRO__(0xE222, ## __VA_ARGS__), \
-- 
2.51.2

