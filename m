Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E89CE6DC800
	for <lists+dri-devel@lfdr.de>; Mon, 10 Apr 2023 16:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BED10E3A4;
	Mon, 10 Apr 2023 14:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70AC810E39A;
 Mon, 10 Apr 2023 14:46:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4WINfzecwP54fF4RLBtZhFzXJIVcf5JRpOgzj2cLys0tbayw1bJp57EaEEH8OmQC62nWVb14YwGRM6DcozI2TSxnFYsda2ZYNiQv/DAvfabHbLgOOPyDj5hkk7NAhHveHZjQA4s8dPd8Oege5ajq09e4PnvFHzYTtX8EwxA4kyMXzmWXcXqY+i0GEkZcJUeExppHnctZxPEum6lfwG20bKslFl/0f9ClKuN1iOmQ+rIVJY0MD0EFkmtWBVCTpiXZBZTWjAezVwnQND8qJAdb3p6n/DEafKbp8OXiak+67ToTmxoSZwNyYFRPvOudWDFcE8wi3KqoGIBdURxNLXWuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1+j4iSJkvXRZYQCs/Lc6/hx5wP9D/Wau3seB+PheBU=;
 b=VuH6g3n4iRYzcJBx3SdpiFiSQfAf0YXHcc1eeJCYLwRjZSQ0aAZtFt8ZYfbharYNHC2eP3X6tfpm9sujk/qlJBLuddLnQF6ZuNOrx+MUNS9yDGym1XsygWLAcX/imtuDZBNOMB+7/dn3Wjjogcg7yg8YPtFmi+9XKu3adDDxOH/TnTYap75J+ToakDHVcJOGsBRpM0aTy0PinsK66aWUSLPn8lBTo3I8IJjmGD++f/vJG+xaZBBbV1HrDGmZF2xYYZCEs4ieaUS3M5Jswfdn75mCICgbgD4OTkJEjElb+fwlSYRPTXH6kq3KAt+qH+6h/DzyR+y5bwAqybfbJcG+jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1+j4iSJkvXRZYQCs/Lc6/hx5wP9D/Wau3seB+PheBU=;
 b=H48r8XIX7cob2jno+NKsclenRKUNnSugYfRhQvrL2rvt5GV86B3/7IFYo0r9FA5d6lMrYjPWuYkyAr6EEnD5BxanxKYdVCwT8EoXj3z85VwwOONUFKiebqiGASbyR0s2MbchsPVvrYPgBl6b9254Dm1fAYVffNJWbiNv+N27BcQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 DM4PR12MB5771.namprd12.prod.outlook.com (2603:10b6:8:62::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.33; Mon, 10 Apr 2023 14:46:25 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%9]) with mapi id 15.20.6277.038; Mon, 10 Apr 2023
 14:46:24 +0000
Message-ID: <c4fbb44b-ed31-96b2-2342-b654299f72dc@amd.com>
Date: Mon, 10 Apr 2023 10:47:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] drm/amd/display: remove unused matching_stream_ptrs
 variable
To: Tom Rix <trix@redhat.com>, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, nathan@kernel.org, ndesaulniers@google.com,
 Jun.Lei@amd.com, wenjing.liu@amd.com, Jimmy.Kizito@amd.com,
 Cruise.Hung@amd.com
