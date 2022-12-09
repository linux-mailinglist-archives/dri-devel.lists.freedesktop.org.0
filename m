Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1446E648A54
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 22:49:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27DBB10E589;
	Fri,  9 Dec 2022 21:49:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2081.outbound.protection.outlook.com [40.107.92.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E6010E037;
 Fri,  9 Dec 2022 21:49:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5fRiNQOw2YCOVf4dvUCcaKwZH4XplnZuwNaeoLDdW2Yh5EGp4MTqq1sbPkoANBk/jFyW5UVkhMJt3+P1LWwCGJt1gL9c0Jw48hNjtTSeAVbUJ5g0fzWbGOl/4XdQ7qDMuGsBiIY5+ovfLvS6rCyDs4mcHINZwTto7uAfgNqu6VNJy/MoCuEdQRRjgl9lZzztHYCATs9dtHkmqfY+x0D3/mojff8MN32crQqRpNSPdzdqeihofoiHEsDf/dmP1j2VjPKjTGxQx/TWwV+5v0OogJARordKqlPkt5uizRdCaPXsAzXhxlYGPhxEpTvXWzt0joHyi//1nLKgHbxcatR1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fru5K5cLl2VhRUhXJPh7wP9u1Au86V+XFDvm43mqzwg=;
 b=dclBH/Malpt+1stBGhBEpLiu9SV4K46LI8Y/aKD2w0cq1yXQJrwaWTPdfbk4aoYHVjAcc1NRmnuVBzaj70N7bE7pKNhhqLrzgdPNoKDTxhEWXXeD6iZzkiGBA4rqruoG4rUqXj89Li1OghCzexPj/fbWv3ycVVpeMLB2CqEPuUt85Oru9/4I9VHGTKKhOsHH+Sk1m0BvsBKXdHf/A8jNBVEg5kDpYNeogd80HID9G8kVoYWcrbXLAltSC2MNyRNGoeLn6qJCfg8uU7X5xDPgUebYEsoCpVEpte8M6dYnjk6BPsHLpWSwEorMsiud++/1wZI9EZ2sZUuDFZtp+4bXVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fru5K5cLl2VhRUhXJPh7wP9u1Au86V+XFDvm43mqzwg=;
 b=eGX6w+JLwxR34wljAeRyVn7WX7GLZ67naLMM+/RtwE10hA2DBCUX3TKxKZAl0HUM9aT78YlL5h1A0ZfLvxjOr61aSkNUzVym5DehIvxy70d9aRUQD8BgozcJPqvrNonm4hBbcstMIiNdkp7fHVBWeOR9Wb4nycX6sCykd3XKUw8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.16; Fri, 9 Dec
 2022 21:49:22 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::2d6a:70d0:eb90:9dca]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::2d6a:70d0:eb90:9dca%9]) with mapi id 15.20.5880.016; Fri, 9 Dec 2022
 21:49:21 +0000
Message-ID: <5a432652-3233-00ca-7f69-99beab752f77@amd.com>
Date: Fri, 9 Dec 2022 16:49:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] drm/display: Include missing DPCD definitions from DP2.0
 spec
Content-Language: en-US
To: Sung Joon Kim <Sungjoon.Kim@amd.com>, rodrigo.siqueira@amd.com,
 alexander.deucher@amd.com
