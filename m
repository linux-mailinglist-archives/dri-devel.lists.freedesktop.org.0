Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FBB6138E8
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 15:24:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD24310E249;
	Mon, 31 Oct 2022 14:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60A610E249;
 Mon, 31 Oct 2022 14:24:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUkDj+rygX2jd8BKVqTT8IMsUYvXbezvJM6bMnItiOdi7CptB7BiNlftssSCsfoJX9CtSDeUPEjX9AENdGmwcYb2zgumMC9a/tAcj3f3LCfz/PHC9J9SQZ+gKcAg2kPK2HGTsoS9TRP2/bdsZt26gwu3NtngulMR25wfa9b4LAC14IGK6jJuSsXBekew3OWYLx9jHuiNeR15MsrjbI+ncYm8uH9LoEOcbCQwahTXWmBdhzPITc8llhuDtdZ3qXtMxbSqdvcZ4muJQLjm7ushJO9LtJmmr0gmKzn2KE9rxzjbyO31iSxFglw+g7uKkBhOukZB4Qr0V+zxYWKfVxrIbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hleSu/QKYE0fZBBhR6FTAIuldP7Wtaj++2Vp0IHHGAo=;
 b=F5P82S/ilOD4diBpmK2kiS8kJUO6Df/3E9MzK3BtEqTd6e5wBX5GClTl02CqVxeVOIMSYqDg2OcMMiC70TxQM55EDJiKsUP3VFSherO4GTneR1BrQJF6M39uvDc2j6us78u4C4Y75Tf372K9W5PUp4jlZ1v0HeRif0gSrI7jWEHdU0EXQpU4+ZnLmiJsAYUulLn++0QfNWL9A7X08y+HhDAwkwhw2O5/YLE28PhrnPkuP5yAOaphwtG4tgaAwLW8tuzpZjyROOS5GgvaxXMku/I6rLsiSiXlBxzwcc65nf0HfnKIAoV3PL8LFby5c85q5mi0JHo7NxyB0NY9xNx3wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hleSu/QKYE0fZBBhR6FTAIuldP7Wtaj++2Vp0IHHGAo=;
 b=UNLrFBClC/fhnJNaGyMJVGapOgVZi9WTyiK101qwse2/fVcNazxW5rhP1yvD9k29xhPCijuvgruRPlZn3DvQBVdT41F7gWx06i9Zom8a+/ZiUzb9Rob9n9LhnH9OfB11GvFpHuiRNmNhVWs3BL9DxcSE3p5wJCUpEQCyD+LJUhg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM6PR12MB4879.namprd12.prod.outlook.com (2603:10b6:5:1b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Mon, 31 Oct
 2022 14:24:31 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::c741:a5f:2c1a:f8cd]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::c741:a5f:2c1a:f8cd%4]) with mapi id 15.20.5769.019; Mon, 31 Oct 2022
 14:24:30 +0000
