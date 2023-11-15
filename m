Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DC97ECA80
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 19:26:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1019610E506;
	Wed, 15 Nov 2023 18:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1537F10E167;
 Wed, 15 Nov 2023 18:26:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XbrRahwWUcbTEjo3WOQGb8p1JWDpCSmPcVefugsB4Ur51tBZSn4VqNQ74d1mT5falwOpxrUUuWXX3WTCO/vBLOUi4CvpOSGvwVbetvLTEQcAC6YHxECFjkMH5CQkdZ5P6pc9HvGH23e7ozr3Xb89BwJ4akGxJaqGKzcBSSLSfU1kEo5oQYnikjRkja4OwybFUU6H8Z5FzUcJZwwN1gsAgEM3rIBwDettoXB6Ypr0uNSfyX6XNBLI1WyUETphiRMyrXnAHbJC3lLMVTHpJgvW7ibMjJqup28n5pZmyzo4TvAakD/hP6Y0C0zUhsRN3Xf6qmyIq0zPZxpXMGCEzYxTXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVSwT2LiGTi4lK6JHTLUZQoCkKtrszWk6NB/oRWVF2k=;
 b=Y4/G5evdMfEqMnnNVJi0eZl0xtu8ExGwvE5QPVUfs1IMQmsnhHcHTVPvnjGfSSHqTV88MywvAICU739w6TTMbud+XrYIM5Cqqc/n0SyZ6xaec9i/1MUItoMVlaxaRRa+j6Rf//CHSexG4lInh/GKOrtgU6o14Xw9pVEOoucE/NOfdKQ2bVCZERWM8ha/XpSfpDYcEgxQ6Zz0imJdDOMP0SLd0p5UOrXN52I4rsdej2BtMnzInaDj5CY3lHLak+a9ZcA1OEdFyJLUkO+5166KBF7S666XhoF4/xTs9uA+aPBW4UttTjK6vptE0I9+RRKhHDmqOLBim6fYyVM+g0VoWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVSwT2LiGTi4lK6JHTLUZQoCkKtrszWk6NB/oRWVF2k=;
 b=Kz6TmV5Se3ZmpQQbBByJ8Sbp+ccYiYQNjk21fFeDQ2ZTyrSGVBnR2gW+hJYrp47+4WrpYGC/A37XLDqKCK5AE+VJ4sCT3NlALF3NQ/C8blSbgq29G45QYl/tL5a8buYyYoiigj+AEkneYJc50rr4ctarutNOAmonhws3iCvQezs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SJ0PR12MB7083.namprd12.prod.outlook.com (2603:10b6:a03:4ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.22; Wed, 15 Nov
 2023 18:26:23 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a%5]) with mapi id 15.20.7002.015; Wed, 15 Nov 2023
 18:26:23 +0000
Message-ID: <6fa34ca9-b95c-432d-a5a9-97843e3483d4@amd.com>
Date: Wed, 15 Nov 2023 13:26:21 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/32] drm/amd/display: document AMDGPU pre-defined
 transfer functions
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20231005171527.203657-1-mwen@igalia.com>
 <20231005171527.203657-8-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20231005171527.203657-8-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0256.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::23) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SJ0PR12MB7083:EE_
