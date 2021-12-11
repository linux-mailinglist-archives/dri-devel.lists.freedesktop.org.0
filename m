Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE7E470FBE
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 02:07:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2DE10E2CA;
	Sat, 11 Dec 2021 01:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C72B510E2CA;
 Sat, 11 Dec 2021 01:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639184843; x=1670720843;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EDcngE4GGWG9S9ErChB69Pirdk9I+yQU3fogoi9B4Dw=;
 b=aWTpJqaxeZtxGAfj3g8D/8V71SErSkI2iT73e+EdiPVFNTJoauLDfJuD
 ndtuqWzQCkj8BuGk1BN0zoT95vTj/MomuN0vnlc4G7j6hoALtb7incYbM
 DSe7OvcLFG7Llr2tqg7X7Z0naucq+AdKAUXoASz+4+Id9nq3Z/Xz72z0b
 MDQJ7Rd7YJZ3OAcAB8NKGEPxPHZH+w6nisCFdXL9Y9gmk1sJv/w9GTV7f
 BJJfTTRWvccvySKoqq0CFo3n9M1Yfs+6HdwKVtw7xeVmlZNQ3kNCteDo8
 1aPIzuz9oHEuUIbzAW3hcAqJ8hL1bU86/M8pXT+tp8seerz7+wYBJnc4j w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="236008713"
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="236008713"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 17:07:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="544179046"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga001.jf.intel.com with ESMTP; 10 Dec 2021 17:07:19 -0800
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 10 Dec 2021 17:07:17 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 10 Dec 2021 17:07:17 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 10 Dec 2021 17:07:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8RYw9bQ/RPnnu7z7Oxt1p8Jonn4RUws3QzJohE/ZChwYDKceLG4Vc0ahf1IXphDEDjRiV8vs07tPpZco6MUxwUvjUNHKq6BBko+MJ7uuImqRd8nCdZ4Z/IRmyuCD48PUK0E9reLjufwCYzm9Rzl2W2b4JBiLZJ/ijOAB8UTVso5y9KYvr8wc75d/CevGZyKp7PnF+45fMSk109d3nRel1Fqbj4C2yXkYw+hGIySCxaK9zJ7u77blUbS/KvIfwg+W/DaAFrxkGd/+EH3tuPtxq0SW9qBpSqfbTkyHIjQOXlepUpwh7LvQYfjlW+NPmFMu7Ycbon03ofW/oxnMXZgxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVn7LH8d2NpcNCo/XNuN60k1DFDRi2NcZ80sFRweHpw=;
 b=i+f7aGOcf2HyAfxWPi/sbr6fylKntjxtuiDn2hDH+yitnfjR6/96MR2xvX1S0JmbWOZAXVmmUtEpe756hzrXC9ehBkUWfik3snRUGQoYVWMxHmtZE2S5hWce2lbHFQujcgO7tgCdUhYyCTOeyraNGH4vPGmPWDBwQOOvuAmhf0eZ6yPjaq0zY6/tUJiscVaUFDMDDIt3Ybqi3O2m1FZ5WkavO3LZRfKQdMdsVWUYQH3x65MEtUuLLV8S1sI/YdsH3u84j5mEaQ68JSqzk9nknq4pls+oy6xmo8FsSm2x2huSgd2/y0twVXCI/uaVAJic3kbvkk/6ojXgcBlh2bg4bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVn7LH8d2NpcNCo/XNuN60k1DFDRi2NcZ80sFRweHpw=;
 b=rG7dxnt8nlYydCBhIu8GcOQzfpfRRyMXK0aNZzpuB1aNKYstrkmknnx34EyHB9+JeG3NVzg0yq90UJKzN2yPDQ3rF06aNZJm8yM1CPwL52WBF93OTuLQdDDe5GCa5snJrlXINqBAq6cwrZKIdx8xrsisKmHJaIYM+JYA9Ec++jg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BY5PR11MB4008.namprd11.prod.outlook.com (2603:10b6:a03:186::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.14; Sat, 11 Dec
 2021 01:07:15 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::8460:d836:4335:641e]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::8460:d836:4335:641e%5]) with mapi id 15.20.4778.015; Sat, 11 Dec 2021
 01:07:15 +0000
Message-ID: <ec870417-3894-0bb2-6561-722b8345be6f@intel.com>
Date: Fri, 10 Dec 2021 17:07:12 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [PATCH 4/7] drm/i915/guc: Don't hog IRQs when destroying contexts
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211211005612.8575-1-matthew.brost@intel.com>
 <20211211005612.8575-5-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20211211005612.8575-5-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0059.namprd04.prod.outlook.com
 (2603:10b6:303:6a::34) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 472d5e6f-2840-4d1b-5021-08d9bc4291e8