Message-ID: <23cd28ea-59ed-7687-0912-506356b4b24d@amd.com>
Date: Mon, 31 Oct 2022 10:24:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] drm/amd/display: add parameter backlight_min
Content-Language: en-US
To: Filip Moc <dev@moc6.cz>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
References: <Y117XNaSP6/8bH+3@moc6.cz>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <Y117XNaSP6/8bH+3@moc6.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::49) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM6PR12MB4879:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d5d0cf5-79b8-4721-1e5d-08dabb4b9fea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n7ACWhf0sbXrb9OFGMEugQKOmsPV2gHFVoX+SRnnROj3KBs6uevz3ilnI8/KizqNkqS0GUwwkM7JzQuHvpVdp/rapDNlEHZeACCNu1B/RemtGZgjRCh4NfVNgjNEDK0r+6GWlHVxc+Ni6Y/ddAHYHCUMpogu/3KAcqefMBX6D7/zj8tE/bln0DUAJXKsXf0IpQ/dlLlRgJi+OzFZLtRTmSYzE/mt4B2w1RBhOksMHGEPDXQ4y4zsHFlea2oMlQLKmI/CPjIm1aIV0er3kDRdKdcEJk2pdeRquG3lYkLl2w9XtRSX+Z32AT11bf/NxX+M66DSL8p9Lxp8gO/CbE6dZMFEJ0LkP1Wptg552wKawb1IjeWr83INerotQzR416GG+Oo49DGuWOL6GyYDsXFSl/xgayp6lzIRrnsOeey14eiEyKKbDuWJtEE+JT9UB2t6b3amWWNmN95by0wll1rfAvVGOyfkbM63VpUUruyBMWMRZOWfVqY4sq725z+AdV+sYMwwIHXkL2IhbN6q2yLxs4mh2qjec40DzE1oJRwfv6xL1VsFFsrAhuRPzwGkRuMLqxRXa5qFEc7ygrzsbl4gxso7T6CP/FTzgSx0meuP4fbFRnl3j2P2rrilZ7lhWQw02Zaf1DNGhxmacLe/kRDi0TDxrS9G9n47FWiqE1etFEC8iVtLa5W2s9cMbVNWpMefjmztTczUwKKINU/keueWMP4KZPsQvhv6Y+S6tAuAiB0mRHxTcGqM43KwEuIJ+ALMacOEgFr4izc+Uosm/EOziNyIsFkEFCUCrzYY6V7jobi7uTbAXQYoJSmUrhIaz6H1vb0y2kprOBnRXnoyXdufbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(451199015)(83380400001)(31686004)(36756003)(6666004)(966005)(6486002)(2906002)(4001150100001)(44832011)(86362001)(31696002)(38100700002)(110136005)(6512007)(53546011)(26005)(2616005)(186003)(316002)(66946007)(66556008)(8676002)(4326008)(478600001)(41300700001)(66476007)(54906003)(5660300002)(6636002)(8936002)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RThWUnRDcnR3TVJwaTV1TElLVkZ3UlJjNmkwbmUrM2Q0c3l2Y3c2cTZVdnJM?=
 =?utf-8?B?RmcvcDg1QmJGb0F2NDFsOXh2LzBvWlJ5dHpzUGVFaHdMSjQxenJCTlMrdWp6?=
 =?utf-8?B?czNuS0pzblpEVWRnY0dTaXJwdDFMMS9iYlQydGNnZVg4NVhOaFQzZnJyRVJ1?=
 =?utf-8?B?M2dBOTkzOUIrSnU0dTNUeXRySDYyZW5PL2lZZkMzY3dUNFhoZUFERHUzMmZn?=
 =?utf-8?B?dERJWEV3ZlhaMUtDMmw3WW9MQTlHamJXbWdMYmV3VlVPUkUvVlpIVWFFdkFj?=
 =?utf-8?B?V0U0ZHpSaGNLUnNLaGcwMllkNER2ZmI5R1pLR2QzV3AzT1kwL1gybU5WVWxX?=
 =?utf-8?B?QzN2ZkpNcWxsZFJCZ3dBTG5YZHBiQW92akpXRTVyRE9CNno2QTBRcUhIMnQv?=
 =?utf-8?B?bFpGRVlGcXlrQXhPRXRESGNWekY2MWR4M09LRkxqUGlmdU1lK0Q3STYrUFFG?=
 =?utf-8?B?SWlZWDNDUGoyekFpNzVqaUltRFZ6MzZvYlF2V2tJZng4REFwUkdUOVFSOUdh?=
 =?utf-8?B?anZaN1V4c1VScnptWU1ib0gvYkVHam1RL1Q2NkhjbDk2cEVkbUhoWlN0bWNw?=
 =?utf-8?B?blk1anVSWDRGZENhdjZqUnNkbGhLWFIxR3dpRDhyWGZNRmEzOVNtdTczVk4w?=
 =?utf-8?B?ejc3aThubll5QW9mR3ZUdk54aDNtMkVla3JqUTRLVXNWdDRSd0lKNkcxM0ly?=
 =?utf-8?B?UkEvTUNEdEtnbWRudmRqV1NjUDhzOWNZNHJXY01pcUt2ZXR3R0phMWJXSGlS?=
 =?utf-8?B?SjI4TThOejFSRGdJaDdOa0VZV0J4Q3FreVF1SFdTeTBBY3JxeEU0b21kdjd3?=
 =?utf-8?B?VWtlRTQzMVBpMnBueDRhOTNOMDJiZ1h5Uk5YSEpFbXFMenpteENzTnE5aWM3?=
 =?utf-8?B?YVBUdFd6Ull1RVpkZ2FXOG1jc0hkaWdjMi96SlhGb253RjVJaW5yUTgyODU5?=
 =?utf-8?B?ZitXbEpYaWJQSDVMS1lNQjlZejB0WEdnZDVKNGlkYWg3VFg4VzVIbHNEOFhn?=
 =?utf-8?B?UzRnWEZ0OXZZUUN2ek1BaDU5RUJSdFNIeStjbGpTbmVUZXQ5K092Rjc5MHVr?=
 =?utf-8?B?ZUZIWGR3aWtvQVZsbS9EZngralF6Qk93RGJuVitYNzhpM1hKKzJucXRnbEYy?=
 =?utf-8?B?MFQ2TTIyNk4zMlI4RVBCTWN6aVVvUWZlbXBtbk9nL1hTeEJTYmxib2NJaWlv?=
 =?utf-8?B?MWx4aExMRkhxTXlpVDloa0F4YVpPVUhlblFRbkVUdW1xTzVSWGl1Tkc1OGxX?=
 =?utf-8?B?TVJFYk4xbkxSMjdhSDFJdWFxT1FRNXhKdnlHbHVxb0Y3S25VN0pDMlNnWGpa?=
 =?utf-8?B?a2svRHNMZlhRaS9kUitQTHBkU0RKaDNlSG5OeGExOHZsaXBDS2prUWhDbVVX?=
 =?utf-8?B?TUtiVVJ3eXk5K2pRSDJveU5ydW1ULzVXNmNSLzZnbjdmemRDQzlCQVFXRmVO?=
 =?utf-8?B?OWtwRTQ2MVp3dzlzOUhLTDJyRVkwMWZBb0NaV2ZUTDlEVGplMU12bFJGcjk1?=
 =?utf-8?B?NVY0c3ZQS0xPSXkwU1pZWjBYSkhkY0l2dDJQbFV5QjhoQTRsbmJ5YmtLbGlJ?=
 =?utf-8?B?TGZlN1FXRXhibUZpQnIwcEFJMEJkYVJwT3o4Y1BCaGVodTJWQmZwRGhmeG5B?=
 =?utf-8?B?UnFaem96TDJlRmR4QVBzMlJ3TTRvejhvUW01SFhyNzk2cVExVXhVNXJ1dExM?=
 =?utf-8?B?ZFlwSkJodEN1bkpieWU3YlFkSFZxNW9TWXUvRDFTRkxYcEhFUVdwNVpMOXgr?=
 =?utf-8?B?SGhWYkptVzVLVEM3VytnWjRDR1JrVHVYUVlTaFRNd1A3V0syRGV3bG5TTlpn?=
 =?utf-8?B?UVZLSjJjWWZiMzk5WDNET0hDMlpUUklaTjNBeHltSUZpRU5IWTZwcVVtOG03?=
 =?utf-8?B?djNrQlVjL1dFdkJkSXhwaGc1Rjd0Mm9hVDhud0JwRFMyUzc4V3RNMVhZREdo?=
 =?utf-8?B?WlM1NWJLNVBWMmNWOE9wbStuNVEvTnRXb012MDZHV2dFWmtIQy9kbVBVUmdE?=
 =?utf-8?B?elpPdklueW42d0R3UHNGNlljSzVUcERRa05qUFQ1VU43M051eUtKekgyOUZL?=
 =?utf-8?B?SU0xeUx5OUdIVXk2RlBJRjdPOUcxMEZ3eVJ1NFBFSkR2UFc4R0FFY1ZqSElM?=
 =?utf-8?Q?yWfOFIPTY4hdCAfC8e76I/WVy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d5d0cf5-79b8-4721-1e5d-08dabb4b9fea
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 14:24:30.7770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gbhjbwFJLqHJZ3kdCAVajvsknebOCiG1Cxhxlksw162WhksI5pMwkRBNjhQH80VpTFvLR+C2FS0/fzueTC7CAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4879
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
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-10-29 15:13, Filip Moc wrote:
> There are some devices on which amdgpu won't allow user to set brightness
> to sufficiently low values even though the hardware would support it just
> fine.
> 
> This usually happens in two cases when either configuration of brightness
> levels via ACPI/ATIF is not available and amdgpu falls back to defaults
> (currently 12 for minimum level) which may be too high for some devices or
> even the configuration via ATIF is available but the minimum brightness
> level provided by the manufacturer is set to unreasonably high value.
> 
> In either case user can use this new module parameter to adjust the
> minimum allowed backlight brightness level.
> 

