Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE92466D66
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 00:00:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ACD36FD2A;
	Thu,  2 Dec 2021 23:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F116FD2A;
 Thu,  2 Dec 2021 23:00:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="224100857"
X-IronPort-AV: E=Sophos;i="5.87,283,1631602800"; d="scan'208";a="224100857"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2021 15:00:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,283,1631602800"; d="scan'208";a="478087398"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 02 Dec 2021 15:00:16 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 2 Dec 2021 15:00:16 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 2 Dec 2021 15:00:16 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 2 Dec 2021 15:00:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQeafsgkSs93vDCwTJUx0JkcW+sW3OnGLNb4zjxLHKcZDLkTBkZmhhfdW8bKjA1UK+gwNZ9NxOo0Ngb+MBfLP/XH8Cxhz3dzIPZvpMRZn8qJA9/H6AJ/H2qyfyurXYBc+4vepLOzXyw+i6YN9UhNMBuRaQW+36+I0nhxuDWCqENji2Icd1bmcTuqFlZgHuxdITkV03QBM1knXvxhcFXsqsZV9n6ndQ+zvDoJEQq/63CbPK4wmuYlJbHCZE3krTU9+ChJ9GxRqNDfRLvl7RJbg2LtVEsLg7zr6Qk1+0vUh0h1i0c1qgtnwgO/tFl9E5S1HOGx7Db570pGFpmuwEEDow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IMOBLk6jUlqNtDg4TNXHCke0saKqpaJhzT7eX0HBY80=;
 b=JqZIvEgCH3XlRXnq781h3yBgZhDiGNjeE+Ux39ZfV4MVmuzOeMpzPZIXAx1TDcouyu4b++x3TRsGIn/ylP08Spc3mueb5wq/Q59CWmGsC4aAupkYDhjlo+K0c3obW3+6iBB6ke90DWGETgzjgVMIHBJhX2sphND+bX9k8Wg03YBLzK+ohvVygEPrWb9LEj6eXtEX7mBRuxjlgIVzcI7scoOuE6FbncQlQi9fAEonrlmedN7zmqIDfCVb/MiL9AoHFCkG6vXMj1urjGYFWRs9rzsFPRQDgybpAz1hJ82aNgABCzFVbBqflYVeSXm0aFVpZEP7xSdZycFJRuIHegqF3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMOBLk6jUlqNtDg4TNXHCke0saKqpaJhzT7eX0HBY80=;
 b=cGOSscPFqnUxGro8bHJagbABX3aBhY9ylfdAJBP/lwrTgYcnKCeaXEFg9wq1nZ/Ju9QZKTI7ebXd8G84suB4VVOHmIcfU4pZmVP1VEyoL4VQ63dV8ZgW7DycZ6YdUI4mHVsSSV7fW7e7i7O0gMlnTb1CZmYxQHGYYpAtVBo39Bc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5711.namprd11.prod.outlook.com (2603:10b6:408:14b::23)
 by BN6PR1101MB2145.namprd11.prod.outlook.com (2603:10b6:405:51::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Thu, 2 Dec
 2021 23:00:14 +0000
Received: from BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::de6:9953:b777:39f1]) by BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::de6:9953:b777:39f1%5]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 23:00:14 +0000
Subject: Re: [Intel-gfx] [PATCH v3 5/5] drm/i915/dg2: extend Wa_1409120013 to
 DG2
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20211116174818.2128062-1-matthew.d.roper@intel.com>
 <20211116174818.2128062-6-matthew.d.roper@intel.com>
From: Clint Taylor <Clinton.A.Taylor@intel.com>
Message-ID: <f0b4ab74-5a87-1201-5a7e-605a190b40de@intel.com>
Date: Thu, 2 Dec 2021 15:00:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20211116174818.2128062-6-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: SJ0PR13CA0036.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::11) To BN0PR11MB5711.namprd11.prod.outlook.com
 (2603:10b6:408:14b::23)
