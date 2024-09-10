Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FE0972C68
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 10:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1DE710E5C1;
	Tue, 10 Sep 2024 08:42:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IHXyADtO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2068.outbound.protection.outlook.com [40.107.236.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD8A10E09E;
 Tue, 10 Sep 2024 08:42:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SRTkwm5xjKkKGCnUI81pkUSbsi8IvHp2debQWLllThAS/XZ5aLAESVO6kRUZq0+8+F+dE5K4IDDUYqMZy/y92OchcYSiCcYxWv+h5YBRSS/mhhaC62XuNHPAK56f5zw2Ne4bjTItGjua5TvKXoJzN+7uRdnytOKQTX8rGuZbUVmBnoTh/Tah23StV6gOwmxaC+Thm2RWEO1VKHSyzSXo/lhq4xmCAWUGWLoM41XiM9RwEaxl2CEHOq0KACGyUnaCTJJTcEZ4wTvYogoCcGEzNKgTC+9mxLvxlU/S34XecE5CALpu5LN9qPO+pwPi6uYS2cB0qqxpBa73iUTsipIM+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dbxUz8ZAyJHLFMSIZso08oA3XbognT2ASHgwX0fvgBA=;
 b=fiLprpeRpk1GtMIoyKYuquqAqYhEMtXVP50De2l/RNbDFDFB+u3J8No9cskgEEMb7Q7fMqpzMIFe77BOx+eqpFzZ8eLbU0GKoAOVH7Ixc8SGD1f+G4ySbTkRsIztablCbRHjWGDAitOeB/O5ghrMb+Q25AcykJNT5oF5EkkvJUy1tewbsyrPNbsCbuvIBTPA1C9NJkugrHNys56+XI4kjFmtfT9z9VYWBDoTGSuAiqjdG/CBIug65P9/CIExw/axRbvD+Qig7Shra1yJZl6Y1XYsZrWld5Yp2fJWGV48Gx3paSydSuPWX7/AS04FwkLKFGOTQ0FHg5cUlgk5BVgDyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbxUz8ZAyJHLFMSIZso08oA3XbognT2ASHgwX0fvgBA=;
 b=IHXyADtOOwtTt4MVXQby09Jx7IH/ZwdpI/7h8IFXPxj8XF4k0bbvQaAtrkz5Don+k0IJpoF75bIaIy4GZn1D7TkSHTaZFOWh6lxlmxDp0LqlBSK1FYzIiMRm/Q/WEO8lYTIUSMCbxQgHuPXFd+e7Q7iTwEfQmY7DQtEVqRisNsY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB7641.namprd12.prod.outlook.com (2603:10b6:610:150::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 08:42:21 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 08:42:20 +0000
Message-ID: <9db0b19c-0ee2-43fc-a5eb-bdc47c8ed44f@amd.com>
Date: Tue, 10 Sep 2024 10:42:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] drm/sched: Re-order struct drm_sched_rq members for
 clarity
To: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
References: <20240909171937.51550-1-tursulin@igalia.com>
 <20240909171937.51550-7-tursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240909171937.51550-7-tursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB7641:EE_
X-MS-Office365-Filtering-Correlation-Id: a8e8845b-dad0-4ffd-0d00-08dcd1747c0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dklsNnM1eWNYTFgwYlhUdXlwbHhuTk1xVS9GNDZYd3hONkpzWVJ1M3N1L1lS?=
 =?utf-8?B?OVJSMFpWa2JISnZsdi8va24vTGtMbmtZL0JGUTA3OFhVVUllNnR6NE9Pai85?=
 =?utf-8?B?N2pKWG1XYVlnNVJGNjN6TmRyREhQa2s1RHpvOE5jTWtyNHgybm1MbCtPbTRz?=
 =?utf-8?B?ZDV6ZDZqRjJVZXBUL3diTGN6ZTZ1UFdwNnhPNlhBTUhKMS9mL1JkdnlwY3JI?=
 =?utf-8?B?K0JPWmI0OFYvVG56SGZ0cmVYTmd0Zm56RHVOSmJRZURZSWd2dUQ1UTZzayt3?=
 =?utf-8?B?b0VtVWRPQWxnN01NYkdGM3J5UnQ3YUNiNDNNTHoxYVVRWFYrMS8wcDdDRCtL?=
 =?utf-8?B?NHNjK3JkNUZUd1IvMkJjclBTUVRZNm9RSHVha0pzZGNmcWYySUdDZE1qbWVt?=
 =?utf-8?B?dFlsaUwyRTN0dHhQdTdYZHJQZ1hjaGorZHlvNmkrRkU2UE02Y1U5K0paRmtv?=
 =?utf-8?B?ekZSRU1NanFlOFFLUXBjK0VteGRHT3FlQXlaREg3Ti9rYWhEZUpkSDBPUXlw?=
 =?utf-8?B?WStyUXBVY2RGRkNqUkNYcGdVclpqTmh2Qm1VU1pqcHBERzRnakF4dFNaS1Zr?=
 =?utf-8?B?VER2TG9nWkZWVmFZd2xoY0FKd3lyTWZldCtEak1Dci9icVVtUnZrTVNpVWR3?=
 =?utf-8?B?bStGNEI5U2hHSlR0eWVjVkxUNEtQK3ZBWkgyaVVnV013QkRzMGlJMktCM2RP?=
 =?utf-8?B?eFpib293YkMvekdqTGFmMThxaFhUdVdGRlNKemQ5U2l0bzE0WDJ2ZEI2MHRG?=
 =?utf-8?B?cGpGVHRmT2J6YnNqNFdOM0FpZThZVW1EbVpCcEF6Sm5WaU5uN1p5RklMT3cx?=
 =?utf-8?B?anFaSmNFUzlwSTEzdGN6MWp5djFaaUNndENqbHdhMW9ScUVubVFUK0dFOTNu?=
 =?utf-8?B?TXhqeExydzUvNjRLbWpmcEJTWXZXZ3plK0ZFclN4aUdEb2NzeUJ0WGFOUVk1?=
 =?utf-8?B?QWR5c3IvWkxKRVI0eEszVThOa0dkQWJhZDN0Z0VtZHRUVHo4RVArUjMrSnRy?=
 =?utf-8?B?YmZxQVMxUUM0emI3NkN4SU81UnZkajNFMEZ1UEpQVHMrR2lDNm43a0dWenpH?=
 =?utf-8?B?aFNJMjF0OThhM1p3REphUHo0QmpmRmJ5WHNMbjN6ekZYRmtrWEZVampUb0dF?=
 =?utf-8?B?OE83a01OMFl0RGo4NkpuTFAya01NdEZqTWh3Szhqb2trQmI0ZHNhaXNJNnl3?=
 =?utf-8?B?S2tWY3ppY29qckdKVit5VUpDU25seHFSMHFmQy9mNWlZempjbTFGRWNObzZ6?=
 =?utf-8?B?d2ZDTy9NTjhxekplVkhmallkeE9uY0RrUFkxcUpBQnh6WDF1dlNMZ1prS3FI?=
 =?utf-8?B?KytkYzFUN2gwelhzRStzclJpOG5uVlRSSnRGMEltM1BhV1VPODRvVkI1Y2JK?=
 =?utf-8?B?M1FCTFhBOFZGUDhIK0lRdjdKT2JwQVNkaUVHMWRIWjE5QnFXREliU3NEUzhP?=
 =?utf-8?B?cUwzc2FhSHNRY3dSMlJKcnYvNWZtZzh4SCt4dDdRcVQ5SXdzZVFoZVkwcjI4?=
 =?utf-8?B?Y1JpSUVOeVE5UXk4UHBDUVBmcnBXTy9iQkN5ZzM4RVdGdkc5VlFDS25KMUN0?=
 =?utf-8?B?NGZmaU9OeDd2dENqRXRRSE9MdmRvRlFvVllQQjhJa1RNUTBQK1RMZlhMU1JQ?=
 =?utf-8?B?K1liYWF4K01ZVU5mKzdhdkhxTHYrcFhiYXhMT0pYQXAvVjR3UXFyRXFmUlFj?=
 =?utf-8?B?cWZuOFRmR2QzZ1pGU1BoaVBqR09zYVRNc2RyUm5VNUtNVnNoK250VXJVbGRW?=
 =?utf-8?B?WHB6VkRUYXVva0dxUTZ6d2lMRHRnQmFTYktxMU9CV0NLY25YMk9nb3NHcUZ3?=
 =?utf-8?B?ZGs2R3JDaXovcWltVUQ5QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUdjKzVjdExSYVFac1Z1QitJc3NOM3VVODhacHcxMFNuZWlxNnc1NmpoZEhI?=
 =?utf-8?B?bllUODAzY2tNUmxPazNpaTE5WStsQ0g4V0ZKWXFJWGtZRXhmSTljYjBXWERM?=
 =?utf-8?B?MGtVaUIzaHp2YnRyOWhYditXYS9yeVlRWU8zMlNhVm80UjQ5SjlqZm1IREhX?=
 =?utf-8?B?ZHd6ejUwcE9pKzE2N1NQYk1wSEx2ci9rQ1B3azg4MHBqMzAzVkVaWEhEYUNu?=
 =?utf-8?B?SjVocVcramxRbjNETmpSK3NncTd4N2pXRkJ3T3pYYXBBYnVFVkk1enpBZkdW?=
 =?utf-8?B?bHpMMEExeTVhSG9GcitGREtORVFkWVA1cFRubnpiMXM4K3hpY0pNNS80OW1N?=
 =?utf-8?B?TnRnSlRta1hrdG5mQWk3bWF4T0dtY1ZlRVBuUm1YOUVYTWZjbnpLR1BMbEtC?=
 =?utf-8?B?K3pxV09VeG0vc3lZSGcreUd6OGxiK3lNWUxSbmFyaEU0Q1VUK0h4cHBKYUxG?=
 =?utf-8?B?eG5vbmVEZ0prTlpsVDVGUitLbVBIOTNGRzVEeDgzTE41amVobjJKZWwwNkRr?=
 =?utf-8?B?dWVHRDJHRUY1amJPNlhOWUZZMkYrdytpTlQvUGRDNWlqVGdMc1BsdmgzMjl5?=
 =?utf-8?B?WE5HdXJJaW1oSkxqL0lWbjJnZHRuRTFFbkhqWnNkaVFCUGRja2k3ZEVQbmpp?=
 =?utf-8?B?cTJNY0h6cjc4U3pTZ3lpdDRsYU9kWkZENlBvOGt4eCt0TjhjV1hYUDBYTlhh?=
 =?utf-8?B?VjVBeHhIS2JMTEFQekdBME9pbS9mRjArcS9GMUc3ZnZILys3eWFnSlZxcGJS?=
 =?utf-8?B?NExrdlE1Z3A2NkFRUlhRTE1NUWY3ckhHVEdrWk1Da2RRY294V0VwQmNCVURn?=
 =?utf-8?B?VTFhQUdMOWxkNk96czZLazIvUitWRFcrOWZkZXNvc2dmbXV4eSswNWVDdGxK?=
 =?utf-8?B?VktLNFN3dEF2WC93c3RlVURqUm01WlFhbmg5ZHdOaFZMZ2QzQk1ncEN6VXBm?=
 =?utf-8?B?VjVNOENzc294WUJNdFVRWjIwbzNTUnFwaE5YZ2FkeHFkcXd1bFNYQ1pOVFRF?=
 =?utf-8?B?RWN6SlVadVBkNWtjcmo3c3U0NUk0aytmT0xHYnpCTFBVSVlrRVlrc1ExM3lL?=
 =?utf-8?B?Y1BvQlZQdlY0OGh2QU10ZG5WZDNjbjBhWWVzZE9KSGJFM09JUlBLV1JYZWpR?=
 =?utf-8?B?TDZ1blE0eEtuMERpa0JlbDNiVWpkK1JVUDMrNUgvb0NrdkRPbmdCSXhSd24y?=
 =?utf-8?B?UWdWdHlVVTdDRnJvSzgvTTlGaXBtOWhNaWRsK0xEOGFoUzNnY1g3bmRuR3Er?=
 =?utf-8?B?Q1hmU2JqMVF3bk0vNDFyUUhZN0pYZ09YaGZIaUhwd3lFc1MxamVoYUIySnBo?=
 =?utf-8?B?MUlaTnJVQ2tHMnltMFBnWEFBMnFFbmhtSHRSRk9WckxZcU5hRUFlMHptVjJa?=
 =?utf-8?B?d2lNSmtLWm1GUDdqcGdMdldITElOM1paQnBlV05RL21KN3pzKzVzNWJoVm03?=
 =?utf-8?B?L1lxTldOejl2RDgvZ21NZTQ5ZXExS1NBcUNCSGM0NlYzazRjQ0hnOUs3ajRx?=
 =?utf-8?B?MjRnYi8zVWI3K1lxYWVXeGtpQ1g0TjRNOWc2cllMV2dneGF6RFdib2xIekZ5?=
 =?utf-8?B?NlhxMjdvR3pMOGtsenh1MHdYTU1DQ1lVdFhqUUFlMEV1YU9lNXJwVmJqaGho?=
 =?utf-8?B?QWFIMXhEcXNjZ2dFcldyQjZyb0gvS3ovODhHV3Uydk9XRnFPRWRMbCsrc2NM?=
 =?utf-8?B?d0V1OFA5eDNjNXFsdWRwVXFVRkF3QjFTdWtiZDJiKzJMeCtEUHhEc1c2dUJK?=
 =?utf-8?B?bFhTeVdOd21QRWRoTllIdVBpMHlBZS94QTVpc1R1dDdUck9JRnlUT2JjcU40?=
 =?utf-8?B?cW1EYW9lb2FnT0xQcXZDTWVNZ3ZUU1RxcnFJQmlSdWN0dEl5RVJiL2ppZVEy?=
 =?utf-8?B?M0toQlhpemZDVnFURW9PQzV3QVRBakx4L0M2WmpkN0NVeitpV0dsWWJRWXQv?=
 =?utf-8?B?UXlqY2YvNGdLTXJtVUE0a0hFRktPOEsxMWh3RFRnZGhudkVmK0xHaUxjVWxm?=
 =?utf-8?B?UGtjTWhyeXZSWXE5K044eCsyV1RiYkxxdzNya1JZdzFpZGQvbUZHVzBxR0VN?=
 =?utf-8?B?Q1R5NDNXWksweXJaZlFMQ09ERnhwNTI1TitERk5FRXRiOG95Nlo3ZGZ2dC9T?=
 =?utf-8?Q?fQyk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8e8845b-dad0-4ffd-0d00-08dcd1747c0c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 08:42:20.8353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rj0SzNncvdGuqSAMTnP3DP5m1W/oCZIkunVRb8RSL7uAlXQdUdZswWeDwkbEM0vM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7641
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

Am 09.09.24 um 19:19 schrieb Tvrtko Ursulin:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> Lets re-order the members to make it clear which are protected by the lock
> and at the same time document it via kerneldoc.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> ---
>   include/drm/gpu_scheduler.h | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index a06753987d93..d4a3ba333568 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -243,10 +243,10 @@ struct drm_sched_entity {
>   /**
>    * struct drm_sched_rq - queue of entities to be scheduled.
>    *
> - * @lock: to modify the entities list.
>    * @sched: the scheduler to which this rq belongs to.
> - * @entities: list of the entities to be scheduled.
> + * @lock: protects the list, tree and current entity.
>    * @current_entity: the entity which is to be scheduled.
> + * @entities: list of the entities to be scheduled.
>    * @rb_tree_root: root of time based priory queue of entities for FIFO scheduling
>    *
>    * Run queue is a set of entities scheduling command submissions for
> @@ -254,10 +254,12 @@ struct drm_sched_entity {
>    * the next entity to emit commands from.
>    */
>   struct drm_sched_rq {
> -	spinlock_t			lock;
>   	struct drm_gpu_scheduler	*sched;
> -	struct list_head		entities;
> +
> +	spinlock_t			lock;
> +	/* Following members are protected by the @lock: */
>   	struct drm_sched_entity		*current_entity;
> +	struct list_head		entities;
>   	struct rb_root_cached		rb_tree_root;

Just suggestion for further improvement:

struct {
     struct drm_sched_entity    *last_selected;
     struct list_head                  entities;
} rr;
struct {
     struct rb_root_cached        rb_tree_root;
} fifo;

But even without that the patch is Reviewed-by: Christian König 
<christian.koenig@amd.com>

Regards,
Christian.

>   };
>   

