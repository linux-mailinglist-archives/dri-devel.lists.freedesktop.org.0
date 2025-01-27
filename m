Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70ACEA1DB0D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 18:13:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977F710E213;
	Mon, 27 Jan 2025 17:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hy1ScNgq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7AF110E213;
 Mon, 27 Jan 2025 17:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737998019; x=1769534019;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yWsUs3vth396eBJEeYvDUdIVYVB8rpjBdmGmI+ONhfg=;
 b=hy1ScNgqxabIvkOpi1XCcJKGfRq7MTBjNcodei0WHk/3RtbkTW9YKRun
 ZTyS5Gqme/9gPidyLXBUSIQPxJUOVB7K0V16MNomOdqnuuGa0F/8DUkoQ
 +Y0IVL+Ak8iLnioPWdeKnvuS9QRWqDvfBUxav2xPUiunjhqptB8tEjUrO
 BGdk7fAWrYga6DRpd75CjdvM18a3tWbMJlN6k5q0WacN3me59tNvLJ2nl
 m/6KmpNjkMronirIAkJ46DQzxqZntDHxqPdl1JWtaIlw/hDTBsHz7Xwxm
 oszeu1nI4uZ8kjCYUg9oPEEist7F+c4O5oF+oZZfeDJsGV9wOEtLkBwZI w==;