X-MS-TrafficTypeDiagnostic: BY5PR11MB4008:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BY5PR11MB4008606CB9427812D4FF9276BD729@BY5PR11MB4008.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6kG7siCp7saO/fWIARJQqZ4zjvVdE5VHCH488C8HyyfD0EhtFsfMJYGuz23VwOmKF41lJzw1OJ6HZA/V3YDE++JDIbacMqjD6OQt7F/7YrAgHX0lgz0ibnLiclywL4fqqqTAflZrfTmyZPds0NdtzE6948WyzFNTUdepqdQxeLPDKNcji+VVf3GXAxBYWPYw6Kzx0KBNdULMPk3FPOQmHWCEoawi2zGvn8LL82r8JVX9X4e0ymDgedjBO654ksOWx7Vqh1IdZBISIQ7LC2APp6fA+20O8h12r70LQCorXgcLoLYJhfOheZ8BpZaalIP0CAnlZbai2zGY4cTz4IhNH8Ss9ddb/fv0d8hxtw/W49X/QtV8kWSE9jqFAE9EZlCGeHYZ8nyzjyWoDRCGMhjCMZvnf3kWOk9caz27ufoSviWCGOZo4xCRD2r2s8WLseGAysG/jqqJhH7CfXudGU8Lw3gXk6jOCDaHFJzDJ33A4fTCNhuQxFEEAzJsAjsFrfpo+FD1HSueJoH6WGtWNjf0OO2lE99rUwNIwe+f0Fk6RsXbNdN4BRtW10QhMrB04XKsOOXGWtgkUf+/mM5m8yh1qKaA+Egl9a2gbBm6ghEp2muTCZ8N2AX8MtMVNY3NIphVj/nSS25v8wNLK52Q2V2rzQ466Tjom50TQvjK8t0atNBhSN64v16muPlGmTrBDxHelBROhtgx3zeavmDL4cMWhj0GyFMtHfoAKpi87ccP17IbmgYWMJAdojuf9WdAMpHa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4326008)(66556008)(316002)(8676002)(66946007)(450100002)(31696002)(107886003)(2616005)(8936002)(53546011)(38100700002)(6512007)(5660300002)(82960400001)(31686004)(66476007)(2906002)(86362001)(26005)(36756003)(6486002)(6666004)(6506007)(508600001)(186003)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWhBNjAvZjlCb0loNjFQUkg1bTRZbWlzNGlSV1dLV1ZSeE1zbDU5U05WNGR3?=
 =?utf-8?B?bDd4YWdselU5QVRkNlZ6ek5rY21IS1FmV0pGbVJneEVBZWJoM00yVkNQNW5v?=
 =?utf-8?B?VFVSL1VHbG9iMktGS3NYemxYVm5qNUR4Ky96NUY1OE52dnJFM3hnMkxVMWE0?=
 =?utf-8?B?cmJRdDBqdGkrcGdtaGRPQm9VKzJGdGJQemIrZmRhYnRWcndqMEpFbTBPN3Y0?=
 =?utf-8?B?WnJIdDJYeE9JRi9DUzFqQlhaSncyMlU4WWpSTStXSGloVUUzSEhaK2Q3Wk1p?=
 =?utf-8?B?RDV5U3Ava0J6QVJ2T1hIVjd1TXhMaVEycTR2SWRiTDVEUVIvR0NaMmlPWkkz?=
 =?utf-8?B?aWxUZEdVbUhwRzVPSXA0L1FwbUl5eDRTbE9BVjBNU2RKYm9KbTVTVGxlbGEz?=
 =?utf-8?B?SnUrV09TK28zNkkzeHREd2dYL3RoNzVMM2ZWaE4xWnpMWkhzSFNsL0plekkx?=
 =?utf-8?B?a05zRnptNUhTdW1RQTN6V2dIU0FSWlpHcHp3ajNaUStKdUE0OXZVN0J4MHox?=
 =?utf-8?B?M25ubm51aHF4QVEyZ0JUcTNmR2xwWkhYeHgzRlo0VE80L25FeUhZWjAvRXJ1?=
 =?utf-8?B?VDRrbFZKYTNGTXptVnVtK1J4eVVrNmZtbSs3UWh0cGtTelZHSXAwN2pTbUVH?=
 =?utf-8?B?b2JyMEU1eFN3TTJLL3VTM2NkMjhTN1NJaVNORDVxT3A2L2g3TVJoMmcybmZl?=
 =?utf-8?B?ZVdmOFJ2WHlWUDdEVHVwSGNSVmpiQ2krQ3I1V0YxQWp2TktUMWEwWkhkYkl5?=
 =?utf-8?B?ZnE4N0Nyd2NodnVhb0tyZ2FDWDNORkhUY2pjUUJWT2Rvd0srZ285TlJOMEcv?=
 =?utf-8?B?Z0hON3JPd0VLdmc1c0txTUkvWmFQSWVwNFhPQlFnMHpxRjJ1RVlldVhVQXV5?=
 =?utf-8?B?L3hvY0o4WEZWV1BFeGF3Q2ZobDMrVFRjWEI2aW11T2lodCs4UnRrNTVOa0Q4?=
 =?utf-8?B?eTdPNGNiSmVYdlJMS3ErZkp4dldkUjVZVEtVRjlhSkJzalFTRUlYdmlzSjBB?=
 =?utf-8?B?NXoxNXkzeHphNmg3WVF4UDFscDAwd2picTI0a1lOWGlwc3VNVkdMR0VGS3hU?=
 =?utf-8?B?UkFUN1hSbGhzNm56djAzeUpJb3NJbzBMOW5hRlNBVHNMaVFuNm1laXVtZmhk?=
 =?utf-8?B?UjRkdThGRlN4Y3RZT2Y5UUJOLzBlbFhzVUNLenJrTXlnQTNtbE5xd09tbDFC?=
 =?utf-8?B?QUhzcmh1SmJlRElSVmYxakRoTnJCaWFjRU1LVjhZUE9BTk1kMURWZC9lZExy?=
 =?utf-8?B?SHM5RHZkbTdudDVtWWRCSkdGelRqWEozOUl6cWlDV3NIWTU0UHY4M2ZGcWFJ?=
 =?utf-8?B?WXJ3eEVMQTVsU1A4SGJQWWpGMFJZWEhZWnhnQ2J0WnBOWTdEYldvdlRXdzZ1?=
 =?utf-8?B?VEdlU2FkV3I3V3htVFp6Z2VsZVJ0d2xmd215WHNQb2dnSGRZeTFPd3lqV1Zs?=
 =?utf-8?B?S1VoMnNvRjIrTXpDUWZzYmI5QW1GZkQ2bVNNQ2FIaXNtTGNNMlQyelNCRnRk?=
 =?utf-8?B?T0RIb1ZETk5paWZuNzBvLy85cklVTjY5eHdBYU5Tdm4yQ0ZWUldtdkl6Qkk1?=
 =?utf-8?B?TzJIT21RSTkrd2EzdytaZE1uVjg4aG82dFRJMm9QazRSaWhobGpNSGJWTHE0?=
 =?utf-8?B?dStEVFZRRTl0UERVT0xrQWx1WkZFaU1qaUpJQ0VmTUU0NkFtN05SSjY4a1Bs?=
 =?utf-8?B?VllSM2tXVDc1TXhjSVJUYTQxRnFPeW9vRFk3MzhDQlViR01yck9LS2xHTVh1?=
 =?utf-8?B?UEhKREZNYnhsT0pCMU1zSE9meEd5Y0NlSEdNT3p2aUdVdnhaZDJqeWwvdm1H?=
 =?utf-8?B?M2dubVJXdmJFQ0FhRFNpaXR2aGZWNnp4d3d3RnR2cFpSdzB6R1k3NFpjOUZi?=
 =?utf-8?B?TU9MWWNyN3ZLcTZ1K0UwbmhvSFFTRUVleVd6dW9oc2M3bHROcmw3QVJReDVv?=
 =?utf-8?B?OS9vbmkyV2pLenVwcStNc0ttWnZJakRMM3g3ZUdiNXN5SzhyeThCZkE1ZEUy?=
 =?utf-8?B?VnhNK0JTcks1UTMxUlcxSS91UUNKQVRHSFlISWg4TThzQVVWcWdZY0V1cTJh?=
 =?utf-8?B?MVJlTzZXZDB2SXFURjNoQ2RhaHB6OGpXU1ZGS1ZoTUdoYkQ4aS9QTUdjbkRu?=
 =?utf-8?B?TUlNbDhZS1JtTVpURXlndEdtaEpiZEp5SFdHTWF4eWJWV21BVFJLWTc2dGF6?=
 =?utf-8?B?NXFiL1M2QTdYeHBuSG11YmxCYWFqVFZkdE1oY2o0K3dNSm0vRUExa1NIOUZO?=
 =?utf-8?Q?fNirnvgO6KAfxPBlzy96GCo9rHrZUlGqcGNknkBSsY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 472d5e6f-2840-4d1b-5021-08d9bc4291e8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 01:07:15.3139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eoy5bz2hQyf1Jc2glld1ej8PKWmoVJRfYtN71UJbAd18LfPTgqZuNtZy210UzghlKZozUA3SZhRDyrAzSD386eZg2u8N5qBeaTDDWPRfXk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4008
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
Cc: daniele.ceraolospurio@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/10/2021 16:56, Matthew Brost wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> While attempting to debug a CT deadlock issue in various CI failures
> (most easily reproduced with gem_ctx_create/basic-files), I was seeing
> CPU deadlock errors being reported. This were because the context
> destroy loop was blocking waiting on H2G space from inside an IRQ
> spinlock. There was deadlock as such, it's just that the H2G queue was
There was *no* deadlock as such

