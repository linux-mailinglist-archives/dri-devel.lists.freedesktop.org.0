Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 874F7621D32
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 20:45:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B27310E502;
	Tue,  8 Nov 2022 19:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2054.outbound.protection.outlook.com [40.107.96.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDE310E500;
 Tue,  8 Nov 2022 19:45:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWwCUeKS7yNabdLynju+v6Xn0gAphKe/92nNDuMs+koe5fE9Zthe8M22JAOa9DGkEeln4I+UJOpt4JgmX8uOJYC9xiAZvTp1RHBF0lfGaIqeFr73UP8FyorZDyjcEijAGYKtG/jqi/4N5f+ezfLNHRJs4i1V2eli4/CaeA2DLDQXhRUuDWqOa5sVP3GjHJySEUCP0YL1PsUsLCcW/dtGFNkgGSlGHfGfXWZPYKjZ/PKGColWKkV9enBE6cM53Ukr/pAG7sQE4UJ/ccEjZnwsTwetBXQLMML6jg+yvXak4i5R9p6KwQL8kMVjsn8JZaRf5PSzSCd3JAQsrKTzQNbQ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LJPB+/JLKzL1YEVvMr7pgn/5j0IjihC2kIEUZ7O1Q8=;
 b=lJrIEFeTVhcaOdAm/QJdgC/QtrDWNoirl7+4eWb+v2pipBsFAWWVWjDDdX/19zQG47wzxKFlaIdHPVuSLub9ANtQxxUtggLAdlIdrA/fFMYKg/NOYViYBJTaXzCCPfQ6ft+hzlE3whOG4MhVrkC018kjUDIsvzmoCJbesd2sCq3bC1+diNk8vTHLSDju9AQUHVJQIdaMOKVZoxCme73a9jPZik/dOTg1nS9o3Sh3i8yeJ1QmdHy7AgcpPWDI9eyeAvyBRDy+94wVKfZlhGKTaU2dp9oyP+6e2Df0JOe9lv4NCwvfB51MMu0bMd1ACqqyYSXwaNabubD7z8pRIyP8hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LJPB+/JLKzL1YEVvMr7pgn/5j0IjihC2kIEUZ7O1Q8=;
 b=MMPuP7imC0jYLolSmuFwor2XURPc0JrK+ir9LdUAjUYgZGusk8bioWfDAn3rU7gxWXhva4i2mlViwd+HqPU4BcGGbii0RGROgOzUUSsPVtWplhYeBtAgWu2OZgy1Gb5JLf+CVqTgo7gIn5RZnUlrWPmyx/ZgssDBSexGiHDSA2c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BL1PR12MB5319.namprd12.prod.outlook.com (2603:10b6:208:317::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Tue, 8 Nov
 2022 19:45:26 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::8db:7ef4:cd2b:2926]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::8db:7ef4:cd2b:2926%6]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 19:45:26 +0000
Message-ID: <0fd9044b-d0c9-5d93-3d5d-8c6baaf695fd@amd.com>
Date: Tue, 8 Nov 2022 14:45:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] drm/amd/display: Amend descriptions within enum
 pipe_split_policy