References: <20221208192525.5763-1-Sungjoon.Kim@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20221208192525.5763-1-Sungjoon.Kim@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0056.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::13) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_
X-MS-Office365-Filtering-Correlation-Id: f278d563-67cf-4994-1981-08dada2f3aea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZnnrGl7BVosNNBL0jVJ7iqw0wIdMGU+Kpq+j0VvlecS8UcMozsJPJFW/s85JTKY42eNiJUt8/vwTt0pOMWX0DImolP7QKVgxWNDFv8Z389/VufEqv2g+RM5yl2OyQpqO1lREfVTOrdYbHWlV2C+hAgza9cA5BonQdrjxmGLKvDAarn6ZtVkwRB1wee36H1OEkVFa2aJ+fkCbuBCIaEh7ohuVKH/v+1jm92nJ5U0+bGlVr8BT2WB8YNtBG1hs1MKf38oFPdwDbzkJZnuqtkKXWJz5y17gdNzkCl4e5+p0EeeDaNLx/ozJyDjXQq0q4NcobpIuJu130KOcUypnqV49T+DZ1ZTFBa0wEgkDj3SBMDkOJ1HssPvksDdG57Uo+naDT5qdtTriif2AGRDQW/miPDV4If+YG8Di6oV9ea27zHdwcP7lVgeHgJx2qbcAytX4ko2lnvjJATPYn9oTXOz23cgTFmXiuMDqaWx/TgBgwPCnwQ/LdzRxKBoGGBknVUFheP+Bt0JBzZTaoWQiPTA5+lT/PiebnV89lII+eFJ4CWClhMLlrE3klnqo/jQfaEJofwjrAHiTbf67wRAlQ3LjxMzKw6vX9PEiPQlL9CN56GYOgV7xJkcXtr3p6sFs8COyuV6zgQC0L91xtacSJihdYBOe6ho6Za+m/wcAtrLN+47XTSV6hGqujBGDDWT+UyENHZIF5EAopRsi4eB9ZVOdJVzp5uNBasLM7KOsoJXBBC4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(366004)(39860400002)(396003)(346002)(451199015)(44832011)(31696002)(36756003)(2906002)(86362001)(2616005)(6506007)(6666004)(26005)(53546011)(478600001)(6486002)(186003)(6512007)(4326008)(41300700001)(316002)(5660300002)(66556008)(66946007)(38100700002)(6636002)(66476007)(8936002)(450100002)(8676002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDRDbEg4ZHRMS3doSFAvZTFabGpJK1ZIQWhBQnlrMmtObU1DZldacllSWnIz?=
 =?utf-8?B?TU9sTkhhVHE2bDdROGdHNjhFaUYxTjdnem9DTmo3dDN5aGdVZzFqSVE0ZDlI?=
 =?utf-8?B?enJyOTFYZUtHRm9ZQkhVd2pRMGtQL1AxdFZrZzJJdDNtU3ZXcXNnVHFZSTF5?=
 =?utf-8?B?UktrMTNja0lEWkN4bXEvY25PVWRlVDFGZFFoNTRmL21SNCtCS29hT2E2QXlG?=
 =?utf-8?B?ZEdNeGx4ZjFVUVZMQ0hLTUV2S1A0MWplcXExMW90MjhCd2NJNTdsaGZsd3VK?=
 =?utf-8?B?NGhKOE9YTXQ2eFJRMjc4K21QWXgvdXlJVGozdm9ncFF3VFBQc1pTSzFUZ1Bn?=
 =?utf-8?B?K0dlS0RzdHVQakJJT3JNM2dqY2tRaWlWUGkzUjZaR0xxa243QkxOMmg1TDFM?=
 =?utf-8?B?azRUT3JtR29pYitwOHNYeEdhcko0dG1lRElCTFNIOHBVYkVrTXRvNDZLMDVx?=
 =?utf-8?B?RUl2MmVCNzdreEZqbHZXWUE1TVRmWFFpTVE1aytGNFZnN0xkSGY3bUJHTlox?=
 =?utf-8?B?K09kV2RoclVKTGt0QmJrQ2t3U091Y1lyZU1PeWR0OTNvVUVaZThIMGJXQ0pj?=
 =?utf-8?B?aVBWckZZK21zSUNLUWlTdmxpWXc3WmdrUzlwYnBlSUlTZ3lFQ05vaWtOTmtS?=
 =?utf-8?B?aCsxMnY5Rit0L1A0ME5Dc3YwZHdkdWtJdklmS0s4QVE2alhyMDI2eVV4NkdV?=
 =?utf-8?B?d3NYblVONVY0UXlpZzM2MnNGRHM4QTZLMWlpaWVpSU44N3NlWWZNUzVPV3BX?=
 =?utf-8?B?cktzVUZySlJwZ0FzNCs4WWxodTBxeGJxakFFOXl3Z1kvcXUrWG5XN1ZVQ1JD?=
 =?utf-8?B?VUVoQkNyU3kvOStzdlB5TWppYW9Ec2NvZnQ0b0lvSkczS1NnZVM5L2s0OGcz?=
 =?utf-8?B?RENURWg1T0VKS3FYQWNha0xPMjFvSStvM255VXBiNENOblJPVnNKamREYzk0?=
 =?utf-8?B?aGFVRWxrZ1d1MllIU3NNaEpqa29DQXBvbGRvSkMwTnZteGlmOWwyZFNVcHE3?=
 =?utf-8?B?Y1gxQllMMFdxb1ZJTWdhanVyZG5HMGh4Q3BTaGcvcG42Tnp6aDJJMnNLWnZB?=
 =?utf-8?B?L2l5Q3hyQUZDQ1lscmE3aVY1N2UrVFJRZUJ3KzU3SGU3U1NyUVJjc2wzOHo3?=
 =?utf-8?B?RTNDRHdjaE10Q0FXNlk5ZWc4SStRWWRoNnl4Rk43Z1RJVXU4SW1lcU5jUG94?=
 =?utf-8?B?VXY1RzYvNG5lYWgxRTNzQVFnUGJFb2VEcC9ZT0gxMGIvMWNJYkE4V1JWWWRi?=
 =?utf-8?B?N1B4TlBsZXpIYlJEYmZsNDlmVGFpMjBQVUxTdXZVUW1HdEhNTXFkdEY0L1JW?=
 =?utf-8?B?NGxIdTNSc0hGMGQ4QVJyUkVFUGlnTVZsZjhFQ1RUSjBpVDJ1T3BjeGI4cEoz?=
 =?utf-8?B?NjQzWXVnT2UwMDZ4djFPYmJ5cVFFMUVBZGxLOUxpbExNNWVJZS9SVFRlTFQ4?=
 =?utf-8?B?UnBSUzYzbzF4R2RJazYvZzVyQWhvbnpjSTJXNFVMcVZuUEc2Q0lVRWcrQzB3?=
 =?utf-8?B?cTZHL2ZjcnRORENSL1VJUXY5azlaOFl1bWxRLy9WQW9nV0tTSVdZbnJ6MEpO?=
 =?utf-8?B?dmVRNyszYWdnelRlcHo2NjNpYno0SjZFalg4QjVDbFZSNkt2N082ekJNRFlK?=
 =?utf-8?B?RlJUYUNLbGltRjFpdUx6OVdlOFZoVnFwaStxdzN6OXVTZkRvMlVHVFlHUzFs?=
 =?utf-8?B?RVJUdVZHNjNCUnh0dG9JbFBtc3c5SnhtaUdhWXpGYzBJaDhjM0o1U3lld3Rl?=
 =?utf-8?B?ZXk4d09kZm9qTjQ1NTM5NFBEeDhGcmdCUWxOWUVkWnF0eXpwNmtpOVk3QkJN?=
 =?utf-8?B?aks2Rm5nQzNQUmpuZTZMVENScnJmaGhXWmVQT3kxS1p5cVFhUlVKekl5Rld4?=
 =?utf-8?B?WGxkSVJMdG9oeWEzVlVWN2YxR2JORVJVNktBVXFmYkttZjFzVml5WVVLUCsw?=
 =?utf-8?B?aWFhbmhXL2xzOHJjMnV0Q0ZrSGE4aW9wQ2lKc1pkQkFqUUYyZ0NueUJReG9Q?=
 =?utf-8?B?czUxQzl2TEw5S3A3MDl0ajBDeW5keis1Z2xPR2lRK3BwTTU2Sk80emZmRHBq?=
 =?utf-8?B?WGg2RzEwVU5ERmUvUmxybDFXdGdKQVdwQ0sxRkRYUnl6bGZZelVQMUwrRXZQ?=
 =?utf-8?Q?PCv8Zpzz1kp3DFNYxhI+srgNz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f278d563-67cf-4994-1981-08dada2f3aea
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 21:49:21.5115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9BtaqeSacenp8I+bR4sIAWR20iZr0Wd60gf4Aaw06IsHfk9PhACoMR4Ujq4qw4kDySgQD5mjFNQYGCv9sRThZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5427
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>, amd-gfx@lists.freedesktop.org,
 nikola.cornij@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The commit subject is very generic. A better one might be
"Add missing Adaptive Sync DPCD definitions"

On 12/8/22 14:25, Sung Joon Kim wrote:
> The missing DPCD defintions from DP2.0 spec is as follows:
> 
> DOWNSPREAD_CTRL (107h):
> 	ADAPTIVE_SYNC_SDP_EN (bit 6)
> 		For sink devices that support Adaptive-Sync operation
> 		and Panel Replay
> 
> DPRX_FEATURE_ENUMERATION_LIST_CONT_1 (2214h):
> 	ADAPTIVE_SYNC_SDP_SUPPORTED (bit 0)
> 		Bit to check sink device has Adaptive-Sync capability
> 	AS_SDP_FIRST_HALF_LINE_OR_3840_PIXEL_CYCLE_WINDOW_NOT_SUPPORTED (bit 1)
> 		A sink device that clears this bit will generate VSync pulse
> 		leading edge of the HDMI output on the line count at which
> 		Adaptive-Sync SDP is received as long as source device transmits
> 		Adaptive-Sync SDP either in first line or first 3840 pixel cycles
> 		of the line whichever occurs first.
> 	VSC_EXT_SDP_FRAMEWORK_VERSION_1_SUPPORTED (bit 4)
> 		Bit to check sink device has SDP framework version 1 capability
> ---
>  include/drm/display/drm_dp.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index 4d0abe4c7ea9..4f33b6aeb91e 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -603,6 +603,7 @@
>  
>  #define DP_DOWNSPREAD_CTRL		    0x107
>  # define DP_SPREAD_AMP_0_5		    (1 << 4)
> +# define DP_ADAPTIVE_SYNC_SDP_EN            (1 << 6)

We tend to stick with the naming from the spec to allow
people to find things more easily. Please change this to:
DP_FIXED_VTOTAL_AS_SDP_EN_IN_PR_ACTIVE

Harry

>  # define DP_MSA_TIMING_PAR_IGNORE_EN	    (1 << 7) /* eDP */
>  
>  #define DP_MAIN_LINK_CHANNEL_CODING_SET	    0x108
> @@ -1105,6 +1106,11 @@
>  # define DP_VSC_EXT_CEA_SDP_SUPPORTED			(1 << 6)  /* DP 1.4 */
>  # define DP_VSC_EXT_CEA_SDP_CHAINING_SUPPORTED		(1 << 7)  /* DP 1.4 */
>  
> +#define DP_DPRX_FEATURE_ENUMERATION_LIST_CONT_1         0x2214 /* 2.0 E11 */
> +# define DP_ADAPTIVE_SYNC_SDP_SUPPORTED    (1 << 0)
> +# define DP_AS_SDP_FIRST_HALF_LINE_OR_3840_PIXEL_CYCLE_WINDOW_NOT_SUPPORTED (1 << 1)
> +# define DP_VSC_EXT_SDP_FRAMEWORK_VERSION_1_SUPPORTED  (1 << 4)
> +
>  #define DP_128B132B_SUPPORTED_LINK_RATES       0x2215 /* 2.0 */
>  # define DP_UHBR10                             (1 << 0)
>  # define DP_UHBR20                             (1 << 1)

