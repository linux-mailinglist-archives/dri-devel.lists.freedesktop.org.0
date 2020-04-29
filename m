Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C05961BE673
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 20:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0356EAD9;
	Wed, 29 Apr 2020 18:43:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060.outbound.protection.outlook.com [40.107.236.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0986EAD9;
 Wed, 29 Apr 2020 18:43:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CKcRg0zEXO/5fJbdF8MMq8gpZJtgMUD3+dDtoiHK87IVGuOVehaK3PZIUbeNia4mw9uhfkNAO+1Mq0+kfuvp25COx5yUKdnwg5TT4nFn77Cs3xRieedZKRoi8oJL9JE32/ONhm+78hSKCG/ZB3SP0kYpCJGhQSaXA1tLr/K15wbt/ub5DiP70bMbCIXrtm00/j9vR27VtBnYy2stZUkrvchko/yDWZnwvlo8EEY0nXGaHKngViJ4oGAR3wahPJTVrsLSsOrjoREoyGqbcOJxFjmhElSTH6Gu00QH0V4rrUFZATdO8fb4I0pLV7XY0aMBH5bsJ+DLXfg1d65nukAQIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VodITdRbE1GEssDsqZY1xv24CuPTRYSoVV+3OVTvGlg=;
 b=OiDOf/2IIY8n7fjxPXEApDBeDeNUkBym/y7w0S7tXvLADYSn9pYyPr6Z4etwlPMC9XAFYfjsUg68d2ZfgNMb0RtEjKsHFgiA2xtuQGBeM0bPMBDKtGkD5K6Hae3n92sxt7XR8W/9FWAzahsytnyU2Vip6hf+5E1sP1A8XWnjCWZHx7rkPLoGYi0YyGL8rx7dR/3xneEfyQiXbzXiQDXv9zHxNKk758SAbbhXtRspSH00Gk4ct+TO8D+qoxClPjQx05tfXhmWGi7/ZlfK9QQXgKeAoJNtmQoWTpj85vS9wtcUZ9BUP0ieTie+CSwXepo4fYwnuTqH8vX8ZjZX2AvE3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VodITdRbE1GEssDsqZY1xv24CuPTRYSoVV+3OVTvGlg=;
 b=3q7SnJZVzN/rzsdwqwo+wELL2gsumGYzEtSctM/iXbzXe/NyvFhmPnQ3aSd0Xbljeh/Od0G57hG+BgCrWuemVOBOSr+DyJWyu4Ym46hsMwNJ6I4ICJSrzpx6lecYPfzIrOORzmmXj346dZIpFHQuQc9jFRofWQivsKmO0qejJVc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MW3PR12MB4393.namprd12.prod.outlook.com (2603:10b6:303:2c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Wed, 29 Apr
 2020 18:43:13 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::31b7:9b4e:3f37:5e97]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::31b7:9b4e:3f37:5e97%7]) with mapi id 15.20.2958.020; Wed, 29 Apr 2020
 18:43:12 +0000