To: Carlos Bilbao <carlos.bilbao@amd.com>, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com
References: <20221107143715.279841-1-carlos.bilbao@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20221107143715.279841-1-carlos.bilbao@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0180.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::23) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|BL1PR12MB5319:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c04a5bb-0ffd-4295-734f-08dac1c1c834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K54OZa7SuEiUAwLQ81qLC3PL6owmAxMeRQGFwMXCZp4dI9ANXzapnbwhF0ZZHuV3Gf2LQcX8O/Rm5LJP6+EnMtvrLQ7UPEnANHt12hL9P4eoNqW5OPKS6PWinyBMFna2HQtCjjwGn8VLB8+oiSb5LnUgfMjP+snUHOiwrKw/CqxFhmYwWTOJa6Q/axvDr3uxBPS+0VKoXFsW1oJ16xLbyHJadatMDs9LLNFKQtnDrP28jXpkfb9SdRuWCpnG1kYZU8on1d9PLKslItpxrp9xl43/gfzjNTUGPA8J1RgVtd9bQ+AgExjXOmn/wXXocyABMDNDByiUeQQ3/xvuI0aQTXbCyN0ZBSa6xI+ZTZ2uzivd+b1Tnaw+oqzzqUT24f0WaiUxBg350rkgrhVNnDD1o5z1o+Sf/okIamK1EyXkpCNGQUsbb93XU02+jXiaXg10icrTclvaQU1yZss5/zh6bQq5Zg4nZqYVmA+gjxxFLDsYqYz+XPTYDt7q1jXzzpSIp/0zH7G2VfkjiEvUAkxuwW4EOZRR/ny+S4DefB/wLsSokr9/nUpbLlGOTYXJwPweWhk07QMkngbVw/3epbexc7Ynjslucd6eb1Ff58JI2OJmO0Og0sPRqY3X6ti3zjGGLlJyplZ5WKt8kesLUwM36dAVfJDSHObxCrhzvq8L4Oo4i45qtldQIxTBibQ11om/loBgqKvY7VZip3LkE0pHQUJgCrGesODZWUxJwHJDADpyTHKkh4wwoFCqh0lOTRdg+qJgsExjVNr1KEXsjkcWiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(451199015)(36756003)(31686004)(38100700002)(86362001)(41300700001)(478600001)(6486002)(31696002)(83380400001)(26005)(6666004)(186003)(44832011)(4326008)(6512007)(6506007)(53546011)(8936002)(5660300002)(2906002)(8676002)(2616005)(66946007)(6636002)(66476007)(316002)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWlsajIrTGlKaVFDa1V0VkswOTdKSXp5UFJGZC9qNWRNQ2lSZjVCQ255aFFj?=
 =?utf-8?B?SHl3WGVFdjFkMDNpT1J1Q1JWNEw3c25Gb1dWeHlsWXJXckdtcyt2WFByM0tp?=
 =?utf-8?B?UWZ3WnFTTUUxNWY2NnlNOUwyU29GS2RtWFpxTll4ODNmUWZnMW8zOTVsSVlq?=
 =?utf-8?B?SnBWTzdiRldMMURPSk43dE1aeGF5ZE5wRWVYU2hhWHd0SGJrMXZYd1FvVXpU?=
 =?utf-8?B?SHpleHlCY0FSdDl6VTZBOFlmejZpd1RUSDVheVQ1bDFZSXhnOXE4eTZNd3Zs?=
 =?utf-8?B?S3d6VThwMFFhYVdTZWZJRmo3TTJpaXNEM0VEcE94ZVJKaXNOcWlKTXg0QkFY?=
 =?utf-8?B?ZnNnenVGN0dmSzJ5TnY2dHBac1lPVXN2MGI4cm5iVmNvN3hjQVBvNEl6cVpn?=
 =?utf-8?B?cFN0RHZYOSs0QU1yVFYxSVFGaTBuWGpYZ1FWc1pqMXZzYjV6VGNNYnR0R0d4?=
 =?utf-8?B?ZXRrZXlrYzZkT2NwcnZzOEJqd1RqeW5OWThLa0VNQmU0ZDNYN2VCckZRWGRH?=
 =?utf-8?B?YnNOWllaK3BjUGNMV0F3TXJvd0p6SGVlUGtPYlJCS2g4Tm9NYStzemVaeUhO?=
 =?utf-8?B?SGtHdDh3RjN2VXZpZ0RlcHA1VjZKRjkzczdZU2tLcW9sUTVDZ2MyZkdEY3ZN?=
 =?utf-8?B?MFI0L0JrSnc5aDg1UDlRVmJONFNzVEluVnhjZUtsU3R1OVhkWjR6ZDlHQ1Fp?=
 =?utf-8?B?alI1OEtZOEsvRmN0Smx5aGo0TmZjQmtjNW5pVWdnZ0xkWEVXeHQyQ3IvRDBQ?=
 =?utf-8?B?V080SE5NUEV2RTl4OHljbUozSmdUVDlUZkdQZzFqaFpGVGlPQjRERGxXUDhu?=
 =?utf-8?B?ZzVnZ0YxYUdHcUZPNWlBZGp6STk3Z1ZSTjRhT3hSR1JIanlGUDU1aUVWWmVX?=
 =?utf-8?B?Uy9MU2JCczdFWGd0OTYvSzEzQ1lLeC9mVXRoTGYzYzJTUjBIVjJickVVQnA3?=
 =?utf-8?B?blhNTFFIcjZ1TVNtWDlUSVloVnZpSmxqbVlyTzJmNlExNGJXaFZUcjhZTGVQ?=
 =?utf-8?B?TlAwYWxRZmZIbytDS04vMVNscy9ETEM2WnBNVHBZVWNKSndSbGQzZzZnSXJF?=
 =?utf-8?B?dmhXMWpDT0hzOWtTanU0ZG5FZjBhK0FNQ2NoODg4NXhHSnNLaFI4VjAwc0dk?=
 =?utf-8?B?a0lCUTNUa3hXcmMrbCtMY1BQbnl0ZlJmNi9Xd3dxU2Y2TkVoMGtDMytLWWFN?=
 =?utf-8?B?aWZObFJKd25IS0UwZmk2R2g2RUc4UmVzZGlmTjhFZ0w0NzJnZU1BbjY2NUJ4?=
 =?utf-8?B?MDJmektoQi9ucVpYOFhnUDJZOUsreUI2Qm9VT2ZYRW9jaTcxcmxESFZ4dWk0?=
 =?utf-8?B?QThDWFVPc09rNk0yTzhIRGJ5YUV1dFFlb1FBanZSR01VOEpiOTF0RURkaG5z?=
 =?utf-8?B?OTg3RlVPV0ZFSkFhaFJ0T1NzTVU0SHowZnZ6RXN2clFJSGlQbElvYnRQdFJa?=
 =?utf-8?B?REJxZ291bmJyTHU3L1lZWnlzcG1LdlMwdGpESHo5MElDeHF2TjdyRGErb3lr?=
 =?utf-8?B?V2g4clc1OC9OR25PN25wdjRJRU50RFR0UnVFdWJpeTNGNlhtNDVBckpMYlpY?=
 =?utf-8?B?TkZNbmpqN2krVFU2SE9vMVZqRUNYb1FiM2xwNnFMd3RIaVcvUVFNVkhEQy9v?=
 =?utf-8?B?M3Z3RTlxN3lHOWlaZWkyTEhPN0Urd0kwVmNsV3FXeTBkbGxhQldabDRHWi9y?=
 =?utf-8?B?MVJrYlZCZVJPWjlnblUxbHdpajUvNU5WeWZ2U2VleXl0WUtiR20wYjFCNi90?=
 =?utf-8?B?bXZxeW5IdUxSeWNMN3Uzb3BiYkJPWmZ2dDdBRlFYUWpHcXNzeHVYMjdLckQ3?=
 =?utf-8?B?c0pSRzg3ZVlJOFZxaGRSbGNmbXZIcDk1SDBob09xajdqZW1EWS9US01FNTM4?=
 =?utf-8?B?MmlWdDhZMzgwb3pTazhUeGQxVENuSkpMTlNDa0NINWRtV0xmNmovRTAvb2pn?=
 =?utf-8?B?VmpoNkgxdVJ0dWRSOXowR055ZDRHY2prU1BYanNHWCttWHFxNy9MREthcHUy?=
 =?utf-8?B?SmZZV2psUnhXN2ZXM2lLdThlUU01QUdDTW0zeVBFdnlKSkNIYXBPRzlEM3RC?=
 =?utf-8?B?UG1HOU80UTg5SWVqVnhzNlhacjVSdHhjVTJHY1ZEWC9GL3hMOGo5V2Q1a1Jt?=
 =?utf-8?Q?2tHxrX40rHvx8H5HUOApxjqH7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c04a5bb-0ffd-4295-734f-08dac1c1c834
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 19:45:26.1044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ApwxW6GCy+yd30TcIoFm6DchwRhEXE5wfI2dhLIAhmkpOHQtXYKMakBktaXAJ5lU8ppVYVdN/l0+Imk2CmJVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5319
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, jun.lei@amd.com, christian.koenig@amd.com,
 bilbao@vt.edu
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/7/22 09:37, Carlos Bilbao wrote:
> Correct descriptions of two last fields of enum pipe_split_policy, updating
> comments with proper field names.
> 
> Signed-off-by: Carlos Bilbao <carlos.bilbao@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/dc/dc.h | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
> index bfc5474c0f4c..277631a899d8 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> @@ -457,15 +457,16 @@ enum pipe_split_policy {
>  	MPC_SPLIT_DYNAMIC = 0,
>  
>  	/**
> -	 * @MPC_SPLIT_DYNAMIC: Avoid pipe split, which means that DC will not
> +	 * @MPC_SPLIT_AVOID: Avoid pipe split, which means that DC will not
>  	 * try any sort of split optimization.
>  	 */
>  	MPC_SPLIT_AVOID = 1,
>  
>  	/**
> -	 * @MPC_SPLIT_DYNAMIC: With this option, DC will only try to optimize
> -	 * the pipe utilization when using a single display; if the user
> -	 * connects to a second display, DC will avoid pipe split.
> +	 * @MPC_SPLIT_AVOID_MULT_DISP: With this option, DC will only try
> +	 * to optimize the pipe utilization when using a single display;
> +	 * if the user connects to a second display, DC will avoid pipe
> +	 * split.
>  	 */
>  	MPC_SPLIT_AVOID_MULT_DISP = 2,
>  };

