Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC39A7B265B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 22:17:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C5C10E6AB;
	Thu, 28 Sep 2023 20:17:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A6110E6A3;
 Thu, 28 Sep 2023 20:17:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRZk/h+B3iCE3wS1Bpr53PKvw9j9R2Ce9/ySxUb+G3bD3R+1qb/qbSHQsD5A5CG65MC3yi8LuGPv0mehnBDKjFHUk6Tcpv8U4fsP4f8NYhenOjRUsMNu8gFwgtuE2ynFGwwbjtH2whkWkd4kT++UtzsaRVTbu2Xah4e2HYHzf57pZk2eHcQk+zSoXhNoVVzbcYoeLvzMOo8+ZmOSP8eu5dgS6rrRDNAx8r5fPJkOm88OS6OC/YYPZFMPfpzj70uwXsma0HK+aBcCnRkcXUuBTzBHcAR3F6dZhS1qPqFz+0+WXwshbdD6KdoQiz3NKK44oSecCoI9foDhxm2MKbTTTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=attkzSJ5T9jecgR1FmoKEARY0xUSNwEIJI/TxVZftLA=;
 b=bA1fehs+T1OWrumVQ3JOb9CfsjEKnm2ESVK1++Sb8kssz471/kfppQmuLgyq8W8JQyJVTIPrNvEQD8Yhtx5noQwltR0E7qg/ttDuIFfrtClNSIaoaLpw7Qzpyfww4cRNwAfX/Fe16ku9ndwQbaeyhaoZqS8ECrHaSJyZ+WT/0uPCro4d9jwxWQwlONVPOVVpC4owET+9Wn60k9+zRO9S/6+7F6O0kWzgkZfPhPHsbMj0Kmw+XT6wonaB9Rq88h9I6zRRs9LoFma8gcY306vEUh2EpQAJLXONpZdSw++Ad5/PA5SjUE8somxlWKZ32b6BE3K/MfT6FdWWUS5sOjYRfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=attkzSJ5T9jecgR1FmoKEARY0xUSNwEIJI/TxVZftLA=;
 b=uK2hPBd/yOi2iRFXUMUUH3MW1IBOLN6q30v0xvAQ5r7lYtK0hAUmh5N3k976PI4JqEPqRHuN3RuLjo3zC53PJZpv5HhfHPC+4Hg1CjhmA5riV4sPUT0Oewfd6iNhclbYhg0UEJRNHhspm0cp9V5wguZTzIsS7AloeX6fuoZifVU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SJ0PR12MB6758.namprd12.prod.outlook.com (2603:10b6:a03:44a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Thu, 28 Sep
 2023 20:17:03 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6838.024; Thu, 28 Sep 2023
 20:17:03 +0000
Message-ID: <c1f850e7-7442-4cb9-a83f-289d467dc749@amd.com>
Date: Thu, 28 Sep 2023 16:16:57 -0400
User-Agent: Mozilla Thunderbird
From: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v3 07/32] drm/amd/display: document AMDGPU pre-defined
 transfer functions
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230925194932.1329483-1-mwen@igalia.com>
 <20230925194932.1329483-8-mwen@igalia.com>
