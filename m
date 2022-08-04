Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBBD589C9F
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 15:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5632F8FF7F;
	Thu,  4 Aug 2022 13:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA85497634
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 13:27:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWTGTKAZp+xxv6txUEBRA7Ra6gREAIu7pXUbXN5KzCiDCdPwP/JSO7kZWud6WZUtUGG8Zd9RZmZKPZ8P72XQhTRzSZ+aawe+AS2y41cKVpPOzSUQB7lIGHjtGKGteaMm3x2+9lfUNKV4cNNwEgSTHkJnEoHUTJZBZhZYUH5m/Jo4uZuT+aZVdOOM5sU+LouXRy1hRy/1EtuypovAyOY2+2KvNrttKbjkKHaYToqd/8ETcHPrV5zkLVyRrnOwOjpnvSIFvWSVnFSzrJAoab80T+MSyuHpMNfH5B9r+EaaT/xpdPaW8ZI919ep6Lvx2+4S0QMRRRLHoShK2OD7zv/pMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cacTPxwas0Ejiku4Lp+559f0Ljr2+TwkVkmPkF6Wd9Y=;
 b=PUKvg2wDagIy0IqKuHj/k/pZH6IO0joZxCfSM/vwRNlWknqfFcewTkici7AaTCi1ZiimrHJSXRzTd90xmmRhRp/sIiutE/mcSY3N/T6wf4rcVPnWqtT3FFu7MtUta09G9bMgCNlOQgv/1L1yNZrtoCxhXHLY6Lnbv76XLuph0bEkKjPao0T1TRshMMKIwMUbg6RqxKPHQ5oZx7Mlkc4y9ea+880iZq0OlPAzolXFkzJNSFeDfXAzAyUu6dVjpa2Nwfv/DtD2gDr2T2Kv4vU3Cdf+XpVEjyyfTaJqI22ZqJbrDzP6WoX00oE/avvytYyE1v8Gh/Qr+O8SH5grXIdBPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cacTPxwas0Ejiku4Lp+559f0Ljr2+TwkVkmPkF6Wd9Y=;
 b=2Pdlv8a5NN5w09CRU8AXAyF0x8xmTEd7tvW2lXmhATFjF+gHpt7Ofe+EGvggqMzS/dGEjVph0fL9V70Z1AVnOWYAY+HV12IHqFMkhBNAwTKqxZXbUBfnNDA9r0AAdL5eLgHrW0YVvc67om0xdMRNgmRjauPMHvot9b3CmCC3YkM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH2PR12MB4938.namprd12.prod.outlook.com (2603:10b6:610:34::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 4 Aug
 2022 13:27:31 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::6999:13c9:d124:418a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::6999:13c9:d124:418a%8]) with mapi id 15.20.5504.015; Thu, 4 Aug 2022
 13:27:31 +0000
