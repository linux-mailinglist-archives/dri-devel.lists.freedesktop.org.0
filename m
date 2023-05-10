Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DF76FDB00
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 11:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6BE10E1CD;
	Wed, 10 May 2023 09:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A85010E1CD
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 09:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683711991; x=1715247991;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=D7wukgMs+ZA7jQMuHdM2uYe0bvwzjAfmNSH9spllfmw=;
 b=cjDckOZ4LwNAPwwvAY9a4XqTKlXCjhcT6NjwAx98yEYpa21jvm1wzQF3
 DWj1MjZ8eIzs5FkmvbDPoohCFvql6phAnhKcBTzds+b5mfUUH+VNyBFni
 2H1r8WxJl24HKknj6urovu84Lb60tac/A8aJeHe4SBnY+Ytgaf1mVG29R
 fkSFNqI+DJ4GccV0pRF2O3XNmmvFFKGGaeZa07u1HCV6yq1ovsIXN3Yja
 AZdGXkT4xseeqDMWMO0egL0TG34jFVYQQ3ouaA8QFq5AVF69fbJ9w/IZ2
 3hQHdmM9GzxK9mnVZ/EoA6amtjB3TlUBbf2mvak/g+/EnTSYXGaKhmg+V Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="330537691"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="330537691"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 02:46:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="693325660"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="693325660"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 10 May 2023 02:46:30 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 10 May 2023 02:46:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 10 May 2023 02:46:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 10 May 2023 02:46:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=icoiqO2q+EG0uHtXBI7qsfsO0OQUjTSsqBK9NYGJbEHIsSvncoWlyjzLJpiV7A9Hp6hB3Tqk64+voUyql6cOKDEWVKY+u1+VvTxzy3skTGIaDi+5EfwwNyZx3PL+uZAs12XEoEk5fWxyDo8opiXYdqvmc8HlRiu2B8MxCz5GX2ZcEBazFwvgH6chBPITjnN255UErH0BzniaIoRQktdRbcQfmiglOXlHbeZBUwv1OxbeMlh2ow6tBefkU6R54LB44MCyfQoIDz8eAFuk9QGlDGoc11cWLn1PaUX2fMLP8oHCYZdFuUIwip6IlMm6Td5k5SsALa8Rgt3GnuXXp6+egw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xzq0H3EvQ3Qz2NKZYrNF4yE/nroMFWZOJrbKG2WctJU=;
 b=FoU/sZC1Nv38d+7dtjKL/YzbDpc4vt2Q2l1voIJIsUb9PqqqhNrHlUQTBIfgm2KmXeyyXpB0idKUVi20O0FNCiWa5zNFnscbBpmbcDDsX13mVm/iB7H6OZkeClSW8LoLIyCTZ9DxIGdJq3R6KXX7SLeCmLmqO2AlAazRyiMIXgt0DELEUc8QmU3lxZvqrSOOskjvLF+QB3TWXQ1amA4MY2/HJWGpVKrBE07L94D7gfYVWvijfAzmXXhNo3d8qV27p7F7CunXfQY7jZeATapVjbR3jm85+pjVWUbIJw14pA0S9yftxvYWyzz1VH1yYbzFGc+uQGudT+XLGkZZz8823g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by CY8PR11MB7292.namprd11.prod.outlook.com (2603:10b6:930:9c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.30; Wed, 10 May
 2023 09:46:28 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::62b6:f1bf:fa7:cd21]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::62b6:f1bf:fa7:cd21%3]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 09:46:27 +0000