X-CSE-ConnectionGUID: YvtIk/fITsmg+M1l5fpoWA==
X-CSE-MsgGUID: L1c7SMy0QWeXud5D5vBHBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="49455691"
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; d="scan'208";a="49455691"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 09:13:38 -0800
X-CSE-ConnectionGUID: D3lUZTV5RCWd1J9PJqXOjA==
X-CSE-MsgGUID: miT+Zv4XRlKaiFcrZM0FaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="131785576"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 09:13:37 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 09:13:37 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 09:13:37 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 09:13:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F2hETEIMONe0uMka4Uvx5bw39aSC4WcupZnr+s0W2vtiwLdDx+5NcPo5vW6SWQ1wIAD95diodS1R44IG6aBCnmyEUeen0V8iWSvNZBazi/tJEPAKAfoR+6Nxkz5pQkZhaJd62M0R+6KZChVqgst63zROwrXvjBE1zHA9/a1Oo6riUmO4o1Pdeat8Gpz5z9PFDu7T6UNtGhLiCyzzfxW/luJtPY1pDOl4loFoASr5ZS/ykfoHZmKvlWrNH0xP+wfsDmj423ioY2AmrzxuBdqUZYFeOyRIduj6O1ZAtA8hf/+F4VpH7Gu986vzZEPhSrz9MrwS/48LaSYi9WEpqSMNQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=stkjudrzMwtUQkzDeubdcpSH6VG+Jx4BRufiRCCEbeo=;
 b=cT7PkKT3ySlN08zt7b0EVsZX1Zx6mm0xB8n4jE0k0+UIZpAJ42ttKOGoV0dfReyKvp0URcBdIjSTZCSSysg1SV0doZvoD0xIF6GMY0woCQwJJOY1dxXnmujJFndaj5JEqSXyVgcIEG99tzK5r8eV3LdU7WmnhQFiL7nrdtE0SaFVNwd012H4NE5W0Y0rwRVwayHOt1yXo7hXfUIAEPwmRkXDzj/ZQN3YJmKBM5eW/5ROvL4hne0zC09eo8t2N67/oK8sP9GtTF3fR1yiEFYponus7+qHUp44SRcnBZU6tYW3N4kD/hvQbb2DthSH+6xgbjDAn/ZP2vt0NczllROmkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DM6PR11MB4596.namprd11.prod.outlook.com (2603:10b6:5:2a6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Mon, 27 Jan
 2025 17:12:52 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 17:12:52 +0000
Message-ID: <48cdb50f-c558-4503-bffc-42329eb377de@intel.com>
Date: Mon, 27 Jan 2025 09:12:51 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/i915/guc: Always disable interrupt ahead of
 synchronize_irq
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-gfx@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: Alan Previn <alan.previn.teres.alexis@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 "Andi Shyti" <andi.shyti@intel.com>
References: <20250123162351.1364395-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250123162351.1364395-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0119.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::34) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DM6PR11MB4596:EE_
X-MS-Office365-Filtering-Correlation-Id: 99cbbb0e-729d-4e82-8ae0-08dd3ef5d529
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjRjUkZvYWcyZVlQTitlR0dQYjF3RExwU0dhZ2hYdVZBWFBhbjZDMXVpTzdt?=
 =?utf-8?B?ZFBsQjM0Zm42MWxxTVNqMWV3Y1M3STVyQWpnQUROWWtaUnI0SmtwYmZBd1Rx?=
 =?utf-8?B?ejh4Z3lNaDV6bURKcmlwK3dpRGlTVzY1S3krUXZsK2dBWFl1R3p5Nkt3TzdT?=
 =?utf-8?B?b0FOaUUzdlRSb1A3cDNwR0VYV1F2NTdGazhMNUZ2WitZbmExRElCNkM2YkQ2?=
 =?utf-8?B?Z0hjN1VzTmhRY1hnUGdLUWR4NUlYaDVnRVlieTJCeEppcnkrUjZZVDgyL2cr?=
 =?utf-8?B?VkZSOGwxWjc2WndEbENaOGp4UERLSmFuelYyMi9waXZVT3k4dC9UTDdFVmJH?=
 =?utf-8?B?Z2hNbStvcWFxMXBJbldlTWE4Wm5KMVFMUE5UT2NaeUxUeDQ1TnVJclZIbUg4?=
 =?utf-8?B?OVA0bEQwMGYxcjViL3dmbmdSUGlBVkxhdjRwcGpqZGh4cWRlaWFnWmZKWmN3?=
 =?utf-8?B?SHZOME1KMU4rSnF0bjlMOWRibnp3SU81S0EzVDZyWTE5bDZDMzFENVl4czBN?=
 =?utf-8?B?ck42UHFvMTQrNk9IZ1lYeWlSVS9Cb3VuSGIwNE9vYkRTMVdJLzU5dEszRFkx?=
 =?utf-8?B?VFlrQmdoQ1NKN1krZW1kVVRrTVlWNk5ZTDZSK2g4R3AyMG9mV05wNmtSU0k2?=
 =?utf-8?B?UTlRWEFwekh5R1BUYXNRWmZYRDJySElOUTkxSTUzOUFsaEVwVzFTVXg1eGI4?=
 =?utf-8?B?UXNhbjduNVRZTkZVRUVvMmZReG9mQWJlaFhHT0p4cFhrd1E5T0lIMzhLbTc4?=
 =?utf-8?B?THFxNDNOTVp5UmFkaktxaGY2NTM2UjZkRjRKcXRleWY0MDRsdDdkaElucFFl?=
 =?utf-8?B?d25kVkoyeEJsdUwxdjBTOFpHU1Y2UnRzUUNIVXp4YVM3aEZzSmJTNUF4VWNH?=
 =?utf-8?B?ai90OWthejhXaWNyTmFFejhxQXAvUWRTdzRqa01EWi84eWRKQjg2OXp6cjEv?=
 =?utf-8?B?NnZzc2hraUw2ME8zaVF2VjhRWTNZQTIxcXhjK2NLREQvbnRnZlNqTUpBS0ZC?=
 =?utf-8?B?cWFBSG81VFFMU2xEb1lNcUVVaWpZRk5tcGVhcVRPdzkvMFRPK1UzZm5OQ1p1?=
 =?utf-8?B?RFRoU3N4OWdSSzkrbHdYUlcrQkZmbzZ2YmVzdExvaEEyalVVUURQSjkrbUVR?=
 =?utf-8?B?cVFsekxCVmdBM3Z4ZzFYZ2x6SlZUazFOeW03YStWWTVvd1lNTFE5MGRCYjEy?=
 =?utf-8?B?WWx0OHhMaE9BWWxNSytBRi9kL3RyY3FGdlpFQjNjRnhNS2hhZHA0T2hTcGxQ?=
 =?utf-8?B?L3NEbEU4N3VidXNoblFHMW5kR0dFL0hZcENsdm9CNllGRzZMRkVVaThlbjQy?=
 =?utf-8?B?Z3pWcExsVkVVc1NWTXpUeFI1UkRXcUhGc09hSDNQMU5hTVoxd0cvN3JmOFdX?=
 =?utf-8?B?OXZDdXVQM1ZlMC9VNGh4S3J2ZEN6M1VOVEpBN2VrSVJMWVFxTGhXaVM3NHhk?=
 =?utf-8?B?OFI3eExmaFQvVVc4dG0yS1hnL0R5OGNkVXI1eStvRnJkdm4zMFJTYjJlMFU5?=
 =?utf-8?B?N3IxeHRUdmQvQTFkbVhuVmRQT2RJbitRN050U0QzK3grTituWUQ4bHZ2b0tJ?=
 =?utf-8?B?V2FpRjNKVy9lUjZzOTZ5RHVxR0cwZlhyaWpnRHpOQkNBYVEvSlp4VG1WZlpG?=
 =?utf-8?B?ZytqS1U5N2E5czlDVkY3NVNWT3JCV2ZsMHUvdlYyL2VxSkxyVGJjZWwySkQv?=
 =?utf-8?B?b0ltbW5sWFVpWEdWZnZ2aU8xZG9PVmlYYW05alg4UGhWMnhrVkFtZFc2TUVw?=
 =?utf-8?B?cFFqV1lzb0dBcTl0cDQ4cFZzVCt6YUFoSU5hVFpNazJhQWhqRmt1RmdBam9G?=
 =?utf-8?B?ZytndSt6dUZsQk1OZUJPUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEN3bG5tN05UeVIyeUV3d0U4UXhleFNOM25OUURPdzkvVFZWd2oyU3ZxOFhU?=
 =?utf-8?B?TVp6ZFJyUFh3cVZtd09EYVZNeGVQZkpyalpJZkZ4MFVLYzk1SnpwQ0M4M2lN?=
 =?utf-8?B?KzFIMlhCVk5IbkltUUNPM0FQU0Q5dkp6d0hxdmFlaUlBdEVCQ0ptU1FSUUlM?=
 =?utf-8?B?aG85MGxBL0l3TU8yaEpLSWtwcHYyaFBoSE4rTEtqSTNuTGRQZ0FZa2NFS3Ft?=
 =?utf-8?B?bkZxTnRHZDQrSzRjYW8wdSs4bWRzWGZjU20vMWdKazNXQmVYQktJdmN2bkE4?=
 =?utf-8?B?WFh2MkZzV3UzT0ovOUNaUVkxZzlMcm1McGtOMENSTmlRN0htbDVtNDdyaGxO?=
 =?utf-8?B?TUNMaCtGYXo0TEY4Q0pZZnFsbkRpdnZUQkhQbjZ4SVNTTXdaTE5yVHBFU1dn?=
 =?utf-8?B?a09UdnlRbVpwek1Vc3VUMFFBeE5EN3ZtZU4vQ1pNZ2FYVS85UmR2ajdDcHgx?=
 =?utf-8?B?TkJiQ3BBeVZBbXFteTVaazdQVitVc3BhS3dqWFRSOEVUbERITnZ0eEk3aVNW?=
 =?utf-8?B?QnZHcDdkYktUU0E4cXc4dExHSW9oa2hZZXJIdWFyTzRrUE01Zmw1ZkREbnVY?=
 =?utf-8?B?QW1YRTdIMmpxQmlmMGxXdklKaWN5K1ZWdVpEcE9wcFRKUkY2bnBGWXJuc1NP?=
 =?utf-8?B?RHBJa2FQL0p4bm9rbXZqWGI3a3dSRFQ5NjRFcW0vQktDZHUrQkJISitsSWxl?=
 =?utf-8?B?eStyRHozZnp3eXNUQ1VvY0YzbWhOQmQxSnQ4ZmZlNlVmWFA3aWVXdUQyN2xq?=
 =?utf-8?B?RGlVZzVOcXN3TXVNeUZQOVNMMjJJR1dnMEF5THAzNkpSaEkxWmRSRTljVkd6?=
 =?utf-8?B?L2poR05oY1psVHF0SGY4WFZLN1hRRmNxakY5M29nTlRHejc0STJvUUNaLzI3?=
 =?utf-8?B?cEdjZlpPR1dld095SVBSQnVTNnNaNTUxME1NY2UrQmEvcTcvRWIwdkZPdGJB?=
 =?utf-8?B?Q2xSSkd0bHlITXVjTlEvS1A4T2hYZFRDYTRyQmg1NzZIYWNQT2VPWFpzWW8r?=
 =?utf-8?B?UTNZUmo4dXE2UzNPZU10YkphR1QwdGtaSmxXam5yV0NncXN1Y3NCOTg3bTNZ?=
 =?utf-8?B?WVAzeCtIL1lUbngyMitwelhRSlNDL2diUFlQMVVMc2lyTXBPZThXWGpYTy9m?=
 =?utf-8?B?UTY3RVROM0lFK29HN2pudGVVNkE1VVc1T3REZE1XT2hETjhod0g2Z1YyOUE1?=
 =?utf-8?B?dGtRUXlpQk1uV3l3Y3ZkQWd4bm9lV2FBT1FWaXF4TG5IZWlWSllka2x3RUFz?=
 =?utf-8?B?WnRUb1hxTHpaZlNnK21qc3FzWG94cTdreExJUEIva1BqcmJXSHlzMWVESWlz?=
 =?utf-8?B?eHhvMUxVSVN3elhPekVHc0wzNjVqaEMvaTgwenZuOFEwbGR2WktoZXE4NTVG?=
 =?utf-8?B?ZmpBUHpyZXYzRExrS1RlNStDTWc3RzFZYUdOdTJIWk1hSjR6MXF6aE5qTE1P?=
 =?utf-8?B?OEhCejVPbGwrcFVEbWh4UENuYlBHTXdDTHpTRHd2SEpJelNSQW85emw0azQx?=
 =?utf-8?B?SmZBbDIzRy9RbFdCenNRMFFKUEJUcC84N3lmOXlNa0Q2YTV4RDVqbnpNcHBm?=
 =?utf-8?B?dzd2MnlnZWNCcDhnU1JGNDdQWUxKd0hoNkhXbk9CSEplM3MzbENtU09LUGtT?=
 =?utf-8?B?UkJCNmsyanlENVlkRkFoZ0MvdVAvUlhTbHBsRkJSSzViM3IrT2p0MUo1UkhM?=
 =?utf-8?B?TDlrOGdtTmxURy95MUpMRlhpbjlZSDQvRExlcW03ZHlJdFRFOU1aVGVGRkFs?=
 =?utf-8?B?NDJXMzc0d21tVk1UdkRtVkMxbzhtWFpGbVZDT2ptcmYwNnFTM2x5TVBxVVJK?=
 =?utf-8?B?V3c4ZDdVMW9CdGQxM3ZsQ2JIK1J5dWI0bWc3OVJYYmw1cVFOUklaV3BiU2lk?=
 =?utf-8?B?UlZtWGdPRlFyaVJBc3NTcHp0TUt1S2NFbXdrZS9IN0tIejc2L21vem1zMDJG?=
 =?utf-8?B?Q2pMSDdCbXJNODRVY0lKbFBtc2I2Y0ZZNllhRHlrTkh2ZTJKamhQbE1XOEJn?=
 =?utf-8?B?a0d6Nk1hS28vRVlmNnRRUENKVmE3RnhIUnBqZHVkOVQxbHpxcjlnVUtBWG1a?=
 =?utf-8?B?RzZaQWFIdTEyS3RzaHA1NkxleUVnSFlicjNmczNDSFdmMUZ2eS9kRGpkMEoz?=
 =?utf-8?B?aGNicVhBL09zTjNXdTc0Z1Y1R3AvZXFPeUZJVzc4ckZaS3EwWmNScFNWK2Js?=
 =?utf-8?Q?VwEwgkCS5ncmkPD1Z8evhj4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99cbbb0e-729d-4e82-8ae0-08dd3ef5d529
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 17:12:52.2432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: reB6NZdf56/AnZWwWBzNjtkuypLf0ZbLOs8zXkfgwnwYqz33aPHyNNn/hEQ7mDcAo/U6EhEyuaVVDd9IX/FEUKTZ3u1BswZnrm7925Xx/fo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4596
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




