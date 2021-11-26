Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3579645F286
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 17:55:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE886FA9E;
	Fri, 26 Nov 2021 16:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2082.outbound.protection.outlook.com [40.107.101.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A5D6FA99;
 Fri, 26 Nov 2021 16:55:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EUOpkYeNDWKZX+qHZd9v1AZ2ZlPO93vkJsPOJy1sr9fZltqmP8AKMqiDumgr6y5aHr2zcM21Hvbtjgg2SSMjMobbDw+JK+A9FKA7R0Vz+bNKYiUb6oM47aUJV3OjmAW4xPD79IQTWCCuxU1/2xRJ0oT2iVA7O2RDVu4wlCRQ3u5c54Tsrcc0oQf35JrEUUvvVCpRRP48NN9U3fbwHMaU0OF0/XwQ1Di5eCJ/uTZUjvoMmiJIdi0o0mNl91KHWxTO2A9S6fgWk/flMyQcFrDodNuR/pwOrGWdGJ1odVj2PTIEPXyKeDoXYz8IjSTCLxioO6qefa/lR2UnGe/REsktvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3MdDfHVMmFIPY+UhFwwXZtMUJ3dWPHQxD9ATt5Fe6/0=;
 b=QEHB2CgR7lRpX98/ZrfyU487gsD8ui9ixEPaaymDhXMSe6l+axaeeyLI9C9l+UANbXyrMxzVLsRWOere0kaOT74tB70SFmJiKgT+5QTxQ2VlFOLOrZ0LZFIOs/rXXtHcTZlKSRtJHjiZ2vAAF0bLCZWbqUSJlijytHg77qnkozLNi9ODsSx7mECMn36nXomAgp17a7KlxsGMeZecAJzj/gnkuzx5EUM/0BeVYf0HjcEyMG6Oz2JA1eFeIYE/zecWV1rTZBO8urho8Ld/3/eJcq+xlP1cgTy71U0xih3ezreK0Ao96azax4x3piBcsINlFxqzp9WBMWbrcqoQUAQ28g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3MdDfHVMmFIPY+UhFwwXZtMUJ3dWPHQxD9ATt5Fe6/0=;
 b=qj9XE2UcES01/g8QEQ1vT7f8PhL5QkNgTzpNPBq2gC9odLGxtCUxZ1F6+WforNYq9Q0xk6opjK84vbWp7xCRGT4NBOT6rsCalr1tg6jdQd7eYkK5tG+P+WJPq4TMlhuxT19OQ5fmKfwdUNTVNHJ+ufFdhkFelRYYPxmz1DG/Ja0=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MW5PR12MB5569.namprd12.prod.outlook.com (2603:10b6:303:196::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 26 Nov
 2021 16:55:05 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::e492:c86b:9906:1b46]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::e492:c86b:9906:1b46%7]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 16:55:05 +0000
Message-ID: <bfd0e880-491f-015b-256d-9adb0193e78d@amd.com>
Date: Fri, 26 Nov 2021 11:55:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [i-g-t 04/14] tests/kms_color: New subtests for Plane gamma
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
 <20211115094759.520955-5-bhanuprakash.modem@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20211115094759.520955-5-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::15) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR0101CA0142.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.19 via Frontend
 Transport; Fri, 26 Nov 2021 16:55:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3592ddcb-2ea9-4472-e7ec-08d9b0fd7eeb
