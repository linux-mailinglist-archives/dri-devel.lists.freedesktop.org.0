Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E464362E55D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 20:40:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1091F10E67E;
	Thu, 17 Nov 2022 19:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D15310E1D0;
 Thu, 17 Nov 2022 19:39:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hT35T1s8HMSsYlE70aEH3tuhQ3aFURhPkHVicGbMuuIRyXjwT9t2cBgyFZRHAmC99HQGyz040IgDGtStaMrFglRA2pySOcfivqw02aUi1G2mg4w8SZCtilmEvXlkQNbKUY6cr6AU8hTkML4/07OBohgpVyDX6JJcx6+DUxQWiH5KM2d149MVIOdYGnJSygWooz91eOPH1zAeCsA9aJ8sc9LLgGnGzkERX4MB7mUYuEBU7r18VW8P88UQ0fZTUDR0KDX1W6HULq3eGkbp9tP35ObyfU0Ym8Vx1Qyi1EGCLAdTI0w0orw6MgnIh/C/tPvordxapl9lQLlFqXRhv2ErBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahyYc+atFIy+LJxa/Fb7yemedwmhIjo+X0vA7v+uN6Q=;
 b=RtTaslN57pZDQtC2fgXaHm3xW3uzFnRHGhJi4PE0/tcDPD6w6TxSvIghHt1GijsM8mnLPv72wCApSCsW6cbY+24iBWUacq/U6G/82TK7Sepx9PmqfJHLxLokR0XUH/ewe3VvQV2D0oyQ98kh50307AqboRCKhZVMs3REt6/FNptmNVucE3zTb8N7M4qAkI7lhZckE2dPlXfdPY5VW6mgIyQcWrBBsrXGqa6fMqK+uV7Eq7uHUC4mObkoT133PKShspZ+9rGCQDEi0itajGEs7NiyKDL874PbuYUlOEZzgsIEsGBwZtDQFJCDJhlgu+hqmiP7qEchy2YRNqmfRXqVMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahyYc+atFIy+LJxa/Fb7yemedwmhIjo+X0vA7v+uN6Q=;
 b=igozAtpaLiRXfoWJ0dpn3BHPp+meywKlh4TmEGx+TcT7tTuL0rVdomFZ29vxU+YaswGrvKD/+Dg7W2/AlqGE4yDKMu1Eh1w7YasXp1J/aTKkp7A1C557EhKEJdy7XyPfkP5VIrU6tmX1I9CDdLV5ThsRJolGPHa/zvrqhLPIXss=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MW4PR12MB7310.namprd12.prod.outlook.com (2603:10b6:303:22c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Thu, 17 Nov
 2022 19:39:51 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::2d6a:70d0:eb90:9dca]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::2d6a:70d0:eb90:9dca%8]) with mapi id 15.20.5813.019; Thu, 17 Nov 2022
 19:39:51 +0000
