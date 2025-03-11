Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 215DFA5C06C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 13:16:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64BD310E584;
	Tue, 11 Mar 2025 12:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U3G3+nJM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC8F10E584;
 Tue, 11 Mar 2025 12:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741695383; x=1773231383;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Sagqmop4cZ639mp+ZK0wDSGrU9Dk61Uk4lMMzBFb22I=;
 b=U3G3+nJMYwP+zolpXlLlEQXahRpbgakfCCUFebKQhDBnZrAjd9RDIEkp
 f4Hf9YhrKasUxcpOs0zhuOfpxhdOJZm65NKfpY5DcsMj5Q3UdVJHdpJNt
 Mobh8+SRZjyFsUeh4Dz+SCOYrzqYgx+9kS4t6I6L3967626oGVlkhZ4/n
 vEwM2XjCGF8EMitYW9Xrj2EKufh+NOceBdoc+JEqM3IBKJaWrUlvvOq+r
 wAsSxFmBNbUrkKPgROxjQTX/m3uCVgvDIF8/qyZKzPwCfS55VwORmFcBY
 CTwRZWh05r5HvNiydhfr8cPDZdm8kBLcSVZk6qI27NRFBBFAEBMtSCzdP g==;
X-CSE-ConnectionGUID: ok5cpQIzSk2yT5mWZ6L8PQ==
X-CSE-MsgGUID: BL1hQW0dRXiAdUvotr+czQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="46377896"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="46377896"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 05:16:23 -0700
X-CSE-ConnectionGUID: OiGPkygMTBC6eSn9taxdnw==
X-CSE-MsgGUID: 8X5LV2p/RBC2J2qJQE2GGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="151253191"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 05:16:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 11 Mar 2025 05:16:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 11 Mar 2025 05:16:22 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 05:16:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u32zStzepwg6x8l6yvckoEEh6ppowLcgYk2Rqut+cfPrw6/iiuMIfEG0FVBcyo8h8BQcEAL2zEWCSs/PhOpYGURoxTg4MnE9yF8V5HGqum08rRmldoWHucGTslgYKfsqjkoDpstDDNCeCd1OF6u45jTm+Mx+zFI7ODuSfFkQDfBqzXwu1wdeQ1fa0qVyE762Kfz2BmnGgLMklr74zm/CY7pgGmOGmlXmZ+gu4LWYUs4mQBcHB6I3XfwoW/cdXqC3XvDsAsJ7zfEbxDmqThoKPtGg8DVV0VdVmpKvrE4paOQwnwTjrmyR+gDsUu0Ne8b8cvV69LhjjiBsJyLzjkZxGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27paIrrHf1Q+tuX03YxdkCYCROh4O+ZDNssSqoAde0c=;
 b=WWTPEHMEbQ5VZ2l44c8Pn4mq+Ztgg1pHYUW0PpVFm3mkKnPRwqqQnF9A/gVmAPdbWmQ3Teh0pIfW2syh1HgboCXmBYw8Pv/h7DtKs0ZqzN/NfFdtBETadikF4ydFQupBx6LFqOokg88DpxPY3g2hya7cuCJn6FRxJzAwVa2PBgH3nukT7Lq64h4CaXvGyla6ZZh3Wx2OZQxYIEP+nwdY7eQW1xiAXWC2QY8MzSH/pEgW1U9vbBBjdf+uwqP/RPoFtqTBdsDm03YqCBvCfrQAz+kAybcyv5xzKeRkyWZBx2o5WIAZRoJfykfD3dMNnh1o8egjsYGiI94iBx67HIWydg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SN7PR11MB7602.namprd11.prod.outlook.com (2603:10b6:806:348::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 12:15:38 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8489.025; Tue, 11 Mar 2025
 12:15:38 +0000
Message-ID: <dcb2bf8b-fa08-4ec5-8e41-20049e85a690@intel.com>
Date: Tue, 11 Mar 2025 17:45:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] drm/i915/display: Expose casf property
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20250304102857.326544-1-nemesa.garg@intel.com>
 <20250304102857.326544-11-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250304102857.326544-11-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::9) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SN7PR11MB7602:EE_