MIME-Version: 1.0
Received: from [10.254.63.148] (192.55.52.200) by
 SJ0PR13CA0036.namprd13.prod.outlook.com (2603:10b6:a03:2c2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.9 via Frontend
 Transport; Thu, 2 Dec 2021 23:00:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0aaebee2-d22f-4036-8139-08d9b5e77fe7
X-MS-TrafficTypeDiagnostic: BN6PR1101MB2145:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN6PR1101MB21455DA2579656479ECE88E3CE699@BN6PR1101MB2145.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:52;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pJRLlRO1hizN13esTbDOkBKVue1akKdUC0ywgyeSNGOntJwBarfUtVVY3q7KUdFjQ7ccAqobSreEPrbAnTG/DQLWk88+Mnb4HU6DOiqW5bd+yl0srTYceU6+KHRwjyuHIYQYRdBWVEMNn+1aUkr1vvq3XYmG2MyFFhYNiWHAhCYbDDQK+oMjiAn3Jn03P2dNP6J1YWxc11qNS4z5RX30JFpsgQiOaXxEA40899CHxxh8mOOX4ZjyPWpCQkKI8A9KvrTtVKCbOhGnhBCNY6LxeDYFbTa4AiM8P5iG5Ra35hH++tWqo42YVkpMUEa9hRd3GYTAX0yvwCrcTvh9+rxXmSWs0SUKIE921fagw3onnwBJYVw3V4i7ehUwWnUH3WJmlIE4AOUFp3pP2L7OK05I2x4eOqvPPEmqB+fg4IV3Sz3MkxuYT1+zj1YfZ9BaGPvfK8YCVMqSoehXsTnLIAOPMWb2p4qWJcsXmt2EpfCW3qVIH1sJuB7Yxlaq9LLZoeQ/Xyzjv83g6SUn/6tihb+WwwnIplErmRSMWGlUdi6CI6y3TcLBo3b1XbywN2CbCipDP5YQWGnySNzngiu5OgX6809KgqRNYCiQnXK1XtrZ3kFEtR3tpK0+qHNxmucZQ+o+Z64XyD383gyOrrZHvSeqBPo4rBHp+THfKXMyi7QKWATsRkfnU/1QT1AE396Qv5K0YliMBmnFCCjwpk1iXo7M9DrjqINjGL4ZcBTK8d6KdYs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(956004)(38100700002)(36756003)(6486002)(26005)(5660300002)(2906002)(16576012)(31686004)(8676002)(83380400001)(86362001)(2616005)(6666004)(66476007)(82960400001)(8936002)(186003)(4326008)(450100002)(316002)(53546011)(66946007)(66556008)(31696002)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elF3dE9aN1FqR1NYTWQzWGVmZW1pZkVpVWR6TzErcTdJQUFHODMyU1pkdUF3?=
 =?utf-8?B?U2VmbnhMb1A4NnFVL2dzcDNNM0tGYmNxTjl2L1hwSDR3cFVSYzI3cjFlSC9o?=
 =?utf-8?B?eE4rWnZyQ3h2Z2c0QU93blIxTURVTGkrUEdyQlp3eGVGdFlKZTY3YXhXVGtD?=
 =?utf-8?B?RHI4V05TNnFPYlRIcmVVanFCeXBuUDJPVjJUOVpiZStrL3RCR3NReHF0Nldj?=
 =?utf-8?B?ams1K0l5WGhNdlkwUFZGL01iZXppMGlOaEVqZzdZNkt3eXloUWZmQzlHblFq?=
 =?utf-8?B?T2M3THZ3TnI5QmJOcU1yMEdmQVdDeWRyTjVZNTA0cExBY2pTVTVoWVEzTnZF?=
 =?utf-8?B?RHNyTHdGU0U5Y2IwczdZUThUalhjc3NDWFIzTDEvVERBVWVURll1aFpxVHFX?=
 =?utf-8?B?NEVreWVZQm90UVJ3L0RwampaZTFhS2NkeXo2a3ZMbVd2bmNYalgvc2ZRaEJ1?=
 =?utf-8?B?Rk55S0RUSkgxaFlzOVNBNDFZUUNJUUJ6bnVNZ0kvS21ad3FxdEpBNUhYNWVi?=
 =?utf-8?B?N3A5d0xaZEFmR29tSDJ6VHlkWURXaVNVcWl6cWZ3cmFEdlRpaUlseDNJWmhX?=
 =?utf-8?B?T2llb2tLQXBLKzdzQ2VGRE9OM20xelpZTEZmaGpnY3BkVDMyRjB5cTJGTExw?=
 =?utf-8?B?ckJrajFOQXg3WklOUTZRc2d0WmlYSHF0OHZtRWhRRVY1QVNaSTBmbVh3R3JW?=
 =?utf-8?B?UmdSV2hNNkJKMlUrck9MQ3N3V1dGUEdaUkhTYThxTFE3Z1VGakkzdnBpZ051?=
 =?utf-8?B?TjlRRXNMQ1drdFNTWEtzRkc2b2g4RWZ0WEJUYkNqZktkdWZ1bDREc3ZZSmFR?=
 =?utf-8?B?SUUydm43Y1lvMUc4c1hUNGJuZ09WVnN5cjRjb2hwUnFlRGdlbmUvWWdEZHZ0?=
 =?utf-8?B?UExQYkpRMWxrQnNFUndLYUN1Y3hLSUE3WWloTWxVN3dwbm14Y3VGc1lNdG1m?=
 =?utf-8?B?a3BzRmxhUnR4aTZSejlVOTRiTkZ0SUNPWTh1Uk9GNTk1T1k1Q2dIUzJ1VHA5?=
 =?utf-8?B?TGJsbGtwZCtEMVNOZ1dYNUNkbWtmTUlQVlZ1YVpiTXliZ1pDeTRpNXdiczhE?=
 =?utf-8?B?MUFYd3pjdmJzcTBEVWN4OVk4YmVWNTNRU3lyS2hxYm5zVHpBNzcwWkw3a0cx?=
 =?utf-8?B?S05jb3ZjMmdVRWlIUWZ3cmJsYkxqUlhwbmdrNTgzV242UWduNkRXL2hlejB2?=
 =?utf-8?B?bzdpVXN1SlVlZjJ0QUt4Y25oZXhaaVlmZUtXaWJwcW5YNFdMS3ZGaHpLZmY4?=
 =?utf-8?B?OE1oUkVTd0ZCVXRCSlFoRGpuWDE4OHlzR0pONDZrM0RtSDE0YWF1UXYvVm5o?=
 =?utf-8?B?QkkzWlBWM3Rzb294dGFqdVpraVJNWGp3REtYQ1hUZmMwbUtzaEFwZlo3eDdh?=
 =?utf-8?B?cmhGNWhhN0NlQWE1amVYR0cxVjJyUSs1M2ZIK2FlNkpMSUxxNHd5RVN3RVda?=
 =?utf-8?B?L3cvejRDcVB3S3F4MFpHRjRONVVZaFBxVm11QW5QaFczRXZHTXRkUDdEa3U4?=
 =?utf-8?B?Uk9Ndzc5SE1zWHRacm03ZmZoeUpFVndzRzdUbXc1cTJpNHZFUHpjMVlVOTVM?=
 =?utf-8?B?cFEyL1JDbHU5NzZDbUpBRURsZVE1em5nYVZYbjVFSVdEczN2cWJHVVdGSTls?=
 =?utf-8?B?RzEza2dMVjRxU3JUUTkvQjU3dEpEWTJ1aTV6YWV0QzhkQU5CM09PbDN4Rktt?=
 =?utf-8?B?TW1rZGUzaDNEcTQyU29SVDVBeG11MnNHcTcxRGxqZWVQY1Q4YlU5OC8ydDRO?=
 =?utf-8?B?K091d0xJQjh1aHM2NEo5ZWJPSHhHZUl4SnlTR0d6dVFoVXJsMkM0TXZkL2ZG?=
 =?utf-8?B?R2IvSmNFRVJLaCtveWpnL2dXMHB2OGs0b3FqVGYzaEtjTlJYdDFhemQzaVo3?=
 =?utf-8?B?b0RUTnBsUnlxTVFKVkkyRlc5VjdUZVZ0RzlBMGxHb2RvYnhLWUhaUGhGeGcz?=
 =?utf-8?B?Qll2elpEeEhVd2U2aGJhc0tkcXNsYjlxeW4vTE15NkVIL0ZBUTVoK3d2Wlk0?=
 =?utf-8?B?WHI1MnZxUmM3dEVvWDZlV0NzVENLZXFMQk5YSjVyQWluL2FYQ0JobDhLV2I1?=
 =?utf-8?B?N1B4SlZwRXdHRy9HQlowdit5UDJTN20vOTlYQ011cXprR0lHWDVjbjNOVWFS?=
 =?utf-8?B?NGpSdGFob0x3N09qY2oyZG5zcWovTWlnbWd3MEtuUHAxdytYeW16b0k3bVNv?=
 =?utf-8?B?K1NJZW9Eek8xQ0d6SEJ2ZGt0U2x5VUtlRzBuRXl5bUpYMzJYYkljSmJadjlw?=
 =?utf-8?B?Q2FvRVJnL2ErY3NOU2dibDJWUW53PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aaebee2-d22f-4036-8139-08d9b5e77fe7
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 23:00:13.9847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+RN+t/vbeEiOz0VMDJxqk6GqEJnoVbp8WrwAAHTi8owC1DnCHzFp6ePgNYT+eaXUlmq/WZDcinqayZ6fU1Py14dpWrbj10IjTG3E7u4t/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2145
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Clint Taylor <Clinton.A.Taylor@intel.com>

-Clint

On 11/16/21 9:48 AM, Matt Roper wrote:
> From: Matt Atwood <matthew.s.atwood@intel.com>
>
> Extend existing workaround 1409120013 to DG2.
>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/intel_pm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
> index 89dc7f69baf3..e721c421cc58 100644
> --- a/drivers/gpu/drm/i915/intel_pm.c
> +++ b/drivers/gpu/drm/i915/intel_pm.c
> @@ -7444,9 +7444,9 @@ static void icl_init_clock_gating(struct drm_i915_private *dev_priv)
>   
>   static void gen12lp_init_clock_gating(struct drm_i915_private *dev_priv)
>   {
> -	/* Wa_1409120013:tgl,rkl,adl-s,dg1 */
> +	/* Wa_1409120013:tgl,rkl,adl-s,dg1,dg2 */
>   	if (IS_TIGERLAKE(dev_priv) || IS_ROCKETLAKE(dev_priv) ||
> -	    IS_ALDERLAKE_S(dev_priv) || IS_DG1(dev_priv))
> +	    IS_ALDERLAKE_S(dev_priv) || IS_DG1(dev_priv) || IS_DG2(dev_priv))
>   		intel_uncore_write(&dev_priv->uncore, ILK_DPFC_CHICKEN,
>   				   DPFC_CHICKEN_COMP_DUMMY_PIXEL);
>   