X-MS-Office365-Filtering-Correlation-Id: 18800c78-bfbc-47cc-b43e-08dbe6085f35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e3BLJZnVecJ43jFN39abSIeg4P2v8zYrtisG1izBAqXgboMHU8yxGx+LzQqZFWWyOPkQZpLzHCd+jCVgjmRHM+SmmlGmML91rkAQbNZcyFC2vhyAq9ALyKfMIedKVcqzh6wAgMhY/MDgk9onoUNIG0P+Yu1jIzyN9xOQJwe2BRlUYCcNdjq3LKUcen7aO4tSxZjtTnzXp3sDyY5pRYngDV++6fkHfSAuGqiLPM45K6mrfGZGnsw+diWlKvAzWgFd9ojfrV2DBiNrDX9QIK5YknwsXqjbwpsnXrZYIG2yQsZsbobhbZ8rGkf6oTm/TBz3C/zZW8GSfipNm5nheZVd16rrF801FqCPxnWVXOILl/blVakoFRdhEHljVYNs8oq5NmoP1vlkQ+KMeFtzb86jLMBlsmSV+e1QjSKM8zTTQoKlRtx5StFmn7FFwSbAZoZCGL6LzfI1q9TIKdu11lmoYWHio0b68gmK0kPdBg5CGle/iAa6XhPSB3AUJu2JDAwSlwhIEOlXK/4e9RAaRuI1aw7HWHc3gtXKeHpJO2ljxD7xBuABrHic86djrfGtrH+4m1XfMTcQzTQVcMy/s9kIRQB2HoZWxxwfYrXhjTffVk3h+9Ye3JZfL8mzvDslfArMTmqNge4mpKrmYLs5MeBr4LUdzNNSqktaqk9y6mtPb0A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(136003)(366004)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(6512007)(83380400001)(54906003)(316002)(66946007)(66556008)(66476007)(38100700002)(110136005)(8676002)(8936002)(4326008)(6486002)(478600001)(31686004)(36756003)(6506007)(53546011)(44832011)(7416002)(86362001)(5660300002)(2616005)(921008)(2906002)(26005)(31696002)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bi93RmM3VDhRR3pPNjcyVFJlWW5teFVHSzBmaFBFUjNhak9FMEZmeGxFbmwz?=
 =?utf-8?B?Wm53WDQzZnkwNkNhTE5lcmxEREdQTzhDVWZjdmczZ2dqVkIzZm1Rdk9YRjZ3?=
 =?utf-8?B?TnJMeWs1VTgwam8zSjlXbCs1eVVKSkZ5aXVGcHNLb1I3UzZheHVyeDVLK2dp?=
 =?utf-8?B?by82UTlBVVJHRDJDaENWU1p3WXVwWWpJMDNNMHIxd0cwTXZCamVJRkRVSjJw?=
 =?utf-8?B?a05lUlZIOUhuTlBCOE9QbVJlV09ZTGJjUy9yWnlMSXVIZmVnU1ZDY3pqeUk3?=
 =?utf-8?B?UisxMUFJWHIzNjl6c25idWhiMHZvSGkxdWpDbnBtbjc0L3NuSHd5Z3YwbGJD?=
 =?utf-8?B?UGpyeVExOXhYVmIyOE1CS1dDcUpBMHFVbU5KL0hLQThVQkxWRG1qdHdWL0RU?=
 =?utf-8?B?azdkcXdLM2UyU1ZXQW1tY0I2UWoxbDE1YkdxcGFWTjdYUGE0eDJyTC9qdmRR?=
 =?utf-8?B?UFovb0duTm9XeUtBNHh2SHBnTFgwMERyakFidG44S1FCdzRtSjZkNG1ORGhl?=
 =?utf-8?B?eVFKK1k1eEhnYkVvY0lIVlFtVlUvYVZvN3ZDZkJtcW1zcUFjREpKR1hGS3dE?=
 =?utf-8?B?YzRYOFpFaUEydXNmUnIrekh3bXdlYTEyRFhmVzhuT2VDZXRRQ0lQYWNWZDdK?=
 =?utf-8?B?M2NncGtEckdZSDc4UlZYcVpYdWFIamtiNnVMKzE3bXRVZzdZSGIyVmhKVjdt?=
 =?utf-8?B?cklPSTE3clozWGFKQUwweTIxczBNVEtSQnJBbnRwTzF1ZTljeDA5RUlZaDBm?=
 =?utf-8?B?TE9aM2RLbjc0a3pLWHU5aVJMOTZGMmZJY1Q3WkVOS1FicXlOYUlNZ2tLbnU2?=
 =?utf-8?B?WXUvemgvc3Jnb2djck1SbFZyblFoQVFkMFZsZUJiOXBNRXJBSzNxYkNCVUFJ?=
 =?utf-8?B?MnErcWVPNFVQSExjSnJvaCtqMVJzQlhtb3F1bmo3bUZzdjFxb05wVUpHZU04?=
 =?utf-8?B?Tk9ZTG1DNHdid2ZWZzhVMmtkNFA3R1NaWTVvLy8xVTU4ZW5TRDg1bzh4Mnp4?=
 =?utf-8?B?b3VXN25la0hZWHZNNms1R1FCbDhwUmI1Y2xUQjQwY1Mza05tQUNMbFRRbTZi?=
 =?utf-8?B?WGNscXBmb0JCeTM5RU45Vm9LVmlKaGpNellKQWh1cElDZ3htanFvY1ZUQ2sy?=
 =?utf-8?B?TUVxUUZkS2NkanJlVHk5Y09BeHdwQkVpa0JaazBLNkNDWGhqS1l5b2I1RzRz?=
 =?utf-8?B?UFRtV04zVFl2MWFIbkd2VE9HWEFDbm84Y3lyU29PQ092OUhvdWZFWW1pM1Ez?=
 =?utf-8?B?Z04vTjRGWmQ4U2dWcDMxbEVCd1pWYTRVeU0vODVBYWxaa1NlWWNBVW1HOEx5?=
 =?utf-8?B?b1N6b0VQYmFYU2lDM3NYZFRDalU2MzZwNFNYdlQ5VHVGNGRVZTFzYmRzRGk3?=
 =?utf-8?B?WnZ2UGVnRWtMeldwVkd2VWo1OWt4QXVDUUZIYzgzVkNCKytGVEtoOFlKV1Jh?=
 =?utf-8?B?cTVSQUR2NWg4cjdoWlNNYU5BR0NXTnRoMVI2REtCNjhYVjBUQUoxa1BldWhC?=
 =?utf-8?B?WFRJWjgrblhNZjAyZ2NWazdqMHVKWlFGRkZqQWlmUVMrQ3N6MHJ6QUVQN2hD?=
 =?utf-8?B?UlY2eG5kTDViZVdKQ2J1YXVETnhlNzVLS0pQWVR5Tkt5K1BZSjVKQkNoV3pj?=
 =?utf-8?B?OFpwMDFQZ1k3V3lUOUh4Y3k4dDRFREo3V1VQOUJVbnJBM0FYVU5WZHNwSXQw?=
 =?utf-8?B?VVN5aEV3Q2lOd0FRRytGanI5NU9weWtCNzQrS1U3YTdiN01iaVV3U0VKcy9v?=
 =?utf-8?B?cGx0d1ZTZno4MFRsR1cxRUpiKytNZWxQTjRtbis0VWU4TXZxQng4czVjUisr?=
 =?utf-8?B?czBIdkxaTFVhRCtQNGlZV2djb1BtUUJUWENYSklnaU83R2MybnB4MzAwMFRp?=
 =?utf-8?B?U2s3OEM4N2F3dWJ6Q0puL05oTk42NC9hY2ltclBHYVcvU25kRXBmTTRKWWJB?=
 =?utf-8?B?VHNLa3lKMlRJMVd5QS9VUW8ycytEZGorVW50aGgyUFd1TWtZajJhWmJkT2xu?=
 =?utf-8?B?KzFMbHpxTHh1SUtncXZWNm9nQlBjRDZhaEJMR05CSk9RSlJoWkVWOEJSZzdJ?=
 =?utf-8?B?Z0NhZGp1SUtKbHozVnlLSytISDZKS0UzcHZOUXN4WThOZWlVVDdWbno4ZnYy?=
 =?utf-8?Q?GpXJ2R7XvjyfGJHI1eJYYkpKy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18800c78-bfbc-47cc-b43e-08dbe6085f35
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 18:26:23.6340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7P5juw/suOOBXmVGi/UwbN7ESXn7rptIzmB5KFLrJUEstnbTlYCsdt58P3l0Gcs5XuEI5pMqY6vTDL3igSr0Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7083
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
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-10-05 13:15, Melissa Wen wrote:
> Brief documentation about pre-defined transfer function usage on AMD
> display driver and standardized EOTFs and inverse EOTFs.
> 
> v3:
> - Document BT709 OETF (Pekka)
> - Fix description of sRGB and pure power funcs (Pekka)
> 
> v4:
> - Add description of linear and non-linear forms (Harry)
> 
> Co-developed-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index d03bdb010e8b..d5dbd20a6766 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -85,6 +85,68 @@ void amdgpu_dm_init_color_mod(void)
>  }
>  
>  #ifdef AMD_PRIVATE_COLOR
> +/* Pre-defined Transfer Functions (TF)
> + *
> + * AMD driver supports pre-defined mathematical functions for transferring
> + * between encoded values and optical/linear space. Depending on HW color caps,
> + * ROMs and curves built by the AMD color module support these transforms.
> + *
> + * The driver-specific color implementation exposes properties for pre-blending
> + * degamma TF, shaper TF (before 3D LUT), and blend(dpp.ogam) TF and
> + * post-blending regamma (mpc.ogam) TF. However, only pre-blending degamma
> + * supports ROM curves. AMD color module uses pre-defined coefficients to build
> + * curves for the other blocks. What can be done by each color block is
> + * described by struct dpp_color_capsand struct mpc_color_caps.
> + *
> + * AMD driver-specific color API exposes the following pre-defined transfer
> + * functions:
> + *
> + * - Identity: linear/identity relationship between pixel value and
> + *   luminance value;
> + * - Gamma 2.2, Gamma 2.4, Gamma 2.6: pure power functions;
> + * - sRGB: 2.4: The piece-wise transfer function from IEC 61966-2-1:1999;
> + * - BT.709: has a linear segment in the bottom part and then a power function
> + *   with a 0.45 (~1/2.22) gamma for the rest of the range; standardized by
> + *   ITU-R BT.709-6;
> + * - PQ (Perceptual Quantizer): used for HDR display, allows luminance range
> + *   capability of 0 to 10,000 nits; standardized by SMPTE ST 2084.
> + *
> + * The AMD color model is designed with an assumption that SDR (sRGB, BT.709,
> + * Gamma 2.2, etc.) peak white maps (normalized to 1.0 FP) to 80 nits in the PQ
> + * system. This has the implication that PQ EOTF (non-linear to linear) maps to
> + * [0.0..125.0] where 125.0 = 10,000 nits / 80 nits.
> + *
> + * Non-linear and linear forms are described in the table below:
> + *
> + * ┌───────────┬─────────────────────┬──────────────────────┐
> + * │           │     Non-linear      │   Linear             │
> + * ├───────────┼─────────────────────┼──────────────────────┤
> + * │      sRGB │ UNORM or [0.0, 1.0] │ [0.0, 1.0]           │
> + * ├───────────┼─────────────────────┼──────────────────────┤
> + * │     BT709 │ UNORM or [0.0, 1.0] │ [0.0, 1.0]           │
> + * ├───────────┼─────────────────────┼──────────────────────┤
> + * │ Gamma 2.x │ UNORM or [0.0, 1.0] │ [0.0, 1.0]           │
> + * ├───────────┼─────────────────────┼──────────────────────┤
> + * │        PQ │ UNORM or FP16 CCCS* │ [0.0, 125.0]         │
> + * ├───────────┼─────────────────────┼──────────────────────┤
> + * │  Identity │ UNORM or FP16 CCCS* │ [0.0, 1.0] or CCCS** │
> + * └───────────┴─────────────────────┴──────────────────────┘
> + * * CCCS: Windows canonical composition color space
> + * ** Respectively
> + *
> + * In the driver-specific API, color block names attached to TF properties
> + * suggest the intention regarding non-linear encoding pixel's luminance
> + * values. As some newer encodings don't use gamma curve, we make encoding and
> + * decoding explicit by defining an enum list of transfer functions supported
> + * in terms of EOTF and inverse EOTF, where:
> + *
> + * - EOTF (electro-optical transfer function): is the transfer function to go
> + *   from the encoded value to an optical (linear) value. De-gamma functions
> + *   traditionally do this.
> + * - Inverse EOTF (simply the inverse of the EOTF): is usually intended to go
> + *   from an optical/linear space (which might have been used for blending)
> + *   back to the encoded values. Gamma functions traditionally do this.
> + */
>  static const char * const
>  amdgpu_transfer_function_names[] = {
>  	[AMDGPU_TRANSFER_FUNCTION_DEFAULT]		= "Default",