Message-ID: <938ca191-074b-468c-d44d-0be795fb0700@amd.com>
Date: Thu, 4 Aug 2022 09:27:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/amd/display: restore plane with no modifiers code.
Content-Language: en-US
To: Dave Airlie <airlied@redhat.com>, torvalds@linux-foundation.org
References: <20220804055036.691670-1-airlied@redhat.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220804055036.691670-1-airlied@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0102.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::21) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68f3514f-4545-4b87-9d70-08da761d154f
X-MS-TrafficTypeDiagnostic: CH2PR12MB4938:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dUOVjJ7PPAsKKrJIqdM+QktupWQRJeNnuOXVb+Xbl3wG8u0fyd5YaAxL3T1vD1s77XUTy20zrMAK/Syc97rVaZ8ZkwYZ5s+T3ruNuXktEe57vt/kHJt/QjADjCgUXXSvib5SC0FCj0gEonPukeSngZvMSvrzmX2cTmjXAay6xVcYMK/eKO1OADAi/sz05Mhfil+f4ZrY7diDaD6t39R0M6DnN5jwq296Bhp5v2ztQjTPoZ8HwOJbSDXEBfVXlV/7Le7/cNjqGEAPL7LIpUu3vg9ZMA5dDGFxMm79WguWYf+Cj/+xPBovW7qEYSiPvhyGNNMS+1LGaLPFQR8d1pN8kO/BVOz5YJ81J/pVxitRPOOQPrgMKSZhYobn87GmcnYfUJILXxJNONtI5Cj0fGvDD53WEedmwwSo+rK3Gcd9GQEji2nIMHW8tQbWcNWii8UZfsGH2uSCC04AGHyKH4nMkkZLzmBonHs5Ad9pyvzl+WouJGAepHD4aT3mQxElkPtD74KXW5TW8blJnCSMxrw5cFu7T6v8yalAUvpJ2TrUsgy2LLeVd2sSsMu6n53TPp+8zzNk8Onfw3hfbwnawJPLjxnEVP1dxr9rSKusNDzwisfDJC3uaUYfNl8H6ilZ6EHSa9CTB8bjEyMeANG7lv1g8l0DCRu+YsAs4HOWfz/A+cWFUJBDsvUP8x7nJoXqNRj6Shc5VgJN6oJszef03Fef3Lb+9wlBEKZho0v818486jOzbQt/YCR9KgTsvAXdrwpdof42R9ykB45+I3vLEUDCVeFBpbYhbzcIdsekunTLpYA2PrRx4occ6njRsPRVIp51EzkdniCKjfmfUx7xI3cvWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(346002)(396003)(366004)(39860400002)(6486002)(36756003)(31686004)(66556008)(4326008)(8676002)(66476007)(83380400001)(8936002)(31696002)(478600001)(5660300002)(66946007)(186003)(44832011)(86362001)(6666004)(41300700001)(2906002)(316002)(53546011)(38100700002)(6506007)(6512007)(2616005)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aklkUTV0Um1EZFd2R2dXaTNGUkN4ekdYNUNpaVhoZ2x0ZU4vUVRrU081WTBn?=
 =?utf-8?B?VEVsVEVqNzJ4bEZTSmhWOVYyZFdMejl3YXNKLzNlWXNnZndUTi9TRHBDZU9o?=
 =?utf-8?B?VUtxclFqV1B5UmFmNVdUNXBPNm1GeGgySU5sVllycnYyVW05RTVzc2taa0Nj?=
 =?utf-8?B?RjFuWlB2MzI4RElSTE1SekNLTE50OUdPMUxHK3liamRLUFRsWFRtVnpVRU9W?=
 =?utf-8?B?ZUdweTQ1QzQ1Z3NLWVZ1ZDQ4MmIvTzN3M0hrR2MyWkxhQmpjbWNqSmtXT0F1?=
 =?utf-8?B?aTY3YTZ5ekxBeEFWSlJsRDA0dUxXNVNkV201NDJyb3BwNUEyYkwxMW15WSs5?=
 =?utf-8?B?ZWhSdVJHZE96WHBMVTE3bDdTWldqdnlyVUl4M2hrYm4yQU91NVFMSk9SVVdT?=
 =?utf-8?B?V1hyWHA3bGJUcnRnbms1MC9aTi83REhyS3Y3RFA0eHpvQWlkdjhPcVpIRlZQ?=
 =?utf-8?B?dmVoY2dxZlVDZTNSQzhDQTVxWFZZT0FwOXVEVmNxUVRtcDlxTERxUjNWRXNR?=
 =?utf-8?B?NkJxR3EwYXRwNXlXNGJLTWp4dVQxK2dLbTZYbjZzRFJnOVQwallXZ3FYdGsy?=
 =?utf-8?B?K215TmxwcElIRmhvS3NWUW9QRWhPR0hlc3A5NWx5YnBBdW1vK1FCYkI3cVZL?=
 =?utf-8?B?RFJvSWtyK0xQNElkaUlRbEJnQlZTdjYveERiSFRieVBhbENpMGIvM2lWRFdH?=
 =?utf-8?B?U3UweE4vK2dBYzNSQm94M1dvN1N3eWRzTDRzZk1KMVZqM3h3RFd4WWNTNDV3?=
 =?utf-8?B?NWdCSzlJMFc1bUE2VWpnTHo3dzdvangwQ2RjdktuY2I1ejBuR3p2U0tud0xy?=
 =?utf-8?B?SlowQ0ZRbFhsLzNtNmI3Tjlnbm8rQkZGbzZrR1hiUFFGZWNab2t4d2UyZGJi?=
 =?utf-8?B?bllnNnk3SGVncklWTEh3NERmTTVaL1EvTVRFa0pyQzJHdVN0WU1qSG1Gbmoz?=
 =?utf-8?B?N3JzNUUzczA1NlhpL0lkMnNjaTQrRjlMclh5aUlpejI0UEZseUN3TjVCZjQ5?=
 =?utf-8?B?aXN6WjVtdHMzUnQvb3ZVcktsaE52NWJUd0V2OUQ3c25ESlFLYjhyVFpxNWwz?=
 =?utf-8?B?RHgyTTFuWmx6Mksxc0NOTzF0ZkpidUdEWnA5bUNBSFdMV0tiYW9kWWxqby8x?=
 =?utf-8?B?ckYzeTdScFAwUWtzNzRuZVpoWkNGMGxmY0RqZmFtdncwSGpOVHk5aFVKbUdF?=
 =?utf-8?B?Y0dzQmM5VG81VU1PL0pHQzdJcEpsOVByU2tLTis0c2w4NmRsaUtrQTh4by9r?=
 =?utf-8?B?M1B1NFhVTm1naDZPdnl3bFhLMytaQUU1dzdaNjVOUEtDcjhFL1RyTlREZE5T?=
 =?utf-8?B?dWE2VGRtSi9LaXZORmxQb3daN2xjRGNPbFhtZDVOMkhWT3A0MzY0dFpSWGpN?=
 =?utf-8?B?VGpzRlY3T2kvNi9iMWhoMHdvWklsbXhnV0lGeW4zMmdGYndjQnl4b3N1NWNw?=
 =?utf-8?B?Wk9KeitNM1FzVElJNk5jQTd4UmpOUUdyYTdtZ1FhWCtDQlQ2VTZvM2dsMnRP?=
 =?utf-8?B?dTV5NzNiRDFQM2R4c00yUlF0RHlDU1RDYVI3ekdKb0NubmNpMWNiUklWdXBE?=
 =?utf-8?B?MVIxaE50UzlYdmtlRm8rQkR4Q2FHZXM0Yjk4UmVibEljcFVuTTM5cWZjeHNu?=
 =?utf-8?B?YVF5c0lrUnhWZ2ZYNWEvU3J2Vko5K1V2WGJTS0NFemVieVQrMnVnRTljaEFM?=
 =?utf-8?B?aDJDUmY5Yzd0b1JTdk1mVEkwbzR1T3VHUXRuc1JoTnhXT21sOElONVVEK2pP?=
 =?utf-8?B?eGd5aDRQQXBwdlFMUzJXeUc2aFVDSFBuVzRmaTQ0b2R1WmxRU2luakVvWElh?=
 =?utf-8?B?RUd6ck5YWUJYdGhrSncxLzJweHp0QWkvcG50amVISjRQRkRsMWNVMUgvdHdo?=
 =?utf-8?B?cnppbWpmQzR0Y29PWUxMd0Ywd21wTkN2cVdjc1Q1aG4xMTJ6clBtNWVQYnpU?=
 =?utf-8?B?SjdEbm1wRFYybFlTVmhTZkpRbWVyU0RodUg4T2VqMkdrUU0wMkRPVG80eVZY?=
 =?utf-8?B?SXphb3Z5bVpsMzJoNVlhZUdwSWdDeTY5RmRtWHoyYlV5T1ZnWis4VGpRVmdC?=
 =?utf-8?B?Mkt0YnBTUXRvTWZIMHhEMnpmeXdaRkRJYWZkRFIydUJpRVhNTnVHanI1U1p6?=
 =?utf-8?Q?bMdkPJ5v4MhFw3NdBOGNuyIUj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f3514f-4545-4b87-9d70-08da761d154f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 13:27:31.2045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NFmjfJSTsyAe/YirrfYxgCRUpEv6amalmUnlHh1WuSNZmytWaiOnP79iy6EuyT2SXfcdOPRoZ5wn7VQ2DHcbRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4938
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
Cc: Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-08-04 01:50, Dave Airlie wrote:
> When this file was split in
> 
> 5d945cbcd4b16a29d6470a80dfb19738f9a4319f
> Author: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Date:   Wed Jul 20 15:31:42 2022 -0400
> 
> drm/amd/display: Create a file dedicated to planes
> 
> This chunk seemed to get dropped. Linus noticed on this
> rx580 and I've reproduced on FIJI which makes sense as these
> are pre-modifier GPUs.
> 
> With this applied, I get gdm back.
> 
> Fixes: 5d945cbcd4b1 ("drm/amd/display: Create a file dedicated to planes")
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 8cd25b2ea0dc..b841b8b0a9d8 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1591,6 +1591,9 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
>  	if (res)
>  		return res;
>  
> +	if (modifiers == NULL)
> +		adev_to_drm(dm->adev)->mode_config.fb_modifiers_not_supported = true;
> +
>  	res = drm_universal_plane_init(adev_to_drm(dm->adev), plane, possible_crtcs,
>  				       &dm_plane_funcs, formats, num_formats,
>  				       modifiers, plane->type, NULL);

