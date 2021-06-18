Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 652173ACCB4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 15:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21ADD6EA15;
	Fri, 18 Jun 2021 13:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583A36EA10;
 Fri, 18 Jun 2021 13:48:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EjoZvpJUOIAKC7k0bZEpi13kmIemYE02uME0f49SxtefYy/x01JO+zI59KfFfxcb9knQQ0oc7LcC79QzPaCqRi4dW22wa4VDIVUVg26HEiB7CM6l7PG9syuhu9Fngiu6JIY9J/gLuSj3G9sW6dknX9ypTcoW+oLMFz4LqagIb5w8bWvdvDVXbUb0lqZq7lcXL62p8y6R2fbzyzduUTe87fNrzeRkLoHYk3oZbO9EecQU7BoOjx6rYBzYTb4r+kyZ/tFZrM3zjKev0uM9l6bpMciPrtvJjJB+snGMde8cTZyMZ4GOAjhFX8bcsw394JZ0nmmrn4a96/rV5Ms2KCeHFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHuzoNmrYIrbmD/sa951USCgpuCOWW13xzwVdQwZBRs=;
 b=QWdH4IKO9t7IQHpKpyT+soLhX0j72IW7aID0IgxCE2tX3vvS7B07gHcXJto9pd3BUjmd1vOOeeVZMbn5NyYunrmmM+P0inHXVdwppX/3LjyyL+yYARKX/OXfJN/mbGOuyh74uEbrkrJZTJz42RFdCcC1hvCKfaVpJIoAJodE6ofcWD7kNNa6KHam0WWH59RPlsEoxw8f2d4dR1/97/almg1Sn/pbo/dU9VeYIHBaeRPXF0DPLoZEczHpxDGp4xm3OZCdYnn84zyigp2UzOqEkUgdVyUxix+bYIKxyNhaSoCnTZZOJ0LvRQjliXZz7jzAI/evVGDv6t6pwYSylVyNdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHuzoNmrYIrbmD/sa951USCgpuCOWW13xzwVdQwZBRs=;
 b=yZFzYEYvCgH6tmCts4HPshzno2anNgTLb9cG5nrlIIv6GIBE5TANuHBdODRXpZEM/y5q0DFBsM8Sp5aUwRxi/1UJCtDeJ8A1YFqYvYW3GOsnBfSliPuRLQ4tAoQvjPJ4sBlyF7BvKc7E+6pN9y18lu1JL+vtP4Ywhf7LFhwRBu8=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5476.namprd12.prod.outlook.com (2603:10b6:303:138::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Fri, 18 Jun
 2021 13:48:43 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::401d:c7a2:6495:650b]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::401d:c7a2:6495:650b%3]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 13:48:43 +0000
Subject: Re: [PATCH] drm/amd/display: Remove the repeated dpp1_full_bypass
 declaration
To: Shaokun Zhang <zhangshaokun@hisilicon.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <1623979403-50239-1-git-send-email-zhangshaokun@hisilicon.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <f934cbe6-369d-a7ad-ac03-3c8dcc6526a2@amd.com>
Date: Fri, 18 Jun 2021 09:48:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <1623979403-50239-1-git-send-email-zhangshaokun@hisilicon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [198.200.67.154]
X-ClientProxiedBy: YQXPR0101CA0072.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::49) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.50.3] (198.200.67.154) by
 YQXPR0101CA0072.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:14::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend
 Transport; Fri, 18 Jun 2021 13:48:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8d594d1-ad4e-44c7-26c9-08d9325fc999