Thanks for this patch and covering all the bases.

It might be useful to have an example in the commit description on
how to set the array property. I assume it looks like this if I
wanted to set the first device to a minimum of 2 and leave the default
for the 2nd one:

amdgpu.backlight_min=2:-1

Either way, this patch is
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> Link: https://bugzilla.kernel.org/show_bug.cgi?id=203439>> 
> Signed-off-by: Filip Moc <dev@moc6.cz>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h               |  3 +++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c           | 15 +++++++++++++++
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 15 +++++++++++++++
>  3 files changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 0e6ddf05c23c..c5445402c49d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -200,6 +200,9 @@ extern uint amdgpu_dc_debug_mask;
>  extern uint amdgpu_dc_visual_confirm;
>  extern uint amdgpu_dm_abm_level;
>  extern int amdgpu_backlight;
> +#ifdef CONFIG_DRM_AMD_DC
> +extern int amdgpu_backlight_override_min[];
> +#endif
>  extern struct amdgpu_mgpu_info mgpu_info;
>  extern int amdgpu_ras_enable;
>  extern uint amdgpu_ras_mask;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 16f6a313335e..f2fb549ac52f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -43,6 +43,7 @@
>  #include "amdgpu_irq.h"
>  #include "amdgpu_dma_buf.h"
>  #include "amdgpu_sched.h"
> +#include "amdgpu_dm.h"
>  #include "amdgpu_fdinfo.h"
>  #include "amdgpu_amdkfd.h"
>  
> @@ -853,6 +854,20 @@ int amdgpu_backlight = -1;
>  MODULE_PARM_DESC(backlight, "Backlight control (0 = pwm, 1 = aux, -1 auto (default))");
>  module_param_named(backlight, amdgpu_backlight, bint, 0444);
>  
> +/**
> + * DOC: backlight_min (array of int)
> + * Override minimum allowed backlight brightness signal (per display).
> + * Must be less than the maximum brightness signal.
> + * Negative value means no override.
> + *
> + * Defaults to all -1 (no override on any display).
> + */
> +#ifdef CONFIG_DRM_AMD_DC
> +int amdgpu_backlight_override_min[AMDGPU_DM_MAX_NUM_EDP] = {[0 ... (AMDGPU_DM_MAX_NUM_EDP-1)] = -1};
> +MODULE_PARM_DESC(backlight_min, "Override minimum backlight brightness signal (0..max-1, -1 = no override (default))");
> +module_param_array_named(backlight_min, amdgpu_backlight_override_min, int, NULL, 0444);
> +#endif
> +
>  /**
>   * DOC: tmz (int)
>   * Trusted Memory Zone (TMZ) is a method to protect data being written
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index eb4ce7216104..e2c36ba93d05 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3911,6 +3911,21 @@ static void amdgpu_dm_update_backlight_caps(struct amdgpu_display_manager *dm,
>  	dm->backlight_caps[bl_idx].min_input_signal = AMDGPU_DM_DEFAULT_MIN_BACKLIGHT;
>  	dm->backlight_caps[bl_idx].max_input_signal = AMDGPU_DM_DEFAULT_MAX_BACKLIGHT;
>  #endif
> +
> +	if (amdgpu_backlight_override_min[bl_idx] >= 0) {
> +		if (amdgpu_backlight_override_min[bl_idx] < dm->backlight_caps[bl_idx].max_input_signal) {
> +			DRM_INFO("amdgpu: backlight[%i]: overriding minimum brightness from %i to %i\n",
> +				  bl_idx,
> +				  dm->backlight_caps[bl_idx].min_input_signal,
> +				  amdgpu_backlight_override_min[bl_idx]);
> +			dm->backlight_caps[bl_idx].min_input_signal = amdgpu_backlight_override_min[bl_idx];
> +		} else {
> +			DRM_ERROR("amdgpu: backlight[%i]: minimum brightness override (%i) is not below maximum (%i)\n",
> +				  bl_idx,
> +				  amdgpu_backlight_override_min[bl_idx],
> +				  dm->backlight_caps[bl_idx].max_input_signal);
> +		}
> +	}
>  }
>  
>  static int get_brightness_range(const struct amdgpu_dm_backlight_caps *caps,
> 
> base-commit: d8c03bfe146fd5e081a252cd34f3f12ca0255357

