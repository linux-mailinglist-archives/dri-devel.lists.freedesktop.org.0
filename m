Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 995E3750A32
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 15:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34C210E53F;
	Wed, 12 Jul 2023 13:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D667C10E53B;
 Wed, 12 Jul 2023 13:57:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UnnLHHxJWG4iR8AwPFd+c8u2Y1r1tBybjB38kcZkoqk1FnGojZO0P1fKvTjLmM+wwV0wzvtyga8PgLi3tqpj6pNpScYbUTFQj6k8K5AKbqgfoc8nrwdHVyh3Xg/ozLj4QE86L3RA9AtOCGTD9U1GUXGoeN1nG7O1pblFvhUnuIywBjMHEiTwHjDq7llzqGB0kAQ2bsJOQXEVE+ngjOY5IWf7bQhCia4komep1w4iC7kD990ZwCh1L9i1z13fEGeQYqyRqWm+nQ7knRtSfGkToLQcFF48/R/HUa5VD+HG6rb/AIQVLFM6/JoE0ICVIXBeYBGNnHl6VRhxvgXsjwvXYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SSnz+eiX43dWtfyKoUrrtdD18jDSD/HHVMMDiBrWAQ=;
 b=glKfmG9j2LLeLMgpWxtqwkkHNiHEqhAsql/Ycj8jnWKjWO75DnZ7L3s1y9dg57zwhb02jx/vVorq1O87O5MfWvkpKCxXKJDGjxN0Vd08elngYB1VxO1xTqLG5qqHAyaYRdVswx54A/CN8HR4DbnyXD5QZs8KTMbVvQvd93P4b8i+WcI/S86SP9Ky/TelkFjq99SELUjQ9wtHQsAMomTR5ucdoTUEJTnPx0sD3D1YPh7gzxWtOk+o5sJ28tO6CH7s8GyzMyaL7rZJpkULD/PdLr/aaBBkzNch+30f7MuDHwHgqgIdzB4P00O3rL5v6BczPJ7vmrJmNl6h0EW3U0+Mxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SSnz+eiX43dWtfyKoUrrtdD18jDSD/HHVMMDiBrWAQ=;
 b=IcvdtDa6urXiamTHzWhHUuJvceZ8noATThjhChTsPXRTXwDDVzMgLoD+8IoV6JVSj8EI+1Hgyj/vcr/XIzLo3RJKyjfyr6sabsZR36c/vXNUNh3J2tmBNJhbiCoUdIZR21G0/AAWz4rrFokGzYtbtPzFmBf28KVdSWlxdTCAqWo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DS0PR12MB8247.namprd12.prod.outlook.com (2603:10b6:8:f5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 13:57:56 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c%7]) with mapi id 15.20.6565.026; Wed, 12 Jul 2023
 13:57:56 +0000
