Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AD8729DD8
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 17:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BCE810E150;
	Fri,  9 Jun 2023 15:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2055.outbound.protection.outlook.com [40.107.100.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6AD10E14D;
 Fri,  9 Jun 2023 15:08:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ceSMgvbiOMwzWd4skm+64gdDmAIFiwDn1+ZRlS7stbqP2+uMkdKFgYFFJo/mAL2GuJuY5XphTCMrs+58iNec5bxBdaqpa1iQUCKK7d8ZG39rRItYkPvqSyEGtKo2jrOFErsnXcdUogN7cfXgv28gywyL4D2wOMC4z9xL4f7vJqx+yWwjvXPZ0Ia1k/zGYt6juO99U+sVCCjyZdAVihKqIfNXIWEQOICVAMtzwORlHgFGzwi/BamLFmS8qbIBFv2igsUQYWAl0pWktMcVNAYBwU86GMHjmQ1ZaW+gM301OVDvETKDFUbIwtxgK3CGCkTBspM8bA3p+R+TXFyVqbvybQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQifJ61UIHvw7rmewpcKoHQeAqHYJev1gIWRutJC8Is=;
 b=Cc6bs1m1zeHZJKCsQmlQdZuQpw4Ky68Ubu+4zNtZWytQbbbQtzJaIQ5WqiWIpNJj1hoD27DVeTRSPKVYrkrXqCbf+1EtP4XFWdjFpPyV5h4LyqcCk2Alwje3L3qmak6t+wf9Fa6woSzSKAK2gCE9z0WIIxl8cGsmxtrHqPYS6uQkPqru+seaj5t1yaSoXgPH/oe9CvT8NFQJs4YhQut1j8x8p/TAxvWjPI+jS1dYa358INCknT7oztxkZmuIG/d9i56YuiAjpHzRS9LH71m9tMp+RJHvCvEAKljQjhEL0CljxL5IUIaI3KzNSgU60YSghEcGT2kf80nESLC0ZuD7ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQifJ61UIHvw7rmewpcKoHQeAqHYJev1gIWRutJC8Is=;
 b=ImvpHsAz8bzLsJBRQZxF00OdaSj7duQBwwz5mcrJPPNQlWyNFcnihZYN3mu9QN/xqziewWFVgrWuADTaMiuOos6fa0Ql2VJ+9iCSr37OmExcr3Dg7dkVRgRVKIKKwaueJxnR/FG2mnvWWrltkJKfp5HjuoT+l3/YJej37Ef+PaM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 LV8PR12MB9205.namprd12.prod.outlook.com (2603:10b6:408:191::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 15:07:59 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%7]) with mapi id 15.20.6433.024; Fri, 9 Jun 2023
 15:07:58 +0000
Message-ID: <8ee2cde8-9463-a2d6-a3a4-4a298b8fef18@amd.com>
Date: Fri, 9 Jun 2023 11:07:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RESEND 11/15] drm/amd/display/amdgpu_dm/amdgpu_dm_helpers: Move
 SYNAPTICS_DEVICE_ID into CONFIG_DRM_AMD_DC_DCN ifdef
To: Lee Jones <lee@kernel.org>
References: <20230609081732.3842341-1-lee@kernel.org>
 <20230609081732.3842341-12-lee@kernel.org>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230609081732.3842341-12-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXPR0101CA0041.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::18) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|LV8PR12MB9205:EE_
