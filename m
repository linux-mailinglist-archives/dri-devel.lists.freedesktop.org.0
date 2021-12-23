Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E06147E918
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 22:32:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A917810E446;
	Thu, 23 Dec 2021 21:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10E310E444;
 Thu, 23 Dec 2021 21:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640295146; x=1671831146;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ssQjsiIWyR/G55QU+HVclI8/9Tw4Jh5seW8v83hYEzI=;
 b=TMHigFbKIrdTRUGuh0wg+U/UNFpAYCikbJmL9FdLID2JeNgDbdUFAzv8
 lYG3UGN+miMwuFNYoXiirE4KoM+VUrIbei/XTbbUBbWx3UlnB4wpkNYVZ
 EgB6FcYFZpjeyuM0KeANIYWJFQaftINq63rg+ghr2ITrBCt5qtN7Infin
 2+IGcBtb/zvJR4KSLyTQImAnIqTKosFfRC63FehT3It4oipRIF2tlk4o+
 uLSaUSa9TDmiwh7nSKlh6kk6HETh7Hl5HH2e9u2fJ2I+b7aR6Z7i1cb02
 YD0KTSUxHIO+z5pvcpJq/NZVB5WpDRndGxSrHDa7kSYbYXN595QHo+of7 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10207"; a="240842860"