Message-ID: <acee82a2-d5f9-9bf1-5138-44db14c079d1@amd.com>
Date: Wed, 12 Jul 2023 09:57:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/amd/display: dc.h: eliminate kernel-doc warnings
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20230712022339.17902-1-rdunlap@infradead.org>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230712022339.17902-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXPR0101CA0040.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::17) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DS0PR12MB8247:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bff9f85-ffcf-4df7-dd5f-08db82dffe8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4qDtz6eBmIbdKqdr0nDFcLgEAY/4rhqAKIXtENr7Z0aKloex76YwvnQ+P/5B8h28gU+XoT5Qnkyn0EizWQMWcy1W8CfhsauKZtlWoh10BZ9QixbMJkAb2sGiMzRsAeZn3nnkBfHVhDrl/K3yok/1a1K1iq7BcS4yhTQEvdhaZhZaZ9v7IiN03s/gJQi6B1VNGqp62oZlaCfpP8Y++Xx52DU6zmvsj4LLTBah0DcupYvrV3ADzs6Km5wC57Bxuj/gkcICKqA5gFCv6Wsd8wu7MHr959qif5r/qHtRKGLsn3Cu4WkVkjDpgNOgua3rBrtdlxT+jlPkeYMMMpxNT1w73ERwWJDFW7gE46ePdMwDJty+U6cUcUzZnC+N4lUi4LG25DA8/oEYsSxvIiZ3RY1Pf1TdZAmcmmTVCj4jhY4gG+g/pCTv2Z1JE7xyw8J22nIAUlHhR78+d5y4IV+IqhBFxPTl0eaJL8mFYE3fzJ2fz+NFQ5q+1WS5uEZmkwMRn6udYTs5CanOgp3J4Daxu32dVL9GvoOHg7crV5YsjzLRxPKr9aBbwuu6BPLl7gaSVUkygKuKPswH4UvO59ZPP/O+FS4xwKiqn4TNoF9T2eG8ptTgFF9v8ht07RMajaFLzsXrhxVP0urWnE+o8zS1VfBXQzf6hhSy7ho2QZCqvw3PSajP4wVqS3gnKNUQg8oIJW+W
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199021)(6486002)(6666004)(478600001)(54906003)(5660300002)(8676002)(36756003)(2906002)(86362001)(8936002)(44832011)(4326008)(316002)(66946007)(66556008)(38100700002)(66476007)(41300700001)(6506007)(26005)(53546011)(31696002)(66574015)(31686004)(83380400001)(186003)(2616005)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0RMek5PZUtUaDVnbXA5MkJHaHRxeHBnK3FLa0JFQUtlbG04WWRJbWNEU0ZW?=
 =?utf-8?B?Z01ucklwVTBSTDEzM1lZTWhXSlZhQkxrd201M0FncW4vVWc0K2w1N3pJUHVj?=
 =?utf-8?B?cHRyS2Z0TmpxanZoOFBzdjZvNHVpZEJCbnpDTWN5OEtqb2U0MHZ1NFQwaGpY?=
 =?utf-8?B?dUw4c1dZRWl4N0Q1RzhkMC9acE9ac05aZDljZ0ZXU3FHb1BDWWdNRkllWTdE?=
 =?utf-8?B?aHI0eW1tYldRNDlkaXRyNDg3SU5Hc3czaUFSU2dINFZXUG1YNk4zNVNyOXdE?=
 =?utf-8?B?WWtlbUhYV0djWGFoYjZsZmZDOWRGbjNiRUV2VVdWYzBJN1lGRDc3aGlxQTN2?=
 =?utf-8?B?dDNldW80aGZTWUVHWHZoTDFTbkJrVjRoWDdMNm12WGNOQ0hxSWUwTXRXeGMv?=
 =?utf-8?B?YTlRdWZrSHk0ZExmSlBjRWNzUzBiK1k2SEEyN056T3MrRExFdGsyZHM1SzJX?=
 =?utf-8?B?MUdrdEpiYnIyY2VCR2ltSHJoMXRib0NwQlRlNTJocm9idVNjWXRtWFFvRW56?=
 =?utf-8?B?anhGekQ0dnByZitRL2lid1ViQXNOR3ptb25UMURTMVFGOUdtY2k0MmV5QlpV?=
 =?utf-8?B?ZUxTUHhmSnZ2bUtFaDFpVkRkTjJwQlRlellmbVMrTndxZWJja25GWjlhMTNM?=
 =?utf-8?B?angraUtsTVo2MmRldVVkTktQenZzcU51T2Fmd2VPaEw0eDNacjVWV1g3akk0?=
 =?utf-8?B?a29pdjhlSEgvYlJjai9lSUh1VDUyMnBBdkpySHVPeWlPUWdtb0l4ek1YT0xk?=
 =?utf-8?B?bWV0YUdveExjUDdMZFNHVEJFZ3R4TVdqTHdrUE4vaWVpNEdmZVNIKzY0aGhG?=
 =?utf-8?B?OWVpQ2ZiVnZORGZwRit1aUJNanpDMkhEMjJUcHdzd3JJbmR2TzVKbng2YVlX?=
 =?utf-8?B?ZUJWUmpWaU1WLzJMWmhuemtvU2FtbEwwc0ljb3dwRUN6aERXWTkwRTdoalRk?=
 =?utf-8?B?Y3lqUkQ5R3BmYk1CY1lOeldKSnNrckxoek15QnNKa0hDcmM0My9xU3BnY2NX?=
 =?utf-8?B?TjRpZEU5OFVoN0VIWEh4S2U3RnlpZ0RyR2xHV1JSVURKYVlWamVERE9YamtI?=
 =?utf-8?B?WEFQVHlPUDZBMmZma2lRZktrSWE2cVF1ZklLM1YreHgwNlpERFV2dUtzSnll?=
 =?utf-8?B?S0tldGRLczlUMXJCQTZuSHloNS9qWEJrdGdkT0JGQXErZFl5V0JNWUdPWkJ2?=
 =?utf-8?B?a1QvMHZ0cEsrNTY4LzA3S0dieTJOblY0cUM2dUdzVUsrVEFHeHI4TzNMT2t4?=
 =?utf-8?B?SGxFeUs4SWFvdnkxY2MwY1VPc3BSOWxmNDh3QmxIQ0ZvV2ppNXJFV0IwemlD?=
 =?utf-8?B?c1pYZHIrNlNLTFIzeGlwS0FIVGEzTENlRW5rK04wOXdHNTdIZXM3NmpzWlhD?=
 =?utf-8?B?dWwrb3c5N0h1a0UrYkpUNkpSSmhXZDk2T3dMWUk4ajBNekk2SXQvaTgyaFdD?=
 =?utf-8?B?aGwzdURiTEpCWnRtMEhzdEQyQithYmtKaGlRMWVLaGpQT2ZVelVYb21aTnE1?=
 =?utf-8?B?QitKTkNNMHhlY2pNQ1BJOVhqUU4yTWZGSXJkTE1FYjkvUVVZL0t2K2Z0Mk9T?=
 =?utf-8?B?VU5EZFV6d3BEZ1RuZERSNXQ5UGNMcWp1ZEhTMFVWMWxZNHg5cW5qV1pWRFp5?=
 =?utf-8?B?YVhVbjhyOHh3VkdkUkVtMURQajZybTRnREJFeDk5U1YvVjBpNWUzOTFPYXg2?=
 =?utf-8?B?OFU1aGlib0hPbXkzMTJ6ZVU2ajFLTURkYktrc01WVEFEakdCcXpsSWZlc01k?=
 =?utf-8?B?amtoUHliU0xORVc1UW5UTnJlWVBpTGV5bnpGR3BsWG5ld3Q5Wm54U2Z1R0d3?=
 =?utf-8?B?M3NnQ3dtOVJCRXM0bVZQNkdmdE1ndktVMUZ2RmFDOWw4NWdTNjBhRjhzNWxC?=
 =?utf-8?B?ME5JRjA2cGZTQnBmODlIb1huNXhsMGRMVXBaRnJwNG1ZazFYeFEwSUx1VHdi?=
 =?utf-8?B?bmdYWFJIL1lGcUdYTWQxbzgxb0lvYXZyejArMWtXYjc0QXVEK21zMHNKaWk0?=
 =?utf-8?B?RksvSFlmSXNwbk5SbXppQ0JUQnRua29nZFRrTVhtY2xRbkNXdDlxYlRLaGZq?=
 =?utf-8?B?dEpkQTZJUlRVcWdadUk2enFsZkZBbTBiT3RiZjJjN0QwbFprZGI5TVJ0Y3ZI?=
 =?utf-8?Q?tgDa+oyf3FNhKw82Js5Uw3wpU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bff9f85-ffcf-4df7-dd5f-08db82dffe8b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 13:57:56.5332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d12Ht8RZlb9DV+SvBU1SsN20Z/PXqO0Rn2TkkzK99FwKhYYyXVF96k9Hb9tHfQ7CQfkf6Cs3BomYWwbmkxfD+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8247
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
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-07-11 22:23, Randy Dunlap wrote:
> Quash 175 kernel-doc warnings in dc.h by unmarking 2 struct
> comments as containing kernel-doc notation and by spelling one
> struct field correctly in a kernel-doc comment.
> 
> Fixes: 1682bd1a6b5f ("drm/amd/display: Expand kernel doc for DC")
> Fixes: ea76895ffab1 ("drm/amd/display: Document pipe split policy")
> Fixes: f6ae69f49fcf ("drm/amd/display: Include surface of unaffected streams")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: dri-devel@lists.freedesktop.org

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/dc/dc.h |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff -- a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
> --- a/drivers/gpu/drm/amd/display/dc/dc.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> @@ -506,7 +506,7 @@ enum dcn_zstate_support_state {
>  	DCN_ZSTATE_SUPPORT_DISALLOW,
>  };
>  
> -/**
> +/*
>   * struct dc_clocks - DC pipe clocks
>   *
>   * For any clocks that may differ per pipe only the max is stored in this
> @@ -728,7 +728,7 @@ struct resource_pool;
>  struct dce_hwseq;
>  struct link_service;
>  
> -/**
> +/*
>   * struct dc_debug_options - DC debug struct
>   *
>   * This struct provides a simple mechanism for developers to change some
> @@ -756,7 +756,7 @@ struct dc_debug_options {
>  	bool use_max_lb;
>  	enum dcc_option disable_dcc;
>  
> -	/**
> +	/*
>  	 * @pipe_split_policy: Define which pipe split policy is used by the
>  	 * display core.
>  	 */
> @@ -1334,7 +1334,7 @@ struct dc_validation_set {
>  	struct dc_stream_state *stream;
>  
>  	/**
> -	 * @plane_state: Surface state
> +	 * @plane_states: Surface state
>  	 */
>  	struct dc_plane_state *plane_states[MAX_SURFACES];
>  

