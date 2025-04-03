Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2703A7A382
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 15:16:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE4210E9B6;
	Thu,  3 Apr 2025 13:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I5Uq7AcY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4618510E9B6;
 Thu,  3 Apr 2025 13:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743686205; x=1775222205;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zSSksKdy22N9Dc5SA/o3CCIN4YYNOhmmbL9m5lxlh6I=;
 b=I5Uq7AcY2/6y82CuiZWLnCd/9CeeGKaEYsjUP4+GRT0Iv9GCYGzhGXcN
 SBU+7YbQtT3xQyxgRr/zxcRVUa06q0rC99y06to0qmByqDKG1en2TyOBU
 UvgJz7Z7WJWlPxQhlJH36HlrszarQ2kbq4N0DJWrkFYSyLsG78hO75NhN
 GQZeARihVXlWLMAEo10sD/LhdwtMDhFL3sfN18z/neVFnnyhWwvo6+Lvw
 Y/Pv1qQSvkXUTeKvzASaHOCf1KZLjx/jGEiFfAtEozezUsYludTO54R55
 Tkch0bLa2RRKZO5U+pDqnhiPWyJvtaykWw3uqFjQ4GJsmX/AEP9uxSS/t A==;
X-CSE-ConnectionGUID: e5QLRS+qSRO+VvyvE59kwg==
X-CSE-MsgGUID: G1YA9va2SUyl6r72kwA1Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="44807613"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="44807613"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 06:16:44 -0700
X-CSE-ConnectionGUID: 4nDoSLMSQWCGNEzwGn3YJw==
X-CSE-MsgGUID: GfqP39LgQcq8pGpX5V5pIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="157987953"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 06:16:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 3 Apr 2025 06:16:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 06:16:43 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 06:16:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DbAFaj2/uiMdQZ917vaML9+BuAAOlEvFaqdSn0JPsZfQG4RY/YqW6DvUlAj/ScNPpVaRd+LyiZm5fBbhBAetmuclGFjGEb9paOjH4CF9nbYD0CZdM+uKCsmfX2Ty7TX0eEr+/jXyEagzHEGb5T9TXVTWxQ8mVVJcB/J8kIgjdlu588MN+GMSgXjZ9LO3Gy9ofhtfvuu+HboBBSi+8rN2Uzvmi5xlJAjVWHL5DNVW8izrS1Wz62DVrFAOsMsjr5qOUAJIvnOvM9CudhEQj4HxQ/ZZwoCoN/fkAx6kE7zO0Yn8WiydQ+5eMsE6Con/6oPVG8TuN2R/5Z9JfDVGziqIrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3eX8ZO/jsKJ7o+jeUZWORGG5mCOr356C1CAcYewDOC0=;
 b=ECP/zDt289W+LDb1102FaYzkrGA7S8k0QpEx1qZMGaOXF27At7B/5Vnp0pF/gNhitkQdNTM4aIHBAHHLc0zdnJWanjxa5mjbdQpLPA5eo2xySi2jnyATJ+rRFUxTPoDHMNRq25lo/uuUtGBTTxZD+D4J1w8ROqloPbijcL0IHGmyUt+oSfJJaWEtVcO1ONIatVVYRb8qxYFPSptKeS9N3SNh6cQjzBzwmnrvA6ZGfvVjlJsLD6n43+VvyJ0sb6v32/tKdjPNmDKTZx3u7QWs3HKl6AJS1WcrXlhXs4icD2CpsiP+60YvrIp0Ol81qgXb3ezJLu6RIxHQA1gft7TuGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by CY5PR11MB6414.namprd11.prod.outlook.com (2603:10b6:930:36::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Thu, 3 Apr
 2025 13:16:20 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%3]) with mapi id 15.20.8583.041; Thu, 3 Apr 2025
 13:16:20 +0000
Date: Thu, 3 Apr 2025 13:16:12 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/huc: Fix fence not released on early probe errors
Message-ID: <httkcexaqibod6c2jk2ymkjldvdp6rvabvcn5col5m7zmrzevv@g6b6d4vax3dq>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250402172057.209924-2-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250402172057.209924-2-janusz.krzysztofik@linux.intel.com>
X-ClientProxiedBy: DB7PR02CA0008.eurprd02.prod.outlook.com
 (2603:10a6:10:52::21) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|CY5PR11MB6414:EE_
