Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD986C4DC7
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 15:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC6510E95C;
	Wed, 22 Mar 2023 14:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F9110E3AA
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 14:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679495573; x=1711031573;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VDh0pHYaGW9GmNf+woIRx5gMWL75BPjDRE9Z/NwInR4=;
 b=a8091iH9joOfcHFP1YGkyht3rxhS2gKIKc5cqpZNkBe51WSv54Iyed+R
 1rADsXkytyIR6bXkR0ugc6iCIA5vMtKp33ET3EHvj5gDvCkMJKWKcv00B
 LEm60lKTWHUMzQji3mMlb8gdj7K8hXih9zpNfX+Ai9VD0kXtXBxbreHUs
 HL5UHZ/6vkatyViFarNuSw3w+dumkvJAFUtw/TX2LflYUybAajRZA44u/
 OpEglqynD27c+tLo0SVC32Nl4KHyZWFPNcLDUNXrKwfquBV1mFnlv0Z8o
 uhD3ZxSib9nsFJaQH+mh2MtfBGAxiPNQaOg/wCyZM9gfpgdmk/z1nUQ/t Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="337950539"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="337950539"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 07:32:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="684332878"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="684332878"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga007.fm.intel.com with SMTP; 22 Mar 2023 07:32:38 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 22 Mar 2023 16:32:37 +0200
Date: Wed, 22 Mar 2023 16:32:37 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Subject: Re: [PATCH 4/5] drm/tests: Test drm_rect_rotate()
Message-ID: <ZBsRhcQifOj0hETj@intel.com>
References: <20230322140701.69852-1-arthurgrillo@riseup.net>
 <20230322140701.69852-5-arthurgrillo@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230322140701.69852-5-arthurgrillo@riseup.net>
X-Patchwork-Hint: comment
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
Cc: carlos.craveiro@usp.br, tales.aparecida@gmail.com, dlatypov@google.com,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, mairacanal@riseup.net,
 maxime@cerno.tech, andrealmeid@riseup.net, airled@gmail.com,
 matheus.vieira.g@usp.br
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 22, 2023 at 11:07:00AM -0300, Arthur Grillo wrote:
> Insert test for the drm_rect_rotate() function, create test cases
> for all the rotation modes.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  drivers/gpu/drm/tests/drm_rect_test.c | 74 +++++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
> index 0f7736073390..46139e796f3f 100644
> --- a/drivers/gpu/drm/tests/drm_rect_test.c
> +++ b/drivers/gpu/drm/tests/drm_rect_test.c
> @@ -8,6 +8,7 @@
>  #include <kunit/test.h>
>  
>  #include <drm/drm_rect.h>
> +#include <drm/drm_mode.h>
>  
>  #include <linux/errno.h>
>  
> @@ -333,6 +334,78 @@ static void drm_test_rect_calc_vscale_negative_args(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, scaling_factor, -EINVAL);
>  }
>  
> +struct drm_rect_rotate_case {
> +	const char *name;
> +	unsigned int rotation;
> +	struct drm_rect rect;
> +	int width, height;
> +	struct drm_rect expected;
> +};
> +
> +static const struct drm_rect_rotate_case drm_rect_rotate_cases[] = {
> +	{
> +		.name = "reflect x",
> +		.rotation = DRM_MODE_REFLECT_X,
> +		.rect = DRM_RECT_INIT(0, 0, 5, 5),
> +		.width = 0, .height = 0,

These zero width/height don't really make any sense.

> +		.expected = DRM_RECT_INIT(-5, 0, 5, 5),
> +	},
> +	{
> +		.name = "reflect y",
> +		.rotation = DRM_MODE_REFLECT_Y,
> +		.rect = DRM_RECT_INIT(0, 0, 5, 5),
> +		.width = 0, .height = 0,
> +		.expected = DRM_RECT_INIT(0, -5, 5, 5),
> +	},
> +	{
> +		.name = "rotate 0",
> +		.rotation = DRM_MODE_ROTATE_0,
> +		.rect = DRM_RECT_INIT(0, 0, 5, 5),
> +		.width = 0, .height = 0,
> +		.expected = DRM_RECT_INIT(0, 0, 5, 5),
> +	},
> +	{
> +		.name = "rotate 90",
> +		.rotation = DRM_MODE_ROTATE_90,
> +		.rect = DRM_RECT_INIT(0, 0, 5, 10),
> +		.width = 0, .height = 0,
> +		.expected = DRM_RECT_INIT(0, -5, 10, 5),
> +	},
> +	{
> +		.name = "rotate 180",
> +		.rotation = DRM_MODE_ROTATE_180,
> +		.rect = DRM_RECT_INIT(0, 0, 5, 10),
> +		.width = 0, .height = 0,
> +		.expected = DRM_RECT_INIT(-5, -10, 5, 10),
> +	},
> +	{
> +		.name = "rotate 270",
> +		.rotation = DRM_MODE_ROTATE_270,
> +		.rect = DRM_RECT_INIT(0, 0, 5, 10),
> +		.width = 0, .height = 0,
> +		.expected = DRM_RECT_INIT(-10, 0, 10, 5),
> +	},
> +};
> +
> +static void drm_rect_case_desc(const struct drm_rect_rotate_case *t, char *desc)
> +{
> +	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +KUNIT_ARRAY_PARAM(drm_rect_rotate, drm_rect_rotate_cases, drm_rect_case_desc);
> +
> +static void drm_test_rect_rotate(struct kunit *test)
> +{
> +	const struct drm_rect_rotate_case *params = test->param_value;
> +	struct drm_rect r;
> +
> +	memcpy(&r, &params->rect, sizeof(struct drm_rect));

r = params->rect;

> +
> +	drm_rect_rotate(&r, params->width, params->height, params->rotation);
> +
> +	drm_rect_compare(test, &r, &params->expected);
> +}
> +
>  static struct kunit_case drm_rect_tests[] = {
>  	KUNIT_CASE(drm_test_rect_clip_scaled_div_by_zero),
>  	KUNIT_CASE(drm_test_rect_clip_scaled_not_clipped),
> @@ -345,6 +418,7 @@ static struct kunit_case drm_rect_tests[] = {
>  	KUNIT_CASE(drm_test_rect_calc_vscale),
>  	KUNIT_CASE(drm_test_rect_calc_vscale_out_of_range),
>  	KUNIT_CASE(drm_test_rect_calc_vscale_negative_args),
> +	KUNIT_CASE_PARAM(drm_test_rect_rotate, drm_rect_rotate_gen_params),
>  	{ }
>  };
>  
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