Content-Language: en-US
In-Reply-To: <20230925194932.1329483-8-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0124.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::14) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SJ0PR12MB6758:EE_
X-MS-Office365-Filtering-Correlation-Id: 14ebaf27-7248-49da-1e72-08dbc05fe0a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wJWPRkfE0wXwjRGwzziC0eTqhHh4biH77xBCQ3/+wMzOVgLyLutv8BXM1BrdNXbohrDNlz2HuxtWfhylhL0q8Sv/z1GegytwHTlSF443gCrt7K64M7t/Y+WRV1GWcD0tHmVE2IIlSjHVDCRd5zQbA55dvvsrB/dGe9G3JMwAX6FJ7OR1CggO3vZLLTELIlalaZG6IyXB+LXs5ih9uMIOf1VOClsj6VgJNn9tBCjxmkB+rCQSptuqa9z2M4hVjC8fierqU5O5M0+K8m6TSK0t6nUf3Kq2zSOceRjWM7qtKYFOdlwKbHzYwGr3q7sJ+3OZGfwzfuKZuZGEcF3Tkx1N7Bmbte0xqOJ806jUo9vrG3IRnop+vuQMJvFMiso767ZgfiHw2rSp6zf2FfgUR9JOyuhK60yPeRxKXzUnjl6+C/Rif4Ea1Iw1ba++Xoz+3hZqyuAfRSa9jRSh6CEtDbiOZZPtA/Ghk8mwdrbOjqbAw5ysHS+a2H352KstGvBzCBoM58dPLLfm/JNJdOcgxmvRhM7xR6XNe+FpaSRDEXD59uHYcL7/kcfiuEks+flc7RCKP3InYBrLDAtbPTm6j3vQnLNonVvDnOX6qnLuQII27fEtSNxtQWuXW26AkbqCVXxvhlgjvbIQwa4Zn8ZAu3kE/r5208frWuY6h4NOD5coRY4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(376002)(39860400002)(346002)(396003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(26005)(6512007)(6486002)(53546011)(6666004)(6506007)(478600001)(83380400001)(5660300002)(2906002)(2616005)(316002)(4326008)(8676002)(110136005)(66946007)(54906003)(66476007)(66556008)(8936002)(7416002)(44832011)(36756003)(41300700001)(86362001)(38100700002)(31696002)(921005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnQzenJSWXgvcy9KTEJTUXJjOEdhWHpDVTROU25DeHFGMUEzSmVtRktseHVO?=
 =?utf-8?B?TXYwVlRnMkY4K2ZyTUlnMUVKN1g4V1RsUlFPOTJ1WWthRlg2Rm1xREdkLzN2?=
 =?utf-8?B?cGFFeHl4QitCZTVZczloOStPMWluNHN0REV2eHBNUjJIV0JIL0RHU0xZeE9D?=
 =?utf-8?B?bGJFTW5DdG5qVC8xUldISkdLVWJFeDlBUmhhc2ZHdk1ZeEdRWGpXaXZMUHpB?=
 =?utf-8?B?UjZaVmpMQU1XM1k4bm5hWHhHeGxYTGhQN3lUNlU1TUNLbVNENXNYL3lXYWl4?=
 =?utf-8?B?OE1jSytkdnpjbE1VYmNnMldhOVlxK0psNFVMS1pia0JhTldGT1kreUlEN05C?=
 =?utf-8?B?c0tidFV1blFnY1lCRlR6QnhWWUxGK0ZTQlBvaVlBb1phdlVoWkNKNWIzRk9u?=
 =?utf-8?B?dVBQM2RUamg5QWx5VkZlN1EzQ01JMVVHUjRNR1VJMDlRNnlqT1E3NUxvY3RQ?=
 =?utf-8?B?WGZ0cmVzOThGSVBFR21ad2V3endyTnNCMVpmdUgrT2RKSXJQbHVRRGZwSGlZ?=
 =?utf-8?B?V0xCWXlVTEQvSGhsVVB3UEphYzRMM2V1Qm1JclYxMnE0U3RHazlLSzdNQzBu?=
 =?utf-8?B?dGVNMVFjQ1JGR0IxcXlzeUkyeERYUW4yZjhRaGFCSXN3dVRnY1hxbnB6L2JE?=
 =?utf-8?B?V2NNZUlVYUllcklDV3dIWm9YalNsMVU3SnNyZk1Ma3VXWHVOYjVIVkQrUzA0?=
 =?utf-8?B?REFaOTJIMEZiNm13d3NDNEtBTGh0WUI1eHhEVnkxNEFKb3l2dWgyaVUxMzhv?=
 =?utf-8?B?empiVTdVazlIYk83c3FBU1h1LzI0UEJEcW5TbCtzZlV4ZWJKQ0JCQWROYkxI?=
 =?utf-8?B?dG04dzIrNDFJTVZUS0RWMlU4cnA1VFRXenhib0hhbVVsVDJQcEswaXJkL1Fy?=
 =?utf-8?B?V0NxVmVWNkM3bVNzbzJLcFV1czhUR0JIN3JJZ2g4aEIvNXd0VU5tcWF2WFoy?=
 =?utf-8?B?TGVYOXVXTHpGMUQ0NzdoZU1iMStwT2hKQUZ1TnJtVzd4Q1F5RFJjdkZQZTFS?=
 =?utf-8?B?dG4rTVBFOFVFVnBmZkpuK3lLSWUxYlJtVlllMDlMcG5WQjRraytBUUNzeFRO?=
 =?utf-8?B?UjJ3Q3pWcTZiQ0taN3BHb1NlQWFDL1kweTlSWTJldkFUUVI4VHZzRVVJVFhm?=
 =?utf-8?B?clZVOVRkV01nbmN6bWU0b3J1NDlnRjE2Ukw4NWE1UWhzUHBFOXVhQURuZURX?=
 =?utf-8?B?eHlVLzhoeTYxbDlWUXBxU242VHdkeitFc3JBYzNEeUdVaWsvQkhUenRsNmZ5?=
 =?utf-8?B?QzIvYnJYdFpySzRBQkxHWnM4akhlN21nVHgzdVhuTkRQeDI0OGhlUkE0dzBM?=
 =?utf-8?B?Snowa2hLbmpzUXJ5YzVkOFZKa1gvOVh6T2taNm0zTitBbjZ6aDNnejA0Ymxz?=
 =?utf-8?B?bUFEU2dONVZ3WnB4d0hpQVQ2NWs2T1NWQWlSYklTSk1CMGppNHNkRU5KTFlE?=
 =?utf-8?B?dlhBNjNFV1AxNlYxb1pqOXNwWm5XcGwvWUVjVGFaOHlzQlc1TldjU0dhVWNp?=
 =?utf-8?B?SnNWSnZlWTlzYVRLQnNORnVjS3V5TkVSelhGTi83Vjg3eEY1SWZISnpsaitJ?=
 =?utf-8?B?VkoyeTVlNUFRSFZCclFvblNSbFNWZmx0OHFwa21aZzRRVWM3eXNtMHlQWkdU?=
 =?utf-8?B?a2FZd1hXcXJXN2p6QmZGdHhlWis1MElzWnA5bWwrNDF2L3FQQjVvOXFDbGlZ?=
 =?utf-8?B?WlQxdVhyNnNOei9YYUdaSk9iNEgvRHJ2NU11c2Fvd0RWU284NURISXQwSm1H?=
 =?utf-8?B?anh1MjdiSjZ1VTJCL3Q3TWlKQ3ZWVVB5Zll2U1VIY1IzS2sreUFldWpTVUph?=
 =?utf-8?B?NCtITGExT0hhOTR0MlRzdkNHY2h4MjRvb2NoQ0huUlNhbGFPdmRhRUM4blVH?=
 =?utf-8?B?Y2pac05TUVFUR3dRVFFhUXRKaFh2cDgrT2ttWjVDazhxVmU3RTRTaWdsNTdV?=
 =?utf-8?B?eEwvQUJibkZWeURFdXZuNndCWjhXbmIyY2cvdGdMbjFRMzdLZTNTOVZQUVE0?=
 =?utf-8?B?OTRqSjE0cjdrUnVaMXg5RGdMenpLdTRoYkorUTVOcHNyM1JMTTdRbkxRbEZV?=
 =?utf-8?B?SStLQjF1R2Fib0ltSm8wSXF6TGowM014OTBhdFhGTjNTdEpITTVnVi9XdUp2?=
 =?utf-8?Q?26NRyH8zYuQkvBOAtJ6PRcRfp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ebaf27-7248-49da-1e72-08dbc05fe0a7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 20:17:02.9550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +hMrLI7neiYy0E+NkALS1B+FkFVBkQxX+pncj+Wq8jmnRHRiBiSKgFU6VuDZGAc4g5syehC7cTFkwTqUqVuDpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6758
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



On 2023-09-25 15:49, Melissa Wen wrote:
> Brief documentation about pre-defined transfer function usage on AMD
> display driver and standardized EOTFs and inverse EOTFs.
> 
> v3:
> - Document BT709 OETF (Pekka)
> - Fix description of sRGB and pure power funcs (Pekka)
> 
> Co-developed-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index d03bdb010e8b..14f9c02539c6 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -85,6 +85,45 @@ void amdgpu_dm_init_color_mod(void)
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
> + * - Linear/Unity: linear/identity relationship between pixel value and
> + *   luminance value;
> + * - Gamma 2.2, Gamma 2.4, Gamma 2.6: pure power functions;
> + * - sRGB: 2.4: The piece-wise transfer function from IEC 61966-2-1:1999;
> + * - BT.709: has a linear segment in the bottom part and then a power function
> + *   with a 0.45 (~1/2.22) gamma for the rest of the range; standardized by
> + *   ITU-R BT.709-6;
> + * - PQ (Perceptual Quantizer): used for HDR display, allows luminance range
> + *   capability of 0 to 10,000 nits; standardized by SMPTE ST 2084.
> + *

I think it's important to highlight that the AMD color model is
designed with an assumption that SDR (sRGB, BT.709, G2.2, etc.)
peak white maps (normalized to 1.0 FP) to 80 nits in the PQ system.
This has the implication that PQ EOTF (NL-to-L) maps to [0.0..125.0].
125.0 = 10,000 nits / 80 nits

I think we'll want table or some other way describing this:

(Using L to mean linear and NL to mean non-linear.)

== sRGB, BT709, Gamma 2.x ==
NL form is either UNORM or [0.0, 1.0]
L form is [0.0, 1.0]

Note that HDR multiplier can wide range beyond [0.0, 1.0].
In practice this means that PQ TF is needed for any subsequent
L-to-NL transforms.

== PQ ==
NL form is either UNORM or FP16 CCCS (Windows canonical composition color space, see [1])
L form is [0.0, 125.0]

== Unity, Default ==
NL form is either UNORM or FP16 CCCS
L form is either [0.0, 1.0] (mapping from UNORM) or CCCS (mapping from CCCS FP16)

Harry

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