John.

> full of context destroy commands and GuC was taking a long time to
> process them. However, the kernel was seeing the large amount of time
> spent inside the IRQ lock as a dead CPU. Various Bad Things(tm) would
> then happen (heartbeat failures, CT deadlock errors, outstanding H2G
> WARNs, etc.).
>
> Re-working the loop to only acquire the spinlock around the list
> management (which is all it is meant to protect) rather than the
> entire destroy operation seems to fix all the above issues.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 45 ++++++++++++-------
>   1 file changed, 28 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 36c2965db49b..96fcf869e3ff 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2644,7 +2644,6 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
>   	unsigned long flags;
>   	bool disabled;
>   
> -	lockdep_assert_held(&guc->submission_state.lock);
>   	GEM_BUG_ON(!intel_gt_pm_is_awake(gt));
>   	GEM_BUG_ON(!lrc_desc_registered(guc, ce->guc_id.id));
>   	GEM_BUG_ON(ce != __get_context(guc, ce->guc_id.id));
> @@ -2660,7 +2659,7 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
>   	}
>   	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   	if (unlikely(disabled)) {
> -		__release_guc_id(guc, ce);
> +		release_guc_id(guc, ce);
>   		__guc_context_destroy(ce);
>   		return;
>   	}
> @@ -2694,36 +2693,48 @@ static void __guc_context_destroy(struct intel_context *ce)
>   
>   static void guc_flush_destroyed_contexts(struct intel_guc *guc)
>   {
> -	struct intel_context *ce, *cn;
> +	struct intel_context *ce;
>   	unsigned long flags;
>   
>   	GEM_BUG_ON(!submission_disabled(guc) &&
>   		   guc_submission_initialized(guc));
>   
> -	spin_lock_irqsave(&guc->submission_state.lock, flags);
> -	list_for_each_entry_safe(ce, cn,
> -				 &guc->submission_state.destroyed_contexts,
> -				 destroyed_link) {
> -		list_del_init(&ce->destroyed_link);
> -		__release_guc_id(guc, ce);
> +	while (!list_empty(&guc->submission_state.destroyed_contexts)) {
> +		spin_lock_irqsave(&guc->submission_state.lock, flags);
> +		ce = list_first_entry_or_null(&guc->submission_state.destroyed_contexts,
> +					      struct intel_context,
> +					      destroyed_link);
> +		if (ce)
> +			list_del_init(&ce->destroyed_link);
> +		spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> +
> +		if (!ce)
> +			break;
> +
> +		release_guc_id(guc, ce);
>   		__guc_context_destroy(ce);
>   	}
> -	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>   }
>   
>   static void deregister_destroyed_contexts(struct intel_guc *guc)
>   {
> -	struct intel_context *ce, *cn;
> +	struct intel_context *ce;
>   	unsigned long flags;
>   
> -	spin_lock_irqsave(&guc->submission_state.lock, flags);
> -	list_for_each_entry_safe(ce, cn,
> -				 &guc->submission_state.destroyed_contexts,
> -				 destroyed_link) {
> -		list_del_init(&ce->destroyed_link);
> +	while (!list_empty(&guc->submission_state.destroyed_contexts)) {
> +		spin_lock_irqsave(&guc->submission_state.lock, flags);
> +		ce = list_first_entry_or_null(&guc->submission_state.destroyed_contexts,
> +					      struct intel_context,
> +					      destroyed_link);
> +		if (ce)
> +			list_del_init(&ce->destroyed_link);
> +		spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> +
> +		if (!ce)
> +			break;
> +
>   		guc_lrc_desc_unpin(ce);
>   	}
> -	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>   }
>   
>   static void destroyed_worker_func(struct work_struct *w)

