Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 641A6647360
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 16:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6840210E4BC;
	Thu,  8 Dec 2022 15:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4586810E4BD;
 Thu,  8 Dec 2022 15:42:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LV73cODS3+f7Pu5KQ2cmy/9+wcruRhqCGyOJBt725LVgtvSO66SDAcqWoLOhde/x+2CzZE7sIpKSraOAUx6iSCPGKrqWMbSo8vuwd+Ed6k8D6Ip0to4Euwfk7fT71ai514x/qmK2a+O+JzzKxU8kkDQsNWTFTWs19UsIb8PKji3OorkeNzEoVabsmkz1lyBArhlvTnt/EjFhxcDhe1kviwJdAJvkTPYyKZaO6HjzIQ2r8x/yrm4IedJClTJNGWGRwiwr+RR5afeJapX8u4QC9hV6PP8pABpaY5DyGeFpZHv7LcNXR6m4oINOY+j8vmrDMz4RyHB9J/MU6/Kx8lCWCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJvec/1RhqvgkYqQzf07K8OkyUMvjzQe9vb7vLB3Txc=;
 b=RQ4sfiRwEpm4P6tdHxmBtDCToFe+kVsX60H07UnvZR8SF9VoES0fv+WUFC1Osv7jSsbTJPQhlXXjkug1XAXnxy84z7G7lihVHdzR89h75wiWTAgviEjjy3wlX0xLE+qyNqGtHZo45L7UAk0tb4NjRI/lYzU6JqS3y9dpHd1gPQIYuy+CV729L1cpJjqavG6JgtZB6R8WeMZwR62sqaIREhMw5CPFfDK9m/dlPKn8J6dgevBwSdUzCRvNIbysYMgjItu6oCWleQdCWeJgZ0Yef+gu+VyMnJdCyGvTYP13tVyW0iZQxpGOebPA9gMHM8sJfuABjW/QxmDnWJVjycZr/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJvec/1RhqvgkYqQzf07K8OkyUMvjzQe9vb7vLB3Txc=;
 b=2QOkGFhYF4NT/GYzQcvXCmrxdMC7CbeBQT2L0UDUQ7dB2W94WjR7u5Tj5S19qdvnL7Xg2F3RQLlfnStUgwTCqBs8s2mm/sA9lEYj7H7pOnKW4N0mpQp2ZJsf/rhl/iGJYBJ0NlDWHextMBp8f+ZUtBaxxoQNZjSEoa86ScGvOMY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 SJ0PR12MB5405.namprd12.prod.outlook.com (2603:10b6:a03:3af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.16; Thu, 8 Dec
 2022 15:42:31 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5935:7d8d:e955:6298]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5935:7d8d:e955:6298%7]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 15:42:31 +0000
Message-ID: <5f1c3233-2b39-39a5-24d1-d0bbead4ed65@amd.com>
Date: Thu, 8 Dec 2022 10:43:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] drm/amd/display: Fix spelling mistake: "dram_clk_chanage"
 -> "dram_clk_change"
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20221208121854.2436398-1-colin.i.king@gmail.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20221208121854.2436398-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0139.namprd03.prod.outlook.com
 (2603:10b6:208:32e::24) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|SJ0PR12MB5405:EE_