References: <20230325134503.1335510-1-trix@redhat.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230325134503.1335510-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0478.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d6::9) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|DM4PR12MB5771:EE_
X-MS-Office365-Filtering-Correlation-Id: b40c687c-927c-4f80-8e7a-08db39d25b9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XcPTlPJapfmg80n7hWthQyxfC9YiPNyL2r5FRn7yI2yqf3ziTGwszR5DBolxWzVZ7pEoHRZV4UeMkJFwRyoFHBoBXXIQThAC56S/DivGb2TN8UrqsT75uDHDhKksSOkIK9460Pyub1kDY1vkEvnr2/hayXRuNuqZiZhrf5vYlIVIsoml82nuHb4EHY80jva7rEjNHV370FxifXZhmKM3zVz4UjnQAN0kd7XT6ooW0ka5BlRYRLbFRyhz0DBELXvENXcZIdjuC4vL3rJSmUx/HN/tX0w6GLdniPZmSG9B2xT1k7M/SIKzOjSnQYfV3oPOer6+8GZfiTKLQdIOhIvt6EVm6vQFnQLUoMFvOIh2K5aq3EDLbjDh8XsK1HUkTO+Y6EuvWst7lXKcdPE4egeEkzlBIEwVf8Qk7Mf8KNbWB7U2Eq0M74kXlf1JihlY7GFAYm2mob0j+MAmgpFbkp7NjZYSK8sAF9KW6HtqETL8LbX2EkUBjcac02qeytWB7RiFiefGXHwQdLH8VmWWNbiZ3a+T+R50nHmmjLZMkHckuXaN6ZbcPrY/AQ9beEwdsfyq5a6g70eSwd7C2EUwG+Uvm3BqVB8Qtdo9XEHn3XkZ/ewcKvd/orP5vEWRmPC7wN6SS9gwldbNvTj8rWVWqkNWOhER5ScAElfq1vL/oVoiUxY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(451199021)(36756003)(2906002)(6512007)(6486002)(316002)(6636002)(6506007)(53546011)(26005)(2616005)(478600001)(31686004)(66946007)(186003)(86362001)(8676002)(66476007)(66556008)(6666004)(83380400001)(31696002)(4326008)(921005)(41300700001)(44832011)(5660300002)(38100700002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlVRd2YwV0U5WkxxZ1BIZHVvNUZxTVM2U3FLV1c5RDBkNWkwWG1XblJRTDRm?=
 =?utf-8?B?eHc5MllDNGJzcURpblRJbXFJZ3FzQUtaMVIwYmVhQWV2emtoalBGUGZUZnBo?=
 =?utf-8?B?RGZaVS9UN0ROZXl3RVArcEN1VjJlWFFNODljdWhkUUl1V3daS29ycERvd2RG?=
 =?utf-8?B?NDlyeHlkSThGZ3BZVVVpbTgySDRoS1dBaXlYck9RMlluZjdINU40MjZiSVZw?=
 =?utf-8?B?SEx2TWFuRVU3ekpMT09uSDBHMmk1bkJ6UlpmTDE3NDBxSUExWFlENld5ZzA0?=
 =?utf-8?B?MUh6QWw1QXN3TW5obEV4QW5FRGhwVUF1ZStLU3dydk9pMHdKLzZtM3YrWVoy?=
 =?utf-8?B?d3VRalJ2MG5rbFlCWU1XcUE5bEtrc2J5aWUyemtFbTRnSFJoZE9ocG03R1Fi?=
 =?utf-8?B?YllnNGNiMWYvNkZvSHpSNEE2RFM4R21GRi9LVzU3Qk8yL0xxUjRNN2ZZMExC?=
 =?utf-8?B?UWpGZmNKdkwzTklDV1RvOFRFUG03dW85Z2VPSHlrQUhVNEJPajEva3hDNnpQ?=
 =?utf-8?B?Q2N2bklLY2RBYTJObHl5N2dhZXhzTUdGdGU2UGxNMmpQRkpVYmZ6MW9hSHI5?=
 =?utf-8?B?Q2tadTh3ZzJvakkwNFdudFZFcTlEejM4eTB5YWI1YXhYYzNkUm5JTkpSc3R0?=
 =?utf-8?B?ZmVnYU1hT1ZtZ0ZwVmRmUmtKUUhVNVlnN3JXTG9MNXVEdHZpOFU2RG11OTVs?=
 =?utf-8?B?elB6bENnejRpRHJtQmNpdmQyQVRXelA3ZWJjaFlrc1BNVDBTSHcvK1hwTm9j?=
 =?utf-8?B?ZElmaE82aGRYWnRMQUkrNHNkcmcwaUc2TDRwdGxhaCtHRk1kT1RCZ2FFL0Zm?=
 =?utf-8?B?Uy9oWURNTjFHdW0zekp2YkFFTFdESVdkeis0b0V6Um5MMThkeVRab1o1SWUy?=
 =?utf-8?B?RFFaaE5NRzQyQUFTNGUzTTJINWtyNHB3V0dVT2hRMTZYTXRVSEE1M01DYkxj?=
 =?utf-8?B?R01Qb0YwSTg0S0xxajVSUERydXhYSmRxS0R3ditFa3c3SDR2Z1NOemRlWW9V?=
 =?utf-8?B?TjVMU2pNRVFqTjVBTTlOMStaRWZRUk5QZ2trU3RhUE1ZNGhzWFFkdWhpZDVr?=
 =?utf-8?B?d0NZZmhMdEFYejVpVEpLZitwL3pxbFVWY240aEtxSWs3QVBidXVmbHhxL0lR?=
 =?utf-8?B?V3VBVDJvT1Y2M25xU0xQUm9yWlR1YVNmYktiZldTQ3pxYVRZK2ErQldqVFVq?=
 =?utf-8?B?MkZlc28yR1FNS043ZTVGeERQT2FHbllSeTJVVnZuRmZiTzR0a1QxRFFHQzMz?=
 =?utf-8?B?MGRqWENtYllLdFlnZUY3N3RhbjZSbGZLbUZlYkZvUHFiLzVwelFYVkhmQWlM?=
 =?utf-8?B?bEZEenNWMHVYTTdOeW9VM2tzeUFMdWMxNG1TYy9BSlh5RStiUnRxM2dNbTV6?=
 =?utf-8?B?MlJYcC9mdENuL3Z6M1ZDS0QxcGh5bXAwYnEvY2x0TzRxbUJ3Q3NYWDVZN1pr?=
 =?utf-8?B?NEQwSVpuR3BTMDAzNlVWUWlPb1R3Z1lOKzBrYS80MTBNd0VOanJvcDBvWldt?=
 =?utf-8?B?YW1uN1IwMmNacmJGZFpNSTJlVHl3MnNXbEp0U0JuZTNxckN3NVRYZzk1Q2VI?=
 =?utf-8?B?R2xqc1NBMHhKMlByRVhiaWxIcE9DbzZHelpld3l3U1NnaWlqQ1R6aGUxOXp3?=
 =?utf-8?B?cTBPVUY4OFY0YmlCTnBWVCtlSXVKV3JpN1dwMnBJbjFvM3JnbkZPZTAvejRX?=
 =?utf-8?B?emlTMkpsbnFMUUdyUnRvd0NhVTNCaXVPbmVMbXBZdUlJZUVMNEVodVV3VVhn?=
 =?utf-8?B?ZWExbGdhRUh3WHBEKzlSVlVXd3NZNVM4bTBPNC9xLzcyamoxeWxPQUVzM0tm?=
 =?utf-8?B?Q2x6eU4vai9OVlBxT0kvRlk1YUljdkh6azRjd0pna2x0OS9hd1ZWQWR2RkxR?=
 =?utf-8?B?VmdDbVMyTUlvY1dJRW5HR0VxNk14UTNWRUYrZUwzNXduSWJtSzJRWk01aHlM?=
 =?utf-8?B?M0I0NVpiQTBMWGtBN3o0eUE5dmRxdWp3Ry8wYzZWdGF5VW5la1c4amV6enNx?=
 =?utf-8?B?Q205SEJ6VU4vdzdOaGM5MzliU3Aza3c4RmQ4cUZRUjNVejF0M0RLeEtVL2VB?=
 =?utf-8?B?QWN1dnUzK1NKRUNmV0JFSmFxdFNkVCtkTVRGYkZvbmNkaE9QZEFjKzJJRDJQ?=
 =?utf-8?Q?WSAdqpvoG4PsK5UPaxWY+SVE4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b40c687c-927c-4f80-8e7a-08db39d25b9d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2023 14:46:24.8760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mpKUB3+KvIo5ohLBroyRwydNfWZ6RCIgHRxFFwKTRlcQmztky9WRn5cXZGosemYLlWfQalVsYIjaAgqgyo2VOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5771
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
Cc: llvm@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/25/23 09:45, Tom Rix wrote:
> clang with W=1 reports
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_enc_cfg.c:625:6: error:
>    variable 'matching_stream_ptrs' set but not used [-Werror,-Wunused-but-set-variable]
>          int matching_stream_ptrs = 0;
>              ^
> This variable is not used so remove it.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Applied, thanks!

> ---
>   drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
> index 41198c729d90..30c0644d4418 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
> @@ -622,7 +622,6 @@ bool link_enc_cfg_validate(struct dc *dc, struct dc_state *state)
>   	int i, j;
>   	uint8_t valid_count = 0;
>   	uint8_t dig_stream_count = 0;
> -	int matching_stream_ptrs = 0;
>   	int eng_ids_per_ep_id[MAX_PIPES] = {0};
>   	int ep_ids_per_eng_id[MAX_PIPES] = {0};
>   	int valid_bitmap = 0;
> @@ -645,9 +644,7 @@ bool link_enc_cfg_validate(struct dc *dc, struct dc_state *state)
>   		struct link_enc_assignment assignment = state->res_ctx.link_enc_cfg_ctx.link_enc_assignments[i];
>   
>   		if (assignment.valid) {
> -			if (assignment.stream == state->streams[i])
> -				matching_stream_ptrs++;
> -			else
> +			if (assignment.stream != state->streams[i])
>   				valid_stream_ptrs = false;
>   		}
>   	}
-- 
Hamza