On 1/23/2025 8:23 AM, Zhanjun Dong wrote:
> The purpose of synchronize_irq is to wait for any pending IRQ handlers for the
> interrupt to complete, if synchronize_irq called before interrupt disabled, an
> tiny timing window created, where no more pending IRQ, but interrupt not
> disabled yet. Meanwhile, if the interrupt event happened in this timing window,
> an unexpected IRQ handling will be triggered.
>
> Fixed by always disable interrupt ahead of synchronize_irq.
>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13454
> Fixes: 26705e20752a ("drm/i915: Support for GuC interrupts")
> Fixes: 54c52a841250 ("drm/i915/guc: Correctly handle GuC interrupts on Gen11")
> Fixes: 2ae096872a2c ("drm/i915/pxp: Implement PXP irq handler")
> Fixes: 3e7abf814193 ("drm/i915: Extract GT render power state management")
>
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>
> ---
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Andi Shyti <andi.shyti@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_rps.c      | 3 +--
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c   | 4 ++--
>   drivers/gpu/drm/i915/pxp/intel_pxp_irq.c | 2 +-
>   3 files changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index fa304ea088e4..0fe7a8d7f460 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -244,8 +244,8 @@ static void rps_disable_interrupts(struct intel_rps *rps)
>   	gen6_gt_pm_disable_irq(gt, GEN6_PM_RPS_EVENTS);
>   	spin_unlock_irq(gt->irq_lock);
>   
> +	rps_reset_interrupts(rps);
>   	intel_synchronize_irq(gt->i915);