X-MS-Office365-Filtering-Correlation-Id: 9208bc69-1ba5-40c3-94f9-08dad932d11c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0kfz2W4oH/klvvY8tyYc76zlL1cTtgl+jvqs7uq50aRVPev4mpaK3hivGskNoQV7PRJiGfTcDrwag316TNvStQs7FAnEwhoeFdCiRDoXPD4WGPkSzLqLk4kyz0NgobhhH7FR287Of4dlVkxPq8PUz8nqkd3Yj9X+3ooBuFr/Gm7hh7vbswfwWJ96ZyBIihfGIigiPQ94CLluW6Pb/jjUpvKXpzHVZDSLrpktjObq5e1naLegSwldWxFNkGa65+6NSzOPafz2gkJ9VNemT0yD6W/FxLBqz59xc+uCn4wsMEYLZtogBqjoeKCq0QaKsGDLxwxxKiwgG7PZA1Qd9rr9RT0Y5NsFeKlRpkjQqIWwWYGoA5iZbu4PSfoPHT5nWFJdJbvl63NsDjeB3LJJ7sOEcIG0RMmPzhoOCa6l6GdqBD7enhHcAAunoOYxH/3SCfQR6CuAKOL6B6qOH8+cUvBZz3ci3L/VH/c1iJnp3/M47zM11hqBiM9cfAn20aQItw6mPxPjS/+pM9T+D4TkGQldR8S1z7p0pCx0MJHPVxQB4aMAuvPomeIbbbwutQgZTpaWsFEZgJU0dcXfbeIGpECk7QlYyrjpjLROaAUAiT4Op9Q0NIKbCjom2NWfF7Iz5fgKTA9tfzUnQg7UBdXY630Xyq30wP0Sp/8S7DH1O4X5r98bsOtc8J+CZ1WoaDfzqwohRglGBSosSsb180RG0c6pBqGCZkL+1zfJbDXaWIT4m4bx1waleRjc7hEJnpTJYTQG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(366004)(346002)(39860400002)(396003)(451199015)(44832011)(36756003)(2906002)(86362001)(31696002)(2616005)(83380400001)(4326008)(110136005)(6666004)(478600001)(6486002)(26005)(6512007)(186003)(53546011)(6506007)(41300700001)(38100700002)(5660300002)(8936002)(30864003)(921005)(66476007)(66556008)(66946007)(8676002)(316002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blFQV2xuWkZYdkUwRmVTVWlnY2J4QVV2YVdtQTAyYmpNYkwrZzNyQ0VTSkpq?=
 =?utf-8?B?MVY3cldsbmx0SklxNEJjLzRyTjAwRStqcEdUZEZyVWVYZDlzVUxxN1VyeHl3?=
 =?utf-8?B?WVcvalFJelVtcHpVUVJyNGJFQ05GQ2lqMGhzTlVVMHlhcUg0ZngwVW8vTjlE?=
 =?utf-8?B?VHBBM0ZTTkRBNjh0N2t5UHFyMk5yMnlKRDBTMlA0ajZjdGFjZjhiVjB3dHNG?=
 =?utf-8?B?aTFoUEwwVCtoNDN6eGV2UDhUZ1dJd2VrOUNIOXEwa293aFhGamhUcW5zdVNC?=
 =?utf-8?B?QUhSdjRNcEJBbnNEdXVhMVlXWGw3a0VYZDljV1d3YXZKNHd0aHZxZVFaTG1Z?=
 =?utf-8?B?b2t3bkxqb2ZiL2FiNDZaQzVPeTgyclZUYXd3MGt0eFpMUUJuMTgvUHRhL3ZY?=
 =?utf-8?B?ZHNxUXQyaWZBTzI1TG5WQ0FpSjFSL0NQZUZaSzdON3hLYzdaRG9VMDJFUnJY?=
 =?utf-8?B?bEVYM0tKTE5OR2lxTUZqNzNwbzMvaW1YdllYbE8vR25BUjM2VlpRUzNpTVJu?=
 =?utf-8?B?NXR5TTNpNCt1Y3Z4bjNNdWJhT0xlMGV2MlNSdkErN0loVXkyblNqMDBRbmF1?=
 =?utf-8?B?KzZJWnltN21WeTl1czFTa09TUDB6dXJmS0I4Z0hBNXBQdVVjeDhCTEw3Qjls?=
 =?utf-8?B?bXpsVHlZNEdGeXFuSU9IRVp1cEJ4clFDNzNqL1Ywd1dYUTF6R1FMK2p0aHpi?=
 =?utf-8?B?UFRobE4wc2ZTSWplNnRPOVVyTGRUMWY3ZW5TZVFNMTF1WEVWRlRSTVJmMWtn?=
 =?utf-8?B?SktEUEhLU2hDK3l5dCtQZ3NnTk9DNVcyM2tHL3hBeWtnWTJCOFgyb3dnTzNq?=
 =?utf-8?B?akpYRkdIWlFIdlFEdXE1dkJBL0pmUng0MEQ4dEVKSkJQNEJHNlpCaC9Wdjlv?=
 =?utf-8?B?S3l6bnZLMG4zMUJTQlUzTUNFQWpMWFB3YnNmTmNnY2hJQkpRSTEveW5LdC9a?=
 =?utf-8?B?V0NGOUlWUFBzbFlSSlgvSWFQZnJacHU1bm81b3l3WTZteDFhT1FPY3lGemxU?=
 =?utf-8?B?K295VW15bkNtRUtLRUhuOWRiWnVybHMrQVZ2RURiOC9hQnJFWUNLREJGaGY0?=
 =?utf-8?B?T0M1RDk5WlBSWkJBYlgzN29kRDZDU0ZPOTF4Smcyc2E2ekVpNzNTTlQvT1NL?=
 =?utf-8?B?Z1UzNm9vMzdOQzR0UmMyaTNKS3ZPZTJTeVFEODBSYnBPMmY4MWt4KzU5d2Jz?=
 =?utf-8?B?TnhSSUZqeE9YOWdqVHplMUhxVEtCeHN3a0VFalR1eHV4L21ybGRXOEVrcndX?=
 =?utf-8?B?NVJpZUZFaXNvS2l2Z0l2OEd1U1YyMjB0VEo1MnRlYXpYbS9MelJqZ3lpZXYy?=
 =?utf-8?B?elFNZWltRlloVno2Y2wyaEdMemZiaER0L2FkNUpUa2tTU29SYTRTTUV1MkVO?=
 =?utf-8?B?d0JRSEtFSTdCdTMraGhGVUQyUm9wZVNhVy9QeUJnQkgzRHFVY1NEcFdmSm00?=
 =?utf-8?B?eFR5VzZuSlZjUFk4Zjd2ckszRytGSWZqdlFMNlQzOHBEclFvczZJS2gzeit3?=
 =?utf-8?B?UCtDcHJnODNBbUh0NmpLbFloME9IT05YQ1prVFBvd2VRaE1rUm5LQVB1TzlL?=
 =?utf-8?B?UzdKVHpaUkFsTDAxcWJnUHhTK3p5dHBoWmZQdUlJTml4VVo3NVRpSlBIaGQ3?=
 =?utf-8?B?MEZXSEYwVStBZFhZc2JvTzViMm8rY1J6NnhIWlo2QWR4SXBCdEJkQk1ha3Ar?=
 =?utf-8?B?T3pKMFNlbEcreHl2b043QUR5OHdqQUx2eTNtekdxT3ZHbzdsQ2dLa0VKWmxT?=
 =?utf-8?B?Z2FFZ0k4bU1CRkhEcHRYdUVIcmMyRUoxMHBnSkdFSGVQZHk1TVI0RXNkUVZq?=
 =?utf-8?B?M29GNCt2NTJUK1hmSUJaNUFLaXJTSG5YcXhkYTkyOXhsNW94OVQyaUpOV3Zn?=
 =?utf-8?B?RUR2MFJKaG1BeFBiUDUwaXZuUHMrd1NYWExIRDhVdzhpOGl1MFRneDJmdUtO?=
 =?utf-8?B?cHpiMjJzelJBeVNRcDBxTjFFY2NKOUVGRnBuY09rTHd6NzVoSmJrdk43MTRa?=
 =?utf-8?B?ZkhoSndGdUxTYWRGbGJ6VDZVRXd3T1NKOUYxNG1wZ0RqVUdhWGVENUR6aDdT?=
 =?utf-8?B?aDZnZ1ArS3JtUTBJTllobnNub0JoZkdKWE8ybm42c1h5ZEhwVUp0QXNqZW9a?=
 =?utf-8?Q?bh8ebxy28KkGoLiADPkfVVB57?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9208bc69-1ba5-40c3-94f9-08dad932d11c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 15:42:30.8280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bEyRbSJueB5UdUL3Z2eoPuBMiO9BORPHWI5TFgqtJQ1w2hbqmd2cKLfGu+8niS559VLeUY/NBMKWT6QFI4xXgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5405
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/8/22 07:18, Colin Ian King wrote:
> There is a spelling mistake in the struct field dram_clk_chanage. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied. Thanks!

> ---
>   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c       | 8 ++++----
>   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c | 2 +-
>   .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer_debug.c   | 4 ++--
>   drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.c       | 8 ++++----
>   drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubbub.c       | 8 ++++----
>   drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c       | 8 ++++----
>   drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h          | 2 +-
>   7 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c
> index 0f746bb4e500..d51f1ce02874 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c
> @@ -55,7 +55,7 @@ void hubbub1_wm_read_state(struct hubbub *hubbub,
>   		s->sr_enter = REG_READ(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_A);
>   		s->sr_exit = REG_READ(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_A);
>   	}
> -	s->dram_clk_chanage = REG_READ(DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_A);
> +	s->dram_clk_change = REG_READ(DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_A);
>   
>   	s = &wm->sets[1];
>   	s->wm_set = 1;
> @@ -65,7 +65,7 @@ void hubbub1_wm_read_state(struct hubbub *hubbub,
>   		s->sr_enter = REG_READ(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_B);
>   		s->sr_exit = REG_READ(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_B);
>   	}
> -	s->dram_clk_chanage = REG_READ(DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_B);
> +	s->dram_clk_change = REG_READ(DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_B);
>   
>   	s = &wm->sets[2];
>   	s->wm_set = 2;
> @@ -75,7 +75,7 @@ void hubbub1_wm_read_state(struct hubbub *hubbub,
>   		s->sr_enter = REG_READ(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_C);
>   		s->sr_exit = REG_READ(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_C);
>   	}
> -	s->dram_clk_chanage = REG_READ(DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_C);
> +	s->dram_clk_change = REG_READ(DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_C);
>   
>   	s = &wm->sets[3];
>   	s->wm_set = 3;
> @@ -85,7 +85,7 @@ void hubbub1_wm_read_state(struct hubbub *hubbub,
>   		s->sr_enter = REG_READ(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_D);
>   		s->sr_exit = REG_READ(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_D);
>   	}
> -	s->dram_clk_chanage = REG_READ(DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_D);
> +	s->dram_clk_change = REG_READ(DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_D);
>   }
>   
>   void hubbub1_allow_self_refresh_control(struct hubbub *hubbub, bool allow)
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> index c8ec11839b4d..fe2023f18b7d 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> @@ -159,7 +159,7 @@ static void dcn10_log_hubbub_state(struct dc *dc,
>   		DTN_INFO_MICRO_SEC(s->pte_meta_urgent);
>   		DTN_INFO_MICRO_SEC(s->sr_enter);
>   		DTN_INFO_MICRO_SEC(s->sr_exit);
> -		DTN_INFO_MICRO_SEC(s->dram_clk_chanage);
> +		DTN_INFO_MICRO_SEC(s->dram_clk_change);
>   		DTN_INFO("\n");
>   	}
>   
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer_debug.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer_debug.c
> index e8b6065fffad..a0f8e31d2adc 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer_debug.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer_debug.c
> @@ -83,7 +83,7 @@ static unsigned int dcn10_get_hubbub_state(struct dc *dc, char *pBuf, unsigned i
>   	memset(&wm, 0, sizeof(struct dcn_hubbub_wm));
>   	dc->res_pool->hubbub->funcs->wm_read_state(dc->res_pool->hubbub, &wm);
>   
> -	chars_printed = snprintf_count(pBuf, remaining_buffer, "wm_set_index,data_urgent,pte_meta_urgent,sr_enter,sr_exit,dram_clk_chanage\n");
> +	chars_printed = snprintf_count(pBuf, remaining_buffer, "wm_set_index,data_urgent,pte_meta_urgent,sr_enter,sr_exit,dram_clk_change\n");
>   	remaining_buffer -= chars_printed;
>   	pBuf += chars_printed;
>   
> @@ -98,7 +98,7 @@ static unsigned int dcn10_get_hubbub_state(struct dc *dc, char *pBuf, unsigned i
>   			(s->pte_meta_urgent * frac) / ref_clk_mhz / frac, (s->pte_meta_urgent * frac) / ref_clk_mhz % frac,
>   			(s->sr_enter * frac) / ref_clk_mhz / frac, (s->sr_enter * frac) / ref_clk_mhz % frac,
>   			(s->sr_exit * frac) / ref_clk_mhz / frac, (s->sr_exit * frac) / ref_clk_mhz % frac,
> -			(s->dram_clk_chanage * frac) / ref_clk_mhz / frac, (s->dram_clk_chanage * frac) / ref_clk_mhz % frac);
> +			(s->dram_clk_change * frac) / ref_clk_mhz / frac, (s->dram_clk_change * frac) / ref_clk_mhz % frac);
>   		remaining_buffer -= chars_printed;
>   		pBuf += chars_printed;
>   	}
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.c
> index aacb1fb5c73e..24bd93219936 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.c
> @@ -500,7 +500,7 @@ void hubbub2_wm_read_state(struct hubbub *hubbub,
>   		s->sr_enter = REG_READ(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_A);
>   		s->sr_exit = REG_READ(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_A);
>   	}
> -	s->dram_clk_chanage = REG_READ(DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_A);
> +	s->dram_clk_change = REG_READ(DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_A);
>   
>   	s = &wm->sets[1];
>   	s->wm_set = 1;
> @@ -511,7 +511,7 @@ void hubbub2_wm_read_state(struct hubbub *hubbub,
>   		s->sr_enter = REG_READ(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_B);
>   		s->sr_exit = REG_READ(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_B);
>   	}
> -	s->dram_clk_chanage = REG_READ(DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_B);
> +	s->dram_clk_change = REG_READ(DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_B);
>   
>   	s = &wm->sets[2];
>   	s->wm_set = 2;
> @@ -522,7 +522,7 @@ void hubbub2_wm_read_state(struct hubbub *hubbub,
>   		s->sr_enter = REG_READ(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_C);
>   		s->sr_exit = REG_READ(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_C);
>   	}
> -	s->dram_clk_chanage = REG_READ(DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_C);
> +	s->dram_clk_change = REG_READ(DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_C);
>   
>   	s = &wm->sets[3];
>   	s->wm_set = 3;
> @@ -533,7 +533,7 @@ void hubbub2_wm_read_state(struct hubbub *hubbub,
>   		s->sr_enter = REG_READ(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_D);
>   		s->sr_exit = REG_READ(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_D);
>   	}
> -	s->dram_clk_chanage = REG_READ(DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_D);
> +	s->dram_clk_change = REG_READ(DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_D);
>   }
>   
>   void hubbub2_get_dchub_ref_freq(struct hubbub *hubbub,
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubbub.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubbub.c
> index c5e200d09038..aeb0e0d9b70a 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubbub.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubbub.c
> @@ -635,7 +635,7 @@ void hubbub21_wm_read_state(struct hubbub *hubbub,
>   			DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_A, &s->sr_exit);
>   
>   	REG_GET(DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_A,
> -			 DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_A, &s->dram_clk_chanage);
> +			 DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_A, &s->dram_clk_change);
>   
>   	s = &wm->sets[1];
>   	s->wm_set = 1;
> @@ -649,7 +649,7 @@ void hubbub21_wm_read_state(struct hubbub *hubbub,
>   			DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_B, &s->sr_exit);
>   
>   	REG_GET(DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_B,
> -			DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_B, &s->dram_clk_chanage);
> +			DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_B, &s->dram_clk_change);
>   
>   	s = &wm->sets[2];
>   	s->wm_set = 2;
> @@ -663,7 +663,7 @@ void hubbub21_wm_read_state(struct hubbub *hubbub,
>   			DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_C, &s->sr_exit);
>   
>   	REG_GET(DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_C,
> -			DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_C, &s->dram_clk_chanage);
> +			DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_C, &s->dram_clk_change);
>   
>   	s = &wm->sets[3];
>   	s->wm_set = 3;
> @@ -677,7 +677,7 @@ void hubbub21_wm_read_state(struct hubbub *hubbub,
>   			DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_D, &s->sr_exit);
>   
>   	REG_GET(DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_D,
> -			DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_D, &s->dram_clk_chanage);
> +			DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_D, &s->dram_clk_change);
>   }
>   
>   static void hubbub21_apply_DEDCN21_147_wa(struct hubbub *hubbub)
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c
> index 5947c2cb0f30..9501403a48a9 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c
> @@ -865,7 +865,7 @@ static void hubbub32_wm_read_state(struct hubbub *hubbub,
>   			DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_A, &s->sr_exit);
>   
>   	REG_GET(DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_A,
> -			 DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_A, &s->dram_clk_chanage);
> +			 DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_A, &s->dram_clk_change);
>   
>   	REG_GET(DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_A,
>   			 DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_A, &s->usr_retrain);
> @@ -885,7 +885,7 @@ static void hubbub32_wm_read_state(struct hubbub *hubbub,
>   			DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_B, &s->sr_exit);
>   
>   	REG_GET(DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_B,
> -			DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_B, &s->dram_clk_chanage);
> +			DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_B, &s->dram_clk_change);
>   
>   	REG_GET(DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_B,
>   			 DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_B, &s->usr_retrain);
> @@ -905,7 +905,7 @@ static void hubbub32_wm_read_state(struct hubbub *hubbub,
>   			DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_C, &s->sr_exit);
>   
>   	REG_GET(DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_C,
> -			DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_C, &s->dram_clk_chanage);
> +			DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_C, &s->dram_clk_change);
>   
>   	REG_GET(DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_C,
>   			 DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_C, &s->usr_retrain);
> @@ -925,7 +925,7 @@ static void hubbub32_wm_read_state(struct hubbub *hubbub,
>   			DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_D, &s->sr_exit);
>   
>   	REG_GET(DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_D,
> -			DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_D, &s->dram_clk_chanage);
> +			DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_D, &s->dram_clk_change);
>   
>   	REG_GET(DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_D,
>   			 DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_D, &s->usr_retrain);
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h
> index f2e1fcb668fb..5b0265c0df61 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h
> @@ -46,7 +46,7 @@ struct dcn_hubbub_wm_set {
>   	uint32_t pte_meta_urgent;
>   	uint32_t sr_enter;
>   	uint32_t sr_exit;
> -	uint32_t dram_clk_chanage;
> +	uint32_t dram_clk_change;
>   	uint32_t usr_retrain;
>   	uint32_t fclk_pstate_change;
>   };

-- 
Hamza