X-IronPort-AV: E=Sophos;i="5.88,230,1635231600"; d="scan'208";a="240842860"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 13:32:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,230,1635231600"; d="scan'208";a="759305332"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga005.fm.intel.com with ESMTP; 23 Dec 2021 13:32:25 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 23 Dec 2021 13:32:24 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 23 Dec 2021 13:32:23 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 23 Dec 2021 13:32:23 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 23 Dec 2021 13:32:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SyBrW98qTUrr8dHIItYNTb+3fZc2ibK7MExGQ3PKVvUvHfpMNFXzxI1IEFQI0/HvYBi5HOIpY2IIMWuf10q2N3J1bhQnSwPqz7WsMH4f/QhuewBZj1/aNhIW5QX3qYLWor0u5iuRyHQwO9/wKg3CCs8laoJh2mVTeVJNCX/PT1VbfvjZSwiYn4l2tDdR92vw0RXwUEQOSe/skO6gocxH9mOrKJrouBecfWFTVdyEUBiq/eqUTysrNHyXz06PeYhoV/NeNqkEDrK4+l9pSHN+lE/1SVw/zpVWKGdM9pgVx+R2Ol7HdmMOagNg+VgnHHVprTEM0i++FtbVZkMAOeAaYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UN8u9C1U72z0VvfkXyZZE0bPT54mMupkmhPydJBwQnc=;
 b=FqrFlQnAzsFWulCNREDlJTRkBahc1KP5HHGwuLtElDPo0M7buIul4JW3Be7kdRQnDDGbshgeIcsJwF0EzCJtYtqP/HN9CG8OOePb1l+x0gxArbMeQMDioO1T3fM7bf/g+iHRW0+JOEmCoIED7qBn1rSMPcXlVvVqZiQxdGEuZzSveoqFieomuJIoJ60d1CXXRKkkFt0g+SdxK/zHc01caXA/VfSEOa5jrI0criEmHanlTOP2xSpCQCTDDBNF245T9iSACs1WeO/roJDA0RZJrBYKWQMzBArWELOruwjk4WVFym5nw9aBWotlveOD4ROO8Pxvl1xoeGJuFUI2wOMldw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB3908.namprd11.prod.outlook.com (2603:10b6:405:7d::13)
 by BN7PR11MB2724.namprd11.prod.outlook.com (2603:10b6:406:b3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 21:32:21 +0000
Received: from BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::81a3:50a8:5c1f:f754]) by BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::81a3:50a8:5c1f:f754%5]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 21:32:21 +0000
Message-ID: <12f2247a-61d3-54d8-7018-77a8a906fea9@intel.com>
Date: Thu, 23 Dec 2021 13:32:17 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [PATCH] drm/i915: Increment composite fence seqno
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211214195913.35735-1-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20211214195913.35735-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0200.namprd04.prod.outlook.com
 (2603:10b6:303:86::25) To BN6PR11MB3908.namprd11.prod.outlook.com
 (2603:10b6:405:7d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f16aa10c-49ed-43ea-f75e-08d9c65bb3bd
X-MS-TrafficTypeDiagnostic: BN7PR11MB2724:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN7PR11MB27248B82997D1297548BC698BD7E9@BN7PR11MB2724.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FH5rJC69OkRR57B/s1fTBVrAawx1VZr6Bt1xjE1+7dugRzmcN+0heKMxTI5n6VNOSSYPjVhA0y6FRU/2LXmm12IzxxIms1uyMp0HJ2af4bJTkwm9axPfnQwaKrBU0m3T7klvDbzfESTpOkPcGXxS4k3i7nnwPT4nA5xO5hgK1c2NUOH9TsoIjwdeeVwPUYBBVgKsWOcb0wkIDzi4VqciqWuidqG4Zt2PU88TQQ5GWl2xBlxZ7tWPEEs8G4Y9szZ4ZRAeYHlHet8XagZdE2lgAfxCZYt+U2wq9aVvwIhOhmHiG6qVfp8ZKh35tPBcmvmjfs06P654uYMoNt4/4jOZgzdKbN1eq+ZwdiAv2rpwM2Bk0bFvFh+hiTFDurz/kTzjbyxLq4hesl/rKUUy3xU2mrLXhzYM70kdpIrNZL4Yje4cJMj5bwCUX/ePCcjb2EMG/zfp8KXoBhML6LqzWsiUSnl/jF6pZBcou04Bq7S0iU+HuOMdEynl+EjiK8LK75MsQPcolD1sTOA/SApVVUVEjrvnK2tVupEJb9mrXMVoe7AXAgawGge6PF9kuAWcMufPe7mSlK8TNn0Xkio5CIvGk+5vQ1LzvplY++z88e/b3sroP/8oPfVJq9D1LWA9IkRrrigqyHOGL5Ac2P1ajM22W6Auea6IlFaBFPBCwM+BO+PJ5c2OgrL3fSXqZ0aaCfk9Jb0ZX5bpfq8kM/aDGSMuuJHwLxo90vZJ2egKFah8osI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB3908.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(31686004)(82960400001)(83380400001)(86362001)(450100002)(5660300002)(2906002)(6512007)(6486002)(6666004)(508600001)(107886003)(26005)(38100700002)(2616005)(8676002)(8936002)(66556008)(6506007)(186003)(4326008)(53546011)(31696002)(66946007)(36756003)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blpxWnlLam0xZHlBRHJWV2VXZVJzQkxSWGZVVmFCYVdVWUhZRVJOb0ZqK0JC?=
 =?utf-8?B?MzlIRnNSYVhyVkRoZmNuTnFFVGpoMDlKUm1rZ1ZYMHBFSm9jeHc0czBIWDNx?=
 =?utf-8?B?UzdZeHRDdXNYaytHV0dYQ2dVci9DSEw3RUZJaW5wTzdrNG1rbFpmM0N6d0RK?=
 =?utf-8?B?OEtMZW11M1Y2eS9SblIxOTNVdVlqa05NWDVlQ29MRUdwZzlPQkJKZ1U5NE9X?=
 =?utf-8?B?SnRuWXcwQkI3dm5maEJESDZjM1o3bDk1aVNncUF4ZVUxNnNHOEZBSzZrTnFD?=
 =?utf-8?B?bFNmLzJIdE54WVJCUDNOQk12MzNVQlFVL0Zqb1Uvc3lFL1Fuek9UZTU0b1pl?=
 =?utf-8?B?TVlhSjNKVVJGdnBGUjRsM2YxcWZ6VTlwaWxHQ2FUSWRFZ3J0cWRpRVVFSVN3?=
 =?utf-8?B?YUl1Qlc4MGRURE05VHhTY01OQXUvSEJFNDlhdlQwazBzN2NRb003UGhWalh0?=
 =?utf-8?B?cm9PclkySEJrT2pybk9jMDhRdk9zSVpTSHFYL2xxLyt1M21yK0ZFOThhT3dT?=
 =?utf-8?B?b3pKR2hwRmVXSXRlckwrdUJKV3IvOVZLZkFQb2FjeGlIdjdSVlprNU9kSGd0?=
 =?utf-8?B?Ly83a2t5VnpWV0RQSTFCcjRXdXQrWTdMRTVua0VrR2xBeHZsbGFNOGg2YVR1?=
 =?utf-8?B?VUtYSE5kVzh5ZEluK0hFRlg3UVhqa2Q4QUVsRmZqUk1SY0F0enZ1MVJneXg5?=
 =?utf-8?B?R3ZSOEYrRGlHL2JTZ05ZWXdoSENuVzNBTlBpWUR2UXljeitNQ2g3VXcrTzlK?=
 =?utf-8?B?bmRhVU56M21BaSt3WllvNnp0eE1TelMzMWQ5bG8ybGJlaVRPbFFyT2tZam02?=
 =?utf-8?B?WUV6RTZyTUNZOGVMWVdkWmRuZ1EzVEsydjNMZ05SY0RQV1VBaks4WG1qcHlo?=
 =?utf-8?B?Wm1ZMmRhVGNxamNWQ1NCSWt6aDRyS2dGOTRFM1lWYXpHNDJlM0dFRU5tMkNK?=
 =?utf-8?B?cjFsUzF3UmpNdXFFaEIrMlhZaTNJU253UnZQdElvTG5RclVaSXRRN1RIc25D?=
 =?utf-8?B?eHEyejV4NjZITElCN21IaDNtMlQ4Sm03RVo1V1MyQnY1UmgyTWhVNFZVTVZa?=
 =?utf-8?B?STFSY21yVkllNmJZK2FMV1dnSWFXZmx2aFhXRzQ4R0x3bXI2R2psb2dvS3lj?=
 =?utf-8?B?MThqTkFEWEZPa1g2d2JaZU9LR3hRb1orb2ZFM3ZSZjFPNTRrcURiNmh5Wld5?=
 =?utf-8?B?TW8rVndqS3EwQkRsM1l3Z1RDb0Qrb0JCbkhEQUFjY3JVY21UMkpvNmJGbVBX?=
 =?utf-8?B?QllaWE9nL0VORVc5ZjhkemlxQnV0UlBzR0ltVndTNnU2TXYwWm5QMXF5Z2ZX?=
 =?utf-8?B?bjR6anhFWG42Z1Zic3hDUzAxTDdUY3crTWNXdXg0SS9YZnJPbFFhVERGVVRz?=
 =?utf-8?B?aW9nM0ozelhGRzJSd1YrZDNsWHRzdEt1Q2VvYXJkUnpudWZkb2VPWkZyT0JS?=
 =?utf-8?B?c3YzTUgyMUF4NTZ0aS9UcTEwek9IVTJkcjdxMmMwVlpjd2Y2dnI0QWtiK3l6?=
 =?utf-8?B?eWtxanMrcWwwekpVTzQ0T1NHR3hXZGxhMGh6V1Jwa1h4OWlRUDFQWWs5bGFK?=
 =?utf-8?B?SFlOdFJKL2RJYmxWN1FZQTE4YUxka3hUMjl6Y0JPM0V1MFUzQUh3d2t6aVc3?=
 =?utf-8?B?bFdER1pzek1BVWo2SXFXTVlQa3R1ZVZDNDdwcVFPNldLUWVxV3l6eUxZcDRq?=
 =?utf-8?B?aGwvZmpaTkMzcFpJaEt6YURjT2VaS3JSRC8wZFRkUHduYUhlMS9nbTAvOHEv?=
 =?utf-8?B?UEp1bitnRmtDcnRDZUl5Z1dXa3d0c1ZVdGRTZk16ZVpFNitGandPSmRqMTRr?=
 =?utf-8?B?ejN2VzRXVjcyZXpHWHd2ODl3Ly9EaC9qV0dNaEtEOXJXVjhERDU2c0xGbER1?=
 =?utf-8?B?ZGxIREdObHY0QWZib0NocWltUnY4TzZrVVc4Z2g5Qk1hUzdGT2t1TUJ1TjVa?=
 =?utf-8?B?cDlmblNRU1hIdksyVEZMVDJPK1VFSFJCU1hkZW5Gc3BiY0hVeS9MeW9vOEl2?=
 =?utf-8?B?Q1BwSUQrVG5hd0kzQ01XOWxPZkJUaFllT0JuQytyTHp0WGRFa3ZITnFKdzFC?=
 =?utf-8?B?akNXKzEvcVh5WHFDMkZCNnpjZjAyRzNDL3AvbHJyVDU1RFlCVDNHYUxFaFlp?=
 =?utf-8?B?d2NoNkZqWm1rcGVsT3FYNWhhOUNtdjJHTHlwN05RVmNnZ3pYaElPa2MxT3JJ?=
 =?utf-8?B?Q1Y3Z0g1ZElVMkM1eUxBKzdYWUZEQ00xanYrMVhtR2pPVUZPVjZHOWtGQ0xN?=
 =?utf-8?B?U0M4ZzBBbTEwYlhzT0F0LzM5Mm1BPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f16aa10c-49ed-43ea-f75e-08d9c65bb3bd
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB3908.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 21:32:21.1405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eC7HvE773F9A47lK04b1Y/NHYesQ0pIoXT4wmaWRfTblyUVETD4bzN3tBdvvuNgp/dwpU3p7tHselkogVLpPpLNrNf+K44Sg2G4aHceiegM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2724
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

On 12/14/2021 11:59, Matthew Brost wrote:
> Increment composite fence seqno on each fence creation.
>
> Fixes: 544460c33821 ("drm/i915: Multi-BB execbuf")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 2213f7b613da..96cf8361b017 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -3113,7 +3113,7 @@ eb_composite_fence_create(struct i915_execbuffer *eb, int out_fence_fd)
>   	fence_array = dma_fence_array_create(eb->num_batches,
>   					     fences,
>   					     eb->context->parallel.fence_context,
> -					     eb->context->parallel.seqno,
> +					     eb->context->parallel.seqno++,
As is, this change looks good. So:
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

However, just spotted that dma_fence_array_create() takes the seqno 
value as an 'unsigned' even though it passes it on to an underlying 
dma-fence as a u64 (and all other dma-fence code uses u64 seqnos). That 
should probably be fixed (and our context::parallel::seqno changed from 
u32 to u64).

John.



>   					     false);
>   	if (!fence_array) {
>   		kfree(fences);