X-MS-TrafficTypeDiagnostic: MW5PR12MB5569:
X-Microsoft-Antispam-PRVS: <MW5PR12MB55699702C1BE49441A38A2C18C639@MW5PR12MB5569.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zeDmlR+Sqr8ruN8utBw5IKVlaFLW+JuCbD/sw5xqTmiyyYESXO+t4c7t5bPY1JqQF9gHVslB3s39h1E0GUv3lJiBNpAshxe7RfD66M/t2NJ7INoh7/wi1o2/xd8HL1LHpQGkEop0fNEJlMtpdFbBnL/b12r4K8sWmhaOTOLhkexRym6ljvxl34VQ1GWMuuy880cFW3zCStftUdfsDGj1Wlc9siH5laHLZ/7s2ZeW/9AGvfb+0Q5qlOeRLjq+D/BkhLZ1+1RFaOvFHrLZg2UjmYI9cBOIGSaFgdiWi+7Ep4vueLZV078axaEUBaZchITPIvnGwf4VNgfbeVpfbjpmdFwPwdO6KHE1wg8XbLy/9HFiKr+OR4/xhmUOZS/Ghi3Bdk2ZktN3yzNqSWE7Mcf02GkRECjAWjkGmyowUtEeeCtHsJI7ePVLUPqJjsjIAZ2OqdWfhrysvX5Wz+vyKgp8JwvfAd5vAsjbDWqVEK7/W0wCDapqcjiPnF9Fr8NGmpEYO3flBkQGa+jQ4FfVd9GBVXYobO0HQ0AsOEeouNWOr2r9gHrjLZZGAbEpbfxSB/t/O4bFWxwj2h1Uo42cKpTmyZ7Mu7Hw6OoXu9ZKdZQVHdqDFQ9IROLWB2spHsn+fDWTMtc5syxftImb+9FdtJtxElc0RWDZrgwwSHV44SDZcB0AIZe77LfUxz3FD49zoNbbAJT8XW3ZDHdM3W+k/PRAzMFSqgrfFBEUsLCXJVHVet8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(53546011)(54906003)(26005)(31696002)(186003)(31686004)(38100700002)(66946007)(66476007)(66556008)(16576012)(508600001)(2906002)(36756003)(316002)(44832011)(8676002)(956004)(8936002)(6486002)(4001150100001)(2616005)(83380400001)(66574015)(4326008)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDFadE5IcUlndHo3L2IxQjI5eGZteFF5amkzdXVOT3hTbk1yOWMvRTEweURG?=
 =?utf-8?B?MndDWW1EQXV1KzdYL1VxR1RGVi80akpuSkprd2p0L3ZIdkFDdUFxdGVUTWVK?=
 =?utf-8?B?YVk4Y2JiWTE0bEhwY3A5ckozK0wzS1ZvMFIxSjdlTVFwNmxYbjZDeS8yVFhW?=
 =?utf-8?B?RW1iK1R4VVFuMVhITFN0THEveWxFRExjeTZGa3kwQjBhNzVCVGdpRFo3NTFH?=
 =?utf-8?B?YUViM1p0ZjhSMnBzWWpvOEtqNnNGZzZ6dXZtWndNYXdGcFVRSFlIWHBhWHJL?=
 =?utf-8?B?c3FxSnR0RG1BWWxsaGIzeDNKYkxJK1F6c2tBWHNjdUNGcDRTakVtYnY2OUpX?=
 =?utf-8?B?ZGhCQWtPdXJOWXdLNXFDYStETmNTdEFCam1ZN3VRYXdmZlNDMWZHbXR1WjJV?=
 =?utf-8?B?VCtTMFgyK0RwYXRiTk9VYS85Q0R6VjhpTFpFSDVXQ2lEaTRXUzg0KzB3enhz?=
 =?utf-8?B?SlArNXA2Z0o4bU9pUkVIZVRwTWhlaXlNV2dDajNBQkFuWXErWUZlL0xnQjEy?=
 =?utf-8?B?NGlkVmo1U2tBNjZyckZXU3ZGbTNmN3oySlFZYVphTlVuT0t3NDRsSUc2b3h0?=
 =?utf-8?B?SWRrZi9VMWdNcklDVmtWaHhSVW4wVXp4cVpnV3R2RStnUFNNR1VNY1lZTUNC?=
 =?utf-8?B?Qm8rVDRRQ09kbC9vTGI2L2Y5TWVENC9kNVo3ZXdsejRvWXJVVlBzRHJxdVIz?=
 =?utf-8?B?UGxUU2tRM2x4VGxJQmh0WkZYQlllaTRPeWQvcGVJTE5KTjhOMG9XR0MzVFUy?=
 =?utf-8?B?Y0F5b0E2V1NpUUJsWFJLMjJjeFdFRTl1V1BYQzlWc0JWeE0yTXFIVWhFNnE0?=
 =?utf-8?B?QTYvSFlDdEl2S3YwaTl5QUtrYzdyaDZlbFRQOTk4akVjRklJdnBDTndYcFpZ?=
 =?utf-8?B?a0k4TDc3TmdXUW1IaS9LV2JiSVZiYzhRNE9DNFdlSFlKL09uTGNQVTNuYnMr?=
 =?utf-8?B?NVZJaXQvMnA5VEZXQWtUV3hBWVNDVDIxTTR0UlBaRTV1Y2hFejZQNVdTZFZT?=
 =?utf-8?B?RE04dlVSNzdZMmdFYkxkTzZSUlZmUEUrS2hGQlY1Tk5xUEg1QldvQ2EyU0x2?=
 =?utf-8?B?NmhvdXR1T25ybVMzVy9zTmljUWZ2QjNFR016ckxtTEl2K24xam50aXV5STZ6?=
 =?utf-8?B?c050eHU1VjJxK2Q3T25mWktoM2hXWFp6ZUR0cVRjK3prSkNSY0d5aTR1TWls?=
 =?utf-8?B?eUo5WXhUN1dDOVJhQkl3Y0RUaGdHRjBsUjgvU2FoRkplRzhnQm1OTU5sZU9K?=
 =?utf-8?B?M2gvcXJ2QjlGZmJjVXA4ekF0R25PVTQyUXk5UzgwUkh5YTVIZXIrRjEvbXMy?=
 =?utf-8?B?ZjRIVnBZbncrMmhQMUJQR1U1RjJuUTdmYUVjcWlxQ3k3M0VnRGxvTjJ4NHF1?=
 =?utf-8?B?a3ptQitsamVzVCtmS2hQNXR6Zko3V1FvaTh0eW1ES0MxK1hDc3BmSXZBRkp3?=
 =?utf-8?B?SnZnU3RIR2dFcVZ2aE9BQXhPVTlLaGZvcXhCVmhieW9sckVIa3pieGQ4bHVE?=
 =?utf-8?B?LzJDeUszOUx3QkZUUUl0Vy9jekhhOERzSGRtZDJUZVNuRHluN1BIUEtETDZS?=
 =?utf-8?B?UFZBWlFhczVzSkUvbURVMFNuUmhrUjhLdEpyMjl2KzA5NFJUd3N5bkNlTlZZ?=
 =?utf-8?B?ZkNoZGVJTFB4dEovNnV4SC82djRJZW9JeCtjeWNuWTM2WUJFRndOZVgzdDdL?=
 =?utf-8?B?dUo2eHJzUkxJSmg3RjNUdHRIVWJjVVBHRm5rWkJIQndqT01KZ2liNm4yNmpB?=
 =?utf-8?Q?PshEeExX0EI1py7OCR5VmtGc8zlafXqoQmssEk2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3592ddcb-2ea9-4472-e7ec-08d9b0fd7eeb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 16:55:05.4260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zKZlQ6+PtGvB9Q9/2e9g5aLVobTHFPshNo74fohGIaiDhGTMKV8hsrajORfYSshufK1yABP3ldX5E2GIos4oFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5569
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-11-15 04:47, Bhanuprakash Modem wrote:
> To verify Plane gamma, draw 3 gradient rectangles in red, green and blue,
> with a maxed out gamma LUT and verify we have the same CRC as drawing solid
> color rectangles.
> 
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_color.c | 179 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 178 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 775f35964f..b45d66762f 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -24,7 +24,34 @@
>  
>  #include "kms_color_helper.h"
>  
> -IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
> +IGT_TEST_DESCRIPTION("Test Color Features at Pipe & Plane level");
> +
> +#define MAX_SUPPORTED_PLANES 7
> +#define SDR_PLANE_BASE 3
> +
> +typedef bool (*test_t)(data_t*, igt_plane_t*);
> +
> +static bool is_hdr_plane(const igt_plane_t *plane)
> +{
> +	return plane->index >= 0 && plane->index < SDR_PLANE_BASE;
> +}
> +
> +static bool is_valid_plane(igt_plane_t *plane)
> +{
> +	int index = plane->index;
> +
> +	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
> +		return false;
> +
> +	/*
> +	 * Test 1 HDR plane, 1 SDR plane.
> +	 *
> +	 * 0,1,2 HDR planes
> +	 * 3,4,5,6 SDR planes
> +	 *
> +	 */

This seems to be about Intel HW. AMD HW for example does
not have HDR or SDR planes, only one generic plane.

> +	return index >= 0 && index < MAX_SUPPORTED_PLANES;
> +}
>  
>  static void test_pipe_degamma(data_t *data,
>  			      igt_plane_t *primary)
> @@ -638,6 +665,122 @@ static void test_pipe_limited_range_ctm(data_t *data,
>  }
>  #endif
>  
> +static bool plane_gamma_test(data_t *data, igt_plane_t *plane)
> +{
> +	igt_output_t *output;
> +	igt_display_t *display = &data->display;
> +	drmModeModeInfo *mode;
> +	struct igt_fb fb;
> +	drmModePropertyPtr gamma_mode = NULL;
> +	uint32_t i;
> +	bool ret = true;
> +	igt_pipe_crc_t *pipe_crc = NULL;
> +	color_t red_green_blue[] = {
> +		{ 1.0, 0.0, 0.0 },
> +		{ 0.0, 1.0, 0.0 },
> +		{ 0.0, 0.0, 1.0 }
> +	};
> +
> +	igt_info("Plane gamma test is running on pipe-%s plane-%s(%s)\n",
> +			kmstest_pipe_name(plane->pipe->pipe),
> +			kmstest_plane_type_name(plane->type),
> +			is_hdr_plane(plane) ? "hdr":"sdr");
> +

is_hdr_plane is Intel-specific.

> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_GAMMA_MODE));
> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_GAMMA_LUT));
> +
> +	pipe_crc = igt_pipe_crc_new(data->drm_fd,
> +				  plane->pipe->pipe,
> +				  INTEL_PIPE_CRC_SOURCE_AUTO);
> +
> +	output = igt_get_single_output_for_pipe(display, plane->pipe->pipe);
> +	igt_assert(output);
> +
> +	igt_output_set_pipe(output, plane->pipe->pipe);
> +	mode = igt_output_get_mode(output);
> +
> +	/* Create a framebuffer at the size of the output. */
> +	igt_assert(igt_create_fb(data->drm_fd,
> +			      mode->hdisplay,
> +			      mode->vdisplay,
> +			      DRM_FORMAT_XRGB8888,
> +			      DRM_FORMAT_MOD_LINEAR,
> +			      &fb));
> +	igt_plane_set_fb(plane, &fb);
> +
> +	/* Disable Pipe color props. */
> +	disable_ctm(plane->pipe);
> +	disable_degamma(plane->pipe);
> +	disable_gamma(plane->pipe);
> +
> +	disable_plane_ctm(plane);
> +	disable_plane_degamma(plane);
> +	igt_display_commit2(display, display->is_atomic ?
> +					COMMIT_ATOMIC : COMMIT_LEGACY);
> +
> +	gamma_mode = get_plane_gamma_degamma_mode(plane, IGT_PLANE_GAMMA_MODE);
> +
> +	/* Iterate all supported gamma modes. */
> +	for (i = 0; i < gamma_mode->count_enums; i++) {
> +		igt_crc_t crc_gamma, crc_fullcolors;
> +		segment_data_t *segment_info = NULL;
> +		struct drm_color_lut_ext *lut = NULL;
> +		uint32_t lut_size = 0;
> +
> +		/* Ignore 'no gamma' from enum list. */
> +		if (!strcmp(gamma_mode->enums[i].name, "no gamma"))
> +			continue;
> +

It might still make sense to test that this is doing bypass.

> +		igt_info("Trying to use gamma mode: \'%s\'\n", gamma_mode->enums[i].name);
> +
> +		/* Draw solid colors with no gamma transformation. */
> +		disable_plane_gamma(plane);
> +		paint_rectangles(data, mode, red_green_blue, &fb);
> +		igt_plane_set_fb(plane, &fb);
> +		igt_display_commit2(display, display->is_atomic ?
> +					COMMIT_ATOMIC : COMMIT_LEGACY);
> +		igt_wait_for_vblank(data->drm_fd,
> +			display->pipes[plane->pipe->pipe].crtc_offset);
> +		igt_pipe_crc_collect_crc(pipe_crc, &crc_fullcolors);
> +
> +		/* Draw gradient colors with gamma LUT to remap all
> +		 * values to max red/green/blue.
> +		 */
> +		segment_info = get_segment_data(data, gamma_mode->enums[i].value,
> +				gamma_mode->enums[i].name);
> +		lut_size = sizeof(struct drm_color_lut_ext) * segment_info->entries_count;
> +		lut = create_max_lut(segment_info);
> +		set_plane_gamma(plane, gamma_mode->enums[i].name, lut, lut_size);
> +
> +		paint_gradient_rectangles(data, mode, red_green_blue, &fb);
> +		igt_plane_set_fb(plane, &fb);
> +		igt_display_commit2(display, display->is_atomic ?
> +					COMMIT_ATOMIC : COMMIT_LEGACY);
> +		igt_wait_for_vblank(data->drm_fd,
> +			display->pipes[plane->pipe->pipe].crtc_offset);
> +		igt_pipe_crc_collect_crc(pipe_crc, &crc_gamma);
> +
> +		/* Verify that the CRC of the software computed output is
> +		 * equal to the CRC of the gamma LUT transformation output.
> +		 */
> +		ret &= igt_check_crc_equal(&crc_gamma, &crc_fullcolors);
> +
> +		free(lut);
> +		clear_segment_data(segment_info);
> +	}
> +
> +	disable_plane_gamma(plane);
> +	igt_plane_set_fb(plane, NULL);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit2(display, display->is_atomic ?
> +					COMMIT_ATOMIC : COMMIT_LEGACY);
> +
> +	igt_pipe_crc_free(pipe_crc);
> +	drmModeFreeProperty(gamma_mode);
> +
> +	return ret;
> +}
> +
>  static void
>  prep_pipe(data_t *data, enum pipe p)
>  {
> @@ -890,6 +1033,37 @@ run_invalid_tests_for_pipe(data_t *data, enum pipe p)
>  		invalid_ctm_matrix_sizes(data, p);
>  }
>  
> +static void run_plane_color_test(data_t *data, enum pipe pipe, test_t test)
> +{
> +	igt_plane_t *plane;
> +	int count = 0;
> +
> +	for_each_plane_on_pipe(&data->display, pipe, plane) {
> +		if (!is_valid_plane(plane))
> +			continue;
> +
> +		igt_assert(test(data, plane));
> +
> +		count++;
> +	}
> +
> +	igt_require_f(count, "No valid planes found.\n");
> +}
> +
> +static void run_tests_for_plane(data_t *data, enum pipe pipe)
> +{
> +	igt_fixture {
> +		igt_require_pipe(&data->display, pipe);
> +		igt_require_pipe_crc(data->drm_fd);
> +		igt_require(data->display.pipes[pipe].n_planes > 0);
> +		igt_display_require_output_on_pipe(&data->display, pipe);
> +	}
> +
> +	igt_describe("Compare maxed out plane gamma LUT and solid color linear LUT");

I can't seem to see the linear LUT test. This only seems to test
the max LUT.

Harry

> +	igt_subtest_f("pipe-%s-plane-gamma", kmstest_pipe_name(pipe))
> +		run_plane_color_test(data, pipe, plane_gamma_test);
> +}
> +
>  igt_main
>  {
>  	data_t data = {};
> @@ -910,6 +1084,9 @@ igt_main
>  
>  		igt_subtest_group
>  			run_invalid_tests_for_pipe(&data, pipe);
> +
> +		igt_subtest_group
> +			run_tests_for_plane(&data, pipe);
>  	}
>  
>  	igt_fixture {
> 

