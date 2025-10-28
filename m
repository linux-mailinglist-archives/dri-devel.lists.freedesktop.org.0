Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20571C14AE3
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 13:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E36310E0AB;
	Tue, 28 Oct 2025 12:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mT2hLbPw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4046010E0AB;
 Tue, 28 Oct 2025 12:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761655568; x=1793191568;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=PWIXbfyRpAO/yUSo8DEj4Pi3vghSIRbvR50LDf7kawQ=;
 b=mT2hLbPwmN0WrcOP9dVpGVhRV2H1zAJNkbiqy7fWhNo32ygpUumZv3JC
 lq047UNg8nl8C4uLat69mn5DRCXAVdTfJlBPcgy14v5koWfmugewGr47B
 9S4TObGt6A1KF6jcI2JqOdn3T1ysgQjzq44FveKlfOldWcGK90IkCVvDl
 Bk6x1XHCDQCP2YodvUbutQ4OPfadHISH3Spo2ZYrrs2HZMbIjIUWSh2q8
 QO98uBO144wR43Dni0XG76O0ST+RcPzmkyKshoMVpR9mdOKOqdqFyTSB5
 MJRRof7WdMcU5w02J505s53ouNF1WrGb90EKYDbBxf/UPaLrEnhc9PX/d A==;
X-CSE-ConnectionGUID: GvYx0Us/QmSsgNhLiYpsZw==
X-CSE-MsgGUID: XblHE2HwRk6rZliRRXeE9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74353737"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="74353737"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:46:08 -0700
X-CSE-ConnectionGUID: TyxkFe/WQEGmRS890IRk1Q==
X-CSE-MsgGUID: HtyiUppzRDSHxR7gc0Jtqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="215994839"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:46:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 05:46:07 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 05:46:07 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.29) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 05:46:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uP96fQV663k/j7wnmZTtOlh3vNQ9ICQjqNP5T1bmJV6IToW65OLhw12SrfhWJf3J+2hadiizyUgWYPdOGj0XEFz10x2VHo8DUacs/k2xiJEObYKDsABHmFu5PVuzHJopCFCer+XZyiyMu8FNpYbkNp/oNwi5AIbKbicHJ6d/frztbK2vxZ88Tz1soXT2cYy+LfE21mHsVP0uZ4ciOtX1xiFXnna8qSMxj2M34ANXLqWXH9zVUtgg/56dQcD37bOIEmr0PJU8k3UlGTlkNFR9BNGxC97xmhTFuAGFWNXwNpcXwi/wP33fWFm+7K3hUH9acjrz/Izr4a3V+dInxtK4xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWIXbfyRpAO/yUSo8DEj4Pi3vghSIRbvR50LDf7kawQ=;
 b=nNyXfGTvSgeiS+mG40aBShOwKH9wWAwg5h8cq0nQQnLniRiOmtrIl0AOZvl9kGI2wcSM2KgnsowgKrXthN3x8k3s0AJvkzO9t0A9FSZTjrzNlKyEFx6qr3TSH4XDWwPbzRuFLMBrL3TmW7dIZ8RyF2UvQsT4AjMs2vUFOo+7oa0LOcpOScDOrMEgQbrkKDFb1pswHpLiLJER+yCfqFDCluLI8/sbQOWSuxp3frXFrwZMKXyPA+66BhlXl+/ZX5vogK9KodkCo8sbu7U+4uFQbb/Ck2d2eoxvIqzBAg29NbXrj0STAhm0zuS2+edbcJ8ES3QwwG8whEJZcCCe5IbcPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB6897.namprd11.prod.outlook.com (2603:10b6:806:2a5::11)
 by SJ0PR11MB4957.namprd11.prod.outlook.com (2603:10b6:a03:2df::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 12:46:00 +0000
Received: from SN7PR11MB6897.namprd11.prod.outlook.com
 ([fe80::71da:ef69:2b6e:97d]) by SN7PR11MB6897.namprd11.prod.outlook.com
 ([fe80::71da:ef69:2b6e:97d%4]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 12:46:00 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 28 Oct 2025 12:45:56 +0000
Message-ID: <DDTYRY4J7XJ5.8PR5I265OCFJ@intel.com>
CC: Andi Shyti <andi.shyti@kernel.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, "Christoph Lameter (Ampere)" <cl@gentwo.org>
Subject: Re: [PATCH] drm/i915/gt: Use standard API for seqcount read in TLB
 invalidation
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.18.2-107-g4f7f5d40b602
References: <20251023132802.654061-1-andi.shyti@linux.intel.com>
In-Reply-To: <20251023132802.654061-1-andi.shyti@linux.intel.com>
X-ClientProxiedBy: VI1PR06CA0128.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::21) To SN7PR11MB6897.namprd11.prod.outlook.com
 (2603:10b6:806:2a5::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6897:EE_|SJ0PR11MB4957:EE_
X-MS-Office365-Filtering-Correlation-Id: d0277f1b-596a-4efb-f892-08de161ff2ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjZQTXJDZFg4MXFDUXRjMXAzVDE2N3N1Y2dxVGMzQXdYK2ZiMWg4cXJncm5x?=
 =?utf-8?B?UGlSOHBoVmZxdGpMdEppNnhnZjErU3N4WGJiQWg1TVM2ekcwWC9RUVlDYWJR?=
 =?utf-8?B?R1Vid0thM2I1cWZwSnM0bjRCUmNGUStOaC8wRDRKMEd1c2dOcDllNlRQV3Y2?=
 =?utf-8?B?cHp6a25URXJDQ1RsTkVTVlNkUitaM0JacFRIdElxcHF5bWlFbGZnd2lqZTlq?=
 =?utf-8?B?dHJ0MEpoemU4RDBQcmlLczJhTm5SN0dqOUJ2OHBnOFNRZUtjNFpqejljVHRB?=
 =?utf-8?B?cWt2YnZIYVZ5ZjlubjRyRDZKM2F4UUtEZDdNcGpTSlE1dk5kL3hRR2t5MEpo?=
 =?utf-8?B?ckxibzB0bldwUU9hTzJiTlViTmF6V3U0c2pNaDdKN1l3UTVWRk55aGhjVk1X?=
 =?utf-8?B?S2FZaU5DRS9tWkFtK2ZrRERuTXloMVhpVGF5MEpzVkZnYndJUk1BTE1OT1ZV?=
 =?utf-8?B?VGtneHp5b3psOTc2ckcwNVlZUGltcHZVcTZsUUFTb1N2cDd2clBDNkR1c0wz?=
 =?utf-8?B?UWxxSHg3R0NRN0Z5RXYveWI0M21xVTBnQ3ZYQVIwM0lORWo0Z0hiWlhCWGVr?=
 =?utf-8?B?RHB4cHhhZ1pFQS92UXlLT05qNnRnWTJ3Sk1VSGZCZEhKY2hPbGlXazZabVlP?=
 =?utf-8?B?cmw0amxOcFk1aS94eTYxYUxhMjF0OStDYlcrSDlNSkxRcmdPbWFDN0FCeVIx?=
 =?utf-8?B?dEM0Z2wvaFppQ2RkL0RSSWQyZHp5UzBZbSt2enQ1SEhHQ0ZEeUNQLzduWU1O?=
 =?utf-8?B?RmplSGl5Y2d0M1pmcjk5WVVjVzNvdmNCUTI0ZUVoYU8wdnNGWUpBL3d6K05W?=
 =?utf-8?B?QkdPOSthMWEzdzJmWEFmZHFpTTlEZEpLV1NoTnA5bTBXaFdDTDNCSElHWE1L?=
 =?utf-8?B?TVlWVEYzQ3FkL2F1RExOWkxGV0VaZEMwQ1VWempTZjFiQWhBajZaSVl6Tytw?=
 =?utf-8?B?MCt6WWtXL0ZvTndFaWNWUDNsZ0orY25JdFFiUWJpYjQvbC9UNkVSRDBoQW56?=
 =?utf-8?B?MlBLQnlkZ3pJV1FGM1d6bXhQUGxNQ0lNRXp0YXExRlZWMXlHa01pS0UySGVz?=
 =?utf-8?B?NlVGREo1VWhzTEU5d2FHendQLy9ua0tiamFHRE1iaUw2VzJIZXZQNzB4MmRx?=
 =?utf-8?B?dHV6OW9oWW0rc25NQ29NOTJtcUc1UUF1dmlmMERqUy91aXhaVlcvaGJBajFX?=
 =?utf-8?B?aXdKVit5emFzeDFYYVZuTFUxMWpPOXozZWNSdENhd3FIL0haVFQ4bi9kZG5m?=
 =?utf-8?B?OXpVY3luSW1IVFBvNU1iS1NiM29jNFNDOVNnODIrd0VqdFlHVXRmU2tSQ0c1?=
 =?utf-8?B?M2NTb2hPWXdLNTRST0RjdXAyMndLLzBtbklydnB6MmQ5Q3lwc3g3Z2lmVm93?=
 =?utf-8?B?VXp3TnNwSERuT1JpZE5ZNk9LTlZESE1oaHp3dUNHRFJQSTVzVHBLeWQzb0dE?=
 =?utf-8?B?ZmdEemJONnA1bHNlVEl5U2hpdm9ZWXVTTFJJSWZUditOYU5IeC9HcGNUaWNs?=
 =?utf-8?B?dXFMRzN2T3hTR1NoM0ZyWmJjN2w3d3h4TGx5cFFGTVhiNDd6Z2pqTDVoUEZW?=
 =?utf-8?B?T255THpYNUNYVXZSREh4VEMzdldHazQzSHo4Yk5wYmFBY3JVeXpWQUt2Qlg3?=
 =?utf-8?B?aytxb1NPNk40Tyt3d1M1WTU0bExHRVBNWCtLT2NodDNLWTltaVd6K2k2YnBE?=
 =?utf-8?B?NjdaOE1mQWEvOWpIRnVyL2dVZWN3TFN0dXBKUVVDNGM5R2N5VHg4NFo4Q1FS?=
 =?utf-8?B?djE0Qyt6RnRscW0zQkFKVVAzTzM0ZWZMQzFsUUtoSWtoZDNTamxqb045THc1?=
 =?utf-8?B?cUFRVzdsbmNmOGNlNVM5K1ZqS2JRMUdsckFBYnlZWlFxMCtQaXl2V0ZtT05D?=
 =?utf-8?B?UHpyZ0pIMmtRaVpXa1NCOEFTSVpVc2phVVE0ZHV5M3Z5enFCOTV0TWFXblJB?=
 =?utf-8?Q?h4TrjloBRW8w9KUci4gq6E5nJDTQSLqT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NE0rVHF0dGxBYWVndHB4dTRzNGpzbVJHZTNid1BmRTVMdGUxazJxRkhZUFI1?=
 =?utf-8?B?K3NRaDFqclQvSGR1bTA1eC9jOEZSeFo4U3BvYTcxcmxvUXF0cE4zUUtrRXps?=
 =?utf-8?B?ZDdjbVZaR09DUW1uYlRISnFvbThyYVVEVWdyL3RhUFBsOFVxOHJwSGtwNnFp?=
 =?utf-8?B?UUs3R0V6RzBYcS93WEVpYkFRTGFDbmMzKzFLdkJSY3krUDlNdTFJbjlkTDQx?=
 =?utf-8?B?OUFOM2NjYS9zcENUbTg4RWF3a2J0VVg2bTJrMDdERFJsNmJhNWFBZUN1Y2hx?=
 =?utf-8?B?VUU0aE5TcGJxV3RQclJlRnFldzgwMHQ0NXFyaDRzRVZtazhxNFJGRG5XUzR1?=
 =?utf-8?B?QWEyVGlZd0VJeFhLc2lFUGhBYWtZVTYxcEJqWVFyS0lFNnhXYmZBcFJlOG1v?=
 =?utf-8?B?L2Z5ZjlKcmRDdmJ1aDgyVFhKNlE3eUpJNDgvVnBFVlBvclZ4YzZNY0VCSjNJ?=
 =?utf-8?B?R3BuVzFVeDZFRVJ5RUlrd2JVaHRRR3RKN1YyRGltdUFuL0FXZExybDBmdEJY?=
 =?utf-8?B?UEtCamh0MWpFWTBFTGxmaWExRXZDb0dSd01Id2xzNGVsMzN0aVZFbnFtN0pz?=
 =?utf-8?B?eVhxL2NwZUdTVTI0QmlDM1FYRGxPVzFIa3cvSERuSWxvNUZpVFNNRXpuYzdl?=
 =?utf-8?B?SS9CTCtDQmxpWGhyVitlaGw3bWVlTzFiQkdEQXo4c1gyS2YwWGVDWDY5a2dQ?=
 =?utf-8?B?eXFteUkwc3pPM1dTYnNlM2s4RTlzMExRTk90aytJK3cvM2U4UEdoYnR2STlP?=
 =?utf-8?B?WHBzbWtYWkhUb2NDMGdpV1ZVUXJnemtoSkZTVnlTWW0xUHo3b2RFd0ExTENN?=
 =?utf-8?B?T1F0M2RBZWJYRkNqcnNMckZ4VW5hclYrczhJK2Q1Mys4bVhIV3dZOUt6Wlkv?=
 =?utf-8?B?cnd6M052eFhUVDlob2QxWjZBOXhUWFA1dG1rQ2FrZGc0UlBXT1hRT1hBVDl2?=
 =?utf-8?B?am1nek9wN3RmZElFVCtndkVWOEw3NEFNdDZlNkJ3VXVBczBWdG1VUTgyRkVr?=
 =?utf-8?B?VWpyaTllWEc4RU5GUy9RMVNqeE1RZDc5ckp2RERjWWozL3hVdGdGN2JMZitH?=
 =?utf-8?B?RUtMOElMcUtUNzYvQ3dkb3lUZnRONm4yV0QzMW9xS1Z6Tkh3SHNZNTR3bm9G?=
 =?utf-8?B?K3FyeEZsYmR2SWdkR3huR1d6Z0VobHA5eXNmdmVCOE5LZ2dURmg5WFozZkl2?=
 =?utf-8?B?Q292S2Mxei8vRDlUc21ldm80TjJ3TkhGaHhCeTREaWVpdHhzQUV6ajBnSGhO?=
 =?utf-8?B?N3JnYXNFbGJZeEpwV2o2bGM5TFg4Zlo1MXFKVGp3dDhlRUtjT1U4WnBBb3V5?=
 =?utf-8?B?S29CM3FqR2FIbVMvK1JEODJPV0JJTUpTYVBBc040bG9hZDhNOEp2Rk9ENFZs?=
 =?utf-8?B?OWRLWG5HY3pqSWtwSXdKTmJMU0x3SDhUM1JYUmhKVnRjbHowVllqeUFzTGRu?=
 =?utf-8?B?NWI5RTNxK1pjaGVtcnZ2TFgwL2Yzbk1ibEdHcGwvOWFpRWxHYXFkUHA0T2Q3?=
 =?utf-8?B?STVIMUYrS1hhQklQQU5vSGk1UHcrMHNPMnB2SEREYjVBVXpOb1ZWL0F3YS94?=
 =?utf-8?B?bFdWcUY0d2FUKzJIMGthTUxKNitSRDAwU3V1YThkQ01weWRxbGhENlJOMlBJ?=
 =?utf-8?B?VFFLRTNVZ2Q1eDkwZ1RyTWg2cTdzMG01OHFvZGQ3Q2VTU3FNY2tNQUxtWXBO?=
 =?utf-8?B?RFhlQUZzZ0g5SzJiNk5TZVNSSFl5RkFGTmpiNjVXM2VIdHZUdGd4M2NLZG1h?=
 =?utf-8?B?aXVJMEY0RVBwY1djS3k5NGJ6dTVzZjArT1cxcnpGNHo2R3dYTkllMW9pUFl6?=
 =?utf-8?B?ZUQwM251Y0o4TkJsa0xvOVF3UytPT3NpRVFoNktrL1RmYUlpODVmT0Z2RU4w?=
 =?utf-8?B?MHdoeTluKy9YWTZVTWV6K0QvZVhaSmpNYkc5Z3lpd0NuVVdyMC9FSTY4cnha?=
 =?utf-8?B?MlJoK1ExeVNtcmRYaGRBU2VrZitmUlRaWGZ5RXJIYUVMZThOM2hMdjN1TDhP?=
 =?utf-8?B?WFMxcGZjSVduMjBaNW41a0hjOSs2MlRWbkxRVFNialJiTGFMK3psKzNRYXhP?=
 =?utf-8?B?VWhTS0U3cmVxK2krZVZoWmM4VzUyeW5vWmVGQ2dpYi9qVzFkUjBYcXR4ckRG?=
 =?utf-8?B?Y3pFS1NsbGN1WCtxRmFiaEpybi9IbDRyK2JnODk0VkhrTkZRUWNMVkdCclha?=
 =?utf-8?B?cmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0277f1b-596a-4efb-f892-08de161ff2ba
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 12:46:00.6936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y3hFY6KEEPVUdFPjYVhmyLqWpR8PRspDGe/ntFe7zdeX+JCNWfo6O6FfO/r30B42xDXCNFOtwmCPN0La05N6/1Ma3xHk7g8y0tinXPHoLCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4957
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

On Thu Oct 23, 2025 at 1:28 PM UTC, Andi Shyti wrote:
> seqprop_sequence() is not intended for use outside seqlock.h.
> Although it is accessible as a macro, it is meant to be used only
> internally within the header.
>
> Replace it with its proper wrapper, raw_read_seqcount().
>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Co-developed-by: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Christoph Lameter (Ampere) <cl@gentwo.org>
> ---

LGTM
Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

--=20
Best regards,
Sebastian

