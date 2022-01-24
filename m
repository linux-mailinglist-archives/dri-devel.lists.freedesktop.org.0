Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD5B49837C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 16:25:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BB4897CD;
	Mon, 24 Jan 2022 15:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCE410E1B8;
 Mon, 24 Jan 2022 15:25:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eKK+THUQuPyaUgEBXVRlVg7GXaB9aSOP1cD5CerHr1Hx1a/nmZSRGUExCqBg2RNlfYlFuAzNSSh1duLlRe8TJs2duoCtyUM9PF6oTWv911GTVjS90Y4XcL2hS4I1FJqr53PKQ49WzhOm6RKV4+JZOJAY1ahw7O4GnZajDAvJnf1IO9PvSSBgfS68ixMTNciUGNx6Juug4thVFT+P6HQLrj6DIuzmqL5BlgQ42XYiaC0kMZgnq2GMOvQDUDnD0K4COw5ZhndrAS3Dk083EuwQXYo0/HDnWRQlGHt68WVfFuTAoPDSPCZSQNIcYHKvRSCT5ny3/mB89tLCsVYxmtJRmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9hDBBsf9zLLdqknMSQor9GR3kt58SnI3gtccqTRuV4=;
 b=hxR4XjX2ayPINe6eWrJjVgFlOrvhm9fOq0TUzjeV0nxtLTOp91jWWDzbDwxqlwkYIZVc5ZpWJZhvq0BmBBWFTzhFs307U/pRjec2aEsLSnuYdmzqn6NcoNS158YDG4O4LUrBRieClfpcizqe1NbsfIwZdkWNG4bdqS8k1so47tJVKFwWyP7IhAgkd+CHCY4nTfvR0JRkYieKkETqNJEmOgmDWktuTAX+DGiQXYv2bwu/YV55saHvHfJdvEbr3X/q8tXl43KEiBy1p0heSVISssEG862SaYNDIGVURuZ57bE+LVVZMVeQkssy44VJVH5/5k3tC2Sv65MK6hcAnbQMIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9hDBBsf9zLLdqknMSQor9GR3kt58SnI3gtccqTRuV4=;
 b=OYHMVwLbScWNuvGdkac6d6kP0EqRzhcJ9dYopCfvtyM4Ll638TF2zL/k/i9nYBYUntshlIt9ttqlnkk7SMGkIvUoK+HaxTKBfmELCq4hjfbULX0gzZkHyS/pFPTHq/0Q+45eTlI6nbQp24Wr2W+SiI62VvBX4dT1WdqhzSNuj0M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM5PR12MB1433.namprd12.prod.outlook.com (2603:10b6:3:73::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Mon, 24 Jan
 2022 15:25:23 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd4b:b67b:1688:b52]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd4b:b67b:1688:b52%9]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 15:25:23 +0000