Subject: Re: [PATCH] drm: Correct DP DSC macro typo
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20200429184142.1867987-1-Rodrigo.Siqueira@amd.com>
From: Harry Wentland <hwentlan@amd.com>
Autocrypt: addr=hwentlan@amd.com; keydata=
 mQENBFhb4C8BCADhHHUNoBQ7K7LupCP0FsUb443Vuqq+dH0uo4A3lnPkMF6FJmGcJ9Sbx1C6
 cd4PbVAaTFZUEmjqfpm+wCRBe11eF55hW3GJ273wvfH69Q/zmAxwO8yk+i5ZWWl8Hns5h69K
 D9QURHLpXxrcwnfHFah0DwV23TrD1KGB7vowCZyJOw93U/GzAlXKESy0FM7ZOYIJH83X7qhh
 Q9KX94iTEYTeH86Wy8hwHtqM6ySviwEz0g+UegpG8ebbz0w3b5QmdKCAg+eZTmBekP5o77YE
 BKqR+Miiwo9+tzm2N5GiF9HDeI2pVe/egOLa5UcmsgdF4Y5FKoMnBbAHNaA6Fev8PHlNABEB
 AAG0J0hhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPokBNwQTAQgAIQUC
 WFvgLwIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRAtWBXJjBS24xUlCAC9MqAlIbZO
 /a37s41h+MQ+D20C6/hVErWO+RA06nA+jFDPUWrDJKYdn6EDQWdLY3ATeAq3X8GIeOTXGrPD
 b2OXD6kOViW/RNvlXdrIsnIDacdr39aoAlY1b+bhTzZVz4pto4l+K1PZb5jlMgTk/ks9HesL
 RfYVq5wOy3qIpocdjdlXnSUKn0WOkGBBd8Nv3o0OI18tiJ1S/QwLBBfZoVvfGinoB2p4j/wO
 kJxpi3F9TaOtLGcdrgfghg31Fb48DP+6kodZ4ircerp4hyAp0U2iKtsrQ/sVWR4mbe3eTfcn
 YjBxGd2JOVdNQZa2VTNf9GshIDMD8IIQK6jN0LfY8Py2uQENBFhb4C8BCAC/0KWY3pIbU2cy
 i7GMj3gqB6h0jGqRuMpMRoSNDoAUIuSh17w+bawuOF6XZPdK3D4lC9cOXMwP3aP9tTJOori2
 8vMH8KW9jp9lAYnGWYhSqLdjzIACquMqi96EBtawJDct1e9pVgp+d4JXHlgIrl11ITJo8rCP
 dEqjro2bCBWxijsIncdCzMjf57+nR7u86SBtGSFcXKapS7YJeWcvM6MzFYgIkxHxxBDvBBvm
 U2/mAXiL72kwmlV1BNrabQxX2UnIb3xt3UovYJehrnDUMdYjxJgSPRBx27wQ/D05xAlhkmmL
 FJ01ZYc412CRCC6gjgFPfUi2y7YJTrQHS79WSyANABEBAAGJAR8EGAEIAAkFAlhb4C8CGwwA
 CgkQLVgVyYwUtuM72Qf+J6JOQ/27pWf5Ulde9GS0BigA1kV9CNfIq396TgvQzeyixHMvgPdq
 Z36x89zZi0otjMZv6ypIdEg5co1Bvz0wFaKbCiNbTjpnA1VAbQVLSFjCZLQiu0vc+BZ1yKDV
 T5ASJ97G4XvQNO+XXGY55MrmhoNqMaeIa/3Jas54fPVd5olcnUAyDty29/VWXNllUq38iBCX
 /0tTF7oav1lzPGfeW2c6B700FFZMTR4YBVSGE8jPIzu2Fj0E8EkDmsgS+nibqSvWXfo1v231
 410h35CjbYDlYQO7Z1YD7asqbaOnF0As+rckyRMweQ9CxZn5+YBijtPJA3x5ldbCfQ9rWiTu XQ==