Message-ID: <378a8fd7-ac3e-1334-323d-34971decce3e@intel.com>
Date: Wed, 10 May 2023 11:45:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/ttm: Doc the unit of ttm_resource_manager.usage
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>
References: <20230509140341.10839-1-nirmoy.das@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230509140341.10839-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0220.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::8) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|CY8PR11MB7292:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c18a03d-5a88-493e-9e9f-08db513b6cc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rEW2p0CjyGWpaQmZHblR+Tf+iBFx86I/7GprJX5snKTLdJ5sVdPEz7Ek/SQVxX2RB90/4g6B/tcGkjD5wH/oKP8/A7wtWr/OmRmcGtQWp1bfzulss3730BJzgFoJaLmK0xT+iT30mKlf05s1jtnZEnm+dir2uJ0QI3Zgt/+itM27Bk09hLzWaQzvn0Rc8iw0QtSQF6NADNSCdJwHEGWWP7QiEkRnCvqYa6e6LTExdm3x5zyNikV//w3Zx6pTEC/qOypuw+ockA0rj189yM4HWULyNY1wHNEwXUR38Ll+EYU2Qa7Tg8szj/cpRlGw/l0LOnMA3TMw9cP+HsPX3l6mfoVzVYIxAvMxLjZUfLQM0U9fmZblA8huxy87J+mrfmh5HNx2+QfxVW+h3RQ5Af1Sb2aKkZMElO7+d2CdDxSerp/nCqNufGHtCW2RWiE8xdddw89A+uG33exghjAIoVb1OXtLyH9zTEuRviq/hI1ig0/zOpkjbBhJL16P2qdz/ExvJrjfhHNumoHm2EB4vCZp/ZGiOqVNJG7jMFxIgOcpyjGMOrodh0u+2F1klmJEZrhJMcEt0+1N+6O762jgMhr/6VlN2PQ2uDMbLHeq92yNtHubWv4VXq3IQh+vydqRaf/AJFJKOHw2BLtqdoIReXYlsw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199021)(31686004)(6636002)(66946007)(4326008)(66476007)(6486002)(66556008)(478600001)(316002)(54906003)(37006003)(36916002)(31696002)(86362001)(36756003)(53546011)(2616005)(26005)(6506007)(6666004)(66574015)(6512007)(41300700001)(8676002)(8936002)(2906002)(5660300002)(6862004)(44832011)(38100700002)(82960400001)(186003)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkF5ZDVYR0k1eGxkdDhwSnZ4SHhuSHVXQU5UcENpMm1tdWN6bmNieml3S3FQ?=
 =?utf-8?B?dkZLN2JTeGxFUXNId1hRcDNiRUc4ZEZPc3BvOW5wVnlzRjU5NzhxQXhwS29n?=
 =?utf-8?B?L3JQemNsMXNZcDN0dE1mZXRaZHp1bmx5UklwS29hU01QNUFOR3YzaTlqNEtH?=
 =?utf-8?B?cEphU3JORk9icVFhVTBRTXNRVklZRFN6VTVsMjBzSmV0TS83UExOc0h5RkM4?=
 =?utf-8?B?aERwVmZQUWdteWJmY3ZTU3hKay9vT1BDTlMzYm5RdnFTQkdzSEt6c3pRMzZG?=
 =?utf-8?B?V3lrWFh0eFJKQlI2ampGRmMxdlVuQUhaUnlwM3hrbTVyZDQxdnlSSEloNGxq?=
 =?utf-8?B?dnYzMmJ4Z2YvZXNLdTdWamwyWkpRa0dIbk5mRnRpZnhOendvVkMweDVVVy9C?=
 =?utf-8?B?ZEJSejdUUUYrZThIdTJsdXZZODN6L0NKWXFDcEdTaDhJVllTd0N0UXhNaWNa?=
 =?utf-8?B?SEJkNXp5eWw0WDBLc29Bc2srUnJFZGIzTVhIVnBMQlRId3dIbUo0Q1B2MVNy?=
 =?utf-8?B?d1NrWUY3NTRJNGZPNlZlVHhGOXBzejRwNE02T0x2b2M1UjhCZjBkR1FkZXhh?=
 =?utf-8?B?am1nK3ZnYXA0UWp0NWRsazZGK2d1OTZJVkx3RUQ4Qm1tVmhBaVlQOVpITHBB?=
 =?utf-8?B?NVVHUTcweHZOTmx3dHlHaUJQdVhDZUkzaFk3Znl0eHMxMEtQOWVLRHlweCtM?=
 =?utf-8?B?QlBpMjFLWjhUc2N3QUI2dEs5bFpjemFGQTJrRHZWc3k4cXp3SlpNMjJqTE1u?=
 =?utf-8?B?S1dRVEZvTjFSRGc4RDNjMVZXU0pVcForZDRvVjIrQkZxaWN2MUpvUGxiQnZC?=
 =?utf-8?B?WGZlbnl5NGlkVGxVOEJ6MlRUT0lQbnM1K3ZXZ1lVd0RFTERUaHFndmFrbENG?=
 =?utf-8?B?Z2JRV2plTlB4Vm9jcEoxRDN6bHlZT3RKMHRkU0VRTVpmd3E3M01wYWhUWkMv?=
 =?utf-8?B?SGhWWmdaSHo1YUc2cEJVYy80aGlTZ0RFTTZIQlkvTTZXa1RsSlo4OVZrVVlG?=
 =?utf-8?B?OGFNMURXOW05U0k3ZFJ4UEk0eVZsMi9MVThRY2lLYWFpb1c3WTA0UEN4VzZJ?=
 =?utf-8?B?SGtOVEtwd3o3aW5MeUxCdE5uREwyM2hXTWtsai9CVTk2VXg0djBwV2I3dkJh?=
 =?utf-8?B?b1VYeXkxcUZpby9RRVRwTWdHMXY1L2lEVllEUDRTalhISTN0a291R1JwL1JI?=
 =?utf-8?B?QVQvcVhYSDFiOGRnWkRxL0dZNnRmZmNDMjg0TWNwS0k0UlNwZTJ5YWxVSlA4?=
 =?utf-8?B?QnJJcnFpc2NvYTBra2s1dXYvTFNWVlhja1BwTGV3Qnd3VmVEc0RZRlBSUFJU?=
 =?utf-8?B?YldzbXRkSDMyWmRPMEJaZDNnQTN2RVBSOG44eW5BN0ZpUEh1TVM2LzdxbU5F?=
 =?utf-8?B?MXVSbkxud0JlNndKSEM5WlRkR05lM3NVTWZvRllrQlVxVkl0QXZLMFd5M0h1?=
 =?utf-8?B?dVhlMkdkanBxK2VjL3djQy9TTjM0bEZJOE5zcVE0YVZCWVpTRk5mVCtaQ3Zo?=
 =?utf-8?B?OUszRXVSN0FQVDI1Q0R0UVQzWGtIemdLZnJyRFUrQ1JvckVzS2E0REpkbnlC?=
 =?utf-8?B?Tnd0aWZoMlNYcmY4NE1JeklwMU82VjNpZjRQZU1MbVVmWnliUXhhS0h5cy9t?=
 =?utf-8?B?ZFRFcUVBVzlYREJoaS9ydGdXeVVqbElMOTNBQnJBZTJtYjdnV3N2czAybWZp?=
 =?utf-8?B?VUtkdHpZRTlYVi91cHYrby9KVnZaa3JwTTRNSml3T29OWjFTSDM1MDZLOWxG?=
 =?utf-8?B?bWZwZzVJTnQrZml4SEIyRG1kOHo0dWRHdTA5Z2lrU1g0K0NCeGZVWFlFOFJy?=
 =?utf-8?B?M01pbWQ2eDJXM09OVHJwdFg1eEFVNmgzYXBSdFBCcEdOV3REUlU2VmhoUmpE?=
 =?utf-8?B?Z3lLUWcrWlRuVFpOeDBTQkhDNzNDa3ZvS21vb2J1SWpxV3BIaFBjNkpPS2k0?=
 =?utf-8?B?dStXRDdKdDMweVRQQXBXY0RPaGdibVc3R2ZOeS90MndBNEJ2UEdDZ3ZaWXBO?=
 =?utf-8?B?U3FlSkk2dXlkNkJpMVlORnZNNUtJVlAvM0pteTZKUGV6ODZ0WXBUNE5ZUVZa?=
 =?utf-8?B?VWVHUStDeDF1bk9GTC9kYWZmOGd1cTdubjZPNjROcldQQ1F5SHZIVkR2bCtG?=
 =?utf-8?B?NkcySE1Cd2ZDS3VDQXBPNGcrVktHREQ1UGxENXpIYlRCcDRDdDFBL0dTOFRr?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c18a03d-5a88-493e-9e9f-08db513b6cc9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 09:46:27.6926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kGXVngKnZDbJKjhpodXPpNxM29mlmxfOwqeHkvLyD900fGzR0/GVoqsi1VjIMLPl7mIcQA2MThMvGrLfsGHzMOlIYwsVVdtH1fGC6RipKHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7292
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Anshuman Gupta <anshuman.gupta@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

On 9.05.2023 16:03, Nirmoy Das wrote:
> Document the unit of ttm_resource_manager.usage which was
> missing before.
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   include/drm/ttm/ttm_resource.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 78a226eba953..32d6b9c91c40 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -145,6 +145,7 @@ struct ttm_resource_manager_func {
>    * @move_lock: lock for move fence
>    * @move: The fence of the last pipelined move operation.
>    * @lru: The lru list for this memory type.
> + * @usage: How much of the resources are used, in bytes.

That's a very helpful addition, thanks for the patch:

Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>

>    *
>    * This structure is used to identify and manage memory types for a device.
>    */
> @@ -170,8 +171,7 @@ struct ttm_resource_manager {
>   	struct list_head lru[TTM_MAX_BO_PRIORITY];
>   
>   	/**
> -	 * @usage: How much of the resources are used, protected by the
> -	 * bdev->lru_lock.
> +	 * Protected by the bdev->lru_lock.
>   	 */
>   	uint64_t usage;
>   };