I don't think this is an issue, because we set the irq mask in 
gen6_gt_pm_disable_irq, so there is no chance of getting any new 
interrupts after that. Not saying that we shouldn't do the re-order, but 
we don't need a fixes tag for this.

> -
>   	/*
>   	 * Now that we will not be generating any more work, flush any
>   	 * outstanding tasks. As we are called on the RPS idle path,
> @@ -254,7 +254,6 @@ static void rps_disable_interrupts(struct intel_rps *rps)
>   	 */
>   	cancel_work_sync(&rps->work);
>   
> -	rps_reset_interrupts(rps);
>   	GT_TRACE(gt, "interrupts:off\n");
>   }
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index 5949ff0b0161..3e7b2c6cdca4 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -116,9 +116,9 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
>   	gen6_gt_pm_disable_irq(gt, gt->pm_guc_events);
>   
>   	spin_unlock_irq(gt->irq_lock);
> -	intel_synchronize_irq(gt->i915);
>   
>   	gen9_reset_guc_interrupts(guc);
> +	intel_synchronize_irq(gt->i915);

Same as above with gen6_gt_pm_disable_irq

>   }
>   
>   static bool __gen11_reset_guc_interrupts(struct intel_gt *gt)
> @@ -154,9 +154,9 @@ static void gen11_disable_guc_interrupts(struct intel_guc *guc)
>   	struct intel_gt *gt = guc_to_gt(guc);
>   
>   	guc->interrupts.enabled = false;
> -	intel_synchronize_irq(gt->i915);
>   
>   	gen11_reset_guc_interrupts(guc);
> +	intel_synchronize_irq(gt->i915);

No early disabling here, but I don't think this change helps either. 
AFAICS gen11_reset_guc_interrupts() only calls gen11_gt_reset_one_iir(), 
which just clears the IIR bits for the GuC. There are no changes in 
interrupt enable/mask status, so interrupts can still be generated. The 
way interrupts are stopped for gen11+ is by setting 
guc->interrupts.enabled, because that's checked from both 
guc_irq_handler() and intel_guc_to_host_event_handler(), so any new 
interrupts generated after we set that should be immediately dropped.

>   }
>   
>   static void guc_dead_worker_func(struct work_struct *w)
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
> index d81750b9bdda..b82a667e7ac0 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
> @@ -101,9 +101,9 @@ void intel_pxp_irq_disable(struct intel_pxp *pxp)
>   	__pxp_set_interrupts(gt, 0);
>   
>   	spin_unlock_irq(gt->irq_lock);
> -	intel_synchronize_irq(gt->i915);
>   
>   	pxp_irq_reset(gt);
> +	intel_synchronize_irq(gt->i915);

Again not a bug here, __pxp_set_interrupts is doing the interrupts 
disabling and that is already happening before intel_synchronize_irq().

Daniele

>   
>   	flush_work(&pxp->session_work);
>   }

