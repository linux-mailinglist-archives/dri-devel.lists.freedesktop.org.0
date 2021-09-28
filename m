Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6704341B2CE
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 17:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4210E6E1BD;
	Tue, 28 Sep 2021 15:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2082.outbound.protection.outlook.com [40.107.212.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D66989D49;
 Tue, 28 Sep 2021 15:19:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRDVPJC25HFyeRyrXRuW/SCMleMuM+iAy+f3QT7zYSeb5ijuQwDOdVQ6mzg/J4oyfuL9E13j/HZQwBmQVjVOoNK5fSUlgWix9iscjCNkVc6g0Fs5Sa6OShRGmZ05XFXm9dGIiPH2ndk+vRFSOIDIG1RSga1JlcDfFla3SaZ0pUrUeUAJedV+9N7E38vYWJll+uj+OC47ip1Wbnj24b6aFQw7pjVUfEn0jUhWbs/Xmn0aKlobmCXueS1WwZqdug1V6Z/nmS0jKMDkg0i9ixbS35mmCWLVPIi1VlCewBDGlMHRFbIIdWrOJjOEUcafAjJFYyggz+BbcbBxOEa7PpFBBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=6Nuor0FuEgRZWeyK67/5fw2GUCi/5XQ0n3uswR/Dmt0=;
 b=oC7UuaKieMXWzwqXpagQiBsb+Y64j7rlAQYZqbE8gyR4fN/F5kl0Xh5ujHd9dd5mvcaLFoZt75fqol6ThelJSSrFn++LJ/OamWc9v9deAtRYzaCDFEwGmC/eVKGJwFLXnQf9j7XOV6s5IRt74sm9QEYYShOxjIKSmkTeF0N1ROYNE8iQFplWkuEEmNPsYUbsPUIInneQZ1n/ztxANimGn7rreVCsrjtRCj4v/ZZ2UQWRAO1y6t0D70GOh2PX1e7hhcwIRJph+P+K6acvGIPf7zxQxmvIPbWXI2p7qQzpH4FTANgsnQTZp59B8a3dazfA00r5y3rRDg+oMIoxE+VWXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Nuor0FuEgRZWeyK67/5fw2GUCi/5XQ0n3uswR/Dmt0=;
 b=dGdslPoz4SYQRHcd7W+XZ2G3d0xN70D4zwhgGuzWfdUGnzby1l6bbYgMVBVkpMODTzv/EcZ3XOlIw1e/YQv7fhA9sLlrsIYY2x+pBWJdXv8VRHuUepMqZAsMXRi918advESAtbq1x4L90IDnsOmW8X3AaMeSiC2ecJTc9G8ip6s=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5474.namprd12.prod.outlook.com (2603:10b6:303:139::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Tue, 28 Sep
 2021 15:19:11 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d82f:e8c3:96ac:5465]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d82f:e8c3:96ac:5465%9]) with mapi id 15.20.4544.022; Tue, 28 Sep 2021
 15:19:11 +0000