Message-ID: <fca36168-d66b-c914-a5c6-fb8d495238ad@amd.com>
Date: Mon, 24 Jan 2022 10:25:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH -next] drm/amd/display: don't use /** for non-kernel-doc
 comments
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20220122012343.32540-1-rdunlap@infradead.org>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220122012343.32540-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0137.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::10) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1388f763-a0f5-414b-60b6-08d9df4dbd38
X-MS-TrafficTypeDiagnostic: DM5PR12MB1433:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB14336B6E6A7EC7AB4896EF6E8C5E9@DM5PR12MB1433.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yyAxDm1ty9miOnDGVy64ydOFk4+Dkz93lo9Ruks2o7cvrRfdcccd23IMC9JbgM9R++aucsAt1MOwujjDx+jvPqXWFIbsKZgBh2Gc3ljde2Vt8s1R7LQ3VdedtIcfkCfRkf2Mp4cUhCEhhebw1dIQkk433S1ePPo9ppRrj+c4p61wwoFTRlqbe3+gBWgXSOxS+kbCWvbALlhSOY8IVGaKuEG7T0+RUsTE8dm+PvbGnI/5g23ARuXKTOrpOxdb+QifmS/NNMukDPeThDHzN897SdyDn0WxV0WC5XMnz7660AYLrIOOq4ii/9Y4ruPsQYbXTUYUZQ8FvSAGsZJyO7vOxLsVMWZ51d+n8oQ2C1PT7gJ2kN4KE3aQkdi1qvj519f4ehbAbMPlUuETrS2kY9KEmdYTyObQqdkOyh61lrGaG9MoPOcXOF6mCB+8KKHazcCaWYMJEOSd4u9qtzsJZPm3bBJUraKxn2K5vRtVEOrh8j/MZq3/nHArPLfjYiac6n3FWaMQTeT6GnlqG6v9ODJH5KNHx/HZqn+EnKGWjMDJt3nbUbDZW0TlALzkhs1TukoXeo5Xzv1NL1C/Js97VHrw8PyyQCYp7S4rK3daOkocaQxlvKwGSHz2kc4LvqOzqGKbIWoAt4BVw5hleb6Ij980h8sdkLUdMI9m9gE2jLojX7Q30xQ8o+5Sj/VgejzRZ/hicWspqY1K4SmplO43SRBKNk40DfyobSdh9pbSFO7J9Zk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(83380400001)(508600001)(84970400001)(316002)(6506007)(5660300002)(2906002)(31686004)(2616005)(6666004)(66476007)(31696002)(66556008)(4326008)(66946007)(38100700002)(36756003)(8936002)(8676002)(86362001)(53546011)(54906003)(186003)(26005)(44832011)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eThTZXBFd1daV0Q3aE5aTmNwcWZVUk0rVitnamErMnR0TE9hcjhaVW5VRm8v?=
 =?utf-8?B?dHowY29kSkUyNkRaVWg5UDRMMzRjNzQrcTBWTWNaTUE2cWU0bW10ZnpOTmRG?=
 =?utf-8?B?S0szN3BobW1XK2w0elVMUGhGanI3MG4wVG5tUThyaXFGSE5TeHJtSUtwb29o?=
 =?utf-8?B?UWJ1WEhodjBEZkQxQmwvbEJUR2RYZ2F2L1QrdGZSbzNqUmxudXdiUzc4TCtu?=
 =?utf-8?B?Rkh0OUVnaHhZVWlDdTRNWlVsLytyTCtDekcxaEF2YXp3dGFwY3FZdWNzK25M?=
 =?utf-8?B?ajFOM09mQXAyTDIwa01hKzgyLzhoeG5wVXlIZ1hacW1tVlFOM1R4NzVPRWdH?=
 =?utf-8?B?ZGhuMXc4OXhCbWRtZ28wQ0RBSjMxU2NXNXRoSEs5OGl3ZWtKZWI5Uy9nUzl5?=
 =?utf-8?B?SmV2UVBpVEw0S3NDWHdRVUxkalJJLzdTaTQzZnpjUnZEbEpMMjhPbGpTK0Zq?=
 =?utf-8?B?SWFSRjhnZmxpRjBHMUZzK1lJYnpWUUFROWF5ZHByazI3VDZHeXBEWUlaZWR1?=
 =?utf-8?B?RUtxc3kzTzZhWGphY3NtRUpUNGV4TSsyREszRWYra3krUkdsR3V3YWNKb0x4?=
 =?utf-8?B?Z0JXR0h3YUc2anh4RkRoQlFxOFVOb2ZLVTRnd3MwL3cyYjQ5YnNnS0dTMlM2?=
 =?utf-8?B?a1RMcVpHODhVU1pVSmlnN1RvNzlBVURvZWJhR1NHTnFHSzBSNTZ0Z3ppMDdD?=
 =?utf-8?B?NUYzbWpQZ25aUjZreWRsM0pSbXdYek9yeXRuRmtTVXllckd5aGpoUFhySDVD?=
 =?utf-8?B?Z05kZGxpK0JpVnlMT0pJTDFNU2xmaGVTb3JsSTlyOHpleDEyRXdSVWUySEpC?=
 =?utf-8?B?Tk5ocEUxNk8vSWdJdTJHUzVtRzNoajZBUUN2Yy9NM1VhL2hyeGd2S3BNTGpu?=
 =?utf-8?B?aDJ6VDkvUCtOQ0lFYVgyWSthcGF4S3RpaGh0OFNodEM1SnBWSzhQQXVtRCt6?=
 =?utf-8?B?cGpzcE5RSVhHZjFIdmtsLzB6b1Zqd0l1T3lpS28rczBRMHhKbjcrTW83WjdY?=
 =?utf-8?B?dCtDM2ZmcEpVQ2QxUkxORnk3YkhOakswYUk2bWNzSnRacVZVL1hSU0JaTDBn?=
 =?utf-8?B?QTZrbDdiMkdkaWwzdzJyTDYzM3d1S3h1V05BWXZHMWFPMHgzeXpLaVJWamJt?=
 =?utf-8?B?UHZXamJORHlVUThuNUJ0K28zQ1hOeHpFREUxK0gxRHFNSWQzdFBRamtib2VT?=
 =?utf-8?B?WmdEZmRFYjJrb3d0SDMvbTJEWlowbjBpUzdiekxDaTlkOVlPd1ArcllUdDdO?=
 =?utf-8?B?cStWbHJwUlNPWkYzUTBvV0ZFYzhoUW1iaVU4ZEIreFdFemJMMkdzajJUbGd6?=
 =?utf-8?B?RW5CTFpRcEhZakRHV1RzczhBb3lIaXhWd0U2U2w1SXhUdGtDanZqb2xiVjhH?=
 =?utf-8?B?TnV2clI4YUFsRWs3MjFleXQ1QklZdmkzYzlQRXFBcy9oeElvQmVwMDlmSy9h?=
 =?utf-8?B?c2ZiTEZwR3hGVWdQWDFDeWVlR1Fjbm9yV2FoakdlUWM4bzRoU2tSeVBvMm1E?=
 =?utf-8?B?VnJ1TFFES2xCLzFIelhBVjN1RlhqbFNuOGo0bkZDMEhpb1VMbWdvRk9rK1dN?=
 =?utf-8?B?REgwcU9pWk1mak5BT0xpTHg2ZFNLZldFdzV2RWhUdUJkQzFaakpHNWdVS0JC?=
 =?utf-8?B?VGJ6NnZQR2ozR3ZCaEhPNTR4ODFFTDJGcDhRYUxTN0xuOHltNllzZnV6WkRP?=
 =?utf-8?B?d2pIL2NJR0VxdER6Zk5aK1lOK3V4VDZaOFBZc2tlcDgydDI2QjVnekpBYzk3?=
 =?utf-8?B?YzBTcm12TWdySVhGTndHV3NPTW42TGRNZ2IrSjU3aDM3T3pobHRMcCsxbHBV?=
 =?utf-8?B?bG1JTEhoNlFra2l4bjVaQkE0cUVSRndhSFArUVBvUCtRRllsQzU4cW9SZXds?=
 =?utf-8?B?VkIrNE81UzhJZ2VaMUVYLzJ2Zlpnb1Fha0pFdmdjZURiVHg2U3gwSDM0bUZq?=
 =?utf-8?B?dXdRRTNsTTZKYXJEMjllRnZwc0E4aStRcFVFYXRFdnhmUnhscUpvSS91TU5u?=
 =?utf-8?B?OHJGL0VwWk5FNnVRU0FjYVFwQzFsWERPUGd4ZnFyVGF0T2hJd215Mmk0RmU4?=
 =?utf-8?B?amFZejdJUXFjNzZhSlErdlBlRm9uV3h5c2x2S0UwWEZ1czFFSGRVQ3NwRVNO?=
 =?utf-8?B?WXpYOVBYUDJJTDQwSlVEUEFFVWNsd2tFOWk2M3pzeDFKa1pJU2lJc0xpYlZp?=
 =?utf-8?Q?YsWov9bcfwew1ItetDhZXKE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1388f763-a0f5-414b-60b6-08d9df4dbd38
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 15:25:23.2668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c3ewidIdpFitJ3BySwd9WfvVLQwcE1JEDDE729fPD3MF+u4pXkXHP+0+8ikbLnItTQaQumYfps6r2JLtXuct9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1433
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
Cc: kernel test robot <lkp@intel.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-01-21 20:23, Randy Dunlap wrote:
> Change a static function's comment from "/**" (indicating kernel-doc
> notation) to "/*" (indicating a regular C language comment).
> This prevents multiple kernel-doc warnings:
> 
>   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:4343: warning: Function parameter or member 'max_supported_frl_bw_in_kbps' not described in 'intersect_frl_link_bw_support'
>   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:4343: warning: Function parameter or member 'hdmi_encoded_link_bw' not described in 'intersect_frl_link_bw_support'
>   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:4343: warning: expecting prototype for Return PCON's post FRL link training supported BW if its non(). Prototype was for intersect_frl_link_bw_support() instead
> 
> Fixes: c022375ae095 ("drm/amd/display: Add DP-HDMI FRL PCON Support in DC")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20220121.orig/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> +++ linux-next-20220121/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> @@ -4970,7 +4970,7 @@ uint32_t dc_link_bw_kbps_from_raw_frl_li
>  	return 0;
>  }
>  
> -/**
> +/*
>   * Return PCON's post FRL link training supported BW if its non-zero, otherwise return max_supported_frl_bw.
>   */
>  static uint32_t intersect_frl_link_bw_support(

