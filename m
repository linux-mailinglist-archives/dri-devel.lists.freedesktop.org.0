Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CA46C4DB1
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 15:30:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE8710E973;
	Wed, 22 Mar 2023 14:30:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3258F10E973
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 14:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679495422; x=1711031422;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Ur/OOnM04npjZKwYSpkBbvK6eRoeXWbojRQ3KO58N3A=;
 b=ZulkRUOb8qM46A4woEYinLHunNnGGecesB83+8kkQdSP04WQLT5VVt68
 cWoH/p2dczI9zkdG7BHHnGXI2v7bjiPbvy5UduDjxF2np5J7ve2OcGZbh
 /j0zJ16FEoOT+SRmTB7cpPWFJnNBSJPBprdFXz/4NJdsilD5x+UKen7UR
 atT97tBxLNMKxkYLSUZhJ8DiAcVQA1IafFCtk2dOUvLthiEITS70TXIwo
 oS4uUiXozmuZxwicKA61SUPTfRmRGWXwf0d6rnHg5WhNWD1LW0jiU26JS
 Dba3gi2qS3iLq5gLiTYjEXyPhlDOFyWMLilM2CtGcjoaAOG9JHgtiP18q g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="337949068"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="337949068"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 07:29:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="684330761"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="684330761"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga007.fm.intel.com with SMTP; 22 Mar 2023 07:29:24 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 22 Mar 2023 16:29:24 +0200
Date: Wed, 22 Mar 2023 16:29:24 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Subject: Re: [PATCH 2/5] drm/tests: Test drm_rect_calc_hscale()
Message-ID: <ZBsQxHJNFmuAbcUA@intel.com>
References: <20230322140701.69852-1-arthurgrillo@riseup.net>
 <20230322140701.69852-3-arthurgrillo@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230322140701.69852-3-arthurgrillo@riseup.net>
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

On Wed, Mar 22, 2023 at 11:06:58AM -0300, Arthur Grillo wrote:
> Insert test for the drm_rect_hscale() function, besides the test
> for the usual case it also test for the exceptions.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  drivers/gpu/drm/tests/drm_rect_test.c | 58 +++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
> index f700984f70a8..7e02393092fa 100644
> --- a/drivers/gpu/drm/tests/drm_rect_test.c
> +++ b/drivers/gpu/drm/tests/drm_rect_test.c
> @@ -9,6 +9,8 @@
>  
>  #include <drm/drm_rect.h>
>  
> +#include <linux/errno.h>
> +
>  static void drm_rect_compare(struct kunit *test, const struct drm_rect *r,
>  			     const struct drm_rect *expected)
>  {
> @@ -225,12 +227,68 @@ static void drm_test_rect_intersect(struct kunit *test)
>  	KUNIT_EXPECT_FALSE_MSG(test, visible, "Interserction should not be a visible rect");
>  }
>  
> +static void drm_test_rect_calc_hscale(struct kunit *test)
> +{
> +	struct drm_rect src, dst;
> +	int scaling_factor;
> +
> +	drm_rect_init(&src, 0, 0, 2, 0);

I think we have a few places in the code that make the assumption
that src uses .16 binary fixed point. Not many, but few.

> +	drm_rect_init(&dst, 0, 0, 1, 0);
> +
> +	scaling_factor =  drm_rect_calc_hscale(&src, &dst, INT_MIN, INT_MAX);

The negative min scale factor is nonsensical.

> +
> +	KUNIT_EXPECT_EQ(test, scaling_factor, 2);
> +}
> +
> +static void drm_test_rect_calc_hscale_out_of_range(struct kunit *test)
> +{
> +	struct drm_rect src, dst;
> +	int scaling_factor;
> +
> +	drm_rect_init(&src, 0, 0, 10, 0);
> +	drm_rect_init(&dst, 0, 0, 1, 0);
> +
> +	scaling_factor =  drm_rect_calc_hscale(&src, &dst, 3, 5);
> +
> +	KUNIT_EXPECT_EQ(test, scaling_factor, -ERANGE);
> +
> +	drm_rect_init(&src, 0, 0, 2, 0);
> +	drm_rect_init(&dst, 0, 0, 1, 0);
> +
> +	scaling_factor =  drm_rect_calc_hscale(&src, &dst, 3, 5);
> +
> +	KUNIT_EXPECT_EQ(test, scaling_factor, -ERANGE);
> +}
> +
> +static void drm_test_rect_calc_hscale_negative_args(struct kunit *test)
> +{
> +	struct drm_rect src, dst;
> +	int scaling_factor;
> +
> +	drm_rect_init(&src, 0, 0, -1, 0);
> +	drm_rect_init(&dst, 0, 0, 1, 0);
> +
> +	scaling_factor = drm_rect_calc_hscale(&src, &dst, INT_MIN, INT_MAX);
> +
> +	KUNIT_EXPECT_EQ(test, scaling_factor, -EINVAL);
> +
> +	drm_rect_init(&src, 0, 0, 1, 0);
> +	drm_rect_init(&dst, 0, 0, -1, 0);
> +
> +	scaling_factor = drm_rect_calc_hscale(&src, &dst, INT_MIN, INT_MAX);
> +
> +	KUNIT_EXPECT_EQ(test, scaling_factor, -EINVAL);
> +}
> +
>  static struct kunit_case drm_rect_tests[] = {
>  	KUNIT_CASE(drm_test_rect_clip_scaled_div_by_zero),
>  	KUNIT_CASE(drm_test_rect_clip_scaled_not_clipped),
>  	KUNIT_CASE(drm_test_rect_clip_scaled_clipped),
>  	KUNIT_CASE(drm_test_rect_clip_scaled_signed_vs_unsigned),
>  	KUNIT_CASE(drm_test_rect_intersect),
> +	KUNIT_CASE(drm_test_rect_calc_hscale),
> +	KUNIT_CASE(drm_test_rect_calc_hscale_out_of_range),
> +	KUNIT_CASE(drm_test_rect_calc_hscale_negative_args),
>  	{ }
>  };
>  
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