Message-ID: <b2ce7b34-23f1-75c8-182e-3e7fe9b845e1@amd.com>
Date: Tue, 28 Sep 2021 11:19:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v3] drm/dp: Add Additional DP2 Headers
Content-Language: en-US
To: Fangzhi Zuo <Jerry.Zuo@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jani.nikula@intel.com
Cc: Nicholas.Kazlauskas@amd.com, wayne.lin@amd.com
References: <20210927192324.5428-1-Jerry.Zuo@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20210927192324.5428-1-Jerry.Zuo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0783.namprd03.prod.outlook.com
 (2603:10b6:408:13f::8) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [10.254.43.151] (165.204.84.11) by
 BN9PR03CA0783.namprd03.prod.outlook.com (2603:10b6:408:13f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Tue, 28 Sep 2021 15:19:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57a980bf-09d9-404c-c11d-08d9829352b8
X-MS-TrafficTypeDiagnostic: CO6PR12MB5474:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR12MB547497602253F88B1C8DD5568CA89@CO6PR12MB5474.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NY6h6aeKLAFF6IjOxMIMmyxO6YS3v3ejLPDlOgWHMj7y0KY5oNF0OqEmT5yZkXU6Jc6Ty1vvz15/0/DuQW1efWTxVW0R3mgwbJRzCqGEN4UkD+6/IG/4WzlfnG+7fGzJtgXIo4+AiqbGlF+Eij+i41RYOtQFC5I/o+eTZ/GjgHBUrzU2m/L8U04hF3dloQ1IPMD/wZipr5gTddeMSpmZRMfSwEqPkYDEoRE2jP79G/E4e9FcwQXLVc/Md8Vk3DFZ+KgzUeWt3TeABoj13+t+fYb3JWdjfOLUqwDUZ9VEduLS+NUdGSp7okbLHQtiO7XFlyP0E/NlqTZ302E3UncCnr89f85MNj5MFqBx4+9sKHhTuZ/uC21Axw/A5DUA2wfx5dJt4L7sOg9EU7iRwfmSqvuB5mdEqtrE6XDx1zLMrLNOksar6AtoX2VdWBjAZOZXC0PdIAJafn8ckfWFZk4lEH5cZbNVXYqoW6e7IPgVe1v+SLedIhaODDIB2uhaXA2RGlkQOtGq4zn/ibIZyXjiONTBuhPbPd89FfQzc2EVQ5Nv+zU3Ycd6p4NjbWC1ZPJz2flCLXtLZoqx0NxnrVprX0k63EoDIEM5M73uXSLTqvE+noMBi+Jj4UQC54fRKnf2j2r3DHZqGntmnRxANKoaXGv8dXmxfmsKYD3bgqwWjwU1WA8IUt5nzw69/j3637FB6AsjEYdw0JSxcP1tp7bk/1gTnxBlt+c5PeuT3gFXo17iBr1oQ7VBLz5Zn/jFpCIvIuFJXZBPUYY/CGPEbjSA5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(26005)(8676002)(956004)(36756003)(6486002)(2616005)(316002)(53546011)(508600001)(8936002)(2906002)(16576012)(6666004)(66476007)(44832011)(86362001)(66946007)(38100700002)(5660300002)(66556008)(83380400001)(4326008)(31686004)(186003)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHlEYWhCLzc2S0NaM3ZDOGxCbWZ6OEZtSmg5SXkxc0pkMHdjRGh3dXBiVmJx?=
 =?utf-8?B?WC9LdlN3TGhiZ0pLM1NzYzdyZ0l4TWRkRGp4V1VnUDBPWjVpdkU1bVpLa0gz?=
 =?utf-8?B?U1gwSzhFTHloME9BTEdvSnpMZHNHNzhFOEUwVHN1RkQ1eVg5cUZCdUdTK0Zv?=
 =?utf-8?B?Q0ZyQ1hsa0R4TXFkOStNMExDL2RqRFR6bGNDQmNxSGE4cmlQc2tCVThGOGZR?=
 =?utf-8?B?bTQyYUc3LzRuQWkrTWVFZGF4UkJ1NzNNWklsR25VMTc1WXBrbFdiV1FENmlj?=
 =?utf-8?B?Q3dRTS9wQnVCODRCenhXcDNTdHc4Yy9KNG1LQmZabU9nclZ6VC9RdU9nWmsw?=
 =?utf-8?B?bjFQV0dvUHM2akxaSVhKbENQdHNha2pFaEZaS2grTUZFS09hd2RlNS94RnNX?=
 =?utf-8?B?NkhBWXEzUlJ4MUgxNUYyNVFZVjlQRnYrQ1RjQzZGdWFUWlFSN1BEOVBUQUlX?=
 =?utf-8?B?WEptMUs5c25PNHFvR09HNUprbDAxdWU3ZW01b3VsekNCY0Nvekl3ancvV3VP?=
 =?utf-8?B?Y1dvOEx5VzJXMkVSWjU4eU1VSTFyYmNLZzNIbVRFaC9vUXZtc2dDTkFLRGxV?=
 =?utf-8?B?ZmlBeE9HSFdPUFoxcmFNN1p0MGNyV3BpbmsxaXM0TkJKNXlQaXI1b3BMbDFB?=
 =?utf-8?B?R2JCQVhrWjVzVml3SDNSeUt1UmQzbFJKeGNaQ2lBS0RYRmhSV0pmaHlkU3VZ?=
 =?utf-8?B?cTcybXJ5RVNubmVNb2tjK0M4S1Q0V1AwQU9FbVB6L2xTYlZRZnRZK2hrRjAr?=
 =?utf-8?B?SkpVT05iclp0SGxHUkpxVTFlQXoxK0YrRkNxVzdFaFNwZjRlNnNuWVcvTm1h?=
 =?utf-8?B?bVAzYlEyNXVTQm5kN09QNDFIRUlPQVcyeWJ3MWtPWlJSaEpRQlNYcUJNY1lt?=
 =?utf-8?B?YXBML2FFMGsxVjkvUHU0am5kM0d4eHViRGlLaEs4eFNPcGRyN3prRUpOMTYz?=
 =?utf-8?B?bGkwNEpVRGVmUnlpcy91ZmY2NnpCWUJJQ21VTXhKSkhqMjBTdG43eE9lODlS?=
 =?utf-8?B?RTc5RFNtNGR0SVRlVld1TmtwT01IWUU5bExHamRlTVdHTnEyM2JsRFVMVXRz?=
 =?utf-8?B?U2lBM0tXeGtGYWRiQ1dHTk82S3Zzc2l0YWcyTHJobXFUNW5VbkgvOVl6ZUNr?=
 =?utf-8?B?bEVmSFhNUWQ0cWVEaGNYYnZWMDFhOUoybVJqNTd3dHNWYTZnelBMd3VoaDJw?=
 =?utf-8?B?cnlwalpSSERISGhMM0UwVVUvOHRiMVJIQlIyblIxaXRQOHhnU1F1RWdhVXhu?=
 =?utf-8?B?UG9Uc2kyRHFuc3Jrb2krQUU0OHhqMHlSRFk4T3gvRVNpc0ZCSXhtYlErdXBa?=
 =?utf-8?B?UDIrMEw3MGV6TWRvMk9Kb2QreFBQY0RCZGtJT2NlRDRrOEF0RWpsRUxDVDJq?=
 =?utf-8?B?dWQrRldtS0pQd3dFUmFFYWxYOS9mTkh0U2VUV1dYMmlHTzlDeUUvQ3BaWEp0?=
 =?utf-8?B?KzF5R2kvdkVkWHUzNkh1cEoyZGE1YlV3QkM2Y0QvcGYwTzE5OTNtNmlteGQ2?=
 =?utf-8?B?ZEFCZjBVR1RZem94djg2TmFmMm54UGZwN1pHNk9MNExSY2NFdUhyOWtZTnF4?=
 =?utf-8?B?alBldjZmY1gvWFhLcU1IUGN0NXJ1dnE5Q29MZkhsV3ZSMTZYbXVvZkVhdURD?=
 =?utf-8?B?Qy9wSG43aVgxTlJLNmZxcmx6NkNzWUVuUUZoSGxGSVFMMXlCQnpuZ0VsM0w4?=
 =?utf-8?B?Rkc4U3A4UVZMNmZqakFZbHBIZzEzcXZyaXoxK2YwSGJsODR2aGp6RjU4SUhk?=
 =?utf-8?Q?evQJ9H60xJCPkMsoMKAcacHl0vLvwl0wIfX4Xi2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a980bf-09d9-404c-c11d-08d9829352b8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 15:19:11.1807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0L++HAYOwI1A19d/0Zpa8acoPMr6pqw0jkmdDdRtaafnFkS5tLra5nI47AoUOw1TQavgj1WvrLTBjxI7c9GRkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5474
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-09-27 15:23, Fangzhi Zuo wrote:
> Include FEC, DSC, Link Training related headers.
> 
> Change since v2
> - Align with the spec for DP_DSC_SUPPORT_AND_DSC_DECODER_COUNT
> 
> Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
> This patch is based on top of the other DP2.0 work in
> "drm/dp: add LTTPR DP 2.0 DPCD addresses"
> ---
>  include/drm/drm_dp_helper.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 1d5b3dbb6e56..a1df35aa6e68 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -453,6 +453,7 @@ struct drm_panel;
>  # define DP_FEC_UNCORR_BLK_ERROR_COUNT_CAP  (1 << 1)
>  # define DP_FEC_CORR_BLK_ERROR_COUNT_CAP    (1 << 2)
>  # define DP_FEC_BIT_ERROR_COUNT_CAP	    (1 << 3)
> +#define DP_FEC_CAPABILITY_1			0x091   /* 2.0 */
>  
>  /* DP-HDMI2.1 PCON DSC ENCODER SUPPORT */
>  #define DP_PCON_DSC_ENCODER_CAP_SIZE        0xC	/* 0x9E - 0x92 */
> @@ -537,6 +538,9 @@ struct drm_panel;
>  #define DP_DSC_BRANCH_OVERALL_THROUGHPUT_1  0x0a1
>  #define DP_DSC_BRANCH_MAX_LINE_WIDTH        0x0a2
>  
> +/* DFP Capability Extension */
> +#define DP_DFP_CAPABILITY_EXTENSION_SUPPORT	0x0a3	/* 2.0 */
> +
>  /* Link Configuration */
>  #define	DP_LINK_BW_SET		            0x100
>  # define DP_LINK_RATE_TABLE		    0x00    /* eDP 1.4 */
> @@ -688,6 +692,7 @@ struct drm_panel;
>  
>  #define DP_DSC_ENABLE                       0x160   /* DP 1.4 */
>  # define DP_DECOMPRESSION_EN                (1 << 0)
> +#define DP_DSC_CONFIGURATION				0x161	/* DP 2.0 */
>  
>  #define DP_PSR_EN_CFG				0x170   /* XXX 1.2? */
>  # define DP_PSR_ENABLE				BIT(0)
> @@ -743,6 +748,7 @@ struct drm_panel;
>  # define DP_RECEIVE_PORT_0_STATUS	    (1 << 0)
>  # define DP_RECEIVE_PORT_1_STATUS	    (1 << 1)
>  # define DP_STREAM_REGENERATION_STATUS      (1 << 2) /* 2.0 */
> +# define DP_INTRA_HOP_AUX_REPLY_INDICATION	(1 << 3) /* 2.0 */
>  
>  #define DP_ADJUST_REQUEST_LANE0_1	    0x206
>  #define DP_ADJUST_REQUEST_LANE2_3	    0x207
> @@ -865,6 +871,8 @@ struct drm_panel;
>  # define DP_PHY_TEST_PATTERN_80BIT_CUSTOM   0x4
>  # define DP_PHY_TEST_PATTERN_CP2520         0x5
>  
> +#define DP_PHY_SQUARE_PATTERN				0x249
> +
>  #define DP_TEST_HBR2_SCRAMBLER_RESET        0x24A
>  #define DP_TEST_80BIT_CUSTOM_PATTERN_7_0    0x250
>  #define	DP_TEST_80BIT_CUSTOM_PATTERN_15_8   0x251
> @@ -1109,6 +1117,18 @@ struct drm_panel;
>  #define DP_128B132B_TRAINING_AUX_RD_INTERVAL   0x2216 /* 2.0 */
>  # define DP_128B132B_TRAINING_AUX_RD_INTERVAL_MASK 0x7f
>  
> +#define DP_TEST_264BIT_CUSTOM_PATTERN_7_0		0x2230
> +#define DP_TEST_264BIT_CUSTOM_PATTERN_263_256	0x2250
> +
> +/* DSC Extended Capability Branch Total DSC Resources */
> +#define DP_DSC_SUPPORT_AND_DSC_DECODER_COUNT		0x2260	/* 2.0 */
> +# define DP_DSC_DECODER_COUNT_MASK			(0b111 << 5)
> +# define DP_DSC_DECODER_COUNT_SHIFT			5
> +#define DP_DSC_MAX_SLICE_COUNT_AND_AGGREGATION_0	0x2270	/* 2.0 */
> +# define DP_DSC_DECODER_0_MAXIMUM_SLICE_COUNT_MASK	(1 << 0)
> +# define DP_DSC_DECODER_0_AGGREGATION_SUPPORT_MASK	(0b111 << 1)
> +# define DP_DSC_DECODER_0_AGGREGATION_SUPPORT_SHIFT	1
> +
>  /* Protocol Converter Extension */
>  /* HDMI CEC tunneling over AUX DP 1.3 section 5.3.3.3.1 DPCD 1.4+ */
>  #define DP_CEC_TUNNELING_CAPABILITY            0x3000
> 