X-MS-TrafficTypeDiagnostic: CO6PR12MB5476:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR12MB5476F555766A0A7235119D908C0D9@CO6PR12MB5476.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bqSO02jc9jR56r+QNtv1hOMgyBRY4ta6n9r6AmvIs2ALPan8OHH/nerZ+cc3eZlGIACioKt/Ht5ZVfGvQmerDojPIXH+IaX4rtaiC5A/wjnLMq3QDZDlarEdnIyvZwsIPF9uumlk3AjOASF8KY7dZzDaUW5OF1+3vGqBumFHMJK0jA68uQsBqeoxzuRFtq9vweh34zSIxHHKB4UVlaNH57lTePOh7MNJBKo/58UI1Vc/vYC4ZTyPjMP/1TivjSs801hwyK5/REErhu41yWN1Ya375VZILuYsOhcaAKgNpigqD5dk0kavGMw0QqBEsUHLyl2DYoR2KWcOBy+TyBEgCOL6xWHWdEtfAsB9HWW/U1QArDjmVWkZahTxl19jAPrTGWFoJEtLhWRhI/8cg45LrMIcJ9lax1RiAjAmjE17yXr/Evuze9lrxSuZ/bFbypCQxoN+0ml2A0iQOd0sTZ8f5Jrt84epn3Wh/1voGAsgstvay1/H+QTboY+x2ImSmeTvfCSMnpvM6WrRqd0ZDtc20lw/jqp5gaTJtWJYP46bFxdy9+oJ3Yyo8ZfQG6Ufzh4My1YECoF945KnQNBc4SzOvl9kXPwFMxndAlhPPlMKRHO3iXEYYPqgBdK5Nq0MNreAOTtin09p58BLyoLTdBVGwkEZ0gEkL4frQuOVmVxAwVeM9lHbWBWtD/c09jrI/I5s
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(376002)(396003)(346002)(2616005)(956004)(31696002)(478600001)(5660300002)(8676002)(16576012)(26005)(38100700002)(2906002)(36756003)(4326008)(66476007)(6486002)(44832011)(16526019)(54906003)(66946007)(316002)(53546011)(31686004)(6666004)(86362001)(83380400001)(8936002)(66556008)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWxOMHlxU1VuK2hxb05UV2VESU9rR1MwTU9RMDVQUEtwY0U1VUxqVC9MRnRa?=
 =?utf-8?B?SFlpUzhPbkFrQXZOaWpSOXgzeCtGbFJQUTUzWkR3RklTTUNXVE1oMW1sSHE4?=
 =?utf-8?B?aDY0KzloMlIrZjkrUU4vMTk3Um1jWlBjaW5DaTV4Yi81dEw4OElvaTJ1N3F4?=
 =?utf-8?B?eTR4NGR3UkRvNXRYVlJXWWpUNzN5THg4VE5Eb3A5bjJ5Nml1QTRxdGw0dURG?=
 =?utf-8?B?bnUvTXM2SXM4dk1GeUJSc0JXTXBxSFU3NjBOc1Nsa3FKM2c4SHpGREl5ZG14?=
 =?utf-8?B?SUV2eXlxc01KOFMvMjJiK3lPUjVCaDRPZS9IMk1iUDdlM2thK1VDR3BvY2wv?=
 =?utf-8?B?MHRYZmdoZlJVUzY5ZkMzL3M0WVk3NnlyMjR3b1JvOG04RHdpdXFPVEU2cDdZ?=
 =?utf-8?B?MjZmaUpiUnYyc3hMTHBOamZtTmFERWpGZllTVHFBNFVleDcxQ3NLemM1Nmsz?=
 =?utf-8?B?VElJdi9DTHkzQi9kSUtiZno2dTloWkw5VGdiSzVmT3BBazNDazZyZW1OV1Jz?=
 =?utf-8?B?QzBTc3IwNGJOR0F6WkVaSERBNmIrK1ZxZ2pTUGIvcjUvZC82OVNQaGFmK0NU?=
 =?utf-8?B?SndxMFlzVTBZdGZrN3l0L2ljMHF2aXpadEtremVQc3p0eHdXN0h0ZjRKSzJ4?=
 =?utf-8?B?QnA3QnFqYzZsejdoMk8yMWFlMmswWUoycENoWXB1Q05ZUHdkKzdzaTE2T2Nz?=
 =?utf-8?B?OU9LZUg5aEJ2d2VhTko4ZDloZ1huZTdrR0VsaU05NEovS25xK3JFRnVEVDl6?=
 =?utf-8?B?TUlLdUFmcXJGUlFwTVVyREJoNVZDUzltVmNzekE2MVo3aCtWUW03SEN1cm9U?=
 =?utf-8?B?MmFIVlpWb3VtSnFmTjNoNUVMbVlUMy9ZOUVLYzIzS0FqN1dMQXk2RndQYVU5?=
 =?utf-8?B?T2hOSEJ4WkNIN3FabDZXMTllQ2RtWlcxbndPc3BnV05VbmtyNHZHdTI0bnpL?=
 =?utf-8?B?UzlqbDNTKyttMG5HN0V6SU5MeEtLOERKYTRPWDJMUTRWOXNUa2VxbWU2TWNN?=
 =?utf-8?B?bGYvTUFybzdJU2lodXMwZFFnd1FBUlAzSTNTbWU0RlhxTXRYQkgwU0ZoUG1N?=
 =?utf-8?B?ekpYZ0JzVG1PT0hPRlYvVmFtbnA1MS9IcC94ZnIvZDNNMElLMWpKWDNScGd3?=
 =?utf-8?B?am9VT0lWclVRM3ZZOGFyN3NZS1pTcEFlUFJXTUQ2aTJ6TEhFajBoOTF4TjVV?=
 =?utf-8?B?RnpkKy83aXhWOHR4d3RlMTJST29EQVZNdGJVMTIrakxtdEx3OE5PMFB2U1Zz?=
 =?utf-8?B?SmNOYlgxUTluc0RzdW1QbDFMbU95Yms5eTlvSDl6M1FRUG9KS3VBdzFUMGdB?=
 =?utf-8?B?OEFFYmdBWGlTZ0FsWFd0eHlKVHJ5YnloSUdsbHFZaWdRQmVOM09KeEZGRGJL?=
 =?utf-8?B?Tk52TkZQRlVudFlFUCtyYml5TW1LeURVdXdtWmpkelh5aHFHbHpUc1VuamZX?=
 =?utf-8?B?V1ZyYWhPUnZ6SlJKbGRwbDV6Tzg1UFgvZWlpQmJyeXQzK01sekd2eUF0RE90?=
 =?utf-8?B?Q1VPb2ZIeFhVZnRSVkRRdnV2eTVsN2pyZi9ZT0RxTHNleHpSYnY4Q1RkemF5?=
 =?utf-8?B?OE1PQ0p5eFNMNEppa0JIS2g5MXVEYkFtR1E2dUdzK2pTNWZFSEptWmVJSWl4?=
 =?utf-8?B?bzhWcHlWTkpKOXZ6clM3UkpEUWw5a3d6WTd0UUVVQXhXdUZFOC9OcURYdkJt?=
 =?utf-8?B?UTdxTmJQK2YzU0Rmd0h1OXVoaWZUTk8wM2t0bFovclo1ZzFNb3FKOENxNy9j?=
 =?utf-8?Q?Y4kF5yoI4yJfsnJoYfVbeuRmeI+Q1jjGbW2Silk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8d594d1-ad4e-44c7-26c9-08d9325fc999
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 13:48:43.7325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HCGfCk33Io709e/350/LqDsdeip/uzrX3XxhELX98li2kr5fg0qWw7in6hIhRmVnsP04q5UW7UQsfLG0cn7GgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5476
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
Cc: Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-06-17 9:23 p.m., Shaokun Zhang wrote:
> Function 'dpp1_full_bypass' is declared twice, so remove the repeated
> declaration and unnessary blank line.
> 
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.h b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.h
> index 9a1f40eb5c47..71b3a6949001 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.h
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.h
> @@ -1497,8 +1497,6 @@ void dpp1_cnv_setup (
>  		enum dc_color_space input_color_space,
>  		struct cnv_alpha_2bit_lut *alpha_2bit_lut);
>  
> -void dpp1_full_bypass(struct dpp *dpp_base);
> -
>  void dpp1_dppclk_control(
>  		struct dpp *dpp_base,
>  		bool dppclk_div,
> 