X-MS-Office365-Filtering-Correlation-Id: f2254f77-1aac-4399-311a-08dd60966f35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aW1GTmVEQlh0cE5XWFArWFNIMkg2aVgxZEdnVmQvQ1VxUWFQa20weHZOMjFV?=
 =?utf-8?B?SS9zeExUN3R4bzZuN2dsV0F2dG5rNU41QlBUYTI2L1VaV09UcDZ6QVJHVkZ4?=
 =?utf-8?B?Ry9UT0NVaWFrc1J1NmNZRW5Ud0F5ek5tZTB4OUFSclVGcDB0eG5ycGNvKzVC?=
 =?utf-8?B?VlV2RTBqanp1Sm9QZkF5VHUvUEF4R2pUYjQwTTRMS2xBd1VGT1RYeHdFb2Yw?=
 =?utf-8?B?NVMrYjB6OWpXRG5CVkxqanVvSk1lanh4SW1jU2o3emtDNitNUUNkNmlaVThI?=
 =?utf-8?B?ajB4alJBdEtBMVhZYi94ZTd3WVlqcWtzaVVZdzNxbEkvTXVWYVNjYytZVGpj?=
 =?utf-8?B?VURIQVJaTS94R3RrYkpzQzR5NzRWdUVJYUYwQmpxY0NLUm5mUmZtVUpzbUZ1?=
 =?utf-8?B?M0REM1JmV3htalVvN3grS0tkblM3b253OGJVeFdIRkREZHFuN1dmQXdkaU9S?=
 =?utf-8?B?UC9paEd1Y2h5SzJrUFBRZTJiQW5MUFJybEhKOUVFM0lEVW5CME4zWGEzUmtO?=
 =?utf-8?B?cVd1VXJ6MEh4M0FEYXFVK0tVSCtQeXdnWnhwZ3ppS0VkVmJKNUdYK1Z3UEFG?=
 =?utf-8?B?NUlQYnIvZnBGa0tnaThWZmZ1ZmRmQW5VWXozMVlFc1lZSERVanZ6NUVibUNq?=
 =?utf-8?B?OWNlQkpPaEVOQ3RKYkorZ09tYzJCUE5IUzZacnVJZzZvNkxIMzNidUIxelVM?=
 =?utf-8?B?UW5IRTVVajUrZVB2bEFCVHJONVdtczFoOUI0Rk43TmFMajFKSThUY1ozbWl5?=
 =?utf-8?B?U0dJSytOdzJUdllxYk55N0RVRnB4c3NXaFY4Q2Fvaitsc3doOFRwUXBkZHBj?=
 =?utf-8?B?dlhPTXRtYXREWERGREg0QWdvaWt6V2E5Yzh0eDI2RkRvbWJuYzNXYXFhN3Na?=
 =?utf-8?B?bGVrZHdUUHJXT0VFWkZUYnlCSnl4VTFJSjNWNU5OaGRZVnlYdmhtN2xFSXZq?=
 =?utf-8?B?L3BVMmFXZzFhaUFtZTdCVWhEMlR0UCtvb1lxeXJQMXRoRWdzSWlSNFNFMWU2?=
 =?utf-8?B?TGI0aC96czU1czJDVEcraTBBZi81Y2VhUXlQcks4amI2NHFaOUI4d3QvK1VX?=
 =?utf-8?B?c3A0M3duRU9DOUMxN0h5Tmo1UzFoUG9RN0QyVndQeVgvQVFjUGdYN0x2YXJk?=
 =?utf-8?B?cjJnemhPV1U1ZEc4ZWY1SHpzbCtKRThVQTVIM1dKU0NsNDVjRE5JTklobE9G?=
 =?utf-8?B?bWsvMk5CeDVmZDFRNnVReW16Rm1CVkNqRDhBM1BpOEpKYmlEQmNaeTQzU1dl?=
 =?utf-8?B?VlNGMlVIdHVvV1dGcGx3Q1dTWFptS1NzRGF1b3dnS0xUS1ZKNjdMVytPRFA1?=
 =?utf-8?B?QUNDZHVQTW9hYWJKK1FIdmdzU3UyVUp6QWgwRVMxS3ppd2VVZ2pxZW5iWEdP?=
 =?utf-8?B?aVRxTlpaTDZsMGIrUDEreWxTQjA1MzBXbDRoaXAzV2lrQzVPTXJqWjc5YlJo?=
 =?utf-8?B?TW5mV0Y3c21KUTBkblFxdEw1Y3g5YjZQZTMwaVRYRHZyUFlHNHVnQUVSNU83?=
 =?utf-8?B?aE1hUlB3NkhyT3VDaHhadFZCWUx6bXlVQXRuQUNvdi9RTnpsaU9UaUFTbFF1?=
 =?utf-8?B?L0YyRzVFUjJzNkt5ZEhQNVdnWTdiVmlpNFJTQ3J5L3JzdFdxeTZJU05semNt?=
 =?utf-8?B?VzNZVGRNQzl3ZnlnODhUTHlyTUpVS09vd1JLV0lDSVVvdFFzNFNsY3ZqMUdu?=
 =?utf-8?B?OFh4UlZGQUlvc3dzYUpOSXN0MmlYK1VkZU1vRnNvM2xkYnNGeThzZzZ6Qzk3?=
 =?utf-8?B?WnVHVmhkbFAvZkQxOU4yMzlmcjJGTndFTENxQUZBUmFsSmR4Y2I3WkZNUVBk?=
 =?utf-8?B?K0JXK1hFcWFWdTNnWGkwc0RqaWIzVU9obFNQSCt0WG0yaGh5bktUUE5OMjl4?=
 =?utf-8?Q?OlateuMPtF/WY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFFJcXA0TGVlK2swcXdPUlQ0ck1aakpIbVpTbzE3cXpPSGpqdDY5QmcrK1Rw?=
 =?utf-8?B?NDNMOEp1Q0hVbFo3Qy85MCtZbzVPcmpuVlJkb1A1bFR0TXQ2R1BVWlNCZDJR?=
 =?utf-8?B?c2Z1OEpxNFFpOE01NDE0YWQ2YTc1TTBrdEUvbkRaRTBJYWlQNnE0RERqWktG?=
 =?utf-8?B?eTNQemVVR0w0YzhWY3hIVW5wNHJ3ME52eDZ4VUZ0MjJoTkxWaW1TMjM0VmNq?=
 =?utf-8?B?Q2NURlFRbGo4SGxOQXd6a0pUOXpNNWt2QW9lanRBMUpybk5EYytGcHc1bVgy?=
 =?utf-8?B?MFQySGk1a3dSZG5xcXdrM212Ymx6M2djd3ZtRUZUOStKNU1vaE9OMWV1eThx?=
 =?utf-8?B?L2RNMytwZHUwR2RZMkI1YktEdFNnNWNCWUh0eThFREFLRmhzbURPRldvOTFH?=
 =?utf-8?B?WXVMUnhEVnA0UURTMGxHdkd1cnptNTI1cno5U2xOdXFVSjFGQ2w5Z05IV0Yz?=
 =?utf-8?B?MWZyNEluNUNWdXg0RXZtK3pnMW9JdlhnVjBiOURIaFg2bkFXTytqMWUwWGdB?=
 =?utf-8?B?NzQ4STA4WE1pWlRGWUNjeHA5RTlud25GTitiK2FNUTcrYXBOU2RmOSt0NCtL?=
 =?utf-8?B?R0lmdzA5NXQ5a0dSd1lKRmFQcm5YL1MrUzdEVlU2cE9LZEk4SElxNEc5VEhZ?=
 =?utf-8?B?RTZrTVhwUVh2VWFUODNLTFVCdWdIMnNsZmFRQll4Um1pMkJWcUNqeVkyVTc5?=
 =?utf-8?B?U2dqeFdkWDYzMWY4M0RaQS9veVRudm5kRlMwMWw1TWtVNXdCYm5WYkZKU2hH?=
 =?utf-8?B?UFZSd0FkUk5Sc3cydEwxWktPVTc2NnFWY0xtMlZpSS9ZU3dVbDRCek0wQ3hk?=
 =?utf-8?B?YS9IWmhQclB6dkdsTnFlQkZ6eWRPNEZJa2J5SnErRVN6cnowRHQ4MlNPdVA5?=
 =?utf-8?B?OXVVY3NXLzdZeHRIL3d3WjFMODF6b0NBYkJjbTY3ODZXQnlaSkQ2RGJqdS9o?=
 =?utf-8?B?UUxpMXBCZGl0Q2d1QU1VMG9takdXQU5ONjVrd3FxMCtVejh5UTFSWDNYL1Az?=
 =?utf-8?B?c01vUW5IUGxkZ21aYktVc2FSNGdNOG1wQjNIQklFekxrUHlGM28xWlFaOThq?=
 =?utf-8?B?Q05naThwWVRHSi8xbmppa1dZWlE3WURkZ0NIMzh6WHVPV09KcncvcHNaK2Fh?=
 =?utf-8?B?VHVnVWJLU0I1QmZrM0lkNkc4WkdxYVNuWEl2aytaTkkvSVBkSCtxT2Riakx4?=
 =?utf-8?B?L3ZOblVUR0lGSmtUbnBPVmtudHYrUHpSYVhQSk5tUnhhZ0ZLN1gvaWlQWHdL?=
 =?utf-8?B?QTNNUzlRZEpWSExPOUQyK3RxeXA1RkZXM0tlN2xKMmowSHJnNGVOSTBubVBw?=
 =?utf-8?B?cGc5V3NKZnFjZDV0bUloeXpYNVNjSCtmTDFRTk5TZDJxQS95alhoTjNGdnR0?=
 =?utf-8?B?QUpHeXlEdWIzNmQ3cTJZQmJQdkpndHBxTjZHNWk3Vzh6WHJUckp3bU5NLzlT?=
 =?utf-8?B?YmwwMm9SMEVCd09iTzBCRUhlek5TenF4MjhUY1FTQmNiU2dRTFJJRjlxMTBU?=
 =?utf-8?B?elFPTzE3MnUwcS95K1ZmamlqTld1UzZFMlhBWEV5YnQvaFFrUGFhUlJhKzV5?=
 =?utf-8?B?MDkwdThmdnkybXFvM2JIOG9adC8xdVUwVTJNRlhzbWdHQ2lKb0ZsTHVJVFE1?=
 =?utf-8?B?ZlZHd1UvMmF3dkcrZk02UUc1OGo0b2tUT1NXRC9RVFo3VmtxWmdWc0JOaDRy?=
 =?utf-8?B?bTlJdWJzMTFEWkZUZzBPUHBGaDgycG9XMFRHRitGRWNqY3JPVVMyclk3SnpY?=
 =?utf-8?B?QnVpQjFLVzFmWUNmYmZDU1cxSkpRTmdhM3Yyc0Mzc0pxSkY0TzFKMHpVdTZT?=
 =?utf-8?B?SGVXTmN4NVFuS09Ga0o2QkhSWkNGUThuNnQ1SUpPNGxMM3JIVGlLc3k4R2lh?=
 =?utf-8?B?Z1RBNVJ1TGlPUEtnUDlFZDhxSGxacG9NQndaejlYbnhJckFyZUprRUp2RU5L?=
 =?utf-8?B?U1NjZC9WVjgzRmNsak4xS2FjNjJ6cFJ6K0NWeGtMeElVRDhHNHdpVm12Zkl5?=
 =?utf-8?B?T3N6NTd1bFUwbTkvRFVNb2dnVHVYeHJObGw5azdHT0l1ZlgzczBCOXFHWWky?=
 =?utf-8?B?S09rcTF1SXk4S3Z2MjVPcWdWbG8zQU5INWRxRGxzbWs0TWxEQURZNUgvREtv?=
 =?utf-8?B?amJ3OUVXNTMyeTVYeUEvcENLbXEvRDJGMWh3V3VmR0hRNHc2TysvTmdjZDhh?=
 =?utf-8?B?aEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2254f77-1aac-4399-311a-08dd60966f35
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 12:15:38.6942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Fu0X1MzWc7UtjPW1UzsG0W1QLVWO+ht4kJOjGkefAOw+ugx3FTS9hdj/MIbwxRbvU49Kx6pqFZkXypyUEANH7a9gvyyUwYX9KM+sss0jK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7602
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


On 3/4/2025 3:58 PM, Nemesa Garg wrote:
> Expose the drm crtc sharpness property
> which will ultimately enable the sharpness.

The drm crtc property is sharpness strength.

So lets have the subject and commit message in line with that.

Regards,

Ankit


>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_crtc.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
> index 5b2603ef2ff7..b8bd255e9555 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc.c
> @@ -391,6 +391,9 @@ int intel_crtc_init(struct intel_display *display, enum pipe pipe)
>   
>   	drm_WARN_ON(display->drm, drm_crtc_index(&crtc->base) != crtc->pipe);
>   
> +	if (HAS_CASF(dev_priv))
> +		drm_crtc_create_sharpness_strength_property(&crtc->base);
> +
>   	return 0;
>   
>   fail:
