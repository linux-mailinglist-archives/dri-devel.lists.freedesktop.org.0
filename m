Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD57E689C40
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 15:53:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DAF810E7A8;
	Fri,  3 Feb 2023 14:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F3D10E04B;
 Fri,  3 Feb 2023 14:52:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FyIXVaQJVaPIeTmMlSiGM6W+UXIJ91FVvcqyNk/9fiv2p2GNTfC7qD2aFnqBTuwejT0gXxODMkLRVqmRB7gODPpqGvaopNGdd8+ULcZFD1XLyps3Ft7/mN99wRXzfOrlV0TPSnQv49hAYKuzx+DJdq2kgdrhsnvVV4TeiVWo1t4zQnuDZrj7FXEJi89j/hDw6KqpjwyItS8mHFlwEjJctyTV+ZyZC1HaXyChZaoYMDOz150uUHrlcP7HAbrGbhDLbxTQIzMs3JtNgto3mWuY9scdp+JY9dP5a85t1R+wMM+kY3WI4/2N3I8+M2rrEt1sbIUXX2QiUBNPKM8yNX9+ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Hu2P0Km5WL5IhyqCpxT1mmMWbpdHRg/u74fbeFo+DY=;
 b=HUoExtX5BZ5n+7YP5lA9fgiS3Deu+iiX6OsIYeLcbcYR6nSzOIfK920hcVri6KINagCCJY9UKqBWnk3lgBrY/VrBTTPHbT33dBPzkp5h5Onpvle1x1L7tNIE/ColELKFvDFAPHxfSsEtA/E5/jx3BNLlEvT7GEa/fWUXaGE7dsCVdnwdE+m9F01eyLWjxbNqP2KTxtlvJFqpNSf+H1Hh3iSobkc57IqCHckm9BRMWfdPJbpnQ4qpwcoHbJcB9m7MPcA/dGPw6qAmIYbv0Gg/QG7LDy3a+Di3SMapTMuver0EQk98C9UfJbgUg85JPXbmSoM0V8BnHxAeTSTr5p4ZEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Hu2P0Km5WL5IhyqCpxT1mmMWbpdHRg/u74fbeFo+DY=;
 b=siE9+EH9qTRKYdzeEJjnOfFACSBuMTwSnqrBzrUo0grEQ7HEAu3DRMsi/OaPTWaS/23db9XLH0AOR3z6FJZA8YFtmY1dXJFTmRdSWgJXjmPp794MeNtdQyJzjOzuUFNt3AMgxaNy9MjFy1Vcj3NV8nUHoIuMG72lZ/pxWeShBvY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM8PR12MB5431.namprd12.prod.outlook.com (2603:10b6:8:34::8) by
 CH3PR12MB8259.namprd12.prod.outlook.com (2603:10b6:610:124::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Fri, 3 Feb
 2023 14:52:54 +0000
Received: from DM8PR12MB5431.namprd12.prod.outlook.com
 ([fe80::b63d:60d7:923a:4ee9]) by DM8PR12MB5431.namprd12.prod.outlook.com
 ([fe80::b63d:60d7:923a:4ee9%5]) with mapi id 15.20.6064.031; Fri, 3 Feb 2023
 14:52:54 +0000
Message-ID: <ae924554-8cff-e7a8-f94e-c79650ac7ca7@amd.com>
Date: Fri, 3 Feb 2023 09:52:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Content-Language: en-US
To: Joshua Ashton <joshua@froggi.es>, dri-devel@lists.freedesktop.org
References: <20230203020744.30745-1-joshua@froggi.es>
 <20230203020744.30745-3-joshua@froggi.es>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230203020744.30745-3-joshua@froggi.es>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1P288CA0011.CANP288.PROD.OUTLOOK.COM (2603:10b6:b01::24)
 To DM8PR12MB5431.namprd12.prod.outlook.com
 (2603:10b6:8:34::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5431:EE_|CH3PR12MB8259:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ead9473-7156-43d7-0454-08db05f65462
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +c4awYhWxkNIL2/gHLnfGzSAxZu5bAdA0WGtX7qkICGqIcKeX9Yg582rk01U3hIACcQDPspqVEQfMrJ7gI8I/VZB/2I064Rfb/D2DtVu5hSEIakhqqlDQkmCg+0vSibsUUOJfxwUF18tVdAHlVq1ZYBGOitSPUtaaVv9JqNGQLA1+1Zc9MvnNeiIbt4CqT+w/9lppzfHm4fUoKZN0gfHqEpQG4kAnuBYOCQnl/9DXC+7FwB11q7SoMjEISydDsw9mVLA0yIm7O4lcd2eKIOgvqDEJ+XnlTQaH5gmS6oUy4sn7RZQPTAMNQEbfT/JIUqfGBw9TCSuU1vUKlvDOHRsxjn5EkRIKU1hCv9L/Qdjv/BXZkPI1FXArX5/OydkSaPb7UW/lgBDqvQC2iBi9lnD7HX6eEcJ6A39s13VXo0PuI3HUxwrRk3bcugzlybn4TKxG6tMVSiRsJTTWBZYPiC/6Gx8UbbL1Tj+r/ITG0SicunZFLK1curC2fZ4IymLnKaFCJlb5dKpDZHEb5famhkn49bRuhF1caqWD+Y8BUt7C+w6I3KXg7hHk/dWvpwmfPHBhM5x0I87fWCY07sv0tS/QWyRqUHdTc+OUsfyBAHd6MquDdjTT/jn9KoXRqe0k4JbSXyEiGtxauYhGKtMtCOd7NoJntHUwynEhNkrQUI7C5S4RmqxqdtYLJ+6LNjWWMWfdEWMJqg+sIOODw9zF/hlcCut8OJMvcdoedaelEmumZ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5431.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(396003)(366004)(39860400002)(346002)(451199018)(26005)(6512007)(6666004)(6506007)(36756003)(44832011)(316002)(53546011)(31696002)(6486002)(54906003)(86362001)(5660300002)(478600001)(2906002)(4326008)(83380400001)(66476007)(66899018)(66946007)(66556008)(31686004)(8936002)(8676002)(186003)(2616005)(41300700001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXM4UVY2UmRKcEQ4d2xTUVpBMTVNODNnTFduOFlIZjFnWmh2b3VkS2x5Ynh1?=
 =?utf-8?B?ZEY3aVNGQWZScjMwTU4ySmFQYmVOd0RXS0E4TkZvOFl4U1EyTm92ZjNnWUV0?=
 =?utf-8?B?Nm9ZWjlCcWk2N2s5RUlVS2J6QjRYRUZvUmJ6UlFldnUvbHEyclZENnNQcTRY?=
 =?utf-8?B?YWFlRUhuTGVESzhzUE5DT3doK3phck13WEdrb0lPSnU3Uy9xazd1MjNqNmFs?=
 =?utf-8?B?a0g1ZVo5Uk5EOG9RZnlvaFMxTGxOTG16d0ZRU2hJWDRYUE5ZMjFLT3U1bGF4?=
 =?utf-8?B?UWZRS0k4NGNBTlBJajdpMHRraG4vaGt4YzlMcjhJeWpNUTNVN2Y5NUFpbTN1?=
 =?utf-8?B?cURTQlJ5NjFkTnMydEZVQ2IxbDJFeGxKQzFGaGFpcXVWQVJLQ3l2MzhMNTJC?=
 =?utf-8?B?ZENCVmhQdmlZVXA5ZzllRHFpd1B4WHo1S0hkVldsZDB6V0JEUUgzcmZ1YmRE?=
 =?utf-8?B?SlpHWU5GZnBFWmpiK2JXUko0azRmQjZDM1JiZkcrd09kenlVV2UwdWc0Tm1E?=
 =?utf-8?B?YkdnN0FJWHRvSFc1eWR1UFd0aThzZXJ4WE1ibHRjazB5NFdZZGcvTnlFOS9N?=
 =?utf-8?B?T1dLMGRxbVpwL2M3c2l3MEl5UWpHSE1sR0E0YnlsaW0vZkJOVDlHb0NEQ3RI?=
 =?utf-8?B?dlBzN3k2VkFYT1hTNzJSU09WTEdTTGwvYUFyZ0FuNTNiWmxqRElrTG16aW5l?=
 =?utf-8?B?Rk83NTVWWTJwY2JrL1dUc3pkakZKcWxHZGU5RDNXT1NxZ0hYclNxV3ZlZ0ZD?=
 =?utf-8?B?R2dZVWtJR3NJZnlrejdMNUNIK3FNNmFnLzBkbW8yWGJxRHVodVhpVHhiN0g4?=
 =?utf-8?B?OXIxMnNSUnAyemxwZzFFS1RHTEtGOGJYODFBbG4zNVhQTjBDdWZXeU5PUTZI?=
 =?utf-8?B?R01jV1BWdFV0WmREMmkrTnRWcWVidW5LZXoyRE91cERISFcrcVAvUUp2Rit3?=
 =?utf-8?B?bVJTZDhtUFhGTUFXdDBKdzVKaEU4VU1vOE9ZV2VJSWgrSDV0SXdMcGloY2lN?=
 =?utf-8?B?bU9JZGpLc1BSVkNyOGlKam5pKzBjdERtNjNjOG9FV2JYNVlmb2VDaFlFNEwz?=
 =?utf-8?B?NzRNaUFFWGRBTVVvbzdFOWcrUDFoencyWmFLVmsrUkk2VUJDcFg3dXZEamRn?=
 =?utf-8?B?WFV2MUFYdGFSc2VYRUwzV0h6bFdvMTdCeU9TQnBQTlFKYlJQaVJzcW5KV1VH?=
 =?utf-8?B?VXhUSVFua2FOcmZEMFZZNUNaNWExeXRaelNNUHByTzhxTEkvcFhMN1A3elc5?=
 =?utf-8?B?eW84bXlydko2bkl4NXpRbHV5L2RIZFJMbFZWUTlqdjFEbFFCcncrY2RQUGxi?=
 =?utf-8?B?S0ZXNjhXc09Mc0szR1lRTW8rY3hzWTZVVVZHWk5XcjY4K2d4RmUzaXdqdi9h?=
 =?utf-8?B?SEpoTElsRG9iUS9CcXhRTTNLWSs5K2s1RXg3ZHF1QUlXajFJcS9tSFZrZHF4?=
 =?utf-8?B?VE5VdG5XUktCd1A0M2lzTTlVbEZKTjhNK243MEhnWm1oYldxY3lkaFg5cEtP?=
 =?utf-8?B?b2dCc01oai9ScFpRY2N3dzRXRUhqaE1MYVVEZjcvRERDVnF0RlhUWnQvK1BF?=
 =?utf-8?B?eTZTZEd6RDFFSmhXYm9VbUdCQkJlWEtxSVJ6akxEV0xkM1NWTCtsb2RXdVdI?=
 =?utf-8?B?QTVlTVp4T1llbzIrcWZwSS9zb2V0ZnhLQ1ZMcmJYTE9TVjJPZzhaa2MxVG1s?=
 =?utf-8?B?aDUxSEtpRjNRMjV1ZmpXbldObGp3N1IxRUpZaEE2Z01YejlSeTZmdVFOU0Iz?=
 =?utf-8?B?bU4wNldLU2pHeW42YmE1YWYrcnJRaDRCMjk2cFlrZFNoOElKa3ZuRFJNT3cz?=
 =?utf-8?B?Y1JSRkxOZDd6a0ZidkRKMCtPaG5oY01aMFdLQnFCNUFmYWI4eElaRVJnUFh3?=
 =?utf-8?B?YVM0WWZZSHBKNWl2cFpqV25iRmRKb3JsbWc0VExlc1RHdnpJaFNrY2dMU0lY?=
 =?utf-8?B?ZzY5eVBBQ0hSS2h3blVXZEFxM0crUE5VdmlEMlY3S1M3TzMxay9kRlJFRWE4?=
 =?utf-8?B?QzJxOGFNS2VJZ3R6TWdUVStZM0xkSDFrbzMraGF4YWJ0ZzAyR1FjUmRKaXdN?=
 =?utf-8?B?MzVvZ2R1UnFvYlU1T05lbDQxQnluU0s4RWh1eEprakxnemJRajErQTJPclpC?=
 =?utf-8?Q?PrHF+6EkyipmUoOHn/E1eFTD5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ead9473-7156-43d7-0454-08db05f65462
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5431.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 14:52:54.0110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5MSUqFtYcFyXoRZs3vCEXxrAG8eQX+TUMfMKdOnYGcIobd36Ar86rA3LpWj6EL4ewsj2cf9rkAuOiX4Wp1YxQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8259
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 amd-gfx@lists.freedesktop.org, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/2/23 21:07, Joshua Ashton wrote:
> Userspace has no way of controlling or knowing the pixel encoding
> currently, so there is no way for it to ever get the right values here.
> 
> When we do add pixel_encoding control from userspace,we can pick the
> right value for the colorimetry packet based on the
> pixel_encoding + the colorspace.
> 
> Let's deprecate these values, and have one BT.2020 colorspace entry
> that userspace can use.
> 

Would be good to do the same for the other entries as well but those
are a bit more ambiguous since there are no clear _RGB variants and
the intention seems to be to use _DEFAULT for RGB.

> Note: _CYCC was effectively 'removed' by this change, but that was not
> possible to be taken advantage of anyway, as there is currently no
> pixel_encoding control so it would not be possible to output
> linear YCbCr.
> 
> Signed-off-by: Joshua Ashton <joshua@froggi.es>
> 
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Vitaly.Prosyak@amd.com
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: dri-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> ---
>  drivers/gpu/drm/display/drm_hdmi_helper.c |  9 ++++-----
>  drivers/gpu/drm/drm_connector.c           | 12 ++++++------
>  drivers/gpu/drm/i915/display/intel_dp.c   | 20 +++++++++-----------
>  include/drm/drm_connector.h               | 19 ++++++++++---------
>  4 files changed, 29 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
> index 0264abe55278..c85860600395 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
> @@ -99,8 +99,7 @@ EXPORT_SYMBOL(drm_hdmi_infoframe_set_hdr_metadata);
>  #define HDMI_COLORIMETRY_OPYCC_601		(C(3) | EC(3) | ACE(0))
>  #define HDMI_COLORIMETRY_OPRGB			(C(3) | EC(4) | ACE(0))
>  #define HDMI_COLORIMETRY_BT2020_CYCC		(C(3) | EC(5) | ACE(0))
> -#define HDMI_COLORIMETRY_BT2020_RGB		(C(3) | EC(6) | ACE(0))
> -#define HDMI_COLORIMETRY_BT2020_YCC		(C(3) | EC(6) | ACE(0))
> +#define HDMI_COLORIMETRY_BT2020			(C(3) | EC(6) | ACE(0))

These definitions might still be useful to a driver that is populating
the infoframe. But since they're currently unused I have no strong
objection to removing them.

If we're dropping them should we also drop the _CYCC variant?

>  #define HDMI_COLORIMETRY_DCI_P3_RGB_D65		(C(3) | EC(7) | ACE(0))
>  #define HDMI_COLORIMETRY_DCI_P3_RGB_THEATER	(C(3) | EC(7) | ACE(1))
>  
> @@ -113,9 +112,9 @@ static const u32 hdmi_colorimetry_val[] = {
>  	[DRM_MODE_COLORIMETRY_SYCC_601] = HDMI_COLORIMETRY_SYCC_601,
>  	[DRM_MODE_COLORIMETRY_OPYCC_601] = HDMI_COLORIMETRY_OPYCC_601,
>  	[DRM_MODE_COLORIMETRY_OPRGB] = HDMI_COLORIMETRY_OPRGB,
> -	[DRM_MODE_COLORIMETRY_BT2020_CYCC] = HDMI_COLORIMETRY_BT2020_CYCC,
> -	[DRM_MODE_COLORIMETRY_BT2020_RGB] = HDMI_COLORIMETRY_BT2020_RGB,
> -	[DRM_MODE_COLORIMETRY_BT2020_YCC] = HDMI_COLORIMETRY_BT2020_YCC,
> +	[DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1] = HDMI_COLORIMETRY_BT2020,
> +	[DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2] = HDMI_COLORIMETRY_BT2020,
> +	[DRM_MODE_COLORIMETRY_BT2020] = HDMI_COLORIMETRY_BT2020,
>  };
>  
>  #undef C
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 61c29ce74b03..58699ab15a6a 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1029,11 +1029,11 @@ static const struct drm_prop_enum_list hdmi_colorspaces[] = {
>  	/* Colorimetry based on IEC 61966-2-5 */
>  	{ DRM_MODE_COLORIMETRY_OPRGB, "opRGB" },
>  	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
> +	{ DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1, "BT2020_DEPRECATED_1" },
>  	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_RGB, "BT2020_RGB" },
> +	{ DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2, "BT2020_DEPRECATED_2" },
>  	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
> +	{ DRM_MODE_COLORIMETRY_BT2020, "BT2020" },
>  	/* Added as part of Additional Colorimetry Extension in 861.G */
>  	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
>  	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER, "DCI-P3_RGB_Theater" },
> @@ -1054,7 +1054,7 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
>  	/* Colorimetry based on SMPTE RP 431-2 */
>  	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
>  	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_RGB, "BT2020_RGB" },
> +	{ DRM_MODE_COLORIMETRY_BT2020, "BT2020" },

Above we've made the old _YCC value the new, non-deprecated BT2020
entry, but here you're using the _RGB one for that. Would it make
sense to make the old _YCC value deprecated and use the _RGB value
for the new, non-deprecated BT2020 variant?

I guess I'd like to avoid userspace having to pass in a different
value for DP or HDMI.

Harry

>  	{ DRM_MODE_COLORIMETRY_BT601_YCC, "BT601_YCC" },
>  	{ DRM_MODE_COLORIMETRY_BT709_YCC, "BT709_YCC" },
>  	/* Standard Definition Colorimetry based on IEC 61966-2-4 */
> @@ -1066,9 +1066,9 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
>  	/* Colorimetry based on IEC 61966-2-5 [33] */
>  	{ DRM_MODE_COLORIMETRY_OPYCC_601, "opYCC_601" },
>  	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
> +	{ DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1, "BT2020_DEPRECATED_1" },
>  	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
> +	{ DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2, "BT2020_DEPRECATED_2" },
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index c9be61d2348e..1aa5dedeec7b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1763,14 +1763,12 @@ static void intel_dp_compute_vsc_colorimetry(const struct intel_crtc_state *crtc
>  	case DRM_MODE_COLORIMETRY_OPYCC_601:
>  		vsc->colorimetry = DP_COLORIMETRY_OPYCC_601;
>  		break;
> -	case DRM_MODE_COLORIMETRY_BT2020_CYCC:
> -		vsc->colorimetry = DP_COLORIMETRY_BT2020_CYCC;
> -		break;
> -	case DRM_MODE_COLORIMETRY_BT2020_RGB:
> -		vsc->colorimetry = DP_COLORIMETRY_BT2020_RGB;
> -		break;
> -	case DRM_MODE_COLORIMETRY_BT2020_YCC:
> -		vsc->colorimetry = DP_COLORIMETRY_BT2020_YCC;
> +	case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1:
> +	case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2:
> +	case DRM_MODE_COLORIMETRY_BT2020:
> +		vsc->colorimetry = vsc->pixelformat == DP_PIXELFORMAT_RGB
> +			? DP_COLORIMETRY_BT2020_RGB
> +			: DP_COLORIMETRY_BT2020_YCC;
>  		break;
>  	case DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
>  	case DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER:
> @@ -3043,9 +3041,9 @@ intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
>  	switch (conn_state->colorspace) {
>  	case DRM_MODE_COLORIMETRY_SYCC_601:
>  	case DRM_MODE_COLORIMETRY_OPYCC_601:
> -	case DRM_MODE_COLORIMETRY_BT2020_YCC:
> -	case DRM_MODE_COLORIMETRY_BT2020_RGB:
> -	case DRM_MODE_COLORIMETRY_BT2020_CYCC:
> +	case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1:
> +	case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2:
> +	case DRM_MODE_COLORIMETRY_BT2020:
>  		return true;
>  	default:
>  		break;
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index eb4cc9076e16..42a3cf43168c 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -390,12 +390,13 @@ enum drm_privacy_screen_status {
>   *   opYCC601 colorimetry format
>   * @DRM_MODE_COLORIMETRY_OPRGB:
>   *   opRGB colorimetry format
> - * @DRM_MODE_COLORIMETRY_BT2020_CYCC:
> - *   ITU-R BT.2020 Y'c C'bc C'rc (linear) colorimetry format
> - * @DRM_MODE_COLORIMETRY_BT2020_RGB:
> - *   ITU-R BT.2020 R' G' B' colorimetry format
> - * @DRM_MODE_COLORIMETRY_BT2020_YCC:
> - *   ITU-R BT.2020 Y' C'b C'r colorimetry format
> + * @DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1:
> + * @DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2:
> + * @DRM_MODE_COLORIMETRY_BT2020:
> + *   ITU-R BT.2020 [R' G' B'] or
> + * 	 ITU-R BT.2020 [Y' C'b C'r] or
> + *   ITU-R BT.2020 [Y'c C'bc C'rc] (linear)
> + *   colorimetry format
>   * @DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
>   *   DCI-P3 (SMPTE RP 431-2) colorimetry format
>   * @DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER:
> @@ -420,9 +421,9 @@ enum drm_colorspace {
>  	DRM_MODE_COLORIMETRY_SYCC_601,
>  	DRM_MODE_COLORIMETRY_OPYCC_601,
>  	DRM_MODE_COLORIMETRY_OPRGB,
> -	DRM_MODE_COLORIMETRY_BT2020_CYCC,
> -	DRM_MODE_COLORIMETRY_BT2020_RGB,
> -	DRM_MODE_COLORIMETRY_BT2020_YCC,
> +	DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1,
> +	DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2,
> +	DRM_MODE_COLORIMETRY_BT2020,
>  	/* Additional Colorimetry extension added as part of CTA 861.G */
>  	DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65,
>  	DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER,