X-MS-Office365-Filtering-Correlation-Id: 565df8ee-5123-499d-edbc-08dd72b1b99c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZkJCWFpJS1drdnV3NXhtUFl2UUUzek8wZUxZaGRCYTd3TVdnak5ZRG1VdDBr?=
 =?utf-8?B?V0RNUDVpRk4yZW9Id0YrR3FQYThpRDdOT3laVUllbWJQc2lqOWRLRzNlZUts?=
 =?utf-8?B?dXlka0szaWcycUdhNjhFT1RuL1M4OEVEZ0JtUkVpMUJ0c1F3cmJncFBuakNF?=
 =?utf-8?B?MnBIdnFwaFViTStrQXRtd2NQZk5wY1JIbkEwSXlMdzd5L014ekFrR3REYmNF?=
 =?utf-8?B?WHYva3NnSDBjY05hZkVEWVpzWGMzQ2RLK2RnQmZrRkRRZnRFV1dCY2h4QnZ2?=
 =?utf-8?B?S0pQdFpCTURZOTJNMEFyYW5PU3NzclppTDA4allUKzVIUzFjY0lSY05EbHZt?=
 =?utf-8?B?Um5qT3Z1WmxzS3ZqT3E0NlF0M05Kd2dBeU1zNDVReVNFMDluYm9CTno0ejhP?=
 =?utf-8?B?M0xlVDYrSDc4NTRsZHpETXcwN2QzMnNjRXUwMnRHSUxpbGVoY2pVQ0gwZ1p0?=
 =?utf-8?B?OC94eFlFY2tsbFNxbXNmK2hOTDFSVWIvT1dUeDlWbmNOMFVnUGQyUENITXlE?=
 =?utf-8?B?bVJEZHEvYU1sVFdBT3pzNmpVeDNJUnFhbHpJQjZIQTFGdjRnRVdMSHVxNUJh?=
 =?utf-8?B?UkRxWjlQS1VPWE44N2MxcnVTR1FwRGV0QzZLM0ZSbjJsSldtT09JWHJCYzJp?=
 =?utf-8?B?M0hMSC80TTZ6ZWQ0M2QzRmJoY1VuUTNCNFNGd0I2Q1JnVitaNTQwN2dDQ21u?=
 =?utf-8?B?czNVNU53Y25sdUV4TDFab1M5dVlHdDA4SmpYWFlmTzZuMXNud1p0RTlFMWJY?=
 =?utf-8?B?UjJvbEdEOE53bllHc0NqUXI2SWwrVjNyV2cybVlJN0t5NVlsV3BEMDNyRlly?=
 =?utf-8?B?RXNIZWNBT0xHRDRZQXBXWkI3N2duN1MvVEJjYXRPMXQzNUVhcDlTL2YvWS9Y?=
 =?utf-8?B?WHlNTGtMT3hkNk9nTUFLeWNQSHNka2xHY29pK0tQTG1QNEtqbXhKY20wOCtW?=
 =?utf-8?B?N01EOFBzRjhobFJ1SW52bkhObnVvdGp0cFl2NjF6bExqd1VGRlg1OWIzN1px?=
 =?utf-8?B?VmczekdkSzM2Zkk0bTc1VTU3MmFXOWU2UlcyVnZadHAxWXk5anJqU1JDMnpy?=
 =?utf-8?B?MlBVb2hFZ0lUU1Uvdm9MRFBPSmdOcldMdGRISzdIQ0VmYWY5a0hzeG81TkZk?=
 =?utf-8?B?TWxtY1hKNkFCZzB4cWtsS0paWGFPNk04T0wyQkpZbXlSQ3FiQWZ3dS9lajJ4?=
 =?utf-8?B?MVZWc09KT3hMbFFtNVpLN0tubklBTUovRzVxczZIMFpkQVlteWV5NVNwL2Rm?=
 =?utf-8?B?cksyOHNnSVMwem1hK1d0TXdUZkk5UmtmZzZoakI2Z0NQYTNCa0R0Q3I5azVH?=
 =?utf-8?B?eHhCK3pCSU45bTVLUzN5RXFhZkFnVG9sRS8xWXhIODJlUmtxQVBUNGlETUps?=
 =?utf-8?B?emZCaXUvaFAwNzhFVHo5YjRxM1NQSFNnblVXeG9YVEF3WDkxNXJlSlZzMWRa?=
 =?utf-8?B?bERGSDNZOU1LR1loL3prbnp1Y2lTV0x6TWlNZnFVOVhxVUNZUWYxYXRsZ25v?=
 =?utf-8?B?RWZ1Z29VNERXZVlnRFBMK1diNmRPTVJWNTJDZUg0UkNLSXR5MERleGJHUk5h?=
 =?utf-8?B?TzVBNFZNd3JwaEN3WjRRSExkT1dtanZlSm5CelBnWWxUOTJzMEQ1Nm9pRk93?=
 =?utf-8?B?b1F3MXpVcmpueStkdVh4a1Q3MmpndmNXU3pCbFl0M1Qyd21BOHQvckhObzBR?=
 =?utf-8?B?SHI5OGFyOFcyUXpzY0xHWDN2Q3kvbzVKMVdZaWtzbnFVOWYvQWhqb09VVkda?=
 =?utf-8?B?N1VaSVBWdUo2amw0QVJsYTdKNkR4aFFtUk5DOElKd3RDa1p1WHBNYzVodmU1?=
 =?utf-8?B?NFNQN0svcE9Nbk5DMWd0UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGZEdk5oZ0dTUGppbkNpVGRXSW5KaEVtQXdQeTFDZDJMWHlxV09uMTVrTm1Z?=
 =?utf-8?B?c2RVMEtSb01HU1owWHc1a21CQTdmSWI1THBjWkxiRlpIVU5wVUpQTGpCZ3JN?=
 =?utf-8?B?OU4vVHYwWU9mNWE3UEtzcjEwVUJsSlJYem1Fc1pFeVd3TWhseDdlOURXU1Nu?=
 =?utf-8?B?Q01SdFluNzZ4VVhjSlNMRnJGOUxJa1U1Zis0bkhhS2ZuZERLUGRzWEZEU01C?=
 =?utf-8?B?WnduQVI1dkNObCtLbmRUR1pnMEZwQS95VlMzWGpIcUVRaTVXOXNMT3FtUWw2?=
 =?utf-8?B?UldmR3d2WjRxcnA3RVVONng3SEMybTJkYnFQZFF1bXZhcGJKWU0xc0xMT2hq?=
 =?utf-8?B?RGFLVTdNMFdiKy93dVF4V2piWEgySEpieGp2TlIwSUpoZG5hSmlUeVdlTG5a?=
 =?utf-8?B?Q211N2ZUcmIxZVpvWVl3UkR2WTVrVFFMWkFBb3B0cTNlUkRoN05LaG4ya3py?=
 =?utf-8?B?M3BaR0w3b2FNdTZ6RDF0R2hsRUZOeGdrVnNSQkRUZUhjYms0NkQ5eDhKSmcw?=
 =?utf-8?B?YU1UVHdkY3h5eEY0cGRNdUVyZ2dXUDVTSlFiTkpZZGUwTGR6OXdHTnFKVzdP?=
 =?utf-8?B?bnBTTDRTTDJvR3BkSlhJUzd0QWVXaytaSlRSVnhHYWVyam10ekI5TDlTbG5N?=
 =?utf-8?B?SjQrMGpBZUp4RU1YQnZVSFJLQWpCd3F1ZCs3NUg3NDJiMno2VXlMd2hYbjVF?=
 =?utf-8?B?TVk2SGJlTVFhM0ovclN4WGIvMjhCdGtlYS9rM2tmRGxtcHdraVBJOCtPRmV1?=
 =?utf-8?B?TFh2S2JXNmMzUWxwMVlwa250N2xRUnZJUVRtSEtuZHZwOXVsSTZRSnZyTFha?=
 =?utf-8?B?ZWh3ZTBER3NXaTYra3hKVDRjY3dZdHM4VGxWT1ZoM0IzQkRVNEczUEVxMm8v?=
 =?utf-8?B?bnRvckNuS09yM3F6bUVsRXoxYTFDNjV5RVJmZERlWlVvNWt0NU9oaTMwVWgx?=
 =?utf-8?B?WHFjd1A1WG5NcG5oTEUrUUNMM1pML1pGR2w2T3l5RTFFL2RUVUtRUVAwV3lw?=
 =?utf-8?B?VGl1cWVFMGNTdyswc1VtZm5BZDRiZ3RmNjBRNFIxRFlUVmp5UDVsQjFQMlVD?=
 =?utf-8?B?Tnc1UVAycTZTWDlWUlpVaFVwWW1WVjNOTTFISnpLRkpnaGpFRE5IL3JTRlFS?=
 =?utf-8?B?b3hyTlBsVlh2cEhQTFQ4L1FQTitPakdaM1ZPaDRuS2xjMXltMitRTHFBNXFq?=
 =?utf-8?B?UHMyT20rZ1BWS0FsUm92MmRXR0lIVGcraU9vNTZCVkgyYWt3YVU0czJpV3ov?=
 =?utf-8?B?TUdQVm96TVNEb05Ydk54SmhPdUhsMEd2WDhNWXFzMzBiYzcxZ2F4ZUVGbFNN?=
 =?utf-8?B?NUxlekkySHJ2N2psWFZNZ2pXNjUycU1IRE1BeTJVam1KMmVzRFRMTndVbUdP?=
 =?utf-8?B?YW5QSEwwNWJsdXdibjR2WUdWVE5oS0pPKzFxYXBnV3lRdjl5NW81cHFrajZT?=
 =?utf-8?B?VmlIRmNXMElYZXR4RnVQM3pnaXNWRHpSV0dOdDlkT3pGMU9MbFFRMk52SXBS?=
 =?utf-8?B?cndERk5aaENxZ0FTSE1ueW5rS3ZaWXNnZ25hRkljQzZCTHB4Z052WVNkWkZ2?=
 =?utf-8?B?UGxYZk1sV3NkcGVMaXlWZk41NnhENnRpWkxyT0FPbU96VGF4djk1bC85T2JX?=
 =?utf-8?B?azdycDlFL0Z6TC83SGtMcE9tTmxjallkdFZ2NnUyMG1BSkpqdDFXL2Uwd2Yx?=
 =?utf-8?B?RmthbXc2QVN2bWFQZUxWRFUvUjhSS2pLbFRncmpVakNBdDkxZmdNd1M3cTdi?=
 =?utf-8?B?QmVoTlZ3MVZCUWNBYjVXNGJtNSttajFmRDRyWFVIUWlkYmFqa29VRFcyUXd5?=
 =?utf-8?B?NkJsalcyTXVnT1NDdk1qQ1hvQXd1d1lDV21CV1lVZVJ5ZTZIN2F6K3VlbHpl?=
 =?utf-8?B?MmJVZGxPYnVlMlU3alZKVW5zb0g4cUFwYjFnWEhNSUg2d0FVaFJLdW85RWtB?=
 =?utf-8?B?Smo5VE1KbjJVMkhqRFZHS3lFTFpDbm1GMjZtU3Mwa0lFZXdBdmNneUJIRUIx?=
 =?utf-8?B?KzFDNWZLOE1Gdnd6N3V2M1VxTGNRd0RSUmpMVGRHS3d4MHZVd1Z1TGNXd1dy?=
 =?utf-8?B?N3Zuc3pJTk1YSE1qeUVLUkNTcHd4Tjl3S3JxVFVIbDVSTFhYV2l4NFRaY1hq?=
 =?utf-8?B?emtLZHdHYVhJZUYvazBkdnFOcWJNR05vWXlDQTBIbk8waG5IOGRXczRrcDhu?=
 =?utf-8?B?SVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 565df8ee-5123-499d-edbc-08dd72b1b99c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 13:16:20.7696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2pPQ0zFyOFgOUki3D4qqMXWRLtq1/qGRlRBKGvNOqm54gS4RqW3IjDLVBX1Zgp+X3B0NCGa+fdUOJ40tsNORXkPU1PfWuidXdg4dqZL8t2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6414
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

Hi Janusz,

> HuC delayed loading fence, introduced with commit 27536e03271da
> ("drm/i915/huc: track delayed HuC load with a fence"), is registered with
> object tracker early on driver probe but unregistered only from driver
> remove, which is not called on early probe errors.  Since its memory is
> allocated under devres, then released anyway, it may happen to be
> allocated again to the fence and reused on future driver probes, resulting
> in kernel warnings that taint the kernel:

[...]

> That scenario is most easily reproducible with
> igt@i915_module_load@reload-with-fault-injection.
> 
> Fix the issue by moving the cleanup step to driver release path.
> 
> Fixes: 27536e03271da ("drm/i915/huc: track delayed HuC load with a fence")
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13592
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

I have tested this on a kernel build with kconfig from one of
the failing runs. Before your patch the reproduction came quite
soon after a few dozen of runs, but I have been testing this now
for a prolonged time and did not see the same failure again.

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Best Regards,
Krzysztof
