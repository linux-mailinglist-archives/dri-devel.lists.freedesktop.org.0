Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2670B4E6F5D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 09:23:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F0110E1A7;
	Fri, 25 Mar 2022 08:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1168610E055;
 Fri, 25 Mar 2022 08:22:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NcgdQkoXvIDjpJ8HKvNwi/RG9wlcpr1oTPWFReV55GkgP/qA12bjyYxtF2/rCuJnFfRpNjAMc0Ug+qeFOvErrKuiYbAfNORPAAtyBTEZ665x8wkhTzg6IsuveG+ltcWiKK2VtPJCgmqA/q9U9wlZLTC5wt0z5mJepT5O+8j9izgEy3ItJgFA+hnFPkFQaaTBoNpHorIP88I9SUyswSI+2F/zmH3zzJ1Uq9o7okySh2LFRaP7tgXzO+zsNOCmGnPKSPYQe+7ST4bWxtahJ540rrK3hHM9mvBG1dFNhkM1fzvEIPA9TyPxzJf/g3a0BfBuCjDeUcNee0l3VzH5ypDlrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqVBBbzFkcmN22oQbJR4trB/KFyEvHY6cGjygr7SgB0=;
 b=jFeGh+oJF0a3Fv4AhLLxz2L70j1Eur1/ALEAqXcDdw8IIO9guz1tFH1obZb8IlYVUl7WFTxFqyRoh9bQ/Zt4tw20w/YYPHvoLR2Qlk56IJonanZLf3XKzRzKDMqOIO5ZuwIRmshKgUfX1rszPLv5gT22AslAy1eapzwzWLlPpEbhkeGsI05Hu9q/WFknM7eSW3R3DakYQEmzfa55eUX5fmtLKNukP1ZotsMxKFpNgX/3m8z8q7AVrDJGw5RPk5yWAheu3qAyrC/55xhCQ9c3KfZ5kAiuqO67hACWypguNAObsp1Y7frbMxFl8yrTC+PPR9NYjAv00K5uEIeGuV3bWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqVBBbzFkcmN22oQbJR4trB/KFyEvHY6cGjygr7SgB0=;
 b=rA47l1J1nv81e/S05XXM5KeSvbuhC0O5V26KxmGT5YSywEHvsnNRH01KHcBH3yeko0U/EhRzgiSucbs7/rlGfgaYzG4W5pBk+ZHitFZwIHPitoFfphgL8mvtHWqCnFVSIW6bVwrO+lU91WP4eqaNJFfvWSsq7wzi5NV3Rfxq1mk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB5664.namprd12.prod.outlook.com (2603:10b6:a03:42b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Fri, 25 Mar
 2022 08:22:52 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5102.017; Fri, 25 Mar 2022
 08:22:52 +0000
Message-ID: <50f4c9aa-77d1-fa8a-82c2-64bb8cd91b52@amd.com>
Date: Fri, 25 Mar 2022 09:22:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/amd: Re-classify some log messages in commit path
Content-Language: en-US
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220325000622.1594343-1-sean@poorly.run>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220325000622.1594343-1-sean@poorly.run>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR08CA0025.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8bc9e97-026e-49e6-dd6e-08da0e38a795
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5664:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR12MB566460987978C5F96E68219D831A9@SJ0PR12MB5664.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /esNjqHjxXWB19AE/s3DzJOAlUmiLnE380MEG/18LC8tre73SrsUMbXlCIA+yfaCHQhZ5ANqmBvvkCGsHlTEnD05XK16cslzYnvJrailV6BBbJdMhGru8wWJwNfluF4ur5ya1LSFB9rPxN2O2LdlEP3lpfFy0lVjeWLofu6+87MquAOzdMIrzEy4FpWJeqBnqYVeePyZEsgEXbh0bgwoplBsBLG/umnuiCrwywWI/IS09tHALU5grPc3EonMCwW3Cxy+hOgswpafKQglVMLPBaSDo440W2U2m6cwZK1xEStsjm2oVdU/zKt8ghnFut8tfY2jIp6BJ/cFdW9lXby7prrj9Ruhc4ifVbJ/GKLIyBfmYG/Jsbq/NTI9CSGDXCI1f17iY3RrxkjWyak3U5XxqtZAGQ5MJ+dlyR9L8KribfCrYXyzHcwXJjiOPrEynjagElpNrhbgJ8t8/Tgk2+c2RzHXS7vAFuoiwiADQQNogrx8Dw2y7IBWYiMEdhIcYwTQKz4oqaIyQqEtdkDoYKHr6y6za4bnpUumUrwg7Ik3mx6Th+OZ8fRWM/bOZPc5ny+vuv9HVcUnKeJbYKDdiy4jVAHgF/Ga8d35pj2h/8TEAsdQtzNPhc5RVTVVjmmEM2hnhyNzq3t6r16y7NvV33Zf+QYlQ0QMJGv2n2kWAoAb6v7hRrkHV7ZNiWysPz5tYYdR3Qc6+LjqA+ZLyTVowjfOcQS767+MdL82vGoqGK9SRRodMFxR0oZO0kdSt3CnI7Yu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(31686004)(8676002)(66946007)(5660300002)(316002)(54906003)(36756003)(83380400001)(2616005)(15650500001)(38100700002)(6486002)(6512007)(6506007)(4326008)(66476007)(86362001)(66556008)(31696002)(26005)(186003)(6666004)(8936002)(508600001)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2RGd3VSQ0ZNa2xJR2tTa01LTFI3WFdlc0dBZWVkVDFZaUxxTmg4MXVoQThX?=
 =?utf-8?B?NGZRRGU2d2VsbzZvU3JnSmhiMnZNM0xDcStHOFQ5NEJGMjFPQmw5ak1yWExH?=
 =?utf-8?B?djIzZCtyN1Fhck1KM0trU1FzL2phaGhpYlM4eUg4RTNBOXVuZHpnR09PUVRQ?=
 =?utf-8?B?cDFCbEthRXV3M08rM084R2xzUjVuV3lNQWUwTVFoNUd4UEllcjA5NUhQMHJ3?=
 =?utf-8?B?UHVDeWx2VlFFOWRnQjkzMG10U3hDQnhHK1dHZllhRURyLzdWb0RFUXFBV0Zj?=
 =?utf-8?B?NDlVL3UvQmFHUTBSQjVaYTZXdjVLdEsyVWpsT2NmWGpHSXNyb0Y2UjZTVlNh?=
 =?utf-8?B?MUFFRXdCeUhKS1lETzl3NXA4S3l3K2RZVExaL2RaTmJ0OGVBN2U1VFFmTU1I?=
 =?utf-8?B?NnUxZ0FtcjByUGRRbmhyMzRTbGRibnJjVURYSEhveDNXMzlOeFFPbmRPWkdG?=
 =?utf-8?B?T0IzZUt0Q1NuaHFPWTY0V2xhTHN3UkhOa05CVjBPWGQvMzV5YWZOL1ZQWUd3?=
 =?utf-8?B?RHQ5NHBxTjJhbUQrMW1qK2NCVTZLZTBJTW5CV0x1UytNUUVTOTlqZVFZTHhz?=
 =?utf-8?B?cVVPTFBUQ1FKSzFzWTdGVlp1VFN0SU1uZWZoQWQ0eFp2MzQvWjZTVnFBblNi?=
 =?utf-8?B?SzZmSitza1o3emIxbUFaNnlkZ09xZmJ3T3lMalBYUHBGM29BZlEwbmYzNXFW?=
 =?utf-8?B?ZHFQZllhSDVIdlQ4aUYrM2dWWmxreFlMN3N4SlppZldYUC9GRW5RZnVnRHIx?=
 =?utf-8?B?VFVGdCtLOXBYOW55Szh5QURsWFZjMmNnSjFDbE04c0FqZElGbXkzNTVkZll1?=
 =?utf-8?B?dFdOL0txYnJkY3RsTmpHNmRLTEg1YlkvWFN5R2N6NytzNHlpbnVyeCt4LzRM?=
 =?utf-8?B?Zmdyb2hvSGlWQXRXTnJmQTlpcUJLYkwrUFBTSWhLMTh5SjhPU3ZJNUV6S0Vx?=
 =?utf-8?B?L0JJUmR0NkVZVExHdWZOSGM5WjNzaTNxeUU1bUZzeGdoQWFsNDdJdTdJTzlm?=
 =?utf-8?B?Y2FSM2RmY2lEUUxHVWZldjJ1cUY5QWVXeXA5MDVuSjZOQkhEUzBhcTNmS2pK?=
 =?utf-8?B?bi9KRmtuYngzZGdJSnR0cjJPRlJqbklUajQ5ZXBCTmttVVpHdlBCWTJBV2Ez?=
 =?utf-8?B?QTdjWUR6RDNzWTdYWitoRk9IWUsrV1E0dXlJN09DcUc2ckNhb0FXREQ2SmNQ?=
 =?utf-8?B?V3Njb1ozV1N0WFVnWjRDczlXNDR2SVVMZElKUlJ5RFhjaW53RDZPczBpclN0?=
 =?utf-8?B?cGxJdmsxdlBabmdEUWhJOVhlYmNISkhZMlJrQWcwMy9SY1liWkdtdG8ra2JK?=
 =?utf-8?B?MmZHaUlsMmdUU25pVG5Lc3ZIU2U5UnZDeEFmNXBjaHZTdHA5a3lidVZxUmVZ?=
 =?utf-8?B?VFBnblM0YkQxRS9Dbi95Rk5SeUwyQlpJUnIxeS93VjJyU2hFNmgwTmFZNWVn?=
 =?utf-8?B?a1lJbWx4TjcyVXRSMHhVbUNwbXVyaGFJMjhyTUVtVStXOHN6T1hrNUd5UzR4?=
 =?utf-8?B?U2twOXpMeG5nTGdmNUk0L2xTdFp2TldvckhGZFR0K3pqMG9IcktIU3pibzVP?=
 =?utf-8?B?dHRtQUJ2SnRhKzAxYUlQR1lZOEx2N2JRZE9qeEE5RUhRdDhwL2xzeFA1NGF0?=
 =?utf-8?B?S1I2c0l4bkIxLzY4SmpDU0R4cTVvWFFodjBEeFlkaEE1ZFhEcHY5RnQ0SUdB?=
 =?utf-8?B?UTFKVzVTbUw5YTlFWU1lZ0hOL0JOeDJ6RGxQcEw0aFdGSGlMcXYyTTNYbWtN?=
 =?utf-8?B?NUdMWGFSdkI3bURtZzZGZFJaZ2dIR3lyT3A5QkRmdm5pN2YxcmdtUHUvQkNw?=
 =?utf-8?B?MGlOWi9CTE4ydWdGTjVYYlovT0x2Ynkzd2d1ZHJ1RDBROG50bTZ5b1lJRE42?=
 =?utf-8?B?d20xalMzMUI1S05uM3lnMkdYNXJ6a201NTRmM29QWDNDUHNraTQ5Z1NEM21P?=
 =?utf-8?Q?16MrTUD3MBEGFUaxrG382zaC7Ya6YQ50?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8bc9e97-026e-49e6-dd6e-08da0e38a795
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 08:22:52.0951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ROngu7EbXX1oCLc9Xphdur0Y2xNrH5DnCdmH13xD6bKU83JNKb8PKd2wWbHajcnx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5664
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Sean Paul <seanpaul@chromium.org>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.03.22 um 01:06 schrieb Sean Paul:
> From: Sean Paul <seanpaul@chromium.org>
>
> ATOMIC and DRIVER log categories do not typically contain per-frame log
> messages. This patch re-classifies some messages in amd to chattier
> categories to keep ATOMIC/DRIVER quiet.
>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>

Please use drm/amdgpu for the subject line in the future, apart from 
that looks like a really clean patch to me.

Feel free to add an Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c       | 5 +++--
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 8 ++++----
>   2 files changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index fae5c1debfad..1fcbab2fd3c3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -113,8 +113,9 @@ static void amdgpu_display_flip_work_func(struct work_struct *__work)
>   	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
>   
>   
> -	DRM_DEBUG_DRIVER("crtc:%d[%p], pflip_stat:AMDGPU_FLIP_SUBMITTED, work: %p,\n",
> -					 amdgpu_crtc->crtc_id, amdgpu_crtc, work);
> +	drm_dbg_vbl(adev_to_drm(adev),
> +		    "crtc:%d[%p], pflip_stat:AMDGPU_FLIP_SUBMITTED, work: %p,\n",
> +		    amdgpu_crtc->crtc_id, amdgpu_crtc, work);
>   
>   }
>   
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index b30656959fd8..45d130f86114 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -9248,7 +9248,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>   			&bundle->flip_addrs[planes_count].address,
>   			afb->tmz_surface, false);
>   
> -		DRM_DEBUG_ATOMIC("plane: id=%d dcc_en=%d\n",
> +		drm_dbg_state(state->dev, "plane: id=%d dcc_en=%d\n",
>   				 new_plane_state->plane->index,
>   				 bundle->plane_infos[planes_count].dcc.enable);
>   
> @@ -9282,7 +9282,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>   				dc_plane,
>   				bundle->flip_addrs[planes_count].flip_timestamp_in_us);
>   
> -		DRM_DEBUG_ATOMIC("%s Flipping to hi: 0x%x, low: 0x%x\n",
> +		drm_dbg_state(state->dev, "%s Flipping to hi: 0x%x, low: 0x%x\n",
>   				 __func__,
>   				 bundle->flip_addrs[planes_count].address.grph.addr.high_part,
>   				 bundle->flip_addrs[planes_count].address.grph.addr.low_part);
> @@ -9624,7 +9624,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
>   		dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
>   		dm_old_crtc_state = to_dm_crtc_state(old_crtc_state);
>   
> -		DRM_DEBUG_ATOMIC(
> +		drm_dbg_state(state->dev,
>   			"amdgpu_crtc id:%d crtc_state_flags: enable:%d, active:%d, "
>   			"planes_changed:%d, mode_changed:%d,active_changed:%d,"
>   			"connectors_changed:%d\n",
> @@ -10328,7 +10328,7 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
>   	if (!drm_atomic_crtc_needs_modeset(new_crtc_state))
>   		goto skip_modeset;
>   
> -	DRM_DEBUG_ATOMIC(
> +	drm_dbg_state(state->dev,
>   		"amdgpu_crtc id:%d crtc_state_flags: enable:%d, active:%d, "
>   		"planes_changed:%d, mode_changed:%d,active_changed:%d,"
>   		"connectors_changed:%d\n",