Message-ID: <0e307646-89a1-9bea-9841-372cd0e23310@amd.com>
Date: Wed, 29 Apr 2020 14:43:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200429184142.1867987-1-Rodrigo.Siqueira@amd.com>
Content-Language: en-US
X-ClientProxiedBy: BN6PR19CA0091.namprd19.prod.outlook.com
 (2603:10b6:404:133::29) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:9240:c66::3] (2607:fea8:9240:c66::3) by
 BN6PR19CA0091.namprd19.prod.outlook.com (2603:10b6:404:133::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Wed, 29 Apr 2020 18:43:10 +0000
X-Originating-IP: [2607:fea8:9240:c66::3]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d7539e0a-2548-4b19-1f06-08d7ec6d2b9c
X-MS-TrafficTypeDiagnostic: MW3PR12MB4393:|MW3PR12MB4393:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR12MB43939EE2BB9AEFBF31CA664D8CAD0@MW3PR12MB4393.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 03883BD916
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(316002)(2616005)(36756003)(66556008)(6636002)(5660300002)(66946007)(110136005)(66476007)(6486002)(16526019)(31696002)(186003)(2906002)(53546011)(8936002)(52116002)(8676002)(31686004)(4326008)(478600001)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UMZifQKiovqkUXlAtNevi37IL0lsSgWVymeHVW5nnxn2zd4p6vlGIMkOCcVCVe4giFoVa5EA2jh0sF4yFxZwKwMzH4FkYA5HhglifEJPR+ThZcs8VUX/f5oqhQKowM9c2Ru8K4VXIdrJRVX9Bheye8gNfsfarSKXz6A06SNZ2WrizXCW4jeWQ1xd74zb0kUMS7z1H8/wZYoh+MiCDH24zf3XmISWAMjKAkkn7724vRSqoYMT+aRNoUhj2ZnwMpoK++DfprzEXGufHaEM+9gqc5+QXQkProZ9Bna4rM7yYGQKc12OfpJ3PpHLe71hxf4PZsSPsKPS8vSIHf0tzf3XmewQXtV+OKcsPulSzSKB+ZA0ygKnTgNxNschWwg/urqQIlNARKvHexUvGaAJAORKkANKX/MA6G1tol12gMO3FuWtuXvc98qkwKYLsUFgADb7PoeJmZBCOprRAJ3M4b7eEggdavRFoC/ToDravgxLcP4=
X-MS-Exchange-AntiSpam-MessageData: m016P9xWSDfEsYDkgeGPpE38GVWqh9wetZtM7vZSpbtXn9HlvhK1+/iP3oKiZv45eTy4F7cCd4BgaG2aJo8DztedRJNYTiD6YXhGBWc95oyH72PGH6HHE0TjVzAIdpVLiZhW8ap5fKWcyJgHfGLZ3ALvQJ9cl5Ci7oEk66qg1rPnTNaDBG1n7IzsfCdl3xplRE8KET9QD+ClpaMxrFQm0sHRQag6LzbscJXUqVat9o1DbjCNxMuSXEK4UVCC4pq30JhlHjxrWoL7Ge2MUWpZ48/mlL0JxsDH7SzXhVKPOi+RnMJx/TDg+5mVwRqgzrM91Poy8kY4nAipI2/Ad7qTWTMf88mhy8L3yh5MlBTyOPAfBz5NnjCk74GhjidkeJYX9GH8nUYAATXwRpbb61ZBCHO86y86XvOa6jRGH2Cm0751Gz96hjUxrJ8N69umC0EqWtL+QG+R8XzFjIMKEXIYFyrbtUXef0aHl/sT/+DesjRNj+K+jQ+T4SrBadvY/XKvK8menbSd/DtYWNSf+aKfoJO5BcB2DEGNPTpEa+hW2j+BnLllKS7aRXNmoas88jQYuQuF6RXoP6eaQ9vVszhlwtNPmu25afg97enDcSYL+yBQiu9LEIEw8xIJbGt1IBWP292SKBQgxod2iFh/Cbn2fBWn/w7fZSQalCpjSnxQsXnlz10nBoV0lXrbNePc/gObBcrMUD9jWXqbjPjaqMFq91d9UZe97TK5Gumg/HgJABOewTGyjIm4OXrD4CCTFOkRBsA5hy6+XQhedFbBx4l2f279gi5nymxbD4QauPJPVctko/2KkMaU3lxvgkLAgkzn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7539e0a-2548-4b19-1f06-08d7ec6d2b9c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2020 18:43:12.6045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJ/ZlWin0BdbWzFfNofklou5HRkwk3GUernh1SRqmSDEkD4W0Wk9nh01v5F2gHlrZXjqd1qNaOpDL/xgeZpZqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4393
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-04-29 2:41 p.m., Rodrigo Siqueira wrote:
> In the file drm_dp_helper.h we have a macro named
> DP_DSC_THROUGHPUT_MODE_{0,1}_UPSUPPORTED, the correct name should be
> DP_DSC_THROUGHPUT_MODE_{0,1}_UNSUPPORTED. This commits adjusts this typo
> in the header file and in other places that attempt to access this
> macro.
> 
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c | 2 +-
>  include/drm/drm_dp_helper.h                 | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
> index 87d682d25278..0ea6662a1563 100644
> --- a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
> +++ b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
> @@ -129,7 +129,7 @@ static bool dsc_line_buff_depth_from_dpcd(int dpcd_line_buff_bit_depth, int *lin
>  static bool dsc_throughput_from_dpcd(int dpcd_throughput, int *throughput)
>  {
>  	switch (dpcd_throughput) {
> -	case DP_DSC_THROUGHPUT_MODE_0_UPSUPPORTED:
> +	case DP_DSC_THROUGHPUT_MODE_0_UNSUPPORTED:
>  		*throughput = 0;
>  		break;
>  	case DP_DSC_THROUGHPUT_MODE_0_170:
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index c6119e4c169a..fd7ac8f15004 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -292,7 +292,7 @@
>  #define DP_DSC_PEAK_THROUGHPUT              0x06B
>  # define DP_DSC_THROUGHPUT_MODE_0_MASK      (0xf << 0)
>  # define DP_DSC_THROUGHPUT_MODE_0_SHIFT     0
> -# define DP_DSC_THROUGHPUT_MODE_0_UPSUPPORTED 0
> +# define DP_DSC_THROUGHPUT_MODE_0_UNSUPPORTED 0
>  # define DP_DSC_THROUGHPUT_MODE_0_340       (1 << 0)
>  # define DP_DSC_THROUGHPUT_MODE_0_400       (2 << 0)
>  # define DP_DSC_THROUGHPUT_MODE_0_450       (3 << 0)
> @@ -310,7 +310,7 @@
>  # define DP_DSC_THROUGHPUT_MODE_0_170       (15 << 0) /* 1.4a */
>  # define DP_DSC_THROUGHPUT_MODE_1_MASK      (0xf << 4)
>  # define DP_DSC_THROUGHPUT_MODE_1_SHIFT     4
> -# define DP_DSC_THROUGHPUT_MODE_1_UPSUPPORTED 0
> +# define DP_DSC_THROUGHPUT_MODE_1_UNSUPPORTED 0
>  # define DP_DSC_THROUGHPUT_MODE_1_340       (1 << 4)
>  # define DP_DSC_THROUGHPUT_MODE_1_400       (2 << 4)
>  # define DP_DSC_THROUGHPUT_MODE_1_450       (3 << 4)
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