X-MS-Office365-Filtering-Correlation-Id: 431a4db9-627a-41cd-0516-08db68fb4f66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r5p09JN6iLSkoSqShDgwqd2pfL6XsJ3WdaR8EppqAOIomjrizZ0hnbgduGVyjZHoHecati0rBR3C4Bba/hfEWrt7VVMsuhgnsQr2NpySeVvY3Azi8iRzV71dNpgtiVeOYrdTn52hcK2Lg3LBHZoY/OybzA9xKimXu1By9wEz8kXNO0eiUlMwD6iQD+pWlVkrgu+NVRod25SURJxDIUS/waQBa+zAK7oFFYjkMb2C9YwJQjujRsuc6NJO7RCsKQuamzVU7VbfkEQm+bj73QaoBZbmSJLOOyYjuudteZdRZ2QRlFlW6t5tz+Bj1/YH3pSw7C4mxBIxZwNGTtNt5gxrBYG8ru9s94PGjyjRcxxoq1vEwaycV9i3BKM++Hfk7aHdxIkpphyl+Oshd+iWZRjRiemgdit9jRclfC4TXDj4K2bBFWzI9RXlDQZmiozj+g6tpWCMGBncXb589B1MrFNvrmAWSkDghH/9LJTddcUjPl9RbZSI7oNioa+JP+pS7lacDbIAM7ohCG/rIk9qKajbyXQBkx94PtiJcaMRT0yceaGRHVPPlzwKxIFkRw2dIRlZ66/t5uJE7z8ToXze+Njwsg1q7TYeegRt0zMeBsO1aw18OeqfpdZctQCEVA9bO28V0CTbwkGIdolVEfd1wxghxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(451199021)(478600001)(2906002)(2616005)(6506007)(6512007)(31696002)(186003)(26005)(86362001)(53546011)(66574015)(38100700002)(6486002)(83380400001)(6666004)(5660300002)(8936002)(8676002)(31686004)(41300700001)(66476007)(4326008)(316002)(66556008)(36756003)(6916009)(66946007)(54906003)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEVlM2NVRlNNRExRVkxqYVlnVzB0NEZSN2Q3dytxN1JZTEE0cUJVbmZ5SnZC?=
 =?utf-8?B?NXBuZnpwMnEvaDZucU02OU4xbWtxL3doSmJZV0QzR3hGYlMyNVRuTDdvbXd2?=
 =?utf-8?B?NjQrb0NEZFFXclBjbG5Fak1NK0RzQkIwa3dkV0lqbVRTTGU1bkhQclducDNp?=
 =?utf-8?B?OGNnNndVY3NXdmFaQllNK2FVaGdxaDVRVmlZSU9tQUtvcUhnTzEreHA2REZI?=
 =?utf-8?B?U2tJcGJ1My9EWDRWcWhqaEZ3WFp2Zm9xRVRoUG42ZlNXeFo4MFVnbnBVMlJZ?=
 =?utf-8?B?d0pHRWN3aEVXRUVDTWRvckJCeUk2UzluclFFVDRScUJnMTlraHJlNDRQc0VF?=
 =?utf-8?B?TGZrK0hMOXJLUWxzejdNQ0c0YlNBSHJseTEvZm1EY2RJVkNzTkpSSThBYVZU?=
 =?utf-8?B?WFF4L0Z5a1pVd2ZiaEhlRm5iODk1TUhNcEtMcFY0WVZ3VkFKbmgxamZWL0N0?=
 =?utf-8?B?aVJ6ZkVkc3JLd21LNDdsdU9yaFNVak5kMjVhRmdETlhqMHM5cWs5YUVodW9l?=
 =?utf-8?B?cjd4TXB2bTRJR2Q5WXRoakM2bS9senlaeXJYZDh3dWw1UnpTUUJqK1BZaDYy?=
 =?utf-8?B?bHNlSmhEWFZPRnRpM0JHSUs5ZXVPZXEyUE9jU25pbHRQajVDY2pnU2RId0xv?=
 =?utf-8?B?ak80UjBVajlSaGVnbVgrOERIcG9QTk9lUEdjM0QvQURvaWxveGp3TksxWlRk?=
 =?utf-8?B?M2cvcWI1cTliU2JFS1NsOXRKdkpYN1hkRTFmeFk2dFFHYnR0cURTc2VDSVRJ?=
 =?utf-8?B?aWtXd2gyaDJOZXRUb2twbHNVTTZqakhYTVY2SjBEQkhQNy9rQ0ljb0dvSG50?=
 =?utf-8?B?NUtkVUt1cXlDVmdVZGdVODR5M3pUY0R2ZGNEOGVuT2RjcFQvb2RqZ2JHbzk3?=
 =?utf-8?B?S3AvenR3a3ZFZDBkMlpRZCtPakZna0FkNjh1SjU5MGxDblJUaHN3cmd4NmQx?=
 =?utf-8?B?eTJ5WEh0SkNvSkwvQUU3WGMvMlNKZzFUSWNKOTl4RzlNM2RSODlxVnNLSlNu?=
 =?utf-8?B?eWlVTmFVWjdia2tublJuU2FqRWIxRjFFeXloODFsa2dpUTAvWU5VaEpySng5?=
 =?utf-8?B?TitwcmVwbVJZTFZ0K2VjNXp2bDNJRGhOblhVUmZCZjRPNjJDT3N5K3hUUmQ5?=
 =?utf-8?B?aXhIMnRPWXo0U1N4ZjFOMmxsZUVlMktEYWc1ZHRicnh5dWFaVEx1RE9ZZ2lm?=
 =?utf-8?B?eVVGcThUNEp3VVRMUEFTc2VlSXJMZVNpNG9MaTl5NTVaaGhOcjg4MGZHay9a?=
 =?utf-8?B?bjdFcUwzSTVJMWhvTlZ3eW5GeXhMTzErYldndTlqMmtzcDJzWWV6RkRwbGFB?=
 =?utf-8?B?L3h3R3k2b0RHSTdPdTBNaEJBeVErMDhGQTREWlM2NkVXcFNHZWY4cFFiM3JL?=
 =?utf-8?B?R0haQ0hteE5tczhjZlljeHRrSWhQS2UrY2ptR2VzM3BRbktZaWdOSFRLNnR0?=
 =?utf-8?B?SDczNnhkWmdwYjBjK1RlUG1wNTBjNW10cGRMUXlhUDk4N1pRc0xRZU52bDFk?=
 =?utf-8?B?R2J4SnIvNnhwRGtTZmtSdXdlU21NdkVWWkc0ZjlsTzdtc2hQamxpWDZ1OXNL?=
 =?utf-8?B?Nys1emN1eGE5aStEWERUM3p5c2RQZTlNNThyUjFkcU9YOVpCYzBkTk9zaGVs?=
 =?utf-8?B?YVlrMEI3YWxxbXJqTFpPZkNnM3l0WW1mdXhvb1lpZHlIbm5zSjBzVVF4bXF2?=
 =?utf-8?B?dXEvanVSQ1RrazNKb2xWL0pzTmk4eitjaEJMQnB6bGJySlBzbmYzUFUyQi9M?=
 =?utf-8?B?RDFQWHdwU2xSOUc5NW5VMUhHMitLMnloM0J6REgzOW0wQ3Y1QjFUQjg0NmEr?=
 =?utf-8?B?a2liNGYxaWNSSzF6ZzVQNkFtQ3hhblJ3Wm1OY09oY3NXdE9mNDlwcUNZLzU0?=
 =?utf-8?B?NHgyajVmZmx6QTNhUGw0YjVINmgwN1dYK1dCSEtHWnZlV29ZeHpYWkczMXRR?=
 =?utf-8?B?VEJ4dHpPcnZrNllZWnE0alNsMzhUSHZlbFFTbjYzeExFc2wrTUE3ZlBTMjlr?=
 =?utf-8?B?S3dJeitYRW9yOVRacyt6eTUwK1BYREd1NUVoV1dRVndnMVdRcDlJL3hvNDls?=
 =?utf-8?B?bnlGNXBSNHdJY2F6cml0d0c5QytVdVEwVC9OOFFqN3hKMTdQaHUxa254Wm5L?=
 =?utf-8?Q?Wrzr6KP+ZkeUr6dxw67fkt4vD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 431a4db9-627a-41cd-0516-08db68fb4f66
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 15:07:58.3145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: joVOLe/D4X/rr/WWiCcNjfgDUuc/WeeFrMEfjvpUIeS+LWTGVnoIxg0GPm/QaHy3rxOR5628zx1bx7w79U9UYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9205
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/9/23 04:17, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:48:22: warning: ‘SYNAPTICS_DEVICE_ID’ defined but not used [-Wunused-const-variable=]
> 
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Applied, thanks!

> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 09e056a647087..cd20cfc049969 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -44,9 +44,6 @@
>   #include "dm_helpers.h"
>   #include "ddc_service_types.h"
>   
> -/* MST Dock */
> -static const uint8_t SYNAPTICS_DEVICE_ID[] = "SYNA";
> -
>   /* dm_helpers_parse_edid_caps
>    *
>    * Parse edid caps
> @@ -702,6 +699,9 @@ static void apply_synaptics_fifo_reset_wa(struct drm_dp_aux *aux)
>   	DC_LOG_DC("Done apply_synaptics_fifo_reset_wa\n");
>   }
>   
> +/* MST Dock */
> +static const uint8_t SYNAPTICS_DEVICE_ID[] = "SYNA";
> +
>   static uint8_t write_dsc_enable_synaptics_non_virtual_dpcd_mst(
>   		struct drm_dp_aux *aux,
>   		const struct dc_stream_state *stream,
-- 
Hamza