Message-ID: <28960f0b-97b9-7a41-9da3-188be25dd886@amd.com>
Date: Thu, 17 Nov 2022 14:39:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH -next] drm/amd/display: fix kernel-doc issues in dc.h
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20221117172009.28207-1-rdunlap@infradead.org>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20221117172009.28207-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0009.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::21) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|MW4PR12MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: a1ce36aa-1b54-4b69-9fae-08dac8d37d91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r2PzUyugJlVRj83D6T+ksEThnTBf9Zoo/OfaqIngpjaKgld4FpEEHRUhq8GemlBevv9BZl7bgdmuxDNuprGwzcDebXWzA2FJM2BxSrpRe09LcDNE9oB5Ya9IG8EHqlKkQgk8Gw28KB6FgN4xZMBMR88u6vGS+EyFPIbs/9UyzEW6pkK2qCvmPTABGqtAZ9gx0EvsDwfBYZxNJja00osN2LjGd64ZUiSllakj33J2EittLe0MvG1b/TS14g72mpL0cmdBBG59XBERKInP6B3cxBeuj0sZ8c3H3SPG1LJ34vcSqcIMEd4tln9WYliF20TakZflGriUv2kaAqx5CikITF4uaCWvm1hlY/38iXLCX/7IxQAaULASrxT7JhAfDbOGChNeQ0dTZLlIxH7LmTgIF75JeYHupw8Vk5ZgavqiiChPti8O75sM4Bnk9uPOjTxagRked2KNumJ291xz5M8KHkxVjjUbNfn+9IgUXGc7ieuQPQ11lffd95QWE6xXbtd799ArWz5a/tf5ZcmQxKezFx+dWMLYWvYQ57lWnZIQ7WrMXjb8NScm53AmFqfjLlR2p/VPzqee8inNmoSBw58VNveubnwQpJn+W0YqY/B31ZXgHcF9orJJGw6mFimtMr+WTrr/2ejMvqYTrZjKLdwWQPj37TP1DSgSr5jEWGU7+uTsh79pRIzO/lsiJG6NqHt9G8DKm+M0uohH6VFZCeIEFpuURiBoFUHrQfasivu+Z5k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(451199015)(31686004)(36756003)(38100700002)(2906002)(4326008)(8936002)(66946007)(83380400001)(31696002)(86362001)(54906003)(316002)(66556008)(2616005)(186003)(6486002)(478600001)(8676002)(44832011)(5660300002)(41300700001)(66476007)(26005)(6512007)(6506007)(53546011)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3o2azlRSW82blh6QXlNZjQzYW04TW5MWU9YSXlVTlExdy9oTVZZeWxQSTM3?=
 =?utf-8?B?RFNGcVJQN3F0RWpXeFZSTWlyYU5JNmpUMjRkY1ZKYjdURzM3Qkg3MUQrYXoz?=
 =?utf-8?B?Z1hEaUkzTC9ualgvQlhnUnB2bTNWM3lIdEdSVkVnbmszU0VraEZlOHJIdjI3?=
 =?utf-8?B?MWNDbTZOU1ZmWWJWVFBOd0xmckhwUHk3VGxrOXRJcjlPTEhsYmVxeWxqMWd5?=
 =?utf-8?B?cW40cnc2MlVycjd2N1ZPcVJQbSt0bWhlbFN1ZkphT0Z6Qi9YMjZud0o2ai9T?=
 =?utf-8?B?am1CbDdGTVp5Ry9kVGcyeEF4ZnZraklDNzFYck82ZXl5VWJQNmJsNHNqM2ZL?=
 =?utf-8?B?b2NFT291cVJNL1NycHdTYThxV3VLNXRXNm5PN0Z4bExCMzBjQ05ER2RybTVW?=
 =?utf-8?B?bFJsZndEZzJZQWw4UUllUXZwOG43ZzBuSURZZTJ5bE1zMC9vNHp4UjRwWmZZ?=
 =?utf-8?B?cnBWR2xHdDZkcHovWWhvcC9TT2F2ayszb3J3TDRLb2ErMXFUclZDU1REZTNy?=
 =?utf-8?B?bWl0cGNtcE0xZXhFN2tQaEEvTjhlVE9KdENvMVRsY1loRG9hWWgxdEZLTjRE?=
 =?utf-8?B?QnRYczdNdDc1dk4wY0FjVkZtcDVvcGQzSWU3eTdROFQyU04zek5QSllzMDBV?=
 =?utf-8?B?cHlyd3pwVXhJaUE3MzRFZGhsVzhJUFFMMnlxQXUxbnhpcWdieHNxanRyazJt?=
 =?utf-8?B?RDJSMUxmNlo1Z3VBOUFuMGtLS0EzUnZ0Z2hxQVlZeG9SK21WZStiOHJwclQ5?=
 =?utf-8?B?ZFZmNXpuaitDNHl1MWQrNHMwQ09taG96RzJkbUtrWDFoc2QxSUNDYXVxT0xF?=
 =?utf-8?B?SnFVMGZYQTloMlRyeG9EbHliaFhob3h1VDEwR3NjOGs3L0ZkRHpwS0N0ZGNk?=
 =?utf-8?B?UkJ0Z0t5dDNrMk1PZ2l6Tnh4WHpwL0R6SUVUS0s0TjRSSURXS25iek01RXFp?=
 =?utf-8?B?VWphcW9KNmFWV1lSME90MFR4NEpnM2VyZ1R1OGZPZUtiQmFQcFBUekd5bnZz?=
 =?utf-8?B?TVVRd3lzVlFYd0UyVk5seGdjL0xHSWFod3BDcDEwaHdtdzAxS3dNQnlYZnNj?=
 =?utf-8?B?QkY5bXR4UDA1TGVRdmlPaWs2Ym9YZC81SFE5MXVDU3ByWUVFVDFlcFlWRzlz?=
 =?utf-8?B?TzZ2eHluTFVtN1VTVnJVeGhTOVNjdUVwYzR5VDJHeXpPOFpFS1BsUlJ3ekN4?=
 =?utf-8?B?dWo2WC9QNGt1NnY2ZGhHdEJjdUtjMWRGSENrc1gwS2pNR1Q4Ky9rMVhHRWFX?=
 =?utf-8?B?bG5UeFNlNmxGb1JFSmVENFE5LzFqb1Z5aUpPSU5qOU5uUjVOMlRpeHFXQW1P?=
 =?utf-8?B?SEZRL29SMVl1VmlnTEZENFdkRnJmNWlkVGFZUDVNU0ROZVUzWE1RUzFmRDVs?=
 =?utf-8?B?VHh1T0svTm1JYnRldW5tNS9WcThHOGh5WVh4WU9rdmxaZHhQYnZFNGRsYnF6?=
 =?utf-8?B?RXRDVDc0eElST3o2THpWZy9KOWdFdjArRk5uSjhYLytNYkhGcmdhcmFJb3l4?=
 =?utf-8?B?aWo1bHVxNkl1QXEwbGlWYWN1K3lrc3BEak9KbkExSE5pY1NkeWExaDFHMmxX?=
 =?utf-8?B?eHh3aUNNSnNWeEpSU0lPZEE1Yjd2VWw0N2szSzdTRDFlUVdCOW44d2hUNUF4?=
 =?utf-8?B?bCtpSGFVdE9PVm40dENHNGU2WFNPL3NYYWo1cjh1Tm9oMWt4SHpPNVpQMmJB?=
 =?utf-8?B?WHYzNWNpc0JtRXpIbXlvdGxyK1pyblhyMzZad0N6UVZTMDdjTTRHK3N2RmlC?=
 =?utf-8?B?LytNTENNRk8zbFRtTUQ2dmE1eTlkc2s3ZncyRXRCeXQ0WlRCREczdHplMVhY?=
 =?utf-8?B?Y1FWZEljckIzVWRXcU04QWp6ZG44eEJhK2hKSm1YcktrWU5kTGVHWUFxNE4x?=
 =?utf-8?B?TG1HQS9jdlFtdzJUcjdDUmRXVXpZUElzOGYxRVVMeVVqMUJvYlFjMG5kc3ZU?=
 =?utf-8?B?dUFQbGRxcEdQSmFLd2l4Y0lZSXBKcFNZNmJ2TUlQRkFPcjBWYlBaOEt3ZVZ5?=
 =?utf-8?B?cDk0anpLT25WbnMvVXV2bnFMMXZCL0k1VmFYWkR1VGtQbUFHK2tBOFoyaUxU?=
 =?utf-8?B?SVl2VU53NUMxSmJLSzZnUlkzYW8zOUk2UllUVHdYVzZadGNsMTViNlpIYllj?=
 =?utf-8?Q?+LPlfkskAH9/EWFV66zxbwItQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ce36aa-1b54-4b69-9fae-08dac8d37d91
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 19:39:51.3088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BAZcg3jGnc3wew1lKwasesTn/CsaIATbin81G6oaKKv/WNhaXK4kqqPN45UWg+pM9ZffcxQfgmwbpMh9GyGRBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7310
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
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/17/22 12:20, Randy Dunlap wrote:
> Fix these kernel-doc complaints:
> 
> drivers/gpu/drm/amd/display/dc/dc.h:505: warning: cannot understand function prototype: 'struct dc_clocks '
> dc.h:472: warning: Enum value 'MPC_SPLIT_AVOID' not described in enum 'pipe_split_policy'
> dc.h:472: warning: Enum value 'MPC_SPLIT_AVOID_MULT_DISP' not described in enum 'pipe_split_policy'
> dc.h:532: warning: Incorrect use of kernel-doc format:          * @fw_based_mclk_switching
> 
> Fixes: ea76895ffab1 ("drm/amd/display: Document pipe split policy")
> Fixes: 1682bd1a6b5f ("drm/amd/display: Expand kernel doc for DC")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/dc/dc.h |   12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff -- a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
> --- a/drivers/gpu/drm/amd/display/dc/dc.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> @@ -458,15 +458,15 @@ enum pipe_split_policy {
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
> +	 * @MPC_SPLIT_AVOID_MULT_DISP: With this option, DC will only try to
> +	 * optimize the pipe utilization when using a single display; if the
> +	 * user connects to a second display, DC will avoid pipe split.
>  	 */
>  	MPC_SPLIT_AVOID_MULT_DISP = 2,
>  };
> @@ -497,7 +497,7 @@ enum dcn_zstate_support_state {
>  };
>  
>  /**
> - * dc_clocks - DC pipe clocks
> + * struct dc_clocks - DC pipe clocks
>   *
>   * For any clocks that may differ per pipe only the max is stored in this
>   * structure
> @@ -528,7 +528,7 @@ struct dc_clocks {
>  	bool fclk_prev_p_state_change_support;
>  	int num_ways;
>  
> -	/**
> +	/*
>  	 * @fw_based_mclk_switching
>  	 *
>  	 * DC has a mechanism that leverage the variable refresh rate to switch

